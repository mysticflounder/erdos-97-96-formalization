from __future__ import annotations

import importlib
import json
import os
import shutil
import sys
from pathlib import Path

import pytest

ROOT = Path(__file__).resolve().parents[3]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

equality_ideal_probe = importlib.import_module(
    "census.global_confinement.equality_ideal_probe"
)
realize = importlib.import_module("census.p97_search.realize")
screen = importlib.import_module("census.p97_search.structural_screen")


CURRENT_RUN = (
    ROOT
    / "census/p97_search/tests/fixtures"
    / "phase3_legacy_bounded100_current"
)


@pytest.fixture(scope="module")
def source() -> realize.VerifiedSource:
    return realize.load_verified_source(CURRENT_RUN)


def _fake_singular(
    monkeypatch: pytest.MonkeyPatch,
) -> tuple[list[tuple[int, str]], list[tuple[int, str, str, str]]]:
    smoke_calls: list[tuple[int, str]] = []
    probe_calls: list[tuple[int, str, str, str]] = []

    def fake_smoke(*, timeout_s: int, executable: str) -> dict:
        smoke_calls.append((timeout_s, executable))
        return {
            "known_unit": {
                "expected": "UNIT",
                "verdict": "UNIT",
                "returncode": 0,
            },
            "known_nonunit": {
                "expected": "NONUNIT",
                "verdict": "NONUNIT",
                "returncode": 0,
            },
        }

    def fake_probe(
        n: int,
        rows: tuple,
        *,
        timeout_s: int,
        executable: str,
    ) -> equality_ideal_probe.OracleResult:
        del rows
        probe_calls.append(
            (
                n,
                str(timeout_s),
                os.environ["OMP_NUM_THREADS"],
                executable,
            )
        )
        assert os.environ["OPENBLAS_NUM_THREADS"] == "1"
        assert os.environ["MKL_NUM_THREADS"] == "1"
        return equality_ideal_probe.OracleResult("UNIT", returncode=0)

    monkeypatch.setattr(screen.equality_ideal, "run_smoke_gates", fake_smoke)
    monkeypatch.setattr(screen.equality_ideal, "probe_rows", fake_probe)
    return smoke_calls, probe_calls


def test_current_source_uses_inexact_rows_and_replays_certificate(
    source: realize.VerifiedSource,
) -> None:
    model = screen._models_in_source_order(source)[0]
    analysis = screen._analyze_model(model)

    assert len(analysis["rows"]) == 10
    assert all(row.exact is False for row in analysis["rows"])
    assert analysis["detection"]["stage"] in screen.ORDER_INDEPENDENT_STAGES
    assert analysis["certificate_validation"]["passed"] is True
    assert analysis["lean_match"] == {
        "alternative": "Problem97.Census554.MetricCoreAlternative",
        "generic_consumer": ("Problem97.Census554.false_of_metricCoreAlternative"),
        "detector_stage": analysis["detection"]["stage"],
        "phase3_kernel_status": "NOT_LANDED",
    }


