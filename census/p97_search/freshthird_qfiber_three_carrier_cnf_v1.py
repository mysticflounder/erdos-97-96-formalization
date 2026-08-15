"""Deterministic structural-CNF shadow adapter for the FreshThird carrier query.

This is the first migration seam away from the monolithic SMT query.  It
encodes the finite Boolean vocabulary directly, decodes CaDiCaL assignments to
the existing model-signature schema, and delegates semantic acceptance to the
existing fresh-session replay.  The initial hard clause set is intentionally a
relaxation: source-valid refinements (beginning with cyclic-cap alternation)
are added through authenticated CEGAR, not silently assumed here.
"""

from __future__ import annotations

import hashlib
import itertools
from collections.abc import Iterable, Mapping, Sequence
from dataclasses import dataclass
from pathlib import Path
from typing import Any

from census.p97_search.freshthird_qfiber_three_carrier_query_v1 import (
    BLOCKER_CENTERS,
    BOUNDARY_FAN_BLOCKER_CENTERS,
    FALSE_CLAIMS,
    REPO_ROOT,
    RESULT_SCHEMA,
    ROLES,
    ROWS,
    SCHEMA,
    SEED,
    _canonical_json,
    replay_sat_result,
    source_manifest,
)
from census.p97_search.freshthird_qfiber_three_carrier_query_v1 import (
    CONSTRAINT_GROUPS as SOURCE_CONSTRAINT_GROUPS,
)

CNF_SCHEMA = "p97-freshthird-qfiber-three-carrier-cnf/v1"
CNF_CONSTRAINT_GROUPS = ("freshthird_structural_cnf_relaxation",)
CAP_ALTERNATION_REFINEMENT_SCHEMA = (
    "p97-freshthird-qfiber-three-carrier-cap-alternation-refinement/v1"
)
CAP_ALTERNATION_SOURCE_THEOREM = (
    "FreshThirdQFiberThreeCarrierFiniteAssignment.noAlternatingCap_ofView"
)
CLAUSE_TAGS = (
    "SAME-EQUIV",
    "ROW-EXACT",
    "REL-CONGRUENCE",
    "ORDER-TOTAL",
    "ORDER-TRANS",
    "CAP-BASIC",
    "CAP-WITNESS",
    "RADIUS-EQUIV",
    "PINNED-BASIC",
    "Q-CARRIER-BASIC",
    "DELETION-LAW",
)


class FreshThirdCarrierCnfError(RuntimeError):
    """Malformed encoding, assignment, or semantic readback."""


@dataclass(frozen=True)
class SemanticReplay:
    accepted: bool
    detail: str


@dataclass(frozen=True)
class CapAlternationRefinement:
    """One source-proved CEGAR cut against an alternating cap pattern."""

    boundary_index: int
    cap: int
    roles: tuple[str, str, str, str]
    membership: tuple[bool, bool, bool, bool]
    clause: tuple[int, ...]
    model_signature_sha256: str

    def record(self) -> dict[str, object]:
        return {
            "schema": CAP_ALTERNATION_REFINEMENT_SCHEMA,
            "boundary_index": self.boundary_index,
            "cap": self.cap,
            "roles": list(self.roles),
            "membership": list(self.membership),
            "clause": list(self.clause),
            "source_theorem": CAP_ALTERNATION_SOURCE_THEOREM,
            "model_signature_sha256": self.model_signature_sha256,
        }


