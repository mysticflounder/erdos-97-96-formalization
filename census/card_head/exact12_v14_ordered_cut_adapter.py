# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Typed admission for the proof-backed exact-12 source-order cut.

The ordered-coverage detector is broader than the theorem-backed bank.  This
adapter admits only a certificate that is byte-for-byte equal to the single
current bank entry, whose generated Lean sources are freshly authenticated by
``build_source_order_bank``.  It deliberately has no structural-certificate
fallback; the mixed-journal dispatcher owns that separate certificate family.
"""

from __future__ import annotations

import copy
from collections.abc import Collection, Mapping
from dataclasses import dataclass
from pathlib import Path
from typing import Any

from .exact12_v14_ordered_coverage import (
    FROZEN_V8_CUBE,
    Exact12V14OrderedCoverageError,
    learned_clause_for_proof_backed_ordered_coverage,
)
from .exact12_v14_source_order_bank import (
    Exact12V14SourceOrderBankError,
    build_source_order_bank,
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
    repo_root: Path,
    instance: CoverInstance,
    cube: Mapping[int | str, Collection[int]],
) -> AdmittedCut | None:
    """Admit the frozen cut only after a fresh theorem-backed bank rebuild."""

    payload = _cube_payload(cube, cardinality=instance.model.cardinality)
    if payload != FROZEN_V8_CUBE:
        return None
    try:
        bank = build_source_order_bank(repo_root, instance)
    except (Exact12V14OrderedCoverageError, Exact12V14SourceOrderBankError) as exc:
        raise Exact12V14OrderedCutAdapterError(str(exc)) from exc
    entries = bank.get("entries")
    if not isinstance(entries, list) or len(entries) != 1:
        raise Exact12V14OrderedCutAdapterError(
            "proof-backed source-order bank is not singleton"
        )
    entry = entries[0]
    if (
        not isinstance(entry, Mapping)
        or entry.get("certificate_kind") != SOURCE_ORDER_CERTIFICATE_KIND
        or entry.get("witness_cube") != payload
    ):
        raise Exact12V14OrderedCutAdapterError(
            "proof-backed source-order bank entry is malformed"
        )
    certificate = entry.get("certificate")
    certificate_schema = entry.get("certificate_schema")
    learned_clause = entry.get("learned_clause")
    if (
        not isinstance(certificate, Mapping)
        or not isinstance(certificate_schema, str)
        or certificate.get("schema") != certificate_schema
        or not isinstance(learned_clause, list)
        or any(
            isinstance(literal, bool) or not isinstance(literal, int)
            for literal in learned_clause
        )
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
        or any(
            literal >= 0 or -literal > instance.cnf.n_variables
            for literal in compiled_clause
        )
        or len(compiled_clause) != len(set(compiled_clause))
    ):
        raise Exact12V14OrderedCutAdapterError(
            "proof-backed source-order learned clause failed exact recompilation"
        )
    return AdmittedCut(
        certificate_kind=SOURCE_ORDER_CERTIFICATE_KIND,
        certificate_schema=certificate_schema,
        detector_stage=SOURCE_ORDER_DETECTOR_STAGE,
        certificate=copy.deepcopy(dict(certificate)),
        learned_clause=compiled_clause,
    )


def replay_proof_backed_source_order_cut(
    repo_root: Path,
    instance: CoverInstance,
    cube: Mapping[int | str, Collection[int]],
    *,
    certificate_schema: str,
    detector_stage: str,
    certificate: Mapping[str, Any],
) -> tuple[int, ...]:
    """Rebuild the bank and require exact equality with the recorded cut."""

    admitted = detect_proof_backed_source_order_cut(repo_root, instance, cube)
    if admitted is None:
        raise Exact12V14OrderedCutAdapterError(
            "recorded cube has no proof-backed source-order cut"
        )
    if (
        certificate_schema != admitted.certificate_schema
        or detector_stage != admitted.detector_stage
        or dict(certificate) != admitted.certificate
    ):
        raise Exact12V14OrderedCutAdapterError(
            "recorded source-order certificate failed exact bank replay"
        )
    return admitted.learned_clause
