#!/usr/bin/env python3
"""Exhaustive solver-free coverage census for the ATAIL producer surface.

The census ranges over *full* exact-class pairs, once per pair (selected K4
witnesses do not multiply the search), and retains only the finite target
negation.  Classification is deliberately ordered:

1. a formalized equality/order bank pattern;
2. an endpoint-radius cap-containment contradiction;
3. a production adjacent-cap one-hit contradiction;
4. the scratch-only opposed-inward two-center MEC pattern;
5. the scratch-only one-center boundary-chord straddling MEC pattern;
6. an explicit survivor.

This is a finite incidence/order audit.  In particular, stages 3 and 4 do not
prove that the live leaf supplies the MEC disk and signed-area hypotheses of
the scratch Lean kernels.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import os
from collections import Counter
from dataclasses import dataclass
from functools import lru_cache
from itertools import combinations, product
from pathlib import Path
import tempfile
from typing import Any, Iterable, Literal, Sequence

from census.atail_force import producer_surface as surface


SCHEMA = "p97_atail_force_producer_coverage_census.v1"
HERE = Path(__file__).resolve().parent
DEFAULT_CHECKPOINT = HERE / "producer_coverage_census_checkpoint.json"
Classification = Literal[
    "formalized_bank",
    "endpoint_radius_containment",
    "adjacent_cap_one_hit",
    "two_center_mec_inward",
    "boundary_chord_straddling_mec",
    "survivor",
]
EXPECTED_TARGET_NEGATING_PAIRS = 369_743

LEFT_ADJACENT_ONE_HIT = (
    "Problem97.SurplusCapPacket."
    "leftAdjacentCap_at_opposite_card_le_one_of_convexIndep"
)
RIGHT_ADJACENT_ONE_HIT = (
    "Problem97.SurplusCapPacket."
    "rightAdjacentCap_at_opposite_card_le_one_of_convexIndep"
)


class CoverageCensusError(ValueError):
    """The finite census or its stored checkpoint violates its contract."""


@dataclass(frozen=True)
class ClassificationResult:
    classification: Classification
    patterns: tuple[str, ...]
    witnesses: tuple[int, ...] = ()


@lru_cache(maxsize=None)
def cyclic_order(case: surface.ProducerCase) -> tuple[int, ...]:
    """The fixed cap-compatible order used by the producer geometry lift."""

    frame = surface.frame_for_case(case)
    return (0, *frame.ints["O2"], 1, *frame.ints["S"], 2, *frame.ints["O1"])


def open_cyclic_arc(
    order: Sequence[int], start: int, end: int
) -> tuple[int, ...]:
    positions = {label: index for index, label in enumerate(order)}
    if len(positions) != len(order) or start not in positions or end not in positions:
        raise ValueError("invalid cyclic order or arc endpoint")
    n = len(order)
    return tuple(
        order[(positions[start] + offset) % n]
        for offset in range(1, (positions[end] - positions[start]) % n)
    )


def two_exact_row_bank_stages(
    case: surface.ProducerCase,
    first: surface.ExactApexClass,
    second: surface.ExactApexClass,
) -> tuple[str, ...]:
    """Fast bank-existence predicate specialized to two exact star rows.

    A two-row arity audit of ``producer_bank`` leaves the three equality/order
    families below.  The implementation evaluates their defining closure
    predicates directly.  Regression tests compare this specialization with
    the complete all-match scanner on deterministic samples from every case.
    """

    first_support = set(first.support)
    second_support = set(second.support)
    common = first_support & second_support
    merged = (
        second.center in first_support and first.center in second_support
    )
    stages: list[str] = []

    # The two exact star rows contain two circles through a common triple
    # exactly when their supports have at least three common labels.  The
    # radii need not agree for this duplicate-center obstruction.
    if len(common) >= 3:
        stages.append("equality-duplicate-center")

    # If the center-center edge occurs in both rows, the two radius classes
    # merge.  Every common noncenter label is then equidistant from the two
    # centers, so a common triple is precisely the convex-perpendicular core.
    if merged and len(common) >= 3:
        stages.append("equality-perpendicular-bisector-convex")

    # FourPointTwoCircleBisectorOrderCore.  Its two intersections are exactly
    # two common support labels.  The order condition says they lie on the
    # same one of the two open arcs between the row centers.  Reversing the
    # cyclic order preserves existence and records the second bank consumer.
    order = cyclic_order(case)
    first_arc = set(open_cyclic_arc(order, first.center, second.center))
    second_arc = set(open_cyclic_arc(order, second.center, first.center))
    four_point = (
        len(common & first_arc) >= 2 or len(common & second_arc) >= 2
    )
    if four_point:
        stages.extend(
            (
                "equality-convex-four-point-two-circle-bisector-order",
                "equality-convex-four-point-two-circle-bisector-order-reverse",
            )
        )
    return tuple(stages)


def endpoint_containment_patterns(
    case: surface.ProducerCase,
    first: surface.ExactApexClass,
    second: surface.ExactApexClass,
) -> tuple[str, ...]:
    """Production endpoint-radius subset consumers contradicted by escape."""

    frame = surface.frame_for_case(case)
    patterns: list[str] = []
    if {case.opp_apex2, 0} <= set(first.support) and not set(first.support) <= set(frame.O1):
        patterns.append(
            "U2NonSurplusSqueeze.oppApex1_filter_subset_oppCap1_of_endpointRadius"
        )
    if {case.opp_apex1, 0} <= set(second.support) and not set(second.support) <= set(frame.O2):
        patterns.append(
            "U2NonSurplusSqueeze.oppApex2_filter_subset_oppCap2_of_endpointRadius"
        )
    return tuple(patterns)


def adjacent_cap_one_hit_patterns(
    case: surface.ProducerCase,
    first: surface.ExactApexClass,
    second: surface.ExactApexClass,
) -> tuple[str, ...]:
    """Production one-hit consumers violated by an exact apex class.

    In the canonical cap orientation, the first exact class is centered at
    the vertex opposite ``O1``.  Its left adjacent cap is ``O2`` and its right
    adjacent cap is ``S``.  The second class is centered opposite ``O2``; its
    left adjacent cap is ``S`` and its right adjacent cap is ``O1``.

    The two named ``SurplusCapPacket`` theorems are uniform in the packet, so
    they apply to the live ``leafSurplusPacket`` without identifying it with
    ``D.packet``.  Each theorem bounds the relevant selected-class/cap
    intersection by one; two support labels therefore contradict it.
    """

    frame = surface.frame_for_case(case)
    first_support = set(first.support)
    second_support = set(second.support)
    patterns: list[str] = []
    if len(first_support & set(frame.O2)) >= 2:
        patterns.append(LEFT_ADJACENT_ONE_HIT)
    if len(first_support & set(frame.S)) >= 2:
        patterns.append(RIGHT_ADJACENT_ONE_HIT)
    if len(second_support & set(frame.S)) >= 2:
        patterns.append(LEFT_ADJACENT_ONE_HIT)
    if len(second_support & set(frame.O1)) >= 2:
        patterns.append(RIGHT_ADJACENT_ONE_HIT)
    # A pair can violate the same theorem in both apex orientations.  The
    # census records consumer families per pair, not embedding multiplicity.
    return tuple(dict.fromkeys(patterns))


def inward_witnesses(
    case: surface.ProducerCase,
    first: surface.ExactApexClass,
    second: surface.ExactApexClass,
) -> tuple[int, int] | None:
    order = cyclic_order(case)
    first_arc = set(open_cyclic_arc(order, case.opp_apex1, case.opp_apex2))
    second_arc = set(open_cyclic_arc(order, case.opp_apex2, case.opp_apex1))
    xs = [x for x in order if x in first_arc and x in first.support]
    ys = [y for y in order if y in second_arc and y in second.support]
    if case.opp_apex2 in first.support and xs and case.opp_apex1 in second.support and ys:
        return xs[0], ys[0]
    return None


def boundary_chord_straddling_witnesses(
    case: surface.ProducerCase,
    first: surface.ExactApexClass,
    second: surface.ExactApexClass,
) -> tuple[int, int, int, int] | None:
    """Return ``(center, opposite, x, y)`` for the first straddling row.

    For a row centered at ``b`` and containing the opposite boundary endpoint
    ``a``, the positive kernel orientation uses ``x`` on the open arc
    ``a -> b`` and ``y`` on the complementary open arc ``b -> a``.
    """

    order = cyclic_order(case)
    for exact, opposite in (
        (first, case.opp_apex2),
        (second, case.opp_apex1),
    ):
        if opposite not in exact.support:
            continue
        x_arc = set(open_cyclic_arc(order, opposite, exact.center))
        y_arc = set(open_cyclic_arc(order, exact.center, opposite))
        xs = [label for label in order if label in x_arc and label in exact.support]
        ys = [label for label in order if label in y_arc and label in exact.support]
        if xs and ys:
            return exact.center, opposite, xs[0], ys[0]
    return None


def classify_pair(
    case: surface.ProducerCase,
    first: surface.ExactApexClass,
    second: surface.ExactApexClass,
) -> ClassificationResult:
    bank = two_exact_row_bank_stages(case, first, second)
    if bank:
        return ClassificationResult("formalized_bank", bank)
    endpoint = endpoint_containment_patterns(case, first, second)
    if endpoint:
        return ClassificationResult("endpoint_radius_containment", endpoint)
    one_hit = adjacent_cap_one_hit_patterns(case, first, second)
    if one_hit:
        return ClassificationResult("adjacent_cap_one_hit", one_hit)
    inward = inward_witnesses(case, first, second)
    if inward is not None:
        return ClassificationResult(
            "two_center_mec_inward",
            (
                "Problem97.ATailForce.OpposedEqualChordMECCore."
                "metric_orientation_incompatibility",
            ),
            inward,
        )
    straddling = boundary_chord_straddling_witnesses(case, first, second)
    if straddling is not None:
        return ClassificationResult(
            "boundary_chord_straddling_mec",
            (
                "Problem97.ATailForce.BoundaryChordStraddlingMECCore."
                "metric_orientation_incompatibility",
            ),
            straddling,
        )
    return ClassificationResult("survivor", ())


def _support_record(
    first: surface.ExactApexClass,
    second: surface.ExactApexClass,
    result: ClassificationResult,
) -> dict[str, Any]:
    return {
        "opp_apex1_support": list(first.support),
        "opp_apex2_support": list(second.support),
        "classification": result.classification,
        "patterns": list(result.patterns),
        "witnesses": list(result.witnesses),
    }


def census_case(case: surface.ProducerCase) -> dict[str, Any]:
    second_classes = tuple(surface.iter_exact_apex_classes(case, "opp_apex2"))
    off = set(surface.off_surplus_labels(case))
    counts: Counter[str] = Counter()
    pattern_counts: Counter[str] = Counter()
    representatives: dict[str, list[dict[str, Any]]] = {
        name: []
        for name in (
            "formalized_bank",
            "endpoint_radius_containment",
            "adjacent_cap_one_hit",
            "two_center_mec_inward",
            "boundary_chord_straddling_mec",
            "survivor",
        )
    }
    digest = hashlib.sha256()
    raw = target_negating = 0
    for first, second in product(
        surface.iter_exact_apex_classes(case, "opp_apex1"), second_classes
    ):
        raw += 1
        if len(off & set(first.support) & set(second.support)) > 1:
            continue
        target_negating += 1
        result = classify_pair(case, first, second)
        counts[result.classification] += 1
        pattern_counts.update(result.patterns)
        record = _support_record(first, second, result)
        digest.update(
            (json.dumps(record, sort_keys=True, separators=(",", ":")) + "\n").encode()
        )
        if len(representatives[result.classification]) < 3:
            representatives[result.classification].append(record)
    return {
        "case_id": case.case_id,
        "raw_full_exact_class_pairs": raw,
        "target_negating_pairs": target_negating,
        "classification_counts": dict(sorted(counts.items())),
        "pattern_counts": dict(sorted(pattern_counts.items())),
        "classification_stream_sha256": digest.hexdigest(),
        "representatives": representatives,
    }


def build_checkpoint() -> dict[str, Any]:
    cases = [census_case(case) for case in surface.PRODUCER_CASES]
    totals: Counter[str] = Counter()
    for case in cases:
        totals.update(case["classification_counts"])
    return {
        "schema": SCHEMA,
        "epistemic_status": "EXHAUSTIVE_FINITE_COMBINATORIAL_COVERAGE_ONLY",
        "cases": cases,
        "total_classification_counts": dict(sorted(totals.items())),
        "classification_precedence": [
            "formalized_bank",
            "endpoint_radius_containment",
            "adjacent_cap_one_hit",
            "two_center_mec_inward",
            "boundary_chord_straddling_mec",
            "survivor",
        ],
        "scope": {
            "solver_invoked": False,
            "full_exact_class_pairs": True,
            "target_negation_required": True,
            "selected_four_choices_enumerated": False,
            "geometry_kernel_production_imported": False,
            "live_extraction_theorem_proved": False,
            "lean_proof_claim": False,
        },
        "omitted": [
            "Euclidean coordinates and metric realizability",
            "production import of either scratch MEC kernel",
            "extraction of MEC disk and signed-area hypotheses from the live leaf",
            "a proof that every combinatorial survivor is geometrically realizable",
        ],
    }


def canonical_json(value: Any) -> str:
    return json.dumps(value, indent=2, sort_keys=True) + "\n"


def validate_checkpoint(document: dict[str, Any]) -> None:
    if document.get("schema") != SCHEMA:
        raise CoverageCensusError("checkpoint schema drift")
    cases = document.get("cases")
    if not isinstance(cases, list) or len(cases) != len(surface.PRODUCER_CASES):
        raise CoverageCensusError("checkpoint case count drift")
    target_total = sum(int(case.get("target_negating_pairs", -1)) for case in cases)
    if target_total != EXPECTED_TARGET_NEGATING_PAIRS:
        raise CoverageCensusError(
            f"target-negating pair count drift: {target_total}"
        )
    totals = Counter()
    for case in cases:
        counts = case.get("classification_counts")
        if not isinstance(counts, dict):
            raise CoverageCensusError("missing classification counts")
        totals.update({str(key): int(value) for key, value in counts.items()})
    if sum(totals.values()) != EXPECTED_TARGET_NEGATING_PAIRS:
        raise CoverageCensusError("classification counts do not exhaust the surface")
    if dict(sorted(totals.items())) != document.get("total_classification_counts"):
        raise CoverageCensusError("stored total classification counts drift")
    if document.get("classification_precedence") != list(Classification.__args__):
        raise CoverageCensusError("classification precedence drift")


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


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    mode = parser.add_mutually_exclusive_group(required=True)
    mode.add_argument("--run", action="store_true")
    mode.add_argument("--check", action="store_true")
    parser.add_argument("--checkpoint", type=Path, default=DEFAULT_CHECKPOINT)
    args = parser.parse_args()
    if args.run:
        document = build_checkpoint()
        validate_checkpoint(document)
        _write_atomic(args.checkpoint, canonical_json(document))
        print(canonical_json(document["total_classification_counts"]), end="")
        return
    try:
        stored = json.loads(args.checkpoint.read_text(encoding="utf-8"))
    except (OSError, json.JSONDecodeError) as exc:
        raise CoverageCensusError(f"cannot load checkpoint: {exc}") from exc
    validate_checkpoint(stored)
    current = build_checkpoint()
    validate_checkpoint(current)
    if stored != current:
        raise CoverageCensusError("checkpoint differs from a fresh exhaustive census")
    print(canonical_json(stored["total_classification_counts"]), end="")


if __name__ == "__main__":
    main()
