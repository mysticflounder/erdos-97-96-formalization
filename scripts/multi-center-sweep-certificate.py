#!/usr/bin/env python3
#
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
#
"""Emit certificate-facing multi-center sweep inventory data.

The raw sweep artifacts may overlap and their per-file cumulative/fresh fields
are not project-level invariants after a restarted range.  This generator uses
`census.multi_center.analyze_sweeps` to recompute the inventory from class keys,
then emits:

* a deterministic JSON report under `certificates/multi_center/reports`;
* a compact Markdown audit table; and
* a Lean bank of finite metadata checks.

This is a metadata certificate for the imported sweep rows.  It does not, by
itself, certify the Python search implementation or the geometric meaning of a
class key.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import sys
from collections import Counter
from collections.abc import Iterable
from pathlib import Path
from typing import Any


ROOT = Path(__file__).resolve().parents[1]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from census.multi_center import analyze_sweeps as sweeps  # noqa: E402


SWEEP_SCHEMA = "multi_center_l2_sweep_inventory_certificate.v1"
CLASS_SCHEMA = "multi_center_l2_class_inventory_certificate.v1"
PROFILE_SCHEMA = "multi_center_l2_profile_inventory_certificate.v1"
INCIDENCE_SCHEMA = "multi_center_l2_profile_class_incidence_certificate.v1"
DEFAULT_SWEEP_DIR = ROOT / "census" / "multi_center" / "sweeps"
DEFAULT_JSON_OUT = (
    ROOT / "certificates" / "multi_center" / "reports" /
    "l2_sweep_inventory_certificate.json"
)
DEFAULT_MARKDOWN_OUT = (
    ROOT / "certificates" / "multi_center" / "reports" /
    "l2_sweep_inventory_certificate.md"
)
DEFAULT_LEAN_OUT = (
    ROOT / "lean" / "Erdos9796Proof" / "P97" / "MultiCenter" /
    "Certificate" / "Sweep.lean"
)
DEFAULT_CLASS_JSON_OUT = (
    ROOT / "certificates" / "multi_center" / "reports" /
    "l2_class_inventory_certificate.json"
)
DEFAULT_CLASS_MARKDOWN_OUT = (
    ROOT / "certificates" / "multi_center" / "reports" /
    "l2_class_inventory_certificate.md"
)
DEFAULT_CLASS_LEAN_OUT = (
    ROOT / "lean" / "Erdos9796Proof" / "P97" / "MultiCenter" /
    "Certificate" / "ClassInventory.lean"
)
DEFAULT_TYPED_CLASS_LEAN_OUT = (
    ROOT / "lean" / "Erdos9796Proof" / "P97" / "MultiCenter" /
    "Certificate" / "TypedClassBank.lean"
)
DEFAULT_PROFILE_JSON_OUT = (
    ROOT / "certificates" / "multi_center" / "reports" /
    "l2_profile_inventory_certificate.json"
)
DEFAULT_PROFILE_MARKDOWN_OUT = (
    ROOT / "certificates" / "multi_center" / "reports" /
    "l2_profile_inventory_certificate.md"
)
DEFAULT_PROFILE_LEAN_OUT = (
    ROOT / "lean" / "Erdos9796Proof" / "P97" / "MultiCenter" /
    "Certificate" / "ProfileInventory.lean"
)
DEFAULT_INCIDENCE_JSON_OUT = (
    ROOT / "certificates" / "multi_center" / "reports" /
    "l2_profile_class_incidence_certificate.json"
)
DEFAULT_INCIDENCE_MARKDOWN_OUT = (
    ROOT / "certificates" / "multi_center" / "reports" /
    "l2_profile_class_incidence_certificate.md"
)
DEFAULT_INCIDENCE_LEAN_OUT = (
    ROOT / "lean" / "Erdos9796Proof" / "P97" / "MultiCenter" /
    "Certificate" / "ProfileClassIncidence.lean"
)


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


def lean_nat_list(values: Iterable[int]) -> str:
    return "[" + ", ".join(str(value) for value in values) + "]"


def key_digest(keys: Iterable[str]) -> str:
    digest = hashlib.sha256()
    for key in sorted(keys):
        digest.update(key.encode("utf-8"))
        digest.update(b"\n")
    return digest.hexdigest()


def single_key_sha256(key: str) -> str:
    return hashlib.sha256(key.encode("utf-8")).hexdigest()


def build_report(sweep_dir: Path) -> dict[str, Any]:
    paths = sorted(sweep_dir.glob("*.json"))
    by_n, artifact_statuses = sweeps.load_all(paths)

    rows: list[dict[str, Any]] = []
    previous_sat: set[str] | None = None
    cumulative_sat: set[str] = set()
    for n in sorted(by_n):
        aggregate = by_n[n]
        local = aggregate.local_keys
        sat = aggregate.keys_with_status("SAT")
        summary = aggregate.summary
        new_vs_previous = sat if previous_sat is None else sat - previous_sat
        missing_previous = set() if previous_sat is None else previous_sat - sat
        fresh = sat - cumulative_sat
        local_digest = key_digest(local)
        sat_digest = key_digest(sat)
        row = {
            "n": n,
            "profile_count": aggregate.profile_count,
            "local_distinct": len(local),
            "sat_distinct": len(sat),
            "local_inventory_sha256": local_digest,
            "sat_inventory_sha256": sat_digest,
            "unsat_cells": summary["UNSAT"],
            "indeterminate_cells": summary["INDETERMINATE"],
            "tested_cells": aggregate.tested,
            "total_nodes": aggregate.total_nodes,
            "fresh": len(fresh),
            "new_vs_previous": len(new_vs_previous),
            "missing_previous": len(missing_previous),
            "stable_from_previous": previous_sat is not None and sat == previous_sat,
            "source_artifact_count": len(aggregate.sources),
            "sources": [rel(path) for path in sorted(aggregate.sources)],
        }
        rows.append(row)
        previous_sat = sat
        cumulative_sat |= sat

    bad_rows = [
        row["n"]
        for row in rows
        if row["unsat_cells"] != 0
        or row["indeterminate_cells"] != 0
        or row["local_distinct"] != row["sat_distinct"]
        or row["local_inventory_sha256"] != row["sat_inventory_sha256"]
        or row["missing_previous"] != 0
    ]
    stable_from_previous = [
        row["n"] for row in rows if row["stable_from_previous"]
    ]
    n_values = [row["n"] for row in rows]
    return {
        "schema": SWEEP_SCHEMA,
        "source_dir": rel(sweep_dir),
        "artifact_statuses": [
            {
                "path": rel(path),
                "status": status,
                "n_values": ns,
            }
            for path, status, ns in artifact_statuses
        ],
        "n_values": n_values,
        "stable_from_previous": stable_from_previous,
        "bad_rows": bad_rows,
        "rows": rows,
        "claims": {
            "all_rows_have_no_unsat_or_indeterminate_cells": not bad_rows,
            "all_rows_have_local_equal_sat_distinct_class_count": not bad_rows,
            "all_rows_have_local_equal_sat_inventory_digest": not bad_rows,
            "no_sat_class_disappears_between_consecutive_loaded_n": not bad_rows,
        },
    }


def build_class_report(sweep_dir: Path) -> dict[str, Any]:
    paths = sorted(sweep_dir.glob("*.json"))
    by_n, artifact_statuses = sweeps.load_all(paths)
    n_values = sorted(by_n)
    terminal_n = n_values[-1] if n_values else 0

    seen_by_key: dict[str, set[int]] = {}
    status_by_key: dict[str, Counter[str]] = {}
    for n in n_values:
        aggregate = by_n[n]
        for key in aggregate.local_keys:
            seen_by_key.setdefault(key, set()).add(n)
        for key, counts in aggregate.class_status.items():
            status_by_key.setdefault(key, Counter()).update(counts)

    class_rows: list[dict[str, Any]] = []
    for class_id, key in enumerate(sorted(seen_by_key)):
        seen_ns = sorted(seen_by_key[key])
        status_counts = status_by_key.get(key, Counter())
        class_rows.append(
            {
                "id": class_id,
                "class_key_sha256": single_key_sha256(key),
                "class_key_length": len(key),
                "first_n": seen_ns[0],
                "last_n": seen_ns[-1],
                "seen_count": len(seen_ns),
                "seen_n_values": seen_ns,
                "status_counts": {
                    "SAT": status_counts["SAT"],
                    "UNSAT": status_counts["UNSAT"],
                    "INDETERMINATE": status_counts["INDETERMINATE"],
                },
                "class_key": key,
            }
        )

    first_seen_counter = Counter(row["first_n"] for row in class_rows)
    first_seen_counts = [
        {"n": n, "count": first_seen_counter[n]}
        for n in n_values
    ]
    bad_class_rows = [
        row["id"]
        for row in class_rows
        if row["last_n"] != terminal_n
        or row["seen_count"] <= 0
        or row["first_n"] not in n_values
        or row["status_counts"]["UNSAT"] != 0
        or row["status_counts"]["INDETERMINATE"] != 0
    ]
    all_keys = set(seen_by_key)
    terminal_keys = {
        key for key, seen_ns in seen_by_key.items() if terminal_n in seen_ns
    }
    return {
        "schema": CLASS_SCHEMA,
        "source_dir": rel(sweep_dir),
        "artifact_statuses": [
            {
                "path": rel(path),
                "status": status,
                "n_values": ns,
            }
            for path, status, ns in artifact_statuses
        ],
        "loaded_n_values": n_values,
        "terminal_n": terminal_n,
        "class_count": len(class_rows),
        "terminal_class_count": len(terminal_keys),
        "full_inventory_sha256": key_digest(all_keys),
        "terminal_inventory_sha256": key_digest(terminal_keys),
        "first_seen_counts": first_seen_counts,
        "bad_class_rows": bad_class_rows,
        "rows": class_rows,
        "claims": {
            "all_classes_seen_at_terminal_n": not bad_class_rows,
            "all_classes_have_no_bad_status_counts": not bad_class_rows,
            "terminal_inventory_equals_full_inventory":
                key_digest(all_keys) == key_digest(terminal_keys),
        },
    }


def build_profile_report(sweep_dir: Path) -> dict[str, Any]:
    paths = sorted(sweep_dir.glob("*.json"))
    by_n, artifact_statuses = sweeps.load_all(paths)
    rows: list[dict[str, Any]] = []
    row_id = 0
    for n in sorted(by_n):
        aggregate = by_n[n]
        for profile in sorted(aggregate.profiles):
            result = aggregate.profiles[profile]
            summary = result.summary
            if len(profile) != 3:
                raise ValueError(f"expected 3-entry profile at n={n}: {profile!r}")
            rows.append(
                {
                    "id": row_id,
                    "n": n,
                    "profile": list(profile),
                    "local_classes": result.local_classes,
                    "sat_cells": summary["SAT"],
                    "unsat_cells": summary["UNSAT"],
                    "indeterminate_cells": summary["INDETERMINATE"],
                    "tested_cells": result.tested,
                    "total_nodes": result.total_nodes,
                    "source": rel(result.source),
                }
            )
            row_id += 1

    profile_count_by_n = [
        {
            "n": n,
            "profile_count": len(by_n[n].profiles),
        }
        for n in sorted(by_n)
    ]
    bad_profile_rows = [
        row["id"]
        for row in rows
        if row["unsat_cells"] != 0
        or row["indeterminate_cells"] != 0
        or row["local_classes"] != row["sat_cells"]
        or row["tested_cells"] !=
            row["sat_cells"] + row["unsat_cells"] + row["indeterminate_cells"]
    ]
    return {
        "schema": PROFILE_SCHEMA,
        "source_dir": rel(sweep_dir),
        "artifact_statuses": [
            {
                "path": rel(path),
                "status": status,
                "n_values": ns,
            }
            for path, status, ns in artifact_statuses
        ],
        "loaded_n_values": sorted(by_n),
        "profile_row_count": len(rows),
        "profile_count_by_n": profile_count_by_n,
        "bad_profile_rows": bad_profile_rows,
        "rows": rows,
        "claims": {
            "all_profiles_have_no_unsat_or_indeterminate_cells":
                not bad_profile_rows,
            "all_profiles_have_local_equal_sat_count": not bad_profile_rows,
            "all_profiles_have_tested_count_matching_summary":
                not bad_profile_rows,
        },
    }


def id_ranges(values: list[int]) -> list[dict[str, int]]:
    if not values:
        return []
    ranges: list[dict[str, int]] = []
    start = values[0]
    previous = values[0]
    for value in values[1:]:
        if value == previous + 1:
            previous = value
            continue
        ranges.append({"first": start, "last": previous})
        start = value
        previous = value
    ranges.append({"first": start, "last": previous})
    return ranges


def incidence_digest(rows: list[dict[str, Any]]) -> str:
    digest = hashlib.sha256()
    for row in sorted(rows, key=lambda item: int(item["profile_id"])):
        profile_id = int(row["profile_id"])
        for class_id in row["class_ids"]:
            digest.update(f"{profile_id}\t{int(class_id)}\n".encode("utf-8"))
    return digest.hexdigest()


def class_id_digest(class_ids: list[int]) -> str:
    digest = hashlib.sha256()
    for class_id in class_ids:
        digest.update(f"{class_id}\n".encode("utf-8"))
    return digest.hexdigest()


def build_incidence_report(
    sweep_dir: Path,
    class_report: dict[str, Any],
    profile_report: dict[str, Any],
) -> dict[str, Any]:
    paths = sorted(sweep_dir.glob("*.json"))
    by_n, artifact_statuses = sweeps.load_all(paths)
    class_id_by_key = {
        str(row["class_key"]): int(row["id"])
        for row in class_report["rows"]
    }
    profile_id_by_key = {
        (int(row["n"]), tuple(int(value) for value in row["profile"])): int(row["id"])
        for row in profile_report["rows"]
    }
    profile_local_count_by_id = {
        int(row["id"]): int(row["local_classes"])
        for row in profile_report["rows"]
    }

    rows: list[dict[str, Any]] = []
    bad_rows: list[int] = []
    missing_class_keys = 0
    duplicate_class_ids = 0
    non_sat_cells = 0
    range_count = 0
    for n in sorted(by_n):
        aggregate = by_n[n]
        for profile in sorted(aggregate.profiles):
            result = aggregate.profiles[profile]
            profile_id = profile_id_by_key[(n, profile)]
            class_ids: list[int] = []
            row_non_sat = 0
            row_missing = 0
            for key, status, _nodes in result.classes:
                if status != "SAT":
                    row_non_sat += 1
                    continue
                class_id = class_id_by_key.get(key)
                if class_id is None:
                    row_missing += 1
                    continue
                class_ids.append(class_id)
            class_ids = sorted(class_ids)
            unique_class_ids = sorted(set(class_ids))
            row_duplicate = len(class_ids) - len(unique_class_ids)
            ranges = id_ranges(unique_class_ids)
            expected_count = profile_local_count_by_id[profile_id]
            if (
                row_non_sat != 0
                or row_missing != 0
                or row_duplicate != 0
                or len(unique_class_ids) != expected_count
            ):
                bad_rows.append(profile_id)
            non_sat_cells += row_non_sat
            missing_class_keys += row_missing
            duplicate_class_ids += row_duplicate
            range_count += len(ranges)
            rows.append(
                {
                    "profile_id": profile_id,
                    "n": n,
                    "profile": list(profile),
                    "class_count": len(unique_class_ids),
                    "expected_local_classes": expected_count,
                    "range_count": len(ranges),
                    "class_ids_sha256": class_id_digest(unique_class_ids),
                    "class_ids": unique_class_ids,
                    "ranges": ranges,
                    "source": rel(result.source),
                }
            )

    total_incidence_pairs = sum(int(row["class_count"]) for row in rows)
    return {
        "schema": INCIDENCE_SCHEMA,
        "source_dir": rel(sweep_dir),
        "artifact_statuses": [
            {
                "path": rel(path),
                "status": status,
                "n_values": ns,
            }
            for path, status, ns in artifact_statuses
        ],
        "loaded_n_values": profile_report["loaded_n_values"],
        "profile_row_count": len(rows),
        "class_count": int(class_report["class_count"]),
        "total_incidence_pairs": total_incidence_pairs,
        "compressed_range_count": range_count,
        "incidence_sha256": incidence_digest(rows),
        "bad_rows": bad_rows,
        "missing_class_keys": missing_class_keys,
        "duplicate_class_ids": duplicate_class_ids,
        "non_sat_cells": non_sat_cells,
        "rows": rows,
        "claims": {
            "all_incidence_cells_are_sat": non_sat_cells == 0,
            "all_incidence_class_keys_are_in_class_bank": missing_class_keys == 0,
            "all_profile_class_counts_match_profile_inventory": not bad_rows,
            "all_profile_class_ids_are_unique": duplicate_class_ids == 0,
        },
    }


def write_json_report(report: dict[str, Any], path: Path) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(report, indent=2, sort_keys=True) + "\n")


def markdown_table(rows: list[dict[str, Any]]) -> str:
    out = [
        "| n | profiles | LOCAL | SAT | fresh | new-vs-prev | missing-prev | "
        "UNSAT | INDET | class digest | cells | DFS nodes | sources |",
        "|---:|---:|---:|---:|---:|---:|---:|---:|---:|---|---:|---:|---:|",
    ]
    for row in rows:
        out.append(
            f"| {row['n']} | {row['profile_count']} | "
            f"{fmt_int(row['local_distinct'])} | "
            f"{fmt_int(row['sat_distinct'])} | "
            f"{fmt_int(row['fresh'])} | "
            f"{fmt_int(row['new_vs_previous'])} | "
            f"{fmt_int(row['missing_previous'])} | "
            f"{fmt_int(row['unsat_cells'])} | "
            f"{fmt_int(row['indeterminate_cells'])} | "
            f"`{row['sat_inventory_sha256'][:16]}` | "
            f"{fmt_int(row['tested_cells'])} | "
            f"{fmt_int(row['total_nodes'])} | "
            f"{row['source_artifact_count']} |"
        )
    return "\n".join(out)


def write_markdown_report(report: dict[str, Any], path: Path) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    rows = report["rows"]
    n_values = report["n_values"]
    stable = report["stable_from_previous"]
    if n_values:
        range_text = f"`n={n_values[0]}..{n_values[-1]}`"
    else:
        range_text = "no loaded rows"
    text = f"""<!--
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Author: Adam McKenna <adam@mysticflounder.ai>
-->

