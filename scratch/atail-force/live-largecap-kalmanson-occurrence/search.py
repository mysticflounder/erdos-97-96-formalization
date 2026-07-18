#!/usr/bin/env python3
"""Source-indexed n=14 live large-cap Kalmanson occurrence audit.

This is the minimum live cap profile: surplus cap five, and both opposite
caps six.  Unlike the earlier anonymous n=14 probe, this encoder retains the
named original-frontier pair/double row and the exact-five all-reverse
transition fields carried by the live ``L`` endpoint.

The outer solver uses current ``multi_center`` candidate domains.  Every
decoded assignment is independently checked for exact critical-row
consistency and a production ``ATailOrdinalKalmansonCycle``.  A cycle is a
rejection; a cycle-free assignment is accepted only after an exact rational
full Kalmanson/triangle metric model is produced and replayed.
"""

from __future__ import annotations

import argparse
from collections import defaultdict, deque
from fractions import Fraction
import hashlib
import itertools
import json
from pathlib import Path
import sys
import time
from typing import Iterable, Mapping, Sequence

import z3


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from census.global_confinement import shadow  # noqa: E402
from census.multi_center import multi_center_census as mc  # noqa: E402


# multi_center profiles are ordered (first opposite, second opposite,
# surplus), while the live prose profile is (surplus, first opposite,
# second opposite) = (5,6,6).
CENSUS_PROFILE = (6, 6, 5)
LIVE_CAP_PROFILE = (5, 6, 6)
ROLE_NAMES = (
    "firstApex",
    "surplusInterior0", "surplusInterior1", "surplusInterior2",
    "secondApex",
    "firstOppInterior0", "firstOppInterior1",
    "firstOppInterior2", "firstOppInterior3",
    "thirdApex",
    "secondOppInterior0", "secondOppInterior1",
    "secondOppInterior2", "secondOppInterior3",
)
SCHEMA = "p97-live-largecap-kalmanson-occurrence-v1"
DEFAULT_OUTPUT = HERE / "result.json"
DEFAULT_LOG = HERE / "run.jsonl"


def file_sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def canonical_sha256(value: object) -> str:
    rendered = json.dumps(value, sort_keys=True, separators=(",", ":"))
    return hashlib.sha256(rendered.encode()).hexdigest()


def atomic_json(path: Path, value: object) -> None:
    rendered = json.dumps(value, indent=2, sort_keys=True) + "\n"
    temporary = path.with_suffix(path.suffix + ".tmp")
    temporary.write_text(rendered, encoding="utf-8")
    temporary.replace(path)


def append_event(path: Path, value: object) -> None:
    with path.open("a", encoding="utf-8") as handle:
        handle.write(json.dumps(value, sort_keys=True) + "\n")
        handle.flush()


