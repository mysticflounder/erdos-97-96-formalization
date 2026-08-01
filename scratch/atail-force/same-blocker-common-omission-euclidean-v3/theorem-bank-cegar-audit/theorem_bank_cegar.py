#!/usr/bin/env python3
"""Incremental source-theorem cuts for the n=17 incidence audit.

This scratch driver imports the existing finite model and adds only instances
of FivePointEuclideanObstruction.false_of_five_ccw_second_two_selected_rows.
An instance is guarded by the candidate's actual increasing linear positions;
cyclic rotations are deliberately not generated.
"""

from __future__ import annotations

import argparse
import itertools
import json
import sys
import time
from pathlib import Path


HERE = Path(__file__).resolve().parent
LANE = HERE.parent
sys.path.insert(0, str(LANE))

import incidence_cegar  # noqa: E402


THEOREM = (
    "Problem97.FivePointEuclideanObstruction."
    "false_of_five_ccw_second_two_selected_rows"
)
SOURCE_WITNESS = (
    LANE
    / "incidence-audit"
    / "n17-profile-6-8-6-incidence-five-center-deletion-geometric-incidence-"
    "full-shared-pair-separation"
    / "witness.json"
)
EXPECTED_SOURCE_MATCHES = {
    ("t3", "a2", "q1", "a3", "s1"),
    ("t2", "r1", "q2", "r2", "s4"),
}


def ordered_schema_matches(
    vertices: tuple[int, ...],
    positions: dict[int, int],
    rows: dict[int, set[int]],
) -> list[tuple[int, int, int, int, int]]:
    """All anchored increasing instances of the exact five-point antecedent."""
    ordered = sorted(vertices, key=positions.__getitem__)
    if [positions[v] for v in ordered] != list(range(len(vertices))):
        raise AssertionError(("positions-not-a-permutation", positions))
    matches = []
    for a, b, c, d, e in itertools.combinations(ordered, 5):
        if {a, c, e}.issubset(rows[d]) and {a, b}.issubset(rows[e]):
            matches.append((a, b, c, d, e))
    return matches


def theorem_cut(z3, positions, memberships, match: tuple[int, ...]):
    """Negation of the exact theorem antecedent, including its order guard."""
    a, b, c, d, e = match
    return z3.Or(
        positions[a] >= positions[b],
        positions[b] >= positions[c],
        positions[c] >= positions[d],
        positions[d] >= positions[e],
        z3.Not(memberships[d, a]),
        z3.Not(memberships[d, c]),
        z3.Not(memberships[d, e]),
        z3.Not(memberships[e, a]),
        z3.Not(memberships[e, b]),
    )


def source_witness_self_check() -> dict[str, object]:
    payload = json.loads(SOURCE_WITNESS.read_text())
    order = payload["existential_cyclic_order"]
    positions_by_name = {name: index for index, name in enumerate(order)}
    rows_by_name = {name: set(row) for name, row in payload["rows"].items()}
    names = tuple(order)
    ids = {name: index for index, name in enumerate(names)}
    positions = {ids[name]: position for name, position in positions_by_name.items()}
    rows = {
        ids[center]: {ids[point] for point in support}
        for center, support in rows_by_name.items()
    }
    found_ids = ordered_schema_matches(tuple(range(len(names))), positions, rows)
    found = {tuple(names[v] for v in match) for match in found_ids}
    if found != EXPECTED_SOURCE_MATCHES:
        raise AssertionError(("source-match-drift", found, EXPECTED_SOURCE_MATCHES))

    # Independently smoke-check that the guarded clause rejects a true
    # antecedent but permits the same memberships when this anchored order is
    # false.  This is deliberately not a cyclic-rotation adapter.
    import z3

    primary = tuple(range(5))
    symbolic_positions = {v: z3.Int(f"self_check_position_{v}") for v in primary}
    symbolic_memberships = {
        (center, point): z3.Bool(f"self_check_m_{center}_{point}")
        for center in primary for point in primary
    }
    cut = theorem_cut(z3, symbolic_positions, symbolic_memberships, primary)
    fixed_memberships = [
        symbolic_memberships[primary[3], primary[0]],
        symbolic_memberships[primary[3], primary[2]],
        symbolic_memberships[primary[3], primary[4]],
        symbolic_memberships[primary[4], primary[0]],
        symbolic_memberships[primary[4], primary[1]],
    ]
    rejecting = z3.Solver()
    rejecting.add(cut, *fixed_memberships)
    rejecting.add(*(symbolic_positions[v] == i for i, v in enumerate(primary)))
    if rejecting.check() != z3.unsat:
        raise AssertionError("true antecedent was not rejected")
    nonanchored = z3.Solver()
    nonanchored.add(cut, *fixed_memberships)
    nonanchored.add(
        symbolic_positions[primary[0]] == 1,
        symbolic_positions[primary[1]] == 0,
        symbolic_positions[primary[2]] == 2,
        symbolic_positions[primary[3]] == 3,
        symbolic_positions[primary[4]] == 4,
    )
    if nonanchored.check() != z3.sat:
        raise AssertionError("order guard incorrectly blocked a nonanchored tuple")
    return {
        "status": "PASS",
        "theorem": THEOREM,
        "source_witness": str(SOURCE_WITNESS.relative_to(LANE)),
        "ordered_quintuples_checked": len(list(itertools.combinations(names, 5))),
        "matches": [list(match) for match in sorted(found)],
        "true_antecedent_rejected": True,
        "nonanchored_memberships_permitted": True,
        "cyclic_rotations_generated": False,
    }


