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
REPORT_SCHEMA = _CHECKER.REPORT_SCHEMA
RUN_MANIFEST_SCHEMA = _CHECKER.RUN_MANIFEST_SCHEMA
SUMMARY_SCHEMA = _CHECKER.SUMMARY_SCHEMA
P97_RUN_SCHEMAS = _CHECKER.P97_RUN_SCHEMAS
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


P97_LANES = {schema: _CHECKER._P97_SCHEMA_LANES[schema] for schema in P97_RUN_SCHEMAS}
P97_V6_SCHEMA = "p97-freshthird-firstnonhit-common-payload-v6/run/v1"
P97_V7_SCHEMA = _CHECKER.P97_COMMON_ONLY_V7_SCHEMA
P97_V7_AUTHENTICATED_SOURCES = _CHECKER._P97_V7_AUTHENTICATED_SOURCES
P97_V7_ENCODING = _CHECKER._P97_V7_ENCODING
P97_V7_SOURCE_REVISION = _CHECKER._P97_V7_SOURCE_REVISION


def _p97_self_hash(value: dict[str, Any], field: str) -> str:
    unsigned = {key: item for key, item in value.items() if key != field}
    return hashlib.sha256(canonical_json_bytes(unsigned) + b"\n").hexdigest()


def _p97_run(repo: Path, schema: str) -> tuple[str, str]:
    lane = P97_LANES[schema]
    checkpoint_rel = f".codex/worktree-checkpoints/{lane}.json"
    root = f"scratch/runs/{lane}/n17-one-shot-audit-approved"
    authenticated_sources = {}
    if schema == P97_V7_SCHEMA:
        source_repo = SCRIPT.parents[1]
        for label, expected in P97_V7_AUTHENTICATED_SOURCES.items():
            path = expected["path"]
            target = repo / path
            target.parent.mkdir(parents=True, exist_ok=True)
            target.write_bytes((source_repo / path).read_bytes())
            authenticated_sources[label] = {
                **expected,
                "size": target.stat().st_size,
            }
        _git(repo, "add", "--", *(row["path"] for row in authenticated_sources.values()))
        _git(repo, "commit", "-qm", "install v7 authenticated sources")
    checkpoint = {
        "schema": CHECKPOINT_SCHEMA,
        "lane_id": lane,
        "owner": lane,
        "base_head": _head(repo),
        "owned_paths": [checkpoint_rel],
        "generated_roots": [root],
        "durable_paths": [],
        "created_utc": CREATED,
        "manifest_sha256": "",
    }
    checkpoint["manifest_sha256"] = manifest_self_hash(checkpoint)
    checkpoint_path = repo / checkpoint_rel
    checkpoint_path.parent.mkdir(parents=True, exist_ok=True)
    checkpoint_path.write_bytes(canonical_json_bytes(checkpoint) + b"\n")
    run_root = repo / root
    run_root.mkdir(parents=True)
    (run_root / "problem.cnf").write_bytes(b"p cnf 1 0\n")
    source_rows = {
        "checkpoint": {
            "path": checkpoint_rel,
            "sha256": _sha(checkpoint_path),
            "size": checkpoint_path.stat().st_size,
        },
        "source": {
            "path": "source.txt",
            "sha256": _sha(repo / "source.txt"),
            "size": (repo / "source.txt").stat().st_size,
        },
    }
    if schema == P97_V7_SCHEMA:
        manifest = {
            "schema": schema,
            "status": "IN_PROGRESS",
            "run_root": root,
            "n": 17,
            "source_total": False,
            "launch_enabled": True,
            "timeout_seconds": 1,
            "cross_check_requested": False,
            "manifest_first": True,
            "authenticated_sources": authenticated_sources,
            "source_revision": json.loads(json.dumps(P97_V7_SOURCE_REVISION)),
            "encoding": dict(P97_V7_ENCODING),
            "binary_discovery_deferred_until_after_manifest": True,
            "run_manifest_sha256": "",
        }
    else:
        manifest = {
            "schema": schema,
            "status": "RUNNING",
            "run_root": root,
            "n": 17,
            "source_total": False,
            "scope_label": "sound finite relaxation",
            "all_emitted_hard_clauses_source_mapped": True,
            "independent_audit": {"status": "APPROVED"},
            "encoding": {"variables": 1, "clauses": 0},
            "source_hashes": source_rows,
            "binaries": {},
            "commands": {},
            "timeout_seconds": 1,
            "cross_check_requested": False,
            "query_is_separate_assumption": True,
            "exactly_one_production_wave": True,
            "no_cegar_successor": True,
            "theorem_bank_search_planned": False,
            "run_manifest_sha256": "",
        }
    if schema.endswith(
        (
            "cap-endpoint-v3/run/v1",
            "all-large-caps-v4/run/v1",
            "overlap-v5/run/v1",
            "common-payload-v6/run/v1",
        )
    ):
        manifest["predecessor_model_control"] = {}
    if schema.endswith(
        (
            "all-large-caps-v4/run/v1",
            "overlap-v5/run/v1",
            "common-payload-v6/run/v1",
        )
    ):
        manifest["cross_check_effective"] = False
    if schema.endswith(("overlap-v5/run/v1", "common-payload-v6/run/v1")):
        manifest["lean_ingress"] = {}
        manifest["production_path"] = {}
    manifest["run_manifest_sha256"] = _p97_self_hash(manifest, "run_manifest_sha256")
    manifest_path = run_root / "run-manifest.json"
    manifest_path.write_bytes(canonical_json_bytes(manifest) + b"\n")
    artifact = {
        "path": "problem.cnf",
        "sha256": _sha(run_root / "problem.cnf"),
        "size": (run_root / "problem.cnf").stat().st_size,
    }
    manifest_artifact = {
        "path": "run-manifest.json",
        "sha256": _sha(manifest_path),
        "size": manifest_path.stat().st_size,
    }
    receipt = {
        "schema": f"{schema}/terminal-receipt/v1",
        "status": "SAT",
        "source_total": False,
        "all_emitted_hard_clauses_source_mapped": True,
        "independent_audit": {"status": "APPROVED"},
        "run_manifest_sha256": _sha(manifest_path),
        "result": {},
        "processes": [],
        "artifact_inventory": [artifact, manifest_artifact],
        "no_cegar_successor": True,
        "theorem_bank_search_run": False,
        "terminal_receipt_sha256": "",
    }
    if schema == P97_V7_SCHEMA:
        del receipt["independent_audit"]
        receipt["launch_enabled_at_creation"] = True
    if schema.endswith(
        (
            "all-large-caps-v4/run/v1",
            "overlap-v5/run/v1",
            "common-payload-v6/run/v1",
        )
    ):
        receipt["cross_check_requested"] = False
        receipt["cross_check_effective"] = False
    receipt["terminal_receipt_sha256"] = _p97_self_hash(
        receipt, "terminal_receipt_sha256"
    )
    (run_root / "terminal-receipt.json").write_bytes(
        canonical_json_bytes(receipt) + b"\n"
    )
    return root, lane


