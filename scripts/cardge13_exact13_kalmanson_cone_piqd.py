# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under GPL-3.0-or-later as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Test arbitrary-length Kalmanson cancellation in a fixed exact-13 cell."""

from __future__ import annotations

import argparse
import hashlib
import json
from pathlib import Path

import cardge13_exact13_fixed_base_k4_scan as scan

SCHEMA = "cardge13-exact13-kalmanson-cone-piqd/v1"
Rows = tuple[tuple[int, tuple[int, ...]], ...]


def validate_cell(center: int, support: tuple[int, ...]) -> None:
    if center not in scan.core.LABELS:
        raise ValueError("center must be a Fin-13 label")
    if len(support) != 4 or len(set(support)) != 4:
        raise ValueError("support must contain four distinct labels")
    if any(point not in scan.core.LABELS for point in support):
        raise ValueError("support must use Fin-13 labels")
    if center in support:
        raise ValueError("support must omit its center")


def projected_forms(
    center: int, support: tuple[int, ...]
) -> tuple[tuple[scan.Form, scan.Vector], ...]:
    validate_cell(center, support)
    return projected_forms_for_rows(((center, support),))


def projected_forms_for_rows(rows: Rows) -> tuple[tuple[scan.Form, scan.Vector], ...]:
    classes = scan.EdgeClasses()
    for center, support in scan.FIXED_ROWS + rows:
        validate_cell(center, support)
        anchor = scan.edge(center, support[0])
        for point in support[1:]:
            classes.union(anchor, scan.edge(center, point))
    first_by_vector: dict[scan.Vector, scan.Form] = {}
    for form, vector in scan.FORMS:
        projected = scan.project(vector, classes)
        first_by_vector.setdefault(projected, form)
    return tuple((form, vector) for vector, form in first_by_vector.items())


def _sum(terms: list[str]) -> str:
    if not terms:
        return "0"
    if len(terms) == 1:
        return terms[0]
    return f"(+ {' '.join(terms)})"


def build_commands(center: int, support: tuple[int, ...]) -> tuple[str, ...]:
    validate_cell(center, support)
    return build_commands_for_rows(((center, support),))


def build_commands_for_rows(rows: Rows) -> tuple[str, ...]:
    forms = projected_forms_for_rows(rows)
    commands = ["(set-logic QF_LRA)"]
    weights = [f"w_{index}" for index in range(len(forms))]
    for weight in weights:
        commands.extend(
            (f"(declare-const {weight} Real)", f"(assert (>= {weight} 0))")
        )
    commands.append(f"(assert (= {_sum(weights)} 1))")
    coordinates = sorted(
        {edge for _form, vector in forms for edge, _coefficient in vector}
    )
    for edge in coordinates:
        terms = []
        for index, (_form, vector) in enumerate(forms):
            coefficient = dict(vector).get(edge)
            if coefficient is not None:
                terms.append(f"(* {coefficient} w_{index})")
        commands.append(f"(assert (= {_sum(terms)} 0))")
    return tuple(commands)


def rows_event_binding(path: Path) -> tuple[Rows, dict[str, object]]:
    payload = json.loads(path.read_text())
    if payload.get("schema") != scan.SCHEMA:
        raise AssertionError("unexpected all-center event schema")
    expected_source = scan.source_model_binding(scan.DEFAULT_SOURCE_EVENT)
    if payload.get("source_model_binding") != expected_source:
        raise AssertionError("all-center event source binding drifted")
    centers = payload.get("centers")
    if not isinstance(centers, list):
        raise TypeError("all-center event centers must be an array")
    expected_rows = scan.candidate_all_center_rows(expected_source, centers)
    candidate = payload.get("all_center_candidate")
    if not isinstance(candidate, dict):
        raise TypeError("all-center event candidate must be an object")
    raw_rows = candidate.get("rows")
    if not isinstance(raw_rows, list):
        raise TypeError("all-center event candidate rows must be an array")
    rows: list[tuple[int, tuple[int, ...]]] = []
    for row in raw_rows:
        if not isinstance(row, dict):
            raise TypeError("all-center event row must be an object")
        center = row.get("center")
        support = row.get("support")
        if not isinstance(center, int) or not isinstance(support, list):
            raise TypeError("all-center event row has malformed center or support")
        parsed_support = tuple(int(point) for point in support)
        validate_cell(center, parsed_support)
        rows.append((center, parsed_support))
    result = tuple(rows)
    if result != expected_rows:
        raise AssertionError("all-center event candidate rows drifted")
    return result, {
        "path": str(path),
        "sha256": hashlib.sha256(path.read_bytes()).hexdigest(),
        "source_model_binding": expected_source,
        "rows": raw_rows,
    }


