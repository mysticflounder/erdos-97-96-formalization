from __future__ import annotations

import json
import urllib.parse
from dataclasses import replace
from pathlib import Path
from types import MappingProxyType
from typing import Any

import pytest

from census.card_head import exact12_v14_cell_run
from census.card_head.exact12_v14_bound_jobs import materialize_cell
from census.card_head.sat_encoding import EncodingError
from census.card_head.source_faithful_candidate_surface import source_faithful_cube_ok
from census.p97_search import phase3_piqd_card_head_adapter as adapter_module
from census.p97_search.phase3_cegar_wave import (
    LOCAL_CERTIFICATE,
    canonical_json_bytes,
    sha256_bytes,
)
from census.p97_search.phase3_piqd_card_head_adapter import (
    CERTIFICATE_KIND,
    LEAN_TOOLCHAIN,
    AuthenticatedPackageSnapshot,
    BoundedCurrentPiqdHttpTransport,
    CardHeadPiqdAdapter,
    CardHeadPiqdAdapterError,
    CurrentPiqdPacketAssembler,
    CurrentPiqdRun,
    EndpointLimits,
    build_source_faithful_canary_package,
    make_current_piqd_packet_transport,
    run_production_canary,
    validate_production_output,
)
from census.p97_search.phase3_piqd_clause_map import (
    CERTIFICATE_BOUNDARY,
    CLAUSE_MAP_VERSION,
    EXPANSION_RULE,
)
from census.p97_search.phase3_piqd_driver import (
    DriverPolicy,
    DurableAttemptJournal,
    PiqdCegarDriver,
)
from census.p97_search.phase3_piqd_oracle import (
    HttpResponse,
    PiqdOracleError,
    PiqdRawDimacsClient,
    raw_dimacs_identity,
)
from census.p97_search.phase3_piqd_replay import canonical_kept_dimacs

VALID_LRAT = b"368076 0 1 2 0\n"
PRODUCER = canonical_json_bytes(
    {"schema": "fixture-producer/v1", "semantic_status": "FINITE_LOCAL"}
)
CELL0_CUBE = {
    0: [1, 3, 4, 7],
    1: [0, 2, 6, 8],
    2: [0, 1, 10, 11],
    3: [0, 1, 4, 5],
    4: [0, 2, 3, 5],
    5: [0, 3, 4, 6],
    6: [0, 7, 8, 10],
    7: [1, 3, 6, 8],
    8: [1, 5, 6, 9],
    9: [1, 2, 7, 8],
    10: [0, 7, 9, 11],
    11: [1, 2, 9, 10],
}


def digest(character: str) -> str:
    return character * 64


def _positive_variables_for_cube(
    instance: Any, cube: dict[int, list[int]]
) -> frozenset[int]:
    assignment: dict[int, bool] = {}
    pending: list[tuple[int, bool]] = []
    for center, candidate in cube.items():
        index = instance.candidate_index(center, candidate)
        pending.append((instance.choice_variables[(center, index)], True))
    clauses = instance.cnf.clauses
    pending.extend(
        (abs(clause[0]), clause[0] > 0) for clause in clauses if len(clause) == 1
    )
    occurrences: list[list[int]] = [[] for _ in range(instance.cnf.n_variables + 1)]
    for clause_index, clause in enumerate(clauses):
        for literal in clause:
            occurrences[abs(literal)].append(clause_index)
    remaining = [len(clause) for clause in clauses]
    satisfied = [False] * len(clauses)

    def propagate(variable: int, value: bool) -> None:
        prior = assignment.get(variable)
        if prior is not None:
            if prior != value:
                raise AssertionError("fixture propagation conflict")
            return
        assignment[variable] = value
        for clause_index in occurrences[variable]:
            if satisfied[clause_index]:
                continue
            clause = clauses[clause_index]
            if any(
                abs(literal) == variable and (literal > 0) == value
                for literal in clause
            ):
                satisfied[clause_index] = True
                continue
            remaining[clause_index] -= sum(
                abs(literal) == variable for literal in clause
            )
            if remaining[clause_index] == 0:
                raise AssertionError(f"fixture assignment conflicts with {clause}")
            if remaining[clause_index] == 1:
                unit = next(
                    literal for literal in clause if abs(literal) not in assignment
                )
                pending.append((abs(unit), unit > 0))

    while pending:
        propagate(*pending.pop())
    for variable in range(1, instance.cnf.n_variables + 1):
        if variable not in assignment:
            pending.append((variable, False))
            while pending:
                propagate(*pending.pop())
    assert all(
        any(
            (literal > 0 and assignment[literal])
            or (literal < 0 and not assignment[-literal])
            for literal in clause
        )
        for clause in clauses
    )
    return frozenset(variable for variable, value in assignment.items() if value)


def _wave(cnf: bytes, *, num_vars: int, num_clauses: int) -> bytes:
    return canonical_json_bytes(
        {
            "schema": "p97-cegar-wave/v1",
            "wave_id": "card-head-current-api-fixture",
            "iteration": 0,
            "parent_checkpoint_sha256": None,
            "source": {
                "live_leaf": "Problem97.fixture",
                "ingress_hypotheses_sha256": digest("1"),
                "finite_schema": "exact12-v14-fixture/v1",
                "cardinality_scope": "one finite cell",
                "source_theorem": "Problem97.fixtureSource",
            },
            "encoding": {
                "cnf_sha256": sha256_bytes(cnf),
                "variable_map_sha256": digest("2"),
                "producer_manifest_sha256": sha256_bytes(PRODUCER),
                "num_variables": num_vars,
                "num_clauses": num_clauses,
                "query_polarity": "UNSAT_MEANS_OBSTRUCTION",
            },
            "execution": {
                "backend": "cadical",
                "solver_profile": "unsat",
                "shard_id": 0,
                "shard_count": 1,
                "order_sha256": digest("3"),
                "seed": 97,
            },
            "promotion": {
                "evidence_classification": LOCAL_CERTIFICATE,
                "producer_theorem": None,
                "lift_theorem": None,
                "consumer_theorem": None,
            },
        }
    )


