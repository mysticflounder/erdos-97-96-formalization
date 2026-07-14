#!/usr/bin/env python3
"""Minimize and compare the four five-row UNIT cores over ``QQ``.

The source cores are fixed-cardinality, fixed-placement finite-shadow artifacts.
This script expands each four-point equal-radius row to all six pairwise
distance equalities, uses exact Singular computations to greedily remove
generators under several deterministic orders, and cross-checks every retained
best subsystem with msolve in both variable orders.  It also scans the three
required general-n theorem registries using the narrow simple-metric parser.

Nothing here proves that a live K-A-PAIR instance produces one of these cores.
The output is theorem-discovery evidence only.
"""

from __future__ import annotations

import argparse
from concurrent.futures import ThreadPoolExecutor, as_completed
import hashlib
import itertools
import json
import random
import sys
from pathlib import Path
from typing import Any, Mapping, Sequence

import sympy as sp


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
ORACLE_DIR = HERE.parent / "second_center_metric_oracle"
CEGAR_DIR = HERE.parent / "second_center_metric_cegar"
BANK_MATCH_DIR = HERE.parent / "row-core-bank-match"
for path in (HERE, ORACLE_DIR, CEGAR_DIR, BANK_MATCH_DIR, ROOT):
    if str(path) in sys.path:
        sys.path.remove(str(path))
for path in reversed((HERE, ORACLE_DIR, CEGAR_DIR, BANK_MATCH_DIR, ROOT)):
    sys.path.insert(0, str(path))

import oracle  # noqa: E402
import analyze_cores  # noqa: E402
import bank_match  # noqa: E402


SOURCE = HERE / "multi_order_unit_core_clusters.json"
DEFAULT_OUTPUT = HERE / "five_row_unit_core_analysis.json"
REGISTRIES = (
    ROOT / "certificates/p97_rvol_general_n_mining.json",
    ROOT / "certificates/erdos97_legacy_general_n_mining.json",
    ROOT / "certificates/erdos_general_theorem_p97_mining.json",
)
SCHEMA = "p97-atail-five-row-unit-core-analysis-v1"


