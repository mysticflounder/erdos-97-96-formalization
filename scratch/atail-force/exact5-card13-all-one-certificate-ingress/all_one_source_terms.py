#!/usr/bin/env python3
"""Shared source-term translation for the exact-card-13 all-one certificates.

The source variables and their packed Lean layouts are deliberately independent
of the older asymmetric/two-hit source module.  The only accepted row families
are ``m``, ``g0``, and ``g1``.  Their semantic meanings are fixed by
``ORBIT_SPECS`` below and recorded again in every generated JSON map.
"""

from __future__ import annotations

import itertools
from pathlib import Path
import re
import sys
from typing import Any

import z3


HERE = Path(__file__).resolve().parent
ORDINAL_SOURCE = HERE.parent / "exact5-all-one-ordinal-rank"
sys.path.insert(0, str(ORDINAL_SOURCE))

import all_one_ordinal_rank as ordinal  # noqa: E402


PAIRS = tuple(itertools.combinations(range(13), 2))
EDGE_INDEX = {pair: index for index, pair in enumerate(PAIRS)}

ORBIT_SPECS: dict[str, dict[str, Any]] = {
    "left": {
        "source_orbit": "allOneHitHubLeft",
        "lean_namespace": "Left",
        "cnf_orbit": "hubLeft",
        "hub": 1,
        "g0_spoke": 2,
        "g1_spoke": 3,
    },
    "middle": {
        "source_orbit": "allOneHitHubMiddle",
        "lean_namespace": "Middle",
        "cnf_orbit": "hubMiddle",
        "hub": 2,
        "g0_spoke": 1,
        "g1_spoke": 3,
    },
    "right": {
        "source_orbit": "allOneHitHubRight",
        "lean_namespace": "Right",
        "cnf_orbit": "hubRight",
        "hub": 3,
        "g0_spoke": 1,
        "g1_spoke": 2,
    },
}

EXPECTED_SOURCE_ASSERTIONS = 45_865
EXPECTED_SOURCE_VARIABLES = 626
EXPECTED_SOURCE_BITS = 1_139


def resolve_orbit(value: str) -> tuple[str, dict[str, Any]]:
    """Resolve either the short name or exact Python encoder orbit."""
    if value in ORBIT_SPECS:
        return value, ORBIT_SPECS[value]
    for short, spec in ORBIT_SPECS.items():
        if value == spec["source_orbit"]:
            return short, spec
    raise ValueError(f"unknown all-one orbit {value!r}")


def natural_key(name: str) -> tuple[object, ...]:
    return tuple(
        int(part) if part.isdigit() else part
        for part in re.split(r"(\d+)", name)
    )


def build_source_assertions(orbit: str) -> tuple[list[z3.BoolRef], dict[str, int]]:
    """Rebuild the exact source assertion stream with solver time disabled."""
    _short, spec = resolve_orbit(orbit)
    outer, _rank, counts = ordinal.build(spec["source_orbit"], 0, 0)
    expected_roles = {
        "hub": spec["hub"],
        "spoke1": spec["g0_spoke"],
        "spoke2": spec["g1_spoke"],
    }
    if outer.roles != expected_roles:
        raise AssertionError(
            f"encoder role drift for {spec['source_orbit']}: "
            f"{outer.roles!r} != {expected_roles!r}"
        )
    return list(outer.solver.assertions()), counts


def load_core(path: Path, requested_orbit: str) -> tuple[
    str, dict[str, Any], dict[str, Any], list[z3.BoolRef], dict[str, int]
]:
    """Load a source core and fail closed on orbit, q/w, or assertion drift."""
    short, spec = resolve_orbit(requested_orbit)
    payload = __import__("json").loads(path.read_text(encoding="utf-8"))
    if payload.get("orbit") != spec["source_orbit"]:
        raise ValueError(
            f"core orbit {payload.get('orbit')!r} does not match "
            f"{spec['source_orbit']!r}"
        )
    if payload.get("canonical_qw", False):
        raise ValueError(
            "canonical_qw cores are not accepted by this source-faithful ingress; "
            "the actual frontier q/w labels must be retained"
        )
    source, counts = build_source_assertions(short)
    selected: list[z3.BoolRef] = []
    seen: set[int] = set()
    for saved in payload.get("core", []):
        index = int(saved["index"])
        if not 0 <= index < len(source):
            raise ValueError(f"source assertion index out of range: {index}")
        if index in seen:
            raise ValueError(f"duplicate source assertion index: {index}")
        seen.add(index)
        assertion = source[index]
        if assertion.sexpr() != saved["assertion"]:
            raise AssertionError(f"source assertion drift at index {index}")
        selected.append(assertion)
    if not selected:
        raise ValueError("source core is empty")
    return short, spec, payload, selected, counts


def source_contract(spec: dict[str, Any]) -> dict[str, Any]:
    """Machine-readable statement of the Lean-to-source field alignment."""
    return {
        "boundary_frame": "original CanonicalCard13Frame; no role reindexing",
        "cnf_orbit": spec["cnf_orbit"],
        "hub_index": spec["hub"],
        "g0_spoke_index": spec["g0_spoke"],
        "g1_spoke_index": spec["g1_spoke"],
        "m_family": (
            "CanonicalAllOneSemanticRowTable.main; at fixed-H blocker-image "
            "centers it is synchronized to the actual fixed-H selected support"
        ),
        "g0_family": "independent cover row for hub and g0_spoke",
        "g1_family": "independent cover row for hub and g1_spoke",
        "blockers": "actual fixed-H blockerIndex in the original boundary frame",
        "shell": "complete exact-five second-apex radius class",
        "frontier_roles": "actual frontier q and w indices; not sorted or quotiented",
        "first_apex_row": "retained double-deletion first-apex row",
        "ranks": "ordinal ranks of all 78 distances in original boundary order",
    }