@pytest.fixture(scope="module")
def cell_package() -> AuthenticatedPackageSnapshot:
    materialized = materialize_cell(0)
    instance = materialized.instance
    cnf = instance.dimacs().encode("ascii")
    return AuthenticatedPackageSnapshot(
        cnf,
        PRODUCER,
        _wave(
            cnf,
            num_vars=instance.cnf.n_variables,
            num_clauses=len(instance.cnf.clauses),
        ),
    )


@pytest.fixture(scope="module")
def cell_fixture(
    cell_package: AuthenticatedPackageSnapshot,
) -> tuple[Any, list[int], AuthenticatedPackageSnapshot]:
    materialized = materialize_cell(0)
    instance = materialized.instance
    positive = _positive_variables_for_cube(instance, CELL0_CUBE)
    assignment = [
        variable if variable in positive else -variable
        for variable in range(1, instance.cnf.n_variables + 1)
    ]
    return instance, assignment, cell_package


def _map_bytes(cnf: bytes) -> bytes:
    kept = canonical_kept_dimacs(cnf)
    clauses = int(cnf.splitlines()[0].split()[3])
    return canonical_json_bytes(
        {
            "version": CLAUSE_MAP_VERSION,
            "submitted_sha256": sha256_bytes(cnf),
            "submitted_clauses": clauses,
            "kept_sha256": sha256_bytes(kept),
            "kept_clauses": clauses,
            "exceptions": [],
            "expansion_rule": EXPANSION_RULE,
            "boundary": CERTIFICATE_BOUNDARY,
        }
    )


def _lean_bytes(job_id: str, cnf: bytes, proof: bytes) -> bytes:
    kept = canonical_kept_dimacs(cnf)
    return (
        "import Piqd.Check\n\n"
        f"def cnfText : String :=\n  {json.dumps(kept.decode('ascii'))}\n"
        f"def lratText : String :=\n  {json.dumps(proof.decode('ascii'))}\n"
        f"theorem piqd_job_{job_id.replace('-', '_')}_unsat : True := by trivial\n"
    ).encode()


class FakeCurrentApi:
    def __init__(
        self,
        package: AuthenticatedPackageSnapshot,
        *,
        result: str,
        assignment: list[object] | None = None,
        job_id: str = "job-card-head",
        proof: bytes = VALID_LRAT,
        existing: bool = False,
    ) -> None:
        self.package = package
        self.result = result
        self.assignment = assignment
        self.job_id = job_id
        self.proof = proof
        self.kept_cnf = canonical_kept_dimacs(package.cnf)
        self.kept_cnf_blob_hash = sha256_bytes(self.kept_cnf)
        self.existing = existing
        self.map = _map_bytes(package.cnf)
        self.lean = _lean_bytes(job_id, package.cnf, proof)
        self.calls: list[tuple[str, str]] = []
        self.model_reads = 0
        self.status_reads = 0
        self.status_job_id = job_id
        self.status_state = "completed"
        self.status_result: str | None = result
        self.status_override_after_driver: str | None = None
        self.content_type_overrides: dict[str, str] = {}
        self.model_override_after_driver: bytes | None = None

    def _json_response(self, path: str, value: dict[str, Any]) -> HttpResponse:
        return HttpResponse(
            200,
            canonical_json_bytes(value),
            {"Content-Type": self.content_type_overrides.get(path, "application/json")},
        )

    def __call__(
        self, method: str, url: str, _body: object, _headers: object
    ) -> HttpResponse:
        parsed = urllib.parse.urlsplit(url)
        path = parsed.path + (f"?{parsed.query}" if parsed.query else "")
        self.calls.append((method, path))
        identity = raw_dimacs_identity(
            backend="cadical",
            solver_profile=self.package.wave_manifest["execution"]["solver_profile"],
            cnf_sha256=self.package.cnf_sha256,
            producer_manifest_sha256=self.package.producer_manifest_sha256,
            requested_core_limit=1,
        )
        if method == "POST" and path == "/jobs/prepare-cnf":
            return self._json_response(
                path,
                {
                    "job_id": self.job_id,
                    "cnf_blob_hash": self.package.cnf_sha256,
                    "identity_hash": identity,
                    "num_vars": self.package.num_vars,
                    "num_clauses": self.package.num_clauses,
                    "preview": "",
                    "existing": self.existing,
                    "requested_core_limit": 1,
                },
            )
        if method == "GET" and path == f"/jobs/{self.job_id}/cnf":
            return HttpResponse(
                200, self.package.cnf, {"Content-Type": "application/octet-stream"}
            )
        if method == "POST" and path == f"/jobs/confirm?job_id={self.job_id}":
            return self._json_response(
                path, {"job_id": self.job_id, "status": "confirmed"}
            )
        if method == "GET" and path == f"/jobs/{self.job_id}":
            self.status_reads += 1
            result = (
                self.status_override_after_driver
                if self.status_reads > 1
                and self.status_override_after_driver is not None
                else self.status_result
            )
            return self._json_response(
                path,
                {
                    "id": self.status_job_id,
                    "status": self.status_state,
                    "result": result,
                    "backend": "cadical",
                    "project": "erdos-97-96-formalization",
                    "timeout_s": 19,
                    "march_timeout_s": 19,
                    "requested_core_limit": 1,
                    "attested_solver_processes": 1,
                    "attestation_basis": "SINGLE_PROCESS_NO_PARALLEL_FLAG",
                    "identity_hash": identity,
                    "cnf_blob_hash": self.package.cnf_sha256,
                    "producer_manifest_hash": self.package.producer_manifest_sha256,
                    "kept_cnf_blob_hash": self.kept_cnf_blob_hash,
                },
            )
        if method == "GET" and path == f"/jobs/{self.job_id}/model":
            self.model_reads += 1
            if self.model_reads > 1 and self.model_override_after_driver is not None:
                raw = self.model_override_after_driver
            else:
                # Current Rust field order is intentionally not sort-key canonical.
                raw = json.dumps(
                    {
                        "job_id": self.job_id,
                        "result": "SAT",
                        "num_assigned": len(self.assignment or []),
                        "assignment": self.assignment,
                    },
                    separators=(",", ":"),
                ).encode()
            return HttpResponse(200, raw, {"Content-Type": "application/json"})
        if method == "GET" and path.startswith(f"/jobs/{self.job_id}/log?"):
            log = f"s {self.result}\n".encode()
            return HttpResponse(
                200,
                log,
                {
                    "Content-Type": "text/plain; charset=utf-8",
                    "X-Log-Size-Bytes": str(len(log)),
                },
            )
        if method == "GET" and path == f"/jobs/{self.job_id}/proof":
            return HttpResponse(
                200,
                self.proof,
                {
                    "Content-Type": "text/plain; charset=utf-8",
                    "X-Proof-Blob-Hash": sha256_bytes(self.proof),
                },
            )
        if method == "GET" and path == f"/jobs/{self.job_id}/clause-map":
            return HttpResponse(200, self.map, {"Content-Type": "application/json"})
        if (
            method == "GET"
            and path == f"/jobs/{self.job_id}/blobs/{self.kept_cnf_blob_hash}"
        ):
            return HttpResponse(
                200,
                self.kept_cnf,
                {"Content-Type": "application/octet-stream"},
            )
        expected_lean = f"/jobs/{self.job_id}/lean?{urllib.parse.urlencode({'toolchain': LEAN_TOOLCHAIN})}"
        if method == "GET" and path == expected_lean:
            return HttpResponse(
                200, self.lean, {"Content-Type": "text/plain; charset=utf-8"}
            )
        raise AssertionError((method, path))


