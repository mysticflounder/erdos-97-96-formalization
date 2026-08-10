from __future__ import annotations

import hashlib
import sys
from dataclasses import dataclass
from pathlib import Path
from types import SimpleNamespace

import pytest

ROOT = Path(__file__).resolve().parents[3]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from census.p97_search import phase3_cegar_runtime as runtime


@dataclass(frozen=True)
class CheckerResult:
    verified: bool
    returncode: int
    stdout: str
    stderr: str


def _atomic_writer(path: Path, data: bytes) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_bytes(data)


def test_learned_run_ledger_tracks_authenticated_scan_and_durable_append() -> None:
    first = {
        "index": 0,
        "previous_record_sha256": None,
        "record_sha256": "first",
        "origin": "bootstrap",
        "stage": "stage-a",
        "clause": [1, -2],
    }
    first_bytes = b"first-record\n"
    scan = runtime.JournalScan()
    scan.observe(first_bytes)
    ledger = runtime.LearnedRunLedger.from_authenticated_records([first], scan)

    second = {
        "index": 1,
        "previous_record_sha256": "first",
        "record_sha256": "second",
        "origin": "solver",
        "stage": "stage-b",
        "clause": [-3],
    }
    second_bytes = b"second-record\n"
    ledger.observe_durable_append(second, second_bytes)

    snapshot = ledger.snapshot()
    assert snapshot.record_count == 2
    assert snapshot.byte_count == len(first_bytes + second_bytes)
    assert snapshot.terminal_record_sha256 == "second"
    assert snapshot.file_sha256 == hashlib.sha256(
        first_bytes + second_bytes
    ).hexdigest()
    assert dict(snapshot.origin_counts) == {"bootstrap": 1, "solver": 1}
    assert dict(snapshot.stage_counts) == {"stage-a": 1, "stage-b": 1}
    assert snapshot.clauses == frozenset({(1, -2), (-3,)})


def test_learned_run_ledger_rejects_noncontiguous_durable_append() -> None:
    ledger = runtime.LearnedRunLedger.from_authenticated_records(
        [], runtime.JournalScan()
    )
    record = {
        "index": 1,
        "previous_record_sha256": None,
        "record_sha256": "drift",
        "origin": "solver",
        "stage": "stage",
        "clause": [1],
    }

    with pytest.raises(runtime.RunLedgerError, match="index drift"):
        ledger.observe_durable_append(record, b"record\n")
    assert ledger.snapshot().record_count == 0


def test_jsonl_run_ledger_tracks_chain_head_and_file_digest() -> None:
    first = {
        "previous_record_sha256": None,
        "record_sha256": "first",
    }
    first_bytes = b'{"record_sha256":"first"}\n'
    scan = runtime.JournalScan()
    scan.observe(first_bytes)
    ledger = runtime.JsonlRunLedger.from_authenticated_records(
        [first], scan, stream_name="solver-logs"
    )

    second = {
        "previous_record_sha256": "first",
        "record_sha256": "second",
    }
    second_bytes = b'{"record_sha256":"second"}\n'
    ledger.observe_durable_append(second, second_bytes)

    assert ledger.snapshot().as_dict() == {
        "record_count": 2,
        "byte_count": len(first_bytes + second_bytes),
        "terminal_record_sha256": "second",
        "file_sha256": hashlib.sha256(first_bytes + second_bytes).hexdigest(),
    }


def test_jsonl_run_ledger_rejects_chain_head_drift_without_mutation() -> None:
    ledger = runtime.JsonlRunLedger.from_authenticated_records(
        [], runtime.JournalScan(), stream_name="survivors"
    )
    record = {
        "previous_record_sha256": "unexpected",
        "record_sha256": "record",
    }

    with pytest.raises(runtime.RunLedgerError, match="chain-head drift"):
        ledger.observe_durable_append(record, b"record\n")
    assert ledger.snapshot().record_count == 0


def test_manifest_generation_publisher_durably_orders_pointer_update(
    tmp_path: Path,
) -> None:
    syncs: list[Path] = []
    publisher = runtime.ManifestGenerationPublisher(
        atomic_writer=_atomic_writer,
        sync_directory=syncs.append,
    )
    data = b'{"manifest":true}\n'

    generation_path = publisher.publish(
        out=tmp_path,
        manifest_path=tmp_path / "manifest.json",
        generation=1,
        data=data,
    )

    assert generation_path.name == "manifest.g00000001.json"
    assert generation_path.read_bytes() == data
    assert (tmp_path / "manifest.json").read_bytes() == data
    assert syncs == [tmp_path, tmp_path]


