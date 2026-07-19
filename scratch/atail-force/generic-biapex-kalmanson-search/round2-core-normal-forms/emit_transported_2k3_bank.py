#!/usr/bin/env python3
"""Emit and audit transported positive-membership schemas from exact 2K+3eq cores."""

from __future__ import annotations

import argparse
import hashlib
import itertools
import json
from collections import Counter
from fractions import Fraction
from pathlib import Path

from analyze import constraint_vector, deletion_minimize, farkas_multipliers, is_unsat


Membership = tuple[int, int]
SchemaKey = tuple[int, tuple[Membership, ...]]


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def reflected_schema(k: int, schema: tuple[Membership, ...]) -> tuple[Membership, ...]:
    return tuple(sorted((k - 1 - center, k - 1 - point) for center, point in schema))


def canonical_schema(names: tuple[str, ...]) -> tuple[SchemaKey, tuple[int, ...]]:
    vertices = tuple(sorted({int(field) for name in names for field in name.split("_")[1:]}))
    role = {vertex: index for index, vertex in enumerate(vertices)}
    memberships = set()
    for name in names:
        fields = name.split("_")
        if fields[0] != "row":
            continue
        center, left, right = map(int, fields[1:])
        memberships.add((role[center], role[left]))
        memberships.add((role[center], role[right]))
    schema = tuple(sorted(memberships))
    reflected = reflected_schema(len(vertices), schema)
    return (len(vertices), min(schema, reflected)), vertices


def exact_certificate_replay(names: tuple[str, ...], rows: dict[int, set[int]]):
    inequalities = tuple(name for name in names if name.startswith("kal"))
    equalities = tuple(name for name in names if name.startswith("row"))
    if len(inequalities) != 2 or len(equalities) != 3 or len(names) != 5:
        raise AssertionError(f"not a 2K+3eq certificate: {names}")
    for name in equalities:
        _tag, center_text, left_text, right_text = name.split("_")
        center, left, right = map(int, (center_text, left_text, right_text))
        if left not in rows[center] or right not in rows[center]:
            raise AssertionError(f"row equality absent from fixed row table: {name}")
    if not is_unsat(names):
        raise AssertionError(f"certificate is LRA-SAT: {names}")
    minimized = deletion_minimize(names)
    if minimized != names:
        raise AssertionError(f"certificate is not deletion-minimal: {names} -> {minimized}")
    multipliers = farkas_multipliers(names)
    if any(multiplier != 1 for name, multiplier in multipliers.items() if name.startswith("kal")):
        raise AssertionError(f"non-unit strict multiplier: {multipliers}")
    if any(
        abs(multiplier) != 1
        for name, multiplier in multipliers.items()
        if name.startswith("row")
    ):
        raise AssertionError(f"non-unit row multiplier: {multipliers}")

    total: dict[tuple[int, int], Fraction] = Counter()
    for name, multiplier in multipliers.items():
        _kind, vector = constraint_vector(name)
        for edge, coefficient in vector.items():
            total[edge] += multiplier * coefficient
    residue = {edge: coefficient for edge, coefficient in total.items() if coefficient}
    if residue:
        raise AssertionError(f"independent rational replay has residue: {residue}")
    return multipliers


def increasing_embeds(small: SchemaKey, large: SchemaKey) -> bool:
    small_k, small_schema = small
    large_k, large_schema = large
    if small_k > large_k or len(small_schema) > len(large_schema):
        return False
    large_set = set(large_schema)
    for image in itertools.combinations(range(large_k), small_k):
        for oriented in {small_schema, reflected_schema(small_k, small_schema)}:
            transformed = {(image[center], image[point]) for center, point in oriented}
            if transformed <= large_set:
                return True
    return False


def load_existing(path: Path) -> tuple[list[SchemaKey], dict[SchemaKey, int]]:
    payload = json.loads(path.read_text(encoding="utf-8"))
    expected = "p97-whole-carrier-kalmanson-transported-schema-bank-v1"
    if payload.get("schema") != expected:
        raise ValueError("unexpected existing bank schema")
    keys = []
    indices = {}
    for index, record in enumerate(payload["schemas"]):
        k = int(record["core_vertex_count"])
        schema = tuple(sorted(tuple(item) for item in record["order_schema"]))
        canonical = min(schema, reflected_schema(k, schema))
        if schema != canonical:
            raise AssertionError(f"noncanonical existing schema {index}")
        key = (k, schema)
        if key in indices:
            raise AssertionError(f"duplicate existing schema {index}")
        indices[key] = index
        keys.append(key)
    if len(keys) != int(payload["schema_count"]):
        raise AssertionError("existing bank count mismatch")
    return keys, indices


