# Copyright 2026 Adam
# SPDX-License-Identifier: Apache-2.0
"""Generate and run the bounded FreshThird named-packet diagnostic."""

from __future__ import annotations

import hashlib
import json
import shutil
import subprocess
from pathlib import Path

ROOT = Path(__file__).resolve().parent
ARTIFACTS = ROOT / "artifacts"
LOGS = ROOT / "logs"

BOOLS = [
    "nh_same", "nh_omit0", "nh_omit1", "first_center_eq_q",
    "f_q0", "f_q1", "f_q2", "f_q3",
    "int_same", "int_omit0", "int_omit1", "int_diffcaps", "int_samecap",
    "second_center_eq_q", "s_q0", "s_q1", "s_q2", "s_q3",
    "v0", "v1", "v2", "v3", "bounded_center_eq_q",
    "blocked_after_v", "shared_arm", "core_arm",
    "pair01", "pair02", "pair03", "pair12", "pair13", "pair23",
] + [f"core_{i}_q{j}" for i in range(4) for j in range(4)]

INTS = ["f_out", "s_out"] + [f"core_{i}_out" for i in range(4)]


def exactly_one(names: list[str]) -> str:
    terms = " ".join(f"(ite {name} 1 0)" for name in names)
    return f"(= (+ {terms}) 1)"


def bool_count(names: list[str]) -> str:
    terms = " ".join(f"(ite {name} 1 0)" for name in names)
    return f"(+ {terms})"


def base_packet() -> list[str]:
    lines = [
        "; Generated bounded named-data projection of commit 604b7d4b.",
        "; This is not an induced finite carrier and has no anonymous-row closure.",
        "(set-logic QF_LIA)",
        "(set-option :produce-models true)",
    ]
    lines.extend(f"(declare-fun {name} () Bool)" for name in BOOLS)
    lines.extend(f"(declare-fun {name} () Int)" for name in INTS)

    # First-source FreshThirdCapSourceNonHit projection.
    lines += [
        f"(assert (! {exactly_one(['nh_same', 'nh_omit0', 'nh_omit1'])} :named first_nonhit_one_case))",
        "(assert (! (and (<= 0 f_out) (<= f_out 4)) :named first_outside_bounds))",
        f"(assert (! (= (+ {bool_count(['f_q0', 'f_q1', 'f_q2', 'f_q3'])} f_out) 4) :named first_exact_four))",
        "(assert (! (=> nh_same (and first_center_eq_q f_q0 f_q1 f_q2 f_q3 (= f_out 0))) :named first_same_support))",
        "(assert (! (=> nh_omit0 (and (not first_center_eq_q) (not f_q0))) :named first_omit_q0))",
        "(assert (! (=> nh_omit1 (and (not first_center_eq_q) (not f_q1))) :named first_omit_q1))",
    ]

    # Second-source FreshThirdCapSourceInteraction projection.
    interaction_cases = ["int_same", "int_omit0", "int_omit1", "int_diffcaps", "int_samecap"]
    lines += [
        f"(assert (! {exactly_one(interaction_cases)} :named second_interaction_one_case))",
        "(assert (! (and (<= 0 s_out) (<= s_out 4)) :named second_outside_bounds))",
        f"(assert (! (= (+ {bool_count(['s_q0', 's_q1', 's_q2', 's_q3'])} s_out) 4) :named second_exact_four))",
        "(assert (! (=> int_same (and second_center_eq_q s_q0 s_q1 s_q2 s_q3 (= s_out 0))) :named second_same_support))",
        "(assert (! (=> int_omit0 (and (not second_center_eq_q) (not s_q0))) :named second_omit_q0))",
        "(assert (! (=> int_omit1 (and (not second_center_eq_q) (not s_q1))) :named second_omit_q1))",
        "(assert (! (=> int_diffcaps (and (not second_center_eq_q) s_q0 s_q1 (not s_q2) (not s_q3) (= s_out 2))) :named second_different_caps_exact_overlap))",
        "(assert (! (=> int_samecap (and (not second_center_eq_q) s_q0 s_q1 (not s_q2) (not s_q3) (= s_out 2))) :named second_same_cap_exact_overlap))",
    ]

    # Bounded shared-radius/minimal-deletion-core theorem projection.
    lines += [
        f"(assert (! (>= {bool_count(['v0', 'v1', 'v2', 'v3'])} 1) :named v_nonempty))",
        f"(assert (! (<= {bool_count(['v0', 'v1', 'v2', 'v3'])} 4) :named v_card_at_most_four))",
        "(assert (! blocked_after_v :named blocked_after_named_v))",
        "(assert (! (or shared_arm core_arm) :named bounded_dichotomy))",
        "(assert (! (= shared_arm (or pair01 pair02 pair03 pair12 pair13 pair23)) :named shared_pair_witness))",
        "(assert (! (=> pair01 (and v0 v1)) :named pair01_in_v))",
        "(assert (! (=> pair02 (and v0 v2)) :named pair02_in_v))",
        "(assert (! (=> pair03 (and v0 v3)) :named pair03_in_v))",
        "(assert (! (=> pair12 (and v1 v2)) :named pair12_in_v))",
        "(assert (! (=> pair13 (and v1 v3)) :named pair13_in_v))",
        "(assert (! (=> pair23 (and v2 v3)) :named pair23_in_v))",
    ]
    for i in range(4):
        qvars = [f"core_{i}_q{j}" for j in range(4)]
        lines += [
            f"(assert (! (and (<= 0 core_{i}_out) (<= core_{i}_out 4)) :named core_{i}_outside_bounds))",
            f"(assert (! (=> (and core_arm v{i}) (= (+ {bool_count(qvars)} core_{i}_out) 4)) :named core_{i}_exact_four))",
            f"(assert (! (=> (and core_arm v{i}) core_{i}_q{i}) :named core_{i}_contains_label))",
            f"(assert (! (=> (not (and core_arm v{i})) (and {' '.join(f'(not {q})' for q in qvars)} (= core_{i}_out 0))) :named core_{i}_inactive_canonical))",
        ]
    for i in range(4):
        for k in range(i + 1, 4):
            visible_disjoint = " ".join(
                f"(not (and core_{i}_q{j} core_{k}_q{j}))" for j in range(4)
            )
            lines.append(
                f"(assert (! (=> (and core_arm v{i} v{k}) (and {visible_disjoint})) :named core_{i}_{k}_visible_disjoint))"
            )
    return lines


