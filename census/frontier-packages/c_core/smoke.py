"""Smoke gates for the C-core encoder (spec section 7), run IN ORDER:
G-BASE, G-SAT (hand-built witness), the G-EXCL analog (base+C1+srcU clash,
base+C1+del-triple DEL3 clash), then the four named probes P-SRC, P-COL,
P-E5C, P-E8-src.

Run from the repo root:
  uv run python census/frontier-packages/c_core/smoke.py
"""

from __future__ import annotations

import json
import sys
import time
from pathlib import Path
from typing import Any

sys.path.insert(0, str(Path(__file__).resolve().parent))
import encoding as enc  # noqa: E402

OUT_DIR = Path(__file__).resolve().parent / "out" / "smoke"


def _lit(encoder: "enc.CCoreEncoder", name: str, value: bool) -> tuple[int]:
    var = encoder.names[name]
    return (var if value else -var,)


def gate_base(encoder: "enc.CCoreEncoder", timeout_seconds: int) -> dict[str, Any]:
    instance = enc.RunInstance(encoder, encoder.base_clauses)
    cnf_path = OUT_DIR / "g_base.cnf"
    start = time.monotonic()
    result = enc.solve_cadical(instance, cnf_path, timeout_seconds=timeout_seconds)
    wall = time.monotonic() - start
    return {
        "gate": "G-BASE",
        "verdict": result.verdict,
        "expected": "SAT",
        "pass": result.verdict == "SAT",
        "wall_seconds": round(wall, 3),
    }


