# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Source-snapshotted static bank of Lean-bound exact-12 source-order cuts.

The bank is deliberately narrower than the diagnostic ordered-coverage
detector.  A path-built entry is admitted only when its complete canonical cube
selects a checked ``generated_lean_nogood`` binding and the referenced Lean
source bytes still match that binding.  A caller-supplied snapshot is instead
accepted by exact canonical recompilation; it does not by itself attest that
live repository paths still have the recorded bytes.  Installing the bank adds
only the resulting selected-row clauses to a bound exact-12 instance.

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
from typing import Any, BinaryIO

from .exact12_v14_ordered_coverage import (
    PROOF_BACKED_CUBE_BINDINGS,
    detect_proof_backed_ordered_coverage,
    learned_clause_for_proof_backed_ordered_coverage,
)
from .sat_encoding import CoverInstance

BANK_SCHEMA = "p97_rigid221_exact12_source_order_positive_bank.v3"
DETECTOR_CONTRACT = (
    "exact generated Lean source-order nogood plus recorded source manifests"
)
DETECTOR_FILES: tuple[str, ...] = (
    "census/card_head/exact12_v14_source_order_bank.py",
    "census/card_head/exact12_v14_ordered_coverage.py",
    "census/card_head/sat_encoding.py",
)


class Exact12V14SourceOrderBankError(ValueError):
    """A source-order bank entry or its source binding is malformed."""


_BANK_FIELDS = frozenset(
    {
        "schema",
        "detector_contract",
        "detector_manifest",
        "detector_manifest_sha256",
        "lean_source_manifest",
        "entries",
        "claims",
        "bank_sha256",
    }
)
_BANK_CLAIMS = {
    "lean_cut_source_pinned": True,
    "terminal_unsat": False,
    "aggregate_cell_coverage": False,
    "universal_lift": False,
    "live_theorem_closure": False,
}


def _canonical_json_bytes(value: Any) -> bytes:
    return json.dumps(
        value, sort_keys=True, separators=(",", ":"), allow_nan=False
    ).encode("utf-8")


def _sha256_json(value: Any) -> str:
    return hashlib.sha256(_canonical_json_bytes(value)).hexdigest()


def _open_repo_source(repo_root: Path, relative: str) -> BinaryIO:
    """Open one repository-relative regular file without following symlinks."""

    relative_path = Path(relative)
    if (
        relative_path.is_absolute()
        or not relative_path.parts
        or any(part in {".", ".."} for part in relative_path.parts)
    ):
        raise Exact12V14SourceOrderBankError(
            f"proof-backed source escapes repository: {relative}"
        )
    nofollow = getattr(os, "O_NOFOLLOW", 0)
    directory = getattr(os, "O_DIRECTORY", 0)
    nonblock = getattr(os, "O_NONBLOCK", 0)
    if (
        nofollow == 0
        or directory == 0
        or nonblock == 0
        or os.open not in os.supports_dir_fd
    ):
        raise Exact12V14SourceOrderBankError(
            "platform lacks required descriptor-relative no-follow operations"
        )
    directory_flags = os.O_RDONLY | nofollow | directory | getattr(os, "O_CLOEXEC", 0)
    source_flags = os.O_RDONLY | nofollow | getattr(os, "O_CLOEXEC", 0) | nonblock
    descriptor: int | None = None
    source_descriptor: int | None = None
    try:
        descriptor = os.open(repo_root.resolve(), directory_flags)
        for component in relative_path.parts[:-1]:
            next_descriptor = os.open(component, directory_flags, dir_fd=descriptor)
            previous_descriptor = descriptor
            descriptor = next_descriptor
            try:
                os.close(previous_descriptor)
            except OSError:
                try:
                    os.close(previous_descriptor)
                except OSError:
                    pass
                raise
        source_descriptor = os.open(
            relative_path.parts[-1], source_flags, dir_fd=descriptor
        )
    except OSError as exc:
        raise Exact12V14SourceOrderBankError(
            f"missing regular proof-backed source: {relative}"
        ) from exc
    finally:
        if descriptor is not None:
            try:
                os.close(descriptor)
            except OSError:
                pass
    try:
        assert source_descriptor is not None
        info = os.fstat(source_descriptor)
        if not stat.S_ISREG(info.st_mode):
            raise Exact12V14SourceOrderBankError(
                f"missing regular proof-backed source: {relative}"
            )
        handle = os.fdopen(source_descriptor, "rb")
        source_descriptor = None
        return handle
    finally:
        if source_descriptor is not None:
            try:
                os.close(source_descriptor)
            except OSError:
                pass


def _source_record(repo_root: Path, relative: str) -> dict[str, Any]:
    digest = hashlib.sha256()
    byte_count = 0
    with _open_repo_source(repo_root, relative) as handle:
        for chunk in iter(lambda: handle.read(1 << 20), b""):
            byte_count += len(chunk)
            digest.update(chunk)
    return {
        "path": relative,
        "bytes": byte_count,
        "sha256": digest.hexdigest(),
    }


def _current_lean_source_manifest(repo_root: Path) -> list[dict[str, Any]]:
    expected = _expected_lean_source_manifest()
    current = [_source_record(repo_root, record["path"]) for record in expected]
    if current != expected:
        raise Exact12V14SourceOrderBankError(
            "generated Lean nogood source bytes drifted"
        )
    return current


def _expected_lean_source_manifest() -> list[dict[str, Any]]:
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
    return [expected_by_path[path] for path in sorted(expected_by_path)]


def _detector_manifest(repo_root: Path) -> list[dict[str, Any]]:
    return [_source_record(repo_root, relative) for relative in DETECTOR_FILES]


