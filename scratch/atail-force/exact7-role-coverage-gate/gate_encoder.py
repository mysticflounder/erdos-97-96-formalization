#!/usr/bin/env python3
"""Generic role-schema QF_LRA encoder for the exact-seven role-coverage gate.

A schema (see DESIGN.md) is a finite relaxation of one class of aligned
exact-seven configurations.  Points are role names.  The circular boundary
order is a concatenation of blocks: "ordered" blocks have fixed internal
order; "bag" blocks have symbolic internal order decided by Z3 integer
positions.  Strict Kalmanson inequalities are asserted conditionally on an
exhaustive enumeration of the possible within-bag orderings of each cyclic
quadruple, so within-arc interleavings never split schemas.

Soundness contract: every asserted constraint must be a proven consequence
of the production packet plus the schema's discrete choices.  Points of one
schema are pairwise distinct (identification patterns are enumerated as
separate schemas), so the unit-slack normalization applies to all pairs.

Schema fields:

- ``id``            schema identifier (string);
- ``points``        canonical point list (fixes label enumeration order);
- ``blocks``        [{"points": [...], "ordered": bool}, ...] — cyclic
                    boundary order, cut at the start of block 0;
- ``floating``      points with no boundary position yet (coarse census
                    levels): they keep lower/triangle/class constraints
                    but appear in no Kalmanson quadruple — a sound
                    relaxation, so coarse UNSAT kills every refinement;
- ``exact_classes`` [{"center", "members", "exclude"}] — complete radius
                    classes: equalities to members[0], exclusions strict;
- ``row_eqs``       [{"name", "center", "members"}] — selected rows
                    (equalities only, no completeness);
- ``rad_ne``        [{"center", "a", "b"}] — d(center,a) != d(center,b);
- ``radius_rel``    [{"rows": [name1, name2], "relation": "eq"|"ne"}] —
                    tie two ``row_eqs`` base radii (same/distinct-radius
                    arms of the L1 split);
- ``k4``            [{"center", "candidates", "escape"}] — existential K4:
                    Or over (4-escape)-subsets of candidates of the radius
                    equalities.  ``escape`` counts anonymous row slots; if
                    4-escape <= 1 the disjunction is trivial and skipped
                    (recorded in meta as toothless, never silently);
- ``unique_class``  [{"center", "members"}] — the center's ONLY >=4-card
                    radius class over the whole carrier is the listed one
                    (unique_K4_radius): every 4-subset of named points not
                    inside ``members`` has some radius disequality;
- ``no_kalmanson`` / ``no_triangle`` / ``no_lower``  opt-outs (relaxation).

Tracked label families: ``pos`` (structural order), ``lower``, ``tri``,
``cls_eq``, ``cls_ne``, ``row_eq``, ``rad_ne``, ``radrel``, ``k4``, ``kal``.
"""

from __future__ import annotations

from collections import Counter
from itertools import combinations, permutations, product

import z3


