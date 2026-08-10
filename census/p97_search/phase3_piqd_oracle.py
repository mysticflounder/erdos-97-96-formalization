"""Thin, fail-closed client for piqd's raw-DIMACS static-oracle lane."""

from __future__ import annotations

import http.client
import io
import json
import urllib.parse
import uuid
from collections.abc import Callable, Mapping, Sequence
from dataclasses import dataclass
from typing import Any

from census.p97_search.phase3_cegar_wave import (
    canonical_json_bytes,
    sha256_bytes,
    validate_wave_manifest,
)

RAW_DIMACS_VERSION = "raw-dimacs/v1"
DEFAULT_HTTP_TIMEOUT_SECONDS = 60.0
MIN_REQUESTED_CORE_LIMIT = 1
MAX_REQUESTED_CORE_LIMIT = 1024
_HEX_DIGITS = frozenset("0123456789abcdef")


class PiqdOracleError(RuntimeError):
    """Raised when piqd or its response violates the adapter contract."""

    def __init__(
        self,
        message: str,
        *,
        retryable: bool = False,
        http_status: int | None = None,
    ) -> None:
        super().__init__(message)
        self.retryable = retryable
        self.http_status = http_status


class PiqdProofUnavailable(PiqdOracleError):
    """A terminal UNSAT job has no proof artifact to replay."""


@dataclass(frozen=True)
class HttpResponse:
    status: int
    body: bytes
    headers: Mapping[str, str]


@dataclass(frozen=True)
class PreparedJob:
    job_id: str
    backend: str
    solver_profile: str
    cnf_blob_hash: str
    identity_hash: str
    num_vars: int
    num_clauses: int
    existing: bool
    requested_core_limit: int | None = None


@dataclass(frozen=True)
class CheckedModel:
    assignment: tuple[int, ...]
    response_sha256: str
    response_body: bytes


MultipartSegment = bytes | memoryview


@dataclass(frozen=True)
class MultipartBody:
    """Exact-length multipart segments without concatenating payload bytes."""

    segments: tuple[MultipartSegment, ...]
    content_length: int

    def __post_init__(self) -> None:
        actual = sum(len(segment) for segment in self.segments)
        if actual != self.content_length:
            raise ValueError(
                "multipart content length does not match its segmented body"
            )


Transport = Callable[[str, str, bytes | None, Mapping[str, str]], HttpResponse]

_PIQD_PROFILES = {
    "cadical": frozenset({"sat", "unsat", "plain", "default"}),
    "kissat": frozenset({"default"}),
    "march_cu": frozenset({"default"}),
}


def _reject_json_constant(value: str) -> None:
    raise ValueError(f"nonstandard JSON constant: {value}")


def _reject_duplicate_json_keys(
    pairs: list[tuple[str, Any]],
) -> dict[str, Any]:
    value: dict[str, Any] = {}
    for key, item in pairs:
        if key in value:
            raise ValueError(f"duplicate JSON object key: {key}")
        value[key] = item
    return value


def raw_dimacs_identity(
    *,
    backend: str,
    solver_profile: str,
    cnf_sha256: str,
    producer_manifest_sha256: str,
    requested_core_limit: int | None = None,
) -> str:
    if requested_core_limit is not None and (
        type(requested_core_limit) is not int
        or not MIN_REQUESTED_CORE_LIMIT
        <= requested_core_limit
        <= MAX_REQUESTED_CORE_LIMIT
    ):
        raise ValueError(
            "requested_core_limit must be a positive builtin int in range 1..1024"
        )
    payload = (
        f"{RAW_DIMACS_VERSION}\n{backend}\n{solver_profile}\n"
        f"{cnf_sha256}\n{producer_manifest_sha256}"
    ).encode()
    if requested_core_limit is not None:
        payload += f"\ncores={requested_core_limit}".encode()
    return sha256_bytes(payload)


