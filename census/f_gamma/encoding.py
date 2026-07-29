"""A minimal faithful propositional slice of the F-Gamma/F3 leaf.

This is deliberately an *abstraction*, not a certificate of the Lean leaf.
It records only named selected-support incidences which occur in the leaf
context or in the two already kernel-checked terminal theorems.  In
particular, it does not turn five-centre deletion survival into an incidence
axiom, and it never assumes a positive ``K(g)`` hit on either off-cap point.

The base formula is satisfiable by a hand-written total assignment.  The two
smoke gates are intentionally inconsistent because each adds the hypotheses
of one existing geometric terminal:

* a distinct selected four-row overlaps the explicit first row in at least
  three points; and
* two distinct cap centres have rows containing the two off-cap points.

Thus an UNSAT result is only a checked test of this finite CNF and of the
specified terminal interface.  It is not a proof of
``false_of_capSource_firstFiber_collisionFiveCenterDeletion``.
"""

from __future__ import annotations

import shutil
from dataclasses import dataclass
from itertools import combinations
from pathlib import Path
from typing import Collection, Iterable, Mapping, Sequence

from census.card_head.sat_encoding import CNF, CadicalResult, EncodingError, solve_cadical


SAT_SCOPE = (
    "EMPIRICALLY VERIFIED only for the finite F-Gamma incidence abstraction; "
    "not a Lean or geometric closure theorem"
)

# The labels are support positions, not an asserted all-different carrier
# enumeration.  The explicit first row has four distinct points because its
# Lean theorem is an equality to a support of card four.  No extra equality or
# inequality between any other labels is encoded here.
S1, S2, T1, T2, E, O, G = ("s1", "s2", "t1", "t2", "e", "o", "g")
FIRST_FIBER = (S1, S2, E, O)
TRACKED_POINTS = (S1, S2, T1, T2, E, O, G)

OVERLAP_TERMINAL = (
    "GEOMETRIC terminal: "
    "ATailFirstFiberOverlapDescent."
    "false_of_firstFiber_explicit_overlap_card_ge_three"
)
TWO_CAP_CENTERS_TERMINAL = (
    "GEOMETRIC terminal: "
    "ATailFirstFiberOverlapDescent."
    "false_of_firstFiber_twoOutsideHits_of_capCenter"
)


@dataclass(frozen=True, slots=True)
class RowSpec:
    """A selected support row and its geometric centre.

    ``row_id`` is intentionally a separate identifier from ``center``.  A
    selected row is ``K(c)`` data; it is not itself a carrier point or centre.
    The explicit inequality prevents the common modelling error of using a
    centre label as a row identifier.
    """

    row_id: str
    center: str
    center_in_first_cap: bool
    selected_cardinality: int = 4

    def __post_init__(self) -> None:
        if not self.row_id or not self.center:
            raise EncodingError("row identifiers and centres must be nonempty")
        if self.row_id == self.center:
            raise EncodingError("RowId must be distinct from its centre")
        if self.selected_cardinality != 4:
            raise EncodingError("this F-Gamma slice is only for selected four-rows")


@dataclass(frozen=True, slots=True)
class SmokeGate:
    """Extra clauses and the exact terminal whose hypotheses they add."""

    name: str
    clauses: tuple[tuple[int, ...], ...]
    provenance: str


def _at_least(variables: Sequence[int], bound: int) -> tuple[tuple[int, ...], ...]:
    """CNF for ``sum variables >= bound`` without auxiliary variables."""

    if bound < 0 or bound > len(variables):
        raise EncodingError("invalid lower cardinality bound")
    if bound == 0:
        return ()
    # Every subset of size n-bound+1 must contain a true literal.
    width = len(variables) - bound + 1
    return tuple(tuple(subset) for subset in combinations(variables, width))


def _clause_satisfied(clause: Collection[int], positive: Collection[int]) -> bool:
    true_variables = set(positive)
    return any(
        literal > 0 and literal in true_variables
        or literal < 0 and -literal not in true_variables
        for literal in clause
    )


