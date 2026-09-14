# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

from __future__ import annotations

import hashlib
import json
import os
import sys
from pathlib import Path, PurePosixPath
from types import SimpleNamespace

import pytest

sys.path.insert(0, str(Path(__file__).resolve().parent))

import b1_postwave_theorem_mine as subject

CAMPAIGN = "b1-test-campaign"
RUN_ID = "wave-1"
WAVE_ROOT = f"scratch/runs/{CAMPAIGN}/{RUN_ID}"
RECEIPT_PATH = f"{WAVE_ROOT}/artifacts/{subject.RECEIPT_NAME}"


def _sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def _write(repo: Path, relative: str, data: bytes) -> Path:
    path = repo / relative
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_bytes(data)
    return path


def _manifest(repo: Path) -> dict[str, str]:
    source_path = f"{WAVE_ROOT}/artifacts/executed-source/runner.py"
    input_path = "scratch/controls/b1-test-input.json"
    _write(repo, source_path, b"print('governed source')\n")
    _write(repo, input_path, b'{"input":"frozen"}\n')
    unsigned = {
        "schema": subject.RUN_MANIFEST_SCHEMA,
        "lane_id": CAMPAIGN,
        "run_id": RUN_ID,
        "root": WAVE_ROOT,
        "owner": "test-owner",
        "base_head": "1" * 40,
        "output_classes": ["artifacts", "events", "tmp"],
        "source_digests": {source_path: _sha256(repo / source_path)},
        "input_digests": {input_path: _sha256(repo / input_path)},
        "created_utc": "2026-08-31T12:00:00Z",
    }
    manifest = {
        **unsigned,
        "manifest_sha256": hashlib.sha256(
            subject.canonical_json_bytes(unsigned)
        ).hexdigest(),
    }
    manifest_path = _write(
        repo,
        f"{WAVE_ROOT}/run_manifest.json",
        (json.dumps(manifest, sort_keys=True, indent=2) + "\n").encode(),
    )
    return {
        "path": f"{WAVE_ROOT}/run_manifest.json",
        "sha256": _sha256(manifest_path),
        "manifest_sha256": manifest["manifest_sha256"],
    }


def _base_input(repo: Path) -> dict[str, object]:
    manifest = _manifest(repo)
    terminal_path = f"{WAVE_ROOT}/artifacts/solver-result.json"
    mine_path = f"{WAVE_ROOT}/artifacts/current-wave-mine.txt"
    _write(repo, terminal_path, b'{"status":"sat"}\n')
    _write(repo, mine_path, b"all current-wave orbit signatures inspected\n")
    return {
        "schema": subject.SCHEMA,
        "created_utc": "2026-08-31T12:05:00Z",
        "campaign_id": CAMPAIGN,
        "wave": {
            "run_id": RUN_ID,
            "root": WAVE_ROOT,
            "base_head": "1" * 40,
            "run_manifest": manifest,
        },
        "scope": subject.SCOPE,
        "gate": {
            "status": "HISTORICAL_BACKFILL_NON_AUTHORIZING",
            "effect": "NON_AUTHORIZING_HISTORICAL_RECORD",
        },
        "wave_artifacts": [
            {
                "artifact_id": "terminal-result",
                "role": "TERMINAL_EVIDENCE",
                "path": terminal_path,
                "sha256": _sha256(repo / terminal_path),
            },
            {
                "artifact_id": "mine-notes",
                "role": "MINE_INPUT",
                "path": mine_path,
                "sha256": _sha256(repo / mine_path),
            },
        ],
        "terminal": {
            "executor": "test-sat-solver",
            "verdict": "SAT",
            "summary": "The diagnostic solver returned a total model.",
            "evidence": ["terminal-result"],
        },
        "observations": [
            {
                "observation_id": "orbit-signature-review",
                "statement": "No orbit signature absent from the prior classification appeared.",
                "evidence": ["terminal-result", "mine-notes"],
            }
        ],
        "outcome": {
            "kind": "NO_NEW_PATTERN",
            "rationale": "The wave introduced no concrete general-theorem candidate.",
            "candidates": [],
        },
        "immediate_consumer": "B1 exact-12 structural survivor classifier",
        "claim_boundary": {
            "rigor": "EMPIRICALLY_VERIFIED",
            "establishes": "A current-wave-only theorem mine was recorded.",
            "does_not_establish": "No Lean theorem or geometric closure follows.",
        },
        "trust_boundary": {
            "solver_evidence": "EXTERNAL_DIAGNOSTIC",
            "semantic_review": "HUMAN_ATTESTED",
            "statement": "The kernel does not check the solver or semantic review.",
        },
    }


