# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

from __future__ import annotations

import copy
import json
import urllib.parse
from dataclasses import replace
from pathlib import Path
from typing import Any
from unittest import mock

import pytest

from census.card_head.exact12_next_row_static_cegar import (
    DETECTOR_CONTRACT,
    JOB_SCHEMA,
    SOURCE_ORDER_INSTALLATION_SCHEMA,
    TERMINAL_PROMOTION_STATUS,
    StaticDiscoveryRequest,
    run_static_cegar,
)
from census.card_head.exact12_next_row_static_convex import STATIC_CONVEX_SCHEMA
from census.card_head.exact12_next_row_static_piqd import (
    CERTIFICATE_BLOCKER,
    DESCRIPTOR_SCHEMA,
    PIQD_PROJECT,
    Exact12NextRowStaticPiqdError,
    Exact12StaticPiqdDiscoveryFactory,
    build_discovery_descriptor,
    run_exact12_static_piqd,
)
from census.card_head.exact12_next_row_valuation import COMPILER_SCHEMA
from census.card_head.sat_encoding import CadicalResult
from census.card_head.source_faithful_candidate_surface import (
    SOURCE_FAITHFUL_CANDIDATE_SCHEMA,
)
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


class TinyCnf:
    def __init__(self, clauses: tuple[tuple[int, ...], ...]) -> None:
        self.n_variables = 1
        self.clauses = list(clauses)


class TinyInstance:
    def __init__(self, clauses: tuple[tuple[int, ...], ...]) -> None:
        self.cnf = TinyCnf(clauses)

    def clauses_with(self) -> tuple[tuple[int, ...], ...]:
        return tuple(self.cnf.clauses)

    def dimacs(self) -> str:
        clauses = self.clauses_with()
        lines = [f"p cnf 1 {len(clauses)}"]
        lines.extend(" ".join(map(str, clause)) + " 0" for clause in clauses)
        return "\n".join(lines) + "\n"

    def decode_model(self, positive: frozenset[int]) -> dict[int, list[int]]:
        if positive != {1}:
            raise ValueError("tiny model is not the unique decoded cube")
        return {0: [1]}


