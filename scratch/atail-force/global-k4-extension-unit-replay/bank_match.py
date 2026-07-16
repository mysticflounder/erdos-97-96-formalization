#!/usr/bin/env python3
"""Reproduce the existing theorem-bank match for the retained five rows."""

from __future__ import annotations

import argparse
import importlib.util
import json
import sys
from pathlib import Path

import system


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
SOURCE_ANALYZER = HERE.parent / "global-k4-extension" / "analyze.py"
DEFAULT_OUTPUT = HERE / "bank_match.json"


def load_source_analyzer():
    spec = importlib.util.spec_from_file_location(
        "p97_global_k4_extension_source", SOURCE_ANALYZER
    )
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot load {SOURCE_ANALYZER}")
    module = importlib.util.module_from_spec(spec)
    sys.modules[spec.name] = module
    spec.loader.exec_module(module)
    return module


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path, default=DEFAULT_OUTPUT)
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()

    source = load_source_analyzer()
    from census.atail_force import producer_bank

    frame, by_name, by_label = source.frame_and_labels()
    order = tuple(source.shadow.hull_order(frame))
    rows_by_center = {row.center: row for row in source.metric_rows()}
    retained = tuple(rows_by_center[center] for center, _support in system.ROWS)
    actual_rows = tuple((row.center, tuple(row.support)) for row in retained)
    if actual_rows != system.ROWS:
        raise RuntimeError("source analyzer retained-row reconstruction drift")

    matches = [
        dict(record)
        for record in producer_bank.scan_all_formalized_cores(retained, 14, order)
    ]
    bisector_matches = [
        match for match in matches
        if "four-point-two-circle-bisector-order" in str(match["stage"])
    ]
    expected_roles = {
        "forward": {"Q": 12, "U": 7, "V": 0, "Y": 8},
        "reverse": {"Q": 12, "U": 0, "V": 7, "Y": 8},
    }
    actual_roles = {
        str(match["orientation"]): match["core"] for match in bisector_matches
    }
    if actual_roles != expected_roles:
        raise RuntimeError(
            f"bisector bank match drift: expected {expected_roles}, found {actual_roles}"
        )

    reverse_roles = expected_roles["reverse"]
    q, u, y, v = (
        reverse_roles["Q"],
        reverse_roles["U"],
        reverse_roles["Y"],
        reverse_roles["V"],
    )
    required_memberships = [
        {"bridge_field": "u_mem_q", "row_center": q, "member": u},
        {"bridge_field": "y_mem_q", "row_center": q, "member": y},
        {"bridge_field": "y_mem_u", "row_center": u, "member": y},
        {"bridge_field": "v_mem_u", "row_center": u, "member": v},
        {"bridge_field": "u_mem_y", "row_center": y, "member": u},
        {"bridge_field": "v_mem_y", "row_center": y, "member": v},
    ]
    for field in required_memberships:
        if field["member"] not in rows_by_center[field["row_center"]].support:
            raise RuntimeError(f"missing required row membership {field}")

    reverse_order = tuple(reversed(order))
    start = reverse_order.index(q)
    rotated_reverse = reverse_order[start:] + reverse_order[:start]
    positions = tuple(rotated_reverse.index(label) for label in (q, u, y, v))
    if positions != tuple(sorted(positions)) or len(set((q, u, y, v))) != 4:
        raise RuntimeError("reverse cyclic subsequence Q,U,Y,V drift")

    document = {
        "schema": "p97-atail-global-k4-five-row-bank-match-v1",
        "source": system.source_record(),
        "retained_rows": [
            {
                "center": center,
                "center_name": by_label[center],
                "support": list(support),
                "support_names": [by_label[label] for label in support],
            }
            for center, support in actual_rows
        ],
        "boundary_order": list(order),
        "boundary_order_names": [by_label[label] for label in order],
        "bank_matches": bisector_matches,
        "preferred_existing_bridge": {
            "orientation": "reverse",
            "lean_consumer": (
                "Problem97.Census554.FourPointTwoCircleBisectorOrderBridge."
                "false_of_three_rows_and_cyclic_subsequence"
            ),
            "roles": {
                role: {"label": label, "name": by_label[label]}
                for role, label in reverse_roles.items()
            },
            "required_memberships": [
                {
                    **field,
                    "row_center_name": by_label[field["row_center"]],
                    "member_name": by_label[field["member"]],
                }
                for field in required_memberships
            ],
            "cyclic_subsequence": [q, u, y, v],
            "cyclic_subsequence_names": [by_label[label] for label in (q, u, y, v)],
            "cyclic_subsequence_positions_in_rotated_reverse_order": list(positions),
            "equality_closure_paths": [
                {
                    "target": "dist(I,O) = dist(I,E)",
                    "source": "I-centered row contains O and E",
                },
                {
                    "target": "dist(O,J) = dist(E,J)",
                    "source": (
                        "O-centered row gives OJ=OE; E-centered row gives EO=EJ; "
                        "transitivity and distance symmetry finish"
                    ),
                },
            ],
            "retained_rows_used": [12, 0, 8],
            "retained_rows_unused_by_this_consumer": [6, 13],
        },
        "epistemic_status": {
            "consumer": "ALREADY_KERNEL_CHECKED_IN_PRODUCTION_BANK",
            "incidence_match": "EXACT_REPLAY_OF_PINNED_CHECKPOINT",
            "live_producer_selecting_this_pattern": "OPEN",
            "nullstellensatz_replay": "REDUNDANT_FOR_CLOSURE",
        },
    }
    if args.check:
        if json.loads(args.output.read_text(encoding="utf-8")) != document:
            raise AssertionError("saved bank match drift")
    else:
        args.output.write_text(
            json.dumps(document, indent=2, sort_keys=True) + "\n", encoding="utf-8"
        )
    print(json.dumps({
        "output": str(args.output),
        "match_count": len(bisector_matches),
        "preferred_roles": document["preferred_existing_bridge"]["roles"],
        "live_producer": "OPEN",
    }, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