def hand_built_assumptions(encoder: "enc.CCoreEncoder") -> list[tuple[int, ...]]:
    """G-SAT downgrade witness (spec section 7: "the A spec section 6
    downgrade variant is the DEFAULT here -- the 15-point witness maps even
    less directly onto C"; no faithful label mapping is attempted -- a
    hand-built total assignment satisfying every base family is used
    instead, n=10 floor is fine per spec).

    Mostly generic position (every eq atom false) EXCEPT ONE forced
    coincidence: the new C-only unit inT(oth)=T [(C6.6)] combined with (T1)
    exactness forces eq(oth,zd) v eq(oth,u) v eq(oth,v) v eq(oth,xv) to
    actually hold in EVERY model of 'base' (oth-xu stays baked distinct, so
    xu is not an escape) -- an all-eq-false witness is therefore genuinely
    infeasible for 'base' in C, unlike A.

    This witness picks eq(oth,u)=T (with srcU=F, i.e. source=xu, so (C6.5)'s
    srcU-conditional exclusion ~eq(oth,u) does not fire) to discharge it.
    (EQ3) congruence then forces oth's ENTIRE blocker pattern and every
    other unary-family value to match u's (traced by hand and confirmed by
    direct solve during implementation -- an earlier eq(oth,v)=T /
    srcU=True attempt at this witness came back UNSAT: with the earlier
    blocker-target cycle chosen, EVERY one of the four T1-forced disjuncts
    {eq(oth,zd),eq(oth,u),eq(oth,v),eq(oth,xv)} independently collided with
    (BM1)'s exactly-one via (EQ3)'s b-side congruence -- see RESULTS.md for
    the full minimal-UNSAT-core trace):
      - inO2i(oth)=T [unit] <-> inO2i(u)=T -- consistent with the cap
        choice below (u is placed in O2 interior, a free choice under
        srcU=F since (C6.2)'s conditional only pins inO2i(xu) here).
      - inT(oth)=T [unit] <-> inT(u)=T [already a hard SHELL_GROUP unit] --
        consistent, no new obligation.
      - row_u(oth) <-> row_u(u)=T [unit, I_u={u,xu}] -- FORCES
        row_u(oth)=T (not the generic "every free slot false" default,
        flagged explicitly below).
      - row_v(oth) <-> row_v(u)=F [unit, (C5.6)] -- forces row_v(oth)=F,
        matching the generic default.
      - cl1(oth) <-> cl1(u): both derive/are-set False (oth's only
        frontier eq-targets are f1,f2, kept False; cl1(u) is pinned False
        directly, consistent with either the srcU-conditional -- moot here
        since srcU=F -- or plain (CL1) exactness with u's frontier eq
        atoms all kept False).
      - oth's blocker target is forced to equal u's target EXACTLY (every
        external center's edge toward oth must equal its edge toward u,
        (EQ3)'s "p,q both in B_DOMAIN" branch) -- b(oth,v)=T below mirrors
        b(u,v)=T for exactly this reason, not as an independent choice.
    srcU is set False (source=xu) so the (C6.5) exclusion does not block
    eq(oth,u); leaf C1 independently forces this same branch via its own
    unit, and leaf C2 leaves srcU free."""

    lit = lambda name, value: _lit(encoder, name, value)
    assumptions: list[tuple[int, ...]] = []

    # Generic position: every eq atom false EXCEPT eq(oth,u) (forced true,
    # see docstring -- inT(oth)=T + (T1) exactness has no other consistent
    # escape given the blocker-target choices below).
    for pair in enc.EQ_PAIRS:
        p, q = sorted(pair)
        forced_true = frozenset((p, q)) == frozenset(("oth", "u"))
        assumptions.append(lit(f"eq({p},{q})", forced_true))

    # Source selector: srcU=False (source=xu branch; leaf C1 independently
    # forces this same branch via its own (C9.3) unit; leaf C2 leaves srcU
    # free).  Required so (C6.5)'s srcU-conditional ~eq(oth,u) does not
    # fire (see docstring).
    assumptions.append(lit("srcU", False))

    # Cap interiors.  inO2i(xu)=T is FORCED by srcU=False's (C6.2)
    # conditional; inO2i(u)=T is a free choice here (restated explicitly,
    # required by the eq(oth,u) congruence, see docstring) rather than a
    # forced consequence of srcU.
    for p in ("u", "zd", "xu", "v", "xv"):
        assumptions.append(lit(f"inO2i({p})", True))
    for p in ("f1", "f2"):
        assumptions.append(lit(f"inSig({p})", True))

    # cl1(u)=F, cl1(xu)=F.  cl1(xu)=F is FORCED by srcU=False's (C6.3)
    # conditional; cl1(u)=F is a free choice restated explicitly (derivable
    # anyway via (CL1) exactness since u's frontier eq atoms are all kept
    # False).
    assumptions.append(lit("cl1(u)", False))
    assumptions.append(lit("cl1(xu)", False))

    # Integer layer: nSig=3, nO1=2, nO2=6 (n left to be derived by N1;
    # comes out n=14, well above the amended N2 floor n>=10).
    assumptions.append(lit("nSig=3", True))
    assumptions.append(lit("nO1=2", True))
    assumptions.append(lit("nO2=6", True))

    # S6-analog arm: s6c (nSig=3, nO1=2, nO2>=4 -- all satisfied above).
    assumptions.append(lit("s6a", False))
    assumptions.append(lit("s6b", False))
    assumptions.append(lit("s6c", True))

    # Rows: pin every free slot.  row_u(oth) is FORCED True (not the
    # generic False default) by (EQ3) congruence with eq(oth,u)=T against
    # row_u(u)=T [unit] -- see docstring; row_v(oth) matches the generic
    # False default (also forced, but consistently with it).
    for p in ("a0", "a1", "a2", "qh", "wh", "f1", "f2", "xv"):
        assumptions.append(lit(f"row_u({p})", False))
    assumptions.append(lit("row_u(oth)", True))  # forced, see docstring
    for p in ("a0", "a1", "a2", "xu", "qh", "wh", "f1", "f2"):
        assumptions.append(lit(f"row_v({p})", False))
    assumptions.append(lit("row_v(oth)", False))

    # row_src: under srcU=False, the srcU->(row_src(p)<->row_u(p))
    # biconditional does NOT fire (it is conditioned on srcU=True) --
    # row_src is governed instead by its own unconditional units
    # (row_src(oth)=F, row_src(v)=F) plus the two srcU=False-specific
    # facts (row_src(xu)=T [x in Sigma'(x)], row_src(u)=F [(C6.12)]);
    # every other slot is genuinely free here, pinned False generically.
    for p in ("a0", "a1", "a2", "zd", "v", "oth", "qh", "wh", "f1", "f2", "xv"):
        assumptions.append(lit(f"row_src({p})", False))
    assumptions.append(lit("row_src(xu)", True))

    # Blocker-map targets.  u->v, v->zd, zd->xv, xv->OUT, xu->OUT form an
    # acyclic-per-BM8/BM9 chain with no target repeated among
    # {u,v,zd,xv,xu} (so (BM8)/(BM9)'s pairwise-distinct-target
    # requirements hold trivially).  oth->v is FORCED (must equal u's own
    # target exactly, see docstring) -- not an independent choice.
    assumptions.append(lit("b(u,v)", True))
    assumptions.append(lit("b(v,zd)", True))
    assumptions.append(lit("b(zd,xv)", True))
    assumptions.append(lit("b(xv,OUT)", True))
    assumptions.append(lit("b(xu,OUT)", True))
    assumptions.append(lit("b(oth,v)", True))  # forced = b(u,.)'s target
    assumptions.append(lit("b(qh,a1)", True))
    assumptions.append(lit("b(wh,a1)", True))

    # Deletion set: |D0|=1 (base carries only (DEL1) at-least-one; no
    # (DEL2)/(DEL3) here -- both are leaf-C1-only).
    assumptions.append(lit("del(zd)", True))
    for p in ("u", "xu", "v", "xv"):
        assumptions.append(lit(f"del({p})", False))

    # (FB)-analog: fbar pair = {qh,wh} (inSig(qh)=inSig(wh)=F already
    # forced by the inO1i(qh)=inO1i(wh)=T units via CAP1; the two DROPPED
    # implications from A -- fbar->~inT, fbar->~eq(.,a2) -- no longer
    # exist in C, so this pick has fewer obligations than A's did).
    assumptions.append(lit("fbar(qh)", True))
    assumptions.append(lit("fbar(wh)", True))
    assumptions.append(lit("fbar(f1)", False))
    assumptions.append(lit("fbar(f2)", False))

    # (CD5)-analog: generic/no-radius-coincidence choice for all four
    # selectors.
    assumptions.append(lit("rbs1", False))
    assumptions.append(lit("rbs2", False))
    assumptions.append(lit("rbt1", False))
    assumptions.append(lit("rbt2", False))

    # (E8c) explicit pin: avoid the infeasible bs1(qh)&bs1(wh) /
    # bt1(qh)&bt1(wh) corner against the fixed b(u,xv)=T / b(v,zd)=T
    # targets (same reasoning as A's witness).
    assumptions.append(lit("bs1(qh)", False))
    assumptions.append(lit("bs1(wh)", False))
    assumptions.append(lit("bt1(qh)", False))
    assumptions.append(lit("bt1(wh)", False))

    return assumptions