def _rewrite_p97_checkpoint(repo: Path, root: str, mutate: Any) -> None:
    lane = root.split("/")[2]
    checkpoint_path = repo / f".codex/worktree-checkpoints/{lane}.json"
    checkpoint = json.loads(checkpoint_path.read_text(encoding="utf-8"))
    mutate(checkpoint)
    checkpoint["manifest_sha256"] = manifest_self_hash(checkpoint)
    checkpoint_path.write_bytes(canonical_json_bytes(checkpoint) + b"\n")
    manifest_path = repo / root / "run-manifest.json"
    manifest = json.loads(manifest_path.read_text(encoding="utf-8"))
    if manifest["schema"] != P97_V7_SCHEMA:
        manifest["source_hashes"]["checkpoint"] = {
            "path": checkpoint_path.relative_to(repo).as_posix(),
            "sha256": _sha(checkpoint_path),
            "size": checkpoint_path.stat().st_size,
        }
    manifest["run_manifest_sha256"] = _p97_self_hash(manifest, "run_manifest_sha256")
    manifest_path.write_bytes(canonical_json_bytes(manifest) + b"\n")
    receipt_path = repo / root / "terminal-receipt.json"
    receipt = json.loads(receipt_path.read_text(encoding="utf-8"))
    receipt["run_manifest_sha256"] = _sha(manifest_path)
    receipt["terminal_receipt_sha256"] = _p97_self_hash(
        receipt, "terminal_receipt_sha256"
    )
    receipt_path.write_bytes(canonical_json_bytes(receipt) + b"\n")


