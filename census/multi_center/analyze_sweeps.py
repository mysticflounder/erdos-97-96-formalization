#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
"""Aggregate multi-center sweep artifacts by actual class inventory.

The sweep JSON files carry per-artifact cumulative/fresh counts, so range
restarts can make those fields misleading.  This script recomputes the
project-level inventory directly from `class_key` values.
"""
from __future__ import annotations

import argparse
import glob
import json
import re
import sys
from collections import Counter, defaultdict
from dataclasses import dataclass, field
from pathlib import Path
from typing import Iterable


RANGE_RE = re.compile(r"_n(\d+)(?:_(\d+))?\.json$")


@dataclass(frozen=True)
class ProfileResult:
    source: Path
    mtime: float
    profile: tuple[int, ...]
    tested: int
    local_classes: int
    summary: dict[str, int]
    total_nodes: int
    elapsed_sec: float
    classes: tuple[tuple[str, str, int], ...]


@dataclass
class NAggregate:
    n: int
    profiles: dict[tuple[int, ...], ProfileResult] = field(default_factory=dict)
    sources: set[Path] = field(default_factory=set)

    def add_profile(self, result: ProfileResult) -> None:
        self.sources.add(result.source)
        old = self.profiles.get(result.profile)
        if old is None or result_rank(result) > result_rank(old):
            self.profiles[result.profile] = result

    @property
    def profile_count(self) -> int:
        return len(self.profiles)

    @property
    def tested(self) -> int:
        return sum(p.tested for p in self.profiles.values())

    @property
    def total_nodes(self) -> int:
        return sum(p.total_nodes for p in self.profiles.values())

    @property
    def summary(self) -> Counter[str]:
        out: Counter[str] = Counter()
        for profile in self.profiles.values():
            out.update(profile.summary)
        return out

    @property
    def class_status(self) -> dict[str, Counter[str]]:
        out: dict[str, Counter[str]] = defaultdict(Counter)
        for profile in self.profiles.values():
            for key, status, _nodes in profile.classes:
                out[key][status] += 1
        return out

    def keys_with_status(self, status: str) -> set[str]:
        return {key for key, counts in self.class_status.items() if counts[status]}

    @property
    def local_keys(self) -> set[str]:
        return set(self.class_status)


def result_rank(result: ProfileResult) -> tuple[int, int, int, float]:
    return (
        result.tested,
        result.local_classes,
        len(result.classes),
        result.mtime,
    )


def parse_claimed_range(path: Path) -> tuple[int, int] | None:
    match = RANGE_RE.search(path.name)
    if match is None:
        return None
    start = int(match.group(1))
    end = int(match.group(2) or match.group(1))
    return start, end


def load_artifact(path: Path) -> tuple[list[tuple[int, ProfileResult]], str | None]:
    try:
        with path.open() as handle:
            data = json.load(handle)
    except json.JSONDecodeError as exc:
        return [], f"INCOMPLETE_JSON: {exc}"
    except OSError as exc:
        return [], f"READ_ERROR: {exc}"

    rows = data.get("n")
    if not isinstance(rows, list):
        return [], "NO_N_ROWS"

    out: list[tuple[int, ProfileResult]] = []
    stat = path.stat()
    for nrow in rows:
        n = int(nrow["n"])
        for prow in nrow.get("profiles", []):
            profile = tuple(int(x) for x in prow["profile"])
            classes = tuple(
                (
                    str(c["class_key"]),
                    str(c.get("status", "UNKNOWN")),
                    int(c.get("nodes", 0)),
                )
                for c in prow.get("classes", [])
            )
            summary = {
                str(k): int(v)
                for k, v in prow.get("summary", {}).items()
            }
            result = ProfileResult(
                source=path,
                mtime=stat.st_mtime,
                profile=profile,
                tested=int(prow.get("tested", 0)),
                local_classes=int(prow.get("local_classes", len(classes))),
                summary=summary,
                total_nodes=int(prow.get("total_nodes", 0)),
                elapsed_sec=float(prow.get("elapsed_sec", 0.0)),
                classes=classes,
            )
            out.append((n, result))
    return out, None


def artifact_status(path: Path, ns: list[int], error: str | None) -> str:
    if error is not None:
        return error
    claimed = parse_claimed_range(path)
    if claimed is None:
        return "OK"
    start, end = claimed
    expected = set(range(start, end + 1))
    actual = set(ns)
    missing = sorted(expected - actual)
    if missing:
        return "PARTIAL_RANGE missing=" + ",".join(str(n) for n in missing)
    return "OK"


def load_all(paths: Iterable[Path]) -> tuple[dict[int, NAggregate], list[tuple[Path, str, list[int]]]]:
    by_n: dict[int, NAggregate] = {}
    statuses: list[tuple[Path, str, list[int]]] = []
    for path in sorted(paths):
        loaded, error = load_artifact(path)
        ns = sorted({n for n, _result in loaded})
        statuses.append((path, artifact_status(path, ns, error), ns))
        if error is not None:
            continue
        for n, result in loaded:
            by_n.setdefault(n, NAggregate(n)).add_profile(result)
    return by_n, statuses


def fmt_int(value: int) -> str:
    return f"{value:,}"


def print_artifacts(statuses: list[tuple[Path, str, list[int]]]) -> None:
    print("Artifacts")
    for path, status, ns in statuses:
        if ns:
            n_text = f"n={ns[0]}" if len(ns) == 1 else f"n={ns[0]}..{ns[-1]} ({len(ns)} rows)"
        else:
            n_text = "n=none"
        print(f"- {path}: {status}; {n_text}")


