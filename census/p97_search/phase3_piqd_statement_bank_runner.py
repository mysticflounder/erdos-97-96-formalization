"""Run one P97 selector plan through a fresh PIQD SAT session.

The runner owns request ordering and local evidence custody.  Its result remains
observational: neither HTTP responses nor local journal bytes attest PIQD or the
solver, and a session verdict is not a proof artifact.
"""

from __future__ import annotations

import hashlib
import json
import math
import os
import re
import stat
import urllib.error
import urllib.parse
import urllib.request
import uuid
from collections.abc import Mapping
from dataclasses import dataclass
from enum import StrEnum
from pathlib import Path, PurePosixPath
from typing import Any, Protocol

from census.p97_search import phase3_piqd_statement_bank as statement_bank
from census.p97_search import phase3_piqd_statement_bank_receipts as receipt_adapter

RUNNER_SCHEMA = "p97-piqd-statement-bank-runner/v1"
RUNNER_STATUS = "OBSERVATIONAL_ONLY"
DEFAULT_JOURNAL_SIZE_CAP = 256 * 1024 * 1024
DEFAULT_HTTP_REQUEST_TIMEOUT_S = 300.0
DEFAULT_HTTP_RESPONSE_BYTE_CAP = 16 * 1024 * 1024
_HTTP_READ_CHUNK_SIZE = 64 * 1024

_SESSION_KEYS = frozenset(
    {
        "id",
        "lane",
        "state",
        "solver_name",
        "solver_sha256",
        "solver_signature",
        "protocol_version",
        "journal_path",
        "created_at",
        "updated_at",
        "clauses",
        "max_var",
        "solves",
        "last_status",
        "label",
    }
)
_ADD_KEYS = frozenset({"added", "clauses", "max_var"})
_SOLVE_REQUIRED_KEYS = frozenset({"status", "solve_ms", "solve_index", "result_sha256"})
_SOLVE_OPTIONAL_KEYS = frozenset({"interrupted_by", "model", "core", "terminal_unsat"})
_RECEIPT_TOP_KEYS = frozenset(
    {"count", "journal_path", "receipts", "receipts_path", "session_id"}
)
_RECEIPT_REQUIRED_KEYS = frozenset(
    {
        "solve_index",
        "base_clauses",
        "base_bytes",
        "base_sha256",
        "assumptions",
        "status",
        "model_recorded",
        "result_sha256",
        "at",
        "conflict_limit",
    }
)
_RECEIPT_OPTIONAL_KEYS = frozenset({"core", "interrupted_by"})
_LOWER_HEX_64 = re.compile(r"[0-9a-f]{64}\Z")
_I32_MAX = 2**31 - 1


class StatementBankRunnerError(statement_bank.StatementBankError):
    """The HTTP exchange or local evidence snapshot failed closed."""


class RunnerOutcome(StrEnum):
    """The two runner control-flow outcomes."""

    COMPLETE = "COMPLETE"
    BASELINE_NOT_UNSAT = "BASELINE_NOT_UNSAT"


@dataclass(frozen=True)
class JsonHttpResponse:
    """One decoded JSON response from the injected transport."""

    status: int
    body: object


class JsonHttpTransport(Protocol):
    """Minimal dependency-injection seam used by the runner."""

    def request(
        self, method: str, path: str, body: Mapping[str, object] | None = None
    ) -> JsonHttpResponse: ...


@dataclass(frozen=True)
class StatementBankRunResult:
    """A completed runner control flow and its observational audit."""

    outcome: RunnerOutcome
    session_id: str
    baseline_status: statement_bank.SolverVerdict
    baseline_solve_index: int
    statement_solve_indexes: Mapping[str, int]
    adapter_result: receipt_adapter.ReceiptAdapterResult | None
    audit: Mapping[str, Any]


class _NoRedirect(urllib.request.HTTPRedirectHandler):
    def redirect_request(self, req, fp, code, msg, headers, newurl):
        return None


