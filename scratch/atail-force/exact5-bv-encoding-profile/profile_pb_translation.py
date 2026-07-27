#!/usr/bin/env python3
"""Profile the exact-five source core's unit pseudo-Boolean constraints.

This is deliberately independent of ``generate_source_core_bv.py`` and its
generated files.  It provides two checks:

* classify the saved source core by top-level Z3 operator; and
* exhaustively compare a unary sequential-threshold circuit with ordinary
  cardinality on every Boolean assignment for small arities.

It can also emit a standalone Lean smoke file comparing the current four-bit
adder translation with the unary circuit on all 13-bit inputs.
"""

from __future__ import annotations

import argparse
from collections import Counter
import itertools
import json
from pathlib import Path


def unary_threshold(bits: tuple[bool, ...], threshold: int) -> bool:
    """Return whether at least ``threshold`` input bits are true.

    The state update is the standard monotone sequential counter.  Only
    thresholds up to the requested value are retained.
    """

    if threshold <= 0:
        return True
    if threshold > len(bits):
        return False
    state = [True] + [False] * threshold
    for bit in bits:
        previous = state
        state = [True]
        state.extend(
            previous[level] or (bit and previous[level - 1])
            for level in range(1, threshold + 1)
        )
    return state[threshold]


def pb_holds(kind: str, bound: int, bits: tuple[bool, ...]) -> bool:
    if kind == "at-most":
        return not unary_threshold(bits, bound + 1)
    if kind == "at-least":
        return unary_threshold(bits, bound)
    if kind == "exact":
        return unary_threshold(bits, bound) and not unary_threshold(bits, bound + 1)
    raise ValueError(f"unknown pseudo-Boolean kind: {kind}")


def exhaustive_smoke(max_arity: int) -> dict[str, int]:
    checked = 0
    for arity in range(max_arity + 1):
        for bits in itertools.product((False, True), repeat=arity):
            count = sum(bits)
            for bound in range(arity + 2):
                expected = {
                    "at-most": count <= bound,
                    "at-least": count >= bound,
                    "exact": count == bound,
                }
                for kind, wanted in expected.items():
                    actual = pb_holds(kind, bound, bits)
                    if actual != wanted:
                        raise AssertionError(
                            f"{kind} mismatch: arity={arity}, bound={bound}, "
                            f"bits={bits}, expected={wanted}, actual={actual}"
                        )
                    checked += 1
    return {"max_arity": max_arity, "cases": checked}


def classify_assertion(assertion: str) -> str:
    first = assertion.lstrip().split(None, 1)[0]
    if " pbeq " in assertion or assertion.startswith("((_ pbeq"):
        return "pb-eq"
    if (
        " pble " in assertion
        or assertion.startswith("((_ pble")
        or assertion.startswith("((_ at-most")
    ):
        return "pb-at-most"
    if (
        " pbge " in assertion
        or assertion.startswith("((_ pbge")
        or assertion.startswith("((_ at-least")
    ):
        return "pb-at-least"
    if "bvult" in assertion or "bvule" in assertion:
        return "bitvector-order"
    if assertion.startswith("(=>") and "ord_rank" in assertion:
        return "guarded-rank-relation"
    if assertion.startswith("(not"):
        return "negation"
    if assertion.startswith("(distinct"):
        return "distinct"
    if assertion.startswith("(="):
        return "equality"
    return f"other:{first}"


def classify_core(path: Path) -> dict[str, object]:
    payload = json.loads(path.read_text(encoding="utf-8"))
    assertions = [entry["assertion"] for entry in payload["core"]]
    counts = Counter(classify_assertion(assertion) for assertion in assertions)
    return {
        "core": str(path),
        "assertions": len(assertions),
        "categories": dict(sorted(counts.items())),
        "pseudo_boolean_assertions": sum(
            count for category, count in counts.items() if category.startswith("pb-")
        ),
    }


