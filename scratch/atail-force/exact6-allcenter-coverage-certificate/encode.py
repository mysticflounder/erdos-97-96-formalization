#!/usr/bin/env python3
"""Deterministic CNF encoder for the corrected exact-six all-center outer gate.

This is an independent, propositional restatement of the structural layer in
``exact6-allcenter-capaware-gate/allcenter_gate.py``.  It deliberately stops
before the abstract-distance, exact-radius, Euclidean, MEC, and minimality
oracles.  The 20 transported 2-Kalmanson/3-equality schemas are asserted as
proof-facing row-membership nogoods.

The ``smoke`` profile is a five-vertex row-table sanity check.  It is not a
geometric case and cannot close the live theorem.
"""

from __future__ import annotations

import argparse
import hashlib
import itertools
import json
from collections import Counter
from pathlib import Path
from typing import Iterable, Sequence


N = 14
VERTICES = tuple(range(N))
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
REPO = HERE.parents[2]
BANK = (
    HERE.parent
    / "generic-biapex-kalmanson-search"
    / "round2-core-normal-forms"
    / "transported_2k3_bank.json"
)
DEFAULT_LEARNED_BANK = (
    HERE.parent
    / "exact6-allcenter-capaware-gate"
    / "combined_round1_round2_minimized_schema_bank.json"
)


def file_sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def clause_bytes(clause: Sequence[int]) -> bytes:
    return (" ".join(map(str, clause)) + " 0\n").encode("ascii")


class Variables:
    """Stable 1-based variable allocator with a JSON-facing name map."""

    def __init__(self) -> None:
        self.count = 0
        self.by_name: dict[str, int] = {}

    def fresh(self, name: str) -> int:
        if name in self.by_name:
            raise ValueError(f"duplicate variable name: {name}")
        self.count += 1
        self.by_name[name] = self.count
        return self.count


class Cnf:
    """Clause ledger retaining deterministic category spans and hashes."""

    def __init__(self, variables: Variables) -> None:
        self.variables = variables
        self.clauses: list[tuple[int, ...]] = []
        self.kinds: list[str] = []

    def add(self, kind: str, literals: Iterable[int]) -> None:
        clause: list[int] = []
        seen: set[int] = set()
        for literal in literals:
            if literal == 0:
                raise ValueError("zero is not a literal")
            if -literal in seen:
                raise ValueError(f"tautological clause in {kind}")
            if literal not in seen:
                clause.append(literal)
                seen.add(literal)
        if not clause:
            raise ValueError(f"empty clause in {kind}")
        self.clauses.append(tuple(clause))
        self.kinds.append(kind)

    def at_most(self, kind: str, variables: Sequence[int], bound: int) -> None:
        if bound < 0:
            raise ValueError(bound)
        for subset in itertools.combinations(variables, bound + 1):
            self.add(kind, (-variable for variable in subset))

    def at_least(self, kind: str, variables: Sequence[int], bound: int) -> None:
        if not 0 <= bound <= len(variables):
            raise ValueError((bound, len(variables)))
        for subset in itertools.combinations(variables, len(variables) - bound + 1):
            self.add(kind, subset)

    def exactly(self, kind: str, variables: Sequence[int], cardinality: int) -> None:
        self.at_least(kind, variables, cardinality)
        self.at_most(kind, variables, cardinality)

    def one_hot(self, kind: str, variables: Sequence[int]) -> None:
        self.add(kind, variables)
        self.at_most(kind, variables, 1)

    def category_ledger(self) -> list[dict[str, object]]:
        ledger: list[dict[str, object]] = []
        start = 0
        while start < len(self.clauses):
            kind = self.kinds[start]
            end = start + 1
            digest = hashlib.sha256()
            digest.update(clause_bytes(self.clauses[start]))
            while end < len(self.clauses) and self.kinds[end] == kind:
                digest.update(clause_bytes(self.clauses[end]))
                end += 1
            ledger.append({
                "kind": kind,
                "first_clause": start + 1,
                "last_clause": end,
                "count": end - start,
                "sha256": digest.hexdigest(),
            })
            start = end
        return ledger


