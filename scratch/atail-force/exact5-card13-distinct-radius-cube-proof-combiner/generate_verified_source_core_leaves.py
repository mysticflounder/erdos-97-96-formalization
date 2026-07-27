#!/usr/bin/env python3
"""Generate independently compilable verified-BVExpr source-core leaves."""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import json
from pathlib import Path


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
SURFACE_PATH = (
    ROOT
    / "scratch/atail-force/exact5-card13-distinct-radius-aggregate/surface.py"
)
PINNED_ATOMS = (
    "shell_5",
    "g1_2_5",
    "g1_2_6",
    "g1_2_7",
    "g1_2_8",
    "g1_2_9",
    "g1_2_10",
    "g1_2_11",
    "g1_2_12",
)
ORBIT = {
    "direct": "asymmetricSourceLeft",
    "mirror": "asymmetricSourceRight",
}
SOURCE_PREFIX = {
    "direct": "VerifiedDistinctDirect",
    "mirror": "VerifiedDistinctMirror",
}
SOURCE_NAMESPACE = {
    orientation: "Problem97.ATailExactFiveDistinctAggregateVerified"
    + orientation.capitalize()
    for orientation in ORBIT
}


def sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        while block := stream.read(1024 * 1024):
            digest.update(block)
    return digest.hexdigest()


def load_json(path: Path) -> dict[str, object]:
    value = json.loads(path.read_text(encoding="utf-8"))
    if not isinstance(value, dict):
        raise ValueError(f"expected JSON object: {path}")
    return value


def require_equal(label: str, actual: object, expected: object) -> None:
    if actual != expected:
        raise ValueError(f"{label} mismatch: actual={actual!r}, expected={expected!r}")


def load_surface():
    spec = importlib.util.spec_from_file_location(
        "exact5_distinct_core_leaf_surface", SURFACE_PATH
    )
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot load {SURFACE_PATH}")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def newline_fingerprint(sexprs: list[str]) -> str:
    return hashlib.sha256(("\n".join(sexprs) + "\n").encode()).hexdigest()


def length_delimited_fingerprint(sexprs: list[str]) -> str:
    digest = hashlib.sha256()
    for sexpr in sexprs:
        encoded = sexpr.encode("utf-8")
        digest.update(len(encoded).to_bytes(8, "big"))
        digest.update(encoded)
    return digest.hexdigest()


def leaf_values(leaf: int) -> tuple[bool, ...]:
    width = len(PINNED_ATOMS)
    if not 0 <= leaf < 2**width:
        raise ValueError(f"leaf index outside [0, {2**width}): {leaf}")
    return tuple(bool((leaf >> (width - 1 - bit)) & 1) for bit in range(width))


def render_leaf_base(namespace: str, source_prefix: str) -> str:
    return f'''import {source_prefix}.Base

open Std.Sat

namespace {namespace}

open Std.Tactic.BVDecide

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

end {namespace}
'''


