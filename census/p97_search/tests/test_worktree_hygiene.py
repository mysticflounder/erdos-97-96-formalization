from __future__ import annotations

import hashlib
import importlib.util
import json
import os
import subprocess
import sys
from pathlib import Path
from typing import Any

import pytest

LANE = "lane-a"
OWNER = "agent-a"
CREATED = "2026-08-14T00:00:00Z"
SCRIPT = Path(__file__).parents[3] / "scripts" / "check_worktree_hygiene.py"
_SPEC = importlib.util.spec_from_file_location("check_worktree_hygiene", SCRIPT)
assert _SPEC is not None and _SPEC.loader is not None
_CHECKER = importlib.util.module_from_spec(_SPEC)
sys.modules[_SPEC.name] = _CHECKER
_SPEC.loader.exec_module(_CHECKER)

CARD_HEAD_SCHEMA = _CHECKER.CARD_HEAD_SCHEMA
CHECKPOINT_SCHEMA = _CHECKER.CHECKPOINT_SCHEMA
GENERATED_OUTPUT_CLASSES = _CHECKER.GENERATED_OUTPUT_CLASSES
PUBLICATION_LIMIT_BYTES = _CHECKER.PUBLICATION_LIMIT_BYTES
RUN_MANIFEST_SCHEMA = _CHECKER.RUN_MANIFEST_SCHEMA
canonical_json_bytes = _CHECKER.canonical_json_bytes
inspect_worktree = _CHECKER.inspect_worktree
manifest_self_hash = _CHECKER.manifest_self_hash


def _git(repo: Path, *args: str) -> bytes:
    return subprocess.run(
        ["git", *args], cwd=repo, check=True, capture_output=True
    ).stdout


def _repo(tmp_path: Path) -> Path:
    repo = tmp_path / "repo"
    repo.mkdir(parents=True)
    (repo / ".gitignore").write_text(".codex/\norphan.log\n", encoding="utf-8")
    (repo / "owned.py").write_text("VALUE = 1\n", encoding="utf-8")
    (repo / "foreign.py").write_text("VALUE = 1\n", encoding="utf-8")
    (repo / "source.txt").write_text("source\n", encoding="utf-8")
    _git(repo, "init", "-q")
    _git(repo, "config", "user.name", "Test")
    _git(repo, "config", "user.email", "test@example.invalid")
    _git(repo, "add", ".")
    _git(repo, "commit", "-qm", "initial")
    return repo


def _head(repo: Path) -> str:
    return _git(repo, "rev-parse", "HEAD").decode("ascii").strip()


