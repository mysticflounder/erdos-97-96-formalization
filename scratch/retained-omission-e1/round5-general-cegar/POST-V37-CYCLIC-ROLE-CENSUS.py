#!/usr/bin/env python3
"""Finite cyclic-role census for the post-v37 exact mixed-pair packet.

This is deliberately a role/order enumeration, not a CEGAR or metric-solver
run.  It models two distinct selected rows centered at A (first apex) and B
(branch center), whose exact common support is {J, X}; J is in the selected
adjacent cap and X is outside it.  The outside-overlap bound is consequently
met with equality one.  The banked shared-pair separation says J and X occupy
opposite open arcs from A to B.
"""

from __future__ import annotations

import hashlib
import itertools
import json
from pathlib import Path


ROOT = Path(__file__).resolve().parents[3]
AUDIT_DIR = Path(__file__).resolve().parent
ROLES = ("A", "B", "J", "X")
ROLE_NAMES = {
    "A": "first_apex",
    "B": "branch_center",
    "J": "J_inside_adjacent_cap",
    "X": "x_out_outside_adjacent_cap",
}
INPUTS = {
    "v36_pilot": AUDIT_DIR / "v36_selected_row_alternation_pilot.py",
    "v36_pairwise_result": AUDIT_DIR / "v36-pairwise-selected-row-alternation-diagnostic.json",
    "v37_pilot": AUDIT_DIR / "v37_endpoint_frontier_adjacent_singleton_pilot.py",
    "v37_result": AUDIT_DIR / "v37-adjacent-frontier-singleton-forced-producer.json",
    "phase3_separation": Path("lean/Erdos9796Proof/P97/Phase3SharedPairSeparation.lean"),
    "outside_overlap": Path("lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean"),
    "kalmanson_terminals": Path("lean/Erdos9796Proof/P97/ATail/CapCrossingKalmanson.lean"),
}
RECORDED_SHA256 = {
    # V36's markdown report records this historical source digest.  The current
    # file is intentionally checked rather than presumed identical.
    "v36_pilot": "cca1b5a0afefbaaaf981b3830903b36723a913f6ba8646060b6c64f8643513e0",
    "v36_pairwise_result": "0809c9dfb10a813cd4479ac594bac1c4c7701a1751c37d90836985cdd105531d",
    "v37_pilot": "53469c8304895efa22dcb1f1642bb8302ea75fde6489963b503f6aa39e70034f",
    "v37_result": "1daff449ec9516e6085822ce3b76621ff1d069355ee8c182213bcd6129c89c23",
}


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def opposite_open_arcs(order: tuple[str, ...]) -> bool:
    """Whether J and X are separated by the two centers in this cyclic order."""
    a, b = order.index("A"), order.index("B")
    forward = set(order[a + 1 : b]) if a < b else set(order[a + 1 :] + order[:b])
    other = set(order) - {"A", "B"} - forward
    return ("J" in forward and "X" in other) or ("X" in forward and "J" in other)


def has_consecutive_centers(order: tuple[str, ...]) -> bool:
    a, b = order.index("A"), order.index("B")
    return (a - b) % 4 in (1, 3)


def consumer_signatures(order: tuple[str, ...]) -> list[str]:
    # A cyclic rotation can put either selected center first.  If centers are
    # consecutive, the same shared pair gives both C,C,S,S and S,C,C,S linear
    # representatives required by the two existing terminal adapters.
    if not has_consecutive_centers(order):
        return []
    return [
        "false_of_two_selected_rows_shared_late_pair (center, center, J, X)",
        "false_of_two_selected_middle_rows_shared_endpoint_pair (J, center, center, X)",
    ]


def main() -> None:
    authenticated_inputs = {}
    for name, path in INPUTS.items():
        digest = sha256(path)
        expected = RECORDED_SHA256.get(name)
        authenticated_inputs[name] = {
            "path": str(path),
            "sha256": digest,
            "recorded_sha256": expected,
            "matches_record": None if expected is None else digest == expected,
        }

    # Fix A as the first written role: all 24 linear permutations modulo cyclic
    # rotation are exactly these six oriented cyclic classes.
    orbits = [("A",) + tail for tail in itertools.permutations(("B", "J", "X"))]
    rows = []
    for order in orbits:
        alternating = opposite_open_arcs(order)
        rows.append(
            {
                "cyclic_order": [ROLE_NAMES[role] for role in order],
                "short_order": " < ".join(order),
                "exact_shared_pair": ["J", "X"],
                "J_in_adjacent_cap": True,
                "x_out_outside_adjacent_cap": True,
                "outside_common_overlap_cardinality": 1,
                "satisfies_outside_overlap_at_most_one": True,
                "satisfies_banked_shared_pair_separation": alternating,
                "existing_kalmanson_consumers": consumer_signatures(order),
            }
        )

    survivors = [row for row in rows if row["satisfies_banked_shared_pair_separation"]]
    print(json.dumps({
        "scope": "pure finite cyclic-role census; no Boolean or metric CEGAR solver invoked",
        "roles": ROLE_NAMES,
        "contract": {
            "selected_row_common_support_exactly": ["J", "X"],
            "J_in_adjacent_cap": True,
            "x_out_outside_adjacent_cap": True,
            "outside_overlap_at_most_one": True,
            "shared_pair_separation": "J and X lie on opposite open arcs between A and B",
        },
        "input_authentication": authenticated_inputs,
        "counts": {
            "linear_orders": 24,
            "oriented_cyclic_rotation_orbits": len(rows),
            "raw_orbits_matching_existing_consumers": sum(bool(row["existing_kalmanson_consumers"]) for row in rows),
            "orbits_surviving_shared_pair_separation": len(survivors),
            "surviving_orbits_matching_existing_consumers": sum(bool(row["existing_kalmanson_consumers"]) for row in survivors),
        },
        "orbits": rows,
        "stop_condition": "alternating mixed placements remain; do not launch broad CEGAR",
    }, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
