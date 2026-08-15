#!/usr/bin/env python3
"""One successor census with the source-proved dangerous-triple shell cut."""
from __future__ import annotations

import importlib.util
import itertools
import json
import pathlib
import subprocess

ROOT = pathlib.Path(__file__).resolve().parent
BASE_DIR = ROOT.parent
BASE_PATH = BASE_DIR / "enumerate_u3_packet.py"

spec = importlib.util.spec_from_file_location("u3_mixed_base", BASE_PATH)
assert spec is not None and spec.loader is not None
base = importlib.util.module_from_spec(spec)
spec.loader.exec_module(base)

LABELS = base.LABELS
CENTERS = base.CENTERS
DOMAINS = base.DOMAINS
def violates_new_cut(modes: str, supports: list[frozenset[str]]) -> bool:
    """The source theorem excludes any three distinct S rows all containing p."""
    return sum(modes[i] == "S" and "p" in supports[i] for i in range(6)) >= 3


def enumerate_mode(modes: str, retain: int = 3) -> tuple[int, int, list[list[dict]]]:
    domains = [DOMAINS[(modes[i], CENTERS[i])] for i in range(6)]
    base_count = 0
    survivor_count = 0
    examples: list[list[dict]] = []
    chosen: list[dict] = []

    def go(i: int) -> None:
        nonlocal base_count, survivor_count
        if i == 6:
            base_count += 1
            supports = [frozenset(row["support"]) for row in chosen]
            if violates_new_cut(modes, supports):
                return
            survivor_count += 1
            if len(examples) < retain:
                examples.append([dict(row) for row in chosen])
            return
        for row in domains[i]:
            support = set(row["support"])
            if all(len(support & set(prev["support"])) <= 2 for prev in chosen):
                chosen.append(row)
                go(i + 1)
                chosen.pop()

    go(0)
    return base_count, survivor_count, examples


def smt_check(modes: str, engine: str) -> str:
    names = {(i, x): f"r{i}_{x}" for i in range(6) for x in LABELS}
    lines = ["(set-logic QF_LIA)"]
    for name in names.values():
        lines.append(f"(declare-fun {name} () Bool)")
    for i, center in enumerate(CENTERS):
        alts = []
        for row in DOMAINS[(modes[i], center)]:
            lits = [names[i, x] if x in row["support"] else f"(not {names[i, x]})"
                    for x in LABELS]
            alts.append("(and " + " ".join(lits) + ")")
        lines.append("(assert (or " + " ".join(alts) + "))")
    for i, j in itertools.combinations(range(6), 2):
        terms = [f"(ite (and {names[i, x]} {names[j, x]}) 1 0)" for x in LABELS]
        lines.append("(assert (<= (+ " + " ".join(terms) + ") 2))")
    shell_indices = [i for i in range(6) if modes[i] == "S"]
    if len(shell_indices) >= 3:
        p_terms = [f"(ite {names[i, 'p']} 1 0)" for i in shell_indices]
        lines.append("(assert (<= (+ " + " ".join(p_terms) + ") 2))")
    lines.extend(("(check-sat)", "(exit)"))
    smt = "\n".join(lines) + "\n"
    args = ([engine, "-in", "-T:30"] if engine.endswith("/z3") else
            [engine, "--lang", "smt2", "--tlimit", "30000"])
    proc = subprocess.run(args, input=smt, text=True, capture_output=True, timeout=45)
    for line in proc.stdout.splitlines():
        verdict = line.strip()
        if verdict in ("sat", "unsat", "unknown"):
            return verdict
    return "empty"


def main() -> None:
    rows = []
    for bits in itertools.product("QS", repeat=6):
        modes = "".join(bits)
        before, after, examples = enumerate_mode(modes)
        rows.append({
            "modes": modes,
            "models_before_cut": before,
            "models_after_cut": after,
            "models_removed": before - after,
            "examples": examples,
            "z3": smt_check(modes, "/Users/adam/bin/z3"),
            "cvc5": smt_check(modes, "/Users/adam/bin/cvc5"),
        })

    before_total = sum(row["models_before_cut"] for row in rows)
    smoke = {
        "expected_uncut_total": 1_552_476,
        "actual_uncut_total": before_total,
        "expected_QQQQQQ": 468,
        "actual_QQQQQQ": next(row["models_before_cut"] for row in rows
                               if row["modes"] == "QQQQQQ"),
        "expected_SSSSSS": 216,
        "actual_SSSSSS": next(row["models_before_cut"] for row in rows
                               if row["modes"] == "SSSSSS"),
    }
    smoke["passed"] = all(smoke[k] == smoke[k.replace("actual", "expected")]
                          for k in ("actual_uncut_total", "actual_QQQQQQ", "actual_SSSSSS"))
    if not smoke["passed"]:
        raise SystemExit(f"base smoke test failed: {smoke}")

    result = {
        "scope": "finite eight-label mixed-row support abstraction",
        "new_cut": "at most two S-mode rows have supports containing p",
        "source_theorem": (
            "Problem97.U3ToU5MixedExtraction."
            "MixedSixRowPatternWithDangerousCircle.shell_p_at_most_two"
        ),
        "smoke_test": smoke,
        "mode_rows": rows,
        "totals": {
            "mode_assignments": len(rows),
            "sat_mode_assignments": sum(row["models_after_cut"] > 0 for row in rows),
            "support_tuples_before_cut": before_total,
            "support_tuples_after_cut": sum(row["models_after_cut"] for row in rows),
            "support_tuples_removed": sum(row["models_removed"] for row in rows),
            "affected_mode_assignments": sum(row["models_removed"] > 0 for row in rows),
            "z3_sat": sum(row["z3"] == "sat" for row in rows),
            "cvc5_sat": sum(row["cvc5"] == "sat" for row in rows),
        },
    }
    (ROOT / "results.json").write_text(json.dumps(result, indent=2, sort_keys=True) + "\n")
    print(json.dumps(result["totals"], sort_keys=True))


if __name__ == "__main__":
    main()
