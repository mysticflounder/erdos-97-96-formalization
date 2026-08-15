#!/usr/bin/env python3
"""Independent evaluation of every parsed named clause at each SAT model."""

from __future__ import annotations

import json
from pathlib import Path

import z3
from z3.z3util import get_vars


HERE = Path(__file__).resolve().parent
CASES = ("retained", "common", "common_sameblocker")


def value_expr(term: z3.ExprRef, readback: dict[str, int | bool], labels: set[str]) -> z3.ExprRef:
    replacements = []
    for var in get_vars(term):
        name = str(var)
        if name in labels:
            value: z3.ExprRef = z3.BoolVal(True)
        elif name in readback:
            raw = readback[name]
            value = z3.BoolVal(raw) if isinstance(raw, bool) else z3.IntVal(int(raw))
        else:
            raise ValueError(f"unassigned constant {name}")
        replacements.append((var, value))
    return z3.simplify(z3.substitute(term, *replacements))


def validate(case: str) -> dict:
    base = (HERE / f"base_{case}.smt2").read_text()
    cuts = json.loads((HERE / f"cuts_{case}.json").read_text())
    text = base + "\n".join(item["clause"] for item in cuts)
    parsed = list(z3.parse_smt2_string(text))
    labels = {str(expr.arg(0)) for expr in parsed if z3.is_implies(expr)}
    iteration = json.loads((HERE / "iterations" / f"{case}-00.json").read_text())
    readback = iteration["readback"]
    failures = []
    for index, expr in enumerate(parsed):
        try:
            evaluated = value_expr(expr, readback, labels)
            if not z3.is_true(evaluated):
                failures.append({"index": index, "expression": str(expr),
                                 "evaluated": str(evaluated)})
        except (AssertionError, ValueError, z3.Z3Exception) as exc:
            failures.append({"index": index, "expression": str(expr), "error": str(exc)})
    return {"case": case, "parsed_assertions": len(parsed),
            "named_labels": len(labels), "status": "PASS" if not failures else "FAIL",
            "failures": failures}


def main() -> int:
    records = [validate(case) for case in CASES]
    errors = [record["case"] for record in records if record["status"] != "PASS"]
    result = {"status": "PASS" if not errors else "FAIL",
              "validator": "independent parsed-clause evaluator; imports no wave/schema module",
              "records": records, "errors": errors}
    (HERE / "FULL-CLAUSE-VALIDATION.json").write_text(json.dumps(result, indent=2, sort_keys=True) + "\n")
    print(result["status"])
    return 0 if not errors else 2


if __name__ == "__main__":
    raise SystemExit(main())
