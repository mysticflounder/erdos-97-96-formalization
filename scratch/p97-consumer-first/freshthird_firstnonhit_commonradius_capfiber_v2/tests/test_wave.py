#!/usr/bin/env python3
"""Independent readback checks; this does not invoke a solver."""

import json
from pathlib import Path

HERE = Path(__file__).resolve().parents[1]
EXPECTED = {
    "main_nonalias": ("sat", "sat"),
    "alias_c0_q0": ("sat", "sat"),
    "allowed_two_b_fiber": ("sat", "sat"),
    "regression_ui_notK_no_bfiber": ("sat", "sat"),
    "malformed_c0_eq_c1": ("unsat", "unsat"),
    "malformed_duplicate_ui": ("unsat", "unsat"),
    "malformed_third_intersection": ("unsat", "unsat"),
    "malformed_three_b_fiber": ("unsat", "unsat"),
}


def check_model(case, model):
    c0, c1, q0, q1, b = (model[x] for x in ("c0", "c1", "q0", "q1", "b"))
    K, cap = set(model["K"]), set(model["Cap"])
    assert len(K) == 4 and c0 in K and c1 in K and q0 in K and q1 in K
    assert c0 != c1 and q0 != q1 and c0 in cap and c1 in cap and b in cap
    assert K & cap == {c0, c1}
    assert len({model[f"u{i}"] for i in range(4)}) == 4
    assert all(model[f"u{i}"] in cap and model[f"u{i}"] not in K for i in range(4))
    assert model["c0"] == model["q0"] if case == "alias_c0_q0" else model["c0"] != model["q0"]
    for row in ("C0", "C1", "R0", "R1"):
        assert len(model["rows"][row]) == 4
    assert set(model["rows"]["C0"]) == K == set(model["rows"]["C1"])
    for row in ("R0", "R1"):
        assert len(set(model["rows"][row]) & K) <= 2


def main():
    records = json.loads((HERE / "results.json").read_text())
    assert {r["case"] for r in records} == set(EXPECTED)
    for r in records:
        ez, ec = EXPECTED[r["case"]]
        assert (r["z3"], r["cvc5"]) == (ez, ec), r
        if ez == "sat":
            check_model(r["case"], r["model"])
    print(f"validated {len(records)} cases: dual status and SAT readback clauses")


if __name__ == "__main__":
    main()
