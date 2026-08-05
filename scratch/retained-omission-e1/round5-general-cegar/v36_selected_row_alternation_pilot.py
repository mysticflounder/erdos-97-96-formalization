"""Boolean pilot for selected-row cyclic separation over the v35 hard cases.

The v33 selected rows are genuine ``SelectedFourClass`` supports but are not
registered as full physical circles.  Consequently the inherited v8 circle
alternation bank does not apply to them.  This pilot adds exactly the banked
``selectedFourClass_shared_pair_separated`` consequence, first between the
first-apex selected row and each dynamic seed row, and optionally between all
pairs of dynamic seed rows.
"""

from __future__ import annotations

import argparse
import json
import multiprocessing
import time
from concurrent.futures import ProcessPoolExecutor

import round5_cegar_v8 as v8
import round5_cegar_v12 as v12
import round5_cegar_v35 as v35
import z3

FIRST_APEX = v8.APICES[0]
QROW_ALTERNATION_FAMILY = "endpoint_seed_qrow_selected_row_alternation"
PAIRWISE_ALTERNATION_FAMILY = "endpoint_seed_selected_rows_pairwise_alternation"
HYPOTHETICAL_PRODUCER_FAMILY = (
    "hypothetical_branch_localized_escaping_qrow_two_hit_producer"
)
ADJACENT_BRANCHES = tuple(
    tuple(point for point in v8.CLOSED_CAPS[index] if point != FIRST_APEX)
    for index in (1, 2)
)


def open_arcs(left: int, right: int) -> tuple[tuple[int, ...], tuple[int, ...]]:
    return (
        tuple(
            point
            for point in v8.POINTS
            if point not in {left, right} and v8.cyclic_between(left, right, point)
        ),
        tuple(
            point
            for point in v8.POINTS
            if point not in {left, right} and v8.cyclic_between(right, left, point)
        ),
    )


class Encoding(v35.Encoding):
    def __init__(
        self,
        case: v35.Case,
        timeout_ms: int,
        seed: int,
        *,
        pairwise: bool = False,
        force_producer: bool = False,
    ) -> None:
        self._pairwise_selected_rows = pairwise
        self._force_hypothetical_producer = force_producer
        super().__init__(case, timeout_ms, seed)

    def _build_normal_form(self) -> None:
        super()._build_normal_form()
        for center in v8.POINTS:
            if center == FIRST_APEX:
                continue
            for arc in open_arcs(FIRST_APEX, center):
                if len(arc) > 1:
                    self.add(
                        QROW_ALTERNATION_FAMILY,
                        v8.at_most(
                            [
                                z3.And(
                                    self.endpoint_qrow[point],
                                    self.endpoint_qsel[center, point],
                                )
                                for point in arc
                            ],
                            1,
                        ),
                    )

        if self._pairwise_selected_rows:
            for left in v8.POINTS:
                for right in v8.POINTS[left + 1 :]:
                    for arc in open_arcs(left, right):
                        if len(arc) > 1:
                            self.add(
                                PAIRWISE_ALTERNATION_FAMILY,
                                v8.at_most(
                                    [
                                        z3.And(
                                            self.endpoint_qsel[left, point],
                                            self.endpoint_qsel[right, point],
                                        )
                                        for point in arc
                                    ],
                                    1,
                                ),
                            )

        if self._force_hypothetical_producer:
            producer_cases: list[z3.BoolRef] = []
            for j, j_selected in self.endpoint_j.items():
                branch = next(
                    (branch for branch in ADJACENT_BRANCHES if j in branch),
                    None,
                )
                # The inherited selector retains the first-apex label, but
                # Q.row's center-not-in-support clauses force it false.
                if branch is None:
                    continue
                center_cases: list[z3.BoolRef] = []
                for center in branch:
                    overlap = [
                        z3.And(
                            self.endpoint_qsel[center, point],
                            self.endpoint_qrow[point],
                        )
                        for point in v8.POINTS
                    ]
                    escape = [
                        z3.And(
                            self.endpoint_qsel[center, point],
                            z3.Not(self.endpoint_seed[point]),
                        )
                        for point in v8.POINTS
                    ]
                    center_cases.append(
                        z3.And(
                            self.endpoint_seed[center],
                            v8.z3_or(escape),
                            z3.Not(v8.at_most(overlap, 1)),
                        )
                    )
                producer_cases.append(z3.And(j_selected, v8.z3_or(center_cases)))
            self.add(HYPOTHETICAL_PRODUCER_FAMILY, v8.z3_or(producer_cases))


def probe_case(
    case: v35.Case,
    timeout_ms: int,
    pairwise: bool,
    force_producer: bool,
) -> dict[str, object]:
    started = time.monotonic()
    encoding = Encoding(
        case,
        timeout_ms=timeout_ms,
        seed=1,
        pairwise=pairwise,
        force_producer=force_producer,
    )
    solver, audit = v12.build_boolean_relaxation(encoding, timeout_ms, seed=1)
    outcome = solver.check()
    model_summary: dict[str, object] | None = None
    if outcome == z3.sat:
        model = solver.model()

        def holds(term: z3.BoolRef) -> bool:
            return z3.is_true(model.eval(term, model_completion=True))

        qrow = [point for point in v8.POINTS if holds(encoding.endpoint_qrow[point])]
        common = [
            point for point in v8.POINTS if holds(encoding.endpoint_common[point])
        ]
        seed_points = [
            point for point in v8.POINTS if holds(encoding.endpoint_seed[point])
        ]
        selected_rows = []
        for center in seed_points:
            row = [
                point
                for point in v8.POINTS
                if holds(encoding.endpoint_qsel[center, point])
            ]
            selected_rows.append(
                {
                    "center": center,
                    "row": row,
                    "outside_seed": [point for point in row if point not in seed_points],
                    "qrow_overlap": [point for point in row if point in qrow],
                    "common_overlap": [point for point in row if point in common],
                }
            )
        model_summary = {
            "j": next(
                point
                for point, selected in encoding.endpoint_j.items()
                if holds(selected)
            ),
            "qrow": qrow,
            "common": common,
            "seed": seed_points,
            "selected_rows": selected_rows,
        }
    return {
        "case_id": case.case_id,
        "status": str(outcome),
        "reason": solver.reason_unknown() if outcome == z3.unknown else None,
        "elapsed_seconds": time.monotonic() - started,
        "included_constraints": audit.included_total,
        "qrow_alternation_constraints": len(
            encoding.groups[QROW_ALTERNATION_FAMILY]
        ),
        "pairwise_alternation_constraints": len(
            encoding.groups.get(PAIRWISE_ALTERNATION_FAMILY, ())
        ),
        "hypothetical_producer_constraints": len(
            encoding.groups.get(HYPOTHETICAL_PRODUCER_FAMILY, ())
        ),
        "model": model_summary,
    }


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--timeout-ms", type=int, default=120_000)
    parser.add_argument("--pairwise", action="store_true")
    parser.add_argument("--force-producer", action="store_true")
    parser.add_argument("--workers", type=int, choices=range(1, 25), default=12)
    args = parser.parse_args()
    cases = v35.hard_canary_cases("DDD")
    with ProcessPoolExecutor(
        max_workers=min(args.workers, len(cases)),
        mp_context=multiprocessing.get_context("spawn"),
    ) as executor:
        futures = [
            executor.submit(
                probe_case,
                case,
                args.timeout_ms,
                args.pairwise,
                args.force_producer,
            )
            for case in cases
        ]
        results = [future.result() for future in futures]
    print(
        json.dumps(
            {
                "pairwise": args.pairwise,
                "force_producer": args.force_producer,
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
