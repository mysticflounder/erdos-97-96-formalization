"""Authenticate and classify a CaDiCaL model of the exact-17 Boolean shadow."""

from __future__ import annotations

import argparse
import json
from pathlib import Path

import exact17_fullcover_cegar as cegar
import export_exact17_boolean_cnf as exporter
import export_source_faithful_boolean_cnf as source_exporter


def parse_cadical_model(path: Path, variable_count: int) -> dict[int, bool]:
    assignment: dict[int, bool] = {}
    verdict = None
    with path.open() as handle:
        for line in handle:
            if line.startswith("s "):
                verdict = line.removeprefix("s ").strip()
            if not line.startswith("v "):
                continue
            for token in line.removeprefix("v ").split():
                literal = int(token)
                if literal == 0:
                    continue
                identifier = abs(literal)
                value = literal > 0
                if identifier in assignment and assignment[identifier] != value:
                    raise ValueError(f"conflicting assignments for variable {identifier}")
                assignment[identifier] = value
    if verdict != "SATISFIABLE":
        raise ValueError(f"expected SATISFIABLE, got {verdict!r}")
    expected = set(range(1, variable_count + 1))
    if set(assignment) != expected:
        missing = sorted(expected - set(assignment))
        extra = sorted(set(assignment) - expected)
        raise ValueError(
            "incomplete assignment: "
            f"missing_count={len(missing)}, missing_sample={missing[:20]}, "
            f"extra_count={len(extra)}, extra_sample={extra[:20]}"
        )
    return assignment


def dimacs_header(path: Path) -> tuple[int, int]:
    with path.open() as handle:
        for line in handle:
            if line.startswith("p cnf "):
                _, _, variables, clauses = line.split()
                return int(variables), int(clauses)
    raise ValueError(f"missing DIMACS header in {path}")


def verify_dimacs_assignment(path: Path, assignment: dict[int, bool]) -> int:
    variable_count, declared_clause_count = dimacs_header(path)
    clause: list[int] = []
    observed_clause_count = 0
    violated: list[int] = []
    with path.open() as handle:
        for line in handle:
            if line.startswith(("c", "p")):
                continue
            for token in line.split():
                literal = int(token)
                if literal != 0:
                    if abs(literal) > variable_count:
                        raise ValueError(f"literal {literal} exceeds DIMACS variable count")
                    clause.append(literal)
                    continue
                if not any(
                    assignment[abs(member)] == (member > 0) for member in clause
                ) and len(violated) < 20:
                    violated.append(observed_clause_count)
                observed_clause_count += 1
                clause = []
    if clause:
        raise ValueError("unterminated final DIMACS clause")
    if observed_clause_count != declared_clause_count:
        raise ValueError(
            f"DIMACS clause-count mismatch: declared={declared_clause_count}, "
            f"observed={observed_clause_count}"
        )
    if violated:
        raise ValueError(f"CaDiCaL assignment violates DIMACS clauses {violated}")
    return observed_clause_count


def rows_from_assignment(
    assignment: dict[int, bool],
    var: dict[tuple[int, int], int],
    fifth_center: int,
) -> tuple[cegar.MetricRow, ...]:
    return tuple(
        cegar.MetricRow(
            center,
            tuple(
                point
                for point in cegar.POINTS
                if point != center and assignment[var[center, point]]
            ),
            center in source_exporter.source.OLD_CENTERS or center == fifth_center,
        )
        for center in cegar.POINTS
    )


def fifth_center_from_assignment(
    assignment: dict[int, bool],
    var: dict[tuple[int, int], int],
) -> int:
    first_identifier = max(var.values()) + 1
    chosen = [
        center
        for offset, center in enumerate(source_exporter.source.FIFTH_CENTER_CANDIDATES)
        if assignment[first_identifier + offset]
    ]
    if len(chosen) != 1:
        raise ValueError(f"expected one selected fifth exact-row center, got {chosen}")
    return chosen[0]


def verify_source_z3(
    assignment: dict[int, bool],
    var: dict[tuple[int, int], int],
    order_index: int,
    positions: tuple[int, int],
) -> str:
    order = source_exporter.source.normalized_order(order_index, positions)
    solver, selected, fifth, _ = source_exporter.source.build_case(
        order, all_static_cuts=False
    )
    for atom, identifier in var.items():
        solver.add(selected[atom] == assignment[identifier])
    first_fifth_variable = max(var.values()) + 1
    for offset, center in enumerate(source_exporter.source.FIFTH_CENTER_CANDIDATES):
        identifier = first_fifth_variable + offset
        solver.add(fifth[center] == assignment[identifier])
    return str(solver.check())


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--cadical-log", type=Path, required=True)
    parser.add_argument("--cnf", type=Path, required=True)
    parser.add_argument("--order-index", type=int, required=True)
    parser.add_argument("--positions", type=int, nargs=2, required=True)
    parser.add_argument("--output", type=Path, required=True)
    parser.add_argument("--timeout-ms", type=int, default=30_000)
    args = parser.parse_args()

    var = exporter.variable_map()
    variable_count, _ = dimacs_header(args.cnf)
    assignment = parse_cadical_model(args.cadical_log, variable_count)
    clause_count = verify_dimacs_assignment(args.cnf, assignment)

    order = source_exporter.source.normalized_order(
        args.order_index, tuple(args.positions)
    )
    fifth_center = fifth_center_from_assignment(assignment, var)
    rows = rows_from_assignment(assignment, var, fifth_center)
    if any(len(row.support) != 4 for row in rows):
        raise ValueError("decoded row does not have exactly four selected points")
    source_z3 = verify_source_z3(
        assignment, var, args.order_index, tuple(args.positions)
    )
    if source_z3 != "sat":
        raise ValueError(f"assignment does not satisfy source Z3 encoder: {source_z3}")

    # The legacy replay helpers use this process-local global order internally.
    cegar.ORDER = order
    bank_hits = cegar.producer_bank.scan_all_formalized_cores(rows, 17, order)
    minimized = None
    linear_verdict = None
    linear_core = None
    if bank_hits:
        minimized = cegar.minimize_bank_witness(rows, bank_hits[0])
    else:
        linear_verdict, linear_core = cegar.linear_replay_core(rows, args.timeout_ms)

    payload = {
        "schema": "rigid221-exact17-fullcover-boolean-model-analysis/v2",
        "cadical_log": str(args.cadical_log),
        "cnf_clause_count": clause_count,
        "cnf_assignment_verified": True,
        "source_z3_assignment_verified": True,
        "order_index": args.order_index,
        "positions": list(args.positions),
        "order": list(order),
        "fifth_exact_row_center": fifth_center,
        "rows": cegar.row_payload(rows),
        "bank_hits": bank_hits,
        "minimized_bank_rows": (
            cegar.row_payload(minimized) if minimized is not None else None
        ),
        "linear_verdict": linear_verdict,
        "linear_core_rows": (
            cegar.row_payload(linear_core) if linear_core is not None else None
        ),
    }
    with args.output.open("w") as handle:
        json.dump(payload, handle, indent=2, sort_keys=True)
        handle.write("\n")
    print(json.dumps({
        "bank_hit_count": len(bank_hits),
        "cnf_assignment_verified": True,
        "fifth_exact_row_center": fifth_center,
        "linear_verdict": linear_verdict,
        "source_z3_assignment_verified": True,
        "row_supports": [list(row.support) for row in rows],
    }, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
