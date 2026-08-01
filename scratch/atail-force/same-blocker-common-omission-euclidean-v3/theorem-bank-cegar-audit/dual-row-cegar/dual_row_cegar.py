#!/usr/bin/env python3
"""Combined collision/outside exact-row CEGAR for the n=17 live branch."""

from __future__ import annotations

import argparse
import itertools
import json
import sys
import time
from dataclasses import dataclass
from pathlib import Path


HERE = Path(__file__).resolve().parent
LANE = HERE.parent.parent
sys.path.insert(0, str(LANE))

import incidence_cegar  # noqa: E402


FAMILIES = {
    "first": "false_of_five_ccw_two_selected_rows_cyclicShift",
    "second": "false_of_five_ccw_second_two_selected_rows_cyclicShift",
    "reversed_second": "false_of_five_ccw_reversed_second_two_selected_rows_cyclicShift",
}

KALMANSON_FAMILIES = {
    "kalmanson_013_412_523": {
        "theorem": "false_of_six_ccw_three_shell_equalities_013_412_523",
        "arity": 6,
        "equalities": ((0, 1, 3), (4, 1, 2), (5, 2, 3)),
    },
    "kalmanson_012_325_415": {
        "theorem": "false_of_six_ccw_three_shell_equalities_012_325_415",
        "arity": 6,
        "equalities": ((0, 1, 2), (3, 2, 5), (4, 1, 5)),
    },
    "kalmanson_012_124_314": {
        "theorem": "false_of_five_ccw_three_shell_equalities_012_124_314",
        "arity": 5,
        "equalities": ((0, 1, 2), (1, 2, 4), (3, 1, 4)),
    },
    "kalmanson_013_235_415": {
        "theorem": "false_of_six_ccw_three_shell_equalities_013_235_415",
        "arity": 6,
        "equalities": ((0, 1, 3), (2, 3, 5), (4, 1, 5)),
    },
}

SIX_POINT_ROW_FAMILIES = {
    "six_sparse_two_selected_rows": {
        "theorem": "false_of_six_ccw_two_selected_rows",
        "arity": 6,
        "rows": ((0, (1, 3, 5)), (2, (1, 3, 4))),
    },
}

LINEAR_ROW_FAMILIES = {
    "five_kalmanson_three_selected_rows": {
        "theorem": "Problem97.CapCrossingKalmanson.false_of_selected_rows_in_five_ccw_order",
        "arity": 5,
        "rows": ((2, (0, 3)), (0, (3, 4)), (1, (4, 0))),
    },
    "five_circle_isosceles_two_selected_rows": {
        "theorem": "Problem97.Census554.FivePointCircleIsoscelesOrderBridge.false_of_two_selected_rows_of_ccw",
        "arity": 5,
        "rows": ((0, (1, 3, 4)), (4, (2, 3))),
    },
    **SIX_POINT_ROW_FAMILIES,
}

RAW_EQUALITY_FAMILIES = {
    "five_kalmanson_three_shell_equalities": {
        "theorem": "Problem97.CapCrossingKalmanson.false_of_five_ccw_three_shell_equalities",
        "arity": 5,
        "equalities": ((2, 0, 3), (0, 3, 4), (1, 4, 0)),
    },
    "four_endpoint_centers_bisect_middle_pair": {
        "theorem": "Problem97.CapCrossingKalmanson.false_of_four_ccw_endpoint_centers_bisect_middle_pair",
        "arity": 4,
        "equalities": ((0, 1, 2), (3, 1, 2)),
    },
    "four_middle_centers_bisect_endpoint_pair": {
        "theorem": "Problem97.CapCrossingKalmanson.false_of_four_ccw_middle_centers_bisect_endpoint_pair",
        "arity": 4,
        "equalities": ((1, 0, 3), (2, 0, 3)),
    },
    "five_second_three_row_equalities": {
        "theorem": "Problem97.FivePointEuclideanObstruction.false_of_five_ccw_second_three_row_equalities",
        "arity": 5,
        "equalities": ((3, 0, 2), (3, 2, 4), (4, 0, 1)),
    },
    "five_direct_three_row_equalities": {
        "theorem": "Problem97.FivePointEuclideanObstruction.false_of_five_ccw_three_row_equalities",
        "arity": 5,
        "equalities": ((1, 0, 4), (2, 0, 1), (2, 0, 3)),
    },
}

