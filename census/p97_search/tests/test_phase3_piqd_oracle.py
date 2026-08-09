from __future__ import annotations

import json
from collections.abc import Mapping

import pytest

from census.p97_search import phase3_piqd_oracle
from census.p97_search.phase3_cegar_wave import canonical_json_bytes, sha256_bytes
from census.p97_search.phase3_piqd_oracle import (
    HttpResponse,
    MultipartBody,
    PiqdOracleError,
    PiqdProofUnavailable,
    PiqdRawDimacsClient,
    PreparedJob,
    raw_dimacs_identity,
    scan_dimacs,
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


def test_scan_dimacs_accepts_multiline_clauses_and_returns_dimensions() -> None:
    cnf = b"c multiline fixture\np cnf 3 2\n1\n-2 0\n3 0\n"
    assert scan_dimacs(cnf) == (3, 2)
    assert scan_dimacs(cnf, assignment=[1, 2, 3]) == (3, 2)


@pytest.mark.parametrize(
    ("cnf", "message"),
    [
        (b"", "header is missing"),
        (b"p cnf 2\n", "malformed DIMACS header"),
        (b"p cnf two 1\n1 0\n", "header counts must be integers"),
        (b"p cnf 1 0\np cnf 1 0\n", "multiple headers"),
        (b"1 0\np cnf 1 1\n", "literal appears before its header"),
        (b"p cnf 1 1\nnope 0\n", "invalid DIMACS token"),
        (b"p cnf 1 1\n2 0\n", "outside 1..=1"),
        (b"p cnf 1 1\n1\n", "missing its zero terminator"),
        (b"p cnf 1 2\n1 0\n", "declares 2 clauses but contains 1"),
        (b"p cnf 1 0\n\xff\n", "must be ASCII"),
    ],
)
def test_scan_dimacs_rejects_malformed_input(cnf: bytes, message: str) -> None:
    with pytest.raises(PiqdOracleError, match=message):
        scan_dimacs(cnf)


@pytest.mark.parametrize(
    ("assignment", "message"),
    [
        ([1, -2], "does not satisfy"),
        ([1, 1], "more than once"),
        ([1], "assigns 1 variables"),
        ([1, 3], "outside 1..=2"),
        ([True, 2], "nonzero signed integers"),
        ([1, 2.0], "nonzero signed integers"),
        ([1, 0], "nonzero signed integers"),
    ],
)
def test_scan_dimacs_rejects_invalid_assignment(
    assignment: list[object], message: str
) -> None:
    with pytest.raises(PiqdOracleError, match=message):
        scan_dimacs(CNF, assignment=assignment)  # type: ignore[arg-type]


@pytest.mark.parametrize(
    "body",
    [
        b'{"answer": 1, "answer": 2}',
        b'{"answer": NaN}',
        b"[1, 2, 3]",
        (b"[" * 1100) + (b"]" * 1100),
    ],
)
def test_json_response_boundary_is_strict_and_fail_closed(body: bytes) -> None:
    client = PiqdRawDimacsClient("http://piqd.test", transport=ScriptedTransport([]))
    with pytest.raises(PiqdOracleError, match="invalid JSON|must be an object"):
        client._json(HttpResponse(200, body, {}), expected_status=200)


def test_prepare_submits_exact_bytes_and_checks_piqd_identity(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    monkeypatch.setattr(
        phase3_piqd_oracle,
        "parse_dimacs",
        lambda _cnf: pytest.fail("prepare_cnf materialized DIMACS clauses"),
    )
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
    assert "Content-Length" not in headers


def test_segmented_multipart_is_byte_equivalent_and_exact_length() -> None:
    parts = (
        ("cnf", "wave.cnf", "application/octet-stream", CNF),
        ("meta", "meta.json", "application/json", b'{"backend":"cadical"}'),
    )
    legacy = PiqdRawDimacsClient._multipart("fixed-boundary", parts)
    segmented = PiqdRawDimacsClient._multipart_segments("fixed-boundary", parts)

    assert b"".join(bytes(segment) for segment in segmented.segments) == legacy
    assert segmented.content_length == len(legacy)
    assert any(
        isinstance(segment, memoryview) and segment.obj is CNF
        for segment in segmented.segments
    )


def test_prepare_default_path_keeps_large_cnf_as_a_segment(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    large_cnf = b"p cnf 1 0\n" + (b"c" * 2_000_000) + b"\n"
    wave = wave_manifest()
    wave["encoding"] = dict(wave["encoding"])
    wave["encoding"].update(
        {
            "cnf_sha256": sha256_bytes(large_cnf),
            "num_variables": 1,
            "num_clauses": 0,
        }
    )
    identity = raw_dimacs_identity(
        backend="cadical",
        solver_profile="unsat",
        cnf_sha256=sha256_bytes(large_cnf),
        producer_manifest_sha256=sha256_bytes(PRODUCER),
    )
    calls: list[tuple[str, str, object, Mapping[str, str]]] = []

    def capture(
        method: str,
        url: str,
        body: bytes | MultipartBody | None,
        headers: Mapping[str, str],
    ) -> HttpResponse:
        calls.append((method, url, body, headers))
        return json_response(
            200,
            {
                "job_id": "job-large",
                "cnf_blob_hash": sha256_bytes(large_cnf),
                "identity_hash": identity,
                "num_vars": 1,
                "num_clauses": 0,
                "existing": False,
            },
        )

    monkeypatch.setattr(phase3_piqd_oracle, "_stdlib_transport", capture)
    monkeypatch.setattr(
        PiqdRawDimacsClient,
        "_multipart",
        staticmethod(lambda *_args: pytest.fail("large multipart body was joined")),
    )

    PiqdRawDimacsClient("http://piqd.test").prepare_cnf(
        wave_manifest=wave, cnf=large_cnf, producer_manifest=PRODUCER
    )

    assert len(calls) == 1
    _, _, body, headers = calls[0]
    assert isinstance(body, MultipartBody)
    assert headers["Content-Length"] == str(body.content_length)
    assert any(
        isinstance(segment, memoryview) and segment.obj is large_cnf
        for segment in body.segments
    )


class _RecordingSocket:
    def __init__(self, *, short_write: bool = False) -> None:
        self.body = bytearray()
        self.short_write = short_write
        self.send_count = 0

    def send(self, view: memoryview) -> int:
        self.send_count += 1
        if self.short_write and self.send_count > 1:
            return 0
        amount = min(len(view), 1) if self.short_write else len(view)
        self.body.extend(view[:amount])
        return amount


class _RecordingConnection:
    instance: _RecordingConnection | None = None

    def __init__(self, *_args: object, **_kwargs: object) -> None:
        self.sock = _RecordingSocket()
        self.requests: list[object] = []
        self.headers: list[tuple[str, str]] = []
        self.closed = False
        type(self).instance = self

    def putrequest(self, *args: object, **kwargs: object) -> None:
        self.requests.append((args, kwargs))

    def putheader(self, name: str, value: str) -> None:
        self.headers.append((name, value))

    def endheaders(self) -> None:
        return None

    def getresponse(self) -> object:
        return type(
            "Response",
            (),
            {"status": 200, "read": lambda self: b"ok", "getheaders": lambda self: []},
        )()

    def close(self) -> None:
        self.closed = True


def test_stdlib_transport_writes_exact_segmented_body(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    body = PiqdRawDimacsClient._multipart_segments(
        "wire", (("cnf", "wave.cnf", "application/octet-stream", CNF),)
    )
    monkeypatch.setattr(
        phase3_piqd_oracle.http.client, "HTTPConnection", _RecordingConnection
    )

    response = phase3_piqd_oracle._stdlib_transport(
        "POST",
        "http://piqd.test/jobs/prepare-cnf",
        body,
        {"Content-Length": str(body.content_length)},
    )

    connection = _RecordingConnection.instance
    assert connection is not None
    assert response == HttpResponse(200, b"ok", {})
    assert bytes(connection.sock.body) == b"".join(
        bytes(segment) for segment in body.segments
    )
    assert ("Content-Length", str(body.content_length)) in connection.headers
    assert connection.closed


def test_stdlib_transport_rejects_short_write(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    body = MultipartBody((memoryview(b"payload"),), len(b"payload"))

    class ShortConnection(_RecordingConnection):
        def __init__(self, *_args: object, **_kwargs: object) -> None:
            super().__init__(*_args, **_kwargs)
            self.sock = _RecordingSocket(short_write=True)

    monkeypatch.setattr(
        phase3_piqd_oracle.http.client, "HTTPConnection", ShortConnection
    )
    with pytest.raises(OSError, match="short write"):
        phase3_piqd_oracle._stdlib_transport(
            "POST",
            "http://piqd.test/jobs/prepare-cnf",
            body,
            {"Content-Length": str(body.content_length)},
        )
    assert ShortConnection.instance is not None
    assert ShortConnection.instance.closed


def test_stdlib_transport_rejects_nonexact_content_length(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    body = MultipartBody((memoryview(b"payload"),), len(b"payload"))
    monkeypatch.setattr(
        phase3_piqd_oracle.http.client, "HTTPConnection", _RecordingConnection
    )
    with pytest.raises(OSError, match="Content-Length is not exact"):
        phase3_piqd_oracle._stdlib_transport(
            "POST",
            "http://piqd.test/jobs/prepare-cnf",
            body,
            {"Content-Length": str(body.content_length - 1)},
        )


def test_raw_identity_preserves_legacy_preimage_and_separates_core_limit() -> None:
    common = {
        "backend": "cadical",
        "solver_profile": "unsat",
        "cnf_sha256": digest("a"),
        "producer_manifest_sha256": digest("b"),
    }
    legacy = raw_dimacs_identity(**common)
    explicit_legacy = sha256_bytes(
        b"raw-dimacs/v1\ncadical\nunsat\n"
        + digest("a").encode()
        + b"\n"
        + digest("b").encode()
    )
    assert legacy == explicit_legacy
    assert raw_dimacs_identity(**common, requested_core_limit=1) == sha256_bytes(
        b"raw-dimacs/v1\ncadical\nunsat\n"
        + digest("a").encode()
        + b"\n"
        + digest("b").encode()
        + b"\ncores=1"
    )


def test_raw_identity_matches_pinned_daemon_vectors() -> None:
    assert (
        raw_dimacs_identity(
            backend="cadical",
            solver_profile="p0",
            cnf_sha256="aa",
            producer_manifest_sha256="bb",
        )
        == "beb23914319f64b38bf41b84274f48f7fbb1a2620647d284f1d943d637892071"
    )
    assert (
        raw_dimacs_identity(
            backend="cadical",
            solver_profile="p0",
            cnf_sha256="aa",
            producer_manifest_sha256="bb",
            requested_core_limit=1,
        )
        == "2edfb161d3d35ffd5eb387dcbc809eb09299a865ccb56751e2749aa96c8db87a"
    )


@pytest.mark.parametrize("value", [True, 0, -1, 1.0, 1025])
def test_requested_core_limit_requires_positive_builtin_int(value: object) -> None:
    with pytest.raises(ValueError, match="positive builtin int"):
        raw_dimacs_identity(
            backend="cadical",
            solver_profile="unsat",
            cnf_sha256=digest("a"),
            producer_manifest_sha256=digest("b"),
            requested_core_limit=value,  # type: ignore[arg-type]
        )


def test_prepare_submits_and_attests_requested_core_limit() -> None:
    wave = wave_manifest()
    identity = raw_dimacs_identity(
        backend="cadical",
        solver_profile="unsat",
        cnf_sha256=sha256_bytes(CNF),
        producer_manifest_sha256=sha256_bytes(PRODUCER),
        requested_core_limit=1,
    )
    transport = ScriptedTransport(
        [
            json_response(
                200,
                {
                    "job_id": "job-core",
                    "cnf_blob_hash": sha256_bytes(CNF),
                    "identity_hash": identity,
                    "num_vars": 2,
                    "num_clauses": 2,
                    "existing": False,
                    "requested_core_limit": 1,
                },
            )
        ]
    )
    prepared = PiqdRawDimacsClient("http://piqd.test", transport=transport).prepare_cnf(
        wave_manifest=wave,
        cnf=CNF,
        producer_manifest=PRODUCER,
        requested_core_limit=1,
    )
    assert prepared.requested_core_limit == 1
    body = transport.calls[0][2]
    assert body is not None and b'"requested_core_limit":1' in body


def test_prepare_rejects_unattested_requested_core_limit() -> None:
    identity = raw_dimacs_identity(
        backend="cadical",
        solver_profile="unsat",
        cnf_sha256=sha256_bytes(CNF),
        producer_manifest_sha256=sha256_bytes(PRODUCER),
        requested_core_limit=1,
    )
    transport = ScriptedTransport(
        [
            json_response(
                200,
                {
                    "job_id": "job-core",
                    "cnf_blob_hash": sha256_bytes(CNF),
                    "identity_hash": identity,
                    "num_vars": 2,
                    "num_clauses": 2,
                    "existing": False,
                },
            )
        ]
    )
    with pytest.raises(PiqdOracleError, match="wrong requested_core_limit"):
        PiqdRawDimacsClient("http://piqd.test", transport=transport).prepare_cnf(
            wave_manifest=wave_manifest(),
            cnf=CNF,
            producer_manifest=PRODUCER,
            requested_core_limit=1,
        )


@pytest.mark.parametrize("echo", [True, 1.0])
def test_prepare_rejects_non_builtin_core_echo(echo: object) -> None:
    identity = raw_dimacs_identity(
        backend="cadical",
        solver_profile="unsat",
        cnf_sha256=sha256_bytes(CNF),
        producer_manifest_sha256=sha256_bytes(PRODUCER),
        requested_core_limit=1,
    )
    payload: dict[str, object] = {
        "job_id": "job-core",
        "cnf_blob_hash": sha256_bytes(CNF),
        "identity_hash": identity,
        "num_vars": 2,
        "num_clauses": 2,
        "existing": False,
        "requested_core_limit": echo,
    }
    transport = ScriptedTransport([json_response(200, payload)])
    with pytest.raises(PiqdOracleError, match="wrong requested_core_limit"):
        PiqdRawDimacsClient("http://piqd.test", transport=transport).prepare_cnf(
            wave_manifest=wave_manifest(),
            cnf=CNF,
            producer_manifest=PRODUCER,
            requested_core_limit=1,
        )


@pytest.mark.parametrize("echo", [None, 1, False])
def test_prepare_rejects_any_unbounded_core_echo(echo: object) -> None:
    identity = raw_dimacs_identity(
        backend="cadical",
        solver_profile="unsat",
        cnf_sha256=sha256_bytes(CNF),
        producer_manifest_sha256=sha256_bytes(PRODUCER),
    )
    payload: dict[str, object] = {
        "job_id": "job-core",
        "cnf_blob_hash": sha256_bytes(CNF),
        "identity_hash": identity,
        "num_vars": 2,
        "num_clauses": 2,
        "existing": False,
        "requested_core_limit": echo,
    }
    transport = ScriptedTransport([json_response(200, payload)])
    with pytest.raises(PiqdOracleError, match="unexpectedly echoes"):
        PiqdRawDimacsClient("http://piqd.test", transport=transport).prepare_cnf(
            wave_manifest=wave_manifest(),
            cnf=CNF,
            producer_manifest=PRODUCER,
        )


def test_prepare_rejects_core_above_daemon_range_before_scan(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    monkeypatch.setattr(
        phase3_piqd_oracle,
        "scan_dimacs",
        lambda _cnf: pytest.fail("requested core limit must preflight before scan"),
    )
    transport = ScriptedTransport([])
    with pytest.raises(PiqdOracleError, match="range 1..1024"):
        PiqdRawDimacsClient("http://piqd.test", transport=transport).prepare_cnf(
            wave_manifest=wave_manifest(),
            cnf=CNF,
            producer_manifest=PRODUCER,
            requested_core_limit=1025,
        )
    assert transport.calls == []


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


def test_model_is_independently_checked_against_dimacs(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    monkeypatch.setattr(
        phase3_piqd_oracle,
        "parse_dimacs",
        lambda _cnf: pytest.fail("checked_model materialized DIMACS clauses"),
    )
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


def test_partial_200_model_is_rejected_before_clause_replay(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    # Both clauses are satisfied by literal 1, so clause replay alone must not
    # be treated as a completeness check for a 2-variable DIMACS model.
    partial_cnf = b"p cnf 2 2\n1 0\n1 0\n"
    job = PreparedJob(
        job_id="job-1",
        backend="cadical",
        solver_profile="unsat",
        cnf_blob_hash=sha256_bytes(partial_cnf),
        identity_hash=digest("a"),
        num_vars=2,
        num_clauses=2,
        existing=False,
    )
    monkeypatch.setattr(
        phase3_piqd_oracle,
        "scan_dimacs",
        lambda *_args, **_kwargs: pytest.fail("incomplete model reached clause replay"),
    )
    body = json.dumps(
        {"job_id": "job-1", "result": "SAT", "num_assigned": 1, "assignment": [1]}
    ).encode()
    client = PiqdRawDimacsClient(
        "http://piqd.test", transport=ScriptedTransport([HttpResponse(200, body, {})])
    )
    with pytest.raises(PiqdOracleError, match="model response is incomplete"):
        client.checked_model(job, cnf=partial_cnf)


@pytest.mark.parametrize(
    ("num_assigned", "assignment", "message"),
    [
        (2, [1, 1], "more than once"),
        (1, [1], "model response is incomplete"),
        (True, [1, 2], "inconsistent assignment metadata"),
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
