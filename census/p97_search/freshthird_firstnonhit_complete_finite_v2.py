"""Source-backed CNF for the finite FreshThird FirstNonHit projection.

This is an emitter and NONLAUNCH dry-run runner.  It encodes the arbitrary
``Fin n`` relaxation projected by the kernel-clean aggregate at commit
``1dfff1f9``.  It never invokes a solver, never treats exact ``n`` as a
universal reduction, and keeps the negated closure target in a separate query
family.
"""

from __future__ import annotations

import argparse
import hashlib
import itertools
import json
import os
import stat
from collections import Counter
from collections.abc import Iterable, Mapping, Sequence
from dataclasses import dataclass
from pathlib import Path, PurePosixPath

SCHEMA = "p97-freshthird-firstnonhit-complete-finite-v2/cnf/v1"
MAP_SCHEMA = f"{SCHEMA}/map/v1"
SOURCE_SCHEMA = f"{SCHEMA}/sources/v1"
MANIFEST_SCHEMA = f"{SCHEMA}/manifest/v1"
MIN_CARRIER_CARD = 17
LEAN_COMMIT = "1dfff1f973d46b67aaf19397ccf871bd33ddcc6e"
SOURCE_TOTAL_CLAIM = False
PRODUCTION_LAUNCH_ENABLED = False

BASE = "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
SOURCE_HASHES = {
    f"{BASE}FirstNonHitSourceTotalFiniteAssignment.lean": (
        "676fae430d4f9b53246be42ccee71fe15b8fbefc3450e56737f984d74333707f"
    ),
    f"{BASE}FirstNonHitCompleteFiniteSourceTheoryCore.lean": (
        "77924db2fc8929242e3bc36b35459217e96bdfb2025ab8f41c0c313cd3892369"
    ),
    f"{BASE}FirstNonHitCompleteFiniteSourceTheoryBranches.lean": (
        "74fea302657d8ccbf71405cd4b7f90b3d0b16d2ad31efe0d5ced16e91244de2d"
    ),
    f"{BASE}FirstNonHitCompleteFiniteSourceTheoryContext.lean": (
        "f08095959f9857054b3913f073e946eb7085cdf3f8a928d1fb5267fb3cc277f2"
    ),
    f"{BASE}FirstNonHitCompleteFiniteSourceTheory.lean": (
        "bf6fc82a92f53a4efaf4fba9d10d600bc65a92dd0498e3bc9963b656a412a4dd"
    ),
}

ROLES = (
    "first_apex",
    "second_apex",
    "surplus_apex",
    "first_retained_one",
    "first_retained_two",
    "second_retained_one",
    "second_retained_two",
    "canonical_one",
    "canonical_two",
    "fresh_one",
    "fresh_two",
)

P1 = "first_retained_one"
P2 = "first_retained_two"
R1 = "second_retained_one"
R2 = "second_retained_two"
C1 = "canonical_one"
C2 = "canonical_two"
Q1 = "fresh_one"
Q2 = "fresh_two"
APEX = "first_apex"

FAMILY_SOURCES = {
    "encoding_logic": "definitional Tseitin and cardinality translation",
    "blocker_function": (
        "FirstNonHitSourceTotalFiniteAssignment.blockerMap/blockerMap_ne"
    ),
    "named_role_selectors": (
        "FirstNonHitCompleteFiniteSourceTheory.roleIndex_exact"
    ),
    "radius_equivalence": (
        "FirstNonHitSourceTotalFiniteAssignment.radiusEq_refl/symm/trans"
    ),
    "radius_zero_class": (
        "FirstNonHitSourceTotalFiniteAssignment.radiusEq_center_center_iff"
    ),
    "selected_row": (
        "FirstNonHitSourceTotalFiniteAssignment.row_card/row_source_mem/"
        "row_mem_iff_radiusEq"
    ),
    "has_four_after_delete": (
        "FirstNonHitSourceTotalFiniteAssignment."
        "hasFourAfterDeleting_iff_finiteClass"
    ),
    "no_qfree": "FirstNonHitSourceTotalFiniteAssignment.no_qfree",
    "cap_semantics": (
        "FirstNonHitSourceTotalFiniteAssignment.inCap_of_inCapInterior"
    ),
    "cap_blocks": (
        "FirstNonHitCompleteFiniteSourceTheory.capBlocks and named apex cuts"
    ),
    "cap_cardinality": "FirstNonHitCompleteFiniteSourceTheory.capSum",
    "named_facts": "FirstNonHitCompleteFiniteSourceTheory.namedFacts",
    "first_interaction": (
        "FirstNonHitCompleteFiniteSourceTheory.firstInteraction"
    ),
    "second_interaction": (
        "FirstNonHitCompleteFiniteSourceTheory.secondInteraction"
    ),
    "hingress": "FirstNonHitCompleteFiniteSourceTheory.hingress",
    "retained_context": (
        "FirstNonHitCompleteFiniteSourceTheory.retainedContext"
    ),
    "independent_escape": (
        "FirstNonHitCompleteFiniteSourceTheory.independentEscape"
    ),
    "query_negation": (
        "separate assumption: no distinct-center selected row has Q overlap >= 3"
    ),
}

OMITTED_RELAXATIONS = (
    "aligned_two_delete_minimal_core",
    "common_radius_named_surface_identity",
    "three_phase_no_alternation",
    "tri_apex_rich_classes",
)


class EncodingError(RuntimeError):
    """Fail-closed error for malformed source, CNF, or custody data."""


@dataclass(frozen=True)
class VariableRecord:
    id: int
    role: str


@dataclass(frozen=True)
class ClauseRecord:
    id: int
    family: str
    role: str
    literals: tuple[int, ...]


@dataclass(frozen=True)
class Encoding:
    n: int
    variables: tuple[VariableRecord, ...]
    clauses: tuple[ClauseRecord, ...]
    semantic_contract: Mapping[str, object]


@dataclass(frozen=True)
class Bundle:
    cnf: bytes
    variable_map: bytes
    sources: bytes
    manifest: bytes


def _canonical_json(value: object) -> bytes:
    return (
        json.dumps(value, ensure_ascii=True, sort_keys=True, separators=(",", ":"))
        + "\n"
    ).encode()


