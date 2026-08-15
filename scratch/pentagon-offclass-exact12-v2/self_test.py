#!/usr/bin/env python3
"""Known SAT/UNSAT solver and certificate guardrail."""

from __future__ import annotations

import json
import subprocess
from pathlib import Path

from metric_order_mine import boundary_orders
from source_sensitive_cegar import validate_source_order_contract


HERE = Path(__file__).resolve().parent


def run(command: list[str]) -> subprocess.CompletedProcess[str]:
    return subprocess.run(command, capture_output=True, text=True, timeout=30, check=False)


def main() -> int:
    sat = HERE / "selftest-sat.cnf"
    unsat = HERE / "selftest-unsat.cnf"
    proof = HERE / "selftest-unsat.drat"
    sat.write_text("p cnf 2 2\n1 2 0\n-1 2 0\n", encoding="utf-8")
    unsat.write_text("p cnf 1 2\n1 0\n-1 0\n", encoding="utf-8")
    sat_run = run(["cadical", "-q", str(sat)])
    unsat_run = run(["cadical", "-q", str(unsat), str(proof)])
    checked = run(["drat-trim", str(unsat), str(proof)])
    order_contract = validate_source_order_contract()
    bad_orders = list(boundary_orders())
    bad_orders[0] = tuple(
        8 if point == 7 else 7 if point == 8 else point
        for point in bad_orders[0]
    )
    negative_order_contract_rejected = False
    try:
        validate_source_order_contract(bad_orders)
    except RuntimeError:
        negative_order_contract_rejected = True
    result = {
        "schema": "p97_pentagon_offclass_exact12_v2.selftest.v1",
        "status": "PASS",
        "known_sat_returncode": sat_run.returncode,
        "known_unsat_returncode": unsat_run.returncode,
        "unsat_certificate_verified": checked.returncode == 0 and "s VERIFIED" in checked.stdout,
        "source_order_contract": order_contract,
        "negative_source_order_contract_rejected": negative_order_contract_rejected,
    }
    if (
        result["known_sat_returncode"] != 10
        or result["known_unsat_returncode"] != 20
        or not result["unsat_certificate_verified"]
        or not result["negative_source_order_contract_rejected"]
    ):
        raise RuntimeError(result)
    (HERE / "selftest.json").write_text(json.dumps(result, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    print("PASS known_sat=SAT known_unsat=UNSAT drat=VERIFIED")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
