"""Offline regressions for the authenticated sparse-ID A-core source package."""

from __future__ import annotations

import hashlib
import json
import os
import subprocess
import sys
from pathlib import Path

import pytest

from census.p97_search.phase3_piqd_a_core_adapter import (
    packet_from_source_package,
    run_packet,
)
from census.p97_search.phase3_piqd_a_core_package import (
    CASE,
    CLAUSE_FAMILIES,
    NUM_CLAUSES,
    NUM_VARIABLES,
    SOURCE_CONTRACT,
    ACoreSourcePackageError,
    build_source_package,
)
from census.p97_search.phase3_piqd_oracle import PreparedJob, raw_dimacs_identity

PRIOR_JOB_ID = "c7d55a56-34d6-44c1-b476-041301731878"
DAEMON_BUILD_SHA256 = "0af7a4cd" + "0" * 56


def _raw_identity(package) -> str:
    return raw_dimacs_identity(
        backend="cadical",
        solver_profile="sat",
        cnf_sha256=package.cnf_sha256,
        producer_manifest_sha256=hashlib.sha256(package.producer_manifest).hexdigest(),
        requested_core_limit=1,
    )


def test_source_package_reconstructs_exact_sparse_map_and_inventory() -> None:
    package = build_source_package()
    assert package.case == CASE
    assert package.num_variables == NUM_VARIABLES == 889
    assert package.num_clauses == NUM_CLAUSES == 21_101
    assert package.variable_map["source_contract"] == SOURCE_CONTRACT
    assert (
        package.clause_families
        == CLAUSE_FAMILIES
        == {
            "base": 21_074,
            "DEL2": 5,
            "C10": 1,
            "DEL3": 21,
        }
    )
    variables = package.variable_map["variables"]
    assert set(map(int, variables)) == set(range(1, NUM_VARIABLES + 1))
    assert variables["1"] == "eq(a0,f1)"
    assert variables["140"] == "aux_140"
    assert variables["844"] == "rbs1"
    assert variables["880"] == "aux_880"
    assert len(package.variable_map["named_atoms"]) == 432
    assert len(set(package.variable_map["named_atoms"])) == 432
    assert all(
        variables[str(index)] == f"aux_{index}"
        for index in range(1, NUM_VARIABLES + 1)
        if variables[str(index)].startswith("aux_")
    )


def test_source_package_is_hashseed_stable() -> None:
    code = (
        "from census.p97_search.phase3_piqd_a_core_package import build_source_package; "
        "p=build_source_package(); print(p.cnf_sha256, p.package_identity)"
    )
    outputs = []
    for seed in ("1", "2", "3"):
        environment = dict(os.environ, PYTHONHASHSEED=seed, PYTHONPATH=".")
        result = subprocess.run(
            [sys.executable, "-c", code],
            check=True,
            capture_output=True,
            text=True,
            env=environment,
        )
        outputs.append(result.stdout.strip())
    assert len(set(outputs)) == 1


def test_source_packet_does_not_require_legacy_partial_model() -> None:
    packet = packet_from_source_package(build_source_package())
    assert packet.package.model == {}
    assert packet.package.variable_map[1] == "eq(a0,f1)"
    assert len(packet.package.variable_map) == NUM_VARIABLES
    assert packet.package.cnf.startswith(b"p cnf 889 21101\n")
    assert packet.package.source_hashes
    assert Path(packet.package.package_dir).name == "a_core"