class UrllibJsonTransport:
    """Small standard-library transport; redirects and non-JSON fail closed."""

    def __init__(
        self,
        base_url: str = "http://127.0.0.1:7272",
        *,
        request_timeout_s: float = DEFAULT_HTTP_REQUEST_TIMEOUT_S,
        response_byte_cap: int = DEFAULT_HTTP_RESPONSE_BYTE_CAP,
    ) -> None:
        parsed = urllib.parse.urlsplit(base_url)
        if (
            parsed.scheme not in {"http", "https"}
            or not parsed.netloc
            or parsed.username is not None
            or parsed.password is not None
            or parsed.query
            or parsed.fragment
            or parsed.path not in {"", "/"}
        ):
            raise StatementBankRunnerError("base_url must be a bare HTTP(S) origin")
        self._base_url = base_url.rstrip("/")
        self._request_timeout_s = _positive_finite_float(
            request_timeout_s, where="http_request_timeout_s"
        )
        self._response_byte_cap = _exact_int(
            response_byte_cap,
            where="http_response_byte_cap",
            minimum=1,
            maximum=2**63 - 1,
        )
        self._opener = urllib.request.build_opener(_NoRedirect())

    def request(
        self, method: str, path: str, body: Mapping[str, object] | None = None
    ) -> JsonHttpResponse:
        if method not in {"POST", "GET", "DELETE"} or not path.startswith("/"):
            raise StatementBankRunnerError("invalid internal HTTP request")
        payload = None if body is None else statement_bank.canonical_json_bytes(body)
        headers = {"Accept": "application/json"}
        if payload is not None:
            headers["Content-Type"] = "application/json"
        request = urllib.request.Request(
            f"{self._base_url}{path}", data=payload, headers=headers, method=method
        )
        try:
            response = self._opener.open(request, timeout=self._request_timeout_s)
            try:
                status_code = response.status
                raw = _read_bounded_http_body(response, self._response_byte_cap)
            finally:
                response.close()
        except urllib.error.HTTPError as exc:
            try:
                status_code = exc.code
                raw = _read_bounded_http_body(exc, self._response_byte_cap)
            finally:
                exc.close()
        except (OSError, urllib.error.URLError) as exc:
            raise StatementBankRunnerError(f"PIQD HTTP request failed: {exc}") from exc
        try:
            decoded = json.loads(
                raw.decode("utf-8"),
                parse_constant=lambda value: _raise_json_constant(value),
                object_pairs_hook=_reject_duplicate_keys,
            )
        except (UnicodeDecodeError, json.JSONDecodeError, ValueError) as exc:
            raise StatementBankRunnerError("PIQD returned invalid strict JSON") from exc
        return JsonHttpResponse(status=status_code, body=decoded)


def _raise_json_constant(value: str) -> object:
    raise ValueError(f"non-finite JSON constant: {value}")


def _reject_duplicate_keys(pairs: list[tuple[str, Any]]) -> dict[str, Any]:
    result: dict[str, Any] = {}
    for key, value in pairs:
        if key in result:
            raise ValueError(f"duplicate JSON key: {key}")
        result[key] = value
    return result


def _fail(message: str) -> None:
    raise StatementBankRunnerError(message)


def _exact_int(value: object, *, where: str, minimum: int, maximum: int) -> int:
    if type(value) is not int or not minimum <= value <= maximum:
        _fail(f"{where} must be an integer in {minimum}..{maximum}")
    return value


def _positive_finite_float(value: object, *, where: str) -> float:
    if type(value) not in {int, float}:
        _fail(f"{where} must be a positive finite number")
    try:
        converted = float(value)
    except OverflowError:
        _fail(f"{where} must be a positive finite number")
    if not math.isfinite(converted) or converted <= 0:
        _fail(f"{where} must be a positive finite number")
    return converted


def _read_bounded_http_body(stream: Any, byte_cap: int) -> bytes:
    """Read at most cap plus one byte so oversize responses fail boundedly."""

    chunks: list[bytes] = []
    remaining = byte_cap + 1
    while remaining:
        chunk = stream.read(min(_HTTP_READ_CHUNK_SIZE, remaining))
        if type(chunk) is not bytes:
            _fail("PIQD HTTP response body is not bytes")
        if not chunk:
            break
        chunks.append(chunk)
        remaining -= len(chunk)
        if remaining < 0:
            _fail("PIQD HTTP response exceeded http_response_byte_cap")
    raw = b"".join(chunks)
    if len(raw) > byte_cap:
        _fail("PIQD HTTP response exceeded http_response_byte_cap")
    return raw