def _sha256(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


class CNFBuilder:
    """Deterministic builder in which every variable and clause has one role."""

    def __init__(self) -> None:
        self._variables: list[VariableRecord] = []
        self._var_by_role: dict[str, int] = {}
        self._clauses: list[ClauseRecord] = []
        self._clause_roles: set[str] = set()
        self._gate_definitions: dict[int, tuple[str, tuple[int, ...]]] = {}
        self.true = self.variable("logic/true")
        self.false = self.variable("logic/false")
        self.add("encoding_logic", "logic/true", [self.true])
        self.add("encoding_logic", "logic/false", [-self.false])

    def variable(self, role: str) -> int:
        if not role or role.startswith("/") or role.endswith("/"):
            raise EncodingError(f"invalid variable role: {role!r}")
        previous = self._var_by_role.get(role)
        if previous is not None:
            return previous
        identifier = len(self._variables) + 1
        self._var_by_role[role] = identifier
        self._variables.append(VariableRecord(identifier, role))
        return identifier

    def add(
        self, family: str, role: str, literals: Iterable[int]
    ) -> ClauseRecord:
        if family not in FAMILY_SOURCES:
            raise EncodingError(f"unmapped clause family: {family}")
        values = tuple(literals)
        if not role or role in self._clause_roles:
            raise EncodingError(f"duplicate or empty clause role: {role!r}")
        if not values or 0 in values or len(set(values)) != len(values):
            raise EncodingError(f"malformed clause {role}: {values}")
        if any(-value in values for value in values):
            raise EncodingError(f"tautological clause {role}")
        if any(abs(value) > len(self._variables) for value in values):
            raise EncodingError(f"unknown literal in clause {role}")
        record = ClauseRecord(len(self._clauses) + 1, family, role, values)
        self._clauses.append(record)
        self._clause_roles.add(role)
        return record

    def unit(self, family: str, role: str, literal: int) -> None:
        self.add(family, role, [literal])

    def exactly_one(self, literals: Sequence[int], family: str, tag: str) -> None:
        if not literals:
            raise EncodingError(f"empty exactly-one domain: {tag}")
        self.add(family, f"{tag}/at_least_one", literals)
        for left, right in itertools.combinations(literals, 2):
            self.add(
                family,
                f"{tag}/at_most_one/{left}/{right}",
                [-left, -right],
            )

    def iff_and(self, role: str, literals: Sequence[int]) -> int:
        values = tuple(literals)
        if self.false in values or -self.true in values:
            return self.false
        values = tuple(x for x in values if x != self.true and x != -self.false)
        if not values:
            return self.true
        if len(values) == 1:
            return values[0]
        out = self.variable(role)
        self._gate_definitions[out] = ("and", values)
        for index, literal in enumerate(values):
            self.add(
                "encoding_logic", f"{role}/forward/{index}", [-out, literal]
            )
        self.add(
            "encoding_logic", f"{role}/backward", [out, *(-x for x in values)]
        )
        return out

    def iff_or(self, role: str, literals: Sequence[int]) -> int:
        values = tuple(literals)
        if self.true in values or -self.false in values:
            return self.true
        values = tuple(x for x in values if x != self.false and x != -self.true)
        if not values:
            return self.false
        if len(values) == 1:
            return values[0]
        out = self.variable(role)
        self._gate_definitions[out] = ("or", values)
        for index, literal in enumerate(values):
            self.add(
                "encoding_logic", f"{role}/forward/{index}", [-literal, out]
            )
        self.add("encoding_logic", f"{role}/backward", [-out, *values])
        return out

    def at_least(self, literals: Sequence[int], threshold: int, tag: str) -> int:
        if threshold <= 0:
            return self.true
        if threshold > len(literals):
            return self.false
        states = [self.true, *([self.false] * threshold)]
        for position, literal in enumerate(literals, start=1):
            updated = [self.true]
            for count in range(1, threshold + 1):
                take = self.iff_and(
                    f"{tag}/dp/{position}/{count}/take",
                    [literal, states[count - 1]],
                )
                updated.append(
                    self.iff_or(
                        f"{tag}/dp/{position}/{count}/state",
                        [states[count], take],
                    )
                )
            states = updated
        return states[threshold]

    def assert_exact_cardinality(
        self,
        literals: Sequence[int],
        cardinality: int,
        family: str,
        tag: str,
    ) -> None:
        ge = self.at_least(literals, cardinality, f"{tag}/ge")
        gt = self.at_least(literals, cardinality + 1, f"{tag}/gt")
        self.unit(family, f"{tag}/lower", ge)
        self.unit(family, f"{tag}/upper", -gt)

    def freeze(self, n: int, semantic_contract: Mapping[str, object]) -> Encoding:
        return Encoding(
            n,
            tuple(self._variables),
            tuple(self._clauses),
            dict(semantic_contract),
        )


def run_encoding_controls() -> None:
    """Truth-table the local Tseitin/cardinality translator without a solver."""

    builder = CNFBuilder()
    inputs = [builder.variable(f"control/input/{index}") for index in range(5)]
    conjunction = builder.iff_and("control/and", inputs[:3])
    disjunction = builder.iff_or("control/or", inputs[:3])
    threshold = builder.at_least(inputs, 3, "control/ge3")

    def value(literal: int, known: dict[int, bool]) -> bool:
        identifier = abs(literal)
        if identifier not in known:
            operation, operands = builder._gate_definitions[identifier]
            operand_values = [value(operand, known) for operand in operands]
            known[identifier] = (
                all(operand_values) if operation == "and" else any(operand_values)
            )
        result = known[identifier]
        return result if literal > 0 else not result

    for raw in itertools.product((False, True), repeat=len(inputs)):
        known = dict(zip(inputs, raw, strict=True))
        known[builder.true] = True
        known[builder.false] = False
        if value(conjunction, known) != all(raw[:3]):
            raise EncodingError("AND control failed")
        if value(disjunction, known) != any(raw[:3]):
            raise EncodingError("OR control failed")
        if value(threshold, known) != (sum(raw) >= 3):
            raise EncodingError("cardinality control failed")
        if any(not any(value(literal, known) for literal in clause.literals)
               for clause in builder._clauses):
            raise EncodingError("Tseitin control assignment violates emitted clauses")


def _validate_n(n: object) -> int:
    if type(n) is not int or n < MIN_CARRIER_CARD:
        raise EncodingError(f"carrier cardinality must be an integer >= {MIN_CARRIER_CARD}")
    return n


def _assert_equal_bits(
    builder: CNFBuilder,
    family: str,
    tag: str,
    left: Sequence[int],
    right: Sequence[int],
    guard: int | None = None,
) -> None:
    if len(left) != len(right):
        raise EncodingError(f"bit-vector width mismatch: {tag}")
    prefix = [] if guard is None else [-guard]
    for index, (a, b) in enumerate(zip(left, right, strict=True)):
        builder.add(family, f"{tag}/{index}/lr", [*prefix, -a, b])
        builder.add(family, f"{tag}/{index}/rl", [*prefix, a, -b])


def _assert_different_one_hot(
    builder: CNFBuilder,
    family: str,
    tag: str,
    left: Sequence[int],
    right: Sequence[int],
    guard: int | None = None,
) -> None:
    prefix = [] if guard is None else [-guard]
    for index, (a, b) in enumerate(zip(left, right, strict=True)):
        builder.add(family, f"{tag}/{index}", [*prefix, -a, -b])


def encode(n: int) -> Encoding:
    """Emit the complete current relaxation over ``Fin n`` without solving it."""

    n = _validate_n(n)
    b = CNFBuilder()
    indices = range(n)
    caps = range(3)  # 0=surplus, 1=first opposite, 2=second opposite

    blocker = [[b.variable(f"blocker/{source}/{center}") for center in indices]
               for source in indices]
    for source in indices:
        b.exactly_one(blocker[source], "blocker_function", f"blocker/{source}")
        b.unit(
            "blocker_function",
            f"blocker/{source}/not_fixed",
            -blocker[source][source],
        )

    role = {name: [b.variable(f"role/{name}/{i}") for i in indices] for name in ROLES}
    for name in ROLES:
        b.exactly_one(role[name], "named_role_selectors", f"role/{name}")

    radius = [
        [[b.variable(f"radius/{center}/{x}/{y}") for y in indices] for x in indices]
        for center in indices
    ]
    for center in indices:
        for x in indices:
            b.unit(
                "radius_equivalence",
                f"radius/refl/{center}/{x}",
                radius[center][x][x],
            )
        for x in indices:
            for y in range(x + 1, n):
                b.add(
                    "radius_equivalence",
                    f"radius/symm/{center}/{x}/{y}/xy",
                    [-radius[center][x][y], radius[center][y][x]],
                )
                b.add(
                    "radius_equivalence",
                    f"radius/symm/{center}/{x}/{y}/yx",
                    [radius[center][x][y], -radius[center][y][x]],
                )
        for x in indices:
            for y in indices:
                for z in indices:
                    if len({x, y, z}) < 3:
                        continue
                    b.add(
                        "radius_equivalence",
                        f"radius/trans/{center}/{x}/{y}/{z}",
                        [
                            -radius[center][x][y],
                            -radius[center][y][z],
                            radius[center][x][z],
                        ],
                    )
        for x in indices:
            if x != center:
                b.unit(
                    "radius_zero_class",
                    f"radius/zero/{center}/{x}",
                    -radius[center][center][x],
                )

    row = [[b.variable(f"row/{source}/{x}") for x in indices] for source in indices]
    for source in indices:
        for center in indices:
            for x in indices:
                b.add(
                    "selected_row",
                    f"row/iff/{source}/{center}/{x}/lr",
                    [-blocker[source][center], -row[source][x], radius[center][x][source]],
                )
                b.add(
                    "selected_row",
                    f"row/iff/{source}/{center}/{x}/rl",
                    [-blocker[source][center], row[source][x], -radius[center][x][source]],
                )
        b.assert_exact_cardinality(row[source], 4, "selected_row", f"row/{source}/card4")
        b.unit("selected_row", f"row/{source}/source_mem", row[source][source])

    ge4: dict[tuple[int, int], int] = {}
    ge5: dict[tuple[int, int], int] = {}
    for center in indices:
        for anchor in indices:
            if anchor == center:
                continue
            class_bits = radius[center][anchor]
            ge4[center, anchor] = b.at_least(
                class_bits, 4, f"class_threshold/{center}/{anchor}/ge4"
            )
            ge5[center, anchor] = b.at_least(
                class_bits, 5, f"class_threshold/{center}/{anchor}/ge5"
            )

    has4 = [[b.variable(f"has4/{deleted}/{center}") for center in indices]
            for deleted in indices]
    for deleted in indices:
        for center in indices:
            witnesses: list[int] = []
            for anchor in indices:
                if anchor in {deleted, center}:
                    continue
                deleted_out = b.iff_and(
                    f"has4/witness/{deleted}/{center}/{anchor}/deleted_out",
                    [-radius[center][anchor][deleted], ge4[center, anchor]],
                )
                deleted_in = b.iff_and(
                    f"has4/witness/{deleted}/{center}/{anchor}/deleted_in",
                    [radius[center][anchor][deleted], ge5[center, anchor]],
                )
                witnesses.append(
                    b.iff_or(
                        f"has4/witness/{deleted}/{center}/{anchor}",
                        [deleted_out, deleted_in],
                    )
                )
            exact = b.iff_or(f"has4/exact/{deleted}/{center}", witnesses)
            b.add(
                "has_four_after_delete",
                f"has4/{deleted}/{center}/lr",
                [-has4[deleted][center], exact],
            )
            b.add(
                "has_four_after_delete",
                f"has4/{deleted}/{center}/rl",
                [has4[deleted][center], -exact],
            )
    for source in indices:
        for center in indices:
            b.add(
                "no_qfree",
                f"no_qfree/{source}/{center}",
                [-blocker[source][center], -has4[source][center]],
            )

    cap = [[[b.variable(f"cap/{x}/{k}") for k in caps] for x in indices]][0]
    interior = [
        [b.variable(f"interior/{x}/{k}") for k in caps] for x in indices
    ]
    for x in indices:
        for k in caps:
            b.add(
                "cap_semantics",
                f"interior_subset/{x}/{k}",
                [-interior[x][k], cap[x][k]],
            )

    cut1 = [b.variable(f"cut/opp1/{i}") for i in indices]
    cut2 = [b.variable(f"cut/opp2/{i}") for i in indices]
    _assert_equal_bits(b, "cap_blocks", "cut/opp1/role", cut1, role["first_apex"])
    _assert_equal_bits(b, "cap_blocks", "cut/opp2/role", cut2, role["second_apex"])
    b.unit("cap_blocks", "cut/surplus/zero", role["surplus_apex"][0])
    direct = b.variable("cap_blocks/direct")
    mirror = b.variable("cap_blocks/mirror")
    b.exactly_one([direct, mirror], "cap_blocks", "cap_blocks/orientation")
    for i in indices:
        for j in indices:
            if not (0 < i < j):
                b.add(
                    "cap_blocks", f"cap_blocks/direct/order/{i}/{j}",
                    [-direct, -cut1[i], -cut2[j]],
                )
            if not (0 < j < i):
                b.add(
                    "cap_blocks", f"cap_blocks/mirror/order/{i}/{j}",
                    [-mirror, -cut1[i], -cut2[j]],
                )
    for x in indices:
        for i in indices:
            if not (0 < x < i):
                b.add(
                    "cap_blocks", f"cap_blocks/direct/opp2/{x}/{i}",
                    [-direct, -interior[x][2], -cut1[i]],
                )
            if not (i < x):
                b.add(
                    "cap_blocks", f"cap_blocks/direct/surplus_left/{x}/{i}",
                    [-direct, -interior[x][0], -cut1[i]],
                )
            if not (i < x):
                b.add(
                    "cap_blocks", f"cap_blocks/direct/opp1/{x}/{i}",
                    [-direct, -interior[x][1], -cut2[i]],
                )
            if not (0 < x < i):
                b.add(
                    "cap_blocks", f"cap_blocks/mirror/opp1/{x}/{i}",
                    [-mirror, -interior[x][1], -cut2[i]],
                )
            if not (i < x):
                b.add(
                    "cap_blocks", f"cap_blocks/mirror/surplus_left/{x}/{i}",
                    [-mirror, -interior[x][0], -cut2[i]],
                )
            if not (i < x):
                b.add(
                    "cap_blocks", f"cap_blocks/mirror/opp2/{x}/{i}",
                    [-mirror, -interior[x][2], -cut1[i]],
                )
        for j in indices:
            if not (x < j):
                b.add(
                    "cap_blocks", f"cap_blocks/direct/surplus_right/{x}/{j}",
                    [-direct, -interior[x][0], -cut2[j]],
                )
            if not (x < j):
                b.add(
                    "cap_blocks", f"cap_blocks/mirror/surplus_right/{x}/{j}",
                    [-mirror, -interior[x][0], -cut1[j]],
                )
    all_cap_bits = [cap[x][k] for x in indices for k in caps]
    b.assert_exact_cardinality(
        all_cap_bits, n + 3, "cap_cardinality", "cap/card_sum"
    )

    named_blocker = {
        name: [b.variable(f"named_blocker/{name}/{c}") for c in indices]
        for name in ROLES
    }
    named_row = {
        name: [b.variable(f"named_row/{name}/{x}") for x in indices]
        for name in ROLES
    }
    named_cap = {
        name: [b.variable(f"named_cap/{name}/{k}") for k in caps]
        for name in ROLES
    }
    named_interior = {
        name: [b.variable(f"named_interior/{name}/{k}") for k in caps]
        for name in ROLES
    }
    for name in ROLES:
        for i in indices:
            selector = role[name][i]
            for c in indices:
                b.add(
                    "encoding_logic",
                    f"mux/named_blocker/{name}/{i}/{c}/lr",
                    [-selector, -named_blocker[name][c], blocker[i][c]],
                )
                b.add(
                    "encoding_logic",
                    f"mux/named_blocker/{name}/{i}/{c}/rl",
                    [-selector, named_blocker[name][c], -blocker[i][c]],
                )
            for x in indices:
                b.add(
                    "encoding_logic",
                    f"mux/named_row/{name}/{i}/{x}/lr",
                    [-selector, -named_row[name][x], row[i][x]],
                )
                b.add(
                    "encoding_logic",
                    f"mux/named_row/{name}/{i}/{x}/rl",
                    [-selector, named_row[name][x], -row[i][x]],
                )
            for k in caps:
                b.add(
                    "encoding_logic",
                    f"mux/named_cap/{name}/{i}/{k}/lr",
                    [-selector, -named_cap[name][k], cap[i][k]],
                )
                b.add(
                    "encoding_logic",
                    f"mux/named_cap/{name}/{i}/{k}/rl",
                    [-selector, named_cap[name][k], -cap[i][k]],
                )
                b.add(
                    "encoding_logic",
                    f"mux/named_interior/{name}/{i}/{k}/lr",
                    [-selector, -named_interior[name][k], interior[i][k]],
                )
                b.add(
                    "encoding_logic",
                    f"mux/named_interior/{name}/{i}/{k}/rl",
                    [-selector, named_interior[name][k], -interior[i][k]],
                )

    blocker_interior = {
        name: [b.variable(f"blocker_interior/{name}/{k}") for k in caps]
        for name in ROLES
    }
    for name in ROLES:
        for k in caps:
            terms = [
                b.iff_and(
                    f"blocker_interior/{name}/{k}/term/{c}",
                    [named_blocker[name][c], interior[c][k]],
                )
                for c in indices
            ]
            exact = b.iff_or(f"blocker_interior/{name}/{k}/exact", terms)
            b.add(
                "encoding_logic",
                f"blocker_interior/{name}/{k}/lr",
                [-blocker_interior[name][k], exact],
            )
            b.add(
                "encoding_logic",
                f"blocker_interior/{name}/{k}/rl",
                [blocker_interior[name][k], -exact],
            )

    def role_ne(left: str, right: str, tag: str, family: str = "named_facts") -> None:
        _assert_different_one_hot(b, family, tag, role[left], role[right])

    def blocker_eq(left: str, right: str, tag: str, family: str) -> None:
        _assert_equal_bits(
            b, family, tag, named_blocker[left], named_blocker[right]
        )

    def blocker_ne(
        left: str, right: str, tag: str, family: str, guard: int | None = None
    ) -> None:
        _assert_different_one_hot(
            b, family, tag, named_blocker[left], named_blocker[right], guard
        )

    def named_mem(
        source: str,
        point: str,
        truth: bool,
        tag: str,
        family: str,
        guard: int | None = None,
    ) -> None:
        prefix = [] if guard is None else [-guard]
        for x in indices:
            literal = named_row[source][x] if truth else -named_row[source][x]
            b.add(family, f"{tag}/{x}", [*prefix, -role[point][x], literal])

    def named_radius_false(
        center_role: str,
        left_role: str,
        right_role: str,
        tag: str,
        family: str,
        guard: int | None = None,
    ) -> None:
        prefix = [] if guard is None else [-guard]
        for center in indices:
            for left in indices:
                for right in indices:
                    b.add(
                        family,
                        f"{tag}/{center}/{left}/{right}",
                        [
                            *prefix,
                            -role[center_role][center],
                            -role[left_role][left],
                            -role[right_role][right],
                            -radius[center][left][right],
                        ],
                    )

    def h4_role_center(
        deleted_role: str,
        center_role: str,
        tag: str,
        family: str,
        guard: int | None = None,
    ) -> None:
        prefix = [] if guard is None else [-guard]
        for deleted in indices:
            for center in indices:
                b.add(
                    family,
                    f"{tag}/{deleted}/{center}",
                    [
                        *prefix,
                        -role[deleted_role][deleted],
                        -role[center_role][center],
                        has4[deleted][center],
                    ],
                )

    def h4_role_blocker(
        deleted_role: str,
        source_role: str,
        tag: str,
        family: str,
        guard: int | None = None,
    ) -> None:
        prefix = [] if guard is None else [-guard]
        for deleted in indices:
            for center in indices:
                b.add(
                    family,
                    f"{tag}/{deleted}/{center}",
                    [
                        *prefix,
                        -role[deleted_role][deleted],
                        -named_blocker[source_role][center],
                        has4[deleted][center],
                    ],
                )

    named_role_ne = [
        (P1, P2), (R1, R2), (C1, C2), (Q1, Q2),
        *((canonical, retained) for canonical in (C1, C2, Q1, Q2)
          for retained in (P1, P2, R1, R2)),
    ]
    for left, right in named_role_ne:
        role_ne(left, right, f"named/role_ne/{left}/{right}")
    for left, right in ((P1, P2), (R1, R2), (Q1, Q2)):
        blocker_eq(left, right, f"named/blocker_eq/{left}/{right}", "named_facts")
    for left, right in (
        (Q1, P1), (Q1, R1), (C1, P1), (C1, R1), (C2, P1), (C2, R1)
    ):
        blocker_ne(left, right, f"named/blocker_ne/{left}/{right}", "named_facts")
    for name in (P1, P2, R1, R2, C1, C2):
        b.unit("named_facts", f"named/first_cap/{name}", named_interior[name][1])
    named_mem(Q2, Q1, True, "named/fresh_mutual/q1_in_q2", "named_facts")
    named_mem(Q1, Q2, True, "named/fresh_mutual/q2_in_q1", "named_facts")
    omission_pairs = (
        (C1, P1, P2), (C1, R1, R2), (C2, P1, P2), (C2, R1, R2)
    )
    for source, left, right in omission_pairs:
        for li in indices:
            for ri in indices:
                if li == ri:
                    continue
                b.add(
                    "named_facts",
                    f"named/omission/{source}/{left}/{right}/{li}/{ri}",
                    [
                        -role[left][li],
                        -role[right][ri],
                        -named_row[source][li],
                        -named_row[source][ri],
                    ],
                )
        for deleted_left in indices:
            for deleted_right in indices:
                if deleted_left == deleted_right:
                    continue
                for center in indices:
                    b.add(
                        "named_facts",
                        (
                            f"named/deletion_or/{source}/{left}/{right}/"
                            f"{deleted_left}/{deleted_right}/{center}"
                        ),
                        [
                            -role[left][deleted_left],
                            -role[right][deleted_right],
                            -named_blocker[source][center],
                            has4[deleted_left][center],
                            has4[deleted_right][center],
                        ],
                    )

    def encode_same_arm(arm: int, source: str, family: str, tag: str) -> None:
        _assert_equal_bits(
            b,
            family,
            f"{tag}/blocker",
            named_blocker[source],
            named_blocker[Q1],
            arm,
        )
        _assert_equal_bits(
            b, family, f"{tag}/row", named_row[source], named_row[Q1], arm
        )

    def encode_omission_arm(arm: int, source: str, family: str, tag: str) -> None:
        choices = [b.variable(f"{tag}/delete/{fresh}") for fresh in (Q1, Q2)]
        b.add(family, f"{tag}/choice", [-arm, *choices])
        for choice, fresh in zip(choices, (Q1, Q2), strict=True):
            b.add(family, f"{tag}/choice/{fresh}/guard", [-choice, arm])
            named_mem(source, fresh, False, f"{tag}/omits/{fresh}", family, choice)
            h4_role_blocker(
                fresh, source, f"{tag}/survives/{fresh}", family, choice
            )

    first_same = b.variable("first_interaction/same")
    first_omit = b.variable("first_interaction/omission")
    b.add(
        "first_interaction", "first_interaction/exhaustive", [first_same, first_omit]
    )
    encode_same_arm(first_same, C1, "first_interaction", "first_interaction/same")
    encode_omission_arm(
        first_omit, C1, "first_interaction", "first_interaction/omission"
    )

    second_same = b.variable("second_interaction/same")
    second_omit = b.variable("second_interaction/omission")
    second_diff = b.variable("second_interaction/different_cap")
    second_same_cap = b.variable("second_interaction/same_cap")
    b.add(
        "second_interaction",
        "second_interaction/exhaustive",
        [second_same, second_omit, second_diff, second_same_cap],
    )
    encode_same_arm(second_same, C2, "second_interaction", "second_interaction/same")
    encode_omission_arm(
        second_omit, C2, "second_interaction", "second_interaction/omission"
    )
    blocker_ne(
        C2, Q1, "second_interaction/different_cap/blocker_ne",
        "second_interaction", second_diff
    )
    named_mem(
        C2, Q1, True, "second_interaction/different_cap/q1_mem",
        "second_interaction", second_diff
    )
    named_mem(
        C2, Q2, True, "second_interaction/different_cap/q2_mem",
        "second_interaction", second_diff
    )
    for x in indices:
        b.add(
            "second_interaction",
            f"second_interaction/different_cap/intersection/{x}",
            [
                -second_diff,
                -named_row[C2][x],
                -named_row[Q1][x],
                role[Q1][x],
                role[Q2][x],
            ],
        )
    blocker_ne(
        C2, Q1, "second_interaction/same_cap/blocker_ne",
        "second_interaction", second_same_cap
    )
    named_mem(
        C2, Q1, True, "second_interaction/same_cap/q1_mem",
        "second_interaction", second_same_cap
    )
    named_mem(
        C2, Q2, True, "second_interaction/same_cap/q2_mem",
        "second_interaction", second_same_cap
    )
    for x in indices:
        b.add(
            "second_interaction",
            f"second_interaction/same_cap/intersection/{x}",
            [
                -second_same_cap,
                -named_row[C2][x],
                -named_row[Q1][x],
                role[Q1][x],
                role[Q2][x],
            ],
        )
    diff_choices = {
        (source_cap, fresh_cap): b.variable(
            f"second_interaction/different_cap/caps/{source_cap}/{fresh_cap}"
        )
        for source_cap in caps
        for fresh_cap in caps
        if source_cap != fresh_cap
    }
    b.add(
        "second_interaction",
        "second_interaction/different_cap/caps/exist",
        [-second_diff, *diff_choices.values()],
    )
    for (source_cap, fresh_cap), choice in diff_choices.items():
        b.add(
            "second_interaction",
            f"second_interaction/different_cap/caps/{source_cap}/{fresh_cap}/guard",
            [-choice, second_diff],
        )
        b.add(
            "second_interaction",
            f"second_interaction/different_cap/caps/{source_cap}/{fresh_cap}/source",
            [-choice, blocker_interior[C2][source_cap]],
        )
        b.add(
            "second_interaction",
            f"second_interaction/different_cap/caps/{source_cap}/{fresh_cap}/fresh",
            [-choice, blocker_interior[Q1][fresh_cap]],
        )

    same_cap_choices = [
        b.variable(f"second_interaction/same_cap/cap/{k}") for k in caps
    ]
    b.add(
        "second_interaction",
        "second_interaction/same_cap/cap/exist",
        [-second_same_cap, *same_cap_choices],
    )
    for k, choice in enumerate(same_cap_choices):
        b.add(
            "second_interaction",
            f"second_interaction/same_cap/cap/{k}/guard",
            [-choice, second_same_cap],
        )
        b.add(
            "second_interaction",
            f"second_interaction/same_cap/cap/{k}/source",
            [-choice, blocker_interior[C2][k]],
        )
        b.add(
            "second_interaction",
            f"second_interaction/same_cap/cap/{k}/fresh",
            [-choice, blocker_interior[Q1][k]],
        )
        b.add(
            "second_interaction",
            f"second_interaction/same_cap/cap/{k}/endpoint",
            [-choice, named_cap[Q1][k], named_cap[Q2][k]],
        )

    retained = b.variable("hingress/retained")
    common = b.variable("hingress/common_payload_free")
    b.add("hingress", "hingress/exhaustive", [retained, common])
    named_radius_false(
        APEX, C1, C2, "hingress/retained/canonical_radius_ne", "hingress", retained
    )

    named_class: dict[str, list[int]] = {}
    for reference in (P1, R1):
        bits = [b.variable(f"first_apex_class/{reference}/{x}") for x in indices]
        named_class[reference] = bits
        for apex in indices:
            for ref in indices:
                for x in indices:
                    b.add(
                        "encoding_logic",
                        f"mux/first_apex_class/{reference}/{apex}/{ref}/{x}/lr",
                        [
                            -role[APEX][apex], -role[reference][ref],
                            -bits[x], radius[apex][x][ref],
                        ],
                    )
                    b.add(
                        "encoding_logic",
                        f"mux/first_apex_class/{reference}/{apex}/{ref}/{x}/rl",
                        [
                            -role[APEX][apex], -role[reference][ref],
                            bits[x], -radius[apex][x][ref],
                        ],
                    )
        b.assert_exact_cardinality(
            bits, 4, "retained_context", f"retained_context/class/{reference}/card4"
        )
    for reference, partner in ((P1, P2), (R1, R2)):
        for x in indices:
            b.add(
                "retained_context",
                f"retained_context/intersection/{reference}/{x}/subset",
                [
                    -named_class[reference][x], -interior[x][1],
                    role[reference][x], role[partner][x],
                ],
            )
            for endpoint in (reference, partner):
                b.add(
                    "retained_context",
                    f"retained_context/intersection/{reference}/{endpoint}/{x}/class",
                    [-role[endpoint][x], named_class[reference][x]],
                )
                b.add(
                    "retained_context",
                    f"retained_context/intersection/{reference}/{endpoint}/{x}/interior",
                    [-role[endpoint][x], interior[x][1]],
                )
    for left in (P1, P2):
        for right in (R1, R2):
            role_ne(left, right, f"retained_context/point_ne/{left}/{right}", "retained_context")
            named_radius_false(
                APEX, left, right,
                f"retained_context/radius_ne/{left}/{right}", "retained_context"
            )
    blocker_eq(P1, P2, "retained_context/blocker_eq/first", "retained_context")
    blocker_eq(R1, R2, "retained_context/blocker_eq/second", "retained_context")
    blocker_ne(P1, R1, "retained_context/blocker_ne", "retained_context")

    collision = {
        "first": [b.variable(f"retained_context/collision/first/{i}") for i in indices],
        "second": [b.variable(f"retained_context/collision/second/{i}") for i in indices],
    }
    collision_row: dict[str, list[int]] = {}
    collision_blocker: dict[str, list[int]] = {}
    for side, allowed in (("first", (P1, P2)), ("second", (R1, R2))):
        b.exactly_one(
            collision[side], "retained_context", f"retained_context/collision/{side}"
        )
        for i in indices:
            b.add(
                "retained_context",
                f"retained_context/collision/{side}/{i}/allowed",
                [-collision[side][i], role[allowed[0]][i], role[allowed[1]][i]],
            )
        collision_row[side] = [
            b.variable(f"retained_context/collision_row/{side}/{x}") for x in indices
        ]
        collision_blocker[side] = [
            b.variable(f"retained_context/collision_blocker/{side}/{c}") for c in indices
        ]
        for i in indices:
            for x in indices:
                b.add(
                    "encoding_logic",
                    f"mux/collision_row/{side}/{i}/{x}/lr",
                    [-collision[side][i], -collision_row[side][x], row[i][x]],
                )
                b.add(
                    "encoding_logic",
                    f"mux/collision_row/{side}/{i}/{x}/rl",
                    [-collision[side][i], collision_row[side][x], -row[i][x]],
                )
            for c in indices:
                b.add(
                    "encoding_logic",
                    f"mux/collision_blocker/{side}/{i}/{c}/lr",
                    [
                        -collision[side][i], -collision_blocker[side][c],
                        blocker[i][c],
                    ],
                )
                b.add(
                    "encoding_logic",
                    f"mux/collision_blocker/{side}/{i}/{c}/rl",
                    [
                        -collision[side][i], collision_blocker[side][c],
                        -blocker[i][c],
                    ],
                )

    def collision_constraints(
        side: str, fresh: str, retained_source: str
    ) -> None:
        for x in indices:
            b.add(
                "retained_context",
                f"retained_context/{side}/fresh_not_mem/{x}",
                [-role[fresh][x], -collision_row[side][x]],
            )
            b.add(
                "retained_context",
                f"retained_context/{side}/collision_not_mem/{x}",
                [-collision[side][x], -named_row[fresh][x]],
            )
        _assert_equal_bits(
            b,
            "retained_context",
            f"retained_context/{side}/collision_blocker_eq",
            collision_blocker[side],
            named_blocker[retained_source],
        )
        _assert_different_one_hot(
            b,
            "retained_context",
            f"retained_context/{side}/blockers_ne",
            collision_blocker[side],
            named_blocker[fresh],
        )
        h4_role_center(
            fresh, APEX, f"retained_context/{side}/fresh_apex", "retained_context"
        )
        for deleted in indices:
            for center in indices:
                b.add(
                    "retained_context",
                    f"retained_context/{side}/fresh_collision_blocker/{deleted}/{center}",
                    [
                        -role[fresh][deleted], -collision_blocker[side][center],
                        has4[deleted][center],
                    ],
                )
                b.add(
                    "retained_context",
                    f"retained_context/{side}/collision_fresh_blocker/{deleted}/{center}",
                    [
                        -collision[side][deleted], -named_blocker[fresh][center],
                        has4[deleted][center],
                    ],
                )
                b.add(
                    "retained_context",
                    f"retained_context/{side}/collision_apex/{deleted}/{center}",
                    [
                        -collision[side][deleted], -role[APEX][center],
                        has4[deleted][center],
                    ],
                )

    collision_constraints("first", R1, P1)
    collision_constraints("second", P1, R1)

    escape_support = [b.variable(f"escape/support/{x}") for x in indices]
    escape_witness = [b.variable(f"escape/witness/{x}") for x in indices]
    b.assert_exact_cardinality(
        escape_support, 4, "independent_escape", "escape/support/card4"
    )
    b.exactly_one(escape_witness, "independent_escape", "escape/witness")
    for x in indices:
        b.add(
            "independent_escape", f"escape/witness/{x}/support",
            [-escape_witness[x], escape_support[x]],
        )
        for source in (P1, R1, Q1):
            b.add(
                "independent_escape", f"escape/witness/{x}/not_row/{source}",
                [-escape_witness[x], -named_row[source][x]],
            )
    escape_overlap = [
        b.iff_and(
            f"escape/q_overlap/{x}", [escape_support[x], named_row[Q1][x]]
        )
        for x in indices
    ]
    escape_ge3 = b.at_least(escape_overlap, 3, "escape/q_overlap/ge3")
    b.unit("independent_escape", "escape/q_overlap/at_most_two", -escape_ge3)

    query_ge3: list[int] = []
    for source in indices:
        overlap = [
            b.iff_and(
                f"query/overlap/{source}/{x}", [row[source][x], named_row[Q1][x]]
            )
            for x in indices
        ]
        ge3 = b.at_least(overlap, 3, f"query/overlap/{source}/ge3")
        query_ge3.append(ge3)
        for source_center in indices:
            for q_center in indices:
                if source_center == q_center:
                    continue
                b.add(
                    "query_negation",
                    f"query/no_distinct_three/{source}/{source_center}/{q_center}",
                    [
                        -blocker[source][source_center],
                        -named_blocker[Q1][q_center],
                        -ge3,
                    ],
                )

    contract = {
        "carrier_cardinality": n,
        "blocker_domains": n,
        "role_domains": list(ROLES),
        "row_cardinality": 4,
        "cap_sum": n + 3,
        "first_interaction_arms": ["same", "omission"],
        "second_interaction_arms": ["same", "omission", "different_cap", "same_cap"],
        "hingress_arms": ["retained", "common_payload_free"],
        "retained_collision_selectors": ["first", "second"],
        "independent_escape_support_cardinality": 4,
        "independent_escape_q_overlap_max": 2,
        "query_sources": n,
        "query_overlap_min": 3,
        "omitted_relaxations": list(OMITTED_RELAXATIONS),
    }
    encoding = b.freeze(n, contract)
    validate_semantic_encoding(encoding)
    return encoding


def _repo_root() -> Path:
    return Path(__file__).resolve().parents[2]


def _read_source_without_links(root: Path, relative: str) -> bytes:
    path = PurePosixPath(relative)
    if path.is_absolute() or ".." in path.parts or str(path) != relative:
        raise EncodingError(f"invalid source path: {relative}")
    current = root
    for part in path.parts:
        current = current / part
        info = os.lstat(current)
        if stat.S_ISLNK(info.st_mode):
            raise EncodingError(f"source custody refuses symlink: {relative}")
    flags = os.O_RDONLY
    if hasattr(os, "O_NOFOLLOW"):
        flags |= os.O_NOFOLLOW
    descriptor = os.open(current, flags)
    try:
        if not stat.S_ISREG(os.fstat(descriptor).st_mode):
            raise EncodingError(f"source is not a regular file: {relative}")
        chunks: list[bytes] = []
        while chunk := os.read(descriptor, 1024 * 1024):
            chunks.append(chunk)
        return b"".join(chunks)
    finally:
        os.close(descriptor)


def source_snapshot() -> dict[str, object]:
    rows = []
    root = _repo_root()
    for path, expected in sorted(SOURCE_HASHES.items()):
        data = _read_source_without_links(root, path)
        actual = _sha256(data)
        if actual != expected:
            raise EncodingError(
                f"source drift from pinned commit for {path}: {actual} != {expected}"
            )
        rows.append({"path": path, "sha256": actual, "size": len(data)})
    return {
        "schema": SOURCE_SCHEMA,
        "commit": LEAN_COMMIT,
        "files": rows,
    }


def _dimacs(encoding: Encoding) -> bytes:
    lines = [f"p cnf {len(encoding.variables)} {len(encoding.clauses)}"]
    lines.extend(" ".join(map(str, clause.literals)) + " 0" for clause in encoding.clauses)
    return ("\n".join(lines) + "\n").encode()


def _map_document(encoding: Encoding) -> dict[str, object]:
    return {
        "schema": MAP_SCHEMA,
        "n": encoding.n,
        "variables": [
            {"id": variable.id, "role": variable.role}
            for variable in encoding.variables
        ],
        "clauses": [
            {
                "id": clause.id,
                "family": clause.family,
                "role": clause.role,
                "literals": list(clause.literals),
            }
            for clause in encoding.clauses
        ],
        "family_sources": dict(sorted(FAMILY_SOURCES.items())),
        "semantic_contract": encoding.semantic_contract,
    }


def emit_bundle(n: int) -> Bundle:
    """Build and validate deterministic CNF, map, source snapshot, and manifest."""

    run_encoding_controls()
    encoding = encode(n)
    sources = _canonical_json(source_snapshot())
    cnf = _dimacs(encoding)
    variable_map = _canonical_json(_map_document(encoding))
    family_counts = Counter(clause.family for clause in encoding.clauses)
    manifest_without_hash = {
        "schema": MANIFEST_SCHEMA,
        "n": encoding.n,
        "lean_commit": LEAN_COMMIT,
        "source_total": SOURCE_TOTAL_CLAIM,
        "launch_enabled": PRODUCTION_LAUNCH_ENABLED,
        "solver_run": False,
        "solver_verdict": None,
        "generic_cardinality_lift": False,
        "finite_encoding_emitted": True,
        "query_is_separate_assumption": True,
        "query": "no distinct-center selected row has Q-row overlap at least three",
        "omitted_relaxations": list(OMITTED_RELAXATIONS),
        "variables": len(encoding.variables),
        "clauses": len(encoding.clauses),
        "family_clause_counts": dict(sorted(family_counts.items())),
        "cnf_sha256": _sha256(cnf),
        "map_sha256": _sha256(variable_map),
        "sources_sha256": _sha256(sources),
    }
    manifest_without_hash["manifest_sha256"] = _sha256(
        _canonical_json(manifest_without_hash)
    )
    bundle = Bundle(cnf, variable_map, sources, _canonical_json(manifest_without_hash))
    validate_bundle(bundle)
    return bundle


def _strict_json(data: bytes, description: str) -> dict[str, object]:
    class DuplicateKey(ValueError):
        pass

    def pairs(items: list[tuple[str, object]]) -> dict[str, object]:
        result: dict[str, object] = {}
        for key, value in items:
            if key in result:
                raise DuplicateKey(key)
            result[key] = value
        return result

    try:
        value = json.loads(data, object_pairs_hook=pairs)
    except (UnicodeDecodeError, json.JSONDecodeError, DuplicateKey) as exc:
        raise EncodingError(f"malformed {description}: {exc}") from exc
    if type(value) is not dict:
        raise EncodingError(f"{description} must be a JSON object")
    return value


def validate_semantic_encoding(encoding: Encoding) -> None:
    """Independently check the source inventory and semantic surface."""

    n = _validate_n(encoding.n)
    variables = encoding.variables
    clauses = encoding.clauses
    if [row.id for row in variables] != list(range(1, len(variables) + 1)):
        raise EncodingError("variable identifiers are not contiguous")
    if len({row.role for row in variables}) != len(variables):
        raise EncodingError("variable roles are not unique")
    if [row.id for row in clauses] != list(range(1, len(clauses) + 1)):
        raise EncodingError("clause identifiers are not contiguous")
    if len({row.role for row in clauses}) != len(clauses):
        raise EncodingError("clause roles are not unique")
    if any(row.family not in FAMILY_SOURCES for row in clauses):
        raise EncodingError("a clause family lacks a source binding")
    present = {row.family for row in clauses}
    required = set(FAMILY_SOURCES)
    if present != required:
        raise EncodingError(f"clause family mismatch: {sorted(required - present)}")
    if any(
        omitted in row.role
        for omitted in OMITTED_RELAXATIONS
        for row in (*variables, *clauses)
    ):
        raise EncodingError("an omitted relaxation leaked into the CNF")
    contract = encoding.semantic_contract
    expected = {
        "carrier_cardinality": n,
        "blocker_domains": n,
        "role_domains": list(ROLES),
        "row_cardinality": 4,
        "cap_sum": n + 3,
        "first_interaction_arms": ["same", "omission"],
        "second_interaction_arms": ["same", "omission", "different_cap", "same_cap"],
        "hingress_arms": ["retained", "common_payload_free"],
        "retained_collision_selectors": ["first", "second"],
        "independent_escape_support_cardinality": 4,
        "independent_escape_q_overlap_max": 2,
        "query_sources": n,
        "query_overlap_min": 3,
        "omitted_relaxations": list(OMITTED_RELAXATIONS),
    }
    if contract != expected:
        raise EncodingError("semantic contract does not match the frozen relaxation")
    roles = {row.role for row in variables}
    for source in range(n):
        if sum(f"blocker/{source}/{center}" in roles for center in range(n)) != n:
            raise EncodingError("incomplete blocker domain")
        if f"row/{source}/{source}" not in roles:
            raise EncodingError("incomplete selected-row domain")
    for name in ROLES:
        if sum(f"role/{name}/{i}" in roles for i in range(n)) != n:
            raise EncodingError("incomplete named-role domain")
    query_count = sum(row.family == "query_negation" for row in clauses)
    if query_count != n * n * (n - 1):
        raise EncodingError("query does not cover every source and distinct center pair")


def validate_bundle(bundle: Bundle) -> dict[str, object]:
    """Validate bytes without trusting the emitter's in-memory objects."""

    manifest = _strict_json(bundle.manifest, "manifest")
    variable_map = _strict_json(bundle.variable_map, "map")
    sources = _strict_json(bundle.sources, "sources")
    if _canonical_json(manifest) != bundle.manifest:
        raise EncodingError("manifest is not canonical JSON")
    if _canonical_json(variable_map) != bundle.variable_map:
        raise EncodingError("map is not canonical JSON")
    if _canonical_json(sources) != bundle.sources:
        raise EncodingError("sources are not canonical JSON")
    if manifest.get("schema") != MANIFEST_SCHEMA or variable_map.get("schema") != MAP_SCHEMA:
        raise EncodingError("artifact schema mismatch")
    if sources != source_snapshot():
        raise EncodingError("source snapshot does not replay exactly")
    if manifest.get("source_total") is not False or manifest.get("launch_enabled") is not False:
        raise EncodingError("audit gate flags must remain false")
    if manifest.get("solver_run") is not False or manifest.get("solver_verdict") is not None:
        raise EncodingError("NONLAUNCH artifact contains a solver claim")
    if manifest.get("omitted_relaxations") != list(OMITTED_RELAXATIONS):
        raise EncodingError("omitted relaxation inventory drifted")
    if manifest.get("query_is_separate_assumption") is not True:
        raise EncodingError("query was not kept as a separate assumption")
    if manifest.get("cnf_sha256") != _sha256(bundle.cnf):
        raise EncodingError("CNF digest mismatch")
    if manifest.get("map_sha256") != _sha256(bundle.variable_map):
        raise EncodingError("map digest mismatch")
    if manifest.get("sources_sha256") != _sha256(bundle.sources):
        raise EncodingError("source digest mismatch")
    unsigned = dict(manifest)
    digest = unsigned.pop("manifest_sha256", None)
    if digest != _sha256(_canonical_json(unsigned)):
        raise EncodingError("manifest self-hash mismatch")

    lines = bundle.cnf.decode("ascii").splitlines()
    if not lines or not lines[0].startswith("p cnf "):
        raise EncodingError("missing DIMACS header")
    header = lines[0].split()
    if len(header) != 4:
        raise EncodingError("malformed DIMACS header")
    variable_count, clause_count = int(header[2]), int(header[3])
    if len(lines) - 1 != clause_count:
        raise EncodingError("DIMACS clause count mismatch")
    parsed: list[list[int]] = []
    for line in lines[1:]:
        values = [int(value) for value in line.split()]
        if not values or values[-1] != 0 or 0 in values[:-1]:
            raise EncodingError("malformed DIMACS clause")
        if any(abs(value) > variable_count for value in values[:-1]):
            raise EncodingError("DIMACS literal out of range")
        parsed.append(values[:-1])
    map_variables = variable_map.get("variables")
    map_clauses = variable_map.get("clauses")
    if type(map_variables) is not list or type(map_clauses) is not list:
        raise EncodingError("map rows must be lists")
    if len(map_variables) != variable_count or len(map_clauses) != clause_count:
        raise EncodingError("map count mismatch")
    if manifest.get("variables") != variable_count or manifest.get("clauses") != clause_count:
        raise EncodingError("manifest count mismatch")
    variable_roles: set[str] = set()
    for index, row in enumerate(map_variables, start=1):
        if type(row) is not dict or row.get("id") != index or type(row.get("role")) is not str:
            raise EncodingError("malformed variable map row")
        if row["role"] in variable_roles:
            raise EncodingError("duplicate variable role in map")
        variable_roles.add(row["role"])
    clause_roles: set[str] = set()
    replay_family_counts: Counter[str] = Counter()
    for index, (row, literals) in enumerate(zip(map_clauses, parsed, strict=True), start=1):
        if (
            type(row) is not dict
            or row.get("id") != index
            or row.get("literals") != literals
            or row.get("family") not in FAMILY_SOURCES
            or type(row.get("role")) is not str
        ):
            raise EncodingError("malformed clause map row")
        if row["role"] in clause_roles:
            raise EncodingError("duplicate clause role in map")
        clause_roles.add(row["role"])
        replay_family_counts[row["family"]] += 1
    if variable_map.get("family_sources") != dict(sorted(FAMILY_SOURCES.items())):
        raise EncodingError("family-to-source map drifted")
    if manifest.get("family_clause_counts") != dict(sorted(replay_family_counts.items())):
        raise EncodingError("family clause counts do not replay")
    n = manifest.get("n")
    if type(n) is not int or n < MIN_CARRIER_CARD:
        raise EncodingError("manifest carrier cardinality is invalid")
    semantic_contract = variable_map.get("semantic_contract")
    if type(semantic_contract) is not dict:
        raise EncodingError("semantic contract is missing")
    if semantic_contract.get("carrier_cardinality") != n:
        raise EncodingError("semantic contract carrier mismatch")
    if semantic_contract.get("omitted_relaxations") != list(OMITTED_RELAXATIONS):
        raise EncodingError("semantic contract omission inventory drifted")
    if replay_family_counts["query_negation"] != n * n * (n - 1):
        raise EncodingError("query family does not cover the full finite carrier")
    return manifest


def _write_exact(path: Path, data: bytes) -> None:
    if path.exists() or path.is_symlink():
        if path.is_symlink() or not path.is_file() or path.read_bytes() != data:
            raise EncodingError(f"refusing to overwrite nonidentical artifact: {path}")
        return
    flags = os.O_WRONLY | os.O_CREAT | os.O_EXCL
    if hasattr(os, "O_NOFOLLOW"):
        flags |= os.O_NOFOLLOW
    descriptor = os.open(path, flags, 0o644)
    try:
        remaining = memoryview(data)
        while remaining:
            written = os.write(descriptor, remaining)
            if written <= 0:
                raise EncodingError(f"short write for artifact: {path}")
            remaining = remaining[written:]
        os.fsync(descriptor)
    finally:
        os.close(descriptor)


def write_bundle(bundle: Bundle, output_dir: Path) -> tuple[Path, ...]:
    """Write canonical artifacts only to an existing, non-symlink directory."""

    if output_dir.is_symlink() or not output_dir.is_dir():
        raise EncodingError("output directory must exist and may not be a symlink")
    artifacts = (
        (output_dir / "firstnonhit-v2.cnf", bundle.cnf),
        (output_dir / "firstnonhit-v2.map.json", bundle.variable_map),
        (output_dir / "firstnonhit-v2.sources.json", bundle.sources),
        (output_dir / "firstnonhit-v2.manifest.json", bundle.manifest),
    )
    for path, data in artifacts:
        _write_exact(path, data)
    return tuple(path for path, _ in artifacts)


def main(argv: Sequence[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--n", type=int, default=MIN_CARRIER_CARD)
    parser.add_argument("--output-dir", type=Path)
    args = parser.parse_args(argv)
    bundle = emit_bundle(args.n)
    manifest = validate_bundle(bundle)
    if args.output_dir is not None:
        write_bundle(bundle, args.output_dir)
    summary = {
        "n": manifest["n"],
        "variables": manifest["variables"],
        "clauses": manifest["clauses"],
        "source_total": False,
        "launch_enabled": False,
        "solver_run": False,
        "cnf_sha256": manifest["cnf_sha256"],
    }
    print(json.dumps(summary, sort_keys=True, separators=(",", ":")))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