def test_manifest_generation_publisher_rejects_generation_collision(
    tmp_path: Path,
) -> None:
    publisher = runtime.ManifestGenerationPublisher(
        atomic_writer=_atomic_writer,
        sync_directory=lambda _path: None,
    )
    publisher.publish(
        out=tmp_path,
        manifest_path=tmp_path / "manifest.json",
        generation=1,
        data=b"first\n",
    )

    with pytest.raises(runtime.RunLedgerError, match="generation collision"):
        publisher.publish(
            out=tmp_path,
            manifest_path=tmp_path / "manifest.json",
            generation=1,
            data=b"different\n",
        )


def test_manifest_generation_pointer_failure_leaves_previous_commit_selected(
    tmp_path: Path,
) -> None:
    manifest_path = tmp_path / "manifest.json"
    publisher = runtime.ManifestGenerationPublisher(
        atomic_writer=_atomic_writer,
        sync_directory=lambda _path: None,
    )
    publisher.publish(
        out=tmp_path,
        manifest_path=manifest_path,
        generation=1,
        data=b"first\n",
    )

    def fail_pointer(path: Path, data: bytes) -> None:
        if path == manifest_path:
            raise OSError("injected pointer replacement failure")
        _atomic_writer(path, data)

    failing_publisher = runtime.ManifestGenerationPublisher(
        atomic_writer=fail_pointer,
        sync_directory=lambda _path: None,
    )
    with pytest.raises(OSError, match="pointer replacement failure"):
        failing_publisher.publish(
            out=tmp_path,
            manifest_path=manifest_path,
            generation=2,
            data=b"second\n",
        )

    assert manifest_path.read_bytes() == b"first\n"
    assert (tmp_path / "manifest.g00000002.json").read_bytes() == b"second\n"


def test_terminal_publisher_preserves_terminal_artifact_bytes(
    tmp_path: Path,
) -> None:
    proof_tmp = tmp_path / ".solver.drat"
    proof_tmp.write_bytes(b"proof\n")

    def checker(cnf: Path, proof: Path, timeout_s: int) -> CheckerResult:
        assert cnf.read_bytes() == b"p cnf 0 0\n"
        assert proof.read_bytes() == b"proof\n"
        assert timeout_s == 17
        return CheckerResult(True, 0, "s VERIFIED\n", "warning")

    publisher = runtime.FilesystemTerminalPublisher(checker, _atomic_writer)
    result = publisher.publish(
        out=tmp_path,
        cnf_bytes=b"p cnf 0 0\n",
        proof_tmp=proof_tmp,
        timeout_s=17,
    )

    assert result == runtime.TerminalPublication("VERIFIED")
    assert not proof_tmp.exists()
    assert (tmp_path / "terminal.cnf").read_bytes() == b"p cnf 0 0\n"
    assert (tmp_path / "terminal.drat").read_bytes() == b"proof\n"
    assert (tmp_path / "terminal.drat.check").read_bytes() == (
        b"s VERIFIED\n\nSTDERR\nwarning"
    )


def test_terminal_publisher_runs_fresh_proof_solver_on_exact_terminal_cnf(
    tmp_path: Path,
) -> None:
    calls: list[tuple[Path, Path | None]] = []

    def proof_solver(
        cnf: Path, timeout_s: int, proof: Path | None
    ) -> SimpleNamespace:
        calls.append((cnf, proof))
        assert timeout_s == 17
        assert proof is not None
        assert cnf.name == "terminal.cnf"
        assert cnf.read_bytes() == b"p cnf 0 0\n"
        proof.write_bytes(b"proof\n")
        return SimpleNamespace(
            verdict="UNSAT",
            returncode=20,
            stdout="s UNSATISFIABLE\n",
            stderr="",
        )

    publisher = runtime.FilesystemTerminalPublisher(
        checker_runner=lambda *_args: CheckerResult(True, 0, "s VERIFIED\n", ""),
        atomic_writer=_atomic_writer,
        proof_solver=proof_solver,
    )
    result = publisher.publish(
        out=tmp_path,
        cnf_bytes=b"p cnf 0 0\n",
        proof_tmp=tmp_path / ".solver.drat",
        timeout_s=17,
    )

    assert result == runtime.TerminalPublication("VERIFIED")
    assert calls == [(tmp_path / "terminal.cnf", tmp_path / ".solver.drat")]