# Multi-Center L2 Sweep Inventory Certificate

Schema: `{report['schema']}`

This report is generated from `{report['source_dir']}` by
`scripts/multi-center-sweep-certificate.py`.  It records the project-level
inventory recomputed from class keys across overlapping sweep artifacts.

Scope: {range_text}.  The certificate-level facts are:

- every loaded row has `UNSAT = 0` and `INDETERMINATE = 0`;
- every loaded row has `LOCAL = SAT` at distinct class-key count and
  SHA-256 inventory-digest level;
- no SAT class disappears between consecutive loaded `n` rows;
- the exact inventory is stable from the previous row at
  `{', '.join(str(n) for n in stable)}`.

This is a finite metadata certificate for the imported sweep rows.  It does
not certify the Python search code, the semantic meaning of the class-key
encoding, or any unscanned `n`.

{markdown_table(rows)}
"""
    path.write_text(text)


def lean_nat_pair_list(values: Iterable[tuple[int, int]]) -> str:
    return "[" + ", ".join(f"({left}, {right})" for left, right in values) + "]"


def lean_nat_pair_list_block(
    values: Iterable[tuple[int, int]], indent: str = "      "
) -> str:
    pairs = list(values)
    if not pairs:
        return f"{indent}[]"
    lines = [f"{indent}["]
    for index, (left, right) in enumerate(pairs):
        suffix = "," if index + 1 < len(pairs) else ""
        lines.append(f"{indent}  ({left}, {right}){suffix}")
    lines.append(f"{indent}]")
    return "\n".join(lines)


def class_first_seen_table(report: dict[str, Any]) -> str:
    out = [
        "| first `n` | new classes |",
        "|---:|---:|",
    ]
    for row in report["first_seen_counts"]:
        out.append(f"| {row['n']} | {fmt_int(row['count'])} |")
    return "\n".join(out)


def write_class_markdown_report(report: dict[str, Any], path: Path) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    n_values = report["loaded_n_values"]
    if n_values:
        range_text = f"`n={n_values[0]}..{n_values[-1]}`"
    else:
        range_text = "no loaded rows"
    text = f"""<!--
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Author: Adam McKenna <adam@mysticflounder.ai>
-->

