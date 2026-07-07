#!/usr/bin/env python3
#
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
#
"""Enumerate finite producer targets for erased-pin count rows.

This refines `scripts/erased-pin-row-census.py`: each exact count row is
expanded into the oriented ten-label selected-class masks that a finite
certificate or seeded-shadow producer would have to realize.

The enumeration is finite and exact for the ten-label reduction vocabulary.
Rows whose surplus-side count needs more than the chosen three surplus labels
are recorded as `needs_surplus_extra`; those rows are not representable by the
current ten-label subpacket without an additional surplus-extra bridge.
"""

from __future__ import annotations

import argparse
import itertools
import json
from collections import Counter, defaultdict
from functools import lru_cache
from pathlib import Path
from typing import Any, Iterable


SCHEMA = "p97.erased_pin_producer_census.v2"
PINNED_BANK_SCHEMA = "pinned_surplus_comp_g_bank.v2"
LABELS = ("u", "v", "w", "s1", "s2", "s3", "Pw", "Pu", "Q1", "Q2")
LABEL_INDEX = {label: idx for idx, label in enumerate(LABELS)}
MOSER_LABELS = ("u", "v", "w")
SURPLUS_LABELS = ("s1", "s2", "s3")
CENTER_LABELS = ("Pw", "Pu")
OTHER_ADJ_LABELS = ("Q1", "Q2")
MASK_BOUND = 2 ** len(LABELS)
HULL_ORDER = ("u", "Q1", "Q2", "v", "s1", "s2", "s3", "w", "Pw", "Pu")
HULL_POS = {label: idx for idx, label in enumerate(HULL_ORDER)}
LABEL_PAIRS = tuple(
    (left, right)
    for index, left in enumerate(LABELS)
    for right in LABELS[index + 1 :]
)
ORDERED_LABEL_PAIRS = tuple((left, right) for left in LABELS for right in LABELS if left != right)
FRAGMENT_SEARCH_ORDER = ("v", "w", "u", "Pw", "Pu", "Q1", "Q2", "s1", "s2", "s3")
CV_NO_U_MASK_LABELS = ("w", "Pw", "Pu")
CW_NO_U_MASK_LABELS = ("v", "Q1", "Q2")
CV_NO_W_MASK_LABELS = ("u", "Pw", "Pu")
CU_NO_W_MASK_LABELS = ("v", "s1", "s2", "s3")
U_PW_PU_MASK_LABELS = ("u", "Pw", "Pu")


def load_json(path: Path) -> Any:
    with path.open() as handle:
        return json.load(handle)


def choose(items: Iterable[str], count: int) -> list[tuple[str, ...]]:
    if count < 0:
        return []
    return list(itertools.combinations(tuple(items), count))


def mask_key(labels: Iterable[str]) -> str:
    selected = set(labels)
    return ",".join(label for label in LABELS if label in selected)


def mask_value(labels: Iterable[str]) -> int:
    selected = set(labels)
    return sum(1 << LABEL_INDEX[label] for label in selected)


def labels_from_mask_key(key: str) -> list[str]:
    if key == "":
        return []
    labels = key.split(",")
    unknown = sorted(set(labels) - set(LABELS))
    if unknown:
        raise ValueError(f"unknown labels in mask key {key!r}: {unknown!r}")
    return labels


def mask_has(mask: int, label: str) -> bool:
    return bool(mask & (1 << LABEL_INDEX[label]))


def mask_card(mask: int) -> int:
    return sum(1 for label in LABELS if mask_has(mask, label))


def mask_inter_card(left: int, right: int) -> int:
    return sum(1 for label in LABELS if mask_has(left, label) and mask_has(right, label))


def is_moser_label(label: str) -> bool:
    return label in MOSER_LABELS


def previous_sstar_centers(sstar: str) -> tuple[str, ...]:
    if sstar == "s1":
        return ()
    if sstar == "s2":
        return ("s1",)
    if sstar == "s3":
        return ("s1", "s2")
    return ()


def local_trigger_ok(sstar: str, center: str, mask: int) -> bool:
    if center in ("u", "Q1", "Q2") or center in previous_sstar_centers(sstar):
        return not (mask_has(mask, sstar) and 1 <= mask_inter_card(mask, U_PW_PU_MASK))
    if center == sstar:
        return mask_inter_card(mask, U_PW_PU_MASK) <= 1
    return True


def local_candidate_mask_ok(sstar: str, center: str, mask: int) -> bool:
    return (
        mask < MASK_BOUND
        and mask_card(mask) == 4
        and not mask_has(mask, center)
        and (
            center != "w"
            or (
                mask_has(mask, "Q1")
                and mask_has(mask, "Q2")
                and mask_inter_card(mask, CU_NO_W_MASK) == 1
                and mask_inter_card(mask, CV_NO_W_MASK) == 1
            )
        )
        and (
            center != "u"
            or (
                mask_inter_card(mask, CV_NO_U_MASK) <= 1
                and mask_inter_card(mask, CW_NO_U_MASK) <= 1
            )
        )
        and (
            center != "w"
            or (
                mask_inter_card(mask, CV_NO_W_MASK) <= 1
                and mask_inter_card(mask, CU_NO_W_MASK) <= 1
            )
        )
        and (is_moser_label(center) or not all(mask_has(mask, label) for label in MOSER_LABELS))
        and local_trigger_ok(sstar, center, mask)
    )


CV_NO_U_MASK = mask_value(CV_NO_U_MASK_LABELS)
CW_NO_U_MASK = mask_value(CW_NO_U_MASK_LABELS)
CV_NO_W_MASK = mask_value(CV_NO_W_MASK_LABELS)
CU_NO_W_MASK = mask_value(CU_NO_W_MASK_LABELS)
U_PW_PU_MASK = mask_value(U_PW_PU_MASK_LABELS)
FIRST_OPP_EXACT_CAP_MASK = mask_value(("u", "w", "Pw", "Pu"))
SECOND_OPP_EXACT_CAP_MASK = mask_value(("u", "v", "Q1", "Q2"))


def between(a: str, b: str, x: str) -> bool:
    da = (HULL_POS[x] + len(LABELS) - HULL_POS[a]) % len(LABELS)
    db = (HULL_POS[b] + len(LABELS) - HULL_POS[a]) % len(LABELS)
    return 0 < da < db


def separated(a: str, b: str, x: str, y: str) -> bool:
    return between(a, b, x) != between(a, b, y)


@lru_cache(maxsize=None)
def cross_separation_ok_for_masks(c: str, cmask: int, cp: str, cpmask: int) -> bool:
    for x, y in LABEL_PAIRS:
        if x in (c, cp) or y in (c, cp):
            continue
        if (
            mask_has(cmask, x)
            and mask_has(cmask, y)
            and mask_has(cpmask, x)
            and mask_has(cpmask, y)
            and not separated(c, cp, x, y)
        ):
            return False
    return True


def separation_ok(masks: list[int]) -> bool:
    return all(
        cross_separation_ok_for_masks(
            c, masks[LABEL_INDEX[c]], cp, masks[LABEL_INDEX[cp]]
        )
        for c, cp in LABEL_PAIRS
    )


