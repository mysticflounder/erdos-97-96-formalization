#!/usr/bin/env python3
"""Translate a saved source-assertion core directly to a Lean BitVec circuit.

Unlike ``generate_bv_circuit.py``, this generator consumes the original Z3
ASTs built by ``asymmetric_ordinal_rank.py``.  It checks each saved core index
against the saved SMT expression before translation.  This gives a compact,
theorem-sized kernel checkpoint without routing through Tseitin DIMACS.
"""

from __future__ import annotations

import argparse
import itertools
import json
from pathlib import Path
import re

import z3

import asymmetric_ordinal_rank as ordinal


HERE = Path(__file__).resolve().parent
PAIRS = tuple(itertools.combinations(range(13), 2))
EDGE_INDEX = {pair: index for index, pair in enumerate(PAIRS)}
ARGS = (
    "(rows : RowBits) (blockers : BlockerBits) (shell : ShellBits) "
    "(q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)"
)


def join_bool(operator: str, items: list[str], identity: str) -> str:
    if not items:
        return identity
    if len(items) == 1:
        return items[0]
    return "(" + f" {operator} ".join(items) + ")"


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


def numeral(expression: z3.ExprRef, width: int) -> str:
    if z3.is_int_value(expression):
        return f"{expression.as_long()}#{width}"
    if z3.is_bv_value(expression):
        if expression.size() != width:
            raise ValueError(f"unexpected numeral width in {expression}")
        return f"{expression.as_long()}#{width}"
    raise ValueError(f"not a numeral: {expression}")


def emit_value(expression: z3.ExprRef, width: int | None = None) -> str:
    if z3.is_const(expression) and expression.decl().kind() == z3.Z3_OP_UNINTERPRETED:
        return atom(str(expression))
    if z3.is_int_value(expression):
        if width is None:
            width = 4
        return numeral(expression, width)
    if z3.is_bv_value(expression):
        return numeral(expression, expression.size())
    raise ValueError(f"unsupported value expression: {expression.sexpr()}")


def value_width(expression: z3.ExprRef) -> int:
    if z3.is_bv(expression):
        return expression.size()
    # Every source integer is encoded in four unsigned bits: blockers and the
    # two frontier roles all range over thirteen labels.
    if z3.is_int(expression):
        return 4
    raise ValueError(f"unsupported value sort: {expression.sort()}")


def emit_bool(expression: z3.BoolRef) -> str:
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
            raise ValueError("only binary Distinct is expected")
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
        if kind == z3.Z3_OP_ULT:
            return f"({emit_value(left)}).ult ({emit_value(right)})"
        return f"({emit_value(right)}).ult ({emit_value(left)})"
    if kind in {z3.Z3_OP_PB_AT_MOST, z3.Z3_OP_PB_AT_LEAST, z3.Z3_OP_PB_EQ}:
        params = expression.decl().params()
        bound = int(params[0])
        weights = (
            [1] * len(expression.children())
            if kind in {z3.Z3_OP_PB_AT_MOST, z3.Z3_OP_PB_AT_LEAST}
            else [int(weight) for weight in params[1:]]
        )
        if weights != [1] * len(expression.children()):
            raise ValueError("only unit pseudo-Boolean weights are expected")
        pieces = [f"(bif {emit_bool(item)} then 1#4 else 0#4)"
                  for item in expression.children()]
        total = "(" + " + ".join(pieces) + ")"
        if kind == z3.Z3_OP_PB_AT_MOST:
            return f"({total}).ule {bound}#4"
        if kind == z3.Z3_OP_PB_AT_LEAST:
            return f"({bound}#4).ule {total}"
        return f"({total} == {bound}#4)"
    raise ValueError(
        f"unsupported Boolean operation {kind}: {expression.sexpr()}"
    )


