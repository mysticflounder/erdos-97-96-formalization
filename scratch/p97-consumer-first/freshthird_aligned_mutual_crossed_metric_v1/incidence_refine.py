#!/usr/bin/env python3
"""Feed the aligned-singleton/rich-slice cut back into the exact-17 generator."""

from __future__ import annotations

import argparse
import importlib.util
import json
import re
import shutil
import subprocess
import sys
import time
from pathlib import Path
from types import ModuleType
from typing import Any

import z3

HERE = Path(__file__).resolve().parent
SOURCE_SCRIPT = HERE.parent / "freshthird_aligned_mutual_crossed_v1" / "diagnostic.py"
GENERATED = HERE / "generated"
LOGS = HERE / "logs"
QUERY = GENERATED / "refined_global_k4_neither_positive.smt2"
ASSIGNMENT = GENERATED / "refined_global_k4_assignment.json"
RESULTS = HERE / "incidence_refinement_results.json"


def load_source_generator() -> ModuleType:
    spec = importlib.util.spec_from_file_location(
        "freshthird_incidence_v1", SOURCE_SCRIPT
    )
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot import {SOURCE_SCRIPT}")
    module = importlib.util.module_from_spec(spec)
    sys.modules[spec.name] = module
    spec.loader.exec_module(module)
    return module


def member_at(vector: list[z3.BoolRef], point: z3.ArithRef) -> z3.BoolRef:
    return z3.Or([z3.And(point == p, vector[p]) for p in range(len(vector))])


def add_singleton_rich_exclusion(g: Any) -> list[dict[str, str]]:
    """Select retained D44 and exclude both sources from its rich arms.

    ``oppApex1_rich_exactRetainedRadii_of_aligned`` rules out S6 and identifies
    the D44 radii with the two retained collision radii, up to swapping.  Thus
    both cap-interior arms have cardinality at least two.  That is exactly the
    ``htwo`` premise consumed by the public paired-source exclusion theorem.
    """
    clauses: list[dict[str, str]] = []
    g.solver.add(g.rich_two_arm[0])
    clauses.append(
        {
            "name": "first_apex_retained_branch_is_d44",
            "source": (
                "oppApex1_rich_exactRetainedRadii_of_aligned "
                "(TwoSourceFreshThirdRetainedProducer.lean)"
            ),
            "htwo": "both active first-apex arms have cap-interior card >= 2",
        }
    )
    r = g.base.role
    first_arm, second_arm = g.rich_slice[0]
    p_pair = [z3.Or(p == r["p1"], p == r["p2"]) for p in range(len(first_arm))]
    rho_pair = [z3.Or(p == r["r1"], p == r["r2"]) for p in range(len(first_arm))]
    direct = z3.And(
        [first_arm[p] == p_pair[p] for p in range(len(first_arm))]
        + [second_arm[p] == rho_pair[p] for p in range(len(first_arm))]
    )
    swapped = z3.And(
        [first_arm[p] == rho_pair[p] for p in range(len(first_arm))]
        + [second_arm[p] == p_pair[p] for p in range(len(first_arm))]
    )
    g.solver.add(z3.Or(direct, swapped))
    clauses.append(
        {
            "name": "first_apex_rich_slices_are_retained_pairs_up_to_swap",
            "source": (
                "oppApex1_rich_exactRetainedRadii_of_aligned + "
                "hfrontierInteriorEq + hρInteriorEq"
            ),
            "htwo": "each exact retained pair has two distinct endpoints",
        }
    )
    for source_name in ("c_first", "c_second"):
        source = g.base.role[source_name]
        for arm in range(2):
            g.solver.add(z3.Not(member_at(g.rich_slice[0][arm], source)))
            clauses.append(
                {
                    "name": f"aligned_{source_name}_not_in_first_apex_rich_arm_{arm}",
                    "source": (
                        "freshThird_alignedRetainedConsumerPacket_sources_not_mem_"
                        "firstApex_multiPointRadius"
                    ),
                    "htwo": (
                        f"rich_two_arm[0] and rich_slice[0][{arm}] cardinality >= 2"
                    ),
                }
            )
    return clauses


def emit_one_check(solver: z3.Solver) -> None:
    GENERATED.mkdir(parents=True, exist_ok=True)
    body = solver.sexpr().rstrip()
    if re.search(r"\(\s*check-sat\b", body):
        raise RuntimeError("unexpected check-sat in solver sexpr")
    text = body + "\n(check-sat)\n"
    if len(re.findall(r"\(\s*check-sat\b", text)) != 1:
        raise RuntimeError("artifact must contain exactly one check-sat")
    QUERY.write_text(text)


