#!/usr/bin/env python3
"""Bounded Boolean-to-exact-LRA CEGAR for the two asymmetric card-13 orbits."""

from __future__ import annotations

import argparse
import hashlib
import itertools
import json
import time
from fractions import Fraction
from pathlib import Path

import z3

from encode import Outer
from verify import (
    FIRST_APEX,
    N,
    ORBIT_ROLES,
    PHYSICAL_CAP,
    SECOND_APEX,
    VERTICES,
    sink_sccs,
)
from verify_l1 import SIGNS, verify_l1_payload


ASYMMETRIC_ORBITS = ("asymmetricSourceLeft", "asymmetricSourceRight")


def edge(left: int, right: int) -> tuple[int, int]:
    return (left, right) if left < right else (right, left)


def dist(table: dict[tuple[int, int], z3.ArithRef],
         left: int, right: int) -> z3.ArithRef:
    if left == right:
        return z3.RealVal(0)
    return table[edge(left, right)]


def qstr(value: z3.RatNumRef) -> str:
    fraction = Fraction(value.numerator_as_long(), value.denominator_as_long())
    return str(fraction)


def build_linear_problem(
    decoded: dict[str, object], sign: str, timeout_ms: int, seed: int
) -> tuple[
    z3.Solver,
    dict[tuple[int, int], z3.ArithRef],
    list[dict[str, object]],
]:
    table = {
        pair: z3.Real(f"d_{pair[0]}_{pair[1]}")
        for pair in itertools.combinations(VERTICES, 2)
    }
    solver = z3.Solver()
    solver.set(timeout=max(1, timeout_ms), random_seed=seed)
    for variable in table.values():
        solver.add(variable >= 1)
    for a, b, c in itertools.combinations(VERTICES, 3):
        solver.add(dist(table, a, b) + dist(table, b, c) >=
                   dist(table, a, c) + 1)
        solver.add(dist(table, a, c) + dist(table, b, c) >=
                   dist(table, a, b) + 1)
        solver.add(dist(table, a, b) + dist(table, a, c) >=
                   dist(table, b, c) + 1)
    for a, b, c, d in itertools.combinations(VERTICES, 4):
        diagonals = dist(table, a, c) + dist(table, b, d)
        solver.add(diagonals >= dist(table, a, b) + dist(table, c, d) + 1)
        solver.add(diagonals >= dist(table, a, d) + dist(table, b, c) + 1)

    tracked: list[dict[str, object]] = []

    def track(name: str, expression: z3.BoolRef,
              metadata: dict[str, object]) -> None:
        assumption = z3.Bool(f"track_{len(tracked):03d}")
        solver.add(z3.Implies(assumption, expression))
        tracked.append({
            "name": name,
            "assumption": assumption,
            "metadata": metadata,
        })

    def track_row(family: str, center: int, support: set[int]) -> None:
        reference = min(support)
        for point in sorted(support - {reference}):
            metadata = {
                "kind": "rowEquality",
                "family": family,
                "center": center,
                "left": reference,
                "right": point,
            }
            track(
                f"{family}[{center}]:{reference}={point}",
                dist(table, center, point) ==
                dist(table, center, reference),
                metadata,
            )

    rows = {int(c): set(s) for c, s in decoded["rows"].items()}
    covers = [
        {int(c): set(s) for c, s in raw.items()}
        for raw in decoded["cover_rows"]
    ]
    for family_name, family in (
        ("m", rows), ("g0", covers[0]), ("g1", covers[1])
    ):
        for center, support in family.items():
            track_row(family_name, center, support)
    b1 = set(decoded["b1"])
    track_row("b1", FIRST_APEX, b1)
    shell = set(decoded["shell"])
    track_row("shell", SECOND_APEX, shell)

    q = int(decoded["q"])
    w = int(decoded["w"])
    track(
        "frontier:firstApexEquality",
        dist(table, FIRST_APEX, q) == dist(table, FIRST_APEX, w),
        {"kind": "frontierFirstEquality", "q": q, "w": w},
    )
    track(
        "frontier:secondApexSeparation",
        z3.Or(
            dist(table, SECOND_APEX, q) >= dist(table, SECOND_APEX, w) + 1,
            dist(table, SECOND_APEX, w) >= dist(table, SECOND_APEX, q) + 1,
        ),
        {"kind": "frontierSecondSeparation", "q": q, "w": w},
    )

    roles = ORBIT_ROLES[str(decoded["orbit"])]
    outside = sorted(rows[roles["hub"]] - PHYSICAL_CAP)
    if len(outside) != 2:
        raise ValueError("asymmetric outside pair missing")
    lower, higher = outside
    if sign == "outsideLowerIndexFarther":
        terminal = (
            dist(table, FIRST_APEX, lower) >=
            dist(table, FIRST_APEX, higher) + 1
        )
    elif sign == "outsideHigherIndexFarther":
        terminal = (
            dist(table, FIRST_APEX, higher) >=
            dist(table, FIRST_APEX, lower) + 1
        )
    else:
        raise ValueError(sign)
    track(
        f"terminal:{sign}",
        terminal,
        {
            "kind": "terminalSign",
            "sign": sign,
            "hub": roles["hub"],
            "lower": lower,
            "higher": higher,
        },
    )
    return solver, table, tracked


