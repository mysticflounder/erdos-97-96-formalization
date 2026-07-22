#!/usr/bin/env python3
"""Integrated exact-five B0 plus ordinal/Kalmanson cycle decision.

This is a scratch-only decision harness.  It adds to the source-faithful B0
outer:

* exact all-pairs strong connectivity for m, g0, and g1;
* equality of unordered distance atoms in every selected row of those three
  families and in the retained first-apex b1 row;
* equality throughout the complete exact-five second-apex shell; and
* every one-term cancellation consequence of the two strict Kalmanson
  inequalities for the common cyclic boundary order.

A bounded rank assignment exists exactly when the resulting quotient strict
comparison graph is acyclic.  SAT results are replayed independently from the
decoded rows.  UNSAT is only an external finite-solver result here.
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


ROOT = Path(__file__).resolve().parents[3]
OUTER_DIR = ROOT / "scratch/atail-force/exact5-global-cover-parent-gate"
OUTER_PATH = OUTER_DIR / "encode.py"


def load_outer_module():
    sys.path.insert(0, str(OUTER_DIR))
    spec = importlib.util.spec_from_file_location("exact5_b0_ordinal", OUTER_PATH)
    if spec is None or spec.loader is None:
        raise RuntimeError("cannot load exact-five B0 outer")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def edge(left: int, right: int) -> tuple[int, int]:
    if left == right:
        raise ValueError("distance atom endpoints must be distinct")
    return tuple(sorted((left, right)))


def add_strong_connectivity(solver, family, n: int, prefix: str) -> int:
    reach = {
        (step, left, right): z3.Bool(f"ord_{prefix}_reach_{step}_{left}_{right}")
        for step in range(n + 1)
        for left in range(n)
        for right in range(n)
    }
    count = 0
    for left in range(n):
        for right in range(n):
            base = z3.BoolVal(True) if left == right else family[left, right]
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


def add_row_rank_equalities(solver, rank, family, vertices) -> int:
    count = 0
    for center in vertices:
        targets = [point for point in vertices if point != center]
        for left, right in itertools.combinations(targets, 2):
            solver.add(z3.Implies(
                z3.And(family[center, left], family[center, right]),
                rank[edge(center, left)] == rank[edge(center, right)],
            ))
            count += 1
    return count


def add_ordinal_rank_surface(module, outer):
    atoms = tuple(itertools.combinations(module.VERTICES, 2))
    width = max(1, len(atoms).bit_length())
    rank = {
        atom: z3.BitVec(f"ord_rank_{atom[0]}_{atom[1]}", width)
        for atom in atoms
    }
    for variable in rank.values():
        outer.solver.add(z3.ULT(variable, z3.BitVecVal(len(atoms), width)))

    family_equalities = {}
    for name, family in (("m", outer.m), ("g0", outer.cover[0]),
                         ("g1", outer.cover[1])):
        family_equalities[name] = add_row_rank_equalities(
            outer.solver, rank, family, module.VERTICES
        )

    b1_equalities = 0
    targets = [p for p in module.VERTICES if p != module.FIRST_APEX]
    for left, right in itertools.combinations(targets, 2):
        outer.solver.add(z3.Implies(
            z3.And(outer.b1[left], outer.b1[right]),
            rank[edge(module.FIRST_APEX, left)]
            == rank[edge(module.FIRST_APEX, right)],
        ))
        b1_equalities += 1

    shell_equalities = 0
    targets = [p for p in module.VERTICES if p != module.SECOND_APEX]
    for left, right in itertools.combinations(targets, 2):
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
                        rank[positive[positive_index]]
                        == rank[negative[negative_index]],
                        z3.UGT(rank[remaining_positive], rank[remaining_negative]),
                    ))
                    cancellation_implications += 1

    return rank, {
        "rank_atoms": len(atoms),
        "rank_bit_width": width,
        "guarded_row_rank_equalities": family_equalities,
        "guarded_b1_rank_equalities": b1_equalities,
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


def normalized_rows(raw):
    return {int(center): set(support) for center, support in raw.items()}


def independently_replay(module, decoded, serialized_ranks):
    errors = module.verify_decoded(decoded)
    if errors:
        raise AssertionError("B0 replay failed: " + "; ".join(errors))

    rows = normalized_rows(decoded["rows"])
    cover = [normalized_rows(raw) for raw in decoded["cover_rows"]]
    b1 = set(decoded["b1"])
    shell = set(decoded["shell"])
    atoms = tuple(itertools.combinations(module.VERTICES, 2))
    dsu = DisjointSet(atoms)

    for family in (rows, *cover):
        for center, support in family.items():
            support = sorted(support)
            reference = edge(center, support[0])
            for point in support[1:]:
                dsu.union(reference, edge(center, point))
    reference = edge(module.FIRST_APEX, min(b1))
    for point in sorted(b1)[1:]:
        dsu.union(reference, edge(module.FIRST_APEX, point))
    reference = edge(module.SECOND_APEX, min(shell))
    for point in sorted(shell)[1:]:
        dsu.union(reference, edge(module.SECOND_APEX, point))

    ranks = {
        tuple(map(int, name.split(","))): value
        for name, value in serialized_ranks.items()
    }
    for atom in atoms:
        if not 0 <= ranks[atom] < len(atoms):
            raise AssertionError(f"rank out of range at {atom}")
    classes = {}
    for atom in atoms:
        classes.setdefault(dsu.find(atom), []).append(atom)
    for members in classes.values():
        if len({ranks[atom] for atom in members}) != 1:
            raise AssertionError(f"quotient rank mismatch in {members}")

    graph = {representative: set() for representative in classes}
    active = []
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
                    # remaining_negative < remaining_positive.  This is the
                    # direction of SelectedRowOrdinalComparison.value_lt.
                    source = dsu.find(remaining_negative)
                    target = dsu.find(remaining_positive)
                    graph[source].add(target)
                    active.append({
                        "quadruple": [a, b, c, d],
                        "canceled": [list(canceled_positive),
                                     list(canceled_negative)],
                        "strict": [list(remaining_negative),
                                   list(remaining_positive)],
                    })

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
        "quotient_class_count": len(classes),
        "active_cancellation_count": len(active),
        "distinct_comparison_edge_count": sum(map(len, graph.values())),
        "active_cancellations": active,
    }


def solve(args):
    module = load_outer_module()
    started = time.monotonic()
    outer = module.Outer(args.orbit, args.timeout_ms, args.seed)
    connectivity_counts = {}
    for name, family in (("m", outer.m), ("g0", outer.cover[0]),
                         ("g1", outer.cover[1])):
        connectivity_counts[name] = add_strong_connectivity(
            outer.solver, family, module.N, name
        )
    rank, ordinal_counts = add_ordinal_rank_surface(module, outer)
    build_elapsed = time.monotonic() - started
    if args.log:
        args.log.write_text(json.dumps({
            "phase": "solver_built",
            "orbit": args.orbit,
            "build_elapsed_seconds": build_elapsed,
            "connectivity_clause_counts": connectivity_counts,
            "ordinal_counts": ordinal_counts,
        }, sort_keys=True) + "\n")

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
            "decoded": decoded,
            "ranks": serialized_ranks,
            "ordinal_replay": replay,
        }
    elif status == z3.unsat:
        result = {
            "status": "UNSAT_EXTERNAL_NO_CERTIFICATE",
            "reason": "exact-five B0 outer forces quotient ordinal cycle",
        }
    else:
        result = {"status": "UNKNOWN", "reason": outer.solver.reason_unknown()}

    result.update({
        "schema": "p97-exact5-allone-integrated-ordinal-cycle-decision-v1",
        "epistemic_status": "EXACT_IF_SAT_EXTERNAL_BOUNDED_IF_UNSAT_OR_UNKNOWN",
        "orbit": args.orbit,
        "n": module.N,
        "seed": args.seed,
        "timeout_ms": args.timeout_ms,
        "elapsed_seconds": time.monotonic() - started,
        "build_elapsed_seconds": build_elapsed,
        "connectivity": "FLOYD_WARSHALL_ALL_PAIRS_EXACT_FOR_M_G0_G1",
        "connectivity_clause_counts": connectivity_counts,
        "ordinal_counts": ordinal_counts,
        "outer_source": str(OUTER_PATH),
        "outer_source_sha256": sha256(OUTER_PATH),
        "solver_statistics": str(outer.solver.statistics()),
    })
    if args.log:
        with args.log.open("a") as handle:
            handle.write(json.dumps({
                "phase": "terminal",
                "orbit": args.orbit,
                "status": result["status"],
                "elapsed_seconds": result["elapsed_seconds"],
            }, sort_keys=True) + "\n")
    return result


def main():
    module = load_outer_module()
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--orbit", choices=tuple(module.ORBIT_ROLES), required=True)
    parser.add_argument("--seed", type=int, default=1)
    parser.add_argument("--timeout-ms", type=int, default=180_000)
    parser.add_argument("--output", type=Path)
    parser.add_argument("--log", type=Path)
    args = parser.parse_args()
    result = solve(args)
    rendered = json.dumps(result, indent=2, sort_keys=True) + "\n"
    if args.output:
        args.output.write_text(rendered)
    print(rendered, end="")


if __name__ == "__main__":
    main()
