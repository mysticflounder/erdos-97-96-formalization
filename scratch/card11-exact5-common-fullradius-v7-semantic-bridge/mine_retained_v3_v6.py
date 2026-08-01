#!/usr/bin/env python3
"""Mine the exact V3--V6 clauses retained by the s2_o0 LRAT core.

The result is an audit/bridge input, not a proof.  It authenticates every
retained clause against both the frozen full CNF and the extracted core, then
attaches the encoder's manifest-level meaning to every post-inherited literal.
"""

from __future__ import annotations

import argparse
import hashlib
import json
from collections import Counter, defaultdict
from pathlib import Path
from typing import Any


ROOT = Path(__file__).resolve().parents[2]
DEFAULT_CASE = ROOT / "scratch/card11-exact5-common-fullradius-v7/runs/s2_o0"
DEFAULT_INGRESS = (
    ROOT
    / "scratch/card11-exact5-common-fullradius-v7-ingress/s2_o0-ingress"
)


def sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        for chunk in iter(lambda: stream.read(1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest()


def dimacs_clauses(path: Path):
    with path.open(encoding="ascii") as stream:
        for line in stream:
            if not line or line[0] in "cp%0":
                continue
            literals = [int(token) for token in line.split()]
            if not literals or literals[-1] != 0:
                raise ValueError(f"malformed DIMACS clause in {path}: {line[:80]}")
            yield literals[:-1]


def semantic_variable_map(manifest: dict[str, Any]) -> dict[int, dict[str, Any]]:
    result: dict[int, dict[str, Any]] = {}
    families = {
        "selected_row": "selected_rows",
        "source_choice": "source_choices",
        "local_equality": "equality_variables",
        "source_center": "source_center_variables",
        "global_equality": "global_edge_equality_variables",
        "local_four": "v6_local_four_class_variables",
        "qdeleted_pair": "v6_qdeleted_pair_variables",
        "order_selector": "order_selectors",
    }
    for kind, key in families.items():
        payload = manifest[key]
        values = payload.values() if isinstance(payload, dict) else payload
        for raw in values:
            entry = dict(raw)
            variable = int(entry.pop("variable"))
            if variable in result:
                raise ValueError(f"duplicate semantic variable {variable}")
            result[variable] = {"kind": kind, **entry}
    for center, variable in manifest["used_center_variables"].items():
        variable = int(variable)
        if variable in result:
            raise ValueError(f"duplicate semantic variable {variable}")
        result[variable] = {"kind": "used_center", "center": int(center)}
    return result


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--case-dir", type=Path, default=DEFAULT_CASE)
    parser.add_argument("--ingress-dir", type=Path, default=DEFAULT_INGRESS)
    parser.add_argument(
        "--out",
        type=Path,
        default=Path(__file__).with_name("retained-v3-v6.json"),
    )
    parser.add_argument(
        "--summary",
        type=Path,
        default=Path(__file__).with_name("retained-v3-v6-summary.md"),
    )
    args = parser.parse_args()

    manifest_path = args.case_dir / "manifest.json"
    input_path = args.case_dir / "input.cnf"
    core_path = args.ingress_dir / "core.cnf"
    core_map_path = args.ingress_dir / "core-to-input-clause-id.json"
    manifest = json.loads(manifest_path.read_text())
    core_to_input = [int(x) for x in json.loads(core_map_path.read_text())]

    blocks = {
        block["name"]: (
            int(block["first_clause_1based"]),
            int(block["last_clause_1based"]),
        )
        for block in manifest["clause_blocks"]
    }
    relevant_blocks = {
        name: bounds
        for name, bounds in blocks.items()
        if bounds[0] >= 414_048 and bounds[1] <= 1_180_698
    }
    retained_ids = {
        clause_id
        for clause_id in core_to_input
        if any(first <= clause_id <= last for first, last in relevant_blocks.values())
    }

    selected_input: dict[int, list[int]] = {}
    for clause_id, clause in enumerate(dimacs_clauses(input_path), start=1):
        if clause_id in retained_ids:
            selected_input[clause_id] = clause
    if selected_input.keys() != retained_ids:
        missing = sorted(retained_ids - selected_input.keys())
        raise ValueError(f"missing retained input clauses: {missing[:10]}")

    core_clauses = list(dimacs_clauses(core_path))
    if len(core_clauses) != len(core_to_input):
        raise ValueError(
            f"core/map length mismatch: {len(core_clauses)} != {len(core_to_input)}"
        )
    core_by_input: dict[int, list[int]] = {}
    input_to_core_index: dict[int, int] = {}
    for core_index, (core_clause, input_id) in enumerate(
        zip(core_clauses, core_to_input, strict=True), start=1
    ):
        if sorted(core_clause) != sorted(selected_input.get(input_id, core_clause)):
            raise ValueError(f"core clause differs from input clause {input_id}")
        if input_id in retained_ids:
            core_by_input[input_id] = core_clause
            input_to_core_index[input_id] = core_index

    semantic_vars = semantic_variable_map(manifest)
    family_entries: dict[str, list[dict[str, Any]]] = defaultdict(list)
    kind_counts: Counter[str] = Counter()
    for input_id in sorted(retained_ids):
        family = next(
            name
            for name, (first, last) in relevant_blocks.items()
            if first <= input_id <= last
        )
        decoded = []
        for literal in selected_input[input_id]:
            variable = abs(literal)
            meaning = semantic_vars.get(
                variable,
                {
                    "kind": (
                        "inherited"
                        if variable <= int(manifest["inherited_variables"])
                        else "unclassified"
                    )
                },
            )
            kind_counts[meaning["kind"]] += 1
            decoded.append(
                {
                    "literal": literal,
                    "variable": variable,
                    "positive": literal > 0,
                    "meaning": meaning,
                }
            )
        family_entries[family].append(
            {
                "input_clause_id": input_id,
                "core_clause_index_1based": input_to_core_index[input_id],
                "clause": selected_input[input_id],
                "decoded": decoded,
            }
        )

    artifact = {
        "schema": "p97-card11-exact5-v7-retained-v3-v6-v1",
        "claim_scope": (
            "Exact retained-clause census and manifest decoding only; "
            "not a Lean proof or UNSAT certificate."
        ),
        "inputs": {
            str(path.relative_to(ROOT)): sha256(path)
            for path in (manifest_path, input_path, core_path, core_map_path)
        },
        "counts": {
            "retained_v3_v6_clauses": len(retained_ids),
            "by_family": {
                name: len(entries)
                for name, entries in sorted(family_entries.items())
            },
            "literal_kinds": dict(sorted(kind_counts.items())),
        },
        "families": dict(sorted(family_entries.items())),
    }
    args.out.parent.mkdir(parents=True, exist_ok=True)
    args.out.write_text(json.dumps(artifact, indent=2, sort_keys=True) + "\n")
    summary_lines = [
        "# Exact retained V3--V6 census",
        "",
        "This is a clause-map audit artifact, not a Lean proof.",
        "",
        f"- retained clauses: `{len(retained_ids)}`",
        f"- full CNF SHA-256: `{artifact['inputs'][str(input_path.relative_to(ROOT))]}`",
        f"- core CNF SHA-256: `{artifact['inputs'][str(core_path.relative_to(ROOT))]}`",
        "",
        "## Counts by family",
        "",
        "| Family | Retained |",
        "|---|---:|",
    ]
    summary_lines.extend(
        f"| `{name}` | {count} |"
        for name, count in artifact["counts"]["by_family"].items()
    )
    summary_lines.extend(
        [
            "",
            "## Sparse V6 clauses",
            "",
            "Each line is `input-id: signed semantic atoms`.",
            "",
        ]
    )
    for family, entries in artifact["families"].items():
        if not family.startswith("v6-"):
            continue
        summary_lines.append(f"### `{family}`")
        summary_lines.append("")
        for entry in entries:
            atoms = []
            for literal in entry["decoded"]:
                sign = "+" if literal["positive"] else "-"
                meaning = literal["meaning"]
                atoms.append(
                    f"{sign}{meaning['kind']}({json.dumps({k: v for k, v in meaning.items() if k != 'kind'}, sort_keys=True, separators=(',', ':'))})"
                )
            summary_lines.append(
                f"- `{entry['input_clause_id']}`: " + ", ".join(atoms)
            )
        summary_lines.append("")
    args.summary.write_text("\n".join(summary_lines) + "\n")
    print(args.out)
    print(args.summary)
    print(f"retained_v3_v6_clauses={len(retained_ids)}")
    for name, count in artifact["counts"]["by_family"].items():
        print(f"{name}={count}")


if __name__ == "__main__":
    main()
