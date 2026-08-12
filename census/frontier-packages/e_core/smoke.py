"""Smoke gates for the E-core encoder (spec section 5), run IN ORDER:
G-BASE, G-SHADOW (the load-bearing witness gate), then the five probes
P-EBM3, P-ER2, P-DOM, P-EI34, P-COVER.

Also runs one direct validation check the dispatch called out explicitly:
  - (EQ4) no-triangle verification: the E-package's six eq atoms form two
    disjoint stars with no triangle, so the generic (EQ4) transitivity loop
    (spec section 1's "verify whether any label triple has all three eq
    atoms") emits zero clauses.  Checked by direct inspection of
    ``encoder.eq4_triangles_found``, not just narrative.

Run from the repo root:
  uv run python census/frontier-packages/e_core/smoke.py
"""

from __future__ import annotations

import argparse
import json
import sys
import time
from pathlib import Path
from typing import Any

sys.path.insert(0, str(Path(__file__).resolve().parent))
import encoding as enc  # noqa: E402

from census.card_head.frontier_lane_piqd import (  # noqa: E402
    FrontierSolver,
    add_solver_arguments,
    proof_manifest_fields,
    solver_from_args,
)

OUT_DIR = Path(__file__).resolve().parent / "out" / "smoke"


def check_eq4_no_triangle(encoder: "enc.EEncoder") -> dict[str, Any]:
    """(EQ4) spec section 1 note: verify whether any label triple has all
    three eq atoms; if none, the schema is a documented no-op."""

    return {
        "check": "EQ4-no-triangle",
        "eq_pairs": sorted(tuple(sorted(pair)) for pair in enc.EQ_PAIRS),
        "triangles_found": encoder.eq4_triangles_found,
        "no_op_confirmed": encoder.eq4_triangles_found == 0,
    }


def _lit(encoder: "enc.EEncoder", name: str, value: bool) -> tuple[int]:
    var = encoder.names[name]
    return (var if value else -var,)


def gate_base(
    encoder: "enc.EEncoder", timeout_seconds: int, solver: FrontierSolver
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
        "wall_seconds": round(wall, 3),
    }


# ---------------------------------------------------------------------------
# G-SHADOW: the 15-point equality shadow
# (scratch/triapex-incidence-obstruction/check_model.py) mapped onto the
# 7-label E atom set.  See RESULTS.md for the point-by-point mapping table;
# the assumption literals below are exactly that mapping's assumption side.
# ---------------------------------------------------------------------------

# Shadow labeling used throughout: a0=12, a1=13, a2=14 (the three apices,
# check_model.py's APICES, indices 0/1/2 respectively -- apex `12`'s own
# rich class is Gamma(12,r)=STRICT_CAPS[0]|{13,14}, i.e. cap index 0 is
# OPPOSITE apex 12, matching a0's surplus-cap role); x1=4, x2=5, qb=6,
# wb=7 (all four drawn from STRICT_CAPS[1]={4,5,6,7}, the strict interior
# of the cap opposite a1=13 -- C_{i1}^o).


