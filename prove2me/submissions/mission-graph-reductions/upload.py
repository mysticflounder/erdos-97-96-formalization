"""Submit the three upper mission-graph reductions to Prove2Me.

The default mode performs local validation only. The --execute flag submits
solutions in dependency order. An atomic receipt records a POST intent before
each request, so an interrupted request is never repeated speculatively.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import re
import sys
import time
from pathlib import Path
from typing import Any
from urllib.error import HTTPError, URLError
from urllib.request import Request, urlopen

TRANSFER = Path(__file__).resolve().parent
WORKSPACE = Path.home() / "prove2me_workspace"
TARGETS_PATH = TRANSFER / "targets.json"
EXPLANATIONS_PATH = TRANSFER / "explanations.json"
DEFAULT_RECEIPT = TRANSFER / "receipt.json"
RECEIPT_SCHEMA = "prove2me-mission-graph-reduction-receipt/v1"
TERMINAL_OK = {"ACCEPTED", "SKETCH_ACCEPTED", "REMOTE_PROVED"}
TERMINAL_FAILURE = {"CE", "WA", "SORRY", "FAILED", "ERROR"}


class UploadError(RuntimeError):
    """A local artifact or remote response violates the upload contract."""


def sha256(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def canonical_bytes(value: Any) -> bytes:
    return json.dumps(
        value, ensure_ascii=True, sort_keys=True, separators=(",", ":")
    ).encode("utf-8")


def load_json(path: Path) -> Any:
    if not path.is_file():
        raise UploadError(f"missing artifact: {path}")
    try:
        return json.loads(path.read_text(encoding="utf-8"))
    except json.JSONDecodeError as error:
        raise UploadError(f"invalid JSON in {path}: {error}") from error


def dump_json(path: Path, value: Any) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    temporary = path.with_name(f".{path.name}.tmp")
    temporary.write_text(
        json.dumps(value, indent=2, ensure_ascii=False, sort_keys=True) + "\n",
        encoding="utf-8",
    )
    temporary.replace(path)


def lean_code_without_comments(data: bytes) -> str:
    """Remove Lean comments and strings before checking for sorry."""
    text = data.decode("utf-8")
    output: list[str] = []
    index = 0
    depth = 0
    in_string = False
    while index < len(text):
        if depth:
            if text.startswith("/-", index):
                depth += 1
                index += 2
            elif text.startswith("-/", index):
                depth -= 1
                index += 2
            else:
                index += 1
        elif in_string:
            if text[index] == "\\":
                index += 2
            elif text[index] == '"':
                in_string = False
                index += 1
            else:
                index += 1
        elif text.startswith("/-", index):
            depth = 1
            index += 2
        elif text.startswith("--", index):
            newline = text.find("\n", index)
            index = len(text) if newline < 0 else newline + 1
            output.append("\n")
        elif text[index] == '"':
            in_string = True
            index += 1
        else:
            output.append(text[index])
            index += 1
    if depth or in_string:
        raise UploadError("unterminated Lean comment or string")
    return "".join(output)


def imports_in(data: bytes) -> set[str]:
    code = lean_code_without_comments(data)
    return set(re.findall(r"(?m)^\s*import\s+([A-Za-z0-9_.]+)\s*$", code))


def validate_target_shape(target: Any, expected_order: int) -> dict[str, Any]:
    keys = {
        "order", "theorem_id", "theorem_name", "formal_statement",
        "solution_path", "dependencies",
    }
    if not isinstance(target, dict) or set(target) != keys:
        raise UploadError(f"target {expected_order} has an inexact schema")
    if target["order"] != expected_order:
        raise UploadError("targets are not in dependency order")
    for key in ("theorem_id", "theorem_name", "formal_statement", "solution_path"):
        if not isinstance(target[key], str) or not target[key]:
            raise UploadError(f"target {expected_order} has invalid {key}")
    if not isinstance(target["dependencies"], list) or not target["dependencies"]:
        raise UploadError(f"target {expected_order} has no dependencies")
    for dependency in target["dependencies"]:
        if not isinstance(dependency, dict) or set(dependency) != {
            "theorem_id", "theorem_name", "module"
        }:
            raise UploadError(f"target {expected_order} has a malformed dependency")
        if any(
            not isinstance(dependency[key], str) or not dependency[key]
            for key in dependency
        ):
            raise UploadError(f"target {expected_order} has an invalid dependency")
    return target


def load_package() -> dict[str, Any]:
    targets_document = load_json(TARGETS_PATH)
    explanations_document = load_json(EXPLANATIONS_PATH)
    if not isinstance(targets_document, dict) or set(targets_document) != {
        "schema", "host", "platform_version", "targets"
    }:
        raise UploadError("targets.json has an inexact schema")
    if targets_document["schema"] != "prove2me-mission-graph-reductions/v1":
        raise UploadError("unexpected targets schema")
    if targets_document["host"] != "https://prove2.me/api/v1":
        raise UploadError("unexpected API host")
    if targets_document["platform_version"] != "0.9.8":
        raise UploadError("unexpected platform version")
    raw_targets = targets_document["targets"]
    if not isinstance(raw_targets, list) or len(raw_targets) != 3:
        raise UploadError("exactly three targets are required")
    targets = [
        validate_target_shape(target, index)
        for index, target in enumerate(raw_targets, start=1)
    ]
    names = [target["theorem_name"] for target in targets]
    ids = [target["theorem_id"] for target in targets]
    if len(set(names)) != len(names) or len(set(ids)) != len(ids):
        raise UploadError("target names and IDs must be unique")

    if not isinstance(explanations_document, dict) or set(explanations_document) != {
        "schema", "explanations"
    }:
        raise UploadError("explanations.json has an inexact schema")
    if explanations_document["schema"] != "prove2me-mission-graph-explanations/v1":
        raise UploadError("unexpected explanations schema")
    explanations = explanations_document["explanations"]
    if not isinstance(explanations, dict) or set(explanations) != set(names):
        raise UploadError("explanations do not match the target set")

    solution_digests: dict[str, str] = {}
    earlier_names: set[str] = set()
    for target in targets:
        relative = Path(target["solution_path"])
        if relative.is_absolute() or ".." in relative.parts:
            raise UploadError(f"unsafe solution path: {relative}")
        data = (TRANSFER / relative).read_bytes()
        code = lean_code_without_comments(data)
        if re.search(r"\bsorry\b", code):
            raise UploadError(f"solution contains sorry: {relative}")
        if not re.search(r"(?m)^theorem\s+solution\s*(?::|\()", code):
            raise UploadError(f"solution has no top-level theorem solution: {relative}")
        actual_imports = imports_in(data)
        expected_imports = {
            "Definitions.Def_Erdos9796Mission",
            *(dependency["module"] for dependency in target["dependencies"]),
        }
        if actual_imports != expected_imports:
            raise UploadError(
                f"imports for {target['theorem_name']} differ from targets.json"
            )
        own_module = "Theorems.Thm_" + target["theorem_name"].replace(".", "_")
        if own_module in actual_imports:
            raise UploadError(f"solution imports its own target: {target['theorem_name']}")
        for dependency in target["dependencies"]:
            dependency_name = dependency["theorem_name"]
            if dependency_name in names and dependency_name not in earlier_names:
                raise UploadError(f"internal dependency is not earlier: {dependency_name}")
        earlier_names.add(target["theorem_name"])
        solution_digests[target["solution_path"]] = sha256(data)
        explanation = explanations[target["theorem_name"]]
        if not isinstance(explanation, str) or len(explanation.strip()) < 160:
            raise UploadError(f"explanation is too short: {target['theorem_name']}")

    package_record = {
        "targets": targets_document,
        "explanations": explanations_document,
        "solution_sha256": solution_digests,
    }
    return {
        "host": targets_document["host"],
        "version": targets_document["platform_version"],
        "targets": targets,
        "explanations": explanations,
        "solution_sha256": solution_digests,
        "package_sha256": sha256(canonical_bytes(package_record)),
    }


def read_key() -> str:
    credentials = load_json(WORKSPACE / "credentials.json")
    if not isinstance(credentials, dict):
        raise UploadError("credentials.json must contain an object")
    key = credentials.get("api_key")
    if not isinstance(key, str) or not key.strip():
        raise UploadError("credentials.json has no API key")
    return key


class Client:
    def __init__(
        self, host: str, version: str, poll_interval: float, poll_timeout: float
    ) -> None:
        self.host = host
        self.version = version
        self.poll_interval = poll_interval
        self.poll_timeout = poll_timeout
        self.access_token: str | None = None
        self.token_expires_at = 0.0

    def _raw_request(
        self,
        method: str,
        path: str,
        *,
        body: bytes | None = None,
        content_type: str = "application/json",
        token: str | None = None,
    ) -> Any:
        headers = {"Authorization": f"Bearer {token}"} if token else {}
        if body is not None:
            headers["Content-Type"] = content_type
        request = Request(self.host + path, data=body, headers=headers, method=method)
        try:
            with urlopen(request, timeout=60) as response:
                raw = response.read()
        except (HTTPError, URLError) as error:
            raise UploadError(
                f"Prove2Me request failed: {getattr(error, 'code', error)}"
            ) from error
        if not raw:
            return None
        try:
            return json.loads(raw)
        except json.JSONDecodeError as error:
            raise UploadError("Prove2Me returned invalid JSON") from error

    def refresh(self) -> None:
        response = self._raw_request(
            "POST",
            "/agent/refresh",
            body=json.dumps({"api_key": read_key()}).encode("utf-8"),
        )
        if not isinstance(response, dict) or not isinstance(
            response.get("access_token"), str
        ):
            raise UploadError("agent refresh returned no access token")
        if response.get("version") != self.version:
            raise UploadError("Prove2Me API version differs from the local package")
        self.access_token = response["access_token"]
        try:
            self.token_expires_at = float(response["expires_at"])
        except (KeyError, TypeError, ValueError) as error:
            raise UploadError("agent refresh returned no token expiry") from error

    def request(
        self,
        method: str,
        path: str,
        *,
        body: bytes | None = None,
        content_type: str = "application/json",
    ) -> Any:
        if self.access_token is None or time.time() >= self.token_expires_at - 60:
            self.refresh()
        return self._raw_request(
            method,
            path,
            body=body,
            content_type=content_type,
            token=self.access_token,
        )

    def theorem_by_id(self, theorem_id: str) -> dict[str, Any]:
        response = self.request("GET", f"/theorems/{theorem_id}")
        if isinstance(response, dict) and isinstance(response.get("theorem"), dict):
            response = response["theorem"]
        if not isinstance(response, dict):
            raise UploadError("invalid theorem lookup response")
        return response

    def poll_submission(self, submission_id: str) -> dict[str, Any]:
        deadline = time.monotonic() + self.poll_timeout
        while True:
            response = self.request("GET", f"/verify?submission_id={submission_id}")
            if not isinstance(response, dict):
                raise UploadError("invalid verification response")
            status = str(response.get("status", "")).upper()
            if status in TERMINAL_OK or status in TERMINAL_FAILURE:
                return response
            if status not in {"PENDING", "COMPILING"}:
                return response
            if time.monotonic() >= deadline:
                raise UploadError("verification polling timed out")
            time.sleep(self.poll_interval)


def new_receipt(package: dict[str, Any]) -> dict[str, Any]:
    return {
        "schema": RECEIPT_SCHEMA,
        "host": package["host"],
        "platform_version": package["version"],
        "package_sha256": package["package_sha256"],
        "targets": {
            target["theorem_name"]: target["theorem_id"]
            for target in package["targets"]
        },
        "solutions": {},
        "intents": {},
    }


def check_receipt(receipt: Any, package: dict[str, Any]) -> dict[str, Any]:
    expected = new_receipt(package)
    if not isinstance(receipt, dict):
        raise UploadError("receipt must contain an object")
    for key in ("schema", "host", "platform_version", "package_sha256", "targets"):
        if receipt.get(key) != expected[key]:
            raise UploadError(f"receipt {key} does not match this package")
    if not isinstance(receipt.get("solutions"), dict) or not isinstance(
        receipt.get("intents"), dict
    ):
        raise UploadError("receipt solution or intent records are malformed")
    return receipt


def multipart_body(
    target: dict[str, Any],
    explanation: str,
    solution: bytes,
    package_sha256: str,
) -> tuple[bytes, str]:
    boundary = hashlib.sha256(
        f"{package_sha256}:{target['theorem_id']}".encode("ascii")
    ).hexdigest()[:32]
    fields = {
        "theorem_id": target["theorem_id"],
        "proof_type": "prove",
        "explanation": explanation,
    }
    parts: list[bytes] = []
    marker = boundary.encode("ascii")
    for key, value in fields.items():
        parts.extend(
            [
                b"--" + marker,
                b'Content-Disposition: form-data; name="' + key.encode("ascii") + b'"',
                b"",
                value.encode("utf-8"),
            ]
        )
    parts.extend(
        [
            b"--" + marker,
            b'Content-Disposition: form-data; name="file"; filename="solution.lean"',
            b"Content-Type: text/plain",
            b"",
            solution,
            b"--" + marker + b"--",
            b"",
        ]
    )
    return b"\r\n".join(parts), boundary


def verify_remote_record(
    remote: dict[str, Any],
    theorem_id: str,
    theorem_name: str,
    formal_statement: str | None,
) -> str:
    identifier = remote.get("theorem_id") or remote.get("id")
    if identifier != theorem_id or remote.get("theorem_name") != theorem_name:
        raise UploadError(f"remote theorem binding mismatch: {theorem_name}")
    if formal_statement is not None and remote.get("formal_statement") != formal_statement:
        raise UploadError(f"remote formal statement mismatch: {theorem_name}")
    status = str(remote.get("status", "")).upper()
    if status not in {"OPEN", "PROVED"}:
        raise UploadError(f"remote theorem has unusable status {status}: {theorem_name}")
    return status


def execute(package: dict[str, Any], receipt_path: Path, client: Client) -> None:
    if receipt_path.is_file():
        receipt = check_receipt(load_json(receipt_path), package)
    else:
        receipt = new_receipt(package)
        dump_json(receipt_path, receipt)

    remote_targets: dict[str, dict[str, Any]] = {}
    remote_records: dict[str, dict[str, Any]] = {}
    dependency_bindings: dict[str, tuple[str, str]] = {}

    def fetch_remote(theorem_id: str) -> dict[str, Any]:
        if theorem_id not in remote_records:
            remote_records[theorem_id] = client.theorem_by_id(theorem_id)
        return remote_records[theorem_id]

    for target in package["targets"]:
        remote = fetch_remote(target["theorem_id"])
        verify_remote_record(
            remote,
            target["theorem_id"],
            target["theorem_name"],
            target["formal_statement"],
        )
        remote_targets[target["theorem_name"]] = remote
        for dependency in target["dependencies"]:
            binding = (
                dependency["theorem_name"],
                dependency["module"],
            )
            old_binding = dependency_bindings.get(dependency["theorem_id"])
            if old_binding is not None and old_binding != binding:
                raise UploadError(
                    f"dependency ID has conflicting bindings: {dependency['theorem_id']}"
                )
            dependency_bindings[dependency["theorem_id"]] = binding
    for theorem_id, (theorem_name, _module) in dependency_bindings.items():
        verify_remote_record(
            fetch_remote(theorem_id), theorem_id, theorem_name, None
        )

    for target in package["targets"]:
        name = target["theorem_name"]
        entry = receipt["solutions"].get(name, {})
        if str(entry.get("status", "")).upper() in TERMINAL_OK:
            continue
        remote_status = str(remote_targets[name].get("status", "")).upper()
        if remote_status == "PROVED":
            receipt["solutions"][name] = {
                "status": "REMOTE_PROVED",
                "theorem_id": target["theorem_id"],
            }
            dump_json(receipt_path, receipt)
            continue
        if entry.get("submission_id"):
            result = client.poll_submission(entry["submission_id"])
        else:
            intent_key = f"solution:{target['theorem_id']}"
            old_intent = receipt["intents"].get(intent_key)
            if old_intent and old_intent.get("state") == "POST_INTENT":
                raise UploadError(
                    f"uncertain prior verification POST for {name}; "
                    "refusing a duplicate request"
                )
            solution = (TRANSFER / target["solution_path"]).read_bytes()
            explanation = package["explanations"][name]
            body, boundary = multipart_body(
                target, explanation, solution, package["package_sha256"]
            )
            receipt["intents"][intent_key] = {
                "state": "POST_INTENT",
                "theorem_id": target["theorem_id"],
                "payload_sha256": sha256(body),
                "solution_sha256": sha256(solution),
                "explanation_sha256": sha256(explanation.encode("utf-8")),
            }
            dump_json(receipt_path, receipt)
            try:
                response = client.request(
                    "POST",
                    "/verify",
                    body=body,
                    content_type=f"multipart/form-data; boundary={boundary}",
                )
            except UploadError as error:
                raise UploadError(
                    f"uncertain verification POST for {name}; refusing retry"
                ) from error
            if not isinstance(response, dict):
                raise UploadError(
                    f"uncertain verification POST for {name}; invalid response"
                )
            submission_id = response.get("submission_id") or response.get("id")
            if not isinstance(submission_id, str) or not submission_id:
                raise UploadError(
                    f"uncertain verification POST for {name}; no submission ID"
                )
            entry = {
                "status": str(response.get("status", "PENDING")).upper(),
                "submission_id": submission_id,
                "theorem_id": target["theorem_id"],
            }
            receipt["solutions"][name] = entry
            receipt["intents"][intent_key].update(
                {
                    "state": "RESPONSE_RECORDED",
                    "submission_id": submission_id,
                }
            )
            dump_json(receipt_path, receipt)
            result = client.poll_submission(submission_id)
        status = str(result.get("status", "")).upper()
        entry["status"] = status
        if result.get("error_message"):
            entry["error_message"] = result["error_message"]
        dump_json(receipt_path, receipt)
        if status not in TERMINAL_OK:
            raise UploadError(f"verification ended with {status}: {name}")


def parse_args(argv: list[str] | None = None) -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    mode = parser.add_mutually_exclusive_group()
    mode.add_argument("--execute", action="store_true", help="perform network submissions")
    mode.add_argument("--dry-run", action="store_true", help="validate locally (default)")
    parser.add_argument("--receipt", type=Path, default=DEFAULT_RECEIPT)
    parser.add_argument("--poll-interval", type=float, default=3.0)
    parser.add_argument("--poll-timeout", type=float, default=3600.0)
    return parser.parse_args(argv)


def main(argv: list[str] | None = None) -> int:
    args = parse_args(argv)
    try:
        package = load_package()
        if not args.execute:
            print(
                "dry-run: validated 3 ordered reduction solutions; "
                f"package_sha256={package['package_sha256']}; no network calls"
            )
            return 0
        client = Client(
            package["host"],
            package["version"],
            args.poll_interval,
            args.poll_timeout,
        )
        execute(package, args.receipt, client)
    except (UploadError, OSError, KeyError, TypeError, ValueError) as error:
        print(f"upload failed closed: {error}", file=sys.stderr)
        return 2
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
