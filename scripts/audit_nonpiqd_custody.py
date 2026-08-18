#!/usr/bin/env python3
"""Tier-0 custody survey for durable computational output not produced by piqd.

Read-only.  Emits one JSONL record per in-scope artifact plus a summary
document.  The survey reports; it never gates.  It exits non-zero only when the
checker itself fails.

Scope is the git-tracked file set under the requested roots.  Tracked scope is
deduplicated by construction: the whole-repository copies that inflate
filesystem counts (``*-source/``, ``exact-sha-worktrees/``, ``.lake/``,
``vendor/``) are not tracked.  Any count taken from the filesystem instead --
the writer index below -- applies the corrected exclusion set.

Guards (bounded reads, no symlink following, duplicate-key rejection, JSON shape
bounds) follow ``census/card_head/exact12_next_row_arm_static_v24_validator.py``.

Usage:
    uv run python scripts/audit_nonpiqd_custody.py survey \
        --repo-root . --root scratch --root census --root certificates \
        --out <run-root>/artifacts/custody-survey.jsonl \
        --summary-out <run-root>/artifacts/custody-summary.json
    uv run python scripts/audit_nonpiqd_custody.py links --repo-root .
    uv run python scripts/audit_nonpiqd_custody.py writer-index --repo-root . --out <path>
"""

from __future__ import annotations

import argparse
import ast
import hashlib
import json
import math
import os
import re
import stat
import subprocess
import sys
from collections import Counter
from collections.abc import Iterable, Iterator
from pathlib import Path, PurePosixPath
from typing import Any

SCHEMA = "nonpiqd-custody-survey/v1"
SUMMARY_SCHEMA = "nonpiqd-custody-summary/v1"
LINKS_SCHEMA = "nonpiqd-lean-reverse-link/v1"
WRITER_INDEX_SCHEMA = "nonpiqd-writer-index/v1"

MAX_FILE_BYTES = 256 * 1024 * 1024
MAX_JSON_BYTES = 64 * 1024 * 1024
MAX_JSON_DEPTH = 96
MAX_JSON_NODES = 4_000_000

# The documented preflight in docs/audits/2026-08-16-scratch-pattern-audit-verification.md
# excludes only "*-source/scratch/".  A "*-source/" directory is a whole
# repository checkout, so excluding its scratch/ subtree alone leaves a 6.8x
# residual inflation on *.lean.  Exclude the whole tree.
EXCLUDED_DIR_NAMES = frozenset(
    {".lake", "vendor", "exact-sha-worktrees", "__pycache__", ".git"}
)
EXCLUDED_DIR_SUFFIXES = ("-source",)
EXCLUDED_PREFIXES = ("scratch/exact12-overlay-20260810/",)

# Fields that identify a record as having passed through the piqd daemon.
PIQD_FIELD_MARKERS = frozenset(
    {
        "piqd_url",
        "piqd_session_id",
        "piqd_job_id",
        "expected_piqd_job_id",
        "piqd_daemon_sha256",
        "piqd_data_root",
        "job_id",
        "job_identity",
        "prepared_job_identity",
        "root_job_id",
        "source_job_id",
        "cnf_blob_hash",
        "kept_cnf_blob_hash",
        "identity_hash",
        "solver_profile",
        "daemon_sha256",
        "deciding_daemon_sha256",
        "daemon_attestation",
        "endpoint_trace",
        "custody_seal_sha256",
    }
)

# Candidate self-hash fields.  A field is only treated as a self-hash when a
# recomputation variant actually matches; otherwise it is a reference to some
# other document and carries no self-hash obligation.
SELF_HASH_FIELDS = (
    "manifest_sha256",
    "bank_sha256",
    "receipt_sha256",
    "record_sha256",
    "seal_sha256",
    "custody_seal_sha256",
    "job_id",
)

# `generator` is a decoy: in certificates/ it holds polynomial strings, not a
# producer name.  Never key on it.
WRITER_SIDECAR_FIELDS = ("producer", "command", "argv", "script", "module")

_HEX64 = re.compile(r"[0-9a-f]{64}")
_KIND_BY_SUFFIX = {
    ".json": "json",
    ".jsonl": "jsonl",
    ".lean": "lean",
    ".py": "py",
    ".md": "md",
    ".txt": "txt",
    ".log": "log",
    ".smt2": "smt2",
    ".cnf": "cnf",
    ".drat": "drat",
    ".lrat": "lrat",
    ".sing": "sing",
    ".singexpr": "singexpr",
    ".sh": "sh",
}


