from __future__ import annotations

import hashlib
import importlib
import json
from pathlib import Path
from typing import Any

import pytest

productivity = importlib.import_module("census.p97_search.phase3_productivity")
miner = importlib.import_module("census.p97_search.phase3_productivity_miner")
runtime = importlib.import_module("census.p97_search.phase3_cegar_runtime")


def _source_record(
    index: int,
    previous_record_sha256: str | None = None,
) -> dict[str, Any]:
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
    return productivity.with_record_hash(unsigned, previous_record_sha256)


def _source_records(count: int) -> list[dict[str, Any]]:
    records: list[dict[str, Any]] = []
    previous: str | None = None
    for index in range(count):
        record = _source_record(index, previous)
        records.append(record)
        previous = record["record_sha256"]
    return records


def _productivity_records(count: int) -> list[dict[str, Any]]:
    records: list[dict[str, Any]] = []
    previous: str | None = None
    for index in range(count):
        record = productivity.make_record(
            index=index,
            raw_sat_index=index,
            assignment_sha256=f"assignment-{index}",
            classification="learned-structural",
            source_record=_source_record(index),
            timings_ns={"total": index + 1},
            antichain={"outcome": "active-antichain", "added": True},
            bounded_elimination={"kind": "source-assignment", "count": 1},
            previous_record_sha256=previous,
        )
        records.append(record)
        previous = record["record_sha256"]
    return records


def _scan(records: list[dict[str, Any]]) -> runtime.JournalScan:
    scan = runtime.JournalScan()
    for record in records:
        scan.observe(productivity.canonical_bytes(record) + b"\n")
    return scan


def test_productivity_ledger_is_authenticated_and_tamper_evident() -> None:
    records = _productivity_records(2)
    contract = records[0]["ingress_contract"]
    assert contract["evidence_classification"] == productivity.LOCAL_CERTIFICATE
    assert contract["promotion_eligible"] is False
    assert "producer_theorem" in contract["missing_fields"]
    ledger = productivity.ProductivityLedger.from_authenticated_records(
        records, _scan(records)
    )
    snapshot = ledger.snapshot().as_dict()
    assert snapshot["record_count"] == 2
    assert snapshot["terminal_record_sha256"] == records[-1]["record_sha256"]

    tampered = json.loads(json.dumps(records))
    tampered[1]["classification"] = "tampered"
    with pytest.raises(productivity.ProductivityError, match="hash mismatch"):
        productivity.ProductivityLedger.from_authenticated_records(
            tampered, _scan(tampered)
        )


def test_promoted_ingress_contract_requires_source_producer_and_consumer() -> None:
    base = {
        "schema": productivity.INGRESS_CONTRACT_SCHEMA,
        "evidence_classification": productivity.UNIFORM_PRODUCER,
        "promotion_eligible": True,
        "live_leaf": "Problem97.example",
        "ingress_hypotheses_sha256": "a" * 64,
        "finite_schema": "example-v1",
        "cardinality_scope": "all finite cardinalities",
        "source_theorem": "Problem97.source",
        "producer_theorem": "Problem97.producer",
        "lift_theorem": None,
        "consumer_theorem": "Problem97.consumer",
        "missing_fields": [],
    }
    productivity.validate_ingress_contract(base)

    missing_consumer = dict(base)
    missing_consumer["consumer_theorem"] = None
    with pytest.raises(productivity.ProductivityError, match="consumer_theorem"):
        productivity.validate_ingress_contract(missing_consumer)

    lifted = dict(base)
    lifted["evidence_classification"] = productivity.LIFTED_CONSUMER
    with pytest.raises(productivity.ProductivityError, match="lift_theorem"):
        productivity.validate_ingress_contract(lifted)


def test_core_miner_is_parked_and_negative_control_is_visible() -> None:
    records = _source_records(2)

    def reject_without_all_rows(certificate: dict[str, Any]) -> None:
        if len(certificate["rows"]) < 2:
            raise ValueError("core is necessary")

    report = productivity.mine_records(
        records,
        source_file_sha256="source-sha256",
        replay_certificate=reject_without_all_rows,
    )
    assert report["ingress"]["evidence_classification_counts"] == {
        productivity.LOCAL_CERTIFICATE: 2
    }
    assert report["ingress"]["live_leaf_counts"] == {"UNDECLARED": 2}
    assert report["ingress"]["missing_field_counts"]["producer_theorem"] == 2
    assert report["ingress"]["promotion_eligible_count"] == 0
    assert report["status"] == productivity.PARKED_SPEC
    assert len(report["repeated_core_groups"]) == 1
    assert report["repeated_core_groups"][0]["status"] == (productivity.PARKED_SPEC)
    assert all(
        item["negative_control"]["status"] == "PASS"
        for item in report["negative_controls"]
    )

    accepting = productivity.mine_records(
        records,
        replay_certificate=lambda _certificate: None,
    )
    assert all(
        item["negative_control"]["status"] == "FAIL_UNUSED_CORE_ITEM"
        for item in accepting["negative_controls"]
    )


def test_miner_file_validates_source_and_writes_authenticated_report(
    tmp_path: Path,
) -> None:
    source = tmp_path / "learned.jsonl"
    source.write_bytes(
        b"".join(
            productivity.canonical_bytes(record) + b"\n"
            for record in _source_records(2)
        )
    )
    output = tmp_path / "miner.json"
    report = miner.mine_file(source, output)
    assert output.is_file()
    assert json.loads(output.read_text()) == report
    assert (
        report["source"]["source_file_sha256"]
        == hashlib.sha256(source.read_bytes()).hexdigest()
    )

    source.write_bytes(source.read_bytes().replace(b'"r1"', b'"rX"', 1))
    with pytest.raises(productivity.ProductivityError, match="hash mismatch"):
        miner.mine_file(source, output)
