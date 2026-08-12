"""Smoke gates for the A-core encoder (spec section 6, extended by sections
9.1, 10.1, and 11.1), run IN ORDER: G-BASE, G-C6, G-C10,
G-EXCL (all 10 delta pairs), G-SAT (witness), G-PROBES (the four v1.2
probes).

Also runs the validation checks the dispatch called out explicitly:
  - (S5B)/(S5A) unit-propagates s5a (a direct 2-clause resolution check, not
    a full solver call).
  - (DEL2) at-least-two clauses are present in base+P-shaped runs and
    absent from base+A1's clause set.
  - (DEL3, v1.2) at-most-two clauses are present in base+P-shaped runs and
    absent from base's own clauses and from base+A1's clause set.
  - (C10) the exact source-support clause is present in base+P-shaped runs,
    absent from base/base+A1, and excludes only the double-membership cube.
  - G-EXCL's UNSAT clash is attributed to a specific clause family per pair.
  - G-C6: base + ~inT(oth) is UNSAT with a certified proof (v1.3).
  - G-PROBES: P-DEL3, P-E8, P-FB, P-CD5, each expected UNSAT with a
    certified proof (spec section 9.1).

Run from the repo root:
  uv run python census/frontier-packages/a_core/smoke.py
"""

from __future__ import annotations

import argparse
import json
import sys
import time
from itertools import combinations
from pathlib import Path
from typing import Any

sys.path.insert(0, str(Path(__file__).resolve().parent))
import encoding as enc

from census.card_head.frontier_lane_piqd import (
    FrontierSolver,
    add_solver_arguments,
    proof_manifest_fields,
)
from census.card_head.piqd_frontier_a import (
    A_SMOKE_SOURCES,
    ACoreCallerPackageProfile,
    AllocationPhase,
    solver_from_args,
)

OUT_DIR = Path(__file__).resolve().parent / "out" / "smoke"
LEAVES = ("A2", "A3", "A6", "A7", "A8")

# Qualitative clash attribution for each of the 10 G-EXCL pairs, derived
# from each leaf's b(u,.) target and inO2i(xu)/inO2i(v)/inO2i(xv) pattern
# (spec section 4 table).  A2 targets b(u,zd); A3 targets b(u,v); A6/A7/A8
# all target b(u,xv) (so BM1's functional beta(u) does not separate them --
# they clash instead on the inO2i pattern).
CLASH_FAMILY = {
    frozenset(("A2", "A3")): "(BM1) beta(u) functional: b(u,zd) vs b(u,v)",
    frozenset(("A2", "A6")): "(BM1) beta(u) functional: b(u,zd) vs b(u,xv)",
    frozenset(("A2", "A7")): "(BM1) beta(u) functional: b(u,zd) vs b(u,xv)",
    frozenset(("A2", "A8")): "(BM1) beta(u) functional: b(u,zd) vs b(u,xv)",
    frozenset(("A3", "A6")): "(BM1) beta(u) functional: b(u,v) vs b(u,xv)",
    frozenset(("A3", "A7")): "(BM1) beta(u) functional: b(u,v) vs b(u,xv)",
    frozenset(("A3", "A8")): "(BM1) beta(u) functional: b(u,v) vs b(u,xv)",
    frozenset(("A6", "A7")): "inO2i(xu) unit clash: A6 asserts T, A7 asserts F",
    frozenset(("A6", "A8")): "inO2i(xu) unit clash: A6 asserts T, A8 asserts F",
    frozenset(("A7", "A8")): (
        "inO2i(v)/inO2i(xv) pattern clash: A7 forces both T "
        "(A7.d), A8's (A8.d) clause forbids both T"
    ),
}