def search_separation_ok(masks: list[int]) -> bool:
    return all(
        cross_separation_ok_for_masks(
            c, masks[LABEL_INDEX[c]], cp, masks[LABEL_INDEX[cp]]
        )
        for c, cp in ORDERED_LABEL_PAIRS
    )


def point_pair_hit_by_center_mask(center: str, mask: int, pair: tuple[str, str]) -> bool:
    x, y = pair
    return center not in (x, y) and mask_has(mask, x) and mask_has(mask, y)


def point_pair_class_count(masks: list[int], x: str, y: str) -> int:
    count = 0
    for center in LABELS:
        if center in (x, y):
            continue
        mask = masks[LABEL_INDEX[center]]
        if mask_has(mask, x) and mask_has(mask, y):
            count += 1
    return count


def no_three_ok(masks: list[int]) -> bool:
    return all(point_pair_class_count(masks, x, y) <= 2 for x, y in LABEL_PAIRS)


def w_squeeze_ok(masks: list[int]) -> bool:
    mask = masks[LABEL_INDEX["w"]]
    return (
        mask_has(mask, "Q1")
        and mask_has(mask, "Q2")
        and mask_inter_card(mask, CU_NO_W_MASK) == 1
        and mask_inter_card(mask, CV_NO_W_MASK) == 1
    )


def one_hit_ok(masks: list[int]) -> bool:
    umask = masks[LABEL_INDEX["u"]]
    wmask = masks[LABEL_INDEX["w"]]
    return (
        mask_inter_card(umask, CV_NO_U_MASK) <= 1
        and mask_inter_card(umask, CW_NO_U_MASK) <= 1
        and mask_inter_card(wmask, CV_NO_W_MASK) <= 1
        and mask_inter_card(wmask, CU_NO_W_MASK) <= 1
    )


def circumcenter_ok(masks: list[int]) -> bool:
    return all(
        is_moser_label(center)
        or not all(mask_has(masks[LABEL_INDEX[center]], label) for label in MOSER_LABELS)
        for center in LABELS
    )


def fragment_triggers_ok(sstar: str, masks: list[int]) -> bool:
    def trigger_private_ok(center: str) -> bool:
        mask = masks[LABEL_INDEX[center]]
        return not (mask_has(mask, sstar) and 1 <= mask_inter_card(mask, U_PW_PU_MASK))

    return (
        trigger_private_ok("u")
        and trigger_private_ok("Q1")
        and trigger_private_ok("Q2")
        and all(trigger_private_ok(center) for center in previous_sstar_centers(sstar))
        and mask_inter_card(masks[LABEL_INDEX[sstar]], U_PW_PU_MASK) <= 1
    )


def one_sided_seed_fixed_mask(private_center: str, private_mask: int, center: str) -> int | None:
    if center == "v":
        return FIRST_OPP_EXACT_CAP_MASK
    if center == "w":
        return SECOND_OPP_EXACT_CAP_MASK
    if center == private_center:
        return private_mask
    return None


@lru_cache(maxsize=None)
def one_sided_candidate_masks(sstar: str, center: str) -> tuple[int, ...]:
    return tuple(
        mask for mask in range(MASK_BOUND) if local_candidate_mask_ok(sstar, center, mask)
    )


@lru_cache(maxsize=None)
def one_sided_seed_candidate_masks(
    sstar: str, private_center: str, private_mask: int, center: str
) -> tuple[int, ...]:
    fixed = one_sided_seed_fixed_mask(private_center, private_mask, center)
    if fixed is not None:
        return (fixed,) if local_candidate_mask_ok(sstar, center, fixed) else ()
    return one_sided_candidate_masks(sstar, center)


def is_valid_one_sided_seed_shadow(
    sstar: str, private_center: str, private_mask: int, masks: list[int]
) -> bool:
    return (
        sstar in SURPLUS_LABELS
        and len(masks) == len(LABELS)
        and all(
            local_candidate_mask_ok(sstar, center, masks[LABEL_INDEX[center]])
            for center in LABELS
        )
        and masks[LABEL_INDEX["v"]] == FIRST_OPP_EXACT_CAP_MASK
        and masks[LABEL_INDEX["w"]] == SECOND_OPP_EXACT_CAP_MASK
        and masks[LABEL_INDEX[private_center]] == private_mask
        and w_squeeze_ok(masks)
        and one_hit_ok(masks)
        and circumcenter_ok(masks)
        and no_three_ok(masks)
        and separation_ok(masks)
        and search_separation_ok(masks)
        and fragment_triggers_ok(sstar, masks)
    )


@lru_cache(maxsize=None)
def one_sided_seed_search_count(sstar: str, private_center: str, private_mask: int) -> int:
    masks = [0] * len(LABELS)
    assigned: list[str] = []
    pair_counts = [0] * len(LABEL_PAIRS)
    count = 0

    def add_pair_counts(center: str, mask: int, delta: int) -> list[int]:
        changed: list[int] = []
        for index, pair in enumerate(LABEL_PAIRS):
            if point_pair_hit_by_center_mask(center, mask, pair):
                pair_counts[index] += delta
                changed.append(index)
        return changed

    def dfs(index: int) -> None:
        nonlocal count
        if index == len(FRAGMENT_SEARCH_ORDER):
            if is_valid_one_sided_seed_shadow(sstar, private_center, private_mask, masks):
                count += 1
            return

        center = FRAGMENT_SEARCH_ORDER[index]
        for mask in one_sided_seed_candidate_masks(sstar, private_center, private_mask, center):
            if any(
                not cross_separation_ok_for_masks(
                    center, mask, other, masks[LABEL_INDEX[other]]
                )
                for other in assigned
            ):
                continue
            changed = add_pair_counts(center, mask, 1)
            if all(pair_counts[pair_index] <= 2 for pair_index in changed):
                masks[LABEL_INDEX[center]] = mask
                assigned.append(center)
                dfs(index + 1)
                assigned.pop()
                masks[LABEL_INDEX[center]] = 0
            for pair_index in changed:
                pair_counts[pair_index] -= 1

    dfs(0)
    return count


def same_label_for_center(center: str) -> str:
    if center == "Pw":
        return "Pu"
    if center == "Pu":
        return "Pw"
    raise ValueError(f"bad center label {center!r}")


def oriented_counts(row: dict[str, Any]) -> tuple[int, int, int, int]:
    """Return `(moser, same, other_adjacent, surplus)` in oriented labels."""

    side = row["side"]
    m = int(row["m"])
    s = int(row["s"])
    l = int(row["l"])
    r = int(row["r"])
    if side == "right":
        return m, s, l, r
    if side == "left":
        return m, s, r, l
    raise ValueError(f"{row.get('id')}: bad side {side!r}")


