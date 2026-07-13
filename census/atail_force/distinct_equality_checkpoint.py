#!/usr/bin/env python3
"""Permanent exact checkpoint for separator-satisfying equality witnesses."""
from __future__ import annotations

import argparse
import hashlib
import json
import os
import tempfile
from collections import Counter
from pathlib import Path
from typing import Any, Mapping

from census.atail_force import distinct_equality_witness as witness
from census.atail_force import reduction
from census.atail_force import three_center_surface as surface


SCHEMA = "p97_atail_force_distinct_equality_checkpoint.v1"
HERE = Path(__file__).resolve().parent
REPO_ROOT = HERE.parents[1]
DEFAULT_CHECKPOINT = HERE / "distinct_equality_checkpoint.json"

PINNED_INPUTS = (
    Path(__file__).resolve(),
    Path(witness.__file__).resolve(),
    Path(surface.__file__).resolve(),
    Path(reduction.__file__).resolve(),
    HERE / "surface_checkpoint.json",
    HERE / "separator_pilot_manifest.json",
    HERE / "separator_pilot_results.json",
    surface.DEFAULT_INVENTORY,
)


def _require(condition: bool, message: str) -> None:
    if not condition:
        raise surface.SurfaceError(message)


def _sha256(path: Path) -> str:
    digest = hashlib.sha256()
    try:
        with path.open("rb") as handle:
            for block in iter(lambda: handle.read(1024 * 1024), b""):
                digest.update(block)
    except OSError as exc:
        raise surface.SurfaceError(f"cannot hash {path}: {exc}") from exc
    return digest.hexdigest()


def _json_digest(value: Any) -> str:
    encoded = json.dumps(value, separators=(",", ":"), sort_keys=True)
    return hashlib.sha256(encoded.encode("utf-8")).hexdigest()


def _canonical(document: Mapping[str, Any]) -> str:
    return json.dumps(document, sort_keys=True, indent=2) + "\n"


def _write_atomic(path: Path, content: str) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    fd, temporary = tempfile.mkstemp(prefix=f".{path.name}.", dir=path.parent)
    try:
        with os.fdopen(fd, "w", encoding="utf-8") as handle:
            handle.write(content)
            handle.flush()
            os.fsync(handle.fileno())
        os.replace(temporary, path)
    finally:
        if os.path.exists(temporary):
            os.unlink(temporary)


def _representatives(
    classes: tuple[surface.JointClass, ...],
) -> list[tuple[reduction.EqualitySignature, surface.JointClass]]:
    representatives: dict[
        reduction.EqualitySignature, surface.JointClass
    ] = {}
    for joint in classes:
        representatives.setdefault(reduction.equality_signature(joint), joint)
    _require(len(representatives) == 343, "raw equality-skeleton count drift")
    return sorted(representatives.items())


def build_checkpoint() -> dict[str, Any]:
    _report, classes = surface.load_inventory()
    rows = []
    real_count = 0
    separator_count = 0
    interior_histogram: Counter[int] = Counter()
    free_radius_histogram: Counter[tuple[str, ...]] = Counter()
    for index, (signature, joint) in enumerate(_representatives(classes)):
        order = surface.canonical_decoration(joint)
        result = witness.find_witness(joint, order)
        substitutions = result["substitutions"]
        serialized_substitutions = {
            name: str(value) for name, value in sorted(substitutions.items())
        }
        separators_verified = surface.expected_system_size(joint)[
            "equality_separators"
        ]
        separator_count += separators_verified
        interior_histogram[joint.interior_point_count] += 1
        choices = tuple(result["free_radius_choices"])
        free_radius_histogram[choices] += 1
        is_real = bool(result["all_coordinates_real"])
        real_count += is_real
        rows.append(
            {
                "raw_skeleton_id": index,
                "class_id": joint.class_id,
                "class_key_sha256": joint.class_key_sha256,
                "equality_signature_sha256": _json_digest(signature),
                "interior_points": joint.interior_point_count,
                "separators_verified_nonzero": separators_verified,
                "all_coordinates_proven_real": is_real,
                "free_radius_choices": list(choices),
                "substitution_sha256": _json_digest(serialized_substitutions),
            }
        )
    input_digests = {
        str(path.relative_to(REPO_ROOT)): _sha256(path) for path in PINNED_INPUTS
    }
    return {
        "schema": SCHEMA,
        "verdict": {
            "separator_saturated_equality_surface": (
                "NONEMPTY_OVER_REAL_ALGEBRAIC_NUMBERS"
                if real_count == len(rows)
                else "NONEMPTY_OVER_COMPLEX_ALGEBRAIC_NUMBERS"
            ),
            "bare_or_saturated_equality_route": "DONE_NEGATIVE",
            "atail_force": "OPEN_RESEARCH",
            "required_successor": (
                "real cap/disk/nonobtuse/global-order inequalities or a direct "
                "full-filter/critical-row producer"
            ),
        },
        "replay": {
            "raw_equality_skeletons": len(rows),
            "exact_equations_verified": 14 * len(rows),
            "distinctness_and_area_separators_verified_nonzero": separator_count,
            "witnesses_with_all_coordinates_proven_real": real_count,
            "witnesses_requiring_complex_algebraic_coordinates": len(rows) - real_count,
            "interior_point_histogram": {
                str(key): interior_histogram[key]
                for key in sorted(interior_histogram)
            },
            "free_radius_choice_histogram": {
                json.dumps(key): free_radius_histogram[key]
                for key in sorted(free_radius_histogram)
            },
            "row_manifest_sha256": _json_digest(rows),
            "rows": rows,
        },
        "scope": {
            "exact_algebraic_arithmetic": True,
            "all_raw_equality_skeletons": True,
            "pairwise_distinct_support_and_nondegenerate_triangle": True,
            "all_witnesses_real": real_count == len(rows),
            "disk_nonobtuse_cap_and_order_inequalities": False,
            "full_configuration_realization": False,
            "full_filter_shared_radius_pair": False,
            "lean_claim": False,
        },
        "input_sha256": dict(sorted(input_digests.items())),
    }


def main() -> int:
    parser = argparse.ArgumentParser()
    mode = parser.add_mutually_exclusive_group()
    mode.add_argument("--write", action="store_true")
    mode.add_argument("--check", action="store_true")
    parser.add_argument("--checkpoint", type=Path, default=DEFAULT_CHECKPOINT)
    args = parser.parse_args()
    try:
        document = build_checkpoint()
        canonical = _canonical(document)
        if args.write:
            _write_atomic(args.checkpoint, canonical)
        elif args.check:
            existing = args.checkpoint.read_text(encoding="utf-8")
            _require(existing == canonical, "distinct equality checkpoint is stale")
        else:
            print(canonical, end="")
        return 0
    except (surface.SurfaceError, OSError) as exc:
        parser.error(str(exc))
    raise AssertionError("unreachable")


if __name__ == "__main__":
    raise SystemExit(main())
