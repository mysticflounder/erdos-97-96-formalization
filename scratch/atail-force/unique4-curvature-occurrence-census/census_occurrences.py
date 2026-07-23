#!/usr/bin/env python3
"""Quotient four-arc witnesses in the twelve stored exact-two projections.

This is a bounded n=11 census.  It reads the checked SAT projection payloads
and enumerates the two shell-curvature arcs supplied by each selected row.
It does not assert arbitrary-cardinality or source-level coverage.
"""

from __future__ import annotations

import argparse
import hashlib
import itertools
import json
from collections import defaultdict
from pathlib import Path
from typing import Any, Iterable


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
DEFAULT_RUN_DIR = (
    HERE.parent / "unique-arm-whole-carrier-source-audit" / "cegar-exact-two"
)

LEFT = "center_to_second_support"
RIGHT = "third_support_to_period_end"


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def row_arcs(center: int, support: Iterable[int], n: int) -> list[dict[str, Any]]:
    offsets = sorted((center - point) % n for point in support)
    if len(offsets) != 4 or offsets[0] == 0:
        raise ValueError((center, sorted(support), offsets))
    global_start = (-center) % n
    return [
        {
            "center": center,
            "kind": LEFT,
            "start": global_start,
            "end": global_start + offsets[1],
            "offsets": tuple(offsets),
        },
        {
            "center": center,
            "kind": RIGHT,
            "start": global_start + offsets[2],
            "end": global_start + n,
            "offsets": tuple(offsets),
        },
    ]


def enumerate_witnesses(payload: dict[str, Any]) -> list[dict[str, Any]]:
    n = int(payload["n"])
    rows = {
        int(center): frozenset(map(int, support))
        for center, support in payload["rows"].items()
    }
    blocker_image = frozenset(map(int, payload["blockers"].values()))
    base_arcs = [
        arc
        for center, support in sorted(rows.items())
        for arc in row_arcs(center, support, n)
    ]
    shifted = [
        {**arc, "start": int(arc["start"]) + shift * n,
         "end": int(arc["end"]) + shift * n}
        for arc in base_arcs
        for shift in range(-2, 3)
    ]
    witnesses: list[dict[str, Any]] = []
    seen: set[tuple[tuple[int, int, int, str], ...]] = set()
    for chosen in itertools.combinations(shifted, 4):
        if len({(arc["center"], arc["kind"]) for arc in chosen}) != 4:
            continue
        ordered = sorted(chosen, key=lambda arc: (arc["start"], arc["end"]))
        if any(
            int(ordered[index]["end"]) - 1 > int(ordered[index + 1]["start"])
            for index in range(3)
        ):
            continue
        cut = int(ordered[0]["start"])
        if int(ordered[-1]["end"]) - 1 - cut >= n:
            continue
        key = tuple(
            (
                int(arc["start"]) - cut,
                int(arc["end"]) - cut,
                int(arc["center"]),
                str(arc["kind"]),
            )
            for arc in ordered
        )
        if key in seen:
            continue
        seen.add(key)
        witnesses.append(
            {
                "cut": cut % n,
                "arcs": [
                    {
                        "start": start,
                        "end": end,
                        "center": center,
                        "kind": kind,
                        "offsets": list(next(
                            arc["offsets"]
                            for arc in base_arcs
                            if arc["center"] == center and arc["kind"] == kind
                        )),
                        "center_provenance": (
                            "fixed_blocker_image"
                            if center in blocker_image
                            else "global_k4_completion"
                        ),
                        "row_support": sorted(rows[center]),
                    }
                    for start, end, center, kind in key
                ],
            }
        )
    return witnesses


def equality_pattern(values: list[int]) -> tuple[int, ...]:
    labels: dict[int, int] = {}
    return tuple(labels.setdefault(value, len(labels)) for value in values)


def kind_letter(kind: str) -> str:
    return "L" if kind == LEFT else "R"


def reflected_offsets(offsets: tuple[int, ...], n: int) -> tuple[int, ...]:
    return tuple(sorted(n - offset for offset in offsets))


def rotations(items: tuple[Any, ...]) -> Iterable[tuple[Any, ...]]:
    for shift in range(len(items)):
        yield items[shift:] + items[:shift]


