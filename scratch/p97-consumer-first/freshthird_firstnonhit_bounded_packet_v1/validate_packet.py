# Copyright 2026 Adam
# SPDX-License-Identifier: Apache-2.0
"""Independent exact readback and contract validator for the packet."""

from __future__ import annotations

import hashlib
import json
import re
from pathlib import Path

ROOT = Path(__file__).resolve().parent
ARTIFACTS = ROOT / "artifacts"
LOGS = ROOT / "logs"

BOOL_NAMES = {
    "nh_same", "nh_omit0", "nh_omit1", "first_center_eq_q",
    "f_q0", "f_q1", "f_q2", "f_q3",
    "int_same", "int_omit0", "int_omit1", "int_diffcaps", "int_samecap",
    "second_center_eq_q", "s_q0", "s_q1", "s_q2", "s_q3",
    "v0", "v1", "v2", "v3", "bounded_center_eq_q", "blocked_after_v",
    "shared_arm", "core_arm", "pair01", "pair02", "pair03", "pair12", "pair13", "pair23",
} | {f"core_{i}_q{j}" for i in range(4) for j in range(4)}
INT_NAMES = {"f_out", "s_out"} | {f"core_{i}_out" for i in range(4)}
ALL_NAMES = BOOL_NAMES | INT_NAMES
PAIR_ENDPOINTS = {
    "pair01": (0, 1), "pair02": (0, 2), "pair03": (0, 3),
    "pair12": (1, 2), "pair13": (1, 3), "pair23": (2, 3),
}


def parse_values(text: str) -> dict[str, bool | int]:
    values: dict[str, bool | int] = {}
    for name, raw in re.findall(r"\(([A-Za-z0-9_]+)\s+(-?[0-9]+|true|false)\)", text):
        if name in BOOL_NAMES:
            values[name] = raw == "true"
        elif name in INT_NAMES:
            values[name] = int(raw)
    missing = sorted(ALL_NAMES - values.keys())
    if missing:
        raise AssertionError(f"missing readback values: {missing}")
    return values


def one(values: dict[str, bool | int], names: list[str]) -> bool:
    return sum(bool(values[name]) for name in names) == 1


def qcount(values: dict[str, bool | int], prefix: str) -> int:
    return sum(bool(values[f"{prefix}_q{j}"]) for j in range(4))


def validate_model(values: dict[str, bool | int], *, baseline: bool) -> list[str]:
    checks: list[tuple[str, bool]] = []
    add = checks.append
    add(("first exactly one", one(values, ["nh_same", "nh_omit0", "nh_omit1"])))
    add(("first exact four", qcount(values, "f") + int(values["f_out"]) == 4))
    add(("first outside bounds", 0 <= int(values["f_out"]) <= 4))
    if values["nh_same"]:
        add(("first same support", bool(values["first_center_eq_q"]) and qcount(values, "f") == 4 and values["f_out"] == 0))
    if values["nh_omit0"]:
        add(("first omit q0", not values["first_center_eq_q"] and not values["f_q0"]))
    if values["nh_omit1"]:
        add(("first omit q1", not values["first_center_eq_q"] and not values["f_q1"]))

    interactions = ["int_same", "int_omit0", "int_omit1", "int_diffcaps", "int_samecap"]
    add(("second exactly one", one(values, interactions)))
    add(("second exact four", qcount(values, "s") + int(values["s_out"]) == 4))
    add(("second outside bounds", 0 <= int(values["s_out"]) <= 4))
    if values["int_same"]:
        add(("second same support", bool(values["second_center_eq_q"]) and qcount(values, "s") == 4 and values["s_out"] == 0))
    if values["int_omit0"]:
        add(("second omit q0", not values["second_center_eq_q"] and not values["s_q0"]))
    if values["int_omit1"]:
        add(("second omit q1", not values["second_center_eq_q"] and not values["s_q1"]))
    if values["int_diffcaps"] or values["int_samecap"]:
        add(("second exact two overlap", not values["second_center_eq_q"] and values["s_q0"] and values["s_q1"] and not values["s_q2"] and not values["s_q3"] and values["s_out"] == 2))

    active = [i for i in range(4) if values[f"v{i}"]]
    add(("V nonempty", bool(active)))
    add(("V bounded", len(active) <= 4))
    add(("blocking predicate retained", bool(values["blocked_after_v"])))
    add(("dichotomy", bool(values["shared_arm"] or values["core_arm"])))
    true_pairs = [name for name in PAIR_ENDPOINTS if values[name]]
    add(("shared iff named pair", bool(values["shared_arm"]) == bool(true_pairs)))
    for pair in true_pairs:
        i, k = PAIR_ENDPOINTS[pair]
        add((f"{pair} endpoints active", bool(values[f"v{i}"] and values[f"v{k}"])))

    for i in range(4):
        is_core_active = bool(values["core_arm"] and values[f"v{i}"])
        if is_core_active:
            add((f"core {i} exact four", qcount(values, f"core_{i}") + int(values[f"core_{i}_out"]) == 4))
            add((f"core {i} contains label", bool(values[f"core_{i}_q{i}"])))
            add((f"core {i} outside bounds", 0 <= int(values[f"core_{i}_out"]) <= 4))
        else:
            add((f"core {i} inactive canonical", qcount(values, f"core_{i}") == 0 and values[f"core_{i}_out"] == 0))
    if values["core_arm"]:
        for pos, i in enumerate(active):
            for k in active[pos + 1:]:
                add((f"core {i},{k} visible disjoint", all(not (values[f"core_{i}_q{j}"] and values[f"core_{k}_q{j}"]) for j in range(4))))

    if not baseline:
        if not values["first_center_eq_q"]:
            add(("first named avoids overlap 3", qcount(values, "f") <= 2))
        if not values["second_center_eq_q"]:
            add(("second named avoids overlap 3", qcount(values, "s") <= 2))
        if values["core_arm"] and not values["bounded_center_eq_q"]:
            for i in active:
                add((f"core {i} named avoids overlap 3", qcount(values, f"core_{i}") <= 2))
    else:
        expected_true = {
            "nh_same", "first_center_eq_q", "f_q0", "f_q1", "f_q2", "f_q3",
            "int_same", "second_center_eq_q", "s_q0", "s_q1", "s_q2", "s_q3",
            "v0", "v1", "bounded_center_eq_q", "blocked_after_v", "shared_arm", "pair01",
        }
        add(("baseline booleans exact", all(bool(values[n]) == (n in expected_true) for n in BOOL_NAMES)))
        add(("baseline integers exact", all(values[n] == 0 for n in INT_NAMES)))

    failures = [label for label, ok in checks if not ok]
    if failures:
        raise AssertionError("model contract failures: " + ", ".join(failures))
    return [label for label, _ in checks]


