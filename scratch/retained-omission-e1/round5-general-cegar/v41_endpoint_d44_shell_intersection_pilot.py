"""v40 plus the source-proved D44 fresh-row shell intersection."""

from __future__ import annotations

import argparse
import json
import time

import round5_cegar_v8 as v8
import round5_cegar_v12 as v12
import v40_endpoint_d44_deleted_row_assignment_pilot as v40
import z3


INTERSECTION_FAMILY = "endpoint_exact_fifteen_d44_fresh_shell_intersection"


class Encoding(v40.Encoding):
    """v40 plus ``fresh B1 ∩ deleted shell = {kept, deleted}``."""

    def _build_normal_form(self) -> None:
        super()._build_normal_form()
        fresh_packet = next(
            packet for packet in self.packets if packet["name"] == "fresh"
        )
        kept = self.case.kept
        deleted = self.case.deleted
        for point in v8.POINTS:
            expected = point in {kept, deleted}
            self.add(
                INTERSECTION_FAMILY,
                z3.And(
                    fresh_packet["B1"][point], fresh_packet["B2"][point]
                )
                == z3.BoolVal(expected),
            )


def probe(timeout_ms: int, run_full: bool) -> dict[str, object]:
    started = time.monotonic()
    encoding = Encoding(
        v40.v39.v38.CANONICAL_CASE,
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
        "schema_version": 41,
        "case_id": encoding.case.case_id,
        "timeout_ms": timeout_ms,
        "status": str(boolean_outcome),
        "reason_unknown": (
            boolean_solver.reason_unknown()
            if boolean_outcome == z3.unknown
            else None
        ),
        "intersection_cut_count": len(encoding.groups[INTERSECTION_FAMILY]),
        "boolean_included_total": boolean_audit.included_total,
        "boolean_excluded_total": boolean_audit.excluded_total,
        "epistemic_status": (
            "diagnostic only; v39 forces a hypothetical producer and this "
            "exact-15 slice is not a universal closure"
        ),
        "elapsed_seconds": time.monotonic() - started,
    }
    if boolean_outcome == z3.sat:
        model = boolean_solver.model()
        result["model"] = {
            "frontier": [
                point
                for point in v8.POINTS
                if z3.is_true(model.eval(encoding.rich[0, 0]["support"][point]))
            ],
            "deleted_shell": [
                point
                for point in v8.POINTS
                if z3.is_true(
                    model.eval(
                        next(
                            packet
                            for packet in encoding.packets
                            if packet["name"] == "fresh"
                        )["B2"][point]
                    )
                )
            ],
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
