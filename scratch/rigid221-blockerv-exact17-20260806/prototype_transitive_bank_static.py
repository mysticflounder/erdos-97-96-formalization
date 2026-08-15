#!/usr/bin/env python3
"""Prototype static theorem-bank cuts for the exact-17 cap-nine CEGAR lane.

This file is intentionally isolated from the source-frozen production runner.
It performs two jobs:

* replay completed direct6 artifacts against independently reconstructed
  schema-G and ConvexFivePointCore patterns; and
* optionally add both theorem families to a fresh Z3 instance and verify that
  representative learned row systems are rejected without an arithmetic
  oracle call.

The prototype never promotes an UNSAT result to Lean.  Both cut families are
backed by existing kernel-clean Lean consumers; a production integration must
still preserve the runner's authenticated source and artifact contracts.
"""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import json
import sys
import time
from collections import Counter
from itertools import combinations
from pathlib import Path
from typing import Any, Iterable

import z3


HERE = Path(__file__).resolve().parent
REPO = HERE.parents[1]
RUNNER = HERE / "exact17_source_faithful_cegar.py"
DEFAULT_PARENT = (
    HERE
    / "source-faithful-cap9-transitive-v2"
    / "pinned-direct5-generic-two-kalmanson-cegar-o0-p0-1-s31.json"
)
DEFAULT_WAVE = (
    HERE
    / "source-faithful-cap9-transitive-v2"
    / "direct6-wave-20260808"
)
DEFAULT_OUTPUT = (
    HERE
    / "source-faithful-cap9-transitive-v2"
    / "direct6-static-bank-prototype-report.json"
)

POINTS = tuple(range(17))
DISTANCE_LABEL_BITS = 8
EXPECTED_SCHEMA = (
    "p97-rigid221-exact17-cap9-source-faithful-transitive-two-circle-v2"
)


Edge = tuple[int, int]
RowAtom = tuple[int, int]
Comparison = tuple[Edge, Edge]
SchemaGSignature = tuple[RowAtom, ...]
FivePointSignature = tuple[Comparison, ...]


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def read_json(path: Path) -> dict[str, Any]:
    payload = json.loads(path.read_text())
    if not isinstance(payload, dict):
        raise ValueError(f"expected JSON object: {path}")
    return payload


def distance_edge(left: int, right: int) -> Edge:
    if left == right:
        raise ValueError(f"distance edge has repeated endpoint {left}")
    return (left, right) if left < right else (right, left)


def canonical_comparison(first: Edge, second: Edge) -> Comparison:
    if first == second:
        raise ValueError(f"trivial distance comparison {first}")
    return (first, second) if first < second else (second, first)


def oriented_role_tuples(order: tuple[int, ...], size: int) -> set[tuple[int, ...]]:
    """All cyclic starts in both orientations for every ``size``-subset."""

    if len(order) != len(set(order)):
        raise ValueError("boundary order is not injective")
    if size < 2 or size > len(order):
        raise ValueError(f"invalid role-tuple size {size}")
    result: set[tuple[int, ...]] = set()
    for orientation in (order, tuple(reversed(order))):
        for start in range(len(orientation)):
            rotated = orientation[start:] + orientation[:start]
            for positions in combinations(range(len(rotated)), size):
                result.add(tuple(rotated[position] for position in positions))
    return result


def schema_g_signatures(order: tuple[int, ...]) -> set[SchemaGSignature]:
    """Direct selected-row hypotheses of Kalmanson schema G."""

    result = set()
    for a, b, c, d, e, f in oriented_role_tuples(order, 6):
        result.add(tuple(sorted((
            (a, b),
            (a, d),
            (b, c),
            (b, f),
            (c, b),
            (c, d),
            (e, c),
            (e, f),
        ))))
    return result


