#!/usr/bin/env python3
"""Add independently checked compact checkpoint schemas to a learned bank."""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import json
import sys
from pathlib import Path


HERE = Path(__file__).resolve().parent
ENCODER_PATH = HERE.parent / "exact6-allcenter-coverage-certificate" / "encode.py"
DEFAULT_BASE = (
    HERE.parent
    / "exact6-allcenter-capaware-gate"
    / "combined_round1_round2_minimized_schema_bank.json"
)

# Order-compression of the exact checkpoint cut
#
#   kal1(a,b,c,d)
#   row a: b,d
#   row c: a,d
#   row d: a,b
#
# whose integer vector cancellation has coefficients (+1,-1,+1,-1).
THREE_ROW_CYCLE_SCHEMA = (
    (0, 1),
    (0, 3),
    (2, 0),
    (2, 3),
    (3, 0),
    (3, 1),
)

# Existing production consumer:
#
#   FourPointTwoCircleBisectorOrderBridge.
#     false_of_three_rows_and_cyclic_subsequence
#
# For cyclically ordered a < b < c < d, the selected rows
#
#   row a: b,c
#   row b: c,d
#   row c: b,d
#
# contradict the strict Kalmanson inequality on a,b,c,d.  The piqd checkpoint
# rediscovered it with extra reference points and a telescoped kal1 chain; the
# six memberships below are the source-valid, cardinality-independent core.
CONSECUTIVE_CENTER_THREE_ROW_SCHEMA = (
    (0, 1),
    (0, 2),
    (1, 2),
    (1, 3),
    (2, 1),
    (2, 3),
)

