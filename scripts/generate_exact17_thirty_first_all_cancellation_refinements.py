"""Generate the complete sharded cancellation family from exact-17 child 31."""

from __future__ import annotations

import argparse
import fcntl
import hashlib
import inspect
import json
import os
from contextlib import contextmanager
from pathlib import Path
from typing import Any

import generate_exact17_twenty_eighth_all_cancellation_refinements as _projection
from generate_exact17_thirtieth_all_cancellation_refinements import (
    ORDERS,
    N,
    choose_exact_support_record,
    lean_occurrence,
    ledger_support,
    path_hits,
    reflected,
    sha256_file,
)
from generate_exact17_twenty_eighth_all_cancellation_refinements import (
    lean_occurrence_check,
    project_record_for_lean,
)

from census.atail_force import producer_bank

Hit = tuple[int, int]
SHARD_COUNT = 4
LEDGER_SCHEMA = "p97-exact17-child31-all-minimal-two-kalmanson/v2"
PUBLICATION_PROTOCOL = "immutable-outputs-then-ledger-last+shared-read-lock/v2"
EXPECTED_RECORD_COUNT = 237
EXPECTED_DISTINCT_SUPPORT_COUNT = 135
EXPECTED_MINIMAL_SUPPORT_COUNT = 84
EXPECTED_EMITTED_CLAUSE_COUNT = 336
ANALYSIS_SHA256 = "f57ee5bd41a144ce749f6fe95015624f4659fdfd83b4914863d222ccf5c1c8eb"
PARENT_CNF_SHA256 = "3c847c1ebcacf85256b65d54563584a8b89eb50f427fe268e2f916d4cdafa204"
PARENT_CLAUSES = 5_846_904
VARIABLES = 308
PARENT_LEDGER_SHA256 = "4ef564d2091cd629d59945ac6af74a665383f5886b23655a2ffb05e144f7c2c1"
AUTHORIZED_MODEL_SHA256 = "21b1ff04c42920daf9db259dda3ce966b82164ef64d3e2f1d3fa90538f280791"
AUTHORIZED_JOB_ID = "53044c24-da6c-4fdd-9f50-f4f539891383"
AUTHORIZED_DAEMON_SHA256 = "aa47e2ff3000890d11da79296721f0f51c3a228d4ef8446af3c3d2a73d969107"
PROJECT = "erdos-97-96-formalization"
LEAN_SOURCE_PATHS = (
    "lean/Erdos9796Proof/P97/ATail/BlockerVExactSeventeenSourceCnfCdefg.lean",
    "lean/Erdos9796Proof/P97/ATail/BlockerVExactSeventeenSeventeenthModelRefinements.lean",
    "lean/Erdos9796Proof/P97/ATail/BlockerVExactSeventeenThirtiethModelRefinements.lean",
)
REPO = Path(__file__).resolve().parents[1]
LEDGER_KEYS = frozenset(
    {
        "schema",
        "publication_protocol",
        "source_analysis",
        "source_analysis_sha256",
        "terminal_artifact",
        "parent_ledger",
        "parent_ledger_sha256",
        "parent_cnf",
        "record_count",
        "reverse_record_count",
        "distinct_support_count",
        "minimal_support_count",
        "parent_subsumed_support_count",
        "emitted_clause_count",
        "lean_projection",
        "shard_count",
        "generated_outputs",
        "named_order",
        "implementation_identities",
        "source_identities",
        "entries",
    }
)


def referenced_row_choices(record: dict[str, Any]) -> list[dict[str, Any]]:
    return _projection.referenced_row_choices(record)


def record_key(record: dict[str, Any]) -> str:
    return _projection.record_key(record)


def order_table_sha256() -> str:
    payload = json.dumps([list(order) for order in ORDERS], separators=(",", ":"))
    return hashlib.sha256(payload.encode("ascii")).hexdigest()


def implementation_identities() -> dict[str, dict[str, str]]:
    paths = {
        "generator": Path(__file__).resolve(),
        "thirtieth_adapter": REPO
        / "scripts/generate_exact17_thirtieth_all_cancellation_refinements.py",
        "twenty_ninth_adapter": REPO
        / "scripts/generate_exact17_twenty_ninth_all_cancellation_refinements.py",
    }
    helper = inspect.getsourcefile(choose_exact_support_record)
    producer = inspect.getsourcefile(producer_bank)
    if helper is None or producer is None:
        raise RuntimeError("cannot identify generator dependencies")
    paths["certificate_helper"] = Path(helper).resolve()
    paths["producer_bank"] = Path(producer).resolve()
    return {
        label: {
            "path": str(path.relative_to(REPO)),
            "sha256": sha256_file(path),
        }
        for label, path in sorted(paths.items())
    }


def source_identities() -> dict[str, str]:
    return {
        relative: sha256_file(REPO / relative) for relative in LEAN_SOURCE_PATHS
    }