def canonical_coarse_schema(
    witness: dict[str, Any], n: int, *, include_offsets: bool,
    include_provenance: bool,
) -> str:
    arcs = witness["arcs"]

    def encode(oriented: list[dict[str, Any]], reflected: bool) -> tuple[Any, ...]:
        centers = equality_pattern([int(arc["center"]) for arc in oriented])
        tokens: list[tuple[Any, ...]] = []
        for arc, center_label in zip(oriented, centers, strict=True):
            kind = kind_letter(str(arc["kind"]))
            offsets = tuple(map(int, arc["offsets"]))
            if reflected:
                kind = "R" if kind == "L" else "L"
                offsets = reflected_offsets(offsets, n)
            token: list[Any] = [kind, center_label]
            if include_offsets:
                token.append(offsets)
            if include_provenance:
                token.append(str(arc["center_provenance"]))
            tokens.append(tuple(token))
        return tuple(tokens)

    candidates: list[tuple[Any, ...]] = []
    forward = list(arcs)
    reverse = list(reversed(arcs))
    for rotation in rotations(tuple(forward)):
        candidates.append(encode(list(rotation), False))
    for rotation in rotations(tuple(reverse)):
        candidates.append(encode(list(rotation), True))
    return json.dumps(min(candidates), separators=(",", ":"))


def transform_vertex(point: int, n: int, shift: int, reflected: bool) -> int:
    return ((-point if reflected else point) + shift) % n


def canonical_exact_schema(
    witness: dict[str, Any], n: int, *, include_provenance: bool,
) -> str:
    candidates: list[tuple[Any, ...]] = []
    for reflected in (False, True):
        for shift in range(n):
            transformed = []
            for arc in witness["arcs"]:
                kind = kind_letter(str(arc["kind"]))
                if reflected:
                    kind = "R" if kind == "L" else "L"
                record: list[Any] = [
                    transform_vertex(int(arc["center"]), n, shift, reflected),
                    kind,
                    tuple(sorted(
                        transform_vertex(int(point), n, shift, reflected)
                        for point in arc["row_support"]
                    )),
                ]
                if include_provenance:
                    record.append(str(arc["center_provenance"]))
                transformed.append(tuple(record))
            candidates.append(tuple(sorted(transformed)))
    return json.dumps(min(candidates), separators=(",", ":"))


def is_three_row_source_orientation_invariant(witness: dict[str, Any]) -> bool:
    """Recognize the three-row target without reflecting the CCW boundary."""

    arcs = witness["arcs"]
    by_center: dict[int, list[dict[str, Any]]] = defaultdict(list)
    for arc in arcs:
        by_center[int(arc["center"])].append(arc)
    if len(by_center) != 3:
        return False
    fixed = [
        center_arcs for center_arcs in by_center.values()
        if all(arc["center_provenance"] == "fixed_blocker_image" for arc in center_arcs)
    ]
    completion = [
        center_arcs for center_arcs in by_center.values()
        if all(arc["center_provenance"] == "global_k4_completion" for arc in center_arcs)
    ]
    if len(fixed) != 2 or any(len(center_arcs) != 1 for center_arcs in fixed):
        return False
    if len(completion) != 1 or len(completion[0]) != 2:
        return False
    if {arc["kind"] for arc in completion[0]} != {LEFT, RIGHT}:
        return False
    completion_positions = [
        index for index, arc in enumerate(arcs)
        if arc["center_provenance"] == "global_k4_completion"
    ]
    return (
        (completion_positions[0] - completion_positions[1]) % 4 in {1, 3}
    )


def fixed_arcs_are_both_left(witness: dict[str, Any]) -> bool:
    return all(
        arc["kind"] == LEFT
        for arc in witness["arcs"]
        if arc["center_provenance"] == "fixed_blocker_image"
    )


def minimum_set_cover(
    coverage: dict[str, set[int]], universe: set[int]
) -> list[str]:
    ordered_universe = sorted(universe)
    bit_of = {record: 1 << index for index, record in enumerate(ordered_universe)}
    target = (1 << len(ordered_universe)) - 1
    # Many syntactically different schemas cover the same records.  Retain the
    # lexicographically first representative for each coverage mask.
    representative: dict[int, str] = {}
    for schema, covered in coverage.items():
        mask = sum(bit_of[record] for record in covered)
        if mask and (mask not in representative or schema < representative[mask]):
            representative[mask] = schema
    best: dict[int, tuple[str, ...]] = {0: ()}
    for covered_mask, schema in sorted(
        representative.items(), key=lambda item: (-item[0].bit_count(), item[1])
    ):
        snapshot = list(best.items())
        for mask, chosen in snapshot:
            new_mask = mask | covered_mask
            candidate = (*chosen, schema)
            if new_mask not in best or (len(candidate), candidate) < (
                len(best[new_mask]), best[new_mask]
            ):
                best[new_mask] = candidate
    if target not in best:
        raise AssertionError("finite witnesses exist but no cover was found")
    return list(best[target])


