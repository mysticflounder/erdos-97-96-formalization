#!/usr/bin/env python3
"""Authenticate and decode the clauses retained by the exact-11 G3 core.

G3 consists of one selector-totality clause followed by a position-wise merge
of the four shell-case CNFs.  A position common to all four inputs is emitted
once.  A differing position is emitted three times, guarded respectively by
the selectors for s2_o9, s3_o0, and s3_o9.

This script reconstructs that merge, checks every reconstructed clause against
the frozen G3 input, restricts it through the authenticated core-to-input map,
and attaches the originating clause family plus manifest atom meanings.  Its
output is an audit/Lean-generation input, not a proof.
"""

from __future__ import annotations

import argparse
import hashlib
import json
from collections import Counter, defaultdict
from pathlib import Path
from typing import Any


ROOT = Path(__file__).resolve().parents[2]
RUNS = ROOT / "scratch/card11-exact5-common-fullradius-v7/runs"
G3 = ROOT / "scratch/card11-exact5-common-fullradius-v7-g3"
INGRESS = (
    ROOT
    / "scratch/card11-exact5-common-fullradius-v7-g3-ingress/g3-ingress"
)
CASES = ("s2_o0", "s2_o9", "s3_o0", "s3_o9")
SELECTED_CASES = ("s2_o9", "s3_o0", "s3_o9")
SELECTORS = {"s2_o9": 49_358, "s3_o0": 49_359, "s3_o9": 49_360}


def sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        for chunk in iter(lambda: stream.read(1 << 20), b""):
            digest.update(chunk)
    return digest.hexdigest()


def read_header(stream, path: Path) -> tuple[int, int]:
    header = stream.readline().decode("ascii").split()
    if len(header) != 4 or header[:2] != ["p", "cnf"]:
        raise ValueError(f"bad DIMACS header in {path}")
    return int(header[2]), int(header[3])


def parse_clause(raw: bytes, path: Path) -> list[int]:
    values = [int(token) for token in raw.split()]
    if not values or values[-1] != 0:
        raise ValueError(f"bad DIMACS clause in {path}: {raw[:80]!r}")
    return values[:-1]


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
            old = result.setdefault(variable, {"kind": kind, **entry})
            if old != {"kind": kind, **entry}:
                raise ValueError(f"inconsistent semantic variable {variable}")
    for center, variable in manifest["used_center_variables"].items():
        variable = int(variable)
        entry = {"kind": "used_center", "center": int(center)}
        old = result.setdefault(variable, entry)
        if old != entry:
            raise ValueError(f"inconsistent used-center variable {variable}")
    for case, variable in SELECTORS.items():
        result[variable] = {"kind": "g3_selector", "case": case}
    return result


def block_map(manifest: dict[str, Any]) -> list[tuple[int, int, str]]:
    return [
        (
            int(block["first_clause_1based"]),
            int(block["last_clause_1based"]),
            block["name"],
        )
        for block in manifest["clause_blocks"]
    ]