SIX_POINT_EQUALITY_FAMILIES = {
    "six_sparse_row_equalities": {
        "theorem": "Problem97.SixPointSparseEuclideanObstruction.false_of_six_ccw_row_equalities",
        "arity": 6,
        "equalities": ((0, 1, 3), (0, 1, 5), (2, 1, 3), (2, 1, 4)),
    },
    "six_main_row_equalities": {
        "theorem": "Problem97.SixPointEuclideanObstruction.false_of_six_ccw_row_equalities",
        "arity": 6,
        "equalities": ((0, 1, 5), (0, 3, 5), (3, 0, 1), (2, 1, 4), (2, 3, 4)),
    },
    "six_mirror_interleaving_equalities": {
        "theorem": "Problem97.SixPointEuclideanObstruction.false_of_six_ccw_mirror_interleaving_row_equalities",
        "arity": 6,
        "equalities": ((0, 1, 5), (0, 2, 4), (3, 0, 2), (3, 0, 4), (4, 1, 5)),
    },
    "six_two_triple_row_equalities": {
        "theorem": "Problem97.TwoTripleRowSixPointEuclideanObstruction.false_of_six_ccw_two_triple_row_equalities",
        "arity": 6,
        "equalities": ((1, 0, 2), (1, 0, 3), (5, 0, 3), (5, 0, 4)),
    },
}

ALL_THEOREM_FAMILIES = tuple(
    dict.fromkeys(
        (
            *FAMILIES,
            *KALMANSON_FAMILIES,
            *LINEAR_ROW_FAMILIES,
            *RAW_EQUALITY_FAMILIES,
            *SIX_POINT_EQUALITY_FAMILIES,
        )
    )
)


def rotations(points):
    for shift in range(len(points)):
        yield points[shift:] + points[:shift]


def cyclic_guard(z3, positions, points):
    return z3.Or(*[
        z3.And(*(positions[x] < positions[y] for x, y in zip(order, order[1:])))
        for order in rotations(points)
    ])


def linear_guard(z3, positions, points):
    return z3.And(*(positions[x] < positions[y] for x, y in zip(points, points[1:])))


def between_expr(z3, positions, c, d, x):
    return z3.Or(
        z3.And(positions[c] < positions[x], positions[x] < positions[d]),
        z3.And(positions[d] < positions[x], positions[x] < positions[c]),
    )


def pattern_atoms(family, points):
    a, b, c, d, e = points
    if family == "first":
        return b, (a, e), c, (a, b, d)
    if family == "second":
        return d, (a, c, e), e, (a, b)
    if family == "reversed_second":
        return b, (a, c, e), a, (d, e)
    raise AssertionError(family)


@dataclass(frozen=True)
class RowObject:
    name: str
    layer: str
    role: str
    fixed_center: int | None = None


@dataclass(frozen=True)
class CandidateMatchContext:
    """Decoded model data shared by every matcher for one candidate."""

    rows: tuple[RowObject, ...]
    centers: dict[RowObject, int]
    supports: dict[RowObject, set[int]]
    positions: dict[int, int]
    ordered: tuple[int, ...]
    equality_truth: dict[tuple[int, int, int], bool]

    @classmethod
    def from_model(cls, audit, model):
        centers = {row: audit.row_center(model, row) for row in audit.row_objects}
        supports = {row: audit.row_support(model, row) for row in audit.row_objects}
        positions = {
            vertex: model.eval(audit.position[vertex], model_completion=True).as_long()
            for vertex in audit.vs
        }
        representatives = []
        seen = set()
        for row in audit.row_objects:
            signature = (centers[row], frozenset(supports[row]))
            if signature not in seen:
                seen.add(signature)
                representatives.append(row)
        equality_truth = {
            key: audit.truth(model, atom)
            for key, atom in audit.eq.items()
        }
        return cls(
            rows=tuple(representatives),
            centers=centers,
            supports=supports,
            positions=positions,
            ordered=tuple(sorted(audit.vs, key=positions.__getitem__)),
            equality_truth=equality_truth,
        )

    def equality_holds(self, center, left, right):
        if left == right:
            return True
        if center in {left, right}:
            return False
        return self.equality_truth[center, min(left, right), max(left, right)]