def _uuid(value: object, *, where: str) -> str:
    if type(value) is not str:
        _fail(f"{where} must be a canonical UUID")
    try:
        parsed = uuid.UUID(value)
    except ValueError:
        _fail(f"{where} must be a canonical UUID")
    if str(parsed) != value:
        _fail(f"{where} must be a canonical UUID")
    return value


def _sha256(value: object, *, where: str) -> str:
    if type(value) is not str or _LOWER_HEX_64.fullmatch(value) is None:
        _fail(f"{where} must be lowercase 64-hex")
    return value


def _canonical_absolute_path(value: object, *, where: str) -> str:
    if type(value) is not str or not value or "\x00" in value:
        _fail(f"{where} must be a nonempty path string")
    pure = PurePosixPath(value)
    if not pure.is_absolute() or any(part in {".", ".."} for part in pure.parts):
        _fail(f"{where} must be an absolute path without dot components")
    if str(pure) != value or value.startswith("//"):
        _fail(f"{where} must be a canonical absolute path")
    return value


def _open_nofollow_directory(path_string: str, *, where: str) -> int:
    """Open an absolute directory by walking every component without symlinks."""

    path_string = _canonical_absolute_path(path_string, where=where)
    if path_string == "/":
        _fail(f"{where} must be a proper subdirectory of the filesystem root")
    if not hasattr(os, "O_NOFOLLOW") or not hasattr(os, "O_DIRECTORY"):
        _fail("platform lacks required no-follow directory support")
    directory_flags = os.O_RDONLY | os.O_DIRECTORY | getattr(os, "O_CLOEXEC", 0)
    nofollow = os.O_NOFOLLOW
    directory_fd = os.open("/", directory_flags)
    try:
        for component in PurePosixPath(path_string).parts[1:]:
            next_fd = os.open(
                component, directory_flags | nofollow, dir_fd=directory_fd
            )
            os.close(directory_fd)
            directory_fd = next_fd
    except OSError as exc:
        os.close(directory_fd)
        raise StatementBankRunnerError(
            f"secure {where} validation failed: {exc}"
        ) from exc
    return directory_fd


def _validate_data_root(value: object) -> str:
    root = _canonical_absolute_path(value, where="piqd_data_root")
    directory_fd = _open_nofollow_directory(root, where="piqd_data_root")
    os.close(directory_fd)
    return root


def _relative_below_root(path_string: str, root: str, *, where: str) -> PurePosixPath:
    path = PurePosixPath(_canonical_absolute_path(path_string, where=where))
    try:
        relative = path.relative_to(PurePosixPath(root))
    except ValueError:
        _fail(f"{where} is outside the configured piqd_data_root")
    if not relative.parts:
        _fail(f"{where} must name an object below piqd_data_root")
    return relative


def _preflight_piqd_i32(plan: statement_bank.SelectorPlan) -> None:
    """Reject plan values PIQD cannot represent before creating a session."""

    gated_cnf = plan.document["gated_cnf"]
    _exact_int(
        gated_cnf["num_vars"],
        where="PIQD gated_cnf.num_vars",
        minimum=0,
        maximum=_I32_MAX,
    )
    for clause_index, clause in enumerate(gated_cnf["clauses"]):
        for literal_index, literal in enumerate(clause):
            checked = _exact_int(
                literal,
                where=f"PIQD gated clause {clause_index} literal {literal_index}",
                minimum=-_I32_MAX,
                maximum=_I32_MAX,
            )
            if checked == 0:
                _fail("PIQD gated clauses cannot contain literal zero")
    for allocation_index, allocation in enumerate(plan.document["selector_allocation"]):
        _exact_int(
            allocation["selector_var"],
            where=f"PIQD selector allocation {allocation_index}",
            minimum=1,
            maximum=_I32_MAX,
        )
    queries = plan.document["queries"]
    assumption_sets = [
        queries["baseline"]["assumptions"],
        *(query["assumptions"] for query in queries["leave_one_group_out"]),
    ]
    for query_index, assumptions in enumerate(assumption_sets):
        for assumption_index, assumption in enumerate(assumptions):
            checked = _exact_int(
                assumption,
                where=f"PIQD query {query_index} assumption {assumption_index}",
                minimum=-_I32_MAX,
                maximum=_I32_MAX,
            )
            if checked == 0:
                _fail("PIQD assumptions cannot contain literal zero")


