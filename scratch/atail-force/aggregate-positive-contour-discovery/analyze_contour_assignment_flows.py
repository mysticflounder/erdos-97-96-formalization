#!/usr/bin/env python3
"""Decompose every exact contour into alternating assignment circulations.

The row part of a contour is a signed multiset of selected incidences
``center -> target``.  Exact Kalmanson cancellation forces both its row sums
and target sums to vanish.  Hence its positive and negative incidences have
the same row and target multiplicities and decompose into alternating
assignment circuits.

This script performs that decomposition deterministically, replays it over
the integers, and evaluates the circular-interval flux of each component and
of their sum.  It distinguishes a single comparable assignment pair from a
genuinely coupled sum of individually mixed pairs.

The result is an exact audit of stored certificates, not a uniform extraction
proof and not a Lean proof.
"""

from __future__ import annotations

import argparse
import collections
import json
from pathlib import Path
from typing import Any


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
DEFAULT_AUDIT = HERE / "core_bank_small_contour_audit.json"
DEFAULT_BANK = (
    HERE.parent
    / "exact6-allcenter-capaware-gate"
    / "combined_round1_round2_minimized_schema_bank.json"
)
DEFAULT_OUTPUT = HERE / "contour_assignment_flow_audit.json"
SCHEMA = "p97-atail-contour-assignment-flow-audit-v1"

Incidence = tuple[int, int]
Flow = dict[Incidence, int]


def repository_path(path: Path) -> str:
    """Serialize a stable repository-relative artifact path."""

    return str(path.resolve().relative_to(ROOT))


def parse_constraint(name: str) -> tuple[str, tuple[int, ...]]:
    fields = name.split("_")
    return fields[0], tuple(map(int, fields[1:]))


def row_flow(contour: dict[str, Any]) -> Flow:
    answer: collections.Counter[Incidence] = collections.Counter()
    for name, multiplier in contour["multipliers"].items():
        kind, labels = parse_constraint(name)
        if kind != "row":
            continue
        center, left, right = labels
        answer[center, right] += multiplier
        answer[center, left] -= multiplier
    return {item: value for item, value in answer.items() if value}


def balance(flow: Flow, coordinate: int) -> dict[int, int]:
    answer: collections.Counter[int] = collections.Counter()
    for incidence, coefficient in flow.items():
        answer[incidence[coordinate]] += coefficient
    return {item: value for item, value in answer.items() if value}


def add_flow(total: collections.Counter[Incidence], flow: Flow) -> None:
    total.update(flow)


def alternating_circuits(flow: Flow) -> list[dict[str, Any]]:
    positive: list[Incidence] = []
    negative: list[Incidence] = []
    for incidence, coefficient in sorted(flow.items()):
        destination = positive if coefficient > 0 else negative
        destination.extend([incidence] * abs(coefficient))

    positive_at_target: dict[int, list[int]] = collections.defaultdict(list)
    negative_at_target: dict[int, list[int]] = collections.defaultdict(list)
    positive_at_center: dict[int, list[int]] = collections.defaultdict(list)
    negative_at_center: dict[int, list[int]] = collections.defaultdict(list)
    for index, (center, target) in enumerate(positive):
        positive_at_target[target].append(index)
        positive_at_center[center].append(index)
    for index, (center, target) in enumerate(negative):
        negative_at_target[target].append(index)
        negative_at_center[center].append(index)

    if {key: len(value) for key, value in positive_at_target.items()} != {
        key: len(value) for key, value in negative_at_target.items()
    }:
        raise AssertionError("target multiplicities are not balanced")
    if {key: len(value) for key, value in positive_at_center.items()} != {
        key: len(value) for key, value in negative_at_center.items()
    }:
        raise AssertionError("row multiplicities are not balanced")

    positive_to_negative = {
        positive_index: negative_index
        for target in positive_at_target
        for positive_index, negative_index in zip(
            positive_at_target[target], negative_at_target[target], strict=True
        )
    }
    negative_to_positive = {
        negative_index: positive_index
        for center in negative_at_center
        for negative_index, positive_index in zip(
            negative_at_center[center], positive_at_center[center], strict=True
        )
    }

    seen: set[int] = set()
    result = []
    for start in range(len(positive)):
        if start in seen:
            continue
        positive_edges = []
        negative_edges = []
        cursor = start
        while cursor not in seen:
            seen.add(cursor)
            negative_index = positive_to_negative[cursor]
            positive_edges.append(positive[cursor])
            negative_edges.append(negative[negative_index])
            cursor = negative_to_positive[negative_index]
        component: collections.Counter[Incidence] = collections.Counter(positive_edges)
        component.subtract(negative_edges)
        component_flow = {item: value for item, value in component.items() if value}
        if balance(component_flow, 0) or balance(component_flow, 1):
            raise AssertionError("alternating component is not balanced")
        centers = [center for center, _ in positive_edges]
        targets = [target for _, target in positive_edges]
        result.append(
            {
                "length": len(positive_edges),
                "positive_assignments": [list(item) for item in positive_edges],
                "negative_assignments": [list(item) for item in negative_edges],
                "simple": (
                    len(set(centers)) == len(centers)
                    and len(set(targets)) == len(targets)
                ),
                "flow": {
                    f"{center},{target}": coefficient
                    for (center, target), coefficient in sorted(component_flow.items())
                },
            }
        )

    replay: collections.Counter[Incidence] = collections.Counter()
    for component in result:
        for label, coefficient in component["flow"].items():
            center, target = map(int, label.split(","))
            replay[center, target] += coefficient
    if {item: value for item, value in replay.items() if value} != flow:
        raise AssertionError("alternating-circuit decomposition does not replay")
    return result