def test_append_only_resume_tamper_and_summary_fail_closed(
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    smoke_calls, probe_calls = _fake_singular(monkeypatch)
    out = tmp_path / "screen"

    partial = screen.run_driver(
        CURRENT_RUN,
        out,
        workers=24,
        solver_threads=1,
        singular_timeout=7,
        singular_executable="fake-singular",
        singular_audit_sample=5,
        max_new_records=3,
    )
    assert partial == {
        "status": "INCOMPLETE",
        "record_count": 3,
        "expected_result_count": 100,
        "next_screen_index": 3,
    }

    tampered = tmp_path / "tampered"
    shutil.copytree(out, tampered)
    lines = (tampered / "results.jsonl").read_text().splitlines()
    first = json.loads(lines[0])
    first["classification"] = "NONUNIT"
    lines[0] = json.dumps(first, sort_keys=True, separators=(",", ":"))
    (tampered / "results.jsonl").write_text("\n".join(lines) + "\n")
    with pytest.raises(screen.StructuralScreenError, match="invalid record hash"):
        screen.run_driver(
            CURRENT_RUN,
            tampered,
            workers=24,
            solver_threads=1,
            singular_timeout=7,
            singular_executable="fake-singular",
            singular_audit_sample=5,
            resume=True,
        )

    summary = screen.run_driver(
        CURRENT_RUN,
        out,
        workers=24,
        solver_threads=1,
        singular_timeout=7,
        singular_executable="fake-singular",
        singular_audit_sample=5,
        resume=True,
    )
    assert summary["status"] == "COMPLETE"
    assert summary["model_count"] == 100
    assert sum(summary["classification_counts"].values()) == 100
    assert sum(summary["detector_family_counts"].values()) == 100
    assert summary["structurally_unresolved_count"] == 0
    assert summary["forbidden_claims_emitted"] == []

    records = [
        json.loads(line) for line in (out / "results.jsonl").read_text().splitlines()
    ]
    assert len(records) == 100
    assert all(
        row["exact"] is False for record in records for row in record["metric_rows"]
    )
    assert all(
        record["classification"] == "STRUCTURAL_CORE_REPLAYED" for record in records
    )
    assert len(smoke_calls) == 1
    assert len(probe_calls) == summary["singular_probe_count"] == 5
    assert all(call == (10, "7", "1", "fake-singular") for call in probe_calls)

    calls_before_resume = (len(smoke_calls), len(probe_calls))
    assert (
        screen.run_driver(
            CURRENT_RUN,
            out,
            workers=24,
            solver_threads=1,
            singular_timeout=7,
            singular_executable="fake-singular",
            singular_audit_sample=5,
            resume=True,
        )
        == summary
    )
    assert (len(smoke_calls), len(probe_calls)) == calls_before_resume

    summary_tampered = tmp_path / "summary-tampered"
    shutil.copytree(out, summary_tampered)
    summary_path = summary_tampered / "summary.json"
    changed = json.loads(summary_path.read_text())
    changed["model_count"] = 99
    summary_path.write_text(json.dumps(changed, indent=2, sort_keys=True) + "\n")
    with pytest.raises(screen.StructuralScreenError, match="invalid summary hash"):
        screen.run_driver(
            CURRENT_RUN,
            summary_tampered,
            workers=24,
            solver_threads=1,
            singular_timeout=7,
            singular_executable="fake-singular",
            singular_audit_sample=5,
            resume=True,
        )


def test_certificate_replay_failure_stops_before_results(
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    _fake_singular(monkeypatch)
    monkeypatch.setattr(
        screen.certificates,
        "_validate_certificate",
        lambda certificate, *, n: False,
    )
    out = tmp_path / "bad-certificate"
    with pytest.raises(
        screen.StructuralScreenError, match="certificate did not replay"
    ):
        screen.run_driver(
            CURRENT_RUN,
            out,
            singular_timeout=7,
            singular_executable="fake-singular",
            max_new_records=1,
        )
    assert not (out / "results.jsonl").exists()


@pytest.mark.parametrize(
    ("verdict", "expected"),
    [
        ("UNIT", "SINGULAR_UNIT_UNCERTIFIED"),
        ("NONUNIT", "NONUNIT"),
        ("TIMEOUT", "TIMEOUT"),
        ("ERROR", "ERROR"),
    ],
)
def test_singular_classification_is_fail_closed(verdict: str, expected: str) -> None:
    assert screen._singular_classification(verdict) == expected


def test_resource_caps_and_unknown_verdict_fail_closed(tmp_path: Path) -> None:
    with pytest.raises(screen.StructuralScreenError, match="1..24"):
        screen.run_driver(CURRENT_RUN, tmp_path / "workers", workers=25)
    with pytest.raises(screen.StructuralScreenError, match="exactly 1"):
        screen.run_driver(CURRENT_RUN, tmp_path / "threads", solver_threads=2)
    with pytest.raises(screen.StructuralScreenError, match="unsupported"):
        screen._singular_classification("PROVED_INFEASIBLE")