# Multi-Center L2 Class Inventory Certificate

Schema: `{report['schema']}`

This report is generated from `{report['source_dir']}` by
`scripts/multi-center-sweep-certificate.py`.  It records one digest-identified
row for every distinct class key in the recomputed L2 sweep inventory.

Scope: {range_text}.  The certificate-level facts are:

- there are `{fmt_int(report['class_count'])}` distinct class keys;
- every class is present at terminal row `n={report['terminal_n']}`;
- every class has zero UNSAT and INDETERMINATE status counts;
- the full-inventory digest is
  `{report['full_inventory_sha256']}`;
- the terminal-inventory digest is
  `{report['terminal_inventory_sha256']}`.

The JSON report includes the raw class keys and their per-class seen `n`
values.  The Lean bank uses only the digest identifiers and finite metadata, so
it is a class-imprint certificate rather than a raw class-key parser.

{class_first_seen_table(report)}
"""
    path.write_text(text)


def incidence_count_table(report: dict[str, Any]) -> str:
    by_n: dict[int, dict[str, int]] = {}
    for row in report["rows"]:
        n = int(row["n"])
        bucket = by_n.setdefault(n, {"profiles": 0, "pairs": 0, "ranges": 0})
        bucket["profiles"] += 1
        bucket["pairs"] += int(row["class_count"])
        bucket["ranges"] += int(row["range_count"])
    out = [
        "| n | profiles | profile/class pairs | compressed ranges |",
        "|---:|---:|---:|---:|",
    ]
    for n in sorted(by_n):
        bucket = by_n[n]
        out.append(
            f"| {n} | {fmt_int(bucket['profiles'])} | "
            f"{fmt_int(bucket['pairs'])} | {fmt_int(bucket['ranges'])} |"
        )
    return "\n".join(out)


def write_incidence_markdown_report(report: dict[str, Any], path: Path) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    n_values = report["loaded_n_values"]
    if n_values:
        range_text = f"`n={n_values[0]}..{n_values[-1]}`"
    else:
        range_text = "no loaded rows"
    text = f"""<!--
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Author: Adam McKenna <adam@mysticflounder.ai>
-->

# Multi-Center L2 Profile/Class Incidence Certificate

Schema: `{report['schema']}`

This report is generated from `{report['source_dir']}` by
`scripts/multi-center-sweep-certificate.py`.  It records the selected
profile/class incidence relation after resolving overlapping sweep artifacts.

Scope: {range_text}.  The certificate-level facts are:

- there are `{fmt_int(report['profile_row_count'])}` generated profile rows;
- there are `{fmt_int(report['total_incidence_pairs'])}` profile/class pairs;
- those pairs are represented in Lean by
  `{fmt_int(report['compressed_range_count'])}` contiguous class-id ranges;
- every recorded incidence cell is `SAT`;
- every class key maps to the generated class bank;
- each profile row's incidence count matches `ProfileInventory.localClasses`;
- the incidence-pair digest is `{report['incidence_sha256']}`.

This is a finite incidence certificate for the imported sweep rows.  It still
does not prove that the DFS implementation enumerates every possible local
class outside the checked artifact boundary.

{incidence_count_table(report)}
"""
    path.write_text(text)


def class_lean_row(row: dict[str, Any]) -> str:
    return f"""  {{ id := {row['id']}
    classKeySha256 := {lean_string(row['class_key_sha256'])}
    keyLength := {row['class_key_length']}
    firstN := {row['first_n']}
    lastN := {row['last_n']}
    seenCount := {row['seen_count']} }}"""


def class_row_chunks(rows: list[dict[str, Any]], chunk_size: int = 250) -> tuple[str, str]:
    chunk_names: list[str] = []
    chunk_defs: list[str] = []
    for index in range(0, len(rows), chunk_size):
        chunk_index = index // chunk_size
        chunk_name = f"rowsChunk{chunk_index:03d}"
        chunk_names.append(chunk_name)
        chunk_rows = rows[index:index + chunk_size]
        chunk_text = ",\n".join(class_lean_row(row) for row in chunk_rows)
        chunk_defs.append(
            f"""/-- Generated class-imprint rows, chunk {chunk_index}. -/
