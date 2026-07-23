#!/usr/bin/env python3
"""Rerun the no-four-arc overlay with the proved own-cap row bounds.

The added clauses are the literal finite form of
`CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two` at
each carrier center and each displayed closed cap containing that center,
together with the sharper endpoint-cardinality-one forms at both endpoints.
The result remains a fixed n=11 projection, not a Euclidean realization or a
Lean proof.
"""

from __future__ import annotations

import argparse
import importlib.util
import itertools
import json
import sys
from pathlib import Path
from typing import Any


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
DIRECT_PATH = (
    HERE.parent / "unique4-curvature-direct-overlay" / "direct_curvature_overlay.py"
)


def load_module(name: str, path: Path) -> Any:
    spec = importlib.util.spec_from_file_location(name, path)
    if spec is None or spec.loader is None:
        raise RuntimeError(path)
    module = importlib.util.module_from_spec(spec)
    sys.modules[name] = module
    spec.loader.exec_module(module)
    return module


DIRECT = load_module("unique4_star_producer_direct_overlay", DIRECT_PATH)


def add_own_cap_bounds(cnf: Any, metadata: dict[str, Any]) -> dict[str, int]:
    interior_count = 0
    endpoint_count = 0
    named_caps = metadata["closed_caps"]
    endpoints = {
        "surplus": (int(metadata["first_apex"]), int(metadata["second_apex"])),
        "first_opposite": (
            int(metadata["second_apex"]), int(metadata["surplus_vertex"])
        ),
        "second_opposite": (
            int(metadata["surplus_vertex"]), int(metadata["first_apex"])
        ),
    }
    for cap_index, (cap_name, cap_data) in enumerate(named_caps.items()):
        cap = tuple(sorted(map(int, cap_data)))
        for center in cap:
            targets = tuple(point for point in cap if point != center)
            for triple in itertools.combinations(targets, 3):
                cnf.add(
                    f"selected_row_own_cap_at_most_two_{cap_index}",
                    [-cnf.ids[f"m_{center}_{point}"] for point in triple],
                )
                interior_count += 1
        for center in endpoints[cap_name]:
            targets = tuple(point for point in cap if point != center)
            for pair in itertools.combinations(targets, 2):
                cnf.add(
                    f"selected_row_endpoint_own_cap_at_most_one_{cap_index}",
                    [-cnf.ids[f"m_{center}_{point}"] for point in pair],
                )
                endpoint_count += 1
    return {
        "own_cap_at_most_two_clause_count": interior_count,
        "endpoint_own_cap_at_most_one_clause_count": endpoint_count,
    }


def assert_own_cap_bounds(decoded: dict[str, Any], metadata: dict[str, Any]) -> None:
    rows = {
        int(center): set(map(int, support))
        for center, support in decoded["rows"].items()
    }
    endpoints = {
        "surplus": {int(metadata["first_apex"]), int(metadata["second_apex"])},
        "first_opposite": {
            int(metadata["second_apex"]), int(metadata["surplus_vertex"])
        },
        "second_opposite": {
            int(metadata["surplus_vertex"]), int(metadata["first_apex"])
        },
    }
    for cap_name, cap_data in metadata["closed_caps"].items():
        cap = set(map(int, cap_data))
        for center in cap:
            hits = rows[center] & cap
            if len(hits) > 2:
                raise AssertionError(("own-cap-at-most-two", cap_name, center, hits))
            if center in endpoints[cap_name] and len(hits) > 1:
                raise AssertionError(("endpoint-own-cap-at-most-one", cap_name, center, hits))


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--opp1-card", required=True, type=int, choices=(4, 5))
    parser.add_argument("--cnf", required=True, type=Path)
    parser.add_argument("--result", required=True, type=Path)
    parser.add_argument("--solver-log", required=True, type=Path)
    parser.add_argument("--timeout-seconds", type=int, default=1800)
    args = parser.parse_args()

    n = 11
    cnf, metadata = DIRECT.OUTER.encode(
        n,
        args.opp1_card,
        DIRECT.PLANAR_BANK,
        DIRECT.KALMANSON_BANK,
        DIRECT.U5_BANK,
        strict_cap_minimality_overlay=True,
        pair_minimality_overlay=False,
        exact_two_strict_hit_overlay=True,
    )
    own_cap_counts = add_own_cap_bounds(cnf, metadata)
    overlay = DIRECT.add_direct_curvature_overlay(cnf, n)
    metadata = {
        **metadata,
        "schema": "p97-unique4-direct-curvature-own-cap-overlay-v1",
        "runner_source": str(Path(__file__).resolve().relative_to(ROOT.resolve())),
        "runner_source_sha256": DIRECT.sha256(Path(__file__).resolve()),
        "claim_scope": (
            "fixed n=11 source projection with displayed-cap selected-row own-cap "
            "bounds; not a Euclidean realization or arbitrary-cardinality theorem"
        ),
        "own_cap_source_theorem": (
            "Problem97.CapSelectedRowCounting."
            "selectedFourClass_inter_capByIndex_card_le_two"
        ),
        "endpoint_own_cap_source_theorems": [
            "Problem97.CapSelectedRowCounting."
            "selectedFourClass_inter_orderedCap_first_card_le_one",
            "Problem97.CapSelectedRowCounting."
            "selectedFourClass_inter_orderedCap_last_card_le_one",
        ],
        **own_cap_counts,
        **overlay,
    }
    args.cnf.parent.mkdir(parents=True, exist_ok=True)
    cnf.write_dimacs(args.cnf, metadata)
    status, log = DIRECT.solve(
        args.cnf, args.timeout_seconds, "cadical", None
    )
    args.solver_log.parent.mkdir(parents=True, exist_ok=True)
    args.solver_log.write_text(log, encoding="utf-8")
    result: dict[str, Any] = {
        **metadata,
        "solver_status": status,
        "cnf": str(args.cnf),
        "cnf_sha256": DIRECT.sha256(args.cnf),
        "solver_log": str(args.solver_log),
        "solver_log_sha256": DIRECT.sha256(args.solver_log),
    }
    if status == "SAT":
        assignment = DIRECT.parse_solver_assignment(log)
        decoded = DIRECT.OUTER.decode_sat(cnf, assignment, metadata)
        DIRECT.assert_sat_projection_has_no_terminal(decoded, n)
        assert_own_cap_bounds(decoded, metadata)
        result["semantic_replay_status"] = (
            "VERIFIED_SAT_NO_FOUR_ARC_TERMINAL_WITH_OWN_CAP_BOUNDS"
        )
        result["decoded"] = decoded
    args.result.parent.mkdir(parents=True, exist_ok=True)
    args.result.write_text(json.dumps(result, indent=2, sort_keys=True) + "\n")
    print(
        json.dumps(
            {
                "solver_status": status,
                **own_cap_counts,
                **overlay,
            },
            sort_keys=True,
        )
    )


if __name__ == "__main__":
    main()
