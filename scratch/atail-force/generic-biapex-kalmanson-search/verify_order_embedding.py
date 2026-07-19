#!/usr/bin/env python3
"""Replay the six-vertex n=9 CEGAR schema under order embeddings.

The active CEGAR driver generalized one infeasible metric core from the six
ordered vertices ``[0, 1, 2, 6, 7, 8]`` to every order-preserving or reversing
embedding.  This independent checker verifies the normalized six-vertex
equality schema against the complete strict Kalmanson/triangle base, then
replays all 168 embeddings into a nine-vertex carrier.

All verdicts are bounded Z3 theorem-discovery evidence only.
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
DISCOVERY_CEGAR_SHA256 = (
    "b65267975f1cfbe4d71a5b2678be58d2f42b72cea3e5ed5c82e3fabc90bf6e70"
)
SCHEMA = (
    (0, 1, 3),
    (0, 1, 5),
    (1, 0, 3),
    (1, 0, 4),
    (2, 1, 4),
    (2, 1, 5),
)


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def distance_table(n: int) -> dict[tuple[int, int], z3.ArithRef]:
    return {
        (left, right): z3.Real(f"embed_d_{left}_{right}")
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
        solver.add(variable >= 1)
    for a, b, c, d in itertools.combinations(range(n), 4):
        diagonals = dist(table, a, c) + dist(table, b, d)
        solver.add(diagonals >= dist(table, a, b) + dist(table, c, d) + 1)
        solver.add(diagonals >= dist(table, a, d) + dist(table, b, c) + 1)
    for a, b, c in itertools.combinations(range(n), 3):
        solver.add(dist(table, a, b) + dist(table, b, c) >= dist(table, a, c))
        solver.add(dist(table, a, c) + dist(table, b, c) >= dist(table, a, b))
        solver.add(dist(table, a, b) + dist(table, a, c) >= dist(table, b, c))
    return solver, table


def replay(
    n: int,
    equalities: tuple[tuple[int, int, int], ...],
    timeout_ms: int,
) -> dict[str, object]:
    solver, table = build_metric_base(n, timeout_ms)
    for center, first, second in equalities:
        solver.add(dist(table, center, first) == dist(table, center, second))
    verdict = solver.check()
    return {
        "status": str(verdict).upper(),
        "reason_unknown": solver.reason_unknown() if verdict == z3.unknown else None,
    }


def embed(
    target_vertices: tuple[int, ...], reflected: bool
) -> tuple[tuple[int, int, int], ...]:
    def image(role: int) -> int:
        if reflected:
            role = len(target_vertices) - 1 - role
        return target_vertices[role]

    return tuple((image(c), image(a), image(b)) for c, a, b in SCHEMA)


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--timeout-ms", type=int, default=10_000)
    args = parser.parse_args()
    if args.timeout_ms <= 0:
        raise SystemExit("timeout must be positive")

    embeddings = []
    for target_vertices in itertools.combinations(range(9), 6):
        for reflected in (False, True):
            equalities = embed(target_vertices, reflected)
            embeddings.append(
                {
                    "target_vertices": list(target_vertices),
                    "reflected": reflected,
                    **replay(9, equalities, args.timeout_ms),
                }
            )

    status_histogram: dict[str, int] = {}
    for item in embeddings:
        status = str(item["status"])
        status_histogram[status] = status_histogram.get(status, 0) + 1

    deletion_checks = []
    for omitted in range(len(SCHEMA)):
        reduced = tuple(
            equality for index, equality in enumerate(SCHEMA) if index != omitted
        )
        deletion_checks.append(
            {
                "omitted_index": omitted,
                "omitted_equality": list(SCHEMA[omitted]),
                **replay(6, reduced, args.timeout_ms),
            }
        )

    output = {
        "schema": "p97-generic-biapex-kalmanson-order-embedding-replay-v1",
        "epistemic_status": "BOUNDED_Z3_SCHEMA_REPLAY_NOT_LEAN_PROOF",
        "discovery_cegar_sha256": DISCOVERY_CEGAR_SHA256,
        "current_source_sha256": {
            "search.py": sha256(SEARCH),
            "cegar.py": sha256(CEGAR),
        },
        "normalized_equalities": [list(equality) for equality in SCHEMA],
        "normalized_six_vertex_replay": replay(6, SCHEMA, args.timeout_ms),
        "single_equality_deletions": deletion_checks,
        "nine_vertex_embedding_count": len(embeddings),
        "nine_vertex_status_histogram": status_histogram,
        "unknown_embeddings": [
            item for item in embeddings if item["status"] == "UNKNOWN"
        ],
        "sat_embeddings": [item for item in embeddings if item["status"] == "SAT"],
    }
    print(json.dumps(output, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