def reflected_schema(
    vertex_count: int, schema: tuple[tuple[int, int], ...]
) -> tuple[tuple[int, int], ...]:
    return tuple(sorted(
        (vertex_count - 1 - center, vertex_count - 1 - point)
        for center, point in schema
    ))


def load_schema_bank() -> tuple[dict[str, object], list[tuple[int, tuple[tuple[int, int], ...]]]]:
    payload = json.loads(BANK.read_text(encoding="utf-8"))
    if payload.get("schema") != "p97-whole-carrier-kalmanson-transported-schema-bank-v1":
        raise ValueError("unexpected transported bank schema")
    schemas: list[tuple[int, tuple[tuple[int, int], ...]]] = []
    for record in payload["schemas"]:
        vertex_count = int(record["core_vertex_count"])
        schema = tuple(sorted(tuple(pair) for pair in record["order_schema"]))
        if len(schema) != 6:
            raise ValueError("transported schema is not a 2K+3eq six-membership schema")
        if any(not (0 <= center < vertex_count and 0 <= point < vertex_count)
               for center, point in schema):
            raise ValueError("transported schema role outside its carrier")
        schemas.append((vertex_count, schema))
    if payload.get("schema_count") != len(schemas) or len(schemas) != 20:
        raise ValueError("transported schema count drift")
    return payload, schemas


def load_learned_schema_bank(
    path: Path, max_vertices: int,
) -> tuple[dict[str, object], list[tuple[int, tuple[tuple[int, int], ...]]]]:
    payload = json.loads(path.read_text(encoding="utf-8"))
    if payload.get("schema") != "p97-exact6-allcenter-minimized-metric-schema-bank-v1":
        raise ValueError("unexpected learned metric schema bank")
    schemas: list[tuple[int, tuple[tuple[int, int], ...]]] = []
    for record in payload["schemas"]:
        vertex_count = int(record["core_vertex_count"])
        if vertex_count > max_vertices:
            continue
        schema = tuple(sorted(tuple(pair) for pair in record["order_schema"]))
        if not schema:
            raise ValueError("empty learned membership schema")
        if any(not (0 <= center < vertex_count and 0 <= point < vertex_count)
               for center, point in schema):
            raise ValueError("learned schema role outside its carrier")
        if len(set(schema)) != len(schema):
            raise ValueError("duplicate learned schema membership")
        schemas.append((vertex_count, schema))
    if len(schemas) != int(payload.get("compact_schema_count_k_le_8", -1)):
        raise ValueError("learned compact schema count drift")
    return payload, schemas


def transported_applications(
    n: int,
    schemas: Sequence[tuple[int, tuple[tuple[int, int], ...]]],
) -> list[tuple[tuple[int, int], ...]]:
    unique: set[tuple[tuple[int, int], ...]] = set()
    for vertex_count, schema in schemas:
        if vertex_count > n:
            continue
        for embedding in itertools.combinations(range(n), vertex_count):
            for oriented in (schema, reflected_schema(vertex_count, schema)):
                required = tuple(sorted(
                    (embedding[center], embedding[point])
                    for center, point in oriented
                ))
                if len(set(required)) != len(schema):
                    raise ValueError("transported schema membership collision")
                unique.add(required)
    return sorted(unique)


