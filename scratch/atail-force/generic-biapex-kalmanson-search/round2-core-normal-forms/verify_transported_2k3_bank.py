#!/usr/bin/env python3
"""Independent exact replay for the emitted transported 2K+3eq schema bank."""

from __future__ import annotations

import argparse
import json
from collections import Counter
from fractions import Fraction
from pathlib import Path

from analyze import constraint_vector


def reflected(k: int, schema: tuple[tuple[int, int], ...]):
    return tuple(sorted((k - 1 - center, k - 1 - point) for center, point in schema))


def schema_from_core(names: tuple[str, ...]):
    vertices = tuple(sorted({int(field) for name in names for field in name.split("_")[1:]}))
    role = {vertex: index for index, vertex in enumerate(vertices)}
    memberships = set()
    for name in names:
        fields = name.split("_")
        if fields[0] != "row":
            continue
        center, left, right = map(int, fields[1:])
        memberships.update({(role[center], role[left]), (role[center], role[right])})
    schema = tuple(sorted(memberships))
    return len(vertices), min(schema, reflected(len(vertices), schema))


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("bank", type=Path)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()

    bank = json.loads(args.bank.read_text(encoding="utf-8"))
    if bank.get("schema") != "p97-whole-carrier-kalmanson-transported-schema-bank-v1":
        raise AssertionError("unexpected bank schema")
    seen = set()
    certificate_count = 0
    source_counts = Counter()
    for schema_index, record in enumerate(bank["schemas"]):
        k = int(record["core_vertex_count"])
        schema = tuple(sorted(tuple(item) for item in record["order_schema"]))
        if schema != min(schema, reflected(k, schema)):
            raise AssertionError(f"noncanonical schema {schema_index}")
        if (k, schema) in seen:
            raise AssertionError(f"duplicate schema {schema_index}")
        seen.add((k, schema))
        for provenance in record["provenance"]:
            if provenance.get("kind") != "FULL_ROW_2K3_EXACT":
                raise AssertionError(f"unexpected provenance kind: {provenance}")
            names = tuple(provenance["metric_core"])
            if sum(name.startswith("kal") for name in names) != 2:
                raise AssertionError("certificate does not have two strict inequalities")
            if sum(name.startswith("row") for name in names) != 3:
                raise AssertionError("certificate does not have three row equalities")
            model = json.loads(Path(provenance["source"]).read_text(encoding="utf-8"))
            rows = {int(center): set(support) for center, support in model["rows"].items()}
            total = Counter()
            strict_weight = Fraction(0)
            for name in names:
                multiplier = Fraction(provenance["multipliers"][name])
                if name.startswith("kal"):
                    if multiplier <= 0:
                        raise AssertionError(f"nonpositive strict multiplier: {name}")
                    strict_weight += multiplier
                else:
                    _tag, center_text, left_text, right_text = name.split("_")
                    center, left, right = map(int, (center_text, left_text, right_text))
                    if left not in rows[center] or right not in rows[center]:
                        raise AssertionError(f"unforced row equality: {name}")
                _kind, vector = constraint_vector(name)
                for edge, coefficient in vector.items():
                    total[edge] += multiplier * coefficient
            residue = {edge: coefficient for edge, coefficient in total.items() if coefficient}
            if residue or strict_weight <= 0:
                raise AssertionError(f"invalid exact certificate: {residue}")
            if schema_from_core(names) != (k, schema):
                raise AssertionError(f"schema/core mismatch at {schema_index}")
            certificate_count += 1
            source_counts[provenance["lane"]] += 1

    if certificate_count != int(bank["certificate_count"]):
        raise AssertionError("certificate count mismatch")
    if len(seen) != int(bank["schema_count"]):
        raise AssertionError("schema count mismatch")
    output = {
        "schema": "p97-transported-2k3-bank-independent-verification-v1",
        "status": "VERIFIED_EXACT_2K3_TRANSPORTED_BANK",
        "schema_count": len(seen),
        "certificate_count": certificate_count,
        "source_certificate_counts": dict(sorted(source_counts.items())),
        "all_row_memberships_replayed": True,
        "all_rational_coefficients_cancel": True,
        "all_schemas_reconstructed_and_canonical": True,
    }
    args.output.write_text(json.dumps(output, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
