#!/usr/bin/env python3
"""Focused exact-card-13 all-one parent decision surface.

This extends the source-faithful B0 outer with the two direct-field bundles
missing from the older common-order gate:

* the actual retained q-deleted rows ``R.common.packet.B1/B2``; and
* ``FirstApexShellRolePacket F R``, including its equal-radius-six versus
  distinct-radius/disjoint split.

The exact LRA layer uses one cyclic order, strict triangles, both strict
Kalmanson inequalities, the complete exact-five second-apex class, and the
complete deletion-critical semantics at every center in the fixed blocker
image.  It is a scratch decision aid, not a proof of coverage.
"""

from __future__ import annotations

import argparse
import itertools
import json
import sys
import time
from fractions import Fraction
from pathlib import Path

import z3


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
B0 = ROOT / "scratch/atail-force/exact5-global-cover-parent-gate"
sys.path.insert(0, str(B0))

from encode import Outer as BaseOuter  # noqa: E402
from verify import (  # noqa: E402
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


ALL_ONE_ORBITS = tuple(
    orbit for orbit in ORBIT_ROLES if orbit.startswith("allOneHit")
)
STRICT_FIRST_OPPOSITE = set(OPP_CAP1) - set(SURPLUS_CAP) - set(PHYSICAL_CAP)


def _pb_eq(items: list[z3.BoolRef], value: int) -> z3.BoolRef:
    return z3.PbEq([(item, 1) for item in items], value)


def _pb_le(items: list[z3.BoolRef], value: int) -> z3.BoolRef:
    return z3.PbLe([(item, 1) for item in items], value)


class FocusOuter(BaseOuter):
    def __init__(self, orbit: str, radius_arm: str,
                 timeout_ms: int, seed: int) -> None:
        if orbit not in ALL_ONE_ORBITS:
            raise ValueError(orbit)
        if radius_arm not in {"same", "distinct"}:
            raise ValueError(radius_arm)
        self.radius_arm = radius_arm
        super().__init__(orbit, timeout_ms, seed)
        # The inherited outer is deliberately finite-domain only.  This
        # focused surface needs a schema-independent ordinal-distance
        # prefilter, so move the already-built Boolean assertions to a mixed
        # Boolean/LRA solver before adding the retained rows.
        finite_assertions = self.solver.assertions()
        self.solver = z3.Solver()
        self.solver.set(timeout=timeout_ms, random_seed=seed)
        self.solver.add(*finite_assertions)
        self.parent_first = [z3.Bool(f"parent_first_{p}") for p in VERTICES]
        self.parent_second = [z3.Bool(f"parent_second_{p}") for p in VERTICES]
        self._add_focused_contract()
        self._add_ordinal_prefilter()

    def _row_member(self, row: list[z3.BoolRef], point: z3.ArithRef) -> z3.BoolRef:
        return z3.Or(*(z3.And(point == p, row[p]) for p in VERTICES))

    def _add_focused_contract(self) -> None:
        s = self.solver

        # Actual retained q-deleted packet B1/B2.  These are not the existing
        # double-deletion rows m[O1], m[O2], or b1.
        for row, center in (
            (self.parent_first, FIRST_APEX),
            (self.parent_second, SECOND_APEX),
        ):
            s.add(_pb_eq(row, 4), z3.Not(row[center]))
            s.add(z3.Not(self._row_member(row, self.q)))
        s.add(_pb_le([
            z3.And(self.parent_first[p], self.parent_second[p])
            for p in VERTICES
        ], 2))
        s.add(_pb_le([self.parent_first[p] for p in PHYSICAL_INTERIOR], 1))
        s.add(z3.PbGe([
            (self.parent_second[p], 1) for p in PHYSICAL_INTERIOR
        ], 2))
        for p in VERTICES:
            s.add(z3.Implies(self.parent_second[p], self.shell[p]))

        # Endpoint-centered cap one-hit bounds for the two retained rows.
        s.add(_pb_le([self.parent_first[p] for p in SURPLUS_CAP], 1))
        s.add(_pb_le([self.parent_first[p] for p in PHYSICAL_CAP], 1))
        s.add(_pb_le([self.parent_second[p] for p in SURPLUS_CAP], 1))
        s.add(_pb_le([self.parent_second[p] for p in OPP_CAP1], 1))

        # FirstApexShellRolePacket: both selected O1 rows have two strict
        # first-opposite-cap hits.  q,w already lie in m[O1] off surplus.
        s.add(z3.PbGe([
            (self.m[FIRST_APEX, p], 1) for p in STRICT_FIRST_OPPOSITE
        ], 2))
        s.add(z3.PbGe([
            (self.b1[p], 1) for p in STRICT_FIRST_OPPOSITE
        ], 2))
        s.add(z3.Or(
            self.member_at_role(self.m, FIRST_APEX, self.q),
            self.member_at_role(self.m, FIRST_APEX, self.w),
        ))
        # At least one frontier source lies in the strict first-opposite cap.
        s.add(z3.Or(*(
            z3.And(self.q == p, self.m[FIRST_APEX, p])
            for p in STRICT_FIRST_OPPOSITE
        ), *(
            z3.And(self.w == p, self.m[FIRST_APEX, p])
            for p in STRICT_FIRST_OPPOSITE
        )))
        if self.radius_arm == "distinct":
            for p in VERTICES:
                s.add(z3.Not(z3.And(self.m[FIRST_APEX, p], self.b1[p])))

            # Kernel-checked exact-card-13 normal form: the two strict-cap
            # intersections are disjoint pairs covering all four points.
            s.add(_pb_eq([
                self.m[FIRST_APEX, p] for p in STRICT_FIRST_OPPOSITE
            ], 2))
            s.add(_pb_eq([
                self.b1[p] for p in STRICT_FIRST_OPPOSITE
            ], 2))
            for p in STRICT_FIRST_OPPOSITE:
                s.add(z3.Or(self.m[FIRST_APEX, p], self.b1[p]))
        else:
            # In the same-radius arm the complete ambient class has exactly
            # six points and contains the whole four-point strict cap.  The
            # two selected rows already have a six-point union lower bound.
            s.add(z3.PbEq([
                (z3.Or(self.m[FIRST_APEX, p], self.b1[p]), 1)
                for p in VERTICES
            ], 6))
            for p in STRICT_FIRST_OPPOSITE:
                s.add(z3.Or(self.m[FIRST_APEX, p], self.b1[p]))

        # Complete-class synchronization at O1.  A selected witness that
        # meets a complete radius class has that radius throughout.  In the
        # same arm it is therefore a four-subset of the exact six-class; in
        # the distinct arm it equals one exact four-class.  Otherwise it is
        # support-disjoint from the displayed class(es).
        other_first_rows = [
            [family[FIRST_APEX,p] for p in VERTICES]
            for family in self.cover
        ] + [self.parent_first]
        for other in other_first_rows:
            if self.radius_arm == "same":
                complete = [z3.Or(self.m[FIRST_APEX,p], self.b1[p])
                            for p in VERTICES]
                meets = z3.Or(*(z3.And(other[p],complete[p]) for p in VERTICES))
                s.add(z3.Implies(meets,z3.And(*(
                    z3.Implies(other[p],complete[p]) for p in VERTICES
                ))))
            else:
                meets_retained=z3.Or(*(z3.And(other[p],self.m[FIRST_APEX,p])
                                       for p in VERTICES))
                meets_double=z3.Or(*(z3.And(other[p],self.b1[p])
                                     for p in VERTICES))
                s.add(z3.Implies(meets_retained,z3.And(*(
                    other[p] == self.m[FIRST_APEX,p] for p in VERTICES
                ))))
                s.add(z3.Implies(meets_double,z3.And(*(
                    other[p] == self.b1[p] for p in VERTICES
                ))))

        # Add the new row instances to the ordinary two-circle constraints.
        # Handle new rows directly against every existing row at a distinct
        # center.
        new_rows = ((FIRST_APEX, self.parent_first),
                    (SECOND_APEX, self.parent_second))
        for new_center, new_row in new_rows:
            for center in VERTICES:
                if center == new_center:
                    continue
                for family in (self.m, *self.cover):
                    s.add(_pb_le([
                        z3.And(new_row[p], family[center, p]) for p in VERTICES
                    ], 2))
                    left, right = sorted((new_center, center))
                    for a, b in itertools.combinations(
                        (p for p in VERTICES if p not in {left, right}), 2
                    ):
                        if (left < a < right) == (left < b < right):
                            s.add(z3.Not(z3.And(
                                new_row[a], new_row[b],
                                family[center, a], family[center, b],
                            )))
            if new_center != FIRST_APEX:
                s.add(_pb_le([
                    z3.And(new_row[p], self.b1[p]) for p in VERTICES
                ], 2))
        s.add(_pb_le([
            z3.And(self.parent_first[p], self.parent_second[p])
            for p in VERTICES
        ], 2))

        # Count target-pair bisector centers after adding both retained rows.
        for a, b in itertools.combinations(VERTICES, 2):
            at_centers = []
            for center in VERTICES:
                occurrences = [
                    z3.And(family[center, a], family[center, b])
                    for family in (self.m, *self.cover)
                ]
                if center == FIRST_APEX:
                    occurrences.extend((
                        z3.And(self.b1[a], self.b1[b]),
                        z3.And(self.parent_first[a], self.parent_first[b]),
                    ))
                if center == SECOND_APEX:
                    occurrences.append(z3.And(
                        self.parent_second[a], self.parent_second[b]
                    ))
                at_centers.append(z3.Or(*occurrences))
            s.add(_pb_le(at_centers, 2))

    def _add_ordinal_prefilter(self) -> None:
        """Put the generic strict-order metric theory in the outer solver.

        Previously the Boolean outer rediscovered hundreds of row-only
        Kalmanson cores in the exact-LRA callback.  The implications below
        state the same source-valid fact without a literal core bank: two
        selected members of one row are equidistant from its center.  Hence
        every outer model already satisfies all strict triangle/Kalmanson
        constraints together with every selected-row equality.

        Exact-class exclusions and uniqueness remain in ``linear_check``;
        those are the focused source assumptions whose first use we want to
        observe.
        """
        s = self.solver
        self.ordinal_distances = {
            pair: z3.Real(f"outer_d_{pair[0]}_{pair[1]}")
            for pair in itertools.combinations(VERTICES, 2)
        }
        D = lambda a, b: (
            z3.RealVal(0) if a == b else self.ordinal_distances[edge(a, b)]
        )
        for value in self.ordinal_distances.values():
            s.add(value >= 1)
        for a, b, c in itertools.combinations(VERTICES, 3):
            s.add(D(a,b)+D(b,c) >= D(a,c)+1)
            s.add(D(a,c)+D(b,c) >= D(a,b)+1)
            s.add(D(a,b)+D(a,c) >= D(b,c)+1)
        for a, b, c, d in itertools.combinations(VERTICES, 4):
            diagonal = D(a,c)+D(b,d)
            s.add(diagonal >= D(a,b)+D(c,d)+1)
            s.add(diagonal >= D(a,d)+D(b,c)+1)

        def add_row(center: int, row: list[z3.BoolRef]) -> None:
            for left, right in itertools.combinations(VERTICES, 2):
                s.add(z3.Implies(
                    z3.And(row[left], row[right]),
                    D(center,left) == D(center,right),
                ))

        for family in (self.m, *self.cover):
            for center in VERTICES:
                add_row(center, [family[center,p] for p in VERTICES])
        add_row(FIRST_APEX, self.b1)
        add_row(SECOND_APEX, self.shell)
        add_row(FIRST_APEX, self.parent_first)
        add_row(SECOND_APEX, self.parent_second)

    def decode(self, model: z3.ModelRef) -> dict[str, object]:
        out = super().decode(model)
        out["radius_arm"] = self.radius_arm
        out["parent_first"] = [
            p for p in VERTICES
            if z3.is_true(model.eval(self.parent_first[p], model_completion=True))
        ]
        out["parent_second"] = [
            p for p in VERTICES
            if z3.is_true(model.eval(self.parent_second[p], model_completion=True))
        ]
        return out

    def assignment_atoms(
        self, decoded: dict[str, object]
    ) -> list[z3.BoolRef]:
        """Return the complete finite assignment represented by ``decoded``."""
        atoms: list[z3.BoolRef] = []
        for raw, symbolic in zip(
            [decoded["rows"], *decoded["cover_rows"]],
            [self.m, *self.cover], strict=True,
        ):
            for center in VERTICES:
                support = set(raw[str(center)])
                atoms.extend(
                    symbolic[center, p] == z3.BoolVal(p in support)
                    for p in VERTICES
                )
        atoms.extend(
            self.blocker[source] == decoded["blockers"][source]
            for source in VERTICES
        )
        shell = set(decoded["shell"])
        atoms.extend(self.shell[p] == z3.BoolVal(p in shell) for p in VERTICES)
        atoms.extend((self.q == decoded["q"], self.w == decoded["w"]))
        for key, symbolic in (
            ("b1", self.b1),
            ("parent_first", self.parent_first),
            ("parent_second", self.parent_second),
        ):
            support = set(decoded[key])
            atoms.extend(symbolic[p] == z3.BoolVal(p in support) for p in VERTICES)
        return atoms

    def block_full(self, decoded: dict[str, object]) -> None:
        # BaseOuter.block_decoded omits the two new retained rows.
        atoms = self.assignment_atoms(decoded)
        self.solver.add(z3.Not(z3.And(*atoms)))

    def block_core(self, core: list[str], decoded: dict[str, object]) -> bool:
        """Block a metric-UNSAT conjunction when it has a Boolean antecedent.

        Returns false when a core family is not yet mapped; callers then fall
        back to blocking the complete decoded assignment.
        """
        families = {"m": self.m, "g0": self.cover[0], "g1": self.cover[1]}
        vectors = {"double": self.b1, "shell": self.shell,
                   "parentB1": self.parent_first,
                   "parentB2": self.parent_second}

        # A row-only contradiction is invariant under every increasing
        # embedding into the same common order.  Block the whole order schema,
        # not only the literal labels that happened to be decoded.
        parsed_rows: list[tuple[str,int,int,int]] = []
        row_only = True
        for name in core:
            parts = name.split("|")
            if parts[0] != "row" or parts[1] not in families:
                row_only = False
                break
            left, right = map(int, parts[3].split("="))
            parsed_rows.append((parts[1],int(parts[2]),left,right))
        if row_only and parsed_rows:
            labels = sorted({x for _,c,a,b in parsed_rows for x in (c,a,b)})
            rank = {label:i for i,label in enumerate(labels)}
            for image in itertools.combinations(VERTICES,len(labels)):
                atoms = []
                for family,center,left,right in parsed_rows:
                    symbolic=families[family]
                    c=image[rank[center]];a=image[rank[left]];b=image[rank[right]]
                    atoms.extend((symbolic[c,a],symbolic[c,b]))
                self.solver.add(z3.Not(z3.And(*atoms)))
            return True

        atoms: list[z3.BoolRef] = []
        for name in core:
            parts = name.split("|")
            if parts[0] == "row":
                family, center = parts[1], int(parts[2])
                left, right = map(int, parts[3].split("="))
                if family in families:
                    symbolic = families[family]
                    atoms.extend((symbolic[center,left], symbolic[center,right]))
                elif family in vectors:
                    symbolic = vectors[family]
                    atoms.extend((symbolic[left], symbolic[right]))
                else:
                    return False
            elif parts[0] == "shellExact":
                atoms.append(z3.Not(self.shell[int(parts[1])]))
            elif parts[0] == "criticalExact":
                center, point = map(int, parts[1:])
                atoms.append(z3.Or(*(self.blocker[s] == center for s in VERTICES)))
                atoms.append(z3.Not(self.m[center,point]))
            elif parts[0] == "criticalUniqueK4":
                center = int(parts[1]); quad = list(map(int,parts[2].split(",")))
                atoms.append(z3.Or(*(self.blocker[s] == center for s in VERTICES)))
                atoms.append(z3.Not(z3.And(*(self.m[center,p] for p in quad))))
            elif parts[0] == "firstApexRadius":
                # The chosen gate fixes this source-level radius arm.
                continue
            elif parts[0] == "firstApexExactSix":
                point = int(parts[1])
                atoms.append(z3.Not(z3.Or(
                    self.m[FIRST_APEX,point], self.b1[point]
                )))
            elif parts[0] == "frontierSecondApex":
                atoms.extend((self.q == decoded["q"], self.w == decoded["w"]))
            elif parts[0] == "shellUniqueK4":
                quad = list(map(int,parts[1].split(",")))
                atoms.append(z3.Not(z3.And(*(self.shell[p] for p in quad))))
            elif parts[0] == "firstApexDistinctRetainedExact":
                atoms.append(z3.Not(self.m[FIRST_APEX,int(parts[1])]))
            elif parts[0] == "firstApexDistinctDoubleExact":
                atoms.append(z3.Not(self.b1[int(parts[1])]))
            else:
                return False
        self.solver.add(z3.Not(z3.And(*atoms)))
        return True


def edge(a: int, b: int) -> tuple[int, int]:
    return (a, b) if a < b else (b, a)


def qstr(value: z3.RatNumRef) -> str:
    return str(Fraction(value.numerator_as_long(), value.denominator_as_long()))


def verify_focus(decoded: dict[str, object]) -> list[str]:
    errors = verify_decoded(decoded)
    first = set(decoded["parent_first"])
    second = set(decoded["parent_second"])
    shell = set(decoded["shell"])
    q = int(decoded["q"])
    rows = {int(c): set(s) for c, s in decoded["rows"].items()}
    double = set(decoded["b1"])
    if len(first) != 4 or FIRST_APEX in first or q in first:
        errors.append("invalid retained q-deleted first row")
    if len(second) != 4 or SECOND_APEX in second or q in second:
        errors.append("invalid retained q-deleted second row")
    if len(first & second) > 2 or not second <= shell:
        errors.append("retained row overlap/subset failure")
    if len(first & set(PHYSICAL_INTERIOR)) > 1:
        errors.append("retained first row physical hit bound")
    if len(second & set(PHYSICAL_INTERIOR)) < 2:
        errors.append("retained second row physical hit bound")
    if len(rows[FIRST_APEX] & STRICT_FIRST_OPPOSITE) < 2:
        errors.append("retained frontier row lacks two strict hits")
    if len(double & STRICT_FIRST_OPPOSITE) < 2:
        errors.append("double row lacks two strict hits")
    if decoded["radius_arm"] == "distinct" and rows[FIRST_APEX] & double:
        errors.append("distinct-radius rows are not disjoint")
    if decoded["radius_arm"] == "distinct":
        covered = ((rows[FIRST_APEX] & STRICT_FIRST_OPPOSITE) |
                   (double & STRICT_FIRST_OPPOSITE))
        if covered != STRICT_FIRST_OPPOSITE:
            errors.append("distinct-radius strict-cap partition failure")
    else:
        union = rows[FIRST_APEX] | double
        if len(union) != 6 or not STRICT_FIRST_OPPOSITE <= union:
            errors.append("same-radius exact-six role failure")
    return errors


def _neq(left: z3.ArithRef, right: z3.ArithRef) -> z3.BoolRef:
    return z3.Or(left >= right + 1, right >= left + 1)


def linear_check(decoded: dict[str, object], timeout_ms: int,
                 seed: int) -> dict[str, object]:
    table = {pair: z3.Real(f"d_{pair[0]}_{pair[1]}")
             for pair in itertools.combinations(VERTICES, 2)}
    D = lambda a, b: z3.RealVal(0) if a == b else table[edge(a, b)]
    solver = z3.SolverFor("QF_LRA")
    solver.set(timeout=max(1, timeout_ms), random_seed=seed)
    for value in table.values():
        solver.add(value >= 1)
    for a, b, c in itertools.combinations(VERTICES, 3):
        solver.add(D(a,b)+D(b,c) >= D(a,c)+1)
        solver.add(D(a,c)+D(b,c) >= D(a,b)+1)
        solver.add(D(a,b)+D(a,c) >= D(b,c)+1)
    for a, b, c, d in itertools.combinations(VERTICES, 4):
        diag = D(a,c)+D(b,d)
        solver.add(diag >= D(a,b)+D(c,d)+1)
        solver.add(diag >= D(a,d)+D(b,c)+1)

    tracked: list[tuple[str, z3.BoolRef]] = []
    def track(name: str, proposition: z3.BoolRef) -> None:
        marker = z3.Bool(f"t_{len(tracked)}")
        solver.add(z3.Implies(marker, proposition))
        tracked.append((name, marker))
    def row(name: str, center: int, support: set[int]) -> None:
        ref = min(support)
        for p in sorted(support - {ref}):
            track(f"row|{name}|{center}|{ref}={p}", D(center,ref)==D(center,p))

    rows = {int(c): set(s) for c, s in decoded["rows"].items()}
    covers = [{int(c): set(s) for c, s in raw.items()}
              for raw in decoded["cover_rows"]]
    for name, family in (("m", rows), ("g0", covers[0]), ("g1", covers[1])):
        for center, support in family.items(): row(name, center, support)
    row("double", FIRST_APEX, set(decoded["b1"]))
    row("shell", SECOND_APEX, set(decoded["shell"]))
    row("parentB1", FIRST_APEX, set(decoded["parent_first"]))
    row("parentB2", SECOND_APEX, set(decoded["parent_second"]))

    q = int(decoded["q"]); w = int(decoded["w"])
    track("frontierSecondApex|qNeWRadius",
          _neq(D(SECOND_APEX,q),D(SECOND_APEX,w)))

    shell = set(decoded["shell"]); shell_ref = min(shell)
    for p in set(VERTICES) - shell - {SECOND_APEX}:
        track(f"shellExact|{p}", _neq(D(SECOND_APEX,p), D(SECOND_APEX,shell_ref)))
    second_targets = sorted(set(VERTICES) - {SECOND_APEX})
    for quad in itertools.combinations(second_targets,4):
        if set(quad) <= shell:
            continue
        q0=quad[0]
        track(f"shellUniqueK4|{','.join(map(str,quad))}",
              z3.Or(*(_neq(D(SECOND_APEX,q0),D(SECOND_APEX,p))
                      for p in quad[1:])))

    # Actual blocker rows are complete exact four-classes and their selected
    # radius is the only K4-capable radius at that center.
    blocker_image = set(map(int, decoded["blockers"]))
    for center in sorted(blocker_image):
        support = rows[center]; ref = min(support)
        for p in set(VERTICES) - support - {center}:
            track(f"criticalExact|{center}|{p}", _neq(D(center,p),D(center,ref)))
        outside = sorted(set(VERTICES) - {center})
        for quad in itertools.combinations(outside, 4):
            if set(quad) == support:
                continue
            q0 = quad[0]
            track(
                f"criticalUniqueK4|{center}|{','.join(map(str,quad))}",
                z3.Or(*(_neq(D(center,q0),D(center,p)) for p in quad[1:])),
            )

    retained_ref = min(rows[FIRST_APEX]); double_ref = min(set(decoded["b1"]))
    if decoded["radius_arm"] == "same":
        track("firstApexRadius|same",
              D(FIRST_APEX,retained_ref)==D(FIRST_APEX,double_ref))
        same_class = rows[FIRST_APEX] | set(decoded["b1"])
        for p in set(VERTICES) - same_class - {FIRST_APEX}:
            track(f"firstApexExactSix|{p}",
                  _neq(D(FIRST_APEX,p),D(FIRST_APEX,retained_ref)))
    else:
        track("firstApexRadius|distinct",
              _neq(D(FIRST_APEX,retained_ref),D(FIRST_APEX,double_ref)))
        for p in set(VERTICES) - rows[FIRST_APEX] - {FIRST_APEX}:
            track(f"firstApexDistinctRetainedExact|{p}",
                  _neq(D(FIRST_APEX,p),D(FIRST_APEX,retained_ref)))
        double_support = set(decoded["b1"])
        for p in set(VERTICES) - double_support - {FIRST_APEX}:
            track(f"firstApexDistinctDoubleExact|{p}",
                  _neq(D(FIRST_APEX,p),D(FIRST_APEX,double_ref)))

    assumptions = [marker for _, marker in tracked]
    status = solver.check(*assumptions)
    if status != z3.sat:
        result: dict[str, object] = {"status": str(status).upper()}
        if status == z3.unknown:
            result["reason"] = solver.reason_unknown()
        else:
            names = {str(marker): name for name, marker in tracked}
            core = [names[str(marker)] for marker in solver.unsat_core()]
            # Deletion-minimize while the budget remains in the local solver.
            i = 0
            while i < len(core):
                trial = core[:i] + core[i+1:]
                by_name = {name: marker for name, marker in tracked}
                verdict = solver.check(*(by_name[name] for name in trial))
                if verdict == z3.unsat:
                    core = trial
                else:
                    i += 1
            result["core"] = core
        return result
    model = solver.model()
    distances = {f"{a},{b}": qstr(model.eval(value, model_completion=True))
                 for (a,b), value in table.items()}
    errors = verify_metric(decoded, distances)
    if errors:
        return {"status": "ENCODER_ERROR", "errors": errors}
    return {"status": "SAT", "distances": distances}


def verify_metric(decoded: dict[str, object], raw: dict[str, str]) -> list[str]:
    values = {tuple(map(int, key.split(","))): Fraction(value)
              for key, value in raw.items()}
    D = lambda a,b: Fraction(0) if a==b else values[edge(a,b)]
    errors: list[str] = []
    def require(ok: bool, text: str) -> None:
        if not ok: errors.append(text)
    for value in values.values(): require(value >= 1, "nonpositive distance")
    for a,b,c in itertools.combinations(VERTICES,3):
        require(D(a,b)+D(b,c)>=D(a,c)+1, f"triangle {a,b,c}/0")
        require(D(a,c)+D(b,c)>=D(a,b)+1, f"triangle {a,b,c}/1")
        require(D(a,b)+D(a,c)>=D(b,c)+1, f"triangle {a,b,c}/2")
    for a,b,c,d in itertools.combinations(VERTICES,4):
        diag=D(a,c)+D(b,d)
        require(diag>=D(a,b)+D(c,d)+1, f"kalmanson {a,b,c,d}/0")
        require(diag>=D(a,d)+D(b,c)+1, f"kalmanson {a,b,c,d}/1")
    rows={int(c):set(s) for c,s in decoded["rows"].items()}
    covers=[{int(c):set(s) for c,s in rawf.items()} for rawf in decoded["cover_rows"]]
    families=[rows,*covers]
    selected=[*( (c,s) for f in families for c,s in f.items()),
              (FIRST_APEX,set(decoded["b1"])),
              (SECOND_APEX,set(decoded["shell"])),
              (FIRST_APEX,set(decoded["parent_first"])),
              (SECOND_APEX,set(decoded["parent_second"]))]
    for center,support in selected:
        require(len({D(center,p) for p in support})==1,
                f"row equality {center}:{sorted(support)}")
    shell=set(decoded["shell"]); sr=min(shell); r=D(SECOND_APEX,sr)
    require({p for p in VERTICES if p!=SECOND_APEX and D(SECOND_APEX,p)==r}==shell,
            "shell is not exact five")
    second_classes: dict[Fraction,set[int]]={}
    for p in VERTICES:
        if p!=SECOND_APEX: second_classes.setdefault(D(SECOND_APEX,p),set()).add(p)
    require([s for s in second_classes.values() if len(s)>=4]==[shell],
            "second apex has another K4 radius class")
    for center in set(map(int,decoded["blockers"])):
        support=rows[center]; rr=D(center,min(support))
        require({p for p in VERTICES if p!=center and D(center,p)==rr}==support,
                f"critical selected class incomplete {center}")
        classes: dict[Fraction,set[int]]={}
        for p in VERTICES:
            if p!=center: classes.setdefault(D(center,p),set()).add(p)
        require([s for s in classes.values() if len(s)>=4]==[support],
                f"critical center has another K4 class {center}")
    rr=D(FIRST_APEX,min(rows[FIRST_APEX])); dr=D(FIRST_APEX,min(set(decoded["b1"])))
    require((rr==dr)==(decoded["radius_arm"]=="same"), "radius arm mismatch")
    if decoded["radius_arm"] == "same":
        support = rows[FIRST_APEX] | set(decoded["b1"])
        require({p for p in VERTICES if p != FIRST_APEX and D(FIRST_APEX,p)==rr}
                == support and len(support)==6,
                "same-radius first-apex class is not exact six")
    else:
        retained=rows[FIRST_APEX];double=set(decoded["b1"])
        require({p for p in VERTICES if p!=FIRST_APEX and D(FIRST_APEX,p)==rr}
                == retained,
                "distinct retained first-apex class is not exact four")
        require({p for p in VERTICES if p!=FIRST_APEX and D(FIRST_APEX,p)==dr}
                == double,
                "distinct double first-apex class is not exact four")
    q=int(decoded["q"]);w=int(decoded["w"])
    require(D(SECOND_APEX,q)!=D(SECOND_APEX,w),
            "frontier pair is co-radial at second apex")
    return errors


def solve(orbit: str, radius_arm: str, seconds: float, seed: int,
          max_candidates: int) -> dict[str, object]:
    deadline=time.monotonic()+seconds
    outer=FocusOuter(orbit,radius_arm,max(1,int(seconds*1000)),seed)
    cuts={"m":0,"g0":0,"g1":0}; checked=0; first_core=None
    first_focused_core=None
    focused_core_count=0
    while checked < max_candidates:
        remaining=int((deadline-time.monotonic())*1000)
        if remaining<=0:
            return {"status":"UNKNOWN","reason":"wall budget","checked":checked,
                    "first_core":first_core,"first_focused_core":first_focused_core,
                    "focused_core_count":focused_core_count,"connectivity_cuts":cuts}
        outer.solver.set(timeout=remaining,random_seed=seed)
        status=outer.solver.check()
        if status!=z3.sat:
            return {"status":str(status).upper(),"reason":outer.solver.reason_unknown() if status==z3.unknown else "outer exhausted",
                    "checked":checked,"first_core":first_core,"connectivity_cuts":cuts}
        decoded=outer.decode(outer.solver.model())
        families=[{int(c):set(s) for c,s in decoded["rows"].items()},
                  *[{int(c):set(s) for c,s in raw.items()} for raw in decoded["cover_rows"]]]
        added=False
        for name,symbolic,family in zip(("m","g0","g1"),(outer.m,*outer.cover),families,strict=True):
            for component in sink_sccs(family):
                if len(component)<N:
                    outer.add_connectivity_cut(symbolic,component);cuts[name]+=1;added=True
        if added: continue
        errors=verify_focus(decoded)
        if errors: return {"status":"ENCODER_ERROR","errors":errors,"decoded":decoded}
        checked+=1
        metric=linear_check(decoded,min(30_000,remaining),seed)
        if metric["status"]=="SAT":
            return {"status":"SAT","label":"SAT_VERIFIED_EXACT_CARD13_FULL_ROLE_RETAINED_ORDERED_SHADOW",
                    "epistemic_scope":"exact rational triangle/Kalmanson plus selected/full-class parent projection; not planar/MEC",
                    "checked":checked,"decoded":decoded,**metric}
        if metric["status"] in {"UNKNOWN","ENCODER_ERROR"}:
            return {"checked":checked,"decoded":decoded,**metric}
        if first_core is None: first_core={"decoded":decoded,"core":metric["core"]}
        if any(
            "parentB" in item or "firstApex" in item or
            item.startswith("row|double|")
            for item in metric["core"]
        ):
            focused_core_count += 1
            if first_focused_core is None:
                first_focused_core={"decoded":decoded,"core":metric["core"]}
        if not outer.block_core(metric["core"], decoded):
            outer.block_full(decoded)
        if checked % 10 == 0:
            print(f"progress orbit={orbit} arm={radius_arm} checked={checked}",
                  file=sys.stderr, flush=True)
    return {"status":"UNKNOWN","reason":"candidate budget","checked":checked,
            "first_core":first_core,"first_focused_core":first_focused_core,
            "focused_core_count":focused_core_count,"connectivity_cuts":cuts}


def main() -> None:
    p=argparse.ArgumentParser()
    p.add_argument("--orbit",choices=ALL_ONE_ORBITS,required=True)
    p.add_argument("--radius-arm",choices=("same","distinct"),required=True)
    p.add_argument("--seconds",type=float,default=300)
    p.add_argument("--seed",type=int,default=1)
    p.add_argument("--max-candidates",type=int,default=100)
    p.add_argument("--output",type=Path)
    a=p.parse_args(); result={"schema":"p97-exact5-full-role-retained-card13-v1",
        "profile":"5,6,5","orbit":a.orbit,"radius_arm":a.radius_arm,
        **solve(a.orbit,a.radius_arm,a.seconds,a.seed,a.max_candidates)}
    text=json.dumps(result,indent=2,sort_keys=True)
    if a.output:a.output.write_text(text+"\n")
    print(text)


if __name__=="__main__": main()
