from __future__ import annotations

import copy
import hashlib
import importlib
import json
import sys
from pathlib import Path

import pytest

ROOT = Path(__file__).resolve().parents[3]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

driver = importlib.import_module("census.p97_search.phase3_survivor_metric_driver")
TEST_SOURCE = (
    ROOT / "census/p97_search/tests/fixtures/phase3_structural_survivors_100_current"
)


@pytest.fixture(scope="module")
def authenticated_source_dir(tmp_path_factory: pytest.TempPathFactory) -> Path:
    source_dir = tmp_path_factory.mktemp("authenticated-source-100")
    manifest = driver._strict_json(TEST_SOURCE / "manifest.json")
    for name in manifest["artifact_hashes"]:
        (source_dir / name).symlink_to(TEST_SOURCE / name)
    for relative in driver.SOURCE_DEPENDENCIES:
        manifest["configuration"]["dependency_sha256"][relative] = driver._sha256_file(
            driver.ROOT / relative
        )
    manifest.pop("manifest_sha256")
    manifest["manifest_sha256"] = driver._sha256_value(manifest)
    (source_dir / "manifest.json").write_text(
        json.dumps(manifest, indent=2, sort_keys=True) + "\n"
    )
    return source_dir


@pytest.fixture(scope="module")
def source(authenticated_source_dir: Path):
    return driver.load_source(authenticated_source_dir)


def _mock_exact(system, _timeout_s):
    return {"status": "SAT", "system_id": system["system_id"]}


def _mock_convex(n, rows, order, _timeout_s):
    assert n == 10
    assert len(rows) == 10
    assert len(order) == 10
    return {
        "status": "UNSAT",
        "confirmed_exclusion": True,
        "confirmed_realization": False,
    }


def _running_snapshot(tmp_path: Path, count: int) -> Path:
    source_dir = tmp_path / f"running-{count}"
    source_dir.mkdir()
    source_records = TEST_SOURCE.joinpath("survivors.jsonl").read_bytes().splitlines()
    survivor_bytes = b"\n".join(source_records[:count]) + b"\n"
    (source_dir / "survivors.jsonl").write_bytes(survivor_bytes)

    manifest = driver._strict_json(TEST_SOURCE / "manifest.json")
    manifest["status"] = "RUNNING"
    manifest["counts"]["structural_survivor_count"] = count
    manifest["counts"]["unclassified_raw_sat_count"] = 17
    manifest["artifact_hashes"]["survivors.jsonl"] = hashlib.sha256(
        survivor_bytes
    ).hexdigest()
    for relative in driver.SOURCE_DEPENDENCIES:
        manifest["configuration"]["dependency_sha256"][relative] = driver._sha256_file(
            driver.ROOT / relative
        )
    manifest.pop("manifest_sha256")
    manifest["manifest_sha256"] = driver._sha256_value(manifest)
    (source_dir / "live-manifest.json").write_text(
        json.dumps(manifest, indent=2, sort_keys=True) + "\n"
    )
    return source_dir


def test_source_replays_all_assignments_rows_hashes_and_orders(source) -> None:
    manifest, cases = source

    assert manifest["counts"]["structural_survivor_count"] == 100
    assert len(cases) == 100
    assert [case.index for case in cases] == list(range(100))
    assert len({case.source_record["raw_sat_index"] for case in cases}) == 100
    assert all(len(case.orders) == 24 for case in cases)
    assert all(
        len(case.rows) == 10
        and all(len(row.support) == 4 and row.exact is False for row in case.rows)
        for case in cases
    )


def test_equality_only_no_hit_stays_unknown(source) -> None:
    _, cases = source

    result = driver.classify_equality_only(cases[0].rows)

    assert result == {
        "stage": "equality-only-formalized-core",
        "status": "UNKNOWN",
        "diagnostic": "NO_FORMALIZED_CORE_FOUND_INCOMPLETE_DETECTOR",
        "detection": None,
    }


