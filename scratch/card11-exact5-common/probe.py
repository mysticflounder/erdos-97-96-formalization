#!/usr/bin/env python3
"""Cheap exact-n=11 common-blocker projection on the Census-554 SAT cube.

This is intentionally a wrapper around the existing Census-554 components.
It does not encode the full exact-five source statement, minimality, noM44, or
source-indexed blocker production.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import subprocess
import sys
import time
from dataclasses import dataclass
from pathlib import Path
from typing import Iterable, Mapping


HERE = Path(__file__).resolve().parent
REPO_ROOT = HERE.parents[1]
CENSUS_SCRATCH = REPO_ROOT / "scratch" / "census-554"
sys.path.insert(0, str(CENSUS_SCRATCH))
sys.path.insert(0, str(REPO_ROOT))

import census554_lib as profile  # noqa: E402
import sat_cover  # noqa: E402
from census.census_554 import separation_encoding  # noqa: E402


SCHEMA = "card11_exact5_common_projection.v1"
Q = 6
WITNESS = 7
BLOCKER = 8
SHELL_CASES = ((2, 0), (2, 9), (3, 0), (3, 9))
EXPECTED_BASE_VARIABLES = 27_286
EXPECTED_BASE_CLAUSES = 207_969
EXPECTED_SEPARATED_VARIABLES = 27_904
EXPECTED_SEPARATED_CLAUSES = 387_856


class ProbeError(RuntimeError):
    pass


@dataclass(frozen=True)
class SolverResult:
    verdict: str
    returncode: int
    stdout: str
    stderr: str
    wall_seconds: float


def sha256_file(path: Path) -> str:
    digest = hashlib.sha256()
    with open(path, "rb") as handle:
        for chunk in iter(lambda: handle.read(1 << 20), b""):
            digest.update(chunk)
    return digest.hexdigest()


def write_text(path: Path, text: str) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(text, encoding="utf-8")


def write_json(path: Path, value) -> None:
    write_text(path, json.dumps(value, sort_keys=True, indent=2) + "\n")


def source_provenance() -> dict[str, dict[str, str]]:
    sources = {
        "profile": Path(profile.__file__).resolve(),
        "cover_encoder": Path(sat_cover.__file__).resolve(),
        "separation_encoder": Path(separation_encoding.__file__).resolve(),
        "projection_driver": Path(__file__).resolve(),
    }
    return {
        name: {"path": str(path), "sha256": sha256_file(path)}
        for name, path in sources.items()
    }


def shell_name(surplus_shell: int, other_shell: int) -> str:
    return f"s{surplus_shell}_o{other_shell}"


def shell_u5(surplus_shell: int, other_shell: int) -> frozenset[int]:
    result = frozenset({
        Q, WITNESS, BLOCKER, surplus_shell, other_shell
    })
    if len(result) != 5:
        raise ProbeError("the shell labels do not define five distinct points")
    return result


def allowed_center_v_rows(
    instance: sat_cover.CoverInstance,
    surplus_shell: int,
    other_shell: int,
) -> tuple[int, ...]:
    u5 = shell_u5(surplus_shell, other_shell)
    pair = {Q, WITNESS}
    return tuple(
        index
        for index, members in enumerate(instance.cand[profile.V])
        if pair <= members and members <= u5
    )


def allowed_blocker_rows(
    instance: sat_cover.CoverInstance,
) -> tuple[int, ...]:
    pair = {Q, WITNESS}
    return tuple(
        index
        for index, members in enumerate(instance.cand[BLOCKER])
        if pair <= members
    )


def add_shell_constraints(
    instance: sat_cover.CoverInstance,
    surplus_shell: int,
    other_shell: int,
) -> dict:
    v_rows = allowed_center_v_rows(instance, surplus_shell, other_shell)
    blocker_rows = allowed_blocker_rows(instance)
    if not v_rows or not blocker_rows:
        raise ProbeError("a required shell row has no candidate")
    instance.cnf.add([
        instance.x[(profile.V, index)] for index in v_rows
    ])
    instance.cnf.add([
        instance.x[(BLOCKER, index)] for index in blocker_rows
    ])
    return {
        "s": surplus_shell,
        "o": other_shell,
        "q": Q,
        "w": WITNESS,
        "b": BLOCKER,
        "u5": sorted(shell_u5(surplus_shell, other_shell)),
        "center_v": profile.V,
        "center_v_allowed_candidate_indices": list(v_rows),
        "center_v_allowed_rows": [
            sorted(instance.cand[profile.V][index]) for index in v_rows
        ],
        "center_b_allowed_candidate_indices": list(blocker_rows),
        "center_b_allowed_row_count": len(blocker_rows),
        "added_clauses": 2,
    }


def build_instance(
    surplus_shell: int | None = None,
    other_shell: int | None = None,
):
    instance = sat_cover.CoverInstance()
    if (
        instance.cnf.n != EXPECTED_BASE_VARIABLES
        or len(instance.cnf.clauses) != EXPECTED_BASE_CLAUSES
    ):
        raise ProbeError(
            "the wrapped Census-554 base counts drifted: "
            f"{instance.cnf.n} vars, {len(instance.cnf.clauses)} clauses"
        )
    separation = separation_encoding.add_separation_encoding(
        instance, scope=separation_encoding.DIRECT_ROW_SCOPE
    )
    if (
        instance.cnf.n != EXPECTED_SEPARATED_VARIABLES
        or len(instance.cnf.clauses) != EXPECTED_SEPARATED_CLAUSES
    ):
        raise ProbeError(
            "the wrapped separation counts drifted: "
            f"{instance.cnf.n} vars, {len(instance.cnf.clauses)} clauses"
        )
    shell = None
    if surplus_shell is not None or other_shell is not None:
        if surplus_shell is None or other_shell is None:
            raise ProbeError("both shell labels must be supplied together")
        if (surplus_shell, other_shell) not in SHELL_CASES:
            raise ProbeError("the requested pair is not one of the four shell cases")
        shell = add_shell_constraints(
            instance, surplus_shell, other_shell
        )
    return instance, separation, shell


def parse_assignment(output: str) -> dict[int, bool]:
    assignment: dict[int, bool] = {}
    for line in output.splitlines():
        if not line.startswith("v "):
            continue
        for token in line[2:].split():
            literal = int(token)
            if literal == 0:
                continue
            variable = abs(literal)
            value = literal > 0
            if variable in assignment and assignment[variable] != value:
                raise ProbeError(f"solver assigns variable {variable} twice")
            assignment[variable] = value
    return assignment


def validate_cnf_model(instance, assignment: Mapping[int, bool]) -> dict:
    unsatisfied = []
    unresolved = []
    for clause_index, clause in enumerate(instance.cnf.clauses):
        satisfied = False
        has_unassigned = False
        for literal in clause:
            value = assignment.get(abs(literal))
            if value is None:
                has_unassigned = True
            elif value == (literal > 0):
                satisfied = True
                break
        if not satisfied:
            if has_unassigned:
                unresolved.append(clause_index)
            else:
                unsatisfied.append(clause_index)
    return {
        "assignment_variable_count": len(assignment),
        "all_variables_assigned": len(assignment) == instance.cnf.n,
        "unsatisfied_clause_count": len(unsatisfied),
        "unresolved_clause_count": len(unresolved),
        "cnf_satisfied": not unsatisfied and not unresolved,
        "first_unsatisfied_clause_indices": unsatisfied[:10],
        "first_unresolved_clause_indices": unresolved[:10],
    }


def decode_and_validate_model(
    instance,
    separation,
    assignment: Mapping[int, bool],
    shell: Mapping | None,
) -> tuple[dict, dict]:
    positive = {variable for variable, value in assignment.items() if value}
    cube = {}
    chosen_indices = {}
    for center in range(profile.N):
        chosen = [
            index
            for index in range(len(instance.cand[center]))
            if assignment.get(instance.x[(center, index)]) is True
        ]
        if len(chosen) != 1:
            raise ProbeError(
                f"model selects {len(chosen)} rows at center {center}"
            )
        chosen_indices[center] = chosen[0]
        cube[center] = sorted(instance.cand[center][chosen[0]])

    cube_ok = profile.cube_ok(cube)
    selected_orders = separation.selected_orders(positive)
    selected_orders_valid = bool(selected_orders) and all(
        separation_encoding.validate_cube_order(
            cube, order, scope=separation_encoding.DIRECT_ROW_SCOPE
        )
        for order in selected_orders
    )
    shell_ok = True
    if shell is not None:
        u5 = set(shell["u5"])
        shell_ok = (
            {Q, WITNESS} <= set(cube[profile.V]) <= u5
            and {Q, WITNESS} <= set(cube[BLOCKER])
        )
    validations = {
        "independent_cube_ok": cube_ok,
        "selected_order_count": len(selected_orders),
        "independent_selected_orders_valid": selected_orders_valid,
        "independent_shell_ok": shell_ok,
    }
    if not all((
        cube_ok, selected_orders_valid, shell_ok
    )):
        raise ProbeError(f"independent model validation failed: {validations}")
    model = {
        "cube": {str(center): cube[center] for center in range(profile.N)},
        "chosen_candidate_indices": {
            str(center): chosen_indices[center] for center in range(profile.N)
        },
        "selected_orders": [
            {
                "orientation": order.orientation,
                "python_internal_index": order.internal_index,
                "labels": list(order.labels),
                "row_scope": separation_encoding.DIRECT_ROW_SCOPE,
            }
            for order in selected_orders
        ],
    }
    return model, validations


def run_cadical(
    cnf_path: Path,
    proof_path: Path,
    timeout_seconds: int,
) -> tuple[SolverResult, list[str]]:
    command = [
        "cadical", "-t", str(timeout_seconds),
        str(cnf_path), str(proof_path),
    ]
    started = time.monotonic()
    process = subprocess.run(command, capture_output=True, text=True)
    wall_seconds = time.monotonic() - started
    verdict = {
        10: "SAT",
        20: "UNSAT",
        0: "UNKNOWN",
    }.get(process.returncode, "ERROR")
    return SolverResult(
        verdict=verdict,
        returncode=process.returncode,
        stdout=process.stdout,
        stderr=process.stderr,
        wall_seconds=wall_seconds,
    ), command


def verify_drat(
    cnf_path: Path, proof_path: Path, run_dir: Path
) -> dict:
    command = ["drat-trim", str(cnf_path), str(proof_path)]
    started = time.monotonic()
    process = subprocess.run(command, capture_output=True, text=True)
    wall_seconds = time.monotonic() - started
    write_text(run_dir / "drat-trim.stdout", process.stdout)
    write_text(run_dir / "drat-trim.stderr", process.stderr)
    verified = process.returncode == 0 and "s VERIFIED" in process.stdout
    return {
        "command": command,
        "returncode": process.returncode,
        "wall_seconds": wall_seconds,
        "verified": verified,
    }


def run_case(
    surplus_shell: int,
    other_shell: int,
    output_root: Path,
    timeout_seconds: int,
) -> dict:
    case = shell_name(surplus_shell, other_shell)
    run_dir = output_root / case
    run_dir.mkdir(parents=True, exist_ok=True)
    instance, separation, shell = build_instance(
        surplus_shell, other_shell
    )
    cnf_path = run_dir / "problem.cnf"
    write_text(cnf_path, instance.dimacs())
    proof_path = run_dir / "proof.drat"
    solver, command = run_cadical(
        cnf_path, proof_path, timeout_seconds
    )
    write_text(run_dir / "cadical.stdout", solver.stdout)
    write_text(run_dir / "cadical.stderr", solver.stderr)

    provenance = {
        "schema": SCHEMA,
        "case": case,
        "sources": source_provenance(),
        "row_scope": separation_encoding.DIRECT_ROW_SCOPE,
        "shell": shell,
        "cnf": {
            "path": str(cnf_path.resolve()),
            "sha256": sha256_file(cnf_path),
            "variables": instance.cnf.n,
            "clauses": len(instance.cnf.clauses),
            "base_variables": EXPECTED_BASE_VARIABLES,
            "base_clauses": EXPECTED_BASE_CLAUSES,
            "separation_added_variables": separation.variable_count,
            "separation_added_clauses": separation.clause_count,
            "shell_added_clauses": shell["added_clauses"],
        },
        "solver_command": command,
        "timeout_seconds": timeout_seconds,
    }
    write_json(run_dir / "provenance.json", provenance)

    model_validation = None
    proof_validation = None
    if solver.verdict == "SAT":
        assignment = parse_assignment(solver.stdout)
        cnf_validation = validate_cnf_model(instance, assignment)
        if not cnf_validation["cnf_satisfied"]:
            raise ProbeError(
                f"{case}: solver model does not independently satisfy the CNF"
            )
        model, structural_validation = decode_and_validate_model(
            instance, separation, assignment, shell
        )
        model_validation = {
            **cnf_validation,
            **structural_validation,
        }
        write_json(run_dir / "model.json", {
            "schema": SCHEMA,
            "case": case,
            **model,
            "validation": model_validation,
        })
    elif solver.verdict == "UNSAT":
        proof_validation = verify_drat(cnf_path, proof_path, run_dir)
        if not proof_validation["verified"]:
            raise ProbeError(f"{case}: drat-trim did not verify the proof")

    result = {
        "schema": SCHEMA,
        "case": case,
        "verdict": solver.verdict,
        "solver_returncode": solver.returncode,
        "solver_wall_seconds": solver.wall_seconds,
        "variables": instance.cnf.n,
        "clauses": len(instance.cnf.clauses),
        "model_validation": model_validation,
        "proof_validation": proof_validation,
        "artifacts": {
            "cnf": str(cnf_path.resolve()),
            "cadical_stdout": str((run_dir / "cadical.stdout").resolve()),
            "cadical_stderr": str((run_dir / "cadical.stderr").resolve()),
            "model": (
                str((run_dir / "model.json").resolve())
                if solver.verdict == "SAT" else None
            ),
            "proof": (
                str(proof_path.resolve())
                if solver.verdict == "UNSAT" else None
            ),
            "provenance": str((run_dir / "provenance.json").resolve()),
        },
    }
    write_json(run_dir / "result.json", result)
    return result


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--output-root", type=Path, default=HERE / "runs"
    )
    parser.add_argument("--timeout", type=int, default=600)
    parser.add_argument(
        "--case",
        choices=[shell_name(*case) for case in SHELL_CASES],
        action="append",
        help="Run only selected cases; repeat for more than one.",
    )
    args = parser.parse_args()
    if args.timeout <= 0:
        parser.error("--timeout must be positive")
    selected = (
        SHELL_CASES
        if not args.case
        else tuple(
            case for case in SHELL_CASES
            if shell_name(*case) in set(args.case)
        )
    )
    results = []
    for surplus_shell, other_shell in selected:
        result = run_case(
            surplus_shell, other_shell,
            args.output_root.resolve(), args.timeout,
        )
        results.append(result)
        validation = result["model_validation"]
        validation_text = (
            "model=VALID" if validation is not None else
            (
                "proof=VERIFIED"
                if result["proof_validation"]
                and result["proof_validation"]["verified"]
                else "no-certificate"
            )
        )
        print(
            f"{result['case']}: {result['verdict']} "
            f"vars={result['variables']} clauses={result['clauses']} "
            f"{validation_text} wall={result['solver_wall_seconds']:.3f}s"
        )
    summary = {
        "schema": SCHEMA,
        "serial_cadical": True,
        "results": results,
    }
    write_json(args.output_root.resolve() / "summary.json", summary)
    return 0 if all(
        result["verdict"] in {"SAT", "UNSAT"} for result in results
    ) else 2


if __name__ == "__main__":
    raise SystemExit(main())
