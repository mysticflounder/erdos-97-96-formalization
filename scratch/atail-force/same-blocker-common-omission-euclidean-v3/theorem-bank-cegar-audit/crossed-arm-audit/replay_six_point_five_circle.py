#!/usr/bin/env python3
"""Replay the three order-free six-point five-circle cores on one witness.

This is a finite raw-distance-equality audit.  A reported injective match makes
the radius partition incompatible with the corresponding production Lean
theorem, because injectivity supplies the theorem's required `A != E` fact.
"""

from __future__ import annotations

import argparse
import hashlib
import json
from pathlib import Path

import crossed_arm_cegar


HERE = Path(__file__).resolve().parent
DEFAULT_WITNESS = (
    HERE
    / "source-at-common-full-metric-bank-v7-global-edge-equality-import-v6"
    / "witness.json"
)
ROLES = ("O", "A", "B", "C", "E", "F")
SCHEMAS = {
    "six_point_five_circle_collision_a": {
        "theorem": (
            "Problem97.Census554.EqualityCore."
            "six_point_five_circle_collision_a"
        ),
        "role_order": ("A", "O", "B", "E", "C", "F"),
        "equalities": (
            ("O", "A", "B"),
            ("A", "O", "B"),
            ("A", "O", "C"),
            ("A", "O", "E"),
            ("C", "B", "E"),
            ("C", "B", "F"),
            ("E", "O", "C"),
            ("E", "O", "F"),
            ("F", "O", "A"),
        ),
    },
    "six_point_five_circle_collision_b": {
        "theorem": (
            "Problem97.Census554.EqualityCore."
            "six_point_five_circle_collision_b"
        ),
        "role_order": ("A", "O", "B", "E", "F", "C"),
        "equalities": (
            ("A", "O", "B"),
            ("A", "O", "E"),
            ("B", "O", "A"),
            ("B", "O", "C"),
            ("B", "O", "F"),
            ("E", "O", "B"),
            ("C", "O", "F"),
            ("F", "A", "E"),
            ("F", "A", "C"),
        ),
    },
    "six_point_five_circle_collision_c": {
        "theorem": (
            "Problem97.Census554.EqualityCore."
            "six_point_five_circle_collision_c"
        ),
        "role_order": ("A", "O", "B", "E", "F", "C"),
        "equalities": (
            ("A", "O", "B"),
            ("A", "O", "E"),
            ("A", "O", "C"),
            ("B", "O", "A"),
            ("B", "O", "F"),
            ("E", "B", "C"),
            ("E", "B", "F"),
            ("C", "O", "E"),
            ("F", "A", "E"),
        ),
    },
}


def validate_schemas() -> None:
    for family, schema in SCHEMAS.items():
        role_order = schema["role_order"]
        equalities = schema["equalities"]
        if set(role_order) != set(ROLES) or len(role_order) != len(ROLES):
            raise AssertionError((family, "invalid-role-order", role_order))
        if len(equalities) != 9:
            raise AssertionError((family, "invalid-equality-count", len(equalities)))
        if set().union(*(set(atom) for atom in equalities)) != set(ROLES):
            raise AssertionError((family, "incomplete-role-use"))


def find_injective_matches(order, equality_holds, schema, preview_limit=20):
    role_order = schema["role_order"]
    equalities = schema["equalities"]
    assignment = {}
    used = set()
    previews = []
    nodes_by_depth = [0] * (len(role_order) + 1)
    match_count = 0

    def grounded_equalities_hold():
        for center, left, right in equalities:
            if center in assignment and left in assignment and right in assignment:
                if not equality_holds(
                    assignment[center], assignment[left], assignment[right]
                ):
                    return False
        return True

    def search(depth):
        nonlocal match_count
        nodes_by_depth[depth] += 1
        if depth == len(role_order):
            match_count += 1
            if len(previews) < preview_limit:
                previews.append({role: assignment[role] for role in ROLES})
            return
        role = role_order[depth]
        for point in order:
            if point in used:
                continue
            assignment[role] = point
            used.add(point)
            if grounded_equalities_hold():
                search(depth + 1)
            used.remove(point)
            del assignment[role]

    search(0)
    return {
        "match_count": match_count,
        "search_nodes_by_depth": nodes_by_depth,
        "match_previews": previews,
    }


def replay(witness: Path) -> dict[str, object]:
    witness, _payload, order, equality_holds = (
        crossed_arm_cegar.read_witness_radius_partition(witness)
    )
    families = {}
    for family, schema in SCHEMAS.items():
        family_result = find_injective_matches(order, equality_holds, schema)
        families[family] = {
            "theorem": schema["theorem"],
            "role_order": schema["role_order"],
            "equalities": schema["equalities"],
            **family_result,
        }
    total_matches = sum(result["match_count"] for result in families.values())
    return {
        "schema": "order-free-six-point-five-circle-witness-replay-v1",
        "status": "KILLED" if total_matches else "SURVIVES",
        "witness": str(witness),
        "witness_sha256": hashlib.sha256(witness.read_bytes()).hexdigest(),
        "carrier_size": len(order),
        "matching_scope": "injective six-role assignments only",
        "total_match_count": total_matches,
        "families": families,
        "trust_note": (
            "Finite replay against a complete serialized radius partition. "
            "Each match uses nine raw distance equalities and injectivity gives "
            "A != E. This script does not itself run Lean or certify the witness."
        ),
    }


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--witness", type=Path, default=DEFAULT_WITNESS)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()
    validate_schemas()
    result = replay(args.witness)
    output = args.output or args.witness.parent / "order-free-five-circle-replay.json"
    output.parent.mkdir(parents=True, exist_ok=True)
    output.write_text(json.dumps(result, indent=2, sort_keys=True) + "\n")
    print(json.dumps({
        "status": result["status"],
        "total_match_count": result["total_match_count"],
        "family_match_counts": {
            family: data["match_count"]
            for family, data in result["families"].items()
        },
        "output": str(output.resolve()),
    }, sort_keys=True))


if __name__ == "__main__":
    main()