def strict_object(pairs: list[tuple[str, Any]]) -> dict[str, Any]:
    result: dict[str, Any] = {}
    for key, value in pairs:
        if key in result:
            raise ValueError(f"duplicate JSON key: {key}")
        result[key] = value
    return result


def load_strict_json(path: Path) -> dict[str, Any]:
    value = json.loads(
        path.read_text(encoding="utf-8"), object_pairs_hook=strict_object
    )
    if not isinstance(value, dict):
        raise TypeError(f"expected a JSON object in {path}")
    return value


def require_exact_keys(
    value: dict[str, Any], expected: set[str] | frozenset[str], label: str
) -> None:
    if not isinstance(value, dict):
        raise TypeError(f"{label} is not an object")
    actual = set(value)
    if actual != set(expected):
        missing = sorted(set(expected) - actual)
        extra = sorted(actual - set(expected))
        raise ValueError(f"{label} schema drifted: missing={missing}, extra={extra}")


def validate_analysis(path: Path) -> dict[str, Any]:
    if sha256_file(path) != ANALYSIS_SHA256:
        raise ValueError("child31 analysis hash drifted")
    analysis = load_strict_json(path)
    if analysis.get("status") != "PASS":
        raise ValueError("expected an authenticated PASS analysis")
    validate_production_authentication(analysis)
    if analysis.get("cnf_sha256") != PARENT_CNF_SHA256:
        raise ValueError("analysis is not bound to the child31 CNF")
    if analysis.get("variables") != VARIABLES or analysis.get("clauses") != PARENT_CLAUSES:
        raise ValueError("analysis dimensions drifted")
    if analysis.get("named_orders") not in ([0], [1]):
        raise ValueError("expected exactly one authenticated named order")
    expected_centers = {str(center) for center in range(N)}
    rows = analysis.get("rows")
    row_sizes = analysis.get("row_sizes")
    if not isinstance(rows, dict) or set(rows) != expected_centers:
        raise ValueError("analysis does not contain exactly the 17 selected rows")
    if not isinstance(row_sizes, dict) or row_sizes != {
        center: 4 for center in expected_centers
    }:
        raise ValueError("analysis row-size schema drifted")
    for center_text, points in rows.items():
        center = int(center_text)
        if (
            not isinstance(points, list)
            or len(points) != 4
            or any(type(point) is not int or not 0 <= point < N for point in points)
            or len(set(points)) != 4
            or center in points
        ):
            raise ValueError(f"invalid selected row for center {center}")
    return analysis


def validate_production_authentication(analysis: dict[str, Any]) -> None:
    """Require a terminal PIQD completion identity, not just decoded rows."""
    if analysis.get("production_authenticated") is not True:
        raise ValueError("analysis is diagnostic-only: production authentication is absent")
    if analysis.get("diagnostic_status") != "PASS":
        raise ValueError("analysis diagnostic status is not PASS")
    auth = analysis.get("authentication")
    if not isinstance(auth, dict):
        raise TypeError("analysis has no production authentication block")
    if (
        auth.get("cnf_sha256") != PARENT_CNF_SHA256
        or auth.get("model_sha256") != AUTHORIZED_MODEL_SHA256
        or auth.get("job_id") != AUTHORIZED_JOB_ID
        or auth.get("model_binding") != "terminal-artifact"
    ):
        raise ValueError("analysis response identity is not authenticated")
    manifest_identity = auth.get("manifest_identity")
    if (
        not isinstance(manifest_identity, dict)
        or manifest_identity.get("cnf_sha256") != PARENT_CNF_SHA256
        or manifest_identity.get("daemon_sha256") != AUTHORIZED_DAEMON_SHA256
    ):
        raise ValueError("analysis daemon/CNF ingress identity is not authenticated")
    terminal_name = auth.get("terminal_artifact")
    terminal_sha = auth.get("terminal_artifact_sha256")
    if not isinstance(terminal_name, str) or not isinstance(terminal_sha, str):
        raise TypeError("analysis has no terminal artifact identity")
    terminal_path = Path(terminal_name)
    if not terminal_path.is_absolute():
        terminal_path = REPO / terminal_path
    if not terminal_path.is_file() or sha256_file(terminal_path) != terminal_sha:
        raise ValueError("terminal artifact is missing or hash-mismatched")
    terminal = load_strict_json(terminal_path)
    if (
        terminal.get("artifact_kind") != "p97-exact17-thirty-first-root-piqd-final/v1"
        or terminal.get("job_id") != AUTHORIZED_JOB_ID
        or terminal.get("result") != "SAT"
        or terminal.get("model_sha256") != AUTHORIZED_MODEL_SHA256
    ):
        raise ValueError("terminal artifact response identity mismatch")
    root = terminal.get("root")
    status = terminal.get("status")
    solver = terminal.get("solver")
    daemon = terminal.get("daemon")
    daemon_info = daemon.get("daemon") if isinstance(daemon, dict) else None
    if (
        not isinstance(root, dict)
        or root.get("sha256") != PARENT_CNF_SHA256
        or root.get("variables") != VARIABLES
        or root.get("clauses") != PARENT_CLAUSES
        or not isinstance(status, dict)
        or status.get("id") != AUTHORIZED_JOB_ID
        or status.get("cnf_blob_hash") != PARENT_CNF_SHA256
        or status.get("result") != "SAT"
        or status.get("status") != "completed"
        or status.get("backend") != "cadical"
        or status.get("project") != PROJECT
        or not isinstance(solver, dict)
        or solver.get("solver") != "cadical"
        or solver.get("lane") != "sat"
        or not isinstance(daemon_info, dict)
        or daemon_info.get("sha256") != AUTHORIZED_DAEMON_SHA256
    ):
        raise ValueError("terminal completion identity is incomplete")
    manifest_sha = auth.get("manifest_sha256")
    if (
        not isinstance(manifest_sha, str)
        or status.get("producer_manifest_hash") != manifest_sha
        or status.get("producer_manifest_blob_hash") != manifest_sha
        or root.get("manifest_sha256") != manifest_sha
    ):
        raise ValueError("terminal producer manifest identity mismatch")
    expected_identity = hashlib.sha256(
        f"raw-dimacs/v1\ncadical\nsat\n{PARENT_CNF_SHA256}\n{manifest_sha}".encode()
    ).hexdigest()
    if status.get("identity_hash") != expected_identity:
        raise ValueError("terminal solver identity hash mismatch")


