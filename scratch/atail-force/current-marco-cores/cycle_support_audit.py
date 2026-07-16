#!/usr/bin/env python3
"""Test whether current minimized UNIT cores reduce to blocker cycles."""

from __future__ import annotations

import argparse
import hashlib
import itertools
import json
import sys
from collections import Counter
from pathlib import Path
from typing import Any, Mapping, Sequence


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
QUERY = HERE.parent / "second_center_query"
ORACLE_DIR = HERE.parent / "second_center_metric_oracle"
SOURCE = QUERY / "formalized_core_shards_after_current_bank_checkpoint.json"
INPUTS = (
    QUERY
    / "formalized_core_shards_after_seven_point_six_circle_equality_checkpoint.json",
    QUERY
    / "formalized_core_shards_after_seven_point_six_circle_equality_rows7_checkpoint.json",
    QUERY
    / "formalized_core_shards_after_seven_point_six_circle_equality_rows8_checkpoint.json",
)
ORACLE_SOURCE = ORACLE_DIR / "oracle.py"
MINIMIZER_SOURCE = QUERY / "formalized_core_equality_minimizer.py"
OUTPUT = HERE / "cycle_support_checkpoint.json"
PINS = {
    SOURCE: "5b661a15f4dda8a6cd143f3737457f2733d23eca056defcbcd30872f629bcc1a",
    INPUTS[0]: "d9377d858e745e0bada518f56de7fdcbcdf5ff87ae11b4efd1222aeeb194a8b6",
    INPUTS[1]: "35dbe15fc74a5c6665b064932f36fd69601d82725f5c2f20d39ab44f90908550",
    INPUTS[2]: "4aca518fd0479f5ba8f02880000a72fb5bf4c8b4617e779ff52930ea24a8e23e",
    ORACLE_SOURCE: "b708722ce49f9d0f165facf20a911161815ce8018c5fc3760bf872dad6977a09",
    MINIMIZER_SOURCE: "727f580c32cfc8e82c9184dd5b130e91de6f647084b7de71f55de7b19d895f5c",
}

for path in (ROOT, QUERY, ORACLE_DIR):
    if str(path) not in sys.path:
        sys.path.insert(0, str(path))

import oracle  # noqa: E402
import formalized_core_equality_minimizer as minimizer  # noqa: E402
from cluster_formalized_core_shards import isomorphic  # noqa: E402
from cluster_shard_equality_cores import equality_closure  # noqa: E402