class Surface:
    def __init__(self, *, timeout_ms: int, random_seed: int, threads: int) -> None:
        frame, raw_candidates = mc.cached_candidate_lists(
            CENSUS_PROFILE, set(mc.PROVEN_ROWS)
        )
        if raw_candidates is None:
            raise RuntimeError("minimum live profile has no current candidates")
        self.frame = frame
        self.order = tuple(shadow.hull_order(frame))
        if len(self.order) != 14 or len(ROLE_NAMES) != 14:
            raise RuntimeError("minimum live carrier order drift")
        self.by_name = dict(zip(ROLE_NAMES, self.order))
        self.by_label = {label: name for name, label in self.by_name.items()}
        self.position = {label: index for index, label in enumerate(self.order)}
        self.first_apex = self.by_name["firstApex"]
        self.second_apex = self.by_name["secondApex"]
        self.third_apex = self.by_name["thirdApex"]
        self.surplus_cap = frozenset(frame.O2)
        self.first_opp_cap = frozenset(frame.S)
        self.second_opp_cap = frozenset(frame.O1)
        self.surplus_interior = frozenset(frame.ints["O2"])
        self.first_opp_interior = frozenset(frame.ints["S"])
        self.second_opp_interior = frozenset(frame.ints["O1"])
        expected_caps = (
            frozenset(self.order[:5]),
            frozenset(self.order[4:10]),
            frozenset((*self.order[9:], self.order[0])),
        )
        actual_caps = (
            self.surplus_cap, self.first_opp_cap, self.second_opp_cap
        )
        if actual_caps != expected_caps:
            raise RuntimeError(f"current cap/order drift: {actual_caps}")

        self.candidates = {
            center: tuple(sorted(
                (frozenset(support) for support in raw_candidates[center]),
                key=lambda support: tuple(self.position[x] for x in sorted(
                    support, key=self.position.get
                )),
            ))
            for center in range(frame.n)
        }
        self.solver = z3.Solver()
        self.solver.set(timeout=timeout_ms, random_seed=random_seed)
        if threads > 1:
            self.solver.set(threads=threads)
        self.choice = {
            center: z3.Int(f"row_choice_{center}")
            for center in range(frame.n)
        }
        self._member: dict[tuple[int, int], z3.BoolRef] = {}
        for center in range(frame.n):
            self.solver.add(
                0 <= self.choice[center],
                self.choice[center] < len(self.candidates[center]),
            )

        self.double_choice = z3.Int("frontier_double_row_choice")
        self.solver.add(
            0 <= self.double_choice,
            self.double_choice < len(self.candidates[self.first_apex]),
        )
        self.same_frontier_radius = z3.Bool("frontier_rows_same_radius")
        self.blocker = {
            source: z3.Int(f"actual_blocker_{source}")
            for source in range(frame.n)
        }
        self.physical_class = {
            point: z3.Bool(f"physical_exact_five_{point}")
            for point in range(frame.n)
        }
        self.unused = z3.Int("unused_physical_cap_source")
        self.continuation_first = z3.Int("continuation_first")
        self.continuation_second = z3.Int("continuation_second")
        self.frontier_q = z3.Int("frontier_q")
        self.frontier_w = z3.Int("frontier_w")
        self.cycle = tuple(z3.Int(f"cycle_source_{index}") for index in range(3))
        self.successor = {
            point: z3.Int(f"transition_successor_{point}")
            for point in sorted(self.second_opp_interior, key=self.position.get)
        }
        self._add_whole_carrier_constraints()
        self._add_live_parent_constraints()

    def member(self, center: int, point: int) -> z3.BoolRef:
        key = (center, point)
        if key not in self._member:
            indices = [
                index for index, support in enumerate(self.candidates[center])
                if point in support
            ]
            self._member[key] = z3.Or(*(
                self.choice[center] == index for index in indices
            ))
        return self._member[key]

    def double_member(self, point: int) -> z3.BoolRef:
        indices = [
            index for index, support in enumerate(self.candidates[self.first_apex])
            if point in support
        ]
        return z3.Or(*(self.double_choice == index for index in indices))

    def row_at_blocker(self, source: int, point: int) -> z3.BoolRef:
        return z3.Or(*(
            z3.And(self.blocker[source] == center, self.member(center, point))
            for center in range(self.frame.n)
        ))

    @staticmethod
    def select_bool(variable: z3.ArithRef, values: Mapping[int, z3.BoolRef]) -> z3.BoolRef:
        return z3.Or(*(
            z3.And(variable == key, value) for key, value in values.items()
        ))

    def variable_row_member(
        self, source_var: z3.ArithRef, point_var: z3.ArithRef
    ) -> z3.BoolRef:
        return z3.Or(*(
            z3.And(
                source_var == source,
                point_var == point,
                self.row_at_blocker(source, point),
            )
            for source in range(self.frame.n)
            for point in range(self.frame.n)
        ))

    def blocker_value_of(self, source_var: z3.ArithRef) -> z3.ArithRef:
        return z3.Sum(*(
            z3.If(source_var == source, self.blocker[source], 0)
            for source in range(self.frame.n)
        ))

    def _add_whole_carrier_constraints(self) -> None:
        n = self.frame.n
        # Current candidate lists already enforce card four, center omission,
        # Moser-local row geometry, and the current killed-row registry.
        for left, right in itertools.combinations(range(n), 2):
            self.solver.add(z3.PbLe([
                (z3.And(self.member(left, p), self.member(right, p)), 1)
                for p in range(n)
            ], 2))

        def between(a: int, b: int, x: int) -> bool:
            da = (self.position[x] - self.position[a]) % n
            db = (self.position[b] - self.position[a]) % n
            return 0 < da < db

        for left, right in itertools.combinations(range(n), 2):
            remaining = [p for p in range(n) if p not in {left, right}]
            for x, y in itertools.combinations(remaining, 2):
                if between(left, right, x) != between(left, right, y):
                    continue
                self.solver.add(z3.Not(z3.And(
                    self.member(left, x), self.member(left, y),
                    self.member(right, x), self.member(right, y),
                )))

        # The extra double-deletion row has the same first-apex center, so a
        # point pair counts that center once if it occurs in either first row.
        for x, y in itertools.combinations(range(n), 2):
            hits = []
            for center in range(n):
                hit = z3.And(self.member(center, x), self.member(center, y))
                if center == self.first_apex:
                    hit = z3.Or(
                        hit, z3.And(self.double_member(x), self.double_member(y))
                    )
                hits.append((hit, 1))
            self.solver.add(z3.PbLe(hits, 2))

        # Strong connectivity via every nonempty proper subset having an
        # outgoing selected-witness edge.
        vertices = tuple(range(n))
        for size in range(1, n):
            for subset_tuple in itertools.combinations(vertices, size):
                subset = frozenset(subset_tuple)
                complement = tuple(x for x in vertices if x not in subset)
                self.solver.add(z3.Or(*(
                    self.member(center, point)
                    for center in subset for point in complement
                )))

        for source in range(n):
            allowed = [
                center for center in range(n)
                if center not in {source, self.first_apex, self.second_apex}
            ]
            self.solver.add(z3.Or(*(
                self.blocker[source] == center for center in allowed
            )))
            self.solver.add(z3.Or(*(
                z3.And(
                    self.blocker[source] == center,
                    self.member(center, source),
                )
                for center in allowed
            )))

        # Source-proved cap row bounds, also applied to the extra row.
        caps = (self.surplus_cap, self.first_opp_cap, self.second_opp_cap)
        endpoints = (
            {self.first_apex, self.second_apex},
            {self.second_apex, self.third_apex},
            {self.third_apex, self.first_apex},
        )
        for cap, cap_endpoints in zip(caps, endpoints):
            for center in cap:
                self.solver.add(z3.PbLe([
                    (self.member(center, point), 1) for point in cap
                ], 2))
                if center in cap_endpoints:
                    self.solver.add(z3.PbLe([
                        (self.member(center, point), 1) for point in cap
                    ], 1))
        for cap, cap_endpoints in zip(caps, endpoints):
            if self.first_apex in cap:
                self.solver.add(z3.PbLe([
                    (self.double_member(point), 1) for point in cap
                ], 1 if self.first_apex in cap_endpoints else 2))

        # Compatibility of the extra first-apex row with every other center.
        for center in range(n):
            if center == self.first_apex:
                continue
            self.solver.add(z3.PbLe([
                (z3.And(self.double_member(p), self.member(center, p)), 1)
                for p in range(n)
            ], 2))
            for x, y in itertools.combinations(
                [p for p in range(n) if p not in {self.first_apex, center}], 2
            ):
                if between(self.first_apex, center, x) != between(
                    self.first_apex, center, y
                ):
                    continue
                self.solver.add(z3.Not(z3.And(
                    self.double_member(x), self.double_member(y),
                    self.member(center, x), self.member(center, y),
                )))

    def _add_live_parent_constraints(self) -> None:
        n = self.frame.n
        # Exact-five physical-apex class.
        self.solver.add(z3.PbEq([
            (self.physical_class[p], 1) for p in range(n)
        ], 5))
        self.solver.add(z3.Not(self.physical_class[self.second_apex]))
        for point in range(n):
            self.solver.add(z3.Implies(
                self.member(self.second_apex, point), self.physical_class[point]
            ))
        self.solver.add(z3.PbGe([
            (self.physical_class[p], 1) for p in self.second_opp_interior
        ], 3))

        # Unused exact-five cap source and origin-tagged continuation pair.
        self.solver.add(z3.Or(*(
            self.unused == p for p in self.second_opp_cap
        )))
        self.solver.add(self.select_bool(
            self.unused,
            {p: z3.Not(self.physical_class[p]) for p in range(n)},
        ))
        physical_interior = sorted(self.second_opp_interior, key=self.position.get)
        for variable in (self.continuation_first, self.continuation_second):
            self.solver.add(z3.Or(*(variable == p for p in physical_interior)))
            self.solver.add(self.select_bool(
                variable,
                {p: self.physical_class[p] for p in physical_interior},
            ))
        self.solver.add(self.continuation_first != self.continuation_second)
        for variable in (self.continuation_first, self.continuation_second):
            self.solver.add(z3.Not(z3.Or(*(
                z3.And(
                    self.unused == source,
                    variable == point,
                    self.row_at_blocker(source, point),
                )
                for source in range(n) for point in physical_interior
            ))))

        # Original frontier pair in the retained first-apex row.
        outside_surplus = sorted(set(range(n)) - set(self.surplus_cap))
        for variable in (self.frontier_q, self.frontier_w):
            self.solver.add(z3.Or(*(variable == p for p in outside_surplus)))
            self.solver.add(self.select_bool(
                variable,
                {p: self.member(self.first_apex, p) for p in outside_surplus},
            ))
        self.solver.add(self.frontier_q != self.frontier_w)
        self.solver.add(z3.Or(
            *(
                self.frontier_q == p for p in self.first_opp_interior
            ),
            *(
                self.frontier_w == p for p in self.first_opp_interior
            ),
        ))
        self.solver.add(z3.PbGe([
            (self.member(self.first_apex, p), 1) for p in self.first_opp_interior
        ], 2))

        # The double-deletion row excludes q,w and has two strict first-cap
        # hits.  Equal radii merge both supports; unequal radii force them
        # disjoint.  Equality merging is enforced by the exact metric phase.
        for variable in (self.frontier_q, self.frontier_w):
            self.solver.add(z3.Not(self.select_bool(
                variable,
                {p: self.double_member(p) for p in range(n)},
            )))
        self.solver.add(z3.PbGe([
            (self.double_member(p), 1) for p in self.first_opp_interior
        ], 2))
        for point in range(n):
            self.solver.add(z3.Implies(
                z3.Not(self.same_frontier_radius),
                z3.Not(z3.And(
                    self.member(self.first_apex, point), self.double_member(point)
                )),
            ))

        # Exact-five all-reverse transition over every physical strict-cap
        # source.  Its actual successor blocker lies strictly between source
        # and successor in the one production shared cap order.
        for q in physical_interior:
            succ = self.successor[q]
            self.solver.add(z3.Implies(
                self.physical_class[q],
                z3.Or(*(succ == p for p in physical_interior if p != q)),
            ))
            for s in physical_interior:
                if s == q:
                    continue
                chosen = z3.And(self.physical_class[q], succ == s)
                self.solver.add(z3.Implies(chosen, self.physical_class[s]))
                self.solver.add(z3.Implies(
                    chosen, z3.Not(self.row_at_blocker(q, s))
                ))
                self.solver.add(z3.Implies(chosen, self.row_at_blocker(s, q)))
                self.solver.add(z3.Implies(
                    chosen, self.blocker[q] != self.blocker[s]
                ))
                between = [
                    p for p in physical_interior
                    if min(self.position[q], self.position[s]) < self.position[p]
                    < max(self.position[q], self.position[s])
                ]
                self.solver.add(z3.Implies(
                    chosen,
                    z3.Or(*(self.blocker[s] == p for p in between)),
                ))

        # Full global reverse-membership arm, not merely the selected cycle.
        for q, w in itertools.permutations(physical_interior, 2):
            self.solver.add(z3.Implies(
                z3.And(
                    self.physical_class[q], self.physical_class[w],
                    z3.Not(self.row_at_blocker(q, w)),
                ),
                self.row_at_blocker(w, q),
            ))

        # Period-three cycle, entry time zero, anchored at continuation.first;
        # continuation.second occurs at one of the other two positions.
        c0, c1, c2 = self.cycle
        for c in self.cycle:
            self.solver.add(z3.Or(*(c == p for p in physical_interior)))
            self.solver.add(self.select_bool(
                c, {p: self.physical_class[p] for p in physical_interior}
            ))
        self.solver.add(z3.Distinct(*self.cycle))
        self.solver.add(c0 == self.continuation_first)
        self.solver.add(z3.Or(
            self.continuation_second == c1,
            self.continuation_second == c2,
        ))
        for q in physical_interior:
            self.solver.add(z3.Implies(c0 == q, self.successor[q] == c1))
            self.solver.add(z3.Implies(c1 == q, self.successor[q] == c2))
            self.solver.add(z3.Implies(c2 == q, self.successor[q] == c0))

    def decode(self, model: z3.ModelRef) -> dict[str, object]:
        rows = {}
        choices = {}
        for center in range(self.frame.n):
            index = model.eval(self.choice[center]).as_long()
            support = self.candidates[center][index]
            rows[center] = tuple(sorted(support, key=self.position.get))
            choices[center] = index
        double_index = model.eval(self.double_choice).as_long()
        double = tuple(sorted(
            self.candidates[self.first_apex][double_index], key=self.position.get
        ))
        blockers = {
            source: model.eval(self.blocker[source]).as_long()
            for source in range(self.frame.n)
        }
        physical = tuple(
            p for p in self.order
            if z3.is_true(model.eval(self.physical_class[p], model_completion=True))
        )
        successor = {
            q: model.eval(self.successor[q]).as_long()
            for q in self.second_opp_interior if q in physical
        }
        return {
            "rows": rows,
            "choices": choices,
            "double_row": double,
            "double_choice": double_index,
            "same_frontier_radius": z3.is_true(model.eval(
                self.same_frontier_radius, model_completion=True
            )),
            "blockers": blockers,
            "physical_exact_five": physical,
            "unused": model.eval(self.unused).as_long(),
            "continuation_first": model.eval(self.continuation_first).as_long(),
            "continuation_second": model.eval(self.continuation_second).as_long(),
            "frontier_q": model.eval(self.frontier_q).as_long(),
            "frontier_w": model.eval(self.frontier_w).as_long(),
            "cycle": tuple(model.eval(c).as_long() for c in self.cycle),
            "successor": successor,
        }

    def block_assignment(self, decoded: Mapping[str, object]) -> z3.BoolRef:
        choices = decoded["choices"]
        blockers = decoded["blockers"]
        physical = set(decoded["physical_exact_five"])
        literals = [
            self.choice[center] != choices[center] for center in range(self.frame.n)
        ]
        literals.extend(
            self.blocker[source] != blockers[source] for source in range(self.frame.n)
        )
        literals.extend(
            self.physical_class[p] != (p in physical) for p in range(self.frame.n)
        )
        literals.extend([
            self.double_choice != decoded["double_choice"],
            self.same_frontier_radius != decoded["same_frontier_radius"],
            self.unused != decoded["unused"],
            self.continuation_first != decoded["continuation_first"],
            self.continuation_second != decoded["continuation_second"],
            self.frontier_q != decoded["frontier_q"],
            self.frontier_w != decoded["frontier_w"],
        ])
        for index, variable in enumerate(self.cycle):
            literals.append(variable != decoded["cycle"][index])
        for q, value in decoded["successor"].items():
            literals.append(self.successor[q] != value)
        return z3.Or(*literals)

    def named_payload(self, decoded: Mapping[str, object]) -> dict[str, object]:
        def name(point: int) -> str:
            return self.by_label[point]

        return {
            "cyclic_order": list(ROLE_NAMES),
            "numeric_census_order": list(self.order),
            "rows": {
                name(center): [name(p) for p in decoded["rows"][center]]
                for center in self.order
            },
            "candidate_indices": {
                name(center): decoded["choices"][center] for center in self.order
            },
            "blockers": {
                name(source): name(decoded["blockers"][source])
                for source in self.order
            },
            "physical_exact_five": [name(p) for p in decoded["physical_exact_five"]],
            "frontier": {
                "q": name(decoded["frontier_q"]),
                "w": name(decoded["frontier_w"]),
                "retained_row": [name(p) for p in decoded["rows"][self.first_apex]],
                "double_row": [name(p) for p in decoded["double_row"]],
                "double_row_candidate_index": decoded["double_choice"],
                "same_radius": decoded["same_frontier_radius"],
            },
            "exact_five": {
                "unused": name(decoded["unused"]),
                "continuation_first": name(decoded["continuation_first"]),
                "continuation_second": name(decoded["continuation_second"]),
                "cycle": [name(p) for p in decoded["cycle"]],
                "successor": {
                    name(q): name(s) for q, s in decoded["successor"].items()
                },
            },
        }


