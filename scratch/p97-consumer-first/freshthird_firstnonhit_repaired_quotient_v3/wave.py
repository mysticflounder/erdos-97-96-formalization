#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
"""Prepare and run exactly one bounded Z3+cvc5 repaired-quotient wave."""

from __future__ import annotations

import argparse
import hashlib
import itertools
import json
import re
import subprocess
import sys
from pathlib import Path

import z3

import schema
import source_validate


HERE = Path(__file__).resolve().parent
V2 = HERE.parent / "freshthird_firstnonhit_repaired_quotient_v2"
TIMEOUT_MS = 30_000
MAX_NOGOODS = 12

V2_PINS = {
    "schema.py": "342721ee2fd4af92124ea7915deb1cb4a657505f23efb8b6777ef14390eee740",
    "SOURCE-VALIDATION.json": "32883096a411a4bb3fa82fd24285d0ecaa5e42a264897b8084d7f0c23e2f19a8",
    "base_retained.smt2": "7ca4a48d22b71ea1029f7d775d7c8eac17d302bb2966e6c2c569c9acd447e5a6",
    "base_common.smt2": "b88a712d2d94f7bd4cbc96856a3d71eee1223fb6627d9dfef445045ea83ea050",
    "base_common_sameblocker.smt2": "ca1a4c808660a95ba7f0f3300d448473d384343f79beb8e959ec91d49cd9fdc4",
}


