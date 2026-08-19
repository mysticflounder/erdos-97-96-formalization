"""Provenance refinement layered over the corrected v8 six-center query."""

from __future__ import annotations

import argparse
import hashlib
import json
from pathlib import Path

import candidate_v8 as v8

SCHEMA = "p97-freshthird-common-sixpacket-v9/cnf/v1"
FAMILY = "source_six_center_provenance"
SOURCE = (
    "TwoSourceClosure.twoCapSourcesSixCenterSourceProvenanceBoundary_of_exactRows; "
    "SixSurvivorExactRowsBoundary.collisionRows_sourceProvenance"
)
ORIENTATIONS = v8.ORIENTATIONS


def _sha(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def _canon(value: object) -> bytes:
    return (json.dumps(value, sort_keys=True, separators=(",", ":")) + "\n").encode()


def emit(n: int = 17) -> tuple[bytes, bytes, dict[str, object], dict[str, object]]:
    _, base_map_bytes, base_manifest, base_sources = v8.emit(n)
    mapping = json.loads(base_map_bytes)
    role_to_id = {row["role"]: row["id"] for row in mapping["variables"]}
    rows = list(mapping["clauses"])
    next_id = len(rows) + 1
    guard = role_to_id["hingress/common_radius_payload"]
    new_rows: list[dict[str, object]] = []

    def add(role: str, literals: list[int]) -> None:
        nonlocal next_id
        new_rows.append(
            {"family": FAMILY, "id": next_id, "literals": literals, "role": role}
        )
        next_id += 1

    def bits(prefix: str) -> list[int]:
        return [role_to_id[f"{prefix}/{i}"] for i in range(n)]

    def row(i: int, x: int) -> int:
        return role_to_id[f"row/{i}/{x}"]

    def imply_membership(parent: int, source_prefix: str, point_prefix: str) -> None:
        source_bits = bits(source_prefix)
        point_bits = bits(point_prefix)
        for i in range(n):
            for x in range(n):
                add(
                    f"provenance/contains/{source_prefix}/{point_prefix}/{i}/{x}",
                    [-guard, -parent, -source_bits[i], -point_bits[x], row(i, x)],
                )

    def imply_absent(parent: int, deleted_prefix: str, source_prefix: str) -> None:
        deleted_bits = bits(deleted_prefix)
        source_bits = bits(source_prefix)
        for d in range(n):
            for i in range(n):
                add(
                    f"provenance/deleted_absent/{source_prefix}/{d}/{i}",
                    [-guard, -parent, -deleted_bits[d], -source_bits[i], -row(i, d)],
                )

    for orientation, deleted_side, kept_side in ORIENTATIONS:
        parent = role_to_id[
            f"reduced_payload/source_pair/one_sided_deletion/orientation/{orientation}"
        ]
        imply_membership(
            parent,
            "role/second_retained_one",
            "role/second_retained_one",
        )
        imply_membership(
            parent,
            "role/second_retained_one",
            "role/second_retained_two",
        )
        for point_prefix in (
            "role/first_retained_one",
            "role/first_retained_two",
            "role/fresh_one",
            "role/fresh_two",
        ):
            imply_membership(parent, "role/first_retained_one", point_prefix)

        deleted_prefix = f"common_source/{deleted_side}"
        imply_absent(parent, deleted_prefix, "role/second_retained_one")
        imply_absent(parent, deleted_prefix, "role/first_retained_one")
        imply_absent(parent, deleted_prefix, f"common_source/{kept_side}")

        source_bits = bits(f"role/first_retained_one")
        allowed_bits = [
            bits(prefix)
            for prefix in (
                "role/first_retained_one",
                "role/first_retained_two",
                "role/fresh_one",
                "role/fresh_two",
            )
        ]
        row_bits = [row(i, x) for i in range(n) for x in range(n)]
        del row_bits
        for i in range(n):
            for x in range(n):
                add(
                    f"provenance/exact_first_fiber/{i}/{x}",
                    [-guard, -parent, -source_bits[i], -row(i, x),
                     *[role_bits[x] for role_bits in allowed_bits]],
                )

    rows.extend(new_rows)
    variable_count = len(mapping["variables"])
    cnf = [f"p cnf {variable_count} {len(rows)}\n"]
    cnf.extend(" ".join(str(x) for x in r["literals"]) + " 0\n" for r in rows)
    mapping["clauses"] = rows
    mapping["schema"] = f"{SCHEMA}/map/v1"
    mapping["provenance"] = {
        "v8_prefix_cnf_sha256": base_manifest["cnf_sha256"],
        "source": SOURCE,
        "classAt_encoded": False,
        "source_total": False,
    }
    sources = {"schema": f"{SCHEMA}/sources/v1", "family_sources": {FAMILY: SOURCE}}
    manifest = {
        "schema": f"{SCHEMA}/manifest/v1",
        "n": n,
        "source_total": False,
        "variables": variable_count,
        "clauses": len(rows),
        "v8_prefix_cnf_sha256": base_manifest["cnf_sha256"],
        "cnf_sha256": _sha("".join(cnf).encode()),
        "map_sha256": _sha(_canon(mapping)),
        "sources_sha256": _sha(_canon(sources)),
        "new_clause_count": len(new_rows),
        "new_family": FAMILY,
        "classAt_encoded": False,
        "source_total_claim": False,
    }
    return "".join(cnf).encode(), _canon(mapping), manifest, sources


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--n", type=int, default=17)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()
    args.output.mkdir(parents=True, exist_ok=True)
    cnf, mapping, manifest, sources = emit(args.n)
    (args.output / "candidate.cnf").write_bytes(cnf)
    (args.output / "candidate.map.json").write_bytes(mapping)
    (args.output / "candidate.sources.json").write_bytes(_canon(sources))
    (args.output / "candidate.manifest.json").write_bytes(_canon(manifest))
    print(json.dumps(manifest, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
