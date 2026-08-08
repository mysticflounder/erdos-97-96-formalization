from __future__ import annotations

import json
from concurrent.futures import ThreadPoolExecutor
from pathlib import Path
from threading import Event
from typing import Any

import pytest

from census.p97_search import phase3_piqd_campaign as campaign
from census.p97_search.phase3_piqd_driver import DurableAttemptJournal


def _write(path: Path, payload: bytes) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_bytes(payload)


def _json(path: Path, value: Any, *, newline: bool = False) -> None:
    suffix = b"\n" if newline else b""
    _write(path, campaign.canonical_json_bytes(value) + suffix)


def _accepted_receipt(
    model_hash: str,
    cell_index: int,
    job_id: str,
    *,
    source_job: Path,
    discovery_cnf: Path,
    model: Path,
) -> dict[str, Any]:
    return {
        "schema": campaign.REPLAY_SCHEMA,
        "semantic_status": "FINITE_SOURCE_SEMANTIC_REPLAY",
        "scope": "test finite-local replay",
        "inputs": {
            "source_job": str(source_job),
            "discovery_cnf": str(discovery_cnf),
            "model": str(model),
            "expected_piqd_job_id": job_id,
        },
        "hashes": {
            "source_job_sha256": campaign.sha256_bytes(source_job.read_bytes()),
            "discovery_cnf_sha256": campaign.sha256_bytes(discovery_cnf.read_bytes()),
            "model_sha256": model_hash,
        },
        "gates": {"exact_cnf": {"ok": True}, "source_faithful_candidate": {"ok": True}},
        "status": "ACCEPTED",
        "job": {"cell_index": cell_index, "piqd_job_id": job_id},
    }


