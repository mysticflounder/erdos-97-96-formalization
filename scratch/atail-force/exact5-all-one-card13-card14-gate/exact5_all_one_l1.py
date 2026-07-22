#!/usr/bin/env python3
"""Bounded all-one exact-five B0 -> strict common-order LRA gate.

This scratch diagnostic extends the exact-five parent gate.  Every decoded B0 candidate is
checked against positivity, strict triangles, strict Kalmanson inequalities,
all m/g0/g1/b1/shell equalities, the frontier metric facts, and (when needed)
the explicit negation of both CriticalFiberClosingCore constructors.
"""

from __future__ import annotations

import argparse
import itertools
import json
import sys
import time
from fractions import Fraction
from pathlib import Path

import z3


ROOT = Path(__file__).resolve().parents[3]
LANE = ROOT / "scratch/atail-force/exact5-global-cover-parent-gate"
sys.path.insert(0, str(LANE))

from encode import Outer  # noqa: E402
from l1 import (  # noqa: E402
    block_core_schema,
    core_schema_atom,
    minimize_unsat_core,
    ordinal_core_schema,
    public_core,
)
from verify import (  # noqa: E402
    CAPS,
    FIRST_APEX,
    N,
    ORBIT_ROLES,
    SECOND_APEX,
    VERTICES,
    sink_sccs,
    verify_decoded,
)


ALL_ONE_ORBITS = (
    "allOneHitHubLeft",
    "allOneHitHubMiddle",
    "allOneHitHubRight",
)


def block_all_increasing_embeddings(
    outer: Outer, core: dict[str, object]
) -> int:
    """Block every increasing-label embedding of a universal row-only core.

    This is sound only for m/g0/g1 row equalities.  These centers and support
    points are all relabelable, while b1/shell/frontier atoms carry fixed
    physical roles and must remain literal-only.
    """
    constraints = core["constraints"]
    if any(
        item["kind"] != "rowEquality" or
        item["family"] not in {"m", "g0", "g1"}
        for item in constraints
    ):
        block_core_schema(outer, core)
        return 1
    schema = ordinal_core_schema(core)
    count = 0
    for image in itertools.combinations(VERTICES, int(schema["point_count"])):
        atoms = []
        for normalized in schema["constraints"]:
            mapped = {
                **normalized,
                "center": image[int(normalized["center"])],
                "left": image[int(normalized["left"])],
                "right": image[int(normalized["right"])],
            }
            atoms.append(core_schema_atom(outer, mapped))
        outer.solver.add(z3.Not(z3.And(*atoms)))
        count += 1
    return count


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


