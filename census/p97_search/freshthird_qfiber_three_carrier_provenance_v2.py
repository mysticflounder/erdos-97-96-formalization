"""Content-addressed source custody for the FreshThird carrier wave.

This module is deliberately a reader: :func:`build_snapshot` returns a plain
JSON-compatible object and does not materialise anything on disk.  Git is used
only as an identity/status oracle; no index or worktree operation is run.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import re
import subprocess
from collections.abc import Iterable, Mapping, Sequence
from pathlib import Path
from typing import Any

SCHEMA = "p97-freshthird-qfiber-three-carrier-provenance/v2"
DEFAULT_SOURCE = (
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
    "FreshThirdQFiberThreeCarrierFiniteSourceTheory.lean"
)
_IMPORT = re.compile(
    r"^\s*import\s+([A-Za-z_][A-Za-z0-9_]*(?:\.[A-Za-z_][A-Za-z0-9_]*)*)"
)


class SourceSnapshotError(RuntimeError):
    """A source snapshot cannot be authenticated or is incomplete."""


def _fail(message: str, cause: BaseException | None = None) -> SourceSnapshotError:
    error = SourceSnapshotError(message)
    if cause is not None:
        error.__cause__ = cause
    return error


def _run_git(repo: Path, args: Sequence[str]) -> str:
    try:
        result = subprocess.run(
            ["git", *args],
            cwd=repo,
            check=True,
            capture_output=True,
            text=True,
        )
    except (OSError, UnicodeError, subprocess.SubprocessError) as exc:
        raise _fail(f"git command failed: git {' '.join(args)}", exc) from exc
    return result.stdout


def _git_context(repo: Path) -> tuple[dict[str, str], set[str]]:
    status_output = _run_git(
        repo,
        ["status", "--porcelain=v1", "--untracked-files=all", "--ignored=matching"],
    )
    status_by_path: dict[str, str] = {}
    for line in status_output.splitlines():
        if len(line) < 4 or line[2] != " ":
            raise _fail(f"malformed git porcelain row: {line!r}")
        path = line[3:]
        if " -> " in path or path.startswith('"'):
            raise _fail(f"unsupported git porcelain path: {path!r}")
        status_by_path[path] = line
    tracked = set(_run_git(repo, ["ls-files"]).splitlines())
    return status_by_path, tracked


def _relative(repo: Path, path: str | Path) -> tuple[Path, str]:
    candidate = Path(path)
    if not candidate.is_absolute():
        candidate = repo / candidate
    try:
        absolute = candidate.resolve(strict=False)
        relative = absolute.relative_to(repo.resolve())
    except (OSError, ValueError) as exc:
        raise _fail(f"path is outside repository: {path}", exc) from exc
    if not relative.parts or any(part == ".." for part in relative.parts):
        raise _fail(f"path is outside repository: {path}")
    return absolute, relative.as_posix()


def _read_bytes(repo: Path, path: str | Path) -> tuple[Path, str, bytes]:
    absolute, relative = _relative(repo, path)
    try:
        if not absolute.is_file():
            raise _fail(f"missing source file: {relative}")
        data = absolute.read_bytes()
    except SourceSnapshotError:
        raise
    except OSError as exc:
        raise _fail(f"cannot read source file: {relative}", exc) from exc
    return absolute, relative, data


def _git_row(
    repo: Path,
    absolute: Path,
    relative: str,
    data: bytes,
    kind: str,
    *,
    status_by_path: Mapping[str, str] | None = None,
    tracked_paths: set[str] | None = None,
) -> dict[str, Any]:
    del absolute
    if status_by_path is None or tracked_paths is None:
        status_by_path, tracked_paths = _git_context(repo)
    status = status_by_path.get(relative, "")
    tracked = relative in tracked_paths
    # Compute the Git blob identity from the exact bytes already read.  Calling
    # `git hash-object path` here would reopen a race with concurrent editors.
    blob_header = f"blob {len(data)}\0".encode()
    blob = hashlib.sha1(blob_header + data, usedforsecurity=False).hexdigest()
    if not tracked:
        blob = "UNTRACKED"
        if not status:
            status = f"!! {relative}"
    if not blob or (blob != "UNTRACKED" and not re.fullmatch(r"[0-9a-f]{40}", blob)):
        raise _fail(f"invalid git blob identity for path: {relative}")
    return {
        "kind": kind,
        "path": relative,
        "sha256": hashlib.sha256(data).hexdigest(),
        "worktree_sha256": hashlib.sha256(data).hexdigest(),
        "git_blob_sha1": blob,
        "porcelain_status": status,
        "git_status_porcelain": status,
        # Keep the short spelling convenient for consumers while retaining
        # the exact raw porcelain line above.
        "status": status,
    }


def _strip_comments(text: str) -> str:
    """Remove Lean line/block comments, including nested block comments."""
    out: list[str] = []
    i = 0
    depth = 0
    while i < len(text):
        if depth:
            if text.startswith("/-", i):
                depth += 1
                out.append("  ")
                i += 2
            elif text.startswith("-/", i):
                depth -= 1
                out.append("  ")
                i += 2
            else:
                out.append("\n" if text[i] == "\n" else " ")
                i += 1
        elif text.startswith("/-", i):
            depth = 1
            out.append("  ")
            i += 2
        elif text.startswith("--", i):
            end = text.find("\n", i)
            if end < 0:
                out.append(" " * (len(text) - i))
                break
            out.append(" " * (end - i))
            out.append("\n")
            i = end + 1
        else:
            out.append(text[i])
            i += 1
    if depth:
        raise _fail("unterminated Lean block comment")
    return "".join(out)


def _imports(data: bytes, relative: str) -> tuple[str, ...]:
    try:
        text = data.decode("utf-8")
    except UnicodeDecodeError as exc:
        raise _fail(f"Lean source is not UTF-8: {relative}", exc) from exc
    try:
        clean = _strip_comments(text)
    except SourceSnapshotError as exc:
        raise _fail(f"cannot parse Lean imports: {relative}", exc) from exc
    return tuple(
        match.group(1) for line in clean.splitlines() if (match := _IMPORT.match(line))
    )


def _source_roots(repo: Path, source: Path) -> tuple[Path, ...]:
    roots: list[Path] = []
    lean = repo / "lean"
    if lean.is_dir():
        roots.append(lean)
    # A tiny fake repository often keeps the source root at its top level.
    roots.extend((repo, source.parent))
    unique: list[Path] = []
    for root in roots:
        resolved = root.resolve()
        if resolved not in unique:
            unique.append(resolved)
    return tuple(unique)


def _resolve_import(repo: Path, module: str, roots: Sequence[Path]) -> Path | None:
    module_path = Path(*module.split("."))
    for root in roots:
        candidate = (root / module_path).with_suffix(".lean")
        try:
            candidate = candidate.resolve()
            candidate.relative_to(repo.resolve())
        except (OSError, ValueError):
            continue
        if candidate.is_file():
            return candidate
    return None


def _config_path(repo: Path, names: Sequence[str], label: str) -> Path:
    for name in names:
        path = repo / name
        if path.is_file():
            return path
    raise _fail(f"missing {label} file (tried: {', '.join(names)})")


def _canonical(value: Any) -> bytes:
    return json.dumps(
        value, ensure_ascii=False, sort_keys=True, separators=(",", ":")
    ).encode("utf-8")


def build_snapshot(
    repo_root: str | Path,
    source_path: str | Path = DEFAULT_SOURCE,
    *,
    query_path: str | Path | None = None,
    cnf_adapter_path: str | Path | None = None,
    cegar_runner_path: str | Path | None = None,
    python_paths: Iterable[str | Path] | None = None,
    support_paths: Iterable[str | Path] | None = None,
) -> dict[str, Any]:
    """Return a deterministic, Git-bound snapshot of the carrier wave.

    ``query_path``, ``cnf_adapter_path`` and ``cegar_runner_path`` are the
    preferred explicit interface.  ``python_paths`` is accepted for callers
    that already have a path list, and is appended after the explicit paths.
    Every supplied path must exist inside ``repo_root``.
    """
    repo = Path(repo_root).resolve()
    if not repo.is_dir():
        raise _fail(f"missing repository: {repo_root}")
    source_abs, source_rel, source_data = _read_bytes(repo, source_path)
    status_by_path, tracked_paths = _git_context(repo)

    def git_row(
        absolute: Path, relative: str, data: bytes, kind: str
    ) -> dict[str, Any]:
        return _git_row(
            repo,
            absolute,
            relative,
            data,
            kind,
            status_by_path=status_by_path,
            tracked_paths=tracked_paths,
        )

    rows: dict[str, dict[str, Any]] = {}
    queue: list[tuple[Path, str, bytes]] = [(source_abs, source_rel, source_data)]
    visited: set[str] = set()
    roots = _source_roots(repo, source_abs)
    external: set[str] = set()
    while queue:
        absolute, relative, data = queue.pop(0)
        if relative in visited:
            continue
        visited.add(relative)
        rows[relative] = git_row(absolute, relative, data, "lean")
        for module in _imports(data, relative):
            imported = _resolve_import(repo, module, roots)
            if imported is None:
                external.add(module)
                continue
            imported_abs, imported_rel, imported_data = _read_bytes(repo, imported)
            queue.append((imported_abs, imported_rel, imported_data))

    supplied: list[tuple[str, str | Path | None]] = [
        ("python_query", query_path),
        ("python_cnf_adapter", cnf_adapter_path),
        ("python_cegar_runner", cegar_runner_path),
    ]
    supplied.extend(("python", path) for path in (python_paths or ()))
    supplied.extend(("source_support", path) for path in (support_paths or ()))
    for kind, path in supplied:
        if path is None:
            continue
        absolute, relative, data = _read_bytes(repo, path)
        row = git_row(absolute, relative, data, kind)
        # Duplicate explicit/list entries are harmless, but conflicting kinds
        # would make the aggregate depend on caller ordering.
        existing = rows.get(relative)
        if existing is not None:
            if existing["sha256"] != row["sha256"]:
                raise _fail(f"path changed while snapshotting: {relative}")
            if existing["kind"] != row["kind"]:
                raise _fail(f"path supplied with conflicting kinds: {relative}")
        rows[relative] = row

    toolchain_abs = _config_path(repo, ("lean-toolchain",), "lean-toolchain")
    _, toolchain_rel, toolchain_data = _read_bytes(repo, toolchain_abs)
    toolchain_row = git_row(
        toolchain_abs, toolchain_rel, toolchain_data, "lean-toolchain"
    )
    lake_abs = _config_path(
        repo,
        ("lakefile.toml", "lakefile.lean", "lean/lakefile.toml", "lean/lakefile.lean"),
        "lakefile",
    )
    _, lake_rel, lake_data = _read_bytes(repo, lake_abs)
    lake_row = git_row(lake_abs, lake_rel, lake_data, "lakefile")
    lake_manifest_abs = _config_path(
        repo, ("lean/lake-manifest.json", "lake-manifest.json"), "lake manifest"
    )
    _, lake_manifest_rel, lake_manifest_data = _read_bytes(repo, lake_manifest_abs)
    lake_manifest_row = git_row(
        lake_manifest_abs,
        lake_manifest_rel,
        lake_manifest_data,
        "lake-manifest",
    )
    rows[toolchain_rel] = toolchain_row
    rows[lake_rel] = lake_row
    rows[lake_manifest_rel] = lake_manifest_row

    aggregate_rows = [rows[path] for path in sorted(rows)]
    aggregate_sha256 = hashlib.sha256(_canonical(aggregate_rows)).hexdigest()
    content_rows = [
        {"kind": row["kind"], "path": row["path"], "sha256": row["sha256"]}
        for row in aggregate_rows
    ]
    content_aggregate_sha256 = hashlib.sha256(_canonical(content_rows)).hexdigest()
    head = _run_git(repo, ["rev-parse", "HEAD"]).strip()
    if not re.fullmatch(r"[0-9a-f]{40}", head):
        raise _fail("invalid repository HEAD")
    try:
        toolchain_content = toolchain_data.decode("utf-8")
    except UnicodeDecodeError as exc:
        raise _fail("lean-toolchain is not UTF-8", exc) from exc
    python_components = [
        row for row in aggregate_rows if row["kind"].startswith("python")
    ]
    return {
        "schema": SCHEMA,
        "repo_head": head,
        "git_head": head,
        "source_theory": source_rel,
        "local_lean_paths": sorted(
            path for path, row in rows.items() if row["kind"] == "lean"
        ),
        "external_imports": sorted(external),
        "rows": aggregate_rows,
        "aggregate_rows": aggregate_rows,
        "aggregate_sha256": aggregate_sha256,
        "content_aggregate_sha256": content_aggregate_sha256,
        "python_components": python_components,
        "lean_toolchain": {
            "path": toolchain_rel,
            "sha256": toolchain_row["sha256"],
            "content": toolchain_content,
        },
        "lakefile": {"path": lake_rel, "sha256": lake_row["sha256"]},
        "lake_manifest": {
            "path": lake_manifest_rel,
            "sha256": lake_manifest_row["sha256"],
        },
        "lean_toolchain_sha256": toolchain_row["sha256"],
        "lean_toolchain_content": toolchain_content,
        "lakefile_sha256": lake_row["sha256"],
        "lake_manifest_sha256": lake_manifest_row["sha256"],
        "inputs": {
            "source_path": source_rel,
            "query_path": next(
                (
                    row["path"]
                    for row in python_components
                    if row["kind"] == "python_query"
                ),
                None,
            ),
            "cnf_adapter_path": next(
                (
                    row["path"]
                    for row in python_components
                    if row["kind"] == "python_cnf_adapter"
                ),
                None,
            ),
            "cegar_runner_path": next(
                (
                    row["path"]
                    for row in python_components
                    if row["kind"] == "python_cegar_runner"
                ),
                None,
            ),
            "python_paths": sorted(
                row["path"] for row in python_components if row["kind"] == "python"
            ),
            "support_paths": sorted(
                row["path"] for row in aggregate_rows if row["kind"] == "source_support"
            ),
        },
    }


def verify_snapshot(
    repo_root: str | Path, expected: Mapping[str, object]
) -> dict[str, Any]:
    """Rebuild ``expected`` from its authenticated inputs and require identity."""

    if expected.get("schema") != SCHEMA:
        raise _fail("source snapshot schema mismatch")
    inputs = expected.get("inputs")
    if type(inputs) is not dict:
        raise _fail("source snapshot is missing rebuild inputs")
    source_path = inputs.get("source_path")
    if type(source_path) is not str:
        raise _fail("source snapshot source_path is malformed")
    optional_names = ("query_path", "cnf_adapter_path", "cegar_runner_path")
    for name in optional_names:
        if inputs.get(name) is not None and type(inputs.get(name)) is not str:
            raise _fail(f"source snapshot {name} is malformed")
    python_paths = inputs.get("python_paths")
    if not (
        type(python_paths) is list and all(type(path) is str for path in python_paths)
    ):
        raise _fail("source snapshot python_paths is malformed")
    support_paths = inputs.get("support_paths")
    if not (
        type(support_paths) is list and all(type(path) is str for path in support_paths)
    ):
        raise _fail("source snapshot support_paths is malformed")
    actual = build_snapshot(
        repo_root,
        source_path,
        query_path=inputs.get("query_path"),
        cnf_adapter_path=inputs.get("cnf_adapter_path"),
        cegar_runner_path=inputs.get("cegar_runner_path"),
        python_paths=python_paths,
        support_paths=support_paths,
    )
    if (
        actual.get("content_aggregate_sha256")
        != expected.get("content_aggregate_sha256")
        or actual.get("external_imports") != expected.get("external_imports")
        or actual.get("inputs") != expected.get("inputs")
    ):
        raise _fail(
            "source snapshot drifted: "
            f"expected {expected.get('content_aggregate_sha256')}, "
            f"actual {actual.get('content_aggregate_sha256')}"
        )
    return actual


def archive_nonclean_snapshot_rows(
    repo_root: str | Path,
    snapshot: Mapping[str, object],
    destination: str | Path,
) -> dict[str, object]:
    """Archive dirty/untracked snapshot bytes that Git cannot reconstruct."""

    repo = Path(repo_root).resolve()
    rows = snapshot.get("rows")
    if type(rows) is not list:
        raise _fail("source snapshot rows are malformed")
    destination_path = Path(destination)
    destination_path.mkdir(parents=True, exist_ok=False)
    archived: list[dict[str, object]] = []
    for row in rows:
        if type(row) is not dict:
            raise _fail("source snapshot contains a malformed row")
        status = row.get("porcelain_status")
        path = row.get("path")
        expected_sha = row.get("sha256")
        if not all(type(item) is str for item in (status, path, expected_sha)):
            raise _fail("source snapshot row identity is malformed")
        if not status:
            continue
        _, relative, data = _read_bytes(repo, path)
        actual_sha = hashlib.sha256(data).hexdigest()
        if actual_sha != expected_sha:
            raise _fail(f"source changed while archiving: {relative}")
        archive_path = destination_path / relative
        archive_path.parent.mkdir(parents=True, exist_ok=True)
        archive_path.write_bytes(data)
        archived.append(
            {
                "path": relative,
                "sha256": actual_sha,
                "porcelain_status": status,
            }
        )
    manifest = {
        "schema": f"{SCHEMA}/nonclean-archive/v1",
        "source_aggregate_sha256": snapshot.get("aggregate_sha256"),
        "archived": archived,
    }
    (destination_path / "manifest.json").write_bytes(_canonical(manifest))
    return manifest


# Descriptive aliases used by wave callers.
generate_snapshot = build_snapshot
snapshot = build_snapshot


def main(argv: Sequence[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("repo_root", type=Path)
    parser.add_argument("--source", default=DEFAULT_SOURCE)
    parser.add_argument("--query", type=Path)
    parser.add_argument("--cnf-adapter", type=Path)
    parser.add_argument("--cegar-runner", type=Path)
    parser.add_argument("--python-path", type=Path, action="append", default=[])
    parser.add_argument("--support-path", type=Path, action="append", default=[])
    args = parser.parse_args(argv)
    try:
        print(
            json.dumps(
                build_snapshot(
                    args.repo_root,
                    args.source,
                    query_path=args.query,
                    cnf_adapter_path=args.cnf_adapter,
                    cegar_runner_path=args.cegar_runner,
                    python_paths=args.python_path,
                    support_paths=args.support_path,
                ),
                indent=2,
                sort_keys=True,
            )
        )
    except SourceSnapshotError as exc:
        parser.error(str(exc))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