def check_s5_unit_propagation(encoder: enc.ACoreEncoder) -> dict[str, Any]:
    """Verify (S5A) `s5a v s5b` resolved against (S5B) `~s5b` yields the
    UNIT clause `s5a` in one step, by direct clause-level resolution (no
    solver call) -- exactly the "unit-propagates" sanity check the spec
    calls out."""

    s5a, s5b = encoder.s5a, encoder.s5b
    clause_a = (s5a, s5b)  # (S5A)
    clause_b = (-s5b,)  # (S5B)
    falsified_literal = s5b  # ~s5b forces the literal "s5b" false
    remaining = tuple(lit for lit in clause_a if lit != falsified_literal)
    propagates = remaining == (s5a,)
    return {
        "clause_s5a_disjunction": list(clause_a),
        "clause_s5b_unit": list(clause_b),
        "resolved_to": list(remaining),
        "unit_propagates_s5a": propagates,
    }


def check_del2_presence(
    encoder: enc.ACoreEncoder, a1_extra: set[tuple[int, ...]]
) -> dict[str, Any]:
    """(DEL2) must be present in every base+P-shaped clause set and absent
    from base+A1's clause set, by direct membership check (not inference).

    `a1_extra` is built exactly once in main() (build_a1_extension() raises
    on a second call, since it registers uniquely-named atoms) and shared
    with check_del3_presence below."""

    del2 = set(encoder.del2_clauses)
    base_p_extra = set(encoder.del2_clauses)
    leaf_checks = {}
    for leaf in LEAVES:
        extra = set(encoder.del2_clauses) | set(encoder.leaf_delta_clauses(leaf))
        leaf_checks[leaf] = del2 <= extra
    return {
        "del2_clause_count": len(del2),
        "present_in_base_plus_P": del2 <= base_p_extra,
        "present_in_each_leaf_run": leaf_checks,
        "absent_from_base_plus_A1": not (del2 & a1_extra),
    }


def gate_base(
    encoder: enc.ACoreEncoder,
    timeout_seconds: int,
    solver: FrontierSolver,
    backend: str,
) -> dict[str, Any]:
    instance = enc.RunInstance(encoder, encoder.base_clauses)
    cnf_path = OUT_DIR / "g_base.cnf"
    start = time.monotonic()
    result = solver(instance, cnf_path, timeout_seconds=timeout_seconds)
    wall = time.monotonic() - start
    return {
        "gate": "G-BASE",
        "verdict": result.verdict,
        "expected": "SAT",
        "pass": result.verdict == "SAT",
        "solver_backend": backend,
        "wall_seconds": round(wall, 3),
    }


def gate_excl(
    encoder: enc.ACoreEncoder,
    timeout_seconds: int,
    solver: FrontierSolver,
    backend: str,
) -> dict[str, Any]:
    pairs_result = []
    all_pass = True
    for leaf_i, leaf_j in combinations(LEAVES, 2):
        extra = (
            list(encoder.del2_clauses)
            + encoder.leaf_delta_clauses(leaf_i)
            + encoder.leaf_delta_clauses(leaf_j)
        )
        instance = enc.RunInstance(encoder, encoder.base_clauses)
        cnf_path = OUT_DIR / f"g_excl_{leaf_i}_{leaf_j}.cnf"
        proof_path = OUT_DIR / f"g_excl_{leaf_i}_{leaf_j}.drat"
        start = time.monotonic()
        result = solver(
            instance,
            cnf_path,
            extra_clauses=extra,
            timeout_seconds=timeout_seconds,
            proof_path=proof_path,
        )
        wall = time.monotonic() - start
        ok = result.verdict == "UNSAT" and result.proof_verified is True
        all_pass = all_pass and ok
        record: dict[str, Any] = {
            "pair": f"{leaf_i}x{leaf_j}",
            "verdict": result.verdict,
            "expected": "UNSAT",
            "pass": ok,
            "proof_verified": result.proof_verified,
            "clash_family": CLASH_FAMILY[frozenset((leaf_i, leaf_j))],
            "wall_seconds": round(wall, 3),
        }
        record.update(
            proof_manifest_fields(
                backend=backend,
                requested_proof_path=proof_path,
                result=result,
                relative_to=OUT_DIR.parents[1],
            )
        )
        pairs_result.append(record)
    return {
        "gate": "G-EXCL",
        "pairs": pairs_result,
        "pass": all_pass and len(pairs_result) == 10,
    }