def _make_package(root: Path, ordinal: int) -> tuple[Path, dict[str, Any]]:
    package = root / f"package-{ordinal}"
    package.mkdir()
    cnf_raw = b"p cnf 1 1\n1 0\n"
    source_bundle = {"bundle": 1}
    ingress_contract = {"cell": ordinal}
    compiler_manifest = {"cell": {"ordinal": ordinal}, "schema": "test-compiler/v1"}
    clause_delta = {
        "cell": {"ordinal": ordinal},
        "hashes": {"dimacs_sha256": campaign.sha256_bytes(cnf_raw)},
    }
    job_id = f"source-job-{ordinal}"
    order_cell = {
        "job_id": job_id,
        "shard_id": ordinal,
        "shard_count": 4,
    }
    variable_map = {"cell_index": ordinal, "job_id": job_id}
    raw_documents = {
        "clause-delta.json": campaign.canonical_json_bytes(clause_delta),
        "compiler-manifest.json": campaign.canonical_json_bytes(compiler_manifest),
        "discovery.cnf": cnf_raw,
        "ingress-contract.json": campaign.canonical_json_bytes(ingress_contract),
        "order-cell.json": campaign.canonical_json_bytes(order_cell),
        "source-bundle.json": campaign.canonical_json_bytes(source_bundle),
        "variable-map.json": campaign.canonical_json_bytes(variable_map),
    }
    source_job = {
        "cell_index": ordinal,
        "job_id": job_id,
        "cnf": {
            "bytes": len(cnf_raw),
            "encoding": "DIMACS",
            "n_clauses": 1,
            "n_variables": 1,
            "sha256": campaign.sha256_bytes(cnf_raw),
        },
        "compiler_manifest": compiler_manifest,
        "compiler_manifest_sha256": campaign.sha256_bytes(
            raw_documents["compiler-manifest.json"]
        ),
        "clause_delta_artifact": clause_delta,
        "clause_delta_artifact_sha256": campaign.sha256_bytes(
            raw_documents["clause-delta.json"]
        ),
    }
    raw_documents["source-job.json"] = campaign.canonical_json_bytes(source_job)
    artifact_names = {
        "clause_delta": "clause-delta.json",
        "cnf": "discovery.cnf",
        "compiler_manifest": "compiler-manifest.json",
        "ingress_contract": "ingress-contract.json",
        "order_cell": "order-cell.json",
        "source_bundle": "source-bundle.json",
        "source_job": "source-job.json",
        "variable_map": "variable-map.json",
    }
    artifacts = {
        logical: {
            "path": filename,
            "sha256": campaign.sha256_bytes(raw_documents[filename]),
        }
        for logical, filename in artifact_names.items()
    }
    artifacts["cnf"].update(
        {"bytes": len(cnf_raw), "num_variables": 1, "num_clauses": 1}
    )
    producer = {
        "artifacts": artifacts,
        "provenance": {
            "source_bundle_sha256": artifacts["source_bundle"]["sha256"],
            "compiler_manifest_sha256": artifacts["compiler_manifest"]["sha256"],
            "clause_delta_artifact_sha256": artifacts["clause_delta"]["sha256"],
        },
    }
    raw_documents["producer-manifest.json"] = campaign.canonical_json_bytes(producer)
    wave = {
        "schema": "p97-cegar-wave/v1",
        "wave_id": f"test-wave-{ordinal}",
        "iteration": 0,
        "parent_checkpoint_sha256": None,
        "source": {
            "live_leaf": "Test.liveLeaf",
            "ingress_hypotheses_sha256": artifacts["ingress_contract"]["sha256"],
            "finite_schema": "test finite schema",
            "cardinality_scope": "exact cardinality 12",
            "source_theorem": "Test.sourceTheorem",
        },
        "encoding": {
            "cnf_sha256": artifacts["cnf"]["sha256"],
            "variable_map_sha256": artifacts["variable_map"]["sha256"],
            "producer_manifest_sha256": campaign.sha256_bytes(
                raw_documents["producer-manifest.json"]
            ),
            "num_variables": 1,
            "num_clauses": 1,
            "query_polarity": "SAT_MEANS_COUNTEREXAMPLE",
        },
        "execution": {
            "backend": "cadical",
            "solver_profile": "unsat",
            "shard_id": ordinal,
            "shard_count": 4,
            "order_sha256": artifacts["order_cell"]["sha256"],
            "seed": 97,
        },
        "promotion": {
            "evidence_classification": "LOCAL_CERTIFICATE",
            "producer_theorem": None,
            "lift_theorem": None,
            "consumer_theorem": None,
        },
    }
    raw_documents["wave-manifest.json"] = campaign.canonical_json_bytes(wave)
    for filename, payload in raw_documents.items():
        _write(package / filename, payload)
    return package, wave


def _make_run(
    root: Path,
    ordinal: int,
    wave: dict[str, Any],
    package: Path,
    *,
    event_job_id: str | None = None,
    event_status: str = "completed",
    event_result: str = "SAT",
) -> tuple[Path, str, Path]:
    run = root / f"run-{ordinal}"
    journal_path = run / "journal.jsonl"
    journal = DurableAttemptJournal(journal_path, manifest=wave)
    journal.store_artifact((package / "discovery.cnf").read_bytes())
    journal.store_artifact((package / "producer-manifest.json").read_bytes())
    model = {
        "job_id": f"piqd-{ordinal}",
        "result": "SAT",
        "num_assigned": 1,
        "assignment": [1],
    }
    model_hash = journal.store_artifact(campaign.canonical_json_bytes(model))
    event = {
        "schema": "p97-cegar-piqd-event/v1",
        "phase": "MODEL",
        "disposition": "SUCCESS",
        "retry_index": 0,
        "poll_index": None,
        "job_id": event_job_id or model["job_id"],
        "status": event_status,
        "result": event_result,
        "detail": "synthetic model independently satisfies submitted CNF",
        "response": {"num_assigned": 1},
    }
    journal.append_event(
        event=event,
        outcome=campaign.STRUCTURAL_SAT,
        detail="MODEL: source replay required",
        artifact_overrides={"model_sha256": model_hash},
    )
    journal.seal()
    return run, model_hash, journal.artifact_dir / model_hash


