#!/usr/bin/env python3
"""Audit the first repeated round-64 core against the equality theorem bank."""

from __future__ import annotations

import argparse
import json
from pathlib import Path
from typing import Any, Mapping, Sequence

import bank_reuse_audit as bank


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
DEFAULT_OUTPUT = HERE / "repeated_core_bank_audit.json"
SCHEMA = "p97-atail-repeated-five-row-core-bank-audit-v1"

CHECKPOINT = HERE / "checkpoint-round64.json"
CHECKPOINT_SHA256 = (
    "e6304b556ec3645c3ca541df0d63313d67f4a4c556f59e420e3ce387737f1e9a"
)
SHAPES = HERE / "core_shapes-round64.json"
SHAPES_SHA256 = (
    "f2580ecb7825201720b1169c040c161a5342da26bafec9d53049d746dec9bd90"
)
BANK_AUDIT = HERE / "bank_reuse_audit.json"
BANK_AUDIT_SHA256 = (
    "fe8898a42ba784f07eb8b76590717936225b43b41957e47f0296d069aa1ce123"
)

ROUND40_ROWS: tuple[tuple[int, tuple[int, ...]], ...] = (
    (1, (0, 2, 6, 7)),
    (2, (0, 1, 9, 10)),
    (6, (2, 7, 9, 11)),
    (9, (0, 3, 5, 10)),
    (10, (1, 6, 9, 11)),
)
ROUND62_ROWS: tuple[tuple[int, tuple[int, ...]], ...] = (
    (1, (0, 2, 6, 7)),
    (2, (0, 1, 9, 10)),
    (6, (2, 7, 9, 11)),
    (9, (0, 4, 5, 10)),
    (10, (1, 6, 9, 11)),
)
LABELS = tuple(
    sorted(
        {
            point
            for center, support in ROUND40_ROWS
            for point in (center, *support)
        }
    )
)


def encoded_rows(rows: Sequence[tuple[int, Sequence[int]]]) -> list[str]:
    return [f"{center}:{','.join(map(str, support))}" for center, support in rows]


def relabel_rows(
    rows: Sequence[tuple[int, Sequence[int]]], mapping: Mapping[int, int]
) -> tuple[tuple[int, tuple[int, ...]], ...]:
    return tuple(
        sorted(
            (
                mapping.get(center, center),
                tuple(sorted(mapping.get(point, point) for point in support)),
            )
            for center, support in rows
        )
    )


def closure_for(rows: Sequence[tuple[int, Sequence[int]]]) -> bank.EdgeClosure:
    closure = bank.EdgeClosure(LABELS)
    for center, support in rows:
        pivot = bank.edge(center, support[0])
        for point in support[1:]:
            closure.union(pivot, bank.edge(center, point))
    return closure


def verify_inputs() -> None:
    for path, expected in (
        (CHECKPOINT, CHECKPOINT_SHA256),
        (SHAPES, SHAPES_SHA256),
        (BANK_AUDIT, BANK_AUDIT_SHA256),
    ):
        if bank.sha256_file(path) != expected:
            raise AssertionError(f"input hash drift: {path.name}")
    for relative, expected in bank.SOURCE_HASHES.items():
        if bank.sha256_file(ROOT / relative) != expected:
            raise AssertionError(f"Lean bank source hash drift: {relative}")

    checkpoint = json.loads(CHECKPOINT.read_text(encoding="utf-8"))
    case = next(case for case in checkpoint["cases"] if case["profile"] == [5, 5, 5])
    for round_index, expected_rows in ((40, ROUND40_ROWS), (62, ROUND62_ROWS)):
        actual = case["rounds"][round_index]["accepted_cut"]["rows"]
        if actual != encoded_rows(expected_rows):
            raise AssertionError(f"round-{round_index} repeated core drift")

    shapes = json.loads(SHAPES.read_text(encoding="utf-8"))
    repeated = [
        group
        for group in shapes["groups_under_free_point_relabeling"]
        if int(group["multiplicity"]) > 1
    ]
    expected_members = [
        {"origin": "learned", "profile": [5, 5, 5], "round": 40, "row_count": 5},
        {"origin": "learned", "profile": [5, 5, 5], "round": 62, "row_count": 5},
    ]
    if len(repeated) != 1 or repeated[0]["members"] != expected_members:
        raise AssertionError("round-64 repeated-type provenance drift")
    swap_3_4 = {3: 4, 4: 3}
    if relabel_rows(ROUND40_ROWS, swap_3_4) != tuple(sorted(ROUND62_ROWS)):
        raise AssertionError("round-40/62 cores are no longer related by swap 3 <-> 4")


