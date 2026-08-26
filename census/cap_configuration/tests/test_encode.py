from __future__ import annotations

import copy
import os
import subprocess
import sys
from fractions import Fraction

import pytest
import sympy as sp

from census.cap_configuration.encode import (
    CapConfigurationEncodingError,
    NamedPolynomialAtom,
    PolynomialSystem,
    SparsePolynomial,
)


def _polynomial(expression: sp.Expr | int, variables: tuple[sp.Symbol, ...]):
    return SparsePolynomial.from_sympy(expression, variables)


def _single_atom_system(
    relation: str,
    expressions: tuple[sp.Expr, ...],
) -> PolynomialSystem:
    (x,) = sorted(
        set().union(*(expression.free_symbols for expression in expressions)), key=str
    )
    atom = NamedPolynomialAtom(
        atom_id=f"atom_{relation}",
        relation=relation,
        polynomials=tuple(_polynomial(expression, (x,)) for expression in expressions),
        family="fixture",
        source_provenance=f"fixture.{relation}",
    )
    return PolynomialSystem(
        variable_order=(str(x),),
        atoms=(atom,),
        enabled_atom_order=(atom.atom_id,),
        omitted_atom_order=(),
        omitted_source_predicates=(),
    )


@pytest.mark.parametrize(
    ("relation", "expressions", "true_value", "false_value"),
    [
        ("eq", lambda x: (x - 1,), Fraction(1), Fraction(2)),
        ("ge", lambda x: (x - 1,), Fraction(1), Fraction(0)),
        ("gt", lambda x: (x - 1,), Fraction(2), Fraction(1)),
        ("ne", lambda x: (x - 1,), Fraction(2), Fraction(1)),
        ("or_ne", lambda x: (x - 1, 2 * x - 2), Fraction(2), Fraction(1)),
    ],
)
def test_exact_fraction_evaluator_covers_each_relation_both_ways(
    relation: str,
    expressions,
    true_value: Fraction,
    false_value: Fraction,
) -> None:
    x = sp.Symbol("x")
    system = _single_atom_system(relation, expressions(x))
    assert system.evaluate_enabled({"x": true_value}) == ((f"atom_{relation}", True),)
    assert system.evaluate_enabled({"x": false_value}) == ((f"atom_{relation}", False),)


def test_sparse_polynomial_is_exact_stable_and_expression_independent() -> None:
    x, y = sp.symbols("x y")
    expanded = _polynomial((x + y) ** 2 - y**2 + Fraction(1, 3), (x, y))
    direct = _polynomial(x**2 + 2 * x * y + Fraction(1, 3), (x, y))
    assert expanded == direct
    assert direct.to_record() == {
        "terms": [
            {"coefficient": {"denominator": 1, "numerator": 1}, "powers": [2, 0]},
            {"coefficient": {"denominator": 1, "numerator": 2}, "powers": [1, 1]},
            {"coefficient": {"denominator": 3, "numerator": 1}, "powers": [0, 0]},
        ]
    }
    assert direct.evaluate((Fraction(2), Fraction(3))) == Fraction(49, 3)


def test_polynomial_variable_identity_is_bound_even_for_zero_polynomials() -> None:
    x = sp.Symbol("x")
    x_polynomial = _polynomial(x, (x,))
    zero_polynomial = _polynomial(0, (x,))
    assert x_polynomial.variable_order == ("x",)
    assert zero_polynomial.variable_order == ("x",)
    assert zero_polynomial.width == 1
    assert zero_polynomial.to_record() == {"terms": []}

    atom = NamedPolynomialAtom(
        atom_id="renamed",
        relation="eq",
        polynomials=(x_polynomial,),
        family="fixture",
        source_provenance="fixture.renamed",
    )
    with pytest.raises(CapConfigurationEncodingError, match="variable order"):
        PolynomialSystem(("y",), (atom,), ("renamed",), (), ())


