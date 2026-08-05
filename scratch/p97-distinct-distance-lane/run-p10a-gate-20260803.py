"""Bounded P10A telemetry/miner gate without the optional pytest dependency."""

from __future__ import annotations

import hashlib
import importlib
import json
import sys
import tempfile
from pathlib import Path
from typing import Any


ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT))


productivity = importlib.import_module(
    "census.p97_search.phase3_productivity"
)
miner = importlib.import_module("census.p97_search.phase3_productivity_miner")
runtime = importlib.import_module("census.p97_search.phase3_cegar_runtime")
v3 = importlib.import_module(
    "census.p97_search.phase3_structural_cegar_projected_static_v3"
)


def source_record(index: int, previous: str | None) -> dict[str, Any]:
    unsigned = {
        "schema": "synthetic-learned-v1",
        "index": index,
        "origin": "synthetic",
        "raw_sat_index": index,
        "stage": "synthetic-stage",
        "certificate_kind": "synthetic-kind",
        "certificate": {
            "rows": ["r0", "r1"],
            "facts": ["f0"],
            "orders": ["o0"],
        },
        "clause": [-1, -2],
    }
    return productivity.with_record_hash(unsigned, previous)


def source_records(count: int) -> list[dict[str, Any]]:
    result: list[dict[str, Any]] = []
    previous: str | None = None
    for index in range(count):
        record = source_record(index, previous)
        result.append(record)
        previous = record["record_sha256"]
    return result


def product_records(count: int) -> list[dict[str, Any]]:
    result: list[dict[str, Any]] = []
    previous: str | None = None
    sources = source_records(count)
    for index in range(count):
        record = productivity.make_record(
            index=index,
            raw_sat_index=index,
            assignment_sha256=f"assignment-{index}",
            classification="learned-structural",
            source_record=sources[index],
            timings_ns={"total": index + 1},
            antichain={"outcome": "active-antichain", "added": True},
            bounded_elimination={"kind": "source-assignment", "count": 1},
            previous_record_sha256=previous,
        )
        result.append(record)
        previous = record["record_sha256"]
    return result


def scan(records: list[dict[str, Any]]) -> runtime.JournalScan:
    result = runtime.JournalScan()
    for record in records:
        result.observe(productivity.canonical_bytes(record) + b"\n")
    return result


def first_projected_survivor_assignment() -> dict[int, bool]:
    fixture = (
        v3.ROOT
        / "scratch/p97-distinct-distance-lane"
        / "phase3_projected_static_v2_shell_exact_depth5_v1e_20260729"
        / "shard-04/survivors.jsonl"
    )
    encoding = v3._phase3_encoding(projected_static_v3=True)
    for line in fixture.read_text().splitlines():
        record = json.loads(line)
        assignment = encoding.assignment_from_record(record)
        obj = encoding.decode(assignment)
        encoding.validate(obj, assignment)
        if v3._combined_detection(encoding, v3._metric_rows(obj)) is None:
            return assignment
    raise AssertionError("no projected-static survivor in fixture")


def sat_runner(assignment: dict[int, bool]):
    def run(_cnf: Path, _timeout: int, _proof: Path | None) -> Any:
        return v3.sat.SolverResult(
            "SAT", assignment, 10, "s SATISFIABLE\n", ""
        )

    return run


def run_driver(out: Path, *, telemetry: bool) -> dict[str, Any]:
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
        solver_runner=sat_runner(first_projected_survivor_assignment()),
    )


def main() -> None:
    records = product_records(2)
    ledger = productivity.ProductivityLedger.from_authenticated_records(
        records, scan(records)
    )
    assert ledger.snapshot().record_count == 2
    tampered = json.loads(json.dumps(records))
    tampered[1]["classification"] = "tampered"
    try:
        productivity.ProductivityLedger.from_authenticated_records(
            tampered, scan(tampered)
        )
    except productivity.ProductivityError:
        pass
    else:
        raise AssertionError("tampered productivity record was accepted")

    sources = source_records(2)

    def reject_without_all_rows(certificate: dict[str, Any]) -> None:
        if len(certificate["rows"]) < 2:
            raise ValueError("row is necessary")

    report = productivity.mine_records(
        sources,
        source_file_sha256="synthetic-source",
        replay_certificate=reject_without_all_rows,
    )
    assert report["status"] == productivity.PARKED_SPEC
    assert len(report["repeated_core_groups"]) == 1
    assert all(
        item["negative_control"]["status"] == "PASS"
        for item in report["negative_controls"]
    )

    root = Path(tempfile.mkdtemp(prefix="p10a-gate-", dir=v3.ROOT / "scratch"))
    source_path = root / "learned.jsonl"
    source_path.write_bytes(
        b"".join(productivity.canonical_bytes(item) + b"\n" for item in sources)
    )
    report_path = root / "miner.json"
    mined = miner.mine_file(source_path, report_path)
    assert json.loads(report_path.read_text()) == mined
    assert mined["source"]["source_file_sha256"] == hashlib.sha256(
        source_path.read_bytes()
    ).hexdigest()

    control = run_driver(root / "control", telemetry=False)
    observed = run_driver(root / "observed", telemetry=True)
    assert control["status"] == observed["status"] == "CHECKPOINT"
    assert control["counts"] == observed["counts"]
    assert control["stream_ledgers"] == observed["stream_ledgers"]
    for name in (
        "learned-certificates.jsonl",
        "survivors.jsonl",
        "solver-logs.jsonl",
    ):
        assert (
            (root / "control" / name).read_bytes()
            == (root / "observed" / name).read_bytes()
        )
    assert not (root / "control" / "productivity.jsonl").exists()
    product = observed["productivity_stream"]
    assert product["record_count"] == 1
    assert (
        observed["artifact_hashes"]["productivity.jsonl"]
        == product["file_sha256"]
    )
    print(
        json.dumps(
            {
                "gate": "P10A",
                "status": "PASS",
                "root": str(root),
                "telemetry_record_count": product["record_count"],
                "repeated_core_groups": len(report["repeated_core_groups"]),
                "report_sha256": mined["report_sha256"],
            },
            sort_keys=True,
        )
    )


if __name__ == "__main__":
    main()
