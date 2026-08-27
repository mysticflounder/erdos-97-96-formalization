"""Exact target-neutral polynomial encoding for cap-configuration queries."""

from __future__ import annotations

import re
from collections.abc import Mapping, Sequence
from dataclasses import dataclass
from fractions import Fraction
from itertools import pairwise
from typing import Any, ClassVar, Literal, NoReturn

import sympy as sp
from sympy.polys.polyerrors import CoercionFailed

from .schema import (
    CapConfigurationSchemaError,
    canonical_text,
    exact_int,
    exact_keys,
    exact_list,
)

POLYNOMIAL_SYSTEM_SCHEMA = "cap-configuration-polynomial-system/v1"
NL_COV_COMMAND = "(set-option :nl-cov true)"
RELATIONS = ("eq", "ge", "gt", "ne", "or_ne")
Relation = Literal["eq", "ge", "gt", "ne", "or_ne"]

_SAFE_IDENTIFIER = re.compile(r"[A-Za-z_][A-Za-z0-9_]*")


class CapConfigurationEncodingError(ValueError):
    """Raised when a polynomial query is ambiguous or noncanonical."""


def _fail(message: str) -> NoReturn:
    raise CapConfigurationEncodingError(message)


def _identifier(value: Any, path: str) -> str:
    if type(value) is not str or _SAFE_IDENTIFIER.fullmatch(value) is None:
        _fail(f"{path} must be a safe identifier")
    return value


def _text(value: Any, path: str) -> str:
    try:
        return canonical_text(value, path)
    except CapConfigurationSchemaError as exc:
        raise CapConfigurationEncodingError(str(exc)) from exc


def _record(value: Any, expected: set[str], path: str) -> dict[str, Any]:
    try:
        return exact_keys(value, expected, path)
    except CapConfigurationSchemaError as exc:
        raise CapConfigurationEncodingError(str(exc)) from exc


def _array(value: Any, path: str) -> list[Any]:
    try:
        return exact_list(value, path)
    except CapConfigurationSchemaError as exc:
        raise CapConfigurationEncodingError(str(exc)) from exc


def _integer(value: Any, path: str, *, minimum: int | None = None) -> int:
    try:
        return exact_int(value, path, minimum=minimum)
    except CapConfigurationSchemaError as exc:
        raise CapConfigurationEncodingError(str(exc)) from exc


@dataclass(frozen=True, slots=True)
class SparseTerm:
    """One nonzero exact-rational monomial in a fixed variable order."""

    coefficient: Fraction
    powers: tuple[int, ...]

    def __post_init__(self) -> None:
        if type(self.coefficient) is not Fraction or self.coefficient == 0:
            _fail("sparse term coefficient must be a nonzero exact Fraction")
        if type(self.powers) is not tuple or any(
            type(power) is not int or power < 0 for power in self.powers
        ):
            _fail("sparse term powers must be a tuple of nonnegative integers")

    def to_record(self) -> dict[str, object]:
        return {
            "coefficient": {
                "denominator": self.coefficient.denominator,
                "numerator": self.coefficient.numerator,
            },
            "powers": list(self.powers),
        }

    @classmethod
    def from_record(cls, value: Any, *, width: int, path: str) -> SparseTerm:
        term = _record(value, {"coefficient", "powers"}, path)
        coefficient = _record(
            term["coefficient"], {"numerator", "denominator"}, f"{path}.coefficient"
        )
        numerator = _integer(coefficient["numerator"], f"{path}.coefficient.numerator")
        denominator = _integer(
            coefficient["denominator"],
            f"{path}.coefficient.denominator",
            minimum=1,
        )
        fraction = Fraction(numerator, denominator)
        if (
            numerator == 0
            or fraction.numerator != numerator
            or fraction.denominator != denominator
        ):
            _fail(f"{path}.coefficient is not a reduced nonzero rational")
        raw_powers = _array(term["powers"], f"{path}.powers")
        if len(raw_powers) != width:
            _fail(f"{path}.powers has width {len(raw_powers)}, expected {width}")
        powers = tuple(
            _integer(power, f"{path}.powers[{index}]", minimum=0)
            for index, power in enumerate(raw_powers)
        )
        return cls(coefficient=fraction, powers=powers)


