# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

from __future__ import annotations

import json
import urllib.parse
from dataclasses import fields, replace
from pathlib import Path
from typing import Any
from unittest import mock

import pytest

from census.card_head import exact12_next_row_arm_static_canary as canary
from census.card_head import exact12_next_row_arm_static_piqd as adapter
from census.card_head.exact12_next_row_arm_static_canary import (
    ARM_SUFFIX_SCHEMA,
    JOB_SCHEMA,
    LEAN_INGRESS_THEOREM,
    TERMINAL_STATUS,
    MaterializedArmStaticCanary,
    run_arm_static_canary,
)
from census.card_head.exact12_next_row_arm_static_piqd import (
    CERTIFICATE_BLOCKER,
    DESCRIPTOR_SCHEMA,
    PIQD_PROJECT,
    Exact12ArmStaticPiqdDiscoveryFactory,
    Exact12NextRowArmStaticPiqdError,
    build_discovery_descriptor,
)
from census.card_head.exact12_next_row_cell_run import _json_sha256
from census.card_head.sat_encoding import CadicalResult
from census.p97_search.phase3_cegar_wave import (
    canonical_json_bytes,
    sha256_bytes,
    sha256_json,
)
from census.p97_search.phase3_piqd_oracle import (
    HttpResponse,
    MultipartBody,
    raw_dimacs_identity,
    scan_dimacs,
)
from census.p97_search.phase3_piqd_static_solver_runner import StaticSolverResult


class TinyCnf:
    n_variables = 1

    def __init__(self) -> None:
        self.clauses = [(1,)]


class TinyInstance:
    def __init__(self) -> None:
        self.cnf = TinyCnf()

    def clauses_with(self) -> tuple[tuple[int, ...], ...]:
        return tuple(self.cnf.clauses)

    def dimacs(self) -> str:
        return "p cnf 1 1\n1 0\n"

    def decode_model(self, positive: frozenset[int]) -> dict[int, list[int]]:
        if positive != {1}:
            raise ValueError("the tiny model is not the unique cube")
        return {0: [1]}


class FakeArmCompiled:
    def manifest(self) -> dict[str, Any]:
        return {"schema": "synthetic-arm-compiler/v1", "map": {"x": 1}}


class FakePiqd:
    def __init__(self, *, result: str, assignment: list[object] | None = None) -> None:
        self.result = result
        self.assignment = assignment
        self.cnf = b""
        self.producer = b""
        self.calls: list[tuple[str, str]] = []

    @property
    def job_id(self) -> str:
        return f"arm-static-{sha256_bytes(self.cnf)[:20]}"

    @staticmethod
    def _json(value: dict[str, Any]) -> HttpResponse:
        return HttpResponse(
            200,
            canonical_json_bytes(value),
            {"Content-Type": "application/json"},
        )

    def __call__(
        self,
        method: str,
        url: str,
        body: bytes | MultipartBody | None,
        _headers: object,
    ) -> HttpResponse:
        parsed = urllib.parse.urlsplit(url)
        path = parsed.path + (f"?{parsed.query}" if parsed.query else "")
        self.calls.append((method, path))
        cnf_sha256 = sha256_bytes(self.cnf)
        producer_sha256 = sha256_bytes(self.producer)
        identity = raw_dimacs_identity(
            backend="cadical",
            solver_profile="sat",
            cnf_sha256=cnf_sha256,
            producer_manifest_sha256=producer_sha256,
            requested_core_limit=1,
        )
        if method == "POST" and path == "/jobs/prepare-cnf":
            assert isinstance(body, bytes)
            assert self.cnf in body
            assert self.producer in body
            variables, clauses = scan_dimacs(self.cnf)
            return self._json(
                {
                    "job_id": self.job_id,
                    "cnf_blob_hash": cnf_sha256,
                    "identity_hash": identity,
                    "num_vars": variables,
                    "num_clauses": clauses,
                    "preview": "",
                    "existing": False,
                    "requested_core_limit": 1,
                }
            )
        if method == "GET" and path == f"/jobs/{self.job_id}/cnf":
            return HttpResponse(
                200, self.cnf, {"Content-Type": "application/octet-stream"}
            )
        if method == "POST" and path == f"/jobs/confirm?job_id={self.job_id}":
            return self._json({"job_id": self.job_id, "status": "confirmed"})
        if method == "GET" and path == f"/jobs/{self.job_id}":
            return self._json(
                {
                    "id": self.job_id,
                    "status": "completed",
                    "result": self.result,
                    "requested_core_limit": 1,
                    "progress": {"solver_started": True},
                    "attested_solver_processes": 1,
                    "attestation_basis": "SINGLE_PROCESS_NO_PARALLEL_FLAG",
                }
            )
        if method == "GET" and path == f"/jobs/{self.job_id}/model":
            assignment = self.assignment if self.assignment is not None else []
            return self._json(
                {
                    "job_id": self.job_id,
                    "result": "SAT",
                    "num_assigned": len(assignment),
                    "assignment": assignment,
                }
            )
        if method == "GET" and path.startswith(f"/jobs/{self.job_id}/log?"):
            payload = f"s {self.result}\n".encode()
            return HttpResponse(
                200,
                payload,
                {
                    "Content-Type": "text/plain; charset=utf-8",
                    "X-Log-Size-Bytes": str(len(payload)),
                },
            )
        if method == "GET" and path == f"/jobs/{self.job_id}/proof":
            raise AssertionError("observational PIQD UNSAT must not fetch a proof")
        raise AssertionError((method, path))


