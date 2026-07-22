#!/usr/bin/env python3
"""Generate a verified-library BVLogicalExpr for the direct pass-5 core.

The output is source data for Lean's already-proved `BVLogicalExpr.bitblast`
and `AIG.toCNF` pipeline.  Pseudo-Boolean constraints are lowered to Boolean
threshold expressions; no external Tseitin transformation is retained.
"""

from __future__ import annotations

import argparse
import json
from pathlib import Path
import re
import sys

import z3


HERE = Path(__file__).resolve().parent
SOURCE = HERE.parent / "exact5-card13-same-radius-terminal"
sys.path.insert(0, str(SOURCE))

import asymmetric_ordinal_rank as ordinal  # noqa: E402


def natural_key(name: str) -> tuple[object, ...]:
    return tuple(int(part) if part.isdigit() else part for part in re.split(r"(\d+)", name))


class Emitter:
    def __init__(self, variables: dict[str, dict[str, object]]) -> None:
        self.variables = variables
        self.seen_operators: set[str] = set()

    def variable(self, expression: z3.ExprRef) -> dict[str, object]:
        name = str(expression)
        try:
            return self.variables[name]
        except KeyError as exc:
            raise ValueError(f"unregistered variable {name!r}") from exc

    def value(self, expression: z3.ExprRef, width: int | None = None) -> str:
        if z3.is_const(expression) and expression.decl().kind() == z3.Z3_OP_UNINTERPRETED:
            variable = self.variable(expression)
            actual = int(variable["width"])
            if width is not None and actual != width:
                raise ValueError(f"width mismatch for {expression}: {actual} != {width}")
            return f"(.var {variable['index']} : BVExpr {actual})"
        if z3.is_int_value(expression):
            if width is None:
                width = 4
            return f"(.const {expression.as_long()}#{width})"
        if z3.is_bv_value(expression):
            actual = expression.size()
            if width is not None and actual != width:
                raise ValueError(f"numeral width mismatch: {expression}")
            return f"(.const {expression.as_long()}#{actual})"
        raise ValueError(f"unsupported value expression: {expression.sexpr()}")

    def width(self, expression: z3.ExprRef) -> int:
        if z3.is_bv(expression):
            return expression.size()
        if z3.is_int(expression):
            return 4
        raise ValueError(f"unsupported value sort {expression.sort()}")

    def boolean(self, expression: z3.BoolRef) -> str:
        if z3.is_true(expression):
            return "(.const true)"
        if z3.is_false(expression):
            return "(.const false)"
        if z3.is_const(expression) and expression.decl().kind() == z3.Z3_OP_UNINTERPRETED:
            variable = self.variable(expression)
            if variable["sort"] != "Bool":
                raise ValueError(f"non-Boolean atom in Boolean position: {expression}")
            return f"bvar {variable['index']}"
        if z3.is_not(expression):
            self.seen_operators.add("not")
            return f"bnot ({self.boolean(expression.arg(0))})"
        if z3.is_and(expression):
            self.seen_operators.add("and")
            items = ", ".join(self.boolean(item) for item in expression.children())
            return f"bands [{items}]"
        if z3.is_or(expression):
            self.seen_operators.add("or")
            items = ", ".join(self.boolean(item) for item in expression.children())
            return f"bors [{items}]"
        if z3.is_implies(expression):
            self.seen_operators.add("implies")
            left, right = expression.children()
            return f"bimplies ({self.boolean(left)}) ({self.boolean(right)})"
        if z3.is_eq(expression):
            left, right = expression.children()
            if z3.is_bool(left):
                self.seen_operators.add("bool-eq")
                return f"bbeq ({self.boolean(left)}) ({self.boolean(right)})"
            self.seen_operators.add("bv-eq")
            width = max(self.width(left), self.width(right))
            return f"bveq ({self.value(left, width)}) ({self.value(right, width)})"

        kind = expression.decl().kind()
        if kind in {z3.Z3_OP_ULT, z3.Z3_OP_UGT}:
            left, right = expression.children()
            self.seen_operators.add("bv-ult")
            if kind == z3.Z3_OP_UGT:
                left, right = right, left
            return f"bvult ({self.value(left)}) ({self.value(right)})"
        if kind in {z3.Z3_OP_PB_AT_MOST, z3.Z3_OP_PB_AT_LEAST, z3.Z3_OP_PB_EQ}:
            params = expression.decl().params()
            bound = int(params[0])
            weights = (
                [1] * len(expression.children())
                if kind in {z3.Z3_OP_PB_AT_MOST, z3.Z3_OP_PB_AT_LEAST}
                else [int(weight) for weight in params[1:]]
            )
            if weights != [1] * len(expression.children()):
                raise ValueError("only unit pseudo-Boolean weights are supported")
            items = ", ".join(self.boolean(item) for item in expression.children())
            if kind == z3.Z3_OP_PB_AT_MOST:
                self.seen_operators.add("pb-at-most-unit")
                return f"atMost [{items}] {bound}"
            if kind == z3.Z3_OP_PB_AT_LEAST:
                self.seen_operators.add("pb-at-least-unit")
                return f"atLeast [{items}] {bound}"
            self.seen_operators.add("pb-exact-unit")
            return f"exactly [{items}] {bound}"
        raise ValueError(
            f"unsupported Boolean operation {expression.decl().name()}: {expression.sexpr()}"
        )


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--core",
        type=Path,
        default=SOURCE / "direct.source-core.pass5.json",
    )
    parser.add_argument(
        "--output-lean",
        type=Path,
        default=HERE / "VerifiedPass5Direct.lean",
    )
    parser.add_argument(
        "--output-map",
        type=Path,
        default=HERE / "verified-pass5-direct-variable-map.json",
    )
    parser.add_argument("--chunk-size", type=int, default=64)
    parser.add_argument(
        "--limit",
        type=int,
        help="emit only the first N saved assertions for a bounded architecture smoke",
    )
    parser.add_argument(
        "--no-certificate",
        action="store_true",
        help="omit the embedded LRAT theorem while reproducing/exporting the full CNF",
    )
    args = parser.parse_args()

    payload = json.loads(args.core.read_text(encoding="utf-8"))
    if payload["orbit"] != "asymmetricSourceLeft":
        raise ValueError("this first verified compiler checkpoint is direct/source-left only")
    outer, _ranks, _counts = ordinal.build(payload["orbit"], 0)
    all_assertions = list(outer.solver.assertions())
    assertions: list[z3.BoolRef] = []
    atoms: dict[str, z3.ExprRef] = {}

    def collect(expression: z3.ExprRef) -> None:
        if z3.is_const(expression) and expression.decl().kind() == z3.Z3_OP_UNINTERPRETED:
            atoms[str(expression)] = expression
        for child in expression.children():
            collect(child)

    selected_core = payload["core"]
    if args.limit is not None:
        selected_core = selected_core[:args.limit]
    for saved in selected_core:
        assertion = all_assertions[saved["index"]]
        if assertion.sexpr() != saved["assertion"]:
            raise AssertionError(f"source assertion drift at index {saved['index']}")
        assertions.append(assertion)
        collect(assertion)

    variables: dict[str, dict[str, object]] = {}
    for index, name in enumerate(sorted(atoms, key=natural_key)):
        atom = atoms[name]
        if z3.is_bool(atom):
            sort = "Bool"
            width = 1
        elif z3.is_int(atom):
            sort = "Int-as-unsigned-4"
            width = 4
        elif z3.is_bv(atom):
            sort = f"BitVec({atom.size()})"
            width = atom.size()
        else:
            raise ValueError(f"unsupported source variable sort: {atom.sort()}")
        variables[name] = {"index": index, "sort": sort, "width": width}

    emitter = Emitter(variables)
    terms = [emitter.boolean(assertion) for assertion in assertions]
    chunks = [
        terms[start:start + args.chunk_size]
        for start in range(0, len(terms), args.chunk_size)
    ]
    chunk_names = [f"directChunk{index:03d}" for index in range(len(chunks))]
    chunk_definitions = []
    chunk_theorems = []
    for name, chunk in zip(chunk_names, chunks, strict=True):
        rendered = ",\n    ".join(chunk)
        assertions_name = name + "Assertions"
        chunk_definitions.append(f"""def {assertions_name} : List BVLogicalExpr :=
  [ {rendered} ]

def {name} : BVLogicalExpr := bands {assertions_name}
""")
        chunk_theorems.append(f"""theorem {name}_sat_of_each (source : BVExpr.Assignment)
    (h : ∀ item ∈ {assertions_name}, item.eval source = true) :
    {name}.eval source = true :=
  bands_sat_of_each source {assertions_name} h
""")
    rendered_chunk_names = ", ".join(chunk_names)
    chunk_hypotheses = "\n".join(
        f"    (h{index:03d} : {name}.eval source = true)"
        for index, name in enumerate(chunk_names)
    )
    chunk_hypothesis_names = ", ".join(
        f"h{index:03d}" for index in range(len(chunk_names))
    )
    chunk_definitions_text = "\n".join(chunk_definitions)
    chunk_theorems_text = "\n".join(chunk_theorems)
    certificate_text = ""
    if args.limit is None and not args.no_certificate:
        certificate_text = """
def directLrat : String := include_str "verified-pass5-direct-cadical.lrat"

/-- Kernel-checked UNSAT theorem for the verified pass-5 source expression. -/
theorem directExpr_unsat : directExpr.Unsat := by
  apply Reflect.unsat_of_verifyBVExpr_eq_true directExpr directLrat
  native_decide

#print axioms directExpr_unsat
"""
    lean = f"""/-
Generated from direct.source-core.pass5.json.

This file is data for Lean's verified BVLogicalExpr -> AIG -> CNF pipeline.
Pseudo-Boolean constraints are lowered by the proved-by-definition `atLeast`
recursion below.  No Z3 Tseitin clauses are imported.
-/
import Std.Tactic.BVDecide.Reflect

open Std.Sat

namespace Problem97.ATailExactFiveVerifiedPass5

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

abbrev bvar (index : Nat) : BVLogicalExpr :=
  .literal (.getLsbD (.var index : BVExpr 1) 0)

abbrev bnot (value : BVLogicalExpr) : BVLogicalExpr := .not value
abbrev band (left right : BVLogicalExpr) : BVLogicalExpr := .gate .and left right
abbrev bor (left right : BVLogicalExpr) : BVLogicalExpr := .gate .or left right
abbrev bbeq (left right : BVLogicalExpr) : BVLogicalExpr := .gate .beq left right
abbrev bimplies (left right : BVLogicalExpr) : BVLogicalExpr := bor (bnot left) right

def bands : List BVLogicalExpr → BVLogicalExpr
  | [] => .const true
  | item :: items => band item (bands items)

def bors : List BVLogicalExpr → BVLogicalExpr
  | [] => .const false
  | item :: items => bor item (bors items)

abbrev bveq {{width : Nat}} (left right : BVExpr width) : BVLogicalExpr :=
  .literal (.bin left .eq right)

abbrev bvult {{width : Nat}} (left right : BVExpr width) : BVLogicalExpr :=
  .literal (.bin left .ult right)

/-- Boolean unary threshold: at least `bound` inputs are true. -/
def atLeast : List BVLogicalExpr → Nat → BVLogicalExpr
  | _, 0 => .const true
  | [], _ + 1 => .const false
  | item :: items, bound + 1 =>
      bor (band item (atLeast items bound)) (atLeast items (bound + 1))

def atMost (items : List BVLogicalExpr) (bound : Nat) : BVLogicalExpr :=
  bnot (atLeast items (bound + 1))

def exactly (items : List BVLogicalExpr) (bound : Nat) : BVLogicalExpr :=
  band (atLeast items bound) (bnot (atLeast items (bound + 1)))

theorem bands_sat_of_each (source : BVExpr.Assignment) :
    ∀ items : List BVLogicalExpr,
      (∀ item ∈ items, item.eval source = true) → (bands items).eval source = true := by
  intro items h
  induction items with
  | nil => rfl
  | cons item items ih =>
      simp only [bands, BVLogicalExpr.eval_gate, Gate.eval, Bool.and_eq_true]
      exact ⟨h item (by simp), ih (fun candidate hc => h candidate (by simp [hc]))⟩

{chunk_definitions_text}

def directChunks : List BVLogicalExpr := [{rendered_chunk_names}]

def directExpr : BVLogicalExpr := bands directChunks

{chunk_theorems_text}

theorem directExpr_sat_of_chunks (source : BVExpr.Assignment)
{chunk_hypotheses} : directExpr.eval source = true := by
  simp [directExpr, directChunks, bands, BVLogicalExpr.eval_gate, Gate.eval,
    {chunk_hypothesis_names}]

{certificate_text}

def directCnf : CNF Nat := AIG.toCNF directExpr.bitblast.relabelNat

def literalToDimacs (literal : Nat × Bool) : String :=
  if literal.2 then toString (literal.1 + 1) else "-" ++ toString (literal.1 + 1)

def clauseToDimacs (clause : CNF.Clause Nat) : String :=
  String.intercalate " " (clause.map literalToDimacs) ++ " 0"

def maxVariable (cnf : CNF Nat) : Nat :=
  cnf.foldl (fun current clause =>
    clause.foldl (fun current literal => Nat.max current (literal.1 + 1)) current) 0

def directDimacs : String :=
  let header := s!"p cnf {{maxVariable directCnf}} {{directCnf.length}}"
  String.intercalate "\n" (header :: directCnf.map clauseToDimacs) ++ "\n"

def run (arguments : List String) : IO Unit := do
  match arguments with
  | [output] => IO.FS.writeFile output directDimacs
  | _ => throw <| IO.userError "usage: VerifiedPass5Direct <output.cnf>"

end Problem97.ATailExactFiveVerifiedPass5

def Problem97.ATailExactFiveVerifiedPass5.verifierMain
    (arguments : List String) : IO Unit :=
  Problem97.ATailExactFiveVerifiedPass5.run arguments
"""
    args.output_lean.write_text(lean, encoding="utf-8")
    mapping = {
        "schema": "p97-exact5-pass5-verified-bvlogicalexpr-map-v1",
        "orbit": payload["orbit"],
        "source_core": str(args.core),
        "source_assertions": len(assertions),
        "chunk_size": args.chunk_size,
        "chunks": len(chunks),
        "source_variables": len(variables),
        "source_bits": sum(int(item["width"]) for item in variables.values()),
        "lowered_operators": sorted(emitter.seen_operators),
        "unsupported_operators": [],
        "variables": variables,
    }
    args.output_map.write_text(json.dumps(mapping, indent=2, sort_keys=True) + "\n")
    print(json.dumps({key: mapping[key] for key in (
        "source_assertions", "source_variables", "source_bits",
        "lowered_operators", "unsupported_operators",
    )}, sort_keys=True))


if __name__ == "__main__":
    main()
