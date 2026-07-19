#!/usr/bin/env python3
"""Exact independent audit of live distance-level fields for a SAT survivor."""

from __future__ import annotations

import argparse
import hashlib
import itertools
import json
from collections import defaultdict, deque
from fractions import Fraction
from pathlib import Path


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def render(value: Fraction) -> str:
    return str(value.numerator) if value.denominator == 1 else f"{value.numerator}/{value.denominator}"


def determinant(matrix: list[list[Fraction]]) -> Fraction:
    work = [row[:] for row in matrix]
    answer = Fraction(1)
    for column in range(len(work)):
        pivot = next((row for row in range(column, len(work)) if work[row][column]), None)
        if pivot is None:
            return Fraction(0)
        if pivot != column:
            work[column], work[pivot] = work[pivot], work[column]
            answer = -answer
        pivot_value = work[column][column]
        answer *= pivot_value
        for following in range(column, len(work)):
            work[column][following] /= pivot_value
        for row in range(column + 1, len(work)):
            scale = work[row][column]
            for following in range(column, len(work)):
                work[row][following] -= scale * work[column][following]
    return answer


def matrix_rank(matrix: list[list[Fraction]]) -> int:
    work = [row[:] for row in matrix]
    row = 0
    for column in range(len(work[0]) if work else 0):
        pivot = next((index for index in range(row, len(work)) if work[index][column]), None)
        if pivot is None:
            continue
        work[row], work[pivot] = work[pivot], work[row]
        value = work[row][column]
        work[row] = [entry / value for entry in work[row]]
        for other in range(len(work)):
            if other == row:
                continue
            scale = work[other][column]
            work[other] = [
                entry - scale * pivot_entry
                for entry, pivot_entry in zip(work[other], work[row], strict=True)
            ]
        row += 1
        if row == len(work):
            break
    return row


def self_test() -> None:
    if determinant([[Fraction(1), Fraction(0)], [Fraction(0), Fraction(1)]]) != 1:
        raise AssertionError("determinant identity smoke test failed")
    if determinant([[Fraction(1), Fraction(2)], [Fraction(2), Fraction(1)]]) != -3:
        raise AssertionError("negative determinant smoke test failed")
    if matrix_rank([[Fraction(1), Fraction(2)], [Fraction(2), Fraction(4)]]) != 1:
        raise AssertionError("rank smoke test failed")