def test_backend_normalization_fails_closed() -> None:
    assert (
        driver._normalize_exact_result({"status": "ERROR", "diagnostic": "x"})["status"]
        == "ERROR"
    )
    assert driver._normalize_exact_result({"status": "plausible"})["status"] == "ERROR"
    assert (
        driver._normalize_convex_result(
            {
                "status": "SAT",
                "confirmed_realization": True,
                "confirmed_exclusion": False,
                "verification": None,
            }
        )["status"]
        == "ERROR"
    )
    assert (
        driver._normalize_convex_result(
            {
                "status": "SAT",
                "confirmed_realization": True,
                "confirmed_exclusion": False,
                "verification": {"all_z3_assertions_true": True},
            }
        )["status"]
        == "SAT"
    )
    assert (
        driver._normalize_convex_result(
            {
                "status": "UNKNOWN",
                "confirmed_realization": False,
                "confirmed_exclusion": False,
            }
        )["status"]
        == "UNKNOWN"
    )


def test_source_record_tamper_is_rejected(source) -> None:
    _, cases = source
    tampered = copy.deepcopy(cases[0].source_record)
    semantic_key = next(iter(tampered["semantic_assignment"]))
    tampered["semantic_assignment"][semantic_key] = not tampered["semantic_assignment"][
        semantic_key
    ]
    encoding = driver.structural.sat.SatEncoding(
        driver.structural.CELL, cap=True, blocker=True
    )

    with pytest.raises(driver.SurvivorMetricError, match="hash-chain replay"):
        driver._validate_source_record(
            tampered,
            expected_index=0,
            previous_record_sha256=None,
            encoding=encoding,
        )


def test_complete_mock_census_preserves_sources_and_separates_stages(
    tmp_path: Path, authenticated_source_dir: Path
) -> None:
    out = tmp_path / "screen"
    manifest = driver.run_driver(
        source_dir=authenticated_source_dir,
        out_dir=out,
        workers=1,
        timeout_s=0.25,
        exact_runner=_mock_exact,
        convex_runner=_mock_convex,
    )

    assert manifest["counts"] == {
        "source_survivor_count": 100,
        "cap_order_leaf_count": 2400,
        "equality_only_metric_core": {
            "SAT": 0,
            "UNSAT": 0,
            "UNKNOWN": 100,
            "ERROR": 0,
        },
        "exact_metric": {
            "SAT": 100,
            "UNSAT": 0,
            "UNKNOWN": 0,
            "ERROR": 0,
        },
        "convexity_order": {
            "SAT": 0,
            "UNSAT": 2400,
            "UNKNOWN": 0,
            "ERROR": 0,
        },
        "source_classification": {"ALL_CAP_ORDERS_SOLVER_UNSAT_NOT_LEAN_CLOSURE": 100},
    }
    records = driver._strict_jsonl(out / "results.jsonl")
    assert len(records) == 100
    assert (
        records[0]["source_record"]
        == driver._strict_jsonl(TEST_SOURCE / "survivors.jsonl")[0]
    )
    assert records[0]["previous_record_sha256"] is None
    for index, record in enumerate(records):
        assert record["index"] == index
        unsigned = dict(record)
        record_hash = unsigned.pop("record_sha256")
        assert record_hash == driver._sha256_value(unsigned)
        if index:
            assert (
                record["previous_record_sha256"] == records[index - 1]["record_sha256"]
            )
    assert (out / "source-manifest.json").read_bytes() == (
        authenticated_source_dir / "manifest.json"
    ).read_bytes()
    assert (
        manifest["artifacts"]["results.jsonl"]["sha256"]
        == hashlib.sha256((out / "results.jsonl").read_bytes()).hexdigest()
    )
    assert manifest["trust_boundary"]["lean"] == "NOT_LANDED"


