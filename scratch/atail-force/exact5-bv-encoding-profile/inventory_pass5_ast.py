#!/usr/bin/env python3
"""Inventory the exact Z3 operations in the direct pass-5 source core."""

from __future__ import annotations

import argparse
from collections import Counter
import json
from pathlib import Path
import sys

import z3


HERE = Path(__file__).resolve().parent
SOURCE = HERE.parent / "exact5-card13-same-radius-terminal"
sys.path.insert(0, str(SOURCE))

import asymmetric_ordinal_rank as ordinal  # noqa: E402


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--core",
        type=Path,
        default=SOURCE / "direct.source-core.pass5.json",
    )
    args = parser.parse_args()

    payload = json.loads(args.core.read_text(encoding="utf-8"))
    outer, _ranks, _counts = ordinal.build(payload["orbit"], 0)
    assertions = list(outer.solver.assertions())

    kinds: Counter[str] = Counter()
    sorts: Counter[str] = Counter()
    pb_shapes: Counter[str] = Counter()
    constants: Counter[str] = Counter()
    seen: set[int] = set()

    def visit(expr: z3.ExprRef) -> None:
        identity = expr.get_id()
        if identity in seen:
            return
        seen.add(identity)
        kinds[expr.decl().name()] += 1
        sorts[str(expr.sort())] += 1
        if z3.is_const(expr) and expr.decl().kind() == z3.Z3_OP_UNINTERPRETED:
            constants[str(expr).split("_")[0]] += 1
        if expr.decl().kind() in {
            z3.Z3_OP_PB_AT_MOST,
            z3.Z3_OP_PB_AT_LEAST,
            z3.Z3_OP_PB_EQ,
        }:
            params = [int(value) for value in expr.decl().params()]
            pb_shapes[f"{expr.decl().name()}:arity={len(expr.children())}:params={params}"] += 1
        for child in expr.children():
            visit(child)

    for saved in payload["core"]:
        assertion = assertions[saved["index"]]
        if assertion.sexpr() != saved["assertion"]:
            raise AssertionError(f"source assertion drift at {saved['index']}")
        visit(assertion)

    result = {
        "assertions": len(payload["core"]),
        "distinct_ast_nodes": len(seen),
        "operators": dict(sorted(kinds.items())),
        "sorts": dict(sorted(sorts.items())),
        "pseudo_boolean_shapes": dict(sorted(pb_shapes.items())),
        "uninterpreted_constant_prefixes": dict(sorted(constants.items())),
    }
    print(json.dumps(result, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
