"""Thin, fail-closed client for piqd's raw-DIMACS static-oracle lane."""

from __future__ import annotations

import json
import urllib.error
import urllib.parse
import urllib.request
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
_HEX_DIGITS = frozenset("0123456789abcdef")


class PiqdOracleError(RuntimeError):
    """Raised when piqd or its response violates the adapter contract."""


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


@dataclass(frozen=True)
class CheckedModel:
    assignment: tuple[int, ...]
    response_sha256: str


Transport = Callable[[str, str, bytes | None, Mapping[str, str]], HttpResponse]

_PIQD_PROFILES = {
    "cadical": frozenset({"sat", "unsat", "plain", "default"}),
    "kissat": frozenset({"default"}),
    "march_cu": frozenset({"default"}),
}


def _reject_json_constant(value: str) -> None:
    raise ValueError(f"nonstandard JSON constant: {value}")


def raw_dimacs_identity(
    *, backend: str, solver_profile: str, cnf_sha256: str, producer_manifest_sha256: str
) -> str:
    payload = (
        f"{RAW_DIMACS_VERSION}\n{backend}\n{solver_profile}\n"
        f"{cnf_sha256}\n{producer_manifest_sha256}"
    ).encode()
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


def validate_dimacs_assignment(
    *, num_vars: int, clauses: Sequence[Sequence[int]], assignment: Sequence[int]
) -> None:
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

    for index, clause in enumerate(clauses):
        if not any(values.get(abs(literal)) == (literal > 0) for literal in clause):
            raise PiqdOracleError(f"model does not satisfy DIMACS clause {index}")


def _stdlib_transport(
    method: str, url: str, body: bytes | None, headers: Mapping[str, str]
) -> HttpResponse:
    request = urllib.request.Request(
        url, data=body, headers=dict(headers), method=method
    )
    try:
        with urllib.request.urlopen(
            request, timeout=DEFAULT_HTTP_TIMEOUT_SECONDS
        ) as response:
            return HttpResponse(
                response.status, response.read(), dict(response.headers.items())
            )
    except urllib.error.HTTPError as exc:
        return HttpResponse(exc.code, exc.read(), dict(exc.headers.items()))