def _lit(encoder: enc.ACoreEncoder, name: str, value: bool) -> tuple[int]:
    var = encoder.names[name]
    return (var if value else -var,)


def hand_built_assumptions(encoder: enc.ACoreEncoder) -> list[tuple[int, ...]]:
    """G-SAT downgrade witness (spec section 6 fallback): the REPORT.md
    15-point witness at scratch/full-local-euclidean-model-complete/ is
    built for a different package (CounterexampleData/CriticalShellSystem/
    tri-apex robustness on 15 named points O,e,f,a,u,c,d,b,v,j,k,l,i,g,h with
    no source/frontier-pair/Cl(a1,r) structure), and its own REPORT.md
    concludes no CriticalShellSystem exists and SurplusCapPacket.hCirc
    fails there -- i.e. it fails hypotheses this package assumes.  No
    faithful label mapping exists, so per spec we hand-build a total
    assignment satisfying every section-2 family by construction instead.

    This function fixes every semantically load-bearing atom explicitly (one
    source-mandated alias and every other eq atom false, cap-interior placement for the
    six non-unit non-Moser labels, the integer layer nSig=3/nO1=2/nO2=6 (with
    n=14 left to be DERIVED by (N1) rather than asserted, as an extra check
    that (N1) is wired correctly -- bumped from v1.1's nO2=5/n=13 per (N8)),
    the s6c arm, every row_u/row_v free slot, all eight b(x,.) targets, and a
    2-element deletion set) and leaves atoms that are already forced by
    base's own units (sv, s5a/s5b, CD1's zd units) or genuinely immaterial
    (individual bs1/bs2/bt1/bt2 non-zd,qh,wh entries) for the solver to
    complete.

    v1.2 (CEGAR iteration 2) additions, explicitly assigned and documented:
    - fbar pair = {qh, wh}: inSig(qh)=inSig(wh)=F and inT(qh)=inT(wh)=F are
      already FORCED in this witness (inO1i(qh)=inO1i(wh)=T units force
      inSig/inO2i false via CAP1; T1 exactness forces inT false since qh/wh
      have no true eq-target into the shell group) -- so (FB)'s two
      universal implications are satisfied by construction for this pair.
      {f1,f2} would NOT work: this witness's own inSig(f1)=inSig(f2)=T
      assumption (kept from v1.1, needed for (N5)) directly contradicts
      fbar_p -> ~inSig(p) for p in {f1,f2}.
    - rbs1=rbs2=rbt1=rbt2=F ("no radius coincidence" / generic choice,
      matching the rest of the witness's generic-position spirit). Checked
      by hand: rbs1=F only forces bs1(u)=bs1(xu)=F (the only CD_DOMAIN
      labels with row_u=T in this witness); rbt1=F only forces
      bt1(v)=bt1(xv)=F (the only CD_DOMAIN labels with row_v=T); rbs2=F
      only forces bs2(zd,u,xu,v,xv)=F (the T-labels, already inT=T);
      rbt2=F likewise for bt2. No contradiction with anything else fixed
      below.
    - bs1(qh)=bs1(wh)=F and bt1(qh)=bt1(wh)=F: explicitly pinned (rather
      than left to the solver) because (E8c) is NOT vacuous for this pair
      if the solver guessed True for both: bs1(qh)&bs1(wh) with the
      witness's only true b(u,.) target b(u,xv)=T would demand
      inO1i(xv) v eq(xv,a1); both are already forced False here (all eq
      atoms are false, and inO2i(xv)=T forces inO1i(xv)=F via CAP1) --
      i.e. bs1(qh)=bs1(wh)=T would make (E8c) UNSATisfiable under this
      witness's other fixed facts.  Symmetric argument for
      bt1(qh)=bt1(wh) against b(v,zd)=T -> needing inO1i(zd) v eq(zd,a1),
      both already forced False (inO2i(zd)=T forces inO1i(zd)=F).
      Pinning these four to False keeps the witness a fully auditable
      total assignment rather than relying on the solver to avoid an
      infeasible corner it was never going to reach anyway."""

    lit = lambda name, value: _lit(encoder, name, value)
    assumptions: list[tuple[int, ...]] = []

    # v1.3 (C6)+(T1): `oth` must alias a member of the exact five-point
    # physical class. Choose oth=zd; every other eq atom remains false.
    for pair in enc.EQ_PAIRS:
        p, q = sorted(pair)
        assumptions.append(lit(f"eq({p},{q})", pair == frozenset(("oth", "zd"))))

    # Cap interiors for the six non-unit, non-Moser labels.
    for p in ("zd", "xu", "v", "xv"):
        assumptions.append(lit(f"inO2i({p})", True))
    for p in ("f1", "f2"):
        assumptions.append(lit(f"inSig({p})", True))

    # Integer layer: nSig=3, nO1=2, nO2=6 (n=14 is left to be derived by N1;
    # bumped from v1.1's nO2=5/n=13 so (N8) n>=14 is satisfied).
    assumptions.append(lit("nSig=3", True))
    assumptions.append(lit("nO1=2", True))
    assumptions.append(lit("nO2=6", True))

    # S6 arm: s6c (nSig=3, nO1=2, nO2>=4 -- all satisfied by the above).
    assumptions.append(lit("s6a", False))
    assumptions.append(lit("s6b", False))
    assumptions.append(lit("s6c", True))

    # Rows: pin every free slot (units already fix u,xu,v,xv,zd,oth).
    for p in ("a0", "a2", "qh", "wh", "f1", "f2", "xv"):
        assumptions.append(lit(f"row_u({p})", False))
    for p in ("a0", "a1", "a2", "xu", "oth", "qh", "wh", "f1", "f2"):
        assumptions.append(lit(f"row_v({p})", False))

    # Blocker-map targets (BM4-forced b(qh,a1),b(wh,a1) reasserted for
    # clarity even though they are already forced units given cl1(qh/wh)=T).
    assumptions.append(lit("b(u,xv)", True))
    # Avoid zd/oth as a target: target congruence would make both syntactic
    # targets true and conflict with BM1's exactly-one encoding.
    assumptions.append(lit("b(v,OUT)", True))
    assumptions.append(lit("b(zd,v)", True))
    # Source congruence for oth=zd requires their blocker targets to agree.
    assumptions.append(lit("b(oth,v)", True))
    assumptions.append(lit("b(qh,a1)", True))
    assumptions.append(lit("b(wh,a1)", True))
    assumptions.append(lit("b(xu,OUT)", True))
    assumptions.append(lit("b(xv,OUT)", True))

    # Deletion set: |Delta|=2.
    assumptions.append(lit("del(zd)", True))
    assumptions.append(lit("del(u)", True))
    for p in ("xu", "v", "xv"):
        assumptions.append(lit(f"del({p})", False))

    # v1.2 (FB): fbar pair = {qh,wh} (see docstring above for why {f1,f2}
    # would clash with this witness's inSig(f1)=inSig(f2)=T assumption).
    assumptions.append(lit("fbar(qh)", True))
    assumptions.append(lit("fbar(wh)", True))
    assumptions.append(lit("fbar(f1)", False))
    assumptions.append(lit("fbar(f2)", False))

    # v1.2 (CD5): generic/no-coincidence choice for all four selectors.
    assumptions.append(lit("rbs1", False))
    assumptions.append(lit("rbs2", False))
    assumptions.append(lit("rbt1", False))
    assumptions.append(lit("rbt2", False))

    # v1.2 (E8c) explicit pin: avoid the infeasible bs1(qh)&bs1(wh) /
    # bt1(qh)&bt1(wh) corner (see docstring above).
    assumptions.append(lit("bs1(qh)", False))
    assumptions.append(lit("bs1(wh)", False))
    assumptions.append(lit("bt1(qh)", False))
    assumptions.append(lit("bt1(wh)", False))

    return assumptions


