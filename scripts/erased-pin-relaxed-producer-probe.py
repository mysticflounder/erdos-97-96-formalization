#!/usr/bin/env python3
#
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
#
"""Probe relaxed erased-pin row producers.

The generated erased-pin row producers currently close rows by building a
valid `OneSidedSeedShadow`, which requires every non-fixed center mask to be
in `seed.candidateMasks`.  The active non-surplus branch does not have that
candidate premise.  This probe checks the weaker interface that the finite
row packets already expose: fixed `.v`, `.w`, and private masks, global
no-three / prefix-pair-count constraints, and separation constraints.

The search is deliberately over-approximating.  A zero-survivor result here is
usable as a producer target; a positive survivor only means the weaker
interface is not enough for that seed/mode.

Use `--symmetry-scope selected` for the same-radius selected-class symmetry
that is proof-facing in the erased-payload scaffold.  `--symmetry-scope all`
is an overstrong diagnostic only: the `.v` and `.w` centers are exact cap
classes, not selected classes at the shared radius.
"""

from __future__ import annotations

import argparse
import importlib.util
import json
from collections import Counter
from functools import lru_cache
from pathlib import Path
from typing import Any


BASE_SCRIPT = Path("scripts/erased-pin-producer-census.py")
DEFAULT_CENSUS = Path("certificates/surplus/erased_pin_producer_census.json")


def load_base_module(script_path: Path = BASE_SCRIPT) -> Any:
    spec = importlib.util.spec_from_file_location(
        "erased_pin_producer_census", script_path
    )
    if spec is None or spec.loader is None:
        raise RuntimeError(f"could not load producer module from {script_path}")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def load_json(path: Path) -> Any:
    with path.open() as handle:
        return json.load(handle)


def finite_rows(payload: dict[str, Any]) -> list[dict[str, Any]]:
    return [row for row in payload["rows"] if row["finite_blocker"] is None]


def mask_labels(base: Any, mask: int) -> list[str]:
    return [label for label in base.LABELS if base.mask_has(mask, label)]


def seed_key(sstar: str, private_center: str, private_mask: int) -> str:
    return f"{sstar}|{private_center}|{private_mask}"


def row_seed_records(payload: dict[str, Any]) -> list[dict[str, Any]]:
    records: dict[str, dict[str, Any]] = {}
    for row in finite_rows(payload):
        row_id = str(row["id"])
        for mask in row["masks"]:
            sstar = str(mask["sstar"])
            private_center = str(mask["center"])
            private_mask = int(mask["mask_value"])
            key = seed_key(sstar, private_center, private_mask)
            record = records.setdefault(
                key,
                {
                    "key": key,
                    "sstar": sstar,
                    "private_center": private_center,
                    "private_mask": private_mask,
                    "row_ids": [],
                },
            )
            record["row_ids"].append(row_id)
    for record in records.values():
        record["row_ids"] = sorted(set(record["row_ids"]))
    return sorted(records.values(), key=lambda item: item["key"])


def mask_allowed(base: Any, mode: str, sstar: str, center: str, mask: int) -> bool:
    if mode == "raw":
        return 0 <= mask < base.MASK_BOUND
    if mode == "no_self":
        return 0 <= mask < base.MASK_BOUND and not base.mask_has(mask, center)
    if mode == "shape":
        return (
            0 <= mask < base.MASK_BOUND
            and base.mask_card(mask) == 4
            and not base.mask_has(mask, center)
        )
    if mode == "candidate":
        return base.local_candidate_mask_ok(sstar, center, mask)
    raise ValueError(f"unknown mode {mode!r}")


def ordered_cross_ok(base: Any, c: str, cmask: int, cp: str, cpmask: int) -> bool:
    return base.cross_separation_ok_for_masks(
        c, cmask, cp, cpmask
    ) and base.cross_separation_ok_for_masks(cp, cpmask, c, cmask)


def pair_count_delta(base: Any, center: str, mask: int) -> tuple[int, ...]:
    return tuple(
        1 if base.point_pair_hit_by_center_mask(center, mask, pair) else 0
        for pair in base.LABEL_PAIRS
    )


def add_counts(counts: tuple[int, ...], delta: tuple[int, ...]) -> tuple[int, ...]:
    return tuple(left + right for left, right in zip(counts, delta))


