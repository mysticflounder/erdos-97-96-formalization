#!/usr/bin/env python3
"""Audit generic structural cores against the six smallest UNIT frontiers.

The audit deliberately distinguishes direct row membership from equality
closure.  Equality-only templates are parsed from the current Lean sources;
the four-row perpendicular-bisector specialization is checked directly.
"""

from __future__ import annotations

import argparse
import hashlib
import itertools
import json
import re
from dataclasses import dataclass
from pathlib import Path
from typing import Callable, Iterable, Mapping, Sequence


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
FRONTIERS = ROOT / "scratch/atail-force/fresh-continuation-marco/frontier_checkpoint.json"
MARCO_CHECKPOINT = ROOT / "scratch/atail-force/fresh-continuation-marco/checkpoint.json"
OUTPUT = HERE / "checkpoint.json"

EXPECTED_SHARDS = (0, 1, 2, 3, 16, 20)

EQUALITY_ONLY_SOURCES = (
    "lean/Erdos9796Proof/P97/Census554/EqualityCore.lean",
    "lean/Erdos9796Proof/P97/Census554/FivePointCollision.lean",
    "lean/Erdos9796Proof/P97/Census554/EquilateralHingeCollisions.lean",
    "lean/Erdos9796Proof/P97/Census554/SevenEightPointFiveCircleCollisions.lean",
    "lean/Erdos9796Proof/P97/Census554/SevenPointCircleNetworkCollision.lean",
    "lean/Erdos9796Proof/P97/Census554/SevenPointFiveCircleCollision.lean",
    "lean/Erdos9796Proof/P97/Census554/SevenPointOrbitCollision.lean",
    "lean/Erdos9796Proof/P97/Census554/SevenPointSixCircleCollision.lean",
    "lean/Erdos9796Proof/P97/Census554/SevenPointSixCircleCollisionB.lean",
    "lean/Erdos9796Proof/P97/Census554/SixPointCircleChainCollision.lean",
    "lean/Erdos9796Proof/P97/Census554/SixPointFiveCircleCollisions.lean",
    "lean/Erdos9796Proof/P97/Census554/SixPointTwoPairCollision.lean",
    "lean/Erdos9796Proof/P97/Census554/SixRowAnchorCollision.lean",
    "lean/Erdos9796Proof/P97/Census554/SurplusSourceCollision.lean",
    "lean/Erdos9796Proof/P97/Census554/ThreeTriadCollision.lean",
)

FOUR_ROW_SOURCE = "lean/Erdos9796Proof/P97/Census554/FourRowPerpBisector.lean"

ORDER_SOURCES = (
    "lean/Erdos9796Proof/P97/Census554/NestedEqualChordCore.lean",
    "lean/Erdos9796Proof/P97/Census554/ConvexFivePointCore.lean",
    "lean/Erdos9796Proof/P97/Census554/ConvexRhombusCore.lean",
    "lean/Erdos9796Proof/P97/Census554/FiveRowCircleIntersectionOrderCore.lean",
    "lean/Erdos9796Proof/P97/Census554/FourPointTwoCircleBisectorOrderCore.lean",
    "lean/Erdos9796Proof/P97/Census554/SixPointCircleChainOrderCore.lean",
    "lean/Erdos9796Proof/P97/Census554/SixPointNestedCenterOrderCore.lean",
    "lean/Erdos9796Proof/P97/Census554/SixPointTwoCircleArcOvertakeOrderCore.lean",
    "lean/Erdos9796Proof/P97/Census554/SixPointTwoCircleOrderCore.lean",
)

AMBIENT_DEPENDENT_SOURCES = (
    "lean/Erdos9796Proof/P97/Census554/MECStraddlingRowCore.lean",
)

SEMANTIC_LABEL_SOURCE = "census/candidate_d_probe/q2_token.py"

AMBIENT_TRIANGLES: dict[str, tuple[tuple[str, str, str], ...]] = {
    "MECStraddlingRowCore.Core": (
        ("o", "a", "p"),
        ("o", "a", "s"),
        ("o", "x", "s"),
        ("o", "s", "y"),
    ),
}

