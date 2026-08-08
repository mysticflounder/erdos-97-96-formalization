from __future__ import annotations

import json
import threading
from collections.abc import Mapping
from pathlib import Path
from typing import Any

import pytest

from census.p97_search.phase3_cegar_wave import (
    CERTIFIED_UNSAT,
    DISCOVERY_UNSAT,
    ERROR,
    STRUCTURAL_SAT,
    canonical_json_bytes,
    publication_assessment,
    sha256_bytes,
    validate_attempt_journal,
    wave_manifest_sha256,
)
from census.p97_search.phase3_piqd_driver import (
    DriverPolicy,
    DurableAttemptJournal,
    JournalAppendError,
    PiqdCegarDriver,
    PiqdDriverError,
    _result_exit_code,
)
from census.p97_search.phase3_piqd_oracle import (
    CheckedModel,
    PiqdOracleError,
    PiqdProofUnavailable,
    PreparedJob,
)
from census.p97_search.phase3_piqd_replay import (
    NORMALIZATION_SCHEMA,
    REPLAY_SCHEMA,
    LeanLratReplayer,
    LratReplayError,
    LratReplayResult,
    canonical_kept_dimacs,
    lean_checker_source,
)

CNF = b"p cnf 2 2\n1 0\n-1 2 0\n"
PRODUCER = canonical_json_bytes({"encoder": "p97-test", "source": "fixture"})


def digest(char: str) -> str:
    return char * 64


def wave_manifest() -> dict[str, Any]:
    return {
        "schema": "p97-cegar-wave/v1",
        "wave_id": "piqd-driver-test",
        "iteration": 1,
        "parent_checkpoint_sha256": digest("0"),
        "source": {
            "live_leaf": "Problem97.liveLeaf",
            "ingress_hypotheses_sha256": digest("1"),
            "finite_schema": "fixture/v1",
            "cardinality_scope": "n = 2",
            "source_theorem": "Problem97.source",
        },
        "encoding": {
            "cnf_sha256": sha256_bytes(CNF),
            "variable_map_sha256": digest("2"),
            "producer_manifest_sha256": sha256_bytes(PRODUCER),
            "num_variables": 2,
            "num_clauses": 2,
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
            "evidence_classification": "UNIFORM_PRODUCER",
            "producer_theorem": "Problem97.producer",
            "lift_theorem": None,
            "consumer_theorem": "Problem97.consumer",
        },
    }


def prepared_job(*, existing: bool = False) -> PreparedJob:
    return PreparedJob(
        job_id="job-1",
        backend="cadical",
        solver_profile="unsat",
        cnf_blob_hash=sha256_bytes(CNF),
        identity_hash=digest("4"),
        num_vars=2,
        num_clauses=2,
        existing=existing,
    )


def replay_fixture(
    *, verified: bool, checker: bytes, proof: bytes
) -> tuple[LratReplayResult, bytes]:
    job = prepared_job()
    manifest = wave_manifest()
    kept_cnf = canonical_kept_dimacs(CNF)
    expected_checker = lean_checker_source(kept_cnf=kept_cnf, proof=proof)
    if checker != expected_checker:
        raise AssertionError("fixture checker must be generated from CNF and proof")
    receipt = canonical_json_bytes(
        {
            "schema": REPLAY_SCHEMA,
            "normalization": {
                "schema": NORMALIZATION_SCHEMA,
                "submitted_cnf_sha256": sha256_bytes(CNF),
                "canonical_kept_cnf_sha256": sha256_bytes(kept_cnf),
                "submitted_bytes_equal_kept_bytes": CNF == kept_cnf,
            },
            "job": {
                "id": job.job_id,
                "backend": job.backend,
                "solver_profile": job.solver_profile,
                "identity_hash": job.identity_hash,
                "cnf_blob_hash": job.cnf_blob_hash,
            },
            "wave_manifest_sha256": wave_manifest_sha256(manifest),
            "proof_sha256": sha256_bytes(proof),
            "checker_source_sha256": sha256_bytes(checker),
            "execution": {
                "returncode": 0 if verified else 1,
                "error": None,
            },
            "verified": verified,
        }
    )
    return LratReplayResult(verified, checker, receipt), receipt


