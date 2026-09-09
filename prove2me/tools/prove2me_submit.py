"""Validate and apply receipt-backed Prove2Me submission plans.

The module deliberately uses only the Python standard library.  Network I/O is
behind ``Transport`` so the state machine can be exercised without contacting
Prove2Me.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import re
import sys
import time
import tomllib
from collections.abc import Callable
from dataclasses import dataclass
from pathlib import Path
from typing import Any, Protocol
from urllib.error import HTTPError, URLError
from urllib.parse import urlencode
from urllib.request import Request, urlopen

MARKER = "-- PROVE2ME_FORMAL_STATEMENT"
PLAN_SCHEMA = "prove2me-submit-plan/v1"
RECEIPT_SCHEMA = "prove2me-submit-receipt/v1"
JOB_SUCCESS = {"PUBLISHED"}
PROOF_SUCCESS = {"ACCEPTED", "SKETCH_ACCEPTED"}
FAILURE = {"FAILED", "ERROR", "WA", "SORRY"}
ACTIVE = {"PENDING", "COMPILING"}
NAME_RE = re.compile(r"^[A-Za-z_][A-Za-z0-9_']*(?:\.[A-Za-z_][A-Za-z0-9_']*)*$")
DECL_RE = re.compile(
    r"(?m)^\s*(?:private\s+)?(?:theorem|lemma)\s+"
    r"(?P<name>[A-Za-z_][A-Za-z0-9_']*(?:\.[A-Za-z_][A-Za-z0-9_']*)*)\b"
)


class SubmissionError(RuntimeError):
    """The local plan or a remote response violated the submission contract."""


class Transport(Protocol):
    """Minimal request seam used by :class:`Client`."""

    def request(
        self,
        method: str,
        url: str,
        *,
        headers: dict[str, str],
        body: bytes | None,
    ) -> Any: ...


class UrllibTransport:
    """Production HTTP transport."""

    def request(
        self,
        method: str,
        url: str,
        *,
        headers: dict[str, str],
        body: bytes | None,
    ) -> Any:
        request = Request(url, data=body, headers=headers, method=method)
        try:
            with urlopen(request, timeout=60) as response:
                raw = response.read()
        except HTTPError as error:
            raise SubmissionError(f"Prove2Me request failed with HTTP {error.code}") from error
        except URLError as error:
            raise SubmissionError("Prove2Me request failed at the network layer") from error
        if not raw:
            return None
        try:
            return json.loads(raw)
        except json.JSONDecodeError as error:
            raise SubmissionError("Prove2Me returned invalid JSON") from error


@dataclass(frozen=True)
class ParsedTheorem:
    preamble: str
    formal_statement: str
    declaration_name: str


@dataclass(frozen=True)
class LoadedPlan:
    path: Path
    root: Path
    data: dict[str, Any]
    definitions: tuple[dict[str, Any], ...]
    theorems: tuple[dict[str, Any], ...]
    proofs: tuple[dict[str, Any], ...]
    milestones: tuple[dict[str, Any], ...]
    mission_description: str | None
    digest: str


def _sha256(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def _canonical_json(value: Any) -> bytes:
    return json.dumps(
        value, sort_keys=True, separators=(",", ":"), ensure_ascii=False
    ).encode("utf-8")


def _atomic_json(path: Path, value: Any) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    temporary = path.with_name(f".{path.name}.tmp")
    with temporary.open("w", encoding="utf-8") as stream:
        json.dump(value, stream, indent=2, ensure_ascii=False, sort_keys=True)
        stream.write("\n")
        stream.flush()
    temporary.replace(path)


def parse_theorem_file(path: Path, expected_name: str) -> ParsedTheorem:
    """Split a theorem packet and verify its exact dotted declaration name."""
    if not NAME_RE.fullmatch(expected_name):
        raise SubmissionError(f"invalid dotted theorem name: {expected_name!r}")
    try:
        text = path.read_text(encoding="utf-8")
    except OSError as error:
        raise SubmissionError(f"cannot read theorem file: {path}") from error
    marker_lines = [
        index
        for index, line in enumerate(text.splitlines(keepends=True))
        if line.rstrip("\r\n") == MARKER
    ]
    if len(marker_lines) != 1:
        raise SubmissionError(f"{path} must contain exactly one required {MARKER!r} marker")
    lines = text.splitlines(keepends=True)
    index = marker_lines[0]
    preamble = "".join(lines[:index]).rstrip()
    formal_statement = "".join(lines[index + 1 :]).strip()
    if not formal_statement:
        raise SubmissionError(f"empty formal statement after marker in {path}")
    match = DECL_RE.search(formal_statement)
    if match is None:
        raise SubmissionError(f"no theorem or lemma declaration after marker in {path}")
    declaration_name = match.group("name")
    if declaration_name != expected_name:
        raise SubmissionError(
            f"theorem name mismatch in {path}: expected {expected_name}, found {declaration_name}"
        )
    return ParsedTheorem(preamble, formal_statement, declaration_name)


def _lean_code_without_comments_or_strings(text: str) -> str:
    """Blank Lean comments and strings while preserving token boundaries."""
    output: list[str] = []
    index = 0
    block_depth = 0
    in_string = False
    while index < len(text):
        if block_depth:
            if text.startswith("/-", index):
                block_depth += 1
                index += 2
            elif text.startswith("-/", index):
                block_depth -= 1
                index += 2
            else:
                output.append("\n" if text[index] == "\n" else " ")
                index += 1
        elif in_string:
            if text[index] == "\\" and index + 1 < len(text):
                output.extend("  ")
                index += 2
            elif text[index] == '"':
                output.append(" ")
                in_string = False
                index += 1
            else:
                output.append("\n" if text[index] == "\n" else " ")
                index += 1
        elif text.startswith("/-", index):
            output.extend("  ")
            block_depth = 1
            index += 2
        elif text.startswith("--", index):
            end = text.find("\n", index)
            if end < 0:
                output.extend(" " * (len(text) - index))
                break
            output.extend(" " * (end - index))
            index = end
        elif text[index] == '"':
            output.append(" ")
            in_string = True
            index += 1
        else:
            output.append(text[index])
            index += 1
    return "".join(output)


def _validate_proof_source(path: Path, source: bytes) -> None:
    try:
        text = source.decode("utf-8")
    except UnicodeDecodeError as error:
        raise SubmissionError(f"proof source is not UTF-8: {path}") from error
    code = _lean_code_without_comments_or_strings(text)
    placeholder = re.search(r"\b(?:sorry|admit)\b", code)
    if placeholder:
        raise SubmissionError(f"proof source contains {placeholder.group(0)!r}: {path}")


def _required_string(table: dict[str, Any], key: str, context: str) -> str:
    value = table.get(key)
    if not isinstance(value, str) or not value.strip():
        raise SubmissionError(f"{context}.{key} must be a non-empty string")
    return value


def _resolve(root: Path, value: str, context: str) -> Path:
    path = Path(value)
    if path.is_absolute():
        raise SubmissionError(f"{context} must be relative to the plan")
    resolved = (root / path).resolve()
    try:
        resolved.relative_to(root)
    except ValueError as error:
        raise SubmissionError(f"{context} escapes the plan directory") from error
    return resolved


def _resolve_credentials(root: Path, value: str) -> Path:
    path = Path(value).expanduser()
    return path.resolve() if path.is_absolute() else (root / path).resolve()


def _git_worktree_root(start: Path) -> Path | None:
    for candidate in (start, *start.parents):
        if (candidate / ".git").exists():
            return candidate
    return None


def _artifact_root(plan_dir: Path, data: dict[str, Any]) -> Path:
    configured = data.get("artifact_root", ".")
    if not isinstance(configured, str) or not configured.strip():
        raise SubmissionError("plan.artifact_root must be a non-empty relative path")
    relative = Path(configured)
    if relative.is_absolute():
        raise SubmissionError("plan.artifact_root must be relative to the plan")
    root = (plan_dir / relative).resolve()
    worktree = _git_worktree_root(plan_dir)
    if worktree is not None:
        try:
            root.relative_to(worktree)
        except ValueError as error:
            raise SubmissionError("plan.artifact_root escapes the current Git worktree") from error
    return root


def _tables(data: dict[str, Any], singular: str) -> list[dict[str, Any]]:
    rows = data.get(singular, [])
    if not isinstance(rows, list) or any(not isinstance(row, dict) for row in rows):
        raise SubmissionError(f"[[{singular}]] entries must be TOML tables")
    return rows


def load_plan(path: Path) -> LoadedPlan:
    """Load and fully validate a plan without performing network I/O."""
    path = path.resolve()
    try:
        raw = path.read_bytes()
        data = tomllib.loads(raw.decode("utf-8"))
    except (OSError, UnicodeDecodeError, tomllib.TOMLDecodeError) as error:
        raise SubmissionError(f"cannot load TOML plan {path}: {error}") from error
    if data.get("schema") != PLAN_SCHEMA:
        raise SubmissionError(f"plan schema must be {PLAN_SCHEMA!r}")
    plan_dir = path.parent
    root = _artifact_root(plan_dir, data)
    host = _required_string(data, "host", "plan").rstrip("/")
    if not host.startswith("https://"):
        raise SubmissionError("plan.host must use https")
    _required_string(data, "platform_version", "plan")
    _required_string(data, "credentials", "plan")
    _required_string(data, "receipt", "plan")

    definition_rows = _tables(data, "definition")
    theorem_rows = _tables(data, "theorem")
    if not definition_rows and not theorem_rows:
        raise SubmissionError(
            "plan must contain at least one [[definition]] or [[theorem]]"
        )
    definition_names: set[str] = set()
    definition_records: list[dict[str, Any]] = []
    artifacts: dict[str, str] = {}
    for number, row in enumerate(definition_rows, 1):
        context = f"definition[{number}]"
        name = _required_string(row, "name", context)
        if not NAME_RE.fullmatch(name):
            raise SubmissionError(f"invalid dotted definition name: {name!r}")
        if name in definition_names:
            raise SubmissionError(f"duplicate definition name: {name}")
        definition_names.add(name)
        definition_path = _resolve(
            root, _required_string(row, "file", context), f"{context}.file"
        )
        try:
            definition_bytes = definition_path.read_bytes()
            definition = definition_bytes.decode("utf-8")
        except (OSError, UnicodeDecodeError) as error:
            raise SubmissionError(
                f"cannot read definition file: {definition_path}"
            ) from error
        if not definition.strip():
            raise SubmissionError(f"empty definition file: {definition_path}")
        record = dict(row)
        record.update({"path": definition_path, "definition": definition})
        for key in ("title", "natural_language_statement", "source", "env"):
            if key in record:
                _required_string(record, key, context)
        if "tags" in record:
            tags = record["tags"]
            if not isinstance(tags, list) or any(
                not isinstance(tag, str) for tag in tags
            ):
                raise SubmissionError(f"{context}.tags must be an array of strings")
        if "private" in record and not isinstance(record["private"], bool):
            raise SubmissionError(f"{context}.private must be a boolean")
        artifacts[str(definition_path.relative_to(root))] = _sha256(definition_bytes)
        definition_records.append(record)

    names: set[str] = set()
    theorem_records: list[dict[str, Any]] = []
    for number, row in enumerate(theorem_rows, 1):
        context = f"theorem[{number}]"
        name = _required_string(row, "name", context)
        if name in names:
            raise SubmissionError(f"duplicate theorem name: {name}")
        names.add(name)
        theorem_path = _resolve(root, _required_string(row, "file", context), f"{context}.file")
        parsed = parse_theorem_file(theorem_path, name)
        record = dict(row)
        record.update(
            {
                "path": theorem_path,
                "preamble": parsed.preamble,
                "formal_statement": parsed.formal_statement,
            }
        )
        for key in ("title", "natural_language_statement", "source"):
            _required_string(record, key, context)
        tags = record.get("tags", [])
        if not isinstance(tags, list) or any(not isinstance(tag, str) for tag in tags):
            raise SubmissionError(f"{context}.tags must be an array of strings")
        artifacts[str(theorem_path.relative_to(root))] = _sha256(theorem_path.read_bytes())
        theorem_records.append(record)

    proofs: list[dict[str, Any]] = []
    proof_targets: set[str] = set()
    for number, row in enumerate(_tables(data, "proof"), 1):
        context = f"proof[{number}]"
        theorem = _required_string(row, "theorem", context)
        if theorem not in names:
            raise SubmissionError(f"{context}.theorem is not declared: {theorem}")
        if theorem in proof_targets:
            raise SubmissionError(f"duplicate proof target: {theorem}")
        proof_targets.add(theorem)
        proof_path = _resolve(root, _required_string(row, "file", context), f"{context}.file")
        explanation_path = _resolve(
            root,
            _required_string(row, "explanation", context),
            f"{context}.explanation",
        )
        if not proof_path.is_file() or not explanation_path.is_file():
            raise SubmissionError(f"missing proof artifact for {theorem}")
        proof_source = proof_path.read_bytes()
        _validate_proof_source(proof_path, proof_source)
        proof_type = row.get("proof_type", "prove")
        if proof_type not in {"prove", "disprove"}:
            raise SubmissionError(f"{context}.proof_type must be 'prove' or 'disprove'")
        explanation = explanation_path.read_text(encoding="utf-8").strip()
        if not explanation:
            raise SubmissionError(f"{context}.explanation is empty")
        record = dict(row)
        record.update(
            {
                "path": proof_path,
                "explanation_path": explanation_path,
                "explanation_text": explanation,
                "proof_type": proof_type,
            }
        )
        artifacts[str(proof_path.relative_to(root))] = _sha256(proof_source)
        artifacts[str(explanation_path.relative_to(root))] = _sha256(
            explanation_path.read_bytes()
        )
        proofs.append(record)

    milestones: list[dict[str, Any]] = []
    milestone_titles: set[str] = set()
    for number, row in enumerate(_tables(data, "milestone"), 1):
        context = f"milestone[{number}]"
        title = _required_string(row, "title", context)
        theorem = _required_string(row, "theorem", context)
        if theorem not in names:
            raise SubmissionError(f"{context}.theorem is not declared: {theorem}")
        if title in milestone_titles:
            raise SubmissionError(f"duplicate milestone title: {title}")
        milestone_titles.add(title)
        _required_string(row, "description", context)
        _required_string(row, "reason", context)
        if "sort_order" in row and not isinstance(row["sort_order"], int):
            raise SubmissionError(f"{context}.sort_order must be an integer")
        milestones.append(dict(row))

    mission_description: str | None = None
    if "mission_description" in data:
        description_path = _resolve(
            root,
            _required_string(data, "mission_description", "plan"),
            "plan.mission_description",
        )
        mission_description = description_path.read_text(encoding="utf-8")
        if not mission_description.strip():
            raise SubmissionError("mission description is empty")
        artifacts[str(description_path.relative_to(root))] = _sha256(description_path.read_bytes())
    if (milestones or mission_description is not None) and not isinstance(
        data.get("mission_id"), str
    ):
        raise SubmissionError("plan.mission_id is required for mission changes")

    digest_document = {
        "plan_sha256": _sha256(raw),
        "artifacts": artifacts,
    }
    return LoadedPlan(
        path,
        root,
        data,
        tuple(definition_records),
        tuple(theorem_records),
        tuple(proofs),
        tuple(milestones),
        mission_description,
        _sha256(_canonical_json(digest_document)),
    )


def encode_multipart(
    fields: dict[str, str], file_bytes: bytes, *, filename: str = "solution.lean"
) -> tuple[bytes, str]:
    """Return a byte-for-byte deterministic multipart request."""
    seed = _canonical_json(fields) + b"\0" + filename.encode() + b"\0" + file_bytes
    counter = 0
    while True:
        boundary = f"prove2me-{_sha256(seed + str(counter).encode())[:32]}"
        if boundary.encode() not in file_bytes:
            break
        counter += 1
    pieces: list[bytes] = []
    boundary_bytes = boundary.encode("ascii")
    for name in sorted(fields):
        pieces.extend(
            [
                b"--" + boundary_bytes,
                f'Content-Disposition: form-data; name="{name}"'.encode(),
                b"",
                fields[name].encode("utf-8"),
            ]
        )
    pieces.extend(
        [
            b"--" + boundary_bytes,
            f'Content-Disposition: form-data; name="file"; filename="{filename}"'.encode(),
            b"Content-Type: text/plain; charset=utf-8",
            b"",
            file_bytes,
            b"--" + boundary_bytes + b"--",
            b"",
        ]
    )
    return b"\r\n".join(pieces), boundary


def _redact(text: str, secrets: list[str]) -> str:
    result = text
    for secret in secrets:
        if secret:
            result = result.replace(secret, "[REDACTED]")
    return result


class Client:
    def __init__(
        self,
        host: str,
        platform_version: str,
        api_key: str,
        *,
        transport: Transport | None = None,
        poll_interval: float = 2.0,
        poll_timeout: float = 900.0,
        clock: Callable[[], float] = time.time,
        monotonic: Callable[[], float] = time.monotonic,
        sleep: Callable[[float], None] = time.sleep,
    ) -> None:
        self.host = host.rstrip("/")
        self.platform_version = platform_version
        self.api_key = api_key
        self.transport = transport or UrllibTransport()
        self.poll_interval = poll_interval
        self.poll_timeout = poll_timeout
        self.clock = clock
        self.monotonic = monotonic
        self.sleep = sleep
        self.access_token: str | None = None
        self.token_expires_at = 0.0

    def _call(
        self,
        method: str,
        path: str,
        *,
        query: dict[str, str] | None = None,
        body: bytes | None = None,
        content_type: str = "application/json",
        authenticated: bool = True,
    ) -> Any:
        if authenticated and (
            self.access_token is None or self.clock() >= self.token_expires_at - 60
        ):
            self.refresh()
        url = self.host + path
        if query:
            url += "?" + urlencode(query)
        headers: dict[str, str] = {}
        if authenticated and self.access_token:
            headers["Authorization"] = f"Bearer {self.access_token}"
        if body is not None:
            headers["Content-Type"] = content_type
        try:
            return self.transport.request(method, url, headers=headers, body=body)
        except Exception as error:
            message = _redact(str(error), [self.api_key, self.access_token or ""])
            if isinstance(error, SubmissionError) and message == str(error):
                raise
            raise SubmissionError(f"Prove2Me request failed: {message}") from error

    def refresh(self) -> None:
        response = self._call(
            "POST",
            "/agent/refresh",
            body=_canonical_json({"api_key": self.api_key}),
            authenticated=False,
        )
        if not isinstance(response, dict) or not isinstance(response.get("access_token"), str):
            raise SubmissionError("agent refresh returned no access token")
        if response.get("version") != self.platform_version:
            raise SubmissionError("Prove2Me API version differs from the plan")
        try:
            expires_at = float(response["expires_at"])
        except (KeyError, TypeError, ValueError) as error:
            raise SubmissionError("agent refresh returned no token expiry") from error
        self.access_token = response["access_token"]
        self.token_expires_at = expires_at

    def request(
        self,
        method: str,
        path: str,
        *,
        query: dict[str, str] | None = None,
        body: bytes | None = None,
        content_type: str = "application/json",
    ) -> Any:
        return self._call(
            method, path, query=query, body=body, content_type=content_type
        )

    def json_request(self, method: str, path: str, payload: dict[str, Any]) -> Any:
        return self.request(method, path, body=_canonical_json(payload))

    def lookup_exact(self, name: str, env: str | None = None) -> dict[str, Any] | None:
        query = {"theorem_name": name}
        if env:
            query["env"] = env
        response = self.request("GET", "/theorems", query=query)
        candidates = (
            response.get("theorems", response.get("items", []))
            if isinstance(response, dict)
            else response
        )
        if not isinstance(candidates, list):
            raise SubmissionError("invalid theorem lookup response")
        exact = [
            item
            for item in candidates
            if isinstance(item, dict) and item.get("theorem_name") == name
        ]
        if len(exact) > 1:
            raise SubmissionError(f"ambiguous exact theorem lookup: {name}")
        return exact[0] if exact else None

    def lookup_definition_exact(
        self, name: str, env: str | None = None
    ) -> dict[str, Any] | None:
        query = {"q": name, "status": "Definition"}
        if env:
            query["env"] = env
        response = self.request("GET", "/theorems", query=query)
        candidates = (
            response.get("theorems", response.get("items", []))
            if isinstance(response, dict)
            else response
        )
        if not isinstance(candidates, list):
            raise SubmissionError("invalid definition lookup response")
        exact = [
            item
            for item in candidates
            if isinstance(item, dict)
            and (item.get("definition_name") or item.get("theorem_name")) == name
        ]
        if len(exact) > 1:
            raise SubmissionError(f"ambiguous exact definition lookup: {name}")
        return exact[0] if exact else None

    def poll_job(self, job_id: str) -> dict[str, Any]:
        return self._poll(f"/publish-jobs/{job_id}", JOB_SUCCESS)

    def poll_submission(self, submission_id: str) -> dict[str, Any]:
        return self._poll("/verify", PROOF_SUCCESS, {"submission_id": submission_id})

    def _poll(
        self,
        path: str,
        success: set[str],
        query: dict[str, str] | None = None,
    ) -> dict[str, Any]:
        deadline = self.monotonic() + self.poll_timeout
        while True:
            response = self.request("GET", path, query=query)
            if not isinstance(response, dict):
                raise SubmissionError("invalid polling response")
            status = response.get("status")
            if status in success or status in FAILURE or status not in ACTIVE:
                return response
            if self.monotonic() >= deadline:
                raise SubmissionError(f"polling timed out for {path}")
            self.sleep(self.poll_interval)


def _load_api_key(path: Path) -> str:
    try:
        if path.suffix.lower() == ".toml":
            document = tomllib.loads(path.read_text(encoding="utf-8"))
        else:
            document = json.loads(path.read_text(encoding="utf-8"))
    except (OSError, UnicodeDecodeError, json.JSONDecodeError, tomllib.TOMLDecodeError) as error:
        raise SubmissionError(f"cannot load credentials from {path}") from error
    key = document.get("api_key") if isinstance(document, dict) else None
    if not isinstance(key, str) or not key.strip():
        raise SubmissionError("credentials contain no API key")
    return key


def _receipt_path(plan: LoadedPlan) -> Path:
    return _resolve(plan.root, plan.data["receipt"], "plan.receipt")


def _new_receipt(plan: LoadedPlan) -> dict[str, Any]:
    return {
        "schema": RECEIPT_SCHEMA,
        "host": plan.data["host"].rstrip("/"),
        "plan_digest": plan.digest,
        "definitions": {},
        "theorems": {},
        "proofs": {},
        "milestones": {},
        "mission_description": {},
        "intents": {},
    }


def _load_receipt(plan: LoadedPlan) -> tuple[Path, dict[str, Any]]:
    path = _receipt_path(plan)
    if path.is_file():
        try:
            receipt = json.loads(path.read_text(encoding="utf-8"))
        except json.JSONDecodeError as error:
            raise SubmissionError(f"invalid receipt JSON: {path}") from error
    else:
        receipt = _new_receipt(plan)
        _atomic_json(path, receipt)
    if (
        receipt.get("schema") != RECEIPT_SCHEMA
        or receipt.get("host") != plan.data["host"].rstrip("/")
        or receipt.get("plan_digest") != plan.digest
    ):
        raise SubmissionError("receipt belongs to a different plan or host")
    receipt.setdefault("definitions", {})
    for key in (
        "definitions",
        "theorems",
        "proofs",
        "milestones",
        "mission_description",
        "intents",
    ):
        if not isinstance(receipt.get(key), dict):
            raise SubmissionError(f"malformed receipt field: {key}")
    return path, receipt


def _intent(
    receipt: dict[str, Any], receipt_path: Path, key: str, payload: bytes
) -> None:
    existing = receipt["intents"].get(key)
    digest = _sha256(payload)
    if existing and existing.get("state") == "INTENT" and existing.get("payload_sha256") == digest:
        return
    receipt["intents"][key] = {"state": "INTENT", "payload_sha256": digest}
    _atomic_json(receipt_path, receipt)


def _complete_intent(
    receipt: dict[str, Any], receipt_path: Path, key: str, **values: Any
) -> None:
    receipt["intents"][key].update(values)
    receipt["intents"][key]["state"] = "RECORDED"
    _atomic_json(receipt_path, receipt)


def _identifier(remote: dict[str, Any]) -> str | None:
    return next(
        (
            remote.get(key)
            for key in ("theorem_id", "id")
            if isinstance(remote.get(key), str)
        ),
        None,
    )


def _definition_identifier(remote: dict[str, Any]) -> str | None:
    return next(
        (
            remote.get(key)
            for key in ("definition_id", "theorem_id", "id")
            if isinstance(remote.get(key), str)
        ),
        None,
    )


def _definition_payload(definition: dict[str, Any]) -> dict[str, Any]:
    payload: dict[str, Any] = {
        "definition_name": definition["name"],
        "definition": definition["definition"],
    }
    optional_fields = {
        "title": "definition_title",
        "natural_language_statement": "natural_language_statement",
        "source": "source",
        "tags": "tags",
        "private": "private",
        "env": "env",
    }
    for plan_key, api_key in optional_fields.items():
        if plan_key in definition:
            payload[api_key] = definition[plan_key]
    return payload


def _require_definition_readback(
    remote: dict[str, Any], name: str, expected: str
) -> dict[str, Any]:
    content = next(
        (
            remote.get(key)
            for key in ("definition", "definitions", "code")
            if isinstance(remote.get(key), str)
        ),
        None,
    )
    if content != expected:
        raise SubmissionError(f"remote definition content mismatch: {name}")
    return remote


def _ensure_definition(
    definition: dict[str, Any],
    client: Client,
    receipt_path: Path,
    receipt: dict[str, Any],
) -> str:
    name = definition["name"]
    expected = definition["definition"]
    entry = receipt["definitions"].get(name, {})
    if entry.get("job_id") and entry.get("status") not in JOB_SUCCESS:
        result = client.poll_job(entry["job_id"])
        entry["status"] = result.get("status")
        receipt["definitions"][name] = entry
        _atomic_json(receipt_path, receipt)
        if result.get("status") not in JOB_SUCCESS:
            raise SubmissionError(
                f"definition publish job for {name} ended as {result.get('status')}"
            )

    remote = client.lookup_definition_exact(name, definition.get("env"))
    if remote is not None:
        _require_definition_readback(remote, name, expected)
        definition_id = _definition_identifier(remote)
        if not definition_id:
            raise SubmissionError(f"remote definition has no ID: {name}")
        recorded_job_id = entry.get("job_id")
        final_entry = {
            "status": "PUBLISHED"
            if isinstance(recorded_job_id, str)
            else remote.get("status", "PUBLISHED"),
            "definition_id": definition_id,
        }
        if isinstance(recorded_job_id, str):
            final_entry["job_id"] = recorded_job_id
        receipt["definitions"][name] = final_entry
        intent_key = f"definition:{name}"
        prior = receipt["intents"].get(intent_key)
        if prior and prior.get("state") == "INTENT":
            _complete_intent(
                receipt,
                receipt_path,
                intent_key,
                definition_id=definition_id,
            )
        else:
            _atomic_json(receipt_path, receipt)
        return definition_id

    intent_key = f"definition:{name}"
    prior = receipt["intents"].get(intent_key)
    if prior and prior.get("state") == "INTENT":
        raise SubmissionError(
            f"uncertain prior definition POST for {name}; refusing retry"
        )
    payload = _canonical_json(_definition_payload(definition))
    _intent(receipt, receipt_path, intent_key, payload)
    response = client.request("POST", "/submit-definition", body=payload)
    jobs = response.get("jobs", []) if isinstance(response, dict) else []
    if isinstance(response, dict) and isinstance(response.get("job_id"), str):
        jobs = [response]
    if len(jobs) != 1 or not isinstance(jobs[0].get("job_id"), str):
        raise SubmissionError(f"submit-definition returned no unique job for {name}")
    job_id = jobs[0]["job_id"]
    receipt["definitions"][name] = {
        "status": jobs[0].get("status", "PENDING"),
        "job_id": job_id,
    }
    _complete_intent(receipt, receipt_path, intent_key, job_id=job_id)
    result = client.poll_job(job_id)
    if result.get("status") not in JOB_SUCCESS:
        receipt["definitions"][name]["status"] = result.get("status")
        _atomic_json(receipt_path, receipt)
        raise SubmissionError(
            f"definition publish job for {name} ended as {result.get('status')}"
        )
    remote = client.lookup_definition_exact(name, definition.get("env"))
    if remote is None:
        raise SubmissionError(f"published definition did not reconcile exactly: {name}")
    _require_definition_readback(remote, name, expected)
    definition_id = _definition_identifier(remote)
    if not definition_id:
        raise SubmissionError(f"published definition has no ID: {name}")
    receipt["definitions"][name] = {
        "status": "PUBLISHED",
        "definition_id": definition_id,
        "job_id": job_id,
    }
    _atomic_json(receipt_path, receipt)
    return definition_id


def _theorem_payload(theorem: dict[str, Any]) -> dict[str, Any]:
    payload: dict[str, Any] = {
        "theorem_name": theorem["name"],
        "theorem_title": theorem["title"],
        "formal_statement": theorem["formal_statement"],
        "natural_language_statement": theorem["natural_language_statement"],
        "preamble": theorem["preamble"],
        "source": theorem["source"],
        "tags": theorem.get("tags", []),
    }
    for optional in ("private", "env"):
        if optional in theorem:
            payload[optional] = theorem[optional]
    return payload


def _ensure_theorem(
    plan: LoadedPlan,
    theorem: dict[str, Any],
    client: Client,
    receipt_path: Path,
    receipt: dict[str, Any],
) -> str:
    name = theorem["name"]
    expected = theorem["formal_statement"]
    entry = receipt["theorems"].get(name, {})
    if entry.get("job_id") and entry.get("status") not in JOB_SUCCESS:
        result = client.poll_job(entry["job_id"])
        entry.update(result)
        receipt["theorems"][name] = entry
        _atomic_json(receipt_path, receipt)
        if result.get("status") not in JOB_SUCCESS:
            raise SubmissionError(f"publish job for {name} ended as {result.get('status')}")

    remote = client.lookup_exact(name, theorem.get("env"))
    if remote is not None:
        if remote.get("formal_statement") != expected:
            raise SubmissionError(f"remote theorem statement mismatch: {name}")
        theorem_id = _identifier(remote)
        if not theorem_id:
            raise SubmissionError(f"remote theorem has no ID: {name}")
        recorded_job_id = entry.get("job_id")
        final_entry = {
            "status": "PUBLISHED"
            if isinstance(recorded_job_id, str)
            else remote.get("status", "PUBLISHED"),
            "theorem_id": theorem_id,
        }
        if isinstance(recorded_job_id, str):
            final_entry["job_id"] = recorded_job_id
        receipt["theorems"][name] = final_entry
        _atomic_json(receipt_path, receipt)
        return theorem_id

    intent_key = f"theorem:{name}"
    prior = receipt["intents"].get(intent_key)
    if prior and prior.get("state") == "INTENT":
        raise SubmissionError(f"uncertain prior theorem POST for {name}; refusing retry")
    payload = _canonical_json({"problems": [_theorem_payload(theorem)]})
    _intent(receipt, receipt_path, intent_key, payload)
    response = client.request("POST", "/submit-problem", body=payload)
    jobs = response.get("jobs", []) if isinstance(response, dict) else []
    if len(jobs) != 1 or not isinstance(jobs[0].get("job_id"), str):
        raise SubmissionError(f"submit-problem returned no unique job for {name}")
    job_id = jobs[0]["job_id"]
    receipt["theorems"][name] = {
        "status": jobs[0].get("status", "PENDING"),
        "job_id": job_id,
    }
    _complete_intent(receipt, receipt_path, intent_key, job_id=job_id)
    result = client.poll_job(job_id)
    if result.get("status") not in JOB_SUCCESS:
        receipt["theorems"][name].update(result)
        _atomic_json(receipt_path, receipt)
        raise SubmissionError(f"publish job for {name} ended as {result.get('status')}")
    remote = client.lookup_exact(name, theorem.get("env"))
    if remote is None or remote.get("formal_statement") != expected:
        raise SubmissionError(f"published theorem did not reconcile exactly: {name}")
    theorem_id = _identifier(remote)
    if not theorem_id:
        raise SubmissionError(f"published theorem has no ID: {name}")
    receipt["theorems"][name] = {
        "status": "PUBLISHED",
        "theorem_id": theorem_id,
        "job_id": job_id,
    }
    _atomic_json(receipt_path, receipt)
    return theorem_id


def _ensure_proof(
    proof: dict[str, Any],
    theorem_id: str,
    client: Client,
    receipt_path: Path,
    receipt: dict[str, Any],
) -> None:
    name = proof["theorem"]
    entry = receipt["proofs"].get(name, {})
    if entry.get("status") in PROOF_SUCCESS:
        return
    if entry.get("submission_id"):
        result = client.poll_submission(entry["submission_id"])
        entry.update(result)
        receipt["proofs"][name] = entry
        _atomic_json(receipt_path, receipt)
        if result.get("status") not in PROOF_SUCCESS:
            raise SubmissionError(f"proof for {name} ended as {result.get('status')}")
        return
    fields = {
        "explanation": proof["explanation_text"],
        "proof_type": proof["proof_type"],
        "theorem_id": theorem_id,
    }
    body, boundary = encode_multipart(fields, proof["path"].read_bytes())
    intent_key = f"proof:{name}"
    prior = receipt["intents"].get(intent_key)
    if prior and prior.get("state") == "INTENT":
        raise SubmissionError(f"uncertain prior proof POST for {name}; refusing retry")
    _intent(receipt, receipt_path, intent_key, body)
    response = client.request(
        "POST",
        "/verify",
        body=body,
        content_type=f"multipart/form-data; boundary={boundary}",
    )
    submission_id = response.get("submission_id") if isinstance(response, dict) else None
    if not isinstance(submission_id, str):
        raise SubmissionError(f"verify returned no submission ID for {name}")
    receipt["proofs"][name] = {
        "status": response.get("status", "PENDING"),
        "submission_id": submission_id,
    }
    _complete_intent(receipt, receipt_path, intent_key, submission_id=submission_id)
    result = client.poll_submission(submission_id)
    receipt["proofs"][name].update(result)
    _atomic_json(receipt_path, receipt)
    if result.get("status") not in PROOF_SUCCESS:
        raise SubmissionError(f"proof for {name} ended as {result.get('status')}")


def _milestone_rows(client: Client, mission_id: str) -> list[dict[str, Any]]:
    response = client.request("GET", f"/missions/{mission_id}/milestones")
    rows = response.get("milestones", response) if isinstance(response, dict) else response
    if not isinstance(rows, list) or any(not isinstance(row, dict) for row in rows):
        raise SubmissionError("invalid milestone list response")
    return rows


def _milestone_theorem_id(row: dict[str, Any]) -> str | None:
    theorem_id = row.get("theorem_id")
    if isinstance(theorem_id, str):
        return theorem_id
    theorem = row.get("theorem")
    if isinstance(theorem, dict):
        return next(
            (
                theorem.get(key)
                for key in ("theorem_id", "id")
                if isinstance(theorem.get(key), str)
            ),
            None,
        )
    return None


def _exact_milestone(
    client: Client, mission_id: str, title: str
) -> dict[str, Any] | None:
    matches = [
        row for row in _milestone_rows(client, mission_id) if row.get("title") == title
    ]
    if len(matches) > 1:
        raise SubmissionError(f"ambiguous exact milestone lookup: {title}")
    return matches[0] if matches else None


def _require_milestone_readback(
    remote: dict[str, Any] | None, desired: dict[str, Any]
) -> dict[str, Any]:
    title = desired["title"]
    if remote is None:
        raise SubmissionError(f"milestone disappeared during readback: {title}")
    exact = (
        remote.get("title") == title
        and remote.get("milestone_description") == desired["milestone_description"]
        and _milestone_theorem_id(remote) == desired["theorem_id"]
        and (
            "sort_order" not in desired
            or remote.get("sort_order") == desired["sort_order"]
        )
    )
    if not exact:
        raise SubmissionError(f"milestone readback mismatch: {title}")
    return remote


def _ensure_milestone(
    mission_id: str,
    milestone: dict[str, Any],
    theorem_id: str,
    client: Client,
    receipt_path: Path,
    receipt: dict[str, Any],
) -> None:
    title = milestone["title"]
    remote = _exact_milestone(client, mission_id, title)
    desired = {
        "title": title,
        "milestone_description": milestone["description"],
        "theorem_id": theorem_id,
    }
    if "sort_order" in milestone:
        desired["sort_order"] = milestone["sort_order"]
    if remote is None:
        key = f"milestone-create:{title}"
        payload = _canonical_json(desired)
        prior = receipt["intents"].get(key)
        if prior and prior.get("state") == "INTENT":
            raise SubmissionError(f"uncertain prior milestone POST for {title}; refusing retry")
        _intent(receipt, receipt_path, key, payload)
        created = client.request(
            "POST", f"/missions/{mission_id}/milestones", body=payload
        )
        if not isinstance(created, dict):
            raise SubmissionError(f"invalid milestone creation response: {title}")
        readback = _require_milestone_readback(
            _exact_milestone(client, mission_id, title), desired
        )
        milestone_id = readback.get("id") or readback.get("milestone_id")
        if not isinstance(milestone_id, str):
            raise SubmissionError(f"milestone creation returned no ID: {title}")
        receipt["milestones"][title] = {"id": milestone_id, "status": "ENSURED"}
        _complete_intent(receipt, receipt_path, key, milestone_id=milestone_id)
        return
    milestone_id = remote.get("id") or remote.get("milestone_id")
    if not isinstance(milestone_id, str):
        raise SubmissionError(f"milestone has no ID: {title}")
    changes = {
        key: value
        for key, value in desired.items()
        if (
            _milestone_theorem_id(remote) != value
            if key == "theorem_id"
            else remote.get(key) != value
        )
    }
    if changes:
        changes["reason"] = milestone["reason"]
        payload = _canonical_json(changes)
        key = f"milestone-update:{title}"
        _intent(receipt, receipt_path, key, payload)
        updated = client.request("PATCH", f"/milestones/{milestone_id}", body=payload)
        if not isinstance(updated, dict):
            raise SubmissionError(f"invalid milestone update response: {title}")
        _require_milestone_readback(_exact_milestone(client, mission_id, title), desired)
        _complete_intent(receipt, receipt_path, key, milestone_id=milestone_id)
    receipt["milestones"][title] = {"id": milestone_id, "status": "ENSURED"}
    _atomic_json(receipt_path, receipt)


def _find_mission(client: Client, mission_id: str) -> dict[str, Any]:
    offset = 0
    while True:
        response = client.request(
            "GET", "/missions", query={"limit": "100", "offset": str(offset)}
        )
        rows = response.get("missions", []) if isinstance(response, dict) else []
        if not isinstance(rows, list):
            raise SubmissionError("invalid mission list response")
        matches = [row for row in rows if isinstance(row, dict) and row.get("id") == mission_id]
        if matches:
            return matches[0]
        offset += len(rows)
        total = response.get("total", offset) if isinstance(response, dict) else offset
        if not rows or offset >= total:
            raise SubmissionError(f"mission could not be resolved: {mission_id}")


def _ensure_description(
    mission_id: str,
    description: str,
    client: Client,
    receipt_path: Path,
    receipt: dict[str, Any],
) -> None:
    mission = _find_mission(client, mission_id)
    if mission.get("description") != description:
        payload = _canonical_json({"description": description})
        key = f"mission-description:{mission_id}"
        _intent(receipt, receipt_path, key, payload)
        response = client.request("PATCH", f"/missions/{mission_id}", body=payload)
        if not isinstance(response, dict):
            raise SubmissionError("invalid mission update response")
        readback = _find_mission(client, mission_id)
        if readback.get("description") != description:
            raise SubmissionError("mission description readback mismatch")
        _complete_intent(receipt, receipt_path, key, mission_id=mission_id)
    receipt["mission_description"] = {
        "status": "ENSURED",
        "sha256": _sha256(description.encode("utf-8")),
    }
    _atomic_json(receipt_path, receipt)


def apply_plan(
    plan: LoadedPlan,
    *,
    transport: Transport | None = None,
    poll_interval: float = 2.0,
    poll_timeout: float = 900.0,
) -> dict[str, Any]:
    """Apply a validated plan, recording every mutation intent atomically."""
    credentials = _resolve_credentials(plan.path.parent, plan.data["credentials"])
    client = Client(
        plan.data["host"],
        plan.data["platform_version"],
        _load_api_key(credentials),
        transport=transport,
        poll_interval=poll_interval,
        poll_timeout=poll_timeout,
    )
    receipt_path, receipt = _load_receipt(plan)
    for definition in plan.definitions:
        _ensure_definition(definition, client, receipt_path, receipt)
    ids: dict[str, str] = {}
    for theorem in plan.theorems:
        ids[theorem["name"]] = _ensure_theorem(
            plan, theorem, client, receipt_path, receipt
        )
    for proof in plan.proofs:
        _ensure_proof(
            proof, ids[proof["theorem"]], client, receipt_path, receipt
        )
    mission_id = plan.data.get("mission_id")
    if isinstance(mission_id, str):
        for milestone in plan.milestones:
            _ensure_milestone(
                mission_id,
                milestone,
                ids[milestone["theorem"]],
                client,
                receipt_path,
                receipt,
            )
        if plan.mission_description is not None:
            _ensure_description(
                mission_id,
                plan.mission_description,
                client,
                receipt_path,
                receipt,
            )
    return receipt


def _validation_summary(plan: LoadedPlan) -> dict[str, Any]:
    return {
        "schema": PLAN_SCHEMA,
        "status": "VALIDATED",
        "plan_digest": plan.digest,
        "definitions": [definition["name"] for definition in plan.definitions],
        "theorems": [theorem["name"] for theorem in plan.theorems],
        "proofs": [proof["theorem"] for proof in plan.proofs],
        "milestones": [milestone["title"] for milestone in plan.milestones],
        "mission_description": plan.mission_description is not None,
    }


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("command", choices=("validate", "apply"))
    parser.add_argument("plan", type=Path)
    parser.add_argument("--poll-interval", type=float, default=2.0)
    parser.add_argument("--poll-timeout", type=float, default=900.0)
    args = parser.parse_args(argv)
    try:
        plan = load_plan(args.plan)
        result = (
            _validation_summary(plan)
            if args.command == "validate"
            else apply_plan(
                plan,
                poll_interval=args.poll_interval,
                poll_timeout=args.poll_timeout,
            )
        )
    except SubmissionError as error:
        print(f"error: {error}", file=sys.stderr)
        return 2
    print(json.dumps(result, indent=2, ensure_ascii=False, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