@pytest.fixture
def fixture(tmp_path: Path, monkeypatch: pytest.MonkeyPatch) -> dict[str, Any]:
    packages: list[Path] = []
    runs: list[Path] = []
    receipts: list[Path] = []
    classifiers: list[Path] = []
    model_hashes: list[str] = []
    source_hash = campaign.sha256_bytes(campaign.canonical_json_bytes({"bundle": 1}))
    detector_hash = "d" * 64

    for ordinal in range(4):
        package, wave = _make_package(tmp_path, ordinal)
        packages.append(package)
        run, model_hash, model_path = _make_run(tmp_path, ordinal, wave, package)
        model_hashes.append(model_hash)
        runs.append(run)

        receipt = tmp_path / f"receipt-{ordinal}.json"
        _json(
            receipt,
            _accepted_receipt(
                model_hash,
                ordinal,
                f"piqd-{ordinal}",
                source_job=package / "source-job.json",
                discovery_cnf=package / "discovery.cnf",
                model=model_path,
            ),
            newline=True,
        )
        receipts.append(receipt)

        classifier = tmp_path / f"classifier-{ordinal}.json"
        campaign.write_canonical_json(
            classifier,
            campaign.make_classifier(
                model_sha256=model_hash,
                source_bundle_sha256=source_hash,
                detector_contract_sha256=detector_hash,
                certificate_sha256=f"{ordinal + 1:064x}",
                stage="equality-duplicate-center",
            ),
        )
        classifiers.append(classifier)

    manifest = campaign.make_campaign_manifest(packages, "repair-source-entitlement")
    manifest_path = tmp_path / "campaign.json"
    campaign.write_canonical_json(manifest_path, manifest)
    state = tmp_path / "campaign.jsonl"

    def fake_replay(
        _repo_root: Path,
        *,
        source_job_path: Path,
        source_job_bytes: bytes,
        discovery_cnf_path: Path,
        discovery_cnf_bytes: bytes,
        model_path: Path,
        model_bytes: bytes,
        expected_piqd_job_id: str,
    ) -> dict[str, Any]:
        ordinal = int(expected_piqd_job_id.rsplit("-", 1)[1])
        receipt = _accepted_receipt(
            campaign.sha256_bytes(model_bytes),
            ordinal,
            expected_piqd_job_id,
            source_job=source_job_path,
            discovery_cnf=discovery_cnf_path,
            model=model_path,
        )
        receipt["hashes"]["source_job_sha256"] = campaign.sha256_bytes(source_job_bytes)
        receipt["hashes"]["discovery_cnf_sha256"] = campaign.sha256_bytes(
            discovery_cnf_bytes
        )
        return receipt

    monkeypatch.setattr(campaign, "replay_exact12_model_snapshot", fake_replay)
    return {
        "manifest": manifest_path,
        "state": state,
        "runs": runs,
        "packages": packages,
        "waves": [
            json.loads((path / "wave-manifest.json").read_text()) for path in packages
        ],
        "receipts": receipts,
        "classifiers": classifiers,
        "model_hashes": model_hashes,
        "tmp": tmp_path,
    }


def _admit(data: dict[str, Any], ordinal: int) -> dict[str, Any]:
    return campaign.process_cell(
        data["manifest"],
        data["state"],
        ordinal=ordinal,
        journal_path=data["runs"][ordinal] / "journal.jsonl",
        receipt_path=data["receipts"][ordinal],
        classifier_path=data["classifiers"][ordinal],
        repo_root=data["tmp"],
    )