def _rewrite_p97_manifest(repo: Path, root: str, mutate: Any) -> None:
    manifest_path = repo / root / "run-manifest.json"
    manifest = json.loads(manifest_path.read_text(encoding="utf-8"))
    mutate(manifest)
    manifest["run_manifest_sha256"] = _p97_self_hash(
        manifest, "run_manifest_sha256"
    )
    manifest_path.write_bytes(canonical_json_bytes(manifest) + b"\n")
    receipt_path = repo / root / "terminal-receipt.json"
    receipt = json.loads(receipt_path.read_text(encoding="utf-8"))
    receipt["run_manifest_sha256"] = _sha(manifest_path)
    manifest_row = next(
        row for row in receipt["artifact_inventory"] if row["path"] == "run-manifest.json"
    )
    manifest_row.update(
        {"sha256": _sha(manifest_path), "size": manifest_path.stat().st_size}
    )
    receipt["terminal_receipt_sha256"] = _p97_self_hash(
        receipt, "terminal_receipt_sha256"
    )
    receipt_path.write_bytes(canonical_json_bytes(receipt) + b"\n")


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


def test_staged_check_omits_foreign_untracked_backlog(
    tmp_path: Path,
) -> None:
    repo = _repo(tmp_path)
    _write_checkpoint(repo, owned=["owned.py"])
    (repo / "owned.py").write_text("VALUE = 2\n", encoding="utf-8")
    _git(repo, "add", "--", "owned.py")
    (repo / "Loose.lean").write_text("theorem pending : True := by trivial\n")

    report = inspect_worktree(repo, lane=LANE, staged=True)

    by_path = {row["path"]: row for row in report["entries"]}
    assert "Loose.lean" not in by_path
    assert by_path["owned.py"]["reason"] == "OWNER_PATH"
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


@pytest.mark.parametrize("schema", sorted(P97_RUN_SCHEMAS))
def test_p97_run_manifest_compatibility_is_explicit(
    tmp_path: Path, schema: str
) -> None:
    repo = _repo(tmp_path)
    _root, lane = _p97_run(repo, schema)

    report = inspect_worktree(repo, lane=lane)

    assert report["blocking"] is False
    assert "REGISTERED_GENERATED" in _reasons(report)


def test_p97_v7_manifest_first_root_is_registered(tmp_path: Path) -> None:
    repo = _repo(tmp_path)
    root, lane = _p97_run(repo, P97_V7_SCHEMA)

    report = inspect_worktree(repo, lane=lane)

    assert report["blocking"] is False
    assert any(
        row["path"].startswith(root) and row["reason"] == "REGISTERED_GENERATED"
        for row in report["entries"]
    )