def _candidate_input(repo: Path) -> dict[str, object]:
    value = _base_input(repo)
    project_path = f"{WAVE_ROOT}/artifacts/project-search.txt"
    cross_path = f"{WAVE_ROOT}/artifacts/cross-project-search.txt"
    _write(repo, project_path, b"project corpus: no directly reusable theorem\n")
    _write(repo, cross_path, b"all Lean corpora: one incompatible candidate\n")
    value["wave_artifacts"].extend(  # type: ignore[union-attr]
        [
            {
                "artifact_id": "project-search",
                "role": "PROJECT_SEARCH_RESULT",
                "path": project_path,
                "sha256": _sha256(repo / project_path),
            },
            {
                "artifact_id": "cross-search",
                "role": "CROSS_PROJECT_SEARCH_RESULT",
                "path": cross_path,
                "sha256": _sha256(repo / cross_path),
            },
        ]
    )
    value["outcome"] = {
        "kind": "CANDIDATES",
        "rationale": "One current-wave pattern has a concrete theorem statement.",
        "candidates": [
            {
                "candidate_id": "candidate-one",
                "statement": "Every surviving packet has property P.",
                "immediate_consumer": "B1 exact-12 structural survivor classifier",
                "claim_boundary": "Candidate statement only; not a proved theorem.",
                "trust_boundary": "Search output and pattern recognition are external evidence.",
                "project_search": {
                    "scope": "PROJECT",
                    "tool": subject.PROJECT_SEARCH_TOOL,
                    "query": "surviving packet property P",
                    "corpus": subject.PROJECT_CORPUS,
                    "corpus_revision": "project-index@1111111",
                    "result_summary": "No directly reusable declaration was found.",
                    "first_missing_antecedent_or_circularity": "Producer for property P is missing.",
                    "evidence": "project-search",
                },
                "cross_project_search": {
                    "scope": "CROSS_PROJECT",
                    "tool": subject.CROSS_PROJECT_SEARCH_TOOL,
                    "query": "finite packet property P",
                    "corpus": subject.CROSS_PROJECT_CORPUS,
                    "corpus_revision": "merged-index@2026-08-31",
                    "result_summary": "One result had stronger unavailable hypotheses.",
                    "first_missing_antecedent_or_circularity": "The separation hypothesis is absent.",
                    "evidence": "cross-search",
                },
            }
        ],
    }
    return value


def _write_input(repo: Path, value: dict[str, object]) -> str:
    relative = "scratch/inputs/postwave-mine-input.json"
    _write(
        repo, relative, (json.dumps(value, sort_keys=True, indent=2) + "\n").encode()
    )
    return relative


def test_no_candidate_receipt_is_canonical_and_valid(tmp_path: Path) -> None:
    value = _base_input(tmp_path)
    input_path = _write_input(tmp_path, value)
    receipt = subject.create_receipt(
        repo_root=tmp_path,
        input_path=input_path,
        output_path=RECEIPT_PATH,
    )

    assert receipt["outcome"]["kind"] == "NO_NEW_PATTERN"
    assert (tmp_path / RECEIPT_PATH).read_bytes() == (
        subject.canonical_json_bytes(receipt) + b"\n"
    )
    assert (
        subject.load_receipt(repo_root=tmp_path, receipt_path=RECEIPT_PATH) == receipt
    )


@pytest.mark.parametrize("verdict", sorted(subject.TERMINAL_VERDICTS))
def test_every_terminal_diagnostic_verdict_requires_and_accepts_a_mine(
    tmp_path: Path, verdict: str
) -> None:
    value = _base_input(tmp_path)
    value["terminal"]["verdict"] = verdict  # type: ignore[index]
    receipt = subject.build_receipt(value, repo_root=tmp_path)
    assert receipt["terminal"]["verdict"] == verdict


def test_receipt_body_tamper_breaks_self_hash(tmp_path: Path) -> None:
    value = _base_input(tmp_path)
    subject.create_receipt(
        repo_root=tmp_path,
        input_path=_write_input(tmp_path, value),
        output_path=RECEIPT_PATH,
    )
    path = tmp_path / RECEIPT_PATH
    receipt = json.loads(path.read_text())
    receipt["terminal"]["summary"] = "tampered"
    path.write_bytes(subject.canonical_json_bytes(receipt) + b"\n")

    with pytest.raises(subject.TheoremMineError, match="receipt_sha256 mismatch"):
        subject.load_receipt(repo_root=tmp_path, receipt_path=RECEIPT_PATH)


