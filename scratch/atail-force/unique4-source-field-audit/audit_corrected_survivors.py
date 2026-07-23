#!/usr/bin/env python3
"""Replay the source-field and normalized Kalmanson-core audit.

This checker uses only serialized finite data and exact integer arithmetic.
It does not claim that either SAT assignment is Euclidean-realizable.  Its
positive conclusion is narrower: the two assignments pass the named cap and
same-carrier-minimality projections, while their displayed selected rows
instantiate exact, kernel-checked strict-Kalmanson contradiction consumers.
"""

from __future__ import annotations

import argparse
import hashlib
import itertools
import json
from pathlib import Path
from typing import Any


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
SCHEMA_PATH = HERE / "kalmanson_row_instance_schemas.json"
LEAN_PATH = HERE / "CorrectedOwnCapKalmansonCores.lean"


def require(condition: bool, message: str) -> None:
    if not condition:
        raise AssertionError(message)


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def load(path: Path) -> dict[str, Any]:
    return json.loads(path.read_text(encoding="utf-8"))


def repo_path(text: str) -> Path:
    return ROOT / text


def reflected(k: int, schema: set[tuple[int, int]]) -> set[tuple[int, int]]:
    return {(k - 1 - center, k - 1 - point) for center, point in schema}


def schema_subsumes(
    existing_k: int,
    existing: set[tuple[int, int]],
    candidate_k: int,
    candidate: set[tuple[int, int]],
) -> bool:
    """Reproduce the legacy bank's order-preserving/reflected matcher."""

    if existing_k > candidate_k:
        return False
    for oriented in (existing, reflected(existing_k, existing)):
        for targets in itertools.combinations(range(candidate_k), existing_k):
            transported = {(targets[c], targets[p]) for c, p in oriented}
            if transported <= candidate:
                return True
    return False


class UnionFind:
    def __init__(self) -> None:
        self.parent: dict[tuple[int, int], tuple[int, int]] = {}

    def find(self, value: tuple[int, int]) -> tuple[int, int]:
        self.parent.setdefault(value, value)
        if self.parent[value] != value:
            self.parent[value] = self.find(self.parent[value])
        return self.parent[value]

    def union(self, left: tuple[int, int], right: tuple[int, int]) -> None:
        left_root = self.find(left)
        right_root = self.find(right)
        if left_root != right_root:
            self.parent[max(left_root, right_root)] = min(left_root, right_root)


def distance(left: int, right: int) -> tuple[int, int]:
    require(left != right, "zero-distance atom in schema")
    return tuple(sorted((left, right)))


def exact_strict_sum_replay(record: dict[str, Any]) -> dict[str, Any]:
    """Verify that summing the displayed inequalities gives `0 < 0`."""

    uf = UnionFind()
    for row in record["row_instances"]:
        center = int(row["center_role"])
        members = list(map(int, row["member_roles"]))
        require(members, "empty row instance")
        anchor = distance(center, members[0])
        for point in members[1:]:
            uf.union(anchor, distance(center, point))

    inequality_coefficients: list[dict[tuple[int, int], int]] = []
    for inequality in record["strict_inequalities"]:
        a, b, c, d = map(int, inequality["roles"])
        require(a < b < c < d, "Kalmanson roles are not strictly ordered")
        kind = inequality["kind"]
        if kind == "K1":
            lhs = (distance(a, b), distance(c, d))
        elif kind == "K2":
            lhs = (distance(b, c), distance(a, d))
        else:
            raise AssertionError(f"unknown Kalmanson kind: {kind}")
        rhs = (distance(a, c), distance(b, d))
        local: dict[tuple[int, int], int] = {}
        for atom in lhs:
            local[atom] = local.get(atom, 0) + 1
        for atom in rhs:
            local[atom] = local.get(atom, 0) - 1
        inequality_coefficients.append(local)

    individual_residual_sizes = []
    for local in inequality_coefficients:
        quotient: dict[tuple[int, int], int] = {}
        for atom, coefficient in local.items():
            root = uf.find(atom)
            quotient[root] = quotient.get(root, 0) + coefficient
        individual_residual_sizes.append(sum(value != 0 for value in quotient.values()))
    require(
        all(size != 0 for size in individual_residual_sizes),
        "a single Kalmanson inequality already closes the schema",
    )

    coefficients: dict[tuple[int, int], int] = {}
    for local in inequality_coefficients:
        for atom, coefficient in local.items():
            coefficients[atom] = coefficients.get(atom, 0) + coefficient

    quotient: dict[tuple[int, int], int] = {}
    for atom, coefficient in coefficients.items():
        root = uf.find(atom)
        quotient[root] = quotient.get(root, 0) + coefficient
    quotient = {atom: value for atom, value in quotient.items() if value}
    require(not quotient, "strict inequality sum does not cancel modulo row equalities")
    return {
        "status": "EXACT_INTEGER_REPLAY_SUMS_TO_ZERO_LT_ZERO",
        "strict_inequality_count": len(record["strict_inequalities"]),
        "single_inequality_closure_count": 0,
        "global_equality_kalmanson_single_inequality_consumer_applies": False,
        "residual_coefficients": {},
    }


