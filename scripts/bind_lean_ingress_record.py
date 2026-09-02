# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Generate and check a Lean-ingress publication binding record.

The record is the fail-closed handoff required by item 9 of the Lean
worker/promotion contract and by the "Lean-ingress publication gate" section
of the proof-discipline reference.  It binds, in one domain-separated
self-hashed payload: the captured ingress source bytes, the fully qualified
declaration names, the named aggregate (final-consumer) source bytes, the
aggregate-to-ingress import edge plus the repository-local transitive import
closure, a semantic ``#check``/``#print axioms`` probe under the pinned
toolchain, the fresh aggregate build evidence, a post-probe recapture, and a
typed parent link.

The tool is generic: every module, declaration, root, log, and parent record
is supplied on the command line.  Nothing about a particular certificate is
hard-coded.

Generation runs Lean once (``lake env lean`` on a temporary probe file);
``check`` re-derives every byte-level field from the working tree and only
re-runs Lean when ``--semantic`` is passed.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import os
import subprocess
import sys
import tempfile
from datetime import UTC, datetime
from pathlib import Path
from typing import Any

SCHEMA = "p97-lean-ingress-binding/v1"
SELF_HASH_DOMAIN = "p97-lean-ingress-binding/v1"
PARENT_LINK_DOMAIN = "p97-lean-ingress-binding/parent/v1"
DEFAULT_LAKE_ENV_LEAN_TIMEOUT = 900
LEAN_SUFFIX = ".lean"
IMPORT_PREFIX = "import "
BUILD_EXIT_PREFIX = "BUILD-EXIT="
BUILD_EXIT_OK = "BUILD-EXIT=0"
LEAN_SEVERITIES = frozenset({"error", "warning", "information", "info"})

TOP_LEVEL_KEYS: tuple[str, ...] = (
    "schema",
    "roots",
    "ingress",
    "declarations",
    "aggregate",
    "import_edge",
    "closure",
    "semantic",
    "build_evidence",
    "recapture",
    "parent",
    "repo_head",
    "written_utc",
    "self_hash",
)


class BindingError(RuntimeError):
    """A binding record could not be generated, or failed verification."""


# --------------------------------------------------------------------------
# path handling
# --------------------------------------------------------------------------


def normalize_repo_relative(raw: str, *, label: str) -> str:
    """Return ``raw`` as a validated repository-relative POSIX string."""

    if raw is None:
        raise ValueError(f"{label}: missing path")
    text = str(raw)
    if os.sep != "/":
        text = text.replace(os.sep, "/")
    if "\\" in text:
        raise ValueError(f"{label}: backslash is not allowed in a repository path: {raw!r}")
    while text.startswith("./"):
        text = text[2:]
    while text.endswith("/"):
        text = text[:-1]
    if text == "":
        raise ValueError(f"{label}: empty repository-relative path")
    if text.startswith("/") or os.path.isabs(text):
        raise ValueError(f"{label}: absolute path is not allowed: {raw!r}")
    for part in text.split("/"):
        if part == "":
            raise ValueError(f"{label}: empty path segment in {raw!r}")
        if part == ".":
            raise ValueError(f"{label}: '.' path segment is not allowed: {raw!r}")
        if part == "..":
            raise ValueError(f"{label}: path escapes the repository: {raw!r}")
    return text


def repo_path(repo_root: Path, relative: str, *, label: str) -> Path:
    """Resolve a repository-relative path, rejecting symlinked components."""

    text = normalize_repo_relative(relative, label=label)
    current = repo_root
    for part in text.split("/"):
        current = current / part
        if current.is_symlink():
            raise ValueError(
                f"{label}: symlinked path component is not allowed: {current.as_posix()}"
            )
    return current


def read_file_bytes(path: Path, *, label: str) -> bytes:
    if not path.is_file():
        raise BindingError(f"{label}: not a regular file: {path.as_posix()}")
    return path.read_bytes()


