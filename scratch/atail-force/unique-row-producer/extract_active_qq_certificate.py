#!/usr/bin/env python3
"""Extract the nonzero-cofactor equality kernel from a replayed QQ certificate.

The parent certificate is independently replayed before extraction.  The
result keeps only generator positions with nonzero multipliers, reconstructs
the smaller equal-radius rows from their ``ROW_center_pivot_member`` names,
and records a hash link to the parent.  The common independent checker must be
run on the emitted certificate before it is used as a scanner cut.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import re
from collections import defaultdict
from pathlib import Path
from typing import Any

from check_unit_core_654_05_certificate import check


GENERATOR_NAME = re.compile(r"^ROW_(\d+)_(\d+)_(\d+)$")


def require(condition: bool, message: str) -> None:
    if not condition:
        raise AssertionError(message)


def sha256_bytes(value: bytes) -> str:
    return hashlib.sha256(value).hexdigest()


def sha256_stream(values: list[str]) -> str:
    return sha256_bytes("\n".join(values).encode())


def canonical_sha256(value: object) -> str:
    payload = json.dumps(value, sort_keys=True, separators=(",", ":")).encode()
    return sha256_bytes(payload)


def active_rows(generator_names: list[str]) -> list[dict[str, Any]]:
    pivots: dict[int, int] = {}
    members: dict[int, list[int]] = defaultdict(list)
    center_order: list[int] = []
    for name in generator_names:
        match = GENERATOR_NAME.fullmatch(name)
        require(match is not None, f"unexpected generator name: {name}")
        center, pivot, member = map(int, match.groups())
        require(center not in {pivot, member}, f"center occurs in support: {name}")
        require(pivot != member, f"degenerate equality generator: {name}")
        if center not in pivots:
            pivots[center] = pivot
            center_order.append(center)
        require(pivots[center] == pivot, f"multiple pivots for center {center}")
        require(member not in members[center], f"duplicate active member: {name}")
        members[center].append(member)
    require(center_order == sorted(center_order), "active centers are not sorted")
    return [
        {"center": center, "support": [pivots[center], *members[center]]}
        for center in center_order
    ]


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("source", type=Path)
    parser.add_argument("verification", type=Path)
    parser.add_argument("output", type=Path)
    parser.add_argument("--core-id", required=True)
    parser.add_argument("--target", required=True)
    args = parser.parse_args()

    require(not args.output.exists(), f"refusing to overwrite {args.output}")
    source_bytes = args.source.read_bytes()
    source: dict[str, Any] = json.loads(source_bytes)
    require(
        source.get("schema") == "p97-atail-qq-change-matrix-certificate-v1",
        "unexpected parent certificate schema",
    )

    recorded_verification = json.loads(args.verification.read_text(encoding="utf-8"))
    replayed_verification = check(args.source)
    require(
        recorded_verification == replayed_verification,
        "recorded parent verification disagrees with fresh independent replay",
    )
    require(
        replayed_verification["certificate_file_sha256"]
        == sha256_bytes(source_bytes),
        "parent certificate hash drift",
    )

    names = list(source["generator_names"])
    generators = list(source["generators"])
    multipliers = list(source["multipliers"])
    require(
        len(names) == len(generators) == len(multipliers),
        "parent certificate arity drift",
    )
    active_indices = [
        index for index, multiplier in enumerate(multipliers)
        if multiplier.strip() != "0"
    ]
    require(active_indices, "parent certificate has no active multipliers")
    require(
        len(active_indices)
        == replayed_verification["statistics"]["nonzero_multiplier_count"],
        "active multiplier count disagrees with independent verification",
    )

    active_names = [names[index] for index in active_indices]
    active_generators = [generators[index] for index in active_indices]
    active_multipliers = [multipliers[index] for index in active_indices]
    rows = active_rows(active_names)
    generator_stream_sha256 = sha256_stream(active_generators)
    multiplier_stream_sha256 = sha256_stream(active_multipliers)

    certificate = {
        **source,
        "target": args.target,
        "core_id": args.core_id,
        "core_equality_sha256": canonical_sha256(active_generators),
        "raw_change_identity_sha256": multiplier_stream_sha256,
        "normalized_change_identity_sha256": multiplier_stream_sha256,
        "generator_stream_sha256": generator_stream_sha256,
        "rows": rows,
        "generator_names": active_names,
        "generators": active_generators,
        "multipliers": active_multipliers,
        "nonzero_multiplier_count": len(active_indices),
        "provenance": {
            "kind": "nonzero-cofactor-subcertificate",
            "parent_certificate": args.source.name,
            "parent_certificate_sha256": sha256_bytes(source_bytes),
            "parent_core_id": source["core_id"],
            "parent_target": source["target"],
            "parent_generator_count": len(names),
            "retained_generator_positions_zero_based": active_indices,
        },
    }
    rendered = json.dumps(certificate, indent=2, sort_keys=True) + "\n"
    args.output.write_text(rendered, encoding="utf-8")
    print(json.dumps({
        "output": str(args.output),
        "output_sha256": sha256_bytes(rendered.encode()),
        "parent_generator_count": len(names),
        "active_generator_count": len(active_indices),
        "active_row_count": len(rows),
        "active_label_count": len({
            point
            for row in rows
            for point in (row["center"], *row["support"])
        }),
        "generator_stream_sha256": generator_stream_sha256,
        "multiplier_stream_sha256": multiplier_stream_sha256,
    }, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
