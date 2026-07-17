"""Exact finite-metric regression for the exact-five paired continuation.

This model is deliberately source-faithful to the data retained by
``LargeCapUniqueFiveTwoCommonDeletionSources`` after forgetting the Euclidean
embedding.  It has:

* one physical center with a unique exact five-point K4 radius class;
* a six-point labelled cap, with three physical-class points in its interior;
* an unused cap source outside the physical class;
* a total deletion-critical blocker and exact four-shell for every source;
* the unused source's actual shell, disjoint from the two chosen physical
  sources;
* the canonical common-deletion rows at the same actual/physical centers for
  both chosen sources; and
* a genuine paired successor two-cycle between those two physical sources.

The distance is a genuine rational metric: every nonzero distance lies in
``[1, 3/2)``, so the triangle inequality is automatic and checked
exhaustively.  The model is not asserted to embed in the Euclidean plane and
does not encode convexity, MEC geometry, or geometric cap separation.  It is
therefore a regression against any nonreturn theorem whose proof uses only
the finite metric, exact-radius, critical-shell, and paired-source fields.
"""

from __future__ import annotations

from collections import defaultdict
from fractions import Fraction
import hashlib
import json


N = 24
VERTICES = tuple(range(N))
BASE_OFFSETS = frozenset({1, 2, 3, 5})

PHYSICAL_CENTER = 0
ACTUAL_UNUSED_BLOCKER = 12
FIXED_CENTERS = frozenset({PHYSICAL_CENTER, ACTUAL_UNUSED_BLOCKER})

# The physical center has exactly one ambient K4 radius, of cardinality five.
PHYSICAL_CLASS = frozenset({1, 2, 3, 5, 8})

# The unused source's actual critical shell.  It omits both paired sources.
UNUSED_SOURCE = 13
UNUSED_SHELL = frozenset({13, 14, 15, 17})

FIRST_SOURCE = 1
SECOND_SOURCE = 2

# A labelled closed cap of cardinality six.  Its endpoints are 5 and 8; the
# other four vertices are labelled strict-cap points.  Exactly three members
# of the physical class are strict-cap points.
CAP_BOUNDARY_ORDER = (5, FIRST_SOURCE, UNUSED_SOURCE, SECOND_SOURCE, 3, 8)
CAP = frozenset(CAP_BOUNDARY_ORDER)
CAP_INTERIOR = frozenset(CAP_BOUNDARY_ORDER[1:-1])

# Source-exact blockers for the two paired sources.  Their exact shells omit
# the other paired source, allowing the displayed two-cycle.
FIRST_BLOCKER = 20
SECOND_BLOCKER = 21
PAIRED_SUCCESSOR = {
    FIRST_SOURCE: SECOND_SOURCE,
    SECOND_SOURCE: FIRST_SOURCE,
}

# Filled after the first exact run.  It hashes only mathematical model data.
EXPECTED_MODEL_SHA256 = "db4d45278e5f412212fbef2f5903959a831ef952434ee892642d7f5f779242aa"


def base_support(center: int) -> frozenset[int]:
    return frozenset((center + offset) % N for offset in BASE_OFFSETS)


def radius_classes(center: int) -> tuple[frozenset[int], ...]:
    if center == PHYSICAL_CENTER:
        return (PHYSICAL_CLASS,)
    if center == ACTUAL_UNUSED_BLOCKER:
        return (UNUSED_SHELL,)
    return (base_support(center),)


def blocker(source: int) -> int:
    """A total deletion-critical blocker assignment."""

    if source == UNUSED_SOURCE:
        return ACTUAL_UNUSED_BLOCKER
    if source == FIRST_SOURCE:
        return FIRST_BLOCKER
    if source == SECOND_SOURCE:
        return SECOND_BLOCKER
    for offset in sorted(BASE_OFFSETS):
        candidate = (source - offset) % N
        if candidate not in FIXED_CENTERS:
            return candidate
    raise AssertionError("every source has a nonfixed predecessor blocker")


def critical_shell(source: int) -> frozenset[int]:
    return radius_classes(blocker(source))[0]


