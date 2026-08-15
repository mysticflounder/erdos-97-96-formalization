#!/usr/bin/env python3
"""Audit and classify one direct-CNF source-faithful exact-17 model.

The direct DIMACS export can be used in proposal-only mode, but a learned
refinement is accepted here only after the assignment is pinned into the
original source Z3 encoder and an existing formalized theorem-bank consumer
recognizes the resulting exact row system (or exact linear replay proves it
infeasible).
"""

from __future__ import annotations

import argparse
import importlib.util
import json
from pathlib import Path

import z3

HERE = Path(__file__).resolve().parent


def load_module(name: str, path: Path):
    spec = importlib.util.spec_from_file_location(name, path)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"could not load {path}")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


export = load_module(
    "exact17_source_faithful_model_export",
    HERE / "export_source_faithful_boolean_cnf.py",
)


def parse_cadical_model(text: str, variable_count: int) -> dict[int, bool]:
    values = [
        int(token)
        for line in text.splitlines()
        if line.startswith("v ")
        for token in line.split()[1:]
        if token != "0"
    ]
    assignment = {abs(value): value > 0 for value in values}
    missing = set(range(1, variable_count + 1)) - set(assignment)
    if missing:
        raise ValueError(f"CaDiCaL model omitted {len(missing)} variables")
    return assignment


def pin_assignment(
    solver,
    selected,
    fifth_choice,
    assignment: dict[int, bool],
    variable_map: dict[tuple[int, int], int],
    fifth_map: dict[int, int],
) -> None:
    for key, atom in selected.items():
        solver.add(atom == assignment[variable_map[key]])
    for center, atom in fifth_choice.items():
        solver.add(atom == assignment[fifth_map[center]])


def dimacs_header(path: Path) -> tuple[int, int]:
    with path.open() as handle:
        for raw in handle:
            if raw.startswith("p cnf "):
                _, _, variable_text, clause_text = raw.split()
                return int(variable_text), int(clause_text)
    raise ValueError("missing DIMACS header")


def verify_dimacs(
    path: Path, assignment: dict[int, bool], expected_clauses: int
) -> None:
    clause_count = 0
    violations: list[int] = []
    with path.open() as handle:
        for raw in handle:
            if raw.startswith(("c", "p")) or not raw.strip():
                continue
            literals = tuple(int(token) for token in raw.split())
            if not literals or literals[-1] != 0:
                raise ValueError("unterminated DIMACS clause")
            if not clause_satisfied(literals[:-1], assignment):
                violations.append(clause_count)
                if len(violations) == 20:
                    raise ValueError(
                        f"CaDiCaL assignment violates clauses {violations}"
                    )
            clause_count += 1
    if clause_count != expected_clauses:
        raise ValueError(
            f"DIMACS clause count mismatch: {clause_count} != {expected_clauses}"
        )
    if violations:
        raise ValueError(f"CaDiCaL assignment violates clauses {violations}")


def clause_satisfied(
    clause: tuple[int, ...], assignment: dict[int, bool]
) -> bool:
    return any(assignment[abs(literal)] == (literal > 0) for literal in clause)