class SurveyError(RuntimeError):
    """Raised when the checker itself cannot proceed."""


# --------------------------------------------------------------------------
# bounded, symlink-free reads (semantics copied from the v24 validator)
# --------------------------------------------------------------------------


def canonical_json_bytes(value: Any) -> bytes:
    return json.dumps(
        value,
        sort_keys=True,
        separators=(",", ":"),
        ensure_ascii=False,
        allow_nan=False,
    ).encode("utf-8")


def pretty_json_bytes(value: Any) -> bytes:
    return (json.dumps(value, sort_keys=True, indent=2, allow_nan=False) + "\n").encode(
        "utf-8"
    )


def sha256_bytes(raw: bytes) -> str:
    return hashlib.sha256(raw).hexdigest()


def _pairs(pairs: list[tuple[str, Any]]) -> dict[str, Any]:
    result: dict[str, Any] = {}
    for key, value in pairs:
        if key in result:
            raise SurveyError(f"duplicate JSON key: {key}")
        result[key] = value
    return result


def _shape(value: Any, depth: int = 0, count: list[int] | None = None) -> None:
    count = [0] if count is None else count
    count[0] += 1
    if count[0] > MAX_JSON_NODES or depth > MAX_JSON_DEPTH:
        raise SurveyError("JSON shape exceeds bound")
    if isinstance(value, float) and not math.isfinite(value):
        raise SurveyError("non-finite JSON number")
    if isinstance(value, dict):
        for key, item in value.items():
            if type(key) is not str:
                raise SurveyError("non-string JSON key")
            _shape(item, depth + 1, count)
    elif isinstance(value, list):
        for item in value:
            _shape(item, depth + 1, count)


def open_regular(
    path: Path, maximum: int = MAX_FILE_BYTES
) -> tuple[int, os.stat_result]:
    """Open a regular file without following any symlink on the path."""
    native = Path(os.path.abspath(os.fspath(path)))
    if not native.parts or native.parts[0] != os.sep:
        raise SurveyError(f"not absolute: {path}")
    flags = os.O_RDONLY | getattr(os, "O_CLOEXEC", 0) | getattr(os, "O_NOFOLLOW", 0)
    directory_flags = flags | getattr(os, "O_DIRECTORY", 0)
    root = os.open(os.sep, directory_flags)
    current = root
    try:
        for component in native.parts[1:-1]:
            if component in {"", ".", ".."}:
                raise SurveyError(f"unsafe path: {path}")
            nxt = os.open(component, directory_flags, dir_fd=current)
            info = os.fstat(nxt)
            if not stat.S_ISDIR(info.st_mode) or stat.S_ISLNK(info.st_mode):
                os.close(nxt)
                raise SurveyError(f"symlinked/non-directory ancestor: {path}")
            if current != root:
                os.close(current)
            current = nxt
        try:
            fd = os.open(native.parts[-1], flags, dir_fd=current)
        except OSError as exc:
            raise SurveyError(
                f"cannot open without following links: {path}: {exc}"
            ) from exc
        info = os.fstat(fd)
        if not stat.S_ISREG(info.st_mode) or stat.S_ISLNK(info.st_mode):
            os.close(fd)
            raise SurveyError(f"not a regular file: {path}")
        if info.st_size > maximum:
            os.close(fd)
            raise SurveyError(f"file exceeds bound: {path}")
        return fd, info
    finally:
        if current != root:
            os.close(current)
        os.close(root)


def read_bounded(
    path: Path, maximum: int = MAX_FILE_BYTES
) -> tuple[bytes, os.stat_result]:
    fd, before = open_regular(path, maximum)
    try:
        chunks: list[bytes] = []
        total = 0
        while True:
            chunk = os.read(fd, min(1024 * 1024, maximum + 1 - total))
            if not chunk:
                break
            chunks.append(chunk)
            total += len(chunk)
        after = os.fstat(fd)
    finally:
        os.close(fd)
    if (
        before.st_size != after.st_size
        or before.st_mtime_ns != after.st_mtime_ns
        or before.st_ino != after.st_ino
    ):
        raise SurveyError(f"file changed while reading: {path}")
    return b"".join(chunks), before


