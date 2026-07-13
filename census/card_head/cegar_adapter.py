"""Fail-closed boundary between AHEAD mining proposals and durable state.

Mining and CAS processes are untrusted proposal generators.  This module
accepts one SAT-witness iteration only when the source cube passes the
independent permanent constraints, every proposed pattern occurs in that cube,
every profile orbit remains candidate-compatible, and every certificate passes
the exact rational verifier in :mod:`census.card_head.pattern_certificate`.

Publication is intentionally separate.  A prepared iteration contains the
fully checked inputs needed by the transactional bank writer; it is not itself
a bank commit, finite cover, or geometric closure result.
"""

from __future__ import annotations

import hashlib
import json
import math
from collections.abc import Collection, Mapping, Sequence
from dataclasses import dataclass
from pathlib import Path
from typing import Any

from .candidate_surface import build_model, candidate_classes, cube_ok
from .historical_bank import (
    canonical_pattern_key,
    normalize_pattern,
    pattern_orbit,
    window_shape_canon,
)
from .pattern_certificate import CertificateError, verify_pattern_certificate
from .run_manifest import json_sha256, validate_manifest


PROPOSAL_SCHEMA = "p97_ahead_cegar_iteration_proposal.v1"
PREPARED_SCHEMA = "p97_ahead_cegar_prepared_iteration.v1"
PREPARED_SCOPE = (
    "Prepared exact-certificate iteration within one finite candidate-class "
    "abstraction; not a bank commit, finite cover, or geometric theorem"
)


class CegarAdapterError(ValueError):
    """A mining proposal cannot cross the permanent certification boundary."""


def _canonical_bytes(value: Any) -> bytes:
    try:
        encoded = json.dumps(
            value,
            sort_keys=True,
            separators=(",", ":"),
            allow_nan=False,
        )
    except (TypeError, ValueError) as exc:
        raise CegarAdapterError("proposal is not finite JSON data") from exc
    return encoded.encode("utf-8")


def _require_exact_keys(
    value: Mapping[str, Any], required: set[str], description: str
) -> None:
    actual = set(value)
    missing = required - actual
    extra = actual - required
    if missing or extra:
        raise CegarAdapterError(
            f"{description} keys differ: "
            f"missing={sorted(missing)}, extra={sorted(extra)}"
        )


def _nonnegative_int(value: Any, description: str) -> int:
    if isinstance(value, bool) or not isinstance(value, int) or value < 0:
        raise CegarAdapterError(f"{description} must be a nonnegative integer")
    return value


def _nonnegative_number(value: Any, description: str) -> float:
    if (
        isinstance(value, bool)
        or not isinstance(value, (int, float))
        or not math.isfinite(value)
        or value < 0
    ):
        raise CegarAdapterError(
            f"{description} must be a finite nonnegative number"
        )
    return float(value)


def _normalize_cube(value: Any, cardinality: int) -> dict[int, list[int]]:
    if not isinstance(value, Mapping):
        raise CegarAdapterError("source_cube must be a JSON object")
    try:
        cube = {
            int(center): [int(member) for member in members]
            for center, members in value.items()
        }
    except (TypeError, ValueError) as exc:
        raise CegarAdapterError("source_cube contains noninteger labels") from exc
    if set(cube) != set(range(cardinality)):
        raise CegarAdapterError("source_cube does not contain every center exactly")
    return cube


def _contains(
    cube: Mapping[int, Collection[int]],
    pattern: Mapping[int, Collection[int]],
) -> bool:
    return all(
        center in cube and set(required) <= set(cube[center])
        for center, required in pattern.items()
    )


def _shape_key(pattern: Mapping[int, Collection[int]]) -> str:
    return json.dumps(window_shape_canon(pattern), separators=(",", ":"))


def _canonical_key_json(
    key: tuple[tuple[int, tuple[int, ...]], ...],
) -> str:
    return json.dumps(key, separators=(",", ":"))


@dataclass(frozen=True, slots=True)
class PreparedPattern:
    """One exactly verified, profile-orbit-deduplicated bank candidate."""

    pattern: dict[int, frozenset[int]]
    certificate: dict[str, Any]
    verification: dict[str, Any]
    canonical_key: tuple[tuple[int, tuple[int, ...]], ...]
    orbit: tuple[dict[int, frozenset[int]], ...]
    shape: str

    def report(self) -> dict[str, Any]:
        return {
            "pattern": {
                str(center): sorted(members)
                for center, members in sorted(self.pattern.items())
            },
            "canonical_pattern": _canonical_key_json(self.canonical_key),
            "certificate_sha256": self.verification["certificate_sha256"],
            "kill": self.verification["kill"],
            "orbit_size": len(self.orbit),
            "shape": self.shape,
        }


