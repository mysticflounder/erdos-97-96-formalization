#!/usr/bin/env python3
"""One-shot QF_NRA audit of the fixed replay-PASS incidence witness.

This script does not reconstruct unreported Boolean radius classes.  It asks
for one common Euclidean coordinate assignment satisfying the reported cyclic
order, every selected four-point radius row, and only the complementary
disequalities forced by reported complete classes.
"""

from __future__ import annotations

import argparse
import hashlib
import itertools
import json
import time
from collections import Counter
from pathlib import Path
from typing import Any


HERE = Path(__file__).resolve().parent
LANE = HERE.parent
WITNESS = (
    LANE
    / "incidence-audit"
    / "n17-profile-6-8-6-incidence-five-center-deletion-geometric-incidence-full-shared-pair-separation"
    / "witness.json"
)


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def load_and_check(path: Path) -> tuple[dict[str, Any], dict[str, Any]]:
    data = json.loads(path.read_text())
    order = data["existential_cyclic_order"]
    rows = data["rows"]
    blockers = data["blockers"]
    packet = data["packet"]
    names = set(order)

    assert data["semantic_replay"] == "PASS"
    assert len(order) == 17 and len(names) == 17
    assert set(rows) == names and set(blockers) == names
    for center, row in rows.items():
        assert len(row) == 4 and len(set(row)) == 4
        assert center not in row and set(row) <= names
    for source, center in blockers.items():
        assert source != center and source in rows[center]

    critical_centers = sorted(set(blockers.values()))
    source_counts = Counter(blockers.values())
    a1_classes = {
        "selected_row": rows["a1"],
        "p_first_apex_class": packet["p_first_apex_class"],
        "r_first_apex_class": packet["r_first_apex_class"],
        "q_first_apex_class": packet["q_first_apex_class"],
    }
    assert all(len(xs) == 4 and len(set(xs)) == 4 for xs in a1_classes.values())
    assert set().union(*(set(xs) for xs in a1_classes.values())) == names - {"a1"}
    assert sum(len(xs) for xs in a1_classes.values()) == 16
    assert sum(len(set(x) & set(y)) for x, y in itertools.combinations(a1_classes.values(), 2)) == 0

    check = {
        "status": "SELF_CHECK_OK",
        "semantic_replay": data["semantic_replay"],
        "carrier_cardinality": len(order),
        "selected_row_count": len(rows),
        "selected_row_size": 4,
        "critical_centers_with_complete_selected_class": critical_centers,
        "critical_center_count": len(critical_centers),
        "critical_source_counts": dict(sorted(source_counts.items())),
        "a1_complete_class_partition": a1_classes,
        "cyclic_order": order,
        "witness_sha256": sha256(path),
    }
    return data, check


def build_solver(data: dict[str, Any], timeout_ms: int):
    import z3

    order = data["existential_cyclic_order"]
    rows = data["rows"]
    blockers = data["blockers"]
    packet = data["packet"]
    coords = {name: z3.Reals(f"{name}_x {name}_y") for name in order}
    solver = z3.SolverFor("QF_NRA")
    solver.set(timeout=timeout_ms)
    counts: Counter[str] = Counter()
    replay_terms: list[tuple[str, Any]] = []

    def add(block: str, term) -> None:
        solver.add(term)
        counts[block] += 1
        replay_terms.append((block, term))

    def sqdist(a: str, b: str):
        ax, ay = coords[a]
        bx, by = coords[b]
        return (ax - bx) ** 2 + (ay - by) ** 2

    def orient(a: str, b: str, c: str):
        ax, ay = coords[a]
        bx, by = coords[b]
        cx, cy = coords[c]
        return (bx - ax) * (cy - ay) - (by - ay) * (cx - ax)

    # Orientation-preserving similarity gauge.  a1 and a2 are distinct under
    # the strict-order constraints, so every realization has this normal form.
    add("similarity_gauge", coords["a1"][0] == 0)
    add("similarity_gauge", coords["a1"][1] == 0)
    add("similarity_gauge", coords["a2"][0] == 1)
    add("similarity_gauge", coords["a2"][1] == 0)

    # For a CCW strictly convex polygon, every increasing triple in its cyclic
    # boundary order has positive orientation.  Conversely these constraints
    # imply the reported order, strict convexity, point distinctness, and no
    # three collinear carrier points.
    for i, j, k in itertools.combinations(range(len(order)), 3):
        add("strict_convex_general_position", orient(order[i], order[j], order[k]) > 0)

    # Every reported selected Boolean row is one co-radial four-set.  Three
    # equalities per row are the smallest spanning encoding of that fact.
    for center, row in rows.items():
        radius = sqdist(center, row[0])
        for target in row[1:]:
            add("selected_row_equalities", sqdist(center, target) == radius)

    # If a center is chosen by at least one critical source, replay established
    # that its selected row is the complete distance class of that source.
    # Every complementary carrier target must therefore have unequal radius.
    for center in sorted(set(blockers.values())):
        row = rows[center]
        radius = sqdist(center, row[0])
        for target in order:
            if target != center and target not in row:
                add("critical_complete_class_disequalities", sqdist(center, target) != radius)

    # At a1 the packet reports three further complete four-point classes; with
    # the selected row these partition all 16 targets.  Within-class equalities
    # plus pairwise representative disequalities encode the exact partition.
    a1_classes = [
        rows["a1"],
        packet["p_first_apex_class"],
        packet["r_first_apex_class"],
        packet["q_first_apex_class"],
    ]
    for cls in a1_classes[1:]:  # selected row was encoded above
        radius = sqdist("a1", cls[0])
        for target in cls[1:]:
            add("a1_exact_class_equalities", sqdist("a1", target) == radius)
    for left, right in itertools.combinations(a1_classes, 2):
        add("a1_exact_class_disequalities", sqdist("a1", left[0]) != sqdist("a1", right[0]))

    return solver, coords, counts, replay_terms, z3