ORDER_TRIANGLES: dict[str, tuple[tuple[str, str, str], ...]] = {
    "NestedEqualChordCore.Core": (
        ("o", "a", "d"), ("o", "b", "c"), ("a", "b", "d"), ("b", "c", "d"),
    ),
    "ConvexFivePointCore.Core": (("a", "x", "b"), ("b", "c", "y")),
    "ConvexRhombusCore.Core": (
        ("a", "b", "c"), ("a", "b", "d"), ("b", "c", "y"),
        ("x", "d", "a"), ("c", "x", "y"), ("x", "y", "d"),
    ),
    "FiveRowCircleIntersectionOrderCore.Core": (
        ("O", "A", "C"), ("O", "A", "D"), ("O", "A", "E"),
        ("O", "D", "E"), ("O", "D", "C"), ("O", "E", "C"),
    ),
    "FourPointTwoCircleBisectorOrderCore.Core": (
        ("u", "q", "v"), ("y", "q", "v"),
    ),
    "SixPointCircleChainOrderCore.Core": (
        ("O", "A", "C"), ("O", "A", "E"), ("O", "A", "D"), ("C", "Y", "O"),
    ),
    "SixPointNestedCenterOrderCore.Core": (
        ("O", "A", "C"), ("O", "A", "D"), ("A", "D", "C"),
        ("O", "D", "E"), ("O", "E", "X"),
    ),
    "SixPointTwoCircleArcOvertakeOrderCore.Core": (
        ("O", "A", "C"), ("O", "A", "D"), ("O", "A", "E"),
        ("O", "E", "C"), ("O", "E", "F"), ("E", "F", "C"),
    ),
    "SixPointTwoCircleOrderCore.Core": (
        ("A", "B", "C"), ("A", "B", "D"), ("B", "D", "C"),
        ("A", "P", "B"), ("A", "Q", "B"), ("Q", "B", "D"), ("A", "P", "Q"),
    ),
}

ROLE_RE = re.compile(r"^  ([A-Za-z0-9\u0370-\u03ff\u1f00-\u1fff\u2080-\u209f₁₂₃]+) : (?:α|alpha)$")
NE_RE = re.compile(
    r"^  [A-Za-z0-9_\u0370-\u03ff\u1f00-\u1fff\u2080-\u209f₁₂₃]+ : "
    r"([A-Za-z\u0370-\u03ff\u1f00-\u1fff\u2080-\u209f₁₂₃]+) ≠ "
    r"([A-Za-z\u0370-\u03ff\u1f00-\u1fff\u2080-\u209f₁₂₃]+)$"
)
EDGE_RE = re.compile(
    r"^  [A-Za-z0-9_\u0370-\u03ff\u1f00-\u1fff\u2080-\u209f₁₂₃]+ : EdgeClosure [PR] "
    r"\(([^, ]+), ([^) ]+)\) \(([^, ]+), ([^) ]+)\)$"
)
STRUCTURE_RE = re.compile(
    r"^structure ([A-Za-z0-9_\u0370-\u03ff\u1f00-\u1fff\u2080-\u209f₁₂₃]+) "
    r"\{(?:α|alpha) : Type\*\} \([PR] : RowPattern (?:α|alpha)\) where$"
)


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def edge(left: int, right: int) -> tuple[int, int]:
    return tuple(sorted((left, right)))


class UnionFind:
    def __init__(self) -> None:
        self.parent: dict[tuple[int, int], tuple[int, int]] = {}

    def find(self, item: tuple[int, int]) -> tuple[int, int]:
        self.parent.setdefault(item, item)
        if self.parent[item] != item:
            self.parent[item] = self.find(self.parent[item])
        return self.parent[item]

    def union(self, left: tuple[int, int], right: tuple[int, int]) -> None:
        left_root = self.find(left)
        right_root = self.find(right)
        if left_root != right_root:
            self.parent[right_root] = left_root


@dataclass(frozen=True)
class Template:
    name: str
    source: str
    roles: tuple[str, ...]
    inequalities: tuple[tuple[str, str], ...]
    equalities: tuple[tuple[tuple[str, str], tuple[str, str]], ...]


@dataclass
class FrontierModel:
    shard: int
    rows: dict[int, frozenset[int]]
    complete_rows: dict[int, frozenset[int]]
    row_keys: tuple[str, ...]
    uf: UnionFind
    labels: tuple[int, ...]
    cyclic_order: tuple[int, ...]

    def same_edge_class(
        self, left: tuple[int, int], right: tuple[int, int]
    ) -> bool:
        left_edge = edge(*left)
        right_edge = edge(*right)
        return left_edge == right_edge or self.uf.find(left_edge) == self.uf.find(right_edge)

    def orientation(self, a: int, b: int, c: int) -> int:
        if len({a, b, c}) < 3:
            return 0
        positions = {label: index for index, label in enumerate(self.cyclic_order)}
        n = len(self.cyclic_order)
        return 1 if (positions[b] - positions[a]) % n < (positions[c] - positions[a]) % n else -1

    def complete_row_forces_unequal(
        self, left: tuple[int, int], right: tuple[int, int]
    ) -> bool:
        shared = set(left) & set(right)
        if len(shared) != 1:
            return False
        center = next(iter(shared))
        left_other = left[0] if left[1] == center else left[1]
        right_other = right[0] if right[1] == center else right[1]
        support = self.complete_rows.get(center)
        return support is not None and ((left_other in support) != (right_other in support))


