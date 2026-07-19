#!/usr/bin/env python3
"""Test the bare variable-cardinality positive-dual conjecture directly.

The finite outer has only one non-self four-member selected row at every
cyclic vertex and exact selected-edge strong connectivity.  A bit-vector rank
function forbids every equality-quotiented one-term Kalmanson cycle.  The
formula is bit-blasted and solved by CaDiCaL.  If SAT, its fixed row table is
immediately checked against the *full* strict K1/K2 linear system.  A SAT LRA
model is therefore an exact rational countermodel to the bare generic
positive-dual conjecture, not merely to the ordinal subroute.
"""

from __future__ import annotations

import argparse
import hashlib
import itertools
import json
import subprocess
import time
from fractions import Fraction
from pathlib import Path

import z3


def edge(left: int, right: int) -> tuple[int, int]:
    if left == right:
        raise ValueError("self distance has no atom")
    return tuple(sorted((left, right)))


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def q(value: z3.RatNumRef) -> Fraction:
    return Fraction(value.numerator_as_long(), value.denominator_as_long())


def qstr(value: Fraction) -> str:
    if value.denominator == 1:
        return str(value.numerator)
    return f"{value.numerator}/{value.denominator}"


def add_connectivity(solver, member, n: int) -> int:
    reach = {
        (step, left, right): z3.Bool(f"bare_reach_{step}_{left}_{right}")
        for step in range(n + 1)
        for left in range(n)
        for right in range(n)
    }
    count = 0
    for left in range(n):
        for right in range(n):
            base = z3.BoolVal(True) if left == right else member[left, right]
            solver.add(reach[0, left, right] == base)
            count += 1
    for step in range(n):
        for left in range(n):
            for right in range(n):
                solver.add(
                    reach[step + 1, left, right]
                    == z3.Or(
                        reach[step, left, right],
                        z3.And(reach[step, left, step], reach[step, step, right]),
                    )
                )
                count += 1
    solver.add(*(reach[n, left, right] for left in range(n) for right in range(n)))
    return count + n * n


def build_finite_formula(n: int):
    solver = z3.Solver()
    member = {
        (center, point): z3.Bool(f"bare_m_{center}_{point}")
        for center in range(n)
        for point in range(n)
    }
    for center in range(n):
        solver.add(z3.Not(member[center, center]))
        solver.add(z3.PbEq([(member[center, point], 1) for point in range(n)], 4))
    connectivity_count = add_connectivity(solver, member, n)

    atoms = tuple(itertools.combinations(range(n), 2))
    width = max(1, len(atoms).bit_length())
    rank = {
        atom: z3.BitVec(f"bare_rank_{atom[0]}_{atom[1]}", width)
        for atom in atoms
    }
    for variable in rank.values():
        solver.add(z3.ULT(variable, z3.BitVecVal(len(atoms), width)))
    row_equalities = 0
    for center in range(n):
        targets = [point for point in range(n) if point != center]
        for left, right in itertools.combinations(targets, 2):
            solver.add(z3.Implies(
                z3.And(member[center, left], member[center, right]),
                rank[edge(center, left)] == rank[edge(center, right)],
            ))
            row_equalities += 1
    cancellations = 0
    for a, b, c, d in itertools.combinations(range(n), 4):
        positive = (edge(a, c), edge(b, d))
        for negative in (
            (edge(a, b), edge(c, d)),
            (edge(a, d), edge(b, c)),
        ):
            for pi in range(2):
                for ni in range(2):
                    solver.add(z3.Implies(
                        rank[positive[pi]] == rank[negative[ni]],
                        z3.UGT(rank[positive[1 - pi]], rank[negative[1 - ni]]),
                    ))
                    cancellations += 1
    return solver, member, {
        "connectivity_clause_count": connectivity_count,
        "rank_atoms": len(atoms),
        "rank_bit_width": width,
        "guarded_selected_row_rank_equalities": row_equalities,
        "kalmanson_cancellation_implications": cancellations,
    }


def parse_named_variables(cnf: str) -> dict[int, str]:
    answer = {}
    for line in cnf.splitlines():
        if line.startswith("c "):
            fields = line.split(maxsplit=2)
            if len(fields) == 3 and fields[1].isdigit():
                answer[int(fields[1])] = fields[2]
    return answer


def parse_solution(path: Path) -> tuple[str, dict[int, bool]]:
    status = "UNKNOWN"
    values = {}
    if not path.exists():
        return status, values
    for line in path.read_text(encoding="utf-8").splitlines():
        if line.startswith("s "):
            if "UNSATISFIABLE" in line:
                status = "UNSAT"
            elif "SATISFIABLE" in line:
                status = "SAT"
        elif line.startswith("v "):
            for text in line[2:].split():
                literal = int(text)
                if literal:
                    values[abs(literal)] = literal > 0
    return status, values


def strongly_connected(rows: dict[int, tuple[int, ...]], n: int) -> bool:
    for start in range(n):
        seen = {start}
        work = [start]
        while work:
            source = work.pop()
            for target in rows[source]:
                if target not in seen:
                    seen.add(target)
                    work.append(target)
        if len(seen) != n:
            return False
    return True


