"""Focused custody-final and publication-directory adversarial tests."""

from __future__ import annotations

import hashlib
import json
import os
from dataclasses import replace
from pathlib import Path

import export_exact17_forty_fourth_root as exporter
import pytest
import validate_exact17_forty_fourth_model_refinements_export as validator
from validate_exact17_forty_fourth_model_refinements_export import (
    FINAL_PATH,
    MODEL_PATH,
    PRODUCTION_SPEC,
    authenticated_final,
    authenticated_model,
)


def test_authenticated_final_binds_job_result_cnf_manifest_and_completion() -> None:
    record = authenticated_final()
    assert record["sha256"] == PRODUCTION_SPEC.final_sha256
    assert record["job_id"] == PRODUCTION_SPEC.model_job_id
    assert record["result"] == "SAT"
    assert record["cnf_sha256"] == PRODUCTION_SPEC.parent_sha256
    assert record["manifest_sha256"] == PRODUCTION_SPEC.model_manifest_sha256
    assert record["completion_status"] == "completed"
    assert record["model_check"] == "SATISFIED"


def test_final_pin_disagreement_is_rejected() -> None:
    spec = replace(PRODUCTION_SPEC, final_sha256="0" * 64)
    with pytest.raises(ValueError, match="final hash drifted"):
        authenticated_final(FINAL_PATH, spec)


def test_model_pin_disagreement_is_rejected() -> None:
    spec = replace(PRODUCTION_SPEC, model_sha256="0" * 64)
    with pytest.raises(ValueError, match="model hash drifted"):
        authenticated_model(MODEL_PATH, spec)


def test_tampered_final_is_rejected_even_when_rehashed(tmp_path: Path) -> None:
    payload = json.loads(FINAL_PATH.read_text())
    payload["completion_status"]["result"] = "UNSAT"
    tampered = tmp_path / "tampered-final.json"
    tampered.write_text(json.dumps(payload, indent=2, sort_keys=True) + "\n")
    spec = replace(PRODUCTION_SPEC, final_sha256=hashlib.sha256(tampered.read_bytes()).hexdigest())
    analysis = validator._stable_json(validator.ANALYSIS_PATH, PRODUCTION_SPEC)
    with pytest.raises(ValueError, match="completion binding drifted"):
        authenticated_final(tampered, spec, analysis)


def test_tampered_final_binding_metadata_is_rejected_when_rehashed(tmp_path: Path) -> None:
    payload = json.loads(FINAL_PATH.read_text())
    payload["binding"]["project"] = "wrong-project"
    tampered = tmp_path / "tampered-final.json"
    tampered.write_text(json.dumps(payload, indent=2, sort_keys=True) + "\n")
    spec = replace(PRODUCTION_SPEC, final_sha256=hashlib.sha256(tampered.read_bytes()).hexdigest())
    analysis = validator._stable_json(validator.ANALYSIS_PATH, PRODUCTION_SPEC)
    with pytest.raises(ValueError, match="final binding drifted"):
        authenticated_final(tampered, spec, analysis)


def test_extra_nested_completion_key_is_rejected_when_rehashed(tmp_path: Path) -> None:
    payload = json.loads(FINAL_PATH.read_text())
    payload["completion_status"]["unexpected"] = True
    tampered = tmp_path / "tampered-final.json"
    tampered.write_text(json.dumps(payload, indent=2, sort_keys=True) + "\n")
    spec = replace(PRODUCTION_SPEC, final_sha256=hashlib.sha256(tampered.read_bytes()).hexdigest())
    analysis = validator._stable_json(validator.ANALYSIS_PATH, PRODUCTION_SPEC)
    with pytest.raises(ValueError, match="completion status schema drifted"):
        authenticated_final(tampered, spec, analysis)


