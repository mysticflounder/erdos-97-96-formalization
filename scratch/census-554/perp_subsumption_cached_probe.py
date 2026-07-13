#!/usr/bin/env python3
"""Experimental Census-554 probe using a pinned replacement-orbit cache.

The cache contains the complete minimized orbit for each frozen bank motif
already subsumed by the proved unordered perpendicular-bisector core.  Runtime
formula construction performs only an exact source lookup; cache generation,
theorem detection, minimization, and global orbit-inventory auditing happen
offline.  Every input capable of changing that result is digest-pinned and any
drift fails closed before the formula is built.
"""

from __future__ import annotations

import hashlib
import json
from pathlib import Path

import frozen_separation_probe as _base
import perp_subsumption_cache as _cache


for _name in dir(_base):
    if not _name.startswith("__"):
        globals()[_name] = getattr(_base, _name)


_BASE_PREPARE_FORMULA = _base._prepare_formula
_BASE_RUNTIME_FINGERPRINT = _base._runtime_fingerprint
_ORBIT_WITH_MAPS = _base.combinatorics.orbit_with_maps
_EXPECTED_CACHE_SHA256 = (
    "bbd7b6aa6942b0f1b2c2c8da2365aa8a63d69a5f32edbbef7e07ddac9dbd4db0"
)
_FAMILY = _base.formalized_structural_oracle.FAMILY_BY_STAGE[_cache.STAGE]


def _sha256_file(path: Path) -> str:
    digest = hashlib.sha256()
    with open(path, "rb") as handle:
        for chunk in iter(lambda: handle.read(1 << 20), b""):
            digest.update(chunk)
    return digest.hexdigest()


def _runtime_fingerprint() -> dict[str, str]:
    fingerprint = dict(_BASE_RUNTIME_FINGERPRINT())
    fingerprint.update({
        "perp_subsumption_cached_probe": _sha256_file(Path(__file__)),
        "perp_subsumption_cache_code": _sha256_file(Path(_cache.__file__)),
        "perp_subsumption_cache_artifact": _EXPECTED_CACHE_SHA256,
        "perp_subsumption_policy": hashlib.sha256(
            _cache.POLICY.encode("utf-8")
        ).hexdigest(),
    })
    return fingerprint


def _validate_snapshot_metadata(
    workdir: Path,
    artifact: dict,
    *,
    expected_cache_sha256: str,
) -> None:
    try:
        metadata = json.loads((workdir / "run_metadata.json").read_bytes())
    except (OSError, json.JSONDecodeError) as exc:
        raise _base.ProbeError(
            "replacement cache run metadata is absent or malformed"
        ) from exc
    expected = _cache.snapshot_metadata(
        artifact, sha256=expected_cache_sha256
    )
    if metadata.get("perp_subsumption_cache") != expected:
        raise _base.ProbeError(
            "replacement cache snapshot is not bound to run metadata"
        )