def analyze_verified_assignment(
    *,
    order_index: int,
    positions: tuple[int, ...],
    variable_count: int,
    clause_count: int,
    assignment: dict[int, bool],
    cnf_description: str,
    model_description: str,
    linear_timeout_ms: int,
    always_linear_replay: bool,
    minimize_first_bank_witness: bool,
    minimize_all_bank_witnesses: bool,
    schema: str = "p97-rigid221-exact17-source-faithful-model-analysis-v1",
    ingress_fields: dict | None = None,
) -> dict:
    """Run source and theorem-bank checks after exact formula verification."""
    order = export.source.normalized_order(order_index, positions)
    variable_map = export.selected_variables()
    next_variable = max(variable_map.values()) + 1
    fifth_map = {
        center: next_variable + offset
        for offset, center in enumerate(export.source.FIFTH_CENTER_CANDIDATES)
    }
    primary_variable_count = max((*variable_map.values(), *fifth_map.values()))
    if variable_count < primary_variable_count:
        raise ValueError(
            "formula variable count omits source variables: "
            f"{variable_count} < {primary_variable_count}"
        )

    solver, selected, fifth_choice, cut_counts = export.source.build_case(
        order, all_static_cuts=False
    )
    pin_assignment(
        solver, selected, fifth_choice, assignment, variable_map, fifth_map
    )
    source_status = solver.check()
    if source_status != z3.sat:
        raise ValueError(
            f"direct-CNF model is rejected by source Z3 encoder: {source_status}"
        )
    model = solver.model()
    supports = export.source.supports_from_model(model, selected)
    fifth_center = export.source.fifth_center_from_model(model, fifth_choice)
    export.source.verify_model(supports, fifth_center)
    rows = export.source.metric_rows(supports, fifth_center)

    export.legacy.ORDER = order
    bank_hit_proposals = export.legacy.producer_bank.scan_all_formalized_cores(
        rows, 17, order
    )
    bank_hits = []
    unreplayed_bank_hit_proposals = []
    for hit in bank_hit_proposals:
        if export.legacy.bank_stage_present(rows, hit):
            bank_hits.append(hit)
        else:
            unreplayed_bank_hit_proposals.append(hit)
    minimized_bank_rows = None
    minimized_bank_witnesses = None
    if bank_hits and minimize_all_bank_witnesses:
        minimized_bank_witnesses = []
        for hit in bank_hits:
            if not export.legacy.bank_stage_present(rows, hit):
                raise AssertionError("theorem-bank hit does not replay")
            witness_rows = export.legacy.minimize_bank_witness(rows, hit)
            if not export.legacy.bank_stage_present(witness_rows, hit):
                raise AssertionError(
                    "minimized theorem-bank witness does not replay"
                )
            minimized_bank_witnesses.append(
                {
                    "record": hit,
                    "rows": export.source.row_payload(witness_rows),
                }
            )
        minimized_bank_rows = export.legacy.rows_from_payload(
            minimized_bank_witnesses[0]["rows"]
        )
    elif bank_hits and minimize_first_bank_witness:
        minimized_bank_rows = export.legacy.minimize_bank_witness(
            rows, bank_hits[0]
        )
        if not export.legacy.bank_stage_present(
            minimized_bank_rows, bank_hits[0]
        ):
            raise AssertionError("minimized theorem-bank witness does not replay")

    linear_status = None
    linear_core = None
    if always_linear_replay or not bank_hits:
        linear_status, linear_core = export.legacy.linear_replay_core(
            rows, linear_timeout_ms
        )

    report = {
        "schema": schema,
        "order_index": order_index,
        "anonymous_positions": list(positions),
        "order": list(order),
        "cnf": cnf_description,
        "cadical_log": model_description,
        "variables": variable_count,
        "primary_variables": primary_variable_count,
        "auxiliary_variables": variable_count - primary_variable_count,
        "clauses": clause_count,
        "cnf_assignment_verified": True,
        "source_z3_assignment_verified": True,
        "source_independent_model_checker_verified": True,
        "source_structural_cut_counts": list(cut_counts),
        "static_bank_assignment_verified_via_direct_cnf": True,
        "fifth_center": fifth_center,
        "rows": export.source.row_payload(rows),
        "bank_hits": bank_hits,
        "unreplayed_bank_hit_proposals": unreplayed_bank_hit_proposals,
        "first_bank_hit_replayed": bool(bank_hits),
        "minimized_first_bank_rows": (
            export.source.row_payload(minimized_bank_rows)
            if minimized_bank_rows is not None
            else None
        ),
        "minimized_bank_witnesses": minimized_bank_witnesses,
        "linear_status": linear_status,
        "linear_replay_requested": always_linear_replay or not bank_hits,
        "linear_core_rows": (
            export.source.row_payload(linear_core)
            if linear_core is not None
            else None
        ),
    }
    if ingress_fields:
        overlap = set(report) & set(ingress_fields)
        if overlap:
            raise ValueError(f"ingress fields overwrite analysis keys: {sorted(overlap)}")
        report.update(ingress_fields)
    return report


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--order", type=int, choices=(0, 1), required=True)
    parser.add_argument("--positions", type=export.parse_positions, required=True)
    parser.add_argument("--cnf", type=Path, required=True)
    parser.add_argument("--cadical-log", type=Path, required=True)
    parser.add_argument("--linear-timeout-ms", type=int, default=120_000)
    parser.add_argument(
        "--always-linear-replay",
        action="store_true",
        help=(
            "run the complete strict-Kalmanson LRA replay even when a "
            "static theorem-bank hit is already present"
        ),
    )
    minimization = parser.add_mutually_exclusive_group()
    minimization.add_argument(
        "--minimize-first-bank-witness", action="store_true"
    )
    minimization.add_argument(
        "--minimize-all-bank-witnesses", action="store_true"
    )
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()

    order = export.source.normalized_order(args.order, args.positions)
    variable_map = export.selected_variables()
    next_variable = max(variable_map.values()) + 1
    fifth_map = {
        center: next_variable + offset
        for offset, center in enumerate(export.source.FIFTH_CENTER_CANDIDATES)
    }

    variable_count, clause_count = dimacs_header(args.cnf)
    primary_variable_count = max((*variable_map.values(), *fifth_map.values()))
    if variable_count < primary_variable_count:
        raise ValueError(
            "DIMACS variable count omits source variables: "
            f"{variable_count} < {primary_variable_count}"
        )
    assignment = parse_cadical_model(args.cadical_log.read_text(), variable_count)
    verify_dimacs(args.cnf, assignment, clause_count)

    # The assignment has already been checked against the emitted static-bank
    # clauses above.  Pin only the source structural layer here: constructing
    # roughly 1.8 million duplicate Z3 clauses is unnecessary and can exhaust
    # memory while another verified exporter is active.
    solver, selected, fifth_choice, cut_counts = export.source.build_case(
        order, all_static_cuts=False
    )
    pin_assignment(
        solver, selected, fifth_choice, assignment, variable_map, fifth_map
    )
    source_status = solver.check()
    if source_status != z3.sat:
        raise ValueError(
            f"direct-CNF model is rejected by source Z3 encoder: {source_status}"
        )
    model = solver.model()
    supports = export.source.supports_from_model(model, selected)
    fifth_center = export.source.fifth_center_from_model(model, fifth_choice)
    export.source.verify_model(supports, fifth_center)
    rows = export.source.metric_rows(supports, fifth_center)

    export.legacy.ORDER = order
    bank_hit_proposals = export.legacy.producer_bank.scan_all_formalized_cores(
        rows, 17, order
    )
    bank_hits = []
    unreplayed_bank_hit_proposals = []
    for hit in bank_hit_proposals:
        if export.legacy.bank_stage_present(rows, hit):
            bank_hits.append(hit)
        else:
            unreplayed_bank_hit_proposals.append(hit)
    minimized_bank_rows = None
    minimized_bank_witnesses = None
    if bank_hits and args.minimize_all_bank_witnesses:
        minimized_bank_witnesses = []
        for hit in bank_hits:
            if not export.legacy.bank_stage_present(rows, hit):
                raise AssertionError("theorem-bank hit does not replay")
            witness_rows = export.legacy.minimize_bank_witness(rows, hit)
            if not export.legacy.bank_stage_present(witness_rows, hit):
                raise AssertionError(
                    "minimized theorem-bank witness does not replay"
                )
            minimized_bank_witnesses.append(
                {
                    "record": hit,
                    "rows": export.source.row_payload(witness_rows),
                }
            )
        minimized_bank_rows = export.legacy.rows_from_payload(
            minimized_bank_witnesses[0]["rows"]
        )
    elif bank_hits and args.minimize_first_bank_witness:
        minimized_bank_rows = export.legacy.minimize_bank_witness(
            rows, bank_hits[0]
        )
        if not export.legacy.bank_stage_present(
            minimized_bank_rows, bank_hits[0]
        ):
            raise AssertionError("minimized theorem-bank witness does not replay")

    linear_status = None
    linear_core = None
    if args.always_linear_replay or not bank_hits:
        linear_status, linear_core = export.legacy.linear_replay_core(
            rows, args.linear_timeout_ms
        )

    report = {
        "schema": "p97-rigid221-exact17-source-faithful-model-analysis-v1",
        "order_index": args.order,
        "anonymous_positions": list(args.positions),
        "order": list(order),
        "cnf": str(args.cnf),
        "cadical_log": str(args.cadical_log),
        "variables": variable_count,
        "primary_variables": primary_variable_count,
        "auxiliary_variables": variable_count - primary_variable_count,
        "clauses": clause_count,
        "cnf_assignment_verified": True,
        "source_z3_assignment_verified": True,
        "source_independent_model_checker_verified": True,
        "source_structural_cut_counts": list(cut_counts),
        "static_bank_assignment_verified_via_direct_cnf": True,
        "fifth_center": fifth_center,
        "rows": export.source.row_payload(rows),
        "bank_hits": bank_hits,
        "unreplayed_bank_hit_proposals": unreplayed_bank_hit_proposals,
        "first_bank_hit_replayed": bool(bank_hits),
        "minimized_first_bank_rows": (
            export.source.row_payload(minimized_bank_rows)
            if minimized_bank_rows is not None
            else None
        ),
        "minimized_bank_witnesses": minimized_bank_witnesses,
        "linear_status": linear_status,
        "linear_replay_requested": args.always_linear_replay or not bank_hits,
        "linear_core_rows": (
            export.source.row_payload(linear_core)
            if linear_core is not None
            else None
        ),
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(report, indent=2, sort_keys=True) + "\n")
    print(json.dumps({
        "bank_hit_count": len(bank_hits),
        "clauses": clause_count,
        "fifth_center": fifth_center,
        "first_bank_family": (
            bank_hits[0].get("family") if bank_hits else None
        ),
        "linear_status": linear_status,
        "output": str(args.output),
        "source_verified": True,
    }, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
