#!/usr/bin/env python3
"""Exact producer-signature audit for the 930-case ATAIL residue.

The input is the current post-one-hit survivor stream.  This program measures
only finite support/equality embeddings into already proved consumers.  A
reported embedding means that the finite row supplies the consumer's static
apex-class fields; it does *not* assert that the missing critical-row fields
follow from the live hypotheses.
"""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import itertools
import json
import sys
from collections import Counter
from pathlib import Path
from typing import Any

import numpy as np


ROOT = Path(__file__).resolve().parents[3]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from census.atail_force import producer_coverage_census as coverage
from census.atail_force import producer_surface as surface


HERE = Path(__file__).resolve().parent
CHECKPOINT = HERE / "analysis.json"
REMAINING_ANALYZER = ROOT / "scratch/atail-force/remaining-pattern-map/analyze.py"
EXPECTED_PROFILE_COUNTS = {
    "card11_profile_554": 96,
    "card12_profile_654": 150,
    "card12_profile_555": 684,
}


def _load_remaining_analyzer():
    spec = importlib.util.spec_from_file_location(
        "atail_remaining_pattern_map", REMAINING_ANALYZER
    )
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot load {REMAINING_ANALYZER}")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


remaining = _load_remaining_analyzer()


def residue_pairs(case: surface.ProducerCase):
    """Yield the post-production-one-hit residue, with a drift assertion."""

    count = 0
    for first, second in remaining.survivor_pairs(case):
        if "adjacent_cap_one_hit_violation:any" in remaining.motifs(
            case, first, second
        ):
            continue
        count += 1
        yield first, second
    expected = EXPECTED_PROFILE_COUNTS[case.case_id]
    if count != expected:
        raise AssertionError(
            f"{case.case_id} residue drift: observed {count}, expected {expected}"
        )


def _edge_index(n: int, left: np.ndarray, right: np.ndarray) -> np.ndarray:
    """Vectorized lexicographic index of unordered edges of K_n."""

    lo = np.minimum(left, right)
    hi = np.maximum(left, right)
    if np.any(lo == hi):
        raise ValueError("distance edge has equal endpoints")
    return lo * (2 * n - lo - 1) // 2 + (hi - lo - 1)


def _edge_scalar(n: int, left: int, right: int) -> int:
    return int(
        _edge_index(
            n, np.asarray([left], dtype=np.int16), np.asarray([right], dtype=np.int16)
        )[0]
    )


def _u1_arrays(n: int) -> tuple[np.ndarray, np.ndarray, np.ndarray]:
    """All injective five-label embeddings and their seven equality edges."""

    assignments = np.asarray(
        list(itertools.permutations(range(n), 5)), dtype=np.int16
    )
    a, c, d, e, f = (assignments[:, i] for i in range(5))
    pairs = (
        (c, a, c, d),
        (c, a, c, f),
        (d, c, d, e),
        (d, c, d, f),
        (f, a, f, d),
        (f, a, f, e),
        (e, a, e, c),
    )
    left = np.stack([_edge_index(n, p, q) for p, q, _, _ in pairs], axis=1)
    right = np.stack([_edge_index(n, r, s) for _, _, r, s in pairs], axis=1)
    return assignments, left, right


U1_ARRAYS = {n: _u1_arrays(n) for n in (11, 12)}


def _row_closure_components(
    n: int, first: surface.ExactApexClass, second: surface.ExactApexClass
) -> np.ndarray:
    edge_count = n * (n - 1) // 2
    parent = list(range(edge_count))

    def find(x: int) -> int:
        while parent[x] != x:
            parent[x] = parent[parent[x]]
            x = parent[x]
        return x

    def union(x: int, y: int) -> None:
        x, y = find(x), find(y)
        if x != y:
            parent[y] = x

    for row in (first, second):
        edges = [_edge_scalar(n, row.center, x) for x in row.support]
        for edge in edges[1:]:
            union(edges[0], edge)
    return np.asarray([find(i) for i in range(edge_count)], dtype=np.int16)


