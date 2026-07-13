#!/usr/bin/env python3
"""Count S3-orbit coverage of the checked ATAIL bisector-cap kernel."""

from __future__ import annotations

import json

from census.atail_force import reduction
from census.atail_force import three_center_surface as surface


def _has(mask: int, center: int) -> bool:
    return bool(mask & (1 << center))


def canonical_match(
    joint: surface.JointClass, order: surface.OrderDecoration
) -> bool:
    """Match `bisectorCapKernel` in the fixed U=0,V=1,W=2 gauge."""
    moser = joint.moser_masks
    v_in_u_and_w = _has(moser[1], 0) and _has(moser[1], 2)
    w_in_u_and_v = _has(moser[2], 0) and _has(moser[2], 1)
    shared_vw_in_o1 = any(
        _has(mask, 1) and _has(mask, 2) for mask in order.o1
    )
    return v_in_u_and_w and w_in_u_and_v and shared_vw_in_o1


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
    matched = 0
    matched_classes: set[int] = set()
    multiplicity: dict[int, int] = {}
    examples = []
    for joint in classes:
        for order in surface.iter_order_decorations(joint):
            total += 1
            matches = orbit_match(joint, order, lookup)
            if not matches:
                continue
            matched += 1
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
    if matched != 66 or len(matched_classes) != 18:
        raise surface.SurfaceError(
            "bisector-cap coverage drift: "
            f"{matched} systems / {len(matched_classes)} classes"
        )
    document = {
        "schema": "p97_atail_force_bisector_cap_coverage.v1",
        "surface_systems": total,
        "matched_systems": matched,
        "surviving_systems": total - matched,
        "matched_fraction": f"{matched}/{total}",
        "matched_classes": len(matched_classes),
        "match_multiplicity_histogram": {
            str(key): multiplicity[key] for key in sorted(multiplicity)
        },
        "examples": examples,
        "scope": {
            "kernel_checked_in_lean_scratch": True,
            "global_order_used": False,
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
