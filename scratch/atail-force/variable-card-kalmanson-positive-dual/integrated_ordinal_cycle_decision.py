#!/usr/bin/env python3
"""Decide whether the exact-six outer forces a quotient ordinal cycle.

Every selected row equates its four spoke-distance atoms.  Each strict
Kalmanson inequality has two positive and two negative atoms.  If one
positive atom is equal in the row-generated quotient to one negative atom,
the remaining positive atom is strictly larger than the remaining negative
atom.  A rank function on quotient atoms exists exactly when all such
one-term cancellation comparisons are acyclic.

This encoding places the corrected n=14 structural outer, exact selected-row
strong connectivity, row-equality ranks, and every cancellation implication
in one finite-domain/bit-vector solver.  It does not load or generate literal
metric schemas.
SAT is replayed by an independent union-find/graph checker.  UNSAT remains an
external solver verdict until a checkable finite or theorem-level extraction
is produced.
"""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import itertools
import json
import sys
import time
from pathlib import Path

import z3


HERE = Path(__file__).resolve().parent
OUTER_PATH = HERE.parent / "exact6-allcenter-capaware-gate" / "allcenter_gate.py"


def load_outer_module():
    sys.path.insert(0, str(OUTER_PATH.parent))
    spec = importlib.util.spec_from_file_location("exact6_allcenter_gate_ordinal", OUTER_PATH)
    if spec is None or spec.loader is None:
        raise RuntimeError("cannot load corrected exact-six outer")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def add_strong_connectivity(outer, n: int) -> int:
    reach = {
        (step, left, right): z3.Bool(f"ord_reach_{step}_{left}_{right}")
        for step in range(n + 1)
        for left in range(n)
        for right in range(n)
    }
    count = 0
    for left in range(n):
        for right in range(n):
            base = z3.BoolVal(True) if left == right else outer.member[left, right]
            outer.solver.add(reach[0, left, right] == base)
            count += 1
    for step in range(n):
        for left in range(n):
            for right in range(n):
                outer.solver.add(
                    reach[step + 1, left, right]
                    == z3.Or(
                        reach[step, left, right],
                        z3.And(reach[step, left, step], reach[step, step, right]),
                    )
                )
                count += 1
    outer.solver.add(*(reach[n, left, right] for left in range(n) for right in range(n)))
    return count + n * n


def edge(left: int, right: int) -> tuple[int, int]:
    if left == right:
        raise ValueError("distance atom endpoints must be distinct")
    return tuple(sorted((left, right)))


def add_ordinal_rank_surface(module, outer):
    atoms = tuple(itertools.combinations(module.VERTICES, 2))
    width = max(1, len(atoms).bit_length())
    rank = {
        atom: z3.BitVec(f"ord_rank_{atom[0]}_{atom[1]}", width)
        for atom in atoms
    }
    for variable in rank.values():
        outer.solver.add(z3.ULT(variable, z3.BitVecVal(len(atoms), width)))

    row_equalities = 0
    for center in module.VERTICES:
        targets = [point for point in module.VERTICES if point != center]
        for left, right in itertools.combinations(targets, 2):
            outer.solver.add(z3.Implies(
                z3.And(outer.member[center, left], outer.member[center, right]),
                rank[edge(center, left)] == rank[edge(center, right)],
            ))
            row_equalities += 1

    # The complete physical-apex exact-five class supplies equality atoms not
    # necessarily all present in its selected K4 subrow.
    shell_equalities = 0
    shell_targets = [point for point in module.VERTICES if point != module.SECOND_APEX]
    for left, right in itertools.combinations(shell_targets, 2):
        outer.solver.add(z3.Implies(
            z3.And(outer.shell[left], outer.shell[right]),
            rank[edge(module.SECOND_APEX, left)]
            == rank[edge(module.SECOND_APEX, right)],
        ))
        shell_equalities += 1

    cancellation_implications = 0
    for a, b, c, d in itertools.combinations(module.VERTICES, 4):
        positive = (edge(a, c), edge(b, d))
        for negative in (
            (edge(a, b), edge(c, d)),
            (edge(a, d), edge(b, c)),
        ):
            for positive_index in range(2):
                for negative_index in range(2):
                    remaining_positive = positive[1 - positive_index]
                    remaining_negative = negative[1 - negative_index]
                    outer.solver.add(z3.Implies(
                        rank[positive[positive_index]] == rank[negative[negative_index]],
                        z3.UGT(rank[remaining_positive], rank[remaining_negative]),
                    ))
                    cancellation_implications += 1
    return rank, {
        "rank_atoms": len(atoms),
        "rank_bit_width": width,
        "guarded_selected_row_rank_equalities": row_equalities,
        "guarded_exact_five_shell_rank_equalities": shell_equalities,
        "kalmanson_cancellation_implications": cancellation_implications,
    }


class DisjointSet:
    def __init__(self, items):
        self.parent = {item: item for item in items}

    def find(self, item):
        parent = self.parent[item]
        if parent != item:
            self.parent[item] = self.find(parent)
        return self.parent[item]

    def union(self, left, right):
        left_root = self.find(left)
        right_root = self.find(right)
        if left_root != right_root:
            self.parent[right_root] = left_root


