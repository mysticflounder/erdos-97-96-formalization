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
    FROZEN_V8_CUBE,
    FROZEN_V8_LEAN_BINDING,
    FROZEN_V8_LEAN_CHOICES,
    detect_proof_backed_ordered_coverage,
    learned_clause_for_proof_backed_ordered_coverage,
)
from .sat_encoding import CoverInstance

BANK_SCHEMA = "p97_rigid221_exact12_source_order_positive_bank.v1"
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
    binding = FROZEN_V8_LEAN_BINDING
    expected = (
        {
            "path": binding["source_path"],
            "bytes": binding["source_bytes"],
            "sha256": binding["source_sha256"],
        },
        {
            "path": binding["coverage_source_path"],
            "bytes": binding["coverage_source_bytes"],
            "sha256": binding["coverage_source_sha256"],
        },
        {
            "path": binding["consumer_source_path"],
            "bytes": binding["consumer_source_bytes"],
            "sha256": binding["consumer_source_sha256"],
        },
    )
    current = [_source_record(repo_root, record["path"]) for record in expected]
    if current != list(expected):
        raise Exact12V14SourceOrderBankError(
            "generated Lean nogood source bytes drifted"
        )
    return current


def _detector_manifest(repo_root: Path) -> list[dict[str, Any]]:
    return [_source_record(repo_root, relative) for relative in DETECTOR_FILES]


def _frozen_cube() -> dict[int, list[int]]:
    return {int(center): list(support) for center, support in FROZEN_V8_CUBE.items()}


def _selected_variables(
    instance: CoverInstance, cube: Mapping[int, Sequence[int]]
) -> list[int]:
    return sorted(
        instance.choice_variables[
            (center, instance.candidate_index(center, cube[center]))
        ]
        for center in range(instance.model.cardinality)
    )


def _lean_choice_variables(instance: CoverInstance) -> list[int]:
    return [
        instance.choice_variables[
            (
                choice["center"],
                instance.candidate_index(choice["center"], choice["support"]),
            )
        ]
        for choice in FROZEN_V8_LEAN_CHOICES
    ]


def build_source_order_bank(repo_root: Path, instance: CoverInstance) -> dict[str, Any]:
    """Build the complete currently admitted proof-backed static bank."""

    if instance.model.cardinality != 12:
        raise Exact12V14SourceOrderBankError(
            "proof-backed source-order bank is exact-cardinality 12"
        )
    repo_root = repo_root.resolve()
    lean_sources = _current_lean_source_manifest(repo_root)
    detector_manifest = _detector_manifest(repo_root)
    cube = _frozen_cube()
    certificate = detect_proof_backed_ordered_coverage(cube)
    if certificate is None:
        raise Exact12V14SourceOrderBankError(
            "frozen source-order cut lost its generated Lean binding"
        )
    clause = learned_clause_for_proof_backed_ordered_coverage(instance, certificate)
    positive_variables = _selected_variables(instance, cube)
    lean_choice_variables = _lean_choice_variables(instance)
    if clause != tuple(-variable for variable in lean_choice_variables):
        raise Exact12V14SourceOrderBankError(
            "proof-backed clause differs from the generated Lean choices"
        )
    if any(literal >= 0 or -literal not in positive_variables for literal in clause):
        raise Exact12V14SourceOrderBankError(
            "frozen witness does not falsify its proof-backed clause"
        )
    entry = {
        "index": 0,
        "certificate_kind": "source_order_positive_coverage",
        "certificate_schema": certificate["schema"],
        "certificate": certificate,
        "certificate_sha256": _sha256_json(certificate),
        "learned_clause": list(clause),
        "learned_clause_sha256": _sha256_json(list(clause)),
        "witness_cube": {str(center): cube[center] for center in range(12)},
        "witness_cube_sha256": _sha256_json(
            {str(center): cube[center] for center in range(12)}
        ),
        "witness_positive_variables": positive_variables,
        "witness_positive_variables_sha256": _sha256_json(positive_variables),
        "lean_choice_variables": lean_choice_variables,
        "lean_choice_variables_sha256": _sha256_json(lean_choice_variables),
        "generated_lean_nogood": copy.deepcopy(FROZEN_V8_LEAN_BINDING),
    }
    body = {
        "schema": BANK_SCHEMA,
        "detector_contract": DETECTOR_CONTRACT,
        "detector_manifest": detector_manifest,
        "detector_manifest_sha256": _sha256_json(detector_manifest),
        "lean_source_manifest": lean_sources,
        "entries": [entry],
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