def terminal_artifact_binding(analysis: dict[str, Any]) -> dict[str, str]:
    auth = analysis["authentication"]
    raw_path = Path(auth["terminal_artifact"])
    path = raw_path if raw_path.is_absolute() else REPO / raw_path
    return {
        "path": str(path.resolve()),
        "sha256": auth["terminal_artifact_sha256"],
    }


def authenticated_order(analysis: dict[str, Any]) -> tuple[int, tuple[int, ...]]:
    raw = analysis.get("named_orders")
    if not isinstance(raw, list) or len(raw) != 1 or type(raw[0]) is not int:
        raise ValueError("expected exactly one authenticated named order")
    index = raw[0]
    if not 0 <= index < len(ORDERS):
        raise ValueError("authenticated named order index is out of range")
    order = tuple(ORDERS[index])
    if len(order) != N or tuple(sorted(order)) != tuple(range(N)):
        raise ValueError("authenticated named order table is invalid")
    return index, order


def content_sha256(content: str) -> str:
    return hashlib.sha256(content.encode("utf-8")).hexdigest()


def stage_text(path: Path, content: str) -> Path:
    path.parent.mkdir(parents=True, exist_ok=True)
    staged = path.with_name(f".{path.name}.tmp.{os.getpid()}")
    flags = os.O_WRONLY | os.O_CREAT | os.O_EXCL
    descriptor = os.open(staged, flags, 0o644)
    try:
        with os.fdopen(descriptor, "w", encoding="utf-8") as handle:
            handle.write(content)
            handle.flush()
            os.fsync(handle.fileno())
    except BaseException:
        staged.unlink(missing_ok=True)
        raise
    return staged


def fsync_directory(path: Path) -> None:
    descriptor = os.open(path, os.O_RDONLY)
    try:
        os.fsync(descriptor)
    finally:
        os.close(descriptor)


def publication_lock_path(ledger_path: Path) -> Path:
    return ledger_path.resolve().with_name(ledger_path.name + ".lock")


def reject_symlink_path(path: Path, label: str) -> None:
    if path.is_symlink():
        raise ValueError(f"{label} must not be a symlink")


@contextmanager
def publication_lock(ledger_path: Path, *, exclusive: bool):
    """Serialize publishers and readers of one generated output set."""
    lock_path = publication_lock_path(ledger_path)
    lock_path.parent.mkdir(parents=True, exist_ok=True)
    with lock_path.open("a+") as handle:
        operation = fcntl.LOCK_EX if exclusive else fcntl.LOCK_SH
        fcntl.flock(handle.fileno(), operation)
        try:
            yield lock_path
        finally:
            fcntl.flock(handle.fileno(), fcntl.LOCK_UN)


def output_paths(lean_output: Path) -> tuple[Path, ...]:
    reject_symlink_path(lean_output, "coordinator output path")
    coordinator_path = lean_output.resolve()
    if coordinator_path.suffix != ".lean":
        raise ValueError("coordinator output must have a .lean suffix")
    shards = tuple(
        coordinator_path.with_name(f"{coordinator_path.stem}Shard{shard}.lean")
        for shard in range(SHARD_COUNT)
    )
    return (*shards, coordinator_path)


def parent_cnf_binding(path: Path | None) -> dict[str, Any]:
    """Authenticate the required parent DIMACS bytes."""
    if path is None:
        raise ValueError("parent CNF bytes are required for production")
    digest = sha256_file(path)
    if digest != PARENT_CNF_SHA256:
        raise ValueError("parent CNF hash drifted")
    return {"path": str(path.resolve()), "sha256": digest, "bytes_verified": True}


