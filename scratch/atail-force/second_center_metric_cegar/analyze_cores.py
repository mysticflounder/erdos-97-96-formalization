#!/usr/bin/env python3
"""Canonical incidence-shape and distinguished-collapse analysis of CEGAR cuts."""

from __future__ import annotations

import argparse
import hashlib
import itertools
import json
import math
import sys
from collections import defaultdict
from pathlib import Path
from typing import Any, Mapping, Sequence

import sympy as sp


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))
if str(HERE) not in sys.path:
    sys.path.insert(0, str(HERE))

import cegar  # noqa: E402


SCHEMA = "p97-atail-second-center-core-analysis-v2"
DEFAULT_OUTPUT = HERE / "core_analysis.json"
CANONICAL_PERMUTATION_CAP = 1_000_000
COLLAPSE_TIMEOUT_S = 6.0


def _sha(value: object) -> str:
    return cegar.canonical_sha256(value)


def _digest(parts: object) -> str:
    return hashlib.sha256(repr(parts).encode()).hexdigest()


def active_points(rows: Sequence[cegar.metric_oracle.MetricRow]) -> tuple[int, ...]:
    return tuple(
        sorted(
            {row.center for row in rows}
            | {point for row in rows for point in row.support}
        )
    )


def refined_point_colors(
    rows: Sequence[cegar.metric_oracle.MetricRow], *, preserve_01: bool
) -> dict[int, str]:
    points = active_points(rows)
    if preserve_01:
        colors = {
            point: ("P0" if point == 0 else "P1" if point == 1 else "P")
            for point in points
        }
    else:
        colors = {point: "P" for point in points}
    for _ in range(len(points) + len(rows) + 1):
        row_colors = [
            _digest(
                (
                    "ROW",
                    colors[row.center],
                    tuple(sorted(colors[point] for point in row.support)),
                )
            )
            for row in rows
        ]
        next_colors: dict[int, str] = {}
        for point in points:
            centered = sorted(
                row_colors[index]
                for index, row in enumerate(rows)
                if row.center == point
            )
            supported = sorted(
                row_colors[index]
                for index, row in enumerate(rows)
                if point in row.support
            )
            next_colors[point] = _digest(
                ("POINT", colors[point], tuple(centered), tuple(supported))
            )
        colors = next_colors
    return colors


def wl_signature(
    rows: Sequence[cegar.metric_oracle.MetricRow], *, preserve_01: bool
) -> str:
    colors = refined_point_colors(rows, preserve_01=preserve_01)
    row_colors = sorted(
        _digest(
            (
                "ROW",
                colors[row.center],
                tuple(sorted(colors[point] for point in row.support)),
            )
        )
        for row in rows
    )
    return _sha(
        {
            "point_colors": sorted(colors.values()),
            "row_colors": row_colors,
            "preserve_01": preserve_01,
        }
    )


def transformed_encoding(
    rows: Sequence[cegar.metric_oracle.MetricRow], mapping: Mapping[int, int]
) -> tuple[str, ...]:
    return tuple(
        sorted(
            f"{mapping[row.center]}:"
            + ",".join(
                str(point) for point in sorted(mapping[value] for value in row.support)
            )
            for row in rows
        )
    )


