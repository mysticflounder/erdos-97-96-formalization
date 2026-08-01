#!/usr/bin/env python3
"""Bounded fixed-role QF_NRA audit for the two crossed-arm survivors.

Only the ten points in the three canonical rows bp/bq/br are retained.  This
is external solver evidence, never a Lean proof.
"""

from __future__ import annotations

import argparse
import hashlib
import itertools
import json
import subprocess
import time
from collections import Counter
from dataclasses import dataclass
from pathlib import Path
from typing import Any


HERE = Path(__file__).resolve().parent
CROSSED_AUDIT = HERE.parent / "crossed-arm-audit"
ARMS = ("source-at-common", "other-at-common")
STAGES = ("metric", "local-turn", "edge-convex", "full-convex")
MAX_TIMEOUT_MS = 30_000


@dataclass(frozen=True)
class Atom:
    name: str
    family: str
    term: Any


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def require(condition: bool, message: str) -> None:
    if not condition:
        raise AssertionError(message)


def witness_path(arm: str) -> Path:
    require(arm in ARMS, f"unknown arm: {arm}")
    return CROSSED_AUDIT / arm / "witness.json"


def load_core(arm: str) -> dict[str, Any]:
    path = witness_path(arm)
    data = json.loads(path.read_text())
    require(data["semantic_replay"] == "PASS", "source witness replay is not PASS")
    require(data["crossed_arm_replay"]["status"] == "PASS", "crossed replay is not PASS")

    mapping = data["live_Lean_mapping"]
    centers = {
        "bp": mapping["first_collision_blocker_row_center_bp"],
        "bq": mapping["common_source_row_center_bq"],
        "br": mapping["opposite_collision_blocker_row_center_br"],
    }
    require(centers == {
        "bp": data["packet"]["bp"],
        "bq": data["packet"]["bq"],
        "br": data["packet"]["br"],
    }, "center mapping drift")
    require(len(set(centers.values())) == 3, "canonical centers are not distinct")

    rows = {role: list(data["rows"][center]) for role, center in centers.items()}
    require(set(rows["bp"]) == {
        mapping["P.source1"], mapping["P.source2"],
        mapping["Q.source"], mapping["Q.otherOutsidePoint"],
    }, "bp row does not replay the ordered outside pair")
    require({mapping["source_representative"], mapping["source_prime_representative"],
             mapping["forced_common_row_point"]} <= set(rows["bq"]),
            "bq row misses a named live member")
    require({mapping["P_rho.source1"], mapping["P_rho.source2"],
             mapping["forced_opposite_row_point"]} <= set(rows["br"]),
            "br row misses a named live member")
    require(mapping["forced_crossed_arm"] == arm, "arm mapping drift")

    retained = set(centers.values())
    for role, row in rows.items():
        require(len(row) == 4 and len(set(row)) == 4, f"malformed {role} row")
        require(centers[role] not in row, f"self member in {role} row")
        retained.update(row)
    full_order = data["existential_cyclic_order"]
    order = [name for name in full_order if name in retained]
    require(len(retained) == 10 and len(order) == 10, "local core is not ten points")
    require(len(set(order)) == 10, "retained order has duplicates")

    gauge_origin = centers["bp"]
    gauge_unit = mapping["P.source1"]
    require(gauge_unit in rows["bp"] and gauge_origin != gauge_unit,
            "gauge pair does not have proved distinctness")

    return {
        "arm": arm,
        "source_witness": str(path.relative_to(HERE.parent.parent.parent.parent)),
        "source_witness_sha256": sha256(path),
        "full_order": full_order,
        "retained_order": order,
        "centers": centers,
        "rows": rows,
        "mapping": mapping,
        "gauge": {"origin": gauge_origin, "unit": gauge_unit},
        "point_count": 10,
        "coordinate_variables": 20,
        "gauge_equations": 4,
        "post_gauge_dof": 16,
        "row_equalities": 9,
        "nominal_post_metric_dimension": 7,
        "algebraic_independence_claimed": False,
    }


def orient(coords: dict[str, tuple[Any, Any]], a: str, b: str, c: str):
    ax, ay = coords[a]
    bx, by = coords[b]
    cx, cy = coords[c]
    return (bx - ax) * (cy - ay) - (by - ay) * (cx - ax)


def sqdist(coords: dict[str, tuple[Any, Any]], a: str, b: str):
    ax, ay = coords[a]
    bx, by = coords[b]
    return (ax - bx) ** 2 + (ay - by) ** 2


