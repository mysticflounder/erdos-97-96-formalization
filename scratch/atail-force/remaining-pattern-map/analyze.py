#!/usr/bin/env python3
"""Exact support-motif census over the current ATAIL finite survivors.

This analysis deliberately stays below the geometric proof boundary.  It
reuses the exhaustive classifier, then quotients each surviving pair by the
five canonical label roles

    third Moser apex / opposite endpoint / S interior / O1 interior / O2 interior.

The output is useful for selecting the next metric consumer, but no motif is
claimed to be geometrically impossible merely because it is frequent.
"""

from __future__ import annotations

import argparse
import json
import sys
from collections import Counter
from itertools import product
from pathlib import Path
from typing import Any

ROOT = Path(__file__).resolve().parents[3]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from census.atail_force import producer_coverage_census as coverage
from census.atail_force import producer_surface as surface


EXPECTED_SURVIVORS = 87_916
EXPECTED_POST_ONE_HIT_SURVIVORS = 930


def survivor_pairs(case: surface.ProducerCase):
    """Yield the 87,916 survivors of the classifier before one-hit reuse."""

    off = set(surface.off_surplus_labels(case))
    seconds = tuple(surface.iter_exact_apex_classes(case, "opp_apex2"))
    for first, second in product(
        surface.iter_exact_apex_classes(case, "opp_apex1"), seconds
    ):
        if len(off & set(first.support) & set(second.support)) > 1:
            continue
        if coverage.two_exact_row_bank_stages(case, first, second):
            continue
        if coverage.endpoint_containment_patterns(case, first, second):
            continue
        if coverage.inward_witnesses(case, first, second) is not None:
            continue
        if coverage.boundary_chord_straddling_witnesses(case, first, second) is not None:
            continue
        yield first, second


def row_signature(
    case: surface.ProducerCase,
    exact: surface.ExactApexClass,
    opposite: int,
) -> tuple[int, int, int, int, int]:
    frame = surface.frame_for_case(case)
    support = set(exact.support)
    return (
        int(0 in support),
        int(opposite in support),
        len(support & set(frame.ints["S"])),
        len(support & set(frame.ints["O1"])),
        len(support & set(frame.ints["O2"])),
    )


def motifs(case: surface.ProducerCase, first, second) -> tuple[str, ...]:
    frame = surface.frame_for_case(case)
    a = set(first.support)
    b = set(second.support)
    labels: list[str] = []

    first_endpoint_ready = {0, case.opp_apex2} <= a
    second_endpoint_ready = {0, case.opp_apex1} <= b
    if first_endpoint_ready:
        labels.append("endpoint_arc_containment_ready:first")
    if second_endpoint_ready:
        labels.append("endpoint_arc_containment_ready:second")
    if first_endpoint_ready or second_endpoint_ready:
        labels.append("endpoint_arc_containment_ready:any")
    if first_endpoint_ready and second_endpoint_ready:
        labels.append("endpoint_arc_containment_ready:both")

    first_opposite = case.opp_apex2 in a
    second_opposite = case.opp_apex1 in b
    if first_opposite or second_opposite:
        labels.append("boundary_chord_available:any")
    if first_opposite and second_opposite:
        labels.append("boundary_chord_available:both")
    if not first_opposite and not second_opposite:
        labels.append("boundary_chord_available:neither")
    if first_opposite != second_opposite:
        labels.append("boundary_chord_available:exactly_one")

    if 0 in a and 0 in b:
        labels.append("shared_third_moser_apex")

    # A ready row that survives endpoint-radius classification has already
    # been forced into its opposite closed cap by the production theorem.
    if set(first.support) == set(frame.O1):
        labels.append("closed_opposite_cap_saturated:first")
    if set(second.support) == set(frame.O2):
        labels.append("closed_opposite_cap_saturated:second")
    if set(first.support) == set(frame.O1) or set(second.support) == set(frame.O2):
        labels.append("closed_opposite_cap_saturated:any")
    if a <= set(frame.O1):
        labels.append("own_opposite_cap_containment:first")
    if b <= set(frame.O2):
        labels.append("own_opposite_cap_containment:second")
    if a <= set(frame.O1) or b <= set(frame.O2):
        labels.append("own_opposite_cap_containment:any")
    if a <= set(frame.O1) and b <= set(frame.O2):
        labels.append("own_opposite_cap_containment:both")

    # Cross-cap-heavy rows are the simplest remaining support templates on
    # which a cap midpoint inequality could plausibly interact with the
    # selected-four equal-radius circle.
    first_cross_heavy = len(a & set(frame.ints["O2"])) >= 2
    second_cross_heavy = len(b & set(frame.ints["O1"])) >= 2
    if first_cross_heavy:
        labels.append("foreign_cap_interior_pair:first")
    if second_cross_heavy:
        labels.append("foreign_cap_interior_pair:second")
    if first_cross_heavy or second_cross_heavy:
        labels.append("foreign_cap_interior_pair:any")
    if first_cross_heavy and second_cross_heavy:
        labels.append("foreign_cap_interior_pair:both")

    # These are exact matches for the already-proved unconditional one-hit
    # consumers in U2NonSurplusOneHit.  The foreign closed cap for the first
    # apex is O2; for the second apex it is O1.  The row center itself is not
    # in its positive-radius class, so the only non-interior contribution is
    # the third Moser apex 0.
    first_other_cap = len(a & set(frame.O2)) >= 2
    second_other_cap = len(b & set(frame.O1)) >= 2
    if first_other_cap:
        labels.append("other_cap_one_hit_violation:first")
    if second_other_cap:
        labels.append("other_cap_one_hit_violation:second")
    if first_other_cap or second_other_cap:
        labels.append("other_cap_one_hit_violation:any")
    if first_other_cap and second_other_cap:
        labels.append("other_cap_one_hit_violation:both")

    first_surplus_cap = len(a & set(frame.S)) >= 2
    second_surplus_cap = len(b & set(frame.S)) >= 2
    if first_surplus_cap:
        labels.append("surplus_cap_one_hit_violation:first")
    if second_surplus_cap:
        labels.append("surplus_cap_one_hit_violation:second")
    if first_surplus_cap or second_surplus_cap:
        labels.append("surplus_cap_one_hit_violation:any")
    if first_surplus_cap and second_surplus_cap:
        labels.append("surplus_cap_one_hit_violation:both")

    first_adjacent = first_other_cap or first_surplus_cap
    second_adjacent = second_other_cap or second_surplus_cap
    if first_adjacent:
        labels.append("adjacent_cap_one_hit_violation:first")
    if second_adjacent:
        labels.append("adjacent_cap_one_hit_violation:second")
    if first_adjacent or second_adjacent:
        labels.append("adjacent_cap_one_hit_violation:any")
    if first_adjacent and second_adjacent:
        labels.append("adjacent_cap_one_hit_violation:both")

    # Same-cap pairs are where the already-proved cap-arc midpoint inequality
    # is immediately instantiable, although a contradictory upper bound is
    # still absent.
    for cap in ("S", "O1", "O2"):
        interior = set(frame.ints[cap])
        if len(a & interior) >= 2:
            labels.append(f"same_cap_interior_pair:first:{cap}")
        if len(b & interior) >= 2:
            labels.append(f"same_cap_interior_pair:second:{cap}")

    return tuple(labels)