def declared_radius_owners(x: int, y: int) -> list[tuple[int, int]]:
    owners: list[tuple[int, int]] = []
    for center, point in ((x, y), (y, x)):
        for index, row in enumerate(radius_classes(center)):
            if point in row:
                owners.append((center, index))
    return owners


def distance_label(x: int, y: int) -> tuple[object, ...]:
    if x == y:
        return ("zero",)
    owners = declared_radius_owners(x, y)
    assert len(owners) <= 1
    if owners:
        center, index = owners[0]
        return ("radius", center, index)
    return ("edge", min(x, y), max(x, y))


def positive_labels() -> tuple[tuple[object, ...], ...]:
    return tuple(
        sorted(
            {
                distance_label(x, y)
                for x in VERTICES
                for y in VERTICES
                if x != y
            },
            key=repr,
        )
    )


POSITIVE_LABELS = positive_labels()
LABEL_INDEX = {label: index for index, label in enumerate(POSITIVE_LABELS)}


def distance(x: int, y: int) -> Fraction:
    """A rational metric realizing exactly the declared equality labels."""

    if x == y:
        return Fraction(0)
    index = LABEL_INDEX[distance_label(x, y)]
    return Fraction(1) + Fraction(index, 2 * (len(POSITIVE_LABELS) + 1))


def exact_classes_at(
    center: int, deleted: frozenset[int] = frozenset()
) -> tuple[frozenset[int], ...]:
    classes: dict[Fraction, set[int]] = defaultdict(set)
    for point in VERTICES:
        if point not in deleted:
            classes[distance(center, point)].add(point)
    return tuple(
        sorted(
            (frozenset(points) for points in classes.values() if len(points) >= 4),
            key=lambda row: tuple(sorted(row)),
        )
    )


def canonical_packet_rows(source: int) -> tuple[frozenset[int], frozenset[int]]:
    assert source in PAIRED_SUCCESSOR
    return UNUSED_SHELL, PHYSICAL_CLASS - {source}


def paired_fresh_candidates(source: int) -> frozenset[int]:
    row_at_blocker, row_at_physical = canonical_packet_rows(source)
    return (row_at_blocker | row_at_physical) - critical_shell(source)


def model_payload() -> dict[str, object]:
    return {
        "cardinality": N,
        "physical_center": PHYSICAL_CENTER,
        "physical_class": sorted(PHYSICAL_CLASS),
        "actual_unused_blocker": ACTUAL_UNUSED_BLOCKER,
        "unused_source": UNUSED_SOURCE,
        "unused_shell": sorted(UNUSED_SHELL),
        "cap_boundary_order": list(CAP_BOUNDARY_ORDER),
        "cap_interior": sorted(CAP_INTERIOR),
        "paired_sources": [FIRST_SOURCE, SECOND_SOURCE],
        "paired_successor": {
            str(source): target for source, target in PAIRED_SUCCESSOR.items()
        },
        "total_blocker_map": [blocker(source) for source in VERTICES],
        "total_critical_shells": [
            sorted(critical_shell(source)) for source in VERTICES
        ],
        "positive_distance_labels": len(POSITIVE_LABELS),
    }


def model_sha256() -> str:
    encoded = json.dumps(
        model_payload(), sort_keys=True, separators=(",", ":")
    ).encode("utf-8")
    return hashlib.sha256(encoded).hexdigest()


