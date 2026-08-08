from __future__ import annotations

from copy import deepcopy

import pytest

from census.p97_search.phase3_cegar_wave import (
    CERTIFIED_UNSAT,
    DISCOVERY_UNSAT,
    LIFTED_CONSUMER,
    LOCAL_CERTIFICATE,
    METRIC_SAT,
    METRIC_UNKNOWN,
    STRUCTURAL_SAT,
    UNIFORM_PRODUCER,
    UNSAT_MEANS_OBSTRUCTION,
    WaveContractError,
    make_attempt_record,
    publication_assessment,
    validate_attempt_journal,
    validate_wave_manifest,
    wave_manifest_sha256,
)


def digest(char: str) -> str:
    return char * 64


def manifest(*, evidence_classification: str = UNIFORM_PRODUCER) -> dict:
    promotion = {
        "evidence_classification": evidence_classification,
        "producer_theorem": "Problem97.FiniteObstruction.producer",
        "lift_theorem": None,
        "consumer_theorem": "Problem97.ATailFrontierLiveClosure.consumer",
    }
    if evidence_classification == LOCAL_CERTIFICATE:
        promotion["producer_theorem"] = None
        promotion["consumer_theorem"] = None
    if evidence_classification == LIFTED_CONSUMER:
        promotion["lift_theorem"] = "Problem97.FiniteObstruction.lift"
    return {
        "schema": "p97-cegar-wave/v1",
        "wave_id": "a-tail-frontier-wave-17",
        "iteration": 17,
        "parent_checkpoint_sha256": digest("1"),
        "source": {
            "live_leaf": "Problem97.ATailFrontierLiveClosure.false_of_criticalPairFrontier",
            "ingress_hypotheses_sha256": digest("2"),
            "finite_schema": "critical-pair-frontier/v3",
            "cardinality_scope": "all finite metric configurations with |P| = n",
            "source_theorem": "Problem97.criticalPairFrontier_source",
        },
        "encoding": {
            "cnf_sha256": digest("3"),
            "variable_map_sha256": digest("4"),
            "producer_manifest_sha256": digest("5"),
            "num_variables": 120,
            "num_clauses": 900,
            "query_polarity": UNSAT_MEANS_OBSTRUCTION,
        },
        "execution": {
            "backend": "cadical",
            "solver_profile": "proof",
            "shard_id": 0,
            "shard_count": 8,
            "order_sha256": digest("6"),
            "seed": 97,
        },
        "promotion": promotion,
    }


def artifacts(**overrides: str | None) -> dict[str, str | None]:
    result: dict[str, str | None] = {
        "cnf_sha256": digest("3"),
        "model_sha256": None,
        "metric_witness_sha256": None,
        "metric_validation_sha256": None,
        "solver_log_sha256": None,
        "proof_sha256": None,
        "proof_checker_sha256": None,
        "proof_replay_sha256": None,
        "checkpoint_sha256": None,
    }
    result.update(overrides)
    return result


def certified_attempt(
    wave: dict, *, index: int = 0, previous: str | None = None
) -> dict:
    return make_attempt_record(
        manifest=wave,
        attempt_id=f"attempt-{index}",
        attempt_index=index,
        previous_attempt_sha256=previous,
        outcome=CERTIFIED_UNSAT,
        artifacts=artifacts(
            solver_log_sha256=digest("7"),
            proof_sha256=digest("8"),
            proof_checker_sha256=digest("9"),
            proof_replay_sha256=digest("a"),
        ),
    )


def test_manifest_binds_source_encoding_execution_and_promotion() -> None:
    wave = manifest()
    validate_wave_manifest(wave)
    assert len(wave_manifest_sha256(wave)) == 64


@pytest.mark.parametrize(
    ("path", "replacement"),
    [
        (("source", "ingress_hypotheses_sha256"), None),
        (("encoding", "variable_map_sha256"), "not-a-digest"),
        (("execution", "shard_id"), 8),
        (("execution", "seed"), -1),
    ],
)
def test_manifest_rejects_incomplete_or_invalid_identity(
    path: tuple[str, str], replacement: object
) -> None:
    wave = manifest()
    wave[path[0]][path[1]] = replacement
    with pytest.raises(WaveContractError):
        validate_wave_manifest(wave)


def test_manifest_rejects_unknown_fields() -> None:
    wave = manifest()
    wave["diagnostic_only"] = True
    with pytest.raises(WaveContractError, match="extra"):
        validate_wave_manifest(wave)


def test_nonzero_iteration_requires_parent_checkpoint() -> None:
    wave = manifest()
    wave["parent_checkpoint_sha256"] = None
    with pytest.raises(WaveContractError, match="parent_checkpoint"):
        validate_wave_manifest(wave)


@pytest.mark.parametrize(
    "evidence_classification",
    [UNIFORM_PRODUCER, LIFTED_CONSUMER],
)
def test_promoted_manifest_requires_theorem_ownership(
    evidence_classification: str,
) -> None:
    wave = manifest(evidence_classification=evidence_classification)
    wave["promotion"]["producer_theorem"] = None
    with pytest.raises(WaveContractError, match="producer_theorem"):
        validate_wave_manifest(wave)


def test_lifted_manifest_requires_lift_theorem() -> None:
    wave = manifest(evidence_classification=LIFTED_CONSUMER)
    wave["promotion"]["lift_theorem"] = None
    with pytest.raises(WaveContractError, match="lift_theorem"):
        validate_wave_manifest(wave)


def test_metric_sat_requires_model_and_independent_metric_validation() -> None:
    wave = manifest()
    with pytest.raises(WaveContractError, match="metric_witness_sha256"):
        make_attempt_record(
            manifest=wave,
            attempt_id="attempt-0",
            attempt_index=0,
            outcome=METRIC_SAT,
            artifacts=artifacts(model_sha256=digest("a")),
        )


