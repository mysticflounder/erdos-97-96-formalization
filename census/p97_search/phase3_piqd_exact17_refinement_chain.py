"""Validate and reconstruct the frozen exact-17 PIQD refinement chain.

The manifest handled here is a finite custody artifact.  Validation does not
claim source entitlement, case coverage, a universal lift, theorem closure, or
Lean checking.  It proves only that the named root and ordered raw clause
fragments reconstruct the byte-pinned aggregate DIMACS formula.
"""

from __future__ import annotations

import hashlib
import json
import os
import re
import stat
from collections.abc import Iterator, Mapping
from dataclasses import dataclass
from pathlib import Path
from typing import Any, BinaryIO

SCHEMA = "p97-exact17-cap9-root-refinement-lane/v1"
VARIABLE_MAP_SCHEMA = "p97-exact17-cap9-variable-map/v1"
AGGREGATE_ALGORITHM = "root-body-plus-ordered-raw-fragments/v1"
MAX_AGGREGATE_BYTES = 256 * 1024 * 1024
TOP_LEVEL_KEYS = frozenset(
    {
        "schema",
        "lane",
        "producer",
        "root",
        "variable_map",
        "refinements",
        "aggregate",
        "replay",
        "resource",
        "claims",
    }
)
REQUIRED_FALSE_CLAIMS = frozenset(
    {
        "source_entitlement",
        "aggregate_case_coverage",
        "universal_lift",
        "theorem_closure",
        "lean_checked",
        "daemon_signed_attestation",
    }
)
SHA256_RE = re.compile(r"[0-9a-f]{64}\Z")


class Exact17RefinementChainError(RuntimeError):
    """A frozen-chain custody or reconstruction check failed."""


@dataclass(frozen=True)
class FileRef:
    path: Path
    label: str
    byte_count: int
    sha256: str


@dataclass(frozen=True)
class Refinement:
    ordinal: int
    kind: str
    receipt: FileRef
    receipt_schema: str
    fragment: FileRef
    clause_count: int
    parent_formula_sha256: str
    parent_clause_count: int
    result_formula_sha256: str
    result_clause_count: int


@dataclass(frozen=True)
class FrozenRefinementChain:
    manifest_path: Path
    manifest_sha256: str
    root: FileRef
    root_num_vars: int
    root_num_clauses: int
    variable_map: FileRef
    refinements: tuple[Refinement, ...]
    aggregate_sha256: str
    aggregate_byte_count: int
    aggregate_num_clauses: int


def canonical_json_bytes(value: object) -> bytes:
    """Encode one JSON value canonically, without a trailing newline."""

    return json.dumps(
        value, ensure_ascii=False, allow_nan=False, sort_keys=True, separators=(",", ":")
    ).encode()


def _reject_duplicate_keys(pairs: list[tuple[str, Any]]) -> dict[str, Any]:
    result: dict[str, Any] = {}
    for key, value in pairs:
        if key in result:
            raise Exact17RefinementChainError(f"duplicate JSON key: {key}")
        result[key] = value
    return result


def load_strict_json(raw: bytes, *, label: str) -> Any:
    try:
        return json.loads(raw, object_pairs_hook=_reject_duplicate_keys)
    except (json.JSONDecodeError, UnicodeDecodeError) as exc:
        raise Exact17RefinementChainError(f"invalid JSON in {label}") from exc


def sha256_bytes(raw: bytes) -> str:
    return hashlib.sha256(raw).hexdigest()