@dataclass(frozen=True, slots=True)
class SparsePolynomial:
    """A canonical lexicographically descending sparse polynomial over QQ."""

    variable_order: tuple[str, ...]
    terms: tuple[SparseTerm, ...]

    def __post_init__(self) -> None:
        if type(self.variable_order) is not tuple or not self.variable_order:
            _fail("polynomial variable order must be a nonempty tuple")
        for index, variable in enumerate(self.variable_order):
            _identifier(variable, f"polynomial.variable_order[{index}]")
        if len(self.variable_order) != len(set(self.variable_order)):
            _fail("polynomial variable order contains duplicates")
        if type(self.terms) is not tuple or any(
            type(term) is not SparseTerm for term in self.terms
        ):
            _fail("polynomial terms must be a tuple of SparseTerm values")
        powers = tuple(term.powers for term in self.terms)
        if any(left <= right for left, right in pairwise(powers)):
            _fail("polynomial terms must have unique descending power vectors")
        if any(len(power) != len(self.variable_order) for power in powers):
            _fail("polynomial term width does not match its variable order")

    @property
    def width(self) -> int:
        return len(self.variable_order)

    def to_record(self) -> dict[str, object]:
        return {"terms": [term.to_record() for term in self.terms]}

    @classmethod
    def from_record(
        cls,
        value: Any,
        *,
        variable_order: Sequence[str],
        path: str = "polynomial",
    ) -> SparsePolynomial:
        bound_order = tuple(variable_order)
        polynomial = _record(value, {"terms"}, path)
        raw_terms = _array(polynomial["terms"], f"{path}.terms")
        return cls(
            bound_order,
            tuple(
                SparseTerm.from_record(
                    term,
                    width=len(bound_order),
                    path=f"{path}.terms[{index}]",
                )
                for index, term in enumerate(raw_terms)
            ),
        )

    @classmethod
    def from_sympy(
        cls,
        expression: sp.Expr | int | Fraction,
        variables: Sequence[sp.Symbol],
    ) -> SparsePolynomial:
        """Convert an exact SymPy polynomial without using a printer."""

        variable_tuple = tuple(variables)
        if not variable_tuple or any(
            type(variable) is not sp.Symbol for variable in variable_tuple
        ):
            _fail("SymPy variable order must contain exact Symbol values")
        names = tuple(str(variable) for variable in variable_tuple)
        if len(names) != len(set(names)):
            _fail("SymPy variable order contains duplicate names")
        for index, name in enumerate(names):
            _identifier(name, f"variables[{index}]")
        if type(expression) in {bool, float, str}:
            _fail("polynomial input must be exact symbolic data")
        try:
            exact_expression = sp.sympify(expression)
        except (sp.SympifyError, TypeError, ValueError) as exc:
            raise CapConfigurationEncodingError("polynomial input is invalid") from exc
        if not isinstance(exact_expression, sp.Expr):
            _fail("polynomial input must be an arithmetic SymPy expression")
        if exact_expression.has(sp.Float):
            _fail("polynomial input contains a floating-point value")
        unknown = exact_expression.free_symbols - set(variable_tuple)
        if unknown:
            _fail(
                "polynomial contains undeclared variables: "
                + ", ".join(sorted(map(str, unknown)))
            )
        try:
            polynomial = sp.Poly(
                sp.expand(exact_expression), *variable_tuple, domain=sp.QQ
            )
        except (sp.PolynomialError, CoercionFailed, TypeError, ValueError) as exc:
            raise CapConfigurationEncodingError(
                "polynomial is not defined over exact rationals"
            ) from exc
        terms = tuple(
            SparseTerm(
                coefficient=Fraction(int(coefficient.p), int(coefficient.q)),
                powers=tuple(int(power) for power in powers),
            )
            for powers, coefficient in polynomial.terms()
            if coefficient != 0
        )
        return cls(names, terms)

    def evaluate(self, values: Sequence[Fraction]) -> Fraction:
        value_tuple = tuple(values)
        if any(type(value) is not Fraction for value in value_tuple):
            _fail("polynomial evaluation requires exact Fraction values")
        if len(value_tuple) != self.width:
            _fail("polynomial evaluation has the wrong variable width")
        total = Fraction(0)
        for term in self.terms:
            monomial = term.coefficient
            for value, power in zip(value_tuple, term.powers, strict=True):
                monomial *= value**power
            total += monomial
        return total


