"""Source-owned structural query for the FreshThird exact-three carrier fans.

This module encodes the finite named-role theory exported by
``FreshThirdQFiberThreeCarrierFiniteSourceTheory.lean``.  It never enumerates
the ambient carrier: ``HasFourAfterDeleting`` and ``Nonrobust`` remain opaque
semantic atoms constrained only by source-proved laws.

Verdicts are deliberately scoped:

* SAT is ``SAT_ABSTRACTION`` and supplies theorem-mining data only.
* UNSAT is ``UNSAT_RELAXATION`` until an independently replayed certificate is
  connected to the Lean ``QueryContract``.
* no result claims a theorem, universal closure, Lean closure, or Euclidean
  realizability.
"""

from __future__ import annotations

import argparse
import concurrent.futures
import hashlib
import itertools
import json
import os
from collections.abc import Iterable, Sequence
from dataclasses import dataclass
from pathlib import Path
from typing import Any

import z3

SCHEMA = "p97-freshthird-qfiber-three-carrier-query/v1"
RESULT_SCHEMA = "p97-freshthird-qfiber-three-carrier-result/v1"

REPO_ROOT = Path(__file__).resolve().parents[2]
QUERY_LEAN = REPO_ROOT / (
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
    "FreshThirdQFiberThreeCarrierFiniteQuery.lean"
)
SOURCE_THEORY_LEAN = REPO_ROOT / (
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
    "FreshThirdQFiberThreeCarrierFiniteSourceTheory.lean"
)
PINNED_THEORY_LEAN = REPO_ROOT / (
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
    "TwoSourceFreshThirdResidual.lean"
)

FALSE_CLAIMS = {
    "source_entitlement": False,
    "theorem": False,
    "universal": False,
    "lean": False,
    "euclidean": False,
}


def _indexed(prefix: str, n: int) -> tuple[str, ...]:
    return tuple(f"{prefix}{i}" for i in range(n))


SEED = (
    "canonicalSource",
    "canonicalSecondSource",
    "freshSourceOne",
    "freshSourceTwo",
    "freshRemainder0",
    "freshRemainder1",
)
FAN_SOURCES = _indexed("fanSource", 4)
BOUNDARY_SOURCES = _indexed("boundarySource", 4)
BLOCKER_CENTERS = _indexed("blockerCenter", 4)
BLOCKER_ROW_SOURCES = tuple(
    f"blockerRowSource{i}_{j}" for i in range(4) for j in range(4)
)
OLD_CONSTANTS = (
    "pinnedCenter",
    "boundaryCenter",
    "sourceCenter",
    "freshCenter",
)
OLD_ROLES = (
    *SEED,
    *OLD_CONSTANTS,
    *FAN_SOURCES,
    *BOUNDARY_SOURCES,
    *BLOCKER_CENTERS,
    *BLOCKER_ROW_SOURCES,
)

Q_SOURCES = _indexed("qSource", 4)
BOUNDARY_ROW_SOURCES = _indexed("boundaryRowSource", 4)
BOUNDARY_FAN_BLOCKER_CENTERS = _indexed("boundaryFanBlockerCenter", 4)
BOUNDARY_FAN_BLOCKER_ROW_SOURCES = tuple(
    f"boundaryFanBlockerRowSource{i}_{j}" for i in range(4) for j in range(4)
)
EXTRA_ROLES = (
    *Q_SOURCES,
    "boundaryBlockerCenter",
    *BOUNDARY_ROW_SOURCES,
    *BOUNDARY_FAN_BLOCKER_CENTERS,
    *BOUNDARY_FAN_BLOCKER_ROW_SOURCES,
)
ROLES = (*OLD_ROLES, *EXTRA_ROLES)

ROWS: dict[str, tuple[str, tuple[str, str, str, str], str]] = {
    "source": ("exact_selected_four", SEED[:4], "sourceCenter"),
    "fresh": (
        "exact_q_row_inherited",
        ("freshSourceOne", "freshSourceTwo", "freshRemainder0", "freshRemainder1"),
        "freshCenter",
    ),
    "boundary": ("packet_boundary_selected_four", BOUNDARY_SOURCES, "boundaryCenter"),
    "fan": ("source_faithful_pinned_fan_row", FAN_SOURCES, "pinnedCenter"),
}
for _i in range(4):
    ROWS[f"blocker{_i}"] = (
        "pinned_fan_canonical_blocker_row",
        tuple(f"blockerRowSource{_i}_{j}" for j in range(4)),
        f"blockerCenter{_i}",
    )
ROWS["q"] = ("actual_q_selected_four", Q_SOURCES, "freshCenter")
ROWS["boundaryBlocker"] = (
    "q_boundary_source_canonical_blocker_row",
    BOUNDARY_ROW_SOURCES,
    "boundaryBlockerCenter",
)
for _i in range(4):
    ROWS[f"boundaryFanBlocker{_i}"] = (
        "boundary_row_second_order_canonical_blocker_row",
        tuple(f"boundaryFanBlockerRowSource{_i}_{j}" for j in range(4)),
        f"boundaryFanBlockerCenter{_i}",
    )

assert len(OLD_ROLES) == 38
assert len(EXTRA_ROLES) == 29
assert len(ROLES) == 67
assert len(set(ROLES)) == len(ROLES)
assert len(ROWS) == 14