def {chunk_name} : List ClassRow :=
[
{chunk_text}
]"""
        )
    if not chunk_names:
        rows_expr = "  []"
    elif len(chunk_names) == 1:
        rows_expr = f"  {chunk_names[0]}"
    else:
        rows_expr = "  " + chunk_names[0] + " ++\n"
        rows_expr += "\n".join(
            f"    {name} ++" for name in chunk_names[1:-1]
        )
        rows_expr += "\n" if len(chunk_names) > 2 else ""
        rows_expr += f"    {chunk_names[-1]}"
    return "\n\n".join(chunk_defs), rows_expr


def require_int(value: Any, context: str) -> int:
    if type(value) is not int:
        raise ValueError(f"{context} must be an integer, got {value!r}")
    return value


def raw_vertex_mask(values: Any, context: str) -> int:
    if not isinstance(values, list):
        raise ValueError(f"{context} must be a list, got {values!r}")
    mask = 0
    for index, value in enumerate(values):
        vertex = require_int(value, f"{context}[{index}]")
        if vertex < 0 or vertex > 2:
            raise ValueError(f"{context}[{index}] out of Moser range: {vertex}")
        mask |= 1 << vertex
    return mask


def bounded_mask(value: Any, context: str) -> int:
    mask = require_int(value, context)
    if mask < 0 or mask > 7:
        raise ValueError(f"{context} out of three-bit range: {mask}")
    return mask


def typed_class_row(row: dict[str, Any]) -> dict[str, Any]:
    try:
        key = json.loads(row["class_key"])
    except json.JSONDecodeError as exc:
        raise ValueError(f"class row {row['id']} has invalid class_key JSON") from exc
    if not isinstance(key, list) or len(key) != 4:
        raise ValueError(f"class row {row['id']} has malformed class key: {key!r}")

    layer, participants, moser_masks, cap_rows = key
    if layer != "L2":
        raise ValueError(f"class row {row['id']} has unsupported layer {layer!r}")
    if not isinstance(moser_masks, list) or len(moser_masks) != 3:
        raise ValueError(f"class row {row['id']} has malformed Moser masks")
    if not isinstance(cap_rows, list):
        raise ValueError(f"class row {row['id']} has malformed cap rows")

    counts = [0] * 21
    seen_count_slots: set[int] = set()
    cap_offsets = {"S": 0, "O1": 7, "O2": 14}
    for entry_index, entry in enumerate(cap_rows):
        if not isinstance(entry, list) or len(entry) != 3:
            raise ValueError(
                f"class row {row['id']} cap row {entry_index} is malformed: {entry!r}"
            )
        cap, raw_mask, raw_count = entry
        if cap not in cap_offsets:
            raise ValueError(f"class row {row['id']} has unknown cap {cap!r}")
        mask = require_int(raw_mask, f"class row {row['id']} cap row {entry_index} mask")
        if mask < 1 or mask > 7:
            raise ValueError(f"class row {row['id']} cap mask out of range: {mask}")
        count = require_int(raw_count, f"class row {row['id']} cap row {entry_index} count")
        if count < 0:
            raise ValueError(f"class row {row['id']} has negative count {count}")
        slot = cap_offsets[cap] + (mask - 1)
        if slot in seen_count_slots:
            raise ValueError(f"class row {row['id']} duplicates cap/count slot {slot}")
        seen_count_slots.add(slot)
        counts[slot] = count

    return {
        "id": int(row["id"]),
        "first_n": int(row["first_n"]),
        "last_n": int(row["last_n"]),
        "participants_mask": raw_vertex_mask(participants, f"class row {row['id']} participants"),
        "moser0": bounded_mask(moser_masks[0], f"class row {row['id']} moser[0]"),
        "moser1": bounded_mask(moser_masks[1], f"class row {row['id']} moser[1]"),
        "moser2": bounded_mask(moser_masks[2], f"class row {row['id']} moser[2]"),
        "counts": counts,
    }


def typed_class_rows(report: dict[str, Any]) -> list[dict[str, Any]]:
    return [typed_class_row(row) for row in report["rows"]]


def typed_class_lean_row(row: dict[str, Any]) -> str:
    return f"""  {{ id := {row['id']}
    firstN := {row['first_n']}
    lastN := {row['last_n']}
    participantsMask := {row['participants_mask']}
    moser0 := {row['moser0']}
    moser1 := {row['moser1']}
    moser2 := {row['moser2']}
    counts := {lean_nat_list(row['counts'])} }}"""


def typed_class_row_chunks(
    rows: list[dict[str, Any]], chunk_size: int = 250
) -> tuple[str, str]:
    chunk_names: list[str] = []
    chunk_defs: list[str] = []
    for index in range(0, len(rows), chunk_size):
        chunk_index = index // chunk_size
        chunk_name = f"rowsChunk{chunk_index:03d}"
        chunk_names.append(chunk_name)
        chunk_rows = rows[index:index + chunk_size]
        chunk_text = ",\n".join(typed_class_lean_row(row) for row in chunk_rows)
        chunk_defs.append(
            f"""/-- Generated typed class rows, chunk {chunk_index}. -/
def {chunk_name} : List RawClassRow :=
[
{chunk_text}
]"""
        )
    if not chunk_names:
        rows_expr = "  []"
    elif len(chunk_names) == 1:
        rows_expr = f"  {chunk_names[0]}"
    else:
        rows_expr = "  " + chunk_names[0] + " ++\n"
        rows_expr += "\n".join(
            f"    {name} ++" for name in chunk_names[1:-1]
        )
        rows_expr += "\n" if len(chunk_names) > 2 else ""
        rows_expr += f"    {chunk_names[-1]}"
    return "\n\n".join(chunk_defs), rows_expr


def write_class_lean_bank(report: dict[str, Any], path: Path) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    rows = report["rows"]
    n_values = report["loaded_n_values"]
    terminal_n = int(report["terminal_n"])
    first_seen_counts = [
        (int(row["n"]), int(row["count"]))
        for row in report["first_seen_counts"]
    ]
    chunk_defs, rows_expr = class_row_chunks(rows)
    text = f"""/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.MultiCenter.Certificate.Sweep

/-!
# Multi-center class inventory certificate bank

This generated module records one finite metadata row for each digest-identified
L2 multi-center class key observed in the recomputed sweep inventory.  The raw
class keys live in `certificates/multi_center/reports/l2_class_inventory_certificate.json`;
Lean intentionally ingests only the stable digest identifiers and first/last
seen metadata.

This is a class-imprint certificate.  It does not certify the Python search
implementation or parse the semantic content of a class key.
-/

namespace Problem97
namespace MultiCenter
namespace Certificate
namespace ClassInventory

abbrev terminalN : Nat := {terminal_n}

def loadedNs : List Nat :=
  {lean_nat_list(n_values)}

/-- Digest-identified metadata for one distinct class key. -/
structure ClassRow where
  id : Nat
  classKeySha256 : String
  keyLength : Nat
  firstN : Nat
  lastN : Nat
  seenCount : Nat
  deriving Repr, DecidableEq

namespace ClassRow

/-- The class first appears at one of the loaded sweep rows. -/
def firstSeenInLoadedRange (row : ClassRow) : Bool :=
  loadedNs.contains row.firstN

/-- The row is present at the terminal loaded `n`. -/
def terminalPresent (row : ClassRow) : Bool :=
  row.lastN == terminalN

/-- The row carries nonempty key and observation metadata. -/
def hasNonemptyMetadata (row : ClassRow) : Bool :=
  decide (0 < row.keyLength) && decide (0 < row.seenCount)

/-- The observed first/last range is ordered. -/
def rangeOrdered (row : ClassRow) : Bool :=
  decide (row.firstN <= row.lastN)

/-- The row-level metadata facts exported by this certificate. -/
def metadataOK (row : ClassRow) : Bool :=
  ((row.firstSeenInLoadedRange && row.rangeOrdered) && row.terminalPresent) &&
    row.hasNonemptyMetadata

end ClassRow

{chunk_defs}

/-- Generated class-imprint rows from schema `{report['schema']}`. -/
def rows : List ClassRow :=
{rows_expr}

private theorem list_all_eq_true_of_mem
    {{α : Type _}} {{p : α → Bool}} {{a : α}} :
    ∀ {{items : List α}}, items.all p = true → a ∈ items → p a = true
  | [], _hall, hmem => by
      cases hmem
  | head :: tail, hall, hmem => by
      simp only [List.all_cons, Bool.and_eq_true] at hall
      simp only [List.mem_cons] at hmem
      rcases hmem with rfl | htail
      · exact hall.1
      · exact list_all_eq_true_of_mem hall.2 htail

def allRowsMetadataOK : Bool :=
  rows.all ClassRow.metadataOK

def terminalClassCount : Nat :=
  (rows.filter (fun row => row.lastN == terminalN)).length

def firstSeenCount (n : Nat) : Nat :=
  (rows.filter (fun row => row.firstN == n)).length

def firstSeenCounts : List (Nat × Nat) :=
  loadedNs.map (fun n => (n, firstSeenCount n))

/-- The class-inventory bank uses the same loaded `n` rows as the sweep bank. -/
theorem loadedNs_eq_sweepRows :
    loadedNs =
      Problem97.MultiCenter.Certificate.Sweep.rows.map
        Problem97.MultiCenter.Certificate.Sweep.SweepRow.n := by
  native_decide

/-- The generated class-imprint bank contains all 3,375 distinct class keys. -/
theorem rows_length : rows.length = {len(rows)} := by
  native_decide

/-- Every generated class-imprint row satisfies the finite metadata checks. -/
theorem allRows_metadataOK : allRowsMetadataOK = true := by
  native_decide

/-- The generated first-seen distribution over loaded `n` values. -/
theorem firstSeenCounts_eq :
    firstSeenCounts =
{lean_nat_pair_list_block(first_seen_counts)} := by
  native_decide

/-- Every generated class-imprint row is present at the terminal loaded `n`. -/
theorem terminalClassCount_eq : terminalClassCount = {len(rows)} := by
  native_decide

/-- Membership in the generated bank implies the row metadata check. -/
theorem metadataOK_of_mem_rows {{row : ClassRow}} (hrow : row ∈ rows) :
    row.metadataOK = true :=
  list_all_eq_true_of_mem allRows_metadataOK hrow