class FGammaInstance:
    """The small named-incidence abstraction for the F3 cap-source packet."""

    first_row = RowSpec("K(s1)", "c(s1)", True)
    cap_source_row = RowSpec("K(g)", "c(g)", False)

    def __init__(self) -> None:
        if self.first_row.center == self.cap_source_row.center:
            raise EncodingError("the F3 cap-source centre must differ from c(s1)")
        self.cnf = CNF()
        self.membership: dict[tuple[str, str], int] = {}
        for row in (self.first_row, self.cap_source_row):
            for point in TRACKED_POINTS:
                self.membership[(row.row_id, point)] = self.cnf.new_variable()
        # The first collision blocker is a cap centre in Lean.  This separate
        # variable represents the *additional* premise that c(g) is also in
        # that cap; it must not be silently assumed by the base abstraction.
        self.cap_source_center_in_first_cap = self.cnf.new_variable()

        self.clause_provenance: dict[tuple[int, ...], str] = {}
        self._build_gamma()
        self.base_n_variables = self.cnf.n_variables
        self.base_n_clauses = len(self.cnf.clauses)

    def variable(self, row: RowSpec, point: str) -> int:
        try:
            return self.membership[(row.row_id, point)]
        except KeyError as exc:
            raise EncodingError("unknown F-Gamma row or tracked support point") from exc

    def _add_clause(self, literals: Iterable[int], provenance: str) -> None:
        clause = tuple(literals)
        self.cnf.add_clause(clause)
        self.clause_provenance[clause] = provenance

    def _add_sinz_at_most(
        self, variables: Sequence[int], bound: int, provenance: str
    ) -> None:
        before = len(self.cnf.clauses)
        self.cnf.at_most_sinz(variables, bound)
        for clause in self.cnf.clauses[before:]:
            self.clause_provenance[clause] = provenance

    def _build_gamma(self) -> None:
        first = self.first_row
        source = self.cap_source_row

        # Lean: firstFiber_shell_eq_explicitFour.  For each tracked label this
        # fixes the first collision support exactly; it does not impose any
        # unrelated carrier equalities.
        for point in TRACKED_POINTS:
            literal = self.variable(first, point)
            self._add_clause(
                (literal,) if point in FIRST_FIBER else (-literal,),
                "LEAN: firstFiber_shell_eq_explicitFour",
            )

        # Lean: FirstFiberCapSourceWitness.  ``source.selected_cardinality``
        # records its selected-four premise and the source point belongs to its
        # support.  We deliberately do not encode a global exact-four count
        # over arbitrary named labels: that would silently require pairwise
        # distinctness not supplied by this finite slice.
        self._add_clause(
            (self.variable(source, G),),
            "LEAN: FirstFiberCapSourceWitness.source_mem_selected_support",
        )

        # Lean: CrossPairDeletionView.omits, twice.  Each is a disjunction of
        # omissions, not a positive selected-support incidence.
        self._add_clause(
            (-self.variable(source, S1), -self.variable(source, S2)),
            "LEAN: CrossPairDeletionView.omits for {s1,s2}",
        )
        self._add_clause(
            (-self.variable(source, T1), -self.variable(source, T2)),
            "LEAN: CrossPairDeletionView.omits for {t1,t2}",
        )

        # Lean: SelectedFourClass.inter_card_le_two, instantiated in
        # false_of_firstFiber_explicit_overlap_card_ge_three.  The four first
        # row positions are known distinct from its support-card-four theorem,
        # so this cardinality constraint does not add a new point inequality.
        self._add_sinz_at_most(
            [self.variable(source, point) for point in FIRST_FIBER],
            2,
            OVERLAP_TERMINAL,
        )

        # Lean: false_of_firstFiber_twoOutsideHits_of_capCenter.  The first
        # collision blocker is already a cap centre.  The cap-source blocker
        # is *not* assumed to be in the cap in Gamma; its membership is added
        # only by the corresponding smoke gate.  This clause is therefore a
        # provenance-tagged terminal implication, not a base positive hit.
        self._add_clause(
            (
                -self.cap_source_center_in_first_cap,
                -self.variable(source, E),
                -self.variable(source, O),
            ),
            TWO_CAP_CENTERS_TERMINAL + " (conditional cap-centre premise in gate)",
        )

    def clauses_with(
        self, extra_clauses: Sequence[Collection[int]] = ()
    ) -> tuple[tuple[int, ...], ...]:
        normalized: list[tuple[int, ...]] = []
        for literals in extra_clauses:
            clause = tuple(literals)
            if any(
                literal == 0 or abs(literal) > self.cnf.n_variables
                for literal in clause
            ):
                raise EncodingError("extra F-Gamma clause has an invalid literal")
            normalized.append(clause)
        return tuple(self.cnf.clauses) + tuple(normalized)

    def dimacs(self, extra_clauses: Sequence[Collection[int]] = ()) -> str:
        clauses = self.clauses_with(extra_clauses)
        lines = [f"p cnf {self.cnf.n_variables} {len(clauses)}"]
        lines.extend(" ".join(map(str, clause)) + " 0" for clause in clauses)
        return "\n".join(lines) + "\n"

    def decode_model(self, positive_variables: Collection[int]) -> dict[str, list[str]]:
        positive = set(positive_variables)
        return {
            row.row_id: [
                point for point in TRACKED_POINTS
                if self.variable(row, point) in positive
            ]
            for row in (self.first_row, self.cap_source_row)
        }

    def handcrafted_total_assignment(self) -> set[int]:
        """A total satisfying assignment for the base F-Gamma abstraction.

        The cap-source row contains only the tracked point ``g``.  Any other
        members of its actual selected four-shell are intentionally untracked;
        this is why this is a model of the abstraction rather than a claimed
        realization of a geometric configuration.
        """

        positive = {
            self.variable(self.first_row, point) for point in FIRST_FIBER
        }
        positive.add(self.variable(self.cap_source_row, G))

        # Sinz counters encode prefix thresholds.  With all four overlap
        # inputs false, every counter is false, so the resulting assignment is
        # total once all primary membership variables have been assigned.
        if any(
            self.variable(self.cap_source_row, point) in positive
            for point in FIRST_FIBER
        ):
            raise AssertionError("handcrafted base model unexpectedly hits first row")
        return positive

    def validates_total_assignment(
        self,
        positive_variables: Collection[int],
        extra_clauses: Sequence[Collection[int]] = (),
    ) -> bool:
        positive = set(positive_variables)
        return all(
            _clause_satisfied(clause, positive)
            for clause in self.clauses_with(extra_clauses)
        )

    def overlap_smoke_gate(self) -> SmokeGate:
        """Add the >=3-overlap hypothesis of the first terminal."""

        variables = [self.variable(self.cap_source_row, point) for point in FIRST_FIBER]
        return SmokeGate(
            "selected-four-overlap-at-least-three",
            _at_least(variables, 3),
            OVERLAP_TERMINAL,
        )

    def two_cap_centers_smoke_gate(self) -> SmokeGate:
        """Add cap-source-in-cap plus the two off-cap common support hits."""

        # ``center_in_first_cap`` is a semantic gate premise, represented by
        # forcing the only optional cap-centre flag.  It is not a base Gamma
        # fact, precisely because FirstFiberCapSourceWitness does not prove it.
        if self.cap_source_row.center_in_first_cap:
            raise EncodingError("cap-source cap membership must remain a gate premise")
        return SmokeGate(
            "two-distinct-cap-centres-share-e-o",
            (
                (self.cap_source_center_in_first_cap,),
                (self.variable(self.cap_source_row, E),),
                (self.variable(self.cap_source_row, O),),
            ),
            TWO_CAP_CENTERS_TERMINAL,
        )