def interval_fluxes(flow: Flow, vertices: tuple[int, ...]) -> tuple[int, ...]:
    answer = []
    n = len(vertices)
    for length in range(2, n - 1):
        for start in range(n):
            interval = {vertices[(start + offset) % n] for offset in range(length)}
            answer.append(
                sum(
                    coefficient
                    for (center, target), coefficient in flow.items()
                    if center in interval and target not in interval
                )
            )
    return tuple(answer)


def flux_summary(flow: Flow, vertices: tuple[int, ...]) -> dict[str, Any]:
    fluxes = interval_fluxes(flow, vertices)
    minimum, maximum = min(fluxes), max(fluxes)
    one_signed = (minimum >= 0 and maximum > 0) or (
        maximum <= 0 and minimum < 0
    )
    return {
        "minimum": minimum,
        "maximum": maximum,
        "one_signed_nonzero": one_signed,
    }


def decode_flow(encoded: dict[str, int]) -> Flow:
    return {
        tuple(map(int, label.split(","))): coefficient
        for label, coefficient in encoded.items()
    }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--audit", type=Path, default=DEFAULT_AUDIT)
    parser.add_argument("--bank", type=Path, default=DEFAULT_BANK)
    parser.add_argument("--output", type=Path, default=DEFAULT_OUTPUT)
    args = parser.parse_args()

    audit = json.loads(args.audit.read_text(encoding="utf-8"))
    bank = json.loads(args.bank.read_text(encoding="utf-8"))
    if len(audit["records"]) != len(bank["schemas"]):
        raise SystemExit("audit and source bank have different record counts")

    records = []
    for audit_record, schema in zip(audit["records"], bank["schemas"], strict=True):
        schema_index = audit_record["schema_index"]
        core = schema["provenance"][0]["minimal_core"]
        vertices = tuple(
            sorted(
                {
                    vertex
                    for name in core
                    for vertex in parse_constraint(name)[1]
                }
            )
        )
        flow = row_flow(audit_record["contour"])
        if balance(flow, 0) or balance(flow, 1):
            raise AssertionError(f"schema {schema_index} has unbalanced contour")
        aggregate_flux = flux_summary(flow, vertices)
        if not aggregate_flux["one_signed_nonzero"]:
            raise AssertionError(f"schema {schema_index} aggregate is not one-signed")
        components = alternating_circuits(flow)
        for component in components:
            component["flux"] = flux_summary(decode_flow(component["flow"]), vertices)
        records.append(
            {
                "schema_index": schema_index,
                "active_vertex_count": len(vertices),
                "active_vertices": list(vertices),
                "assignment_unit_count": sum(
                    coefficient for coefficient in flow.values() if coefficient > 0
                ),
                "aggregate_flux": aggregate_flux,
                "component_count": len(components),
                "one_signed_component_count": sum(
                    component["flux"]["one_signed_nonzero"]
                    for component in components
                ),
                "one_signed_simple_component_count": sum(
                    component["simple"]
                    and component["flux"]["one_signed_nonzero"]
                    for component in components
                ),
                "components": components,
            }
        )

    payload = {
        "schema": SCHEMA,
        "epistemic_status": "EXACT_INTEGER_REPLAY_OF_STORED_CONTOURS_NOT_UNIFORM_COVERAGE",
        "source_audit": repository_path(args.audit),
        "source_bank": repository_path(args.bank),
        "record_count": len(records),
        "component_count_histogram": dict(
            sorted(collections.Counter(r["component_count"] for r in records).items())
        ),
        "assignment_unit_count_histogram": dict(
            sorted(
                collections.Counter(r["assignment_unit_count"] for r in records).items()
            )
        ),
        "single_component_count": sum(r["component_count"] == 1 for r in records),
        "two_component_count": sum(r["component_count"] == 2 for r in records),
        "single_simple_component_count": sum(
            r["component_count"] == 1 and r["components"][0]["simple"]
            for r in records
        ),
        "coupled_only_for_this_decomposition_count": sum(
            r["component_count"] > 1 and r["one_signed_component_count"] == 0
            for r in records
        ),
        "records": records,
    }
    args.output.write_text(
        json.dumps(payload, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )
    print(json.dumps({key: value for key, value in payload.items() if key != "records"}, indent=2))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
