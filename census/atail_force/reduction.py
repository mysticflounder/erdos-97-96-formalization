#!/usr/bin/env python3
"""Exact S3 and equality-skeleton reduction of the ATAIL-FORCE surface."""
from __future__ import annotations

import hashlib
import json
from collections import Counter, defaultdict
from itertools import permutations
from typing import Any, Iterable, Mapping, Sequence

from census.atail_force import three_center_surface as surface


PERMUTATIONS = tuple(permutations(surface.CENTERS))
CAP_MISSING_VERTEX = {"S": 0, "O1": 1, "O2": 2}
CAP_FROM_MISSING_VERTEX = {
    vertex: cap for cap, vertex in CAP_MISSING_VERTEX.items()
}

ClassSignature = tuple[
    tuple[int, int, int],
    tuple[tuple[str, int, int], ...],
]
EqualitySignature = tuple[
    tuple[int, int, int],
    tuple[tuple[int, int], ...],
]


def permute_mask(mask: int, permutation: tuple[int, int, int]) -> int:
    result = 0
    for center in surface.CENTERS:
        if mask & (1 << center):
            result |= 1 << permutation[center]
    return result


def inverse_permutation(
    permutation: tuple[int, int, int],
) -> tuple[int, int, int]:
    inverse = [0, 0, 0]
    for source, target in enumerate(permutation):
        inverse[target] = source
    return tuple(inverse)


def permute_cap(cap: str, permutation: tuple[int, int, int]) -> str:
    missing = CAP_MISSING_VERTEX[cap]
    return CAP_FROM_MISSING_VERTEX[permutation[missing]]


def class_signature(joint: surface.JointClass) -> ClassSignature:
    return joint.moser_masks, joint.cap_rows


def transform_class_signature(
    signature: ClassSignature,
    permutation: tuple[int, int, int],
) -> ClassSignature:
    moser_masks, cap_rows = signature
    transformed_moser = [0, 0, 0]
    for source_vertex, mask in enumerate(moser_masks):
        transformed_moser[permutation[source_vertex]] = permute_mask(
            mask, permutation
        )
    transformed_rows = tuple(
        sorted(
            (
                (
                    permute_cap(cap, permutation),
                    permute_mask(mask, permutation),
                    count,
                )
                for cap, mask, count in cap_rows
            ),
            key=lambda row: (surface.CAP_ORDER[row[0]], row[1]),
        )
    )
    return tuple(transformed_moser), transformed_rows


def canonical_class_signature(signature: ClassSignature) -> ClassSignature:
    return min(transform_class_signature(signature, p) for p in PERMUTATIONS)


def equality_signature(joint: surface.JointClass) -> EqualitySignature:
    counts = Counter(
        mask for cap in surface.CAPS for mask in joint.cap_masks(cap)
    )
    return joint.moser_masks, tuple(sorted(counts.items()))


def transform_equality_signature(
    signature: EqualitySignature,
    permutation: tuple[int, int, int],
) -> EqualitySignature:
    moser_masks, mask_counts = signature
    transformed_moser = [0, 0, 0]
    for source_vertex, mask in enumerate(moser_masks):
        transformed_moser[permutation[source_vertex]] = permute_mask(
            mask, permutation
        )
    transformed_counts = tuple(
        sorted((permute_mask(mask, permutation), count) for mask, count in mask_counts)
    )
    return tuple(transformed_moser), transformed_counts


def canonical_equality_signature(
    signature: EqualitySignature,
) -> EqualitySignature:
    return min(transform_equality_signature(signature, p) for p in PERMUTATIONS)


def _validate_order_multisets(
    joint: surface.JointClass,
    order: surface.OrderDecoration,
) -> None:
    for cap in surface.CAPS:
        if Counter(order.block(cap)) != Counter(joint.cap_masks(cap)):
            raise surface.SurfaceError(
                f"class {joint.class_id} order multiset drift in {cap}"
            )