def _require_certified_solver() -> None:
    missing = [command for command in ("cadical", "drat-trim") if shutil.which(command) is None]
    if missing:
        raise EncodingError(
            "F-Gamma smoke gates fail closed: certified solver path missing "
            + ", ".join(missing)
        )


def run_smoke(workdir: Path, timeout_seconds: int = 30) -> Mapping[str, CadicalResult | bool]:
    """Run base SAT and both UNSAT terminal gates, with verified DRAT proofs."""

    _require_certified_solver()
    instance = FGammaInstance()
    hand_assignment = instance.handcrafted_total_assignment()
    if not instance.validates_total_assignment(hand_assignment):
        raise EncodingError("handcrafted F-Gamma base assignment does not satisfy CNF")

    workdir.mkdir(parents=True, exist_ok=True)
    base = solve_cadical(
        instance, workdir / "f_gamma_base.cnf", timeout_seconds=timeout_seconds
    )
    if base.verdict != "SAT":
        raise EncodingError(f"F-Gamma base must be SAT, got {base.verdict}")

    results: dict[str, CadicalResult | bool] = {
        "handcrafted_base_assignment": True,
        "base": base,
    }
    for gate in (instance.overlap_smoke_gate(), instance.two_cap_centers_smoke_gate()):
        result = solve_cadical(
            instance,
            workdir / f"f_gamma_{gate.name}.cnf",
            extra_clauses=gate.clauses,
            timeout_seconds=timeout_seconds,
            proof_path=workdir / f"f_gamma_{gate.name}.drat",
        )
        if result.verdict != "UNSAT" or not result.proof_verified:
            raise EncodingError(
                f"F-Gamma gate {gate.name} did not close with verified DRAT: "
                f"{result.verdict}"
            )
        results[gate.name] = result
    return results
