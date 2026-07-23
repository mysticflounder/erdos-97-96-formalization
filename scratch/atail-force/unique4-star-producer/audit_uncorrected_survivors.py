#!/usr/bin/env python3
"""Replay the precise ordered-cap violations in static overlay survivors."""

from __future__ import annotations

import argparse
import json
from pathlib import Path
from typing import Any


def violations(artifact: dict[str, Any]) -> list[dict[str, Any]]:
    rows = {
        int(center): set(map(int, support))
        for center, support in artifact["decoded"]["rows"].items()
    }
    endpoints = {
        "surplus": {int(artifact["first_apex"]), int(artifact["second_apex"])},
        "first_opposite": {
            int(artifact["second_apex"]), int(artifact["surplus_vertex"])
        },
        "second_opposite": {
            int(artifact["surplus_vertex"]), int(artifact["first_apex"])
        },
    }
    answer: list[dict[str, Any]] = []
    for cap_name, cap_data in artifact["closed_caps"].items():
        cap = set(map(int, cap_data))
        for center in sorted(cap):
            hits = rows[center] & cap
            if len(hits) > 2:
                answer.append(
                    {
                        "kind": "selected-row-interior-own-cap-bound",
                        "source_theorem": (
                            "Problem97.CapSelectedRowCounting."
                            "selectedFourClass_inter_capByIndex_card_le_two"
                        ),
                        "cap": cap_name,
                        "center": center,
                        "support": sorted(rows[center]),
                        "own_cap_hits": sorted(hits),
                    }
                )
            if center in endpoints[cap_name] and len(hits) > 1:
                answer.append(
                    {
                        "kind": "selected-row-endpoint-own-cap-bound",
                        "source_theorems": [
                            "Problem97.CapSelectedRowCounting."
                            "selectedFourClass_inter_orderedCap_first_card_le_one",
                            "Problem97.CapSelectedRowCounting."
                            "selectedFourClass_inter_orderedCap_last_card_le_one",
                        ],
                        "cap": cap_name,
                        "center": center,
                        "support": sorted(rows[center]),
                        "own_cap_hits": sorted(hits),
                    }
                )
    return answer


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("artifacts", nargs="+", type=Path)
    parser.add_argument("--output", required=True, type=Path)
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    records = []
    for path in args.artifacts:
        artifact = json.loads(path.read_text(encoding="utf-8"))
        found = violations(artifact)
        if not found:
            raise AssertionError(f"expected at least one ordered-cap violation: {path}")
        records.append(
            {
                "artifact": str(path),
                "opp1_card": artifact["opp1_card"],
                "semantic_replay_status": artifact["semantic_replay_status"],
                "violations": found,
            }
        )
    result = {
        "schema": "p97-unique4-static-survivor-own-cap-audit-v1",
        "epistemic_status": "EXACT FINITE ARTIFACT REPLAY AGAINST KERNEL THEOREM SHAPES",
        "claim_scope": (
            "The two named static n=11 SAT projections only; neither artifact is a "
            "source-faithful residual or a Problem 97 counterexample"
        ),
        "records": records,
    }
    if args.check:
        expected = json.loads(args.output.read_text(encoding="utf-8"))
        if expected != result:
            raise AssertionError("stored survivor audit is stale")
    else:
        args.output.parent.mkdir(parents=True, exist_ok=True)
        args.output.write_text(json.dumps(result, indent=2, sort_keys=True) + "\n")
    print(json.dumps({"record_count": len(records), "status": "PASS"}, sort_keys=True))


if __name__ == "__main__":
    main()