def validate_parent_ledger(path: Path) -> dict[str, Any]:
    if sha256_file(path) != PARENT_LEDGER_SHA256:
        raise ValueError("authenticated parent ledger hash drifted")
    parent = load_strict_json(path)
    if parent.get("schema") != "p97-exact17-child30-all-minimal-two-kalmanson/v1":
        raise ValueError("unexpected parent ledger schema")
    entries = parent.get("entries")
    if not isinstance(entries, list) or len(entries) != 40:
        raise ValueError("parent ledger entry count drifted")
    return parent


def _sha256_text_map(value: dict[str, Any], label: str) -> None:
    for key, digest in value.items():
        if not isinstance(key, str) or not isinstance(digest, str):
            raise TypeError(f"{label} schema drifted")
        if len(digest) != 64 or any(character not in "0123456789abcdef" for character in digest):
            raise ValueError(f"{label} contains an invalid SHA-256 digest")


def _validate_entries(
    ledger: dict[str, Any],
    analysis: dict[str, Any],
    parent: dict[str, Any],
    order: tuple[int, ...],
) -> list[str]:
    rows = [
        producer_bank.MetricRow(int(center), tuple(points), exact=False)
        for center, points in sorted(
            analysis["rows"].items(), key=lambda item: int(item[0])
        )
    ]
    reverse_order = tuple(reversed(order))
    records = producer_bank.enumerate_two_kalmanson_cancellations(
        rows, N, order, max_cores=100_000
    )
    reverse_records = producer_bank.enumerate_two_kalmanson_cancellations(
        rows, N, reverse_order, max_cores=100_000
    )
    supports = sorted(
        {path_hits(record) for record in records},
        key=lambda hits: (len(hits), sorted(hits)),
    )
    minimal = [
        hits for hits in supports if not any(other < hits for other in supports)
    ]
    expected_counts = (
        EXPECTED_RECORD_COUNT,
        EXPECTED_RECORD_COUNT,
        EXPECTED_DISTINCT_SUPPORT_COUNT,
        EXPECTED_MINIMAL_SUPPORT_COUNT,
    )
    if (len(records), len(reverse_records), len(supports), len(minimal)) != expected_counts:
        raise ValueError("authenticated analysis producer census drifted")
    entries = ledger["entries"]
    if not isinstance(entries, list) or len(entries) != EXPECTED_MINIMAL_SUPPORT_COUNT:
        raise ValueError("publication entry count drifted")
    parent_supports = [ledger_support(entry) for entry in parent["entries"]]
    lean_entries: list[str] = []
    seen: set[frozenset[Hit]] = set()
    for index, (entry, expected_hits) in enumerate(zip(entries, minimal, strict=True)):
        if not isinstance(entry, dict):
            raise TypeError(f"entry {index} is not an object")
        require_exact_keys(
            entry,
            {
                "hits",
                "forward_record",
                "reverse_record",
                "forward_lean_record",
                "reverse_lean_record",
            },
            f"entry {index}",
        )
        raw_hits = entry["hits"]
        if not isinstance(raw_hits, list):
            raise TypeError(f"entry {index} hits are not a list")
        try:
            hits = frozenset(
                (hit[0], hit[1])
                for hit in raw_hits
                if isinstance(hit, list)
                and len(hit) == 2
                and type(hit[0]) is int
                and type(hit[1]) is int
            )
        except (IndexError, TypeError) as error:
            raise ValueError(f"entry {index} has malformed hits") from error
        if len(hits) != len(raw_hits) or hits != expected_hits or hits in seen:
            raise ValueError(f"entry {index} support binding drifted")
        seen.add(hits)
        if any(parent_hits <= hits for parent_hits in parent_supports):
            raise ValueError(f"entry {index} is subsumed by the parent ledger")
        reverse_hits = reflected(hits)
        forward = entry["forward_record"]
        reverse = entry["reverse_record"]
        if path_hits(forward) != hits or path_hits(reverse) != reverse_hits:
            raise ValueError(f"entry {index} full-record support binding drifted")
        expected_forward = choose_exact_support_record(
            hits, order, records=records, rows=rows
        )
        expected_reverse = choose_exact_support_record(
            reverse_hits, reverse_order, records=reverse_records, rows=rows
        )
        if forward != expected_forward or reverse != expected_reverse:
            raise ValueError(f"entry {index} producer record binding drifted")
        forward_lean = project_record_for_lean(forward, hits, order, rows)
        reverse_lean = project_record_for_lean(
            reverse, reverse_hits, reverse_order, rows
        )
        if (
            entry["forward_lean_record"] != forward_lean
            or entry["reverse_lean_record"] != reverse_lean
            or not lean_occurrence_check(
                hits,
                forward_lean,
                reverse_lean,
                rows=rows,
                forward_order=order,
                reverse_order=reverse_order,
            )
        ):
            raise ValueError(f"entry {index} Lean projection binding drifted")
        lean_entries.append(lean_occurrence(hits, forward_lean, reverse_lean))
    return lean_entries