def parse_dimacs(cnf: bytes) -> tuple[int, tuple[tuple[int, ...], ...]]:
    """Parse enough DIMACS to independently check piqd counts and SAT models."""

    try:
        text = cnf.decode("ascii")
    except UnicodeDecodeError as exc:
        raise PiqdOracleError("DIMACS must be ASCII") from exc

    header: tuple[int, int] | None = None
    tokens: list[str] = []
    for line_number, line in enumerate(text.splitlines(), start=1):
        stripped = line.strip()
        if not stripped or stripped.startswith("c"):
            continue
        if stripped.startswith("p"):
            if header is not None:
                raise PiqdOracleError("DIMACS has multiple headers")
            parts = stripped.split()
            if len(parts) != 4 or parts[:2] != ["p", "cnf"]:
                raise PiqdOracleError(f"malformed DIMACS header on line {line_number}")
            try:
                num_vars, declared_clauses = int(parts[2]), int(parts[3])
            except ValueError as exc:
                raise PiqdOracleError("DIMACS header counts must be integers") from exc
            if num_vars < 0 or declared_clauses < 0:
                raise PiqdOracleError("DIMACS header counts must be non-negative")
            header = (num_vars, declared_clauses)
            continue
        if header is None:
            raise PiqdOracleError("DIMACS literal appears before its header")
        tokens.extend(stripped.split())

    if header is None:
        raise PiqdOracleError("DIMACS header is missing")
    num_vars, declared_clauses = header
    clauses: list[tuple[int, ...]] = []
    clause: list[int] = []
    for token in tokens:
        try:
            literal = int(token)
        except ValueError as exc:
            raise PiqdOracleError(f"invalid DIMACS token: {token!r}") from exc
        if literal == 0:
            clauses.append(tuple(clause))
            clause = []
        else:
            if abs(literal) > num_vars:
                raise PiqdOracleError(f"literal {literal} is outside 1..={num_vars}")
            clause.append(literal)
    if clause:
        raise PiqdOracleError("final DIMACS clause is missing its zero terminator")
    if len(clauses) != declared_clauses:
        raise PiqdOracleError(
            f"DIMACS declares {declared_clauses} clauses but contains {len(clauses)}"
        )
    return num_vars, tuple(clauses)


def scan_dimacs(cnf: bytes, assignment: Sequence[int] | None = None) -> tuple[int, int]:
    """Validate DIMACS while retaining no more than the current clause."""

    header: tuple[int, int] | None = None
    values: dict[int, bool] | None = None
    clause: list[int] = []
    clause_count = 0

    for line_number, raw_line in enumerate(io.BytesIO(cnf), start=1):
        try:
            stripped = raw_line.decode("ascii").strip()
        except UnicodeDecodeError as exc:
            raise PiqdOracleError("DIMACS must be ASCII") from exc
        if not stripped or stripped.startswith("c"):
            continue
        if stripped.startswith("p"):
            if header is not None:
                raise PiqdOracleError("DIMACS has multiple headers")
            parts = stripped.split()
            if len(parts) != 4 or parts[:2] != ["p", "cnf"]:
                raise PiqdOracleError(f"malformed DIMACS header on line {line_number}")
            try:
                num_vars, declared_clauses = int(parts[2]), int(parts[3])
            except ValueError as exc:
                raise PiqdOracleError("DIMACS header counts must be integers") from exc
            if num_vars < 0 or declared_clauses < 0:
                raise PiqdOracleError("DIMACS header counts must be non-negative")
            header = (num_vars, declared_clauses)
            if assignment is not None:
                values = _assignment_values(num_vars=num_vars, assignment=assignment)
            continue
        if header is None:
            raise PiqdOracleError("DIMACS literal appears before its header")

        num_vars, _ = header
        for token in stripped.split():
            try:
                literal = int(token)
            except ValueError as exc:
                raise PiqdOracleError(f"invalid DIMACS token: {token!r}") from exc
            if literal == 0:
                if values is not None and not any(
                    values.get(abs(item)) == (item > 0) for item in clause
                ):
                    raise PiqdOracleError(
                        f"model does not satisfy DIMACS clause {clause_count}"
                    )
                clause_count += 1
                clause.clear()
            else:
                if abs(literal) > num_vars:
                    raise PiqdOracleError(
                        f"literal {literal} is outside 1..={num_vars}"
                    )
                clause.append(literal)

    if header is None:
        raise PiqdOracleError("DIMACS header is missing")
    if clause:
        raise PiqdOracleError("final DIMACS clause is missing its zero terminator")
    num_vars, declared_clauses = header
    if clause_count != declared_clauses:
        raise PiqdOracleError(
            f"DIMACS declares {declared_clauses} clauses but contains {clause_count}"
        )
    return num_vars, clause_count


