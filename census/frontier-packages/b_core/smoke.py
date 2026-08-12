"""Third-bisector Layer-1 smoke and three required SAT near-misses."""

from __future__ import annotations

import argparse
import json
import time
from collections.abc import Collection, Sequence
from pathlib import Path
from typing import Any

import encoding as enc

from census.card_head.frontier_lane_piqd import (
    FrontierSolver,
    add_solver_arguments,
    proof_manifest_fields,
)
from census.card_head.piqd_frontier_bc import (
    B_SMOKE_SOURCES,
    AllocationPhase,
    BcCallerPackageProfile,
    solver_from_args,
)

OUT_DIR = Path(__file__).resolve().parent / "out"


class SmokeEncoder:
    def __init__(self) -> None:
        self.cnf = enc.CNF()
        self.names: dict[str, int] = {}
        for name in (
            "Bis(b1)",
            "Bis(a2)",
            "Ne(b1,a2)",
            "Bis(t)",
            "Ne(t,b1)",
            "Ne(t,a2)",
        ):
            self.names[name] = self.cnf.new_variable()

    def v(self, name: str) -> int:
        return self.names[name]

    def clauses(self, omitted: str | None = None) -> list[tuple[int, ...]]:
        facts = [
            ("Bis(b1)", (self.v("Bis(b1)"),)),
            ("Bis(a2)", (self.v("Bis(a2)"),)),
            ("Ne(b1,a2)", (self.v("Ne(b1,a2)"),)),
            ("Bis(t)", (self.v("Bis(t)"),)),
            ("Ne(t,b1)", (self.v("Ne(t,b1)"),)),
            ("Ne(t,a2)", (self.v("Ne(t,a2)"),)),
        ]
        clauses = [clause for name, clause in facts if name != omitted]
        # Projection of the at-most-two apex-bisector theorem to these
        # three named witnesses.
        clauses.append(
            (
                -self.v("Bis(b1)"),
                -self.v("Bis(a2)"),
                -self.v("Ne(b1,a2)"),
                -self.v("Bis(t)"),
                -self.v("Ne(t,b1)"),
                -self.v("Ne(t,a2)"),
            )
        )
        return clauses


class SmokeInstance:
    def __init__(self, encoder: SmokeEncoder, clauses: Sequence[tuple[int, ...]]) -> None:
        self.encoder = encoder
        self.base_clauses = tuple(clauses)

    def dimacs(self, extra_clauses: Sequence[Collection[int]] = ()) -> str:
        clauses = self.base_clauses + tuple(tuple(c) for c in extra_clauses)
        lines = [f"p cnf {self.encoder.cnf.n_variables} {len(clauses)}"]
        lines.extend(" ".join(map(str, clause)) + " 0" for clause in clauses)
        return "\n".join(lines) + "\n"

    def decode_model(self, positive_variables: Collection[int]) -> dict[str, bool]:
        positive = set(positive_variables)
        return {name: variable in positive for name, variable in self.encoder.names.items()}