def parse_templates_from_sources(sources: Sequence[str]) -> list[Template]:
    templates: list[Template] = []
    for relative in sources:
        path = ROOT / relative
        lines = path.read_text(encoding="utf-8").splitlines()
        index = 0
        while index < len(lines):
            match = STRUCTURE_RE.match(lines[index])
            if not match:
                index += 1
                continue
            structure_name = match.group(1)
            fields: list[str] = []
            index += 1
            while index < len(lines) and lines[index].startswith("  "):
                if lines[index].strip():
                    fields.append(lines[index])
                index += 1
            roles: list[str] = []
            inequalities: list[tuple[str, str]] = []
            equalities: list[tuple[tuple[str, str], tuple[str, str]]] = []
            supported = True
            for field in fields:
                if role_match := ROLE_RE.match(field):
                    roles.append(role_match.group(1))
                elif ne_match := NE_RE.match(field):
                    inequalities.append((ne_match.group(1), ne_match.group(2)))
                elif edge_match := EDGE_RE.match(field):
                    left, right, other_left, other_right = edge_match.groups()
                    equalities.append(((left, right), (other_left, other_right)))
                else:
                    supported = False
                    break
            if supported and roles and equalities:
                role_set = set(roles)
                names = {
                    name
                    for equality in equalities
                    for pair in equality
                    for name in pair
                } | {name for pair in inequalities for name in pair}
                if names <= role_set:
                    templates.append(
                        Template(
                            name=f"{Path(relative).stem}.{structure_name}",
                            source=relative,
                            roles=tuple(roles),
                            inequalities=tuple(inequalities),
                            equalities=tuple(equalities),
                        )
                    )
    return templates


def parse_templates() -> list[Template]:
    return parse_templates_from_sources(EQUALITY_ONLY_SOURCES)


def parse_order_templates() -> list[tuple[Template, tuple[tuple[str, str, str], ...]]]:
    templates = parse_templates_from_sources(ORDER_SOURCES)
    by_name = {template.name: template for template in templates}
    if set(by_name) != set(ORDER_TRIANGLES):
        raise RuntimeError(
            f"order-template parser drift: parsed={sorted(by_name)}, "
            f"expected={sorted(ORDER_TRIANGLES)}"
        )
    return [(by_name[name], ORDER_TRIANGLES[name]) for name in sorted(by_name)]


def load_models() -> list[FrontierModel]:
    bank = json.loads(FRONTIERS.read_text(encoding="utf-8"))
    smallest: dict[int, Mapping[str, object]] = {}
    for record in bank["frontiers"]:
        shard = int(record["shard_index"])
        key = (int(record["row_count"]), tuple(record["row_keys"]))
        current = smallest.get(shard)
        if current is None or key < (
            int(current["row_count"]), tuple(current["row_keys"])
        ):
            smallest[shard] = record
    if tuple(sorted(smallest)) != EXPECTED_SHARDS:
        raise RuntimeError(f"unexpected smallest-frontier shards: {sorted(smallest)}")

    marco = json.loads(MARCO_CHECKPOINT.read_text(encoding="utf-8"))
    marco_by_shard = {int(record["shard_index"]): record for record in marco["cases"]}
    models = []
    for shard in EXPECTED_SHARDS:
        record = smallest[shard]
        rows = {
            int(row["center"]): frozenset(int(x) for x in row["support"])
            for row in record["rows"]
        }
        complete_rows = {
            int(row["center"]): frozenset(int(x) for x in row["support"])
            for row in marco_by_shard[shard]["rows"]
        }
        uf = UnionFind()
        for center, support in rows.items():
            row_edges = [edge(center, point) for point in sorted(support)]
            for other in row_edges[1:]:
                uf.union(row_edges[0], other)
        labels = tuple(
            sorted({point for center, support in rows.items() for point in (center, *support)})
        )
        models.append(
            FrontierModel(
                shard=shard,
                rows=rows,
                complete_rows=complete_rows,
                row_keys=tuple(record["row_keys"]),
                uf=uf,
                labels=labels,
                cyclic_order=tuple(int(x) for x in marco_by_shard[shard]["cyclic_order"]),
            )
        )
    return models


def constraint_tables(
    template: Template, model: FrontierModel
) -> list[tuple[tuple[str, ...], tuple[tuple[int, ...], ...]]]:
    tables = []
    for left, right in template.equalities:
        scope = tuple(dict.fromkeys((*left, *right)))
        allowed = []
        for values in itertools.product(model.labels, repeat=len(scope)):
            assignment = dict(zip(scope, values, strict=True))
            if model.same_edge_class(
                (assignment[left[0]], assignment[left[1]]),
                (assignment[right[0]], assignment[right[1]]),
            ):
                allowed.append(values)
        tables.append((scope, tuple(allowed)))
    return tables


