"""Focused tests for the Wave 7 Stage-A numerical diagnostic."""

from __future__ import annotations

import json
import sys
from pathlib import Path

import pytest

sys.path.insert(0, str(Path(__file__).resolve().parent))

import b1_wave7_stagea_order_cell as wave7


def sample_parameters() -> list[float]:
    return [-0.8, -0.5, -0.2, 0.3, 0.7, 1.0, 0.2, -0.3, 1.1, 0.4, 0.2, 1.2, -0.4, 0.8]


def test_fixed_order_and_parameterization() -> None:
    points = wave7.realize_points(sample_parameters())
    assert tuple(points) == wave7.ORDER
    physical, rows = wave7.decode_parameters(sample_parameters())
    assert physical["u1"] == 0.0
    assert len(physical) == 6
    assert len(rows) == 3
    assert len(wave7.evaluate_candidate(sample_parameters())["edge_slacks"]) == 16 * 14


def test_stereographic_map_and_guards() -> None:
    assert wave7.stereographic_point(0) == (1.0, 0.0)
    candidate = wave7.evaluate_candidate(sample_parameters())
    assert set(candidate["guard_slacks"]) == {
        "physical_parameter:d1<d2",
        "physical_parameter:d2<u0",
        "physical_parameter:u0<u1",
        "physical_parameter:u1<v0",
        "physical_parameter:v0<v1",
        "blocker_scale:Bc>1/2",
        "blocker_scale:Bu>1/2",
        "blocker_scale:Bv>1/2",
    }
    assert candidate["guard_slacks"]["blocker_scale:Bc>1/2"] == pytest.approx(0.5)


def test_bad_physical_order_and_k_are_negative() -> None:
    parameters = sample_parameters()
    parameters[1] = parameters[0]
    parameters[5] = 0.5
    candidate = wave7.evaluate_candidate(parameters)
    assert candidate["guard_slacks"]["physical_parameter:d1<d2"] == 0.0
    assert candidate["guard_slacks"]["blocker_scale:Bc>1/2"] == 0.0
    assert candidate["margin"] <= 0.0


def test_optimizer_smoke_is_monkeypatchable(monkeypatch: pytest.MonkeyPatch) -> None:
    class Result:
        x = sample_parameters()
        fun = -0.25
        success = True
        message = "mock"

    calls: list[dict[str, object]] = []

    def fake_optimizer(function, bounds, **kwargs):
        calls.append({"bounds": bounds, **kwargs})
        assert function(sample_parameters()) == pytest.approx(
            -wave7.evaluate_candidate(sample_parameters())["margin"]
        )
        return Result()

    monkeypatch.setattr(wave7, "differential_evolution", fake_optimizer)
    records = wave7.run_optimization((7, 11), iterations=2, popsize=3)
    assert [record["seed"] for record in records] == [7, 11]
    assert [call["seed"] for call in calls] == [7, 11]
    assert all(record["claim_status"] == "UNKNOWN" for record in records)


def test_documents_checksum_and_no_overwrite(tmp_path: Path) -> None:
    records = [{"seed": 1, "margin": -1.0, "claim_status": "UNKNOWN", "candidate": {}}]
    documents = wave7.build_documents(records, seeds=(1,), iterations=1, popsize=1)
    wave7.write_documents(documents, output_root=tmp_path)
    wave7.verify_checksum_ledger(tmp_path)
    result = json.loads((tmp_path / wave7.RESULT_REL).read_text())
    assert result["claim_status"] == "UNKNOWN"
    assert result["claim_boundary"]["failure"].startswith("UNKNOWN")
    with pytest.raises(FileExistsError):
        wave7.write_documents(documents, output_root=tmp_path)


def test_verify_only_cli_does_not_optimize(tmp_path: Path, monkeypatch: pytest.MonkeyPatch) -> None:
    documents = wave7.build_documents([], seeds=(0,), iterations=1, popsize=1)
    wave7.write_documents(documents, output_root=tmp_path)
    monkeypatch.setattr(wave7, "run_optimization", lambda *args, **kwargs: pytest.fail("optimized"))
    wave7.main(("--output-root", str(tmp_path), "--verify-only"))
