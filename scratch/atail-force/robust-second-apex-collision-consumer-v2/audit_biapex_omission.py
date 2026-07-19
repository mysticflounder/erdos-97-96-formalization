#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
"""Audit the corrected robust bank under both physical-apex omissions.

This is a bounded finite-shadow experiment, not a Lean proof.  It reuses the
corrected 14-role surface and every checked producer-bank cut, then requires
the decoded critical blocker of every source to avoid both physical apices.
"""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import json
import time
from pathlib import Path
from typing import Any

import z3


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
BANK_SCRIPT = HERE.parent / "robust-all-center-marco" / "bank_cegar.py"
CHECKPOINT = HERE.parent / "robust-all-center-marco" / "bank_cegar_checkpoint.json"
OUTPUT = HERE / "biapex_omission_audit.json"


def load_module(path: Path, name: str) -> Any:
    spec = importlib.util.spec_from_file_location(name, path)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot import {path}")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def atomic_write(path: Path, value: dict[str, object]) -> None:
    rendered = json.dumps(value, indent=2, sort_keys=True) + "\n"
    temporary = path.with_suffix(path.suffix + ".tmp")
    temporary.write_text(rendered, encoding="utf-8")
    temporary.replace(path)


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--checkpoint", type=Path, default=CHECKPOINT)
    parser.add_argument("--output", type=Path, default=OUTPUT)
    parser.add_argument("--timeout-ms", type=int, default=60_000)
    parser.add_argument("--wall-seconds", type=float, default=120.0)
    parser.add_argument("--max-refinements", type=int, default=10_000)
    args = parser.parse_args()
    if min(args.timeout_ms, args.wall_seconds, args.max_refinements) <= 0:
        raise SystemExit("all budgets must be positive")

    bank = load_module(BANK_SCRIPT, "p97_robust_all_center_bank_cegar")
    checkpoint = json.loads(args.checkpoint.read_text(encoding="utf-8"))
    current_source_hashes = bank.source_hashes()
    checkpoint_source_hashes = checkpoint.get("source_sha256", {})
    source_hash_drift = {
        path: {
            "checkpoint": checkpoint_source_hashes.get(path),
            "current": current_source_hashes.get(path),
        }
        for path in sorted(set(checkpoint_source_hashes) | set(current_source_hashes))
        if checkpoint_source_hashes.get(path) != current_source_hashes.get(path)
    }
    checkpoint_audit: dict[str, object]
    if source_hash_drift:
        checkpoint_audit = {
            "status": "SOURCE_HASH_DRIFT_FAIL_CLOSED",
            "drift": source_hash_drift,
            "note": (
                "The stored cut clauses are still replayed literally below; "
                "the current producer bank is used only for any new SAT scan."
            ),
        }
    else:
        checkpoint_audit = {
            "status": "PASS",
            "details": bank.check_checkpoint(args.checkpoint),
        }
    surface = bank.robust.Surface()

    first_apex = bank.robust.FIRST_APEX
    second_apex = bank.robust.SECOND_APEX
    stored_survivor_audit = []
    for survivor in checkpoint["structural_survivors"]:
        second_apex_sources = sorted(
            source
            for source, center in survivor["blockers"].items()
            if center == second_apex
        )
        first_apex_sources = sorted(
            source
            for source, center in survivor["blockers"].items()
            if center == first_apex
        )
        stored_survivor_audit.append(
            {
                "iteration": survivor["iteration"],
                "first_apex_sources": first_apex_sources,
                "second_apex_sources": second_apex_sources,
                "satisfies_biapex_omission": not (
                    first_apex_sources or second_apex_sources
                ),
            }
        )

    solver = surface.base_solver()
    solver.set(timeout=args.timeout_ms, random_seed=0)
    for cut in checkpoint["bank_cuts"]:
        solver.add(bank.clause_for_bank_cut(surface, cut))
    first_apex_label = surface.by_name[first_apex]
    second_apex_label = surface.by_name[second_apex]
    for variable in surface.blocker.values():
        solver.add(variable != first_apex_label, variable != second_apex_label)

    started = time.monotonic()
    verdict: z3.CheckSatResult | None = None
    verified_model: z3.ModelRef | None = None
    structural_refinements = []
    budget_reason = None
    for _attempt in range(args.max_refinements + 1):
        remaining = args.wall_seconds - (time.monotonic() - started)
        if remaining <= 0:
            budget_reason = "wall budget"
            break
        solver.set(timeout=min(args.timeout_ms, max(1, int(remaining * 1000))))
        verdict = solver.check()
        if verdict != z3.sat:
            break
        model = solver.model()
        blockers = surface.blockers_from_model(model)
        rows = surface.rows_with_blocker_exactness(
            surface.rows_from_model(model), blockers
        )
        ok, reason = surface.verify_model(rows, blockers)
        if ok:
            if any(
                center in {first_apex_label, second_apex_label}
                for center in blockers.values()
            ):
                raise RuntimeError(
                    "decoded SAT model violated a physical-apex omission"
                )
            verified_model = model
            break
        if reason is None:
            raise RuntimeError("structural verifier rejected without a reason")
        choices = surface.row_choice_indices(model)
        refinement = bank.structural_refinement(surface, reason, choices)
        structural_refinements.append(refinement)
        solver.add(bank.clause_for_structural_refinement(surface, refinement))
    else:
        budget_reason = "structural refinement budget"

    elapsed = time.monotonic() - started
    if budget_reason is not None:
        solver_status = "UNKNOWN_BUDGET_FAIL_CLOSED"
    elif verdict is None:
        solver_status = "UNKNOWN_NO_SOLVER_CALL"
    elif verdict == z3.sat and verified_model is None:
        solver_status = "UNKNOWN_REFINEMENT_BUDGET_FAIL_CLOSED"
    else:
        solver_status = str(verdict).upper()
    result: dict[str, object] = {
        "schema": "p97-atail-robust-biapex-omission-audit-v1",
        "epistemic_status": "BOUNDED_FINITE_STRUCTURAL_Z3_EXPERIMENT_NOT_LEAN_PROOF",
        "inputs": {
            str(BANK_SCRIPT.relative_to(ROOT)): sha256(BANK_SCRIPT),
            str(args.checkpoint.relative_to(ROOT)): sha256(args.checkpoint),
        },
        "checkpoint_audit": checkpoint_audit,
        "bank_cut_count": len(checkpoint["bank_cuts"]),
        "stored_survivor_count": len(stored_survivor_audit),
        "stored_biapex_survivor_count": sum(
            bool(record["satisfies_biapex_omission"])
            for record in stored_survivor_audit
        ),
        "stored_survivor_audit": stored_survivor_audit,
        "omitted_blocker_centers": [first_apex, second_apex],
        "timeout_ms": args.timeout_ms,
        "wall_seconds": args.wall_seconds,
        "max_refinements": args.max_refinements,
        "elapsed_seconds": elapsed,
        "solver_status": solver_status,
        "structural_refinement_count": len(structural_refinements),
        "structural_refinements": structural_refinements,
    }

    if budget_reason is not None:
        result["reason_unknown"] = budget_reason
    elif verdict == z3.unknown:
        result["reason_unknown"] = solver.reason_unknown()
    elif verdict == z3.sat and verified_model is not None:
        model = verified_model
        blockers = surface.blockers_from_model(model)
        rows = surface.rows_with_blocker_exactness(
            surface.rows_from_model(model), blockers
        )
        ok, reason = surface.verify_model(rows, blockers)
        if not ok:
            raise RuntimeError(f"decoded SAT model failed verifier: {reason}")
        choices = surface.row_choice_indices(model)
        selected_matches = bank.scan(surface, rows, exact_centers=frozenset())
        exact_centers = frozenset(blockers.values())
        exact_matches = bank.scan(surface, rows, exact_centers=exact_centers)
        result["witness"] = {
            "rows": bank.named_rows(surface, rows, choices),
            "blockers": bank.named_blockers(surface, blockers),
            "exact_center_names": sorted(
                surface.by_label[center] for center in exact_centers
            ),
            "selected_row_bank_matches": list(selected_matches),
            "blocker_exact_bank_matches": list(exact_matches),
            "independent_structural_verifier": "PASS",
        }

    atomic_write(args.output, result)
    print(json.dumps({
        "solver_status": result["solver_status"],
        "elapsed_seconds": result["elapsed_seconds"],
        "bank_cut_count": result["bank_cut_count"],
        "stored_survivor_count": result["stored_survivor_count"],
        "stored_biapex_survivor_count": result["stored_biapex_survivor_count"],
    }, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