def main_query() -> list[str]:
    return [
        "; Negation of a named-row-only overlap consequence.",
        "; It deliberately does not quantify over anonymous carrier sources.",
        f"(assert (! (=> (not first_center_eq_q) (<= {bool_count(['f_q0', 'f_q1', 'f_q2', 'f_q3'])} 2)) :named first_named_avoids_three))",
        f"(assert (! (=> (not second_center_eq_q) (<= {bool_count(['s_q0', 's_q1', 's_q2', 's_q3'])} 2)) :named second_named_avoids_three))",
    ] + [
        f"(assert (! (=> (and core_arm v{i} (not bounded_center_eq_q)) (<= {bool_count([f'core_{i}_q{j}' for j in range(4)])} 2)) :named core_{i}_named_avoids_three))"
        for i in range(4)
    ]


def baseline_fixture() -> list[str]:
    true_names = {
        "nh_same", "first_center_eq_q", "f_q0", "f_q1", "f_q2", "f_q3",
        "int_same", "second_center_eq_q", "s_q0", "s_q1", "s_q2", "s_q3",
        "v0", "v1", "bounded_center_eq_q", "blocked_after_v", "shared_arm", "pair01",
    }
    lines = [f"(assert (! {name if name in true_names else f'(not {name})'} :named baseline_{name}))" for name in BOOLS]
    values = {"f_out": 0, "s_out": 0, **{f"core_{i}_out": 0 for i in range(4)}}
    lines.extend(f"(assert (! (= {name} {value}) :named baseline_{name}))" for name, value in values.items())
    return lines