def _adapter(
    tmp_path: Path,
    package: AuthenticatedPackageSnapshot,
    api: FakeCurrentApi,
    *,
    tamper_journal: bool = False,
) -> CardHeadPiqdAdapter:
    def run_factory(_request: object) -> CurrentPiqdRun:
        strict = BoundedCurrentPiqdHttpTransport(
            "http://piqd.invalid", api, limits=package.limits
        )
        client = PiqdRawDimacsClient("http://piqd.invalid", transport=strict)
        journal = DurableAttemptJournal(
            tmp_path / "attempt.jsonl", manifest=package.wave_manifest
        )
        runner = PiqdCegarDriver(
            client=client,
            journal=journal,
            policy=DriverPolicy(
                max_prepare_attempts=1,
                max_confirm_attempts=1,
                max_polls=1,
                max_result_attempts=1,
                poll_interval_s=0,
                solver_timeout_s=19,
                march_timeout_s=19,
                requested_core_limit=1,
            ),
            sleep=lambda _seconds: None,
        )
        if tamper_journal:
            production_run = runner.run

            def tampering_run(**kwargs: Any):
                result = production_run(**kwargs)
                journal.path.write_bytes(journal.path.read_bytes() + b"{}\n")
                return result

            runner.run = tampering_run  # type: ignore[method-assign]
        return CurrentPiqdRun(runner, strict)

    return CardHeadPiqdAdapter(
        package, transport=CurrentPiqdPacketAssembler(package, run_factory)
    )


def _invoke(
    adapter: CardHeadPiqdAdapter, instance: Any, tmp_path: Path, *, proof: bool = False
):
    tmp_path.mkdir(parents=True, exist_ok=True)
    cnf_path = tmp_path / "runner.cnf"
    cnf_path.write_bytes(adapter.package.cnf)
    return adapter(
        instance,
        cnf_path,
        timeout_seconds=19,
        nice=7,
        proof_path=(tmp_path / "legacy.drat" if proof else None),
    )


def test_current_api_assembler_reaches_exact12_run_cell(
    cell_package: AuthenticatedPackageSnapshot, tmp_path: Path
) -> None:
    api = FakeCurrentApi(cell_package, result="UNKNOWN")
    result = exact12_v14_cell_run.run_cell(
        Path(__file__).resolve().parents[3],
        tmp_path / "run",
        0,
        timeout_seconds=19,
        nice=7,
        solver=_adapter(tmp_path / "transport", cell_package, api),
    )
    assert result["status"] == "UNKNOWN"
    assert ("POST", "/jobs/prepare-cnf") in api.calls
    assert ("GET", "/jobs/job-card-head") in api.calls


