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
TERMINAL_JOB_OK = "PUBLISHED"
TERMINAL_SUBMISSION_OK = {"ACCEPTED", "SKETCH_ACCEPTED"}
TERMINAL_FAILURE = {"FAILED", "ERROR"}


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
    root = manifest.get("existing_root_stub")
    if not isinstance(root, dict):
        raise UploadError("missing existing root stub record")
    root_relative = Path(str(root.get("path", "")))
    root_path = REPO_ROOT / root_relative
    if not root_path.is_file():
        root_path = WORKSPACE / root_relative
    if not root_path.is_file() or sha256_file(root_path) != root.get("sha256"):
        raise UploadError("existing root theorem stub does not match manifest")


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


def load_package() -> dict[str, Any]:
    plan = load_json(TRANSFER / "plan.json")
    manifest = load_json(TRANSFER / "generation-manifest.json")
    metadata = load_json(TRANSFER / "metadata.json")
    validate_manifest(manifest, plan)
    if metadata.get("schema") != "prove2me-counting-metadata/v1":
        raise UploadError("unsupported metadata schema")
    items = metadata.get("items")
    if not isinstance(items, list) or len(items) != 75:
        raise UploadError("metadata must contain exactly 75 theorem records")
    required_metadata = {"theorem_name", "theorem_title", "natural_language_statement", "source", "tags"}
    for item in items:
        if not isinstance(item, dict) or not required_metadata <= item.keys():
            raise UploadError("metadata record is incomplete")
        if not isinstance(item["tags"], list) or not all(isinstance(tag, str) for tag in item["tags"]):
            raise UploadError("metadata tags must be a list of strings")
    metadata_by_name = {item["theorem_name"]: item for item in items}
    if len(metadata_by_name) != 75:
        raise UploadError("metadata theorem names are not unique")
    commands, _ = command_maps(plan)
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
        if b"by sorry" in solution.read_bytes():
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
    definitions: list[dict[str, Any]] = []
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
    if len(definitions) != 17:
        raise UploadError("definition order does not contain 17 bundles")
    explanation = TRANSFER / "explanation.md"
    mission_description = REPO_ROOT / "mission-description.md"
    if not explanation.is_file() or not mission_description.is_file():
        raise UploadError("missing explanation.md or mission-description.md")
    return {
        "plan": plan,
        "manifest": manifest,
        "metadata": metadata_by_name,
        "nodes": nodes,
        "definitions": definitions,
        "explanation": explanation,
        "mission_description": mission_description,
    }


def read_key() -> str:
    credentials_path = WORKSPACE / "credentials.json"
    credentials = load_json(credentials_path)
    if not isinstance(credentials, dict):
        raise UploadError("credentials.json must contain an object")
    key = credentials.get("api_key") or credentials.get("access_token")
    if not isinstance(key, str) or not key.strip():
        raise UploadError("credentials.json has no API key")
    return key


class Client:
    def __init__(self, poll_interval: float, poll_timeout: float) -> None:
        self.poll_interval = poll_interval
        self.poll_timeout = poll_timeout

    def request(self, method: str, path: str, *, body: bytes | None = None,
                content_type: str = "application/json", query: dict[str, str] | None = None) -> Any:
        key = read_key()
        url = HOST + path
        if query:
            url += "?" + urlencode(query)
        headers = {"Authorization": f"Bearer {key}"}
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

    def json_request(self, method: str, path: str, payload: dict[str, Any]) -> Any:
        return self.request(method, path, body=json.dumps(payload, ensure_ascii=False).encode())

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
    root_entry = theorem_receipts.get(ROOT_PLATFORM_NAME, {})
    if root_entry.get("theorem_id") != ROOT_THEOREM_ID:
        raise UploadError("receipt root theorem binding mismatch")


