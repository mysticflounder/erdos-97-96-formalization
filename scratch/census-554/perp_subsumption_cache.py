#!/usr/bin/env python3
"""Build and validate the pinned Census-554 perpendicular-core cache."""

from __future__ import annotations

import hashlib
import json
from pathlib import Path
from typing import Any, Iterable, Mapping


SCHEMA = "census554_perp_subsumption_cache.v1"
SNAPSHOT = "perp_subsumption_cache.json"
STAGE = "equality-perpendicular-bisector-convex"
POLICY = "replace-perp-subsumed-bank-motifs-with-minimized-core-v2-cached"


class CacheError(RuntimeError):
    """The replacement cache failed a generation or replay invariant."""


def canonical_bytes(value: Any) -> bytes:
    try:
        return (
            json.dumps(value, sort_keys=True, indent=2, allow_nan=False).encode(
                "utf-8"
            )
            + b"\n"
        )
    except (TypeError, ValueError) as exc:
        raise CacheError("cache value is not canonical-JSON compatible") from exc


def _canonical_hash(value: Any) -> str:
    try:
        raw = json.dumps(
            value, sort_keys=True, separators=(",", ":"), allow_nan=False
        ).encode("utf-8")
    except (TypeError, ValueError) as exc:
        raise CacheError("cache inventory is not canonical-JSON compatible") from exc
    return hashlib.sha256(raw).hexdigest()


def _sha256_file(path: Path) -> str:
    digest = hashlib.sha256()
    with open(path, "rb") as handle:
        for chunk in iter(lambda: handle.read(1 << 20), b""):
            digest.update(chunk)
    return digest.hexdigest()


def _json_pattern(pattern: Mapping[int, Iterable[int]]) -> dict[str, list[int]]:
    return {
        str(center): sorted(int(member) for member in members)
        for center, members in sorted(pattern.items())
    }


def _native_pattern(pattern: Mapping[str | int, Iterable[int]]):
    try:
        return {
            int(center): frozenset(int(member) for member in members)
            for center, members in pattern.items()
        }
    except (AttributeError, TypeError, ValueError) as exc:
        raise CacheError("cache contains a malformed pattern") from exc


def _expect_keys(value: Mapping[str, Any], expected: set[str], what: str) -> None:
    if set(value) != expected:
        raise CacheError(f"{what} has an unexpected schema")


def _runtime_contract(base) -> dict[str, str]:
    return {
        "automorphisms_sha256": _canonical_hash(
            base.combinatorics.AUTOMORPHISMS
        ),
        "combinatorics_source_sha256": _sha256_file(
            Path(base.combinatorics.__file__).resolve()
        ),
        "formalized_oracle_source_sha256": _sha256_file(
            Path(base.formalized_structural_oracle.__file__).resolve()
        ),
    }


def _detector_contract(base) -> dict[str, str]:
    family = base.formalized_structural_oracle.FAMILY_BY_STAGE[STAGE]
    return {
        "family_id": family.family_id,
        "stage": STAGE,
        "theorem_id": family.theorem_id,
        "theorem_source": family.theorem_source,
        "theorem_source_sha256": (
            base.formalized_structural_oracle.THEOREM_SOURCE_SHA256[
                family.theorem_source
            ]
        ),
    }


