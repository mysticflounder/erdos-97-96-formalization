#!/usr/bin/env python3
"""Cross-check the direct transitive two-circle CNF against its Z3 source.

The cases include a harmless single-row equality, a direct two-circle
obstruction, and the genuinely transitive equality-closure smoke discovered
in the cap-nine CEGAR stream.  Every selected atom is pinned in both encodings.
"""

from __future__ import annotations

import argparse
import json
import subprocess
from pathlib import Path

import export_source_faithful_boolean_cnf as export
import z3


def z3_status(order: tuple[int, ...], atoms: frozenset[tuple[int, int]]) -> str:
    solver = z3.Solver()
    selected = {
        (center, point): z3.Bool(f"check_selected_{center}_{point}")
        for center in export.source.POINTS
        for point in export.source.POINTS
        if center != point
    }
    export.source.add_transitive_two_circle_bisector_exclusions(
        solver, selected, order
    )
    for atom, literal in selected.items():
        solver.add(literal == (atom in atoms))
    result = solver.check()
    if result not in (z3.sat, z3.unsat):
        raise AssertionError(f"unexpected Z3 status: {result}")
    return str(result)


def cadical_status(
    path: Path,
    variable_count: int,
    clauses: list[export.Clause],
    selected: dict[tuple[int, int], int],
    atoms: frozenset[tuple[int, int]],
    timeout: int,
) -> tuple[str, str]:
    pinned = clauses + [
        (variable if atom in atoms else -variable,)
        for atom, variable in selected.items()
    ]
    digest = export.write_dimacs(path, variable_count, pinned)
    result = subprocess.run(
        ["cadical", "-t", str(timeout), str(path)],
        capture_output=True,
        text=True,
        timeout=timeout + 30,
        check=False,
    )
    if result.returncode == 10:
        return "sat", digest
    if result.returncode == 20:
        return "unsat", digest
    raise AssertionError(
        f"CaDiCaL failed for {path.name}: return code {result.returncode}"
    )


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--output-dir", type=Path, required=True)
    parser.add_argument("--timeout", type=int, default=120)
    args = parser.parse_args()

    args.output_dir.mkdir(parents=True, exist_ok=True)
    order = export.source.normalized_order(0, (0, 1))
    selected = export.selected_variables()
    start = max(selected.values()) + 1
    (
        equalities,
        xor_definitions,
        obstructions,
        five_point_obstructions,
        _comparison_variables,
        next_var,
        metadata,
    ) = (
        export.transitive_two_circle_clauses(selected, order, start)
    )
    # This focused validator compares the original two-circle source helper
    # with its direct CNF.  The separately kernel-banked five-point extension
    # is independently enumerated by validate_source_faithful_boolean_cnf.py.
    clauses = equalities + xor_definitions + obstructions

    point_q, point_u, point_y, point_v = order[:4]
    cases = {
        "empty": frozenset(),
        "one_row": frozenset(((5, 6), (5, 12))),
        "direct_core": frozenset((
            (point_q, point_u),
            (point_q, point_y),
            (point_v, point_u),
            (point_v, point_y),
        )),
        "transitive_core": frozenset((
            (5, 6),
            (5, 12),
            (6, 3),
            (6, 12),
            (12, 3),
            (12, 6),
        )),
    }
    expected = {
        "empty": "sat",
        "one_row": "sat",
        "direct_core": "unsat",
        "transitive_core": "unsat",
    }
    results = {}
    for name, atoms in cases.items():
        source_result = z3_status(order, atoms)
        cnf_result, digest = cadical_status(
            args.output_dir / f"{name}.cnf",
            next_var - 1,
            clauses,
            selected,
            atoms,
            args.timeout,
        )
        if source_result != expected[name] or cnf_result != source_result:
            raise AssertionError(
                f"{name}: expected {expected[name]}, "
                f"Z3={source_result}, CaDiCaL={cnf_result}"
            )
        results[name] = {
            "selected_atoms": [list(atom) for atom in sorted(atoms)],
            "z3": source_result,
            "cadical": cnf_result,
            "cnf_sha256": digest,
        }

    report = {
        "schema": "p97-transitive-two-circle-direct-cnf-crosscheck-v1",
        "status": "PASS",
        "order": list(order),
        "variables": next_var - 1,
        "clauses_before_pins": len(clauses),
        "clause_blocks": {
            "selected_equalities": len(equalities),
            "xor_definitions": len(xor_definitions),
            "obstructions": len(obstructions),
            "five_point_obstructions_validated_separately": len(
                five_point_obstructions
            ),
        },
        "metadata": metadata,
        "cases": results,
        "source_hashes": {
            "source_runner": export.sha256(
                export.HERE / "exact17_source_faithful_cegar.py"
            ),
            "direct_exporter": export.sha256(
                export.HERE / "export_source_faithful_boolean_cnf.py"
            ),
            "validator": export.sha256(Path(__file__).resolve()),
        },
    }
    report_path = args.output_dir / "report.json"
    report_path.write_text(json.dumps(report, indent=2, sort_keys=True) + "\n")
    print(json.dumps({
        "report": str(report_path),
        "status": report["status"],
        "variables": report["variables"],
        "clauses": report["clauses_before_pins"],
        "cases": {name: item["cadical"] for name, item in results.items()},
    }, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