/-- Membership in the generated bank implies terminal presence. -/
theorem terminalPresent_of_mem_rows {{row : ClassRow}} (hrow : row ∈ rows) :
    row.terminalPresent = true := by
  have hmetadata := metadataOK_of_mem_rows hrow
  simp only [ClassRow.metadataOK, Bool.and_eq_true] at hmetadata
  exact hmetadata.1.2

end ClassInventory
end Certificate
end MultiCenter
end Problem97
"""
    path.write_text(text)


def write_typed_class_lean_bank(report: dict[str, Any], path: Path) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    rows = typed_class_rows(report)
    n_values = report["loaded_n_values"]
    terminal_n = int(report["terminal_n"])
    first_seen_counts = [
        (int(row["n"]), int(row["count"]))
        for row in report["first_seen_counts"]
    ]
    chunk_defs, rows_expr = typed_class_row_chunks(rows)
    text = f"""/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.MultiCenter.Certificate.ClassInventory
import Erdos9796Proof.P97.MultiCenter.Certificate.TypedClass

set_option linter.style.nativeDecide false

/-!
# Multi-center typed class certificate bank

This generated module decodes the raw L2 class keys from
`certificates/multi_center/reports/l2_class_inventory_certificate.json` into
typed `RawClassRow` values.  The rows can be interpreted as semantic
`JointClass` values by `RawClassRow.toJointClass`.

This is still a certificate surface, not a completion proof.  It gives Lean a
typed finite bank of the class keys and checks their row-level structure; the
bridge from this bank to LOCAL admissibility and profile completion is a
separate proof obligation.
-/

namespace Problem97
namespace MultiCenter
namespace Certificate
namespace TypedClassBank

abbrev terminalN : Nat := {terminal_n}

def loadedNs : List Nat :=
  {lean_nat_list(n_values)}

{chunk_defs}

/-- Generated typed class rows from schema `{report['schema']}`. -/
def rows : List RawClassRow :=
{rows_expr}

private theorem list_all_eq_true_of_mem
    {{α : Type _}} {{p : α → Bool}} {{a : α}} :
    ∀ {{items : List α}}, items.all p = true → a ∈ items → p a = true
  | [], _hall, hmem => by
      cases hmem
  | head :: tail, hall, hmem => by
      simp only [List.all_cons, Bool.and_eq_true] at hall
      simp only [List.mem_cons] at hmem
      rcases hmem with rfl | htail
      · exact hall.1
      · exact list_all_eq_true_of_mem hall.2 htail

/-- Semantic interpretations of the generated raw class rows. -/
def jointClasses : List JointClass :=
  rows.map RawClassRow.toJointClass

def allRowsStructuralOK : Bool :=
  rows.all (RawClassRow.structuralOKAt terminalN)

def terminalRowCount : Nat :=
  (rows.filter (fun row => row.lastN == terminalN)).length

def firstSeenCount (n : Nat) : Nat :=
  (rows.filter (fun row => row.firstN == n)).length

def firstSeenCounts : List (Nat × Nat) :=
  loadedNs.map (fun n => (n, firstSeenCount n))

/-- The typed bank uses the same loaded `n` rows as the class-imprint bank. -/
theorem loadedNs_eq_classInventory :
    loadedNs =
      Problem97.MultiCenter.Certificate.ClassInventory.loadedNs := by
  native_decide

/-- The typed bank has one raw row for each digest-identified class key. -/
theorem rows_length : rows.length = {len(rows)} := by
  native_decide

/-- The typed bank has the same row count as the digest class-imprint bank. -/
theorem rows_length_eq_classInventory :
    rows.length =
      Problem97.MultiCenter.Certificate.ClassInventory.rows.length := by
  native_decide

/-- Every generated raw class row satisfies the finite structural checks. -/
theorem allRows_structuralOK : allRowsStructuralOK = true := by
  native_decide

/-- The generated first-seen distribution agrees with the class-imprint bank. -/
theorem firstSeenCounts_eq_classInventory :
    firstSeenCounts =
      Problem97.MultiCenter.Certificate.ClassInventory.firstSeenCounts := by
  native_decide

/-- The generated first-seen distribution over loaded `n` values. -/
theorem firstSeenCounts_eq :
    firstSeenCounts =
{lean_nat_pair_list_block(first_seen_counts)} := by
  native_decide

/-- Every generated typed class row is present at the terminal loaded `n`. -/
theorem terminalRowCount_eq : terminalRowCount = {len(rows)} := by
  native_decide

/-- The terminal row count agrees with the class-imprint bank. -/
theorem terminalRowCount_eq_classInventory :
    terminalRowCount =
      Problem97.MultiCenter.Certificate.ClassInventory.terminalClassCount := by
  native_decide

/-- Mapping rows to semantic classes preserves the generated row count. -/
theorem jointClasses_length : jointClasses.length = rows.length := by
  simp [jointClasses]

/-- Membership in the generated bank implies the row structural check. -/
theorem structuralOKAt_terminalN_of_mem_rows {{row : RawClassRow}} (hrow : row ∈ rows) :
    row.structuralOKAt terminalN = true :=
  list_all_eq_true_of_mem allRows_structuralOK hrow

end TypedClassBank
end Certificate
end MultiCenter
end Problem97
"""
    path.write_text(text)


def lean_id_range(row: dict[str, int]) -> str:
    return f"{{ first := {row['first']}, last := {row['last']} }}"


def lean_id_ranges(ranges: list[dict[str, int]], indent: str = "    ") -> str:
    if not ranges:
        return "[]"
    lines = ["["]
    for index, row in enumerate(ranges):
        suffix = "," if index + 1 < len(ranges) else ""
        lines.append(f"{indent}{lean_id_range(row)}{suffix}")
    lines.append(f"{indent[:-2]}]")
    return "\n".join(lines)


def incidence_lean_row(row: dict[str, Any]) -> str:
    profile = row["profile"]
    return f"""  {{ id := {row['profile_id']}
    n := {row['n']}
    capS := {profile[0]}
    capO1 := {profile[1]}
    capO2 := {profile[2]}
    classCount := {row['class_count']}
    rangeCount := {row['range_count']}
    ranges := {lean_id_ranges(row['ranges'], "      ")} }}"""


def incidence_row_chunks(
    rows: list[dict[str, Any]], chunk_size: int = 25
) -> tuple[str, str]:
    chunk_names: list[str] = []
    chunk_defs: list[str] = []
    for index in range(0, len(rows), chunk_size):
        chunk_index = index // chunk_size
        chunk_name = f"rowsChunk{chunk_index:03d}"
        chunk_names.append(chunk_name)
        chunk_rows = rows[index:index + chunk_size]
        chunk_text = ",\n".join(incidence_lean_row(row) for row in chunk_rows)
        chunk_defs.append(
            f"""/-- Generated profile/class incidence rows, chunk {chunk_index}. -/
def {chunk_name} : List ProfileIncidenceRow :=
[
{chunk_text}
]"""
        )
    if not chunk_names:
        rows_expr = "  []"
    elif len(chunk_names) == 1:
        rows_expr = f"  {chunk_names[0]}"
    else:
        rows_expr = "  " + chunk_names[0] + " ++\n"
        rows_expr += "\n".join(
            f"    {name} ++" for name in chunk_names[1:-1]
        )
        rows_expr += "\n" if len(chunk_names) > 2 else ""
        rows_expr += f"    {chunk_names[-1]}"
    return "\n\n".join(chunk_defs), rows_expr


def write_incidence_lean_bank(report: dict[str, Any], path: Path) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    rows = report["rows"]
    threshold = min(report["loaded_n_values"]) if report["loaded_n_values"] else 0
    chunk_defs, rows_expr = incidence_row_chunks(rows)
    text = f"""/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.MultiCenter.Certificate.Completion

set_option linter.style.nativeDecide false

/-!
# Multi-center profile/class incidence certificate bank

This generated module records the selected profile/class incidence relation
from `certificates/multi_center/reports/l2_profile_class_incidence_certificate.json`.
Each profile row stores contiguous ranges of generated typed-class IDs, rather
than one Lean row per profile/class pair.

The relation is a certificate for the imported sweep artifacts.  It does not
by itself prove that the DFS implementation enumerates every possible local
class outside the checked artifact boundary.  It also does not claim the broad
`Completion.CoversLocalFrom` statement: that statement quantifies over L1 and
empty-participant local classes, while this generated bank is L2-only.
-/

namespace Problem97
namespace MultiCenter
namespace Certificate
namespace ProfileClassIncidence

abbrev threshold : Nat := {threshold}

/-- A contiguous range of generated typed-class IDs. -/
structure IdRange where
  first : Nat
  last : Nat
  deriving Repr, DecidableEq

namespace IdRange