def _source_record_from_bytes(relative: str, payload: bytes) -> dict[str, Any]:
    if type(payload) is not bytes:
        raise Exact12V14SourceOrderBankError(
            f"authenticated source payload is not immutable bytes: {relative}"
        )
    return {
        "path": relative,
        "bytes": len(payload),
        "sha256": hashlib.sha256(payload).hexdigest(),
    }


def _source_manifest_has_shape(manifest: Any, *, expected_paths: Sequence[str]) -> bool:
    if not isinstance(manifest, list) or len(manifest) != len(expected_paths):
        return False
    for record, expected_path in zip(manifest, expected_paths, strict=True):
        if (
            not isinstance(record, dict)
            or set(record) != {"path", "bytes", "sha256"}
            or record.get("path") != expected_path
            or isinstance(record.get("bytes"), bool)
            or not isinstance(record.get("bytes"), int)
            or record["bytes"] < 0
            or not isinstance(record.get("sha256"), str)
            or len(record["sha256"]) != 64
            or any(
                character not in "0123456789abcdef" for character in record["sha256"]
            )
        ):
            return False
    return True


def snapshot_source_order_bank(
    instance: CoverInstance, bank: Mapping[str, Any]
) -> dict[str, Any]:
    """Freeze and fully recompile one caller-supplied proof-backed bank."""

    if not isinstance(bank, Mapping):
        raise Exact12V14SourceOrderBankError(
            "proof-backed source-order bank is not a mapping"
        )
    try:
        payload = _canonical_json_bytes(bank)
        snapshot = json.loads(
            payload,
            parse_constant=lambda value: (_ for _ in ()).throw(
                ValueError(f"invalid JSON constant {value}")
            ),
        )
    except (TypeError, ValueError, json.JSONDecodeError) as exc:
        raise Exact12V14SourceOrderBankError(
            "proof-backed source-order bank is not strict canonical JSON"
        ) from exc
    if not isinstance(snapshot, dict) or set(snapshot) != _BANK_FIELDS:
        raise Exact12V14SourceOrderBankError(
            "proof-backed source-order bank fields are malformed"
        )
    claimed_sha256 = snapshot.pop("bank_sha256")
    detector_manifest = snapshot.get("detector_manifest")
    lean_source_manifest = snapshot.get("lean_source_manifest")
    if (
        snapshot.get("schema") != BANK_SCHEMA
        or snapshot.get("detector_contract") != DETECTOR_CONTRACT
        or snapshot.get("claims") != _BANK_CLAIMS
        or not _source_manifest_has_shape(
            detector_manifest, expected_paths=DETECTOR_FILES
        )
        or lean_source_manifest != _expected_lean_source_manifest()
        or not isinstance(snapshot.get("entries"), list)
        or not isinstance(claimed_sha256, str)
        or len(claimed_sha256) != 64
        or any(character not in "0123456789abcdef" for character in claimed_sha256)
        or claimed_sha256 != _sha256_json(snapshot)
        or snapshot.get("detector_manifest_sha256")
        != _sha256_json(snapshot.get("detector_manifest"))
    ):
        raise Exact12V14SourceOrderBankError(
            "proof-backed source-order bank failed schema or digest authentication"
        )
    frozen = {**snapshot, "bank_sha256": claimed_sha256}
    expected = _build_source_order_bank(
        instance,
        lean_sources=copy.deepcopy(lean_source_manifest),
        detector_manifest=copy.deepcopy(detector_manifest),
    )
    if _canonical_json_bytes(frozen) != _canonical_json_bytes(expected):
        raise Exact12V14SourceOrderBankError(
            "proof-backed source-order bank failed exact recompilation"
        )
    return frozen


def _manifest_from_authenticated_sources(
    source_bytes: Mapping[str, bytes], relatives: Sequence[str]
) -> list[dict[str, Any]]:
    try:
        return [
            _source_record_from_bytes(relative, source_bytes[relative])
            for relative in relatives
        ]
    except KeyError as exc:
        raise Exact12V14SourceOrderBankError(
            f"authenticated source bundle omitted: {exc.args[0]}"
        ) from exc


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


def _build_source_order_bank(
    instance: CoverInstance,
    *,
    lean_sources: list[dict[str, Any]],
    detector_manifest: list[dict[str, Any]],
) -> dict[str, Any]:
    if instance.model.cardinality != 12:
        raise Exact12V14SourceOrderBankError(
            "proof-backed source-order bank is exact-cardinality 12"
        )
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
            **_BANK_CLAIMS,
        },
    }
    return {**body, "bank_sha256": _sha256_json(body)}


def build_source_order_bank(repo_root: Path, instance: CoverInstance) -> dict[str, Any]:
    """Build the complete currently admitted proof-backed static bank."""

    repo_root = repo_root.resolve()
    return _build_source_order_bank(
        instance,
        lean_sources=_current_lean_source_manifest(repo_root),
        detector_manifest=_detector_manifest(repo_root),
    )


def build_source_order_bank_from_authenticated_sources(
    instance: CoverInstance, source_bytes: Mapping[str, bytes]
) -> dict[str, Any]:
    """Build the bank using only one immutable authenticated source bundle."""

    expected_lean_sources = _expected_lean_source_manifest()
    lean_sources = _manifest_from_authenticated_sources(
        source_bytes, [record["path"] for record in expected_lean_sources]
    )
    if lean_sources != expected_lean_sources:
        raise Exact12V14SourceOrderBankError(
            "authenticated Lean nogood source bytes drifted"
        )
    return _build_source_order_bank(
        instance,
        lean_sources=lean_sources,
        detector_manifest=_manifest_from_authenticated_sources(
            source_bytes, DETECTOR_FILES
        ),
    )


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