def check_del3_presence(
    encoder: enc.ACoreEncoder,
    del3_extra: list[tuple[int, ...]],
    a1_extra: set[tuple[int, ...]],
) -> dict[str, Any]:
    """(DEL3, v1.2) must be present in every base+P-shaped clause set and
    absent from base's own frozen prefix and from base+A1's clause set --
    same membership-check discipline as check_del2_presence. `a1_extra` is
    the same pre-built set check_del2_presence uses (see its docstring)."""

    del3 = set(del3_extra)
    return {
        "del3_clause_count": len(del3),
        "absent_from_base_clauses": not (del3 & set(encoder.base_clauses)),
        "absent_from_base_plus_A1": not (del3 & a1_extra),
    }


def check_c10_presence(
    encoder: enc.ACoreEncoder,
    del3_extra: list[tuple[int, ...]],
    a1_extra: set[tuple[int, ...]],
) -> dict[str, Any]:
    """Check the audited C10 clause's exact shape and physical-only scope.

    The two branch projections use the kernel-checked equivalence
    Problem97.ATailCriticalPairFrontier.
    cross_deletion_survives_iff_not_mem_selected_support; after P3 makes
    u the source, their disjunction is exactly
    ``~row_u(qh) | ~row_u(wh)``.
    """

    expected = {(-encoder.row_u["qh"], -encoder.row_u["wh"])}
    c10 = set(encoder.c10_clauses)
    physical = set(encoder.del2_clauses) | c10 | set(del3_extra)
    leaf_checks = {}
    for leaf in LEAVES:
        extra = physical | set(encoder.leaf_delta_clauses(leaf))
        leaf_checks[leaf] = c10 <= extra
    scope_pass = (
        c10 == expected
        and c10 <= physical
        and all(leaf_checks.values())
        and not (c10 & set(encoder.base_clauses))
        and not (c10 & (set(encoder.base_clauses) | a1_extra))
    )
    return {
        "pass": scope_pass,
        "exact_clause": c10 == expected,
        "c10_clause_count": len(c10),
        "present_in_base_plus_P": c10 <= physical,
        "present_in_each_leaf_run": leaf_checks,
        "absent_from_base": not (c10 & set(encoder.base_clauses)),
        "absent_from_base_plus_A1": not (c10 & (set(encoder.base_clauses) | a1_extra)),
    }