def five_point_signatures(order: tuple[int, ...]) -> set[FivePointSignature]:
    """Distance equalities consumed by ``ConvexFivePointCore``.

    The cyclic roles are ``a, x, b, c, y``.  The required equalities are

      xa = xb,  ya = yb,  cb = cx,  cb = cy.
    """

    result = set()
    for a, x, b, c, y in oriented_role_tuples(order, 5):
        result.add(tuple(sorted((
            canonical_comparison(distance_edge(x, a), distance_edge(x, b)),
            canonical_comparison(distance_edge(y, a), distance_edge(y, b)),
            canonical_comparison(distance_edge(c, b), distance_edge(c, x)),
            canonical_comparison(distance_edge(c, b), distance_edge(c, y)),
        ))))
    return result


class EdgeUnionFind:
    def __init__(self) -> None:
        self.parent: dict[Edge, Edge] = {}

    def find(self, edge: Edge) -> Edge:
        parent = self.parent.setdefault(edge, edge)
        if parent != edge:
            self.parent[edge] = self.find(parent)
        return self.parent[edge]

    def union(self, first: Edge, second: Edge) -> None:
        first_root = self.find(first)
        second_root = self.find(second)
        if first_root != second_root:
            self.parent[max(first_root, second_root)] = min(first_root, second_root)

    def equivalent(self, first: Edge, second: Edge) -> bool:
        return self.find(first) == self.find(second)


def row_atoms_and_closure(rows: list[dict[str, Any]]) -> tuple[set[RowAtom], EdgeUnionFind]:
    atoms: set[RowAtom] = set()
    closure = EdgeUnionFind()
    for row in rows:
        center = int(row["center"])
        support = tuple(int(point) for point in row["support"])
        if center in support:
            raise ValueError(f"row center {center} occurs in its support")
        incident = [distance_edge(center, point) for point in support]
        atoms.update((center, point) for point in support)
        for edge in incident[1:]:
            closure.union(incident[0], edge)
    return atoms, closure


def first_schema_g_hit(
    atoms: set[RowAtom],
    signatures: Iterable[SchemaGSignature],
) -> SchemaGSignature | None:
    for signature in signatures:
        if all(atom in atoms for atom in signature):
            return signature
    return None


def first_five_point_hit(
    closure: EdgeUnionFind,
    signatures: Iterable[FivePointSignature],
) -> FivePointSignature | None:
    for signature in signatures:
        if all(closure.equivalent(first, second) for first, second in signature):
            return signature
    return None


def row_literals(selected: Any, rows: list[dict[str, Any]]) -> list[Any]:
    return [
        selected[int(row["center"]), int(point)]
        for row in rows
        for point in row["support"]
    ]


def distance_labels() -> dict[Edge, tuple[Any, ...]]:
    return {
        edge: tuple(
            z3.Bool(f"distance_label_{edge[0]}_{edge[1]}_{bit}")
            for bit in range(DISTANCE_LABEL_BITS)
        )
        for edge in combinations(POINTS, 2)
    }


def add_schema_g_cuts(
    solver: Any,
    selected: Any,
    signatures: Iterable[SchemaGSignature],
) -> int:
    count = 0
    for signature in signatures:
        solver.add(z3.Or(*(z3.Not(selected[center, point]) for center, point in signature)))
        count += 1
    return count


def add_five_point_cuts(
    solver: Any,
    labels: dict[Edge, tuple[Any, ...]],
    signatures: Iterable[FivePointSignature],
) -> int:
    count = 0
    for signature in signatures:
        solver.add(z3.Or(*(
            left_bit != right_bit
            for first, second in signature
            for left_bit, right_bit in zip(labels[first], labels[second], strict=True)
        )))
        count += 1
    return count


def load_runner() -> Any:
    spec = importlib.util.spec_from_file_location("exact17_static_prototype_runner", RUNNER)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"could not import {RUNNER}")
    module = importlib.util.module_from_spec(spec)
    sys.modules[spec.name] = module
    spec.loader.exec_module(module)
    return module