def build_atoms(core: dict[str, Any], stage: str):
    import z3

    require(stage in STAGES, f"unknown stage: {stage}")
    order = core["retained_order"]
    coords = {name: z3.Reals(f"{name}_x {name}_y") for name in order}
    atoms: list[Atom] = []

    def add(name: str, family: str, term: Any) -> None:
        atoms.append(Atom(name, family, term))

    origin = core["gauge"]["origin"]
    unit = core["gauge"]["unit"]
    add(f"gauge_{origin}_x", "gauge", coords[origin][0] == 0)
    add(f"gauge_{origin}_y", "gauge", coords[origin][1] == 0)
    add(f"gauge_{unit}_x", "gauge", coords[unit][0] == 1)
    add(f"gauge_{unit}_y", "gauge", coords[unit][1] == 0)

    for a, b in itertools.combinations(order, 2):
        add(f"distinct_{a}_{b}", "named-distinctness", sqdist(coords, a, b) > 0)

    for role in ("bp", "bq", "br"):
        center = core["centers"][role]
        row = core["rows"][role]
        radius = sqdist(coords, center, row[0])
        for index, target in enumerate(row[1:], start=1):
            add(f"row_eq_{role}_{index}_{center}_{target}", "row-equality",
                sqdist(coords, center, target) == radius)
        outside = [target for target in order if target != center and target not in row]
        require(len(outside) == 5, f"retained complement of {role} is not size five")
        for target in outside:
            add(f"row_exact_off_{role}_{center}_{target}", "retained-row-exactness",
                sqdist(coords, center, target) != radius)

    if stage == "local-turn":
        n = len(order)
        for i in range(n):
            a, b, c = order[i], order[(i + 1) % n], order[(i + 2) % n]
            add(f"turn_{i}_{a}_{b}_{c}", "local-turn", orient(coords, a, b, c) > 0)
    elif stage == "edge-convex":
        # Exact but less redundant strict-convex order encoding: every other
        # vertex lies strictly to the left of each directed boundary edge.
        # Hence every listed edge supports the convex hull in the stated CCW
        # order.  There are n*(n-2)=80 atoms rather than C(n,3)=120.
        n = len(order)
        for i in range(n):
            a, b = order[i], order[(i + 1) % n]
            for offset in range(2, n):
                k = (i + offset) % n
                c = order[k]
                add(f"edge_order_{i}_{k}_{a}_{b}_{c}", "edge-convex-order",
                    orient(coords, a, b, c) > 0)
    elif stage == "full-convex":
        for i, j, k in itertools.combinations(range(len(order)), 3):
            a, b, c = order[i], order[j], order[k]
            add(f"order_{i}_{j}_{k}_{a}_{b}_{c}", "full-convex-order",
                orient(coords, a, b, c) > 0)

    names = [atom.name for atom in atoms]
    require(len(names) == len(set(names)), "atom name collision")
    return z3, coords, atoms


def make_solver(z3: Any, atoms: list[Atom], timeout_ms: int):
    solver = z3.SolverFor("QF_NRA")
    solver.set(timeout=timeout_ms)
    solver.add(*(atom.term for atom in atoms))
    return solver


def smt2_text(solver: Any) -> str:
    return "(set-logic QF_NRA)\n" + solver.sexpr() + "\n(check-sat)\n"


def compact_cvc5_status(text: str) -> str:
    for line in text.splitlines():
        status = line.strip().lower()
        if status in {"sat", "unsat", "unknown"}:
            return status.upper()
    return "ERROR"


def run_cvc5(smt2: str, timeout_ms: int) -> dict[str, Any]:
    started = time.monotonic()
    try:
        proc = subprocess.run(
            ["cvc5", "--lang=smt2", "--nl-cov", f"--tlimit={timeout_ms}"],
            input=smt2,
            text=True,
            capture_output=True,
            timeout=timeout_ms / 1000 + 2,
            check=False,
        )
        elapsed_ms = int((time.monotonic() - started) * 1000)
        status = compact_cvc5_status(proc.stdout)
        if status == "ERROR" and "interrupted by timeout" in proc.stderr:
            status = "TIMEOUT"
        return {
            "solver": "cvc5 1.3.3 --nl-cov",
            "timeout_ms": timeout_ms,
            "elapsed_ms": elapsed_ms,
            "status": status,
            "returncode": proc.returncode,
            "stdout_head": proc.stdout[:500],
            "stderr_head": proc.stderr[:500],
        }
    except subprocess.TimeoutExpired as exc:
        return {
            "solver": "cvc5 --nl-cov",
            "timeout_ms": timeout_ms,
            "elapsed_ms": int((time.monotonic() - started) * 1000),
            "status": "TIMEOUT",
            "stdout_head": (exc.stdout or "")[:500] if isinstance(exc.stdout, str) else "",
            "stderr_head": (exc.stderr or "")[:500] if isinstance(exc.stderr, str) else "",
        }


