#!/usr/bin/env python3
"""Run CaDiCaL on one exported ordinal CNF and replay any SAT projection."""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import json
import subprocess
import sys
import time
from pathlib import Path

import z3


HERE = Path(__file__).resolve().parent
ORDINAL_PATH = HERE / "integrated_ordinal_cycle_decision.py"


def load_ordinal_module():
    spec = importlib.util.spec_from_file_location("integrated_ordinal_for_replay", ORDINAL_PATH)
    if spec is None or spec.loader is None:
        raise RuntimeError("cannot load integrated ordinal decision")
    module = importlib.util.module_from_spec(spec)
    sys.modules[spec.name] = module
    spec.loader.exec_module(module)
    return module


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def parse_named_variables(cnf_path: Path) -> dict[int, str]:
    answer = {}
    for line in cnf_path.read_text(encoding="utf-8").splitlines():
        if not line.startswith("c "):
            continue
        fields = line.split(maxsplit=2)
        if len(fields) == 3 and fields[1].isdigit():
            answer[int(fields[1])] = fields[2]
    return answer


def parse_solution(solution_path: Path) -> tuple[str, dict[int, bool]]:
    status = "UNKNOWN"
    values: dict[int, bool] = {}
    if not solution_path.exists():
        return status, values
    for line in solution_path.read_text(encoding="utf-8").splitlines():
        if line.startswith("s "):
            if "SATISFIABLE" in line and "UNSATISFIABLE" not in line:
                status = "SAT"
            elif "UNSATISFIABLE" in line:
                status = "UNSAT"
            else:
                status = "UNKNOWN"
        elif line.startswith("v "):
            for literal_text in line[2:].split():
                literal = int(literal_text)
                if literal:
                    values[abs(literal)] = literal > 0
    return status, values


def replay_sat(orbit: str, seed: int, named: dict[int, str], values: dict[int, bool]):
    ordinal = load_ordinal_module()
    module = ordinal.load_outer_module()
    outer = module.Outer(orbit, 0, seed, "z3")
    ordinal.add_strong_connectivity(outer, module.N)
    rank, _counts = ordinal.add_ordinal_rank_surface(module, outer)

    member_values = {}
    shell_values = {}
    for variable, name in named.items():
        if variable not in values:
            continue
        if name.startswith("m_"):
            _, center, point = name.split("_")
            member_values[int(center), int(point)] = values[variable]
        elif name.startswith("shell_"):
            _, point = name.split("_")
            shell_values[int(point)] = values[variable]
    for center in module.VERTICES:
        for point in module.VERTICES:
            if center == point:
                expected = False
            else:
                expected = member_values[center, point]
            outer.solver.add(outer.member[center, point] == z3.BoolVal(expected))
    for point in module.VERTICES:
        outer.solver.add(outer.shell[point] == z3.BoolVal(shell_values[point]))

    status = outer.solver.check()
    if status != z3.sat:
        raise AssertionError(f"CaDiCaL SAT projection does not replay: {status}")
    model = outer.solver.model()
    decoded = outer.decode(model)
    serialized_ranks = {
        f"{left},{right}": model.eval(variable, model_completion=True).as_long()
        for (left, right), variable in rank.items()
    }
    ordinal_replay = ordinal.independently_replay(module, decoded, serialized_ranks)
    return {
        "status": "EXACT_PROJECTED_MODEL_REPLAY_PASS",
        "decoded": module.jsonable_decoded(decoded),
        "ranks": serialized_ranks,
        "ordinal_replay": ordinal_replay,
        "pinned_member_variable_count": len(member_values),
        "pinned_shell_variable_count": len(shell_values),
    }


def main() -> int:
    ordinal = load_ordinal_module()
    module = ordinal.load_outer_module()
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--orbit", choices=module.ORBITS, required=True)
    parser.add_argument("--seed", type=int, default=0)
    parser.add_argument("--timeout-seconds", type=int, default=180)
    parser.add_argument("--cnf", type=Path, required=True)
    parser.add_argument("--solution", type=Path, required=True)
    parser.add_argument("--log", type=Path, required=True)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()

    started = time.monotonic()
    completed = subprocess.run(
        [
            "cadical",
            "--plain",
            "-t",
            str(args.timeout_seconds),
            "-w",
            str(args.solution),
            str(args.cnf),
        ],
        text=True,
        capture_output=True,
        check=False,
    )
    args.log.write_text(completed.stdout + completed.stderr, encoding="utf-8")
    cadical_status, values = parse_solution(args.solution)
    if completed.returncode == 10:
        cadical_status = "SAT"
    elif completed.returncode == 20:
        cadical_status = "UNSAT"

    if cadical_status == "SAT":
        replay = replay_sat(
            args.orbit,
            args.seed,
            parse_named_variables(args.cnf),
            values,
        )
        status = "SAT_VERIFIED_EXACT_ORDINAL_COUNTERMODEL"
    elif cadical_status == "UNSAT":
        replay = None
        status = "UNSAT_EXTERNAL_CADICAL_NO_PROOF"
    else:
        replay = None
        status = "UNKNOWN_WALL_BUDGET"

    result = {
        "schema": "p97-exact6-integrated-ordinal-cadical-run-v1",
        "epistemic_status": "EXACT_IF_SAT_EXTERNAL_BOUNDED_IF_UNSAT_OR_UNKNOWN",
        "orbit": args.orbit,
        "seed": args.seed,
        "timeout_seconds": args.timeout_seconds,
        "status": status,
        "cadical_returncode": completed.returncode,
        "elapsed_seconds": time.monotonic() - started,
        "cnf_path": str(args.cnf),
        "cnf_sha256": sha256(args.cnf),
        "solution_path": str(args.solution),
        "solution_sha256": sha256(args.solution) if args.solution.exists() else None,
        "log_path": str(args.log),
        "log_sha256": sha256(args.log),
        "solver": "CaDiCaL 3.0.0 --plain",
        "literal_metric_schema_cuts": 0,
        "replay": replay,
    }
    args.output.write_text(
        json.dumps(result, indent=2, sort_keys=True) + "\n",
        encoding="utf-8",
    )
    print(json.dumps({
        "orbit": args.orbit,
        "status": status,
        "elapsed_seconds": result["elapsed_seconds"],
        "cadical_returncode": completed.returncode,
    }, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
