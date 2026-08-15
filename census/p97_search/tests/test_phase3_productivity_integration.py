from __future__ import annotations

import importlib
import json
from pathlib import Path
from typing import Any

import pytest

v3 = importlib.import_module(
    "census.p97_search.phase3_structural_cegar_projected_static_v3"
)
runtime = importlib.import_module("census.p97_search.phase3_cegar_runtime")

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
    def run(_cnf: Path, _timeout: int, _proof: Path | None) -> Any:
        return v3.sat.SolverResult("SAT", assignment, 10, "s SATISFIABLE\n", "")

    return run


def _run(
    out: Path,
    *,
    telemetry: bool,
    ingress_contract: dict[str, Any] | None = None,
    resume: bool = False,
) -> dict[str, Any]:
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
        ingress_contract=ingress_contract,
        resume=resume,
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
    assert (
        observed["artifact_hashes"]["learned-certificates.jsonl"]
        == (control["artifact_hashes"]["learned-certificates.jsonl"])
    )
    assert (
        observed["artifact_hashes"]["survivors.jsonl"]
        == (control["artifact_hashes"]["survivors.jsonl"])
    )
    assert (
        observed["artifact_hashes"]["solver-logs.jsonl"]
        == (control["artifact_hashes"]["solver-logs.jsonl"])
    )
    product = observed["productivity_stream"]
    assert product["record_count"] == observed["counts"]["classified_raw_sat_count"]
    assert observed["artifact_hashes"]["productivity.jsonl"] == product["file_sha256"]
    assert (tmp_path / "control" / "productivity.jsonl").exists() is False
    assert (tmp_path / "observed" / "productivity.jsonl").is_file()


def test_ingress_contract_survives_authenticated_driver_record(
    tmp_path: Path,
) -> None:
    contract = {
        "schema": v3.productivity.INGRESS_CONTRACT_SCHEMA,
        "evidence_classification": v3.productivity.UNIFORM_PRODUCER,
        "promotion_eligible": True,
        "live_leaf": "Problem97.B1",
        "ingress_hypotheses_sha256": "b" * 64,
        "finite_schema": "b1-source-faithful-v1",
        "cardinality_scope": "all finite cardinalities",
        "source_theorem": "Problem97.B1.sourceIngress",
        "producer_theorem": "Problem97.B1.producer",
        "lift_theorem": None,
        "consumer_theorem": "Problem97.B1.consumer",
        "missing_fields": [],
    }
    _run(tmp_path / "contract", telemetry=True, ingress_contract=contract)

    records = [
        json.loads(line)
        for line in (tmp_path / "contract" / "productivity.jsonl")
        .read_text()
        .splitlines()
    ]
    assert len(records) == 1
    assert records[0]["ingress_contract"] == contract
    product_path = tmp_path / "contract" / "productivity.jsonl"
    scan = runtime.JournalScan()
    for line in product_path.read_bytes().splitlines(keepends=True):
        scan.observe(line)
    ledger = v3.productivity.ProductivityLedger.from_authenticated_records(
        records, scan
    )
    assert ledger.snapshot().record_count == 1
    assert ledger.snapshot().terminal_record_sha256 == records[0]["record_sha256"]
    assert (
        json.loads((tmp_path / "contract" / "manifest.json").read_text())[
            "configuration"
        ]["productivity_ingress_contract"]
        == contract
    )

    with pytest.raises(v3.StructuralCegarError, match="configuration/dependency"):
        _run(tmp_path / "contract", telemetry=True, resume=True)
