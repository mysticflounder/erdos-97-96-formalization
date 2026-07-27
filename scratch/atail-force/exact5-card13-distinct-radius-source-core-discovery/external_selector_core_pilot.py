#!/usr/bin/env python3
"""Externally certify a source cube while preserving assertion provenance.

Each of the 58,433 original source assertions is guarded by its own named
Boolean selector *before* bit-blasting.  The nine pinned source cube literals
are guarded the same way.  The selector-preserving CNF then receives positive
unit clauses activating all selectors.  On UNSAT, ``drat-trim -c`` identifies
the input unit selectors used by its checked core, which maps the external CNF
proof back to exact source assertion indices and sexprs.

This is a bounded pilot, not a coverage orchestrator.  It handles one source
leaf and one orbit per invocation and uses one external solver process.
"""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import json
import math
from pathlib import Path
import shutil
import subprocess
import time

import z3


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
SURFACE_PATH = (
    ROOT
    / "scratch/atail-force/exact5-card13-distinct-radius-aggregate/surface.py"
)
PINNED_ATOM_NAMES = (
    "shell_5",
    "g1_2_5",
    "g1_2_6",
    "g1_2_7",
    "g1_2_8",
    "g1_2_9",
    "g1_2_10",
    "g1_2_11",
    "g1_2_12",
)
ORBITS = ("asymmetricSourceLeft", "asymmetricSourceRight")
PIPELINE = (
    "simplify",
    "elim-term-ite",
    "lia2card",
    "card2bv",
    "bit-blast",
    "tseitin-cnf",
)
SCHEMA = "p97-exact5-card13-external-selector-source-core-pilot-v1"


def load_surface():
    spec = importlib.util.spec_from_file_location(
        "exact5_external_selector_surface", SURFACE_PATH
    )
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot load {SURFACE_PATH}")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def assertion_fingerprint(assertions: list[z3.BoolRef]) -> str:
    digest = hashlib.sha256()
    for assertion in assertions:
        encoded = assertion.sexpr().encode("utf-8")
        digest.update(len(encoded).to_bytes(8, "big"))
        digest.update(encoded)
    return digest.hexdigest()


def pinned_atoms(outer) -> dict[str, z3.BoolRef]:
    expressions = [*outer.shell, *outer.cover[1].values()]
    registry = {expression.decl().name(): expression for expression in expressions}
    missing = [name for name in PINNED_ATOM_NAMES if name not in registry]
    if missing:
        raise AssertionError(f"pinned source atoms absent: {missing}")
    selected = {name: registry[name] for name in PINNED_ATOM_NAMES}
    for name, expression in selected.items():
        if (
            not z3.is_bool(expression)
            or not z3.is_const(expression)
            or expression.decl().kind() != z3.Z3_OP_UNINTERPRETED
            or expression.sexpr() != name
            or "!" in name
        ):
            raise AssertionError(f"not an exact primitive source atom: {name}")
    return selected


def assignment_for_leaf(leaf: int) -> tuple[bool, ...]:
    width = len(PINNED_ATOM_NAMES)
    if not 0 <= leaf < 2**width:
        raise ValueError(f"leaf index outside [0, {2**width}): {leaf}")
    return tuple(bool((leaf >> (width - 1 - bit)) & 1) for bit in range(width))


def parse_dimacs(dimacs: str) -> tuple[int, list[str], dict[str, int]]:
    variable_count = -1
    expected_clauses = -1
    clauses: list[str] = []
    names: dict[str, int] = {}
    for line in dimacs.splitlines():
        if line.startswith("p cnf "):
            _, _, raw_variables, raw_clauses = line.split()
            variable_count = int(raw_variables)
            expected_clauses = int(raw_clauses)
        elif line.startswith("c "):
            parts = line.split(maxsplit=2)
            if len(parts) == 3 and parts[1].isdigit():
                names[parts[2]] = int(parts[1])
        elif line.strip():
            values = [int(value) for value in line.split()]
            if not values or values[-1] != 0:
                raise AssertionError(f"unterminated DIMACS clause: {line[:80]}")
            clauses.append(line)
    if variable_count < 0 or expected_clauses < 0:
        raise AssertionError("missing DIMACS header")
    if len(clauses) != expected_clauses:
        raise AssertionError(
            f"DIMACS clause count drift: header={expected_clauses}, "
            f"actual={len(clauses)}"
        )
    return variable_count, clauses, names


