"""Five-row exact-15 core for the Rigid221 BlockerV off-class residual.

The four long-cap rows already have two fixed long-cap hits.  The general
same-cap bound therefore leaves exactly two support points outside that cap.
The first-apex row is only required to avoid the physical five-class.  This
script retains precisely those five rows, their pairwise circle alternation,
and the 17 metric-schema instances in the minimized semantic core.
"""

from __future__ import annotations

import argparse
import json
import subprocess
import sys
from itertools import combinations
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parents[2]))

from census.card_head.sat_encoding import CNF

N = 15
FIRST_APEX = 2
OUTSIDE_LONG_CAP = (1, 3, 4, 5, 13, 14)
PHYSICAL_CLASS = frozenset((6, 7, 8, 9, 10))
FIRST_APEX_ALLOWED = tuple(
    point for point in range(N) if point != FIRST_APEX and point not in PHYSICAL_CLASS
)
FIXED_HITS = {
    9: frozenset((6, 7)),
    8: frozenset((6, 9)),
    10: frozenset((8, 9)),
    11: frozenset((8, 10)),
}
CENTERS = (FIRST_APEX, 8, 9, 10, 11)
LONG_ORDERS = (
    (6, 8, 11, 10, 9, 12, 7),
    (6, 8, 11, 10, 12, 9, 7),
)

MOTIFS = (
    ((11, (3, 8)), (10, (1, 8)), (9, (1, 3))),
    ((11, (4, 8)), (10, (1, 8)), (9, (1, 4))),
    ((11, (5, 8)), (10, (1, 8)), (9, (1, 5))),
    ((11, (5, 8)), (10, (8, 14)), (9, (5, 14))),
    ((11, (8, 13)), (10, (8, 14)), (2, (13, 14))),
    ((8, (1, 9)), (11, (1, 8)), (10, (8, 9))),
    ((8, (3, 9)), (11, (3, 8)), (10, (8, 9))),
    ((8, (4, 9)), (11, (4, 8)), (10, (8, 9))),
    ((8, (5, 9)), (11, (5, 8)), (10, (8, 9))),
    ((8, (6, 9)), (10, (1, 9)), (9, (1, 6))),
    ((8, (6, 9)), (10, (3, 9)), (9, (3, 6))),
    ((8, (6, 9)), (10, (4, 9)), (9, (4, 6))),
    ((8, (6, 9)), (10, (5, 9)), (9, (5, 6))),
    ((8, (6, 9)), (10, (9, 13)), (9, (6, 13))),
    ((8, (6, 9)), (10, (9, 14)), (9, (6, 14))),
    ((8, (9, 13)), (11, (8, 13)), (10, (8, 9))),
    ((8, (9, 14)), (11, (8, 14)), (10, (8, 9))),
)


def supports() -> dict[int, tuple[frozenset[int], ...]]:
    rows = {
        center: tuple(
            FIXED_HITS[center] | frozenset(pair)
            for pair in combinations(OUTSIDE_LONG_CAP, 2)
        )
        for center in FIXED_HITS
    }
    rows[FIRST_APEX] = tuple(
        frozenset(row) for row in combinations(FIRST_APEX_ALLOWED, 4)
    )
    return rows


def arc_sides(order: tuple[int, ...], p: int, q: int) -> tuple[set[int], set[int]]:
    pos = {point: index for index, point in enumerate(order)}
    span = (pos[q] - pos[p]) % len(order)
    first = {
        point
        for point in order
        if 0 < (pos[point] - pos[p]) % len(order) < span
    }
    return first, set(order) - first - {p, q}


def build(order_index: int, *, include_motifs: bool):
    order = (0, *LONG_ORDERS[order_index], 2, 3, 4, 5, 1, 13, 14)
    rows = supports()
    cnf = CNF()
    choice = {
        (center, index): cnf.new_variable()
        for center in CENTERS
        for index in range(len(rows[center]))
    }
    for center in CENTERS:
        variables = [choice[(center, index)] for index in range(len(rows[center]))]
        cnf.add_clause(variables)
        cnf.at_most_sinz(variables, 1)

    for p, q in combinations(range(N), 2):
        required = {p, q}
        for side in arc_sides(order, p, q):
            variables = [
                choice[(center, index)]
                for center in CENTERS
                if center in side
                for index, row in enumerate(rows[center])
                if required <= row
            ]
            cnf.at_most_sinz(variables, 1)

    hit = {}
    if include_motifs:
        for motif in MOTIFS:
            for center, pair in motif:
                key = (center, tuple(sorted(pair)))
                if key in hit:
                    continue
                variable = cnf.new_variable()
                hit[key] = variable
                required = set(pair)
                for index, row in enumerate(rows[center]):
                    if required <= row:
                        cnf.add_clause((-choice[(center, index)], variable))
        for motif in MOTIFS:
            cnf.add_clause(
                tuple(-hit[(center, tuple(sorted(pair)))] for center, pair in motif)
            )
    return cnf, rows, choice, order


def solve(order_index: int, *, include_motifs: bool, timeout: int) -> dict[str, object]:
    cnf, rows, _choice, order = build(order_index, include_motifs=include_motifs)
    suffix = "full" if include_motifs else "smoke-no-motifs"
    stem = Path(__file__).with_name(f"compact-five-row-o{order_index}-{suffix}")
    clauses = cnf.clauses
    cnf_path = stem.with_suffix(".cnf")
    cnf_path.write_text(
        f"p cnf {cnf.n_variables} {len(clauses)}\n"
        + "\n".join(" ".join(map(str, clause)) + " 0" for clause in clauses)
        + "\n",
        encoding="utf-8",
    )
    run = subprocess.run(
        ["cadical", "-q", "-t", str(timeout), str(cnf_path)],
        capture_output=True,
        text=True,
        timeout=timeout + 30,
        check=False,
    )
    status = "SAT" if run.returncode == 10 else "UNSAT" if run.returncode == 20 else f"ERR{run.returncode}"
    result = {
        "order_index": order_index,
        "order": order,
        "include_motifs": include_motifs,
        "status": status,
        "variables": cnf.n_variables,
        "clauses": len(clauses),
        "candidate_counts": {str(center): len(rows[center]) for center in CENTERS},
    }
    stem.with_suffix(".json").write_text(
        json.dumps(result, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )
    stem.with_suffix(".solver.log").write_text(run.stdout + run.stderr, encoding="utf-8")
    print(json.dumps(result, sort_keys=True))
    return result


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("order_index", type=int, choices=range(2))
    parser.add_argument("--without-motifs", action="store_true")
    parser.add_argument("--timeout", type=int, default=300)
    args = parser.parse_args()
    result = solve(
        args.order_index,
        include_motifs=not args.without_motifs,
        timeout=args.timeout,
    )
    return 0 if result["status"] in ("SAT", "UNSAT") else 1


if __name__ == "__main__":
    raise SystemExit(main())