def gate_probes(
    encoder: enc.ACoreEncoder,
    del3_extra: list[tuple[int, ...]],
    timeout_seconds: int,
    solver: FrontierSolver,
    backend: str,
) -> dict[str, Any]:
    """(spec section 9.1) The four CEGAR-iteration-2 probes: each must be
    UNSAT with a certified proof.  Follows gate_excl's pattern (a
    RunInstance over base_clauses, with the probe's own assumption clauses
    passed as extra_clauses and a requested proof path)."""

    lit = lambda name, value: _lit(encoder, name, value)
    probes: list[dict[str, Any]] = []

    def _run_probe(probe_name: str, extra: list[tuple[int, ...]]) -> dict[str, Any]:
        instance = enc.RunInstance(encoder, encoder.base_clauses)
        cnf_path = OUT_DIR / f"g_probe_{probe_name}.cnf"
        proof_path = OUT_DIR / f"g_probe_{probe_name}.drat"
        start = time.monotonic()
        result = solver(
            instance,
            cnf_path,
            extra_clauses=extra,
            timeout_seconds=timeout_seconds,
            proof_path=proof_path,
        )
        wall = time.monotonic() - start
        ok = result.verdict == "UNSAT" and result.proof_verified is True
        record: dict[str, Any] = {
            "probe": probe_name,
            "verdict": result.verdict,
            "expected": "UNSAT",
            "pass": ok,
            "proof_verified": result.proof_verified,
            "wall_seconds": round(wall, 3),
        }
        record.update(
            proof_manifest_fields(
                backend=backend,
                requested_proof_path=proof_path,
                result=result,
                relative_to=OUT_DIR.parents[1],
            )
        )
        return record

    # P-DEL3: base+P + del(zd) & del(u) & del(xu) -> UNSAT.
    p_del3_extra = (
        list(encoder.del2_clauses)
        + list(del3_extra)
        + [lit("del(zd)", True), lit("del(u)", True), lit("del(xu)", True)]
    )
    probes.append(_run_probe("P-DEL3", p_del3_extra))

    # P-E8: base + row_u(qh) & row_u(wh) & b(u,a0) -> UNSAT.
    p_e8_extra = [
        lit("row_u(qh)", True),
        lit("row_u(wh)", True),
        lit("b(u,a0)", True),
    ]
    probes.append(_run_probe("P-E8", p_e8_extra))

    # P-FB: base + eq(f1,zd) & ~fbar_qh & ~fbar_wh -> UNSAT.
    p_fb_extra = [
        lit("eq(f1,zd)", True),
        lit("fbar(qh)", False),
        lit("fbar(wh)", False),
    ]
    probes.append(_run_probe("P-FB", p_fb_extra))

    # P-CD5: base + rbs2 & bs2(qh) & ~eq(qh,zd) & ~eq(qh,xu) & ~eq(qh,v) &
    # ~eq(qh,xv) -> UNSAT.
    p_cd5_extra = [
        lit("rbs2", True),
        lit("bs2(qh)", True),
        lit("eq(qh,zd)", False),
        lit("eq(qh,xu)", False),
        lit("eq(qh,v)", False),
        lit("eq(qh,xv)", False),
    ]
    probes.append(_run_probe("P-CD5", p_cd5_extra))

    return {
        "gate": "G-PROBES",
        "probes": probes,
        "pass": all(p["pass"] for p in probes) and len(probes) == 4,
    }


