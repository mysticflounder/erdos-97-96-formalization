#!/usr/bin/env python3
"""Source-faithful n=14 all-center gate for the exact-six mutual branch.

The Boolean outer quantifies one selected K4 row at every actual carrier
center and one actual critical blocker for every actual source.  A fixed outer
model is checked against the complete strict Kalmanson/triangle LRA surface,
then against exact blocker-row filters and the full ``no_qfree_at`` semantic.

This is theorem-discovery only.  SAT is an exact rational abstract-distance
shadow, not a planar Euclidean, MEC, minimal-counterexample, or no-M44 model.
UNSAT is a bounded solver verdict until its emitted cuts are certified.
"""

from __future__ import annotations

import argparse
import hashlib
import itertools
import json
import subprocess
import tempfile
import time
from collections import defaultdict
from fractions import Fraction
from pathlib import Path
from typing import Iterable, Sequence

import sympy as sp
import z3


N = 14
VERTICES = tuple(range(N))

# For surplusIdx = 0 the boundary order is
# v1, I3, v2, I1, v3, I2.  The exact-six physical cap is C3 and
# its opposite physical apex is v3.
SURPLUS_CAP = frozenset((5, 6, 7, 8, 9))
OPP_CAP1 = frozenset((9, 10, 11, 12, 13, 0))
PHYSICAL_CAP = frozenset((0, 1, 2, 3, 4, 5))
CAPS = (SURPLUS_CAP, OPP_CAP1, PHYSICAL_CAP)
CAP_ENDPOINTS = ((5, 9), (9, 0), (0, 5))
PHYSICAL_INTERIOR = frozenset((1, 2, 3, 4))
FIRST_APEX = 5
SECOND_APEX = 9

ORBITS = (
    "continuationOrder",
    "reverseContinuationOrder",
    "sharesFirstAtSource",
    "sharesFirstAtTarget",
    "sharesSecondAtSource",
    "sharesSecondAtTarget",
    "fourDistinct",
)

HERE = Path(__file__).resolve().parent
TRANSPORTED_SCHEMA_BANK = (
    HERE.parent
    / "generic-biapex-kalmanson-search"
    / "round2-core-normal-forms"
    / "transported_2k3_bank.json"
)


def q(value: z3.RatNumRef) -> Fraction:
    return Fraction(value.numerator_as_long(), value.denominator_as_long())


def qstr(value: Fraction) -> str:
    if value.denominator == 1:
        return str(value.numerator)
    return f"{value.numerator}/{value.denominator}"


def bounded_timeout_ms(default_ms: int, deadline: float) -> int | None:
    remaining = int((deadline - time.monotonic()) * 1000)
    if remaining <= 0:
        return None
    return max(1, min(default_ms, remaining))


def edge(left: int, right: int) -> tuple[int, int]:
    if left == right:
        raise ValueError("distance edge loop")
    return tuple(sorted((left, right)))


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def reflected_schema(
    vertex_count: int,
    schema: tuple[tuple[int, int], ...],
) -> tuple[tuple[int, int], ...]:
    return tuple(sorted(
        (vertex_count - 1 - center, vertex_count - 1 - point)
        for center, point in schema
    ))


def load_transported_schema_applications() -> dict[str, object]:
    """Expand the 20 verified canonical schemas, but do not assert them.

    The returned incidence index is a separation oracle: only schemas seen in
    an actual outer model are added as clauses.  This preserves a small,
    independently replayable proof-facing ledger instead of preloading the
    old million-clause transported bank.
    """
    payload = json.loads(TRANSPORTED_SCHEMA_BANK.read_text(encoding="utf-8"))
    if payload.get("schema") != "p97-whole-carrier-kalmanson-transported-schema-bank-v1":
        raise ValueError("unexpected transported schema bank")
    if payload.get("schema_count") != len(payload.get("schemas", ())):
        raise ValueError("transported schema count mismatch")

    unique: dict[tuple[tuple[int, int], ...], dict[str, object]] = {}
    for schema_index, record in enumerate(payload["schemas"]):
        vertex_count = int(record["core_vertex_count"])
        schema = tuple(sorted(tuple(item) for item in record["order_schema"]))
        orientations = (("forward", schema), ("reverse", reflected_schema(vertex_count, schema)))
        for embedding in itertools.combinations(VERTICES, vertex_count):
            for orientation, oriented in orientations:
                memberships = tuple(sorted(
                    (embedding[center], embedding[point])
                    for center, point in oriented
                ))
                unique.setdefault(memberships, {
                    "schema_index": schema_index,
                    "orientation": orientation,
                    "embedding": embedding,
                    "required_memberships": memberships,
                })

    frequency: dict[tuple[int, int], int] = defaultdict(int)
    for memberships in unique:
        for membership in memberships:
            frequency[membership] += 1
    index: dict[tuple[int, int], list[dict[str, object]]] = defaultdict(list)
    for memberships, application in unique.items():
        pivot = min(memberships, key=lambda item: (frequency[item], item))
        index[pivot].append(application)
    for applications in index.values():
        applications.sort(key=lambda item: (
            item["schema_index"], item["embedding"], item["orientation"]
        ))
    applications = [unique[key] for key in sorted(unique)]
    return {
        "schema_count": len(payload["schemas"]),
        "application_count": len(unique),
        "sha256": sha256(TRANSPORTED_SCHEMA_BANK),
        "index": index,
        "applications": applications,
    }


def matching_schema_applications(
    rows: dict[int, tuple[int, ...]],
    bank: dict[str, object],
) -> list[dict[str, object]]:
    memberships = {
        (center, point)
        for center, support in rows.items()
        for point in support
    }
    matches: dict[tuple[tuple[int, int], ...], dict[str, object]] = {}
    index = bank["index"]
    for pivot in sorted(memberships):
        for application in index.get(pivot, ()):
            required = application["required_memberships"]
            if all(membership in memberships for membership in required):
                matches[required] = application
    return [matches[key] for key in sorted(matches)]


def canonical_metric_membership_schema(
    core: Sequence[str],
) -> dict[str, object] | None:
    """Canonical positive-row projection of an order-transportable core."""
    if any(name.startswith("apex_shell_") for name in core):
        return None
    vertices = tuple(sorted({
        int(field)
        for name in core
        for field in name.split("_")[1:]
        if field.isdigit()
    }))
    role = {vertex: index for index, vertex in enumerate(vertices)}
    memberships = set()
    for name in core:
        fields = name.split("_")
        if fields[0] != "row":
            continue
        center, left, right = map(int, fields[1:])
        memberships.update(((role[center], role[left]), (role[center], role[right])))
    if not memberships:
        return None
    schema = tuple(sorted(memberships))
    reflected = reflected_schema(len(vertices), schema)
    return {
        "core_vertex_count": len(vertices),
        "order_schema": min(schema, reflected),
        "source_vertices": vertices,
    }