class FakeClient:
    def __init__(
        self,
        *,
        prepare: list[PreparedJob | PiqdOracleError] | None = None,
        confirm: list[str | PiqdOracleError] | None = None,
        statuses: list[Mapping[str, Any] | PiqdOracleError] | None = None,
        model: CheckedModel | PiqdOracleError | None = None,
        solver_log: tuple[bytes, str] | PiqdOracleError | None = None,
        proof: tuple[bytes, str] | PiqdOracleError | None = None,
        expected_cnf: bytes = CNF,
    ) -> None:
        self.prepare_results = prepare or [prepared_job()]
        self.confirm_results = confirm or ["confirmed"]
        self.status_results = statuses or [
            {"id": "job-1", "status": "completed", "result": "UNKNOWN"}
        ]
        self.model_result = model
        self.log_result = solver_log
        self.proof_result = proof
        self.expected_cnf = expected_cnf
        self.calls: list[str] = []

    @staticmethod
    def _take(values: list[Any]) -> Any:
        if not values:
            raise AssertionError("fake client received an unexpected extra call")
        value = values.pop(0)
        if isinstance(value, Exception):
            raise value
        return value

    def prepare_cnf(self, **_: Any) -> PreparedJob:
        self.calls.append("prepare")
        return self._take(self.prepare_results)

    def confirm(self, job: PreparedJob, *, expected_cnf: bytes) -> str:
        assert job.job_id == "job-1"
        assert expected_cnf == self.expected_cnf
        self.calls.append("confirm")
        return self._take(self.confirm_results)

    def status(self, job_id: str) -> Mapping[str, Any]:
        assert job_id == "job-1"
        self.calls.append("status")
        return self._take(self.status_results)

    def checked_model(self, job: PreparedJob, *, cnf: bytes) -> CheckedModel:
        assert job.job_id == "job-1"
        assert cnf == CNF
        self.calls.append("model")
        if self.model_result is None:
            raise AssertionError("unexpected model call")
        if isinstance(self.model_result, Exception):
            raise self.model_result
        return self.model_result

    def log(self, job: PreparedJob) -> tuple[bytes, str]:
        assert job.job_id == "job-1"
        self.calls.append("log")
        if self.log_result is None:
            raise AssertionError("unexpected log call")
        if isinstance(self.log_result, Exception):
            raise self.log_result
        return self.log_result

    def proof(self, job: PreparedJob) -> tuple[bytes, str]:
        assert job.job_id == "job-1"
        self.calls.append("proof")
        if self.proof_result is None:
            raise AssertionError("unexpected proof call")
        if isinstance(self.proof_result, Exception):
            raise self.proof_result
        return self.proof_result


class FakeReplayer:
    def __init__(
        self,
        result: LratReplayResult | LratReplayError,
    ) -> None:
        self.result = result
        self.calls = 0

    def replay(self, **_: Any) -> LratReplayResult:
        self.calls += 1
        if isinstance(self.result, Exception):
            raise self.result
        return self.result


class TracingJournal(DurableAttemptJournal):
    def __init__(
        self, path: Path, *, manifest: Mapping[str, Any], trace: list[str]
    ) -> None:
        self.trace = trace
        super().__init__(path, manifest=manifest)

    def append_event(self, **kwargs: Any) -> dict[str, Any]:
        record = super().append_event(**kwargs)
        self.trace.append(f"append:{record['outcome']}:{record['detail']}")
        return record


