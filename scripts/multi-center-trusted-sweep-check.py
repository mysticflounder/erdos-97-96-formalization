#!/usr/bin/env python3
#
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
#
"""Trusted semantic checker for the multi-center L2 sweep artifacts.

This checker intentionally does not import `census.multi_center` or the sweep
analyzer.  It re-parses the sweep JSON with only the Python standard library,
checks the raw class-key grammar and local support-incidence semantics, checks
per-profile and per-artifact metadata totals, and emits a proof-facing report
plus a small Lean certificate bank over the checker summary.

The checker validates the sweep artifacts as artifacts.  It does not prove that
the original DFS search implementation is complete; it independently checks the
recorded outputs and the semantic well-formedness of their class keys.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import re
from collections import Counter, defaultdict
from dataclasses import dataclass
from functools import lru_cache
from itertools import combinations, permutations
from pathlib import Path
from typing import Any


ROOT = Path(__file__).resolve().parents[1]
SCHEMA = "multi_center_l2_trusted_sweep_semantics.v1"
DEFAULT_SWEEP_DIR = ROOT / "census" / "multi_center" / "sweeps"
DEFAULT_JSON_OUT = (
    ROOT / "certificates" / "multi_center" / "reports" /
    "l2_trusted_sweep_semantics.json"
)
DEFAULT_MARKDOWN_OUT = (
    ROOT / "certificates" / "multi_center" / "reports" /
    "l2_trusted_sweep_semantics.md"
)
DEFAULT_LEAN_OUT = (
    ROOT / "lean" / "Erdos9796Proof" / "P97" / "MultiCenter" /
    "Certificate" / "TrustedSweep.lean"
)

MOSER = (0, 1, 2)
CAPS = ("S", "O1", "O2")
CAP_INDEX = {cap: i for i, cap in enumerate(CAPS)}
CAP_VERTS = {
    "S": frozenset((1, 2)),
    "O1": frozenset((0, 2)),
    "O2": frozenset((0, 1)),
}
VERT_CAPS = {
    0: ("O1", "O2"),
    1: ("S", "O2"),
    2: ("S", "O1"),
}
PAIR_CAP = {
    frozenset((1, 2)): ("S", "O1", "O2"),
    frozenset((0, 2)): ("O1", "S", "O2"),
    frozenset((0, 1)): ("O2", "S", "O1"),
}
STATUSES = ("SAT", "UNSAT", "INDETERMINATE")
RANGE_RE = re.compile(r"_n(\d+)(?:_(\d+))?\.json$")


@dataclass(frozen=True)
class ClassCell:
    key: str
    status: str
    nodes: int


@dataclass(frozen=True)
class ProfileResult:
    source: Path
    profile: tuple[int, int, int]
    tested: int
    local_classes: int
    summary: Counter[str]
    total_nodes: int
    classes: tuple[ClassCell, ...]


def rel(path: Path) -> str:
    try:
        return path.resolve().relative_to(ROOT).as_posix()
    except ValueError:
        return path.as_posix()


def fmt_int(value: int) -> str:
    return f"{value:,}"


def lean_bool(value: bool) -> str:
    return "true" if value else "false"


def lean_string(value: str) -> str:
    return json.dumps(value)


def lean_nat_list(values: list[int]) -> str:
    return "[" + ", ".join(str(value) for value in values) + "]"


def lean_nat_pair_list(values: list[tuple[int, int]]) -> str:
    return "[" + ", ".join(f"({left}, {right})" for left, right in values) + "]"


def lean_nat_pair_list_block(
    values: list[tuple[int, int]], indent: str = "  "
) -> str:
    if not values:
        return f"{indent}[]"
    lines = [f"{indent}["]
    for index, (left, right) in enumerate(values):
        suffix = "," if index + 1 < len(values) else ""
        lines.append(f"{indent}  ({left}, {right}){suffix}")
    lines.append(f"{indent}]")
    return "\n".join(lines)


def key_digest(keys: set[str]) -> str:
    digest = hashlib.sha256()
    for key in sorted(keys):
        digest.update(key.encode("utf-8"))
        digest.update(b"\n")
    return digest.hexdigest()


def is_int(value: Any) -> bool:
    return type(value) is int


def bit(v: int) -> int:
    return 1 << v


def add_error(
    errors: list[dict[str, Any]],
    kind: str,
    path: Path,
    context: str,
    message: str,
) -> None:
    errors.append(
        {
            "kind": kind,
            "path": rel(path),
            "context": context,
            "message": message,
        }
    )


def counter_from_summary(value: Any) -> Counter[str]:
    out: Counter[str] = Counter()
    if isinstance(value, dict):
        for status in STATUSES:
            raw = value.get(status, 0)
            if is_int(raw):
                out[status] = raw
    return out


def cap_image(perm: tuple[int, int, int], cap: str) -> str:
    image = frozenset(perm[v] for v in CAP_VERTS[cap])
    for name, verts in CAP_VERTS.items():
        if verts == image:
            return name
    raise ValueError(f"bad cap image for {cap}: {image}")


def permute_mask(mask: int, perm: tuple[int, int, int]) -> int:
    out = 0
    for v in MOSER:
        if mask & bit(v):
            out |= bit(perm[v])
    return out


def allowed_profile_perms(profile: tuple[int, int, int]) -> tuple[tuple[int, int, int], ...]:
    sizes = dict(zip(CAPS, profile, strict=True))
    out: list[tuple[int, int, int]] = []
    for perm in permutations(MOSER):
        if all(sizes[cap] == sizes[cap_image(perm, cap)] for cap in CAPS):
            out.append(perm)
    return tuple(out)


def normalize_counts(
    cap_counts: dict[str, dict[int, int]],
) -> tuple[tuple[str, int, int], ...]:
    rows: list[tuple[str, int, int]] = []
    for cap in CAPS:
        for mask in range(1, 8):
            count = cap_counts.get(cap, {}).get(mask, 0)
            if count:
                rows.append((cap, mask, count))
    return tuple(rows)


def canonical_key(
    profile: tuple[int, int, int],
    participants: tuple[int, ...],
    moser_masks: tuple[int, int, int],
    cap_rows: tuple[tuple[str, int, int], ...],
    layer: str,
) -> str:
    cap_counts = {cap: {} for cap in CAPS}
    for cap, mask, count in cap_rows:
        cap_counts[cap][mask] = cap_counts[cap].get(mask, 0) + count
    best: tuple[Any, ...] | None = None
    for perm in allowed_profile_perms(profile):
        new_participants = tuple(sorted(perm[p] for p in participants))
        new_moser = [0, 0, 0]
        for z in MOSER:
            new_moser[perm[z]] = permute_mask(moser_masks[z], perm)
        new_counts: dict[str, dict[int, int]] = {cap: {} for cap in CAPS}
        for cap, counts in cap_counts.items():
            new_cap = cap_image(perm, cap)
            for mask, count in counts.items():
                new_mask = permute_mask(mask, perm)
                new_counts[new_cap][new_mask] = (
                    new_counts[new_cap].get(new_mask, 0) + count
                )
        enc = (
            layer,
            tuple(new_participants),
            tuple(new_moser),
            normalize_counts(new_counts),
        )
        if best is None or enc < best:
            best = enc
    if best is None:
        raise ValueError("no canonical encoding")
    return json.dumps(best, separators=(",", ":"))


def parse_class_key(
    key: str,
) -> tuple[str, tuple[int, ...], tuple[int, int, int], tuple[tuple[str, int, int], ...]]:
    raw = json.loads(key)
    if not isinstance(raw, list) or len(raw) != 4:
        raise ValueError("class key must be a four-entry JSON array")
    layer, participants_raw, moser_raw, cap_rows_raw = raw
    if not isinstance(layer, str):
        raise ValueError("class key layer must be a string")
    if not isinstance(participants_raw, list) or not all(is_int(x) for x in participants_raw):
        raise ValueError("class key participants must be a list of integers")
    if not isinstance(moser_raw, list) or len(moser_raw) != 3 or not all(is_int(x) for x in moser_raw):
        raise ValueError("class key moser masks must be three integers")
    if not isinstance(cap_rows_raw, list):
        raise ValueError("class key cap rows must be a list")
    cap_rows: list[tuple[str, int, int]] = []
    for row in cap_rows_raw:
        if (
            not isinstance(row, list)
            or len(row) != 3
            or not isinstance(row[0], str)
            or not is_int(row[1])
            or not is_int(row[2])
        ):
            raise ValueError("class key cap row must be [cap, mask, count]")
        cap_rows.append((row[0], row[1], row[2]))
    return (
        layer,
        tuple(participants_raw),
        tuple(moser_raw),  # type: ignore[arg-type]
        tuple(cap_rows),
    )


@lru_cache(maxsize=None)
def validate_class_key(
    key: str,
    profile: tuple[int, int, int],
) -> tuple[str, ...]:
    issues: list[str] = []
    try:
        layer, participants, moser_masks, cap_rows = parse_class_key(key)
    except (json.JSONDecodeError, ValueError) as exc:
        return (f"class-key parse failed: {exc}",)

    if layer != "L2":
        issues.append(f"expected L2 layer, got {layer!r}")
    if participants != MOSER:
        issues.append(f"expected participants [0,1,2], got {participants!r}")
    participant_mask = sum(bit(p) for p in participants)
    if tuple(sorted(participants)) != participants or len(set(participants)) != len(participants):
        issues.append("participants are not sorted and distinct")
    if any(p not in MOSER for p in participants):
        issues.append("participants must be Moser vertices 0,1,2")

    for z, mask in enumerate(moser_masks):
        if not 0 <= mask < 8:
            issues.append(f"moser mask {z} is outside 0..7")
        if mask & ~participant_mask:
            issues.append(f"moser mask {z} uses a nonparticipant bit")
        if z in participants and (mask & bit(z)):
            issues.append(f"moser mask {z} contains its own center bit")

    normalized_rows = tuple(sorted(cap_rows, key=lambda row: (CAP_INDEX.get(row[0], 99), row[1], row[2])))
    if cap_rows != normalize_counts({
        cap: {
            mask: sum(count for cap2, mask2, count in cap_rows if cap2 == cap and mask2 == mask)
            for mask in range(1, 8)
        }
        for cap in CAPS
    }):
        issues.append("cap rows are not normalized in canonical cap/mask order")
    if cap_rows != normalized_rows:
        issues.append("cap rows are not sorted by cap, mask, count")

    cap_used = {cap: 0 for cap in CAPS}
    degree = {c: sum(1 for mask in moser_masks if mask & bit(c)) for c in participants}
    h1_used = {(c, cap): 0 for c in participants for cap in VERT_CAPS[c]}
    for c in participants:
        for cap in VERT_CAPS[c]:
            h1_used[(c, cap)] = sum(
                1
                for z in CAP_VERTS[cap]
                if z != c and (moser_masks[z] & bit(c))
            )
    shared = {
        pair: sum(1 for mask in moser_masks if (mask & (bit(pair[0]) | bit(pair[1]))) == (bit(pair[0]) | bit(pair[1])))
        for pair in combinations(participants, 2)
    }
    mask111_count = 0

    for cap, mask, count in cap_rows:
        if cap not in CAPS:
            issues.append(f"unknown cap {cap!r}")
            continue
        if not 1 <= mask < 8:
            issues.append(f"cap row mask {mask} is outside 1..7")
            continue
        if mask & ~participant_mask:
            issues.append(f"cap row mask {mask} uses a nonparticipant bit")
        if count <= 0:
            issues.append("cap row count must be positive")
            continue
        cap_used[cap] += count
        if mask == 7:
            mask111_count += count
        for c in participants:
            if mask & bit(c):
                degree[c] += count
                if cap in VERT_CAPS[c]:
                    h1_used[(c, cap)] += count
        for pair in combinations(participants, 2):
            pair_mask = bit(pair[0]) | bit(pair[1])
            if (mask & pair_mask) == pair_mask:
                shared[pair] += count

    for cap, used in cap_used.items():
        capacity = profile[CAP_INDEX[cap]] - 2
        if capacity < 0:
            issues.append(f"profile cap {cap} has negative interior capacity")
        if used > capacity:
            issues.append(f"cap {cap} uses {used} interior rows but capacity is {capacity}")
    for c, count in degree.items():
        if count != 4:
            issues.append(f"center {c} has support degree {count}, expected 4")
    for (c, cap), count in h1_used.items():
        if count > 1:
            issues.append(f"center {c} uses {count} incidences in cap {cap}, expected at most 1")
    for pair, count in shared.items():
        if count > 2:
            issues.append(f"pair {pair} has shared count {count}, expected at most 2")
    if mask111_count > 1:
        issues.append(f"cap mask 111 count is {mask111_count}, expected at most 1")

    cap_count_map: dict[str, dict[int, int]] = {cap: {} for cap in CAPS}
    for cap, mask, count in cap_rows:
        if cap in CAPS and 1 <= mask < 8 and count > 0:
            cap_count_map[cap][mask] = cap_count_map[cap].get(mask, 0) + count
    for a, b in combinations(participants, 2):
        x, y, z = PAIR_CAP[frozenset((a, b))]
        pair_mask = bit(a) | bit(b)
        shared_x = sum(
            count for mask, count in cap_count_map[x].items()
            if (mask & pair_mask) == pair_mask
        )
        shared_y = sum(
            count for mask, count in cap_count_map[y].items()
            if (mask & pair_mask) == pair_mask
        )
        shared_z = sum(
            count for mask, count in cap_count_map[z].items()
            if (mask & pair_mask) == pair_mask
        )
        if shared_x:
            issues.append(f"pair {(a, b)} is jointly killed in shared cap {x}")
        if shared_y and shared_z:
            issues.append(f"pair {(a, b)} is jointly killed in both side caps {y},{z}")

    try:
        expected = canonical_key(profile, participants, moser_masks, cap_rows, layer)
    except ValueError as exc:
        issues.append(f"canonicalization failed: {exc}")
    else:
        if key != expected:
            issues.append("class key is not canonical under size-preserving profile symmetries")

    return tuple(issues)


def parse_claimed_range(path: Path) -> tuple[int, int] | None:
    match = RANGE_RE.search(path.name)
    if match is None:
        return None
    start = int(match.group(1))
    end = int(match.group(2) or match.group(1))
    return start, end


def artifact_status(path: Path, ns: list[int], load_error: bool) -> str:
    if load_error:
        return "LOAD_ERROR"
    claimed = parse_claimed_range(path)
    if claimed is None:
        return "OK"
    start, end = claimed
    missing = sorted(set(range(start, end + 1)) - set(ns))
    if missing:
        return "PARTIAL_RANGE missing=" + ",".join(str(n) for n in missing)
    return "OK"


def read_required_int(
    obj: dict[str, Any],
    key: str,
    errors: list[dict[str, Any]],
    path: Path,
    context: str,
    kind: str,
) -> int:
    value = obj.get(key)
    if not is_int(value):
        add_error(errors, kind, path, context, f"{key} must be an integer")
        return 0
    return value


def validate_artifact(path: Path, errors: list[dict[str, Any]]) -> tuple[list[tuple[int, ProfileResult]], dict[str, Any]]:
    context = path.name
    try:
        data = json.loads(path.read_text())
    except (OSError, json.JSONDecodeError) as exc:
        add_error(errors, "artifact_json", path, context, str(exc))
        return [], {"path": rel(path), "status": "LOAD_ERROR", "n_values": []}
    if not isinstance(data, dict):
        add_error(errors, "artifact_schema", path, context, "top-level JSON must be an object")
        return [], {"path": rel(path), "status": "LOAD_ERROR", "n_values": []}
    if data.get("layer") != "L2":
        add_error(errors, "artifact_schema", path, context, "top-level layer must be L2")
    nrows = data.get("n")
    if not isinstance(nrows, list):
        add_error(errors, "artifact_schema", path, context, "top-level n field must be a list")
        return [], {"path": rel(path), "status": "LOAD_ERROR", "n_values": []}

    loaded: list[tuple[int, ProfileResult]] = []
    ns: list[int] = []
    cumulative_local: set[str] = set()
    cumulative_global: set[str] = set()
    previous_n = -1
    for nrow_index, nrow_raw in enumerate(nrows):
        ncontext = f"{path.name}:n[{nrow_index}]"
        if not isinstance(nrow_raw, dict):
            add_error(errors, "artifact_schema", path, ncontext, "n row must be an object")
            continue
        n = read_required_int(nrow_raw, "n", errors, path, ncontext, "artifact_schema")
        ns.append(n)
        if n <= previous_n:
            add_error(errors, "artifact_metadata", path, ncontext, "n rows must be strictly increasing")
        previous_n = n
        profiles_raw = nrow_raw.get("profiles")
        if not isinstance(profiles_raw, list):
            add_error(errors, "artifact_schema", path, ncontext, "profiles must be a list")
            profiles_raw = []

        n_summary: Counter[str] = Counter()
        n_total_nodes = 0
        n_tested = 0
        n_local_keys: set[str] = set()
        n_global_keys: set[str] = set()
        profile_results: list[ProfileResult] = []

        for prow_index, prow_raw in enumerate(profiles_raw):
            pcontext = f"{ncontext}:profiles[{prow_index}]"
            if not isinstance(prow_raw, dict):
                add_error(errors, "profile_schema", path, pcontext, "profile row must be an object")
                continue
            profile_raw = prow_raw.get("profile")
            if (
                not isinstance(profile_raw, list)
                or len(profile_raw) != 3
                or not all(is_int(x) for x in profile_raw)
            ):
                add_error(errors, "profile_schema", path, pcontext, "profile must be a three-integer list")
                continue
            profile = tuple(profile_raw)  # type: ignore[assignment]
            if any(x < 2 for x in profile):
                add_error(errors, "profile_semantics", path, pcontext, "profile cap sizes must be at least 2")
            if sum(profile) != n + 3:
                add_error(errors, "profile_semantics", path, pcontext, "profile sizes must sum to n + 3")
            if prow_raw.get("layer") != "L2":
                add_error(errors, "profile_schema", path, pcontext, "profile row layer must be L2")

            classes_raw = prow_raw.get("classes")
            if not isinstance(classes_raw, list):
                add_error(errors, "profile_schema", path, pcontext, "classes must be a list")
                classes_raw = []
            classes: list[ClassCell] = []
            profile_status: Counter[str] = Counter()
            profile_nodes = 0
            profile_keys: list[str] = []
            for class_index, class_raw in enumerate(classes_raw):
                ccontext = f"{pcontext}:classes[{class_index}]"
                if not isinstance(class_raw, dict):
                    add_error(errors, "class_schema", path, ccontext, "class row must be an object")
                    continue
                key = class_raw.get("class_key")
                status = class_raw.get("status")
                nodes = class_raw.get("nodes", 0)
                if not isinstance(key, str):
                    add_error(errors, "class_schema", path, ccontext, "class_key must be a string")
                    continue
                if status not in STATUSES:
                    add_error(errors, "class_schema", path, ccontext, f"unknown status {status!r}")
                    continue
                if not is_int(nodes) or nodes < 0:
                    add_error(errors, "class_schema", path, ccontext, "nodes must be a nonnegative integer")
                    nodes = 0
                for issue in validate_class_key(key, profile):
                    add_error(errors, "class_key_semantics", path, ccontext, issue)
                classes.append(ClassCell(key=key, status=status, nodes=nodes))
                profile_keys.append(key)
                profile_status[status] += 1
                profile_nodes += nodes
                n_local_keys.add(key)
                if status == "SAT":
                    n_global_keys.add(key)
                profile_nodes += 0
            if len(set(profile_keys)) != len(profile_keys):
                add_error(errors, "profile_metadata", path, pcontext, "duplicate class_key in profile row")

            summary = counter_from_summary(prow_raw.get("summary"))
            if summary != profile_status:
                add_error(errors, "profile_metadata", path, pcontext, "profile summary does not match class statuses")
            tested = read_required_int(prow_raw, "tested", errors, path, pcontext, "profile_metadata")
            local_classes = read_required_int(prow_raw, "local_classes", errors, path, pcontext, "profile_metadata")
            total_nodes = read_required_int(prow_raw, "total_nodes", errors, path, pcontext, "profile_metadata")
            if tested != sum(profile_status.values()):
                add_error(errors, "profile_metadata", path, pcontext, "tested does not match status count")
            if local_classes != len(classes):
                add_error(errors, "profile_metadata", path, pcontext, "local_classes does not match class row count")
            if total_nodes != profile_nodes:
                add_error(errors, "profile_metadata", path, pcontext, "total_nodes does not match class node sum")

            result = ProfileResult(
                source=path,
                profile=profile,
                tested=tested,
                local_classes=local_classes,
                summary=summary,
                total_nodes=total_nodes,
                classes=tuple(classes),
            )
            loaded.append((n, result))
            profile_results.append(result)
            n_summary.update(profile_status)
            n_total_nodes += total_nodes
            n_tested += tested

        nrow_summary = counter_from_summary(nrow_raw.get("summary"))
        if nrow_summary != n_summary:
            add_error(errors, "artifact_metadata", path, ncontext, "n-row summary does not match profile summaries")
        if read_required_int(nrow_raw, "profile_count", errors, path, ncontext, "artifact_metadata") != len(profile_results):
            add_error(errors, "artifact_metadata", path, ncontext, "profile_count does not match profile row count")
        if read_required_int(nrow_raw, "tested", errors, path, ncontext, "artifact_metadata") != n_tested:
            add_error(errors, "artifact_metadata", path, ncontext, "tested does not match profile tested sum")
        if read_required_int(nrow_raw, "total_nodes", errors, path, ncontext, "artifact_metadata") != n_total_nodes:
            add_error(errors, "artifact_metadata", path, ncontext, "total_nodes does not match profile node sum")
        if read_required_int(nrow_raw, "local_distinct", errors, path, ncontext, "artifact_metadata") != len(n_local_keys):
            add_error(errors, "artifact_metadata", path, ncontext, "local_distinct does not match distinct class keys")
        if read_required_int(nrow_raw, "global_distinct", errors, path, ncontext, "artifact_metadata") != len(n_global_keys):
            add_error(errors, "artifact_metadata", path, ncontext, "global_distinct does not match SAT class keys")

        fresh_local = n_local_keys - cumulative_local
        fresh_global = n_global_keys - cumulative_global
        cumulative_local |= n_local_keys
        cumulative_global |= n_global_keys
        if read_required_int(nrow_raw, "fresh_local", errors, path, ncontext, "artifact_metadata") != len(fresh_local):
            add_error(errors, "artifact_metadata", path, ncontext, "fresh_local does not match artifact-local recomputation")
        if read_required_int(nrow_raw, "fresh_global", errors, path, ncontext, "artifact_metadata") != len(fresh_global):
            add_error(errors, "artifact_metadata", path, ncontext, "fresh_global does not match artifact-local recomputation")
        if read_required_int(nrow_raw, "cumulative_local", errors, path, ncontext, "artifact_metadata") != len(cumulative_local):
            add_error(errors, "artifact_metadata", path, ncontext, "cumulative_local does not match artifact-local recomputation")
        if read_required_int(nrow_raw, "cumulative_global", errors, path, ncontext, "artifact_metadata") != len(cumulative_global):
            add_error(errors, "artifact_metadata", path, ncontext, "cumulative_global does not match artifact-local recomputation")

    return loaded, {
        "path": rel(path),
        "status": artifact_status(path, ns, False),
        "n_values": ns,
    }


def result_rank(result: ProfileResult) -> tuple[int, int, int, str]:
    return (
        result.tested,
        result.local_classes,
        len(result.classes),
        result.source.name,
    )


def project_summary(
    loaded: list[tuple[int, ProfileResult]],
) -> dict[str, Any]:
    by_n: dict[int, dict[tuple[int, int, int], ProfileResult]] = defaultdict(dict)
    for n, result in loaded:
        old = by_n[n].get(result.profile)
        if old is None or result_rank(result) > result_rank(old):
            by_n[n][result.profile] = result

    n_values = sorted(by_n)
    all_keys: set[str] = set()
    terminal_keys: set[str] = set()
    first_seen: dict[str, int] = {}
    profile_count_by_n: list[dict[str, int]] = []
    class_first_seen_counts: Counter[int] = Counter()
    raw_class_cells = 0

    for n in n_values:
        keys_this_n: set[str] = set()
        for result in by_n[n].values():
            raw_class_cells += len(result.classes)
            for cell in result.classes:
                keys_this_n.add(cell.key)
                if cell.key not in first_seen:
                    first_seen[cell.key] = n
                    class_first_seen_counts[n] += 1
        all_keys |= keys_this_n
        if n == n_values[-1]:
            terminal_keys = keys_this_n
        profile_count_by_n.append({"n": n, "profile_count": len(by_n[n])})

    return {
        "loaded_n_values": n_values,
        "selected_profile_rows": sum(len(rows) for rows in by_n.values()),
        "selected_class_cells": raw_class_cells,
        "distinct_class_keys": len(all_keys),
        "terminal_n": n_values[-1] if n_values else 0,
        "terminal_class_keys": len(terminal_keys),
        "full_inventory_sha256": key_digest(all_keys),
        "terminal_inventory_sha256": key_digest(terminal_keys),
        "profile_count_by_n": profile_count_by_n,
        "class_first_seen_counts": [
            {"n": n, "count": class_first_seen_counts[n]}
            for n in n_values
        ],
    }


def build_report(sweep_dir: Path) -> dict[str, Any]:
    errors: list[dict[str, Any]] = []
    loaded: list[tuple[int, ProfileResult]] = []
    artifact_statuses: list[dict[str, Any]] = []
    for path in sorted(sweep_dir.glob("*.json")):
        artifact_loaded, status = validate_artifact(path, errors)
        loaded.extend(artifact_loaded)
        artifact_statuses.append(status)

    error_counts = Counter(error["kind"] for error in errors)
    project = project_summary(loaded)
    project_consistency_errors: list[str] = []
    if project["terminal_class_keys"] != project["distinct_class_keys"]:
        project_consistency_errors.append("terminal inventory differs from full inventory")
    if project["full_inventory_sha256"] != project["terminal_inventory_sha256"]:
        project_consistency_errors.append("terminal inventory digest differs from full digest")
    for message in project_consistency_errors:
        error_counts["project_consistency"] += 1
        add_error(errors, "project_consistency", sweep_dir, "project", message)

    return {
        "schema": SCHEMA,
        "source_dir": rel(sweep_dir),
        "checker": {
            "imports_project_code": False,
            "python_modules": [
                "argparse",
                "collections",
                "dataclasses",
                "functools",
                "hashlib",
                "itertools",
                "json",
                "pathlib",
                "re",
                "typing",
            ],
        },
        "artifact_statuses": artifact_statuses,
        "error_counts": dict(sorted(error_counts.items())),
        "error_count": len(errors),
        "errors": errors[:100],
        "checked": {
            "artifact_count": len(artifact_statuses),
            "artifact_n_rows": sum(len(status["n_values"]) for status in artifact_statuses),
            "raw_profile_rows": len(loaded),
            "raw_class_cells": sum(len(result.classes) for _n, result in loaded),
        },
        "project": project,
        "claims": {
            "class_keys_parse_and_satisfy_local_semantics": error_counts["class_key_semantics"] == 0,
            "artifact_metadata_recomputes": error_counts["artifact_metadata"] == 0,
            "profile_metadata_recomputes": error_counts["profile_metadata"] == 0,
            "project_terminal_inventory_equals_full_inventory":
                len(project_consistency_errors) == 0,
            "trusted_checker_error_free": len(errors) == 0,
        },
    }


def write_json_report(report: dict[str, Any], path: Path) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(report, indent=2, sort_keys=True) + "\n")


def markdown_table(report: dict[str, Any]) -> str:
    rows = [
        "| quantity | value |",
        "|---|---:|",
        f"| artifacts | {report['checked']['artifact_count']} |",
        f"| artifact n rows | {report['checked']['artifact_n_rows']} |",
        f"| raw profile rows | {fmt_int(report['checked']['raw_profile_rows'])} |",
        f"| raw class cells | {fmt_int(report['checked']['raw_class_cells'])} |",
        f"| selected profile rows | {fmt_int(report['project']['selected_profile_rows'])} |",
        f"| distinct class keys | {fmt_int(report['project']['distinct_class_keys'])} |",
        f"| terminal class keys | {fmt_int(report['project']['terminal_class_keys'])} |",
        f"| errors | {fmt_int(report['error_count'])} |",
    ]
    return "\n".join(rows)


def first_seen_table(report: dict[str, Any]) -> str:
    rows = [
        "| first `n` | new classes |",
        "|---:|---:|",
    ]
    for row in report["project"]["class_first_seen_counts"]:
        rows.append(f"| {row['n']} | {fmt_int(row['count'])} |")
    return "\n".join(rows)


def write_markdown_report(report: dict[str, Any], path: Path) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    project = report["project"]
    n_values = project["loaded_n_values"]
    range_text = f"`n={n_values[0]}..{n_values[-1]}`" if n_values else "no loaded rows"
    text = f"""<!--
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Author: Adam McKenna <adam@mysticflounder.ai>
-->