def load_json_bounded(raw: bytes) -> Any:
    if len(raw) > MAX_JSON_BYTES:
        raise SurveyError("JSON exceeds bounded size")
    try:
        value = json.loads(raw.decode("utf-8"), object_pairs_hook=_pairs)
    except (UnicodeDecodeError, json.JSONDecodeError, RecursionError) as exc:
        raise SurveyError(f"invalid JSON: {exc}") from exc
    _shape(value)
    return value


# --------------------------------------------------------------------------
# scope
# --------------------------------------------------------------------------


def is_excluded(rel: str) -> bool:
    """Apply the corrected preflight exclusion set to a repo-relative path."""
    if any(rel.startswith(prefix) for prefix in EXCLUDED_PREFIXES):
        return True
    for part in PurePosixPath(rel).parts[:-1]:
        if part in EXCLUDED_DIR_NAMES:
            return True
        if part.endswith(EXCLUDED_DIR_SUFFIXES):
            return True
    return False


def tracked_files(repo: Path, roots: Iterable[str]) -> list[str]:
    args = ["git", "-C", str(repo), "ls-files", "-z", "--", *roots]
    out = subprocess.run(args, capture_output=True, check=True).stdout
    return sorted(p for p in out.decode("utf-8").split("\0") if p)


def kind_of(rel: str) -> str:
    return _KIND_BY_SUFFIX.get(PurePosixPath(rel).suffix.lower(), "other")


# --------------------------------------------------------------------------
# reference extraction and ordered resolution
# --------------------------------------------------------------------------


def walk_objects(value: Any) -> Iterator[dict[str, Any]]:
    if isinstance(value, dict):
        yield value
        for item in value.values():
            yield from walk_objects(item)
    elif isinstance(value, list):
        for item in value:
            yield from walk_objects(item)


def extract_references(value: Any) -> list[dict[str, Any]]:
    """Collect {path, sha256[, bytes]} records and `<p>_path`/`<p>_sha256` pairs."""
    found: list[dict[str, Any]] = []
    seen: set[tuple[str, str]] = set()
    for obj in walk_objects(value):
        path = obj.get("path")
        digest = obj.get("sha256")
        if (
            isinstance(path, str)
            and isinstance(digest, str)
            and _HEX64.fullmatch(digest)
        ):
            key = (path, digest)
            if key not in seen:
                seen.add(key)
                size = obj.get("bytes")
                found.append(
                    {
                        "path": path,
                        "sha256": digest,
                        "bytes": size if isinstance(size, int) else None,
                    }
                )
        for key_name, item in obj.items():
            if not key_name.endswith("_path") or not isinstance(item, str):
                continue
            prefix = key_name[: -len("_path")]
            sibling = obj.get(f"{prefix}_sha256")
            if isinstance(sibling, str) and _HEX64.fullmatch(sibling):
                key = (item, sibling)
                if key not in seen:
                    seen.add(key)
                    found.append({"path": item, "sha256": sibling, "bytes": None})
    return found


def resolve_reference(
    repo: Path, record_rel: str, raw_path: str
) -> tuple[str, Path | None]:
    """Ordered resolution.  Returns (strategy, resolved) or (reason, None).

    A root-only resolver reports large numbers of false 'missing' files, so the
    strategy that succeeded is recorded per reference.
    """
    candidate = Path(raw_path)
    if candidate.is_absolute():
        try:
            inside = candidate.resolve().relative_to(repo.resolve())
        except ValueError:
            return ("absolute_external", candidate if candidate.exists() else None)
        target = repo / inside
        return (
            ("absolute_internal", target) if target.exists() else ("abs_missing", None)
        )
    if ".." in candidate.parts:
        return ("unsafe_relative", None)
    target = repo / raw_path
    if target.exists():
        return ("root_rel", target)
    record_dir = (repo / record_rel).parent
    target = record_dir / raw_path
    if target.exists():
        return ("manifest_rel", target)
    ancestor = record_dir
    for level in range(1, 5):
        ancestor = ancestor.parent
        if not str(ancestor).startswith(str(repo)):
            break
        target = ancestor / raw_path
        if target.exists():
            return (f"ancestor_rel_{level}", target)
    return ("unresolved", None)