@pytest.mark.parametrize("verdict", ["SAT", "UNKNOWN"])
def test_terminal_publisher_rejects_non_unsat_proof_rerun(
    tmp_path: Path,
    verdict: str,
) -> None:
    proof_tmp = tmp_path / ".solver.drat"

    def proof_solver(_cnf: Path, _timeout: int, proof: Path | None) -> SimpleNamespace:
        assert proof is not None
        proof.write_bytes(b"discarded\n")
        return SimpleNamespace(
            verdict=verdict,
            returncode=10 if verdict == "SAT" else 0,
            stdout="",
            stderr="",
        )

    publisher = runtime.FilesystemTerminalPublisher(
        checker_runner=lambda *_args: CheckerResult(True, 0, "verified\n", ""),
        atomic_writer=_atomic_writer,
        proof_solver=proof_solver,
    )
    result = publisher.publish(
        out=tmp_path,
        cnf_bytes=b"cnf",
        proof_tmp=proof_tmp,
        timeout_s=1,
    )

    assert result.outcome == "PROOF_SOLVER_NOT_UNSAT"
    # The publisher does not delete a path after an untrusted solver returns;
    # it cannot prove that a concurrent replacement still belongs to it.
    assert proof_tmp.read_bytes() == b"discarded\n"
    assert not (tmp_path / "terminal.drat").exists()


@pytest.mark.parametrize("empty", [False, True])
def test_terminal_publisher_requires_nonempty_proof_after_unsat_rerun(
    tmp_path: Path,
    empty: bool,
) -> None:
    proof_tmp = tmp_path / ".solver.drat"

    def proof_solver(_cnf: Path, _timeout: int, proof: Path | None) -> SimpleNamespace:
        assert proof is not None
        proof.write_bytes(b"" if empty else b"proof\n")
        return SimpleNamespace(verdict="UNSAT", returncode=20, stdout="", stderr="")

    publisher = runtime.FilesystemTerminalPublisher(
        checker_runner=lambda *_args: CheckerResult(True, 0, "verified\n", ""),
        atomic_writer=_atomic_writer,
        proof_solver=proof_solver,
    )
    result = publisher.publish(
        out=tmp_path,
        cnf_bytes=b"cnf",
        proof_tmp=proof_tmp,
        timeout_s=1,
    )

    if empty:
        assert result == runtime.TerminalPublication("MISSING_DRAT")
    else:
        assert result == runtime.TerminalPublication("VERIFIED")


def test_terminal_publisher_rejects_terminal_cnf_drift(
    tmp_path: Path,
) -> None:
    proof_calls = 0

    def drifting_writer(path: Path, data: bytes) -> None:
        _atomic_writer(path, b"changed" if path.name == "terminal.cnf" else data)

    def proof_solver(*_args: object) -> SimpleNamespace:
        nonlocal proof_calls
        proof_calls += 1
        return SimpleNamespace(verdict="UNSAT", returncode=20, stdout="", stderr="")

    publisher = runtime.FilesystemTerminalPublisher(
        checker_runner=lambda *_args: pytest.fail("checker must not run"),
        atomic_writer=drifting_writer,
        proof_solver=proof_solver,
    )
    result = publisher.publish(
        out=tmp_path,
        cnf_bytes=b"cnf",
        proof_tmp=tmp_path / ".solver.drat",
        timeout_s=1,
    )

    assert result.outcome == "TERMINAL_CNF_DRIFT"
    assert result.proof_error is not None
    assert proof_calls == 0


@pytest.mark.parametrize("empty", [False, True])
def test_terminal_publisher_rejects_missing_or_empty_proof(
    tmp_path: Path,
    empty: bool,
) -> None:
    proof_tmp = tmp_path / ".solver.drat"
    if empty:
        proof_tmp.write_bytes(b"")
    publisher = runtime.FilesystemTerminalPublisher(
        lambda *_args: pytest.fail("checker must not run"),
        _atomic_writer,
    )

    result = publisher.publish(
        out=tmp_path,
        cnf_bytes=b"cnf",
        proof_tmp=proof_tmp,
        timeout_s=1,
    )

    assert result == runtime.TerminalPublication("MISSING_DRAT")
    assert (tmp_path / "terminal.cnf").read_bytes() == b"cnf"
    assert not (tmp_path / "terminal.drat").exists()
    assert not (tmp_path / "terminal.drat.check").exists()