def row_masks(row: dict[str, Any]) -> tuple[list[dict[str, Any]], str | None]:
    m, s, other_adj, surplus = oriented_counts(row)
    if other_adj > len(OTHER_ADJ_LABELS):
        return [], "other_adjacent_count_exceeds_pair"
    if surplus > len(SURPLUS_LABELS):
        return [], "surplus_count_exceeds_three_subpacket"

    out: list[dict[str, Any]] = []
    for center in CENTER_LABELS:
        same_labels = () if s == 0 else (same_label_for_center(center),)
        if s not in (0, 1):
            raise ValueError(f"{row['id']}: same count outside finite support")
        for sstar in SURPLUS_LABELS:
            available_surplus = tuple(label for label in SURPLUS_LABELS if label != sstar)
            for moser in choose(MOSER_LABELS, m):
                for other in choose(OTHER_ADJ_LABELS, other_adj):
                    for extra_surplus in choose(available_surplus, surplus - 1):
                        selected = tuple(moser) + same_labels + tuple(other) + (sstar,) + extra_surplus
                        if len(set(selected)) != 4:
                            raise ValueError(f"{row['id']}: non-distinct selected mask {selected!r}")
                        out.append(
                            {
                                "center": center,
                                "sstar": sstar,
                                "mask": mask_key(selected),
                                "mask_value": mask_value(selected),
                                "moser": list(moser),
                                "same": list(same_labels),
                                "other_adjacent": list(other),
                                "surplus": [sstar, *extra_surplus],
                            }
                        )
    return out, None


def collapsed_signature(mask: dict[str, Any]) -> str:
    """Collapse by count source, forgetting center and surplus-star names."""

    return "|".join(
        [
            f"M{len(mask['moser'])}",
            f"S{len(mask['same'])}",
            f"O{len(mask['other_adjacent'])}",
            f"X{len(mask['surplus'])}",
        ]
    )


def load_pinned_bank_index(bank_path: Path | None) -> tuple[dict[tuple[str, str, str], list[str]], dict[str, Any] | None]:
    """Index full pinned-fragment rows by erased-pin selected-class data."""

    if bank_path is None:
        return {}, None
    if not bank_path.exists():
        return {}, {
            "path": str(bank_path),
            "available": False,
            "reason": "missing",
        }

    source = load_json(bank_path)
    if source.get("schema") != PINNED_BANK_SCHEMA:
        raise ValueError(f"unsupported pinned bank schema {source.get('schema')!r}")
    if tuple(source.get("labels", [])) != LABELS:
        raise ValueError("pinned bank labels do not match producer census labels")

    rows = source["rows"]
    if not isinstance(rows, list):
        raise ValueError("pinned bank has no rows list")

    index: dict[tuple[str, str, str], list[str]] = defaultdict(list)
    for bank_row in rows:
        pid = str(bank_row["pid"])
        sstar = str(bank_row["sstar"])
        classes = bank_row["classes"]
        for center in CENTER_LABELS:
            selected = classes.get(center)
            if selected is None:
                continue
            index[(center, sstar, mask_key(selected))].append(pid)

    metadata = {
        "path": str(bank_path),
        "available": True,
        "schema": source["schema"],
        "row_count": len(rows),
        "indexed_key_count": len(index),
    }
    return index, metadata


def add_bank_matches(
    masks: list[dict[str, Any]],
    bank_index: dict[tuple[str, str, str], list[str]],
    run_seeded_dfs: bool,
) -> None:
    for mask in masks:
        key = (str(mask["center"]), str(mask["sstar"]), str(mask["mask"]))
        pids = sorted(bank_index.get(key, []))
        local_ok = local_candidate_mask_ok(
            str(mask["sstar"]), str(mask["center"]), int(mask["mask_value"])
        )
        mask["local_candidate_mask_ok"] = local_ok
        mask["private_v_cross_separation_ok"] = cross_separation_ok_for_masks(
            str(mask["center"]), int(mask["mask_value"]), "v", FIRST_OPP_EXACT_CAP_MASK
        )
        mask["private_w_cross_separation_ok"] = cross_separation_ok_for_masks(
            str(mask["center"]), int(mask["mask_value"]), "w", SECOND_OPP_EXACT_CAP_MASK
        )
        if run_seeded_dfs:
            mask["seeded_dfs_completion_count"] = one_sided_seed_search_count(
                str(mask["sstar"]), str(mask["center"]), int(mask["mask_value"])
            )
        else:
            mask["seeded_dfs_completion_count"] = None
        mask["pinned_bank_completion_count"] = len(pids)
        mask["pinned_bank_completion_pids"] = pids


