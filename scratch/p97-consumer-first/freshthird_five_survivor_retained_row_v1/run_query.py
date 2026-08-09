#!/usr/bin/env python3
"""One-wave retained-row weakening for the five-survivor boundary.

Only stdlib is used.  SMT2 is emitted locally, then replayed by z3 and cvc5.
"""
from __future__ import annotations
import hashlib, json, subprocess
from pathlib import Path

ROOT = Path(__file__).resolve().parent
N = 17
P = range(N)
roles = {
    "p1": 0, "p2": 1, "r1": 2, "r2": 3,
    "src": 4, "srcp": 5, "qsource": 6, "qother": 7,
    "apex1": 8, "apex2": 9, "surplus": 10,
    "center0": 11, "center1": 12, "center2": 13,
    "center3": 14, "center4": 15,
}
STRICT = {roles[x] for x in ("p1", "p2", "r1", "r2", "src", "srcp")}
FIRST_CAP = {roles[x] for x in ("p1", "p2", "r1", "r2", "src", "srcp", "apex1", "apex2")}

def v(prefix: str, i: int) -> str:
    return f"{prefix}_{i}"

def card(prefix: str, xs=P, k=4) -> str:
    terms = " ".join(f"(ite {v(prefix, i)} 1 0)" for i in xs)
    return f"(= (+ {terms}) {k})"

def all_of(xs) -> str:
    return "(and " + " ".join(xs) + ")"

def emit(arm: str, choice: str, control: str | None) -> str:
    d = roles[arm]
    chosen = "R" if choice == "radius" else "Rh"
    lines = ["(set-logic QF_LIA)"]
    for pref in ("R", "Rh", "B0", "B1", "B2", "B3", "B4", "SR", "SRp", "QShell"):
        for i in P:
            lines.append(f"(declare-fun {v(pref, i)} () Bool)")
    # Exact retained classes and exact five q-deleted rows.
    lines += [f"(assert {card('R')})", f"(assert {card('Rh')})"]
    for b in range(5):
        lines.append(f"(assert {card('B'+str(b))})")
        lines.append(f"(assert (not {v('B'+str(b), d)}))")
    # Retained class supports, disjointness, and aligned source omission.
    for x in (roles["p1"], roles["p2"]): lines.append(f"(assert {v('R', x)})")
    for x in (roles["r1"], roles["r2"]): lines.append(f"(assert {v('Rh', x)})")
    for x in (roles["src"], roles["srcp"]):
        lines += [f"(assert (not {v('R', x)}))", f"(assert (not {v('Rh', x)}))"]
    for i in P:
        lines.append(f"(assert (not (and {v('R', i)} {v('Rh', i)})))")
    # Both retained classes have the multi-point first-cap consequence.
    for pref in ("R", "Rh"):
        terms = " ".join(f"(ite {v(pref, i)} 1 0)" for i in STRICT)
        lines.append(f"(assert (>= (+ {terms}) 2))")
    # Fixed role labels only.  These tautologies do not model the live row
    # centers or assert the pairwise distinctness that the boundary omits.
    centers = [roles[f"center{i}"] for i in range(5)]
    for i, a in enumerate(centers):
        for b in centers[i+1:]: lines.append(f"(assert (not (= {a} {b})))")
    # Source rows: mutual cross-membership and collision-endpoint omission.
    for pref in ("SR", "SRp"):
        lines.append(f"(assert {card(pref)})")
        lines += [f"(assert {v(pref, roles['src'])})", f"(assert {v(pref, roles['srcp'])})"]
        for x in (roles["p1"], roles["p2"], roles["r1"], roles["r2"]):
            lines.append(f"(assert (not {v(pref, x)}))")
    # Exact shell row from outside_eq_pair plus selected shell/first-cap pair.
    qrow = {roles[x] for x in ("p1", "p2", arm, "qother" if arm == "qsource" else "qsource")}
    # The row is represented by a fixed Boolean identity, not as a q-deleted row.
    for i in P:
        lines.append(f"(assert (= {v('QShell', i)} {'true' if i in qrow else 'false'}))")
    # New producer: B2 is exactly one retained class, and deleted is absent.
    for i in P:
        lines.append(f"(assert (= {v('B2', i)} {v(chosen, i)}))")
    lines.append(f"(assert (not {v(chosen, d)}))")
    if control == "positive":
        lines.append(f"(assert {v(chosen, d)})")
    elif control == "non_exact":
        lines.append(f"(assert (= (+ {' '.join(f'(ite {v('B2', i)} 1 0)' for i in P)}) 3))")
    elif control == "neither":
        eq_r = "(and " + " ".join(f"(= {v('B2', i)} {v('R', i)})" for i in P) + ")"
        eq_rh = "(and " + " ".join(f"(= {v('B2', i)} {v('Rh', i)})" for i in P) + ")"
        lines.append(f"(assert (not {eq_r}))")
        lines.append(f"(assert (not {eq_rh}))")
    lines.append("(check-sat)")
    lines.append("(get-model)")
    return "\n".join(lines) + "\n"

def run_solver(binary: str, smt: str) -> tuple[str, str]:
    args = [binary]
    if binary.endswith("cvc5"):
        args += ["--lang", "smt2", "--tlimit", "20000"]
    else:
        args += ["-in", "-T:20"]
    p = subprocess.run(args, input=smt, text=True, capture_output=True, timeout=30)
    out = p.stdout + p.stderr
    first = next((x for x in out.splitlines() if x in {"sat", "unsat", "unknown"}), "error")
    return first, out

def main() -> None:
    rows = []
    matrix = [(a, c) for a in ("qsource", "qother") for c in ("radius", "rho")]
    cases = [(a, c, None) for a, c in matrix]
    cases += [(a, c, k) for a, c in matrix for k in ("positive", "non_exact", "neither")]
    for arm, choice, control in cases:
        name = f"{arm}_{choice}_{control or 'base'}"
        smt = emit(arm, choice, control)
        smt_path = ROOT / f"{name}.smt2"
        smt_path.write_text(smt)
        rec = {"name": name, "arm": arm, "choice": choice, "control": control,
               "sha256": hashlib.sha256(smt.encode()).hexdigest(), "N": N}
        for solver in ("/Users/adam/bin/z3", "/Users/adam/bin/cvc5"):
            status, out = run_solver(solver, smt)
            rec[Path(solver).name] = status
            (ROOT / f"{name}.{Path(solver).name}.log").write_text(out)
        rows.append(rec)
    (ROOT / "results.json").write_text(json.dumps(rows, indent=2) + "\n")
    print(f"wrote {len(rows)} cases to {ROOT/'results.json'}")
    for r in rows:
        print(r["name"], r["z3"], r["cvc5"])

if __name__ == "__main__":
    main()
