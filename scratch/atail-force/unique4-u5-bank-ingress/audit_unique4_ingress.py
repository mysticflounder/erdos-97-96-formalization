#!/usr/bin/env python3
"""Audit the exact-four three-row ingress against the normalized U5 bank.

The input catalog is the fail-closed translation of the 96 source-proved,
source-reachable sibling U5 class consumers into 93 signed row schemas.

This audit deliberately uses only the three rows named by the proposed
ingress:

* one exact first-apex row ``P -> {i0, i1, u, v}``; and
* one arbitrary selected four-row at each strict-cap point ``i0`` and ``i1``.

It does not treat the finite fixture below as a Euclidean configuration or as
a model of ``OriginalUniqueFourResidual``.  The fixture is only a regression
showing that row cardinality, the pairwise two-circle intersection bounds,
and the cap-intersection upper bounds do not force a bank occurrence.
"""

from __future__ import annotations

import argparse
import hashlib
import itertools
import json
from collections import Counter
from pathlib import Path
from typing import Any


EXPECTED_CONSUMERS = 96
EXPECTED_SCHEMAS = 93
TETRAHEDRON = (
    "Problem97.U5QDeletedK4Class."
    "three_exact_classes_tetrahedron_incompatibility"
)


def stable_digest(value: object) -> str:
    raw = json.dumps(value, sort_keys=True, separators=(",", ":")).encode()
    return hashlib.sha256(raw).hexdigest()


def load_catalog(path: Path) -> dict[str, Any]:
    catalog = json.loads(path.read_text(encoding="utf-8"))
    if catalog.get("class_consumer_count") != EXPECTED_CONSUMERS:
        raise RuntimeError("U5 consumer count drifted")
    if catalog.get("normalized_schema_count") != EXPECTED_SCHEMAS:
        raise RuntimeError("U5 normalized schema count drifted")
    if catalog.get("all_class_consumers_source_proved") is not True:
        raise RuntimeError("catalog contains a non-source-proved consumer")
    if catalog.get("all_class_consumers_source_reachable") is not True:
        raise RuntimeError("catalog contains an unreachable consumer")
    if catalog.get("translation_fail_closed") is not True:
        raise RuntimeError("catalog translation is not fail-closed")
    digest_payload = dict(catalog)
    recorded_digest = digest_payload.pop("catalog_digest", None)
    if stable_digest(digest_payload) != recorded_digest:
        raise RuntimeError("catalog schema digest mismatch")
    return catalog


def signed_centers(schema: dict[str, Any]) -> set[int]:
    atoms = schema["positive_memberships"] + schema["negative_memberships"]
    return {int(center) for center, _point in atoms}


def fixture() -> tuple[dict[int, set[int]], set[int], set[int]]:
    # 0 = first apex P; 1,2 = the two strict-cap interior class members.
    # 3,4 = the other two exact-class members.  The two arbitrary rows use
    # disjoint fresh supports.  13,14 stand for the physical cap endpoints.
    rows = {
        0: {1, 2, 3, 4},
        1: {5, 6, 7, 8},
        2: {9, 10, 11, 12},
    }
    exact_class = set(rows[0])
    physical_cap = {1, 2, 13, 14}
    return rows, exact_class, physical_cap


