#!/usr/bin/env python3
"""Direct exact SMT search for a structural plus linear-metric ALIVE model."""

from __future__ import annotations

import argparse
import atexit
import hashlib
import itertools
import json
import os
import time
from pathlib import Path

import z3

import integrated_milp as integrated
from exact_cegar import cut_clause, edge, load_cuts, seed_clause
from verify_results import QuietLog


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def atomic_json(path: Path, payload: object) -> None:
    temporary = path.with_name(path.name + ".tmp")
    temporary.write_text(
        json.dumps(payload, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )
    temporary.replace(path)


def event(path: Path, phase: str, **fields: object) -> None:
    record = {"phase": phase, "time": time.time(), **fields}
    with path.open("a", encoding="utf-8") as handle:
        handle.write(json.dumps(record, sort_keys=True) + "\n")
        handle.flush()
        os.fsync(handle.fileno())


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--orbit", required=True)
    parser.add_argument("--profile", choices=("kalmanson", "full"), default="kalmanson")
    parser.add_argument("--seed", action="append", default=[], type=Path)
    parser.add_argument("--import-bank", action="append", default=[], type=Path)
    parser.add_argument("--timeout-ms", type=int, default=600_000)
    parser.add_argument("--random-seed", type=int, default=0)
    parser.add_argument("--output", required=True, type=Path)
    args = parser.parse_args()
    args.output.parent.mkdir(parents=True, exist_ok=True)
    manifest_path = args.output.with_name(args.output.name + ".manifest.json")
    events_path = args.output.with_name(args.output.name + ".events.jsonl")
    lock_path = args.output.with_name(args.output.name + ".lock")
    alive_path = args.output.with_name(args.output.name + ".alive.json")
    if args.output.exists() or manifest_path.exists() or events_path.exists() or alive_path.exists():
        raise SystemExit("output package already exists; choose a fresh --output path")
    try:
        with lock_path.open("x", encoding="utf-8") as lock_handle:
            lock_handle.write(json.dumps({"pid": os.getpid(), "time": time.time()}) + "\n")
    except FileExistsError as error:
        raise SystemExit(f"active/stale direct-solver lock exists: {lock_path}") from error
    atexit.register(lambda: lock_path.unlink(missing_ok=True))

    run_identity = {
        "schema": "p97-exact6-integrated-direct-exact-smt-manifest-v1",
        "orbit": args.orbit,
        "profile": args.profile,
        "timeout_ms": args.timeout_ms,
        "random_seed": args.random_seed,
        "encoder_path": str(integrated.ENCODER_PATH.relative_to(integrated.REPO)),
        "encoder_sha256": integrated.file_sha256(integrated.ENCODER_PATH),
        "driver_sha256": sha256(Path(__file__)),
        "seed_inputs": [
            {"path": str(path), "sha256": sha256(path)} for path in args.seed
        ],
        "import_inputs": [
            {"path": str(path), "sha256": sha256(path)} for path in args.import_bank
        ],
    }
    atomic_json(manifest_path, run_identity)
    event(
        events_path,
        "start",
        orbit=args.orbit,
        profile=args.profile,
        timeout_ms=args.timeout_ms,
        random_seed=args.random_seed,
        manifest_path=str(manifest_path),
        manifest_sha256=sha256(manifest_path),
    )
    start = time.monotonic()
    module = integrated.load_encoder()
    encoder = integrated.build_structural_outer(module, args.orbit, QuietLog())
    booleans = [z3.Bool(f"b_{index}") for index in range(1, encoder.v.count + 1)]
    solver = z3.Solver()
    solver.set(timeout=args.timeout_ms, random_seed=args.random_seed)

    def add_clause(clause) -> None:
        solver.add(z3.Or(*(
            booleans[abs(literal) - 1] if literal > 0
            else z3.Not(booleans[abs(literal) - 1])
            for literal in clause
        )))

    for clause in encoder.cnf.clauses:
        add_clause(clause)
    seed_records = []
    for path in args.seed:
        artifact = json.loads(path.read_text(encoding="utf-8"))
        clause = seed_clause(encoder, artifact)
        add_clause(clause)
        seed_records.append({"path": str(path), "sha256": sha256(path)})
    import_records = []
    for path in args.import_bank:
        cuts = load_cuts(path)
        for cut in cuts:
            add_clause(cut_clause(encoder, cut))
        import_records.append({"path": str(path), "sha256": sha256(path), "cuts": len(cuts)})

    distances = {
        pair: z3.Real(f"d_{pair[0]}_{pair[1]}")
        for pair in itertools.combinations(module.VERTICES, 2)
    }

    def dist(left: int, right: int):
        return distances[edge(left, right)]

    for variable in distances.values():
        solver.add(variable >= 1)
    if args.profile == "full":
        for a, b, c in itertools.combinations(module.VERTICES, 3):
            solver.add(dist(a, b) + dist(b, c) >= dist(a, c) + 1)
            solver.add(dist(a, b) + dist(a, c) >= dist(b, c) + 1)
            solver.add(dist(a, c) + dist(b, c) >= dist(a, b) + 1)
    for a, b, c, d in itertools.combinations(module.VERTICES, 4):
        diagonals = dist(a, c) + dist(b, d)
        solver.add(diagonals >= dist(a, b) + dist(c, d) + 1)
        solver.add(diagonals >= dist(a, d) + dist(b, c) + 1)
    for center in module.VERTICES:
        points = [point for point in module.VERTICES if point != center]
        for left, right in itertools.combinations(points, 2):
            solver.add(z3.Implies(
                z3.And(
                    booleans[encoder.m(center, left) - 1],
                    booleans[encoder.m(center, right) - 1],
                ),
                dist(center, left) == dist(center, right),
            ))
    shell_points = [point for point in module.VERTICES if point != module.SECOND_APEX]
    for left, right in itertools.combinations(shell_points, 2):
        solver.add(z3.Implies(
            z3.And(
                booleans[encoder.shell[left] - 1],
                booleans[encoder.shell[right] - 1],
            ),
            dist(module.SECOND_APEX, left) == dist(module.SECOND_APEX, right),
        ))

    print(json.dumps({
        "phase": "solve_start",
        "orbit": args.orbit,
        "profile": args.profile,
        "structural_clauses": len(encoder.cnf.clauses),
        "imported_cuts": sum(item["cuts"] for item in import_records),
    }), flush=True)
    status = solver.check()
    payload: dict[str, object] = {
        "schema": "p97-exact6-integrated-direct-exact-smt-result-v1",
        "orbit": args.orbit,
        "profile": args.profile,
        "run_manifest_path": str(manifest_path),
        "run_manifest_sha256": sha256(manifest_path),
        "encoder_sha256": integrated.file_sha256(integrated.ENCODER_PATH),
        "literal_metric_cut_banks": "OMITTED",
        "seed_records": seed_records,
        "import_records": import_records,
        "solver": {
            "name": "Z3 exact QF_LRA+SAT",
            "status": str(status),
            "reason_unknown": solver.reason_unknown() if status == z3.unknown else None,
            "wall_seconds": time.monotonic() - start,
        },
    }
    if status == z3.sat:
        model = solver.model()

        def truth(variable: int) -> bool:
            return z3.is_true(model.eval(booleans[variable - 1], model_completion=True))

        rows = {
            str(center): [
                point for point in module.VERTICES if truth(encoder.m(center, point))
            ]
            for center in module.VERTICES
        }
        shell = [point for point in module.VERTICES if truth(encoder.shell[point])]
        roles = {
            role: next(point for point in module.VERTICES if truth(encoder.r(role, point)))
            for role in ("first", "second", "source", "target", "unused")
        }
        blockers = {
            str(source): next(
                center for center in module.VERTICES if truth(encoder.b(source, center))
            )
            for source in module.VERTICES
        }
        table = {
            f"{left},{right}": str(model.eval(variable, model_completion=True))
            for (left, right), variable in distances.items()
        }
        values = [model.eval(variable, model_completion=True) for variable in distances.values()]
        minimum = min((value.as_fraction() for value in values))
        payload["epistemic_status"] = (
            "EXACT_POSITIVE_FULL_LINEAR_SHADOW_ALIVE_NOT_EUCLIDEAN"
            if args.profile == "full"
            else "EXACT_POSITIVE_KALMANSON_LINEAR_SHADOW_ALIVE_NOT_EUCLIDEAN"
        )
        alive = {
            "rows": rows,
            "shell": shell,
            "roles": roles,
            "blockers": blockers,
            "distance_table": table,
            "minimum_distance": str(minimum),
        }
        payload["alive"] = alive
        canonical_alive = {
            "schema": "p97-exact6-integrated-exact-kalmanson-alive-v1",
            "epistemic_status": (
                "EXACT_POSITIVE_KALMANSON_LINEAR_SHADOW_ALIVE_"
                "NOT_EUCLIDEAN_NOT_LIVE_LEAN_CLOSURE"
            ),
            "orbit": args.orbit,
            "distance_lower_bound_used": 1,
            "strict_positivity_replay": True,
            **alive,
        }
        atomic_json(alive_path, canonical_alive)
        payload["alive_path"] = str(alive_path)
        payload["alive_sha256"] = sha256(alive_path)
        event(
            events_path,
            "exact_alive",
            alive_path=str(alive_path),
            alive_sha256=sha256(alive_path),
        )
    elif status == z3.unsat:
        payload["epistemic_status"] = "EXACT_SMT_UNSAT_NO_EXPORTED_PROOF"
    else:
        payload["epistemic_status"] = "EXACT_SMT_UNKNOWN"
    atomic_json(args.output, payload)
    event(
        events_path,
        "done",
        status=str(status),
        result_path=str(args.output),
        result_sha256=sha256(args.output),
        wall_seconds=payload["solver"]["wall_seconds"],
    )
    print(json.dumps({
        "phase": "done",
        "status": str(status),
        "output": str(args.output),
        "wall_seconds": payload["solver"]["wall_seconds"],
    }), flush=True)


if __name__ == "__main__":
    main()