class DualAudit(incidence_cegar.Audit):
    def __init__(self):
        super().__init__(17, (6, 8, 6), True, False, True)
        z3 = self.z3
        self.outside_roles = ("common", "opposite", "apex1", "apex2", "apex3")
        self.outside = {
            (role, p): z3.Bool(f"outside_{role}_{p}")
            for role in self.outside_roles for p in self.vs
        }
        # Ordered (Q.source, Q.otherOutsidePoint, deleted-index).
        self.outside_choices = {
            (u, v, deleted): z3.Bool(f"outside_choice_{u}_{v}_{deleted}")
            for u, v in itertools.permutations(sorted(self.outside_first), 2)
            for deleted in (0, 1)
        }
        self.exactly("outside_choice_exact", self.outside_choices.values(), 1)
        self._encode_outside_packet()
        self._encode_collision_actual_blocker_distinctness()
        # The metric theorems may mix any canonical K4 row with either exact-row
        # packet.  Earlier runs searched only the ten packet aliases and thereby
        # missed contradictions using an unconditional canonical row.
        self.row_objects = tuple(
            [RowObject(f"base.{self.names[c]}", "base", self.names[c], c) for c in self.vs]
            + [RowObject(f"collision.{r}", "collision", r) for r in self.outside_roles]
            + [RowObject(f"outside.{r}", "outside", r) for r in self.outside_roles]
        )
        self.packet_cuts: dict[tuple, object] = {}

    def center_is(self, row: RowObject, c: int):
        z3 = self.z3
        if row.layer == "base":
            return z3.BoolVal(c == row.fixed_center)
        if row.role == "apex1":
            return z3.BoolVal(c == self.a1)
        if row.role == "apex2":
            return z3.BoolVal(c == self.a2)
        if row.role == "apex3":
            return z3.BoolVal(c == self.a3)
        q1 = self.pair_q[0]
        if row.role == "common":
            return self.b[q1, c]
        if row.layer == "outside":
            return self.b[self.pair_r[0], c]
        p_arms = [self.deletion_arm_selected[label] for label, _, opp in self.deletion_arms if opp == self.pair_r[0]]
        r_arms = [self.deletion_arm_selected[label] for label, _, opp in self.deletion_arms if opp == self.pair_p[0]]
        return z3.Or(
            z3.And(z3.Or(*p_arms), self.b[self.pair_r[0], c]),
            z3.And(z3.Or(*r_arms), self.b[self.pair_p[0], c]),
        )

    def member(self, row: RowObject, p: int):
        if row.layer == "base":
            assert row.fixed_center is not None
            return self.m[row.fixed_center, p]
        if row.layer == "outside":
            return self.outside[row.role, p]
        return self.z3.Or(*[
            self.z3.And(self.center_is(row, c), self.m[c, p]) for c in self.vs
        ])

    def _encode_outside_packet(self):
        z3 = self.z3
        p1, _ = self.pair_p
        for (u, v, deleted_index), selected in self.outside_choices.items():
            deleted = (u, v)[deleted_index]
            # Q.source shares the first collision blocker; both named points
            # are exactly the two off-cap members of that canonical shell.
            for c in self.vs:
                self.add("outside_choice_source_blocker", z3.Or(z3.Not(selected), self.b[u, c] == self.b[p1, c]))
                self.add("outside_choice_pair_in_first_shell", z3.Or(z3.Not(selected), z3.Not(self.b[p1, c]), self.m[c, u]))
                self.add("outside_choice_pair_in_first_shell", z3.Or(z3.Not(selected), z3.Not(self.b[p1, c]), self.m[c, v]))
            for role in self.outside_roles:
                self.add("outside_deleted_omission", z3.Or(z3.Not(selected), z3.Not(self.outside[role, deleted])))
                for c in self.vs:
                    self.add(
                        "outside_actual_blocker_distinct",
                        z3.Or(z3.Not(selected), z3.Not(self.b[deleted, c]), z3.Not(self._outside_center_is(role, c))),
                    )

        for role in self.outside_roles:
            self.exactly("outside_row_exact_four", (self.outside[role, p] for p in self.vs), 4)
            for c in self.vs:
                center_guard = self._outside_center_is(role, c)
                self.add("outside_row_excludes_center", z3.Or(z3.Not(center_guard), z3.Not(self.outside[role, c])))
                for x, y in itertools.combinations((p for p in self.vs if p != c), 2):
                    self.add(
                        "outside_row_coradial",
                        z3.Or(z3.Not(center_guard), z3.Not(self.outside[role, x]), z3.Not(self.outside[role, y]), self.E(c, x, y)),
                    )

        # Only actual-blocker rows normalize to canonical selected shells.
        for role, source in (("common", self.pair_q[0]), ("opposite", self.pair_r[0])):
            for c in self.vs:
                for p in self.vs:
                    self.add(
                        "outside_blocker_row_canonical",
                        z3.Or(z3.Not(self.b[source, c]), self.outside[role, p] == self.m[c, p]),
                    )

        # Rich-apex witnesses are not identified merely because their named
        # centers agree across packets.  If an apex happens to be the actual
        # blocker of some carrier source, however, the general normalization
        # theorem applies and forces its row to the canonical shell too.
        for role in ("apex1", "apex2", "apex3"):
            center = {"apex1": self.a1, "apex2": self.a2, "apex3": self.a3}[role]
            for source in self.vs:
                for p in self.vs:
                    self.add(
                        "outside_incidental_blocker_canonical",
                        z3.Or(z3.Not(self.b[source, center]), self.outside[role, p] == self.m[center, p]),
                    )

    def _outside_center_is(self, role: str, c: int):
        if role == "apex1":
            return self.z3.BoolVal(c == self.a1)
        if role == "apex2":
            return self.z3.BoolVal(c == self.a2)
        if role == "apex3":
            return self.z3.BoolVal(c == self.a3)
        source = self.pair_q[0] if role == "common" else self.pair_r[0]
        return self.b[source, c]

    def _encode_collision_actual_blocker_distinctness(self):
        z3 = self.z3
        for label, deleted, opposite_source in self.deletion_arms:
            selected = self.deletion_arm_selected[label]
            sources = (self.pair_q[0], opposite_source)
            for source in sources:
                for c in self.vs:
                    self.add(
                        "collision_actual_blocker_distinct",
                        z3.Or(z3.Not(selected), z3.Not(self.b[deleted, c]), z3.Not(self.b[source, c])),
                    )
            for apex in (self.a1, self.a2, self.a3):
                self.add("collision_actual_blocker_distinct", z3.Or(z3.Not(selected), z3.Not(self.b[deleted, apex])))

    def row_center(self, model, row: RowObject):
        centers = [c for c in self.vs if self.truth(model, self.center_is(row, c))]
        if len(centers) != 1:
            raise AssertionError(("row-center", row.name, centers))
        return centers[0]

    def row_support(self, model, row: RowObject):
        return {p for p in self.vs if self.truth(model, self.member(row, p))}

    def add_guarded_cut(self, key, atoms):
        if key in self.packet_cuts:
            return False
        formula = self.z3.Or(*(self.z3.Not(atom) for atom in atoms))
        self.add(f"dual_cut_{key[0]}", formula)
        self.packet_cuts[key] = formula
        return True


