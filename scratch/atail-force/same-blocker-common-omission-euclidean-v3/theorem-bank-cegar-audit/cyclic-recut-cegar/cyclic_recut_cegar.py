#!/usr/bin/env python3
"""CEGAR audit for the direction-preserving cyclic-recut five-point cut."""

from __future__ import annotations

import argparse
import itertools
import json
import sys
import time
from pathlib import Path


HERE = Path(__file__).resolve().parent
BASE_AUDIT = HERE.parent
LANE = BASE_AUDIT.parent
sys.path.insert(0, str(LANE))

import incidence_cegar  # noqa: E402


THEOREM = (
    "Problem97.FivePointEuclideanObstruction."
    "false_of_five_ccw_second_two_selected_rows_cyclicShift"
)
SOURCE_WITNESS = (
    LANE
    / "incidence-audit"
    / "n17-profile-6-8-6-incidence-five-center-deletion-geometric-incidence-"
    "full-shared-pair-separation"
    / "witness.json"
)
EXPECTED_ANCHORED_SOURCE_MATCHES = {
    ("t3", "a2", "q1", "a3", "s1"),
    ("t2", "r1", "q2", "r2", "s4"),
}
EXPECTED_CYCLIC_SOURCE_MATCH_COUNT = 13


def rotations(points: tuple[int, ...]):
    for shift in range(len(points)):
        yield points[shift:] + points[:shift]


def cyclic_order_guard(z3, positions, points: tuple[int, ...]):
    """The points occur in this direction-preserving cyclic order."""
    cases = []
    for order in rotations(points):
        cases.append(z3.And(*(positions[x] < positions[y] for x, y in zip(order, order[1:]))))
    return z3.Or(*cases)


def antecedent_holds(rows: dict[int, set[int]], points: tuple[int, ...]) -> bool:
    a, b, c, d, e = points
    return {a, c, e}.issubset(rows[d]) and {a, b}.issubset(rows[e])


def cyclic_schema_matches(
    vertices: tuple[int, ...],
    positions: dict[int, int],
    rows: dict[int, set[int]],
) -> list[tuple[int, int, int, int, int]]:
    """All positive-orientation cyclic instances; no reversed tuple is generated."""
    ordered = tuple(sorted(vertices, key=positions.__getitem__))
    if [positions[v] for v in ordered] != list(range(len(vertices))):
        raise AssertionError(("positions-not-a-permutation", positions))
    matches = []
    for subset in itertools.combinations(ordered, 5):
        for points in rotations(subset):
            if antecedent_holds(rows, points):
                matches.append(points)
    return matches


def anchored_schema_matches(
    vertices: tuple[int, ...], positions: dict[int, int], rows: dict[int, set[int]]
) -> list[tuple[int, int, int, int, int]]:
    ordered = tuple(sorted(vertices, key=positions.__getitem__))
    return [points for points in itertools.combinations(ordered, 5) if antecedent_holds(rows, points)]


def theorem_cut(z3, positions, memberships, points: tuple[int, ...]):
    """Negate exactly the recut-order guard and five positive row memberships."""
    a, b, c, d, e = points
    return z3.Or(
        z3.Not(cyclic_order_guard(z3, positions, points)),
        z3.Not(memberships[d, a]),
        z3.Not(memberships[d, c]),
        z3.Not(memberships[d, e]),
        z3.Not(memberships[e, a]),
        z3.Not(memberships[e, b]),
    )


