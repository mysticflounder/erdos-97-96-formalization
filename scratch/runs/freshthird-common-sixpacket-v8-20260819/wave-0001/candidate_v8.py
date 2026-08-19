"""Branch-local source-faithful six-center refinement of FreshThird v7.

This candidate preserves the authenticated v7 CNF prefix and adds only the
finite consequences of ``sixCenterDeletionSurvivalPacket_of_oneSided``.  It
does not encode ``classAt`` or claim source-totality.
"""

from __future__ import annotations

import argparse
import hashlib
import json
from itertools import combinations
from pathlib import Path

from census.p97_search import freshthird_firstnonhit_common_only_v7 as v7

SCHEMA = "p97-freshthird-common-sixpacket-v8/cnf/v1"
FAMILY = "source_six_center_deletion"
SOURCE = (
    "TwoSourceClosure.sixCenterDeletionSurvivalPacket_of_oneSided; "
    "FirstNonHitSourceTotalFiniteAssignment.hasFourAfterDeleting"
)
ORIENTATIONS = (
    ("delete_two_keep_one", "two", "one"),
    ("delete_one_keep_two", "one", "two"),
)
FIVE_CENTERS = (
    "named_blocker/second_retained_one",
    "named_blocker/first_retained_one",
    "role/first_apex",
    "role/second_apex",
    "role/surplus_apex",
)


def _sha(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def _canon(value: object) -> bytes:
    return (json.dumps(value, sort_keys=True, separators=(",", ":")) + "\n").encode()


def _exactly_one_role(role_to_id: dict[str, int], prefix: str, n: int) -> list[int]:
    return [role_to_id[f"{prefix}/{i}"] for i in range(n)]


def emit(n: int = 17) -> tuple[bytes, bytes, dict[str, object], dict[str, object]]:
    base = v7.emit_bundle(n)
    base_manifest = v7.validate_bundle(base)
    mapping = json.loads(base.variable_map)
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

    def selected(prefix: str, i: int) -> int:
        return role_to_id[f"{prefix}/{i}"]

    def center_bits(prefix: str) -> list[int]:
        return _exactly_one_role(role_to_id, prefix, n)

    source_pair_one_sided = role_to_id[
        "reduced_payload/source_pair/one_sided_deletion"
    ]
    add("six_packet/source_pair/one_sided_deletion/active", [source_pair_one_sided])

    for orientation, deleted_side, kept_side in ORIENTATIONS:
        parent = role_to_id[
            f"reduced_payload/source_pair/one_sided_deletion/orientation/{orientation}"
        ]
        deleted = center_bits(f"common_source/{deleted_side}")
        sixth = center_bits(f"common_blocker/{kept_side}")
        named = [center_bits(prefix) for prefix in FIVE_CENTERS]
        all_centers = named + [sixth]
        for center_prefix, bits in zip(FIVE_CENTERS, named, strict=True):
            for deleted_index in range(n):
                for center_index, bit in enumerate(bits):
                    add(
                        f"six_packet/{orientation}/survival/{center_prefix}/"
                        f"{deleted_index}/{center_index}",
                        [-guard, -parent, -deleted[deleted_index], -bit,
                         role_to_id[f"has4/{deleted_index}/{center_index}"]],
                    )
        for deleted_index in range(n):
            for center_index, bit in enumerate(sixth):
                add(
                    f"six_packet/{orientation}/survival/sixth/{deleted_index}/{center_index}",
                    [-guard, -parent, -deleted[deleted_index], -bit,
                     role_to_id[f"has4/{deleted_index}/{center_index}" ]],
                )
        for left, right in combinations(enumerate(all_centers), 2):
            left_index, left_bits = left
            right_index, right_bits = right
            for center_index in range(n):
                add(
                    f"six_packet/{orientation}/distinct/{left_index}/{right_index}/"
                    f"{center_index}",
                    [-guard, -parent, -left_bits[center_index],
                     -right_bits[center_index]],
                )

    rows.extend(new_rows)
    variable_count = len(mapping["variables"])
    cnf = [f"p cnf {variable_count} {len(rows)}\n"]
    cnf.extend(" ".join(str(x) for x in row["literals"]) + " 0\n" for row in rows)
    mapping["clauses"] = rows
    mapping["schema"] = f"{SCHEMA}/map/v1"
    mapping["provenance"] = {
        "v7_prefix_schema": base_manifest["schema"],
        "v7_prefix_cnf_sha256": base_manifest["cnf_sha256"],
        "source": SOURCE,
        "orientations": [x[0] for x in ORIENTATIONS],
        "five_centers": list(FIVE_CENTERS),
        "classAt_encoded": False,
        "source_total": False,
    }
    source_map = {
        "schema": f"{SCHEMA}/sources/v1",
        "family_sources": {FAMILY: SOURCE},
        "v7_sources_sha256": _sha(base.sources),
    }
    manifest = {
        "schema": f"{SCHEMA}/manifest/v1",
        "n": n,
        "source_total": False,
        "variables": variable_count,
        "clauses": len(rows),
        "v7_prefix_cnf_sha256": base_manifest["cnf_sha256"],
        "cnf_sha256": _sha("".join(cnf).encode()),
        "map_sha256": _sha(_canon(mapping)),
        "sources_sha256": _sha(_canon(source_map)),
        "new_clause_count": len(new_rows),
        "new_family": FAMILY,
        "classAt_encoded": False,
        "source_total_claim": False,
    }
    return "".join(cnf).encode(), _canon(mapping), manifest, source_map


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