def minimize_unsat_core(
    solver: z3.Solver,
    tracked: list[dict[str, object]],
) -> tuple[list[dict[str, object]], bool]:
    by_symbol = {
        str(record["assumption"]): record for record in tracked
    }
    core = [by_symbol[str(symbol)] for symbol in solver.unsat_core()]
    minimal = True
    cursor = 0
    while cursor < len(core):
        trial = core[:cursor] + core[cursor + 1:]
        status = solver.check(*(record["assumption"] for record in trial))
        if status == z3.unsat:
            core = trial
        elif status == z3.sat:
            cursor += 1
        else:
            minimal = False
            cursor += 1
    return core, minimal


def public_core(
    records: list[dict[str, object]], minimal: bool
) -> dict[str, object]:
    constraints = [
        {"name": record["name"], **record["metadata"]}
        for record in records
    ]
    families = {
        str(record["metadata"].get("family"))
        for record in records
        if record["metadata"]["kind"] == "rowEquality"
    }
    return {
        "base": "positivity + strict triangles + strict Kalmanson",
        "minimal": minimal,
        "method": "deletion-minimal assumption core",
        "constraint_count": len(constraints),
        "constraints": constraints,
        "uses": {
            family: family in families
            for family in ("m", "g0", "g1", "b1", "shell")
        },
    }


def linear_check(decoded: dict[str, object], sign: str,
                 timeout_ms: int, seed: int) -> dict[str, object]:
    try:
        solver, table, tracked = build_linear_problem(
            decoded, sign, timeout_ms, seed
        )
    except ValueError as error:
        return {"status": "ENCODER_ERROR", "reason": str(error)}

    status = solver.check(*(
        record["assumption"] for record in tracked
    ))
    if status == z3.unsat:
        core, minimal = minimize_unsat_core(solver, tracked)
        return {
            "status": "UNSAT",
            "core": public_core(core, minimal),
        }
    if status == z3.unknown:
        return {"status": "UNKNOWN", "reason": solver.reason_unknown()}
    model = solver.model()
    distances = {
        f"{left},{right}": qstr(model.eval(variable, model_completion=True))
        for (left, right), variable in table.items()
    }
    errors = verify_l1_payload(decoded, distances, sign)
    if errors:
        return {"status": "ENCODER_ERROR", "verification_errors": errors}
    return {"status": "SAT", "distances": distances}


