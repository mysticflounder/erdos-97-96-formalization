#!/usr/bin/env python3
"""Replay the direct-schema avoider against the robust collision and ordinal closure."""

from __future__ import annotations

import hashlib
import importlib.util
import itertools
import json
from collections import defaultdict
from pathlib import Path
from typing import Any


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
CHECKPOINT = (
    ROOT
    / "scratch/atail-force/kalmanson-bank-cegar/direct_schema_coverage_checkpoint.json"
)
ORDINAL_AUDIT = (
    ROOT / "scratch/atail-force/robust-second-apex-bank-audit/audit.py"
)
ROBUST_SEARCH = ROOT / "scratch/atail-force/robust-all-center-cegar/search.py"

EXPECTED_CHECKPOINT_SHA256 = (
    "f3d36762c63be39b77aaaae2d2de34199eeffca4cbc5cdad8e919e8f444d182a"
)
EXPECTED_ROWS_SHA256 = (
    "946943a5b4f16f2649ed5802dbc48419c3a3a19c81d77576719c981198dc445e"
)
EXPECTED_BLOCKERS_SHA256 = (
    "b210bdbe92a5e3eddd89ed552507d8b15f78461b55856b903384940fe59beafe"
)

CAPS = (
    frozenset(("O", "t1", "I", "F", "A")),
    frozenset(("A", "X", "Y", "Z", "D", "J", "E", "C")),
    frozenset(("C", "G", "K", "O")),
)


def load_module(path: Path, name: str) -> Any:
    spec = importlib.util.spec_from_file_location(name, path)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot import {path}")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def canonical_sha256(value: object) -> str:
    return hashlib.sha256(
        json.dumps(value, sort_keys=True, separators=(",", ":")).encode()
    ).hexdigest()


def minimal_cycle_cores(
    ordinal: Any,
    hull_order: tuple[str, ...],
    rows: tuple[tuple[str, frozenset[str]], ...],
) -> list[dict[str, object]]:
    """Return all inclusion-minimal row subsets having an ordinal cycle."""

    cyclic_subsets: list[frozenset[str]] = []
    results = []
    for size in range(1, len(rows) + 1):
        for indices in itertools.combinations(range(len(rows)), size):
            names = frozenset(rows[index][0] for index in indices)
            if any(core <= names for core in cyclic_subsets):
                continue
            selected = tuple(rows[index] for index in indices)
            cycle_length = ordinal.shortest_cycle_length(hull_order, selected)
            if cycle_length is None:
                continue
            cyclic_subsets.append(names)
            results.append(
                {
                    "centers": sorted(names, key=hull_order.index),
                    "cycle_length": cycle_length,
                }
            )
    return results


