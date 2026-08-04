"""P10B authenticated detector portfolio experiments.

This module is a successor, replay-only scheduling plane.  It binds a
deterministic feature vector to an authenticated source assignment, learns a
detector order from a training split, and evaluates that order on a held-out
split.  It never admits a clause, changes the Class-A cascade, or treats an
UNKNOWN detector result as a negative result.  Portfolio reports remain
``PARKED-SPEC`` until a real held-out end-to-end corpus and an independently
replayable consumer are supplied.
"""

from __future__ import annotations

import argparse
import hashlib
import json
from collections import defaultdict
from pathlib import Path
from typing import Any, Mapping, Sequence

from census.p97_search import phase3_productivity as productivity


FEATURE_SCHEMA = "p97-phase3-detector-feature-vector-v1"
SCENARIO_SCHEMA = "p97-phase3-detector-portfolio-scenario-v1"
POLICY_SCHEMA = "p97-phase3-detector-portfolio-policy-v1"
RECORD_SCHEMA = "p97-phase3-detector-portfolio-record-v1"
REPORT_SCHEMA = "p97-phase3-detector-portfolio-report-v1"
PARKED_SPEC = productivity.PARKED_SPEC

DETECTOR_ORDER = (
    "metric-core",
    "three-rhombus",
    "cap-order",
    "rhombus-cap-order",
    "shared-pair",
    "kalmanson",
    "algebraic",
    "structural",
)
OBSERVATION_STATUSES = frozenset({"MATCH", "NO_MATCH", "UNKNOWN"})


class PortfolioError(ValueError):
    """Malformed or semantically unsafe portfolio data."""


_UNSET = object()


def _sha256(value: Any) -> str:
    return productivity.sha256_value(value)


def _require_int(value: Any, *, field: str, minimum: int = 0) -> int:
    if type(value) is not int or value < minimum:
        raise PortfolioError(f"{field} must be an integer >= {minimum}")
    return value


def _row_payload(row: Any) -> dict[str, Any]:
    if isinstance(row, Mapping):
        center = row.get("center")
        support = row.get("support")
        exact = row.get("exact", False)
    else:
        center = getattr(row, "center", None)
        support = getattr(row, "support", None)
        exact = getattr(row, "exact", False)
    if type(center) is not int:
        raise PortfolioError("feature row center must be an integer")
    if not isinstance(support, (list, tuple)):
        raise PortfolioError("feature row support must be a sequence")
    normalized_support = tuple(support)
    if any(type(point) is not int for point in normalized_support):
        raise PortfolioError("feature row support points must be integers")
    if len(set(normalized_support)) != len(normalized_support):
        raise PortfolioError("feature row support must be distinct")
    if type(exact) is not bool:
        raise PortfolioError("feature row exact flag must be boolean")
    return {
        "center": center,
        "support": list(normalized_support),
        "exact": exact,
    }


def feature_vector(rows: Sequence[Any]) -> dict[str, Any]:
    """Compute a deterministic, pre-detector feature vector from metric rows."""

    normalized = [_row_payload(row) for row in rows]
    normalized.sort(key=lambda row: row["center"])
    centers = [row["center"] for row in normalized]
    if len(set(centers)) != len(centers):
        raise PortfolioError("feature rows must have distinct centers")
    supports = [set(row["support"]) for row in normalized]
    overlaps = [
        len(left & right)
        for index, left in enumerate(supports)
        for right in supports[index + 1 :]
    ]
    incidence_count = sum(len(support) for support in supports)
    degrees = [
        sum(bool(support & other) for other in supports if other is not support)
        for support in supports
    ]
    sizes = [len(support) for support in supports]
    return {
        "row_count": len(normalized),
        "support_incidence_count": incidence_count,
        "unique_support_count": len(
            {tuple(row["support"]) for row in normalized}
        ),
        "overlap_pair_count": sum(overlap > 0 for overlap in overlaps),
        "shared_support_pair_count": sum(overlap >= 2 for overlap in overlaps),
        "max_support_overlap": max(overlaps, default=0),
        "support_degree_sum": sum(degrees),
        "support_degree_max": max(degrees, default=0),
        "support_size_min": min(sizes, default=0),
        "support_size_max": max(sizes, default=0),
        "row_support_sha256": _sha256(normalized),
    }


