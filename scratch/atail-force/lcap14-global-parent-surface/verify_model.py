#!/usr/bin/env python3
"""Independent semantic replay of a decoded lcap14 surface assignment.

This verifier never reads the encoder's clauses.  It decodes the variable
assignment by name, reconstructs the complete radius partition at every
center, and re-derives every production field semantically from that
partition.  A model that satisfies the CNF but fails any semantic check
indicates an encoder bug and must be treated as a lane-stopping event.
"""

from __future__ import annotations

import argparse
import itertools
import json
from pathlib import Path

import encode as E


def parse_dimacs_names(path: Path) -> dict[int, str]:
    names = {}
    with path.open("r", encoding="ascii") as handle:
        for line in handle:
            if line.startswith("c var "):
                _, _, identifier, name = line.split(maxsplit=3)
                names[int(identifier)] = name.strip()
            elif line.startswith("p cnf"):
                break
    return names


def parse_assignment(path: Path) -> set[int]:
    true_literals: set[int] = set()
    for line in path.read_text(encoding="ascii").splitlines():
        if not line.startswith("v"):
            continue
        for token in line.split()[1:]:
            value = int(token)
            if value > 0:
                true_literals.add(value)
    return true_literals


class Decoded:
    def __init__(self, names: dict[int, str], true_vars: set[int]) -> None:
        self.true_names: set[str] = {
            names[v] for v in true_vars if v in names
        }

    def holds(self, name: str) -> bool:
        return name in self.true_names


def decode_partition(d: Decoded) -> dict[int, list[set[int]]]:
    """Union-find over the eq atoms, per center."""
    partition: dict[int, list[set[int]]] = {}
    for center in E.VERTICES:
        parent = {p: p for p in E.targets(center)}

        def find(x: int) -> int:
            while parent[x] != x:
                parent[x] = parent[parent[x]]
                x = parent[x]
            return x

        for left, right in itertools.combinations(E.targets(center), 2):
            if d.holds(f"eq_{center}_{left}_{right}"):
                parent[find(left)] = find(right)
        blocks: dict[int, set[int]] = {}
        for p in E.targets(center):
            blocks.setdefault(find(p), set()).add(p)
        partition[center] = list(blocks.values())
        # The decoded eq relation must itself be transitive: every pair
        # inside one block must carry a positive eq atom.
        for block in partition[center]:
            for left, right in itertools.combinations(sorted(block), 2):
                if not d.holds(f"eq_{center}_{left}_{right}"):
                    raise AssertionError(
                        f"partition at {center} not transitive on ({left},{right})"
                    )
    return partition


def class_of(partition: dict[int, list[set[int]]], center: int, point: int) -> set[int]:
    for block in partition[center]:
        if point in block:
            return block
    raise AssertionError((center, point))


def decode_row(d: Decoded, prefix: str, center: int, k: int) -> set[int]:
    row = {p for p in E.targets(center) if d.holds(f"{prefix}_{p}")}
    if len(row) != k:
        raise AssertionError(f"{prefix} has cardinality {len(row)} != {k}")
    return row