def build_census(
    rows_path: Path,
    bank_path: Path | None,
    run_seeded_dfs: bool,
) -> dict[str, Any]:
    source = load_json(rows_path)
    if source.get("schema") != "p97.erased_pin_count_rows.v1":
        raise ValueError(f"unsupported row census schema {source.get('schema')!r}")
    rows = source["rows"]
    if not isinstance(rows, list):
        raise ValueError("row census has no rows list")
    bank_index, bank_metadata = load_pinned_bank_index(bank_path)

    output_rows: list[dict[str, Any]] = []
    route_counts: Counter[str] = Counter()
    finite_by_route: Counter[str] = Counter()
    blocker_by_route: Counter[str] = Counter()
    blocker_counts: Counter[str] = Counter()
    signature_rows: dict[str, set[str]] = defaultdict(set)

    for row in rows:
        masks, blocker = row_masks(row)
        add_bank_matches(masks, bank_index, run_seeded_dfs)
        route = str(row["route"])
        route_counts[route] += 1
        if blocker is not None:
            blocker_by_route[f"{route}:{blocker}"] += 1
            blocker_counts[blocker] += 1
        else:
            finite_by_route[route] += 1
        signatures = sorted({collapsed_signature(mask) for mask in masks})
        for signature in signatures:
            signature_rows[signature].add(str(row["id"]))
        bank_covered_masks = sum(mask["pinned_bank_completion_count"] > 0 for mask in masks)
        bank_completion_count = sum(mask["pinned_bank_completion_count"] for mask in masks)
        local_candidate_ok_masks = sum(mask["local_candidate_mask_ok"] for mask in masks)
        private_v_cross_separation_false_masks = sum(
            not mask["private_v_cross_separation_ok"] for mask in masks
        )
        private_w_cross_separation_false_masks = sum(
            not mask["private_w_cross_separation_ok"] for mask in masks
        )
        seeded_dfs_zero_masks = (
            sum(mask["seeded_dfs_completion_count"] == 0 for mask in masks)
            if run_seeded_dfs
            else None
        )
        seeded_dfs_positive_masks = (
            sum(
                mask["seeded_dfs_completion_count"] is not None
                and mask["seeded_dfs_completion_count"] > 0
                for mask in masks
            )
            if run_seeded_dfs
            else None
        )
        seeded_dfs_completion_count = (
            sum(int(mask["seeded_dfs_completion_count"]) for mask in masks)
            if run_seeded_dfs
            else None
        )
        output_rows.append(
            {
                "id": row["id"],
                "side": row["side"],
                "route": route,
                "counts": {
                    "m": row["m"],
                    "s": row["s"],
                    "l": row["l"],
                    "r": row["r"],
                },
                "oriented_counts": dict(
                    zip(("moser", "same", "other_adjacent", "surplus"), oriented_counts(row))
                ),
                "finite_blocker": blocker,
                "needs_surplus_extra": blocker == "surplus_count_exceeds_three_subpacket",
                "structurally_closed": blocker == "other_adjacent_count_exceeds_pair",
                "finite_mask_count": len(masks),
                "pinned_bank_completion_count": bank_completion_count,
                "pinned_bank_covered_mask_count": bank_covered_masks,
                "pinned_bank_uncovered_mask_count": len(masks) - bank_covered_masks,
                "local_candidate_ok_mask_count": local_candidate_ok_masks,
                "local_candidate_excluded_mask_count": len(masks) - local_candidate_ok_masks,
                "private_v_cross_separation_false_mask_count": (
                    private_v_cross_separation_false_masks
                ),
                "private_w_cross_separation_false_mask_count": (
                    private_w_cross_separation_false_masks
                ),
                "private_v_cross_separation_false_for_all_masks": (
                    len(masks) > 0
                    and private_v_cross_separation_false_masks == len(masks)
                ),
                "private_w_cross_separation_false_for_all_masks": (
                    len(masks) > 0
                    and private_w_cross_separation_false_masks == len(masks)
                ),
                "seeded_dfs_zero_mask_count": seeded_dfs_zero_masks,
                "seeded_dfs_positive_mask_count": seeded_dfs_positive_masks,
                "seeded_dfs_completion_count": seeded_dfs_completion_count,
                "collapsed_signatures": signatures,
                "masks": masks,
            }
        )

    finite_rows = [row for row in output_rows if row["finite_blocker"] is None]
    finite_mask_count = sum(row["finite_mask_count"] for row in finite_rows)
    finite_local_candidate_ok_mask_count = sum(
        row["local_candidate_ok_mask_count"] for row in finite_rows
    )
    finite_bank_covered_mask_count = sum(row["pinned_bank_covered_mask_count"] for row in finite_rows)
    finite_bank_completion_count = sum(row["pinned_bank_completion_count"] for row in finite_rows)
    rows_all_bank_covered = sum(
        row["finite_mask_count"] > 0
        and row["pinned_bank_covered_mask_count"] == row["finite_mask_count"]
        for row in finite_rows
    )
    rows_some_bank_covered = sum(
        0 < row["pinned_bank_covered_mask_count"] < row["finite_mask_count"]
        for row in finite_rows
    )
    rows_no_bank_covered = sum(
        row["finite_mask_count"] > 0 and row["pinned_bank_covered_mask_count"] == 0
        for row in finite_rows
    )
    rows_all_local_candidate_excluded = sum(
        row["finite_mask_count"] > 0 and row["local_candidate_ok_mask_count"] == 0
        for row in finite_rows
    )
    rows_some_local_candidate_excluded = sum(
        0 < row["local_candidate_ok_mask_count"] < row["finite_mask_count"]
        for row in finite_rows
    )
    rows_no_local_candidate_excluded = sum(
        row["finite_mask_count"] > 0
        and row["local_candidate_ok_mask_count"] == row["finite_mask_count"]
        for row in finite_rows
    )
    finite_private_v_cross_separation_false_mask_count = sum(
        row["private_v_cross_separation_false_mask_count"] for row in finite_rows
    )
    finite_private_w_cross_separation_false_mask_count = sum(
        row["private_w_cross_separation_false_mask_count"] for row in finite_rows
    )
    finite_rows_all_private_v_cross_separation_false = sum(
        row["private_v_cross_separation_false_for_all_masks"] for row in finite_rows
    )
    finite_rows_all_private_w_cross_separation_false = sum(
        row["private_w_cross_separation_false_for_all_masks"] for row in finite_rows
    )
    unique_seed_counts: dict[tuple[str, str, int], int] = {}
    if run_seeded_dfs:
        for row in finite_rows:
            for mask in row["masks"]:
                key = (str(mask["sstar"]), str(mask["center"]), int(mask["mask_value"]))
                unique_seed_counts[key] = int(mask["seeded_dfs_completion_count"])
    finite_seeded_dfs_zero_mask_count = (
        sum(row["seeded_dfs_zero_mask_count"] for row in finite_rows)
        if run_seeded_dfs
        else None
    )
    finite_seeded_dfs_positive_mask_count = (
        sum(row["seeded_dfs_positive_mask_count"] for row in finite_rows)
        if run_seeded_dfs
        else None
    )
    finite_seeded_dfs_completion_count = (
        sum(row["seeded_dfs_completion_count"] for row in finite_rows)
        if run_seeded_dfs
        else None
    )
    finite_rows_all_seeded_dfs_zero = (
        sum(
            row["finite_mask_count"] > 0
            and row["seeded_dfs_zero_mask_count"] == row["finite_mask_count"]
            for row in finite_rows
        )
        if run_seeded_dfs
        else None
    )
    finite_rows_some_seeded_dfs_zero = (
        sum(
            0 < row["seeded_dfs_zero_mask_count"] < row["finite_mask_count"]
            for row in finite_rows
        )
        if run_seeded_dfs
        else None
    )
    finite_rows_no_seeded_dfs_zero = (
        sum(
            row["finite_mask_count"] > 0 and row["seeded_dfs_zero_mask_count"] == 0
            for row in finite_rows
        )
        if run_seeded_dfs
        else None
    )

    summary = {
        "row_count": len(output_rows),
        "finite_ten_label_row_count": sum(row["finite_blocker"] is None for row in output_rows),
        "blocked_row_count": sum(row["finite_blocker"] is not None for row in output_rows),
        "surplus_extra_row_count": sum(row["needs_surplus_extra"] for row in output_rows),
        "structurally_closed_row_count": sum(row["structurally_closed"] for row in output_rows),
        "proof_facing_row_count_after_structural_closure": sum(
            not row["structurally_closed"] for row in output_rows
        ),
        "proof_facing_finite_ten_label_row_count": sum(
            row["finite_blocker"] is None for row in output_rows
        ),
        "proof_facing_surplus_extra_row_count": sum(
            row["needs_surplus_extra"] for row in output_rows
        ),
        "route_counts": dict(sorted(route_counts.items())),
        "finite_ten_label_rows_by_route": dict(sorted(finite_by_route.items())),
        "blocked_rows_by_route_and_reason": dict(sorted(blocker_by_route.items())),
        "blocked_rows_by_reason": dict(sorted(blocker_counts.items())),
        "collapsed_signature_count": len(signature_rows),
        "generated_row_seed_list_count": len(finite_rows),
        "generated_signature_seed_list_count": len(signature_rows),
        "collapsed_signatures": {
            signature: sorted(row_ids) for signature, row_ids in sorted(signature_rows.items())
        },
        "pinned_bank": bank_metadata,
        "finite_mask_count": finite_mask_count,
        "finite_masks_local_candidate_ok": finite_local_candidate_ok_mask_count,
        "finite_masks_locally_excluded": finite_mask_count - finite_local_candidate_ok_mask_count,
        "finite_rows_all_masks_locally_excluded": rows_all_local_candidate_excluded,
        "finite_rows_some_masks_locally_excluded": rows_some_local_candidate_excluded,
        "finite_rows_no_masks_locally_excluded": rows_no_local_candidate_excluded,
        "finite_masks_private_v_cross_separation_false": (
            finite_private_v_cross_separation_false_mask_count
        ),
        "finite_masks_private_w_cross_separation_false": (
            finite_private_w_cross_separation_false_mask_count
        ),
        "finite_rows_all_private_v_cross_separation_false": (
            finite_rows_all_private_v_cross_separation_false
        ),
        "finite_rows_all_private_w_cross_separation_false": (
            finite_rows_all_private_w_cross_separation_false
        ),
        "seeded_dfs_computed": run_seeded_dfs,
        "finite_distinct_seed_count": len(unique_seed_counts) if run_seeded_dfs else None,
        "finite_distinct_seeds_with_zero_completions": (
            sum(count == 0 for count in unique_seed_counts.values())
            if run_seeded_dfs
            else None
        ),
        "finite_distinct_seeds_with_positive_completions": (
            sum(count > 0 for count in unique_seed_counts.values())
            if run_seeded_dfs
            else None
        ),
        "finite_distinct_seed_completion_count_total": (
            sum(unique_seed_counts.values()) if run_seeded_dfs else None
        ),
        "finite_named_masks_with_zero_seeded_dfs_completions": finite_seeded_dfs_zero_mask_count,
        "finite_named_masks_with_positive_seeded_dfs_completions": (
            finite_seeded_dfs_positive_mask_count
        ),
        "finite_named_seeded_dfs_completion_count_total": finite_seeded_dfs_completion_count,
        "finite_rows_all_masks_seeded_dfs_zero": finite_rows_all_seeded_dfs_zero,
        "finite_rows_some_masks_seeded_dfs_zero": finite_rows_some_seeded_dfs_zero,
        "finite_rows_no_masks_seeded_dfs_zero": finite_rows_no_seeded_dfs_zero,
        "finite_masks_with_pinned_bank_completion": finite_bank_covered_mask_count,
        "finite_masks_without_pinned_bank_completion": finite_mask_count - finite_bank_covered_mask_count,
        "finite_pinned_bank_completion_count_total": finite_bank_completion_count,
        "finite_rows_all_masks_pinned_bank_covered": rows_all_bank_covered,
        "finite_rows_some_masks_pinned_bank_covered": rows_some_bank_covered,
        "finite_rows_no_masks_pinned_bank_covered": rows_no_bank_covered,
    }
    return {
        "schema": SCHEMA,
        "description": (
            "Finite ten-label producer targets for erased-pin exact-count rows. "
        "Rows marked needs_surplus_extra require a selected surplus-side "
        "point outside the chosen three-label surplus subpacket. Rows marked "
        "structurally_closed exceed the two-label opposite non-surplus pair."
        ),
        "source": str(rows_path),
        "pinned_bank_source": str(bank_path) if bank_path is not None else None,
        "labels": list(LABELS),
        "summary": summary,
        "rows": output_rows,
    }


