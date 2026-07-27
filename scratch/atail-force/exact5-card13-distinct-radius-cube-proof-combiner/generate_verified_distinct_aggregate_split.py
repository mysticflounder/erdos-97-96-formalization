#!/usr/bin/env python3
"""Emit a cacheable split-module verified-BVExpr aggregate root.

The source translation is shared with
``generate_verified_distinct_aggregate_bvexpr.py``.  This driver changes only
the Lean physical layout: one common base module, bounded expression chunks,
and a thin coordinator.  It exists because elaborating the 11 MB monolithic
module did not finish within the five-minute checkpoint threshold.
"""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import json
from pathlib import Path

import z3


HERE = Path(__file__).resolve().parent
GENERATOR = HERE / "generate_verified_distinct_aggregate_bvexpr.py"
spec = importlib.util.spec_from_file_location("verified_distinct_generator", GENERATOR)
if spec is None or spec.loader is None:
    raise RuntimeError(f"cannot load {GENERATOR}")
shared = importlib.util.module_from_spec(spec)
spec.loader.exec_module(shared)


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def namespace(orientation: str) -> str:
    return (
        "Problem97.ATailExactFiveDistinctAggregateVerified"
        + shared.lean_name(orientation)
    )


def module_prefix(orientation: str) -> str:
    return "VerifiedDistinct" + shared.lean_name(orientation)


def render_base(ns: str) -> str:
    return f'''import Std.Tactic.BVDecide.Reflect

open Std.Sat

namespace {ns}

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

end {ns}
'''


def render_chunk(ns: str, prefix: str, index: int, terms: list[str]) -> str:
    name = f"sourceChunk{index:03d}"
    rendered = ",\n    ".join(terms)
    return f'''import {prefix}.Base

namespace {ns}

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def {name}Assertions : List BVLogicalExpr :=
  [ {rendered} ]

def {name} : BVLogicalExpr := bands {name}Assertions

end {ns}
'''


def render_coordinator(ns: str, prefix: str, chunk_count: int) -> str:
    imports = "\n".join(
        f"import {prefix}.Chunk{index:03d}" for index in range(chunk_count)
    )
    assertion_chunks = ", ".join(
        f"sourceChunk{index:03d}Assertions" for index in range(chunk_count)
    )
    return f'''{imports}

open Std.Sat

namespace {ns}

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

/- Keep the exact two-level source-assertion hierarchy available to generated
small-core adapters.  This avoids flattening all source assertions. -/
def sourceAssertionChunks : List (List BVLogicalExpr) := [{assertion_chunks}]

def sourceChunks : List BVLogicalExpr := sourceAssertionChunks.map bands
def sourceExpr : BVLogicalExpr := bands sourceChunks

/-- Exact root for external cubing and LRAT certification. -/
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
  | _ => throw <| IO.userError "usage: coordinator <output.cnf>"

end {ns}

def main (arguments : List String) : IO Unit := {ns}.run arguments
'''


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--orientation", choices=("direct", "mirror"), required=True)
    parser.add_argument("--output-root", type=Path, required=True)
    parser.add_argument("--output-map", type=Path, required=True)
    parser.add_argument("--chunk-size", type=int, default=64)
    parser.add_argument("--limit", type=int)
    args = parser.parse_args()
    if args.chunk_size < 1:
        raise SystemExit("chunk size must be positive")
    if args.limit is not None and args.limit < 1:
        raise SystemExit("limit must be positive")

    orbit = {
        "direct": "asymmetricSourceLeft",
        "mirror": "asymmetricSourceRight",
    }[args.orientation]
    outer, _ranks, counts = shared.surface.build(orbit, 0)
    assertions = list(outer.solver.assertions())
    if len(assertions) != shared.EXPECTED_ASSERTIONS:
        raise AssertionError("full source assertion count drift")
    if counts.get("total_source_assertions") != shared.EXPECTED_ASSERTIONS:
        raise AssertionError("surface count metadata drift")
    selected = assertions if args.limit is None else assertions[: args.limit]

    atoms: dict[str, z3.ExprRef] = {}
    for assertion in selected:
        shared.collect_atom(assertion, atoms)
    variables = shared.variable_table(atoms)
    emitter = shared.AggregateEmitter(variables)
    terms = [emitter.boolean(assertion) for assertion in selected]
    chunks = [
        terms[start : start + args.chunk_size]
        for start in range(0, len(terms), args.chunk_size)
    ]

    prefix = module_prefix(args.orientation)
    ns = namespace(args.orientation)
    module_dir = args.output_root / prefix
    module_dir.mkdir(parents=True, exist_ok=True)
    for stale in module_dir.glob("*.lean"):
        stale.unlink()
    (module_dir / "Base.lean").write_text(render_base(ns), encoding="utf-8")
    for index, chunk in enumerate(chunks):
        (module_dir / f"Chunk{index:03d}.lean").write_text(
            render_chunk(ns, prefix, index, chunk), encoding="utf-8"
        )
    coordinator = module_dir / "Coordinator.lean"
    coordinator.write_text(
        render_coordinator(ns, prefix, len(chunks)), encoding="utf-8"
    )

    source_payload = (
        "\n".join(assertion.sexpr() for assertion in selected) + "\n"
    ).encode()
    files = sorted(module_dir.glob("*.lean"))
    mapping = {
        "schema": "p97-exact5-distinct-aggregate-verified-bvlogicalexpr-split-v1",
        "epistemic_status": "GENERATED_INPUT_TO_VERIFIED_LEAN_BV_COMPILER",
        "orientation": args.orientation,
        "orbit": orbit,
        "full_source_assertions": len(assertions),
        "emitted_source_assertions": len(selected),
        "bounded_smoke": args.limit is not None,
        "chunk_size": args.chunk_size,
        "chunks": len(chunks),
        "source_expression_sha256": hashlib.sha256(source_payload).hexdigest(),
        "source_variables": len(variables),
        "source_bits": sum(int(item["width"]) for item in variables.values()),
        "lowered_operators": sorted(emitter.seen_operators),
        "unsupported_operators": [],
        "generator_sha256": sha256(Path(__file__)),
        "shared_generator_sha256": sha256(GENERATOR),
        "aggregate_surface_sha256": sha256(Path(shared.surface.__file__)),
        "module_prefix": prefix,
        "module_count": len(files),
        "modules_sha256": {
            str(path.relative_to(args.output_root)): sha256(path) for path in files
        },
        "variables": variables,
    }
    args.output_map.parent.mkdir(parents=True, exist_ok=True)
    args.output_map.write_text(json.dumps(mapping, indent=2, sort_keys=True) + "\n")
    print(
        json.dumps(
            {
                key: mapping[key]
                for key in (
                    "orientation",
                    "emitted_source_assertions",
                    "chunks",
                    "module_count",
                    "source_expression_sha256",
                    "source_variables",
                    "source_bits",
                    "lowered_operators",
                )
            },
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
