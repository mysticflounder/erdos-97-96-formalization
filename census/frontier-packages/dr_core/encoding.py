"""Hypothesis-tagged named-local CNF for the D-R Session-3 package.

The label universe is intentionally incomplete.  See D-R-ENCODING-SPEC.md.
"""

from __future__ import annotations

import sys
from itertools import combinations
from pathlib import Path
from typing import Collection, Sequence

_REPO_ROOT = Path(__file__).resolve().parents[3]
if str(_REPO_ROOT) not in sys.path:
    sys.path.insert(0, str(_REPO_ROOT))

from census.card_head.sat_encoding import (  # noqa: E402
    CNF,
    CadicalResult,
    EncodingError,
    solve_cadical,
)

GROUPS = {
    "U": tuple(f"U{i}" for i in range(4)),
    "B1": tuple(f"B1{i}" for i in range(4)),
    "B2": tuple(f"B2{i}" for i in range(4)),
    "X": tuple(f"X{i}" for i in range(4)),
    "Y": tuple(f"Y{i}" for i in range(4)),
    "V": tuple(f"V{i}" for i in range(4)),
}
LABELS = (
    "a0", "a1", "a2", "a0p", "source", "c1",
    *GROUPS["U"], *GROUPS["B1"], *GROUPS["B2"],
    *GROUPS["X"], *GROUPS["Y"], *GROUPS["V"],
)
SELECTORS = ("qF", "wF", "p", "pP")
SWAP_ALIASES = (
    "swap(firstApex'=a2)",
    "swap(secondApex'=a1)",
    "swap(firstCap'=cap2)",
    "swap(secondCap'=cap1)",
    "swap(surplusCap'=surplusCap)",
)