def expand_metric_membership_schema(
    schema_record: dict[str, object],
) -> tuple[tuple[tuple[int, int], ...], ...]:
    vertex_count = int(schema_record["core_vertex_count"])
    schema = tuple(schema_record["order_schema"])
    applications = set()
    for embedding in itertools.combinations(VERTICES, vertex_count):
        for oriented in (schema, reflected_schema(vertex_count, schema)):
            applications.add(tuple(sorted(
                (embedding[center], embedding[point])
                for center, point in oriented
            )))
    return tuple(sorted(applications))


def load_learned_metric_schema_bank(
    path: Path,
    max_vertex_count: int,
) -> dict[str, object]:
    payload = json.loads(path.read_text(encoding="utf-8"))
    expected = "p97-exact6-allcenter-minimized-metric-schema-bank-v1"
    if payload.get("schema") != expected:
        raise ValueError("unexpected learned metric schema bank")
    selected = [
        record for record in payload["schemas"]
        if int(record["core_vertex_count"]) <= max_vertex_count
    ]
    applications = set()
    for record in selected:
        canonical = {
            "core_vertex_count": int(record["core_vertex_count"]),
            "order_schema": tuple(sorted(tuple(item) for item in record["order_schema"])),
        }
        expanded = expand_metric_membership_schema(canonical)
        if len(expanded) != int(record["complete_application_count"]):
            raise ValueError("learned metric schema application count drift")
        applications.update(expanded)
    return {
        "path": path,
        "sha256": sha256(path),
        "max_vertex_count": max_vertex_count,
        "selected_schema_count": len(selected),
        "application_count": len(applications),
        "applications": tuple(sorted(applications)),
    }


def strongly_connected(rows: dict[int, tuple[int, ...]]) -> tuple[bool, list[set[int]]]:
    """Return strong connectivity and the sink SCCs used for lazy cuts."""
    adjacency = {center: set(support) for center, support in rows.items()}
    reverse = {vertex: set() for vertex in VERTICES}
    for source, targets in adjacency.items():
        for target in targets:
            reverse[target].add(source)

    seen: set[int] = set()
    order: list[int] = []

    def visit(vertex: int) -> None:
        if vertex in seen:
            return
        seen.add(vertex)
        for target in adjacency[vertex]:
            visit(target)
        order.append(vertex)

    for vertex in VERTICES:
        visit(vertex)

    components: list[set[int]] = []
    assigned: set[int] = set()

    def collect(vertex: int, component: set[int]) -> None:
        if vertex in assigned:
            return
        assigned.add(vertex)
        component.add(vertex)
        for source in reverse[vertex]:
            collect(source, component)

    for vertex in reversed(order):
        if vertex not in assigned:
            component: set[int] = set()
            collect(vertex, component)
            components.append(component)

    if len(components) == 1:
        return True, []
    sink_components = [
        component
        for component in components
        if all(target in component for source in component for target in adjacency[source])
    ]
    if not sink_components:
        raise AssertionError("condensation graph has no sink SCC")
    return False, sink_components