def emit_unary_threshold(atoms: list[str], threshold: int, prefix: str) -> tuple[list[str], str]:
    if threshold <= 0:
        return [], "true"
    if threshold > len(atoms):
        return [], "false"
    bindings: list[str] = []
    previous = ["true"] + ["false"] * threshold
    for index, atom in enumerate(atoms):
        current = ["true"]
        for level in range(1, threshold + 1):
            name = f"{prefix}_{index}_{level}"
            bindings.append(
                f"  let {name} := {previous[level]} || ({atom} && {previous[level - 1]})"
            )
            current.append(name)
        previous = current
    return bindings, previous[threshold]


def emit_unary_pb(atoms: list[str], kind: str, bound: int, prefix: str = "ge") -> str:
    threshold = bound + 1 if kind in {"at-most", "exact"} else bound
    bindings, threshold_result = emit_unary_threshold(atoms, threshold, prefix)
    if kind == "at-most":
        result = f"!{threshold_result}"
    elif kind == "at-least":
        result = threshold_result
    elif kind == "exact":
        if bound <= 0:
            result = f"!{threshold_result}"
        elif bound > len(atoms):
            result = "false"
        else:
            at_bound = f"{prefix}_{len(atoms) - 1}_{bound}"
            result = f"{at_bound} && !{threshold_result}"
    else:
        raise ValueError(f"unknown pseudo-Boolean kind: {kind}")
    return "\n".join([*bindings, f"  {result}"])


def emit_unary_exact(atoms: list[str], bound: int) -> str:
    return emit_unary_pb(atoms, "exact", bound)


def emit_old_exact(atoms: list[str], bound: int) -> str:
    width = max(1, len(atoms).bit_length())
    terms = [f"(bif {atom} then 1#{width} else 0#{width})" for atom in atoms]
    return f"({' + '.join(terms)} == {bound}#{width})"


def emit_lean_smoke(path: Path, trace: bool) -> None:
    atoms = [f"x.getLsbD {index}" for index in range(13)]
    unary = emit_unary_exact(atoms, 4)
    old = emit_old_exact(atoms, 4)
    fixed_five = " && ".join(atoms[:5])
    trace_options = ""
    if trace:
        trace_options = (
            "set_option trace.Meta.Tactic.bv true in\n"
            "set_option trace.Meta.Tactic.sat true in\n"
        )
    text = f"""import Mathlib.Tactic

namespace Problem97.ATailExactFiveCard13PBProfile

set_option maxRecDepth 100000
set_option maxHeartbeats 0
set_option linter.unusedVariables false

def adderExactlyFour (x : BitVec 13) : Bool :=
  {old}

def unaryExactlyFour (x : BitVec 13) : Bool :=
{unary}

def fixedFive (x : BitVec 13) : Bool :=
  {fixed_five}

{trace_options}theorem adder_eq_unary (x : BitVec 13) :
    adderExactlyFour x = unaryExactlyFour x := by
  unfold adderExactlyFour unaryExactlyFour
  bv_decide (config := {{ timeout := 60 }})

{trace_options}theorem adder_fixedFive_false (x : BitVec 13) :
    (adderExactlyFour x && fixedFive x) = false := by
  unfold adderExactlyFour fixedFive
  bv_decide (config := {{ timeout := 60 }})

{trace_options}theorem unary_fixedFive_false (x : BitVec 13) :
    (unaryExactlyFour x && fixedFive x) = false := by
  unfold unaryExactlyFour fixedFive
  bv_decide (config := {{ timeout := 60 }})

#print axioms adder_eq_unary
#print axioms adder_fixedFive_false
#print axioms unary_fixedFive_false

end Problem97.ATailExactFiveCard13PBProfile
"""
    path.write_text(text, encoding="utf-8")


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--core", type=Path)
    parser.add_argument("--max-smoke-arity", type=int, default=10)
    parser.add_argument("--emit-lean", type=Path)
    parser.add_argument("--lean-trace", action="store_true")
    args = parser.parse_args()

    result: dict[str, object] = {"exhaustive_smoke": exhaustive_smoke(args.max_smoke_arity)}
    if args.core is not None:
        result["source_core"] = classify_core(args.core)
    if args.emit_lean is not None:
        emit_lean_smoke(args.emit_lean, args.lean_trace)
        result["lean_smoke"] = str(args.emit_lean)
    print(json.dumps(result, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
