"""Upload the generated counting dependency graph to Prove2Me.

The command is deliberately a dry run unless ``--execute`` is supplied.  The
receipt is the source of truth for an interrupted execution: IDs are written
before their corresponding asynchronous jobs or submissions are polled.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import re
import subprocess
import sys
import time
from pathlib import Path
from typing import Any
from urllib.error import HTTPError, URLError
from urllib.parse import urlencode
from urllib.request import Request, urlopen

HOST = "https://prove2.me/api/v1"
MISSION_ID = "1061a384-cdea-43b4-adb5-273627ea45a0"
ROOT_THEOREM_ID = "c35e1c76-5531-4585-9ced-8c47a929793e"
ROOT_PLATFORM_NAME = "Erdos9796Mission.counterexample_card_ge_nine"
ROOT_SOURCE_NAME = "Problem97.counterexample_card_ge_nine"
TRANSFER = Path(__file__).resolve().parent
REPO_ROOT = TRANSFER.parents[1]
WORKSPACE = Path.home() / "prove2me_workspace"
RECEIPT_SCHEMA = "prove2me-counting-transfer-receipt/v1"
TAG = "erdos-97-96-counting"
GITHUB_REPOSITORY = "https://github.com/mysticflounder/erdos-97-96-formalization"
EXPECTED_PLATFORM_VERSION = "0.9.8"
TERMINAL_JOB_OK = "PUBLISHED"
TERMINAL_SUBMISSION_OK = {"ACCEPTED", "SKETCH_ACCEPTED"}
TERMINAL_FAILURE = {"FAILED", "ERROR"}
TRANSIENT_SUBMISSION_ERRORS = {
    "Failed to resolve platform imports: Import parser timed out after 5s",
}


class UploadError(RuntimeError):
    """A local artifact or remote response violates the upload contract."""


def sha256_bytes(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def sha256_file(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        for chunk in iter(lambda: stream.read(1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest()


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
        json.dumps(value, indent=2, sort_keys=True, ensure_ascii=False) + "\n",
        encoding="utf-8",
    )
    temporary.replace(path)


def definition_module(module: str) -> str:
    prefix = "Erdos9796Proof.P97."
    if not module.startswith(prefix):
        raise UploadError(f"unexpected definition module: {module}")
    return "Definitions.Def_Erdos9796Counting_" + module.removeprefix(prefix).replace(".", "_")


def theorem_module(name: str) -> str:
    return f"Theorems.Thm_{name.replace('.', '_')}"


def blob_source(commit: str, relative: str, path: Path) -> str:
    line_count = len(path.read_text(encoding="utf-8").splitlines())
    repo_relative = relative.removeprefix("prove2me/")
    return f"{GITHUB_REPOSITORY}/blob/{commit}/prove2me/{repo_relative}#L1-L{line_count}"


def lean_code_without_comments(data: bytes) -> str:
    """Remove Lean comments and string literals for a conservative sorry scan."""
    text = data.decode("utf-8")
    output: list[str] = []
    i = 0
    depth = 0
    in_string = False
    while i < len(text):
        if depth:
            if text.startswith("/-", i):
                depth += 1
                i += 2
            elif text.startswith("-/", i):
                depth -= 1
                i += 2
            else:
                i += 1
        elif in_string:
            if text[i] == "\\":
                i += 2
            elif text[i] == '"':
                in_string = False
                i += 1
            else:
                i += 1
        elif text.startswith("/-", i):
            depth = 1
            i += 2
        elif text.startswith("--", i):
            end = text.find("\n", i)
            i = len(text) if end < 0 else end
        elif text[i] == '"':
            in_string = True
            i += 1
        else:
            output.append(text[i])
            i += 1
    return "".join(output)


def canonical_plan_sha256(plan: dict[str, Any]) -> str:
    data = (json.dumps(plan, sort_keys=True, ensure_ascii=False) + "\n").encode()
    return sha256_bytes(data)


def validate_manifest(manifest: dict[str, Any], plan: dict[str, Any]) -> None:
    if manifest.get("schema") != "prove2me-platform-generation-manifest/v1":
        raise UploadError("unsupported generation manifest schema")
    if plan.get("schema") != "prove2me-full-project-plan/v1":
        raise UploadError("unsupported full-project plan schema")
    if not plan.get("generation_ready"):
        raise UploadError("generation plan is not ready")
    if manifest.get("plan_sha256") != canonical_plan_sha256(plan):
        raise UploadError("generation manifest does not match plan")
    unsigned = dict(manifest)
    claimed = unsigned.pop("canonical_payload_sha256", None)
    unsigned["canonical_payload_sha256"] = None
    expected = sha256_bytes(
        json.dumps(unsigned, sort_keys=True, separators=(",", ":"), ensure_ascii=False).encode()
    )
    if claimed != expected:
        raise UploadError("generation manifest canonical hash mismatch")
    files = manifest.get("files")
    if not isinstance(files, list) or not files:
        raise UploadError("generation manifest has no files")
    actual_counts: dict[str, int] = {}
    seen: set[Path] = set()
    for item in files:
        if not isinstance(item, dict):
            raise UploadError("generation manifest file entry is not an object")
        relative = Path(item.get("path", ""))
        if relative.is_absolute() or ".." in relative.parts:
            raise UploadError(f"unsafe generated path: {relative}")
        path = REPO_ROOT / relative
        if path in seen:
            raise UploadError(f"duplicate generated path: {relative}")
        seen.add(path)
        if not path.is_file():
            raise UploadError(f"missing generated file: {path}")
        if sha256_file(path) != item.get("sha256"):
            raise UploadError(f"generated file hash mismatch: {relative}")
        actual_counts[item.get("kind", "")] = actual_counts.get(item.get("kind", ""), 0) + 1
    if actual_counts != manifest.get("counts"):
        raise UploadError("generated file counts differ from manifest")
    expected_counts = {"definition-bundle": 17, "theorem-stub": 75, "solution": 75}
    if manifest.get("counts") != expected_counts:
        raise UploadError(f"unexpected generated counts: {manifest.get('counts')}")
    platform_root = REPO_ROOT / "submissions/counting-transfer/platform"
    actual_platform_files = {
        str(path.relative_to(REPO_ROOT))
        for path in platform_root.rglob("*.lean")
    }
    listed_platform_files = {str(item["path"]) for item in files}
    adapter_path = str(manifest["adapter"]["path"])
    adapter_file = REPO_ROOT / adapter_path
    if not adapter_file.is_file() or sha256_file(adapter_file) != manifest["adapter"].get("sha256"):
        raise UploadError("compatibility adapter hash mismatch")
    if actual_platform_files != listed_platform_files | {adapter_path}:
        raise UploadError("platform tree is incomplete or contains extra Lean files")
    for relative in actual_platform_files - {adapter_path}:
        if "import Definitions.Def_Erdos9796Counting_Adapter" not in (
            REPO_ROOT / relative
        ).read_text(encoding="utf-8"):
            raise UploadError(f"generated file does not import the compatibility adapter: {relative}")
    root = manifest.get("existing_root_stub")
    if not isinstance(root, dict):
        raise UploadError("missing existing root stub record")
    root_relative = Path(str(root.get("path", "")))
    if root_relative.is_absolute() or ".." in root_relative.parts:
        raise UploadError("existing root stub path is outside the repository")
    root_path = REPO_ROOT / root_relative
    if not root_path.is_file() or sha256_file(root_path) != root.get("sha256"):
        raise UploadError("existing root theorem stub does not match manifest")


def validate_dag(plan: dict[str, Any]) -> None:
    order = plan["node_upload_order"]
    positions = {command_id: index for index, command_id in enumerate(order)}
    for command_id, dependencies in plan.get("node_edges", {}).items():
        if command_id not in positions:
            raise UploadError("theorem edge references an unknown node")
        for dependency in dependencies:
            if dependency not in positions or positions[dependency] >= positions[command_id]:
                raise UploadError("theorem order is not leaves-first")
    definition_order = plan["definition_bundle_order"]
    definition_positions = {module: index for index, module in enumerate(definition_order)}
    for module, dependencies in plan.get("definition_bundle_edges", {}).items():
        if module not in definition_positions:
            raise UploadError("definition edge references an unknown bundle")
        for dependency in dependencies:
            if dependency not in definition_positions or definition_positions[dependency] >= definition_positions[module]:
                raise UploadError("definition order is not topological")


def validate_validation_gate(
    package_files: list[Path], sorry_files: list[Path], validation_path: Path, expected_payload_hash: str
) -> None:
    validation = load_json(validation_path)
    if not isinstance(validation, dict) or validation.get("schema") != "prove2me-prepared-proof-validation/v1":
        raise UploadError("missing or unsupported validation.json gate")
    if validation.get("status") not in {"locally_validated_not_submitted", "accepted"}:
        raise UploadError("validation gate is not locally successful")
    if validation.get("exit_code") != 0 or validation.get("exact_target_application_checked") is not True:
        raise UploadError("validation gate lacks exact successful target checks")
    axioms = validation.get("axioms")
    if not isinstance(axioms, list) or set(axioms) != {"propext", "Classical.choice", "Quot.sound"}:
        raise UploadError("validation gate has disallowed or missing axioms")
    if not isinstance(validation.get("command"), list) or not validation.get("log"):
        raise UploadError("validation gate lacks exact build evidence")
    if validation.get("canonical_payload_sha256") != expected_payload_hash:
        raise UploadError("validation gate canonical payload hash mismatch")
    self_key = next(
        (key for key in ("self_sha256", "validation_sha256", "canonical_self_sha256") if key in validation),
        None,
    )
    if self_key is None or not isinstance(validation.get(self_key), str):
        raise UploadError("validation gate lacks a canonical self-hash")
    claimed_self_hash = validation[self_key]
    unsigned_validation = dict(validation)
    unsigned_validation[self_key] = None
    expected_self_hash = sha256_bytes(
        json.dumps(unsigned_validation, sort_keys=True, separators=(",", ":"), ensure_ascii=False).encode()
    )
    if claimed_self_hash != expected_self_hash:
        raise UploadError("validation gate canonical self-hash mismatch")
    log_path = Path(validation.get("log", ""))
    log_path = log_path if log_path.is_absolute() else REPO_ROOT / log_path
    if not log_path.is_file() or validation.get("log_sha256") != sha256_file(log_path):
        raise UploadError("validation gate build evidence is missing or tampered")
    type_comparison = validation.get("type_comparison")
    if (
        not isinstance(type_comparison, dict)
        or type_comparison.get("exact_source_types") != 74
        or type_comparison.get("total_nodes") != 75
        or type_comparison.get("root_solution_target_is_defeq") is not True
    ):
        raise UploadError("validation gate lacks the 74/75 source-type comparison")
    axiom_audit = validation.get("axiom_audit")
    if (
        not isinstance(axiom_audit, dict)
        or axiom_audit.get("nodes_checked") != 75
        or axiom_audit.get("all_within_allowed") is not True
        or axiom_audit.get("target_exactly_allowed") is not True
    ):
        raise UploadError("validation gate lacks the complete 75-node axiom audit")
    for evidence in (type_comparison, axiom_audit):
        report = Path(evidence["report"])
        report = report if report.is_absolute() else REPO_ROOT / report
        if not report.is_file() or sha256_file(report) != evidence.get("report_sha256"):
            raise UploadError(f"validation evidence is missing or tampered: {evidence['report']}")
    root_log = Path(type_comparison["root_defeq_log"])
    root_log = root_log if root_log.is_absolute() else REPO_ROOT / root_log
    if not root_log.is_file() or sha256_file(root_log) != type_comparison.get("root_defeq_log_sha256"):
        raise UploadError("root defeq evidence is missing or tampered")
    files_sha256 = validation.get("files_sha256")
    if not isinstance(files_sha256, dict):
        raise UploadError("validation gate lacks file hashes")
    for path in package_files:
        candidates = (str(path.relative_to(REPO_ROOT)), path.name, str(path.relative_to(REPO_ROOT / "submissions/counting-transfer/platform")))
        found = next((files_sha256[key] for key in candidates if key in files_sha256), None)
        if found != sha256_file(path):
            raise UploadError(f"validation gate hash mismatch: {path.name}")
    for path in sorry_files:
        if re.search(r"\bsorry\b", lean_code_without_comments(path.read_bytes())):
            raise UploadError(f"sorry remains in generated code: {path.name}")


def validate_artifact_commit(commit: str, package: dict[str, Any]) -> None:
    if not re.fullmatch(r"[0-9a-fA-F]{40}", commit):
        raise UploadError("--artifact-commit must be a 40-hex commit")
    check = subprocess.run(["git", "cat-file", "-e", f"{commit}^{{commit}}"], cwd=REPO_ROOT, capture_output=True, text=True, check=False)
    if check.returncode:
        raise UploadError("artifact commit is not present in this repository")
    paths = ["submissions/counting-transfer/plan.json", "submissions/counting-transfer/generation-manifest.json", "submissions/counting-transfer/metadata.json", "submissions/counting-transfer/explanation.md", "mission-description.md", "submissions/counting-transfer/validation.json"]
    paths.extend(item["path"] for item in package["manifest"]["files"])
    paths.append(package["manifest"]["adapter"]["path"])
    status = subprocess.run(["git", "status", "--porcelain", "--untracked-files=all", "--", *paths], cwd=REPO_ROOT, capture_output=True, text=True, check=False)
    if status.returncode or status.stdout:
        raise UploadError("artifact payload paths are dirty or uncommitted")
    diff = subprocess.run(["git", "diff", "--quiet", commit, "--", *paths], cwd=REPO_ROOT, check=False)
    if diff.returncode:
        raise UploadError("artifact commit does not match the local payload")


def command_maps(plan: dict[str, Any]) -> tuple[dict[str, dict[str, Any]], dict[str, str]]:
    commands = plan.get("commands")
    if not isinstance(commands, list):
        raise UploadError("plan commands are missing")
    by_id = {item.get("id"): item for item in commands}
    by_name: dict[str, str] = {}
    for item in commands:
        for name in item.get("user_names", []):
            by_name[name] = item["id"]
    return by_id, by_name


def platform_name(command: dict[str, Any], target: str) -> str:
    if target in command.get("names", []):
        return ROOT_PLATFORM_NAME
    names = command.get("user_names", [])
    if len(names) != 1 or not all(part.isascii() and re.fullmatch(r"[A-Za-z_][A-Za-z0-9_]*", part)
                                   for part in names[0].split(".")):
        raise UploadError(f"non-conservative theorem name in plan: {names}")
    return names[0]


def parse_stub(path: Path) -> tuple[str, str]:
    text = path.read_text(encoding="utf-8")
    matches = list(re.finditer(r"(?m)^(?:theorem|lemma)\s+", text))
    if len(matches) != 1:
        raise UploadError(f"expected one theorem declaration in {path}")
    end = text.find(":= by sorry", matches[0].start())
    if end < 0:
        raise UploadError(f"theorem stub is not an open sorry stub: {path}")
    end += len(":= by sorry")
    formal = text[matches[0].start():end].strip()
    return text[:matches[0].start()].strip(), formal


def load_package(*, require_remote_ready: bool = False, artifact_commit: str | None = None) -> dict[str, Any]:
    plan = load_json(TRANSFER / "plan.json")
    manifest = load_json(TRANSFER / "generation-manifest.json")
    metadata = load_json(TRANSFER / "metadata.json")
    validate_manifest(manifest, plan)
    if metadata.get("schema") != "prove2me-counting-metadata/v1":
        raise UploadError("unsupported metadata schema")
    items = metadata.get("items")
    if not isinstance(items, list) or len(items) != 75:
        raise UploadError("metadata must contain exactly 75 theorem records")
    required_metadata = {
        "theorem_name", "theorem_title", "natural_language_statement", "source", "tags",
        "proof_explanation", "attribution_class", "attribution_note",
    }
    for item in items:
        if not isinstance(item, dict) or not required_metadata <= item.keys():
            raise UploadError("metadata record is incomplete")
        if not all(
            isinstance(item[field], str) and item[field]
            for field in (
                "theorem_name", "theorem_title", "natural_language_statement", "source",
                "attribution_class", "attribution_note",
            )
        ):
            raise UploadError("metadata text fields must be non-empty strings")
        if not isinstance(item["proof_explanation"], str) or len(item["proof_explanation"].strip()) < 80:
            raise UploadError(f"proof explanation is missing or too short: {item.get('theorem_name')}")
        if item["proof_explanation"].strip().lower() in {"proof omitted", "generated explanation", "see source", "tbd"}:
            raise UploadError(f"proof explanation is too generic: {item.get('theorem_name')}")
        if not isinstance(item["tags"], list) or not all(isinstance(tag, str) for tag in item["tags"]):
            raise UploadError("metadata tags must be a list of strings")
    metadata_by_name = {item["theorem_name"]: item for item in items}
    if len(metadata_by_name) != 75:
        raise UploadError("metadata theorem names are not unique")
    commands, _ = command_maps(plan)
    validate_dag(plan)
    order = plan.get("node_upload_order")
    if not isinstance(order, list) or len(order) != 75 or set(order) != set(plan.get("nodes", [])):
        raise UploadError("node upload order does not cover the planned nodes")
    nodes: list[dict[str, Any]] = []
    files = {item["path"]: item for item in manifest["files"]}
    for command_id in order:
        command = commands.get(command_id)
        if command is None:
            raise UploadError(f"unknown node command: {command_id}")
        name = platform_name(command, plan["target"])
        source_name = ROOT_SOURCE_NAME if name == ROOT_PLATFORM_NAME else name
        metadata_item = metadata_by_name.get(source_name)
        if metadata_item is None:
            raise UploadError(f"missing metadata for {source_name}")
        slug = name.replace(".", "_")
        theorem_path = f"submissions/counting-transfer/platform/Theorems/Thm_{slug}.lean"
        solution_path = f"submissions/counting-transfer/platform/Solutions/Sol_{slug}.lean"
        if theorem_path not in files or solution_path not in files:
            raise UploadError(f"missing theorem/solution pair for {name}")
        preamble, formal = parse_stub(REPO_ROOT / theorem_path)
        solution = REPO_ROOT / solution_path
        if re.search(r"\bsorry\b", lean_code_without_comments(solution.read_bytes())):
            raise UploadError(f"solution retains sorry: {solution_path}")
        nodes.append({
            "command_id": command_id,
            "name": name,
            "source_name": source_name,
            "metadata": metadata_item,
            "theorem_path": theorem_path,
            "solution_path": solution_path,
            "preamble": preamble,
            "formal_statement": formal,
            "root": name == ROOT_PLATFORM_NAME,
        })
    definitions: list[dict[str, Any]] = [{
        "module": "Definitions.Def_Erdos9796Counting_Adapter",
        "name": "Erdos9796Counting_Adapter",
        "path": str(manifest["adapter"]["path"]),
        "source_module": "compatibility adapter",
        "source_url": None,
    }]
    bundles = {item["path"]: item for item in manifest["files"] if item["kind"] == "definition-bundle"}
    for module in plan.get("definition_bundle_order", []):
        module_name = definition_module(module)
        relative = f"submissions/counting-transfer/platform/{module_name.replace('.', '/')}.lean"
        if relative not in bundles:
            raise UploadError(f"missing definition bundle for {module}")
        definitions.append({
            "module": module_name,
            "name": module_name.removeprefix("Definitions.Def_"),
            "path": relative,
            "source_module": module,
        })
    if len(definitions) != 18:
        raise UploadError("definition order does not contain adapter plus 17 bundles")
    explanation = TRANSFER / "explanation.md"
    mission_description = REPO_ROOT / "mission-description.md"
    validation_path = TRANSFER / "validation.json"
    if not explanation.is_file() or not mission_description.is_file():
        raise UploadError("missing explanation.md or mission-description.md")
    package_lean_files = [REPO_ROOT / item["path"] for item in manifest["files"]]
    adapter_file = REPO_ROOT / manifest["adapter"]["path"]
    package_lean_files.append(adapter_file)
    sorry_files = [
        path for path in package_lean_files
        if "/Definitions/" in str(path) or "/Solutions/" in str(path)
    ]
    validate_validation_gate(
        package_lean_files, sorry_files, validation_path, manifest["canonical_payload_sha256"]
    )
    if require_remote_ready:
        if not artifact_commit:
            raise UploadError("--artifact-commit is required for execute")
        provisional = {"manifest": manifest}
        validate_artifact_commit(artifact_commit, provisional)
    commit = artifact_commit.lower() if artifact_commit else None
    for node in nodes:
        node["source_url"] = blob_source(commit, node["theorem_path"], REPO_ROOT / node["theorem_path"]) if commit else None
        if node["root"] and commit:
            node["remote_source"] = node["metadata"]["source"] + "\nSource snapshot: " + node["source_url"]
        else:
            node["remote_source"] = node["source_url"] or node["metadata"]["source"]
    for definition in definitions:
        definition["source_url"] = blob_source(commit, definition["path"], REPO_ROOT / definition["path"]) if commit else None
    if require_remote_ready and any(
        not node["source_url"] or not node["source_url"].startswith("https://github.com/")
        for node in nodes
    ):
        raise UploadError("execute requires immutable artifact blob sources for every theorem")
    if require_remote_ready and any(
        not definition["source_url"] or not definition["source_url"].startswith("https://github.com/")
        for definition in definitions
    ):
        raise UploadError("execute requires immutable artifact blob sources for every definition")
    return {
        "plan": plan,
        "manifest": manifest,
        "metadata": metadata_by_name,
        "nodes": nodes,
        "definitions": definitions,
        "explanation": explanation,
        "mission_description": mission_description,
        "validation": validation_path,
        "artifact_commit": commit,
    }


def read_key() -> str:
    credentials_path = WORKSPACE / "credentials.json"
    credentials = load_json(credentials_path)
    if not isinstance(credentials, dict):
        raise UploadError("credentials.json must contain an object")
    key = credentials.get("api_key")
    if not isinstance(key, str) or not key.strip():
        raise UploadError("credentials.json has no API key")
    return key


class Client:
    def __init__(self, poll_interval: float, poll_timeout: float) -> None:
        self.poll_interval = poll_interval
        self.poll_timeout = poll_timeout
        self.access_token: str | None = None
        self.token_expires_at = 0.0

    def _raw_request(self, method: str, path: str, *, body: bytes | None = None,
                     content_type: str = "application/json", query: dict[str, str] | None = None,
                     token: str | None = None) -> Any:
        url = HOST + path
        if query:
            url += "?" + urlencode(query)
        headers = {"Authorization": f"Bearer {token}"} if token else {}
        if body is not None:
            headers["Content-Type"] = content_type
        request = Request(url, data=body, headers=headers, method=method)
        try:
            with urlopen(request, timeout=60) as response:
                raw = response.read()
        except (HTTPError, URLError) as error:
            raise UploadError(f"Prove2Me request failed: {getattr(error, 'code', error)}") from error
        if not raw:
            return None
        try:
            return json.loads(raw)
        except json.JSONDecodeError as error:
            raise UploadError("Prove2Me returned invalid JSON") from error

    def refresh(self) -> None:
        response = self._raw_request(
            "POST", "/agent/refresh",
            body=json.dumps({"api_key": read_key()}).encode(),
        )
        if not isinstance(response, dict) or not isinstance(response.get("access_token"), str):
            raise UploadError("agent refresh returned no access token")
        if response.get("version") != EXPECTED_PLATFORM_VERSION:
            raise UploadError("Prove2Me API version differs from the local skill")
        self.access_token = response["access_token"]
        try:
            self.token_expires_at = float(response["expires_at"])
        except (KeyError, TypeError, ValueError) as error:
            raise UploadError("agent refresh returned no token expiry") from error

    def request(self, method: str, path: str, *, body: bytes | None = None,
                content_type: str = "application/json", query: dict[str, str] | None = None) -> Any:
        if path != "/agent/refresh" and (self.access_token is None or time.time() >= self.token_expires_at - 60):
            self.refresh()
        return self._raw_request(method, path, body=body, content_type=content_type, query=query, token=self.access_token)

    def json_request(self, method: str, path: str, payload: dict[str, Any]) -> Any:
        return self.request(method, path, body=json.dumps(payload, ensure_ascii=False).encode())

    def theorem_by_id(self, theorem_id: str) -> dict[str, Any]:
        response = self.request("GET", f"/theorems/{theorem_id}")
        if isinstance(response, dict) and isinstance(response.get("theorem"), dict):
            response = response["theorem"]
        if not isinstance(response, dict):
            raise UploadError("invalid theorem lookup response")
        return response

    def lookup_exact(self, name: str, *, definition: bool = False) -> dict[str, Any] | None:
        query = {"q": name} if definition else {"theorem_name": name}
        if definition:
            query["status"] = "Definition"
        response = self.request("GET", "/theorems", query=query)
        if isinstance(response, dict):
            candidates = response.get("theorems", response.get("items", []))
        else:
            candidates = response
        if not isinstance(candidates, list):
            raise UploadError("invalid theorem lookup response")
        if definition:
            exact = [
                item for item in candidates
                if isinstance(item, dict)
                and (item.get("definition_name") or item.get("theorem_name")) == name
            ]
        else:
            exact = [item for item in candidates if isinstance(item, dict) and item.get("theorem_name") == name]
        if len(exact) > 1:
            raise UploadError(f"ambiguous remote lookup: {name}")
        return exact[0] if exact else None

    def poll_job(self, job_id: str) -> dict[str, Any]:
        deadline = time.monotonic() + self.poll_timeout
        while True:
            response = self.request("GET", f"/publish-jobs/{job_id}")
            if not isinstance(response, dict):
                raise UploadError("invalid publish-job response")
            status = response.get("status")
            if status == TERMINAL_JOB_OK:
                return response
            if status in TERMINAL_FAILURE:
                return response
            if status not in {"PENDING", "COMPILING"}:
                return response
            if time.monotonic() >= deadline:
                raise UploadError("publish-job polling timed out")
            time.sleep(self.poll_interval)

    def poll_submission(self, submission_id: str) -> dict[str, Any]:
        deadline = time.monotonic() + self.poll_timeout
        while True:
            response = self.request("GET", "/verify", query={"submission_id": submission_id})
            if not isinstance(response, dict):
                raise UploadError("invalid verification response")
            status = response.get("status")
            if status in TERMINAL_SUBMISSION_OK:
                return response
            if status in TERMINAL_FAILURE:
                return response
            if status not in {"PENDING", "COMPILING"}:
                return response
            if time.monotonic() >= deadline:
                raise UploadError("verification polling timed out")
            time.sleep(self.poll_interval)


def save_receipt(path: Path, receipt: dict[str, Any]) -> None:
    dump_json(path, receipt)


def new_receipt(package: dict[str, Any]) -> dict[str, Any]:
    return {
        "schema": RECEIPT_SCHEMA,
        "host": HOST,
        "mission_id": MISSION_ID,
        "root_theorem_id": ROOT_THEOREM_ID,
        "plan_sha256": package["manifest"]["plan_sha256"],
        "manifest_sha256": package["manifest"]["canonical_payload_sha256"],
        "definitions": {},
        "theorems": {ROOT_PLATFORM_NAME: {"status": "BOUND", "theorem_id": ROOT_THEOREM_ID}},
        "solutions": {},
        "patches": {},
        "intents": {},
    }


def check_receipt(receipt: dict[str, Any], package: dict[str, Any]) -> None:
    if receipt.get("schema") != RECEIPT_SCHEMA or receipt.get("host") != HOST:
        raise UploadError("receipt schema or host mismatch")
    if receipt.get("mission_id") != MISSION_ID or receipt.get("root_theorem_id") != ROOT_THEOREM_ID:
        raise UploadError("receipt mission or root theorem mismatch")
    if receipt.get("plan_sha256") != package["manifest"]["plan_sha256"]:
        raise UploadError("receipt belongs to a different generation plan")
    if receipt.get("manifest_sha256") != package["manifest"]["canonical_payload_sha256"]:
        raise UploadError("receipt belongs to a different generation manifest")
    theorem_receipts = receipt.get("theorems")
    if not isinstance(theorem_receipts, dict):
        raise UploadError("receipt theorem records are malformed")
    if not isinstance(receipt.get("intents"), dict):
        raise UploadError("receipt intents are malformed")
    root_entry = theorem_receipts.get(ROOT_PLATFORM_NAME, {})
    if root_entry.get("theorem_id") != ROOT_THEOREM_ID:
        raise UploadError("receipt root theorem binding mismatch")


def set_intent(receipt: dict[str, Any], receipt_path: Path, kind: str, name: str, payload: bytes) -> dict[str, Any]:
    key = f"{kind}:{name}"
    intent = receipt["intents"].get(key)
    if intent and intent.get("state") == "POST_INTENT" and not intent.get("id"):
        raise UploadError(f"uncertain prior {kind} POST for {name}; reconcile manually")
    intent = {"state": "POST_INTENT", "payload_sha256": sha256_bytes(payload)}
    receipt["intents"][key] = intent
    save_receipt(receipt_path, receipt)
    return intent


def mark_intent(receipt: dict[str, Any], receipt_path: Path, kind: str, name: str, **values: Any) -> None:
    receipt["intents"][f"{kind}:{name}"].update(values)
    receipt["intents"][f"{kind}:{name}"]["state"] = "RESPONSE_RECORDED"
    save_receipt(receipt_path, receipt)


def remote_id(record: dict[str, Any], *, definition: bool = False) -> str | None:
    keys = ("definition_id", "id") if definition else ("theorem_id", "id")
    return next((record.get(key) for key in keys if isinstance(record.get(key), str)), None)


def recover_uncertain_publish(
    client: Client, receipt: dict[str, Any], receipt_path: Path, kind: str, name: str, *,
    definition: bool, expected_formal: str | None = None, expected_definition: str | None = None
) -> dict[str, Any] | None:
    intent = receipt["intents"].get(f"{kind}:{name}")
    if not intent or intent.get("state") != "POST_INTENT" or intent.get("id"):
        return None
    remote = reconcile_publish(
        client, name, definition=definition,
        expected_formal=expected_formal, expected_definition=expected_definition,
    )
    if remote is None:
        raise UploadError(f"uncertain prior {kind} POST for {name}; refusing retry")
    identifier = remote_id(remote, definition=definition)
    if not identifier:
        raise UploadError(f"remote reconciliation returned no ID for {name}")
    mark_intent(receipt, receipt_path, kind, name, id=identifier)
    return {"status": "PUBLISHED", "theorem_id": identifier}


def preflight_root(client: Client, node: dict[str, Any]) -> None:
    remote = client.theorem_by_id(ROOT_THEOREM_ID)
    if remote_id(remote) != ROOT_THEOREM_ID or remote.get("theorem_name") != ROOT_PLATFORM_NAME:
        raise UploadError("fixed root theorem ID did not exact-match remote theorem")
    if remote.get("formal_statement") != node["formal_statement"]:
        raise UploadError("remote root formal statement differs from local stub")
    if remote.get("status") not in {"Open", "OPEN", "Proved", "PROVED"}:
        raise UploadError("remote root theorem has a non-publishable status")


def reconcile_publish(
    client: Client, name: str, *, definition: bool,
    expected_formal: str | None = None, expected_definition: str | None = None
) -> dict[str, Any] | None:
    remote = client.lookup_exact(name, definition=definition)
    if remote is None:
        return None
    if definition:
        code = remote.get("definition") or remote.get("definitions") or remote.get("code")
        digest = next(
            (remote.get(key) for key in (
                "definition_sha256", "definition_hash", "code_sha256", "code_hash", "sha256",
            ) if remote.get(key)),
            None,
        )
        if expected_definition is None or (
            code is None and digest is None
        ) or (
            code is not None and code != expected_definition
        ) or (
            digest is not None and digest != sha256_bytes(expected_definition.encode())
        ):
            raise UploadError(f"remote definition does not exactly match local payload: {name}")
    elif remote.get("formal_statement") != expected_formal:
        raise UploadError(f"remote theorem does not exactly match local statement: {name}")
    return remote


def meaningful_explanation(node: dict[str, Any]) -> str:
    item = node["metadata"]
    explanation = item["proof_explanation"].strip()
    return (
        f"This proof establishes **{item['theorem_title']}**.\n\n"
        f"{item['natural_language_statement']}\n\n"
        f"Role: {item['attribution_class']}.\n\n"
        f"Attribution note: {item['attribution_note']}\n\n"
        f"{explanation}"
    )


def solution_request(package: dict[str, Any], node: dict[str, Any], theorem_id: str) -> tuple[bytes, str]:
    fields = {"theorem_id": theorem_id, "proof_type": "prove"}
    fields["explanation"] = (
        package["explanation"].read_text(encoding="utf-8")
        if node["root"] else meaningful_explanation(node)
    )
    solution_bytes = (REPO_ROOT / node["solution_path"]).read_bytes()
    boundary = hashlib.sha256(solution_bytes).hexdigest()[:32].encode()
    parts: list[bytes] = []
    for key, value in fields.items():
        parts.extend([
            b"--" + boundary,
            b'Content-Disposition: form-data; name="' + key.encode() + b'"',
            b"",
            value.encode(),
        ])
    parts.extend([
        b"--" + boundary,
        b'Content-Disposition: form-data; name="file"; filename="solution.lean"',
        b"Content-Type: text/plain",
        b"",
        solution_bytes,
        b"--" + boundary + b"--",
        b"",
    ])
    return b"\r\n".join(parts), boundary.decode()


def queue_solutions(
    package: dict[str, Any], receipt_path: Path, client: Client, submit_delay: float
) -> None:
    """Submit every missing solution without waiting for verification.

    Prove2Me permits up to 100 pending submissions.  Queueing this 75-node,
    locally validated packet once lets the server verify it in parallel while
    the ordinary ``--execute`` path remains the receipt-backed reconciler.
    """
    receipt = load_json(receipt_path)
    check_receipt(receipt, package)
    expected_theorems = {node["name"] for node in package["nodes"]}
    if set(receipt["theorems"]) != expected_theorems:
        raise UploadError("queueing solutions requires every theorem receipt")
    if any(not remote_id(receipt["theorems"][name]) for name in expected_theorems):
        raise UploadError("queueing solutions requires every theorem ID")

    for node in package["nodes"]:
        name = node["name"]
        entry = receipt["solutions"].get(name, {})
        if entry.get("submission_id"):
            result = client.request(
                "GET", "/verify", query={"submission_id": entry["submission_id"]}
            )
            if not isinstance(result, dict) or not result.get("status"):
                raise UploadError(f"invalid verification response for {name}")
            entry["status"] = result["status"]
            save_receipt(receipt_path, receipt)
            continue
        if entry.get("status") == "ERROR":
            raise UploadError(
                f"verification for {name} has no reconciliable submission ID; "
                "manual reconciliation required"
            )
        theorem_id = receipt["theorems"][name]["theorem_id"]
        body, boundary = solution_request(package, node, theorem_id)
        set_intent(receipt, receipt_path, "solution", name, body)
        try:
            response = client.request(
                "POST",
                "/verify",
                body=body,
                content_type=f"multipart/form-data; boundary={boundary}",
            )
        except UploadError as error:
            raise UploadError(f"uncertain verification POST for {name}; refusing retry") from error
        if not isinstance(response, dict) or not response.get("submission_id"):
            raise UploadError(f"uncertain verification POST for {name}; refusing retry")
        entry = {
            "status": response.get("status", "PENDING"),
            "submission_id": response["submission_id"],
        }
        receipt["solutions"][name] = entry
        mark_intent(
            receipt,
            receipt_path,
            "solution",
            name,
            id=entry["submission_id"],
            submission_id=entry["submission_id"],
        )
        save_receipt(receipt_path, receipt)
        if submit_delay:
            time.sleep(submit_delay)


def execute(package: dict[str, Any], receipt_path: Path, client: Client) -> None:
    if receipt_path.is_file():
        receipt = load_json(receipt_path)
        check_receipt(receipt, package)
    else:
        receipt = new_receipt(package)
        save_receipt(receipt_path, receipt)
    root_node = next(node for node in package["nodes"] if node["root"])
    preflight_root(client, root_node)
    for definition in package["definitions"]:
        path = REPO_ROOT / definition["path"]
        definition_text = path.read_text(encoding="utf-8")
        entry = receipt["definitions"].get(definition["name"], {})
        if entry.get("status") == "PUBLISHED":
            continue
        if entry.get("job_id") and entry.get("status") not in {"ERROR"}:
            result = client.poll_job(entry["job_id"])
        else:
            if entry.get("status") == "ERROR":
                remote = reconcile_publish(
                    client, definition["name"], definition=True,
                    expected_definition=definition_text,
                )
                if remote is not None:
                    identifier = remote_id(remote, definition=True)
                    if not identifier:
                        raise UploadError("definition reconciliation returned no ID")
                    entry = {"status": "PUBLISHED", "theorem_id": identifier}
                    receipt["definitions"][definition["name"]] = entry
                    save_receipt(receipt_path, receipt)
                    continue
            recovered = recover_uncertain_publish(
                client, receipt, receipt_path, "definition", definition["name"], definition=True,
                expected_definition=definition_text,
            )
            if recovered:
                receipt["definitions"][definition["name"]] = recovered
                save_receipt(receipt_path, receipt)
                continue
            payload = {
                "definition_name": definition["name"],
                "definition_title": f"Counting transfer definition {definition['name']}",
                "definition": definition_text,
                "natural_language_statement": f"Supporting definition bundle {definition['source_module']} for the Erdős counting formalization.",
                "source": definition["source_url"],
                "tags": [TAG],
            }
            payload_bytes = json.dumps(payload, ensure_ascii=False).encode()
            intent = set_intent(receipt, receipt_path, "definition", definition["name"], payload_bytes)
            try:
                response = client.request("POST", "/submit-definition", body=payload_bytes)
            except UploadError as error:
                remote = reconcile_publish(
                    client, definition["name"], definition=True,
                    expected_definition=definition_text,
                )
                if remote is None:
                    raise UploadError(f"uncertain definition POST for {definition['name']}; refusing retry") from error
                identifier = remote_id(remote, definition=True)
                if not identifier:
                    raise UploadError("definition reconciliation returned no ID")
                result = {"status": "PUBLISHED", "theorem_id": identifier}
                intent["id"] = result.get("theorem_id")
                mark_intent(receipt, receipt_path, "definition", definition["name"], id=result.get("theorem_id"))
                entry = {"status": "PUBLISHED", "theorem_id": result.get("theorem_id")}
                receipt["definitions"][definition["name"]] = entry
                save_receipt(receipt_path, receipt)
                continue
            jobs = response.get("jobs", []) if isinstance(response, dict) else []
            if isinstance(response, dict) and response.get("job_id"):
                jobs = [response]
            if len(jobs) != 1 or not jobs[0].get("job_id"):
                remote = reconcile_publish(
                    client, definition["name"], definition=True,
                    expected_definition=definition_text,
                )
                if remote is None:
                    raise UploadError(f"uncertain definition POST for {definition['name']}; refusing retry")
                identifier = remote_id(remote, definition=True)
                if not identifier:
                    raise UploadError("definition reconciliation returned no ID")
                result = {"status": "PUBLISHED", "theorem_id": identifier}
                mark_intent(receipt, receipt_path, "definition", definition["name"], id=result.get("theorem_id"))
                entry = {"status": "PUBLISHED", "theorem_id": result.get("theorem_id")}
                receipt["definitions"][definition["name"]] = entry
                save_receipt(receipt_path, receipt)
                continue
            entry = {"status": jobs[0].get("status", "PENDING"), "job_id": jobs[0]["job_id"]}
            receipt["definitions"][definition["name"]] = entry
            mark_intent(receipt, receipt_path, "definition", definition["name"], id=entry["job_id"], job_id=entry["job_id"])
            save_receipt(receipt_path, receipt)
            result = client.poll_job(entry["job_id"])
        if result.get("status") != TERMINAL_JOB_OK:
            entry["status"] = result["status"]
            save_receipt(receipt_path, receipt)
            raise UploadError(f"definition publish job {result['status']}; rerun to retry")
        entry.update({"status": result.get("status"), "theorem_id": result.get("theorem_id")})
        save_receipt(receipt_path, receipt)
    for node in package["nodes"]:
        name = node["name"]
        if node["root"]:
            continue
        entry = receipt["theorems"].get(name, {})
        if entry.get("status") == "PUBLISHED":
            continue
        if entry.get("job_id") and entry.get("status") not in {"ERROR"}:
            result = client.poll_job(entry["job_id"])
        else:
            item = node["metadata"]
            if entry.get("status") == "ERROR":
                remote = reconcile_publish(
                    client, name, definition=False,
                    expected_formal=node["formal_statement"],
                )
                if remote is not None:
                    identifier = remote_id(remote)
                    if not identifier:
                        raise UploadError("theorem reconciliation returned no ID")
                    entry = {"status": "PUBLISHED", "theorem_id": identifier}
                    receipt["theorems"][name] = entry
                    save_receipt(receipt_path, receipt)
                    continue
            recovered = recover_uncertain_publish(
                client, receipt, receipt_path, "theorem", name, definition=False,
                expected_formal=node["formal_statement"],
            )
            if recovered:
                receipt["theorems"][name] = recovered
                save_receipt(receipt_path, receipt)
                continue
            payload_bytes = json.dumps({"problems": [{
                "theorem_name": name,
                "theorem_title": item["theorem_title"],
                "formal_statement": node["formal_statement"],
                "natural_language_statement": item["natural_language_statement"],
                "preamble": node["preamble"],
                "source": node["remote_source"],
                "tags": list(item["tags"]),
            }]}, ensure_ascii=False).encode()
            intent = set_intent(receipt, receipt_path, "theorem", name, payload_bytes)
            try:
                response = client.request("POST", "/submit-problem", body=payload_bytes)
            except UploadError as error:
                remote = reconcile_publish(
                    client, name, definition=False,
                    expected_formal=node["formal_statement"],
                )
                if remote is None:
                    raise UploadError(f"uncertain theorem POST for {name}; refusing retry") from error
                identifier = remote_id(remote)
                if not identifier:
                    raise UploadError("theorem reconciliation returned no ID")
                result = {"status": "PUBLISHED", "theorem_id": identifier}
                mark_intent(receipt, receipt_path, "theorem", name, id=result.get("theorem_id"))
                entry = {"status": "PUBLISHED", "theorem_id": result.get("theorem_id")}
                receipt["theorems"][name] = entry
                save_receipt(receipt_path, receipt)
                continue
            jobs = response.get("jobs", []) if isinstance(response, dict) else []
            if len(jobs) != 1 or not jobs[0].get("job_id"):
                remote = reconcile_publish(
                    client, name, definition=False,
                    expected_formal=node["formal_statement"],
                )
                if remote is None:
                    raise UploadError(f"uncertain theorem POST for {name}; refusing retry")
                identifier = remote_id(remote)
                if not identifier:
                    raise UploadError("theorem reconciliation returned no ID")
                result = {"status": "PUBLISHED", "theorem_id": identifier}
                mark_intent(receipt, receipt_path, "theorem", name, id=result.get("theorem_id"))
                entry = {"status": "PUBLISHED", "theorem_id": result.get("theorem_id")}
                receipt["theorems"][name] = entry
                save_receipt(receipt_path, receipt)
                continue
            entry = {"status": jobs[0].get("status", "PENDING"), "job_id": jobs[0]["job_id"]}
            receipt["theorems"][name] = entry
            mark_intent(receipt, receipt_path, "theorem", name, id=entry["job_id"], job_id=entry["job_id"])
            save_receipt(receipt_path, receipt)
            result = client.poll_job(entry["job_id"])
        if result.get("status") != TERMINAL_JOB_OK:
            entry["status"] = result["status"]
            save_receipt(receipt_path, receipt)
            raise UploadError(f"theorem publish job {result['status']}; rerun to retry")
        if not result.get("theorem_id"):
            raise UploadError(f"published theorem has no ID: {name}")
        entry.update({"status": result.get("status"), "theorem_id": result["theorem_id"]})
        save_receipt(receipt_path, receipt)
    for node in package["nodes"]:
        name = node["name"]
        entry = receipt["solutions"].get(name, {})
        if entry.get("status") in TERMINAL_SUBMISSION_OK:
            continue
        if entry.get("submission_id"):
            result = client.poll_submission(entry["submission_id"])
            if (
                result.get("status") == "ERROR"
                and result.get("error_message") in TRANSIENT_SUBMISSION_ERRORS
                and entry.get("transient_retries", 0) < 1
            ):
                prior_submission_id = entry["submission_id"]
                theorem_id = receipt["theorems"].get(name, {}).get("theorem_id")
                if not theorem_id:
                    raise UploadError(f"no theorem ID for solution retry: {name}")
                body, boundary = solution_request(package, node, theorem_id)
                set_intent(receipt, receipt_path, "solution", name, body)
                try:
                    response = client.request(
                        "POST",
                        "/verify",
                        body=body,
                        content_type=f"multipart/form-data; boundary={boundary}",
                    )
                except UploadError as error:
                    raise UploadError(
                        f"uncertain verification retry POST for {name}; refusing retry"
                    ) from error
                if not isinstance(response, dict) or not response.get("submission_id"):
                    raise UploadError(
                        f"uncertain verification retry POST for {name}; refusing retry"
                    )
                entry.update({
                    "status": response.get("status", "PENDING"),
                    "submission_id": response["submission_id"],
                    "transient_retries": 1,
                    "prior_submission_ids": [prior_submission_id],
                })
                mark_intent(
                    receipt,
                    receipt_path,
                    "solution",
                    name,
                    id=entry["submission_id"],
                    submission_id=entry["submission_id"],
                )
                save_receipt(receipt_path, receipt)
                result = client.poll_submission(entry["submission_id"])
        else:
            if entry.get("status") == "ERROR":
                raise UploadError(
                    f"verification for {name} has no reconciliable submission ID; manual reconciliation required"
                )
            theorem_id = receipt["theorems"].get(name, {}).get("theorem_id")
            if not theorem_id:
                raise UploadError(f"no theorem ID for solution: {name}")
            body, boundary = solution_request(package, node, theorem_id)
            set_intent(receipt, receipt_path, "solution", name, body)
            try:
                response = client.request(
                    "POST",
                    "/verify",
                    body=body,
                    content_type=f"multipart/form-data; boundary={boundary}",
                )
            except UploadError as error:
                raise UploadError(f"uncertain verification POST for {name}; refusing retry") from error
            if not isinstance(response, dict) or not response.get("submission_id"):
                raise UploadError(f"uncertain verification POST for {name}; refusing retry")
            entry = {"status": response.get("status", "PENDING"), "submission_id": response["submission_id"]}
            receipt["solutions"][name] = entry
            mark_intent(receipt, receipt_path, "solution", name, id=entry["submission_id"], submission_id=entry["submission_id"])
            save_receipt(receipt_path, receipt)
            result = client.poll_submission(entry["submission_id"])
        if result.get("status") not in TERMINAL_SUBMISSION_OK:
            entry["status"] = result["status"]
            save_receipt(receipt_path, receipt)
            raise UploadError(f"verification {result['status']}; rerun to retry")
        entry["status"] = result.get("status")
        save_receipt(receipt_path, receipt)
    patches = receipt["patches"]
    expected_solution_names = {node["name"] for node in package["nodes"]}
    if set(receipt["solutions"]) != expected_solution_names or any(
        receipt["solutions"][name].get("status") not in TERMINAL_SUBMISSION_OK
        for name in expected_solution_names
    ):
        raise UploadError("refusing metadata patches until every solution is accepted")
    if patches.get("mission_description") != "PATCHED":
        client.json_request("PATCH", f"/missions/{MISSION_ID}", {"description": package["mission_description"].read_text(encoding="utf-8")})
        patches["mission_description"] = "PATCHED"
        save_receipt(receipt_path, receipt)
    if patches.get("root_metadata") != "PATCHED":
        item = package["metadata"][ROOT_SOURCE_NAME]
        root_node = next(node for node in package["nodes"] if node["root"])
        client.json_request("PATCH", f"/theorems/{ROOT_THEOREM_ID}", {"natural_language_statement": item["natural_language_statement"], "source": root_node["remote_source"], "tags": list(item["tags"])})
        patches["root_metadata"] = "PATCHED"
        save_receipt(receipt_path, receipt)


def parse_args(argv: list[str] | None = None) -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    mode = parser.add_mutually_exclusive_group()
    mode.add_argument("--execute", action="store_true", help="perform network uploads")
    mode.add_argument(
        "--queue-solutions",
        action="store_true",
        help="submit all missing solutions without waiting for verification",
    )
    parser.add_argument(
        "--submit-delay",
        type=float,
        default=1.0,
        help="seconds between queued solution submissions (default: 1.0)",
    )
    mode.add_argument("--dry-run", action="store_true", help="validate and print the plan (default)")
    parser.add_argument("--receipt", type=Path, default=TRANSFER / "receipt.json")
    parser.add_argument(
        "--artifact-commit",
        help="40-hex committed payload revision required by network modes",
    )
    parser.add_argument("--poll-interval", type=float, default=3.0)
    parser.add_argument("--poll-timeout", type=float, default=3600.0)
    return parser.parse_args(argv)


def main(argv: list[str] | None = None) -> int:
    args = parse_args(argv)
    try:
        network_mode = args.execute or args.queue_solutions
        package = load_package(
            require_remote_ready=network_mode,
            artifact_commit=args.artifact_commit,
        )
        if not network_mode:
            print(
                "dry-run: validated external build/type/axiom gate, 18 definitions, "
                "75 theorem stubs, and 75 solutions; no network calls"
            )
            return 0
        client = Client(args.poll_interval, args.poll_timeout)
        if args.queue_solutions:
            if args.submit_delay < 0:
                raise UploadError("--submit-delay must be nonnegative")
            queue_solutions(package, args.receipt, client, args.submit_delay)
        else:
            execute(package, args.receipt, client)
    except (UploadError, OSError, KeyError, TypeError, ValueError) as error:
        print(f"upload failed closed: {error}", file=sys.stderr)
        return 2
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