def test_three_adjacent_survivors_require_predeclared_pivot(
    fixture: dict[str, Any],
) -> None:
    assert _admit(fixture, 0)["status"] == "CONTINUE"
    second = _admit(fixture, 1)
    assert second["status"] == "CONTINUE"
    assert second["consecutive_count"] == 2
    result = _admit(fixture, 2)
    assert result["status"] == "PIVOT_REQUIRED"
    assert result["first_ordinal"] == 0
    assert result["last_ordinal"] == 2
    assert result["consecutive_count"] == 3
    assert result["pivot_id"] == "repair-source-entitlement"
    assert result["claims"] == campaign.NO_CLAIMS
    result_path = fixture["state"].with_name("campaign.jsonl.result.json")
    result_path.unlink()
    assert _admit(fixture, 2) == result
    assert json.loads(result_path.read_text()) == result
    with pytest.raises(campaign.PiqdCampaignError, match="already reached"):
        _admit(fixture, 3)


def test_order_violation_fails_closed(fixture: dict[str, Any]) -> None:
    with pytest.raises(campaign.PiqdCampaignError, match="strictly in manifest order"):
        _admit(fixture, 1)


def test_duplicate_is_idempotent_but_divergence_is_rejected(
    fixture: dict[str, Any],
) -> None:
    first = _admit(fixture, 0)
    assert _admit(fixture, 0) == first
    classifier = json.loads(fixture["classifiers"][0].read_text())
    classifier["stage"] = "different-stage"
    campaign.write_canonical_json(fixture["classifiers"][0], classifier)
    with pytest.raises(campaign.PiqdCampaignError, match="divergent duplicate"):
        _admit(fixture, 0)


def test_receipt_replay_tamper_fails_closed(
    fixture: dict[str, Any], monkeypatch: pytest.MonkeyPatch
) -> None:
    receipt = json.loads(fixture["receipts"][0].read_text())
    receipt["gates"]["exact_cnf"]["ok"] = False
    campaign.write_canonical_json(fixture["receipts"][0], receipt)
    with pytest.raises(campaign.PiqdCampaignError, match="all gates true"):
        _admit(fixture, 0)

    receipt["gates"]["exact_cnf"]["ok"] = True
    campaign.write_canonical_json(fixture["receipts"][0], receipt)
    monkeypatch.setattr(
        campaign,
        "replay_exact12_model_snapshot",
        lambda *_args, **_kwargs: {**receipt, "scope": "fresh replay changed"},
    )
    with pytest.raises(campaign.PiqdCampaignError, match="differs byte-for-byte"):
        _admit(fixture, 0)


def test_classifier_model_and_hash_tamper_fail_closed(fixture: dict[str, Any]) -> None:
    classifier = json.loads(fixture["classifiers"][0].read_text())
    classifier["model_sha256"] = "a" * 64
    campaign.write_canonical_json(fixture["classifiers"][0], classifier)
    with pytest.raises(
        campaign.PiqdCampaignError, match="classifier model hash mismatch"
    ):
        _admit(fixture, 0)

    classifier["model_sha256"] = fixture["model_hashes"][0]
    classifier["source_bundle_sha256"] = "b" * 64
    campaign.write_canonical_json(fixture["classifiers"][0], classifier)
    with pytest.raises(campaign.PiqdCampaignError, match="source bundle hash mismatch"):
        _admit(fixture, 0)


def test_restart_replays_durable_prefix(fixture: dict[str, Any]) -> None:
    _admit(fixture, 0)
    before = fixture["state"].read_bytes()
    result = _admit(fixture, 1)
    assert result["record_count"] == 2
    assert fixture["state"].read_bytes().startswith(before)
    assert fixture["state"].with_name("campaign.jsonl.result.json").is_file()


def test_manifest_policy_and_classifier_constructor_are_exact() -> None:
    classifier = campaign.make_classifier(
        model_sha256="1" * 64,
        source_bundle_sha256="2" * 64,
        detector_contract_sha256="3" * 64,
        certificate_sha256="4" * 64,
        stage="diagnostic-stage",
    )
    assert set(classifier) == campaign._CLASSIFIER_KEYS
    assert classifier["status"] == campaign.DIAGNOSTIC_STATUS
    assert classifier["scope"] == campaign.CAMPAIGN_SCOPE


