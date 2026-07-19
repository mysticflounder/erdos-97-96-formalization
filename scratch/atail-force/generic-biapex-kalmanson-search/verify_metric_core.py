#!/usr/bin/env python3
"""Independent replay of the first n=8 whole-carrier metric core.

This checker does not import either active search driver.  It reconstructs the
row-free strict Kalmanson/triangle system, adds only the four tracked row
equalities reported by the CEGAR run, and checks every dihedral image.  It also
tests whether deleting any one equality restores satisfiability.

All results are bounded Z3 theorem-discovery evidence, not a Lean proof or a
checked Farkas certificate.
"""

from __future__ import annotations

import argparse
import hashlib
import itertools
import json
from pathlib import Path

import z3


HERE = Path(__file__).resolve().parent
SEARCH = HERE / "search.py"
CEGAR = HERE / "cegar.py"
N = 8
CORE = (
    (0, 1, 6),
    (1, 0, 4),
    (3, 1, 6),
    (5, 0, 4),
)


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def distance_table(n: int) -> dict[tuple[int, int], z3.ArithRef]:
    return {
        (left, right): z3.Real(f"core_d_{left}_{right}")
        for left in range(n)
        for right in range(left + 1, n)
    }


def dist(
    table: dict[tuple[int, int], z3.ArithRef], left: int, right: int
) -> z3.ArithRef:
    if left == right:
        return z3.RealVal(0)
    return table[tuple(sorted((left, right)))]


def build_metric_base(n: int, timeout_ms: int) -> tuple[z3.Solver, dict]:
    solver = z3.Solver()
    solver.set(timeout=timeout_ms, random_seed=0)
    table = distance_table(n)
    for variable in table.values():
        solver.add(variable >= 0)
    for a, b, c, d in itertools.combinations(range(n), 4):
        diagonals = dist(table, a, c) + dist(table, b, d)
        solver.add(diagonals >= dist(table, a, b) + dist(table, c, d) + 1)
        solver.add(diagonals >= dist(table, a, d) + dist(table, b, c) + 1)
    for a, b, c in itertools.combinations(range(n), 3):
        solver.add(dist(table, a, b) + dist(table, b, c) >= dist(table, a, c))
        solver.add(dist(table, a, c) + dist(table, b, c) >= dist(table, a, b))
        solver.add(dist(table, a, b) + dist(table, a, c) >= dist(table, b, c))
    return solver, table


def transform_core(
    core: tuple[tuple[int, int, int], ...], shift: int, reflected: bool
) -> tuple[tuple[int, int, int], ...]:
    def image(vertex: int) -> int:
        signed = -vertex if reflected else vertex
        return (signed + shift) % N

    return tuple((image(c), image(a), image(b)) for c, a, b in core)


def replay(
    core: tuple[tuple[int, int, int], ...], timeout_ms: int
) -> dict[str, object]:
    solver, table = build_metric_base(N, timeout_ms)
    for center, first, second in core:
        solver.add(dist(table, center, first) == dist(table, center, second))
    verdict = solver.check()
    return {
        "status": str(verdict).upper(),
        "reason_unknown": solver.reason_unknown() if verdict == z3.unknown else None,
    }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--timeout-ms", type=int, default=10_000)
    args = parser.parse_args()
    if args.timeout_ms <= 0:
        raise SystemExit("timeout must be positive")

    orbit = []
    for reflected in (False, True):
        for shift in range(N):
            image = transform_core(CORE, shift, reflected)
            orbit.append(
                {
                    "shift": shift,
                    "reflected": reflected,
                    "equalities": [list(equality) for equality in image],
                    **replay(image, args.timeout_ms),
                }
            )

    deletion_checks = []
    for omitted in range(len(CORE)):
        reduced = tuple(
            equality for index, equality in enumerate(CORE) if index != omitted
        )
        deletion_checks.append(
            {
                "omitted_index": omitted,
                "omitted_equality": list(CORE[omitted]),
                **replay(reduced, args.timeout_ms),
            }
        )

    output = {
        "schema": "p97-generic-biapex-kalmanson-core-replay-v1",
        "epistemic_status": "BOUNDED_Z3_CORE_REPLAY_NOT_LEAN_PROOF",
        "source_sha256": {
            "search.py": sha256(SEARCH),
            "cegar.py": sha256(CEGAR),
        },
        "n": N,
        "original_equalities": [list(equality) for equality in CORE],
        "original": replay(CORE, args.timeout_ms),
        "single_equality_deletions": deletion_checks,
        "dihedral_orbit": orbit,
    }
    print(json.dumps(output, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
