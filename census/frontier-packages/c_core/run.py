"""CLI driving the C-core Layer-1 incidence runs (spec section 6).

Runs, in order:
  1. base      -- abstract/common (C0)-(C8) families, minus physical C6.9
                  and minus (DEL2)/(DEL3)
  2. base+C1   -- base + physical leaf C1 delta (C6.9, ~srcU, (DEL2),
                  (DEL3), placement) -- a package verdict run
  3. base+C2   -- base + physical leaf C2 delta (C6.9, fresh label P,
                  (COL), (COL-E8), (E5C), built last) -- a package verdict
                  run

There is no shared-context run: the two leaves ARE the two verdicts (C spec
section 6, unlike A's shared base+P).

Writes out/<run>.cnf (DIMACS), out/<run>.model.json (decoded atoms, SAT runs
only), out/manifest.json (summary of every run).

Run from the repo root:
  uv run python census/frontier-packages/c_core/run.py
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
)
from census.card_head.piqd_frontier_bc import (  # noqa: E402
    C_RUN_SOURCES,
    AllocationPhase,
    BcCallerPackageProfile,
    solver_from_args,
)

OUT_DIR = Path(__file__).resolve().parent / "out"


def run_one(
    encoder: "enc.CCoreEncoder",
    name: str,
    base_clauses: list[tuple[int, ...]],
    extra_clauses: list[tuple[int, ...]],
    timeout_seconds: int,
    *,
    solver: FrontierSolver,
    backend: str,
) -> dict[str, Any]:
    instance = enc.RunInstance(encoder, base_clauses)
    cnf_path = OUT_DIR / f"{name}.cnf"
    proof_path = OUT_DIR / f"{name}.drat"
    all_clauses = tuple(base_clauses) + tuple(extra_clauses)
    n_vars = encoder.cnf.n_variables
    for clause in all_clauses:
        for lit in clause:
            n_vars = max(n_vars, abs(lit))
    start = time.monotonic()
    result = solver(
        instance,
        cnf_path,
        extra_clauses=extra_clauses,
        timeout_seconds=timeout_seconds,
        proof_path=proof_path,
    )
    wall_seconds = time.monotonic() - start

    record: dict[str, Any] = {
        "run": name,
        "verdict": result.verdict,
        "n_variables": n_vars,
        "n_clauses": len(all_clauses),
        "wall_seconds": round(wall_seconds, 3),
        "cnf_file": str(cnf_path.relative_to(OUT_DIR.parent)),
        "proof_verified": result.proof_verified,
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
        model_path = OUT_DIR / f"{name}.model.json"
        model_path.write_text(
            json.dumps(result.cube, sort_keys=True, indent=2), encoding="utf-8"
        )
        record["model_file"] = str(model_path.relative_to(OUT_DIR.parent))
        record["model_true_atoms"] = sorted(
            atom_name for atom_name, value in result.cube.items() if value
        )
    if wall_seconds > 60:
        record["TIMEOUT_CONCERN"] = True
    return record


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--timeout-seconds", type=int, default=60)
    add_solver_arguments(parser)
    args = parser.parse_args()

    OUT_DIR.mkdir(parents=True, exist_ok=True)
    encoder = enc.CCoreEncoder()
    base_n_variables = encoder.cnf.n_variables

    base_profile = BcCallerPackageProfile(
        lane="C",
        source_paths=C_RUN_SOURCES,
        allocation_phases=(
            AllocationPhase(
                "C common base allocation",
                base_n_variables,
                "C-core common named and cardinality variables",
            ),
        ),
        live_leaf="C-core abstract/common finite-local diagnostic base",
        finite_schema="p97-c-core-layer1.v1.1-base",
        cardinality_scope="symbolic cardinality buckets with a conservative n>=25 overflow bucket",
        source_theorem="NONE: common finite-local projection has no theorem entitlement",
    )
    base_solver = solver_from_args(
        args=args,
        encoder=encoder,
        profile=base_profile,
        artifact_root=OUT_DIR,
        legacy_solver=enc.solve_cadical,
    )

    manifest: list[dict[str, Any]] = []

    # 1. abstract/common base (physical-branch C6.9 is deliberately absent)
    base_record = run_one(
        encoder,
        "base",
        list(encoder.base_clauses),
        [],
        args.timeout_seconds,
        solver=base_solver,
        backend=args.solver_backend,
    )
    manifest.append(base_record)

    # (DEL3) built here: strictly after 'base' has already been run (so
    # base's reported n_variables excludes DEL3's Sinz aux vars) and before
    # base+C1 is built (it needs the returned clauses).  Leaf-C1-only, NOT
    # in base, NOT in base+C2 -- see encoding.py::build_del3_clauses
    # docstring.
    del3_extra = encoder.build_del3_clauses()
    del3_n_variables = encoder.cnf.n_variables

    # 2. base+C1 physical verdict (leaf delta includes C6.9)
    c1_extra = encoder.leaf_c1_delta_clauses(del3_extra)
    c1_solver = solver_from_args(
        args=args,
        encoder=encoder,
        profile=BcCallerPackageProfile(
            lane="C",
            source_paths=C_RUN_SOURCES,
            allocation_phases=(
                base_profile.allocation_phases[0],
                AllocationPhase(
                    "C1 DEL3 auxiliary allocation",
                    del3_n_variables,
                    "Sinz auxiliaries for the leaf-C1 deletion at-most-two delta",
                ),
            ),
            live_leaf=(
                "Problem97.ATailFrontierLiveClosure."
                "false_of_exactFourMutualOmissionRigid221_physicalApex_sourceNeU"
            ),
            finite_schema="p97-c-core-layer1.v1.1-C1",
            cardinality_scope=base_profile.cardinality_scope,
            source_theorem=(
                "Problem97.ATailFrontierLiveClosure."
                "false_of_exactFourMutualOmissionRigid221_physicalApex_sourceNeU"
            ),
        ),
        artifact_root=OUT_DIR,
        legacy_solver=enc.solve_cadical,
    )
    c1_record = run_one(
        encoder,
        "base+C1",
        list(encoder.base_clauses),
        c1_extra,
        args.timeout_seconds,
        solver=c1_solver,
        backend=args.solver_backend,
    )
    manifest.append(c1_record)

    # 3. base+C2 physical verdict (includes C6.9; built last because the
    # fresh-P extension mutates encoder.cnf past base_clauses)
    c2_extra = encoder.build_leaf_c2_extension()
    c2_solver = solver_from_args(
        args=args,
        encoder=encoder,
        profile=BcCallerPackageProfile(
            lane="C",
            source_paths=C_RUN_SOURCES,
            allocation_phases=(
                base_profile.allocation_phases[0],
                AllocationPhase(
                    "C1 DEL3 auxiliary allocation",
                    del3_n_variables,
                    "Sinz auxiliaries retained in the allocator namespace",
                ),
                AllocationPhase(
                    "C2 fresh-P extension allocation",
                    encoder.cnf.n_variables,
                    "leaf-C2 P, collision, and restoration variables",
                ),
            ),
            live_leaf=(
                "Problem97.ATailFrontierLiveClosure."
                "false_of_exactFourMutualOmissionRigid221_nonphysicalCollision"
            ),
            finite_schema="p97-c-core-layer1.v1.1-C2",
            cardinality_scope=base_profile.cardinality_scope,
            source_theorem=(
                "Problem97.ATailFrontierLiveClosure."
                "false_of_exactFourMutualOmissionRigid221_nonphysicalCollision"
            ),
        ),
        artifact_root=OUT_DIR,
        legacy_solver=enc.solve_cadical,
    )
    c2_record = run_one(
        encoder,
        "base+C2",
        list(encoder.base_clauses),
        c2_extra,
        args.timeout_seconds,
        solver=c2_solver,
        backend=args.solver_backend,
    )
    manifest.append(c2_record)

    manifest_path = OUT_DIR / "manifest.json"
    manifest_path.write_text(json.dumps(manifest, sort_keys=True, indent=2), encoding="utf-8")

    for record in manifest:
        print(
            f"{record['run']:14s} {record['verdict']:8s} "
            f"vars={record['n_variables']:5d} clauses={record['n_clauses']:6d} "
            f"wall={record['wall_seconds']:.3f}s"
        )
    print(f"manifest -> {manifest_path}")
    run_ok = (
        base_record["verdict"] == "SAT"
        and c1_record["verdict"] == "UNSAT"
        and c1_record["proof_verified"] is True
        and c2_record["verdict"] == "UNSAT"
        and c2_record["proof_verified"] is True
    )
    return 0 if run_ok else 1


if __name__ == "__main__":
    raise SystemExit(main())