def verify(d: Decoded, pair_minimality: bool, subset_escape: bool) -> dict[str, object]:
    partition = decode_partition(d)
    report: dict[str, object] = {}

    # All-center K4 and selected rows.
    rows = {}
    for center in E.VERTICES:
        row = decode_row(d, f"m_{center}", center, 4)
        blocks = [b for b in partition[center] if row <= b]
        if len(blocks) != 1:
            raise AssertionError(f"selected row at {center} not inside one class")
        if not any(len(b) >= 4 for b in partition[center]):
            raise AssertionError(f"no K4 class at center {center}")
        rows[center] = row
    report["allcenter_k4"] = True

    # Bisector, alternation, circle-pair, cap and outside-pair constraints.
    for left, right in itertools.combinations(E.VERTICES, 2):
        owners = [
            c for c in E.VERTICES
            if c not in {left, right}
            and right in class_of(partition, c, left)
        ]
        if len(owners) > 2:
            raise AssertionError(f"pair ({left},{right}) has owners {owners}")
        if len(owners) == 2 and not E.pair_separates(left, right, *owners):
            raise AssertionError(
                f"pair ({left},{right}) owners {owners} fail alternation"
            )
    report["bisector_and_alternation"] = True

    for c, cp in itertools.combinations(E.VERTICES, 2):
        common = [p for p in E.VERTICES if p not in {c, cp}]
        for x, y, z in itertools.combinations(common, 3):
            if (
                {y, z} <= class_of(partition, c, x)
                and {y, z} <= class_of(partition, cp, x)
            ):
                raise AssertionError(
                    f"circles at {c},{cp} share three points {x},{y},{z}"
                )
    report["circle_pair_le_two"] = True

    for center in E.VERTICES:
        k4_blocks = [b for b in partition[center] if len(b) >= 4]
        if center in E.MOSER:
            for cap_name in E.INCIDENT_CAPS[center]:
                cap = set(E.CAPS[cap_name]) - {center}
                for block in k4_blocks:
                    if len(block & cap) > 1:
                        raise AssertionError(
                            f"K4 class at endpoint {center} hits {cap_name} twice"
                        )
        else:
            cap = set(E.CAPS[E.INTERIOR_CAP[center]]) - {center}
            for block in k4_blocks:
                if len(block & cap) > 2:
                    raise AssertionError(
                        f"K4 class at interior {center} hits own cap thrice"
                    )
    report["cap_bounds"] = True

    for cap_name, cap in E.CAPS.items():
        cap_set = set(cap)
        outside = [p for p in E.VERTICES if p not in cap_set]
        for a, b in itertools.combinations(outside, 2):
            in_cap_owners = [
                z for z in sorted(cap_set)
                if z not in {a, b} and b in class_of(partition, z, a)
            ]
            if len(in_cap_owners) > 1:
                raise AssertionError(
                    f"outside pair ({a},{b}) has two {cap_name} centers"
                )
    report["cap_outside_pair_unique_center"] = True

    # Total critical map.
    blockers = {}
    for source in E.VERTICES:
        chosen = [
            c for c in E.VERTICES
            if c != source and c not in E.ROBUST_APICES
            and d.holds(f"b_{source}_{c}")
        ]
        if len(chosen) != 1:
            raise AssertionError(f"source {source} has blockers {chosen}")
        center = chosen[0]
        blockers[source] = center
        for block in partition[center]:
            if len(block - {source}) >= 4:
                raise AssertionError(
                    f"blocker {center} of {source} retains a K4 class after deletion"
                )
        if source not in rows[center]:
            raise AssertionError(
                f"selected row at blocker {center} omits its source {source}"
            )
    report["total_critical_map"] = True

    # Apex robustness, checked semantically against the partition.
    for apex in E.ROBUST_APICES:
        blocks = partition[apex]
        has_five = any(len(b) >= 5 for b in blocks)
        k4_count = sum(1 for b in blocks if len(b) >= 4)
        if not (has_five or k4_count >= 2):
            raise AssertionError(f"apex {apex} is not fully deletion robust")
        if d.holds(f"r5_{apex}"):
            row5 = decode_row(d, f"row5_{apex}", apex, 5)
            if not any(row5 <= b for b in blocks):
                raise AssertionError(f"r5 witness at {apex} not inside one class")
        else:
            row2 = decode_row(d, f"m2_{apex}", apex, 4)
            if not any(row2 <= b for b in blocks):
                raise AssertionError(f"m2 witness at {apex} not inside one class")
            if class_of(partition, apex, next(iter(row2))) == class_of(
                partition, apex, next(iter(rows[apex]))
            ):
                raise AssertionError(f"m2 witness at {apex} shares the m class")
    report["apex_robustness"] = True

    # Frontier pair and witnesses.
    q = [p for p in E.FRONTIER_DOMAIN if d.holds(f"rq_{p}")]
    w = [p for p in E.FRONTIER_DOMAIN if d.holds(f"rw_{p}")]
    if len(q) != 1 or len(w) != 1 or q == w:
        raise AssertionError(f"frontier pair decode failed: {q}, {w}")
    q, w = q[0], w[0]
    if w not in class_of(partition, E.O1, q):
        raise AssertionError("frontier pair not co-radial at the first apex")
    if q not in E.STRICT_C2 and w not in E.STRICT_C2:
        raise AssertionError("neither frontier source is strictly first-cap")
    witness_specs = (
        ("sq1", E.O1, {q}), ("sw1", E.O1, {w}),
        ("sq2", E.O2, {q}), ("sw2", E.O2, {w}),
        ("d1", E.O1, {q, w}), ("d2", E.O2, {q, w}),
    )
    for prefix, center, avoid in witness_specs:
        row = decode_row(d, prefix, center, 4)
        if row & avoid:
            raise AssertionError(f"{prefix} intersects deleted set {avoid}")
        if not any(row <= b for b in partition[center]):
            raise AssertionError(f"{prefix} not inside one class")
    t0 = decode_row(d, "t0", E.O1, 4)
    if not {q, w} <= t0:
        raise AssertionError("t0 omits a frontier source")
    if not any(t0 <= b for b in partition[E.O1]):
        raise AssertionError("t0 not inside one class")
    for prefix in ("t0", "d1"):
        row = decode_row(d, prefix, E.O1, 4)
        if len(row & set(E.STRICT_C2)) < 2:
            raise AssertionError(f"{prefix} lacks two strict-cap hits")
    report["frontier_packet"] = True
    report["frontier_pair"] = [q, w]

    # Pair minimality.
    if pair_minimality:
        for i, j in itertools.combinations(E.VERTICES, 2):
            witnesses = [
                y for y in E.VERTICES
                if y not in {i, j} and d.holds(f"wdel2_{i}_{j}_{y}")
            ]
            if not witnesses:
                raise AssertionError(f"pair ({i},{j}) has no minimality witness")
            confirmed = False
            for y in witnesses:
                if all(
                    len(block - {i, j}) <= 3 for block in partition[y]
                ):
                    confirmed = True
                    break
            if not confirmed:
                raise AssertionError(
                    f"no declared witness for pair ({i},{j}) is semantically valid"
                )
        report["pair_minimality"] = True

    # Weak subset escape on the selected rows.
    if subset_escape:
        for size in range(1, E.N):
            for subset in itertools.combinations(E.VERTICES, size):
                inside = frozenset(subset)
                if all(rows[c] <= inside for c in subset):
                    raise AssertionError(f"row-closed proper subset {subset}")
        report["subset_row_escape"] = True

    report["blockers"] = {str(k): v for k, v in sorted(blockers.items())}
    report["rows"] = {str(c): sorted(rows[c]) for c in E.VERTICES}
    report["partition"] = {
        str(c): sorted(sorted(b) for b in partition[c]) for c in E.VERTICES
    }
    return report


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("dimacs", type=Path)
    parser.add_argument("solution", type=Path)
    parser.add_argument("--output", type=Path)
    parser.add_argument("--no-pair-minimality", action="store_true")
    parser.add_argument("--no-subset-escape", action="store_true")
    args = parser.parse_args()

    names = parse_dimacs_names(args.dimacs)
    true_vars = parse_assignment(args.solution)
    decoded = Decoded(names, true_vars)
    report = verify(
        decoded,
        pair_minimality=not args.no_pair_minimality,
        subset_escape=not args.no_subset_escape,
    )
    report["status"] = "SEMANTIC_REPLAY_PASS"
    if args.output:
        args.output.write_text(
            json.dumps(report, indent=2, sort_keys=True) + "\n", encoding="utf-8"
        )
    print("SEMANTIC_REPLAY_PASS")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