def sha256_file(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def canonical_sha256(value: object) -> str:
    payload = json.dumps(value, sort_keys=True, separators=(",", ":")).encode()
    return hashlib.sha256(payload).hexdigest()


def verdict(result: oracle.OracleResult) -> dict[str, Any]:
    answer: dict[str, Any] = {"verdict": result.verdict}
    if result.detail is not None:
        answer["detail"] = result.detail
    return answer


def exact_crosscheck(
    variables: Sequence[str], records: Sequence[Mapping[str, object]], timeout: float
) -> dict[str, Any]:
    polynomials = tuple(str(record["polynomial"]) for record in records)
    singular = oracle.run_singular(variables, polynomials, timeout_s=timeout)
    msolve_forward = oracle.run_msolve(variables, polynomials, timeout_s=timeout)
    msolve_reverse = oracle.run_msolve(
        tuple(reversed(variables)), polynomials, timeout_s=timeout
    )
    values = (singular.verdict, msolve_forward.verdict, msolve_reverse.verdict)
    return {
        "status": (
            "CROSSCHECKED_UNIT"
            if values == ("UNIT", "UNIT", "UNIT")
            else "UNDECIDED_FAIL_CLOSED"
        ),
        "singular_qq": verdict(singular),
        "msolve_qq_forward_variables": verdict(msolve_forward),
        "msolve_qq_reverse_variables": verdict(msolve_reverse),
    }


def smoke_gates(timeout: float) -> dict[str, Any]:
    variables = ("x",)
    unit_records = ({"polynomial": "x"}, {"polynomial": "x-1"})
    nonunit_records = ({"polynomial": "x"},)
    unit = exact_crosscheck(variables, unit_records, timeout)
    nonunit = exact_crosscheck(variables, nonunit_records, timeout)
    if unit["status"] != "CROSSCHECKED_UNIT":
        raise RuntimeError("known UNIT smoke gate failed")
    nonunit_verdicts = (
        nonunit["singular_qq"]["verdict"],
        nonunit["msolve_qq_forward_variables"]["verdict"],
        nonunit["msolve_qq_reverse_variables"]["verdict"],
    )
    if nonunit_verdicts != ("NONUNIT", "NONUNIT", "NONUNIT"):
        raise RuntimeError("known NONUNIT smoke gate failed")
    return {"known_unit": unit, "known_nonunit": nonunit}


def active_labels(rows: Sequence[Mapping[str, object]]) -> tuple[int, ...]:
    return tuple(sorted(
        {int(row["center"]) for row in rows}
        | {
            int(point)
            for row in rows
            for point in row["support"]
        }
    ))


def equality_records(
    rows: Sequence[Mapping[str, object]],
) -> tuple[tuple[str, ...], tuple[dict[str, Any], ...], dict[int, int]]:
    labels = active_labels(rows)
    if labels[:2] != (0, 1):
        raise AssertionError("the 0/1 normalization anchors must be active")
    relabel = {label: index for index, label in enumerate(labels)}
    n = len(labels)
    points = oracle.coordinate_symbols(n)
    variables = oracle.variable_symbols(n)
    records: list[dict[str, Any]] = []
    for row_index, row in enumerate(rows):
        center = int(row["center"])
        support = tuple(int(point) for point in row["support"])
        mapped_center = relabel[center]
        for left, right in itertools.combinations(support, 2):
            expression = sp.expand(
                oracle.squared_distance(points, mapped_center, relabel[left])
                - oracle.squared_distance(points, mapped_center, relabel[right])
            )
            polynomial = sp.Poly(expression, *variables, domain=sp.QQ)
            records.append({
                "row_index": row_index,
                "center": center,
                "left": left,
                "right": right,
                "polynomial": oracle.serialize_poly(polynomial),
            })
    return tuple(str(variable) for variable in variables), tuple(records), relabel


def public_record(record: Mapping[str, object]) -> dict[str, int]:
    return {
        "row_index": int(record["row_index"]),
        "center": int(record["center"]),
        "left": int(record["left"]),
        "right": int(record["right"]),
    }


def shrink_once(
    variables: Sequence[str],
    records: Sequence[Mapping[str, object]],
    order: Sequence[int],
    timeout: float,
) -> dict[str, Any]:
    active = set(range(len(records)))
    attempts: list[dict[str, Any]] = []
    for index in order:
        candidate_indices = tuple(sorted(active - {index}))
        polynomials = tuple(str(records[item]["polynomial"]) for item in candidate_indices)
        result = oracle.run_singular(variables, polynomials, timeout_s=timeout)
        removed = result.verdict == "UNIT"
        attempts.append({
            "index": index,
            "verdict": result.verdict,
            "removed": removed,
        })
        if removed:
            active.remove(index)
    retained = tuple(records[index] for index in sorted(active))
    return {
        "retained": retained,
        "retained_indices": sorted(active),
        "attempts": attempts,
        "timed_out": any(item["verdict"] == "TIMEOUT" for item in attempts),
    }


def row_components(records: Sequence[Mapping[str, object]]) -> tuple[oracle.MetricRow, ...]:
    by_center: dict[int, list[tuple[int, int]]] = {}
    for record in records:
        by_center.setdefault(int(record["center"]), []).append(
            (int(record["left"]), int(record["right"]))
        )
    rows: list[oracle.MetricRow] = []
    for center, edges in sorted(by_center.items()):
        parent: dict[int, int] = {}

        def find(value: int) -> int:
            parent.setdefault(value, value)
            if parent[value] != value:
                parent[value] = find(parent[value])
            return parent[value]

        def union(left: int, right: int) -> None:
            left_root = find(left)
            right_root = find(right)
            if left_root != right_root:
                parent[right_root] = left_root

        for left, right in edges:
            union(left, right)
        components: dict[int, set[int]] = {}
        for point in parent:
            components.setdefault(find(point), set()).add(point)
        for support in sorted(tuple(sorted(value)) for value in components.values()):
            if len(support) >= 2:
                rows.append(oracle.MetricRow(center, support, False))
    return tuple(rows)


def canonical_component_shape(
    records: Sequence[Mapping[str, object]], *, preserve_01: bool
) -> dict[str, Any]:
    return analyze_cores.canonical_incidence_signature(
        row_components(records), preserve_01=preserve_01
    )


def edge(left: int, right: int) -> tuple[int, int]:
    return (left, right) if left <= right else (right, left)


def theorem_registry_scan(
    cores: Sequence[Mapping[str, object]],
) -> dict[str, Any]:
    declarations: list[dict[str, object]] = []
    registry_records: list[dict[str, object]] = []
    for path in REGISTRIES:
        document = json.loads(path.read_text(encoding="utf-8"))
        selected = [
            declaration
            for declaration in document["candidate_declarations"]
            if declaration.get("category") == "metric-point-uniform"
        ]
        declarations.extend(selected)
        registry_records.append({
            "path": str(path.relative_to(ROOT)),
            "sha256": sha256_file(path),
            "metric_point_uniform": len(selected),
        })

    parsed: list[tuple[dict[str, object], dict[str, object]]] = []
    false_count = 0
    for declaration in declarations:
        statement = str(declaration["statement"])
        if ": False" not in statement:
            continue
        false_count += 1
        parsed_statement = bank_match.parse(statement)
        if parsed_statement is not None:
            parsed.append((declaration, parsed_statement))

    results: list[dict[str, Any]] = []
    for core in cores:
        rows = core["rows"]
        labels = active_labels(rows)
        closure = bank_match.UnionFind()
        for row in rows:
            center = int(row["center"])
            support = tuple(int(point) for point in row["support"])
            base = edge(center, support[0])
            for point in support[1:]:
                closure.union(base, edge(center, point))
        bank_match.LABELS = labels
        bank_match.UF = closure
        matches = []
        for declaration, parsed_statement in parsed:
            assignment = bank_match.find_assignment(parsed_statement)
            if assignment is not None:
                matches.append({
                    "fq_name": declaration["fq_name"],
                    "path": declaration["path"],
                    "line": declaration["line"],
                    "assignment": assignment,
                })
        results.append({
            "shard_index": core["shard_index"],
            "core_index": core["core_index"],
            "active_label_count": len(labels),
            "match_count": len(matches),
            "matches": matches,
        })
    return {
        "registries": registry_records,
        "metric_point_uniform": len(declarations),
        "false_statements": false_count,
        "parsed_false_statements": len(parsed),
        "skipped_false_statements": false_count - len(parsed),
        "subjects": results,
    }


def closure_for_rows(rows: Sequence[Mapping[str, object]]) -> bank_match.UnionFind:
    closure = bank_match.UnionFind()
    for row in rows:
        center = int(row["center"])
        support = tuple(int(point) for point in row["support"])
        base = edge(center, support[0])
        for point in support[1:]:
            closure.union(base, edge(center, point))
    return closure


def motif_assignment(
    equalities: Sequence[Mapping[str, object]],
    target_rows: Sequence[Mapping[str, object]],
) -> dict[str, int] | None:
    roles = sorted(
        {0, 1}
        | {int(record["center"]) for record in equalities}
        | {int(record["left"]) for record in equalities}
        | {int(record["right"]) for record in equalities}
    )
    parsed = {
        "variables": [str(role) for role in roles],
        "equalities": [
            (
                (str(record["center"]), str(record["left"])),
                (str(record["center"]), str(record["right"])),
            )
            for record in equalities
        ],
        "radius_edges": {},
        "inequalities": [("0", "1")],
        "positive_edges": [],
        "positive_radii": set(),
    }
    bank_match.LABELS = active_labels(target_rows)
    bank_match.UF = closure_for_rows(target_rows)
    return bank_match.find_assignment(parsed)


def cross_core_motif_coverage(
    results: Sequence[Mapping[str, object]],
) -> list[dict[str, Any]]:
    coverage: list[dict[str, Any]] = []
    for source in results:
        for subsystem_index, subsystem in enumerate(source.get("best_subsystems", [])):
            targets = []
            for target in results:
                assignment = motif_assignment(
                    subsystem["retained_equalities"], target["original_rows"]
                )
                targets.append({
                    "shard_index": target["shard_index"],
                    "core_index": target["core_index"],
                    "matched": assignment is not None,
                    "assignment": assignment,
                })
            coverage.append({
                "source_shard_index": source["shard_index"],
                "source_core_index": source["core_index"],
                "source_subsystem_index": subsystem_index,
                "equality_count": len(subsystem["retained_equalities"]),
                "target_match_count": sum(target["matched"] for target in targets),
                "targets": targets,
            })
    return coverage


def analyze_core(
    core: Mapping[str, object], *, trials: int, timeout: float, seed: int
) -> dict[str, Any]:
    rows = tuple(core["rows"])
    variables, records, relabel = equality_records(rows)
    initial = exact_crosscheck(variables, records, timeout)
    if initial["status"] != "CROSSCHECKED_UNIT":
        return {
            "shard_index": core["shard_index"],
            "core_index": core["core_index"],
            "status": "STOPPED_INPUT_NOT_CROSSCHECKED_UNIT",
            "initial_crosscheck": initial,
        }

    orders: list[tuple[int, ...]] = [
        tuple(range(len(records))),
        tuple(reversed(range(len(records)))),
    ]
    rng = random.Random(seed + 1009 * int(core["shard_index"]) + int(core["core_index"]))
    while len(orders) < trials:
        order = list(range(len(records)))
        rng.shuffle(order)
        orders.append(tuple(order))
    trials_output = [
        shrink_once(variables, records, order, timeout)
        for order in orders[:trials]
    ]
    best_count = min(len(result["retained"]) for result in trials_output)
    best_by_signature: dict[str, dict[str, Any]] = {}
    for order_index, result in enumerate(trials_output):
        if len(result["retained"]) != best_count:
            continue
        public = [public_record(record) for record in result["retained"]]
        signature = canonical_sha256(public)
        if signature in best_by_signature:
            continue
        crosscheck = exact_crosscheck(variables, result["retained"], timeout)
        best_by_signature[signature] = {
            "first_order_index": order_index,
            "retained_equalities": public,
            "retained_equalities_sha256": signature,
            "crosscheck": crosscheck,
            "singular_deletion_timeouts": result["timed_out"],
            "free_component_shape": canonical_component_shape(
                result["retained"], preserve_01=False
            ),
            "pinned_01_component_shape": canonical_component_shape(
                result["retained"], preserve_01=True
            ),
        }
    if any(
        record["crosscheck"]["status"] != "CROSSCHECKED_UNIT"
        for record in best_by_signature.values()
    ):
        status = "UNDECIDED_BEST_CROSSCHECK"
    else:
        status = "CROSSCHECKED_UNIT_BEST_EQUALITY_SUBSYSTEMS"
    return {
        "shard_index": core["shard_index"],
        "core_index": core["core_index"],
        "status": status,
        "active_labels": list(active_labels(rows)),
        "original_rows": list(rows),
        "original_row_sha256": canonical_sha256(rows),
        "normalization_relabeling": {str(key): value for key, value in relabel.items()},
        "initial_all_pairwise_equality_count": len(records),
        "initial_crosscheck": initial,
        "trial_count": trials,
        "trial_retained_counts": [len(result["retained"]) for result in trials_output],
        "trial_singular_timeout_count": sum(result["timed_out"] for result in trials_output),
        "best_equality_count": best_count,
        "distinct_best_subsystem_count": len(best_by_signature),
        "best_subsystems": list(best_by_signature.values()),
    }


def build_document(trials: int, workers: int, timeout: float, seed: int) -> dict[str, Any]:
    source_bytes = SOURCE.read_bytes()
    source = json.loads(source_bytes)
    cores = [core for core in source["cores"] if int(core["row_count"]) == 5]
    if len(cores) != 4:
        raise AssertionError("expected exactly four five-row cores")
    bank_scan = theorem_registry_scan(cores)
    results: list[dict[str, Any]] = []
    with ThreadPoolExecutor(max_workers=min(workers, len(cores))) as executor:
        futures = {
            executor.submit(
                analyze_core, core, trials=trials, timeout=timeout, seed=seed
            ): core
            for core in cores
        }
        for future in as_completed(futures):
            result = future.result()
            results.append(result)
            print(
                f"shard {result['shard_index']} core {result['core_index']}: "
                f"{result['status']} best={result.get('best_equality_count', '?')}",
                file=sys.stderr,
                flush=True,
            )
    results.sort(key=lambda result: (int(result["shard_index"]), int(result["core_index"])))
    free_shapes: dict[str, list[dict[str, int]]] = {}
    pinned_shapes: dict[str, list[dict[str, int]]] = {}
    for result in results:
        for subsystem_index, subsystem in enumerate(result.get("best_subsystems", [])):
            identity = {
                "shard_index": int(result["shard_index"]),
                "core_index": int(result["core_index"]),
                "subsystem_index": subsystem_index,
            }
            free = subsystem["free_component_shape"]
            pinned = subsystem["pinned_01_component_shape"]
            free_key = str(free.get("canonical_sha256", free["wl_sha256"]))
            pinned_key = str(pinned.get("canonical_sha256", pinned["wl_sha256"]))
            free_shapes.setdefault(free_key, []).append(identity)
            pinned_shapes.setdefault(pinned_key, []).append(identity)
    return {
        "schema": SCHEMA,
        "source": {
            "path": str(SOURCE.relative_to(ROOT)),
            "sha256": hashlib.sha256(source_bytes).hexdigest(),
            "schema": source["schema"],
        },
        "configuration": {
            "trials_per_core": trials,
            "workers": min(workers, len(cores)),
            "oracle_timeout_seconds": timeout,
            "seed": seed,
        },
        "smoke_gates": smoke_gates(timeout),
        "required_registry_scan": bank_scan,
        "cores": results,
        "cross_core_motif_coverage": cross_core_motif_coverage(results),
        "component_shape_clusters": {
            "free": [
                {"canonical_sha256": key, "members": members}
                for key, members in sorted(free_shapes.items())
            ],
            "pinned_01": [
                {"canonical_sha256": key, "members": members}
                for key, members in sorted(pinned_shapes.items())
            ],
        },
        "scope": {
            "trusted_exact_cas_computation": True,
            "singular_qq_deletion_oracle": True,
            "best_subsystems_crosschecked_with_msolve_two_orders": True,
            "global_minimum_equality_count_proved": False,
            "fixed_placement_finite_shadow_only": True,
            "target_faithful": False,
            "producer_proved": False,
            "lean_consumer_proved": False,
        },
    }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--trials", type=int, default=8)
    parser.add_argument("--workers", type=int, default=4)
    parser.add_argument("--timeout-seconds", type=float, default=12.0)
    parser.add_argument("--seed", type=int, default=20260714)
    parser.add_argument("--output", type=Path, default=DEFAULT_OUTPUT)
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    if args.trials < 2 or args.workers < 1 or args.timeout_seconds <= 0:
        parser.error("require trials >= 2, workers >= 1, and positive timeout")
    document = build_document(
        args.trials, args.workers, args.timeout_seconds, args.seed
    )
    rendered = json.dumps(document, indent=2, sort_keys=True) + "\n"
    if args.check:
        if args.output.read_text(encoding="utf-8") != rendered:
            raise AssertionError("five-row unit-core analysis checkpoint drift")
    else:
        temporary = args.output.with_suffix(args.output.suffix + ".tmp")
        temporary.write_text(rendered, encoding="utf-8")
        temporary.replace(args.output)
    print(json.dumps({
        "output": str(args.output),
        "sha256": sha256_file(args.output),
        "best_counts": [result.get("best_equality_count") for result in document["cores"]],
        "registry_match_counts": [
            subject["match_count"]
            for subject in document["required_registry_scan"]["subjects"]
        ],
    }, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
