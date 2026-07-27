#!/usr/bin/env python3
"""Generate the distinct-radius aggregate through Lean's verified BV compiler.

This deliberately does not import the DIMACS emitted by ``export_cnf.py``.
It rebuilds the same ordered Z3 *source assertion* list, translates those
source expressions to ``BVLogicalExpr`` data, and defines the SAT root as

    AIG.toCNF sourceExpr.bitblast.relabelNat

inside Lean.  An external UNSAT certificate for that exact emitted CNF can
therefore be replayed by ``Reflect.unsat_of_verifyBVExpr_eq_true``.  The
Python translation remains a generated source-ingress obligation: a final
production theorem must connect the corresponding Lean source hypotheses to
``sourceExpr.eval`` as in the existing pass-5 ingress.
"""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import json
from pathlib import Path
import sys

import z3


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
AGGREGATE = ROOT / "scratch/atail-force/exact5-card13-distinct-radius-aggregate"
PASS5_GENERATOR = (
    ROOT / "scratch/atail-force/exact5-bv-encoding-profile"
    / "generate_verified_pass5_bvexpr.py"
)
EXPECTED_ASSERTIONS = 58_433

sys.path.insert(0, str(AGGREGATE))
import surface  # noqa: E402

spec = importlib.util.spec_from_file_location("verified_pass5_generator", PASS5_GENERATOR)
if spec is None or spec.loader is None:
    raise RuntimeError(f"cannot load {PASS5_GENERATOR}")
pass5 = importlib.util.module_from_spec(spec)
spec.loader.exec_module(pass5)


def sha256_bytes(payload: bytes) -> str:
    return hashlib.sha256(payload).hexdigest()


def lean_name(orientation: str) -> str:
    return orientation[0].upper() + orientation[1:]


class AggregateEmitter(pass5.Emitter):
    """The pass-5 emitter plus operations occurring in the aggregate list."""

    def boolean(self, expression: z3.BoolRef) -> str:
        kind = expression.decl().kind()

        if kind == z3.Z3_OP_XOR:
            self.seen_operators.add("xor")
            items = [self.boolean(item) for item in expression.children()]
            if not items:
                return "(.const false)"
            value = items[0]
            for item in items[1:]:
                value = f"bnot (bbeq ({value}) ({item}))"
            return value

        if z3.is_distinct(expression):
            self.seen_operators.add("distinct")
            items = list(expression.children())
            inequalities: list[str] = []
            for left_index, left in enumerate(items):
                for right in items[left_index + 1 :]:
                    width = max(self.width(left), self.width(right))
                    inequalities.append(
                        f"bnot (bveq ({self.value(left, width)}) "
                        f"({self.value(right, width)}))"
                    )
            return "bands [" + ", ".join(inequalities) + "]"

        if kind in {
            z3.Z3_OP_LE,
            z3.Z3_OP_LT,
            z3.Z3_OP_GE,
            z3.Z3_OP_GT,
            z3.Z3_OP_ULEQ,
            z3.Z3_OP_ULT,
            z3.Z3_OP_UGEQ,
            z3.Z3_OP_UGT,
        }:
            left, right = expression.children()
            width = max(self.width(left), self.width(right))
            if kind in {z3.Z3_OP_GE, z3.Z3_OP_GT, z3.Z3_OP_UGEQ, z3.Z3_OP_UGT}:
                left, right = right, left
            left_text = self.value(left, width)
            right_text = self.value(right, width)
            if kind in {z3.Z3_OP_LE, z3.Z3_OP_GE, z3.Z3_OP_ULEQ, z3.Z3_OP_UGEQ}:
                self.seen_operators.add("bv-ule")
                return f"bvule ({left_text}) ({right_text})"
            self.seen_operators.add("bv-ult")
            return f"bvult ({left_text}) ({right_text})"

        return super().boolean(expression)


def collect_atom(expression: z3.ExprRef, atoms: dict[str, z3.ExprRef]) -> None:
    if z3.is_const(expression) and expression.decl().kind() == z3.Z3_OP_UNINTERPRETED:
        name = str(expression)
        previous = atoms.get(name)
        if previous is not None and previous.sort() != expression.sort():
            raise ValueError(f"source atom sort drift for {name}")
        atoms[name] = expression
    for child in expression.children():
        collect_atom(child, atoms)


def variable_table(atoms: dict[str, z3.ExprRef]) -> dict[str, dict[str, object]]:
    variables: dict[str, dict[str, object]] = {}
    for index, name in enumerate(sorted(atoms, key=pass5.natural_key)):
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
    return variables