def write_json(path: Path, payload: dict[str, Any]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(payload, indent=2, sort_keys=True) + "\n")


def write_markdown(path: Path, payload: dict[str, Any]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    summary = payload["summary"]
    rows = payload["rows"]
    lines = [
        "# Erased-pin producer census",
        "",
        "This generated report enumerates the finite ten-label selected-class",
        "masks required by each erased-pin exact-count row. It is a producer",
        "target census, not a metric certificate.",
        "",
        "## Summary",
        "",
        f"- rows: {summary['row_count']}",
        f"- finite ten-label rows: {summary['finite_ten_label_row_count']}",
        f"- blocked finite rows: {summary['blocked_row_count']}",
        f"- structurally closed pair-overflow rows: {summary['structurally_closed_row_count']}",
        f"- rows needing a surplus-extra bridge: {summary['surplus_extra_row_count']}",
        "- proof-facing rows after structural closure: "
        f"{summary['proof_facing_row_count_after_structural_closure']}",
        "- proof-facing finite ten-label rows: "
        f"{summary['proof_facing_finite_ten_label_row_count']}",
        "- proof-facing surplus-extra rows: "
        f"{summary['proof_facing_surplus_extra_row_count']}",
        f"- collapsed finite signatures: {summary['collapsed_signature_count']}",
        f"- generated Lean row seed lists: {summary['generated_row_seed_list_count']}",
        "- generated Lean signature seed lists: "
        f"{summary['generated_signature_seed_list_count']}",
        f"- route counts: `{summary['route_counts']}`",
        f"- finite rows by route: `{summary['finite_ten_label_rows_by_route']}`",
        f"- blocked rows by reason: `{summary['blocked_rows_by_reason']}`",
        f"- blocked rows by route and reason: `{summary['blocked_rows_by_route_and_reason']}`",
        f"- finite masks: {summary['finite_mask_count']}",
        f"- finite masks passing local candidate predicate: {summary['finite_masks_local_candidate_ok']}",
        f"- finite masks locally excluded: {summary['finite_masks_locally_excluded']}",
        "- finite rows with all masks locally excluded: "
        f"{summary['finite_rows_all_masks_locally_excluded']}",
        "- finite rows with some masks locally excluded: "
        f"{summary['finite_rows_some_masks_locally_excluded']}",
        "- finite rows with no masks locally excluded: "
        f"{summary['finite_rows_no_masks_locally_excluded']}",
        "- finite masks failing private-v cross-separation: "
        f"{summary['finite_masks_private_v_cross_separation_false']}",
        "- finite masks failing private-w cross-separation: "
        f"{summary['finite_masks_private_w_cross_separation_false']}",
        "- finite rows with all masks failing private-v cross-separation: "
        f"{summary['finite_rows_all_private_v_cross_separation_false']}",
        "- finite rows with all masks failing private-w cross-separation: "
        f"{summary['finite_rows_all_private_w_cross_separation_false']}",
        f"- seeded DFS computed: {summary['seeded_dfs_computed']}",
        f"- finite distinct fixed seeds: {summary['finite_distinct_seed_count']}",
        "- finite distinct seeds with zero DFS completions: "
        f"{summary['finite_distinct_seeds_with_zero_completions']}",
        "- finite distinct seeds with positive DFS completions: "
        f"{summary['finite_distinct_seeds_with_positive_completions']}",
        "- finite named masks with zero DFS completions: "
        f"{summary['finite_named_masks_with_zero_seeded_dfs_completions']}",
        "- finite named masks with positive DFS completions: "
        f"{summary['finite_named_masks_with_positive_seeded_dfs_completions']}",
        "- finite rows with all masks DFS-zero: "
        f"{summary['finite_rows_all_masks_seeded_dfs_zero']}",
        "- finite rows with some masks DFS-zero: "
        f"{summary['finite_rows_some_masks_seeded_dfs_zero']}",
        "- finite rows with no masks DFS-zero: "
        f"{summary['finite_rows_no_masks_seeded_dfs_zero']}",
        "- finite masks with pinned-bank completions: "
        f"{summary['finite_masks_with_pinned_bank_completion']}",
        "- finite masks without pinned-bank completions: "
        f"{summary['finite_masks_without_pinned_bank_completion']}",
        "- total pinned-bank completions over finite masks: "
        f"{summary['finite_pinned_bank_completion_count_total']}",
        "- finite rows with all masks pinned-bank covered: "
        f"{summary['finite_rows_all_masks_pinned_bank_covered']}",
        "- finite rows with some masks pinned-bank covered: "
        f"{summary['finite_rows_some_masks_pinned_bank_covered']}",
        "- finite rows with no masks pinned-bank covered: "
        f"{summary['finite_rows_no_masks_pinned_bank_covered']}",
        "",
        "## Rows",
        "",
        "| id | route | counts | oriented counts | finite masks | local-ok masks | private-v false | private-w false | DFS-zero masks | bank-covered masks | blocker | signatures |",
        "|---|---|---:|---:|---:|---:|---:|---:|---:|---:|---|---|",
    ]
    for row in rows:
        counts = row["counts"]
        oriented = row["oriented_counts"]
        lines.append(
            f"| `{row['id']}` | `{row['route']}` | "
            f"({counts['m']},{counts['s']},{counts['l']},{counts['r']}) | "
            f"({oriented['moser']},{oriented['same']},"
            f"{oriented['other_adjacent']},{oriented['surplus']}) | "
            f"{row['finite_mask_count']} | "
            f"{row['local_candidate_ok_mask_count']} | "
            f"{row['private_v_cross_separation_false_mask_count']} | "
            f"{row['private_w_cross_separation_false_mask_count']} | "
            f"{row['seeded_dfs_zero_mask_count'] if row['seeded_dfs_zero_mask_count'] is not None else ''} | "
            f"{row['pinned_bank_covered_mask_count']} | "
            f"`{row['finite_blocker'] or ''}` | "
            f"`{', '.join(row['collapsed_signatures'])}` |"
        )
    lines.extend(["", "## Collapsed Signatures", ""])
    for signature, row_ids in summary["collapsed_signatures"].items():
        lines.append(f"- `{signature}`: {', '.join(f'`{row_id}`' for row_id in row_ids)}")
    lines.append("")
    path.write_text("\n".join(lines))


def lean_label(label: str) -> str:
    return f".{label}"


def unique_seed_entries(payload: dict[str, Any]) -> list[tuple[str, str, int]]:
    seeds = {
        (str(mask["sstar"]), str(mask["center"]), int(mask["mask_value"]))
        for row in payload["rows"]
        if row["finite_blocker"] is None
        for mask in row["masks"]
    }
    return sorted(seeds, key=lambda item: (LABEL_INDEX[item[0]], LABEL_INDEX[item[1]], item[2]))


def lean_seed(seed: tuple[str, str, int]) -> str:
    sstar, private_center, private_mask = seed
    return (
        "{ sstar := "
        f"{lean_label(sstar)}, privateCenter := {lean_label(private_center)}, "
        f"kind := .own, privateMask := {private_mask} }}"
    )


def lean_ident_suffix(value: str) -> str:
    return "".join(ch if ch.isalnum() else "_" for ch in value)


def lean_row_seed_name(row_id: str) -> str:
    return f"erasedPinRow_{lean_ident_suffix(row_id)}_seeds"


def lean_signature_seed_name(signature: str) -> str:
    return f"erasedPinSignature_{lean_ident_suffix(signature)}_seeds"


def seeds_for_row(row: dict[str, Any]) -> list[tuple[str, str, int]]:
    seeds = {
        (str(mask["sstar"]), str(mask["center"]), int(mask["mask_value"]))
        for mask in row["masks"]
    }
    return sorted(seeds, key=lambda item: (LABEL_INDEX[item[0]], LABEL_INDEX[item[1]], item[2]))


def finite_rows(payload: dict[str, Any]) -> list[dict[str, Any]]:
    return [row for row in payload["rows"] if row["finite_blocker"] is None]


def signature_seed_entries(payload: dict[str, Any]) -> dict[str, list[tuple[str, str, int]]]:
    by_signature: dict[str, set[tuple[str, str, int]]] = {}
    for row in finite_rows(payload):
        row_seeds = set(seeds_for_row(row))
        for signature in row["collapsed_signatures"]:
            by_signature.setdefault(str(signature), set()).update(row_seeds)
    return {
        signature: sorted(seeds, key=lambda item: (LABEL_INDEX[item[0]], LABEL_INDEX[item[1]], item[2]))
        for signature, seeds in sorted(by_signature.items())
    }


def lean_seed_list(seeds: list[tuple[str, str, int]]) -> str:
    if not seeds:
        return "[]"
    seed_lines = ",\n".join(f"  {lean_seed(seed)}" for seed in seeds)
    return f"[\n{seed_lines}\n]"


def lean_row_seed_defs(payload: dict[str, Any]) -> str:
    sections: list[str] = []
    for row in finite_rows(payload):
        name = lean_row_seed_name(str(row["id"]))
        candidate_name = f"{name}_candidates"
        allowed_name = f"{name}_allowed"
        row_seeds = seeds_for_row(row)
        sections.append(
            f"""/-- Candidate fixed seeds associated to erased-pin producer row `{row["id"]}`. -/
def {candidate_name} : List OneSidedSeed :=
{lean_seed_list(row_seeds)}

/-- Boolean membership test for row `{row["id"]}` candidate seeds. -/
def {allowed_name} (seed : OneSidedSeed) : Bool :=
  {candidate_name}.any (fun candidate => candidate == seed)

/-- Fixed-bank seeds associated to erased-pin producer row `{row["id"]}`. -/
def {name} : List OneSidedSeed :=
  erasedPinFixedSeeds.filter {allowed_name}

/-- Every seed for row `{row["id"]}` is in the generated fixed-seed bank. -/
theorem {name}_subset_fixed {{seed : OneSidedSeed}}
    (hseed : seed ∈ {name}) : seed ∈ erasedPinFixedSeeds :=
  (List.mem_filter.mp hseed).1

/-- The fixed-bank row filter recovers exactly the row `{row["id"]}` candidate
seed list. -/
theorem {name}_eq_candidates :
    {name} = {candidate_name} := by
  native_decide

/-- Every candidate seed for row `{row["id"]}` is in the generated fixed-seed
bank. -/
theorem {candidate_name}_subset_fixed {{seed : OneSidedSeed}}
    (hseed : seed ∈ {candidate_name}) : seed ∈ erasedPinFixedSeeds :=
  {name}_subset_fixed (by
    simpa [{name}_eq_candidates] using hseed)

/-- The fixed bank contains every candidate seed for row `{row["id"]}`. -/
theorem {name}_length :
    {name}.length = {len(row_seeds)} := by
  native_decide"""
        )
    return "\n\n".join(sections)


def lean_signature_seed_defs(payload: dict[str, Any]) -> str:
    sections: list[str] = []
    for signature, seeds in signature_seed_entries(payload).items():
        name = lean_signature_seed_name(signature)
        candidate_name = f"{name}_candidates"
        allowed_name = f"{name}_allowed"
        sections.append(
            f"""/-- Candidate fixed seeds associated to oriented incidence signature `{signature}`. -/
def {candidate_name} : List OneSidedSeed :=
{lean_seed_list(seeds)}

/-- Boolean membership test for signature `{signature}` candidate seeds. -/
def {allowed_name} (seed : OneSidedSeed) : Bool :=
  {candidate_name}.any (fun candidate => candidate == seed)

/-- Deduplicated fixed-bank seeds associated to oriented incidence signature `{signature}`. -/
def {name} : List OneSidedSeed :=
  erasedPinFixedSeeds.filter {allowed_name}

/-- Every seed for signature `{signature}` is in the generated fixed-seed bank. -/
theorem {name}_subset_fixed {{seed : OneSidedSeed}}
    (hseed : seed ∈ {name}) : seed ∈ erasedPinFixedSeeds :=
  (List.mem_filter.mp hseed).1

/-- The fixed-bank signature filter recovers exactly the signature `{signature}`
candidate seed list. -/
theorem {name}_eq_candidates :
    {name} = {candidate_name} := by
  native_decide

/-- Every candidate seed for signature `{signature}` is in the generated
fixed-seed bank. -/
theorem {candidate_name}_subset_fixed {{seed : OneSidedSeed}}
    (hseed : seed ∈ {candidate_name}) : seed ∈ erasedPinFixedSeeds :=
  {name}_subset_fixed (by
    simpa [{name}_eq_candidates] using hseed)

/-- The fixed bank contains every candidate seed for signature `{signature}`. -/
theorem {name}_length :
    {name}.length = {len(seeds)} := by
  native_decide"""
        )
    return "\n\n".join(sections)


def lean_seed_invalid_theorems(payload: dict[str, Any]) -> str:
    sections: list[str] = []
    for row in finite_rows(payload):
        row_id = str(row["id"])
        name = lean_row_seed_name(row_id)
        candidate_name = f"{name}_candidates"
        sections.append(
            f"""/-- No valid seeded shadow can use a candidate seed from erased-pin
producer row `{row_id}`. -/
theorem {candidate_name}_false_of_isValidOneSidedSeedShadow
    {{seed : OneSidedSeed}} {{shadow : Shadow}}
    (hseed : seed ∈ {candidate_name})
    (hvalid : isValidOneSidedSeedShadow seed shadow = true) :
    False :=
  false_of_isValidOneSidedSeedShadow_of_mem_erasedPinFixedSeed
    ({candidate_name}_subset_fixed hseed) hvalid"""
        )
    for signature in signature_seed_entries(payload):
        name = lean_signature_seed_name(signature)
        candidate_name = f"{name}_candidates"
        sections.append(
            f"""/-- No valid seeded shadow can use a candidate seed from oriented
incidence signature `{signature}`. -/
theorem {candidate_name}_false_of_isValidOneSidedSeedShadow
    {{seed : OneSidedSeed}} {{shadow : Shadow}}
    (hseed : seed ∈ {candidate_name})
    (hvalid : isValidOneSidedSeedShadow seed shadow = true) :
    False :=
  false_of_isValidOneSidedSeedShadow_of_mem_erasedPinFixedSeed
    ({candidate_name}_subset_fixed hseed) hvalid"""
        )
    return "\n\n".join(sections)


def rows_all_private_w_cross_separation_false(payload: dict[str, Any]) -> list[dict[str, Any]]:
    return [
        row
        for row in finite_rows(payload)
        if row["finite_mask_count"] > 0
        and row["private_w_cross_separation_false_mask_count"] == row["finite_mask_count"]
    ]


def lean_row_private_w_cross_separation_name(row_id: str) -> str:
    return f"erasedPinRow_{lean_ident_suffix(row_id)}_seed_private_w_crossSeparation_false"


def lean_row_cross_separation_theorems(payload: dict[str, Any]) -> str:
    sections: list[str] = []
    for row in rows_all_private_w_cross_separation_false(payload):
        row_id = str(row["id"])
        candidate_name = f"{lean_row_seed_name(row_id)}_candidates"
        theorem_name = lean_row_private_w_cross_separation_name(row_id)
        sections.append(
            f"""/-- Every generated seed for row `{row_id}` fails the
cross-separation check against the exact `.w` cap mask. -/
theorem {theorem_name}
    {{seed : OneSidedSeed}}
    (hseed : seed ∈ {candidate_name}) :
    crossSeparationOKForMasks seed.privateCenter seed.privateMask
      .w secondOppExactCapMask = false := by
  have hall : {candidate_name}.all
      (fun seed : OneSidedSeed =>
        decide (crossSeparationOKForMasks seed.privateCenter seed.privateMask
          .w secondOppExactCapMask = false)) = true := by
    decide
  exact of_decide_eq_true (List.all_eq_true.mp hall seed hseed)"""
        )
    return "\n\n".join(sections)


def write_lean(path: Path, payload: dict[str, Any]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    seeds = unique_seed_entries(payload)
    seed_lines = ",\n".join(f"  {lean_seed(seed)}" for seed in seeds)
    row_seed_defs = lean_row_seed_defs(payload)
    signature_seed_defs = lean_signature_seed_defs(payload)
    row_cross_separation_theorems = lean_row_cross_separation_theorems(payload)
    seed_invalid_theorems = lean_seed_invalid_theorems(payload)
    text = f"""/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusSeededShadow

/-!
# Generated erased-pin fixed-seed DFS

This module is generated by `scripts/erased-pin-producer-census.py`.
It records the generalized one-sided fixed seeds needed by the erased-pin
finite exact-count row producer census.  The seed kind is not inspected by the
DFS validator; all generated row seeds use `.own` as a canonical tag.
-/

namespace Problem97
namespace SurplusCOMPGBank

/-- The 330 deduplicated fixed seeds from the erased-pin finite row census. -/
def erasedPinFixedSeeds : List OneSidedSeed :=
[
{seed_lines}
]

/-- Canonicalize the seed tag used for fixed-row bank membership.

The seeded one-sided validator depends on `sstar`, `privateCenter`, and
`privateMask`; the `kind` field is only an audit tag for the branch that
produced the private mask.  The erased-pin row bank therefore deduplicates
against `.own`. -/
def erasedPinCanonicalSeed (seed : OneSidedSeed) : OneSidedSeed :=
  {{ seed with kind := .own }}

theorem erasedPinCanonicalSeed_candidateMasks
    (seed : OneSidedSeed) (center : Label) :
    (erasedPinCanonicalSeed seed).candidateMasks center =
      seed.candidateMasks center := by
  cases seed <;> cases center <;>
    simp [erasedPinCanonicalSeed, OneSidedSeed.candidateMasks,
      OneSidedSeed.fixedMask]

theorem isValidOneSidedSeedShadow_erasedPinCanonicalSeed
    {{seed : OneSidedSeed}} {{shadow : Shadow}}
    (hvalid : isValidOneSidedSeedShadow seed shadow = true) :
    isValidOneSidedSeedShadow (erasedPinCanonicalSeed seed) shadow = true := by
  cases seed
  simpa [erasedPinCanonicalSeed, isValidOneSidedSeedShadow] using hvalid

/-! ## Row/signature producer seed lists -/

{row_seed_defs}

{signature_seed_defs}

/-! ## Row cross-separation consequences -/

{row_cross_separation_theorems}

/-- Combined DFS entries for the erased-pin fixed seeds. -/
def erasedPinFixedSeedSearchEntries : List (OneSidedSeed × List Nat) :=
  erasedPinFixedSeeds.flatMap oneSidedSeedSearchEntriesFor

theorem erasedPinFixedSeeds_length :
    erasedPinFixedSeeds.length = {len(seeds)} := by
  native_decide

/-- Every generated erased-pin fixed seed has an exact four-point private mask. -/
theorem erasedPinFixedSeeds_privateMask_card :
    ∀ seed ∈ erasedPinFixedSeeds, maskCard seed.privateMask = 4 := by
  native_decide

/-- No generated erased-pin fixed seed has its private center in its private
mask. -/
theorem erasedPinFixedSeeds_privateMask_self_false :
    ∀ seed ∈ erasedPinFixedSeeds,
      maskHas seed.privateMask seed.privateCenter = false := by
  native_decide

/-- No generated erased-pin fixed seed has the full `u/v/w` triple in its
private mask. -/
theorem erasedPinFixedSeeds_privateMask_no_moser_triple :
    ∀ seed ∈ erasedPinFixedSeeds,
      (maskHas seed.privateMask .u &&
          maskHas seed.privateMask .v &&
          maskHas seed.privateMask .w) = false := by
  native_decide

/-- The first exact opposite-cap mask is accepted at `.v` for every generated
erased-pin fixed seed. -/
theorem erasedPinFixedSeeds_firstOppExactCapMask_mem_candidateMasks_v :
    ∀ seed ∈ erasedPinFixedSeeds,
      firstOppExactCapMask ∈ seed.candidateMasks .v := by
  native_decide

/-- The second exact opposite-cap mask is accepted at `.w` for every generated
erased-pin fixed seed. -/
theorem erasedPinFixedSeeds_secondOppExactCapMask_mem_candidateMasks_w :
    ∀ seed ∈ erasedPinFixedSeeds,
      secondOppExactCapMask ∈ seed.candidateMasks .w := by
  native_decide

/-- Each generated erased-pin fixed seed accepts its own private mask at its
private center. -/
theorem erasedPinFixedSeeds_privateMask_mem_candidateMasks_privateCenter :
    ∀ seed ∈ erasedPinFixedSeeds,
      seed.privateMask ∈ seed.candidateMasks seed.privateCenter := by
  native_decide

/-- The generalized erased-pin fixed-seed incidence search has no survivors. -/
theorem erasedPinFixedSeedSearchEntries_eq_nil :
    erasedPinFixedSeedSearchEntries = [] := by
  native_decide

/-- Every valid shadow for a listed erased-pin fixed seed appears in the
combined fixed-seed DFS entry list. -/
theorem mem_erasedPinFixedSeedSearchEntries_of_isValidOneSidedSeedShadow
    {{seed : OneSidedSeed}} {{shadow : Shadow}}
    (hseed : seed ∈ erasedPinFixedSeeds)
    (hvalid : isValidOneSidedSeedShadow seed shadow = true) :
    (seed, shadow.masks) ∈ erasedPinFixedSeedSearchEntries := by
  unfold erasedPinFixedSeedSearchEntries
  exact List.mem_flatMap.mpr
    ⟨seed, hseed,
      mem_oneSidedSeedSearchEntriesFor_of_isValidOneSidedSeedShadow hvalid⟩

/-- No listed erased-pin fixed seed admits a valid seeded shadow. -/
theorem false_of_isValidOneSidedSeedShadow_of_mem_erasedPinFixedSeed
    {{seed : OneSidedSeed}} {{shadow : Shadow}}
    (hseed : seed ∈ erasedPinFixedSeeds)
    (hvalid : isValidOneSidedSeedShadow seed shadow = true) :
    False := by
  have hmem :=
    mem_erasedPinFixedSeedSearchEntries_of_isValidOneSidedSeedShadow
      hseed hvalid
  simp [erasedPinFixedSeedSearchEntries_eq_nil] at hmem

/-- No seed whose canonical erased-pin row seed is listed admits a valid
seeded shadow.  This is the kind-insensitive form used by geometric producers
whose payload split records `.oppositeU` or `.oppositeW` even though the fixed
row bank deduplicates on `.own`. -/
theorem false_of_isValidOneSidedSeedShadow_of_mem_erasedPinCanonicalSeed
    {{seed : OneSidedSeed}} {{shadow : Shadow}}
    (hseed : erasedPinCanonicalSeed seed ∈ erasedPinFixedSeeds)
    (hvalid : isValidOneSidedSeedShadow seed shadow = true) :
    False :=
  false_of_isValidOneSidedSeedShadow_of_mem_erasedPinFixedSeed hseed
    (isValidOneSidedSeedShadow_erasedPinCanonicalSeed hvalid)

/-! ## Row/signature no-survivor consequences -/

{seed_invalid_theorems}

end SurplusCOMPGBank
end Problem97
"""
    path.write_text(text)


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--rows",
        type=Path,
        default=Path("certificates/surplus/erased_pin_count_rows.json"),
        help="Generated erased-pin exact-count row census JSON.",
    )
    parser.add_argument(
        "--json-out",
        type=Path,
        default=Path("certificates/surplus/erased_pin_producer_census.json"),
        help="Output producer census JSON.",
    )
    parser.add_argument(
        "--markdown-out",
        type=Path,
        default=Path("certificates/surplus/reports/erased_pin_producer_census.md"),
        help="Output producer census Markdown report.",
    )
    parser.add_argument(
        "--lean-out",
        type=Path,
        default=Path("lean/Erdos9796Proof/P97/ErasedPinFixedSeedDFS.lean"),
        help="Generated Lean module for the generalized fixed-seed DFS.",
    )
    parser.add_argument(
        "--pinned-bank",
        type=Path,
        default=Path("certificates/surplus/pinned_surplus_comp_g_bank.json"),
        help="Optional pinned surplus COMP-G bank used to annotate finite masks.",
    )
    parser.add_argument(
        "--seeded-dfs",
        dest="seeded_dfs",
        action="store_true",
        default=True,
        help="Run the generalized one-sided fixed-seed DFS for each finite mask.",
    )
    parser.add_argument(
        "--skip-seeded-dfs",
        dest="seeded_dfs",
        action="store_false",
        help="Skip the generalized one-sided fixed-seed DFS.",
    )
    return parser.parse_args()


def main() -> None:
    args = parse_args()
    payload = build_census(args.rows, args.pinned_bank, args.seeded_dfs)
    write_json(args.json_out, payload)
    write_markdown(args.markdown_out, payload)
    write_lean(args.lean_out, payload)
    print(f"wrote {args.json_out}")
    print(f"wrote {args.markdown_out}")
    print(f"wrote {args.lean_out}")


if __name__ == "__main__":
    main()
