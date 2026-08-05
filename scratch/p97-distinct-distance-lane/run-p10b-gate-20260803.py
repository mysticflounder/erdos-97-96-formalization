"""Bounded P10B portfolio gate without the optional pytest dependency."""

from __future__ import annotations

import copy
import importlib
import json
import tempfile
from pathlib import Path
from typing import Any


ROOT = Path(__file__).resolve().parents[2]
import sys

sys.path.insert(0, str(ROOT))

portfolio = importlib.import_module("census.p97_search.phase3_portfolio")
productivity = importlib.import_module(
    "census.p97_search.phase3_productivity"
)


def rows() -> list[dict[str, Any]]:
    return [
        {"center": center, "support": [center, center + 1, center + 2]}
        for center in range(10)
    ]


def feature_records(count: int) -> list[dict[str, Any]]:
    result: list[dict[str, Any]] = []
    previous: str | None = None
    for index in range(count):
        record = portfolio.make_feature_record(
            index=index,
            raw_sat_index=index,
            assignment_sha256=f"assignment-{index}",
            source_record_sha256=f"source-{index}",
            rows=rows(),
            previous_record_sha256=previous,
        )
        result.append(record)
        previous = record["record_sha256"]
    return result


def scenario_set(count: int = 20) -> list[dict[str, Any]]:
    result: list[dict[str, Any]] = []
    for index, feature in enumerate(feature_records(count)):
        observations = {
            "metric-core": {
                "status": "NO_MATCH",
                "cost_ns": 100,
            },
            "three-rhombus": {
                "status": "MATCH",
                "cost_ns": 20,
                "classification": "learned-seven-point-three-rhombus",
                "certificate_sha256": "certificate-rhombus",
            },
            "cap-order": {"status": "NO_MATCH", "cost_ns": 30},
            "rhombus-cap-order": {"status": "NO_MATCH", "cost_ns": 30},
            "shared-pair": {"status": "NO_MATCH", "cost_ns": 30},
            "kalmanson": {"status": "NO_MATCH", "cost_ns": 30},
            "algebraic": {"status": "NO_MATCH", "cost_ns": 30},
            "structural": {"status": "NO_MATCH", "cost_ns": 30},
        }
        result.append(
            portfolio.make_scenario(
                scenario_id=f"synthetic-{index}",
                feature_record=feature,
                observations=observations,
            )
        )
    return result


def main() -> None:
    scenarios = scenario_set()
    feature_chain_head = portfolio.validate_feature_chain(
        [scenario["feature_record"] for scenario in scenarios]
    )
    assert feature_chain_head == scenarios[-1]["feature_record"]["record_sha256"]

    report = portfolio.evaluate_heldout(
        scenarios,
        holdout_modulus=2,
        holdout_residue=0,
    )
    assert report["status"] == "HELDOUT_GATE_PASS"
    assert report["promotion"]["status"] == portfolio.PARKED_SPEC
    assert report["promotion"]["eligible"] is False
    metrics = report["metrics"]
    assert metrics["semantic_disagreements"] == 0
    assert metrics["candidate_cost_ns"] < metrics["baseline_cost_ns"]
    assert metrics["candidate_match_count"] == metrics["baseline_match_count"]
    portfolio.validate_portfolio_chain(report["records"])
    assert all(
        set(record["candidate"]) >= {
            "skipped_detectors",
            "unknown_detectors",
            "status",
        }
        for record in report["records"]
    )

    unknown = copy.deepcopy(scenarios[0])
    unknown["observations"]["metric-core"] = {
        "status": "UNKNOWN",
        "cost_ns": 7,
        "reason": "synthetic solver interruption",
    }
    unknown["scenario_sha256"] = productivity.sha256_value(
        {key: value for key, value in unknown.items() if key != "scenario_sha256"}
    )
    unknown_result = portfolio.run_schedule(
        unknown, portfolio.fixed_cascade_order({})
    )
    assert unknown_result["status"] == "UNKNOWN"
    assert unknown_result["unknown_detectors"] == ["metric-core"]
    assert unknown_result["skipped_detectors"] == list(
        portfolio.DETECTOR_ORDER[1:]
    )

    tampered = copy.deepcopy(scenarios[0])
    tampered["feature_record"]["features"]["overlap_pair_count"] += 1
    try:
        portfolio.validate_scenario(tampered)
    except portfolio.PortfolioError:
        pass
    else:
        raise AssertionError("tampered feature vector was accepted")

    root = Path(tempfile.mkdtemp(prefix="p10b-gate-", dir=ROOT / "scratch"))
    source = root / "scenarios.json"
    output = root / "portfolio.json"
    source.write_bytes(portfolio.productivity.canonical_bytes(scenarios) + b"\n")
    portfolio.main(
        [
            "--scenarios",
            str(source),
            "--out",
            str(output),
            "--holdout-modulus",
            "2",
            "--holdout-residue",
            "0",
        ]
    )
    cli_report = json.loads(output.read_text(encoding="utf-8"))
    assert cli_report == report
    print(
        json.dumps(
            {
                "gate": "P10B",
                "status": "PASS",
                "root": str(root),
                "training_count": report["split"]["training_count"],
                "heldout_count": report["split"]["heldout_count"],
                "baseline_cost_ns": metrics["baseline_cost_ns"],
                "candidate_cost_ns": metrics["candidate_cost_ns"],
                "report_sha256": report["report_sha256"],
            },
            sort_keys=True,
        )
    )


if __name__ == "__main__":
    main()