def build() -> dict[str, Any]:
    case_records = []
    totals: Counter[str] = Counter()
    pair_signatures: Counter[str] = Counter()
    for case in surface.PRODUCER_CASES:
        count = 0
        motif_counts: Counter[str] = Counter()
        signature_counts: Counter[str] = Counter()
        post_one_hit_motif_counts: Counter[str] = Counter()
        post_one_hit_signatures: Counter[str] = Counter()
        post_one_hit_representatives: list[dict[str, Any]] = []
        for first, second in survivor_pairs(case):
            count += 1
            pair_motifs = motifs(case, first, second)
            motif_counts.update(pair_motifs)
            signature = (
                row_signature(case, first, case.opp_apex2),
                row_signature(case, second, case.opp_apex1),
            )
            key = json.dumps(signature, separators=(",", ":"))
            signature_counts[key] += 1
            pair_signatures[f"{case.case_id}:{key}"] += 1
            if "adjacent_cap_one_hit_violation:any" not in pair_motifs:
                post_one_hit_motif_counts.update(pair_motifs)
                post_one_hit_signatures[key] += 1
                if len(post_one_hit_representatives) < 20:
                    post_one_hit_representatives.append(
                        {
                            "first": list(first.support),
                            "second": list(second.support),
                            "signature": signature,
                        }
                    )
        totals.update(motif_counts)
        case_records.append(
            {
                "case_id": case.case_id,
                "survivors": count,
                "motif_counts": dict(sorted(motif_counts.items())),
                "signature_class_count": len(signature_counts),
                "post_one_hit_survivors": sum(post_one_hit_signatures.values()),
                "post_one_hit_motif_counts": dict(
                    sorted(post_one_hit_motif_counts.items())
                ),
                "post_one_hit_signature_classes": [
                    {"signature": json.loads(key), "count": value}
                    for key, value in post_one_hit_signatures.most_common()
                ],
                "post_one_hit_representatives": post_one_hit_representatives,
                "top_signature_classes": [
                    {"signature": json.loads(key), "count": value}
                    for key, value in signature_counts.most_common(20)
                ],
            }
        )
    total_survivors = sum(record["survivors"] for record in case_records)
    if total_survivors != EXPECTED_SURVIVORS:
        raise AssertionError(f"survivor total drift: {total_survivors}")
    post_one_hit_survivors = sum(
        record["post_one_hit_survivors"] for record in case_records
    )
    if post_one_hit_survivors != EXPECTED_POST_ONE_HIT_SURVIVORS:
        raise AssertionError(
            f"post-one-hit survivor total drift: {post_one_hit_survivors}"
        )
    return {
        "epistemic_status": "EXHAUSTIVE_FINITE_COMBINATORIAL_ANALYSIS_ONLY",
        "signature_fields": [
            "contains_third_moser_apex_0",
            "contains_opposite_endpoint",
            "S_interior_count",
            "O1_interior_count",
            "O2_interior_count",
        ],
        "survivors": total_survivors,
        "post_one_hit_survivors": post_one_hit_survivors,
        "motif_counts": dict(sorted(totals.items())),
        "total_signature_class_count_case_sensitive": len(pair_signatures),
        "cases": case_records,
    }


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    document = build()
    if args.check:
        print(
            json.dumps(
                {
                    "survivors": document["survivors"],
                    "post_one_hit_survivors": document[
                        "post_one_hit_survivors"
                    ],
                    "total_signature_class_count_case_sensitive": document[
                        "total_signature_class_count_case_sensitive"
                    ],
                },
                sort_keys=True,
            )
        )
    else:
        print(json.dumps(document, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