class EqualityQuotient:
    def __init__(self, surface: Surface, decoded: Mapping[str, object]) -> None:
        self.surface = surface
        self.edges = tuple(itertools.combinations(surface.order, 2))
        self.edge_index = {edge: index for index, edge in enumerate(self.edges)}
        parent = list(range(len(self.edges)))

        def find(value: int) -> int:
            if parent[value] != value:
                parent[value] = find(parent[value])
            return parent[value]

        def union(left: int, right: int) -> None:
            left = find(left)
            right = find(right)
            if left != right:
                parent[right] = left

        self.direct_rows: list[tuple[str, int, tuple[int, ...]]] = []

        def add_row(name: str, center: int, support: Iterable[int]) -> None:
            support = tuple(support)
            ids = [self.edge_id(center, point) for point in support]
            for edge_id in ids[1:]:
                union(ids[0], edge_id)
            self.direct_rows.append((name, center, support))

        for center in surface.order:
            add_row(surface.by_label[center], center, decoded["rows"][center])
        add_row("frontierDouble", surface.first_apex, decoded["double_row"])

        physical = tuple(decoded["physical_exact_five"])
        physical_ids = [self.edge_id(surface.second_apex, p) for p in physical]
        for edge_id in physical_ids[1:]:
            union(physical_ids[0], edge_id)
        if decoded["same_frontier_radius"]:
            union(
                self.edge_id(surface.first_apex, decoded["rows"][surface.first_apex][0]),
                self.edge_id(surface.first_apex, decoded["double_row"][0]),
            )

        components: dict[int, list[int]] = defaultdict(list)
        for edge_id in range(len(self.edges)):
            components[find(edge_id)].append(edge_id)
        ordered = sorted(
            (tuple(sorted(items)) for items in components.values()),
            key=lambda items: items[0],
        )
        self.classes = [0] * len(self.edges)
        for class_id, items in enumerate(ordered):
            for edge_id in items:
                self.classes[edge_id] = class_id
        self.class_count = len(ordered)

    def edge(self, left: int, right: int) -> tuple[int, int]:
        if left == right:
            raise ValueError("distance edge has equal endpoints")
        return ((left, right) if self.surface.position[left] < self.surface.position[right]
                else (right, left))

    def edge_id(self, left: int, right: int) -> int:
        return self.edge_index[self.edge(left, right)]

    def class_of(self, left: int, right: int) -> int:
        return self.classes[self.edge_id(left, right)]

    def exactness_conflict(self, decoded: Mapping[str, object]) -> dict[str, object] | None:
        rows = decoded["rows"]
        for source, center in decoded["blockers"].items():
            support = set(rows[center])
            anchor = next(iter(support))
            radius_class = self.class_of(center, anchor)
            for point in self.surface.order:
                if point == center or point in support:
                    continue
                if self.class_of(center, point) == radius_class:
                    return {
                        "kind": "exact_blocker_row_closure_conflict",
                        "source": self.surface.by_label[source],
                        "center": self.surface.by_label[center],
                        "outside": self.surface.by_label[point],
                    }
        physical = set(decoded["physical_exact_five"])
        anchor = next(iter(physical))
        radius_class = self.class_of(self.surface.second_apex, anchor)
        for point in self.surface.order:
            if point == self.surface.second_apex or point in physical:
                continue
            if self.class_of(self.surface.second_apex, point) == radius_class:
                return {
                    "kind": "physical_exact_five_closure_conflict",
                    "outside": self.surface.by_label[point],
                }
        return None

    def production_cycle(self) -> dict[str, object] | None:
        relations: dict[tuple[int, int], dict[str, object]] = {}
        order = self.surface.order
        for a_i, b_i, c_i, d_i in itertools.combinations(range(len(order)), 4):
            a, b, c, d = order[a_i], order[b_i], order[c_i], order[d_i]
            # Production diagonalEqLastSide (audit k1CancelC): row c has a,d,
            # hence d(a,b) < d(b,d).
            for name, center, support in self.direct_rows:
                support_set = set(support)
                if center == c and {a, d} <= support_set:
                    smaller = self.class_of(a, b)
                    larger = self.class_of(b, d)
                    relations.setdefault((smaller, larger), {
                        "constructor": "diagonalEqLastSide",
                        "quadruple": [self.surface.by_label[x] for x in (a, b, c, d)],
                        "row": name,
                        "row_support": [self.surface.by_label[x] for x in support],
                        "smaller": smaller,
                        "larger": larger,
                    })
                # Production diagonalEqSide (audit k2CancelA): row a has c,d,
                # hence d(b,c) < d(b,d).
                if center == a and {c, d} <= support_set:
                    smaller = self.class_of(b, c)
                    larger = self.class_of(b, d)
                    relations.setdefault((smaller, larger), {
                        "constructor": "diagonalEqSide",
                        "quadruple": [self.surface.by_label[x] for x in (a, b, c, d)],
                        "row": name,
                        "row_support": [self.surface.by_label[x] for x in support],
                        "smaller": smaller,
                        "larger": larger,
                    })
        for (source, target), step in relations.items():
            if source == target:
                return {"length": 1, "steps": [step]}
        for (source, target), step in relations.items():
            reverse = relations.get((target, source))
            if reverse is not None and source < target:
                return {"length": 2, "steps": [step, reverse]}
        adjacency: dict[int, list[tuple[int, dict[str, object]]]] = defaultdict(list)
        for (source, target), step in relations.items():
            adjacency[source].append((target, step))
        for start in range(self.class_count):
            parent: dict[int, tuple[int, dict[str, object]] | None] = {start: None}
            pending: deque[int] = deque([start])
            while pending:
                current = pending.popleft()
                for target, step in adjacency[current]:
                    if target == start:
                        reversed_steps = [step]
                        cursor = current
                        while cursor != start:
                            previous = parent[cursor]
                            assert previous is not None
                            cursor, prior_step = previous
                            reversed_steps.append(prior_step)
                        return {
                            "length": len(reversed_steps),
                            "steps": list(reversed(reversed_steps)),
                        }
                    if target not in parent:
                        parent[target] = (current, step)
                        pending.append(target)
        return None