@dataclass(frozen=True, slots=True)
class PreparedIteration:
    """A checked iteration awaiting one transactional bank publication."""

    run_id: str
    manifest_sha256: str
    proposal_sha256: str
    iteration: int
    elapsed_seconds: float
    source_cube: dict[int, list[int]]
    min_support: int | None
    bank_rows_before: int
    shape_count_before: int
    patterns: tuple[PreparedPattern, ...]
    witness_shape_count: int
    fresh_shape_count: int

    @property
    def bank_rows_after(self) -> int:
        return self.bank_rows_before + len(self.patterns)

    @property
    def shape_count_after(self) -> int:
        return self.shape_count_before + self.fresh_shape_count

    def report(self) -> dict[str, Any]:
        return {
            "schema": PREPARED_SCHEMA,
            "status": "PREPARED_EXACT_CERTIFICATES_NOT_PUBLISHED",
            "run_id": self.run_id,
            "manifest_sha256": self.manifest_sha256,
            "proposal_sha256": self.proposal_sha256,
            "iteration": self.iteration,
            "elapsed_seconds": self.elapsed_seconds,
            "min_support": self.min_support,
            "bank_rows_before": self.bank_rows_before,
            "bank_rows_after": self.bank_rows_after,
            "shape_count_before": self.shape_count_before,
            "shape_count_after": self.shape_count_after,
            "witness_shape_count": self.witness_shape_count,
            "fresh_shape_count": self.fresh_shape_count,
            "patterns": [pattern.report() for pattern in self.patterns],
            "scope": PREPARED_SCOPE,
        }


def _existing_bank_state(
    model,
    bank_rows: Sequence[Mapping[str, Any]],
) -> tuple[
    set[tuple[tuple[int, tuple[int, ...]], ...]],
    set[str],
    list[dict[int, frozenset[int]]],
]:
    canonical_keys: set[tuple[tuple[int, tuple[int, ...]], ...]] = set()
    shapes: set[str] = set()
    instances: list[dict[int, frozenset[int]]] = []
    for index, row in enumerate(bank_rows):
        if not isinstance(row, Mapping) or "pattern" not in row:
            raise CegarAdapterError(f"bank row {index} has no pattern")
        pattern = normalize_pattern(model, row["pattern"])
        canonical = canonical_pattern_key(model, pattern)
        if canonical in canonical_keys:
            raise CegarAdapterError("bank snapshot contains duplicate raw orbits")
        canonical_keys.add(canonical)
        shapes.add(_shape_key(pattern))
        instances.extend(pattern_orbit(model, pattern))
    return canonical_keys, shapes, instances


def _orbit_is_candidate_compatible(model, orbit) -> bool:
    candidate_rows = {
        center: tuple(frozenset(row) for row in candidate_classes(model, center))
        for center in range(model.cardinality)
    }
    return all(
        all(
            any(set(required) <= candidate for candidate in candidate_rows[center])
            for center, required in image.items()
        )
        for image in orbit
    )