def validate_artifact(
    path: Path,
    artifact: dict[str, Any],
    parent: dict[str, Any],
) -> tuple[int, list[dict[str, Any]], int]:
    if artifact.get("schema") != EXPECTED_SCHEMA:
        raise ValueError(f"unexpected schema in {path}: {artifact.get('schema')!r}")
    if artifact.get("order") != parent.get("order"):
        raise ValueError(f"boundary-order drift in {path}")
    parent_learned = parent.get("learned")
    learned = artifact.get("learned")
    if not isinstance(parent_learned, list) or not isinstance(learned, list):
        raise ValueError(f"malformed learned bank in {path}")
    prefix_length = len(parent_learned)
    prefix_witness_drift = 0
    for index, (old_record, new_record) in enumerate(
        zip(parent_learned, learned[:prefix_length], strict=True)
    ):
        if old_record == new_record:
            continue
        if old_record.get("kind") != new_record.get("kind"):
            raise ValueError(f"learned-prefix kind mismatch at {path}:{index}")
        if old_record.get("rows") != new_record.get("rows"):
            raise ValueError(f"learned-prefix row mismatch at {path}:{index}")
        old_payload = old_record.get("record")
        new_payload = new_record.get("record")
        if not isinstance(old_payload, dict) or not isinstance(new_payload, dict):
            raise ValueError(f"malformed learned-prefix record at {path}:{index}")
        # Resume reauthentication may choose a different valid theorem witness
        # for the same row system.  Only witness-bearing fields may change;
        # the theorem family, orientation, consumer, and source must remain
        # byte-identical.  The drift is surfaced in the report rather than
        # silently treating the prefix as exact.
        stable_old = {
            key: value
            for key, value in old_payload.items()
            if key not in {"core", "metadata"}
        }
        stable_new = {
            key: value
            for key, value in new_payload.items()
            if key not in {"core", "metadata"}
        }
        if stable_old != stable_new:
            raise ValueError(
                f"learned-prefix theorem contract mismatch at {path}:{index}"
            )
        prefix_witness_drift += 1
    suffix = learned[prefix_length:]
    if not all(isinstance(record, dict) for record in suffix):
        raise ValueError(f"non-object learned record in {path}")
    return prefix_length, suffix, prefix_witness_drift


def replay_wave(parent_path: Path, wave: Path) -> tuple[dict[str, Any], list[dict[str, Any]]]:
    parent = read_json(parent_path)
    order = tuple(int(point) for point in parent["order"])
    schema_g = schema_g_signatures(order)
    five_point = five_point_signatures(order)

    artifacts = sorted(wave.glob("*.json"))
    if not artifacts:
        raise ValueError(f"no completed JSON artifacts in {wave}")

    stage_counts: Counter[str] = Counter()
    stage_family_counts: Counter[tuple[str, str]] = Counter()
    classification_counts: Counter[str] = Counter()
    details: list[dict[str, Any]] = []
    all_records: list[dict[str, Any]] = []
    for path in artifacts:
        artifact = read_json(path)
        prefix_length, suffix, prefix_witness_drift = validate_artifact(
            path, artifact, parent
        )
        per_artifact: Counter[str] = Counter()
        for learned in suffix:
            if learned.get("kind") != "formalized-bank":
                raise ValueError(f"unexpected suffix kind in {path}: {learned.get('kind')!r}")
            record = learned.get("record")
            rows = learned.get("rows")
            if not isinstance(record, dict) or not isinstance(rows, list):
                raise ValueError(f"malformed formalized-bank record in {path}")
            stage = str(record.get("stage"))
            stage_counts[stage] += 1
            atoms, closure = row_atoms_and_closure(rows)
            g_hit = first_schema_g_hit(atoms, schema_g)
            five_hit = first_five_point_hit(closure, five_point)
            family = (
                "schema_g+five_point" if g_hit is not None and five_hit is not None
                else "schema_g" if g_hit is not None
                else "five_point" if five_hit is not None
                else "uncovered"
            )
            classification_counts[family] += 1
            stage_family_counts[(stage, family)] += 1
            per_artifact[family] += 1
            all_records.append({
                "artifact": str(path.relative_to(REPO)),
                "stage": stage,
                "rows": rows,
                "schema_g_hit": g_hit,
                "five_point_hit": five_hit,
                "family": family,
            })
        details.append({
            "path": str(path.relative_to(REPO)),
            "sha256": sha256(path),
            "terminal": artifact.get("terminal"),
            "prefix_length": prefix_length,
            "prefix_exact": prefix_witness_drift == 0,
            "prefix_witness_drift_count": prefix_witness_drift,
            "suffix_length": len(suffix),
            "classification_counts": dict(sorted(per_artifact.items())),
        })

    report = {
        "schema": "p97-exact17-direct6-static-bank-prototype-v1",
        "scope": (
            "Completed source-frozen direct6 artifact suffixes only; this is "
            "static theorem-bank coverage, not exact-17 or universal closure."
        ),
        "parent": {
            "path": str(parent_path.relative_to(REPO)),
            "sha256": sha256(parent_path),
            "learned_length": len(parent["learned"]),
            "order": list(order),
        },
        "wave": str(wave.relative_to(REPO)),
        "completed_artifact_count": len(artifacts),
        "suffix_record_count": len(all_records),
        "schema_g_signature_count": len(schema_g),
        "five_point_signature_count": len(five_point),
        "classification_counts": dict(sorted(classification_counts.items())),
        "stage_counts": dict(sorted(stage_counts.items())),
        "stage_family_counts": {
            f"{stage}::{family}": count
            for (stage, family), count in sorted(stage_family_counts.items())
        },
        "uncovered_records": [
            {
                "artifact": record["artifact"],
                "stage": record["stage"],
                "rows": record["rows"],
            }
            for record in all_records
            if record["family"] == "uncovered"
        ],
        "artifacts": details,
        "smoke": None,
    }
    return report, all_records