def transform_decoration(
    joint: surface.JointClass,
    order: surface.OrderDecoration,
    permutation: tuple[int, int, int],
    target: surface.JointClass,
) -> surface.OrderDecoration:
    """Relabel a decorated cyclic window and normalize it back to CCW gauge."""
    _validate_order_multisets(joint, order)
    expected_target = transform_class_signature(class_signature(joint), permutation)
    if class_signature(target) != expected_target:
        raise surface.SurfaceError(
            f"class {target.class_id} is not the requested transformed target"
        )

    cycle: list[tuple[str, Any, int]] = []

    def append_anchor(vertex: int) -> None:
        cycle.append(("anchor", permutation[vertex], 0))

    def append_block(cap: str) -> None:
        target_cap = permute_cap(cap, permutation)
        cycle.extend(
            ("point", target_cap, permute_mask(mask, permutation))
            for mask in order.block(cap)
        )

    append_anchor(1)
    append_block("S")
    append_anchor(2)
    append_block("O1")
    append_anchor(0)
    append_block("O2")

    def rotate_to_anchor_one(
        tokens: list[tuple[str, Any, int]],
    ) -> list[tuple[str, Any, int]]:
        start = next(
            index
            for index, token in enumerate(tokens)
            if token[0] == "anchor" and token[1] == 1
        )
        return tokens[start:] + tokens[:start]

    normalized = rotate_to_anchor_one(cycle)
    anchor_order = [int(token[1]) for token in normalized if token[0] == "anchor"]
    if anchor_order != [1, 2, 0]:
        normalized = rotate_to_anchor_one(list(reversed(cycle)))
        anchor_order = [
            int(token[1]) for token in normalized if token[0] == "anchor"
        ]
    if anchor_order != [1, 2, 0]:
        raise surface.SurfaceError("permuted cyclic order did not normalize")

    anchor_positions = [
        index for index, token in enumerate(normalized) if token[0] == "anchor"
    ]
    if anchor_positions[0] != 0 or len(anchor_positions) != 3:
        raise surface.SurfaceError("normalized cyclic order has bad anchors")
    blocks = {
        "S": normalized[anchor_positions[0] + 1 : anchor_positions[1]],
        "O1": normalized[anchor_positions[1] + 1 : anchor_positions[2]],
        "O2": normalized[anchor_positions[2] + 1 :],
    }
    decoded: dict[str, tuple[int, ...]] = {}
    for cap, tokens in blocks.items():
        if any(token[0] != "point" or token[1] != cap for token in tokens):
            raise surface.SurfaceError(
                f"permuted cyclic order does not preserve the {cap} block"
            )
        decoded[cap] = tuple(int(token[2]) for token in tokens)
    transformed = surface.OrderDecoration(
        decoded["S"], decoded["O1"], decoded["O2"]
    )
    _validate_order_multisets(target, transformed)
    return transformed


def _digest(records: Sequence[Any]) -> str:
    canonical = json.dumps(records, separators=(",", ":"), sort_keys=True)
    return hashlib.sha256(canonical.encode("utf-8")).hexdigest()


def _histogram(values: Iterable[int]) -> dict[str, int]:
    counts = Counter(values)
    return {str(value): counts[value] for value in sorted(counts)}


