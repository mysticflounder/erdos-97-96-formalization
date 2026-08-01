"""Fail-closed Phase-3 realization-leaf preparation and diagnostic screening.

This module adapts the current, verified 100-model ``k=4, n=10,
profile=(4,4,5)`` SAT census into order-sensitive metric leaves.  It does not
promote diagnostic solver answers to geometric results.  Prepared leaves remain
immutable and ``UNRESOLVED``.  A separate screening stream may promote a Z3 SAT
answer only when every returned coordinate is rational and an independent
``Fraction`` replay verifies all polynomial constraints exactly.

The SAT cell's ``exact=True`` means that four support labels were selected in
each shell.  It does *not* assert that off-support labels have a different
metric radius.  Consequently every emitted :class:`MetricRow` has
``exact=False``.
"""

from __future__ import annotations

import argparse
import concurrent.futures
import hashlib
import itertools
import json
import os
import re
import subprocess
import sys
import tempfile
from collections.abc import Callable, Mapping, Sequence
from dataclasses import dataclass
from fractions import Fraction
from pathlib import Path
from typing import Any

# ``sat_generate.py`` predates package-relative imports.  Adding its directory
# here makes both ``python -m census.p97_search.realize`` and direct test imports
# resolve the exact same source modules.
HERE = Path(__file__).resolve().parent
if str(HERE) not in sys.path:
    sys.path.insert(0, str(HERE))

from annotations import AnnotatedNode
from canonical import canonical_annotated
from cells import Cell
from sat_generate import (
    Phase3Error,
    SatEncoding,
    verify_run_artifacts,
)

from census.global_confinement.metric_realizability_probe import (
    MetricRow,
)

SOURCE_CELL = Cell(k=4, n=10, profile=(4, 4, 5), exact=True)
SOURCE_MODE = "cap+blocker-annotated"
SOURCE_MODEL_COUNT = 100
ORDER_COUNT = 24
LEAF_COUNT = SOURCE_MODEL_COUNT * ORDER_COUNT
OUTPUT_SCHEMA = "p97-phase3-realization-preparation-v1"
LEAF_SCHEMA = "p97-phase3-realization-leaf-v1"
SCREEN_INPUT_SCHEMA = "p97-phase3-z3-screen-input-v1"
SCREEN_RECORD_SCHEMA = "p97-phase3-z3-screen-record-v1"
SCREEN_MANIFEST_SCHEMA = "p97-phase3-z3-screen-manifest-v1"
SCREEN_SUMMARY_SCHEMA = "p97-phase3-z3-screen-summary-v1"
MAX_WORKERS = 24
MAX_TIMEOUT_SECONDS = 3600

_MODEL_KEYS = frozenset(
    {
        "blocking_clause",
        "canonical_digest",
        "canonical_was_new",
        "index",
        "iterator",
        "semantic_assignment",
    }
)
_BANK_HEADER_KEYS = frozenset({"rule_bank_hash", "spec_version", "cell"})
_BANK_ENTRY_KEYS = frozenset({"digest", "status", "fired", "hypotheses", "canonical"})
_LEAF_KEYS = frozenset(
    {
        "schema",
        "leaf_index",
        "leaf_id",
        "source_model_index",
        "canonical_digest",
        "order_id",
        "order",
        "cap_fibers",
        "blocker",
        "metric_rows",
        "shard",
        "status",
        "reason",
        "evidence",
    }
)
_METRIC_ROW_KEYS = frozenset({"center", "support", "exact"})
_SCREEN_RECORD_KEYS = frozenset(
    {
        "schema",
        "leaf_index",
        "leaf_id",
        "prepared_leaf_sha256",
        "screen_input_sha256",
        "source_manifest_sha256",
        "solver",
        "solver_status",
        "status",
        "diagnostic",
        "evidence",
        "record_sha256",
    }
)
_RATIONAL_RE = re.compile(r"-?[0-9]+/[1-9][0-9]*\Z")


class RealizationError(RuntimeError):
    """An ingress, schema, resume, or realization-status contract failure."""


@dataclass(frozen=True)
class SourceModel:
    index: int
    canonical_digest: str
    annotated: AnnotatedNode


@dataclass(frozen=True)
class VerifiedSource:
    run_dir: Path
    manifest: Mapping[str, Any]
    manifest_sha256: str
    models: tuple[SourceModel, ...]


@dataclass(frozen=True)
class OrderSpec:
    order_id: str
    order: tuple[int, ...]