def check() -> dict[str, object]:
    # The equality labels define a symmetric rational metric.
    for x in VERTICES:
        assert distance(x, x) == 0
        for y in VERTICES:
            assert distance(x, y) == distance(y, x)
            if x != y:
                assert 1 <= distance(x, y) < Fraction(3, 2)
            for z in VERTICES:
                assert distance(x, z) <= distance(x, y) + distance(y, z)

    # Declared radius classes are exact, and distinct centers' large classes
    # obey the Euclidean two-circle overlap ceiling.
    for center in VERTICES:
        assert set(exact_classes_at(center)) == set(radius_classes(center))
    max_overlap = 0
    for center_1 in VERTICES:
        for center_2 in VERTICES:
            if center_1 >= center_2:
                continue
            for row_1 in radius_classes(center_1):
                for row_2 in radius_classes(center_2):
                    overlap = len(row_1 & row_2)
                    max_overlap = max(max_overlap, overlap)
                    assert overlap <= 2

    # Global K4 and a total source-exact deletion-critical shell system.
    for source in VERTICES:
        center = blocker(source)
        shell = critical_shell(source)
        assert center != source
        assert source in shell
        assert len(shell) == 4
        assert exact_classes_at(center, frozenset({source})) == ()

    # Exact-five profile and unused-source provenance.
    assert exact_classes_at(PHYSICAL_CENTER) == (PHYSICAL_CLASS,)
    assert len(PHYSICAL_CLASS) == 5
    assert len(CAP) == 6
    assert UNUSED_SOURCE in CAP
    assert UNUSED_SOURCE not in PHYSICAL_CLASS
    assert len(PHYSICAL_CLASS & CAP_INTERIOR) == 3
    assert exact_classes_at(
        PHYSICAL_CENTER, frozenset({UNUSED_SOURCE})
    ) == (PHYSICAL_CLASS,)
    assert blocker(UNUSED_SOURCE) == ACTUAL_UNUSED_BLOCKER
    assert critical_shell(UNUSED_SOURCE) == UNUSED_SHELL
    assert FIRST_SOURCE not in UNUSED_SHELL
    assert SECOND_SOURCE not in UNUSED_SHELL

    # Both source-faithful common-deletion packets at the same two centers.
    packet_data = []
    for source in (FIRST_SOURCE, SECOND_SOURCE):
        row_at_blocker, row_at_physical = canonical_packet_rows(source)
        deleted = frozenset({source})
        assert source in PHYSICAL_CLASS & CAP_INTERIOR
        assert source not in UNUSED_SHELL
        assert row_at_blocker in exact_classes_at(ACTUAL_UNUSED_BLOCKER, deleted)
        assert row_at_physical in exact_classes_at(PHYSICAL_CENTER, deleted)
        assert len(row_at_blocker) == len(row_at_physical) == 4
        assert len(row_at_blocker & row_at_physical) <= 2

        successor = PAIRED_SUCCESSOR[source]
        fresh = paired_fresh_candidates(source)
        assert successor in fresh
        assert successor != source
        assert blocker(successor) != blocker(source)
        packet_data.append(
            {
                "source": source,
                "source_blocker": blocker(source),
                "rows": [sorted(row_at_blocker), sorted(row_at_physical)],
                "fresh_candidates": sorted(fresh),
                "successor": successor,
                "successor_blocker": blocker(successor),
            }
        )

    # The paired successor really returns to its start after two steps.
    assert PAIRED_SUCCESSOR[PAIRED_SUCCESSOR[FIRST_SOURCE]] == FIRST_SOURCE
    assert PAIRED_SUCCESSOR[FIRST_SOURCE] != FIRST_SOURCE

    digest = model_sha256()
    if EXPECTED_MODEL_SHA256:
        assert digest == EXPECTED_MODEL_SHA256

    return {
        "status": "PASS",
        "scope": (
            "exact rational finite metric with source-faithful exact-five, "
            "total-critical-shell, and paired-common-deletion data; not a "
            "Euclidean/convex/MEC realization"
        ),
        "model_sha256": digest,
        "cardinality": N,
        "max_distinct_center_large_class_intersection": max_overlap,
        "physical_class_cardinality": len(PHYSICAL_CLASS),
        "physical_class_strict_cap_hits": len(PHYSICAL_CLASS & CAP_INTERIOR),
        "unused_shell_physical_hits": len(UNUSED_SHELL & PHYSICAL_CLASS),
        "paired_cycle": [FIRST_SOURCE, SECOND_SOURCE, FIRST_SOURCE],
        "paired_packets": packet_data,
    }


if __name__ == "__main__":
    print(json.dumps(check(), indent=2, sort_keys=True))