def digest_file(path: Path) -> tuple[str, int]:
    digest = hashlib.sha256()
    size = 0
    with open(path, "rb") as handle:
        while True:
            chunk = handle.read(1024 * 1024)
            if not chunk:
                break
            digest.update(chunk)
            size += len(chunk)
    return digest.hexdigest(), size


# --------------------------------------------------------------------------
# classification
# --------------------------------------------------------------------------


def route_markers(value: Any, record_schema: str | None) -> list[str]:
    markers: list[str] = []
    if isinstance(record_schema, str) and "piqd" in record_schema.lower():
        markers.append("schema")
    for obj in walk_objects(value):
        for key in obj:
            if key in PIQD_FIELD_MARKERS:
                markers.append(key)
    return sorted(set(markers))


def check_self_hash(value: Any) -> list[dict[str, Any]]:
    """Recompute candidate self-hash fields.  Only a matching variant counts."""
    results: list[dict[str, Any]] = []
    if not isinstance(value, dict):
        return results
    for field in SELF_HASH_FIELDS:
        recorded = value.get(field)
        if not isinstance(recorded, str) or not _HEX64.fullmatch(recorded):
            continue
        unsigned = {k: v for k, v in value.items() if k != field}
        matched = None
        for name, encoder in (
            ("compact", canonical_json_bytes),
            ("pretty", pretty_json_bytes),
        ):
            try:
                if sha256_bytes(encoder(unsigned)) == recorded:
                    matched = name
                    break
            except (TypeError, ValueError):
                continue
        results.append(
            {
                "field": field,
                "recorded": recorded,
                "variant": matched,
                "verdict": "self_hash_ok" if matched else "not_a_self_hash",
            }
        )
    return results


def sidecar_writer(value: Any) -> tuple[str | None, str | None]:
    if not isinstance(value, dict):
        return (None, None)
    for field in WRITER_SIDECAR_FIELDS:
        item = value.get(field)
        if isinstance(item, str) and item.strip():
            return (item.strip()[:400], field)
        if isinstance(item, list) and item and isinstance(item[0], str):
            return (" ".join(str(x) for x in item)[:400], field)
    return (None, None)


# --------------------------------------------------------------------------
# writer index: schema-literal reverse map
# --------------------------------------------------------------------------


def python_string_constants(path: Path) -> set[str]:
    try:
        raw, _info = read_bounded(path, maximum=8 * 1024 * 1024)
        tree = ast.parse(raw.decode("utf-8", errors="replace"), filename=str(path))
    except (SurveyError, SyntaxError, ValueError):
        return set()
    out: set[str] = set()
    for node in ast.walk(tree):
        if (
            isinstance(node, ast.Constant)
            and isinstance(node.value, str)
            and 3 <= len(node.value) <= 200
        ):
            out.add(node.value)
    return out


def build_writer_index(repo: Path, schemas: set[str]) -> dict[str, list[str]]:
    """Map each observed `schema` value to the live .py modules that spell it."""
    index: dict[str, list[str]] = {}
    for root in ("census", "scripts", "scratch"):
        base = repo / root
        if not base.is_dir():
            continue
        for dirpath, dirnames, filenames in os.walk(base):
            dirnames[:] = [
                d
                for d in dirnames
                if d not in EXCLUDED_DIR_NAMES and not d.endswith(EXCLUDED_DIR_SUFFIXES)
            ]
            for name in filenames:
                if not name.endswith(".py"):
                    continue
                path = Path(dirpath) / name
                rel = str(path.relative_to(repo))
                if is_excluded(rel):
                    continue
                for literal in python_string_constants(path) & schemas:
                    index.setdefault(literal, []).append(rel)
    return {key: sorted(set(paths)) for key, paths in index.items()}


def resolve_writer(
    schema: str | None, index: dict[str, list[str]], record_rel: str
) -> dict[str, Any]:
    if not schema or schema not in index:
        return {"module": None, "evidence": "none", "ambiguous": False}
    candidates = index[schema]
    if len(candidates) == 1:
        return {
            "module": candidates[0],
            "evidence": "schema_literal",
            "ambiguous": False,
        }
    record_parts = PurePosixPath(record_rel).parts
    best, best_score = candidates[0], -1
    for candidate in candidates:
        parts = PurePosixPath(candidate).parts
        score = 0
        for left, right in zip(record_parts, parts):
            if left != right:
                break
            score += 1
        if score > best_score:
            best, best_score = candidate, score
    return {
        "module": best,
        "evidence": "schema_literal",
        "ambiguous": True,
        "candidates": candidates,
    }