def point_role(point: int, payload: dict[str, Any]) -> str:
    first_apex = int(payload["first_apex"])
    second_apex = int(payload["second_apex"])
    surplus_vertex = int(payload["surplus_vertex"])
    if point == first_apex:
        return "first_apex"
    if point == second_apex:
        return "second_apex"
    if point == surplus_vertex:
        return "surplus_vertex"
    exact_class = set(map(int, payload["first_apex_exact_class"]))
    caps = {
        name: list(map(int, points)) for name, points in payload["closed_caps"].items()
    }
    strict_first = list(map(int, payload["first_opposite_strict"]))
    if point in exact_class:
        if point in strict_first:
            hits = sorted(exact_class & set(strict_first))
            return f"exact_strict_hit_{hits.index(point)}"
        if point in set(caps["surplus"]) - {first_apex, second_apex}:
            return "exact_surplus_adjacent_hit"
        if point in set(caps["second_opposite"]) - {first_apex, surplus_vertex}:
            return "exact_second_adjacent_hit"
        return "exact_class_other"
    for cap_name, endpoints in (
        ("surplus", {first_apex, second_apex}),
        ("first_opposite", {second_apex, surplus_vertex}),
        ("second_opposite", {surplus_vertex, first_apex}),
    ):
        interior = [vertex for vertex in caps[cap_name] if vertex not in endpoints]
        if point in interior:
            return f"{cap_name}_other_{interior.index(point)}"
    raise AssertionError((point, payload["closed_caps"]))


def representative_payload(
    witness: dict[str, Any], payload: dict[str, Any]
) -> dict[str, Any]:
    blockers = {int(source): int(center) for source, center in payload["blockers"].items()}
    records = []
    for arc in witness["arcs"]:
        center = int(arc["center"])
        offsets = list(map(int, arc["offsets"]))
        endpoint_offset = offsets[1] if arc["kind"] == LEFT else offsets[2]
        endpoint = next(
            point for point in map(int, arc["row_support"])
            if (center - point) % int(payload["n"]) == endpoint_offset
        )
        records.append(
            {
                **arc,
                "center_role": point_role(center, payload),
                "row_support_roles": [
                    point_role(int(point), payload) for point in arc["row_support"]
                ],
                "curvature_endpoint": endpoint,
                "curvature_endpoint_role": point_role(endpoint, payload),
                "fixed_blocker_sources": sorted(
                    source for source, blocker_center in blockers.items()
                    if blocker_center == center
                ),
            }
        )
    return {"cut": witness["cut"], "arcs": records}