def shadow_assumptions(encoder: "enc.EEncoder") -> list[tuple[int, ...]]:
    """G-SHADOW assumption literals (spec section 5): the total mapping of
    the 15-point equality shadow onto the E atom set.  Every literal here
    is either (a) a genuine fact read off check_model.py's SHELLS/BLOCKER/
    RICH_CLASSES/STRICT_CAPS data under the labeling above, or (b) a free
    "generic position" choice (all eq atoms false, i.e. no accidental
    coincidence among the 7 labeled shadow points) documented as such.
    g1(a0)/g1(a2) ARE shadow-determined (12,14 lie in RICH_CLASSES[1] =
    Gamma(a1,rho0)) but carry no pinning clause; they and the genuinely
    free dom1/dom2 are left OUT of this list -- solved freely.  The
    orchestrator's e_probe.py re-runs this gate with g1(a0)=g1(a2)=T
    asserted (still SAT).  See RESULTS.md section 2 for
    the full point-by-point derivation of every literal below."""

    lit = lambda name, value: _lit(encoder, name, value)
    assumptions: list[tuple[int, ...]] = []

    # Generic position: all six eq atoms false (the seven mapped shadow
    # points 4,5,6,7,12,13,14 are pairwise distinct integers -- no chosen
    # coincidence).
    for pair in enc.EQ_PAIRS:
        p, q = sorted(pair)
        assumptions.append(lit(f"eq({p},{q})", False))

    # Caps: qb=6, wb=7 are literal members of STRICT_CAPS[1]={4,5,6,7}, the
    # same strict cap interior as x1=4,x2=5 (inO1i(x1),inO1i(x2) are
    # already hard base units; qb/wb's placement is NOT a base unit and
    # must be asserted here).
    assumptions.append(lit("inO1i(qb)", True))
    assumptions.append(lit("inO1i(wb)", True))

    # Rows: Sigma(x1=4) = SHELLS[3] = {0,4,10,13} (check_model.py
    # BLOCKER[4]=3); among the 7 labeled points this support contains
    # x1=4 (the base unit row1(x1)=T) and a1=13 -- so row1(a1)=T is a
    # genuine (if unusual) shadow fact, not a contradiction of anything.
    # a0=12,a2=14,x2=5,qb=6,wb=7 are all absent from {0,4,10,13}.
    assumptions.append(lit("row1(a1)", True))
    for p in ("a0", "a2", "x2", "qb", "wb"):
        assumptions.append(lit(f"row1({p})", False))
    # Sigma(x2=5) = SHELLS[8] = {1,5,9,11} (BLOCKER[5]=8); among the 7
    # labeled points only x2=5 itself (base unit row2(x2)=T) is present.
    for p in ("a0", "a1", "a2", "x1", "qb", "wb"):
        assumptions.append(lit(f"row2({p})", False))

    # Blocker map: c(4)=3 (BLOCKER[4]=3, unlabeled) -> b(x1,OUT)=T;
    # c(5)=8 (BLOCKER[5]=8, unlabeled) -> b(x2,OUT)=T; c(6)=5=x2
    # (BLOCKER[6]=5) -> b(qb,x2)=T, a REAL labeled incidence;
    # c(7)=2 (BLOCKER[7]=2, unlabeled) -> b(wb,OUT)=T.
    assumptions.append(lit("b(x1,OUT)", True))
    assumptions.append(lit("b(x2,OUT)", True))
    assumptions.append(lit("b(qb,x2)", True))
    assumptions.append(lit("b(wb,OUT)", True))

    # Non-robust centers: notRob(x2)=T is already entailed by (EN1) given
    # b(qb,x2)=T above (not asserted separately -- see RESULTS.md).  The
    # shadow's BLOCKER array additionally shows x1=4, qb=6, wb=7 each
    # appear as SOME source's blocker center too (BLOCKER[1]=4 and
    # BLOCKER[8]=4; BLOCKER[11]=6; BLOCKER[3]=7) -- i.e. every one of the
    # 12 non-apex shadow points is non-robust in this model (fibers cover
    # all of {0,...,11}).  This is strictly more than (EN1) alone derives
    # (EN1 only sees the tracked b(qb,x2) incidence); asserted here as an
    # additional, non-invented, directly-checkable shadow fact for a fully
    # faithful total mapping.
    assumptions.append(lit("notRob(x1)", True))
    assumptions.append(lit("notRob(qb)", True))
    assumptions.append(lit("notRob(wb)", True))

    # CD projections: the only coradial-at-a1 class avoiding {qb,a1} in
    # this shadow is Gamma(a1,r)\{a1,qb} = {4,5,7,12,14} = {x1,x2,wb,a0,a2}
    # (5 points); B1 must be a genuine 4-subset, so choose
    # B1={x1,x2,wb,a0} (excluding a2).  The only coradial-at-a2 class
    # avoiding {qb,a2} is Gamma(a2,r)\{a2} = {8,9,10,11,12,13}, of which
    # {8,9,10,11} (all unlabeled) is already a full 4-subset: choose
    # B2={8,9,10,11}, touching none of the 7 labels.
    for p in ("a0", "x1", "x2", "wb"):
        assumptions.append(lit(f"qs1({p})", True))
    assumptions.append(lit("qs1(a2)", False))  # B1 excludes a2 (4-subset)
    for p in ("a0", "a1", "x1", "x2", "wb"):
        assumptions.append(lit(f"qs2({p})", False))

    # Arm selectors: nG1=6 (the full rich class {4,5,6,7,12,14}) is NOT in
    # {4,5}, so e24b (which would force nG1<=5) must be false; e24a=True
    # satisfies the disjunction. Each e8i rich-interior pattern holds in
    # its arm (a) in this shadow (|Gamma(a1,r) (intersect) C_1^o|=4,
    # likewise at a2 and a0): e81_a=e82_a=e8s_a=True, *_b=False (a definite
    # single-arm total witness; the disjunctions do not require this, it
    # is a choice for a fully-pinned assumption set).
    assumptions.append(lit("e24a", True))
    assumptions.append(lit("e24b", False))
    for i in ("1", "2", "s"):
        assumptions.append(lit(f"e8{i}_a", True))
        assumptions.append(lit(f"e8{i}_b", False))

    # Integer layer: nSig=nO1=nO2=4 (each strict cap has exactly 4
    # interior points); n is left to be DERIVED via (EI1) rather than
    # asserted (n=15, an extra check that (EI1) is wired correctly).
    # nN=12 (|non-apex points|, all 12 are non-robust per the notRob
    # assertions above) and nG1=6, nG1O1=4 are asserted directly -- no
    # base clause pins their exact values (only inequalities).
    assumptions.append(lit("nSig=4", True))
    assumptions.append(lit("nO1=4", True))
    assumptions.append(lit("nO2=4", True))
    assumptions.append(lit("nN=12", True))
    assumptions.append(lit("nG1=6", True))
    assumptions.append(lit("nG1O1=4", True))

    return assumptions


