"""Contract tests for the read-only Gate E pin/config checker."""

from __future__ import annotations

import json
import shutil
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))

import scripts.check_lean_toolchain as subject


def _fixture(tmp_path: Path) -> Path:
    repo = tmp_path / "repo"
    comparator = repo / "comparator"
    comparator.mkdir(parents=True)
    source_comparator = Path(__file__).resolve().parents[1] / "comparator"
    for name in ("config.json", "Challenge.lean", "Solution.lean", "axiom-audit.lean"):
        shutil.copy2(source_comparator / name, comparator / name)
    (repo / "lean").mkdir()
    for relative in ("lean-toolchain", "lean/lean-toolchain", "lakefile.toml", "lake-manifest.json"):
        source = Path(__file__).resolve().parents[1] / ("lean/" + relative if relative.startswith("lake") else relative)
        target = repo / ("lean/" + relative if relative.startswith("lake") else relative)
        target.parent.mkdir(parents=True, exist_ok=True)
        shutil.copy2(source, target)
    for module in ("Erdos9796", "Erdos9796Proof"):
        path = repo / "lean" / f"{module}.lean"
        path.write_text("", encoding="utf-8")
    (repo / "comparator" / "axiom-audit.lean").write_text("", encoding="utf-8")
    return repo


def _copy_config(repo: Path) -> Path:
    config = Path(__file__).resolve().parents[1] / "comparator/toolchain-pins.json"
    shutil.copy2(config, repo / "comparator/toolchain-pins.json")
    return repo / "comparator/toolchain-pins.json"


def test_current_configuration_passes() -> None:
    repo = Path(__file__).resolve().parents[1]
    assert subject.validate(repo) == []


def test_toolchain_drift_is_rejected(tmp_path: Path) -> None:
    repo = _fixture(tmp_path)
    _copy_config(repo)
    (repo / "lean-toolchain").write_text("leanprover/lean4:v4.27.0\n", encoding="utf-8")
    errors = subject.validate(repo)
    assert "lean-toolchain files disagree" in errors


def test_missing_direct_requirement_is_rejected(tmp_path: Path) -> None:
    repo = _fixture(tmp_path)
    _copy_config(repo)
    lakefile = repo / "lean/lakefile.toml"
    text = lakefile.read_text(encoding="utf-8")
    start = text.index('\n[[require]]\nname = "formal_conjectures"')
    end = text.index("\n[[lean_lib]]", start)
    lakefile.write_text(
        text[:start] + text[end:],
        encoding="utf-8",
    )
    errors = subject.validate(repo)
    assert any("exactly mathlib and formal_conjectures" in error for error in errors)


def test_duplicate_manifest_package_is_rejected(tmp_path: Path) -> None:
    repo = _fixture(tmp_path)
    _copy_config(repo)
    path = repo / "lean/lake-manifest.json"
    manifest = json.loads(path.read_text(encoding="utf-8"))
    manifest["packages"].append(dict(manifest["packages"][0]))
    path.write_text(json.dumps(manifest), encoding="utf-8")
    errors = subject.validate(repo)
    assert any("duplicate manifest package name: formal_conjectures" in error for error in errors)


def test_missing_default_library_is_rejected(tmp_path: Path) -> None:
    repo = _fixture(tmp_path)
    _copy_config(repo)
    lakefile = repo / "lean/lakefile.toml"
    text = lakefile.read_text(encoding="utf-8")
    start = text.index('\n[[lean_lib]]\nname = "Erdos9796Proof"')
    end = text.index("\n# Comparator auditability gate", start)
    lakefile.write_text(text[:start] + text[end:], encoding="utf-8")
    errors = subject.validate(repo)
    assert "missing default library: Erdos9796Proof" in errors


def test_wrong_resolved_revision_is_rejected(tmp_path: Path) -> None:
    repo = _fixture(tmp_path)
    _copy_config(repo)
    path = repo / "lean/lake-manifest.json"
    manifest = json.loads(path.read_text(encoding="utf-8"))
    next(item for item in manifest["packages"] if item["name"] == "mathlib")["rev"] = "0" * 40
    path.write_text(json.dumps(manifest), encoding="utf-8")
    errors = subject.validate(repo)
    assert any("manifest package mathlib rev" in error for error in errors)


def test_non_git_manifest_package_is_rejected(tmp_path: Path) -> None:
    repo = _fixture(tmp_path)
    _copy_config(repo)
    path = repo / "lean/lake-manifest.json"
    manifest = json.loads(path.read_text(encoding="utf-8"))
    next(item for item in manifest["packages"] if item["name"] == "mathlib")["type"] = "path"
    path.write_text(json.dumps(manifest), encoding="utf-8")
    errors = subject.validate(repo)
    assert "manifest package mathlib is not a git package" in errors


def test_manifest_input_revision_drift_is_rejected(tmp_path: Path) -> None:
    repo = _fixture(tmp_path)
    _copy_config(repo)
    path = repo / "lean/lake-manifest.json"
    manifest = json.loads(path.read_text(encoding="utf-8"))
    next(item for item in manifest["packages"] if item["name"] == "mathlib")["inputRev"] = "drifted"
    path.write_text(json.dumps(manifest), encoding="utf-8")
    errors = subject.validate(repo)
    assert "manifest package mathlib inputRev does not match the direct requirement" in errors


def test_direct_source_scope_drift_is_rejected(tmp_path: Path) -> None:
    repo = _fixture(tmp_path)
    _copy_config(repo)
    lakefile = repo / "lean/lakefile.toml"
    lakefile.write_text(
        lakefile.read_text(encoding="utf-8").replace(
            'scope = "leanprover-community"', 'scope = "wrong-scope"'
        ),
        encoding="utf-8",
    )
    errors = subject.validate(repo)
    assert "Lake requirement mathlib scope is not pinned" in errors