def canonical_incidence_signature(
    rows: Sequence[cegar.metric_oracle.MetricRow], *, preserve_01: bool
) -> dict[str, Any]:
    colors = refined_point_colors(rows, preserve_01=preserve_01)
    classes: dict[str, list[int]] = defaultdict(list)
    for point, color in colors.items():
        classes[color].append(point)
    ordered_classes = [
        tuple(sorted(classes[color])) for color in sorted(classes)
    ]
    permutation_count = math.prod(
        math.factorial(len(point_class)) for point_class in ordered_classes
    )
    if permutation_count > CANONICAL_PERMUTATION_CAP:
        return {
            "status": "WL_ONLY_PERMUTATION_CAP",
            "wl_sha256": wl_signature(rows, preserve_01=preserve_01),
            "permutation_count": permutation_count,
        }
    target_blocks: list[tuple[int, ...]] = []
    offset = 0
    for point_class in ordered_classes:
        target_blocks.append(tuple(range(offset, offset + len(point_class))))
        offset += len(point_class)
    best: tuple[str, ...] | None = None
    for block_permutations in itertools.product(
        *(
            tuple(itertools.permutations(target))
            for target in target_blocks
        )
    ):
        mapping = {
            source: target
            for point_class, targets in zip(ordered_classes, block_permutations)
            for source, target in zip(point_class, targets)
        }
        encoded = transformed_encoding(rows, mapping)
        if best is None or encoded < best:
            best = encoded
    assert best is not None
    return {
        "status": "EXACT_CANONICAL",
        "canonical_sha256": _sha(best),
        "canonical_rows": list(best),
        "wl_sha256": wl_signature(rows, preserve_01=preserve_01),
        "permutation_count": permutation_count,
    }


def translation_pinned_system(
    rows: Sequence[cegar.metric_oracle.MetricRow], n: int = 12
) -> tuple[tuple[str, ...], tuple[str, ...]]:
    variables = tuple(
        sp.symbols(f"u{point}x u{point}y")
        for point in range(1, n)
    )
    flat_variables = tuple(value for pair in variables for value in pair)
    points: tuple[tuple[sp.Expr, sp.Expr], ...] = (
        (sp.Integer(0), sp.Integer(0)),
        *variables,
    )

    def distance(left: int, right: int) -> sp.Expr:
        return sp.expand(
            (points[left][0] - points[right][0]) ** 2
            + (points[left][1] - points[right][1]) ** 2
        )

    expressions: list[sp.Expr] = []
    for row in rows:
        pivot = row.support[0]
        pivot_distance = distance(row.center, pivot)
        expressions.extend(
            sp.expand(pivot_distance - distance(row.center, point))
            for point in row.support[1:]
        )
    slack = sp.Symbol("collapse_slack")
    distinguished_squared_distance = sp.expand(
        points[1][0] ** 2 + points[1][1] ** 2
    )
    expressions.append(sp.expand(slack * distinguished_squared_distance - 1))
    all_variables = (*flat_variables, slack)
    polynomials = tuple(
        cegar.metric_oracle.serialize_poly(
            sp.Poly(expression, *all_variables, domain=sp.QQ)
        )
        for expression in expressions
    )
    return tuple(str(variable) for variable in all_variables), polynomials


def collapse_crosscheck(
    rows: Sequence[cegar.metric_oracle.MetricRow]
) -> dict[str, Any]:
    variables, polynomials = translation_pinned_system(rows)
    singular = cegar.metric_oracle.run_singular(
        variables, polynomials, timeout_s=COLLAPSE_TIMEOUT_S
    )
    msolve_forward = cegar.metric_oracle.run_msolve(
        variables, polynomials, timeout_s=COLLAPSE_TIMEOUT_S
    )
    msolve_reverse = cegar.metric_oracle.run_msolve(
        tuple(reversed(variables)), polynomials, timeout_s=COLLAPSE_TIMEOUT_S
    )
    verdicts = [
        singular.verdict,
        msolve_forward.verdict,
        msolve_reverse.verdict,
    ]
    status = (
        "CROSSCHECKED_FORCED_ZERO_SQUARED_DISTANCE"
        if verdicts == ["UNIT", "UNIT", "UNIT"]
        else "UNDECIDED_FAIL_CLOSED"
    )
    return {
        "status": status,
        "distinguished_pair": [0, 1],
        "verdicts_singular_msolve_forward_reverse": verdicts,
        "real_consequence": (
            "POINT_0_EQUALS_POINT_1"
            if status == "CROSSCHECKED_FORCED_ZERO_SQUARED_DISTANCE"
            else "UNDECIDED"
        ),
        "complex_consequence": (
            "SQUARED_SEPARATION_0_1_IS_ZERO_NOT_LITERAL_POINT_EQUALITY"
            if status == "CROSSCHECKED_FORCED_ZERO_SQUARED_DISTANCE"
            else "UNDECIDED"
        ),
        "expanded_rabinowitsch_system_sha256": _sha(list(polynomials)),
    }


