#!/usr/bin/env python3
"""Exact selected-surface union coverage of the checked ATAIL kernels."""

from __future__ import annotations

import json

from census.atail_force import reduction
from census.atail_force import three_center_surface as surface
import bisector_cap_coverage
import order_fan_coverage


def _has(mask: int, center: int) -> bool:
    return bool(mask & (1 << center))


def two_circle_cap_match(
    joint: surface.JointClass, order: surface.OrderDecoration
) -> bool:
    """Match `twoCircleCapKernel` in the fixed U=0,V=1,W=2 gauge."""
    moser = joint.moser_masks
    u_in_v = _has(moser[0], 1)
    v_in_w = _has(moser[1], 2)
    w_in_u_and_v = _has(moser[2], 0) and _has(moser[2], 1)
    shared_vw_in_o1 = any(
        _has(mask, 1) and _has(mask, 2) for mask in order.o1
    )
    shared_uw_in_o2 = any(
        _has(mask, 0) and _has(mask, 2) for mask in order.o2
    )
    return (
        u_in_v
        and v_in_w
        and w_in_u_and_v
        and shared_vw_in_o1
        and shared_uw_in_o2
    )


KERNELS = {
    "bisector_cap": bisector_cap_coverage.canonical_match,
    "order_fan": order_fan_coverage.canonical_match,
    "two_circle_cap": two_circle_cap_match,
}


def matched_kernels(
    joint: surface.JointClass,
    order: surface.OrderDecoration,
    lookup: dict[reduction.ClassSignature, surface.JointClass],
) -> tuple[str, ...]:
    found: set[str] = set()
    signature = reduction.class_signature(joint)
    for permutation in reduction.PERMUTATIONS:
        target_signature = reduction.transform_class_signature(signature, permutation)
        target = lookup[target_signature]
        transformed = reduction.transform_decoration(
            joint, order, permutation, target
        )
        for name, matcher in KERNELS.items():
            if matcher(target, transformed):
                found.add(name)
    return tuple(sorted(found))


def main() -> int:
    _report, classes = surface.load_inventory()
    lookup = {reduction.class_signature(joint): joint for joint in classes}
    total = 0
    kernel_system_counts = {name: 0 for name in KERNELS}
    kernel_class_ids = {name: set() for name in KERNELS}
    combination_counts: dict[tuple[str, ...], int] = {}
    union_classes: set[int] = set()
    examples = []
    for joint in classes:
        for order in surface.iter_order_decorations(joint):
            total += 1
            names = matched_kernels(joint, order, lookup)
            if not names:
                continue
            combination_counts[names] = combination_counts.get(names, 0) + 1
            union_classes.add(joint.class_id)
            for name in names:
                kernel_system_counts[name] += 1
                kernel_class_ids[name].add(joint.class_id)
            if len(examples) < 12:
                examples.append(
                    {
                        "class_id": joint.class_id,
                        "order": order.as_json(),
                        "matched_kernels": list(names),
                    }
                )
    if total != 167_782:
        raise surface.SurfaceError(f"decorated surface drift: {total}")
    if kernel_system_counts["order_fan"] != 39:
        raise surface.SurfaceError("order-fan coverage drift")
    if kernel_system_counts["bisector_cap"] != 66:
        raise surface.SurfaceError("bisector-cap coverage drift")
    if kernel_system_counts["two_circle_cap"] != 24:
        raise surface.SurfaceError("two-circle-cap coverage drift")
    expected_class_counts = {
        "order_fan": 21,
        "bisector_cap": 18,
        "two_circle_cap": 6,
    }
    actual_class_counts = {
        name: len(class_ids) for name, class_ids in kernel_class_ids.items()
    }
    if actual_class_counts != expected_class_counts:
        raise surface.SurfaceError(
            f"kernel class-coverage drift: {actual_class_counts}"
        )
    if any(len(names) != 1 for names in combination_counts):
        raise surface.SurfaceError(
            f"checked kernel overlap drift: {combination_counts}"
        )
    union = sum(combination_counts.values())
    if union != 129 or len(union_classes) != 45:
        raise surface.SurfaceError(
            "kernel union drift: "
            f"{union} systems / {len(union_classes)} classes"
        )
    document = {
        "schema": "p97_atail_force_checked_kernel_union_coverage.v1",
        "surface_systems": total,
        "kernel_coverage": {
            name: {
                "matched_systems": kernel_system_counts[name],
                "matched_classes": len(kernel_class_ids[name]),
            }
            for name in sorted(KERNELS)
        },
        "union_matched_systems": union,
        "union_surviving_systems": total - union,
        "union_matched_classes": len(union_classes),
        "combination_histogram": {
            "+".join(names): count
            for names, count in sorted(combination_counts.items())
        },
        "examples": examples,
        "scope": {
            "all_three_kernels_checked_in_lean_scratch": True,
            "exact_combinatorial_surface_count": True,
            "live_leaf_inventory_coverage_claim": False,
            "full_filter_shared_radius_pair_claim": False,
            "main_lean_source_landed": False,
        },
    }
    print(json.dumps(document, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
