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
import os
import re
import sys
from collections import Counter, defaultdict
from dataclasses import dataclass, field
from pathlib import Path
from typing import Iterable

ROOT = Path(__file__).resolve().parents[2]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from census.q3_two_center import q3_token as q3
from census.multi_center import multi_center_census as mc


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


def cumulative_sat_inventory(by_n: dict[int, NAggregate], *, max_n: int | None = None) -> set[str]:
    out: set[str] = set()
    for n in sorted(by_n):
        if max_n is not None and n > max_n:
            break
        out |= by_n[n].keys_with_status("SAT")
    return out


def key_imprint(key: str) -> tuple[tuple[int, int, int], tuple[int, int, int], tuple[int, int, int]]:
    _layer, _participants, moser_masks, cap_counts = decode_key(key)
    row_count = len(cap_counts)
    support_total = sum(int(row[2]) for row in cap_counts)
    caps_used = len({row[0] for row in cap_counts})
    maxima = [0, 0, 0]
    for cap, _mask, count in cap_counts:
        idx = {"S": 0, "O1": 1, "O2": 2}[cap]
        maxima[idx] = max(maxima[idx], int(count))
    return tuple(moser_masks), (row_count, support_total, caps_used), tuple(maxima)


def frontier_cache_path(
    cache_dir: str,
    *,
    layer: str,
    kills: bool,
    profile: tuple[int, int, int],
) -> Path:
    kills_tag = "kills" if kills else "nokills"
    prof = "_".join(str(x) for x in profile)
    return Path(cache_dir) / f"{layer.lower()}_{kills_tag}_{prof}.json"


def local_profile_keys(
    profile: tuple[int, int, int],
    *,
    layer: str,
    kills: bool,
    cache_dir: str | None,
) -> set[str]:
    if cache_dir is not None:
        path = frontier_cache_path(cache_dir, layer=layer, kills=kills, profile=profile)
        if path.exists():
            with path.open() as handle:
                data = json.load(handle)
            return set(str(key) for key in data["keys"])

    local_fn = mc.l2_local if layer == "L2" else mc.l1_local
    got = local_fn(profile, kills=kills)
    keys = {mc.class_key(key) for key in got}

    if cache_dir is not None:
        path = frontier_cache_path(cache_dir, layer=layer, kills=kills, profile=profile)
        os.makedirs(path.parent, exist_ok=True)
        with path.open("w") as handle:
            json.dump(
                {
                    "profile": list(profile),
                    "layer": layer,
                    "kills": kills,
                    "keys": sorted(keys),
                },
                handle,
                indent=1,
                sort_keys=True,
            )
            handle.write("\n")
    return keys


def first_appearance_report(
    by_n: dict[int, NAggregate],
    *,
    status: str,
    detail_limit: int,
) -> None:
    first_seen: dict[str, int] = {}
    first_profile: dict[str, tuple[int, int, int]] = {}
    first_imprint: dict[str, tuple[tuple[int, int, int], tuple[int, int, int], tuple[int, int, int]]] = {}
    for n in sorted(by_n):
        agg = by_n[n]
        for profile, result in sorted(agg.profiles.items()):
            for key, row_status, _nodes in result.classes:
                if row_status != status or key in first_seen:
                    continue
                first_seen[key] = n
                first_profile[key] = profile
                first_imprint[key] = key_imprint(key)

    if not first_seen:
        print()
        print(f"First Appearance Report ({status})")
        print("- no classes found")
        return

    by_first_n: dict[int, list[str]] = defaultdict(list)
    for key, n in first_seen.items():
        by_first_n[n].append(key)

    print()
    print(f"First Appearance Report ({status})")
    print("| first n | classes | cumulative | example profile | top imprint |")
    print("|---:|---:|---:|---|---|")
    cumulative = 0
    for n in sorted(by_first_n):
        keys = sorted(by_first_n[n])
        cumulative += len(keys)
        imprint_counts = Counter(first_imprint[key] for key in keys)
        top_imprint, top_count = imprint_counts.most_common(1)[0]
        masks, shape, maxima = top_imprint
        example_profile = first_profile[keys[0]]
        print(
            f"| {n} | {fmt_int(len(keys))} | {fmt_int(cumulative)} | "
            f"{example_profile} | masks={masks} shape={shape} maxima={maxima} "
            f"({fmt_int(top_count)}) |"
        )

    final_n = max(first_seen.values())
    final_count = sum(1 for n in first_seen.values() if n == final_n)
    print()
    print(
        f"- latest first-appearance threshold: n={final_n} "
        f"({fmt_int(final_count)} classes first appear there)"
    )

    print("- latest-threshold sample classes:")
    latest_keys = sorted(by_first_n[final_n])
    for key in latest_keys[:detail_limit]:
        print(f"  - profile {first_profile[key]} key {key}")
    if len(latest_keys) > detail_limit:
        print(f"  - ... {len(latest_keys) - detail_limit} more")


