#!/usr/bin/env python3
"""Classify saved metric-CEGAR UNIT cuts against the current Lean core bank."""

from __future__ import annotations

import json
import sys
from pathlib import Path


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
CEGAR_DIR = HERE.parent / "second_center_metric_cegar"
for path in (str(ROOT), str(CEGAR_DIR), str(HERE)):
    if path in sys.path:
        sys.path.remove(path)
    sys.path.insert(0, path)

import cegar  # noqa: E402
from census.global_confinement.metric_realizability_probe import (  # noqa: E402
    _formalized_metric_core,
)
from census.global_confinement.shadow import hull_order  # noqa: E402


def main() -> int:
    saved = json.loads(cegar.CHECKPOINT.read_text(encoding="utf-8"))
    problems = {
        problem.profile: problem
        for problem in (
            cegar.build_problem(seed)
            for seed in cegar.metric_oracle.source_query.CASE_SEEDS
        )
    }
    cases = []
    for case in saved["cases"]:
        profile = tuple(int(value) for value in case["profile"])
        problem = problems[profile]
        order = tuple(hull_order(problem.frame))
        cuts = []
        for source, cut in [
            ("bootstrap", case["bootstrap_cut"]),
            *(
                (f"round-{round_record['round']}", round_record["accepted_cut"])
                for round_record in case["rounds"]
                if "accepted_cut" in round_record
            ),
        ]:
            rows = tuple(
                cegar.decode_metric_row(str(record)) for record in cut["rows"]
            )
            cuts.append(
                {
                    "source": source,
                    "row_count": len(rows),
                    "row_set_sha256": cut["row_set_sha256"],
                    "formalized_core": _formalized_metric_core(
                        rows, problem.frame.n, order
                    ),
                }
            )
        cases.append({"profile": list(profile), "cuts": cuts})
    print(json.dumps({"schema": "p97-atail-saved-cegar-cut-classification-v1", "cases": cases},
                     indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