def test_terminal_publisher_reports_checker_exception_fail_closed(
    tmp_path: Path,
) -> None:
    proof_tmp = tmp_path / ".solver.drat"
    proof_tmp.write_bytes(b"proof")

    def checker(*_args: object) -> CheckerResult:
        raise RuntimeError("checker failed")

    publisher = runtime.FilesystemTerminalPublisher(checker, _atomic_writer)
    result = publisher.publish(
        out=tmp_path,
        cnf_bytes=b"cnf",
        proof_tmp=proof_tmp,
        timeout_s=1,
    )

    assert result == runtime.TerminalPublication(
        "CHECKER_EXCEPTION", "checker failed"
    )
    assert (tmp_path / "terminal.drat").read_bytes() == b"proof"
    assert not (tmp_path / "terminal.drat.check").exists()


def test_terminal_publisher_writes_rejected_checker_transcript(
    tmp_path: Path,
) -> None:
    proof_tmp = tmp_path / ".solver.drat"
    proof_tmp.write_bytes(b"proof")
    publisher = runtime.FilesystemTerminalPublisher(
        lambda *_args: CheckerResult(False, 1, "not verified\n", ""),
        _atomic_writer,
    )

    result = publisher.publish(
        out=tmp_path,
        cnf_bytes=b"cnf",
        proof_tmp=proof_tmp,
        timeout_s=1,
    )

    assert result == runtime.TerminalPublication("DRAT_REJECTED")
    assert (tmp_path / "terminal.drat.check").read_bytes() == b"not verified\n"


@pytest.mark.parametrize("mode", ["replace", "mutate"])
def test_terminal_publisher_rejects_terminal_drift_after_proof_solver(
    tmp_path: Path,
    mode: str,
) -> None:
    terminal_bytes = b"p cnf 0 0\n"

    def proof_solver(
        cnf: Path, _timeout: int, proof: Path | None
    ) -> SimpleNamespace:
        assert proof is not None
        if mode == "replace":
            cnf.unlink()
            cnf.write_bytes(terminal_bytes)
        else:
            cnf.write_bytes(b"p cnf 0 1\n")
        proof.write_bytes(b"proof\n")
        return SimpleNamespace(verdict="UNSAT", returncode=20, stdout="", stderr="")

    publisher = runtime.FilesystemTerminalPublisher(
        checker_runner=lambda *_args: pytest.fail("checker must not run"),
        atomic_writer=_atomic_writer,
        proof_solver=proof_solver,
    )
    result = publisher.publish(
        out=tmp_path,
        cnf_bytes=terminal_bytes,
        proof_tmp=tmp_path / ".solver.drat",
        timeout_s=1,
    )

    assert result.outcome == "TERMINAL_CNF_DRIFT"


@pytest.mark.parametrize("mode", ["replace", "mutate"])
def test_terminal_publisher_rejects_terminal_drift_after_checker(
    tmp_path: Path,
    mode: str,
) -> None:
    proof_tmp = tmp_path / ".solver.drat"
    proof_tmp.write_bytes(b"proof\n")
    terminal_bytes = b"p cnf 0 0\n"

    def checker(cnf: Path, _proof: Path, _timeout: int) -> CheckerResult:
        if mode == "replace":
            cnf.unlink()
            cnf.write_bytes(terminal_bytes)
        else:
            cnf.write_bytes(b"p cnf 0 1\n")
        return CheckerResult(True, 0, "verified\n", "")

    result = runtime.FilesystemTerminalPublisher(checker, _atomic_writer).publish(
        out=tmp_path,
        cnf_bytes=terminal_bytes,
        proof_tmp=proof_tmp,
        timeout_s=1,
    )

    assert result.outcome == "TERMINAL_CNF_DRIFT"
    assert not (tmp_path / "terminal.drat.check").exists()


def test_terminal_publisher_rejects_proof_temporary_symlink_without_deleting_it(
    tmp_path: Path,
) -> None:
    target = tmp_path / "outside-proof"
    target.write_bytes(b"outside\n")

    def proof_solver(
        _cnf: Path, _timeout: int, proof: Path | None
    ) -> SimpleNamespace:
        assert proof is not None
        proof.symlink_to(target)
        return SimpleNamespace(verdict="UNSAT", returncode=20, stdout="", stderr="")

    result = runtime.FilesystemTerminalPublisher(
        checker_runner=lambda *_args: pytest.fail("checker must not run"),
        atomic_writer=_atomic_writer,
        proof_solver=proof_solver,
    ).publish(
        out=tmp_path,
        cnf_bytes=b"cnf",
        proof_tmp=tmp_path / ".solver.drat",
        timeout_s=1,
    )

    assert result.outcome == "MISSING_DRAT"
    assert (tmp_path / ".solver.drat").is_symlink()
    assert target.read_bytes() == b"outside\n"