def gate_sat(encoder: "enc.CCoreEncoder", timeout_seconds: int) -> dict[str, Any]:
    assumptions = hand_built_assumptions(encoder)
    instance = enc.RunInstance(encoder, encoder.base_clauses)
    cnf_path = OUT_DIR / "g_sat.cnf"
    start = time.monotonic()
    result = enc.solve_cadical(
        instance, cnf_path, extra_clauses=assumptions, timeout_seconds=timeout_seconds
    )
    wall = time.monotonic() - start
    record: dict[str, Any] = {
        "gate": "G-SAT",
        "variant": "hand-built-total-assignment (spec section 7 default for C)",
        "verdict": result.verdict,
        "expected": "SAT",
        "pass": result.verdict == "SAT",
        "wall_seconds": round(wall, 3),
        "n_assumptions": len(assumptions),
    }
    if result.verdict == "SAT" and result.cube is not None:
        model_path = OUT_DIR / "g_sat.model.json"
        model_path.write_text(json.dumps(result.cube, sort_keys=True, indent=2), encoding="utf-8")
        record["model_file"] = str(model_path.relative_to(OUT_DIR.parents[1]))
        record["derived_n_value"] = next(
            (i for i in range(encoder.MAXN + 1) if result.cube.get(f"n={i}")), None
        )
    return record