def build_document() -> dict[str, Any]:
    verify_inputs()
    closure = closure_for(ROUND40_ROWS)
    results = [
        bank.audit_family(closure, family, LABELS) for family in bank.FAMILIES
    ]
    matched = [result for result in results if int(result["match_count"]) > 0]
    if len(matched) != 1:
        raise AssertionError("expected exactly one bank family for the repeated core")
    match = matched[0]
    if match["family"] != "SixPointCircleChainCollisionCore":
        raise AssertionError("unexpected repeated-core bank family")
    expected_assignment = {"A": 0, "B": 1, "C": 2, "D": 6, "E": 9, "F": 10}
    if match["matches"] != [expected_assignment]:
        raise AssertionError("unexpected six-point chain role assignment")

    family = next(
        family
        for family in bank.FAMILIES
        if family.name == "SixPointCircleChainCollisionCore"
    )
    instantiated_requirements = []
    for roles in family.requirements:
        a, b, c, d = roles
        left = bank.edge(expected_assignment[a], expected_assignment[b])
        right = bank.edge(expected_assignment[c], expected_assignment[d])
        if not closure.equivalent(left, right):
            raise AssertionError("instantiated bank requirement not in row closure")
        instantiated_requirements.append(
            {
                "roles": list(roles),
                "left_edge": list(left),
                "right_edge": list(right),
                "closure_equivalent": True,
            }
        )

    return {
        "schema": SCHEMA,
        "source": {
            "checkpoint_round64_sha256": CHECKPOINT_SHA256,
            "core_shapes_round64_sha256": SHAPES_SHA256,
            "bank_reuse_audit_sha256": BANK_AUDIT_SHA256,
            "lean_source_sha256": dict(sorted(bank.SOURCE_HASHES.items())),
        },
        "subject": {
            "profile": [5, 5, 5],
            "members": [
                {"round": 40, "rows": encoded_rows(ROUND40_ROWS)},
                {"round": 62, "rows": encoded_rows(ROUND62_ROWS)},
            ],
            "exact_relabeling_round40_to_round62": {"3": 4, "4": 3},
            "active_labels_round40": list(LABELS),
        },
        "method": {
            "closure": "undirected edge quotient generated by complete row equalities",
            "assignment_policy": "exhaustive assignments into the ten active labels; repetition allowed except declared inequalities",
            "family_count": len(results),
            "indexed_corpus_preflight_command": (
                "nthdegree docs search --lean \"five row equal-distance core centers "
                "1 2 6 9 10 repeated card 12 EdgeClosure seven point collision\""
            ),
        },
        "families": results,
        "match": {
            "family": match["family"],
            "source": match["source"],
            "unique_role_assignment": expected_assignment,
            "instantiated_required_edge_closures": instantiated_requirements,
        },
        "summary": {
            "matched_family_count": 1,
            "total_match_count": 1,
            "existing_lean_family_identified": True,
            "status": "UNIQUE_EXISTING_SIX_POINT_CHAIN_MATCH",
        },
        "scope": {
            "exact_within_listed_families_and_closure_model": True,
            "new_mathematical_family_needed_for_this_core": False,
            "consumer_instantiation_written_in_lean": False,
            "fixed_core_only": True,
            "producer_covering_all_fixed_placements_proved": False,
        },
    }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--check", action="store_true")
    parser.add_argument("--output", type=Path, default=DEFAULT_OUTPUT)
    args = parser.parse_args()
    document = build_document()
    rendered = json.dumps(document, indent=2, sort_keys=True) + "\n"
    if args.check:
        if args.output.read_text(encoding="utf-8") != rendered:
            raise AssertionError("repeated-core bank audit checkpoint drift")
    else:
        args.output.write_text(rendered, encoding="utf-8")
    print(
        json.dumps(
            {
                "output": str(args.output),
                "sha256": bank.sha256_file(args.output),
                "summary": document["summary"],
            },
            indent=2,
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
