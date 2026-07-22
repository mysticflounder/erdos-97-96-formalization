#!/usr/bin/env python3
"""Source-faithful finite projection of the late-choice exact-four leaf.

This is a discovery outer, not a closure certificate.  It represents the
parts of ``OriginalUniqueFourResidual`` which are statements about complete
ambient radius partitions, one chosen four-row at every carrier center, and
the favorable ``lateFirstApexSystem`` normal form.  Coordinates, MEC geometry,
and the alternative-triangle content of ``noM44`` are deliberately absent and
are listed in the emitted metadata.

At n=11 there are exactly two cap profiles after orienting the surplus cap:
``(5,5,4)`` and ``(5,4,5)``.  The command-line ``--opp1-card`` switch runs
these two source-complete cap-size cases separately.  In either case the
canonical boundary order begins

    A1, s0, s1, s2, A2, ..., V, ..., A1.

Card ten is intentionally not searched: ``noM44`` and the generic opposite-
cap lower bounds force a second cap of size at least five, hence card at least
eleven.  The ``noM44`` field is represented at n=11 by enumerating the two
possible positions of that second large cap; no alternative-MEC-triangle
geometry is encoded.
"""

from __future__ import annotations

import argparse
import hashlib
import itertools
import json
import subprocess
import time
from collections import Counter
from pathlib import Path


Membership = tuple[int, int]


class CNF:
    def __init__(self) -> None:
        self.names: list[str] = ["<unused-zero>"]
        self.ids: dict[str, int] = {}
        self.clauses: list[tuple[int, ...]] = []
        self.block_counts: Counter[str] = Counter()

    def var(self, name: str) -> int:
        found = self.ids.get(name)
        if found is not None:
            return found
        identifier = len(self.names)
        self.ids[name] = identifier
        self.names.append(name)
        return identifier

    def add(self, block: str, literals: list[int] | tuple[int, ...]) -> None:
        clause = tuple(dict.fromkeys(literals))
        literal_set = set(clause)
        if any(-literal in literal_set for literal in clause):
            return
        if not clause:
            raise ValueError(f"attempted to add an empty clause in {block}")
        self.clauses.append(clause)
        self.block_counts[block] += 1

    def write_dimacs(self, path: Path, metadata: dict[str, object]) -> None:
        path.parent.mkdir(parents=True, exist_ok=True)
        with path.open("w", encoding="ascii") as handle:
            handle.write("c late-choice exact-four finite projection\n")
            for key, value in metadata.items():
                handle.write(f"c {key} {json.dumps(value, sort_keys=True)}\n")
            for identifier, name in enumerate(self.names[1:], start=1):
                handle.write(f"c var {identifier} {name}\n")
            handle.write(f"p cnf {len(self.names) - 1} {len(self.clauses)}\n")
            for clause in self.clauses:
                handle.write(" ".join(str(literal) for literal in clause))
                handle.write(" 0\n")


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def add_exactly_k(cnf: CNF, variables: tuple[int, ...], k: int, prefix: str) -> None:
    if not 0 <= k <= len(variables):
        raise ValueError((len(variables), k))
    for too_many in itertools.combinations(variables, k + 1):
        cnf.add(f"{prefix}_at_most_{k}", [-variable for variable in too_many])
    false_count = len(variables) - k + 1
    for forced_true in itertools.combinations(variables, false_count):
        cnf.add(f"{prefix}_at_least_{k}", list(forced_true))


def load_planar_bank(path: Path) -> tuple[list[tuple[int, tuple[Membership, ...]]], dict[str, object]]:
    payload = json.loads(path.read_text(encoding="utf-8"))
    expected = "p97-whole-carrier-planar-membership-schema-bank-v1"
    if payload.get("schema") != expected:
        raise ValueError(f"unexpected planar bank schema: {payload.get('schema')!r}")
    records = payload.get("schemas")
    if not isinstance(records, list) or int(payload.get("schema_count", -1)) != len(records):
        raise ValueError("planar bank count is inconsistent")
    answer: list[tuple[int, tuple[Membership, ...]]] = []
    for index, record in enumerate(records):
        k = int(record["active_role_count"])
        memberships = tuple(
            sorted(tuple(map(int, membership)) for membership in record["memberships"])
        )
        if record.get("transport") != "all_injective_role_maps":
            raise ValueError(f"schema {index} lacks injective transport")
        if len(set(memberships)) != len(memberships):
            raise ValueError(f"schema {index} contains duplicate memberships")
        if any(center == point or not (0 <= center < k and 0 <= point < k)
               for center, point in memberships):
            raise ValueError(f"schema {index} is malformed")
        if set(range(k)) != {role for pair in memberships for role in pair}:
            raise ValueError(f"schema {index} declares an unused role")
        answer.append((k, memberships))
    return answer, {
        "planar_bank": str(path),
        "planar_bank_sha256": sha256(path),
        "planar_bank_schema": expected,
        "planar_bank_schema_count": len(answer),
        "planar_bank_epistemic_status": payload.get("epistemic_status"),
    }