def _sha(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def _write_checkpoint(
    repo: Path,
    *,
    owned: list[str] | None = None,
    generated: list[str] | None = None,
    durable: list[str] | None = None,
    transform: Any = None,
) -> Path:
    value = {
        "schema": CHECKPOINT_SCHEMA,
        "lane_id": LANE,
        "owner": OWNER,
        "base_head": _head(repo),
        "owned_paths": sorted(owned or []),
        "generated_roots": sorted(generated or []),
        "durable_paths": sorted(durable or []),
        "created_utc": CREATED,
        "manifest_sha256": "",
    }
    if transform is not None:
        transform(value)
    value["manifest_sha256"] = manifest_self_hash(value)
    path = repo / ".codex" / "worktree-checkpoints" / f"{LANE}.json"
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_bytes(canonical_json_bytes(value) + b"\n")
    return path


def _standard_run(
    repo: Path,
    *,
    run_id: str = "run-1",
    mutate: Any = None,
    recompute_hash: bool = True,
) -> str:
    root = f"scratch/runs/{LANE}/{run_id}"
    run_root = repo / root
    (run_root / "artifacts").mkdir(parents=True)
    (run_root / "events").mkdir()
    (run_root / "tmp").mkdir()
    (run_root / "artifacts" / "payload.log").write_text("payload\n", encoding="utf-8")
    digest = _sha(repo / "source.txt")
    value = {
        "schema": RUN_MANIFEST_SCHEMA,
        "lane_id": LANE,
        "run_id": run_id,
        "root": root,
        "owner": OWNER,
        "base_head": _head(repo),
        "output_classes": list(GENERATED_OUTPUT_CLASSES),
        "source_digests": {"source.txt": digest},
        "input_digests": {"source.txt": digest},
        "created_utc": CREATED,
        "manifest_sha256": "",
    }
    if mutate is not None:
        mutate(value)
    if recompute_hash:
        value["manifest_sha256"] = manifest_self_hash(value)
    (run_root / "run_manifest.json").write_bytes(canonical_json_bytes(value) + b"\n")
    return root


def _card_head_run(repo: Path, run_id: str = "compat-1") -> str:
    root = f"census/card_head/runs/{run_id}"
    run_root = repo / root
    (run_root / "events").mkdir(parents=True)
    (run_root / "events" / "000001.json").write_text("{}\n", encoding="utf-8")
    value = {
        "schema": CARD_HEAD_SCHEMA,
        "status": "PLANNED",
        "run_id": run_id,
        "created_utc": CREATED,
        "cardinality": 12,
        "profile": [5, 5, 5],
        "proof_tier": "PROVEN",
        "admissibility_contract": "p97_ahead_head_admissibility.v1",
        "cut_contract": "p97_ahead_proven_cuts_post_sub2.v1",
        "cut_contract_sha256": (
            "8e067c226a9e5fec0825d0f7461d84af3aca19baaba52d6faafcbd7d8be505cf"
        ),
        "resources": {"max_workers": 1, "nice": 10},
        "stops": {
            "wall_seconds": 1,
            "max_new_bank_rows": 1,
            "max_consecutive_shape_stale": 1,
        },
        "command": [
            "nice",
            "-n",
            "10",
            "uv",
            "run",
            "python",
            "-m",
            "census.card_head.runner",
            "execute",
            f"{root}/run_manifest.json",
        ],
        "artifact_dir": root,
        "source_digests": {"source.txt": _sha(repo / "source.txt")},
        "evidence_scope": (
            "EMPIRICALLY VERIFIED within one labeled finite card-head abstraction; "
            "not a geometric closure theorem"
        ),
    }
    (run_root / "run_manifest.json").write_bytes(canonical_json_bytes(value) + b"\n")
    return root


def _reasons(report: dict[str, Any]) -> set[str]:
    return {
        *(row["reason"] for row in report["entries"]),
        *(row["reason"] for row in report["issues"]),
    }


def test_root_spill_is_blocked_even_when_ignored(tmp_path: Path) -> None:
    repo = _repo(tmp_path)
    _write_checkpoint(repo)
    for name in ("orphan.log", "scratch.txt", "--help", "Loose.lean", "loose.py"):
        (repo / name).write_text("spill\n", encoding="utf-8")

    report = inspect_worktree(repo, lane=LANE)

    assert report["blocking"] is True
    by_path = {row["path"]: row["reason"] for row in report["entries"]}
    assert by_path["orphan.log"] == "UNTRACKED_ROOT_SPILL"
    assert by_path["scratch.txt"] == "UNTRACKED_ROOT_SPILL"
    assert by_path["--help"] == "UNTRACKED_ROOT_SPILL"
    assert by_path["Loose.lean"] == "UNTRACKED_ROOT_SPILL"
    assert by_path["loose.py"] == "UNTRACKED_ROOT_SPILL"


def test_staged_check_reports_foreign_untracked_backlog_without_blocking(
    tmp_path: Path,
) -> None:
    repo = _repo(tmp_path)
    _write_checkpoint(repo, owned=["owned.py"])
    (repo / "owned.py").write_text("VALUE = 2\n", encoding="utf-8")
    _git(repo, "add", "--", "owned.py")
    (repo / "Loose.lean").write_text("theorem pending : True := by trivial\n")

    report = inspect_worktree(repo, lane=LANE, staged=True)

    loose = next(row for row in report["entries"] if row["path"] == "Loose.lean")
    assert loose["reason"] == "UNTRACKED_ROOT_SPILL"
    assert loose["blocking"] is False
    assert report["blocking"] is False


def test_valid_standard_generated_root_is_allowed(tmp_path: Path) -> None:
    repo = _repo(tmp_path)
    root = _standard_run(repo)
    _write_checkpoint(repo, generated=[root])

    report = inspect_worktree(repo, lane=LANE)

    assert report["blocking"] is False
    generated = [
        row for row in report["entries"] if row["reason"] == "REGISTERED_GENERATED"
    ]
    assert generated
    assert all(row["blocking"] is False for row in generated)


def test_generated_root_rejects_members_outside_fixed_output_classes(
    tmp_path: Path,
) -> None:
    repo = _repo(tmp_path)
    root = _standard_run(repo)
    (repo / root / "loose.log").write_text("not registered\n", encoding="utf-8")
    _write_checkpoint(repo, generated=[root])

    report = inspect_worktree(repo, lane=LANE)

    assert report["blocking"] is True
    assert "DECLARED_SCOPE_INVALID" in _reasons(report)


@pytest.mark.parametrize("declaration", ["owned", "durable"])
def test_bulk_generated_output_cannot_be_relabelled_for_staging(
    tmp_path: Path, declaration: str
) -> None:
    repo = _repo(tmp_path)
    root = _standard_run(repo)
    payload = f"{root}/artifacts/payload.log"
    keyword = {declaration: [payload], "generated": [root]}
    _write_checkpoint(repo, **keyword)

    report = inspect_worktree(repo, lane=LANE)

    assert "CHECKPOINT_INVALID" in _reasons(report)
    assert report["blocking"] is True


@pytest.mark.parametrize(
    ("mode", "mutate", "recompute"),
    [
        ("missing", None, True),
        ("wrong-owner", lambda value: value.__setitem__("owner", "someone-else"), True),
        (
            "wrong-root",
            lambda value: value.__setitem__("root", "scratch/runs/lane-a/not-this-run"),
            True,
        ),
        (
            "changed-manifest",
            lambda value: value.__setitem__("owner", "tampered"),
            False,
        ),
    ],
)
def test_invalid_generated_manifests_fail_closed(
    tmp_path: Path, mode: str, mutate: Any, recompute: bool
) -> None:
    repo = _repo(tmp_path)
    root = f"scratch/runs/{LANE}/run-1"
    if mode == "missing":
        (repo / root).mkdir(parents=True)
    else:
        _standard_run(repo, mutate=mutate, recompute_hash=recompute)
    _write_checkpoint(repo, generated=[root])

    report = inspect_worktree(repo, lane=LANE)

    assert report["blocking"] is True
    assert "DECLARED_SCOPE_INVALID" in _reasons(report)


def test_durable_untracked_requires_exact_owner_declaration(tmp_path: Path) -> None:
    repo = _repo(tmp_path)
    report_path = repo / "docs" / "audit-report.md"
    report_path.parent.mkdir()
    report_path.write_text("evidence\n", encoding="utf-8")
    with (repo / ".git" / "info" / "exclude").open("a", encoding="utf-8") as handle:
        handle.write("docs/audit-report.md\n")
    _write_checkpoint(repo)

    blocked = inspect_worktree(repo, lane=LANE)
    assert any(
        row["path"] == "docs/audit-report.md" and row["reason"] == "DURABLE_UNTRACKED"
        for row in blocked["entries"]
    )

    _write_checkpoint(repo, durable=["docs/audit-report.md"])
    allowed = inspect_worktree(repo, lane=LANE)
    row = next(
        row for row in allowed["entries"] if row["path"] == "docs/audit-report.md"
    )
    assert row["reason"] == "OWNER_PATH"
    assert allowed["blocking"] is False


def test_foreign_tracked_dirt_is_report_only_but_foreign_staging_blocks(
    tmp_path: Path,
) -> None:
    repo = _repo(tmp_path)
    _write_checkpoint(repo, owned=["owned.py"])
    (repo / "foreign.py").write_text("VALUE = 2\n", encoding="utf-8")

    unstaged = inspect_worktree(repo, lane=LANE)
    foreign = next(row for row in unstaged["entries"] if row["path"] == "foreign.py")
    assert foreign["reason"] == "FOREIGN_DIRTY"
    assert foreign["blocking"] is False
    assert unstaged["blocking"] is False

    _git(repo, "add", "--", "foreign.py")
    staged = inspect_worktree(repo, lane=LANE, staged=True)
    assert "FOREIGN_STAGED" in _reasons(staged)
    assert staged["blocking"] is True


@pytest.mark.parametrize(
    "bad_path",
    ["owned.py", "../escape.py", "src/*.py"],
)
def test_duplicate_traversal_and_glob_declarations_fail_closed(
    tmp_path: Path, bad_path: str
) -> None:
    repo = _repo(tmp_path)
    paths = [bad_path, bad_path] if bad_path == "owned.py" else [bad_path]
    _write_checkpoint(repo, owned=paths)

    report = inspect_worktree(repo, lane=LANE)

    assert report["blocking"] is True
    assert "CHECKPOINT_INVALID" in _reasons(report)


def test_symlink_hardlink_and_rename_fail_closed(tmp_path: Path) -> None:
    symlink_repo = _repo(tmp_path / "symlink")
    (symlink_repo / "actual").mkdir()
    (symlink_repo / "actual" / "file.py").write_text("x = 1\n", encoding="utf-8")
    (symlink_repo / "linked").symlink_to("actual", target_is_directory=True)
    _write_checkpoint(symlink_repo, owned=["linked/file.py"])
    symlink_report = inspect_worktree(symlink_repo, lane=LANE)
    assert "SYMLINK_DECLARATION" in _reasons(symlink_report)

    hardlink_repo = _repo(tmp_path / "hardlink")
    os.link(hardlink_repo / "owned.py", hardlink_repo / "alias.py")
    _write_checkpoint(hardlink_repo, owned=["alias.py"])
    hardlink_report = inspect_worktree(hardlink_repo, lane=LANE)
    assert "HARDLINK_DECLARATION" in _reasons(hardlink_report)

    rename_repo = _repo(tmp_path / "rename")
    _git(rename_repo, "mv", "owned.py", "renamed.py")
    _write_checkpoint(rename_repo, owned=["renamed.py"])
    rename_report = inspect_worktree(rename_repo, lane=LANE)
    assert "RENAME_UNSUPPORTED" in _reasons(rename_report)


def test_undeclared_owned_candidate_in_staging_is_foreign(tmp_path: Path) -> None:
    repo = _repo(tmp_path)
    _write_checkpoint(repo, owned=["owned.py"])
    (repo / "candidate.py").write_text("candidate = 1\n", encoding="utf-8")
    _git(repo, "add", "--", "candidate.py")

    report = inspect_worktree(repo, lane=LANE, staged=True)

    assert "FOREIGN_STAGED" in _reasons(report)
    assert report["blocking"] is True


def test_each_staged_blob_at_publication_limit_is_blocked(tmp_path: Path) -> None:
    repo = _repo(tmp_path)
    large = repo / "large.bin"
    small = repo / "small.bin"
    with large.open("wb") as handle:
        handle.truncate(PUBLICATION_LIMIT_BYTES)
    small.write_bytes(b"small\n")
    _write_checkpoint(repo, owned=["large.bin", "small.bin"])
    _git(repo, "add", "--", "large.bin", "small.bin")

    report = inspect_worktree(repo, lane=LANE, staged=True)

    oversize = [row for row in report["issues"] if row["reason"] == "OVERSIZE_STAGED"]
    assert [row["path"] for row in oversize] == ["large.bin"]
    assert report["blocking"] is True


def test_git_pathspec_magic_cannot_hide_an_oversize_staged_blob(
    tmp_path: Path,
) -> None:
    repo = _repo(tmp_path)
    magic = ":(top)large.bin"
    with (repo / magic).open("wb") as handle:
        handle.truncate(PUBLICATION_LIMIT_BYTES)
    _write_checkpoint(repo, owned=[magic])
    _git(repo, "--literal-pathspecs", "add", "--", magic)

    report = inspect_worktree(repo, lane=LANE, staged=True)

    assert any(
        row["reason"] == "OVERSIZE_STAGED" and row["path"] == magic
        for row in report["issues"]
    )


def test_unmerged_owner_index_is_blocked(tmp_path: Path) -> None:
    repo = _repo(tmp_path)
    base_branch = _git(repo, "branch", "--show-current").decode("utf-8").strip()
    _git(repo, "checkout", "-qb", "topic")
    (repo / "owned.py").write_text("VALUE = 'topic'\n", encoding="utf-8")
    _git(repo, "add", "owned.py")
    _git(repo, "commit", "-qm", "topic")
    _git(repo, "checkout", "-q", base_branch)
    (repo / "owned.py").write_text("VALUE = 'master'\n", encoding="utf-8")
    _git(repo, "add", "owned.py")
    _git(repo, "commit", "-qm", "master")
    merge = subprocess.run(
        ["git", "merge", "topic"], cwd=repo, check=False, capture_output=True
    )
    assert merge.returncode != 0
    _write_checkpoint(repo, owned=["owned.py"])

    report = inspect_worktree(repo, lane=LANE, staged=True)

    assert "UNMERGED_INDEX" in _reasons(report)
    assert report["blocking"] is True


def test_card_head_run_manifest_compatibility_is_explicit(tmp_path: Path) -> None:
    repo = _repo(tmp_path)
    root = _card_head_run(repo)
    _write_checkpoint(repo, generated=[root])

    report = inspect_worktree(repo, lane=LANE)

    assert report["blocking"] is False
    assert "REGISTERED_GENERATED" in _reasons(report)


def _filesystem_snapshot(repo: Path) -> list[tuple[str, int, int, int, str]]:
    rows = []
    for directory, dirnames, filenames in os.walk(repo):
        dirnames.sort()
        filenames.sort()
        for name in filenames:
            path = Path(directory) / name
            info = path.lstat()
            digest = hashlib.sha256(path.read_bytes()).hexdigest()
            rows.append(
                (
                    path.relative_to(repo).as_posix(),
                    info.st_mode,
                    info.st_size,
                    info.st_mtime_ns,
                    digest,
                )
            )
    return rows


def test_identical_cli_reports_are_byte_identical_and_read_only(tmp_path: Path) -> None:
    repo = _repo(tmp_path)
    _write_checkpoint(repo, owned=["owned.py"])
    before = _filesystem_snapshot(repo)
    command = [
        sys.executable,
        str(SCRIPT),
        "report",
        "--repo-root",
        str(repo),
        "--lane",
        LANE,
    ]

    first = subprocess.run(command, check=True, capture_output=True).stdout
    second = subprocess.run(command, check=True, capture_output=True).stdout

    assert first == second
    assert first == canonical_json_bytes(json.loads(first)) + b"\n"
    assert _filesystem_snapshot(repo) == before


def test_check_command_exit_status_tracks_blocking_result(tmp_path: Path) -> None:
    repo = _repo(tmp_path)
    _write_checkpoint(repo)
    base = [
        sys.executable,
        str(SCRIPT),
        "--repo-root",
        str(repo),
        "--lane",
        LANE,
    ]

    clean = subprocess.run(
        [base[0], base[1], "check", *base[2:]], check=False, capture_output=True
    )
    assert clean.returncode == 0
    (repo / "orphan.log").write_text("spill\n", encoding="utf-8")
    blocked = subprocess.run(
        [base[0], base[1], "check", *base[2:]], check=False, capture_output=True
    )
    report_only = subprocess.run(
        [base[0], base[1], "report", *base[2:]], check=False, capture_output=True
    )
    assert blocked.returncode == 1
    assert report_only.returncode == 0
    assert json.loads(blocked.stdout)["blocking"] is True


def test_cleanup_plan_is_classified_but_never_executed(tmp_path: Path) -> None:
    repo = _repo(tmp_path)
    plan = repo / "cleanup-plan.json"
    payload = b'{"delete":["owned.py"],"move":[]}\n'
    plan.write_bytes(payload)
    _write_checkpoint(repo)

    report = inspect_worktree(repo, lane=LANE)

    assert "DURABLE_UNTRACKED" in _reasons(report)
    assert plan.read_bytes() == payload
    assert (repo / "owned.py").is_file()


def test_second_scan_detects_concurrent_owner_byte_change(tmp_path: Path) -> None:
    repo = _repo(tmp_path)
    _write_checkpoint(repo, owned=["owned.py"])

    report = inspect_worktree(
        repo,
        lane=LANE,
        between_scans=lambda: (repo / "owned.py").write_text(
            "VALUE = 2\n", encoding="utf-8"
        ),
    )

    assert "RACE_DETECTED" in _reasons(report)
    assert report["blocking"] is True


def test_second_scan_rejects_generated_directory_symlink_swap(tmp_path: Path) -> None:
    repo = _repo(tmp_path)
    root = _standard_run(repo)
    _write_checkpoint(repo, generated=[root])
    outside = tmp_path / "outside"
    outside.mkdir()
    (outside / "payload.log").write_text("outside\n", encoding="utf-8")

    def swap_directory() -> None:
        artifacts = repo / root / "artifacts"
        artifacts.rename(repo / root / "artifacts-old")
        artifacts.symlink_to(outside, target_is_directory=True)

    report = inspect_worktree(repo, lane=LANE, between_scans=swap_directory)

    assert "DECLARED_SCOPE_INVALID" in _reasons(report)
    assert "RACE_DETECTED" in _reasons(report)
    assert report["blocking"] is True


def test_nul_porcelain_preserves_newline_and_quote_in_owned_path(
    tmp_path: Path,
) -> None:
    repo = _repo(tmp_path)
    odd = 'odd\n"name.py'
    (repo / odd).write_text("odd = 1\n", encoding="utf-8")
    _write_checkpoint(repo, owned=[odd])

    report = inspect_worktree(repo, lane=LANE)

    row = next(row for row in report["entries"] if row["path"] == odd)
    assert row["reason"] == "OWNER_PATH"
    assert report["blocking"] is False
