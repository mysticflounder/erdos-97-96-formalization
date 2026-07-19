#!/usr/bin/env python3
"""Exact CNF encoding of the n=11 bi-apex structural outer problem.

This is a Boolean replacement for ``cegar.build_structural`` plus the
transported membership cuts in ``schema_bank_round1.json``.  It deliberately
uses only direct, easily audited clauses: no pseudo-Boolean preprocessing and
no auxiliary cardinality variables.
"""

from __future__ import annotations

import argparse
import itertools
import json
import subprocess
import time
from collections import Counter
from pathlib import Path


Membership = tuple[int, int]


class CNF:
    def __init__(self) -> None:
        self.names: list[str] = ["<unused-zero>"]
        self.ids: dict[str, int] = {}
        self.clauses: list[tuple[int, ...]] = []
        self.block_counts: Counter[str] = Counter()

    def var(self, name: str) -> int:
        found = self.ids.get(name)
        if found is not None:
            return found
        identifier = len(self.names)
        self.ids[name] = identifier
        self.names.append(name)
        return identifier

    def add(self, block: str, literals: list[int] | tuple[int, ...]) -> None:
        # Removing duplicates is semantics-preserving.  A complementary pair
        # makes the clause tautological, so omit that clause entirely.
        clause = tuple(dict.fromkeys(literals))
        literal_set = set(clause)
        if any(-literal in literal_set for literal in clause):
            return
        if not clause:
            raise ValueError(f"attempted to add an empty clause in {block}")
        self.clauses.append(clause)
        self.block_counts[block] += 1

    def write_dimacs(self, path: Path, metadata: dict[str, object]) -> None:
        path.parent.mkdir(parents=True, exist_ok=True)
        with path.open("w", encoding="ascii") as handle:
            handle.write("c exact bi-apex structural outer CNF\n")
            for key, value in metadata.items():
                handle.write(f"c {key} {json.dumps(value, sort_keys=True)}\n")
            for identifier, name in enumerate(self.names[1:], start=1):
                handle.write(f"c var {identifier} {name}\n")
            handle.write(f"p cnf {len(self.names) - 1} {len(self.clauses)}\n")
            for clause in self.clauses:
                handle.write(" ".join(str(literal) for literal in clause))
                handle.write(" 0\n")


def reflected_schema(k: int, schema: tuple[Membership, ...]) -> tuple[Membership, ...]:
    return tuple(sorted((k - 1 - center, k - 1 - point) for center, point in schema))


def load_bank(path: Path | None) -> tuple[list[tuple[int, tuple[Membership, ...]]], dict[str, object]]:
    if path is None:
        return [], {"bank": None, "bank_schema_count": 0}
    payload = json.loads(path.read_text(encoding="utf-8"))
    expected = "p97-whole-carrier-kalmanson-transported-schema-bank-v1"
    if payload.get("schema") != expected:
        raise ValueError(f"unexpected schema bank tag: {payload.get('schema')!r}")
    records = payload.get("schemas")
    if not isinstance(records, list) or payload.get("schema_count") != len(records):
        raise ValueError("schema bank count is inconsistent")
    answer: list[tuple[int, tuple[Membership, ...]]] = []
    seen: set[tuple[int, tuple[Membership, ...]]] = set()
    for index, record in enumerate(records):
        k = int(record["core_vertex_count"])
        schema = tuple(sorted(tuple(int(x) for x in pair) for pair in record["order_schema"]))
        if k < 1:
            raise ValueError(f"schema {index} has invalid core size {k}")
        if len(set(schema)) != len(schema):
            raise ValueError(f"schema {index} contains a duplicate membership")
        if any(not (0 <= center < k and 0 <= point < k) for center, point in schema):
            raise ValueError(f"schema {index} has a role outside 0..{k - 1}")
        if any(center == point for center, point in schema):
            raise ValueError(f"schema {index} contains self membership")
        canonical = min(schema, reflected_schema(k, schema))
        if schema != canonical:
            raise ValueError(f"schema {index} is not reflection-canonical")
        key = (k, canonical)
        if key in seen:
            raise ValueError(f"schema {index} duplicates an earlier schema")
        seen.add(key)
        answer.append(key)
    return answer, {
        "bank": str(path),
        "bank_schema": expected,
        "bank_schema_count": len(answer),
        "bank_epistemic_status": payload.get("epistemic_status"),
    }


