#!/usr/bin/env python3
"""Post-wave motif census and clause-family minimization for SSSSSS."""
from __future__ import annotations

import importlib.util
import itertools
import json
import pathlib
import subprocess

ROOT = pathlib.Path(__file__).resolve().parent
BASE_PATH = ROOT.parent / "enumerate_u3_packet.py"
spec = importlib.util.spec_from_file_location("u3_mixed_base_analysis", BASE_PATH)
assert spec is not None and spec.loader is not None
base = importlib.util.module_from_spec(spec)
spec.loader.exec_module(base)

LABELS = base.LABELS
CENTERS = base.CENTERS
CIRCLE = base.CIRCLE
OFF = base.OFF
GROUPS = ("center_omission", "q_membership", "circle_cap", "off_circle_floor",
          "pairwise_overlap", "shell_p_cut")


def motif_census() -> dict:
    counts: dict[tuple[int, int, int], int] = {}
    for bits in itertools.product("QS", repeat=6):
        modes = "".join(bits)
        domains = [base.DOMAINS[(modes[i], CENTERS[i])] for i in range(6)]
        chosen: list[dict] = []

        def go(i: int) -> None:
            if i == 6:
                shell_p = sum(modes[j] == "S" and "p" in chosen[j]["support"]
                              for j in range(6))
                if shell_p >= 3:
                    return
                q_p = sum(modes[j] == "Q" and "p" in chosen[j]["support"]
                          for j in range(6))
                key = (modes.count("S"), shell_p, q_p)
                counts[key] = counts.get(key, 0) + 1
                return
            for row in domains[i]:
                support = set(row["support"])
                if all(len(support & set(prior["support"])) <= 2 for prior in chosen):
                    chosen.append(row)
                    go(i + 1)
                    chosen.pop()

        go(0)
    return {
        "dimensions": ["shell_row_count", "shell_rows_containing_p",
                       "q_deleted_rows_containing_p"],
        "counts": [
            {"shell_row_count": key[0], "shell_rows_containing_p": key[1],
             "q_deleted_rows_containing_p": key[2], "models": value}
            for key, value in sorted(counts.items())
        ],
    }


def formula(enabled: frozenset[str]) -> str:
    names = {(i, x): f"r{i}_{x}" for i in range(6) for x in LABELS}
    lines = ["(set-logic QF_LIA)"]
    for name in names.values():
        lines.append(f"(declare-fun {name} () Bool)")
    for i, center in enumerate(CENTERS):
        cardinality = " ".join(f"(ite {names[i, x]} 1 0)" for x in LABELS)
        lines.append(f"(assert (= (+ {cardinality}) 4))")
        if "center_omission" in enabled:
            lines.append(f"(assert (not {names[i, center]}))")
        if "q_membership" in enabled:
            lines.append(f"(assert {names[i, 'q']})")
        if "circle_cap" in enabled:
            terms = " ".join(f"(ite {names[i, x]} 1 0)" for x in CIRCLE)
            lines.append(f"(assert (<= (+ {terms}) 2))")
        if "off_circle_floor" in enabled:
            terms = " ".join(f"(ite {names[i, x]} 1 0)" for x in OFF)
            lines.append(f"(assert (>= (+ {terms}) 2))")
    if "pairwise_overlap" in enabled:
        for i, j in itertools.combinations(range(6), 2):
            terms = " ".join(
                f"(ite (and {names[i, x]} {names[j, x]}) 1 0)" for x in LABELS)
            lines.append(f"(assert (<= (+ {terms}) 2))")
    if "shell_p_cut" in enabled:
        terms = " ".join(f"(ite {names[i, 'p']} 1 0)" for i in range(6))
        lines.append(f"(assert (<= (+ {terms}) 2))")
    lines.extend(("(check-sat)", "(exit)"))
    return "\n".join(lines) + "\n"


def solve(enabled: frozenset[str], engine: str) -> str:
    args = ([engine, "-in", "-T:30"] if engine.endswith("/z3") else
            [engine, "--lang", "smt2", "--tlimit", "30000"])
    proc = subprocess.run(args, input=formula(enabled), text=True,
                          capture_output=True, timeout=45)
    for line in proc.stdout.splitlines():
        if line.strip() in ("sat", "unsat", "unknown"):
            return line.strip()
    return "empty"


def minimize_groups() -> dict:
    verdicts = {}
    for size in range(len(GROUPS) + 1):
        for subset in itertools.combinations(GROUPS, size):
            key = frozenset(subset)
            verdicts[key] = solve(key, "/Users/adam/bin/z3")
    unsat = [key for key, verdict in verdicts.items() if verdict == "unsat"]
    minimal = [key for key in unsat if not any(other < key for other in unsat)]
    replays = []
    for key in minimal:
        replays.append({
            "groups": sorted(key, key=GROUPS.index),
            "z3": verdicts[key],
            "cvc5": solve(key, "/Users/adam/bin/cvc5"),
        })
    return {
        "always_enabled": ["six rows", "eight Boolean labels per row",
                           "each support has cardinality four", "all modes are S"],
        "optional_source_clause_families": list(GROUPS),
        "z3_subsets_checked": len(verdicts),
        "z3_unsat_subsets": len(unsat),
        "inclusion_minimal_unsat_families": replays,
    }


def main() -> None:
    result = {"motifs": motif_census(), "all_shell_minimization": minimize_groups()}
    (ROOT / "analysis.json").write_text(json.dumps(result, indent=2, sort_keys=True) + "\n")
    print(json.dumps({
        "motif_cells": len(result["motifs"]["counts"]),
        "minimal_unsat": result["all_shell_minimization"]["inclusion_minimal_unsat_families"],
    }, sort_keys=True))


if __name__ == "__main__":
    main()