def schema_matches_fixture(schema: dict[str, Any], rows: dict[int, set[int]]) -> bool:
    centers = sorted(signed_centers(schema))
    if len(centers) > len(rows):
        return False

    role_count = int(schema["role_count"])
    positive = [tuple(map(int, atom)) for atom in schema["positive_memberships"]]
    negative = [tuple(map(int, atom)) for atom in schema["negative_memberships"]]
    universe = sorted(set(rows) | set().union(*rows.values()) | {13, 14})

    for center_images in itertools.permutations(rows, len(centers)):
        partial = dict(zip(centers, center_images, strict=True))
        remaining_roles = [role for role in range(role_count) if role not in partial]
        remaining_points = [point for point in universe if point not in partial.values()]
        for images in itertools.permutations(remaining_points, len(remaining_roles)):
            assignment = partial | dict(zip(remaining_roles, images, strict=True))
            if all(assignment[p] in rows[assignment[c]] for c, p in positive) and all(
                assignment[p] not in rows[assignment[c]] for c, p in negative
            ):
                return True
    return False


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--catalog",
        type=Path,
        default=Path(
            "scratch/atail-force/general-n-u5-schema-coverage/schema_catalog.json"
        ),
    )
    parser.add_argument("--output", required=True, type=Path)
    args = parser.parse_args()

    catalog = load_catalog(args.catalog)
    schemas = catalog["schemas"]
    center_histogram = Counter(len(signed_centers(schema)) for schema in schemas)
    three_center = [schema for schema in schemas if len(signed_centers(schema)) <= 3]
    if len(three_center) != 1:
        raise RuntimeError("expected a unique at-most-three-center schema")
    tetra = three_center[0]
    names = [consumer["fq_name"] for consumer in tetra["consumers"]]
    if names != [TETRAHEDRON]:
        raise RuntimeError(f"unexpected three-center schema: {names}")

    positive = [tuple(map(int, atom)) for atom in tetra["positive_memberships"]]
    outdegrees = Counter(center for center, _point in positive)
    # The apex row can discharge every outgoing atom of whichever schema
    # center is mapped to it.  The best choice is therefore a max-outdegree
    # center.  Every atom at the two strict-cap centers remains a genuine
    # positive-incidence producer obligation.
    minimum_positive_deficit = len(positive) - max(outdegrees.values())
    if minimum_positive_deficit != 5:
        raise RuntimeError("tetrahedron positive deficit drifted")

    rows, exact_class, physical_cap = fixture()
    pairwise_intersections = {
        f"{left},{right}": len(rows[left] & rows[right])
        for left, right in itertools.combinations(sorted(rows), 2)
    }
    cap_intersections = {
        str(center): len(support & physical_cap)
        for center, support in sorted(rows.items())
        if center in {1, 2}
    }
    if any(value > 2 for value in pairwise_intersections.values()):
        raise RuntimeError("fixture violates the two-circle row bound")
    if any(value > 2 for value in cap_intersections.values()):
        raise RuntimeError("fixture violates cap monotonicity")
    if rows[0] != exact_class or len(exact_class) != 4:
        raise RuntimeError("fixture exact class drifted")

    matches = [
        schema["consumers"][0]["fq_name"]
        for schema in schemas
        if schema_matches_fixture(schema, rows)
    ]
    if matches:
        raise RuntimeError(f"local regression unexpectedly matches bank: {matches}")

    output = {
        "schema": "unique4-u5-three-row-ingress-audit-v1",
        "status": "VERIFIED_NO_FORCED_THREE_ROW_BANK_OCCURRENCE",
        "claim_scope": (
            "The exact row, arbitrary-row cardinalities, pairwise two-circle bounds, "
            "and cap-intersection upper bounds only; not Euclidean/minimal/full-residual "
            "satisfiability."
        ),
        "input_catalog": str(args.catalog),
        "input_catalog_digest": catalog["catalog_digest"],
        "consumer_count": EXPECTED_CONSUMERS,
        "normalized_schema_count": EXPECTED_SCHEMAS,
        "signed_row_center_histogram": {
            str(key): value for key, value in sorted(center_histogram.items())
        },
        "schemas_with_at_most_three_centers": names,
        "closest_extension_stable_consumer": TETRAHEDRON,
        "closest_positive_incidence_deficit": minimum_positive_deficit,
        "closest_negative_incidence_deficit_after_local_metric_adapter": 0,
        "fixture": {
            "rows": {str(center): sorted(support) for center, support in rows.items()},
            "exact_class": sorted(exact_class),
            "physical_cap": sorted(physical_cap),
            "pairwise_row_intersection_cards": pairwise_intersections,
            "strict_center_row_cap_intersection_cards": cap_intersections,
            "bank_matches": matches,
        },
    }
    output["audit_digest"] = stable_digest(output)
    args.output.write_text(json.dumps(output, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    print(output["status"])
    print(f"consumers={EXPECTED_CONSUMERS} schemas={EXPECTED_SCHEMAS}")
    print(f"center_histogram={dict(sorted(center_histogram.items()))}")
    print(f"closest={TETRAHEDRON} positive_deficit={minimum_positive_deficit}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