def smoke_test() -> dict[str, Any]:
    """Cheap solver-family smoke: one known SAT and one known UNSAT triangle."""
    import z3

    x, y = z3.Reals("smoke_x smoke_y")
    sat_solver = z3.SolverFor("QF_NRA")
    sat_solver.set(timeout=1_000)
    sat_solver.add(x == 0, y == 1, y > 0)
    sat_status = sat_solver.check()
    unsat_solver = z3.SolverFor("QF_NRA")
    unsat_solver.set(timeout=1_000)
    unsat_solver.add(x == 0, y > 0, y < 0)
    unsat_status = unsat_solver.check()
    assert sat_status == z3.sat and unsat_status == z3.unsat
    return {"status": "SMOKE_PASS", "known_sat": str(sat_status), "known_unsat": str(unsat_status)}


def solve(path: Path, timeout_ms: int) -> dict[str, Any]:
    data, check = load_and_check(path)
    smoke = smoke_test()
    solver, coords, counts, replay_terms, z3 = build_solver(data, timeout_ms)
    started = time.monotonic()
    status = solver.check()
    elapsed_ms = int((time.monotonic() - started) * 1000)
    result: dict[str, Any] = {
        "verdict": str(status).upper() if status != z3.unknown else "UNKNOWN",
        "classification": "external QF_NRA diagnostic; not Lean or kernel closure",
        "logic": "QF_NRA",
        "solver": f"Z3 {z3.get_version_string()} nlsat",
        "timeout_ms": timeout_ms,
        "elapsed_ms": elapsed_ms,
        "input_witness": str(path.relative_to(LANE)),
        "structural_self_check": check,
        "solver_smoke_test": smoke,
        "constraint_counts": dict(sorted(counts.items())),
        "constraint_total": sum(counts.values()),
        "encoded": [
            "one shared pair of real coordinates for all 17 named carrier points",
            "orientation-preserving gauge a1=(0,0), a2=(1,0)",
            "positive orientation for every increasing triple in the reported cyclic order",
            "squared-distance equalities for all 17 selected four-point rows",
            "complementary disequalities for selected rows at every reported critical-blocker center",
            "the exact four-class squared-distance partition at a1",
        ],
        "omitted": [
            "unreported Boolean radius-equivalence classes away from the selected rows",
            "the no-other-K4-after-source-deletion property for unreported distance classes",
            "MEC and non-obtuse-apex assumptions (not present in the fixed incidence witness)",
            "the full CounterexampleData.noM44 surface and arbitrary-n reduction",
            "Lean proof objects, Lean build, axiom audit, and kernel verification",
        ],
        "trust_boundary": "solver verdict is trusted external computation over the emitted formula",
    }
    if status == z3.unknown:
        result["reason_unknown"] = solver.reason_unknown()
    elif status == z3.sat:
        model = solver.model()
        failed = [
            block
            for block, term in replay_terms
            if not z3.is_true(model.eval(term, model_completion=True))
        ]
        if failed:
            raise AssertionError(("model replay failed", Counter(failed)))
        result["model_replay"] = {
            "status": "PASS",
            "constraints_checked": len(replay_terms),
        }
        result["coordinates"] = {
            name: [
                str(model.eval(coords[name][0], model_completion=True)),
                str(model.eval(coords[name][1], model_completion=True)),
            ]
            for name in data["existential_cyclic_order"]
        }
    else:
        result["unsat_certificate"] = None
        result["unsat_caveat"] = "Z3 QF_NRA emitted no independently checkable UNSAT certificate"
    return result


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--witness", type=Path, default=WITNESS)
    parser.add_argument("--self-check", action="store_true")
    parser.add_argument("--solve", action="store_true")
    parser.add_argument("--emit-smt2", action="store_true")
    parser.add_argument("--timeout-ms", type=int, default=300_000)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()
    if sum((args.self_check, args.solve, args.emit_smt2)) != 1:
        parser.error("choose exactly one of --self-check, --solve, or --emit-smt2")
    if args.timeout_ms <= 0 or args.timeout_ms > 300_000:
        parser.error("--timeout-ms must be in 1..300000")
    if args.self_check:
        _, check = load_and_check(args.witness)
        result = check
    elif args.solve:
        result = solve(args.witness, args.timeout_ms)
    else:
        if args.output is None:
            parser.error("--emit-smt2 requires --output")
        data, _ = load_and_check(args.witness)
        solver, _, _, _, _ = build_solver(data, args.timeout_ms)
        rendered = "(set-logic QF_NRA)\n" + solver.sexpr() + "\n(check-sat)\n"
        args.output.write_text(rendered)
        print(json.dumps({"status": "SMT2_WRITTEN", "output": str(args.output)}, sort_keys=True))
        return 0
    rendered = json.dumps(result, indent=2, sort_keys=True) + "\n"
    if args.output:
        args.output.write_text(rendered)
    print(rendered, end="")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
