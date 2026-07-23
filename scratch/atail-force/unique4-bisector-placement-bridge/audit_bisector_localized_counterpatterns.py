#!/usr/bin/env python3
"""Replay no-packing counterpatterns after adding strict-pair localization."""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import json
from pathlib import Path
from types import ModuleType
from typing import Any


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
SOURCE_DIR = HERE.parent / "unique4-three-row-placement-source-audit"
SEARCH_SCRIPT = SOURCE_DIR / "search_arc_packing_critical_map.py"


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def load_search() -> ModuleType:
    spec = importlib.util.spec_from_file_location("critical_map_search", SEARCH_SCRIPT)
    if spec is None or spec.loader is None:
        raise RuntimeError(SEARCH_SCRIPT)
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def audit_profile(profile: int, search: ModuleType) -> dict[str, Any]:
    source = SOURCE_DIR / f"critical_map_profile{profile}.json"
    payload = json.loads(source.read_text())
    search.validate_sat_counterpattern(payload)
    n = int(payload["n"])
    second_apex = 4
    surplus_vertex = 4 + (profile - 2) + 1
    strict_cap = set(range(second_apex + 1, surplus_vertex))
    first_support = set(map(int, payload["rows"][0]["support"]))
    strict_pair = first_support & strict_cap
    if len(strict_pair) != 2:
        raise AssertionError("first-apex class does not have exactly two strict hits")
    pair_hit_centers = [
        int(row["center"])
        for row in payload["rows"]
        if strict_pair <= set(map(int, row["support"]))
    ]
    nonfirst_pair_hit_centers = [center for center in pair_hit_centers if center != 0]
    outside_strict = [
        center for center in nonfirst_pair_hit_centers if center not in strict_cap
    ]
    if outside_strict:
        raise AssertionError(
            f"bisector localization fails at centers {outside_strict}"
        )
    return {
        "profile": profile,
        "source": str(source.relative_to(ROOT)),
        "source_sha256": sha256(source),
        "source_status": payload["status"],
        "strict_cap": sorted(strict_cap),
        "strict_pair": sorted(strict_pair),
        "pair_hit_centers": pair_hit_centers,
        "nonfirst_pair_hit_centers": nonfirst_pair_hit_centers,
        "bisector_localization_holds": True,
        "four_arc_packing_absent": True,
        "three_row_middle_arc_placement_absent": True,
        "placement_reason": (
            "ThreeRowMiddleArcPlacement maps to four disjoint turn arcs, "
            "while the independently replayed source model has no such packing"
        ),
    }


def build_report() -> dict[str, Any]:
    search = load_search()
    profiles = [audit_profile(profile, search) for profile in (4, 5)]
    return {
        "epistemic_status": (
            "EXACT_FINITE_COUNTERPATTERN_TO_SELECTED_ROW_PLUS_BISECTOR_LOCALIZATION"
        ),
        "scope_warning": (
            "n=11 selected-row abstraction only; not Euclidean realizability, "
            "MEC/noM44, complete radius partitions, or arbitrary-cardinality coverage"
        ),
        "search_script": str(SEARCH_SCRIPT.relative_to(ROOT)),
        "search_script_sha256": sha256(SEARCH_SCRIPT),
        "profiles": profiles,
        "conclusion": (
            "Strict-pair bisector localization does not force any of the three "
            "ThreeRowMiddleArcPlacement gaps in either exact-two profile"
        ),
    }


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--output", type=Path, default=HERE / "bisector_regression.json")
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    rendered = json.dumps(build_report(), indent=2, sort_keys=True) + "\n"
    if args.check:
        if not args.output.exists() or args.output.read_text() != rendered:
            raise SystemExit("bisector regression artifact is stale")
        print("PASS: bisector-localized no-packing counterpatterns replay exactly")
        return
    args.output.write_text(rendered)
    print(rendered, end="")


if __name__ == "__main__":
    main()
