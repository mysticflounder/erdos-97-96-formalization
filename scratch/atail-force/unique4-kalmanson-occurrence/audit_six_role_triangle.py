#!/usr/bin/env python3
"""Replay the six-role K2 triangle in the live corrected p5 assignment.

This verifies one fixed theorem-discovery artifact.  It is not an occurrence
proof from ``OriginalUniqueFourResidual`` at arbitrary carrier cardinality.
"""

from __future__ import annotations

import argparse
import hashlib
import itertools
import json
from collections import defaultdict
from pathlib import Path
from typing import Any


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
SELF = Path(__file__).resolve()
CEGAR_DIR = HERE.parent / "unique4-star-producer"
ASSIGNMENT = HERE.parent / "unique4-star-producer" / "direct_owncap_endpoint_p5.json"
SCHEMA = HERE / "six_role_k2_triangle_schema.json"
LEAN = HERE / "SixRoleKalmansonTriangle.lean"
SOURCE_BOUNDARY = HERE / "ExactTwoSourceOccurrenceBoundary.lean"
BANK = HERE.parent / "unique-arm-whole-carrier-source-audit" / "kalmanson_schema_bank.json"


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def semantic_sha256(value: Any) -> str:
    encoded = json.dumps(value, sort_keys=True, separators=(",", ":")).encode()
    return hashlib.sha256(encoded).hexdigest()


def load(path: Path) -> Any:
    return json.loads(path.read_text(encoding="utf-8"))


def edge(a: int, b: int) -> tuple[int, int]:
    return (a, b) if a < b else (b, a)


def add(coeffs: dict[tuple[int, int], int], pair: tuple[int, int], value: int) -> None:
    coeffs[edge(*pair)] += value


def k2(coeffs: dict[tuple[int, int], int], a: int, b: int, c: int, d: int) -> None:
    """Add lhs-rhs coefficients for d(a,c)+d(b,d) < d(a,d)+d(b,c)."""
    add(coeffs, (a, c), 1)
    add(coeffs, (b, d), 1)
    add(coeffs, (a, d), -1)
    add(coeffs, (b, c), -1)


def equality(
    coeffs: dict[tuple[int, int], int],
    center: int,
    left: int,
    right: int,
    multiplier: int,
) -> None:
    add(coeffs, (center, left), multiplier)
    add(coeffs, (center, right), -multiplier)


