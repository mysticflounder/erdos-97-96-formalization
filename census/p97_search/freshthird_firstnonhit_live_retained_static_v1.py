"""Authenticated one-wave runner for the live FreshThird retained packet.

The runner is intentionally discovery-only.  It records all 24 constructor
and global-row-origin cells, binds the exact source and encoder bytes, stores
the complete SMT query and semantic assignment, and independently replays
every SAT assignment.  No result from this module is a Lean theorem or a
general-cardinality closure certificate.
"""

from __future__ import annotations

import argparse
import hashlib
import itertools
import json
import os
import subprocess
from collections.abc import Mapping, Sequence
from pathlib import Path

import z3

from census.p97_search import freshthird_firstnonhit_live_retained_v1 as packet

RUN_SCHEMA = "p97-freshthird-firstnonhit-live-retained-static-run/v1"
CELL_SCHEMA = "p97-freshthird-firstnonhit-live-retained-static-cell/v1"
DEFAULT_RUN_PARENT = (
    packet.REPO_ROOT / "scratch/runs/freshthird-firstnonhit-live-retained-v1"
)
RUNNER_RELATIVE = "census/p97_search/freshthird_firstnonhit_live_retained_static_v1.py"
ENCODER_RELATIVE = "census/p97_search/freshthird_firstnonhit_live_retained_v1.py"
TEST_RELATIVES = (
    "census/p97_search/tests/test_freshthird_firstnonhit_live_retained_v1.py",
    "census/p97_search/tests/test_freshthird_firstnonhit_live_retained_static_v1.py",
)


class StaticRunnerError(RuntimeError):
    """Raised when custody, execution, or replay fails closed."""


def _canonical_json(value: object) -> bytes:
    return (json.dumps(value, sort_keys=True, separators=(",", ":")) + "\n").encode()


def _sha256_bytes(value: bytes) -> str:
    return hashlib.sha256(value).hexdigest()


