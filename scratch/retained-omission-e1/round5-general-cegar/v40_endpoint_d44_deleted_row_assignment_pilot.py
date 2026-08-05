"""Diagnostic exact-15 D44 packet-assignment cuts.

The source theorem ``endpointFresh_d44_deletedRows_of_card_eq_fifteen``
identifies the two first-apex packet B1 shells and the selected Q row in the
DDD/fresh exact-15 profile.  This is a finite, source-faithful refinement of
the v39 endpoint stack; it is not a universal P97 closure.
"""

from __future__ import annotations

import argparse
import json
import time

import round5_cegar_v8 as v8
import round5_cegar_v12 as v12
import v39_endpoint_shared_blocker_pair_alternation_pilot as v39
import z3


D44_FAMILY = "endpoint_exact_fifteen_d44_packet_assignment"


class Encoding(v39.Encoding):
    """v39 plus the exact source-proved D44 shell identities."""

    def _build_normal_form(self) -> None:
        super()._build_normal_form()
        if self.case.profiles != "DDD" or self.case.arm != "fresh":
            raise ValueError("v40 is only the exact-15 DDD/fresh slice")

        frontier = self.rich[0, 0]["support"]
        other = self.rich[0, 1]["support"]
        packets = {packet["name"]: packet for packet in self.packets}
        oriented = packets["oriented"]
        fresh = packets["fresh"]

        # Q.K = case.fresh belongs to the other first-apex rich class.
        self.add(D44_FAMILY, other[self.case.fresh])

        # O.packet.B1 is the other-radius class; C.freshPacket.B1 and Q.row
        # are the retained-radius/frontier class.  The final equality is the
        # exact selected-row exhaustion supplied by the Lean theorem.
        for point in v8.POINTS:
            self.add(D44_FAMILY, oriented["B1"][point] == other[point])
            self.add(D44_FAMILY, fresh["B1"][point] == frontier[point])
            self.add(D44_FAMILY, self.endpoint_qrow[point] == frontier[point])


def probe(timeout_ms: int, run_full: bool) -> dict[str, object]:
    started = time.monotonic()
    encoding = Encoding(
        v39.v38.CANONICAL_CASE,
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
        "schema_version": 40,
        "case_id": encoding.case.case_id,
        "timeout_ms": timeout_ms,
        "status": str(boolean_outcome),
        "reason_unknown": (
            boolean_solver.reason_unknown()
            if boolean_outcome == z3.unknown
            else None
        ),
        "d44_cut_count": len(encoding.groups[D44_FAMILY]),
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
            "qrow": [
                point
                for point in v8.POINTS
                if z3.is_true(model.eval(encoding.endpoint_qrow[point]))
            ],
            "frontier": [
                point
                for point in v8.POINTS
                if z3.is_true(model.eval(encoding.rich[0, 0]["support"][point]))
            ],
            "other": [
                point
                for point in v8.POINTS
                if z3.is_true(model.eval(encoding.rich[0, 1]["support"][point]))
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
