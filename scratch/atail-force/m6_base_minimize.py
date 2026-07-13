#!/usr/bin/env python3
"""Minimize either frozen order-free m=6 ATAIL UNSAT proposal."""

from __future__ import annotations

import argparse
import json

from census.atail_force import inequality_pilot as pilot
from census.atail_force import three_center_surface as surface
from order_fan_minimize import Constraint, check, minimize


DEFAULT_CLASS_ID = 2472
EXPECTED_CASES = {
    2422: {
        "class_key_sha256":
            "14059a47329cba46beba256ae503e86c46afc0abcd10099310badf8cde2e2e57",
        "full_system_input_sha256":
            "d359cd612eadd494bfe0c7c02dd93b093f1f3ac3b52588728b3948c2a3e18e93",
        "order": surface.OrderDecoration(s=(1, 1), o1=(2, 6), o2=(4, 5)),
        "minimized_names": (
            "eq_2", "eq_3", "eq_4", "eq_5", "eq_9", "eq_10",
            "eq_12", "eq_13", "gt_14", "gt_19", "gt_20", "gt_21",
        ),
    },
    2472: {
        "class_key_sha256":
            "467e2ea9c59fb15125c47ecf1411fcf375a3b3355e2f79ebdb31dc9f519d6b15",
        "full_system_input_sha256":
            "ce92441219034e278e1701c729a3a4e72e07ca5beadb32459cd2e7335e084269",
        "order": surface.OrderDecoration(s=(1, 1), o1=(2, 6), o2=(4, 4)),
        "minimized_names": (
            "eq_3", "eq_4", "eq_5", "eq_6", "eq_10", "eq_11",
            "gt_14", "gt_15",
        ),
    },
}
EXPECTED_CONSTRAINT_COUNT = 45


def _require(condition: bool, message: str) -> None:
    if not condition:
        raise RuntimeError(message)


def _load(class_id: int):
    expected = EXPECTED_CASES.get(class_id)
    _require(expected is not None, f"unsupported frozen class {class_id}")
    _report, classes = surface.load_inventory()
    joint = classes[class_id]
    _require(joint.class_id == class_id, "class-id drift")
    _require(
        joint.class_key_sha256 == expected["class_key_sha256"],
        "class-key digest drift",
    )
    order = surface.canonical_decoration(joint)
    _require(order == expected["order"], "canonical order drift")
    system = surface.build_system(joint, order)
    base_strict_count = 4 + 3 * joint.interior_point_count
    constraints = [
        *(
            Constraint(f"eq_{index}", expression, "eq")
            for index, expression in enumerate(system.eqs)
        ),
        *(
            Constraint(f"ge_{index}", expression, "ge")
            for index, expression in enumerate(system.ge)
        ),
        *(
            Constraint(f"gt_{index}", expression, "gt")
            for index, expression in enumerate(system.gt[:base_strict_count])
        ),
    ]
    _require(
        len(constraints) == EXPECTED_CONSTRAINT_COUNT,
        "base constraint-count drift",
    )
    digest = pilot._json_digest(pilot._system_payload(system))
    _require(
        digest == expected["full_system_input_sha256"],
        "full-system input digest drift",
    )
    return joint, order, system, digest, constraints


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--class-id",
        type=int,
        choices=sorted(EXPECTED_CASES),
        default=DEFAULT_CLASS_ID,
    )
    parser.add_argument("--timeout", type=float, default=1.0)
    parser.add_argument("--no-minimize", action="store_true")
    args = parser.parse_args()
    joint, order, system, digest, constraints = _load(args.class_id)
    repeated = []
    for seed in (0, 1, 2):
        verdict, elapsed, reason = check(
            system,
            constraints,
            timeout_seconds=max(5.0, args.timeout),
            seed=seed,
        )
        repeated.append(
            {
                "seed": seed,
                "verdict": verdict,
                "elapsed_seconds": elapsed,
                "reason_unknown": reason,
            }
        )
    _require(
        all(row["verdict"] == "UNSAT" for row in repeated),
        f"order-free class-{args.class_id} proposal is no longer repeatably UNSAT",
    )
    if args.no_minimize:
        core, attempts = list(constraints), []
    else:
        core, attempts = minimize(
            system,
            constraints,
            timeout_seconds=args.timeout,
        )
        _require(
            tuple(row.name for row in core)
            == EXPECTED_CASES[args.class_id]["minimized_names"],
            "minimized constraint core drift",
        )
    verdict, elapsed, reason = check(
        system,
        core,
        timeout_seconds=max(10.0, args.timeout),
    )
    _require(verdict == "UNSAT", "minimized base proposal did not replay UNSAT")
    document = {
        "schema": "p97_atail_force_m6_base_minimize.v1",
        "class_id": joint.class_id,
        "class_key_sha256": joint.class_key_sha256,
        "order": order.as_json(),
        "full_system_input_sha256": digest,
        "initial_constraint_count": len(constraints),
        "initial_replays": repeated,
        "deletion_timeout_seconds": args.timeout,
        "attempt_count": len(attempts),
        "retained_constraint_count": len(core),
        "retained_constraints": [
            {
                "name": row.name,
                "relation": row.relation,
                "expression": str(row.expression),
            }
            for row in core
        ],
        "final_replay": {
            "verdict": verdict,
            "elapsed_seconds": elapsed,
            "reason_unknown": reason,
        },
        "scope": {
            "global_order_constraints_included": False,
            "solver_proposal_only": True,
            "independent_proof_required": True,
            "selected_four_surface_only": True,
            "live_leaf_inventory_coverage_claim": False,
        },
    }
    print(json.dumps(document, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