def print_inventory(by_n: dict[int, NAggregate], *, stable_window: int) -> None:
    print()
    print("Project-Level Inventory")
    print(
        "| n | profiles | LOCAL | SAT | fresh | new-vs-prev | missing-prev | "
        "UNSAT | INDET | cells | DFS nodes | sources |"
    )
    print(
        "|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---|"
    )
    cumulative: set[str] = set()
    previous: set[str] | None = None
    rows = []
    for n in sorted(by_n):
        agg = by_n[n]
        local = agg.local_keys
        sat = agg.keys_with_status("SAT")
        summary = agg.summary
        fresh = sat - cumulative
        new_prev = sat if previous is None else sat - previous
        missing_prev = set() if previous is None else previous - sat
        cumulative |= sat
        rows.append((n, sat, fresh, missing_prev, summary))
        sources = ",".join(path.name for path in sorted(agg.sources))
        print(
            f"| {n} | {agg.profile_count} | {fmt_int(len(local))} | "
            f"{fmt_int(len(sat))} | {fmt_int(len(fresh))} | "
            f"{fmt_int(len(new_prev))} | {fmt_int(len(missing_prev))} | "
            f"{fmt_int(summary['UNSAT'])} | {fmt_int(summary['INDETERMINATE'])} | "
            f"{fmt_int(agg.tested)} | {fmt_int(agg.total_nodes)} | {sources} |"
        )
        previous = sat

    if not rows:
        return

    print()
    print("Stabilization Windows")
    for i in range(len(rows) - stable_window + 1):
        window = rows[i:i + stable_window]
        no_fresh = all(len(fresh) == 0 for _n, _sat, fresh, _missing, _summary in window)
        no_missing = all(len(missing) == 0 for _n, _sat, _fresh, missing, _summary in window)
        no_indet = all(summary["INDETERMINATE"] == 0 for _n, _sat, _fresh, _missing, summary in window)
        exact_equal = all(window[j][1] == window[0][1] for j in range(1, len(window)))
        if no_fresh and no_missing and no_indet and exact_equal:
            print(f"- n={window[0][0]}..{window[-1][0]}: exact inventory stable at {fmt_int(len(window[-1][1]))} classes")


def decode_key(key: str) -> tuple:
    def tuples(value):
        if isinstance(value, list):
            return tuple(tuples(item) for item in value)
        return value

    return tuples(json.loads(key))


def print_structure(by_n: dict[int, NAggregate], n: int | None, *, limit: int) -> None:
    if not by_n:
        return
    if n is None:
        n = max(by_n)
    if n not in by_n:
        print()
        print(f"Structural Summary: n={n} not present")
        return

    keys = by_n[n].keys_with_status("SAT")
    masks: Counter[tuple[int, int, int]] = Counter()
    shape: Counter[tuple[int, int, int]] = Counter()
    max_counts: Counter[tuple[int, int, int]] = Counter()
    for key in keys:
        _layer, _participants, moser_masks, cap_counts = decode_key(key)
        masks[tuple(moser_masks)] += 1
        row_count = len(cap_counts)
        support_total = sum(int(row[2]) for row in cap_counts)
        cap_count = len({row[0] for row in cap_counts})
        shape[(row_count, support_total, cap_count)] += 1
        maxima = [0, 0, 0]
        for cap, _mask, count in cap_counts:
            maxima[{"S": 0, "O1": 1, "O2": 2}[cap]] = max(maxima[{"S": 0, "O1": 1, "O2": 2}[cap]], int(count))
        max_counts[tuple(maxima)] += 1

    print()
    print(f"Structural Summary for n={n} SAT inventory ({fmt_int(len(keys))} classes)")
    print("Top Moser-mask triples:")
    for value, count in masks.most_common(limit):
        print(f"- {value}: {fmt_int(count)}")
    print("Top support shapes (rows, support-total, caps-used):")
    for value, count in shape.most_common(limit):
        print(f"- {value}: {fmt_int(count)}")
    print("Top per-cap maximum multiplicities (S, O1, O2):")
    for value, count in max_counts.most_common(limit):
        print(f"- {value}: {fmt_int(count)}")


def parse_args(argv: list[str]) -> argparse.Namespace:
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "paths",
        nargs="*",
        help="Sweep JSON files. Defaults to census/multi_center/sweeps/*.json.",
    )
    parser.add_argument(
        "--glob",
        default="census/multi_center/sweeps/*.json",
        help="Glob used when no paths are supplied.",
    )
    parser.add_argument("--stable-window", type=int, default=4)
    parser.add_argument("--structure-n", type=int)
    parser.add_argument("--structure-limit", type=int, default=12)
    parser.add_argument(
        "--no-structure",
        action="store_true",
        help="Only print artifact and per-n inventory tables.",
    )
    return parser.parse_args(argv)


def main(argv: list[str]) -> int:
    args = parse_args(argv)
    paths = [Path(p) for p in args.paths]
    if not paths:
        paths = [Path(p) for p in glob.glob(args.glob)]
    if not paths:
        print("No sweep artifacts found.", file=sys.stderr)
        return 1

    by_n, statuses = load_all(paths)
    print_artifacts(statuses)
    print_inventory(by_n, stable_window=args.stable_window)
    if not args.no_structure:
        print_structure(by_n, args.structure_n, limit=args.structure_limit)
    return 0


if __name__ == "__main__":
    raise SystemExit(main(sys.argv[1:]))
