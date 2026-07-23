#!/usr/bin/env python3
"""Append the reflected/re-cut six-role triangle orientation to the v2 bank."""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import json
import sys
from pathlib import Path
from typing import Any


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
DRIVER_PATH = HERE / "run_seeded_full_linear_cegar.py"
V2_BANK = HERE / "kalmanson_row_instance_schemas_seeded_v2.json"
ORIENTATION_REPLAY = HERE / "p5_v2_triangle_orientation_replay.json"
P5_ASSIGNMENT = HERE / "direct_owncap_endpoint_p5.json"
P5_V2_CHECKPOINT = HERE / "seeded_v2_full_linear_cegar_p5.json"
DEFAULT_OUTPUT = HERE / "kalmanson_row_instance_schemas_seeded_v3.json"


def load_module(name: str, path: Path) -> Any:
    spec = importlib.util.spec_from_file_location(name, path)
    if spec is None or spec.loader is None:
        raise RuntimeError(path)
    module = importlib.util.module_from_spec(spec)
    sys.modules[name] = module
    spec.loader.exec_module(module)
    return module


DRIVER = load_module("unique4_seeded_v3_driver", DRIVER_PATH)


def load(path: Path) -> Any:
    return json.loads(path.read_text(encoding="utf-8"))


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def semantic_sha256(value: Any) -> str:
    return hashlib.sha256(
        json.dumps(value, sort_keys=True, separators=(",", ":")).encode()
    ).hexdigest()


def rel(path: Path) -> str:
    return str(path.resolve().relative_to(ROOT))


def build_payload() -> dict[str, Any]:
    bank = load(V2_BANK)
    replay = load(ORIENTATION_REPLAY)
    assignment = load(P5_ASSIGNMENT)
    checkpoint = load(P5_V2_CHECKPOINT)
    if bank.get("schema") != "p97-kalmanson-row-instance-schema-bank-v1":
        raise ValueError("unexpected v2-bank schema")
    if bank.get("epistemic_status") != (
        "KERNEL_CHECKED_CONSUMERS_FOR_TWO_FIXED_CORRECTED_SURVIVORS"
    ):
        raise ValueError("v2 bank is not kernel-checked")
    if replay.get("epistemic_status") != (
        "EXACT_FIXED_REFINEMENT_TRANSPORT_TO_KERNEL_CHECKED_GENERIC_CONSUMER; "
        "NO UNIFORM SOURCE OCCURRENCE THEOREM"
    ):
        raise ValueError("orientation replay has the wrong status")
    refinement = checkpoint["refinements"][0]
    if replay["checkpoint"]["semantic_sha256"] != semantic_sha256(refinement):
        raise ValueError("orientation replay is not bound to p5-v2 attempt 1")

    source_vertices = [0, 3, 4, 5, 6, 10]
    row_instances = [
        {
            "row_instance_id": "triangle_block_reflected_row_0",
            "center_role": 0,
            "member_roles": [4, 5],
        },
        {
            "row_instance_id": "triangle_block_reflected_row_1",
            "center_role": 1,
            "member_roles": [3, 4],
        },
        {
            "row_instance_id": "triangle_block_reflected_row_2",
            "center_role": 2,
            "member_roles": [3, 5],
        },
    ]
    rows = {
        int(center): {int(point) for point in members}
        for center, members in assignment["decoded"]["rows"].items()
    }
    checked_pairs: list[list[int]] = []
    for row in row_instances:
        center = source_vertices[row["center_role"]]
        for member_role in row["member_roles"]:
            member = source_vertices[member_role]
            if member not in rows[center]:
                raise ValueError("preserved p5 assignment omits oriented occurrence")
            checked_pairs.append([center, member])

    record = {
        "id": "corrected-p5-six-role-k2-triangle-block-reflected",
        "profile": 5,
        "core_vertex_count": 6,
        "source_artifact": rel(P5_ASSIGNMENT),
        "source_artifact_sha256": sha256(P5_ASSIGNMENT),
        "source_vertices_by_role": source_vertices,
        "row_instances": row_instances,
        "strict_inequalities": [
            {"kind": "K2", "roles": [0, 1, 4, 5]},
            {"kind": "K2", "roles": [1, 2, 3, 5]},
        ],
        "legacy_center_point_schema": [
            [0, 4],
            [0, 5],
            [1, 3],
            [1, 4],
            [2, 3],
            [2, 5],
        ],
        "preserved_assignment_checked_memberships": checked_pairs,
        "transport": replay["transport"],
        "transport_replay": {
            "path": rel(ORIENTATION_REPLAY),
            "sha256": sha256(ORIENTATION_REPLAY),
            "source_refinement_semantic_sha256": replay["checkpoint"][
                "semantic_sha256"
            ],
        },
        "lean_consumer": replay["lean_consumer"],
    }
    DRIVER.validate_seed_record(record)
    records = [*bank["records"], record]
    ids = [entry["id"] for entry in records]
    if len(ids) != len(set(ids)):
        raise ValueError("v3 seed ids are not unique")
    return {
        "schema": "p97-kalmanson-row-instance-schema-bank-v1",
        "epistemic_status": (
            "KERNEL_CHECKED_CONSUMERS_FOR_TWO_FIXED_CORRECTED_SURVIVORS"
        ),
        "scope": (
            "Four consumer orientations are cardinality-generic; their recorded "
            "occurrences/transports are verified only in named corrected n=11 "
            "assignments and refinements."
        ),
        "transport": (
            "order-preserving and reflected injections preserving distinct "
            "row_instance_id values; the fourth record is separately certified "
            "as a cyclic re-cut after boundary reflection of the third consumer"
        ),
        "warning": (
            "Do not collapse row instances by center. All records here have "
            "pairwise-distinct center roles."
        ),
        "base_bank": {
            "path": rel(V2_BANK),
            "sha256": sha256(V2_BANK),
            "record_count": len(bank["records"]),
        },
        "extension": {
            "transport_replay_path": rel(ORIENTATION_REPLAY),
            "transport_replay_sha256": sha256(ORIENTATION_REPLAY),
            "source_refinement_semantic_sha256": replay["checkpoint"][
                "semantic_sha256"
            ],
            "preserved_assignment_occurrence_count": 1,
        },
        "records": records,
    }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path, default=DEFAULT_OUTPUT)
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()

    payload = build_payload()
    rendered = json.dumps(payload, indent=2, sort_keys=True) + "\n"
    if args.check:
        if not args.output.exists() or args.output.read_text() != rendered:
            raise SystemExit(f"stale or missing v3 bank: {args.output}")
    else:
        args.output.write_text(rendered)
    records, metadata = DRIVER.load_seed_bank(args.output.resolve())
    if len(records) != 4:
        raise AssertionError("v3 bank did not load four records")
    print(
        json.dumps(
            {
                "status": "VERIFIED",
                "output": str(args.output),
                "sha256": sha256(args.output),
                "record_count": metadata["record_count"],
            },
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