def model_snapshot(audit: incidence_cegar.Audit, model) -> dict[str, object]:
    positions = {
        v: model.eval(audit.position[v], model_completion=True).as_long()
        for v in audit.vs
    }
    rows = {v: audit.row(model, v) for v in audit.vs}
    return {
        "order": [audit.names[v] for v in sorted(audit.vs, key=positions.__getitem__)],
        "rows": {
            audit.names[c]: [audit.names[p] for p in sorted(rows[c])]
            for c in audit.vs
        },
        "matches": [
            [audit.names[v] for v in match]
            for match in ordered_schema_matches(audit.vs, positions, rows)
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
        elapsed_ms = int((time.monotonic() - started) * 1000)
        remaining = timeout_ms - elapsed_ms
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
        last_candidate = model_snapshot(audit, model)
        closed = audit.closed_reachable_set(model)
        if closed is not None:
            record["kind"] = "connectivity-cut"
            record["closed_set"] = [audit.names[v] for v in sorted(closed)]
            audit.add_cut(closed)
            iterations.append(record)
            continue

        connected_candidate_count += 1
        positions = {
            v: model.eval(audit.position[v], model_completion=True).as_long()
            for v in audit.vs
        }
        rows = {v: audit.row(model, v) for v in audit.vs}
        matches = ordered_schema_matches(audit.vs, positions, rows)
        theorem_match_count_seen += len(matches)
        if matches:
            fresh = [match for match in matches if match not in theorem_cuts]
            if not fresh:
                raise AssertionError(("theorem-cut-made-no-progress", matches))
            for match in fresh:
                audit.add(
                    "five_ccw_second_two_selected_rows",
                    theorem_cut(audit.z3, audit.position, audit.m, match),
                )
                theorem_cuts.add(match)
            record["kind"] = "theorem-bank-cuts"
            record["match_count"] = len(matches)
            record["fresh_cut_count"] = len(fresh)
            record["matches"] = [[audit.names[v] for v in match] for match in matches]
            iterations.append(record)
            continue

        witness = audit.replay(model)
        witness["five_point_theorem_bank_replay"] = {
            "status": "PASS",
            "active_antecedents": 0,
            "ordered_quintuples_checked": len(list(itertools.combinations(audit.vs, 5))),
            "cyclic_rotations_generated": False,
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
        "schema": "five-ccw-second-two-selected-rows-theorem-bank-cegar-v1",
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
            "only the a1-anchored linear order chosen by the existing cap-block position model; "
            "no cyclic rotations or reversal adapters"
        ),
        "core": None,
        "core_note": "Z3 unsat-core extraction and DRAT/LRAT certification were not requested",
        "omitted": [
            "Euclidean coordinates and direct strict-CCW/injectivity proof objects",
            "QF_NRA realizability",
            "MEC and nonobtuse-triangle inequalities",
            "full CounterexampleData noM44 geometry",
            "cyclic rotation and reversal adapters",
            "Lean kernel closure and transitive axiom audit",
        ],
        "trust_boundary": {
            "encoding_to_source_theorem_manually_audited": True,
            "source_theorem_cut_conditional_on_common_injective_strict_ccw_realization": True,
            "sat_witness_semantically_replayed": status == "SAT",
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
    print(json.dumps({"self_check": self_check["status"], "matches": self_check["matches"]}))
    if args.run:
        result = run(args.timeout_ms, args.max_iterations, HERE / "n17-profile-6-8-6")
        print(json.dumps({
            "status": result["status"],
            "elapsed_ms": result["elapsed_ms"],
            "candidates": result["candidate_count"],
            "theorem_cuts": result["theorem_cut_count"],
            "artifact": str(HERE / "n17-profile-6-8-6" / "result.json"),
        }, sort_keys=True))


if __name__ == "__main__":
    main()
