#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
"""Diagnose finite-shadow rejection for one erased-pin fixed seed."""

from __future__ import annotations

import argparse
import importlib.util
from collections import Counter, defaultdict
from pathlib import Path


ROOT = Path(__file__).resolve().parents[2]
PRODUCER = ROOT / "scripts" / "erased-pin-producer-census.py"


def load_producer():
    spec = importlib.util.spec_from_file_location("erased_pin_producer_census", PRODUCER)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot load producer module at {PRODUCER}")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def labels_of(module, mask: int) -> str:
    return "{" + ",".join(label for label in module.LABELS if module.mask_has(mask, label)) + "}"


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--sstar", default="s2")
    parser.add_argument("--private-center", default="Pu")
    parser.add_argument("--private-mask", nargs="+", default=["Q1", "Q2", "s2", "s3"])
    parser.add_argument("--limit-examples", type=int, default=8)
    args = parser.parse_args()

    module = load_producer()
    private_mask = module.mask_value(args.private_mask)
    masks = [0] * len(module.LABELS)
    pair_counts = [0] * len(module.LABEL_PAIRS)
    assigned: list[str] = []
    stats = Counter()
    center_stats: dict[str, Counter] = defaultdict(Counter)
    examples: dict[str, list[str]] = defaultdict(list)

    def candidate_masks(center: str) -> tuple[int, ...]:
        return module.one_sided_seed_candidate_masks(
            args.sstar, args.private_center, private_mask, center
        )

    def add_example(key: str, text: str) -> None:
        if len(examples[key]) < args.limit_examples:
            examples[key].append(text)

    def add_pair_counts(center: str, mask: int, delta: int) -> list[int]:
        changed: list[int] = []
        for index, pair in enumerate(module.LABEL_PAIRS):
            if module.point_pair_hit_by_center_mask(center, mask, pair):
                pair_counts[index] += delta
                changed.append(index)
        return changed

    def final_failures() -> list[str]:
        failures: list[str] = []
        if not module.w_squeeze_ok(masks):
            failures.append("w_squeeze")
        if not module.one_hit_ok(masks):
            failures.append("one_hit")
        if not module.circumcenter_ok(masks):
            failures.append("circumcenter")
        if not module.no_three_ok(masks):
            failures.append("no_three")
        if not module.separation_ok(masks):
            failures.append("separation")
        if not module.search_separation_ok(masks):
            failures.append("search_separation")
        if not module.fragment_triggers_ok(args.sstar, masks):
            failures.append("fragment_triggers")
        if not failures:
            failures.append("accepted")
        return failures

    def dfs(index: int) -> None:
        if index == len(module.FRAGMENT_SEARCH_ORDER):
            stats["leaf"] += 1
            failures = final_failures()
            for failure in failures:
                stats[f"final:{failure}"] += 1
                if failure != "accepted":
                    add_example(
                        f"final:{failure}",
                        ", ".join(
                            f"{center}={labels_of(module, masks[module.LABEL_INDEX[center]])}"
                            for center in module.LABELS
                        ),
                    )
            return

        center = module.FRAGMENT_SEARCH_ORDER[index]
        candidates = candidate_masks(center)
        center_stats[center]["raw"] += len(candidates)
        for mask in candidates:
            stats["candidate"] += 1
            if any(
                not module.cross_separation_ok_for_masks(
                    center, mask, other, masks[module.LABEL_INDEX[other]]
                )
                for other in assigned
            ):
                stats["prune:cross_separation"] += 1
                center_stats[center]["cross_separation"] += 1
                add_example(
                    f"{center}:cross_separation",
                    f"{center}={labels_of(module, mask)} after {assigned}",
                )
                continue
            changed = add_pair_counts(center, mask, 1)
            if any(pair_counts[pair_index] > 2 for pair_index in changed):
                stats["prune:no_three"] += 1
                center_stats[center]["no_three"] += 1
                add_example(
                    f"{center}:no_three",
                    f"{center}={labels_of(module, mask)} after {assigned}",
                )
            else:
                center_stats[center]["accepted_prefix"] += 1
                masks[module.LABEL_INDEX[center]] = mask
                assigned.append(center)
                dfs(index + 1)
                assigned.pop()
                masks[module.LABEL_INDEX[center]] = 0
            for pair_index in changed:
                pair_counts[pair_index] -= 1

    print(
        "seed",
        args.sstar,
        args.private_center,
        labels_of(module, private_mask),
        private_mask,
    )
    print("search_order", " ".join(module.FRAGMENT_SEARCH_ORDER))
    for center in module.FRAGMENT_SEARCH_ORDER:
        fixed = module.one_sided_seed_fixed_mask(args.private_center, private_mask, center)
        if fixed is None:
            print(center, "candidates", len(candidate_masks(center)))
        else:
            print(center, "fixed", labels_of(module, fixed), fixed)

    dfs(0)

    print("\nsummary")
    for key, value in sorted(stats.items()):
        print(key, value)
    print("\nby_center")
    for center in module.FRAGMENT_SEARCH_ORDER:
        row = center_stats[center]
        if row:
            print(center, dict(sorted(row.items())))
    print("\nexamples")
    for key, rows in sorted(examples.items()):
        print(key)
        for row in rows:
            print("  ", row)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
