#!/usr/bin/env python3
"""Create tiny deterministic source cores covering every translated operator."""

from __future__ import annotations

import argparse
import json
from pathlib import Path

import z3

from all_one_source_terms import ORBIT_SPECS, build_source_assertions


def features(expression: z3.ExprRef) -> set[str]:
    result: set[str] = set()
    if z3.is_const(expression) and expression.decl().kind() == z3.Z3_OP_UNINTERPRETED:
        result.add("atom")
    elif z3.is_not(expression):
        result.add("not")
    elif z3.is_and(expression):
        result.add("and")
    elif z3.is_or(expression):
        result.add("or")
    elif z3.is_implies(expression):
        result.add("implies")
    elif z3.is_eq(expression):
        result.add("bool-eq" if z3.is_bool(expression.arg(0)) else "value-eq")
    elif z3.is_distinct(expression):
        result.add("distinct")
    else:
        kind = expression.decl().kind()
        if kind in {z3.Z3_OP_LE, z3.Z3_OP_GE}:
            result.add("value-ule")
        elif kind in {z3.Z3_OP_LT, z3.Z3_OP_GT, z3.Z3_OP_ULT, z3.Z3_OP_UGT}:
            result.add("value-ult")
        elif kind == z3.Z3_OP_PB_AT_MOST:
            result.add("pb-at-most")
        elif kind == z3.Z3_OP_PB_AT_LEAST:
            result.add("pb-at-least")
        elif kind == z3.Z3_OP_PB_EQ:
            result.add("pb-exact")
    for child in expression.children():
        result.update(features(child))
    return result


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--output-dir", type=Path, required=True)
    args = parser.parse_args()
    args.output_dir.mkdir(parents=True, exist_ok=True)

    for short, spec in ORBIT_SPECS.items():
        assertions, counts = build_source_assertions(short)
        feature_sets = [features(assertion) for assertion in assertions]
        universe = set().union(*feature_sets)
        missing = set(universe)
        selected: list[int] = []
        while missing:
            best_index = max(
                range(len(assertions)),
                key=lambda index: len(feature_sets[index] & missing),
            )
            gained = feature_sets[best_index] & missing
            if not gained:
                raise AssertionError(f"cannot cover features {sorted(missing)}")
            selected.append(best_index)
            missing -= gained
        selected = sorted(set(selected))
        payload = {
            "schema": "p97-exact5-card13-all-one-generator-smoke-core-v1",
            "orbit": spec["source_orbit"],
            "canonical_qw": False,
            "input_source_assertion_count": counts["total_source_assertions"],
            "covered_features": sorted(universe),
            "core": [
                {"index": index, "assertion": assertions[index].sexpr()}
                for index in selected
            ],
        }
        output = args.output_dir / f"{short}.smoke-core.json"
        output.write_text(json.dumps(payload, indent=2, sort_keys=True) + "\n")
        print(json.dumps({
            "orbit": spec["source_orbit"],
            "assertions": len(selected),
            "features": sorted(universe),
            "output": str(output),
        }, sort_keys=True))


if __name__ == "__main__":
    main()
