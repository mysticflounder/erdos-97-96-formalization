from __future__ import annotations

import json
import sys
from pathlib import Path

import pytest

ROOT = Path(__file__).resolve().parents[3]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from census.p97_search.benchmarks import phase3_cegar_timing as timing


def _context() -> timing.TimingContext:
    return timing.TimingContext(
        benchmark_manifest_sha256="a" * 64,
        subject_manifest_sha256="b" * 64,
        subject_chain_head_sha256="c" * 64,
        cache_condition="fresh-process-new-copy",
        repetition=0,
    )


def test_measure_uses_scripted_wall_and_cpu_clocks() -> None:
    wall = iter([1_000, 1_250])
    cpu = iter([100, 175])
    recorder = timing.TimingRecorder(
        timing.Clock(lambda: next(wall), lambda: next(cpu))
    )

    with recorder.measure("solver", "run", counters={"models": 1}):
        pass

    assert recorder.samples == [
        {
            "stage": "solver",
            "operation": "run",
            "wall_ns": 250,
            "cpu_ns": 75,
            "succeeded": True,
            "error_type": None,
            "counters": {"models": 1},
        }
    ]


def test_timing_jsonl_is_canonical_chained_and_subject_bound(
    tmp_path: Path,
) -> None:
    journal = timing.TimingJournal(tmp_path / "timings.jsonl")
    recorder = timing.TimingRecorder(
        timing.Clock(iter([0, 10]).__next__, iter([0, 3]).__next__)
    )
    with recorder.measure("loader", "total"):
        pass

    written = journal.append(_context(), recorder.samples)
    records = journal.read()

    assert records == written
    assert records[0]["benchmark_manifest_sha256"] == "a" * 64
    assert records[0]["subject_manifest_sha256"] == "b" * 64
    assert records[0]["subject_chain_head_sha256"] == "c" * 64
    assert records[0]["previous_record_sha256"] is None
    assert (tmp_path / "timings.jsonl").read_bytes() == (
        timing._canonical_bytes(records[0]) + b"\n"
    )


def test_timing_journal_rejects_truncation_or_foreign_chain(
    tmp_path: Path,
) -> None:
    sample = {
        "stage": "manifest",
        "operation": "construct",
        "wall_ns": 4,
        "cpu_ns": 2,
        "succeeded": True,
        "error_type": None,
        "counters": {},
    }
    path = tmp_path / "timings.jsonl"
    journal = timing.TimingJournal(path)
    journal.append(_context(), [sample, sample])
    original = path.read_bytes()
    path.write_bytes(original[:-1])
    with pytest.raises(timing.TimingJournalError, match="truncated"):
        journal.read()

    records = [json.loads(line) for line in original.splitlines()]
    records[1]["previous_record_sha256"] = "0" * 64
    payload = dict(records[1])
    payload.pop("record_sha256")
    records[1]["record_sha256"] = timing._sha256_value(payload)
    path.write_bytes(b"".join(timing._canonical_bytes(x) + b"\n" for x in records))
    with pytest.raises(timing.TimingJournalError, match="broken"):
        journal.read()


def test_summary_uses_integer_median_and_nearest_rank_p95() -> None:
    records = [
        {
            "stage": "solver",
            "operation": "run",
            "wall_ns": value,
            "cpu_ns": value // 2,
        }
        for value in range(10, 210, 10)
    ]

    summary = timing.summarize(records)["summaries"][0]

    assert summary["sample_count"] == 20
    assert summary["wall_ns_median"] == 105
    assert summary["wall_ns_p95"] == 190
    assert summary["cpu_ns_median"] == 52
    assert summary["cpu_ns_p95"] == 95


def test_timed_fake_solver_run_is_artifact_byte_identical(
    tmp_path: Path,
) -> None:
    bare_cnf = tmp_path / "bare.cnf"
    timed_cnf = tmp_path / "timed.cnf"
    bare_proof = tmp_path / "bare.drat"
    timed_proof = tmp_path / "timed.drat"
    bare_cnf.write_bytes(b"p cnf 0 0\n")
    timed_cnf.write_bytes(bare_cnf.read_bytes())

    def runner(cnf: Path, timeout_s: int, proof: Path | None) -> tuple[bytes, int]:
        assert proof is not None
        proof.write_bytes(b"proof\n")
        return cnf.read_bytes(), timeout_s

    bare_result = runner(bare_cnf, 9, bare_proof)
    recorder = timing.TimingRecorder(
        timing.Clock(iter([0, 1]).__next__, iter([0, 1]).__next__)
    )
    timed_result = timing.timed_runner(recorder, "solver.run", runner)(
        timed_cnf, 9, timed_proof
    )

    assert timed_result == bare_result
    assert timed_proof.read_bytes() == bare_proof.read_bytes()
    assert timed_cnf.read_bytes() == bare_cnf.read_bytes()


def test_timed_fake_checker_is_artifact_byte_identical(
    tmp_path: Path,
) -> None:
    cnf = tmp_path / "terminal.cnf"
    proof = tmp_path / "terminal.drat"
    cnf.write_bytes(b"p cnf 0 0\n")
    proof.write_bytes(b"proof\n")

    def checker(cnf_path: Path, proof_path: Path, timeout_s: int) -> tuple[int, int]:
        return cnf_path.stat().st_size + proof_path.stat().st_size, timeout_s

    recorder = timing.TimingRecorder(
        timing.Clock(iter([0, 1]).__next__, iter([0, 1]).__next__)
    )
    timed = timing.timed_checker_runner(recorder, "terminal.check", checker)

    assert timed(cnf, proof, 11) == checker(cnf, proof, 11)
    assert recorder.samples[0]["counters"] == {
        "cnf_bytes": len(b"p cnf 0 0\n"),
        "proof_bytes": len(b"proof\n"),
    }


def test_benchmark_copies_fixture_and_rejects_active_output(
    tmp_path: Path,
) -> None:
    fixture = tmp_path / "fixture"
    fixture.mkdir()
    (fixture / "records.jsonl").write_bytes(b"{}\n")
    copied = timing.copy_fixture(fixture, tmp_path / "copy")
    assert (copied / "records.jsonl").read_bytes() == b"{}\n"

    active = tmp_path / "active"
    active.mkdir()
    with pytest.raises(timing.TimingJournalError, match="active output"):
        timing.copy_fixture(fixture, active / "benchmark", active_output_dirs=[active])