def atom(name: str) -> str:
    match = re.fullmatch(r"(m|g0|g1)_(\d+)_(\d+)", name)
    if match:
        family = {"m": 0, "g0": 1, "g1": 2}[match.group(1)]
        return f"rowBit rows {family} {match.group(2)} {match.group(3)}"
    match = re.fullmatch(r"blocker_(\d+)", name)
    if match:
        return f"blockerAt blockers {match.group(1)}"
    match = re.fullmatch(r"shell_(\d+)", name)
    if match:
        return f"shellBit shell {match.group(1)}"
    match = re.fullmatch(r"b1_(\d+)", name)
    if match:
        return f"firstRowBit b1 {match.group(1)}"
    if name == "frontier_q":
        return "q"
    if name == "frontier_w":
        return "w"
    match = re.fullmatch(r"ord_rank_(\d+)_(\d+)", name)
    if match:
        pair = tuple(sorted((int(match.group(1)), int(match.group(2)))))
        return f"rankAtom ranks {EDGE_INDEX[pair]}"
    raise ValueError(f"unsupported source atom {name!r}")


def value_width(expression: z3.ExprRef) -> int:
    if z3.is_bv(expression):
        return expression.size()
    if z3.is_int(expression):
        return 4
    raise ValueError(f"unsupported source value sort {expression.sort()}")


def emit_value(expression: z3.ExprRef, width: int | None = None) -> str:
    if z3.is_const(expression) and expression.decl().kind() == z3.Z3_OP_UNINTERPRETED:
        return atom(str(expression))
    if z3.is_int_value(expression):
        actual = 4 if width is None else width
        return f"{expression.as_long()}#{actual}"
    if z3.is_bv_value(expression):
        actual = expression.size()
        if width is not None and width != actual:
            raise ValueError(f"bit-vector numeral width mismatch: {expression}")
        return f"{expression.as_long()}#{actual}"
    raise ValueError(f"unsupported source value {expression.sexpr()}")


def join_bool(operator: str, items: list[str], identity: str) -> str:
    if not items:
        return identity
    if len(items) == 1:
        return items[0]
    return "(" + f" {operator} ".join(items) + ")"


def emit_bool(expression: z3.BoolRef) -> str:
    """Translate one source assertion to the packed Boolean Lean surface."""
    if z3.is_true(expression):
        return "true"
    if z3.is_false(expression):
        return "false"
    if z3.is_const(expression) and expression.decl().kind() == z3.Z3_OP_UNINTERPRETED:
        return atom(str(expression))
    if z3.is_not(expression):
        return f"!({emit_bool(expression.arg(0))})"
    if z3.is_and(expression):
        return join_bool("&&", [emit_bool(item) for item in expression.children()], "true")
    if z3.is_or(expression):
        return join_bool("||", [emit_bool(item) for item in expression.children()], "false")
    if z3.is_implies(expression):
        return f"(!({emit_bool(expression.arg(0))}) || ({emit_bool(expression.arg(1))}))"
    if z3.is_eq(expression):
        left, right = expression.children()
        if z3.is_bool(left):
            return f"({emit_bool(left)} == {emit_bool(right)})"
        width = max(value_width(left), value_width(right))
        return f"({emit_value(left, width)} == {emit_value(right, width)})"
    if z3.is_distinct(expression):
        items = expression.children()
        if len(items) != 2:
            raise ValueError("only binary Distinct is accepted")
        width = max(value_width(items[0]), value_width(items[1]))
        return f"!({emit_value(items[0], width)} == {emit_value(items[1], width)})"

    kind = expression.decl().kind()
    if kind in {z3.Z3_OP_LE, z3.Z3_OP_LT, z3.Z3_OP_GE, z3.Z3_OP_GT}:
        left, right = expression.children()
        width = max(value_width(left), value_width(right))
        left_text = emit_value(left, width)
        right_text = emit_value(right, width)
        if kind == z3.Z3_OP_LE:
            return f"({left_text}).ule ({right_text})"
        if kind == z3.Z3_OP_LT:
            return f"({left_text}).ult ({right_text})"
        if kind == z3.Z3_OP_GE:
            return f"({right_text}).ule ({left_text})"
        return f"({right_text}).ult ({left_text})"
    if kind in {z3.Z3_OP_ULT, z3.Z3_OP_UGT}:
        left, right = expression.children()
        if kind == z3.Z3_OP_UGT:
            left, right = right, left
        return f"({emit_value(left)}).ult ({emit_value(right)})"
    if kind in {z3.Z3_OP_PB_AT_MOST, z3.Z3_OP_PB_AT_LEAST, z3.Z3_OP_PB_EQ}:
        params = expression.decl().params()
        bound = int(params[0])
        weights = (
            [1] * len(expression.children())
            if kind in {z3.Z3_OP_PB_AT_MOST, z3.Z3_OP_PB_AT_LEAST}
            else [int(weight) for weight in params[1:]]
        )
        if weights != [1] * len(expression.children()):
            raise ValueError("only unit pseudo-Boolean weights are accepted")
        pieces = [
            f"(bif {emit_bool(item)} then 1#4 else 0#4)"
            for item in expression.children()
        ]
        total = "(" + " + ".join(pieces) + ")"
        if kind == z3.Z3_OP_PB_AT_MOST:
            return f"({total}).ule {bound}#4"
        if kind == z3.Z3_OP_PB_AT_LEAST:
            return f"({bound}#4).ule {total}"
        return f"({total} == {bound}#4)"
    raise ValueError(
        f"unsupported source Boolean operation {expression.decl().name()}: "
        f"{expression.sexpr()}"
    )