def driver(
    tmp_path: Path,
    client: FakeClient,
    *,
    policy: DriverPolicy | None = None,
    journal_type: type[DurableAttemptJournal] = DurableAttemptJournal,
    proof_replayer: FakeReplayer | None = None,
) -> tuple[PiqdCegarDriver, DurableAttemptJournal]:
    wave = wave_manifest()
    journal = journal_type(tmp_path / "attempts.jsonl", manifest=wave)
    return (
        PiqdCegarDriver(
            client=client,
            journal=journal,
            policy=policy or DriverPolicy(poll_interval_s=0),
            proof_replayer=proof_replayer,
            sleep=lambda _: None,
        ),
        journal,
    )


def test_prepare_failure_is_durable_before_retry(tmp_path: Path) -> None:
    trace: list[str] = []

    class TracedClient(FakeClient):
        def prepare_cnf(self, **kwargs: Any) -> PreparedJob:
            trace.append("call:prepare")
            return super().prepare_cnf(**kwargs)

    client = TracedClient(
        prepare=[
            PiqdOracleError("piqd returned HTTP 500", retryable=True),
            prepared_job(existing=True),
        ]
    )
    wave = wave_manifest()
    journal = TracingJournal(tmp_path / "attempts.jsonl", manifest=wave, trace=trace)
    result = PiqdCegarDriver(
        client=client,
        journal=journal,
        policy=DriverPolicy(poll_interval_s=0),
        sleep=lambda _: None,
    ).run(wave_manifest=wave, cnf=CNF, producer_manifest=PRODUCER)

    first_call = trace.index("call:prepare")
    error_append = next(
        index
        for index, item in enumerate(trace)
        if item.startswith("append:ERROR:PREPARE")
    )
    second_call = trace.index("call:prepare", first_call + 1)
    assert first_call < error_append < second_call
    assert [record["outcome"] for record in journal.records].count(ERROR) == 2
    assert result.outcome == ERROR
    validate_attempt_journal(journal.records, manifest=wave)


def test_nonretryable_prepare_contract_failure_stops_immediately(
    tmp_path: Path,
) -> None:
    client = FakeClient(prepare=[PiqdOracleError("CNF identity mismatch")])
    runner, journal = driver(tmp_path, client)
    result = runner.run(
        wave_manifest=wave_manifest(), cnf=CNF, producer_manifest=PRODUCER
    )
    assert client.calls == ["prepare"]
    assert result.outcome == ERROR
    assert journal.records[-1]["detail"] == "PREPARE: CNF identity mismatch"


def test_append_failure_stops_before_retry_and_exposes_pending_record(
    tmp_path: Path,
) -> None:
    wave = wave_manifest()

    class FailingJournal(DurableAttemptJournal):
        fail_next = False

        def _append_serialized(
            self, record: Mapping[str, Any], serialized: bytes
        ) -> None:
            if self.fail_next:
                raise JournalAppendError("injected failure", pending_record=record)
            super()._append_serialized(record, serialized)

    journal = FailingJournal(tmp_path / "attempts.jsonl", manifest=wave)

    class ArmingClient(FakeClient):
        def prepare_cnf(self, **kwargs: Any) -> PreparedJob:
            self.calls.append("prepare")
            journal.fail_next = True
            raise PiqdOracleError("temporary HTTP 500", retryable=True)

    client = ArmingClient()
    runner = PiqdCegarDriver(
        client=client,
        journal=journal,
        policy=DriverPolicy(poll_interval_s=0),
        sleep=lambda _: None,
    )
    with pytest.raises(JournalAppendError) as exc_info:
        runner.run(wave_manifest=wave, cnf=CNF, producer_manifest=PRODUCER)
    assert client.calls == ["prepare"]
    assert exc_info.value.pending_record["outcome"] == ERROR
    assert len(journal.records) == 1


