from __future__ import annotations

import hashlib
import sys
from pathlib import Path

import pytest

ROOT = Path(__file__).resolve().parents[3]
sys.path.insert(0, str(ROOT / "scripts"))
import export_exact17_forty_fifth_root as exporter
import validate_exact17_forty_fifth_model_refinements_export as validator


def _fixture_spec(tmp_path: Path) -> tuple[exporter.ExportPaths, validator.ExportSpec, bytes]:
    parent = tmp_path / "parent.cnf"
    model = tmp_path / "model.json"
    final = tmp_path / "final.json"
    lean_root = tmp_path / "root.lean"
    lean_export = tmp_path / "export.lean"
    parent_bytes = b"p cnf 308 1\n1 0\n"
    candidate_bytes = b"p cnf 308 5\n1 0\n2 0\n3 0\n4 0\n5 0\n"
    parent.write_bytes(parent_bytes)
    model.write_bytes(b"model")
    final.write_bytes(b"final")
    lean_root.write_bytes(b"root")
    lean_export.write_bytes(b"export")
    paths = exporter.ExportPaths(
        parent=parent,
        model=model,
        final=final,
        lean_root=lean_root,
        lean_export=lean_export,
        child=tmp_path / "new.cnf",
        receipt=tmp_path / "new-receipt.json",
    )
    digest = hashlib.sha256(parent_bytes).hexdigest()
    spec = validator.ExportSpec(
        child_sha256=hashlib.sha256(candidate_bytes).hexdigest(),
        child_bytes=len(candidate_bytes),
        parent_sha256=digest,
        parent_bytes=len(parent_bytes),
        parent_clauses=1,
        model_sha256="model-hash",
        model_manifest_sha256="manifest-hash",
        model_job_id="fixture-job",
        final_sha256="final-hash",
        lean_root_sha256="root-hash",
        lean_export_sha256="export-hash",
    )
    return paths, spec, candidate_bytes


def _stream_fixture(tmp_path: Path, *, parent: tuple[tuple[int, ...], ...] = ((1, 2),), suffix=None, child_header: int = 5, spec_child_clauses: int | None = None):
    suffix = suffix or ((-1, -2), (-3, -4), (-5, -6), (-7, -8))
    parent_raw = b"p cnf 308 1\n" + b"".join((" ".join(map(str, clause)) + " 0\n").encode() for clause in parent)
    child_raw = f"p cnf 308 {child_header}\n".encode() + parent_raw.split(b"\n", 1)[1] + b"".join((" ".join(map(str, clause)) + " 0\n").encode() for clause in suffix)
    parent_path = tmp_path / "parent.cnf"
    child_path = tmp_path / "child.cnf"
    parent_path.write_bytes(parent_raw)
    child_path.write_bytes(child_raw)
    spec = validator.ExportSpec(
        child_sha256=hashlib.sha256(child_raw).hexdigest(),
        child_bytes=len(child_raw),
        child_clauses=child_header if spec_child_clauses is None else spec_child_clauses,
        parent_sha256=hashlib.sha256(parent_raw).hexdigest(),
        parent_bytes=len(parent_raw),
        parent_clauses=len(parent),
        model_sha256="model",
        model_manifest_sha256="manifest",
        model_job_id="job",
        final_sha256="final",
        lean_root_sha256="root",
        lean_export_sha256="export",
    )
    return parent_path, child_path, spec, tuple(suffix)


def test_authenticated_constants_and_suffix_reject_child44_model():
    assert validator.PARENT_CLAUSES == 5_848_820
    assert validator.CHILD_CLAUSES == 5_848_824
    assert validator.CHILD_BYTES == 291_704_992
    assert validator.LEAN_ROOT_SHA256 == "f9238553222414f52c2282ccdda7764506e69aef4eca710263d7bd6930b6d7f2"
    assert validator.LEAN_EXPORT_SHA256 == "d2eb848ccd9ca3138d3bc97c35dee2f51f7546edfefed54104a21bd84b18ba38"
    assert len(validator.EXPECTED_SUFFIX) == 4
    assert len(set(validator.EXPECTED_SUFFIX)) == 4
    assert validator.EXPECTED_PARENT_SUBSUMED_SUFFIX_INDICES == (1,)
    assignment = validator._authenticated_model(validator.MODEL_PATH, validator.PRODUCTION_SPEC)
    rejected = tuple(
        index for index, clause in enumerate(validator.EXPECTED_SUFFIX, 1)
        if not validator._satisfied(clause, assignment)
    )
    assert rejected == validator.MODEL_REJECTED_SUFFIX_INDICES == (3,)