class GateEncoder:
    def __init__(self, schema: dict):
        self.schema = schema
        self.points: list[str] = list(schema["points"])
        assert len(set(self.points)) == len(self.points)
        self.solver = z3.Solver()
        self.solver.set(timeout=schema.get("timeout_ms", 600_000))
        self.solver.set(unsat_core=True)
        self.solver.set("core.minimize", True)
        self.labels: dict[str, z3.BoolRef] = {}
        self.trivial_k4_centers: list[str] = []
        self.distances = {
            (a, b): z3.Real(f"d_{a}_{b}")
            for a, b in combinations(self.points, 2)
        }
        self._build_positions()
        if not schema.get("no_lower", False):
            self._add_lower()
        if not schema.get("no_triangle", False):
            self._add_triangle()
        self._add_exact_classes()
        self._add_row_eqs()
        self._add_radius_rel()
        self._add_rad_ne()
        self._add_k4()
        self._add_unique_class()
        if not schema.get("no_kalmanson", False):
            self._add_kalmanson()

    def dist(self, a: str, b: str) -> z3.ArithRef:
        if a == b:
            return z3.RealVal(0)
        return self.distances[(a, b) if (a, b) in self.distances else (b, a)]

    def track(self, name: str, constraint: z3.BoolRef) -> None:
        assert name not in self.labels, name
        self.labels[name] = constraint
        self.solver.assert_and_track(constraint, z3.Bool(name))

    # -- boundary order -----------------------------------------------------

    def _build_positions(self) -> None:
        blocks = self.schema["blocks"]
        self.floating: set[str] = set(self.schema.get("floating", []))
        flat = [p for block in blocks for p in block["points"]]
        assert sorted(flat + sorted(self.floating)) == sorted(
            self.points
        ), "blocks plus floating must partition points"
        self.block_index: dict[str, int] = {}
        self.static_pos: dict[str, int] = {}
        self.sym_pos: dict[str, z3.ArithRef] = {}
        self.bag_of: dict[str, int] = {}
        start = 0
        for index, block in enumerate(blocks):
            pts = list(block["points"])
            for p in pts:
                self.block_index[p] = index
            if block.get("ordered", True):
                for offset, p in enumerate(pts):
                    self.static_pos[p] = start + offset
            else:
                for p in pts:
                    var = z3.Int(f"pos_{p}")
                    self.sym_pos[p] = var
                    self.bag_of[p] = index
                    self.track(
                        f"pos|range|{p}",
                        z3.And(var >= start, var < start + len(pts)),
                    )
                for a, b in combinations(pts, 2):
                    self.track(f"pos|ne|{a},{b}", self.sym_pos[a] != self.sym_pos[b])
            start += len(pts)

    # -- base metric families ------------------------------------------------

    def _add_lower(self) -> None:
        for (a, b), value in self.distances.items():
            self.track(f"lower|{a},{b}", value >= 1)

    def _add_triangle(self) -> None:
        for a, b, c in combinations(self.points, 3):
            self.track(
                f"tri|{a},{b},{c}|ab+bc-ac",
                self.dist(a, b) + self.dist(b, c) - self.dist(a, c) >= 1,
            )
            self.track(
                f"tri|{a},{b},{c}|ab+ac-bc",
                self.dist(a, b) + self.dist(a, c) - self.dist(b, c) >= 1,
            )
            self.track(
                f"tri|{a},{b},{c}|ac+bc-ab",
                self.dist(a, c) + self.dist(b, c) - self.dist(a, b) >= 1,
            )

    def _add_exact_classes(self) -> None:
        for cls in self.schema.get("exact_classes", []):
            center = cls["center"]
            members = list(cls["members"])
            assert center not in members
            radius = self.dist(center, members[0])
            for point in members[1:]:
                self.track(f"cls_eq|{center}|{point}", self.dist(center, point) == radius)
            for point in cls.get("exclude", []):
                assert point != center and point not in members
                self.track(f"cls_ne|{center}|{point}", self.dist(center, point) != radius)

    def _add_row_eqs(self) -> None:
        for row in self.schema.get("row_eqs", []):
            center = row["center"]
            members = list(row["members"])
            base = self.dist(center, members[0])
            for point in members[1:]:
                self.track(
                    f"row_eq|{row['name']}|{point}",
                    self.dist(center, point) == base,
                )

    def _add_radius_rel(self) -> None:
        rows = {row["name"]: row for row in self.schema.get("row_eqs", [])}
        for spec in self.schema.get("radius_rel", []):
            name1, name2 = spec["rows"]
            relation = spec["relation"]
            assert relation in ("eq", "ne")
            base1 = self.dist(rows[name1]["center"], rows[name1]["members"][0])
            base2 = self.dist(rows[name2]["center"], rows[name2]["members"][0])
            self.track(
                f"radrel|{name1},{name2}|{relation}",
                base1 == base2 if relation == "eq" else base1 != base2,
            )

    def _add_rad_ne(self) -> None:
        for spec in self.schema.get("rad_ne", []):
            center, a, b = spec["center"], spec["a"], spec["b"]
            self.track(
                f"rad_ne|{center}|{a},{b}",
                self.dist(center, a) != self.dist(center, b),
            )

    def _add_k4(self) -> None:
        for spec in self.schema.get("k4", []):
            center = spec["center"]
            candidates = list(spec["candidates"])
            escape = spec.get("escape", 0)
            need = 4 - escape
            if need <= 1:
                self.trivial_k4_centers.append(center)
                continue
            witnesses = []
            for support in combinations(candidates, need):
                radius = self.dist(center, support[0])
                witnesses.append(
                    z3.And(*[self.dist(center, point) == radius for point in support[1:]])
                )
            self.track(f"k4|{center}", z3.Or(*witnesses))

    def _add_unique_class(self) -> None:
        for spec in self.schema.get("unique_class", []):
            center = spec["center"]
            members = set(spec["members"])
            others = [p for p in self.points if p != center]
            for quad in combinations(others, 4):
                if set(quad) <= members:
                    continue
                base = self.dist(center, quad[0])
                self.track(
                    f"uniq4|{center}|{','.join(quad)}",
                    z3.Or(*[self.dist(center, p) != base for p in quad[1:]]),
                )

    # -- conditional Kalmanson -----------------------------------------------

    def _add_kalmanson(self) -> None:
        placed = [p for p in self.points if p not in self.floating]
        for quad in combinations(placed, 4):
            self._add_kal_quad(quad)

    def _add_kal_quad(self, quad: tuple[str, ...]) -> None:
        bag_groups: dict[int, list[str]] = {}
        for p in quad:
            if p in self.sym_pos:
                bag_groups.setdefault(self.bag_of[p], []).append(p)
        multi = [group for group in bag_groups.values() if len(group) >= 2]
        branch_iters = [list(permutations(group)) for group in multi]
        for branch_id, branch in enumerate(product(*branch_iters)):
            rank: dict[str, int] = {}
            conds: list[z3.BoolRef] = []
            for perm in branch:
                for r, p in enumerate(perm):
                    rank[p] = r
                for u, v in zip(perm, perm[1:]):
                    conds.append(self.sym_pos[u] < self.sym_pos[v])

            def key(p: str) -> tuple[int, int]:
                if p in self.static_pos:
                    return (self.block_index[p], self.static_pos[p])
                return (self.block_index[p], rank.get(p, 0))

            a, b, c, d = sorted(quad, key=key)
            diagonal = self.dist(a, c) + self.dist(b, d)
            k1 = diagonal - self.dist(a, b) - self.dist(c, d) >= 1
            k2 = diagonal - self.dist(a, d) - self.dist(b, c) >= 1
            suffix = f"|br{branch_id}" if conds else ""
            if conds:
                condition = z3.And(*conds)
                k1 = z3.Implies(condition, k1)
                k2 = z3.Implies(condition, k2)
            self.track(f"kal|{a},{b},{c},{d}|ac+bd-ab-cd{suffix}", k1)
            self.track(f"kal|{a},{b},{c},{d}|ac+bd-ad-bc{suffix}", k2)

    # -- verdict ---------------------------------------------------------------

    def check(self) -> dict:
        result = self.solver.check()
        verdict = {
            "schema_id": self.schema.get("id"),
            "verdict": str(result),
            "points": len(self.points),
            "assertions": len(self.labels),
            "trivial_k4_centers": self.trivial_k4_centers,
        }
        if result == z3.unsat:
            core = sorted(str(marker) for marker in self.solver.unsat_core())
            verdict["core"] = core
            verdict["core_size"] = len(core)
            verdict["families"] = dict(
                sorted(Counter(name.split("|", 1)[0] for name in core).items())
            )
        return verdict


def check_schema(schema: dict) -> dict:
    return GateEncoder(schema).check()