def cap_orders(artifact: dict[str, Any]) -> dict[str, list[int]]:
    first_apex = int(artifact["first_apex"])
    second_apex = int(artifact["second_apex"])
    surplus_vertex = int(artifact["surplus_vertex"])
    n = int(artifact["n"])
    orders = {
        "surplus": list(range(first_apex, second_apex + 1)),
        "first_opposite": list(range(second_apex, surplus_vertex + 1)),
        "second_opposite": [surplus_vertex, *range(surplus_vertex + 1, n), first_apex],
    }
    for name, order in orders.items():
        require(
            set(order) == set(map(int, artifact["closed_caps"][name])),
            f"{name} physical order does not match serialized cap",
        )
    return orders


def full_radius_cap_audit(artifact: dict[str, Any]) -> dict[str, Any]:
    classes = {
        int(center): [set(map(int, radius_class)) for radius_class in partition]
        for center, partition in artifact["decoded"]["radius_classes"].items()
    }
    ledger: list[dict[str, Any]] = []
    for cap_name, order in cap_orders(artifact).items():
        position = {point: index for index, point in enumerate(order)}
        for center in order:
            for class_index, radius_class in enumerate(classes[center]):
                hits = sorted(radius_class & set(order), key=position.__getitem__)
                require(len(hits) <= 2, "complete radius class has three own-cap hits")
                if center in {order[0], order[-1]}:
                    require(len(hits) <= 1, "endpoint class has two own-cap hits")
                before = [point for point in hits if position[point] < position[center]]
                after = [point for point in hits if position[center] < position[point]]
                require(len(before) <= 1, "two equal-radius hits on one cap side")
                require(len(after) <= 1, "two equal-radius hits on one cap side")
                ledger.append(
                    {
                        "cap": cap_name,
                        "center": center,
                        "class_index": class_index,
                        "hits": hits,
                    }
                )
    return {
        "status": "PASS",
        "checked_complete_class_cap_instances": len(ledger),
        "properties": [
            "complete radius class intersects own cap in at most two points",
            "endpoint-centered complete radius class intersects cap in at most one point",
            "complete radius class has at most one hit on either side of its cap center",
        ],
    }


def same_carrier_minimality_audit(artifact: dict[str, Any]) -> dict[str, Any]:
    n = int(artifact["n"])
    classes = {
        int(center): [set(map(int, radius_class)) for radius_class in partition]
        for center, partition in artifact["decoded"]["radius_classes"].items()
    }

    def is_k4_closed(subset: set[int]) -> bool:
        return all(
            any(len(radius_class & subset) >= 4 for radius_class in classes[center])
            for center in subset
        )

    survivors = []
    for mask in range(1, (1 << n) - 1):
        subset = {point for point in range(n) if mask & (1 << point)}
        if is_k4_closed(subset):
            survivors.append(sorted(subset))
    require(not survivors, "proper K4-closed subcarrier found")
    return {
        "status": "PASS_NO_PROPER_K4_CLOSED_SUBCARRIER",
        "proper_nonempty_subsets_checked": (1 << n) - 2,
    }


def occurrence_audit(record: dict[str, Any], artifact: dict[str, Any]) -> dict[str, Any]:
    roles = list(map(int, record["source_vertices_by_role"]))
    require(roles == sorted(roles), "source role map is not order preserving")
    require(len(set(roles)) == len(roles), "source role map is not injective")
    rows = {
        int(center): set(map(int, support))
        for center, support in artifact["decoded"]["rows"].items()
    }
    row_centers = []
    for row in record["row_instances"]:
        center = roles[int(row["center_role"])]
        members = {roles[index] for index in map(int, row["member_roles"])}
        require(members <= rows[center], "row-instance occurrence failed")
        row_centers.append(center)
    require(
        len(row_centers) == len(set(row_centers)),
        "current schema unexpectedly has repeated row centers",
    )
    return {
        "status": "VERIFIED_DIRECT_ORDER_PRESERVING_OCCURRENCE",
        "source_vertices_by_role": roles,
        "row_instance_count": len(row_centers),
        "one_row_instance_per_participating_center": True,
        "repeated_center_transport": "NOT_CLAIMED_REQUIRES_EXPLICIT_ADAPTER",
    }


