#!/usr/bin/env python3
"""Independently replay a theorem-faithful two-cycle occurrence checkpoint."""

from __future__ import annotations

import argparse
import hashlib
import itertools
import json
from collections import defaultdict
from pathlib import Path


Distance = tuple[int, int]


def dist(left: int, right: int) -> Distance:
    return tuple(sorted((left, right)))  # type: ignore[return-value]


def shifted(order: list[int], cut: int) -> list[int]:
    return order[cut:] + order[:cut]


def reflection(size: int, schema: tuple[tuple[int, int], ...]) -> tuple[tuple[int, int], ...]:
    return tuple(sorted((size - 1 - center, size - 1 - member) for center, member in schema))


def rotate_schema(
    size: int, schema: tuple[tuple[int, int], ...], cut: int
) -> tuple[tuple[int, int], ...]:
    return tuple(sorted(((center - cut) % size, (member - cut) % size) for center, member in schema))


def comparison_records(order: list[int], rows: dict[int, set[int]]) -> list[tuple[object, ...]]:
    result: list[tuple[object, ...]] = []
    for positions in itertools.combinations(range(len(order)), 4):
        a, b, c, d = (order[position] for position in positions)
        if c in rows[a] and d in rows[a]:
            result.append(("diagonalEqSide", (a, b, c, d), dist(b, c), dist(b, d)))
        if a in rows[c] and d in rows[c]:
            result.append(("diagonalEqLastSide", (a, b, c, d), dist(a, b), dist(b, d)))
    return result


def equality_components(rows: dict[int, set[int]]) -> dict[Distance, int]:
    all_terms = list(itertools.combinations(sorted(rows), 2))
    adjacent: dict[Distance, set[Distance]] = defaultdict(set)
    for center, members in rows.items():
        terms = [dist(center, member) for member in members]
        for left in terms:
            adjacent[left].update(right for right in terms if right != left)
    component: dict[Distance, int] = {}
    component_id = 0
    for start in all_terms:
        if start in component:
            continue
        stack = [start]
        component[start] = component_id
        while stack:
            current = stack.pop()
            for target in adjacent[current]:
                if target not in component:
                    component[target] = component_id
                    stack.append(target)
        component_id += 1
    return component


def independent_raw_keys(
    n: int, cyclic_order: list[int], rows: dict[int, set[int]]
) -> list[tuple[object, ...]]:
    component = equality_components(rows)
    keys: list[tuple[object, ...]] = []
    for cut in range(n):
        comparisons = comparison_records(shifted(cyclic_order, cut), rows)
        buckets: dict[tuple[int, int], list[tuple[object, ...]]] = defaultdict(list)
        for record in comparisons:
            buckets[(component[record[2]], component[record[3]])].append(record)
        for classes, forwards in buckets.items():
            backwards = buckets.get((classes[1], classes[0]), [])
            for forward in forwards:
                for backward in backwards:
                    keys.append((cut, forward[0], forward[1], backward[0], backward[1]))
    return sorted(keys)


def replay_comparison(
    record: dict[str, object], chart_order: list[int], rows: dict[int, set[int]]
) -> None:
    quadruple = tuple(int(item) for item in record["ordered_quadruple"])
    positions = [chart_order.index(item) for item in quadruple]
    if not all(left < right for left, right in zip(positions, positions[1:])):
        raise AssertionError("comparison quadruple is not increasing in its common chart")
    a, b, c, d = quadruple
    constructor = record["constructor"]
    if constructor == "diagonalEqSide":
        expected_center, expected_members = a, (c, d)
        expected_left, expected_right = dist(b, c), dist(b, d)
    elif constructor == "diagonalEqLastSide":
        expected_center, expected_members = c, (a, d)
        expected_left, expected_right = dist(a, b), dist(b, d)
    else:
        raise AssertionError(f"unknown constructor {constructor!r}")
    if int(record["row_center"]) != expected_center:
        raise AssertionError("constructor row center mismatch")
    if tuple(int(item) for item in record["row_members"]) != expected_members:
        raise AssertionError("constructor row members mismatch")
    if not set(expected_members).issubset(rows[expected_center]):
        raise AssertionError("constructor membership is absent from the carrier")
    if tuple(record["left_distance"]) != expected_left or tuple(record["right_distance"]) != expected_right:
        raise AssertionError("constructor distance endpoint mismatch")