def test_unknown_attempt_requires_reason() -> None:
    wave = manifest()
    with pytest.raises(WaveContractError, match="non-empty detail"):
        make_attempt_record(
            manifest=wave,
            attempt_id="attempt-0",
            attempt_index=0,
            outcome=METRIC_UNKNOWN,
            artifacts=artifacts(),
        )


def test_certified_unsat_requires_proof_checker_and_log() -> None:
    wave = manifest()
    with pytest.raises(WaveContractError, match="proof_checker_sha256"):
        make_attempt_record(
            manifest=wave,
            attempt_id="attempt-0",
            attempt_index=0,
            outcome=CERTIFIED_UNSAT,
            artifacts=artifacts(proof_sha256=digest("8")),
        )


def test_certified_unsat_requires_checked_replay_receipt() -> None:
    wave = manifest()
    with pytest.raises(WaveContractError, match="proof_replay_sha256"):
        make_attempt_record(
            manifest=wave,
            attempt_id="attempt-0",
            attempt_index=0,
            outcome=CERTIFIED_UNSAT,
            artifacts=artifacts(
                solver_log_sha256=digest("7"),
                proof_sha256=digest("8"),
                proof_checker_sha256=digest("9"),
            ),
        )


def test_attempt_rejects_cnf_from_a_different_wave() -> None:
    wave = manifest()
    with pytest.raises(WaveContractError, match="does not match the wave manifest"):
        make_attempt_record(
            manifest=wave,
            attempt_id="attempt-0",
            attempt_index=0,
            outcome=DISCOVERY_UNSAT,
            artifacts=artifacts(cnf_sha256=digest("a"), solver_log_sha256=digest("7")),
        )


def test_journal_authenticates_dense_immutable_attempt_chain() -> None:
    wave = manifest()
    first = make_attempt_record(
        manifest=wave,
        attempt_id="attempt-0",
        attempt_index=0,
        outcome=STRUCTURAL_SAT,
        artifacts=artifacts(model_sha256=digest("a")),
    )
    second = certified_attempt(wave, index=1, previous=first["record_sha256"])

    head = validate_attempt_journal(
        [first, second],
        manifest=wave,
        expected_record_count=2,
        expected_terminal_sha256=second["record_sha256"],
    )
    assert head == second["record_sha256"]


@pytest.mark.parametrize("mutation", ["tamper", "reorder", "duplicate"])
def test_journal_rejects_mutation_reordering_and_duplicate_ids(mutation: str) -> None:
    wave = manifest()
    first = make_attempt_record(
        manifest=wave,
        attempt_id="attempt-0",
        attempt_index=0,
        outcome=STRUCTURAL_SAT,
        artifacts=artifacts(model_sha256=digest("a")),
    )
    second = certified_attempt(wave, index=1, previous=first["record_sha256"])
    records = [deepcopy(first), deepcopy(second)]
    if mutation == "tamper":
        records[0]["detail"] = "changed after hashing"
    elif mutation == "reorder":
        records.reverse()
    else:
        records[1]["attempt_id"] = records[0]["attempt_id"]

    with pytest.raises(WaveContractError):
        validate_attempt_journal(records, manifest=wave)


def test_sealed_journal_rejects_suffix_truncation() -> None:
    wave = manifest()
    first = make_attempt_record(
        manifest=wave,
        attempt_id="attempt-0",
        attempt_index=0,
        outcome=STRUCTURAL_SAT,
        artifacts=artifacts(model_sha256=digest("a")),
    )
    second = certified_attempt(wave, index=1, previous=first["record_sha256"])
    with pytest.raises(WaveContractError, match="record count"):
        validate_attempt_journal(
            [first],
            manifest=wave,
            expected_record_count=2,
            expected_terminal_sha256=second["record_sha256"],
        )


def test_discovery_unsat_is_not_a_publication_candidate() -> None:
    wave = manifest()
    record = make_attempt_record(
        manifest=wave,
        attempt_id="attempt-0",
        attempt_index=0,
        outcome=DISCOVERY_UNSAT,
        artifacts=artifacts(solver_log_sha256=digest("7")),
    )
    assessment = publication_assessment(
        manifest=wave,
        records=[record],
        expected_record_count=1,
        expected_terminal_sha256=record["record_sha256"],
    )
    assert assessment["publication_candidate"] is False
    assert "terminal_outcome_not_certified_unsat" in assessment["blockers"]


def test_local_certificate_is_never_a_publication_candidate() -> None:
    wave = manifest(evidence_classification=LOCAL_CERTIFICATE)
    record = certified_attempt(wave)
    assessment = publication_assessment(manifest=wave, records=[record])
    assert assessment["publication_candidate"] is False
    assert (
        "local_certificate_has_no_universal_promotion_contract"
        in assessment["blockers"]
    )


def test_certified_unsat_with_complete_contract_is_only_a_publication_candidate() -> (
    None
):
    wave = manifest()
    record = certified_attempt(wave)
    assessment = publication_assessment(
        manifest=wave,
        records=[record],
        expected_record_count=1,
        expected_terminal_sha256=record["record_sha256"],
    )
    assert assessment == {
        "publication_candidate": True,
        "evidence_classification": UNIFORM_PRODUCER,
        "terminal_attempt_sha256": record["record_sha256"],
        "blockers": [],
    }


def test_unsealed_certified_unsat_is_not_a_publication_candidate() -> None:
    wave = manifest()
    record = certified_attempt(wave)
    assessment = publication_assessment(manifest=wave, records=[record])
    assert assessment["publication_candidate"] is False
    assert "attempt_journal_not_sealed" in assessment["blockers"]
