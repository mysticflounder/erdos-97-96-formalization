#!/usr/bin/env python3
"""Replay the fixed-shadow motif comparisons used by the uniform-core audit."""

from __future__ import annotations

import argparse
import importlib.util
import itertools
import json
from pathlib import Path


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
SHADOWS = ROOT / "scratch/atail-force/global_count_boundary/shadows.json"
SINGULAR_DRIVER = (
    ROOT / "scratch/atail-force/critical-map-geometry/singular_row_core.py"
)

FRESH_ROWS = {
    0: (1, 3, 4, 5),
    1: (0, 2, 5, 6),
    2: (4, 6, 9, 11),
    3: (2, 4, 7, 10),
    4: (1, 5, 7, 11),
    5: (0, 1, 9, 10),
    6: (5, 8, 10, 11),
    7: (0, 3, 6, 11),
    8: (0, 3, 7, 9),
    9: (0, 4, 8, 10),
    10: (1, 6, 7, 8),
    11: (2, 3, 8, 9),
}

# Relative to three canonical equations per center in CORE_CENTERS.
CORE_CENTERS = (0, 4, 5, 8, 9, 11)
CORE_EQUATION_INDICES = (0, 1, 2, 3, 5, 6, 7, 9, 11, 12, 13, 15, 16, 17)


def require(condition: bool, message: str) -> None:
    if not condition:
        raise AssertionError(message)


def load_singular_driver():
    spec = importlib.util.spec_from_file_location("atail_singular_row_core", SINGULAR_DRIVER)
    require(spec is not None and spec.loader is not None, "cannot load Singular driver")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def eleven_equality_hits(rows: dict[int, set[int]], limit: int = 20):
    roles = "ABCDEFG"
    required = {
        "B": ("E", "F", "G"),
        "C": ("E", "A", "D"),
        "A": ("G", "B"),
        "D": ("E", "B", "A"),
        "F": ("C", "A", "G"),
        "G": ("E", "C", "D"),
    }
    hits = []
    for values in itertools.permutations(range(12), len(roles)):
        role = dict(zip(roles, values, strict=True))
        if all(
            all(role[member] in rows[role[center]] for member in members)
            for center, members in required.items()
        ):
            hits.append(values)
            if len(hits) >= limit:
                break
    return hits


def fourteen_equality_hits(rows: dict[int, set[int]], limit: int = 20):
    """Find the dangerous-anchored P,C,Q,X,Y,Z,B,A,U motif."""

    hits = []
    labels = range(12)
    for p, c, q, x, y, z in itertools.permutations(labels, 6):
        if c not in rows[p] or q not in rows[p]:
            continue
        if q not in rows[c] or z not in rows[c]:
            continue
        if p not in rows[q] or y not in rows[q]:
            continue
        if p not in rows[x] or y not in rows[x]:
            continue
        if p not in rows[y] or c not in rows[y] or x not in rows[y]:
            continue
        if x not in rows[z] or y not in rows[z]:
            continue
        used = {p, c, q, x, y, z}
        b_values = (rows[p] & rows[c] & rows[q]) - used
        a_values = (rows[p] & rows[x] & rows[z]) - used
        for b in b_values:
            for a in a_values - {b}:
                for u in rows[z] - used - {a, b}:
                    hits.append((p, c, q, x, y, z, b, a, u))
                    if len(hits) >= limit:
                        return hits
    return hits


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()

    document = json.loads(SHADOWS.read_text(encoding="utf-8"))
    historical = {
        case["name"]: {int(center): set(support) for center, support in case["rows"].items()}
        for case in document["cases"]
    }
    systems = historical | {"fresh-card12-profile-4-5-6": {
        center: set(support) for center, support in FRESH_ROWS.items()
    }}
    motif_counts = {
        name: {
            "old_eleven_equality": len(eleven_equality_hits(rows)),
            "fresh_fourteen_equality": len(fourteen_equality_hits(rows)),
        }
        for name, rows in systems.items()
    }

    singular = load_singular_driver()
    all_equations = singular.row_equations(FRESH_ROWS, CORE_CENTERS)
    core_equations = [all_equations[index] for index in CORE_EQUATION_INDICES]
    exact = singular.run_singular(
        core_equations, characteristic=0, timeout_seconds=30,
    )
    deletions = []
    for omitted in CORE_EQUATION_INDICES:
        trial = [
            all_equations[index]
            for index in CORE_EQUATION_INDICES
            if index != omitted
        ]
        result = singular.run_singular(
            trial, characteristic=0, timeout_seconds=10,
        )
        deletions.append({
            "omitted_equation_index": omitted,
            "status": result["status"],
            "dimension": result.get("dimension"),
            "basis_size": result.get("basis_size"),
        })

    result = {
        "scope": "fixed finite selected-row shadows; not a uniform producer theorem",
        "motif_counts": motif_counts,
        "fresh_core": {
            "centers": list(CORE_CENTERS),
            "equation_indices": list(CORE_EQUATION_INDICES),
            "characteristic_zero_status": exact["status"],
            "single_deletion_checks": deletions,
        },
    }
    if args.check:
        require(
            motif_counts["card12-profile-5-5-5"] == {
                "old_eleven_equality": 1,
                "fresh_fourteen_equality": 0,
            },
            "historical (5,5,5) motif count drift",
        )
        require(
            motif_counts["card12-profile-4-5-6"] == {
                "old_eleven_equality": 0,
                "fresh_fourteen_equality": 0,
            },
            "historical (4,5,6) motif count drift",
        )
        require(
            motif_counts["fresh-card12-profile-4-5-6"] == {
                "old_eleven_equality": 0,
                "fresh_fourteen_equality": 1,
            },
            "fresh (4,5,6) motif count drift",
        )
        require(exact["status"] == "UNIT", "fresh core is no longer UNIT over QQ")
        require(
            all(item["status"] == "NONUNIT" for item in deletions),
            "fresh core is no longer deletion-irredundant",
        )
    print(json.dumps(result, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