def collapse_not_run(
    rows: Sequence[cegar.metric_oracle.MetricRow],
) -> dict[str, Any]:
    _variables, polynomials = translation_pinned_system(rows)
    return {
        "status": "NOT_RUN_CANONICAL_ONLY",
        "distinguished_pair": [0, 1],
        "verdicts_singular_msolve_forward_reverse": ["NOT_RUN"] * 3,
        "real_consequence": "UNDECIDED",
        "complex_consequence": "UNDECIDED",
        "expanded_rabinowitsch_system_sha256": _sha(list(polynomials)),
    }


def core_records(checkpoint: Mapping[str, object]) -> list[dict[str, Any]]:
    records: list[dict[str, Any]] = []
    for case in checkpoint["cases"]:
        profile = list(case["profile"])
        records.append(
            {
                "profile": profile,
                "origin": "bootstrap",
                "round": None,
                "cut": case["bootstrap_cut"],
            }
        )
        records.extend(
            {
                "profile": profile,
                "origin": "learned",
                "round": int(row["round"]),
                "cut": row["accepted_cut"],
            }
            for row in case["rounds"]
            if "accepted_cut" in row
        )
    return records


def group_members(cores: Sequence[Mapping[str, object]], field: str) -> list[dict[str, Any]]:
    grouped: dict[str, list[dict[str, Any]]] = defaultdict(list)
    canonical_rows: dict[str, list[str]] = {}
    for core in cores:
        signature = core[field]
        key = signature.get("canonical_sha256", signature["wl_sha256"])
        grouped[key].append(
            {
                "profile": core["profile"],
                "origin": core["origin"],
                "round": core["round"],
                "row_count": core["row_count"],
            }
        )
        if "canonical_rows" in signature:
            canonical_rows[key] = signature["canonical_rows"]
    return [
        {
            "signature_sha256": key,
            "multiplicity": len(members),
            "members": members,
            "canonical_rows": canonical_rows.get(key),
        }
        for key, members in sorted(grouped.items())
    ]


def core_identity(core: Mapping[str, object]) -> dict[str, Any]:
    return {
        "profile": core["profile"],
        "origin": core["origin"],
        "round": core["round"],
    }


def five_row_motif_summary(
    cores: Sequence[Mapping[str, object]],
) -> dict[str, Any]:
    five_row = [core for core in cores if int(core["row_count"]) == 5]
    distinguished_signatures = [
        str(core["distinguished_01_incidence"]["canonical_sha256"])
        for core in five_row
    ]
    free_signatures = [
        str(core["free_relabeling_incidence"]["canonical_sha256"])
        for core in five_row
    ]

    literal_intersections: list[dict[str, Any]] = []
    for left, right in itertools.combinations(five_row, 2):
        shared = sorted(set(left["rows"]) & set(right["rows"]))
        literal_intersections.append(
            {
                "left": core_identity(left),
                "right": core_identity(right),
                "shared_row_count": len(shared),
                "shared_rows": shared,
            }
        )
    largest_literal = max(
        (int(record["shared_row_count"]) for record in literal_intersections),
        default=0,
    )

    # This is the fixed-label hinge visible in every five-row cut: the row
    # centered at distinguished point 1 contains both 0 and 2, while the row
    # centered at point 2 contains both distinguished points 0 and 1.
    hinge_instances: list[dict[str, Any]] = []
    for core in five_row:
        rows = {
            row.center: row
            for row in (
                cegar.decode_metric_row(value) for value in core["rows"]
            )
        }
        if (
            1 in rows
            and 2 in rows
            and {0, 2} <= set(rows[1].support)
            and {0, 1} <= set(rows[2].support)
        ):
            hinge_instances.append(core_identity(core))

    return {
        "core_count": len(five_row),
        "distinct_exact_types_preserving_0_and_1": len(
            set(distinguished_signatures)
        ),
        "repeated_exact_types_preserving_0_and_1": len(
            distinguished_signatures
        )
        - len(set(distinguished_signatures)),
        "distinct_exact_types_under_free_point_relabeling": len(
            set(free_signatures)
        ),
        "repeated_exact_types_under_free_point_relabeling": len(free_signatures)
        - len(set(free_signatures)),
        "largest_literal_shared_row_backbone": {
            "row_count": largest_literal,
            "pairs": [
                record
                for record in literal_intersections
                if int(record["shared_row_count"]) == largest_literal
            ],
            "note": (
                "Literal means the original card-12 labels are fixed; this is "
                "not an additional isomorphism claim."
            ),
        },
        "recurring_distinguished_hinge": {
            "description": (
                "row(center=1) supports {0,2}; row(center=2) supports {0,1}"
            ),
            "multiplicity": len(hinge_instances),
            "members": hinge_instances,
        },
    }


