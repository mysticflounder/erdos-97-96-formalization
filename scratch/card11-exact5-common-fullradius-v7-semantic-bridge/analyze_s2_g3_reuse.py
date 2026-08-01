#!/usr/bin/env python3
"""Compare the frozen s2_o0 core with the retained common G3 source positions.

This is an audit/generation input, not a proof.  It authenticates all inputs by
SHA-256, classifies every s2_o0 core clause by its source family, and records
which source positions are already present on the unguarded G3 common route.
"""

from __future__ import annotations

import argparse
import hashlib
import json
from collections import Counter, defaultdict
from pathlib import Path
from typing import Any


ROOT = Path(__file__).resolve().parents[2]
DEFAULT_S2 = ROOT / "scratch/card11-exact5-common-fullradius-v7/runs/s2_o0"
DEFAULT_INGRESS = (
    ROOT / "scratch/card11-exact5-common-fullradius-v7-ingress/s2_o0-ingress"
)
DEFAULT_G3 = Path(__file__).with_name("g3-retained-semantics.json")
DEFAULT_JSON = Path(__file__).with_name("s2-g3-reuse-map.json")
DEFAULT_MD = Path(__file__).with_name("s2-g3-reuse-summary.md")


def sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        for chunk in iter(lambda: stream.read(1 << 20), b""):
            digest.update(chunk)
    return digest.hexdigest()


def family_blocks(manifest: dict[str, Any]) -> list[tuple[int, int, str]]:
    return [
        (1, 207_969, "inherited-census554-base"),
        (207_970, 387_856, "inherited-separation"),
        (387_857, 414_047, "inherited-source-tail"),
        *[
            (
                int(block["first_clause_1based"]),
                int(block["last_clause_1based"]),
                str(block["name"]),
            )
            for block in manifest["clause_blocks"]
        ],
    ]


def classify(
    blocks: list[tuple[int, int, str]], source_id: int
) -> tuple[str, int]:
    for first, last, family in blocks:
        if first <= source_id <= last:
            return family, source_id - first
    raise ValueError(f"source clause {source_id} lies outside all family blocks")


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--s2-dir", type=Path, default=DEFAULT_S2)
    parser.add_argument("--ingress-dir", type=Path, default=DEFAULT_INGRESS)
    parser.add_argument("--g3-json", type=Path, default=DEFAULT_G3)
    parser.add_argument("--out-json", type=Path, default=DEFAULT_JSON)
    parser.add_argument("--out-md", type=Path, default=DEFAULT_MD)
    args = parser.parse_args()

    manifest_path = args.s2_dir / "manifest.json"
    map_path = args.ingress_dir / "core-to-input-clause-id.json"
    core_path = args.ingress_dir / "core.cnf"
    manifest = json.loads(manifest_path.read_text())
    core_to_source = [int(value) for value in json.loads(map_path.read_text())]
    g3 = json.loads(args.g3_json.read_text())

    if len(core_to_source) != 81_253:
        raise ValueError(f"unexpected s2_o0 core size: {len(core_to_source)}")
    if len(set(core_to_source)) != len(core_to_source):
        raise ValueError("s2_o0 core-to-source map is not injective")

    common_positions = {
        int(entry["original_position"])
        for entry in g3["entries"]
        if entry["route"] == "common" and entry["original_position"] is not None
    }
    selected_positions = {
        int(entry["original_position"])
        for entry in g3["entries"]
        if entry["route"] not in {"common", "selector-totality"}
        and entry["original_position"] is not None
    }

    blocks = family_blocks(manifest)
    family_rows: dict[str, list[dict[str, Any]]] = defaultdict(list)
    totals: Counter[str] = Counter()
    for core_index, source_id in enumerate(core_to_source, start=1):
        family, family_ordinal = classify(blocks, source_id)
        route = (
            "g3-common"
            if source_id in common_positions
            else "g3-selected-only"
            if source_id in selected_positions
            else "s2-only"
        )
        totals[route] += 1
        family_rows[family].append(
            {
                "core_clause_index_1based": core_index,
                "source_clause_id_1based": source_id,
                "family_ordinal_0based": family_ordinal,
                "reuse_class": route,
            }
        )

    family_summary: dict[str, dict[str, int]] = {}
    for _first, _last, family in blocks:
        rows = family_rows.get(family, [])
        if not rows:
            continue
        counts = Counter(row["reuse_class"] for row in rows)
        family_summary[family] = {
            "s2_retained": len(rows),
            "g3_common": counts["g3-common"],
            "g3_selected_only": counts["g3-selected-only"],
            "s2_only": counts["s2-only"],
        }

    payload = {
        "schema": "card11-exact5-common-fullradius-v7-s2-g3-reuse-v1",
        "claim_scope": (
            "Authenticated source-position overlap only; semantic reuse still "
            "requires the corresponding kernel-checked G3 family theorem."
        ),
        "inputs": {
            str(path.relative_to(ROOT)): sha256(path)
            for path in (manifest_path, core_path, map_path, args.g3_json)
        },
        "counts": {
            "s2_retained": len(core_to_source),
            "g3_common": totals["g3-common"],
            "g3_selected_only": totals["g3-selected-only"],
            "s2_only": totals["s2-only"],
        },
        "families": family_summary,
        "rows_by_family": family_rows,
    }
    args.out_json.write_text(json.dumps(payload, indent=2, sort_keys=True) + "\n")

    lines = [
        "# Exact-11 `s2_o0` / G3 source-position reuse audit",
        "",
        payload["claim_scope"],
        "",
        "| family | s2 retained | G3 common | G3 selected only | s2 only |",
        "|---|---:|---:|---:|---:|",
    ]
    for family, counts in family_summary.items():
        lines.append(
            f"| `{family}` | {counts['s2_retained']} | {counts['g3_common']} | "
            f"{counts['g3_selected_only']} | {counts['s2_only']} |"
        )
    counts = payload["counts"]
    lines.extend(
        [
            f"| **total** | **{counts['s2_retained']}** | "
            f"**{counts['g3_common']}** | **{counts['g3_selected_only']}** | "
            f"**{counts['s2_only']}** |",
            "",
            "The 18 `g3-selected-only` positions are the two first-apex families. "
            "They may reuse the unguarded occurrence semantics, but not the G3 "
            "guarded-clause checkpoint theorem verbatim.",
        ]
    )
    args.out_md.write_text("\n".join(lines) + "\n")
    print(args.out_json)
    print(args.out_md)
    print(json.dumps(payload["counts"], sort_keys=True))


if __name__ == "__main__":
    main()