def test_raw_noncanonical_model_is_hashed_then_canonicalized(
    cell_fixture: tuple[Any, list[int], AuthenticatedPackageSnapshot], tmp_path: Path
) -> None:
    instance, assignment, package = cell_fixture
    adapter = _adapter(
        tmp_path, package, FakeCurrentApi(package, result="SAT", assignment=assignment)
    )
    result = _invoke(adapter, instance, tmp_path)
    assert result.verdict == "SAT"
    assert result.cube == CELL0_CUBE
    assert adapter.last_request is not None
    assert adapter.last_request.nice_forwarded is False
    assert adapter.last_request.one_core_execution_authenticated is False


def test_real_source_semantics_accept_valid_and_reject_invalid_cube(
    cell_fixture: tuple[Any, list[int], AuthenticatedPackageSnapshot],
) -> None:
    instance, _assignment, _package = cell_fixture
    assert source_faithful_cube_ok(instance.model, CELL0_CUBE)
    invalid = {center: list(row) for center, row in CELL0_CUBE.items()}
    invalid[0] = list(invalid[1])
    assert not source_faithful_cube_ok(instance.model, invalid)
    with pytest.raises(EncodingError):
        instance.decode_model(frozenset())


@pytest.mark.parametrize(
    "attack",
    [
        "partial",
        "duplicate",
        "out_of_range",
        "bool_literal",
        "crossed_model",
    ],
)
def test_sat_model_attacks_fail_closed(
    cell_fixture: tuple[Any, list[int], AuthenticatedPackageSnapshot],
    tmp_path: Path,
    attack: str,
) -> None:
    instance, assignment, package = cell_fixture
    attacked: list[object] = list(assignment)
    job_id = "job-card-head"
    if attack == "partial":
        attacked.pop()
    elif attack == "duplicate":
        attacked[-1] = attacked[0]
    elif attack == "out_of_range":
        attacked[-1] = package.num_vars + 1
    elif attack == "bool_literal":
        attacked[-1] = True
    elif attack == "crossed_model":
        job_id = "job-crossed"
    api = FakeCurrentApi(package, result="SAT", assignment=attacked)
    if attack == "crossed_model":
        raw = json.dumps(
            {
                "job_id": job_id,
                "result": "SAT",
                "num_assigned": len(attacked),
                "assignment": attacked,
            },
            separators=(",", ":"),
        ).encode()
        api.model_override_after_driver = raw
    with pytest.raises(CardHeadPiqdAdapterError):
        _invoke(_adapter(tmp_path, package, api), instance, tmp_path)


def test_model_endpoint_tamper_after_journal_fails(
    cell_fixture: tuple[Any, list[int], AuthenticatedPackageSnapshot], tmp_path: Path
) -> None:
    instance, assignment, package = cell_fixture
    api = FakeCurrentApi(package, result="SAT", assignment=assignment)
    tampered = list(assignment)
    tampered[-1] *= -1
    api.model_override_after_driver = json.dumps(
        {
            "job_id": api.job_id,
            "result": "SAT",
            "num_assigned": len(tampered),
            "assignment": tampered,
        },
        separators=(",", ":"),
    ).encode()
    with pytest.raises(CardHeadPiqdAdapterError, match="journal artifact"):
        _invoke(_adapter(tmp_path, package, api), instance, tmp_path)


def test_crossed_status_job_and_response_journal_disagreement_fail(
    cell_fixture: tuple[Any, list[int], AuthenticatedPackageSnapshot], tmp_path: Path
) -> None:
    instance, assignment, package = cell_fixture
    crossed = FakeCurrentApi(package, result="SAT", assignment=assignment)
    crossed.status_job_id = "job-other"
    with pytest.raises(CardHeadPiqdAdapterError):
        _invoke(
            _adapter(tmp_path / "crossed", package, crossed),
            instance,
            tmp_path / "crossed",
        )
    disagreement = FakeCurrentApi(package, result="SAT", assignment=assignment)
    disagreement.status_override_after_driver = "UNSAT"
    with pytest.raises(CardHeadPiqdAdapterError):
        _invoke(
            _adapter(tmp_path / "disagree", package, disagreement),
            instance,
            tmp_path / "disagree",
        )


def test_tampered_durable_journal_fails_closed(
    cell_fixture: tuple[Any, list[int], AuthenticatedPackageSnapshot], tmp_path: Path
) -> None:
    instance, assignment, package = cell_fixture
    api = FakeCurrentApi(package, result="SAT", assignment=assignment)
    with pytest.raises(CardHeadPiqdAdapterError, match="journal"):
        _invoke(
            _adapter(tmp_path, package, api, tamper_journal=True),
            instance,
            tmp_path,
        )


def test_current_unsat_endpoints_make_observational_typed_handoff(
    cell_fixture: tuple[Any, list[int], AuthenticatedPackageSnapshot], tmp_path: Path
) -> None:
    instance, _assignment, package = cell_fixture
    api = FakeCurrentApi(package, result="UNSAT")
    adapter = _adapter(tmp_path, package, api)
    result = _invoke(adapter, instance, tmp_path, proof=True)
    assert result.verdict == "UNSAT"
    assert result.proof_verified is False
    handoff = adapter.last_unsat_handoff
    assert handoff is not None
    assert handoff.certificate_kind == CERTIFICATE_KIND
    assert handoff.certificate_path.suffix == ".lrat"
    assert not (tmp_path / "legacy.drat").exists()
    assert handoff.certificate_source_link_authenticated is False
    assert handoff.lean_replay_executed is False
    assert handoff.replay_receipt_sha256 is None
    assert handoff.theorem_promotion_allowed is False