def counts_ok(counts: tuple[int, ...]) -> bool:
    return all(count <= 2 for count in counts)


def fixed_masks_for_seed(base: Any, private_center: str, private_mask: int) -> dict[str, int]:
    return {
        "v": base.FIRST_OPP_EXACT_CAP_MASK,
        "w": base.SECOND_OPP_EXACT_CAP_MASK,
        private_center: private_mask,
    }


def symmetric_centers(base: Any, scope: str) -> tuple[str, ...]:
    if scope == "none":
        return ()
    if scope == "selected":
        return tuple(label for label in base.LABELS if label not in ("v", "w"))
    if scope == "all":
        return tuple(base.LABELS)
    raise ValueError(f"unknown symmetry scope {scope!r}")


def symmetric_masks_ok(
    base: Any, masks_by_center: dict[str, int], symmetry_scope: str
) -> bool:
    centers = symmetric_centers(base, symmetry_scope)
    return all(
        base.mask_has(masks_by_center[c], cp)
        == base.mask_has(masks_by_center[cp], c)
        for c in centers
        for cp in centers
        if c != cp
    )


def symmetric_with_assigned_ok(
    base: Any,
    center: str,
    mask: int,
    assigned: dict[str, int],
    symmetry_scope: str,
) -> bool:
    centers = set(symmetric_centers(base, symmetry_scope))
    if center not in centers:
        return True
    return all(
        base.mask_has(other_mask, center) == base.mask_has(mask, other)
        for other, other_mask in assigned.items()
        if other in centers
    )


def final_valid(
    base: Any, masks_by_center: dict[str, int], symmetry_scope: str
) -> bool:
    masks = [masks_by_center[label] for label in base.LABELS]
    return (
        base.no_three_ok(masks)
        and base.separation_ok(masks)
        and base.search_separation_ok(masks)
        and (
            symmetry_scope == "none"
            or symmetric_masks_ok(base, masks_by_center, symmetry_scope)
        )
    )


@lru_cache(maxsize=None)
def all_masks_for_mode_cached(
    script_path: str, mode: str, sstar: str, center: str
) -> tuple[int, ...]:
    base = load_base_module(Path(script_path))
    return tuple(
        mask
        for mask in range(base.MASK_BOUND)
        if mask_allowed(base, mode, sstar, center, mask)
    )


def all_masks_for_mode(base: Any, script_path: Path, mode: str, sstar: str, center: str) -> tuple[int, ...]:
    return all_masks_for_mode_cached(str(script_path), mode, sstar, center)


