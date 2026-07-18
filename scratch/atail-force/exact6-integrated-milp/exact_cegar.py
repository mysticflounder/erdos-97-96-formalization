#!/usr/bin/env python3
"""Exact Kalmanson CEGAR with append-only cuts and a terminal DRAT gate.

The structural outer is the corrected deterministic n=14 encoder with both
literal metric-cut banks omitted.  Each SAT assignment is checked by an exact
QF_LRA oracle.  An UNSAT oracle result is converted to an integer Farkas
cancellation, independently replayed in-process, appended to the cut bank,
and asserted as a Boolean nogood.  Structural exhaustion is finally rerun by
CaDiCaL with DRAT output and checked by drat-trim.
"""

from __future__ import annotations

import argparse
import atexit
import hashlib
import itertools
import json
import math
import subprocess
import time
from collections import defaultdict
from pathlib import Path

import z3

import integrated_milp as integrated
from verify_results import QuietLog


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def edge(left: int, right: int) -> tuple[int, int]:
    if left == right:
        raise ValueError("distance loop")
    return tuple(sorted((left, right)))


def vector(name: str) -> dict[tuple[int, int], int]:
    parts = name.split("_")
    result: dict[tuple[int, int], int] = defaultdict(int)
    if parts[0] in {"kal1", "kal2"} and len(parts) == 5:
        a, b, c, d = map(int, parts[1:])
        if not 0 <= a < b < c < d < 14:
            raise ValueError(f"non-cyclic Kalmanson index order: {name}")
        terms = [(a, c, 1), (b, d, 1)]
        if parts[0] == "kal1":
            terms.extend(((a, b, -1), (c, d, -1)))
        else:
            terms.extend(((a, d, -1), (b, c, -1)))
    elif parts[0] == "row" and len(parts) == 4:
        center, reference, point = map(int, parts[1:])
        if not all(0 <= item < 14 for item in (center, reference, point)):
            raise ValueError(f"row index outside carrier: {name}")
        if len({center, reference, point}) != 3:
            raise ValueError(f"degenerate row equality: {name}")
        terms = [(center, point, 1), (center, reference, -1)]
    elif parts[0] == "shell" and len(parts) == 4:
        center, reference, point = map(int, parts[1:])
        if center != 9 or not all(0 <= item < 14 for item in (center, reference, point)):
            raise ValueError(f"invalid shell equality: {name}")
        if len({center, reference, point}) != 3:
            raise ValueError(f"degenerate shell equality: {name}")
        terms = [(center, point, 1), (center, reference, -1)]
    elif parts[0] in {"nonneg", "positive"} and len(parts) == 3:
        left, right = map(int, parts[1:])
        if not 0 <= left < right < 14:
            raise ValueError(f"distance lower-bound order/range failure: {name}")
        terms = [(left, right, 1)]
    else:
        raise ValueError(f"unknown constraint {name}")
    for left, right, coefficient in terms:
        result[edge(left, right)] += coefficient
    return {term: value for term, value in result.items() if value}


def verify_exact_cut(cut: dict[str, object]) -> None:
    total: dict[tuple[int, int], int] = defaultdict(int)
    strict_weight = 0
    memberships: set[tuple[int, int]] = set()
    shell_used = False
    for item in cut["constraints"]:  # type: ignore[index]
        name = item["name"]
        multiplier = int(item["multiplier"])
        if name.startswith("kal"):
            if multiplier <= 0:
                raise ValueError(f"nonpositive strict multiplier: {name}")
            strict_weight += multiplier
        elif name.startswith(("nonneg", "positive")):
            if multiplier < 0:
                raise ValueError(f"negative distance-lower-bound multiplier: {name}")
        elif name.startswith("row"):
            _, center, reference, point = name.split("_")
            memberships.add((int(center), int(reference)))
            memberships.add((int(center), int(point)))
        elif name.startswith("shell"):
            shell_used = True
        for term, coefficient in vector(name).items():
            total[term] += multiplier * coefficient
    residual = {term: value for term, value in total.items() if value}
    if residual:
        raise ValueError(f"nonzero exact cut residual: {residual}")
    if strict_weight <= 0 or strict_weight != int(cut["strict_weight_sum"]):
        raise ValueError("strict weight mismatch")
    required = {tuple(item) for item in cut["required_memberships"]}  # type: ignore[index]
    if memberships != required:
        raise ValueError("membership antecedent mismatch")
    if any(
        not (0 <= center < 14 and 0 <= point < 14 and center != point)
        for center, point in required
    ):
        raise ValueError("membership antecedent domain failure")
    shell = cut.get("conditioned_shell")
    if shell_used != (shell is not None):
        raise ValueError("shell conditioning mismatch")
    if shell is not None and (len(shell) != 5 or len(set(shell)) != 5):
        raise ValueError("invalid conditioned shell")
    if shell is not None and (9 in shell or any(not 0 <= point < 14 for point in shell)):
        raise ValueError("conditioned shell domain/apex failure")