def _assignment_values(*, num_vars: int, assignment: Sequence[int]) -> dict[int, bool]:
    values: dict[int, bool] = {}
    for literal in assignment:
        if isinstance(literal, bool) or not isinstance(literal, int) or literal == 0:
            raise PiqdOracleError(
                "model assignment must contain nonzero signed integers"
            )
        variable = abs(literal)
        if variable > num_vars:
            raise PiqdOracleError(f"model literal {literal} is outside 1..={num_vars}")
        value = literal > 0
        if variable in values:
            raise PiqdOracleError(f"model assigns variable {variable} more than once")
        values[variable] = value

    if len(values) != num_vars:
        raise PiqdOracleError(
            f"model assigns {len(values)} variables but the DIMACS declares {num_vars}"
        )
    return values


def validate_dimacs_assignment(
    *, num_vars: int, clauses: Sequence[Sequence[int]], assignment: Sequence[int]
) -> None:
    values = _assignment_values(num_vars=num_vars, assignment=assignment)

    for index, clause in enumerate(clauses):
        if not any(values.get(abs(literal)) == (literal > 0) for literal in clause):
            raise PiqdOracleError(f"model does not satisfy DIMACS clause {index}")


def _send_segmented_body(
    connection: http.client.HTTPConnection, body: MultipartBody
) -> None:
    if connection.sock is None:
        raise OSError("HTTP connection has no socket for multipart body")
    sent_total = 0
    for segment in body.segments:
        view = memoryview(segment)
        while view:
            sent = connection.sock.send(view)
            if not isinstance(sent, int) or sent <= 0:
                raise OSError("short write while sending multipart body")
            sent_total += sent
            view = view[sent:]
    if sent_total != body.content_length:
        raise OSError("multipart body write length mismatch")


def _stdlib_transport(
    method: str,
    url: str,
    body: bytes | MultipartBody | None,
    headers: Mapping[str, str],
    *,
    timeout_seconds: float = DEFAULT_HTTP_TIMEOUT_SECONDS,
) -> HttpResponse:
    parsed = urllib.parse.urlsplit(url)
    if parsed.scheme not in {"http", "https"} or not parsed.hostname:
        raise OSError(f"unsupported piqd URL: {url}")
    try:
        port = parsed.port
    except ValueError as exc:
        raise OSError(f"invalid piqd URL port: {url}") from exc
    connection_type = (
        http.client.HTTPSConnection
        if parsed.scheme == "https"
        else http.client.HTTPConnection
    )
    connection = connection_type(
        parsed.hostname, port=port, timeout=timeout_seconds
    )
    try:
        target = parsed.path or "/"
        if parsed.query:
            target = f"{target}?{parsed.query}"
        if isinstance(body, MultipartBody):
            content_lengths = [
                value
                for name, value in headers.items()
                if name.lower() == "content-length"
            ]
            if len(content_lengths) != 1 or str(content_lengths[0]) != str(
                body.content_length
            ):
                raise OSError("multipart Content-Length is not exact")
            connection.putrequest(method, target, skip_accept_encoding=True)
            for name, value in headers.items():
                connection.putheader(name, value)
            connection.endheaders()
            _send_segmented_body(connection, body)
        else:
            connection.request(method, target, body=body, headers=dict(headers))
        response = connection.getresponse()
        return HttpResponse(
            response.status, response.read(), dict(response.getheaders())
        )
    except http.client.HTTPException as exc:
        raise OSError(f"piqd HTTP transport failed: {exc}") from exc
    finally:
        connection.close()