def source_witness_self_check() -> dict[str, object]:
    payload = json.loads(SOURCE_WITNESS.read_text())
    names = tuple(payload["existential_cyclic_order"])
    ids = {name: index for index, name in enumerate(names)}
    positions = {ids[name]: index for index, name in enumerate(names)}
    rows = {
        ids[center]: {ids[point] for point in support}
        for center, support in payload["rows"].items()
    }
    vertices = tuple(range(len(names)))
    anchored = {
        tuple(names[v] for v in points)
        for points in anchored_schema_matches(vertices, positions, rows)
    }
    cyclic = cyclic_schema_matches(vertices, positions, rows)
    if anchored != EXPECTED_ANCHORED_SOURCE_MATCHES:
        raise AssertionError(("anchored-source-match-drift", anchored))
    if len(cyclic) != EXPECTED_CYCLIC_SOURCE_MATCH_COUNT:
        raise AssertionError(("cyclic-source-match-drift", len(cyclic)))

    # Exhaust every linear order on five symbolic vertices.  With all five
    # positive memberships asserted, exactly the five direction-preserving
    # rotations must be rejected.  All 115 other orders, including the five
    # reverse rotations, must remain permitted.
    import z3

    primary = tuple(range(5))
    symbolic_positions = {v: z3.Int(f"self_position_{v}") for v in primary}
    symbolic_memberships = {
        (center, point): z3.Bool(f"self_m_{center}_{point}")
        for center in primary for point in primary
    }
    cut = theorem_cut(z3, symbolic_positions, symbolic_memberships, primary)
    fixed_memberships = [
        symbolic_memberships[3, 0], symbolic_memberships[3, 2],
        symbolic_memberships[3, 4], symbolic_memberships[4, 0],
        symbolic_memberships[4, 1],
    ]
    rejected = []
    permitted = []
    positive_orders = set(rotations(primary))
    for order in itertools.permutations(primary):
        solver = z3.Solver()
        solver.add(cut, *fixed_memberships)
        solver.add(*(symbolic_positions[v] == order.index(v) for v in primary))
        outcome = solver.check()
        expected = z3.unsat if order in positive_orders else z3.sat
        if outcome != expected:
            raise AssertionError(("cyclic-guard-smoke-failure", order, outcome, expected))
        (rejected if outcome == z3.unsat else permitted).append(order)

    return {
        "status": "PASS",
        "theorem": THEOREM,
        "source_witness": str(SOURCE_WITNESS.relative_to(LANE)),
        "anchored_source_match_count": len(anchored),
        "cyclic_source_match_count": len(cyclic),
        "cyclic_source_matches": [
            [names[v] for v in points] for points in cyclic
        ],
        "five_vertex_orders_exhausted": 120,
        "positive_rotation_orders_rejected": len(rejected),
        "other_orders_permitted": len(permitted),
        "reverse_rotations_permitted": all(
            tuple(reversed(order)) in permitted for order in positive_orders
        ),
        "reversal_generated": False,
        "antecedent_literals": ["m[d,a]", "m[d,c]", "m[d,e]", "m[e,a]", "m[e,b]"],
    }


def model_data(audit: incidence_cegar.Audit, model):
    positions = {
        v: model.eval(audit.position[v], model_completion=True).as_long()
        for v in audit.vs
    }
    rows = {v: audit.row(model, v) for v in audit.vs}
    return positions, rows


def snapshot(audit: incidence_cegar.Audit, model) -> dict[str, object]:
    positions, rows = model_data(audit, model)
    return {
        "order": [audit.names[v] for v in sorted(audit.vs, key=positions.__getitem__)],
        "rows": {
            audit.names[c]: [audit.names[p] for p in sorted(rows[c])]
            for c in audit.vs
        },
        "cyclic_matches": [
            [audit.names[v] for v in points]
            for points in cyclic_schema_matches(audit.vs, positions, rows)
        ],
    }