def model_rows(audit, model, context=None):
    if context is not None:
        return context.centers, context.supports, context.positions
    centers = {row: audit.row_center(model, row) for row in audit.row_objects}
    supports = {row: audit.row_support(model, row) for row in audit.row_objects}
    positions = {v: model.eval(audit.position[v], model_completion=True).as_long() for v in audit.vs}
    return centers, supports, positions


def unique_model_rows(audit, model, context=None):
    """Keep one provider for each realized (center, support) selected row."""
    if context is not None:
        return context.rows, context.centers, context.supports, context.positions
    centers, supports, positions = model_rows(audit, model)
    representatives = []
    seen = set()
    for row in audit.row_objects:
        signature = (centers[row], frozenset(supports[row]))
        if signature not in seen:
            seen.add(signature)
            representatives.append(row)
    return tuple(representatives), centers, supports, positions


def row_exists_expr(audit, center, points):
    """Some available selected row has this center and contains all points."""
    z3 = audit.z3
    return z3.Or(*(
        z3.And(
            audit.center_is(row, center),
            *(audit.member(row, point) for point in points),
        )
        for row in audit.row_objects
    ))


def structural_violations(audit, model, context=None):
    rows, centers, supports, positions = unique_model_rows(audit, model, context)
    violations = []
    for left, right in itertools.combinations(rows, 2):
        c, d = centers[left], centers[right]
        if c == d:
            continue
        common = sorted(supports[left] & supports[right])
        for triple in itertools.combinations(common, 3):
            violations.append(("circle", left, right, (c, d), triple))
        for x, y in itertools.combinations(common, 2):
            between_x = (positions[c] < positions[x] < positions[d]) or (positions[d] < positions[x] < positions[c])
            between_y = (positions[c] < positions[y] < positions[d]) or (positions[d] < positions[y] < positions[c])
            if between_x == between_y:
                violations.append(("shared_pair", left, right, (c, d), (x, y)))
    for first, second, third in itertools.combinations(rows, 3):
        cs = (centers[first], centers[second], centers[third])
        if len(set(cs)) != 3:
            continue
        common = sorted(supports[first] & supports[second] & supports[third])
        for pair in itertools.combinations(common, 2):
            violations.append(("bisector", first, second, third, cs, pair))
    return violations


def add_structural_violation(audit, violation):
    kind = violation[0]
    if kind in {"circle", "shared_pair"}:
        _, _left, _right, (c, d), points = violation
        c, d = sorted((c, d))
        atoms = [row_exists_expr(audit, c, points), row_exists_expr(audit, d, points)]
        if kind == "shared_pair":
            bad = audit.z3.Not(
                audit.z3.Xor(
                    between_expr(audit.z3, audit.position, c, d, points[0]),
                    between_expr(audit.z3, audit.position, c, d, points[1]),
                )
            )
            atoms.append(bad)
        key = (kind, c, d, *points)
        return audit.add_guarded_cut(key, atoms)
    _, _first, _second, _third, cs, pair = violation
    cs = tuple(sorted(cs))
    atoms = [row_exists_expr(audit, c, pair) for c in cs]
    key = ("bisector", *cs, *pair)
    return audit.add_guarded_cut(key, atoms)


def theorem_matches(audit, model, context=None):
    rows, centers, supports, positions = unique_model_rows(audit, model, context)
    by_center = {
        c: tuple(row for row in rows if centers[row] == c)
        for c in audit.vs
    }
    ordered = context.ordered if context is not None else tuple(sorted(audit.vs, key=positions.__getitem__))
    matches = []
    for subset in itertools.combinations(ordered, 5):
        for points in rotations(subset):
            for family in FAMILIES:
                c1, pts1, c2, pts2 = pattern_atoms(family, points)
                has_first = any(set(pts1).issubset(supports[row]) for row in by_center[c1])
                has_second = any(set(pts2).issubset(supports[row]) for row in by_center[c2])
                if has_first and has_second:
                    matches.append((family, points, c1, pts1, c2, pts2))
    return matches


