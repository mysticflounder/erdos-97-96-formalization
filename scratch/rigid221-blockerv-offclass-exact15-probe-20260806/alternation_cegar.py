"""CEGAR selected-row cubes with the two-center cyclic-alternation theorem.

Each run fixes one complete cyclic order compatible with the source-proved cap
order.  A decoded SAT cube is independently checked and every pair of selected
rows with two common hits but nonalternating centers is added as a binary
nogood.  These are source-sound instances of the banked strict-Kalmanson
two-center theorem.
"""

from __future__ import annotations

import argparse
import json
import subprocess
from itertools import combinations
from pathlib import Path

import first_fiber_probe
import kalmanson_probe
import probe


def alternates(order: tuple[int, ...], c1: int, c2: int, p: int, q: int) -> bool:
    pos = {point: index for index, point in enumerate(order)}
    span = (pos[c2] - pos[c1]) % len(order)

    def in_arc(point: int) -> bool:
        offset = (pos[point] - pos[c1]) % len(order)
        return 0 < offset < span

    return in_arc(p) != in_arc(q)


def selected_variable(instance, center: int, row: list[int]) -> int:
    index = instance.candidate_index(center, row)
    return instance.choice_variables[(center, index)]


def violations(rows: dict[int, list[int]], order: tuple[int, ...]):
    result = []
    for c1, c2 in combinations(range(probe.N), 2):
        shared = sorted(set(rows[c1]) & set(rows[c2]))
        if len(shared) != 2:
            continue
        p, q = shared
        if not alternates(order, c1, c2, p, q):
            result.append((c1, c2, p, q))
    return result


def solve_case(long_order_index: int, order_variant: int, max_rounds: int):
    long_order = probe.ORDERS[long_order_index]
    complete_orders = list(kalmanson_probe.compatible_orders(long_order))
    complete_order = complete_orders[order_variant]
    _model, instance, blocker, cap_order = first_fiber_probe.build(long_order)
    cuts: set[tuple[int, int]] = set()
    history = []
    work = Path(__file__).with_name(
        f"alternation-o{long_order_index}-v{order_variant}"
    )

    for round_index in range(max_rounds):
        cnf_path = work.with_suffix(".cnf")
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
        if run.returncode == 20:
            status = "UNSAT"
            break
        if run.returncode != 10:
            status = f"ERR{run.returncode}"
            break

        rows, _decoded = probe.validate_sat(
            instance, blocker, cap_order, run.stdout
        )
        bad = violations(rows, complete_order)
        new_cuts = 0
        for c1, c2, _p, _q in bad:
            pair = tuple(
                sorted(
                    (
                        selected_variable(instance, c1, rows[c1]),
                        selected_variable(instance, c2, rows[c2]),
                    )
                )
            )
            if pair in cuts:
                continue
            cuts.add(pair)
            instance.cnf.add_clause((-pair[0], -pair[1]))
            new_cuts += 1
        history.append(
            {
                "round": round_index,
                "violations": len(bad),
                "new_cuts": new_cuts,
            }
        )
        if not bad:
            status = "SAT_ALTERNATING"
            surviving_rows = rows
            break
        if new_cuts == 0:
            raise RuntimeError("violations repeated without a new CEGAR cut")
    else:
        status = "ROUND_LIMIT"

    result = {
        "long_order_index": long_order_index,
        "order_variant": order_variant,
        "complete_order": list(complete_order),
        "status": status,
        "rounds": len(history),
        "cuts": len(cuts),
        "history": history,
    }
    if status == "SAT_ALTERNATING":
        result["rows"] = {str(center): row for center, row in surviving_rows.items()}
    output = work.with_suffix(".json")
    output.write_text(json.dumps(result, indent=2, sort_keys=True) + "\n")
    print(
        json.dumps(
            {key: value for key, value in result.items() if key not in ("history", "rows")},
            sort_keys=True,
        )
    )
    return 0 if status in ("UNSAT", "SAT_ALTERNATING") else 1


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("long_order_index", type=int, choices=range(len(probe.ORDERS)))
    parser.add_argument("order_variant", type=int, choices=range(12))
    parser.add_argument("--max-rounds", type=int, default=200)
    args = parser.parse_args()
    return solve_case(args.long_order_index, args.order_variant, args.max_rounds)


if __name__ == "__main__":
    raise SystemExit(main())