def relaxed_survivor_count(
    base: Any,
    script_path: Path,
    sstar: str,
    private_center: str,
    private_mask: int,
    mode: str,
    max_survivors: int,
    symmetry_scope: str,
) -> tuple[int, list[dict[str, Any]]]:
    fixed = fixed_masks_for_seed(base, private_center, private_mask)
    if any(not mask_allowed(base, mode, sstar, center, mask) for center, mask in fixed.items()):
        return 0, []

    assigned: dict[str, int] = {}
    counts = tuple(0 for _ in base.LABEL_PAIRS)
    for center in base.FRAGMENT_SEARCH_ORDER:
        if center not in fixed:
            continue
        mask = fixed[center]
        if any(
            not ordered_cross_ok(base, center, mask, other, other_mask)
            for other, other_mask in assigned.items()
        ):
            return 0, []
        counts = add_counts(counts, pair_count_delta(base, center, mask))
        if not counts_ok(counts):
            return 0, []
        assigned[center] = mask

    remaining = [center for center in base.FRAGMENT_SEARCH_ORDER if center not in fixed]
    candidates_by_center: dict[str, tuple[int, ...]] = {}
    for center in remaining:
        candidates = []
        for mask in all_masks_for_mode(base, script_path, mode, sstar, center):
            if symmetry_scope != "none" and not symmetric_with_assigned_ok(
                base, center, mask, assigned, symmetry_scope
            ):
                continue
            next_counts = add_counts(counts, pair_count_delta(base, center, mask))
            if not counts_ok(next_counts):
                continue
            if any(
                not ordered_cross_ok(base, center, mask, other, other_mask)
                for other, other_mask in assigned.items()
            ):
                continue
            candidates.append(mask)
        candidates_by_center[center] = tuple(candidates)

    search_order = sorted(remaining, key=lambda center: len(candidates_by_center[center]))
    survivors: list[dict[str, Any]] = []
    count = 0

    def dfs(
        index: int,
        current_counts: tuple[int, ...],
        current: dict[str, int],
    ) -> None:
        nonlocal count
        if max_survivors and count >= max_survivors:
            return
        if index == len(search_order):
            masks_by_center = {**assigned, **current}
            if final_valid(base, masks_by_center, symmetry_scope):
                count += 1
                if len(survivors) < 3:
                    survivors.append(
                        {
                            center: {
                                "mask_value": masks_by_center[center],
                                "mask": base.mask_key(
                                    mask_labels(base, masks_by_center[center])
                                ),
                            }
                            for center in base.LABELS
                        }
                    )
            return

        center = search_order[index]
        for mask in candidates_by_center[center]:
            if symmetry_scope != "none" and not symmetric_with_assigned_ok(
                base, center, mask, current, symmetry_scope
            ):
                continue
            if any(
                not ordered_cross_ok(base, center, mask, other, other_mask)
                for other, other_mask in current.items()
            ):
                continue
            next_counts = add_counts(current_counts, pair_count_delta(base, center, mask))
            if not counts_ok(next_counts):
                continue
            current[center] = mask
            dfs(index + 1, next_counts, current)
            current.pop(center)

    dfs(0, counts, {})
    return count, survivors


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--census", type=Path, default=DEFAULT_CENSUS)
    parser.add_argument("--base-script", type=Path, default=BASE_SCRIPT)
    parser.add_argument(
        "--mode",
        choices=("raw", "no_self", "shape", "candidate"),
        default="raw",
        help="Mask universe for non-fixed centers.",
    )
    parser.add_argument(
        "--row",
        action="append",
        default=[],
        help="Restrict to finite row ids containing this substring; repeatable.",
    )
    parser.add_argument(
        "--seed",
        action="append",
        default=[],
        help="Restrict to seed keys like s1|Pw|27; repeatable.",
    )
    parser.add_argument(
        "--max-survivors",
        type=int,
        default=1,
        help="Stop after this many survivors per seed; 0 means count all.",
    )
    parser.add_argument(
        "--summary-only",
        action="store_true",
        help="Print only aggregate counts and the open seed keys.",
    )
    parser.add_argument(
        "--symmetry-scope",
        choices=("none", "selected", "all"),
        default="none",
        help=(
            "Require pairwise symmetric membership for no centers, only "
            "same-radius selected-class centers, or all centers."
        ),
    )
    parser.add_argument(
        "--symmetric",
        action="store_true",
        help="Deprecated alias for --symmetry-scope all.",
    )
    return parser.parse_args()


def main() -> None:
    args = parse_args()
    symmetry_scope = "all" if args.symmetric else str(args.symmetry_scope)
    base = load_base_module(args.base_script)
    payload = load_json(args.census)
    if payload.get("schema") != base.SCHEMA:
        raise ValueError(f"unsupported census schema {payload.get('schema')!r}")

    records = row_seed_records(payload)
    if args.row:
        records = [
            record
            for record in records
            if any(
                needle in row_id
                for needle in args.row
                for row_id in record["row_ids"]
            )
        ]
    if args.seed:
        wanted = set(args.seed)
        records = [record for record in records if record["key"] in wanted]

    summary = Counter()
    results = []
    for record in records:
        count, survivors = relaxed_survivor_count(
            base,
            args.base_script,
            str(record["sstar"]),
            str(record["private_center"]),
            int(record["private_mask"]),
            str(args.mode),
            int(args.max_survivors),
            symmetry_scope,
        )
        closed = count == 0
        summary["seed_count"] += 1
        summary["closed_seed_count" if closed else "open_seed_count"] += 1
        results.append(
            {
                **record,
                "mode": args.mode,
                "closed": closed,
                "survivor_count_lower_bound": count,
                "survivors_sample": survivors,
            }
        )

    output = {
        "schema": "p97.erased_pin_relaxed_producer_probe.v1",
        "mode": args.mode,
        "max_survivors": args.max_survivors,
        "symmetry_scope": symmetry_scope,
        "summary": dict(summary),
    }
    if args.summary_only:
        output["open_seed_keys"] = [
            result["key"] for result in results if not result["closed"]
        ]
    else:
        output["results"] = results
    print(json.dumps(output, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
