#!/usr/bin/env python3
"""Exact Euclidean QF_NRA audit of the 38 exact-n=15 D44 survivors.

This imports the audited seven-role named-geometry encoding from
``five_role_euclidean_qfnra_audit.py`` and adds exactly the D44 first-apex
facts ``OK = OB`` and ``OC != OK``.  It is a bounded diagnostic, not a Lean
proof or a full fifteen-point realization.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import subprocess
import sys
from concurrent.futures import ProcessPoolExecutor, as_completed
from fractions import Fraction
from pathlib import Path

import z3


SCRATCH = Path(__file__).resolve().parent
ROOT = SCRATCH.parent
sys.path.insert(0, str(SCRATCH))

import five_role_euclidean_qfnra_audit as base  # noqa: E402


PROFILE_INPUT = ROOT / "scratch/endpoint_exact15_profile_results.json"
PROFILE_MINER = ROOT / "scratch/endpoint_exact15_profile_miner.py"
BASE_AUDIT = ROOT / "scratch/five_role_euclidean_qfnra_audit.py"
OUT = ROOT / "scratch/endpoint_exact15_d44_qfnra_results.json"
REPORT = ROOT / "scratch/endpoint_exact15_d44_qfnra_report.md"
INSTANCE_DIR = ROOT / "scratch/endpoint_exact15_d44_qfnra_instances"
WITNESS_DIR = ROOT / "scratch/endpoint_exact15_d44_qfnra_witness_instances"


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


class D44EuclideanProblem(base.EuclideanProblem):
    """The exact seven-role Euclidean problem with the D44 radius split."""

    def __init__(self, branch: str, residual: str, order: str, timeout_ms: int):
        super().__init__(branch, residual, order, timeout_ms)
        self.add("n15_D44_KB", self.eqdist("O", "K", "B"))
        self.add("n15_D44_radii_ne", z3.Not(self.eqdist("O", "C", "K")))


def validate_d44_fraction_witness(branch, order, coordinates, cap):
    """Read back every base constraint and both D44 facts over Fraction."""
    ok, detail = base.validate_fraction_witness(
        branch, tuple(order), coordinates, cap
    )
    if not ok:
        return False, f"base validation failed: {detail}"
    q = {
        role: (
            base.parse_fraction(coordinates[role]["x"]),
            base.parse_fraction(coordinates[role]["y"]),
        )
        for role in order
    }

    def d2(a, b):
        return ((q[a][0] - q[b][0]) ** 2
                + (q[a][1] - q[b][1]) ** 2)

    checks = {
        "OK_eq_OB": d2("O", "K") == d2("O", "B"),
        "OC_ne_OK": d2("O", "C") != d2("O", "K"),
    }
    bad = [name for name, value in checks.items() if not value]
    return (not bad, "PASS" if not bad else f"failed D44 checks: {bad}")


def fixed_witness_replay(branch, residual, order, coordinates, cap,
                         timeout_s):
    """Replay a rational witness as exact constants in both SMT engines."""
    problem = D44EuclideanProblem(branch, residual, order, timeout_s * 1000)
    solver = z3.SolverFor("QF_NRA")
    solver.set(timeout=timeout_s * 1000)
    solver.add(*problem.constraints.values())
    for role in order:
        solver.add(problem.x[role] == z3.RealVal(coordinates[role]["x"]))
        solver.add(problem.y[role] == z3.RealVal(coordinates[role]["y"]))
        solver.add(problem.cap[role] if cap[role]
                   else z3.Not(problem.cap[role]))
    z3_status = str(solver.check()).upper()
    smt2 = solver.to_smt2() + "\n(check-sat)\n"
    WITNESS_DIR.mkdir(parents=True, exist_ok=True)
    slug = f"{branch.replace('=', 'eq')}_{residual}_{order}_fixed.smt2"
    path = WITNESS_DIR / slug
    path.write_text(smt2)
    cvc5 = base.run_cvc5(smt2, timeout_s)
    return {
        "z3": z3_status,
        "cvc5": cvc5["status"],
        "cvc5_detail": cvc5,
        "instance": str(path.relative_to(ROOT)),
    }


def solve_lane(payload):
    index, total, branch, residual, order, z3_timeout, cvc5_timeout = payload
    problem = D44EuclideanProblem(
        branch, residual, order, z3_timeout * 1000
    )
    smt2 = problem.plain_smt2()
    INSTANCE_DIR.mkdir(parents=True, exist_ok=True)
    slug = f"{branch.replace('=', 'eq')}_{residual}_{order}.smt2"
    instance = INSTANCE_DIR / slug
    instance.write_text(smt2)

    z3_result = problem.solve_z3(z3_timeout)
    cvc5_result = base.run_cvc5(smt2, cvc5_timeout)
    row = {
        "index": index,
        "branch": branch,
        "residual": residual,
        "order": order,
        "profile": "D44",
        "instance": str(instance.relative_to(ROOT)),
        "z3": z3_result,
        "cvc5": cvc5_result,
    }

    if z3_result["status"] == "SAT":
        witness = z3_result["witness"]
        if witness["all_coordinates_rational"]:
            ok, detail = validate_d44_fraction_witness(
                branch, order, witness["coordinates"], witness["cap"]
            )
            row["independent_exact_fraction_validation"] = {
                "status": "PASS" if ok else "FAIL",
                "detail": detail,
            }
            if not ok:
                raise AssertionError((branch, residual, order, detail))
            replay = fixed_witness_replay(
                branch, residual, order, witness["coordinates"],
                witness["cap"], min(15, cvc5_timeout)
            )
            row["fixed_witness_exact_solver_replay"] = replay
            if replay["z3"] != "SAT" or replay["cvc5"] != "SAT":
                raise AssertionError((branch, residual, order, replay))
            row["classification"] = "SAT_EXACT_RATIONAL_NAMED_LOCAL"
        else:
            row["classification"] = "SAT_NONRATIONAL_MODEL_NOT_EXACTLY_VALIDATED"
    elif z3_result["status"] == "UNSAT":
        if cvc5_result["status"] == "UNSAT":
            row["classification"] = "UNSAT_DUAL_SOLVER_TRUSTED"
        else:
            row["classification"] = "UNSAT_Z3_SOLVER_TRUSTED"
    elif cvc5_result["status"] == "UNSAT":
        row["classification"] = "UNSAT_CVC5_SOLVER_TRUSTED"
    elif cvc5_result["status"] == "SAT":
        row["classification"] = "SAT_CVC5_MODEL_NOT_READ_BACK"
    else:
        row["classification"] = "UNKNOWN"
    return row


def version(command):
    try:
        result = subprocess.run(
            [command, "--version"], capture_output=True, text=True, timeout=10
        )
        text = (result.stdout or result.stderr).strip().splitlines()
        return text[0] if text else f"returncode={result.returncode}"
    except (OSError, subprocess.TimeoutExpired) as exc:
        return f"unavailable: {exc}"


def load_jobs():
    data = json.loads(PROFILE_INPUT.read_text())
    jobs = [
        (row["branch"], row["residual"], row["order"])
        for row in data["rows"]
        if row["profile"] == "D44" and row["result"]["status"] == "SAT"
    ]
    assert len(jobs) == 38, len(jobs)
    assert len(set(jobs)) == 38
    assert all(len(order) == 7 and order[0] == "O"
               for _, _, order in jobs)
    return jobs


def count_status(rows, solver):
    return {
        status: sum(row[solver]["status"] == status for row in rows)
        for status in ("SAT", "UNSAT", "UNKNOWN")
    }


def witness_sort_key(row):
    size = row["z3"]["witness_size"]
    return (size["max_abs_numerator"], size["max_denominator"],
            size["sum_abs_numerators"], row["branch"], row["residual"],
            row["order"])


def make_report(output):
    summary = output["summary"]
    rows = output["rows"]
    lines = [
        "# Exact-n=15 D44 endpoint Euclidean QF_NRA audit",
        "",
        "**Status: bounded named-role solver diagnostic only. This is neither "
        "a Lean theorem nor a full 15-point Euclidean realization.**",
        "",
        "## Result",
        "",
        f"The audit ran the exact seven-role Euclidean encoding on all "
        f"**{output['lane_count']}** D44 cyclic-order lanes that survived the "
        "earlier QF_LRA profile filter.",
        "",
        f"- Z3: {summary['z3']['SAT']} SAT, {summary['z3']['UNSAT']} UNSAT, "
        f"{summary['z3']['UNKNOWN']} UNKNOWN.",
        f"- cvc5: {summary['cvc5']['SAT']} SAT, "
        f"{summary['cvc5']['UNSAT']} UNSAT, "
        f"{summary['cvc5']['UNKNOWN']} UNKNOWN.",
        f"- Independently exact-validated rational SAT witnesses: "
        f"{summary['exact_rational_sat_witnesses']}.",
        f"- Cross-solver terminal disagreements: "
        f"{summary['cross_solver_terminal_disagreements']}.",
        "",
        "UNSAT labels are solver-trusted QF_NRA diagnostics, not proof "
        "certificates. Timeout and UNKNOWN lanes remain open and are never "
        "counted as UNSAT.",
        "",
    ]
    if output["smallest_exact_rational_witnesses"]:
        lines += ["## Smallest surviving exact-rational witnesses", ""]
        for witness in output["smallest_exact_rational_witnesses"]:
            lines.append(
                f"- `{witness['branch']}` / `{witness['residual']}` / "
                f"`{witness['order']}`: size `{witness['witness_size']}`; "
                f"coordinates `{witness['coordinates']}`"
            )
        lines.append("")

    unknown = [row for row in rows if row["classification"] == "UNKNOWN"]
    if unknown:
        lines += ["## Remaining UNKNOWN lanes", ""]
        for row in unknown:
            lines.append(
                f"- `{row['branch']}` / `{row['residual']}` / "
                f"`{row['order']}`: Z3 `{row['z3'].get('reason', 'unknown')}`; "
                f"cvc5 `{row['cvc5'].get('reason', 'unknown')}`."
            )
        lines.append("")

    lines += [
        "## Exact witness checks",
        "",
        "Every claimed SAT witness has rational coordinates and passes an "
        "independent Python `Fraction` evaluation of all base constraints plus "
        "`dist(O,K)=dist(O,B)` and `dist(O,C) != dist(O,K)`. The fully fixed "
        "witness is then replayed SAT in both Z3 and cvc5.",
        "",
        "## Encoding and trust boundary",
        "",
        "The imported encoding fixes O=(0,0) and the next cyclic role=(1,0), "
        "requires all 35 ordered triple orientations to be positive, and "
        "includes the recorded named metric equalities/inequalities, shell "
        "cardinality, cap/Sigma-B coupling, and named pair/triple multiplicity "
        "constraints. This audit adds only the two D44 radius facts.",
        "",
        "It omits anonymous shell fillers, erased-row support coupling, physical "
        "cap/MEC geometry, full ambient 15-point completion, and global no-K4. "
        "Thus SAT is only a local named-geometry witness; UNSAT is conditional "
        "on the audited encoding-to-claim correspondence.",
        "",
        "## Reproducibility",
        "",
        f"- Workers: {output['run']['workers']} (maximum allowed: 12).",
        f"- Z3 timeout: {output['run']['z3_timeout_seconds']} seconds per lane.",
        f"- cvc5 timeout: {output['run']['cvc5_timeout_seconds']} seconds per lane.",
        f"- Z3 version: `{output['solvers']['z3']}`.",
        f"- cvc5 version: `{output['solvers']['cvc5']}`.",
        f"- Canonical 38-lane SHA-256: `{output['lane_set_sha256']}`.",
        "",
        "Source SHA-256 hashes:",
        "",
    ]
    for path, digest in output["source_sha256"].items():
        lines.append(f"- `{path}`: `{digest}`")
    lines += [
        "",
        f"Machine-readable results: `{OUT.relative_to(ROOT)}`.",
        f"SMT-LIB instances: `{INSTANCE_DIR.relative_to(ROOT)}/`.",
        "",
    ]
    return "\n".join(lines)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--workers", type=int, default=10)
    parser.add_argument("--z3-timeout", type=int, default=60)
    parser.add_argument("--cvc5-timeout", type=int, default=30)
    parser.add_argument("--limit", type=int,
                        help="debug-only prefix of the canonical 38 lanes")
    parser.add_argument("--output", type=Path, default=OUT)
    parser.add_argument("--report", type=Path, default=REPORT)
    args = parser.parse_args()
    if not 1 <= args.workers <= 12:
        parser.error("--workers must be between 1 and 12")

    jobs = load_jobs()
    if args.limit is not None:
        jobs = jobs[:args.limit]
    canonical = json.dumps(jobs, separators=(",", ":"), ensure_ascii=True)
    payloads = [
        (index, len(jobs), branch, residual, order,
         args.z3_timeout, args.cvc5_timeout)
        for index, (branch, residual, order) in enumerate(jobs, 1)
    ]
    rows = []
    with ProcessPoolExecutor(max_workers=args.workers) as executor:
        futures = {executor.submit(solve_lane, payload): payload
                   for payload in payloads}
        for future in as_completed(futures):
            row = future.result()
            rows.append(row)
            print(
                f"[{len(rows)}/{len(jobs)}] {row['branch']} "
                f"{row['residual']} {row['order']}: "
                f"Z3={row['z3']['status']} cvc5={row['cvc5']['status']} "
                f"class={row['classification']}",
                flush=True,
            )
    rows.sort(key=lambda row: row["index"])

    disagreements = [
        row for row in rows
        if row["z3"]["status"] != "UNKNOWN"
        and row["cvc5"]["status"] != "UNKNOWN"
        and row["z3"]["status"] != row["cvc5"]["status"]
    ]
    exact_sat = [
        row for row in rows
        if row["classification"] == "SAT_EXACT_RATIONAL_NAMED_LOCAL"
    ]
    exact_sat.sort(key=witness_sort_key)
    smallest = [
        {
            "branch": row["branch"],
            "residual": row["residual"],
            "order": row["order"],
            "witness_size": row["z3"]["witness_size"],
            "coordinates": row["z3"]["witness"]["coordinates"],
        }
        for row in exact_sat[:10]
    ]
    classifications = {}
    for row in rows:
        key = row["classification"]
        classifications[key] = classifications.get(key, 0) + 1

    source_paths = (PROFILE_INPUT, PROFILE_MINER, BASE_AUDIT, Path(__file__))
    output = {
        "diagnostic_only": True,
        "lane_selection": (
            "profile=D44 and prior strict-Kalmanson QF_LRA result=SAT"
        ),
        "lane_count": len(rows),
        "lane_set_sha256": hashlib.sha256(canonical.encode()).hexdigest(),
        "source_sha256": {
            str(path.relative_to(ROOT)): sha256(path) for path in source_paths
        },
        "solvers": {
            "z3": z3.get_version_string(),
            "cvc5": version("cvc5"),
        },
        "run": {
            "workers": args.workers,
            "z3_timeout_seconds": args.z3_timeout,
            "cvc5_timeout_seconds": args.cvc5_timeout,
            "cvc5_flags": ["--lang", "smt2", "--nl-cov",
                           "--force-logic=QF_NRA", "--tlimit"],
        },
        "smoke_test": base.smoke_test(
            args.z3_timeout * 1000, args.cvc5_timeout
        ),
        "d44_constraints": [
            "squared_distance(O,K) = squared_distance(O,B)",
            "squared_distance(O,C) != squared_distance(O,K)",
        ],
        "summary": {
            "z3": count_status(rows, "z3"),
            "cvc5": count_status(rows, "cvc5"),
            "classifications": classifications,
            "exact_rational_sat_witnesses": len(exact_sat),
            "cross_solver_terminal_disagreements": len(disagreements),
        },
        "smallest_exact_rational_witnesses": smallest,
        "cross_solver_terminal_disagreements": disagreements,
        "rows": rows,
        "omitted": [
            "anonymous shell fillers",
            "erased-row support coupling",
            "physical cap/MEC geometry",
            "full ambient fifteen-point completion",
            "global no-K4",
        ],
    }
    args.output.write_text(json.dumps(output, indent=2) + "\n")
    args.report.write_text(make_report(output))
    print(json.dumps(output["summary"], indent=2))


if __name__ == "__main__":
    main()