class PiqdRawDimacsClient:
    """One-shot piqd operations; the P97 outer loop owns polling and retries."""

    def __init__(self, base_url: str, *, transport: Transport | None = None) -> None:
        self.base_url = base_url.rstrip("/")
        self._transport = transport or _stdlib_transport

    def _request(
        self,
        method: str,
        path: str,
        *,
        body: bytes | None = None,
        headers: Mapping[str, str] | None = None,
    ) -> HttpResponse:
        try:
            return self._transport(
                method, f"{self.base_url}{path}", body, headers or {}
            )
        except OSError as exc:
            raise PiqdOracleError(f"piqd transport failed: {exc}") from exc

    @staticmethod
    def _json(response: HttpResponse, *, expected_status: int) -> Mapping[str, Any]:
        if response.status != expected_status:
            snippet = response.body[:400].decode("utf-8", errors="replace")
            raise PiqdOracleError(f"piqd returned HTTP {response.status}: {snippet}")
        try:
            value = json.loads(response.body)
        except (UnicodeDecodeError, json.JSONDecodeError) as exc:
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
        num_vars, clauses = parse_dimacs(cnf)
        if (num_vars, len(clauses)) != (
            encoding["num_variables"],
            encoding["num_clauses"],
        ):
            raise PiqdOracleError("DIMACS dimensions do not match the wave manifest")

        meta = canonical_json_bytes(
            {
                "backend": backend,
                "solver_profile": solver_profile,
                "timeout_s": timeout_s,
                "march_timeout_s": march_timeout_s,
                "project": project,
            }
        )
        boundary = f"p97-cegar-{uuid.uuid4().hex}"
        body = self._multipart(
            boundary,
            (
                ("cnf", "wave.cnf", "application/octet-stream", cnf),
                ("meta", "meta.json", "application/json", meta),
                ("manifest", "producer.json", "application/json", producer_manifest),
            ),
        )
        response = self._request(
            "POST",
            "/jobs/prepare-cnf",
            body=body,
            headers={"Content-Type": f"multipart/form-data; boundary={boundary}"},
        )
        payload = self._json(response, expected_status=200)
        expected_identity = raw_dimacs_identity(
            backend=backend,
            solver_profile=solver_profile,
            cnf_sha256=cnf_hash,
            producer_manifest_sha256=producer_hash,
        )
        expected = {
            "cnf_blob_hash": cnf_hash,
            "identity_hash": expected_identity,
            "num_vars": num_vars,
            "num_clauses": len(clauses),
        }
        for field, value in expected.items():
            if payload.get(field) != value:
                raise PiqdOracleError(f"piqd prepare response has wrong {field}")
        job_id = payload.get("job_id")
        existing = payload.get("existing")
        if not isinstance(job_id, str) or not job_id:
            raise PiqdOracleError("piqd prepare response has invalid job_id")
        if not isinstance(existing, bool):
            raise PiqdOracleError("piqd prepare response has invalid existing flag")
        return PreparedJob(
            job_id,
            backend,
            solver_profile,
            cnf_hash,
            expected_identity,
            num_vars,
            len(clauses),
            existing,
        )

    def confirm(self, job: PreparedJob, *, expected_cnf: bytes) -> str:
        self.verify_stored_cnf(job, expected_cnf)
        response = self._request(
            "POST", f"/jobs/confirm?{urllib.parse.urlencode({'job_id': job.job_id})}"
        )
        if response.status == 200:
            payload = self._json(response, expected_status=200)
            if (
                payload.get("job_id") != job.job_id
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
            f"piqd confirm failed with HTTP {response.status}: {snippet}"
        )

    def status(self, job_id: str) -> Mapping[str, Any]:
        payload = self._json(
            self._request("GET", f"/jobs/{job_id}"), expected_status=200
        )
        if payload.get("id") != job_id:
            raise PiqdOracleError("piqd status response has the wrong job id")
        return payload

    def verify_stored_cnf(self, job: PreparedJob, expected_cnf: bytes) -> str:
        if sha256_bytes(expected_cnf) != job.cnf_blob_hash:
            raise PiqdOracleError("expected CNF bytes do not match the prepared job")
        response = self._request("GET", f"/jobs/{job.job_id}/cnf")
        if response.status != 200:
            raise PiqdOracleError(f"piqd CNF retrieval returned HTTP {response.status}")
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
        if payload.get("job_id") != job.job_id or payload.get("result") != "SAT":
            raise PiqdOracleError(
                "piqd model response does not identify a SAT result for this job"
            )
        assignment = payload.get("assignment")
        num_assigned = payload.get("num_assigned")
        if (
            not isinstance(assignment, list)
            or isinstance(num_assigned, bool)
            or not isinstance(num_assigned, int)
            or num_assigned != len(assignment)
        ):
            raise PiqdOracleError(
                "piqd model response has inconsistent assignment metadata"
            )
        num_vars, clauses = parse_dimacs(cnf)
        validate_dimacs_assignment(
            num_vars=num_vars, clauses=clauses, assignment=assignment
        )
        return CheckedModel(tuple(assignment), sha256_bytes(response.body))

    def proof(self, job: PreparedJob) -> tuple[bytes, str]:
        if job.backend != "cadical":
            raise PiqdOracleError(
                "only CaDiCaL exposes one compact proof; march_cu proof manifests "
                "require per-cube retrieval and checking"
            )
        response = self._request("GET", f"/jobs/{job.job_id}/proof")
        if response.status != 200:
            raise PiqdOracleError(
                f"piqd proof retrieval returned HTTP {response.status}"
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