def _prepare_formula_with_cache_contract(
    bank_rows,
    checkpoint,
    structural_patterns=(),
    structural_oracle_catalog=None,
    *,
    expected_cache_sha256: str,
    expected_runtime_contract=None,
    snapshot_workdir: Path | None = None,
    perp_template_preseed: bool = False,
):
    """Build from one exact cache contract, including historical replay."""

    if perp_template_preseed:
        raise _base.ProbeError(
            "targeted bank replacement and bulk perpendicular preseed "
            "must be measured in separate experiment arms"
        )
    workdir = (
        Path(checkpoint.path).parent
        if snapshot_workdir is None
        else Path(snapshot_workdir)
    )
    bank_snapshot = workdir / "bank_snapshot.jsonl"
    cache_snapshot = workdir / _cache.SNAPSHOT
    try:
        artifact, replacement_orbits = _cache.load_pinned_cache(
            _base,
            cache_snapshot,
            expected_sha256=expected_cache_sha256,
            bank_rows=bank_rows,
            bank_path=bank_snapshot,
            expected_runtime_contract=expected_runtime_contract,
        )
    except _cache.CacheError as exc:
        raise _base.ProbeError(f"replacement cache rejected: {exc}") from exc
    _validate_snapshot_metadata(
        workdir,
        artifact,
        expected_cache_sha256=expected_cache_sha256,
    )

    replacement_calls = 0

    def cached_orbit(pattern):
        nonlocal replacement_calls
        serialized = _base.combinatorics.serialize_pattern(pattern)
        replacement = replacement_orbits.get(serialized)
        if replacement is None:
            return _ORBIT_WITH_MAPS(pattern)
        replacement_calls += 1
        return replacement

    _base.combinatorics.orbit_with_maps = cached_orbit
    try:
        result = _BASE_PREPARE_FORMULA(
            bank_rows,
            checkpoint,
            structural_patterns,
            structural_oracle_catalog,
            perp_template_preseed=False,
        )
    finally:
        _base.combinatorics.orbit_with_maps = _ORBIT_WITH_MAPS

    counts = artifact["counts"]
    hashes = artifact["hashes"]
    instance = result[0]
    effective = instance.seed_inventory["algebra_bank"][
        "profile_orbit_instances"
    ]
    if effective != counts["effective_profile_orbit_instances"]:
        raise _base.ProbeError(
            "cached replacement inventory disagrees with formula construction"
        )
    if replacement_calls != counts["targeted_source_rows"]:
        raise _base.ProbeError("not every cached bank source was replaced")

    instance.seed_inventory["algebra_bank"].update({
        "trust": (
            "experimental hybrid seed: non-target bank motifs retain exact "
            "algebra certificates; targeted motifs use a digest-pinned orbit "
            "cache for the proved convex perpendicular-bisector core"
        ),
        "experimental_policy": _cache.POLICY,
        "replacement_cache_sha256": expected_cache_sha256,
        "original_profile_orbit_instances": counts[
            "original_profile_orbit_instances"
        ],
        "effective_profile_orbit_instances": counts[
            "effective_profile_orbit_instances"
        ],
        "targeted_source_rows": counts["targeted_source_rows"],
        "removed_original_instances": counts["removed_original_instances"],
        "added_structural_instances": counts["added_structural_instances"],
        "net_instance_reduction": counts["net_instance_reduction"],
        "ordinary_profile_orbit_sha256": hashes[
            "ordinary_profile_orbit_sha256"
        ],
        "effective_profile_orbit_sha256": hashes[
            "effective_profile_orbit_sha256"
        ],
        "structural_family_id": _FAMILY.family_id,
        "structural_theorem_id": _FAMILY.theorem_id,
        "structural_theorem_source": _FAMILY.theorem_source,
        "structural_theorem_source_sha256": (
            _base.formalized_structural_oracle.THEOREM_SOURCE_SHA256[
                _FAMILY.theorem_source
            ]
        ),
    })
    return result


def _prepare_formula(
    bank_rows,
    checkpoint,
    structural_patterns=(),
    structural_oracle_catalog=None,
    *,
    perp_template_preseed: bool = False,
):
    """Build the live hybrid formula from the current pinned cache only."""

    return _prepare_formula_with_cache_contract(
        bank_rows,
        checkpoint,
        structural_patterns,
        structural_oracle_catalog,
        expected_cache_sha256=_EXPECTED_CACHE_SHA256,
        expected_runtime_contract=None,
        snapshot_workdir=None,
        perp_template_preseed=perp_template_preseed,
    )


_SYNC_TO_BASE = (
    "_runtime_fingerprint",
    "_prepare_formula",
    "_solver_seed",
    "_run_command",
    "_add_lazy_embeddings",
    "_add_formalized_structural_refinements",
    "_atomic_write_bytes",
    "_assert_no_seen_exclusion",
)


def main(argv=None) -> int:
    for name in _SYNC_TO_BASE:
        setattr(_base, name, globals()[name])
    return _base.main(argv)


if __name__ == "__main__":
    raise SystemExit(main())