def independently_replay(module, decoded, serialized_ranks):
    rows = decoded["rows"]
    shell = decoded["shell"]
    connected, _ = module.strongly_connected(rows)
    if not connected:
        raise AssertionError("selected-row graph is not strongly connected")

    atoms = tuple(itertools.combinations(module.VERTICES, 2))
    dsu = DisjointSet(atoms)
    for center, support in rows.items():
        reference = edge(center, support[0])
        for point in support[1:]:
            dsu.union(reference, edge(center, point))
    shell_reference = edge(module.SECOND_APEX, shell[0])
    for point in shell[1:]:
        dsu.union(shell_reference, edge(module.SECOND_APEX, point))

    ranks = {
        tuple(map(int, name.split(","))): value
        for name, value in serialized_ranks.items()
    }
    for atom in atoms:
        if not 0 <= ranks[atom] < len(atoms):
            raise AssertionError(f"rank out of range at {atom}")
    for left, right in itertools.combinations(atoms, 2):
        if dsu.find(left) == dsu.find(right) and ranks[left] != ranks[right]:
            raise AssertionError(f"quotient rank mismatch at {left}, {right}")

    comparison_count = 0
    graph = {dsu.find(atom): set() for atom in atoms}
    for a, b, c, d in itertools.combinations(module.VERTICES, 4):
        positive = (edge(a, c), edge(b, d))
        for negative in (
            (edge(a, b), edge(c, d)),
            (edge(a, d), edge(b, c)),
        ):
            for positive_index in range(2):
                for negative_index in range(2):
                    canceled_positive = positive[positive_index]
                    canceled_negative = negative[negative_index]
                    if dsu.find(canceled_positive) != dsu.find(canceled_negative):
                        continue
                    remaining_positive = positive[1 - positive_index]
                    remaining_negative = negative[1 - negative_index]
                    if ranks[remaining_positive] <= ranks[remaining_negative]:
                        raise AssertionError(
                            f"rank fails cancellation at {(a, b, c, d)}"
                        )
                    graph[dsu.find(remaining_positive)].add(dsu.find(remaining_negative))
                    comparison_count += 1

    state = {vertex: 0 for vertex in graph}

    def visit(vertex):
        if state[vertex] == 1:
            raise AssertionError("quotient comparison graph has a cycle")
        if state[vertex] == 2:
            return
        state[vertex] = 1
        for target in graph[vertex]:
            visit(target)
        state[vertex] = 2

    for vertex in graph:
        visit(vertex)
    return {
        "status": "EXACT_ORDINAL_RANK_REPLAY_PASS",
        "quotient_class_count": len(graph),
        "active_cancellation_count": comparison_count,
    }


def solve(args):
    module = load_outer_module()
    started = time.monotonic()
    outer = module.Outer(args.orbit, args.timeout_ms, args.seed, args.engine)
    connectivity_count = add_strong_connectivity(outer, module.N)
    rank, counts = add_ordinal_rank_surface(module, outer)
    build_elapsed = time.monotonic() - started
    if args.log is not None:
        args.log.write_text(json.dumps({
            "phase": "solver_built",
            "orbit": args.orbit,
            "build_elapsed_seconds": build_elapsed,
            "connectivity_clause_count": connectivity_count,
            "ordinal_counts": counts,
        }, sort_keys=True) + "\n", encoding="utf-8")

    status = outer.solver.check()
    if status == z3.sat:
        model = outer.solver.model()
        decoded = outer.decode(model)
        serialized_ranks = {
            f"{left},{right}": model.eval(variable, model_completion=True).as_long()
            for (left, right), variable in rank.items()
        }
        replay = independently_replay(module, decoded, serialized_ranks)
        result = {
            "status": "SAT_VERIFIED_EXACT_ORDINAL_COUNTERMODEL",
            "decoded": module.jsonable_decoded(decoded),
            "ranks": serialized_ranks,
            "ordinal_replay": replay,
        }
    elif status == z3.unsat:
        result = {
            "status": "UNSAT_EXTERNAL_NO_CERTIFICATE",
            "reason": "corrected structural outer forces quotient ordinal cycle",
        }
    else:
        result = {"status": "UNKNOWN", "reason": outer.solver.reason_unknown()}
    result.update({
        "schema": "p97-exact6-integrated-ordinal-cycle-decision-v1",
        "epistemic_status": "EXACT_IF_SAT_EXTERNAL_BOUNDED_IF_UNSAT_OR_UNKNOWN",
        "orbit": args.orbit,
        "n": module.N,
        "seed": args.seed,
        "engine": args.engine,
        "timeout_ms": args.timeout_ms,
        "elapsed_seconds": time.monotonic() - started,
        "build_elapsed_seconds": build_elapsed,
        "connectivity": "FLOYD_WARSHALL_ALL_PAIRS_EXACT",
        "connectivity_clause_count": connectivity_count,
        "ordinal_counts": counts,
        "complete_shell_selected_row_alternation": True,
        "literal_metric_schema_cuts": 0,
        "outer_source": str(OUTER_PATH),
        "outer_source_sha256": sha256(OUTER_PATH),
        "solver_statistics": str(outer.solver.statistics()),
    })
    if args.log is not None:
        with args.log.open("a", encoding="utf-8") as handle:
            handle.write(json.dumps({
                "phase": "terminal",
                "orbit": args.orbit,
                "status": result["status"],
                "elapsed_seconds": result["elapsed_seconds"],
            }, sort_keys=True) + "\n")
    return result


def main() -> int:
    module = load_outer_module()
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--orbit", choices=module.ORBITS, required=True)
    parser.add_argument("--seed", type=int, default=0)
    parser.add_argument("--engine", choices=("qffd", "z3"), default="qffd")
    parser.add_argument("--timeout-ms", type=int, default=180_000)
    parser.add_argument("--output", type=Path)
    parser.add_argument("--log", type=Path)
    args = parser.parse_args()
    result = solve(args)
    rendered = json.dumps(result, indent=2, sort_keys=True) + "\n"
    if args.output is not None:
        args.output.write_text(rendered, encoding="utf-8")
    print(rendered, end="")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
