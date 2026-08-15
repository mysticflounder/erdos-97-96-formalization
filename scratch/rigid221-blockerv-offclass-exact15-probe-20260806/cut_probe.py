"""Price hypothetical placement cuts against the exact-15 incidence probe.

These cuts are theorem-discovery hypotheses, not source-entitled facts.  A SAT
result is independently decoded and checked by ``probe.validate_sat``.  An
UNSAT result is diagnostic only; this script does not emit a proof certificate.
"""

from __future__ import annotations

import json
import subprocess
from pathlib import Path

import probe


def force_blocker_center(instance, blocker, allowed: frozenset[int]) -> None:
    probe.require_some(
        instance,
        [blocker[(probe.C, center)] for center in sorted(allowed) if (probe.C, center) in blocker],
        "allowed centerAt c",
    )


def force_row_property(instance, blocker, predicate) -> None:
    for center in range(probe.N):
        variable = blocker.get((probe.C, center))
        if variable is None:
            continue
        allowed = probe.choices(instance, center, predicate)
        instance.cnf.add_clause((-variable, *allowed))


def forbid_row_property(instance, blocker, predicate) -> None:
    for center in range(probe.N):
        variable = blocker.get((probe.C, center))
        if variable is None:
            continue
        for choice in probe.choices(instance, center, predicate):
            instance.cnf.add_clause((-variable, -choice))


def add_cut(instance, blocker, cut: str) -> None:
    if cut == "d_in_cap":
        force_blocker_center(instance, blocker, probe.CAP)
    elif cut == "d_in_interior":
        force_blocker_center(instance, blocker, probe.INTERIOR)
    elif cut == "e_in_kc":
        force_row_property(instance, blocker, lambda row: probe.E in row)
    elif cut == "e_not_in_kc":
        forbid_row_property(instance, blocker, lambda row: probe.E in row)
    elif cut == "kc_two_cap_hits":
        force_row_property(instance, blocker, lambda row: len(row & probe.CAP) >= 2)
    elif cut == "kc_second_interior_hit":
        force_row_property(
            instance,
            blocker,
            lambda row: bool((row & probe.INTERIOR) - {probe.C}),
        )
    elif cut == "kc_one_class_hit":
        force_row_property(instance, blocker, lambda row: bool(row & probe.CLASS))
    else:
        raise ValueError(f"unknown cut: {cut}")


CASES = {
    "d_in_cap": ("d_in_cap",),
    "d_in_interior": ("d_in_interior",),
    "d_in_cap_e_in_kc": ("d_in_cap", "e_in_kc"),
    "d_in_cap_e_not_in_kc": ("d_in_cap", "e_not_in_kc"),
    "d_in_cap_two_cap_hits": ("d_in_cap", "kc_two_cap_hits"),
    "d_in_cap_second_interior_hit": ("d_in_cap", "kc_second_interior_hit"),
    "d_in_cap_one_class_hit": ("d_in_cap", "kc_one_class_hit"),
}


def solve(case: str, cuts: tuple[str, ...], order_index: int, order: tuple[int, ...]):
    _model, instance, blocker, full_order = probe.build(order)
    for cut in cuts:
        add_cut(instance, blocker, cut)
    stem = Path(__file__).with_name(f"cut-{case}-order{order_index}")
    cnf_path = stem.with_suffix(".cnf")
    clauses = instance.cnf.clauses
    cnf_path.write_text(
        f"p cnf {instance.cnf.n_variables} {len(clauses)}\n"
        + "\n".join(" ".join(map(str, clause)) + " 0" for clause in clauses)
        + "\n",
        encoding="utf-8",
    )
    run = subprocess.run(
        ["cadical", "-q", "-t", "120", str(cnf_path)],
        capture_output=True,
        text=True,
        timeout=150,
        check=False,
    )
    stem.with_suffix(".solver.log").write_text(
        run.stdout + run.stderr, encoding="utf-8"
    )
    status = "SAT" if run.returncode == 10 else "UNSAT" if run.returncode == 20 else f"ERR{run.returncode}"
    result: dict[str, object] = {
        "case": case,
        "cuts": list(cuts),
        "order": order_index,
        "status": status,
        "variables": instance.cnf.n_variables,
        "clauses": len(clauses),
    }
    if status == "SAT":
        rows, decoded = probe.validate_sat(instance, blocker, full_order, run.stdout)
        d = decoded[probe.C]
        result.update(
            {
                "centerAt_c": d,
                "Kc": rows[d],
                "Kc_cap_hits": sorted(set(rows[d]) & probe.CAP),
                "Kc_class_hits": sorted(set(rows[d]) & probe.CLASS),
            }
        )
    return result


def main() -> int:
    results = [
        solve(case, cuts, order_index, order)
        for case, cuts in CASES.items()
        for order_index, order in enumerate(probe.ORDERS)
    ]
    output = Path(__file__).with_suffix(".json")
    output.write_text(json.dumps(results, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    summary = [
        {
            "case": result["case"],
            "order": result["order"],
            "status": result["status"],
            "centerAt_c": result.get("centerAt_c"),
            "Kc": result.get("Kc"),
        }
        for result in results
    ]
    print(json.dumps(summary, sort_keys=True))
    return 0 if all(result["status"] in ("SAT", "UNSAT") for result in results) else 1


if __name__ == "__main__":
    raise SystemExit(main())