def event(log_path: Path, phase: str, **fields: object) -> None:
    payload = {"time": time.time(), "phase": phase, **fields}
    line = json.dumps(payload, sort_keys=True)
    print(line, flush=True)
    with log_path.open("a", encoding="utf-8") as handle:
        handle.write(line + "\n")


def add_clause_to_z3(solver: z3.Solver, variables: list[z3.BoolRef], clause) -> None:
    solver.add(z3.Or(*(
        variables[abs(literal) - 1] if literal > 0
        else z3.Not(variables[abs(literal) - 1])
        for literal in clause
    )))


def cut_clause(encoder, cut: dict[str, object]) -> tuple[int, ...]:
    literals = [
        -encoder.m(int(center), int(point))
        for center, point in cut["required_memberships"]  # type: ignore[index]
    ]
    shell = cut.get("conditioned_shell")
    if shell is not None:
        shell_set = set(shell)
        literals.extend(
            -encoder.shell[point] if point in shell_set else encoder.shell[point]
            for point in encoder.shell
        )
    return tuple(literals)


def seed_clause(encoder, artifact: dict[str, object]) -> tuple[int, ...]:
    if not artifact.get("exact_replay_valid"):
        raise ValueError("seed dual was not exactly replayed")
    certificate = artifact["certificate"]
    if certificate["upper_bound_marginals"] or certificate["equality_marginals"]:
        raise ValueError("seed is not a pure true-membership nogood")
    antecedent = artifact["decoded_dual_support"]["antecedent_true_literals"]
    names = [item["name"] for item in antecedent]
    if any(not name.startswith("member_") for name in names):
        raise ValueError("seed antecedent contains non-membership")
    return tuple(-encoder.v.by_name[name] for name in names)


def decode_assignment(module, encoder, model: z3.ModelRef, variables) -> dict[str, object]:
    truth = [z3.is_true(model.eval(variable, model_completion=True)) for variable in variables]

    def is_true(variable: int) -> bool:
        return truth[variable - 1]

    rows = {
        center: tuple(point for point in module.VERTICES if is_true(encoder.m(center, point)))
        for center in module.VERTICES
    }
    shell = tuple(point for point in module.VERTICES if is_true(encoder.shell[point]))
    roles = {
        role: next(point for point in module.VERTICES if is_true(encoder.r(role, point)))
        for role in ("first", "second", "source", "target", "unused")
    }
    blockers = {
        source: next(
            center for center in module.VERTICES if is_true(encoder.b(source, center))
        )
        for source in module.VERTICES
    }
    return {
        "truth": truth,
        "rows": rows,
        "shell": shell,
        "roles": roles,
        "blockers": blockers,
    }


