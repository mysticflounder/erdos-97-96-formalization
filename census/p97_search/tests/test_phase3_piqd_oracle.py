from __future__ import annotations

import json
from collections.abc import Mapping

import pytest

from census.p97_search.phase3_cegar_wave import canonical_json_bytes, sha256_bytes
from census.p97_search.phase3_piqd_oracle import (
    HttpResponse,
    PiqdOracleError,
    PiqdProofUnavailable,
    PiqdRawDimacsClient,
    PreparedJob,
    raw_dimacs_identity,
)

CNF = b"p cnf 2 2\n1 0\n-1 2 0\n"
PRODUCER = canonical_json_bytes({"encoder": "p97-test", "source": "fixture"})


def digest(char: str) -> str:
    return char * 64


def wave_manifest() -> dict:
    return {
        "schema": "p97-cegar-wave/v1",
        "wave_id": "piqd-adapter-test",
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


class ScriptedTransport:
    def __init__(self, responses: list[HttpResponse]) -> None:
        self.responses = responses
        self.calls: list[tuple[str, str, bytes | None, Mapping[str, str]]] = []

    def __call__(
        self, method: str, url: str, body: bytes | None, headers: Mapping[str, str]
    ) -> HttpResponse:
        self.calls.append((method, url, body, headers))
        assert self.responses, "unexpected HTTP request"
        return self.responses.pop(0)


def failing_transport(
    method: str, url: str, body: bytes | None, headers: Mapping[str, str]
) -> HttpResponse:
    del method, url, body, headers
    raise TimeoutError("fixture timeout")


def json_response(status: int, value: object) -> HttpResponse:
    return HttpResponse(
        status, json.dumps(value).encode(), {"content-type": "application/json"}
    )


def prepared_job(*, backend: str = "cadical") -> PreparedJob:
    profile = "unsat" if backend == "cadical" else "default"
    return PreparedJob(
        job_id="job-1",
        backend=backend,
        solver_profile=profile,
        cnf_blob_hash=sha256_bytes(CNF),
        identity_hash=digest("a"),
        num_vars=2,
        num_clauses=2,
        existing=False,
    )


def test_prepare_submits_exact_bytes_and_checks_piqd_identity() -> None:
    wave = wave_manifest()
    identity = raw_dimacs_identity(
        backend="cadical",
        solver_profile="unsat",
        cnf_sha256=sha256_bytes(CNF),
        producer_manifest_sha256=sha256_bytes(PRODUCER),
    )
    transport = ScriptedTransport(
        [
            json_response(
                200,
                {
                    "job_id": "job-1",
                    "cnf_blob_hash": sha256_bytes(CNF),
                    "identity_hash": identity,
                    "num_vars": 2,
                    "num_clauses": 2,
                    "preview": CNF.decode(),
                    "existing": False,
                },
            )
        ]
    )
    client = PiqdRawDimacsClient("http://piqd.test", transport=transport)

    prepared = client.prepare_cnf(
        wave_manifest=wave, cnf=CNF, producer_manifest=PRODUCER
    )

    assert prepared.job_id == "job-1"
    assert prepared.identity_hash == identity
    assert prepared.solver_profile == "unsat"
    method, url, body, headers = transport.calls[0]
    assert (method, url) == ("POST", "http://piqd.test/jobs/prepare-cnf")
    assert body is not None and CNF in body and PRODUCER in body
    assert headers["Content-Type"].startswith("multipart/form-data; boundary=")


def test_prepare_rejects_wrong_local_bytes_before_http() -> None:
    transport = ScriptedTransport([])
    client = PiqdRawDimacsClient("http://piqd.test", transport=transport)
    with pytest.raises(PiqdOracleError, match="CNF bytes do not match"):
        client.prepare_cnf(
            wave_manifest=wave_manifest(),
            cnf=CNF + b"c changed\n",
            producer_manifest=PRODUCER,
        )
    assert transport.calls == []


def test_transport_timeout_is_classified_for_outer_journaling() -> None:
    client = PiqdRawDimacsClient("http://piqd.test", transport=failing_transport)
    with pytest.raises(PiqdOracleError, match="piqd transport failed: fixture timeout"):
        client.prepare_cnf(
            wave_manifest=wave_manifest(), cnf=CNF, producer_manifest=PRODUCER
        )


def test_prepare_rejects_wrong_server_identity() -> None:
    wave = wave_manifest()
    transport = ScriptedTransport(
        [
            json_response(
                200,
                {
                    "job_id": "job-1",
                    "cnf_blob_hash": sha256_bytes(CNF),
                    "identity_hash": digest("f"),
                    "num_vars": 2,
                    "num_clauses": 2,
                    "existing": False,
                },
            )
        ]
    )
    client = PiqdRawDimacsClient("http://piqd.test", transport=transport)
    with pytest.raises(PiqdOracleError, match="wrong identity_hash"):
        client.prepare_cnf(wave_manifest=wave, cnf=CNF, producer_manifest=PRODUCER)


def test_prepare_rejects_profile_that_piqd_would_silently_ignore() -> None:
    wave = wave_manifest()
    wave["execution"]["solver_profile"] = "proof"
    client = PiqdRawDimacsClient("http://piqd.test", transport=ScriptedTransport([]))
    with pytest.raises(PiqdOracleError, match="does not implement solver profile"):
        client.prepare_cnf(wave_manifest=wave, cnf=CNF, producer_manifest=PRODUCER)


def test_http_500_is_explicitly_retryable_for_the_outer_driver() -> None:
    transport = ScriptedTransport([json_response(500, {"error": "insert raced"})])
    client = PiqdRawDimacsClient("http://piqd.test", transport=transport)
    with pytest.raises(PiqdOracleError) as exc_info:
        client.prepare_cnf(
            wave_manifest=wave_manifest(), cnf=CNF, producer_manifest=PRODUCER
        )
    assert exc_info.value.retryable is True
    assert exc_info.value.http_status == 500


@pytest.mark.parametrize(
    "producer",
    [b'{"source": "fixture", "encoder": "p97-test"}', b'{"value":NaN}'],
)
def test_prepare_requires_strict_canonical_producer_bytes(producer: bytes) -> None:
    wave = wave_manifest()
    wave["encoding"]["producer_manifest_sha256"] = sha256_bytes(producer)
    client = PiqdRawDimacsClient("http://piqd.test", transport=ScriptedTransport([]))
    with pytest.raises(PiqdOracleError, match="strict JSON|canonical JSON"):
        client.prepare_cnf(wave_manifest=wave, cnf=CNF, producer_manifest=producer)


def test_confirm_409_rereads_status_instead_of_assuming_failure() -> None:
    transport = ScriptedTransport(
        [
            HttpResponse(200, CNF, {}),
            json_response(409, {"error": "already confirmed"}),
            json_response(200, {"id": "job-1", "status": "running", "result": None}),
        ]
    )
    client = PiqdRawDimacsClient("http://piqd.test", transport=transport)
    assert client.confirm(prepared_job(), expected_cnf=CNF) == "running"
    assert [call[0] for call in transport.calls] == ["GET", "POST", "GET"]


def test_confirm_500_is_retryable_after_exact_cnf_check() -> None:
    transport = ScriptedTransport(
        [HttpResponse(200, CNF, {}), json_response(500, {"error": "temporary"})]
    )
    client = PiqdRawDimacsClient("http://piqd.test", transport=transport)
    with pytest.raises(PiqdOracleError) as exc_info:
        client.confirm(prepared_job(), expected_cnf=CNF)
    assert exc_info.value.retryable is True
    assert exc_info.value.http_status == 500


def test_stored_cnf_500_is_retryable() -> None:
    client = PiqdRawDimacsClient(
        "http://piqd.test",
        transport=ScriptedTransport([json_response(500, {"error": "temporary"})]),
    )
    with pytest.raises(PiqdOracleError) as exc_info:
        client.verify_stored_cnf(prepared_job(), CNF)
    assert exc_info.value.retryable is True
    assert exc_info.value.http_status == 500


def test_stored_cnf_must_match_exact_submitted_bytes() -> None:
    transport = ScriptedTransport([HttpResponse(200, CNF + b"c changed\n", {})])
    client = PiqdRawDimacsClient("http://piqd.test", transport=transport)
    with pytest.raises(PiqdOracleError, match="exact submitted CNF"):
        client.verify_stored_cnf(prepared_job(), CNF)


def test_log_retrieval_paginates_and_hashes_exact_bytes() -> None:
    transport = ScriptedTransport(
        [
            HttpResponse(200, b"ab", {"X-Log-Size-Bytes": "3"}),
            HttpResponse(200, b"c", {"x-log-size-bytes": "3"}),
        ]
    )
    client = PiqdRawDimacsClient("http://piqd.test", transport=transport)
    body, digest_value = client.log(prepared_job())
    assert body == b"abc"
    assert digest_value == sha256_bytes(body)
    assert "from=0" in transport.calls[0][1]
    assert "from=2" in transport.calls[1][1]


def test_log_retrieval_rejects_nonprogressing_page() -> None:
    transport = ScriptedTransport([HttpResponse(200, b"", {"X-Log-Size-Bytes": "1"})])
    client = PiqdRawDimacsClient("http://piqd.test", transport=transport)
    with pytest.raises(PiqdOracleError, match="made no progress"):
        client.log(prepared_job())


def test_confirm_refuses_to_post_when_stored_cnf_differs() -> None:
    transport = ScriptedTransport([HttpResponse(200, CNF + b"c changed\n", {})])
    client = PiqdRawDimacsClient("http://piqd.test", transport=transport)
    with pytest.raises(PiqdOracleError, match="exact submitted CNF"):
        client.confirm(prepared_job(), expected_cnf=CNF)
    assert [call[0] for call in transport.calls] == ["GET"]


def test_model_is_independently_checked_against_dimacs() -> None:
    body = json.dumps(
        {"job_id": "job-1", "result": "SAT", "num_assigned": 2, "assignment": [1, 2]}
    ).encode()
    client = PiqdRawDimacsClient(
        "http://piqd.test", transport=ScriptedTransport([HttpResponse(200, body, {})])
    )
    checked = client.checked_model(prepared_job(), cnf=CNF)
    assert checked.assignment == (1, 2)
    assert checked.response_sha256 == sha256_bytes(body)


def test_false_model_is_rejected() -> None:
    body = json.dumps(
        {"job_id": "job-1", "result": "SAT", "num_assigned": 2, "assignment": [1, -2]}
    ).encode()
    client = PiqdRawDimacsClient(
        "http://piqd.test", transport=ScriptedTransport([HttpResponse(200, body, {})])
    )
    with pytest.raises(PiqdOracleError, match="does not satisfy"):
        client.checked_model(prepared_job(), cnf=CNF)


@pytest.mark.parametrize(
    ("num_assigned", "assignment", "message"),
    [
        (2, [1, 1], "more than once"),
        (1, [1], "assigns 1 variables"),
        (2.0, [1, 2], "inconsistent assignment metadata"),
    ],
)
def test_incomplete_duplicate_or_weakly_typed_models_are_rejected(
    num_assigned: object, assignment: list[int], message: str
) -> None:
    body = json.dumps(
        {
            "job_id": "job-1",
            "result": "SAT",
            "num_assigned": num_assigned,
            "assignment": assignment,
        }
    ).encode()
    client = PiqdRawDimacsClient(
        "http://piqd.test", transport=ScriptedTransport([HttpResponse(200, body, {})])
    )
    with pytest.raises(PiqdOracleError, match=message):
        client.checked_model(prepared_job(), cnf=CNF)


def test_proof_bytes_must_match_piqd_proof_header() -> None:
    proof = b"compact lrat bytes\n"
    response = HttpResponse(200, proof, {"X-Proof-Blob-Hash": sha256_bytes(proof)})
    client = PiqdRawDimacsClient(
        "http://piqd.test", transport=ScriptedTransport([response])
    )
    assert client.proof(prepared_job()) == (proof, sha256_bytes(proof))


def test_proof_hash_mismatch_is_rejected() -> None:
    response = HttpResponse(200, b"proof", {"X-Proof-Blob-Hash": digest("a")})
    client = PiqdRawDimacsClient(
        "http://piqd.test", transport=ScriptedTransport([response])
    )
    with pytest.raises(PiqdOracleError, match="X-Proof-Blob-Hash"):
        client.proof(prepared_job())


def test_missing_proof_has_explicit_discovery_only_classification() -> None:
    client = PiqdRawDimacsClient(
        "http://piqd.test", transport=ScriptedTransport([HttpResponse(404, b"", {})])
    )
    with pytest.raises(PiqdProofUnavailable, match="no stored proof"):
        client.proof(prepared_job())


def test_transient_proof_http_failure_is_retryable() -> None:
    client = PiqdRawDimacsClient(
        "http://piqd.test", transport=ScriptedTransport([HttpResponse(503, b"", {})])
    )
    with pytest.raises(PiqdOracleError) as caught:
        client.proof(prepared_job())
    assert caught.value.retryable is True


def test_march_proof_manifest_requires_per_cube_checker() -> None:
    transport = ScriptedTransport([])
    client = PiqdRawDimacsClient("http://piqd.test", transport=transport)
    with pytest.raises(PiqdOracleError, match="per-cube retrieval and checking"):
        client.proof(prepared_job(backend="march_cu"))
    assert transport.calls == []