def test_noncanonical_receipt_and_symlink_state_fail_closed(
    fixture: dict[str, Any],
) -> None:
    receipt = json.loads(fixture["receipts"][0].read_text())
    fixture["receipts"][0].write_text(json.dumps(receipt, indent=2) + "\n")
    with pytest.raises(campaign.PiqdCampaignError, match="canonical JSON object"):
        _admit(fixture, 0)

    fixture["receipts"][0].write_bytes(campaign.canonical_json_bytes(receipt) + b"\n")
    target = fixture["tmp"] / "target.jsonl"
    fixture["state"].symlink_to(target)
    with pytest.raises(campaign.PiqdCampaignError):
        _admit(fixture, 0)


def test_driver_artifact_directory_symlink_fails_before_journal_load(
    fixture: dict[str, Any],
) -> None:
    artifacts = fixture["runs"][0] / "journal.jsonl.artifacts"
    real = fixture["tmp"] / "real-artifacts"
    artifacts.rename(real)
    artifacts.symlink_to(real, target_is_directory=True)
    with pytest.raises(campaign.PiqdCampaignError, match="driver artifact directory"):
        _admit(fixture, 0)


def test_archived_artifact_symlink_and_nonregular_fail_preflight(
    fixture: dict[str, Any],
) -> None:
    artifacts = fixture["runs"][0] / "journal.jsonl.artifacts"
    model = artifacts / fixture["model_hashes"][0]
    real = fixture["tmp"] / "real-model"
    model.rename(real)
    model.symlink_to(real)
    with pytest.raises(campaign.PiqdCampaignError, match="not a regular file"):
        _admit(fixture, 0)

    model.unlink()
    model.mkdir()
    with pytest.raises(campaign.PiqdCampaignError, match="not a regular file"):
        _admit(fixture, 0)


@pytest.mark.parametrize("suffix", ["", ".seal.json"])
def test_driver_journal_and_seal_symlinks_fail_preflight(
    fixture: dict[str, Any], suffix: str
) -> None:
    path = fixture["runs"][0] / f"journal.jsonl{suffix}"
    real = fixture["tmp"] / f"real-journal{suffix.replace('.', '-')}"
    path.rename(real)
    path.symlink_to(real)
    with pytest.raises(campaign.PiqdCampaignError, match="driver journal"):
        _admit(fixture, 0)


@pytest.mark.parametrize("suffix", ["", ".seal.json"])
def test_driver_journal_and_seal_nonregular_fail_preflight(
    fixture: dict[str, Any], suffix: str
) -> None:
    path = fixture["runs"][0] / f"journal.jsonl{suffix}"
    path.unlink()
    path.mkdir()
    with pytest.raises(campaign.PiqdCampaignError, match="not a regular file"):
        _admit(fixture, 0)


def test_source_job_and_receipt_cell_bindings_fail_closed(
    fixture: dict[str, Any],
) -> None:
    source_job_path = fixture["packages"][0] / "source-job.json"
    source_job = json.loads(source_job_path.read_text())
    source_job["cell_index"] = 3
    _json(source_job_path, source_job)
    with pytest.raises(campaign.PiqdCampaignError, match="source-job cell_index"):
        campaign.make_campaign_manifest(
            [fixture["packages"][0]], "repair-source-entitlement"
        )

    source_job["cell_index"] = 0
    _json(source_job_path, source_job)
    receipt = json.loads(fixture["receipts"][0].read_text())
    receipt["job"]["cell_index"] = 1
    campaign.write_canonical_json(fixture["receipts"][0], receipt)
    with pytest.raises(campaign.PiqdCampaignError, match="receipt cell_index"):
        _admit(fixture, 0)