def parse_support(value: str) -> tuple[int, ...]:
    try:
        support = tuple(int(item) for item in value.split(","))
    except ValueError as error:
        raise argparse.ArgumentTypeError(
            "support must be comma-separated integers"
        ) from error
    if len(support) != 4:
        raise argparse.ArgumentTypeError("support must contain four labels")
    return support


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--center", type=int)
    parser.add_argument("--support", type=parse_support)
    parser.add_argument("--rows-event", type=Path)
    parser.add_argument("--out", type=Path, required=True)
    parser.add_argument("--event", type=Path, required=True)
    parser.add_argument("--solver", action="append", choices=("z3", "cvc5"))
    parser.add_argument("--timeout-ms", type=int, default=120_000)
    args = parser.parse_args()

    if args.rows_event is not None:
        if args.center is not None or args.support is not None:
            raise ValueError("--rows-event cannot be combined with --center/--support")
        rows, event_binding = rows_event_binding(args.rows_event)
        source_binding = event_binding["source_model_binding"]
        center = None
        support = None
    else:
        if args.center is None or args.support is None:
            raise ValueError("provide --rows-event or both --center and --support")
        validate_cell(args.center, args.support)
        rows = ((args.center, args.support),)
        event_binding = None
        source_binding = scan.source_model_binding(scan.DEFAULT_SOURCE_EVENT)
        center = args.center
        support = args.support
    forms = projected_forms_for_rows(rows)
    commands = build_commands_for_rows(rows)
    journal = ("\n".join(commands) + "\n").encode("ascii")
    args.out.parent.mkdir(parents=True, exist_ok=True)
    args.out.write_bytes(journal)
    report = {
        "schema": SCHEMA,
        "claim_boundary": (
            "nonnegative rational cone generated by strict Kalmanson forms after "
            "quotienting distance edges by one authenticated fixed five-row cell "
            "and one selected challenge support; formula-scoped only"
        ),
        "source_model_binding": source_binding,
        "rows_event_binding": event_binding,
        "rows": [
            {"center": row_center, "support": list(row_support)}
            for row_center, row_support in rows
        ],
        "center": center,
        "support": list(support) if support is not None else None,
        "forms": [list(form) for form, _vector in forms],
        "projected_vectors": [
            [[[left, right], coefficient] for (left, right), coefficient in vector]
            for _form, vector in forms
        ],
        "journal": str(args.out),
        "journal_sha256": hashlib.sha256(journal).hexdigest(),
        "command_count": len(commands),
        "solves": [],
    }
    if args.solver:
        report["solves"] = scan.core.run_piqd(
            args.out,
            commands,
            tuple(args.solver),
            args.timeout_ms,
            label=f"cardge13-exact13-kalmanson-cone-{len(rows)}-rows",
        )
    args.event.parent.mkdir(parents=True, exist_ok=True)
    args.event.write_text(json.dumps(report, indent=2, sort_keys=True) + "\n")
    print(
        json.dumps(
            {
                "form_count": len(forms),
                "journal_sha256": report["journal_sha256"],
                "statuses": [
                    row.get("solved", {}).get("status") for row in report["solves"]
                ],
            },
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