def sha256_bytes(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def sha256(path: Path) -> str:
    return sha256_bytes(path.read_bytes())


def write_json(path: Path, value: object) -> None:
    path.write_text(json.dumps(value, indent=2, sort_keys=True) + "\n")


def verify_v2_pins() -> dict:
    checks: list[dict] = []
    failures: list[str] = []
    for name, expected in V2_PINS.items():
        path = V2 / name
        actual = sha256(path) if path.is_file() else "MISSING"
        checks.append({"path": str(path.relative_to(HERE.parent.parent)),
                       "expected": expected, "actual": actual,
                       "pass": actual == expected})
        if actual != expected:
            failures.append(name)
    for pin_file in ("SOURCE-HASHES.txt", "PREDECESSOR-HASHES.txt"):
        path = V2 / pin_file
        if not path.is_file():
            failures.append(pin_file)
            continue
        for line in path.read_text().splitlines():
            fields = line.split(maxsplit=1)
            if len(fields) != 2:
                failures.append(f"malformed:{pin_file}")
                continue
            expected, relative = fields
            target = HERE.parents[2] / relative
            actual = sha256(target) if target.is_file() else "MISSING"
            checks.append({"path": relative, "expected": expected, "actual": actual,
                           "pass": actual == expected})
            if actual != expected:
                failures.append(relative)
    result = {"status": "PASS" if not failures else "FAIL",
              "v2_namespace": str(V2), "checks": checks, "failures": failures}
    write_json(HERE / "V2-PIN-VERIFICATION.json", result)
    return result


def tool_line(command: list[str]) -> str:
    result = subprocess.run(command, text=True, capture_output=True, timeout=10, check=False)
    text = (result.stdout or result.stderr).strip().splitlines()
    return text[0] if text else f"exit={result.returncode}"


def prepare() -> int:
    pins = verify_v2_pins()
    if pins["status"] != "PASS":
        print("V2_PIN_FAILURE")
        return 3
    gate = source_validate.run()
    catalogs = {}
    for case in schema.CASES:
        body, catalog = schema.build(case)
        path = HERE / f"base_{case}.smt2"
        path.write_text(body)
        catalogs[case] = catalog
        write_json(HERE / f"clause_catalog_{case}.json", catalog)

    controls = {
        "control_smoke_sat.smt2": """(set-logic QF_LIA)
(declare-const s0 Int)(declare-const s1 Int)(declare-const s2 Int)(declare-const s3 Int)
(declare-const q Int)
(assert (distinct s0 s1 s2 s3))
(assert (or (= q s0) (= q s1) (= q s2) (= q s3)))
(check-sat)
""",
        "control_smoke_exact4_rejects_five.smt2": """(set-logic QF_LIA)
(declare-const s0 Int)(declare-const s1 Int)(declare-const s2 Int)(declare-const s3 Int)
(declare-const p0 Int)(declare-const p1 Int)(declare-const p2 Int)(declare-const p3 Int)(declare-const p4 Int)
(assert (distinct s0 s1 s2 s3))
(assert (distinct p0 p1 p2 p3 p4))
(assert (and
  (or (= p0 s0)(= p0 s1)(= p0 s2)(= p0 s3))
  (or (= p1 s0)(= p1 s1)(= p1 s2)(= p1 s3))
  (or (= p2 s0)(= p2 s1)(= p2 s2)(= p2 s3))
  (or (= p3 s0)(= p3 s1)(= p3 s2)(= p3 s3))
  (or (= p4 s0)(= p4 s1)(= p4 s2)(= p4 s3))))
(check-sat)
""",
        "control_unsat.smt2": "(set-logic QF_LIA)\n(assert false)\n(check-sat)\n",
        "control_malformed.smt2": "(set-logic QF_LIA)\n(assert (and true)\n(check-sat)\n",
        # Python Z3's parsed named assertion is an implication.  This control
        # is unsat only when its named label is supplied as an assumption.
        "control_named_false.smt2": (
            "(set-logic QF_LIA)\n"
            "(declare-const smoke_x Int)\n"
            "(assert (! (= smoke_x 0) :named must_be_false))\n"
            "(assert (not (= smoke_x 0)))\n"
            "(check-sat)\n"
        ),
    }
    for name, text in controls.items():
        (HERE / name).write_text(text)

    source_hash = sha256(HERE / "SOURCE-VALIDATION.json")
    launch = {
        "wave": "freshthird_firstnonhit_repaired_quotient_v3",
        "state": "RUNNING" if gate["status"] == "PASS" else "TERMINAL",
        "source_gate": gate["status"],
        "compatibility_class": "C: repaired exact supports/fibers and production 13-label cut",
        "predecessors": [
            "freshthird_firstnonhit_global_blocker_quotient_v1",
            "freshthird_firstnonhit_sevenrow_cut_v1",
        ],
        "case_matrix": list(schema.CASES),
        "logic": "QF_LIA",
        "ambient_carrier_bound": None,
        "finite_interface": "named sources/blockers and anonymous exact-support fillers",
        "core_lease": {"workers": 1, "max_authenticated_nogoods": MAX_NOGOODS},
        "timeout_ms_per_solver_call": TIMEOUT_MS,
        "timeout_escalation": False,
        "solvers": {
            "z3_python": z3.get_version_string(),
            "z3_cli": tool_line(["z3", "--version"]),
            "cvc5": tool_line(["cvc5", "--version"]),
        },
        "source_validation_sha256": source_hash,
        "commands": [
            "uv run python wave.py --prepare",
            "uv run python wave.py --run",
            "uv run python validate_model.py",
            "uv run python validate_clauses.py",
        ],
        "v2_pin_verification": "V2-PIN-VERIFICATION.json",
        "distinction": (
            "FirstNonHit named-role quotient; no pinned endpoints, endpoint distance variables, "
            "or Twelvefold pinned-endpoint producer is encoded"
        ),
    }
    write_json(HERE / "LAUNCH-MANIFEST.json", launch)
    print(gate["status"])
    return 0 if gate["status"] == "PASS" else 3


def bool_names() -> set[str]:
    return {
        "q_center_nonrobust", "second_internal_q0", "second_internal_q1",
        *[f"q{i}_source_in_its_blocker_cap" for i in range(4)],
    }


def solve_z3(text: str) -> tuple[str, dict[str, int | bool] | None, str | None]:
    solver = z3.SolverFor("QF_LIA")
    solver.set(timeout=TIMEOUT_MS)
    try:
        parsed = list(z3.parse_smt2_string(text))
        solver.add(parsed)
    except z3.Z3Exception as exc:
        return "parse-error", None, str(exc)
    # z3.parse_smt2_string represents each :named hard assertion as
    # label -> formula.  Every label must be passed as an assumption; omitting
    # them was the authenticated defect in the single historical wave.  The
    # terminal idempotence gate prevents this repaired path from rerunning it.
    # Use the exact Bool declarations returned by the parser.  Recreating a
    # Bool by printed name can produce a distinct declaration in Z3 4.16.
    labels = [expr.arg(0) for expr in parsed
              if z3.is_implies(expr) and z3.is_bool(expr.arg(0))]
    expected_names = re.findall(r":named\s+([^\s()]+)", text)
    if [str(label) for label in labels] != expected_names:
        return "parse-error", None, "named-label enumeration mismatch"
    result = solver.check(*labels)
    if result == z3.unknown:
        return "unknown", None, solver.reason_unknown()
    if result == z3.unsat:
        core = [str(item) for item in solver.unsat_core()]
        return "unsat", None, json.dumps(core)
    model = solver.model()
    names = sorted(set(schema.declared_names(case_from_text(text))))
    values: dict[str, int | bool] = {}
    bools = bool_names()
    for name in names:
        term = z3.Bool(name) if name in bools else z3.Int(name)
        value = model.eval(term, model_completion=True)
        values[name] = z3.is_true(value) if name in bools else value.as_long()
    return "sat", values, None


def case_from_text(text: str) -> str:
    if "v_ret_z" in text:
        return "retained"
    if "v_w3" in text:
        return "common_sameblocker"
    return "common"


def cvc5_solve(path: Path) -> dict:
    command = ["cvc5", "--lang=smt2", f"--tlimit={TIMEOUT_MS}", str(path)]
    try:
        result = subprocess.run(command, text=True, capture_output=True,
                                timeout=(TIMEOUT_MS / 1000) + 5, check=False)
    except subprocess.TimeoutExpired as exc:
        return {"status": "unknown", "reason": "host timeout", "command": command,
                "stdout": exc.stdout or "", "stderr": exc.stderr or ""}
    first = result.stdout.strip().splitlines()
    status = first[0].strip() if first else "error"
    return {"status": status, "exit_code": result.returncode, "command": command,
            "stdout": result.stdout, "stderr": result.stderr}


def materialized(case: str, readback: dict[str, int | bool]) -> tuple[dict[int, str], dict[int, str]]:
    points: dict[int, str] = {}
    centers: dict[int, str] = {}
    for role in schema.ACTIVE[case]:
        for term in (schema.v(role), schema.b(role), *schema.slots(role)):
            points.setdefault(int(readback[term]), term)
        centers.setdefault(int(readback[schema.b(role)]), role)
    return points, centers


def support_values(role: str, readback: dict[str, int | bool]) -> frozenset[int]:
    return frozenset(int(readback[s]) for s in schema.slots(role))


def find_pattern(case: str, readback: dict[str, int | bool]) -> dict | None:
    points, centers = materialized(case, readback)
    point_values = tuple(sorted(points))
    center_values = tuple(sorted(centers))
    center_support = {value: support_values(centers[value], readback) for value in center_values}
    domains = {
        label: (center_values if label in schema.PATTERN_CENTERS else point_values)
        for label in schema.PATTERN_LABELS
    }
    assignment: dict[int, int] = {}
    used: set[int] = set()

    def viable(label: int, value: int) -> bool:
        if value in used:
            return False
        trial = dict(assignment)
        trial[label] = value
        for center, row in schema.PATTERN.items():
            if center in trial:
                actual = center_support[trial[center]]
                for target in row:
                    if target in trial and trial[target] not in actual:
                        return False
                assigned_targets = {trial[target] for target in row if target in trial}
                # The exact row has four points; already-assigned unrelated
                # labels may not consume one of those values.
                for other, other_value in trial.items():
                    if other != center and other not in row and other_value in actual:
                        return False
                if len(assigned_targets) == 4 and actual != assigned_targets:
                    return False
        return True

    def dfs() -> bool:
        if len(assignment) == len(schema.PATTERN_LABELS):
            return all(
                center_support[assignment[center]] == {assignment[target] for target in row}
                for center, row in schema.PATTERN.items()
            )
        choices: list[tuple[int, list[int]]] = []
        for label in schema.PATTERN_LABELS:
            if label in assignment:
                continue
            candidates = [value for value in domains[label] if viable(label, value)]
            if not candidates:
                return False
            choices.append((label, candidates))
        label, candidates = min(choices, key=lambda item: (len(item[1]), item[0]))
        for value in candidates:
            assignment[label] = value
            used.add(value)
            if dfs():
                return True
            used.remove(value)
            del assignment[label]
        return False

    if not dfs():
        return None
    terms: dict[int, str] = {}
    center_rows: dict[int, str] = {}
    for label in schema.PATTERN_LABELS:
        if label in schema.PATTERN_CENTERS:
            role = centers[assignment[label]]
            terms[label] = schema.b(role)
            center_rows[label] = role
        else:
            terms[label] = points[assignment[label]]
    return {
        "values": {str(label): assignment[label] for label in schema.PATTERN_LABELS},
        "terms": {str(label): terms[label] for label in schema.PATTERN_LABELS},
        "center_rows": {str(label): center_rows[label] for label in schema.PATTERN_CENTERS},
    }


def no_good(embedding: dict) -> str:
    terms = {int(label): term for label, term in embedding["terms"].items()}
    rows = {int(label): role for label, role in embedding["center_rows"].items()}
    conjuncts = [f"(distinct {' '.join(terms[i] for i in schema.PATTERN_LABELS)})"]
    for center, row_targets in schema.PATTERN.items():
        conjuncts.extend(schema.member(rows[center], terms[target]) for target in row_targets)
    return f"(assert (not {schema.smt_and(conjuncts)}))"


def pin_formula(base: str, cuts: list[str], readback: dict[str, int | bool]) -> str:
    lines = [base, *cuts]
    for name, value in sorted(readback.items()):
        rendered = "true" if value is True else "false" if value is False else str(value)
        lines.append(f"(assert (= {name} {rendered}))")
    lines.append("(check-sat)")
    return "\n".join(lines) + "\n"


def unpinned_formula(base: str, cuts: list[str]) -> str:
    return "\n".join([base, *cuts, "(check-sat)"]) + "\n"


def run_controls() -> dict:
    expected = {
        "control_smoke_sat.smt2": "sat",
        "control_smoke_exact4_rejects_five.smt2": "unsat",
        "control_unsat.smt2": "unsat",
        "control_malformed.smt2": "parse-error",
        "control_named_false.smt2": "unsat",
    }
    records = []
    passed = True
    for name, wanted in expected.items():
        path = HERE / name
        text = path.read_text()
        zstatus, _, zreason = solve_z3_control(text)
        cresult = cvc5_solve(path)
        cstatus = "parse-error" if cresult["status"] not in ("sat", "unsat", "unknown") else cresult["status"]
        ok = zstatus == wanted and cstatus == wanted
        passed = passed and ok
        records.append({"file": name, "expected": wanted, "z3": zstatus,
                        "z3_reason": zreason, "cvc5": cstatus,
                        "cvc5_exit_code": cresult.get("exit_code"), "pass": ok})
    result = {"status": "PASS" if passed else "FAIL", "records": records}
    write_json(HERE / "CONTROL-RESULTS.json", result)
    return result


def solve_z3_control(text: str) -> tuple[str, None, str | None]:
    solver = z3.SolverFor("QF_LIA")
    solver.set(timeout=TIMEOUT_MS)
    try:
        parsed = list(z3.parse_smt2_string(text))
        solver.add(parsed)
    except z3.Z3Exception as exc:
        return "parse-error", None, str(exc)
    labels = [expr.arg(0) for expr in parsed
              if z3.is_implies(expr) and z3.is_bool(expr.arg(0))]
    result = solver.check(*labels) if labels else solver.check()
    if result == z3.sat:
        return "sat", None, None
    if result == z3.unsat:
        return "unsat", None, None
    return "unknown", None, solver.reason_unknown()


def extracted_clause() -> dict:
    # Exactly one, and no follow-up solve.  This unary incidence is an
    # immediate structure field, but the present signature intentionally has
    # no cap-incidence predicate.  "Absent" therefore means unrepresented,
    # not model-negated.
    return {
        "count": 1,
        "selection": "smallest source-entitled clause absent from the survivor signature",
        "clause": "C.firstSource.1 ∈ S.capInteriorByIndex S.oppIndex1",
        "atom_count": 1,
        "source": "CapSourceThirdCanonicalRowWitness; C.firstSource_data.2.1",
        "source_file": "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceCanonicalSurface.lean",
        "status": "source-entitled, unrepresented in this quotient, not asserted",
        "effect": "recorded only; no equality/NRA/Lean-search follow-up launched",
    }


def run_wave() -> int:
    terminal_path = HERE / "TERMINAL.json"
    if terminal_path.exists():
        terminal = json.loads(terminal_path.read_text())
        print(f"IDEMPOTENT_NO_SOLVER_CALL {terminal['status']}")
        return 0
    gate = source_validate.run()
    if gate["status"] != "PASS":
        write_json(terminal_path, {"status": "SOURCE_GATE_NO_RUN", "four_valued_verdict": "UNKNOWN"})
        print("SOURCE_GATE_NO_RUN")
        return 3
    controls = run_controls()
    if controls["status"] != "PASS":
        write_json(terminal_path, {"status": "CONTROL_GATE_NO_RUN", "four_valued_verdict": "UNKNOWN"})
        print("CONTROL_GATE_NO_RUN")
        return 4

    (HERE / "iterations").mkdir(exist_ok=True)
    (HERE / "logs").mkdir(exist_ok=True)
    total_nogoods = 0
    case_results = []
    for case in schema.CASES:
        base = (HERE / f"base_{case}.smt2").read_text()
        cuts: list[str] = []
        cut_records: list[dict] = []
        iteration = 0
        while True:
            status, readback, reason = solve_z3(base + "\n".join(cuts))
            record = {"case": case, "iteration": iteration, "z3_status": status,
                      "reason": reason, "readback": readback}
            if status == "sat":
                assert readback is not None
                embedding = find_pattern(case, readback)
                record["pattern_embedding"] = embedding
                write_json(HERE / "iterations" / f"{case}-{iteration:02d}.json", record)
                if embedding is None:
                    terminal_text = pin_formula(base, cuts, readback)
                    terminal_smt = HERE / f"terminal_{case}.smt2"
                    terminal_smt.write_text(terminal_text)
                    cresult = cvc5_solve(terminal_smt)
                    (HERE / "logs" / f"{case}.cvc5.stdout").write_text(cresult.get("stdout", ""))
                    (HERE / "logs" / f"{case}.cvc5.stderr").write_text(cresult.get("stderr", ""))
                    case_results.append({
                        "case": case, "status": "SAT", "four_valued_verdict": "SAT-abstraction",
                        "iterations": iteration + 1, "authenticated_nogoods": len(cuts),
                        "terminal_readback": f"iterations/{case}-{iteration:02d}.json",
                        "cvc5_pinned_replay": cresult["status"],
                        "terminal_smt_sha256": sha256(terminal_smt),
                    })
                    break
                if total_nogoods >= MAX_NOGOODS:
                    case_results.append({"case": case, "status": "BUDGET",
                                         "four_valued_verdict": "UNKNOWN",
                                         "iterations": iteration + 1,
                                         "authenticated_nogoods": len(cuts)})
                    break
                clause = no_good(embedding)
                if clause in cuts:
                    case_results.append({"case": case, "status": "INVARIANT_FAILURE",
                                         "four_valued_verdict": "UNKNOWN",
                                         "reason": "duplicate no-good did not exclude witness"})
                    break
                cut_record = {
                    "case": case, "iteration": iteration, "embedding": embedding,
                    "clause": clause, "sha256": sha256_bytes((clause + "\n").encode()),
                    "admission": "production theorem not_realizes_thirteenPointSevenCirclePattern",
                    "authentication": "13 distinct materialized point values and seven exact four-point rows",
                }
                cuts.append(clause)
                cut_records.append(cut_record)
                total_nogoods += 1
                iteration += 1
                continue

            terminal_smt = HERE / f"terminal_{case}.smt2"
            terminal_smt.write_text(unpinned_formula(base, cuts))
            cresult = cvc5_solve(terminal_smt) if status == "unsat" else {"status": "not-run"}
            (HERE / "logs" / f"{case}.cvc5.stdout").write_text(cresult.get("stdout", ""))
            (HERE / "logs" / f"{case}.cvc5.stderr").write_text(cresult.get("stderr", ""))
            verdict = "semantic-UNSAT" if status == "unsat" and cresult["status"] == "unsat" else "UNKNOWN"
            case_results.append({
                "case": case, "status": status.upper(), "four_valued_verdict": verdict,
                "iterations": iteration + 1, "authenticated_nogoods": len(cuts),
                "z3_core": json.loads(reason) if status == "unsat" and reason else [],
                "cvc5_replay": cresult["status"], "terminal_smt_sha256": sha256(terminal_smt),
                "coverage": "complete case formula plus every authenticated production-theorem no-good",
            })
            break
        write_json(HERE / f"cuts_{case}.json", cut_records)

    statuses = {item["status"] for item in case_results}
    cvc_ok = all(item.get("cvc5_pinned_replay", item.get("cvc5_replay")) in ("sat", "unsat")
                 for item in case_results)
    if statuses == {"SAT"} and cvc_ok:
        overall, verdict = "SAT_MOTIF_FREE_SURVIVOR", "SAT-abstraction"
        write_json(HERE / "EXTRACTED-CLAUSE.json", extracted_clause())
    elif statuses == {"UNSAT"} and cvc_ok:
        overall, verdict = "FINITE_QUOTIENT_UNSAT", "semantic-UNSAT"
    else:
        overall, verdict = "UNKNOWN", "UNKNOWN"
    terminal = {
        "wave": "freshthird_firstnonhit_repaired_quotient_v3",
        "state": "TERMINAL", "status": overall, "four_valued_verdict": verdict,
        "cases": case_results, "total_authenticated_nogoods": total_nogoods,
        "max_authenticated_nogoods": MAX_NOGOODS,
        "timeouts_escalated": False, "workers": 1,
        "scope": "unbounded named-role quotient; no ambient carrier enumeration or coverage lift",
        "universal_claim": False,
        "followups_launched": [],
    }
    write_json(terminal_path, terminal)
    print(f"{overall} nogoods={total_nogoods}")
    return 0 if overall != "UNKNOWN" else 5


def main() -> int:
    parser = argparse.ArgumentParser()
    mode = parser.add_mutually_exclusive_group(required=True)
    mode.add_argument("--prepare", action="store_true")
    mode.add_argument("--run", action="store_true")
    args = parser.parse_args()
    return prepare() if args.prepare else run_wave()


if __name__ == "__main__":
    raise SystemExit(main())
