#!/usr/bin/env python3
"""Bounded CEGAR on the normalized n=14, (5,6,6) cap-aware surface.

The generic whole-carrier structural and full-linear Kalmanson encodings are
imported unchanged.  This successor adds exactly the production-proved local
cap-row cardinality consequences for the fixed cyclic profile

    C1={0,1,2,3,4}, C2={4,5,6,7,8,9}, C3={9,10,11,12,13,0}.

No historical schema bank is loaded.  Every refinement is discovered during
this invocation and transported only by the generic fully tracked
order-embedding rule.  Results are theorem-discovery evidence, not Euclidean
realizability and not Lean closure.
"""

from __future__ import annotations

import argparse
import importlib.util
import itertools
import json
import sys
import time
from pathlib import Path

import z3


HERE = Path(__file__).resolve().parent
GENERIC_DIR = HERE.parent / "generic-biapex-kalmanson-search"
if str(GENERIC_DIR) not in sys.path:
    sys.path.insert(0, str(GENERIC_DIR))

CEGAR_SPEC = importlib.util.spec_from_file_location(
    "generic_biapex_cegar",
    GENERIC_DIR / "cegar.py",
)
if CEGAR_SPEC is None or CEGAR_SPEC.loader is None:
    raise RuntimeError("cannot load the generic whole-carrier CEGAR module")
CEGAR = importlib.util.module_from_spec(CEGAR_SPEC)
CEGAR_SPEC.loader.exec_module(CEGAR)

VERIFY_SPEC = importlib.util.spec_from_file_location(
    "n14_capaware_verify",
    HERE / "verify_result.py",
)
if VERIFY_SPEC is None or VERIFY_SPEC.loader is None:
    raise RuntimeError("cannot load the cap-aware payload verifier")
VERIFY = importlib.util.module_from_spec(VERIFY_SPEC)
VERIFY_SPEC.loader.exec_module(VERIFY)


N = 14
FIRST_APEX = 0
SECOND_APEX = 4
THIRD_APEX = 9
CAPS = VERIFY.CAPS
CAP_ENDPOINTS = VERIFY.CAP_ENDPOINTS


def add_cap_constraints(
    solver: z3.Solver,
    member: dict[tuple[int, int], z3.BoolRef],
) -> dict[str, int]:
    """Add the 17 general and six endpoint center-cap inequalities."""

    general_count = 0
    endpoint_count = 0
    for cap_name, cap in CAPS.items():
        endpoints = CAP_ENDPOINTS[cap_name]
        cap_points = tuple(sorted(cap))
        for center in cap_points:
            terms = [(member[center, point], 1) for point in cap_points]
            solver.add(z3.PbLe(terms, 2))
            general_count += 1
            if center in endpoints:
                solver.add(z3.PbLe(terms, 1))
                endpoint_count += 1
    return {
        "cap_center_card_le_two": general_count,
        "cap_endpoint_card_le_one": endpoint_count,
    }


def build_capaware_structural(timeout_ms: int, random_seed: int):
    solver, member, blocker = CEGAR.build_structural(
        N, SECOND_APEX, timeout_ms, random_seed
    )
    counts = add_cap_constraints(solver, member)
    return solver, member, blocker, counts


def add_transported_core_cuts(
    *,
    solver: z3.Solver,
    member: dict[tuple[int, int], z3.BoolRef],
    core_vertices: tuple[int, ...],
    required_memberships: tuple[tuple[int, int], ...],
    seen_order_schemas: set[tuple[int, tuple[tuple[int, int], ...]]],
    deadline: float,
) -> tuple[tuple[int, tuple[tuple[int, int], ...]], bool, int, bool]:
    role = {vertex: index for index, vertex in enumerate(core_vertices)}
    order_schema = tuple(
        sorted((role[center], role[point]) for center, point in required_memberships)
    )
    reflected_schema = tuple(
        sorted(
            (
                len(core_vertices) - 1 - center,
                len(core_vertices) - 1 - point,
            )
            for center, point in order_schema
        )
    )
    schema_key = (len(core_vertices), min(order_schema, reflected_schema))
    is_new = schema_key not in seen_order_schemas
    seen_order_schemas.add(schema_key)
    cut_count = 0
    budget_exhausted = False
    if is_new:
        for targets in itertools.combinations(range(N), len(core_vertices)):
            for schema in {order_schema, reflected_schema}:
                if time.monotonic() >= deadline:
                    budget_exhausted = True
                    break
                transformed = {
                    (targets[center], targets[point]) for center, point in schema
                }
                solver.add(
                    z3.Or(
                        *(z3.Not(member[center, point]) for center, point in sorted(transformed))
                    )
                )
                cut_count += 1
            if budget_exhausted:
                break
    return schema_key, is_new, cut_count, budget_exhausted


