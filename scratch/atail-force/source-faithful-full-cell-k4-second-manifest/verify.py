#!/usr/bin/env python3
"""Fail-closed replay of the bounded second-manifest search artifacts."""

from __future__ import annotations

from collections import Counter
import json
from pathlib import Path
import sys


HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))

import search_second_manifest as search  # noqa: E402


def read_jsonl(path: Path) -> list[dict[str, object]]:
    return [json.loads(line) for line in path.read_text().splitlines() if line.strip()]


def accepted(result: dict[str, object]) -> bool:
    payload = result["result"]
    return (
        bool(payload["order_ok"])
        and float(payload["minimum_cell_margin"]) > 0
        and float(payload["minimum_x21_manifest_margin"]) > 0
        and float(payload["minimum_second_manifest_margin"]) > 0
        and float(payload["equality_max_normalized_residual"]) < 1e-7
    )


def main() -> None:
    seed, order = search.load_seed()
    atoms = search.enumerate_atoms(seed, order, 4)[:76]
    expected_keys = {atom.key for atom in atoms}
    smoke = search.smoke_test(seed, order, atoms)
    assert smoke["status"] == "ENCODING_SMOKE_PASS"

    first = read_jsonl(HERE / "search-log.jsonl")
    assert len(first) == 78
    assert first[0]["status"] == "START"
    assert first[-1]["status"] == "BOUNDED_SECOND_MANIFEST_SEARCH_COMPLETE"
    assert first[0]["inputs"]["x21_certificate_sha256"] == search.sha256(
        search.CERTIFICATE
    )
    assert first[0]["inputs"]["x21_validation_sha256"] == search.sha256(
        search.VALIDATION
    )
    first_results = first[1:-1]
    assert {item["atom"]["key"] for item in first_results} == expected_keys
    assert Counter(item["status"] for item in first_results) == {
        "UNKNOWN_NO_HIT": 76
    }
    assert not any(accepted(item) for item in first_results)
    assert first[-1]["results"] == {
        "attempted": 76,
        "numeric_sat_candidates": 0,
        "timed_out": 74,
        "unknown_no_hit": 76,
    }
    assert not first[-1]["coverage_claim"] and not first[-1]["unsat_claim"]

    second = read_jsonl(HERE / "six-dof-log.jsonl")
    assert len(second) == 78
    assert second[0]["status"] == "START"
    assert second[-1]["status"] == "BOUNDED_LOCAL_SIX_DOF_COMPLETE"
    second_results = second[1:-1]
    assert {item["atom"]["key"] for item in second_results} == expected_keys
    assert Counter(item["status"] for item in second_results) == {
        "RELAXED_EQUALITY_HIT_GATE_FAILURE": 66,
        "UNKNOWN_NO_HIT": 10,
    }
    assert not any(accepted(item) for item in second_results)
    assert second[-1]["results"] == {
        "attempted": 76,
        "numeric_sat_candidates": 0,
        "relaxed_equality_hits_gate_failure": 66,
        "unknown_no_hit": 10,
    }
    assert not second[-1]["coverage_claim"] and not second[-1]["unsat_claim"]

    exact_hits_with_manifests = [
        item for item in second_results
        if float(item["result"]["equality_max_normalized_residual"]) < 1e-9
        and float(item["result"]["minimum_x21_manifest_margin"]) > 0
        and float(item["result"]["minimum_second_manifest_margin"]) > 0
        and bool(item["result"]["order_ok"])
    ]
    closest = max(
        exact_hits_with_manifests,
        key=lambda item: float(item["result"]["minimum_cell_margin"]),
    )
    assert closest["atom"]["key"] == "t1s->t1o:t1s,o,uI,x10"
    assert float(closest["result"]["minimum_cell_margin"]) < 0

    print("SECOND_MANIFEST_BOUNDED_REPLAY_PASS")
    print("first_pass = 76 UNKNOWN_NO_HIT; 0 candidates; 74 timed out")
    print("six_dof = 66 exact-equality gate failures; 10 UNKNOWN; 0 candidates")
    print(f"closest_exact_hit = {closest['atom']['key']}")
    print(f"closest_cell_margin = {closest['result']['minimum_cell_margin']}")
    print("coverage_claim = false")
    print("unsat_claim = false")


if __name__ == "__main__":
    main()