def test_terminal_checkpoint_must_bind_completed_sat_model(
    fixture: dict[str, Any],
) -> None:
    run, _model_hash, _model_path = _make_run(
        fixture["tmp"],
        10,
        fixture["waves"][0],
        fixture["packages"][0],
        event_result="UNKNOWN",
    )
    with pytest.raises(campaign.PiqdCampaignError, match="terminal checkpoint event"):
        campaign.process_cell(
            fixture["manifest"],
            fixture["state"],
            ordinal=0,
            journal_path=run / "journal.jsonl",
            receipt_path=fixture["receipts"][0],
            classifier_path=fixture["classifiers"][0],
            repo_root=fixture["tmp"],
        )


def test_producer_package_cross_binding_fails_closed(fixture: dict[str, Any]) -> None:
    producer_path = fixture["packages"][0] / "producer-manifest.json"
    producer = json.loads(producer_path.read_text())
    producer["artifacts"]["order_cell"]["path"] = "wrong-order.json"
    _json(producer_path, producer)
    wave_path = fixture["packages"][0] / "wave-manifest.json"
    wave = json.loads(wave_path.read_text())
    wave["encoding"]["producer_manifest_sha256"] = campaign.sha256_bytes(
        producer_path.read_bytes()
    )
    _json(wave_path, wave)
    with pytest.raises(campaign.PiqdCampaignError, match="order_cell path"):
        campaign.make_campaign_manifest(
            [fixture["packages"][0]], "repair-source-entitlement"
        )


def test_campaign_record_exact_schema_and_pivot_prefix_are_enforced(
    fixture: dict[str, Any],
) -> None:
    _admit(fixture, 0)
    record = json.loads(fixture["state"].read_text())
    record["unexpected"] = True
    unsigned = dict(record)
    unsigned.pop("record_sha256")
    record["record_sha256"] = campaign.sha256_json(unsigned)
    fixture["state"].write_bytes(campaign.canonical_json_bytes(record) + b"\n")
    with pytest.raises(campaign.PiqdCampaignError, match="keys mismatch"):
        _admit(fixture, 1)


def test_existing_pivot_worthy_prefix_overrun_is_rejected(
    fixture: dict[str, Any],
) -> None:
    for ordinal in range(3):
        _admit(fixture, ordinal)
    records = [json.loads(line) for line in fixture["state"].read_text().splitlines()]
    fourth = dict(records[-1])
    cell = json.loads(fixture["manifest"].read_text())["cells"][3]
    fourth.update(
        {
            "ordinal": 3,
            "cell_index": cell["cell_index"],
            "package_identity_sha256": cell["package_identity_sha256"],
            "wave_manifest_sha256": cell["wave_manifest_sha256"],
            "previous_record_sha256": records[-1]["record_sha256"],
        }
    )
    unsigned = dict(fourth)
    unsigned.pop("record_sha256")
    fourth["record_sha256"] = campaign.sha256_json(unsigned)
    fixture["state"].write_bytes(
        b"".join(
            campaign.canonical_json_bytes(row) + b"\n" for row in [*records, fourth]
        )
    )
    with pytest.raises(campaign.PiqdCampaignError, match="pivot-worthy prefix"):
        _admit(fixture, 3)


def test_campaign_lock_makes_concurrent_identical_admission_idempotent(
    fixture: dict[str, Any],
) -> None:
    with ThreadPoolExecutor(max_workers=2) as executor:
        results = list(executor.map(lambda _unused: _admit(fixture, 0), range(2)))
    assert results[0] == results[1]
    assert len(fixture["state"].read_text().splitlines()) == 1


