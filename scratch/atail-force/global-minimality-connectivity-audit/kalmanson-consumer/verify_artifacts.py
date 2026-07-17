#!/usr/bin/env python3
"""Independent replay of the Kalmanson prefix and continuation artifacts.

This verifier does not import ``kalmanson_audit``, ``prefix_filter``, or
``kalmanson_continuation``.  It reconstructs the unordered-edge quotient and
strict graph directly, checks every stored ordinal/Farkas certificate, and
independently rebuilds the fixed-profile candidate domains underlying the
continuation's singleton-domain UNSAT certificate.
"""

from __future__ import annotations

import argparse
from collections import defaultdict
import hashlib
import importlib.util
import itertools
import json
from pathlib import Path
import sys
from typing import Iterable, Mapping, Sequence


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[3]
CHECKPOINT = ROOT / "scratch/atail-force/robust-all-center-marco/bank_cegar_checkpoint.json"
AUDIT_RESULTS = HERE / "audit_results.json"
CONTINUATION = HERE / "continuation_checkpoint.json"
ROBUST_SEARCH = ROOT / "scratch/atail-force/robust-all-center-cegar/search.py"
EXPECTED_CHECKPOINT_SHA = "b307fed8cf6c30508a615553f5a1caf8a836859f3d70f1907eb3f34b9196c8b9"
ORDER = ("O", "t1", "I", "F", "A", "X", "Y", "Z", "D", "J", "E", "C", "G", "K")
PROFILE = (8, 4, 5)
SURPLUS = frozenset({"O", "t1", "I", "F", "A"})
ROBUST_SUPPORT_CENTERS = frozenset({"A", "F", "I", "X", "Y", "Z"})
Q = "E"
W = "D"
FIXED_SUPPORTS = {
    "O": frozenset({"A", "C", "D", "E"}),
    "A": frozenset({"O", "C", "G", "K"}),
    "D": frozenset({"A", "E", "I", "F"}),
    "t1": frozenset({"X", "Y", "Z", "D"}),
}
AMBIENT_O = frozenset({"A", "C", "D", "E", "J"})