@pytest.mark.parametrize("crossed", ["proof", "map", "lean"])
def test_crossed_unsat_endpoint_artifacts_fail(
    cell_fixture: tuple[Any, list[int], AuthenticatedPackageSnapshot],
    tmp_path: Path,
    crossed: str,
) -> None:
    instance, _assignment, package = cell_fixture
    api = FakeCurrentApi(package, result="UNSAT")
    if crossed == "proof":
        api.proof = b"368076 0 1 3 0\n"
    elif crossed == "map":
        value = json.loads(api.map)
        value["submitted_sha256"] = digest("f")
        api.map = canonical_json_bytes(value)
    else:
        api.lean = api.lean.replace(b"job_card_head", b"job_other")
    with pytest.raises(CardHeadPiqdAdapterError):
        _invoke(_adapter(tmp_path, package, api), instance, tmp_path, proof=True)


def test_invalid_lrat_is_rejected_before_artifact_write(
    cell_fixture: tuple[Any, list[int], AuthenticatedPackageSnapshot], tmp_path: Path
) -> None:
    instance, _assignment, package = cell_fixture
    api = FakeCurrentApi(package, result="UNSAT", proof=b"not lrat\n")
    with pytest.raises(CardHeadPiqdAdapterError, match="LRAT"):
        _invoke(_adapter(tmp_path, package, api), instance, tmp_path, proof=True)
    assert not (tmp_path / "legacy.lrat").exists()


def test_create_once_and_nofollow_custody(
    cell_fixture: tuple[Any, list[int], AuthenticatedPackageSnapshot], tmp_path: Path
) -> None:
    instance, _assignment, package = cell_fixture
    (tmp_path / "legacy.lrat").write_bytes(VALID_LRAT)
    with pytest.raises(CardHeadPiqdAdapterError, match="already exists"):
        _invoke(
            _adapter(
                tmp_path / "journal", package, FakeCurrentApi(package, result="UNSAT")
            ),
            instance,
            tmp_path,
            proof=True,
        )
    target = tmp_path / "outside"
    target.write_bytes(package.cnf)
    linked = tmp_path / "linked.cnf"
    linked.symlink_to(target)
    adapter = _adapter(
        tmp_path / "linked-journal",
        package,
        FakeCurrentApi(package, result="SAT", assignment=[]),
    )
    with pytest.raises(CardHeadPiqdAdapterError, match="no-follow"):
        adapter(instance, linked)


def test_json_depth_nodes_and_response_size_are_bounded() -> None:
    limits = EndpointLimits(json_bytes=128, json_depth=3, json_nodes=5)
    with pytest.raises(CardHeadPiqdAdapterError, match="depth"):
        adapter_module._strict_json(
            b'{"a":{"b":{"c":1}}}',
            source="deep",
            canonical=False,
            max_bytes=128,
            max_depth=3,
            max_nodes=20,
        )
    with pytest.raises(CardHeadPiqdAdapterError, match="node"):
        adapter_module._strict_json(
            b'{"a":[1,2,3,4,5]}',
            source="wide",
            canonical=False,
            max_bytes=128,
            max_depth=4,
            max_nodes=5,
        )
    core = BoundedCurrentPiqdHttpTransport(
        "http://piqd.invalid",
        lambda *_args: HttpResponse(
            200, b"{" + b"x" * 129, {"Content-Type": "application/json"}
        ),
        limits=limits,
    )
    with pytest.raises(PiqdOracleError, match="limit"):
        core.get("/jobs/job/model")


def test_authenticated_package_rejects_endpoint_limit_subclass(
    cell_package: AuthenticatedPackageSnapshot,
) -> None:
    class CustomLimits(EndpointLimits):
        pass

    with pytest.raises(CardHeadPiqdAdapterError, match="exactly EndpointLimits"):
        AuthenticatedPackageSnapshot(
            cell_package.cnf,
            cell_package.producer_manifest,
            cell_package.wave_manifest_bytes,
            limits=CustomLimits(),
        )


def test_bounded_transport_rejects_nonexact_headers_before_iteration() -> None:
    class HostileHeaders(dict[str, str]):
        def items(self) -> Any:
            raise AssertionError("nonexact header mapping must not be iterated")

    malformed_headers: tuple[object, ...] = (
        None,
        [],
        MappingProxyType({"Content-Type": "application/json"}),
        HostileHeaders({"Content-Type": "application/json"}),
    )
    for headers in malformed_headers:
        core = BoundedCurrentPiqdHttpTransport(
            "http://piqd.invalid",
            lambda *_args, headers=headers: HttpResponse(  # type: ignore[arg-type]
                200, b"{}", headers
            ),
        )
        with pytest.raises(PiqdOracleError, match="malformed HttpResponse headers"):
            core.get("/jobs/job/model")
        assert core.responses == []


def test_bounded_transport_rejects_nonexact_header_names_and_values() -> None:
    class StringSubclass(str):
        pass

    malformed_headers: tuple[dict[object, object], ...] = (
        {1: "application/json"},
        {"Content-Type": 1},
        {StringSubclass("Content-Type"): "application/json"},
        {"Content-Type": StringSubclass("application/json")},
    )
    for headers in malformed_headers:
        core = BoundedCurrentPiqdHttpTransport(
            "http://piqd.invalid",
            lambda *_args, headers=headers: HttpResponse(  # type: ignore[arg-type]
                200, b"{}", headers
            ),
        )
        with pytest.raises(PiqdOracleError, match="malformed HttpResponse headers"):
            core.get("/jobs/job/model")
        assert core.responses == []