def kalmanson_matches(audit, model, context=None):
    return ordered_equality_matches(audit, model, KALMANSON_FAMILIES, context)


def six_point_equality_matches(audit, model, context=None):
    return ordered_equality_matches(audit, model, SIX_POINT_EQUALITY_FAMILIES, context)


def raw_equality_matches(audit, model, context=None):
    return ordered_equality_matches(audit, model, RAW_EQUALITY_FAMILIES, context)


def ordered_equality_matches(audit, model, families, context=None):
    if context is None:
        context = CandidateMatchContext.from_model(audit, model)
    ordered = context.ordered
    matches = []
    for family, schema in families.items():
        for points in itertools.combinations(ordered, schema["arity"]):
            requirements = tuple(
                (points[center], (points[left], points[right]))
                for center, left, right in schema["equalities"]
            )
            if all(context.equality_holds(center, *endpoints) for center, endpoints in requirements):
                matches.append((family, points, requirements))
    return matches


def _ordered_equality_matches_reference(audit, model, families):
    """Pre-optimization matcher retained as a semantic benchmark oracle."""
    positions = {
        vertex: model.eval(audit.position[vertex], model_completion=True).as_long()
        for vertex in audit.vs
    }
    ordered = tuple(sorted(audit.vs, key=positions.__getitem__))
    matches = []
    for family, schema in families.items():
        for points in itertools.combinations(ordered, schema["arity"]):
            requirements = tuple(
                (points[center], (points[left], points[right]))
                for center, left, right in schema["equalities"]
            )
            if all(
                audit.truth(model, audit.E(center, endpoints[0], endpoints[1]))
                for center, endpoints in requirements
            ):
                matches.append((family, points, requirements))
    return matches


def linear_row_matches(audit, model, context=None):
    rows, centers, supports, positions = unique_model_rows(audit, model, context)
    ordered = context.ordered if context is not None else tuple(sorted(audit.vs, key=positions.__getitem__))
    matches = []
    for family, schema in LINEAR_ROW_FAMILIES.items():
        for points in itertools.combinations(ordered, schema["arity"]):
            requirements = tuple(
                (points[center], tuple(points[index] for index in support))
                for center, support in schema["rows"]
            )
            providers = []
            for center, support in requirements:
                providers.append(tuple(
                    row for row in rows
                    if centers[row] == center and set(support).issubset(supports[row])
                ))
            if all(providers):
                matches.append((family, points, requirements))
    return matches


def add_theorem_match(audit, match):
    family, points, c1, pts1, c2, pts2 = match
    atoms = [
        cyclic_guard(audit.z3, audit.position, points),
        row_exists_expr(audit, c1, pts1),
        row_exists_expr(audit, c2, pts2),
    ]
    key = ("theorem", family, *points)
    return audit.add_guarded_cut(key, atoms)


def add_kalmanson_match(audit, match):
    family, points, requirements = match
    atoms = [linear_guard(audit.z3, audit.position, points)]
    atoms.extend(
        audit.E(center, endpoints[0], endpoints[1])
        for center, endpoints in requirements
    )
    key = ("theorem", family, *points)
    return audit.add_guarded_cut(key, atoms)


def add_linear_row_match(audit, match):
    family, points, requirements = match
    atoms = [linear_guard(audit.z3, audit.position, points)]
    atoms.extend(row_exists_expr(audit, center, support) for center, support in requirements)
    key = ("theorem", family, *points)
    return audit.add_guarded_cut(key, atoms)


