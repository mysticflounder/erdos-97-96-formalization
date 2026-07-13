#!/usr/bin/env python3
"""Deterministic preflight checkpoint for the ATAIL-FORCE decision surface."""
from __future__ import annotations

import argparse
import hashlib
import json
import os
import tempfile
from collections import Counter
from pathlib import Path
from typing import Any, Iterable, Mapping

import sympy as sp

from census.atail_force import reduction
from census.atail_force import three_center_surface as surface
from census.candidate_d_probe import encoder


SCHEMA = "p97_atail_force_surface_checkpoint.v1"
HERE = Path(__file__).resolve().parent
REPO_ROOT = HERE.parents[1]
DEFAULT_CHECKPOINT = HERE / "surface_checkpoint.json"

PINNED_INPUTS = (
    Path(__file__).resolve(),
    Path(surface.__file__).resolve(),
    Path(reduction.__file__).resolve(),
    HERE / "formulation.md",
    surface.DEFAULT_INVENTORY,
    REPO_ROOT / "scripts" / "multi-center-sweep-certificate.py",
    REPO_ROOT / "census" / "multi_center" / "multi_center_census.py",
    REPO_ROOT / "census" / "multi_center" / "analyze_sweeps.py",
    REPO_ROOT / "census" / "q3_two_center" / "q3_token.py",
    REPO_ROOT / "census" / "q3_two_center" / "checkpoint.json",
    Path(encoder.__file__).resolve(),
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


def _histogram(values: Iterable[int]) -> dict[str, int]:
    counts = Counter(values)
    return {str(value): counts[value] for value in sorted(counts)}


def _range(values: Iterable[int]) -> dict[str, int]:
    materialized = list(values)
    _require(bool(materialized), "cannot compute an empty range")
    return {"minimum": min(materialized), "maximum": max(materialized)}


def _sample_systems(
    classes: tuple[surface.JointClass, ...],
    order_counts: list[int],
) -> list[dict[str, Any]]:
    max_order = max(order_counts)
    max_interior = max(joint.interior_point_count for joint in classes)
    sample_ids = {
        0,
        len(classes) - 1,
        next(index for index, count in enumerate(order_counts) if count == max_order),
        next(
            joint.class_id
            for joint in classes
            if joint.interior_point_count == max_interior
        ),
    }
    samples = []
    for class_id in sorted(sample_ids):
        joint = classes[class_id]
        system = surface.build_system(joint, surface.canonical_decoration(joint))
        separators = surface.equality_separators(system)
        expected = surface.expected_system_size(joint)
        _require(
            len(separators) == expected["equality_separators"],
            f"separator-count drift for class {class_id}",
        )
        samples.append(
            {
                "class_id": class_id,
                "class_key_sha256": joint.class_key_sha256,
                "order_decorations": order_counts[class_id],
                "system": system.meta,
                "separators_materialized": len(separators),
            }
        )
    return samples


def _verify_bare_equality_surface(
    classes: tuple[surface.JointClass, ...],
) -> dict[str, Any]:
    representatives: dict[
        reduction.EqualitySignature, surface.JointClass
    ] = {}
    for joint in classes:
        representatives.setdefault(reduction.equality_signature(joint), joint)
    _require(len(representatives) == 343, "raw equality-skeleton count drift")

    mutation_rejections = 0
    representative_ids = []
    for signature in sorted(representatives):
        joint = representatives[signature]
        representative_ids.append(joint.class_id)
        order = surface.canonical_decoration(joint)
        system = surface.build_equality_system(joint, order)
        substitutions = surface.collapsed_equilateral_substitution(joint, order)
        verified, failures = surface.verify_equalities(system, substitutions)
        _require(
            verified,
            f"collapsed equality witness failed for class {joint.class_id}: "
            f"{failures[:1]}",
        )
        for radius_name in ("ru2", "rv2", "rw2"):
            mutation = dict(substitutions)
            mutation[radius_name] += sp.Rational(1, 7)
            mutation_verified, _failures = surface.verify_equalities(
                system, mutation
            )
            _require(
                not mutation_verified,
                f"radius mutation accepted for class {joint.class_id}, "
                f"{radius_name}",
            )
            mutation_rejections += 1
    return {
        "raw_equality_skeletons": len(representatives),
        "exact_qsqrt3_collapsed_witnesses": len(representatives),
        "radius_mutations_rejected": mutation_rejections,
        "representative_class_ids_sha256": hashlib.sha256(
            json.dumps(representative_ids, separators=(",", ":")).encode("utf-8")
        ).hexdigest(),
        "bare_equality_ideal_can_be_empty": False,
        "witness_satisfies_distinctness_separators": False,
        "witness_satisfies_geometric_inequalities": False,
        "required_successor": (
            "separator-saturated equality analysis or the full geometric "
            "inequality system"
        ),
    }


def build_checkpoint() -> dict[str, Any]:
    report, classes = surface.load_inventory()
    exact_reduction = reduction.build_reduction_report(classes)
    bare_equalities = _verify_bare_equality_surface(classes)
    order_counts = [surface.order_decoration_count(joint) for joint in classes]
    _require(all(count > 0 for count in order_counts), "empty order-decoration row")
    interior_counts = [joint.interior_point_count for joint in classes]
    membership_counts = [joint.membership_incidence_count for joint in classes]
    _require(set(membership_counts) == {12}, "membership incidence drift")
    system_sizes = [surface.expected_system_size(joint) for joint in classes]

    mask_points: Counter[int] = Counter()
    cap_points: dict[str, int] = {cap: 0 for cap in surface.CAPS}
    for joint in classes:
        for cap, mask, count in joint.cap_rows:
            mask_points[mask] += count
            cap_points[cap] += count

    max_order = max(order_counts)
    max_order_ids = [
        joint.class_id
        for joint, count in zip(classes, order_counts)
        if count == max_order
    ]
    input_digests = {
        str(path.relative_to(REPO_ROOT)): _sha256(path) for path in PINNED_INPUTS
    }
    return {
        "schema": SCHEMA,
        "verdict": {
            "atail_force_surface": "PREFLIGHT_COMPLETE_NO_SOLVER_RUN",
            "atail_force": "OPEN_RESEARCH",
            "next_gate": (
                "controlled exact geometric decision sweep or a direct "
                "full-filter/critical-row producer"
            ),
        },
        "inventory": {
            "schema": report["schema"],
            "class_count": len(classes),
            "terminal_n": report["terminal_n"],
            "full_inventory_sha256": report["full_inventory_sha256"],
            "all_rows_replayed": True,
            "local_cuts_replayed": [
                "selected-four at each Moser center",
                "own-center exclusion",
                "H1 containing-cap bounds",
                "C2 pairwise class overlap",
                "C4 three-center consequence",
                "K-Q3-1 on all Moser pairs",
                "K-Q3-5 on all Moser pairs",
            ],
        },
        "order_surface": {
            "equivalence": "permutations of equal membership masks are quotiented",
            "classes": len(classes),
            "decorated_systems": sum(order_counts),
            "orders_per_class": {
                "minimum": min(order_counts),
                "maximum": max_order,
                "histogram": _histogram(order_counts),
                "maximum_class_count": len(max_order_ids),
                "maximum_class_ids": max_order_ids,
            },
            "interior_points_per_class": {
                **_range(interior_counts),
                "histogram": _histogram(interior_counts),
            },
            "aggregate_interior_points_by_cap": cap_points,
            "aggregate_interior_points_by_membership_mask": {
                str(mask): mask_points[mask] for mask in sorted(mask_points)
            },
        },
        "system_dimensions": {
            field: _range(size[field] for size in system_sizes)
            for field in (
                "variables",
                "equalities",
                "weak_inequalities",
                "strict_inequalities",
                "equality_separators",
            )
        },
        "construction_samples": _sample_systems(classes, order_counts),
        "exact_reduction": exact_reduction,
        "bare_equality_surface": bare_equalities,
        "scope": {
            "exact_inventory_and_local_cut_replay": True,
            "complete_order_surface_count": True,
            "exact_s3_and_equality_skeleton_reduction": True,
            "independent_gauge_similarity_transfer_certificate": False,
            "all_geometric_systems_materialized": False,
            "geometric_solver_invoked": False,
            "exact_unsat_certificates": False,
            "exact_sat_witnesses": False,
            "lean_leaf_to_inventory_extraction": False,
            "full_configuration_realization": False,
            "full_filter_shared_radius_pair": False,
        },
        "input_sha256": dict(sorted(input_digests.items())),
    }


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
            _require(existing == canonical, "committed surface checkpoint is stale")
        else:
            print(canonical, end="")
        return 0
    except (surface.SurfaceError, OSError) as exc:
        parser.error(str(exc))
    raise AssertionError("unreachable")


if __name__ == "__main__":
    raise SystemExit(main())