def test_bounded_transport_rejects_duplicate_content_type_headers() -> None:
    core = BoundedCurrentPiqdHttpTransport(
        "http://piqd.invalid",
        lambda *_args: HttpResponse(
            200,
            b"{}",
            {
                "Content-Type": "application/json",
                "content-type": "application/json",
            },
        ),
    )

    with pytest.raises(PiqdOracleError, match="content-type mismatch"):
        core.get("/jobs/job/model")
    assert core.responses == []


def test_bounded_transport_accepts_only_exact_job_bound_blob_route() -> None:
    body = b"p cnf 0 0\n"
    blob_hash = sha256_bytes(body)
    requested: list[str] = []

    def transport(_method: str, url: str, *_args: object) -> HttpResponse:
        requested.append(urllib.parse.urlsplit(url).path)
        return HttpResponse(200, body, {"Content-Type": "application/octet-stream"})

    core = BoundedCurrentPiqdHttpTransport(
        "http://piqd.invalid",
        transport,
    )

    response = core.get(f"/jobs/job/blobs/{blob_hash}")
    assert response.body == body
    assert requested == [f"/jobs/job/blobs/{blob_hash}"]
    for path in (
        f"/jobs/job/blobs/{blob_hash.upper()}",
        f"/jobs/job/blobs/{blob_hash}/extra",
        f"/jobs/job/blob/{blob_hash}",
    ):
        with pytest.raises(PiqdOracleError, match="unsupported|digest"):
            core.get(path)
    assert requested == [f"/jobs/job/blobs/{blob_hash}"]


@pytest.mark.parametrize(
    ("response", "message"),
    [
        (
            HttpResponse(
                404, b"p cnf 0 0\n", {"Content-Type": "application/octet-stream"}
            ),
            "HTTP 404",
        ),
        (
            HttpResponse(200, b"p cnf 0 0\n", {"Content-Type": "application/json"}),
            "content-type",
        ),
        (
            HttpResponse(
                200, b"123456789", {"Content-Type": "application/octet-stream"}
            ),
            "exceeds limit",
        ),
        (object(), "malformed HttpResponse"),
    ],
)
def test_job_bound_blob_transport_rejects_status_type_and_size(
    response: object, message: str
) -> None:
    limits = EndpointLimits(cnf_bytes=8)
    core = BoundedCurrentPiqdHttpTransport(
        "http://piqd.invalid",
        lambda *_args: response,  # type: ignore[arg-type,return-value]
        limits=limits,
    )
    with pytest.raises(PiqdOracleError, match=message):
        core.get(f"/jobs/job/blobs/{'0' * 64}")
    assert core.responses == []


def test_certified_packet_tail_is_explicit_and_observational_route_unchanged(
    tmp_path: Path, cell_package: AuthenticatedPackageSnapshot
) -> None:
    def assemble(fetch: bool, directory: str):
        api = FakeCurrentApi(cell_package, result="UNSAT")

        def run_factory(_request: object) -> CurrentPiqdRun:
            strict = BoundedCurrentPiqdHttpTransport(
                "http://piqd.invalid", api, limits=cell_package.limits
            )
            runner = PiqdCegarDriver(
                client=PiqdRawDimacsClient("http://piqd.invalid", transport=strict),
                journal=DurableAttemptJournal(
                    tmp_path / directory / "attempt.jsonl",
                    manifest=cell_package.wave_manifest,
                ),
                policy=DriverPolicy(
                    max_prepare_attempts=1,
                    max_confirm_attempts=1,
                    max_polls=1,
                    max_result_attempts=1,
                    poll_interval_s=0,
                    requested_core_limit=1,
                ),
                sleep=lambda _seconds: None,
            )
            return CurrentPiqdRun(runner, strict)

        (tmp_path / directory).mkdir()
        request = CardHeadPiqdAdapter(cell_package, transport=lambda _r: None)._request(  # type: ignore[arg-type]
            30, 10, True
        )
        packet = CurrentPiqdPacketAssembler(
            cell_package,
            run_factory,
            fetch_certified_kept_blob=fetch,
        )(request)
        return packet, api

    observed, observed_api = assemble(False, "observed")
    assert observed.kept_cnf_blob_hash is None
    assert observed.kept_cnf_blob is None
    assert not any("/blobs/" in path for _method, path in observed_api.calls)

    certified, certified_api = assemble(True, "certified")
    assert certified.kept_cnf_blob_hash == sha256_bytes(certified.kept_cnf_blob)
    assert any("/blobs/" in path for _method, path in certified_api.calls)


def test_public_production_transport_owns_fresh_attempt_root(
    tmp_path: Path, cell_package: AuthenticatedPackageSnapshot
) -> None:
    attempt_root = tmp_path / "piqd-attempts"
    packet_transport = make_current_piqd_packet_transport(
        cell_package,
        output_root=attempt_root,
        base_url="http://piqd.invalid",
        transport=lambda *_args: HttpResponse(
            500, b"{}", {"Content-Type": "application/json"}
        ),
        max_polls=1,
        poll_interval_s=0,
    )
    assert type(packet_transport) is CurrentPiqdPacketAssembler
    assert packet_transport.fetch_certified_kept_blob is True
    assert attempt_root.is_dir()
    assert not any(attempt_root.iterdir())

    with pytest.raises(CardHeadPiqdAdapterError, match="already exists"):
        make_current_piqd_packet_transport(
            cell_package,
            output_root=attempt_root,
            base_url="http://piqd.invalid",
            transport=lambda *_args: HttpResponse(
                500, b"{}", {"Content-Type": "application/json"}
            ),
            max_polls=1,
            poll_interval_s=0,
        )