RADIUS_CENTERS = tuple(dict.fromkeys(center for _origin, _slots, center in ROWS.values()))
DELETION_CENTERS = (
    "pinnedCenter",
    *BLOCKER_CENTERS,
    "freshCenter",
    "boundaryBlockerCenter",
    *BOUNDARY_FAN_BLOCKER_CENTERS,
)
MODEL_SIGNATURE_KEYS = frozenset(
    {
        "point_classes",
        "cap_witnesses",
        "in_cap",
        "in_cap_interior",
        "order",
        "radius_classes",
        "has_four_after_deleting",
        "nonrobust",
    }
)
CAP_WITNESS_KEYS = frozenset(
    {"first", "fresh", "row", "boundary", "blocker", "boundary_fan"}
)


def _sha256_file(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        for chunk in iter(lambda: stream.read(1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest()


def _canonical_json(value: object) -> bytes:
    return (json.dumps(value, sort_keys=True, separators=(",", ":")) + "\n").encode()


def _atomic_json(path: Path, value: object) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    payload = _canonical_json(value)
    tmp = path.with_name(f".{path.name}.{os.getpid()}.tmp")
    with tmp.open("wb") as stream:
        stream.write(payload)
        stream.flush()
        os.fsync(stream.fileno())
    os.replace(tmp, path)


@dataclass(frozen=True)
class QueryVars:
    point_class: dict[str, z3.IntNumRef]
    max_class: tuple[z3.IntNumRef, ...]
    first_cap: z3.IntNumRef
    fresh_cap: z3.IntNumRef
    row_cap: z3.IntNumRef
    blocker_cap: tuple[z3.IntNumRef, ...]
    boundary_cap: z3.IntNumRef
    boundary_fan_cap: tuple[z3.IntNumRef, ...]
    in_cap: z3.FuncDeclRef
    in_cap_interior: z3.FuncDeclRef
    order: z3.FuncDeclRef
    cap_interval_lo: tuple[z3.IntNumRef, ...]
    cap_interval_hi: tuple[z3.IntNumRef, ...]
    cap_interval_mode: tuple[z3.IntNumRef, ...]
    radius_class: z3.FuncDeclRef
    has_four: z3.FuncDeclRef
    nonrobust: z3.FuncDeclRef


@dataclass
class CarrierQuery:
    boundary_index: int
    solver: z3.Solver
    variables: QueryVars
    groups: tuple[str, ...]

    def point(self, role: str) -> z3.ArithRef:
        return self.variables.point_class[role]

    def same(self, left: str, right: str) -> z3.BoolRef:
        return self.point(left) == self.point(right)

    def incident(self, role: str, row: str) -> z3.BoolRef:
        slots = ROWS[row][1]
        return z3.Or(*(self.same(role, slot) for slot in slots))

    def cap(self, role: str, cap: z3.ArithRef | int) -> z3.BoolRef:
        return self.variables.in_cap(self.point(role), cap)

    def interior(self, role: str, cap: z3.ArithRef | int) -> z3.BoolRef:
        return self.variables.in_cap_interior(self.point(role), cap)

    def before(self, left: str, right: str) -> z3.BoolRef:
        return self.variables.order(self.point(left)) < self.variables.order(
            self.point(right)
        )

    def same_distance(self, center: str, left: str, right: str) -> z3.BoolRef:
        radius = self.variables.radius_class
        return radius(self.point(center), self.point(left)) == radius(
            self.point(center), self.point(right)
        )

    def has4(self, deleted: str, center: str) -> z3.BoolRef:
        return self.variables.has_four(self.point(deleted), self.point(center))

    def is_nonrobust(self, center: str) -> z3.BoolRef:
        return self.variables.nonrobust(self.point(center))


class _Builder:
    def __init__(self, boundary_index: int, timeout_ms: int):
        if boundary_index not in range(4):
            raise ValueError("boundary_index must be in range(4)")
        self.boundary_index = boundary_index
        self.solver = z3.Solver()
        self.solver.set(timeout=timeout_ms)
        point_class = {role: z3.Int(f"point_class__{role}") for role in ROLES}
        max_class = tuple(z3.Int(f"max_class__{i}") for i in range(len(ROLES)))
        self.v = QueryVars(
            point_class=point_class,
            max_class=max_class,
            first_cap=z3.Int("first_cap"),
            fresh_cap=z3.Int("fresh_cap"),
            row_cap=z3.Int("row_cap"),
            blocker_cap=tuple(z3.Int(f"blocker_cap__{i}") for i in range(4)),
            boundary_cap=z3.Int("boundary_cap"),
            boundary_fan_cap=tuple(
                z3.Int(f"boundary_fan_cap__{i}") for i in range(4)
            ),
            in_cap=z3.Function("in_cap", z3.IntSort(), z3.IntSort(), z3.BoolSort()),
            in_cap_interior=z3.Function(
                "in_cap_interior", z3.IntSort(), z3.IntSort(), z3.BoolSort()
            ),
            order=z3.Function("boundary_order", z3.IntSort(), z3.IntSort()),
            cap_interval_lo=tuple(z3.Int(f"cap_interval_lo__{i}") for i in range(3)),
            cap_interval_hi=tuple(z3.Int(f"cap_interval_hi__{i}") for i in range(3)),
            cap_interval_mode=tuple(
                z3.Int(f"cap_interval_mode__{i}") for i in range(3)
            ),
            radius_class=z3.Function(
                "radius_class", z3.IntSort(), z3.IntSort(), z3.IntSort()
            ),
            has_four=z3.Function(
                "has_four_after_deleting", z3.IntSort(), z3.IntSort(), z3.BoolSort()
            ),
            nonrobust=z3.Function("nonrobust", z3.IntSort(), z3.BoolSort()),
        )
        self.groups: list[str] = []

    def q(self) -> CarrierQuery:
        return CarrierQuery(self.boundary_index, self.solver, self.v, tuple(self.groups))

    def add_group(self, name: str, constraints: Iterable[z3.BoolRef]) -> None:
        items = tuple(constraints)
        if not items:
            raise ValueError(f"empty constraint group: {name}")
        if name in self.groups:
            raise ValueError(f"duplicate constraint group: {name}")
        self.groups.append(name)
        self.solver.assert_and_track(z3.And(*items), z3.Bool(f"source__{name}"))


def _row_support_eq(q: CarrierQuery, left: str, right: str) -> z3.BoolRef:
    return z3.And(
        *(q.incident(slot, right) for slot in ROWS[left][1])
    )


def _row_overlap_count(q: CarrierQuery, left: str, right: str) -> z3.ArithRef:
    return z3.Sum(
        *(z3.If(q.incident(slot, right), 1, 0) for slot in ROWS[left][1])
    )


def _cap_interval_membership(
    q: CarrierQuery, role: str, cap: int
) -> z3.BoolRef:
    """One cyclic interval over the represented global boundary ranks.

    Modes are empty, one ordinary closed interval, one wrapping interval, and
    full.  Rank gaps are harmless: the contract concerns only named carrier
    roles, exactly as the Lean `NoAlternatingCap` projection does.
    """
    position = q.variables.order(q.point(role))
    lo = q.variables.cap_interval_lo[cap]
    hi = q.variables.cap_interval_hi[cap]
    mode = q.variables.cap_interval_mode[cap]
    return z3.Or(
        mode == 3,
        z3.And(mode == 1, lo <= position, position <= hi),
        z3.And(mode == 2, z3.Or(position <= lo, hi <= position)),
    )


def _cap_cyclic_interval_constraints(q: CarrierQuery) -> tuple[z3.BoolRef, ...]:
    constraints: list[z3.BoolRef] = []
    for cap in range(3):
        lo = q.variables.cap_interval_lo[cap]
        hi = q.variables.cap_interval_hi[cap]
        mode = q.variables.cap_interval_mode[cap]
        constraints.extend(
            (
                mode >= 0,
                mode <= 3,
                lo >= 0,
                lo < len(ROLES),
                hi >= 0,
                hi < len(ROLES),
                z3.Implies(mode == 1, lo <= hi),
                z3.Implies(mode == 2, lo < hi),
            )
        )
        constraints.extend(
            q.cap(role, cap) == _cap_interval_membership(q, role, cap)
            for role in ROLES
        )
    return tuple(constraints)


def _row_cap_count(
    q: CarrierQuery, row: str, cap: z3.ArithRef, *, inside: bool
) -> z3.ArithRef:
    terms = []
    for slot in ROWS[row][1]:
        atom = q.cap(slot, cap)
        terms.append(z3.If(atom if inside else z3.Not(atom), 1, 0))
    return z3.Sum(*terms)


def _row_outside_overlap_count(
    q: CarrierQuery, left: str, right: str, cap: z3.ArithRef | int
) -> z3.ArithRef:
    return z3.Sum(
        *(
            z3.If(
                z3.And(q.incident(slot, right), z3.Not(q.cap(slot, cap))),
                1,
                0,
            )
            for slot in ROWS[left][1]
        )
    )


def _outside_seed(q: CarrierQuery, role: str) -> z3.BoolRef:
    return z3.And(*(z3.Not(q.same(role, seed)) for seed in SEED))


def _no_three_sources_in_row(
    q: CarrierQuery, sources: Sequence[str], row: str
) -> z3.BoolRef:
    clauses = []
    for injection in itertools.permutations(range(4), 3):
        clauses.append(
            z3.Not(z3.And(*(q.incident(sources[i], row) for i in injection)))
        )
    return z3.And(*clauses)


def _endpoint_cap_split(
    q: CarrierQuery, first_deleted: str, second_deleted: str
) -> z3.BoolRef:
    row_cap = q.variables.row_cap
    return z3.And(
        z3.Or(
            z3.Not(q.incident(first_deleted, "boundary")),
            z3.Not(q.incident(second_deleted, "boundary")),
        ),
        q.cap("boundaryCenter", row_cap),
        _row_cap_count(q, "boundary", row_cap, inside=True) <= 2,
        _row_cap_count(q, "boundary", row_cap, inside=False) >= 2,
    )


def _ordered_row_at_with(q: CarrierQuery, outside: str, between: str) -> z3.BoolRef:
    c = "canonicalSource"
    c2 = "sourceCenter"
    fresh = "freshCenter"
    boundary = "boundaryCenter"
    return z3.Or(
        z3.And(
            q.before(outside, fresh),
            q.before(fresh, between),
            q.before(between, c2),
            q.before(c2, c),
            q.same(boundary, between),
            _endpoint_cap_split(q, c, outside),
        ),
        z3.And(
            q.before(outside, fresh),
            q.before(fresh, between),
            q.before(between, c),
            q.before(c, c2),
            q.same(boundary, outside),
            _endpoint_cap_split(q, c, between),
        ),
        z3.And(
            q.before(c, c2),
            q.before(c2, between),
            q.before(between, fresh),
            q.before(fresh, outside),
            q.same(boundary, between),
            _endpoint_cap_split(q, c, outside),
        ),
        z3.And(
            q.before(c2, c),
            q.before(c, between),
            q.before(between, fresh),
            q.before(fresh, outside),
            q.same(boundary, outside),
            _endpoint_cap_split(q, c, between),
        ),
    )


def build_query(boundary_index: int, *, timeout_ms: int = 60_000) -> CarrierQuery:
    """Build one boundary-index cell of the exact finite source theory."""

    b = _Builder(boundary_index, timeout_ms)
    q = b.q()
    role_index = {role: i for i, role in enumerate(ROLES)}

    # Canonical restricted-growth representation of the Same equivalence.
    partition: list[z3.BoolRef] = [q.point(ROLES[0]) == 0, b.v.max_class[0] == 0]
    for i, role in enumerate(ROLES[1:], 1):
        previous = b.v.max_class[i - 1]
        partition.extend(
            (
                q.point(role) >= 0,
                q.point(role) <= previous + 1,
                b.v.max_class[i]
                == z3.If(q.point(role) > previous, q.point(role), previous),
                b.v.max_class[i] >= 0,
                b.v.max_class[i] <= i,
            )
        )
    b.add_group("same_equivalence_canonical", partition)

    # Full exact-row semantics over all 14 source-owned selected rows.
    row_constraints: list[z3.BoolRef] = []
    for _row, (_origin, slots, center) in ROWS.items():
        row_constraints.extend(q.point(left) != q.point(right) for left, right in itertools.combinations(slots, 2))
        row_constraints.append(z3.Not(q.incident(center, _row)))
        row_constraints.extend(q.same_distance(center, slots[0], slot) for slot in slots)
        row_constraints.extend(
            q.has4(role, center)
            == z3.Or(
                z3.Not(q.is_nonrobust(center)),
                z3.Not(q.incident(role, _row)),
            )
            for role in ROLES
        )
    for left, right in itertools.combinations(ROWS, 2):
        left_center = ROWS[left][2]
        right_center = ROWS[right][2]
        row_constraints.append(
            z3.Implies(
                z3.Not(q.same(left_center, right_center)),
                _row_overlap_count(q, left, right) <= 2,
            )
        )
    for row, (_origin, _slots, center) in ROWS.items():
        for cap in range(3):
            row_constraints.append(
                z3.Implies(
                    q.cap(center, cap),
                    _row_cap_count(q, row, cap, inside=True) <= 2,
                )
            )
    for left, right in itertools.combinations(ROWS, 2):
        left_center = ROWS[left][2]
        right_center = ROWS[right][2]
        for cap in range(3):
            row_constraints.append(
                z3.Implies(
                    z3.And(
                        q.cap(left_center, cap),
                        q.cap(right_center, cap),
                        z3.Not(q.same(left_center, right_center)),
                    ),
                    _row_outside_overlap_count(q, left, right, cap) <= 1,
                )
            )
    b.add_group("complete_exact_row_theory", row_constraints)

    # Full finite relational semantics inherited from the exact view.
    relational: list[z3.BoolRef] = []
    for role in ROLES:
        relational.extend(
            (
                b.v.order(q.point(role)) >= 0,
                b.v.order(q.point(role)) <= b.v.max_class[-1],
                z3.Or(*(q.cap(role, cap) for cap in range(3))),
            )
        )
        for cap in range(3):
            relational.append(z3.Implies(q.interior(role, cap), q.cap(role, cap)))
            for other in range(3):
                if other != cap:
                    relational.append(
                        z3.Implies(q.interior(role, cap), z3.Not(q.cap(role, other)))
                    )
    for left, right in itertools.combinations(ROLES, 2):
        relational.append(
            z3.Implies(
                q.point(left) != q.point(right),
                b.v.order(q.point(left)) != b.v.order(q.point(right)),
            )
        )
    for deleted in ROLES:
        for center in ROLES:
            relational.append(
                z3.Implies(z3.Not(q.has4(deleted, center)), q.is_nonrobust(center))
            )
    b.add_group("complete_relational_theory", relational)

    b.add_group("cap_cyclic_interval_theory", _cap_cyclic_interval_constraints(q))

    caps = (
        b.v.first_cap,
        b.v.fresh_cap,
        b.v.row_cap,
        *b.v.blocker_cap,
        b.v.boundary_cap,
        *b.v.boundary_fan_cap,
    )
    b.add_group("cap_skolem_ranges", (z3.And(cap >= 0, cap < 3) for cap in caps))

    # Old pinned finite source theory.
    pinned: list[z3.BoolRef] = []
    pinned.extend(q.point(left) != q.point(right) for left, right in itertools.combinations(SEED, 2))
    pinned.append(z3.Or(*(q.same("pinnedCenter", seed) for seed in SEED)))
    pinned.extend(
        (
            z3.Not(q.same("pinnedCenter", "sourceCenter")),
            z3.Not(q.same("pinnedCenter", "freshCenter")),
        )
    )
    for injection in itertools.permutations(range(6), 4):
        selected = tuple(SEED[i] for i in injection)
        pinned.append(
            z3.Implies(
                z3.And(*(z3.Not(q.same("pinnedCenter", role)) for role in selected)),
                z3.Not(
                    z3.And(
                        *(q.same_distance("pinnedCenter", selected[0], role) for role in selected)
                    )
                ),
            )
        )
    pinned.extend(
        (
            q.interior("sourceCenter", b.v.first_cap),
            q.interior("canonicalSource", b.v.first_cap),
            q.interior("canonicalSecondSource", b.v.first_cap),
            _row_overlap_count(q, "source", "fresh") == 2,
            b.v.fresh_cap != b.v.first_cap,
            q.interior("freshCenter", b.v.fresh_cap),
            z3.Not(q.cap("freshSourceOne", b.v.first_cap)),
            z3.Not(q.cap("freshSourceTwo", b.v.first_cap)),
            z3.Or(
                _ordered_row_at_with(q, "freshSourceOne", "freshSourceTwo"),
                _ordered_row_at_with(q, "freshSourceTwo", "freshSourceOne"),
            ),
            z3.Or(*(_outside_seed(q, role) for role in FAN_SOURCES)),
            z3.Or(
                z3.And(
                    z3.Not(q.same("pinnedCenter", "boundaryCenter")),
                    z3.Or(*(_outside_seed(q, role) for role in BOUNDARY_SOURCES)),
                ),
                z3.And(
                    q.same("pinnedCenter", "boundaryCenter"),
                    _row_support_eq(q, "fan", "boundary"),
                ),
            ),
        )
    )
    for i in range(4):
        center = f"blockerCenter{i}"
        source = f"fanSource{i}"
        blocker_row = f"blocker{i}"
        pinned.extend(
            (
                q.interior(center, b.v.blocker_cap[i]),
                z3.Not(q.has4(source, center)),
                z3.Or(
                    z3.And(
                        q.same("pinnedCenter", center),
                        _row_support_eq(q, "fan", blocker_row),
                        q.is_nonrobust("pinnedCenter"),
                    ),
                    z3.And(
                        z3.Not(q.same("pinnedCenter", center)),
                        _row_overlap_count(q, "fan", blocker_row) <= 2,
                    ),
                ),
                q.incident(source, blocker_row),
            )
        )
        for role in OLD_ROLES:
            pinned.append(
                q.has4(role, center) == z3.Not(q.incident(role, blocker_row))
            )
        for j in range(4):
            pinned.append(z3.Not(q.has4(f"blockerRowSource{i}_{j}", center)))
    for role in OLD_ROLES:
        pinned.append(
            q.has4(role, "pinnedCenter")
            == z3.Or(
                z3.Not(q.is_nonrobust("pinnedCenter")),
                z3.Not(q.incident(role, "fan")),
            )
        )

    center_outcomes = []
    for i in range(4):
        center = f"blockerCenter{i}"
        source = f"fanSource{i}"
        for cap in range(3):
            center_outcomes.append(
                z3.And(
                    q.same("pinnedCenter", center),
                    q.interior(center, cap),
                    z3.Not(q.has4(source, center)),
                    _row_support_eq(q, "fan", f"blocker{i}"),
                    q.is_nonrobust("pinnedCenter"),
                )
            )
    repeated_cap = []
    mutual_cross = []
    for i in range(4):
        for j in range(4):
            if i == j:
                continue
            ci, cj = f"blockerCenter{i}", f"blockerCenter{j}"
            si, sj = f"fanSource{i}", f"fanSource{j}"
            for cap in range(3):
                repeated_cap.append(
                    z3.And(
                        q.interior(ci, cap),
                        q.interior(cj, cap),
                        z3.Or(q.same(ci, cj), q.has4(sj, ci), q.has4(si, cj)),
                    )
                )
            mutual_cross.append(
                z3.And(
                    q.has4(sj, ci),
                    q.has4(si, cj),
                    z3.Not(q.same(ci, cj)),
                )
            )
    pinned.append(
        z3.Or(
            z3.Or(*center_outcomes),
            z3.And(
                *(z3.Not(q.same("pinnedCenter", center)) for center in BLOCKER_CENTERS),
                z3.Or(*repeated_cap),
                z3.Or(*mutual_cross),
            ),
        )
    )
    b.add_group("pinned_source_theory", pinned)

    # New carrier fan theory and old/new Q-row bridge.
    carrier: list[z3.BoolRef] = []
    carrier.extend(q.point(left) != q.point(right) for left, right in itertools.combinations(Q_SOURCES, 2))
    for role in ROLES:
        carrier.append(q.incident(role, "q") == q.incident(role, "fresh"))
    boundary_source = f"qSource{boundary_index}"
    carrier.extend(
        (
            z3.Or(*(q.same(boundary_source, role) for role in ("freshRemainder0", "freshRemainder1"))),
            z3.Or(*(q.same(role, "freshSourceOne") for role in Q_SOURCES)),
            z3.Or(*(q.same(role, "freshSourceTwo") for role in Q_SOURCES)),
            z3.Not(q.same("boundaryBlockerCenter", "freshCenter")),
            q.interior("boundaryBlockerCenter", b.v.boundary_cap),
            z3.Not(q.has4(boundary_source, "boundaryBlockerCenter")),
            _no_three_sources_in_row(q, Q_SOURCES, "boundaryBlocker"),
            z3.Or(*(q.same(role, boundary_source) for role in BOUNDARY_ROW_SOURCES)),
        )
    )
    for i, source in enumerate(Q_SOURCES):
        if i != boundary_index:
            carrier.append(z3.Not(q.has4(source, "freshCenter")))
    for i in range(4):
        center = f"boundaryFanBlockerCenter{i}"
        source = f"boundaryRowSource{i}"
        row = f"boundaryFanBlocker{i}"
        carrier.extend(
            (
                q.interior(center, b.v.boundary_fan_cap[i]),
                z3.Not(q.has4(source, center)),
                z3.Or(
                    z3.And(
                        q.same(center, "boundaryBlockerCenter"),
                        q.is_nonrobust("boundaryBlockerCenter"),
                        z3.And(
                            *(q.incident(role, row) == q.incident(role, "boundaryBlocker") for role in ROLES)
                        ),
                    ),
                    z3.And(
                        z3.Not(q.same(center, "boundaryBlockerCenter")),
                        _no_three_sources_in_row(q, BOUNDARY_ROW_SOURCES, row),
                    ),
                ),
            )
        )

    boundary_center_outcomes = []
    for i in range(4):
        center = f"boundaryFanBlockerCenter{i}"
        source = f"boundaryRowSource{i}"
        row = f"boundaryFanBlocker{i}"
        for cap in range(3):
            boundary_center_outcomes.append(
                z3.And(
                    q.same("boundaryBlockerCenter", center),
                    q.interior(center, cap),
                    z3.Not(q.has4(source, center)),
                    _row_support_eq(q, "boundaryBlocker", row),
                    q.is_nonrobust("boundaryBlockerCenter"),
                )
            )

    boundary_repeated_cap = []
    boundary_mutual_cross = []
    for i in range(4):
        for j in range(4):
            if i == j:
                continue
            ci = f"boundaryFanBlockerCenter{i}"
            cj = f"boundaryFanBlockerCenter{j}"
            si = f"boundaryRowSource{i}"
            sj = f"boundaryRowSource{j}"
            for cap in range(3):
                boundary_repeated_cap.append(
                    z3.And(
                        q.interior(ci, cap),
                        q.interior(cj, cap),
                        z3.Or(q.same(ci, cj), q.has4(sj, ci), q.has4(si, cj)),
                    )
                )
            boundary_mutual_cross.append(
                z3.And(
                    q.has4(sj, ci),
                    q.has4(si, cj),
                    z3.Not(q.same(ci, cj)),
                )
            )
    carrier.append(
        z3.Or(
            z3.Or(*boundary_center_outcomes),
            z3.And(
                *(
                    z3.Not(
                        q.same(
                            "boundaryBlockerCenter",
                            f"boundaryFanBlockerCenter{i}",
                        )
                    )
                    for i in range(4)
                ),
                z3.Or(*boundary_repeated_cap),
                z3.Or(*boundary_mutual_cross),
            ),
        )
    )
    b.add_group("carrier_source_theory", carrier)

    # Keep this explicit: it is a schema sanity check, not a source clause.
    assert role_index[ROLES[-1]] == 66
    return b.q()


def _bool(model: z3.ModelRef, expression: z3.ExprRef) -> bool:
    value = model.eval(expression, model_completion=True)
    return z3.is_true(value)


def _int(model: z3.ModelRef, expression: z3.ExprRef) -> int:
    value = model.eval(expression, model_completion=True)
    if not z3.is_int_value(value):
        raise ValueError(f"non-integer model value for {expression}: {value}")
    return value.as_long()


def _normalize_classes(values: Sequence[int]) -> list[int]:
    labels: dict[int, int] = {}
    answer: list[int] = []
    for value in values:
        if value not in labels:
            labels[value] = len(labels)
        answer.append(labels[value])
    return answer


def model_signature(query: CarrierQuery, model: z3.ModelRef) -> dict[str, object]:
    """Canonical finite readback for theorem mining and exact replay."""

    v = query.variables
    point_classes = {role: _int(model, query.point(role)) for role in ROLES}
    caps = {
        role: [_bool(model, query.cap(role, cap)) for cap in range(3)]
        for role in ROLES
    }
    interiors = {
        role: [_bool(model, query.interior(role, cap)) for cap in range(3)]
        for role in ROLES
    }
    order = {role: _int(model, v.order(query.point(role))) for role in ROLES}
    radius: dict[str, list[int]] = {}
    has_four: dict[str, list[bool]] = {}
    for center in RADIUS_CENTERS:
        raw = [_int(model, v.radius_class(query.point(center), query.point(role))) for role in ROLES]
        radius[center] = _normalize_classes(raw)
    for center in DELETION_CENTERS:
        has_four[center] = [_bool(model, query.has4(role, center)) for role in ROLES]
    return {
        "point_classes": point_classes,
        "cap_witnesses": {
            "first": _int(model, v.first_cap),
            "fresh": _int(model, v.fresh_cap),
            "row": _int(model, v.row_cap),
            "blocker": [_int(model, item) for item in v.blocker_cap],
            "boundary": _int(model, v.boundary_cap),
            "boundary_fan": [_int(model, item) for item in v.boundary_fan_cap],
        },
        "in_cap": caps,
        "in_cap_interior": interiors,
        "order": order,
        "radius_classes": radius,
        "has_four_after_deleting": has_four,
        "nonrobust": {role: _bool(model, query.is_nonrobust(role)) for role in ROLES},
    }


def replay_sat_result(result: dict[str, object], *, timeout_ms: int = 60_000) -> None:
    """Fail-closed fresh-session replay of one complete SAT readback.

    This authenticates and rechecks the finite relational packet only.  It is
    not an independent Euclidean verifier and intentionally does not promote
    ``SAT_ABSTRACTION`` to a theorem-bearing status.
    """

    if result.get("schema") != RESULT_SCHEMA:
        raise ValueError("result schema mismatch")
    if result.get("query_schema") != SCHEMA:
        raise ValueError("query schema mismatch")
    if result.get("status") != "SAT_ABSTRACTION":
        raise ValueError("only SAT_ABSTRACTION results have model replay")
    if result.get("claims") != FALSE_CLAIMS:
        raise ValueError("claims mismatch")
    boundary_index = result.get("boundary_index")
    if type(boundary_index) is not int or boundary_index not in range(4):
        raise ValueError("invalid boundary index")
    expected_manifest = hashlib.sha256(_canonical_json(source_manifest())).hexdigest()
    if result.get("source_manifest_sha256") != expected_manifest:
        raise ValueError("source manifest hash mismatch")
    signature = result.get("model_signature")
    if type(signature) is not dict:
        raise ValueError("missing model signature")
    expected_signature = hashlib.sha256(_canonical_json(signature)).hexdigest()
    if result.get("model_signature_sha256") != expected_signature:
        raise ValueError("model signature hash mismatch")
    if set(signature) != MODEL_SIGNATURE_KEYS:
        raise ValueError("model signature key mismatch")

    query = build_query(boundary_index, timeout_ms=timeout_ms)
    if result.get("constraint_groups") != list(query.groups):
        raise ValueError("constraint groups mismatch")
    v = query.variables
    point_classes = signature.get("point_classes")
    cap_witnesses = signature.get("cap_witnesses")
    in_cap = signature.get("in_cap")
    interiors = signature.get("in_cap_interior")
    order = signature.get("order")
    radius = signature.get("radius_classes")
    has_four = signature.get("has_four_after_deleting")
    nonrobust = signature.get("nonrobust")
    mappings = (point_classes, cap_witnesses, in_cap, interiors, order, radius, has_four, nonrobust)
    if any(type(item) is not dict for item in mappings):
        raise ValueError("malformed model signature")
    expected_roles = set(ROLES)
    for name, mapping in (
        ("point classes", point_classes),
        ("cap membership", in_cap),
        ("cap interior", interiors),
        ("order", order),
        ("nonrobust", nonrobust),
    ):
        if set(mapping) != expected_roles:
            raise ValueError(f"{name} key mismatch")
    if set(cap_witnesses) != CAP_WITNESS_KEYS:
        raise ValueError("cap witness key mismatch")
    if set(radius) != set(RADIUS_CENTERS):
        raise ValueError("radius center key mismatch")
    if set(has_four) != set(DELETION_CENTERS):
        raise ValueError("deletion center key mismatch")

    for role in ROLES:
        value = point_classes.get(role)
        if type(value) is not int:
            raise ValueError(f"missing point class: {role}")
        query.solver.add(query.point(role) == value)
        order_value = order.get(role)
        if type(order_value) is not int:
            raise ValueError(f"missing order value: {role}")
        query.solver.add(v.order(query.point(role)) == order_value)
        cap_values = in_cap.get(role)
        interior_values = interiors.get(role)
        if not (
            type(cap_values) is list
            and type(interior_values) is list
            and len(cap_values) == 3
            and len(interior_values) == 3
            and all(type(item) is bool for item in (*cap_values, *interior_values))
        ):
            raise ValueError(f"malformed cap readback: {role}")
        for cap in range(3):
            query.solver.add(query.cap(role, cap) == cap_values[cap])
            query.solver.add(query.interior(role, cap) == interior_values[cap])
        robust_value = nonrobust.get(role)
        if type(robust_value) is not bool:
            raise ValueError(f"missing nonrobust readback: {role}")
        query.solver.add(query.is_nonrobust(role) == robust_value)

    scalar_caps = ("first", "fresh", "row", "boundary")
    cap_variables = (v.first_cap, v.fresh_cap, v.row_cap, v.boundary_cap)
    for name, variable in zip(scalar_caps, cap_variables, strict=True):
        value = cap_witnesses.get(name)
        if type(value) is not int:
            raise ValueError(f"missing cap witness: {name}")
        query.solver.add(variable == value)
    for name, variables in (
        ("blocker", v.blocker_cap),
        ("boundary_fan", v.boundary_fan_cap),
    ):
        values = cap_witnesses.get(name)
        if not (type(values) is list and len(values) == 4 and all(type(item) is int for item in values)):
            raise ValueError(f"malformed cap witness vector: {name}")
        for variable, value in zip(variables, values, strict=True):
            query.solver.add(variable == value)

    for center in RADIUS_CENTERS:
        values = radius[center]
        if not (
            type(values) is list
            and len(values) == len(ROLES)
            and all(type(item) is int for item in values)
        ):
            raise ValueError(f"malformed radius readback: {center}")
        for role, value in zip(ROLES, values, strict=True):
            query.solver.add(v.radius_class(query.point(center), query.point(role)) == value)
    for center in DELETION_CENTERS:
        values = has_four[center]
        if not (
            type(values) is list
            and len(values) == len(ROLES)
            and all(type(item) is bool for item in values)
        ):
            raise ValueError(f"malformed deletion readback: {center}")
        for role, value in zip(ROLES, values, strict=True):
            query.solver.add(query.has4(role, center) == value)

    checked = query.solver.check()
    if checked != z3.sat:
        raise ValueError(f"model signature replay failed: {checked}")


def source_manifest() -> dict[str, object]:
    sources = (QUERY_LEAN, SOURCE_THEORY_LEAN, PINNED_THEORY_LEAN, Path(__file__))
    return {
        "schema": SCHEMA,
        "role_count": len(ROLES),
        "row_count": len(ROWS),
        "boundary_cells": list(range(4)),
        "ambient_carrier_enumerated": False,
        "distance_projection": "finite equality classes; no Euclidean realizability claim",
        "deletion_projection": "opaque ambient predicate constrained by source laws",
        "row_deletion_semantics": (
            "complete robust-or-outside-row equivalence at every named row center"
        ),
        "row_intersection_semantics": (
            "distinct-center named selected rows share at most two points"
        ),
        "cap_order_semantics": (
            "each indexed cap restricts to one cyclic interval on named roles"
        ),
        "order_encoding": (
            "dense canonical rank permutation of represented Same classes"
        ),
        "row_origins": {
            row: {"origin": origin, "slots": list(slots), "center": center}
            for row, (origin, slots, center) in sorted(ROWS.items())
        },
        "source_files": {
            str(path.relative_to(REPO_ROOT)): _sha256_file(path) for path in sources
        },
        "claims": FALSE_CLAIMS,
    }


def solve_cell(boundary_index: int, *, timeout_ms: int) -> dict[str, object]:
    query = build_query(boundary_index, timeout_ms=timeout_ms)
    checked = query.solver.check()
    manifest = source_manifest()
    common: dict[str, Any] = {
        "schema": RESULT_SCHEMA,
        "query_schema": SCHEMA,
        "boundary_index": boundary_index,
        "source_manifest_sha256": hashlib.sha256(_canonical_json(manifest)).hexdigest(),
        "constraint_groups": list(query.groups),
        "claims": FALSE_CLAIMS,
    }
    if checked == z3.sat:
        signature = model_signature(query, query.solver.model())
        common.update(
            {
                "status": "SAT_ABSTRACTION",
                "model_signature": signature,
                "model_signature_sha256": hashlib.sha256(
                    _canonical_json(signature)
                ).hexdigest(),
            }
        )
    elif checked == z3.unsat:
        common.update(
            {
                "status": "UNSAT_RELAXATION",
                "unsat_core": sorted(str(atom) for atom in query.solver.unsat_core()),
                "promotion_ready": False,
            }
        )
    else:
        common.update(
            {
                "status": "UNKNOWN",
                "reason_unknown": query.solver.reason_unknown(),
            }
        )
    return common


def _solve_boundary(arguments: tuple[int, int]) -> dict[str, object]:
    boundary_index, timeout_ms = arguments
    return solve_cell(boundary_index, timeout_ms=timeout_ms)


def run_wave(
    out_dir: Path, *, timeout_ms: int, workers: int = 1
) -> dict[str, object]:
    if workers not in range(1, 5):
        raise ValueError("workers must be in range(1, 5)")
    manifest = source_manifest()
    _atomic_json(out_dir / "manifest.json", manifest)
    arguments = tuple((boundary_index, timeout_ms) for boundary_index in range(4))
    if workers == 1:
        results = [_solve_boundary(argument) for argument in arguments]
    else:
        with concurrent.futures.ProcessPoolExecutor(max_workers=workers) as pool:
            results = list(pool.map(_solve_boundary, arguments))
    results.sort(key=lambda item: item["boundary_index"])
    for result in results:
        boundary_index = result["boundary_index"]
        _atomic_json(out_dir / f"cell-{boundary_index}.json", result)
    summary = {
        "schema": "p97-freshthird-qfiber-three-carrier-wave/v1",
        "query_schema": SCHEMA,
        "statuses": {str(item["boundary_index"]): item["status"] for item in results},
        "terminal_unsat_claim": False,
        "claims": FALSE_CLAIMS,
    }
    _atomic_json(out_dir / "summary.json", summary)
    return summary


def main(argv: Sequence[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--out-dir", type=Path, required=True)
    parser.add_argument("--timeout-ms", type=int, default=60_000)
    parser.add_argument("--workers", type=int, choices=range(1, 5), default=1)
    args = parser.parse_args(argv)
    if args.timeout_ms <= 0:
        parser.error("--timeout-ms must be positive")
    summary = run_wave(args.out_dir, timeout_ms=args.timeout_ms, workers=args.workers)
    print(json.dumps(summary, sort_keys=True))
    return 0 if all(status != "UNKNOWN" for status in summary["statuses"].values()) else 2


if __name__ == "__main__":
    raise SystemExit(main())