# Multi-Center L2 Trusted Sweep Semantics

Schema: `{report['schema']}`

This report is generated by `scripts/multi-center-trusted-sweep-check.py`, a
stdlib-only checker that does not import `census.multi_center` or
`analyze_sweeps`.  It independently parses the sweep JSON artifacts, validates
the raw class-key grammar and local support-incidence semantics, and recomputes
profile and artifact metadata totals.

Scope: {range_text}.  Result: `{report['error_count']}` trusted-check errors.

{markdown_table(report)}

Full inventory digest: `{project['full_inventory_sha256']}`

Terminal inventory digest: `{project['terminal_inventory_sha256']}`

{first_seen_table(report)}
"""
    path.write_text(text)


def write_lean_bank(report: dict[str, Any], path: Path) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    checked = report["checked"]
    project = report["project"]
    first_seen_counts = [
        (int(row["n"]), int(row["count"]))
        for row in project["class_first_seen_counts"]
    ]
    text = f"""/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.MultiCenter.Certificate.Sweep
import Erdos9796Proof.P97.MultiCenter.Certificate.ProfileInventory
import Erdos9796Proof.P97.MultiCenter.Certificate.ClassInventory

/-!
# Multi-center trusted sweep semantics certificate

This generated module records the summary of the stdlib-only trusted checker
`scripts/multi-center-trusted-sweep-check.py`.  The checker independently
parses the sweep artifacts and validates raw class-key local semantics,
profile summaries, artifact summaries, and project-level terminal inventory
agreement.