def core_schema_atom(outer: Outer, constraint: dict[str, object]) -> z3.BoolRef:
    kind = str(constraint["kind"])
    if kind == "rowEquality":
        family_name = str(constraint["family"])
        left = int(constraint["left"])
        right = int(constraint["right"])
        center = int(constraint["center"])
        if family_name == "m":
            family = outer.m
            return z3.And(family[center, left], family[center, right])
        if family_name in {"g0", "g1"}:
            family = outer.cover[int(family_name[1])]
            return z3.And(family[center, left], family[center, right])
        if family_name == "b1":
            return z3.And(outer.b1[left], outer.b1[right])
        if family_name == "shell":
            return z3.And(outer.shell[left], outer.shell[right])
        raise ValueError(f"unknown row family {family_name}")
    if kind in {"frontierFirstEquality", "frontierSecondSeparation"}:
        return z3.And(
            outer.q == int(constraint["q"]),
            outer.w == int(constraint["w"]),
        )
    if kind == "terminalSign":
        hub = int(constraint["hub"])
        return z3.And(
            outer.m[hub, int(constraint["lower"])],
            outer.m[hub, int(constraint["higher"])],
        )
    raise ValueError(f"unknown core constraint kind {kind}")


def block_core_schema(outer: Outer, core: dict[str, object]) -> None:
    if not core["minimal"]:
        raise ValueError("refusing to generalize a non-minimal core")
    atoms = [
        core_schema_atom(outer, constraint)
        for constraint in core["constraints"]
    ]
    outer.solver.add(z3.Not(z3.And(*atoms)))


def ordinal_core_schema(core: dict[str, object]) -> dict[str, object]:
    """Forget gaps but preserve the increasing cyclic order of all labels."""
    point_fields = {"center", "left", "right", "q", "w", "hub", "lower",
                    "higher"}
    labels = sorted({
        int(value)
        for constraint in core["constraints"]
        for key, value in constraint.items()
        if key in point_fields
    })
    ranks = {point: rank for rank, point in enumerate(labels)}
    normalized = []
    for constraint in core["constraints"]:
        item = {
            key: ranks[int(value)] if key in point_fields else value
            for key, value in constraint.items()
            if key != "name"
        }
        normalized.append(item)
    normalized.sort(key=lambda item: json.dumps(item, sort_keys=True))
    payload = json.dumps(normalized, sort_keys=True, separators=(",", ":"))
    return {
        "schema_id": hashlib.sha256(payload.encode()).hexdigest()[:12],
        "point_count": len(labels),
        "constraints": normalized,
    }