def guard_self_checks():
    checks = {}
    points = tuple(range(5))
    rotations_set = set(rotations(points))
    for family, theorem in FAMILIES.items():
        accepted = []
        for linear in itertools.permutations(points):
            position = {v: i for i, v in enumerate(linear)}
            holds = any(all(position[x] < position[y] for x, y in zip(order, order[1:])) for order in rotations(points))
            if holds:
                accepted.append(linear)
        if set(accepted) != rotations_set or len(accepted) != 5:
            raise AssertionError((family, accepted))
        c1, pts1, c2, pts2 = pattern_atoms(family, points)
        checks[family] = {
            "theorem": theorem,
            "linear_orders_checked": 120,
            "direction_preserving_rotations_rejected": 5,
            "reflected_orders_admitted_by_guard": 0,
            "row_centers": [c1, c2],
            "positive_membership_arities": [len(pts1), len(pts2)],
        }
    equality_families = {
        **KALMANSON_FAMILIES,
        **RAW_EQUALITY_FAMILIES,
        **SIX_POINT_EQUALITY_FAMILIES,
    }
    for family, schema in equality_families.items():
        points = tuple(range(schema["arity"]))
        accepted = []
        for order in itertools.permutations(points):
            position = {v: i for i, v in enumerate(order)}
            if all(position[x] < position[y] for x, y in zip(points, points[1:])):
                accepted.append(order)
        if accepted != [points]:
            raise AssertionError((family, accepted))
        checks[family] = {
            "theorem": schema["theorem"],
            "linear_orders_checked": len(tuple(itertools.permutations(points))),
            "linear_orders_admitted_by_guard": 1,
            "cyclic_recut": False,
            "equality_count": len(schema["equalities"]),
        }
    for family, schema in LINEAR_ROW_FAMILIES.items():
        points = tuple(range(schema["arity"]))
        accepted = []
        for order in itertools.permutations(points):
            position = {v: i for i, v in enumerate(order)}
            if all(position[x] < position[y] for x, y in zip(points, points[1:])):
                accepted.append(order)
        if accepted != [points]:
            raise AssertionError((family, accepted))
        checks[family] = {
            "theorem": schema["theorem"],
            "linear_orders_checked": len(tuple(itertools.permutations(points))),
            "linear_orders_admitted_by_guard": 1,
            "cyclic_recut": False,
            "positive_membership_arities": [len(support) for _, support in schema["rows"]],
        }
    return checks


def selected_outside_choice(audit, model):
    choices = [key for key, atom in audit.outside_choices.items() if audit.truth(model, atom)]
    if len(choices) != 1:
        raise AssertionError(("outside-choice", choices))
    return choices[0]


def named_radius_classes(audit, model, context=None):
    """Serialize the complete raw radius partition, not only selected rows."""
    holds = (
        context.equality_holds
        if context is not None
        else lambda center, left, right: audit.truth(model, audit.E(center, left, right))
    )
    classes_by_center = {}
    for center in audit.vs:
        remaining = set(audit.vs) - {center}
        classes = []
        while remaining:
            anchor = min(remaining)
            radius_class = {
                point
                for point in remaining
                if point == anchor or holds(center, anchor, point)
            }
            if not radius_class:
                raise AssertionError(("empty-radius-class", center, anchor))
            if any(
                not holds(center, left, right)
                for left, right in itertools.combinations(radius_class, 2)
            ):
                raise AssertionError(("non-clique-radius-class", center, radius_class))
            classes.append([audit.names[point] for point in sorted(radius_class)])
            remaining -= radius_class
        classes_by_center[audit.names[center]] = classes
    return classes_by_center


def independent_replay(audit, model, context=None):
    if context is None:
        context = CandidateMatchContext.from_model(audit, model)
    base = audit.replay(model)
    centers, supports, positions = model_rows(audit, model, context)
    u, v, deleted_index = selected_outside_choice(audit, model)
    deleted = (u, v)[deleted_index]
    blockers = {s: audit.blocker(model, s) for s in audit.vs}
    if blockers[u] != blockers[audit.pair_p[0]]:
        raise AssertionError("outside source blocker")
    first_shell = audit.row(model, blockers[audit.pair_p[0]])
    if not {u, v}.issubset(first_shell):
        raise AssertionError("outside pair shell")
    for row in audit.row_objects:
        support = supports[row]
        center = centers[row]
        if len(support) != 4 or center in support:
            raise AssertionError(("packet-row", row.name, center, support))
        if any(not context.equality_holds(center, x, y) for x, y in itertools.combinations(support, 2)):
            raise AssertionError(("packet-coradial", row.name))
    for row in audit.row_objects:
        if row.layer == "outside" and deleted in supports[row]:
            raise AssertionError(("outside-deleted", row.name, deleted))
    if structural_violations(audit, model, context):
        raise AssertionError("unreplayed structural violation")
    if theorem_matches(audit, model, context):
        raise AssertionError("unreplayed theorem match")
    if kalmanson_matches(audit, model, context):
        raise AssertionError("unreplayed Kalmanson theorem match")
    if linear_row_matches(audit, model, context):
        raise AssertionError("unreplayed linear-order selected-row theorem match")
    if six_point_equality_matches(audit, model, context):
        raise AssertionError("unreplayed six-point equality theorem match")
    if raw_equality_matches(audit, model, context):
        raise AssertionError("unreplayed raw equality theorem match")
    assertions = tuple(audit.solver.assertions())
    failed = [i for i, formula in enumerate(assertions) if not audit.truth(model, formula)]
    if failed:
        raise AssertionError(("assertion-replay", failed[:10]))
    return {
        "base_semantic_replay": base,
        "status": "PASS",
        "outside_choice": {
            "Q.source": audit.names[u],
            "Q.otherOutsidePoint": audit.names[v],
            "deleted": audit.names[deleted],
        },
        "row_centers": {row.name: audit.names[centers[row]] for row in audit.row_objects},
        "row_supports": {row.name: [audit.names[p] for p in sorted(supports[row])] for row in audit.row_objects},
        "radius_classes": named_radius_classes(audit, model, context),
        "cyclic_order": [audit.names[vtx] for vtx in sorted(audit.vs, key=positions.__getitem__)],
        "solver_assertions_replayed": len(assertions),
        "packet_cuts_replayed": len(audit.packet_cuts),
        "structural_pairings_replayed": len(tuple(itertools.combinations(context.rows, 2))),
        "structural_triples_replayed": len(tuple(itertools.combinations(context.rows, 3))),
        "five_subsets_replayed": 6188,
        "positive_cyclic_orders_replayed": 30940,
        "theorem_families_replayed": list(FAMILIES),
        "kalmanson_theorem_families_replayed": list(KALMANSON_FAMILIES),
        "linear_row_theorem_families_replayed": list(LINEAR_ROW_FAMILIES),
        "raw_equality_theorem_families_replayed": list(RAW_EQUALITY_FAMILIES),
        "six_point_equality_theorem_families_replayed": list(SIX_POINT_EQUALITY_FAMILIES),
    }