The Lean layer certifies the finite checker report and its agreement with the
generated sweep/profile/class certificate banks.  It does not prove the DFS
implementation complete.
-/

namespace Problem97
namespace MultiCenter
namespace Certificate
namespace TrustedSweep

structure TrustedReport where
  artifactCount : Nat
  artifactNRows : Nat
  rawProfileRows : Nat
  rawClassCells : Nat
  selectedProfileRows : Nat
  selectedClassCells : Nat
  distinctClassKeys : Nat
  terminalN : Nat
  terminalClassKeys : Nat
  errorCount : Nat
  classKeySemanticErrors : Nat
  artifactMetadataErrors : Nat
  profileMetadataErrors : Nat
  projectConsistencyErrors : Nat
  fullInventorySha256 : String
  terminalInventorySha256 : String
  deriving Repr, DecidableEq

/-- Summary emitted by schema `{report['schema']}`. -/
def report : TrustedReport where
  artifactCount := {checked['artifact_count']}
  artifactNRows := {checked['artifact_n_rows']}
  rawProfileRows := {checked['raw_profile_rows']}
  rawClassCells := {checked['raw_class_cells']}
  selectedProfileRows := {project['selected_profile_rows']}
  selectedClassCells := {project['selected_class_cells']}
  distinctClassKeys := {project['distinct_class_keys']}
  terminalN := {project['terminal_n']}
  terminalClassKeys := {project['terminal_class_keys']}
  errorCount := {report['error_count']}
  classKeySemanticErrors := {report['error_counts'].get('class_key_semantics', 0)}
  artifactMetadataErrors := {report['error_counts'].get('artifact_metadata', 0)}
  profileMetadataErrors := {report['error_counts'].get('profile_metadata', 0)}
  projectConsistencyErrors := {report['error_counts'].get('project_consistency', 0)}
  fullInventorySha256 := {lean_string(project['full_inventory_sha256'])}
  terminalInventorySha256 := {lean_string(project['terminal_inventory_sha256'])}