def _sha256_bytes(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def _sha256_file(path: Path) -> str:
    return _sha256_bytes(path.read_bytes())


def _is_sha256(value: Any) -> bool:
    return (
        isinstance(value, str)
        and len(value) == 64
        and all(ch in "0123456789abcdef" for ch in value)
    )


def _no_duplicate_keys(pairs: list[tuple[str, Any]]) -> dict[str, Any]:
    result: dict[str, Any] = {}
    for key, value in pairs:
        if key in result:
            raise RealizationError(f"duplicate JSON object key {key!r}")
        result[key] = value
    return result


def _strict_json(text: str, *, source: str) -> Any:
    try:
        return json.loads(text, object_pairs_hook=_no_duplicate_keys)
    except RealizationError:
        raise
    except (json.JSONDecodeError, TypeError) as exc:
        raise RealizationError(f"malformed JSON in {source}: {exc}") from exc


def _read_json(path: Path) -> Any:
    if not path.is_file():
        raise RealizationError(f"missing required artifact {path.name}")
    return _strict_json(path.read_text(), source=str(path))


def _read_jsonl(path: Path) -> list[dict[str, Any]]:
    if not path.is_file():
        raise RealizationError(f"missing required artifact {path.name}")
    records: list[dict[str, Any]] = []
    with path.open() as handle:
        for line_number, line in enumerate(handle, 1):
            if not line.endswith("\n"):
                raise RealizationError(
                    f"{path.name}:{line_number} is not a complete JSONL record"
                )
            if not line.strip():
                raise RealizationError(
                    f"blank JSONL record at {path.name}:{line_number}"
                )
            value = _strict_json(line, source=f"{path}:{line_number}")
            if not isinstance(value, dict):
                raise RealizationError(
                    f"{path.name}:{line_number} must be a JSON object"
                )
            records.append(value)
    return records


def _jsonable(value: Any) -> Any:
    if isinstance(value, Mapping):
        return {str(key): _jsonable(item) for key, item in value.items()}
    if isinstance(value, (tuple, list)):
        return [_jsonable(item) for item in value]
    if isinstance(value, (set, frozenset)):
        return [_jsonable(item) for item in sorted(value)]
    return value


def _canonical_digest(annotated: AnnotatedNode) -> str:
    return _sha256_bytes(repr(canonical_annotated(annotated)).encode("utf-8"))


def _require_exact_keys(
    record: Mapping[str, Any], expected: frozenset[str], *, where: str
) -> None:
    actual = frozenset(record)
    if actual != expected:
        missing = sorted(expected - actual)
        extra = sorted(actual - expected)
        raise RealizationError(
            f"{where} schema mismatch: missing={missing}, extra={extra}"
        )


def _preverify_source(path: Path) -> dict[str, Any]:
    required = ("manifest.json", "base.cnf", "models.jsonl", "bank.jsonl")
    missing = [name for name in required if not (path / name).is_file()]
    if missing:
        raise RealizationError(f"source run is missing required artifacts: {missing}")

    manifest = _read_json(path / "manifest.json")
    if not isinstance(manifest, dict):
        raise RealizationError("manifest.json must contain a JSON object")
    hashes = manifest.get("artifact_hashes")
    if not isinstance(hashes, dict):
        raise RealizationError("manifest artifact_hashes must be an object")
    for name in ("base.cnf", "models.jsonl", "bank.jsonl"):
        digest = hashes.get(name)
        if not _is_sha256(digest):
            raise RealizationError(
                f"manifest lacks a valid required artifact hash for {name}"
            )

    try:
        verified = verify_run_artifacts(path)
    except (Phase3Error, KeyError, TypeError, ValueError, json.JSONDecodeError) as exc:
        raise RealizationError(
            f"source run failed strict Phase-3 replay: {exc}"
        ) from exc
    if verified != manifest:
        raise RealizationError("strict manifest parse disagrees with Phase-3 replay")
    return manifest


def _load_joined_source(path: Path, manifest: Mapping[str, Any]) -> VerifiedSource:
    """Decode and join a source whose mandatory Phase-3 replay already passed."""

    if manifest.get("cell") != {
        "k": 4,
        "n": 10,
        "profile": [4, 4, 5],
        "exact": True,
    }:
        raise RealizationError("source cell is not exact k4/n10/profile-(4,4,5)")
    if manifest.get("mode") != SOURCE_MODE:
        raise RealizationError(f"source mode must be {SOURCE_MODE}")
    if manifest.get("status") != "PARTIAL":
        raise RealizationError("bounded100 realization ingress must be PARTIAL")
    if manifest.get("raw_count") != SOURCE_MODEL_COUNT:
        raise RealizationError("source raw_count must be exactly 100")
    if manifest.get("canonical_count") != SOURCE_MODEL_COUNT:
        raise RealizationError("source canonical_count must be exactly 100")
    if manifest.get("model_limit") != SOURCE_MODEL_COUNT:
        raise RealizationError("source model_limit must be exactly 100")
    if manifest.get("unsat_verified") is not False:
        raise RealizationError("PARTIAL source must not assert verified UNSAT")

    model_records = _read_jsonl(path / "models.jsonl")
    bank_records = _read_jsonl(path / "bank.jsonl")
    if len(model_records) != SOURCE_MODEL_COUNT:
        raise RealizationError("models.jsonl must contain exactly 100 records")
    if len(bank_records) != SOURCE_MODEL_COUNT + 1:
        raise RealizationError("bank.jsonl must contain one header and 100 entries")

    header = bank_records[0]
    _require_exact_keys(header, _BANK_HEADER_KEYS, where="bank header")
    if header.get("rule_bank_hash") != manifest.get("rule_bank_hash"):
        raise RealizationError("bank header rule_bank_hash disagrees with manifest")
    if header.get("cell") != manifest.get("cell"):
        raise RealizationError("bank header cell disagrees with manifest")

    bank_by_digest: dict[str, dict[str, Any]] = {}
    for line_number, entry in enumerate(bank_records[1:], 2):
        _require_exact_keys(entry, _BANK_ENTRY_KEYS, where=f"bank line {line_number}")
        digest = entry.get("digest")
        if not _is_sha256(digest):
            raise RealizationError(f"bank line {line_number} has invalid digest")
        if digest in bank_by_digest:
            raise RealizationError(f"duplicate bank digest {digest}")
        if entry.get("status") != "OPEN":
            raise RealizationError(
                f"bank digest {digest} is not OPEN: {entry.get('status')!r}"
            )
        if not isinstance(entry.get("canonical"), list):
            raise RealizationError(f"bank digest {digest} lacks canonical form")
        bank_by_digest[digest] = entry

    encoding = SatEncoding(SOURCE_CELL, blocker=True, cap=True)
    models: list[SourceModel] = []
    model_digests: set[str] = set()
    for expected_index, record in enumerate(model_records):
        _require_exact_keys(record, _MODEL_KEYS, where=f"model {expected_index}")
        if record.get("index") != expected_index:
            raise RealizationError(f"model index {expected_index} is non-consecutive")
        if record.get("canonical_was_new") is not True:
            raise RealizationError(
                f"model {expected_index} is not a new canonical record"
            )
        digest = record.get("canonical_digest")
        if not _is_sha256(digest):
            raise RealizationError(f"model {expected_index} has invalid digest")
        if digest in model_digests:
            raise RealizationError(f"duplicate model canonical digest {digest}")
        assignment = encoding.assignment_from_record(record)
        decoded = encoding.decode(assignment)
        if not isinstance(decoded, AnnotatedNode):
            raise RealizationError(f"model {expected_index} did not decode annotated")
        actual_digest = _canonical_digest(decoded)
        if digest != actual_digest:
            raise RealizationError(
                f"model {expected_index} canonical digest does not replay"
            )
        bank_entry = bank_by_digest.get(digest)
        if bank_entry is None:
            raise RealizationError(f"model digest {digest} is absent from OPEN bank")
        if bank_entry["canonical"] != _jsonable(canonical_annotated(decoded)):
            raise RealizationError(f"bank canonical form mismatch for digest {digest}")
        model_digests.add(digest)
        models.append(SourceModel(expected_index, digest, decoded))

    if model_digests != set(bank_by_digest):
        raise RealizationError("model/bank digest join is not exactly one-to-one")
    models.sort(key=lambda model: model.canonical_digest)
    return VerifiedSource(
        run_dir=path.resolve(),
        manifest=dict(manifest),
        manifest_sha256=_sha256_file(path / "manifest.json"),
        models=tuple(models),
    )


def load_verified_source(run_dir: str | Path) -> VerifiedSource:
    """Mandatory current-source ingress; there is no historical bypass."""

    path = Path(run_dir)
    manifest = _preverify_source(path)
    return _load_joined_source(path, manifest)


def cap_orders(annotated: AnnotatedNode) -> tuple[OrderSpec, ...]:
    """Return all 24 cap-compatible orders, with no reflection quotient."""

    caps = annotated.caps
    if caps is None:
        raise RealizationError("cap-compatible order requested without cap annotation")
    moser = caps.sorted_moser()
    fibers = tuple(
        tuple(sorted(label for label, cap in caps.f.items() if cap == index))
        for index in range(3)
    )
    if sorted(map(len, fibers)) != [2, 2, 3]:
        raise RealizationError(
            f"expected cap-fiber sizes (2,2,3), got {tuple(map(len, fibers))}"
        )

    raw_orders = sorted(
        {
            (
                moser[0],
                *fiber2,
                moser[1],
                *fiber0,
                moser[2],
                *fiber1,
            )
            for fiber2, fiber0, fiber1 in itertools.product(
                itertools.permutations(fibers[2]),
                itertools.permutations(fibers[0]),
                itertools.permutations(fibers[1]),
            )
        }
    )
    if len(raw_orders) != ORDER_COUNT:
        raise RealizationError(f"expected 24 cap orders, got {len(raw_orders)}")
    labels = list(range(annotated.node.n))
    if any(sorted(order) != labels for order in raw_orders):
        raise RealizationError("constructed cap order is not a label permutation")
    return tuple(
        OrderSpec(order_id=f"order-{index:02d}", order=order)
        for index, order in enumerate(raw_orders)
    )


def metric_rows(annotated: AnnotatedNode) -> tuple[MetricRow, ...]:
    """Translate selected SAT supports without inventing off-support exclusions."""

    return tuple(
        MetricRow(center=center, support=tuple(sorted(shell)), exact=False)
        for center, shell in enumerate(annotated.node.shells)
    )


def leaf_hash(canonical_digest: str, order_id: str) -> str:
    if not _is_sha256(canonical_digest):
        raise RealizationError("leaf source digest is not sha256")
    return _sha256_bytes((canonical_digest + order_id).encode("ascii"))


def shard_for(canonical_digest: str, order_id: str, workers: int) -> int:
    if type(workers) is not int or not (1 <= workers <= MAX_WORKERS):
        raise RealizationError(f"workers must be in 1..{MAX_WORKERS}")
    return int(leaf_hash(canonical_digest, order_id), 16) % workers


def build_leaves(source: VerifiedSource, *, workers: int) -> tuple[dict[str, Any], ...]:
    """Build the deterministic 2,400-leaf preparation stream."""

    if len(source.models) != SOURCE_MODEL_COUNT:
        raise RealizationError("verified source does not contain exactly 100 models")
    leaves: list[dict[str, Any]] = []
    for model in source.models:
        annotated = model.annotated
        if annotated.blocker is None or annotated.caps is None:
            raise RealizationError("source model lacks combined annotations")
        rows = metric_rows(annotated)
        if any(row.exact for row in rows):
            raise RealizationError("metric translation invented an exact radius row")
        fibers = [
            sorted(label for label, cap in annotated.caps.f.items() if cap == index)
            for index in range(3)
        ]
        for order_spec in cap_orders(annotated):
            digest = leaf_hash(model.canonical_digest, order_spec.order_id)
            leaves.append(
                {
                    "schema": LEAF_SCHEMA,
                    "leaf_index": len(leaves),
                    "leaf_id": digest,
                    "source_model_index": model.index,
                    "canonical_digest": model.canonical_digest,
                    "order_id": order_spec.order_id,
                    "order": list(order_spec.order),
                    "cap_fibers": fibers,
                    "blocker": list(annotated.blocker.c),
                    "metric_rows": [row.as_dict() for row in rows],
                    "shard": int(digest, 16) % workers,
                    "status": "UNRESOLVED",
                    "reason": "PREPARE_ONLY_NO_EXACT_CERTIFICATE",
                    "evidence": None,
                }
            )
    if len(leaves) != LEAF_COUNT:
        raise RealizationError(f"expected 2400 leaves, got {len(leaves)}")
    identities = {leaf["leaf_id"] for leaf in leaves}
    if len(identities) != LEAF_COUNT:
        raise RealizationError("leaf identities are not unique")
    return tuple(leaves)


def _validate_resources(
    *,
    workers: int,
    solver_threads: int,
    singular_timeout: int,
    z3_timeout: int,
    cvc5_timeout: int,
) -> None:
    if type(workers) is not int or not (1 <= workers <= MAX_WORKERS):
        raise RealizationError(f"workers must be in 1..{MAX_WORKERS}")
    if solver_threads != 1:
        raise RealizationError("solver_threads must be exactly 1")
    for name, value in (
        ("singular_timeout", singular_timeout),
        ("z3_timeout", z3_timeout),
        ("cvc5_timeout", cvc5_timeout),
    ):
        if type(value) is not int or not (1 <= value <= MAX_TIMEOUT_SECONDS):
            raise RealizationError(
                f"{name} must be an integer in 1..{MAX_TIMEOUT_SECONDS}"
            )


def _output_manifest(
    source: VerifiedSource,
    *,
    workers: int,
    solver_threads: int,
    singular_timeout: int,
    z3_timeout: int,
    cvc5_timeout: int,
) -> dict[str, Any]:
    return {
        "schema": OUTPUT_SCHEMA,
        "mode": "PREPARE_ONLY",
        "source": {
            "run_dir": str(source.run_dir),
            "manifest_sha256": source.manifest_sha256,
            "rule_bank_hash": source.manifest["rule_bank_hash"],
            "artifact_hashes": {
                name: source.manifest["artifact_hashes"][name]
                for name in ("base.cnf", "models.jsonl", "bank.jsonl")
            },
            "status": source.manifest["status"],
            "raw_count": source.manifest["raw_count"],
            "canonical_count": source.manifest["canonical_count"],
        },
        "configuration": {
            "orders": "all-24",
            "workers": workers,
            "solver_threads": solver_threads,
            "singular_timeout": singular_timeout,
            "z3_timeout": z3_timeout,
            "cvc5_timeout": cvc5_timeout,
        },
        "leaf_count": LEAF_COUNT,
        "status_policy": {
            "emitted": ["UNRESOLVED"],
            "exact_realized_requires": "independently replayed exact rational coordinates",
            "proved_infeasible_requires": (
                "replayable exact unit-ideal or all-order exact certificate"
            ),
            "diagnostic_unsat_is": "UNRESOLVED",
        },
    }


def _atomic_json(path: Path, value: Any) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    data = (json.dumps(value, indent=2, sort_keys=True) + "\n").encode("utf-8")
    fd, temporary = tempfile.mkstemp(
        dir=str(path.parent), prefix=f".{path.name}-", suffix=".tmp"
    )
    try:
        with os.fdopen(fd, "wb") as handle:
            handle.write(data)
            handle.flush()
            os.fsync(handle.fileno())
        os.replace(temporary, path)
    except BaseException:
        try:
            os.unlink(temporary)
        except OSError:
            pass
        raise


def _jsonl_line(record: Mapping[str, Any]) -> bytes:
    return (json.dumps(record, sort_keys=True, separators=(",", ":")) + "\n").encode(
        "utf-8"
    )


def _canonical_json_bytes(value: Any) -> bytes:
    return json.dumps(value, sort_keys=True, separators=(",", ":")).encode("utf-8")


def _screen_input(leaf: Mapping[str, Any]) -> dict[str, Any]:
    """Build and validate the exact polynomial system attached to one leaf."""

    _validate_leaf(leaf, where=f"leaf {leaf.get('leaf_index')}")
    order = leaf["order"]
    rows = leaf["metric_rows"]
    if sorted(order) != list(range(SOURCE_CELL.n)):
        raise RealizationError("screen order is not an exact label permutation")
    for index, row in enumerate(rows):
        _require_exact_keys(row, _METRIC_ROW_KEYS, where=f"leaf metric row {index}")
        center = row["center"]
        support = row["support"]
        if (
            type(center) is not int
            or center != index
            or not isinstance(support, list)
            or len(support) != 4
            or len(set(support)) != 4
            or center in support
            or any(
                type(point) is not int or not 0 <= point < SOURCE_CELL.n
                for point in support
            )
            or row["exact"] is not False
        ):
            raise RealizationError(f"leaf metric row {index} is malformed")
    system = {
        "schema": SCREEN_INPUT_SCHEMA,
        "leaf_id": leaf["leaf_id"],
        "n": SOURCE_CELL.n,
        "order": list(order),
        "rows": rows,
    }
    counts = _screen_constraint_counts(system)
    if counts != {
        "coordinate_variables": 16,
        "equalities": 30,
        "distinctness": 45,
        "convexity": 80,
        "exact_exclusions": 0,
        "total": 155,
    }:
        raise RealizationError(f"unexpected screen constraint counts: {counts}")
    return system


def _screen_constraint_counts(system: Mapping[str, Any]) -> dict[str, int]:
    n = int(system["n"])
    rows = system["rows"]
    equalities = sum(len(row["support"]) - 1 for row in rows)
    exact_exclusions = sum(n - 1 - len(row["support"]) for row in rows if row["exact"])
    distinctness = n * (n - 1) // 2
    convexity = n * (n - 2)
    return {
        "coordinate_variables": 2 * (n - 2),
        "equalities": equalities,
        "distinctness": distinctness,
        "convexity": convexity,
        "exact_exclusions": exact_exclusions,
        "total": equalities + exact_exclusions + distinctness + convexity,
    }


def _validate_generic_screen_system(system: Mapping[str, Any]) -> None:
    _require_exact_keys(
        system,
        frozenset({"schema", "leaf_id", "n", "order", "rows"}),
        where="screen input",
    )
    if system["schema"] != SCREEN_INPUT_SCHEMA:
        raise RealizationError("wrong screen-input schema")
    n = system["n"]
    order = system["order"]
    rows = system["rows"]
    if type(n) is not int or n < 2:
        raise RealizationError("screen input has invalid point count")
    if not isinstance(order, list) or sorted(order) != list(range(n)):
        raise RealizationError("screen input order is not a label permutation")
    if not isinstance(rows, list):
        raise RealizationError("screen input rows must be a list")
    for index, row in enumerate(rows):
        if not isinstance(row, dict):
            raise RealizationError(f"screen row {index} is not an object")
        _require_exact_keys(row, _METRIC_ROW_KEYS, where=f"screen row {index}")
        center = row["center"]
        support = row["support"]
        if (
            type(center) is not int
            or not 0 <= center < n
            or not isinstance(support, list)
            or not support
            or len(set(support)) != len(support)
            or center in support
            or any(type(point) is not int or not 0 <= point < n for point in support)
            or type(row["exact"]) is not bool
        ):
            raise RealizationError(f"screen row {index} is malformed")


def _encode_z3_value(z3: Any, value: Any) -> dict[str, Any]:
    simplified = z3.simplify(value)
    if z3.is_rational_value(simplified):
        return {
            "kind": "rational",
            "numerator": simplified.numerator_as_long(),
            "denominator": simplified.denominator_as_long(),
        }
    if z3.is_algebraic_value(simplified):
        approximation = simplified.approx(50)
        return {
            "kind": "algebraic",
            "sexpr": simplified.sexpr(),
            "approximation": {
                "numerator": approximation.numerator_as_long(),
                "denominator": approximation.denominator_as_long(),
            },
        }
    return {"kind": "other", "sexpr": simplified.sexpr()}


def _z3_screen_worker(system: Mapping[str, Any], timeout_s: int) -> dict[str, Any]:
    """Run one full Phase-3 formula.  This function is child-process only."""

    _validate_generic_screen_system(system)
    import z3

    z3.set_param("parallel.enable", False)
    z3.set_param("smt.threads", 1)
    n = system["n"]
    order = system["order"]
    points: dict[int, tuple[Any, Any]] = {
        0: (z3.RealVal(0), z3.RealVal(0)),
        1: (z3.RealVal(1), z3.RealVal(0)),
    }
    for point in range(2, n):
        points[point] = z3.Reals(f"x_{point} y_{point}")

    def d2(left: int, right: int) -> Any:
        lx, ly = points[left]
        rx, ry = points[right]
        return (lx - rx) ** 2 + (ly - ry) ** 2

    def cross(left: int, right: int, point: int) -> Any:
        lx, ly = points[left]
        rx, ry = points[right]
        px, py = points[point]
        return (rx - lx) * (py - ly) - (ry - ly) * (px - lx)

    constraints: list[Any] = []
    for row in system["rows"]:
        center = row["center"]
        support = row["support"]
        reference = support[0]
        radius2 = d2(center, reference)
        constraints.extend(d2(center, point) == radius2 for point in support[1:])
        if row["exact"]:
            support_set = frozenset(support)
            constraints.extend(
                (d2(center, point) - radius2) ** 2 > 0
                for point in range(n)
                if point != center and point not in support_set
            )
    constraints.extend(
        d2(left, right) > 0 for left in range(n) for right in range(left + 1, n)
    )
    for index, left in enumerate(order):
        right = order[(index + 1) % n]
        constraints.extend(
            cross(left, right, point) > 0
            for point in order
            if point != left and point != right
        )

    solver = z3.Tactic("qfnra-nlsat").solver()
    solver.set("timeout", timeout_s * 1000)
    solver.add(*constraints)
    verdict = solver.check()
    if verdict == z3.unsat:
        return {"solver_status": "UNSAT"}
    if verdict != z3.sat:
        return {"solver_status": "UNKNOWN", "reason": solver.reason_unknown()}

    model = solver.model()
    coordinates = {}
    for point in range(n):
        coordinates[str(point)] = {
            axis: _encode_z3_value(z3, model.eval(expression, model_completion=True))
            for axis, expression in zip(("x", "y"), points[point], strict=True)
        }
    return {"solver_status": "SAT", "coordinates": coordinates}


def _z3_worker_stdio() -> int:
    """Private subprocess entrypoint."""

    try:
        request = _strict_json(sys.stdin.read(), source="z3 worker stdin")
        _require_exact_keys(
            request, frozenset({"system", "timeout_s"}), where="z3 worker request"
        )
        result = _z3_screen_worker(request["system"], request["timeout_s"])
    except Exception as exc:  # noqa: BLE001 - child must turn every failure into CRASH
        print(f"z3 screen worker failed: {type(exc).__name__}: {exc}", file=sys.stderr)
        return 2
    sys.stdout.write(json.dumps(result, sort_keys=True, separators=(",", ":")) + "\n")
    return 0


def _run_solver_subprocess(
    command: Sequence[str],
    request: Mapping[str, Any],
    *,
    timeout_s: float,
) -> dict[str, Any]:
    """Run and hard-limit one solver child; never raise for solver failure."""

    environment = os.environ.copy()
    environment.update(
        {
            "OMP_NUM_THREADS": "1",
            "OPENBLAS_NUM_THREADS": "1",
            "MKL_NUM_THREADS": "1",
            "PYTHONPATH": os.pathsep.join(
                filter(
                    None,
                    (str(HERE.parents[1]), environment.get("PYTHONPATH", "")),
                )
            ),
        }
    )
    try:
        completed = subprocess.run(
            list(command),
            input=_canonical_json_bytes(request),
            capture_output=True,
            timeout=timeout_s,
            check=False,
            env=environment,
        )
    except subprocess.TimeoutExpired:
        return {"solver_status": "TIMEOUT"}
    except OSError:
        return {"solver_status": "CRASH"}
    if completed.returncode != 0:
        return {"solver_status": "CRASH"}
    try:
        response = _strict_json(
            completed.stdout.decode("utf-8"), source="z3 worker stdout"
        )
    except (UnicodeDecodeError, RealizationError):
        return {"solver_status": "CRASH"}
    if not isinstance(response, dict) or response.get("solver_status") not in {
        "SAT",
        "UNSAT",
        "UNKNOWN",
    }:
        return {"solver_status": "CRASH"}
    return response


def _run_z3_subprocess(system: Mapping[str, Any], timeout_s: int) -> dict[str, Any]:
    command = (
        sys.executable,
        "-c",
        (
            "from census.p97_search.realize import _z3_worker_stdio; "
            "raise SystemExit(_z3_worker_stdio())"
        ),
    )
    return _run_solver_subprocess(
        command,
        {"system": system, "timeout_s": timeout_s},
        timeout_s=float(timeout_s),
    )


def _decode_rational(value: Any, *, where: str) -> Fraction:
    if not isinstance(value, dict):
        raise RealizationError(f"{where} is not a tagged rational")
    _require_exact_keys(
        value,
        frozenset({"kind", "numerator", "denominator"}),
        where=where,
    )
    numerator = value["numerator"]
    denominator = value["denominator"]
    if (
        value["kind"] != "rational"
        or type(numerator) is not int
        or type(denominator) is not int
        or denominator <= 0
    ):
        raise RealizationError(f"{where} is not a canonical tagged rational")
    fraction = Fraction(numerator, denominator)
    if fraction.numerator != numerator or fraction.denominator != denominator:
        raise RealizationError(f"{where} rational is not reduced")
    return fraction


def replay_rational_coordinates(
    system: Mapping[str, Any], coordinates: Mapping[str, Any]
) -> dict[str, Any]:
    """Independently replay a rational witness using only ``Fraction``."""

    _validate_generic_screen_system(system)
    n = system["n"]
    if not isinstance(coordinates, dict) or set(coordinates) != {
        str(point) for point in range(n)
    }:
        raise RealizationError("rational witness has wrong point labels")
    points: dict[int, tuple[Fraction, Fraction]] = {}
    normalized: dict[str, dict[str, dict[str, Any]]] = {}
    for point in range(n):
        encoded = coordinates[str(point)]
        if not isinstance(encoded, dict):
            raise RealizationError(f"coordinate {point} is not an object")
        _require_exact_keys(encoded, frozenset({"x", "y"}), where=f"coordinate {point}")
        x = _decode_rational(encoded["x"], where=f"coordinate {point}.x")
        y = _decode_rational(encoded["y"], where=f"coordinate {point}.y")
        points[point] = (x, y)
        normalized[str(point)] = {
            "x": {
                "kind": "rational",
                "numerator": x.numerator,
                "denominator": x.denominator,
            },
            "y": {
                "kind": "rational",
                "numerator": y.numerator,
                "denominator": y.denominator,
            },
        }
    if points[0] != (Fraction(0), Fraction(0)) or points[1] != (
        Fraction(1),
        Fraction(0),
    ):
        raise RealizationError("rational witness violates the coordinate gauge")

    def d2(left: int, right: int) -> Fraction:
        lx, ly = points[left]
        rx, ry = points[right]
        return (lx - rx) ** 2 + (ly - ry) ** 2

    def cross(left: int, right: int, point: int) -> Fraction:
        lx, ly = points[left]
        rx, ry = points[right]
        px, py = points[point]
        return (rx - lx) * (py - ly) - (ry - ly) * (px - lx)

    for row_index, row in enumerate(system["rows"]):
        center = row["center"]
        support = row["support"]
        radius2 = d2(center, support[0])
        if any(d2(center, point) != radius2 for point in support[1:]):
            raise RealizationError(f"rational witness violates metric row {row_index}")
        if row["exact"]:
            support_set = frozenset(support)
            if any(
                d2(center, point) == radius2
                for point in range(n)
                if point != center and point not in support_set
            ):
                raise RealizationError(
                    f"rational witness violates exact row {row_index}"
                )
    if any(d2(left, right) <= 0 for left in range(n) for right in range(left + 1, n)):
        raise RealizationError("rational witness has coincident points")
    order = system["order"]
    for index, left in enumerate(order):
        right = order[(index + 1) % n]
        if any(
            cross(left, right, point) <= 0
            for point in order
            if point != left and point != right
        ):
            raise RealizationError("rational witness violates strict convexity")
    return normalized


def _shard_name(shard: int, workers: int) -> str:
    return f"shard-{shard:03d}-of-{workers:03d}.jsonl"


def _validate_leaf(record: Mapping[str, Any], *, where: str) -> None:
    _require_exact_keys(record, _LEAF_KEYS, where=where)
    if record.get("schema") != LEAF_SCHEMA:
        raise RealizationError(f"{where} has wrong leaf schema")
    if record.get("status") != "UNRESOLVED":
        raise RealizationError(
            f"{where} attempts unsupported status promotion {record.get('status')!r}"
        )
    if record.get("reason") != "PREPARE_ONLY_NO_EXACT_CERTIFICATE":
        raise RealizationError(f"{where} has invalid unresolved reason")
    if record.get("evidence") is not None:
        raise RealizationError(f"{where} attaches evidence in prepare-only mode")
    rows = record.get("metric_rows")
    if not isinstance(rows, list) or len(rows) != SOURCE_CELL.n:
        raise RealizationError(f"{where} has invalid metric rows")
    if any(not isinstance(row, dict) or row.get("exact") is not False for row in rows):
        raise RealizationError(f"{where} asserts an exact metric row")


def _existing_prefix(path: Path, expected: Sequence[Mapping[str, Any]]) -> int:
    if not path.exists():
        return 0
    records = _read_jsonl(path)
    if len(records) > len(expected):
        raise RealizationError(f"{path.name} contains too many records")
    for index, record in enumerate(records):
        _validate_leaf(record, where=f"{path.name}:{index + 1}")
        if record != expected[index]:
            raise RealizationError(f"resume/tamper mismatch at {path.name}:{index + 1}")
    return len(records)


def _screen_shard_name(shard: int, workers: int) -> str:
    return f"screen-shard-{shard:03d}-of-{workers:03d}.jsonl"


def _screen_classification(
    system: Mapping[str, Any], answer: Mapping[str, Any]
) -> tuple[str, str, dict[str, Any] | None]:
    solver_status = answer.get("solver_status")
    if solver_status == "UNSAT":
        return "UNRESOLVED", "Z3_UNSAT_UNCERTIFIED", None
    if solver_status == "UNKNOWN":
        return "UNRESOLVED", "Z3_UNKNOWN", None
    if solver_status == "TIMEOUT":
        return "UNRESOLVED", "TIMEOUT", None
    if solver_status == "CRASH":
        return "UNRESOLVED", "Z3_CRASH", None
    if solver_status != "SAT":
        return "UNRESOLVED", "Z3_CRASH", None

    coordinates = answer.get("coordinates")
    if not isinstance(coordinates, dict):
        return "UNRESOLVED", "Z3_SAT_NUMERIC", None
    kinds = {
        axis.get("kind")
        for point in coordinates.values()
        if isinstance(point, dict)
        for axis in point.values()
        if isinstance(axis, dict)
    }
    if "algebraic" in kinds:
        return "UNRESOLVED", "Z3_SAT_ALGEBRAIC", None
    if kinds != {"rational"}:
        return "UNRESOLVED", "Z3_SAT_NUMERIC", None
    try:
        normalized = replay_rational_coordinates(system, coordinates)
    except RealizationError:
        return "UNRESOLVED", "Z3_SAT_RATIONAL_REPLAY_FAILED", None
    return (
        "EXACT_REALIZED",
        "Z3_SAT_RATIONAL_REPLAYED",
        {
            "kind": "independent-fraction-replay",
            "coordinates": normalized,
            "constraint_counts": _screen_constraint_counts(system),
        },
    )


def _make_screen_record(
    leaf: Mapping[str, Any],
    *,
    source_manifest_sha256: str,
    answer: Mapping[str, Any],
) -> dict[str, Any]:
    system = _screen_input(leaf)
    status, diagnostic, evidence = _screen_classification(system, answer)
    solver_status = answer.get("solver_status")
    if solver_status not in {"SAT", "UNSAT", "UNKNOWN", "TIMEOUT", "CRASH"}:
        solver_status = "CRASH"
    record = {
        "schema": SCREEN_RECORD_SCHEMA,
        "leaf_index": leaf["leaf_index"],
        "leaf_id": leaf["leaf_id"],
        "prepared_leaf_sha256": _sha256_bytes(_jsonl_line(leaf)),
        "screen_input_sha256": _sha256_bytes(_canonical_json_bytes(system)),
        "source_manifest_sha256": source_manifest_sha256,
        "solver": "z3",
        "solver_status": solver_status,
        "status": status,
        "diagnostic": diagnostic,
        "evidence": evidence,
    }
    record["record_sha256"] = _sha256_bytes(_canonical_json_bytes(record))
    return record


def _validate_screen_record(
    record: Mapping[str, Any],
    *,
    leaf: Mapping[str, Any],
    source_manifest_sha256: str,
    where: str,
) -> None:
    _require_exact_keys(record, _SCREEN_RECORD_KEYS, where=where)
    if record["schema"] != SCREEN_RECORD_SCHEMA:
        raise RealizationError(f"{where} has wrong screen-record schema")
    unsigned = dict(record)
    claimed_hash = unsigned.pop("record_sha256")
    if not _is_sha256(claimed_hash) or claimed_hash != _sha256_bytes(
        _canonical_json_bytes(unsigned)
    ):
        raise RealizationError(f"{where} has invalid record hash")
    system = _screen_input(leaf)
    exact_identity = {
        "leaf_index": leaf["leaf_index"],
        "leaf_id": leaf["leaf_id"],
        "prepared_leaf_sha256": _sha256_bytes(_jsonl_line(leaf)),
        "screen_input_sha256": _sha256_bytes(_canonical_json_bytes(system)),
        "source_manifest_sha256": source_manifest_sha256,
        "solver": "z3",
    }
    for key, expected in exact_identity.items():
        if record[key] != expected:
            raise RealizationError(f"{where} has mismatched {key}")

    solver_status = record["solver_status"]
    status = record["status"]
    diagnostic = record["diagnostic"]
    evidence = record["evidence"]
    unresolved_diagnostics = {
        "UNSAT": {"Z3_UNSAT_UNCERTIFIED"},
        "UNKNOWN": {"Z3_UNKNOWN"},
        "TIMEOUT": {"TIMEOUT"},
        "CRASH": {"Z3_CRASH"},
        "SAT": {
            "Z3_SAT_ALGEBRAIC",
            "Z3_SAT_NUMERIC",
            "Z3_SAT_RATIONAL_REPLAY_FAILED",
        },
    }
    if status == "UNRESOLVED":
        if (
            solver_status not in unresolved_diagnostics
            or diagnostic not in unresolved_diagnostics[solver_status]
            or evidence is not None
        ):
            raise RealizationError(f"{where} has invalid unresolved classification")
        return
    if (
        status != "EXACT_REALIZED"
        or solver_status != "SAT"
        or diagnostic != "Z3_SAT_RATIONAL_REPLAYED"
        or not isinstance(evidence, dict)
    ):
        raise RealizationError(f"{where} has unsupported status promotion")
    _require_exact_keys(
        evidence,
        frozenset({"kind", "coordinates", "constraint_counts"}),
        where=f"{where} evidence",
    )
    if (
        evidence["kind"] != "independent-fraction-replay"
        or evidence["constraint_counts"] != _screen_constraint_counts(system)
        or replay_rational_coordinates(system, evidence["coordinates"])
        != evidence["coordinates"]
    ):
        raise RealizationError(f"{where} has invalid exact replay evidence")


def _existing_screen_prefix(
    path: Path,
    expected_leaves: Sequence[Mapping[str, Any]],
    *,
    source_manifest_sha256: str,
) -> int:
    if not path.exists():
        return 0
    records = _read_jsonl(path)
    if len(records) > len(expected_leaves):
        raise RealizationError(f"{path.name} contains too many screen records")
    for index, (record, leaf) in enumerate(
        zip(records, expected_leaves[: len(records)], strict=True)
    ):
        _validate_screen_record(
            record,
            leaf=leaf,
            source_manifest_sha256=source_manifest_sha256,
            where=f"{path.name}:{index + 1}",
        )
    return len(records)


def _append_records(path: Path, records: Sequence[Mapping[str, Any]]) -> None:
    if not records:
        return
    descriptor = os.open(path, os.O_WRONLY | os.O_CREAT | os.O_APPEND, 0o600)
    try:
        for record in records:
            data = _jsonl_line(record)
            written = os.write(descriptor, data)
            if written != len(data):
                raise RealizationError(f"short append to {path.name}")
        os.fsync(descriptor)
    finally:
        os.close(descriptor)


def _summary(out_dir: Path, *, workers: int) -> dict[str, Any]:
    shards = {}
    status_counts = {"UNRESOLVED": 0}
    for shard in range(workers):
        path = out_dir / _shard_name(shard, workers)
        records = _read_jsonl(path)
        for index, record in enumerate(records):
            _validate_leaf(record, where=f"{path.name}:{index + 1}")
        status_counts["UNRESOLVED"] += len(records)
        shards[path.name] = {
            "count": len(records),
            "sha256": _sha256_file(path),
        }
    if status_counts["UNRESOLVED"] != LEAF_COUNT:
        raise RealizationError("prepared shard census does not contain 2400 leaves")
    return {
        "schema": OUTPUT_SCHEMA,
        "leaf_count": LEAF_COUNT,
        "status_counts": status_counts,
        "shards": shards,
    }


def write_preparation(
    source: VerifiedSource,
    out_dir: str | Path,
    *,
    workers: int,
    solver_threads: int,
    singular_timeout: int,
    z3_timeout: int,
    cvc5_timeout: int,
    resume: bool,
) -> dict[str, Any]:
    """Write or resume append-only per-shard preparation streams."""

    _validate_resources(
        workers=workers,
        solver_threads=solver_threads,
        singular_timeout=singular_timeout,
        z3_timeout=z3_timeout,
        cvc5_timeout=cvc5_timeout,
    )
    out = Path(out_dir)
    if out.resolve() == source.run_dir:
        raise RealizationError("output directory must not be the source run")
    expected_manifest = _output_manifest(
        source,
        workers=workers,
        solver_threads=solver_threads,
        singular_timeout=singular_timeout,
        z3_timeout=z3_timeout,
        cvc5_timeout=cvc5_timeout,
    )
    allowed = {
        "manifest.json",
        "summary.json",
        "screen-manifest.json",
        "screen-summary.json",
        *(_shard_name(shard, workers) for shard in range(workers)),
        *(_screen_shard_name(shard, workers) for shard in range(workers)),
    }
    if out.exists():
        unexpected = sorted(
            path.name for path in out.iterdir() if path.name not in allowed
        )
        if unexpected:
            raise RealizationError(f"unexpected output artifacts: {unexpected}")
        if not resume and any(out.iterdir()):
            raise RealizationError("output is nonempty; pass --resume to validate it")
    out.mkdir(parents=True, exist_ok=True)

    manifest_path = out / "manifest.json"
    if manifest_path.exists():
        if not resume:
            raise RealizationError("output manifest already exists")
        if _read_json(manifest_path) != expected_manifest:
            raise RealizationError("resume manifest/configuration mismatch")
    else:
        if resume and any(path.name != "manifest.json" for path in out.iterdir()):
            raise RealizationError("resume output has shard data but no manifest")
        _atomic_json(manifest_path, expected_manifest)

    leaves = build_leaves(source, workers=workers)
    by_shard: list[list[dict[str, Any]]] = [[] for _ in range(workers)]
    for leaf in leaves:
        _validate_leaf(leaf, where=f"generated leaf {leaf['leaf_index']}")
        by_shard[leaf["shard"]].append(leaf)

    for shard, expected in enumerate(by_shard):
        path = out / _shard_name(shard, workers)
        prefix = _existing_prefix(path, expected)
        _append_records(path, expected[prefix:])

    summary = _summary(out, workers=workers)
    summary_path = out / "summary.json"
    if summary_path.exists():
        if _read_json(summary_path) != summary:
            raise RealizationError("existing summary does not match append-only shards")
    else:
        _atomic_json(summary_path, summary)
    return summary


def _screen_manifest(
    source: VerifiedSource,
    out_dir: Path,
    *,
    workers: int,
    z3_timeout: int,
) -> dict[str, Any]:
    return {
        "schema": SCREEN_MANIFEST_SCHEMA,
        "solver": "z3",
        "source_manifest_sha256": source.manifest_sha256,
        "preparation_manifest_sha256": _sha256_file(out_dir / "manifest.json"),
        "preparation_summary_sha256": _sha256_file(out_dir / "summary.json"),
        "configuration": {
            "workers": workers,
            "solver_threads": 1,
            "z3_timeout": z3_timeout,
            "hard_wall_timeout_per_leaf": True,
            "formula": {
                "coordinate_variables": 16,
                "equalities": 30,
                "distinctness": 45,
                "convexity": 80,
                "exact_exclusions": 0,
            },
        },
        "leaf_count": LEAF_COUNT,
        "status_policy": {
            "z3_unsat": "UNRESOLVED",
            "z3_unknown_timeout_crash": "UNRESOLVED",
            "z3_algebraic_or_numeric_sat": "UNRESOLVED",
            "exact_realized_requires": "independent Fraction replay",
            "proved_infeasible_requires": "external replayable exact certificate",
        },
    }


def _screen_one_shard(
    path: Path,
    leaves: Sequence[Mapping[str, Any]],
    *,
    source_manifest_sha256: str,
    z3_timeout: int,
    runner: Callable[[Mapping[str, Any], int], Mapping[str, Any]],
) -> None:
    prefix = _existing_screen_prefix(
        path, leaves, source_manifest_sha256=source_manifest_sha256
    )
    for leaf in leaves[prefix:]:
        system = _screen_input(leaf)
        try:
            answer = runner(system, z3_timeout)
        except Exception:  # noqa: BLE001 - a runner failure is diagnostic CRASH
            answer = {"solver_status": "CRASH"}
        if not isinstance(answer, Mapping):
            answer = {"solver_status": "CRASH"}
        record = _make_screen_record(
            leaf,
            source_manifest_sha256=source_manifest_sha256,
            answer=answer,
        )
        _validate_screen_record(
            record,
            leaf=leaf,
            source_manifest_sha256=source_manifest_sha256,
            where=f"generated screen record {leaf['leaf_index']}",
        )
        # Fsync every result so a hard interruption loses at most the active leaf.
        _append_records(path, [record])


def _screen_summary(
    out_dir: Path,
    *,
    leaves_by_shard: Sequence[Sequence[Mapping[str, Any]]],
    source_manifest_sha256: str,
    workers: int,
) -> dict[str, Any]:
    status_counts: dict[str, int] = {}
    diagnostic_counts: dict[str, int] = {}
    shards = {}
    total = 0
    for shard in range(workers):
        path = out_dir / _screen_shard_name(shard, workers)
        records = _read_jsonl(path)
        expected = leaves_by_shard[shard]
        if len(records) != len(expected):
            raise RealizationError(f"{path.name} is not a complete screen shard")
        for index, (record, leaf) in enumerate(zip(records, expected, strict=True)):
            _validate_screen_record(
                record,
                leaf=leaf,
                source_manifest_sha256=source_manifest_sha256,
                where=f"{path.name}:{index + 1}",
            )
            status = record["status"]
            diagnostic = record["diagnostic"]
            status_counts[status] = status_counts.get(status, 0) + 1
            diagnostic_counts[diagnostic] = diagnostic_counts.get(diagnostic, 0) + 1
        total += len(records)
        shards[path.name] = {
            "count": len(records),
            "sha256": _sha256_file(path),
        }
    if total != LEAF_COUNT:
        raise RealizationError("screen shards do not contain exactly 2400 records")
    return {
        "schema": SCREEN_SUMMARY_SCHEMA,
        "solver": "z3",
        "leaf_count": total,
        "status_counts": dict(sorted(status_counts.items())),
        "diagnostic_counts": dict(sorted(diagnostic_counts.items())),
        "shards": shards,
    }


def write_screening(
    source: VerifiedSource,
    out_dir: str | Path,
    *,
    workers: int,
    z3_timeout: int,
    resume: bool,
    runner: Callable[[Mapping[str, Any], int], Mapping[str, Any]] = _run_z3_subprocess,
) -> dict[str, Any]:
    """Write or resume append-only, independently linked Z3 diagnostics."""

    _validate_resources(
        workers=workers,
        solver_threads=1,
        singular_timeout=1,
        z3_timeout=z3_timeout,
        cvc5_timeout=1,
    )
    out = Path(out_dir)
    expected_manifest = _screen_manifest(
        source, out, workers=workers, z3_timeout=z3_timeout
    )
    manifest_path = out / "screen-manifest.json"
    result_paths = [
        out / _screen_shard_name(shard, workers) for shard in range(workers)
    ]
    if manifest_path.exists():
        if not resume:
            raise RealizationError("screen manifest already exists")
        if _read_json(manifest_path) != expected_manifest:
            raise RealizationError("screen resume manifest/configuration mismatch")
    else:
        if any(path.exists() for path in result_paths):
            raise RealizationError("screen results exist without a screen manifest")
        _atomic_json(manifest_path, expected_manifest)

    leaves = build_leaves(source, workers=workers)
    leaves_by_shard: list[list[dict[str, Any]]] = [[] for _ in range(workers)]
    for leaf in leaves:
        leaves_by_shard[leaf["shard"]].append(leaf)

    with concurrent.futures.ThreadPoolExecutor(max_workers=workers) as executor:
        futures = [
            executor.submit(
                _screen_one_shard,
                result_paths[shard],
                leaves_by_shard[shard],
                source_manifest_sha256=source.manifest_sha256,
                z3_timeout=z3_timeout,
                runner=runner,
            )
            for shard in range(workers)
        ]
        for future in futures:
            future.result()

    summary = _screen_summary(
        out,
        leaves_by_shard=leaves_by_shard,
        source_manifest_sha256=source.manifest_sha256,
        workers=workers,
    )
    summary_path = out / "screen-summary.json"
    if summary_path.exists():
        if _read_json(summary_path) != summary:
            raise RealizationError(
                "existing screen summary does not match append-only results"
            )
    else:
        _atomic_json(summary_path, summary)
    return summary


def run_driver(
    run_dir: str | Path,
    out_dir: str | Path,
    *,
    orders: str = "all-24",
    workers: int = 24,
    solver_threads: int = 1,
    singular_timeout: int = 300,
    z3_timeout: int = 120,
    cvc5_timeout: int = 120,
    resume: bool = False,
    prepare_only: bool = False,
    run_screen: bool = False,
    solver: str = "z3",
) -> dict[str, Any]:
    if orders != "all-24":
        raise RealizationError("only --orders all-24 is auditable")
    if prepare_only == run_screen:
        raise RealizationError("choose exactly one of --prepare-only and --run-screen")
    if solver != "z3":
        raise RealizationError("only --solver z3 is currently supported")
    source = load_verified_source(run_dir)
    preparation_summary = write_preparation(
        source,
        out_dir,
        workers=workers,
        solver_threads=solver_threads,
        singular_timeout=singular_timeout,
        z3_timeout=z3_timeout,
        cvc5_timeout=cvc5_timeout,
        resume=resume,
    )
    if run_screen:
        summary = write_screening(
            source,
            out_dir,
            workers=workers,
            z3_timeout=z3_timeout,
            resume=resume,
        )
    else:
        summary = preparation_summary
    # Detect source drift across the write window before reporting success.
    replayed = load_verified_source(run_dir)
    if replayed.manifest_sha256 != source.manifest_sha256 or tuple(
        model.canonical_digest for model in replayed.models
    ) != tuple(model.canonical_digest for model in source.models):
        raise RealizationError("source artifacts changed during preparation")
    return summary


def _parse_args(argv: Sequence[str] | None = None) -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--run", type=Path, required=True)
    parser.add_argument("--out", type=Path, required=True)
    parser.add_argument("--orders", choices=("all-24",), default="all-24")
    parser.add_argument("--workers", type=int, default=24)
    parser.add_argument("--solver-threads", type=int, default=1)
    parser.add_argument("--singular-timeout", type=int, default=300)
    parser.add_argument("--z3-timeout", type=int, default=120)
    parser.add_argument("--cvc5-timeout", type=int, default=120)
    parser.add_argument("--resume", action="store_true")
    parser.add_argument("--prepare-only", action="store_true")
    parser.add_argument("--run-screen", action="store_true")
    parser.add_argument("--solver", choices=("z3",), default="z3")
    return parser.parse_args(argv)


def main(argv: Sequence[str] | None = None) -> int:
    args = _parse_args(argv)
    try:
        summary = run_driver(
            args.run,
            args.out,
            orders=args.orders,
            workers=args.workers,
            solver_threads=args.solver_threads,
            singular_timeout=args.singular_timeout,
            z3_timeout=args.z3_timeout,
            cvc5_timeout=args.cvc5_timeout,
            resume=args.resume,
            prepare_only=args.prepare_only,
            run_screen=args.run_screen,
            solver=args.solver,
        )
    except RealizationError as exc:
        print(f"realize: FAIL-CLOSED: {exc}", file=sys.stderr)
        return 2
    print(json.dumps(summary, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