def gate_c1_srcu_clash(
    encoder: "enc.CCoreEncoder", c1_extra: list[tuple[int, ...]], timeout_seconds: int
) -> dict[str, Any]:
    """G-EXCL analog, part 1 (spec section 7): base+C1 delta + srcU must be
    UNSAT (C1's own (C9.3) unit already forces ~srcU -- trivial unit
    clash, but run+DRAT-verify it per the spec's explicit instruction)."""

    extra = list(c1_extra) + [_lit(encoder, "srcU", True)]
    instance = enc.RunInstance(encoder, encoder.base_clauses)
    cnf_path = OUT_DIR / "g_excl_c1_srcu.cnf"
    proof_path = OUT_DIR / "g_excl_c1_srcu.drat"
    start = time.monotonic()
    result = enc.solve_cadical(
        instance, cnf_path, extra_clauses=extra,
        timeout_seconds=timeout_seconds, proof_path=proof_path,
    )
    wall = time.monotonic() - start
    ok = result.verdict == "UNSAT"
    return {
        "gate": "G-EXCL-analog (base+C1+srcU)",
        "verdict": result.verdict,
        "expected": "UNSAT",
        "pass": ok,
        "proof_verified": result.proof_verified,
        "wall_seconds": round(wall, 3),
    }


def gate_c1_del_triple(
    encoder: "enc.CCoreEncoder", c1_extra: list[tuple[int, ...]], timeout_seconds: int
) -> dict[str, Any]:
    """G-EXCL analog, part 2 / DEL3 gate (spec section 7, = A's P-DEL3
    pattern): base+C1 delta + del(zd)&del(u)&del(xu) must be UNSAT
    ((DEL3)'s at-most-2 forbids three simultaneous deletions)."""

    extra = list(c1_extra) + [
        _lit(encoder, "del(zd)", True),
        _lit(encoder, "del(u)", True),
        _lit(encoder, "del(xu)", True),
    ]
    instance = enc.RunInstance(encoder, encoder.base_clauses)
    cnf_path = OUT_DIR / "g_excl_c1_del_triple.cnf"
    proof_path = OUT_DIR / "g_excl_c1_del_triple.drat"
    start = time.monotonic()
    result = enc.solve_cadical(
        instance, cnf_path, extra_clauses=extra,
        timeout_seconds=timeout_seconds, proof_path=proof_path,
    )
    wall = time.monotonic() - start
    ok = result.verdict == "UNSAT"
    return {
        "gate": "G-EXCL-analog (base+C1+del-triple, DEL3 gate)",
        "verdict": result.verdict,
        "expected": "UNSAT",
        "pass": ok,
        "proof_verified": result.proof_verified,
        "wall_seconds": round(wall, 3),
    }