def frac(value: z3.ArithRef) -> Fraction:
    if not z3.is_rational_value(value):
        raise TypeError(f"non-rational LRA model value: {value}")
    return Fraction(value.numerator_as_long(), value.denominator_as_long())


def full_metric_model(
    surface: Surface, decoded: Mapping[str, object], timeout_ms: int
) -> tuple[str, dict[str, str] | str]:
    solver = z3.Solver()
    solver.set(timeout=timeout_ms)
    table = {
        (left, right): z3.Real(f"d_{left}_{right}")
        for left, right in itertools.combinations(surface.order, 2)
    }

    def dist(left: int, right: int) -> z3.ArithRef:
        if left == right:
            return z3.RealVal(0)
        edge = ((left, right) if surface.position[left] < surface.position[right]
                else (right, left))
        return table[edge]

    for variable in table.values():
        solver.add(variable >= 1)
    for a_i, b_i, c_i, d_i in itertools.combinations(range(len(surface.order)), 4):
        a, b, c, d = (
            surface.order[index] for index in (a_i, b_i, c_i, d_i)
        )
        diagonals = dist(a, c) + dist(b, d)
        solver.add(diagonals >= dist(a, b) + dist(c, d) + 1)
        solver.add(diagonals >= dist(a, d) + dist(b, c) + 1)
    for a, b, c in itertools.combinations(surface.order, 3):
        solver.add(dist(a, b) + dist(b, c) >= dist(a, c))
        solver.add(dist(a, c) + dist(b, c) >= dist(a, b))
        solver.add(dist(a, b) + dist(a, c) >= dist(b, c))

    def add_equal_class(center: int, support: Sequence[int]) -> None:
        anchor = support[0]
        for point in support[1:]:
            solver.add(dist(center, point) == dist(center, anchor))

    for center in surface.order:
        add_equal_class(center, decoded["rows"][center])
    add_equal_class(surface.first_apex, decoded["double_row"])
    add_equal_class(surface.second_apex, decoded["physical_exact_five"])
    if decoded["same_frontier_radius"]:
        solver.add(
            dist(surface.first_apex, decoded["rows"][surface.first_apex][0])
            == dist(surface.first_apex, decoded["double_row"][0])
        )
    else:
        solver.add(
            dist(surface.first_apex, decoded["rows"][surface.first_apex][0])
            != dist(surface.first_apex, decoded["double_row"][0])
        )

    # Full-filter exactness at every actual blocker row and at the physical
    # exact-five apex.
    for center in set(decoded["blockers"].values()):
        support = decoded["rows"][center]
        anchor = support[0]
        for point in surface.order:
            if point != center and point not in support:
                solver.add(dist(center, point) != dist(center, anchor))
    physical = set(decoded["physical_exact_five"])
    anchor = next(iter(physical))
    for point in surface.order:
        if point != surface.second_apex and point not in physical:
            solver.add(
                dist(surface.second_apex, point)
                != dist(surface.second_apex, anchor)
            )

    status = solver.check()
    if status == z3.unknown:
        return "UNKNOWN", solver.reason_unknown()
    if status == z3.unsat:
        return "UNSAT", "exact QF_LRA"
    model = solver.model()
    values = {
        f"{surface.by_label[left]},{surface.by_label[right]}": str(
            frac(model.eval(variable, model_completion=True))
        )
        for (left, right), variable in table.items()
    }
    return "SAT", values