def write_chunk(directory: Path, prefix: str, number: int, terms: list[str]) -> str:
    name = f"{prefix}{number:03d}"
    module = name[0].upper() + name[1:]
    body = " &&\n    ".join(terms) if terms else "true"
    text = f"""/- Generated directly from a saved Z3 source-assertion core. -/
import ExactFiveCard13BVCircuitChunks.Base

namespace Problem97.ATailExactFiveCard13BVCircuit

set_option maxRecDepth 100000
set_option maxHeartbeats 0
set_option linter.unusedVariables false

def {name} {ARGS} : Bool :=
  {body}

@[bv_normalize]
theorem {name}_eq {ARGS} :
    {name} rows blockers shell q w b1 ranks = ({body}) := rfl

end Problem97.ATailExactFiveCard13BVCircuit
"""
    (directory / f"{module}.lean").write_text(text, encoding="utf-8")
    return name


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--core", type=Path, required=True)
    parser.add_argument("--prefix", choices=("direct", "mirror"), required=True)
    parser.add_argument("--chunk-size", type=int, default=64)
    parser.add_argument(
        "--emit-flat",
        action="store_true",
        help=(
            "also emit a coordinator with one hypothesis per source assertion; "
            "this avoids unfolding the chunk definitions before bv_decide"
        ),
    )
    args = parser.parse_args()
    payload = json.loads(args.core.read_text(encoding="utf-8"))
    orbit = payload["orbit"]
    outer, _ranks, _counts = ordinal.build(orbit, 0)
    assertions = list(outer.solver.assertions())
    selected: list[z3.BoolRef] = []
    for saved in payload["core"]:
        assertion = assertions[saved["index"]]
        if assertion.sexpr() != saved["assertion"]:
            raise AssertionError(
                f"source assertion drift at index {saved['index']}"
            )
        selected.append(assertion)
    terms = [emit_bool(assertion) for assertion in selected]

    directory = HERE / "ExactFiveCard13BVSourceCoreChunks"
    directory.mkdir(exist_ok=True)
    file_prefix = args.prefix.title()
    for stale in directory.glob(f"{file_prefix}[0-9][0-9][0-9].lean"):
        stale.unlink()
    names = [
        write_chunk(directory, args.prefix, number, terms[start:start + args.chunk_size])
        for number, start in enumerate(range(0, len(terms), args.chunk_size))
    ]
    imports = "\n".join(
        f"import ExactFiveCard13BVSourceCoreChunks.{name[0].upper() + name[1:]}"
        for name in names
    )
    body = " &&\n    ".join(
        f"{name} rows blockers shell q w b1 ranks" for name in names
    )
    main_file = HERE / f"ExactFiveCard13BVSourceCore{args.prefix.title()}.lean"
    main_file.write_text(f"""/- Generated directly from a saved Z3 source-assertion core. -/
{imports}
import Mathlib.Tactic

namespace Problem97.ATailExactFiveCard13BVCircuit

set_option maxRecDepth 100000

def {args.prefix}CoreAntecedent {ARGS} : Bool :=
  {body}

@[bv_normalize]
theorem {args.prefix}CoreAntecedent_eq {ARGS} :
    {args.prefix}CoreAntecedent rows blockers shell q w b1 ranks = ({body}) := rfl

set_option trace.Meta.Tactic.bv true in
set_option trace.Meta.Tactic.sat true in
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem {args.prefix}CoreAntecedent_false {ARGS} :
    {args.prefix}CoreAntecedent rows blockers shell q w b1 ranks = false := by
  bv_decide? (config := {{ maxSteps := 100000000, timeout := 600 }})

end Problem97.ATailExactFiveCard13BVCircuit
""", encoding="utf-8")
    flat_file = None
    if args.emit_flat:
        flat_file = HERE / f"ExactFiveCard13BVSourceCore{args.prefix.title()}Flat.lean"
        hypotheses = "\n".join(
            f"    (h{index:04d} : ({term}) = true)"
            for index, term in enumerate(terms)
        )
        flat_file.write_text(f"""/-
Generated directly from a saved Z3 source-assertion core.

Unlike the chunked coordinator, this theorem exposes every source assertion
as a separate hypothesis.  The final tactic therefore does not unfold any
generated aggregate definition before bit-blasting.
-/
import ExactFiveCard13BVCircuitChunks.Base
import Mathlib.Tactic

namespace Problem97.ATailExactFiveCard13BVCircuit

set_option maxRecDepth 100000
set_option linter.unusedVariables false

set_option trace.Meta.Tactic.bv true in
set_option trace.Meta.Tactic.sat true in
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem {args.prefix}FlatSourceCore_false {ARGS}
{hypotheses} : False := by
  bv_decide? (config := {{ maxSteps := 100000000, timeout := 600 }})

end Problem97.ATailExactFiveCard13BVCircuit
""", encoding="utf-8")
    print(json.dumps({
        "orbit": orbit,
        "source_assertions": len(assertions),
        "core_assertions": len(selected),
        "chunks": len(names),
        "main": str(main_file),
        "flat": None if flat_file is None else str(flat_file),
    }, sort_keys=True))


if __name__ == "__main__":
    main()