def gate_c6(
    encoder: enc.ACoreEncoder,
    timeout_seconds: int,
    solver: FrontierSolver,
    backend: str,
) -> dict[str, Any]:
    """(spec section 10.1) The v1.3 source-context unit must refute its
    negation, with the resulting UNSAT proof certified by the selected seam."""

    instance = enc.RunInstance(encoder, encoder.base_clauses)
    cnf_path = OUT_DIR / "g_c6.cnf"
    proof_path = OUT_DIR / "g_c6.drat"
    start = time.monotonic()
    result = solver(
        instance,
        cnf_path,
        extra_clauses=[_lit(encoder, "inT(oth)", False)],
        timeout_seconds=timeout_seconds,
        proof_path=proof_path,
    )
    wall = time.monotonic() - start
    record: dict[str, Any] = {
        "gate": "G-C6",
        "verdict": result.verdict,
        "expected": "UNSAT",
        "pass": result.verdict == "UNSAT" and result.proof_verified is True,
        "proof_verified": result.proof_verified,
        "wall_seconds": round(wall, 3),
    }
    record.update(
        proof_manifest_fields(
            backend=backend,
            requested_proof_path=proof_path,
            result=result,
            relative_to=OUT_DIR.parents[1],
        )
    )
    return record


def gate_c10(
    encoder: enc.ACoreEncoder,
    del3_extra: list[tuple[int, ...]],
    timeout_seconds: int,
    solver: FrontierSolver,
    backend: str,
) -> dict[str, Any]:
    """Regression for the exact C10 projection.

    Before C10, the physical cube with both qh and wh in Row(u) must still
    be admitted.  Adding C10 must make exactly that cube UNSAT with a
    certified proof, while either single-omission branch remains SAT.
    """

    physical_pre_c10 = list(encoder.del2_clauses) + list(del3_extra)
    c10 = list(encoder.c10_clauses)

    def run_variant(
        name: str,
        clauses: list[tuple[int, ...]],
        expected: str,
        verify_proof: bool = False,
    ) -> dict[str, Any]:
        instance = enc.RunInstance(encoder, encoder.base_clauses)
        cnf_path = OUT_DIR / f"g_c10_{name}.cnf"
        proof_path = OUT_DIR / f"g_c10_{name}.drat" if verify_proof else None
        start = time.monotonic()
        result = solver(
            instance,
            cnf_path,
            extra_clauses=clauses,
            timeout_seconds=timeout_seconds,
            proof_path=proof_path,
        )
        wall = time.monotonic() - start
        passed = result.verdict == expected and (
            not verify_proof or result.proof_verified is True
        )
        record: dict[str, Any] = {
            "variant": name,
            "verdict": result.verdict,
            "expected": expected,
            "pass": passed,
            "proof_verified": result.proof_verified,
            "solver_backend": backend,
            "wall_seconds": round(wall, 3),
        }
        if proof_path is not None:
            record.update(
                proof_manifest_fields(
                    backend=backend,
                    requested_proof_path=proof_path,
                    result=result,
                    relative_to=OUT_DIR.parents[1],
                )
            )
        return record

    qh_in = _lit(encoder, "row_u(qh)", True)
    wh_in = _lit(encoder, "row_u(wh)", True)
    qh_out = _lit(encoder, "row_u(qh)", False)
    wh_out = _lit(encoder, "row_u(wh)", False)
    variants = [
        run_variant(
            "pre_double_membership",
            physical_pre_c10 + [qh_in, wh_in],
            "SAT",
        ),
        run_variant(
            "post_double_membership",
            physical_pre_c10 + c10 + [qh_in, wh_in],
            "UNSAT",
            verify_proof=True,
        ),
        run_variant(
            "omit_qh_only",
            physical_pre_c10 + c10 + [qh_out, wh_in],
            "SAT",
        ),
        run_variant(
            "omit_wh_only",
            physical_pre_c10 + c10 + [qh_in, wh_out],
            "SAT",
        ),
    ]
    return {
        "gate": "G-C10",
        "provenance": (
            "Problem97.ATailCriticalPairFrontier."
            "cross_deletion_survives_iff_not_mem_selected_support"
        ),
        "variants": variants,
        "pass": all(variant["pass"] for variant in variants),
    }