def _extract_create_candidate_session_id(value: object) -> str:
    """Extract only a strict UUID for cleanup before full create validation."""

    if type(value) is not dict or "id" not in value:
        _fail("create response has no strict candidate session UUID")
    try:
        return _uuid(value["id"], where="create candidate session id")
    except StatementBankRunnerError as exc:
        raise StatementBankRunnerError(
            "create response has no strict candidate session UUID"
        ) from exc


def _expect_response(
    transport: JsonHttpTransport,
    method: str,
    path: str,
    *,
    expected_status: int,
    body: Mapping[str, object] | None = None,
) -> object:
    response = transport.request(method, path, body)
    if not isinstance(response, JsonHttpResponse):
        _fail("HTTP transport returned the wrong response type")
    if type(response.status) is not int or response.status != expected_status:
        _fail(
            f"{method} {path} returned HTTP {response.status}, expected {expected_status}"
        )
    return response.body


def _validate_session(
    value: object,
    *,
    expected_id: str | None,
    expected_state: str,
    expected_solver: str,
    expected_label: str,
    expected_clauses: int,
    expected_max_var: int,
    expected_solves: int,
    expected_last_status: str | None,
    piqd_data_root: str,
) -> dict[str, Any]:
    if type(value) is not dict or set(value) != _SESSION_KEYS:
        _fail("session response has noncanonical keys")
    session_id = _uuid(value["id"], where="session.id")
    if expected_id is not None and session_id != expected_id:
        _fail("session response changed session id")
    if (
        type(value["lane"]) is not str
        or type(value["state"]) is not str
        or value["lane"] != "sat"
        or value["state"] != expected_state
    ):
        _fail("session response has the wrong lane or state")
    if (
        type(value["solver_name"]) is not str
        or type(value["label"]) is not str
        or value["solver_name"] != expected_solver
        or value["label"] != expected_label
    ):
        _fail("session response changed solver or label")
    _sha256(value["solver_sha256"], where="session.solver_sha256")
    if type(value["solver_signature"]) is not str or not value["solver_signature"]:
        _fail("session.solver_signature must be a nonempty string")
    _exact_int(
        value["protocol_version"],
        where="session.protocol_version",
        minimum=1,
        maximum=2**63 - 1,
    )
    journal_path = _canonical_absolute_path(
        value["journal_path"], where="session.journal_path"
    )
    _relative_below_root(journal_path, piqd_data_root, where="session.journal_path")
    if (
        Path(journal_path).name != "journal.cnf"
        or Path(journal_path).parent.name != session_id
    ):
        _fail("session.journal_path is not the session UUID journal.cnf")
    created_at = _exact_int(
        value["created_at"],
        where="session.created_at",
        minimum=0,
        maximum=2**63 - 1,
    )
    updated_at = _exact_int(
        value["updated_at"],
        where="session.updated_at",
        minimum=0,
        maximum=2**63 - 1,
    )
    if updated_at < created_at:
        _fail("session.updated_at precedes session.created_at")
    for key, expected in (
        ("clauses", expected_clauses),
        ("max_var", expected_max_var),
        ("solves", expected_solves),
    ):
        if (
            _exact_int(value[key], where=f"session.{key}", minimum=0, maximum=2**63 - 1)
            != expected
        ):
            _fail(f"session.{key} does not match the runner exchange")
    if (
        not (value["last_status"] is None or type(value["last_status"]) is str)
        or value["last_status"] != expected_last_status
    ):
        _fail("session.last_status does not match the runner exchange")
    return value


def _canonical_literals(value: object, *, where: str) -> tuple[int, ...]:
    if type(value) is not list:
        _fail(f"{where} must be a literal array")
    literals = tuple(
        _exact_int(item, where=f"{where}[{index}]", minimum=-_I32_MAX, maximum=_I32_MAX)
        for index, item in enumerate(value)
    )
    if any(literal == 0 for literal in literals):
        _fail(f"{where} contains zero")
    expected = tuple(sorted(set(literals), key=lambda literal: (abs(literal), literal)))
    if literals != expected or any(-literal in expected for literal in expected):
        _fail(f"{where} is not a canonical noncontradictory literal set")
    return literals