def make_feature_record(
    *,
    index: int,
    raw_sat_index: int,
    assignment_sha256: str,
    source_record_sha256: str,
    rows: Sequence[Any],
    previous_record_sha256: str | None,
    detector_order: Sequence[str] = DETECTOR_ORDER,
) -> dict[str, Any]:
    """Create an authenticated feature record without detector side effects."""

    index = _require_int(index, field="feature index")
    raw_sat_index = _require_int(raw_sat_index, field="raw SAT index")
    order = tuple(detector_order)
    if order != DETECTOR_ORDER:
        raise PortfolioError("feature detector universe/order is not canonical")
    features = feature_vector(rows)
    unsigned = {
        "schema": FEATURE_SCHEMA,
        "index": index,
        "raw_sat_index": raw_sat_index,
        "assignment_sha256": str(assignment_sha256),
        "source_record_sha256": str(source_record_sha256),
        "feature_sha256": _sha256(features),
        "features": features,
        "detector_order": list(DETECTOR_ORDER),
        "previous_record_sha256": previous_record_sha256,
    }
    return productivity.with_record_hash(unsigned, previous_record_sha256)


def validate_feature_record(
    record: Mapping[str, Any],
    *,
    index: int | None = None,
    previous_record_sha256: str | None | object = _UNSET,
) -> None:
    if record.get("schema") != FEATURE_SCHEMA:
        raise PortfolioError("feature record schema mismatch")
    if index is not None and record.get("index") != index:
        raise PortfolioError("feature record indices are not dense")
    if record.get("raw_sat_index") != record.get("index"):
        raise PortfolioError("feature raw SAT indices are not dense")
    if record.get("detector_order") != list(DETECTOR_ORDER):
        raise PortfolioError("feature detector order mismatch")
    features = record.get("features")
    if not isinstance(features, Mapping):
        raise PortfolioError("feature vector is missing")
    if record.get("feature_sha256") != _sha256(dict(features)):
        raise PortfolioError("feature vector hash mismatch")
    if (
        previous_record_sha256 is not _UNSET
        and record.get("previous_record_sha256") != previous_record_sha256
    ):
        raise PortfolioError("feature record chain drift")
    claimed = record.get("record_sha256")
    if not isinstance(claimed, str):
        raise PortfolioError("feature record hash is missing")
    unsigned = dict(record)
    unsigned.pop("record_sha256", None)
    if claimed != _sha256(unsigned):
        raise PortfolioError("feature record hash mismatch")


def validate_feature_chain(records: Sequence[Mapping[str, Any]]) -> str | None:
    previous: str | None = None
    for index, record in enumerate(records):
        validate_feature_record(record, index=index, previous_record_sha256=previous)
        previous = str(record["record_sha256"])
    return previous


def _normalize_observation(value: Any, *, detector: str) -> dict[str, Any]:
    if not isinstance(value, Mapping):
        raise PortfolioError(f"observation for {detector} is not an object")
    status = value.get("status")
    if status not in OBSERVATION_STATUSES:
        raise PortfolioError(f"observation for {detector} has invalid status")
    cost_ns = _require_int(value.get("cost_ns"), field=f"{detector}.cost_ns")
    classification = value.get("classification")
    certificate_sha256 = value.get("certificate_sha256")
    if classification is not None and not isinstance(classification, str):
        raise PortfolioError(f"{detector}.classification must be a string")
    if certificate_sha256 is not None and not isinstance(certificate_sha256, str):
        raise PortfolioError(f"{detector}.certificate_sha256 must be a string")
    result = {
        "status": status,
        "cost_ns": cost_ns,
        "classification": classification,
        "certificate_sha256": certificate_sha256,
    }
    if "reason" in value:
        if not isinstance(value["reason"], str):
            raise PortfolioError(f"{detector}.reason must be a string")
        result["reason"] = value["reason"]
    return result