class Outer:
    """Lazy structural quantifier for one exact-six role orbit."""

    def __init__(
        self,
        orbit: str,
        timeout_ms: int,
        random_seed: int,
        engine: str,
    ) -> None:
        if orbit not in ORBITS:
            raise ValueError(orbit)
        self.orbit = orbit
        self.solver = z3.SolverFor("QF_FD") if engine == "qffd" else z3.Solver()
        self.solver.set(timeout=timeout_ms, random_seed=random_seed)
        self.member = {
            (center, point): z3.Bool(f"m_{center}_{point}")
            for center in VERTICES
            for point in VERTICES
        }
        self.blocker = [z3.Int(f"blocker_{source}") for source in VERTICES]
        self.shell = [z3.Bool(f"shell_{point}") for point in VERTICES]
        self.first = z3.Int("role_first")
        self.second = z3.Int("role_second")
        self.source = z3.Int("role_source")
        self.target = z3.Int("role_target")
        self.unused = z3.Int("role_unused")
        self._add_base()

    def member_at_center(self, center: z3.ArithRef, point: int) -> z3.BoolRef:
        return z3.Or(*(
            z3.And(center == candidate, self.member[candidate, point])
            for candidate in VERTICES
        ))

    def member_at(self, center: z3.ArithRef, point: z3.ArithRef) -> z3.BoolRef:
        return z3.Or(*(
            z3.And(
                center == candidate_center,
                point == candidate_point,
                self.member[candidate_center, candidate_point],
            )
            for candidate_center in VERTICES
            for candidate_point in VERTICES
        ))

    def select_blocker(self, source: z3.ArithRef) -> z3.ArithRef:
        answer: z3.ArithRef = self.blocker[-1]
        for candidate in reversed(VERTICES[:-1]):
            answer = z3.If(source == candidate, self.blocker[candidate], answer)
        return answer

    def is_physical(self, point: z3.ArithRef) -> z3.BoolRef:
        return z3.Or(*(
            z3.And(point == candidate, self.shell[candidate])
            for candidate in sorted(PHYSICAL_INTERIOR)
        ))

    def _add_base(self) -> None:
        solver = self.solver
        m = self.member

        # One actual selected K4 row at every carrier center.
        for center in VERTICES:
            solver.add(z3.Not(m[center, center]))
            solver.add(z3.PbEq([(m[center, point], 1) for point in VERTICES], 4))

        # The two generic finite incidence bounds extracted from the live surface.
        for left, right in itertools.combinations(VERTICES, 2):
            solver.add(z3.PbLe([
                (z3.And(m[left, point], m[right, point]), 1)
                for point in VERTICES
            ], 2))
        for first, second in itertools.combinations(VERTICES, 2):
            solver.add(z3.PbLe([
                (z3.And(m[center, first], m[center, second]), 1)
                for center in VERTICES
            ], 2))

        # If two boundary centers bisect the same target pair, the center
        # chord and target chord lie on one perpendicular-bisector line.  A
        # strictly convex boundary therefore forces their four endpoints to
        # alternate.  This is the theorem-level Boolean normal form of the
        # ubiquitous two-row Kalmanson core, not a mined cut bank.
        for center_left, center_right in itertools.combinations(VERTICES, 2):
            remaining = tuple(
                point for point in VERTICES
                if point not in {center_left, center_right}
            )
            for point_left, point_right in itertools.combinations(remaining, 2):
                left_inside = center_left < point_left < center_right
                right_inside = center_left < point_right < center_right
                if left_inside != right_inside:
                    continue
                solver.add(z3.Not(z3.And(
                    m[center_left, point_left],
                    m[center_left, point_right],
                    m[center_right, point_left],
                    m[center_right, point_right],
                )))

        # Every cap is one exact contiguous boundary block.  A row centered in
        # that cap has at most two cap hits; an endpoint row has at most one.
        for cap, endpoints in zip(CAPS, CAP_ENDPOINTS, strict=True):
            for center in sorted(cap):
                solver.add(z3.PbLe([(m[center, point], 1) for point in cap], 2))
            for center in endpoints:
                solver.add(z3.PbLe([(m[center, point], 1) for point in cap], 1))

            # Two distinct cap centers cannot share a pair outside the cap.
            outside = sorted(set(VERTICES) - cap)
            for center_left, center_right in itertools.combinations(sorted(cap), 2):
                for point_left, point_right in itertools.combinations(outside, 2):
                    solver.add(z3.Not(z3.And(
                        m[center_left, point_left],
                        m[center_left, point_right],
                        m[center_right, point_left],
                        m[center_right, point_right],
                    )))

        # The exact-five second-apex radius class and the corrected exact-six
        # physical distribution.  Its strict physical-cap part has size 3 or 4.
        solver.add(z3.Not(self.shell[SECOND_APEX]))
        solver.add(z3.PbEq([(self.shell[point], 1) for point in VERTICES], 5))
        physical_count = z3.Sum(*(
            z3.If(self.shell[point], 1, 0) for point in sorted(PHYSICAL_INTERIOR)
        ))
        solver.add(z3.Or(physical_count == 3, physical_count == 4))
        if self.orbit == "fourDistinct":
            solver.add(physical_count == 4)
        surplus_hits = z3.Sum(*(
            z3.If(self.shell[point], 1, 0) for point in sorted(SURPLUS_CAP)
        ))
        first_opp_hits = z3.Sum(*(
            z3.If(self.shell[point], 1, 0) for point in sorted(OPP_CAP1)
        ))
        solver.add(z3.Implies(physical_count == 3, surplus_hits == 1))
        solver.add(z3.Implies(physical_count == 3, first_opp_hits == 1))
        solver.add(surplus_hits <= 1, first_opp_hits <= 1)
        for point in VERTICES:
            solver.add(z3.Implies(m[SECOND_APEX, point], self.shell[point]))

        # The complete physical-apex shell participates in the same convex
        # perpendicular-bisector alternation as a selected row.  This must be
        # stated separately from the selected-row/selected-row rule above:
        # the selected K4 row at the physical apex may omit one member of its
        # exact-five radius class.
        for center in VERTICES:
            if center == SECOND_APEX:
                continue
            for point_left, point_right in itertools.combinations(VERTICES, 2):
                if point_left in {center, SECOND_APEX}:
                    continue
                if point_right in {center, SECOND_APEX}:
                    continue
                center_inside = point_left < center < point_right
                apex_inside = point_left < SECOND_APEX < point_right
                if center_inside != apex_inside:
                    continue
                solver.add(z3.Not(z3.And(
                    self.shell[point_left],
                    self.shell[point_right],
                    m[center, point_left],
                    m[center, point_right],
                )))

        # Actual role identities.  All four named physical roles remain source
        # variables; the orbit equations are imposed without literal relabeling.
        for role in (self.first, self.second, self.source, self.target):
            solver.add(0 <= role, role < N, self.is_physical(role))
        solver.add(self.first != self.second, self.source != self.target)
        if self.orbit == "continuationOrder":
            solver.add(self.source == self.first, self.target == self.second)
        elif self.orbit == "reverseContinuationOrder":
            solver.add(self.source == self.second, self.target == self.first)
        elif self.orbit == "sharesFirstAtSource":
            solver.add(self.source == self.first, self.target != self.second)
        elif self.orbit == "sharesFirstAtTarget":
            solver.add(self.target == self.first, self.source != self.second)
        elif self.orbit == "sharesSecondAtSource":
            solver.add(
                self.source == self.second,
                self.target != self.first,
                self.target != self.second,
            )
        elif self.orbit == "sharesSecondAtTarget":
            solver.add(
                self.target == self.second,
                self.source != self.first,
                self.source != self.second,
            )
        else:
            solver.add(z3.Distinct(self.first, self.second, self.source, self.target))

        solver.add(0 <= self.unused, self.unused < N)
        solver.add(z3.Or(*(
            self.unused == point for point in sorted(PHYSICAL_CAP)
        )))
        for point in VERTICES:
            solver.add(z3.Implies(self.unused == point, z3.Not(self.shell[point])))

        # One actual H.centerAt blocker for every source.  The blocker row is
        # the source's complete selected critical support and contains source.
        for source in VERTICES:
            blocker = self.blocker[source]
            solver.add(0 <= blocker, blocker < N)
            solver.add(blocker != source, blocker != FIRST_APEX, blocker != SECOND_APEX)
            for center in VERTICES:
                solver.add(z3.Implies(blocker == center, m[center, source]))

        unused_blocker = self.select_blocker(self.unused)
        source_blocker = self.select_blocker(self.source)
        target_blocker = self.select_blocker(self.target)

        # Complete exact-six named rows.
        solver.add(z3.Not(self.member_at(unused_blocker, self.first)))
        solver.add(z3.Not(self.member_at(unused_blocker, self.second)))
        solver.add(z3.Sum(*(
            z3.If(z3.And(self.shell[p], self.member_at_center(unused_blocker, p)), 1, 0)
            for p in sorted(PHYSICAL_INTERIOR)
        )) <= 1)
        solver.add(z3.Not(self.member_at(source_blocker, self.target)))
        solver.add(z3.Not(self.member_at(target_blocker, self.source)))
        solver.add(source_blocker != target_blocker)

        # Every physical source's actual critical support has at most two hits
        # in the complete physical exact-five strict-cap set.
        for source in sorted(PHYSICAL_INTERIOR):
            hit_count = z3.Sum(*(
                z3.If(
                    z3.And(self.shell[point], self.member_at_center(self.blocker[source], point)),
                    1,
                    0,
                )
                for point in sorted(PHYSICAL_INTERIOR)
            ))
            solver.add(z3.Implies(self.shell[source], hit_count <= 2))

    def decode(self, model: z3.ModelRef) -> dict[str, object]:
        rows: dict[int, tuple[int, ...]] = {}
        for center in VERTICES:
            rows[center] = tuple(
                point for point in VERTICES
                if z3.is_true(model.eval(self.member[center, point], model_completion=True))
            )
            if len(rows[center]) != 4 or center in rows[center]:
                raise AssertionError((center, rows[center]))
        blockers = tuple(model.eval(item).as_long() for item in self.blocker)
        shell = tuple(
            point for point in VERTICES
            if z3.is_true(model.eval(self.shell[point], model_completion=True))
        )
        roles = {
            "first": model.eval(self.first).as_long(),
            "second": model.eval(self.second).as_long(),
            "source": model.eval(self.source).as_long(),
            "target": model.eval(self.target).as_long(),
            "unused": model.eval(self.unused).as_long(),
        }
        return {"rows": rows, "blockers": blockers, "shell": shell, "roles": roles}

    def add_connectivity_cut(self, component: set[int]) -> None:
        self.solver.add(z3.Or(*(
            self.member[center, point]
            for center in sorted(component)
            for point in VERTICES
            if point not in component
        )))

    def add_metric_core_cut(
        self,
        memberships: Iterable[tuple[int, int]],
        shell: Sequence[int],
        condition_on_shell: bool,
    ) -> None:
        disjuncts: list[z3.BoolRef] = [
            z3.Not(self.member[center, point])
            for center, point in sorted(set(memberships))
        ]
        # Apex-shell equalities in a core are cell-specific, so condition the
        # cut on the complete decoded exact-five class.
        if condition_on_shell:
            shell_set = set(shell)
            disjuncts.extend(
                self.shell[point] != z3.BoolVal(point in shell_set)
                for point in VERTICES
            )
        self.solver.add(z3.Or(*disjuncts))

    def add_transported_schema_cut(
        self,
        memberships: Iterable[tuple[int, int]],
    ) -> None:
        required = tuple(sorted(set(memberships)))
        if len(required) != 6:
            raise AssertionError(f"transported 2K3 schema has {len(required)} memberships")
        self.solver.add(z3.Or(*(
            z3.Not(self.member[center, point])
            for center, point in required
        )))

    def preload_transported_schema_closure(
        self,
        applications: Sequence[dict[str, object]],
    ) -> None:
        """Assert the deterministic n=14 closure in bounded-size batches."""
        batch: list[z3.BoolRef] = []
        for application in applications:
            memberships = application["required_memberships"]
            batch.append(z3.Or(*(
                z3.Not(self.member[center, point])
                for center, point in memberships
            )))
            if len(batch) == 2_000:
                self.solver.add(*batch)
                batch.clear()
        if batch:
            self.solver.add(*batch)

    def add_membership_cut_closure(
        self,
        applications: Sequence[tuple[tuple[int, int], ...]],
    ) -> None:
        batch: list[z3.BoolRef] = []
        for memberships in applications:
            batch.append(z3.Or(*(
                z3.Not(self.member[center, point])
                for center, point in memberships
            )))
            if len(batch) == 2_000:
                self.solver.add(*batch)
                batch.clear()
        if batch:
            self.solver.add(*batch)

    def block_complete(self, decoded: dict[str, object]) -> None:
        rows = decoded["rows"]
        blockers = decoded["blockers"]
        shell = set(decoded["shell"])
        roles = decoded["roles"]
        disjuncts: list[z3.BoolRef] = []
        for center, support in rows.items():
            disjuncts.extend(z3.Not(self.member[center, point]) for point in support)
        disjuncts.extend(
            self.blocker[source] != blockers[source] for source in VERTICES
        )
        disjuncts.extend(
            self.shell[point] != z3.BoolVal(point in shell) for point in VERTICES
        )
        disjuncts.extend((
            self.first != roles["first"],
            self.second != roles["second"],
            self.source != roles["source"],
            self.target != roles["target"],
            self.unused != roles["unused"],
        ))
        self.solver.add(z3.Or(*disjuncts))