def loadedNs : List Nat :=
  {lean_nat_list(project['loaded_n_values'])}

def firstSeenCounts : List (Nat × Nat) :=
{lean_nat_pair_list_block(first_seen_counts)}

def reportErrorFree : Bool :=
  report.errorCount == 0

def classKeySemanticsOK : Bool :=
  report.classKeySemanticErrors == 0

def rawMetadataOK : Bool :=
  report.artifactMetadataErrors == 0 &&
    report.profileMetadataErrors == 0 &&
      report.projectConsistencyErrors == 0

def agreesWithCertificateBanks : Bool :=
  loadedNs.length ==
      Problem97.MultiCenter.Certificate.Sweep.rows.length &&
    report.selectedProfileRows ==
      Problem97.MultiCenter.Certificate.ProfileInventory.rows.length &&
    report.distinctClassKeys ==
      Problem97.MultiCenter.Certificate.ClassInventory.rows.length &&
    report.terminalClassKeys ==
      Problem97.MultiCenter.Certificate.ClassInventory.terminalClassCount

def terminalDigestEqualsFullDigest : Bool :=
  report.terminalInventorySha256 == report.fullInventorySha256

/-- The trusted checker found no errors. -/
theorem report_errorFree : reportErrorFree = true := by
  native_decide

/-- The trusted checker accepted every raw class key semantically. -/
theorem classKeySemantics_ok : classKeySemanticsOK = true := by
  native_decide

