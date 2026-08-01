#!/usr/bin/env python3
"""Sound three-valued power-pattern audit for selected P97 survivor banks.

The audit deliberately never identifies "unknown" with either zero or
nonzero.  A determinant hit is reported only when:

* the displayed matching consists entirely of proved-nonzero entries; and
* every other permutation term contains a proved-zero entry.

Two input shapes are supported:

1. Phase-3 ten-point survivors.  Each selected row gives four proved-zero
   power entries and the row's own center gives one proved-nonzero entry.
   Because ``exact`` is false, every other entry is unknown.
2. The aligned-singleton induced CEGAR survivor.  Its required row truth
   values are decoded as exact equal-/unequal-distance statements within the
   recorded Boolean skeleton.  They yield zero/nonzero power entries when a
   pivot radius is compared with a target; absent comparisons stay unknown.

The search is exhaustive for center-diagonal 5x5 minors: choose five distinct
circle centers and use those same five carrier points as columns.  If a center
has several candidate radius classes, every candidate choice is tried.
The analogous center-diagonal 4x4 row-difference test is also exhaustive.
"""

from __future__ import annotations

import argparse
import hashlib
import itertools
import json
from dataclasses import dataclass
from pathlib import Path
from typing import Iterable, Literal


State = Literal["zero", "nonzero", "unknown"]


@dataclass(frozen=True)
class CirclePattern:
    label: str
    center: str
    entries: tuple[tuple[str, State], ...]
    full_relative_to_columns: bool
    zero_count: int
    provenance: str

    def at(self, point: str) -> State:
        return dict(self.entries).get(point, "unknown")


