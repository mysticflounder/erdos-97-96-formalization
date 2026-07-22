#!/usr/bin/env python3
"""Emit a verified-library BVLogicalExpr for one all-one source core."""

from __future__ import annotations

import argparse
import hashlib
import json
import os
from pathlib import Path

import z3

from all_one_source_terms import (
    load_core,
    natural_key,
    source_contract,
)


HERE = Path(__file__).resolve().parent


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def sha256_paths(paths: list[Path]) -> str:
    digest = hashlib.sha256()
    for path in paths:
        with path.open("rb") as stream:
            while block := stream.read(1024 * 1024):
                digest.update(block)
    return digest.hexdigest()


class Emitter:
    """Translate the supported source Z3 AST directly to BVLogicalExpr."""

    def __init__(self, variables: dict[str, dict[str, object]]) -> None:
        self.variables = variables
        self.seen_operators: set[str] = set()

    def variable(self, expression: z3.ExprRef) -> dict[str, object]:
        name = str(expression)
        if name not in self.variables:
            raise ValueError(f"unregistered variable {name!r}")
        return self.variables[name]

    def width(self, expression: z3.ExprRef) -> int:
        if z3.is_bv(expression):
            return expression.size()
        if z3.is_int(expression):
            return 4
        raise ValueError(f"unsupported source value sort {expression.sort()}")

    def value(self, expression: z3.ExprRef, width: int | None = None) -> str:
        if z3.is_const(expression) and expression.decl().kind() == z3.Z3_OP_UNINTERPRETED:
            variable = self.variable(expression)
            actual = int(variable["width"])
            if width is not None and actual != width:
                raise ValueError(f"width mismatch for {expression}: {actual} != {width}")
            return f"(.var {variable['index']} : BVExpr {actual})"
        if z3.is_int_value(expression):
            actual = 4 if width is None else width
            return f"(.const {expression.as_long()}#{actual})"
        if z3.is_bv_value(expression):
            actual = expression.size()
            if width is not None and actual != width:
                raise ValueError(f"numeral width mismatch: {expression}")
            return f"(.const {expression.as_long()}#{actual})"
        raise ValueError(f"unsupported value expression {expression.sexpr()}")

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
            return "bands [" + ", ".join(self.boolean(x) for x in expression.children()) + "]"
        if z3.is_or(expression):
            self.seen_operators.add("or")
            return "bors [" + ", ".join(self.boolean(x) for x in expression.children()) + "]"
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
        if z3.is_distinct(expression):
            items = expression.children()
            if len(items) != 2:
                raise ValueError("only binary Distinct is accepted")
            self.seen_operators.add("bv-distinct")
            width = max(self.width(items[0]), self.width(items[1]))
            return f"bnot (bveq ({self.value(items[0], width)}) ({self.value(items[1], width)}))"

        kind = expression.decl().kind()
        if kind in {z3.Z3_OP_LE, z3.Z3_OP_LT, z3.Z3_OP_GE, z3.Z3_OP_GT}:
            left, right = expression.children()
            width = max(self.width(left), self.width(right))
            if kind in {z3.Z3_OP_GE, z3.Z3_OP_GT}:
                left, right = right, left
            if kind in {z3.Z3_OP_LE, z3.Z3_OP_GE}:
                self.seen_operators.add("bv-ule")
                return f"bvule ({self.value(left, width)}) ({self.value(right, width)})"
            self.seen_operators.add("bv-ult")
            return f"bvult ({self.value(left, width)}) ({self.value(right, width)})"
        if kind in {z3.Z3_OP_ULT, z3.Z3_OP_UGT}:
            left, right = expression.children()
            if kind == z3.Z3_OP_UGT:
                left, right = right, left
            self.seen_operators.add("bv-ult")
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
                raise ValueError("only unit pseudo-Boolean weights are accepted")
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
            f"unsupported Boolean operation {expression.decl().name()}: "
            f"{expression.sexpr()}"
        )


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--orbit", choices=("left", "middle", "right"), required=True)
    parser.add_argument("--core", type=Path, required=True)
    parser.add_argument("--output-lean", type=Path, required=True)
    parser.add_argument("--output-map", type=Path, required=True)
    parser.add_argument("--certificate", type=Path)
    parser.add_argument("--certificate-part", type=Path, action="append", default=[])
    parser.add_argument("--chunk-size", type=int, default=64)
    parser.add_argument("--limit", type=int)
    args = parser.parse_args()

    short, spec, payload, assertions, counts = load_core(args.core, args.orbit)
    if args.limit is not None:
        if args.limit <= 0:
            raise ValueError("--limit must be positive")
        assertions = assertions[: args.limit]
    if args.certificate is not None and args.certificate_part:
        raise ValueError("use either --certificate or --certificate-part, not both")
    certificate_paths = (
        [args.certificate] if args.certificate is not None else args.certificate_part
    )
    if certificate_paths:
        if args.limit is not None:
            raise ValueError("a partial --limit output cannot consume a certificate")
        for certificate_path in certificate_paths:
            if not certificate_path.is_file():
                raise FileNotFoundError(certificate_path)

    atoms: dict[str, z3.ExprRef] = {}

    def collect(expression: z3.ExprRef) -> None:
        if z3.is_const(expression) and expression.decl().kind() == z3.Z3_OP_UNINTERPRETED:
            atoms[str(expression)] = expression
        for child in expression.children():
            collect(child)

    for assertion in assertions:
        collect(assertion)

    variables: dict[str, dict[str, object]] = {}
    for index, name in enumerate(sorted(atoms, key=natural_key)):
        atom = atoms[name]
        if z3.is_bool(atom):
            sort, width = "Bool", 1
        elif z3.is_int(atom):
            sort, width = "Int-as-unsigned-4", 4
        elif z3.is_bv(atom):
            sort, width = f"BitVec({atom.size()})", atom.size()
        else:
            raise ValueError(f"unsupported atom sort {atom.sort()}")
        variables[name] = {"index": index, "sort": sort, "width": width}

    emitter = Emitter(variables)
    terms = [emitter.boolean(assertion) for assertion in assertions]
    chunks = [terms[i : i + args.chunk_size] for i in range(0, len(terms), args.chunk_size)]
    chunk_names = [f"sourceChunk{i:03d}" for i in range(len(chunks))]
    definitions: list[str] = []
    chunk_theorems: list[str] = []
    for name, chunk in zip(chunk_names, chunks, strict=True):
        rendered = ",\n    ".join(chunk)
        definitions.append(f"""def {name}Assertions : List BVLogicalExpr :=
  [ {rendered} ]

def {name} : BVLogicalExpr := bands {name}Assertions
""")
        chunk_theorems.append(f"""theorem {name}_sat_of_each (source : BVExpr.Assignment)
    (h : ∀ item ∈ {name}Assertions, item.eval source = true) :
    {name}.eval source = true :=
  bands_sat_of_each source {name}Assertions h
""")

    chunk_hypotheses = "\n".join(
        f"    (h{i:03d} : {name}.eval source = true)"
        for i, name in enumerate(chunk_names)
    )
    chunk_arguments = ", ".join(f"h{i:03d}" for i in range(len(chunk_names)))
    certificate_text = ""
    certificate_relative = None
    certificate_relatives = [
        os.path.relpath(path, args.output_lean.parent) for path in certificate_paths
    ]
    if certificate_paths:
        if len(certificate_relatives) == 1:
            certificate_relative = certificate_relatives[0]
            source_lrat_definition = (
                f"def sourceLrat : String := include_str "
                f"{json.dumps(certificate_relative)}"
            )
        else:
            included_parts = ",\n      ".join(
                f"include_str {json.dumps(path)}" for path in certificate_relatives
            )
            source_lrat_definition = (
                "def sourceLrat : String :=\n"
                f"  String.join\n    [ {included_parts} ]"
            )
        certificate_text = f"""
{source_lrat_definition}

/-- Kernel-checked UNSAT endpoint for the exact `{spec['source_orbit']}` source core. -/
theorem sourceExpr_unsat : sourceExpr.Unsat := by
  apply Reflect.unsat_of_verifyBVExpr_eq_true sourceExpr sourceLrat
  native_decide

#print axioms sourceExpr_unsat
"""

    lean_namespace = spec["lean_namespace"]
    lean = f"""/-
Generated from an exact-card-thirteen all-one source core.

The source orbit is `{spec['source_orbit']}`: hub {spec['hub']}, g0 spoke
{spec['g0_spoke']}, g1 spoke {spec['g1_spoke']}.  These are the untouched
canonical boundary indices.  No physical-role reflection is used here.
-/
import Std.Tactic.BVDecide.Reflect

open Std.Sat

namespace Problem97.ATailExactFiveCard13AllOneCertificate.{lean_namespace}

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

abbrev bvule {{width : Nat}} (left right : BVExpr width) : BVLogicalExpr :=
  bnot (bvult right left)

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

#print axioms bands_sat_of_each

{"\n".join(definitions)}

def sourceChunks : List BVLogicalExpr := [{", ".join(chunk_names)}]

def sourceExpr : BVLogicalExpr := bands sourceChunks

{"\n".join(chunk_theorems)}

theorem sourceExpr_sat_of_chunks (source : BVExpr.Assignment)
{chunk_hypotheses} : sourceExpr.eval source = true := by
  simp [sourceExpr, sourceChunks, bands, BVLogicalExpr.eval_gate, Gate.eval,
    {chunk_arguments}]

{certificate_text}

def sourceCnf : CNF Nat := AIG.toCNF sourceExpr.bitblast.relabelNat

def literalToDimacs (literal : Nat × Bool) : String :=
  if literal.2 then toString (literal.1 + 1) else "-" ++ toString (literal.1 + 1)

def clauseToDimacs (clause : CNF.Clause Nat) : String :=
  String.intercalate " " (clause.map literalToDimacs) ++ " 0"

def maxVariable (cnf : CNF Nat) : Nat :=
  cnf.foldl (fun current clause =>
    clause.foldl (fun current literal => Nat.max current (literal.1 + 1)) current) 0

def sourceDimacs : String :=
  let header := s!"p cnf {{maxVariable sourceCnf}} {{sourceCnf.length}}"
  String.intercalate "\\n" (header :: sourceCnf.map clauseToDimacs) ++ "\\n"

def run (arguments : List String) : IO Unit := do
  match arguments with
  | [output] => IO.FS.writeFile output sourceDimacs
  | _ => throw <| IO.userError "usage: generated-all-one-certificate <output.cnf>"

end Problem97.ATailExactFiveCard13AllOneCertificate.{lean_namespace}

def main (arguments : List String) : IO Unit :=
  Problem97.ATailExactFiveCard13AllOneCertificate.{lean_namespace}.run arguments
"""
    args.output_lean.parent.mkdir(parents=True, exist_ok=True)
    args.output_map.parent.mkdir(parents=True, exist_ok=True)
    args.output_lean.write_text(lean, encoding="utf-8")
    mapping = {
        "schema": "p97-exact5-card13-all-one-verified-bvlogicalexpr-map-v1",
        "orbit": spec["source_orbit"],
        "short_orbit": short,
        "lean_namespace": (
            f"Problem97.ATailExactFiveCard13AllOneCertificate.{lean_namespace}"
        ),
        "source_core": str(args.core),
        "source_core_sha256": sha256(args.core),
        "source_assertions_total": counts["total_source_assertions"],
        "selected_source_assertions": len(assertions),
        "chunk_size": args.chunk_size,
        "chunks": len(chunks),
        "source_variables": len(variables),
        "source_bits": sum(int(item["width"]) for item in variables.values()),
        "lowered_operators": sorted(emitter.seen_operators),
        "unsupported_operators": [],
        "canonical_qw": False,
        "source_contract": source_contract(spec),
        "certificate": (
            str(certificate_paths[0]) if len(certificate_paths) == 1 else None
        ),
        "certificate_relative": certificate_relative,
        "certificate_sha256": (
            None if not certificate_paths else sha256_paths(certificate_paths)
        ),
        "certificate_parts": [
            {
                "path": str(path),
                "relative": relative,
                "bytes": path.stat().st_size,
                "sha256": sha256(path),
            }
            for path, relative in zip(
                certificate_paths, certificate_relatives, strict=True
            )
        ],
        "has_certificate_theorem": bool(certificate_paths),
        "partial_limit": args.limit,
        "variables": variables,
    }
    args.output_map.write_text(json.dumps(mapping, indent=2, sort_keys=True) + "\n")
    print(json.dumps({
        "orbit": spec["source_orbit"],
        "source_assertions": len(assertions),
        "source_variables": len(variables),
        "source_bits": mapping["source_bits"],
        "lowered_operators": mapping["lowered_operators"],
        "certificate": bool(certificate_paths),
        "certificate_parts": len(certificate_paths),
    }, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