def build_cache_artifact(base, bank_path: Path) -> dict[str, Any]:
    """Compute the complete targeted replacement and orbit inventories."""

    bank_path = bank_path.resolve()
    bank_rows, bank_raw = base.read_frozen_bank(bank_path)
    bank_sha256 = hashlib.sha256(bank_raw).hexdigest()
    family = base.formalized_structural_oracle.FAMILY_BY_STAGE[STAGE]
    original_images = set()
    effective_images = set()
    replacements = []
    source_keys = set()

    for row_index, row in enumerate(bank_rows):
        pattern = base._native_pattern(row["pattern"])
        serialized = base.combinatorics.serialize_pattern(pattern)
        original_orbit = base.combinatorics.orbit_with_maps(pattern)
        original_images.update(
            base.combinatorics.serialize_pattern(image)
            for image, _mapping in original_orbit
        )
        if base.formalized_structural_oracle.detect_stage(pattern, STAGE) is None:
            effective_images.update(
                base.combinatorics.serialize_pattern(image)
                for image, _mapping in original_orbit
            )
            continue
        if serialized in source_keys:
            raise CacheError("targeted bank source pattern is duplicated")
        source_keys.add(serialized)
        minimized = base.formalized_structural_oracle.minimize_unordered_pattern(
            pattern, STAGE
        )
        detection = base.formalized_structural_oracle.build_detection(
            minimized, STAGE
        )
        if detection["family_id"] != family.family_id:
            raise CacheError("perpendicular replacement theorem drifted")
        replacement_orbit = base.combinatorics.orbit_with_maps(minimized)
        effective_images.update(
            base.combinatorics.serialize_pattern(image)
            for image, _mapping in replacement_orbit
        )
        replacements.append({
            "bank_row_index": row_index,
            "source_pattern": _json_pattern(pattern),
            "replacement_pattern": _json_pattern(minimized),
            "replacement_orbit": [
                _json_pattern(image) for image, _mapping in replacement_orbit
            ],
        })

    removed = original_images - effective_images
    added = effective_images - original_images
    source_inventory = [record["source_pattern"] for record in replacements]
    replacement_inventory = [
        record["replacement_pattern"] for record in replacements
    ]
    return {
        "schema": SCHEMA,
        "policy": POLICY,
        "bank": {
            "rows": len(bank_rows),
            "sha256": bank_sha256,
        },
        "detector_contract": _detector_contract(base),
        "runtime_contract": _runtime_contract(base),
        "counts": {
            "targeted_source_rows": len(replacements),
            "original_profile_orbit_instances": len(original_images),
            "effective_profile_orbit_instances": len(effective_images),
            "removed_original_instances": len(removed),
            "added_structural_instances": len(added),
            "net_instance_reduction": len(original_images) - len(effective_images),
        },
        "hashes": {
            "targeted_source_patterns_sha256": _canonical_hash(source_inventory),
            "replacement_patterns_sha256": _canonical_hash(
                replacement_inventory
            ),
            "ordinary_profile_orbit_sha256": _canonical_hash(
                sorted(original_images)
            ),
            "effective_profile_orbit_sha256": _canonical_hash(
                sorted(effective_images)
            ),
        },
        "replacements": replacements,
    }


def validate_cache_artifact(
    base,
    artifact: Mapping[str, Any],
    *,
    bank_rows: Iterable[Mapping[str, Any]],
    bank_sha256: str,
    expected_runtime_contract: Mapping[str, str] | None = None,
) -> dict[tuple[tuple[int, tuple[int, ...]], ...], tuple[Any, ...]]:
    """Validate pinned metadata and decode cached replacement orbits."""

    _expect_keys(
        artifact,
        {
            "schema", "policy", "bank", "detector_contract",
            "runtime_contract", "counts", "hashes", "replacements",
        },
        "cache artifact",
    )
    if artifact["schema"] != SCHEMA or artifact["policy"] != POLICY:
        raise CacheError("cache schema or policy mismatch")
    bank = artifact["bank"]
    if not isinstance(bank, Mapping):
        raise CacheError("cache bank contract is malformed")
    _expect_keys(bank, {"rows", "sha256"}, "cache bank contract")
    rows = tuple(bank_rows)
    if bank["sha256"] != bank_sha256 or bank["rows"] != len(rows):
        raise CacheError("cache does not match the exact frozen bank")
    if artifact["detector_contract"] != _detector_contract(base):
        raise CacheError("cache detector/theorem contract drifted")
    runtime_contract = (
        _runtime_contract(base)
        if expected_runtime_contract is None
        else dict(expected_runtime_contract)
    )
    if artifact["runtime_contract"] != runtime_contract:
        raise CacheError("cache combinatorics/oracle runtime contract drifted")

    counts = artifact["counts"]
    hashes = artifact["hashes"]
    replacements = artifact["replacements"]
    if not isinstance(counts, Mapping) or not isinstance(hashes, Mapping):
        raise CacheError("cache inventory metadata is malformed")
    _expect_keys(
        counts,
        {
            "targeted_source_rows", "original_profile_orbit_instances",
            "effective_profile_orbit_instances", "removed_original_instances",
            "added_structural_instances", "net_instance_reduction",
        },
        "cache counts",
    )
    _expect_keys(
        hashes,
        {
            "targeted_source_patterns_sha256", "replacement_patterns_sha256",
            "ordinary_profile_orbit_sha256", "effective_profile_orbit_sha256",
        },
        "cache hashes",
    )
    if not isinstance(replacements, list):
        raise CacheError("cache replacement inventory is not a list")
    if counts["targeted_source_rows"] != len(replacements):
        raise CacheError("cache targeted-source count mismatch")
    if (
        counts["net_instance_reduction"]
        != counts["original_profile_orbit_instances"]
        - counts["effective_profile_orbit_instances"]
    ):
        raise CacheError("cache net-reduction count mismatch")

    bank_keys = {
        base.combinatorics.serialize_pattern(base._native_pattern(row["pattern"]))
        for row in rows
    }
    decoded = {}
    source_inventory = []
    replacement_inventory = []
    for record in replacements:
        if not isinstance(record, Mapping):
            raise CacheError("cache replacement record is malformed")
        _expect_keys(
            record,
            {
                "bank_row_index", "source_pattern", "replacement_pattern",
                "replacement_orbit",
            },
            "cache replacement record",
        )
        row_index = record["bank_row_index"]
        if not isinstance(row_index, int) or isinstance(row_index, bool):
            raise CacheError("cache bank-row index is not an integer")
        if row_index < 0 or row_index >= len(rows):
            raise CacheError("cache bank-row index is out of range")
        source = _native_pattern(record["source_pattern"])
        source_key = base.combinatorics.serialize_pattern(source)
        expected_source = base.combinatorics.serialize_pattern(
            base._native_pattern(rows[row_index]["pattern"])
        )
        if source_key != expected_source or source_key not in bank_keys:
            raise CacheError("cache source does not match its frozen bank row")
        if source_key in decoded:
            raise CacheError("cache repeats a targeted source pattern")
        replacement = _native_pattern(record["replacement_pattern"])
        raw_orbit = record["replacement_orbit"]
        if not isinstance(raw_orbit, list) or not raw_orbit:
            raise CacheError("cache replacement orbit is empty or malformed")
        orbit = tuple((_native_pattern(image), {}) for image in raw_orbit)
        orbit_keys = [
            base.combinatorics.serialize_pattern(image) for image, _mapping in orbit
        ]
        if len(set(orbit_keys)) != len(orbit_keys) or orbit_keys != sorted(orbit_keys):
            raise CacheError("cache replacement orbit is not unique and ordered")
        decoded[source_key] = orbit
        source_inventory.append(_json_pattern(source))
        replacement_inventory.append(_json_pattern(replacement))

    if (
        _canonical_hash(source_inventory)
        != hashes["targeted_source_patterns_sha256"]
        or _canonical_hash(replacement_inventory)
        != hashes["replacement_patterns_sha256"]
    ):
        raise CacheError("cache compact inventory hash mismatch")
    return decoded