def build(run_dir: Path) -> dict[str, Any]:
    sources = sorted(run_dir.glob("round_*/opp1_*.result.json"))
    if len(sources) != 12:
        raise ValueError(f"expected 12 exact-two projections, found {len(sources)}")

    levels = {
        "kind_center": lambda witness, n: canonical_coarse_schema(
            witness, n, include_offsets=False, include_provenance=False
        ),
        "kind_center_provenance": lambda witness, n: canonical_coarse_schema(
            witness, n, include_offsets=False, include_provenance=True
        ),
        "local_row_offsets": lambda witness, n: canonical_coarse_schema(
            witness, n, include_offsets=True, include_provenance=False
        ),
        "local_row_offsets_provenance": lambda witness, n: canonical_coarse_schema(
            witness, n, include_offsets=True, include_provenance=True
        ),
        "exact_dihedral_rows": lambda witness, n: canonical_exact_schema(
            witness, n, include_provenance=False
        ),
        "exact_dihedral_rows_provenance": lambda witness, n: canonical_exact_schema(
            witness, n, include_provenance=True
        ),
    }
    records: list[dict[str, Any]] = []
    payloads: list[dict[str, Any]] = []
    witnesses_by_record: list[list[dict[str, Any]]] = []
    coverage_by_level: dict[str, dict[str, set[int]]] = {
        level: defaultdict(set) for level in levels
    }
    representative_by_level: dict[str, dict[str, dict[str, Any]]] = {
        level: {} for level in levels
    }

    for index, source in enumerate(sources):
        payload = json.loads(source.read_text(encoding="utf-8"))
        witnesses = enumerate_witnesses(payload)
        payloads.append(payload)
        witnesses_by_record.append(witnesses)
        schemas_by_level: dict[str, list[str]] = {}
        for level, canonicalize in levels.items():
            schemas = sorted({canonicalize(witness, int(payload["n"])) for witness in witnesses})
            schemas_by_level[level] = schemas
            for schema in schemas:
                coverage_by_level[level][schema].add(index)
                representative_by_level[level].setdefault(schema, witnesses[0])
        blocker_image = frozenset(map(int, payload["blockers"].values()))
        fixed_only = [
            witness for witness in witnesses
            if all(arc["center"] in blocker_image for arc in witness["arcs"])
        ]
        invariant = [
            witness for witness in witnesses
            if is_three_row_source_orientation_invariant(witness)
        ]
        literal_left_left = [
            witness for witness in invariant if fixed_arcs_are_both_left(witness)
        ]
        records.append(
            {
                "source": str(source.resolve().relative_to(ROOT.resolve())),
                "source_sha256": sha256(source),
                "opp1_card": int(payload["opp1_card"]),
                "witness_count": len(witnesses),
                "fixed_blocker_image_only_witness_count": len(fixed_only),
                "requires_global_k4_completion": not fixed_only,
                "source_orientation_invariant_three_row_witness_count": len(invariant),
                "literal_fixed_left_left_witness_count": len(literal_left_left),
                "schema_counts": {
                    level: len(schemas) for level, schemas in schemas_by_level.items()
                },
            }
        )

    universe = set(range(len(records)))
    quotient: dict[str, Any] = {}
    for level in levels:
        coverage = coverage_by_level[level]
        common = sorted(
            schema for schema, covered in coverage.items() if covered == universe
        )
        cover = common[:1] if common else minimum_set_cover(coverage, universe)
        quotient[level] = {
            "schema_count": len(coverage),
            "common_schema_count": len(common),
            "common_schemas": common,
            "minimum_cover_size": len(cover),
            "minimum_cover": [
                {
                    "schema": schema,
                    "record_indices": sorted(coverage[schema]),
                }
                for schema in cover
            ],
        }

    common_coarse = quotient["kind_center_provenance"]["common_schemas"]
    if not common_coarse:
        raise AssertionError("the twelve projections lost their common dihedral schema")
    if not all(
        record["source_orientation_invariant_three_row_witness_count"] > 0
        for record in records
    ):
        raise AssertionError("the source-orientation-invariant three-row target drifted")
    representatives = []
    for index, (payload, witnesses) in enumerate(zip(payloads, witnesses_by_record, strict=True)):
        witness = next(
            witness for witness in witnesses
            if is_three_row_source_orientation_invariant(witness)
        )
        representatives.append(
            {
                "record_index": index,
                "source": records[index]["source"],
                **representative_payload(witness, payload),
            }
        )

    return {
        "schema": "p97-unique4-curvature-occurrence-census-v1",
        "epistemic_status": "EXACT_ENUMERATION_OF_12_STORED_N11_PROJECTIONS",
        "scope_warning": (
            "No arbitrary-cardinality or source-level occurrence coverage is claimed"
        ),
        "record_count": len(records),
        "all_have_turn_disjoint_witness": all(record["witness_count"] for record in records),
        "all_have_fixed_blocker_image_only_witness": all(
            not record["requires_global_k4_completion"] for record in records
        ),
        "records": records,
        "quotient_warning": (
            "The quotient tables canonicalize by cyclic rotation and reflection; "
            "their literal L/R tokens are not fixed-CCW source claims"
        ),
        "designated_source_orientation_invariant_schema": {
            "schema": "two_fixed_either_plus_one_completion_both_outer_v1",
            "meaning": (
                "Three selected rows in the retained CCW orientation: one arbitrary "
                "global-K4 completion row contributes both outer arcs; each of two "
                "fixed-blocker-image rows contributes one outer arc of either side, "
                "with the two fixed arcs cyclically placed between the completion arcs"
            ),
            "reflection_used": False,
            "record_count_with_literal_fixed_left_left_witness": sum(
                record["literal_fixed_left_left_witness_count"] > 0
                for record in records
            ),
            "representatives": representatives,
        },
        "quotient": quotient,
    }


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--run-dir", type=Path, default=DEFAULT_RUN_DIR)
    parser.add_argument("--output", type=Path, required=True)
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    result = build(args.run_dir)
    if args.check:
        expected = json.loads(args.output.read_text(encoding="utf-8"))
        if result != expected:
            raise AssertionError("curvature occurrence census drifted")
        print("PASS: curvature occurrence census matches checkpoint")
    else:
        args.output.write_text(
            json.dumps(result, indent=2, sort_keys=True) + "\n", encoding="utf-8"
        )
        print(json.dumps(result, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