@pytest.mark.parametrize("mode", ["replace", "mutate"])
def test_terminal_publisher_rejects_proof_identity_or_content_drift(
    tmp_path: Path,
    mode: str,
) -> None:
    proof_tmp = tmp_path / ".solver.drat"
    proof_tmp.write_bytes(b"proof\n")

    def checker(_cnf: Path, proof: Path, _timeout: int) -> CheckerResult:
        if mode == "replace":
            proof.unlink()
            proof.write_bytes(b"proof\n")
        else:
            proof.write_bytes(b"drift\n")
        return CheckerResult(True, 0, "verified\n", "")

    result = runtime.FilesystemTerminalPublisher(checker, _atomic_writer).publish(
        out=tmp_path,
        cnf_bytes=b"cnf",
        proof_tmp=proof_tmp,
        timeout_s=1,
    )

    assert result.outcome == "MISSING_DRAT"
    assert result.proof_error == "terminal DRAT changed while it was being checked"
    assert not (tmp_path / "terminal.drat.check").exists()


def test_terminal_publisher_requires_rename_to_preserve_proof_inode(
    tmp_path: Path,
) -> None:
    proof_tmp = tmp_path / ".solver.drat"
    proof_tmp.write_bytes(b"proof\n")

    def copy_instead_of_rename(source: Path, destination: Path) -> None:
        destination.write_bytes(source.read_bytes())
        source.unlink()

    result = runtime.FilesystemTerminalPublisher(
        lambda *_args: pytest.fail("checker must not run"),
        _atomic_writer,
        proof_publisher=copy_instead_of_rename,
    ).publish(
        out=tmp_path,
        cnf_bytes=b"cnf",
        proof_tmp=proof_tmp,
        timeout_s=1,
    )

    assert result.outcome == "MISSING_DRAT"
    assert result.proof_error == "terminal DRAT identity changed during publication"


def test_terminal_publisher_never_overwrites_concurrent_proof_destination(
    tmp_path: Path,
) -> None:
    proof_tmp = tmp_path / ".solver.drat"
    sentinel = b"concurrent destination\n"

    def proof_solver(
        _cnf: Path, _timeout: int, proof: Path | None
    ) -> SimpleNamespace:
        assert proof is not None
        proof.write_bytes(b"owned proof\n")
        return SimpleNamespace(verdict="UNSAT", returncode=20, stdout="", stderr="")

    def publish_after_race(source: Path, destination: Path) -> None:
        destination.write_bytes(sentinel)
        runtime.atomic_rename_noreplace(source, destination)

    result = runtime.FilesystemTerminalPublisher(
        checker_runner=lambda *_args: pytest.fail("checker must not run"),
        atomic_writer=_atomic_writer,
        proof_solver=proof_solver,
        proof_publisher=publish_after_race,
    ).publish(
        out=tmp_path,
        cnf_bytes=b"cnf",
        proof_tmp=proof_tmp,
        timeout_s=1,
    )

    assert result.outcome == "MISSING_DRAT"
    assert "already exists" in (result.proof_error or "")
    assert (tmp_path / "terminal.drat").read_bytes() == sentinel
    assert proof_tmp.read_bytes() == b"owned proof\n"


def test_terminal_publisher_rejects_preexisting_proof_destination_symlink(
    tmp_path: Path,
) -> None:
    target = tmp_path / "outside-proof"
    target.write_bytes(b"outside\n")
    destination = tmp_path / "terminal.drat"
    destination.symlink_to(target)
    proof_tmp = tmp_path / ".solver.drat"
    proof_tmp.write_bytes(b"proof\n")

    result = runtime.FilesystemTerminalPublisher(
        lambda *_args: pytest.fail("checker must not run"), _atomic_writer
    ).publish(
        out=tmp_path,
        cnf_bytes=b"cnf",
        proof_tmp=proof_tmp,
        timeout_s=1,
    )

    assert result.outcome == "MISSING_DRAT"
    assert destination.is_symlink()
    assert proof_tmp.read_bytes() == b"proof\n"
    assert target.read_bytes() == b"outside\n"