class FakePiqd:
    def __init__(self, *, result: str, assignment: list[object] | None = None) -> None:
        self.result = result
        self.assignment = assignment
        self.cnf = b""
        self.producer = b""
        self.calls: list[tuple[str, str]] = []

    @property
    def job_id(self) -> str:
        return f"exact12-static-{sha256_bytes(self.cnf)[:20]}"

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
            num_variables, num_clauses = scan_dimacs(self.cnf)
            return self._json(
                {
                    "job_id": self.job_id,
                    "cnf_blob_hash": cnf_sha256,
                    "identity_hash": identity,
                    "num_vars": num_variables,
                    "num_clauses": num_clauses,
                    "preview": "",
                    "existing": False,
                    "requested_core_limit": 1,
                }
            )
        if method == "GET" and path == f"/jobs/{self.job_id}/cnf":
            return HttpResponse(
                200,
                self.cnf,
                {"Content-Type": "application/octet-stream"},
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


def _request(
    tmp_path: Path,
    *,
    clauses: tuple[tuple[int, ...], ...] = ((1,),),
    iteration: int = 0,
    local_iteration: int = 0,
    parent: str | None = None,
) -> tuple[Path, StaticDiscoveryRequest]:
    repo_root = tmp_path / "repo"
    source = repo_root / "source.py"
    source.parent.mkdir(parents=True, exist_ok=True)
    source_bytes = b"# exact synthetic v8 source\n"
    source.write_bytes(source_bytes)
    sources = [
        {
            "path": "source.py",
            "bytes": len(source_bytes),
            "sha256": sha256_bytes(source_bytes),
        }
    ]
    root_instance = TinyInstance(((1,),))
    root_dimacs = root_instance.dimacs().encode("ascii")
    root_cnf_sha256 = sha256_bytes(root_dimacs)
    source_order_installation_body = {
        "schema": SOURCE_ORDER_INSTALLATION_SCHEMA,
        "bank_sha256": "2" * 64,
        "base_n_variables": 1,
        "base_n_clauses": 0,
        "base_cnf_sha256": "3" * 64,
        "suffix_n_clauses": 1,
        "suffix_sha256": "4" * 64,
        "final_n_variables": 1,
        "final_n_clauses": 1,
        "final_cnf_sha256": root_cnf_sha256,
    }
    payload = {
        "schema": JOB_SCHEMA,
        "scope": "synthetic exact cell-1 v8 adapter test",
        "compiler_schema": COMPILER_SCHEMA,
        "static_convex_schema": STATIC_CONVEX_SCHEMA,
        "candidate_schema": SOURCE_FAITHFUL_CANDIDATE_SCHEMA,
        "candidate_profile": [5, 6, 4],
        "lean_ingress_theorem": "NONE",
        "lean_terminal_ingress_ready": True,
        "terminal_promotion_status": "TEST_ONLY",
        "positive_membership_bank": {
            "schema": "positive-bank/test",
            "sha256": "1" * 64,
            "family_id": "test-family",
            "three_triad_cut_id": "test-cut",
            "entries": 1,
        },
        "source_order_bank": {
            "schema": "p97_rigid221_exact12_source_order_positive_bank.v3",
            "sha256": "2" * 64,
            "entries": 1,
            "installation": {
                **source_order_installation_body,
                "installation_sha256": sha256_json(source_order_installation_body),
            },
        },
        "compiler_manifest": {"schema": COMPILER_SCHEMA, "identity": "compiler"},
        "static_convex_manifest": {
            "schema": STATIC_CONVEX_SCHEMA,
            "identity": "static",
        },
        "cnf": {
            "bytes": len(root_dimacs),
            "sha256": root_cnf_sha256,
            "variables": 1,
            "clauses": 1,
        },
        "sources": sources,
    }
    job = {**payload, "job_id": sha256_json(payload)}
    instance = TinyInstance(clauses)
    current = instance.dimacs().encode("ascii")
    request = StaticDiscoveryRequest(
        instance=instance,  # type: ignore[arg-type]
        job=job,
        detector_contract_sha256=sha256_json(
            {"contract": DETECTOR_CONTRACT, "sources": sources}
        ),
        cell_index=1,
        iteration=iteration,
        local_iteration=local_iteration,
        parent_record_sha256=parent or job["job_id"],
        current_dimacs=current,
        current_cnf_sha256=sha256_bytes(current),
        num_variables=1,
        num_clauses=len(clauses),
    )
    return repo_root, request


def _discovery(
    tmp_path: Path,
    repo_root: Path,
    request: StaticDiscoveryRequest,
    api: FakePiqd,
):
    factory = Exact12StaticPiqdDiscoveryFactory(
        repo_root=repo_root,
        base_url="http://piqd.invalid",
        journal_root=tmp_path / "piqd",
        transport=api,
        sleep=lambda _seconds: None,
    )
    discovery = factory(request)
    api.cnf = request.current_dimacs
    api.producer = discovery.producer_manifest
    return discovery


def _invoke(tmp_path: Path, discovery: object, request: StaticDiscoveryRequest):
    return discovery(  # type: ignore[operator]
        request.instance,
        tmp_path / "run" / "discovery.cnf",
        timeout_seconds=5,
        nice=10,
        proof_path=None,
    )


def test_descriptor_binds_complete_v8_formula_identity(tmp_path: Path) -> None:
    repo_root, request = _request(tmp_path)
    descriptor = build_discovery_descriptor(request, repo_root=repo_root)

    assert descriptor["schema"] == DESCRIPTOR_SCHEMA
    assert descriptor["root_job_id"] == request.job["job_id"]
    assert descriptor["current_cnf"] == {
        "sha256": request.current_cnf_sha256,
        "bytes": len(request.current_dimacs),
        "num_variables": 1,
        "num_clauses": 1,
    }
    assert descriptor["iteration"] == 0
    assert descriptor["parent_record_sha256"] == request.job["job_id"]
    assert descriptor["detector"]["sha256"] == request.detector_contract_sha256
    assert descriptor["compiler"]["manifest"] == request.job["compiler_manifest"]
    assert (
        descriptor["static_convex"]["manifest"] == request.job["static_convex_manifest"]
    )
    assert (
        descriptor["positive_membership_bank"]
        == request.job["positive_membership_bank"]
    )
    assert descriptor["source_order_bank"] == request.job["source_order_bank"]
    assert descriptor["sources"] == request.job["sources"]
    assert descriptor["certificate_blocker"] == CERTIFICATE_BLOCKER
    assert not any(descriptor["claims"].values())


def test_producer_manifest_uses_fresh_r15_project_namespace(tmp_path: Path) -> None:
    repo_root, request = _request(tmp_path)
    api = FakePiqd(result="UNKNOWN")
    discovery = _discovery(tmp_path, repo_root, request, api)
    producer = json.loads(discovery.producer_manifest)

    assert PIQD_PROJECT == "p97-exact12-next-row-static-cell1-v8-r15"
    assert producer["producer_id"].startswith(f"{PIQD_PROJECT}:")


@pytest.mark.parametrize(
    ("mutation", "match"),
    [
        ("current_hash", "stale"),
        ("dimensions", "dimensions"),
        ("root_job", "canonical"),
        ("parent", "journal parent"),
        ("detector", "detector contract"),
    ],
)
def test_descriptor_rejects_crossed_bindings(
    tmp_path: Path, mutation: str, match: str
) -> None:
    repo_root, request = _request(tmp_path)
    if mutation == "current_hash":
        crossed = replace(request, current_cnf_sha256="3" * 64)
    elif mutation == "dimensions":
        crossed = replace(request, num_clauses=2)
    elif mutation == "root_job":
        job = copy.deepcopy(request.job)
        job["positive_membership_bank"]["sha256"] = "4" * 64
        crossed = replace(request, job=job)
    elif mutation == "parent":
        crossed = replace(request, parent_record_sha256="5" * 64)
    else:
        crossed = replace(request, detector_contract_sha256="6" * 64)
    with pytest.raises(Exact12NextRowStaticPiqdError, match=match):
        build_discovery_descriptor(crossed, repo_root=repo_root)


def test_descriptor_rejects_crossed_source_order_installation(tmp_path: Path) -> None:
    repo_root, request = _request(tmp_path)
    job = copy.deepcopy(request.job)
    job["source_order_bank"]["installation"]["final_n_clauses"] = 2
    payload = {key: value for key, value in job.items() if key != "job_id"}
    job["job_id"] = sha256_json(payload)

    crossed = replace(
        request,
        job=job,
        parent_record_sha256=job["job_id"],
    )
    with pytest.raises(Exact12NextRowStaticPiqdError, match="root CNF"):
        build_discovery_descriptor(crossed, repo_root=repo_root)


def test_sat_is_replayed_and_decoded_locally(tmp_path: Path) -> None:
    repo_root, request = _request(tmp_path)
    api = FakePiqd(result="SAT", assignment=[1])
    discovery = _discovery(tmp_path, repo_root, request, api)

    result = _invoke(tmp_path, discovery, request)

    assert result.verdict == "SAT"
    assert result.positive_variables == frozenset({1})
    assert result.cube == {0: [1]}
    assert ("GET", f"/jobs/{api.job_id}/model") in api.calls


def test_unknown_has_no_local_fallback(tmp_path: Path) -> None:
    repo_root, request = _request(tmp_path)
    api = FakePiqd(result="UNKNOWN")
    discovery = _discovery(tmp_path, repo_root, request, api)
    shared_runner = discovery.runner
    proof_arguments: list[object] = []

    def capture_literal_proof_argument(*args: object):
        proof_arguments.append(args[2])
        return shared_runner(*args)

    discovery.runner = capture_literal_proof_argument

    result = _invoke(tmp_path, discovery, request)

    assert result.verdict == "UNKNOWN"
    assert result.proof_verified is False
    assert proof_arguments == [None]
    assert sum(path == "/jobs/prepare-cnf" for _, path in api.calls) == 1
    assert all(not path.endswith("/proof") for _, path in api.calls)


@pytest.mark.parametrize(
    ("workers", "parallel_mode", "message"),
    ((2, "sequential", "exactly one worker"), (1, "parallel", "sequential")),
)
def test_production_route_rejects_nonsequential_resource_requests_before_factory(
    tmp_path: Path, workers: int, parallel_mode: str, message: str
) -> None:
    with (
        mock.patch(
            "census.card_head.exact12_next_row_static_piqd."
            "Exact12StaticPiqdDiscoveryFactory",
            side_effect=AssertionError("resource gate constructed PIQD"),
        ),
        pytest.raises(Exact12NextRowStaticPiqdError, match=message),
    ):
        run_exact12_static_piqd(
            tmp_path,
            tmp_path / "run",
            piqd_base_url="http://piqd.invalid",
            piqd_journal_root=tmp_path / "piqd",
            workers=workers,
            parallel_mode=parallel_mode,
        )


@pytest.mark.parametrize(
    ("field", "value", "message"),
    (
        ("repo_root", "repo", "roots must be Paths"),
        ("workdir", "run", "roots must be Paths"),
        ("piqd_base_url", 7272, "nonempty URL"),
        ("piqd_journal_root", "piqd", "journal root must be a Path"),
        ("workers", True, "exactly one worker"),
        ("parallel_mode", 1, "sequential"),
    ),
)
def test_production_route_rejects_crossed_input_types_before_factory(
    tmp_path: Path, field: str, value: object, message: str
) -> None:
    kwargs: dict[str, object] = {
        "repo_root": tmp_path,
        "workdir": tmp_path / "run",
        "piqd_base_url": "http://piqd.invalid",
        "piqd_journal_root": tmp_path / "piqd",
        "workers": 1,
        "parallel_mode": "sequential",
    }
    kwargs[field] = value
    with (
        mock.patch(
            "census.card_head.exact12_next_row_static_piqd."
            "Exact12StaticPiqdDiscoveryFactory",
            side_effect=AssertionError("type gate constructed PIQD"),
        ),
        pytest.raises(Exact12NextRowStaticPiqdError, match=message),
    ):
        run_exact12_static_piqd(**kwargs)  # type: ignore[arg-type]


def test_crossed_shared_receipt_is_rejected(tmp_path: Path) -> None:
    repo_root, request = _request(tmp_path)
    api = FakePiqd(result="UNKNOWN")
    discovery = _discovery(tmp_path, repo_root, request, api)
    runner = discovery.runner

    def crossed_runner(*args: object):
        result = runner(*args)
        receipt = json.loads(result.stdout)
        receipt["cnf_sha256"] = "9" * 64
        unsigned = dict(receipt)
        del unsigned["receipt_sha256"]
        receipt["receipt_sha256"] = sha256_json(unsigned)
        return replace(
            result,
            stdout=canonical_json_bytes(receipt).decode("utf-8") + "\n",
        )

    discovery.runner = crossed_runner
    with pytest.raises(Exact12NextRowStaticPiqdError, match="cross-bound"):
        _invoke(tmp_path, discovery, request)


def test_discovery_rejects_proof_paths_before_transport(tmp_path: Path) -> None:
    repo_root, request = _request(tmp_path)
    api = FakePiqd(result="UNSAT")
    discovery = _discovery(tmp_path, repo_root, request, api)

    with pytest.raises(Exact12NextRowStaticPiqdError, match="proof_path=None"):
        discovery(
            request.instance,
            tmp_path / "discovery.cnf",
            timeout_seconds=5,
            nice=10,
            proof_path=tmp_path / "forbidden.drat",
        )
    assert api.calls == []


def test_factory_rejects_symlinked_journal_root_before_transport(
    tmp_path: Path,
) -> None:
    repo_root, request = _request(tmp_path)
    api = FakePiqd(result="UNKNOWN")
    real_root = tmp_path / "real-piqd"
    real_root.mkdir()
    linked_root = tmp_path / "piqd"
    linked_root.symlink_to(real_root, target_is_directory=True)
    factory = Exact12StaticPiqdDiscoveryFactory(
        repo_root=repo_root,
        base_url="http://piqd.invalid",
        journal_root=linked_root,
        transport=api,
        sleep=lambda _seconds: None,
    )

    with pytest.raises(Exact12NextRowStaticPiqdError, match="unsafe"):
        factory(request)
    assert api.calls == []


def test_discovery_rejects_symlinked_cnf_workdir_before_transport(
    tmp_path: Path,
) -> None:
    repo_root, request = _request(tmp_path)
    api = FakePiqd(result="UNKNOWN")
    discovery = _discovery(tmp_path, repo_root, request, api)
    real_run = tmp_path / "real-run"
    real_run.mkdir()
    linked_run = tmp_path / "run"
    linked_run.symlink_to(real_run, target_is_directory=True)

    with pytest.raises(Exact12NextRowStaticPiqdError, match="output root"):
        discovery(
            request.instance,
            linked_run / "discovery.cnf",
            timeout_seconds=5,
            nice=10,
            proof_path=None,
        )
    assert api.calls == []


def test_descriptor_parent_replacement_is_rejected_before_transport(
    tmp_path: Path,
) -> None:
    repo_root, request = _request(tmp_path)
    api = FakePiqd(result="UNKNOWN")
    discovery = _discovery(tmp_path, repo_root, request, api)
    descriptor_directory = discovery.descriptor_path.parent
    moved_directory = tmp_path / "moved-descriptors"
    descriptor_directory.rename(moved_directory)
    outside_directory = tmp_path / "outside-descriptors"
    outside_directory.mkdir()
    descriptor_directory.symlink_to(outside_directory, target_is_directory=True)

    with pytest.raises(Exact12NextRowStaticPiqdError, match="custody"):
        _invoke(tmp_path, discovery, request)
    assert api.calls == []


def test_discovery_rejects_stale_formula_and_bad_result_type(tmp_path: Path) -> None:
    repo_root, request = _request(tmp_path)
    api = FakePiqd(result="UNKNOWN")
    discovery = _discovery(tmp_path, repo_root, request, api)
    request.instance.cnf.clauses.append((1,))
    with pytest.raises(Exact12NextRowStaticPiqdError, match="changed"):
        _invoke(tmp_path, discovery, request)
    assert api.calls == []

    repo_root, request = _request(tmp_path / "bad-result")
    discovery = _discovery(tmp_path / "bad-result", repo_root, request, api)
    discovery.runner = lambda *_args: object()
    with pytest.raises(Exact12NextRowStaticPiqdError, match="StaticSolverResult"):
        _invoke(tmp_path / "bad-result", discovery, request)


def test_source_and_descriptor_tamper_fail_closed(tmp_path: Path) -> None:
    repo_root, request = _request(tmp_path)
    api = FakePiqd(result="UNKNOWN")
    discovery = _discovery(tmp_path, repo_root, request, api)
    (repo_root / "source.py").write_text("# crossed\n", encoding="utf-8")
    with pytest.raises(Exact12NextRowStaticPiqdError, match="source identity"):
        _invoke(tmp_path, discovery, request)
    assert api.calls == []

    repo_root, request = _request(tmp_path / "descriptor")
    discovery = _discovery(tmp_path / "descriptor", repo_root, request, api)
    discovery.descriptor_path.write_bytes(b"{}\n")
    with pytest.raises(Exact12NextRowStaticPiqdError, match="descriptor custody"):
        _invoke(tmp_path / "descriptor", discovery, request)


def test_post_cut_formula_gets_a_fresh_descriptor_and_request(tmp_path: Path) -> None:
    repo_root, first = _request(tmp_path)
    api = FakePiqd(result="UNKNOWN")
    factory = Exact12StaticPiqdDiscoveryFactory(
        repo_root=repo_root,
        base_url="http://piqd.invalid",
        journal_root=tmp_path / "piqd",
        transport=api,
        sleep=lambda _seconds: None,
    )
    first_discovery = factory(first)
    api.cnf = first.current_dimacs
    api.producer = first_discovery.producer_manifest
    assert _invoke(tmp_path / "first", first_discovery, first).verdict == "UNKNOWN"

    _, second = _request(
        tmp_path,
        clauses=((1,), (1,)),
        iteration=1,
        local_iteration=1,
        parent="7" * 64,
    )
    second_discovery = factory(second)
    api.cnf = second.current_dimacs
    api.producer = second_discovery.producer_manifest
    assert _invoke(tmp_path / "second", second_discovery, second).verdict == "UNKNOWN"

    assert first_discovery.descriptor_path != second_discovery.descriptor_path
    assert sum(path == "/jobs/prepare-cnf" for _, path in api.calls) == 2
    first_payload = json.loads(first_discovery.descriptor_bytes)
    second_payload = json.loads(second_discovery.descriptor_bytes)
    assert first_payload["iteration"] == 0
    assert second_payload["iteration"] == 1
    assert first_payload["current_cnf"] != second_payload["current_cnf"]


def test_observational_unsat_gets_one_identical_local_terminal_rerun(
    tmp_path: Path,
) -> None:
    repo_root = Path(__file__).resolve().parents[3]
    api = FakePiqd(result="UNSAT")
    real_factory = Exact12StaticPiqdDiscoveryFactory(
        repo_root=repo_root,
        base_url="http://piqd.invalid",
        journal_root=tmp_path / "piqd",
        transport=api,
        sleep=lambda _seconds: None,
    )
    discovery_requests: list[StaticDiscoveryRequest] = []

    def discovery_factory(request: StaticDiscoveryRequest):
        discovery_requests.append(request)
        discovery = real_factory(request)
        api.cnf = request.current_dimacs
        api.producer = discovery.producer_manifest
        return discovery

    terminal_calls: list[tuple[bytes, Path]] = []

    def fake_local_terminal(
        instance: object,
        cnf_path: Path,
        *,
        proof_path: Path | None,
        **_kwargs: object,
    ) -> CadicalResult:
        assert proof_path is not None
        payload = instance.dimacs().encode("ascii")  # type: ignore[attr-defined]
        cnf_path.write_bytes(payload)
        proof_path.write_bytes(b"c fake terminal DRAT\n")
        terminal_calls.append((payload, proof_path))
        return CadicalResult("UNSAT", None, 20, False, "fake terminal")

    fake_source_order_bank = {
        "schema": "p97_rigid221_exact12_source_order_positive_bank.v3",
        "bank_sha256": "f" * 64,
        "entries": [{}],
    }
    fake_prepared_source_order_bank = mock.Mock()
    fake_prepared_source_order_bank.snapshot.return_value = fake_source_order_bank
    fake_prepared_source_order_bank.entries = (mock.Mock(learned_clause=(1,)),)

    def fake_attest_source_order_bank(instance, _prepared):
        body = {
            "schema": SOURCE_ORDER_INSTALLATION_SCHEMA,
            "bank_sha256": fake_source_order_bank["bank_sha256"],
            "base_n_variables": instance.cnf.n_variables,
            "base_n_clauses": len(instance.cnf.clauses) - 1,
            "base_cnf_sha256": "b" * 64,
            "suffix_n_clauses": 1,
            "suffix_sha256": "c" * 64,
            "final_n_variables": instance.cnf.n_variables,
            "final_n_clauses": len(instance.cnf.clauses),
            "final_cnf_sha256": sha256_bytes(instance.dimacs().encode("ascii")),
        }
        return {**body, "installation_sha256": sha256_json(body)}

    def fake_install_source_order_bank(instance, prepared):
        instance.cnf.add_clause((1,))
        return fake_attest_source_order_bank(instance, prepared)

    def fake_clone_source_order_bank(instance, prepared):
        return copy.deepcopy(instance), prepared

    with (
        mock.patch(
            "census.card_head.exact12_next_row_static_cegar.build_source_order_bank",
            return_value=fake_source_order_bank,
        ),
        mock.patch(
            "census.card_head.exact12_next_row_static_cegar."
            "prepare_proof_backed_source_order_bank",
            return_value=fake_prepared_source_order_bank,
        ),
        mock.patch(
            "census.card_head.exact12_next_row_static_cegar."
            "attest_source_order_bank_live_sources"
        ),
        mock.patch(
            "census.card_head.exact12_next_row_static_cegar."
            "install_prepared_source_order_bank",
            side_effect=fake_install_source_order_bank,
        ),
        mock.patch(
            "census.card_head.exact12_next_row_static_cegar."
            "attest_prepared_source_order_bank_installed",
            side_effect=fake_attest_source_order_bank,
        ),
        mock.patch(
            "census.card_head.exact12_next_row_static_cegar."
            "clone_installed_source_order_bank",
            side_effect=fake_clone_source_order_bank,
        ),
    ):
        summary = run_static_cegar(
            repo_root,
            tmp_path / "run",
            1,
            max_iterations=1,
            timeout_seconds=5,
            solver=fake_local_terminal,
            discovery_solver_factory=discovery_factory,
            terminal_proof_certifier=lambda *_args: True,
        )

    assert summary["status"] == TERMINAL_PROMOTION_STATUS
    assert len(discovery_requests) == 1
    assert len(terminal_calls) == 1
    assert terminal_calls[0][0] == discovery_requests[0].current_dimacs
    assert summary["discovery_cnf_sha256"] == summary["terminal_cnf_sha256"]
    assert all(not path.endswith("/proof") for _, path in api.calls)
