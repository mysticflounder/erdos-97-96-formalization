from __future__ import annotations

import json
from pathlib import Path
from typing import Any

import pytest

from census.p97_search.phase3_cegar_wave import sha256_bytes
from census.p97_search.phase3_piqd_oracle import PreparedJob
from census.p97_search.phase3_piqd_replay import (
    NORMALIZATION_SCHEMA,
    REPLAY_SCHEMA,
    LeanLratReplayer,
    LratReplayError,
    canonical_kept_dimacs,
)

UNSAT_CNF = b"p cnf 1 2\n1 0\n-1 0\n"
VALID_LRAT = b"3 0 1 2 0\n"


def digest(character: str) -> str:
    return character * 64


def wave_manifest(cnf: bytes) -> dict[str, Any]:
    return {
        "schema": "p97-cegar-wave/v1",
        "wave_id": "piqd-replay-test",
        "iteration": 1,
        "parent_checkpoint_sha256": digest("0"),
        "source": {
            "live_leaf": "Problem97.liveLeaf",
            "ingress_hypotheses_sha256": digest("1"),
            "finite_schema": "fixture/v1",
            "cardinality_scope": "n = 1",
            "source_theorem": "Problem97.source",
        },
        "encoding": {
            "cnf_sha256": sha256_bytes(cnf),
            "variable_map_sha256": digest("2"),
            "producer_manifest_sha256": digest("3"),
            "num_variables": 1,
            "num_clauses": 2,
            "query_polarity": "UNSAT_MEANS_OBSTRUCTION",
        },
        "execution": {
            "backend": "cadical",
            "solver_profile": "unsat",
            "shard_id": 0,
            "shard_count": 1,
            "order_sha256": digest("4"),
            "seed": 97,
        },
        "promotion": {
            "evidence_classification": "UNIFORM_PRODUCER",
            "producer_theorem": "Problem97.producer",
            "lift_theorem": None,
            "consumer_theorem": "Problem97.consumer",
        },
    }


def prepared_job(cnf: bytes) -> PreparedJob:
    return PreparedJob(
        job_id="known-unsat-smoke",
        backend="cadical",
        solver_profile="unsat",
        cnf_blob_hash=sha256_bytes(cnf),
        identity_hash=digest("5"),
        num_vars=1,
        num_clauses=2,
        existing=False,
    )


def replayer(tmp_path: Path) -> LeanLratReplayer:
    repository = Path(__file__).resolve().parents[3]
    return LeanLratReplayer(
        lean_root=repository / "lean",
        work_dir=tmp_path / "replay-work",
        timeout_s=60,
    )


def test_replayer_command_is_not_configurable(tmp_path: Path) -> None:
    with pytest.raises(TypeError, match="unexpected keyword argument 'command'"):
        LeanLratReplayer(
            lean_root=tmp_path,
            work_dir=tmp_path / "work",
            command=("true",),  # type: ignore[call-arg]
        )


def test_canonical_kept_dimacs_matches_piqd_lrat_normalization() -> None:
    original = (
        b"c formatting and normalization fixture\n"
        b"p cnf 3 4\n"
        b"1 1 2 0\n"
        b"2 -2 3 0\n"
        b"-3 -3 0\n"
        b"0\n"
    )
    assert canonical_kept_dimacs(original) == (
        b"p cnf 3 3\n1 2 0\n-3 0\n0\n"
    )


def test_known_unsat_lrat_is_lean_checked_and_receipted(tmp_path: Path) -> None:
    result = replayer(tmp_path).replay(
        job=prepared_job(UNSAT_CNF),
        wave_manifest=wave_manifest(UNSAT_CNF),
        cnf=UNSAT_CNF,
        proof=VALID_LRAT,
        proof_sha256=sha256_bytes(VALID_LRAT),
    )

    assert result.verified is True
    receipt = json.loads(result.receipt)
    assert receipt["schema"] == REPLAY_SCHEMA
    assert receipt["normalization"]["schema"] == NORMALIZATION_SCHEMA
    assert receipt["normalization"]["submitted_cnf_sha256"] == sha256_bytes(
        UNSAT_CNF
    )
    assert receipt["proof_sha256"] == sha256_bytes(VALID_LRAT)
    assert receipt["checker_source_sha256"] == sha256_bytes(result.checker_source)
    assert receipt["job"]["cnf_blob_hash"] == sha256_bytes(UNSAT_CNF)
    assert receipt["execution"]["returncode"] == 0


def test_direct_replay_rejects_job_cnf_mismatch(tmp_path: Path) -> None:
    with pytest.raises(LratReplayError, match="does not match piqd job"):
        replayer(tmp_path).replay(
            job=prepared_job(b"p cnf 1 1\n1 0\n"),
            wave_manifest=wave_manifest(UNSAT_CNF),
            cnf=UNSAT_CNF,
            proof=VALID_LRAT,
            proof_sha256=sha256_bytes(VALID_LRAT),
        )


def test_wrong_cnf_cannot_reuse_a_valid_lrat(tmp_path: Path) -> None:
    sat_cnf = b"p cnf 1 2\n1 0\n1 0\n"
    result = replayer(tmp_path).replay(
        job=prepared_job(sat_cnf),
        wave_manifest=wave_manifest(sat_cnf),
        cnf=sat_cnf,
        proof=VALID_LRAT,
        proof_sha256=sha256_bytes(VALID_LRAT),
    )

    assert result.verified is False
    receipt = json.loads(result.receipt)
    assert receipt["execution"]["returncode"] != 0


def test_tampered_lrat_is_rejected(tmp_path: Path) -> None:
    tampered = b"3 1 0 1 2 0\n"
    result = replayer(tmp_path).replay(
        job=prepared_job(UNSAT_CNF),
        wave_manifest=wave_manifest(UNSAT_CNF),
        cnf=UNSAT_CNF,
        proof=tampered,
        proof_sha256=sha256_bytes(tampered),
    )

    assert result.verified is False