@pytest.mark.parametrize(
    ("tamper", "detail"),
    [
        ("owner", "checkpoint owner does not match its schema"),
        ("manifest-key", "P97 run manifest keys differ"),
        ("manifest-path", "P97 run manifest root is not exactly checkpoint-owned"),
        ("source-path", "P97 authenticated source path"),
        ("source-extra", "P97 authenticated_sources labels differ"),
        ("source-missing", "P97 authenticated_sources labels differ"),
        ("source-renamed", "P97 authenticated_sources labels differ"),
        ("source-unrelated", "P97 authenticated source identity differs"),
        ("encoding", "P97 v7 encoding custody differs"),
        ("encoding-type", "P97 v7 encoding custody differs"),
        ("source-revision", "P97 v7 source_revision custody differs"),
        ("source-revision-type", "P97 v7 source_revision custody differs"),
        ("receipt-key", "P97 terminal receipt keys differ"),
        ("terminal-boundary", "P97 v7 terminal receipt boundary flags are malformed"),
    ],
)
def test_p97_v7_rejects_owner_manifest_path_and_terminal_drift(
    tmp_path: Path, tamper: str, detail: str
) -> None:
    repo = _repo(tmp_path)
    root, lane = _p97_run(repo, P97_V7_SCHEMA)
    if tamper == "owner":
        _rewrite_p97_checkpoint(
            repo, root, lambda checkpoint: checkpoint.__setitem__("owner", "other-owner")
        )
    elif tamper == "manifest-key":
        _rewrite_p97_manifest(
            repo, root, lambda manifest: manifest.__setitem__("unexpected", True)
        )
    elif tamper == "manifest-path":
        _rewrite_p97_manifest(
            repo,
            root,
            lambda manifest: manifest.__setitem__("run_root", root + "-tampered"),
        )
    elif tamper == "source-path":
        _rewrite_p97_manifest(
            repo,
            root,
            lambda manifest: manifest["authenticated_sources"][
                "encoder_v6"
            ].__setitem__("path", "../source.txt"),
        )
    elif tamper == "source-extra":
        _rewrite_p97_manifest(
            repo,
            root,
            lambda manifest: manifest["authenticated_sources"].__setitem__(
                "extra", dict(manifest["authenticated_sources"]["encoder_v6"])
            ),
        )
    elif tamper == "source-missing":
        _rewrite_p97_manifest(
            repo,
            root,
            lambda manifest: manifest["authenticated_sources"].pop("encoder_v6"),
        )
    elif tamper == "source-renamed":
        def rename_source(manifest: dict[str, Any]) -> None:
            row = manifest["authenticated_sources"].pop("encoder_v6")
            manifest["authenticated_sources"]["renamed"] = row

        _rewrite_p97_manifest(repo, root, rename_source)
    elif tamper == "source-unrelated":
        def point_to_unrelated_file(manifest: dict[str, Any]) -> None:
            unrelated = repo / "foreign.py"
            manifest["authenticated_sources"]["encoder_v6"] = {
                "path": "foreign.py",
                "sha256": _sha(unrelated),
                "size": unrelated.stat().st_size,
            }

        _rewrite_p97_manifest(repo, root, point_to_unrelated_file)
    elif tamper == "encoding":
        _rewrite_p97_manifest(
            repo, root, lambda manifest: manifest.__setitem__("encoding", {"evil": 1})
        )
    elif tamper == "encoding-type":
        _rewrite_p97_manifest(
            repo,
            root,
            lambda manifest: manifest["encoding"].__setitem__("clauses", 638735.0),
        )
    elif tamper == "source-revision":
        _rewrite_p97_manifest(
            repo,
            root,
            lambda manifest: manifest.__setitem__("source_revision", {"evil": 1}),
        )
    elif tamper == "source-revision-type":
        _rewrite_p97_manifest(
            repo,
            root,
            lambda manifest: manifest["source_revision"].__setitem__(
                "target_files_authenticated_unchanged", 1
            ),
        )
    else:
        receipt_path = repo / root / "terminal-receipt.json"
        receipt = json.loads(receipt_path.read_text(encoding="utf-8"))
        if tamper == "receipt-key":
            receipt["unexpected"] = True
        else:
            receipt["launch_enabled_at_creation"] = False
        receipt["terminal_receipt_sha256"] = _p97_self_hash(
            receipt, "terminal_receipt_sha256"
        )
        receipt_path.write_bytes(canonical_json_bytes(receipt) + b"\n")

    report = inspect_worktree(repo, lane=lane)

    assert report["blocking"] is True
    assert any(detail in issue["detail"] for issue in report["issues"])


