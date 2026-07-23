#!/usr/bin/env python3
"""Classify checked curvature terminals in corrected exact-two CEGAR runs.

This is a read-only census of already published round artifacts.  It never
reads ``current.cnf`` and never writes inside an input run directory.  The
output is exact finite replay evidence for the recorded n=11 abstraction, not
a geometric or arbitrary-cardinality proof.
"""

from __future__ import annotations

import argparse
import hashlib
import json
from collections import Counter, defaultdict
from pathlib import Path
from typing import Any


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def read_json(path: Path) -> Any:
    return json.loads(path.read_text(encoding="utf-8"))


def write_json(path: Path, value: object) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    temporary = path.with_name(path.name + ".tmp")
    temporary.write_text(
        json.dumps(value, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )
    temporary.replace(path)


def strict_cap_regions(result: dict[str, Any]) -> dict[int, str]:
    first_apex = result["first_apex"]
    second_apex = result["second_apex"]
    surplus_vertex = result["surplus_vertex"]
    regions = {
        first_apex: "first_apex",
        second_apex: "second_apex",
        surplus_vertex: "surplus_vertex",
    }
    endpoints = {
        "surplus": {first_apex, second_apex},
        "first_opposite": {second_apex, surplus_vertex},
        "second_opposite": {surplus_vertex, first_apex},
    }
    for name, cap in result["closed_caps"].items():
        for point in set(cap) - endpoints[name]:
            if point in regions:
                raise AssertionError("strict cap regions are not disjoint")
            regions[point] = f"{name}_strict"
    if set(regions) != set(result["boundary_order"]):
        raise AssertionError("physical regions do not partition the carrier")
    return regions


def mutual_triangles(result: dict[str, Any]) -> list[dict[str, Any]]:
    """Enumerate source-locked two-step mutual triangles in one SAT record."""

    vertices = tuple(result["boundary_order"])
    rows = {int(center): set(row) for center, row in result["rows"].items()}
    blockers = {int(source): int(center) for source, center in result["blockers"].items()}
    preimages: dict[int, list[int]] = defaultdict(list)
    for source, center in blockers.items():
        preimages[center].append(source)

    triangles = []
    for anchor in vertices:
        for middle in vertices:
            if middle == anchor:
                continue
            for blocker in vertices:
                if blocker in {anchor, middle} or blocker not in preimages:
                    continue
                antecedent = (
                    middle in rows[anchor]
                    and blocker in rows[anchor]
                    and anchor in rows[middle]
                    and blocker in rows[middle]
                    and middle in rows[blocker]
                )
                if not antecedent:
                    continue
                if anchor not in rows[blocker]:
                    raise AssertionError(
                        "record violates checked blocker-image mutual-triangle closure"
                    )
                triangles.append(
                    {
                        "anchor": anchor,
                        "middle": middle,
                        "blocker": blocker,
                        "blocker_sources": sorted(preimages[blocker]),
                    }
                )
    return triangles


def center_signature(
    center: int,
    *,
    result: dict[str, Any],
    regions: dict[int, str],
    blocker_preimages: dict[int, list[int]],
) -> dict[str, Any]:
    first_apex = result["first_apex"]
    exact_class = set(result["first_apex_exact_class"])
    blockers = {int(source): int(value) for source, value in result["blockers"].items()}
    fiber = {source for source, value in blockers.items() if value == first_apex}
    retained = result["retained_frontier_pair"]
    strict_pair = result["strict_cap_pair"]
    return {
        "region": regions[center],
        "in_blocker_image": center in blocker_preimages,
        "blocker_preimage_card": len(blocker_preimages.get(center, [])),
        "in_first_apex_exact_class": center in exact_class,
        "is_first_apex_fiber_source": center in fiber,
        "is_retained_q": center == retained["q"],
        "is_retained_w": center == retained["w"],
        "is_strict_pair_q": center == strict_pair["q"],
        "is_strict_pair_w": center == strict_pair["w"],
    }


def normalized_center_role(signature: dict[str, Any]) -> tuple[Any, ...]:
    return (
        signature["region"],
        signature["in_blocker_image"],
        signature["blocker_preimage_card"],
        signature["in_first_apex_exact_class"],
        signature["is_first_apex_fiber_source"],
        signature["is_retained_q"],
        signature["is_retained_w"],
        signature["is_strict_pair_q"],
        signature["is_strict_pair_w"],
    )


def classify_round(round_dir: Path) -> dict[str, Any]:
    result_path = round_dir / "result.json"
    curvature_path = round_dir / "curvature.json"
    installed_path = round_dir / "installed_core.json"
    result = read_json(result_path)
    curvature = read_json(curvature_path)
    installed = read_json(installed_path)

    if result["solver_status"] != "SAT" or curvature["solver_status"] != "UNSAT":
        raise AssertionError("only completed SAT/curvature-UNSAT rounds are classifiable")
    if not curvature["all_checked_terminal_witnesses_replayed"]:
        raise AssertionError("curvature terminal witnesses were not all replayed")
    minimal_sets = curvature["four_checked_terminal_inclusion_minimal_center_sets"]
    if len(minimal_sets) != installed["inclusion_minimal_supporting_center_set_count"]:
        raise AssertionError("installed-core/minimal-center-set count mismatch")

    regions = strict_cap_regions(result)
    blockers = {int(source): int(center) for source, center in result["blockers"].items()}
    blocker_preimages: dict[int, list[int]] = defaultdict(list)
    for source, center in blockers.items():
        blocker_preimages[center].append(source)
    triangles = mutual_triangles(result)
    rows_by_center = {
        int(center): set(row) for center, row in result["rows"].items()
    }

    classified = []
    for packet in minimal_sets:
        centers = sorted(packet["centers"])
        center_set = set(centers)
        signatures = {
            str(center): center_signature(
                center,
                result=result,
                regions=regions,
                blocker_preimages=blocker_preimages,
            )
            for center in centers
        }
        internal_triangles = [
            triangle
            for triangle in triangles
            if {triangle["anchor"], triangle["middle"], triangle["blocker"]}
            <= center_set
        ]
        role_schema = sorted(normalized_center_role(value) for value in signatures.values())
        induced_memberships = [
            [center, target]
            for center in centers
            for target in centers
            if center != target and target in rows_by_center[center]
        ]
        induced_blocker_map = {
            str(center): blockers[center] if blockers[center] in center_set else None
            for center in centers
        }
        classified.append(
            {
                "centers": centers,
                "center_count": len(centers),
                "terminal_kind": packet["terminal_kind"],
                "center_signatures": signatures,
                "blocker_image_center_count": sum(
                    value["in_blocker_image"] for value in signatures.values()
                ),
                "first_apex_fiber_source_count": sum(
                    value["is_first_apex_fiber_source"]
                    for value in signatures.values()
                ),
                "internal_complete_radius_mutual_triangles": internal_triangles,
                "internal_complete_radius_mutual_triangle_count": len(internal_triangles),
                "induced_selected_row_memberships": induced_memberships,
                "induced_blocker_map": induced_blocker_map,
                "normalized_role_schema": [list(role) for role in role_schema],
                "representative_witness": packet["representative_witness"],
            }
        )

    counts_by_center_count = Counter(packet["center_count"] for packet in classified)
    counts_by_terminal_kind = Counter(packet["terminal_kind"] for packet in classified)
    counts_by_image_card = Counter(packet["blocker_image_center_count"] for packet in classified)
    counts_by_fiber_source_card = Counter(
        packet["first_apex_fiber_source_count"] for packet in classified
    )
    counts_by_internal_triangle_card = Counter(
        packet["internal_complete_radius_mutual_triangle_count"]
        for packet in classified
    )
    schema_counts = Counter(
        json.dumps(packet["normalized_role_schema"], separators=(",", ":"))
        for packet in classified
    )

    rows = {int(center): set(row) for center, row in result["rows"].items()}
    blocker_image = set(blocker_preimages)
    local_stars = []
    for completion in sorted(set(result["boundary_order"]) - blocker_image):
        support = rows[completion]
        spoke_centers = {blockers[source] for source in support}
        allowed = {completion} | spoke_centers
        allowed_source_only = {completion} | support
        allowed_plus_first_apex = allowed | {result["first_apex"]}
        allowed_plus_support = allowed | support

        def completion_uses_both_sides(packet: dict[str, Any]) -> bool:
            sides = {
                arc["side"]
                for arc in packet["representative_witness"]
                if arc["center"] == completion
            }
            return sides == {"left", "right"}

        exact = [
            packet
            for packet in classified
            if set(packet["centers"]) <= allowed and completion_uses_both_sides(packet)
        ]
        with_first_apex = [
            packet
            for packet in classified
            if set(packet["centers"]) <= allowed_plus_first_apex
            and completion_uses_both_sides(packet)
        ]
        with_support = [
            packet
            for packet in classified
            if set(packet["centers"]) <= allowed_plus_support
            and completion_uses_both_sides(packet)
        ]
        source_only = [
            packet
            for packet in classified
            if set(packet["centers"]) <= allowed_source_only
            and completion_uses_both_sides(packet)
        ]

        def support_or_blocker_explanations(packet: dict[str, Any]) -> dict[str, Any]:
            other_centers = sorted(set(packet["centers"]) - {completion})
            explanations = {
                str(center): [
                    {"support_source": source, "role": role}
                    for source in sorted(support)
                    for role in ("source", "blocker")
                    if (role == "source" and center == source)
                    or (role == "blocker" and center == blockers[source])
                ]
                for center in other_centers
            }
            distinct = []
            if len(other_centers) == 2:
                left, right = other_centers
                for left_reason in explanations[str(left)]:
                    for right_reason in explanations[str(right)]:
                        if left_reason["support_source"] != right_reason["support_source"]:
                            distinct.append(
                                {
                                    str(left): left_reason,
                                    str(right): right_reason,
                                }
                            )
            return {
                "centers": packet["centers"],
                "terminal_kind": packet["terminal_kind"],
                "explanations": explanations,
                "distinct_support_source_explanation_exists": bool(distinct),
                "first_distinct_support_source_explanation": distinct[0] if distinct else None,
            }

        blocker_repairs = sorted(
            (
                {
                    "centers": packet["centers"],
                    "terminal_kind": packet["terminal_kind"],
                    "added_blocker_centers": sorted(
                        set(packet["centers"]) - allowed_source_only
                    ),
                    "added_blocker_sources": {
                        str(center): sorted(
                            source for source in support if blockers[source] == center
                        )
                        for center in sorted(set(packet["centers"]) - allowed_source_only)
                    },
                }
                for packet in with_support
                if not set(packet["centers"]) <= allowed_source_only
            ),
            key=lambda item: (
                len(item["added_blocker_centers"]),
                len(item["centers"]),
                item["centers"],
            ),
        )
        unrestricted_center = [
            packet for packet in classified if completion_uses_both_sides(packet)
        ]
        closest = sorted(
            (
                {
                    "centers": packet["centers"],
                    "terminal_kind": packet["terminal_kind"],
                    "extra_centers_beyond_star": sorted(set(packet["centers"]) - allowed),
                    "extra_centers_beyond_star_plus_first_apex": sorted(
                        set(packet["centers"]) - allowed_plus_first_apex
                    ),
                }
                for packet in unrestricted_center
            ),
            key=lambda item: (
                len(item["extra_centers_beyond_star_plus_first_apex"]),
                len(item["extra_centers_beyond_star"]),
                len(item["centers"]),
                item["centers"],
            ),
        )
        local_stars.append(
            {
                "completion_center": completion,
                "completion_support": sorted(support),
                "support_blocker_centers": sorted(spoke_centers),
                "allowed_centers": sorted(allowed),
                "allowed_source_only_centers": sorted(allowed_source_only),
                "allowed_centers_plus_first_apex": sorted(allowed_plus_first_apex),
                "allowed_centers_plus_completion_support": sorted(allowed_plus_support),
                "terminal_count": len(exact),
                "source_only_terminal_count": len(source_only),
                "terminal_count_plus_first_apex": len(with_first_apex),
                "terminal_count_plus_completion_support": len(with_support),
                "unrestricted_completion_terminal_count": len(unrestricted_center),
                "terminals": [
                    {"centers": packet["centers"], "terminal_kind": packet["terminal_kind"]}
                    for packet in exact
                ],
                "source_only_terminals": [
                    {"centers": packet["centers"], "terminal_kind": packet["terminal_kind"]}
                    for packet in source_only
                ],
                "terminals_plus_first_apex": [
                    {"centers": packet["centers"], "terminal_kind": packet["terminal_kind"]}
                    for packet in with_first_apex
                ],
                "terminals_plus_completion_support": [
                    support_or_blocker_explanations(packet)
                    for packet in with_support
                ],
                "closest_unrestricted_completion_terminal": closest[0] if closest else None,
                "first_blocker_repair_of_source_only_star": (
                    blocker_repairs[0] if blocker_repairs else None
                ),
            }
        )
    return {
        "round": int(round_dir.name.removeprefix("round_")),
        "opp1_card": result["opp1_card"],
        "n": result["n"],
        "input_hashes": {
            "result.json": sha256(result_path),
            "curvature.json": sha256(curvature_path),
            "installed_core.json": sha256(installed_path),
        },
        "fixed_roles": {
            "first_apex": result["first_apex"],
            "second_apex": result["second_apex"],
            "surplus_vertex": result["surplus_vertex"],
            "first_apex_exact_class": result["first_apex_exact_class"],
            "first_apex_blocker_fiber": sorted(
                source for source, center in blockers.items() if center == result["first_apex"]
            ),
            "retained_frontier_pair": result["retained_frontier_pair"],
            "strict_cap_pair": result["strict_cap_pair"],
            "blocker_image": sorted(blocker_preimages),
            "physical_regions": {str(point): region for point, region in regions.items()},
        },
        "complete_radius_mutual_triangles": triangles,
        "complete_radius_mutual_triangle_count": len(triangles),
        "minimal_terminal_count": len(classified),
        "counts_by_center_count": dict(sorted(counts_by_center_count.items())),
        "counts_by_terminal_kind": dict(sorted(counts_by_terminal_kind.items())),
        "counts_by_blocker_image_center_count": dict(sorted(counts_by_image_card.items())),
        "counts_by_first_apex_fiber_source_count": dict(
            sorted(counts_by_fiber_source_card.items())
        ),
        "counts_by_internal_complete_radius_mutual_triangle_count": dict(
            sorted(counts_by_internal_triangle_card.items())
        ),
        "normalized_role_schema_counts": dict(sorted(schema_counts.items())),
        "omitted_blocker_image_completion_local_stars": local_stars,
        "local_star_terminal_exists": any(star["terminal_count"] for star in local_stars),
        "source_only_local_star_terminal_exists": any(
            star["source_only_terminal_count"] for star in local_stars
        ),
        "local_star_plus_first_apex_terminal_exists": any(
            star["terminal_count_plus_first_apex"] for star in local_stars
        ),
        "local_star_plus_completion_support_terminal_exists": any(
            star["terminal_count_plus_completion_support"] for star in local_stars
        ),
        "minimal_terminals": classified,
    }


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("run_dirs", nargs="+", type=Path)
    parser.add_argument("--output", required=True, type=Path)
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()

    runs = []
    for run_dir in args.run_dirs:
        manifest_path = run_dir / "manifest.json"
        manifest = read_json(manifest_path)
        rounds = []
        for summary in manifest["rounds"]:
            number = int(summary["round"])
            round_dir = run_dir / f"round_{number:03d}"
            if not round_dir.is_dir():
                raise AssertionError(f"manifest names missing round directory: {round_dir}")
            classified = classify_round(round_dir)
            if classified["minimal_terminal_count"] != summary[
                "inclusion_minimal_supporting_center_set_count"
            ]:
                raise AssertionError("manifest/minimal-center-set count mismatch")
            rounds.append(classified)
        runs.append(
            {
                "run_dir": str(run_dir),
                "manifest_sha256": sha256(manifest_path),
                "opp1_card": manifest["opp1_card"],
                "terminal_status": manifest["terminal_status"],
                "completed_round_count": len(rounds),
                "rounds": rounds,
            }
        )

    all_rounds = [round_data for run in runs for round_data in run["rounds"]]
    all_terminals = [
        packet for round_data in all_rounds for packet in round_data["minimal_terminals"]
    ]
    physical_region_center_occurrences = Counter(
        signature["region"]
        for packet in all_terminals
        for signature in packet["center_signatures"].values()
    )
    output = {
        "schema": "p97-unique4-corrected-curvature-terminal-census-v2",
        "epistemic_status": "EXACT FINITE REPLAY OF PUBLISHED CHECKED TERMINALS",
        "claim_scope": (
            "Historical 25-round prefix only in the named corrected n=11 CEGAR "
            "run directories; not a producer target, Euclidean realization result, "
            "or arbitrary-cardinality theorem.  A later direct-overlay SAT assignment "
            "has no four-arc terminal and supersedes the prefix-wide occurrence pattern."
        ),
        "historical_interpretation": {
            "support_or_blocker_local_star_status": "TRANSIENT_25_ROUND_PREFIX_ONLY",
            "producer_target_status": "REJECTED_BY_DIRECT_OVERLAY_SAT_PROJECTION",
            "next_action": (
                "Refine the direct overlay with the already-proved selected-row "
                "own-cap two-hit and cap-endpoint one-hit bounds, then rerun."
            ),
        },
        "census_source_sha256": sha256(Path(__file__)),
        "runs": runs,
        "aggregate": {
            "completed_round_count": len(all_rounds),
            "minimal_terminal_count": len(all_terminals),
            "counts_by_center_count": dict(
                sorted(Counter(packet["center_count"] for packet in all_terminals).items())
            ),
            "counts_by_terminal_kind": dict(
                sorted(Counter(packet["terminal_kind"] for packet in all_terminals).items())
            ),
            "counts_by_blocker_image_center_count": dict(
                sorted(
                    Counter(
                        packet["blocker_image_center_count"] for packet in all_terminals
                    ).items()
                )
            ),
            "counts_by_first_apex_fiber_source_count": dict(
                sorted(
                    Counter(
                        packet["first_apex_fiber_source_count"] for packet in all_terminals
                    ).items()
                )
            ),
            "counts_by_internal_complete_radius_mutual_triangle_count": dict(
                sorted(
                    Counter(
                        packet["internal_complete_radius_mutual_triangle_count"]
                        for packet in all_terminals
                    ).items()
                )
            ),
            "physical_region_center_occurrences": dict(
                sorted(physical_region_center_occurrences.items())
            ),
            "blocker_only_local_star_covered_round_count": sum(
                round_data["local_star_terminal_exists"] for round_data in all_rounds
            ),
            "source_only_local_star_covered_round_count": sum(
                round_data["source_only_local_star_terminal_exists"]
                for round_data in all_rounds
            ),
            "blocker_only_plus_first_apex_covered_round_count": sum(
                round_data["local_star_plus_first_apex_terminal_exists"]
                for round_data in all_rounds
            ),
            "support_or_blocker_local_star_covered_round_count": sum(
                round_data["local_star_plus_completion_support_terminal_exists"]
                for round_data in all_rounds
            ),
            "support_or_blocker_local_star_covers_all_completed_rounds": all(
                round_data["local_star_plus_completion_support_terminal_exists"]
                for round_data in all_rounds
            ),
            "blocker_only_local_star_counterexample_rounds": [
                {"opp1_card": round_data["opp1_card"], "round": round_data["round"]}
                for round_data in all_rounds
                if not round_data["local_star_terminal_exists"]
            ],
            "source_only_local_star_counterexample_rounds": [
                {"opp1_card": round_data["opp1_card"], "round": round_data["round"]}
                for round_data in all_rounds
                if not round_data["source_only_local_star_terminal_exists"]
            ],
        },
    }

    # The stored artifact is a compact census, not a duplicate of every large
    # checked witness in the active run directories.  Input hashes plus this
    # deterministic classifier make the aggregate replayable.  The companion
    # schema analyzer reclassifies the round files read-only when detailed
    # per-terminal comparisons are needed.
    for round_data in all_rounds:
        del round_data["minimal_terminals"]
        del round_data["normalized_role_schema_counts"]

    # JSON object keys are strings.  Normalize before an in-memory equality
    # check so integer-valued Counter keys compare exactly with the stored
    # JSON representation.
    normalized_output = json.loads(json.dumps(output, sort_keys=True))

    if args.check:
        expected = read_json(args.output)
        if expected != normalized_output:
            raise AssertionError("stored census does not match completed run rounds")
    else:
        write_json(args.output, normalized_output)


if __name__ == "__main__":
    main()