def file_sha(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def canonical_sha(value: object) -> str:
    return hashlib.sha256(
        json.dumps(value, sort_keys=True, separators=(",", ":")).encode()
    ).hexdigest()


class DSU:
    def __init__(self, size: int) -> None:
        self.parent = list(range(size))

    def find(self, value: int) -> int:
        while self.parent[value] != value:
            self.parent[value] = self.parent[self.parent[value]]
            value = self.parent[value]
        return value

    def union(self, left: int, right: int) -> None:
        left = self.find(left)
        right = self.find(right)
        if left != right:
            self.parent[right] = left


def equality_quotient(
    order: Sequence[object], rows: Iterable[tuple[object, Iterable[object]]]
) -> tuple[tuple[tuple[object, object], ...], list[int]]:
    positions = {label: index for index, label in enumerate(order)}
    edges = tuple(itertools.combinations(order, 2))
    edge_index = {edge: index for index, edge in enumerate(edges)}

    def edge_id(left: object, right: object) -> int:
        edge = (left, right) if positions[left] < positions[right] else (right, left)
        return edge_index[edge]

    quotient = DSU(len(edges))
    for center, support in rows:
        selected = [edge_id(center, point) for point in support]
        for edge in selected[1:]:
            quotient.union(selected[0], edge)
    roots = sorted({quotient.find(index) for index in range(len(edges))})
    classes = {root: index for index, root in enumerate(roots)}
    return edges, [classes[quotient.find(index)] for index in range(len(edges))]


def independent_has_cycle(
    order: Sequence[object], rows: Iterable[tuple[object, Iterable[object]]]
) -> bool:
    positions = {label: index for index, label in enumerate(order)}
    edges, classes = equality_quotient(order, rows)
    edge_index = {edge: index for index, edge in enumerate(edges)}

    def edge_class(left: object, right: object) -> int:
        edge = (left, right) if positions[left] < positions[right] else (right, left)
        return classes[edge_index[edge]]

    adjacency: dict[int, set[int]] = defaultdict(set)
    for indices in itertools.combinations(range(len(order)), 4):
        a, b, c, d = (order[index] for index in indices)
        for left, right in (
            (((a, c), (b, d)), ((a, b), (c, d))),
            (((a, c), (b, d)), ((a, d), (b, c))),
        ):
            left_classes = tuple(edge_class(*edge) for edge in left)
            right_classes = tuple(edge_class(*edge) for edge in right)
            for i in (0, 1):
                for j in (0, 1):
                    if left_classes[i] != right_classes[j]:
                        continue
                    smaller = right_classes[1 - j]
                    larger = left_classes[1 - i]
                    if smaller == larger:
                        return True
                    adjacency[smaller].add(larger)
    for start in set(classes):
        reached: set[int] = set()
        pending = list(adjacency[start])
        while pending:
            current = pending.pop()
            if current == start:
                return True
            if current in reached:
                continue
            reached.add(current)
            pending.extend(adjacency[current] - reached)
    return False


def verify_stored_cycle(
    order: Sequence[str], rows: Sequence[Mapping[str, object]], cycle: Mapping[str, object]
) -> None:
    positions = {label: index for index, label in enumerate(order)}
    edges, classes = equality_quotient(
        order, ((row["center"], row["support"]) for row in rows)
    )
    edge_index = {edge: index for index, edge in enumerate(edges)}
    supports = {row["center"]: set(row["support"]) for row in rows}

    def canonical(edge: Sequence[str]) -> tuple[str, str]:
        left, right = edge
        return (left, right) if positions[left] < positions[right] else (right, left)

    def edge_class(edge: Sequence[str]) -> int:
        return classes[edge_index[canonical(edge)]]

    coefficient_sum: dict[int, int] = defaultdict(int)
    strict_pairs: list[tuple[int, int]] = []
    for step in cycle["steps"]:
        a, b, c, d = step["cyclic_quadruple"]
        assert positions[a] < positions[b] < positions[c] < positions[d]
        expected_left = [canonical((a, c)), canonical((b, d))]
        expected_right = (
            [canonical((a, b)), canonical((c, d))]
            if step["inequality_kind"] == "K1"
            else [canonical((a, d)), canonical((b, c))]
        )
        assert [canonical(edge) for edge in step["left_terms"]] == expected_left
        assert [canonical(edge) for edge in step["right_terms"]] == expected_right
        cancelled_left = canonical(step["cancelled_left_edge"])
        cancelled_right = canonical(step["cancelled_right_edge"])
        center = step["direct_equality_row_center"]
        assert center in cancelled_left and center in cancelled_right
        other_left = cancelled_left[0] if cancelled_left[1] == center else cancelled_left[1]
        other_right = cancelled_right[0] if cancelled_right[1] == center else cancelled_right[1]
        assert other_left in supports[center] and other_right in supports[center]
        assert edge_class(cancelled_left) == edge_class(cancelled_right)

        remaining_left = canonical(step["remaining_left_edge"])
        remaining_right = canonical(step["remaining_right_edge"])
        larger = edge_class(remaining_left)
        smaller = edge_class(remaining_right)
        strict_pairs.append((smaller, larger))
        for edge in expected_left:
            coefficient_sum[edge_class(edge)] += 1
        for edge in expected_right:
            coefficient_sum[edge_class(edge)] -= 1
    assert all(
        strict_pairs[index][1] == strict_pairs[(index + 1) % len(strict_pairs)][0]
        for index in range(len(strict_pairs))
    )
    assert not {key: value for key, value in coefficient_sum.items() if value}
    replay = cycle["integer_farkas_replay"]
    assert replay["status"] == "PASS"
    assert replay["normalized_summed_rhs"] == len(strict_pairs)


def verify_prefix() -> dict[str, object]:
    assert file_sha(CHECKPOINT) == EXPECTED_CHECKPOINT_SHA
    checkpoint = json.loads(CHECKPOINT.read_text(encoding="utf-8"))
    audit = json.loads(AUDIT_RESULTS.read_text(encoding="utf-8"))
    assert audit["checkpoint"]["sha256"] == EXPECTED_CHECKPOINT_SHA
    assert len(audit["records"]) == len(checkpoint["structural_survivors"]) == 101
    lengths: dict[int, int] = defaultdict(int)
    for ordinal, (record, survivor) in enumerate(
        zip(audit["records"], checkpoint["structural_survivors"])
    ):
        assert record["ordinal_zero_based"] == ordinal
        assert canonical_sha(survivor["rows"]) == survivor["row_assignment_sha256"]
        cycle = record["shortest_cycle"]
        verify_stored_cycle(ORDER, survivor["rows"], cycle)
        lengths[cycle["length"]] += 1
    terminal = audit["records"][-1]
    assert terminal["existing_bank_match"] is False
    assert terminal["row_assignment_sha256"] == checkpoint["witness"]["row_assignment_sha256"]
    for result in terminal["exact_linear_cross_check"].values():
        assert result["status"] == "UNSAT_EXACT_LRA_WITH_INTEGER_FARKAS_REPLAY"
    assert dict(sorted(lengths.items())) == {1: 89, 2: 12}
    return {
        "stored_prefix_certificates_replayed": 101,
        "cycle_length_distribution": {str(k): v for k, v in sorted(lengths.items())},
        "terminal_certificate_replayed": True,
    }


def load_robust_search() -> object:
    spec = importlib.util.spec_from_file_location("p97_verify_robust", ROBUST_SEARCH)
    if spec is None or spec.loader is None:
        raise RuntimeError("cannot load robust search")
    module = importlib.util.module_from_spec(spec)
    sys.modules["p97_verify_robust"] = module
    spec.loader.exec_module(module)
    return module


def verify_continuation() -> dict[str, object]:
    continuation = json.loads(CONTINUATION.read_text(encoding="utf-8"))
    assert continuation["base_checkpoint_sha256"] == EXPECTED_CHECKPOINT_SHA
    assert continuation["status"] == "UNSAT_EXHAUSTIVE_FINITE_DFS"
    robust = load_robust_search()
    surface = robust.Surface()
    shadow = robust.shadow
    numeric_order = tuple(shadow.hull_order(surface.frame))
    o = surface.by_name[robust.FIRST_APEX]
    q = surface.by_name[Q]
    w = surface.by_name[W]
    ambient = surface.ambient_first_apex_row()
    fixed = [
        shadow.ClassRow(
            f"global:{surface.by_name[name]}",
            surface.by_name[name],
            surface.candidates[surface.by_name[name]][0],
            exact=False,
        )
        for name in ("O", "A", "D", "t1")
    ]
    fixed_actual = (ambient, *(row for row in fixed if row.center != o))
    assert not independent_has_cycle(
        numeric_order,
        ((row.center, row.support) for row in fixed_actual),
    )
    stored = {
        record["center"]: record
        for record in continuation["last_event"]["singleton_domain_audit"]
    }
    replayed: dict[str, dict[str, object]] = {}
    for center in range(surface.frame.n):
        name = surface.by_label[center]
        if name in robust.FIXED_LOCAL_ROWS:
            continue
        candidates = tuple(
            support
            for support in surface.candidates[center]
            if (
                name not in ROBUST_SUPPORT_CENTERS
                or not ({q, w} <= set(support))
            )
            and shadow.rows_compatible(
                surface.frame,
                ambient,
                shadow.ClassRow("candidate", center, support, exact=False),
            )
        )
        killed = sum(
            independent_has_cycle(
                numeric_order,
                (
                    *((row.center, row.support) for row in fixed_actual),
                    (center, support),
                ),
            )
            for support in candidates
        )
        normalized_hash = canonical_sha(sorted([sorted(support) for support in candidates]))
        assert stored[name]["candidate_count"] == len(candidates)
        assert stored[name]["candidate_supports_sha256"] == normalized_hash
        assert stored[name]["kalmanson_killed_with_fixed_prefix"] == killed
        replayed[name] = {
            "candidate_count": len(candidates),
            "killed": killed,
            "survives": len(candidates) - killed,
            "candidate_supports_sha256": normalized_hash,
        }
    zero = sorted(name for name, data in replayed.items() if data["survives"] == 0)
    assert zero == continuation["last_event"]["zero_singleton_domain_centers"]
    assert zero == ["F", "I", "X"]
    return {
        "fixed_prefix_cycle": False,
        "zero_singleton_domains": zero,
        "domains": replayed,
    }


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--output", type=Path, default=HERE / "verification_results.json")
    args = parser.parse_args()
    result = {
        "status": "PASS",
        "prefix": verify_prefix(),
        "continuation": verify_continuation(),
    }
    rendered = json.dumps(result, indent=2, sort_keys=True) + "\n"
    args.output.write_text(rendered, encoding="utf-8")
    print(rendered, end="")


if __name__ == "__main__":
    main()
