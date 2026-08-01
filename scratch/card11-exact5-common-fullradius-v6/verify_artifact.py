#!/usr/bin/env python3
"""Independent verifier for full-radius geometric-core artifacts.

This file does not import the encoder.  It consumes only persisted DIMACS,
solver output, and the explicit variable manifest.  SAT assignments are
checked clause-by-clause and against the intended finite semantics.  UNSAT
artifacts are checked by the independent ``drat-trim`` executable.
"""

from __future__ import annotations

import argparse
import hashlib
import itertools
import json
import subprocess
from pathlib import Path


LABELS = tuple(range(11))
V = 1
W = 2
S = frozenset({1, 2, 3, 4, 5})
O1 = frozenset({0, 2, 6, 7, 8})
O2 = frozenset({0, 1, 9, 10})
Q = 6
WITNESS = 7
BLOCKER = 8
GLOBAL_EDGES = tuple(itertools.combinations(LABELS, 2))
SCHEMA = "card11_exact5_common_fullradius.v6"
EXPECTED_CONVEX_FIVE_POINT_CORE_NAIVE_CLAUSES = (
    144 * 11 * len(tuple(itertools.combinations(range(10), 4)))
)
EXPECTED_LOCAL_FOUR_CLASS_VARIABLES = 11 * len(
    tuple(itertools.combinations(range(10), 4))
)
EXPECTED_QDELETED_PAIR_VARIABLES = (
    11 * 10 * len(tuple(itertools.combinations(range(9), 2)))
)
EXPECTED_SOURCE_CHOICES = 6550
EXPECTED_FAMILY_A_LOGICAL_CLAUSES = EXPECTED_SOURCE_CHOICES * 3 * 6 * 21 * 21
EXPECTED_FAMILY_A_COMPACT_CLAUSES = EXPECTED_SOURCE_CHOICES * 3 * 6
EXPECTED_FAMILY_B_CLAUSES = EXPECTED_SOURCE_CHOICES * 6


class VerificationError(RuntimeError):
    pass


def edge_key(left: int, right: int) -> tuple[int, int]:
    if left == right:
        raise VerificationError("global equality contains a loop edge")
    return min(left, right), max(left, right)


def global_key(
    first: tuple[int, int], second: tuple[int, int]
) -> tuple[tuple[int, int], tuple[int, int]]:
    first = edge_key(*first)
    second = edge_key(*second)
    if first == second:
        raise VerificationError("global equality compares one edge with itself")
    return tuple(sorted((first, second)))


