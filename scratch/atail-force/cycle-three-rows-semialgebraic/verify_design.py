#!/usr/bin/env python3
"""Independent structural replay for the fixed-order QF_NRA design."""

from __future__ import annotations

from collections import Counter
import importlib.util
import json
from pathlib import Path
import sys

import z3


HERE = Path(__file__).resolve().parent
SPEC = importlib.util.spec_from_file_location(
    "semialgebraic_probe", HERE / "semialgebraic_probe.py"
)
assert SPEC is not None and SPEC.loader is not None
probe = importlib.util.module_from_spec(SPEC)
sys.modules[SPEC.name] = probe
SPEC.loader.exec_module(probe)


def main() -> None:
    cases = probe.load_live_cases()
    assert len(cases) == 990
    assert Counter(case.target_count for case in cases.values()) == {5: 360, 6: 630}
    for case in cases.values():
        if case.target_count != 5:
            continue
        shared = [block for block in case.blocks if len(block) == 2]
        assert len(shared) == 1
        assert {role[1] for role in shared[0]} == {"0", "1"}

    payload = json.loads((HERE / "PROBES.json").read_text())
    assert payload["reduction_boundary"]["status"] == (
        "CONDITIONAL_ON_SOURCE_OPEN_SHARED_BOUNDARY_ORDER_PACKET"
    )
    assert payload["finite_normal_form"] == {
        "five_target_fixed_orders": 360,
        "five_target_shared_rows": [0, 1],
        "six_target_fixed_orders": 630,
        "total_fixed_orders": 990,
    }
    expected = {
        "k5_0384": (34, 23, 11, 346),
        "k6_1584": (36, 23, 13, 393),
    }
    assert {record["case"] for record in payload["records"]} == set(expected)
    for record in payload["records"]:
        case_key = record["case"]
        system = probe.Builder(cases[case_key]).build()
        variable_count, equality_count, dimension, constraint_count = expected[case_key]
        assert len(system.variables) == variable_count
        assert system.equality_count == equality_count
        assert system.generic_equality_dimension == dimension
        assert len(system.constraints) == constraint_count
        assert record["variable_count"] == variable_count
        assert record["generically_independent_equality_count"] == equality_count
        assert record["generic_equality_dimension"] == dimension
        assert record["constraint_count"] == constraint_count
        assert record["z3"] == {"reason": "timeout", "status": "UNKNOWN"}
        assert record["cvc5"]["status"] == "UNKNOWN_NO_VERDICT"

        text = (HERE / record["smt2"]).read_text()
        assert text.count("(set-logic QF_NRA)") == 1
        assert text.count("(check-sat)") == 1
        parsed = z3.parse_smt2_file(str(HERE / record["smt2"]))
        assert len(parsed) == constraint_count

    assert set(payload["smoke_tests"].values()) == {"PASS"}
    print(
        "PASS: 990 conditional fixed-order leaves; "
        "k5 DOF=11, k6 DOF=13; representative z3/cvc5 probes UNKNOWN"
    )
    print(
        "PASS: shared anchored chiral boundary-order producer remains explicitly source-open"
    )


if __name__ == "__main__":
    main()