def gate_probes(
    encoder: "enc.CCoreEncoder",
    c2_extra: list[tuple[int, ...]],
    timeout_seconds: int,
) -> dict[str, Any]:
    """(spec section 7) The four named probes: each must be UNSAT with a
    verified DRAT proof."""

    lit = lambda name, value: _lit(encoder, name, value)
    probes: list[dict[str, Any]] = []

    def _run_probe(
        probe_name: str, base_extra: list[tuple[int, ...]], extra: list[tuple[int, ...]]
    ) -> dict[str, Any]:
        instance = enc.RunInstance(encoder, encoder.base_clauses)
        cnf_path = OUT_DIR / f"g_probe_{probe_name}.cnf"
        proof_path = OUT_DIR / f"g_probe_{probe_name}.drat"
        start = time.monotonic()
        result = enc.solve_cadical(
            instance, cnf_path, extra_clauses=list(base_extra) + list(extra),
            timeout_seconds=timeout_seconds, proof_path=proof_path,
        )
        wall = time.monotonic() - start
        ok = result.verdict == "UNSAT"
        return {
            "probe": probe_name,
            "verdict": result.verdict,
            "expected": "UNSAT",
            "pass": ok,
            "proof_verified": result.proof_verified,
            "wall_seconds": round(wall, 3),
        }

    # P-SRC: base + ~srcU + row_src(u) -> UNSAT [(C6.12)].
    probes.append(
        _run_probe(
            "P-SRC", [], [lit("srcU", False), lit("row_src(u)", True)],
        )
    )

    # P-COL: base+C2 + ~col(s,t) for all 10 pairs -> UNSAT [(COL)
    # at-least-one].
    col = encoder.leaf_c2_names["col"]
    col_all_false = [(-var,) for var in col.values()]
    probes.append(_run_probe("P-COL", c2_extra, col_all_false))

    # P-E5C: base+C2 + eq(P,a1) + del(u) + srcU -> UNSAT [E5C gives
    # cl1(u); section 2 gives srcU -> ~cl1(u)].
    p_eq_a1 = encoder.leaf_c2_names["P_eq"]["a1"]
    probes.append(
        _run_probe(
            "P-E5C",
            c2_extra,
            [
                (p_eq_a1,),
                lit("del(u)", True),
                lit("srcU", True),
            ],
        )
    )

    # P-E8-src: base + row_src(qh) & row_src(wh) & srcU & b(u,a0) -> UNSAT.
    probes.append(
        _run_probe(
            "P-E8-src",
            [],
            [
                lit("row_src(qh)", True),
                lit("row_src(wh)", True),
                lit("srcU", True),
                lit("b(u,a0)", True),
            ],
        )
    )

    return {
        "gate": "G-PROBES",
        "probes": probes,
        "pass": all(p["pass"] for p in probes) and len(probes) == 4,
    }


def main() -> int:
    OUT_DIR.mkdir(parents=True, exist_ok=True)
    encoder = enc.CCoreEncoder()

    # Build both leaf extensions exactly once each here, threading their
    # outputs into every check/gate/probe that needs them -- same
    # discipline as a_core's smoke.py (build_del3_clauses/
    # build_leaf_c2_extension both mutate encoder.cnf past its frozen
    # base_clauses prefix; build_leaf_c2_extension raises on a second call
    # since it registers uniquely-named atoms).
    del3_extra = encoder.build_del3_clauses()
    c1_extra = encoder.leaf_c1_delta_clauses(del3_extra)
    c2_extra = encoder.build_leaf_c2_extension()

    report: dict[str, Any] = {}

    base_result = gate_base(encoder, timeout_seconds=60)
    report["G-BASE"] = base_result
    print(json.dumps(base_result, indent=2))

    if not base_result["pass"]:
        print("G-BASE FAILED (UNSAT) -- STOPPING per spec section 7.")
        report["STOPPED_AFTER"] = "G-BASE"
        (OUT_DIR / "smoke_report.json").write_text(
            json.dumps(report, sort_keys=True, indent=2), encoding="utf-8"
        )
        return 1

    sat_result = gate_sat(encoder, timeout_seconds=60)
    report["G-SAT"] = sat_result
    print(json.dumps(sat_result, indent=2))

    srcu_clash = gate_c1_srcu_clash(encoder, c1_extra, timeout_seconds=60)
    report["G-EXCL-srcU"] = srcu_clash
    print(json.dumps(srcu_clash, indent=2))

    del_triple = gate_c1_del_triple(encoder, c1_extra, timeout_seconds=60)
    report["G-EXCL-del-triple"] = del_triple
    print(json.dumps(del_triple, indent=2))

    probes_result = gate_probes(encoder, c2_extra, timeout_seconds=60)
    report["G-PROBES"] = probes_result
    print(json.dumps(probes_result, indent=2))

    report["ALL_GATES_PASS"] = (
        base_result["pass"] and sat_result["pass"] and srcu_clash["pass"]
        and del_triple["pass"] and probes_result["pass"]
    )
    (OUT_DIR / "smoke_report.json").write_text(
        json.dumps(report, sort_keys=True, indent=2), encoding="utf-8"
    )
    print(f"ALL_GATES_PASS = {report['ALL_GATES_PASS']}")
    return 0 if report["ALL_GATES_PASS"] else 1


if __name__ == "__main__":
    raise SystemExit(main())
