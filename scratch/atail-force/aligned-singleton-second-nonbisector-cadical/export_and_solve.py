#!/usr/bin/env python3
"""Faithful Z3 PB-to-CNF export and bounded CaDiCaL runner for the n=17 model.

All artifacts are written beside this script.  The imported source model is
hash-pinned, and SAT assignments are read back into the source assertions.
UNSAT is checked with drat-trim, but remains conditional on the Z3 tactic
translation and on the mathematical fidelity of the bounded source encoding.
"""

from __future__ import annotations

import argparse
from collections import Counter
import hashlib
import io
import json
import subprocess
import sys
import time
from pathlib import Path
from typing import Iterable

import z3


HERE = Path(__file__).resolve().parent
SOURCE_DIR = HERE.parent / "aligned-singleton-second-nonbisector-cegar"
SOURCE_PATH = SOURCE_DIR / "qf_bool_model.py"
SOURCE_SHA256 = "4e7cca7b8fb097387b42aec35358534fee57465b4e6f4d5035acd0295b292219"

if hashlib.sha256(SOURCE_PATH.read_bytes()).hexdigest() != SOURCE_SHA256:
    raise RuntimeError("FAIL_CLOSED_SOURCE_HASH_MISMATCH: qf_bool_model.py")
sys.path.insert(0, str(SOURCE_DIR))
import qf_bool_model as source  # noqa: E402


def log(message: str) -> None:
    print(f"[{time.strftime('%Y-%m-%dT%H:%M:%S%z')}] {message}", flush=True)


def const_name(expression: z3.BoolRef) -> str:
    if (
        not z3.is_const(expression)
        or expression.sort().kind() != z3.Z3_BOOL_SORT
        or expression.decl().kind() != z3.Z3_OP_UNINTERPRETED
    ):
        raise ValueError(f"not a propositional constant: {expression}")
    return str(expression.decl().name())


def clause_literals(expression: z3.BoolRef) -> tuple[str, ...] | None:
    """Return signed names, () for false, or None for a true clause."""
    if z3.is_true(expression):
        return None
    if z3.is_false(expression):
        return ()
    terms = expression.children() if z3.is_or(expression) else (expression,)
    result: list[str] = []
    seen: set[str] = set()
    for term in terms:
        if z3.is_true(term):
            return None
        if z3.is_false(term):
            continue
        if z3.is_not(term):
            name = const_name(term.arg(0))
            literal = f"-{name}"
            opposite = name
        else:
            name = const_name(term)
            literal = name
            opposite = f"-{name}"
        if opposite in seen:
            return None
        if literal not in seen:
            seen.add(literal)
            result.append(literal)
    return tuple(result)


def source_variables(encoding: source.Encoding) -> dict[str, z3.BoolRef]:
    variables: list[z3.BoolRef] = []
    variables.extend(bit for row in encoding._member for bit in row)
    variables.extend(
        bit for plane in encoding._same for row in plane for bit in row
    )
    variables.extend(bit for row in encoding._blocker for bit in row)
    variables.extend(bit for bits in encoding.roles.values() for bit in bits)
    return {const_name(bit): bit for bit in variables}


def tactic_cnf(assertions: Iterable[z3.BoolRef], timeout_ms: int) -> z3.Goal:
    goal = z3.Goal(models=True)
    goal.add(*assertions)
    pipeline = z3.Then("pb2bv", "bit-blast", "tseitin-cnf")
    result = z3.TryFor(pipeline, timeout_ms)(goal)
    if len(result) != 1:
        raise RuntimeError(f"CNF tactic returned {len(result)} subgoals")
    return result[0]


