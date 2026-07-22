#!/usr/bin/env python3
"""Generate the packed-source assignment and bounded chunk ingress lemmas.

The variable layout is read from the checked JSON map emitted with
`VerifiedPass5Direct.lean`.  Each bridge keeps the familiar flat `hNNNN`
source assertions while producing exactly the itemwise evaluation fact used
by one 64-assertion `BVLogicalExpr` chunk.
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
import generate_source_core_bv as packed  # noqa: E402


PB_KINDS = {
    z3.Z3_OP_PB_AT_LEAST,
    z3.Z3_OP_PB_AT_MOST,
    z3.Z3_OP_PB_EQ,
}


def contains_pseudo_boolean(expr: z3.ExprRef) -> bool:
    return expr.decl().kind() in PB_KINDS or any(
        contains_pseudo_boolean(child) for child in expr.children()
    )


def slot_expression(name: str, sort: str) -> str:
    value = packed.atom(name)
    if sort == "Bool":
        return f"⟨BitVec.ofBool ({value})⟩"
    if sort in {"Int-as-unsigned-4", "BitVec(7)"}:
        return f"⟨{value}⟩"
    raise ValueError(f"unsupported mapped sort {sort!r} for {name}")


def rarray_expression(entries: list[str], start: int = 0, indent: int = 2) -> str:
    """Render a balanced `Lean.RArray` whose branches use absolute pivots."""
    if len(entries) == 1:
        return f".leaf {entries[0]}"
    split = len(entries) // 2
    pivot = start + split
    left = rarray_expression(entries[:split], start, indent + 2)
    right = rarray_expression(entries[split:], pivot, indent + 2)
    pad = " " * indent
    return f".branch {pivot}\n{pad}({left})\n{pad}({right})"


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--core",
        type=Path,
        default=SOURCE / "direct.source-core.pass5.json",
    )
    parser.add_argument(
        "--map",
        type=Path,
        default=HERE / "verified-pass5-direct-variable-map.json",
    )
    parser.add_argument(
        "--output",
        type=Path,
        default=HERE / "VerifiedPass5DirectIngress.lean",
    )
    parser.add_argument("--chunk-size", type=int, default=64)
    parser.add_argument(
        "--limit-chunks",
        type=int,
        help="emit only the first N bridges for bounded elaboration smoke tests",
    )
    args = parser.parse_args()

    payload = json.loads(args.core.read_text(encoding="utf-8"))
    mapping = json.loads(args.map.read_text(encoding="utf-8"))
    if payload["orbit"] != mapping["orbit"]:
        raise ValueError("core/map orbit mismatch")
    if mapping["source_variables"] != 191:
        raise ValueError("expected the exact 191-entry pass-5 variable map")

    variables = sorted(
        mapping["variables"].items(), key=lambda item: int(item[1]["index"])
    )
    if [int(item[1]["index"]) for item in variables] != list(range(191)):
        raise ValueError("variable map is not the exact dense range 0..190")

    outer, _ranks, _counts = ordinal.build(payload["orbit"], 0)
    all_assertions = list(outer.solver.assertions())
    assertions: list[z3.BoolRef] = []
    for saved in payload["core"]:
        assertion = all_assertions[saved["index"]]
        if assertion.sexpr() != saved["assertion"]:
            raise AssertionError(f"source assertion drift at index {saved['index']}")
        assertions.append(assertion)
    packed_terms = [packed.emit_bool(assertion) for assertion in assertions]

    slot_cases = "\n".join(
        f"  | {info['index']} => {slot_expression(name, info['sort'])}"
        for name, info in variables
    ) + "\n  | _ => ⟨0#1⟩"
    assignment_tree = rarray_expression(
        [slot_expression(name, str(info["sort"])) for name, info in variables]
    )
    get_lemmas: list[str] = []
    eval_lemmas: list[str] = []
    for name, info in variables:
        index = int(info["index"])
        width = int(info["width"])
        slot = slot_expression(name, str(info["sort"]))
        get_lemmas.append(f"""@[simp] theorem directSourceAssignment_get_{index:03d}
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    (directSourceAssignment rows blockers shell q w b1 ranks).get {index} = {slot} := by
  unfold BVExpr.Assignment.get
  rw [Lean.RArray.get_eq_getImpl]
  rfl
""")
        expected = packed.atom(name)
        if info["sort"] == "Bool":
            expected = f"BitVec.ofBool ({expected})"
        eval_lemmas.append(f"""@[simp 1100] theorem directSourceAssignment_eval_var_{index:03d}
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.eval (directSourceAssignment rows blockers shell q w b1 ranks)
      ((.var {index}) : BVExpr {width}) = {expected} := by
  rw [BVExpr.eval_var, directSourceAssignment_get_{index:03d}]
  simp