def generated_output_contents(
    lean_output: Path, lean_entries: list[str]
) -> dict[Path, str]:
    if len(lean_entries) != EXPECTED_MINIMAL_SUPPORT_COUNT:
        raise ValueError("cannot render an incomplete entry family")
    paths = output_paths(lean_output)
    chunks = [
        lean_entries[offset : offset + 21]
        for offset in range(0, EXPECTED_MINIMAL_SUPPORT_COUNT, 21)
    ]
    rendered = {
        paths[shard]: (
            shard_preamble(shard)
            + "[\n"
            + ",\n".join(chunk)
            + "]\n"
            + shard_postamble(shard)
        )
        for shard, chunk in enumerate(chunks)
    }
    rendered[paths[-1]] = coordinator()
    return rendered


def validate_published_outputs(
    ledger_path: Path,
    *,
    lean_output: Path,
    analysis_path: Path,
    parent_ledger_path: Path,
    parent_cnf_path: Path,
) -> dict[str, Any]:
    """Strict production-consumer gate for one immutable child-32 publication."""
    reject_symlink_path(ledger_path, "publication ledger path")
    reject_symlink_path(lean_output, "coordinator output path")
    ledger_path = ledger_path.resolve()
    expected_paths = output_paths(lean_output)
    with publication_lock(ledger_path, exclusive=False):
        first_ledger_bytes = ledger_path.read_bytes()
        ledger = json.loads(first_ledger_bytes, object_pairs_hook=strict_object)
        if not isinstance(ledger, dict):
            raise TypeError("publication ledger is not an object")
        require_exact_keys(ledger, LEDGER_KEYS, "publication ledger")
        if ledger["schema"] != LEDGER_SCHEMA:
            raise ValueError("legacy or unknown publication ledger schema")
        if ledger["publication_protocol"] != PUBLICATION_PROTOCOL:
            raise ValueError("publication ledger has no immutable fail-closed protocol")

        analysis = validate_analysis(analysis_path.resolve())
        terminal = terminal_artifact_binding(analysis)
        require_exact_keys(ledger["terminal_artifact"], {"path", "sha256"}, "terminal artifact")
        if ledger["source_analysis"] != str(analysis_path.resolve()):
            raise ValueError("source analysis path binding drifted")
        if ledger["source_analysis_sha256"] != ANALYSIS_SHA256:
            raise ValueError("source analysis hash binding drifted")
        if ledger["terminal_artifact"] != terminal:
            raise ValueError("terminal artifact binding drifted")

        parent = validate_parent_ledger(parent_ledger_path.resolve())
        if ledger["parent_ledger"] != str(parent_ledger_path.resolve()):
            raise ValueError("parent ledger path binding drifted")
        if ledger["parent_ledger_sha256"] != PARENT_LEDGER_SHA256:
            raise ValueError("parent ledger hash binding drifted")
        expected_parent_cnf = parent_cnf_binding(parent_cnf_path.resolve())
        require_exact_keys(ledger["parent_cnf"], {"path", "sha256", "bytes_verified"}, "parent CNF")
        if ledger["parent_cnf"] != expected_parent_cnf:
            raise ValueError("parent CNF byte/path binding drifted")

        counts = (
            ledger["record_count"],
            ledger["reverse_record_count"],
            ledger["distinct_support_count"],
            ledger["minimal_support_count"],
            ledger["parent_subsumed_support_count"],
            ledger["emitted_clause_count"],
            ledger["shard_count"],
        )
        if any(type(value) is not int for value in counts):
            raise TypeError("publication census values must be integers")
        if counts != (237, 237, 135, 84, 0, 336, SHARD_COUNT):
            raise ValueError("publication census binding drifted")
        projection = ledger["lean_projection"]
        require_exact_keys(
            projection,
            {"schema", "record_count", "preserves_full_records"},
            "Lean projection",
        )
        if projection != {
            "schema": "path-row-choice-subset/v1",
            "record_count": 168,
            "preserves_full_records": True,
        }:
            raise ValueError("Lean projection identity drifted")

        order_index, order = authenticated_order(analysis)
        named_order = ledger["named_order"]
        require_exact_keys(
            named_order,
            {"index", "tuple", "reverse_tuple", "table_sha256"},
            "named order",
        )
        if named_order != {
            "index": order_index,
            "tuple": list(order),
            "reverse_tuple": list(reversed(order)),
            "table_sha256": order_table_sha256(),
        }:
            raise ValueError("named/reverse order or table binding drifted")
        if type(named_order["index"]) is not int:
            raise TypeError("named order index must be an integer")

        if ledger["implementation_identities"] != implementation_identities():
            raise ValueError("generator/helper/producer identity drifted")
        if ledger["source_identities"] != source_identities():
            raise ValueError("Lean source identity drifted")

        outputs = ledger["generated_outputs"]
        if not isinstance(outputs, dict):
            raise TypeError("generated output map is not an object")
        _sha256_text_map(outputs, "generated output map")
        expected_names = {str(path) for path in expected_paths}
        if len(outputs) != SHARD_COUNT + 1 or set(outputs) != expected_names:
            raise ValueError("generated output allowlist drifted")
        for path in expected_paths:
            if (
                not path.is_file()
                or path.is_symlink()
                or sha256_file(path) != outputs[str(path)]
            ):
                raise ValueError(f"published output hash mismatch: {path}")

        lean_entries = _validate_entries(ledger, analysis, parent, order)
        rendered = generated_output_contents(lean_output, lean_entries)
        for path, content in rendered.items():
            expected_digest = content_sha256(content)
            if outputs[str(path)] != expected_digest:
                raise ValueError(f"entry/output binding drifted: {path}")
        if ledger_path.read_bytes() != first_ledger_bytes:
            raise ValueError("publication ledger changed during validation")
        return ledger


