#!/usr/bin/env python3
"""Report coarse terminal schemas present in every completed census round."""

from __future__ import annotations

import argparse
import json
from collections import Counter, defaultdict
from pathlib import Path
from typing import Any, Callable, Hashable

from census_checked_terminals import classify_round, read_json


def side_multiplicity(packet: dict[str, Any]) -> tuple[tuple[str, ...], ...]:
    by_center: dict[int, list[str]] = defaultdict(list)
    for arc in packet["representative_witness"]:
        by_center[arc["center"]].append(arc["side"])
    return tuple(sorted(tuple(sorted(sides)) for sides in by_center.values()))


def region_multiset(packet: dict[str, Any]) -> tuple[str, ...]:
    return tuple(
        sorted(value["region"] for value in packet["center_signatures"].values())
    )


def bool_presence(packet: dict[str, Any], field: str) -> int:
    return sum(value[field] for value in packet["center_signatures"].values())


def is_three_row_middle_arc(packet: dict[str, Any]) -> bool:
    return (
        packet["center_count"] == 3
        and packet["terminal_kind"] == "STRICT_OPEN_WINDOW"
        and side_multiplicity(packet)
        == (("left",), ("left", "right"), ("right",))
    )


def arc_role_centers(packet: dict[str, Any]) -> dict[str, int]:
    by_center: dict[int, list[str]] = defaultdict(list)
    for arc in packet["representative_witness"]:
        by_center[arc["center"]].append(arc["side"])
    roles: dict[str, int] = {}
    for center, sides in by_center.items():
        normalized = tuple(sorted(sides))
        if normalized == ("left", "right"):
            roles["middle"] = center
        elif normalized == ("left",):
            roles["left"] = center
        elif normalized == ("right",):
            roles["right"] = center
    if set(roles) != {"left", "middle", "right"}:
        raise AssertionError("not a normalized three-row middle-arc witness")
    return roles


def three_row_relational_schema(packet: dict[str, Any]) -> tuple[Any, ...]:
    roles = arc_role_centers(packet)
    inverse = {center: role for role, center in roles.items()}
    memberships = {
        (inverse[center], inverse[target])
        for center, target in packet["induced_selected_row_memberships"]
    }
    blocker_targets = tuple(
        (
            role,
            inverse.get(packet["induced_blocker_map"][str(center)], "outside"),
        )
        for role, center in sorted(roles.items())
    )
    signatures = packet["center_signatures"]
    image_bits = tuple(
        (role, signatures[str(center)]["in_blocker_image"])
        for role, center in sorted(roles.items())
    )
    return (
        tuple(sorted(memberships)),
        blocker_targets,
        image_bits,
    )


def common_values(
    rounds: list[list[dict[str, Any]]], key: Callable[[dict[str, Any]], Hashable]
) -> Counter[Hashable]:
    per_round = [set(map(key, packets)) for packets in rounds]
    common = set.intersection(*per_round)
    aggregate = Counter(key(packet) for packets in rounds for packet in packets)
    return Counter({value: aggregate[value] for value in common})