def make_scenario(
    *,
    scenario_id: str,
    feature_record: Mapping[str, Any],
    observations: Mapping[str, Any],
) -> dict[str, Any]:
    """Bind replayed detector observations to one authenticated feature record."""

    validate_feature_record(feature_record)
    normalized: dict[str, Any] = {}
    for detector, observation in sorted(observations.items()):
        if detector not in DETECTOR_ORDER:
            raise PortfolioError(f"unknown detector in scenario: {detector}")
        normalized[detector] = _normalize_observation(
            observation, detector=detector
        )
    unsigned = {
        "schema": SCENARIO_SCHEMA,
        "scenario_id": str(scenario_id),
        "feature_record": dict(feature_record),
        "feature_record_sha256": feature_record["record_sha256"],
        "observations": normalized,
    }
    return {
        **unsigned,
        "scenario_sha256": _sha256(unsigned),
    }


def validate_scenario(scenario: Mapping[str, Any]) -> None:
    if scenario.get("schema") != SCENARIO_SCHEMA:
        raise PortfolioError("portfolio scenario schema mismatch")
    feature_record = scenario.get("feature_record")
    if not isinstance(feature_record, Mapping):
        raise PortfolioError("portfolio scenario has no feature record")
    validate_feature_record(feature_record)
    if scenario.get("feature_record_sha256") != feature_record.get(
        "record_sha256"
    ):
        raise PortfolioError("portfolio scenario feature lineage mismatch")
    observations = scenario.get("observations")
    if not isinstance(observations, Mapping):
        raise PortfolioError("portfolio scenario observations are missing")
    for detector, observation in observations.items():
        if detector not in DETECTOR_ORDER:
            raise PortfolioError(f"portfolio scenario has unknown detector {detector}")
        _normalize_observation(observation, detector=detector)
    unsigned = dict(scenario)
    claimed = unsigned.pop("scenario_sha256", None)
    if claimed != _sha256(unsigned):
        raise PortfolioError("portfolio scenario hash mismatch")


def _feature_bucket(features: Mapping[str, Any]) -> str:
    overlap = _require_int(
        features.get("overlap_pair_count"), field="overlap_pair_count"
    )
    shared = _require_int(
        features.get("shared_support_pair_count"),
        field="shared_support_pair_count",
    )
    return f"overlap={overlap};shared={shared}"


def fixed_cascade_order(_features: Mapping[str, Any]) -> list[str]:
    return list(DETECTOR_ORDER)


def _order_statistics(scenarios: Sequence[Mapping[str, Any]]) -> dict[str, dict[str, int]]:
    statistics = {
        detector: {"matches": 0, "unknowns": 0, "cost_ns": 0}
        for detector in DETECTOR_ORDER
    }
    for scenario in scenarios:
        observations = scenario["observations"]
        for detector in DETECTOR_ORDER:
            observation = observations.get(detector)
            if observation is None:
                statistics[detector]["unknowns"] += 1
                continue
            if observation["status"] == "MATCH":
                statistics[detector]["matches"] += 1
            elif observation["status"] == "UNKNOWN":
                statistics[detector]["unknowns"] += 1
            statistics[detector]["cost_ns"] += observation["cost_ns"]
    return statistics


def _sort_detectors(statistics: Mapping[str, Mapping[str, int]]) -> list[str]:
    positions = {detector: index for index, detector in enumerate(DETECTOR_ORDER)}
    return sorted(
        DETECTOR_ORDER,
        key=lambda detector: (
            -int(statistics[detector]["matches"]),
            int(statistics[detector]["unknowns"]),
            int(statistics[detector]["cost_ns"]),
            positions[detector],
        ),
    )