def run(args: argparse.Namespace) -> dict[str, object]:
    started = time.monotonic()
    deadline = started + args.wall_seconds
    solver, member, blocker, cap_counts = build_capaware_structural(
        args.outer_timeout_ms, args.random_seed
    )
    refinements: list[dict[str, object]] = []
    seen_order_schemas: set[tuple[int, tuple[tuple[int, int], ...]]] = set()
    terminal: dict[str, object] | None = None

    for attempt in range(1, args.max_refinements + 1):
        outer_timeout = CEGAR.bounded_timeout_ms(args.outer_timeout_ms, deadline)
        if outer_timeout is None:
            terminal = {"status": "UNKNOWN", "reason": "wall budget"}
            break
        solver.set(timeout=outer_timeout)
        outer_status = solver.check()
        if outer_status != z3.sat:
            reason = solver.reason_unknown() if outer_status == z3.unknown else None
            if outer_status == z3.unknown and time.monotonic() >= deadline:
                reason = "wall budget"
            terminal = {"status": str(outer_status).upper(), "reason": reason}
            break

        model = solver.model()
        rows = CEGAR.selected_rows(model, member, N)
        metric_status, centers, core_names, metric_payload = CEGAR.metric_check(
            rows,
            N,
            args.metric_timeout_ms,
            deadline,
            args.random_seed,
        )
        if metric_status == z3.sat:
            blockers = CEGAR.blocker_values(model, blocker, N)
            terminal = {
                "status": "SAT_VERIFIED_KALMANSON_SHADOW",
                "rows": {str(center): list(row) for center, row in rows.items()},
                "blockers": blockers,
                "distances": metric_payload,
            }
            break
        if metric_status == z3.unknown:
            reason = metric_payload
            if time.monotonic() >= deadline:
                reason = "wall budget"
            terminal = {"status": "UNKNOWN", "reason": reason}
            break

        core_vertices = tuple(metric_payload["core_vertices"])
        required = tuple(tuple(item) for item in metric_payload["required_memberships"])
        schema_key, is_new, cut_count, budget_exhausted = add_transported_core_cuts(
            solver=solver,
            member=member,
            core_vertices=core_vertices,
            required_memberships=required,
            seen_order_schemas=seen_order_schemas,
            deadline=deadline,
        )
        refinements.append(
            {
                "attempt": attempt,
                "dependency_centers": list(centers),
                "metric_core": list(core_names),
                "required_memberships": [list(item) for item in required],
                "full_metric_core_vertices": list(core_vertices),
                "constraint_kinds": list(metric_payload["constraint_kinds"]),
                "order_schema": [list(item) for item in schema_key[1]],
                "new_order_schema": is_new,
                "order_embedding_cut_count": cut_count,
            }
        )
        if budget_exhausted:
            terminal = {"status": "UNKNOWN", "reason": "wall budget during cut transport"}
            break
        if not is_new:
            terminal = {
                "status": "UNKNOWN",
                "reason": "repeated fully tracked order schema",
            }
            break
    else:
        terminal = {"status": "UNKNOWN", "reason": "refinement budget"}

    if terminal is None:
        raise RuntimeError("search produced no terminal result")
    terminal.update(
        {
            "schema": "p97-n14-cap-aware-biapex-kalmanson-cegar-v1",
            "epistemic_status": "BOUNDED_THEOREM_DISCOVERY_NOT_EUCLIDEAN_NOT_LEAN",
            "n": N,
            "omitted_apices": [FIRST_APEX, SECOND_APEX],
            "third_apex": THIRD_APEX,
            "caps": {name: sorted(cap) for name, cap in CAPS.items()},
            "cap_constraint_counts": cap_counts,
            "preloaded_schema_count": 0,
            "random_seed": args.random_seed,
            "elapsed_seconds": time.monotonic() - started,
            "refinement_count": len(refinements),
            "order_schema_count": len(seen_order_schemas),
            "refinements": refinements,
        }
    )
    if terminal["status"] == "SAT_VERIFIED_KALMANSON_SHADOW":
        terminal["payload_verification"] = VERIFY.verify(terminal)
    return terminal


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--wall-seconds", type=float, default=30.0)
    parser.add_argument("--outer-timeout-ms", type=int, default=5_000)
    parser.add_argument("--metric-timeout-ms", type=int, default=5_000)
    parser.add_argument("--max-refinements", type=int, default=100_000)
    parser.add_argument("--random-seed", type=int, default=0)
    parser.add_argument("--output", type=Path)
    parser.add_argument("--summary-only", action="store_true")
    args = parser.parse_args()
    if args.wall_seconds <= 0:
        raise SystemExit("wall-seconds must be positive")
    if args.wall_seconds > 120:
        raise SystemExit("this scratch driver refuses wall budgets over 120 seconds")
    if args.outer_timeout_ms <= 0 or args.metric_timeout_ms <= 0:
        raise SystemExit("solver timeouts must be positive")

    result = run(args)
    rendered = json.dumps(result, indent=2, sort_keys=True) + "\n"
    if args.output is not None:
        args.output.parent.mkdir(parents=True, exist_ok=True)
        args.output.write_text(rendered, encoding="utf-8")
    if args.summary_only:
        summary = {
            key: result.get(key)
            for key in (
                "status",
                "reason",
                "elapsed_seconds",
                "refinement_count",
                "order_schema_count",
                "cap_constraint_counts",
                "preloaded_schema_count",
                "payload_verification",
            )
            if key in result
        }
        print(json.dumps(summary, indent=2, sort_keys=True))
    else:
        print(rendered, end="")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