def status(log: Path) -> str:
    return next((line.strip() for line in log.read_text(encoding="utf-8").splitlines() if line.strip()), "")


def main() -> int:
    artifacts = sorted(ARTIFACTS.glob("*.smt2"))
    if len(artifacts) != 5:
        raise AssertionError(f"expected 5 artifacts, found {len(artifacts)}")
    recorded_results = json.loads((ROOT / "results.json").read_text(encoding="utf-8"))
    recorded_hashes = json.loads((ROOT / "SHA256SUMS.json").read_text(encoding="utf-8"))
    control_requirements = {
        "control_empty_v_unsat.smt2": [
            ":named v_nonempty", ":named malformed_empty_v",
            "(and (not v0) (not v1) (not v2) (not v3))",
        ],
        "control_core_overlap_unsat.smt2": [
            ":named core_0_1_visible_disjoint", ":named malformed_force_core",
            ":named malformed_force_v0", ":named malformed_force_v1",
            ":named malformed_core0_has_q0", ":named malformed_core1_has_q0",
        ],
        "control_sameblocker_omission_unsat.smt2": [
            ":named first_same_support", ":named malformed_force_first_same",
            ":named malformed_omit_from_equal_support",
        ],
    }
    report: dict[str, object] = {"artifacts": {}, "independent_control_reasons": {
        "control_empty_v_unsat.smt2": "V is asserted nonempty but all four membership bits are false",
        "control_core_overlap_unsat.smt2": "active core shells 0 and 1 both contain q0, contradicting projected pairwise disjointness",
        "control_sameblocker_omission_unsat.smt2": "same-blocker support equality includes q0 while the malformed fixture excludes q0",
    }}
    for artifact in artifacts:
        source = artifact.read_text(encoding="utf-8")
        actual_hash = hashlib.sha256(artifact.read_bytes()).hexdigest()
        if recorded_hashes.get(artifact.name) != actual_hash:
            raise AssertionError(f"{artifact.name}: SHA-256 differs from runner manifest")
        count = source.count("(check-sat)")
        if count != 1:
            raise AssertionError(f"{artifact.name}: expected one check-sat, found {count}")
        expected = "sat" if artifact.name in {"known_sat_baseline.smt2", "main_named_rows_avoid_overlap3.smt2"} else "unsat"
        if expected == "sat" and source.count("(get-value") != 1:
            raise AssertionError(f"{artifact.name}: expected one exact get-value")
        if expected == "unsat" and "(get-value" in source:
            raise AssertionError(f"{artifact.name}: malformed control must not request a model")
        for required in control_requirements.get(artifact.name, []):
            if required not in source:
                raise AssertionError(f"{artifact.name}: missing independently required clause {required!r}")
        entry: dict[str, object] = {"check_sat_count": count, "expected": expected, "sha256": actual_hash}
        for solver in ("z3", "cvc5"):
            log = LOGS / f"{artifact.stem}.{solver}.stdout"
            actual = status(log)
            if actual != expected:
                raise AssertionError(f"{artifact.name}/{solver}: expected {expected}, got {actual!r}")
            metadata = recorded_results["artifacts"][artifact.name][solver]
            if metadata["status"] != actual or metadata["exit_code"] != 0:
                raise AssertionError(f"{artifact.name}/{solver}: bad runner metadata {metadata!r}")
            stderr = (LOGS / f"{artifact.stem}.{solver}.stderr").read_text(encoding="utf-8")
            if stderr:
                raise AssertionError(f"{artifact.name}/{solver}: nonempty stderr")
            solver_entry: dict[str, object] = {"status": actual}
            if expected == "sat":
                values = parse_values(log.read_text(encoding="utf-8"))
                checked = validate_model(values, baseline=artifact.name == "known_sat_baseline.smt2")
                solver_entry["readback_variables"] = len(values)
                solver_entry["contract_checks"] = len(checked)
            entry[solver] = solver_entry
        report["artifacts"][artifact.name] = entry
    report["summary"] = {
        "artifacts": len(artifacts),
        "solver_runs": len(artifacts) * 2,
        "sat_readbacks_validated": 4,
        "malformed_unsat_controls": 3,
        "hashes_validated": len(artifacts),
        "zero_exit_empty_stderr_runs": len(artifacts) * 2,
        "all_passed": True,
    }
    rendered = json.dumps(report, indent=2, sort_keys=True) + "\n"
    (ROOT / "validation.json").write_text(rendered, encoding="utf-8")
    (ROOT / "validation.log").write_text("PASS independent exact readback and controls\n", encoding="utf-8")
    print(json.dumps(report["summary"], indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