def local_first_appearance_report(
    by_n: dict[int, NAggregate],
    *,
    n_min: int,
    n_max: int,
    layer: str,
    kills: bool,
    baseline_max_n: int | None,
    detail_limit: int,
    cache_dir: str | None,
) -> None:
    baseline = cumulative_sat_inventory(by_n, max_n=baseline_max_n)
    baseline_label = "all loaded n"
    if baseline_max_n is not None:
        baseline_label = f"n <= {baseline_max_n}"

    first_seen: dict[str, int] = {}
    first_profile: dict[str, tuple[int, int, int]] = {}
    first_imprint: dict[str, tuple[tuple[int, int, int], tuple[int, int, int], tuple[int, int, int]]] = {}
    seen = set(baseline)
    for n in range(n_min, n_max + 1):
        for profile in q3.profiles_for(n):
            for key in sorted(local_profile_keys(profile, layer=layer, kills=kills, cache_dir=cache_dir)):
                if key in seen or key in first_seen:
                    continue
                first_seen[key] = n
                first_profile[key] = profile
                first_imprint[key] = key_imprint(key)
        seen.update(first_seen)

    print()
    print(f"Local First Appearance Report ({layer}, kills={'on' if kills else 'off'})")
    print(f"- baseline SAT inventory: {fmt_int(len(baseline))} classes from {baseline_label}")
    if not first_seen:
        print(f"- no new LOCAL classes appear on n={n_min}..{n_max}")
        return

    by_first_n: dict[int, list[str]] = defaultdict(list)
    for key, n in first_seen.items():
        by_first_n[n].append(key)

    print("| first n | classes | cumulative new | example profile | top imprint |")
    print("|---:|---:|---:|---|---|")
    cumulative = 0
    for n in sorted(by_first_n):
        keys = sorted(by_first_n[n])
        cumulative += len(keys)
        imprint_counts = Counter(first_imprint[key] for key in keys)
        top_imprint, top_count = imprint_counts.most_common(1)[0]
        masks, shape, maxima = top_imprint
        example_profile = first_profile[keys[0]]
        print(
            f"| {n} | {fmt_int(len(keys))} | {fmt_int(cumulative)} | "
            f"{example_profile} | masks={masks} shape={shape} maxima={maxima} "
            f"({fmt_int(top_count)}) |"
        )

    final_n = max(first_seen.values())
    latest_keys = sorted(by_first_n[final_n])
    print()
    print(
        f"- latest LOCAL first-appearance threshold in scan: n={final_n} "
        f"({fmt_int(len(latest_keys))} classes first appear there)"
    )
    for key in latest_keys[:detail_limit]:
        print(f"  - profile {first_profile[key]} key {key}")
    if len(latest_keys) > detail_limit:
        print(f"  - ... {len(latest_keys) - detail_limit} more")


