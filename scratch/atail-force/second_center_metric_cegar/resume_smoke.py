#!/usr/bin/env python3
"""Deterministic smoke test: resume-to-2 equals fresh-2 on both placements."""

from __future__ import annotations

import argparse
import copy
import json
import sys
from pathlib import Path
from typing import Any, Sequence
from unittest.mock import patch


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
for path in (str(ROOT), str(HERE)):
    if path not in sys.path:
        sys.path.insert(0, path)

import cegar  # noqa: E402


SCHEMA = "p97-atail-second-center-metric-cegar-resume-smoke-v1"
DEFAULT_OUTPUT = HERE / "resume_smoke.json"


def fake_crosscheck(_n: int, _rows: Sequence[object]) -> dict[str, Any]:
    return {
        "status": "CROSSCHECKED_UNIT",
        "singular_qq": {"verdict": "UNIT"},
        "msolve_qq_forward_variables": {"verdict": "UNIT"},
        "msolve_qq_reverse_variables": {"verdict": "UNIT"},
    }


def fake_minimize(
    _n: int, rows: Sequence[cegar.metric_oracle.MetricRow]
) -> dict[str, Any]:
    return {
        "strategy": "smoke-retain-full-row-set",
        "wall_budget_seconds": 0.0,
        "initial_row_count": len(rows),
        "retained_row_count": len(rows),
        "attempts": [],
        "retained_rows": [cegar.row_dict(row) for row in rows],
    }


def fake_smoke_gates() -> dict[str, Any]:
    return {
        "known_unit": {
            "expected": "UNIT",
            "singular": {"verdict": "UNIT"},
            "msolve": {"verdict": "UNIT"},
        },
        "known_nonunit": {
            "expected": "NONUNIT",
            "singular": {"verdict": "NONUNIT"},
            "msolve": {"verdict": "NONUNIT"},
        },
    }


def build_document() -> dict[str, Any]:
    with (
        patch.object(cegar, "exact_crosscheck", fake_crosscheck),
        patch.object(cegar, "bounded_minimize_unit", fake_minimize),
        patch.object(cegar.metric_oracle, "smoke_gates", fake_smoke_gates),
    ):
        fresh = cegar.build_document(max_rounds=2)
        prefix = copy.deepcopy(fresh)
        prefix["budgets"]["max_rounds_per_case"] = 1
        for case in prefix["cases"]:
            case["rounds"] = case["rounds"][:1]
            case["final_status"] = "STOPPED_ROUND_BUDGET"
        prefix_sha256 = cegar.canonical_sha256(prefix)
        resumed = cegar.build_document(
            resume=prefix,
            resume_checkpoint_sha256=prefix_sha256,
            max_rounds=2,
        )
    if resumed["cases"] != fresh["cases"]:
        raise AssertionError("resumed smoke cases differ from fresh discovery")
    if resumed["source"]["resumed_checkpoint_sha256"] != prefix_sha256:
        raise AssertionError("resume source hash is not preserved")
    if resumed["source"]["resumed_round_budget_per_case"] != 1:
        raise AssertionError("resume source budget is not preserved")
    return {
        "schema": SCHEMA,
        "method": {
            "fresh_round_budget_per_case": 2,
            "prefix_round_budget_per_case": 1,
            "oracle": "deterministic smoke oracle returning crosschecked UNIT",
            "minimizer": "deterministic full-row retention",
            "incidence_solver": "production deterministic DFS",
        },
        "prefix_checkpoint_canonical_sha256": prefix_sha256,
        "fresh_cases_sha256": cegar.canonical_sha256(fresh["cases"]),
        "resumed_cases_sha256": cegar.canonical_sha256(resumed["cases"]),
        "case_profiles": [case["profile"] for case in fresh["cases"]],
        "status": "RESUMED_CASES_EQUAL_FRESH_CASES",
        "scope": {
            "production_cas_replayed": False,
            "production_incidence_solver_used": True,
            "resume_prefix_replayed": True,
            "resume_source_hash_bound": True,
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
            raise AssertionError("resume smoke checkpoint drift")
    else:
        args.output.write_text(rendered, encoding="utf-8")
    print(
        json.dumps(
            {
                "output": str(args.output),
                "sha256": cegar.file_sha256(args.output),
                "status": document["status"],
            },
            indent=2,
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
