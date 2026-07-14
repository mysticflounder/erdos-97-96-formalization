#!/usr/bin/env python3
"""Summarize and structurally validate the 8/16/32/64-round checkpoints."""

from __future__ import annotations

import argparse
import importlib.util
import json
import math
import sys
from collections import Counter
from pathlib import Path
from typing import Any, Mapping


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
for path in (str(ROOT), str(HERE)):
    if path not in sys.path:
        sys.path.insert(0, path)

import cegar  # noqa: E402


SCHEMA = "p97-atail-second-center-metric-cegar-extension-summary-v2"
DEFAULT_OUTPUT = HERE / "extension_summary.json"
CHECKPOINTS = (
    HERE / "checkpoint.json",
    HERE / "checkpoint-round16.json",
    HERE / "checkpoint-round32.json",
    HERE / "checkpoint-round64.json",
)


def load_validator():
    spec = importlib.util.spec_from_file_location(
        "p97_atail_extension_summary_validator", HERE / "validator.py"
    )
    if spec is None or spec.loader is None:
        raise ImportError("cannot load CEGAR validator")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def case_summary(case: Mapping[str, object], node_cap: int) -> dict[str, Any]:
    rounds = list(case["rounds"])
    nodes = [int(record["nodes"]) for record in rounds]
    cut_sizes = [int(case["bootstrap_cut"]["row_count"])] + [
        int(record["accepted_cut"]["row_count"])
        for record in rounds
        if "accepted_cut" in record
    ]
    full_statuses = Counter(
        str(record["full_equality_ideal"]["status"])
        for record in rounds
        if record["incidence_status"] == "SAT"
    )
    cut_statuses = Counter(
        str(record["accepted_cut"]["crosscheck"]["status"])
        for record in rounds
        if "accepted_cut" in record
    )
    return {
        "profile": list(case["profile"]),
        "final_status": case["final_status"],
        "round_count": len(rounds),
        "incidence_status_counts": dict(
            sorted(Counter(str(record["incidence_status"]) for record in rounds).items())
        ),
        "full_equality_ideal_status_counts": dict(sorted(full_statuses.items())),
        "accepted_cut_status_counts": dict(sorted(cut_statuses.items())),
        "max_incidence_nodes": max(nodes),
        "last_round_incidence_nodes": nodes[-1],
        "max_node_cap_fraction": max(nodes) / node_cap,
        "bootstrap_and_learned_cut_sizes": cut_sizes,
        "five_row_learned_rounds": [
            int(record["round"])
            for record in rounds
            if "accepted_cut" in record
            and int(record["accepted_cut"]["row_count"]) == 5
        ],
    }


def raw_choice_surface() -> list[dict[str, Any]]:
    records: list[dict[str, Any]] = []
    for seed in cegar.metric_oracle.source_query.CASE_SEEDS:
        problem = cegar.build_problem(seed)
        lengths = [len(row.choices) for row in problem.choice_rows]
        product = math.prod(lengths)
        records.append(
            {
                "profile": list(problem.profile),
                "choice_row_count": len(lengths),
                "choice_counts": lengths,
                "raw_cartesian_product": str(product),
                "raw_cartesian_product_decimal_digits": len(str(product)),
                "note": "before prefix, Q-C, critical-system, and no-good pruning",
            }
        )
    return records


