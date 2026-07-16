#!/usr/bin/env python3
"""Cluster current multi-order cores and mine larger closure motifs."""

from __future__ import annotations

import argparse
import hashlib
import itertools
import json
import sys
from collections import Counter, defaultdict
from pathlib import Path
from typing import Any, Iterable, Mapping, Sequence


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
QUERY = HERE.parent / "second_center_query"
MULTI = HERE / "checkpoint.json"
SOURCE = QUERY / "formalized_core_shards_after_current_bank_checkpoint.json"
ROLE_AUDIT = HERE.parent / "current-bank-u1-match/role_audit_checkpoint.json"
COMPLETION = HERE / "row_extension_completion_checkpoint.json"
CYCLE_AUDIT = HERE / "cycle_support_checkpoint.json"
OUTPUT = HERE / "analysis_checkpoint.json"
PINS = {
    SOURCE: "5b661a15f4dda8a6cd143f3737457f2733d23eca056defcbcd30872f629bcc1a",
    ROLE_AUDIT: "808adbbf43a649773b4e273446d1c6fbd6dc37c53013f967365eb57a089b3713",
}

if str(QUERY) not in sys.path:
    sys.path.insert(0, str(QUERY))

from cluster_formalized_core_shards import (  # noqa: E402
    Row,
    encode_rows,
    isomorphic,
    points,
)
from cluster_shard_equality_cores import equality_closure  # noqa: E402


Equality = tuple[int, int, int]


