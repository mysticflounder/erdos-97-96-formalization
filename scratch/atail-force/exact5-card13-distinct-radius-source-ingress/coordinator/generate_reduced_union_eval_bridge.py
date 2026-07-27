#!/usr/bin/env python3
"""Generate source-faithful eval equalities for a verified reduced union.

The input map is the truth source for the ordered selected assertion list.
For each selected original source index this generator proves that the exact
``BVLogicalExpr`` item evaluates under ``selectedSourceAssignment`` to the
corresponding packed Boolean source expression.  Generation fails closed on
the complete source stream, variable table, module hashes, ordering, and every
selected source expression.

The output is intentionally map driven: replacing the reduced union by a
smaller checked global core only requires rerunning this generator.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import math
from pathlib import Path
import sys
from typing import Any

import z3


HERE = Path(__file__).resolve().parent
AUDIT = HERE.parent.parent / "exact5-card13-distinct-radius-source-ingress-audit"
sys.path.insert(0, str(AUDIT))

from distinct_source_terms import (  # noqa: E402
    EXPECTED_ASSERTIONS,
    EXPECTED_SOURCE_BITS,
    EXPECTED_VARIABLES,
    build_source_assertions,
    collect_variables,
    lean_atom,
)


EXPECTED_SCHEMA = "p97-exact5-distinct-reduced-union-verified-bvexpr-split-v1"
COORDINATOR_NAMESPACE = (
    "Problem97."
    "ATailExactFiveCard13DistinctRadiusSourceIngressCoordinatorScratch"
)
PB_KINDS = {
    z3.Z3_OP_PB_AT_LEAST,
    z3.Z3_OP_PB_AT_MOST,
    z3.Z3_OP_PB_EQ,
}


def requires_bv_decide(expression: z3.ExprRef) -> bool:
    return expression.decl().kind() in PB_KINDS or any(
        requires_bv_decide(child) for child in expression.children()
    )


def sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        while block := stream.read(1024 * 1024):
            digest.update(block)
    return digest.hexdigest()


def length_delimited_fingerprint(items: list[str]) -> str:
    digest = hashlib.sha256()
    for item in items:
        encoded = item.encode()
        digest.update(len(encoded).to_bytes(8, "big"))
        digest.update(encoded)
    return digest.hexdigest()


def value_width(expression: z3.ExprRef) -> int:
    if z3.is_bv(expression):
        return expression.size()
    if z3.is_int(expression):
        return 4
    raise ValueError(f"unsupported value sort: {expression.sort()}")


def emit_value(expression: z3.ExprRef, width: int | None = None) -> str:
    if (
        z3.is_const(expression)
        and expression.decl().kind() == z3.Z3_OP_UNINTERPRETED
    ):
        return lean_atom(str(expression))
    if z3.is_int_value(expression):
        actual = 4 if width is None else width
        return f"{expression.as_long()}#{actual}"
    if z3.is_bv_value(expression):
        actual = expression.size()
        if width is not None and width != actual:
            raise ValueError(f"bit-vector numeral width mismatch: {expression}")
        return f"{expression.as_long()}#{actual}"
    raise ValueError(f"unsupported source value: {expression.sexpr()}")


def join_bool(operator: str, items: list[str], identity: str) -> str:
    if not items:
        return identity
    if len(items) == 1:
        return items[0]
    return "(" + f" {operator} ".join(items) + ")"


def emit_bool(expression: z3.BoolRef) -> str:
    """Translate one source assertion to the exact packed Lean surface."""

    if z3.is_true(expression):
        return "true"
    if z3.is_false(expression):
        return "false"
    if (
        z3.is_const(expression)
        and expression.decl().kind() == z3.Z3_OP_UNINTERPRETED
    ):
        return lean_atom(str(expression))
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
        items = list(expression.children())
        inequalities: list[str] = []
        for left_index, left in enumerate(items):
            for right in items[left_index + 1 :]:
                width = max(value_width(left), value_width(right))
                inequalities.append(
                    f"!({emit_value(left, width)} == {emit_value(right, width)})"
                )
        return join_bool("&&", inequalities, "true")

    kind = expression.decl().kind()
    if kind == z3.Z3_OP_XOR:
        items = [emit_bool(item) for item in expression.children()]
        if not items:
            return "false"
        value = items[0]
        for item in items[1:]:
            value = f"!(({value}) == ({item}))"
        return value
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
        width = max(value_width(left), value_width(right))
        if kind in {z3.Z3_OP_GE, z3.Z3_OP_GT, z3.Z3_OP_UGEQ, z3.Z3_OP_UGT}:
            left, right = right, left
        left_text = emit_value(left, width)
        right_text = emit_value(right, width)
        if kind in {z3.Z3_OP_LE, z3.Z3_OP_GE, z3.Z3_OP_ULEQ, z3.Z3_OP_UGEQ}:
            return f"({left_text}).ule ({right_text})"
        return f"({left_text}).ult ({right_text})"
    if kind in PB_KINDS:
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


def argument_lines() -> str:
    return """    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits)
    (parentFirst parentSecond : ParentRowBits)
    (connectivity : ConnectivityBits) (ranks : RankBits)"""


def argument_names() -> str:
    return (
        "rows blockers shell q w b1 parentFirst parentSecond "
        "connectivity ranks"
    )


def render_bridge_chunk(
    orientation: str,
    verified_prefix: str,
    verified_namespace: str,
    union_chunk: int,
    entries: list[dict[str, Any]],
) -> str:
    title = orientation.capitalize()
    declarations: list[str] = []
    for entry in entries:
        source_index = int(entry["source_index"])
        chunk_offset = int(entry["chunk_offset"])
        concrete = str(entry["packed_term"])
        finish = "\n  bv_decide" if bool(entry["requires_bv_decide"]) else ""
        declarations.append(f'''/-- Exact eval equality for current source assertion `h{source_index}`. -/
theorem {orientation}ReducedUnionSource_h{source_index:05d}_eval
{argument_lines()} :
    (reducedUnionChunk{union_chunk:03d}Assertions.get
      ⟨{chunk_offset}, by decide⟩).eval
        (selectedSourceAssignment {argument_names()}) =
      ({concrete}) := by
  simp [reducedUnionChunk{union_chunk:03d}Assertions,
    bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule,
    bands, bors, atLeast, atMost, exactly, Gate.eval,
    and_assoc, or_assoc, Bool.and_assoc, Bool.or_assoc,
    BitVec.ule_eq_not_ult]{finish}
''')
    return f'''/- Generated by `generate_reduced_union_eval_bridge.py`; do not edit. -/
import SelectedSourceAssignment
import {verified_prefix}.Chunk{union_chunk:03d}

/-! {title} reduced-union symbolic-to-packed evaluation equalities. -/

namespace {COORDINATOR_NAMESPACE}

open ATailExactFiveCard13CnfIngressScratch
open ExactFiveCard13DistinctRadiusSourceIngressScratch
open Std.Tactic.BVDecide
open {verified_namespace}

set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false

{"\n".join(declarations)}

end {COORDINATOR_NAMESPACE}
'''


def render_aggregate(orientation: str, chunk_count: int) -> str:
    title = orientation.capitalize()
    imports = "\n".join(
        f"import {title}ReducedUnionEvalBridgeChunk{chunk:03d}"
        for chunk in range(chunk_count)
    )
    return f'''/- Generated by `generate_reduced_union_eval_bridge.py`; do not edit. -/
{imports}

/-! Aggregate import for the generated {orientation} reduced-union eval bridge. -/

namespace {COORDINATOR_NAMESPACE}

theorem {orientation}ReducedUnionEvalBridge_chunk_count :
    {chunk_count} = {chunk_count} := rfl

end {COORDINATOR_NAMESPACE}
'''


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--orientation", choices=("direct", "mirror"), required=True)
    parser.add_argument("--reduced-map", type=Path, required=True)
    parser.add_argument("--reduced-map-sha256", required=True)
    parser.add_argument("--verified-root", type=Path, required=True)
    parser.add_argument("--output-dir", type=Path, required=True)
    parser.add_argument("--limit-chunks", type=int)
    args = parser.parse_args()

    if sha256(args.reduced_map) != args.reduced_map_sha256:
        raise AssertionError("reduced-union map SHA-256 drift")
    mapping = json.loads(args.reduced_map.read_text(encoding="utf-8"))
    if mapping.get("schema") != EXPECTED_SCHEMA:
        raise ValueError("reduced-union map schema drift")
    if mapping.get("orientation") != args.orientation:
        raise ValueError("reduced-union orientation mismatch")
    if mapping.get("orbit") != {
        "direct": "asymmetricSourceLeft",
        "mirror": "asymmetricSourceRight",
    }[args.orientation]:
        raise ValueError("reduced-union orbit mismatch")

    assertions, _counts, _outer, _ranks = build_source_assertions(args.orientation)
    if len(assertions) != EXPECTED_ASSERTIONS:
        raise AssertionError("source assertion count drift")
    sexprs = [assertion.sexpr() for assertion in assertions]
    if length_delimited_fingerprint(sexprs) != mapping.get(
        "source_assertions_length_delimited_sha256"
    ):
        raise AssertionError("complete source assertion stream drift")

    current_variables = collect_variables(assertions)
    if len(current_variables) != EXPECTED_VARIABLES:
        raise AssertionError("source variable count drift")
    if sum(int(item["width"]) for item in current_variables.values()) != EXPECTED_SOURCE_BITS:
        raise AssertionError("source bit width drift")
    saved_variables = mapping.get("variables")
    if not isinstance(saved_variables, dict):
        raise ValueError("reduced-union map has no variable table")
    for name, current in current_variables.items():
        saved = saved_variables.get(name)
        if not isinstance(saved, dict):
            raise AssertionError(f"missing mapped source variable {name}")
        for key in ("index", "sort", "width"):
            if saved.get(key) != current[key]:
                raise AssertionError(f"variable-table drift for {name}.{key}")

    prefix = str(mapping["module_prefix"])
    verified_namespace = str(mapping["namespace"])
    module_dir = args.verified_root / prefix
    hashes = mapping.get("modules_sha256")
    if not isinstance(hashes, dict):
        raise ValueError("reduced-union map has no module hash table")
    for relative, expected in hashes.items():
        path = args.verified_root / relative
        if not path.is_file() or sha256(path) != expected:
            raise AssertionError(f"verified module drift: {relative}")

    indices = mapping.get("reduced_union_source_indices")
    if not isinstance(indices, list) or not all(isinstance(index, int) for index in indices):
        raise ValueError("reduced union has malformed source indices")
    if indices != sorted(set(indices)):
        raise ValueError("reduced union source indices are not sorted and unique")
    if len(indices) != int(mapping["reduced_union_size"]):
        raise ValueError("reduced union size mismatch")
    chunk_size = int(mapping["chunk_size"])
    chunk_count = math.ceil(len(indices) / chunk_size)
    if chunk_count != int(mapping["chunk_count"]):
        raise ValueError("reduced union chunk count mismatch")
    if args.limit_chunks is not None:
        if not 1 <= args.limit_chunks <= chunk_count:
            raise ValueError("invalid --limit-chunks")
        emitted_chunks = args.limit_chunks
    else:
        emitted_chunks = chunk_count

    args.output_dir.mkdir(parents=True, exist_ok=True)
    title = args.orientation.capitalize()
    for stale in args.output_dir.glob(f"{title}ReducedUnionEvalBridge*.lean"):
        stale.unlink()

    entries: list[dict[str, Any]] = []
    for union_offset, source_index in enumerate(indices[: emitted_chunks * chunk_size]):
        assertion = assertions[source_index]
        entry = {
            "source_index": source_index,
            "source_sexpr": assertion.sexpr(),
            "source_sexpr_sha256": hashlib.sha256(assertion.sexpr().encode()).hexdigest(),
            "union_offset": union_offset,
            "union_chunk": union_offset // chunk_size,
            "chunk_offset": union_offset % chunk_size,
            "packed_term": emit_bool(assertion),
            "requires_bv_decide": requires_bv_decide(assertion),
            "theorem": f"{args.orientation}ReducedUnionSource_h{source_index:05d}_eval",
        }
        entries.append(entry)

    by_chunk = [
        entries[start : start + chunk_size]
        for start in range(0, len(entries), chunk_size)
    ]
    for union_chunk, chunk_entries in enumerate(by_chunk):
        output = args.output_dir / f"{title}ReducedUnionEvalBridgeChunk{union_chunk:03d}.lean"
        output.write_text(
            render_bridge_chunk(
                args.orientation,
                prefix,
                verified_namespace,
                union_chunk,
                chunk_entries,
            ),
            encoding="utf-8",
        )
    (args.output_dir / f"{title}ReducedUnionEvalBridge.lean").write_text(
        render_aggregate(args.orientation, len(by_chunk)), encoding="utf-8"
    )
    bridge_map = {
        "schema": "p97-exact5-distinct-reduced-union-eval-bridge-v1",
        "status": "GENERATED_SYMBOLIC_TO_PACKED_EVAL_EQUALITIES",
        "orientation": args.orientation,
        "source_map": str(args.reduced_map),
        "source_map_sha256": sha256(args.reduced_map),
        "source_stream_length_delimited_sha256": mapping[
            "source_assertions_length_delimited_sha256"
        ],
        "variable_count": EXPECTED_VARIABLES,
        "source_bits": EXPECTED_SOURCE_BITS,
        "reduced_union_size": len(indices),
        "complete": emitted_chunks == chunk_count,
        "emitted_chunks": len(by_chunk),
        "emitted_assertions": len(entries),
        "entries": entries,
    }
    (args.output_dir / f"{args.orientation}-reduced-union-eval-bridge-map.json").write_text(
        json.dumps(bridge_map, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )
    print(
        json.dumps(
            {
                "orientation": args.orientation,
                "reduced_union_size": len(indices),
                "emitted_chunks": len(by_chunk),
                "emitted_assertions": len(entries),
                "complete": bridge_map["complete"],
            },
            sort_keys=True,
        )
    )


if __name__ == "__main__":
    main()