def gate_shadow(
    encoder: "enc.EEncoder", timeout_seconds: int, solver: FrontierSolver
) -> dict[str, Any]:
    assumptions = shadow_assumptions(encoder)
    instance = enc.RunInstance(encoder, encoder.base_clauses)
    cnf_path = OUT_DIR / "g_shadow.cnf"
    start = time.monotonic()
    result = solver(
        instance, cnf_path, extra_clauses=assumptions, timeout_seconds=timeout_seconds
    )
    wall = time.monotonic() - start
    record: dict[str, Any] = {
        "gate": "G-SHADOW",
        "source": "scratch/triapex-incidence-obstruction/check_model.py (15-point equality shadow)",
        "verdict": result.verdict,
        "expected": "SAT",
        "pass": result.verdict == "SAT",
        "wall_seconds": round(wall, 3),
        "n_assumptions": len(assumptions),
        "free_families": ["g1(a0)", "g1(a2)", "dom1", "dom2"],
    }
    if result.verdict == "SAT" and result.cube is not None:
        model_path = OUT_DIR / "g_shadow.model.json"
        model_path.write_text(json.dumps(result.cube, sort_keys=True, indent=2), encoding="utf-8")
        record["model_file"] = str(model_path.relative_to(OUT_DIR.parents[1]))
        record["derived_n_value"] = next(
            (i for i in range(encoder.MAXN + 1) if result.cube.get(f"n={i}")), None
        )
    return record