def publish_staged_once(
    staged_outputs: dict[Path, Path], staged_ledger: Path, ledger_path: Path
) -> None:
    """Publish immutable outputs, then the ledger marker, without overwrites."""
    destinations = [*staged_outputs, ledger_path]
    if len({path.resolve() for path in destinations}) != len(destinations):
        raise ValueError("publication destinations are not distinct")
    existing = [path for path in destinations if path.exists() or path.is_symlink()]
    if existing:
        raise FileExistsError(f"immutable publication target exists: {existing[0]}")
    for destination, staged in staged_outputs.items():
        os.link(staged, destination)
        staged.unlink()
    for parent in {path.parent for path in staged_outputs}:
        fsync_directory(parent)
    os.link(staged_ledger, ledger_path)
    staged_ledger.unlink()
    fsync_directory(ledger_path.parent)


def shard_preamble(shard: int) -> str:
    return rf'''/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenThirtiethModelRefinements

/-!
# Child-31 cancellation refinements, shard {shard}

This shard contains 21 of the 84 subset-minimal checked cancellation
occurrences extracted exhaustively from the authenticated child-31 model.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailBlockerVExactSeventeenThirtyFirstModelRefinementsShard{shard}

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenTwentyEighthModelRefinements

private abbrev occurrenceClauses :=
  ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses

def cancellationOccurrences : List CancellationOccurrence :=
'''


def shard_postamble(shard: int) -> str:
    return rf'''

theorem cancellationOccurrences_length : cancellationOccurrences.length = 21 := by
  native_decide

theorem cancellationOccurrences_all_check :
    cancellationOccurrences.all CancellationOccurrence.check = true := by
  native_decide

def refinementClauses : Std.Sat.CNF Atom :=
  cancellationOccurrences.flatMap fun occ => occurrenceClauses occ.hits

theorem refinementClauses_length : refinementClauses.length = 84 := by
  native_decide

theorem sourceAssign_refinementClauses {{A : Finset ℝ²}}
    (source : SourceRealization A) :
    ∀ clause ∈ refinementClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  intro clause hclause
  simp only [refinementClauses, List.mem_flatMap] at hclause
  rcases hclause with ⟨occ, hocc, hclause⟩
  have hcheck := List.all_eq_true.mp cancellationOccurrences_all_check occ hocc
  simp only [occurrenceClauses,
    ATailBlockerVExactSeventeenSeventeenthModelRefinements.occurrenceClauses,
    List.mem_flatMap, List.mem_map] at hclause
  obtain ⟨order, _horder, direction, _hdirection, rfl⟩ := hclause
  exact sourceAssign_cancellationOccurrenceClause source occ hcheck order direction

#print axioms sourceAssign_refinementClauses

end ATailBlockerVExactSeventeenThirtyFirstModelRefinementsShard{shard}
end Problem97
'''