def load_kalmanson_bank(path: Path) -> tuple[list[tuple[int, tuple[Membership, ...]]], dict[str, object]]:
    payload = json.loads(path.read_text(encoding="utf-8"))
    expected = "p97-exact-four-kalmanson-order-schema-bank-v1"
    if payload.get("schema") != expected:
        raise ValueError(f"unexpected Kalmanson bank schema: {payload.get('schema')!r}")
    records = payload.get("schemas")
    if not isinstance(records, list) or int(payload.get("schema_count", -1)) != len(records):
        raise ValueError("Kalmanson bank count is inconsistent")
    answer: list[tuple[int, tuple[Membership, ...]]] = []
    seen: set[tuple[int, tuple[Membership, ...]]] = set()
    for index, record in enumerate(records):
        k = int(record["core_vertex_count"])
        schema = tuple(sorted(tuple(map(int, pair)) for pair in record["order_schema"]))
        if record.get("transport") != "order_preserving_and_reflected_injections":
            raise ValueError(f"Kalmanson schema {index} has the wrong transport")
        if len(set(schema)) != len(schema):
            raise ValueError(f"Kalmanson schema {index} has duplicate memberships")
        if any(center == point or not (0 <= center < k and 0 <= point < k)
               for center, point in schema):
            raise ValueError(f"Kalmanson schema {index} is malformed")
        key = (k, schema)
        if key in seen:
            raise ValueError(f"Kalmanson schema {index} duplicates an earlier schema")
        seen.add(key)
        answer.append(key)
    return answer, {
        "kalmanson_bank": str(path),
        "kalmanson_bank_sha256": sha256(path),
        "kalmanson_bank_schema": expected,
        "kalmanson_bank_schema_count": len(answer),
        "kalmanson_bank_epistemic_status": payload.get("epistemic_status"),
    }


def load_u5_bank(
    path: Path,
) -> tuple[list[tuple[int, tuple[Membership, ...], tuple[Membership, ...]]], dict[str, object]]:
    payload = json.loads(path.read_text(encoding="utf-8"))
    expected = "p97-exact-four-u5-signed-schema-bank-v1"
    if payload.get("schema") != expected:
        raise ValueError(f"unexpected U5 bank schema: {payload.get('schema')!r}")
    records = payload.get("schemas")
    if not isinstance(records, list) or int(payload.get("schema_count", -1)) != len(records):
        raise ValueError("U5 bank count is inconsistent")
    answer = []
    for index, record in enumerate(records):
        k = int(record["role_count"])
        positive = tuple(sorted(tuple(map(int, pair)) for pair in record["positive_memberships"]))
        negative = tuple(sorted(tuple(map(int, pair)) for pair in record["negative_memberships"]))
        if record.get("transport") != "all_injective_role_maps":
            raise ValueError(f"U5 schema {index} has the wrong transport")
        if len(set(positive)) != len(positive) or len(set(negative)) != len(negative):
            raise ValueError(f"U5 schema {index} has duplicate atoms")
        if set(positive) & set(negative):
            raise ValueError(f"U5 schema {index} has contradictory atoms")
        if any(center == point or not (0 <= center < k and 0 <= point < k)
               for center, point in (*positive, *negative)):
            raise ValueError(f"U5 schema {index} is malformed")
        answer.append((k, positive, negative))
    return answer, {
        "u5_bank": str(path),
        "u5_bank_sha256": sha256(path),
        "u5_bank_schema": expected,
        "u5_bank_schema_count": len(answer),
        "u5_bank_epistemic_status": payload.get("epistemic_status"),
    }