def minimal_profile_report(
    by_n: dict[int, NAggregate],
    *,
    status: str,
    detail_limit: int,
) -> None:
    winners: dict[str, tuple[int, tuple[int, int, int]]] = {}
    for n in sorted(by_n):
        agg = by_n[n]
        for profile, result in sorted(agg.profiles.items()):
            profile_size = sum(profile)
            for key, row_status, _nodes in result.classes:
                if row_status != status:
                    continue
                old = winners.get(key)
                candidate = (profile_size, profile)
                if old is None or candidate < old:
                    winners[key] = candidate

    print()
    print(f"Minimal Profile Report ({status})")
    if not winners:
        print("- no classes found")
        return

    by_size: dict[int, list[tuple[str, tuple[int, int, int]]]] = defaultdict(list)
    for key, (size, profile) in winners.items():
        by_size[size].append((key, profile))

    print("| profile sum | classes | cumulative | example profile | top imprint |")
    print("|---:|---:|---:|---|---|")
    cumulative = 0
    max_size = max(by_size)
    for size in sorted(by_size):
        entries = sorted(by_size[size], key=lambda item: item[1])
        cumulative += len(entries)
        imprint_counts = Counter(key_imprint(key) for key, _profile in entries)
        top_imprint, top_count = imprint_counts.most_common(1)[0]
        masks, shape, maxima = top_imprint
        print(
            f"| {size} | {fmt_int(len(entries))} | {fmt_int(cumulative)} | "
            f"{entries[0][1]} | masks={masks} shape={shape} maxima={maxima} "
            f"({fmt_int(top_count)}) |"
        )

    latest_entries = sorted(by_size[max_size], key=lambda item: item[1])
    print()
    print(
        f"- maximal minimal-profile sum: {max_size} "
        f"({fmt_int(len(latest_entries))} classes need at least that total size)"
    )
    for key, profile in latest_entries[:detail_limit]:
        print(f"  - profile {profile} key {key}")
    if len(latest_entries) > detail_limit:
        print(f"  - ... {len(latest_entries) - detail_limit} more")


def threshold_summary(by_n: dict[int, NAggregate], *, stable_window: int) -> None:
    cumulative: set[str] = set()
    last_first_n: int | None = None
    rows: list[tuple[int, set[str], Counter[str]]] = []
    for n in sorted(by_n):
        sat = by_n[n].keys_with_status("SAT")
        fresh = sat - cumulative
        if fresh:
            last_first_n = n
        cumulative |= sat
        rows.append((n, sat, by_n[n].summary))

    first_stable: tuple[int, int, int] | None = None
    for i in range(len(rows) - stable_window + 1):
        window = rows[i:i + stable_window]
        keys0 = window[0][1]
        if all(keys == keys0 and summary["INDETERMINATE"] == 0 for _n, keys, summary in window):
            first_stable = (window[0][0], window[-1][0], len(keys0))
            break

    print()
    print("Threshold Summary")
    if last_first_n is None:
        print("- no SAT classes found")
    else:
        print(f"- latest first appearance: n={last_first_n}")
    if first_stable is None:
        print(f"- first exact stable window of width {stable_window}: none")
    else:
        n0, n1, count = first_stable
        print(f"- first exact stable window of width {stable_window}: n={n0}..{n1} at {fmt_int(count)} classes")
        if last_first_n is not None:
            print(f"- gap from latest first appearance to stable-window start: {n0 - last_first_n}")