def replay_path(
    records: list[dict[str, object]],
    source: Distance,
    target: Distance,
    rows: dict[int, set[int]],
) -> set[tuple[int, int]]:
    current = source
    used: set[tuple[int, int]] = set()
    for record in records:
        record_source = tuple(record["source"])
        record_target = tuple(record["target"])
        center = int(record["center"])
        if record_source != current:
            raise AssertionError("equality path is discontinuous")
        if center not in record_source or center not in record_target:
            raise AssertionError("row equality does not have the recorded center")
        source_member = record_source[1] if record_source[0] == center else record_source[0]
        target_member = record_target[1] if record_target[0] == center else record_target[0]
        if source_member not in rows[center] or target_member not in rows[center]:
            raise AssertionError("row-equality path uses an absent membership")
        used.update(((center, source_member), (center, target_member)))
        current = record_target
    if current != target:
        raise AssertionError("equality path has the wrong endpoint")
    return used


def replay_witness(
    witness: dict[str, object], cyclic_order: list[int], rows: dict[int, set[int]]
) -> None:
    cut = int(witness["chart_cut_offset"])
    chart_order = shifted(cyclic_order, cut)
    if witness["chart_order"] != chart_order:
        raise AssertionError("chart rotation mismatch")
    forward = witness["forward"]
    backward = witness["backward"]
    replay_comparison(forward, chart_order, rows)
    replay_comparison(backward, chart_order, rows)

    used = {
        tuple(item)
        for record in (forward, backward)
        for item in record["memberships"]
    }
    used.update(
        replay_path(
            witness["left_identification_path"],
            tuple(forward["left_distance"]),
            tuple(backward["right_distance"]),
            rows,
        )
    )
    used.update(
        replay_path(
            witness["right_identification_path"],
            tuple(forward["right_distance"]),
            tuple(backward["left_distance"]),
            rows,
        )
    )
    recorded_memberships = {tuple(item) for item in witness["required_memberships"]}
    if used != recorded_memberships:
        raise AssertionError("required-membership set is not exact")

    quadruple_vertices = set(forward["ordered_quadruple"]) | set(backward["ordered_quadruple"])
    all_active = quadruple_vertices | {item for edge in used for item in edge}
    active = [vertex for vertex in cyclic_order if vertex in all_active]
    if witness["active_vertices_in_original_cyclic_order"] != active:
        raise AssertionError("active cyclic-role list mismatch")
    label = {vertex: index for index, vertex in enumerate(active)}
    schema = tuple(sorted((label[center], label[member]) for center, member in used))
    if [list(item) for item in schema] != witness["linear_order_schema"]:
        raise AssertionError("linear schema mismatch")

    size = len(active)
    bank_records = {
        min(rotated, reflection(size, rotated))
        for cut_role in range(size)
        for rotated in (rotate_schema(size, schema, cut_role),)
    }
    recorded_bank_records = {
        tuple(tuple(edge) for edge in record)
        for record in witness["reflection_canonical_bank_rotation_records"]
    }
    if bank_records != recorded_bank_records:
        raise AssertionError("bank rotation family mismatch")


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("carrier", type=Path)
    parser.add_argument("detection", type=Path)
    parser.add_argument("--output", required=True, type=Path)
    args = parser.parse_args()
    carrier = json.loads(args.carrier.read_text(encoding="utf-8"))
    detection = json.loads(args.detection.read_text(encoding="utf-8"))
    n = int(carrier["n"])
    cyclic_order = [int(item) for item in carrier.get("cyclic_order", range(n))]
    rows = {int(center): {int(item) for item in members} for center, members in carrier["rows"].items()}

    keys = independent_raw_keys(n, cyclic_order, rows)
    digest = hashlib.sha256(json.dumps(keys, separators=(",", ":")).encode()).hexdigest()
    if len(keys) != int(detection["raw_two_cycle_count"]):
        raise AssertionError("independent raw two-cycle count disagrees")
    if digest != detection["raw_witness_key_sha256"]:
        raise AssertionError("independent raw witness set disagrees")
    if len(detection["raw_witnesses"]) != len(keys):
        raise AssertionError("serialized raw witness count disagrees")
    for witness in detection["raw_witnesses"]:
        replay_witness(witness, cyclic_order, rows)

    payload = {
        "schema": "p97-theorem-faithful-two-cycle-independent-replay-v1",
        "status": "VERIFIED",
        "epistemic_status": "INDEPENDENT_EXACT_FINITE_INCIDENCE_REPLAY",
        "carrier": str(args.carrier),
        "detection": str(args.detection),
        "carrier_n": n,
        "raw_two_cycle_count": len(keys),
        "raw_witness_key_sha256": digest,
        "replayed_raw_witness_count": len(detection["raw_witnesses"]),
        "canonical_witness_count": len(detection["witnesses"]),
        "scope_warning": (
            "This verifies the finite-carrier occurrence search and explicit theorem inputs. "
            "It does not prove arbitrary-cardinality live coverage."
        ),
    }
    args.output.write_text(json.dumps(payload, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    print(json.dumps({"status": "VERIFIED", "raw_two_cycle_count": len(keys)}, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
