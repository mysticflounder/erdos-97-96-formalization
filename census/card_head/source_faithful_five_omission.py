"""Exact-12 source-faithful cubes carrying a five-omission witness.

This module strengthens the frozen source-safe candidate CNF with the finite
incidence fields of Lean's ``FrozenFiveOmissionBoundary``.  The witness and
the row cube share one labeling: a selected deleted label belongs to the
selected blocker row and is omitted by exactly five selected centers.

The formula remains a finite abstraction.  SAT supplies a replayable finite
witness; UNSAT would cover only this exact CNF until a checked terminal proof
and the Lean producer/consumer chain are both present.
"""

from __future__ import annotations

from collections.abc import Collection
from dataclasses import dataclass
from itertools import combinations

from .candidate_surface import CapHeadModel
from .sat_encoding import EncodingError
from .source_faithful_candidate_surface import (
    SourceFaithfulCoverInstance,
    five_omission_boundary_ok,
)

SOURCE_FAITHFUL_FIVE_OMISSION_SCHEMA = (
    "p97_rigid221_exact12_source_safe_five_omission.v1"
)
SOURCE_FAITHFUL_FIVE_OMISSION_SCOPE = (
    "Finite exact-12 source-safe C1/C2/C4 cubes with a same-labeling "
    "five-omission witness; not terminal UNSAT or live Lean closure"
)


@dataclass(frozen=True)
class FiveOmissionWitness:
    """Decoded finite fields of ``FrozenFiveOmissionBoundary``."""

    deleted: int
    blocker: int
    centers: tuple[int, int, int, int, int]


class SourceFaithfulFiveOmissionInstance(SourceFaithfulCoverInstance):
    """Source-safe exact-12 CNF plus one existential boundary witness."""

    schema = SOURCE_FAITHFUL_FIVE_OMISSION_SCHEMA

    def __init__(self, model: CapHeadModel) -> None:
        if model.cardinality != 12:
            raise EncodingError("five-omission v1 is defined only for exact-12")
        super().__init__(model)
        labels = tuple(range(model.cardinality))

        self.deleted_variables = {label: self.cnf.new_variable() for label in labels}
        self.blocker_variables = {label: self.cnf.new_variable() for label in labels}
        self.center_variables = {label: self.cnf.new_variable() for label in labels}

        self._build_one_hot_selector(tuple(self.deleted_variables.values()))
        self._build_one_hot_selector(tuple(self.blocker_variables.values()))
        self._build_exactly_five_centers(tuple(self.center_variables.values()))
        self._build_role_distinctness(labels)
        self._build_boundary_incidence(labels)

        self.five_omission_n_variables = self.cnf.n_variables
        self.five_omission_n_clauses = len(self.cnf.clauses)

    def _build_one_hot_selector(self, variables: tuple[int, ...]) -> None:
        self.cnf.add_clause(variables)
        self.cnf.at_most_sinz(variables, 1)

    def _build_exactly_five_centers(self, variables: tuple[int, ...]) -> None:
        self.cnf.at_most_sinz(variables, 5)
        # At least five of twelve: no eight selectors may all be false.
        for eight_variables in combinations(variables, 8):
            self.cnf.add_clause(eight_variables)

    def _build_role_distinctness(self, labels: tuple[int, ...]) -> None:
        for label in labels:
            self.cnf.add_clause(
                (
                    -self.deleted_variables[label],
                    -self.blocker_variables[label],
                )
            )
            self.cnf.add_clause(
                (
                    -self.blocker_variables[label],
                    -self.center_variables[label],
                )
            )

    def _build_boundary_incidence(self, labels: tuple[int, ...]) -> None:
        for deleted in labels:
            deleted_variable = self.deleted_variables[deleted]
            for row_center in labels:
                blocker_variable = self.blocker_variables[row_center]
                center_variable = self.center_variables[row_center]
                for candidate_index, candidate in enumerate(
                    self.candidates[row_center]
                ):
                    choice_variable = self.choice_variables[
                        (row_center, candidate_index)
                    ]
                    if deleted not in candidate:
                        # selected deleted + blocker require membership
                        self.cnf.add_clause(
                            (
                                -deleted_variable,
                                -blocker_variable,
                                -choice_variable,
                            )
                        )
                    else:
                        # selected deleted + omission center forbid membership
                        self.cnf.add_clause(
                            (
                                -deleted_variable,
                                -center_variable,
                                -choice_variable,
                            )
                        )

    @staticmethod
    def _selected_labels(
        positive_variables: set[int], variable_by_label: dict[int, int]
    ) -> tuple[int, ...]:
        return tuple(
            label
            for label, variable in variable_by_label.items()
            if variable in positive_variables
        )

    def decode_boundary_witness(
        self, positive_variables: Collection[int]
    ) -> FiveOmissionWitness:
        """Decode and independently replay the same-cube boundary witness."""

        raw_positive = tuple(positive_variables)
        if len(raw_positive) != len(set(raw_positive)) or any(
            isinstance(variable, bool)
            or not isinstance(variable, int)
            or not 1 <= variable <= self.cnf.n_variables
            for variable in raw_positive
        ):
            raise EncodingError(
                "positive assignment contains duplicate, non-integer, or "
                "out-of-range variables"
            )
        positive = set(raw_positive)
        cube = self.decode_model(positive)
        deleted = self._selected_labels(positive, self.deleted_variables)
        blocker = self._selected_labels(positive, self.blocker_variables)
        centers = self._selected_labels(positive, self.center_variables)
        if len(deleted) != 1 or len(blocker) != 1 or len(centers) != 5:
            raise EncodingError(
                "SAT model does not select one deleted label, one blocker, "
                "and five omission centers"
            )
        witness = FiveOmissionWitness(
            deleted=deleted[0],
            blocker=blocker[0],
            centers=centers,
        )
        if not five_omission_boundary_ok(
            cube, witness.deleted, witness.blocker, witness.centers
        ):
            raise EncodingError(
                "decoded SAT model fails independent five-omission replay"
            )
        return witness

    def decode_model_and_boundary(
        self, positive_variables: Collection[int]
    ) -> tuple[dict[int, list[int]], FiveOmissionWitness]:
        """Decode both finite ingress components from one SAT assignment."""

        cube = self.decode_model(positive_variables)
        witness = self.decode_boundary_witness(positive_variables)
        return cube, witness
