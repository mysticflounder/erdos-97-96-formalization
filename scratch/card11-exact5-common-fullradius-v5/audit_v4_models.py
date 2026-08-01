#!/usr/bin/env python3
"""Audit persisted v4 models against the v5 convex-five-point schema.

The audit is independent of both encoders.  It reconstructs the least global
edge-equality closure from selected-row seeds alone, reads the v4 assignment
of the global equality variables, enumerates every forbidden forward cyclic
five-tuple under the selected boundary order, and checks that v5 preserves the
exact v4 DIMACS clause body as a prefix.
"""

from __future__ import annotations

import hashlib
import itertools
import json
from collections import deque
from pathlib import Path


HERE = Path(__file__).resolve().parent
V4 = HERE.parent / "card11-exact5-common-fullradius-v4"
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


def witness_summary(orders, equal, graph=None) -> tuple[int, dict | None]:
    count = 0
    first_witness = None
    for order in orders:
        labels = tuple(map(int, order["labels"]))
        for start in range(len(labels)):
            cyclic = labels[start:] + labels[:start]
            a = cyclic[0]
            for positions in itertools.combinations(range(1, len(labels)), 4):
                x, b, c, y = (cyclic[position] for position in positions)
                comparisons = (
                    ("xa=xb", edge(x, a), edge(x, b)),
                    ("ya=yb", edge(y, a), edge(y, b)),
                    ("cb=cx", edge(c, b), edge(c, x)),
                    ("cb=cy", edge(c, b), edge(c, y)),
                )
                if not all(equal(left, right)
                           for _, left, right in comparisons):
                    continue
                count += 1
                if first_witness is None:
                    first_witness = {
                        "selector_variable": int(order["variable"]),
                        "orientation": order["orientation"],
                        "internal_index": int(order["internal_index"]),
                        "order_labels": list(labels),
                        "a": a, "x": x, "b": b, "c": c, "y": y,
                        "equalities": [
                            {
                                "name": name,
                                "first_edge": list(left),
                                "second_edge": list(right),
                                **({
                                    "selected_row_seed_path":
                                        path_between(graph, left, right),
                                } if graph is not None else {}),
                            }
                            for name, left, right in comparisons
                        ],
                    }
    return count, first_witness


def audit_case(case_dir: Path) -> dict:
    manifest_path = case_dir / "manifest.json"
    model_path = case_dir / "model.json"
    manifest = json.loads(manifest_path.read_text(encoding="utf-8"))
    if manifest["schema"] != "card11_exact5_common_fullradius.v4":
        raise ValueError(f"not a v4 manifest: {case_dir}")
    values = assignment(model_path)
    if set(values) != set(range(1, int(manifest["variables"]) + 1)):
        raise ValueError(f"incomplete v4 model: {case_dir}")

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

    selected_orders = [
        order for order in manifest["order_selectors"]
        if values[int(order["variable"])]
    ]
    if not selected_orders:
        raise ValueError(f"v4 model has no selected order: {case_dir}")

    least_count, least_witness = witness_summary(
        selected_orders,
        lambda first, second:
            closure.find(first) == closure.find(second),
        graph,
    )
    assigned_count, assigned_witness = witness_summary(
        selected_orders, assigned_equal
    )
    if least_witness is None:
        raise ValueError(
            f"v4 model has no selected-row-only v5 witness: {case_dir}"
        )
    if assigned_witness is None:
        raise ValueError(
            f"v4 model has no assigned v5 witness: {case_dir}"
        )
    for equality in least_witness["equalities"]:
        path = equality["selected_row_seed_path"]
        if len(path) != 1 or path[0]["seed"]["kind"] != "selected-row":
            raise ValueError(
                "v5 witness is not justified by direct selected-row seeds"
            )

    v4_counts, v4_body = dimacs_body(case_dir / "input.cnf")
    v5_input = HERE / "runs" / case_dir.name / "input.cnf"
    v5_counts, v5_body = dimacs_body(v5_input)
    if v4_body != v5_body[:len(v4_body)]:
        raise ValueError(f"v5 did not preserve exact v4 clause prefix: {case_dir}")
    prefix_hash = hashlib.sha256(
        ("\n".join(v4_body) + "\n").encode("utf-8")
    ).hexdigest()
    return {
        "case": case_dir.name,
        "manifest_sha256": sha256_file(manifest_path),
        "model_sha256": sha256_file(model_path),
        "selected_rows": selected,
        "selected_orders": selected_orders,
        "selected_row_seed_count": 66,
        "exact_u5_seeds_used": 0,
        "least_selected_row_closure_witness_count": least_count,
        "first_least_selected_row_closure_witness": least_witness,
        "assigned_equivalence_witness_count": assigned_count,
        "first_assigned_equivalence_witness": assigned_witness,
        "rejected_by_v5_obstruction": True,
        "v4_cnf_counts": {"variables": v4_counts[0], "clauses": v4_counts[1]},
        "v5_cnf_counts": {"variables": v5_counts[0], "clauses": v5_counts[1]},
        "exact_v4_clause_prefix_preserved": True,
        "exact_v4_clause_prefix_sha256": prefix_hash,
    }


def main() -> int:
    cases = [
        audit_case(case_dir)
        for case_dir in sorted((V4 / "runs").iterdir())
        if (case_dir / "model.json").exists()
    ]
    expected = ["s2_o0", "s2_o9", "s3_o0", "s3_o9"]
    if [case["case"] for case in cases] != expected:
        raise ValueError("expected exactly the four persisted v4 cases")
    payload = {
        "schema": (
            "card11_exact5_common_fullradius.v5.v4-model-rejection.v1"
        ),
        "seed_semantics": (
            "least unordered-edge equality closure generated only by the "
            "eleven selected-row internal equalities; exact-U5 contributes "
            "zero seeds; assigned witnesses additionally audit the complete "
            "v4 equivalence extension"
        ),
        "clause_schema": (
            "for each selected boundary order and cyclic tuple (a,x,b,c,y): "
            "not O or not G(xa,xb) or not G(ya,yb) or not G(cb,cx) "
            "or not G(cb,cy)"
        ),
        "cases": cases,
        "all_four_rejected": all(
            case["rejected_by_v5_obstruction"] for case in cases
        ),
    }
    output = HERE / "v4-model-rejection.json"
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
                    key: case["first_least_selected_row_closure_witness"][key]
                    for key in ("a", "x", "b", "c", "y")
                },
                "least_selected_row_closure_witness_count":
                    case["least_selected_row_closure_witness_count"],
            }
            for case in cases
        ],
    }, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
