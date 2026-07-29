#!/usr/bin/env python3
"""Check equality-minimality of the exact six-vertex v16 obstruction."""

from __future__ import annotations

import importlib.util
import json
import sys
import time
from pathlib import Path

import z3


HERE = Path(__file__).resolve().parent
MINER = HERE.parent / "exact_euclidean_subset_core_miner.py"
SYSTEM = HERE / "positive-system.json"
SUBSET = (5, 7, 9, 10, 11, 12)
INDEPENDENT_SOURCES = (16, 19, 22, 23, 34)
TIMEOUT_MS = 60_000


def load_miner():
    spec = importlib.util.spec_from_file_location("exact_subset_miner", MINER)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot load {MINER}")
    module = importlib.util.module_from_spec(spec)
    sys.modules[spec.name] = module
    spec.loader.exec_module(module)
    return module


def main() -> int:
    miner = load_miner()
    raw = json.loads(SYSTEM.read_text())
    equations = miner.normalize_equations(
        raw["equations"],
        expected_class_count=19,
        expected_equation_count=38,
    )
    selected = [
        equation
        for equation in miner.induced_equations(SUBSET, equations)
        if equation.source_index in INDEPENDENT_SOURCES
    ]
    local = {vertex: index for index, vertex in enumerate(SUBSET)}
    x = [z3.Real(f"x_{i}") for i in range(len(SUBSET))]
    y = [z3.Real(f"y_{i}") for i in range(len(SUBSET))]
    background: list[z3.BoolRef] = [
        x[local[5]] == 0,
        y[local[5]] == 0,
        x[local[10]] == 1,
        y[local[10]] == 0,
    ]
    k = len(SUBSET)
    for a in range(k):
        b = (a + 1) % k
        for c in range(k):
            if c not in (a, b):
                background.append(miner.orient(x, y, a, b, c) > 0)
    eq_expressions: dict[int, z3.BoolRef] = {}
    for equation in selected:
        la, lb = (local[v] for v in equation.left_edge)
        ra, rb = (local[v] for v in equation.right_edge)
        eq_expressions[equation.source_index] = (
            miner.dist2(x, y, la, lb) == miner.dist2(x, y, ra, rb)
        )

    checks = []
    variants = [("all_five", None)] + [
        (f"drop_source_{source}", source) for source in INDEPENDENT_SOURCES
    ]
    for label, dropped in variants:
        assertions = background + [
            expression
            for source, expression in eq_expressions.items()
            if source != dropped
        ]
        solver = z3.SolverFor("QF_NRA")
        solver.set(timeout=TIMEOUT_MS, random_seed=0)
        solver.add(*assertions)
        started = time.monotonic()
        verdict = solver.check()
        elapsed = time.monotonic() - started
        valid = None
        if verdict == z3.sat:
            valid = all(
                z3.is_true(solver.model().eval(item, model_completion=True))
                for item in assertions
            )
        direct = z3.SolverFor("QF_NRA")
        direct.add(*assertions)
        smt2 = direct.to_smt2()
        smt2_path = HERE / f"core6-minimal-{label}.smt2"
        smt2_path.write_text(smt2)
        cvc5 = miner.run_cvc5_text(smt2, TIMEOUT_MS)
        checks.append(
            {
                "label": label,
                "dropped_source": dropped,
                "retained_sources": [
                    source for source in INDEPENDENT_SOURCES if source != dropped
                ],
                "z3": {
                    "status": str(verdict).upper(),
                    "elapsed_seconds": elapsed,
                    "model_substitution_status": (
                        "PASS" if valid is True else "FAIL" if valid is False else None
                    ),
                    "reason_unknown": (
                        solver.reason_unknown() if verdict == z3.unknown else None
                    ),
                },
                "cvc5": cvc5,
                "smt2": str(smt2_path),
            }
        )
    base_unsat = checks[0]["cvc5"]["status"] == "UNSAT"
    drops_sat = all(
        check["z3"]["status"] == "SAT"
        and check["z3"]["model_substitution_status"] == "PASS"
        for check in checks[1:]
    )
    status = (
        "EQUALITY_MINIMAL_VALIDATED" if base_unsat and drops_sat else "INCOMPLETE"
    )
    output = {
        "schema": "v16-core6-equality-minimality-v1",
        "epistemic_status": status,
        "subset": list(SUBSET),
        "independent_source_equations": [
            equation.as_json() for equation in selected
        ],
        "omitted_transitive_source": 36,
        "checks": checks,
        "interpretation": (
            "The five retained source equalities are jointly UNSAT with strict "
            "convexity; deleting any one has an exact Z3 SAT model that passes "
            "substitution. Vertex-minimality separately follows from the "
            "exhaustive exact SAT census for every five-class subset."
        ),
    }
    output_path = HERE / "core6-equality-minimality.json"
    output_path.write_text(json.dumps(output, indent=2, sort_keys=True) + "\n")
    print(
        json.dumps(
            {
                "output": str(output_path),
                "status": status,
                "checks": [
                    {
                        "label": check["label"],
                        "z3": check["z3"]["status"],
                        "z3_replay": check["z3"]["model_substitution_status"],
                        "cvc5": check["cvc5"]["status"],
                    }
                    for check in checks
                ],
            },
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