# --------------------------------------------------------------------------
# Lean reverse-link check
# --------------------------------------------------------------------------

# Match a FULL extension.  An alternation on `json` truncates `bank.jsonl` to
# `bank.json` and reports false dangling links.
_LEAN_REF = re.compile(
    r"(?:scratch|census|certificates)/[A-Za-z0-9_./-]+\.[A-Za-z0-9]+"
)


def lean_reverse_links(repo: Path) -> dict[str, Any]:
    lean_root = repo / "lean"
    tokens: set[str] = set()
    by_token: dict[str, set[str]] = {}
    for dirpath, dirnames, filenames in os.walk(lean_root):
        dirnames[:] = [d for d in dirnames if d not in EXCLUDED_DIR_NAMES]
        for name in filenames:
            if not name.endswith(".lean"):
                continue
            path = Path(dirpath) / name
            try:
                text = path.read_text(encoding="utf-8", errors="replace")
            except OSError:
                continue
            rel = str(path.relative_to(repo))
            for match in _LEAN_REF.findall(text):
                token = match.rstrip(".,;:)`")
                tokens.add(token)
                by_token.setdefault(token, set()).add(rel)
    missing = []
    for token in sorted(tokens):
        if not (repo / token).exists():
            consumers = sorted(by_token[token])
            # lean/scratch/ is not a lean_lib root, so links only from there are
            # off-spine.
            off_spine = all(c.startswith("lean/scratch/") for c in consumers)
            missing.append(
                {
                    "token": token,
                    "named_by": consumers,
                    "off_spine_only": off_spine,
                }
            )
    return {
        "schema": LINKS_SCHEMA,
        "tokens_named": len(tokens),
        "present": len(tokens) - len(missing),
        "missing": missing,
    }


# --------------------------------------------------------------------------
# survey
# --------------------------------------------------------------------------


def survey_record(
    repo: Path, rel: str, writer_index: dict[str, list[str]]
) -> dict[str, Any]:
    record: dict[str, Any] = {
        "schema": SCHEMA,
        "path": rel,
        "kind": kind_of(rel),
        "bytes": None,
        "sha256": None,
        "record_schema": None,
        "writer": {"module": None, "evidence": "none", "ambiguous": False},
        "route_markers": [],
        "route_class": "NON_SOLVER",
        "self_hash": [],
        "referenced_inputs": [],
        "external_references": [],
        "defects": [],
    }
    absolute = repo / rel
    try:
        raw, info = read_bounded(absolute)
    except SurveyError as exc:
        record["defects"].append({"reason": "UNREADABLE", "detail": str(exc)})
        return record
    record["bytes"] = info.st_size
    record["sha256"] = sha256_bytes(raw)

    if record["kind"] != "json":
        return record

    try:
        value = load_json_bounded(raw)
    except SurveyError as exc:
        record["defects"].append({"reason": "JSON_INVALID", "detail": str(exc)})
        return record

    schema_value = value.get("schema") if isinstance(value, dict) else None
    record["record_schema"] = schema_value if isinstance(schema_value, str) else None
    record["writer"] = resolve_writer(record["record_schema"], writer_index, rel)
    if record["writer"]["module"] is None:
        text, field = sidecar_writer(value)
        if text is not None:
            record["writer"] = {"module": text, "evidence": field, "ambiguous": False}
    record["route_markers"] = route_markers(value, record["record_schema"])
    record["self_hash"] = check_self_hash(value)

    for reference in extract_references(value):
        strategy, resolved = resolve_reference(repo, rel, reference["path"])
        entry = dict(reference)
        entry["resolution"] = strategy
        entry["resolved_path"] = None
        entry["hash_verdict"] = "not_checked"
        if strategy == "absolute_external":
            record["external_references"].append(
                {
                    "path": reference["path"],
                    "exists": resolved is not None,
                }
            )
            entry["hash_verdict"] = "external"
        elif resolved is not None:
            try:
                actual, size = digest_file(resolved)
            except OSError as exc:
                entry["hash_verdict"] = "UNREADABLE"
                record["defects"].append(
                    {
                        "reason": "REFERENCE_UNREADABLE",
                        "detail": f"{reference['path']}: {exc}",
                    }
                )
            else:
                entry["resolved_path"] = (
                    str(resolved.relative_to(repo))
                    if str(resolved).startswith(str(repo))
                    else str(resolved)
                )
                if actual == reference["sha256"]:
                    entry["hash_verdict"] = "MATCH"
                else:
                    entry["hash_verdict"] = "MISMATCH"
                    record["defects"].append(
                        {
                            "reason": "REFERENCE_HASH_MISMATCH",
                            "detail": reference["path"],
                        }
                    )
                if reference["bytes"] is not None and reference["bytes"] != size:
                    record["defects"].append(
                        {
                            "reason": "REFERENCE_SIZE_MISMATCH",
                            "detail": reference["path"],
                        }
                    )
        elif strategy in {"unresolved", "abs_missing", "unsafe_relative"}:
            entry["hash_verdict"] = strategy.upper()
        record["referenced_inputs"].append(entry)

    if record["route_markers"]:
        record["route_class"] = "PIQD_BACKED"
    return record