def test_evidence_tamper_breaks_exact_digest(tmp_path: Path) -> None:
    value = _base_input(tmp_path)
    subject.create_receipt(
        repo_root=tmp_path,
        input_path=_write_input(tmp_path, value),
        output_path=RECEIPT_PATH,
    )
    (tmp_path / WAVE_ROOT / "artifacts/solver-result.json").write_text("tampered\n")

    with pytest.raises(subject.TheoremMineError, match="artifact digest mismatch"):
        subject.load_receipt(repo_root=tmp_path, receipt_path=RECEIPT_PATH)


def test_run_manifest_reference_digest_must_match(tmp_path: Path) -> None:
    value = _base_input(tmp_path)
    value["wave"]["run_manifest"]["sha256"] = "0" * 64  # type: ignore[index]

    with pytest.raises(subject.TheoremMineError, match="manifest file digest mismatch"):
        subject.build_receipt(value, repo_root=tmp_path)


def test_artifact_path_escape_is_rejected(tmp_path: Path) -> None:
    value = _base_input(tmp_path)
    value["wave_artifacts"][0]["path"] = "../outside.json"  # type: ignore[index]

    with pytest.raises(subject.TheoremMineError, match="repository-relative"):
        subject.build_receipt(value, repo_root=tmp_path)


def test_wrong_wave_evidence_is_rejected(tmp_path: Path) -> None:
    value = _base_input(tmp_path)
    foreign = _write(
        tmp_path,
        f"scratch/runs/{CAMPAIGN}/wave-2/artifacts/result.json",
        b'{"status":"unsat"}\n',
    )
    value["wave_artifacts"][0]["path"] = (  # type: ignore[index]
        f"scratch/runs/{CAMPAIGN}/wave-2/artifacts/result.json"
    )
    value["wave_artifacts"][0]["sha256"] = _sha256(foreign)  # type: ignore[index]

    with pytest.raises(subject.TheoremMineError, match="outside the named wave root"):
        subject.build_receipt(value, repo_root=tmp_path)


@pytest.mark.parametrize("role", sorted(subject.ARTIFACT_ROLES))
def test_run_manifest_cannot_be_used_as_wave_artifact(
    tmp_path: Path, role: str
) -> None:
    value = _base_input(tmp_path)
    manifest = value["wave"]["run_manifest"]  # type: ignore[index]
    value["wave_artifacts"] = [
        {
            "artifact_id": "manifest-evidence",
            "role": role,
            "path": manifest["path"],
            "sha256": manifest["sha256"],
        }
    ]
    value["terminal"]["evidence"] = ["manifest-evidence"]  # type: ignore[index]
    value["observations"][0]["evidence"] = ["manifest-evidence"]  # type: ignore[index]

    with pytest.raises(
        subject.TheoremMineError,
        match="run manifest cannot be listed as a wave artifact",
    ):
        subject.build_receipt(value, repo_root=tmp_path)


def test_hard_linked_wave_artifact_is_rejected(tmp_path: Path) -> None:
    value = _base_input(tmp_path)
    target_relative = value["wave_artifacts"][0]["path"]  # type: ignore[index]
    target = tmp_path / target_relative
    outside = _write(
        tmp_path,
        "scratch/outside/solver-result.json",
        target.read_bytes(),
    )
    target.unlink()
    os.link(outside, target)
    assert target.stat().st_nlink == 2

    with pytest.raises(subject.TheoremMineError, match="exactly one hard link"):
        subject.build_receipt(value, repo_root=tmp_path)


def test_hard_linked_receipt_is_rejected(tmp_path: Path) -> None:
    value = _base_input(tmp_path)
    subject.create_receipt(
        repo_root=tmp_path,
        input_path=_write_input(tmp_path, value),
        output_path=RECEIPT_PATH,
    )
    receipt = tmp_path / RECEIPT_PATH
    alias = tmp_path / "scratch/outside/postwave-receipt.json"
    alias.parent.mkdir(parents=True, exist_ok=True)
    os.link(receipt, alias)
    assert receipt.stat().st_nlink == 2

    with pytest.raises(subject.TheoremMineError, match="exactly one hard link"):
        subject.load_receipt(repo_root=tmp_path, receipt_path=RECEIPT_PATH)