/-- Whether `classId` belongs to this range. -/
def contains (range : IdRange) (classId : Nat) : Bool :=
  decide (range.first ≤ classId) && decide (classId ≤ range.last)

/-- Number of class IDs represented by this range. -/
def size (range : IdRange) : Nat :=
  range.last + 1 - range.first

/-- Structural range check against the typed class bank. -/
def ok (range : IdRange) : Bool :=
  decide (range.first ≤ range.last) &&
    decide (range.last < TypedClassBank.rows.length)

end IdRange

/-- Ordered, non-overlapping range-list check. -/
def rangesOrdered : List IdRange -> Bool
  | [] => true
  | first :: rest =>
      first.ok &&
        match rest with
        | [] => true
        | second :: tail =>
            decide (first.last < second.first) &&
              rangesOrdered (second :: tail)

/-- Number of class IDs represented by a range list. -/
def expandedCount : List IdRange -> Nat
  | [] => 0
  | first :: rest => first.size + expandedCount rest

/-- Incidence data for one generated profile row. -/
structure ProfileIncidenceRow where
  id : Nat
  n : Nat
  capS : Nat
  capO1 : Nat
  capO2 : Nat
  classCount : Nat
  rangeCount : Nat
  ranges : List IdRange
  deriving Repr, DecidableEq

namespace ProfileIncidenceRow

/-- Interpret the incidence row as a semantic profile. -/
def profile (row : ProfileIncidenceRow) : JointProfile where
  capSize
    | .S => row.capS
    | .O1 => row.capO1
    | .O2 => row.capO2

/-- Whether the row contains a generated typed-class ID. -/
def containsClassId (row : ProfileIncidenceRow) (classId : Nat) : Bool :=
  row.ranges.any (fun range => range.contains classId)

/-- Number of expanded class IDs represented by the row ranges. -/
def expandedCount (row : ProfileIncidenceRow) : Nat :=
  ProfileClassIncidence.expandedCount row.ranges

/-- Row-level structural checks exported by this certificate. -/
def metadataOK (row : ProfileIncidenceRow) : Bool :=
  decide (row.id < ProfileInventory.rows.length) &&
    decide (threshold ≤ row.n) &&
      decide (row.classCount = row.expandedCount) &&
        decide (row.rangeCount = row.ranges.length) &&
          rangesOrdered row.ranges

end ProfileIncidenceRow

{chunk_defs}

/-- Generated profile/class incidence rows from schema
`{report['schema']}`. -/
def rows : List ProfileIncidenceRow :=
{rows_expr}

def allRowsMetadataOK : Bool :=
  rows.all ProfileIncidenceRow.metadataOK

def totalIncidencePairs : Nat :=
  rows.foldl (fun total row => total + row.classCount) 0

def totalCompressedRanges : Nat :=
  rows.foldl (fun total row => total + row.rangeCount) 0

def profileMetadata : List (Nat × Nat × Nat × Nat × Nat × Nat) :=
  rows.map (fun row =>
    (row.id, row.n, row.capS, row.capO1, row.capO2, row.classCount))

def inventoryProfileMetadata : List (Nat × Nat × Nat × Nat × Nat × Nat) :=
  ProfileInventory.rows.map (fun row =>
    (row.id, row.n, row.capS, row.capO1, row.capO2, row.localClasses))

/-- Concrete profile/class certificate relation induced by the generated bank. -/
def certifies (profile : JointProfile) (cls : JointClass) : Prop :=
  ∃ incidenceRow, incidenceRow ∈ rows ∧ incidenceRow.profile = profile ∧
    ∃ classRow, classRow ∈ TypedClassBank.rows ∧
      incidenceRow.containsClassId classRow.id = true ∧
        RawClassRow.toJointClass classRow = cls

/-- The profile realization surface induced by the incidence certificate. -/
def surface : ProfileRealizationSurface :=
  Completion.surfaceFromCertifiedRelation certifies

/-- The profile realization surface induced by the incidence certificate after
closing under profile-equivalent representatives. -/
def representativeSurface : ProfileRealizationSurface :=
  Completion.surfaceFromCertifiedRepresentatives certifies

/-- The generated incidence bank contains all selected profile rows. -/
theorem rows_length : rows.length = {len(rows)} := by
  native_decide

/-- Every generated incidence row satisfies the finite metadata checks. -/
theorem allRows_metadataOK : allRowsMetadataOK = true := by
  native_decide

/-- The incidence rows agree with the profile inventory metadata and local
class counts. -/
theorem profileMetadata_eq_inventory :
    profileMetadata = inventoryProfileMetadata := by
  native_decide

/-- The expanded profile/class incidence pair count. -/
theorem totalIncidencePairs_eq :
    totalIncidencePairs = {report['total_incidence_pairs']} := by
  native_decide

/-- The compressed range count used by the Lean incidence bank. -/
theorem totalCompressedRanges_eq :
    totalCompressedRanges = {report['compressed_range_count']} := by
  native_decide

/-- The incidence certificate only certifies classes represented by the typed
class bank. -/
theorem certifies_usesTypedClassBank :
    Completion.UsesTypedClassBank certifies := by
  intro profile cls hcert
  rcases hcert with
    ⟨_incidenceRow, _hincidence, _hprofile, classRow, hclass, _hcontains, hcls⟩
  exact ⟨classRow, hclass, hcls⟩

/-- Exact incidence certification gives certification by representative. -/
theorem hasCertifiedRepresentative_of_certifies
    {{profile : JointProfile}} {{cls : JointClass}}
    (hcert : certifies profile cls) :
    Completion.HasCertifiedRepresentative certifies profile cls :=
  Completion.hasCertifiedRepresentative_of_certifies hcert

/-- Every exactly certified class lies on the L2 layer. -/
theorem layer_eq_l2_of_certifies
    {{profile : JointProfile}} {{cls : JointClass}}
    (hcert : certifies profile cls) :
    cls.layer = .L2 := by
  rcases hcert with
    ⟨_incidenceRow, _hincidence, _hprofile, classRow, _hclass,
      _hcontains, hcls⟩
  have hLayer := congrArg JointClass.layer hcls
  simpa [RawClassRow.toJointClass] using hLayer.symm

private def emptyL1Class : JointClass where
  layer := .L1
  participants := ∅
  moserMask := fun _ => ∅
  capCounts := fun _ _ => 0

private theorem emptyL1Class_locallyAdmissible (profile : JointProfile) :
    emptyL1Class.LocallyAdmissible profile := by
  unfold JointClass.LocallyAdmissible JointClass.Supported JointClass.jointKillsOK
  simp [emptyL1Class, JointClass.centerUseCount, JointClass.moserUseCount,
    JointClass.capUseCount, JointClass.capTotalCount, JointClass.h1UseInCap,
    JointClass.pairSharedCount, JointClass.pairSharedInCap]

private theorem not_certifies_emptyL1Class (profile : JointProfile) :
    ¬ certifies profile emptyL1Class := by
  intro hcert
  rcases hcert with
    ⟨_incidenceRow, _hincidence, _hprofile, _classRow, _hclass,
      _hcontains, hcls⟩
  have hLayer := congrArg JointClass.layer hcls
  simp [RawClassRow.toJointClass, emptyL1Class] at hLayer

private def counterexampleProfile : JointProfile where
  capSize
    | .S => 4
    | .O1 => 5
    | .O2 => 6

private theorem counterexampleProfile_occurs :
    Completion.profileOccursAtN 12 counterexampleProfile := by
  unfold Completion.profileOccursAtN Completion.profileMatchesRow
    Completion.profileOfRow
  let row : ProfileInventory.ProfileRow := {{
    id := 0
    n := 12
    capS := 4
    capO1 := 5
    capO2 := 6
    localClasses := 523
    satCells := 523
    unsatCells := 0
    indeterminateCells := 0
    testedCells := 523
    totalNodes := 312001
  }}
  refine ⟨row, ?_, ?_, ?_⟩
  · native_decide
  · rfl
  · rfl

/-- The broad, unscoped completion statement is false for this generated L2
bank: `JointClass.LocallyAdmissible` also admits L1 and empty-participant
classes, while every decoded typed-class row has layer `L2`. -/
theorem not_coversLocalFrom_certifies :
    ¬ Completion.CoversLocalFrom certifies threshold := by
  intro hcover
  exact not_certifies_emptyL1Class counterexampleProfile
    (hcover (n := 12) (profile := counterexampleProfile) (cls := emptyL1Class)
      le_rfl counterexampleProfile_occurs
      (emptyL1Class_locallyAdmissible counterexampleProfile))