def summarize(records: list[dict[str, Any]], links: dict[str, Any]) -> dict[str, Any]:
    """Every count is a (files, distinct paths, distinct contents) triple."""
    by_class: dict[str, list[dict[str, Any]]] = {}
    for record in records:
        by_class.setdefault(record["route_class"], []).append(record)

    def triple(rows: list[dict[str, Any]]) -> dict[str, int]:
        return {
            "files": len(rows),
            "distinct_paths": len({r["path"] for r in rows}),
            "distinct_contents": len({r["sha256"] for r in rows if r["sha256"]}),
        }

    json_records = [r for r in records if r["kind"] == "json"]
    hashed = [
        r
        for r in json_records
        if r["referenced_inputs"]
        or any(s["verdict"] == "self_hash_ok" for s in r["self_hash"])
    ]
    unprovenanced = [
        r for r in json_records if not r["route_markers"] and r not in hashed
    ]
    resolution_counter: Counter[str] = Counter()
    verdict_counter: Counter[str] = Counter()
    defect_counter: Counter[str] = Counter()
    for record in records:
        for entry in record["referenced_inputs"]:
            resolution_counter[entry["resolution"]] += 1
            verdict_counter[entry["hash_verdict"]] += 1
        for defect in record["defects"]:
            defect_counter[defect["reason"]] += 1
    schema_counter = Counter(
        r["record_schema"] for r in json_records if r["record_schema"]
    )
    return {
        "schema": SUMMARY_SCHEMA,
        "scope": triple(records),
        "json_records": triple(json_records),
        "by_route_class": {
            name: triple(rows) for name, rows in sorted(by_class.items())
        },
        "json_with_piqd_marker": len([r for r in json_records if r["route_markers"]]),
        "json_unprovenanced": len(unprovenanced),
        "distinct_record_schemas": len(schema_counter),
        "top_record_schemas": schema_counter.most_common(20),
        "reference_resolution": dict(resolution_counter.most_common()),
        "reference_verdicts": dict(verdict_counter.most_common()),
        "defects": dict(defect_counter.most_common()),
        "writer_attribution": {
            "schema_literal": len(
                [r for r in json_records if r["writer"]["evidence"] == "schema_literal"]
            ),
            "sidecar": len(
                [
                    r
                    for r in json_records
                    if r["writer"]["evidence"] in WRITER_SIDECAR_FIELDS
                ]
            ),
            "unattributed": len(
                [r for r in json_records if r["writer"]["evidence"] == "none"]
            ),
            "ambiguous": len([r for r in json_records if r["writer"].get("ambiguous")]),
        },
        "lean_reverse_links": {
            "tokens_named": links["tokens_named"],
            "present": links["present"],
            "missing": len(links["missing"]),
            "missing_off_spine_only": len(
                [m for m in links["missing"] if m["off_spine_only"]]
            ),
        },
    }