def exact_metric_check(
    module,
    decoded: dict[str, object],
    cut_id: str,
    distance_lower_bound: int,
) -> dict[str, object]:
    distances = {
        pair: z3.Real(f"d_{pair[0]}_{pair[1]}")
        for pair in itertools.combinations(module.VERTICES, 2)
    }

    def dist(left: int, right: int):
        return distances[edge(left, right)]

    solver = z3.Solver()
    tracked: dict[str, dict[str, object]] = {}

    def track(name: str, formula, kind: str, rhs: int) -> None:
        tracked[name] = {"formula": formula, "kind": kind, "rhs": rhs}
        solver.assert_and_track(formula, z3.Bool(name))

    for left, right in itertools.combinations(module.VERTICES, 2):
        prefix = "positive" if distance_lower_bound == 1 else "nonneg"
        track(
            f"{prefix}_{left}_{right}",
            dist(left, right) >= distance_lower_bound,
            "inequality",
            distance_lower_bound,
        )
    for a, b, c, d in itertools.combinations(module.VERTICES, 4):
        diagonals = dist(a, c) + dist(b, d)
        track(
            f"kal1_{a}_{b}_{c}_{d}",
            diagonals >= dist(a, b) + dist(c, d) + 1,
            "inequality",
            1,
        )
        track(
            f"kal2_{a}_{b}_{c}_{d}",
            diagonals >= dist(a, d) + dist(b, c) + 1,
            "inequality",
            1,
        )
    rows: dict[int, tuple[int, ...]] = decoded["rows"]  # type: ignore[assignment]
    for center, support in rows.items():
        reference = support[0]
        for point in support[1:]:
            track(
                f"row_{center}_{reference}_{point}",
                dist(center, point) == dist(center, reference),
                "equality",
                0,
            )
    shell: tuple[int, ...] = decoded["shell"]  # type: ignore[assignment]
    reference = shell[0]
    for point in shell[1:]:
        track(
            f"shell_{module.SECOND_APEX}_{reference}_{point}",
            dist(module.SECOND_APEX, point) == dist(module.SECOND_APEX, reference),
            "equality",
            0,
        )
    status = solver.check()
    if status == z3.sat:
        model = solver.model()
        table = {
            f"{left},{right}": str(model.eval(variable, model_completion=True))
            for (left, right), variable in distances.items()
        }
        exact_values = [model.eval(variable, model_completion=True) for variable in distances.values()]
        minimum_distance = min(exact_values, key=lambda value: float(value.as_fraction()))
        return {
            "status": "SAT",
            "witness": {
                "distance_table": table,
                "minimum_distance": str(minimum_distance),
                "strict_positivity_replay": all(
                    z3.is_true(model.eval(variable >= 1, model_completion=True))
                    for variable in distances.values()
                ),
                "distance_lower_bound_used": distance_lower_bound,
                "strict_slack_normalization": (
                    "Every Kalmanson slack is at least 1 before optional sum normalization"
                ),
            },
        }
    if status == z3.unknown:
        return {"status": "UNKNOWN", "reason": solver.reason_unknown()}
    core = tuple(str(item) for item in solver.unsat_core())

    multipliers = {name: z3.Real(f"mu_{index}") for index, name in enumerate(core)}
    dual = z3.Solver()
    for name in core:
        if tracked[name]["kind"] == "inequality":
            dual.add(multipliers[name] >= 0)
    for pair in distances:
        coefficient = sum(
            multipliers[name] * vector(name).get(pair, 0) for name in core
        )
        dual.add(coefficient == 0)
    dual.add(sum(
        multipliers[name] * int(tracked[name]["rhs"])
        for name in core
    ) == 1)
    if dual.check() != z3.sat:
        raise ValueError("failed to reconstruct exact dual")
    dual_model = dual.model()
    rationals: dict[str, tuple[int, int]] = {}
    denominator_lcm = 1
    for name in core:
        value = dual_model.eval(multipliers[name], model_completion=True)
        numerator = value.numerator_as_long()
        denominator = value.denominator_as_long()
        rationals[name] = (numerator, denominator)
        denominator_lcm = math.lcm(denominator_lcm, denominator)
    integers = {
        name: numerator * (denominator_lcm // denominator)
        for name, (numerator, denominator) in rationals.items()
        if numerator
    }
    constraints = [
        {"name": name, "multiplier": multiplier}
        for name, multiplier in sorted(integers.items())
    ]
    memberships: set[tuple[int, int]] = set()
    shell_used = False
    for name in integers:
        parts = name.split("_")
        if parts[0] == "row":
            center, row_reference, point = map(int, parts[1:])
            memberships.add((center, row_reference))
            memberships.add((center, point))
        elif parts[0] == "shell":
            shell_used = True
    strict_weight = sum(
        multiplier for name, multiplier in integers.items() if name.startswith("kal")
    )
    cut = {
        "schema": "p97-exact6-integrated-exact-kalmanson-cut-v1",
        "id": cut_id,
        "constraints": constraints,
        "strict_weight_sum": strict_weight,
        "required_memberships": [list(item) for item in sorted(memberships)],
        "conditioned_shell": list(shell) if shell_used else None,
        "exact_vector_cancellation": True,
        "initial_unsat_core_size": len(core),
    }
    verify_exact_cut(cut)
    return {"status": "UNSAT", "cut": cut}


def append_cut(path: Path, cut: dict[str, object]) -> None:
    with path.open("a", encoding="utf-8") as handle:
        handle.write(json.dumps(cut, sort_keys=True) + "\n")


def load_cuts(path: Path) -> list[dict[str, object]]:
    if not path.exists():
        return []
    cuts = [json.loads(line) for line in path.read_text(encoding="utf-8").splitlines() if line]
    for cut in cuts:
        verify_exact_cut(cut)
    return cuts


def final_sat_proof(module, encoder, prefix: Path, timeout: int) -> dict[str, object]:
    cnf = prefix.with_suffix(".cnf")
    drat = prefix.with_suffix(".drat")
    core = prefix.with_suffix(".core.cnf")
    lrat = prefix.with_suffix(".lrat")
    solver_output = prefix.with_suffix(".solver.txt")
    dimacs = module.render_dimacs(encoder.cnf, (
        "schema p97-exact6-integrated-exact-cegar-terminal-v1",
        f"orbit {encoder.orbit}",
        "literal_metric_cut_banks omitted",
    ))
    cnf.write_bytes(dimacs)
    solved = subprocess.run(
        ["cadical", "-t", str(timeout), str(cnf), str(drat)],
        capture_output=True,
        text=True,
        timeout=timeout + 30,
        check=False,
    )
    solver_output.write_text(solved.stdout + solved.stderr, encoding="utf-8")
    if solved.returncode != 20:
        return {"verdict": "FINAL_CADICAL_NOT_UNSAT", "returncode": solved.returncode}
    checked = subprocess.run(
        ["drat-trim", str(cnf), str(drat), "-c", str(core), "-L", str(lrat)],
        capture_output=True,
        text=True,
        timeout=timeout + 30,
        check=False,
    )
    verified = checked.returncode == 0 and "s VERIFIED" in (checked.stdout + checked.stderr)
    return {
        "verdict": "UNSAT_DRAT_VERIFIED" if verified else "UNSAT_DRAT_REJECTED",
        "cadical_returncode": solved.returncode,
        "drat_trim_returncode": checked.returncode,
        "drat_trim_output": checked.stdout + checked.stderr,
        "artifacts": {
            name: {"path": str(path), "bytes": path.stat().st_size, "sha256": sha256(path)}
            for name, path in (("cnf", cnf), ("drat", drat), ("core", core), ("lrat", lrat))
            if path.exists()
        },
    }


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--orbit", required=True)
    parser.add_argument("--output-dir", required=True, type=Path)
    parser.add_argument("--seed", action="append", default=[], type=Path)
    parser.add_argument("--import-bank", action="append", default=[], type=Path)
    parser.add_argument("--max-cuts", type=int, default=1000)
    parser.add_argument("--wall-seconds", type=float, default=3600)
    parser.add_argument("--proof-timeout", type=int, default=1800)
    parser.add_argument("--resume", action="store_true")
    parser.add_argument("--break-stale-lock", action="store_true")
    parser.add_argument("--distance-lower-bound", type=int, choices=(0, 1), default=1)
    args = parser.parse_args()
    args.output_dir.mkdir(parents=True, exist_ok=True)
    log_path = args.output_dir / "events.jsonl"
    bank_path = args.output_dir / "cuts.jsonl"
    result_path = args.output_dir / "result.json"
    manifest_path = args.output_dir / "run-manifest.json"
    lock_path = args.output_dir / ".run.lock"
    if not args.resume and (log_path.exists() or bank_path.exists()):
        raise SystemExit("output exists; pass --resume")
    if args.break_stale_lock and lock_path.exists():
        lock_path.unlink()
    try:
        with lock_path.open("x", encoding="utf-8") as lock_handle:
            lock_handle.write(
                json.dumps({"pid": __import__("os").getpid(), "time": time.time()}) + "\n"
            )
    except FileExistsError as error:
        raise SystemExit(f"active/stale run lock exists: {lock_path}") from error
    atexit.register(lambda: lock_path.unlink(missing_ok=True))

    run_identity = {
        "schema": "p97-exact6-integrated-exact-cegar-run-manifest-v1",
        "orbit": args.orbit,
        "encoder_path": str(integrated.ENCODER_PATH.relative_to(integrated.REPO)),
        "encoder_sha256": integrated.file_sha256(integrated.ENCODER_PATH),
        "strict_metric_profile": (
            "positive-distances-plus-strict-Kalmanson"
            if args.distance_lower_bound == 1
            else "nonnegative-distances-plus-strict-Kalmanson-boundary-probe"
        ),
        "seed_inputs": [
            {"path": str(path), "sha256": sha256(path)} for path in args.seed
        ],
        "import_inputs": [
            {"path": str(path), "sha256": sha256(path)} for path in args.import_bank
        ],
    }
    if manifest_path.exists():
        recorded_identity = json.loads(manifest_path.read_text(encoding="utf-8"))
        if recorded_identity != run_identity:
            raise SystemExit("resume manifest identity mismatch")
    else:
        manifest_path.write_text(
            json.dumps(run_identity, indent=2, sort_keys=True) + "\n",
            encoding="utf-8",
        )

    module = integrated.load_encoder()
    encoder = integrated.build_structural_outer(module, args.orbit, QuietLog())
    variables = [z3.Bool(f"b_{index}") for index in range(1, encoder.v.count + 1)]
    structural = z3.Solver()
    for clause in encoder.cnf.clauses:
        add_clause_to_z3(structural, variables, clause)

    seed_records = []
    for path in args.seed:
        artifact = json.loads(path.read_text(encoding="utf-8"))
        clause = seed_clause(encoder, artifact)
        encoder.cnf.add("seed_exact_rational_dual_nogood", clause)
        add_clause_to_z3(structural, variables, clause)
        seed_records.append({"path": str(path), "sha256": sha256(path), "clause": list(clause)})

    import_records = []
    for path in args.import_bank:
        imported = load_cuts(path)
        for cut in imported:
            clause = cut_clause(encoder, cut)
            encoder.cnf.add("imported_exact_kalmanson_nogood", clause)
            add_clause_to_z3(structural, variables, clause)
        import_records.append({
            "path": str(path),
            "sha256": sha256(path),
            "cut_count": len(imported),
        })

    cuts = load_cuts(bank_path)
    for cut in cuts:
        clause = cut_clause(encoder, cut)
        encoder.cnf.add("derived_exact_kalmanson_nogood", clause)
        add_clause_to_z3(structural, variables, clause)
    event(
        log_path,
        "start",
        orbit=args.orbit,
        encoder_sha256=integrated.file_sha256(integrated.ENCODER_PATH),
        seed_count=len(seed_records),
        imported_cut_count=sum(item["cut_count"] for item in import_records),
        resumed_cut_count=len(cuts),
    )

    deadline = time.monotonic() + args.wall_seconds
    terminal = None
    while len(cuts) < args.max_cuts and time.monotonic() < deadline:
        status = structural.check()
        if status == z3.unsat:
            event(log_path, "structural_unsat", cut_count=len(cuts))
            terminal = final_sat_proof(
                module, encoder, args.output_dir / "terminal", args.proof_timeout
            )
            break
        if status != z3.sat:
            terminal = {"verdict": "STRUCTURAL_UNKNOWN", "reason": structural.reason_unknown()}
            break
        decoded = decode_assignment(module, encoder, structural.model(), variables)
        cut_id = f"{args.orbit}-cut-{len(cuts) + 1:05d}"
        metric = exact_metric_check(
            module, decoded, cut_id, args.distance_lower_bound
        )
        if metric["status"] == "SAT":
            alive = {
                "schema": "p97-exact6-integrated-exact-kalmanson-alive-v1",
                "epistemic_status": (
                    (
                        "EXACT_POSITIVE_KALMANSON_LINEAR_SHADOW_ALIVE_"
                        if args.distance_lower_bound == 1
                        else "EXACT_NONNEGATIVE_KALMANSON_BOUNDARY_SHADOW_ALIVE_"
                    )
                    + "NOT_EUCLIDEAN_NOT_LIVE_LEAN_CLOSURE"
                ),
                "orbit": args.orbit,
                "rows": {str(center): list(support) for center, support in decoded["rows"].items()},
                "shell": list(decoded["shell"]),
                "roles": decoded["roles"],
                "blockers": {str(source): center for source, center in decoded["blockers"].items()},
                **metric["witness"],
            }
            alive_path = args.output_dir / "alive.json"
            alive_path.write_text(json.dumps(alive, indent=2, sort_keys=True) + "\n")
            terminal = {
                "verdict": (
                    "EXACT_POSITIVE_KALMANSON_LINEAR_SHADOW_ALIVE"
                    if args.distance_lower_bound == 1
                    else "EXACT_NONNEGATIVE_KALMANSON_BOUNDARY_SHADOW_ALIVE"
                ),
                "alive_path": str(alive_path),
                "alive_sha256": sha256(alive_path),
            }
            event(log_path, "exact_alive", cut_count=len(cuts), alive_path=str(alive_path))
            break
        if metric["status"] == "UNKNOWN":
            terminal = {"verdict": "EXACT_METRIC_ORACLE_UNKNOWN", "reason": metric["reason"]}
            break
        cut = metric["cut"]
        clause = cut_clause(encoder, cut)
        append_cut(bank_path, cut)
        cuts.append(cut)
        encoder.cnf.add("derived_exact_kalmanson_nogood", clause)
        add_clause_to_z3(structural, variables, clause)
        event(
            log_path,
            "cut_appended",
            cut_id=cut_id,
            cut_count=len(cuts),
            required_memberships=len(cut["required_memberships"]),
            constraint_count=len(cut["constraints"]),
            conditioned_shell=cut["conditioned_shell"] is not None,
        )

    if terminal is None:
        terminal = {
            "verdict": "CEGAR_LIMIT",
            "cut_count": len(cuts),
            "wall_limit_reached": time.monotonic() >= deadline,
        }
    result = {
        "schema": "p97-exact6-integrated-exact-cegar-result-v1",
        "epistemic_status": (
            "FINITE_EXACT_CEGAR_CERTIFICATE_NOT_LIVE_LEAN_CLOSURE"
            if terminal["verdict"] == "UNSAT_DRAT_VERIFIED"
            else "FINITE_EXACT_CEGAR_INCOMPLETE_NOT_LIVE_LEAN_CLOSURE"
        ),
        "orbit": args.orbit,
        "encoder_path": str(integrated.ENCODER_PATH.relative_to(integrated.REPO)),
        "encoder_sha256": integrated.file_sha256(integrated.ENCODER_PATH),
        "literal_metric_cut_banks": "OMITTED",
        "seed_records": seed_records,
        "import_records": import_records,
        "derived_cut_count": len(cuts),
        "run_manifest_path": str(manifest_path),
        "run_manifest_sha256": sha256(manifest_path),
        "terminal": terminal,
    }
    result_path.write_text(json.dumps(result, indent=2, sort_keys=True) + "\n")
    event(log_path, "done", verdict=terminal["verdict"], cut_count=len(cuts))


if __name__ == "__main__":
    main()
