#!/usr/bin/env python3
"""Audit the four persisted v2 models against the v3 seeded edge closure.

This script is independent of both encoders.  It reads only v2 manifests and
complete model artifacts, reconstructs the least global equality closure from
selected-row internal equalities plus the exact-five first-apex shell, and
emits explicit duplicate-center witnesses with seed paths.
"""

from __future__ import annotations

import hashlib
import itertools
import json
from collections import deque
from pathlib import Path


HERE = Path(__file__).resolve().parent
V2 = HERE.parent / "card11-exact5-common-fullradius-v2"
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
        raise ValueError("closure equality has no seed path")
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


def audit_case(case_dir: Path) -> dict:
    manifest_path = case_dir / "manifest.json"
    model_path = case_dir / "model.json"
    manifest = json.loads(manifest_path.read_text(encoding="utf-8"))
    if manifest["schema"] != "card11_exact5_common_fullradius.v2":
        raise ValueError(f"not a v2 manifest: {case_dir}")
    values = assignment(model_path)
    if set(values) != set(range(1, int(manifest["variables"]) + 1)):
        raise ValueError(f"incomplete v2 model: {case_dir}")

    selected = []
    uf = UnionFind()
    graph = {value: [] for value in EDGES}

    def add_seed(first, second, reason):
        uf.union(first, second)
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

    witnesses = []
    for p, q, r in itertools.combinations(LABELS, 3):
        centers = [
            center for center in LABELS
            if center not in {p, q, r}
            and uf.find(edge(center, p)) == uf.find(edge(center, q))
            and uf.find(edge(center, p)) == uf.find(edge(center, r))
        ]
        for first_center, second_center in itertools.combinations(centers, 2):
            equalities = []
            for center, target in (
                (first_center, q), (first_center, r),
                (second_center, q), (second_center, r),
            ):
                start_edge = edge(center, p)
                target_edge = edge(center, target)
                equalities.append({
                    "center": center,
                    "left_label": p,
                    "right_label": target,
                    "path": path_between(graph, start_edge, target_edge),
                })
            witnesses.append({
                "p": p, "q": q, "r": r,
                "first_center": first_center,
                "second_center": second_center,
                "closure_paths": equalities,
            })
    if not witnesses:
        raise ValueError(f"v2 model has no v3 duplicate-center witness: {case_dir}")
    v2_counts, v2_body = dimacs_body(case_dir / "input.cnf")
    v3_input = HERE / "runs" / case_dir.name / "input.cnf"
    v3_counts, v3_body = dimacs_body(v3_input)
    if v2_body != v3_body[:len(v2_body)]:
        raise ValueError(f"v3 did not preserve the exact v2 clause prefix: {case_dir}")
    prefix_hash = hashlib.sha256(
        ("\n".join(v2_body) + "\n").encode("utf-8")
    ).hexdigest()
    return {
        "case": case_dir.name,
        "manifest_sha256": sha256_file(manifest_path),
        "model_sha256": sha256_file(model_path),
        "selected_rows": selected,
        "duplicate_witness_count": len(witnesses),
        "first_duplicate_witness": witnesses[0],
        "rejected_by_v3_obstruction": True,
        "v2_cnf_counts": {"variables": v2_counts[0], "clauses": v2_counts[1]},
        "v3_cnf_counts": {"variables": v3_counts[0], "clauses": v3_counts[1]},
        "exact_v2_clause_prefix_preserved": True,
        "exact_v2_clause_prefix_sha256": prefix_hash,
    }


def main() -> int:
    cases = [
        audit_case(case_dir)
        for case_dir in sorted((V2 / "runs").iterdir())
        if (case_dir / "model.json").exists()
    ]
    if [case["case"] for case in cases] != ["s2_o0", "s2_o9", "s3_o0", "s3_o9"]:
        raise ValueError("expected exactly the four persisted v2 cases")
    payload = {
        "schema": "card11_exact5_common_fullradius.v3.v2-model-rejection.v1",
        "seed_semantics": (
            "least unordered-edge equality closure generated only by the eleven "
            "selected-row internal equalities and the proved exact-five "
            "first-apex shell"
        ),
        "cases": cases,
        "all_four_rejected": all(case["rejected_by_v3_obstruction"] for case in cases),
    }
    output = HERE / "v2-model-rejection.json"
    output.write_text(
        json.dumps(payload, sort_keys=True, indent=2) + "\n", encoding="utf-8"
    )
    print(json.dumps({
        "output": str(output),
        "cases": len(cases),
        "witnesses": [
            {
                "case": case["case"],
                **{
                    key: case["first_duplicate_witness"][key]
                    for key in ("p", "q", "r", "first_center", "second_center")
                },
            }
            for case in cases
        ],
    }, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