def solve_template(
    template: Template,
    model: FrontierModel,
    *,
    injective: bool,
    triangles: Sequence[tuple[str, str, str]] = (),
) -> dict[str, int] | None:
    tables = constraint_tables(template, model)
    constraints_by_role = {
        role: [item for item in tables if role in item[0]] for role in template.roles
    }
    assignment: dict[str, int] = {}

    def orientations_hold() -> bool:
        signs = []
        for a, b, c in triangles:
            if a in assignment and b in assignment and c in assignment:
                sign = model.orientation(assignment[a], assignment[b], assignment[c])
                if sign == 0:
                    return False
                signs.append(sign)
        return not signs or len(set(signs)) == 1

    def inequalities_hold(candidate_role: str | None = None) -> bool:
        for left, right in template.inequalities:
            if left in assignment and right in assignment and assignment[left] == assignment[right]:
                return False
        if injective and candidate_role is not None:
            values = list(assignment.values())
            if len(values) != len(set(values)):
                return False
        return True

    def viable_rows(
        scope: tuple[str, ...], rows: tuple[tuple[int, ...], ...]
    ) -> tuple[tuple[int, ...], ...]:
        fixed = [(index, assignment[role]) for index, role in enumerate(scope) if role in assignment]
        return tuple(
            row for row in rows if all(row[index] == value for index, value in fixed)
        )

    def search() -> dict[str, int] | None:
        if len(assignment) == len(template.roles):
            return dict(assignment)
        best_role = None
        best_domain: tuple[int, ...] | None = None
        for role in template.roles:
            if role in assignment:
                continue
            domain = set(model.labels)
            if injective:
                domain -= set(assignment.values())
            for other_left, other_right in template.inequalities:
                if role == other_left and other_right in assignment:
                    domain.discard(assignment[other_right])
                if role == other_right and other_left in assignment:
                    domain.discard(assignment[other_left])
            for scope, rows in constraints_by_role[role]:
                possible = viable_rows(scope, rows)
                domain &= {row[scope.index(role)] for row in possible}
            ordered = tuple(sorted(domain))
            if not ordered:
                return None
            if best_domain is None or (len(ordered), role) < (len(best_domain), best_role):
                best_role = role
                best_domain = ordered
        assert best_role is not None and best_domain is not None
        for value in best_domain:
            assignment[best_role] = value
            if inequalities_hold(best_role) and orientations_hold():
                failed = False
                for scope, rows in constraints_by_role[best_role]:
                    if not viable_rows(scope, rows):
                        failed = True
                        break
                if not failed:
                    result = search()
                    if result is not None:
                        return result
            del assignment[best_role]
        return None

    return search()


def orientation_signature(
    model: FrontierModel,
    mapping: Mapping[str, int],
    triangles: Sequence[tuple[str, str, str]],
) -> list[dict[str, object]]:
    return [
        {
            "roles": [a, b, c],
            "labels": [mapping[a], mapping[b], mapping[c]],
            "sign": model.orientation(mapping[a], mapping[b], mapping[c]),
        }
        for a, b, c in triangles
    ]


def four_row_matches(model: FrontierModel) -> list[dict[str, int]]:
    matches = []
    for a, b in itertools.permutations(model.labels, 2):
        common = model.rows.get(a, frozenset()) & model.rows.get(b, frozenset())
        for p, q in itertools.permutations(sorted(common), 2):
            if not {a, b} <= model.rows.get(p, frozenset()):
                continue
            for r in model.labels:
                if r in (p, q):
                    continue
                if {a, b} <= model.rows.get(r, frozenset()):
                    matches.append({"a": a, "b": b, "p": p, "q": q, "r": r})
                    return matches
    return matches


def perp_bisector_matches(model: FrontierModel) -> list[dict[str, object]]:
    matches = []
    for a, b in itertools.permutations(model.labels, 2):
        centers = [
            p
            for p in model.labels
            if model.same_edge_class((p, a), (p, b))
        ]
        if len(centers) >= 3:
            matches.append({"a": a, "b": b, "centers": centers})
            return matches
    return matches


def exact_off_circle_matches(model: FrontierModel) -> list[dict[str, int]]:
    matches = []
    for center, support in sorted(model.rows.items()):
        for inside in sorted(support):
            for outside in model.labels:
                if outside == center or outside in support:
                    continue
                if model.same_edge_class((center, inside), (center, outside)):
                    matches.append({"c": center, "a": inside, "z": outside})
                    return matches
    return matches