class ExactSixOuterEncoder:
    def __init__(self, orbit: str) -> None:
        if orbit not in ORBITS:
            raise ValueError(orbit)
        self.orbit = orbit
        self.v = Variables()
        self.cnf = Cnf(self.v)
        self.member = {
            (center, point): self.v.fresh(f"member_{center}_{point}")
            for center in VERTICES for point in VERTICES
        }
        self.shell = {point: self.v.fresh(f"shell_{point}") for point in VERTICES}
        self.roles = {
            role: {point: self.v.fresh(f"role_{role}_{point}") for point in VERTICES}
            for role in ("first", "second", "source", "target", "unused")
        }
        self.blocker = {
            (source, center): self.v.fresh(f"blocker_{source}_{center}")
            for source in VERTICES for center in VERTICES
        }

    def m(self, center: int, point: int) -> int:
        return self.member[center, point]

    def r(self, role: str, point: int) -> int:
        return self.roles[role][point]

    def b(self, source: int, center: int) -> int:
        return self.blocker[source, center]

    def build(
        self,
        learned_bank: Path | None = None,
        learned_max_vertices: int = 8,
    ) -> tuple[Cnf, dict[str, object]]:
        self.add_row_cardinality()
        self.add_finite_incidence_bounds()
        self.add_perpendicular_bisector_order()
        self.add_cap_bounds()
        self.add_exact_five_shell()
        self.add_exact_shell_selected_row_alternation()
        self.add_named_roles()
        self.add_blocker_map()
        self.add_named_critical_rows()
        self.add_strong_connectivity()
        bank, schemas = load_schema_bank()
        applications = transported_applications(N, schemas)
        for required in applications:
            self.cnf.add(
                "transported_2k3_schema_cuts",
                (-self.m(center, point) for center, point in required),
            )
        metadata = {
            "bank_schema": bank["schema"],
            "bank_sha256": file_sha256(BANK),
            "bank_schema_count": len(schemas),
            "transported_application_count": len(applications),
        }
        if learned_bank is not None:
            learned_payload, learned_schemas = load_learned_schema_bank(
                learned_bank, learned_max_vertices
            )
            learned_applications = transported_applications(N, learned_schemas)
            learned_only = sorted(set(learned_applications) - set(applications))
            for required in learned_only:
                self.cnf.add(
                    "learned_weighted_kalmanson_schema_cuts",
                    (-self.m(center, point) for center, point in required),
                )
            metadata["learned_schema_bank"] = {
                "schema": learned_payload["schema"],
                "sha256": file_sha256(learned_bank),
                "max_vertices": learned_max_vertices,
                "schema_count": len(learned_schemas),
                "complete_application_count": len(learned_applications),
                "new_application_count": len(learned_only),
            }
        return self.cnf, metadata

    def add_row_cardinality(self) -> None:
        for center in VERTICES:
            self.cnf.add("row_cardinality", (-self.m(center, center),))
            choices = [self.m(center, point) for point in VERTICES if point != center]
            self.cnf.exactly("row_cardinality", choices, 4)

    def add_finite_incidence_bounds(self) -> None:
        for left, right in itertools.combinations(VERTICES, 2):
            for points in itertools.combinations(VERTICES, 3):
                self.cnf.add("center_pair_intersection_le_two", (
                    literal
                    for point in points
                    for literal in (-self.m(left, point), -self.m(right, point))
                ))
        for first, second in itertools.combinations(VERTICES, 2):
            for centers in itertools.combinations(VERTICES, 3):
                self.cnf.add("target_pair_center_multiplicity_le_two", (
                    literal
                    for center in centers
                    for literal in (-self.m(center, first), -self.m(center, second))
                ))

    def add_perpendicular_bisector_order(self) -> None:
        for center_left, center_right in itertools.combinations(VERTICES, 2):
            remaining = [
                point for point in VERTICES
                if point not in {center_left, center_right}
            ]
            for point_left, point_right in itertools.combinations(remaining, 2):
                left_inside = center_left < point_left < center_right
                right_inside = center_left < point_right < center_right
                if left_inside == right_inside:
                    self.cnf.add("perpendicular_bisector_alternation", (
                        -self.m(center_left, point_left),
                        -self.m(center_left, point_right),
                        -self.m(center_right, point_left),
                        -self.m(center_right, point_right),
                    ))

    def add_cap_bounds(self) -> None:
        for cap, endpoints in zip(CAPS, CAP_ENDPOINTS, strict=True):
            cap_points = sorted(cap)
            for center in cap_points:
                self.cnf.at_most(
                    "cap_local_row_hit_bounds",
                    [self.m(center, point) for point in cap_points],
                    2,
                )
            for center in endpoints:
                self.cnf.at_most(
                    "cap_endpoint_row_hit_bounds",
                    [self.m(center, point) for point in cap_points],
                    1,
                )
            outside = sorted(set(VERTICES) - cap)
            for center_left, center_right in itertools.combinations(cap_points, 2):
                for point_left, point_right in itertools.combinations(outside, 2):
                    self.cnf.add("cross_cap_equal_pair_injectivity", (
                        -self.m(center_left, point_left),
                        -self.m(center_left, point_right),
                        -self.m(center_right, point_left),
                        -self.m(center_right, point_right),
                    ))

    def add_exact_five_shell(self) -> None:
        self.cnf.add("exact_five_shell", (-self.shell[SECOND_APEX],))
        shell_choices = [self.shell[point] for point in VERTICES if point != SECOND_APEX]
        self.cnf.exactly("exact_five_shell", shell_choices, 5)

        physical = [self.shell[point] for point in sorted(PHYSICAL_INTERIOR)]
        if self.orbit == "fourDistinct":
            for variable in physical:
                self.cnf.add("physical_shell_distribution", (variable,))
        else:
            self.cnf.at_least("physical_shell_distribution", physical, 3)

        surplus = [self.shell[point] for point in sorted(SURPLUS_CAP)]
        opposite = [self.shell[point] for point in sorted(OPP_CAP1)]
        self.cnf.at_most("adjacent_cap_shell_hit_bounds", surplus, 1)
        self.cnf.at_most("adjacent_cap_shell_hit_bounds", opposite, 1)
        for physical_variable in physical:
            self.cnf.add(
                "card_three_adjacent_cap_distribution",
                (physical_variable, *surplus),
            )
            self.cnf.add(
                "card_three_adjacent_cap_distribution",
                (physical_variable, *opposite),
            )
        for point in VERTICES:
            self.cnf.add(
                "physical_apex_selected_row_in_shell",
                (-self.m(SECOND_APEX, point), self.shell[point]),
            )

    def add_exact_shell_selected_row_alternation(self) -> None:
        """Forbid a nonalternating common pair at one row and the apex shell.

        If ``x`` and ``y`` belong to the complete exact-five shell centered at
        ``SECOND_APEX``, and a selected row centered at ``center`` also
        contains ``x`` and ``y``, then both centers lie on the perpendicular
        bisector of ``x y``.  Strict convex boundary order forces the two
        centers to alternate with ``x,y``.  Equivalently, after cutting the
        cyclic order at the distinguished physical apex, the centers cannot
        lie in the same component of the boundary with ``x,y`` removed.

        The selected-row/selected-row version is already imposed by
        ``add_perpendicular_bisector_order``.  This separate family is needed
        because the physical apex's selected four-subset may omit a point of
        its complete exact-five shell.
        """
        apex = SECOND_APEX
        for center in VERTICES:
            if center == apex:
                continue
            for point_left, point_right in itertools.combinations(VERTICES, 2):
                if point_left in {center, apex} or point_right in {center, apex}:
                    continue
                center_inside = point_left < center < point_right
                apex_inside = point_left < apex < point_right
                if center_inside == apex_inside:
                    self.cnf.add("exact_shell_selected_row_alternation", (
                        -self.shell[point_left],
                        -self.shell[point_right],
                        -self.m(center, point_left),
                        -self.m(center, point_right),
                    ))

    def restrict_physical_role(self, role: str) -> None:
        variables = [self.r(role, point) for point in VERTICES]
        self.cnf.one_hot("named_physical_roles", variables)
        for point in VERTICES:
            if point not in PHYSICAL_INTERIOR:
                self.cnf.add("named_physical_roles", (-self.r(role, point),))
            else:
                self.cnf.add(
                    "named_physical_roles",
                    (-self.r(role, point), self.shell[point]),
                )

    def role_equal(self, left: str, right: str) -> None:
        for point in VERTICES:
            self.cnf.add("role_orbit", (-self.r(left, point), self.r(right, point)))
            self.cnf.add("role_orbit", (-self.r(right, point), self.r(left, point)))

    def role_ne(self, left: str, right: str) -> None:
        for point in VERTICES:
            self.cnf.add("role_orbit", (-self.r(left, point), -self.r(right, point)))

    def add_named_roles(self) -> None:
        for role in ("first", "second", "source", "target"):
            self.restrict_physical_role(role)
        self.role_ne("first", "second")
        self.role_ne("source", "target")
        if self.orbit == "continuationOrder":
            self.role_equal("source", "first")
            self.role_equal("target", "second")
        elif self.orbit == "reverseContinuationOrder":
            self.role_equal("source", "second")
            self.role_equal("target", "first")
        elif self.orbit == "sharesFirstAtSource":
            self.role_equal("source", "first")
            self.role_ne("target", "second")
        elif self.orbit == "sharesFirstAtTarget":
            self.role_equal("target", "first")
            self.role_ne("source", "second")
        elif self.orbit == "sharesSecondAtSource":
            self.role_equal("source", "second")
            self.role_ne("target", "first")
            self.role_ne("target", "second")
        elif self.orbit == "sharesSecondAtTarget":
            self.role_equal("target", "second")
            self.role_ne("source", "first")
            self.role_ne("source", "second")
        else:
            names = ("first", "second", "source", "target")
            for left, right in itertools.combinations(names, 2):
                self.role_ne(left, right)

        # Source-audit correction: the continuation-unused source is a point
        # of the closed exact-six physical cap, not an arbitrary carrier point.
        unused = [self.r("unused", point) for point in VERTICES]
        self.cnf.one_hot("unused_in_closed_physical_cap", unused)
        for point in VERTICES:
            if point not in PHYSICAL_CAP:
                self.cnf.add(
                    "unused_in_closed_physical_cap",
                    (-self.r("unused", point),),
                )
            self.cnf.add(
                "unused_in_closed_physical_cap",
                (-self.r("unused", point), -self.shell[point]),
            )

    def add_blocker_map(self) -> None:
        for source in VERTICES:
            variables = [self.b(source, center) for center in VERTICES]
            self.cnf.one_hot("all_source_critical_blocker_map", variables)
            for center in VERTICES:
                if center in {source, FIRST_APEX, SECOND_APEX}:
                    self.cnf.add(
                        "all_source_critical_blocker_map",
                        (-self.b(source, center),),
                    )
                self.cnf.add(
                    "all_source_critical_blocker_map",
                    (-self.b(source, center), self.m(center, source)),
                )

    def add_named_critical_rows(self) -> None:
        # The unused blocker omits both continuation roles.
        for unused in sorted(PHYSICAL_CAP):
            for center in VERTICES:
                for point in sorted(PHYSICAL_INTERIOR):
                    self.cnf.add("unused_critical_row_omissions", (
                        -self.r("unused", unused),
                        -self.b(unused, center),
                        -self.r("first", point),
                        -self.m(center, point),
                    ))
                    self.cnf.add("unused_critical_row_omissions", (
                        -self.r("unused", unused),
                        -self.b(unused, center),
                        -self.r("second", point),
                        -self.m(center, point),
                    ))

        # At most one hit in the actual physical exact-five strict-cap set.
        for unused in sorted(PHYSICAL_CAP):
            for center in VERTICES:
                for left, right in itertools.combinations(sorted(PHYSICAL_INTERIOR), 2):
                    self.cnf.add("unused_critical_row_physical_hit_le_one", (
                        -self.r("unused", unused),
                        -self.b(unused, center),
                        -self.shell[left],
                        -self.m(center, left),
                        -self.shell[right],
                        -self.m(center, right),
                    ))

        for source in sorted(PHYSICAL_INTERIOR):
            for target in sorted(PHYSICAL_INTERIOR):
                if source == target:
                    continue
                for center in VERTICES:
                    self.cnf.add("mutual_critical_row_omissions", (
                        -self.r("source", source),
                        -self.r("target", target),
                        -self.b(source, center),
                        -self.m(center, target),
                    ))
                    self.cnf.add("mutual_critical_row_omissions", (
                        -self.r("source", source),
                        -self.r("target", target),
                        -self.b(target, center),
                        -self.m(center, source),
                    ))
                    self.cnf.add("mutual_blockers_distinct", (
                        -self.r("source", source),
                        -self.r("target", target),
                        -self.b(source, center),
                        -self.b(target, center),
                    ))

        # Every physical exact-five source's critical row has at most two hits
        # in the complete strict physical part of that shell.
        physical = sorted(PHYSICAL_INTERIOR)
        for source in physical:
            for center in VERTICES:
                for points in itertools.combinations(physical, 3):
                    literals = [-self.shell[source], -self.b(source, center)]
                    for point in points:
                        literals.extend((-self.shell[point], -self.m(center, point)))
                    self.cnf.add("physical_source_critical_row_hit_le_two", literals)

    def add_strong_connectivity(self) -> None:
        # A finite digraph is strongly connected iff every nonempty proper
        # vertex set has an edge leaving it.
        for cardinality in range(1, N):
            for subset_tuple in itertools.combinations(VERTICES, cardinality):
                subset = set(subset_tuple)
                self.cnf.add("selected_row_strong_connectivity", (
                    self.m(center, point)
                    for center in subset_tuple
                    for point in VERTICES
                    if point not in subset
                ))


