#!/usr/bin/env python3
"""Experimental Census-554 probe with targeted structural bank replacement.

This module delegates to ``frozen_separation_probe.py`` but changes one
formula-construction policy: a frozen algebra-bank motif that already contains
the proved unordered perpendicular-bisector core is seeded through its
deterministically minimized structural core instead of through the larger
algebra motif.  All bank rows remain available to validate historical and lazy
algebra provenance.  The policy is intended only for private, iteration-zero
A/B experiments until its timing and replay gates pass.
"""

from __future__ import annotations

import hashlib
from pathlib import Path
from typing import Any, Iterable, Mapping

import frozen_separation_probe as _base


# Export the ordinary probe surface, including private hooks instrumented by
# run_separation_experiment.py.  ``main`` copies any instrumented replacements
# back into the delegated module immediately before execution.
for _name in dir(_base):
    if not _name.startswith("__"):
        globals()[_name] = getattr(_base, _name)


_BASE_PREPARE_FORMULA = _base._prepare_formula
_BASE_RUNTIME_FINGERPRINT = _base._runtime_fingerprint
_ORBIT_WITH_MAPS = _base.combinatorics.orbit_with_maps
_STAGE = "equality-perpendicular-bisector-convex"
_FAMILY = _base.formalized_structural_oracle.FAMILY_BY_STAGE[_STAGE]
_POLICY = "replace-perp-subsumed-bank-motifs-with-minimized-core-v1"


def _sha256_file(path: Path) -> str:
    digest = hashlib.sha256()
    with open(path, "rb") as handle:
        for chunk in iter(lambda: handle.read(1 << 20), b""):
            digest.update(chunk)
    return digest.hexdigest()


def _runtime_fingerprint() -> dict[str, str]:
    fingerprint = dict(_BASE_RUNTIME_FINGERPRINT())
    fingerprint["perp_subsumption_probe"] = _sha256_file(Path(__file__))
    fingerprint["perp_subsumption_policy"] = hashlib.sha256(
        _POLICY.encode("utf-8")
    ).hexdigest()
    return fingerprint


def _replacement_map(
    bank_rows: Iterable[Mapping[str, Any]],
) -> dict[tuple[tuple[int, tuple[int, ...]], ...], dict[int, frozenset[int]]]:
    replacements = {}
    for row in bank_rows:
        pattern = _base._native_pattern(row["pattern"])
        if _base.formalized_structural_oracle.detect_stage(
            pattern, _STAGE
        ) is None:
            continue
        minimized = _base.formalized_structural_oracle.minimize_unordered_pattern(
            pattern, _STAGE
        )
        detection = _base.formalized_structural_oracle.build_detection(
            minimized, _STAGE
        )
        if detection["family_id"] != _FAMILY.family_id:
            raise _base.ProbeError("perpendicular replacement theorem drifted")
        replacements[_base.combinatorics.serialize_pattern(pattern)] = minimized
    return replacements


def _prepare_formula(
    bank_rows,
    checkpoint,
    structural_patterns=(),
    structural_oracle_catalog=None,
    *,
    perp_template_preseed: bool = False,
):
    """Build the ordinary formula with one theorem-backed seed substitution."""

    replacements = _replacement_map(bank_rows)
    original_images = set()
    replacement_images = set()
    replacement_calls = 0

    def replaced_orbit(pattern):
        nonlocal replacement_calls
        serialized = _base.combinatorics.serialize_pattern(pattern)
        original_orbit = _ORBIT_WITH_MAPS(pattern)
        original_images.update(
            _base.combinatorics.serialize_pattern(image)
            for image, _mapping in original_orbit
        )
        replacement = replacements.get(serialized)
        if replacement is None:
            replacement_images.update(
                _base.combinatorics.serialize_pattern(image)
                for image, _mapping in original_orbit
            )
            return original_orbit
        replacement_calls += 1
        orbit = _ORBIT_WITH_MAPS(replacement)
        replacement_images.update(
            _base.combinatorics.serialize_pattern(image)
            for image, _mapping in orbit
        )
        return orbit

    if perp_template_preseed:
        raise _base.ProbeError(
            "targeted bank replacement and bulk perpendicular preseed "
            "must be measured in separate experiment arms"
        )
    _base.combinatorics.orbit_with_maps = replaced_orbit
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

    instance = result[0]
    effective = instance.seed_inventory["algebra_bank"][
        "profile_orbit_instances"
    ]
    if effective != len(replacement_images):
        raise _base.ProbeError(
            "targeted replacement inventory disagrees with formula construction"
        )
    if replacement_calls != len(replacements):
        raise _base.ProbeError("not every targeted bank source was replaced")

    removed = original_images - replacement_images
    added = replacement_images - original_images
    instance.seed_inventory["algebra_bank"].update({
        "trust": (
            "experimental hybrid seed: non-target bank motifs retain exact "
            "algebra certificates; targeted motifs use a proved convex "
            "perpendicular-bisector core"
        ),
        "experimental_policy": _POLICY,
        "original_profile_orbit_instances": len(original_images),
        "effective_profile_orbit_instances": len(replacement_images),
        "targeted_source_rows": len(replacements),
        "removed_original_instances": len(removed),
        "added_structural_instances": len(added),
        "net_instance_reduction": len(original_images) - len(replacement_images),
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