def minimum_perp_deficit(model: FrontierModel) -> dict[str, object]:
    best: tuple[int, tuple[int, int, int, int, int]] | None = None
    for values in itertools.permutations(model.labels, 5):
        a, b, p, q, r = values
        deficit = sum(
            not model.same_edge_class((center, a), (center, b))
            for center in (p, q, r)
        )
        candidate = (deficit, values)
        if best is None or candidate < best:
            best = candidate
            if deficit == 0:
                break
    assert best is not None
    deficit, (a, b, p, q, r) = best
    missing = [
        {
            "left": [center, a],
            "right": [center, b],
            "complete_exact_row_forces_unequal": model.complete_row_forces_unequal(
                (center, a), (center, b)
            ),
        }
        for center in (p, q, r)
        if not model.same_edge_class((center, a), (center, b))
    ]
    return {
        "deficit": deficit,
        "mapping": {"a": a, "b": b, "p": p, "q": q, "r": r},
        "missing_closure_equalities": missing,
    }


def minimum_four_row_deficit(model: FrontierModel) -> dict[str, object]:
    fields: tuple[tuple[str, str], ...] = (
        ("a", "p"), ("a", "q"), ("b", "p"), ("b", "q"),
        ("p", "a"), ("p", "b"), ("r", "a"), ("r", "b"),
    )
    best: tuple[int, tuple[int, int, int, int, int]] | None = None
    for values in itertools.permutations(model.labels, 5):
        mapping = dict(zip(("a", "b", "p", "q", "r"), values, strict=True))
        deficit = sum(mapping[point] not in model.rows.get(mapping[center], frozenset())
                      for center, point in fields)
        candidate = (deficit, values)
        if best is None or candidate < best:
            best = candidate
            if deficit == 0:
                break
    assert best is not None
    deficit, values = best
    mapping = dict(zip(("a", "b", "p", "q", "r"), values, strict=True))
    return {
        "deficit": deficit,
        "mapping": mapping,
        "missing_direct_memberships": [
            {
                "point": mapping[point],
                "center": mapping[center],
                "absent_from_complete_exact_row": mapping[point]
                not in model.complete_rows[mapping[center]],
            }
            for center, point in fields
            if mapping[point] not in model.rows.get(mapping[center], frozenset())
        ],
    }


def four_point_same_side_matches(model: FrontierModel) -> list[dict[str, int]]:
    matches = []
    for q, v, u, y in itertools.permutations(model.labels, 4):
        if not model.same_edge_class((q, u), (q, y)):
            continue
        if not model.same_edge_class((u, v), (y, v)):
            continue
        if model.orientation(u, q, v) == model.orientation(y, q, v):
            matches.append({"q": q, "v": v, "u": u, "y": y})
            return matches
    return matches


def model_from_rows(
    rows: Mapping[int, Iterable[int]], cyclic_order: Sequence[int]
) -> FrontierModel:
    frozen_rows = {center: frozenset(support) for center, support in rows.items()}
    uf = UnionFind()
    for center, support in frozen_rows.items():
        row_edges = [edge(center, point) for point in sorted(support)]
        for other in row_edges[1:]:
            uf.union(row_edges[0], other)
    labels = tuple(sorted(set(cyclic_order)))
    return FrontierModel(
        shard=-1,
        rows=frozen_rows,
        complete_rows=frozen_rows,
        row_keys=(),
        uf=uf,
        labels=labels,
        cyclic_order=tuple(cyclic_order),
    )


def run_self_tests(
    templates: Sequence[Template],
    order_templates: Sequence[tuple[Template, tuple[tuple[str, str, str], ...]]],
) -> None:
    four_row = model_from_rows(
        {1: (3, 8), 3: (1, 6), 6: (3, 8), 10: (1, 6)},
        (1, 3, 6, 8, 10),
    )
    assert four_row_matches(four_row)
    assert perp_bisector_matches(four_row)
    perp_template = next(
        template for template in templates
        if template.name == "EqualityCore.PerpBisectorCore"
    )
    assert solve_template(perp_template, four_row, injective=False)
    assert solve_template(perp_template, four_row, injective=True)

    exact_off = model_from_rows(
        {0: (1, 2), 2: (0, 3), 3: (0, 2)},
        (0, 1, 2, 3),
    )
    assert exact_off_circle_matches(exact_off)

    same_side = model_from_rows({0: (1, 2), 3: (1, 2)}, (0, 3, 1, 2))
    assert four_point_same_side_matches(same_side)
    order_template, triangles = next(
        item for item in order_templates
        if item[0].name == "FourPointTwoCircleBisectorOrderCore.Core"
    )
    assert solve_template(
        order_template, same_side, injective=False, triangles=triangles
    )
    assert solve_template(
        order_template, same_side, injective=True, triangles=triangles
    )


