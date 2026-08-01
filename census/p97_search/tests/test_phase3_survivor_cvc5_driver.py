from __future__ import annotations

import hashlib
import importlib
import math
import sys
from collections import Counter
from pathlib import Path

import pytest

ROOT = Path(__file__).resolve().parents[3]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

driver = importlib.import_module("census.p97_search.phase3_survivor_cvc5_driver")
METRIC_FIXTURE = (
    ROOT
    / "census/p97_search/tests/fixtures/phase3_survivor_metric_100_current"
)

EXPECTED_COUNTS = {
    "convex_order": 80,
    "distinctness": 45,
    "row_equalities": 30,
    "selected_rows": 10,
    "total": 155,
}


@pytest.fixture(scope="module")
def source():
    return driver.load_unique_systems(METRIC_FIXTURE)


def _mock_smoke(_cvc5: str, _timeout_s: float):
    return {"passed": True, "status": "UNSAT", "kind": "mock"}


def _mock_version(_cvc5: str) -> str:
    return "mock-cvc5 1.0"


def _mock_unknown(_cvc5: str, system, _timeout_s: float):
    _, counts = driver.cvc5_backend.build_smt2(system, driver.STAGE)
    return {
        "stage": driver.STAGE,
        "status": "UNKNOWN",
        "reason": "cvc5 timeout",
        "constraint_counts": counts,
        "elapsed_sec": 0.01,
    }


def test_source_replays_and_deduplicates_exactly_48_systems(source) -> None:
    _, systems = source

    assert len(systems) == 48
    assert sum(len(item.source_leaves) for item in systems) == 2400
    assert Counter(len(item.source_leaves) for item in systems) == {
        1: 24,
        99: 24,
    }
    assert Counter(item.prior_z3_status for item in systems) == {
        "UNSAT": 33,
        "UNKNOWN": 15,
    }
    assert len({driver._canonical_sha256(item.system["rows"]) for item in systems}) == 2
    assert len({item.system_id for item in systems}) == 48
    assert all(
        driver._direct_system_id(item.system) == item.system_id for item in systems
    )
    assert all(
        item.system["n"] == 10
        and sorted(item.system["order"]) == list(range(10))
        and len(item.system["rows"]) == 10
        and all(row["exact"] is False for row in item.system["rows"])
        for item in systems
    )


def test_full_convex_encoding_has_only_requested_constraints(source) -> None:
    _, systems = source

    for item in systems:
        smt2, counts = driver.cvc5_backend.build_smt2(item.system, driver.STAGE)
        assert counts == EXPECTED_COUNTS
        assert smt2.startswith("(set-logic QF_NRA)\n")
        assert "exact_exclusions" not in smt2


@pytest.mark.parametrize(
    ("status", "classification", "excluded", "candidate"),
    [
        ("UNSAT", "CVC5_UNSAT_NOT_KERNEL_CHECKED", True, False),
        ("SAT", "SAT_UNVERIFIED_NO_VERDICT", False, True),
        ("UNKNOWN", "UNKNOWN_NO_VERDICT", False, False),
        ("ERROR", "ERROR_NO_VERDICT", False, False),
    ],
)
def test_backend_statuses_are_normalized_fail_closed(
    status: str,
    classification: str,
    excluded: bool,
    candidate: bool,
) -> None:
    result = driver._normalize_backend(
        {
            "stage": driver.STAGE,
            "status": status,
            "reason": "timeout" if status == "UNKNOWN" else status,
            "constraint_counts": EXPECTED_COUNTS,
        },
        expected_counts=EXPECTED_COUNTS,
    )

    assert result["status"] == status
    assert result["classification"] == classification
    assert result["confirmed_exclusion"] is excluded
    assert result["confirmed_realization"] is False
    assert result["sat_candidate_unverified"] is candidate
    assert result["timeout"] is (status == "UNKNOWN")


@pytest.mark.parametrize(
    "raw",
    [
        None,
        {"stage": "convex-only-relaxation", "status": "UNSAT"},
        {
            "stage": driver.STAGE,
            "status": "plausible",
            "constraint_counts": EXPECTED_COUNTS,
        },
        {
            "stage": driver.STAGE,
            "status": "UNSAT",
            "constraint_counts": {"total": 1},
        },
    ],
)
def test_malformed_backend_results_become_error(raw) -> None:
    result = driver._normalize_backend(raw, expected_counts=EXPECTED_COUNTS)

    assert result["status"] == "ERROR"
    assert result["confirmed_exclusion"] is False
    assert result["confirmed_realization"] is False


