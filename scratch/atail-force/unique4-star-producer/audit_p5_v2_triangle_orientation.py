#!/usr/bin/env python3
"""Replay p5-v2 attempt 1 as a transported six-role K2 triangle."""

from __future__ import annotations

import argparse
import hashlib
import json
from collections import defaultdict
from pathlib import Path
from typing import Any


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
CHECKPOINT = HERE / "seeded_v2_full_linear_cegar_p5.json"
SCHEMA = (
    HERE.parent
    / "unique4-kalmanson-occurrence"
    / "six_role_k2_triangle_schema.json"
)
LEAN = (
    HERE.parent
    / "unique4-kalmanson-occurrence"
    / "SixRoleKalmansonTriangle.lean"
)


def load(path: Path) -> Any:
    return json.loads(path.read_text(encoding="utf-8"))


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def semantic_sha256(value: Any) -> str:
    return hashlib.sha256(
        json.dumps(value, sort_keys=True, separators=(",", ":")).encode()
    ).hexdigest()


def edge(a: int, b: int) -> tuple[int, int]:
    return (a, b) if a < b else (b, a)


def add(coefficients: dict[tuple[int, int], int], a: int, b: int, value: int) -> None:
    coefficients[edge(a, b)] += value


def k2(
    coefficients: dict[tuple[int, int], int],
    a: int,
    b: int,
    c: int,
    d: int,
) -> None:
    add(coefficients, a, c, 1)
    add(coefficients, b, d, 1)
    add(coefficients, a, d, -1)
    add(coefficients, b, c, -1)


def equality(
    coefficients: dict[tuple[int, int], int],
    center: int,
    left: int,
    right: int,
    multiplier: int,
) -> None:
    add(coefficients, center, left, multiplier)
    add(coefficients, center, right, -multiplier)


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", required=True, type=Path)
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()

    checkpoint = load(CHECKPOINT)
    schema = load(SCHEMA)
    refinement = checkpoint["refinements"][0]
    if refinement["attempt"] != 1:
        raise AssertionError("p5-v2 attempt 1 is absent")

    original = {
        (row["center_role"], member)
        for row in schema["row_instances"]
        for member in row["member_roles"]
    }
    if schema["core_vertex_count"] != 6:
        raise AssertionError("expected a six-role schema")

    # Reflection reverses all six cyclic roles.  Re-cutting by three roles puts
    # the three row centers first again, so each three-role block is reversed.
    def reflected_recut(role: int) -> int:
        return (5 - role + 3) % 6

    transported = {
        (reflected_recut(center), reflected_recut(member))
        for center, member in original
    }
    expected = {
        (0, 4),
        (0, 5),
        (1, 3),
        (1, 4),
        (2, 3),
        (2, 5),
    }
    if transported != expected:
        raise AssertionError("block-reflected schema mismatch")

    source_vertices = [1, 3, 4, 5, 6, 9]
    source_pairs = {
        (source_vertices[center], source_vertices[member])
        for center, member in transported
    }
    refinement_pairs = {
        tuple(pair) for pair in refinement["required_memberships"]
    }
    if not source_pairs <= refinement_pairs:
        raise AssertionError("p5-v2 refinement omits the transported occurrence")

    # Exact replay of the transported endpoint proof.
    i0, i1, i2, i3, i4, i5 = source_vertices
    coefficients: dict[tuple[int, int], int] = defaultdict(int)
    k2(coefficients, i0, i1, i4, i5)
    k2(coefficients, i1, i2, i3, i5)
    equality(coefficients, i0, i4, i5, -1)
    equality(coefficients, i1, i3, i4, -1)
    equality(coefficients, i2, i3, i5, 1)
    residual = {
        f"d_{a}_{b}": value for (a, b), value in coefficients.items() if value
    }
    if residual:
        raise AssertionError(f"nonzero exact replay residual: {residual}")

    payload = {
        "schema": "p97-p5-v2-six-role-triangle-oriented-transport-v1",
        "epistemic_status": (
            "EXACT_FIXED_REFINEMENT_TRANSPORT_TO_KERNEL_CHECKED_GENERIC_CONSUMER; "
            "NO UNIFORM SOURCE OCCURRENCE THEOREM"
        ),
        "source_hashes": {
            str(path.relative_to(ROOT)): sha256(path)
            for path in (SCHEMA, LEAN)
        },
        "checkpoint": {
            "path": str(CHECKPOINT.relative_to(ROOT)),
            "attempt": refinement["attempt"],
            "semantic_sha256": semantic_sha256(refinement),
        },
        "transport": {
            "description": (
                "boundary reflection followed by cyclic re-cut by three roles; "
                "equivalently reverse the center block and the point block"
            ),
            "role_map": [reflected_recut(role) for role in range(6)],
            "original_pairs": [list(pair) for pair in sorted(original)],
            "transported_pairs": [list(pair) for pair in sorted(transported)],
        },
        "fixed_occurrence": {
            "source_vertices_by_role": source_vertices,
            "required_memberships": [list(pair) for pair in sorted(source_pairs)],
            "status": "VERIFIED_SUBSET_OF_REFINEMENT_MEMBERSHIPS",
        },
        "exact_endpoint_replay": {
            "strict_inequalities": ["K2(i0,i1,i4,i5)", "K2(i1,i2,i3,i5)"],
            "residual_coefficients": residual,
            "status": "EXACT_INTEGER_REPLAY_SUMS_TO_ZERO_LT_ZERO",
        },
        "lean_consumer": schema["lean_consumer"],
        "seed_audit": (
            "The v2 loader emitted only forward and un-recut linear reflection. "
            "The next seed expansion must include cyclic re-cuts of reflected schemas."
        ),
    }
    rendered = json.dumps(payload, indent=2, sort_keys=True) + "\n"
    if args.check:
        if not args.output.exists() or args.output.read_text() != rendered:
            raise SystemExit(f"stale or missing orientation replay: {args.output}")
    else:
        args.output.write_text(rendered)
    print(
        json.dumps(
            {
                "status": "VERIFIED_EXISTING_CONSUMER_TRANSPORT",
                "semantic_sha256": payload["checkpoint"]["semantic_sha256"],
            },
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