""")

    chunks = [
        packed_terms[start : start + args.chunk_size]
        for start in range(0, len(packed_terms), args.chunk_size)
    ]
    if args.limit_chunks is not None:
        chunks = chunks[: args.limit_chunks]
    bridge_theorems: list[str] = []
    for chunk_number, terms in enumerate(chunks):
        start = chunk_number * args.chunk_size
        hypotheses = "\n".join(
            f"    (h{start + offset:04d} : ({term}) = true)"
            for offset, term in enumerate(terms)
        )
        alternatives = " | ".join("rfl" for _ in terms)
        case_lines: list[str] = []
        for offset in range(len(terms)):
            hypothesis = f"h{start + offset:04d}"
            simplify = (
                "bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, "
                "bands, bors, atLeast, atMost, exactly, Gate.eval, "
                "and_assoc, or_assoc"
            )
            if contains_pseudo_boolean(assertions[start + offset]):
                case_lines.append(
                    f"  · simp [{simplify}] at {hypothesis} ⊢\n"
                    "    bv_decide"
                )
            else:
                case_lines.append(
                    f"  · simpa [{simplify}] using {hypothesis}"
                )
        cases = "\n".join(case_lines)
        bridge_theorems.append(f"""theorem directChunk{chunk_number:03d}_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
{hypotheses} :
    ∀ item ∈ directChunk{chunk_number:03d}Assertions,
      item.eval (directSourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [directChunk{chunk_number:03d}Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with ({alternatives})
{cases}
""")

    aggregate_theorem = ""
    expected_chunks = (len(packed_terms) + args.chunk_size - 1) // args.chunk_size
    if args.limit_chunks is None and len(chunks) == expected_chunks:
        endpoint_hypotheses = "\n".join(
            f"    (c{chunk_number:03d} : ∀ item ∈ directChunk{chunk_number:03d}Assertions,\n"
            f"      item.eval source = true)"
            for chunk_number in range(len(chunks))
        )
        endpoint_facts = "\n".join(
            f"  have hs{chunk_number:03d} := "
            f"directChunk{chunk_number:03d}_sat_of_each source c{chunk_number:03d}"
            for chunk_number in range(len(chunks))
        )
        sat_arguments = " ".join(
            f"hs{chunk_number:03d}" for chunk_number in range(len(chunks))
        )
        all_hypotheses = "\n".join(
            f"    (h{index:04d} : ({term}) = true)"
            for index, term in enumerate(packed_terms)
        )
        bridge_calls: list[str] = []
        for chunk_number, terms in enumerate(chunks):
            start = chunk_number * args.chunk_size
            arguments = " ".join(
                f"h{start + offset:04d}" for offset in range(len(terms))
            )
            bridge_calls.append(f"""    (directChunk{chunk_number:03d}_each_of_flat
      rows blockers shell q w b1 ranks {arguments})""")
        aggregate_theorem = f"""
/-- Thirty itemwise chunk facts are the complete non-certificate endpoint. -/
theorem false_of_directChunks_each (source : BVExpr.Assignment)
{endpoint_hypotheses} : False := by
{endpoint_facts}
  have hs := directExpr_sat_of_chunks source {sat_arguments}
  have hu := directExpr_unsat source
  exact Bool.noConfusion (hu.symm.trans hs)

/-- The exact 1,899 packed source assertions contradict the verified LRAT endpoint. -/
theorem false_of_directSource_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
{all_hypotheses} : False := by
  exact false_of_directChunks_each
    (directSourceAssignment rows blockers shell q w b1 ranks)
{"\n".join(bridge_calls)}

#print axioms false_of_directChunks_each
#print axioms false_of_directSource_flat
"""

    lean = f"""/-
Generated from the exact pass-5 core and its checked 191-entry variable map.

This file is the source-to-circuit ingress.  It contains no SAT encoding and
no certificate checker: those live in `VerifiedPass5Direct.lean`.
-/
import VerifiedPass5Direct
import Lean.Data.RArray

namespace Problem97.ATailExactFiveVerifiedPass5

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false

abbrev RowBits := BitVec 507
abbrev BlockerBits := BitVec 52
abbrev ShellBits := BitVec 13
abbrev RoleBits := BitVec 4
abbrev FirstRowBits := BitVec 13
abbrev RankBits := BitVec 546

abbrev rowBit (rows : RowBits) (family center point : Nat) : Bool :=
  rows.getLsbD (169 * family + 13 * center + point)

abbrev blockerAt (blockers : BlockerBits) (source : Nat) : BitVec 4 :=
  blockers.extractLsb' (4 * source) 4

abbrev shellBit (shell : ShellBits) (point : Nat) : Bool :=
  shell.getLsbD point

abbrev firstRowBit (row : FirstRowBits) (point : Nat) : Bool :=
  row.getLsbD point

abbrev rankAtom (ranks : RankBits) (index : Nat) : BitVec 7 :=
  ranks.extractLsb' (7 * index) 7

/-- Exact slot function recorded by `verified-pass5-direct-variable-map.json`. -/
def directSourceSlot
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    Nat → BVExpr.PackedBitVec
{slot_cases}

/-- Exact 191-entry assignment consumed by the verified `BVLogicalExpr`. -/
def directSourceAssignment
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits) :
    BVExpr.Assignment :=
  {assignment_tree}

{"\n".join(get_lemmas)}

{"\n".join(eval_lemmas)}

{"\n".join(bridge_theorems)}

{aggregate_theorem}

end Problem97.ATailExactFiveVerifiedPass5
"""
    args.output.write_text(lean, encoding="utf-8")
    print(
        json.dumps(
            {
                "assignment_entries": len(variables),
                "assertions": len(assertions),
                "bridges": len(chunks),
                "output": str(args.output),
            },
            sort_keys=True,
        )
    )


if __name__ == "__main__":
    main()