def legacy_bank_audit(
    record: dict[str, Any], bank: dict[str, Any]
) -> dict[str, Any]:
    candidate_k = int(record["core_vertex_count"])
    candidate = set(map(tuple, record["legacy_center_point_schema"]))
    subsuming = []
    exact = []
    pending_exact = []
    for index, old in enumerate(bank["schemas"]):
        old_k = int(old["core_vertex_count"])
        old_schema = set(map(tuple, old["order_schema"]))
        if schema_subsumes(old_k, old_schema, candidate_k, candidate):
            subsuming.append(index)
        if old_k == candidate_k and candidate in (old_schema, reflected(old_k, old_schema)):
            exact.append(index)
            if old["verification_status"] == "EXACT_FARKAS_VERIFIED_PENDING_PORT":
                pending_exact.append(index)
    require(not subsuming, "legacy Kalmanson bank already subsumes candidate")
    require(not exact, "candidate exactly duplicates a legacy schema")
    require(not pending_exact, "candidate duplicates a pending Farkas record")
    return {
        "status": "GENUINELY_NEW_RELATIVE_TO_LEGACY_46_SCHEMA_BANK",
        "legacy_schema_count_checked": len(bank["schemas"]),
        "subsuming_schema_indices": subsuming,
        "exact_schema_indices": exact,
        "pending_exact_schema_indices": pending_exact,
    }


def build_payload() -> dict[str, Any]:
    schema_bank = load(SCHEMA_PATH)
    legacy_path = repo_path(schema_bank["legacy_bank"]["path"])
    require(
        sha256(legacy_path) == schema_bank["legacy_bank"]["sha256"],
        "legacy bank hash drift",
    )
    legacy_bank = load(legacy_path)
    require(
        len(legacy_bank["schemas"]) == schema_bank["legacy_bank"]["schema_count"],
        "legacy bank count drift",
    )

    records = []
    for record in schema_bank["records"]:
        artifact_path = repo_path(record["source_artifact"])
        require(
            sha256(artifact_path) == record["source_artifact_sha256"],
            "source artifact hash drift",
        )
        artifact = load(artifact_path)
        require(int(artifact["opp1_card"]) == int(record["profile"]), "profile drift")
        records.append(
            {
                "id": record["id"],
                "profile": record["profile"],
                "source_artifact": record["source_artifact"],
                "full_radius_cap_audit": full_radius_cap_audit(artifact),
                "same_carrier_minimality_audit": same_carrier_minimality_audit(artifact),
                "occurrence_audit": occurrence_audit(record, artifact),
                "exact_strict_sum_replay": exact_strict_sum_replay(record),
                "legacy_bank_audit": legacy_bank_audit(record, legacy_bank),
                "lean_consumer": record["lean_consumer"],
            }
        )
    return {
        "schema": "p97-unique4-corrected-source-field-audit-v1",
        "epistemic_status": (
            "EXACT_FIXED_ARTIFACT_REPLAY_PLUS_KERNEL_CHECKED_GENERIC_CONSUMERS; "
            "NO_UNIFORM_OCCURRENCE_THEOREM"
        ),
        "source_hashes": {
            str(SCHEMA_PATH.relative_to(ROOT)): sha256(SCHEMA_PATH),
            str(LEAN_PATH.relative_to(ROOT)): sha256(LEAN_PATH),
            str(legacy_path.relative_to(ROOT)): sha256(legacy_path),
        },
        "records": records,
    }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", required=True, type=Path)
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    payload = build_payload()
    if args.check:
        require(args.output.exists(), "--check requires existing output")
        require(load(args.output) == payload, "stored audit checkpoint drifted")
        print("PASS: corrected survivor source-field checkpoint matches")
        return 0
    args.output.write_text(json.dumps(payload, indent=2, sort_keys=True) + "\n")
    print(json.dumps({record["id"]: "PASS" for record in payload["records"]}))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