def family_at(blocks: list[tuple[int, int, str]], position: int) -> str:
    if position <= 207_969:
        return "inherited-census554-base"
    if position <= 387_856:
        return "inherited-separation"
    if position <= 414_047:
        return "inherited-source-tail"
    for first, last, name in blocks:
        if first <= position <= last:
            return name
    raise ValueError(f"no clause family at original position {position}")


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--out",
        type=Path,
        default=Path(__file__).with_name("g3-retained-semantics.json"),
    )
    parser.add_argument(
        "--summary",
        type=Path,
        default=Path(__file__).with_name("g3-retained-semantics-summary.md"),
    )
    args = parser.parse_args()

    manifests = {
        case: json.loads((RUNS / case / "manifest.json").read_text())
        for case in CASES
    }
    semantic_vars = semantic_variable_map(manifests["s2_o0"])
    blocks = block_map(manifests["s2_o0"])
    core_map_path = INGRESS / "core-to-input-clause-id.json"
    core_map = [int(value) for value in json.loads(core_map_path.read_text())]
    retained = set(core_map)
    input_to_core = {
        input_id: core_index
        for core_index, input_id in enumerate(core_map, start=1)
    }

    case_paths = {case: RUNS / case / "input.cnf" for case in CASES}
    case_streams = {case: path.open("rb") for case, path in case_paths.items()}
    g3_path = G3 / "input.cnf"
    g3_stream = g3_path.open("rb")
    entries: list[dict[str, Any]] = []
    family_counts: Counter[str] = Counter()
    route_counts: Counter[str] = Counter()
    shape_counts: Counter[tuple[str, tuple[str, ...]]] = Counter()
    try:
        case_headers = {
            case: read_header(case_streams[case], case_paths[case])
            for case in CASES
        }
        if len(set(case_headers.values())) != 1:
            raise ValueError(f"case headers differ: {case_headers}")
        g3_header = read_header(g3_stream, g3_path)
        if g3_header != (49_360, 1_370_871):
            raise ValueError(f"unexpected G3 header {g3_header}")

        g3_id = 1
        selector_clause = parse_clause(g3_stream.readline(), g3_path)
        expected_selector = [SELECTORS[case] for case in SELECTED_CASES]
        if selector_clause != expected_selector:
            raise ValueError(
                f"selector clause {selector_clause}, expected {expected_selector}"
            )
        if g3_id in retained:
            entries.append(
                {
                    "g3_input_clause_id": g3_id,
                    "core_clause_index_1based": input_to_core[g3_id],
                    "route": "selector-totality",
                    "family": "g3-selector-totality",
                    "original_position": None,
                    "clause": selector_clause,
                    "decoded": [
                        {
                            "literal": literal,
                            "variable": abs(literal),
                            "positive": literal > 0,
                            "meaning": semantic_vars[abs(literal)],
                        }
                        for literal in selector_clause
                    ],
                }
            )
            family_counts["g3-selector-totality"] += 1
            route_counts["selector-totality"] += 1
        for position in range(1, case_headers["s2_o0"][1] + 1):
            rows = {
                case: parse_clause(case_streams[case].readline(), case_paths[case])
                for case in CASES
            }
            if len({tuple(row) for row in rows.values()}) == 1:
                emitted = [("common", rows["s2_o0"])]
            else:
                emitted = [
                    (
                        case,
                        [-SELECTORS[case], *rows[case]],
                    )
                    for case in SELECTED_CASES
                ]
            for route, expected in emitted:
                g3_id += 1
                actual = parse_clause(g3_stream.readline(), g3_path)
                if actual != expected:
                    raise ValueError(
                        f"G3 mismatch at {g3_id}, original {position}, "
                        f"route {route}: {actual[:12]} != {expected[:12]}"
                    )
                if g3_id not in retained:
                    continue
                family = family_at(blocks, position)
                decoded = []
                shape = []
                for literal in actual:
                    variable = abs(literal)
                    meaning = semantic_vars.get(
                        variable,
                        {
                            "kind": (
                                "inherited"
                                if variable
                                <= int(manifests["s2_o0"]["inherited_variables"])
                                else "unclassified"
                            )
                        },
                    )
                    decoded.append(
                        {
                            "literal": literal,
                            "variable": variable,
                            "positive": literal > 0,
                            "meaning": meaning,
                        }
                    )
                    shape.append(("+" if literal > 0 else "-") + meaning["kind"])
                entries.append(
                    {
                        "g3_input_clause_id": g3_id,
                        "core_clause_index_1based": input_to_core[g3_id],
                        "route": route,
                        "family": family,
                        "original_position": position,
                        "clause": actual,
                        "decoded": decoded,
                    }
                )
                family_counts[family] += 1
                route_counts[route] += 1
                shape_counts[(family, tuple(shape))] += 1
        if g3_id != g3_header[1]:
            raise ValueError(f"reconstructed {g3_id} G3 clauses")
        if g3_stream.readline():
            raise ValueError("trailing G3 clause data")
        for case, stream in case_streams.items():
            if stream.readline():
                raise ValueError(f"trailing case data for {case}")
    finally:
        g3_stream.close()
        for stream in case_streams.values():
            stream.close()

    if len(entries) != len(core_map):
        raise ValueError(
            f"decoded {len(entries)} retained entries, core has {len(core_map)}"
        )

    artifact = {
        "schema": "p97-card11-exact5-v7-g3-retained-semantics-v1",
        "claim_scope": (
            "Authenticated G3 retained-clause reconstruction and manifest "
            "decoding only; not a Lean proof or UNSAT certificate."
        ),
        "inputs": {
            str(path.relative_to(ROOT)): sha256(path)
            for path in [
                g3_path,
                INGRESS / "core.cnf",
                core_map_path,
                *(case_paths[case] for case in CASES),
            ]
        },
        "counts": {
            "retained": len(entries),
            "by_route": dict(sorted(route_counts.items())),
            "by_family": dict(sorted(family_counts.items())),
            "by_shape": [
                {
                    "family": family,
                    "shape": list(shape),
                    "count": count,
                }
                for (family, shape), count in sorted(shape_counts.items())
            ],
        },
        "entries": entries,
    }
    args.out.parent.mkdir(parents=True, exist_ok=True)
    args.out.write_text(json.dumps(artifact, indent=2, sort_keys=True) + "\n")

    lines = [
        "# G3 retained semantic census",
        "",
        "This is an authenticated clause-map audit artifact, not a Lean proof.",
        "",
        f"- retained clauses: `{len(entries)}`",
        f"- semantic shapes: `{len(shape_counts)}`",
        "",
        "## Routes",
        "",
        "| Route | Retained |",
        "|---|---:|",
        *(
            f"| `{route}` | {count} |"
            for route, count in sorted(route_counts.items())
        ),
        "",
        "## Families",
        "",
        "| Family | Retained |",
        "|---|---:|",
        *(
            f"| `{family}` | {count} |"
            for family, count in sorted(family_counts.items())
        ),
        "",
        "## Literal shapes",
        "",
    ]
    for (family, shape), count in sorted(shape_counts.items()):
        lines.append(f"- `{family}` x {count}: `{' '.join(shape)}`")
    lines.append("")
    args.summary.write_text("\n".join(lines))
    print(args.out)
    print(args.summary)
    print(f"retained={len(entries)} shapes={len(shape_counts)}")
    for route, count in sorted(route_counts.items()):
        print(f"route.{route}={count}")
    for family, count in sorted(family_counts.items()):
        print(f"family.{family}={count}")


if __name__ == "__main__":
    main()
