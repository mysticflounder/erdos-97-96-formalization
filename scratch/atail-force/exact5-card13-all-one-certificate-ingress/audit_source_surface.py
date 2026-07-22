#!/usr/bin/env python3
"""Audit both translators against all 45,865 assertions in all three orbits."""

from __future__ import annotations

import argparse
import json
from pathlib import Path

import z3

from all_one_source_terms import (
    EXPECTED_SOURCE_ASSERTIONS,
    EXPECTED_SOURCE_BITS,
    EXPECTED_SOURCE_VARIABLES,
    ORBIT_SPECS,
    build_source_assertions,
    emit_bool,
    natural_key,
    source_contract,
)
from generate_all_one_bvexpr import Emitter


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()

    reports: list[dict[str, object]] = []
    for short, spec in ORBIT_SPECS.items():
        assertions, counts = build_source_assertions(short)
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
            item = atoms[name]
            if z3.is_bool(item):
                sort, width = "Bool", 1
            elif z3.is_int(item):
                sort, width = "Int-as-unsigned-4", 4
            elif z3.is_bv(item):
                sort, width = f"BitVec({item.size()})", item.size()
            else:
                raise ValueError(item.sort())
            variables[name] = {"index": index, "sort": sort, "width": width}
        emitter = Emitter(variables)
        for assertion in assertions:
            emitter.boolean(assertion)
            emit_bool(assertion)
        source_bits = sum(int(item["width"]) for item in variables.values())
        if len(assertions) != EXPECTED_SOURCE_ASSERTIONS:
            raise AssertionError(
                f"source assertion drift: {len(assertions)} != "
                f"{EXPECTED_SOURCE_ASSERTIONS}"
            )
        if len(variables) != EXPECTED_SOURCE_VARIABLES:
            raise AssertionError(
                f"source variable drift: {len(variables)} != "
                f"{EXPECTED_SOURCE_VARIABLES}"
            )
        if source_bits != EXPECTED_SOURCE_BITS:
            raise AssertionError(
                f"source bit-layout drift: {source_bits} != {EXPECTED_SOURCE_BITS}"
            )
        reports.append({
            "orbit": spec["source_orbit"],
            "assertions": len(assertions),
            "expected_assertions": counts["total_source_assertions"],
            "variables": len(variables),
            "source_bits": source_bits,
            "operators": sorted(emitter.seen_operators),
            "source_contract": source_contract(spec),
            "status": "PASS",
        })
    payload = {
        "schema": "p97-exact5-card13-all-one-source-translator-audit-v1",
        "status": "PASS",
        "orbits": reports,
    }
    output = json.dumps(payload, indent=2, sort_keys=True) + "\n"
    if args.output is not None:
        args.output.write_text(output, encoding="utf-8")
    print(output, end="")


if __name__ == "__main__":
    main()
