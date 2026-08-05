"""Boolean pilot for the banked adjacent-cap frontier singleton theorem.

For the endpoint witness ``J``, the whole retained first-apex radius class
meets the selected left or right adjacent closed cap in exactly ``{J}``.
This is stronger than selected-row alternation and was absent from v35/v36.
"""

from __future__ import annotations

import argparse
import json
import multiprocessing
import time
from concurrent.futures import ProcessPoolExecutor

import round5_cegar_v12 as v12
import round5_cegar_v35 as v35
import v36_selected_row_alternation_pilot as v36
import z3

ADJACENT_FRONTIER_SINGLETON_FAMILY = (
    "endpoint_frontier_radius_class_adjacent_cap_singleton"
)


class Encoding(v36.Encoding):
    def _build_normal_form(self) -> None:
        super()._build_normal_form()
        frontier = self.rich[0, 0]["support"]
        assert isinstance(frontier, list)
        for j, j_selected in self.endpoint_j.items():
            branch = next(
                (branch for branch in v36.ADJACENT_BRANCHES if j in branch),
                None,
            )
            if branch is None:
                continue
            for point in branch:
                if point != j:
                    self.add(
                        ADJACENT_FRONTIER_SINGLETON_FAMILY,
                        z3.Implies(j_selected, z3.Not(frontier[point])),
                    )


def probe_case(case: v35.Case, timeout_ms: int) -> dict[str, object]:
    started = time.monotonic()
    encoding = Encoding(
        case,
        timeout_ms=timeout_ms,
        seed=1,
        pairwise=True,
        force_producer=True,
    )
    solver, audit = v12.build_boolean_relaxation(encoding, timeout_ms, seed=1)
    outcome = solver.check()
    return {
        "case_id": case.case_id,
        "status": str(outcome),
        "reason": solver.reason_unknown() if outcome == z3.unknown else None,
        "elapsed_seconds": time.monotonic() - started,
        "included_constraints": audit.included_total,
        "adjacent_frontier_singleton_constraints": len(
            encoding.groups[ADJACENT_FRONTIER_SINGLETON_FAMILY]
        ),
    }


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--timeout-ms", type=int, default=120_000)
    parser.add_argument("--workers", type=int, choices=range(1, 25), default=12)
    args = parser.parse_args()
    cases = v35.hard_canary_cases("DDD")
    with ProcessPoolExecutor(
        max_workers=min(args.workers, len(cases)),
        mp_context=multiprocessing.get_context("spawn"),
    ) as executor:
        futures = [
            executor.submit(probe_case, case, args.timeout_ms) for case in cases
        ]
        results = [future.result() for future in futures]
    print(
        json.dumps(
            {
                "contract": {
                    "pairwise_selected_row_alternation": True,
                    "forced_hypothetical_branch_two_hit_producer": True,
                    "banked_adjacent_frontier_singleton": True,
                },
                "counts": {
                    status: sum(result["status"] == status for result in results)
                    for status in ("sat", "unsat", "unknown")
                },
                "elapsed_seconds": sum(
                    float(result["elapsed_seconds"]) for result in results
                ),
                "results": results,
            },
            indent=2,
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
