#!/usr/bin/env python3
"""Replay a persisted translated quotient core with its own timeout budget."""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import json
import sys
import time
from pathlib import Path

import z3


HERE = Path(__file__).resolve().parent
CEGAR_PATH = HERE.parent / "cegar.py"


def load_cegar() -> object:
    spec = importlib.util.spec_from_file_location("current_atail_cegar", CEGAR_PATH)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot import {CEGAR_PATH}")
    module = importlib.util.module_from_spec(spec)
    sys.modules[spec.name] = module
    spec.loader.exec_module(module)
    return module


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("core", type=Path)
    parser.add_argument("--timeout-ms", type=int, default=7_200_000)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()
    if args.timeout_ms <= 0:
        raise ValueError("--timeout-ms must be positive")

    started = time.monotonic()
    cegar = load_cegar()
    payload = json.loads(args.core.read_text())
    expected_hash = hashlib.sha256(CEGAR_PATH.read_bytes()).hexdigest()
    if payload.get("schema") != cegar.SCHEMA:
        raise ValueError("pending core schema does not match current CEGAR schema")
    if payload.get("implementation_sha256") != expected_hash:
        raise ValueError(
            "pending core implementation hash does not match current cegar.py"
        )

    raw_classes = payload.get("alias_classes_in_order")
    if not isinstance(raw_classes, list) or not raw_classes:
        raise ValueError("pending core has no ordered alias classes")
    classes: list[list[str]] = []
    for raw_class in raw_classes:
        if not isinstance(raw_class, list) or not raw_class:
            raise ValueError("pending core contains an invalid alias class")
        if not all(isinstance(name, str) for name in raw_class):
            raise ValueError("pending core alias names must be strings")
        classes.append(raw_class)

    raw_literals = payload.get("translated_outer_literals")
    if not isinstance(raw_literals, list) or not raw_literals:
        raise ValueError("pending core has no translated outer literals")
    literals = [cegar.Literal.from_json(value) for value in raw_literals]

    outer = cegar.OuterMap(
        timeout_ms=min(args.timeout_ms, 600_000),
        random_seed=0,
        z_branch="reuse-second",
        escape_arm="critical",
        global_tier="custom",
        cover_points=("escape", "z"),
        global_k4_centers=("q", "other", "z", "t"),
        rich_apices=("a1", "a2"),
        robust_deletions=(),
    )
    flattened = [name for alias_class in classes for name in alias_class]
    if len(flattened) != len(set(flattened)) or set(flattened) != set(outer.names):
        raise ValueError("pending core alias classes do not partition current names")
    for literal in literals:
        literal.validate(outer.names)

    for rank_value, alias_class in enumerate(classes):
        for name in alias_class:
            outer.solver.add(
                outer.rank[outer.ix(name)]
                == z3.BitVecVal(rank_value, outer.rank_width)
            )
    outer.solver.add(*(outer.literal_expr(literal) for literal in literals))
    outer_status = outer.solver.check()
    if outer_status != z3.sat:
        reason = (
            outer.solver.reason_unknown()
            if outer_status == z3.unknown
            else "persisted core is inconsistent with the current outer projection"
        )
        result = {
            "status": f"OUTER_{str(outer_status).upper()}",
            "reason": reason,
            "elapsed_seconds": time.monotonic() - started,
        }
    else:
        checker = cegar.InnerMetricCheck(
            outer,
            outer.solver.model(),
            timeout_ms=args.timeout_ms,
            iteration=20_000_000,
            extra_literals=literals,
        )
        inner_status = checker.check_literals(literals)
        result = {
            "status": f"INNER_{str(inner_status).upper()}",
            "reason": (
                checker.solver.reason_unknown()
                if inner_status == z3.unknown
                else "translated core replay completed"
            ),
            "literal_count": len(literals),
            "alias_class_count": len(classes),
            "elapsed_seconds": time.monotonic() - started,
            "trust_scope": "external-discovery-only-not-Lean-closure",
        }
    if args.output is not None:
        cegar.write_json_atomic(args.output, result)
    print(json.dumps(result, sort_keys=True))


if __name__ == "__main__":
    main()