def analyze(
    checkpoint: Mapping[str, object],
    *,
    checkpoint_sha256: str,
    saved_collapse_evidence: Mapping[str, Mapping[str, object]] | None = None,
    run_collapse_probes: bool = True,
) -> dict[str, Any]:
    cores: list[dict[str, Any]] = []
    collapse_cache: dict[str, dict[str, Any]] = {}
    for record in core_records(checkpoint):
        cut = record["cut"]
        rows = tuple(cegar.decode_metric_row(value) for value in cut["rows"])
        distinguished = canonical_incidence_signature(rows, preserve_01=True)
        free = canonical_incidence_signature(rows, preserve_01=False)
        distinguished_key = distinguished.get(
            "canonical_sha256", distinguished["wl_sha256"]
        )
        if distinguished_key not in collapse_cache:
            if saved_collapse_evidence is None:
                collapse_cache[distinguished_key] = (
                    collapse_crosscheck(rows)
                    if run_collapse_probes
                    else collapse_not_run(rows)
                )
            else:
                saved_collapse = dict(saved_collapse_evidence[distinguished_key])
                _variables, polynomials = translation_pinned_system(rows)
                if saved_collapse["expanded_rabinowitsch_system_sha256"] != _sha(
                    list(polynomials)
                ):
                    raise AssertionError("saved collapse-system hash drift")
                verdicts = list(
                    saved_collapse[
                        "verdicts_singular_msolve_forward_reverse"
                    ]
                )
                if saved_collapse["status"] == (
                    "CROSSCHECKED_FORCED_ZERO_SQUARED_DISTANCE"
                ):
                    if verdicts != ["UNIT", "UNIT", "UNIT"]:
                        raise AssertionError("invalid saved positive collapse evidence")
                elif saved_collapse["status"] == "UNDECIDED_FAIL_CLOSED":
                    if "TIMEOUT" not in verdicts:
                        raise AssertionError("saved undecided collapse lacks a timeout")
                elif saved_collapse["status"] == "NOT_RUN_CANONICAL_ONLY":
                    if verdicts != ["NOT_RUN", "NOT_RUN", "NOT_RUN"]:
                        raise AssertionError("invalid saved canonical-only evidence")
                else:
                    raise AssertionError("unknown saved collapse status")
                collapse_cache[distinguished_key] = saved_collapse
        cores.append(
            {
                "profile": record["profile"],
                "origin": record["origin"],
                "round": record["round"],
                "row_count": len(rows),
                "rows": cegar.encode_metric_rows(rows),
                "distinguished_01_incidence": distinguished,
                "free_relabeling_incidence": free,
                "collapse_01": collapse_cache[distinguished_key],
            }
        )
    distinguished_groups = group_members(cores, "distinguished_01_incidence")
    free_groups = group_members(cores, "free_relabeling_incidence")
    collapse_counts = {
        status: sum(core["collapse_01"]["status"] == status for core in cores)
        for status in (
            "CROSSCHECKED_FORCED_ZERO_SQUARED_DISTANCE",
            "UNDECIDED_FAIL_CLOSED",
            "NOT_RUN_CANONICAL_ONLY",
        )
    }
    summary = {
        "distinct_groups_preserving_0_and_1": len(distinguished_groups),
        "repeated_groups_preserving_0_and_1": sum(
            group["multiplicity"] > 1 for group in distinguished_groups
        ),
        "distinct_groups_under_free_point_relabeling": len(free_groups),
        "repeated_groups_under_free_point_relabeling": sum(
            group["multiplicity"] > 1 for group in free_groups
        ),
        "all_cores_crosschecked_force_real_0_1_collapse": all(
            core["collapse_01"]["status"]
            == "CROSSCHECKED_FORCED_ZERO_SQUARED_DISTANCE"
            for core in cores
        ),
        "crosschecked_force_zero_squared_distance_count": collapse_counts[
            "CROSSCHECKED_FORCED_ZERO_SQUARED_DISTANCE"
        ],
        "undecided_fail_closed_collapse_count": collapse_counts[
            "UNDECIDED_FAIL_CLOSED"
        ],
        "epistemic_note": (
            "Real zero squared distance forces point equality; over complex "
            "coordinates it permits a nonzero isotropic separation."
        ),
    }
    if collapse_counts["NOT_RUN_CANONICAL_ONLY"]:
        summary["collapse_probe_not_run_count"] = collapse_counts[
            "NOT_RUN_CANONICAL_ONLY"
        ]
    return {
        "schema": SCHEMA,
        "cegar_checkpoint_sha256": checkpoint_sha256,
        "core_count": len(cores),
        "cores": cores,
        "groups_preserving_0_and_1": distinguished_groups,
        "groups_under_free_point_relabeling": free_groups,
        "five_row_motifs": five_row_motif_summary(cores),
        "summary": summary,
        "scope": {
            "exact_canonicalization_when_below_permutation_cap": True,
            "canonical_permutation_cap": CANONICAL_PERMUTATION_CAP,
            "collapse_forcing_singular_and_msolve_two_orders": (
                collapse_counts["NOT_RUN_CANONICAL_ONLY"] == 0
            ),
            "target_faithful": False,
            "producer_proved": False,
        },
    }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path, default=DEFAULT_OUTPUT)
    parser.add_argument(
        "--checkpoint",
        type=Path,
        default=cegar.CHECKPOINT,
        help="CEGAR checkpoint to analyze (default: checkpoint.json)",
    )
    parser.add_argument("--check", action="store_true")
    parser.add_argument(
        "--skip-collapse",
        action="store_true",
        help="canonicalize cores and hash collapse systems without running CAS",
    )
    args = parser.parse_args()
    checkpoint = json.loads(args.checkpoint.read_text(encoding="utf-8"))
    saved_document: dict[str, Any] | None = None
    saved_evidence: dict[str, Mapping[str, object]] | None = None
    if args.check:
        saved_document = json.loads(args.output.read_text(encoding="utf-8"))
        saved_evidence = {
            str(core["distinguished_01_incidence"]["canonical_sha256"]): core[
                "collapse_01"
            ]
            for core in saved_document["cores"]
        }
    document = analyze(
        checkpoint,
        checkpoint_sha256=cegar.file_sha256(args.checkpoint),
        saved_collapse_evidence=saved_evidence,
        run_collapse_probes=not args.skip_collapse,
    )
    rendered = json.dumps(document, indent=2, sort_keys=True) + "\n"
    if args.check:
        if saved_document != document:
            raise AssertionError("core-analysis checkpoint drift")
    else:
        args.output.write_text(rendered, encoding="utf-8")
    print(
        json.dumps(
            {
                "output": str(args.output),
                "sha256": cegar.file_sha256(args.output),
                "summary": document["summary"],
            },
            indent=2,
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