def snapshot_metadata(
    artifact: Mapping[str, Any], *, sha256: str
) -> dict[str, Any]:
    """Metadata that binds one run to its workdir-local cache snapshot."""

    if not isinstance(artifact, Mapping):
        raise CacheError("cache artifact is not an object")
    if not isinstance(sha256, str) or len(sha256) != 64:
        raise CacheError("cache snapshot digest is malformed")
    return {
        "schema": artifact["schema"],
        "snapshot": SNAPSHOT,
        "sha256": sha256,
        "policy": artifact["policy"],
        "bank": dict(artifact["bank"]),
        "detector_contract": dict(artifact["detector_contract"]),
        "runtime_contract": dict(artifact["runtime_contract"]),
        "counts": dict(artifact["counts"]),
        "hashes": dict(artifact["hashes"]),
    }


def load_pinned_cache(
    base,
    cache_path: Path,
    *,
    expected_sha256: str,
    bank_rows: Iterable[Mapping[str, Any]],
    bank_path: Path,
    expected_runtime_contract: Mapping[str, str] | None = None,
) -> tuple[dict[str, Any], dict[Any, tuple[Any, ...]]]:
    """Load one immutable cache and bind it to the exact bank snapshot."""

    try:
        raw = cache_path.read_bytes()
        artifact = json.loads(raw)
    except (OSError, json.JSONDecodeError) as exc:
        raise CacheError("pinned replacement cache is absent or invalid") from exc
    if hashlib.sha256(raw).hexdigest() != expected_sha256:
        raise CacheError("pinned replacement cache hash mismatch")
    if raw != canonical_bytes(artifact):
        raise CacheError("pinned replacement cache is not canonical")
    decoded = validate_cache_artifact(
        base,
        artifact,
        bank_rows=bank_rows,
        bank_sha256=_sha256_file(bank_path),
        expected_runtime_contract=expected_runtime_contract,
    )
    return dict(artifact), decoded


def write_cache_artifact(base, bank_path: Path, output: Path) -> str:
    artifact = build_cache_artifact(base, bank_path)
    raw = canonical_bytes(artifact)
    base._atomic_write_bytes(output, raw)
    return hashlib.sha256(raw).hexdigest()
