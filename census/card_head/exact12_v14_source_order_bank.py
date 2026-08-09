# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Authenticated static bank of Lean-proved exact-12 source-order cuts.

The bank is deliberately narrower than the diagnostic ordered-coverage
detector.  An entry is admitted only when its complete canonical cube selects
a checked ``generated_lean_nogood`` binding and the referenced Lean source
bytes still match that binding.  Installing the bank adds only the resulting
selected-row clauses to a bound exact-12 instance.

This supplies a proof-backed finite refinement.  It does not prove terminal
UNSAT, all-cell coverage, a universal lift, or closure of a live theorem.
"""

from __future__ import annotations

import copy
import hashlib
import json
import os
import stat
from collections.abc import Mapping, Sequence
from pathlib import Path
from typing import Any

from .exact12_v14_ordered_coverage import (
    PROOF_BACKED_CUBE_BINDINGS,
    detect_proof_backed_ordered_coverage,
    learned_clause_for_proof_backed_ordered_coverage,
)
from .sat_encoding import CoverInstance

BANK_SCHEMA = "p97_rigid221_exact12_source_order_positive_bank.v2"
DETECTOR_CONTRACT = (
    "exact generated Lean source-order nogood plus current-source hash replay"
)
DETECTOR_FILES: tuple[str, ...] = (
    "census/card_head/exact12_v14_source_order_bank.py",
    "census/card_head/exact12_v14_ordered_coverage.py",
    "census/card_head/sat_encoding.py",
)


class Exact12V14SourceOrderBankError(ValueError):
    """A source-order bank entry or its source binding is malformed."""


def _canonical_json_bytes(value: Any) -> bytes:
    return json.dumps(value, sort_keys=True, separators=(",", ":")).encode("utf-8")


def _sha256_json(value: Any) -> str:
    return hashlib.sha256(_canonical_json_bytes(value)).hexdigest()


def _source_record(repo_root: Path, relative: str) -> dict[str, Any]:
    relative_path = Path(relative)
    if relative_path.is_absolute() or ".." in relative_path.parts:
        raise Exact12V14SourceOrderBankError(
            f"proof-backed source escapes repository: {relative}"
        )
    path = repo_root / relative
    flags = os.O_RDONLY | getattr(os, "O_NOFOLLOW", 0)
    try:
        descriptor = os.open(path, flags)
    except OSError as exc:
        raise Exact12V14SourceOrderBankError(
            f"missing regular proof-backed source: {relative}"
        ) from exc
    digest = hashlib.sha256()
    byte_count = 0
    with os.fdopen(descriptor, "rb") as handle:
        info = os.fstat(handle.fileno())
        if not stat.S_ISREG(info.st_mode):
            raise Exact12V14SourceOrderBankError(
                f"missing regular proof-backed source: {relative}"
            )
        for chunk in iter(lambda: handle.read(1 << 20), b""):
            byte_count += len(chunk)
            digest.update(chunk)
    return {
        "path": relative,
        "bytes": byte_count,
        "sha256": digest.hexdigest(),
    }


def _current_lean_source_manifest(repo_root: Path) -> list[dict[str, Any]]:
    expected_by_path: dict[str, dict[str, Any]] = {}
    for _cube, binding, _choices in PROOF_BACKED_CUBE_BINDINGS:
        for prefix in ("", "coverage_", "consumer_"):
            record = {
                "path": binding[f"{prefix}source_path"],
                "bytes": binding[f"{prefix}source_bytes"],
                "sha256": binding[f"{prefix}source_sha256"],
            }
            previous = expected_by_path.setdefault(record["path"], record)
            if previous != record:
                raise Exact12V14SourceOrderBankError(
                    "generated Lean bindings disagree on source bytes"
                )
    expected = [expected_by_path[path] for path in sorted(expected_by_path)]
    current = [_source_record(repo_root, record["path"]) for record in expected]
    if current != expected:
        raise Exact12V14SourceOrderBankError(
            "generated Lean nogood source bytes drifted"
        )
    return current


def _detector_manifest(repo_root: Path) -> list[dict[str, Any]]:
    return [_source_record(repo_root, relative) for relative in DETECTOR_FILES]


def _integer_cube(cube: Mapping[str, Sequence[int]]) -> dict[int, list[int]]:
    return {int(center): list(support) for center, support in cube.items()}


def _selected_variables(
    instance: CoverInstance, cube: Mapping[int, Sequence[int]]
) -> list[int]:
    return sorted(
        instance.choice_variables[
            (center, instance.candidate_index(center, cube[center]))
        ]
        for center in range(instance.model.cardinality)
    )


def _lean_choice_variables(
    instance: CoverInstance, choices: Sequence[Mapping[str, Any]]
) -> list[int]:
    return [
        instance.choice_variables[
            (
                choice["center"],
                instance.candidate_index(choice["center"], choice["support"]),
            )
        ]
        for choice in choices
    ]


def _build_entry(
    instance: CoverInstance,
    index: int,
    string_cube: Mapping[str, Sequence[int]],
    binding: Mapping[str, Any],
    choices: Sequence[Mapping[str, Any]],
) -> dict[str, Any]:
    cube = _integer_cube(string_cube)
    certificate = detect_proof_backed_ordered_coverage(cube)
    if certificate is None:
        raise Exact12V14SourceOrderBankError(
            "source-order cut lost its generated Lean binding"
        )
    clause = learned_clause_for_proof_backed_ordered_coverage(instance, certificate)
    positive_variables = _selected_variables(instance, cube)
    lean_choice_variables = _lean_choice_variables(instance, choices)
    if clause != tuple(-variable for variable in lean_choice_variables):
        raise Exact12V14SourceOrderBankError(
            "proof-backed clause differs from the generated Lean choices"
        )
    if any(literal >= 0 or -literal not in positive_variables for literal in clause):
        raise Exact12V14SourceOrderBankError(
            "source-order witness does not falsify its proof-backed clause"
        )
    witness_cube = {str(center): cube[center] for center in range(12)}
    return {
        "index": index,
        "certificate_kind": "source_order_positive_coverage",
        "certificate_schema": certificate["schema"],
        "certificate": certificate,
        "certificate_sha256": _sha256_json(certificate),
        "learned_clause": list(clause),
        "learned_clause_sha256": _sha256_json(list(clause)),
        "witness_cube": witness_cube,
        "witness_cube_sha256": _sha256_json(witness_cube),
        "witness_positive_variables": positive_variables,
        "witness_positive_variables_sha256": _sha256_json(positive_variables),
        "lean_choice_variables": lean_choice_variables,
        "lean_choice_variables_sha256": _sha256_json(lean_choice_variables),
        "generated_lean_nogood": copy.deepcopy(dict(binding)),
    }


def build_source_order_bank(repo_root: Path, instance: CoverInstance) -> dict[str, Any]:
    """Build the complete currently admitted proof-backed static bank."""

    if instance.model.cardinality != 12:
        raise Exact12V14SourceOrderBankError(
            "proof-backed source-order bank is exact-cardinality 12"
        )
    repo_root = repo_root.resolve()
    lean_sources = _current_lean_source_manifest(repo_root)
    detector_manifest = _detector_manifest(repo_root)
    entries = [
        _build_entry(instance, index, cube, binding, choices)
        for index, (cube, binding, choices) in enumerate(PROOF_BACKED_CUBE_BINDINGS)
    ]
    body = {
        "schema": BANK_SCHEMA,
        "detector_contract": DETECTOR_CONTRACT,
        "detector_manifest": detector_manifest,
        "detector_manifest_sha256": _sha256_json(detector_manifest),
        "lean_source_manifest": lean_sources,
        "entries": entries,
        "claims": {
            "lean_cut_proved": True,
            "terminal_unsat": False,
            "aggregate_cell_coverage": False,
            "universal_lift": False,
            "live_theorem_closure": False,
        },
    }
    return {**body, "bank_sha256": _sha256_json(body)}


def validate_source_order_bank(
    repo_root: Path, instance: CoverInstance, bank: Mapping[str, Any]
) -> None:
    """Require byte-for-byte canonical equality with a fresh bank rebuild."""

    fresh = build_source_order_bank(repo_root, instance)
    if _canonical_json_bytes(bank) != _canonical_json_bytes(fresh):
        raise Exact12V14SourceOrderBankError(
            "source-order bank differs from the fresh proof-backed bank"
        )


def install_source_order_bank(
    repo_root: Path, instance: CoverInstance
) -> dict[str, Any]:
    """Freshly build, validate, and add every proof-backed bank clause."""

    bank = build_source_order_bank(repo_root, instance)
    validate_source_order_bank(repo_root, instance, bank)
    existing = set(instance.cnf.clauses)
    for entry in bank["entries"]:
        clause = tuple(entry["learned_clause"])
        if clause in existing:
            raise Exact12V14SourceOrderBankError(
                "proof-backed source-order clause is already installed"
            )
        instance.cnf.add_clause(clause)
        existing.add(clause)
    return bank