@pytest.mark.parametrize(
    "mutate",
    [
        lambda checkpoint: checkpoint.__setitem__("owner", "other-owner"),
        lambda checkpoint: checkpoint.__setitem__("base_head", "0" * 40),
    ],
)
def test_p97_checkpoint_owner_and_base_cannot_be_rewritten_with_rehashed_bindings(
    tmp_path: Path, mutate: Any
) -> None:
    repo = _repo(tmp_path)
    root, lane = _p97_run(repo, P97_V6_SCHEMA)
    _rewrite_p97_checkpoint(repo, root, mutate)

    report = inspect_worktree(repo, lane=lane)

    assert report["blocking"] is True
    assert "DECLARED_SCOPE_INVALID" in _reasons(report)


@pytest.mark.parametrize("target", ["manifest-schema", "receipt-status"])
def test_p97_schema_and_status_type_errors_are_structured(
    tmp_path: Path, target: str
) -> None:
    repo = _repo(tmp_path)
    root, lane = _p97_run(repo, next(iter(sorted(P97_RUN_SCHEMAS))))
    if target == "manifest-schema":
        path = repo / root / "run-manifest.json"
        value = json.loads(path.read_text(encoding="utf-8"))
        value["schema"] = []
        path.write_bytes(canonical_json_bytes(value) + b"\n")
    else:
        path = repo / root / "terminal-receipt.json"
        value = json.loads(path.read_text(encoding="utf-8"))
        value["status"] = []
        value["terminal_receipt_sha256"] = _p97_self_hash(
            value, "terminal_receipt_sha256"
        )
        path.write_bytes(canonical_json_bytes(value) + b"\n")

    report = inspect_worktree(repo, lane=lane)

    assert report["blocking"] is True
    assert "DECLARED_SCOPE_INVALID" in _reasons(report)