@pytest.mark.parametrize("count", [1, 3])
def test_running_partial_snapshot_has_exact_authenticated_scope(
    tmp_path: Path, count: int
) -> None:
    source_dir = _running_snapshot(tmp_path, count)
    out = tmp_path / f"screen-{count}"

    manifest = driver.run_driver(
        source_dir=source_dir,
        out_dir=out,
        workers=1,
        timeout_s=0.25,
        expected_count=count,
        running_snapshot=True,
        exact_runner=_mock_exact,
        convex_runner=_mock_convex,
    )

    assert manifest["counts"]["source_survivor_count"] == count
    assert manifest["counts"]["cap_order_leaf_count"] == count * 24
    assert manifest["configuration"]["source_scope"] == (
        "immutable-running-partial-survivor-snapshot"
    )
    assert manifest["source"]["scope"] == (
        "immutable-running-partial-survivor-snapshot"
    )
    assert manifest["source"]["manifest_name"] == "live-manifest.json"
    assert manifest["source"]["source_manifest"]["status"] == "RUNNING"
    assert (
        manifest["source"]["source_manifest"]["counts"]["unclassified_raw_sat_count"]
        == 17
    )
    assert (
        manifest["result_claim"]
        == "immutable partial survivor snapshot screening of exactly "
        f"{count} survivors captured from a RUNNING structural CEGAR journal "
        "under the encoded row systems and 24 cap-compatible orders; partial "
        "journal scope only, not exhaustive and not SURVIVOR_LIMIT"
    )
    assert (out / "source-manifest.json").read_bytes() == (
        source_dir / "live-manifest.json"
    ).read_bytes()
    records = driver._strict_jsonl(out / "results.jsonl")
    assert len(records) == count
    assert [record["index"] for record in records] == list(range(count))


def test_running_snapshot_mode_rejects_wrong_count_and_terminal_manifest(
    tmp_path: Path, authenticated_source_dir: Path
) -> None:
    source_dir = _running_snapshot(tmp_path, 1)

    with pytest.raises(driver.SurvivorMetricError, match="counts do not match"):
        driver.load_source(
            source_dir,
            expected_count=2,
            running_snapshot=True,
        )
    with pytest.raises(driver.SurvivorMetricError, match="'RUNNING'"):
        driver.load_source(
            authenticated_source_dir,
            expected_count=100,
            running_snapshot=True,
        )


def test_terminal_mode_rejects_running_partial_snapshot(tmp_path: Path) -> None:
    source_dir = _running_snapshot(tmp_path, 1)
    (source_dir / "manifest.json").write_bytes(
        (source_dir / "live-manifest.json").read_bytes()
    )

    with pytest.raises(driver.SurvivorMetricError, match="'SURVIVOR_LIMIT'"):
        driver.load_source(source_dir, expected_count=1)


def test_running_snapshot_must_remain_immutable_during_screening(
    tmp_path: Path,
) -> None:
    source_dir = _running_snapshot(tmp_path, 1)
    survivors_path = source_dir / "survivors.jsonl"

    def mutating_exact(system, timeout_s):
        survivors_path.write_bytes(survivors_path.read_bytes() + b"\n")
        return _mock_exact(system, timeout_s)

    with pytest.raises(
        driver.SurvivorMetricError,
        match="source snapshot changed during metric screening",
    ):
        driver.run_driver(
            source_dir=source_dir,
            out_dir=tmp_path / "screen-mutated",
            workers=1,
            timeout_s=0.25,
            expected_count=1,
            running_snapshot=True,
            exact_runner=mutating_exact,
            convex_runner=_mock_convex,
        )


def test_cli_exposes_exact_running_snapshot_scope() -> None:
    args = driver._parse_args(["--running-snapshot", "--expected-count", "3"])

    assert args.running_snapshot is True
    assert args.expected_count == 3


def test_cli_exposes_bounded_case_order_selector() -> None:
    args = driver._parse_args(
        ["--case-index", "0", "--order-id", "order-00", "--workers", "1"]
    )

    assert args.case_index == 0
    assert args.order_id == "order-00"
    assert args.workers == 1


