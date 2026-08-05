"""v42 plus the proved adjacent-cap singleton frontier cut."""

from __future__ import annotations

import argparse
import json
import time

import round5_cegar_v8 as v8
import round5_cegar_v12 as v12
import v42_endpoint_shared_blocker_packet_consequences_pilot as v42
import z3


FAMILY = "endpoint_frontier_adjacent_cap_singleton"


class Encoding(v42.Encoding):
    def _build_normal_form(self) -> None:
        super()._build_normal_form()
        frontier = self.rich[0, 0]["support"]

        # In the shared-blocker branch, the source gives either the left or
        # right adjacent-cap singleton identity.  For the canonical first
        # cap these are the other two closed-cap packets in either orientation.
        for j, j_selected in self.endpoint_j.items():
            branch_equalities = []
            for cap in (v8.CLOSED_CAPS[1], v8.CLOSED_CAPS[2]):
                conditions = [
                    z3.And(frontier[point], point in cap)
                    == z3.BoolVal(point == j)
                    for point in v8.POINTS
                ]
                branch_equalities.append(z3.And(*conditions))
            self.add(
                FAMILY,
                z3.Implies(j_selected, z3.Or(*branch_equalities)),
            )


def probe(timeout_ms: int, run_full: bool) -> dict[str, object]:
    started = time.monotonic()
    encoding = Encoding(
        v42.v41.v40.v39.v38.CANONICAL_CASE,
        timeout_ms=timeout_ms,
        seed=1,
        pairwise=True,
        force_producer=True,
    )
    boolean_solver, boolean_audit = v12.build_boolean_relaxation(
        encoding, timeout_ms, seed=1
    )
    boolean_outcome = boolean_solver.check()
    result: dict[str, object] = {
        "schema_version": 43,
        "case_id": encoding.case.case_id,
        "timeout_ms": timeout_ms,
        "status": str(boolean_outcome),
        "reason_unknown": (
            boolean_solver.reason_unknown()
            if boolean_outcome == z3.unknown
            else None
        ),
        "singleton_cut_count": len(encoding.groups[FAMILY]),
        "boolean_included_total": boolean_audit.included_total,
        "boolean_excluded_total": boolean_audit.excluded_total,
        "epistemic_status": (
            "diagnostic only; v39 forces a hypothetical producer and this "
            "exact-15 slice is not a universal closure"
        ),
        "elapsed_seconds": time.monotonic() - started,
    }
    if run_full:
        solver, _ = encoding.make_solver()
        outcome = solver.check()
        result["full_status"] = str(outcome)
        result["full_reason_unknown"] = (
            solver.reason_unknown() if outcome == z3.unknown else None
        )
        result["full_assertion_count"] = sum(
            len(items) for items in encoding.groups.values()
        )
    return result


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--timeout-ms", type=int, default=60_000)
    parser.add_argument("--full", action="store_true")
    args = parser.parse_args()
    print(json.dumps(probe(args.timeout_ms, args.full), indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