def test_campaign_replay_uses_authenticated_snapshots_without_reopening(
    fixture: dict[str, Any], monkeypatch: pytest.MonkeyPatch
) -> None:
    archived = json.loads(fixture["receipts"][0].read_text())
    source_path = fixture["packages"][0] / "source-job.json"
    cnf_path = fixture["packages"][0] / "discovery.cnf"
    expected_source = source_path.read_bytes()
    expected_cnf = cnf_path.read_bytes()
    expected_model_hash = fixture["model_hashes"][0]

    def mutate_paths_after_snapshot(
        _repo_root: Path, **snapshot: Any
    ) -> dict[str, Any]:
        assert snapshot["source_job_bytes"] == expected_source
        assert snapshot["discovery_cnf_bytes"] == expected_cnf
        assert campaign.sha256_bytes(snapshot["model_bytes"]) == expected_model_hash
        source_path.write_bytes(b"{}")
        cnf_path.write_bytes(b"p cnf 0 0\n")
        Path(snapshot["model_path"]).write_bytes(b"{}")
        return archived

    monkeypatch.setattr(
        campaign, "replay_exact12_model_snapshot", mutate_paths_after_snapshot
    )
    assert _admit(fixture, 0)["status"] == "CONTINUE"


@pytest.mark.parametrize(
    "malformed_hashes",
    ["not-an-object", {"model_sha256": "not-a-digest"}],
)
def test_malformed_receipt_hashes_are_campaign_errors(
    fixture: dict[str, Any], malformed_hashes: Any
) -> None:
    receipt = json.loads(fixture["receipts"][0].read_text())
    receipt["hashes"] = malformed_hashes
    campaign.write_canonical_json(fixture["receipts"][0], receipt)
    with pytest.raises(campaign.PiqdCampaignError, match="receipt hashes"):
        _admit(fixture, 0)


def test_lock_and_result_symlink_targets_fail_closed(
    fixture: dict[str, Any], tmp_path: Path
) -> None:
    lock_target = tmp_path / "lock-target"
    lock_target.write_bytes(b"keep")
    lock_path = fixture["state"].with_name(f"{fixture['state'].name}.lock")
    lock_path.symlink_to(lock_target)
    with pytest.raises(campaign.PiqdCampaignError, match="lock is not a regular"):
        _admit(fixture, 0)
    assert lock_target.read_bytes() == b"keep"

    lock_path.unlink()
    _admit(fixture, 0)
    _admit(fixture, 1)
    result_target = tmp_path / "result-target"
    result_target.write_bytes(b"keep")
    result_path = fixture["state"].with_name("campaign.jsonl.result.json")
    result_path.unlink()
    result_path.symlink_to(result_target)
    with pytest.raises(campaign.PiqdCampaignError, match="write target"):
        _admit(fixture, 2)
    assert result_target.read_bytes() == b"keep"
    assert len(fixture["state"].read_text().splitlines()) == 3

    result_path.unlink()
    repaired = _admit(fixture, 2)
    assert repaired["status"] == "PIVOT_REQUIRED"
    assert json.loads(result_path.read_text()) == repaired


def test_concurrent_divergent_duplicate_has_one_winner(
    fixture: dict[str, Any], tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    alternate = tmp_path / "classifier-alternate.json"
    classifier = json.loads(fixture["classifiers"][0].read_text())
    classifier["stage"] = "alternate-stage"
    campaign.write_canonical_json(alternate, classifier)

    entered = Event()
    release = Event()
    original_replay = campaign.replay_exact12_model_snapshot

    def blocking_replay(*args: Any, **kwargs: Any) -> dict[str, Any]:
        entered.set()
        assert release.wait(timeout=5)
        return original_replay(*args, **kwargs)

    monkeypatch.setattr(campaign, "replay_exact12_model_snapshot", blocking_replay)
    with ThreadPoolExecutor(max_workers=2) as executor:
        first = executor.submit(_admit, fixture, 0)
        assert entered.wait(timeout=5)
        second = executor.submit(
            campaign.process_cell,
            fixture["manifest"],
            fixture["state"],
            ordinal=0,
            journal_path=fixture["runs"][0] / "journal.jsonl",
            receipt_path=fixture["receipts"][0],
            classifier_path=alternate,
            repo_root=fixture["tmp"],
        )
        release.set()
        assert first.result(timeout=5)["status"] == "CONTINUE"
        with pytest.raises(campaign.PiqdCampaignError, match="divergent duplicate"):
            second.result(timeout=5)
    assert len(fixture["state"].read_text().splitlines()) == 1
