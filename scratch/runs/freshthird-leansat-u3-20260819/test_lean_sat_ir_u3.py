#!/usr/bin/env python3
"""Small semantic tests for the U3 LeanSatIr exporter."""

from __future__ import annotations

import importlib.util
from itertools import combinations
from pathlib import Path


ROOT = Path(__file__).parent
spec = importlib.util.spec_from_file_location("lean_sat_ir_u3", ROOT / "lean_sat_ir_u3.py")
assert spec and spec.loader
module = importlib.util.module_from_spec(spec)
spec.loader.exec_module(module)


def eval_expr(expr, env):
    tag, value = next(iter(expr.items()))
    if tag == "Const":
        return value
    if tag == "Pred":
        arg = value["args"][0]["Lit"]["value"]
        return (value["name"], arg) in env
    if tag == "Not":
        return not eval_expr(value, env)
    if tag == "And":
        return eval_expr(value[0], env) and eval_expr(value[1], env)
    if tag == "Or":
        return eval_expr(value[0], env) or eval_expr(value[1], env)
    raise AssertionError(f"unexpected tag {tag}")


def witness(n=17):
    env = set()
    for name, index in zip(module.POINTS, range(8)):
        env.add((f"point_{name}", index))
    for index in (0, 2, 3, 4):
        env.add(("dangerous_base", index))
    for index in (0, 1, 2, 3, 4, 5, 6, 7):
        env.add(("bounded_support", index))
    # Each row is an exact four-point q-deleted row.  Every row has at most two
    # dangerous points; the first row escapes at 8.
    rows = {
        "u": (1, 6, 7, 8),
        "a0": (1, 5, 7, 8),
        "a1": (1, 5, 6, 8),
        "t1": (1, 5, 6, 7),
        "t2": (1, 5, 6, 7),
        "t3": (1, 5, 6, 7),
    }
    for center, indices in rows.items():
        for index in indices:
            env.add((f"row_{center}", index))
    return env


def test_exported_formula_accepts_known_source_frame():
    formula = module.ir(17)["formula"]
    assert eval_expr(formula, witness())


def test_same_index_distribution_rejects_three_point_overlap():
    env = witness()
    env.difference_update({("row_u", 1), ("row_u", 6), ("row_u", 7), ("row_u", 8)})
    env.update({("row_u", 2), ("row_u", 3), ("row_u", 4), ("row_u", 8)})
    assert not eval_expr(module.ir(17)["formula"], env)


def test_outside_obstruction_is_required():
    env = witness()
    env.difference_update({("row_u", 8), ("row_a0", 8), ("row_a1", 8)})
    assert not eval_expr(module.ir(17)["formula"], env)


def test_selector_ir_uses_finite_function_tables():
    exported = module.selector_ir(8)
    assert [domain["name"] for domain in exported["domains"]] == ["I", "S4", "S8"]
    assert len(exported["functions"]) == 16
    assert exported["predicates"] == []
    assert exported["bool_atoms"] == []