def scan_local_frontier(
    by_n: dict[int, NAggregate],
    *,
    n_min: int,
    n_max: int,
    layer: str,
    kills: bool,
    baseline_max_n: int | None,
    detail_limit: int,
    cache_dir: str | None,
) -> None:
    baseline = cumulative_sat_inventory(by_n, max_n=baseline_max_n)
    baseline_label = "all loaded n"
    if baseline_max_n is not None:
        baseline_label = f"n <= {baseline_max_n}"

    print()
    print(f"Local Frontier Scan ({layer}, kills={'on' if kills else 'off'})")
    print(f"- baseline SAT inventory: {fmt_int(len(baseline))} classes from {baseline_label}")
    print(
        "| n | profiles | LOCAL | new-vs-baseline | new-vs-prev-scan | missing-prev-scan | "
        "novel profiles |"
    )
    print("|---:|---:|---:|---:|---:|---:|---:|")

    seen = set(baseline)
    previous: set[str] | None = None

    for n in range(n_min, n_max + 1):
        profile_keys: dict[tuple[int, int, int], set[str]] = {}
        n_keys: set[str] = set()
        for profile in q3.profiles_for(n):
            keys = local_profile_keys(profile, layer=layer, kills=kills, cache_dir=cache_dir)
            profile_keys[profile] = keys
            n_keys |= keys

        new_baseline = n_keys - seen
        new_prev = None if previous is None else n_keys - previous
        missing_prev = None if previous is None else previous - n_keys
        novel_profiles = [
            profile for profile, keys in profile_keys.items() if keys & new_baseline
        ]
        new_prev_text = "n/a" if new_prev is None else fmt_int(len(new_prev))
        missing_prev_text = "n/a" if missing_prev is None else fmt_int(len(missing_prev))
        print(
            f"| {n} | {fmt_int(len(profile_keys))} | {fmt_int(len(n_keys))} | "
            f"{fmt_int(len(new_baseline))} | {new_prev_text} | "
            f"{missing_prev_text} | {fmt_int(len(novel_profiles))} |"
        )

        if new_baseline:
            print(f"  - n={n} novel exact LOCAL keys: {fmt_int(len(new_baseline))}")
            for profile in novel_profiles[:detail_limit]:
                profile_new = sorted(profile_keys[profile] & new_baseline)
                print(
                    f"    - profile {profile}: {fmt_int(len(profile_new))} novel "
                    f"({profile_new[0] if profile_new else 'n/a'})"
                )
            if len(novel_profiles) > detail_limit:
                print(f"    - ... {len(novel_profiles) - detail_limit} more profiles")

            imprints = Counter(key_imprint(key) for key in new_baseline)
            print("    - top novel imprints:")
            for imprint, count in imprints.most_common(detail_limit):
                masks, shape, maxima = imprint
                print(
                    f"      - masks={masks} shape={shape} maxima={maxima}: {fmt_int(count)}"
                )

        seen |= n_keys
        previous = n_keys


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
    parser.add_argument("--scan-local-frontier", action="store_true")
    parser.add_argument("--frontier-n-min", type=int)
    parser.add_argument("--frontier-n-max", type=int)
    parser.add_argument("--frontier-layer", choices=("L1", "L2"), default="L2")
    parser.add_argument("--frontier-no-kills", action="store_true")
    parser.add_argument("--frontier-baseline-max-n", type=int)
    parser.add_argument("--frontier-detail-limit", type=int, default=8)
    parser.add_argument("--first-appearance", action="store_true")
    parser.add_argument("--first-appearance-status", choices=("SAT", "UNSAT", "INDETERMINATE"), default="SAT")
    parser.add_argument("--local-first-appearance", action="store_true")
    parser.add_argument("--minimal-profile", action="store_true")
    parser.add_argument("--threshold-summary", action="store_true")
    parser.add_argument(
        "--frontier-cache-dir",
        default="census/multi_center/frontier_cache",
        help="Directory for cached LOCAL profile key enumerations. Use empty string to disable.",
    )
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
    cache_dir = args.frontier_cache_dir or None
    print_artifacts(statuses)
    print_inventory(by_n, stable_window=args.stable_window)
    if not args.no_structure:
        print_structure(by_n, args.structure_n, limit=args.structure_limit)
    if args.first_appearance:
        first_appearance_report(
            by_n,
            status=args.first_appearance_status,
            detail_limit=args.frontier_detail_limit,
        )
    if args.minimal_profile:
        minimal_profile_report(
            by_n,
            status=args.first_appearance_status,
            detail_limit=args.frontier_detail_limit,
        )
    if args.threshold_summary:
        threshold_summary(by_n, stable_window=args.stable_window)
    if args.scan_local_frontier:
        if args.frontier_n_min is None or args.frontier_n_max is None:
            print(
                "--scan-local-frontier requires --frontier-n-min and --frontier-n-max",
                file=sys.stderr,
            )
            return 2
        scan_local_frontier(
            by_n,
            n_min=args.frontier_n_min,
            n_max=args.frontier_n_max,
            layer=args.frontier_layer,
            kills=not args.frontier_no_kills,
            baseline_max_n=args.frontier_baseline_max_n,
            detail_limit=args.frontier_detail_limit,
            cache_dir=cache_dir,
        )
    if args.local_first_appearance:
        if args.frontier_n_min is None or args.frontier_n_max is None:
            print(
                "--local-first-appearance requires --frontier-n-min and --frontier-n-max",
                file=sys.stderr,
            )
            return 2
        local_first_appearance_report(
            by_n,
            n_min=args.frontier_n_min,
            n_max=args.frontier_n_max,
            layer=args.frontier_layer,
            kills=not args.frontier_no_kills,
            baseline_max_n=args.frontier_baseline_max_n,
            detail_limit=args.frontier_detail_limit,
            cache_dir=cache_dir,
        )
    return 0


if __name__ == "__main__":
    raise SystemExit(main(sys.argv[1:]))