def sha256_file(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as handle:
        for chunk in iter(lambda: handle.read(1 << 20), b""):
            digest.update(chunk)
    return digest.hexdigest()


def read_dimacs(path: Path) -> tuple[int, list[list[int]]]:
    declared_vars = None
    declared_clauses = None
    clauses: list[list[int]] = []
    pending: list[int] = []
    with path.open("r", encoding="utf-8") as handle:
        for line_number, raw in enumerate(handle, start=1):
            line = raw.strip()
            if not line or line.startswith("c"):
                continue
            if line.startswith("p "):
                parts = line.split()
                if parts[:2] != ["p", "cnf"] or len(parts) != 4:
                    raise VerificationError(f"bad DIMACS header at line {line_number}")
                declared_vars, declared_clauses = int(parts[2]), int(parts[3])
                continue
            for token in line.split():
                literal = int(token)
                if literal == 0:
                    clauses.append(pending)
                    pending = []
                else:
                    pending.append(literal)
    if pending:
        raise VerificationError("unterminated DIMACS clause")
    if declared_vars is None or declared_clauses is None:
        raise VerificationError("missing DIMACS header")
    if len(clauses) != declared_clauses:
        raise VerificationError(
            f"DIMACS clause mismatch: declared {declared_clauses}, read {len(clauses)}"
        )
    if any(abs(literal) > declared_vars for clause in clauses for literal in clause):
        raise VerificationError("DIMACS literal exceeds declared variable count")
    return declared_vars, clauses


def parse_assignment(path: Path) -> dict[int, bool]:
    assignment: dict[int, bool] = {}
    for line in path.read_text(encoding="utf-8").splitlines():
        if not line.startswith("v "):
            continue
        for token in line[2:].split():
            literal = int(token)
            if literal == 0:
                continue
            variable = abs(literal)
            value = literal > 0
            if variable in assignment and assignment[variable] != value:
                raise VerificationError(f"conflicting assignment for {variable}")
            assignment[variable] = value
    return assignment


def parse_model(path: Path) -> dict[int, bool]:
    payload = json.loads(path.read_text(encoding="utf-8"))
    literals = payload.get("signed_literals")
    if not isinstance(literals, list):
        raise VerificationError("model.json lacks signed_literals")
    assignment: dict[int, bool] = {}
    for literal in literals:
        if not isinstance(literal, int) or literal == 0:
            raise VerificationError("model.json has invalid literal")
        variable = abs(literal)
        value = literal > 0
        if variable in assignment:
            raise VerificationError(f"duplicate model variable {variable}")
        assignment[variable] = value
    if payload.get("variable_count") != len(assignment):
        raise VerificationError("model.json variable count mismatch")
    return assignment


def onehit_ok(center: int, support: set[int]) -> bool:
    if center == V:
        return (
            len(support & (S - {V})) <= 1
            and len(support & (O2 - {V})) <= 1
        )
    if center == W:
        return (
            len(support & (S - {W})) <= 1
            and len(support & (O1 - {W})) <= 1
        )
    return True


def validate_order(cube: dict[int, set[int]], labels: list[int]) -> bool:
    if len(labels) != 11 or set(labels) != set(LABELS):
        return False
    positions = {label: index for index, label in enumerate(labels)}
    for first_center, second_center in itertools.combinations(LABELS, 2):
        common = sorted(cube[first_center] & cube[second_center])
        low, high = sorted((positions[first_center], positions[second_center]))
        for first_point, second_point in itertools.combinations(common, 2):
            first_between = low < positions[first_point] < high
            second_between = low < positions[second_point] < high
            if first_between == second_between:
                return False
    return True


def classes_at(
    center: int,
    eq_vars: dict[tuple[int, int, int], int],
    assignment: dict[int, bool],
) -> list[set[int]]:
    incident = [label for label in LABELS if label != center]
    unseen = set(incident)
    classes = []
    while unseen:
        seed = min(unseen)
        cls = {seed}
        for label in incident:
            if label == seed:
                continue
            key = (center, min(seed, label), max(seed, label))
            if assignment[eq_vars[key]]:
                cls.add(label)
        unseen -= cls
        classes.append(cls)
    return classes


def parse_global_variables(
    manifest: dict, cnf_vars: int
) -> dict[tuple[tuple[int, int], tuple[int, int]], int]:
    variables = {}
    for entry in manifest["global_edge_equality_variables"]:
        first = tuple(map(int, entry["first_edge"]))
        second = tuple(map(int, entry["second_edge"]))
        key = global_key(first, second)
        if first != key[0] or second != key[1]:
            raise VerificationError("noncanonical global equality manifest key")
        if key in variables:
            raise VerificationError("duplicate global equality manifest key")
        variables[key] = int(entry["variable"])
    expected = set(itertools.combinations(GLOBAL_EDGES, 2))
    if set(variables) != expected:
        raise VerificationError("global equality manifest surface is incomplete")
    values = list(variables.values())
    if len(values) != len(set(values)):
        raise VerificationError("global equality variable IDs alias")
    v5_variables = int(manifest["pre_v6_prefix_variables"])
    if not 0 < v5_variables <= cnf_vars:
        raise VerificationError("bad pre-v6 variable prefix")
    if set(values) != set(
        range(v5_variables - len(expected) + 1, v5_variables + 1)
    ):
        raise VerificationError(
            "global equality variables are not the final contiguous v5 block"
        )
    return variables


def parse_local_variables(
    manifest: dict,
) -> dict[tuple[int, int, int], int]:
    variables = {}
    for entry in manifest["equality_variables"]:
        center = int(entry["center"])
        left = int(entry["left"])
        right = int(entry["right"])
        if center not in LABELS or left not in LABELS or right not in LABELS:
            raise VerificationError("local equality label is outside carrier")
        if center in {left, right} or not left < right:
            raise VerificationError("noncanonical local equality manifest key")
        key = (center, left, right)
        if key in variables:
            raise VerificationError("duplicate local equality manifest key")
        variables[key] = int(entry["variable"])
    expected = {
        (center, left, right)
        for center in LABELS
        for left, right in itertools.combinations(
            [label for label in LABELS if label != center], 2
        )
    }
    if set(variables) != expected:
        raise VerificationError("local equality manifest surface is incomplete")
    if len(set(variables.values())) != len(variables):
        raise VerificationError("local equality variable IDs alias")
    return variables


def parse_v6_aux_variables(
    manifest: dict, cnf_vars: int,
) -> tuple[
    dict[tuple[int, tuple[int, ...]], int],
    dict[tuple[int, int, int, int], int],
]:
    local_four = {}
    for entry in manifest["v6_local_four_class_variables"]:
        center = int(entry["center"])
        support = tuple(map(int, entry["support"]))
        if (
            center not in LABELS
            or len(support) != 4
            or tuple(sorted(set(support))) != support
            or center in support
        ):
            raise VerificationError("noncanonical local-four helper key")
        key = (center, support)
        if key in local_four:
            raise VerificationError("duplicate local-four helper key")
        local_four[key] = int(entry["variable"])
    expected_local_four = {
        (center, support)
        for center in LABELS
        for support in itertools.combinations(
            [label for label in LABELS if label != center], 4
        )
    }
    if set(local_four) != expected_local_four:
        raise VerificationError("local-four helper surface is incomplete")

    qdeleted_pair = {}
    for entry in manifest["v6_qdeleted_pair_variables"]:
        deleted = int(entry["deleted"])
        center = int(entry["center"])
        first = int(entry["first"])
        second = int(entry["second"])
        if (
            len({deleted, center, first, second}) != 4
            or not first < second
            or any(label not in LABELS for label in (
                deleted, center, first, second
            ))
        ):
            raise VerificationError("noncanonical q-deleted-pair helper key")
        key = (deleted, center, first, second)
        if key in qdeleted_pair:
            raise VerificationError("duplicate q-deleted-pair helper key")
        qdeleted_pair[key] = int(entry["variable"])
    expected_qdeleted_pair = {
        (deleted, center, first, second)
        for deleted in LABELS
        for center in LABELS
        if center != deleted
        for first, second in itertools.combinations(
            [
                label for label in LABELS
                if label not in {deleted, center}
            ],
            2,
        )
    }
    if set(qdeleted_pair) != expected_qdeleted_pair:
        raise VerificationError("q-deleted-pair helper surface is incomplete")

    if len(local_four) != EXPECTED_LOCAL_FOUR_CLASS_VARIABLES:
        raise VerificationError("unexpected local-four helper count")
    if len(qdeleted_pair) != EXPECTED_QDELETED_PAIR_VARIABLES:
        raise VerificationError("unexpected q-deleted-pair helper count")
    v5_variables = int(manifest["pre_v6_prefix_variables"])
    local_values = list(local_four.values())
    qpair_values = list(qdeleted_pair.values())
    if set(local_values) != set(
        range(v5_variables + 1, v5_variables + len(local_four) + 1)
    ):
        raise VerificationError("local-four helpers are not contiguous after v5")
    qpair_first = v5_variables + len(local_four) + 1
    if set(qpair_values) != set(range(qpair_first, cnf_vars + 1)):
        raise VerificationError("q-deleted-pair helpers are not the final block")
    if len(qpair_values) != cnf_vars - qpair_first + 1:
        raise VerificationError("unexpected final auxiliary variable count")
    return local_four, qdeleted_pair


def verify_v6_clause_blocks(
    clauses: list[list[int]], manifest: dict,
    global_vars: dict[tuple[tuple[int, int], tuple[int, int]], int],
    eq_vars: dict[tuple[int, int, int], int],
    local_four: dict[tuple[int, tuple[int, ...]], int],
    qdeleted_pair: dict[tuple[int, int, int, int], int],
) -> dict:
    if manifest.get("schema") != SCHEMA:
        raise VerificationError("unexpected manifest schema")
    blocks = {}
    for block in manifest["clause_blocks"]:
        name = block["name"]
        if name in blocks:
            raise VerificationError(f"duplicate clause block {name}")
        first = int(block["first_clause_1based"])
        last = int(block["last_clause_1based"])
        count = int(block["clause_count"])
        if last - first + 1 != count:
            raise VerificationError(f"bad clause block bounds for {name}")
        blocks[name] = (first, last, count)

    def geq(first: tuple[int, int], second: tuple[int, int]) -> int:
        return global_vars[global_key(first, second)]

    expected_blocks: dict[str, list[list[int]]] = {}
    transitivity = []
    for first, second, third in itertools.combinations(GLOBAL_EDGES, 3):
        fs, ft, st = geq(first, second), geq(first, third), geq(second, third)
        transitivity.extend(([-fs, -ft, st], [-fs, -st, ft], [-ft, -st, fs]))
    expected_blocks["global-edge-equality-transitivity"] = transitivity

    row_seeds = []
    for row in manifest["selected_rows"]:
        center = int(row["center"])
        selector = int(row["variable"])
        for left, right in itertools.combinations(sorted(map(int, row["support"])), 2):
            row_seeds.append([
                -selector,
                geq(edge_key(center, left), edge_key(center, right)),
            ])
    expected_blocks["selected-row-global-equality-seeds"] = row_seeds

    shell = manifest.get("shell")
    if shell is not None:
        shell_seeds = []
        for left, right in itertools.combinations(sorted(map(int, shell["u5"])), 2):
            shell_seeds.append([
                geq(edge_key(V, left), edge_key(V, right))
            ])
        expected_blocks["first-apex-exact-five-global-equality-seeds"] = shell_seeds

    duplicate_exclusions = []
    for p, q, r in itertools.combinations(LABELS, 3):
        centers = [center for center in LABELS if center not in {p, q, r}]
        for first_center, second_center in itertools.combinations(centers, 2):
            duplicate_exclusions.append([
                -geq(edge_key(first_center, p), edge_key(first_center, q)),
                -geq(edge_key(first_center, p), edge_key(first_center, r)),
                -geq(edge_key(second_center, p), edge_key(second_center, q)),
                -geq(edge_key(second_center, p), edge_key(second_center, r)),
            ])
    expected_blocks["duplicate-center-core-exclusions"] = duplicate_exclusions

    perpendicular_exclusions = []
    for a, b in itertools.combinations(LABELS, 2):
        outside = [label for label in LABELS if label not in {a, b}]
        for p, q, r in itertools.combinations(outside, 3):
            perpendicular_exclusions.append([
                -geq(edge_key(p, a), edge_key(p, b)),
                -geq(edge_key(q, a), edge_key(q, b)),
                -geq(edge_key(r, a), edge_key(r, b)),
            ])
    expected_blocks[
        "perpendicular-bisector-core-exclusions"
    ] = perpendicular_exclusions

    order_selectors = manifest["order_selectors"]
    if len(order_selectors) != 144:
        raise VerificationError("unexpected boundary-order selector count")
    if len({int(order["variable"]) for order in order_selectors}) != 144:
        raise VerificationError("boundary-order selector variables are not unique")
    orientation_counts = {"direct": 0, "mirror": 0}
    convex_naive = 0
    convex_seen: set[tuple[int, ...]] = set()
    convex_exclusions: list[list[int]] = []
    for order in order_selectors:
        selector = int(order["variable"])
        labels = tuple(map(int, order["labels"]))
        orientation = order["orientation"]
        if set(labels) != set(LABELS) or len(labels) != len(LABELS):
            raise VerificationError("boundary order is not a label permutation")
        if orientation not in orientation_counts:
            raise VerificationError("unknown boundary-order orientation")
        orientation_counts[orientation] += 1
        for start in range(len(labels)):
            cyclic = labels[start:] + labels[:start]
            a = cyclic[0]
            for positions in itertools.combinations(range(1, len(labels)), 4):
                x, b, c, y = (cyclic[position] for position in positions)
                if len({a, x, b, c, y}) != 5:
                    raise VerificationError("convex-five tuple is not distinct")
                clause = [
                    -selector,
                    -geq(edge_key(x, a), edge_key(x, b)),
                    -geq(edge_key(y, a), edge_key(y, b)),
                    -geq(edge_key(c, b), edge_key(c, x)),
                    -geq(edge_key(c, b), edge_key(c, y)),
                ]
                if len(set(clause)) != 5:
                    raise VerificationError(
                        "convex-five exclusion has repeated literals"
                    )
                convex_naive += 1
                canonical = tuple(sorted(clause))
                if canonical not in convex_seen:
                    convex_seen.add(canonical)
                    convex_exclusions.append(clause)
    expected_blocks[
        "convex-five-point-core-forward-exclusions"
    ] = convex_exclusions

    def local_eq(center: int, left: int, right: int) -> int:
        if left == right:
            raise VerificationError("local equality repeats a label")
        return eq_vars[(center, min(left, right), max(left, right))]

    local_four_definitions = []
    for (center, support), helper in sorted(local_four.items()):
        anchor = support[0]
        equalities = [
            local_eq(center, anchor, other) for other in support[1:]
        ]
        if len(equalities) != 3 or len(set(equalities)) != 3:
            raise VerificationError("bad local-four helper definition")
        local_four_definitions.extend(
            [[-helper, equality_variable] for equality_variable in equalities]
        )
        local_four_definitions.append(
            [helper] + [-variable for variable in equalities]
        )
    expected_blocks["v6-local-four-class-witness-iff"] = (
        local_four_definitions
    )

    def qpair(deleted: int, center: int, first: int, second: int) -> int:
        return qdeleted_pair[
            (deleted, center, min(first, second), max(first, second))
        ]

    qdeleted_pair_definitions = []
    for (deleted, center, first, second), helper in sorted(
        qdeleted_pair.items()
    ):
        extras = [
            label for label in LABELS
            if label not in {deleted, center, first, second}
        ]
        witnesses = [
            local_four[(center, tuple(sorted((first, second, a, b))))]
            for a, b in itertools.combinations(extras, 2)
        ]
        if len(witnesses) != 21 or len(set(witnesses)) != 21:
            raise VerificationError("bad q-deleted-pair witness surface")
        qdeleted_pair_definitions.extend(
            [[-witness, helper] for witness in witnesses]
        )
        qdeleted_pair_definitions.append([-helper] + witnesses)
    expected_blocks["v6-qdeleted-pair-witness-iff"] = (
        qdeleted_pair_definitions
    )

    row_by_key = {}
    for row in manifest["selected_rows"]:
        key = (int(row["center"]), int(row["row_index"]))
        support = tuple(sorted(map(int, row["support"])))
        if key in row_by_key:
            raise VerificationError("duplicate selected-row manifest key")
        if (
            key[0] not in LABELS
            or len(support) != 4
            or len(set(support)) != 4
            or key[0] in support
        ):
            raise VerificationError("malformed selected-row manifest entry")
        row_by_key[key] = support

    source_choices = manifest["source_choices"]
    if len(source_choices) != EXPECTED_SOURCE_CHOICES:
        raise VerificationError("unexpected source-choice count")
    source_choice_keys = set()
    source_choice_variables = set()
    family_a = []
    family_b = []
    logical_family_a_count = 0
    for choice in source_choices:
        deleted = int(choice["source"])
        center = int(choice["center"])
        row_index = int(choice["row_index"])
        selector = int(choice["variable"])
        key = (deleted, center, row_index)
        if key in source_choice_keys:
            raise VerificationError("duplicate source-choice key")
        if selector in source_choice_variables:
            raise VerificationError("source-choice variable IDs alias")
        source_choice_keys.add(key)
        source_choice_variables.add(selector)
        try:
            support = set(row_by_key[(center, row_index)])
        except KeyError as error:
            raise VerificationError(
                "source choice lacks selected-row manifest entry"
            ) from error
        if (
            deleted not in LABELS
            or len(support) != 4
            or deleted not in support
            or center in support
        ):
            raise VerificationError("malformed source-choice theorem premises")
        triple = sorted(support - {deleted})
        outside = sorted(set(LABELS) - support - {center})
        if len(triple) != 3 or len(outside) != 6:
            raise VerificationError("bad source-choice premise cardinality")
        for member in triple:
            for off_circle in outside:
                family_a.append([
                    -selector,
                    -qpair(deleted, member, center, off_circle),
                    -qpair(deleted, off_circle, center, member),
                ])
                logical_family_a_count += 21 * 21
        for off_circle in outside:
            family_b.append(
                [-selector]
                + [
                    -local_eq(off_circle, center, member)
                    for member in triple
                ]
            )
    expected_blocks[
        "v6-u5-nontriple-equilateral-incompatibilities"
    ] = family_a
    expected_blocks[
        "v6-u5-common-bisector-triple-incompatibilities"
    ] = family_b

    for name, expected in expected_blocks.items():
        if name not in blocks:
            raise VerificationError(f"missing clause block {name}")
        first, last, count = blocks[name]
        actual = clauses[first - 1:last]
        if count != len(expected) or actual != expected:
            raise VerificationError(f"exact clause block mismatch for {name}")
    if len(duplicate_exclusions) != 4620:
        raise VerificationError("unexpected duplicate-center clause count")
    if len(perpendicular_exclusions) != 4620:
        raise VerificationError("unexpected perpendicular-bisector clause count")
    if convex_naive != EXPECTED_CONVEX_FIVE_POINT_CORE_NAIVE_CLAUSES:
        raise VerificationError("unexpected convex-five naive clause count")
    if len(convex_exclusions) != convex_naive:
        raise VerificationError("unexpected convex-five exact duplicate")
    if len(local_four_definitions) != 4 * EXPECTED_LOCAL_FOUR_CLASS_VARIABLES:
        raise VerificationError("unexpected local-four definition count")
    if (
        len(qdeleted_pair_definitions)
        != 22 * EXPECTED_QDELETED_PAIR_VARIABLES
    ):
        raise VerificationError("unexpected q-deleted-pair definition count")
    if len(family_a) != EXPECTED_FAMILY_A_COMPACT_CLAUSES:
        raise VerificationError("unexpected compact Family A count")
    if logical_family_a_count != EXPECTED_FAMILY_A_LOGICAL_CLAUSES:
        raise VerificationError("unexpected logical Family A count")
    if len(family_b) != EXPECTED_FAMILY_B_CLAUSES:
        raise VerificationError("unexpected Family B count")
    duplicate_last = blocks["duplicate-center-core-exclusions"][1]
    perpendicular_first, perpendicular_last, _ = blocks[
        "perpendicular-bisector-core-exclusions"
    ]
    if perpendicular_first != duplicate_last + 1:
        raise VerificationError(
            "perpendicular-bisector block does not immediately extend v3"
        )
    convex_first, convex_last, convex_count = blocks[
        "convex-five-point-core-forward-exclusions"
    ]
    if convex_first != perpendicular_last + 1:
        raise VerificationError(
            "convex-five block does not immediately extend v4"
        )
    local_four_first, local_four_last, _ = blocks[
        "v6-local-four-class-witness-iff"
    ]
    qpair_first, qpair_last, _ = blocks["v6-qdeleted-pair-witness-iff"]
    family_a_first, family_a_last, _ = blocks[
        "v6-u5-nontriple-equilateral-incompatibilities"
    ]
    family_b_first, family_b_last, _ = blocks[
        "v6-u5-common-bisector-triple-incompatibilities"
    ]
    if local_four_first != convex_last + 1:
        raise VerificationError("v6 helper definitions do not extend v5")
    if qpair_first != local_four_last + 1:
        raise VerificationError("q-deleted-pair definitions are not contiguous")
    if family_a_first != qpair_last + 1:
        raise VerificationError("Family A does not follow helper definitions")
    if family_b_first != family_a_last + 1:
        raise VerificationError("Family B does not immediately follow Family A")
    expected_formula_end = len(clauses) - len(
        manifest.get("self_test_extra_clauses", [])
    )
    if family_b_last != expected_formula_end:
        raise VerificationError(
            "Family B is not the final production block"
        )
    return {
        "global_equality_variables": len(global_vars),
        "global_transitivity_clauses_exact": len(transitivity),
        "selected_row_global_seed_clauses_exact": len(row_seeds),
        "exact_five_global_seed_clauses_exact": (
            len(expected_blocks.get(
                "first-apex-exact-five-global-equality-seeds", []
            ))
        ),
        "duplicate_center_core_clauses_exact": len(duplicate_exclusions),
        "perpendicular_bisector_core_clauses_exact":
            len(perpendicular_exclusions),
        "boundary_order_selector_count_exact": len(order_selectors),
        "boundary_order_orientation_counts": orientation_counts,
        "convex_five_point_core_naive_clauses_exact": convex_naive,
        "convex_five_point_core_deduplicated_clauses_exact": convex_count,
        "convex_five_point_core_safe_dedup_removed": (
            convex_naive - convex_count
        ),
        "v3_clause_prefix_ends_at": duplicate_last,
        "v4_zero_variable_clause_suffix_begins_at": perpendicular_first,
        "v4_clause_prefix_ends_at": perpendicular_last,
        "v5_zero_variable_clause_suffix_begins_at": convex_first,
        "v5_clause_prefix_ends_at": convex_last,
        "v6_local_four_class_variables_exact": len(local_four),
        "v6_local_four_definition_clauses_exact":
            len(local_four_definitions),
        "v6_qdeleted_pair_variables_exact": len(qdeleted_pair),
        "v6_qdeleted_pair_definition_clauses_exact":
            len(qdeleted_pair_definitions),
        "v6_family_a_literal_clauses_exact": logical_family_a_count,
        "v6_family_a_compact_clauses_exact": len(family_a),
        "v6_family_b_clauses_exact": len(family_b),
        "v6_clause_suffix_begins_at": local_four_first,
    }


class UnionFind:
    def __init__(self, values: tuple[tuple[int, int], ...]) -> None:
        self.parent = {value: value for value in values}

    def find(self, value: tuple[int, int]) -> tuple[int, int]:
        while self.parent[value] != value:
            self.parent[value] = self.parent[self.parent[value]]
            value = self.parent[value]
        return value

    def union(self, first: tuple[int, int], second: tuple[int, int]) -> None:
        first_root, second_root = self.find(first), self.find(second)
        if first_root != second_root:
            self.parent[max(first_root, second_root)] = min(first_root, second_root)


def duplicate_witness(equal) -> dict | None:
    for p, q, r in itertools.combinations(LABELS, 3):
        centers = []
        for center in LABELS:
            if center in {p, q, r}:
                continue
            if (
                equal(edge_key(center, p), edge_key(center, q))
                and equal(edge_key(center, p), edge_key(center, r))
            ):
                centers.append(center)
        if len(centers) >= 2:
            return {
                "p": p, "q": q, "r": r,
                "first_center": centers[0], "second_center": centers[1],
            }
    return None


def perpendicular_bisector_witness(equal) -> dict | None:
    for a, b in itertools.combinations(LABELS, 2):
        points = [
            point for point in LABELS
            if point not in {a, b}
            and equal(edge_key(point, a), edge_key(point, b))
        ]
        if len(points) >= 3:
            return {
                "focus_a": a,
                "focus_b": b,
                "p": points[0],
                "q": points[1],
                "r": points[2],
            }
    return None


def convex_five_point_witness(orders: list[dict], equal) -> dict | None:
    for order in orders:
        labels = tuple(map(int, order["labels"]))
        for start in range(len(labels)):
            cyclic = labels[start:] + labels[:start]
            a = cyclic[0]
            for positions in itertools.combinations(range(1, len(labels)), 4):
                x, b, c, y = (cyclic[position] for position in positions)
                comparisons = (
                    (edge_key(x, a), edge_key(x, b)),
                    (edge_key(y, a), edge_key(y, b)),
                    (edge_key(c, b), edge_key(c, x)),
                    (edge_key(c, b), edge_key(c, y)),
                )
                if all(equal(first, second) for first, second in comparisons):
                    return {
                        "selector_variable": int(order["variable"]),
                        "orientation": order["orientation"],
                        "internal_index": int(order["internal_index"]),
                        "a": a, "x": x, "b": b, "c": c, "y": y,
                        "comparisons": [
                            [list(first), list(second)]
                            for first, second in comparisons
                        ],
                    }
    return None


def validate_sat(
    cnf_vars: int,
    clauses: list[list[int]],
    assignment: dict[int, bool],
    manifest: dict,
) -> dict:
    if set(assignment) != set(range(1, cnf_vars + 1)):
        missing = sorted(set(range(1, cnf_vars + 1)) - set(assignment))
        extra = sorted(set(assignment) - set(range(1, cnf_vars + 1)))
        raise VerificationError(f"incomplete assignment (missing={missing[:5]}, extra={extra[:5]})")
    failed = [
        index for index, clause in enumerate(clauses, start=1)
        if not any(assignment[abs(literal)] == (literal > 0) for literal in clause)
    ]
    if failed:
        raise VerificationError(f"assignment fails DIMACS clauses {failed[:10]}")

    rows_by_center: dict[int, list[dict]] = {center: [] for center in LABELS}
    row_by_key = {}
    for row in manifest["selected_rows"]:
        center = int(row["center"])
        rows_by_center[center].append(row)
        row_by_key[(center, int(row["row_index"]))] = row
    cube: dict[int, set[int]] = {}
    selected_indices = {}
    for center in LABELS:
        chosen = [
            row for row in rows_by_center[center]
            if assignment[int(row["variable"])]
        ]
        if len(chosen) != 1:
            raise VerificationError(f"center {center} selects {len(chosen)} rows")
        row = chosen[0]
        support = set(map(int, row["support"]))
        if len(support) != 4 or center in support or not onehit_ok(center, support):
            raise VerificationError(f"center {center} violates C1/one-hit")
        cube[center] = support
        selected_indices[center] = int(row["row_index"])

    pair_counts: dict[tuple[int, int], int] = {}
    triple_counts: dict[tuple[int, int, int], int] = {}
    for center in LABELS:
        for pair in itertools.combinations(sorted(cube[center]), 2):
            pair_counts[pair] = pair_counts.get(pair, 0) + 1
        for triple in itertools.combinations(sorted(cube[center]), 3):
            triple_counts[triple] = triple_counts.get(triple, 0) + 1
    if max(pair_counts.values(), default=0) > 2:
        raise VerificationError("C4 pair capacity exceeds two")
    if max(triple_counts.values(), default=0) > 1:
        raise VerificationError("C2/triple capacity exceeds one")
    for first, second in itertools.combinations(LABELS, 2):
        if len(cube[first] & cube[second]) > 2:
            raise VerificationError("C2 row intersection exceeds two")

    selected_orders = [
        order for order in manifest["order_selectors"]
        if assignment[int(order["variable"])]
    ]
    if not selected_orders:
        raise VerificationError("no order selector is positive")
    if not all(validate_order(cube, list(map(int, order["labels"])))
               for order in selected_orders):
        raise VerificationError("a selected boundary order violates separation")

    shell = manifest.get("shell")
    if shell is not None:
        u5 = set(map(int, shell["u5"]))
        if not ({Q, WITNESS} <= cube[V] <= u5):
            raise VerificationError("first-apex Census shell constraint failed")
        if not ({Q, WITNESS} <= cube[BLOCKER]):
            raise VerificationError("common blocker Census shell constraint failed")
        if pair_counts.get(tuple(sorted((Q, WITNESS))), 0) != 2:
            raise VerificationError("common pair is not saturated at exactly two centers")

    choices_by_source = {source: [] for source in LABELS}
    for choice in manifest["source_choices"]:
        if assignment[int(choice["variable"])]:
            source_label = int(choice["source"])
            choices_by_source[source_label].append(choice)
    selected_choices = {}
    for source_label in LABELS:
        chosen = choices_by_source[source_label]
        if len(chosen) != 1:
            raise VerificationError(
                f"source {source_label} selects {len(chosen)} blocker rows"
            )
        choice = chosen[0]
        center = int(choice["center"])
        row_index = int(choice["row_index"])
        support = set(map(int, row_by_key[(center, row_index)]["support"]))
        if source_label not in support or center in support:
            raise VerificationError("source membership or center exclusion failed")
        if selected_indices[center] != row_index:
            raise VerificationError("source choice does not preserve selected row")
        selected_choices[source_label] = (center, row_index)

    expected_source_center_domain = {
        (int(choice["source"]), int(choice["center"]))
        for choice in manifest["source_choices"]
    }
    source_center_vars = {}
    for entry in manifest["source_center_variables"]:
        key = (int(entry["source"]), int(entry["center"]))
        if key in source_center_vars:
            raise VerificationError("duplicate source-center manifest entry")
        source_center_vars[key] = int(entry["variable"])
    if set(source_center_vars) != expected_source_center_domain:
        raise VerificationError("source-center variable domain is incomplete")
    for (source_label, center), variable in source_center_vars.items():
        expected = selected_choices[source_label][0] == center
        if assignment[variable] != expected:
            raise VerificationError("source-center variable lacks exact iff semantics")

    selected_blocker_centers = {
        center for center, _ in selected_choices.values()
    }
    for center in LABELS:
        used_var = int(manifest["used_center_variables"][str(center)])
        if assignment[used_var] != (center in selected_blocker_centers):
            raise VerificationError("used-center variable lacks exact iff semantics")

    eq_vars = parse_local_variables(manifest)

    local_classes = {}
    for center in LABELS:
        # Exhaustive semantic transitivity audit, independent of the CNF clauses.
        incident = [label for label in LABELS if label != center]
        for a, b, d in itertools.permutations(incident, 3):
            ab = assignment[eq_vars[(center, min(a, b), max(a, b))]]
            bd = assignment[eq_vars[(center, min(b, d), max(b, d))]]
            ad = assignment[eq_vars[(center, min(a, d), max(a, d))]]
            if ab and bd and not ad:
                raise VerificationError("local equality is not transitive")
        classes = classes_at(center, eq_vars, assignment)
        if set().union(*classes) != set(incident):
            raise VerificationError("local classes do not cover all incident edges")
        if sum(len(cls) for cls in classes) != len(incident):
            raise VerificationError("local classes do not form a partition")
        local_classes[center] = classes
        if not any(cube[center] <= cls for cls in classes):
            raise VerificationError(
                "selected four-row lacks its theorem-backed internal equalities"
            )

    if shell is not None:
        u5 = set(map(int, shell["u5"]))
        if u5 not in local_classes[V]:
            raise VerificationError("named exact-five first-apex shell is not entire")
        if V in u5:
            raise VerificationError("first-apex shell contains its center")
        if not cube[V] < u5:
            raise VerificationError(
                "first-apex selected four is not a proper subset of the five-shell"
            )

    no_qfree_checked = 0
    if shell is not None:
        if selected_choices[Q][0] != BLOCKER or selected_choices[WITNESS][0] != BLOCKER:
            raise VerificationError("common sources 6 and 7 do not map to blocker 8")
    for source_label, (center, _) in selected_choices.items():
        if cube[center] not in local_classes[center]:
            raise VerificationError(
                f"blocker row for source {source_label} is not an entire class"
            )
        remaining = set(LABELS) - {center, source_label}
        remaining_class_sizes = [
            len(cls & remaining) for cls in local_classes[center]
        ]
        if max(remaining_class_sizes, default=0) >= 4:
            raise VerificationError(
                f"no_qfree fails for source {source_label} at center {center}"
            )
        no_qfree_checked += 1

    local_four_vars, qdeleted_pair_vars = parse_v6_aux_variables(
        manifest, cnf_vars
    )
    local_four_checked = 0
    for (center, support), helper in local_four_vars.items():
        anchor = support[0]
        expected = all(
            assignment[
                eq_vars[(center, min(anchor, other), max(anchor, other))]
            ]
            for other in support[1:]
        )
        if assignment[helper] != expected:
            raise VerificationError(
                "local-four helper lacks exact iff semantics"
            )
        local_four_checked += 1
    qdeleted_pair_checked = 0
    for (deleted, center, first, second), helper in (
        qdeleted_pair_vars.items()
    ):
        extras = [
            label for label in LABELS
            if label not in {deleted, center, first, second}
        ]
        expected = any(
            assignment[
                local_four_vars[
                    (center, tuple(sorted((first, second, a, b))))
                ]
            ]
            for a, b in itertools.combinations(extras, 2)
        )
        if assignment[helper] != expected:
            raise VerificationError(
                "q-deleted-pair helper lacks exact iff semantics"
            )
        qdeleted_pair_checked += 1

    family_a_selected_checks = 0
    family_b_selected_checks = 0
    for choice in manifest["source_choices"]:
        selector = int(choice["variable"])
        if not assignment[selector]:
            continue
        deleted = int(choice["source"])
        center = int(choice["center"])
        support = set(
            map(
                int,
                row_by_key[
                    (center, int(choice["row_index"]))
                ]["support"],
            )
        )
        triple = sorted(support - {deleted})
        outside = sorted(set(LABELS) - support - {center})
        for member in triple:
            for off_circle in outside:
                first = qdeleted_pair_vars[
                    (
                        deleted, member,
                        min(center, off_circle), max(center, off_circle),
                    )
                ]
                second = qdeleted_pair_vars[
                    (
                        deleted, off_circle,
                        min(center, member), max(center, member),
                    )
                ]
                if assignment[first] and assignment[second]:
                    raise VerificationError(
                        "selected source choice violates Family A"
                    )
                family_a_selected_checks += 1
        for off_circle in outside:
            if all(
                assignment[
                    eq_vars[
                        (
                            off_circle,
                            min(center, member),
                            max(center, member),
                        )
                    ]
                ]
                for member in triple
            ):
                raise VerificationError(
                    "selected source choice violates Family B"
                )
            family_b_selected_checks += 1

    global_vars = parse_global_variables(manifest, cnf_vars)

    def assigned_global_equal(
        first: tuple[int, int], second: tuple[int, int]
    ) -> bool:
        if first == second:
            return True
        return assignment[global_vars[global_key(first, second)]]

    # Exhaustive semantic transitivity check, separately from DIMACS.
    for first, second, third in itertools.combinations(GLOBAL_EDGES, 3):
        fs = assigned_global_equal(first, second)
        ft = assigned_global_equal(first, third)
        st = assigned_global_equal(second, third)
        if (fs and ft and not st) or (fs and st and not ft) or (ft and st and not fs):
            raise VerificationError("assigned global edge equality is not transitive")

    closure = UnionFind(GLOBAL_EDGES)
    selected_global_seeds = 0
    for center, support in cube.items():
        for left, right in itertools.combinations(sorted(support), 2):
            first, second = edge_key(center, left), edge_key(center, right)
            closure.union(first, second)
            selected_global_seeds += 1
            if not assigned_global_equal(first, second):
                raise VerificationError("selected-row global equality seed is false")
    exact_five_global_seeds = 0
    if shell is not None:
        for left, right in itertools.combinations(sorted(map(int, shell["u5"])), 2):
            first, second = edge_key(V, left), edge_key(V, right)
            closure.union(first, second)
            exact_five_global_seeds += 1
            if not assigned_global_equal(first, second):
                raise VerificationError("exact-five global equality seed is false")

    least_closure_witness = duplicate_witness(
        lambda first, second: closure.find(first) == closure.find(second)
    )
    if least_closure_witness is not None:
        raise VerificationError(
            f"least seeded closure has duplicate-center core {least_closure_witness}"
        )
    assigned_witness = duplicate_witness(assigned_global_equal)
    if assigned_witness is not None:
        raise VerificationError(
            f"assigned global equality has duplicate-center core {assigned_witness}"
        )
    least_perpendicular_witness = perpendicular_bisector_witness(
        lambda first, second: closure.find(first) == closure.find(second)
    )
    if least_perpendicular_witness is not None:
        raise VerificationError(
            "least seeded closure has perpendicular-bisector core "
            f"{least_perpendicular_witness}"
        )
    assigned_perpendicular_witness = perpendicular_bisector_witness(
        assigned_global_equal
    )
    if assigned_perpendicular_witness is not None:
        raise VerificationError(
            "assigned global equality has perpendicular-bisector core "
            f"{assigned_perpendicular_witness}"
        )
    least_convex_five_witness = convex_five_point_witness(
        selected_orders,
        lambda first, second: closure.find(first) == closure.find(second),
    )
    if least_convex_five_witness is not None:
        raise VerificationError(
            "least seeded closure has convex-five-point core "
            f"{least_convex_five_witness}"
        )
    assigned_convex_five_witness = convex_five_point_witness(
        selected_orders, assigned_global_equal
    )
    if assigned_convex_five_witness is not None:
        raise VerificationError(
            "assigned global equality has convex-five-point core "
            f"{assigned_convex_five_witness}"
        )

    return {
        "verified": True,
        "mode": "SAT-model",
        "cnf_clause_check": True,
        "all_variables_assigned": True,
        "census_c1_onehit_c2_c4": True,
        "pair_capacity_max": max(pair_counts.values(), default=0),
        "triple_capacity_max": max(triple_counts.values(), default=0),
        "selected_order_count": len(selected_orders),
        "source_map_total_functional_membership_preserved": True,
        "source_center_and_used_iff_semantics": True,
        "local_equivalence_partitions_checked": len(local_classes),
        "reflexivity_semantics": "implicit for each incident edge",
        "symmetry_semantics": "one canonical unordered-pair variable",
        "transitivity_exhaustively_checked": True,
        "selected_rows_are_equidistant_subsets": True,
        "selected_blocker_rows_are_entire_classes": True,
        "first_apex_selected_four_proper_subset_of_five_shell": (
            shell is not None
        ),
        "first_apex_exact_five_entire_class": shell is not None,
        "common_sources_map_to_blocker": shell is not None,
        "no_qfree_source_checks": no_qfree_checked,
        "v6_local_four_iff_semantics_checked": local_four_checked,
        "v6_qdeleted_pair_iff_semantics_checked": qdeleted_pair_checked,
        "v6_family_a_selected_choice_checks": family_a_selected_checks,
        "v6_family_b_selected_choice_checks": family_b_selected_checks,
        "global_equality_variables_checked": len(global_vars),
        "global_transitivity_exhaustively_checked": True,
        "selected_global_equality_seeds_checked": selected_global_seeds,
        "exact_five_global_equality_seeds_checked": exact_five_global_seeds,
        "least_seeded_global_closure_duplicate_free": True,
        "assigned_global_equivalence_extension_duplicate_free": True,
        "least_seeded_global_closure_perpendicular_bisector_free": True,
        "assigned_global_equivalence_extension_perpendicular_bisector_free":
            True,
        "least_seeded_global_closure_convex_five_point_free": True,
        "assigned_global_equivalence_extension_convex_five_point_free": True,
    }


def verify_unsat(case_dir: Path, result: dict, timeout: int) -> dict:
    cnf_path = case_dir / "input.cnf"
    proof_path = case_dir / "proof.drat"
    if not proof_path.exists() or proof_path.stat().st_size == 0:
        raise VerificationError("UNSAT artifact has no proof")
    if result.get("proof_sha256") != sha256_file(proof_path):
        raise VerificationError("proof hash mismatch")
    command = ["drat-trim", str(cnf_path), str(proof_path)]
    completed = subprocess.run(
        command, capture_output=True, text=True, timeout=timeout
    )
    output = completed.stdout + completed.stderr
    exact_verified = "s VERIFIED" in output.splitlines()
    if completed.returncode != 0 or not exact_verified:
        raise VerificationError(
            f"drat-trim rejected proof: returncode={completed.returncode}, tail={output[-500:]!r}"
        )
    return {
        "verified": True,
        "mode": "UNSAT-DRAT",
        "drat_trim_returncode": completed.returncode,
        "drat_exact_verified_line": exact_verified,
        "proof_bytes": proof_path.stat().st_size,
        "proof_sha256": sha256_file(proof_path),
        "command": command,
        "output_tail": output[-1000:],
        "source_to_valuation_trust_gap": (
            "certificate proves only this exact CNF; it does not prove the "
            "geometric-to-labelled source/blocker valuation adapter"
        ),
    }


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("case_dir", type=Path)
    parser.add_argument("--timeout", type=int, default=600)
    args = parser.parse_args()
    case_dir = args.case_dir.resolve()
    result = json.loads((case_dir / "result.json").read_text(encoding="utf-8"))
    manifest = json.loads((case_dir / "manifest.json").read_text(encoding="utf-8"))
    cnf_path = case_dir / "input.cnf"
    if result["cnf_sha256"] != sha256_file(cnf_path):
        raise VerificationError("CNF hash mismatch")
    if result["manifest_sha256"] != sha256_file(case_dir / "manifest.json"):
        raise VerificationError("manifest hash mismatch")
    cnf_vars, clauses = read_dimacs(cnf_path)
    if cnf_vars != int(manifest["variables"]) or len(clauses) != int(manifest["clauses"]):
        raise VerificationError("manifest/DIMACS count mismatch")
    global_vars = parse_global_variables(manifest, cnf_vars)
    eq_vars = parse_local_variables(manifest)
    local_four, qdeleted_pair = parse_v6_aux_variables(manifest, cnf_vars)
    structural = verify_v6_clause_blocks(
        clauses, manifest, global_vars, eq_vars, local_four, qdeleted_pair
    )
    if result["verdict"] == "SAT":
        model_path = case_dir / "model.json"
        if result.get("model_sha256") != sha256_file(model_path):
            raise VerificationError("model hash mismatch")
        assignment = parse_model(model_path)
        if assignment != parse_assignment(case_dir / "cadical.stdout"):
            raise VerificationError("persisted model differs from solver output")
        verification = validate_sat(cnf_vars, clauses, assignment, manifest)
        verification["model_sha256"] = sha256_file(model_path)
    elif result["verdict"] == "UNSAT":
        verification = verify_unsat(case_dir, result, args.timeout)
    else:
        raise VerificationError(f"cannot verify nonterminal verdict {result['verdict']!r}")
    verification["v6_structural_audit"] = structural
    verification["cnf_sha256"] = sha256_file(cnf_path)
    verification["manifest_sha256"] = sha256_file(case_dir / "manifest.json")
    (case_dir / "verification.json").write_text(
        json.dumps(verification, sort_keys=True, indent=2) + "\n",
        encoding="utf-8",
    )
    print(json.dumps({
        "verified": verification["verified"],
        "mode": verification["mode"],
    }, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