def u1_minimum_missing_equalities(
    case: surface.ProducerCase,
    first: surface.ExactApexClass,
    second: surface.ExactApexClass,
) -> tuple[int, int, tuple[int, ...], tuple[int, ...]]:
    """Exact injective embedding deficit for u1TwoLargeCapObstruction."""

    assignments, left, right = U1_ARRAYS[case.cardinality]
    components = _row_closure_components(case.cardinality, first, second)
    satisfied = components[left] == components[right]
    deficits = 7 - satisfied.sum(axis=1)
    minimum = int(deficits.min())
    best_indices = np.flatnonzero(deficits == minimum)
    # A residue can have many equally short embeddings.  Select the
    # lexicographically least missing-hypothesis set, then the least assignment,
    # so the recorded witness does not depend on NumPy traversal details.
    candidates = []
    for raw_index in best_indices:
        index = int(raw_index)
        missing = tuple(int(i + 1) for i in np.flatnonzero(~satisfied[index]))
        candidates.append((missing, tuple(int(x) for x in assignments[index]), index))
    missing, assignment, index = min(candidates)
    return (
        minimum,
        int(best_indices.size),
        assignment,
        missing,
    )


def _off_surplus_pairs(case, exact):
    off = sorted(set(exact.support) - set(surface.frame_for_case(case).S))
    return tuple(itertools.combinations(off, 2))


def ordered_two_hit_embedding_count(case, first) -> int:
    """Potential one-cross-membership embeddings of the ordered 2-circle core."""

    order = coverage.cyclic_order(case)
    count = 0
    for q, w in _off_surplus_pairs(case, first):
        for source, other in ((q, w), (w, q)):
            for center in range(case.cardinality):
                if center in {first.center, source, other}:
                    continue
                arc1 = set(coverage.open_cyclic_arc(order, first.center, center))
                arc2 = set(coverage.open_cyclic_arc(order, center, first.center))
                if {source, other} <= arc1 or {source, other} <= arc2:
                    count += 1
    return count


def duplicate_triple_hit_embedding_count(case, first) -> int:
    """Potential source-row triple intersections with the first apex class."""

    off = sorted(set(first.support) - set(surface.frame_for_case(case).S))
    count = 0
    for source in off:
        for other1, other2 in itertools.combinations(
            sorted(set(first.support) - {source}), 2
        ):
            for center in range(case.cardinality):
                if center not in {first.center, source, other1, other2}:
                    count += 1
    return count


