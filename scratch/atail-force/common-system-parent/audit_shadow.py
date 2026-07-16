#!/usr/bin/env python3
"""Replay the common-system parent interface on the current 23 shadows.

This is deliberately an interface-level finite audit.  A stored exact row is
the abstraction's only K4 radius at its center; alternate radius classes,
coordinates, convexity, and MEC optimality are not represented.
"""

from __future__ import annotations

import argparse
import hashlib
import json
from pathlib import Path
from typing import Any


ATAIL = Path(__file__).resolve().parents[1]
SURVIVORS = ATAIL / "second_center_query/formalized_core_shards_after_current_bank_checkpoint.json"
ROW_EXTENSIONS = ATAIL / "current-marco-cores/row_extension_completion_checkpoint.json"
FIRST_APEX = ATAIL / "apex-strict-pair-completion/checkpoint.json"
SECOND_APEX = ATAIL / "alternate-apex-descent/second_apex_completion_checkpoint.json"
CHECKPOINT = Path(__file__).with_name("shadow_checkpoint.json")

EXPECTED_SHA256 = {
    "survivors": "5b661a15f4dda8a6cd143f3737457f2733d23eca056defcbcd30872f629bcc1a",
    "row_extensions": "d6c2bece9b30fc337ef181a941a8b781b33d9217fe2347c948fe61b2d306a83c",
    "first_apex": "c8800bbe28dfb4b88001e88848488a9872113eec8fb48cffc814978317f4de17",
    "second_apex": "f5dfebb98691aac832522c3166e8ef4bda33cae03ceb4b8bdc9a27fd0aa16237",
}

LABELS = {"p": 0, "q": 3, "t1": 2, "t2": 1, "t3": 4, "u": 5}
DANGEROUS = frozenset((1, 2, 3, 4))
SURPLUS_CAP = frozenset((1, 2, 3, 4, 5))
STRICT_O1 = frozenset((6, 7, 8))
STRICT_O2 = frozenset((9, 10, 11))


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def load(path: Path) -> dict[str, Any]:
    return json.loads(path.read_text())


def case_map(data: dict[str, Any]) -> dict[int, dict[str, Any]]:
    return {int(case["shard_index"]): case for case in data["cases"]}