def encode(
    n: int,
    opp1_card: int,
    planar_bank_path: Path,
    kalmanson_bank_path: Path,
    u5_bank_path: Path,
    strict_cap_minimality_overlay: bool = False,
    pair_minimality_overlay: bool = False,
) -> tuple[CNF, dict[str, object]]:
    if n != 11:
        raise ValueError("this bounded correctness-gate prototype is intentionally fixed at n=11")
    if opp1_card not in {4, 5}:
        raise ValueError("--opp1-card must be 4 or 5")

    first_apex = 0
    second_apex = 4
    surplus_cap = frozenset({0, 1, 2, 3, 4})
    surplus_vertex = 4 + (opp1_card - 2) + 1
    first_opposite_cap = frozenset(range(second_apex, surplus_vertex + 1))
    second_opposite_cap = frozenset({surplus_vertex, *range(surplus_vertex + 1, n), first_apex})
    first_opposite_strict = frozenset(first_opposite_cap - {second_apex, surplus_vertex})
    vertices = tuple(range(n))

    cnf = CNF()
    member = {
        (center, point): cnf.var(f"m_{center}_{point}")
        for center in vertices
        for point in vertices
    }
    same = {
        (center, left, right): cnf.var(f"eq_{center}_{left}_{right}")
        for center in vertices
        for left, right in itertools.combinations(
            (point for point in vertices if point != center), 2
        )
    }

    def eq_var(center: int, left: int, right: int) -> int:
        if left == right or center in {left, right}:
            raise ValueError((center, left, right))
        return same[center, min(left, right), max(left, right)]
    blocker = {
        (source, center): cnf.var(f"b_{source}_{center}")
        for source in vertices
        for center in vertices
    }
    in_class = {point: cnf.var(f"class_{point}") for point in vertices}
    retained_q = {point: cnf.var(f"retained_q_{point}") for point in vertices}
    retained_w = {point: cnf.var(f"retained_w_{point}") for point in vertices}
    interior_q = {point: cnf.var(f"interior_q_{point}") for point in vertices}
    interior_w = {point: cnf.var(f"interior_w_{point}") for point in vertices}
    critical_support = {
        (source, point): cnf.var(f"h_{source}_{point}")
        for source in vertices
        for point in vertices
    }
    second_deletion_row = {
        point: cnf.var(f"second_deleted_{point}") for point in vertices
    }
    minimality_center = {
        point: cnf.var(f"minimality_center_{point}") for point in vertices
    }
    minimality_deleted = {
        point: cnf.var(f"minimality_deleted_{point}") for point in vertices
    }
    pair_minimality_center = {
        point: cnf.var(f"pair_minimality_center_{point}") for point in vertices
    }
    pair_minimality_deleted = {
        point: cnf.var(f"pair_minimality_deleted_{point}") for point in vertices
    }

    # Full positive-radius equality partitions at every carrier center.
    # Reflexivity is implicit and symmetry is represented by unordered pairs;
    # these three clauses per triple enforce transitivity in every direction.
    for center in vertices:
        targets = tuple(point for point in vertices if point != center)
        for left, middle, right in itertools.combinations(targets, 3):
            lm = eq_var(center, left, middle)
            lr = eq_var(center, left, right)
            mr = eq_var(center, middle, right)
            cnf.add("radius_partition_transitivity", [-lm, -mr, lr])
            cnf.add("radius_partition_transitivity", [-lm, -lr, mr])
            cnf.add("radius_partition_transitivity", [-lr, -mr, lm])

    # One selected nonself four-row at every carrier center, contained in one
    # complete equivalence class.  This is the global K4 witness projection.
    for center in vertices:
        cnf.add("row_nonself", [-member[center, center]])
        allowed = tuple(member[center, point] for point in vertices if point != center)
        add_exactly_k(cnf, allowed, 4, "row")
        targets = tuple(point for point in vertices if point != center)
        for left, right in itertools.combinations(targets, 2):
            cnf.add(
                "selected_row_subset_radius_class",
                [-member[center, left], -member[center, right],
                 eq_var(center, left, right)],
            )

    # Euclidean/convex consequences for every complete radius class, not only
    # for the selected four-subsets.
    for left, right in itertools.combinations(vertices, 2):
        possible = tuple(point for point in vertices if point not in {left, right})
        for triple in itertools.combinations(possible, 3):
            cnf.add(
                "full_class_intersection_at_most_2",
                [-eq_var(left, triple[0], triple[1]),
                 -eq_var(left, triple[0], triple[2]),
                 -eq_var(right, triple[0], triple[1]),
                 -eq_var(right, triple[0], triple[2])],
            )
    for first, second in itertools.combinations(vertices, 2):
        possible = tuple(center for center in vertices if center not in {first, second})
        for triple in itertools.combinations(possible, 3):
            cnf.add(
                "full_pair_center_count_at_most_2",
                [-eq_var(center, first, second) for center in triple],
            )
    for left, right in itertools.combinations(vertices, 2):
        possible = tuple(point for point in vertices if point not in {left, right})
        for p, q in itertools.combinations(possible, 2):
            alternates = (left < p < right) != (left < q < right)
            if not alternates:
                cnf.add(
                    "full_class_cyclic_alternation",
                    [-eq_var(left, p, q), -eq_var(right, p, q)],
                )

    # Minimality consequence: every choice of one four-witness per center is
    # strongly connected.  Outgoing cuts are equivalent to that property.
    for size in range(1, n):
        for subset_tuple in itertools.combinations(vertices, size):
            subset = frozenset(subset_tuple)
            cnf.add(
                "strong_connectivity_outgoing_cut",
                [member[center, point]
                 for center in subset_tuple for point in vertices if point not in subset],
            )

    # Distinguished complete first-apex class, projected to its exact selected
    # support.
    add_exactly_k(cnf, tuple(in_class.values()), 4, "first_apex_class")
    cnf.add("first_apex_not_in_own_class", [-in_class[first_apex]])
    first_targets = tuple(point for point in vertices if point != first_apex)
    for left, right in itertools.combinations(first_targets, 2):
        eq = eq_var(first_apex, left, right)
        cnf.add("first_apex_class_pairwise_equal", [-in_class[left], -in_class[right], eq])
        cnf.add("first_apex_class_closed", [-in_class[left], -eq, in_class[right]])
        cnf.add("first_apex_class_closed", [-in_class[right], -eq, in_class[left]])
    # Every positive first-apex class with at least four members is the
    # distinguished class.  Together with exact cardinality and closure this
    # is the source's unique-K4-radius field.
    for four in itertools.combinations(first_targets, 4):
        cnf.add(
            "first_apex_unique_K4_class",
            [-eq_var(first_apex, four[0], four[1]),
             -eq_var(first_apex, four[0], four[2]),
             -eq_var(first_apex, four[0], four[3]),
             in_class[four[0]]],
        )
    # Existing endpoint one-hit theorems: the complete first-apex class meets
    # each adjacent closed cap in at most one point.
    for cap_name, cap in (("surplus", surplus_cap), ("opp2", second_opposite_cap)):
        for left, right in itertools.combinations(sorted(cap), 2):
            cnf.add(f"first_apex_class_{cap_name}_at_most_one",
                    [-in_class[left], -in_class[right]])
    for point in vertices:
        cnf.add("first_apex_row_eq_class", [-member[first_apex, point], in_class[point]])
        cnf.add("first_apex_row_eq_class", [-in_class[point], member[first_apex, point]])

    # The strict-cap pair and retained frontier pair are separate role pairs.
    # No disjointness or inequality between the unordered pairs is imposed:
    # the source permits overlap and even coincidence of the two pairs.
    add_exactly_k(
        cnf,
        tuple(interior_q[point] for point in first_opposite_strict),
        1,
        "interior_q",
    )
    add_exactly_k(
        cnf,
        tuple(interior_w[point] for point in first_opposite_strict),
        1,
        "interior_w",
    )
    for point in vertices:
        if point not in first_opposite_strict:
            cnf.add("interior_pair_in_strict_cap", [-interior_q[point]])
            cnf.add("interior_pair_in_strict_cap", [-interior_w[point]])
        else:
            cnf.add("interior_pair_in_class", [-interior_q[point], in_class[point]])
            cnf.add("interior_pair_in_class", [-interior_w[point], in_class[point]])
        cnf.add("interior_pair_distinct", [-interior_q[point], -interior_w[point]])

    # The favorable late system has blocker fiber at A1 exactly equal to the
    # four-class.  Its critical shell is source-indexed and is exactly the full
    # radius class through that source.  The per-center row is a completion of
    # those shells: if a center occurs in the blocker image, its row is the
    # common H support; otherwise global K4 supplies an arbitrary selected row.
    # The A2 double-deletion row below remains separate.
    # Unlike the old generic outer, neither physical apex is globally forbidden
    # as a blocker.
    for source in vertices:
        allowed_centers = tuple(center for center in vertices if center != source)
        add_exactly_k(
            cnf,
            tuple(blocker[source, center] for center in allowed_centers),
            1,
            "blocker",
        )
        cnf.add("blocker_fixed_point_free", [-blocker[source, source]])
        add_exactly_k(
            cnf,
            tuple(critical_support[source, point] for point in vertices),
            4,
            "critical_support",
        )
        cnf.add("critical_support_contains_source", [critical_support[source, source]])
        for center in allowed_centers:
            for point in vertices:
                if point == center:
                    cnf.add(
                        "critical_support_excludes_center",
                        [-blocker[source, center], -critical_support[source, point]],
                    )
                elif point != source:
                    eq = eq_var(center, source, point)
                    cnf.add(
                        "critical_support_eq_full_radius_class",
                        [-blocker[source, center], -critical_support[source, point], eq],
                    )
                    cnf.add(
                        "critical_support_eq_full_radius_class",
                        [-blocker[source, center], -eq, critical_support[source, point]],
                    )
                cnf.add(
                    "blocker_center_row_eq_critical_support",
                    [-blocker[source, center], -member[center, point],
                     critical_support[source, point]],
                )
                cnf.add(
                    "blocker_center_row_eq_critical_support",
                    [-blocker[source, center], -critical_support[source, point],
                     member[center, point]],
                )
            # After deleting source, every complete radius class at the blocker
            # has cardinality at most three.  This is the finite no_qfree
            # condition, and also forces the source class to be exact four.
            remaining = tuple(point for point in vertices if point not in {center, source})
            for four in itertools.combinations(remaining, 4):
                cnf.add(
                    "critical_no_qfree_full_partition",
                    [-blocker[source, center],
                     -eq_var(center, four[0], four[1]),
                     -eq_var(center, four[0], four[2]),
                     -eq_var(center, four[0], four[3])],
                )
        cnf.add("first_apex_fiber_eq_class", [-blocker[source, first_apex], in_class[source]])
        cnf.add("first_apex_fiber_eq_class", [-in_class[source], blocker[source, first_apex]])
        for point in vertices:
            cnf.add(
                "class_source_critical_support_eq_class",
                [-in_class[source], -critical_support[source, point], in_class[point]],
            )
            cnf.add(
                "class_source_critical_support_eq_class",
                [-in_class[source], -in_class[point], critical_support[source, point]],
            )

    # If two sources select the same critical center then criticality forces
    # their complete exact-four supports to agree.
    for source_left, source_right in itertools.combinations(vertices, 2):
        for center in vertices:
            for point in vertices:
                cnf.add(
                    "same_blocker_same_critical_support",
                    [-blocker[source_left, center], -blocker[source_right, center],
                     -critical_support[source_left, point], critical_support[source_right, point]],
                )
                cnf.add(
                    "same_blocker_same_critical_support",
                    [-blocker[source_left, center], -blocker[source_right, center],
                     -critical_support[source_right, point], critical_support[source_left, point]],
                )

    # Ordered role variables for the retained frontier pair.  Their two points
    # are distinct, lie in the class, and lie outside the surplus cap.
    q_allowed = tuple(point for point in vertices if point not in surplus_cap)
    add_exactly_k(cnf, tuple(retained_q[point] for point in q_allowed), 1, "retained_q")
    add_exactly_k(cnf, tuple(retained_w[point] for point in q_allowed), 1, "retained_w")
    for point in vertices:
        if point in surplus_cap:
            cnf.add("retained_pair_outside_surplus", [-retained_q[point]])
            cnf.add("retained_pair_outside_surplus", [-retained_w[point]])
        else:
            cnf.add("retained_pair_in_class", [-retained_q[point], in_class[point]])
            cnf.add("retained_pair_in_class", [-retained_w[point], in_class[point]])
        cnf.add("retained_pair_distinct", [-retained_q[point], -retained_w[point]])
        # A chosen second-apex witness after deleting the retained pair.  This
        # is deliberately not identified with member[second_apex,*].
        cnf.add("second_apex_row_avoids_retained_pair",
                [-retained_q[point], -second_deletion_row[point]])
        cnf.add("second_apex_row_avoids_retained_pair",
                [-retained_w[point], -second_deletion_row[point]])

    add_exactly_k(cnf, tuple(second_deletion_row.values()), 4, "second_deletion_row")
    cnf.add("second_deletion_row_nonself", [-second_deletion_row[second_apex]])
    second_targets = tuple(point for point in vertices if point != second_apex)
    for left, right in itertools.combinations(second_targets, 2):
        cnf.add(
            "second_deletion_row_subset_radius_class",
            [-second_deletion_row[left], -second_deletion_row[right],
             eq_var(second_apex, left, right)],
        )

    # The source's bisector localization says that every carrier center other
    # than A1 equidistant from the chosen interior pair is itself in the same
    # strict cap.  Apply it both to arbitrary selected rows and, conditionally,
    # to source-indexed H shells.
    forbidden_bisector_centers = tuple(
        center for center in vertices
        if center != first_apex and center not in first_opposite_strict
    )
    for iq in first_opposite_strict:
        for iw in first_opposite_strict:
            if iq == iw:
                continue
            for center in forbidden_bisector_centers:
                cnf.add(
                    "full_partition_bisector_localization",
                    [-interior_q[iq], -interior_w[iw],
                     -eq_var(center, iq, iw)],
                )

    # Optional source-proved global-minimality overlay.  This is exactly the
    # common prefix of
    #
    #   exists_strictCap_collision_or_singletonCore_or_packedCore
    #
    # before its collision/singleton/packed classification.  It chooses a
    # fresh carrier center outside C union the Moser triangle and a nonempty
    # deletion set V inside that protected set.  The center has no K4 class
    # after deleting all of V, while returning any single s in V restores a
    # K4 class.  No classification of the restored classes is encoded.
    triangle_vertices = frozenset({first_apex, second_apex, surplus_vertex})
    if strict_cap_minimality_overlay:
        add_exactly_k(cnf, tuple(minimality_center.values()), 1, "minimality_center")
        cnf.add("minimality_deleted_nonempty", list(minimality_deleted.values()))
        for point in vertices:
            if point in triangle_vertices:
                cnf.add("minimality_center_outside_triangle", [-minimality_center[point]])
            cnf.add(
                "minimality_center_outside_exact_class",
                [-minimality_center[point], -in_class[point]],
            )
            if point not in triangle_vertices:
                cnf.add(
                    "minimality_deleted_subset_protected",
                    [-minimality_deleted[point], in_class[point]],
                )

        for center in vertices:
            targets = tuple(point for point in vertices if point != center)
            # No complete radius class has four surviving points in A \\ V.
            for four in itertools.combinations(targets, 4):
                anchor = four[0]
                cnf.add(
                    "minimality_no_K4_after_full_deletion",
                    [-minimality_center[center]]
                    + [minimality_deleted[point] for point in four]
                    + [-eq_var(center, anchor, point) for point in four[1:]],
                )

            # If s belongs to V, some three points outside V are co-radial
            # with s.  Returning s therefore restores four points at one
            # positive radius.  Explicit witnesses keep the encoding CNF and
            # make the semantic payload auditable.
            for source in targets:
                witnesses: list[int] = []
                others = tuple(point for point in targets if point != source)
                for triple in itertools.combinations(others, 3):
                    witness = cnf.var(
                        "minimality_restore_"
                        f"{source}_{center}_{triple[0]}_{triple[1]}_{triple[2]}"
                    )
                    witnesses.append(witness)
                    cnf.add("minimality_restore_witness_scope",
                            [-witness, minimality_center[center]])
                    cnf.add("minimality_restore_witness_scope",
                            [-witness, minimality_deleted[source]])
                    for point in triple:
                        cnf.add(
                            "minimality_restore_witness_survives",
                            [-witness, -minimality_deleted[point]],
                        )
                        cnf.add(
                            "minimality_restore_witness_coradial",
                            [-witness, eq_var(center, source, point)],
                        )
                cnf.add(
                    "minimality_restore_each_deleted_source",
                    [-minimality_center[center], -minimality_deleted[source], *witnesses],
                )

    # Sharper independently toggleable consequence of global minimality,
    # applied to exactly the source-provided strict-cap pair.  The nonempty
    # minimal blocking subdeletion V is therefore a singleton or the whole
    # pair.  This overlay uses only R.minimal, pair membership/distinctness,
    # and n=11 to leave a carrier point outside the pair.
    if pair_minimality_overlay:
        add_exactly_k(cnf, tuple(pair_minimality_center.values()), 1,
                      "pair_minimality_center")
        cnf.add("pair_minimality_deleted_nonempty",
                list(pair_minimality_deleted.values()))
        for point in vertices:
            cnf.add(
                "pair_minimality_center_outside_pair",
                [-pair_minimality_center[point], -interior_q[point]],
            )
            cnf.add(
                "pair_minimality_center_outside_pair",
                [-pair_minimality_center[point], -interior_w[point]],
            )
            cnf.add(
                "pair_minimality_deleted_subset_pair",
                [-pair_minimality_deleted[point], interior_q[point], interior_w[point]],
            )

        for center in vertices:
            targets = tuple(point for point in vertices if point != center)
            for four in itertools.combinations(targets, 4):
                anchor = four[0]
                cnf.add(
                    "pair_minimality_no_K4_after_full_deletion",
                    [-pair_minimality_center[center]]
                    + [pair_minimality_deleted[point] for point in four]
                    + [-eq_var(center, anchor, point) for point in four[1:]],
                )
            for source in (point for point in targets if point in first_opposite_strict):
                witnesses: list[int] = []
                others = tuple(point for point in targets if point != source)
                for triple in itertools.combinations(others, 3):
                    witness = cnf.var(
                        "pair_minimality_restore_"
                        f"{source}_{center}_{triple[0]}_{triple[1]}_{triple[2]}"
                    )
                    witnesses.append(witness)
                    cnf.add("pair_minimality_restore_witness_scope",
                            [-witness, pair_minimality_center[center]])
                    cnf.add("pair_minimality_restore_witness_scope",
                            [-witness, pair_minimality_deleted[source]])
                    for point in triple:
                        cnf.add(
                            "pair_minimality_restore_witness_survives",
                            [-witness, -pair_minimality_deleted[point]],
                        )
                        cnf.add(
                            "pair_minimality_restore_witness_coradial",
                            [-witness, eq_var(center, source, point)],
                        )
                cnf.add(
                    "pair_minimality_restore_each_deleted_source",
                    [-pair_minimality_center[center],
                     -pair_minimality_deleted[source], *witnesses],
                )

    # Kernel-checked extension-stable planar/U5 consumers only.  Every schema
    # is transported over every injective assignment of its roles.
    schemas, bank_metadata = load_planar_bank(planar_bank_path)
    raw_injections = 0
    checked_schemas = 0
    skipped_schemas = 0
    for k, memberships in schemas:
        if k > n:
            skipped_schemas += 1
            continue
        checked_schemas += 1
        for targets in itertools.permutations(vertices, k):
            raw_injections += 1
            cnf.add(
                "verified_planar_schema_cut",
                [-member[targets[center], targets[point]] for center, point in memberships],
            )

    # Exact rational Farkas-verified strict-Kalmanson order schemas.  Transport
    # uses only order-preserving embeddings and their cyclic-order reflection.
    kalmanson_schemas, kalmanson_metadata = load_kalmanson_bank(kalmanson_bank_path)
    kalmanson_embedding_count = 0
    kalmanson_checked_schema_count = 0
    kalmanson_skipped_schema_count = 0
    for k, schema in kalmanson_schemas:
        if k > n:
            kalmanson_skipped_schema_count += 1
            continue
        kalmanson_checked_schema_count += 1
        reflected = tuple(sorted((k - 1 - center, k - 1 - point)
                                 for center, point in schema))
        for targets in itertools.combinations(vertices, k):
            for oriented in {schema, reflected}:
                kalmanson_embedding_count += 1
                cnf.add(
                    "verified_kalmanson_order_schema_cut",
                    [-member[targets[center], targets[point]]
                    for center, point in oriented],
                )

    # Source-proved signed U5 selected-row incompatibilities.  A negative atom
    # is replayed literally as nonmembership; no complete-filter nonmembership
    # is inferred.
    u5_schemas, u5_metadata = load_u5_bank(u5_bank_path)
    u5_embedding_count = 0
    u5_checked_schema_count = 0
    u5_skipped_schema_count = 0
    for k, positive, negative in u5_schemas:
        if k > n:
            u5_skipped_schema_count += 1
            continue
        u5_checked_schema_count += 1
        for targets in itertools.permutations(vertices, k):
            u5_embedding_count += 1
            cnf.add(
                "verified_u5_signed_schema_cut",
                [-member[targets[center], targets[point]] for center, point in positive]
                + [member[targets[center], targets[point]] for center, point in negative],
            )

    encoded_source_projections = [
        "complete positive-radius equality partition at every carrier center with explicit false atoms",
        "one selected nonself four-row at every center",
        "full-class circle intersection, pair-center, and cyclic-alternation constraints",
        "selected-row strong connectivity",
        "fixed-point-free total blocker map with exact full critical class through each source",
        "critical no_qfree: every class after deleting the source has size at most three",
        "one selected-row completion equal to the H support at every used blocker center",
        "late-system first-apex blocker fiber exactly the four-class",
        "first-apex unique K4 class, selected row, and class-source critical supports",
        "first-apex class has at most one hit in each adjacent closed cap",
        "separate strict-cap and retained frontier pair roles",
        "retained frontier pair lies in class and outside surplus cap",
        "a separate second-apex radius-class four-row survives deletion of the retained pair",
        "strict-pair carrier bisector localization on the full equality partition",
        "verified extension-stable planar/U5 schema exclusions",
        "exact-Farkas-verified strict-Kalmanson order-schema exclusions",
        "source-proved signed U5 selected-row schema exclusions with literal negative atoms",
    ]
    if strict_cap_minimality_overlay:
        encoded_source_projections.append(
            "kernel-checked strict-cap minimal blocking-deletion common prefix: fresh center, "
            "nonempty protected V, no K4 after V, and K4 after returning every s in V"
        )
    if pair_minimality_overlay:
        encoded_source_projections.append(
            "source-valid strict-pair blocking-subdeletion: fresh center outside the pair, "
            "nonempty V within the pair, no K4 after V, and K4 after returning every s in V"
        )

    deliberately_omitted = [
        "all deletion-survival statements except the separate second-apex surviving class",
        "coordinates and nonlinear Euclidean distance realization",
        "MEC membership and nonobtuse support-triangle geometry",
        "alternative-MEC-triangle content of noM44 beyond the n=11 cap-size split",
        "full subset-minimality beyond selected-row strong connectivity",
    ]
    if strict_cap_minimality_overlay:
        deliberately_omitted[-1] = (
            "the collision/singleton-core/packed-core classification after the encoded "
            "kernel-checked minimal blocking-deletion common prefix"
        )

    metadata: dict[str, object] = {
        "encoding_schema": "p97-late-choice-exact-four-full-partition-v1",
        "epistemic_status": "EXACT_CNF_FOR_DOCUMENTED_FINITE_PROJECTION",
        "n": n,
        "opp1_card": opp1_card,
        "boundary_order": list(vertices),
        "first_apex": first_apex,
        "second_apex": second_apex,
        "surplus_vertex": surplus_vertex,
        "closed_caps": {
            "surplus": sorted(surplus_cap),
            "first_opposite": sorted(first_opposite_cap),
            "second_opposite": sorted(second_opposite_cap),
        },
        "first_opposite_strict": sorted(first_opposite_strict),
        "strict_cap_minimality_overlay": strict_cap_minimality_overlay,
        "strict_cap_minimality_source_theorem": (
            "Problem97.ATailUniqueFourGlobalCouplingScratch."
            "exists_strictCap_collision_or_singletonCore_or_packedCore"
            if strict_cap_minimality_overlay else None
        ),
        "pair_minimality_overlay": pair_minimality_overlay,
        "pair_minimality_source_theorem": (
            "Problem97.ATailGlobalMinimalDeletion."
            "exists_global_cardMinimal_blocking_subdeletion"
            if pair_minimality_overlay else None
        ),
        "pair_minimality_derivation_scope": (
            "Direct application to the distinct strict interior pair using only R.minimal, "
            "pair carrier membership, and a remaining carrier point."
            if pair_minimality_overlay else None
        ),
        "encoded_source_projections": encoded_source_projections,
        "deliberately_omitted_source_fields": deliberately_omitted,
        "scope_warning": (
            "SAT gives a source-valid survivor of this finite projection only; "
            "UNSAT would exclude this fixed n=11 cap-profile projection only and would not "
            "by itself prove the Lean leaf"
        ),
        **bank_metadata,
        "planar_checked_schema_count": checked_schemas,
        "planar_skipped_schema_count": skipped_schemas,
        "planar_raw_injection_count": raw_injections,
        **kalmanson_metadata,
        "kalmanson_checked_schema_count": kalmanson_checked_schema_count,
        "kalmanson_skipped_schema_count": kalmanson_skipped_schema_count,
        "kalmanson_embedding_count": kalmanson_embedding_count,
        **u5_metadata,
        "u5_checked_schema_count": u5_checked_schema_count,
        "u5_skipped_schema_count": u5_skipped_schema_count,
        "u5_embedding_count": u5_embedding_count,
        "variable_count": len(cnf.names) - 1,
        "clause_count": len(cnf.clauses),
        "clause_block_counts": dict(sorted(cnf.block_counts.items())),
    }
    return cnf, metadata