def fit_feature_policy(training: Sequence[Mapping[str, Any]]) -> dict[str, Any]:
    """Fit a deterministic empirical order using training scenarios only."""

    for scenario in training:
        validate_scenario(scenario)
    buckets: dict[str, list[Mapping[str, Any]]] = defaultdict(list)
    for scenario in training:
        buckets[
            _feature_bucket(scenario["feature_record"]["features"])
        ].append(scenario)
    global_statistics = _order_statistics(training)
    bucket_orders = {
        bucket: _sort_detectors(_order_statistics(items))
        for bucket, items in sorted(buckets.items())
    }
    unsigned = {
        "schema": POLICY_SCHEMA,
        "kind": "empirical-match-unknown-cost-v1",
        "training_scenario_sha256": [
            scenario["scenario_sha256"]
            for scenario in sorted(training, key=lambda item: item["scenario_sha256"])
        ],
        "bucket_fields": ["overlap_pair_count", "shared_support_pair_count"],
        "default_order": _sort_detectors(global_statistics),
        "bucket_orders": bucket_orders,
        "statistics": {
            detector: dict(values)
            for detector, values in sorted(global_statistics.items())
        },
    }
    return {**unsigned, "policy_sha256": _sha256(unsigned)}


def policy_order(
    policy: Mapping[str, Any], features: Mapping[str, Any]
) -> list[str]:
    if policy.get("schema") != POLICY_SCHEMA:
        raise PortfolioError("portfolio policy schema mismatch")
    default_order = policy.get("default_order")
    if default_order != list(DETECTOR_ORDER) and sorted(default_order or []) != sorted(
        DETECTOR_ORDER
    ):
        raise PortfolioError("portfolio policy default order is not a permutation")
    buckets = policy.get("bucket_orders", {})
    if not isinstance(buckets, Mapping):
        raise PortfolioError("portfolio policy bucket orders are missing")
    candidate = buckets.get(_feature_bucket(features), default_order)
    if not isinstance(candidate, list) or sorted(candidate) != sorted(DETECTOR_ORDER):
        raise PortfolioError("portfolio policy bucket order is not a permutation")
    return list(candidate)


def run_schedule(
    scenario: Mapping[str, Any], order: Sequence[str]
) -> dict[str, Any]:
    """Replay one order; UNKNOWN is terminal and never treated as NO_MATCH."""

    validate_scenario(scenario)
    if sorted(order) != sorted(DETECTOR_ORDER):
        raise PortfolioError("schedule order is not a detector permutation")
    observations = scenario["observations"]
    attempted: list[str] = []
    unknown: list[str] = []
    total_cost_ns = 0
    for position, detector in enumerate(order):
        attempted.append(detector)
        observation = observations.get(detector)
        if observation is None:
            unknown.append(detector)
            return {
                "status": "UNKNOWN",
                "classification": None,
                "certificate_sha256": None,
                "terminal_detector": None,
                "attempted_detectors": attempted,
                "skipped_detectors": list(order[position + 1 :]),
                "unknown_detectors": unknown,
                "cost_ns": total_cost_ns,
                "reason": "missing detector observation",
            }
        total_cost_ns += observation["cost_ns"]
        if observation["status"] == "UNKNOWN":
            unknown.append(detector)
            return {
                "status": "UNKNOWN",
                "classification": None,
                "certificate_sha256": None,
                "terminal_detector": None,
                "attempted_detectors": attempted,
                "skipped_detectors": list(order[position + 1 :]),
                "unknown_detectors": unknown,
                "cost_ns": total_cost_ns,
                "reason": observation.get("reason", "detector returned UNKNOWN"),
            }
        if observation["status"] == "MATCH":
            return {
                "status": "MATCH",
                "classification": observation.get("classification"),
                "certificate_sha256": observation.get("certificate_sha256"),
                "terminal_detector": detector,
                "attempted_detectors": attempted,
                "skipped_detectors": list(order[position + 1 :]),
                "unknown_detectors": unknown,
                "cost_ns": total_cost_ns,
            }
    return {
        "status": "SURVIVOR",
        "classification": None,
        "certificate_sha256": None,
        "terminal_detector": None,
        "attempted_detectors": attempted,
        "skipped_detectors": [],
        "unknown_detectors": unknown,
        "cost_ns": total_cost_ns,
    }