def render_leaf(
    namespace: str,
    leaf_prefix: str,
    source_prefix: str,
    source_namespace: str,
    leaf: int,
    core_indices: list[int],
    atom_indices: list[int],
) -> str:
    chunks = sorted({index // 64 for index in core_indices})
    imports = [f"import {leaf_prefix}.LeafBase"]
    imports.extend(f"import {source_prefix}.Chunk{chunk:03d}" for chunk in chunks)
    cube_terms = []
    for variable, polarity in zip(atom_indices, leaf_values(leaf), strict=True):
        expression = f"bvar {variable}"
        cube_terms.append(expression if polarity else f"bnot ({expression})")
    core_terms = [
        f"sourceChunk{index // 64:03d}Assertions.get "
        f"⟨{index % 64}, by decide⟩"
        for index in core_indices
    ]
    cube = ",\n    ".join(cube_terms)
    core = ",\n    ".join(core_terms)
    return f'''{"\n".join(imports)}

open Std.Sat

namespace {namespace}

open Std.Tactic.BVDecide
open {source_namespace}

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def leaf{leaf:03d}CubeAssertions : List BVLogicalExpr :=
  [ {cube} ]

def leaf{leaf:03d}CoreAssertions : List BVLogicalExpr :=
  [ {core} ]

def leaf{leaf:03d}Expr : BVLogicalExpr :=
  band (bands leaf{leaf:03d}CubeAssertions)
    (bands leaf{leaf:03d}CoreAssertions)

def leaf{leaf:03d}Cnf : CNF Nat :=
  AIG.toCNF leaf{leaf:03d}Expr.bitblast.relabelNat

def runLeaf{leaf:03d} (arguments : List String) : IO Unit := do
  match arguments with
  | [output] => IO.FS.writeFile output (toDimacs leaf{leaf:03d}Cnf)
  | _ => throw <| IO.userError "usage: leaf exporter <output.cnf>"

end {namespace}

def main (arguments : List String) : IO Unit :=
  {namespace}.runLeaf{leaf:03d} arguments
'''


def render_reduced_union(
    namespace: str,
    leaf_prefix: str,
    source_prefix: str,
    source_namespace: str,
    union_indices: list[int],
) -> str:
    chunks = sorted({index // 64 for index in union_indices})
    imports = [f"import {leaf_prefix}.LeafBase"]
    imports.extend(f"import {source_prefix}.Chunk{chunk:03d}" for chunk in chunks)
    terms = ",\n    ".join(
        f"sourceChunk{index // 64:03d}Assertions.get ⟨{index % 64}, by decide⟩"
        for index in union_indices
    )
    return f'''{"\n".join(imports)}

open Std.Sat

namespace {namespace}

open Std.Tactic.BVDecide
open {source_namespace}

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

/- The ordered union of every checked leaf's original source assertions.
Actual source ingress needs only this reduced assertion surface. -/
def reducedUnionAssertions : List BVLogicalExpr :=
  [ {terms} ]

def reducedUnionExpr : BVLogicalExpr := bands reducedUnionAssertions

def reducedUnionCnf : CNF Nat :=
  AIG.toCNF reducedUnionExpr.bitblast.relabelNat

end {namespace}
'''


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--orientation", choices=tuple(ORBIT), required=True)
    parser.add_argument("--split-map", type=Path, required=True)
    parser.add_argument("--source-core-manifest", type=Path, required=True)
    parser.add_argument("--output-root", type=Path, required=True)
    parser.add_argument("--output-map", type=Path, required=True)
    parser.add_argument("--leaf-start", type=int, default=0)
    parser.add_argument("--leaf-count", type=int)
    args = parser.parse_args()

    total = 2 ** len(PINNED_ATOMS)
    count = total - args.leaf_start if args.leaf_count is None else args.leaf_count
    if count < 1 or not 0 <= args.leaf_start < total:
        raise ValueError("invalid leaf interval")
    leaves = list(range(args.leaf_start, args.leaf_start + count))
    if leaves[-1] >= total:
        raise ValueError("leaf interval extends beyond the complete cube family")

    orientation = args.orientation
    orbit = ORBIT[orientation]
    source_prefix = SOURCE_PREFIX[orientation]
    source_namespace = SOURCE_NAMESPACE[orientation]
    split_map = load_json(args.split_map)
    require_equal("split orientation", split_map["orientation"], orientation)
    require_equal("split orbit", split_map["orbit"], orbit)
    require_equal("split module prefix", split_map["module_prefix"], source_prefix)
    require_equal("aggregate surface SHA-256", sha256(SURFACE_PATH), split_map["aggregate_surface_sha256"])

    surface = load_surface()
    outer, _rank, counts = surface.build(orbit, 0)
    assertions = [assertion.sexpr() for assertion in outer.solver.assertions()]
    require_equal("source assertion count", len(assertions), 58_433)
    require_equal("surface source count", counts["total_source_assertions"], len(assertions))
    require_equal(
        "split ordered source hash",
        split_map["source_expression_sha256"],
        newline_fingerprint(assertions),
    )
    core_fingerprint = length_delimited_fingerprint(assertions)

    variables = split_map["variables"]
    if not isinstance(variables, dict):
        raise ValueError("split variable table is not a JSON object")
    atom_indices: list[int] = []
    for atom in PINNED_ATOMS:
        entry = variables.get(atom)
        if not isinstance(entry, dict) or not isinstance(entry.get("index"), int):
            raise ValueError(f"missing pinned source variable: {atom}")
        require_equal(f"pinned atom width ({atom})", entry.get("width"), 1)
        atom_indices.append(int(entry["index"]))

    core_manifest = load_json(args.source_core_manifest)
    if core_manifest.get("schema") == "p97-exact5-card13-distinct-best-source-core-v1-orbit":
        orbit_record = core_manifest.get("orbit")
        if not isinstance(orbit_record, dict):
            raise ValueError("best-core orbit manifest has no orbit record")
        require_equal("core manifest status", core_manifest["epistemic_status"], "ALL_SOURCE_CUBES_HAVE_CHECKED_SOURCE_CORES")
        require_equal("orbit record status", orbit_record["epistemic_status"], "ALL_SOURCE_CUBES_HAVE_CHECKED_SOURCE_CORES")
        require_equal("orbit record leaf count", orbit_record["leaf_count"], total)
        require_equal("orbit record checked count", orbit_record["checked_core_count"], total)
        require_equal("core manifest orbit", orbit_record["orbit"], orbit)
        require_equal("core manifest source count", orbit_record["source_assertion_count"], len(assertions))
        require_equal("core manifest source fingerprint", orbit_record["source_assertions_sha256"], core_fingerprint)
        manifest_leaves = orbit_record.get("leaves")
        best_core_manifest = True
    else:
        require_equal("core manifest orbit", core_manifest["orbit"], orbit)
        manifest_leaves = core_manifest.get("leaves")
        best_core_manifest = False
    if not isinstance(manifest_leaves, list):
        raise ValueError("core manifest leaves is not a list")
    by_leaf: dict[int, dict[str, object]] = {}
    for entry in manifest_leaves:
        if not isinstance(entry, dict) or not isinstance(entry.get("leaf"), int):
            raise ValueError(f"malformed core manifest leaf entry: {entry!r}")
        by_leaf[int(entry["leaf"])] = entry

    leaf_prefix = "VerifiedDistinctCore" + orientation.capitalize()
    namespace = "Problem97.ATailExactFiveDistinctCore" + orientation.capitalize()
    module_dir = args.output_root / leaf_prefix
    module_dir.mkdir(parents=True, exist_ok=True)
    for stale in module_dir.glob("*.lean"):
        stale.unlink()
    (module_dir / "LeafBase.lean").write_text(
        render_leaf_base(namespace, source_prefix), encoding="utf-8"
    )

    leaf_records: list[dict[str, object]] = []
    for leaf in leaves:
        manifest_entry = by_leaf.get(leaf)
        if manifest_entry is None:
            raise ValueError(f"core manifest has no leaf {leaf:03d}")
        if best_core_manifest:
            expected_bits = "".join("1" if value else "0" for value in leaf_values(leaf))
            require_equal(f"leaf {leaf:03d} cube bits", manifest_entry["cube_bits"], expected_bits)
            selected = manifest_entry.get("best_checked_core")
            if not isinstance(selected, dict):
                raise ValueError(f"leaf {leaf:03d} has no best checked core")
            allowed_statuses = {
                "CHECKED_SOURCE_ASSERTION_CORE_UNDER_PINNED_SOURCE_CUBE",
                "LEVEL2_CHECKED_SOURCE_ASSERTION_CORE",
                "DRAT_VERIFIED_AND_SOURCE_Z3_RECHECKED_CORE",
            }
            if selected.get("epistemic_status") not in allowed_statuses:
                raise ValueError(f"leaf {leaf:03d} core is not checked: {selected.get('epistemic_status')!r}")
            if not isinstance(selected.get("path"), str):
                raise ValueError(f"leaf {leaf:03d} checked core has no payload path")
            payload_path = Path(str(selected["path"])).resolve()
            require_equal(f"leaf {leaf:03d} payload SHA-256", sha256(payload_path), selected["sha256"])
            payload = load_json(payload_path)
            require_equal(f"leaf {leaf:03d} number", payload["leaf"], leaf)
            require_equal(f"leaf {leaf:03d} orbit", payload["orbit"], orbit)
            require_equal(f"leaf {leaf:03d} source fingerprint", payload["source_assertions_sha256"], core_fingerprint)
            stage = selected.get("stage")
            if stage in {"first_pass", "level2"}:
                require_equal(f"leaf {leaf:03d} classification", payload["classification_status"], "UNSAT")
                require_equal(f"leaf {leaf:03d} core replay", payload["core_recheck_status"], "UNSAT")
            elif stage == "external":
                require_equal(f"leaf {leaf:03d} external result", payload["external_status"], "UNSAT")
                require_equal(f"leaf {leaf:03d} DRAT verification", payload["drat_trim_verified"], True)
                require_equal(f"leaf {leaf:03d} source replay", payload["source_packet_z3_recheck"], "UNSAT")
            else:
                raise ValueError(f"leaf {leaf:03d} has unsupported checked-core stage: {stage!r}")
            core = payload.get("core")
            selected_indices = selected.get("source_assertion_indices")
            if not isinstance(selected_indices, list) or not all(isinstance(index, int) for index in selected_indices):
                raise ValueError(f"leaf {leaf:03d} best core has malformed source indices")
            require_equal(f"leaf {leaf:03d} selected core size", len(selected_indices), selected["source_core_size"])
            full_cube = {
                atom if value else f"(not {atom})"
                for atom, value in zip(PINNED_ATOMS, leaf_values(leaf), strict=True)
            }
            selected_cube = selected.get("cube_literals")
            if not isinstance(selected_cube, list) or not all(isinstance(item, str) for item in selected_cube):
                raise ValueError(f"leaf {leaf:03d} best core has malformed cube literals")
            if not set(selected_cube) <= full_cube:
                raise ValueError(f"leaf {leaf:03d} selected cube is not a subset of the full source cube")
        else:
            if not isinstance(manifest_entry.get("path"), str):
                raise ValueError(f"core manifest leaf {leaf:03d} has no payload path")
            payload_path = args.source_core_manifest.parent / str(manifest_entry["path"])
            payload = load_json(payload_path)
            require_equal(f"leaf {leaf:03d} number", payload["leaf"], leaf)
            require_equal(f"leaf {leaf:03d} orbit", payload["orbit"], orbit)
            require_equal(f"leaf {leaf:03d} source fingerprint", payload["source_assertions_sha256"], core_fingerprint)
            require_equal(f"leaf {leaf:03d} classification", payload["classification_status"], "UNSAT")
            require_equal(f"leaf {leaf:03d} core replay", payload["core_recheck_status"], "UNSAT")
            core = payload.get("core")
        if not isinstance(core, list) or not core:
            raise ValueError(f"leaf {leaf:03d} has no checked source core")
        core_indices: list[int] = []
        for item in core:
            if not isinstance(item, dict) or not isinstance(item.get("index"), int):
                raise ValueError(f"malformed core entry in leaf {leaf:03d}: {item!r}")
            index = int(item["index"])
            if not 0 <= index < len(assertions):
                raise ValueError(f"core index out of range in leaf {leaf:03d}: {index}")
            require_equal(
                f"leaf {leaf:03d} assertion sexpr {index}",
                item.get("assertion"),
                assertions[index],
            )
            core_indices.append(index)
        if len(core_indices) != len(set(core_indices)):
            raise ValueError(f"duplicate core index in leaf {leaf:03d}")
        if best_core_manifest:
            require_equal(f"leaf {leaf:03d} selected indices", core_indices, selected_indices)
        source = module_dir / f"Leaf{leaf:03d}.lean"
        source.write_text(
            render_leaf(
                namespace, leaf_prefix, source_prefix, source_namespace,
                leaf, core_indices, atom_indices
            ),
            encoding="utf-8",
        )
        leaf_records.append(
            {
                "leaf": leaf,
                "module": str(source.relative_to(args.output_root)),
                "source_payload": str(payload_path),
                "source_payload_sha256": sha256(payload_path),
                "core_size": len(core_indices),
                "core_indices": core_indices,
                "required_chunks": sorted({index // 64 for index in core_indices}),
                "cube_values": list(leaf_values(leaf)),
            }
        )

    union_indices = sorted({
        index
        for record in leaf_records
        for index in record["core_indices"]
    })
    union_offset = {index: offset for offset, index in enumerate(union_indices)}
    for record in leaf_records:
        core_indices = record["core_indices"]
        assert isinstance(core_indices, list)
        record["reduced_union_offsets"] = [
            union_offset[int(index)] for index in core_indices
        ]
    (module_dir / "ReducedUnion.lean").write_text(
        render_reduced_union(
            namespace, leaf_prefix, source_prefix, source_namespace, union_indices
        ),
        encoding="utf-8",
    )

    modules = sorted(module_dir.glob("*.lean"))
    mapping = {
        "schema": "p97-exact5-distinct-verified-source-core-leaves-v1",
        "epistemic_status": "GENERATED_INPUT_TO_VERIFIED_LEAN_BV_COMPILER",
        "orientation": orientation,
        "orbit": orbit,
        "complete_cube_leaf_count": total,
        "selected_leaf_count": len(leaves),
        "complete_coverage_selection": len(leaves) == total,
        "source_assertion_count": len(assertions),
        "source_expression_sha256": split_map["source_expression_sha256"],
        "source_core_length_delimited_sha256": core_fingerprint,
        "split_mapping_sha256": sha256(args.split_map),
        "source_core_manifest_sha256": sha256(args.source_core_manifest),
        "aggregate_surface_sha256": sha256(SURFACE_PATH),
        "generator_sha256": sha256(Path(__file__)),
        "leaf_module_prefix": leaf_prefix,
        "source_module_prefix": source_prefix,
        "reduced_union_size": len(union_indices),
        "reduced_union_source_indices": union_indices,
        "leaf_core_subset_contract": (
            "each leaf core index list equals reduced_union_source_indices "
            "projected at reduced_union_offsets"
        ),
        "module_count": len(modules),
        "modules_sha256": {
            str(module.relative_to(args.output_root)): sha256(module)
            for module in modules
        },
        "leaves": leaf_records,
    }
    args.output_map.parent.mkdir(parents=True, exist_ok=True)
    args.output_map.write_text(json.dumps(mapping, indent=2, sort_keys=True) + "\n")
    print(json.dumps({
        "orientation": orientation,
        "selected_leaf_count": len(leaves),
        "core_size_min": min(item["core_size"] for item in leaf_records),
        "core_size_max": max(item["core_size"] for item in leaf_records),
        "core_size_total": sum(int(item["core_size"]) for item in leaf_records),
        "reduced_union_size": len(union_indices),
        "module_count": len(modules),
    }, sort_keys=True), flush=True)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