def run(args: argparse.Namespace) -> dict[str, object]:
    started = time.monotonic()
    deadline = started + args.wall_seconds
    if args.log.exists():
        args.log.unlink()
    surface = Surface(
        timeout_ms=args.outer_timeout_ms,
        random_seed=args.random_seed,
        threads=args.threads,
    )
    counts = defaultdict(int)
    terminal: dict[str, object] | None = None
    for attempt in range(1, args.max_attempts + 1):
        remaining_ms = int((deadline - time.monotonic()) * 1000)
        if remaining_ms <= 0:
            terminal = {"status": "UNKNOWN_FAIL_CLOSED", "reason": "wall budget"}
            break
        surface.solver.set(timeout=min(args.outer_timeout_ms, remaining_ms))
        status = surface.solver.check()
        if status == z3.unknown:
            terminal = {
                "status": "UNKNOWN_FAIL_CLOSED",
                "reason": surface.solver.reason_unknown(),
            }
            break
        if status == z3.unsat:
            terminal = {
                "status": "UNSAT_EXHAUSTIVE_Z3_OUTER",
                "reason": "all exact decoded assignments rejected",
            }
            break
        decoded = surface.decode(surface.solver.model())
        rows = [
            shadow.ClassRow(
                f"global:{center}", center, frozenset(decoded["rows"][center]),
                exact=center in set(decoded["blockers"].values()),
            )
            for center in surface.order
        ]
        rows.append(shadow.ClassRow(
            "frontierDouble", surface.first_apex,
            frozenset(decoded["double_row"]), exact=False,
        ))
        ok, reason = shadow.verify_assignment(
            surface.frame, set(mc.PROVEN_ROWS), rows
        )
        if not ok:
            kind = "current_shadow_verifier_reject"
            detail: object = reason
        else:
            quotient = EqualityQuotient(surface, decoded)
            conflict = quotient.exactness_conflict(decoded)
            if conflict is not None:
                kind = "exactness_reject"
                detail = conflict
            else:
                cycle = quotient.production_cycle()
                if cycle is not None:
                    kind = "production_ordinal_cycle"
                    detail = cycle
                else:
                    metric_status, metric_payload = full_metric_model(
                        surface, decoded,
                        min(args.metric_timeout_ms, max(1, remaining_ms)),
                    )
                    if metric_status == "SAT":
                        terminal = {
                            "status": "SAT_VERIFIED_LIVE_FIELD_KALMANSON_SHADOW",
                            "assignment": surface.named_payload(decoded),
                            "numeric_assignment_sha256": canonical_sha256(decoded),
                            "distances": metric_payload,
                            "distance_table_sha256": canonical_sha256(metric_payload),
                            "ordinal_cycle": None,
                        }
                        break
                    if metric_status == "UNKNOWN":
                        terminal = {
                            "status": "UNKNOWN_FAIL_CLOSED",
                            "reason": metric_payload,
                            "stage": "fixed_assignment_full_metric",
                        }
                        break
                    kind = "full_metric_unsat"
                    detail = metric_payload
        counts[kind] += 1
        event = {
            "attempt": attempt,
            "kind": kind,
            "detail": detail,
            "assignment_sha256": canonical_sha256(decoded),
            "elapsed_seconds": time.monotonic() - started,
        }
        append_event(args.log, event)
        if attempt == 1 or attempt % 25 == 0:
            print(json.dumps(event, sort_keys=True), flush=True)
        surface.solver.add(surface.block_assignment(decoded))
    else:
        terminal = {
            "status": "UNKNOWN_FAIL_CLOSED",
            "reason": "attempt budget",
        }
    assert terminal is not None
    terminal.update({
        "schema": SCHEMA,
        "epistemic_status": (
            "EXACT_FIXED_14_ROLE_ABSTRACT_KALMANSON_SHADOW; "
            "NOT_PLANAR_EUCLIDEAN_REALIZABILITY; NOT_LIVE_PARENT_COVERAGE"
        ),
        "live_cap_profile": list(LIVE_CAP_PROFILE),
        "census_profile": list(CENSUS_PROFILE),
        "current_numeric_order": list(surface.order),
        "role_names": list(ROLE_NAMES),
        "caps": {
            "surplus": [surface.by_label[p] for p in surface.order if p in surface.surplus_cap],
            "first_opposite": [surface.by_label[p] for p in surface.order if p in surface.first_opp_cap],
            "second_opposite": [surface.by_label[p] for p in surface.order if p in surface.second_opp_cap],
        },
        "candidate_counts": {
            surface.by_label[c]: len(surface.candidates[c]) for c in surface.order
        },
        "rejection_counts": dict(sorted(counts.items())),
        "attempts": sum(counts.values()) + int(terminal["status"].startswith("SAT")),
        "elapsed_seconds": time.monotonic() - started,
        "source_sha256": {
            "census/multi_center/multi_center_census.py": file_sha256(
                ROOT / "census/multi_center/multi_center_census.py"
            ),
            "census/global_confinement/shadow.py": file_sha256(
                ROOT / "census/global_confinement/shadow.py"
            ),
            "search.py": file_sha256(Path(__file__).resolve()),
        },
        "symmetry": {
            "quotient": "none",
            "reason": (
                "first/second apices, ordered cap roles, frontier q/w fields, "
                "continuation.first, and oriented transition are distinguished"
            ),
        },
        "omitted_live_fields": [
            "planar Euclidean rank/PSD and coordinate realizability",
            "minimum-enclosing-circle inequalities beyond current candidate rows",
            "global noM44 for alternative support triangles",
            "full radius filters away from blocker rows and the physical exact-five class",
            "metric meaning of deletion-survival rows not retained as named supports",
        ],
    })
    atomic_json(args.output, terminal)
    append_event(args.log, {
        "terminal_status": terminal["status"],
        "elapsed_seconds": terminal["elapsed_seconds"],
        "attempts": terminal["attempts"],
    })
    return terminal


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path, default=DEFAULT_OUTPUT)
    parser.add_argument("--log", type=Path, default=DEFAULT_LOG)
    parser.add_argument("--wall-seconds", type=float, default=300.0)
    parser.add_argument("--outer-timeout-ms", type=int, default=30_000)
    parser.add_argument("--metric-timeout-ms", type=int, default=30_000)
    parser.add_argument("--max-attempts", type=int, default=10_000)
    parser.add_argument("--random-seed", type=int, default=0)
    parser.add_argument("--threads", type=int, default=8)
    args = parser.parse_args()
    if args.wall_seconds <= 0 or args.wall_seconds > 1800:
        raise SystemExit("wall-seconds must lie in (0,1800]")
    if not 1 <= args.threads <= 16:
        raise SystemExit("threads must lie in [1,16]")
    result = run(args)
    print(json.dumps({
        "status": result["status"],
        "attempts": result["attempts"],
        "elapsed_seconds": result["elapsed_seconds"],
        "rejection_counts": result["rejection_counts"],
    }, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
