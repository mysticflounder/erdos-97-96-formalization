#!/usr/bin/env python3
"""Re-solve and proof-check the first-pass cubes reported UNSAT.

The original per-cube profile did not retain proofs, so those verdicts cannot
participate in a coverage claim.  This script selects exactly those reported
UNSAT cubes, reconstructs their assumption CNFs from the pinned simplified
formula, and accepts UNSAT only after ``drat-trim`` replay.  Any SAT result
must extend through the pinned CaDiCaL stack and verify against the original
CNF.
"""

from __future__ import annotations

import argparse
import concurrent.futures
import json
from pathlib import Path

import preprocessed_cube_probe as pipeline
import recursive_recube as checker


HERE = Path(__file__).resolve().parent
ORIENTATIONS = checker.ORIENTATIONS


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--parent-results",
        type=Path,
        default=HERE / "artifacts/per-cube-probe/summary.json",
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
        default=HERE / "artifacts/first-pass-unsat-certification",
    )
    parser.add_argument("--solve-timeout-seconds", type=int, default=60)
    parser.add_argument("--proof-timeout-seconds", type=int, default=240)
    parser.add_argument("--workers", type=int, default=12)
    parser.add_argument(
        "--plan-only",
        action="store_true",
        help="validate hashes and print the selected cubes without solving",
    )
    args = parser.parse_args()
    if not 1 <= args.workers <= 24:
        raise SystemExit("workers must be in 1..24")
    args.output_dir.mkdir(parents=True, exist_ok=True)

    first_pass = json.loads(args.parent_results.read_text(encoding="utf-8"))
    selected = [item for item in first_pass["results"] if item["status"] == "UNSAT"]
    selected.sort(
        key=lambda item: (
            ORIENTATIONS.index(str(item["orientation"])),
            int(item["cube_index"]),
        )
    )
    by_orientation = {
        orientation: sum(item["orientation"] == orientation for item in selected)
        for orientation in ORIENTATIONS
    }
    if by_orientation != {"direct": 32, "mirror": 23}:
        raise AssertionError(f"first-pass UNSAT selection drift: {by_orientation}")

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
        if checker.sha256(simplified) != expected_simplified:
            raise AssertionError(f"{orientation} simplified CNF hash drift")
        if checker.sha256(original) != expected_original:
            raise AssertionError(f"{orientation} original CNF hash drift")
        if checker.sha256(extension) != preprocessing["extension_sha256"]:
            raise AssertionError(f"{orientation} extension stack hash drift")
        cnf_data[orientation] = checker.load_cnf(simplified)
        inputs[orientation] = {
            "original_cnf_path": str(original),
            "original_cnf_sha256": expected_original,
            "simplified_cnf_path": str(simplified),
            "simplified_cnf_sha256": expected_simplified,
            "extension_path": str(extension),
            "extension_sha256": preprocessing["extension_sha256"],
        }

    if args.plan_only:
        print(
            json.dumps(
                {
                    "selected_count": len(selected),
                    "selected_by_orientation": by_orientation,
                    "parent_results_sha256": checker.sha256(args.parent_results),
                    "inputs": inputs,
                },
                indent=2,
                sort_keys=True,
            )
        )
        return 0

    jobs: list[tuple[object, ...]] = []
    provenance: dict[tuple[str, int], dict[str, object]] = {}
    for item in selected:
        orientation = str(item["orientation"])
        cube_index = int(item["cube_index"])
        key = (orientation, cube_index)
        if key in provenance:
            raise AssertionError(f"duplicate first-pass cube {key}")
        provenance[key] = {
            "first_pass_status": item["status"],
            "first_pass_conflicts": item["conflicts"],
            "first_pass_config": item["config"],
        }
        variables, clauses, body = cnf_data[orientation]
        preprocessing = pipeline_summary["preprocessing"][orientation]
        partition = {
            "orientation": orientation,
            "parent_cube_index": cube_index,
            "parent_cube": [],
        }
        jobs.append(
            (
                partition,
                0,
                tuple(int(value) for value in item["cube"]),
                variables,
                clauses,
                body,
                Path(preprocessing["simplified_cnf_path"]),
                args.cnf_dir / f"{orientation}.cnf",
                Path(preprocessing["extension_path"]),
                args.output_dir,
                args.solve_timeout_seconds,
                args.proof_timeout_seconds,
            )
        )

    results: list[dict[str, object]] = []
    with concurrent.futures.ThreadPoolExecutor(max_workers=args.workers) as pool:
        futures = [pool.submit(checker.solve_child, *job) for job in jobs]
        for count, future in enumerate(
            concurrent.futures.as_completed(futures), start=1
        ):
            result = future.result()
            key = (str(result["orientation"]), int(result["parent_cube_index"]))
            result.update(provenance[key])
            results.append(result)
            print(
                f"certify [{count}/{len(jobs)}] {result['orientation']} "
                f"cube {result['parent_cube_index']:03d}: {result['status']} "
                f"solver={result['solver_status']}",
                flush=True,
            )
    results.sort(
        key=lambda item: (
            ORIENTATIONS.index(str(item["orientation"])),
            int(item["parent_cube_index"]),
        )
    )
    status_counts = {
        status: sum(item["status"] == status for item in results)
        for status in ("SAT", "UNSAT", "UNKNOWN")
    }
    summary = {
        "schema": "p97-exact5-card13-distinct-first-pass-certification-v1",
        "epistemic_status": "EXTERNAL_EXACT_PARENT_CNF_VERDICTS",
        "scope": "exactly the 55 first-pass cubes previously reported UNSAT",
        "parent_results_path": str(args.parent_results),
        "parent_results_sha256": checker.sha256(args.parent_results),
        "selected_count": len(selected),
        "selected_by_orientation": by_orientation,
        "workers": args.workers,
        "solve_timeout_seconds": args.solve_timeout_seconds,
        "proof_timeout_seconds": args.proof_timeout_seconds,
        "inputs": inputs,
        "status_counts": status_counts,
        "coverage_status": (
            "ALL_SELECTED_DRAT_VERIFIED"
            if status_counts == {"SAT": 0, "UNSAT": len(selected), "UNKNOWN": 0}
            else "INCOMPLETE"
        ),
        "no_global_unsat_claim_reason": (
            "this run covers only the first-pass UNSAT cells; unresolved "
            "first- and second-level subtrees remain separate"
        ),
        "results": results,
    }
    summary_path = args.output_dir / "summary.json"
    summary_path.write_text(
        json.dumps(summary, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )
    print(
        json.dumps(
            {
                "status_counts": status_counts,
                "coverage_status": summary["coverage_status"],
                "summary_path": str(summary_path),
            },
            indent=2,
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