def build_reduction_report(
    classes: tuple[surface.JointClass, ...],
) -> dict[str, Any]:
    """Validate the group action and emit exact reduction counts/digests."""
    lookup: Mapping[ClassSignature, surface.JointClass] = {
        class_signature(joint): joint for joint in classes
    }
    if len(lookup) != len(classes):
        raise surface.SurfaceError("class-signature lookup is not injective")

    class_orbits: dict[ClassSignature, list[surface.JointClass]] = defaultdict(list)
    equality_groups: dict[
        EqualitySignature, list[surface.JointClass]
    ] = defaultdict(list)
    equality_orbits: dict[EqualitySignature, set[EqualitySignature]] = defaultdict(set)
    permutation_edges = 0
    round_trips = 0

    for joint in classes:
        signature = class_signature(joint)
        class_orbits[canonical_class_signature(signature)].append(joint)
        raw_equality = equality_signature(joint)
        equality_groups[raw_equality].append(joint)
        equality_orbits[canonical_equality_signature(raw_equality)].add(raw_equality)
        canonical_order = surface.canonical_decoration(joint)
        for permutation in PERMUTATIONS:
            target_signature = transform_class_signature(signature, permutation)
            target = lookup.get(target_signature)
            if target is None:
                raise surface.SurfaceError(
                    f"class {joint.class_id} leaves the inventory under {permutation}"
                )
            permutation_edges += 1
            transformed_order = transform_decoration(
                joint, canonical_order, permutation, target
            )
            restored_order = transform_decoration(
                target,
                transformed_order,
                inverse_permutation(permutation),
                joint,
            )
            if restored_order != canonical_order:
                raise surface.SurfaceError(
                    f"decoration round trip failed for class {joint.class_id}"
                )
            round_trips += 1

    representative_rows = []
    orbit_sizes = []
    reduced_order_counts = []
    for canonical_signature in sorted(class_orbits):
        orbit = class_orbits[canonical_signature]
        representative = lookup[canonical_signature]
        order_counts = {surface.order_decoration_count(joint) for joint in orbit}
        if len(order_counts) != 1:
            raise surface.SurfaceError(
                f"order-count drift in class orbit {representative.class_id}"
            )
        order_count = order_counts.pop()
        orbit_sizes.append(len(orbit))
        reduced_order_counts.append(order_count)
        representative_rows.append(
            {
                "class_id": representative.class_id,
                "class_key_sha256": representative.class_key_sha256,
                "orbit_size": len(orbit),
                "order_decorations": order_count,
            }
        )

    equality_rows = []
    equality_orbit_sizes = []
    for canonical_signature in sorted(equality_orbits):
        raw_signatures = equality_orbits[canonical_signature]
        class_ids = sorted(
            joint.class_id
            for raw_signature in raw_signatures
            for joint in equality_groups[raw_signature]
        )
        equality_orbit_sizes.append(len(raw_signatures))
        equality_rows.append(
            {
                "representative_class_id": class_ids[0],
                "raw_skeletons_in_orbit": len(raw_signatures),
                "classes_with_skeleton_orbit": len(class_ids),
                "interior_points": sum(
                    count for _mask, count in canonical_signature[1]
                ),
            }
        )

    return {
        "group": "S3 simultaneous Moser-vertex/center relabeling",
        "permutations": [list(permutation) for permutation in PERMUTATIONS],
        "class_action": {
            "input_classes": len(classes),
            "orbits": len(class_orbits),
            "orbit_size_histogram": _histogram(orbit_sizes),
            "all_permutation_edges_in_inventory": permutation_edges,
            "canonical_decoration_round_trips": round_trips,
            "representative_manifest_sha256": _digest(representative_rows),
        },
        "decorated_surface": {
            "input_systems": sum(
                surface.order_decoration_count(joint) for joint in classes
            ),
            "orbit_representative_systems": sum(reduced_order_counts),
            "orders_per_representative_histogram": _histogram(reduced_order_counts),
            "reduction_scope": (
                "one class-orbit representative with its complete order menu; "
                "no inequality-system equivalence beyond the explicit S3 action"
            ),
            "combinatorial_order_action_verified": True,
            "gauge_similarity_transfer_certificate": False,
        },
        "equality_skeletons": {
            "input_classes": len(classes),
            "raw_skeletons": len(equality_groups),
            "s3_orbits": len(equality_orbits),
            "raw_skeletons_per_orbit_histogram": _histogram(equality_orbit_sizes),
            "representative_manifest_sha256": _digest(equality_rows),
            "scope": (
                "cap locations and global order omitted; an equality-ideal kill "
                "transfers to every class/order with that skeleton"
            ),
        },
    }
