"""Named-local CNF projection for the Session-3 D3/D4 package.

This encoder is deliberately *not* a finite carrier encoding.  Its point
names denote witnesses supplied by the live residuals (or fresh smoke
probes), and no clause says that those names exhaust ``D.A``.  In particular,
``card_ge(10)`` is a lower-bound atom, not a choice of a universe ``Fin 10``.

Every emitted clause has one of the tags documented in
``../D-E-ENCODING-SPEC.md``:

* HYP: a field of the live D3/D4 residual;
* BANKED: a proved theorem in ``lean/scratch/d-package-bank``;
* GEOM: a general circle-intersection/perpendicular-bisector bound;
* DERIVED: propositional projection of an elementary monotonicity fact;
* DEF: a Tseitin definition;
* COUNT: order axioms for symbolic cardinality lower bounds.

Minimality and no-M44 never occur in this file.
"""

from __future__ import annotations

import sys
from collections import Counter
from dataclasses import dataclass
from itertools import combinations
from pathlib import Path
from typing import Collection, Iterable, Sequence

_REPO_ROOT = Path(__file__).resolve().parents[3]
if str(_REPO_ROOT) not in sys.path:
    sys.path.insert(0, str(_REPO_ROOT))

from census.card_head.sat_encoding import (  # noqa: E402
    CNF,
    CadicalResult,
    EncodingError,
    solve_cadical,
)

__all__ = [
    "CNF",
    "CadicalResult",
    "EncodingError",
    "solve_cadical",
    "TaggedClause",
    "DEEncoder",
    "RunInstance",
]


@dataclass(frozen=True)
class TaggedClause:
    tag: str
    rule: str
    literals: tuple[int, ...]


