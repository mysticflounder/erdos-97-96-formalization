from __future__ import annotations

import json
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[3]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from census.p97_search import phase3_structural_cegar_projected_static_v3 as v3
from census.p97_search.benchmarks import phase3_cegar_benchmark as benchmark

PROJECTED_SURVIVORS = (
    ROOT
    / "scratch/p97-distinct-distance-lane"
    / "phase3_projected_static_v2_shell_exact_depth5_v1e_20260729"
    / "shard-04/survivors.jsonl"
)


def _undetected_assignment_fixture(tmp_path: Path) -> Path:
    encoding = v3._phase3_encoding(projected_static_v3=True)
    for raw in PROJECTED_SURVIVORS.read_bytes().splitlines():
        record = json.loads(raw)
        assignment = encoding.assignment_from_record(record)
        obj = encoding.decode(assignment)
        encoding.validate(obj, assignment)
        if v3._combined_detection(encoding, v3._metric_rows(obj)) is None:
            fixture = tmp_path / "assignment.jsonl"
            fixture.write_bytes(v3._canonical_bytes(record) + b"\n")
            return fixture
    raise AssertionError("projected survivor corpus has no v3-undetected assignment")


def test_mock_transcript_and_loader_commands_are_fake_and_replay_only(
    tmp_path: Path,
) -> None:
    assignment = _undetected_assignment_fixture(tmp_path)
    transcript_output = tmp_path / "mock-transcript"
    assignment_before = assignment.read_bytes()

    transcript_report = benchmark.benchmark_mock_transcript(
        assignment,
        transcript_output,
        fresh=1,
        warm=1,
    )

    assert assignment.read_bytes() == assignment_before
    assert transcript_report["timing_record_count"] > 0
    benchmark_manifest = v3._strict_json(
        transcript_output / "benchmark-manifest.json"
    )
    assert benchmark_manifest["subject"]["projected_static_v3"] is True
    assert benchmark_manifest["subject"]["order_bitsets_enabled"] is True
    assert {
        "classifier_minimizer",
        "cnf",
        "solver",
        "journal",
        "manifest",
        "terminal",
    } <= set(transcript_report["observed_stage_groups"])
    fresh_run = transcript_output / "runs/fresh-000"
    fresh_manifest = v3._strict_json(fresh_run / "manifest.json")
    assert fresh_manifest["terminal_drat_verified"] is True

    loader_output = tmp_path / "loader"
    fresh_tree_before = benchmark._tree_sha256(fresh_run)
    loader_report = benchmark.benchmark_loader(
        fresh_run,
        loader_output,
        fresh=1,
        warm=1,
    )

    assert benchmark._tree_sha256(fresh_run) == fresh_tree_before
    assert loader_report["timing_record_count"] > 0
    assert {"encoding", "loader", "manifest"} <= set(
        loader_report["observed_stage_groups"]
    )
    for run in loader_report["runs"]:
        assert run["tree_sha256_before"] == fresh_tree_before
        assert run["tree_sha256_after"] == fresh_tree_before


