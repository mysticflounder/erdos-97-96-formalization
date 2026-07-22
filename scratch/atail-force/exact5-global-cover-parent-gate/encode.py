#!/usr/bin/env python3
"""Boolean n=13 gate for the exact-five global-cover-star parent slice."""

from __future__ import annotations

import argparse
import itertools
import json
import time
from pathlib import Path

import z3

from verify import (
    CAPS,
    CAP_ENDPOINTS,
    FIRST_APEX,
    N,
    OPP_CAP1,
    ORBIT_ROLES,
    PHYSICAL_CAP,
    PHYSICAL_INTERIOR,
    SECOND_APEX,
    SURPLUS_CAP,
    VERTICES,
    sink_sccs,
    verify_decoded,
)


def _pb_eq(items: list[z3.BoolRef], value: int) -> z3.BoolRef:
    return z3.PbEq([(item, 1) for item in items], value)


def _pb_le(items: list[z3.BoolRef], value: int) -> z3.BoolRef:
    return z3.PbLe([(item, 1) for item in items], value)


class Outer:
    def __init__(self, orbit: str, timeout_ms: int, seed: int = 1) -> None:
        if orbit not in ORBIT_ROLES:
            raise ValueError(orbit)
        self.orbit = orbit
        self.roles = ORBIT_ROLES[orbit]
        self.solver = z3.SolverFor("QF_FD")
        self.solver.set(timeout=timeout_ms, random_seed=seed)
        self.m = self._new_family("m")
        self.cover = [self._new_family(f"g{edge}") for edge in range(2)]
        self.blocker = [z3.Int(f"blocker_{source}") for source in VERTICES]
        self.shell = [z3.Bool(f"shell_{point}") for point in VERTICES]
        self.q = z3.Int("frontier_q")
        self.w = z3.Int("frontier_w")
        self.b1 = [z3.Bool(f"b1_{point}") for point in VERTICES]
        self._add_base()

    @staticmethod
    def _new_family(prefix: str) -> dict[tuple[int, int], z3.BoolRef]:
        return {
            (center, point): z3.Bool(f"{prefix}_{center}_{point}")
            for center in VERTICES
            for point in VERTICES
        }

    def member_at_center(self, center: z3.ArithRef,
                         point: int) -> z3.BoolRef:
        return z3.Or(*(
            z3.And(center == candidate, self.m[candidate, point])
            for candidate in VERTICES
        ))

    @staticmethod
    def member_at_role(family: dict[tuple[int, int], z3.BoolRef],
                       center: int, point: z3.ArithRef) -> z3.BoolRef:
        return z3.Or(*(
            z3.And(point == candidate, family[center, candidate])
            for candidate in VERTICES
        ))

    def _add_row_family(self, family: dict[tuple[int, int], z3.BoolRef]) -> None:
        solver = self.solver
        for center in VERTICES:
            solver.add(z3.Not(family[center, center]))
            solver.add(_pb_eq([family[center, p] for p in VERTICES], 4))
        for left, right in itertools.combinations(VERTICES, 2):
            solver.add(_pb_le([
                z3.And(family[left, p], family[right, p]) for p in VERTICES
            ], 2))
        for first, second in itertools.combinations(VERTICES, 2):
            solver.add(_pb_le([
                z3.And(family[center, first], family[center, second])
                for center in VERTICES
            ], 2))
        for left, right in itertools.combinations(VERTICES, 2):
            remaining = [p for p in VERTICES if p not in {left, right}]
            for a, b in itertools.combinations(remaining, 2):
                if (left < a < right) != (left < b < right):
                    continue
                solver.add(z3.Not(z3.And(
                    family[left, a], family[left, b],
                    family[right, a], family[right, b],
                )))
        for cap, endpoints in zip(CAPS, CAP_ENDPOINTS, strict=True):
            for center in sorted(cap):
                solver.add(_pb_le([family[center, p] for p in cap], 2))
            for center in endpoints:
                solver.add(_pb_le([family[center, p] for p in cap], 1))
            outside = sorted(set(VERTICES) - set(cap))
            for left, right in itertools.combinations(sorted(cap), 2):
                for a, b in itertools.combinations(outside, 2):
                    solver.add(z3.Not(z3.And(
                        family[left, a], family[left, b],
                        family[right, a], family[right, b],
                    )))

    def _add_base(self) -> None:
        solver = self.solver
        self._add_row_family(self.m)
        for family in self.cover:
            self._add_row_family(family)
        self._add_cross_family_geometry()

        # Complete exact-five shell: all three strict physical points plus
        # one point on each adjacent endpoint chain.
        solver.add(z3.Not(self.shell[SECOND_APEX]))
        solver.add(_pb_eq(self.shell, 5))
        for point in PHYSICAL_INTERIOR:
            solver.add(self.shell[point])
        solver.add(_pb_eq([
            self.shell[p] for p in sorted(SURPLUS_CAP - {SECOND_APEX})
        ], 1))
        solver.add(_pb_eq([
            self.shell[p] for p in sorted(OPP_CAP1 - {SECOND_APEX})
        ], 1))
        for point in VERTICES:
            solver.add(z3.Implies(self.m[SECOND_APEX, point], self.shell[point]))

        # Fixed critical map and blocker-row locking.
        for source in VERTICES:
            center = self.blocker[source]
            solver.add(0 <= center, center < N)
            solver.add(center != source, center != FIRST_APEX,
                       center != SECOND_APEX)
            solver.add(self.member_at_center(center, source))

        self._add_source_faithful_row_synchronization()

        # Minimum full-parent projection at the two physical apices.
        off_surplus = sorted(set(VERTICES) - set(SURPLUS_CAP))
        for role in (self.q, self.w):
            solver.add(z3.Or(*(role == p for p in off_surplus)))
        solver.add(self.q != self.w)
        solver.add(self.member_at_role(self.m, FIRST_APEX, self.q))
        solver.add(self.member_at_role(self.m, FIRST_APEX, self.w))
        solver.add(z3.Not(self.member_at_role(self.m, SECOND_APEX, self.q)))
        solver.add(z3.Not(self.member_at_role(self.m, SECOND_APEX, self.w)))
        solver.add(_pb_eq(self.b1, 4), z3.Not(self.b1[FIRST_APEX]))
        for point in VERTICES:
            solver.add(z3.Implies(self.q == point, z3.Not(self.b1[point])))
            solver.add(z3.Implies(self.w == point, z3.Not(self.b1[point])))
        solver.add(_pb_le([
            z3.And(self.b1[p], self.m[SECOND_APEX, p]) for p in VERTICES
        ], 2))
        for cap, endpoints in zip(CAPS, CAP_ENDPOINTS, strict=True):
            if FIRST_APEX in cap:
                solver.add(_pb_le([self.b1[p] for p in cap], 2))
            if FIRST_APEX in endpoints:
                solver.add(_pb_le([self.b1[p] for p in cap], 1))

        # Two independent global-cover witness tables.  Sharing these tables
        # would be an unsound strengthening of the live star.
        hub = self.roles["hub"]
        spokes = (self.roles["spoke1"], self.roles["spoke2"])
        for edge_index, spoke in enumerate(spokes):
            for center in VERTICES:
                solver.add(z3.Not(z3.And(
                    self.cover[edge_index][center, hub],
                    self.cover[edge_index][center, spoke],
                )))

        # Fixed-H projection of the same cover at every actual blocker row.
        for source in VERTICES:
            center = self.blocker[source]
            for spoke in spokes:
                solver.add(z3.Not(z3.And(
                    self.member_at_center(center, hub),
                    self.member_at_center(center, spoke),
                )))

        if self.orbit.startswith("asymmetric"):
            source = self.roles["source"]
            third = self.roles["third"]
            solver.add(self.blocker[source] == hub)
            solver.add(self.m[hub, source], self.m[hub, third])
            for point in PHYSICAL_CAP - {source, third}:
                solver.add(z3.Not(self.m[hub, point]))
            for point in PHYSICAL_INTERIOR - {hub}:
                solver.add(z3.Not(
                    self.member_at_center(self.blocker[hub], point)
                ))
        else:
            for source in PHYSICAL_INTERIOR:
                for point in PHYSICAL_INTERIOR - {source}:
                    solver.add(z3.Not(
                        self.member_at_center(self.blocker[source], point)
                    ))

    def _add_source_faithful_row_synchronization(self) -> None:
        """Synchronize cover witnesses where the source proves uniqueness.

        A center in the fixed critical map's blocker image has a unique
        ambient K4 radius class: any four-witness row there is the selected
        critical row `m`.  At the second apex the unique ambient K4 class has
        cardinality five, so every selected cover row is a subset of `shell`.
        """
        for center in VERTICES:
            in_blocker_image = z3.Or(*(
                self.blocker[source] == center for source in VERTICES
            ))
            for family in self.cover:
                for point in VERTICES:
                    self.solver.add(z3.Implies(
                        in_blocker_image,
                        family[center, point] == self.m[center, point],
                    ))
        for family in self.cover:
            for point in VERTICES:
                self.solver.add(z3.Implies(
                    family[SECOND_APEX, point], self.shell[point]
                ))

    @staticmethod
    def _decode_family(model: z3.ModelRef,
                       family: dict[tuple[int, int], z3.BoolRef]
                       ) -> dict[str, list[int]]:
        return {
            str(center): [
                point for point in VERTICES
                if z3.is_true(model.eval(family[center, point],
                                         model_completion=True))
            ]
            for center in VERTICES
        }

    def decode(self, model: z3.ModelRef) -> dict[str, object]:
        return {
            "orbit": self.orbit,
            "roles": self.roles,
            "rows": self._decode_family(model, self.m),
            "cover_rows": [
                self._decode_family(model, family) for family in self.cover
            ],
            "blockers": [model.eval(item).as_long() for item in self.blocker],
            "shell": [
                p for p in VERTICES
                if z3.is_true(model.eval(self.shell[p], model_completion=True))
            ],
            "q": model.eval(self.q).as_long(),
            "w": model.eval(self.w).as_long(),
            "b1": [
                p for p in VERTICES
                if z3.is_true(model.eval(self.b1[p], model_completion=True))
            ],
        }

    def _add_cross_family_geometry(self) -> None:
        solver = self.solver
        families = [self.m, *self.cover]
        for family_index, left_family in enumerate(families):
            for right_family in families[family_index + 1:]:
                for left, right in itertools.combinations(VERTICES, 2):
                    for first_family, second_family in (
                        (left_family, right_family),
                        (right_family, left_family),
                    ):
                        solver.add(_pb_le([
                            z3.And(first_family[left, p], second_family[right, p])
                            for p in VERTICES
                        ], 2))
                        remaining = [
                            p for p in VERTICES if p not in {left, right}
                        ]
                        for a, b in itertools.combinations(remaining, 2):
                            if (left < a < right) != (left < b < right):
                                continue
                            solver.add(z3.Not(z3.And(
                                first_family[left, a], first_family[left, b],
                                second_family[right, a], second_family[right, b],
                            )))
                for cap in CAPS:
                    outside = sorted(set(VERTICES) - set(cap))
                    for left, right in itertools.combinations(sorted(cap), 2):
                        for first_family, second_family in (
                            (left_family, right_family),
                            (right_family, left_family),
                        ):
                            for a, b in itertools.combinations(outside, 2):
                                solver.add(z3.Not(z3.And(
                                    first_family[left, a], first_family[left, b],
                                    second_family[right, a], second_family[right, b],
                                )))

        # The first-apex b1 row is another selected circle row at center O1.
        for family in families:
            for center in VERTICES:
                if center == FIRST_APEX:
                    continue
                left, right = sorted((FIRST_APEX, center))
                solver.add(_pb_le([
                    z3.And(self.b1[p], family[center, p]) for p in VERTICES
                ], 2))
                remaining = [p for p in VERTICES if p not in {left, right}]
                for a, b in itertools.combinations(remaining, 2):
                    if (left < a < right) != (left < b < right):
                        continue
                    solver.add(z3.Not(z3.And(
                        self.b1[a], self.b1[b],
                        family[center, a], family[center, b]
                    )))
            for cap in CAPS:
                if FIRST_APEX not in cap:
                    continue
                outside = sorted(set(VERTICES) - set(cap))
                for center in sorted(cap - {FIRST_APEX}):
                    for a, b in itertools.combinations(outside, 2):
                        solver.add(z3.Not(z3.And(
                            self.b1[a], self.b1[b],
                            family[center, a], family[center, b],
                        )))

        # A target pair can be bisected by at most two carrier centers.  Count
        # centers, not row-table instances at the same center.
        for a, b in itertools.combinations(VERTICES, 2):
            at_centers = []
            for center in VERTICES:
                occurrences = [
                    z3.And(family[center, a], family[center, b])
                    for family in families
                ]
                if center == FIRST_APEX:
                    occurrences.append(z3.And(self.b1[a], self.b1[b]))
                at_centers.append(z3.Or(*occurrences))
            solver.add(_pb_le(at_centers, 2))

    def add_connectivity_cut(
        self,
        family: dict[tuple[int, int], z3.BoolRef],
        component: set[int],
    ) -> None:
        self.solver.add(z3.Or(*(
            family[center, point]
            for center in sorted(component)
            for point in VERTICES
            if point not in component
        )))

    def block_decoded(self, decoded: dict[str, object]) -> None:
        differences: list[z3.BoolRef] = []
        raw_families = [decoded["rows"], *decoded["cover_rows"]]
        symbolic_families = [self.m, *self.cover]
        for raw, symbolic in zip(raw_families, symbolic_families, strict=True):
            for center in VERTICES:
                support = set(raw[str(center)])
                for point in VERTICES:
                    differences.append(
                        symbolic[center, point] != z3.BoolVal(point in support)
                    )
        blockers = decoded["blockers"]
        differences.extend(
            self.blocker[source] != blockers[source] for source in VERTICES
        )
        shell = set(decoded["shell"])
        differences.extend(
            self.shell[point] != z3.BoolVal(point in shell) for point in VERTICES
        )
        differences.append(self.q != decoded["q"])
        differences.append(self.w != decoded["w"])
        b1 = set(decoded["b1"])
        differences.extend(
            self.b1[point] != z3.BoolVal(point in b1) for point in VERTICES
        )
        self.solver.add(z3.Or(*differences))


