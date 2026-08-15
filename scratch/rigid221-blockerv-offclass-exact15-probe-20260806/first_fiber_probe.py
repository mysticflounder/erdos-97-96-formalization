"""Add the source-proved exact first-apex fiber to the exact-15 probe.

The theorem-side ``lateFirstApexSystem`` has one exact four-point class at the
first physical apex.  Its members are exactly the sources whose blocker is
that apex.  All five points of the named physical five-class have explicitly
identified blockers different from the first apex, so the two classes are
disjoint.  This is still only a necessary-incidence probe, not a Euclidean
realizability checker.
"""

from __future__ import annotations

import json
import subprocess
from pathlib import Path

import probe

FIRST_APEX = 2


def build(order: tuple[int, ...]):
    model, instance, blocker, full_order = probe.build(order)

    # The selected row at theorem oppApex1 is its unique exact four-class.
    # Every named physical-class source has a fixed blocker in {v, xv,
    # deleted, c, e}, never oppApex1, hence none lies in this class.
    for choice in probe.choices(
        instance, FIRST_APEX, lambda row: bool(row & probe.CLASS)
    ):
        instance.cnf.add_clause((-choice,))

    return model, instance, blocker, full_order


def solve(order_index: int, order: tuple[int, ...]) -> dict[str, object]:
    _model, instance, blocker, full_order = build(order)
    stem = Path(__file__).with_name(f"first-fiber-order{order_index}")
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
    status = (
        "SAT"
        if run.returncode == 10
        else "UNSAT"
        if run.returncode == 20
        else f"ERR{run.returncode}"
    )
    result: dict[str, object] = {
        "status": status,
        "order_index": order_index,
        "strict_interior_order": list(order),
        "variables": instance.cnf.n_variables,
        "clauses": len(clauses),
    }
    if status == "SAT":
        rows, decoded = probe.validate_sat(
            instance, blocker, full_order, run.stdout
        )
        first_class = set(rows[FIRST_APEX])
        if first_class & probe.CLASS:
            raise RuntimeError("first-apex class meets the physical five-class")
        d = decoded[probe.C]
        result.update(
            {
                "rows": {str(center): row for center, row in rows.items()},
                "first_apex_class": sorted(first_class),
                "centerAt_c": d,
                "Kc": rows[d],
                "Kc_cap_hits": sorted(set(rows[d]) & probe.CAP),
                "Kc_class_hits": sorted(set(rows[d]) & probe.CLASS),
            }
        )
    return result


def main() -> int:
    results = [
        solve(order_index, order)
        for order_index, order in enumerate(probe.ORDERS)
    ]
    output = Path(__file__).with_suffix(".json")
    output.write_text(
        json.dumps(results, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )
    print(json.dumps(results, sort_keys=True))
    return 0 if all(r["status"] in ("SAT", "UNSAT") for r in results) else 1


if __name__ == "__main__":
    raise SystemExit(main())