def source_records(round3: dict, round4: dict):
    for record in round3["records"]:
        core = record["small_hash_alternate"]
        if core is None or core["shape"] != "TWO_KALMANSON_THREE_ROW":
            raise AssertionError(f"round3 record lacks 2K3 core: {record['iteration']}")
        yield "round3", record, core
    for record in round4["records"]:
        core = record["two_kalmanson_three_row"]
        if core is None or core["shape"] != "TWO_KALMANSON_THREE_ROW":
            raise AssertionError(f"round4 record lacks 2K3 core: {record['iteration']}")
        yield "round4", record, core


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--round3-artifact", type=Path, required=True)
    parser.add_argument("--round3-model-dir", type=Path, required=True)
    parser.add_argument("--round4-artifact", type=Path, required=True)
    parser.add_argument("--round4-model-dir", type=Path, required=True)
    parser.add_argument("--existing-bank", type=Path, required=True)
    parser.add_argument("--output-bank", type=Path, required=True)
    parser.add_argument("--output-audit", type=Path, required=True)
    args = parser.parse_args()

    round3 = json.loads(args.round3_artifact.read_text(encoding="utf-8"))
    round4 = json.loads(args.round4_artifact.read_text(encoding="utf-8"))
    existing, existing_indices = load_existing(args.existing_bank)
    schemas: dict[SchemaKey, dict[str, object]] = {}
    certificate_count = 0

    for lane, record, core in source_records(round3, round4):
        iteration = int(record["iteration"])
        model_dir = args.round3_model_dir if lane == "round3" else args.round4_model_dir
        suffix = "full_lra.json" if lane == "round3" else "outer.json"
        model_path = model_dir / f"iteration_{iteration:03d}.{suffix}"
        model = json.loads(model_path.read_text(encoding="utf-8"))
        rows = {int(center): set(support) for center, support in model["rows"].items()}
        names = tuple(core["constraints"])
        multipliers = exact_certificate_replay(names, rows)
        key, vertices = canonical_schema(names)
        record_out = schemas.setdefault(
            key,
            {
                "core_vertex_count": key[0],
                "order_schema": [list(item) for item in key[1]],
                "provenance": [],
            },
        )
        record_out["provenance"].append(
            {
                "kind": "FULL_ROW_2K3_EXACT",
                "lane": lane,
                "iteration": iteration,
                "source": str(model_path),
                "analysis_source": str(
                    args.round3_artifact if lane == "round3" else args.round4_artifact
                ),
                "metric_core": list(names),
                "multipliers": {
                    name: str(multiplier) for name, multiplier in multipliers.items()
                },
                "complete_core_vertices": list(vertices),
                "certificate_verified": True,
            }
        )
        certificate_count += 1

    ordered_keys = sorted(schemas)
    ordered_records = [schemas[key] for key in ordered_keys]
    bank = {
        "schema": "p97-whole-carrier-kalmanson-transported-schema-bank-v1",
        "epistemic_status": "EXACT_RATIONAL_2K3_CERTIFICATES_BOUNDED_MODEL_BANK",
        "source_count": 2,
        "sources": [
            {"path": str(args.round3_artifact), "sha256": sha256(args.round3_artifact)},
            {"path": str(args.round4_artifact), "sha256": sha256(args.round4_artifact)},
        ],
        "certificate_count": certificate_count,
        "schema_count": len(ordered_records),
        "schemas": ordered_records,
    }

    overlap = sorted(set(ordered_keys) & set(existing))
    per_schema = []
    subsumed_union = set()
    strictly_subsumed_union = set()
    for key in ordered_keys:
        subsumed = [index for index, large in enumerate(existing) if increasing_embeds(key, large)]
        strict = [index for index in subsumed if existing[index] != key]
        subsumed_union.update(subsumed)
        strictly_subsumed_union.update(strict)
        per_schema.append(
            {
                "core_vertex_count": key[0],
                "order_schema": [list(item) for item in key[1]],
                "certificate_provenance_count": len(schemas[key]["provenance"]),
                "exact_existing_overlap": key in existing_indices,
                "subsumed_existing_schema_count": len(subsumed),
                "strictly_subsumed_existing_schema_count": len(strict),
                "subsumed_existing_schema_indices": subsumed,
            }
        )

    new_subsumption_pairs = []
    for small_index, small in enumerate(ordered_keys):
        for large_index, large in enumerate(ordered_keys):
            if small_index == large_index:
                continue
            if increasing_embeds(small, large):
                new_subsumption_pairs.append((small_index, large_index))
    internally_subsumed = {large for _small, large in new_subsumption_pairs}

    audit = {
        "schema": "p97-transported-2k3-bank-audit-v1",
        "certificate_count": certificate_count,
        "all_certificates_independently_verified": certificate_count == 203,
        "unique_schema_count": len(ordered_keys),
        "existing_bank_schema_count": len(existing),
        "exact_overlap_count": len(overlap),
        "exact_overlap_existing_schema_indices": [existing_indices[key] for key in overlap],
        "new_exact_schema_count": len(ordered_keys) - len(overlap),
        "existing_schema_subsumed_union_count": len(subsumed_union),
        "existing_schema_strictly_subsumed_union_count": len(strictly_subsumed_union),
        "existing_schema_not_subsumed_count": len(existing) - len(subsumed_union),
        "internal_subsumption_pair_count": len(new_subsumption_pairs),
        "internal_minimal_schema_count": len(ordered_keys) - len(internally_subsumed),
        "per_schema": per_schema,
    }

    args.output_bank.write_text(json.dumps(bank, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    args.output_audit.write_text(
        json.dumps(audit, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