@dataclass(frozen=True, slots=True)
class NamedPolynomialAtom:
    """One named source-provenanced atom in the frozen relation grammar."""

    atom_id: str
    relation: Relation
    polynomials: tuple[SparsePolynomial, ...]
    family: str
    source_provenance: str

    ARITY: ClassVar[dict[str, int]] = {
        "eq": 1,
        "ge": 1,
        "gt": 1,
        "ne": 1,
        "or_ne": 2,
    }

    def __post_init__(self) -> None:
        _identifier(self.atom_id, "atom_id")
        if type(self.relation) is not str or self.relation not in RELATIONS:
            _fail(f"unsupported relation {self.relation!r}")
        if type(self.polynomials) is not tuple or any(
            type(polynomial) is not SparsePolynomial for polynomial in self.polynomials
        ):
            _fail("atom polynomials must be a tuple of SparsePolynomial values")
        expected = self.ARITY[self.relation]
        if len(self.polynomials) != expected:
            _fail(
                f"atom {self.atom_id!r} relation {self.relation!r} "
                f"requires {expected} polynomial(s)"
            )
        _text(self.family, "atom.family")
        _text(self.source_provenance, "atom.source_provenance")

    def to_record(self) -> dict[str, object]:
        return {
            "family": self.family,
            "id": self.atom_id,
            "polynomials": [polynomial.to_record() for polynomial in self.polynomials],
            "relation": self.relation,
            "source_provenance": self.source_provenance,
        }

    @classmethod
    def from_record(
        cls,
        value: Any,
        *,
        variable_order: Sequence[str],
        path: str = "atom",
    ) -> NamedPolynomialAtom:
        atom = _record(
            value,
            {"family", "id", "polynomials", "relation", "source_provenance"},
            path,
        )
        relation = atom["relation"]
        if type(relation) is not str or relation not in RELATIONS:
            _fail(f"{path}.relation is unsupported")
        raw_polynomials = _array(atom["polynomials"], f"{path}.polynomials")
        return cls(
            atom_id=_identifier(atom["id"], f"{path}.id"),
            relation=relation,
            polynomials=tuple(
                SparsePolynomial.from_record(
                    polynomial,
                    variable_order=variable_order,
                    path=f"{path}.polynomials[{index}]",
                )
                for index, polynomial in enumerate(raw_polynomials)
            ),
            family=_text(atom["family"], f"{path}.family"),
            source_provenance=_text(
                atom["source_provenance"], f"{path}.source_provenance"
            ),
        )