def test_system_round_trip_ledgers_and_state_only_journal() -> None:
    x, y = sp.symbols("x y")
    enabled = NamedPolynomialAtom(
        atom_id="sum_positive",
        relation="gt",
        polynomials=(_polynomial(x + y - Fraction(1, 2), (x, y)),),
        family="fixture",
        source_provenance="fixture.sum_positive",
    )
    omitted = NamedPolynomialAtom(
        atom_id="deliberately_omitted",
        relation="eq",
        polynomials=(_polynomial(x - y, (x, y)),),
        family="fixture",
        source_provenance="fixture.deliberately_omitted",
    )
    system = PolynomialSystem(
        variable_order=("x", "y"),
        atoms=(enabled, omitted),
        enabled_atom_order=("sum_positive",),
        omitted_atom_order=("deliberately_omitted",),
        omitted_source_predicates=("source.strict_triangle_inequality",),
    )
    assert PolynomialSystem.from_record(system.to_record()) == system
    assert system.state_smt2_bytes() == (
        b"(set-option :nl-cov true)\n"
        b"(set-logic QF_NRA)\n"
        b"(declare-fun |x| () Real)\n"
        b"(declare-fun |y| () Real)\n"
        b"(assert (! (> (+ |x| |y| (- (/ 1 2))) 0) :named |sum_positive|))\n"
    )
    journal = system.state_smt2_bytes()
    assert b"check-sat" not in journal
    assert b"get-unsat-core" not in journal
    assert b"produce-unsat-cores" not in journal


@pytest.mark.parametrize(
    ("relation", "arity"),
    [("eq", 2), ("ge", 2), ("gt", 0), ("ne", 2), ("or_ne", 1)],
)
def test_relation_grammar_rejects_wrong_arities(relation: str, arity: int) -> None:
    x = sp.Symbol("x")
    polynomial = _polynomial(x, (x,))
    with pytest.raises(CapConfigurationEncodingError):
        NamedPolynomialAtom(
            atom_id="bad",
            relation=relation,
            polynomials=(polynomial,) * arity,
            family="fixture",
            source_provenance="fixture.bad",
        )


def test_relation_grammar_rejects_unknown_relation_instead_of_falling_through() -> None:
    x = sp.Symbol("x")
    with pytest.raises(CapConfigurationEncodingError, match="unsupported relation"):
        NamedPolynomialAtom(
            atom_id="bad",
            relation="xor_ne",
            polynomials=(_polynomial(x, (x,)),),
            family="fixture",
            source_provenance="fixture.bad",
        )


def test_relation_grammar_rejects_string_subclasses() -> None:
    class RelationSubclass(str):
        pass

    x = sp.Symbol("x")
    with pytest.raises(CapConfigurationEncodingError, match="unsupported relation"):
        NamedPolynomialAtom(
            atom_id="bad",
            relation=RelationSubclass("eq"),
            polynomials=(_polynomial(x, (x,)),),
            family="fixture",
            source_provenance="fixture.bad",
        )


@pytest.mark.parametrize(
    "expression",
    [
        lambda x, y: x + y,
        lambda x, _y: 1 / x,
        lambda x, _y: sp.sqrt(2) * x,
        lambda x, _y: 0.5 * x,
    ],
)
def test_sympy_conversion_rejects_undeclared_nonpolynomial_or_inexact_input(
    expression,
) -> None:
    x, y = sp.symbols("x y")
    with pytest.raises(CapConfigurationEncodingError):
        _polynomial(expression(x, y), (x,))


@pytest.mark.parametrize(
    "expression",
    [
        None,
        [],
        sp.true,
        sp.And(sp.Symbol("x") > 0, sp.Symbol("x") < 1),
        sp.Eq(sp.Symbol("x"), 1),
    ],
)
def test_sympy_conversion_rejects_non_arithmetic_shapes_with_typed_error(
    expression: object,
) -> None:
    x = sp.Symbol("x")
    with pytest.raises(CapConfigurationEncodingError, match="polynomial input"):
        SparsePolynomial.from_sympy(expression, (x,))


