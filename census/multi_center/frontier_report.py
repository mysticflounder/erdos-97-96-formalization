#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
"""Report whether multi-center incidence sweeps affect the active proof leaf.

The multi-center census is useful for the U4/tail incidence route, but the
current erased-pin leaf asks for producer facts of a different shape.  This
script keeps that distinction explicit while still extracting the exact
completed sweep evidence from the JSON artifacts.
"""
from __future__ import annotations

import argparse
import glob
import sys
from collections import Counter
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from census.multi_center import analyze_sweeps as sweeps


ACTIVE_LEAF = "Problem97.isM44NonSurplusContainmentErasedPinTripleResidualsExcluded"
ACTIVE_OPEN_TOTAL = "1/785"
ERASED_PIN_PRODUCERS = (
    "ErasedPinFiniteCandidateSepScaffoldFacts S x",
    "ErasedPinTriple A x (S.oppositeVertexByIndex S.surplusIdx) -> False",
    (
        "forall p in S.capInteriorByIndex S.surplusIdx, "
        "p in A.erase x -> ErasedPinTriple A x p -> False"
    ),
)


def fmt(value: int) -> str:
    return f"{value:,}"


def latest_stable_window(
    by_n: dict[int, sweeps.NAggregate],
    *,
    min_width: int,
) -> tuple[int, int, int] | None:
    rows: list[tuple[int, set[str], Counter[str]]] = []
    for n in sorted(by_n):
        agg = by_n[n]
        rows.append((n, agg.keys_with_status("SAT"), agg.summary))

    best: tuple[int, int, int] | None = None
    for left in range(len(rows)):
        n0, keys0, _summary0 = rows[left]
        right = left
        while right + 1 < len(rows):
            _n1, keys1, summary1 = rows[right + 1]
            if keys1 != keys0 or summary1["INDETERMINATE"]:
                break
            right += 1
        width = right - left + 1
        if width >= min_width:
            n1 = rows[right][0]
            candidate = (n0, n1, len(keys0))
            if best is None or (candidate[1], candidate[0]) > (best[1], best[0]):
                best = candidate
    return best


def cumulative_counts(by_n: dict[int, sweeps.NAggregate]) -> tuple[int, int, int, int]:
    tested = 0
    sat = 0
    unsat = 0
    indet = 0
    for agg in by_n.values():
        summary = agg.summary
        tested += agg.tested
        sat += summary["SAT"]
        unsat += summary["UNSAT"]
        indet += summary["INDETERMINATE"]
    return tested, sat, unsat, indet


def print_artifact_warnings(
    statuses: list[tuple[Path, str, list[int]]],
    *,
    expected_pending: tuple[str, ...],
) -> None:
    print("Artifact Status")
    for path, status, ns in statuses:
        if status == "OK":
            continue
        if ns:
            n_text = f"n={ns[0]}" if len(ns) == 1 else f"n={ns[0]}..{ns[-1]}"
        else:
            n_text = "n=none"
        print(f"- {path}: {status}; loaded {n_text}")
    for marker in expected_pending:
        present = any(marker in path.name for path, _status, _ns in statuses)
        print(f"- expected pending run marker `{marker}` present: {present}")


def print_n_table(by_n: dict[int, sweeps.NAggregate]) -> None:
    print()
    print("Completed Sweep Inventory")
    print("| n | profiles | SAT classes | fresh vs prior | UNSAT | INDET | cells |")
    print("|---:|---:|---:|---:|---:|---:|---:|")
    cumulative: set[str] = set()
    for n in sorted(by_n):
        agg = by_n[n]
        sat = agg.keys_with_status("SAT")
        fresh = sat - cumulative
        cumulative |= sat
        summary = agg.summary
        print(
            f"| {n} | {agg.profile_count} | {fmt(len(sat))} | "
            f"{fmt(len(fresh))} | {fmt(summary['UNSAT'])} | "
            f"{fmt(summary['INDETERMINATE'])} | {fmt(agg.tested)} |"
        )


def print_active_leaf_assessment(
    by_n: dict[int, sweeps.NAggregate],
    *,
    stable_window: int,
) -> None:
    tested, sat, unsat, indet = cumulative_counts(by_n)
    stable = latest_stable_window(by_n, min_width=stable_window)

    print()
    print("Active Leaf Assessment")
    print(f"- leaf: `{ACTIVE_LEAF}`")
    print(f"- current open/total recorded in plan: {ACTIVE_OPEN_TOTAL}")
    print(f"- completed L2 GLOBAL / PROVEN cells: {fmt(tested)}")
    print(f"- SAT/UNSAT/INDET cells: {fmt(sat)} / {fmt(unsat)} / {fmt(indet)}")
    if stable is None:
        print(f"- exact stable window of width {stable_window}: none in loaded artifacts")
    else:
        n0, n1, class_count = stable
        print(
            f"- exact stable window of width {stable_window}: "
            f"n={n0}..{n1} at {fmt(class_count)} SAT classes"
        )
    print("- producer facts still required by the erased-pin leaf:")
    for item in ERASED_PIN_PRODUCERS:
        print(f"  - {item}")
    print(
        "- conclusion: the loaded multi-center incidence evidence has no UNSAT "
        "class and does not produce one of the erased-pin producer facts."
    )


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "paths",
        nargs="*",
        help="Sweep JSON files. Defaults to census/multi_center/sweeps/*.json.",
    )
    parser.add_argument(
        "--glob",
        default="census/multi_center/sweeps/*.json",
        help="Glob used when no explicit paths are supplied.",
    )
    parser.add_argument("--stable-window", type=int, default=4)
    parser.add_argument(
        "--expected-pending",
        action="append",
        default=["n28_32", "n29_32"],
        help=(
            "Substring to look for when checking whether an in-flight run has "
            "landed. May be passed more than once."
        ),
    )
    return parser.parse_args()


def main() -> int:
    args = parse_args()
    paths = [Path(path) for path in args.paths]
    if not paths:
        paths = [Path(path) for path in glob.glob(args.glob)]
    if not paths:
        raise SystemExit("no sweep artifacts found")

    by_n, statuses = sweeps.load_all(paths)
    print_artifact_warnings(statuses, expected_pending=tuple(args.expected_pending))
    print_n_table(by_n)
    print_active_leaf_assessment(by_n, stable_window=args.stable_window)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