def smoke_static_cuts(
    report: dict[str, Any],
    records: list[dict[str, Any]],
    limit: int,
) -> dict[str, Any]:
    if limit <= 0:
        return {"status": "SKIPPED", "requested_limit": limit}

    runner = load_runner()
    order = tuple(report["parent"]["order"])
    schema_g = schema_g_signatures(order)
    five_point = five_point_signatures(order)
    started = time.monotonic()
    solver, selected, _fifth_choice, base_cut_counts = runner.build_case(
        order,
        all_static_cuts=True,
        transitive_two_circle=True,
    )
    schema_g_count = add_schema_g_cuts(solver, selected, schema_g)
    five_point_count = add_five_point_cuts(solver, distance_labels(), five_point)

    chosen: list[dict[str, Any]] = []
    seen_families: Counter[str] = Counter()
    for record in records:
        if record["family"] == "uncovered":
            continue
        family = str(record["family"])
        if seen_families[family] >= limit:
            continue
        seen_families[family] += 1
        solver.push()
        solver.add(*row_literals(selected, record["rows"]))
        verdict = str(solver.check())
        solver.pop()
        chosen.append({
            "artifact": record["artifact"],
            "stage": record["stage"],
            "family": family,
            "verdict": verdict,
        })
        if verdict != "unsat":
            raise AssertionError(f"static-cut smoke did not reject {record}: {verdict}")

    return {
        "status": "PASS",
        "requested_limit_per_family": limit,
        "base_cut_counts": list(base_cut_counts),
        "schema_g_clause_count": schema_g_count,
        "five_point_clause_count": five_point_count,
        "checked_record_count": len(chosen),
        "checks": chosen,
        "elapsed_seconds": time.monotonic() - started,
    }


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser()
    parser.add_argument("--parent", type=Path, default=DEFAULT_PARENT)
    parser.add_argument("--wave", type=Path, default=DEFAULT_WAVE)
    parser.add_argument("--output", type=Path, default=DEFAULT_OUTPUT)
    parser.add_argument(
        "--smoke-limit",
        type=int,
        default=0,
        help="Z3 smoke records per detected family; zero runs replay only",
    )
    return parser.parse_args()


def main() -> int:
    args = parse_args()
    report, records = replay_wave(args.parent.resolve(), args.wave.resolve())
    report["smoke"] = smoke_static_cuts(report, records, args.smoke_limit)
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(report, indent=2, sort_keys=True) + "\n")
    print(json.dumps({
        "output": str(args.output),
        "completed_artifacts": report["completed_artifact_count"],
        "suffix_records": report["suffix_record_count"],
        "schema_g_signatures": report["schema_g_signature_count"],
        "five_point_signatures": report["five_point_signature_count"],
        "classification_counts": report["classification_counts"],
        "smoke_status": report["smoke"]["status"],
    }, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