def _validate_solve_response(
    value: object,
    *,
    expected_index: int,
    assumptions: list[int],
) -> dict[str, Any]:
    if type(value) is not dict:
        _fail("solve response must be an object")
    keys = set(value)
    if (
        not _SOLVE_REQUIRED_KEYS <= keys
        or keys - _SOLVE_REQUIRED_KEYS - _SOLVE_OPTIONAL_KEYS
    ):
        _fail("solve response has missing or extra keys")
    status_value = value["status"]
    try:
        status = statement_bank.SolverVerdict(status_value)
    except (TypeError, ValueError):
        _fail("solve response status is invalid")
    _exact_int(value["solve_ms"], where="solve.solve_ms", minimum=0, maximum=2**64 - 1)
    if (
        _exact_int(
            value["solve_index"],
            where="solve.solve_index",
            minimum=1,
            maximum=2**64 - 1,
        )
        != expected_index
    ):
        _fail("solve response has an unexpected solve_index")
    _sha256(value["result_sha256"], where="solve.result_sha256")
    if "model" in value:
        _fail("solve returned a model despite include_model=false")
    if status is statement_bank.SolverVerdict.SAT:
        if keys != _SOLVE_REQUIRED_KEYS:
            _fail("SAT solve response has incompatible optional fields")
    elif status is statement_bank.SolverVerdict.UNKNOWN:
        if (
            keys != _SOLVE_REQUIRED_KEYS | {"interrupted_by"}
            or value["interrupted_by"] != "conflict_limit"
        ):
            _fail("UNKNOWN solve was not interrupted only by conflict_limit")
    else:
        if keys != _SOLVE_REQUIRED_KEYS | {"core", "terminal_unsat"}:
            _fail("UNSAT solve response has incompatible optional fields")
        core = _canonical_literals(value["core"], where="solve.core")
        if not set(core).issubset(assumptions):
            _fail("UNSAT core is not a subset of the exact assumptions")
        if type(value["terminal_unsat"]) is not bool or value["terminal_unsat"] != (
            not core
        ):
            _fail("terminal_unsat does not match the returned core")
    return value


def _journal_body(plan: statement_bank.SelectorPlan) -> bytes:
    return "".join(
        "".join(f"{literal} " for literal in clause) + "0\n"
        for clause in plan.document["gated_cnf"]["clauses"]
    ).encode("ascii")


def _snapshot_regular_file(
    path_string: str, *, session_id: str, size_cap: int, piqd_data_root: str
) -> receipt_adapter.AuthenticatedJournalSnapshot:
    """Open a rooted NOFOLLOW path and read one stable file snapshot."""

    path_string = _canonical_absolute_path(path_string, where="journal_path")
    relative = _relative_below_root(path_string, piqd_data_root, where="journal_path")
    cap = _exact_int(size_cap, where="journal_size_cap", minimum=1, maximum=2**63 - 1)
    directory_flags = os.O_RDONLY | os.O_DIRECTORY | getattr(os, "O_CLOEXEC", 0)
    nofollow = os.O_NOFOLLOW
    directory_fd = _open_nofollow_directory(piqd_data_root, where="piqd_data_root")
    file_fd: int | None = None
    try:
        for component in relative.parts[:-1]:
            next_fd = os.open(
                component, directory_flags | nofollow, dir_fd=directory_fd
            )
            os.close(directory_fd)
            directory_fd = next_fd
        file_fd = os.open(
            relative.parts[-1],
            os.O_RDONLY | nofollow | getattr(os, "O_CLOEXEC", 0),
            dir_fd=directory_fd,
        )
        before = os.fstat(file_fd)
        if not stat.S_ISREG(before.st_mode):
            _fail("journal_path is not a regular file")
        if before.st_size > cap:
            _fail("journal snapshot exceeds journal_size_cap")
        chunks: list[bytes] = []
        remaining = before.st_size + 1
        while remaining:
            chunk = os.read(file_fd, min(remaining, 1024 * 1024))
            if not chunk:
                break
            chunks.append(chunk)
            remaining -= len(chunk)
        payload = b"".join(chunks)
        after = os.fstat(file_fd)
        stable_fields = (
            "st_dev",
            "st_ino",
            "st_mode",
            "st_size",
            "st_mtime_ns",
            "st_ctime_ns",
        )
        if any(getattr(before, key) != getattr(after, key) for key in stable_fields):
            _fail("journal changed during the authenticated snapshot")
        if len(payload) != before.st_size:
            _fail("journal size changed or the snapshot was incomplete")
    except OSError as exc:
        raise StatementBankRunnerError(
            f"secure journal snapshot failed: {exc}"
        ) from exc
    finally:
        if file_fd is not None:
            os.close(file_fd)
        os.close(directory_fd)
    digest = hashlib.sha256(payload).hexdigest()
    return receipt_adapter.AuthenticatedJournalSnapshot(
        session_id=session_id, journal_bytes=payload, journal_sha256=digest
    )


