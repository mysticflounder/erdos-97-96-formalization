#!/usr/bin/env python3
"""Generate the compact verified-BVExpr union of all checked leaf cores.

The durable compressed bank supplies only original source assertion indices.
This generator rebuilds the exact ordered source stream, validates its
length-delimited fingerprint, translates only the union of the selected
indices, and emits bounded Lean modules.  The resulting root is compiled by
Lean's verified bit-blaster and can be certified by one LRAT proof per
orientation; the 512 leaf certificates remain audit evidence rather than a
publication dependency.
"""

from __future__ import annotations

import argparse
import gzip
import hashlib
import importlib.util
import json
from pathlib import Path


HERE = Path(__file__).resolve().parent
SHARED_GENERATOR = HERE / "generate_verified_distinct_aggregate_bvexpr.py"
spec = importlib.util.spec_from_file_location(
    "verified_distinct_reduced_union_shared", SHARED_GENERATOR
)
if spec is None or spec.loader is None:
    raise RuntimeError(f"cannot load {SHARED_GENERATOR}")
shared = importlib.util.module_from_spec(spec)
spec.loader.exec_module(shared)

ORBIT = {
    "direct": "asymmetricSourceLeft",
    "mirror": "asymmetricSourceRight",
}
ALLOWED_CORE_STATUSES = {
    "CHECKED_SOURCE_ASSERTION_CORE_UNDER_PINNED_SOURCE_CUBE",
    "LEVEL2_CHECKED_SOURCE_ASSERTION_CORE",
    "DRAT_VERIFIED_AND_SOURCE_Z3_RECHECKED_CORE",
}


def sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        while block := stream.read(1024 * 1024):
            digest.update(block)
    return digest.hexdigest()


def length_delimited_fingerprint(items: list[str]) -> str:
    digest = hashlib.sha256()
    for item in items:
        encoded = item.encode("utf-8")
        digest.update(len(encoded).to_bytes(8, "big"))
        digest.update(encoded)
    return digest.hexdigest()


def load_bank(path: Path) -> dict[str, object]:
    with gzip.open(path, "rt", encoding="utf-8") as stream:
        payload = json.load(stream)
    if not isinstance(payload, dict):
        raise ValueError("compressed core bank is not a JSON object")
    return payload


def require_equal(label: str, actual: object, expected: object) -> None:
    if actual != expected:
        raise ValueError(
            f"{label} mismatch: actual={actual!r}, expected={expected!r}"
        )


def title(orientation: str) -> str:
    return orientation[0].upper() + orientation[1:]


def module_prefix(orientation: str) -> str:
    return "VerifiedDistinctReducedUnion" + title(orientation)


def namespace(orientation: str) -> str:
    return (
        "Problem97.ATailExactFiveDistinctReducedUnionVerified"
        + title(orientation)
    )


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

def literalToDimacs (literal : Nat × Bool) : String :=
  if literal.2 then toString (literal.1 + 1) else "-" ++ toString (literal.1 + 1)

def clauseToDimacs (clause : CNF.Clause Nat) : String :=
  String.intercalate " " (clause.map literalToDimacs) ++ " 0"

def maxVariable (cnf : CNF Nat) : Nat :=
  cnf.foldl (fun current clause =>
    clause.foldl (fun current literal => Nat.max current (literal.1 + 1)) current) 0

def toDimacs (cnf : CNF Nat) : String :=
  let header := s!"p cnf {{maxVariable cnf}} {{cnf.length}}"
  String.intercalate "\\n" (header :: cnf.map clauseToDimacs) ++ "\\n"

end {ns}
'''


def render_chunk(ns: str, prefix: str, index: int, terms: list[str]) -> str:
    rendered = ",\n    ".join(terms)
    return f'''import {prefix}.Base

namespace {ns}

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk{index:03d}Assertions : List BVLogicalExpr :=
  [ {rendered} ]

def reducedUnionChunk{index:03d} : BVLogicalExpr :=
  bands reducedUnionChunk{index:03d}Assertions