class DREncoder:
    """Build common, D1, and D2 clause lists without carrier completeness."""

    def __init__(self) -> None:
        self.cnf = CNF()
        self.names: dict[str, int] = {}
        self.by_var: dict[int, str] = {}
        self.tags: dict[str, int] = {}
        self.common: list[tuple[int, ...]] = []
        self.d1: list[tuple[int, ...]] = []
        self.d2: list[tuple[int, ...]] = []
        self.eq: dict[tuple[str, str], int] = {}
        self.sel: dict[tuple[str, int], int] = {}
        self.vsel: dict[tuple[str, int], int] = {}
        self.g2: dict[str, int] = {}
        self.swap: dict[str, int] = {}
        self.delta_q = 0
        self.delta_w = 0
        self._allocate()
        self._build_equality()
        self._build_common()
        self._build_d1()
        self._build_d2()
        self.common_clauses = tuple(self.common)
        self.d1_clauses = tuple(self.d1)
        self.d2_clauses = tuple(self.d2)

    def _new(self, name: str) -> int:
        if name in self.names:
            raise EncodingError(f"duplicate atom {name}")
        var = self.cnf.new_variable()
        self.names[name] = var
        self.by_var[var] = name
        return var

    def _allocate(self) -> None:
        for left, right in combinations(LABELS, 2):
            self.eq[(left, right)] = self._new(f"eq({left},{right})")
        for selector in SELECTORS:
            for index in range(4):
                self.sel[(selector, index)] = self._new(f"{selector}=U{index}")
        for selector in ("qP", "wP"):
            for index in range(4):
                self.vsel[(selector, index)] = self._new(f"{selector}=V{index}")
        self.delta_q = self._new("delta=qF")
        self.delta_w = self._new("delta=wF")
        for label in (*GROUPS["U"], *GROUPS["X"], *GROUPS["Y"]):
            self.g2[label] = self._new(f"g2({label})")
        for alias in SWAP_ALIASES:
            self.swap[alias] = self._new(alias)

    def eqv(self, left: str, right: str) -> int:
        if left == right:
            raise EncodingError("reflexive equality has no atom")
        return self.eq[tuple(sorted((left, right), key=LABELS.index))]

    def _add(self, target: list[tuple[int, ...]], tag: str, *lits: int) -> None:
        if not lits:
            raise EncodingError("empty hard clause")
        target.append(tuple(lits))
        self.tags[tag] = self.tags.get(tag, 0) + 1

    def _unit_distinct(
        self, target: list[tuple[int, ...]], tag: str, left: str, right: str
    ) -> None:
        self._add(target, tag, -self.eqv(left, right))

    def _pairwise_distinct(
        self, target: list[tuple[int, ...]], tag: str, labels: Sequence[str]
    ) -> None:
        for left, right in combinations(labels, 2):
            self._unit_distinct(target, tag, left, right)

    def _exactly_one(
        self, target: list[tuple[int, ...]], tag: str, variables: Sequence[int]
    ) -> None:
        self._add(target, tag, *variables)
        for left, right in combinations(variables, 2):
            self._add(target, tag, -left, -right)

    def _at_most_two(
        self, target: list[tuple[int, ...]], tag: str, variables: Sequence[int]
    ) -> None:
        for triple in combinations(variables, 3):
            self._add(target, tag, *(-var for var in triple))

    def _at_least_two(
        self, target: list[tuple[int, ...]], tag: str, variables: Sequence[int]
    ) -> None:
        # Every three-variable complement contains a true variable.
        for triple in combinations(variables, 3):
            self._add(target, tag, *triple)

    def _build_equality(self) -> None:
        # (EQ): if a=b and b=c, then a=c.  All three orientations are needed.
        for a, b, c in combinations(LABELS, 3):
            ab, ac, bc = self.eqv(a, b), self.eqv(a, c), self.eqv(b, c)
            self._add(self.common, "EQ", -ab, -bc, ac)
            self._add(self.common, "EQ", -ab, -ac, bc)
            self._add(self.common, "EQ", -ac, -bc, ab)

    def _build_common(self) -> None:
        self._pairwise_distinct(self.common, "R-MOSER", ("a0", "a1", "a2"))
        self._pairwise_distinct(self.common, "R-U", GROUPS["U"])
        for selector in SELECTORS:
            self._exactly_one(
                self.common, "R-U-SELECT", [self.sel[(selector, i)] for i in range(4)]
            )
        for i in range(4):
            self._add(
                self.common, "R-U-SELECT-DIST",
                -self.sel[("qF", i)], -self.sel[("wF", i)],
            )
            self._add(
                self.common, "R-U-SELECT-DIST",
                -self.sel[("p", i)], -self.sel[("pP", i)],
            )

        self._exactly_one(self.common, "I-DEL", (self.delta_q, self.delta_w))
        self._unit_distinct(self.common, "I-CENTERS", "c1", "a2")
        for i, ui in enumerate(GROUPS["U"]):
            # The selected deletion is distinct from both common-deletion centers.
            for choice in (self.delta_q, self.delta_w):
                selector = "qF" if choice == self.delta_q else "wF"
                self._add(
                    self.common, "I-DEL-CENTERS",
                    -choice, -self.sel[(selector, i)], -self.eqv(ui, "c1"),
                )
                self._add(
                    self.common, "I-DEL-CENTERS",
                    -choice, -self.sel[(selector, i)], -self.eqv(ui, "a2"),
                )

        self._pairwise_distinct(self.common, "I-B1", GROUPS["B1"])
        self._pairwise_distinct(self.common, "I-B2", GROUPS["B2"])
        for b in GROUPS["B1"]:
            self._unit_distinct(self.common, "I-B1-CENTER", b, "c1")
        for b in GROUPS["B2"]:
            self._unit_distinct(self.common, "I-B2-CENTER", b, "a2")
        for i, ui in enumerate(GROUPS["U"]):
            for choice in (self.delta_q, self.delta_w):
                selector = "qF" if choice == self.delta_q else "wF"
                for b in (*GROUPS["B1"], *GROUPS["B2"]):
                    self._add(
                        self.common, "I-B-DEL",
                        -choice, -self.sel[(selector, i)], -self.eqv(ui, b),
                    )
        overlap = [self.eqv(left, right) for left in GROUPS["B1"] for right in GROUPS["B2"]]
        self._at_most_two(self.common, "I-OVERLAP", overlap)

    def _build_d1(self) -> None:
        self._pairwise_distinct(self.d1, "D1-ROW-X", GROUPS["X"])
        self._pairwise_distinct(self.d1, "D1-ROW-Y", GROUPS["Y"])
        for left in GROUPS["X"]:
            for right in GROUPS["Y"]:
                self._unit_distinct(self.d1, "D1-DISJ", left, right)
        self._at_least_two(self.d1, "D1-CAP-X", [self.g2[p] for p in GROUPS["X"]])
        self._at_least_two(self.d1, "D1-CAP-Y", [self.g2[p] for p in GROUPS["Y"]])
        self._at_most_two(self.d1, "D1-CAP-U", [self.g2[p] for p in GROUPS["U"]])

    def _build_d2(self) -> None:
        self._pairwise_distinct(self.d2, "D2-ROW-V", GROUPS["V"])
        for selector in ("qP", "wP"):
            self._exactly_one(
                self.d2, "D2-V-SELECT", [self.vsel[(selector, i)] for i in range(4)]
            )
        for i in range(4):
            self._add(
                self.d2, "D2-V-SELECT-DIST",
                -self.vsel[("qP", i)], -self.vsel[("wP", i)],
            )
        for ui_index, ui in enumerate(GROUPS["U"]):
            for vi_index, vi in enumerate(GROUPS["V"]):
                for selector in ("qF", "wF"):
                    self._add(
                        self.d2, "D2-ORIGINAL-OUTSIDE-V",
                        -self.sel[(selector, ui_index)], -self.eqv(ui, vi),
                    )
                for selector in ("qP", "wP"):
                    self._add(
                        self.d2, "D2-SWAPPED-OUTSIDE-U",
                        -self.vsel[(selector, vi_index)], -self.eqv(vi, ui),
                    )
        # WLOG reindex the unordered B2/V support slots.
        for b2, v in zip(GROUPS["B2"], GROUPS["V"], strict=True):
            self._add(self.d2, "D2-INGRESS", self.eqv(b2, v))
        for alias in SWAP_ALIASES:
            self._add(self.d2, "D2-SWAP", self.swap[alias])

    def clauses_for(self, run_name: str) -> tuple[tuple[int, ...], ...]:
        if run_name == "dr-common":
            return self.common_clauses
        if run_name == "dr-d1":
            return self.common_clauses + self.d1_clauses
        if run_name == "dr-d2":
            return self.common_clauses + self.d2_clauses
        raise EncodingError(f"unknown run {run_name}")

    def witness_units(self, run_name: str, *, overlap: int = 0) -> list[tuple[int, ...]]:
        """A hand-built total assignment to every named atom."""
        true_vars: set[int] = set()
        # Selector choices: qF=U0,wF=U1,p=U2,p'=U3; delta=qF.
        for selector, index in (("qF", 0), ("wF", 1), ("p", 2), ("pP", 3)):
            true_vars.add(self.sel[(selector, index)])
        true_vars.add(self.delta_q)

        # Optional B1/B2 overlap is realized diagonally.
        for index in range(overlap):
            true_vars.add(self.eqv(GROUPS["B1"][index], GROUPS["B2"][index]))

        if run_name == "dr-d1":
            true_vars.update(self.g2[p] for p in ("U0", "U1", "X0", "X1", "Y0", "Y1"))
        if run_name == "dr-d2":
            true_vars.update(self.vsel[(selector, index)] for selector, index in (("qP", 0), ("wP", 1)))
            true_vars.update(self.eqv(b2, v) for b2, v in zip(GROUPS["B2"], GROUPS["V"], strict=True))
            true_vars.update(self.swap.values())

        return [
            (var if var in true_vars else -var,)
            for var in range(1, self.cnf.n_variables + 1)
        ]


class RunInstance:
    """Duck-typed DIMACS/model adapter for solve_cadical."""

    def __init__(self, encoder: DREncoder, clauses: Sequence[tuple[int, ...]]) -> None:
        self.encoder = encoder
        self.clauses = tuple(tuple(clause) for clause in clauses)

    def dimacs(self, extra_clauses: Sequence[Collection[int]] = ()) -> str:
        clauses = self.clauses + tuple(tuple(clause) for clause in extra_clauses)
        lines = [f"p cnf {self.encoder.cnf.n_variables} {len(clauses)}"]
        lines.extend(" ".join(map(str, clause)) + " 0" for clause in clauses)
        return "\n".join(lines) + "\n"

    def decode_model(self, positive_variables: Collection[int]) -> dict[str, bool]:
        positive = set(positive_variables)
        return {name: var in positive for name, var in self.encoder.names.items()}

