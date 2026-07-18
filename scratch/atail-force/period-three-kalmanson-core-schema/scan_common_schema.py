#!/usr/bin/env python3
"""Exhaust the current 10,368 fixed representatives for their smallest core.

The current representative quotient fixes several identities between the
first-apex rows and the independent physical exact-five row.  This scanner
checks whether those fixed rows already give two centers equidistant from one
nonalternating target pair.  Such a pair is an immediate one-Kalmanson
contradiction; reverse rows, triangle inequalities, exactness exclusions, and
the period-three structure are then irrelevant.

The conclusion is exact for the serialized/current six representatives and
1,728 generated forward orders.  It is intentionally *not* a source-coverage
claim: the cross-surface identities are not forced by the live packet.
"""

from __future__ import annotations

import importlib.util
import json
from collections import Counter
from itertools import combinations
from pathlib import Path


ROOT = Path(__file__).resolve().parents[3]
SOURCE = ROOT / "scratch/atail-force/period-three-first-apex-kalmanson/decide_quotient.py"


def load_source():
    spec = importlib.util.spec_from_file_location("period3_decide_quotient", SOURCE)
    assert spec is not None and spec.loader is not None
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


Q = load_source()


class UnionFind:
    def __init__(self):
        self.parent = {}

    def find(self, x):
        self.parent.setdefault(x, x)
        if self.parent[x] != x:
            self.parent[x] = self.find(self.parent[x])
        return self.parent[x]

    def union(self, x, y):
        x, y = self.find(x), self.find(y)
        if x != y:
            self.parent[y] = x


def row_equalities(uf: UnionFind, center: int, support: frozenset[int]) -> None:
    members = sorted(support)
    for x in members[1:]:
        uf.union((center, members[0]), (center, x))


def is_alternating(boundary: tuple[int, ...], p: int, q: int, x: int, y: int) -> bool:
    """Whether chords pq and xy have alternating endpoints in cyclic order."""
    pos = {v: i for i, v in enumerate(boundary)}
    n = len(boundary)
    px = (pos[x] - pos[p]) % n
    pq = (pos[q] - pos[p]) % n
    py = (pos[y] - pos[p]) % n
    return (px < pq < py) or (py < pq < px)


def find_core(boundary: tuple[int, ...], arm: str, role: str):
    _q, _w, t0, t1, _first_classes = Q.cell(arm, role)
    uf = UnionFind()
    row_equalities(uf, Q.first_apex, t0)
    row_equalities(uf, Q.first_apex, t1)
    row_equalities(uf, Q.second_apex, Q.physical_exact_five)

    for x, y in combinations(Q.A, 2):
        if {x, y} & {Q.first_apex, Q.second_apex}:
            continue
        first_equal = uf.find((Q.first_apex, x)) == uf.find((Q.first_apex, y))
        second_equal = uf.find((Q.second_apex, x)) == uf.find((Q.second_apex, y))
        if first_equal and second_equal and not is_alternating(
            boundary, Q.first_apex, Q.second_apex, x, y
        ):
            positions = {point: i for i, point in enumerate(boundary)}
            late = positions[Q.first_apex] < positions[Q.second_apex] < positions[x] < positions[y]
            if not late:
                x, y = y, x
                late = positions[Q.first_apex] < positions[Q.second_apex] < positions[x] < positions[y]
            return {
                "owners": [Q.first_apex, Q.second_apex],
                "targets": [x, y],
                "late_pair_order": late,
                "first_path_kind": (
                    "single_T0"
                    if {x, y} <= t0
                    else "single_T1"
                    if {x, y} <= t1
                    else "T0_T1_overlap_chain"
                ),
                "second_path_kind": "physical_exact_five",
                "semantic_farkas_core": [
                    f"K2({Q.first_apex},{Q.second_apex},{x},{y})",
                    f"d({Q.first_apex},{x})=d({Q.first_apex},{y})",
                    f"d({Q.second_apex},{x})=d({Q.second_apex},{y})",
                ],
            }
    return None


def main() -> None:
    orders = list(Q.compatible_orders())
    counts = Counter()
    examples = {}
    missing = []
    checked = 0
    reflected_checked = 0
    reflected_missing = []
    for boundary in orders:
        for arm in ("eq", "neq"):
            for role in ("II", "IO", "OI"):
                checked += 1
                core = find_core(boundary, arm, role)
                if core is None:
                    missing.append({"boundary": list(boundary), "arm": arm, "role": role})
                    continue
                key = (arm, role, tuple(core["targets"]), core["first_path_kind"])
                counts[key] += 1
                examples.setdefault(key, {"boundary": list(boundary), **core})
                reflected = (boundary[0], *reversed(boundary[1:]))
                reflected_checked += 1
                reflected_core = find_core(reflected, arm, role)
                if reflected_core is None:
                    reflected_missing.append(
                        {"boundary": list(reflected), "arm": arm, "role": role}
                    )

    records = []
    for key, count in sorted(counts.items()):
        arm, role, targets, path_kind = key
        records.append(
            {
                "arm": arm,
                "role": role,
                "targets": list(targets),
                "first_path_kind": path_kind,
                "cells": count,
                "example": examples[key],
            }
        )
    payload = {
        "status": "ALL_CURRENT_FIXED_REPRESENTATIVES_HAVE_ONE_KALMANSON_CORE"
        if not missing and not reflected_missing
        else "MISSING_CORE",
        "generated_forward_orders": len(orders),
        "representatives_per_order": 6,
        "checked_cells": checked,
        "missing_cells": missing,
        "reflected_fixed_cells_checked": reflected_checked,
        "reflected_missing_cells": reflected_missing,
        "schemas": records,
        "live_source_coverage": False,
        "live_source_gap": (
            "The fixed identities between T0/T1 roles and the independent "
            "physical exact-five roles are possible representatives, not "
            "source consequences or a proved symmetry quotient."
        ),
    }
    output = Path(__file__).with_name("common_schema_census.json")
    output.write_text(json.dumps(payload, indent=2, sort_keys=True) + "\n")
    print(json.dumps({k: payload[k] for k in (
        "status", "generated_forward_orders", "checked_cells"
    )}, sort_keys=True))
    for record in records:
        print(json.dumps({k: record[k] for k in (
            "arm", "role", "targets", "first_path_kind", "cells"
        )}, sort_keys=True))
    if missing or reflected_missing:
        raise SystemExit(1)


if __name__ == "__main__":
    main()