def build_base_linear_problem(
    decoded: dict[str, object], timeout_ms: int, seed: int
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
            track(
                f"{family}[{center}]:{reference}={point}",
                dist(table, center, point) == dist(table, center, reference),
                {
                    "kind": "rowEquality",
                    "family": family,
                    "center": center,
                    "left": reference,
                    "right": point,
                },
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
    track_row("b1", FIRST_APEX, set(decoded["b1"]))
    track_row("shell", SECOND_APEX, set(decoded["shell"]))

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
    return solver, table, tracked


def cyclic_after_first(*points: int) -> bool:
    """True when points occur strictly CCW, starting at points[0]."""
    first = points[0]
    ranks = [((point - first) % N) for point in points]
    return ranks[0] == 0 and all(
        left < right for left, right in zip(ranks, ranks[1:])
    )


def closing_core_negations(
    decoded: dict[str, object],
    table: dict[tuple[int, int], z3.ArithRef],
) -> tuple[list[z3.BoolRef], list[dict[str, object]], list[dict[str, object]]]:
    """Encode the complement of both source-faithful closing constructors.

    Pure-incidence same-cap constructors are returned separately: their
    presence makes the decoded candidate terminal before metric solving.
    Metric-dependent same-cap/ordered candidates are negated with normalized
    strict disequalities.  Homogeneity makes the unit gap equisatisfiable.
    """
    rows = {int(c): set(s) for c, s in decoded["rows"].items()}
    blockers = list(map(int, decoded["blockers"]))
    blocker_image = set(blockers)
    negations: list[z3.BoolRef] = []
    metadata: list[dict[str, object]] = []
    incidence_terminals: list[dict[str, object]] = []

    fibers: list[tuple[int, int, int]] = []
    for left, right in itertools.combinations(VERTICES, 2):
        if blockers[left] == blockers[right]:
            fibers.append((left, right, blockers[left]))

    def add_disequality(kind: str, left: z3.ArithRef, right: z3.ArithRef,
                        fields: dict[str, object]) -> None:
        negations.append(z3.Or(left >= right + 1, right >= left + 1))
        metadata.append({"kind": kind, **fields})

    for source_left, source_right, common in fibers:
        for C, K in ((source_left, source_right),
                     (source_right, source_left)):
            # sameCap with the robust first apex as source-faithful second center
            for cap_index, cap in enumerate(CAPS):
                if (common in cap and FIRST_APEX in cap and
                        C not in cap and K not in cap):
                    add_disequality(
                        "negateSameCapFirstApex",
                        dist(table, FIRST_APEX, C),
                        dist(table, FIRST_APEX, K),
                        {
                            "C": C, "K": K, "common": common,
                            "cap_index": cap_index,
                        },
                    )

            # sameCap with an actual fixed-H blocker row as second center.
            for second in blocker_image - {common}:
                if not {C, K} <= rows[second]:
                    continue
                for cap_index, cap in enumerate(CAPS):
                    if (common in cap and second in cap and
                            C not in cap and K not in cap):
                        incidence_terminals.append({
                            "kind": "sameCapActualCriticalRow",
                            "C": C,
                            "K": K,
                            "common": common,
                            "second": second,
                            "cap_index": cap_index,
                        })

            # ordered constructor in the fixed common CCW boundary order.
            for J in VERTICES:
                X = blockers[J]
                if K not in rows[X]:
                    continue
                if not cyclic_after_first(FIRST_APEX, common, X, J, C, K):
                    continue
                add_disequality(
                    "negateOrdered",
                    dist(table, FIRST_APEX, J),
                    dist(table, FIRST_APEX, C),
                    {
                        "C": C, "K": K, "common": common,
                        "J": J, "X": X,
                    },
                )
    # Duplicates arise from the two orientations in the same-cap arm.
    unique_negations: list[z3.BoolRef] = []
    unique_metadata: list[dict[str, object]] = []
    seen: set[str] = set()
    for expression, item in zip(negations, metadata, strict=True):
        key = expression.sexpr()
        if key not in seen:
            seen.add(key)
            unique_negations.append(expression)
            unique_metadata.append(item)
    unique_incidence = {
        json.dumps(item, sort_keys=True): item for item in incidence_terminals
    }
    return unique_negations, unique_metadata, list(unique_incidence.values())


def check_linear(
    decoded: dict[str, object], timeout_ms: int, seed: int
) -> dict[str, object]:
    solver, table, tracked = build_base_linear_problem(decoded, timeout_ms, seed)
    assumptions = [record["assumption"] for record in tracked]
    status = solver.check(*assumptions)
    if status == z3.unsat:
        core, minimal = minimize_unsat_core(solver, tracked)
        return {
            "status": "UNSAT",
            "stage": "commonOrderBase",
            "core": public_core(core, minimal),
        }
    if status == z3.unknown:
        return {
            "status": "UNKNOWN",
            "stage": "commonOrderBase",
            "reason": solver.reason_unknown(),
        }

    negations, negation_metadata, incidence_terminals = \
        closing_core_negations(decoded, table)
    if incidence_terminals:
        return {
            "status": "UNSAT",
            "stage": "closingCoreNegation",
            "reason": "sameCap constructor already present by incidence",
            "incidence_terminals": incidence_terminals,
        }
    solver.push()
    solver.add(*negations)
    status = solver.check(*assumptions)
    if status == z3.unsat:
        solver.pop()
        return {
            "status": "UNSAT",
            "stage": "closingCoreNegation",
            "reason": "base plus explicit constructor negations is UNSAT",
            "negation_count": len(negations),
            "negations": negation_metadata,
        }
    if status == z3.unknown:
        reason = solver.reason_unknown()
        solver.pop()
        return {
            "status": "UNKNOWN",
            "stage": "closingCoreNegation",
            "reason": reason,
        }
    model = solver.model()
    distances = {
        f"{left},{right}": qstr(model.eval(variable, model_completion=True))
        for (left, right), variable in table.items()
    }
    solver.pop()
    return {
        "status": "SAT",
        "stage": "closingCoreNegation",
        "negation_count": len(negations),
        "negations": negation_metadata,
        "distances": distances,
    }


def solve(orbit: str, seconds: float, seed: int,
          checkpoint_path: Path | None = None,
          resume_path: Path | None = None) -> dict[str, object]:
    if orbit not in ALL_ONE_ORBITS:
        raise ValueError(orbit)
    deadline = time.monotonic() + seconds
    outer = Outer(orbit, max(1, int(seconds * 1000)), seed)
    counters: dict[str, object] = {
        "b0_candidates": 0,
        "common_order_unsat": 0,
        "closing_negation_unsat": 0,
        "core_schema_blocks": 0,
        "order_embedding_blocks": 0,
        "full_assignment_blocks": 0,
        "connectivity_cuts": {"m": 0, "g0": 0, "g1": 0},
    }
    first_core: dict[str, object] | None = None
    schemas: dict[str, dict[str, object]] = {}
    concrete_core_blocks: list[dict[str, object]] = []
    full_assignment_blocks: list[dict[str, object]] = []

    if resume_path is not None:
        saved = json.loads(resume_path.read_text())
        if saved.get("orbit") != orbit:
            raise ValueError("resume orbit mismatch")
        for core in saved.get("concrete_core_blocks", []):
            counters["order_embedding_blocks"] += \
                block_all_increasing_embeddings(outer, core)
            concrete_core_blocks.append(core)
        for decoded in saved.get("full_assignment_blocks", []):
            outer.block_decoded(decoded)
            full_assignment_blocks.append(decoded)
        old_counters = saved.get("counters", {})
        for key in (
            "b0_candidates", "common_order_unsat",
            "closing_negation_unsat", "core_schema_blocks",
            "full_assignment_blocks",
        ):
            if key in old_counters:
                counters[key] = int(old_counters[key])
        first_core = saved.get("first_minimized_core")
        schemas = {
            str(item["schema_id"]): item
            for item in saved.get("ordinal_core_schemas", [])
        }

    def save_checkpoint(status: str, reason: str = "") -> None:
        if checkpoint_path is None:
            return
        payload = {
            "schema": "p97-card13-exact5-all-one-common-order-checkpoint-v1",
            "status": status,
            "reason": reason,
            "orbit": orbit,
            "counters": counters,
            "first_minimized_core": first_core,
            "ordinal_core_schemas": list(schemas.values()),
            "concrete_core_blocks": concrete_core_blocks,
            "full_assignment_blocks": full_assignment_blocks,
        }
        temporary = checkpoint_path.with_suffix(checkpoint_path.suffix + ".tmp")
        temporary.write_text(json.dumps(payload, indent=2, sort_keys=True) + "\n")
        temporary.replace(checkpoint_path)
        with checkpoint_path.with_suffix(".log").open("a") as stream:
            stream.write(
                f"{time.time():.3f} {status} candidates="
                f"{counters['b0_candidates']} cores="
                f"{counters['core_schema_blocks']} schemas={len(schemas)}"
                f" reason={reason}\n"
            )

    while True:
        remaining_ms = int((deadline - time.monotonic()) * 1000)
        if remaining_ms <= 0:
            save_checkpoint("UNKNOWN", "wall budget")
            return {
                "schema": "p97-card13-exact5-all-one-common-order-v1",
                "status": "UNKNOWN",
                "reason": "wall budget",
                "orbit": orbit,
                "counters": counters,
                "first_minimized_core": first_core,
                "ordinal_core_schemas": list(schemas.values()),
            }
        outer.solver.set(timeout=max(1, remaining_ms), random_seed=seed)
        status = outer.solver.check()
        if status == z3.unsat:
            save_checkpoint("UNSAT", "outer exhausted")
            return {
                "schema": "p97-card13-exact5-all-one-common-order-v1",
                "status": "UNSAT",
                "orbit": orbit,
                "counters": counters,
                "first_minimized_core": first_core,
                "ordinal_core_schemas": list(schemas.values()),
                "certificate": "solver/CEGAR only; replay cores separately",
            }
        if status == z3.unknown:
            save_checkpoint("UNKNOWN", f"B0: {outer.solver.reason_unknown()}")
            return {
                "schema": "p97-card13-exact5-all-one-common-order-v1",
                "status": "UNKNOWN",
                "reason": f"B0: {outer.solver.reason_unknown()}",
                "orbit": orbit,
                "counters": counters,
            }
        decoded = outer.decode(outer.solver.model())
        families = [
            {int(c): set(s) for c, s in decoded["rows"].items()},
            *[
                {int(c): set(s) for c, s in raw.items()}
                for raw in decoded["cover_rows"]
            ],
        ]
        added_cut = False
        for name, symbolic, family in zip(
            ("m", "g0", "g1"),
            (outer.m, *outer.cover),
            families,
            strict=True,
        ):
            for component in sink_sccs(family):
                if len(component) < N:
                    outer.add_connectivity_cut(symbolic, component)
                    counters["connectivity_cuts"][name] += 1
                    added_cut = True
        if added_cut:
            continue
        errors = verify_decoded(decoded)
        if errors:
            save_checkpoint("ENCODER_ERROR", "; ".join(errors))
            return {
                "schema": "p97-card13-exact5-all-one-common-order-v1",
                "status": "ENCODER_ERROR",
                "orbit": orbit,
                "verification_errors": errors,
                "counters": counters,
            }
        counters["b0_candidates"] += 1
        metric = check_linear(decoded, min(8_000, remaining_ms), seed)
        if metric["status"] == "UNKNOWN":
            save_checkpoint(
                "UNKNOWN", f"L1/{metric['stage']}: {metric['reason']}"
            )
            return {
                "schema": "p97-card13-exact5-all-one-common-order-v1",
                "status": "UNKNOWN",
                "reason": f"L1/{metric['stage']}: {metric['reason']}",
                "orbit": orbit,
                "counters": counters,
            }
        if metric["status"] == "SAT":
            save_checkpoint("SAT", "verified candidate")
            return {
                "schema": "p97-card13-exact5-all-one-common-order-v1",
                "status": "SAT",
                "label": "SAT_VERIFIED_CARD13_ALL_ONE_COMMON_ORDER_SHADOW",
                "orbit": orbit,
                "counters": counters,
                "decoded": decoded,
                **metric,
            }

        if metric["stage"] == "commonOrderBase":
            counters["common_order_unsat"] += 1
            core = metric["core"]
            if core["minimal"] and core["constraints"]:
                schema = ordinal_core_schema(core)
                sid = str(schema["schema_id"])
                if sid not in schemas:
                    schemas[sid] = {**schema, "count": 0, "uses": core["uses"]}
                schemas[sid]["count"] += 1
                if first_core is None:
                    first_core = {"decoded": decoded, "core": core}
                if schemas[sid]["count"] == 1:
                    counters["order_embedding_blocks"] += \
                        block_all_increasing_embeddings(outer, core)
                    concrete_core_blocks.append(core)
                else:
                    # Fixed-role cores are literal-only and may share an
                    # ordinal schema without sharing their distinguished role.
                    block_core_schema(outer, core)
                    concrete_core_blocks.append(core)
                counters["core_schema_blocks"] += 1
                if int(counters["b0_candidates"]) % 10 == 0:
                    save_checkpoint("RUNNING")
                continue
        else:
            counters["closing_negation_unsat"] += 1
        # Candidate-specific terminal negations cannot soundly justify a
        # generalized row-only block; exclude the complete decoded candidate.
        outer.block_decoded(decoded)
        full_assignment_blocks.append(decoded)
        counters["full_assignment_blocks"] += 1
        if int(counters["b0_candidates"]) % 10 == 0:
            save_checkpoint("RUNNING")


def static_check(path: Path, timeout_ms: int, seed: int) -> dict[str, object]:
    payload = json.loads(path.read_text())
    decoded = payload["decoded"]
    errors = verify_decoded(decoded)
    if errors:
        return {"status": "ENCODER_ERROR", "verification_errors": errors}
    return {"orbit": decoded["orbit"], **check_linear(decoded, timeout_ms, seed)}


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--orbit", choices=ALL_ONE_ORBITS)
    parser.add_argument("--seconds", type=float, default=30.0)
    parser.add_argument("--seed", type=int, default=1)
    parser.add_argument("--static", type=Path)
    parser.add_argument("--output", type=Path)
    parser.add_argument("--checkpoint", type=Path)
    parser.add_argument("--resume", type=Path)
    args = parser.parse_args()
    if args.static is not None:
        result = static_check(args.static, int(args.seconds * 1000), args.seed)
    else:
        if args.orbit is None:
            parser.error("--orbit is required unless --static is used")
        result = solve(
            args.orbit, args.seconds, args.seed,
            checkpoint_path=args.checkpoint,
            resume_path=args.resume,
        )
    text = json.dumps(result, indent=2, sort_keys=True)
    if args.output is not None:
        args.output.write_text(text + "\n")
    print(text)


if __name__ == "__main__":
    main()
