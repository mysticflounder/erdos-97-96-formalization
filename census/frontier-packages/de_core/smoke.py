"""D4 exactly-two-bisector smoke gate with a checked proof.

The positive fixture supplies the banked D4 pair ``a1,b`` and a fresh named
carrier probe ``c3`` distinct from both.  Adding ``bis(q,w;c3)`` must be UNSAT
because of the general GEOM at-most-two clause.  A dependency probe removes
that GEOM family and must become SAT, preventing the D4 no-third projection
from accidentally being the reason for the smoke UNSAT.
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


def solve(
    encoder: enc.DEEncoder,
    name: str,
    clauses: list[enc.TaggedClause],
    timeout_seconds: int,
    solver: FrontierSolver,
    backend: str,
    proof: bool = False,
) -> tuple[dict[str, Any], enc.CadicalResult]:
    instance = enc.RunInstance(encoder, clauses)
    start = time.monotonic()
    proof_path = OUT_DIR / f"{name}.drat"
    result = solver(
        instance,
        OUT_DIR / f"{name}.cnf",
        timeout_seconds=timeout_seconds,
        proof_path=proof_path if proof else None,
    )
    (OUT_DIR / f"{name}.clauses.json").write_text(
        json.dumps(encoder.clause_map(clauses), sort_keys=True, indent=2),
        encoding="utf-8",
    )
    record = {
        "gate": name,
        "verdict": result.verdict,
        "expected": "UNSAT" if proof else "SAT",
        "n_variables": encoder.cnf.n_variables,
        "n_clauses": len(clauses),
        "tag_counts": encoder.tag_counts(clauses),
        "proof_verified": result.proof_verified,
        "wall_seconds": round(time.monotonic() - start, 3),
    }
    if proof:
        record.update(
            proof_manifest_fields(
                backend=backend,
                requested_proof_path=proof_path,
                result=result,
                relative_to=OUT_DIR.parents[1],
            )
        )
    return record, result


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--timeout-seconds", type=int, default=60)
    add_solver_arguments(parser)
    args = parser.parse_args()
    OUT_DIR.mkdir(parents=True, exist_ok=True)
    encoder = enc.DEEncoder()
    solver = solver_from_args(
        args=args,
        lane="DE",
        encoder=encoder,
        artifact_root=OUT_DIR,
        legacy_solver=enc.solve_cadical,
    )

    # Keep D4, but omit its direct named no-third unit.  The smoke target is
    # the general convex-carrier line bound, not that residual field.
    d4 = [
        c for c in encoder.clauses_for("D4")
        if c.rule != "D4.no_third.named_a2"
    ]
    fixture = d4 + encoder.smoke_probe_units()
    positive, positive_result = solve(
        encoder,
        "d4_two_bisector_positive",
        fixture,
        args.timeout_seconds,
        solver,
        args.solver_backend,
    )

    third = enc.TaggedClause(
        "SMOKE", "fresh_c3.is_third_bisector", (encoder.bis["c3"],)
    )
    negative, negative_result = solve(
        encoder,
        "d4_fresh_third_unsat",
        fixture + [third],
        args.timeout_seconds,
        solver,
        args.solver_backend,
        proof=True,
    )

    # Dependency gate: without the general bisector GEOM clauses, the fresh
    # third is consistent.  Other GEOM families remain in place.
    no_bis_geom = [
        c for c in fixture
        if c.rule != "perpBisector.carrier_atMostTwo"
    ]
    dependency, dependency_result = solve(
        encoder,
        "d4_third_without_bisector_geom",
        no_bis_geom + [third],
        args.timeout_seconds,
        solver,
        args.solver_backend,
    )

    manifest = [positive, negative, dependency]
    (OUT_DIR / "manifest.json").write_text(
        json.dumps(manifest, sort_keys=True, indent=2), encoding="utf-8"
    )
    ok = (
        positive_result.verdict == "SAT"
        and negative_result.verdict == "UNSAT"
        and negative_result.proof_verified
        and dependency_result.verdict == "SAT"
    )
    for row in manifest:
        print(
            f"{row['gate']:34s} {row['verdict']:7s} "
            f"proof_verified={row['proof_verified']}"
        )
    print(f"smoke={'PASS' if ok else 'FAIL'}")
    return 0 if ok else 1


if __name__ == "__main__":
    raise SystemExit(main())