def run_case(
    encoder: SmokeEncoder,
    name: str,
    omitted: str | None,
    timeout_seconds: int,
    *,
    solver: FrontierSolver,
    backend: str,
) -> dict[str, Any]:
    clauses = encoder.clauses(omitted)
    cnf_path = OUT_DIR / f"smoke-{name}.cnf"
    proof_path = OUT_DIR / f"smoke-{name}.drat"
    start = time.monotonic()
    result = solver(
        SmokeInstance(encoder, clauses),
        cnf_path,
        timeout_seconds=timeout_seconds,
        proof_path=proof_path,
    )
    elapsed = time.monotonic() - start
    record: dict[str, Any] = {
        "case": name,
        "omitted_unit": omitted,
        "verdict": result.verdict,
        "n_variables": encoder.cnf.n_variables,
        "n_clauses": len(clauses),
        "wall_seconds": round(elapsed, 3),
        "proof_verified": result.proof_verified,
        "cnf_file": str(cnf_path.relative_to(OUT_DIR.parent)),
        "clause_tags": [
            *[
                f"SMOKE-direct:{name}"
                for name in (
                    "Bis(b1)",
                    "Bis(a2)",
                    "Ne(b1,a2)",
                    "Bis(t)",
                    "Ne(t,b1)",
                    "Ne(t,a2)",
                )
                if name != omitted
            ],
            "SMOKE-bank:apex-at-most-two-bisectors",
        ],
    }
    record.update(
        proof_manifest_fields(
            backend=backend,
            requested_proof_path=proof_path,
            result=result,
            relative_to=OUT_DIR.parent,
        )
    )
    if result.verdict == "SAT" and result.cube is not None:
        model_path = OUT_DIR / f"smoke-{name}.model.json"
        model_path.write_text(json.dumps(result.cube, sort_keys=True, indent=2) + "\n")
        record["model_file"] = str(model_path.relative_to(OUT_DIR.parent))
        record["omitted_atom_false_in_model"] = result.cube[omitted] is False
    return record


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--timeout-seconds", type=int, default=60)
    add_solver_arguments(parser)
    args = parser.parse_args()
    OUT_DIR.mkdir(parents=True, exist_ok=True)
    encoder = SmokeEncoder()
    solver = solver_from_args(
        args=args,
        encoder=encoder,
        profile=BcCallerPackageProfile(
            lane="B",
            source_paths=B_SMOKE_SOURCES,
            allocation_phases=(
                AllocationPhase(
                    "B smoke atom allocation",
                    encoder.cnf.n_variables,
                    "six named third-bisector smoke atoms",
                ),
            ),
            live_leaf=(
                "Problem97.ATailFrontierLiveClosure."
                "false_of_twoDistinctExactFourMutualOmissionJointDeletions_blockerCollision"
            ),
            finite_schema="p97-b-core-third-bisector-smoke.v1",
            cardinality_scope="six named theorem-bank regression atoms only",
            source_theorem=(
                "Problem97.ATailFrontierLiveClosure."
                "b1_live_false_of_third_bisector_carrier"
            ),
        ),
        artifact_root=OUT_DIR,
        legacy_solver=enc.solve_cadical,
    )
    cases = [
        ("third-bisector", None),
        ("drop-Bis-t", "Bis(t)"),
        ("drop-Ne-t-b1", "Ne(t,b1)"),
        ("drop-Ne-t-a2", "Ne(t,a2)"),
    ]
    records = [
        run_case(
            encoder,
            name,
            omitted,
            args.timeout_seconds,
            solver=solver,
            backend=args.solver_backend,
        )
        for name, omitted in cases
    ]
    full_ok = (
        records[0]["verdict"] == "UNSAT"
        and records[0]["proof_verified"] is True
    )
    near_ok = all(
        r["verdict"] == "SAT" and r.get("omitted_atom_false_in_model") is True
        for r in records[1:]
    )
    manifest = {
        "schema": "p97-b-core-third-bisector-smoke.v1",
        "status": "PASS" if full_ok and near_ok else "FAIL",
        "note": (
            "A checked proof applies to the UNSAT full gate. SAT near-misses "
            "are checked by exact models, including falsity of the omitted atom."
        ),
        "cases": records,
    }
    manifest_path = OUT_DIR / "smoke-manifest.json"
    manifest_path.write_text(json.dumps(manifest, sort_keys=True, indent=2) + "\n")
    for record in records:
        print(
            f"{record['case']:18s} {record['verdict']:7s} "
            f"clauses={record['n_clauses']:2d} proof={record['proof_verified']}"
        )
    print(f"status={manifest['status']} manifest -> {manifest_path}")
    return 0 if manifest["status"] == "PASS" else 1


if __name__ == "__main__":
    raise SystemExit(main())