def _semantic_key(result: Mapping[str, Any]) -> tuple[Any, ...]:
    return (
        result.get("status"),
        result.get("classification"),
        result.get("certificate_sha256"),
        result.get("terminal_detector"),
    )


def _portfolio_record(
    *,
    index: int,
    scenario: Mapping[str, Any],
    policy: Mapping[str, Any],
    baseline: Mapping[str, Any],
    candidate: Mapping[str, Any],
    previous_record_sha256: str | None,
) -> dict[str, Any]:
    unsigned = {
        "schema": RECORD_SCHEMA,
        "index": index,
        "scenario_sha256": scenario["scenario_sha256"],
        "feature_record_sha256": scenario["feature_record_sha256"],
        "policy_sha256": policy["policy_sha256"],
        "baseline": dict(baseline),
        "candidate": dict(candidate),
        "previous_record_sha256": previous_record_sha256,
    }
    return productivity.with_record_hash(unsigned, previous_record_sha256)


def validate_portfolio_chain(records: Sequence[Mapping[str, Any]]) -> str | None:
    previous: str | None = None
    for index, record in enumerate(records):
        if record.get("schema") != RECORD_SCHEMA:
            raise PortfolioError("portfolio record schema mismatch")
        if record.get("index") != index:
            raise PortfolioError("portfolio record indices are not dense")
        if record.get("previous_record_sha256") != previous:
            raise PortfolioError("portfolio record chain drift")
        for field in (
            "scenario_sha256",
            "feature_record_sha256",
            "policy_sha256",
            "baseline",
            "candidate",
        ):
            if field not in record:
                raise PortfolioError(f"portfolio record is missing {field}")
        claimed = record.get("record_sha256")
        if not isinstance(claimed, str):
            raise PortfolioError("portfolio record hash is missing")
        unsigned = dict(record)
        unsigned.pop("record_sha256", None)
        if claimed != _sha256(unsigned):
            raise PortfolioError("portfolio record hash mismatch")
        previous = claimed
    return previous