def minimum_four_point_same_side_deficit(model: FrontierModel) -> dict[str, object]:
    best: tuple[int, tuple[int, int, int, int]] | None = None
    for values in itertools.permutations(model.labels, 4):
        q, v, u, y = values
        if model.orientation(u, q, v) != model.orientation(y, q, v):
            continue
        deficit = (
            int(not model.same_edge_class((q, u), (q, y)))
            + int(not model.same_edge_class((u, v), (y, v)))
        )
        candidate = (deficit, values)
        if best is None or candidate < best:
            best = candidate
            if deficit == 0:
                break
    assert best is not None
    deficit, (q, v, u, y) = best
    missing = []
    if not model.same_edge_class((q, u), (q, y)):
        missing.append({
            "left": [q, u], "right": [q, y],
            "complete_exact_row_forces_unequal": model.complete_row_forces_unequal(
                (q, u), (q, y)
            ),
        })
    if not model.same_edge_class((u, v), (y, v)):
        missing.append({
            "left": [u, v], "right": [y, v],
            "complete_exact_row_forces_unequal": model.complete_row_forces_unequal(
                (u, v), (y, v)
            ),
        })
    return {
        "deficit": deficit,
        "mapping": {"q": q, "v": v, "u": u, "y": y},
        "missing_closure_equalities": missing,
    }


def anchor_one_sided_two_circle_completion(model: FrontierModel) -> dict[str, object] | None:
    anchor = {0, 1, 2}
    for q, v, u in itertools.permutations(sorted(anchor), 3):
        for y in model.labels:
            if y in anchor:
                continue
            if not {u, y} <= model.rows.get(q, frozenset()):
                continue
            if u not in model.complete_rows[v] or y in model.complete_rows[v]:
                continue
            if model.orientation(u, q, v) != model.orientation(y, q, v):
                continue
            if not model.same_edge_class((q, u), (q, y)):
                continue
            if model.same_edge_class((u, v), (y, v)):
                continue
            return {
                "q": q,
                "v": v,
                "u": u,
                "y": y,
                "known_direct_row": {"center": q, "support_points": [u, y]},
                "missing_opposite_center_equality": {
                    "left": [u, v],
                    "right": [y, v],
                    "u_in_complete_exact_row_at_v": True,
                    "y_absent_from_complete_exact_row_at_v": True,
                },
                "same_side_of_anchor_chord_in_pinned_cyclic_order": True,
            }
    return None