def matcher_benchmark(timeout_ms):
    """Compare old and cached equality scans on exactly one solver model."""
    audit = DualAudit()
    audit.solver.set(timeout=timeout_ms)
    solve_started = time.perf_counter()
    outcome = audit.solver.check()
    solve_ms = (time.perf_counter() - solve_started) * 1000
    if outcome != audit.z3.sat:
        raise RuntimeError(f"matcher benchmark requires SAT, got {outcome}: {audit.solver.reason_unknown()}")
    model = audit.solver.model()
    scans = {
        "kalmanson": KALMANSON_FAMILIES,
        "raw": RAW_EQUALITY_FAMILIES,
        "six": SIX_POINT_EQUALITY_FAMILIES,
    }

    reference_started = time.perf_counter()
    reference = {
        name: _ordered_equality_matches_reference(audit, model, families)
        for name, families in scans.items()
    }
    reference_ms = (time.perf_counter() - reference_started) * 1000

    context_started = time.perf_counter()
    context = CandidateMatchContext.from_model(audit, model)
    context_ms = (time.perf_counter() - context_started) * 1000
    optimized_started = time.perf_counter()
    optimized = {
        name: ordered_equality_matches(audit, model, families, context)
        for name, families in scans.items()
    }
    optimized_scan_ms = (time.perf_counter() - optimized_started) * 1000
    if optimized != reference:
        raise AssertionError({
            name: (len(reference[name]), len(optimized[name]))
            for name in scans if reference[name] != optimized[name]
        })
    optimized_total_ms = context_ms + optimized_scan_ms
    return {
        "candidate_count": 1,
        "equivalent_match_sets": True,
        "match_counts": {name: len(matches) for name, matches in reference.items()},
        "raw_e_atoms_cached": len(context.equality_truth),
        "solve_ms": round(solve_ms, 3),
        "reference_ms": round(reference_ms, 3),
        "context_build_ms": round(context_ms, 3),
        "optimized_scan_ms": round(optimized_scan_ms, 3),
        "optimized_total_ms": round(optimized_total_ms, 3),
        "speedup_including_context_build": round(reference_ms / max(optimized_total_ms, 1e-9), 2),
    }