def compute() -> dict[str, Any]:
    paths = {
        "survivors": SURVIVORS,
        "row_extensions": ROW_EXTENSIONS,
        "first_apex": FIRST_APEX,
        "second_apex": SECOND_APEX,
    }
    observed = {name: sha256(path) for name, path in paths.items()}
    assert observed == EXPECTED_SHA256, (observed, EXPECTED_SHA256)

    survivors = load(SURVIVORS)
    extensions = case_map(load(ROW_EXTENSIONS))
    first_apex = case_map(load(FIRST_APEX))
    second_apex = case_map(load(SECOND_APEX))
    assert len(survivors["cases"]) == len(extensions) == len(first_apex) == len(second_apex) == 23

    cases: list[dict[str, Any]] = []
    for raw in survivors["cases"]:
        shard = int(raw["partition"]["shard_index"])
        rows = {
            int(row["center"]): frozenset(map(int, row["support"]))
            for row in raw["survivor"]["distinct_metric_rows"]
        }
        assert set(rows) == set(range(12))
        assert all(len(support) == 4 and center not in support for center, support in rows.items())
        assert rows[LABELS["p"]] == DANGEROUS

        blocker_options = {
            source: sorted(center for center, support in rows.items() if source in support)
            for source in range(12)
        }
        assert all(blocker_options.values())

        # This is a total common critical map in the stored-row abstraction.
        # Force the actual t2_t20 parent branch at p and select u's blocker
        # outside the surplus cap whenever several certified rows are possible.
        blocker_map: dict[int, int] = {}
        for source in range(12):
            if source == LABELS["t2"]:
                blocker_map[source] = LABELS["p"]
            elif source == LABELS["u"]:
                outside = [center for center in blocker_options[source] if center not in SURPLUS_CAP]
                assert outside
                blocker_map[source] = outside[0]
            else:
                blocker_map[source] = blocker_options[source][0]
            assert source in rows[blocker_map[source]]
            assert source != blocker_map[source]

        extension = extensions[shard]["added_row_extension"]
        edge_center = int(extension["center"])
        edge_left = int(extension["left"])
        edge_right = int(extension["right"])
        assert rows[edge_center] == frozenset(extension["selected_support_at_center"])
        assert edge_left in rows[edge_center]
        assert edge_right not in rows[edge_center]
        # Hence deleting the desired outside endpoint leaves this exact stored
        # K4 row intact.  Its common-system blocker must be somewhere else.
        assert blocker_map[edge_right] != edge_center

        missing_first = [
            [int(pair["left"]), int(pair["right"])]
            for pair in first_apex[shard]["pairs"]
            if pair["status"] != "ALREADY_IN_EQUALITY_CLOSURE"
        ]
        missing_second = [
            [int(pair["left"]), int(pair["right"])]
            for pair in second_apex[shard]["pairs"]
            if pair["status"] != "ALREADY_IN_EQUALITY_CLOSURE"
        ]
        assert missing_second
        assert all(set(pair) <= STRICT_O1 for pair in missing_first)
        assert all(set(pair) <= STRICT_O2 for pair in missing_second)

        cases.append(
            {
                "shard_index": shard,
                "u_blocker": blocker_map[LABELS["u"]],
                "u_blocker_outside_surplus_cap": blocker_map[LABELS["u"]] not in SURPLUS_CAP,
                "preferred_missing_edge": [edge_center, edge_left, edge_right],
                "right_endpoint_blocker": blocker_map[edge_right],
                "right_endpoint_not_blocked_at_edge_center": True,
                "missing_first_apex_strict_pairs": missing_first,
                "missing_second_apex_strict_pairs": missing_second,
            }
        )

    return {
        "schema": "common-system-parent-shadow-v1",
        "inputs_sha256": observed,
        "frame": {
            "card": 12,
            "profile": [5, 5, 5],
            "labels": LABELS,
            "dangerous_support_at_p": sorted(DANGEROUS),
            "surplus_cap": sorted(SURPLUS_CAP),
            "strict_opp_cap_1": sorted(STRICT_O1),
            "strict_opp_cap_2": sorted(STRICT_O2),
        },
        "aggregate": {
            "case_count": len(cases),
            "all_admit_total_common_blocker_map": all(cases),
            "all_realize_t2_t20_at_p": all(cases),
            "all_avoid_preferred_h4_h5_blocker_alignment": all(cases),
            "all_admit_u_blocker_outside_surplus_cap": all(cases),
            "cases_with_missing_first_apex_strict_pair": sum(
                bool(case["missing_first_apex_strict_pairs"]) for case in cases
            ),
            "cases_with_missing_second_apex_strict_pair": sum(
                bool(case["missing_second_apex_strict_pairs"]) for case in cases
            ),
        },
        "evidence": {
            "shard_indexes": [case["shard_index"] for case in cases],
            "u_blockers": [case["u_blocker"] for case in cases],
            "preferred_edges_and_right_blockers": [
                case["preferred_missing_edge"] + [case["right_endpoint_blocker"]]
                for case in cases
            ],
            "missing_first_apex_pair_counts": [
                len(case["missing_first_apex_strict_pairs"]) for case in cases
            ],
            "missing_second_apex_pair_counts": [
                len(case["missing_second_apex_strict_pairs"]) for case in cases
            ],
        },
        "scope": {
            "finite_shadow_only": True,
            "fixed_card_12_555_placement_only": True,
            "stored_exact_rows_are_only_encoded_k4_radii": True,
            "coordinates_omitted": True,
            "convexity_and_mec_optimality_omitted": True,
            "alternate_radius_classes_omitted": True,
            "live_counterexample_claimed": False,
            "live_k_a_pair_closed": False,
        },
    }


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    computed = compute()
    if args.check:
        expected = load(CHECKPOINT)
        assert computed == expected
        print("PASS: common-system parent shadow matches pinned checkpoint")
    else:
        print(json.dumps(computed, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