@dataclass(frozen=True, slots=True)
class PolynomialSystem:
    """Complete semantic ledger for one state-only SMT query."""

    variable_order: tuple[str, ...]
    atoms: tuple[NamedPolynomialAtom, ...]
    enabled_atom_order: tuple[str, ...]
    omitted_atom_order: tuple[str, ...]
    omitted_source_predicates: tuple[str, ...]

    def __post_init__(self) -> None:
        if type(self.variable_order) is not tuple or not self.variable_order:
            _fail("variable order must be a nonempty tuple")
        for index, variable in enumerate(self.variable_order):
            _identifier(variable, f"variable_order[{index}]")
        if len(self.variable_order) != len(set(self.variable_order)):
            _fail("variable order contains duplicates")
        if (
            type(self.atoms) is not tuple
            or not self.atoms
            or any(type(atom) is not NamedPolynomialAtom for atom in self.atoms)
        ):
            _fail("atom ledger must be a nonempty tuple")
        atom_ids = tuple(atom.atom_id for atom in self.atoms)
        if len(atom_ids) != len(set(atom_ids)):
            _fail("atom ledger contains duplicate identifiers")
        collisions = sorted(set(self.variable_order) & set(atom_ids))
        if collisions:
            _fail(f"variable and atom identifiers collide: {collisions}")
        for name, ledger in (
            ("enabled_atom_order", self.enabled_atom_order),
            ("omitted_atom_order", self.omitted_atom_order),
        ):
            if type(ledger) is not tuple or any(
                type(item) is not str for item in ledger
            ):
                _fail(f"{name} must be a tuple of atom identifiers")
            if len(ledger) != len(set(ledger)):
                _fail(f"{name} contains duplicates")
        if not self.enabled_atom_order:
            _fail("enabled atom ledger must be nonempty")
        unknown = (set(self.enabled_atom_order) | set(self.omitted_atom_order)) - set(
            atom_ids
        )
        if unknown:
            _fail(
                f"atom selection ledgers contain unknown identifiers: {sorted(unknown)}"
            )
        enabled_set = set(self.enabled_atom_order)
        expected_enabled = tuple(
            atom_id for atom_id in atom_ids if atom_id in enabled_set
        )
        expected_omitted = tuple(
            atom_id for atom_id in atom_ids if atom_id not in enabled_set
        )
        if self.enabled_atom_order != expected_enabled:
            _fail("enabled atom ledger does not preserve source atom order")
        if self.omitted_atom_order != expected_omitted:
            _fail("omitted atom ledger is not the ordered enabled complement")
        if type(self.omitted_source_predicates) is not tuple:
            _fail("omitted source-predicate ledger must be a tuple")
        for index, predicate in enumerate(self.omitted_source_predicates):
            _text(predicate, f"omitted_source_predicates[{index}]")
        if len(self.omitted_source_predicates) != len(
            set(self.omitted_source_predicates)
        ):
            _fail("omitted source-predicate ledger contains duplicates")

        for atom in self.atoms:
            for polynomial in atom.polynomials:
                if polynomial.variable_order != self.variable_order:
                    _fail(
                        f"atom {atom.atom_id!r} polynomial variable order "
                        "does not match the system"
                    )

        used_positions: set[int] = set()
        by_id = {atom.atom_id: atom for atom in self.atoms}
        for atom_id in self.enabled_atom_order:
            for polynomial in by_id[atom_id].polynomials:
                for term in polynomial.terms:
                    used_positions.update(
                        index for index, power in enumerate(term.powers) if power > 0
                    )
        expected_positions = set(range(len(self.variable_order)))
        if used_positions != expected_positions:
            unused = [
                variable
                for index, variable in enumerate(self.variable_order)
                if index not in used_positions
            ]
            _fail(f"declared variables are not all used by enabled atoms: {unused}")

    def to_record(self) -> dict[str, object]:
        return {
            "atoms": [atom.to_record() for atom in self.atoms],
            "enabled_atom_order": list(self.enabled_atom_order),
            "omitted_atom_order": list(self.omitted_atom_order),
            "omitted_source_predicates": list(self.omitted_source_predicates),
            "schema": POLYNOMIAL_SYSTEM_SCHEMA,
            "variable_order": list(self.variable_order),
        }

    @classmethod
    def from_record(cls, value: Any) -> PolynomialSystem:
        system = _record(
            value,
            {
                "atoms",
                "enabled_atom_order",
                "omitted_atom_order",
                "omitted_source_predicates",
                "schema",
                "variable_order",
            },
            "system",
        )
        if (
            type(system["schema"]) is not str
            or system["schema"] != POLYNOMIAL_SYSTEM_SCHEMA
        ):
            _fail("system.schema is unsupported")
        raw_variables = _array(system["variable_order"], "system.variable_order")
        variable_order = tuple(
            _identifier(variable, f"system.variable_order[{index}]")
            for index, variable in enumerate(raw_variables)
        )
        raw_atoms = _array(system["atoms"], "system.atoms")
        atoms = tuple(
            NamedPolynomialAtom.from_record(
                atom,
                variable_order=variable_order,
                path=f"system.atoms[{index}]",
            )
            for index, atom in enumerate(raw_atoms)
        )

        def identifier_ledger(key: str) -> tuple[str, ...]:
            return tuple(
                _identifier(item, f"system.{key}[{index}]")
                for index, item in enumerate(_array(system[key], f"system.{key}"))
            )

        omitted_source = tuple(
            _text(item, f"system.omitted_source_predicates[{index}]")
            for index, item in enumerate(
                _array(
                    system["omitted_source_predicates"],
                    "system.omitted_source_predicates",
                )
            )
        )
        result = cls(
            variable_order=variable_order,
            atoms=atoms,
            enabled_atom_order=identifier_ledger("enabled_atom_order"),
            omitted_atom_order=identifier_ledger("omitted_atom_order"),
            omitted_source_predicates=omitted_source,
        )
        if result.to_record() != value:
            _fail("polynomial system record is not canonical")
        return result

    def state_commands(self) -> tuple[str, ...]:
        """Reconstruct the deterministic solver-state journal."""

        commands = [NL_COV_COMMAND, "(set-logic QF_NRA)"]
        commands.extend(
            f"(declare-fun {_smt_symbol(variable)} () Real)"
            for variable in self.variable_order
        )
        by_id = {atom.atom_id: atom for atom in self.atoms}
        for atom_id in self.enabled_atom_order:
            atom = by_id[atom_id]
            body = _atom_smt2(atom, self.variable_order)
            commands.append(f"(assert (! {body} :named {_smt_symbol(atom.atom_id)}))")
        return tuple(commands)

    def state_smt2_bytes(self) -> bytes:
        return ("\n".join(self.state_commands()) + "\n").encode("ascii")

    def evaluate_enabled(
        self, assignment: Mapping[str, Fraction]
    ) -> tuple[tuple[str, bool], ...]:
        if not isinstance(assignment, Mapping):
            _fail("assignment must be a mapping")
        if any(type(variable) is not str for variable in assignment):
            _fail("assignment variable names must be strings")
        if set(assignment) != set(self.variable_order):
            missing = sorted(set(self.variable_order) - set(assignment))
            extra = sorted(set(assignment) - set(self.variable_order))
            _fail(f"assignment variable mismatch: missing={missing}, extra={extra}")
        values = tuple(assignment[variable] for variable in self.variable_order)
        if any(type(value) is not Fraction for value in values):
            _fail("assignment values must be exact Fraction values")
        by_id = {atom.atom_id: atom for atom in self.atoms}
        return tuple(
            (atom_id, _evaluate_atom(by_id[atom_id], values))
            for atom_id in self.enabled_atom_order
        )