class PiqdRawDimacsClient:
    """One-shot piqd operations; the P97 outer loop owns polling and retries."""

    def __init__(self, base_url: str, *, transport: Transport | None = None) -> None:
        self.base_url = base_url.rstrip("/")
        self._transport = transport or _stdlib_transport
        self._segmented_transport = transport is None or transport is _stdlib_transport

    def _request(
        self,
        method: str,
        path: str,
        *,
        body: bytes | MultipartBody | None = None,
        headers: Mapping[str, str] | None = None,
    ) -> HttpResponse:
        try:
            return self._transport(
                method, f"{self.base_url}{path}", body, headers or {}
            )
        except OSError as exc:
            raise PiqdOracleError(
                f"piqd transport failed: {exc}", retryable=True
            ) from exc

    @staticmethod
    def _json(response: HttpResponse, *, expected_status: int) -> Mapping[str, Any]:
        if response.status != expected_status:
            snippet = response.body[:400].decode("utf-8", errors="replace")
            raise PiqdOracleError(
                f"piqd returned HTTP {response.status}: {snippet}",
                retryable=response.status in {408, 429} or response.status >= 500,
                http_status=response.status,
            )
        try:
            value = json.loads(
                response.body,
                object_pairs_hook=_reject_duplicate_json_keys,
                parse_constant=_reject_json_constant,
            )
        except (UnicodeDecodeError, ValueError, RecursionError) as exc:
            raise PiqdOracleError("piqd returned invalid JSON") from exc
        if not isinstance(value, Mapping):
            raise PiqdOracleError("piqd JSON response must be an object")
        return value

    def prepare_cnf(
        self,
        *,
        wave_manifest: Mapping[str, Any],
        cnf: bytes,
        producer_manifest: bytes,
        timeout_s: int = 900,
        march_timeout_s: int = 900,
        project: str = "erdos-97-96-formalization",
        requested_core_limit: int | None = None,
    ) -> PreparedJob:
        validate_wave_manifest(wave_manifest)
        encoding = wave_manifest["encoding"]
        execution = wave_manifest["execution"]
        backend = execution["backend"]
        solver_profile = execution["solver_profile"]
        allowed_profiles = _PIQD_PROFILES.get(backend)
        if allowed_profiles is None:
            raise PiqdOracleError(
                f"piqd raw-DIMACS does not support backend {backend!r}"
            )
        if solver_profile not in allowed_profiles:
            raise PiqdOracleError(
                f"piqd backend {backend!r} does not implement solver profile "
                f"{solver_profile!r}; expected one of {sorted(allowed_profiles)}"
            )
        for name, value in (
            ("timeout_s", timeout_s),
            ("march_timeout_s", march_timeout_s),
        ):
            if isinstance(value, bool) or not isinstance(value, int) or value < 0:
                raise PiqdOracleError(f"{name} must be a non-negative integer")
        if requested_core_limit is not None and (
            type(requested_core_limit) is not int
            or not MIN_REQUESTED_CORE_LIMIT
            <= requested_core_limit
            <= MAX_REQUESTED_CORE_LIMIT
        ):
            raise PiqdOracleError(
                "requested_core_limit must be a positive builtin int in range 1..1024"
            )
        cnf_hash = sha256_bytes(cnf)
        producer_hash = sha256_bytes(producer_manifest)
        if cnf_hash != encoding["cnf_sha256"]:
            raise PiqdOracleError("CNF bytes do not match manifest.encoding.cnf_sha256")
        if producer_hash != encoding["producer_manifest_sha256"]:
            raise PiqdOracleError(
                "producer bytes do not match manifest.encoding.producer_manifest_sha256"
            )
        try:
            producer_value = json.loads(
                producer_manifest, parse_constant=_reject_json_constant
            )
        except (UnicodeDecodeError, json.JSONDecodeError, ValueError) as exc:
            raise PiqdOracleError(
                "producer manifest must be strict JSON bytes"
            ) from exc
        if not isinstance(producer_value, Mapping):
            raise PiqdOracleError("producer manifest must be a JSON object")
        if producer_manifest != canonical_json_bytes(producer_value):
            raise PiqdOracleError("producer manifest bytes are not canonical JSON")
        num_vars, num_clauses = scan_dimacs(cnf)
        if (num_vars, num_clauses) != (
            encoding["num_variables"],
            encoding["num_clauses"],
        ):
            raise PiqdOracleError("DIMACS dimensions do not match the wave manifest")

        meta_value: dict[str, Any] = {
            "backend": backend,
            "solver_profile": solver_profile,
            "timeout_s": timeout_s,
            "march_timeout_s": march_timeout_s,
            "project": project,
        }
        if requested_core_limit is not None:
            meta_value["requested_core_limit"] = requested_core_limit
        meta = canonical_json_bytes(meta_value)
        boundary = f"p97-cegar-{uuid.uuid4().hex}"
        parts = (
            ("cnf", "wave.cnf", "application/octet-stream", cnf),
            ("meta", "meta.json", "application/json", meta),
            ("manifest", "producer.json", "application/json", producer_manifest),
        )
        if self._segmented_transport:
            body: bytes | MultipartBody = self._multipart_segments(boundary, parts)
        else:
            body = self._multipart(boundary, parts)
        request_headers = {"Content-Type": f"multipart/form-data; boundary={boundary}"}
        if isinstance(body, MultipartBody):
            request_headers["Content-Length"] = str(body.content_length)
        response = self._request(
            "POST",
            "/jobs/prepare-cnf",
            body=body,
            headers=request_headers,
        )
        payload = self._json(response, expected_status=200)
        expected_identity = raw_dimacs_identity(
            backend=backend,
            solver_profile=solver_profile,
            cnf_sha256=cnf_hash,
            producer_manifest_sha256=producer_hash,
            requested_core_limit=requested_core_limit,
        )
        expected = {
            "cnf_blob_hash": cnf_hash,
            "identity_hash": expected_identity,
            "num_vars": num_vars,
            "num_clauses": num_clauses,
        }
        for field, value in expected.items():
            observed = payload.get(field)
            if (
                field not in payload
                or type(observed) is not type(value)
                or observed != value
            ):
                raise PiqdOracleError(f"piqd prepare response has wrong {field}")
        if requested_core_limit is None:
            if "requested_core_limit" in payload:
                raise PiqdOracleError(
                    "piqd prepare response unexpectedly echoes requested_core_limit"
                )
        else:
            observed_core_limit = payload.get("requested_core_limit")
            if (
                "requested_core_limit" not in payload
                or type(observed_core_limit) is not int
                or observed_core_limit != requested_core_limit
            ):
                raise PiqdOracleError(
                    "piqd prepare response has wrong requested_core_limit"
                )
        job_id = payload.get("job_id")
        existing = payload.get("existing")
        if type(job_id) is not str or not job_id:
            raise PiqdOracleError("piqd prepare response has invalid job_id")
        if type(existing) is not bool:
            raise PiqdOracleError("piqd prepare response has invalid existing flag")
        return PreparedJob(
            job_id,
            backend,
            solver_profile,
            cnf_hash,
            expected_identity,
            num_vars,
            num_clauses,
            existing,
            requested_core_limit,
        )

    def confirm(self, job: PreparedJob, *, expected_cnf: bytes) -> str:
        self.verify_stored_cnf(job, expected_cnf)
        response = self._request(
            "POST", f"/jobs/confirm?{urllib.parse.urlencode({'job_id': job.job_id})}"
        )
        if response.status == 200:
            payload = self._json(response, expected_status=200)
            if (
                type(payload.get("job_id")) is not str
                or payload.get("job_id") != job.job_id
                or type(payload.get("status")) is not str
                or payload.get("status") != "confirmed"
            ):
                raise PiqdOracleError(
                    "piqd confirm response does not match the requested job"
                )
            return "confirmed"
        if response.status == 409:
            status = self.status(job.job_id)
            state = status.get("status")
            if state in {"confirmed", "running", "completed", "failed"}:
                return str(state)
        snippet = response.body[:400].decode("utf-8", errors="replace")
        raise PiqdOracleError(
            f"piqd confirm failed with HTTP {response.status}: {snippet}",
            retryable=response.status in {408, 429} or response.status >= 500,
            http_status=response.status,
        )

    def status(self, job_id: str) -> Mapping[str, Any]:
        payload = self._json(
            self._request("GET", f"/jobs/{job_id}"), expected_status=200
        )
        if type(payload.get("id")) is not str or payload.get("id") != job_id:
            raise PiqdOracleError("piqd status response has the wrong job id")
        return payload

    def verify_stored_cnf(self, job: PreparedJob, expected_cnf: bytes) -> str:
        if sha256_bytes(expected_cnf) != job.cnf_blob_hash:
            raise PiqdOracleError("expected CNF bytes do not match the prepared job")
        response = self._request("GET", f"/jobs/{job.job_id}/cnf")
        if response.status != 200:
            raise PiqdOracleError(
                f"piqd CNF retrieval returned HTTP {response.status}",
                retryable=response.status in {408, 429} or response.status >= 500,
                http_status=response.status,
            )
        if response.body != expected_cnf:
            raise PiqdOracleError("piqd did not return the exact submitted CNF bytes")
        return sha256_bytes(response.body)

    def checked_model(self, job: PreparedJob, *, cnf: bytes) -> CheckedModel:
        if job.backend not in {"cadical", "kissat"}:
            raise PiqdOracleError(
                f"piqd backend {job.backend!r} has no single DIMACS model"
            )
        if sha256_bytes(cnf) != job.cnf_blob_hash:
            raise PiqdOracleError("model CNF bytes do not match the prepared job")
        response = self._request("GET", f"/jobs/{job.job_id}/model")
        payload = self._json(response, expected_status=200)
        if (
            type(payload.get("job_id")) is not str
            or payload.get("job_id") != job.job_id
            or type(payload.get("result")) is not str
            or payload.get("result") != "SAT"
        ):
            raise PiqdOracleError(
                "piqd model response does not identify a SAT result for this job"
            )
        assignment = payload.get("assignment")
        num_assigned = payload.get("num_assigned")
        if (
            type(assignment) is not list
            or type(num_assigned) is not int
            or num_assigned != len(assignment)
        ):
            raise PiqdOracleError(
                "piqd model response has inconsistent assignment metadata"
            )
        if num_assigned != job.num_vars:
            raise PiqdOracleError(
                "piqd model response is incomplete: "
                f"assigned {num_assigned} variables but the prepared job declares "
                f"{job.num_vars}"
            )
        scan_dimacs(cnf, assignment=assignment)
        return CheckedModel(
            tuple(assignment), sha256_bytes(response.body), response.body
        )

    def log(self, job: PreparedJob) -> tuple[bytes, str]:
        """Retrieve a completed job's full paginated solver log."""

        chunks: list[bytes] = []
        offset = 0
        expected_total: int | None = None
        while expected_total is None or offset < expected_total:
            query = urllib.parse.urlencode({"from": offset, "max": 1024 * 1024})
            response = self._request("GET", f"/jobs/{job.job_id}/log?{query}")
            if response.status != 200:
                snippet = response.body[:400].decode("utf-8", errors="replace")
                raise PiqdOracleError(
                    f"piqd log retrieval returned HTTP {response.status}: {snippet}",
                    retryable=response.status in {408, 429} or response.status >= 500,
                    http_status=response.status,
                )
            total_header = next(
                (
                    value
                    for key, value in response.headers.items()
                    if key.lower() == "x-log-size-bytes"
                ),
                None,
            )
            try:
                total = int(total_header) if total_header is not None else -1
            except ValueError as exc:
                raise PiqdOracleError(
                    "piqd log response has invalid X-Log-Size-Bytes"
                ) from exc
            if total < 0:
                raise PiqdOracleError("piqd log response is missing X-Log-Size-Bytes")
            if expected_total is None:
                expected_total = total
            elif total != expected_total:
                raise PiqdOracleError("piqd log size changed during retrieval")
            if offset + len(response.body) > total:
                raise PiqdOracleError("piqd log page exceeds its declared size")
            if offset < total and not response.body:
                raise PiqdOracleError("piqd log pagination made no progress")
            chunks.append(response.body)
            offset += len(response.body)
        body = b"".join(chunks)
        return body, sha256_bytes(body)

    def proof(self, job: PreparedJob) -> tuple[bytes, str]:
        if job.backend != "cadical":
            raise PiqdOracleError(
                "only CaDiCaL exposes one compact proof; march_cu proof manifests "
                "require per-cube retrieval and checking"
            )
        response = self._request("GET", f"/jobs/{job.job_id}/proof")
        if response.status == 404:
            raise PiqdProofUnavailable(
                f"piqd job {job.job_id} has no stored proof artifact"
            )
        if response.status != 200:
            raise PiqdOracleError(
                f"piqd proof retrieval returned HTTP {response.status}",
                retryable=response.status in {408, 429} or response.status >= 500,
            )
        header_hash = next(
            (
                value
                for key, value in response.headers.items()
                if key.lower() == "x-proof-blob-hash"
            ),
            None,
        )
        actual_hash = sha256_bytes(response.body)
        if header_hash != actual_hash:
            raise PiqdOracleError("piqd proof bytes do not match X-Proof-Blob-Hash")
        return response.body, actual_hash

    @staticmethod
    def _multipart(
        boundary: str, parts: Sequence[tuple[str, str, str, bytes]]
    ) -> bytes:
        chunks: list[bytes] = []
        for name, filename, content_type, payload in parts:
            chunks.extend(
                [
                    f"--{boundary}\r\n".encode(),
                    (
                        f'Content-Disposition: form-data; name="{name}"; '
                        f'filename="{filename}"\r\n'
                    ).encode(),
                    f"Content-Type: {content_type}\r\n\r\n".encode(),
                    payload,
                    b"\r\n",
                ]
            )
        chunks.append(f"--{boundary}--\r\n".encode())
        return b"".join(chunks)

    @staticmethod
    def _multipart_segments(
        boundary: str, parts: Sequence[tuple[str, str, str, bytes]]
    ) -> MultipartBody:
        segments: list[MultipartSegment] = []
        for name, filename, content_type, payload in parts:
            segments.extend(
                [
                    f"--{boundary}\r\n".encode(),
                    (
                        f'Content-Disposition: form-data; name="{name}"; '
                        f'filename="{filename}"\r\n'
                    ).encode(),
                    f"Content-Type: {content_type}\r\n\r\n".encode(),
                    memoryview(payload),
                    memoryview(b"\r\n"),
                ]
            )
        segments.append(f"--{boundary}--\r\n".encode())
        return MultipartBody(tuple(segments), sum(map(len, segments)))
