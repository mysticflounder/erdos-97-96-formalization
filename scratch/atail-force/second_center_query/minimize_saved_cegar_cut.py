#!/usr/bin/env python3
"""Run equality-level minimization on one saved metric-CEGAR UNIT cut."""

from __future__ import annotations

import argparse
import json
import sys
from pathlib import Path


HERE = Path(__file__).resolve().parent
CEGAR_CHECKPOINT = HERE.parent / "second_center_metric_cegar" / "checkpoint.json"
if str(HERE) not in sys.path:
    sys.path.insert(0, str(HERE))

import formalized_core_equality_minimizer as minimizer  # noqa: E402


def decode_row(encoded: str) -> dict[str, object]:
    center_text, support_text = encoded.split(":", maxsplit=1)
    return {
        "center": int(center_text),
        "support": [int(point) for point in support_text.split(",")],
    }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--case-index", type=int, choices=(0, 1), required=True)
    parser.add_argument("--round", type=int, choices=tuple(range(8)), required=True)
    args = parser.parse_args()
    checkpoint = json.loads(CEGAR_CHECKPOINT.read_text(encoding="utf-8"))
    source_case = checkpoint["cases"][args.case_index]
    source_round = source_case["rounds"][args.round]
    if "accepted_cut" not in source_round:
        raise ValueError("selected round has no accepted UNIT cut")
    cut = source_round["accepted_cut"]
    case = {
        "profile": source_case["profile"],
        "n": 12,
        "source_witness_sha256": cut["row_set_sha256"],
        "rows": [decode_row(str(row)) for row in cut["rows"]],
    }
    result = {
        "schema": "p97-atail-saved-cegar-cut-equality-minimizer-v1",
        "scope": {
            "target_faithful": False,
            "fixed_placement_only": True,
            "trusted_exact_cas_computation": True,
            "nullstellensatz_certificate_replayed": False,
            "lean_theorem_proved": False,
        },
        "source": {
            "profile": source_case["profile"],
            "round": args.round,
            "row_set_sha256": cut["row_set_sha256"],
            "input_rows": case["rows"],
        },
        "minimization": minimizer.minimize(case),
    }
    print(json.dumps(result, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