def _smt_symbol(value: str) -> str:
    _identifier(value, "SMT symbol")
    return f"|{value}|"


def _smt_rational(value: Fraction) -> str:
    numerator = value.numerator
    denominator = value.denominator
    magnitude = str(abs(numerator))
    if denominator != 1:
        magnitude = f"(/ {magnitude} {denominator})"
    return f"(- {magnitude})" if numerator < 0 else magnitude


def _term_smt2(term: SparseTerm, variable_order: Sequence[str]) -> str:
    factors: list[str] = []
    for variable, power in zip(variable_order, term.powers, strict=True):
        if power == 1:
            factors.append(_smt_symbol(variable))
        elif power > 1:
            factors.append(f"(^ {_smt_symbol(variable)} {power})")
    number = _smt_rational(term.coefficient)
    if not factors:
        return number
    if term.coefficient == 1:
        return factors[0] if len(factors) == 1 else f"(* {' '.join(factors)})"
    return f"(* {number} {' '.join(factors)})"


def _polynomial_smt2(
    polynomial: SparsePolynomial, variable_order: Sequence[str]
) -> str:
    rendered = [_term_smt2(term, variable_order) for term in polynomial.terms]
    if not rendered:
        return "0"
    return rendered[0] if len(rendered) == 1 else f"(+ {' '.join(rendered)})"


def _atom_smt2(atom: NamedPolynomialAtom, variable_order: Sequence[str]) -> str:
    values = [
        _polynomial_smt2(polynomial, variable_order) for polynomial in atom.polynomials
    ]
    if atom.relation == "eq":
        return f"(= {values[0]} 0)"
    if atom.relation == "ge":
        return f"(>= {values[0]} 0)"
    if atom.relation == "gt":
        return f"(> {values[0]} 0)"
    if atom.relation == "ne":
        return f"(not (= {values[0]} 0))"
    if atom.relation == "or_ne":
        return f"(or (not (= {values[0]} 0)) (not (= {values[1]} 0)))"
    _fail(f"unsupported relation {atom.relation!r}")


def _evaluate_atom(atom: NamedPolynomialAtom, values: Sequence[Fraction]) -> bool:
    evaluations = tuple(polynomial.evaluate(values) for polynomial in atom.polynomials)
    if atom.relation == "eq":
        return evaluations[0] == 0
    if atom.relation == "ge":
        return evaluations[0] >= 0
    if atom.relation == "gt":
        return evaluations[0] > 0
    if atom.relation == "ne":
        return evaluations[0] != 0
    if atom.relation == "or_ne":
        return evaluations[0] != 0 or evaluations[1] != 0
    _fail(f"unsupported relation {atom.relation!r}")