end ProfileClassIncidence
end Certificate
end MultiCenter
end Problem97
"""
    path.write_text(text)


def profile_count_table(report: dict[str, Any]) -> str:
    out = [
        "| n | profiles |",
        "|---:|---:|",
    ]
    for row in report["profile_count_by_n"]:
        out.append(f"| {row['n']} | {row['profile_count']} |")
    return "\n".join(out)


def write_profile_markdown_report(report: dict[str, Any], path: Path) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    n_values = report["loaded_n_values"]
    if n_values:
        range_text = f"`n={n_values[0]}..{n_values[-1]}`"
    else:
        range_text = "no loaded rows"
    text = f"""<!--
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Author: Adam McKenna <adam@mysticflounder.ai>
-->

# Multi-Center L2 Profile Inventory Certificate

Schema: `{report['schema']}`

This report is generated from `{report['source_dir']}` by
`scripts/multi-center-sweep-certificate.py`.  It records one row for each
loaded `(n, profile)` summary selected by the sweep analyzer after resolving
overlapping artifacts.

Scope: {range_text}.  The certificate-level facts are:

- there are `{fmt_int(report['profile_row_count'])}` loaded profile rows;
- every profile row has `UNSAT = 0` and `INDETERMINATE = 0`;
- every profile row has `local_classes = SAT`;
- every profile row has `tested = SAT + UNSAT + INDETERMINATE`.

{profile_count_table(report)}
"""
    path.write_text(text)


def profile_lean_row(row: dict[str, Any]) -> str:
    profile = row["profile"]
    return f"""  {{ id := {row['id']}
    n := {row['n']}
    capS := {profile[0]}
    capO1 := {profile[1]}
    capO2 := {profile[2]}
    localClasses := {row['local_classes']}
    satCells := {row['sat_cells']}
    unsatCells := {row['unsat_cells']}
    indeterminateCells := {row['indeterminate_cells']}
    testedCells := {row['tested_cells']}
    totalNodes := {row['total_nodes']} }}"""


def write_profile_lean_bank(report: dict[str, Any], path: Path) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    rows = report["rows"]
    n_values = report["loaded_n_values"]
    profile_counts = [
        (int(row["n"]), int(row["profile_count"]))
        for row in report["profile_count_by_n"]
    ]
    row_text = ",\n".join(profile_lean_row(row) for row in rows)
    text = f"""/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.MultiCenter.Certificate.Sweep

/-!
# Multi-center profile inventory certificate bank

This generated module records one finite metadata row for each loaded
`(n, profile)` summary in the recomputed L2 sweep inventory.

It is a profile-summary certificate.  It does not certify the Python search
implementation or parse the semantic content of class keys.
-/

namespace Problem97
namespace MultiCenter
namespace Certificate
namespace ProfileInventory

def loadedNs : List Nat :=
  {lean_nat_list(n_values)}

/-- Metadata for one loaded `(n, profile)` summary. -/
structure ProfileRow where
  id : Nat
  n : Nat
  capS : Nat
  capO1 : Nat
  capO2 : Nat
  localClasses : Nat
  satCells : Nat
  unsatCells : Nat
  indeterminateCells : Nat
  testedCells : Nat
  totalNodes : Nat
  deriving Repr, DecidableEq

namespace ProfileRow

/-- The profile row has no UNSAT or INDETERMINATE sweep cells. -/
def noBadStatus (row : ProfileRow) : Bool :=
  row.unsatCells == 0 && row.indeterminateCells == 0

/-- The row's local class count is fully SAT. -/
def localEqualsSat (row : ProfileRow) : Bool :=
  row.localClasses == row.satCells

/-- The row's status summary sums to its tested-cell count. -/
def testedMatchesSummary (row : ProfileRow) : Bool :=
  row.testedCells ==
    row.satCells + row.unsatCells + row.indeterminateCells

/-- The row belongs to one of the loaded sweep `n` values. -/
def nInLoadedRange (row : ProfileRow) : Bool :=
  loadedNs.contains row.n

/-- The row-level metadata facts exported by this certificate. -/
def metadataOK (row : ProfileRow) : Bool :=
  ((row.noBadStatus && row.localEqualsSat) && row.testedMatchesSummary) &&
    row.nInLoadedRange

end ProfileRow

/-- Generated profile-summary rows from schema `{report['schema']}`. -/
def rows : List ProfileRow :=
[
{row_text}
]

private theorem list_all_eq_true_of_mem
    {{α : Type _}} {{p : α → Bool}} {{a : α}} :
    ∀ {{items : List α}}, items.all p = true → a ∈ items → p a = true
  | [], _hall, hmem => by
      cases hmem
  | head :: tail, hall, hmem => by
      simp only [List.all_cons, Bool.and_eq_true] at hall
      simp only [List.mem_cons] at hmem
      rcases hmem with rfl | htail
      · exact hall.1
      · exact list_all_eq_true_of_mem hall.2 htail

def allRowsMetadataOK : Bool :=
  rows.all ProfileRow.metadataOK

def profileCountAtN (n : Nat) : Nat :=
  (rows.filter (fun row => row.n == n)).length

def profileCountsByN : List (Nat × Nat) :=
  loadedNs.map (fun n => (n, profileCountAtN n))

/-- The profile bank uses the same loaded `n` rows as the sweep bank. -/
theorem loadedNs_eq_sweepRows :
    loadedNs =
      Problem97.MultiCenter.Certificate.Sweep.rows.map
        Problem97.MultiCenter.Certificate.Sweep.SweepRow.n := by
  native_decide

/-- The generated profile-summary bank contains all loaded profile rows. -/
theorem rows_length : rows.length = {len(rows)} := by
  native_decide

/-- Every generated profile-summary row satisfies the finite metadata checks. -/
theorem allRows_metadataOK : allRowsMetadataOK = true := by
  native_decide

/-- The generated profile counts by `n` agree with the sweep bank. -/
theorem profileCountsByN_eq_sweepProfileCounts :
    profileCountsByN =
      Problem97.MultiCenter.Certificate.Sweep.rows.map
        (fun row => (row.n, row.profileCount)) := by
  native_decide

/-- The generated profile-count distribution over loaded `n` values. -/
theorem profileCountsByN_eq :
    profileCountsByN =
{lean_nat_pair_list_block(profile_counts)} := by
  native_decide

/-- Membership in the generated bank implies the row metadata check. -/
theorem metadataOK_of_mem_rows {{row : ProfileRow}} (hrow : row ∈ rows) :
    row.metadataOK = true :=
  list_all_eq_true_of_mem allRows_metadataOK hrow

/-- Membership in the generated bank implies no bad status cells. -/
theorem noBadStatus_of_mem_rows {{row : ProfileRow}} (hrow : row ∈ rows) :
    row.noBadStatus = true := by
  have hmetadata := metadataOK_of_mem_rows hrow
  simp only [ProfileRow.metadataOK, Bool.and_eq_true] at hmetadata
  exact hmetadata.1.1.1

/-- Membership in the generated bank implies `local_classes = SAT`. -/
theorem localEqualsSat_of_mem_rows {{row : ProfileRow}} (hrow : row ∈ rows) :
    row.localEqualsSat = true := by
  have hmetadata := metadataOK_of_mem_rows hrow
  simp only [ProfileRow.metadataOK, Bool.and_eq_true] at hmetadata
  exact hmetadata.1.1.2

end ProfileInventory
end Certificate
end MultiCenter
end Problem97
"""
    path.write_text(text)


def lean_row(row: dict[str, Any]) -> str:
    return f"""  {{ n := {row['n']}
    profileCount := {row['profile_count']}
    localDistinct := {row['local_distinct']}
    satDistinct := {row['sat_distinct']}
    localInventorySha256 := {lean_string(row['local_inventory_sha256'])}
    satInventorySha256 := {lean_string(row['sat_inventory_sha256'])}
    unsatCells := {row['unsat_cells']}
    indeterminateCells := {row['indeterminate_cells']}
    testedCells := {row['tested_cells']}
    totalNodes := {row['total_nodes']}
    fresh := {row['fresh']}
    newVsPrevious := {row['new_vs_previous']}
    missingPrevious := {row['missing_previous']}
    stableFromPrevious := {lean_bool(row['stable_from_previous'])}
    sourceArtifactCount := {row['source_artifact_count']} }}"""


def write_lean_bank(report: dict[str, Any], path: Path) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    rows = report["rows"]
    n_values = [row["n"] for row in rows]
    stable = [row["n"] for row in rows if row["stable_from_previous"]]
    row_text = ",\n".join(lean_row(row) for row in rows)
    text = f"""/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Lean

/-!
# Multi-center sweep certificate bank

This generated module records finite metadata from the L2 multi-center sweep
artifacts.  The rows are recomputed from class keys across overlapping sweep
files by `scripts/multi-center-sweep-certificate.py`.

The theorems below certify only the imported finite metadata: no loaded row has
an UNSAT or INDETERMINATE cell, every loaded row has the same distinct LOCAL and
SAT class-key count, and no SAT class disappears between consecutive loaded
rows.  They do not certify the Python search implementation or the geometric
soundness of the class-key encoding.
-/