def bank_embeddings(schema: dict[str, Any], bank: dict[str, Any]) -> list[dict[str, Any]]:
    target = {
        (row["center_role"], member)
        for row in schema["row_instances"]
        for member in row["member_roles"]
    }
    hits: list[dict[str, Any]] = []
    for index, candidate in enumerate(bank["schemas"]):
        size = candidate["core_vertex_count"]
        if size > schema["core_vertex_count"]:
            continue
        pairs = {tuple(pair) for pair in candidate["order_schema"]}
        for targets in itertools.combinations(range(schema["core_vertex_count"]), size):
            for reflected in (False, True):
                transported = {
                    (
                        targets[size - 1 - center] if reflected else targets[center],
                        targets[size - 1 - member] if reflected else targets[member],
                    )
                    for center, member in pairs
                }
                if transported <= target:
                    hits.append(
                        {
                            "schema_index": index,
                            "reflected": reflected,
                            "target_roles": targets,
                            "transported_pairs": sorted(transported),
                        }
                    )
    return hits


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path, default=HERE / "replay.json")
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()

    assignment = load(ASSIGNMENT)
    schema = load(SCHEMA)
    bank = load(BANK)
    rows = {int(center): set(support) for center, support in assignment["decoded"]["rows"].items()}
    normalized_occurrences: list[dict[str, Any]] = []
    source_refinements: list[dict[str, Any]] = []
    for source in schema["source_occurrences"]:
        checkpoint_path = CEGAR_DIR / source["checkpoint"]
        cegar = load(checkpoint_path)
        refinement = cegar["refinements"][source["attempt"] - 1]
        assert refinement["attempt"] == source["attempt"]
        assert refinement["metric_core"] == source["source_metric_core"]
        source_vertices = source["source_vertices_by_role"]
        assert source_vertices == sorted(source_vertices)
        assert set(source_vertices) <= set(refinement["core_vertices"])
        refinement_memberships = {
            tuple(pair) for pair in refinement["required_memberships"]
        }
        occurrence_checks: list[dict[str, Any]] = []
        for row in schema["row_instances"]:
            center = source_vertices[row["center_role"]]
            members = [source_vertices[role] for role in row["member_roles"]]
            required_pairs = {(center, member) for member in members}
            assert required_pairs <= refinement_memberships
            preserved_support = (
                sorted(rows[center])
                if source["id"] == "p5_attempt_1" and set(members) <= rows[center]
                else None
            )
            occurrence_checks.append(
                {
                    "row_instance_id": f'{source["id"]}_{row["row_instance_id"]}',
                    "center": center,
                    "required_members": members,
                    "preserved_assignment_support": preserved_support,
                    "evidence": (
                        "preserved decoded assignment plus refinement required memberships"
                        if preserved_support is not None
                        else "refinement required memberships; decoded table was not serialized"
                    ),
                    "status": "PASS",
                }
            )

        # Exact coefficient replay of the direct two-K2 Lean proof under this role map.
        i0, i1, i2, i3, i4, i5 = source_vertices
        coefficients: dict[tuple[int, int], int] = defaultdict(int)
        k2(coefficients, i0, i1, i3, i5)
        k2(coefficients, i1, i2, i3, i4)
        equality(coefficients, i0, i3, i5, -1)
        equality(coefficients, i1, i4, i5, 1)
        equality(coefficients, i2, i3, i4, 1)
        residual = {
            f"d_{a}_{b}": value for (a, b), value in coefficients.items() if value
        }
        assert residual == {}
        normalized_occurrences.append(
            {
                "id": source["id"],
                "source_vertices_by_role": source_vertices,
                "strict_role_order": all(
                    a < b for a, b in zip(source_vertices, source_vertices[1:])
                ),
                "row_instances": occurrence_checks,
                "direct_strict_inequalities": [
                    f"K2({i0},{i1},{i3},{i5})",
                    f"K2({i1},{i2},{i3},{i4})",
                ],
                "residual_coefficients": residual,
                "status": "VERIFIED_DIRECT_ORDER_PRESERVING_OCCURRENCE",
            }
        )
        source_refinements.append(
            {
                "id": source["id"],
                "checkpoint": str(checkpoint_path.relative_to(ROOT)),
                "attempt": refinement["attempt"],
                "semantic_sha256": semantic_sha256(refinement),
                "source_core_vertices": refinement["core_vertices"],
                "source_required_memberships": refinement["required_memberships"],
                "source_metric_core": refinement["metric_core"],
            }
        )

    legacy_hits = bank_embeddings(schema, bank)
    assert legacy_hits == []
    payload = {
        "schema": "p97-unique4-six-role-k2-triangle-replay-v1",
        "epistemic_status": (
            "EXACT_STORED_REFINEMENT_OCCURRENCE_REPLAY_PLUS_KERNEL_CHECKED_GENERIC_CONSUMER; "
            "NO_UNIFORM_SOURCE_OCCURRENCE_THEOREM"
        ),
        "claim_scope": (
            "Two corrected n=11 p5 refinements instantiate the six-role row-instance schema. "
            "The first also replays against its preserved decoded assignment; the second replays "
            "against the exact memberships stored in its refinement. No arbitrary-cardinality "
            "occurrence claim is made."
        ),
        "source_hashes": {
            str(path.relative_to(ROOT)): sha256(path)
            for path in (SELF, ASSIGNMENT, SCHEMA, LEAN, SOURCE_BOUNDARY, BANK)
        },
        "cegar_checkpoints": {
            "append_robustness": (
                "Only the named attempt records are hashed; later appended refinements do not "
                "invalidate this replay."
            ),
            "named_refinements": source_refinements,
        },
        "normalized_occurrences": normalized_occurrences,
        "exact_endpoint_compressed_replay": {
            "occurrence_count": len(normalized_occurrences),
            "status": "ALL_EXACT_INTEGER_REPLAYS_SUM_TO_ZERO_LT_ZERO",
        },
        "legacy_bank_audit": {
            "schema_count": bank["schema_count"],
            "subsuming_embeddings": legacy_hits,
            "status": "NO_EXISTING_46_SCHEMA_SUBSUMES_THE_SIX_ROLE_TRIANGLE",
        },
        "lean_consumer": schema["lean_consumer"],
    }
    rendered = json.dumps(payload, indent=2, sort_keys=True) + "\n"
    if args.check:
        assert args.output.read_text(encoding="utf-8") == rendered
    else:
        args.output.write_text(rendered, encoding="utf-8")
    print(json.dumps({"status": "PASS", "output": str(args.output)}, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