def test_authenticated_retry_changes_only_bound_producer_identity() -> None:
    default = build_source_package()
    retry = {
        "generation": 2,
        "prior_job_id": PRIOR_JOB_ID,
        "daemon_build_sha256": DAEMON_BUILD_SHA256,
    }
    first = build_source_package(retry=retry)
    second = build_source_package(retry=dict(reversed(tuple(retry.items()))))

    assert first.cnf == second.cnf == default.cnf
    assert first.cnf_sha256 == second.cnf_sha256 == default.cnf_sha256
    assert first.variable_map == second.variable_map == default.variable_map
    assert first.source_bytes == second.source_bytes == default.source_bytes
    assert first.producer_manifest == second.producer_manifest
    assert first.package_identity == second.package_identity
    assert first.producer_manifest != default.producer_manifest
    assert first.package_identity != default.package_identity
    assert _raw_identity(first) == _raw_identity(second)
    assert _raw_identity(first) != _raw_identity(default)

    default_manifest = json.loads(default.producer_manifest)
    retry_manifest = json.loads(first.producer_manifest)
    assert default_manifest["schema"] == "p97-piqd-a-core-source-package/v1"
    assert retry_manifest == {
        **default_manifest,
        "schema": "p97-piqd-a-core-source-package/v2",
        "retry": {
            "daemon_build_sha256": DAEMON_BUILD_SHA256,
            "generation": 2,
            "prior_job_id": PRIOR_JOB_ID,
        },
    }


@pytest.mark.parametrize(
    "retry",
    [
        [],
        {"generation": 1, "prior_job_id": PRIOR_JOB_ID},
        {
            "generation": True,
            "prior_job_id": PRIOR_JOB_ID,
            "daemon_build_sha256": DAEMON_BUILD_SHA256,
        },
        {
            "generation": 1.0,
            "prior_job_id": PRIOR_JOB_ID,
            "daemon_build_sha256": DAEMON_BUILD_SHA256,
        },
        {
            "generation": 0,
            "prior_job_id": PRIOR_JOB_ID,
            "daemon_build_sha256": DAEMON_BUILD_SHA256,
        },
        {
            "generation": 1,
            "prior_job_id": PRIOR_JOB_ID.upper(),
            "daemon_build_sha256": DAEMON_BUILD_SHA256,
        },
        {
            "generation": 1,
            "prior_job_id": PRIOR_JOB_ID,
            "daemon_build_sha256": DAEMON_BUILD_SHA256.upper(),
        },
        {
            "generation": 1,
            "prior_job_id": PRIOR_JOB_ID,
            "daemon_build_sha256": DAEMON_BUILD_SHA256,
            "extra": None,
        },
    ],
)
def test_authenticated_retry_rejects_malformed_builtin_values(retry) -> None:
    with pytest.raises(ACoreSourcePackageError):
        build_source_package(retry=retry)


class _CaptureRetryClient:
    def __init__(self) -> None:
        self.prepare_kwargs = None
        self.confirmed_cnf = None

    def prepare_cnf(self, **kwargs):
        self.prepare_kwargs = kwargs
        return PreparedJob(
            "retry-job",
            "cadical",
            "sat",
            hashlib.sha256(kwargs["cnf"]).hexdigest(),
            raw_dimacs_identity(
                backend="cadical",
                solver_profile="sat",
                cnf_sha256=hashlib.sha256(kwargs["cnf"]).hexdigest(),
                producer_manifest_sha256=hashlib.sha256(
                    kwargs["producer_manifest"]
                ).hexdigest(),
                requested_core_limit=1,
            ),
            NUM_VARIABLES,
            NUM_CLAUSES,
            False,
            1,
        )

    def confirm(self, job, *, expected_cnf):
        self.confirmed_cnf = expected_cnf
        return "running"


def test_retry_packet_and_run_pass_exact_source_bytes_to_piqd() -> None:
    package = build_source_package(
        retry={
            "generation": 2,
            "prior_job_id": PRIOR_JOB_ID,
            "daemon_build_sha256": DAEMON_BUILD_SHA256,
        }
    )
    packet = packet_from_source_package(package, timeout_seconds=1)
    client = _CaptureRetryClient()

    result = run_packet(packet, client=client)

    assert result["status"] == "UNKNOWN"
    assert client.prepare_kwargs["cnf"] is package.cnf
    assert client.prepare_kwargs["producer_manifest"] is package.producer_manifest
    assert client.confirmed_cnf is package.cnf
