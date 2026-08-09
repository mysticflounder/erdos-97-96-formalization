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


def _cube_payload(
    cube: Mapping[int | str, Collection[int]], *, cardinality: int = 12
) -> dict[str, list[int]]:
    if not isinstance(cube, Mapping):
        raise Exact12V14OrderedCutAdapterError("source-order cube is malformed")
    integer_keys = set(range(cardinality))
    string_keys = {str(center) for center in range(cardinality)}
    if set(cube) == integer_keys:
        rows = (cube[center] for center in range(cardinality))
    elif set(cube) == string_keys:
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


def detect_proof_backed_source_order_cut(
    repo_root: Path | None,
    instance: CoverInstance,
    cube: Mapping[int | str, Collection[int]],
    *,
    source_order_bank: Mapping[str, Any] | None = None,
) -> AdmittedCut | None:
    """Admit each recompiled bank cut falsified by the current assignment."""

    payload = _cube_payload(cube, cardinality=instance.model.cardinality)
    try:
        if source_order_bank is None:
            if repo_root is None:
                raise Exact12V14OrderedCutAdapterError(
                    "source-order replay requires a repository or recompiled bank snapshot"
                )
            source_order_bank = build_source_order_bank(repo_root, instance)
        bank: Mapping[str, Any] = snapshot_source_order_bank(
            instance, source_order_bank
        )
    except (Exact12V14OrderedCoverageError, Exact12V14SourceOrderBankError) as exc:
        raise Exact12V14OrderedCutAdapterError(str(exc)) from exc
    entries = bank.get("entries")
    if not isinstance(entries, list) or not entries:
        raise Exact12V14OrderedCutAdapterError(
            "proof-backed source-order bank has no entries"
        )
    selected_variables: set[int] = set()
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

    normalized_entries: list[tuple[int, Mapping[str, Any]]] = []
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
        normalized_entries.append((bank_index, entry))

    matches: list[
        tuple[int, Mapping[str, Any], tuple[int, ...], str, dict[str, Any]]
    ] = []
    for bank_index, entry in normalized_entries:
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
        if all(-literal in selected_variables for literal in compiled_clause):
            matches.append(
                (
                    bank_index,
                    entry,
                    compiled_clause,
                    certificate_schema,
                    copy.deepcopy(dict(certificate)),
                )
            )
    if not matches:
        return None
    bank_index, _entry, compiled_clause, certificate_schema, certificate = min(
        matches, key=lambda match: match[0]
    )
    return AdmittedCut(
        certificate_kind=SOURCE_ORDER_CERTIFICATE_KIND,
        certificate_schema=certificate_schema,
        detector_stage=SOURCE_ORDER_DETECTOR_STAGE,
        certificate=copy.deepcopy(dict(certificate)),
        learned_clause=compiled_clause,
        bank_index=bank_index,
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
    source_order_bank: Mapping[str, Any] | None = None,
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