def external_check(name: str, timeout_s: int) -> dict[str, Any]:
    executable = shutil.which(name)
    if executable is None:
        return {"status": "ERROR:unavailable", "seconds": 0.0}
    command = (
        [executable, "-smt2", f"-T:{timeout_s}", str(QUERY)]
        if name == "z3"
        else [
            executable,
            "--lang=smt2",
            f"--tlimit={timeout_s * 1000}",
            str(QUERY),
        ]
    )
    start = time.monotonic()
    try:
        proc = subprocess.run(
            command,
            capture_output=True,
            text=True,
            timeout=timeout_s + 5,
            check=False,
        )
    except subprocess.TimeoutExpired as exc:
        stdout = (
            exc.stdout.decode() if isinstance(exc.stdout, bytes) else exc.stdout or ""
        )
        stderr = (
            exc.stderr.decode() if isinstance(exc.stderr, bytes) else exc.stderr or ""
        )
        (LOGS / f"incidence_refine_{name}.log").write_text(
            stdout + "\nSTDERR\n" + stderr
        )
        return {"status": "TIMEOUT", "seconds": round(time.monotonic() - start, 3)}
    output = proc.stdout + "\nSTDERR\n" + proc.stderr
    (LOGS / f"incidence_refine_{name}.log").write_text(output)
    tokens = re.findall(r"(?m)^\s*(sat|unsat|unknown)\s*$", proc.stdout + proc.stderr)
    if proc.returncode != 0:
        status = f"ERROR:exit_{proc.returncode}"
    elif len(tokens) != 1:
        status = f"ERROR:status_count_{len(tokens)}"
    else:
        status = tokens[0].upper()
    return {"status": status, "seconds": round(time.monotonic() - start, 3)}


def validate_cut(assignment: dict[str, Any]) -> list[str]:
    roles = assignment["roles"]
    rich = assignment["rich_slices"][0]
    errors: list[str] = []
    p_pair = {int(roles["p1"]), int(roles["p2"])}
    rho_pair = {int(roles["r1"]), int(roles["r2"])}
    first_arms = [set(map(int, points)) for points in rich]
    first_cap = set(map(int, assignment["caps"][0]))
    first_cap_endpoints = {int(roles["apex1"]), int(roles["apex2"])}
    expected_first_interior = (
        p_pair
        | rho_pair
        | {
            int(roles["c_first"]),
            int(roles["c_second"]),
        }
    )
    if first_cap - first_cap_endpoints != expected_first_interior:
        errors.append(
            "first strict cap is not exactly P union P_rho union {c_first,c_second}"
        )
    if not (first_arms == [p_pair, rho_pair] or first_arms == [rho_pair, p_pair]):
        errors.append("first-apex D44 slices are not exactly P/Pρ up to swap")
    for source_name in ("c_first", "c_second"):
        source = int(roles[source_name])
        for arm, points in enumerate(rich):
            if source in set(map(int, points)):
                errors.append(f"{source_name} remains in rich cap0 arm {arm}")
    return errors


def run(timeout_s: int) -> dict[str, Any]:
    GENERATED.mkdir(parents=True, exist_ok=True)
    LOGS.mkdir(parents=True, exist_ok=True)
    source = load_source_generator()
    g = source.build_global_k4()
    cut_audit = add_singleton_rich_exclusion(g)
    emit_one_check(g.solver)

    external = {
        "z3": external_check("z3", timeout_s),
        "cvc5": external_check("cvc5", timeout_s),
    }
    g.solver.set(timeout=timeout_s * 1000)
    start = time.monotonic()
    internal_status = g.solver.check()
    internal_seconds = round(time.monotonic() - start, 3)
    internal = str(internal_status).upper()
    validation: dict[str, Any] = {"status": "NOT_RUN"}
    if internal_status == z3.sat:
        assignment = source.extract_global_assignment(g, g.solver.model())
        ASSIGNMENT.write_text(json.dumps(assignment, indent=2, sort_keys=True) + "\n")
        errors = source.verify_global_assignment(assignment) + validate_cut(assignment)
        validation = {
            "status": "PASS" if not errors else "FAIL",
            "errors": errors[:20],
            "assignment": str(ASSIGNMENT.relative_to(HERE)),
        }

    results = {
        "scope": "exact-17 direct crossed incidence abstraction only",
        "cut": cut_audit,
        "query": str(QUERY.relative_to(HERE)),
        "check_sat_count": QUERY.read_text().count("(check-sat)"),
        "external": external,
        "internal_z3": {"status": internal, "seconds": internal_seconds},
        "assignment_validation": validation,
        "first_cap_composition_contract": (
            "strict cap0 = P union P_rho union {c_first,c_second}; "
            "closed cap0 additionally contains apex1 and apex2"
        ),
        "fidelity": (
            "source-entitled singleton/rich exclusion added; still not a complete "
            "Euclidean or original-P97 model"
        ),
        "closure_claim": "NONE",
    }
    RESULTS.write_text(json.dumps(results, indent=2, sort_keys=True) + "\n")
    return results


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--timeout", type=int, default=60)
    args = parser.parse_args()
    results = run(args.timeout)
    print(
        "external="
        + ",".join(
            f"{name}:{data['status']}" for name, data in results["external"].items()
        )
        + f" internal={results['internal_z3']['status']}"
        + f" validation={results['assignment_validation']['status']}"
    )


if __name__ == "__main__":
    main()