def test_public_production_transport_validates_before_creating_root(
    tmp_path: Path, cell_package: AuthenticatedPackageSnapshot
) -> None:
    attempt_root = tmp_path / "must-not-exist"
    with pytest.raises(CardHeadPiqdAdapterError, match="max_polls"):
        make_current_piqd_packet_transport(
            cell_package,
            output_root=attempt_root,
            base_url="http://piqd.invalid",
            max_polls=False,
        )
    assert not attempt_root.exists()


def test_cli_fails_closed_on_nonexact_response_headers(
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
    capsys: pytest.CaptureFixture[str],
) -> None:
    class HostileHeaders(dict[str, str]):
        def items(self) -> Any:
            raise AssertionError("nonexact header mapping must not be iterated")

    def malformed_transport(*_args: object, **_kwargs: object) -> HttpResponse:
        return HttpResponse(
            200,
            b"{}",
            HostileHeaders({"Content-Type": "application/json"}),
        )

    monkeypatch.setattr(adapter_module, "stdlib_http_transport", malformed_transport)
    result = adapter_module.main(
        [
            "run",
            "--repo-root",
            str(REPO_ROOT),
            "--output-root",
            str(tmp_path / "malformed-headers"),
            "--cell-index",
            "0",
            "--max-polls",
            "1",
            "--poll-interval-seconds",
            "0",
        ]
    )

    output = capsys.readouterr().out
    assert result == 2
    assert "failed closed" in output


def test_proof_and_lean_reads_are_bounded(
    cell_fixture: tuple[Any, list[int], AuthenticatedPackageSnapshot], tmp_path: Path
) -> None:
    instance, _assignment, package = cell_fixture
    limits = replace(package.limits, proof_bytes=8, lean_bytes=8)
    bounded = AuthenticatedPackageSnapshot(
        package.cnf,
        package.producer_manifest,
        package.wave_manifest_bytes,
        limits=limits,
    )
    with pytest.raises(CardHeadPiqdAdapterError):
        _invoke(
            _adapter(tmp_path, bounded, FakeCurrentApi(bounded, result="UNSAT")),
            instance,
            tmp_path,
            proof=True,
        )


def test_malformed_json_content_type_and_bool_int_attacks(
    cell_fixture: tuple[Any, list[int], AuthenticatedPackageSnapshot], tmp_path: Path
) -> None:
    instance, assignment, package = cell_fixture
    wrong_type = FakeCurrentApi(package, result="SAT", assignment=assignment)
    wrong_type.content_type_overrides["/jobs/prepare-cnf"] = "text/plain; charset=utf-8"
    with pytest.raises(CardHeadPiqdAdapterError):
        _invoke(
            _adapter(tmp_path / "type", package, wrong_type),
            instance,
            tmp_path / "type",
        )
    bool_count = FakeCurrentApi(package, result="SAT", assignment=assignment)
    raw = json.dumps(
        {
            "job_id": bool_count.job_id,
            "result": "SAT",
            "num_assigned": True,
            "assignment": assignment,
        },
        separators=(",", ":"),
    ).encode()
    bool_count.model_override_after_driver = raw
    with pytest.raises(CardHeadPiqdAdapterError):
        _invoke(
            _adapter(tmp_path / "bool", package, bool_count),
            instance,
            tmp_path / "bool",
        )


def test_unknown_and_failed_are_nonpromotable(
    cell_fixture: tuple[Any, list[int], AuthenticatedPackageSnapshot], tmp_path: Path
) -> None:
    instance, _assignment, package = cell_fixture
    api = FakeCurrentApi(package, result="UNKNOWN")
    result = _invoke(_adapter(tmp_path, package, api), instance, tmp_path)
    assert result.verdict == "UNKNOWN"
    assert result.proof_verified is False
    failed = FakeCurrentApi(package, result="UNKNOWN")
    failed.status_state = "failed"
    failed.status_result = None
    with pytest.raises(CardHeadPiqdAdapterError):
        _invoke(
            _adapter(tmp_path / "failed", package, failed),
            instance,
            tmp_path / "failed",
        )


REPO_ROOT = Path(__file__).resolve().parents[3]


def _forge_changed_inventory(output_root: Path, relative: str) -> None:
    receipt_path = output_root / "canary-receipt.json"
    receipt = json.loads(receipt_path.read_bytes())
    changed = (output_root / relative).read_bytes()
    receipt["inventory"][relative] = {
        "bytes": len(changed),
        "sha256": sha256_bytes(changed),
    }
    if relative == "packet.json":
        receipt["packet_sha256"] = sha256_bytes(changed)
    unsigned = dict(receipt)
    unsigned.pop("receipt_sha256")
    receipt["receipt_sha256"] = sha256_bytes(canonical_json_bytes(unsigned))
    receipt_path.write_bytes(canonical_json_bytes(receipt) + b"\n")