def sha256_file(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        for block in iter(lambda: stream.read(1024 * 1024), b""):
            digest.update(block)
    return digest.hexdigest()


def _require(condition: bool, message: str) -> None:
    if not condition:
        raise Exact17RefinementChainError(message)


def _require_mapping(value: Any, label: str) -> Mapping[str, Any]:
    _require(type(value) is dict, f"{label} must be an object")
    return value


def _require_int(value: Any, label: str, *, minimum: int = 0) -> int:
    _require(type(value) is int and value >= minimum, f"invalid {label}")
    return value


def _require_sha(value: Any, label: str) -> str:
    _require(type(value) is str and SHA256_RE.fullmatch(value) is not None, f"invalid {label}")
    return value


def _safe_repo_path(repo: Path, label: Any) -> Path:
    _require(type(label) is str and bool(label), "empty repository-relative path")
    relative = Path(label)
    _require(not relative.is_absolute(), f"absolute path is forbidden: {label}")
    _require(all(part not in {"", ".", ".."} for part in relative.parts), f"unsafe path: {label}")
    root = repo.resolve()
    path = (root / relative).resolve()
    _require(path.is_relative_to(root), f"path escapes repository: {label}")
    info = os.lstat(path)
    _require(stat.S_ISREG(info.st_mode), f"not a regular file: {label}")
    _require(not path.is_symlink(), f"symlink is forbidden: {label}")
    return path


def _file_ref(repo: Path, raw: Any, label: str) -> FileRef:
    value = _require_mapping(raw, label)
    _require(set(value) == {"path", "byte_count", "sha256"}, f"unexpected {label} fields")
    path_label = value["path"]
    path = _safe_repo_path(repo, path_label)
    expected_bytes = _require_int(value["byte_count"], f"{label} byte count")
    expected_sha = _require_sha(value["sha256"], f"{label} SHA-256")
    _require(path.stat().st_size == expected_bytes, f"{label} byte count mismatch")
    _require(sha256_file(path) == expected_sha, f"{label} SHA-256 mismatch")
    return FileRef(path, path_label, expected_bytes, expected_sha)


def _parse_dimacs_header(line: bytes) -> tuple[int, int]:
    fields = line.strip().split()
    _require(len(fields) == 4 and fields[:2] == [b"p", b"cnf"], "invalid root DIMACS header")
    try:
        num_vars, num_clauses = int(fields[2]), int(fields[3])
    except ValueError as exc:
        raise Exact17RefinementChainError("non-integer root DIMACS dimensions") from exc
    _require(num_vars > 0 and num_clauses > 0, "nonpositive root DIMACS dimensions")
    return num_vars, num_clauses


def _root_header(root: Path) -> tuple[bytes, int, int]:
    with root.open("rb") as stream:
        header = stream.readline()
    num_vars, num_clauses = _parse_dimacs_header(header)
    return header, num_vars, num_clauses


def _iter_clause_lines(path: Path, *, max_var: int, expected_count: int) -> Iterator[bytes]:
    count = 0
    with path.open("rb") as stream:
        for line_number, line in enumerate(stream, start=1):
            stripped = line.strip()
            _require(bool(stripped), f"blank line in fragment {path}:{line_number}")
            _require(not stripped.startswith((b"p", b"c")), f"header/comment in fragment {path}:{line_number}")
            fields = stripped.split()
            try:
                literals = [int(field) for field in fields]
            except ValueError as exc:
                raise Exact17RefinementChainError(
                    f"non-integer literal in fragment {path}:{line_number}"
                ) from exc
            _require(literals and literals[-1] == 0, f"unterminated fragment clause {path}:{line_number}")
            _require(0 not in literals[:-1], f"embedded zero in fragment clause {path}:{line_number}")
            _require(all(abs(literal) <= max_var for literal in literals[:-1]), f"fragment variable exceeds root domain at {path}:{line_number}")
            count += 1
            yield line
    _require(count == expected_count, f"fragment clause count mismatch for {path}")


def _copy_root_body(root: Path, destination: BinaryIO, digest: Any) -> int:
    byte_count = 0
    with root.open("rb") as stream:
        stream.readline()
        for block in iter(lambda: stream.read(1024 * 1024), b""):
            destination.write(block)
            digest.update(block)
            byte_count += len(block)
    return byte_count


def _copy_fragment(
    fragment: Refinement,
    *,
    max_var: int,
    destination: BinaryIO,
    digest: Any,
) -> int:
    byte_count = 0
    for line in _iter_clause_lines(
        fragment.fragment.path,
        max_var=max_var,
        expected_count=fragment.clause_count,
    ):
        destination.write(line)
        digest.update(line)
        byte_count += len(line)
    return byte_count


class _NullWriter:
    def write(self, raw: bytes) -> int:
        return len(raw)


def _formula_identity(
    chain: FrozenRefinementChain,
    refinements: tuple[Refinement, ...],
    destination: BinaryIO,
) -> tuple[str, int, int]:
    clause_count = chain.root_num_clauses + sum(item.clause_count for item in refinements)
    header = f"p cnf {chain.root_num_vars} {clause_count}\n".encode()
    digest = hashlib.sha256(header)
    destination.write(header)
    byte_count = len(header) + _copy_root_body(chain.root.path, destination, digest)
    for refinement in refinements:
        byte_count += _copy_fragment(
            refinement,
            max_var=chain.root_num_vars,
            destination=destination,
            digest=digest,
        )
    return digest.hexdigest(), byte_count, clause_count


def _parse_refinement(repo: Path, raw: Any, ordinal: int) -> Refinement:
    value = _require_mapping(raw, f"refinement {ordinal}")
    expected = {
        "ordinal",
        "kind",
        "receipt",
        "receipt_schema",
        "clause_fragment",
        "clause_count",
        "parent_formula_sha256",
        "parent_clause_count",
        "result_formula_sha256",
        "result_clause_count",
        "provenance",
    }
    _require(set(value) == expected, f"unexpected refinement {ordinal} fields")
    _require(value["ordinal"] == ordinal, "refinement ordinals are not dense")
    kind = value["kind"]
    _require(kind in {"cut_round", "pair_closure"}, f"invalid refinement kind at {ordinal}")
    receipt_schema = value["receipt_schema"]
    _require(type(receipt_schema) is str and bool(receipt_schema), f"missing receipt schema at {ordinal}")
    _require_mapping(value["provenance"], f"refinement {ordinal} provenance")
    receipt = _file_ref(repo, value["receipt"], f"refinement {ordinal} receipt")
    receipt_payload = _require_mapping(
        load_strict_json(receipt.path.read_bytes(), label=receipt.label),
        f"refinement {ordinal} receipt",
    )
    _require(
        receipt_payload.get("schema") == receipt_schema,
        f"refinement {ordinal} receipt schema mismatch",
    )
    return Refinement(
        ordinal=ordinal,
        kind=kind,
        receipt=receipt,
        receipt_schema=receipt_schema,
        fragment=_file_ref(repo, value["clause_fragment"], f"refinement {ordinal} fragment"),
        clause_count=_require_int(value["clause_count"], f"refinement {ordinal} clause count", minimum=1),
        parent_formula_sha256=_require_sha(value["parent_formula_sha256"], f"refinement {ordinal} parent SHA-256"),
        parent_clause_count=_require_int(value["parent_clause_count"], f"refinement {ordinal} parent clauses", minimum=1),
        result_formula_sha256=_require_sha(value["result_formula_sha256"], f"refinement {ordinal} result SHA-256"),
        result_clause_count=_require_int(value["result_clause_count"], f"refinement {ordinal} result clauses", minimum=1),
    )


def validate_manifest(manifest_path: Path, *, repo: Path) -> FrozenRefinementChain:
    """Validate one manifest and all referenced immutable artifacts."""

    path = manifest_path.resolve()
    raw = path.read_bytes()
    _require(raw == canonical_json_bytes(load_strict_json(raw, label=str(path))), "manifest is not canonical compact JSON")
    manifest = _require_mapping(load_strict_json(raw, label=str(path)), "manifest")
    _require(set(manifest) == TOP_LEVEL_KEYS, "unexpected top-level manifest fields")
    _require(manifest["schema"] == SCHEMA, "unexpected refinement-chain schema")

    lane = _require_mapping(manifest["lane"], "lane")
    _require(lane.get("order_index") == 0, "lane is not normalized order zero")
    _require(lane.get("anonymous_positions") == [0, 1], "lane has wrong anonymous positions")
    order = lane.get("order")
    _require(type(order) is list and len(order) == 17 and sorted(order) == list(range(17)), "lane order is not a 17-point permutation")

    claims = _require_mapping(manifest["claims"], "claims")
    _require(claims.get("normalized_case_only") is True, "normalized-case-only claim is missing")
    for claim in REQUIRED_FALSE_CLAIMS:
        _require(claims.get(claim) is False, f"unsupported claim must remain false: {claim}")

    root_value = _require_mapping(manifest["root"], "root")
    root = _file_ref(repo, root_value.get("cnf"), "root CNF")
    root_manifest = _file_ref(repo, root_value.get("manifest"), "root manifest")
    root_validation = _file_ref(repo, root_value.get("validation"), "root validation")
    _, actual_vars, actual_clauses = _root_header(root.path)
    num_vars = _require_int(root_value.get("num_vars"), "root variable count", minimum=1)
    num_clauses = _require_int(root_value.get("num_clauses"), "root clause count", minimum=1)
    _require((actual_vars, actual_clauses) == (num_vars, num_clauses), "root dimensions disagree with DIMACS")

    root_manifest_payload = _require_mapping(load_strict_json(root_manifest.path.read_bytes(), label=root_manifest.label), "root manifest")
    _require(root_manifest_payload.get("variables") == num_vars and root_manifest_payload.get("clauses") == num_clauses, "root manifest dimensions disagree")
    _require(root_manifest_payload.get("order") == order, "root manifest order disagrees")
    root_validation_payload = _require_mapping(load_strict_json(root_validation.path.read_bytes(), label=root_validation.label), "root validation")
    _require(root_validation_payload.get("status") == "PASS", "root validation is not PASS")
    _require(root_validation_payload.get("variables") == num_vars and root_validation_payload.get("clauses") == num_clauses, "root validation dimensions disagree")

    map_value = _require_mapping(manifest["variable_map"], "variable map")
    variable_map = _file_ref(repo, map_value.get("artifact"), "variable map artifact")
    _require(map_value.get("schema") == VARIABLE_MAP_SCHEMA, "unexpected variable-map schema")
    _require(map_value.get("entry_count") == num_vars, "variable-map entry count disagrees")
    variable_map_payload = _require_mapping(load_strict_json(variable_map.path.read_bytes(), label=variable_map.label), "variable map")
    _require(variable_map_payload.get("schema") == VARIABLE_MAP_SCHEMA, "variable-map payload schema disagrees")
    _require(variable_map_payload.get("order") == order, "variable-map order disagrees")
    entries = variable_map_payload.get("entries")
    _require(type(entries) is list and len(entries) == num_vars, "variable-map payload is incomplete")
    _require(map_value.get("order_sha256") == sha256_bytes(canonical_json_bytes(order)), "variable-map order hash disagrees")

    raw_refinements = manifest["refinements"]
    _require(type(raw_refinements) is list and bool(raw_refinements), "refinements must be a nonempty list")
    refinements = tuple(_parse_refinement(repo, item, ordinal) for ordinal, item in enumerate(raw_refinements))
    _require(refinements[-1].kind == "pair_closure", "last refinement must be pair closure")
    _require(all(item.kind == "cut_round" for item in refinements[:-1]), "only the final refinement may be pair closure")

    aggregate = _require_mapping(manifest["aggregate"], "aggregate")
    _require(aggregate.get("algorithm") == AGGREGATE_ALGORITHM, "unexpected aggregate algorithm")
    _require(aggregate.get("upload_cap_bytes") == MAX_AGGREGATE_BYTES, "wrong aggregate upload cap")
    aggregate_sha = _require_sha(aggregate.get("sha256"), "aggregate SHA-256")
    aggregate_bytes = _require_int(aggregate.get("byte_count"), "aggregate byte count", minimum=1)
    aggregate_clauses = _require_int(aggregate.get("num_clauses"), "aggregate clause count", minimum=1)
    _require(aggregate.get("num_vars") == num_vars, "aggregate variable count disagrees")
    _require(aggregate_bytes <= MAX_AGGREGATE_BYTES and aggregate.get("within_upload_cap") is True, "aggregate exceeds upload cap")

    chain = FrozenRefinementChain(
        manifest_path=path,
        manifest_sha256=sha256_bytes(raw),
        root=root,
        root_num_vars=num_vars,
        root_num_clauses=num_clauses,
        variable_map=variable_map,
        refinements=refinements,
        aggregate_sha256=aggregate_sha,
        aggregate_byte_count=aggregate_bytes,
        aggregate_num_clauses=aggregate_clauses,
    )

    parent_sha = root.sha256
    parent_clauses = num_clauses
    for index, refinement in enumerate(refinements):
        _require(refinement.parent_formula_sha256 == parent_sha, f"refinement {index} parent hash breaks continuity")
        _require(refinement.parent_clause_count == parent_clauses, f"refinement {index} parent count breaks continuity")
        _require(refinement.result_clause_count == parent_clauses + refinement.clause_count, f"refinement {index} result count is wrong")
        actual_sha, _, actual_count = _formula_identity(chain, refinements[: index + 1], _NullWriter())
        _require(actual_sha == refinement.result_formula_sha256, f"refinement {index} result hash mismatch")
        _require(actual_count == refinement.result_clause_count, f"refinement {index} reconstructed count mismatch")
        parent_sha = actual_sha
        parent_clauses = actual_count

    aggregate_actual_sha, aggregate_actual_bytes, aggregate_actual_clauses = _formula_identity(chain, refinements, _NullWriter())
    _require(aggregate_actual_sha == aggregate_sha, "aggregate SHA-256 mismatch")
    _require(aggregate_actual_bytes == aggregate_bytes, "aggregate byte count mismatch")
    _require(aggregate_actual_clauses == aggregate_clauses, "aggregate clause count mismatch")
    return chain


def reconstruct_aggregate(chain: FrozenRefinementChain, destination: Path) -> None:
    """Write the byte-pinned aggregate after the manifest has validated."""

    destination.parent.mkdir(parents=True, exist_ok=True)
    with destination.open("wb") as stream:
        actual = _formula_identity(chain, chain.refinements, stream)
    expected = (
        chain.aggregate_sha256,
        chain.aggregate_byte_count,
        chain.aggregate_num_clauses,
    )
    if actual != expected:
        destination.unlink(missing_ok=True)
        raise Exact17RefinementChainError("written aggregate identity mismatch")


def load_fragment_clauses(
    refinement: Refinement, *, max_var: int
) -> tuple[tuple[int, ...], ...]:
    """Decode one already-authenticated fragment for a PIQD clause append.

    The shared fragment validator remains the single authority for DIMACS
    syntax, clause count, termination, and the frozen root variable domain.
    """

    return tuple(
        tuple(int(field) for field in line.split()[:-1])
        for line in _iter_clause_lines(
            refinement.fragment.path,
            max_var=max_var,
            expected_count=refinement.clause_count,
        )
    )