def write_dimacs(
    cnf_goal: z3.Goal,
    original_names: set[str],
    cnf_path: Path,
    mapping_path: Path,
) -> dict[str, object]:
    # Goal.dimacs is the native Z3 serializer.  It validates that the goal is
    # clause-only and emits exact `c <id> <name>` mappings without millions of
    # Python/C-API crossings.
    dimacs = cnf_goal.dimacs(include_names=True)
    cnf_path.write_text(dimacs)
    num_variables = -1
    num_clauses = -1
    variables: list[dict[str, object]] = []
    names: set[str] = set()
    label_counts: Counter[str] = Counter()
    for line in io.StringIO(dimacs):
        if line.startswith("p cnf "):
            _, _, variables_text, clauses_text = line.split()
            num_variables = int(variables_text)
            num_clauses = int(clauses_text)
        elif line.startswith("c "):
            parts = line.rstrip("\n").split(maxsplit=2)
            if len(parts) == 3 and parts[1].isdigit():
                identifier = int(parts[1])
                name = parts[2]
                names.add(name)
                label_counts[name] += 1
                variables.append(
                    {
                        "id": identifier,
                        "name": name,
                        "kind": (
                            "source"
                            if name in original_names
                            else "tactic_auxiliary"
                        ),
                    }
                )
    if num_variables < 0 or num_clauses < 0:
        raise RuntimeError("native DIMACS serializer emitted no header")
    if len(variables) != num_variables:
        raise RuntimeError(
            f"DIMACS mapped {len(variables)} of {num_variables} variables"
        )

    metadata = {
        "schema": "z3-pb2bv-bit-blast-tseitin-cnf-dimacs-v1",
        "source_path": str(SOURCE_PATH.relative_to(HERE.parents[2])),
        "source_sha256": SOURCE_SHA256,
        "z3_version": z3.get_full_version(),
        "num_variables": num_variables,
        "num_original_variables": len(names.intersection(original_names)),
        "num_auxiliary_variables": (
            num_variables - len(names.intersection(original_names))
        ),
        "num_source_variables": len(original_names),
        "missing_source_variables": sorted(original_names.difference(names)),
        "num_clauses": num_clauses,
        "mapping_location": "DIMACS c <id> <Z3-label> comment lines",
        "mapping_identity": (
            "DIMACS id is canonical; some Z3-generated auxiliary labels repeat"
        ),
        "noninjective_labels": sorted(
            name for name, count in label_counts.items() if count > 1
        ),
        "noninjective_label_ids": sum(
            count for count in label_counts.values() if count > 1
        ),
        "cnf_sha256": hashlib.sha256(cnf_path.read_bytes()).hexdigest(),
    }
    mapping_path.write_text(json.dumps(metadata, indent=2, sort_keys=True) + "\n")
    mapping = dict(metadata)
    mapping["variables"] = variables
    return mapping


def parse_cadical_model(stdout: str) -> dict[int, bool]:
    assignment: dict[int, bool] = {}
    for line in stdout.splitlines():
        if not line.startswith("v "):
            continue
        for token in line.split()[1:]:
            literal = int(token)
            if literal:
                assignment[abs(literal)] = literal > 0
    return assignment


def run_cadical(
    cnf_path: Path, proof_path: Path, timeout_s: int, log_path: Path
) -> tuple[str, dict[int, bool], float]:
    started = time.monotonic()
    completed = subprocess.run(
        ["cadical", "-t", str(timeout_s), str(cnf_path), str(proof_path)],
        capture_output=True,
        text=True,
        timeout=timeout_s + 30,
        check=False,
    )
    elapsed = time.monotonic() - started
    log_path.write_text(
        f"returncode={completed.returncode}\n"
        f"elapsed_seconds={elapsed}\n"
        "--- stdout ---\n"
        f"{completed.stdout}\n"
        "--- stderr ---\n"
        f"{completed.stderr}\n"
    )
    if completed.returncode == 10:
        return "SAT", parse_cadical_model(completed.stdout), elapsed
    if completed.returncode == 20:
        return "UNSAT", {}, elapsed
    return "UNKNOWN", {}, elapsed


def verify_sat_readback(
    encoding: source.Encoding,
    mapping: dict[str, object],
    assignment: dict[int, bool],
    timeout_ms: int,
) -> tuple[str, z3.ModelRef | None]:
    variables = source_variables(encoding)
    fixed: list[z3.BoolRef] = []
    for entry in mapping["variables"]:  # type: ignore[index]
        assert isinstance(entry, dict)
        name = str(entry["name"])
        if name not in variables:
            continue
        identifier = int(entry["id"])
        if identifier not in assignment:
            return f"FAIL_MISSING_CADICAL_VALUE_{identifier}", None
        fixed.append(variables[name] == assignment[identifier])
    checker = z3.SolverFor("QF_FD")
    checker.set(timeout=timeout_ms)
    checker.add(*encoding.solver.assertions())
    checker.add(*fixed)
    status = checker.check()
    if status == z3.sat:
        return "SAT_READBACK_VERIFIED", checker.model()
    if status == z3.unsat:
        return "FAIL_CNF_MODEL_REJECTED_BY_SOURCE", None
    return f"UNKNOWN_SOURCE_READBACK_{checker.reason_unknown()}", None


