#!/usr/bin/env python3
"""Audit persisted v3 models against the v4 perpendicular-bisector schema.

The audit is independent of both encoders.  It reconstructs the least global
edge-equality closure from selected-row and exact-U5 seeds, reads the v3
assignment of the global equality variables, enumerates every forbidden focus
pair/point triple in each relation, and checks that v4 preserves the exact v3
DIMACS clause body as a prefix.
"""

from __future__ import annotations

import hashlib
import itertools
import json
from collections import deque
from pathlib import Path


HERE = Path(__file__).resolve().parent
V3 = HERE.parent / "card11-exact5-common-fullradius-v3"
LABELS = tuple(range(11))
EDGES = tuple(itertools.combinations(LABELS, 2))


def sha256_file(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as handle:
        for chunk in iter(lambda: handle.read(1 << 20), b""):
            digest.update(chunk)
    return digest.hexdigest()


def edge(left: int, right: int) -> tuple[int, int]:
    if left == right:
        raise ValueError("loop edge")
    return min(left, right), max(left, right)


def global_key(first, second):
    first, second = edge(*first), edge(*second)
    if first == second:
        raise ValueError("reflexive equality has no variable")
    return tuple(sorted((first, second)))


class UnionFind:
    def __init__(self) -> None:
        self.parent = {value: value for value in EDGES}

    def find(self, value):
        while self.parent[value] != value:
            self.parent[value] = self.parent[self.parent[value]]
            value = self.parent[value]
        return value

    def union(self, first, second) -> None:
        first, second = self.find(first), self.find(second)
        if first != second:
            self.parent[max(first, second)] = min(first, second)


def assignment(path: Path) -> dict[int, bool]:
    payload = json.loads(path.read_text(encoding="utf-8"))
    literals = payload["signed_literals"]
    result = {abs(int(literal)): int(literal) > 0 for literal in literals}
    if len(result) != payload["variable_count"]:
        raise ValueError("model is not a unique complete assignment")
    return result


def dimacs_body(path: Path) -> tuple[tuple[int, int], list[str]]:
    lines = path.read_text(encoding="utf-8").splitlines()
    header = next(line for line in lines if line.startswith("p cnf "))
    _, _, variables, clauses = header.split()
    body = [
        line for line in lines
        if line and not line.startswith(("c", "p "))
    ]
    if len(body) != int(clauses):
        raise ValueError(f"DIMACS body count mismatch: {path}")
    return (int(variables), int(clauses)), body


def path_between(graph, start, target):
    queue = deque([start])
    prior = {start: None}
    while queue:
        current = queue.popleft()
        if current == target:
            break
        for neighbor, reason in graph[current]:
            if neighbor not in prior:
                prior[neighbor] = (current, reason)
                queue.append(neighbor)
    if target not in prior:
        raise ValueError("least-closure equality has no seed path")
    steps = []
    current = target
    while prior[current] is not None:
        previous, reason = prior[current]
        steps.append({
            "from_edge": list(previous),
            "to_edge": list(current),
            "seed": reason,
        })
        current = previous
    steps.reverse()
    return steps


def witnesses(equal, graph=None) -> list[dict]:
    result = []
    for a, b in itertools.combinations(LABELS, 2):
        points = [
            point for point in LABELS
            if point not in {a, b}
            and equal(edge(point, a), edge(point, b))
        ]
        for p, q, r in itertools.combinations(points, 3):
            witness = {
                "focus_a": a,
                "focus_b": b,
                "p": p,
                "q": q,
                "r": r,
            }
            if graph is not None:
                witness["closure_paths"] = [
                    {
                        "point": point,
                        "path": path_between(
                            graph, edge(point, a), edge(point, b)
                        ),
                    }
                    for point in (p, q, r)
                ]
            result.append(witness)
    return result


def audit_case(case_dir: Path) -> dict:
    manifest_path = case_dir / "manifest.json"
    model_path = case_dir / "model.json"
    manifest = json.loads(manifest_path.read_text(encoding="utf-8"))
    if manifest["schema"] != "card11_exact5_common_fullradius.v3":
        raise ValueError(f"not a v3 manifest: {case_dir}")
    values = assignment(model_path)
    if set(values) != set(range(1, int(manifest["variables"]) + 1)):
        raise ValueError(f"incomplete v3 model: {case_dir}")

    global_variables = {}
    for row in manifest["global_edge_equality_variables"]:
        key = global_key(row["first_edge"], row["second_edge"])
        global_variables[key] = int(row["variable"])
    if len(global_variables) != 1485:
        raise ValueError("expected all 1,485 global equality variables")

    def assigned_equal(first, second):
        if first == second:
            return True
        return values[global_variables[global_key(first, second)]]

    selected = []
    closure = UnionFind()
    graph = {value: [] for value in EDGES}

    def add_seed(first, second, reason):
        closure.union(first, second)
        graph[first].append((second, reason))
        graph[second].append((first, reason))

    for row in manifest["selected_rows"]:
        if not values[int(row["variable"])]:
            continue
        center = int(row["center"])
        support = sorted(map(int, row["support"]))
        selected.append({
            "center": center,
            "row_index": int(row["row_index"]),
            "support": support,
        })
        for left, right in itertools.combinations(support, 2):
            add_seed(
                edge(center, left),
                edge(center, right),
                {
                    "kind": "selected-row",
                    "center": center,
                    "row_index": int(row["row_index"]),
                    "support": support,
                },
            )
    if len(selected) != 11:
        raise ValueError(f"expected eleven selected rows: {case_dir}")

    shell = manifest["shell"]
    u5 = sorted(map(int, shell["u5"]))
    first_apex = int(shell["center_v"])
    for left, right in itertools.combinations(u5, 2):
        add_seed(
            edge(first_apex, left),
            edge(first_apex, right),
            {
                "kind": "proved-exact-five-shell",
                "center": first_apex,
                "support": u5,
            },
        )

    least_witnesses = witnesses(
        lambda first, second:
            closure.find(first) == closure.find(second),
        graph,
    )
    assigned_witnesses = witnesses(assigned_equal)
    if not assigned_witnesses:
        raise ValueError(
            f"v3 model has no v4 perpendicular-bisector witness: {case_dir}"
        )

    v3_counts, v3_body = dimacs_body(case_dir / "input.cnf")
    v4_input = HERE / "runs" / case_dir.name / "input.cnf"
    v4_counts, v4_body = dimacs_body(v4_input)
    if v3_body != v4_body[:len(v3_body)]:
        raise ValueError(f"v4 did not preserve exact v3 clause prefix: {case_dir}")
    prefix_hash = hashlib.sha256(
        ("\n".join(v3_body) + "\n").encode("utf-8")
    ).hexdigest()
    first = assigned_witnesses[0]
    first["global_equality_variables"] = [
        {
            "point": point,
            "variable": global_variables[
                global_key(edge(point, first["focus_a"]),
                           edge(point, first["focus_b"]))
            ],
            "assigned_true": True,
        }
        for point in (first["p"], first["q"], first["r"])
    ]
    return {
        "case": case_dir.name,
        "manifest_sha256": sha256_file(manifest_path),
        "model_sha256": sha256_file(model_path),
        "selected_rows": selected,
        "least_seeded_closure_witness_count": len(least_witnesses),
        "first_least_seeded_closure_witness": (
            least_witnesses[0] if least_witnesses else None
        ),
        "assigned_equivalence_witness_count": len(assigned_witnesses),
        "first_assigned_equivalence_witness": first,
        "rejected_by_v4_obstruction": True,
        "v3_cnf_counts": {"variables": v3_counts[0], "clauses": v3_counts[1]},
        "v4_cnf_counts": {"variables": v4_counts[0], "clauses": v4_counts[1]},
        "exact_v3_clause_prefix_preserved": True,
        "exact_v3_clause_prefix_sha256": prefix_hash,
    }


def main() -> int:
    cases = [
        audit_case(case_dir)
        for case_dir in sorted((V3 / "runs").iterdir())
        if (case_dir / "model.json").exists()
    ]
    expected = ["s2_o0", "s2_o9", "s3_o0", "s3_o9"]
    if [case["case"] for case in cases] != expected:
        raise ValueError("expected exactly the four persisted v3 cases")
    payload = {
        "schema": (
            "card11_exact5_common_fullradius.v4.v3-model-rejection.v1"
        ),
        "seed_semantics": (
            "least unordered-edge equality closure generated only by the "
            "eleven selected-row internal equalities and the proved exact-five "
            "first-apex shell; assigned witnesses additionally audit the "
            "complete v3 equivalence extension"
        ),
        "clause_schema": (
            "for each focus pair a<b and point triple p<q<r outside the pair: "
            "not G(pa,pb) or not G(qa,qb) or not G(ra,rb)"
        ),
        "cases": cases,
        "all_four_rejected": all(
            case["rejected_by_v4_obstruction"] for case in cases
        ),
    }
    output = HERE / "v3-model-rejection.json"
    output.write_text(
        json.dumps(payload, sort_keys=True, indent=2) + "\n",
        encoding="utf-8",
    )
    print(json.dumps({
        "output": str(output),
        "cases": len(cases),
        "witnesses": [
            {
                "case": case["case"],
                **{
                    key: case["first_assigned_equivalence_witness"][key]
                    for key in ("focus_a", "focus_b", "p", "q", "r")
                },
                "least_seeded_closure_witness_count":
                    case["least_seeded_closure_witness_count"],
            }
            for case in cases
        ],
    }, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
