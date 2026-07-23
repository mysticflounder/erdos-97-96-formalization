#!/usr/bin/env python3
"""Build the immutable three-consumer row-instance seed bank."""

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
BASE_BANK = (
    HERE.parent
    / "unique4-source-field-audit"
    / "kalmanson_row_instance_schemas.json"
)
OCCURRENCE_DIR = HERE.parent / "unique4-kalmanson-occurrence"
GENERIC_SCHEMA = OCCURRENCE_DIR / "six_role_k2_triangle_schema.json"
OCCURRENCE_REPLAY = OCCURRENCE_DIR / "replay.json"
P5_ASSIGNMENT = HERE / "direct_owncap_endpoint_p5.json"
DEFAULT_OUTPUT = HERE / "kalmanson_row_instance_schemas_seeded_v2.json"


def load_module(name: str, path: Path) -> Any:
    spec = importlib.util.spec_from_file_location(name, path)
    if spec is None or spec.loader is None:
        raise RuntimeError(path)
    module = importlib.util.module_from_spec(spec)
    sys.modules[name] = module
    spec.loader.exec_module(module)
    return module


DRIVER = load_module("unique4_seeded_v2_driver", DRIVER_PATH)


def load(path: Path) -> Any:
    return json.loads(path.read_text(encoding="utf-8"))


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def rel(path: Path) -> str:
    return str(path.resolve().relative_to(ROOT))


def build_payload() -> dict[str, Any]:
    base = load(BASE_BANK)
    schema = load(GENERIC_SCHEMA)
    replay = load(OCCURRENCE_REPLAY)
    if base.get("schema") != "p97-kalmanson-row-instance-schema-bank-v1":
        raise ValueError("unexpected base-bank schema")
    if base.get("epistemic_status") != (
        "KERNEL_CHECKED_CONSUMERS_FOR_TWO_FIXED_CORRECTED_SURVIVORS"
    ):
        raise ValueError("base bank is not kernel-checked")
    if schema.get("schema") != "p97-kalmanson-row-instance-schema-v1":
        raise ValueError("unexpected occurrence-schema format")
    if schema.get("epistemic_status") != (
        "KERNEL_CHECKED_GENERIC_CONSUMER; FIXED_N11_OCCURRENCE_ONLY"
    ):
        raise ValueError("occurrence schema is not kernel-checked")
    replay_status = replay.get("epistemic_status", "")
    if not replay_status.startswith(
        "EXACT_STORED_REFINEMENT_OCCURRENCE_REPLAY_PLUS_KERNEL_CHECKED_GENERIC_CONSUMER"
    ):
        raise ValueError("occurrence replay has the wrong epistemic status")
    schema_rel = rel(GENERIC_SCHEMA)
    if replay.get("source_hashes", {}).get(schema_rel) != sha256(GENERIC_SCHEMA):
        raise ValueError("occurrence replay is not bound to the current schema")
    if replay.get("lean_consumer") != schema.get("lean_consumer"):
        raise ValueError("schema/replay Lean consumer mismatch")

    occurrences = schema.get("source_occurrences")
    if not isinstance(occurrences, list) or len(occurrences) < 2:
        raise ValueError("expected both p5 source occurrences")
    replay_ids = {
        occurrence["id"] for occurrence in replay.get("normalized_occurrences", [])
    }
    occurrence_ids = {occurrence.get("id") for occurrence in occurrences}
    if replay_ids != occurrence_ids:
        raise ValueError("schema/replay occurrence ids disagree")
    first = occurrences[0]
    source_vertices = first.get("source_vertices_by_role")
    if not isinstance(source_vertices, list):
        raise ValueError("first occurrence has no role embedding")
    legacy_schema = sorted(
        [row["center_role"], member]
        for row in schema["row_instances"]
        for member in row["member_roles"]
    )
    extension_record = {
        "id": schema["id"],
        "profile": 5,
        "core_vertex_count": schema["core_vertex_count"],
        "source_artifact": rel(P5_ASSIGNMENT),
        "source_artifact_sha256": sha256(P5_ASSIGNMENT),
        "source_vertices_by_role": source_vertices,
        "row_instances": schema["row_instances"],
        "strict_inequalities": schema["strict_inequalities"],
        "legacy_center_point_schema": legacy_schema,
        "source_occurrences": occurrences,
        "generic_schema": {
            "path": schema_rel,
            "sha256": sha256(GENERIC_SCHEMA),
        },
        "occurrence_replay": {
            "path": rel(OCCURRENCE_REPLAY),
            "sha256": sha256(OCCURRENCE_REPLAY),
        },
        "legacy_bank_match": (
            "NO_EXISTING_46_SCHEMA_SUBSUMES_THE_SIX_ROLE_TRIANGLE"
        ),
        "lean_consumer": schema["lean_consumer"],
    }
    # This is the same fail-closed check used immediately before the driver
    # translates a record to Boolean literals.
    DRIVER.validate_seed_record(extension_record)

    records = [*base["records"], extension_record]
    ids = [record["id"] for record in records]
    if len(set(ids)) != len(ids):
        raise ValueError("combined seed ids are not unique")
    return {
        "schema": "p97-kalmanson-row-instance-schema-bank-v1",
        "epistemic_status": (
            "KERNEL_CHECKED_CONSUMERS_FOR_TWO_FIXED_CORRECTED_SURVIVORS"
        ),
        "scope": (
            "Three consumers are cardinality-generic; their recorded occurrences "
            "are verified only in named corrected n=11 assignments/refinements."
        ),
        "transport": (
            "order-preserving and reflected injections preserving distinct "
            "row_instance_id values"
        ),
        "warning": (
            "Do not collapse row instances by center. This combined seed contains "
            "only pairwise-distinct-center records; repeated-center schemas must be "
            "rejected by the current outer driver."
        ),
        "base_bank": {
            "path": rel(BASE_BANK),
            "sha256": sha256(BASE_BANK),
            "record_count": len(base["records"]),
        },
        "extension": {
            "generic_schema_path": schema_rel,
            "generic_schema_sha256": sha256(GENERIC_SCHEMA),
            "occurrence_replay_path": rel(OCCURRENCE_REPLAY),
            "occurrence_replay_sha256": sha256(OCCURRENCE_REPLAY),
            "source_occurrence_count": len(occurrences),
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
            raise SystemExit(f"stale or missing combined bank: {args.output}")
    else:
        args.output.write_text(rendered)
    records, metadata = DRIVER.load_seed_bank(args.output.resolve())
    if len(records) != 3:
        raise AssertionError("combined bank did not load three records")
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