def gate_probes(
    encoder: "enc.EEncoder",
    timeout_seconds: int,
    solver: FrontierSolver,
    backend: str,
) -> dict[str, Any]:
    """(spec section 5) The five probes: each must be UNSAT with a verified
    backend-honest proof."""

    lit = lambda name, value: _lit(encoder, name, value)
    probes: list[dict[str, Any]] = []

    def _run_probe(probe_name: str, extra: list[tuple[int, ...]]) -> dict[str, Any]:
        instance = enc.RunInstance(encoder, encoder.base_clauses)
        cnf_path = OUT_DIR / f"g_probe_{probe_name}.cnf"
        proof_path = OUT_DIR / f"g_probe_{probe_name}.drat"
        start = time.monotonic()
        result = solver(
            instance, cnf_path, extra_clauses=extra,
            timeout_seconds=timeout_seconds, proof_path=proof_path,
        )
        wall = time.monotonic() - start
        ok = result.verdict == "UNSAT" and result.proof_verified
        record = {
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

    # P-EBM3: base + b(x1,a1) -> UNSAT.
    probes.append(_run_probe("P-EBM3", [lit("b(x1,a1)", True)]))

    # P-ER2: base + row1(a0) & row1(a1) & row1(a2) -> UNSAT.
    probes.append(
        _run_probe(
            "P-ER2",
            [lit("row1(a0)", True), lit("row1(a1)", True), lit("row1(a2)", True)],
        )
    )

    # P-DOM: base + ~dom1 & ~dom2 -> UNSAT.
    probes.append(_run_probe("P-DOM", [lit("dom1", False), lit("dom2", False)]))

    # P-EI34: base + e24b & e81_a + (nG1O1<=3 via unary negation) -> UNSAT.
    p_ei34_extra = (
        [lit("e24b", True), lit("e81_a", True)] + encoder.le_clauses("nG1O1", 3)
    )
    probes.append(_run_probe("P-EI34", p_ei34_extra))

    # P-COVER: base + (n>=16 via unary) + (nN<=3) -> UNSAT.
    p_cover_extra = encoder.ge_clauses("n", 16) + encoder.le_clauses("nN", 3)
    probes.append(_run_probe("P-COVER", p_cover_extra))

    return {
        "gate": "G-PROBES",
        "probes": probes,
        "pass": all(p["pass"] for p in probes) and len(probes) == 5,
    }


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--timeout-seconds", type=int, default=60)
    add_solver_arguments(parser)
    args = parser.parse_args()
    OUT_DIR.mkdir(parents=True, exist_ok=True)
    encoder = enc.EEncoder()
    solver = solver_from_args(
        args=args,
        lane="E",
        encoder=encoder,
        artifact_root=OUT_DIR,
        legacy_solver=enc.solve_cadical,
    )

    report: dict[str, Any] = {}
    report["eq4_no_triangle"] = check_eq4_no_triangle(encoder)

    base_result = gate_base(encoder, args.timeout_seconds, solver)
    report["G-BASE"] = base_result
    print(json.dumps(base_result, indent=2))

    if not base_result["pass"]:
        print("G-BASE FAILED (UNSAT) -- STOPPING per spec discipline "
              "(A spec sec 6 / E spec sec 5).")
        report["STOPPED_AFTER"] = "G-BASE"
        (OUT_DIR / "smoke_report.json").write_text(
            json.dumps(report, sort_keys=True, indent=2), encoding="utf-8"
        )
        return 1

    shadow_result = gate_shadow(encoder, args.timeout_seconds, solver)
    report["G-SHADOW"] = shadow_result
    print(json.dumps(shadow_result, indent=2))

    probes_result = gate_probes(
        encoder, args.timeout_seconds, solver, args.solver_backend
    )
    report["G-PROBES"] = probes_result
    print(json.dumps(probes_result, indent=2))

    report["ALL_GATES_PASS"] = (
        base_result["pass"]
        and shadow_result["pass"]
        and probes_result["pass"]
    )
    (OUT_DIR / "smoke_report.json").write_text(
        json.dumps(report, sort_keys=True, indent=2), encoding="utf-8"
    )
    print(f"ALL_GATES_PASS = {report['ALL_GATES_PASS']}")
    return 0 if report["ALL_GATES_PASS"] else 1


if __name__ == "__main__":
    raise SystemExit(main())