def prepare_iteration(
    manifest_value: Mapping[str, Any],
    proposal: Mapping[str, Any],
    *,
    bank_rows: Sequence[Mapping[str, Any]],
) -> PreparedIteration:
    """Validate one untrusted mining proposal without publishing artifacts."""

    manifest = validate_manifest(manifest_value)
    if not isinstance(proposal, Mapping):
        raise CegarAdapterError("iteration proposal must be a JSON object")
    _require_exact_keys(
        proposal,
        {
            "schema",
            "run_id",
            "manifest_sha256",
            "iteration",
            "elapsed_seconds",
            "source_cube",
            "min_support",
            "patterns",
        },
        "iteration proposal",
    )
    if proposal["schema"] != PROPOSAL_SCHEMA:
        raise CegarAdapterError(f"proposal schema must be {PROPOSAL_SCHEMA}")
    if proposal["run_id"] != manifest["run_id"]:
        raise CegarAdapterError("proposal run_id differs from the manifest")
    manifest_digest = json_sha256(manifest)
    if proposal["manifest_sha256"] != manifest_digest:
        raise CegarAdapterError("proposal manifest digest differs from the manifest")
    iteration = _nonnegative_int(proposal["iteration"], "iteration")
    elapsed_seconds = _nonnegative_number(
        proposal["elapsed_seconds"], "elapsed_seconds"
    )
    min_support = proposal["min_support"]
    if min_support is not None:
        if (
            isinstance(min_support, bool)
            or not isinstance(min_support, int)
            or not 4 <= min_support <= manifest["cardinality"]
        ):
            raise CegarAdapterError("min_support must be null or between 4 and n")
    raw_patterns = proposal["patterns"]
    if not isinstance(raw_patterns, list) or not raw_patterns:
        raise CegarAdapterError("proposal must contain at least one certified pattern")

    model = build_model(manifest["cardinality"], manifest["profile"])
    source_cube = _normalize_cube(proposal["source_cube"], model.cardinality)
    if not cube_ok(model, source_cube):
        raise CegarAdapterError("source_cube fails independent cube_ok")
    existing_keys, existing_shapes, existing_instances = _existing_bank_state(
        model, bank_rows
    )
    if any(_contains(source_cube, instance) for instance in existing_instances):
        raise CegarAdapterError("source_cube contains an already banked orbit instance")

    prepared: list[PreparedPattern] = []
    proposed_keys: set[tuple[tuple[int, tuple[int, ...]], ...]] = set()
    witness_shapes: set[str] = set()
    for index, raw_pattern in enumerate(raw_patterns):
        if not isinstance(raw_pattern, Mapping):
            raise CegarAdapterError(f"proposed pattern {index} is not an object")
        _require_exact_keys(
            raw_pattern,
            {"pattern", "certificate"},
            f"proposed pattern {index}",
        )
        pattern = normalize_pattern(model, raw_pattern["pattern"])
        if not _contains(source_cube, pattern):
            raise CegarAdapterError(
                f"proposed pattern {index} is absent from source_cube"
            )
        canonical = canonical_pattern_key(model, pattern)
        if canonical in existing_keys:
            raise CegarAdapterError(
                f"proposed pattern {index} duplicates the bank snapshot"
            )
        if canonical in proposed_keys:
            raise CegarAdapterError(
                f"proposed pattern {index} repeats a proposal raw orbit"
            )
        proposed_keys.add(canonical)
        orbit = pattern_orbit(model, pattern)
        if not _orbit_is_candidate_compatible(model, orbit):
            raise CegarAdapterError(
                f"proposed pattern {index} has a noncandidate orbit image"
            )
        certificate = raw_pattern["certificate"]
        if not isinstance(certificate, Mapping):
            raise CegarAdapterError(
                f"proposed pattern {index} certificate is not an object"
            )
        try:
            verification = verify_pattern_certificate(model, pattern, certificate)
        except CertificateError as exc:
            raise CegarAdapterError(
                f"proposed pattern {index} certificate failed: {exc}"
            ) from exc
        shape = _shape_key(pattern)
        witness_shapes.add(shape)
        prepared.append(
            PreparedPattern(
                pattern=pattern,
                certificate=json.loads(_canonical_bytes(certificate)),
                verification=verification,
                canonical_key=canonical,
                orbit=orbit,
                shape=shape,
            )
        )

    fresh_shapes = witness_shapes - existing_shapes
    return PreparedIteration(
        run_id=manifest["run_id"],
        manifest_sha256=manifest_digest,
        proposal_sha256=hashlib.sha256(_canonical_bytes(proposal)).hexdigest(),
        iteration=iteration,
        elapsed_seconds=elapsed_seconds,
        source_cube=source_cube,
        min_support=min_support,
        bank_rows_before=len(bank_rows),
        shape_count_before=len(existing_shapes),
        patterns=tuple(prepared),
        witness_shape_count=len(witness_shapes),
        fresh_shape_count=len(fresh_shapes),
    )


def load_proposal(path: Path) -> dict[str, Any]:
    """Load one proposal file as an object for CLI or runner integration."""

    try:
        value = json.loads(path.read_text(encoding="utf-8"))
    except (OSError, json.JSONDecodeError) as exc:
        raise CegarAdapterError(f"cannot read proposal {path}: {exc}") from exc
    if not isinstance(value, dict):
        raise CegarAdapterError("proposal file must contain a JSON object")
    return value