def test_polling_is_bounded_and_timeout_is_terminal(tmp_path: Path) -> None:
    client = FakeClient(
        statuses=[
            {"id": "job-1", "status": "running", "result": None},
            {"id": "job-1", "status": "running", "result": None},
        ]
    )
    runner, journal = driver(
        tmp_path,
        client,
        policy=DriverPolicy(max_polls=2, poll_interval_s=0),
    )
    result = runner.run(
        wave_manifest=wave_manifest(), cnf=CNF, producer_manifest=PRODUCER
    )
    assert client.calls.count("status") == 2
    assert result.outcome == ERROR
    assert journal.records[-1]["detail"].startswith("POLL_TIMEOUT:")


def test_solver_unknown_and_daemon_failed_remain_distinct(tmp_path: Path) -> None:
    unknown_client = FakeClient()
    unknown_runner, unknown_journal = driver(tmp_path / "unknown", unknown_client)
    unknown_runner.run(
        wave_manifest=wave_manifest(), cnf=CNF, producer_manifest=PRODUCER
    )
    assert unknown_journal.records[-1]["detail"].startswith("SOLVER_UNKNOWN:")

    failed_client = FakeClient(
        statuses=[{"id": "job-1", "status": "failed", "result": "UNKNOWN"}]
    )
    failed_runner, failed_journal = driver(tmp_path / "failed", failed_client)
    failed_runner.run(
        wave_manifest=wave_manifest(), cnf=CNF, producer_manifest=PRODUCER
    )
    assert failed_journal.records[-1]["detail"].startswith("DAEMON_FAILED:")


def test_failed_confirm_reconciliation_is_not_recorded_as_success(
    tmp_path: Path,
) -> None:
    client = FakeClient(confirm=["failed"])
    runner, journal = driver(tmp_path, client)
    result = runner.run(
        wave_manifest=wave_manifest(), cnf=CNF, producer_manifest=PRODUCER
    )
    assert client.calls == ["prepare", "confirm"]
    assert result.outcome == ERROR
    assert journal.records[-1]["detail"].startswith("DAEMON_FAILED:")
    assert not any(
        record["detail"] == "CONFIRM: job job-1 is failed" for record in journal.records
    )


def test_sat_model_response_is_archived_before_structural_sat(tmp_path: Path) -> None:
    body = canonical_json_bytes(
        {
            "job_id": "job-1",
            "result": "SAT",
            "assignment": [1, 2],
            "num_assigned": 2,
        }
    )
    model = CheckedModel((1, 2), sha256_bytes(body), body)
    client = FakeClient(
        statuses=[{"id": "job-1", "status": "completed", "result": "SAT"}],
        model=model,
    )
    runner, journal = driver(tmp_path, client)
    result = runner.run(
        wave_manifest=wave_manifest(), cnf=CNF, producer_manifest=PRODUCER
    )
    assert result.outcome == STRUCTURAL_SAT
    assert journal.records[-1]["artifacts"]["model_sha256"] == sha256_bytes(body)
    assert (journal.artifact_dir / sha256_bytes(body)).read_bytes() == body


def test_unsat_stays_discovery_only_with_archived_solver_log(
    tmp_path: Path,
) -> None:
    log = b"c piqd job job-1\ns UNSATISFIABLE\n"
    client = FakeClient(
        statuses=[{"id": "job-1", "status": "completed", "result": "UNSAT"}],
        solver_log=(log, sha256_bytes(log)),
    )
    runner, journal = driver(tmp_path, client)
    result = runner.run(
        wave_manifest=wave_manifest(), cnf=CNF, producer_manifest=PRODUCER
    )
    assert result.outcome == DISCOVERY_UNSAT
    assert journal.records[-1]["artifacts"]["solver_log_sha256"] == sha256_bytes(log)
    seal = json_load(journal.seal_path)
    assessment = publication_assessment(
        manifest=wave_manifest(),
        records=journal.records,
        expected_record_count=seal["record_count"],
        expected_terminal_sha256=seal["terminal_attempt_sha256"],
    )
    assert assessment["publication_candidate"] is False
    assert "terminal_outcome_not_certified_unsat" in assessment["blockers"]