def evaluate_heldout(
    scenarios: Sequence[Mapping[str, Any]],
    *,
    holdout_modulus: int = 5,
    holdout_residue: int = 0,
) -> dict[str, Any]:
    """Compare fixed and fitted orders on a deterministic held-out split."""

    holdout_modulus = _require_int(
        holdout_modulus, field="holdout modulus", minimum=2
    )
    holdout_residue = _require_int(
        holdout_residue, field="holdout residue"
    )
    if holdout_residue >= holdout_modulus:
        raise PortfolioError("holdout residue must be below modulus")
    ordered = sorted(scenarios, key=lambda item: item.get("scenario_sha256", ""))
    for scenario in ordered:
        validate_scenario(scenario)
    training = [
        scenario
        for scenario in ordered
        if int(scenario["scenario_sha256"][:8], 16) % holdout_modulus
        != holdout_residue
    ]
    heldout = [
        scenario
        for scenario in ordered
        if int(scenario["scenario_sha256"][:8], 16) % holdout_modulus
        == holdout_residue
    ]
    policy = fit_feature_policy(training) if training else None
    records: list[dict[str, Any]] = []
    previous: str | None = None
    baseline_cost = 0
    candidate_cost = 0
    disagreements = 0
    baseline_unknown = 0
    candidate_unknown = 0
    baseline_matches = 0
    candidate_matches = 0
    for index, scenario in enumerate(heldout):
        baseline = run_schedule(scenario, fixed_cascade_order({}))
        candidate = (
            run_schedule(
                scenario,
                policy_order(policy, scenario["feature_record"]["features"]),
            )
            if policy is not None
            else {
                "status": "UNKNOWN",
                "classification": None,
                "certificate_sha256": None,
                "terminal_detector": None,
                "attempted_detectors": [],
                "skipped_detectors": list(DETECTOR_ORDER),
                "unknown_detectors": list(DETECTOR_ORDER),
                "cost_ns": 0,
                "reason": "insufficient training scenarios",
            }
        )
        records.append(
            _portfolio_record(
                index=index,
                scenario=scenario,
                policy=policy
                or {
                    "policy_sha256": "insufficient-training",
                },
                baseline=baseline,
                candidate=candidate,
                previous_record_sha256=previous,
            )
        )
        previous = records[-1]["record_sha256"]
        baseline_cost += baseline["cost_ns"]
        candidate_cost += candidate["cost_ns"]
        disagreements += _semantic_key(baseline) != _semantic_key(candidate)
        baseline_unknown += baseline["status"] == "UNKNOWN"
        candidate_unknown += candidate["status"] == "UNKNOWN"
        baseline_matches += baseline["status"] == "MATCH"
        candidate_matches += candidate["status"] == "MATCH"
    benchmark_pass = bool(
        training
        and heldout
        and disagreements == 0
        and candidate_unknown <= baseline_unknown
        and candidate_matches == baseline_matches
        and candidate_cost < baseline_cost
    )
    report_unsigned = {
        "schema": REPORT_SCHEMA,
        "status": "HELDOUT_GATE_PASS" if benchmark_pass else (
            "INSUFFICIENT_HELDOUT" if not training or not heldout else "HELDOUT_GATE_FAIL"
        ),
        "trust_boundary": (
            "replay-only diagnostic comparison; no detector selection, clause "
            "admission, witness validation, or terminal proof authority"
        ),
        "split": {
            "holdout_modulus": holdout_modulus,
            "holdout_residue": holdout_residue,
            "training_count": len(training),
            "heldout_count": len(heldout),
            "training_scenario_sha256": [
                scenario["scenario_sha256"] for scenario in training
            ],
            "heldout_scenario_sha256": [
                scenario["scenario_sha256"] for scenario in heldout
            ],
        },
        "policy": policy,
        "metrics": {
            "baseline_cost_ns": baseline_cost,
            "candidate_cost_ns": candidate_cost,
            "semantic_disagreements": disagreements,
            "baseline_unknown_count": baseline_unknown,
            "candidate_unknown_count": candidate_unknown,
            "baseline_match_count": baseline_matches,
            "candidate_match_count": candidate_matches,
        },
        "records": records,
        "promotion": {
            "status": PARKED_SPEC,
            "eligible": False,
            "reason": (
                "requires a real held-out end-to-end corpus, independent "
                "certificate replay, and an explicit Class-B consumer"
            ),
        },
    }
    return {
        **report_unsigned,
        "report_sha256": _sha256(report_unsigned),
    }


def _load_scenarios(path: Path) -> list[dict[str, Any]]:
    try:
        value = json.loads(path.read_text(encoding="utf-8"))
    except (OSError, ValueError) as exc:
        raise PortfolioError(f"cannot read scenario file {path}: {exc}") from exc
    if not isinstance(value, list):
        raise PortfolioError("scenario file must contain a JSON array")
    result = [dict(item) for item in value if isinstance(item, Mapping)]
    if len(result) != len(value):
        raise PortfolioError("scenario file contains a non-object item")
    return result


def _write_json(path: Path, value: Mapping[str, Any]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    temporary = path.with_name(f".{path.name}.tmp")
    temporary.write_bytes(productivity.canonical_bytes(value) + b"\n")
    temporary.replace(path)


def main(argv: Sequence[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--scenarios", type=Path, required=True)
    parser.add_argument("--out", type=Path, required=True)
    parser.add_argument("--holdout-modulus", type=int, default=5)
    parser.add_argument("--holdout-residue", type=int, default=0)
    args = parser.parse_args(argv)
    report = evaluate_heldout(
        _load_scenarios(args.scenarios),
        holdout_modulus=args.holdout_modulus,
        holdout_residue=args.holdout_residue,
    )
    _write_json(args.out, report)
    print(
        json.dumps(
            {
                "out": str(args.out),
                "report_sha256": report["report_sha256"],
                "schema": REPORT_SCHEMA,
                "status": report["status"],
            },
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