def test_duplicate_final_json_key_is_rejected_when_rehashed(tmp_path: Path) -> None:
    raw = FINAL_PATH.read_bytes().replace(b"{", b'{"schema":"ambiguous",', 1)
    tampered = tmp_path / "duplicate-final.json"
    tampered.write_bytes(raw)
    spec = replace(PRODUCTION_SPEC, final_sha256=hashlib.sha256(raw).hexdigest())
    analysis = validator._stable_json(validator.ANALYSIS_PATH, PRODUCTION_SPEC)
    with pytest.raises(ValueError, match="duplicate JSON key: schema"):
        authenticated_final(tampered, spec, analysis)


def test_duplicate_nested_model_json_key_is_rejected_when_rehashed(tmp_path: Path) -> None:
    raw = MODEL_PATH.read_bytes().replace(b'"model": {', b'"model": {"result":"ambiguous",', 1)
    tampered = tmp_path / "duplicate-model.json"
    tampered.write_bytes(raw)
    spec = replace(PRODUCTION_SPEC, model_sha256=hashlib.sha256(raw).hexdigest())
    analysis = validator._stable_json(validator.ANALYSIS_PATH, PRODUCTION_SPEC)
    with pytest.raises(ValueError, match="duplicate JSON key: result"):
        authenticated_model(tampered, spec, analysis)


def test_symlinked_publication_parent_is_rejected(tmp_path: Path) -> None:
    target = tmp_path / "real"
    target.mkdir()
    link = tmp_path / "published"
    link.symlink_to(target, target_is_directory=True)
    with pytest.raises(ValueError, match="publication parent"):
        exporter._open_publication_dir(link)


def test_validate_export_uses_explicit_final_path(tmp_path: Path, monkeypatch: pytest.MonkeyPatch) -> None:
    parent = tmp_path / "parent.cnf"
    child = tmp_path / "child.cnf"
    model = tmp_path / "model.json"
    final = tmp_path / "final.json"
    for path in (parent, child, model, final):
        path.write_text("fixture")

    class SeenFinal(RuntimeError):
        pass

    monkeypatch.setattr(validator, "validate_sources", lambda _spec: None)
    monkeypatch.setattr(validator, "_stable_json", lambda _path, _spec: {"provenance": {}})
    monkeypatch.setattr(validator, "authenticated_model", lambda *_args: {})

    def capture(path: Path, *_args: object) -> dict[str, object]:
        assert path == final
        raise SeenFinal

    monkeypatch.setattr(validator, "authenticated_final", capture)
    with pytest.raises(SeenFinal):
        validator.validate_export(parent, child, model, final_path=final)


def test_live_export_uses_nofollow_compatible_workspace_temp(monkeypatch: pytest.MonkeyPatch) -> None:
    seen: dict[str, Path] = {}

    def fake_run(args: list[str], *, cwd: Path, check: bool) -> None:
        assert cwd == validator.ROOT / "lean"
        assert check is True
        output = Path(args[-1])
        seen["output"] = output
        output.write_text("p cnf 308 0\n")

    monkeypatch.setattr(validator.subprocess, "run", fake_run)
    monkeypatch.setattr(validator, "_read_cnf", lambda _path: ((), "digest", 12))

    clauses, digest = validator._live_export()

    assert clauses == ()
    assert digest == "digest"
    assert seen["output"].parent == validator.ROOT / "scratch" / "exact17-lean-to-sat"
    assert not seen["output"].exists()


def test_symlinked_final_custody_is_rejected(tmp_path: Path) -> None:
    link = tmp_path / "final.json"
    link.symlink_to(FINAL_PATH)
    with pytest.raises(ValueError, match="non-symlink"):
        authenticated_final(link)


def test_open_publication_dir_remains_bound_after_path_replacement(tmp_path: Path) -> None:
    original = tmp_path / "published"
    original.mkdir()
    replacement = tmp_path / "replacement"
    replacement.mkdir()
    descriptor = exporter._open_publication_dir(original)
    try:
        original.rename(tmp_path / "old")
        original.symlink_to(replacement, target_is_directory=True)
        assert os.fstat(descriptor).st_ino == os.stat(tmp_path / "old").st_ino
    finally:
        os.close(descriptor)