def execute(package: dict[str, Any], receipt_path: Path, client: Client) -> None:
    if receipt_path.is_file():
        receipt = load_json(receipt_path)
        check_receipt(receipt, package)
    else:
        receipt = new_receipt(package)
        save_receipt(receipt_path, receipt)
    for definition in package["definitions"]:
        entry = receipt["definitions"].get(definition["name"], {})
        if entry.get("status") == "PUBLISHED" and entry.get("theorem_id"):
            continue
        if entry.get("job_id") and entry.get("status") not in {"ERROR"}:
            result = client.poll_job(entry["job_id"])
        else:
            path = REPO_ROOT / definition["path"]
            payload = {
                "definition_name": definition["name"],
                "definition_title": f"Counting transfer definition {definition['name']}",
                "definition": path.read_text(encoding="utf-8"),
                "natural_language_statement": f"Supporting definition bundle {definition['source_module']} for the Erdős counting formalization.",
                "source": f"Generated from {definition['source_module']} in the counting transfer.",
                "tags": [TAG],
            }
            response = client.json_request("POST", "/submit-definition", payload)
            jobs = response.get("jobs", []) if isinstance(response, dict) else []
            if isinstance(response, dict) and response.get("job_id"):
                jobs = [response]
            if len(jobs) != 1 or not jobs[0].get("job_id"):
                raise UploadError("submit-definition did not return one job ID")
            entry = {"status": jobs[0].get("status", "PENDING"), "job_id": jobs[0]["job_id"]}
            receipt["definitions"][definition["name"]] = entry
            save_receipt(receipt_path, receipt)
            result = client.poll_job(entry["job_id"])
        if result.get("status") in TERMINAL_FAILURE:
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
            response = client.json_request("POST", "/submit-problem", {"problems": [{
                "theorem_name": name,
                "theorem_title": item["theorem_title"],
                "formal_statement": node["formal_statement"],
                "natural_language_statement": item["natural_language_statement"],
                "preamble": node["preamble"],
                "source": item["source"],
                "tags": list(item["tags"]),
            }]})
            jobs = response.get("jobs", []) if isinstance(response, dict) else []
            if len(jobs) != 1 or not jobs[0].get("job_id"):
                raise UploadError("submit-problem did not return one job ID")
            entry = {"status": jobs[0].get("status", "PENDING"), "job_id": jobs[0]["job_id"]}
            receipt["theorems"][name] = entry
            save_receipt(receipt_path, receipt)
            result = client.poll_job(entry["job_id"])
        if result.get("status") in TERMINAL_FAILURE:
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
        if entry.get("submission_id") and entry.get("status") not in {"ERROR"}:
            result = client.poll_submission(entry["submission_id"])
        else:
            theorem_id = receipt["theorems"].get(name, {}).get("theorem_id")
            if not theorem_id:
                raise UploadError(f"no theorem ID for solution: {name}")
            fields = {"theorem_id": theorem_id}
            if node["root"]:
                fields["explanation"] = package["explanation"].read_text(encoding="utf-8")
            solution_bytes = (REPO_ROOT / node["solution_path"]).read_bytes()
            boundary = hashlib.sha256(solution_bytes).hexdigest()[:32].encode()
            parts: list[bytes] = []
            for key, value in fields.items():
                parts.extend([b"--" + boundary, b'Content-Disposition: form-data; name="' + key.encode() + b'"', b"", value.encode()])
            parts.extend([b"--" + boundary, b'Content-Disposition: form-data; name="file"; filename="solution.lean"', b"Content-Type: text/plain", b"", solution_bytes, b"--" + boundary + b"--", b""])
            response = client.request("POST", "/verify", body=b"\r\n".join(parts), content_type=f"multipart/form-data; boundary={boundary.decode()}")
            if not isinstance(response, dict) or not response.get("submission_id"):
                raise UploadError("verify did not return a submission ID")
            entry = {"status": response.get("status", "PENDING"), "submission_id": response["submission_id"]}
            receipt["solutions"][name] = entry
            save_receipt(receipt_path, receipt)
            result = client.poll_submission(entry["submission_id"])
        if result.get("status") in TERMINAL_FAILURE:
            entry["status"] = result["status"]
            save_receipt(receipt_path, receipt)
            raise UploadError(f"verification {result['status']}; rerun to retry")
        entry["status"] = result.get("status")
        save_receipt(receipt_path, receipt)
    patches = receipt["patches"]
    if patches.get("mission_description") != "PATCHED":
        client.json_request("PATCH", f"/missions/{MISSION_ID}", {"description": package["mission_description"].read_text(encoding="utf-8")})
        patches["mission_description"] = "PATCHED"
        save_receipt(receipt_path, receipt)
    if patches.get("root_metadata") != "PATCHED":
        item = package["metadata"][ROOT_SOURCE_NAME]
        client.json_request("PATCH", f"/theorems/{ROOT_THEOREM_ID}", {"natural_language_statement": item["natural_language_statement"], "source": item["source"], "tags": list(item["tags"])})
        patches["root_metadata"] = "PATCHED"
        save_receipt(receipt_path, receipt)


def parse_args(argv: list[str] | None = None) -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    mode = parser.add_mutually_exclusive_group()
    mode.add_argument("--execute", action="store_true", help="perform network uploads")
    mode.add_argument("--dry-run", action="store_true", help="validate and print the plan (default)")
    parser.add_argument("--receipt", type=Path, default=TRANSFER / "receipt.json")
    parser.add_argument("--poll-interval", type=float, default=3.0)
    parser.add_argument("--poll-timeout", type=float, default=3600.0)
    return parser.parse_args(argv)


def main(argv: list[str] | None = None) -> int:
    args = parse_args(argv)
    try:
        package = load_package()
        if not args.execute:
            print("dry-run: validated 17 definitions, 75 theorem stubs, and 75 solutions; no network calls")
            return 0
        execute(package, args.receipt, Client(args.poll_interval, args.poll_timeout))
    except (UploadError, OSError, KeyError, TypeError, ValueError) as error:
        print(f"upload failed closed: {error}", file=sys.stderr)
        return 2
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