def test_verified_replay_is_the_only_certified_unsat_path(tmp_path: Path) -> None:
    unsat_cnf = b"p cnf 2 2\n1 0\n-1 0\n"
    log = b"c piqd job job-1\ns UNSATISFIABLE\n"
    proof = b"3 0 1 2 0\n"
    wave = wave_manifest()
    wave["encoding"] = dict(wave["encoding"], cnf_sha256=sha256_bytes(unsat_cnf))
    job = PreparedJob(
        job_id="job-1",
        backend="cadical",
        solver_profile="unsat",
        cnf_blob_hash=sha256_bytes(unsat_cnf),
        identity_hash=digest("4"),
        num_vars=2,
        num_clauses=2,
        existing=False,
    )
    client = FakeClient(
        prepare=[job],
        statuses=[{"id": "job-1", "status": "completed", "result": "UNSAT"}],
        solver_log=(log, sha256_bytes(log)),
        proof=(proof, sha256_bytes(proof)),
        expected_cnf=unsat_cnf,
    )
    journal = DurableAttemptJournal(tmp_path / "attempts.jsonl", manifest=wave)
    repository = Path(__file__).resolve().parents[3]
    runner = PiqdCegarDriver(
        client=client,
        journal=journal,
        policy=DriverPolicy(poll_interval_s=0),
        proof_replayer=LeanLratReplayer(
            lean_root=repository / "lean",
            work_dir=tmp_path / "replay-work",
            timeout_s=60,
        ),
        sleep=lambda _: None,
    )
    result = runner.run(
        wave_manifest=wave, cnf=unsat_cnf, producer_manifest=PRODUCER
    )

    assert result.outcome == CERTIFIED_UNSAT
    artifacts = journal.records[-1]["artifacts"]
    assert artifacts["solver_log_sha256"] == sha256_bytes(log)
    assert artifacts["proof_sha256"] == sha256_bytes(proof)
    assert artifacts["proof_checker_sha256"] is not None
    assert artifacts["proof_replay_sha256"] is not None
    receipt = json.loads(
        (journal.artifact_dir / artifacts["proof_replay_sha256"]).read_bytes()
    )
    assert receipt["verified"] is True
    assert receipt["job"]["cnf_blob_hash"] == sha256_bytes(unsat_cnf)


def test_missing_proof_preserves_discovery_only_unsat(tmp_path: Path) -> None:
    log = b"s UNSATISFIABLE\n"
    replayer = FakeReplayer(
        LratReplayResult(True, b"must not run", b"must not run")
    )
    client = FakeClient(
        statuses=[{"id": "job-1", "status": "completed", "result": "UNSAT"}],
        solver_log=(log, sha256_bytes(log)),
        proof=PiqdProofUnavailable("no stored proof"),
    )
    runner, journal = driver(tmp_path, client, proof_replayer=replayer)
    result = runner.run(
        wave_manifest=wave_manifest(), cnf=CNF, producer_manifest=PRODUCER
    )

    assert result.outcome == DISCOVERY_UNSAT
    assert replayer.calls == 0
    assert journal.records[-1]["artifacts"]["proof_sha256"] is None


def test_rejected_replay_fails_closed_with_receipt(tmp_path: Path) -> None:
    log = b"s UNSATISFIABLE\n"
    proof = b"malformed proof\n"
    checker = lean_checker_source(
        kept_cnf=canonical_kept_dimacs(CNF), proof=proof
    )
    replay, receipt = replay_fixture(verified=False, checker=checker, proof=proof)
    client = FakeClient(
        statuses=[{"id": "job-1", "status": "completed", "result": "UNSAT"}],
        solver_log=(log, sha256_bytes(log)),
        proof=(proof, sha256_bytes(proof)),
    )
    runner, journal = driver(
        tmp_path,
        client,
        proof_replayer=FakeReplayer(replay),
    )
    result = runner.run(
        wave_manifest=wave_manifest(), cnf=CNF, producer_manifest=PRODUCER
    )

    assert result.outcome == ERROR
    artifacts = journal.records[-1]["artifacts"]
    assert artifacts["proof_checker_sha256"] == sha256_bytes(checker)
    assert artifacts["proof_replay_sha256"] == sha256_bytes(receipt)