def write_activated_dimacs(
    path: Path,
    variable_count: int,
    clauses: list[str],
    selector_variables: list[int],
    names: dict[str, int],
) -> None:
    inverse_names = {variable: name for name, variable in names.items()}
    lines = [
        f"p cnf {variable_count} {len(clauses) + len(selector_variables)}",
        *clauses,
        *(f"{variable} 0" for variable in selector_variables),
        *(f"c {variable} {inverse_names[variable]}" for variable in sorted(inverse_names)),
    ]
    path.write_text("\n".join(lines) + "\n", encoding="utf-8")


def core_unit_variables(path: Path) -> set[int]:
    units: set[int] = set()
    expected = None
    clauses = 0
    for line in path.read_text(encoding="utf-8").splitlines():
        if line.startswith("p cnf "):
            expected = int(line.split()[3])
        elif line and line[0] not in {"c", "p"}:
            values = [int(value) for value in line.split()]
            if not values or values[-1] != 0:
                raise AssertionError(f"unterminated core clause: {line[:80]}")
            clauses += 1
            if len(values) == 2 and values[0] > 0:
                units.add(values[0])
    if expected is None or clauses != expected:
        raise AssertionError(
            f"core DIMACS clause count drift: header={expected}, actual={clauses}"
        )
    return units


def run_command(
    command: list[str], timeout_seconds: float
) -> subprocess.CompletedProcess[str]:
    return subprocess.run(
        command,
        capture_output=True,
        text=True,
        timeout=timeout_seconds,
        check=False,
    )


def has_verified_line(process: subprocess.CompletedProcess[str]) -> bool:
    return any(
        line.strip() == "s VERIFIED"
        for line in (process.stdout + "\n" + process.stderr).splitlines()
    )


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--orbit", choices=ORBITS, required=True)
    parser.add_argument("--leaf", type=int, required=True)
    parser.add_argument("--output-dir", type=Path, required=True)
    parser.add_argument("--seed", type=int, default=0)
    parser.add_argument("--solve-seconds", type=float, default=60.0)
    parser.add_argument("--trim-seconds", type=float, default=180.0)
    parser.add_argument("--plan-only", action="store_true")
    args = parser.parse_args()
    assignment_for_leaf(args.leaf)
    if args.solve_seconds <= 0 or args.trim_seconds <= 0:
        raise ValueError("timeouts must be positive")
    return args