end {ns}
'''


def render_coordinator(ns: str, prefix: str, chunk_count: int) -> str:
    imports = "\n".join(
        f"import {prefix}.Chunk{index:03d}" for index in range(chunk_count)
    )
    assertion_chunks = ", ".join(
        f"reducedUnionChunk{index:03d}Assertions"
        for index in range(chunk_count)
    )
    return f'''{imports}

open Std.Sat

namespace {ns}

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

/-- Bounded physical chunks of the ordered union of every checked leaf core. -/
def reducedUnionAssertionChunks : List (List BVLogicalExpr) :=
  [ {assertion_chunks} ]

def reducedUnionChunks : List BVLogicalExpr :=
  reducedUnionAssertionChunks.map bands

def reducedUnionExpr : BVLogicalExpr := bands reducedUnionChunks

def reducedUnionCnf : CNF Nat :=
  AIG.toCNF reducedUnionExpr.bitblast.relabelNat

def run (arguments : List String) : IO Unit := do
  match arguments with
  | [output] => IO.FS.writeFile output (toDimacs reducedUnionCnf)
  | _ => throw <| IO.userError "usage: reduced-union coordinator <output.cnf>"

end {ns}

namespace {ns}

def main (arguments : List String) : IO Unit := run arguments

end {ns}
'''


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--orientation", choices=tuple(ORBIT), required=True)
    parser.add_argument("--core-bank-gzip", type=Path, required=True)
    parser.add_argument("--output-root", type=Path, required=True)
    parser.add_argument("--output-map", type=Path, required=True)
    parser.add_argument("--chunk-size", type=int, default=64)
    args = parser.parse_args()
    if args.chunk_size < 1:
        raise ValueError("chunk size must be positive")

    orientation = args.orientation
    orbit = ORBIT[orientation]
    bank = load_bank(args.core_bank_gzip)
    require_equal(
        "bank status",
        bank.get("epistemic_status"),
        "ALL_SOURCE_CUBES_HAVE_CHECKED_SOURCE_CORES",
    )
    records = bank.get("orbits")
    if not isinstance(records, list):
        raise ValueError("compressed bank has no orbit list")
    matching = [item for item in records if isinstance(item, dict) and item.get("orbit") == orbit]
    if len(matching) != 1:
        raise ValueError(f"compressed bank has {len(matching)} records for {orbit}")
    record = matching[0]
    require_equal("orbit status", record.get("epistemic_status"), "ALL_SOURCE_CUBES_HAVE_CHECKED_SOURCE_CORES")
    require_equal("orbit leaf count", record.get("leaf_count"), 512)
    require_equal("orbit checked count", record.get("checked_core_count"), 512)

    outer, _rank, counts = shared.surface.build(orbit, 0)
    assertions = list(outer.solver.assertions())
    require_equal("source assertion count", len(assertions), shared.EXPECTED_ASSERTIONS)
    require_equal("surface source count", counts["total_source_assertions"], len(assertions))
    sexprs = [assertion.sexpr() for assertion in assertions]
    fingerprint = length_delimited_fingerprint(sexprs)
    require_equal("bank source count", record.get("source_assertion_count"), len(assertions))
    require_equal("bank source fingerprint", record.get("source_assertions_sha256"), fingerprint)

    leaves = record.get("leaves")
    if not isinstance(leaves, list) or len(leaves) != 512:
        raise ValueError("orbit record does not contain 512 leaves")
    union: set[int] = set()
    by_leaf: list[dict[str, object]] = []
    for expected_leaf, leaf_record in enumerate(leaves):
        if not isinstance(leaf_record, dict):
            raise ValueError(f"malformed leaf record {expected_leaf}")
        require_equal("leaf number", leaf_record.get("leaf"), expected_leaf)
        selected = leaf_record.get("best_checked_core")
        if not isinstance(selected, dict):
            raise ValueError(f"leaf {expected_leaf:03d} has no selected core")
        if selected.get("epistemic_status") not in ALLOWED_CORE_STATUSES:
            raise ValueError(f"leaf {expected_leaf:03d} selected core is not checked")
        indices = selected.get("source_assertion_indices")
        if not isinstance(indices, list) or not all(isinstance(item, int) for item in indices):
            raise ValueError(f"leaf {expected_leaf:03d} has malformed indices")
        if len(indices) != len(set(indices)):
            raise ValueError(f"leaf {expected_leaf:03d} has duplicate indices")
        if any(not 0 <= index < len(assertions) for index in indices):
            raise ValueError(f"leaf {expected_leaf:03d} index outside source stream")
        require_equal("selected core size", len(indices), selected.get("source_core_size"))
        union.update(indices)
        by_leaf.append({"leaf": expected_leaf, "source_assertion_indices": indices})

    union_indices = sorted(union)
    union_offset = {source_index: offset for offset, source_index in enumerate(union_indices)}
    for leaf_record in by_leaf:
        indices = leaf_record["source_assertion_indices"]
        assert isinstance(indices, list)
        leaf_record["reduced_union_offsets"] = [union_offset[index] for index in indices]

    atoms: dict[str, object] = {}
    for assertion in assertions:
        shared.collect_atom(assertion, atoms)
    variables = shared.variable_table(atoms)
    emitter = shared.AggregateEmitter(variables)
    terms = [emitter.boolean(assertions[index]) for index in union_indices]
    chunks = [
        terms[start : start + args.chunk_size]
        for start in range(0, len(terms), args.chunk_size)
    ]

    prefix = module_prefix(orientation)
    ns = namespace(orientation)
    module_dir = args.output_root / prefix
    module_dir.mkdir(parents=True, exist_ok=True)
    for stale in module_dir.glob("*.lean"):
        stale.unlink()
    (module_dir / "Base.lean").write_text(render_base(ns), encoding="utf-8")
    for index, chunk in enumerate(chunks):
        (module_dir / f"Chunk{index:03d}.lean").write_text(
            render_chunk(ns, prefix, index, chunk), encoding="utf-8"
        )
    (module_dir / "Coordinator.lean").write_text(
        render_coordinator(ns, prefix, len(chunks)), encoding="utf-8"
    )

    files = sorted(module_dir.glob("*.lean"))
    mapping = {
        "schema": "p97-exact5-distinct-reduced-union-verified-bvexpr-split-v1",
        "epistemic_status": "GENERATED_INPUT_TO_VERIFIED_LEAN_BV_COMPILER",
        "orientation": orientation,
        "orbit": orbit,
        "core_bank_gzip_sha256": sha256(args.core_bank_gzip),
        "source_assertion_count": len(assertions),
        "source_assertions_length_delimited_sha256": fingerprint,
        "reduced_union_size": len(union_indices),
        "reduced_union_source_indices": union_indices,
        "chunk_size": args.chunk_size,
        "chunk_count": len(chunks),
        "source_variables": len(variables),
        "source_bits": sum(int(item["width"]) for item in variables.values()),
        "variables": variables,
        "lowered_operators": sorted(emitter.seen_operators),
        "unsupported_operators": [],
        "module_prefix": prefix,
        "namespace": ns,
        "generator_sha256": sha256(Path(__file__)),
        "shared_generator_sha256": sha256(SHARED_GENERATOR),
        "aggregate_surface_sha256": sha256(Path(shared.surface.__file__)),
        "module_count": len(files),
        "modules_sha256": {
            str(path.relative_to(args.output_root)): sha256(path)
            for path in files
        },
        "leaves": by_leaf,
    }
    args.output_map.parent.mkdir(parents=True, exist_ok=True)
    args.output_map.write_text(
        json.dumps(mapping, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )
    print(json.dumps({
        "orientation": orientation,
        "reduced_union_size": len(union_indices),
        "chunk_count": len(chunks),
        "module_count": len(files),
    }, sort_keys=True), flush=True)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