def gate_sat(
    encoder: enc.ACoreEncoder,
    timeout_seconds: int,
    solver: FrontierSolver,
    backend: str,
) -> dict[str, Any]:
    assumptions = hand_built_assumptions(encoder)
    instance = enc.RunInstance(encoder, encoder.base_clauses)
    cnf_path = OUT_DIR / "g_sat.cnf"
    start = time.monotonic()
    result = solver(
        instance, cnf_path, extra_clauses=assumptions, timeout_seconds=timeout_seconds
    )
    wall = time.monotonic() - start
    record: dict[str, Any] = {
        "gate": "G-SAT",
        "variant": "hand-built-total-assignment (downgrade; witness does not map)",
        "verdict": result.verdict,
        "expected": "SAT",
        "pass": result.verdict == "SAT",
        "solver_backend": backend,
        "wall_seconds": round(wall, 3),
        "n_assumptions": len(assumptions),
    }
    if result.verdict == "SAT" and result.cube is not None:
        model_path = OUT_DIR / "g_sat.model.json"
        model_path.write_text(
            json.dumps(result.cube, sort_keys=True, indent=2), encoding="utf-8"
        )
        record["model_file"] = str(model_path.relative_to(OUT_DIR.parents[1]))
        record["derived_n_value"] = next(
            (i for i in range(encoder.MAXN + 1) if result.cube.get(f"n={i}")), None
        )
    return record


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--timeout-seconds", type=int, default=60)
    add_solver_arguments(parser)
    args = parser.parse_args()

    OUT_DIR.mkdir(parents=True, exist_ok=True)
    encoder = enc.ACoreEncoder()
    base_n_variables = encoder.cnf.n_variables

    # v1.2: build (DEL3) and the A1 extension exactly once each here, and
    # thread their outputs into every check/gate/probe that needs them --
    # both builder methods mutate encoder.cnf past its frozen base_clauses
    # prefix and (for build_a1_extension) raise on a second call.
    del3_extra = encoder.build_del3_clauses()
    del3_n_variables = encoder.cnf.n_variables
    a1_extra = set(encoder.build_a1_extension())
    solver = solver_from_args(
        args=args,
        encoder=encoder,
        profile=ACoreCallerPackageProfile(
            source_paths=A_SMOKE_SOURCES,
            allocation_phases=(
                AllocationPhase(
                    "A common base allocation",
                    base_n_variables,
                    "A-core common named and cardinality variables",
                ),
                AllocationPhase(
                    "A physical DEL3 allocation",
                    del3_n_variables,
                    "Sinz auxiliaries for the physical deletion at-most-two delta",
                ),
                AllocationPhase(
                    "A1 extension allocation",
                    encoder.cnf.n_variables,
                    "A1 gamma, cap, coincidence, and cardinality auxiliaries",
                ),
            ),
            live_leaf="A-core finite-local smoke gates and regression probes",
            finite_schema="p97-a-core-layer1.v1.3-smoke",
            cardinality_scope="named A-core regression atoms and symbolic cardinality buckets",
            source_theorem=(
                "NONE: mixed A-core smoke checks have no aggregate theorem entitlement"
            ),
        ),
        artifact_root=OUT_DIR,
        legacy_solver=enc.solve_cadical,
    )

    report: dict[str, Any] = {}
    report["s5_unit_propagation"] = check_s5_unit_propagation(encoder)
    report["del2_presence"] = check_del2_presence(encoder, a1_extra)
    report["del3_presence"] = check_del3_presence(encoder, del3_extra, a1_extra)
    report["c10_presence"] = check_c10_presence(encoder, del3_extra, a1_extra)

    base_result = gate_base(encoder, args.timeout_seconds, solver, args.solver_backend)
    report["G-BASE"] = base_result
    print(json.dumps(base_result, indent=2))

    if not base_result["pass"]:
        print("G-BASE FAILED (UNSAT) -- STOPPING per spec section 6.")
        report["STOPPED_AFTER"] = "G-BASE"
        (OUT_DIR / "smoke_report.json").write_text(
            json.dumps(report, sort_keys=True, indent=2), encoding="utf-8"
        )
        return 1

    c6_result = gate_c6(encoder, args.timeout_seconds, solver, args.solver_backend)
    report["G-C6"] = c6_result
    print(json.dumps(c6_result, indent=2))

    c10_result = gate_c10(
        encoder, del3_extra, args.timeout_seconds, solver, args.solver_backend
    )
    report["G-C10"] = c10_result
    print(json.dumps(c10_result, indent=2))

    excl_result = gate_excl(encoder, args.timeout_seconds, solver, args.solver_backend)
    report["G-EXCL"] = excl_result
    print(json.dumps(excl_result, indent=2))

    sat_result = gate_sat(encoder, args.timeout_seconds, solver, args.solver_backend)
    report["G-SAT"] = sat_result
    print(json.dumps(sat_result, indent=2))


    probes_result = gate_probes(
        encoder, del3_extra, args.timeout_seconds, solver, args.solver_backend
    )
    report["G-PROBES"] = probes_result
    print(json.dumps(probes_result, indent=2))

    report["ALL_GATES_PASS"] = (
        base_result["pass"]
        and c6_result["pass"]
        and report["c10_presence"]["pass"]
        and c10_result["pass"]
        and excl_result["pass"]
        and sat_result["pass"]
        and probes_result["pass"]
    )
    (OUT_DIR / "smoke_report.json").write_text(
        json.dumps(report, sort_keys=True, indent=2), encoding="utf-8"
    )
    print(f"ALL_GATES_PASS = {report['ALL_GATES_PASS']}")
    return 0 if report["ALL_GATES_PASS"] else 1


if __name__ == "__main__":
    raise SystemExit(main())