def test_forged_verified_replay_receipt_cannot_certify(tmp_path: Path) -> None:
    log = b"s UNSATISFIABLE\n"
    proof = b"3 0 1 2 0\n"
    forged = canonical_json_bytes({"schema": "forged", "verified": True})
    client = FakeClient(
        statuses=[{"id": "job-1", "status": "completed", "result": "UNSAT"}],
        solver_log=(log, sha256_bytes(log)),
        proof=(proof, sha256_bytes(proof)),
    )
    runner, journal = driver(
        tmp_path,
        client,
        proof_replayer=FakeReplayer(
            LratReplayResult(True, b"forged checker", forged)
        ),
    )

    result = runner.run(
        wave_manifest=wave_manifest(), cnf=CNF, producer_manifest=PRODUCER
    )

    assert result.outcome == ERROR
    assert journal.records[-1]["detail"].startswith("PROOF_REPLAY: invalid replay receipt")
    assert journal.records[-1]["artifacts"]["proof_checker_sha256"] is None
    assert journal.records[-1]["artifacts"]["proof_replay_sha256"] is None


def test_internally_consistent_fake_replayer_cannot_certify(tmp_path: Path) -> None:
    log = b"s UNSATISFIABLE\n"
    proof = b"3 0 1 2 0\n"
    checker = lean_checker_source(
        kept_cnf=canonical_kept_dimacs(CNF), proof=proof
    )
    replay, _ = replay_fixture(verified=True, checker=checker, proof=proof)
    client = FakeClient(
        statuses=[{"id": "job-1", "status": "completed", "result": "UNSAT"}],
        solver_log=(log, sha256_bytes(log)),
        proof=(proof, sha256_bytes(proof)),
    )
    runner, journal = driver(
        tmp_path, client, proof_replayer=FakeReplayer(replay)
    )

    result = runner.run(
        wave_manifest=wave_manifest(), cnf=CNF, producer_manifest=PRODUCER
    )

    assert result.outcome == ERROR
    assert "only the concrete Lean LRAT replayer" in journal.records[-1]["detail"]


def test_replay_setup_error_cannot_be_certified(tmp_path: Path) -> None:
    log = b"s UNSATISFIABLE\n"
    proof = b"3 0 1 2 0\n"
    client = FakeClient(
        statuses=[{"id": "job-1", "status": "completed", "result": "UNSAT"}],
        solver_log=(log, sha256_bytes(log)),
        proof=(proof, sha256_bytes(proof)),
    )
    runner, journal = driver(
        tmp_path,
        client,
        proof_replayer=FakeReplayer(LratReplayError("Lean unavailable")),
    )
    result = runner.run(
        wave_manifest=wave_manifest(), cnf=CNF, producer_manifest=PRODUCER
    )

    assert result.outcome == ERROR
    assert journal.records[-1]["artifacts"]["proof_sha256"] == sha256_bytes(proof)


def json_load(path: Path) -> dict[str, Any]:
    value = json.loads(path.read_bytes())
    assert isinstance(value, dict)
    return value