def full_linear_check(rows: dict[int, tuple[int, ...]], n: int, timeout_ms: int):
    atoms = tuple(itertools.combinations(range(n), 2))
    table = {atom: z3.Real(f"bare_d_{atom[0]}_{atom[1]}") for atom in atoms}

    def dist(left: int, right: int):
        return table[edge(left, right)]

    solver = z3.Solver()
    solver.set(timeout=timeout_ms)
    for a, b, c, d in itertools.combinations(range(n), 4):
        diagonal = dist(a, c) + dist(b, d)
        solver.add(
            diagonal >= dist(a, b) + dist(c, d) + 1,
            diagonal >= dist(a, d) + dist(b, c) + 1,
        )
    for center, support in rows.items():
        reference = support[0]
        for point in support[1:]:
            solver.add(dist(center, point) == dist(center, reference))
    status = solver.check()
    if status == z3.unsat:
        return {"status": "UNSAT"}
    if status == z3.unknown:
        return {"status": "UNKNOWN", "reason": solver.reason_unknown()}
    model = solver.model()
    distances = {
        f"{left},{right}": q(model.eval(variable, model_completion=True))
        for (left, right), variable in table.items()
    }
    for center, support in rows.items():
        radius = distances[",".join(map(str, edge(center, support[0])))]
        for point in support[1:]:
            if distances[",".join(map(str, edge(center, point)))] != radius:
                raise AssertionError("row equality replay failed")
    for a, b, c, d in itertools.combinations(range(n), 4):
        diagonal = distances[f"{a},{c}"] + distances[f"{b},{d}"]
        if diagonal < distances[f"{a},{b}"] + distances[f"{c},{d}"] + 1:
            raise AssertionError("K1 replay failed")
        if diagonal < distances[f"{a},{d}"] + distances[f"{b},{c}"] + 1:
            raise AssertionError("K2 replay failed")
    return {
        "status": "SAT_EXACT_RATIONAL_REPLAY_PASS",
        "distances": {name: qstr(value) for name, value in distances.items()},
    }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--n", type=int, default=14)
    parser.add_argument("--cadical-seconds", type=int, default=120)
    parser.add_argument("--linear-timeout-ms", type=int, default=120_000)
    parser.add_argument("--cnf", type=Path, required=True)
    parser.add_argument("--solution", type=Path, required=True)
    parser.add_argument("--log", type=Path, required=True)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()

    started = time.monotonic()
    solver, _member, counts = build_finite_formula(args.n)
    goal = z3.Goal()
    goal.add(*solver.assertions())
    transformed = z3.Then(
        "simplify", "propagate-values", "solve-eqs",
        "card2bv", "bit-blast", "tseitin-cnf",
    )(goal)
    if len(transformed) != 1:
        raise AssertionError("unexpected CNF subgoal count")
    cnf = transformed[0].dimacs(include_names=True)
    args.cnf.write_text(cnf, encoding="utf-8")
    completed = subprocess.run(
        [
            "cadical", "--plain", "-t", str(args.cadical_seconds),
            "-w", str(args.solution), str(args.cnf),
        ],
        text=True,
        capture_output=True,
        check=False,
    )
    args.log.write_text(completed.stdout + completed.stderr, encoding="utf-8")
    cadical_status, values = parse_solution(args.solution)
    if completed.returncode == 10:
        cadical_status = "SAT"
    elif completed.returncode == 20:
        cadical_status = "UNSAT"

    rows = None
    linear = None
    if cadical_status == "SAT":
        named = parse_named_variables(cnf)
        projected = {
            name: values[variable]
            for variable, name in named.items()
            if name.startswith("bare_m_")
        }
        rows = {}
        for center in range(args.n):
            rows[center] = tuple(
                point for point in range(args.n)
                if point != center and projected[f"bare_m_{center}_{point}"]
            )
            if len(rows[center]) != 4:
                raise AssertionError(f"invalid decoded row {center}: {rows[center]}")
        if not strongly_connected(rows, args.n):
            raise AssertionError("decoded selected graph is not strongly connected")
        linear = full_linear_check(rows, args.n, args.linear_timeout_ms)

    if cadical_status == "SAT" and linear["status"] == "SAT_EXACT_RATIONAL_REPLAY_PASS":
        status = "COUNTERMODEL_TO_BARE_GENERIC_POSITIVE_DUAL"
    elif cadical_status == "SAT":
        status = "ORDINAL_ACYCLIC_CANDIDATE_FULL_LINEAR_NOT_SAT"
    elif cadical_status == "UNSAT":
        status = "ORDINAL_UNSAT_EXTERNAL_NO_PROOF"
    else:
        status = "UNKNOWN_WALL_BUDGET"
    result = {
        "schema": "p97-bare-variable-card-positive-dual-decision-v1",
        "epistemic_status": (
            "EXACT_RATIONAL_COUNTERMODEL" if status.startswith("COUNTERMODEL")
            else "BOUNDED_THEOREM_DISCOVERY"
        ),
        "status": status,
        "n": args.n,
        "counts": counts,
        "cadical_returncode": completed.returncode,
        "cadical_seconds": args.cadical_seconds,
        "elapsed_seconds": time.monotonic() - started,
        "cnf_sha256": sha256(args.cnf),
        "log_sha256": sha256(args.log),
        "solution_sha256": sha256(args.solution) if args.solution.exists() else None,
        "rows": {str(center): list(support) for center, support in rows.items()} if rows else None,
        "full_linear": linear,
        "assumptions": [
            "one non-self selected four-member row at every cyclic center",
            "selected-edge strong connectivity",
            "all strict K1 and K2 inequalities",
            "all selected-row spoke equalities",
        ],
        "omitted": [
            "triangle inequalities",
            "distance positivity",
            "cap and apex roles",
            "pair incidence bounds",
            "blocker map",
            "exact-five shell",
        ],
        "literal_metric_schema_cuts": 0,
    }
    args.output.write_text(json.dumps(result, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    print(json.dumps({
        "status": status,
        "n": args.n,
        "cadical_status": cadical_status,
        "linear_status": linear["status"] if linear else None,
        "elapsed_seconds": result["elapsed_seconds"],
    }, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