class FreshThirdCarrierCnfEncoding:
    """Deterministic direct CNF for one intrinsic boundary-index cell.

    Semantic variables are exactly the atoms needed to reconstruct the old
    model signature.  Incidence variables are definitional auxiliaries.  The
    source manifest remains owned by the existing query module.
    """

    def __init__(self, boundary_index: int) -> None:
        if boundary_index not in range(4):
            raise FreshThirdCarrierCnfError("boundary_index must be in range(4)")
        self.boundary_index = boundary_index
        self.role_index = {role: i for i, role in enumerate(ROLES)}
        self.row_names = tuple(ROWS)
        self.row_centers = tuple(dict.fromkeys(ROWS[row][2] for row in ROWS))
        self.radius_centers = self.row_centers
        self.deletion_centers = (
            "pinnedCenter",
            *BLOCKER_CENTERS,
            "freshCenter",
            "boundaryBlockerCenter",
            *BOUNDARY_FAN_BLOCKER_CENTERS,
        )
        self.var_for: dict[tuple[Any, ...], int] = {}
        self.key_for: dict[int, tuple[Any, ...]] = {}
        self.semantic_vars: list[int] = []
        self.clauses: list[tuple[int, ...]] = []
        self.clause_counts = {tag: 0 for tag in CLAUSE_TAGS}
        self._allocate_variables()
        self._emit_hard_clauses()

    @property
    def num_vars(self) -> int:
        return len(self.key_for)

    def _new_var(self, key: tuple[Any, ...], *, semantic: bool) -> int:
        if key in self.var_for:
            raise FreshThirdCarrierCnfError(f"duplicate variable key: {key!r}")
        var = len(self.key_for) + 1
        self.var_for[key] = var
        self.key_for[var] = key
        if semantic:
            self.semantic_vars.append(var)
        return var

    def var(self, *key: Any) -> int:
        try:
            return self.var_for[tuple(key)]
        except KeyError as exc:
            raise FreshThirdCarrierCnfError(
                f"SAT variable does not exist: {tuple(key)!r}"
            ) from exc

    def _same_key(self, left: str, right: str) -> tuple[Any, ...]:
        i, j = self.role_index[left], self.role_index[right]
        return ("same", min(i, j), max(i, j))

    def same(self, left: str, right: str) -> int:
        return self.var(*self._same_key(left, right))

    def before(self, left: str, right: str) -> int:
        return self.var("before", self.role_index[left], self.role_index[right])

    def in_cap(self, role: str, cap: int) -> int:
        return self.var("in-cap", self.role_index[role], cap)

    def interior(self, role: str, cap: int) -> int:
        return self.var("interior", self.role_index[role], cap)

    def incident(self, role: str, row: str) -> int:
        return self.var("incident", self.role_index[role], self.row_names.index(row))

    def has_four(self, deleted: str, center: str) -> int:
        return self.var(
            "has-four", self.role_index[deleted], self.row_centers.index(center)
        )

    def nonrobust(self, role: str) -> int:
        return self.var("nonrobust", self.role_index[role])

    def radius_equal(self, left: str, right: str) -> int:
        i, j = self.role_index[left], self.role_index[right]
        return self.var("pinned-radius-eq", min(i, j), max(i, j))

    def cap_choice(self, name: str, cap: int) -> int:
        return self.var("cap-choice", name, cap)

    def _allocate_variables(self) -> None:
        count = len(ROLES)
        for i in range(count):
            for j in range(i, count):
                self._new_var(("same", i, j), semantic=True)
        for i in range(count):
            for j in range(count):
                self._new_var(("before", i, j), semantic=True)
        for family in ("in-cap", "interior"):
            for i in range(count):
                for cap in range(3):
                    self._new_var((family, i, cap), semantic=True)
        for i in range(count):
            self._new_var(("nonrobust", i), semantic=True)
        for deleted in range(count):
            for center in range(len(self.row_centers)):
                self._new_var(("has-four", deleted, center), semantic=True)
        for i in range(count):
            for j in range(i, count):
                self._new_var(("pinned-radius-eq", i, j), semantic=True)
        cap_names = (
            "first",
            "fresh",
            "row",
            "boundary",
            *(f"blocker-{i}" for i in range(4)),
            *(f"boundary-fan-{i}" for i in range(4)),
        )
        for name in cap_names:
            for cap in range(3):
                self._new_var(("cap-choice", name, cap), semantic=True)
        for role in range(count):
            for row in range(len(self.row_names)):
                self._new_var(("incident", role, row), semantic=False)

    def _add(self, tag: str, clause: Iterable[int]) -> None:
        normalized = tuple(clause)
        if any(lit == 0 or abs(lit) > self.num_vars for lit in normalized):
            raise FreshThirdCarrierCnfError(f"bad literal: {normalized!r}")
        self.clauses.append(normalized)
        self.clause_counts[tag] += 1

    def _exactly(self, variables: Sequence[int], target: int, tag: str) -> None:
        size = len(variables)
        if target < 0 or target > size:
            self._add(tag, ())
            return
        if target > 0:
            for subset in itertools.combinations(variables, size - target + 1):
                self._add(tag, subset)
        if target < size:
            for subset in itertools.combinations(variables, target + 1):
                self._add(tag, (-var for var in subset))

    def _equate_under(self, guard: int, left: int, right: int, tag: str) -> None:
        self._add(tag, (-guard, -left, right))
        self._add(tag, (-guard, left, -right))

    def _emit_same_equivalence(self) -> None:
        for role in ROLES:
            self._add("SAME-EQUIV", (self.same(role, role),))
        for a, b, c in itertools.combinations(ROLES, 3):
            ab, ac, bc = self.same(a, b), self.same(a, c), self.same(b, c)
            self._add("SAME-EQUIV", (-ab, -bc, ac))
            self._add("SAME-EQUIV", (-ab, -ac, bc))
            self._add("SAME-EQUIV", (-ac, -bc, ab))

    def _emit_incidence_and_rows(self) -> None:
        for row, (_origin, slots, center) in ROWS.items():
            for left, right in itertools.combinations(slots, 2):
                self._add("ROW-EXACT", (-self.same(left, right),))
            for slot in slots:
                self._add("ROW-EXACT", (-self.same(center, slot),))
            for role in ROLES:
                incident = self.incident(role, row)
                same_slots = tuple(self.same(role, slot) for slot in slots)
                self._add("ROW-EXACT", (-incident, *same_slots))
                for same_slot in same_slots:
                    self._add("ROW-EXACT", (-same_slot, incident))

    def _emit_relational_congruence(self) -> None:
        for left, right in itertools.combinations(ROLES, 2):
            guard = self.same(left, right)
            for cap in range(3):
                self._equate_under(
                    guard,
                    self.in_cap(left, cap),
                    self.in_cap(right, cap),
                    "REL-CONGRUENCE",
                )
                self._equate_under(
                    guard,
                    self.interior(left, cap),
                    self.interior(right, cap),
                    "REL-CONGRUENCE",
                )
            self._equate_under(
                guard,
                self.nonrobust(left),
                self.nonrobust(right),
                "REL-CONGRUENCE",
            )

    def _emit_order(self) -> None:
        for role in ROLES:
            self._add("ORDER-TOTAL", (-self.before(role, role),))
        for left, right in itertools.combinations(ROLES, 2):
            same = self.same(left, right)
            lr, rl = self.before(left, right), self.before(right, left)
            self._add("ORDER-TOTAL", (same, lr, rl))
            self._add("ORDER-TOTAL", (-lr, -rl))
            self._add("ORDER-TOTAL", (-same, -lr))
            self._add("ORDER-TOTAL", (-same, -rl))
        for a, b, c in itertools.permutations(ROLES, 3):
            self._add(
                "ORDER-TRANS",
                (-self.before(a, b), -self.before(b, c), self.before(a, c)),
            )

    def _emit_cap_basics(self) -> None:
        for role in ROLES:
            self._add("CAP-BASIC", (self.in_cap(role, cap) for cap in range(3)))
            for cap in range(3):
                self._add(
                    "CAP-BASIC", (-self.interior(role, cap), self.in_cap(role, cap))
                )
                for other in range(3):
                    if other != cap:
                        self._add(
                            "CAP-BASIC",
                            (-self.interior(role, cap), -self.in_cap(role, other)),
                        )
        cap_names = tuple(
            key[1]
            for key in self.var_for
            if key[0] == "cap-choice" and key[2] == 0
        )
        for name in cap_names:
            self._exactly(
                tuple(self.cap_choice(name, cap) for cap in range(3)),
                1,
                "CAP-WITNESS",
            )
        for cap in range(3):
            self._add(
                "CAP-WITNESS",
                (-self.cap_choice("first", cap), -self.cap_choice("fresh", cap)),
            )

    def _emit_radius(self) -> None:
        for role in ROLES:
            self._add("RADIUS-EQUIV", (self.radius_equal(role, role),))
        for a, b, c in itertools.combinations(ROLES, 3):
            ab = self.radius_equal(a, b)
            ac = self.radius_equal(a, c)
            bc = self.radius_equal(b, c)
            self._add("RADIUS-EQUIV", (-ab, -bc, ac))
            self._add("RADIUS-EQUIV", (-ab, -ac, bc))
            self._add("RADIUS-EQUIV", (-ac, -bc, ab))
        for left, right in itertools.combinations(ROLES, 2):
            self._add(
                "RADIUS-EQUIV",
                (-self.same(left, right), self.radius_equal(left, right)),
            )
        for _origin, slots, center in ROWS.values():
            center_same = self.same(center, "pinnedCenter")
            for slot in slots[1:]:
                self._add(
                    "RADIUS-EQUIV",
                    (-center_same, self.radius_equal(slots[0], slot)),
                )

    def _emit_deletion_law(self) -> None:
        for row, (_origin, _slots, center) in ROWS.items():
            nonrobust = self.nonrobust(center)
            for deleted in ROLES:
                survives = self.has_four(deleted, center)
                incident = self.incident(deleted, row)
                self._add("DELETION-LAW", (nonrobust, survives))
                self._add("DELETION-LAW", (incident, survives))
                self._add(
                    "DELETION-LAW", (-survives, -nonrobust, -incident)
                )

    def _emit_pinned_basic(self) -> None:
        for left, right in itertools.combinations(SEED, 2):
            self._add("PINNED-BASIC", (-self.same(left, right),))
        self._add(
            "PINNED-BASIC", (self.same("pinnedCenter", seed) for seed in SEED)
        )
        self._add("PINNED-BASIC", (-self.same("pinnedCenter", "sourceCenter"),))
        self._add("PINNED-BASIC", (-self.same("pinnedCenter", "freshCenter"),))
        for selected in itertools.combinations(SEED, 4):
            self._add(
                "PINNED-BASIC",
                (
                    *(self.same("pinnedCenter", role) for role in selected),
                    *(-self.radius_equal(selected[0], role) for role in selected[1:]),
                ),
            )
        for cap in range(3):
            first = self.cap_choice("first", cap)
            for role in ("sourceCenter", "canonicalSource", "canonicalSecondSource"):
                self._add("PINNED-BASIC", (-first, self.interior(role, cap)))
            fresh = self.cap_choice("fresh", cap)
            self._add("PINNED-BASIC", (-fresh, self.interior("freshCenter", cap)))
            for role in ("freshSourceOne", "freshSourceTwo"):
                self._add("PINNED-BASIC", (-first, -self.in_cap(role, cap)))

    def _emit_q_carrier_basic(self) -> None:
        q_sources = tuple(f"qSource{i}" for i in range(4))
        for left, right in itertools.combinations(q_sources, 2):
            self._add("Q-CARRIER-BASIC", (-self.same(left, right),))
        for role in ROLES:
            self._equate_under(
                self.same(role, role),
                self.incident(role, "q"),
                self.incident(role, "fresh"),
                "Q-CARRIER-BASIC",
            )
        self._add(
            "Q-CARRIER-BASIC",
            (
                self.same(f"qSource{self.boundary_index}", "freshRemainder0"),
                self.same(f"qSource{self.boundary_index}", "freshRemainder1"),
            ),
        )
        for role in ("freshSourceOne", "freshSourceTwo"):
            self._add(
                "Q-CARRIER-BASIC", (self.same(role, source) for source in q_sources)
            )
        self._add(
            "Q-CARRIER-BASIC",
            (-self.same("boundaryBlockerCenter", "freshCenter"),),
        )
        for i, source in enumerate(q_sources):
            if i != self.boundary_index:
                self._add(
                    "Q-CARRIER-BASIC", (-self.has_four(source, "freshCenter"),)
                )
        boundary_source = f"qSource{self.boundary_index}"
        self._add(
            "Q-CARRIER-BASIC",
            (-self.has_four(boundary_source, "boundaryBlockerCenter"),),
        )
        self._add(
            "Q-CARRIER-BASIC",
            (
                self.same(boundary_source, f"boundaryRowSource{i}")
                for i in range(4)
            ),
        )
        for cap in range(3):
            self._add(
                "Q-CARRIER-BASIC",
                (
                    -self.cap_choice("boundary", cap),
                    self.interior("boundaryBlockerCenter", cap),
                ),
            )
            for i in range(4):
                self._add(
                    "Q-CARRIER-BASIC",
                    (
                        -self.cap_choice(f"boundary-fan-{i}", cap),
                        self.interior(f"boundaryFanBlockerCenter{i}", cap),
                    ),
                )
        for i in range(4):
            self._add(
                "Q-CARRIER-BASIC",
                (
                    -self.has_four(
                        f"boundaryRowSource{i}", f"boundaryFanBlockerCenter{i}"
                    ),
                ),
            )

    def _emit_hard_clauses(self) -> None:
        self._emit_same_equivalence()
        self._emit_incidence_and_rows()
        self._emit_relational_congruence()
        self._emit_order()
        self._emit_cap_basics()
        self._emit_radius()
        self._emit_deletion_law()
        self._emit_pinned_basic()
        self._emit_q_carrier_basic()

    def cnf_header_bytes(self, clause_count: int) -> bytes:
        return (
            f"c {CNF_SCHEMA} boundary-index={self.boundary_index}\n"
            f"p cnf {self.num_vars} {clause_count}\n"
        ).encode("ascii")

    def cnf_clause_body_bytes(self, clauses: Sequence[Sequence[int]]) -> bytes:
        return b"".join(
            (" ".join(str(lit) for lit in clause) + " 0\n").encode("ascii")
            for clause in clauses
        )

    def cnf_bytes(self, extra_clauses: Sequence[Sequence[int]] = ()) -> bytes:
        normalized_extra = tuple(tuple(clause) for clause in extra_clauses)
        for clause in normalized_extra:
            if any(lit == 0 or abs(lit) > self.num_vars for lit in clause):
                raise FreshThirdCarrierCnfError(
                    f"bad external clause literal: {clause!r}"
                )
        clauses = (*self.clauses, *normalized_extra)
        return self.cnf_header_bytes(len(clauses)) + self.cnf_clause_body_bytes(
            clauses
        )

    def variable_map(self) -> dict[str, object]:
        return {
            "schema": CNF_SCHEMA,
            "boundary_index": self.boundary_index,
            "num_variables": self.num_vars,
            "semantic_variables": len(self.semantic_vars),
            "variables": {
                str(var): list(self.key_for[var]) for var in sorted(self.key_for)
            },
        }

    def encoding_manifest(self) -> dict[str, object]:
        """Bind the source contract, encoder bytes, DIMACS, and variable map."""

        encoder_path = Path(__file__).resolve()
        source_manifest_sha256 = hashlib.sha256(
            _canonical_json(source_manifest())
        ).hexdigest()
        return {
            "schema": CNF_SCHEMA,
            "boundary_index": self.boundary_index,
            "source_manifest_sha256": source_manifest_sha256,
            "encoder_source": str(encoder_path.relative_to(REPO_ROOT)),
            "encoder_source_sha256": hashlib.sha256(
                encoder_path.read_bytes()
            ).hexdigest(),
            "cnf_sha256": hashlib.sha256(self.cnf_bytes()).hexdigest(),
            "variable_map_sha256": hashlib.sha256(
                _canonical_json(self.variable_map())
            ).hexdigest(),
            "num_variables": self.num_vars,
            "semantic_variables": len(self.semantic_vars),
            "num_clauses": len(self.clauses),
            "clause_counts": dict(self.clause_counts),
        }

    def validate(self, assignment: Mapping[int, bool]) -> None:
        missing = [var for var in range(1, self.num_vars + 1) if var not in assignment]
        if missing:
            raise FreshThirdCarrierCnfError(
                f"model omits {len(missing)} variables; first={missing[:5]}"
            )
        malformed = [
            var
            for var in range(1, self.num_vars + 1)
            if type(assignment[var]) is not bool
        ]
        if malformed:
            raise FreshThirdCarrierCnfError(
                f"model contains non-Boolean values; first={malformed[:5]}"
            )
        for clause_index, clause in enumerate(self.clauses):
            if not any(assignment[abs(lit)] == (lit > 0) for lit in clause):
                raise FreshThirdCarrierCnfError(
                    f"model falsifies hard clause {clause_index}: {clause!r}"
                )

    def _canonical_classes(self, assignment: Mapping[int, bool]) -> dict[str, int]:
        classes: list[list[str]] = []
        for role in ROLES:
            for class_index, members in enumerate(classes):
                if assignment[self.same(role, members[0])]:
                    members.append(role)
                    break
            else:
                classes.append([role])
        return {
            role: class_index
            for class_index, members in enumerate(classes)
            for role in members
        }

    def _order_values(
        self, assignment: Mapping[int, bool], point_classes: Mapping[str, int]
    ) -> dict[str, int]:
        representatives: dict[int, str] = {}
        for role in ROLES:
            representatives.setdefault(point_classes[role], role)
        ordered = sorted(
            representatives,
            key=lambda class_index: sum(
                assignment[
                    self.before(representatives[other], representatives[class_index])
                ]
                for other in representatives
                if other != class_index
            ),
        )
        rank = {class_index: i for i, class_index in enumerate(ordered)}
        return {role: rank[point_classes[role]] for role in ROLES}

    def _cap_witnesses(self, assignment: Mapping[int, bool]) -> dict[str, object]:
        def selected(name: str) -> int:
            values = [cap for cap in range(3) if assignment[self.cap_choice(name, cap)]]
            if len(values) != 1:
                raise FreshThirdCarrierCnfError(
                    f"cap witness {name!r} has {len(values)} values"
                )
            return values[0]

        return {
            "first": selected("first"),
            "fresh": selected("fresh"),
            "row": selected("row"),
            "boundary": selected("boundary"),
            "blocker": [selected(f"blocker-{i}") for i in range(4)],
            "boundary_fan": [selected(f"boundary-fan-{i}") for i in range(4)],
        }

    def model_signature(self, assignment: Mapping[int, bool]) -> dict[str, object]:
        self.validate(assignment)
        point_classes = self._canonical_classes(assignment)
        order = self._order_values(assignment, point_classes)
        pinned_radius_classes = self._canonical_radius_classes(assignment)
        radius: dict[str, list[int]] = {}
        pinned_class = point_classes["pinnedCenter"]
        for center in self.radius_centers:
            if point_classes[center] == pinned_class:
                radius[center] = [pinned_radius_classes[role] for role in ROLES]
            else:
                radius[center] = [0 for _ in ROLES]
        has_four: dict[str, list[bool]] = {}
        for center in self.deletion_centers:
            has_four[center] = [
                assignment[self.has_four(role, center)] for role in ROLES
            ]
        return {
            "point_classes": point_classes,
            "cap_witnesses": self._cap_witnesses(assignment),
            "in_cap": {
                role: [assignment[self.in_cap(role, cap)] for cap in range(3)]
                for role in ROLES
            },
            "in_cap_interior": {
                role: [assignment[self.interior(role, cap)] for cap in range(3)]
                for role in ROLES
            },
            "order": order,
            "radius_classes": radius,
            "has_four_after_deleting": has_four,
            "nonrobust": {
                role: assignment[self.nonrobust(role)] for role in ROLES
            },
        }

    def _canonical_radius_classes(
        self, assignment: Mapping[int, bool]
    ) -> dict[str, int]:
        classes: list[list[str]] = []
        for role in ROLES:
            for class_index, members in enumerate(classes):
                if assignment[self.radius_equal(role, members[0])]:
                    members.append(role)
                    break
            else:
                classes.append([role])
        return {
            role: class_index
            for class_index, members in enumerate(classes)
            for role in members
        }

    def result_from_assignment(
        self, assignment: Mapping[int, bool]
    ) -> dict[str, object]:
        signature = self.model_signature(assignment)
        manifest = source_manifest()
        encoding_manifest = self.encoding_manifest()
        return {
            "schema": RESULT_SCHEMA,
            "query_schema": SCHEMA,
            "boundary_index": self.boundary_index,
            "source_manifest_sha256": hashlib.sha256(
                _canonical_json(manifest)
            ).hexdigest(),
            "constraint_groups": list(CNF_CONSTRAINT_GROUPS),
            "encoding_manifest": encoding_manifest,
            "encoding_manifest_sha256": hashlib.sha256(
                _canonical_json(encoding_manifest)
            ).hexdigest(),
            "status": "SAT_ABSTRACTION",
            "model_signature": signature,
            "model_signature_sha256": hashlib.sha256(
                _canonical_json(signature)
            ).hexdigest(),
            "claims": FALSE_CLAIMS,
        }

    def _validate_result_metadata(self, result: Mapping[str, object]) -> None:
        if result.get("schema") != RESULT_SCHEMA:
            raise FreshThirdCarrierCnfError("result schema mismatch")
        if result.get("query_schema") != SCHEMA:
            raise FreshThirdCarrierCnfError("query schema mismatch")
        if result.get("status") != "SAT_ABSTRACTION":
            raise FreshThirdCarrierCnfError("result status mismatch")
        if result.get("claims") != FALSE_CLAIMS:
            raise FreshThirdCarrierCnfError("result claims mismatch")
        if result.get("constraint_groups") != list(CNF_CONSTRAINT_GROUPS):
            raise FreshThirdCarrierCnfError("constraint groups mismatch")
        manifest = result.get("encoding_manifest")
        if type(manifest) is not dict:
            raise FreshThirdCarrierCnfError("missing encoding manifest")
        if result.get("encoding_manifest_sha256") != hashlib.sha256(
            _canonical_json(manifest)
        ).hexdigest():
            raise FreshThirdCarrierCnfError("encoding manifest hash mismatch")
        if manifest != self.encoding_manifest():
            raise FreshThirdCarrierCnfError("encoding manifest content mismatch")

    def replay_result(
        self, result: Mapping[str, object], *, timeout_ms: int = 60_000
    ) -> SemanticReplay:
        """Authenticate adapter metadata, then delegate independent replay."""

        try:
            self._validate_result_metadata(result)
            source_result = dict(result)
            source_result["constraint_groups"] = list(SOURCE_CONSTRAINT_GROUPS)
            replay_sat_result(source_result, timeout_ms=timeout_ms)
        except (FreshThirdCarrierCnfError, ValueError) as exc:
            return SemanticReplay(False, str(exc))
        return SemanticReplay(True, "fresh-session model signature replay accepted")

    def semantic_replay(
        self, assignment: Mapping[int, bool], *, timeout_ms: int = 60_000
    ) -> SemanticReplay:
        result = self.result_from_assignment(assignment)
        return self.replay_result(result, timeout_ms=timeout_ms)

    def cap_alternation_refinement_from_signature(
        self, signature: Mapping[str, object]
    ) -> CapAlternationRefinement | None:
        """Return the first deterministic four-role cap-alternation cut.

        The clause is the direct CNF projection of the source theorem
        ``noAlternatingCap_ofView``.  Its three order guards and four cap
        literals are semantic variables, so it remains independently
        replayable and never relies on an auxiliary encoding atom.
        """

        point_classes = signature.get("point_classes")
        order = signature.get("order")
        in_cap = signature.get("in_cap")
        if not all(type(item) is dict for item in (point_classes, order, in_cap)):
            raise FreshThirdCarrierCnfError(
                "cap-alternation readback requires point_classes, order, and in_cap"
            )

        representatives: dict[int, str] = {}
        for role in ROLES:
            point_class = point_classes.get(role)
            order_value = order.get(role)
            cap_values = in_cap.get(role)
            if type(point_class) is not int or type(order_value) is not int:
                raise FreshThirdCarrierCnfError(
                    f"malformed class/order readback for role {role!r}"
                )
            if not (
                type(cap_values) is list
                and len(cap_values) == 3
                and all(type(value) is bool for value in cap_values)
            ):
                raise FreshThirdCarrierCnfError(
                    f"malformed cap readback for role {role!r}"
                )
            representatives.setdefault(point_class, role)

        ordered = tuple(
            sorted(representatives.values(), key=lambda role: order[role])
        )
        signature_sha256 = hashlib.sha256(_canonical_json(signature)).hexdigest()
        alternating = ((True, False, True, False), (False, True, False, True))
        for cap in range(3):
            for roles in itertools.combinations(ordered, 4):
                membership = tuple(in_cap[role][cap] for role in roles)
                if membership not in alternating:
                    continue
                a, b, c, d = roles
                clause = (
                    -self.before(a, b),
                    -self.before(b, c),
                    -self.before(c, d),
                    *(
                        -self.in_cap(role, cap)
                        if member
                        else self.in_cap(role, cap)
                        for role, member in zip(roles, membership, strict=True)
                    ),
                )
                if any(abs(lit) not in self.semantic_vars for lit in clause):
                    raise FreshThirdCarrierCnfError(
                        "cap-alternation cut contains a non-semantic variable"
                    )
                return CapAlternationRefinement(
                    boundary_index=self.boundary_index,
                    cap=cap,
                    roles=roles,
                    membership=membership,
                    clause=clause,
                    model_signature_sha256=signature_sha256,
                )
        return None

    def cap_alternation_refinement(
        self, assignment: Mapping[int, bool]
    ) -> CapAlternationRefinement | None:
        """Decode and certify the first cap-alternation defect in a SAT model."""

        signature = self.model_signature(assignment)
        refinement = self.cap_alternation_refinement_from_signature(signature)
        if refinement is None:
            return None
        if any(
            assignment[abs(lit)] == (lit > 0) for lit in refinement.clause
        ):
            raise FreshThirdCarrierCnfError(
                "cap-alternation refinement does not block the current model"
            )
        return refinement

    def blocking_clause(self, assignment: Mapping[int, bool]) -> tuple[int, ...]:
        missing = [var for var in self.semantic_vars if var not in assignment]
        if missing:
            raise FreshThirdCarrierCnfError(
                f"model omits semantic variables; first={missing[:5]}"
            )
        clause = tuple(
            -var if assignment[var] else var for var in self.semantic_vars
        )
        if any(assignment[abs(lit)] == (lit > 0) for lit in clause):
            raise FreshThirdCarrierCnfError(
                "blocking clause does not negate the current semantic assignment"
            )
        return clause