def smoke_encoder() -> tuple[Cnf, dict[str, object], dict[str, object]]:
    n = 5
    vertices = tuple(range(n))
    variables = Variables()
    member = {
        (center, point): variables.fresh(f"member_{center}_{point}")
        for center in vertices for point in vertices
    }
    cnf = Cnf(variables)
    for center in vertices:
        cnf.add("smoke_row_cardinality", (-member[center, center],))
        choices = [member[center, point] for point in vertices if point != center]
        cnf.exactly("smoke_row_cardinality", choices, 4)
    bank, schemas = load_schema_bank()
    applications = transported_applications(n, schemas)
    for required in applications:
        cnf.add(
            "transported_2k3_schema_cuts",
            (-member[center, point] for center, point in required),
        )
    metadata = {
        "bank_schema": bank["schema"],
        "bank_sha256": file_sha256(BANK),
        "bank_schema_count": len(schemas),
        "transported_application_count": len(applications),
    }
    extra = {"n": n, "profile": "smoke", "orbit": None}
    return cnf, metadata, extra


def render_dimacs(cnf: Cnf, comments: Sequence[str]) -> bytes:
    lines = [*(f"c {comment}\n".encode("ascii") for comment in comments)]
    lines.append(f"p cnf {cnf.variables.count} {len(cnf.clauses)}\n".encode("ascii"))
    lines.extend(clause_bytes(clause) for clause in cnf.clauses)
    return b"".join(lines)