def solve(orbit: str, sign: str, seconds: float, seed: int) -> dict[str, object]:
    if orbit not in ASYMMETRIC_ORBITS:
        raise ValueError(orbit)
    started = time.monotonic()
    deadline = started + seconds
    outer = Outer(orbit, max(1, int(seconds * 1000)), seed)
    counters = {
        "b0_candidates": 0,
        "l1_unsat_candidates": 0,
        "core_schema_blocks": 0,
        "full_assignment_blocks": 0,
        "connectivity_cuts": {"m": 0, "g0": 0, "g1": 0},
    }
    first_minimized_core: dict[str, object] | None = None
    core_schemas: dict[str, dict[str, object]] = {}

    def record_core(core: dict[str, object]) -> None:
        schema = ordinal_core_schema(core)
        schema_id = str(schema["schema_id"])
        if schema_id not in core_schemas:
            core_schemas[schema_id] = {
                **schema,
                "count": 0,
                "uses": core["uses"],
            }
        core_schemas[schema_id]["count"] = int(
            core_schemas[schema_id]["count"]
        ) + 1

    def common_result() -> dict[str, object]:
        result: dict[str, object] = {
            "counters": counters,
            "ordinal_core_schemas": sorted(
                core_schemas.values(), key=lambda item: str(item["schema_id"])
            ),
        }
        if first_minimized_core is not None:
            result["first_minimized_core"] = first_minimized_core
        return result

    while True:
        remaining_ms = int((deadline - time.monotonic()) * 1000)
        if remaining_ms <= 0:
            return {
                "schema": "p97-card13-exact5-global-cover-parent-l1-v1",
                "status": "UNKNOWN",
                "reason": "wall budget",
                "orbit": orbit,
                "sign": sign,
                **common_result(),
            }
        outer.solver.set(timeout=max(1, remaining_ms), random_seed=seed)
        outer_status = outer.solver.check()
        if outer_status == z3.unsat:
            return {
                "schema": "p97-card13-exact5-global-cover-parent-l1-v1",
                "status": "UNSAT",
                "orbit": orbit,
                "sign": sign,
                **common_result(),
                "certificate": "none; solver verdict only",
            }
        if outer_status == z3.unknown:
            return {
                "schema": "p97-card13-exact5-global-cover-parent-l1-v1",
                "status": "UNKNOWN",
                "reason": f"B0: {outer.solver.reason_unknown()}",
                "orbit": orbit,
                "sign": sign,
                **common_result(),
            }
        decoded = outer.decode(outer.solver.model())
        decoded_families = [
            {int(c): set(s) for c, s in decoded["rows"].items()},
            *[
                {int(c): set(s) for c, s in raw.items()}
                for raw in decoded["cover_rows"]
            ],
        ]
        symbolic_families = [outer.m, *outer.cover]
        names = ("m", "g0", "g1")
        added_cut = False
        for name, symbolic, family in zip(
            names, symbolic_families, decoded_families, strict=True
        ):
            sinks = sink_sccs(family)
            for component in sinks:
                if len(component) < N:
                    outer.add_connectivity_cut(symbolic, component)
                    counters["connectivity_cuts"][name] += 1
                    added_cut = True
        if added_cut:
            continue
        counters["b0_candidates"] += 1
        metric = linear_check(
            decoded, sign, min(5_000, remaining_ms), seed
        )
        if metric["status"] == "UNSAT":
            counters["l1_unsat_candidates"] += 1
            core = metric["core"]
            if core["minimal"]:
                record_core(core)
                if first_minimized_core is None:
                    first_minimized_core = {
                        "decoded": decoded,
                        "core": core,
                    }
                block_core_schema(outer, core)
                counters["core_schema_blocks"] += 1
            else:
                outer.block_decoded(decoded)
                counters["full_assignment_blocks"] += 1
            continue
        if metric["status"] == "UNKNOWN":
            return {
                "schema": "p97-card13-exact5-global-cover-parent-l1-v1",
                "status": "UNKNOWN",
                "reason": f"L1: {metric['reason']}",
                "orbit": orbit,
                "sign": sign,
                **common_result(),
            }
        if metric["status"] == "ENCODER_ERROR":
            return {
                "schema": "p97-card13-exact5-global-cover-parent-l1-v1",
                "status": "ENCODER_ERROR",
                "orbit": orbit,
                "sign": sign,
                **common_result(),
                **metric,
            }
        return {
            "schema": "p97-card13-exact5-global-cover-parent-l1-v1",
            "status": "SAT",
            "label": "SAT_VERIFIED_CARD13_ASYMMETRIC_L1_ABSTRACT_DISTANCE_SHADOW",
            "orbit": orbit,
            "sign": sign,
            **common_result(),
            "decoded": decoded,
            "distances": metric["distances"],
            "omitted": [
                "exact filters and no_qfree_at",
                "full minimality, noM44, planar and MEC geometry",
            ],
        }


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--orbit", choices=ASYMMETRIC_ORBITS, required=True)
    parser.add_argument("--sign", choices=SIGNS, required=True)
    parser.add_argument("--seconds", type=float, default=30.0)
    parser.add_argument("--seed", type=int, default=1)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()
    result = solve(args.orbit, args.sign, args.seconds, args.seed)
    payload = json.dumps(result, indent=2, sort_keys=True)
    if args.output is not None:
        args.output.write_text(payload + "\n")
    print(payload)


if __name__ == "__main__":
    main()