def build_document() -> dict[str, object]:
    templates = parse_templates()
    order_templates = parse_order_templates()
    ambient_templates = parse_templates_from_sources(AMBIENT_DEPENDENT_SOURCES)
    if [template.name for template in ambient_templates] != ["MECStraddlingRowCore.Core"]:
        raise RuntimeError("ambient-dependent template parser drift")
    run_self_tests(templates, order_templates)
    models = load_models()
    cases = []
    for model in models:
        formal_matches = []
        injective_matches = []
        formal_order_matches = []
        injective_order_matches = []
        ambient_skeleton_formal_matches = []
        ambient_skeleton_injective_matches = []
        ambient_orientation_formal_matches = []
        ambient_orientation_injective_matches = []
        for template in templates:
            if formal := solve_template(template, model, injective=False):
                formal_matches.append({"template": template.name, "mapping": formal})
            if injective := solve_template(template, model, injective=True):
                injective_matches.append({"template": template.name, "mapping": injective})
        for template, triangles in order_templates:
            if formal := solve_template(
                template, model, injective=False, triangles=triangles
            ):
                formal_order_matches.append({"template": template.name, "mapping": formal})
            if injective := solve_template(
                template, model, injective=True, triangles=triangles
            ):
                injective_order_matches.append({"template": template.name, "mapping": injective})
        for template in ambient_templates:
            if formal := solve_template(template, model, injective=False):
                ambient_skeleton_formal_matches.append(
                    {
                        "template": template.name,
                        "mapping": formal,
                        "orientation_signature": orientation_signature(
                            model, formal, AMBIENT_TRIANGLES[template.name]
                        ),
                    }
                )
            if injective := solve_template(template, model, injective=True):
                ambient_skeleton_injective_matches.append(
                    {
                        "template": template.name,
                        "mapping": injective,
                        "orientation_signature": orientation_signature(
                            model, injective, AMBIENT_TRIANGLES[template.name]
                        ),
                    }
                )
            triangles = AMBIENT_TRIANGLES[template.name]
            if formal := solve_template(
                template, model, injective=False, triangles=triangles
            ):
                ambient_orientation_formal_matches.append(
                    {"template": template.name, "mapping": formal}
                )
            if injective := solve_template(
                template, model, injective=True, triangles=triangles
            ):
                ambient_orientation_injective_matches.append(
                    {"template": template.name, "mapping": injective}
                )
        cases.append(
            {
                "shard_index": model.shard,
                "row_count": len(model.rows),
                "row_keys": list(model.row_keys),
                "cyclic_order": list(model.cyclic_order),
                "four_row_perp_bisector_direct_matches": four_row_matches(model),
                "perp_bisector_equality_closure_matches": perp_bisector_matches(model),
                "exact_off_circle_closure_matches": exact_off_circle_matches(model),
                "four_point_two_circle_same_side_matches": four_point_same_side_matches(model),
                "equality_only_formal_alias_matches": formal_matches,
                "equality_only_injective_matches": injective_matches,
                "cyclic_order_formal_alias_matches": formal_order_matches,
                "cyclic_order_injective_matches": injective_order_matches,
                "ambient_dependent_skeleton_formal_alias_matches":
                    ambient_skeleton_formal_matches,
                "ambient_dependent_skeleton_injective_matches":
                    ambient_skeleton_injective_matches,
                "ambient_dependent_orientation_formal_alias_matches":
                    ambient_orientation_formal_matches,
                "ambient_dependent_orientation_injective_matches":
                    ambient_orientation_injective_matches,
                "minimum_deficits": {
                    "four_row_direct_membership": minimum_four_row_deficit(model),
                    "perp_bisector_equality_closure": minimum_perp_deficit(model),
                    "four_point_two_circle_same_side": minimum_four_point_same_side_deficit(model),
                },
                "anchor_one_sided_two_circle_completion":
                    anchor_one_sided_two_circle_completion(model),
            }
        )
    template_records = [
        {
            "name": template.name,
            "source": template.source,
            "roles": list(template.roles),
            "inequalities": [list(pair) for pair in template.inequalities],
            "closure_equality_count": len(template.equalities),
        }
        for template in templates
    ]
    order_template_records = [
        {
            "name": template.name,
            "source": template.source,
            "roles": list(template.roles),
            "inequalities": [list(pair) for pair in template.inequalities],
            "closure_equality_count": len(template.equalities),
            "orientation_triangles": [list(triangle) for triangle in triangles],
            "accepted_orientation": "all positive or all negative",
        }
        for template, triangles in order_templates
    ]
    ambient_template_records = [
        {
            "name": template.name,
            "source": template.source,
            "roles": list(template.roles),
            "inequalities": [list(pair) for pair in template.inequalities],
            "closure_equality_count": len(template.equalities),
            "orientation_triangles": [
                list(triangle) for triangle in AMBIENT_TRIANGLES[template.name]
            ],
            "accepted_orientation": "all positive or all negative",
            "missing_for_contradiction": "MEC boundary, disk, nonobtuse, and orientation Geometry fields",
        }
        for template in ambient_templates
    ]
    common_formal = sorted(
        set.intersection(
            *(
                {match["template"] for match in case["equality_only_formal_alias_matches"]}
                for case in cases
            )
        )
    )
    common_injective = sorted(
        set.intersection(
            *(
                {match["template"] for match in case["equality_only_injective_matches"]}
                for case in cases
            )
        )
    )
    common_order_formal = sorted(
        set.intersection(
            *(
                {match["template"] for match in case["cyclic_order_formal_alias_matches"]}
                for case in cases
            )
        )
    )
    common_order_injective = sorted(
        set.intersection(
            *(
                {match["template"] for match in case["cyclic_order_injective_matches"]}
                for case in cases
            )
        )
    )
    common_ambient_formal = sorted(
        set.intersection(
            *(
                {
                    match["template"]
                    for match in case["ambient_dependent_skeleton_formal_alias_matches"]
                }
                for case in cases
            )
        )
    )
    common_ambient_injective = sorted(
        set.intersection(
            *(
                {
                    match["template"]
                    for match in case["ambient_dependent_skeleton_injective_matches"]
                }
                for case in cases
            )
        )
    )
    common_ambient_orientation_formal = sorted(
        set.intersection(
            *(
                {
                    match["template"]
                    for match in case[
                        "ambient_dependent_orientation_formal_alias_matches"
                    ]
                }
                for case in cases
            )
        )
    )
    common_ambient_orientation_injective = sorted(
        set.intersection(
            *(
                {
                    match["template"]
                    for match in case[
                        "ambient_dependent_orientation_injective_matches"
                    ]
                }
                for case in cases
            )
        )
    )
    return {
        "schema": "p97-atail-six-frontier-structural-core-audit-v2",
        "sources": {
            "frontier_checkpoint": str(FRONTIERS.relative_to(ROOT)),
            "frontier_checkpoint_sha256": sha256(FRONTIERS),
            "cyclic_order_checkpoint": str(MARCO_CHECKPOINT.relative_to(ROOT)),
            "cyclic_order_checkpoint_sha256": sha256(MARCO_CHECKPOINT),
            "semantic_label_source": SEMANTIC_LABEL_SOURCE,
            "semantic_label_source_sha256": sha256(ROOT / SEMANTIC_LABEL_SOURCE),
            "lean_sources": {
                relative: sha256(ROOT / relative)
                for relative in (
                    *EQUALITY_ONLY_SOURCES,
                    *ORDER_SOURCES,
                    *AMBIENT_DEPENDENT_SOURCES,
                    FOUR_ROW_SOURCE,
                )
            },
        },
        "scope": {
            "smallest_frontier_per_clean_shard": True,
            "shards": list(EXPECTED_SHARDS),
            "direct_membership_separated_from_equality_closure": True,
            "formal_role_aliasing_checked": True,
            "injective_relabeling_checked_separately": True,
            "cyclic_order_used_for_nine_imported_order_cores": True,
            "finite_structural_audit_only": True,
            "positive_control_self_tests_passed": True,
            "lean_theorem_proved": False,
            "conditional_scratch_lean_validation_passed": True,
        },
        "label_semantics": {
            "profile": [5, 5, 5],
            "moser_apices": {
                "0": "U; incident to O1 and O2; opposite S",
                "1": "V; incident to S and O2; opposite O1",
                "2": "W; incident to S and O1; opposite O2",
            },
            "strict_cap_interiors": {
                "3": "strict interior of S (same block as 4,5)",
                "6": "strict interior of O1 (same block as 7,8)",
                "7": "strict interior of O1 (same block as 6,8)",
                "9": "strict interior of O2 (same block as 10,11)",
                "10": "strict interior of O2 (same block as 9,11)",
            },
        },
        "live_geometry_field_audit": {
            "center": "direct from CircumscribedMECPacket.ofNonObtuse",
            "boundary_oa": "direct because o and a are Moser boundary apices",
            "boundary_op": "missing: p is a strict cap-interior label, not the third Moser apex",
            "x_disk": "direct from disk_contains_A plus carrier membership",
            "y_disk": "direct from disk_contains_A plus carrier membership",
            "nonobtuse_a": "derived and scratch-Lean-validated from opposite-cap membership via exists_cone_coeffs_of_cap_region",
            "orientations": "failed by the displayed common mappings; no orientation-compatible core exists in shards 0, 1, or 2",
        },
        "templates": template_records,
        "order_templates": order_template_records,
        "ambient_dependent_templates": ambient_template_records,
        "summary": {
            "template_count": len(templates),
            "order_template_count": len(order_templates),
            "common_equality_only_formal_alias_templates": common_formal,
            "common_equality_only_injective_templates": common_injective,
            "common_cyclic_order_formal_alias_templates": common_order_formal,
            "common_cyclic_order_injective_templates": common_order_injective,
            "common_ambient_skeleton_formal_alias_templates": common_ambient_formal,
            "common_ambient_skeleton_injective_templates": common_ambient_injective,
            "common_ambient_orientation_formal_alias_templates":
                common_ambient_orientation_formal,
            "common_ambient_orientation_injective_templates":
                common_ambient_orientation_injective,
            "all_six_four_row_direct_match_free": all(
                not case["four_row_perp_bisector_direct_matches"] for case in cases
            ),
            "all_six_perp_bisector_closure_match_free": all(
                not case["perp_bisector_equality_closure_matches"] for case in cases
            ),
            "all_six_exact_off_circle_match_free": all(
                not case["exact_off_circle_closure_matches"] for case in cases
            ),
            "all_six_four_point_same_side_match_free": all(
                not case["four_point_two_circle_same_side_matches"] for case in cases
            ),
            "all_six_have_anchor_one_sided_two_circle_completion": all(
                case["anchor_one_sided_two_circle_completion"] is not None for case in cases
            ),
        },
        "cases": cases,
    }


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    document = build_document()
    rendered = json.dumps(document, indent=2, sort_keys=True) + "\n"
    if args.check:
        if not OUTPUT.exists() or OUTPUT.read_text(encoding="utf-8") != rendered:
            raise AssertionError("structural-core checkpoint drift")
        print("structural-core checkpoint: PASS")
    else:
        OUTPUT.write_text(rendered, encoding="utf-8")
        print(f"wrote {OUTPUT}")


if __name__ == "__main__":
    main()