def encode_counter(counter: Counter[Hashable]) -> list[dict[str, Any]]:
    return [
        {"schema": list(schema) if isinstance(schema, tuple) else schema, "occurrences": count}
        for schema, count in sorted(counter.items(), key=lambda item: repr(item[0]))
    ]


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("run_dirs", nargs="+", type=Path)
    args = parser.parse_args()
    round_data = []
    for run_dir in args.run_dirs:
        manifest = read_json(run_dir / "manifest.json")
        for summary in manifest["rounds"]:
            number = int(summary["round"])
            round_data.append(classify_round(run_dir / f"round_{number:03d}"))
    rounds = [data["minimal_terminals"] for data in round_data]
    keys: dict[str, Callable[[dict[str, Any]], Hashable]] = {
        "center_count": lambda packet: packet["center_count"],
        "terminal_kind": lambda packet: packet["terminal_kind"],
        "side_multiplicity": side_multiplicity,
        "blocker_image_count": lambda packet: packet["blocker_image_center_count"],
        "first_apex_fiber_source_count": lambda packet: packet[
            "first_apex_fiber_source_count"
        ],
        "region_multiset": region_multiset,
        "distinguished_role_counts": lambda packet: (
            bool_presence(packet, "in_blocker_image"),
            bool_presence(packet, "is_first_apex_fiber_source"),
            bool_presence(packet, "is_retained_q"),
            bool_presence(packet, "is_retained_w"),
            bool_presence(packet, "is_strict_pair_q"),
            bool_presence(packet, "is_strict_pair_w"),
        ),
        "coarse_terminal_schema": lambda packet: (
            packet["center_count"],
            packet["terminal_kind"],
            packet["blocker_image_center_count"],
            packet["first_apex_fiber_source_count"],
            side_multiplicity(packet),
        ),
        "coarse_terminal_schema_with_regions": lambda packet: (
            packet["center_count"],
            packet["terminal_kind"],
            packet["blocker_image_center_count"],
            packet["first_apex_fiber_source_count"],
            side_multiplicity(packet),
            region_multiset(packet),
        ),
    }
    output = {
        "completed_round_count": len(rounds),
        "common_schema_values": {
            name: encode_counter(common_values(rounds, key))
            for name, key in keys.items()
        },
    }
    candidates_by_round = [
        [packet for packet in packets if is_three_row_middle_arc(packet)]
        for packets in rounds
    ]
    if not all(candidates_by_round):
        raise AssertionError("a completed round has no three-row middle-arc terminal")

    candidate_fields: dict[str, Callable[[dict[str, Any]], Hashable]] = {}
    for role in ("left", "middle", "right"):
        candidate_fields[f"{role}_region"] = lambda packet, role=role: packet[
            "center_signatures"
        ][str(arc_role_centers(packet)[role])]["region"]
        candidate_fields[f"{role}_in_blocker_image"] = lambda packet, role=role: packet[
            "center_signatures"
        ][str(arc_role_centers(packet)[role])]["in_blocker_image"]
        candidate_fields[f"{role}_is_first_apex_fiber_source"] = (
            lambda packet, role=role: packet["center_signatures"][
                str(arc_role_centers(packet)[role])
            ]["is_first_apex_fiber_source"]
        )
        candidate_fields[f"{role}_in_first_apex_exact_class"] = (
            lambda packet, role=role: packet["center_signatures"][
                str(arc_role_centers(packet)[role])
            ]["in_first_apex_exact_class"]
        )
    output["three_row_middle_arc"] = {
        "candidate_count_by_round": [len(packets) for packets in candidates_by_round],
        "common_role_field_values": {
            name: encode_counter(common_values(candidates_by_round, key))
            for name, key in candidate_fields.items()
        },
    }
    output["three_row_middle_arc"]["common_relational_schemas"] = encode_counter(
        common_values(candidates_by_round, three_row_relational_schema)
    )
    source_shaped_by_round = []
    omitted_middle_by_round = []
    for packets in candidates_by_round:
        source_shaped = []
        omitted_middle = []
        for packet in packets:
            roles = arc_role_centers(packet)
            signatures = packet["center_signatures"]
            if (
                not signatures[str(roles["middle"])]["in_blocker_image"]
                and not signatures[str(roles["middle"])]["in_first_apex_exact_class"]
                and not signatures[str(roles["middle"])]["is_first_apex_fiber_source"]
            ):
                omitted_middle.append(packet)
            if (
                not signatures[str(roles["middle"])]["in_blocker_image"]
                and signatures[str(roles["left"])]["in_blocker_image"]
                and signatures[str(roles["right"])]["in_blocker_image"]
            ):
                source_shaped.append(packet)
        source_shaped_by_round.append(source_shaped)
        omitted_middle_by_round.append(omitted_middle)
    output["three_row_middle_arc"]["omitted_middle_count_by_round"] = [
        len(packets) for packets in omitted_middle_by_round
    ]
    output["three_row_middle_arc"]["omitted_middle_in_every_round"] = all(
        omitted_middle_by_round
    )
    output["three_row_middle_arc"]["omitted_middle_two_image_singletons_count_by_round"] = [
        len(packets) for packets in source_shaped_by_round
    ]
    output["three_row_middle_arc"]["omitted_middle_two_image_singletons_in_every_round"] = (
        all(source_shaped_by_round)
    )
    print(json.dumps(output, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
