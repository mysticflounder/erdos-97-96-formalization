#!/usr/bin/env python3
"""Replay the one-row-extension completion of all current card-12 shards.

For each preferred nearest U1 assignment, add only its h4 or h5 equality to
the saved exact-row shadow.  The existing formalized metric-core classifier
must immediately find a kernel-backed EqualityCore family.  In particular,
the h5 edge is tested by itself in the seven nominal h5+h7 cases.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import sys
from collections import Counter
from pathlib import Path
from typing import Any


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
QUERY = HERE.parent / "second_center_query"
ROLE_AUDIT = HERE.parent / "current-bank-u1-match/role_audit_checkpoint.json"
SOURCE = QUERY / "formalized_core_shards_after_current_bank_checkpoint.json"
MATCHER = ROOT / "census/global_confinement/metric_realizability_probe.py"
EQUALITY_CORE = ROOT / "lean/Erdos9796Proof/P97/Census554/EqualityCore.lean"
GENERAL_BRIDGE = (
    ROOT / "lean/Erdos9796Proof/P97/Census554/GeneralCarrierBridge.lean"
)
OUTPUT = HERE / "row_extension_completion_checkpoint.json"

PINS = {
    ROLE_AUDIT: "808adbbf43a649773b4e273446d1c6fbd6dc37c53013f967365eb57a089b3713",
    SOURCE: "5b661a15f4dda8a6cd143f3737457f2733d23eca056defcbcd30872f629bcc1a",
    MATCHER: "f7a92776f9cee02eda2265467d77a0bbd5254d1dd335bc7a70713203239d3373",
    EQUALITY_CORE: "d69d734942d6dfcfd7341a5d84c254f388e7be7be4fccf26926caf47100c4d82",
    GENERAL_BRIDGE: "10f14c3a11267585448fd3b4b2ecf1b82225deddf7c245c91de800a315d50729",
}

if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from census.global_confinement.metric_realizability_probe import (  # noqa: E402
    MetricRow,
    _formalized_metric_core,
)


def digest(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def verify_pins() -> None:
    for path, expected in PINS.items():
        actual = digest(path)
        if actual != expected:
            raise RuntimeError(
                f"pinned source drift at {path}: expected {expected}, found {actual}"
            )


def relative(path: Path) -> str:
    return str(path.relative_to(ROOT))


def family(stage: str) -> str:
    mapping = {
        "equality-duplicate-center": "DuplicateCenterCore",
        "equality-exact-off-circle": "ExactOffCircleCore",
    }
    if stage not in mapping:
        raise RuntimeError(f"unexpected first completion family {stage}")
    return mapping[stage]


def build() -> dict[str, Any]:
    verify_pins()
    role_audit = json.loads(ROLE_AUDIT.read_text(encoding="utf-8"))
    source = json.loads(SOURCE.read_text(encoding="utf-8"))
    source_by_shard = {
        int(case["partition"]["shard_index"]): case for case in source["cases"]
    }
    cases = []
    for role_case in role_audit["cases"]:
        shard = int(role_case["shard_index"])
        missing = tuple(int(value) for value in role_case["missing_hypotheses"])
        preferred = next(
            row
            for row in role_case["missing_rows"]
            if int(row["hypothesis"]) in {4, 5}
        )
        hypothesis = int(preferred["hypothesis"])
        if hypothesis not in {4, 5}:
            raise AssertionError(hypothesis)
        survivor = source_by_shard[shard]["survivor"]
        rows = tuple(
            MetricRow(
                int(row["center"]),
                tuple(int(point) for point in row["support"]),
                bool(row["exact"]),
            )
            for row in survivor["distinct_metric_rows"]
        )
        added = MetricRow(
            int(preferred["center"]),
            (int(preferred["left"]), int(preferred["right"])),
            False,
        )
        base_detection = _formalized_metric_core(
            rows,
            int(survivor["frame"]["n"]),
            tuple(int(point) for point in survivor["frame"]["cyclic_order"]),
        )
        detection = _formalized_metric_core(
            rows + (added,),
            int(survivor["frame"]["n"]),
            tuple(int(point) for point in survivor["frame"]["cyclic_order"]),
        )
        if detection is None:
            raise RuntimeError(f"shard {shard} row extension did not close")
        stage = str(detection["stage"])
        cases.append(
            {
                "shard_index": shard,
                "original_missing_hypotheses": list(missing),
                "tested_hypothesis_alone": hypothesis,
                "h5_alone_in_nominal_h5_h7_case": missing == (5, 7),
                "base_already_hits_current_bank": base_detection is not None,
                "base_first_existing_metric_core_stage": (
                    None if base_detection is None else base_detection["stage"]
                ),
                "base_classifier_witness": base_detection,
                "added_row_extension": {
                    key: preferred[key]
                    for key in (
                        "center_role",
                        "left_role",
                        "right_role",
                        "center",
                        "left",
                        "right",
                        "center_cap_role",
                        "left_cap_role",
                        "right_cap_role",
                        "selected_support_at_center",
                        "selected_row_exact",
                        "left_in_selected_support",
                        "right_in_selected_support",
                    )
                },
                "first_existing_metric_core_stage_after_extension": stage,
                "first_existing_lean_core_family_after_extension": family(stage),
                "extension_classifier_witness": detection,
                "row_extension_is_first_new_bank_hit": base_detection is None,
            }
        )
    cases.sort(key=lambda case: int(case["shard_index"]))
    missing_histogram = Counter(
        tuple(case["original_missing_hypotheses"]) for case in cases
    )
    stage_histogram = Counter(
        str(case["first_existing_metric_core_stage_after_extension"])
        for case in cases
    )
    base_stage_histogram = Counter(
        str(case["base_first_existing_metric_core_stage"])
        for case in cases
        if case["base_already_hits_current_bank"]
    )
    if len(cases) != 23:
        raise RuntimeError(f"expected 23 completions, found {len(cases)}")
    if missing_histogram != Counter({(5,): 11, (4,): 5, (5, 7): 7}):
        raise RuntimeError(f"unexpected preferred-role split {missing_histogram}")
    if sum(bool(case["h5_alone_in_nominal_h5_h7_case"]) for case in cases) != 7:
        raise RuntimeError("h5-alone completion did not cover seven two-edge cases")
    if any(bool(case["base_already_hits_current_bank"]) for case in cases):
        raise RuntimeError("fresh current-bank checkpoint contains a bank hit")
    return {
        "schema": "p97-atail-current-row-extension-completion-v1",
        "scope": {
            "fixed_card_12_555_placement_only": True,
            "finite_shadow_only": True,
            "existing_lean_consumer_family": True,
            "row_extension_producer_proved": False,
            "live_k_a_pair_closed": False,
        },
        "pinned_inputs": [
            {"path": relative(path), "sha256": expected}
            for path, expected in PINS.items()
        ],
        "replay": (
            "PYTHONPATH=. .venv/bin/python "
            "scratch/atail-force/current-marco-cores/"
            "row_extension_completion.py --check"
        ),
        "case_count": len(cases),
        "preferred_role_histogram": {
            "+".join(str(value) for value in key): count
            for key, count in sorted(missing_histogram.items())
        },
        "base_current_bank_hit_count": sum(
            bool(case["base_already_hits_current_bank"]) for case in cases
        ),
        "base_current_bank_hit_stage_histogram": dict(
            sorted(base_stage_histogram.items())
        ),
        "base_clean_case_count": sum(
            not bool(case["base_already_hits_current_bank"]) for case in cases
        ),
        "extension_first_stage_histogram": dict(sorted(stage_histogram.items())),
        "all_base_clean_preferred_single_edges_hit_existing_core": all(
            case["base_already_hits_current_bank"]
            or case["row_extension_is_first_new_bank_hit"]
            for case in cases
        ),
        "all_cases_closed_or_one_row_extension_from_existing_core": True,
        "nominal_h5_h7_cases_closed_by_h5_alone": 7,
        "base_clean_nominal_h5_h7_cases_newly_closed_by_h5_alone": sum(
            bool(case["h5_alone_in_nominal_h5_h7_case"])
            and bool(case["row_extension_is_first_new_bank_hit"])
            for case in cases
        ),
        "uniform_computational_producer_target": (
            "after current-bank filtering, force one h4-or-h5 "
            "selected-exact-row radius extension"
        ),
        "cases": cases,
    }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--check", action="store_true")
    parser.add_argument("--output", type=Path, default=OUTPUT)
    args = parser.parse_args()
    rendered = json.dumps(build(), indent=2, sort_keys=True) + "\n"
    if args.check:
        if not args.output.exists():
            raise SystemExit(f"missing checkpoint: {args.output}")
        if args.output.read_text(encoding="utf-8") != rendered:
            raise SystemExit(f"stale checkpoint: {args.output}")
        print(f"PASS: {args.output}")
        return 0
    temporary = args.output.with_suffix(args.output.suffix + ".tmp")
    temporary.write_text(rendered, encoding="utf-8")
    temporary.replace(args.output)
    print(f"wrote {args.output}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
