#!/usr/bin/env python3
"""Count the S3 orbit coverage of the checked ATAIL order-fan kernel.

The matcher uses only membership facts consumed by
``order_fan_kernel.lean``; extra selected-class memberships are allowed.  It
checks every one of the pinned 167,782 order-decorated systems and all six
simultaneous relabelings.  This is exact combinatorial coverage of the current
three-center surface, not geometric inventory coverage of the live leaf.
"""

from __future__ import annotations

import json

from census.atail_force import reduction
from census.atail_force import three_center_surface as surface


def _has(mask: int, center: int) -> bool:
    return bool(mask & (1 << center))


def canonical_match(
    joint: surface.JointClass, order: surface.OrderDecoration
) -> bool:
    """Match the scalar kernel in the fixed ``U=0,V=1,W=2`` gauge."""
    moser = joint.moser_masks
    if not (_has(moser[0], 1) and _has(moser[1], 0) and _has(moser[2], 0)):
        return False
    surplus = order.s
    ordered_shared_pair = any(
        left_index < right_index
        and _has(left, 0)
        and _has(left, 1)
        and _has(right, 0)
        and _has(right, 2)
        for left_index, left in enumerate(surplus)
        for right_index, right in enumerate(surplus)
    )
    if not ordered_shared_pair:
        return False
    return any(_has(mask, 2) for mask in order.o2)


def orbit_match(
    joint: surface.JointClass,
    order: surface.OrderDecoration,
    lookup: dict[reduction.ClassSignature, surface.JointClass],
) -> tuple[tuple[int, int, int], ...]:
    matches = []
    signature = reduction.class_signature(joint)
    for permutation in reduction.PERMUTATIONS:
        target_signature = reduction.transform_class_signature(signature, permutation)
        target = lookup[target_signature]
        transformed = reduction.transform_decoration(
            joint, order, permutation, target
        )
        if canonical_match(target, transformed):
            matches.append(permutation)
    return tuple(matches)


def main() -> int:
    _report, classes = surface.load_inventory()
    lookup = {reduction.class_signature(joint): joint for joint in classes}
    total = 0
    killed = 0
    matched_classes: set[int] = set()
    multiplicity: dict[int, int] = {}
    examples = []
    for joint in classes:
        for order in surface.iter_order_decorations(joint):
            total += 1
            matches = orbit_match(joint, order, lookup)
            if not matches:
                continue
            killed += 1
            matched_classes.add(joint.class_id)
            multiplicity[len(matches)] = multiplicity.get(len(matches), 0) + 1
            if len(examples) < 12:
                examples.append(
                    {
                        "class_id": joint.class_id,
                        "class_key_sha256": joint.class_key_sha256,
                        "order": order.as_json(),
                        "matching_permutations": [list(row) for row in matches],
                    }
                )
    if total != 167_782:
        raise surface.SurfaceError(f"decorated surface drift: {total}")
    document = {
        "schema": "p97_atail_force_order_fan_coverage.v1",
        "surface_systems": total,
        "matched_systems": killed,
        "surviving_systems": total - killed,
        "matched_fraction": f"{killed}/{total}",
        "matched_classes": len(matched_classes),
        "match_multiplicity_histogram": {
            str(key): multiplicity[key] for key in sorted(multiplicity)
        },
        "examples": examples,
        "scope": {
            "kernel_checked_in_lean_scratch": True,
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