def build_payload(
    profile: str,
    orbit: str | None,
    learned_bank: Path | None = None,
    learned_max_vertices: int = 8,
) -> tuple[bytes, dict[str, object]]:
    if profile == "smoke":
        cnf, bank_metadata, extra = smoke_encoder()
    else:
        if orbit is None:
            raise ValueError("n14 profile requires an orbit")
        encoder = ExactSixOuterEncoder(orbit)
        cnf, bank_metadata = encoder.build(learned_bank, learned_max_vertices)
        extra = {"n": N, "profile": "n14", "orbit": orbit}
    comments = [
        "schema p97-exact6-allcenter-coverage-cnf-v1",
        f"profile {extra['profile']}",
        f"orbit {extra['orbit']}",
        f"bank_sha256 {bank_metadata['bank_sha256']}",
    ]
    if profile == "n14":
        comments.append("source_audit_correction unused_in_closed_physical_cap 0,1,2,3,4,5")
        learned = bank_metadata.get("learned_schema_bank")
        if learned is not None:
            comments.append(f"learned_bank_sha256 {learned['sha256']}")
    dimacs = render_dimacs(cnf, comments)
    category_counts = Counter(cnf.kinds)
    manifest: dict[str, object] = {
        "schema": "p97-exact6-allcenter-coverage-manifest-v1",
        "epistemic_status": "FINITE_STRUCTURAL_ENCODING_NOT_LIVE_LEAN_CLOSURE",
        **extra,
        "num_variables": cnf.variables.count,
        "num_clauses": len(cnf.clauses),
        "cnf_sha256": hashlib.sha256(dimacs).hexdigest(),
        "variables": cnf.variables.by_name,
        "category_counts": dict(sorted(category_counts.items())),
        "category_ledger": cnf.category_ledger(),
        "transported_schema_bank": bank_metadata,
        "source_audit_correction": (
            {
                "unused_domain": sorted(PHYSICAL_CAP),
                "statement": "continuation unused source lies in the closed physical cap",
            }
            if profile == "n14" else None
        ),
        "retained": (
            [
                "one selected four-member row at every carrier center",
                "two finite pair-incidence bounds",
                "perpendicular-bisector alternation",
                "exact contiguous (5,6,6) cap blocks and cap-local hit bounds",
                "exact-five physical-apex shell and corrected exact-six distribution",
                "named exact-six mutual orbit",
                "one blocker and source-containing blocker row at every source",
                "both physical apices omitted from the blocker image",
                "named unused/source/target row omissions",
                "selected-row strong connectivity",
                "all 20 transported 2K+3eq schema embeddings",
                *(
                    ["all selected compact learned weighted-Kalmanson schema embeddings"]
                    if "learned_schema_bank" in bank_metadata else []
                ),
            ]
            if profile == "n14" else [
                "five forced complete four-member rows",
                "all transported 2K+3eq schema embeddings on five vertices",
            ]
        ),
        "omitted": (
            [
                "complete deleted-source no_qfree radius semantics",
                "strict triangle and Kalmanson distance variables beyond schema theorems",
                "Euclidean rank-two realization",
                "minimum-enclosing-circle and nonobtuse support geometry",
                "noM44 alternate-support quantification",
                "minimality beyond selected-row strong connectivity",
                "first-apex robustness and retained double-deletion rows",
            ]
            if profile == "n14" else ["the live exact-six geometry"]
        ),
    }
    return dimacs, manifest


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--profile", choices=("smoke", "n14"), required=True)
    parser.add_argument("--orbit", choices=ORBITS)
    parser.add_argument("--cnf", type=Path, required=True)
    parser.add_argument("--manifest", type=Path, required=True)
    parser.add_argument("--learned-bank", type=Path)
    parser.add_argument("--learned-max-vertices", type=int, default=8)
    args = parser.parse_args()
    if args.profile == "smoke" and args.orbit is not None:
        parser.error("smoke profile has no orbit")
    if args.profile == "n14" and args.orbit is None:
        parser.error("n14 profile requires --orbit")
    if args.profile == "smoke" and args.learned_bank is not None:
        parser.error("smoke profile does not accept --learned-bank")
    dimacs, manifest = build_payload(
        args.profile, args.orbit, args.learned_bank, args.learned_max_vertices
    )
    args.cnf.parent.mkdir(parents=True, exist_ok=True)
    args.manifest.parent.mkdir(parents=True, exist_ok=True)
    args.cnf.write_bytes(dimacs)
    args.manifest.write_text(json.dumps(manifest, indent=2, sort_keys=True) + "\n")
    print(json.dumps({
        "status": "ENCODED",
        "profile": args.profile,
        "orbit": args.orbit,
        "variables": manifest["num_variables"],
        "clauses": manifest["num_clauses"],
        "cnf_sha256": manifest["cnf_sha256"],
    }, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