def distance_table() -> dict[tuple[int, int], z3.ArithRef]:
    return {
        (left, right): z3.Real(f"d_{left}_{right}")
        for left, right in itertools.combinations(VERTICES, 2)
    }


def dist(table: dict[tuple[int, int], z3.ArithRef], left: int, right: int) -> z3.ArithRef:
    if left == right:
        return z3.RealVal(0)
    return table[edge(left, right)]


def linear_metric_check(
    decoded: dict[str, object],
    timeout_ms: int,
    deadline: float,
    random_seed: int,
) -> dict[str, object]:
    check_timeout = bounded_timeout_ms(timeout_ms, deadline)
    if check_timeout is None:
        return {"status": "UNKNOWN", "reason": "wall budget"}
    rows: dict[int, tuple[int, ...]] = decoded["rows"]
    shell: tuple[int, ...] = decoded["shell"]
    table = distance_table()
    solver = z3.Solver()
    solver.set(timeout=check_timeout, random_seed=random_seed)
    tracked: dict[str, dict[str, object]] = {}

    def track(
        name: str,
        formula: z3.BoolRef,
        kind: str,
        memberships: tuple[tuple[int, int], ...] = (),
    ) -> None:
        tracked[name] = {
            "formula": formula,
            "kind": kind,
            "memberships": memberships,
        }
        solver.assert_and_track(formula, z3.Bool(name))

    for (left, right), variable in table.items():
        track(f"pos_{left}_{right}", variable >= 1, "positivity")
    for a, b, c in itertools.combinations(VERTICES, 3):
        track(f"tri0_{a}_{b}_{c}", dist(table, a, b) + dist(table, b, c) >=
              dist(table, a, c) + 1, "strict_triangle")
        track(f"tri1_{a}_{b}_{c}", dist(table, a, c) + dist(table, b, c) >=
              dist(table, a, b) + 1, "strict_triangle")
        track(f"tri2_{a}_{b}_{c}", dist(table, a, b) + dist(table, a, c) >=
              dist(table, b, c) + 1, "strict_triangle")
    for a, b, c, d in itertools.combinations(VERTICES, 4):
        diagonals = dist(table, a, c) + dist(table, b, d)
        track(f"kal1_{a}_{b}_{c}_{d}", diagonals >=
              dist(table, a, b) + dist(table, c, d) + 1, "kalmanson_first")
        track(f"kal2_{a}_{b}_{c}_{d}", diagonals >=
              dist(table, a, d) + dist(table, b, c) + 1, "kalmanson_second")
    for center, support in rows.items():
        reference = support[0]
        for point in support[1:]:
            track(
                f"row_{center}_{reference}_{point}",
                dist(table, center, point) == dist(table, center, reference),
                "selected_row_equality",
                ((center, reference), (center, point)),
            )
    shell_reference = shell[0]
    for point in shell[1:]:
        track(
            f"apex_shell_{shell_reference}_{point}",
            dist(table, SECOND_APEX, point) ==
                dist(table, SECOND_APEX, shell_reference),
            "exact_five_apex_equality",
        )

    status = solver.check()
    if status == z3.unsat:
        initial_core = tuple(str(item) for item in solver.unsat_core())

        def deletion_minimize(order: Sequence[str]) -> tuple[str, ...]:
            active = list(initial_core)
            for name in order:
                if name not in active:
                    continue
                if time.monotonic() >= deadline:
                    break
                trial = [candidate for candidate in active if candidate != name]
                replay = z3.Solver()
                replay_timeout = bounded_timeout_ms(2_000, deadline)
                if replay_timeout is None:
                    break
                replay.set(timeout=replay_timeout, random_seed=random_seed)
                replay.add(*(tracked[candidate]["formula"] for candidate in trial))
                if replay.check() == z3.unsat:
                    active = trial
            return tuple(sorted(active))

        minimized = {
            deletion_minimize(initial_core),
            deletion_minimize(tuple(reversed(initial_core))),
        }
        cores = []
        for core in sorted(minimized):
            memberships = tuple(sorted({
                membership
                for name in core
                for membership in tracked[name]["memberships"]
            }))
            cores.append({
                "core": core,
                "core_kinds": sorted({tracked[name]["kind"] for name in core}),
                "required_memberships": memberships,
            })
        primary = cores[0]
        return {
            "status": "UNSAT",
            "initial_core_size": len(initial_core),
            "cores": cores,
            "core": primary["core"],
            "core_kinds": primary["core_kinds"],
            "required_memberships": primary["required_memberships"],
        }
    if status == z3.unknown:
        return {"status": "UNKNOWN", "reason": solver.reason_unknown()}
    return {"status": "SAT", "table": table, "base_formulas": [
        item["formula"] for item in tracked.values()
    ]}


