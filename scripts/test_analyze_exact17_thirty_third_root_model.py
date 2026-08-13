from __future__ import annotations

import hashlib
import importlib.util
import json
import sys
from dataclasses import replace
from pathlib import Path

import pytest

ROOT = Path(__file__).resolve().parents[1]
SCRIPT = ROOT / "scripts" / "analyze_exact17_thirty_third_root_model.py"


def module():
    spec = importlib.util.spec_from_file_location("exact17_child33_analyzer", SCRIPT)
    assert spec and spec.loader
    loaded = importlib.util.module_from_spec(spec)
    sys.modules[spec.name] = loaded
    spec.loader.exec_module(loaded)
    return loaded


def model_fixture(tmp_path: Path, *, assignment: list[int] | None = None, job_id: str | None = None) -> tuple[Path, object]:
    analyzer = module()
    assignment = assignment or [1, -2]
    payload = {
        "cnf_sha256": "c" * 64,
        "completion_identity_hash": "i" * 64,
        "job_id": job_id or "job",
        "manifest_sha256": "m" * 64,
        "model": {
            "assignment": assignment,
            "backend": "cadical",
            "job_id": job_id or "job",
            "num_assigned": 2,
            "result": "SAT",
            "solver_profile": "sat",
        },
        "replay": {"clauses_checked": 1, "satisfies_all": True},
        "schema": "p97-exact17-child33-piqd-model/v3",
    }
    path = tmp_path / "model.json"
    path.write_text(json.dumps(payload, separators=(",", ":")))
    digest = hashlib.sha256(path.read_bytes()).hexdigest()
    binding = replace(
        analyzer.PRODUCTION,
        cnf_sha256="c" * 64,
        manifest_sha256="m" * 64,
        model_sha256=digest,
        job_id=job_id or "job",
        identity_hash="i" * 64,
        variables=2,
        clauses=1,
    )
    return path, binding


def test_model_wrapper_and_assignment_authenticate(tmp_path: Path) -> None:
    analyzer = module()
    path, binding = model_fixture(tmp_path)
    assignment, digest = analyzer.load_model(path, binding)
    assert assignment == {1: True, 2: False}
    assert digest == binding.model_sha256


def test_crossed_job_is_rejected(tmp_path: Path) -> None:
    analyzer = module()
    path, binding = model_fixture(tmp_path, job_id="job-a")
    with pytest.raises(ValueError, match="model job mismatch"):
        analyzer.load_model(path, replace(binding, job_id="job-b"))


def test_crossed_model_hash_is_rejected(tmp_path: Path) -> None:
    analyzer = module()
    path, binding = model_fixture(tmp_path)
    with pytest.raises(ValueError, match="model wrapper SHA mismatch"):
        analyzer.load_model(path, replace(binding, model_sha256="d" * 64))


def test_crossed_schema_is_rejected(tmp_path: Path) -> None:
    analyzer = module()
    path, binding = model_fixture(tmp_path)
    payload = json.loads(path.read_text())
    payload["schema"] = "wrong/v1"
    path.write_text(json.dumps(payload, separators=(",", ":")))
    binding = replace(binding, model_sha256=hashlib.sha256(path.read_bytes()).hexdigest())
    with pytest.raises(ValueError, match="wrong model schema"):
        analyzer.load_model(path, binding)


def test_crossed_assignment_is_rejected(tmp_path: Path) -> None:
    analyzer = module()
    path, binding = model_fixture(tmp_path, assignment=[1, 1])
    with pytest.raises(ValueError, match="not unique"):
        analyzer.load_model(path, binding)


def test_replay_rejects_wrong_clause_count(tmp_path: Path) -> None:
    analyzer = module()
    cnf = tmp_path / "model.cnf"
    cnf.write_text("p cnf 2 2\n1 0\n")
    binding = replace(
        analyzer.PRODUCTION,
        cnf_sha256=hashlib.sha256(cnf.read_bytes()).hexdigest(),
        variables=2,
        clauses=2,
    )
    with pytest.raises(ValueError, match="dimensions/replay count"):
        analyzer.replay_cnf(cnf, {1: True, 2: False}, binding)


def test_inventory_is_not_called_before_complete_replay(tmp_path: Path, monkeypatch: pytest.MonkeyPatch) -> None:
    analyzer = module()
    cnf = tmp_path / "model.cnf"
    cnf.write_text("p cnf 2 2\n1 0\n")
    path, binding = model_fixture(tmp_path)
    binding = replace(
        binding,
        cnf_sha256=hashlib.sha256(cnf.read_bytes()).hexdigest(),
        clauses=2,
    )
    called = False

    monkeypatch.setattr(analyzer, "validate_manifest", lambda *_args: ({}, binding.manifest_sha256))
    monkeypatch.setattr(analyzer, "validate_final", lambda *_args: ({}, binding.final_sha256))
    monkeypatch.setattr(analyzer, "load_model", lambda *_args: ({1: True, 2: False}, binding.model_sha256))

    def forbidden(_decoded: dict[str, object]) -> dict[str, object]:
        nonlocal called
        called = True
        raise AssertionError("inventory ran before replay completion")

    monkeypatch.setattr(analyzer, "inventory", forbidden)
    with pytest.raises(ValueError, match="dimensions/replay count"):
        analyzer.analyze(cnf, path, path, path, path, binding)
    assert called is False


def test_inventory_labels_unchecked_matches_as_candidates(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    analyzer = module()
    candidate = {
        "stage": "diagnostic",
        "lean_consumer": "Example.consumer",
    }
    monkeypatch.setattr(
        analyzer.producer_bank,
        "scan_all_formalized_cores",
        lambda *_args: iter((candidate,)),
    )
    decoded = {
        "rows": {str(center): [] for center in range(analyzer.POINT_COUNT)},
        "named_orders": [0],
    }
    result = analyzer.inventory(decoded)
    assert result["classification"] == "DIAGNOSTIC_CANDIDATES"
    assert result["antecedent_validation"] == "NOT_REPLAYED"
    assert result["candidate_count"] == 1
    assert result["candidates"] == [candidate]
    assert "hit_count" not in result
    assert "hits" not in result
