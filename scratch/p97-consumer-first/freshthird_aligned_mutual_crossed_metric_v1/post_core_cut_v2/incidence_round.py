#!/usr/bin/env python3
"""Exact-17 incidence refinement after the singleton/K4 metric core.

The new preflight is deliberately generic in the two aligned canonical
sources: if the first-apex K4 support contains either source, its intersection
with the strict first cap is forced to be that source alone.
"""

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
SOURCE_SCRIPT = (
    HERE.parent.parent / "freshthird_aligned_mutual_crossed_v1" / "diagnostic.py"
)
GENERATED = HERE / "generated"
LOGS = HERE / "logs"
QUERY = GENERATED / "post_core_cut_v2_incidence.smt2"
ASSIGNMENT = GENERATED / "post_core_cut_v2_assignment.json"
RESULTS = HERE / "incidence_results.json"
OLD_ASSIGNMENT = HERE.parent / "generated" / "refined_global_k4_assignment.json"


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


def add_first_apex_source_singleton_k4_preflight(
    g: Any,
) -> list[dict[str, str]]:
    """Push the two source-clean singleton slices into incidence selection.

    A chosen point-K4 support is only a subset of an equidistance class.  If it
    contains an aligned canonical source, the singleton theorem therefore
    excludes every distinct strict-first-cap point from that support.
    """
    clauses: list[dict[str, str]] = []
    roles = g.base.role
    first_apex = roles["apex0"]
    for source_name in ("c_first", "c_second"):
        source = roles[source_name]
        for center in range(len(g.point_k4)):
            contains_source = member_at(g.point_k4[center], source)
            for point in range(len(g.point_k4[center])):
                g.solver.add(
                    z3.Implies(
                        z3.And(
                            first_apex == center,
                            contains_source,
                            g.base.interior_at(0, point),
                            point != source,
                        ),
                        z3.Not(g.point_k4[center][point]),
                    )
                )
        clauses.append(
            {
                "name": f"first_apex_k4_support_containing_{source_name}_is_cap_singleton",
                "source": (
                    "firstFiberCapSource_firstApexRadius_eq_singleton_of_aligned "
                    "(TwoSourceFreshThirdRetainedProducer.lean), instantiated "
                    f"at {source_name}"
                ),
                "scope": (
                    "every chosen first-apex point-K4 support containing this "
                    "source; every other strict cap0 point"
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


def external_check(
    name: str, query: Path, timeout_s: int, log_stem: str
) -> dict[str, Any]:
    executable = shutil.which(name)
    if executable is None:
        return {"status": "ERROR:unavailable", "seconds": 0.0}
    command = (
        [executable, "-smt2", f"-T:{timeout_s}", str(query)]
        if name == "z3"
        else [
            executable,
            "--lang=smt2",
            "--check-models",
            f"--tlimit={timeout_s * 1000}",
            str(query),
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
        (LOGS / f"{log_stem}_{name}.log").write_text(stdout + "\nSTDERR\n" + stderr)
        return {"status": "TIMEOUT", "seconds": round(time.monotonic() - start, 3)}
    output = proc.stdout + "\nSTDERR\n" + proc.stderr
    (LOGS / f"{log_stem}_{name}.log").write_text(output)
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
    first_apex = int(roles["apex0"])
    first_apex_k4 = set(map(int, assignment["point_k4_rows"][first_apex]))
    strict_first_cap = first_cap - first_cap_endpoints
    for source_name in ("c_first", "c_second"):
        source = int(roles[source_name])
        if source in first_apex_k4:
            overlap = first_apex_k4 & strict_first_cap
            if overlap != {source}:
                errors.append(
                    f"{source_name} first-apex K4 singleton violated by "
                    f"{sorted(overlap - {source})}"
                )
    return errors


def write_smoke_query(name: str, assertions: list[str]) -> Path:
    path = GENERATED / f"{name}.smt2"
    text = "\n".join(
        ["(set-logic QF_LIA)", "(declare-const x Int)"]
        + [f"(assert {assertion})" for assertion in assertions]
        + ["(check-sat)", ""]
    )
    if text.count("(check-sat)") != 1:
        raise RuntimeError("smoke artifact must contain exactly one check-sat")
    path.write_text(text)
    return path


def smoke_controls(timeout_s: int) -> dict[str, Any]:
    expected = {
        "smoke_sat": (["(= x 1)"], "SAT"),
        "smoke_malformed_unsat": (["(= x 1)", "(= x 2)"], "UNSAT"),
    }
    results: dict[str, Any] = {}
    for name, (assertions, expected_status) in expected.items():
        path = write_smoke_query(name, assertions)
        solvers = {
            solver: external_check(solver, path, timeout_s, name)
            for solver in ("z3", "cvc5")
        }
        results[name] = {
            "artifact": str(path.relative_to(HERE)),
            "expected": expected_status,
            "solvers": solvers,
            "status": (
                "PASS"
                if all(data["status"] == expected_status for data in solvers.values())
                else "FAIL"
            ),
        }
    old_assignment = json.loads(OLD_ASSIGNMENT.read_text())
    old_errors = validate_cut(old_assignment)
    results["prior_assignment_rejected"] = {
        "input": str(OLD_ASSIGNMENT.relative_to(HERE.parent)),
        "expected": "REJECTED",
        "status": "PASS" if old_errors else "FAIL",
        "errors": old_errors,
    }
    return results


def run(timeout_s: int) -> dict[str, Any]:
    GENERATED.mkdir(parents=True, exist_ok=True)
    LOGS.mkdir(parents=True, exist_ok=True)
    source = load_source_generator()
    g = source.build_global_k4()
    cut_audit = add_singleton_rich_exclusion(g)
    cut_audit += add_first_apex_source_singleton_k4_preflight(g)
    emit_one_check(g.solver)

    external = {
        "z3": external_check("z3", QUERY, timeout_s, "incidence"),
        "cvc5": external_check("cvc5", QUERY, timeout_s, "incidence"),
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
        "controls": smoke_controls(min(timeout_s, 10)),
        "first_cap_composition_contract": (
            "strict cap0 = P union P_rho union {c_first,c_second}; "
            "closed cap0 additionally contains apex1 and apex2"
        ),
        "fidelity": (
            "source-entitled rich exclusion and both generic first-apex source "
            "singleton preflights added; still not a complete Euclidean or "
            "original-P97 model"
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