def test_export_isolated_and_ledger_last(monkeypatch, tmp_path: Path):
    paths, spec, candidate = _fixture_spec(tmp_path)
    calls: list[str] = []

    def fake_lean(output: Path) -> None:
        calls.append("lean")
        output.write_bytes(candidate)

    monkeypatch.setattr(exporter, "_run_lean", fake_lean)
    monkeypatch.setattr(exporter, "validate_export", lambda *args, **kwargs: {"final": {"status": "fixture"}})
    old = tmp_path / "old-child44.cnf"
    old.write_bytes(b"old Child44 artifact")
    receipt = exporter.export_child45(paths, spec=spec)
    assert receipt["status"] == "PASS"
    assert paths.child.read_bytes() == candidate
    assert paths.receipt.is_file()
    assert old.read_bytes() == b"old Child44 artifact"
    with pytest.raises(FileExistsError, match="Child45 root"):
        exporter.export_child45(paths, spec=spec)
    assert calls == ["lean"]


def test_export_rejects_symlink_target_before_lean(monkeypatch, tmp_path: Path):
    paths, spec, _candidate = _fixture_spec(tmp_path)
    target = tmp_path / "target.cnf"
    target.write_bytes(b"protected")
    paths.child.symlink_to(target)
    called = False

    def forbidden(_output: Path) -> None:
        nonlocal called
        called = True

    monkeypatch.setattr(exporter, "_run_lean", forbidden)
    with pytest.raises(FileExistsError, match="Child45 root"):
        exporter.export_child45(paths, spec=spec)
    assert not called
    assert target.read_bytes() == b"protected"


def test_streaming_accepts_exact_prefix_and_suffix(tmp_path: Path):
    parent, child, spec, suffix = _stream_fixture(tmp_path)
    result = validator._stream_validate_dimacs(parent, child, spec, expected_suffix=suffix)
    assert result["suffix"] == suffix
    assert result["parent_bytes"] == parent.stat().st_size
    assert result["child_bytes"] == child.stat().st_size


def test_streaming_rejects_header_only_count_mismatch(tmp_path: Path):
    parent, child, spec, suffix = _stream_fixture(tmp_path, child_header=6, spec_child_clauses=5)
    with pytest.raises(ValueError, match="header count"):
        validator._stream_validate_dimacs(parent, child, spec, expected_suffix=suffix)


def test_streaming_rejects_prefix_drift_and_extra_or_missing_suffix(tmp_path: Path):
    parent, child, spec, suffix = _stream_fixture(tmp_path)
    child.write_bytes(child.read_bytes().replace(b"1 2 0\n", b"1 3 0\n", 1))
    with pytest.raises(ValueError, match="prefix"):
        validator._stream_validate_dimacs(parent, child, spec, expected_suffix=suffix)
    parent, child, spec, suffix = _stream_fixture(tmp_path, child_header=4, suffix=suffix[:3])
    with pytest.raises(ValueError, match="cardinality"):
        validator._stream_validate_dimacs(parent, child, spec, expected_suffix=suffix)
    parent, child, spec, suffix = _stream_fixture(tmp_path, child_header=6, suffix=(
        (-1, -2), (-3, -4), (-5, -6), (-7, -8), (-9, -10)
    ))
    with pytest.raises(ValueError, match="cardinality"):
        validator._stream_validate_dimacs(parent, child, spec, expected_suffix=suffix)


def test_streaming_rejects_suffix_order_and_parent_subsumption(tmp_path: Path):
    parent, child, spec, suffix = _stream_fixture(tmp_path, suffix=(
        (-3, -4), (-1, -2), (-5, -6), (-7, -8)
    ))
    with pytest.raises(ValueError, match="ordering"):
        validator._stream_validate_dimacs(parent, child, spec, expected_suffix=(
            (-1, -2), (-3, -4), (-5, -6), (-7, -8)
        ))
    parent, child, spec, suffix = _stream_fixture(tmp_path, parent=((1,),), suffix=((1, 2), (-3, -4), (-5, -6), (-7, -8)))
    with pytest.raises(ValueError, match="subsumed"):
        validator._stream_validate_dimacs(parent, child, spec, expected_suffix=suffix)


def test_streaming_rejects_symlink_without_following(tmp_path: Path):
    parent, child, spec, suffix = _stream_fixture(tmp_path)
    target = tmp_path / "real-child.cnf"
    target.write_bytes(child.read_bytes())
    child.unlink()
    child.symlink_to(target)
    with pytest.raises((ValueError, validator.UnprovisionedError)):
        validator._stream_validate_dimacs(parent, child, spec, expected_suffix=suffix)
