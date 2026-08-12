# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Typed admission for proof-backed exact-12 source-order cuts.

The ordered-coverage detector is broader than the theorem-backed bank.  This
adapter admits a canonically recompiled bank certificate whenever its compiled
all-negative clause is falsified by the current canonical assignment.  It
deliberately has no structural-certificate fallback; the mixed-journal
dispatcher owns that separate certificate family.
"""

from __future__ import annotations

import copy
import hashlib
import json
from collections.abc import Collection, Mapping
from dataclasses import dataclass
from pathlib import Path
from typing import Any

from .exact12_v14_ordered_coverage import (
    Exact12V14OrderedCoverageError,
    learned_clause_for_proof_backed_ordered_coverage,
)
from .exact12_v14_source_order_bank import (
    Exact12V14SourceOrderBankError,
    build_source_order_bank,
    snapshot_source_order_bank,
)
from .sat_encoding import CoverInstance

SOURCE_ORDER_CERTIFICATE_KIND = "source_order_positive_coverage"
SOURCE_ORDER_DETECTOR_STAGE = "source-order-positive-coverage"
SOURCE_ORDER_INSTALLATION_SCHEMA = (
    "p97_rigid221_exact12_source_order_positive_bank_installation.v2"
)
_SOURCE_ORDER_INSTALLATION_ATTRIBUTE = (
    "_proof_backed_source_order_bank_installation"
)


class Exact12V14OrderedCutAdapterError(ValueError):
    """A proof-backed source-order certificate failed typed admission."""


@dataclass(frozen=True)
class AdmittedCut:
    """One certificate after family-specific replay and clause compilation."""

    certificate_kind: str
    certificate_schema: str
    detector_stage: str
    certificate: dict[str, Any]
    learned_clause: tuple[int, ...]
    bank_index: int | None = None


@dataclass(frozen=True)
class _PreparedSourceOrderEntry:
    bank_index: int
    certificate_schema: str
    certificate_payload: bytes
    learned_clause: tuple[int, ...]
    required_variables: frozenset[int]


_PREPARED_SOURCE_ORDER_BANK_TOKEN = object()


@dataclass(frozen=True)
class PreparedSourceOrderBank:
    """One fully authenticated bank compiled for one exact SAT instance."""

    _token: object
    _instance: CoverInstance
    _snapshot_payload: bytes
    bank_sha256: str
    base_n_variables: int
    base_n_clauses: int
    base_cnf_sha256: str
    entries: tuple[_PreparedSourceOrderEntry, ...]

    def snapshot(self) -> dict[str, Any]:
        """Return a detached strict-JSON copy of the authenticated snapshot."""

        snapshot = json.loads(self._snapshot_payload)
        if not isinstance(snapshot, dict):  # pragma: no cover - constructor invariant
            raise Exact12V14OrderedCutAdapterError(
                "prepared source-order bank snapshot is malformed"
            )
        return snapshot


def _sha256_json(payload: Any) -> str:
    return hashlib.sha256(
        json.dumps(
            payload,
            sort_keys=True,
            separators=(",", ":"),
            allow_nan=False,
        ).encode("utf-8")
    ).hexdigest()


def _cnf_sha256(instance: CoverInstance) -> str:
    return hashlib.sha256(instance.dimacs().encode("ascii")).hexdigest()


def _prepared_bank_clauses(
    prepared: PreparedSourceOrderBank,
) -> tuple[tuple[int, ...], ...]:
    if prepared._token is not _PREPARED_SOURCE_ORDER_BANK_TOKEN:
        raise Exact12V14OrderedCutAdapterError(
            "prepared source-order bank token is invalid"
        )
    clauses = tuple(entry.learned_clause for entry in prepared.entries)
    if not clauses or len(clauses) != len(set(clauses)):
        raise Exact12V14OrderedCutAdapterError(
            "prepared source-order bank clauses are empty or duplicated"
        )
    return clauses


def install_prepared_source_order_bank(
    instance: CoverInstance, prepared: PreparedSourceOrderBank
) -> dict[str, Any]:
    """Append one authenticated bank exactly once to its prepared SAT instance."""

    if prepared._instance is not instance:
        raise Exact12V14OrderedCutAdapterError(
            "prepared source-order bank belongs to a different SAT instance"
        )
    if hasattr(instance, _SOURCE_ORDER_INSTALLATION_ATTRIBUTE):
        raise Exact12V14OrderedCutAdapterError(
            "proof-backed source-order bank is already installed"
        )
    clauses = _prepared_bank_clauses(prepared)
    if (
        instance.cnf.n_variables != prepared.base_n_variables
        or len(instance.cnf.clauses) != prepared.base_n_clauses
        or _cnf_sha256(instance) != prepared.base_cnf_sha256
    ):
        raise Exact12V14OrderedCutAdapterError(
            "SAT instance changed after source-order bank preparation"
        )
    existing = set(instance.cnf.clauses)
    if any(clause in existing for clause in clauses):
        raise Exact12V14OrderedCutAdapterError(
            "proof-backed source-order clause already occurs in the base formula"
        )
    final_instance = copy.deepcopy(instance)
    for clause in clauses:
        final_instance.cnf.add_clause(clause)
    suffix_sha256 = _sha256_json([list(clause) for clause in clauses])
    body = {
        "schema": SOURCE_ORDER_INSTALLATION_SCHEMA,
        "bank_sha256": prepared.bank_sha256,
        "base_n_variables": prepared.base_n_variables,
        "base_n_clauses": prepared.base_n_clauses,
        "base_cnf_sha256": prepared.base_cnf_sha256,
        "suffix_n_clauses": len(clauses),
        "suffix_sha256": suffix_sha256,
        "final_n_variables": final_instance.cnf.n_variables,
        "final_n_clauses": len(final_instance.cnf.clauses),
        "final_cnf_sha256": _cnf_sha256(final_instance),
    }
    installation = {**body, "installation_sha256": _sha256_json(body)}
    original_clauses = instance.cnf.clauses
    marker_installed = False
    try:
        instance.cnf.clauses = list(final_instance.cnf.clauses)
        setattr(
            instance,
            _SOURCE_ORDER_INSTALLATION_ATTRIBUTE,
            copy.deepcopy(installation),
        )
        marker_installed = True
        return attest_prepared_source_order_bank_installed(instance, prepared)
    except BaseException as exc:  # the mutation is transactional even on interruption
        try:
            instance.cnf.clauses = original_clauses
            if marker_installed:
                delattr(instance, _SOURCE_ORDER_INSTALLATION_ATTRIBUTE)
        except (AttributeError, TypeError) as rollback_exc:  # pragma: no cover
            exc.add_note(f"source-order installation rollback also failed: {rollback_exc!r}")
        raise


def attest_prepared_source_order_bank_installed(
    instance: CoverInstance, prepared: PreparedSourceOrderBank
) -> dict[str, Any]:
    """Recheck the exact eager-bank suffix and its pre/post formula hashes."""

    if prepared._instance is not instance:
        raise Exact12V14OrderedCutAdapterError(
            "prepared source-order bank belongs to a different SAT instance"
        )
    clauses = _prepared_bank_clauses(prepared)
    installation = getattr(instance, _SOURCE_ORDER_INSTALLATION_ATTRIBUTE, None)
    expected_fields = {
        "schema",
        "bank_sha256",
        "base_n_variables",
        "base_n_clauses",
        "base_cnf_sha256",
        "suffix_n_clauses",
        "suffix_sha256",
        "final_n_variables",
        "final_n_clauses",
        "final_cnf_sha256",
        "installation_sha256",
    }
    if not isinstance(installation, Mapping) or set(installation) != expected_fields:
        raise Exact12V14OrderedCutAdapterError(
            "proof-backed source-order bank installation metadata is malformed"
        )
    base_n_variables = installation["base_n_variables"]
    base_n_clauses = installation["base_n_clauses"]
    suffix_n_clauses = installation["suffix_n_clauses"]
    final_n_variables = installation["final_n_variables"]
    final_n_clauses = installation["final_n_clauses"]
    if (
        installation["schema"] != SOURCE_ORDER_INSTALLATION_SCHEMA
        or installation["bank_sha256"] != prepared.bank_sha256
        or type(base_n_variables) is not int
        or base_n_variables != prepared.base_n_variables
        or base_n_variables != instance.cnf.n_variables
        or isinstance(base_n_clauses, bool)
        or not isinstance(base_n_clauses, int)
        or base_n_clauses != prepared.base_n_clauses
        or isinstance(suffix_n_clauses, bool)
        or not isinstance(suffix_n_clauses, int)
        or suffix_n_clauses != len(clauses)
        or isinstance(final_n_clauses, bool)
        or not isinstance(final_n_clauses, int)
        or final_n_clauses != len(instance.cnf.clauses)
        or type(final_n_variables) is not int
        or final_n_variables != instance.cnf.n_variables
        or base_n_clauses + len(clauses) != len(instance.cnf.clauses)
    ):
        raise Exact12V14OrderedCutAdapterError(
            "proof-backed source-order bank installation metadata drifted"
        )
    prefix = tuple(instance.cnf.clauses[:base_n_clauses])
    suffix = tuple(instance.cnf.clauses[base_n_clauses:])
    if suffix != clauses or any(clause in prefix for clause in clauses):
        raise Exact12V14OrderedCutAdapterError(
            "proof-backed source-order bank is not the exact unique CNF suffix"
        )
    base_instance = copy.deepcopy(instance)
    base_instance.cnf.clauses = list(prefix)
    body = dict(installation)
    claimed_installation_sha256 = body.pop("installation_sha256")
    if (
        installation["base_cnf_sha256"] != prepared.base_cnf_sha256
        or installation["base_cnf_sha256"] != _cnf_sha256(base_instance)
        or installation["suffix_sha256"]
        != _sha256_json([list(clause) for clause in clauses])
        or installation["final_cnf_sha256"] != _cnf_sha256(instance)
        or claimed_installation_sha256 != _sha256_json(body)
    ):
        raise Exact12V14OrderedCutAdapterError(
            "proof-backed source-order bank installation hashes drifted"
        )
    return copy.deepcopy(dict(installation))


def _cube_payload(
    cube: Mapping[int | str, Collection[int]], *, cardinality: int = 12
) -> dict[str, list[int]]:
    if not isinstance(cube, Mapping):
        raise Exact12V14OrderedCutAdapterError("source-order cube is malformed")
    keys = tuple(cube)
    integer_keys = set(range(cardinality))
    string_keys = {str(center) for center in range(cardinality)}
    if all(type(key) is int for key in keys) and set(keys) == integer_keys:
        rows = (cube[center] for center in range(cardinality))
    elif all(type(key) is str for key in keys) and set(keys) == string_keys:
        rows = (cube[str(center)] for center in range(cardinality))
    else:
        raise Exact12V14OrderedCutAdapterError(
            "source-order cube must contain every center exactly once"
        )
    payload: dict[str, list[int]] = {}
    for center, support in enumerate(rows):
        if isinstance(support, (str, bytes)):
            raise Exact12V14OrderedCutAdapterError(
                "source-order cube support is malformed"
            )
        try:
            normalized = sorted(support)
        except TypeError as exc:
            raise Exact12V14OrderedCutAdapterError(
                "source-order cube support is malformed"
            ) from exc
        if (
            any(
                isinstance(point, bool)
                or not isinstance(point, int)
                or point < 0
                or point >= cardinality
                for point in normalized
            )
            or len(normalized) != len(set(normalized))
            or center in normalized
        ):
            raise Exact12V14OrderedCutAdapterError(
                "source-order cube support is malformed"
            )
        payload[str(center)] = normalized
    return payload


def prepare_proof_backed_source_order_bank(
    instance: CoverInstance, source_order_bank: Mapping[str, Any]
) -> PreparedSourceOrderBank:
    """Authenticate and compile one immutable bank for repeated exact matching."""

    try:
        bank = snapshot_source_order_bank(instance, source_order_bank)
    except (Exact12V14OrderedCoverageError, Exact12V14SourceOrderBankError) as exc:
        raise Exact12V14OrderedCutAdapterError(str(exc)) from exc
    entries = bank.get("entries")
    if not isinstance(entries, list) or not entries:
        raise Exact12V14OrderedCutAdapterError(
            "proof-backed source-order bank has no entries"
        )
    prepared_entries: list[_PreparedSourceOrderEntry] = []
    seen_indices: set[int] = set()
    for entry in entries:
        if not isinstance(entry, Mapping):
            raise Exact12V14OrderedCutAdapterError(
                "proof-backed source-order bank entry is malformed"
            )
        bank_index = entry.get("index")
        if (
            isinstance(bank_index, bool)
            or not isinstance(bank_index, int)
            or bank_index < 0
            or bank_index in seen_indices
        ):
            raise Exact12V14OrderedCutAdapterError(
                "proof-backed source-order bank indices are not unique nonnegative integers"
            )
        seen_indices.add(bank_index)
        certificate_kind = entry.get("certificate_kind")
        certificate = entry.get("certificate")
        certificate_schema = entry.get("certificate_schema")
        learned_clause = entry.get("learned_clause")
        lean_choice_variables = entry.get("lean_choice_variables")
        if (
            certificate_kind != SOURCE_ORDER_CERTIFICATE_KIND
            or not isinstance(certificate, Mapping)
            or not isinstance(certificate_schema, str)
            or certificate.get("schema") != certificate_schema
            or not isinstance(learned_clause, list)
            or any(
                isinstance(literal, bool) or not isinstance(literal, int)
                for literal in learned_clause
            )
            or not isinstance(lean_choice_variables, list)
            or any(
                isinstance(variable, bool)
                or not isinstance(variable, int)
                or variable <= 0
                or variable > instance.cnf.n_variables
                for variable in lean_choice_variables
            )
            or len(lean_choice_variables) != len(set(lean_choice_variables))
        ):
            raise Exact12V14OrderedCutAdapterError(
                "proof-backed source-order bank payload is malformed"
            )
        try:
            compiled_clause = learned_clause_for_proof_backed_ordered_coverage(
                instance, certificate
            )
        except Exact12V14OrderedCoverageError as exc:
            raise Exact12V14OrderedCutAdapterError(str(exc)) from exc
        if (
            not compiled_clause
            or tuple(learned_clause) != compiled_clause
            or tuple(-variable for variable in lean_choice_variables) != compiled_clause
            or any(
                literal >= 0 or -literal > instance.cnf.n_variables
                for literal in compiled_clause
            )
            or len(compiled_clause) != len(set(compiled_clause))
        ):
            raise Exact12V14OrderedCutAdapterError(
                "proof-backed source-order learned clause failed exact recompilation"
            )
        prepared_entries.append(
            _PreparedSourceOrderEntry(
                bank_index=bank_index,
                certificate_schema=certificate_schema,
                certificate_payload=json.dumps(
                    certificate,
                    sort_keys=True,
                    separators=(",", ":"),
                    allow_nan=False,
                ).encode("utf-8"),
                learned_clause=compiled_clause,
                required_variables=frozenset(-literal for literal in compiled_clause),
            )
        )
    snapshot_payload = json.dumps(
        bank, sort_keys=True, separators=(",", ":"), allow_nan=False
    ).encode("utf-8")
    return PreparedSourceOrderBank(
        _token=_PREPARED_SOURCE_ORDER_BANK_TOKEN,
        _instance=instance,
        _snapshot_payload=snapshot_payload,
        bank_sha256=bank["bank_sha256"],
        base_n_variables=instance.cnf.n_variables,
        base_n_clauses=len(instance.cnf.clauses),
        base_cnf_sha256=_cnf_sha256(instance),
        entries=tuple(sorted(prepared_entries, key=lambda entry: entry.bank_index)),
    )


def clone_installed_source_order_bank(
    instance: CoverInstance, prepared: PreparedSourceOrderBank
) -> tuple[CoverInstance, PreparedSourceOrderBank]:
    """Rebuild one independently attested installed copy for transactional replay."""

    installation = attest_prepared_source_order_bank_installed(instance, prepared)
    base_n_clauses = installation["base_n_clauses"]
    clone = copy.deepcopy(instance)
    clone.cnf.clauses = list(clone.cnf.clauses[:base_n_clauses])
    if hasattr(clone, _SOURCE_ORDER_INSTALLATION_ATTRIBUTE):
        delattr(clone, _SOURCE_ORDER_INSTALLATION_ATTRIBUTE)
    rebound = prepare_proof_backed_source_order_bank(clone, prepared.snapshot())
    rebound_installation = install_prepared_source_order_bank(clone, rebound)
    if (
        rebound.snapshot() != prepared.snapshot()
        or rebound_installation != installation
        or _cnf_sha256(clone) != _cnf_sha256(instance)
    ):
        raise Exact12V14OrderedCutAdapterError(
            "independent source-order installation clone drifted"
        )
    return clone, rebound


def detect_proof_backed_source_order_cut(
    repo_root: Path | None,
    instance: CoverInstance,
    cube: Mapping[int | str, Collection[int]],
    *,
    source_order_bank: Mapping[str, Any] | PreparedSourceOrderBank | None = None,
) -> AdmittedCut | None:
    """Admit each authenticated bank cut falsified by the current assignment."""

    payload = _cube_payload(cube, cardinality=instance.model.cardinality)
    if isinstance(source_order_bank, PreparedSourceOrderBank):
        prepared = source_order_bank
        if (
            prepared._token is not _PREPARED_SOURCE_ORDER_BANK_TOKEN
            or prepared._instance is not instance
        ):
            raise Exact12V14OrderedCutAdapterError(
                "prepared source-order bank belongs to a different SAT instance"
            )
    else:
        if source_order_bank is None:
            if repo_root is None:
                raise Exact12V14OrderedCutAdapterError(
                    "source-order replay requires a repository or recompiled bank snapshot"
                )
            source_order_bank = build_source_order_bank(repo_root, instance)
        prepared = prepare_proof_backed_source_order_bank(instance, source_order_bank)
    try:
        selected_variables = {
            instance.choice_variables[
                (center, instance.candidate_index(center, payload[str(center)]))
            ]
            for center in range(instance.model.cardinality)
        }
    except (KeyError, ValueError) as exc:
        raise Exact12V14OrderedCutAdapterError(
            "source-order cube is outside the bound model"
        ) from exc
    matching = next(
        (
            entry
            for entry in prepared.entries
            if entry.required_variables <= selected_variables
        ),
        None,
    )
    if matching is None:
        return None
    certificate = json.loads(matching.certificate_payload)
    if not isinstance(certificate, dict):  # pragma: no cover - constructor invariant
        raise Exact12V14OrderedCutAdapterError(
            "prepared source-order certificate is malformed"
        )
    return AdmittedCut(
        certificate_kind=SOURCE_ORDER_CERTIFICATE_KIND,
        certificate_schema=matching.certificate_schema,
        detector_stage=SOURCE_ORDER_DETECTOR_STAGE,
        certificate=certificate,
        learned_clause=matching.learned_clause,
        bank_index=matching.bank_index,
    )


def replay_proof_backed_source_order_cut(
    repo_root: Path | None,
    instance: CoverInstance,
    cube: Mapping[int | str, Collection[int]],
    *,
    certificate_schema: str,
    detector_stage: str,
    certificate: Mapping[str, Any],
    bank_index: int | None = None,
    source_order_bank: Mapping[str, Any] | PreparedSourceOrderBank | None = None,
) -> tuple[int, ...]:
    """Recompile the bank snapshot and require equality with the recorded cut."""

    admitted = detect_proof_backed_source_order_cut(
        repo_root,
        instance,
        cube,
        source_order_bank=source_order_bank,
    )
    if admitted is None:
        raise Exact12V14OrderedCutAdapterError(
            "recorded cube has no proof-backed source-order cut"
        )
    if (
        bank_index != admitted.bank_index
        or certificate_schema != admitted.certificate_schema
        or detector_stage != admitted.detector_stage
        or dict(certificate) != admitted.certificate
    ):
        raise Exact12V14OrderedCutAdapterError(
            "recorded source-order bank index or certificate failed exact bank replay"
        )
    return admitted.learned_clause