class DEEncoder:
    """Build the shared E projection and the D3/D4 branch deltas."""

    RUNS = ("base-E", "D3-left", "D3-right", "D4")
    CLASS_POINTS = ("q", "w", "u1", "u2", "u3")
    ROW_POINTS = ("q", "w", "u1", "u2", "u3", "s1", "s2")
    ROW_CENTERS = ("a1", "a2", "bq", "bw", "b")
    SURV_CENTERS = ("a1", "a2", "bq", "bw", "b")
    BIS_CENTERS = ("a1", "a2", "b", "c3")
    DISTINCT_CENTERS = ("a1", "a2", "bq", "bw", "b", "c3")

    def __init__(self) -> None:
        self.cnf = CNF()
        self.names: dict[str, int] = {}
        self.by_var: dict[int, str] = {}
        self.tagged: list[TaggedClause] = []

        self.class_mem: dict[str, int] = {}
        self.class_ge: dict[int, int] = {}
        self.card_ge: dict[int, int] = {}
        self.k1: dict[tuple[str, str], int] = {}
        self.k2: dict[str, int] = {}
        self.row: dict[tuple[str, str], int] = {}
        self.hit: dict[tuple[str, str, str], int] = {}
        self.distinct: dict[frozenset[str], int] = {}
        self.bis: dict[str, int] = {}
        self.in_cap1: dict[str, int] = {}
        self.in_surplus: dict[str, int] = {}

        self._allocate()
        self._build_common()
        self.base_count = len(self.tagged)

    # -- allocation and tagged emission ---------------------------------

    def _new(self, name: str) -> int:
        if name in self.names:
            raise EncodingError(f"duplicate atom name: {name}")
        var = self.cnf.new_variable()
        self.names[name] = var
        self.by_var[var] = name
        return var

    def _emit(self, tag: str, rule: str, *literals: int) -> TaggedClause:
        clause = TaggedClause(tag, rule, tuple(literals))
        self.cnf.add_clause(clause.literals)
        self.tagged.append(clause)
        return clause

    def _allocate(self) -> None:
        for p in self.CLASS_POINTS:
            self.class_mem[p] = self._new(f"inExactFive({p})")
        for k in range(1, 7):
            self.class_ge[k] = self._new(f"exactFiveCard_ge({k})")
        for k in range(1, 17):
            self.card_ge[k] = self._new(f"carrierCard_ge({k})")
        for deleted in ("q", "w"):
            for center in self.SURV_CENTERS:
                self.k1[(deleted, center)] = self._new(f"K1(del={deleted},center={center})")
        for center in self.SURV_CENTERS:
            self.k2[center] = self._new(f"K2(del=q,w,center={center})")
        for center in self.ROW_CENTERS:
            for point in self.ROW_POINTS:
                self.row[(center, point)] = self._new(f"row({center},{point})")
        for first, second in combinations(self.ROW_CENTERS, 2):
            for point in self.ROW_POINTS:
                self.hit[(first, second, point)] = self._new(
                    f"rowHit({first},{second},{point})"
                )
        for first, second in combinations(self.DISTINCT_CENTERS, 2):
            self.distinct[frozenset((first, second))] = self._new(
                f"distinct({first},{second})"
            )
        for center in self.BIS_CENTERS:
            self.bis[center] = self._new(f"bis(q,w;{center})")
        for center in ("a1", "a2", "b"):
            self.in_cap1[center] = self._new(f"inFirstCapInterior({center})")
            self.in_surplus[center] = self._new(f"inSurplus({center})")

    # -- common E projection --------------------------------------------

    def _build_common(self) -> None:
        # [COUNT] These are symbolic lower-bound chains, never finite domains.
        for k in range(1, 16):
            self._emit("COUNT", "carrier.lower.monotone", -self.card_ge[k + 1], self.card_ge[k])
        self._emit("HYP", "E.carrier_card_gt_nine", self.card_ge[10])
        for k in range(1, 6):
            self._emit("COUNT", "exactFive.lower.monotone", -self.class_ge[k + 1], self.class_ge[k])
        self._emit("HYP", "E.class_card_eq_five.lower", self.class_ge[5])
        self._emit("HYP", "E.class_card_eq_five.upper", -self.class_ge[6])
        for point in self.CLASS_POINTS:
            self._emit("HYP", "E.exactFive.named_witness", self.class_mem[point])

        # Full deletion robustness at a1, obstruction after deleting q,w,
        # and the interior packet's double-deletion survivor a2.
        self._emit("HYP", "E.firstApex_fullyDeletionRobust.q", self.k1[("q", "a1")])
        self._emit("HYP", "E.firstApex_fullyDeletionRobust.w", self.k1[("w", "a1")])
        self._emit("HYP", "E.interiorPair_doubleDeletion_obstructs", -self.k2["a1"])
        self._emit("HYP", "E.interior.secondApex_double_survival", self.k2["a2"])

        # A double-deletion survivor is also a survivor after either one of
        # the two deletions.  This is a monotonicity projection, not a new
        # geometric hypothesis.
        for center in self.SURV_CENTERS:
            self._emit("DERIVED", "K2.implies.K1q", -self.k2[center], self.k1[("q", center)])
            self._emit("DERIVED", "K2.implies.K1w", -self.k2[center], self.k1[("w", center)])

        # The chosen critical shells obstruct after deleting their sources.
        self._emit("HYP", "E.blocker_q.no_qfree", -self.k1[("q", "bq")])
        self._emit("HYP", "E.blocker_w.no_qfree", -self.k1[("w", "bw")])

        # q,w lie in the exact first-apex class, hence a1 is on their
        # perpendicular bisector.
        self._emit("DERIVED", "E.firstApex_is_bisector", self.bis["a1"])

        # Tseitin definitions for named intersections of selected rows.
        for first, second in combinations(self.ROW_CENTERS, 2):
            for point in self.ROW_POINTS:
                h = self.hit[(first, second, point)]
                left = self.row[(first, point)]
                right = self.row[(second, point)]
                self._emit("DEF", "rowHit.forward.left", -h, left)
                self._emit("DEF", "rowHit.forward.right", -h, right)
                self._emit("DEF", "rowHit.backward", -left, -right, h)

        # [GEOM] Distinct-center circle rows meet in at most two points.
        # The guard means the schema is inert until a branch proves the
        # relevant centers distinct.
        for first, second in combinations(self.ROW_CENTERS, 2):
            d = self.distinct[frozenset((first, second))]
            hits = [self.hit[(first, second, p)] for p in self.ROW_POINTS]
            for triple in combinations(hits, 3):
                self._emit("GEOM", "circleIntersection.atMostTwo", -d, *(-v for v in triple))

        # [GEOM] A line meets a strictly convex carrier in at most two
        # points.  This is the general mechanism used by the smoke gate; it
        # is guarded by pairwise distinctness of the three candidate points.
        for x, y, z in combinations(self.BIS_CENTERS, 3):
            self._emit(
                "GEOM",
                "perpBisector.carrier_atMostTwo",
                -self._d(x, y),
                -self._d(x, z),
                -self._d(y, z),
                -self.bis[x],
                -self.bis[y],
                -self.bis[z],
            )

    # -- branch clauses --------------------------------------------------

    def _d(self, x: str, y: str) -> int:
        return self.distinct[frozenset((x, y))]

    def _unit_distinct(self, out: list[TaggedClause], tag: str, rule: str, labels: Iterable[str]) -> None:
        for x, y in combinations(tuple(labels), 2):
            out.append(TaggedClause(tag, rule, (self._d(x, y),)))

    def _branch_d3(self, left: bool) -> list[TaggedClause]:
        out: list[TaggedClause] = []
        active = "w" if left else "q"
        partner = "q" if left else "w"
        blocker = "bq" if left else "bw"
        suffix = "left" if left else "right"

        self._unit_distinct(out, "BANKED", "D3.fourCenters_pairwise_ne", ("a1", "a2", "bq", "bw"))
        out.append(TaggedClause("HYP", f"D3.directed_crossDeletion_survival.{suffix}", (self.k1[(active, blocker)],)))

        # Three explicit rows in A\\{active}.  The a1 row is the other four
        # members of the exact-five class; the a2 row avoids q,w; the active
        # blocker row contains its source and omits its partner.
        for p in self.CLASS_POINTS:
            lit = -self.row[("a1", p)] if p == active else self.row[("a1", p)]
            out.append(TaggedClause("BANKED", f"D3.{suffix}.firstApexRow", (lit,)))
        out.extend(
            [
                TaggedClause("BANKED", f"D3.{suffix}.secondApexRow_avoids_q", (-self.row[("a2", "q")],)),
                TaggedClause("BANKED", f"D3.{suffix}.secondApexRow_avoids_w", (-self.row[("a2", "w")],)),
                TaggedClause("BANKED", f"D3.{suffix}.blockerRow_contains_source", (self.row[(blocker, partner)],)),
                TaggedClause("BANKED", f"D3.{suffix}.partner_omitted", (-self.row[(blocker, active)],)),
            ]
        )
        return out

    def _branch_d4(self) -> list[TaggedClause]:
        out: list[TaggedClause] = []
        self._unit_distinct(out, "BANKED", "D4.a1_a2_b_pairwise_ne", ("a1", "a2", "b"))
        out.extend(
            [
                TaggedClause("HYP", "D4.common_blocker.no_qfree_q", (-self.k1[("q", "b")],)),
                TaggedClause("HYP", "D4.common_blocker.no_qfree_w", (-self.k1[("w", "b")],)),
                TaggedClause("HYP", "D4.common_blocker.in_first_cap", (self.in_cap1["b"],)),
                TaggedClause("HYP", "D4.common_blocker.not_surplus", (-self.in_surplus["b"],)),
                TaggedClause("HYP", "D4.mutual_cross_membership.q", (self.row[("b", "q")],)),
                TaggedClause("HYP", "D4.mutual_cross_membership.w", (self.row[("b", "w")],)),
                TaggedClause("BANKED", "D4.sharedRow.third_member", (self.row[("b", "s1")],)),
                TaggedClause("BANKED", "D4.sharedRow.fourth_member", (self.row[("b", "s2")],)),
                TaggedClause("DERIVED", "D4.mutual_membership.common_is_bisector", (self.bis["b"],)),
                TaggedClause("BANKED", "D4.no_third.named_a2", (-self.bis["a2"],)),
                TaggedClause("BANKED", "D4.global_cover.named_a1", (self.k1[("q", "a1")], self.k1[("w", "a1")])),
                TaggedClause("BANKED", "D4.global_cover.named_a2", (self.k1[("q", "a2")], self.k1[("w", "a2")])),
            ]
        )
        return out

    def clauses_for(self, run: str) -> list[TaggedClause]:
        base = list(self.tagged[: self.base_count])
        if run == "base-E":
            return base
        if run == "D3-left":
            return base + self._branch_d3(True)
        if run == "D3-right":
            return base + self._branch_d3(False)
        if run == "D4":
            return base + self._branch_d4()
        raise EncodingError(f"unknown run {run!r}; expected one of {self.RUNS}")

    def smoke_probe_units(self) -> list[TaggedClause]:
        """Fresh carrier point c3, distinct from the two D4 bisectors."""

        return [
            TaggedClause("SMOKE", "fresh_c3.ne_a1", (self._d("a1", "c3"),)),
            TaggedClause("SMOKE", "fresh_c3.ne_b", (self._d("b", "c3"),)),
        ]

    @staticmethod
    def literals(clauses: Sequence[TaggedClause]) -> list[tuple[int, ...]]:
        return [c.literals for c in clauses]

    @staticmethod
    def tag_counts(clauses: Sequence[TaggedClause]) -> dict[str, int]:
        return dict(sorted(Counter(c.tag for c in clauses).items()))

    def clause_map(self, clauses: Sequence[TaggedClause]) -> list[dict[str, object]]:
        """Human-auditable tag/rule/name map for a persisted DIMACS file."""

        records: list[dict[str, object]] = []
        for index, clause in enumerate(clauses, start=1):
            records.append(
                {
                    "clause": index,
                    "tag": clause.tag,
                    "rule": clause.rule,
                    "literals": list(clause.literals),
                    "named_literals": [
                        ("" if lit > 0 else "not ") + self.by_var[abs(lit)]
                        for lit in clause.literals
                    ],
                }
            )
        return records


class RunInstance:
    """Adapter for ``solve_cadical`` with independent clause readback."""

    def __init__(self, encoder: DEEncoder, clauses: Sequence[TaggedClause]) -> None:
        self.encoder = encoder
        self.clauses = tuple(c.literals for c in clauses)

    def dimacs(self, extra_clauses: Sequence[Collection[int]] = ()) -> str:
        clauses = self.clauses + tuple(tuple(c) for c in extra_clauses)
        n_vars = self.encoder.cnf.n_variables
        lines = [f"p cnf {n_vars} {len(clauses)}"]
        lines.extend(" ".join(map(str, clause)) + " 0" for clause in clauses)
        return "\n".join(lines) + "\n"

    def decode_model(self, positive_variables: Collection[int]) -> dict[str, bool]:
        positive = set(positive_variables)
        assignment = {
            name: var in positive for name, var in self.encoder.names.items()
        }
        for clause in self.clauses:
            if not any((lit > 0) == (abs(lit) in positive) for lit in clause):
                raise EncodingError(f"decoded model does not satisfy clause {clause}")
        return assignment