def coordinator() -> str:
    imports = "\n".join(
        "import Erdos9796Proof.P97.ATail."
        f"BlockerVExactSeventeenThirtyFirstModelRefinementsShard{shard}"
        for shard in range(SHARD_COUNT)
    )
    clause_expr = " ++\n    ".join(
        "ATailBlockerVExactSeventeenThirtyFirstModelRefinementsShard"
        f"{shard}.refinementClauses"
        for shard in range(SHARD_COUNT)
    )
    length_lemmas = ",\n    ".join(
        "ATailBlockerVExactSeventeenThirtyFirstModelRefinementsShard"
        f"{shard}.refinementClauses_length" for shard in range(SHARD_COUNT)
    )
    return rf'''/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

{imports}

/-!
# Complete new minimal cancellation family from exact-seventeen child 31

The authenticated child-31 model has 237 checked two-Kalmanson cancellation
certificates. Their 135 distinct positive-incidence supports have 84
subset-minimal members, none subsumed by the child-30 bank. The four imported
shards prove all 84 occurrences and their 336 order/orientation nogoods.
-/

namespace Problem97
namespace ATailBlockerVExactSeventeenThirtyFirstModelRefinements

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenThirtiethModelRefinements

def thirtyFirstModelRefinementClauses : Std.Sat.CNF Atom :=
  {clause_expr}

theorem thirtyFirstModelRefinementClauses_length :
    thirtyFirstModelRefinementClauses.length = 336 := by
  simp only [thirtyFirstModelRefinementClauses, List.length_append,
    {length_lemmas}]

theorem sourceAssign_thirtyFirstModelRefinementClauses
    {{A : Finset (EuclideanSpace ℝ (Fin 2))}}
    (source : SourceRealization A) :
    ∀ clause ∈ thirtyFirstModelRefinementClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  intro clause hclause
  change clause ∈
    ATailBlockerVExactSeventeenThirtyFirstModelRefinementsShard0.refinementClauses ++
    ATailBlockerVExactSeventeenThirtyFirstModelRefinementsShard1.refinementClauses ++
    ATailBlockerVExactSeventeenThirtyFirstModelRefinementsShard2.refinementClauses ++
    ATailBlockerVExactSeventeenThirtyFirstModelRefinementsShard3.refinementClauses at hclause
  rcases List.mem_append.mp hclause with h012 | h3
  · rcases List.mem_append.mp h012 with h01 | h2
    · rcases List.mem_append.mp h01 with h0 | h1
      · exact ATailBlockerVExactSeventeenThirtyFirstModelRefinementsShard0.sourceAssign_refinementClauses source clause h0
      · exact ATailBlockerVExactSeventeenThirtyFirstModelRefinementsShard1.sourceAssign_refinementClauses source clause h1
    · exact ATailBlockerVExactSeventeenThirtyFirstModelRefinementsShard2.sourceAssign_refinementClauses source clause h2
  · exact ATailBlockerVExactSeventeenThirtyFirstModelRefinementsShard3.sourceAssign_refinementClauses source clause h3

def extendedThirtyFirstModelRefinementsCnf : Std.Sat.CNF Atom :=
  extendedThirtiethModelRefinementsCnf ++ thirtyFirstModelRefinementClauses

theorem extendedThirtyFirstModelRefinementsCnf_length :
    extendedThirtyFirstModelRefinementsCnf.length = 5847240 := by
  simp only [extendedThirtyFirstModelRefinementsCnf, List.length_append,
    extendedThirtiethModelRefinementsCnf_length,
    thirtyFirstModelRefinementClauses_length]

theorem sourceAssign_extendedThirtyFirstModelRefinementsCnf
    {{A : Finset (EuclideanSpace ℝ (Fin 2))}}
    (source : SourceRealization A) :
    Std.Sat.CNF.eval (sourceAssign source.model)
      extendedThirtyFirstModelRefinementsCnf = true := by
  rw [Std.Sat.CNF.eval, List.all_eq_true]
  intro clause hclause
  simp only [extendedThirtyFirstModelRefinementsCnf, List.mem_append] at hclause
  rcases hclause with hparent | hsuffix
  · have h := sourceAssign_extendedThirtiethModelRefinementsCnf source
    rw [Std.Sat.CNF.eval, List.all_eq_true] at h
    exact h clause hparent
  · exact sourceAssign_thirtyFirstModelRefinementClauses source clause hsuffix

theorem false_of_sourceRealization_of_extendedThirtyFirstModelRefinementsCnf_unsat
    {{A : Finset (EuclideanSpace ℝ (Fin 2))}}
    (hsource : Nonempty (SourceRealization A))
    (hunsat : ¬ ∃ assignment,
      Std.Sat.CNF.eval assignment extendedThirtyFirstModelRefinementsCnf = true) : False := by
  rcases hsource with ⟨source⟩
  exact hunsat
    ⟨sourceAssign source.model,
      sourceAssign_extendedThirtyFirstModelRefinementsCnf source⟩

#print axioms sourceAssign_extendedThirtyFirstModelRefinementsCnf

end ATailBlockerVExactSeventeenThirtyFirstModelRefinements
end Problem97
'''


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--analysis", type=Path, required=True)
    parser.add_argument("--parent-ledger", type=Path, required=True)
    parser.add_argument(
        "--parent-cnf",
        type=Path,
        required=True,
        help="authenticated parent DIMACS bytes",
    )
    parser.add_argument("--lean-output", type=Path, required=True)
    parser.add_argument("--ledger-output", type=Path, required=True)
    args = parser.parse_args()

    reject_symlink_path(args.lean_output, "coordinator output path")
    reject_symlink_path(args.ledger_output, "publication ledger path")
    analysis_path = args.analysis.resolve()
    parent_ledger_path = args.parent_ledger.resolve()
    parent_cnf_path = args.parent_cnf.resolve()
    lean_output = args.lean_output.resolve()
    ledger_output = args.ledger_output.resolve()
    analysis = validate_analysis(analysis_path)
    order_index, order = authenticated_order(analysis)
    parent_cnf = parent_cnf_binding(parent_cnf_path)
    rows = [
        producer_bank.MetricRow(int(center), tuple(points), exact=False)
        for center, points in sorted(
            analysis["rows"].items(), key=lambda item: int(item[0])
        )
    ]
    records = producer_bank.enumerate_two_kalmanson_cancellations(
        rows, N, order, max_cores=100_000
    )
    # The reverse Lean orientation is the authenticated named order viewed
    # from the opposite boundary direction.  Keep its producer bank separate:
    # its positional supports are reflected, while its source rows remain the
    # same complete analysis rows.
    reverse_order = tuple(reversed(order))
    reverse_records = producer_bank.enumerate_two_kalmanson_cancellations(
        rows, N, reverse_order, max_cores=100_000
    )
    supports = sorted(
        {path_hits(record) for record in records},
        key=lambda hits: (len(hits), sorted(hits)),
    )
    minimal = [
        hits for hits in supports if not any(other < hits for other in supports)
    ]
    if (len(records), len(supports), len(minimal)) != (237, 135, 84):
        raise ValueError(
            "unexpected census: "
            f"{len(records)} records, {len(supports)} supports, {len(minimal)} minimal"
        )

    parent = validate_parent_ledger(parent_ledger_path)
    parent_supports = [ledger_support(entry) for entry in parent["entries"]]
    subsumed = [
        hits for hits in minimal if any(parent_hits <= hits for parent_hits in parent_supports)
    ]
    if subsumed:
        raise ValueError(f"child-30 bank subsumes {len(subsumed)} candidate supports")

    entries = []
    lean_entries = []
    for hits in minimal:
        forward = choose_exact_support_record(
            hits, order, records=records, rows=rows
        )
        reverse_hits = reflected(hits)
        reverse = choose_exact_support_record(
            reverse_hits, reverse_order, records=reverse_records, rows=rows
        )
        if path_hits(forward) != hits or path_hits(reverse) != reverse_hits:
            raise AssertionError("chosen certificate does not consume the exact support")
        forward_lean = project_record_for_lean(forward, hits, order, rows)
        reverse_lean = project_record_for_lean(
            reverse, reverse_hits, reverse_order, rows
        )
        if not lean_occurrence_check(
            hits,
            forward_lean,
            reverse_lean,
            rows=rows,
            forward_order=order,
            reverse_order=reverse_order,
        ):
            raise AssertionError("projected Lean occurrence failed its mirror check")
        entries.append(
            {
                "hits": [list(hit) for hit in sorted(hits)],
                "forward_record": forward,
                "reverse_record": reverse,
                "forward_lean_record": forward_lean,
                "reverse_lean_record": reverse_lean,
            }
        )
        lean_entries.append(lean_occurrence(hits, forward_lean, reverse_lean))

    output_contents = generated_output_contents(lean_output, lean_entries)

    ledger = {
        "schema": LEDGER_SCHEMA,
        "source_analysis": str(analysis_path),
        "source_analysis_sha256": sha256_file(analysis_path),
        "terminal_artifact": terminal_artifact_binding(analysis),
        "parent_ledger": str(parent_ledger_path),
        "parent_ledger_sha256": sha256_file(parent_ledger_path),
        "record_count": len(records),
        "reverse_record_count": len(reverse_records),
        "distinct_support_count": len(supports),
        "minimal_support_count": len(minimal),
        "parent_subsumed_support_count": 0,
        "emitted_clause_count": 4 * len(minimal),
        "lean_projection": {
            "schema": "path-row-choice-subset/v1",
            "record_count": 2 * len(minimal),
            "preserves_full_records": True,
        },
        "shard_count": SHARD_COUNT,
        "generated_outputs": {
            str(path.resolve()): content_sha256(content)
            for path, content in sorted(
                output_contents.items(), key=lambda item: str(item[0])
            )
        },
        "named_order": {
            "index": order_index,
            "tuple": list(order),
            "reverse_tuple": list(reverse_order),
            "table_sha256": order_table_sha256(),
        },
        "parent_cnf": parent_cnf,
        "implementation_identities": implementation_identities(),
        "source_identities": source_identities(),
        "publication_protocol": PUBLICATION_PROTOCOL,
        "entries": entries,
    }
    ledger_content = json.dumps(ledger, indent=2, sort_keys=True) + "\n"
    staged: dict[Path, Path] = {}
    try:
        with publication_lock(ledger_output, exclusive=True):
            for path, content in output_contents.items():
                staged[path] = stage_text(path, content)
            staged[ledger_output] = stage_text(ledger_output, ledger_content)
            publish_staged_once(
                {path: staged[path] for path in output_contents},
                staged[ledger_output],
                ledger_output,
            )
    finally:
        for temporary in staged.values():
            temporary.unlink(missing_ok=True)
    print(
        f"generated {SHARD_COUNT} Lean shards plus {lean_output}: "
        f"{len(records)} records -> {len(minimal)} minimal -> {4 * len(minimal)} clauses"
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
