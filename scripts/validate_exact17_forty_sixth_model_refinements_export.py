"""Fail-closed validator for the provisioned Child45-wave export.

The expected 36-clause suffix is reconstructed from the authenticated mine
ledger.  This module never runs Lean, a solver, or a publication operation.
The parent and Child46 byte/hash pins authenticate the two Lean-owned exports.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import os
import stat
import sys
from pathlib import Path
from typing import Any

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT))

from census.p97_search.exact17_source_model_replay import (
    canonical_assignment_from_source_model,
    canonical_assignment_sha256,
)

VARIABLES = 308
PARENT_CLAUSES = 5_848_828
CHILD_CLAUSES = 5_848_864
NEW_CLAUSES = 36
PARENT_SHA256: str | None = (
    "e74795bf5dcf5748e9872bf37f115c8d6237d0f3b0332d065a711bcbfc8aabe5"
)
PARENT_BYTES: int | None = 291_705_130
CHILD_SHA256: str | None = (
    "106a8f682212cb76281b01fb834f6244e6013767a1edad207c77179a187e75b2"
)
CHILD_BYTES: int | None = 291_706_884
PARENT_PATH = (
    ROOT
    / "scratch/exact17-lean-to-sat/exact17-forty-sixth-root-forty-fifth-model-refinements.cnf"
)
CHILD_PATH = (
    ROOT
    / "scratch/exact17-lean-to-sat/exact17-forty-seventh-root-forty-sixth-model-refinements.cnf"
)
LEDGER_PATH = (
    ROOT / "scratch/exact17-child45-wave-mine/child45-wave-occurrence-ledger.json"
)
TERMINAL_ENVELOPE_PATH = (
    ROOT / "scratch/cegar-wave-v2/exact17-child45-nextcenter-assumption-output.json"
)
LEDGER_SHA256 = "93f8ea5b5e50ff43788bb556521a2d0e320178d045fed2c00868fd5a2d683006"
RECEIPT_SHA256 = "4aad001c679627fa2797cbe4f207c3ff574dfa363f00cab223a5e73bee7f6160"
TERMINAL_ENVELOPE_SHA256 = (
    "28786f4898730b6776b0ce656eb16fbf74d25beed54e269a97fcf333dd3f2ee4"
)
TERMINAL_ENVELOPE_EMBEDDED_SHA256 = (
    "bc388ef9ccc39508f4be786131f04a0139a9bdd3c494933a7d886ad97e6cc85f"
)
PREDECESSOR_SHA256 = "302a7fc5751bc9922d859fb0f2e085b0ca224a74ccad798e2a27a89c9b2ef4ea"
PREDECESSOR_EXPORT_SHA256 = (
    "e74795bf5dcf5748e9872bf37f115c8d6237d0f3b0332d065a711bcbfc8aabe5"
)
INHERITED_SUPPORT_CENSUS_SHA256 = (
    "7cbd5787338c9a0ca8bf549f077067aa682ed2474bb66c29a9626b1f311a31c7"
)
ORDERED_SUFFIX_SHA256 = (
    "05b1b92d77d56be54fee3ccc0c09cb66b31453dffb2b97dc3f99bbda37eb47ea"
)
PARENT_SUBSUMED_SUFFIX_INDICES = (8, 10, 12, 18, 24, 30, 32, 35)
AUTHENTICATED_MODEL_CUT_SUFFIX_INDICES = (1, 5, 9, 13, 17, 21, 25, 29, 33)


def sha256_file(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as handle:
        for block in iter(lambda: handle.read(1 << 20), b""):
            digest.update(block)
    return digest.hexdigest()


def _strict_pairs(pairs: list[tuple[str, Any]]) -> dict[str, Any]:
    result: dict[str, Any] = {}
    for key, value in pairs:
        if key in result:
            raise ValueError(f"duplicate JSON key: {key}")
        result[key] = value
    return result


def _strict_json(data: bytes, label: str) -> dict[str, Any]:
    try:
        value = json.loads(data.decode("utf-8"), object_pairs_hook=_strict_pairs)
    except (UnicodeDecodeError, json.JSONDecodeError) as exc:
        raise ValueError(f"{label} is not strict JSON") from exc
    if type(value) is not dict:
        raise ValueError(f"{label} is not a JSON object")
    return value


def _authenticated_ledger() -> dict[str, Any]:
    payload = LEDGER_PATH.read_bytes()
    if hashlib.sha256(payload).hexdigest() != LEDGER_SHA256:
        raise ValueError("Child45 wave ledger hash drifted")
    return _strict_json(payload, "Child45 wave ledger")


def _label_at_position(order: int, index: int) -> int:
    first = (0, 6, 8, 11, 10, 9, 12, 7, 2, 15, 16, 3, 4, 5, 1, 13, 14)
    second = (0, 6, 8, 11, 10, 12, 9, 7, 2, 15, 16, 3, 4, 5, 1, 13, 14)
    return (first if order == 0 else second)[index]


def _expected_suffix() -> tuple[tuple[int, ...], ...]:
    ledger = _authenticated_ledger()
    if ledger.get("schema") != "p97-exact17-child45-wave-weighted-kalmanson-ledger/v1":
        raise ValueError("Child45 wave ledger schema drifted")
    if ledger.get("status") != "AUTHENTICATED_PROMOTABLE":
        raise ValueError("Child45 wave ledger is not authenticated")
    if ledger.get("receipt", {}).get("sha256") != RECEIPT_SHA256:
        raise ValueError("Child45 receipt provenance drifted")
    envelope = ledger.get("terminal_envelope", {})
    if (
        envelope.get("sha256") != TERMINAL_ENVELOPE_SHA256
        or envelope.get("embedded_sha256") != TERMINAL_ENVELOPE_EMBEDDED_SHA256
    ):
        raise ValueError("Child45 terminal envelope provenance drifted")
    if ledger.get("predecessor", {}).get("sha256") != PREDECESSOR_SHA256:
        raise ValueError("FortyFifth predecessor source provenance drifted")
    if ledger.get("predecessor_export", {}).get("sha256") != PREDECESSOR_EXPORT_SHA256:
        raise ValueError("FortyFifth predecessor export provenance drifted")
    if (
        ledger.get("inherited_support_census", {}).get("sha256")
        != INHERITED_SUPPORT_CENSUS_SHA256
    ):
        raise ValueError("inherited support census provenance drifted")
    if ledger.get("new_root") != {
        "parent_clauses": 5_848_828,
        "clauses": 5_848_864,
        "new_clauses": 36,
    }:
        raise ValueError("Child46 ledger root count drifted")
    representatives = ledger["support_dedup"]["representatives"]
    if representatives != [
        "next-center-00",
        "next-center-01",
        "next-center-02",
        "next-center-03",
        "next-center-04",
        "next-center-05",
        "next-center-06",
        "next-center-13",
        "next-center-16",
    ]:
        raise ValueError("Child45 representative order drifted")
    by_cell = {
        item["representative_cell"]: item["occurrence"]["hits"]
        for item in ledger["full_certificate_records"]
    }
    clauses: list[tuple[int, ...]] = []
    for cell in representatives:
        hits = by_cell[cell]
        for order in (0, 1):
            for direction in (0, 1):
                literals = [-307 - order]
                for center, point in hits:
                    center_index = 16 - center if direction else center
                    point_index = 16 - point if direction else point
                    center_label = _label_at_position(order, center_index)
                    point_label = _label_at_position(order, point_index)
                    literals.append(-(1 + center_label * 17 + point_label))
                clauses.append(tuple(literals))
    return tuple(clauses)


def _authenticated_model_rejections(
    expected_suffix: tuple[tuple[int, ...], ...],
) -> tuple[list[dict[str, Any]], tuple[int, ...]]:
    envelope_bytes = TERMINAL_ENVELOPE_PATH.read_bytes()
    if hashlib.sha256(envelope_bytes).hexdigest() != TERMINAL_ENVELOPE_SHA256:
        raise ValueError("Child45 terminal envelope hash drifted")
    envelope = _strict_json(envelope_bytes, "Child45 terminal envelope")
    if (
        envelope.get("schema") != "p97-cegar-assumption-cnf-engine/v1"
        or envelope.get("envelope_sha256") != TERMINAL_ENVELOPE_EMBEDDED_SHA256
        or envelope.get("summary")
        != {
            "attempted": 13,
            "classification": "SAT_SEMANTIC_REPLAYED",
            "not_run": 0,
            "sat": 13,
            "total_cells": 13,
            "unknown": 0,
            "unsat": 0,
        }
    ):
        raise ValueError("Child45 terminal envelope status drifted")
    ledger = _authenticated_ledger()
    representatives = ledger["support_dedup"]["representatives"]
    representative_index = {cell: index for index, cell in enumerate(representatives)}
    provenance = {row["cell_id"]: row for row in ledger["cell_provenance"]}
    cells = envelope.get("cells")
    if (
        type(cells) is not list
        or any(type(cell) is not dict for cell in cells)
        or tuple(cell["cell_id"] for cell in cells)
        != tuple(row["cell_id"] for row in ledger["cell_provenance"])
        or len(provenance) != len(cells)
    ):
        raise ValueError("Child45 cell provenance inventory drifted")
    audits: list[dict[str, Any]] = []
    cut_indices: set[int] = set()
    for cell in cells:
        cell_id = cell["cell_id"]
        result = cell["semantic_replay"]["result"]
        assignment = canonical_assignment_from_source_model(result["source_model"])
        if canonical_assignment_sha256(assignment) != result["assignment_sha256"]:
            raise ValueError(f"Child45 assignment identity drifted: {cell_id}")
        row = provenance[cell_id]
        if (
            row["assignment_sha256"] != result["assignment_sha256"]
            or row["source_model_sha256"] != result["source_model"]["digest"]
        ):
            raise ValueError(f"Child45 ledger/model provenance crossed: {cell_id}")
        representative = row["representative_cell"]
        if representative not in representative_index:
            raise ValueError(f"Child45 representative is unknown: {cell_id}")
        required_index = 4 * representative_index[representative] + 1
        truth = {abs(literal): literal > 0 for literal in assignment}
        rejected = tuple(
            index
            for index, clause in enumerate(expected_suffix, 1)
            if not any(truth[abs(literal)] == (literal > 0) for literal in clause)
        )
        if required_index not in rejected:
            raise ValueError(
                f"authenticated model does not reject its refinement: {cell_id}"
            )
        cut_indices.add(required_index)
        audits.append(
            {
                "cell_id": cell_id,
                "representative_cell": representative,
                "required_rejected_suffix_index": required_index,
                "rejected_suffix_indices": list(rejected),
            }
        )
    result_indices = tuple(sorted(cut_indices))
    if result_indices != AUTHENTICATED_MODEL_CUT_SUFFIX_INDICES:
        raise ValueError("authenticated model-cut suffix census drifted")
    return audits, result_indices


def _header(line: bytes) -> tuple[int, int]:
    fields = line.decode("ascii").strip().split()
    if len(fields) != 4 or fields[:2] != ["p", "cnf"]:
        raise ValueError("DIMACS header is malformed")
    return int(fields[2]), int(fields[3])


def _clause(line: bytes) -> tuple[int, ...]:
    values = tuple(int(value) for value in line.decode("ascii").split())
    if not values or values[-1] != 0:
        raise ValueError("DIMACS clause has no terminal zero")
    return values[:-1]


def _require_owned_regular(path: Path) -> tuple[Path, os.stat_result]:
    if not path.is_absolute() or path != path.resolve():
        raise ValueError("export path must be absolute and normalized")
    try:
        stat_result = path.stat()
    except FileNotFoundError as exc:
        raise ValueError("export path is absent") from exc
    if (
        path.is_symlink()
        or not stat.S_ISREG(stat_result.st_mode)
        or stat_result.st_nlink != 1
        or stat_result.st_uid != os.getuid()
        or stat_result.st_mode & 0o022
    ):
        raise ValueError("export path is not an exclusive regular file")
    return path, stat_result


def _same_file_state(left: os.stat_result, right: os.stat_result) -> bool:
    return all(
        getattr(left, field) == getattr(right, field)
        for field in (
            "st_dev",
            "st_ino",
            "st_mode",
            "st_uid",
            "st_nlink",
            "st_size",
            "st_mtime_ns",
        )
    )


def _require_stable_path(path: Path, initial: os.stat_result) -> None:
    resolved, current = _require_owned_regular(path)
    if resolved != path or not _same_file_state(initial, current):
        raise ValueError("export path changed during validation")


def _stream_export(
    parent_path: Path,
    child_path: Path,
    expected_suffix: tuple[tuple[int, ...], ...],
    *,
    variables: int = VARIABLES,
    parent_clauses: int = PARENT_CLAUSES,
    child_clauses: int = CHILD_CLAUSES,
    expected_parent_subsumed: tuple[int, ...] = PARENT_SUBSUMED_SUFFIX_INDICES,
) -> tuple[str, str, int, int, tuple[int, ...]]:
    parent_path, parent_initial = _require_owned_regular(parent_path)
    child_path, child_initial = _require_owned_regular(child_path)
    if parent_path == child_path:
        raise ValueError("parent and child export paths crossed")
    parent_hash = hashlib.sha256()
    child_hash = hashlib.sha256()
    parent_bytes = 0
    child_bytes = 0
    suffix_sets = [frozenset(clause) for clause in expected_suffix]
    suffix_by_literal: dict[int, set[int]] = {}
    for index, clause in enumerate(suffix_sets, 1):
        for literal in clause:
            suffix_by_literal.setdefault(literal, set()).add(index)
    parent_subsumed: set[int] = set()
    with parent_path.open("rb") as parent, child_path.open("rb") as child:
        if not _same_file_state(parent_initial, os.fstat(parent.fileno())):
            raise ValueError("parent export changed before validation")
        if not _same_file_state(child_initial, os.fstat(child.fileno())):
            raise ValueError("child export changed before validation")
        parent_header = parent.readline()
        child_header = child.readline()
        if _header(parent_header) != (variables, parent_clauses):
            raise ValueError("Child45 parent header drifted")
        if _header(child_header) != (variables, child_clauses):
            raise ValueError("Child46 header drifted")
        parent_hash.update(parent_header)
        child_hash.update(child_header)
        parent_bytes += len(parent_header)
        child_bytes += len(child_header)
        for _ in range(parent_clauses):
            parent_line = parent.readline()
            child_line = child.readline()
            if not parent_line or not child_line or parent_line != child_line:
                raise ValueError(
                    "Child46 does not preserve the authenticated Child45 prefix"
                )
            parent_hash.update(parent_line)
            child_hash.update(child_line)
            parent_bytes += len(parent_line)
            child_bytes += len(child_line)
            tokens = parent_line.split()
            if tokens and tokens[-1] == b"0" and len(tokens) > 1:
                first = int(tokens[0])
                candidates = suffix_by_literal.get(first)
                if candidates:
                    parent_clause = frozenset(int(token) for token in tokens[:-1])
                    parent_subsumed.update(
                        index
                        for index in candidates
                        if parent_clause <= suffix_sets[index - 1]
                    )
        if parent.readline():
            raise ValueError("Child45 parent has extra clauses")
        for expected in expected_suffix:
            line = child.readline()
            if not line or _clause(line) != expected:
                raise ValueError("Child46 suffix contents or order drifted")
            child_hash.update(line)
            child_bytes += len(line)
        if child.readline():
            raise ValueError("Child46 has extra clauses")
        if not _same_file_state(parent_initial, os.fstat(parent.fileno())):
            raise ValueError("parent export changed during validation")
        if not _same_file_state(child_initial, os.fstat(child.fileno())):
            raise ValueError("child export changed during validation")
    _require_stable_path(parent_path, parent_initial)
    _require_stable_path(child_path, child_initial)
    if tuple(sorted(parent_subsumed)) != expected_parent_subsumed:
        raise ValueError("Child46 parent-subsumed suffix census drifted")
    return (
        parent_hash.hexdigest(),
        child_hash.hexdigest(),
        parent_bytes,
        child_bytes,
        tuple(sorted(parent_subsumed)),
    )


def validate_export(
    parent_path: Path = PARENT_PATH, child_path: Path = CHILD_PATH
) -> dict[str, Any]:
    if PARENT_SHA256 is None or PARENT_BYTES is None:
        raise ValueError("Child45 current-root hash/bytes are not provisioned")
    if CHILD_SHA256 is None or CHILD_BYTES is None:
        raise ValueError("Child46 hash/bytes are not provisioned")
    expected_suffix = _expected_suffix()
    suffix_bytes = b"".join(
        (" ".join(map(str, clause)) + " 0\n").encode("ascii")
        for clause in expected_suffix
    )
    if hashlib.sha256(suffix_bytes).hexdigest() != ORDERED_SUFFIX_SHA256:
        raise ValueError("provisioned Child46 ordered suffix identity drifted")
    model_rejections, model_cut_indices = _authenticated_model_rejections(
        expected_suffix
    )
    (
        parent_hash_value,
        child_hash_value,
        parent_bytes,
        child_bytes,
        parent_subsumed_indices,
    ) = _stream_export(parent_path, child_path, expected_suffix)
    if parent_bytes != PARENT_BYTES or parent_hash_value != PARENT_SHA256:
        raise ValueError("authenticated Child45 parent identity drifted")
    if CHILD_SHA256 is not None and child_hash_value != CHILD_SHA256:
        raise ValueError("provisioned Child46 SHA-256 drifted")
    if CHILD_BYTES is not None and child_bytes != CHILD_BYTES:
        raise ValueError("provisioned Child46 byte count drifted")
    if set(parent_subsumed_indices) & set(model_cut_indices):
        raise ValueError("authenticated Child45 model cut is parent-subsumed")
    return {
        "schema": "p97-exact17-forty-sixth-export-validation/v1",
        "status": "PASS",
        "parent_sha256": parent_hash_value,
        "child_sha256": child_hash_value,
        "parent_bytes": parent_bytes,
        "child_bytes": child_bytes,
        "variables": VARIABLES,
        "parent_clauses": PARENT_CLAUSES,
        "new_clauses": NEW_CLAUSES,
        "child_clauses": CHILD_CLAUSES,
        "ordered_suffix_sha256": ORDERED_SUFFIX_SHA256,
        "parent_subsumed_suffix_indices": list(parent_subsumed_indices),
        "authenticated_model_cut_suffix_indices": list(model_cut_indices),
        "cell_model_rejections": model_rejections,
    }


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--parent", type=Path, default=PARENT_PATH)
    parser.add_argument("--child", type=Path, default=CHILD_PATH)
    args = parser.parse_args()
    print(
        json.dumps(validate_export(args.parent, args.child), indent=2, sort_keys=True)
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
