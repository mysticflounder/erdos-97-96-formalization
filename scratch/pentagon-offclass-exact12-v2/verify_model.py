#!/usr/bin/env python3
"""Independent semantic and clause-level validator for the SAT witness."""

from __future__ import annotations

import json
from itertools import combinations
from pathlib import Path


HERE = Path(__file__).resolve().parent
MOSER = {0, 1, 2}


def candidate_ok(center: int, row: set[int], interiors: list[set[int]], caps: list[set[int]]) -> bool:
    if len(row) != 4 or center in row or not row <= set(range(12)):
        return False
    if center in MOSER:
        return all(len(row & (cap - {center})) <= 1 for cap in caps if center in cap)
    own = next(interior for interior in interiors if center in interior) - {center}
    moser_count = len(row & MOSER)
    same_count = len(row & own)
    return moser_count <= 2 and not (moser_count >= 2 and same_count >= 1) and same_count <= 2


def read_assignment(path: Path, n_variables: int) -> dict[int, bool]:
    tokens = [int(token) for token in path.read_text(encoding="utf-8").split()]
    literals = [literal for literal in tokens if literal]
    if len(literals) != n_variables or {abs(x) for x in literals} != set(range(1, n_variables + 1)):
        raise AssertionError("assignment is not total")
    return {abs(literal): literal > 0 for literal in literals}


def verify_cnf(path: Path, assignment: dict[int, bool]) -> tuple[int, int]:
    lines = [line.strip() for line in path.read_text(encoding="utf-8").splitlines() if line.strip() and not line.startswith("c")]
    header = lines[0].split()
    n_variables, n_clauses = int(header[2]), int(header[3])
    if n_variables != len(assignment) or len(lines) - 1 != n_clauses:
        raise AssertionError("DIMACS header mismatch")
    for number, line in enumerate(lines[1:], 1):
        literals = [int(token) for token in line.split()[:-1]]
        if not any(assignment[abs(lit)] == (lit > 0) for lit in literals):
            raise AssertionError(f"unsatisfied clause {number}")
    return n_variables, n_clauses


def main() -> int:
    data = json.loads((HERE / "model.json").read_text(encoding="utf-8"))
    assert data["schema"] == "p97_pentagon_offclass_exact12_v2.model.v1"
    assert data["status"] == "SAT" and data["cardinality"] == 12
    assert data["theorem_profile"] == [5, 4, 6]
    assert data["frozen_profile"] == [5, 6, 4]
    assert data["theorem_to_frozen_cap_indices"] == [0, 2, 1]
    caps = [set(cap) for cap in data["caps"]]
    interiors = [set(block) for block in data["interiors"]]
    assert list(map(len, caps)) == [5, 6, 4]
    assert interiors[1] == {6, 7, 8, 9}
    assert caps[0] & caps[1] == {2} and caps[0] & caps[2] == {1} and caps[1] & caps[2] == {0}
    assert set().union(*caps) == set(range(12))

    roles = data["roles"]
    assert roles["physical_apex"] == 1
    assert (roles["u"], roles["c"], roles["xv"], roles["xu"]) == (6, 7, 8, 9)
    physical = set(data["physical_class"])
    assert physical == {roles[name] for name in ("u", "xu", "d", "v", "xv")}
    assert len(physical) == 5 and roles["c"] not in physical and 1 not in physical

    cube = {int(center): set(row) for center, row in data["cube"].items()}
    assert set(cube) == set(range(12))
    assert all(candidate_ok(center, row, interiors, caps) for center, row in cube.items())
    assert all(len(cube[a] & cube[b]) <= 2 for a, b in combinations(range(12), 2))
    pair_counts = {}
    for row in cube.values():
        for pair in combinations(sorted(row), 2):
            pair_counts[pair] = pair_counts.get(pair, 0) + 1
    assert max(pair_counts.values()) <= 2
    assert cube[1] <= physical
    assert all(len(cube[p] & physical) <= 2 for p in range(12) if p != 1)
    for pair in combinations(sorted(physical), 2):
        assert sum(set(pair) <= cube[p] for p in range(12) if p != 1) <= 1

    blockers = {int(source): center for source, center in data["blocker_map"].items()}
    assert set(blockers) == set(range(12))
    for source, center in blockers.items():
        assert center not in (source, 1) and source in cube[center]
    u, c, xv, xu, d, v = (roles[name] for name in ("u", "c", "xv", "xu", "d", "v"))
    assert blockers[u] == xv and blockers[xv] == c
    traces = {u: {u, xu}, xu: {xu, d}, d: {d, v}, v: {v, xv}, xv: {xv, u}}
    for source, edge in traces.items():
        assert cube[blockers[source]] & physical == edge
    assert len({blockers[source] for source in traces}) == 5

    assignment = read_assignment(HERE / "assignment.txt", data["variables"])
    variables, clauses = verify_cnf(HERE / "instance.cnf", assignment)
    assert variables == data["variables"] and clauses == data["clauses"]
    print(f"PASS semantic_model=1 clauses={clauses} variables={variables}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
