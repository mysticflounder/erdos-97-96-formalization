from __future__ import annotations

import copy
import importlib
from typing import Any

import pytest


portfolio = importlib.import_module("census.p97_search.phase3_portfolio")


def _features(count: int = 4) -> list[dict[str, Any]]:
    result: list[dict[str, Any]] = []
    previous: str | None = None
    for index in range(count):
        record = portfolio.make_feature_record(
            index=index,
            raw_sat_index=index,
            assignment_sha256=f"assignment-{index}",
            source_record_sha256=f"source-{index}",
            rows=[
                {"center": 0, "support": [0, 1, 2]},
                {"center": 1, "support": [1, 2, 3]},
            ],
            previous_record_sha256=previous,
        )
        result.append(record)
        previous = record["record_sha256"]
    return result


def _scenario(feature: dict[str, Any], index: int) -> dict[str, Any]:
    return portfolio.make_scenario(
        scenario_id=f"scenario-{index}",
        feature_record=feature,
        observations={
            "metric-core": {"status": "NO_MATCH", "cost_ns": 100},
            "three-rhombus": {
                "status": "MATCH",
                "cost_ns": 10,
                "classification": "learned-rhombus",
                "certificate_sha256": "certificate-rhombus",
            },
        },
    )


def test_feature_chain_and_scenario_tamper_are_rejected() -> None:
    records = _features()
    assert portfolio.validate_feature_chain(records) == records[-1]["record_sha256"]
    scenario = _scenario(records[0], 0)
    tampered = copy.deepcopy(scenario)
    tampered["feature_record"]["features"]["row_count"] += 1
    with pytest.raises(portfolio.PortfolioError, match="feature vector hash"):
        portfolio.validate_scenario(tampered)


def test_unknown_is_terminal_and_skipped_detectors_are_explicit() -> None:
    scenario = _scenario(_features(1)[0], 0)
    scenario["observations"]["metric-core"] = {
        "status": "UNKNOWN",
        "cost_ns": 3,
        "reason": "interrupted",
    }
    unsigned = dict(scenario)
    unsigned.pop("scenario_sha256")
    scenario["scenario_sha256"] = portfolio.productivity.sha256_value(unsigned)
    result = portfolio.run_schedule(
        scenario, portfolio.fixed_cascade_order({})
    )
    assert result["status"] == "UNKNOWN"
    assert result["unknown_detectors"] == ["metric-core"]
    assert result["skipped_detectors"] == list(
        portfolio.DETECTOR_ORDER[1:]
    )


def test_heldout_policy_preserves_replayed_semantics() -> None:
    scenarios = [_scenario(feature, index) for index, feature in enumerate(_features(8))]
    report = portfolio.evaluate_heldout(
        scenarios, holdout_modulus=2, holdout_residue=0
    )
    assert report["status"] in {"HELDOUT_GATE_PASS", "HELDOUT_GATE_FAIL"}
    assert report["metrics"]["semantic_disagreements"] == 0
    assert report["promotion"]["status"] == portfolio.PARKED_SPEC
    portfolio.validate_portfolio_chain(report["records"])