def build() -> dict[str, Any]:
    cases: list[dict[str, Any]] = []
    total_u1: Counter[int] = Counter()
    total = 0
    for case in surface.PRODUCER_CASES:
        current_bank_hits = 0
        card_pair_embeddings = 0
        ordered_embeddings = 0
        triple_embeddings = 0
        u1_deficits: Counter[int] = Counter()
        u1_missing_sets: Counter[str] = Counter()
        u1_best_embedding_count = 0
        u1_example: dict[str, Any] | None = None
        second_size_counts: Counter[int] = Counter()
        count = 0
        for first, second in residue_pairs(case):
            count += 1
            if coverage.two_exact_row_bank_stages(case, first, second):
                current_bank_hits += 1
            pairs = _off_surplus_pairs(case, first)
            card_pair_embeddings += len(pairs)
            ordered_embeddings += ordered_two_hit_embedding_count(case, first)
            triple_embeddings += duplicate_triple_hit_embedding_count(case, first)
            minimum, multiplicity, assignment, missing = (
                u1_minimum_missing_equalities(case, first, second)
            )
            u1_deficits[minimum] += 1
            u1_missing_sets[",".join(f"h{i}" for i in missing)] += 1
            u1_best_embedding_count += multiplicity
            if u1_example is None or minimum < u1_example["missing_equality_count"]:
                u1_example = {
                    "variables_a_c_d_e_f": list(assignment),
                    "missing_hypotheses": [f"h{i}" for i in missing],
                    "missing_equality_count": minimum,
                }
            second_size_counts[len(second.support)] += 1
        expected = EXPECTED_PROFILE_COUNTS[case.case_id]
        if count != expected:
            raise AssertionError(f"case count drift for {case.case_id}")
        total += count
        total_u1.update(u1_deficits)
        cases.append(
            {
                "case_id": case.case_id,
                "profile": list(case.profile),
                "residues": count,
                "second_exact_class_size_counts": {
                    str(k): v for k, v in sorted(second_size_counts.items())
                },
                "current_two_apex_row_bank_hits": current_bank_hits,
                "static_pair_embeddings": {
                    "exists_surplus_pair_critical_blocker": card_pair_embeddings,
                    "card_five_cap_or_mutual": card_pair_embeddings,
                    "coincident_blocker_branch_complete": card_pair_embeddings,
                    "ordered_two_hit_critical_row": ordered_embeddings,
                    "duplicate_triple_hit_critical_row": triple_embeddings,
                },
                "residue_coverage_if_missing_signature_is_produced": {
                    "exists_surplus_pair_critical_blocker": count
                    if card_pair_embeddings
                    else 0,
                    "card_five_cap_or_mutual": count if card_pair_embeddings else 0,
                    "coincident_blocker_branch_complete": count
                    if card_pair_embeddings
                    else 0,
                    "ordered_two_hit_critical_row": count if ordered_embeddings else 0,
                    "duplicate_triple_hit_critical_row": count
                    if triple_embeddings
                    else 0,
                },
                "u1_two_large_cap_obstruction": {
                    "minimum_additional_equality_distribution": {
                        str(k): v for k, v in sorted(u1_deficits.items())
                    },
                    "canonical_minimum_missing_hypothesis_set_distribution": dict(
                        sorted(u1_missing_sets.items())
                    ),
                    "best_embedding_multiplicity_total": u1_best_embedding_count,
                    "lexicographic_example": u1_example,
                },
            }
        )
    if total != 930:
        raise AssertionError(f"total residue drift: {total}")

    return {
        "schema": "p97_atail_residue930_bridge.v1",
        "epistemic_status": "EXHAUSTIVE_WITHIN_CURRENT_FINITE_SUPPORT_EQUALITY_ABSTRACTION",
        "input": {
            "post_adjacent_cap_one_hit_residues": total,
            "profile_counts": EXPECTED_PROFILE_COUNTS,
            "current_two_apex_row_bank_hits": sum(
                c["current_two_apex_row_bank_hits"] for c in cases
            ),
        },
        "cases": cases,
        "u1_minimum_additional_equality_distribution": {
            str(k): v for k, v in sorted(total_u1.items())
        },
        "candidate_signatures": [
            {
                "rank": 1,
                "id": "ordered_two_hit_critical_row",
                "consumer": "Problem97.Census554.FourPointTwoCircleBisectorOrderCore.false_of_core",
                "static_coverage": 930,
                "missing_fields": [
                    "choose an off-surplus source q and distinct w in the first exact apex class",
                    "w belongs to the exact critical shell selected at q",
                    "the selected blocker center and q,w place q,w on one open cyclic arc between that center and oppApex1",
                ],
            },
            {
                "rank": 2,
                "id": "card_five_cap_or_mutual",
                "consumer": "Problem97.ATAILCardFiveCapOrMutualScratch.false_of_cardFive_exists_capLocal_or_mutualIncidence",
                "static_coverage": 930,
                "missing_fields": [
                    "the two chosen source blocker centers are distinct",
                    "either one source row contains the other source and its blocker lies in the surplus cap, or both reciprocal source-row incidences hold",
                ],
            },
            {
                "rank": 3,
                "id": "exists_surplus_pair_critical_blocker",
                "consumer": "Problem97.ATAILCardFourParentBoundary.false_of_existsSurplusPairCriticalBlocker",
                "static_coverage": 930,
                "missing_fields": [
                    "a deletion-blocking exact four-shell centered at a non-apex point of the surplus cap",
                    "that shell contains both chosen off-surplus first-apex-class points",
                ],
            },
            {
                "rank": 4,
                "id": "coincident_blocker_branch_complete",
                "consumer": "Problem97.ATAILCoincidentBlockerFourShell.false_of_residual_member_class_contains_common_pair",
                "static_coverage": 930,
                "missing_fields": [
                    "on distinct blockers, both reciprocal source-row incidences",
                    "on coincident blockers, one residual shell member x has a selected global-K4 class centered at x containing both common points",
                ],
            },
            {
                "rank": 5,
                "id": "u1_two_large_cap_completion",
                "consumer": "Problem97.U1LargeCapRouteBTailMetricResidualTarget.u1TwoLargeCapObstruction",
                "static_coverage_by_additional_equality_budget": {
                    "3": 49,
                    "4": 519,
                    "5": 930,
                },
                "missing_fields": [
                    "for each residue, choose an injective assignment of a,c,d,e,f",
                    "supply the 3, 4, or 5 h1-through-h7 distance equalities not already in the two apex-row equality closure",
                    "the inequality a != c is automatic for the injective assignment",
                ],
            },
        ],
        "set_cover": {
            "universe": 930,
            "minimum_signature_count_given_each_full_signature": 1,
            "singleton_covers": [
                "ordered_two_hit_critical_row",
                "card_five_cap_or_mutual",
                "exists_surplus_pair_critical_blocker",
                "coincident_blocker_branch_complete",
                "u1_two_large_cap_completion_with_budget_five",
            ],
            "warning": "Coverage is conditional on producing every listed missing field; no producer implication is asserted.",
        },
        "parent_common_critical_map_boundary": {
            "present": [
                "Nonempty (CriticalShellSystem D.A)",
                "after choosing H, one deletion-blocking exact four-shell for every carrier source",
                "automatic source membership in its selectedAt shell",
                "selected blocker center lies in D.A, differs from its source, and the shell has exact cardinality four",
                "D.K4 supplies a global K4 witness at every carrier center",
                "D.convex and the leaf surplus packet supply cap order in principle",
            ],
            "not_present": [
                "any cross-source shell membership",
                "blocker-center equality or inequality for a chosen pair",
                "blocker localization in the surplus cap",
                "a chosen pair's open-arc placement relative to its blocker",
                "common-pair membership in a residual member's global-K4 class",
                "the five additional cross-row equalities of a fixed-prefix u1TwoLargeCapObstruction embedding",
                "constructor provenance identifying rows/hfixed/hsupport with the same existential critical-shell system",
            ],
        },
    }


def canonical_bytes(document: dict[str, Any]) -> bytes:
    return (json.dumps(document, indent=2, sort_keys=True) + "\n").encode()


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--write", action="store_true")
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    if args.write and args.check:
        parser.error("choose at most one of --write and --check")
    document = build()
    payload = canonical_bytes(document)
    if args.write:
        CHECKPOINT.write_bytes(payload)
        print(hashlib.sha256(payload).hexdigest())
    elif args.check:
        stored = CHECKPOINT.read_bytes()
        if stored != payload:
            raise SystemExit("analysis checkpoint drift")
        print(
            json.dumps(
                {
                    "sha256": hashlib.sha256(payload).hexdigest(),
                    "residues": document["input"][
                        "post_adjacent_cap_one_hit_residues"
                    ],
                    "u1_deficits": document[
                        "u1_minimum_additional_equality_distribution"
                    ],
                },
                sort_keys=True,
            )
        )
    else:
        sys.stdout.buffer.write(payload)


if __name__ == "__main__":
    main()