# Round-three global short-core normalization.  The original solver certificate
# telescopes through eight boundary roles, but the exact five-constraint core
# uses only the six ordered roles below:
#
#   kal2(0,1,3,4) + kal1(0,2,4,5)
#   + row 4:(1,5) - row 2:(0,5) + row 3:(0,1) = 0.
#
# This is the row/order family consumed in production by
# `ATailCriticalFiberClosingCore.OrderedCrossRowCore.false`.
ORDERED_CROSS_ROW_SCHEMA = (
    (2, 0),
    (2, 5),
    (3, 0),
    (3, 1),
    (4, 1),
    (4, 5),
)


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def load_encoder():
    spec = importlib.util.spec_from_file_location("exact6_overlay_encoder", ENCODER_PATH)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot load {ENCODER_PATH}")
    module = importlib.util.module_from_spec(spec)
    sys.modules[spec.name] = module
    spec.loader.exec_module(module)
    return module


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--base", type=Path, default=DEFAULT_BASE)
    parser.add_argument("--checkpoint-bank", required=True, type=Path)
    parser.add_argument("--output", required=True, type=Path)
    args = parser.parse_args()

    payload = json.loads(args.base.read_text(encoding="utf-8"))
    if payload.get("schema") != "p97-exact6-allcenter-minimized-metric-schema-bank-v1":
        raise ValueError("base schema drift")
    records = list(payload["schemas"])
    existing = {
        (int(record["core_vertex_count"]), tuple(tuple(pair) for pair in record["order_schema"]))
        for record in records
    }

    encoder = load_encoder()
    _, base_compact_schemas = encoder.load_learned_schema_bank(args.base, 8)
    base_applications = set(
        encoder.transported_applications(encoder.N, base_compact_schemas)
    )
    candidates = [
        {
            "name": "four-point-three-row-kalmanson-cycle-v1",
            "key": (4, THREE_ROW_CYCLE_SCHEMA),
            "source_cut_id": "sharesFirstAtTarget-direct-cnf-cut-00001",
            "source_constraints": [
                {"name": "kal1_0_2_3_6", "multiplier": 1},
                {"name": "row_0_2_6", "multiplier": -1},
                {"name": "row_3_0_6", "multiplier": 1},
                {"name": "row_6_0_2", "multiplier": -1},
            ],
            "production_consumer": None,
        },
        {
            "name": "four-point-consecutive-center-three-row-cycle-v1",
            "key": (4, CONSECUTIVE_CENTER_THREE_ROW_SCHEMA),
            "source_cut_id": "sharesSecondAtSource-piqd-cnf-cut-00001",
            "source_constraints": [
                {"name": "kal1_0_3_4_13", "multiplier": 1},
                {"name": "kal1_0_4_5_13", "multiplier": 1},
                {"name": "kal1_0_5_6_13", "multiplier": 1},
                {"name": "row_0_3_6", "multiplier": -1},
                {"name": "row_3_6_13", "multiplier": -1},
                {"name": "row_6_1_13", "multiplier": 1},
                {"name": "row_6_1_3", "multiplier": -1},
            ],
            "production_consumer": (
                "Problem97.Census554.FourPointTwoCircleBisectorOrderBridge."
                "false_of_three_rows_and_cyclic_subsequence"
            ),
        },
        {
            "name": "six-point-ordered-cross-row-core-v1",
            "key": (6, ORDERED_CROSS_ROW_SCHEMA),
            "source_cut_id": "continuationOrder-piqd-cnf-cut-00004",
            "source_constraints": [
                {"name": "kal2_0_1_3_4", "multiplier": 1},
                {"name": "kal1_0_2_4_5", "multiplier": 1},
                {"name": "row_4_1_5", "multiplier": 1},
                {"name": "row_2_0_5", "multiplier": -1},
                {"name": "row_3_0_1", "multiplier": 1},
            ],
            "production_consumer": (
                "Problem97.ATailCriticalFiberClosingCore."
                "OrderedCrossRowCore.false"
            ),
        },
    ]
    additions = []
    for candidate in candidates:
        key = candidate["key"]
        if key in existing:
            continue
        schema_applications = set(
            encoder.transported_applications(encoder.N, [key])
        )
        addition = {
            "name": candidate["name"],
            "complete_application_count": len(schema_applications),
            "new_application_count_over_base": len(
                schema_applications - base_applications
            ),
        }
        additions.append(addition)
        records.append({
            "core_vertex_count": key[0],
            "order_schema": [list(pair) for pair in key[1]],
            "complete_application_count": len(schema_applications),
            "provenance": [{
                "checkpoint_bank": str(args.checkpoint_bank),
                "checkpoint_bank_sha256": sha256(args.checkpoint_bank),
                "source_cut_id": candidate["source_cut_id"],
                "source_constraints": candidate["source_constraints"],
                "production_consumer": candidate["production_consumer"],
                "exact_vector_cancellation": True,
                "independent_cut_replay": True,
                "generalization": (
                    "order-preserving embeddings and order reflection"
                ),
            }],
        })
        base_applications.update(schema_applications)
        existing.add(key)
    if not additions:
        raise ValueError("all candidate checkpoint schemas already exist")
    records.sort(key=lambda record: (
        int(record["core_vertex_count"]),
        tuple(tuple(pair) for pair in record["order_schema"]),
    ))
    output = dict(payload)
    output["sources"] = [
        *payload.get("sources", []),
        {"path": str(args.checkpoint_bank), "sha256": sha256(args.checkpoint_bank)},
    ]
    output["schemas"] = records
    output["unique_schema_count"] = len(records)
    output["compact_schema_count_k_le_8"] = sum(
        int(record["core_vertex_count"]) <= 8 for record in records
    )
    output["checkpoint_overlay"] = {
        "schema": "p97-exact6-compact-checkpoint-overlay-v2",
        "new_schema_count": len(additions),
        "additions": additions,
        "epistemic_status": "EXACT_CANCELLATION_SCHEMA_NOT_LIVE_LEAN_CLOSURE",
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(output, indent=2, sort_keys=True) + "\n")
    print(json.dumps({
        "status": "OVERLAY_WRITTEN",
        "output": str(args.output),
        "output_sha256": sha256(args.output),
        "base_schema_count": len(payload["schemas"]),
        "overlay_schema_count": len(records),
        "additions": additions,
    }, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
