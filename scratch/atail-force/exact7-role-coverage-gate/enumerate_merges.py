#!/usr/bin/env python3
"""Merge-layer enumerator: identification patterns among the fresh roles.

An L0 schema assumes its fresh points pairwise distinct.  Identifying two
of them is a SEPARATE partition case (not a relaxation: the unit-slack
normalization asserts distinctness), so coverage needs every identification
pattern enumerated.  Allowed single merges, from the pinned facts
(ENCODER_FACTS.md):

- extra ~ outside point, same bag (NOT-FOUND-excluded, must be covered);
- outside points of two DIFFERENT rows, same bag (NOT-FOUND-excluded);
- NOT e1~e2 (distinct class members), NOT within one row (pair card 2);
- merges with named points are landing cases, already in L0 (e.g. both
  outside points at O).

Multi-merge patterns: any pattern containing a merge pair whose type dies
in the single-merge census inherits that core (the killing constraints
persist verbatim under further merging).  The only multi patterns built
exclusively from potentially-surviving pair types are the double
b0-row ~ b1-row merges (both points of each pair fused pairwise), which
are enumerated here explicitly.  Triples inside {p0,p1} are impossible
(each pair has two points), and any triple reaching e/p2 contains a dead
pair type — certified by the single-merge census plus this containment
argument, which the audit step must confirm against the actual cores.

Output: merge_schemas.json.
"""

from __future__ import annotations

import json
from itertools import product
from pathlib import Path

from enumerate_l0 import ROWS, build_schema, e_landings, p_landings

HERE = Path(__file__).resolve().parent

E_ROLES = ("e1", "e2")
ROW_ROLES = tuple(fresh for _, _, fresh in ROWS)  # ((p0a,p0b),(p1a,p1b),(p2a,p2b))


def bag_of(schema: dict) -> dict[str, str]:
    bags: dict[str, str] = {}
    for block, label in zip(schema["blocks"], ("EA", "S", "O", "O1", "W", "cap")):
        if label in ("S", "O1"):
            for p in block["points"]:
                bags[p] = label
    return bags


def merge_schema(schema: dict, merges: list[tuple[str, str]], tag: str) -> dict:
    rename: dict[str, str] = {}
    for a, b in merges:
        fused = f"{a}+{b}"
        rename[a] = fused
        rename[b] = fused

    def rn(p: str) -> str:
        return rename.get(p, p)

    points = []
    for p in schema["points"]:
        q = rn(p)
        if q not in points:
            points.append(q)
    point_set = set(points)

    blocks = []
    for block in schema["blocks"]:
        pts = []
        for p in block["points"]:
            q = rn(p)
            if q not in pts:
                pts.append(q)
        blocks.append({"points": pts, "ordered": block["ordered"]})

    exact_classes = []
    for cls in schema["exact_classes"]:
        members = []
        for p in cls["members"]:
            q = rn(p)
            if q not in members:
                members.append(q)
        exact_classes.append(
            {
                "center": rn(cls["center"]),
                "members": members,
                "exclude": sorted(point_set - {rn(cls["center"])} - set(members)),
            }
        )

    unique_class = []
    for spec in schema["unique_class"]:
        members = []
        for p in spec["members"]:
            q = rn(p)
            if q not in members:
                members.append(q)
        unique_class.append({"center": rn(spec["center"]), "members": members})

    return {
        "id": schema["id"] + "." + tag,
        "points": points,
        "blocks": blocks,
        "exact_classes": exact_classes,
        "unique_class": unique_class,
        "timeout_ms": schema["timeout_ms"],
    }


def main() -> None:
    schemas = []
    single_counts: dict[str, int] = {}
    for e_pair in e_landings():
        for row_pairs in product(p_landings(), repeat=len(ROWS)):
            base = build_schema(e_pair, row_pairs)
            bags = bag_of(base)

            def fresh(role: str) -> bool:
                return role in bags

            # single merges: e ~ p (same bag)
            for e in E_ROLES:
                if not fresh(e):
                    continue
                for row_index, roles in enumerate(ROW_ROLES):
                    for p in roles:
                        if fresh(p) and bags[p] == bags[e]:
                            kind = f"e-p{row_index}"
                            single_counts[kind] = single_counts.get(kind, 0) + 1
                            schemas.append(merge_schema(base, [(e, p)], f"m{e}={p}"))

            # single merges: p ~ p across rows (same bag)
            for i in range(len(ROW_ROLES)):
                for j in range(i + 1, len(ROW_ROLES)):
                    for a in ROW_ROLES[i]:
                        for b in ROW_ROLES[j]:
                            if fresh(a) and fresh(b) and bags[a] == bags[b]:
                                kind = f"p{i}-p{j}"
                                single_counts[kind] = single_counts.get(kind, 0) + 1
                                schemas.append(
                                    merge_schema(base, [(a, b)], f"m{a}={b}")
                                )

            # double merges: both p0 points fused with both p1 points
            (a0, b0), (a1, b1) = ROW_ROLES[0], ROW_ROLES[1]
            if all(fresh(r) for r in (a0, b0, a1, b1)):
                for first, second in (((a0, a1), (b0, b1)), ((a0, b1), (b0, a1))):
                    if bags[first[0]] == bags[first[1]] and bags[second[0]] == bags[second[1]]:
                        single_counts["p0-p1-double"] = (
                            single_counts.get("p0-p1-double", 0) + 1
                        )
                        schemas.append(
                            merge_schema(
                                base,
                                [first, second],
                                f"m{first[0]}={first[1]}+m{second[0]}={second[1]}",
                            )
                        )

    ids = [s["id"] for s in schemas]
    assert len(set(ids)) == len(ids)
    output = HERE / "merge_schemas.json"
    output.write_text(json.dumps(schemas, indent=1))
    print(f"schemas={len(schemas)}")
    print(f"by_kind={dict(sorted(single_counts.items()))}")
    print(f"output={output}")


if __name__ == "__main__":
    main()