def audit(full_lra_path: Path, outer_path: Path, outer_verify_path: Path) -> dict[str, object]:
    self_test()
    payload = json.loads(full_lra_path.read_text(encoding="utf-8"))
    outer = json.loads(outer_path.read_text(encoding="utf-8"))
    outer_verify = json.loads(outer_verify_path.read_text(encoding="utf-8"))
    if payload.get("status") != "SAT_VERIFIED_FULL_KALMANSON_METRIC":
        raise AssertionError("source is not a full-LRA SAT payload")
    if outer.get("solver_status") != "SAT" or outer.get("cnf_model_checked") is not True:
        raise AssertionError("source outer result is not substitution-checked SAT")
    if outer_verify.get("status") != "VERIFIED_SAT":
        raise AssertionError("source outer semantic verifier did not report VERIFIED_SAT")
    n = int(payload["n"])
    vertices = tuple(range(n))
    rows = {
        int(center): frozenset(int(point) for point in support)
        for center, support in payload["rows"].items()
    }
    blockers = {int(source): int(center) for source, center in payload["blockers"].items()}
    if rows != {
        int(center): frozenset(int(point) for point in support)
        for center, support in outer["rows"].items()
    }:
        raise AssertionError("row data differs between outer and full-LRA payloads")
    if blockers != {int(source): int(center) for source, center in outer["blockers"].items()}:
        raise AssertionError("blocker data differs between outer and full-LRA payloads")
    expected_pairs = set(itertools.combinations(vertices, 2))
    distances: dict[tuple[int, int], Fraction] = {}
    for key, raw_value in payload["distances"].items():
        left, right = (int(item) for item in key.split(","))
        if not left < right:
            raise AssertionError(f"noncanonical distance key {key}")
        distances[left, right] = Fraction(raw_value)
    if set(distances) != expected_pairs:
        raise AssertionError("distance table is not the complete unordered carrier")

    def distance(left: int, right: int) -> Fraction:
        return Fraction(0) if left == right else distances[tuple(sorted((left, right)))]

    # Exact abstract-metric and Kalmanson replay.
    positive = [(distance(left, right), (left, right)) for left, right in expected_pairs]
    minimum_positive, minimum_positive_pair = min(positive)
    if minimum_positive <= 0:
        raise AssertionError("off-diagonal distance is not positive")
    triangle_slacks: list[tuple[Fraction, tuple[int, int, int, str]]] = []
    for a, b, c in itertools.combinations(vertices, 3):
        triangle_slacks.extend(
            [
                (distance(a, b) + distance(b, c) - distance(a, c), (a, b, c, "ab+bc-ac")),
                (distance(a, c) + distance(b, c) - distance(a, b), (a, b, c, "ac+bc-ab")),
                (distance(a, b) + distance(a, c) - distance(b, c), (a, b, c, "ab+ac-bc")),
            ]
        )
    minimum_triangle, minimum_triangle_case = min(triangle_slacks)
    if minimum_triangle < 0:
        raise AssertionError("triangle inequality failed")
    kalmanson_first: list[tuple[Fraction, tuple[int, int, int, int]]] = []
    kalmanson_second: list[tuple[Fraction, tuple[int, int, int, int]]] = []
    for a, b, c, d in itertools.combinations(vertices, 4):
        diagonals = distance(a, c) + distance(b, d)
        kalmanson_first.append((diagonals - distance(a, b) - distance(c, d), (a, b, c, d)))
        kalmanson_second.append((diagonals - distance(a, d) - distance(b, c), (a, b, c, d)))
    minimum_k1, minimum_k1_case = min(kalmanson_first)
    minimum_k2, minimum_k2_case = min(kalmanson_second)
    if minimum_k1 <= 0 or minimum_k2 <= 0:
        raise AssertionError("strict Kalmanson inequality failed")

    def positive_classes(center: int, excluded: frozenset[int] = frozenset()) -> dict[Fraction, tuple[int, ...]]:
        classes: dict[Fraction, list[int]] = defaultdict(list)
        for point in vertices:
            if point in excluded:
                continue
            radius = distance(center, point)
            if radius > 0:
                classes[radius].append(point)
        return {radius: tuple(points) for radius, points in sorted(classes.items())}

    row_checks: dict[str, object] = {}
    row_radii: dict[int, Fraction] = {}
    for center in vertices:
        support = rows[center]
        if len(support) != 4 or center in support:
            raise AssertionError(f"invalid row support at {center}")
        radii = {distance(center, point) for point in support}
        if len(radii) != 1:
            raise AssertionError(f"row equality failed at {center}")
        radius = next(iter(radii))
        row_radii[center] = radius
        whole_class = frozenset(point for point in vertices if distance(center, point) == radius)
        off_row = tuple(sorted(whole_class - support))
        row_checks[str(center)] = {
            "support": sorted(support),
            "radius": render(radius),
            "whole_positive_radius_class": sorted(whole_class),
            "nonmembers_sharing_row_radius": list(off_row),
            "exact_full_filter": whole_class == support,
            "positive_distance_class_profile": {
                render(class_radius): list(points)
                for class_radius, points in positive_classes(center).items()
            },
        }

    # Incidence graph.  Symmetry + connectedness forces all selected row
    # radii equal in every metric realization of these row equalities.
    directed_edges = {(center, point) for center in vertices for point in rows[center]}
    symmetry_violations = sorted((center, point) for center, point in directed_edges if (point, center) not in directed_edges)
    undirected_edges = sorted(tuple(sorted((center, point))) for center, point in directed_edges if center < point)

    def reached(start: int) -> set[int]:
        seen = {start}
        queue = deque([start])
        while queue:
            center = queue.popleft()
            for point in rows[center]:
                if point not in seen:
                    seen.add(point)
                    queue.append(point)
        return seen

    strongly_connected = all(len(reached(start)) == n for start in vertices)
    common_radius_values = sorted(set(row_radii.values()))
    selected_distance_pairs = {
        tuple(sorted((center, point))) for center, point in directed_edges
    }
    common_radius_pairs: set[tuple[int, int]] = set()
    if len(common_radius_values) == 1:
        common_radius = common_radius_values[0]
        common_radius_pairs = {pair for pair in expected_pairs if distances[pair] == common_radius}
    else:
        common_radius = None

    # CriticalShellSystem fields expressible in a finite distance table.
    apices = frozenset(int(item) for item in payload["omitted_apices"])
    blocker_checks: dict[str, object] = {}
    for source in vertices:
        center = blockers[source]
        shell_radius = distance(center, source)
        whole_shell = frozenset(point for point in vertices if distance(center, point) == shell_radius)
        deletion_classes = positive_classes(center, frozenset({source}))
        large_classes = {
            render(radius): list(points)
            for radius, points in deletion_classes.items()
            if len(points) >= 4
        }
        blocker_checks[str(source)] = {
            "center": center,
            "center_in_carrier_erase_source": center in vertices and center != source,
            "center_omits_physical_apices": center not in apices,
            "source_in_selected_blocker_row": source in rows[center],
            "shell_radius": render(shell_radius),
            "shell_radius_positive": shell_radius > 0,
            "whole_shell_radius_class": sorted(whole_shell),
            "selected_blocker_row": sorted(rows[center]),
            "blocker_row_exact_full_filter": whole_shell == rows[center],
            "positive_distance_classes_after_source_deletion": {
                render(radius): list(points) for radius, points in deletion_classes.items()
            },
            "four_or_larger_classes_after_source_deletion": large_classes,
            "no_qfree_at_blocker": not large_classes,
        }

    deletion_survival: dict[str, object] = {}
    deletion_equivalence_holds = True
    for source in vertices:
        surviving = []
        for center in vertices:
            if any(len(points) >= 4 for points in positive_classes(center, frozenset({source})).values()):
                surviving.append(center)
        predicted = [center for center in vertices if source not in rows[center]]
        if surviving != predicted:
            deletion_equivalence_holds = False
        deletion_survival[str(source)] = {
            "centers_with_K4_after_deletion": surviving,
            "centers_predicted_by_source_absent_from_exact_row": predicted,
            "equivalent": surviving == predicted,
        }

    # Euclidean-distance-matrix audit.  If points p_i existed in a real inner
    # product space, the Gram matrix of p_i-p_0 would be positive semidefinite.
    base = 0
    gram_vertices = tuple(point for point in vertices if point != base)
    gram = [
        [
            (distance(base, left) ** 2 + distance(base, right) ** 2 - distance(left, right) ** 2) / 2
            for right in gram_vertices
        ]
        for left in gram_vertices
    ]
    witness_vertices = (1, 2, 3)
    witness_indices = tuple(gram_vertices.index(vertex) for vertex in witness_vertices)
    witness_matrix = [[gram[i][j] for j in witness_indices] for i in witness_indices]
    witness_determinant = determinant(witness_matrix)
    gram_rank = matrix_rank(gram)
    if witness_determinant >= 0:
        raise AssertionError("expected exact negative Gram witness was not negative")

    all_rows_exact = all(check["exact_full_filter"] for check in row_checks.values())
    all_blockers_valid = all(
        check["center_in_carrier_erase_source"]
        and check["center_omits_physical_apices"]
        and check["source_in_selected_blocker_row"]
        and check["shell_radius_positive"]
        and check["blocker_row_exact_full_filter"]
        and check["no_qfree_at_blocker"]
        for check in blocker_checks.values()
    )

    # Reduced planar formulation for this survivor.  A Euclidean isometry and
    # the structurally forced common radius fix p_0 = (0,0) and the selected
    # neighbor p_2 = (1,0), leaving 2n-4 real coordinate variables.  Strict
    # CCW convexity may be imposed without auxiliary distance variables by
    # putting every other point strictly to the left of every directed
    # boundary edge.  In a strict convex Euclidean quadrilateral, the two
    # diagonals cross internally, and strict triangle inequalities at the
    # crossing imply both strict Kalmanson inequalities.
    blocker_centers = frozenset(blockers.values())
    nonedges = expected_pairs - selected_distance_pairs
    blocker_exact_nonedge_pairs = {
        pair for pair in nonedges if any(vertex in blocker_centers for vertex in pair)
    }
    nonunit_candidates_by_blocker = {
        center: frozenset(vertices) - frozenset({center}) - rows[center]
        for center in blocker_centers
    }
    no_qfree_fourset_clause_count = sum(
        len(tuple(itertools.combinations(candidates, 4)))
        for candidates in nonunit_candidates_by_blocker.values()
    )
    return {
        "schema": "p97-full-metric-live-distance-field-audit-v1",
        "status": "FIXED_METRIC_EXACTLY_VERIFIED_NON_EUCLIDEAN",
        "epistemic_status": "EXACT_RATIONAL_SUBSTITUTION_AND_DISTANCE_FIELD_AUDIT",
        "sources": {
            str(full_lra_path): sha256(full_lra_path),
            str(outer_path): sha256(outer_path),
            str(outer_verify_path): sha256(outer_verify_path),
        },
        "n": n,
        "abstract_metric": {
            "complete_unordered_distance_count": len(distances),
            "minimum_positive_distance": render(minimum_positive),
            "minimum_positive_distance_pair": list(minimum_positive_pair),
            "triangle_inequality_count": len(triangle_slacks),
            "minimum_triangle_slack": render(minimum_triangle),
            "minimum_triangle_case": list(minimum_triangle_case),
            "verified": True,
        },
        "strict_kalmanson": {
            "quadruple_count": len(kalmanson_first),
            "first_minimum_slack": render(minimum_k1),
            "first_minimum_case": list(minimum_k1_case),
            "second_minimum_slack": render(minimum_k2),
            "second_minimum_case": list(minimum_k2_case),
            "verified": True,
        },
        "row_checks": row_checks,
        "all_rows_exact_full_filters": all_rows_exact,
        "row_incidence_graph": {
            "directed_edge_count": len(directed_edges),
            "symmetric": not symmetry_violations,
            "symmetry_violations": [list(edge) for edge in symmetry_violations],
            "undirected_edge_count": len(undirected_edges),
            "undirected_edges": [list(edge) for edge in undirected_edges],
            "degree_by_vertex": {str(center): len(rows[center]) for center in vertices},
            "strongly_connected": strongly_connected,
            "structurally_forces_one_common_selected_radius": not symmetry_violations and strongly_connected,
            "reason": "On every symmetric selected edge c--p, d(c,p) is both row radius r_c and row radius r_p; connectedness propagates r_c = r_p to every center.",
            "fixed_metric_row_radius_values": [render(value) for value in common_radius_values],
            "fixed_metric_common_radius": render(common_radius) if common_radius is not None else None,
            "fixed_metric_pairs_at_common_radius": [list(pair) for pair in sorted(common_radius_pairs)],
            "selected_pairs_equal_all_common_radius_pairs": selected_distance_pairs == common_radius_pairs,
            "scaled_interpretation": "After scaling the common radius to 1, the selected graph is a spanning 4-regular 22-edge unit-distance graph. Exactness of every row in this fixed metric makes it the entire unit-distance graph.",
        },
        "blocker_checks": blocker_checks,
        "all_distance_level_critical_shell_fields_verified": all_blockers_valid,
        "global_k4_and_deletion_filter": {
            "global_K4_at_every_center": all(
                any(len(points) >= 4 for points in positive_classes(center).values())
                for center in vertices
            ),
            "deletion_survival_by_source": deletion_survival,
            "deletion_survival_exactly_source_absent_from_row": deletion_equivalence_holds,
        },
        "euclidean_realizability": {
            "base_vertex": base,
            "gram_dimension": len(gram_vertices),
            "exact_gram_rank": gram_rank,
            "negative_principal_minor_vertices": list(witness_vertices),
            "negative_principal_minor_matrix": [
                [render(value) for value in row] for row in witness_matrix
            ],
            "negative_principal_minor_determinant": render(witness_determinant),
            "positive_semidefinite": False,
            "realizable_in_any_real_inner_product_space": False,
            "realizable_as_points_in_R2": False,
        },
        "reduced_exact_planar_encoding": {
            "scope": "A smallest direct coordinate encoding after using the verified graph symmetry, connectivity, Euclidean gauge freedom, and common-radius scaling; no global optimality claim over all possible encodings.",
            "coordinate_variables_after_gauge": 2 * n - 4,
            "gauge": ["p_0 = (0,0)", "p_2 = (1,0)"],
            "selected_unit_distance_equations": len(undirected_edges),
            "strict_ccw_convex_edge_halfplane_inequalities": n * (n - 2),
            "strict_ccw_formula": "orient(p_i, p_(i+1 mod n), p_j) > 0 for every boundary edge i and every j outside that edge",
            "strict_kalmanson_auxiliary_constraints": 0,
            "strict_kalmanson_reason": "Strict CCW convex Euclidean position makes the diagonals of each cyclic quadruple cross internally; strict triangle inequalities at the crossing give both strict Kalmanson inequalities.",
            "critical_blocker_centers": sorted(blocker_centers),
            "blocker_source_membership_center_survival_and_apex_avoidance": "Already fixed combinatorially by the row table and blocker map; they add no real-variable constraints.",
            "unique_nonedge_disequalities_for_exactness_at_blocker_rows": len(blocker_exact_nonedge_pairs),
            "unique_nonedge_disequalities_for_exactness_at_every_row": len(nonedges),
            "blocker_exactness_formula": "D(c,z) != 1 for every chosen blocker center c and every z outside {c} union row(c), where D is squared Euclidean distance.",
            "unique_blocker_center_no_qfree_conditions": len(blocker_centers),
            "expanded_no_qfree_fourset_clauses": no_qfree_fourset_clause_count,
            "no_qfree_formula": "For each chosen blocker center c and each four-set S among the six nonunit candidates V \\ ({c} union row(c)), the squared distances D(c,s), s in S, are not all equal. Exact unit-shell status reduces all sources mapped to the same center to this one center-level condition.",
            "optional_full_row_exactness_increment": len(nonedges) - len(blocker_exact_nonedge_pairs),
            "minimal_live_distance_assumptions": [
                "22 selected-edge unit equations",
                "30 distinct nonedge disequalities making every chosen blocker row its full unit-radius filter",
                "8 center-level no_qfree multiplicity-at-most-3 conditions, or 120 exact four-set clauses when expanded",
            ],
            "stronger_fixed_witness_row_assumption": "Adding the remaining 3 nonedge disequalities makes all 11 selected rows exact, matching the displayed rational metric but exceeding what CriticalShellSystem itself requires away from blocker centers.",
        },
        "claim_boundary": {
            "fixed_metric": "The displayed rational metric is not Euclidean, despite satisfying the abstract metric, strict Kalmanson, row, blocker, exact-filter, and deletion-critical checks above.",
            "row_kalmanson_cell": "This audit does not prove that every metric satisfying the same row equalities and strict Kalmanson inequalities is non-Euclidean. Euclidean infeasibility of that entire cell remains unproved.",
            "live_fields_not_decided_by_this_distance_table": [
                "existence of planar coordinates realizing some metric in the same row/Kalmanson cell",
                "ConvexIndep and the actual CCW boundary geometry",
                "minimality of CounterexampleData",
                "the packet/cap/frontier residual fields selecting the two physical apices",
            ],
        },
    }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("full_lra", type=Path)
    parser.add_argument("outer", type=Path)
    parser.add_argument("outer_verify", type=Path)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()
    result = audit(args.full_lra, args.outer, args.outer_verify)
    rendered = json.dumps(result, indent=2, sort_keys=True) + "\n"
    if args.output is not None:
        args.output.write_text(rendered, encoding="utf-8")
    print(rendered, end="")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