def sha256_bytes(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def canonical_rows_sha(rows: object) -> str:
    return sha256_bytes(
        json.dumps(rows, sort_keys=True, separators=(",", ":")).encode()
    )


def count_perfect_matchings(
    matrix: list[list[State]], *, cap: int = 2
) -> tuple[int, tuple[int, ...] | None]:
    """Count nonzero-or-unknown matchings, stopping once ``cap`` is reached."""
    n = len(matrix)
    count = 0
    witness: tuple[int, ...] | None = None

    def visit(row: int, used: int, choice: list[int]) -> None:
        nonlocal count, witness
        if count >= cap:
            return
        if row == n:
            count += 1
            if witness is None:
                witness = tuple(choice)
            return
        for column, state in enumerate(matrix[row]):
            if not (used >> column) & 1 and state != "zero":
                choice.append(column)
                visit(row + 1, used | (1 << column), choice)
                choice.pop()

    visit(0, 0, [])
    return count, witness


def determinant_hit(
    rows: tuple[CirclePattern, ...], columns: tuple[str, ...]
) -> dict[str, object] | None:
    matrix = [[row.at(column) for column in columns] for row in rows]
    count, matching = count_perfect_matchings(matrix)
    if count != 1 or matching is None:
        return None
    if any(matrix[i][matching[i]] != "nonzero" for i in range(len(rows))):
        return None
    return {
        "rows": [row.label for row in rows],
        "columns": list(columns),
        "matching": [
            [rows[i].label, columns[matching[i]]] for i in range(len(rows))
        ],
        "matrix": matrix,
    }


def diagonal_minor_hits(
    circles: Iterable[CirclePattern], size: int
) -> list[dict[str, object]]:
    by_center: dict[str, list[CirclePattern]] = {}
    for circle in circles:
        if circle.at(circle.center) == "nonzero":
            by_center.setdefault(circle.center, []).append(circle)
    hits: list[dict[str, object]] = []
    for centers in itertools.combinations(sorted(by_center), size):
        for rows in itertools.product(*(by_center[center] for center in centers)):
            hit = determinant_hit(tuple(rows), centers)
            if hit is not None:
                hits.append(hit)
    return hits


def difference_state(left: State, baseline: State) -> State:
    if left == "zero" and baseline == "zero":
        return "zero"
    if {left, baseline} == {"zero", "nonzero"}:
        return "nonzero"
    return "unknown"


def difference_hits(circles: Iterable[CirclePattern]) -> list[dict[str, object]]:
    circles = tuple(circles)
    hits: list[dict[str, object]] = []
    for baseline in circles:
        differences: list[CirclePattern] = []
        all_points = sorted(
            {point for circle in circles for point, _ in circle.entries}
        )
        for circle in circles:
            if circle == baseline or circle.center == baseline.center:
                continue
            entries = tuple(
                (
                    point,
                    difference_state(circle.at(point), baseline.at(point)),
                )
                for point in all_points
            )
            differences.append(
                CirclePattern(
                    label=f"({circle.label})-({baseline.label})",
                    center=circle.center,
                    entries=entries,
                    full_relative_to_columns=all(
                        state != "unknown" for _, state in entries
                    ),
                    zero_count=sum(state == "zero" for _, state in entries),
                    provenance="row difference",
                )
            )
        for hit in diagonal_minor_hits(differences, 4):
            hit["baseline"] = baseline.label
            hits.append(hit)
    return hits


def phase3_circles(record: dict[str, object]) -> list[CirclePattern]:
    raw_rows = record.get("metric_rows")
    if not isinstance(raw_rows, list):
        raise ValueError("phase3 record has no metric_rows list")
    points = tuple(str(i) for i in range(len(raw_rows)))
    circles: list[CirclePattern] = []
    for raw in raw_rows:
        if not isinstance(raw, dict):
            raise ValueError("invalid phase3 metric row")
        center = str(raw["center"])
        support = {str(point) for point in raw["support"]}
        exact = raw.get("exact")
        entries: list[tuple[str, State]] = []
        for point in points:
            if point in support:
                state: State = "zero"
            elif point == center:
                state = "nonzero"
            elif exact is True:
                state = "nonzero"
            else:
                state = "unknown"
            entries.append((point, state))
        circles.append(
            CirclePattern(
                label=f"C{center}",
                center=center,
                entries=tuple(entries),
                full_relative_to_columns=exact is True,
                zero_count=len(support),
                provenance=(
                    "selected support; exact full class"
                    if exact is True
                    else "chosen four-subset; off-support unknown"
                ),
            )
        )
    return circles


class UnionFind:
    def __init__(self, values: Iterable[str]) -> None:
        self.parent = {value: value for value in values}

    def find(self, value: str) -> str:
        parent = self.parent[value]
        if parent != value:
            self.parent[value] = self.find(parent)
        return self.parent[value]

    def union(self, left: str, right: str) -> None:
        left_root, right_root = self.find(left), self.find(right)
        if left_root != right_root:
            self.parent[right_root] = left_root


def aligned_circles(document: dict[str, object]) -> tuple[list[CirclePattern], dict]:
    survivor = document.get("survivor")
    if not isinstance(survivor, dict):
        raise ValueError("aligned document has no survivor")
    classes = survivor.get("alias_classes_in_order")
    assignment = survivor.get("required_row_assignment")
    if not isinstance(classes, list) or not isinstance(assignment, list):
        raise ValueError("aligned survivor shape is invalid")

    alias_of: dict[str, str] = {}
    columns: list[str] = []
    for index, raw_class in enumerate(classes):
        if not isinstance(raw_class, list) or not raw_class:
            raise ValueError("invalid alias class")
        column = f"Q{index}:{raw_class[0]}"
        columns.append(column)
        for name in raw_class:
            alias_of[str(name)] = column

    by_center: dict[str, list[tuple[str, str, bool]]] = {}
    for raw in assignment:
        if (
            not isinstance(raw, list)
            or len(raw) != 5
            or raw[0] != "row"
            or not isinstance(raw[4], bool)
        ):
            raise ValueError("invalid required row assignment")
        _, center, left, right, equal = raw
        by_center.setdefault(str(center), []).append(
            (str(left), str(right), equal)
        )

    circles: list[CirclePattern] = []
    center_summaries: dict[str, dict[str, int]] = {}
    for center_name, rows in sorted(by_center.items()):
        center = alias_of[center_name]
        uf = UnionFind(columns)
        false_pairs: list[tuple[str, str]] = []
        for left, right, equal in rows:
            left_q, right_q = alias_of[left], alias_of[right]
            if equal:
                uf.union(left_q, right_q)
            else:
                false_pairs.append((left_q, right_q))
        components: dict[str, set[str]] = {}
        for point in columns:
            components.setdefault(uf.find(point), set()).add(point)
        false_component_pairs = {
            frozenset((uf.find(left), uf.find(right)))
            for left, right in false_pairs
            if uf.find(left) != uf.find(right)
        }
        emitted = 0
        full = 0
        for component in sorted(components.values(), key=lambda x: sorted(x)):
            # Only positive-radius classes with at least four distinct quotient
            # points are selected-circle candidates for this audit.
            if center in component or len(component) < 4:
                continue
            root = uf.find(next(iter(component)))
            entries: list[tuple[str, State]] = []
            for point in columns:
                point_root = uf.find(point)
                if point_root == root:
                    state: State = "zero"
                elif point == center:
                    state = "nonzero"
                elif frozenset((root, point_root)) in false_component_pairs:
                    state = "nonzero"
                else:
                    state = "unknown"
                entries.append((point, state))
            is_full = all(state != "unknown" for _, state in entries)
            circles.append(
                CirclePattern(
                    label=f"C[{center_name};{min(component)}]",
                    center=center,
                    entries=tuple(entries),
                    full_relative_to_columns=is_full,
                    zero_count=len(component),
                    provenance=(
                        "required-row equality component; false comparisons "
                        "supply named-universe nonmembership"
                    ),
                )
            )
            emitted += 1
            full += int(is_full)
        center_summaries[center_name] = {
            "row_atoms": len(rows),
            "radius_classes_size_ge_4": emitted,
            "full_relative_to_18_quotient_columns": full,
        }
    return circles, {
        "quotient_column_count": len(columns),
        "center_summaries": center_summaries,
    }


def load_jsonl(path: Path) -> list[dict[str, object]]:
    records: list[dict[str, object]] = []
    for line in path.read_text().splitlines():
        if line.strip():
            value = json.loads(line)
            if not isinstance(value, dict):
                raise ValueError(f"non-object JSONL record in {path}")
            records.append(value)
    return records


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--root", type=Path, default=Path.cwd())
    parser.add_argument("--out", type=Path, required=True)
    args = parser.parse_args()
    root = args.root.resolve()

    phase3_paths = [
        root
        / "scratch/p97-distinct-distance-lane/"
        "phase3_old_source_dedup_snapshot_20260729/"
        "survivors-deduplicated-current-source.jsonl",
        root
        / "scratch/p97-distinct-distance-lane/"
        "phase3_structural_cegar_projected_sequential_global_v2_20260729/"
        "survivors.jsonl",
        root
        / "scratch/p97-distinct-distance-lane/"
        "paused_projected_current_source_survivors_162_20260729/"
        "survivors.jsonl",
    ]
    phase3_seen: set[str] = set()
    phase3_hits: list[dict[str, object]] = []
    phase3_diff_hits: list[dict[str, object]] = []
    phase3_files: list[dict[str, object]] = []
    exact_flags: dict[str, int] = {}
    for path in phase3_paths:
        records = load_jsonl(path)
        fresh = 0
        for record in records:
            rows = record["metric_rows"]
            key = str(record.get("metric_rows_sha256") or canonical_rows_sha(rows))
            if key in phase3_seen:
                continue
            phase3_seen.add(key)
            fresh += 1
            circles = phase3_circles(record)
            for circle in circles:
                exact_flags[circle.provenance] = (
                    exact_flags.get(circle.provenance, 0) + 1
                )
            for hit in diagonal_minor_hits(circles, 5):
                hit["metric_rows_sha256"] = key
                hit["source"] = str(path.relative_to(root))
                phase3_hits.append(hit)
            for hit in difference_hits(circles):
                hit["metric_rows_sha256"] = key
                hit["source"] = str(path.relative_to(root))
                phase3_diff_hits.append(hit)
        phase3_files.append(
            {
                "path": str(path.relative_to(root)),
                "record_count": len(records),
                "new_unique_metric_skeletons": fresh,
                "sha256": sha256_bytes(path.read_bytes()),
            }
        )

    aligned_path = (
        root
        / "scratch/atail-force/aligned-singleton-second-nonbisector-induced/"
        "cegar-v17-local-critical-reuse-second.json"
    )
    aligned_document = json.loads(aligned_path.read_text())
    aligned_patterns, aligned_meta = aligned_circles(aligned_document)
    aligned_hits = diagonal_minor_hits(aligned_patterns, 5)
    aligned_diff_hits = difference_hits(aligned_patterns)

    output = {
        "schema": "p97-power-pattern-audit-v1",
        "soundness_policy": {
            "zero": "proved circle membership / equal-distance atom",
            "nonzero": (
                "positive-radius own center, exact off-support entry, or "
                "recorded false equal-distance atom"
            ),
            "unknown": "never used to kill or support a determinant term",
            "search_scope": (
                "exhaustive center-diagonal 5x5 minors and corresponding "
                "center-diagonal 4x4 row-difference minors"
            ),
        },
        "phase3": {
            "files": phase3_files,
            "unique_metric_skeleton_count": len(phase3_seen),
            "circle_provenance_counts": exact_flags,
            "minor_5x5_hit_count": len(phase3_hits),
            "minor_5x5_hits": phase3_hits,
            "row_difference_4x4_hit_count": len(phase3_diff_hits),
            "row_difference_4x4_hits": phase3_diff_hits,
        },
        "aligned_v17": {
            "path": str(aligned_path.relative_to(root)),
            "sha256": sha256_bytes(aligned_path.read_bytes()),
            "candidate_circle_count": len(aligned_patterns),
            "full_relative_to_recorded_columns_count": sum(
                circle.full_relative_to_columns for circle in aligned_patterns
            ),
            "circle_summaries": [
                {
                    "label": circle.label,
                    "center": circle.center,
                    "zero_count": circle.zero_count,
                    "full_relative_to_columns": circle.full_relative_to_columns,
                }
                for circle in aligned_patterns
            ],
            **aligned_meta,
            "minor_5x5_hit_count": len(aligned_hits),
            "minor_5x5_hits": aligned_hits,
            "row_difference_4x4_hit_count": len(aligned_diff_hits),
            "row_difference_4x4_hits": aligned_diff_hits,
        },
    }
    args.out.parent.mkdir(parents=True, exist_ok=True)
    args.out.write_text(json.dumps(output, indent=2, sort_keys=True) + "\n")
    print(
        json.dumps(
            {
                "out": str(args.out),
                "phase3_unique": len(phase3_seen),
                "phase3_5x5_hits": len(phase3_hits),
                "phase3_diff_hits": len(phase3_diff_hits),
                "aligned_circles": len(aligned_patterns),
                "aligned_full": sum(
                    circle.full_relative_to_columns
                    for circle in aligned_patterns
                ),
                "aligned_5x5_hits": len(aligned_hits),
                "aligned_diff_hits": len(aligned_diff_hits),
            },
            sort_keys=True,
        )
    )


if __name__ == "__main__":
    main()