def exact_semantic_metric_check(
    decoded: dict[str, object],
    linear: dict[str, object],
    timeout_ms: int,
    deadline: float,
    random_seed: int,
) -> dict[str, object]:
    check_timeout = bounded_timeout_ms(timeout_ms, deadline)
    if check_timeout is None:
        return {"status": "UNKNOWN", "reason": "wall budget"}
    rows: dict[int, tuple[int, ...]] = decoded["rows"]
    blockers: tuple[int, ...] = decoded["blockers"]
    shell: tuple[int, ...] = decoded["shell"]
    table: dict[tuple[int, int], z3.ArithRef] = linear["table"]
    solver = z3.Solver()
    solver.set(timeout=check_timeout, random_seed=random_seed)
    solver.add(*linear["base_formulas"])

    # Every actual blocker row is exact over the complete carrier.
    for center in sorted(set(blockers)):
        support = rows[center]
        reference = support[0]
        for point in VERTICES:
            if point != center and point not in support:
                solver.add(dist(table, center, point) != dist(table, center, reference))

    # Complete no_qfree_at: after deleting each actual source, no positive
    # radius at its actual blocker contains four carrier points.
    for source, center in enumerate(blockers):
        remaining = tuple(
            point for point in VERTICES if point not in {source, center}
        )
        for four in itertools.combinations(remaining, 4):
            reference = four[0]
            solver.add(z3.Or(*(
                dist(table, center, point) != dist(table, center, reference)
                for point in four[1:]
            )))

    # Full exact-five filter and its unique-K4-radius field at the physical apex.
    shell_set = set(shell)
    shell_reference = shell[0]
    outside_shell = tuple(
        point for point in VERTICES
        if point != SECOND_APEX and point not in shell_set
    )
    for point in outside_shell:
        solver.add(
            dist(table, SECOND_APEX, point) !=
                dist(table, SECOND_APEX, shell_reference)
        )
    for four in itertools.combinations(outside_shell, 4):
        reference = four[0]
        solver.add(z3.Or(*(
            dist(table, SECOND_APEX, point) !=
                dist(table, SECOND_APEX, reference)
            for point in four[1:]
        )))

    status = solver.check()
    if status == z3.unsat:
        return {"status": "UNSAT"}
    if status == z3.unknown:
        return {"status": "UNKNOWN", "reason": solver.reason_unknown()}
    model = solver.model()
    distances = {
        f"{left},{right}": q(model.eval(variable, model_completion=True))
        for (left, right), variable in table.items()
    }
    return {"status": "SAT", "distances": distances}


def dvalue(distances: dict[str, Fraction], left: int, right: int) -> Fraction:
    if left == right:
        return Fraction(0)
    a, b = edge(left, right)
    return distances[f"{a},{b}"]


def verify_exact_shadow(decoded: dict[str, object], distances: dict[str, Fraction]) -> dict[str, object]:
    rows: dict[int, tuple[int, ...]] = decoded["rows"]
    blockers: tuple[int, ...] = decoded["blockers"]
    shell: tuple[int, ...] = decoded["shell"]
    roles: dict[str, int] = decoded["roles"]
    errors: list[str] = []

    connected, _ = strongly_connected(rows)
    if not connected:
        errors.append("selected witness graph is not strongly connected")
    for center, support in rows.items():
        if len(set(support)) != 4 or center in support:
            errors.append(f"invalid selected row {center}: {support}")
        values = {dvalue(distances, center, point) for point in support}
        if len(values) != 1:
            errors.append(f"selected row equality failed at {center}")
    for left, right in itertools.combinations(VERTICES, 2):
        if dvalue(distances, left, right) < 1:
            errors.append(f"nonpositive normalized distance {left},{right}")
    for a, b, c in itertools.combinations(VERTICES, 3):
        if dvalue(distances, a, b) + dvalue(distances, b, c) < dvalue(distances, a, c) + 1:
            errors.append(f"strict triangle 0 failed {a,b,c}")
        if dvalue(distances, a, c) + dvalue(distances, b, c) < dvalue(distances, a, b) + 1:
            errors.append(f"strict triangle 1 failed {a,b,c}")
        if dvalue(distances, a, b) + dvalue(distances, a, c) < dvalue(distances, b, c) + 1:
            errors.append(f"strict triangle 2 failed {a,b,c}")
    for a, b, c, d in itertools.combinations(VERTICES, 4):
        diagonals = dvalue(distances, a, c) + dvalue(distances, b, d)
        if diagonals < dvalue(distances, a, b) + dvalue(distances, c, d) + 1:
            errors.append(f"Kalmanson first failed {a,b,c,d}")
        if diagonals < dvalue(distances, a, d) + dvalue(distances, b, c) + 1:
            errors.append(f"Kalmanson second failed {a,b,c,d}")

    shell_radius = dvalue(distances, SECOND_APEX, shell[0])
    actual_shell = {
        point for point in VERTICES
        if point != SECOND_APEX and dvalue(distances, SECOND_APEX, point) == shell_radius
    }
    if actual_shell != set(shell):
        errors.append("exact-five physical-apex filter failed")
    outside_shell = [
        point for point in VERTICES
        if point != SECOND_APEX and point not in shell
    ]
    outside_classes: dict[Fraction, int] = defaultdict(int)
    for point in outside_shell:
        outside_classes[dvalue(distances, SECOND_APEX, point)] += 1
    if any(cardinality >= 4 for cardinality in outside_classes.values()):
        errors.append("physical-apex unique-K4-radius field failed")

    for source, center in enumerate(blockers):
        if center in {source, FIRST_APEX, SECOND_APEX}:
            errors.append(f"invalid blocker {source}->{center}")
        if source not in rows[center]:
            errors.append(f"source absent from blocker row {source}->{center}")
        radius = dvalue(distances, center, rows[center][0])
        exact_support = {
            point for point in VERTICES
            if point != center and dvalue(distances, center, point) == radius
        }
        if exact_support != set(rows[center]):
            errors.append(f"blocker row not exact {source}->{center}")
        classes: dict[Fraction, int] = defaultdict(int)
        for point in VERTICES:
            if point not in {source, center}:
                classes[dvalue(distances, center, point)] += 1
        if any(cardinality >= 4 for cardinality in classes.values()):
            errors.append(f"no_qfree_at failed for source {source}")

    physical = set(shell) & PHYSICAL_INTERIOR
    if len(physical) not in {3, 4}:
        errors.append("physical shell cardinality split failed")
    if len(physical) == 3:
        if len(set(shell) & SURPLUS_CAP) != 1 or len(set(shell) & OPP_CAP1) != 1:
            errors.append("card-three adjacent-cap distribution failed")
    if any(roles[name] not in physical for name in ("first", "second", "source", "target")):
        errors.append("named physical role outside physical shell")
    if roles["unused"] in shell:
        errors.append("unused source lies in exact-five shell")
    if roles["unused"] not in PHYSICAL_CAP:
        errors.append("unused source lies outside the closed physical cap")
    if roles["first"] in rows[blockers[roles["unused"]]]:
        errors.append("unused critical row contains continuation first")
    if roles["second"] in rows[blockers[roles["unused"]]]:
        errors.append("unused critical row contains continuation second")
    if roles["target"] in rows[blockers[roles["source"]]]:
        errors.append("mutual source row contains target")
    if roles["source"] in rows[blockers[roles["target"]]]:
        errors.append("mutual target row contains source")
    if blockers[roles["source"]] == blockers[roles["target"]]:
        errors.append("mutual blockers coincide")

    if errors:
        raise AssertionError("; ".join(errors[:20]))
    return {
        "status": "EXACT_RATIONAL_REPLAY_PASS",
        "distance_count": len(distances),
        "minimum_distance": qstr(min(distances.values())),
        "physical_cardinality": len(physical),
        "shell": list(shell),
        "blocker_image_cardinality": len(set(blockers)),
    }


