from __future__ import annotations

import subprocess
from pathlib import Path

import pytest

from census.p97_search.freshthird_qfiber_three_carrier_provenance_v2 import (
    SourceSnapshotError,
    archive_nonclean_snapshot_rows,
    build_snapshot,
    verify_snapshot,
)


def _git(repo: Path, *args: str) -> None:
    subprocess.run(["git", *args], cwd=repo, check=True, capture_output=True, text=True)


def _repo(tmp_path: Path) -> Path:
    repo = tmp_path / "repo"
    (repo / "lean" / "Demo").mkdir(parents=True)
    (repo / "lean-toolchain").write_text("leanprover/lean4:v4.19.0\n")
    (repo / "lean" / "lakefile.toml").write_text("name = 'demo'\n")
    (repo / "lean" / "lake-manifest.json").write_text('{"packages":[]}\n')
    (repo / "lean" / "FreshThird.lean").write_text(
        "import Demo.Local\nimport External.NotThere\n"
    )
    (repo / "lean" / "Demo" / "Local.lean").write_text("import Demo.Nested\n")
    (repo / "lean" / "Demo" / "Nested.lean").write_text("-- terminal\n")
    (repo / "query.py").write_text("QUERY = 1\n")
    (repo / "cnf.py").write_text("CNF = 1\n")
    (repo / "cegar.py").write_text("CEGAR = 1\n")
    _git(repo, "init", "-q")
    _git(repo, "config", "user.name", "Test")
    _git(repo, "config", "user.email", "test@example.invalid")
    _git(repo, "add", ".")
    _git(repo, "commit", "-qm", "initial")
    return repo


def _snapshot(repo: Path) -> dict[str, object]:
    return build_snapshot(
        repo,
        "lean/FreshThird.lean",
        query_path="query.py",
        cnf_adapter_path="cnf.py",
        cegar_runner_path="cegar.py",
    )


def test_recursive_imports_external_names_and_sorted_aggregate(tmp_path: Path) -> None:
    repo = _repo(tmp_path)
    first = _snapshot(repo)
    second = _snapshot(repo)
    assert first == second
    assert first["local_lean_paths"] == [
        "lean/Demo/Local.lean",
        "lean/Demo/Nested.lean",
        "lean/FreshThird.lean",
    ]
    assert first["external_imports"] == ["External.NotThere"]
    rows = first["rows"]
    assert isinstance(rows, list)
    assert [row["path"] for row in rows] == sorted(row["path"] for row in rows)
    assert {row["kind"] for row in rows} >= {
        "lean",
        "python_query",
        "python_cnf_adapter",
        "python_cegar_runner",
        "lean-toolchain",
        "lakefile",
        "lake-manifest",
    }


def test_dirty_and_untracked_statuses_change_identity(tmp_path: Path) -> None:
    repo = _repo(tmp_path)
    clean = _snapshot(repo)
    (repo / "lean" / "Demo" / "Local.lean").write_text("import Demo.Nested\n-- dirty\n")
    dirty = _snapshot(repo)
    clean_local = next(
        row for row in clean["rows"] if row["path"] == "lean/Demo/Local.lean"
    )
    dirty_local = next(
        row for row in dirty["rows"] if row["path"] == "lean/Demo/Local.lean"
    )
    assert clean_local["porcelain_status"] == ""
    assert dirty_local["porcelain_status"].startswith(" M")
    assert clean["aggregate_sha256"] != dirty["aggregate_sha256"]

    (repo / "lean" / "Demo" / "New.lean").write_text("-- untracked\n")
    (repo / "lean" / "FreshThird.lean").write_text(
        "import Demo.Local\nimport Demo.New\nimport External.NotThere\n"
    )
    untracked = _snapshot(repo)
    new_row = next(
        row for row in untracked["rows"] if row["path"] == "lean/Demo/New.lean"
    )
    assert new_row["git_blob_sha1"] == "UNTRACKED"
    assert new_row["porcelain_status"].startswith("??")


def test_missing_or_unreadable_inputs_fail_closed(tmp_path: Path) -> None:
    repo = _repo(tmp_path)
    with pytest.raises(SourceSnapshotError, match="missing source file"):
        build_snapshot(repo, "lean/Missing.lean")
    with pytest.raises(SourceSnapshotError, match="missing source file"):
        build_snapshot(repo, "lean/FreshThird.lean", query_path="missing.py")


def test_snapshot_verification_and_nonclean_archive(tmp_path: Path) -> None:
    repo = _repo(tmp_path)
    clean = _snapshot(repo)
    assert verify_snapshot(repo, clean) == clean
    (repo / "query.py").write_text("QUERY = 2\n")
    with pytest.raises(SourceSnapshotError, match="drifted"):
        verify_snapshot(repo, clean)

    dirty = _snapshot(repo)
    archive = tmp_path / "archive"
    manifest = archive_nonclean_snapshot_rows(repo, dirty, archive)
    assert manifest["archived"] == [
        {
            "path": "query.py",
            "sha256": next(
                row["sha256"] for row in dirty["rows"] if row["path"] == "query.py"
            ),
            "porcelain_status": " M query.py",
        }
    ]
    assert (archive / "query.py").read_text() == "QUERY = 2\n"


def test_snapshot_verification_rejects_stale_head_with_identical_inputs(
    tmp_path: Path,
) -> None:
    repo = _repo(tmp_path)
    expected = _snapshot(repo)
    (repo / "README.md").write_text("unrelated commit\n")
    _git(repo, "add", "README.md")
    _git(repo, "commit", "-qm", "unrelated")

    actual = _snapshot(repo)
    assert actual["content_aggregate_sha256"] == expected["content_aggregate_sha256"]
    assert actual["repo_head"] != expected["repo_head"]
    with pytest.raises(SourceSnapshotError, match="source snapshot drifted"):
        verify_snapshot(repo, expected)
