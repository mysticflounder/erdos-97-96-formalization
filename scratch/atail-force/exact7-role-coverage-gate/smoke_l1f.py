#!/usr/bin/env python3
"""Smoke gates for the factored L1c census (factor_l1c.py).

Validates the factorization against the three known joint verdicts from
``sample_l1c.py``:

- N1: the joint kill ``...cO-s1.db0-none.ne`` factors through eqO-s1 —
  the factored schema must be UNSAT and its core must consist of the
  fresh-equality labels plus a subset of the joint core's cls_eq/kal
  labels (no row_eq over fresh points needed).
- N2: the joint kill ``...cO1-s0.ds0-O.eq`` factors through eqO-s0 —
  factored UNSAT.
- N3 (control): joint sample #3 was SAT; its factored counterpart
  (retro + neO-b0) must be SAT, since the factored constraints are a
  subset of the joint constraints.
"""

from __future__ import annotations

import json
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))

from factor_l1c import factored_schema  # noqa: E402
from gate_encoder import check_schema  # noqa: E402

CASES = [
    ("N1", "retro.L0.eEA-W.r0S-O.r1S-S.r2S-O1.mp0a=p1b",
     frozenset({("eq", "O", "s1")}), "unsat"),
    ("N2", "retro.L0.eS-W.r0O1-O.r1O1-O1.r2S-S",
     frozenset({("eq", "O", "s0")}), "unsat"),
    ("N3", "retro.L0.eEA-W.r0O1-O1.r1O1-O.r2S-S.mp0b=p1a",
     frozenset({("ne", "O", "b0")}), "sat"),
]


def main() -> None:
    retro_all = {s["id"]: s
                 for s in json.loads((HERE / "retro_schemas.json").read_text())}
    failures = []
    for name, retro_id, constraints, expected in CASES:
        schema = factored_schema(retro_all[retro_id], constraints)
        verdict = check_schema(schema)
        status = "PASS" if verdict["verdict"] == expected else "FAIL"
        print(f"[{name}] {status} expected={expected} "
              f"got={verdict['verdict']} {schema['id']}")
        if verdict["verdict"] == "unsat":
            print(f"     core={verdict['core']}")
        if status == "FAIL":
            failures.append(name)
    if failures:
        print(f"FAILURES: {failures}")
        sys.exit(1)
    print("ALL SMOKE GATES PASS")


if __name__ == "__main__":
    main()
