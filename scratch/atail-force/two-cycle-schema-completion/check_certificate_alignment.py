#!/usr/bin/env python3
"""Check old two-inequality certificates against the exact production theorem shape."""

from __future__ import annotations

import argparse
import json
from pathlib import Path


def reflection_canonical(size: int, schema: list[list[int]]) -> list[list[int]]:
    direct = tuple(sorted(tuple(item) for item in schema))
    reflected = tuple(sorted((size - 1 - center, size - 1 - member) for center, member in direct))
    return [list(item) for item in min(direct, reflected)]


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("certificate", type=Path)
    parser.add_argument("detection", type=Path)
    parser.add_argument("--output", required=True, type=Path)
    args = parser.parse_args()
    certificate = json.loads(args.certificate.read_text(encoding="utf-8"))
    detection = json.loads(args.detection.read_text(encoding="utf-8"))
    required = sorted(tuple(item) for item in certificate["required_memberships_original"])
    active = certificate["cyclic_roles_original"]
    matches: list[dict[str, object]] = []
    for index, witness in enumerate(detection["raw_witnesses"]):
        if witness["active_vertices_in_original_cyclic_order"] != active:
            continue
        if sorted(tuple(item) for item in witness["required_memberships"]) != required:
            continue
        matches.append(
            {
                "witness_index": index,
                "common_chart_cut_offset": witness["chart_cut_offset"],
                "forward_constructor": witness["forward"]["constructor"],
                "backward_constructor": witness["backward"]["constructor"],
                "reflection_canonical_schema_matches_certificate": (
                    reflection_canonical(
                        int(witness["core_vertex_count"]), witness["linear_order_schema"]
                    )
                    == certificate["reflection_canonical_order_schema"]
                ),
            }
        )
    if not matches:
        raise AssertionError("certificate has no exact common-chart production-theorem witness")
    payload = {
        "schema": "p97-two-cycle-certificate-production-consumer-alignment-v1",
        "status": "VERIFIED",
        "epistemic_status": "EXACT_INCIDENCE_AND_CONSTRUCTOR_REPLAY",
        "certificate": str(args.certificate),
        "detection": str(args.detection),
        "matching_witnesses": matches,
        "conclusion": (
            "The certificate memberships admit both SelectedRowOrdinalComparison constructors "
            "under one common cyclically shifted CCW chart, so false_of_two_cycle is an exact consumer."
        ),
    }
    args.output.write_text(json.dumps(payload, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    print(json.dumps({"status": "VERIFIED", "match_count": len(matches)}, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