def _validate_receipts_response(
    value: object,
    *,
    session_id: str,
    journal_path: str,
    expected_journal: bytes,
    solves: list[tuple[list[int], dict[str, Any]]],
    conflict_limit: int,
    piqd_data_root: str,
) -> dict[str, Any]:
    if type(value) is not dict or set(value) != _RECEIPT_TOP_KEYS:
        _fail("receipts response has noncanonical top-level keys")
    if _uuid(value["session_id"], where="receipts.session_id") != session_id:
        _fail("receipts response changed session id")
    if (
        _canonical_absolute_path(value["journal_path"], where="receipts.journal_path")
        != journal_path
    ):
        _fail("receipts response changed journal_path")
    receipts_path = _canonical_absolute_path(
        value["receipts_path"], where="receipts.receipts_path"
    )
    _relative_below_root(receipts_path, piqd_data_root, where="receipts.receipts_path")
    if (
        Path(receipts_path).parent != Path(journal_path).parent
        or Path(receipts_path).name != "receipts.jsonl"
    ):
        _fail("receipts_path is not the session receipts.jsonl sibling")
    if _exact_int(
        value["count"], where="receipts.count", minimum=0, maximum=2**64 - 1
    ) != len(solves):
        _fail("receipts response has an unexpected solve count")
    if type(value["receipts"]) is not list or len(value["receipts"]) != len(solves):
        _fail("receipts array has an unexpected length")
    base_sha256 = hashlib.sha256(expected_journal).hexdigest()
    clause_count = len(expected_journal.splitlines())
    for offset, (receipt, solve_record) in enumerate(
        zip(value["receipts"], solves, strict=True), start=1
    ):
        if type(receipt) is not dict:
            _fail("receipt must be an object")
        expected_assumptions, expected_response = solve_record
        status = expected_response["status"]
        optional = (
            {"core"}
            if status == "UNSAT"
            else ({"interrupted_by"} if status == "UNKNOWN" else set())
        )
        if set(receipt) != _RECEIPT_REQUIRED_KEYS | optional:
            _fail("receipt has missing or extra fields")
        if (
            _exact_int(
                receipt["solve_index"],
                where="receipt.solve_index",
                minimum=1,
                maximum=2**64 - 1,
            )
            != offset
            or type(receipt["status"]) is not str
            or receipt["status"] != status
        ):
            _fail("receipt does not match the runner solve sequence")
        assumptions = _canonical_literals(
            receipt["assumptions"], where="receipt.assumptions"
        )
        if assumptions != tuple(expected_assumptions):
            _fail("receipt assumptions do not match the exact request")
        if (
            _exact_int(
                receipt["conflict_limit"],
                where="receipt.conflict_limit",
                minimum=1,
                maximum=_I32_MAX,
            )
            != conflict_limit
        ):
            _fail("receipt does not record the deterministic runner budget")
        if (
            _exact_int(
                receipt["base_clauses"],
                where="receipt.base_clauses",
                minimum=0,
                maximum=2**64 - 1,
            )
            != clause_count
        ):
            _fail("receipt base_clauses does not match the uploaded journal")
        if (
            _exact_int(
                receipt["base_bytes"],
                where="receipt.base_bytes",
                minimum=0,
                maximum=2**64 - 1,
            )
            != len(expected_journal)
            or _sha256(receipt["base_sha256"], where="receipt.base_sha256")
            != base_sha256
        ):
            _fail("receipt base bytes do not match the uploaded journal")
        if (
            _sha256(receipt["result_sha256"], where="receipt.result_sha256")
            != expected_response["result_sha256"]
        ):
            _fail("receipt result_sha256 differs from the solve response")
        if type(receipt["model_recorded"]) is not bool or receipt["model_recorded"]:
            _fail("receipt claims a model despite include_model=false")
        _exact_int(receipt["at"], where="receipt.at", minimum=0, maximum=2**63 - 1)
        if status == "UNSAT":
            core = _canonical_literals(receipt["core"], where="receipt.core")
            if core != tuple(expected_response["core"]):
                _fail("receipt core differs from the solve response")
        if status == "UNKNOWN" and (
            type(receipt["interrupted_by"]) is not str
            or receipt["interrupted_by"] != "conflict_limit"
        ):
            _fail("UNKNOWN receipt has the wrong interruption cause")
    return value


