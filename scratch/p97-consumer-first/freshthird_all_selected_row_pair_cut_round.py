#!/usr/bin/env python3
"""Exact FreshThird round after closing all named-row shared-pair motifs."""

from __future__ import annotations

import sys
from itertools import combinations
from pathlib import Path

from z3 import And, Not, Or

HERE = Path(__file__).resolve().parent
if str(HERE) not in sys.path:
    sys.path.insert(0, str(HERE))

import freshthird_all_row_shared_pair_cut_round as Previous  # noqa: E402
import freshthird_full_fidelity_cegar as F  # noqa: E402


def add_all_named_row_pair_cuts(solver, context):
    """Apply shared-pair separation between every pair of named rows."""
    ranks = context["ranks"]
    known_rows = (
        ("sourceCenter", F.SOURCE_SHELL),
        ("freshCenter", F.FRESH_SHELL),
        ("pinnedCenter", F.ROW),
        ("drowCenter", F.DROW),
    )
    cut_count = 0
    for (first_center, first_support), (second_center, second_support) in combinations(
        known_rows, 2
    ):
        center_one = ranks[first_center]
        center_two = ranks[second_center]
        for first, second in combinations(first_support, 2):
            first_shared = Or(
                *[ranks[first] == ranks[point] for point in second_support]
            )
            second_shared = Or(
                *[ranks[second] == ranks[point] for point in second_support]
            )
            premise = And(
                center_one != center_two,
                first_shared,
                second_shared,
            )
            separated = (
                Previous.between(center_one, center_two, ranks[first])
                != Previous.between(center_one, center_two, ranks[second])
            )
            solver.add(Or(Not(premise), separated))
            cut_count += 1
    return cut_count


if __name__ == "__main__":
    Previous.main(
        extra_cut=add_all_named_row_pair_cuts,
        output_file=__file__,
        campaign="freshthird_all_selected_row_pair_cut_round_v1",
        extra_lines=(
            "extra_cut_source=Problem97.selectedFourClass_shared_pair_separated",
            "extra_cut_semantics=every pair of named selected rows alternates any two common support points across distinct centers",
        ),
    )