def test_cached_seal_revalidates_current_journal_and_seal_bytes(tmp_path: Path) -> None:
    client = FakeClient()
    runner, journal = driver(tmp_path, client)
    runner.run(wave_manifest=wave_manifest(), cnf=CNF, producer_manifest=PRODUCER)

    original_journal = journal.path.read_bytes()
    journal.path.write_bytes(original_journal + b"\n")
    with pytest.raises(PiqdDriverError, match="journal changed before sealing"):
        journal.seal()

    journal.path.write_bytes(original_journal)
    seal = json_load(journal.seal_path)
    seal["seal_sha256"] = digest("f")
    journal.seal_path.write_bytes(canonical_json_bytes(seal) + b"\n")
    with pytest.raises(PiqdDriverError, match="journal seal hash mismatch"):
        journal.seal()


@pytest.mark.parametrize("invalid_count", [True, 1.0])
def test_seal_record_count_is_type_strict(
    tmp_path: Path, invalid_count: bool | float
) -> None:
    client = FakeClient()
    runner, journal = driver(tmp_path, client)
    runner.run(wave_manifest=wave_manifest(), cnf=CNF, producer_manifest=PRODUCER)
    seal = json_load(journal.seal_path)
    unsigned = {key: value for key, value in seal.items() if key != "seal_sha256"}
    unsigned["record_count"] = invalid_count
    seal = {**unsigned, "seal_sha256": sha256_bytes(canonical_json_bytes(unsigned))}
    journal.seal_path.write_bytes(canonical_json_bytes(seal) + b"\n")

    with pytest.raises(PiqdDriverError, match="record_count must be"):
        journal.seal()


def test_append_and_seal_are_serialized_across_journal_instances(
    tmp_path: Path,
) -> None:
    entered_append = threading.Event()
    release_append = threading.Event()
    append_errors: list[BaseException] = []
    seal_errors: list[PiqdDriverError] = []

    class PausingJournal(DurableAttemptJournal):
        def _append_serialized(
            self, record: Mapping[str, Any], serialized: bytes
        ) -> None:
            entered_append.set()
            assert release_append.wait(timeout=2)
            super()._append_serialized(record, serialized)

    path = tmp_path / "attempts.jsonl"
    writer = PausingJournal(path, manifest=wave_manifest())
    stale_sealer = DurableAttemptJournal(path, manifest=wave_manifest())

    def append() -> None:
        try:
            writer.append_event(
                event={
                    "schema": "p97-cegar-piqd-event/v1",
                    "phase": "TEST",
                    "disposition": "SUCCESS",
                    "retry_index": None,
                    "poll_index": None,
                    "job_id": None,
                    "status": None,
                    "result": None,
                    "detail": "serialization probe",
                    "response": None,
                },
                outcome=ERROR,
                detail="probe",
            )
        except (AssertionError, OSError, PiqdDriverError) as exc:
            append_errors.append(exc)

    def seal() -> None:
        try:
            stale_sealer.seal()
        except PiqdDriverError as exc:
            seal_errors.append(exc)

    append_thread = threading.Thread(target=append)
    seal_thread = threading.Thread(target=seal)
    append_thread.start()
    assert entered_append.wait(timeout=2)
    seal_thread.start()
    seal_thread.join(timeout=0.1)
    assert seal_thread.is_alive()
    release_append.set()
    append_thread.join(timeout=2)
    seal_thread.join(timeout=2)

    assert not append_errors
    assert len(seal_errors) == 1
    assert "journal changed before sealing" in str(seal_errors[0])
    assert not stale_sealer.seal_path.exists()


def test_seal_is_deterministic_and_reopen_rejects_truncation(tmp_path: Path) -> None:
    seals: list[str] = []
    for name in ("first", "second"):
        client = FakeClient()
        runner, journal = driver(tmp_path / name, client)
        runner.run(wave_manifest=wave_manifest(), cnf=CNF, producer_manifest=PRODUCER)
        seals.append(json_load(journal.seal_path)["seal_sha256"])
    assert seals[0] == seals[1]

    path = tmp_path / "first" / "attempts.jsonl"
    path.write_bytes(path.read_bytes()[:-1])
    with pytest.raises(PiqdDriverError, match="ends inside"):
        DurableAttemptJournal(path, manifest=wave_manifest())


