#!/usr/bin/env python3
"""Scan the existing exact Kalmanson ledgers for first-apex nonreturn.

This script deliberately does not import the generating solver module.  It
reconstructs the outside-role identifications from ``results.json`` and reads
the exact rational ledgers independently.  A hit is a stored full-LRA model in
which, for every reverse outside pair ``{x_i,y_i}``, the two distances from
the retained first apex ``right = S.oppApex1`` are unequal.  The separate
physical apex is ``o = S.oppApex2``.
"""

from __future__ import annotations

from collections import Counter
from fractions import Fraction
import json
from pathlib import Path


HERE = Path(__file__).resolve().parent
SOURCE = HERE.parent / "cycle-three-rows-kalmanson"
FIRST_APEX = "right"


def edge_key(a: str, b: str) -> str:
    return "~".join(sorted((a, b)))


def role_targets(record: dict[str, object]) -> dict[str, str]:
    blocks = [*record["left_blocks"], *record["right_blocks"]]
    return {
        role: "t_" + "_".join(block)
        for block in blocks
        for role in block
    }


def main() -> None:
    results = json.loads((SOURCE / "results.json").read_text())
    ledgers_payload = json.loads((SOURCE / "ledgers.json").read_text())
    ledgers = ledgers_payload["cases"]

    live_records = {
        record["case"]: record
        for record in results["cases"]
        if record.get("full_lra", {}).get("status")
        == "SAT_VERIFIED_RATIONAL_LRA_LEDGER"
    }
    assert len(live_records) == 990
    assert set(live_records) == set(ledgers)

    signature_counts: Counter[str] = Counter()
    representatives: dict[str, dict[str, object]] = {}
    all_unequal_count = 0

    for case_key, record in live_records.items():
        ledger = {key: Fraction(value) for key, value in ledgers[case_key].items()}
        target = role_targets(record)
        comparisons = []
        all_unequal = True
        for row in range(3):
            x = target[f"x{row}"]
            y = target[f"y{row}"]
            dx = ledger[edge_key(FIRST_APEX, x)]
            dy = ledger[edge_key(FIRST_APEX, y)]
            if dx < dy:
                direction = "x<y"
            elif dy < dx:
                direction = "y<x"
            else:
                direction = "x=y"
                all_unequal = False
            comparisons.append({
                "row": row,
                "x_target": x,
                "y_target": y,
                "dist_first_apex_x": str(dx),
                "dist_first_apex_y": str(dy),
                "direction": direction,
                "absolute_gap": str(abs(dx - dy)),
            })

        signature = ",".join(item["direction"] for item in comparisons)
        signature_counts[signature] += 1
        if all_unequal:
            all_unequal_count += 1
            representatives.setdefault(signature, {
                "case": case_key,
                "cyclic_order": record["cyclic_order"],
                "comparisons": comparisons,
            })

    output = {
        "schema": "period3-oppApex1-nonreturn-stored-ledger-scan-v2",
        "epistemic_status": "EXACT_REPLAY_OF_STORED_ABSTRACT_LRA_MODELS_NOT_EUCLIDEAN_NOT_LEAN",
        "apex_mapping": {
            "o": "S.oppApex2",
            "left": "surplusApex",
            "right": "S.oppApex1",
            "queried_first_apex": FIRST_APEX,
        },
        "stored_full_lra_cases": len(live_records),
        "all_three_pairs_unequal_cases": all_unequal_count,
        "signature_counts": dict(sorted(signature_counts.items())),
        "all_unequal_representatives": dict(sorted(representatives.items())),
    }
    (HERE / "stored_ledger_scan.json").write_text(
        json.dumps(output, indent=2, sort_keys=True) + "\n"
    )
    print(json.dumps({
        "stored_full_lra_cases": output["stored_full_lra_cases"],
        "all_three_pairs_unequal_cases": output["all_three_pairs_unequal_cases"],
        "signature_counts": output["signature_counts"],
        "representatives": {
            signature: record["case"]
            for signature, record in representatives.items()
        },
    }, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
