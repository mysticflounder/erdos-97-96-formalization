#!/usr/bin/env python3
"""Test the named FreshThird endpoint-centered equality producer at n=17.

This is bounded external evidence only.  It asks whether the current
source-faithful equal-center/aligned abstraction either forces or forbids

  d(q1, canonicalSource) = d(q1, q2)

up to swapping the two fresh-fiber sources.  It is not a Lean theorem and it
does not supply a general-cardinality lift.
"""

from __future__ import annotations

import argparse
import json
import time

import freshthird_exact_geometry_probe as geometry
import n17_freshthird_incidence_probe as base
import z3


def named_occurrence(probe: base.FreshThirdN17) -> z3.BoolRef:
    cases = []
    for source in base.ALL:
        for left in base.ALL:
            for right in base.ALL:
                if left == right:
                    continue
                guard = z3.And(
                    probe.c_source_is[0, source],
                    probe.q1_is[left],
                    probe.q2_is[right],
                )
                equality = z3.Or(
                    probe.E(left, source, right),
                    probe.E(right, source, left),
                )
                cases.append(z3.And(guard, equality))
    return z3.Or(*cases)


def solve(mode: str, timeout_ms: int) -> dict[str, object]:
    started = time.monotonic()
    probe, _, _ = geometry.solve_ingress(
        "equalCrossRowCenters", "aligned", timeout_ms
    )
    occurrence = named_occurrence(probe)
    probe.add(
        "named_endpoint_equality_query",
        occurrence if mode == "force" else z3.Not(occurrence),
    )
    status = probe.solver.check()
    result: dict[str, object] = {
        "mode": mode,
        "status": str(status).upper(),
        "elapsed_seconds": round(time.monotonic() - started, 6),
        "n": base.N,
        "arm": "equalCrossRowCenters",
        "radius_mode": "aligned",
        "trust_boundary": (
            "bounded external Z3 incidence/equality abstraction only; "
            "no Euclidean realizability, Lean, or general-cardinality claim"
        ),
    }
    if status == z3.sat:
        model = probe.solver.model()
        source = next(
            point
            for point in base.ALL
            if z3.is_true(
                model.eval(probe.c_source_is[0, point], model_completion=True)
            )
        )
        left = next(
            point
            for point in base.ALL
            if z3.is_true(model.eval(probe.q1_is[point], model_completion=True))
        )
        right = next(
            point
            for point in base.ALL
            if z3.is_true(model.eval(probe.q2_is[point], model_completion=True))
        )
        result["binding"] = {
            "canonical_source": base.NAMES[source],
            "q1": base.NAMES[left],
            "q2": base.NAMES[right],
            "q1_centered_equality": z3.is_true(
                model.eval(probe.E(left, source, right), model_completion=True)
            ),
            "q2_centered_equality": z3.is_true(
                model.eval(probe.E(right, source, left), model_completion=True)
            ),
        }
    elif status == z3.unknown:
        result["reason_unknown"] = probe.solver.reason_unknown()
    return result


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--timeout-ms", type=int, default=180_000)
    args = parser.parse_args()
    print(json.dumps([
        solve("force", args.timeout_ms),
        solve("forbid", args.timeout_ms),
    ], indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
