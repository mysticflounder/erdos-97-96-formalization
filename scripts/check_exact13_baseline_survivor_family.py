# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under GPL-3.0-or-later as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Exhaust the K/L/T family of a retained five-row baseline survivor.

Survivors here have five rows only. No full-cone, metric, all-center, or
live-source survival is asserted. No solver is called.
"""

import argparse
import json
from pathlib import Path

import cardge13_exact13_fixed_base_k4_scan as prior
import check_exact13_reassigned_chain_family as family

CORE = {"K": (5, 7, 8, 12), "L": (2, 9, 10, 11), "T": (0, 6, 7, 10)}


def build_report():
    """Retain every baseline-surviving base/blocker record, no filler globals."""
    survivors = []

    def collect(cell, status):
        if status == "no_one_or_two_form":
            survivors.append({"roles": cell["roles"], "base_rows": cell["base_rows"]})

    counts, digest, _ = family.enumerate_family(False, core=CORE, on_record=collect, rational_pairs=True)
    family.chain.require(len(survivors) == counts["baseline_no_one_or_two_form"], "survivor count mismatch")
    return {
        "schema": "exact13-baseline-survivor-family/v1",
        "scope": "Five base rows, fixed K/L/T, direct chart; no global-row survival or live-source coverage claim",
        "core": CORE, "order": family.base.DIRECT_ORDER,
        "prior_seed": {"path": "scripts/cardge13_exact13_fixed_base_k4_scan.py", "rows": prior.FIXED_ROWS},
        **counts, "canonical_enumeration_sha256": digest,
        "survivors": survivors,
        "survivor_format": "One canonical s0/s1/d witness per labeled base/blocker record; no global rows",
        "all_center_survivors_produced": 0,
        "live_source_leaves_eliminated": 0,
        "full_cone_status": "not tested",
        "pair_weight_scope": "Arbitrary positive rational weights via primitive integer rays",
    }


def verify_report(report):
    """Recompute the entire finite partition and all retained survivors."""
    family.chain.require(len(report["survivors"]) == report["baseline_no_one_or_two_form"], "survivor count mismatch")
    family.chain.require(report["all_center_survivors_produced"] == 0 and
                         report["live_source_leaves_eliminated"] == 0, "unsupported coverage claim")
    family.chain.require(report == json.loads(json.dumps(build_report())), "retained report mismatch")
    return True


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path)
    parser.add_argument("--verify", type=Path)
    args = parser.parse_args()
    family.chain.require(not (args.output and args.verify), "choose output or verify")
    if args.verify:
        report = json.loads(args.verify.read_text())
        verify_report(report)
    else:
        report = build_report()
    if args.output:
        family.chain.require(not args.output.exists(), "refusing overwrite")
        args.output.write_text(json.dumps(report, sort_keys=True, indent=2) + "\n")
    print(json.dumps({key: report[key] for key in (
        "support_partitions", "base_blocker_records", "role_records", "baseline_one_form",
        "baseline_two_form", "baseline_no_one_or_two_form")}))


if __name__ == "__main__":
    main()