def run(timeout_ms, max_iterations, run_dir):
    run_dir.mkdir(parents=True, exist_ok=True)
    audit = DualAudit()
    started = time.monotonic()
    records = []
    candidates = 0
    connectivity_cuts = 0
    structural_cut_count = 0
    theorem_cut_counts = {family: 0 for family in ALL_THEOREM_FAMILIES}
    witness = None
    status = "UNKNOWN_ITERATION_LIMIT"

    for iteration in range(max_iterations):
        remaining = timeout_ms - int((time.monotonic() - started) * 1000)
        if remaining <= 0:
            status = "UNKNOWN_TIMEOUT"
            break
        audit.solver.set(timeout=remaining)
        check_started = time.monotonic()
        outcome = audit.solver.check()
        record = {"iteration": iteration, "check_ms": int((time.monotonic() - check_started) * 1000), "result": str(outcome)}
        if outcome == audit.z3.unknown:
            record["reason"] = audit.solver.reason_unknown()
            records.append(record)
            status = "UNKNOWN"
            break
        if outcome == audit.z3.unsat:
            records.append(record)
            status = "UNSAT_UNCERTIFIED"
            break
        candidates += 1
        model = audit.solver.model()
        closed = audit.closed_reachable_set(model)
        if closed is not None:
            audit.add_cut(closed)
            connectivity_cuts += 1
            record.update({"kind": "connectivity", "closed_size": len(closed)})
            records.append(record)
            continue
        context = CandidateMatchContext.from_model(audit, model)
        violations = structural_violations(audit, model, context)
        matches = theorem_matches(audit, model, context)
        kalmanson = kalmanson_matches(audit, model, context)
        linear_rows = linear_row_matches(audit, model, context)
        raw_equalities = raw_equality_matches(audit, model, context)
        six_point_equalities = six_point_equality_matches(audit, model, context)
        fresh_structural = sum(1 for violation in violations if add_structural_violation(audit, violation))
        fresh_theorems = {family: 0 for family in ALL_THEOREM_FAMILIES}
        for match in matches:
            if add_theorem_match(audit, match):
                fresh_theorems[match[0]] += 1
        for match in kalmanson:
            if add_kalmanson_match(audit, match):
                fresh_theorems[match[0]] += 1
        for match in linear_rows:
            if add_linear_row_match(audit, match):
                fresh_theorems[match[0]] += 1
        for match in raw_equalities:
            if add_kalmanson_match(audit, match):
                fresh_theorems[match[0]] += 1
        for match in six_point_equalities:
            if add_kalmanson_match(audit, match):
                fresh_theorems[match[0]] += 1
        if fresh_structural or sum(fresh_theorems.values()):
            structural_cut_count += fresh_structural
            for family, count in fresh_theorems.items():
                theorem_cut_counts[family] += count
            record.update({
                "kind": "dual-row-cuts",
                "structural_violations": len(violations),
                "fresh_structural_cuts": fresh_structural,
                "theorem_matches": (
                    len(matches) + len(kalmanson) + len(linear_rows)
                    + len(raw_equalities) + len(six_point_equalities)
                ),
                "fresh_theorem_cuts": fresh_theorems,
            })
            records.append(record)
            continue
        witness = independent_replay(audit, model, context)
        record.update({"kind": "surviving-candidate", "independent_replay": "PASS"})
        records.append(record)
        status = "SAT"
        break

    elapsed_ms = int((time.monotonic() - started) * 1000)
    structural_cut_counts = {
        family: sum(1 for key in audit.packet_cuts if key[0] == family)
        for family in ("shared_pair", "circle", "bisector")
    }
    result = {
        "schema": "dual-positive-exact-row-packets-full-metric-bank-cegar-v2",
        "status": status,
        "branch_scope": "collision exact rows AND outside-pair deletion exact rows; crossed outside constructors excluded",
        "n": 17,
        "closed_cap_profile": [6, 8, 6],
        "elapsed_ms": elapsed_ms,
        "candidate_count": candidates,
        "connectivity_cut_count": connectivity_cuts,
        "structural_cut_count": structural_cut_count,
        "structural_cut_counts": structural_cut_counts,
        "theorem_cut_counts": theorem_cut_counts,
        "iterations": records,
        "guard_self_checks": guard_self_checks(),
        "constraint_blocks": dict(sorted(audit.blocks.items())),
        "trust_boundary": [
            "finite external Z3 Boolean/incidence evidence",
            "UNSAT has no DRAT/LRAT certificate",
            "no coordinates or QF_NRA realization",
            "no full CounterexampleData/MEC/nonobtuse geometry",
            "no arbitrary-n conclusion",
            "no Lean kernel closure; the live leaf remains sorry",
        ],
    }
    (run_dir / "result.json").write_text(json.dumps(result, indent=2, sort_keys=True) + "\n")
    if witness is not None:
        (run_dir / "witness.json").write_text(json.dumps(witness, indent=2, sort_keys=True) + "\n")
    return result


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--self-check", action="store_true")
    parser.add_argument("--matcher-benchmark", action="store_true")
    parser.add_argument("--run", action="store_true")
    parser.add_argument("--timeout-ms", type=int, default=300000)
    parser.add_argument("--max-iterations", type=int, default=500)
    parser.add_argument("--run-dir", type=Path, default=HERE / "n17-profile-6-8-6")
    args = parser.parse_args()
    if args.self_check:
        print(json.dumps(guard_self_checks(), indent=2, sort_keys=True))
    if args.matcher_benchmark:
        print(json.dumps(matcher_benchmark(args.timeout_ms), indent=2, sort_keys=True))
    if args.run:
        result = run(args.timeout_ms, args.max_iterations, args.run_dir)
        print(json.dumps({
            "status": result["status"],
            "elapsed_ms": result["elapsed_ms"],
            "candidate_count": result["candidate_count"],
            "connectivity_cut_count": result["connectivity_cut_count"],
            "structural_cut_count": result["structural_cut_count"],
            "structural_cut_counts": result["structural_cut_counts"],
            "theorem_cut_counts": result["theorem_cut_counts"],
            "result": str(args.run_dir / "result.json"),
        }, indent=2, sort_keys=True))
    if not args.self_check and not args.matcher_benchmark and not args.run:
        parser.error("choose --self-check, --matcher-benchmark, and/or --run")


if __name__ == "__main__":
    main()
