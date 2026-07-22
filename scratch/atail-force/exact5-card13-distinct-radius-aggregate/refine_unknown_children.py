#!/usr/bin/env python3
"""Refine the verified first-level UNKNOWN children by one further cube level.

The input is the summary emitted by ``recursive_recube.py``.  Only children
whose independently checked status is ``UNKNOWN`` are selected.  Every new
cube is solved against the same pinned simplified CNF, and the acceptance
rules remain unchanged: SAT must extend to a model of the original CNF, while
UNSAT must replay through ``drat-trim``.

This is a bounded external search.  It does not claim source-to-CNF ingress or
global UNSAT coverage.
"""

from __future__ import annotations

import argparse
import concurrent.futures
import json
from pathlib import Path

import preprocessed_cube_probe as pipeline
import recursive_recube as level_one


HERE = Path(__file__).resolve().parent
ORIENTATIONS = level_one.ORIENTATIONS


def composite_index(parent_index: int, child_index: int) -> int:
    """Inject a first-level parent/child pair into one stable integer."""

    if not 0 <= child_index < 100:
        raise AssertionError("first-level child index must be below 100")
    return parent_index * 100 + child_index


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--previous-summary",
        type=Path,
        default=HERE / "artifacts/recursive-recubing/summary.json",
    )
    parser.add_argument(
        "--pipeline-dir",
        type=Path,
        default=HERE / "artifacts/preprocessed-cube-probe",
    )
    parser.add_argument("--cnf-dir", type=Path, default=HERE / "artifacts")
    parser.add_argument(
        "--output-dir",
        type=Path,
        default=HERE / "artifacts/recursive-recubing-level2",
    )
    parser.add_argument("--child-depth", type=int, default=3)
    parser.add_argument("--child-limit", type=int, default=8)
    parser.add_argument("--recube-timeout-seconds", type=int, default=90)
    parser.add_argument("--solve-timeout-seconds", type=int, default=30)
    parser.add_argument("--proof-timeout-seconds", type=int, default=180)
    parser.add_argument("--workers", type=int, default=12)
    parser.add_argument(
        "--plan-only",
        action="store_true",
        help="validate inputs and print the selected frontier without solving",
    )
    args = parser.parse_args()
    if not 1 <= args.workers <= 24:
        raise SystemExit("workers must be in 1..24")
    if not 1 <= args.child_limit <= 64:
        raise SystemExit("child limit must be in 1..64")
    args.output_dir.mkdir(parents=True, exist_ok=True)

    previous = json.loads(args.previous_summary.read_text(encoding="utf-8"))
    if previous.get("schema") != "p97-exact5-card13-distinct-recursive-recubing-v1":
        raise AssertionError("unexpected first-level summary schema")
    unresolved = [
        item for item in previous["children"] if item["status"] == "UNKNOWN"
    ]
    unresolved.sort(
        key=lambda item: (
            ORIENTATIONS.index(str(item["orientation"])),
            int(item["parent_cube_index"]),
            int(item["child_cube_index"]),
        )
    )
    expected_unknown = previous["child_status_counts"]["UNKNOWN"]
    if len(unresolved) != expected_unknown:
        raise AssertionError(
            f"UNKNOWN count drift: {len(unresolved)} != {expected_unknown}"
        )

    lineage: dict[tuple[str, int], dict[str, int]] = {}
    parents: list[dict[str, object]] = []
    for item in unresolved:
        orientation = str(item["orientation"])
        first_parent = int(item["parent_cube_index"])
        first_child = int(item["child_cube_index"])
        index = composite_index(first_parent, first_child)
        key = (orientation, index)
        if key in lineage:
            raise AssertionError(f"duplicate unresolved lineage {key}")
        lineage[key] = {
            "first_level_parent_index": first_parent,
            "first_level_child_index": first_child,
        }
        parents.append(
            {
                "orientation": orientation,
                "cube_index": index,
                "cube": item["combined_assumptions"],
                "status": item["status"],
                "conflicts": item["conflicts"],
            }
        )

    pipeline_summary = json.loads(
        (args.pipeline_dir / "summary.json").read_text(encoding="utf-8")
    )
    inputs: dict[str, dict[str, object]] = {}
    cnf_data: dict[str, tuple[int, int, str]] = {}
    for orientation in ORIENTATIONS:
        preprocessing = pipeline_summary["preprocessing"][orientation]
        simplified = Path(preprocessing["simplified_cnf_path"])
        original = args.cnf_dir / f"{orientation}.cnf"
        extension = Path(preprocessing["extension_path"])
        expected_simplified = preprocessing["simplified_cnf_inspection"]["sha256"]
        expected_original = preprocessing["original_cnf_inspection"]["sha256"]
        if level_one.sha256(simplified) != expected_simplified:
            raise AssertionError(f"{orientation} simplified CNF hash drift")
        if level_one.sha256(original) != expected_original:
            raise AssertionError(f"{orientation} original CNF hash drift")
        if level_one.sha256(extension) != preprocessing["extension_sha256"]:
            raise AssertionError(f"{orientation} extension stack hash drift")
        cnf_data[orientation] = level_one.load_cnf(simplified)
        inputs[orientation] = {
            "original_cnf_path": str(original),
            "original_cnf_sha256": expected_original,
            "simplified_cnf_path": str(simplified),
            "simplified_cnf_sha256": expected_simplified,
            "extension_path": str(extension),
            "extension_sha256": preprocessing["extension_sha256"],
        }

    if args.plan_only:
        counts = {
            orientation: sum(
                parent["orientation"] == orientation for parent in parents
            )
            for orientation in ORIENTATIONS
        }
        print(
            json.dumps(
                {
                    "selected_unknown_count": len(parents),
                    "selected_by_orientation": counts,
                    "previous_summary_sha256": level_one.sha256(
                        args.previous_summary
                    ),
                    "inputs": inputs,
                },
                indent=2,
                sort_keys=True,
            )
        )
        return 0

    partitions: list[dict[str, object]] = []
    with concurrent.futures.ThreadPoolExecutor(max_workers=args.workers) as pool:
        futures = []
        for parent in parents:
            orientation = str(parent["orientation"])
            variables, clauses, body = cnf_data[orientation]
            futures.append(
                pool.submit(
                    level_one.recube_parent,
                    parent,
                    variables,
                    clauses,
                    body,
                    args.output_dir,
                    args.child_depth,
                    args.child_limit,
                    args.recube_timeout_seconds,
                )
            )
        for count, future in enumerate(
            concurrent.futures.as_completed(futures), start=1
        ):
            result = future.result()
            key = (str(result["orientation"]), int(result["parent_cube_index"]))
            result.update(lineage[key])
            partitions.append(result)
            print(
                f"recube [{count}/{len(parents)}] {result['orientation']} "
                f"{result['first_level_parent_index']:03d}/"
                f"{result['first_level_child_index']:02d}: {result['status']} "
                f"children={result['child_cube_count']}",
                flush=True,
            )
    partitions.sort(
        key=lambda item: (
            ORIENTATIONS.index(str(item["orientation"])),
            int(item["parent_cube_index"]),
        )
    )

    child_jobs: list[tuple[object, ...]] = []
    for partition in partitions:
        if partition["status"] != "PARTITIONED":
            continue
        orientation = str(partition["orientation"])
        variables, clauses, body = cnf_data[orientation]
        preprocessing = pipeline_summary["preprocessing"][orientation]
        simplified = Path(preprocessing["simplified_cnf_path"])
        original = args.cnf_dir / f"{orientation}.cnf"
        extension = Path(preprocessing["extension_path"])
        for child_index, raw_cube in enumerate(partition["child_cubes"]):
            child_jobs.append(
                (
                    partition,
                    child_index,
                    tuple(int(value) for value in raw_cube),
                    variables,
                    clauses,
                    body,
                    simplified,
                    original,
                    extension,
                    args.output_dir,
                    args.solve_timeout_seconds,
                    args.proof_timeout_seconds,
                )
            )

    child_results: list[dict[str, object]] = []
    with concurrent.futures.ThreadPoolExecutor(max_workers=args.workers) as pool:
        futures = [pool.submit(level_one.solve_child, *job) for job in child_jobs]
        for count, future in enumerate(
            concurrent.futures.as_completed(futures), start=1
        ):
            result = future.result()
            key = (str(result["orientation"]), int(result["parent_cube_index"]))
            result.update(lineage[key])
            child_results.append(result)
            print(
                f"solve [{count}/{len(child_jobs)}] {result['orientation']} "
                f"{result['first_level_parent_index']:03d}/"
                f"{result['first_level_child_index']:02d}/"
                f"{result['child_cube_index']:02d}: {result['status']}",
                flush=True,
            )
    child_results.sort(
        key=lambda item: (
            ORIENTATIONS.index(str(item["orientation"])),
            int(item["parent_cube_index"]),
            int(item["child_cube_index"]),
        )
    )

    subtrees: list[dict[str, object]] = []
    for partition in partitions:
        orientation = str(partition["orientation"])
        index = int(partition["parent_cube_index"])
        children = [
            item
            for item in child_results
            if item["orientation"] == orientation
            and int(item["parent_cube_index"]) == index
        ]
        if partition["status"] != "PARTITIONED":
            status = "UNKNOWN"
        elif any(item["status"] == "SAT" for item in children):
            status = "SAT"
        elif len(children) == partition["child_cube_count"] and all(
            item["status"] == "UNSAT" for item in children
        ):
            status = "UNSAT_CHILDREN_DRAT_VERIFIED"
        else:
            status = "UNKNOWN"
        subtrees.append(
            {
                "orientation": orientation,
                **lineage[(orientation, index)],
                "combined_first_level_assumptions": partition["parent_cube"],
                "partition_status": partition["status"],
                "child_count": len(children),
                "child_status_counts": {
                    verdict: sum(item["status"] == verdict for item in children)
                    for verdict in ("SAT", "UNSAT", "UNKNOWN")
                },
                "status": status,
            }
        )

    summary = {
        "schema": "p97-exact5-card13-distinct-recursive-recubing-level2-v1",
        "epistemic_status": "EXTERNAL_SECOND_LEVEL_REFINEMENT_ONLY",
        "scope": "exactly the checked UNKNOWN children in the input summary",
        "previous_summary_path": str(args.previous_summary),
        "previous_summary_sha256": level_one.sha256(args.previous_summary),
        "selected_unknown_count": len(parents),
        "workers": args.workers,
        "child_depth": args.child_depth,
        "child_limit": args.child_limit,
        "recube_timeout_seconds": args.recube_timeout_seconds,
        "solve_timeout_seconds_per_child": args.solve_timeout_seconds,
        "proof_timeout_seconds": args.proof_timeout_seconds,
        "inputs": inputs,
        "partition_status_counts": {
            status: sum(item["status"] == status for item in partitions)
            for status in ("PARTITIONED", "UNKNOWN")
        },
        "child_status_counts": {
            status: sum(item["status"] == status for item in child_results)
            for status in ("SAT", "UNSAT", "UNKNOWN")
        },
        "subtree_status_counts": {
            status: sum(item["status"] == status for item in subtrees)
            for status in ("SAT", "UNSAT_CHILDREN_DRAT_VERIFIED", "UNKNOWN")
        },
        "overall_status": (
            "SAT" if any(item["status"] == "SAT" for item in subtrees) else "UNKNOWN"
        ),
        "no_global_unsat_claim_reason": (
            "second-level refinement may leave UNKNOWN subtrees; first-pass "
            "UNSAT parents still require retained proof artifacts"
        ),
        "partitions": partitions,
        "children": child_results,
        "subtrees": subtrees,
    }
    summary_path = args.output_dir / "summary.json"
    summary_path.write_text(
        json.dumps(summary, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )
    print(
        json.dumps(
            {
                "selected_unknown_count": len(parents),
                "partition_status_counts": summary["partition_status_counts"],
                "child_status_counts": summary["child_status_counts"],
                "subtree_status_counts": summary["subtree_status_counts"],
                "overall_status": summary["overall_status"],
                "summary_path": str(summary_path),
            },
            indent=2,
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
