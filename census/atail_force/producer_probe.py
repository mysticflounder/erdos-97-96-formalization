#!/usr/bin/env python3
"""Bounded first probe of the geometry-faithful ATAIL producer surface.

The probe chooses the first canonical finite assignment satisfying the target
negation for each role-aware case, scans all formalized equality-core banks,
and runs one bounded Z3 and cvc5 query on the complete named geometry system.
SAT/UNSAT/UNKNOWN remain discovery evidence and are never reported as Lean
closure.
"""

from __future__ import annotations

import argparse
import hashlib
import json
from itertools import product
from pathlib import Path
from typing import Any

from census.atail_force import producer_bank
from census.atail_force import producer_geometry
from census.atail_force import producer_surface


ROOT = Path(__file__).resolve().parents[2]
DEFAULT_OUTPUT = Path(__file__).with_name("producer_probe_checkpoint.json")
SCHEMA = "p97_atail_force_producer_probe.v1"


def _sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def first_negated_assignment(
    case: producer_surface.ProducerCase,
) -> producer_surface.ApexClassAssignment:
    """Return the first canonical exact-class assignment with no target pair."""

    first_classes = producer_surface.iter_exact_apex_classes(case, "opp_apex1")
    second_classes = producer_surface.iter_exact_apex_classes(case, "opp_apex2")
    for first, second in product(first_classes, second_classes):
        assignment = producer_surface.ApexClassAssignment(
            first,
            second,
            next(producer_surface.iter_selected_four_witnesses(first)),
            next(producer_surface.iter_selected_four_witnesses(second)),
        )
        if producer_surface.no_shared_off_surplus_pair(case, assignment):
            return assignment
    raise RuntimeError(f"{case.case_id}: no finite target-negation assignment")


def _metric_rows(
    assignment: producer_surface.ApexClassAssignment,
) -> tuple[producer_bank.MetricRow, ...]:
    rows = (
        assignment.opp_apex1_exact,
        assignment.opp_apex2_exact,
    )
    return tuple(
        producer_bank.MetricRow(row.center, row.support, exact=True) for row in rows
    )


def _canonical_order(case: producer_surface.ProducerCase) -> tuple[int, ...]:
    frame = producer_surface.frame_for_case(case)
    return (0, *frame.ints["O2"], 1, *frame.ints["S"], 2, *frame.ints["O1"])


def first_bank_clean_negated_assignment(
    case: producer_surface.ProducerCase,
) -> producer_surface.ApexClassAssignment:
    """First target-negating assignment not already killed by a bank core."""

    first_classes = producer_surface.iter_exact_apex_classes(case, "opp_apex1")
    second_classes = producer_surface.iter_exact_apex_classes(case, "opp_apex2")
    order = _canonical_order(case)
    for first, second in product(first_classes, second_classes):
        assignment = producer_surface.ApexClassAssignment(
            first,
            second,
            next(producer_surface.iter_selected_four_witnesses(first)),
            next(producer_surface.iter_selected_four_witnesses(second)),
        )
        if not producer_surface.no_shared_off_surplus_pair(case, assignment):
            continue
        if not producer_bank.scan_all_formalized_cores(
            _metric_rows(assignment), case.cardinality, order
        ):
            return assignment
    raise RuntimeError(f"{case.case_id}: no bank-clean target-negation assignment")


def named_core_from_cvc5(
    system: producer_geometry.GeometrySystem, result: dict[str, object]
) -> tuple[str, ...]:
    """Extract only declared atom names from a cvc5 UNSAT-core response."""

    if result.get("status") != "UNSAT":
        return ()
    declared = set(system.atom_names())
    lines = {line.strip() for line in str(result.get("stdout", "")).splitlines()}
    return tuple(sorted(declared & lines))


def build_document(
    *, z3_timeout_ms: int, cvc5_timeout_seconds: float
) -> dict[str, Any]:
    cases = []
    for case in producer_surface.PRODUCER_CASES:
        assignment = first_bank_clean_negated_assignment(case)
        blueprint = producer_geometry.blueprint_from_surface(case, assignment)
        system = producer_geometry.build_geometry_system(blueprint)
        order = tuple(int(label) for label in blueprint.cyclic_order)
        bank_matches = producer_bank.scan_all_formalized_cores(
            _metric_rows(assignment), case.cardinality, order
        )
        z3_full = producer_geometry.run_z3_bounded(
            system, timeout_ms=z3_timeout_ms
        )
        cvc5_full = producer_geometry.run_cvc5_bounded(
            system, timeout_seconds=cvc5_timeout_seconds
        )
        cvc5_core = named_core_from_cvc5(system, cvc5_full)
        z3_core = (
            producer_geometry.run_z3_bounded(
                system, cvc5_core, timeout_ms=z3_timeout_ms
            )
            if cvc5_core
            else None
        )
        cases.append(
            {
                "case": case.as_dict(),
                "assignment": assignment.as_dict(),
                "atom_count": len(system.atoms),
                "atom_family_counts": {
                    family: sum(atom.family == family for atom in system.atoms)
                    for family in sorted({atom.family for atom in system.atoms})
                },
                "formalized_bank_matches": list(bank_matches),
                "z3_full_surface": z3_full,
                "cvc5_full_surface": cvc5_full,
                "cvc5_named_core": list(cvc5_core),
                "z3_on_cvc5_core": z3_core,
            }
        )
    files = (
        ROOT / "census/atail_force/producer_surface.py",
        ROOT / "census/atail_force/producer_geometry.py",
        ROOT / "census/atail_force/producer_bank.py",
        ROOT / "census/atail_force/producer_mus.py",
        ROOT / "census/atail_force/producer_probe.py",
    )
    return {
        "schema": SCHEMA,
        "inputs": {
            str(path.relative_to(ROOT)): _sha256(path) for path in files
        },
        "budgets": {
            "one_assignment_per_case": True,
            "z3_timeout_ms_per_case": z3_timeout_ms,
            "cvc5_timeout_seconds_per_case": cvc5_timeout_seconds,
            "automatic_retries": False,
        },
        "smoke_gates": {
            "z3": producer_geometry.z3_smoke_gate(),
            "cvc5": producer_geometry.cvc5_smoke_gate(),
        },
        "cases": cases,
        "scope": {
            "encoded_geometry_atoms_are_live_consequences": True,
            "full_live_hypothesis_surface_encoded": False,
            "finite_assignment_exhaustive": False,
            "solver_result_is_not_a_lean_proof": True,
            "bank_matches_have_named_lean_consumers": True,
            "encoded_omitted_ledger": {
                "ENCODED": list(producer_surface.ENCODED_LEDGER),
                "OMITTED": list(producer_geometry.OMITTED_LEDGER),
            },
        },
    }


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path, default=DEFAULT_OUTPUT)
    parser.add_argument("--z3-timeout-ms", type=int, default=5_000)
    parser.add_argument("--cvc5-timeout-seconds", type=float, default=5.0)
    args = parser.parse_args()
    document = build_document(
        z3_timeout_ms=args.z3_timeout_ms,
        cvc5_timeout_seconds=args.cvc5_timeout_seconds,
    )
    args.output.write_text(
        json.dumps(document, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )
    print(
        json.dumps(
            [
                {
                    "case_id": case["case"]["case_id"],
                    "z3": case["z3_full_surface"]["status"],
                    "cvc5": case["cvc5_full_surface"]["status"],
                    "bank_matches": len(case["formalized_bank_matches"]),
                }
                for case in document["cases"]
            ],
            sort_keys=True,
        )
    )


if __name__ == "__main__":
    main()