def render_lean(
    orientation: str,
    terms: list[str],
    chunk_size: int,
    source_expression_sha256: str,
) -> str:
    title = lean_name(orientation)
    namespace = f"Problem97.ATailExactFiveDistinctAggregateVerified{title}"
    chunks = [terms[start : start + chunk_size] for start in range(0, len(terms), chunk_size)]
    chunk_definitions: list[str] = []
    chunk_names: list[str] = []
    for index, chunk in enumerate(chunks):
        name = f"sourceChunk{index:03d}"
        chunk_names.append(name)
        rendered = ",\n    ".join(chunk)
        chunk_definitions.append(
            f"def {name}Assertions : List BVLogicalExpr :=\n"
            f"  [ {rendered} ]\n\n"
            f"def {name} : BVLogicalExpr := bands {name}Assertions\n"
        )
    rendered_chunks = ", ".join(chunk_names)
    return f'''/-
Generated from the ordered 58,433-assertion distinct-radius source surface.
Source-expression SHA-256: {source_expression_sha256}

The root CNF below is produced by Lean's verified BVLogicalExpr compiler.
It is not the separately generated Z3-tactic CNF.
-/
import Std.Tactic.BVDecide.Reflect

open Std.Sat

namespace {namespace}

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

def bvule {{width : Nat}} (left right : BVExpr width) : BVLogicalExpr :=
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

{chr(10).join(chunk_definitions)}

def sourceChunks : List BVLogicalExpr := [{rendered_chunks}]

def sourceExpr : BVLogicalExpr := bands sourceChunks

/-- The only root CNF eligible for a kernel-closing external certificate. -/
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
  | _ => throw <| IO.userError "usage: generated-module <output.cnf>"

end {namespace}

def main (arguments : List String) : IO Unit :=
  {namespace}.run arguments
'''


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--orientation", choices=("direct", "mirror"), required=True)
    parser.add_argument("--output-lean", type=Path, required=True)
    parser.add_argument("--output-map", type=Path, required=True)
    parser.add_argument("--chunk-size", type=int, default=64)
    parser.add_argument(
        "--limit",
        type=int,
        help="bounded architecture smoke; omit to require all 58,433 assertions",
    )
    args = parser.parse_args()
    if args.chunk_size < 1:
        raise SystemExit("chunk size must be positive")
    if args.limit is not None and args.limit < 1:
        raise SystemExit("limit must be positive")

    orbit = {
        "direct": "asymmetricSourceLeft",
        "mirror": "asymmetricSourceRight",
    }[args.orientation]
    outer, _ranks, counts = surface.build(orbit, 0)
    assertions = list(outer.solver.assertions())
    if len(assertions) != EXPECTED_ASSERTIONS:
        raise AssertionError(
            f"full source assertion count drift: {len(assertions)} != {EXPECTED_ASSERTIONS}"
        )
    if counts.get("total_source_assertions") != EXPECTED_ASSERTIONS:
        raise AssertionError("surface count metadata drift")
    selected = assertions if args.limit is None else assertions[: args.limit]

    atoms: dict[str, z3.ExprRef] = {}
    for assertion in selected:
        collect_atom(assertion, atoms)
    variables = variable_table(atoms)
    emitter = AggregateEmitter(variables)
    terms = [emitter.boolean(assertion) for assertion in selected]

    source_payload = (
        "\n".join(assertion.sexpr() for assertion in selected) + "\n"
    ).encode()
    source_expression_sha256 = sha256_bytes(source_payload)
    lean = render_lean(
        args.orientation, terms, args.chunk_size, source_expression_sha256
    )
    args.output_lean.parent.mkdir(parents=True, exist_ok=True)
    args.output_map.parent.mkdir(parents=True, exist_ok=True)
    args.output_lean.write_text(lean, encoding="utf-8")
    mapping = {
        "schema": "p97-exact5-distinct-aggregate-verified-bvlogicalexpr-map-v1",
        "epistemic_status": "GENERATED_INPUT_TO_VERIFIED_LEAN_BV_COMPILER",
        "orientation": args.orientation,
        "orbit": orbit,
        "full_source_assertions": len(assertions),
        "emitted_source_assertions": len(selected),
        "bounded_smoke": args.limit is not None,
        "chunk_size": args.chunk_size,
        "chunks": (len(selected) + args.chunk_size - 1) // args.chunk_size,
        "source_expression_sha256": source_expression_sha256,
        "source_variables": len(variables),
        "source_bits": sum(int(item["width"]) for item in variables.values()),
        "lowered_operators": sorted(emitter.seen_operators),
        "unsupported_operators": [],
        "aggregate_surface_sha256": sha256_bytes(
            Path(surface.__file__).read_bytes()
        ),
        "pass5_emitter_dependency_sha256": sha256_bytes(
            PASS5_GENERATOR.read_bytes()
        ),
        "generator_sha256": sha256_bytes(Path(__file__).read_bytes()),
        "generated_lean_sha256": sha256_bytes(lean.encode()),
        "variables": variables,
    }
    mapping["aggregate_surface_path"] = str(Path(surface.__file__).resolve())
    args.output_map.write_text(json.dumps(mapping, indent=2, sort_keys=True) + "\n")
    print(
        json.dumps(
            {
                key: mapping[key]
                for key in (
                    "orientation",
                    "full_source_assertions",
                    "emitted_source_assertions",
                    "chunks",
                    "source_expression_sha256",
                    "source_variables",
                    "source_bits",
                    "lowered_operators",
                    "generated_lean_sha256",
                )
            },
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
