#!/usr/bin/env python3
"""Apply the exact equality oracle to formalized-core-clean Q-C survivors.

This composes ``formalized_core_followup`` with the independently smoke-tested
Singular/msolve oracle.  It deliberately reruns the immutable finite search so
the reported metric system is tied to the exact survivor and digest.  Results
remain nonexhaustive and target-unfaithful: a unit ideal rejects one saved
shadow, while a nonunit ideal does not by itself supply a real, convex, or MEC
realization.
"""

from __future__ import annotations

import argparse
import json
import sys
from pathlib import Path
from typing import Any


HERE = Path(__file__).resolve().parent
ORACLE_DIR = HERE.parent / "second_center_metric_oracle"
sys.path.insert(0, str(HERE))
sys.path.insert(0, str(ORACLE_DIR))

import formalized_core_followup as core_followup  # noqa: E402
import oracle  # noqa: E402
import query  # noqa: E402
from census.global_confinement.metric_realizability_probe import (  # noqa: E402
    _formalized_metric_core,
)


SCHEMA = "p97-atail-pair-second-center-core-clean-metric-followup-v1"


def run_case(profile_index: int) -> dict[str, Any]:
    search = core_followup.solve_seed(query.CASE_SEEDS[profile_index])
    if search["solver"]["raw_status"] != "SAT":
        return {
            "profile": search["profile"],
            "search": search,
            "metric_oracle": {"status": "NOT_RUN_NO_SURVIVOR"},
        }

    survivor = search["survivor"]
    base, rows = oracle._base_case(survivor)
    order = tuple(survivor["frame"]["cyclic_order"])
    bank_detection = _formalized_metric_core(
        rows, int(survivor["frame"]["n"]), order
    )
    if bank_detection is not None:
        raise AssertionError(
            f"follow-up survivor still contains formalized core: {bank_detection}"
        )
    metric = oracle.discover_case(survivor)
    return {
        "profile": search["profile"],
        "search": {
            "solver": search["solver"],
            "formalized_core_prefix_rejections":
                search["formalized_core_prefix_rejections"],
            "survivor_sha256": survivor["witness_sha256"],
            "formalized_metric_core": None,
        },
        "metric_oracle": metric,
        "metric_input": {
            "distinct_row_count": base["distinct_metric_row_count"],
            "equality_count": base["equality_count"],
            "expanded_polynomial_sha256": base["expanded_polynomial_sha256"],
        },
    }


def document(profile_index: int) -> dict[str, Any]:
    return {
        "schema": SCHEMA,
        "scope": {
            "placement_count": 1,
            "card_11_included": False,
            "formalized_metric_core_bank_clean": True,
            "trusted_exact_cas_computation": True,
            "nullstellensatz_certificate_replayed": False,
            "target_faithful": False,
            "producer_proved": False,
        },
        "case": run_case(profile_index),
    }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--profile-index", type=int, choices=(0, 1), required=True)
    args = parser.parse_args()
    print(json.dumps(document(args.profile_index), indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
