#!/usr/bin/env python3
"""Classify small irreducible three-shell contradictions.

For a fixed cyclic order on ``n`` labels, a shell atom ``(c,x,y)`` denotes
``d(c,x) = d(c,y)``.  This census enumerates all triples of shell atoms on at
most six vertices, tests them against the strict triangle and Kalmanson cone,
and quotients the irreducible UNSAT triples by cyclic dihedral symmetry.

The output is theorem-discovery data.  Each promoted orbit still needs a Lean
proof from the corresponding strict inequalities.
"""

from __future__ import annotations

import argparse
import json
from itertools import combinations
from pathlib import Path

import z3


Atom = tuple[int, int, int]
Pattern = tuple[Atom, Atom, Atom]


def edge(a: int, b: int) -> tuple[int, int]:
    return tuple(sorted((a, b)))


def atoms(n: int) -> tuple[Atom, ...]:
    return tuple(
        (center, x, y)
        for center in range(n)
        for x, y in combinations((point for point in range(n) if point != center), 2)
    )


def canonical_atom(center: int, x: int, y: int) -> Atom:
    left, right = sorted((x, y))
    return center, left, right


def canonical_pattern(n: int, pattern: Pattern) -> Pattern:
    images: list[Pattern] = []
    for sign in (1, -1):
        for shift in range(n):
            transformed = []
            for center, x, y in pattern:
                transform = lambda value: (sign * value + shift) % n
                transformed.append(canonical_atom(
                    transform(center), transform(x), transform(y)
                ))
            images.append(tuple(sorted(transformed)))
    return min(images)


def canonical_rotation(n: int, pattern: Pattern) -> Pattern:
    images: list[Pattern] = []
    for shift in range(n):
        transformed = []
        for center, x, y in pattern:
            transform = lambda value: (value + shift) % n
            transformed.append(canonical_atom(
                transform(center), transform(x), transform(y)
            ))
        images.append(tuple(sorted(transformed)))
    return min(images)


def build_solver(n: int):
    distances = {
        pair: z3.Real(f"d_{pair[0]}_{pair[1]}")
        for pair in combinations(range(n), 2)
    }
    solver = z3.Solver()
    solver.add(*(value > 0 for value in distances.values()))
    solver.add(distances[edge(0, 1)] == 1)
    for a, b, c in combinations(range(n), 3):
        ab, ac, bc = distances[edge(a, b)], distances[edge(a, c)], distances[edge(b, c)]
        solver.add(ac < ab + bc, ab < ac + bc, bc < ab + ac)
    for a, b, c, d in combinations(range(n), 4):
        diagonal = distances[edge(a, c)] + distances[edge(b, d)]
        solver.add(distances[edge(a, b)] + distances[edge(c, d)] < diagonal)
        solver.add(distances[edge(a, d)] + distances[edge(b, c)] < diagonal)
    return solver, distances


def equality(distances, atom: Atom):
    center, x, y = atom
    return distances[edge(center, x)] == distances[edge(center, y)]


def support(pattern: tuple[Atom, ...]) -> frozenset[int]:
    return frozenset(value for atom in pattern for value in atom)


def classify(n: int, shard_index: int, shard_count: int) -> dict[str, object]:
    shell_atoms = atoms(n)
    solver, distances = build_solver(n)

    pair_sat: dict[tuple[Atom, Atom], bool] = {}
    for pair in combinations(shell_atoms, 2):
        solver.push()
        solver.add(*(equality(distances, atom) for atom in pair))
        pair_sat[pair] = solver.check() == z3.sat
        solver.pop()

    unsat_patterns: list[Pattern] = []
    irreducible_patterns: list[Pattern] = []
    full_support_triple_count = 0
    for triple_index, triple in enumerate(combinations(shell_atoms, 3)):
        if triple_index % shard_count != shard_index:
            continue
        if support(triple) != frozenset(range(n)):
            continue
        full_support_triple_count += 1
        if not all(pair_sat[tuple(sorted(pair))] for pair in combinations(triple, 2)):
            continue
        solver.push()
        solver.add(*(equality(distances, atom) for atom in triple))
        if solver.check() == z3.unsat:
            pattern = tuple(sorted(triple))
            unsat_patterns.append(pattern)
            irreducible_patterns.append(canonical_pattern(n, pattern))
        solver.pop()

    orbit_representatives = sorted(set(irreducible_patterns))
    return {
        "n": n,
        "shard_index": shard_index,
        "shard_count": shard_count,
        "atom_count": len(shell_atoms),
        "pair_count": len(pair_sat),
        "pair_unsat_count": sum(not value for value in pair_sat.values()),
        "triple_count_total": len(tuple(combinations(shell_atoms, 3))),
        "full_support_triple_count_in_shard": full_support_triple_count,
        "irreducible_unsat_count_in_shard": len(unsat_patterns),
        "orbit_count_in_shard": len(orbit_representatives),
        "irreducible_unsat_patterns": unsat_patterns,
        "orbit_representatives": orbit_representatives,
    }


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--n", type=int, choices=(4, 5, 6), required=True)
    parser.add_argument("--shard-index", type=int, default=0)
    parser.add_argument("--shard-count", type=int, default=1)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()
    if not 0 <= args.shard_index < args.shard_count:
        parser.error("shard index must lie in [0, shard count)")
    result = classify(args.n, args.shard_index, args.shard_count)
    rendered = json.dumps(result, indent=2, sort_keys=True) + "\n"
    if args.output:
        args.output.write_text(rendered)
    print(json.dumps({
        key: value for key, value in result.items()
        if key not in ("irreducible_unsat_patterns", "orbit_representatives")
    }, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