def test_complete_mock_run_preserves_queries_sources_and_hash_chains(
    tmp_path: Path,
) -> None:
    out = tmp_path / "cvc5"
    manifest = driver.run_driver(
        source_dir=METRIC_FIXTURE,
        out_dir=out,
        cvc5=sys.executable,
        workers=1,
        timeout_s=0.25,
        query_runner=_mock_unknown,
        smoke_runner=_mock_smoke,
        version_runner=_mock_version,
    )

    assert manifest["selection"] == {
        "unique_system_count": 48,
        "system_id_sha256": manifest["selection"]["system_id_sha256"],
        "unique_metric_row_count": 2,
        "attached_source_leaf_count": 2400,
        "prior_z3_status_counts": {"UNKNOWN": 15, "UNSAT": 33},
    }
    assert manifest["counts"] == {
        "system_count": 48,
        "status": {"SAT": 0, "UNSAT": 0, "UNKNOWN": 48, "ERROR": 0},
        "classification": {"UNKNOWN_NO_VERDICT": 48},
        "timeout_count": 48,
    }
    assert manifest["configuration"]["workers"] == 1
    assert "--nl-cov" in manifest["configuration"]["command"]
    assert all(
        "flux" not in part.lower() for part in manifest["configuration"]["command"]
    )

    systems = driver.z3_driver._strict_jsonl(out / "systems.jsonl")
    results = driver.z3_driver._strict_jsonl(out / "results.jsonl")
    assert len(systems) == len(results) == 48
    assert all(set(record) == driver.SYSTEM_RECORD_KEYS for record in systems)
    for records in (systems, results):
        for index, record in enumerate(records):
            assert record["index"] == index
            unsigned = dict(record)
            claimed = unsigned.pop("record_sha256")
            assert claimed == driver._canonical_sha256(unsigned)
            assert record["previous_record_sha256"] == (
                None if index == 0 else records[index - 1]["record_sha256"]
            )
    assert sum(record["source_leaf_count"] for record in systems) == 2400
    assert all(
        result["system_record_sha256"] == systems[index]["record_sha256"]
        and result["cvc5"]["status"] == "UNKNOWN"
        for index, result in enumerate(results)
    )

    for manifest_name in ("queries-manifest.json", "logs-manifest.json"):
        artifact_manifest = driver.z3_driver._strict_json(out / manifest_name)
        assert artifact_manifest["count"] == 48
        assert artifact_manifest["entries_sha256"] == driver._canonical_sha256(
            artifact_manifest["entries"]
        )
        for entry in artifact_manifest["entries"]:
            assert (
                hashlib.sha256((out / entry["path"]).read_bytes()).hexdigest()
                == (entry["sha256"])
            )
    assert (out / "source-manifest.json").read_bytes() == (
        METRIC_FIXTURE / "manifest.json"
    ).read_bytes()
    assert manifest["trust_boundary"]["lean"] == "NOT_LANDED"


@pytest.mark.parametrize("timeout", [float("nan"), float("inf"), 0, True])
def test_invalid_timeout_is_rejected(tmp_path: Path, timeout: float) -> None:
    assert not math.isfinite(timeout) or timeout == 0 or timeout is True
    with pytest.raises(ValueError, match="finite and positive"):
        driver.run_driver(
            source_dir=METRIC_FIXTURE,
            out_dir=tmp_path / "invalid",
            cvc5=sys.executable,
            workers=1,
            timeout_s=timeout,
            query_runner=_mock_unknown,
            smoke_runner=_mock_smoke,
            version_runner=_mock_version,
        )


@pytest.mark.parametrize("workers", [0, 25, True])
def test_invalid_worker_count_is_rejected(tmp_path: Path, workers: int) -> None:
    with pytest.raises(ValueError, match="workers must be"):
        driver.run_driver(
            source_dir=METRIC_FIXTURE,
            out_dir=tmp_path / "invalid",
            cvc5=sys.executable,
            workers=workers,
            timeout_s=1,
            query_runner=_mock_unknown,
            smoke_runner=_mock_smoke,
            version_runner=_mock_version,
        )


def test_refuses_to_overwrite_artifacts(tmp_path: Path) -> None:
    out = tmp_path / "occupied"
    out.mkdir()
    (out / "manifest.json").write_text("{}\n")

    with pytest.raises(driver.Phase3Cvc5Error, match="refusing to overwrite"):
        driver.run_driver(
            source_dir=METRIC_FIXTURE,
            out_dir=out,
            cvc5=sys.executable,
            workers=1,
            timeout_s=1,
            query_runner=_mock_unknown,
            smoke_runner=_mock_smoke,
            version_runner=_mock_version,
        )


def test_custom_runner_is_rejected_with_parallel_workers(source) -> None:
    _, systems = source
    system = systems[0]
    smt2, counts = driver.cvc5_backend.build_smt2(system.system, driver.STAGE)
    record = {
        "system": system.system,
        "constraint_counts": counts,
        "query_sha256": hashlib.sha256(smt2.encode()).hexdigest(),
    }

    with pytest.raises(driver.Phase3Cvc5Error, match="workers=1"):
        driver._run_tasks(
            [record],
            cvc5=sys.executable,
            workers=2,
            timeout_s=1,
            runner=_mock_unknown,
        )