@pytest.mark.parametrize("bad_name", ["", "a-b", "9x", "x y", "x|y"])
def test_unsafe_variable_identifiers_are_rejected(bad_name: str) -> None:
    x = sp.Symbol("x")
    atom = NamedPolynomialAtom(
        atom_id="atom",
        relation="eq",
        polynomials=(_polynomial(x, (x,)),),
        family="fixture",
        source_provenance="fixture.atom",
    )
    with pytest.raises(CapConfigurationEncodingError):
        PolynomialSystem(
            variable_order=(bad_name,),
            atoms=(atom,),
            enabled_atom_order=("atom",),
            omitted_atom_order=(),
            omitted_source_predicates=(),
        )


def test_identifier_collision_unused_variable_and_bad_omission_fail_closed() -> None:
    x = sp.Symbol("x")
    polynomial = _polynomial(x, (x,))
    colliding = NamedPolynomialAtom(
        atom_id="x",
        relation="eq",
        polynomials=(polynomial,),
        family="fixture",
        source_provenance="fixture.x",
    )
    with pytest.raises(CapConfigurationEncodingError, match="collide"):
        PolynomialSystem(("x",), (colliding,), ("x",), (), ())

    atom = NamedPolynomialAtom(
        atom_id="atom",
        relation="eq",
        polynomials=(polynomial,),
        family="fixture",
        source_provenance="fixture.atom",
    )
    with pytest.raises(CapConfigurationEncodingError, match="variable order"):
        PolynomialSystem(("x", "y"), (atom,), ("atom",), (), ())
    with pytest.raises(
        CapConfigurationEncodingError, match="ordered enabled complement"
    ):
        PolynomialSystem(("x",), (atom,), ("atom",), ("atom",), ())


def test_record_validator_rejects_unknown_keys_bool_powers_and_unreduced_rationals() -> (
    None
):
    x = sp.Symbol("x")
    system = _single_atom_system("eq", (x - 1,))

    unknown = copy.deepcopy(system.to_record())
    unknown["surprise"] = True
    with pytest.raises(CapConfigurationEncodingError, match="keys mismatch"):
        PolynomialSystem.from_record(unknown)

    bool_power = copy.deepcopy(system.to_record())
    bool_power["atoms"][0]["polynomials"][0]["terms"][0]["powers"][0] = True
    with pytest.raises(CapConfigurationEncodingError, match="must be an integer"):
        PolynomialSystem.from_record(bool_power)

    unreduced = copy.deepcopy(system.to_record())
    coefficient = unreduced["atoms"][0]["polynomials"][0]["terms"][0]["coefficient"]
    coefficient["numerator"] = 2
    coefficient["denominator"] = 2
    with pytest.raises(CapConfigurationEncodingError, match="not a reduced"):
        PolynomialSystem.from_record(unreduced)


def test_assignment_requires_complete_exact_fraction_map() -> None:
    x = sp.Symbol("x")
    system = _single_atom_system("eq", (x - 1,))
    with pytest.raises(CapConfigurationEncodingError, match="mismatch"):
        system.evaluate_enabled({})
    with pytest.raises(CapConfigurationEncodingError, match="names must be strings"):
        system.evaluate_enabled({1: Fraction(1)})
    with pytest.raises(CapConfigurationEncodingError, match="exact Fraction"):
        system.evaluate_enabled({"x": 1})


def test_encoding_is_identical_across_python_hash_seeds() -> None:
    script = """
from fractions import Fraction
import hashlib
import sympy as sp
from census.cap_configuration.encode import NamedPolynomialAtom, PolynomialSystem, SparsePolynomial
x, y = sp.symbols('x y')
p = SparsePolynomial.from_sympy(x*x + 2*x*y + Fraction(1, 3), (x, y))
a = NamedPolynomialAtom('stable', 'eq', (p,), 'fixture', 'fixture.stable')
s = PolynomialSystem(('x', 'y'), (a,), ('stable',), (), ())
print(hashlib.sha256(s.state_smt2_bytes()).hexdigest())
"""
    digests = []
    for seed in ("1", "2", "3"):
        environment = os.environ.copy()
        environment["PYTHONHASHSEED"] = seed
        result = subprocess.run(
            [sys.executable, "-c", script],
            check=True,
            capture_output=True,
            text=True,
            env=environment,
        )
        digests.append(result.stdout.strip())
    assert len(set(digests)) == 1