def polynomial_equations(decoded: dict[str, object]) -> tuple[list[sp.Expr], list[dict[str, int | str]]]:
    rows: dict[int, tuple[int, ...]] = decoded["rows"]
    shell: tuple[int, ...] = decoded["shell"]
    coordinates = {
        point: sp.symbols(f"x_{point} y_{point}") for point in VERTICES
    }

    def d2(left: int, right: int) -> sp.Expr:
        lx, ly = coordinates[left]
        rx, ry = coordinates[right]
        return sp.expand((lx - rx) ** 2 + (ly - ry) ** 2)

    gauge = {
        coordinates[0][0]: sp.Integer(0),
        coordinates[0][1]: sp.Integer(0),
        coordinates[1][0]: sp.Integer(1),
        coordinates[1][1]: sp.Integer(0),
    }
    equations: list[sp.Expr] = []
    labels: list[dict[str, int | str]] = []
    for center, support in rows.items():
        reference = support[0]
        for point in support[1:]:
            equations.append(sp.expand((d2(center, point) - d2(center, reference)).subs(gauge)))
            labels.append({"kind": "selected_row", "center": center,
                           "reference": reference, "point": point})
    reference = shell[0]
    for point in shell[1:]:
        equation = sp.expand((d2(SECOND_APEX, point) - d2(SECOND_APEX, reference)).subs(gauge))
        if equation not in equations and -equation not in equations:
            equations.append(equation)
            labels.append({"kind": "exact_five_apex", "center": SECOND_APEX,
                           "reference": reference, "point": point})
    return equations, labels


def polynomial_string(expression: sp.Expr) -> str:
    return sp.sstr(sp.expand(expression)).replace("**", "^").replace(" ", "")


def free_variables(equations: Sequence[sp.Expr], reverse: bool) -> list[sp.Symbol]:
    active = set().union(*(equation.free_symbols for equation in equations))
    variables = [
        sp.symbols(name)
        for point in VERTICES
        for name in (f"x_{point}", f"y_{point}")
        if name not in {"x_0", "y_0", "x_1", "y_1"}
        and sp.symbols(name) in active
    ]
    if reverse:
        variables.reverse()
    return variables


def run_msolve(
    equations: Sequence[sp.Expr], timeout_seconds: float, threads: int, reverse: bool
) -> dict[str, object]:
    variables = free_variables(equations, reverse)
    payload = (
        ",".join(map(str, variables)) + "\n0\n" +
        ",\n".join(polynomial_string(equation) for equation in equations) + "\n"
    )
    started = time.monotonic()
    try:
        with tempfile.TemporaryDirectory(prefix="p97-exact6-allcenter-msolve-") as temp:
            input_path = Path(temp) / "system.ms"
            output_path = Path(temp) / "output.txt"
            input_path.write_text(payload, encoding="utf-8")
            completed = subprocess.run(
                ["msolve", "-f", str(input_path), "-o", str(output_path),
                 "-t", str(threads)],
                text=True,
                capture_output=True,
                timeout=timeout_seconds,
                check=False,
            )
            output = output_path.read_text(encoding="utf-8") if output_path.exists() else ""
    except subprocess.TimeoutExpired:
        return {"status": "TIMEOUT", "elapsed_seconds": time.monotonic() - started,
                "reverse": reverse}
    status = "ERROR"
    if completed.returncode == 0 and output.strip().startswith("[-1]"):
        status = "UNIT"
    elif completed.returncode == 0 and output.strip():
        status = "NONUNIT"
    return {
        "status": status,
        "returncode": completed.returncode,
        "stderr": completed.stderr,
        "elapsed_seconds": time.monotonic() - started,
        "reverse": reverse,
    }


def run_singular(
    equations: Sequence[sp.Expr], timeout_seconds: float, characteristic: int
) -> dict[str, object]:
    variables = free_variables(equations, False)
    ideal = ",\n  ".join(polynomial_string(equation) for equation in equations)
    script = (
        f"ring R={characteristic},({','.join(map(str, variables))}),dp;\n"
        f"ideal I=\n  {ideal};\n"
        "ideal G=std(I);\n"
        'if (size(G)==1 and G[1]==1) { print("UNIT"); } '
        'else { print("NONUNIT"); print(dim(G)); print(size(G)); }\n'
        "quit;\n"
    )
    started = time.monotonic()
    try:
        completed = subprocess.run(
            ["Singular", "-q"], input=script, text=True, capture_output=True,
            timeout=timeout_seconds, check=False,
        )
    except subprocess.TimeoutExpired:
        return {"status": "TIMEOUT", "elapsed_seconds": time.monotonic() - started,
                "characteristic": characteristic}
    lines = [line.strip() for line in completed.stdout.splitlines() if line.strip()]
    status = lines[0] if completed.returncode == 0 and lines and lines[0] in {"UNIT", "NONUNIT"} else "ERROR"
    return {
        "status": status,
        "returncode": completed.returncode,
        "stderr": completed.stderr,
        "elapsed_seconds": time.monotonic() - started,
        "characteristic": characteristic,
        "dimension": int(lines[1]) if status == "NONUNIT" and len(lines) > 1 else None,
        "basis_size": int(lines[2]) if status == "NONUNIT" and len(lines) > 2 else None,
    }