def cmd_survey(args: argparse.Namespace) -> int:
    repo = Path(args.repo_root).resolve()
    files = [f for f in tracked_files(repo, args.root) if not is_excluded(f)]
    sys.stderr.write(
        f"scope: {len(files)} tracked files under {', '.join(args.root)}\n"
    )

    schemas: set[str] = set()
    for rel in files:
        if kind_of(rel) != "json":
            continue
        try:
            raw, _info = read_bounded(repo / rel, maximum=MAX_JSON_BYTES)
            value = load_json_bounded(raw)
        except SurveyError:
            continue
        if isinstance(value, dict) and isinstance(value.get("schema"), str):
            schemas.add(value["schema"])
    sys.stderr.write(f"observed {len(schemas)} distinct record schemas\n")

    writer_index = build_writer_index(repo, schemas)
    sys.stderr.write(
        f"writer index resolved {len(writer_index)}/{len(schemas)} schemas\n"
    )

    links = lean_reverse_links(repo)
    sys.stderr.write(
        f"lean reverse links: {links['tokens_named']} named, "
        f"{links['present']} present, {len(links['missing'])} missing\n"
    )

    records: list[dict[str, Any]] = []
    out_path = Path(args.out)
    out_path.parent.mkdir(parents=True, exist_ok=True)
    with open(out_path, "w", encoding="utf-8") as handle:
        for index, rel in enumerate(files, 1):
            record = survey_record(repo, rel, writer_index)
            records.append(record)
            handle.write(json.dumps(record, sort_keys=True) + "\n")
            if index % 2000 == 0:
                sys.stderr.write(f"  surveyed {index}/{len(files)}\n")

    summary = summarize(records, links)
    summary["lean_reverse_link_detail"] = links["missing"]
    summary_path = Path(args.summary_out)
    summary_path.parent.mkdir(parents=True, exist_ok=True)
    summary_path.write_text(json.dumps(summary, indent=2, sort_keys=True) + "\n")
    sys.stderr.write(f"wrote {out_path} and {summary_path}\n")
    print(json.dumps(summary, indent=2, sort_keys=True))
    return 0


def cmd_links(args: argparse.Namespace) -> int:
    repo = Path(args.repo_root).resolve()
    print(json.dumps(lean_reverse_links(repo), indent=2, sort_keys=True))
    return 0


def cmd_writer_index(args: argparse.Namespace) -> int:
    repo = Path(args.repo_root).resolve()
    files = [
        f
        for f in tracked_files(repo, ["scratch", "census", "certificates"])
        if not is_excluded(f) and kind_of(f) == "json"
    ]
    schemas: set[str] = set()
    for rel in files:
        try:
            raw, _info = read_bounded(repo / rel, maximum=MAX_JSON_BYTES)
            value = load_json_bounded(raw)
        except SurveyError:
            continue
        if isinstance(value, dict) and isinstance(value.get("schema"), str):
            schemas.add(value["schema"])
    index = build_writer_index(repo, schemas)
    document = {
        "schema": WRITER_INDEX_SCHEMA,
        "observed_schemas": len(schemas),
        "resolved_schemas": len(index),
        "index": index,
    }
    if args.out:
        Path(args.out).parent.mkdir(parents=True, exist_ok=True)
        Path(args.out).write_text(json.dumps(document, indent=2, sort_keys=True) + "\n")
    print(json.dumps({k: v for k, v in document.items() if k != "index"}, indent=2))
    return 0


def build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(description=__doc__)
    sub = parser.add_subparsers(dest="command", required=True)

    survey = sub.add_parser("survey", help="run the Tier-0 custody survey")
    survey.add_argument("--repo-root", default=".")
    survey.add_argument(
        "--root",
        action="append",
        default=None,
        help="repo-relative root to survey (repeatable)",
    )
    survey.add_argument("--out", required=True, help="JSONL survey output path")
    survey.add_argument("--summary-out", required=True, help="summary JSON output path")
    survey.set_defaults(func=cmd_survey)

    links = sub.add_parser("links", help="Lean reverse-link check only")
    links.add_argument("--repo-root", default=".")
    links.set_defaults(func=cmd_links)

    writer = sub.add_parser("writer-index", help="build the schema-literal reverse map")
    writer.add_argument("--repo-root", default=".")
    writer.add_argument("--out", default=None)
    writer.set_defaults(func=cmd_writer_index)
    return parser


def main(argv: list[str] | None = None) -> int:
    args = build_parser().parse_args(argv)
    if getattr(args, "root", None) is None and args.command == "survey":
        args.root = ["scratch", "census", "certificates"]
    return int(args.func(args))


if __name__ == "__main__":
    sys.exit(main())