def run_statement_bank_session(
    plan: statement_bank.SelectorPlan,
    *,
    solver_name: str,
    conflict_limit: int,
    transport: JsonHttpTransport | None = None,
    base_url: str = "http://127.0.0.1:7272",
    label: str | None = None,
    journal_size_cap: int = DEFAULT_JOURNAL_SIZE_CAP,
    http_request_timeout_s: float = DEFAULT_HTTP_REQUEST_TIMEOUT_S,
    http_response_byte_cap: int = DEFAULT_HTTP_RESPONSE_BYTE_CAP,
    piqd_data_root: str | None = None,
) -> StatementBankRunResult:
    """Run baseline then exact canonical omissions in one fresh SAT session."""

    statement_bank.validate_selector_plan(plan)
    _preflight_piqd_i32(plan)
    if type(solver_name) is not str or not solver_name or "\x00" in solver_name:
        _fail("solver_name must be a nonempty string")
    limit = _exact_int(
        conflict_limit, where="conflict_limit", minimum=1, maximum=_I32_MAX
    )
    chosen_label = (
        label if label is not None else f"p97-statement-bank-{plan.plan_sha256[:16]}"
    )
    if type(chosen_label) is not str or not chosen_label or "\x00" in chosen_label:
        _fail("label must be a nonempty string")
    request_timeout = _positive_finite_float(
        http_request_timeout_s, where="http_request_timeout_s"
    )
    response_cap = _exact_int(
        http_response_byte_cap,
        where="http_response_byte_cap",
        minimum=1,
        maximum=2**63 - 1,
    )
    configured_data_root = _validate_data_root(
        str(Path.home() / ".piqd") if piqd_data_root is None else piqd_data_root
    )
    client = (
        transport
        if transport is not None
        else UrllibJsonTransport(
            base_url,
            request_timeout_s=request_timeout,
            response_byte_cap=response_cap,
        )
    )
    clauses = plan.document["gated_cnf"]["clauses"]
    expected_journal = _journal_body(plan)
    session_id: str | None = None
    delete_attempted = False
    try:
        created_raw = _expect_response(
            client,
            "POST",
            "/sessions",
            expected_status=201,
            body={"solver": solver_name, "lane": "sat", "label": chosen_label},
        )
        session_id = _extract_create_candidate_session_id(created_raw)
        created = _validate_session(
            created_raw,
            expected_id=session_id,
            expected_state="live",
            expected_solver=solver_name,
            expected_label=chosen_label,
            expected_clauses=0,
            expected_max_var=0,
            expected_solves=0,
            expected_last_status=None,
            piqd_data_root=configured_data_root,
        )
        journal_path = created["journal_path"]
        session_path = f"/sessions/{session_id}"
        added = _expect_response(
            client,
            "POST",
            f"{session_path}/clauses",
            expected_status=200,
            body={"clauses": clauses},
        )
        if type(added) is not dict or set(added) != _ADD_KEYS:
            _fail("add-clauses response has noncanonical keys")
        expected_count = len(clauses)
        expected_max_var = plan.document["gated_cnf"]["num_vars"]
        if (
            _exact_int(
                added["added"], where="clauses.added", minimum=0, maximum=2**63 - 1
            )
            != expected_count
            or _exact_int(
                added["clauses"], where="clauses.clauses", minimum=0, maximum=2**63 - 1
            )
            != expected_count
            or _exact_int(
                added["max_var"], where="clauses.max_var", minimum=0, maximum=_I32_MAX
            )
            != expected_max_var
        ):
            _fail("add-clauses response does not describe the exact selector plan")

        queries = plan.document["queries"]
        solve_records: list[tuple[list[int], dict[str, Any]]] = []
        baseline_assumptions = queries["baseline"]["assumptions"]
        baseline_raw = _expect_response(
            client,
            "POST",
            f"{session_path}/solve",
            expected_status=200,
            body={
                "assumptions": baseline_assumptions,
                "conflict_limit": limit,
                "include_model": False,
            },
        )
        baseline_response = _validate_solve_response(
            baseline_raw, expected_index=1, assumptions=baseline_assumptions
        )
        solve_records.append((baseline_assumptions, baseline_response))
        baseline_status = statement_bank.SolverVerdict(baseline_response["status"])
        statement_indexes: dict[str, int] = {}
        if baseline_status is statement_bank.SolverVerdict.UNSAT:
            for expected_index, query in enumerate(
                queries["leave_one_group_out"], start=2
            ):
                assumptions = query["assumptions"]
                raw = _expect_response(
                    client,
                    "POST",
                    f"{session_path}/solve",
                    expected_status=200,
                    body={
                        "assumptions": assumptions,
                        "conflict_limit": limit,
                        "include_model": False,
                    },
                )
                response = _validate_solve_response(
                    raw, expected_index=expected_index, assumptions=assumptions
                )
                solve_records.append((assumptions, response))
                statement_indexes[query["statement_id"]] = expected_index

        last_status = solve_records[-1][1]["status"]
        delete_attempted = True
        closed_raw = _expect_response(
            client, "DELETE", session_path, expected_status=200
        )
        closed_session = _validate_session(
            closed_raw,
            expected_id=session_id,
            expected_state="closed",
            expected_solver=solver_name,
            expected_label=chosen_label,
            expected_clauses=expected_count,
            expected_max_var=expected_max_var,
            expected_solves=len(solve_records),
            expected_last_status=last_status,
            piqd_data_root=configured_data_root,
        )
        if any(
            closed_session[key] != created[key]
            for key in (
                "solver_sha256",
                "solver_signature",
                "protocol_version",
                "journal_path",
                "created_at",
            )
        ):
            _fail("closed session changed immutable identity fields")
        receipts_raw = _expect_response(
            client, "GET", f"{session_path}/receipts", expected_status=200
        )
        receipts_response = _validate_receipts_response(
            receipts_raw,
            session_id=session_id,
            journal_path=journal_path,
            expected_journal=expected_journal,
            solves=solve_records,
            conflict_limit=limit,
            piqd_data_root=configured_data_root,
        )
        snapshot = _snapshot_regular_file(
            journal_path,
            session_id=session_id,
            size_cap=journal_size_cap,
            piqd_data_root=configured_data_root,
        )
        if snapshot.journal_bytes != expected_journal:
            _fail(
                "complete journal snapshot is not exactly the single uploaded plan body"
            )

        adapter_result: receipt_adapter.ReceiptAdapterResult | None = None
        outcome = RunnerOutcome.BASELINE_NOT_UNSAT
        if baseline_status is statement_bank.SolverVerdict.UNSAT:
            adapter_result = receipt_adapter.adapt_authenticated_piqd_receipts(
                plan,
                receipts_response,
                snapshot,
                baseline_solve_index=1,
                statement_solve_indexes=statement_indexes,
                expected_conflict_limit=limit,
            )
            outcome = RunnerOutcome.COMPLETE
        audit_body: dict[str, Any] = {
            "claims": {
                "daemon_attestation": False,
                "daemon_concurrent_actor_exclusion": False,
                "global_minimum": False,
                "observational_only": True,
                "solver_attestation": False,
                "source_entitlement": False,
                "theorem_closure": False,
            },
            "conflict_limit": limit,
            "journal_sha256": snapshot.journal_sha256,
            "outcome": outcome.value,
            "plan_sha256": plan.plan_sha256,
            "schema": RUNNER_SCHEMA,
            "selection": {
                "baseline_solve_index": 1,
                "statement_solve_indexes": statement_indexes,
            },
            "session_id": session_id,
            "status": RUNNER_STATUS,
        }
        audit = {**audit_body, "runner_sha256": statement_bank.sha256_json(audit_body)}
        return StatementBankRunResult(
            outcome=outcome,
            session_id=session_id,
            baseline_status=baseline_status,
            baseline_solve_index=1,
            statement_solve_indexes=statement_indexes,
            adapter_result=adapter_result,
            audit=audit,
        )
    except Exception:
        if session_id is not None and not delete_attempted:
            delete_attempted = True
            try:
                client.request("DELETE", f"/sessions/{session_id}")
            except Exception as cleanup_error:  # noqa: BLE001
                # The original fail-closed error is the only actionable result.
                _ = cleanup_error
        raise