def parse_assignment(stdout: str) -> set[int]:
    assignment: set[int] = set()
    for line in stdout.splitlines():
        if not line.startswith("v "):
            continue
        for token in line.split()[1:]:
            literal = int(token)
            if literal:
                assignment.add(literal)
    return assignment


def assignment_value(assignment: set[int], variable: int) -> bool:
    if variable in assignment:
        return True
    if -variable in assignment:
        return False
    raise ValueError(f"solver model omits variable {variable}")


def check_cnf_model(cnf: CNF, assignment: set[int]) -> None:
    for index, clause in enumerate(cnf.clauses):
        if not any(assignment_value(assignment, abs(literal)) == (literal > 0)
                   for literal in clause):
            raise AssertionError(f"SAT assignment falsifies clause {index}: {clause}")


def decode_sat(cnf: CNF, assignment: set[int], metadata: dict[str, object]) -> dict[str, object]:
    check_cnf_model(cnf, assignment)
    n = int(metadata["n"])
    same_true: dict[str, list[list[int]]] = {}
    same_false: dict[str, list[list[int]]] = {}
    radius_classes: dict[str, list[list[int]]] = {}
    for center in range(n):
        targets = [point for point in range(n) if point != center]
        true_pairs: list[list[int]] = []
        false_pairs: list[list[int]] = []
        adjacency = {point: {point} for point in targets}
        for left, right in itertools.combinations(targets, 2):
            value = assignment_value(assignment, cnf.ids[f"eq_{center}_{left}_{right}"])
            (true_pairs if value else false_pairs).append([left, right])
            if value:
                adjacency[left].add(right)
                adjacency[right].add(left)
        unseen = set(targets)
        classes: list[list[int]] = []
        while unseen:
            start = min(unseen)
            component = set()
            frontier = [start]
            while frontier:
                point = frontier.pop()
                if point in component:
                    continue
                component.add(point)
                frontier.extend(adjacency[point] - component)
            unseen -= component
            classes.append(sorted(component))
        same_true[str(center)] = true_pairs
        same_false[str(center)] = false_pairs
        radius_classes[str(center)] = classes
    rows = {
        str(center): [point for point in range(n)
                      if assignment_value(assignment, cnf.ids[f"m_{center}_{point}"])]
        for center in range(n)
    }
    blockers: dict[str, int] = {}
    for source in range(n):
        chosen = [center for center in range(n)
                  if assignment_value(assignment, cnf.ids[f"b_{source}_{center}"])]
        if len(chosen) != 1:
            raise AssertionError(f"blocker row {source} is not one-hot: {chosen}")
        blockers[str(source)] = chosen[0]
    critical_supports = {
        str(source): [point for point in range(n)
                      if assignment_value(assignment, cnf.ids[f"h_{source}_{point}"])]
        for source in range(n)
    }
    second_deleted = [point for point in range(n)
                      if assignment_value(assignment, cnf.ids[f"second_deleted_{point}"])]
    exact_class = [point for point in range(n)
                   if assignment_value(assignment, cnf.ids[f"class_{point}"])]
    retained = {}
    for role in ("q", "w"):
        chosen = [point for point in range(n)
                  if assignment_value(assignment, cnf.ids[f"retained_{role}_{point}"])]
        if len(chosen) != 1:
            raise AssertionError(f"retained role {role} is not one-hot: {chosen}")
        retained[role] = chosen[0]
    interior = {}
    for role in ("q", "w"):
        chosen = [point for point in range(n)
                  if assignment_value(assignment, cnf.ids[f"interior_{role}_{point}"])]
        if len(chosen) != 1:
            raise AssertionError(f"interior role {role} is not one-hot: {chosen}")
        interior[role] = chosen[0]
    minimality_payload: dict[str, object] = {}
    if bool(metadata.get("strict_cap_minimality_overlay")):
        centers = [point for point in range(n)
                   if assignment_value(assignment, cnf.ids[f"minimality_center_{point}"])]
        if len(centers) != 1:
            raise AssertionError(f"minimality center is not one-hot: {centers}")
        deleted = [point for point in range(n)
                   if assignment_value(assignment, cnf.ids[f"minimality_deleted_{point}"])]
        if not deleted:
            raise AssertionError("minimality deletion set is empty")
        minimality_payload = {
            "strict_cap_minimality_witness": {
                "center": centers[0],
                "deleted_set": deleted,
            }
        }
    pair_minimality_payload: dict[str, object] = {}
    if bool(metadata.get("pair_minimality_overlay")):
        centers = [point for point in range(n)
                   if assignment_value(
                       assignment, cnf.ids[f"pair_minimality_center_{point}"]
                   )]
        if len(centers) != 1:
            raise AssertionError(f"pair minimality center is not one-hot: {centers}")
        deleted = [point for point in range(n)
                   if assignment_value(
                       assignment, cnf.ids[f"pair_minimality_deleted_{point}"]
                   )]
        if not deleted:
            raise AssertionError("pair minimality deletion set is empty")
        pair_minimality_payload = {
            "pair_minimality_witness": {
                "center": centers[0],
                "deleted_set": deleted,
            }
        }
    return {
        "rows": rows,
        "radius_classes": radius_classes,
        "same_distance_true": same_true,
        "same_distance_false": same_false,
        "blockers": blockers,
        "critical_supports": critical_supports,
        "second_apex_double_deletion_row": second_deleted,
        "first_apex_exact_class": exact_class,
        "retained_frontier_pair": retained,
        "strict_cap_pair": interior,
        "cnf_model_checked": True,
        **minimality_payload,
        **pair_minimality_payload,
    }