def main() -> int:
    checkpoint_bytes = CHECKPOINT.read_bytes()
    if hashlib.sha256(checkpoint_bytes).hexdigest() != EXPECTED_CHECKPOINT_SHA256:
        raise SystemExit("direct-schema checkpoint hash drift")
    state = json.loads(checkpoint_bytes)
    if state["status"] != "SAT_DIRECT_SCHEMA_AVOIDING_CORRECTED_SHADOW":
        raise SystemExit("direct-schema checkpoint status drift")
    witness = state["last_event"]
    if canonical_sha256(witness["rows"]) != EXPECTED_ROWS_SHA256:
        raise SystemExit("terminal row hash drift")
    if canonical_sha256(witness["blockers"]) != EXPECTED_BLOCKERS_SHA256:
        raise SystemExit("terminal blocker hash drift")

    ordinal = load_module(ORDINAL_AUDIT, "robust_collision_ordinal_audit")
    robust = load_module(ROBUST_SEARCH, "robust_collision_surface")
    hull_order = tuple(robust.HULL_NAMES)
    rows = {
        str(row["center"]): frozenset(map(str, row["support"]))
        for row in witness["rows"]
    }
    blockers = {str(s): str(c) for s, c in witness["blockers"].items()}
    fibers: dict[str, list[str]] = defaultdict(list)
    for source, center in blockers.items():
        fibers[center].append(source)

    collisions = []
    for center, sources in sorted(fibers.items()):
        if len(sources) < 2:
            continue
        support = rows[center]
        sources_in_support = sorted(set(sources) & support)
        cap_projections = []
        for cap_index, cap in enumerate(CAPS):
            if center not in cap:
                continue
            outside = sorted(support - cap)
            cap_projections.append(
                {
                    "cap_index": cap_index,
                    "outside_support": outside,
                    "outside_card": len(outside),
                    "meets_live_cap_bound": len(support & cap) <= 2,
                }
            )
        collisions.append(
            {
                "center": center,
                "sources": sorted(sources),
                "support": sorted(support),
                "support_card": len(support),
                "all_sources_in_support": set(sources) <= support,
                "sources_in_support": sources_in_support,
                "cap_projections": cap_projections,
                "has_live_outside_pair_projection": any(
                    projection["outside_card"] >= 2
                    for projection in cap_projections
                ),
            }
        )

    ambient_first_apex = ("O", frozenset(robust.FIRST_APEX_CLASS))
    exact_centers = set(blockers.values())
    exact_rows = tuple(
        (center, rows[center]) for center in hull_order if center in exact_centers
    )
    collision_centers = {
        center for center, sources in fibers.items() if len(sources) >= 2
    }
    collision_rows = tuple(
        (center, rows[center])
        for center in hull_order
        if center in collision_centers
    )
    all_rows_without_stored_o = tuple(
        (center, rows[center]) for center in hull_order if center != "O"
    )
    all_rows_with_ambient_o = (ambient_first_apex, *all_rows_without_stored_o)
    all_stored_rows = tuple((center, rows[center]) for center in hull_order)

    collision_row_audits = {
        center: {
            "row_alone": ordinal.shortest_cycle_length(
                hull_order, ((center, rows[center]),)
            ),
            "row_plus_ambient_first_apex": ordinal.shortest_cycle_length(
                hull_order, (ambient_first_apex, (center, rows[center]))
            ),
        }
        for center in sorted(fibers)
        if len(fibers[center]) >= 2
    }

    result = {
        "checkpoint_sha256": EXPECTED_CHECKPOINT_SHA256,
        "status": state["status"],
        "robust_apex": "O",
        "robust_apex_omitted_from_blocker_image": "O" not in exact_centers,
        "collision_count": len(collisions),
        "collisions": collisions,
        "collision_row_ordinal_audits": collision_row_audits,
        "exact_collision_rows_plus_ambient_first_apex_cycle_length": (
            ordinal.shortest_cycle_length(
                hull_order, (ambient_first_apex, *exact_rows)
            )
        ),
        "collision_rows_plus_ambient_first_apex_cycle_length": (
            ordinal.shortest_cycle_length(
                hull_order, (ambient_first_apex, *collision_rows)
            )
        ),
        "minimal_exact_row_cycle_cores": minimal_cycle_cores(
            ordinal, hull_order, (ambient_first_apex, *exact_rows)
        ),
        "minimal_collision_row_cycle_cores": minimal_cycle_cores(
            ordinal, hull_order, (ambient_first_apex, *collision_rows)
        ),
        "all_stored_rows_cycle_length": ordinal.shortest_cycle_length(
            hull_order, all_stored_rows
        ),
        "all_rows_plus_ambient_first_apex_cycle_length": (
            ordinal.shortest_cycle_length(hull_order, all_rows_with_ambient_o)
        ),
        "epistemic_status": (
            "EXACT_REPLAY_WITHIN_PINNED_FIXED_PROFILE_SHADOW; "
            "NOT_A_LIVE_PARENT_EXTRACTION"
        ),
    }
    print(json.dumps(result, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
