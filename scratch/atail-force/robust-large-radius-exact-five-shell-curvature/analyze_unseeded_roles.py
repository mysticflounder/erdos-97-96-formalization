#!/usr/bin/env python3
"""Extract the exact row roles used by the unseeded ordinal DFS frontier."""

from __future__ import annotations

import importlib.util
import json
import sys
from collections import Counter
from pathlib import Path


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
DIRECT = ROOT / "scratch/atail-force/kalmanson-linear-closure/direct_avoider.py"

if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))


def load_module(path: Path, name: str):
    spec = importlib.util.spec_from_file_location(name, path)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot import {path}")
    module = importlib.util.module_from_spec(spec)
    sys.modules[name] = module
    spec.loader.exec_module(module)
    return module


direct = load_module(DIRECT, "p97_owned_unseeded_direct")
robust = direct.bank.robust
shadow = direct.bank.shadow
audit = direct.audit


def named_row(surface, row):
    return {
        "center": surface.by_label[row.center],
        "support": sorted(surface.by_label[point] for point in row.support),
    }


def selected_actual_rows(surface, ambient, rows):
    o = surface.by_name[robust.FIRST_APEX]
    return [named_row(surface, ambient), *(
        named_row(surface, row) for row in rows if row.center != o
    )]


def pair_bound_ok(rows):
    centers_by_pair: dict[tuple[int, int], set[int]] = {}
    for row in rows:
        support = sorted(row.support)
        for left_index, left in enumerate(support):
            for right in support[left_index + 1 :]:
                centers_by_pair.setdefault((left, right), set()).add(row.center)
    return all(len(centers) <= 2 for centers in centers_by_pair.values())


def pairwise_compatible(frame, rows):
    for left_index, left in enumerate(rows):
        for right in rows[left_index + 1 :]:
            if not shadow.rows_compatible(frame, left, right):
                return False
    return True


def main() -> None:
    surface = robust.Surface()
    ambient = surface.ambient_first_apex_row()
    o = surface.by_name[robust.FIRST_APEX]
    q = surface.by_name[robust.Q]
    w = surface.by_name[robust.W]
    fixed = []
    variable = {}
    for center in range(surface.frame.n):
        name = surface.by_label[center]
        if name in robust.FIXED_LOCAL_ROWS:
            fixed.append(
                shadow.ClassRow(
                    f"global:{center}", center, surface.candidates[center][0], False
                )
            )
            continue
        candidates = tuple(
            support
            for support in surface.candidates[center]
            if robust.mc.candidate_ok(
                surface.frame, set(robust.mc.PROVEN_ROWS), center, support
            )
            and (
                name not in robust.ROBUST_SUPPORT_CENTERS
                or not ({q, w} <= set(support))
            )
            and shadow.rows_compatible(
                surface.frame,
                ambient,
                shadow.ClassRow(f"candidate:{center}", center, support, False),
            )
        )
        variable[name] = tuple(
            shadow.ClassRow(f"global:{center}", center, support, False)
            for support in candidates
        )

    fixed_ordinal = audit.ordinal_audit(
        selected_actual_rows(surface, ambient, fixed),
        audit.HULL_ORDER,
    )
    c_survivors = []
    c_rejected = []
    for row_c in variable["C"]:
        rows = (*fixed, row_c)
        if not pairwise_compatible(surface.frame, rows) or not pair_bound_ok(rows):
            continue
        ordinal = audit.ordinal_audit(
            selected_actual_rows(surface, ambient, rows), audit.HULL_ORDER
        )
        record = {"row": named_row(surface, row_c), "ordinal": ordinal}
        if ordinal["status"] == "ORDINAL_SAT_NO_STRICT_CYCLE":
            c_survivors.append((row_c, record))
        else:
            c_rejected.append(record)

    x_rejections = []
    for row_x in variable["X"]:
        rows = (*fixed, row_x)
        if not pairwise_compatible(surface.frame, rows) or not pair_bound_ok(rows):
            continue
        ordinal = audit.ordinal_audit(
            selected_actual_rows(surface, ambient, rows), audit.HULL_ORDER
        )
        if ordinal["status"] != "ORDINAL_UNSAT_STRICT_CYCLE":
            raise RuntimeError(f"ordinal X survivor: {named_row(surface, row_x)}")
        x_rejections.append(
            {
                "X": named_row(surface, row_x),
                "required_row_centers": ordinal["required_row_centers"],
                "minimal_row_core": ordinal["minimal_row_core"],
                "cycle": ordinal["cycle"],
            }
        )

    center_sets = Counter(
        tuple(record["required_row_centers"]) for record in x_rejections
    )
    minimal_center_sets = Counter(
        tuple(sorted(row["center"] for row in record["minimal_row_core"]))
        for record in x_rejections
    )
    examples_by_minimal_centers = {}
    for record in x_rejections:
        key = ",".join(
            sorted(row["center"] for row in record["minimal_row_core"])
        )
        examples_by_minimal_centers.setdefault(key, record)
    output = {
        "fixed_rows": [named_row(surface, row) for row in fixed],
        "ambient_row": named_row(surface, ambient),
        "selected_O_row_removed_from_ordinal_predicate": True,
        "fixed_only_ordinal_status": fixed_ordinal["status"],
        "C_candidate_count_before_structural_filter": len(variable["C"]),
        "C_ordinal_survivors": len(c_survivors),
        "C_ordinal_rejections": len(c_rejected),
        "structurally_compatible_X_prefixes": len(x_rejections),
        "X_ordinal_survivors": 0,
        "required_row_center_sets": {
            ",".join(centers): count for centers, count in sorted(center_sets.items())
        },
        "minimal_row_core_center_sets": {
            ",".join(centers): count
            for centers, count in sorted(minimal_center_sets.items())
        },
        "examples_by_minimal_row_core_center_set": examples_by_minimal_centers,
    }
    print(json.dumps(output, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