namespace Problem97
namespace MultiCenter
namespace Certificate
namespace Sweep

/-- Recomputed project-level inventory for one loaded `n` row. -/
structure SweepRow where
  n : Nat
  profileCount : Nat
  localDistinct : Nat
  satDistinct : Nat
  localInventorySha256 : String
  satInventorySha256 : String
  unsatCells : Nat
  indeterminateCells : Nat
  testedCells : Nat
  totalNodes : Nat
  fresh : Nat
  newVsPrevious : Nat
  missingPrevious : Nat
  stableFromPrevious : Bool
  sourceArtifactCount : Nat
  deriving Repr, DecidableEq

namespace SweepRow

/-- The row has no UNSAT or INDETERMINATE sweep cells. -/
def noBadStatus (row : SweepRow) : Bool :=
  row.unsatCells == 0 && row.indeterminateCells == 0

/-- The row's distinct LOCAL inventory is fully SAT at the class-key level. -/
def localEqualsSat (row : SweepRow) : Bool :=
  row.localDistinct == row.satDistinct

/-- The row's LOCAL and SAT class-key inventory digests match. -/
def localDigestEqualsSat (row : SweepRow) : Bool :=
  row.localInventorySha256 == row.satInventorySha256

/-- No SAT class from the previous loaded row is missing at this row. -/
def noMissingPrevious (row : SweepRow) : Bool :=
  row.missingPrevious == 0

/-- The row-level metadata facts exported by this certificate. -/
def metadataOK (row : SweepRow) : Bool :=
  ((row.noBadStatus && row.localEqualsSat) && row.localDigestEqualsSat) &&
    row.noMissingPrevious

end SweepRow

/-- Generated rows from schema `{report['schema']}`. -/
def rows : List SweepRow :=
[
{row_text}
]

private theorem list_all_eq_true_of_mem
    {{α : Type _}} {{p : α → Bool}} {{a : α}} :
    ∀ {{items : List α}}, items.all p = true → a ∈ items → p a = true
  | [], _hall, hmem => by
      cases hmem
  | head :: tail, hall, hmem => by
      simp only [List.all_cons, Bool.and_eq_true] at hall
      simp only [List.mem_cons] at hmem
      rcases hmem with rfl | htail
      · exact hall.1
      · exact list_all_eq_true_of_mem hall.2 htail

def allRowsMetadataOK : Bool :=
  rows.all SweepRow.metadataOK

def rowsHaveSources : Bool :=
  rows.all (fun row => decide (0 < row.sourceArtifactCount))

def stableFromPreviousNs : List Nat :=
  (rows.filter (fun row => row.stableFromPrevious)).map SweepRow.n

/-- The loaded sweep rows cover exactly the generated `n` values. -/
theorem rows_nValues :
    rows.map SweepRow.n = {lean_nat_list(n_values)} := by
  native_decide

/-- Every generated row satisfies the exported finite metadata checks. -/
theorem allRows_metadataOK : allRowsMetadataOK = true := by
  native_decide

/-- Every generated row is backed by at least one source artifact. -/
theorem rows_haveSources : rowsHaveSources = true := by
  native_decide

/-- Loaded rows whose exact SAT inventory is unchanged from the previous row. -/
theorem stableFromPreviousNs_eq :
    stableFromPreviousNs = {lean_nat_list(stable)} := by
  native_decide

/-- Membership in the generated bank implies the row metadata check. -/
theorem metadataOK_of_mem_rows {{row : SweepRow}} (hrow : row ∈ rows) :
    row.metadataOK = true :=
  list_all_eq_true_of_mem allRows_metadataOK hrow

/-- Membership in the generated bank implies no bad status cells. -/
theorem noBadStatus_of_mem_rows {{row : SweepRow}} (hrow : row ∈ rows) :
    row.noBadStatus = true := by
  have hmetadata := metadataOK_of_mem_rows hrow
  simp only [SweepRow.metadataOK, Bool.and_eq_true] at hmetadata
  exact hmetadata.1.1.1

/-- Membership in the generated bank implies `LOCAL = SAT` at class-key level. -/
theorem localEqualsSat_of_mem_rows {{row : SweepRow}} (hrow : row ∈ rows) :
    row.localEqualsSat = true := by
  have hmetadata := metadataOK_of_mem_rows hrow
  simp only [SweepRow.metadataOK, Bool.and_eq_true] at hmetadata
  exact hmetadata.1.1.2

/-- Membership in the generated bank implies matching class-key inventory digests. -/
theorem localDigestEqualsSat_of_mem_rows {{row : SweepRow}} (hrow : row ∈ rows) :
    row.localDigestEqualsSat = true := by
  have hmetadata := metadataOK_of_mem_rows hrow
  simp only [SweepRow.metadataOK, Bool.and_eq_true] at hmetadata
  exact hmetadata.1.2

/-- Membership in the generated bank implies no previous SAT class is missing. -/
theorem noMissingPrevious_of_mem_rows {{row : SweepRow}} (hrow : row ∈ rows) :
    row.noMissingPrevious = true := by
  have hmetadata := metadataOK_of_mem_rows hrow
  simp only [SweepRow.metadataOK, Bool.and_eq_true] at hmetadata
  exact hmetadata.2

end Sweep
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
        help="Path for the deterministic JSON report.",
    )
    parser.add_argument(
        "--markdown-out",
        type=Path,
        default=DEFAULT_MARKDOWN_OUT,
        help="Path for the Markdown report.",
    )
    parser.add_argument(
        "--lean-out",
        type=Path,
        default=DEFAULT_LEAN_OUT,
        help="Path for the generated Lean bank.",
    )
    parser.add_argument(
        "--class-json-out",
        type=Path,
        default=DEFAULT_CLASS_JSON_OUT,
        help="Path for the deterministic class-inventory JSON report.",
    )
    parser.add_argument(
        "--class-markdown-out",
        type=Path,
        default=DEFAULT_CLASS_MARKDOWN_OUT,
        help="Path for the class-inventory Markdown report.",
    )
    parser.add_argument(
        "--class-lean-out",
        type=Path,
        default=DEFAULT_CLASS_LEAN_OUT,
        help="Path for the generated class-inventory Lean bank.",
    )
    parser.add_argument(
        "--typed-class-lean-out",
        type=Path,
        default=DEFAULT_TYPED_CLASS_LEAN_OUT,
        help="Path for the generated typed class Lean bank.",
    )
    parser.add_argument(
        "--profile-json-out",
        type=Path,
        default=DEFAULT_PROFILE_JSON_OUT,
        help="Path for the deterministic profile-inventory JSON report.",
    )
    parser.add_argument(
        "--profile-markdown-out",
        type=Path,
        default=DEFAULT_PROFILE_MARKDOWN_OUT,
        help="Path for the profile-inventory Markdown report.",
    )
    parser.add_argument(
        "--profile-lean-out",
        type=Path,
        default=DEFAULT_PROFILE_LEAN_OUT,
        help="Path for the generated profile-inventory Lean bank.",
    )
    parser.add_argument(
        "--incidence-json-out",
        type=Path,
        default=DEFAULT_INCIDENCE_JSON_OUT,
        help="Path for the deterministic profile/class incidence JSON report.",
    )
    parser.add_argument(
        "--incidence-markdown-out",
        type=Path,
        default=DEFAULT_INCIDENCE_MARKDOWN_OUT,
        help="Path for the profile/class incidence Markdown report.",
    )
    parser.add_argument(
        "--incidence-lean-out",
        type=Path,
        default=DEFAULT_INCIDENCE_LEAN_OUT,
        help="Path for the generated profile/class incidence Lean bank.",
    )
    return parser.parse_args()


def main() -> None:
    args = parse_args()
    report = build_report(args.sweep_dir)
    class_report = build_class_report(args.sweep_dir)
    profile_report = build_profile_report(args.sweep_dir)
    incidence_report = build_incidence_report(
        args.sweep_dir, class_report, profile_report
    )
    write_json_report(report, args.json_out)
    write_markdown_report(report, args.markdown_out)
    write_lean_bank(report, args.lean_out)
    write_json_report(class_report, args.class_json_out)
    write_class_markdown_report(class_report, args.class_markdown_out)
    write_class_lean_bank(class_report, args.class_lean_out)
    write_typed_class_lean_bank(class_report, args.typed_class_lean_out)
    write_json_report(profile_report, args.profile_json_out)
    write_profile_markdown_report(profile_report, args.profile_markdown_out)
    write_profile_lean_bank(profile_report, args.profile_lean_out)
    write_json_report(incidence_report, args.incidence_json_out)
    write_incidence_markdown_report(
        incidence_report, args.incidence_markdown_out
    )
    write_incidence_lean_bank(incidence_report, args.incidence_lean_out)


if __name__ == "__main__":
    main()
