#!/usr/bin/env python3
"""Finite, source-audited U3 mixed confined-packet census.

The universe is the eight distinct frame labels p,q,u,a0,a1,t1,t2,t3.
Rows are either q-deleted exact four-subsets or exact CriticalFourShells.
No metric/nonlinear constraints are invented here: shell exactness is recorded
as a membership/equality-closure annotation, while q-deleted rows deliberately
have no off-support disequalities.
"""
from __future__ import annotations

import itertools, json, pathlib, subprocess, sys

ROOT = pathlib.Path(__file__).resolve().parent
LABELS = ("p", "q", "u", "a0", "a1", "t1", "t2", "t3")
CENTERS = ("u", "a0", "a1", "t1", "t2", "t3")
CIRCLE = frozenset(("q", "t1", "t2", "t3"))
OFF = frozenset(LABELS) - CIRCLE

def candidates(mode: str, center: str):
    out = []
    for s0 in itertools.combinations(LABELS, 4):
        s = frozenset(s0)
        if center in s:
            continue  # source: B ⊆ A.erase center / center_not_mem_support
        if mode == "Q":
            if "q" in s:
                continue  # source: U5QDeletedK4Class.q_not_mem
            if len(s & CIRCLE) > 2 or len(s - CIRCLE) < 2:
                continue  # source: qDeletedRow_dangerousCircle_distribution
            closure = None  # intentionally no q-deleted off-support disequalities
        else:
            if "q" not in s:
                continue  # source: CriticalFourShell.q_mem_support
            if len(s & CIRCLE) > 2 or len(s - CIRCLE) < 2:
                continue  # source: criticalFourShell_dangerousCircle_distribution
            # Exact support_eq: every listed label is on radius iff it is in s.
            closure = {x: (x in s) for x in LABELS}
        out.append({"support": sorted(s, key=LABELS.index), "closure": closure})
    return out

DOMAINS = {(m, c): candidates(m, c) for m in "QS" for c in CENTERS}

def compatible(supports):
    for i, j in itertools.combinations(range(6), 2):
        if len(set(supports[i]) & set(supports[j])) > 2:
            return False
    return True

def enumerate_mode(modes, retain=2):
    domains = [DOMAINS[(modes[i], CENTERS[i])] for i in range(6)]
    count = 0
    models = []
    chosen = []
    def go(i):
        nonlocal count
        if i == 6:
            count += 1
            if len(models) < retain:
                models.append([dict(x) for x in chosen])
            return
        for row in domains[i]:
            if all(len(set(row["support"]) & set(prev["support"])) <= 2
                   for prev in chosen):
                chosen.append(row)
                go(i + 1)
                chosen.pop()
    go(0)
    return count, models

def smt_check(modes, engine):
    # Domain-disjunction encoding; pairwise overlap is a source-entitled cap.
    names = {(i, x): f"r{i}_{x}" for i in range(6) for x in LABELS}
    lines = ["(set-logic QF_LIA)"]
    for n in names.values(): lines.append(f"(declare-fun {n} () Bool)")
    for i, center in enumerate(CENTERS):
        alts = []
        for row in DOMAINS[(modes[i], center)]:
            lits = [f"{names[i, x]}" if x in row["support"] else f"(not {names[i, x]})" for x in LABELS]
            alts.append("(and " + " ".join(lits) + ")")
        lines.append("(assert (or " + " ".join(alts) + "))")
    for i, j in itertools.combinations(range(6), 2):
        terms = [f"(ite (and {names[i,x]} {names[j,x]}) 1 0)" for x in LABELS]
        lines.append("(assert (<= (+ " + " ".join(terms) + ") 2))")
    lines += ["(check-sat)", "(exit)"]
    smt = "\n".join(lines) + "\n"
    args = [engine, "-in"] if engine.endswith("/z3") else [engine, "--lang", "smt2"]
    p = subprocess.run(args, input=smt, text=True,
                       capture_output=True, timeout=30)
    return p.stdout.strip().splitlines()[-1] if p.stdout.strip() else "empty"

def main():
    if "--readback" in sys.argv:
        from readback import readback
        readback(ROOT / "results.json")
        return
    mode_rows = []
    for bits in itertools.product("QS", repeat=6):
        modes = "".join(bits)
        count, models = enumerate_mode(modes)
        mode_rows.append({"modes": modes, "models": count, "examples": models,
                          "z3": smt_check(modes, "/Users/adam/bin/z3"),
                          "cvc5": smt_check(modes, "/Users/adam/bin/cvc5")})
    result = {"labels": LABELS, "centers": CENTERS, "dangerous_circle": sorted(CIRCLE),
              "domains": {f"{m}{c}": len(DOMAINS[(m,c)]) for m in "QS" for c in CENTERS},
              "mode_rows": mode_rows,
              "totals": {"mode_assignments": 64,
                         "sat_assignments": sum(r["models"] > 0 for r in mode_rows),
                         "support_tuples": sum(r["models"] for r in mode_rows)}}
    (ROOT / "results.json").write_text(json.dumps(result, indent=2, sort_keys=True) + "\n")
    print(json.dumps(result["totals"], sort_keys=True))

if __name__ == "__main__":
    main()