def smoke(output_dir: Path) -> dict[str, object]:
    x, y, z = z3.Bools("smoke_x smoke_y smoke_z")
    cases = {
        "sat": [z3.PbEq([(x, 1), (y, 1), (z, 1)], 1), z3.Implies(x, y)],
        "unsat": [z3.PbEq([(x, 1), (y, 1)], 1), x, y],
    }
    results: dict[str, object] = {}
    for expected, assertions in cases.items():
        goal = tactic_cnf(assertions, 30_000)
        projection_checks = 0
        for mask in range(8):
            values = {
                bit: bool(mask & (1 << index))
                for index, bit in enumerate((x, y, z))
            }
            source_value = all(
                z3.is_true(
                    z3.simplify(
                        z3.substitute(
                            assertion,
                            *((bit, z3.BoolVal(value)) for bit, value in values.items()),
                        )
                    )
                )
                for assertion in assertions
            )
            projected = z3.Solver()
            projected.add(*goal)
            projected.add(*(bit == value for bit, value in values.items()))
            cnf_value = projected.check() == z3.sat
            if source_value != cnf_value:
                raise RuntimeError(
                    f"smoke projection mismatch for {expected}, mask={mask}"
                )
            projection_checks += 1
        original = {const_name(bit) for bit in (x, y, z)}
        cnf = output_dir / f"smoke-{expected}.cnf"
        mapping_path = output_dir / f"smoke-{expected}.mapping.json"
        mapping = write_dimacs(goal, original, cnf, mapping_path)
        verdict, _, elapsed = run_cadical(
            cnf,
            output_dir / f"smoke-{expected}.drat",
            30,
            output_dir / f"smoke-{expected}.cadical.log",
        )
        if verdict.lower() != expected:
            raise RuntimeError(f"smoke {expected}: got {verdict}")
        drat_status = None
        if verdict == "UNSAT":
            checked = subprocess.run(
                [
                    "drat-trim",
                    str(cnf),
                    str(output_dir / f"smoke-{expected}.drat"),
                ],
                capture_output=True,
                text=True,
                timeout=30,
                check=False,
            )
            (output_dir / f"smoke-{expected}.drat-trim.log").write_text(
                checked.stdout + checked.stderr
            )
            drat_status = (
                "VERIFIED"
                if checked.returncode == 0 and "s VERIFIED" in checked.stdout
                else "FAILED"
            )
            if drat_status != "VERIFIED":
                raise RuntimeError("smoke UNSAT DRAT failed")
        results[expected] = {
            "verdict": verdict,
            "elapsed_seconds": elapsed,
            "drat_status": drat_status,
            "variables": mapping["num_variables"],
            "clauses": mapping["num_clauses"],
            "projection_truth_table_checks": projection_checks,
        }
    return results


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--output-dir", type=Path, default=HERE)
    parser.add_argument("--export-timeout-ms", type=int, default=600_000)
    parser.add_argument("--cadical-timeout-s", type=int, default=600)
    parser.add_argument("--readback-timeout-ms", type=int, default=120_000)
    parser.add_argument("--random-seed", type=int, default=0)
    parser.add_argument("--smoke-only", action="store_true")
    parser.add_argument("--export-only", action="store_true")
    args = parser.parse_args()
    args.output_dir.mkdir(parents=True, exist_ok=True)

    summary: dict[str, object] = {
        "schema": "p97-n17-cadical-port-v1",
        "source_sha256": SOURCE_SHA256,
        "z3_version": z3.get_full_version(),
        "smoke": smoke(args.output_dir),
    }
    (args.output_dir / "smoke-summary.json").write_text(
        json.dumps(summary["smoke"], indent=2, sort_keys=True) + "\n"
    )
    if args.smoke_only:
        log("smoke tests passed")
        return

    log("constructing source encoding")
    encoding_started = time.monotonic()
    encoding = source.Encoding(
        timeout_ms=args.readback_timeout_ms,
        random_seed=args.random_seed,
        nonbisector=True,
        full_circle_intersections=False,
    )
    summary["source_construction_seconds"] = time.monotonic() - encoding_started
    ground_ok, ground_detail = source.formula_is_ground_bool(encoding)
    summary["ground_formula_gate"] = ground_detail
    if not ground_ok:
        raise RuntimeError(ground_detail)
    original = source_variables(encoding)
    summary["source_variables"] = len(original)
    summary["source_named_constraint_count"] = sum(encoding.counts.values())
    summary["solver_assertions_after_qffd_and_flattening"] = len(
        encoding.solver.assertions()
    )

    log(
        "exporting "
        f"{summary['solver_assertions_after_qffd_and_flattening']} assertions "
        f"with {len(original)} source variables"
    )
    export_started = time.monotonic()
    cnf_goal = tactic_cnf(
        encoding.solver.assertions(),
        timeout_ms=args.export_timeout_ms,
    )
    summary["tactic_seconds"] = time.monotonic() - export_started
    log(f"tactic produced {len(cnf_goal)} raw CNF formulas")
    cnf_path = args.output_dir / "n17-initial.cnf"
    mapping_path = args.output_dir / "n17-initial.mapping.json"
    mapping = write_dimacs(cnf_goal, set(original), cnf_path, mapping_path)
    summary["dimacs"] = {
        key: mapping[key]
        for key in (
            "num_variables",
            "num_original_variables",
            "num_auxiliary_variables",
            "num_source_variables",
            "num_clauses",
            "missing_source_variables",
            "cnf_sha256",
            "noninjective_labels",
            "noninjective_label_ids",
        )
    }
    summary["cnf_bytes"] = cnf_path.stat().st_size
    summary["mapping_bytes"] = mapping_path.stat().st_size
    summary["export_total_seconds"] = time.monotonic() - export_started
    (args.output_dir / "run-summary.json").write_text(
        json.dumps(summary, indent=2, sort_keys=True) + "\n"
    )
    log(
        f"DIMACS ready: {mapping['num_variables']} variables, "
        f"{mapping['num_clauses']} clauses, {summary['cnf_bytes']} bytes"
    )
    if args.export_only:
        return

    verdict, assignment, cadical_seconds = run_cadical(
        cnf_path,
        args.output_dir / "n17-initial.drat",
        args.cadical_timeout_s,
        args.output_dir / "n17-initial.cadical.log",
    )
    summary["cadical"] = {
        "verdict": verdict,
        "elapsed_seconds": cadical_seconds,
        "assigned_variables": len(assignment),
    }
    if verdict == "SAT":
        readback, witness = verify_sat_readback(
            encoding, mapping, assignment, args.readback_timeout_ms
        )
        summary["sat_readback"] = readback
        if witness is not None:
            payload = source.extract_payload(
                encoding,
                witness,
                status="SAT",
                elapsed_seconds=cadical_seconds,
                refinements=0,
            )
            (args.output_dir / "n17-initial.source-witness.json").write_text(
                json.dumps(payload, indent=2, sort_keys=True) + "\n"
            )
    elif verdict == "UNSAT":
        checked = subprocess.run(
            [
                "drat-trim",
                str(cnf_path),
                str(args.output_dir / "n17-initial.drat"),
            ],
            capture_output=True,
            text=True,
            timeout=max(60, args.cadical_timeout_s),
            check=False,
        )
        (args.output_dir / "n17-initial.drat-trim.log").write_text(
            checked.stdout + checked.stderr
        )
        summary["drat_status"] = (
            "VERIFIED"
            if checked.returncode == 0 and "s VERIFIED" in checked.stdout
            else "FAILED_OR_TIMEOUT"
        )
    summary["terminal_status"] = (
        verdict
        if verdict in ("SAT", "UNSAT")
        else "UNKNOWN_FAIL_CLOSED_NO_MATHEMATICAL_RESULT"
    )
    summary["trust_boundary"] = [
        "DRAT, when verified, certifies only the emitted DIMACS CNF.",
        "Z3 4.16 tactic translation from the hash-pinned source formula is not independently certified.",
        "SAT is accepted only after readback into the pre-CNF source assertions.",
        "The source model is bounded to n=17 and omits Euclidean realizability constraints.",
        "The live Lean obligation has n>=17, so fixed-n UNSAT would not close it.",
    ]
    (args.output_dir / "run-summary.json").write_text(
        json.dumps(summary, indent=2, sort_keys=True) + "\n"
    )
    log(f"terminal status: {summary['terminal_status']}")


if __name__ == "__main__":
    main()