def _fixture(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> tuple[Path, MaterializedArmStaticCanary, dict[str, Any], bytes]:
    instance = TinyInstance()
    cnf_bytes = instance.dimacs().encode("ascii")
    cnf_sha256 = sha256_bytes(cnf_bytes)
    for module in (canary, adapter):
        monkeypatch.setattr(module, "EXPECTED_PREFIX_VARIABLES", 1)
        monkeypatch.setattr(module, "EXPECTED_FINAL_CLAUSES", 1)
        monkeypatch.setattr(module, "EXPECTED_FINAL_DIMACS_SHA256", cnf_sha256)
        monkeypatch.setattr(module, "EXPECTED_ARM_SUFFIX_CLAUSES", 1)
        monkeypatch.setattr(module, "EXPECTED_POST_ARM_DIMACS_SHA256", "a" * 64)
        monkeypatch.setattr(module, "EXPECTED_SOURCE_ORDER_CLAUSES", 1)
        monkeypatch.setattr(module, "EXPECTED_POST_SOURCE_ORDER_CLAUSES", 1)
        monkeypatch.setattr(
            module, "EXPECTED_POST_SOURCE_ORDER_DIMACS_SHA256", cnf_sha256
        )
        monkeypatch.setattr(module, "EXPECTED_CLASS_CUT_CLAUSES", 1)
        monkeypatch.setattr(module, "EXPECTED_CLASS_CUT_BANK_SHA256", "c" * 64)
        monkeypatch.setattr(
            module, "EXPECTED_CLASS_CUT_INSTALLED_CNF_JSON_SHA256", "d" * 64
        )

    suffix_body = {"schema": ARM_SUFFIX_SCHEMA, "synthetic": True}
    suffix = {
        **suffix_body,
        "suffix_record_sha256": _json_sha256(suffix_body),
    }
    source_order_bank = {
        "schema": "synthetic-source-order-bank/v1",
        "bank_sha256": "b" * 64,
    }
    installation = {
        "schema": "synthetic-installation/v1",
        "bank_sha256": source_order_bank["bank_sha256"],
        "suffix_n_clauses": 1,
        "final_n_variables": 1,
        "final_n_clauses": 1,
        "final_cnf_sha256": cnf_sha256,
    }
    class_cut_bank = {
        "schema": "synthetic-class-cut-bank/v1",
        "bank_sha256": "c" * 64,
    }
    class_cut_installation = {
        "schema": "synthetic-class-cut-installation/v1",
        "bank_sha256": class_cut_bank["bank_sha256"],
        "suffix_n_clauses": 1,
        "base_n_clauses": 1,
        "final_n_variables": 1,
        "final_n_clauses": 1,
        "final_cnf_sha256": "d" * 64,
    }
    values = {field.name: {} for field in fields(MaterializedArmStaticCanary)}
    values.update(
        {
            "instance": instance,
            "arm_compiled": FakeArmCompiled(),
            "arm_suffix": suffix,
            "source_order_bank": source_order_bank,
            "source_order_installation": installation,
            "physical_class_cut_bank": class_cut_bank,
            "physical_class_cut_installation": class_cut_installation,
        }
    )
    materialized = MaterializedArmStaticCanary(**values)  # type: ignore[arg-type]
    repo_root = tmp_path / "repo"
    repo_root.mkdir(parents=True)
    source_bytes = b"# synthetic arm-static source\n"
    (repo_root / "source.py").write_bytes(source_bytes)
    payload = {
        "schema": JOB_SCHEMA,
        "scope": "one synthetic finite exact-12 arm-static test",
        "arm_cell_index": 6,
        "lean_ingress_theorem": LEAN_INGRESS_THEOREM,
        "lean_terminal_ingress_ready": True,
        "terminal_promotion_status": TERMINAL_STATUS,
        "compiler_manifest": materialized.arm_compiled.manifest(),
        "arm_suffix": {
            "schema": ARM_SUFFIX_SCHEMA,
            "sha256": suffix["suffix_record_sha256"],
            "n_clauses": 1,
            "post_arm_dimacs_sha256": "a" * 64,
        },
        "source_order_bank": {
            "schema": source_order_bank["schema"],
            "sha256": source_order_bank["bank_sha256"],
            "n_clauses": 1,
            "installation": installation,
        },
        "physical_class_cut_bank": {
            "schema": class_cut_bank["schema"],
            "sha256": class_cut_bank["bank_sha256"],
            "n_clauses": 1,
            "installation": class_cut_installation,
        },
        "cnf": {
            "bytes": len(cnf_bytes),
            "sha256": cnf_sha256,
            "variables": 1,
            "clauses": 1,
        },
        "promotion": {
            "lean_ingress_theorem": LEAN_INGRESS_THEOREM,
            "lean_terminal_ingress_ready": True,
            "status_on_verified_unsat": TERMINAL_STATUS,
        },
        "sources": [
            {
                "path": "source.py",
                "bytes": len(source_bytes),
                "sha256": sha256_bytes(source_bytes),
            }
        ],
    }
    return (
        repo_root,
        materialized,
        {**payload, "job_id": _json_sha256(payload)},
        cnf_bytes,
    )


def _discovery(
    tmp_path: Path,
    repo_root: Path,
    materialized: MaterializedArmStaticCanary,
    job: dict[str, Any],
    api: FakePiqd,
):
    factory = Exact12ArmStaticPiqdDiscoveryFactory(
        repo_root=repo_root,
        base_url="http://piqd.invalid",
        journal_root=tmp_path / "piqd",
        transport=api,
        sleep=lambda _seconds: None,
    )
    discovery = factory(materialized, job)
    api.cnf = materialized.instance.dimacs().encode("ascii")
    api.producer = discovery.producer_manifest
    return discovery


def _invoke(tmp_path: Path, discovery: object, materialized: object):
    cnf_path = tmp_path / "run" / "discovery.cnf"
    cnf_path.parent.mkdir(parents=True, exist_ok=True)
    cnf_path.write_bytes(materialized.instance.dimacs().encode("ascii"))
    return discovery(  # type: ignore[operator]
        materialized.instance,
        cnf_path,
        timeout_seconds=5,
        nice=10,
        proof_path=None,
    )


def test_descriptor_binds_arm_cnf_map_sources_and_no_proof_claims(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    repo_root, materialized, job, cnf_bytes = _fixture(tmp_path, monkeypatch)
    descriptor = build_discovery_descriptor(materialized, job, repo_root=repo_root)

    assert descriptor["schema"] == DESCRIPTOR_SCHEMA
    assert descriptor["root_job_id"] == job["job_id"]
    assert descriptor["job_sha256"] == sha256_json(job)
    assert descriptor["cnf"]["sha256"] == sha256_bytes(cnf_bytes)
    assert descriptor["compiler"]["manifest"] == job["compiler_manifest"]
    assert descriptor["arm_suffix"] == job["arm_suffix"]
    assert descriptor["source_order_bank"] == job["source_order_bank"]
    assert descriptor["physical_class_cut_bank"] == job["physical_class_cut_bank"]
    assert descriptor["lean_terminal_ingress"] == job["promotion"]
    assert descriptor["sources"] == job["sources"]
    assert descriptor["certificate_blocker"] == CERTIFICATE_BLOCKER
    assert not any(descriptor["claims"].values())


def test_descriptor_rejects_crossed_lean_terminal_ingress(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    repo_root, materialized, job, _ = _fixture(tmp_path, monkeypatch)
    variants: list[dict[str, Any]] = []

    crossed_theorem = dict(job)
    crossed_theorem["lean_ingress_theorem"] = "Problem97.crossed"
    variants.append(crossed_theorem)

    crossed_ready = dict(job)
    crossed_ready["lean_terminal_ingress_ready"] = False
    variants.append(crossed_ready)

    crossed_status = dict(job)
    crossed_status["terminal_promotion_status"] = "CROSSED"
    variants.append(crossed_status)

    crossed_promotion = dict(job)
    crossed_promotion["promotion"] = {
        **job["promotion"],
        "lean_terminal_ingress_ready": False,
    }
    variants.append(crossed_promotion)

    for crossed in variants:
        crossed.pop("job_id")
        crossed["job_id"] = _json_sha256(crossed)
        with pytest.raises(
            Exact12NextRowArmStaticPiqdError,
            match="Lean terminal ingress binding",
        ):
            build_discovery_descriptor(materialized, crossed, repo_root=repo_root)


def test_fresh_production_namespace_and_sequential_request(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    repo_root, materialized, job, _ = _fixture(tmp_path, monkeypatch)
    api = FakePiqd(result="UNKNOWN")
    discovery = _discovery(tmp_path, repo_root, materialized, job, api)
    producer = json.loads(discovery.producer_manifest)

    assert PIQD_PROJECT == "p97-exact12-next-row-arm-static-cell6-v15-r1"
    assert producer["producer_id"].startswith(f"{PIQD_PROJECT}:")
    assert producer["claims"]["one_process"] is False
    assert producer["claims"]["one_core"] is False


def test_sat_total_model_is_replayed_and_decoded_locally(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    repo_root, materialized, job, _ = _fixture(tmp_path, monkeypatch)
    api = FakePiqd(result="SAT", assignment=[1])
    discovery = _discovery(tmp_path, repo_root, materialized, job, api)

    result = _invoke(tmp_path, discovery, materialized)

    assert result.verdict == "SAT"
    assert result.positive_variables == frozenset({1})
    assert result.cube == {0: [1]}
    assert ("GET", f"/jobs/{api.job_id}/model") in api.calls


def test_partial_sat_result_and_proof_path_fail_closed(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    repo_root, materialized, job, _ = _fixture(tmp_path, monkeypatch)
    api = FakePiqd(result="UNKNOWN")
    discovery = _discovery(tmp_path, repo_root, materialized, job, api)
    discovery.runner = lambda *_args: StaticSolverResult("SAT", {}, 10, "", "")
    with pytest.raises(Exact12NextRowArmStaticPiqdError, match="not total"):
        _invoke(tmp_path, discovery, materialized)

    cnf_path = tmp_path / "proof-path" / "discovery.cnf"
    cnf_path.parent.mkdir()
    cnf_path.write_bytes(materialized.instance.dimacs().encode("ascii"))
    with pytest.raises(Exact12NextRowArmStaticPiqdError, match="proof_path=None"):
        discovery(
            materialized.instance,
            cnf_path,
            timeout_seconds=5,
            nice=10,
            proof_path=tmp_path / "forbidden.drat",
        )


def test_unknown_has_no_local_or_proof_fallback(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    repo_root, materialized, job, _ = _fixture(tmp_path, monkeypatch)
    api = FakePiqd(result="UNKNOWN")
    discovery = _discovery(tmp_path, repo_root, materialized, job, api)

    result = _invoke(tmp_path, discovery, materialized)

    assert result.verdict == "UNKNOWN"
    assert result.proof_verified is False
    assert sum(path == "/jobs/prepare-cnf" for _, path in api.calls) == 1
    assert all(not path.endswith("/proof") for _, path in api.calls)


def test_source_descriptor_and_receipt_crossing_fail_closed(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    repo_root, materialized, job, _ = _fixture(tmp_path, monkeypatch)
    api = FakePiqd(result="UNKNOWN")
    discovery = _discovery(tmp_path, repo_root, materialized, job, api)
    (repo_root / "source.py").write_text("# crossed\n", encoding="utf-8")
    with pytest.raises(Exact12NextRowArmStaticPiqdError, match="source manifest"):
        _invoke(tmp_path, discovery, materialized)
    assert api.calls == []

    repo_root, materialized, job, _ = _fixture(tmp_path / "descriptor", monkeypatch)
    discovery = _discovery(tmp_path / "descriptor", repo_root, materialized, job, api)
    discovery.descriptor_path.write_bytes(b"{}\n")
    with pytest.raises(Exact12NextRowArmStaticPiqdError, match="custody"):
        _invoke(tmp_path / "descriptor", discovery, materialized)

    repo_root, materialized, job, _ = _fixture(tmp_path / "receipt", monkeypatch)
    discovery = _discovery(tmp_path / "receipt", repo_root, materialized, job, api)
    runner = discovery.runner

    def crossed_runner(*args: object):
        result = runner(*args)
        receipt = json.loads(result.stdout)
        receipt["cnf_sha256"] = "9" * 64
        unsigned = dict(receipt)
        del unsigned["receipt_sha256"]
        receipt["receipt_sha256"] = sha256_json(unsigned)
        return replace(
            result, stdout=canonical_json_bytes(receipt).decode("utf-8") + "\n"
        )

    discovery.runner = crossed_runner
    with pytest.raises(Exact12NextRowArmStaticPiqdError, match="cross-bound"):
        _invoke(tmp_path / "receipt", discovery, materialized)


def test_observational_unsat_triggers_one_identical_local_terminal_rerun(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    repo_root, materialized, job, cnf_bytes = _fixture(tmp_path, monkeypatch)
    api = FakePiqd(result="UNSAT")
    terminal_calls: list[bytes] = []

    def fake_local_terminal(
        instance: object,
        cnf_path: Path,
        *,
        proof_path: Path | None,
        **_kwargs: object,
    ) -> CadicalResult:
        assert proof_path is not None
        payload = instance.dimacs().encode("ascii")  # type: ignore[attr-defined]
        assert cnf_path.read_bytes() == payload
        proof_path.write_bytes(b"c fake terminal DRAT\n")
        terminal_calls.append(payload)
        return CadicalResult("UNSAT", None, 20, False, "fake terminal")

    original_factory_call = Exact12ArmStaticPiqdDiscoveryFactory.__call__

    def configure_api(self: object, frozen: object, frozen_job: object):
        discovery = original_factory_call(self, frozen, frozen_job)  # type: ignore[arg-type]
        api.cnf = cnf_bytes
        api.producer = discovery.producer_manifest
        return discovery

    with (
        mock.patch.object(
            canary, "materialize_arm_static_canary", return_value=materialized
        ),
        mock.patch.object(canary, "_build_job", return_value=job),
        mock.patch.object(
            Exact12ArmStaticPiqdDiscoveryFactory,
            "__call__",
            configure_api,
        ),
    ):
        summary = adapter.run_exact12_arm_static_piqd(
            repo_root,
            tmp_path / "run",
            piqd_base_url="http://piqd.invalid",
            piqd_journal_root=tmp_path / "piqd",
            timeout_seconds=5,
            local_solver=fake_local_terminal,
            certifier=lambda *_args: True,
            transport=api,
            sleep=lambda _seconds: None,
        )

    assert summary["status"] == TERMINAL_STATUS
    assert summary["lean_ingress_theorem"] == LEAN_INGRESS_THEOREM
    assert summary["lean_terminal_ingress_ready"] is True
    assert summary["terminal_promotion_status"] == TERMINAL_STATUS
    assert terminal_calls == [cnf_bytes]
    assert (
        summary["artifacts"]["discovery_cnf"]["sha256"]
        == summary["artifacts"]["terminal_cnf"]["sha256"]
    )
    assert all(not path.endswith("/proof") for _, path in api.calls)


def test_discovery_error_does_not_invoke_local_solver(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    repo_root, materialized, job, _ = _fixture(tmp_path, monkeypatch)
    local_calls = 0

    def local_solver(*_args: object, **_kwargs: object) -> CadicalResult:
        nonlocal local_calls
        local_calls += 1
        raise AssertionError("local fallback is forbidden")

    def factory(_materialized: object, _job: object):
        def fail(*_args: object, **_kwargs: object) -> CadicalResult:
            raise Exact12NextRowArmStaticPiqdError("synthetic PIQD failure")

        return fail

    with (
        mock.patch.object(
            canary, "materialize_arm_static_canary", return_value=materialized
        ),
        mock.patch.object(canary, "_build_job", return_value=job),
        pytest.raises(Exact12NextRowArmStaticPiqdError, match="synthetic"),
    ):
        run_arm_static_canary(
            repo_root,
            tmp_path / "run",
            timeout_seconds=5,
            solver=local_solver,
            discovery_solver_factory=factory,
        )
    assert local_calls == 0