def test_existing_seal_rejects_valid_prefix_truncation(tmp_path: Path) -> None:
    client = FakeClient()
    _, journal = driver(tmp_path, client)
    PiqdCegarDriver(
        client=client,
        journal=journal,
        policy=DriverPolicy(poll_interval_s=0),
        sleep=lambda _: None,
    ).run(wave_manifest=wave_manifest(), cnf=CNF, producer_manifest=PRODUCER)
    lines = journal.path.read_bytes().splitlines(keepends=True)
    assert len(lines) > 1
    journal.path.write_bytes(b"".join(lines[:-1]))
    with pytest.raises(PiqdDriverError, match="journal seal record_count mismatch"):
        DurableAttemptJournal(journal.path, manifest=wave_manifest())


def test_reopen_rehashes_referenced_artifacts(tmp_path: Path) -> None:
    body = canonical_json_bytes(
        {
            "job_id": "job-1",
            "result": "SAT",
            "assignment": [1, 2],
            "num_assigned": 2,
        }
    )
    client = FakeClient(
        statuses=[{"id": "job-1", "status": "completed", "result": "SAT"}],
        model=CheckedModel((1, 2), sha256_bytes(body), body),
    )
    runner, journal = driver(tmp_path, client)
    runner.run(wave_manifest=wave_manifest(), cnf=CNF, producer_manifest=PRODUCER)
    model_path = journal.artifact_dir / sha256_bytes(body)
    model_path.write_bytes(b"corrupt")
    with pytest.raises(PiqdDriverError, match="artifact hash mismatch"):
        journal.seal()
    with pytest.raises(PiqdDriverError, match="artifact hash mismatch"):
        DurableAttemptJournal(journal.path, manifest=wave_manifest())


def test_reopen_rejects_missing_manifest_input_artifact(tmp_path: Path) -> None:
    client = FakeClient()
    runner, journal = driver(tmp_path, client)
    runner.run(wave_manifest=wave_manifest(), cnf=CNF, producer_manifest=PRODUCER)
    (journal.artifact_dir / sha256_bytes(PRODUCER)).unlink()
    with pytest.raises(PiqdDriverError, match="manifest producer artifact is missing"):
        DurableAttemptJournal(journal.path, manifest=wave_manifest())


def test_policy_rejects_unbounded_or_negative_controls() -> None:
    with pytest.raises(PiqdDriverError, match="max_polls"):
        DriverPolicy(max_polls=0)
    with pytest.raises(PiqdDriverError, match="poll_interval_s"):
        DriverPolicy(poll_interval_s=-0.1)
    with pytest.raises(PiqdDriverError, match="poll_interval_s"):
        DriverPolicy(poll_interval_s=float("nan"))


def test_journal_rejects_driver_owned_artifact_override(tmp_path: Path) -> None:
    journal = DurableAttemptJournal(
        tmp_path / "attempts.jsonl", manifest=wave_manifest()
    )
    with pytest.raises(PiqdDriverError, match="driver-owned"):
        journal.append_event(
            event={
                "schema": "p97-cegar-piqd-event/v1",
                "phase": "TEST",
                "disposition": "SUCCESS",
                "retry_index": None,
                "poll_index": None,
                "job_id": None,
                "status": None,
                "result": None,
                "detail": "invalid override probe",
                "response": None,
            },
            outcome=ERROR,
            detail="probe",
            artifact_overrides={"checkpoint_sha256": digest("f")},
        )


def test_cli_exit_status_does_not_promote_discovery_unsat() -> None:
    assert _result_exit_code(STRUCTURAL_SAT) == 0
    assert _result_exit_code(DISCOVERY_UNSAT) == 3
    assert _result_exit_code(CERTIFIED_UNSAT) == 4
    assert _result_exit_code(ERROR) == 2