def encode(n: int, second_apex: int, bank_path: Path | None) -> tuple[CNF, dict[str, object]]:
    if n < 5:
        raise ValueError("a four-member nonself row requires n >= 5")
    if not 0 < second_apex < n:
        raise ValueError("second apex must be distinct from 0 and in range")

    cnf = CNF()
    member = {
        (center, point): cnf.var(f"m_{center}_{point}")
        for center in range(n)
        for point in range(n)
    }
    blocker = {
        (source, center): cnf.var(f"b_{source}_{center}")
        for source in range(n)
        for center in range(n)
    }

    # Exactly four members in each row.  Self membership is fixed false, so
    # direct at-most-four and at-least-four clauses range over n-1 variables.
    for center in range(n):
        cnf.add("row_nonself", [-member[center, center]])
        allowed_points = tuple(point for point in range(n) if point != center)
        for five in itertools.combinations(allowed_points, 5):
            cnf.add("row_at_most_4", [-member[center, point] for point in five])
        false_set_size = len(allowed_points) - 4 + 1
        for forced_some_true in itertools.combinations(allowed_points, false_set_size):
            cnf.add("row_at_least_4", [member[center, point] for point in forced_some_true])

    # Two rows have intersection at most two: forbid every three-point common
    # subset.  Points equal to either center are omitted because the relevant
    # self-membership is already false.
    for left, right in itertools.combinations(range(n), 2):
        possible = tuple(point for point in range(n) if point not in {left, right})
        for triple in itertools.combinations(possible, 3):
            cnf.add(
                "row_intersection_at_most_2",
                [
                    literal
                    for point in triple
                    for literal in (-member[left, point], -member[right, point])
                ],
            )

    # A point pair occurs together in at most two center rows.  Centers equal
    # to either point cannot contain the pair and are omitted symmetrically.
    for first, second in itertools.combinations(range(n), 2):
        possible = tuple(center for center in range(n) if center not in {first, second})
        for triple in itertools.combinations(possible, 3):
            cnf.add(
                "pair_center_count_at_most_2",
                [
                    literal
                    for center in triple
                    for literal in (-member[center, first], -member[center, second])
                ],
            )

    # A shared pair at two centers must alternate with the centers in the
    # fixed cyclic order.  The linear inequality below is exactly the existing
    # cegar.py representation after choosing the cut between n-1 and 0.
    for center_left, center_right in itertools.combinations(range(n), 2):
        possible = tuple(point for point in range(n) if point not in {center_left, center_right})
        for point_left, point_right in itertools.combinations(possible, 2):
            alternates = (center_left < point_left < center_right) != (
                center_left < point_right < center_right
            )
            if not alternates:
                cnf.add(
                    "cyclic_alternation",
                    [
                        -member[center_left, point_left],
                        -member[center_left, point_right],
                        -member[center_right, point_left],
                        -member[center_right, point_right],
                    ],
                )

    # Every nonempty proper vertex set has a selected edge leaving it.  These
    # outgoing cuts are equivalent to strong connectivity of a finite digraph.
    vertices = tuple(range(n))
    for size in range(1, n):
        for subset_tuple in itertools.combinations(vertices, size):
            subset = frozenset(subset_tuple)
            cnf.add(
                "strong_connectivity_outgoing_cut",
                [
                    member[center, point]
                    for center in subset_tuple
                    for point in vertices
                    if point not in subset
                ],
            )

    # A total one-hot blocker map.  Its image omits both physical apices and
    # fixed points; a chosen center's selected row contains the source.
    for source in vertices:
        allowed_centers = tuple(
            center for center in vertices if center not in {source, 0, second_apex}
        )
        cnf.add("blocker_at_least_one", [blocker[source, center] for center in allowed_centers])
        for left, right in itertools.combinations(allowed_centers, 2):
            cnf.add("blocker_at_most_one", [-blocker[source, left], -blocker[source, right]])
        for center in vertices:
            if center not in allowed_centers:
                cnf.add("blocker_forbidden", [-blocker[source, center]])
            else:
                cnf.add(
                    "blocker_implies_source_membership",
                    [-blocker[source, center], member[center, source]],
                )

    schemas, bank_metadata = load_bank(bank_path)
    embeddable_schema_count = 0
    skipped_large_schema_count = 0
    schema_embedding_count = 0
    for k, schema in schemas:
        if k > n:
            skipped_large_schema_count += 1
            continue
        embeddable_schema_count += 1
        reflected = reflected_schema(k, schema)
        for target_vertices in itertools.combinations(vertices, k):
            for oriented in {schema, reflected}:
                transformed = tuple(
                    sorted((target_vertices[center], target_vertices[point]) for center, point in oriented)
                )
                cnf.add(
                    "preloaded_schema_cut",
                    [-member[center, point] for center, point in transformed],
                )
                schema_embedding_count += 1

    metadata: dict[str, object] = {
        "encoding_schema": "p97-biapex-structural-outer-direct-cnf-v1",
        "n": n,
        "omitted_apices": [0, second_apex],
        **bank_metadata,
        "embeddable_schema_count": embeddable_schema_count,
        "skipped_schema_count_core_larger_than_n": skipped_large_schema_count,
        "schema_embedding_count": schema_embedding_count,
        "variable_count": len(cnf.names) - 1,
        "clause_count": len(cnf.clauses),
        "clause_block_counts": dict(sorted(cnf.block_counts.items())),
    }
    return cnf, metadata


def parse_assignment(stdout: str) -> set[int]:
    assignment: set[int] = set()
    for line in stdout.splitlines():
        if not line.startswith("v "):
            continue
        for token in line.split()[1:]:
            literal = int(token)
            if literal != 0:
                assignment.add(literal)
    return assignment


def assignment_value(assignment: set[int], variable: int) -> bool:
    if variable in assignment:
        return True
    if -variable in assignment:
        return False
    raise ValueError(f"solver model omits variable {variable}")