def exact_cas_gate(
    decoded: dict[str, object], timeout_seconds: float, threads: int
) -> dict[str, object]:
    equations, labels = polynomial_equations(decoded)
    checks = {
        "msolve_forward": run_msolve(equations, timeout_seconds, threads, False),
        "msolve_reverse": run_msolve(equations, timeout_seconds, threads, True),
        "singular_char0": run_singular(equations, timeout_seconds, 0),
    }
    statuses = {name: result["status"] for name, result in checks.items()}
    if statuses["msolve_forward"] == statuses["msolve_reverse"] == statuses["singular_char0"] == "UNIT":
        verdict = "EXACT_EQUALITY_IDEAL_UNIT_CROSSCHECKED"
    elif "NONUNIT" in statuses.values() and "UNIT" not in statuses.values():
        verdict = "EXACT_EQUALITY_IDEAL_NONUNIT_OR_TIMEOUT"
    elif "UNIT" in statuses.values() and "NONUNIT" in statuses.values():
        verdict = "ENGINE_DISAGREEMENT"
    else:
        verdict = "UNKNOWN"
    return {
        "verdict": verdict,
        "equation_count": len(equations),
        "equations": labels,
        "checks": checks,
    }


def jsonable_decoded(decoded: dict[str, object]) -> dict[str, object]:
    return {
        "rows": {str(center): list(support) for center, support in decoded["rows"].items()},
        "blockers": list(decoded["blockers"]),
        "shell": list(decoded["shell"]),
        "roles": decoded["roles"],
    }


def event(log_path: Path | None, payload: dict[str, object]) -> None:
    rendered = json.dumps(payload, sort_keys=True)
    print(rendered, flush=True)
    if log_path is not None:
        with log_path.open("a", encoding="utf-8") as stream:
            stream.write(rendered + "\n")