def build_document() -> dict[str, Any]:
    validator = load_validator()
    checkpoints: list[dict[str, Any]] = []
    for path in CHECKPOINTS:
        payload = json.loads(path.read_text(encoding="utf-8"))
        validator.validate_document(payload, api=cegar)
        node_cap = int(payload["budgets"]["max_incidence_nodes_per_round"])
        checkpoints.append(
            {
                "path": str(path.relative_to(ROOT)),
                "sha256": cegar.file_sha256(path),
                "round_budget_per_case": int(
                    payload["budgets"]["max_rounds_per_case"]
                ),
                "manifest_sha256": payload["manifest_sha256"],
                "discovery_mode": (
                    "hash_bound_resume"
                    if "resumed_checkpoint_sha256" in payload["source"]
                    else "fresh_discovery"
                ),
                "resume_provenance": (
                    {
                        "checkpoint_sha256": payload["source"][
                            "resumed_checkpoint_sha256"
                        ],
                        "round_budget_per_case": int(
                            payload["source"]["resumed_round_budget_per_case"]
                        ),
                    }
                    if "resumed_checkpoint_sha256" in payload["source"]
                    else None
                ),
                "cases": [case_summary(case, node_cap) for case in payload["cases"]],
                "structural_validation": "PASSED",
            }
        )
    budgets = [record["round_budget_per_case"] for record in checkpoints]
    if budgets != [8, 16, 32, 64]:
        raise AssertionError("unexpected extension budget sequence")
    if [record["discovery_mode"] for record in checkpoints] != [
        "fresh_discovery",
        "fresh_discovery",
        "fresh_discovery",
        "hash_bound_resume",
    ]:
        raise AssertionError("unexpected extension discovery modes")
    resume = checkpoints[-1]["resume_provenance"]
    if resume != {
        "checkpoint_sha256": checkpoints[-2]["sha256"],
        "round_budget_per_case": checkpoints[-2]["round_budget_per_case"],
    }:
        raise AssertionError("round-64 resume provenance does not bind round 32")
    largest = checkpoints[-1]
    largest_cases = largest["cases"]
    return {
        "schema": SCHEMA,
        "checkpoints": checkpoints,
        "raw_incidence_choice_surface": raw_choice_surface(),
        "summary": {
            "largest_round_budget_per_case": 64,
            "largest_checkpoint_sha256": largest["sha256"],
            "largest_checkpoint_all_cases_stopped_at_round_budget": all(
                case["final_status"] == "STOPPED_ROUND_BUDGET"
                for case in largest_cases
            ),
            "any_fixed_placement_exhausted": any(
                case["final_status"]
                == "EXHAUSTED_FIXED_PLACEMENT_FINITE_SHADOW"
                for checkpoint in checkpoints
                for case in checkpoint["cases"]
            ),
            "any_crosschecked_nonunit_candidate": any(
                "CROSSCHECKED_NONUNIT"
                in case["full_equality_ideal_status_counts"]
                for checkpoint in checkpoints
                for case in checkpoint["cases"]
            ),
            "largest_checkpoint_all_proposals_and_cuts_crosschecked_unit": all(
                case["full_equality_ideal_status_counts"]
                == {"CROSSCHECKED_UNIT": 64}
                and case["accepted_cut_status_counts"]
                == {"CROSSCHECKED_UNIT": 64}
                for case in largest_cases
            ),
            "largest_checkpoint_max_nodes_by_profile": {
                str(case["profile"]): case["max_incidence_nodes"]
                for case in largest_cases
            },
            "assessment": (
                "Incidence remains far below its node cap, but one-cut-per-round "
                "CEGAR shows no exhaustion signal by 64 rounds; continued CAS "
                "enumeration is not a closure proof."
            ),
        },
        "scope": {
            "fresh_discovery_round_budgets": [8, 16, 32],
            "round_64_hash_bound_resume_from_round_32": True,
            "time_bounded_minimization_can_change_early_cut_sequences": True,
            "structural_validation_replayed_here": True,
            "cas_crosschecks_replayed_here": False,
            "target_faithful": False,
            "producer_proved": False,
        },
    }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--check", action="store_true")
    parser.add_argument("--output", type=Path, default=DEFAULT_OUTPUT)
    args = parser.parse_args()
    document = build_document()
    rendered = json.dumps(document, indent=2, sort_keys=True) + "\n"
    if args.check:
        if args.output.read_text(encoding="utf-8") != rendered:
            raise AssertionError("extension-summary checkpoint drift")
    else:
        args.output.write_text(rendered, encoding="utf-8")
    print(
        json.dumps(
            {
                "output": str(args.output),
                "sha256": cegar.file_sha256(args.output),
                "summary": document["summary"],
            },
            indent=2,
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