def solve(cnf: CNF, cnf_path: Path, metadata: dict[str, object], timeout: int, cadical: str) -> tuple[dict[str, object], str]:
    command = [cadical, "-t", str(timeout), str(cnf_path)]
    started = time.monotonic()
    completed = subprocess.run(command, capture_output=True, text=True,
                               timeout=timeout + 30, check=False)
    elapsed = time.monotonic() - started
    status = "SAT" if completed.returncode == 10 else "UNSAT" if completed.returncode == 20 else "UNKNOWN"
    result: dict[str, object] = {
        "solver": "CaDiCaL",
        "solver_command": command,
        "solver_returncode": completed.returncode,
        "solver_status": status,
        "solver_elapsed_seconds": elapsed,
        "timeout_seconds": timeout,
    }
    if status == "SAT":
        result.update(decode_sat(cnf, parse_assignment(completed.stdout), metadata))
    return result, completed.stdout + completed.stderr


def clause_value(clause: tuple[int, ...], values: dict[int, bool]) -> bool:
    return any(values[abs(literal)] == (literal > 0) for literal in clause)


def self_test() -> None:
    # Exhaustive cardinality helper test, independent of a SAT solver.
    for width in range(1, 8):
        for k in range(width + 1):
            cnf = CNF()
            variables = tuple(cnf.var(f"x_{i}") for i in range(width))
            add_exactly_k(cnf, variables, k, "test")
            for mask in range(1 << width):
                values = {i + 1: bool(mask & (1 << i)) for i in range(width)}
                accepted = all(clause_value(clause, values) for clause in cnf.clauses)
                if accepted != (mask.bit_count() == k):
                    raise AssertionError((width, k, mask, accepted))

    # Smoke-test the planar cut direction: the all-positive schema fixture must
    # falsify its generated all-negative clause, while removing one incidence
    # must satisfy it.
    fixture = CNF()
    variables = tuple(fixture.var(f"m_{i}") for i in range(12))
    fixture.add("planar", [-variable for variable in variables])
    all_true = {variable: True for variable in variables}
    if clause_value(fixture.clauses[0], all_true):
        raise AssertionError("planar forbidden-pattern clause has the wrong polarity")
    all_true[variables[0]] = False
    if not clause_value(fixture.clauses[0], all_true):
        raise AssertionError("planar forbidden-pattern clause rejects a missing incidence")

    # A signed cut is false exactly when all positive atoms hold and all
    # negative atoms fail.
    signed = CNF()
    positive = signed.var("positive")
    negative = signed.var("negative")
    signed.add("signed", [-positive, negative])
    if clause_value(signed.clauses[0], {positive: True, negative: False}):
        raise AssertionError("signed cut accepts its forbidden assignment")
    if not clause_value(signed.clauses[0], {positive: True, negative: True}):
        raise AssertionError("signed cut rejects a failed negative antecedent")

    # Exhaustively check the three-clause equivalence encoding on four points.
    pairs = tuple(itertools.combinations(range(4), 2))
    for mask in range(1 << len(pairs)):
        relation = {pair for index, pair in enumerate(pairs) if mask & (1 << index)}
        clauses_hold = True
        for left, middle, right in itertools.combinations(range(4), 3):
            lm = (left, middle) in relation
            lr = (left, right) in relation
            mr = (middle, right) in relation
            clauses_hold &= (not lm or not mr or lr)
            clauses_hold &= (not lm or not lr or mr)
            clauses_hold &= (not lr or not mr or lm)
        transitive = all(
            not ({tuple(sorted((a, b))), tuple(sorted((b, c)))} <= relation)
            or tuple(sorted((a, c))) in relation
            for a in range(4) for b in range(4) for c in range(4)
            if len({a, b, c}) == 3
        )
        if clauses_hold != transitive:
            raise AssertionError((mask, clauses_hold, transitive))
    print("SELF_TEST_OK: cardinality, equality-partition, and schema-cut encodings")


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--n", type=int, default=11)
    parser.add_argument("--opp1-card", type=int, choices=(4, 5))
    parser.add_argument("--planar-bank", required=False, type=Path)
    parser.add_argument("--kalmanson-bank", required=False, type=Path)
    parser.add_argument("--u5-bank", required=False, type=Path)
    parser.add_argument("--cnf", type=Path)
    parser.add_argument("--result", type=Path)
    parser.add_argument("--solver-log", type=Path)
    parser.add_argument("--timeout-seconds", type=int, default=300)
    parser.add_argument("--cadical", default="cadical")
    parser.add_argument("--encode-only", action="store_true")
    parser.add_argument("--self-test", action="store_true")
    parser.add_argument("--strict-cap-minimality-overlay", action="store_true")
    parser.add_argument("--pair-minimality-overlay", action="store_true")
    args = parser.parse_args()
    if args.self_test:
        self_test()
        return 0
    if (args.opp1_card is None or args.planar_bank is None or args.kalmanson_bank is None
            or args.u5_bank is None
            or args.cnf is None or args.result is None):
        parser.error("--opp1-card, all three bank paths, --cnf, and --result are required")
    if args.timeout_seconds <= 0:
        parser.error("--timeout-seconds must be positive")

    cnf, metadata = encode(
        args.n, args.opp1_card, args.planar_bank, args.kalmanson_bank, args.u5_bank,
        args.strict_cap_minimality_overlay,
        args.pair_minimality_overlay,
    )
    cnf.write_dimacs(args.cnf, metadata)
    result: dict[str, object] = {**metadata, "cnf_path": str(args.cnf), "cnf_sha256": sha256(args.cnf)}
    if args.encode_only:
        result["solver_status"] = "NOT_RUN"
    else:
        solver_result, solver_log = solve(cnf, args.cnf, metadata, args.timeout_seconds, args.cadical)
        result.update(solver_result)
        if args.solver_log is not None:
            args.solver_log.parent.mkdir(parents=True, exist_ok=True)
            args.solver_log.write_text(solver_log, encoding="utf-8")
    args.result.parent.mkdir(parents=True, exist_ok=True)
    args.result.write_text(json.dumps(result, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    print(json.dumps(result, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