def _sha256_file(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        for chunk in iter(lambda: stream.read(1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest()


def _atomic_write(path: Path, payload: bytes) -> str:
    path.parent.mkdir(parents=True, exist_ok=True)
    temporary = path.with_name(f".{path.name}.{os.getpid()}.tmp")
    with temporary.open("xb") as stream:
        stream.write(payload)
        stream.flush()
        os.fsync(stream.fileno())
    os.replace(temporary, path)
    return _sha256_bytes(payload)


def _atomic_json(path: Path, value: object) -> str:
    return _atomic_write(path, _canonical_json(value))


def _read_canonical_json(path: Path, description: str) -> dict[str, object]:
    if path.is_symlink() or not path.is_file():
        raise StaticRunnerError(f"{description} is not a regular file")
    payload = path.read_bytes()
    try:
        value = json.loads(payload)
    except (UnicodeDecodeError, json.JSONDecodeError) as exc:
        raise StaticRunnerError(f"{description} is not valid JSON") from exc
    if not isinstance(value, dict):
        raise StaticRunnerError(f"{description} must be a JSON object")
    if _canonical_json(value) != payload:
        raise StaticRunnerError(f"{description} is not canonical JSON")
    return value


def _git(args: Sequence[str]) -> str:
    completed = subprocess.run(
        ["git", *args],
        cwd=packet.REPO_ROOT,
        check=True,
        capture_output=True,
        text=True,
    )
    return completed.stdout.strip()


def _snapshot_paths() -> tuple[str, ...]:
    return tuple(
        dict.fromkeys(
            (*packet.SOURCE_FILES, ENCODER_RELATIVE, RUNNER_RELATIVE, *TEST_RELATIVES)
        )
    )


def _source_snapshot() -> dict[str, object]:
    rows: list[dict[str, object]] = []
    for relative in _snapshot_paths():
        path = packet.REPO_ROOT / relative
        if path.is_symlink() or not path.is_file():
            raise StaticRunnerError(f"source path is not a regular file: {relative}")
        status = _git(["status", "--porcelain=v1", "--", relative])
        rows.append(
            {
                "path": relative,
                "sha256": _sha256_file(path),
                "size": path.stat().st_size,
                "git_status": status,
                "clean": not bool(status),
            }
        )
    snapshot: dict[str, object] = {
        "git_head": _git(["rev-parse", "HEAD"]),
        "files": rows,
    }
    snapshot["snapshot_sha256"] = _sha256_bytes(_canonical_json(snapshot))
    return snapshot


def _snapshot_hash_map(snapshot: Mapping[str, object]) -> dict[str, str]:
    rows = snapshot.get("files")
    if not isinstance(rows, list):
        raise StaticRunnerError("source snapshot files must be a list")
    result: dict[str, str] = {}
    for row in rows:
        if not isinstance(row, Mapping):
            raise StaticRunnerError("source snapshot row must be an object")
        relative = row.get("path")
        digest = row.get("sha256")
        if not isinstance(relative, str) or not isinstance(digest, str):
            raise StaticRunnerError("source snapshot row is malformed")
        if relative in result:
            raise StaticRunnerError(f"duplicate source snapshot path: {relative}")
        result[relative] = digest
    return result


def _validate_snapshot_self_hash(snapshot: Mapping[str, object]) -> None:
    claimed = snapshot.get("snapshot_sha256")
    if not isinstance(claimed, str):
        raise StaticRunnerError("source snapshot digest is missing")
    body = dict(snapshot)
    del body["snapshot_sha256"]
    if _sha256_bytes(_canonical_json(body)) != claimed:
        raise StaticRunnerError("source snapshot digest mismatch")


def _validate_output_root(output_dir: Path, allow_test_output: bool) -> Path:
    if output_dir.exists() or output_dir.is_symlink():
        raise StaticRunnerError("output directory must not already exist")
    resolved_parent = output_dir.parent.resolve()
    for parent in (output_dir.parent, *output_dir.parent.parents):
        if parent.exists() and parent.is_symlink():
            raise StaticRunnerError("output path has a symlinked ancestor")
    if not allow_test_output:
        try:
            resolved_parent.relative_to(DEFAULT_RUN_PARENT.resolve())
        except ValueError as exc:
            raise StaticRunnerError(
                f"production output must be under {DEFAULT_RUN_PARENT}"
            ) from exc
    return output_dir


def plan_wave() -> list[dict[str, object]]:
    """Return the explicit stable 24-cell plan."""
    cells: list[dict[str, object]] = []
    for index, (nonhit, interaction, origin) in enumerate(
        itertools.product(
            packet.NONHIT_BRANCHES,
            packet.INTERACTION_BRANCHES,
            packet.ORIGIN_BRANCHES,
        )
    ):
        cells.append(
            {
                "cell_id": f"{index:02d}",
                "nonhit": nonhit,
                "interaction": interaction,
                "origin": origin,
            }
        )
    if len(cells) != 24 or len({row["cell_id"] for row in cells}) != 24:
        raise StaticRunnerError("live retained plan is not exactly 24 unique cells")
    return cells


def _source_archive(
    artifacts: Path, snapshot: Mapping[str, object]
) -> dict[str, object]:
    files = snapshot.get("files")
    if not isinstance(files, list):
        raise StaticRunnerError("source snapshot is missing files")
    archived: list[dict[str, object]] = []
    for row in files:
        if not isinstance(row, Mapping):
            raise StaticRunnerError("source snapshot row must be an object")
        if row.get("clean") is True:
            continue
        relative = row.get("path")
        expected = row.get("sha256")
        if not isinstance(relative, str) or not isinstance(expected, str):
            raise StaticRunnerError("source snapshot row is malformed")
        payload = (packet.REPO_ROOT / relative).read_bytes()
        if _sha256_bytes(payload) != expected:
            raise StaticRunnerError(f"source changed before archive: {relative}")
        archive_path = artifacts / "source-nonclean" / relative
        digest = _atomic_write(archive_path, payload)
        archived.append(
            {
                "path": relative,
                "archive_path": archive_path.relative_to(artifacts).as_posix(),
                "sha256": digest,
                "size": len(payload),
            }
        )
    archive_manifest = {
        "schema": f"{RUN_SCHEMA}/source-archive",
        "source_snapshot_sha256": snapshot["snapshot_sha256"],
        "archived": archived,
    }
    _atomic_json(artifacts / "source-nonclean" / "manifest.json", archive_manifest)
    return archive_manifest


def _solver_identity() -> dict[str, object]:
    module_path = Path(z3.__file__).resolve()
    return {
        "name": "z3py",
        "version": z3.get_version_string(),
        "module_path": str(module_path),
        "module_sha256": _sha256_file(module_path),
    }


def _query_bytes(solver: z3.Solver) -> bytes:
    return ("(set-logic QF_LIA)\n" + solver.sexpr() + "\n(check-sat)\n").encode()


def _cell_result(
    cell: Mapping[str, object],
    artifacts: Path,
    source_snapshot: Mapping[str, object],
    encoding_manifest_sha256: str,
    solver_identity: Mapping[str, object],
) -> dict[str, object]:
    nonhit = str(cell["nonhit"])
    interaction = str(cell["interaction"])
    origin = str(cell["origin"])
    solver, context = packet.build_packet(nonhit, interaction, origin)
    query_payload = _query_bytes(solver)
    cell_dir = artifacts / f"cell-{cell['cell_id']}"
    query_sha256 = _atomic_write(cell_dir / "query.smt2", query_payload)
    check = solver.check()
    if check == z3.sat:
        signature = packet.validate_model(solver.model(), context)
        packet.replay_signature(signature)
        status = "SAT_ABSTRACTION"
    elif check == z3.unsat:
        signature = None
        status = "UNSAT_RELAXATION"
    else:
        signature = None
        status = "UNKNOWN"
    result: dict[str, object] = {
        "schema": CELL_SCHEMA,
        "cell": dict(cell),
        "status": status,
        "signature": signature,
        "query_sha256": query_sha256,
        "query_size": len(query_payload),
        "source_snapshot_sha256": source_snapshot["snapshot_sha256"],
        "encoding_manifest_sha256": encoding_manifest_sha256,
        "solver": dict(solver_identity),
        "false_claims": packet.FALSE_CLAIMS,
    }
    result["result_sha256"] = _sha256_bytes(_canonical_json(result))
    _atomic_json(cell_dir / "result.json", result)
    return result


def _artifact_inventory(artifacts: Path) -> list[dict[str, object]]:
    rows: list[dict[str, object]] = []
    for path in sorted(artifacts.rglob("*")):
        if path.is_symlink():
            raise StaticRunnerError(f"artifact is a symlink: {path}")
        if not path.is_file():
            continue
        rows.append(
            {
                "path": path.relative_to(artifacts).as_posix(),
                "sha256": _sha256_file(path),
                "size": path.stat().st_size,
            }
        )
    return rows


def run_wave(output_dir: Path, allow_test_output: bool = False) -> dict[str, object]:
    """Execute exactly one authenticated 24-cell discovery wave."""
    output_dir = _validate_output_root(Path(output_dir), allow_test_output)
    source_snapshot = _source_snapshot()
    output_dir.mkdir(parents=True)
    artifacts = output_dir / "artifacts"
    artifacts.mkdir()
    packet_manifest = packet.manifest()
    packet_manifest_sha256 = _atomic_json(
        artifacts / "encoding-manifest.json", packet_manifest
    )
    _source_archive(artifacts, source_snapshot)
    solver_identity = _solver_identity()
    cells = plan_wave()
    results = [
        _cell_result(
            cell,
            artifacts,
            source_snapshot,
            packet_manifest_sha256,
            solver_identity,
        )
        for cell in cells
    ]
    post_snapshot = _source_snapshot()
    if _snapshot_hash_map(post_snapshot) != _snapshot_hash_map(source_snapshot):
        raise StaticRunnerError("source bytes drifted during the wave")
    statuses = [str(result["status"]) for result in results]
    aggregate = (
        "SAT_ABSTRACTION"
        if all(status == "SAT_ABSTRACTION" for status in statuses)
        else "MIXED_RELAXATION"
    )
    run_manifest: dict[str, object] = {
        "schema": RUN_SCHEMA,
        "packet_schema": packet.SCHEMA,
        "status": aggregate,
        "promotion_ready": False,
        "cell_plan": cells,
        "cell_results": [
            {
                "cell_id": result["cell"]["cell_id"],
                "status": result["status"],
                "result_sha256": result["result_sha256"],
            }
            for result in results
        ],
        "source_snapshot": source_snapshot,
        "postflight_source_snapshot_sha256": post_snapshot["snapshot_sha256"],
        "encoding_manifest_sha256": packet_manifest_sha256,
        "solver": solver_identity,
        "artifact_inventory": _artifact_inventory(artifacts),
        "false_claims": packet.FALSE_CLAIMS,
        "scope": "live retained arm packet only; not full FirstNonHit",
    }
    run_manifest["run_manifest_sha256"] = _sha256_bytes(_canonical_json(run_manifest))
    _atomic_json(output_dir / "run_manifest.json", run_manifest)
    return run_manifest


def _validate_self_hash(value: Mapping[str, object], field: str) -> None:
    claimed = value.get(field)
    if not isinstance(claimed, str):
        raise StaticRunnerError(f"missing {field}")
    body = dict(value)
    del body[field]
    if _sha256_bytes(_canonical_json(body)) != claimed:
        raise StaticRunnerError(f"{field} mismatch")


def _validate_source_archive(
    artifacts: Path, source_snapshot: Mapping[str, object]
) -> None:
    archive = _read_canonical_json(
        artifacts / "source-nonclean" / "manifest.json", "source archive manifest"
    )
    if archive.get("source_snapshot_sha256") != source_snapshot.get("snapshot_sha256"):
        raise StaticRunnerError("source archive snapshot binding mismatch")
    rows = archive.get("archived")
    if not isinstance(rows, list):
        raise StaticRunnerError("source archive rows must be a list")
    for row in rows:
        if not isinstance(row, Mapping):
            raise StaticRunnerError("source archive row must be an object")
        relative = row.get("archive_path")
        digest = row.get("sha256")
        size = row.get("size")
        if not isinstance(relative, str) or not isinstance(digest, str):
            raise StaticRunnerError("source archive row is malformed")
        path = artifacts / relative
        if path.is_symlink() or not path.is_file():
            raise StaticRunnerError(f"source archive path is invalid: {relative}")
        if _sha256_file(path) != digest or path.stat().st_size != size:
            raise StaticRunnerError(f"source archive bytes mismatch: {relative}")


def _validate_inventory(artifacts: Path, rows: object) -> None:
    if not isinstance(rows, list):
        raise StaticRunnerError("artifact inventory must be a list")
    expected: dict[str, tuple[str, int]] = {}
    for row in rows:
        if not isinstance(row, Mapping):
            raise StaticRunnerError("artifact inventory row must be an object")
        relative = row.get("path")
        digest = row.get("sha256")
        size = row.get("size")
        if (
            not isinstance(relative, str)
            or not isinstance(digest, str)
            or not isinstance(size, int)
        ):
            raise StaticRunnerError("artifact inventory row is malformed")
        if relative in expected:
            raise StaticRunnerError(f"duplicate artifact inventory path: {relative}")
        expected[relative] = (digest, size)
    actual = {
        row["path"]: (row["sha256"], row["size"])
        for row in _artifact_inventory(artifacts)
    }
    if actual != expected:
        raise StaticRunnerError("artifact inventory mismatch")


def validate_run(
    output_dir: Path, require_current_source: bool = True
) -> dict[str, object]:
    """Authenticate artifacts and replay every cell in fresh solver sessions."""
    output_dir = Path(output_dir)
    if output_dir.is_symlink() or not output_dir.is_dir():
        raise StaticRunnerError("run root is not a regular directory")
    manifest_value = _read_canonical_json(
        output_dir / "run_manifest.json", "run manifest"
    )
    if manifest_value.get("schema") != RUN_SCHEMA:
        raise StaticRunnerError("run schema mismatch")
    _validate_self_hash(manifest_value, "run_manifest_sha256")
    artifacts = output_dir / "artifacts"
    if artifacts.is_symlink() or not artifacts.is_dir():
        raise StaticRunnerError("artifacts root is invalid")
    _validate_inventory(artifacts, manifest_value.get("artifact_inventory"))
    source_snapshot = manifest_value.get("source_snapshot")
    if not isinstance(source_snapshot, Mapping):
        raise StaticRunnerError("source snapshot is missing")
    _validate_snapshot_self_hash(source_snapshot)
    _validate_source_archive(artifacts, source_snapshot)
    if require_current_source:
        current = _source_snapshot()
        if _snapshot_hash_map(current) != _snapshot_hash_map(source_snapshot):
            raise StaticRunnerError("current source bytes differ from captured source")
    encoding_manifest = _read_canonical_json(
        artifacts / "encoding-manifest.json", "encoding manifest"
    )
    if _sha256_bytes(_canonical_json(encoding_manifest)) != manifest_value.get(
        "encoding_manifest_sha256"
    ):
        raise StaticRunnerError("encoding manifest digest mismatch")
    if encoding_manifest != packet.manifest():
        raise StaticRunnerError("encoding manifest differs from current packet")
    plan = plan_wave()
    if manifest_value.get("cell_plan") != plan:
        raise StaticRunnerError("cell plan mismatch")
    summaries = manifest_value.get("cell_results")
    if not isinstance(summaries, list) or len(summaries) != len(plan):
        raise StaticRunnerError("cell result summary is malformed")
    for cell, summary in zip(plan, summaries, strict=True):
        if not isinstance(summary, Mapping):
            raise StaticRunnerError("cell summary must be an object")
        cell_dir = artifacts / f"cell-{cell['cell_id']}"
        result = _read_canonical_json(cell_dir / "result.json", "cell result")
        _validate_self_hash(result, "result_sha256")
        if result.get("cell") != cell:
            raise StaticRunnerError("cell identity mismatch")
        if summary.get("result_sha256") != result.get("result_sha256"):
            raise StaticRunnerError("cell summary digest mismatch")
        solver, _context = packet.build_packet(
            str(cell["nonhit"]), str(cell["interaction"]), str(cell["origin"])
        )
        query_payload = _query_bytes(solver)
        query_path = cell_dir / "query.smt2"
        if query_path.is_symlink() or not query_path.is_file():
            raise StaticRunnerError("cell query is invalid")
        if query_path.read_bytes() != query_payload:
            raise StaticRunnerError("cell query bytes differ from fresh encoding")
        if result.get("query_sha256") != _sha256_bytes(query_payload):
            raise StaticRunnerError("cell query digest mismatch")
        check = solver.check()
        status = result.get("status")
        if status == "SAT_ABSTRACTION":
            if check != z3.sat:
                raise StaticRunnerError("SAT cell does not replay as SAT")
            signature = result.get("signature")
            if not isinstance(signature, Mapping):
                raise StaticRunnerError("SAT cell signature is missing")
            packet.replay_signature(signature)
        elif status == "UNSAT_RELAXATION":
            if check != z3.unsat:
                raise StaticRunnerError("UNSAT cell does not replay as UNSAT")
        else:
            raise StaticRunnerError(f"unsupported cell status: {status}")
    return manifest_value


def main(argv: Sequence[str] | None = None) -> int:
    parser = argparse.ArgumentParser()
    subparsers = parser.add_subparsers(dest="command", required=True)
    run_parser = subparsers.add_parser("run")
    run_parser.add_argument("--out", type=Path, required=True)
    validate_parser = subparsers.add_parser("validate")
    validate_parser.add_argument("--out", type=Path, required=True)
    args = parser.parse_args(argv)
    if args.command == "run":
        value = run_wave(args.out)
    else:
        value = validate_run(args.out)
    print(json.dumps(value, sort_keys=True, indent=2))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
