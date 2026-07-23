#!/usr/bin/env python3
"""Audit how essential joint late choice is in the pinned exact-two records."""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import json
from collections import Counter
from pathlib import Path
from types import ModuleType
from typing import Any


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
PRIOR_SCRIPT = (
    HERE.parent / "unique4-three-row-occurrence-producer" /
    "audit_three_row_occurrence.py"
)
POSITIVE_ROOT = (
    HERE.parent / "unique-arm-whole-carrier-source-audit" / "cegar-exact-two"
)
ROUND20 = (
    HERE.parent / "unique-arm-whole-carrier-source-audit" / "cegar" /
    "round_020" / "opp1_4.result.json"
)


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def load_prior() -> ModuleType:
    spec = importlib.util.spec_from_file_location("three_row_audit", PRIOR_SCRIPT)
    if spec is None or spec.loader is None:
        raise RuntimeError(PRIOR_SCRIPT)
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def audit_record(path: Path, prior: ModuleType) -> dict[str, Any]:
    payload = json.loads(path.read_text())
    n = int(payload["n"])
    rows = prior.rows_from_payload(payload)
    witnesses = prior.four_disjoint_witnesses(rows, n)
    image = set(map(int, payload["blockers"].values()))
    omitted = set(range(n)) - image
    desired = prior.desired_three_row_witnesses(
        witnesses, image, fixed_left_only=False
    )
    favorable_completions: set[int] = set()
    favorable_fixed_pairs: set[tuple[int, int]] = set()
    favorable_joint_choices: set[tuple[int, int, int]] = set()
    for witness in desired:
        counts = Counter(int(arc["center"]) for arc in witness)
        completion = next(center for center, count in counts.items() if count == 2)
        fixed = tuple(sorted(center for center, count in counts.items() if count == 1))
        favorable_completions.add(completion)
        favorable_fixed_pairs.add(fixed)
        favorable_joint_choices.add((completion, *fixed))
    all_image_pairs = {
        tuple(sorted(pair))
        for pair in __import__("itertools").combinations(sorted(image), 2)
    }
    return {
        "source": str(path.relative_to(ROOT)),
        "sha256": sha256(path),
        "blocker_image": sorted(image),
        "omitted_centers": sorted(omitted),
        "favorable_omitted_completion_centers": sorted(favorable_completions),
        "unfavorable_omitted_completion_centers": sorted(
            omitted - favorable_completions
        ),
        "every_omitted_center_favorable": omitted <= favorable_completions,
        "fixed_image_pair_count": len(all_image_pairs),
        "favorable_fixed_image_pairs": [list(pair) for pair in sorted(favorable_fixed_pairs)],
        "unfavorable_fixed_image_pair_count": len(all_image_pairs - favorable_fixed_pairs),
        "every_fixed_image_pair_favorable": all_image_pairs <= favorable_fixed_pairs,
        "favorable_joint_choice_count": len(favorable_joint_choices),
    }


def build_report() -> dict[str, Any]:
    prior = load_prior()
    records = [
        audit_record(path, prior)
        for path in sorted(POSITIVE_ROOT.glob("round_*/opp1_*.result.json"))
    ]
    round20 = audit_record(ROUND20, prior)
    return {
        "epistemic_status": "EXACT_FINITE_REPLAY_OF_EXPORTED_SELECTED_ROWS",
        "scope_warning": (
            "Not Euclidean realizability and not coverage of every possible global-K4 row"
        ),
        "prior_audit_script": str(PRIOR_SCRIPT.relative_to(ROOT)),
        "prior_audit_script_sha256": sha256(PRIOR_SCRIPT),
        "record_count": len(records),
        "some_record_refutes_every_omitted_center": any(
            not record["every_omitted_center_favorable"] for record in records
        ),
        "some_record_refutes_every_fixed_image_pair": any(
            not record["every_fixed_image_pair_favorable"] for record in records
        ),
        "records": records,
        "round20_full_partition_projection": round20,
    }


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--output", type=Path, default=HERE / "late_choice_audit.json")
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    rendered = json.dumps(build_report(), indent=2, sort_keys=True) + "\n"
    if args.check:
        if not args.output.exists() or args.output.read_text() != rendered:
            raise SystemExit("late-choice audit artifact is stale")
        print("late-choice audit artifact matches exact replay")
        return
    args.output.write_text(rendered)
    print(rendered, end="")


if __name__ == "__main__":
    main()