def test_hash_rejects_final_pathname_inode_replacement(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    value = _base_input(tmp_path)
    target_relative = value["wave_artifacts"][0]["path"]  # type: ignore[index]
    target = tmp_path / target_relative
    replacement = _write(
        tmp_path,
        "scratch/replacements/solver-result.json",
        target.read_bytes(),
    )
    real_open_regular = subject._open_regular
    target_opens = 0

    def replace_before_reopen(root: Path, relative: PurePosixPath) -> int:
        nonlocal target_opens
        if relative.as_posix() == target_relative:
            target_opens += 1
            if target_opens == 2:
                replacement.replace(root / relative)
        return real_open_regular(root, relative)

    monkeypatch.setattr(subject, "_open_regular", replace_before_reopen)
    with pytest.raises(
        subject.TheoremMineError, match="pathname changed after.*hashed"
    ):
        subject.build_receipt(value, repo_root=tmp_path)
    assert target_opens == 2


def test_read_rejects_final_pathname_inode_replacement(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    value = _base_input(tmp_path)
    subject.create_receipt(
        repo_root=tmp_path,
        input_path=_write_input(tmp_path, value),
        output_path=RECEIPT_PATH,
    )
    target = tmp_path / RECEIPT_PATH
    replacement = _write(
        tmp_path,
        "scratch/replacements/postwave-receipt.json",
        target.read_bytes(),
    )
    real_open_regular = subject._open_regular
    target_opens = 0

    def replace_before_reopen(root: Path, relative: PurePosixPath) -> int:
        nonlocal target_opens
        if relative.as_posix() == RECEIPT_PATH:
            target_opens += 1
            if target_opens == 2:
                replacement.replace(root / relative)
        return real_open_regular(root, relative)

    monkeypatch.setattr(subject, "_open_regular", replace_before_reopen)
    with pytest.raises(subject.TheoremMineError, match="pathname changed after.*read"):
        subject.load_receipt(repo_root=tmp_path, receipt_path=RECEIPT_PATH)
    assert target_opens == 2


@pytest.mark.parametrize("flag_name", ["O_DIRECTORY", "O_NOFOLLOW"])
def test_missing_required_open_flag_fails_closed(
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
    flag_name: str,
) -> None:
    value = _base_input(tmp_path)
    monkeypatch.delattr(subject.os, flag_name)

    with pytest.raises(
        subject.TheoremMineError,
        match=f"platform lacks required open flag {flag_name}",
    ):
        subject.build_receipt(value, repo_root=tmp_path)


def test_concrete_candidate_requires_both_search_records(tmp_path: Path) -> None:
    value = _candidate_input(tmp_path)
    del value["outcome"]["candidates"][0]["cross_project_search"]  # type: ignore[index]

    with pytest.raises(subject.TheoremMineError, match="cross_project_search"):
        subject.build_receipt(value, repo_root=tmp_path)


@pytest.mark.parametrize(
    ("search_field", "wrong_tool", "required_tool"),
    (
        (
            "project_search",
            subject.CROSS_PROJECT_SEARCH_TOOL,
            subject.PROJECT_SEARCH_TOOL,
        ),
        (
            "cross_project_search",
            subject.PROJECT_SEARCH_TOOL,
            subject.CROSS_PROJECT_SEARCH_TOOL,
        ),
    ),
)
def test_candidate_search_tools_follow_project_scope(
    tmp_path: Path,
    search_field: str,
    wrong_tool: str,
    required_tool: str,
) -> None:
    value = _candidate_input(tmp_path)
    candidate = value["outcome"]["candidates"][0]  # type: ignore[index]
    candidate[search_field]["tool"] = wrong_tool

    with pytest.raises(subject.TheoremMineError, match=f"tool must be {required_tool}"):
        subject.build_receipt(value, repo_root=tmp_path)


def test_create_refuses_to_overwrite_receipt(tmp_path: Path) -> None:
    value = _base_input(tmp_path)
    input_path = _write_input(tmp_path, value)
    subject.create_receipt(
        repo_root=tmp_path,
        input_path=input_path,
        output_path=RECEIPT_PATH,
    )
    before = (tmp_path / RECEIPT_PATH).read_bytes()

    with pytest.raises(subject.TheoremMineError, match="refusing to overwrite"):
        subject.create_receipt(
            repo_root=tmp_path,
            input_path=input_path,
            output_path=RECEIPT_PATH,
        )
    assert (tmp_path / RECEIPT_PATH).read_bytes() == before


@pytest.mark.parametrize("failing_fsync_call", [1, 2])
def test_failed_fsync_retains_invalid_final_without_cleanup(
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
    failing_fsync_call: int,
) -> None:
    value = _base_input(tmp_path)
    input_path = _write_input(tmp_path, value)
    real_fsync = subject.os.fsync
    calls = 0

    def fail_selected_fsync(fd: int) -> None:
        nonlocal calls
        calls += 1
        if calls == failing_fsync_call:
            raise OSError("injected fsync failure")
        real_fsync(fd)

    monkeypatch.setattr(subject.os, "fsync", fail_selected_fsync)
    with pytest.raises(subject.TheoremMineError, match="durably create"):
        subject.create_receipt(
            repo_root=tmp_path,
            input_path=input_path,
            output_path=RECEIPT_PATH,
        )

    failed_output = tmp_path / RECEIPT_PATH
    assert failed_output.exists()
    assert failed_output.read_bytes() == b""
    assert not any(
        path.name.startswith(f".{subject.RECEIPT_NAME}")
        for path in failed_output.parent.iterdir()
    )
    with pytest.raises(subject.TheoremMineError):
        subject.load_receipt(repo_root=tmp_path, receipt_path=RECEIPT_PATH)
    with pytest.raises(subject.TheoremMineError, match="missing an authentic"):
        subject.scan_campaign(
            repo_root=tmp_path,
            campaign_root=f"scratch/runs/{CAMPAIGN}",
            waves=[RUN_ID],
        )


def test_partial_write_failure_retains_invalid_final(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    value = _base_input(tmp_path)
    input_path = _write_input(tmp_path, value)
    real_write = subject.os.write
    calls = 0

    def partial_then_fail(fd: int, data: bytes | memoryview) -> int:
        nonlocal calls
        calls += 1
        if calls == 1:
            return real_write(fd, data[: max(1, len(data) // 2)])
        raise OSError("injected write failure")

    monkeypatch.setattr(subject.os, "write", partial_then_fail)
    with pytest.raises(subject.TheoremMineError, match="durably create"):
        subject.create_receipt(
            repo_root=tmp_path,
            input_path=input_path,
            output_path=RECEIPT_PATH,
        )

    failed_output = tmp_path / RECEIPT_PATH
    assert failed_output.exists()
    assert failed_output.read_bytes() == b""
    with pytest.raises(subject.TheoremMineError):
        subject.load_receipt(repo_root=tmp_path, receipt_path=RECEIPT_PATH)


def test_create_path_identity_failure_retains_invalid_final(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    value = _base_input(tmp_path)
    input_path = _write_input(tmp_path, value)
    real_stat = subject.os.stat
    misreported = False

    def misreport_identity_once(
        path: str,
        *,
        dir_fd: int | None = None,
        follow_symlinks: bool = True,
    ) -> os.stat_result | SimpleNamespace:
        nonlocal misreported
        current = real_stat(path, dir_fd=dir_fd, follow_symlinks=follow_symlinks)
        if not misreported and path == subject.RECEIPT_NAME:
            misreported = True
            return SimpleNamespace(
                st_dev=current.st_dev,
                st_ino=current.st_ino + 1,
                st_mode=current.st_mode,
                st_nlink=current.st_nlink,
            )
        return current

    monkeypatch.setattr(subject.os, "stat", misreport_identity_once)
    with pytest.raises(subject.TheoremMineError, match="receipt path changed"):
        subject.create_receipt(
            repo_root=tmp_path,
            input_path=input_path,
            output_path=RECEIPT_PATH,
        )

    failed_output = tmp_path / RECEIPT_PATH
    assert misreported
    assert failed_output.exists()
    assert failed_output.read_bytes() == b""
    with pytest.raises(subject.TheoremMineError):
        subject.load_receipt(repo_root=tmp_path, receipt_path=RECEIPT_PATH)


def test_created_file_close_failure_retains_invalid_final(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    value = _base_input(tmp_path)
    receipt = subject.build_receipt(value, repo_root=tmp_path)
    payload = subject.canonical_json_bytes(receipt) + b"\n"
    real_open = subject.os.open
    real_close = subject.os.close
    created_fd: int | None = None
    failed_close = False

    def track_created_fd(
        path: str | bytes | os.PathLike[str],
        flags: int,
        mode: int = 0o777,
        *,
        dir_fd: int | None = None,
    ) -> int:
        nonlocal created_fd
        fd = real_open(path, flags, mode, dir_fd=dir_fd)
        if path == subject.RECEIPT_NAME and flags & os.O_EXCL:
            created_fd = fd
        return fd

    def fail_created_fd_close(fd: int) -> None:
        nonlocal failed_close
        real_close(fd)
        if fd == created_fd and not failed_close:
            failed_close = True
            raise OSError("injected created-fd close failure")

    monkeypatch.setattr(subject.os, "open", track_created_fd)
    monkeypatch.setattr(subject.os, "close", fail_created_fd_close)
    with pytest.raises(subject.TheoremMineError, match="durably create"):
        subject._create_regular_exclusive(
            tmp_path.resolve(), PurePosixPath(RECEIPT_PATH), payload
        )

    failed_output = tmp_path / RECEIPT_PATH
    assert failed_close
    assert failed_output.exists()
    assert failed_output.read_bytes() == b""


def test_scan_fails_when_registered_wave_receipt_is_missing(tmp_path: Path) -> None:
    _base_input(tmp_path)

    with pytest.raises(subject.TheoremMineError, match="missing an authentic"):
        subject.scan_campaign(
            repo_root=tmp_path,
            campaign_root=f"scratch/runs/{CAMPAIGN}",
            waves=[RUN_ID],
        )


def test_current_gate_receipt_passes_campaign_scan(tmp_path: Path) -> None:
    value = _base_input(tmp_path)
    value["gate"] = {
        "status": "CURRENT_GATE",
        "effect": "SATISFIES_CURRENT_POSTWAVE_MINE_ONLY",
    }
    subject.create_receipt(
        repo_root=tmp_path,
        input_path=_write_input(tmp_path, value),
        output_path=RECEIPT_PATH,
    )

    result = subject.scan_campaign(
        repo_root=tmp_path,
        campaign_root=f"scratch/runs/{CAMPAIGN}",
        waves=[RUN_ID],
    )
    assert result["waves"] == [
        {
            "run_id": RUN_ID,
            "status": "VALID_RECEIPT",
            "gate_status": "CURRENT_GATE",
        }
    ]


def test_scan_accepts_only_explicit_empty_no_run_exemption(tmp_path: Path) -> None:
    (tmp_path / "scratch" / "runs" / CAMPAIGN).mkdir(parents=True)
    result = subject.scan_campaign(
        repo_root=tmp_path,
        campaign_root=f"scratch/runs/{CAMPAIGN}",
        waves=["wave-never-ran"],
        no_run=["wave-never-ran"],
    )
    assert result["waves"] == [{"run_id": "wave-never-ran", "status": "NO_RUN"}]

    _write(
        tmp_path,
        f"scratch/runs/{CAMPAIGN}/wave-never-ran/framework-exclusion.txt",
        b"excluded from generic framework\n",
    )
    with pytest.raises(subject.TheoremMineError, match="existing wave data"):
        subject.scan_campaign(
            repo_root=tmp_path,
            campaign_root=f"scratch/runs/{CAMPAIGN}",
            waves=["wave-never-ran"],
            no_run=["wave-never-ran"],
        )


def test_no_run_rejects_wave_pathname_replacement_during_listing(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    campaign = tmp_path / "scratch" / "runs" / CAMPAIGN
    wave = campaign / RUN_ID
    replacement = campaign / "replacement-wave"
    displaced = campaign / "displaced-wave"
    wave.mkdir(parents=True)
    replacement.mkdir()
    _write(
        tmp_path,
        f"scratch/runs/{CAMPAIGN}/replacement-wave/output.txt",
        b"run\n",
    )
    real_open_directory = subject._open_directory
    replaced = False

    def replace_before_final_reopen(root: Path, relative: PurePosixPath) -> int:
        nonlocal replaced
        if relative.as_posix() == f"scratch/runs/{CAMPAIGN}/{RUN_ID}":
            wave.rename(displaced)
            replacement.rename(wave)
            replaced = True
        return real_open_directory(root, relative)

    monkeypatch.setattr(subject, "_open_directory", replace_before_final_reopen)
    with pytest.raises(
        subject.TheoremMineError, match="pathname changed after listing"
    ):
        subject.scan_campaign(
            repo_root=tmp_path,
            campaign_root=f"scratch/runs/{CAMPAIGN}",
            waves=[RUN_ID],
            no_run=[RUN_ID],
        )
    assert replaced


def test_candidate_receipt_with_project_and_cross_searches_is_valid(
    tmp_path: Path,
) -> None:
    receipt = subject.build_receipt(_candidate_input(tmp_path), repo_root=tmp_path)
    assert receipt["outcome"]["kind"] == "CANDIDATES"
    assert len(receipt["outcome"]["candidates"]) == 1
