"""Diagnostic cut for the source-proved C/J alternation theorem.

The Lean theorem ``endpointFresh_sharedBlocker_pair_alternates`` says that,
for a candidate common blocker ``c``, exactly one of the endpoint pair
``(C,J)`` lies between the first apex ``O`` and the shared blocker ``c``.
This pilot encodes that endpoint-specific implication.  It is deliberately
diagnostic: the v38 stack still contains a forced hypothetical producer and
the bounded Boolean result is not a universal P97 closure.
"""

from __future__ import annotations

import argparse
import json
import time

import round5_cegar_v8 as v8
import round5_cegar_v12 as v12
import v38_pinned_seed_center_multiplicity_canary as v38
import z3


PAIR_ALTERNATION_FAMILY = "endpoint_shared_blocker_pair_alternation"


class Encoding(v38.Encoding):
    """v38 plus the exact source-level alternation cut for every (J,c)."""

    def _build_normal_form(self) -> None:
        super()._build_normal_form()
        apex = v8.APICES[0]
        kept = self.case.kept
        for j, j_selected in self.endpoint_j.items():
            for center in v8.POINTS:
                if v8.cyclic_separated(apex, center, kept, j):
                    continue
                # Same-side C/J is impossible when `center` is the shared
                # blocker.  The collision constraints already identify the
                # fresh and kept blocker literals in this branch.
                self.add(
                    PAIR_ALTERNATION_FAMILY,
                    z3.Not(z3.And(j_selected, self.block[kept, center])),
                )


def probe(timeout_ms: int, run_full: bool) -> dict[str, object]:
    started = time.monotonic()
    encoding = Encoding(
        v38.CANONICAL_CASE,
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
        "schema_version": 39,
        "case_id": encoding.case.case_id,
        "timeout_ms": timeout_ms,
        "status": str(boolean_outcome),
        "reason_unknown": (
            boolean_solver.reason_unknown()
            if boolean_outcome == z3.unknown
            else None
        ),
        "alternation_cut_count": len(
            encoding.groups[PAIR_ALTERNATION_FAMILY]
        ),
        "boolean_included_total": boolean_audit.included_total,
        "boolean_excluded_total": boolean_audit.excluded_total,
        "epistemic_status": (
            "diagnostic only; v38 forces a hypothetical producer and this "
            "bounded Boolean SAT/UNKNOWN result is not universal closure"
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