def finish(lines: list[str], get_model: bool) -> str:
    lines = [*lines, "(check-sat)"]
    if get_model:
        lines.append(f"(get-value ({' '.join(BOOLS + INTS)}))")
    lines.append("")
    return "\n".join(lines)


def write_artifacts() -> dict[str, str]:
    ARTIFACTS.mkdir(parents=True, exist_ok=True)
    base = base_packet()
    artifacts = {
        "known_sat_baseline.smt2": finish(base + baseline_fixture(), True),
        "main_named_rows_avoid_overlap3.smt2": finish(base + main_query(), True),
        "control_empty_v_unsat.smt2": finish(base + [
            "(assert (! (and (not v0) (not v1) (not v2) (not v3)) :named malformed_empty_v))"
        ], False),
        "control_core_overlap_unsat.smt2": finish(base + [
            "(assert (! core_arm :named malformed_force_core))",
            "(assert (! v0 :named malformed_force_v0))",
            "(assert (! v1 :named malformed_force_v1))",
            "(assert (! core_0_q0 :named malformed_core0_has_q0))",
            "(assert (! core_1_q0 :named malformed_core1_has_q0))",
        ], False),
        "control_sameblocker_omission_unsat.smt2": finish(base + [
            "(assert (! nh_same :named malformed_force_first_same))",
            "(assert (! (not f_q0) :named malformed_omit_from_equal_support))",
        ], False),
    }
    for name, content in artifacts.items():
        (ARTIFACTS / name).write_text(content, encoding="utf-8")
    return artifacts


def run_solver(command: list[str], timeout: int = 45) -> dict[str, object]:
    completed = subprocess.run(command, cwd=ROOT, text=True, capture_output=True, timeout=timeout, check=False)
    first = next((line.strip() for line in completed.stdout.splitlines() if line.strip()), "")
    return {
        "command": command,
        "exit_code": completed.returncode,
        "status": first,
        "stdout": completed.stdout,
        "stderr": completed.stderr,
    }


def solver_version(command: list[str]) -> str:
    completed = subprocess.run(command, text=True, capture_output=True, timeout=10, check=False)
    return (completed.stdout or completed.stderr).strip()


def main() -> int:
    artifacts = write_artifacts()
    LOGS.mkdir(parents=True, exist_ok=True)
    for solver in ("z3", "cvc5"):
        if shutil.which(solver) is None:
            raise SystemExit(f"required solver not found: {solver}")

    versions = {
        "z3": solver_version(["z3", "--version"]),
        "cvc5": solver_version(["cvc5", "--version"]),
    }
    results: dict[str, object] = {
        "source_commit": "604b7d4b2089068920fd5afdcef3dd1cca4b4dbd",
        "solvers": versions,
        "artifacts": {},
    }
    commands: list[str] = []
    for name in sorted(artifacts):
        path = ARTIFACTS / name
        item: dict[str, object] = {}
        for solver, command in (
            ("z3", ["z3", "-smt2", "-T:30", str(path)]),
            ("cvc5", ["cvc5", "--lang", "smt2", "--tlimit", "30000", str(path)]),
        ):
            commands.append(" ".join(command))
            run = run_solver(command)
            (LOGS / f"{path.stem}.{solver}.stdout").write_text(str(run.pop("stdout")), encoding="utf-8")
            (LOGS / f"{path.stem}.{solver}.stderr").write_text(str(run.pop("stderr")), encoding="utf-8")
            item[solver] = run
        results["artifacts"][name] = item

    hashes = {
        name: hashlib.sha256((ARTIFACTS / name).read_bytes()).hexdigest()
        for name in sorted(artifacts)
    }
    (ROOT / "commands.log").write_text("\n".join(commands) + "\n", encoding="utf-8")
    (ROOT / "results.json").write_text(json.dumps(results, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    (ROOT / "SHA256SUMS.json").write_text(json.dumps(hashes, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    print(json.dumps({
        "versions": versions,
        "statuses": {
            name: {solver: data[solver]["status"] for solver in ("z3", "cvc5")}
            for name, data in results["artifacts"].items()
        },
    }, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