def solve(args: argparse.Namespace) -> dict[str, object]:
    started = time.monotonic()
    deadline = started + args.wall_seconds
    outer = Outer(
        args.orbit,
        args.outer_timeout_ms,
        args.random_seed,
        args.outer_engine,
    )
    transported_bank = load_transported_schema_applications()
    if args.preload_transported_schemas:
        outer.preload_transported_schema_closure(transported_bank["applications"])
    learned_bank = None
    if args.learned_schema_bank is not None:
        learned_bank = load_learned_metric_schema_bank(
            args.learned_schema_bank,
            args.learned_max_k,
        )
        outer.add_membership_cut_closure(learned_bank["applications"])
    asserted_membership_cuts: set[tuple[tuple[int, int], ...]] = (
        {
            application["required_memberships"]
            for application in transported_bank["applications"]
        }
        if args.preload_transported_schemas
        else set()
    )
    if learned_bank is not None:
        asserted_membership_cuts.update(learned_bank["applications"])
    schema_cut_ledger: list[dict[str, object]] = []
    generalized_metric_schemas: list[dict[str, object]] = []
    generalized_schema_keys: set[tuple[int, tuple[tuple[int, int], ...]]] = set()
    metric_cut_ledger: list[dict[str, object]] = []
    refinements: list[dict[str, object]] = []
    counters: dict[str, int] = defaultdict(int)
    result: dict[str, object] | None = None
    attempts_used = 0

    for attempt in range(1, args.max_attempts + 1):
        attempts_used = attempt
        timeout = bounded_timeout_ms(args.outer_timeout_ms, deadline)
        if timeout is None:
            result = {"status": "UNKNOWN", "reason": "wall budget"}
            break
        outer.solver.set(timeout=timeout)
        outer_status = outer.solver.check()
        if outer_status == z3.unsat:
            result = {"status": "UNSAT_STRUCTURAL_CEGAR_EXHAUSTED"}
            break
        if outer_status == z3.unknown:
            result = {"status": "UNKNOWN", "reason": outer.solver.reason_unknown()}
            break
        decoded = outer.decode(outer.solver.model())
        connected, sink_components = strongly_connected(decoded["rows"])
        if not connected:
            for component in sink_components:
                outer.add_connectivity_cut(component)
            counters["connectivity_cuts"] += len(sink_components)
            if attempt % args.log_every == 0:
                event(args.log, {"attempt": attempt, "orbit": args.orbit,
                                 "phase": "connectivity", "counters": dict(counters)})
            continue

        # Canonical exact 2-Kalmanson/3-row certificates are applied lazily.
        # Every recorded clause is one increasing or reflected embedding of a
        # verified 20-schema bank member, so the final ledger can be replayed
        # without trusting this search process or Z3's unsat-core heuristic.
        schema_matches = (
            [] if args.preload_transported_schemas
            else matching_schema_applications(decoded["rows"], transported_bank)
        )
        new_schema_matches = [
            application for application in schema_matches
            if application["required_memberships"] not in asserted_membership_cuts
        ]
        if new_schema_matches:
            for application in new_schema_matches:
                required = application["required_memberships"]
                outer.add_transported_schema_cut(required)
                asserted_membership_cuts.add(required)
                schema_cut_ledger.append({
                    "attempt": attempt,
                    "schema_index": application["schema_index"],
                    "orientation": application["orientation"],
                    "embedding": list(application["embedding"]),
                    "required_memberships": [list(item) for item in required],
                })
            counters["transported_2k3_schema_cuts"] += len(new_schema_matches)
            if attempt % args.log_every == 0:
                event(args.log, {
                    "attempt": attempt,
                    "orbit": args.orbit,
                    "phase": "transported_2k3_schema",
                    "new_cuts": len(new_schema_matches),
                    "counters": dict(counters),
                })
            continue

        linear = linear_metric_check(
            decoded, args.metric_timeout_ms, deadline, args.random_seed + attempt
        )
        if linear["status"] == "UNSAT":
            counters["linear_metric_unsat"] += 1
            for core_record in linear["cores"]:
                memberships = core_record["required_memberships"]
                conditioned = "exact_five_apex_equality" in core_record["core_kinds"]
                if memberships:
                    outer.add_metric_core_cut(
                        memberships,
                        decoded["shell"],
                        conditioned,
                    )
                else:
                    outer.block_complete(decoded)
                cut_record = {
                    "attempt": attempt,
                    "kind": "linear_metric_unsat",
                    "initial_core_size": linear["initial_core_size"],
                    "core_size": len(core_record["core"]),
                    "core_kinds": core_record["core_kinds"],
                    "core": list(core_record["core"]),
                    "conditioned_on_shell": conditioned,
                    "required_memberships": [list(item) for item in memberships],
                    "shell": list(decoded["shell"]),
                }
                metric_cut_ledger.append(cut_record)
                if len(refinements) < args.store_refinements:
                    refinements.append(cut_record)

                # A shell-free exact core transports through every increasing
                # boundary embedding and reflection.  Online deletion is
                # budgeted, so minimality is deliberately not claimed here.
                canonical = canonical_metric_membership_schema(core_record["core"])
                if canonical is None:
                    continue
                schema_key = (
                    canonical["core_vertex_count"],
                    tuple(canonical["order_schema"]),
                )
                if schema_key in generalized_schema_keys:
                    continue
                generalized_schema_keys.add(schema_key)
                applications = expand_metric_membership_schema(canonical)
                new_applications = tuple(
                    application for application in applications
                    if application not in asserted_membership_cuts
                )
                if new_applications:
                    outer.add_membership_cut_closure(new_applications)
                    asserted_membership_cuts.update(new_applications)
                generalized_metric_schemas.append({
                    "attempt": attempt,
                    "core_vertex_count": canonical["core_vertex_count"],
                    "order_schema": [list(item) for item in canonical["order_schema"]],
                    "source_vertices": list(canonical["source_vertices"]),
                    "source_core": list(core_record["core"]),
                    "complete_application_count": len(applications),
                    "new_application_count": len(new_applications),
                })
                counters["generalized_metric_schema_cuts"] += len(new_applications)
            counters["metric_core_cuts"] += len(linear["cores"])
            if attempt % args.log_every == 0:
                event(args.log, {"attempt": attempt, "orbit": args.orbit,
                                 "phase": "linear_unsat", "counters": dict(counters)})
            continue
        if linear["status"] == "UNKNOWN":
            result = {"status": "UNKNOWN", "reason": f"linear metric: {linear['reason']}"}
            break

        semantic = exact_semantic_metric_check(
            decoded, linear, args.metric_timeout_ms, deadline, args.random_seed + attempt
        )
        if semantic["status"] == "UNSAT":
            outer.block_complete(decoded)
            counters["exact_semantic_unsat_full_blocks"] += 1
            if attempt % args.log_every == 0:
                event(args.log, {"attempt": attempt, "orbit": args.orbit,
                                 "phase": "semantic_unsat", "counters": dict(counters)})
            continue
        if semantic["status"] == "UNKNOWN":
            result = {"status": "UNKNOWN", "reason": f"exact semantic: {semantic['reason']}"}
            break

        verification = verify_exact_shadow(decoded, semantic["distances"])
        cas = exact_cas_gate(decoded, args.cas_seconds, args.cas_threads)
        result = {
            "status": "SAT_VERIFIED_EXACT6_MUTUAL_RETAINED_SUBSYSTEM_ABSTRACT_DISTANCE_SHADOW",
            "decoded": jsonable_decoded(decoded),
            "distances": {
                name: qstr(value) for name, value in semantic["distances"].items()
            },
            "verification": verification,
            "exact_euclidean_equality_ideal": cas,
        }
        break
    else:
        result = {"status": "UNKNOWN", "reason": "attempt budget"}

    if result is None:
        raise AssertionError("missing terminal result")
    result.update({
        "schema": "p97-exact6-allcenter-capaware-gate-v1",
        "epistemic_status": "BOUNDED_THEOREM_DISCOVERY_NOT_LEAN_PROOF",
        "scope": "EXACT_SIX_MUTUAL_COMPLETE_ROW_SURFACE",
        "orbit": args.orbit,
        "n": N,
        "cap_profile": [5, 6, 6],
        "physical_apices_omitted_from_blocker_image": [FIRST_APEX, SECOND_APEX],
        "elapsed_seconds": time.monotonic() - started,
        "attempts": attempts_used,
        "counters": dict(counters),
        "stored_refinement_count": len(refinements),
        "refinements": refinements,
        "metric_core_cut_count": len(metric_cut_ledger),
        "metric_core_cuts": metric_cut_ledger,
        "generalized_metric_schema_count": len(generalized_metric_schemas),
        "generalized_metric_schemas": generalized_metric_schemas,
        "transported_schema_bank": {
            "path": str(TRANSPORTED_SCHEMA_BANK.relative_to(HERE.parents[2])),
            "sha256": transported_bank["sha256"],
            "schema_count": transported_bank["schema_count"],
            "concrete_application_count": transported_bank["application_count"],
        },
        "transported_schema_cut_count": len(schema_cut_ledger),
        "transported_schema_cuts": schema_cut_ledger,
        "transported_schema_full_closure_preloaded": args.preload_transported_schemas,
        "learned_metric_schema_bank": (
            None if learned_bank is None else {
                "path": str(learned_bank["path"]),
                "sha256": learned_bank["sha256"],
                "max_vertex_count": learned_bank["max_vertex_count"],
                "selected_schema_count": learned_bank["selected_schema_count"],
                "application_count": learned_bank["application_count"],
            }
        ),
        "outer_engine": args.outer_engine,
        "retained": [
            "one selected K4 row at every actual carrier center",
            "one actual critical blocker and blocker-row manifest at every source",
            "full no_qfree_at semantic at every actual source/blocker",
            "both physical apices omitted from the blocker image",
            "exact contiguous (5,6,6) cap blocks and cap-local row-hit bounds",
            "strict triangle and both strict Kalmanson inequalities",
            "complete exact-five physical-apex class with corrected exact-six distribution",
            "complete named unused/source/target critical rows and role orbit",
            "the intrinsic mutualBlockers_ne field for the mutual source/target pair",
            "selected witness strong connectivity",
        ],
        "omitted_from_abstract_distance_gate": [
            "rank-two Euclidean coordinate realization beyond the equality ideal",
            "MEC containment and nonobtuse support-triangle inequalities",
            "noM44 alternate-support-triangle quantification",
            "minimality beyond selected-witness strong connectivity",
            "full first-apex robustness, its frontier radius, and retained double-deletion rows",
            "any classification of the continuation-unused blocker against the oriented partner blocker",
        ],
    })
    return result


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--orbit", choices=ORBITS, required=True)
    parser.add_argument("--wall-seconds", type=float, default=600.0)
    parser.add_argument("--outer-timeout-ms", type=int, default=30_000)
    parser.add_argument("--outer-engine", choices=("smt", "qffd"), default="qffd")
    parser.add_argument("--metric-timeout-ms", type=int, default=60_000)
    parser.add_argument("--max-attempts", type=int, default=100_000)
    parser.add_argument("--random-seed", type=int, default=0)
    parser.add_argument("--cas-seconds", type=float, default=60.0)
    parser.add_argument("--cas-threads", type=int, default=4)
    parser.add_argument("--log-every", type=int, default=10)
    parser.add_argument("--store-refinements", type=int, default=50)
    parser.add_argument("--preload-transported-schemas", action="store_true")
    parser.add_argument("--learned-schema-bank", type=Path)
    parser.add_argument("--learned-max-k", type=int, default=8)
    parser.add_argument("--print-full-result", action="store_true")
    parser.add_argument("--log", type=Path)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()
    if args.log is not None:
        args.log.parent.mkdir(parents=True, exist_ok=True)
    payload = solve(args)
    rendered = json.dumps(payload, indent=2, sort_keys=True) + "\n"
    if args.output is not None:
        args.output.parent.mkdir(parents=True, exist_ok=True)
        args.output.write_text(rendered, encoding="utf-8")
    if args.output is None or args.print_full_result:
        print(rendered, end="")
    else:
        print(json.dumps({
            "status": payload["status"],
            "orbit": payload["orbit"],
            "attempts": payload["attempts"],
            "elapsed_seconds": payload["elapsed_seconds"],
            "counters": payload["counters"],
            "output": str(args.output),
        }, sort_keys=True))


if __name__ == "__main__":
    main()