def check_cnf_model(cnf: CNF, assignment: set[int]) -> None:
    for index, clause in enumerate(cnf.clauses):
        if not any(
            assignment_value(assignment, abs(literal)) == (literal > 0)
            for literal in clause
        ):
            raise AssertionError(f"SAT assignment falsifies CNF clause {index}: {clause}")


def decode_sat(cnf: CNF, assignment: set[int], metadata: dict[str, object]) -> dict[str, object]:
    check_cnf_model(cnf, assignment)
    n = int(metadata["n"])
    rows = {
        str(center): [
            point
            for point in range(n)
            if assignment_value(assignment, cnf.ids[f"m_{center}_{point}"])
        ]
        for center in range(n)
    }
    blockers: dict[str, int] = {}
    for source in range(n):
        chosen = [
            center
            for center in range(n)
            if assignment_value(assignment, cnf.ids[f"b_{source}_{center}"])
        ]
        if len(chosen) != 1:
            raise AssertionError(f"decoded blocker row {source} is not one-hot: {chosen}")
        blockers[str(source)] = chosen[0]
    return {"rows": rows, "blockers": blockers, "cnf_model_checked": True}


def solve(
    cnf: CNF,
    cnf_path: Path,
    metadata: dict[str, object],
    proof_path: Path | None,
    timeout_seconds: int,
    cadical: str,
) -> tuple[dict[str, object], str, str]:
    command = [cadical, "-t", str(timeout_seconds), str(cnf_path)]
    if proof_path is not None:
        proof_path.parent.mkdir(parents=True, exist_ok=True)
        command.append(str(proof_path))
    started = time.monotonic()
    completed = subprocess.run(
        command,
        capture_output=True,
        text=True,
        timeout=timeout_seconds + 30,
        check=False,
    )
    elapsed = time.monotonic() - started
    if completed.returncode == 10:
        status = "SAT"
    elif completed.returncode == 20:
        status = "UNSAT"
    else:
        status = "UNKNOWN"
    result: dict[str, object] = {
        "solver": "CaDiCaL",
        "solver_command": command,
        "solver_returncode": completed.returncode,
        "solver_status": status,
        "solver_elapsed_seconds": elapsed,
        "timeout_seconds": timeout_seconds,
    }
    if status == "SAT":
        result.update(decode_sat(cnf, parse_assignment(completed.stdout), metadata))
    return result, completed.stdout, completed.stderr


def self_test() -> None:
    # Exhaustively validate the direct exactly-four clauses for allowed-set
    # sizes 4..8.  This catches both off-by-one directions independently of a
    # SAT solver.
    for width in range(4, 9):
        variables = tuple(range(1, width + 1))
        clauses: list[tuple[int, ...]] = []
        clauses.extend(tuple(-item for item in five) for five in itertools.combinations(variables, 5))
        clauses.extend(
            tuple(items)
            for items in itertools.combinations(variables, width - 4 + 1)
        )
        for mask in range(1 << width):
            values = {index + 1: bool(mask & (1 << index)) for index in range(width)}
            clause_value = all(
                any(values[abs(literal)] == (literal > 0) for literal in clause)
                for clause in clauses
            )
            if clause_value != (mask.bit_count() == 4):
                raise AssertionError((width, mask, clause_value))
    print("SELF_TEST_OK: direct exactly-four encoding exhaustively checked for widths 4..8")


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--n", type=int)
    parser.add_argument("--second-apex", type=int)
    parser.add_argument("--preload-bank", type=Path)
    parser.add_argument("--cnf", type=Path)
    parser.add_argument("--result", type=Path)
    parser.add_argument("--solver-log", type=Path)
    parser.add_argument("--proof", type=Path)
    parser.add_argument("--timeout-seconds", type=int, default=300)
    parser.add_argument("--cadical", default="cadical")
    parser.add_argument("--encode-only", action="store_true")
    parser.add_argument("--self-test", action="store_true")
    args = parser.parse_args()
    if args.self_test:
        self_test()
        return 0
    required = (args.n, args.second_apex, args.cnf, args.result)
    if any(item is None for item in required):
        parser.error("--n, --second-apex, --cnf, and --result are required")
    if args.timeout_seconds <= 0:
        parser.error("--timeout-seconds must be positive")

    cnf, metadata = encode(args.n, args.second_apex, args.preload_bank)
    cnf.write_dimacs(args.cnf, metadata)
    result: dict[str, object] = {**metadata, "cnf_path": str(args.cnf)}
    if args.encode_only:
        result["solver_status"] = "NOT_RUN"
    else:
        solver_result, stdout, stderr = solve(
            cnf, args.cnf, metadata, args.proof, args.timeout_seconds, args.cadical
        )
        result.update(solver_result)
        if args.solver_log is not None:
            args.solver_log.parent.mkdir(parents=True, exist_ok=True)
            args.solver_log.write_text(stdout + stderr, encoding="utf-8")
    args.result.parent.mkdir(parents=True, exist_ok=True)
    args.result.write_text(json.dumps(result, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    print(json.dumps(result, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