def run(timeout_ms: int, max_iterations: int, run_dir: Path) -> dict[str, object]:
    run_dir.mkdir(parents=True, exist_ok=True)
    audit = incidence_cegar.Audit(17, (6, 8, 6), True, False, True)
    started = time.monotonic()
    iterations: list[dict[str, object]] = []
    theorem_cuts: set[tuple[int, ...]] = set()
    candidate_count = 0
    connected_candidate_count = 0
    theorem_match_count_seen = 0
    witness = None
    last_candidate = None

    for iteration in range(max_iterations):
        remaining = timeout_ms - int((time.monotonic() - started) * 1000)
        if remaining <= 0:
            status = "UNKNOWN_TIMEOUT"
            break
        audit.solver.set(timeout=remaining)
        check_started = time.monotonic()
        outcome = audit.solver.check()
        record: dict[str, object] = {
            "iteration": iteration,
            "check_ms": int((time.monotonic() - check_started) * 1000),
            "result": str(outcome),
        }
        if outcome == audit.z3.unknown:
            record["reason"] = audit.solver.reason_unknown()
            iterations.append(record)
            status = "UNKNOWN"
            break
        if outcome == audit.z3.unsat:
            iterations.append(record)
            status = "UNSAT_UNCERTIFIED"
            break

        candidate_count += 1
        model = audit.solver.model()
        last_candidate = snapshot(audit, model)
        closed = audit.closed_reachable_set(model)
        if closed is not None:
            record["kind"] = "connectivity-cut"
            record["closed_set"] = [audit.names[v] for v in sorted(closed)]
            audit.add_cut(closed)
            iterations.append(record)
            continue

        connected_candidate_count += 1
        positions, rows = model_data(audit, model)
        matches = cyclic_schema_matches(audit.vs, positions, rows)
        theorem_match_count_seen += len(matches)
        if matches:
            fresh = [points for points in matches if points not in theorem_cuts]
            if not fresh:
                raise AssertionError(("cyclic-theorem-cut-made-no-progress", matches))
            for points in fresh:
                audit.add(
                    "five_ccw_second_two_selected_rows_cyclic_recut",
                    theorem_cut(audit.z3, audit.position, audit.m, points),
                )
                theorem_cuts.add(points)
            record.update({
                "kind": "cyclic-theorem-bank-cuts",
                "match_count": len(matches),
                "fresh_cut_count": len(fresh),
                "matches": [[audit.names[v] for v in points] for points in matches],
            })
            iterations.append(record)
            continue

        witness = audit.replay(model)
        witness["cyclic_recut_theorem_bank_replay"] = {
            "status": "PASS",
            "active_antecedents": 0,
            "increasing_quintuples_checked": 6188,
            "positive_cyclic_orders_checked": 30940,
            "reversal_generated": False,
        }
        record["kind"] = "surviving-candidate"
        record["semantic_replay"] = "PASS"
        iterations.append(record)
        status = "SAT"
        break
    else:
        status = "UNKNOWN_ITERATION_LIMIT"

    elapsed_ms = int((time.monotonic() - started) * 1000)
    result = {
        "schema": "five-ccw-second-two-selected-rows-cyclic-recut-cegar-v1",
        "status": status,
        "n": 17,
        "closed_cap_profile": [6, 8, 6],
        "timeout_ms": timeout_ms,
        "elapsed_ms": elapsed_ms,
        "solver": "Z3 finite Boolean SAT plus existential integer cap-block positions",
        "theorem": THEOREM,
        "candidate_count": candidate_count,
        "connected_candidate_count": connected_candidate_count,
        "connectivity_cut_count": len(audit.cuts),
        "theorem_match_count_seen": theorem_match_count_seen,
        "theorem_cut_count": len(theorem_cuts),
        "iterations": iterations,
        "assertion_block_counts": dict(sorted(audit.blocks.items())),
        "cyclic_order_scope": (
            "all five rotations of every increasing quintuple in the existential "
            "strict-CCW order; direction preserved; no reversal"
        ),
        "core": None,
        "core_note": "SAT needs no UNSAT certificate; no DRAT/LRAT path was used",
        "omitted": [
            "Euclidean coordinates and direct strict-CCW/injectivity proof objects",
            "QF_NRA realizability",
            "MEC and nonobtuse-triangle inequalities",
            "full CounterexampleData noM44 geometry",
            "reversal adapter",
            "Lean build, kernel closure, and transitive axiom audit",
        ],
        "trust_boundary": {
            "encoding_to_source_theorem_source_audited": True,
            "cyclic_guard_exhaustively_smoke_checked_on_five_vertices": True,
            "theorem_cut_conditional_on_common_injective_strict_ccw_realization": True,
            "sat_witness_semantically_replayed": status == "SAT",
            "independent_target_replay_required": True,
            "unsat_certificate_checked": False,
            "lean_kernel_proof": False,
            "universal_n_claim": False,
        },
    }
    (run_dir / "result.json").write_text(json.dumps(result, indent=2, sort_keys=True) + "\n")
    (run_dir / "iterations.jsonl").write_text(
        "".join(json.dumps(item, sort_keys=True) + "\n" for item in iterations)
    )
    if witness is not None:
        (run_dir / "witness.json").write_text(json.dumps(witness, indent=2, sort_keys=True) + "\n")
    elif last_candidate is not None:
        (run_dir / "last-candidate.json").write_text(
            json.dumps(last_candidate, indent=2, sort_keys=True) + "\n"
        )
    return result


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--self-check", action="store_true")
    parser.add_argument("--run", action="store_true")
    parser.add_argument("--timeout-ms", type=int, default=300_000)
    parser.add_argument("--max-iterations", type=int, default=500)
    args = parser.parse_args()
    if not (args.self_check or args.run):
        parser.error("choose --self-check and/or --run")

    self_check = source_witness_self_check()
    (HERE / "self-check.json").write_text(json.dumps(self_check, indent=2, sort_keys=True) + "\n")
    print(json.dumps({
        "self_check": self_check["status"],
        "source_cyclic_matches": self_check["cyclic_source_match_count"],
    }, sort_keys=True))
    if args.run:
        run_dir = HERE / "n17-profile-6-8-6"
        result = run(args.timeout_ms, args.max_iterations, run_dir)
        print(json.dumps({
            "status": result["status"],
            "elapsed_ms": result["elapsed_ms"],
            "candidates": result["candidate_count"],
            "theorem_cuts": result["theorem_cut_count"],
            "artifact": str(run_dir / "result.json"),
        }, sort_keys=True))


if __name__ == "__main__":
    main()