def test_production_canary_sat_restart_and_standalone_replay(
    cell_fixture: tuple[Any, list[int], AuthenticatedPackageSnapshot], tmp_path: Path
) -> None:
    _instance, assignment, _fixture_package = cell_fixture
    production = build_source_faithful_canary_package(REPO_ROOT, 0)
    api = FakeCurrentApi(production.snapshot, result="SAT", assignment=assignment)
    output_root = tmp_path / "production-sat"
    run = run_production_canary(
        REPO_ROOT,
        output_root,
        0,
        base_url="http://piqd.invalid",
        transport=api,
        timeout_seconds=19,
        max_polls=1,
        poll_interval_s=0,
    )
    assert run.restarted is False
    assert run.receipt["result"] == "SAT"
    assert run.receipt["run_status"] == "SAT_WITNESS_REPLAYED"
    assert validate_production_output(REPO_ROOT, output_root, 0) == run.receipt
    call_count = len(api.calls)

    def forbidden_transport(*_args: object) -> HttpResponse:
        raise AssertionError("completed restart must not invoke transport")

    restarted = run_production_canary(
        REPO_ROOT,
        output_root,
        0,
        transport=forbidden_transport,
    )
    assert restarted.restarted is True
    assert restarted.receipt == run.receipt
    assert len(api.calls) == call_count


def test_new_production_output_rejects_existing_prepare_before_confirm_or_solve(
    cell_fixture: tuple[Any, list[int], AuthenticatedPackageSnapshot], tmp_path: Path
) -> None:
    _instance, assignment, _fixture_package = cell_fixture
    production = build_source_faithful_canary_package(REPO_ROOT, 0)
    api = FakeCurrentApi(
        production.snapshot,
        result="SAT",
        assignment=assignment,
        existing=True,
    )

    with pytest.raises(
        CardHeadPiqdAdapterError,
        match="fresh CardHead qualification requires prepare existing=false",
    ):
        run_production_canary(
            REPO_ROOT,
            tmp_path / "production-existing-prepare",
            0,
            base_url="http://piqd.invalid",
            transport=api,
            timeout_seconds=19,
            max_polls=1,
            poll_interval_s=0,
        )

    assert api.calls == [("POST", "/jobs/prepare-cnf")]


def test_production_validator_rejects_crossed_packet_and_nofollow(
    cell_fixture: tuple[Any, list[int], AuthenticatedPackageSnapshot], tmp_path: Path
) -> None:
    _instance, assignment, _fixture_package = cell_fixture
    production = build_source_faithful_canary_package(REPO_ROOT, 0)
    output_root = tmp_path / "production-crossed"
    run_production_canary(
        REPO_ROOT,
        output_root,
        0,
        base_url="http://piqd.invalid",
        transport=FakeCurrentApi(
            production.snapshot, result="SAT", assignment=assignment
        ),
        timeout_seconds=19,
        max_polls=1,
        poll_interval_s=0,
    )
    packet_path = output_root / "packet.json"
    packet = json.loads(packet_path.read_bytes())
    packet["job"]["job_id"] = "crossed-job"
    packet_path.write_bytes(canonical_json_bytes(packet))
    _forge_changed_inventory(output_root, "packet.json")
    with pytest.raises(CardHeadPiqdAdapterError, match="job|binding|sealed journal"):
        validate_production_output(REPO_ROOT, output_root, 0)

    clean_root = tmp_path / "production-nofollow"
    run_production_canary(
        REPO_ROOT,
        clean_root,
        0,
        base_url="http://piqd.invalid",
        transport=FakeCurrentApi(
            production.snapshot, result="SAT", assignment=assignment
        ),
        timeout_seconds=19,
        max_polls=1,
        poll_interval_s=0,
    )
    status_path = clean_root / "packet-status.raw.json"
    outside = tmp_path / "outside-status.json"
    outside.write_bytes(status_path.read_bytes())
    status_path.unlink()
    status_path.symlink_to(outside)
    with pytest.raises(CardHeadPiqdAdapterError, match="unsafe|no-follow"):
        validate_production_output(REPO_ROOT, clean_root, 0)


def test_production_unsat_is_typed_observational_and_cross_packet_closed(
    tmp_path: Path,
) -> None:
    production = build_source_faithful_canary_package(REPO_ROOT, 0)
    output_root = tmp_path / "production-unsat"
    run = run_production_canary(
        REPO_ROOT,
        output_root,
        0,
        base_url="http://piqd.invalid",
        transport=FakeCurrentApi(production.snapshot, result="UNSAT"),
        timeout_seconds=19,
        max_polls=1,
        poll_interval_s=0,
    )
    assert run.receipt["result"] == "UNSAT"
    assert run.receipt["run_status"] == "DISCOVERY_UNSAT_UNVERIFIED"
    assert (output_root / "cell-run" / "terminal.lrat").is_file()
    assert not (output_root / "cell-run" / "terminal.drat").exists()
    assert (
        len(json.loads((output_root / "packet.json").read_bytes())["journal_paths"])
        == 2
    )
    validate_production_output(REPO_ROOT, output_root, 0)

    packet_path = output_root / "packet.json"
    packet = json.loads(packet_path.read_bytes())
    packet["terminal_journal_path"] = packet["journal_paths"][0]
    packet_path.write_bytes(canonical_json_bytes(packet))
    _forge_changed_inventory(output_root, "packet.json")
    with pytest.raises(CardHeadPiqdAdapterError, match="terminal|binding|journal"):
        validate_production_output(REPO_ROOT, output_root, 0)


def test_production_partial_restart_fails_closed(tmp_path: Path) -> None:
    output_root = tmp_path / "partial"
    output_root.mkdir()
    (output_root / "orphan").write_bytes(b"forensic partial output")
    with pytest.raises(CardHeadPiqdAdapterError, match="receipt|no-follow"):
        run_production_canary(
            REPO_ROOT,
            output_root,
            0,
            transport=lambda *_args: (_ for _ in ()).throw(
                AssertionError("partial restart must not invoke transport")
            ),
        )