def test_bounded_selector_authenticates_full_source_but_publishes_one_order(
    tmp_path: Path, authenticated_source_dir: Path
) -> None:
    out = tmp_path / "screen-selected"
    manifest = driver.run_driver(
        source_dir=authenticated_source_dir,
        out_dir=out,
        workers=1,
        timeout_s=0.25,
        case_index=0,
        order_id="order-00",
        exact_runner=_mock_exact,
        convex_runner=_mock_convex,
    )

    assert manifest["source"]["survivor_count"] == 100
    assert manifest["counts"]["source_survivor_count"] == 100
    assert manifest["counts"]["published_survivor_count"] == 1
    assert manifest["counts"]["cap_order_leaf_count"] == 1
    assert manifest["result_claim"] == (
        "bounded canary screening of exactly one selected survivor and order "
        "order-00 from an authenticated source of 100 survivors; selected "
        "order only, not exhaustive and not SURVIVOR_LIMIT"
    )
    assert manifest["configuration"]["selection"] == {
        "case_index": 0,
        "order_id": "order-00",
        "authenticated_source_survivor_count": 100,
        "published_survivor_count": 1,
    }
    records = driver._strict_jsonl(out / "results.jsonl")
    assert len(records) == 1
    assert records[0]["index"] == 0
    assert records[0]["convexity_order"]["order_count"] == 1
    assert (out / "source-manifest.json").read_bytes() == (
        authenticated_source_dir / "manifest.json"
    ).read_bytes()


@pytest.mark.parametrize(
    "kwargs, message",
    [
        ({"case_index": 0}, "case_index and order_id"),
        ({"order_id": "order-00"}, "case_index and order_id"),
        ({"case_index": -1, "order_id": "order-00"}, "nonnegative"),
        ({"case_index": 0, "order_id": "missing"}, "not an authenticated"),
    ],
)
def test_bounded_selector_fails_closed(
    tmp_path: Path,
    authenticated_source_dir: Path,
    kwargs: dict[str, object],
    message: str,
) -> None:
    with pytest.raises((ValueError, driver.SurvivorMetricError), match=message):
        driver.run_driver(
            source_dir=authenticated_source_dir,
            out_dir=tmp_path / "screen-invalid-selection",
            workers=1,
            timeout_s=0.25,
            exact_runner=_mock_exact,
            convex_runner=_mock_convex,
            **kwargs,
        )


@pytest.mark.parametrize("timeout", [float("nan"), float("inf"), 0, True])
def test_invalid_timeout_is_rejected(
    tmp_path: Path, timeout: float, authenticated_source_dir: Path
) -> None:
    with pytest.raises(ValueError, match="timeout_s must be positive"):
        driver.run_driver(
            source_dir=authenticated_source_dir,
            out_dir=tmp_path / "invalid",
            workers=1,
            timeout_s=timeout,
            exact_runner=_mock_exact,
            convex_runner=_mock_convex,
        )


def test_refuses_to_overwrite_artifacts(
    tmp_path: Path, authenticated_source_dir: Path
) -> None:
    out = tmp_path / "occupied"
    out.mkdir()
    (out / "manifest.json").write_text("{}\n")

    with pytest.raises(driver.SurvivorMetricError, match="refusing to overwrite"):
        driver.run_driver(
            source_dir=authenticated_source_dir,
            out_dir=out,
            workers=1,
            timeout_s=1,
            exact_runner=_mock_exact,
            convex_runner=_mock_convex,
        )


def test_rejects_custom_runner_with_parallel_workers(source) -> None:
    _, cases = source

    with pytest.raises(
        driver.SurvivorMetricError,
        match="custom solver runners are supported only with workers=1",
    ):
        driver._run_tasks(
            cases[:1],
            workers=2,
            timeout_s=1,
            exact_runner=_mock_exact,
            convex_runner=_mock_convex,
        )