/-- The trusted checker recomputed profile, artifact, and project metadata. -/
theorem rawMetadata_ok : rawMetadataOK = true := by
  native_decide

/-- The trusted checker summary agrees with the generated certificate banks. -/
theorem agreesWithCertificateBanks_eq : agreesWithCertificateBanks = true := by
  native_decide

/-- The terminal inventory has the same digest as the full loaded inventory. -/
theorem terminalDigestEqualsFullDigest_eq :
    terminalDigestEqualsFullDigest = true := by
  native_decide

/-- The trusted checker uses the same loaded `n` values as the sweep bank. -/
theorem loadedNs_eq_sweepRows :
    loadedNs =
      Problem97.MultiCenter.Certificate.Sweep.rows.map
        Problem97.MultiCenter.Certificate.Sweep.SweepRow.n := by
  native_decide

/-- The trusted checker recovered the same first-seen distribution. -/
theorem firstSeenCounts_eq_classInventory :
    firstSeenCounts =
      Problem97.MultiCenter.Certificate.ClassInventory.firstSeenCounts := by
  native_decide

end TrustedSweep
end Certificate
end MultiCenter
end Problem97
"""
    path.write_text(text)


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--sweep-dir",
        type=Path,
        default=DEFAULT_SWEEP_DIR,
        help="Directory containing multi-center sweep JSON artifacts.",
    )
    parser.add_argument(
        "--json-out",
        type=Path,
        default=DEFAULT_JSON_OUT,
        help="Path for the trusted-check JSON report.",
    )
    parser.add_argument(
        "--markdown-out",
        type=Path,
        default=DEFAULT_MARKDOWN_OUT,
        help="Path for the trusted-check Markdown report.",
    )
    parser.add_argument(
        "--lean-out",
        type=Path,
        default=DEFAULT_LEAN_OUT,
        help="Path for the generated Lean trusted-check summary.",
    )
    return parser.parse_args()


def main() -> None:
    args = parse_args()
    report = build_report(args.sweep_dir)
    write_json_report(report, args.json_out)
    write_markdown_report(report, args.markdown_out)
    write_lean_bank(report, args.lean_out)


if __name__ == "__main__":
    main()
