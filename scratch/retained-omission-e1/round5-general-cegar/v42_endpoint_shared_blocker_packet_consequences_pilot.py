"""v41 plus the proved shared-blocker fourth-packet consequences.

This adds the hypotheses and conclusions of
``endpointFresh_sharedBlocker_fourth_packet`` in the finite exact-15 model:
the fresh source belongs to the shared blocker row, and that row meets both
the Q row and the frontier class exactly in ``{C,J}``.
"""

from __future__ import annotations

import argparse
import json
import time

import round5_cegar_v8 as v8
import round5_cegar_v12 as v12
import v41_endpoint_d44_shell_intersection_pilot as v41
import z3


FAMILY = "endpoint_shared_blocker_fourth_packet"


class Encoding(v41.Encoding):
    def _build_normal_form(self) -> None:
        super()._build_normal_form()
        kept = self.case.kept
        fresh = self.case.fresh
        assert fresh is not None

        # The source theorem's K_mem_J_shell premise.  The shared blocker
        # center is selected by both kept and the endpoint J.
        for j, j_selected in self.endpoint_j.items():
            for center in v8.CENTER_CANDIDATES:
                shared = z3.And(j_selected, self.block[kept, center])
                self.add(
                    FAMILY,
                    z3.Implies(shared, self.row[center, fresh]),
                )

                for point in v8.POINTS:
                    pair = point == kept or point == j
                    self.add(
                        FAMILY,
                        z3.Implies(
                            shared,
                            z3.And(
                                self.row[center, point],
                                self.endpoint_qrow[point],
                            )
                            == z3.BoolVal(pair),
                        ),
                    )
                    self.add(
                        FAMILY,
                        z3.Implies(
                            shared,
                            z3.And(
                                self.row[center, point],
                                self.rich[0, 0]["support"][point],
                            )
                            == z3.BoolVal(pair),
                        ),
                    )


def probe(timeout_ms: int, run_full: bool) -> dict[str, object]:
    started = time.monotonic()
    encoding = Encoding(
        v41.v40.v39.v38.CANONICAL_CASE,
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
        "schema_version": 42,
        "case_id": encoding.case.case_id,
        "timeout_ms": timeout_ms,
        "status": str(boolean_outcome),
        "reason_unknown": (
            boolean_solver.reason_unknown()
            if boolean_outcome == z3.unknown
            else None
        ),
        "packet_consequence_cut_count": len(encoding.groups[FAMILY]),
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