def solve(orbit: str, seconds: float, seed: int) -> dict[str, object]:
    started = time.monotonic()
    deadline = started + seconds
    outer = Outer(orbit, max(1, int(seconds * 1000)), seed)
    connectivity_cuts = {"m": 0, "g0": 0, "g1": 0}
    while True:
        remaining_ms = int((deadline - time.monotonic()) * 1000)
        if remaining_ms <= 0:
            return {
                "schema": "p97-card13-exact5-global-cover-parent-gate-v1",
                "status": "UNKNOWN",
                "reason": "wall budget",
                "orbit": orbit,
                "connectivity_cuts": connectivity_cuts,
            }
        outer.solver.set(timeout=max(1, remaining_ms), random_seed=seed)
        status = outer.solver.check()
        if status == z3.unsat:
            return {
                "schema": "p97-card13-exact5-global-cover-parent-gate-v1",
                "status": "UNSAT",
                "orbit": orbit,
                "connectivity_cuts": connectivity_cuts,
                "epistemic_scope": "exact-card-13 B0 necessary-condition relaxation",
            }
        if status == z3.unknown:
            return {
                "schema": "p97-card13-exact5-global-cover-parent-gate-v1",
                "status": "UNKNOWN",
                "reason": outer.solver.reason_unknown(),
                "orbit": orbit,
                "connectivity_cuts": connectivity_cuts,
            }
        decoded = outer.decode(outer.solver.model())
        decoded_families = [
            {int(c): set(s) for c, s in decoded["rows"].items()},
            *[
                {int(c): set(s) for c, s in raw.items()}
                for raw in decoded["cover_rows"]
            ],
        ]
        symbolic_families = [outer.m, *outer.cover]
        names = ("m", "g0", "g1")
        sink_lists = [sink_sccs(family) for family in decoded_families]
        if all(len(sinks) == 1 and len(sinks[0]) == N for sinks in sink_lists):
            errors = verify_decoded(decoded)
            if errors:
                return {
                    "schema": "p97-card13-exact5-global-cover-parent-gate-v1",
                    "status": "ENCODER_ERROR",
                    "orbit": orbit,
                    "verification_errors": errors,
                }
            return {
                "schema": "p97-card13-exact5-global-cover-parent-gate-v1",
                "status": "SAT",
                "label": "SAT_VERIFIED_CARD13_EXACT5_GLOBAL_COVER_B0_PARTIAL_PARENT_SHADOW",
                "orbit": orbit,
                "connectivity_cuts": connectivity_cuts,
                "decoded": decoded,
                "omitted": [
                    "all metric and terminal-negation literals",
                    "exact filters and no_qfree_at",
                    "full minimality, noM44, planar and MEC geometry",
                ],
            }
        for name, symbolic, sinks in zip(
            names, symbolic_families, sink_lists, strict=True
        ):
            for component in sinks:
                if len(component) < N:
                    outer.add_connectivity_cut(symbolic, component)
                    connectivity_cuts[name] += 1


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--orbit", choices=tuple(ORBIT_ROLES), required=True)
    parser.add_argument("--seconds", type=float, default=10.0)
    parser.add_argument("--seed", type=int, default=1)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()
    result = solve(args.orbit, args.seconds, args.seed)
    payload = json.dumps(result, indent=2, sort_keys=True)
    if args.output is not None:
        args.output.write_text(payload + "\n")
    print(payload)


if __name__ == "__main__":
    main()