def test_cli_exposes_loader_and_mock_transcript_commands() -> None:
    parser = benchmark.build_parser()

    loader = parser.parse_args(
        ["loader", "--subject-run", "run", "--output", "bench"]
    )
    transcript = parser.parse_args(
        [
            "mock-transcript",
            "--assignment-jsonl",
            "assignment.jsonl",
            "--output",
            "bench",
        ]
    )
    runtime_ab = parser.parse_args(
        [
            "runtime-ab",
            "--assignment-jsonl",
            "assignment.jsonl",
            "--output",
            "bench-ab",
        ]
    )

    assert loader.command == "loader"
    assert transcript.command == "mock-transcript"
    assert runtime_ab.command == "runtime-ab"
    assert loader.fresh == transcript.fresh == 3
    assert loader.warm == transcript.warm == 5
    assert transcript.nonprojected is False
    assert transcript.legacy_order_coverage is False
    assert transcript.transcript_indices is None
    assert runtime_ab.manifest_audit_every == 1_000

    persistent_ab = parser.parse_args(
        [
            "persistent-ab",
            "--family",
            "shell:4",
            "--family",
            "frontier:12",
            "--family",
            "shared:24",
            "--output",
            "bench-persistent-ab",
            "--prefix-bank",
            "bank",
            "--prefix-root-sha256",
            "a" * 64,
            "--prefix-source-sha256",
            "b" * 64,
        ]
    )
    assert persistent_ab.command == "persistent-ab"
    assert persistent_ab.family == [("shell", 4), ("frontier", 12), ("shared", 24)]
    assert persistent_ab.worker_timeout == 1_800

    selected = parser.parse_args(
        [
            "runtime-ab",
            "--assignment-jsonl",
            "assignment.jsonl",
            "--output",
            "bench-ab",
            "--transcript-indices",
            "0, 8,11",
        ]
    )
    assert selected.transcript_indices == (0, 8, 11)

    accounting = parser.parse_args(
        ["accounting", "--output", "bench", "--records", "100"]
    )
    assert accounting.command == "accounting"
    assert accounting.records == 100
    assert accounting.sample_every == 1_000

    fault_matrix = parser.parse_args(
        ["fault-matrix", "--output", "faults"]
    )
    assert fault_matrix.command == "fault-matrix"

    legacy_nonprojected = parser.parse_args(
        [
            "mock-transcript",
            "--assignment-jsonl",
            "assignment.jsonl",
            "--output",
            "bench",
            "--nonprojected",
            "--legacy-order-coverage",
        ]
    )
    assert legacy_nonprojected.nonprojected is True
    assert legacy_nonprojected.legacy_order_coverage is True


def test_accounting_benchmark_compares_full_and_fast_manifests(
    tmp_path: Path,
) -> None:
    report = benchmark.benchmark_accounting(
        tmp_path / "accounting",
        records=100,
        sample_every=25,
    )

    assert report["manifest_equivalent"] is True
    assert report["full_manifest_sha256"] == report["fast_manifest_sha256"]
    assert report["sampled_publications"] == 4
    assert (tmp_path / "accounting/report.json").is_file()


def test_fault_matrix_covers_append_and_manifest_boundaries(
    tmp_path: Path,
) -> None:
    report = benchmark.benchmark_fault_matrix(tmp_path / "fault-matrix")

    assert report["matrix_pass"] is True
    assert {
        "append-write",
        "append-flush",
        "append-fsync",
    } <= {case["boundary"] for case in report["append_cases"]}
    assert {
        "generation-write",
        "first-directory-sync",
        "pointer-replace",
        "second-directory-sync",
    } <= {case["boundary"] for case in report["manifest_cases"]}
    post_commit = next(
        case
        for case in report["manifest_cases"]
        if case["boundary"] == "second-directory-sync"
    )
    assert post_commit["post_commit_sync_failure"] is True
    assert post_commit["pointer_generation"] == 2
    assert (tmp_path / "fault-matrix/report.json").is_file()


def test_runtime_ab_reports_semantic_and_artifact_equivalence(
    tmp_path: Path,
) -> None:
    assignment = _undetected_assignment_fixture(tmp_path)
    report = benchmark.benchmark_runtime_ab(
        assignment,
        tmp_path / "runtime-ab",
        fresh=1,
        warm=1,
    )

    assert report["semantic_manifest_equal"] is True
    assert report["non_manifest_artifacts_equal"] is True
    assert report["metrics"]["full_end_to_end_wall_ns_p95"] > 0
    assert report["metrics"]["fast_peak_rss_kib_p95"] > 0
    assert "driver/bounded_transcript" in report["fresh_stage_summary"]["full"]
    assert "driver/bounded_transcript" in report["fresh_stage_summary"]["fast"]
    assert (
        "driver/bounded_transcript"
        in report["fresh_stage_summary"]["fast_over_full_ratios"]
    )
    assert report["gate"]["bounded_canary_pass"] == (
        report["gate"]["end_to_end_p95_pass"]
        and report["gate"]["rss_p95_pass"]
        and report["gate"]["semantic_equivalence_pass"]
        and report["gate"]["artifact_equivalence_pass"]
    )