def smoke_test(timeout_ms: int = 2_000) -> dict[str, Any]:
    import z3

    x, y = z3.Reals("smoke_x smoke_y")
    sat_solver = z3.SolverFor("QF_NRA")
    sat_solver.set(timeout=timeout_ms)
    sat_solver.add(x * x + y * y == 1, x == 0, y > 0)
    unsat_solver = z3.SolverFor("QF_NRA")
    unsat_solver.set(timeout=timeout_ms)
    unsat_solver.add(x * x + y * y == 0, x > 0)
    # Capture portable SMT-LIB before invoking Z3: after a SAT check, Z3's
    # solver sexpr can contain internal model-add commands that cvc5 cannot
    # parse.
    sat_smt2 = smt2_text(sat_solver)
    unsat_smt2 = smt2_text(unsat_solver)
    z3_sat = str(sat_solver.check()).upper()
    z3_unsat = str(unsat_solver.check()).upper()
    require((z3_sat, z3_unsat) == ("SAT", "UNSAT"), "Z3 smoke test failed")

    cvc5_sat = run_cvc5(sat_smt2, timeout_ms)
    cvc5_unsat = run_cvc5(unsat_smt2, timeout_ms)
    require(cvc5_sat["status"] == "SAT", "cvc5 SAT smoke test failed")
    require(cvc5_unsat["status"] == "UNSAT", "cvc5 UNSAT smoke test failed")
    return {
        "status": "SMOKE_PASS",
        "timeout_ms_per_call": timeout_ms,
        "known_sat": {"formula": "x^2+y^2=1, x=0, y>0", "z3": z3_sat,
                      "cvc5_nl_cov": cvc5_sat["status"]},
        "known_unsat": {"formula": "x^2+y^2=0, x>0", "z3": z3_unsat,
                        "cvc5_nl_cov": cvc5_unsat["status"]},
    }


def solve(arm: str, stage: str, timeout_ms: int, emit_smt2: Path | None) -> dict[str, Any]:
    require(1 <= timeout_ms <= MAX_TIMEOUT_MS,
            f"timeout must be between 1 and {MAX_TIMEOUT_MS} ms")
    core = load_core(arm)
    z3, coords, atoms = build_atoms(core, stage)
    solver = make_solver(z3, atoms, timeout_ms)
    formula = smt2_text(solver)
    if emit_smt2 is not None:
        emit_smt2.parent.mkdir(parents=True, exist_ok=True)
        emit_smt2.write_text(formula)

    started = time.monotonic()
    status = solver.check()
    elapsed_ms = int((time.monotonic() - started) * 1000)
    counts = Counter(atom.family for atom in atoms)
    result: dict[str, Any] = {
        "schema": "crossed-arm-fixed-role-qf-nra-v1",
        "classification": "bounded external QF_NRA diagnostic; not Lean closure",
        "arm": arm,
        "stage": stage,
        "status": str(status).upper() if status != z3.unknown else "UNKNOWN",
        "solver": f"Z3 {z3.get_version_string()} nlsat",
        "timeout_ms": timeout_ms,
        "elapsed_ms": elapsed_ms,
        "core": core,
        "constraint_counts": dict(sorted(counts.items())),
        "constraint_total": len(atoms),
        "smt2_sha256": hashlib.sha256(formula.encode()).hexdigest(),
        "encoded": [
            "ten retained fixed-role points from the three canonical rows",
            "orientation-preserving similarity gauge bp=(0,0), P.source1=(1,0)",
            "45 pairwise named-point distinctness inequalities",
            "nine spanning squared-distance equalities for bp/bq/br",
            "15 complementary row-radius disequalities among retained points",
            "stage-specific cyclic orientation inequalities",
        ],
        "omitted": [
            "the other seven carrier points and their row exactness checks",
            "all selected rows other than bp/bq/br",
            "q-free deletion and collision five-center deletion beyond retained rows",
            "extra cap-crossing Kalmanson and shared-pair-separation projections",
            "MEC and nonobtuse-triangle inequalities",
            "full CounterexampleData/noM44/minimality/blocker provenance",
            "Lean proof, kernel closure, proof-blueprint and axiom audit",
        ],
        "trust_boundary": "external solver result; SAT requires exact model replay; UNSAT is uncertified",
    }
    if emit_smt2 is not None:
        result["smt2_path"] = str(emit_smt2.resolve().relative_to(HERE))

    if status == z3.sat:
        model = solver.model()
        failed = [atom.name for atom in atoms
                  if not z3.is_true(model.eval(atom.term, model_completion=True))]
        require(not failed, f"exact model replay failed: {failed[:8]}")
        result["model_replay"] = {
            "status": "PASS",
            "constraints_checked": len(atoms),
            "family_counts": dict(sorted(counts.items())),
        }
        result["coordinates"] = {
            name: {
                "x_exact": str(model.eval(coords[name][0], model_completion=True)),
                "y_exact": str(model.eval(coords[name][1], model_completion=True)),
                "x_decimal": model.eval(coords[name][0], model_completion=True).as_decimal(16),
                "y_decimal": model.eval(coords[name][1], model_completion=True).as_decimal(16),
            }
            for name in core["retained_order"]
        }
    elif status == z3.unknown:
        result["reason_unknown"] = solver.reason_unknown()
        if emit_smt2 is None:
            unknown_path = HERE / arm / f"{stage}.smt2"
            unknown_path.parent.mkdir(parents=True, exist_ok=True)
            unknown_path.write_text(formula)
            result["smt2_path"] = str(unknown_path.relative_to(HERE))
        result["cvc5_crosscheck"] = run_cvc5(formula, timeout_ms)
    else:
        result["unsat_certificate"] = None
        result["unsat_caveat"] = "Z3 nlsat emitted no independently checkable certificate"
    return result