def sha256_hex(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def module_relative_path(source_root: str, module: str) -> str:
    """Map a Lean module name to its repository-relative source path."""

    if not module or module.strip() != module:
        raise ValueError(f"invalid Lean module name: {module!r}")
    if "/" in module or "\\" in module:
        raise ValueError(f"invalid Lean module name: {module!r}")
    parts = module.split(".")
    for part in parts:
        if part == "":
            raise ValueError(f"invalid Lean module name: {module!r}")
    return source_root + "/" + "/".join(parts) + LEAN_SUFFIX


def module_source_record(repo_root: Path, source_root: str, module: str, *, label: str) -> dict[str, Any]:
    relative = module_relative_path(source_root, module)
    path = repo_path(repo_root, relative, label=label)
    data = read_file_bytes(path, label=label)
    return {
        "module": module,
        "path": relative,
        "byte_count": len(data),
        "sha256": sha256_hex(data),
    }


# --------------------------------------------------------------------------
# JSON loading (duplicate-key rejecting, object only)
# --------------------------------------------------------------------------


def _reject_duplicate_keys(pairs: list[tuple[str, Any]]) -> dict[str, Any]:
    result: dict[str, Any] = {}
    for key, value in pairs:
        if key in result:
            raise BindingError(f"duplicate key in JSON object: {key!r}")
        result[key] = value
    return result


def load_json_object(data: bytes, *, label: str) -> dict[str, Any]:
    try:
        text = data.decode("utf-8")
    except UnicodeDecodeError as exc:
        raise BindingError(f"{label}: not valid UTF-8: {exc}") from exc
    try:
        loaded = json.loads(text, object_pairs_hook=_reject_duplicate_keys)
    except json.JSONDecodeError as exc:
        raise BindingError(f"{label}: not valid JSON: {exc}") from exc
    if not isinstance(loaded, dict):
        raise BindingError(f"{label}: top-level JSON value is not an object")
    return loaded


def canonical_json(payload: Any) -> str:
    return json.dumps(payload, sort_keys=True, separators=(",", ":"), ensure_ascii=True)


def compute_self_hash(record: dict[str, Any]) -> str:
    payload = {key: value for key, value in record.items() if key != "self_hash"}
    digest = hashlib.sha256()
    digest.update(SELF_HASH_DOMAIN.encode("utf-8") + b"\x00")
    digest.update(canonical_json(payload).encode("utf-8"))
    return digest.hexdigest()


# --------------------------------------------------------------------------
# import edge and repository-local transitive import closure
# --------------------------------------------------------------------------


def parse_import_lines(text: str) -> list[str]:
    """Return the module names of every line starting with ``import ``."""

    names: list[str] = []
    for line in text.splitlines():
        if not line.startswith(IMPORT_PREFIX):
            continue
        remainder = line[len(IMPORT_PREFIX) :].strip()
        if not remainder:
            continue
        names.append(remainder.split()[0])
    return names


def find_import_edge(aggregate_text: str, ingress_module: str) -> dict[str, Any]:
    wanted = IMPORT_PREFIX + ingress_module
    for line in aggregate_text.splitlines():
        if line.rstrip() == wanted:
            return {"present": True, "line": line}
    raise BindingError(f"import edge missing: aggregate source has no line {wanted!r}")


def compute_closure(repo_root: Path, source_root: str, root_module: str) -> dict[str, Any]:
    """Repository-local reflexive transitive import closure of ``root_module``."""

    local: dict[str, str] = {}
    external: set[str] = set()
    seen: set[str] = set()
    pending: list[str] = [root_module]
    while pending:
        module = pending.pop()
        if module in seen:
            continue
        seen.add(module)
        try:
            relative = module_relative_path(source_root, module)
        except ValueError:
            external.add(module)
            continue
        path = repo_path(repo_root, relative, label=f"closure module {module}")
        if not path.is_file():
            if module == root_module:
                raise BindingError(f"closure root module has no source file: {relative}")
            external.add(module)
            continue
        data = path.read_bytes()
        local[module] = sha256_hex(data)
        try:
            text = data.decode("utf-8")
        except UnicodeDecodeError as exc:
            raise BindingError(f"closure module {module}: source is not valid UTF-8: {exc}") from exc
        for name in parse_import_lines(text):
            if name not in seen:
                pending.append(name)
    modules = sorted(local)
    per_module_lines = sorted(f"{module} {local[module]}" for module in modules)
    return {
        "module_count": len(modules),
        "modules_digest": sha256_hex("\n".join(modules).encode("utf-8")),
        "per_module_digest": sha256_hex("\n".join(per_module_lines).encode("utf-8")),
        "external_imports": sorted(external),
    }


# --------------------------------------------------------------------------
# semantic probe
# --------------------------------------------------------------------------


def build_probe_text(aggregate_module: str, declarations: list[str]) -> str:
    lines = [IMPORT_PREFIX + aggregate_module, "", "/-! binding probe -/", ""]
    for declaration in declarations:
        lines.append(f"#check @{declaration}")
        lines.append(f"#print axioms {declaration}")
    return "\n".join(lines) + "\n"


def parse_lean_messages(output: str, probe_path: str) -> list[dict[str, str]]:
    """Split ``lean`` output into (severity, text) messages for one file."""

    prefix = probe_path + ":"
    messages: list[dict[str, Any]] = []
    for line in output.splitlines():
        if line.startswith(prefix):
            remainder = line[len(prefix) :]
            parts = remainder.split(":", 2)
            if len(parts) == 3:
                body = parts[2].lstrip()
                severity, separator, tail = body.partition(":")
                if separator and severity in LEAN_SEVERITIES:
                    messages.append({"severity": severity, "lines": [tail.strip()]})
                    continue
        # ``#check`` and ``#print axioms`` print bare info messages without a
        # position prefix; wrapped continuation lines start with whitespace.
        if line.strip() == "":
            continue
        if messages and (line[:1].isspace() or _axiom_list_open(messages[-1]["lines"])):
            messages[-1]["lines"].append(line)
        else:
            messages.append({"severity": "info", "lines": [line.rstrip()]})
    return [
        {"severity": message["severity"], "text": "\n".join(message["lines"]).strip()}
        for message in messages
    ]


def _axiom_list_open(lines: list[str]) -> bool:
    """True when the message so far starts an axiom list that has not closed."""

    text = " ".join(lines)
    return "depends on axioms:" in text and "]" not in text


def parse_axiom_message(text: str, declaration: str) -> list[str] | None:
    """Return the axiom names of a ``#print axioms`` message, or ``None``."""

    flat = " ".join(part.strip() for part in text.splitlines()).strip()
    quoted = "'" + declaration + "'"
    if not flat.startswith(quoted):
        return None
    if flat.startswith(quoted + " does not depend on any axioms"):
        return []
    marker = quoted + " depends on axioms:"
    if not flat.startswith(marker):
        return None
    tail = flat[len(marker) :].strip()
    if not tail.startswith("["):
        raise BindingError(f"semantic probe: malformed axiom list for {declaration}: {flat}")
    end = tail.find("]")
    if end < 0:
        raise BindingError(f"semantic probe: unterminated axiom list for {declaration}: {flat}")
    inside = tail[1:end]
    return [item.strip() for item in inside.split(",") if item.strip()]


def _is_axiom_message(text: str) -> bool:
    return "depends on axioms" in text or "does not depend on any axioms" in text


def _run_command(command: list[str], cwd: Path, timeout: int) -> subprocess.CompletedProcess[str]:
    try:
        return subprocess.run(
            command,
            cwd=str(cwd),
            capture_output=True,
            text=True,
            timeout=timeout,
            check=False,
        )
    except FileNotFoundError as exc:
        raise BindingError(f"semantic probe: command not found: {command[0]}") from exc
    except subprocess.TimeoutExpired as exc:
        raise BindingError(
            f"semantic probe: {' '.join(command)} timed out after {timeout}s"
        ) from exc


def run_semantic_probe(
    *,
    repo_root: Path,
    lake_root: str,
    aggregate_module: str,
    declarations: list[str],
    timeout: int,
) -> dict[str, Any]:
    """Elaborate the declarations under the pinned toolchain via ``lake env lean``."""

    lake_dir = repo_path(repo_root, lake_root, label="lake root")
    if not lake_dir.is_dir():
        raise BindingError(f"lake root is not a directory: {lake_root}")
    toolchain_path = lake_dir / "lean-toolchain"
    toolchain = read_file_bytes(toolchain_path, label="lean-toolchain").decode("utf-8").strip()

    probe_text = build_probe_text(aggregate_module, declarations)
    scratch_dir = repo_root / "scratch"
    probe_dir = scratch_dir if scratch_dir.is_dir() else Path(tempfile.gettempdir())
    descriptor, name = tempfile.mkstemp(
        dir=str(probe_dir), prefix="lean-ingress-binding-", suffix=LEAN_SUFFIX
    )
    os.close(descriptor)
    probe_path = Path(name)
    try:
        probe_path.write_text(probe_text, encoding="utf-8")
        version = _run_command(["lake", "env", "lean", "--version"], lake_dir, timeout)
        if version.returncode != 0:
            raise BindingError(
                "semantic probe: 'lake env lean --version' failed with exit "
                f"{version.returncode}"
            )
        lean_version = version.stdout.strip().splitlines()[0].strip() if version.stdout.strip() else ""
        if not lean_version:
            raise BindingError("semantic probe: 'lake env lean --version' printed nothing")
        completed = _run_command(["lake", "env", "lean", str(probe_path)], lake_dir, timeout)
        output = completed.stdout + completed.stderr
        messages = parse_lean_messages(output, str(probe_path))
        for line in output.splitlines():
            if line.startswith("error"):
                raise BindingError(f"semantic probe: lean reported an error: {line.strip()}")
        for message in messages:
            if message["severity"] == "error":
                first = message["text"].splitlines()[0] if message["text"] else ""
                raise BindingError(f"semantic probe: lean reported an error: {first}")
        if completed.returncode != 0:
            raise BindingError(
                f"semantic probe: 'lake env lean' exited {completed.returncode}"
            )
    finally:
        try:
            probe_path.unlink()
        except OSError:
            pass

    records: list[dict[str, Any]] = []
    index = 0
    check_lines: list[str] = []
    for message in messages:
        if index >= len(declarations):
            break
        declaration = declarations[index]
        if _is_axiom_message(message["text"]):
            axioms = parse_axiom_message(message["text"], declaration)
            if axioms is None:
                raise BindingError(
                    f"semantic probe: axiom line does not name {declaration}: {message['text']}"
                )
            records.append(
                {
                    "declaration": declaration,
                    "check_output": "\n".join(check_lines).strip(),
                    "axioms": axioms,
                }
            )
            check_lines = []
            index += 1
        else:
            check_lines.append(message["text"])
    if index != len(declarations):
        missing = declarations[index]
        raise BindingError(f"semantic probe: no '#print axioms' output for {missing}")
    for record in records:
        if not record["check_output"]:
            raise BindingError(
                f"semantic probe: no '#check' output for {record['declaration']}"
            )
    return {
        "toolchain": toolchain,
        "lean_version": lean_version,
        "probe_sha256": sha256_hex(probe_text.encode("utf-8")),
        "timeout_seconds": timeout,
        "declarations": records,
    }


# --------------------------------------------------------------------------
# build evidence and parent link
# --------------------------------------------------------------------------


def build_evidence_record(repo_root: Path, build_log: str, aggregate_module: str) -> dict[str, Any]:
    relative = normalize_repo_relative(build_log, label="build log")
    path = repo_path(repo_root, relative, label="build log")
    data = read_file_bytes(path, label="build log")
    text = data.decode("utf-8", errors="replace")
    marker = "Built " + aggregate_module
    built_line: str | None = None
    exit_line: str | None = None
    for line in text.splitlines():
        stripped = line.strip()
        if built_line is None and marker in line:
            built_line = line.rstrip()
        if stripped.startswith(BUILD_EXIT_PREFIX):
            exit_line = stripped
    if built_line is None:
        raise BindingError(f"build log has no line containing {marker!r}: {relative}")
    if exit_line is None:
        raise BindingError(f"build log has no {BUILD_EXIT_PREFIX!r} line: {relative}")
    if exit_line != BUILD_EXIT_OK:
        raise BindingError(f"build log records a failed build: {exit_line}")
    return {
        "log_path": relative,
        "log_sha256": sha256_hex(data),
        "aggregate_built_line": built_line,
        "build_exit_line": exit_line,
    }


def parent_link_record(repo_root: Path, parent_record: str, parent_kind: str) -> dict[str, Any]:
    if not parent_kind or parent_kind.strip() != parent_kind:
        raise ValueError(f"invalid parent record kind: {parent_kind!r}")
    relative = normalize_repo_relative(parent_record, label="parent record")
    path = repo_path(repo_root, relative, label="parent record")
    data = read_file_bytes(path, label="parent record")
    parent = load_json_object(data, label="parent record")
    schema = parent.get("schema")
    if not isinstance(schema, str) or not schema:
        raise BindingError(f"parent record has no 'schema' string: {relative}")
    digest = hashlib.sha256()
    digest.update(PARENT_LINK_DOMAIN.encode("utf-8") + b"\x00")
    digest.update(parent_kind.encode("utf-8") + b"\x00")
    digest.update(data)
    return {
        "record_kind": parent_kind,
        "path": relative,
        "byte_count": len(data),
        "sha256": sha256_hex(data),
        "schema": schema,
        "link_digest": digest.hexdigest(),
    }


def git_head(repo_root: Path) -> str:
    try:
        completed = subprocess.run(
            ["git", "-C", str(repo_root), "rev-parse", "HEAD"],
            capture_output=True,
            text=True,
            timeout=120,
            check=False,
        )
    except (OSError, subprocess.SubprocessError):
        return "unknown"
    if completed.returncode != 0:
        return "unknown"
    return completed.stdout.strip() or "unknown"


# --------------------------------------------------------------------------
# generate
# --------------------------------------------------------------------------


def generate_record(
    *,
    repo_root: Path | str,
    lake_root: str,
    source_root: str,
    ingress_module: str,
    aggregate_module: str,
    declarations: list[str],
    parent_record: str,
    parent_kind: str,
    build_log: str,
    lake_env_lean_timeout: int = DEFAULT_LAKE_ENV_LEAN_TIMEOUT,
) -> dict[str, Any]:
    root = Path(repo_root).resolve()
    if not root.is_dir():
        raise BindingError(f"repository root is not a directory: {root.as_posix()}")
    lake_relative = normalize_repo_relative(lake_root, label="lake root")
    source_relative = normalize_repo_relative(source_root, label="source root")

    if not declarations:
        raise BindingError("at least one --declaration is required")
    seen: set[str] = set()
    for declaration in declarations:
        if not declaration or declaration.strip() != declaration:
            raise BindingError(f"invalid declaration name: {declaration!r}")
        if declaration in seen:
            raise BindingError(f"duplicate declaration name: {declaration}")
        seen.add(declaration)

    ingress = module_source_record(root, source_relative, ingress_module, label="ingress module")
    aggregate = module_source_record(root, source_relative, aggregate_module, label="aggregate module")
    aggregate_text = repo_path(
        root, aggregate["path"], label="aggregate module"
    ).read_bytes().decode("utf-8")
    import_edge = find_import_edge(aggregate_text, ingress_module)
    closure = compute_closure(root, source_relative, ingress_module)
    build_evidence = build_evidence_record(root, build_log, aggregate_module)
    parent = parent_link_record(root, parent_record, parent_kind)

    semantic = run_semantic_probe(
        repo_root=root,
        lake_root=lake_relative,
        aggregate_module=aggregate_module,
        declarations=list(declarations),
        timeout=lake_env_lean_timeout,
    )

    ingress_again = module_source_record(root, source_relative, ingress_module, label="ingress module")
    aggregate_again = module_source_record(root, source_relative, aggregate_module, label="aggregate module")
    aggregate_text_again = repo_path(
        root, aggregate_again["path"], label="aggregate module"
    ).read_bytes().decode("utf-8")
    import_edge_again = find_import_edge(aggregate_text_again, ingress_module)
    closure_again = compute_closure(root, source_relative, ingress_module)
    if ingress_again != ingress:
        raise BindingError("recapture failed: ingress source changed during the semantic probe")
    if aggregate_again != aggregate:
        raise BindingError("recapture failed: aggregate source changed during the semantic probe")
    if import_edge_again != import_edge:
        raise BindingError("recapture failed: aggregate import edge changed during the semantic probe")
    if closure_again != closure:
        raise BindingError("recapture failed: import closure changed during the semantic probe")

    record: dict[str, Any] = {
        "schema": SCHEMA,
        "roots": {"lake_root": lake_relative, "source_root": source_relative},
        "ingress": ingress,
        "declarations": list(declarations),
        "aggregate": aggregate,
        "import_edge": import_edge,
        "closure": closure,
        "semantic": semantic,
        "build_evidence": build_evidence,
        "recapture": {
            "ingress_sha256_recaptured": ingress_again["sha256"],
            "aggregate_sha256_recaptured": aggregate_again["sha256"],
            "closure_digest_recaptured": closure_again["per_module_digest"],
            "stable": True,
        },
        "parent": parent,
        "repo_head": git_head(root),
        "written_utc": datetime.now(UTC).strftime("%Y-%m-%dT%H:%M:%SZ"),
    }
    record["self_hash"] = {"domain": SELF_HASH_DOMAIN, "sha256": compute_self_hash(record)}
    return record


def write_record(record: dict[str, Any], out_path: Path) -> None:
    out_path.parent.mkdir(parents=True, exist_ok=True)
    out_path.write_text(
        json.dumps(record, indent=2, sort_keys=True, ensure_ascii=True) + "\n",
        encoding="utf-8",
    )


# --------------------------------------------------------------------------
# check
# --------------------------------------------------------------------------


def _compare(label: str, expected: Any, actual: Any) -> None:
    if expected != actual:
        raise BindingError(f"{label} mismatch: record {expected!r}, working tree {actual!r}")


def _require_str(record: dict[str, Any], section: str, key: str) -> str:
    value = record.get(key)
    if not isinstance(value, str) or not value:
        raise BindingError(f"{section}: missing or non-string {key!r}")
    return value


def check_record_object(
    record: dict[str, Any], repo_root: Path | str, *, semantic: bool = False
) -> str:
    """Verify a loaded record against the working tree.  Returns the self hash."""

    root = Path(repo_root).resolve()
    keys = set(record)
    expected_keys = set(TOP_LEVEL_KEYS)
    extra = sorted(keys - expected_keys)
    if extra:
        raise BindingError("unexpected top-level keys in record: " + ", ".join(extra))
    missing = sorted(expected_keys - keys)
    if missing:
        raise BindingError("missing top-level keys in record: " + ", ".join(missing))

    stored = record.get("self_hash")
    if not isinstance(stored, dict):
        raise BindingError("self_hash is not an object")
    if set(stored) != {"domain", "sha256"}:
        raise BindingError("self_hash must have exactly the keys 'domain' and 'sha256'")
    if stored.get("domain") != SELF_HASH_DOMAIN:
        raise BindingError(f"self_hash domain mismatch: {stored.get('domain')!r}")
    recomputed = compute_self_hash(record)
    if stored.get("sha256") != recomputed:
        raise BindingError(
            f"self_hash mismatch: record stores {stored.get('sha256')!r}, payload hashes to {recomputed!r}"
        )
    if record.get("schema") != SCHEMA:
        raise BindingError(f"schema mismatch: expected {SCHEMA!r}, record has {record.get('schema')!r}")

    roots = record.get("roots")
    if not isinstance(roots, dict) or set(roots) != {"lake_root", "source_root"}:
        raise BindingError("roots must have exactly the keys 'lake_root' and 'source_root'")
    source_relative = normalize_repo_relative(str(roots["source_root"]), label="source root")
    lake_relative = normalize_repo_relative(str(roots["lake_root"]), label="lake root")

    declarations = record.get("declarations")
    if not isinstance(declarations, list) or not declarations:
        raise BindingError("declarations must be a non-empty list")
    if len(set(declarations)) != len(declarations):
        raise BindingError("declarations contains duplicate names")

    ingress = record.get("ingress")
    if not isinstance(ingress, dict):
        raise BindingError("ingress is not an object")
    ingress_module = _require_str(ingress, "ingress", "module")
    current_ingress = module_source_record(root, source_relative, ingress_module, label="ingress module")
    _compare("ingress path", ingress.get("path"), current_ingress["path"])
    _compare("ingress byte_count", ingress.get("byte_count"), current_ingress["byte_count"])
    _compare("ingress sha256", ingress.get("sha256"), current_ingress["sha256"])

    aggregate = record.get("aggregate")
    if not isinstance(aggregate, dict):
        raise BindingError("aggregate is not an object")
    aggregate_module = _require_str(aggregate, "aggregate", "module")
    current_aggregate = module_source_record(root, source_relative, aggregate_module, label="aggregate module")
    _compare("aggregate path", aggregate.get("path"), current_aggregate["path"])
    _compare("aggregate byte_count", aggregate.get("byte_count"), current_aggregate["byte_count"])
    _compare("aggregate sha256", aggregate.get("sha256"), current_aggregate["sha256"])

    aggregate_text = repo_path(
        root, current_aggregate["path"], label="aggregate module"
    ).read_bytes().decode("utf-8")
    current_edge = find_import_edge(aggregate_text, ingress_module)
    _compare("import_edge", record.get("import_edge"), current_edge)

    current_closure = compute_closure(root, source_relative, ingress_module)
    closure = record.get("closure")
    if not isinstance(closure, dict):
        raise BindingError("closure is not an object")
    _compare("closure module_count", closure.get("module_count"), current_closure["module_count"])
    _compare("closure modules_digest", closure.get("modules_digest"), current_closure["modules_digest"])
    _compare(
        "closure per_module_digest",
        closure.get("per_module_digest"),
        current_closure["per_module_digest"],
    )
    _compare(
        "closure external_imports",
        closure.get("external_imports"),
        current_closure["external_imports"],
    )

    recapture = record.get("recapture")
    if not isinstance(recapture, dict) or recapture.get("stable") is not True:
        raise BindingError("recapture is missing or does not record a stable capture")
    _compare("recapture ingress_sha256_recaptured", recapture.get("ingress_sha256_recaptured"), current_ingress["sha256"])
    _compare("recapture aggregate_sha256_recaptured", recapture.get("aggregate_sha256_recaptured"), current_aggregate["sha256"])
    _compare(
        "recapture closure_digest_recaptured",
        recapture.get("closure_digest_recaptured"),
        current_closure["per_module_digest"],
    )

    parent = record.get("parent")
    if not isinstance(parent, dict):
        raise BindingError("parent is not an object")
    parent_kind = _require_str(parent, "parent", "record_kind")
    parent_relative = _require_str(parent, "parent", "path")
    current_parent = parent_link_record(root, parent_relative, parent_kind)
    _compare("parent byte_count", parent.get("byte_count"), current_parent["byte_count"])
    _compare("parent sha256", parent.get("sha256"), current_parent["sha256"])
    _compare("parent schema", parent.get("schema"), current_parent["schema"])
    _compare("parent link_digest", parent.get("link_digest"), current_parent["link_digest"])

    build_evidence = record.get("build_evidence")
    if not isinstance(build_evidence, dict):
        raise BindingError("build_evidence is not an object")
    log_relative = _require_str(build_evidence, "build_evidence", "log_path")
    current_build = build_evidence_record(root, log_relative, aggregate_module)
    _compare("build_evidence log_sha256", build_evidence.get("log_sha256"), current_build["log_sha256"])
    _compare(
        "build_evidence aggregate_built_line",
        build_evidence.get("aggregate_built_line"),
        current_build["aggregate_built_line"],
    )
    _compare(
        "build_evidence build_exit_line",
        build_evidence.get("build_exit_line"),
        current_build["build_exit_line"],
    )

    recorded_semantic = record.get("semantic")
    if not isinstance(recorded_semantic, dict):
        raise BindingError("semantic is not an object")
    if semantic:
        timeout = recorded_semantic.get("timeout_seconds")
        if not isinstance(timeout, int):
            raise BindingError("semantic: missing integer 'timeout_seconds'")
        current_semantic = run_semantic_probe(
            repo_root=root,
            lake_root=lake_relative,
            aggregate_module=aggregate_module,
            declarations=list(declarations),
            timeout=timeout,
        )
        _compare("semantic", recorded_semantic, current_semantic)

    return str(stored["sha256"])


def check_record_file(record_path: Path, repo_root: Path | str, *, semantic: bool = False) -> str:
    data = read_file_bytes(Path(record_path), label="binding record")
    record = load_json_object(data, label="binding record")
    return check_record_object(record, repo_root, semantic=semantic)


# --------------------------------------------------------------------------
# command line
# --------------------------------------------------------------------------


def _resolve_output(repo_root: Path, raw: str) -> Path:
    candidate = Path(raw)
    if candidate.is_absolute():
        return candidate
    return repo_root / candidate


def build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(
        prog="bind_lean_ingress_record.py",
        description="Generate and check a Lean-ingress publication binding record.",
    )
    subparsers = parser.add_subparsers(dest="command", required=True)

    generate = subparsers.add_parser("generate", help="write a new binding record")
    generate.add_argument("--repo-root", default=".", help="repository root (default: .)")
    generate.add_argument("--lake-root", default="lean", help="Lake root, repository-relative")
    generate.add_argument("--source-root", default="lean", help="Lean source root, repository-relative")
    generate.add_argument("--ingress-module", required=True)
    generate.add_argument("--aggregate-module", required=True)
    generate.add_argument(
        "--declaration",
        dest="declarations",
        action="append",
        required=True,
        help="fully qualified Lean declaration; repeat for several",
    )
    generate.add_argument("--parent-record", required=True, help="repository-relative parent JSON")
    generate.add_argument("--parent-kind", required=True, help="typed parent record kind")
    generate.add_argument("--build-log", required=True, help="repository-relative build log")
    generate.add_argument("--out", required=True, help="output JSON path")
    generate.add_argument(
        "--lake-env-lean-timeout",
        type=int,
        default=DEFAULT_LAKE_ENV_LEAN_TIMEOUT,
        help=f"seconds for each 'lake env lean' call (default: {DEFAULT_LAKE_ENV_LEAN_TIMEOUT})",
    )

    check = subparsers.add_parser("check", help="verify an existing binding record")
    check.add_argument("--repo-root", default=".", help="repository root (default: .)")
    check.add_argument("--record", required=True, help="binding record JSON path")
    check.add_argument(
        "--semantic",
        action="store_true",
        help="re-run the Lean probe (off by default)",
    )
    return parser


def main(argv: list[str] | None = None) -> int:
    args = build_parser().parse_args(argv)
    repo_root = Path(args.repo_root).resolve()
    if args.command == "generate":
        try:
            record = generate_record(
                repo_root=repo_root,
                lake_root=args.lake_root,
                source_root=args.source_root,
                ingress_module=args.ingress_module,
                aggregate_module=args.aggregate_module,
                declarations=list(args.declarations),
                parent_record=args.parent_record,
                parent_kind=args.parent_kind,
                build_log=args.build_log,
                lake_env_lean_timeout=args.lake_env_lean_timeout,
            )
            out_path = _resolve_output(repo_root, args.out)
            write_record(record, out_path)
        except (BindingError, ValueError, OSError) as exc:
            print("BINDING GENERATE FAILED: " + " ".join(str(exc).split()), file=sys.stderr)
            return 1
        print(f"BINDING RECORD WRITTEN {out_path} {record['self_hash']['sha256']}")
        return 0

    try:
        digest = check_record_file(
            _resolve_output(repo_root, args.record), repo_root, semantic=args.semantic
        )
    except (BindingError, ValueError, OSError) as exc:
        print("BINDING CHECK FAILED: " + " ".join(str(exc).split()), file=sys.stderr)
        return 1
    print(f"BINDING CHECK OK {digest}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