def digest(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def verify_pins() -> None:
    for path, expected in PINS.items():
        actual = digest(path)
        if actual != expected:
            raise RuntimeError(
                f"pinned source drift at {path}: expected {expected}, found {actual}"
            )


def crosscheck_summary(report: Mapping[str, object]) -> dict[str, str]:
    return {
        "status": str(report["status"]),
        "singular_qq": str(report["singular_qq"]["verdict"]),
        "msolve_qq_forward_variables": str(
            report["msolve_qq_forward_variables"]["verdict"]
        ),
        "msolve_qq_reverse_variables": str(
            report["msolve_qq_reverse_variables"]["verdict"]
        ),
    }


def hamiltonian_cycle(
    vertices: Sequence[int], edges: set[tuple[int, int]]
) -> tuple[int, ...] | None:
    ordered = tuple(sorted(vertices))
    start = ordered[0]
    for tail in itertools.permutations(point for point in ordered if point != start):
        cycle = (start,) + tail
        if all(
            (cycle[index], cycle[(index + 1) % len(cycle)]) in edges
            for index in range(len(cycle))
        ):
            return cycle
    return None


def load_unchanged_cases() -> tuple[dict[str, Any], ...]:
    source = json.loads(SOURCE.read_text(encoding="utf-8"))
    survivor_by_shard = {
        int(case["partition"]["shard_index"]): case["survivor"]
        for case in source["cases"]
    }
    cases = []
    for path in INPUTS:
        for case in json.loads(path.read_text(encoding="utf-8"))["cases"]:
            shard = int(case["shard_index"])
            survivor = survivor_by_shard[shard]
            if (
                str(case["source_witness_sha256"])
                != str(survivor["witness_sha256"])
            ):
                continue
            cases.append({"minimized": case, "survivor": survivor})
    cases.sort(key=lambda item: int(item["minimized"]["shard_index"]))
    if len(cases) != 16:
        raise RuntimeError(f"expected 16 unchanged exact-oracle cores, found {len(cases)}")
    return tuple(cases)


def build(call_timeout: float) -> dict[str, Any]:
    verify_pins()
    smokes = oracle.smoke_gates()
    if any(
        record[engine]["verdict"] != record["expected"]
        for record in smokes.values()
        for engine in ("singular", "msolve")
    ):
        raise RuntimeError("exact CAS smoke gate failed")
    variables = tuple(str(value) for value in oracle.variable_symbols(12))
    cases = []
    core_classes: list[dict[str, Any]] = []
    for item in load_unchanged_cases():
        minimized = item["minimized"]
        survivor = item["survivor"]
        shard = int(minimized["shard_index"])
        equalities = tuple(
            (
                int(record["center"]),
                int(record["left"]),
                int(record["right"]),
            )
            for record in minimized["minimization"]["retained_equalities"]
        )
        centers = tuple(sorted({center for center, _left, _right in equalities}))
        rows = {
            int(row["center"]): row for row in survivor["distinct_metric_rows"]
        }
        allowed = {
            (int(source), int(center))
            for center, row in rows.items()
            for source in row["support"]
        }
        mutual_pairs = tuple(
            (left, right)
            for left, right in itertools.combinations(centers, 2)
            if (left, right) in allowed and (right, left) in allowed
        )
        pair_checks = []
        for left, right in mutual_pairs:
            pair_rows = tuple(
                oracle.row_from_dict(rows[center]) for center in (left, right)
            )
            records = minimizer.equality_records(12, pair_rows)
            checked = minimizer.crosscheck(
                variables, records, timeout_s=call_timeout
            )
            pair_checks.append(
                {
                    "mutual_pair": [left, right],
                    "two_full_rows_crosscheck": crosscheck_summary(checked),
                }
            )

        closure = equality_closure(equalities)
        for class_record in core_classes:
            if isomorphic(closure, class_record["representative"]):
                class_record["shards"].append(shard)
                break
        else:
            core_classes.append({"representative": closure, "shards": [shard]})

        cycle = hamiltonian_cycle(centers, allowed)
        cases.append(
            {
                "shard_index": shard,
                "source_witness_sha256": survivor["witness_sha256"],
                "core_equality_count": len(equalities),
                "core_center_count": len(centers),
                "core_centers": list(centers),
                "contained_allowed_mutual_pair_count": len(mutual_pairs),
                "contained_allowed_mutual_pairs": [list(pair) for pair in mutual_pairs],
                "core_confined_to_one_mutual_pair": len(centers) == 2,
                "core_confined_to_directed_cycle_of_length_at_most_five": (
                    len(centers) <= 5 and cycle is not None
                ),
                "hamiltonian_allowed_blocker_cycle": (
                    None if cycle is None else list(cycle)
                ),
                "mutual_pair_row_checks": pair_checks,
            }
        )

    pair_statuses = Counter(
        check["two_full_rows_crosscheck"]["status"]
        for case in cases
        for check in case["mutual_pair_row_checks"]
    )
    return {
        "schema": "p97-atail-current-unit-core-blocker-cycle-audit-v1",
        "scope": {
            "fresh_current_bank_survivors": True,
            "unchanged_shards_with_existing_exact_oracle_minimization_only": True,
            "replacement_shards_not_yet_equality_oracle_probed": True,
            "allowed_edge_means_source_in_selected_exact_row_at_center": True,
            "trusted_exact_cas_pair_checks": True,
            "producer_proved": False,
        },
        "pinned_inputs": [
            {"path": str(path.relative_to(ROOT)), "sha256": expected}
            for path, expected in PINS.items()
        ],
        "replay": (
            "PYTHONPATH=. .venv/bin/python "
            "scratch/atail-force/current-marco-cores/"
            "cycle_support_audit.py --check"
        ),
        "smoke_gates": smokes,
        "case_count": len(cases),
        "core_center_count_histogram": {
            str(value): sum(case["core_center_count"] == value for case in cases)
            for value in sorted({case["core_center_count"] for case in cases})
        },
        "core_confined_to_mutual_pair_count": sum(
            bool(case["core_confined_to_one_mutual_pair"]) for case in cases
        ),
        "core_confined_to_directed_cycle_length_at_most_five_count": sum(
            bool(case["core_confined_to_directed_cycle_of_length_at_most_five"])
            for case in cases
        ),
        "cores_with_hamiltonian_allowed_cycle_count": sum(
            case["hamiltonian_allowed_blocker_cycle"] is not None for case in cases
        ),
        "contained_mutual_pair_count": sum(
            int(case["contained_allowed_mutual_pair_count"]) for case in cases
        ),
        "mutual_pair_two_row_status_histogram": dict(sorted(pair_statuses.items())),
        "exact_whole_core_isomorphism_class_count": len(core_classes),
        "repeated_exact_whole_core_classes": [
            sorted(record["shards"])
            for record in core_classes
            if len(record["shards"]) > 1
        ],
        "cases": cases,
    }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--check", action="store_true")
    parser.add_argument("--output", type=Path, default=OUTPUT)
    parser.add_argument("--call-timeout-seconds", type=float, default=8.0)
    args = parser.parse_args()
    rendered = json.dumps(
        build(args.call_timeout_seconds), indent=2, sort_keys=True
    ) + "\n"
    if args.check:
        if not args.output.exists() or args.output.read_text(encoding="utf-8") != rendered:
            raise SystemExit(f"stale checkpoint: {args.output}")
        print(f"PASS: {args.output}")
        return 0
    temporary = args.output.with_suffix(args.output.suffix + ".tmp")
    temporary.write_text(rendered, encoding="utf-8")
    temporary.replace(args.output)
    print(f"wrote {args.output}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