def solve_edge_cegar(
    arm: str, timeout_ms: int, max_checks: int, batch_size: int, output_dir: Path
) -> dict[str, Any]:
    """Incrementally add violated exact hull-edge atoms, fail closed.

    The initial ten edge atoms are precisely the adjacent-turn relaxation.
    Every candidate model is checked against all 80 edge atoms.  SAT is
    returned only when all 153 final atoms replay in one exact Z3 model.
    """
    require(1 <= timeout_ms <= MAX_TIMEOUT_MS,
            f"timeout must be between 1 and {MAX_TIMEOUT_MS} ms")
    require(1 <= max_checks <= 20, "max-checks must be between 1 and 20")
    require(1 <= batch_size <= 80, "batch-size must be between 1 and 80")
    core = load_core(arm)
    z3, coords, all_atoms = build_atoms(core, "edge-convex")
    edge_atoms = [atom for atom in all_atoms if atom.family == "edge-convex-order"]
    base_atoms = [atom for atom in all_atoms if atom.family != "edge-convex-order"]
    order = core["retained_order"]
    local_names = {
        f"edge_order_{i}_{(i + 2) % len(order)}_{order[i]}_"
        f"{order[(i + 1) % len(order)]}_{order[(i + 2) % len(order)]}"
        for i in range(len(order))
    }
    active_edges = [atom for atom in edge_atoms if atom.name in local_names]
    require(len(active_edges) == 10, "adjacent-turn edge seed drift")
    active_names = {atom.name for atom in active_edges}
    iterations: list[dict[str, Any]] = []
    final_model = None
    status_text = "BOUNDED_INCOMPLETE"
    last_formula = ""
    cvc5_crosscheck = None
    output_dir.mkdir(parents=True, exist_ok=True)

    for check_index in range(max_checks):
        active_atoms = base_atoms + active_edges
        solver = make_solver(z3, active_atoms, timeout_ms)
        last_formula = smt2_text(solver)
        started = time.monotonic()
        status = solver.check()
        elapsed_ms = int((time.monotonic() - started) * 1000)
        entry: dict[str, Any] = {
            "check": check_index,
            "active_edge_count": len(active_edges),
            "constraint_total": len(active_atoms),
            "status": str(status).upper() if status != z3.unknown else "UNKNOWN",
            "elapsed_ms": elapsed_ms,
        }
        if status == z3.unknown:
            formula_path = output_dir / f"cegar-check-{check_index}-unknown.smt2"
            formula_path.write_text(last_formula)
            cvc5_crosscheck = run_cvc5(last_formula, timeout_ms)
            entry["reason_unknown"] = solver.reason_unknown()
            entry["cvc5_crosscheck"] = cvc5_crosscheck
            iterations.append(entry)
            status_text = "UNKNOWN"
            break
        if status == z3.unsat:
            iterations.append(entry)
            status_text = "UNSAT"
            break

        model = solver.model()
        failed_active = [atom.name for atom in active_atoms
                         if not z3.is_true(model.eval(atom.term, model_completion=True))]
        require(not failed_active, f"active CEGAR replay failed: {failed_active[:5]}")
        violated = [atom for atom in edge_atoms
                    if not z3.is_true(model.eval(atom.term, model_completion=True))]
        entry["violated_full_edge_count"] = len(violated)
        if not violated:
            iterations.append(entry)
            status_text = "SAT"
            final_model = model
            break
        fresh = [atom for atom in violated if atom.name not in active_names]
        require(fresh, "CEGAR has violations but no fresh edge atom")
        chosen = fresh[:batch_size]
        entry["added_edge_atoms"] = [atom.name for atom in chosen]
        iterations.append(entry)
        active_edges.extend(chosen)
        active_names.update(atom.name for atom in chosen)

    result: dict[str, Any] = {
        "schema": "crossed-arm-edge-cegar-v1",
        "classification": "bounded external QF_NRA diagnostic; not Lean closure",
        "arm": arm,
        "target": "all 80 exact strict-convex supporting-edge inequalities",
        "status": status_text,
        "solver": f"Z3 {z3.get_version_string()} nlsat",
        "timeout_ms_per_check": timeout_ms,
        "max_checks": max_checks,
        "batch_size": batch_size,
        "base_constraint_count": len(base_atoms),
        "target_edge_count": len(edge_atoms),
        "iterations": iterations,
        "final_active_edge_count": len(active_edges),
        "core": core,
        "trust_boundary": "SAT only after exact replay of all target atoms; UNKNOWN/incomplete is no evidence",
    }
    if cvc5_crosscheck is not None:
        result["last_unknown_cvc5_crosscheck"] = cvc5_crosscheck
    if status_text == "SAT":
        require(final_model is not None, "missing final SAT model")
        failed = [atom.name for atom in all_atoms
                  if not z3.is_true(final_model.eval(atom.term, model_completion=True))]
        require(not failed, f"full edge replay failed: {failed[:8]}")
        result["model_replay"] = {"status": "PASS", "constraints_checked": len(all_atoms)}
        result["coordinates"] = {
            name: {
                "x_exact": str(final_model.eval(coords[name][0], model_completion=True)),
                "y_exact": str(final_model.eval(coords[name][1], model_completion=True)),
                "x_decimal": final_model.eval(coords[name][0], model_completion=True).as_decimal(16),
                "y_decimal": final_model.eval(coords[name][1], model_completion=True).as_decimal(16),
            }
            for name in core["retained_order"]
        }
    elif status_text == "UNSAT":
        result["unsat_certificate"] = None
        result["unsat_caveat"] = "uncertified Z3 nlsat result for the active subset"
    elif status_text == "BOUNDED_INCOMPLETE":
        result["note"] = "check budget exhausted before a full target model or contradiction"
        (output_dir / "cegar-final-active.smt2").write_text(last_formula)
    return result


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--self-check", action="store_true")
    parser.add_argument("--smoke", action="store_true")
    parser.add_argument("--arm", choices=ARMS)
    parser.add_argument("--stage", choices=STAGES, default="metric")
    parser.add_argument("--timeout-ms", type=int, default=MAX_TIMEOUT_MS)
    parser.add_argument("--edge-cegar", action="store_true")
    parser.add_argument("--max-checks", type=int, default=4)
    parser.add_argument("--batch-size", type=int, default=12)
    parser.add_argument("--cegar-output-dir", type=Path)
    parser.add_argument("--emit-smt2", type=Path)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()

    if args.smoke:
        payload: Any = smoke_test()
    elif args.self_check:
        payload = {arm: load_core(arm) for arm in ARMS}
        payload["status"] = "SELF_CHECK_PASS"
    elif args.edge_cegar:
        require(args.arm is not None, "--arm is required for --edge-cegar")
        require(args.cegar_output_dir is not None,
                "--cegar-output-dir is required for --edge-cegar")
        payload = solve_edge_cegar(
            args.arm, args.timeout_ms, args.max_checks, args.batch_size,
            args.cegar_output_dir)
    else:
        require(args.arm is not None, "--arm is required unless --self-check or --smoke")
        payload = solve(args.arm, args.stage, args.timeout_ms, args.emit_smt2)
    text = json.dumps(payload, indent=2, sort_keys=True) + "\n"
    if args.output is not None:
        args.output.parent.mkdir(parents=True, exist_ok=True)
        args.output.write_text(text)
    print(text, end="")


if __name__ == "__main__":
    main()
