from __future__ import annotations

import importlib
import json
from pathlib import Path
from typing import Any

v3 = importlib.import_module(
    "census.p97_search.phase3_structural_cegar_projected_static_v3"
)

PROJECTED_SURVIVORS = (
    v3.ROOT
    / "scratch/p97-distinct-distance-lane"
    / "phase3_projected_static_v2_shell_exact_depth5_v1e_20260729"
    / "shard-04/survivors.jsonl"
)


def _first_projected_survivor_assignment() -> dict[int, bool]:
    encoding = v3._phase3_encoding(projected_static_v3=True)
    for line in PROJECTED_SURVIVORS.read_text().splitlines():
        record = json.loads(line)
        assignment = encoding.assignment_from_record(record)
        obj = encoding.decode(assignment)
        encoding.validate(obj, assignment)
        if v3._combined_detection(encoding, v3._metric_rows(obj)) is None:
            return assignment
    raise AssertionError("fixture has no projected-static-v3 survivor")


def _sat_runner(assignment: dict[int, bool]):
    def run(
        _cnf: Path, _timeout: int, _proof: Path | None
    ) -> Any:
        return v3.sat.SolverResult(
            "SAT", assignment, 10, "s SATISFIABLE\n", ""
        )

    return run


def _run(out: Path, *, telemetry: bool) -> dict[str, Any]:
    return v3.run_driver(
        out,
        timeout_s=5,
        learned_core_limit=1000,
        survivor_limit=2,
        bootstrap_results=None,
        algebraic_bootstrap=None,
        projected_static_v3=True,
        max_new_raw=1,
        productivity_telemetry=telemetry,
        solver_runner=_sat_runner(_first_projected_survivor_assignment()),
    )


def test_productivity_telemetry_is_passive_for_bounded_checkpoint(
    tmp_path: Path,
) -> None:
    control = _run(tmp_path / "control", telemetry=False)
    observed = _run(tmp_path / "observed", telemetry=True)

    assert observed["status"] == control["status"] == "CHECKPOINT"
    assert observed["counts"] == control["counts"]
    assert observed["stream_ledgers"] == control["stream_ledgers"]
    assert observed["artifact_hashes"]["learned-certificates.jsonl"] == (
        control["artifact_hashes"]["learned-certificates.jsonl"]
    )
    assert observed["artifact_hashes"]["survivors.jsonl"] == (
        control["artifact_hashes"]["survivors.jsonl"]
    )
    assert observed["artifact_hashes"]["solver-logs.jsonl"] == (
        control["artifact_hashes"]["solver-logs.jsonl"]
    )
    product = observed["productivity_stream"]
    assert product["record_count"] == observed["counts"][
        "classified_raw_sat_count"
    ]
    assert (
        observed["artifact_hashes"]["productivity.jsonl"]
        == product["file_sha256"]
    )
    assert (tmp_path / "control" / "productivity.jsonl").exists() is False
    assert (tmp_path / "observed" / "productivity.jsonl").is_file()