def main() -> None:
    args = parse_args()
    cadical = shutil.which("cadical")
    drat_trim = shutil.which("drat-trim")
    if cadical is None or drat_trim is None:
        raise RuntimeError("cadical and drat-trim must both be on PATH")

    started = time.monotonic()
    surface = load_surface()
    outer, _rank, counts = surface.build(args.orbit, args.seed)
    assertions = list(outer.solver.assertions())
    if len(assertions) != 58_433:
        raise AssertionError(
            f"source assertion count drift: expected 58433, got {len(assertions)}"
        )
    atoms = pinned_atoms(outer)
    values = assignment_for_leaf(args.leaf)
    cube = [
        atoms[name] if value else z3.Not(atoms[name])
        for name, value in zip(PINNED_ATOM_NAMES, values, strict=True)
    ]
    fingerprint = assertion_fingerprint(assertions)
    source_markers = [
        z3.Bool(f"source_assertion_{index:05d}")
        for index in range(len(assertions))
    ]
    cube_markers = [
        z3.Bool(f"source_cube_{index:02d}_{name}")
        for index, name in enumerate(PINNED_ATOM_NAMES)
    ]

    plan = {
        "schema": f"{SCHEMA}-plan",
        "epistemic_status": "EXTERNAL_SELECTOR_CORE_ARCHITECTURE_PLAN_ONLY",
        "orbit": args.orbit,
        "leaf": args.leaf,
        "source_assertion_count": len(assertions),
        "source_assertions_sha256": fingerprint,
        "source_counts": counts,
        "cube": [
            {"atom": name, "value": value, "assertion": literal.sexpr()}
            for name, value, literal in zip(
                PINNED_ATOM_NAMES, values, cube, strict=True
            )
        ],
        "selector_contract": (
            "one named pre-bitblast guard per source assertion and cube literal"
        ),
        "tactic_pipeline": list(PIPELINE),
        "workers": 1,
    }
    print(json.dumps(plan, indent=2, sort_keys=True), flush=True)
    if args.plan_only:
        return

    args.output_dir.mkdir(parents=True, exist_ok=True)
    goal = z3.Goal()
    goal.add(*(
        z3.Implies(marker, assertion)
        for marker, assertion in zip(source_markers, assertions, strict=True)
    ))
    goal.add(*(
        z3.Implies(marker, literal)
        for marker, literal in zip(cube_markers, cube, strict=True)
    ))
    transformed = z3.Then(*PIPELINE)(goal)
    if len(transformed) != 1:
        raise AssertionError(f"expected one CNF subgoal, got {len(transformed)}")
    variable_count, clauses, names = parse_dimacs(
        transformed[0].dimacs(include_names=True)
    )

    source_selector_by_variable: dict[int, int] = {}
    missing_source_markers = 0
    selector_variables: list[int] = []
    for index, marker in enumerate(source_markers):
        variable = names.get(marker.decl().name())
        if variable is None:
            missing_source_markers += 1
            continue
        source_selector_by_variable[variable] = index
        selector_variables.append(variable)
    cube_selector_by_variable: dict[int, int] = {}
    for index, marker in enumerate(cube_markers):
        variable = names.get(marker.decl().name())
        if variable is None:
            raise AssertionError(f"cube selector eliminated unexpectedly: {marker}")
        cube_selector_by_variable[variable] = index
        selector_variables.append(variable)
    if len(selector_variables) != len(set(selector_variables)):
        raise AssertionError("selector variable collision")

    cnf_path = args.output_dir / "guarded-source-leaf.cnf"
    proof_path = args.output_dir / "guarded-source-leaf.drat"
    core_path = args.output_dir / "guarded-source-leaf.core.cnf"
    write_activated_dimacs(
        cnf_path, variable_count, clauses, selector_variables, names
    )
    encoded = time.monotonic()
    solve = run_command(
        [
            cadical,
            "-q",
            "-n",
            "-t",
            str(max(1, math.ceil(args.solve_seconds))),
            str(cnf_path),
            str(proof_path),
        ],
        args.solve_seconds + 30.0,
    )
    solved = time.monotonic()
    status = {10: "SAT", 20: "UNSAT"}.get(solve.returncode, "UNKNOWN")
    payload: dict[str, object] = {
        **plan,
        "schema": SCHEMA,
        "epistemic_status": "EXTERNAL_SELECTOR_CORE_PILOT_INCOMPLETE",
        "cnf_variables": variable_count,
        "cnf_base_clauses": len(clauses),
        "cnf_activation_units": len(selector_variables),
        "source_selectors_preserved": len(source_selector_by_variable),
        "source_markers_simplified_away": missing_source_markers,
        "cube_selectors_preserved": len(cube_selector_by_variable),
        "cnf_sha256": sha256(cnf_path),
        "external_status": status,
        "cadical_returncode": solve.returncode,
        "cadical_stdout_tail": solve.stdout.splitlines()[-20:],
        "cadical_stderr_tail": solve.stderr.splitlines()[-20:],
        "build_and_encode_seconds": encoded - started,
        "solve_seconds_elapsed": solved - encoded,
    }
    if status != "UNSAT":
        payload["total_seconds"] = time.monotonic() - started
        (args.output_dir / "result.json").write_text(
            json.dumps(payload, indent=2, sort_keys=True) + "\n",
            encoding="utf-8",
        )
        print(json.dumps({
            "status": status,
            "output": str(args.output_dir / "result.json"),
        }, sort_keys=True))
        return

    trim = run_command(
        [
            drat_trim,
            str(cnf_path),
            str(proof_path),
            "-c",
            str(core_path),
            "-t",
            str(max(1, math.ceil(args.trim_seconds))),
        ],
        args.trim_seconds + 30.0,
    )
    trimmed = time.monotonic()
    proof_verified = trim.returncode == 0 and has_verified_line(trim)
    payload.update({
        "drat_sha256": sha256(proof_path),
        "drat_trim_returncode": trim.returncode,
        "drat_trim_verified": proof_verified,
        "drat_trim_stdout_tail": trim.stdout.splitlines()[-30:],
        "drat_trim_stderr_tail": trim.stderr.splitlines()[-30:],
        "drat_trim_seconds_elapsed": trimmed - solved,
    })
    if not proof_verified or not core_path.exists():
        payload["total_seconds"] = time.monotonic() - started
        (args.output_dir / "result.json").write_text(
            json.dumps(payload, indent=2, sort_keys=True) + "\n",
            encoding="utf-8",
        )
        raise RuntimeError("external proof/core extraction did not verify")

    units = core_unit_variables(core_path)
    source_indices = sorted(
        source_selector_by_variable[variable]
        for variable in units
        if variable in source_selector_by_variable
    )
    cube_indices = sorted(
        cube_selector_by_variable[variable]
        for variable in units
        if variable in cube_selector_by_variable
    )
    selected_cube = [cube[index] for index in cube_indices]

    # Recheck the recovered source packet directly in Z3 when possible.  This
    # is an additional semantic smoke; the exact external verdict is already
    # checked by drat-trim against the selector-preserving CNF.
    replay = z3.Solver()
    replay.set(timeout=max(1, int(1000 * args.solve_seconds)), random_seed=args.seed)
    replay.add(*(assertions[index] for index in source_indices))
    replay.add(*selected_cube)
    replay_status = replay.check()
    payload.update({
        "core_cnf_sha256": sha256(core_path),
        "core_source_assertion_count": len(source_indices),
        "core_cube_literal_count": len(cube_indices),
        "core": [
            {"index": index, "assertion": assertions[index].sexpr()}
            for index in source_indices
        ],
        "core_cube_literals": [literal.sexpr() for literal in selected_cube],
        "source_packet_z3_recheck": str(replay_status).upper(),
        "source_packet_z3_reason_unknown": (
            replay.reason_unknown() if replay_status == z3.unknown else None
        ),
        "epistemic_status": (
            "DRAT_VERIFIED_EXTERNAL_CORE_MAPPED_TO_SOURCE_ASSERTIONS"
            if source_indices and cube_indices
            else "DRAT_VERIFIED_BUT_SOURCE_SELECTOR_CORE_MAPPING_EMPTY"
        ),
        "verified_bvexpr_contract": {
            "core_entries": (
                "zero-based indices and exact sexprs in the original ordered "
                "surface.build(...).solver.assertions() list"
            ),
            "additional_branch_hypotheses": (
                "the selected exact source literals in core_cube_literals"
            ),
        },
        "total_seconds": time.monotonic() - started,
    })
    result_path = args.output_dir / "result.json"
    result_path.write_text(
        json.dumps(payload, indent=2, sort_keys=True) + "\n",
        encoding="utf-8",
    )
    print(json.dumps({
        "status": payload["epistemic_status"],
        "source_core_size": len(source_indices),
        "cube_core_size": len(cube_indices),
        "z3_recheck": payload["source_packet_z3_recheck"],
        "output": str(result_path),
    }, sort_keys=True), flush=True)


if __name__ == "__main__":
    main()