def test_p97_inventory_open_race_is_reported_as_scope_failure(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    repo = _repo(tmp_path)
    _root, lane = _p97_run(repo, next(iter(sorted(P97_RUN_SCHEMAS))))
    original_open = _CHECKER.os.open

    def race_open(path: Any, flags: int, *args: Any, **kwargs: Any) -> int:
        if path == "problem.cnf" and kwargs.get("dir_fd") is not None:
            raise OSError("simulated inventory race")
        return original_open(path, flags, *args, **kwargs)

    monkeypatch.setattr(_CHECKER.os, "open", race_open)
    report = inspect_worktree(repo, lane=lane)

    assert report["blocking"] is True
    assert "DECLARED_SCOPE_INVALID" in _reasons(report)


@pytest.mark.parametrize(
    "tamper",
    ["manifest", "receipt", "inventory", "extra", "symlink"],
)
def test_p97_run_compatibility_rejects_tampering_and_unlisted_members(
    tmp_path: Path, tamper: str
) -> None:
    repo = _repo(tmp_path)
    root, lane = _p97_run(repo, P97_V6_SCHEMA)
    run_root = repo / root
    if tamper == "manifest":
        manifest_path = run_root / "run-manifest.json"
        manifest = json.loads(manifest_path.read_text(encoding="utf-8"))
        manifest["run_root"] = root + "-tampered"
        manifest_path.write_bytes(canonical_json_bytes(manifest) + b"\n")
    elif tamper == "receipt":
        receipt_path = run_root / "terminal-receipt.json"
        receipt = json.loads(receipt_path.read_text(encoding="utf-8"))
        receipt["status"] = "BOGUS"
        receipt["terminal_receipt_sha256"] = _p97_self_hash(
            receipt, "terminal_receipt_sha256"
        )
        receipt_path.write_bytes(canonical_json_bytes(receipt) + b"\n")
    elif tamper == "inventory":
        receipt_path = run_root / "terminal-receipt.json"
        receipt = json.loads(receipt_path.read_text(encoding="utf-8"))
        receipt["artifact_inventory"][0]["size"] += 1
        receipt["terminal_receipt_sha256"] = _p97_self_hash(
            receipt, "terminal_receipt_sha256"
        )
        receipt_path.write_bytes(canonical_json_bytes(receipt) + b"\n")
    elif tamper == "extra":
        (run_root / "unlisted.out").write_text("extra\n", encoding="utf-8")
    else:
        (run_root / "symlink.out").symlink_to(repo / "source.txt")

    report = inspect_worktree(repo, lane=lane)

    assert report["blocking"] is True
    assert "DECLARED_SCOPE_INVALID" in _reasons(report)


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


def test_identical_verbose_cli_reports_are_byte_identical_and_read_only(
    tmp_path: Path,
) -> None:
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
        "--verbose",
    ]

    first = subprocess.run(command, check=True, capture_output=True).stdout
    second = subprocess.run(command, check=True, capture_output=True).stdout

    assert first == second
    assert first == canonical_json_bytes(json.loads(first)) + b"\n"
    assert json.loads(first)["schema"] == REPORT_SCHEMA
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
    assert clean.stdout == b""
    assert clean.stderr == b""
    (repo / "orphan.log").write_text("spill\n", encoding="utf-8")
    blocked = subprocess.run(
        [base[0], base[1], "check", *base[2:]], check=False, capture_output=True
    )
    report_only = subprocess.run(
        [base[0], base[1], "report", *base[2:]], check=False, capture_output=True
    )
    assert blocked.returncode == 1
    assert blocked.stdout == b""
    blocked_summary = json.loads(blocked.stderr)
    assert blocked_summary["schema"] == SUMMARY_SCHEMA
    assert blocked_summary["blocking"] is True
    assert blocked_summary["problems"][0]["reason"] == "UNTRACKED_ROOT_SPILL"
    assert report_only.returncode == 0
    assert report_only.stderr == b""
    report_summary = json.loads(report_only.stdout)
    assert report_summary["schema"] == SUMMARY_SCHEMA
    assert report_summary["blocking"] is True


def test_check_command_prints_checker_errors_to_stderr(tmp_path: Path) -> None:
    repo = _repo(tmp_path)
    result = subprocess.run(
        [
            sys.executable,
            str(SCRIPT),
            "check",
            "--repo-root",
            str(repo),
            "--lane",
            LANE,
        ],
        check=False,
        capture_output=True,
    )

    assert result.returncode == 1
    assert result.stdout == b""
    summary = json.loads(result.stderr)
    assert summary["schema"] == SUMMARY_SCHEMA
    assert summary["blocking"] is True
    assert summary["problems"][0]["reason"] == "CHECKPOINT_INVALID"


def test_sparse_summary_bounds_problem_details() -> None:
    report = {
        "blocking": True,
        "checkpoint": ".codex/worktree-checkpoints/lane-a.json",
        "counts": {"entries": 25, "issues": 0, "reasons": {"SPILL": 25}},
        "entries": [
            {
                "blocking": True,
                "path": f"spill-{index:02d}",
                "reason": "SPILL",
                "status": "??",
            }
            for index in range(25)
        ],
        "head": "a" * 40,
        "issues": [],
        "lane_id": LANE,
        "staged_check": False,
    }

    summary = _CHECKER._summary(report)

    assert len(summary["problems"]) == _CHECKER.SUMMARY_PROBLEM_LIMIT
    assert summary["problems_omitted"] == 5


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