def digest(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def verify_inputs() -> None:
    for path, expected in PINS.items():
        actual = digest(path)
        if actual != expected:
            raise RuntimeError(
                f"pinned source drift at {path}: expected {expected}, found {actual}"
            )
    for path in (MULTI, COMPLETION, CYCLE_AUDIT):
        if not path.exists():
            raise RuntimeError(f"missing prerequisite {path}")


def decode_equalities(records: Sequence[Mapping[str, object]]) -> tuple[Equality, ...]:
    return tuple(
        sorted(
            (
                int(record["center"]),
                int(record["left"]),
                int(record["right"]),
            )
            for record in records
        )
    )


def radial_classes(equalities: Iterable[Equality]) -> tuple[Row, ...]:
    by_center: dict[int, list[tuple[int, int]]] = defaultdict(list)
    for center, left, right in equalities:
        by_center[center].append((left, right))
    rows: list[Row] = []
    for center, pairs in by_center.items():
        parent: dict[int, int] = {}

        def find(point: int) -> int:
            parent.setdefault(point, point)
            while parent[point] != point:
                parent[point] = parent[parent[point]]
                point = parent[point]
            return point

        def union(left: int, right: int) -> None:
            left_root, right_root = find(left), find(right)
            if left_root != right_root:
                parent[max(left_root, right_root)] = min(left_root, right_root)

        for left, right in pairs:
            union(left, right)
        components: dict[int, set[int]] = defaultdict(set)
        for point in parent:
            components[find(point)].add(point)
        rows.extend(
            (center, frozenset(component))
            for component in components.values()
            if len(component) >= 2
        )
    return tuple(sorted(rows))


def connected(rows: Sequence[Row]) -> bool:
    if not rows:
        return False
    reached = {0}
    changed = True
    while changed:
        changed = False
        active_points = set().union(
            *(
                {rows[index][0], *rows[index][1]}
                for index in reached
            )
        )
        for index, (center, support) in enumerate(rows):
            if index not in reached and active_points & {center, *support}:
                reached.add(index)
                changed = True
    return len(reached) == len(rows)


def invariant(rows: Sequence[Row]) -> tuple[object, ...]:
    carrier = points(rows)
    roles = sorted(
        (
            sum(center == point for center, _support in rows),
            sum(point in support for _center, support in rows),
            sum(center == point and point in support for center, support in rows),
        )
        for point in carrier
    )
    return (
        len(rows),
        tuple(sorted(len(support) for _center, support in rows)),
        tuple(roles),
    )


def cluster_rows(records: Sequence[dict[str, Any]]) -> list[dict[str, Any]]:
    buckets: dict[tuple[object, ...], list[dict[str, Any]]] = defaultdict(list)
    classes: list[dict[str, Any]] = []
    for record in records:
        rows = record["rows"]
        bucket = buckets[invariant(rows)]
        for class_record in bucket:
            if isomorphic(rows, class_record["representative"]):
                class_record["members"].append(record["member"])
                break
        else:
            class_record = {
                "representative": rows,
                "members": [record["member"]],
            }
            bucket.append(class_record)
            classes.append(class_record)
    return classes


def closure_roots(equalities: Sequence[Equality]) -> dict[int, dict[int, int]]:
    by_center: dict[int, list[tuple[int, int]]] = defaultdict(list)
    for center, left, right in equalities:
        by_center[center].append((left, right))
    answer: dict[int, dict[int, int]] = {}
    for center, pairs in by_center.items():
        parent = {point: point for point in range(12)}

        def find(point: int) -> int:
            while parent[point] != point:
                parent[point] = parent[parent[point]]
                point = parent[point]
            return point

        for left, right in pairs:
            left_root, right_root = find(left), find(right)
            if left_root != right_root:
                parent[max(left_root, right_root)] = min(left_root, right_root)
        answer[center] = {point: find(point) for point in range(12)}
    return answer


def has_equality(
    roots: Mapping[int, Mapping[int, int]], center: int, left: int, right: int
) -> bool:
    return center in roots and roots[center][left] == roots[center][right]


def hamiltonian_cycle(
    vertices: Sequence[int], edges: set[tuple[int, int]]
) -> tuple[int, ...] | None:
    ordered = tuple(sorted(vertices))
    start = ordered[0]
    for tail in itertools.permutations(point for point in ordered if point != start):
        cycle = (start,) + tail
        if all(
            (cycle[index], cycle[(index + 1) % len(cycle)]) in edges
            for index in range(len(cycle))
        ):
            return cycle
    return None


def build() -> dict[str, Any]:
    verify_inputs()
    multi = json.loads(MULTI.read_text(encoding="utf-8"))
    source = json.loads(SOURCE.read_text(encoding="utf-8"))
    roles = {
        int(case["shard_index"]): case
        for case in json.loads(ROLE_AUDIT.read_text(encoding="utf-8"))["cases"]
    }
    survivors = {
        int(case["partition"]["shard_index"]): case["survivor"]
        for case in source["cases"]
    }
    hypothesis_specs = {
        1: ("c", "a", "d"),
        2: ("c", "a", "f"),
        3: ("d", "c", "e"),
        4: ("d", "c", "f"),
        5: ("f", "a", "d"),
        6: ("f", "a", "e"),
        7: ("e", "a", "c"),
    }

    cores: list[dict[str, Any]] = []
    whole_records: list[dict[str, Any]] = []
    for case in multi["cases"]:
        shard = int(case["shard_index"])
        role_case = roles[shard]
        survivor = survivors[shard]
        role_points = {key: int(value) for key, value in role_case["roles"].items()}
        missing = tuple(int(value) for value in role_case["missing_hypotheses"])
        rows_by_center = {
            int(row["center"]): set(int(point) for point in row["support"])
            for row in survivor["distinct_metric_rows"]
        }
        allowed = {
            (source_point, center)
            for center, support in rows_by_center.items()
            for source_point in support
        }
        for core_index, core in enumerate(case["cores"]):
            equalities = decode_equalities(core["equalities"])
            radial = radial_classes(equalities)
            roots = closure_roots(equalities)
            present = []
            for hypothesis, (center_role, left_role, right_role) in hypothesis_specs.items():
                if has_equality(
                    roots,
                    role_points[center_role],
                    role_points[left_role],
                    role_points[right_role],
                ):
                    present.append(hypothesis)
            expected_present = set(range(1, 8)) - set(missing)
            target_carriers = []
            for missing_row in role_case["missing_rows"]:
                hypothesis = int(missing_row["hypothesis"])
                if hypothesis not in {4, 5}:
                    continue
                center = int(missing_row["center"])
                left = int(missing_row["left"])
                carrier = next(
                    (
                        sorted(support)
                        for row_center, support in radial
                        if row_center == center and left in support
                    ),
                    None,
                )
                target_carriers.append(
                    {
                        "hypothesis": hypothesis,
                        "center": center,
                        "left": left,
                        "right": int(missing_row["right"]),
                        "left_carrier_in_core": carrier,
                    }
                )
            centers = tuple(sorted({center for center, _support in radial}))
            cycle = hamiltonian_cycle(centers, allowed)
            identifier = {"shard_index": shard, "core_index": core_index}
            record = {
                **identifier,
                "equality_count": len(equalities),
                "radial_class_count": len(radial),
                "center_count": len(centers),
                "certified_deletion_minimal": bool(
                    core["certified_deletion_minimal"]
                ),
                "present_preferred_u1_hypotheses": present,
                "contains_all_nonmissing_preferred_u1_hypotheses": (
                    expected_present <= set(present)
                ),
                "preferred_h4_or_h5_carriers": target_carriers,
                "hamiltonian_allowed_blocker_cycle": (
                    None if cycle is None else list(cycle)
                ),
                "radial_classes": encode_rows(radial),
            }
            cores.append(record)
            whole_records.append(
                {
                    "member": identifier,
                    "rows": equality_closure(equalities),
                }
            )

    whole_classes = cluster_rows(whole_records)
    motif_output: dict[str, Any] = {}
    for size in range(2, 6):
        motif_records = []
        for core in cores:
            radial = tuple(
                (int(row["center"]), frozenset(int(x) for x in row["support"]))
                for row in core["radial_classes"]
            )
            seen: list[tuple[Row, ...]] = []
            for subset in itertools.combinations(radial, size):
                if not connected(subset):
                    continue
                if any(isomorphic(subset, previous) for previous in seen):
                    continue
                seen.append(subset)
                motif_records.append(
                    {
                        "member": {
                            "shard_index": core["shard_index"],
                            "core_index": core["core_index"],
                        },
                        "rows": subset,
                    }
                )
        classes = cluster_rows(motif_records)
        classes.sort(
            key=lambda record: (
                -len({m["shard_index"] for m in record["members"]}),
                -len(record["members"]),
                invariant(record["representative"]),
            )
        )
        motif_output[str(size)] = {
            "class_count": len(classes),
            "universal_core_class_count": sum(
                len({(m["shard_index"], m["core_index"]) for m in record["members"]})
                == len(cores)
                for record in classes
            ),
            "top_classes": [
                {
                    "core_count": len(
                        {
                            (member["shard_index"], member["core_index"])
                            for member in record["members"]
                        }
                    ),
                    "shard_count": len(
                        {member["shard_index"] for member in record["members"]}
                    ),
                    "members": record["members"],
                    "representative_radial_classes": encode_rows(
                        record["representative"]
                    ),
                    "support_sizes": sorted(
                        len(support) for _center, support in record["representative"]
                    ),
                    "point_count": len(points(record["representative"])),
                }
                for record in classes[:25]
            ],
        }

    completion = json.loads(COMPLETION.read_text(encoding="utf-8"))
    cycle_audit = json.loads(CYCLE_AUDIT.read_text(encoding="utf-8"))
    return {
        "schema": "p97-atail-current-multi-order-core-analysis-v1",
        "scope": {
            "fixed_card_12_555_finite_shadow_only": True,
            "unchanged_current_bank_survivors_only": True,
            "exact_point_relabeling_for_reported_classes": True,
            "larger_motifs_use_equality_closed_radial_classes": True,
            "producer_proved": False,
        },
        "inputs": [
            {"path": str(path.relative_to(ROOT)), "sha256": digest(path)}
            for path in (MULTI, SOURCE, ROLE_AUDIT, COMPLETION, CYCLE_AUDIT)
        ],
        "case_count": len(multi["cases"]),
        "core_count": len(cores),
        "certified_deletion_minimal_core_count": sum(
            bool(core["certified_deletion_minimal"]) for core in cores
        ),
        "exact_whole_core_isomorphism_class_count": len(whole_classes),
        "repeated_exact_whole_core_classes": [
            record["members"]
            for record in whole_classes
            if len(record["members"]) > 1
        ],
        "cores_containing_all_nonmissing_preferred_u1_hypotheses": sum(
            bool(core["contains_all_nonmissing_preferred_u1_hypotheses"])
            for core in cores
        ),
        "cores_with_preferred_extension_carrier": sum(
            any(
                target["left_carrier_in_core"] is not None
                for target in core["preferred_h4_or_h5_carriers"]
            )
            for core in cores
        ),
        "cores_with_hamiltonian_allowed_cycle": sum(
            core["hamiltonian_allowed_blocker_cycle"] is not None
            for core in cores
        ),
        "row_extension_completion_summary": {
            "case_count": completion["case_count"],
            "preferred_role_histogram": completion["preferred_role_histogram"],
            "extension_first_stage_histogram": completion[
                "extension_first_stage_histogram"
            ],
            "nominal_h5_h7_cases_closed_by_h5_alone": completion[
                "nominal_h5_h7_cases_closed_by_h5_alone"
            ],
        },
        "base_cycle_audit_summary": {
            key: cycle_audit[key]
            for key in (
                "case_count",
                "core_center_count_histogram",
                "core_confined_to_mutual_pair_count",
                "core_confined_to_directed_cycle_length_at_most_five_count",
                "cores_with_hamiltonian_allowed_cycle_count",
                "mutual_pair_two_row_status_histogram",
            )
        },
        "larger_radial_class_motifs": motif_output,
        "cores": cores,
    }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--check", action="store_true")
    parser.add_argument("--output", type=Path, default=OUTPUT)
    args = parser.parse_args()
    rendered = json.dumps(build(), indent=2, sort_keys=True) + "\n"
    if args.check:
        if not args.output.exists() or args.output.read_text(encoding="utf-8") != rendered:
            raise SystemExit(f"stale checkpoint: {args.output}")
        print(f"PASS: {args.output}")
        return 0
    temporary = args.output.with_suffix(args.output.suffix + ".tmp")
    temporary.write_text(rendered, encoding="utf-8")
    temporary.replace(args.output)
    print(f"wrote {args.output}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
