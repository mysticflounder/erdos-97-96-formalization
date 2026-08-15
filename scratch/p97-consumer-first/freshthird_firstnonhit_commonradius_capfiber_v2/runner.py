#!/usr/bin/env python3
"""One bounded, source-mapped named-row diagnostic wave.

This is a finite identity/incidence shadow of the common-radius ``sameBlocker``
packet.  It deliberately does not encode the Lean carrier, boundary order,
metric inequalities, or hingress.  Every SMT file has exactly one check-sat.
"""

from __future__ import annotations

import hashlib
import json
import subprocess
from pathlib import Path

import z3

HERE = Path(__file__).resolve().parent
ART = HERE / "artifacts"
READ = HERE / "readback"
LOG = HERE / "logs"
N = 16
IDS = range(N)


def v(name: str) -> z3.IntNumRef | z3.ArithRef:
    return z3.Int(name)


def member(arr: dict[str, z3.BoolRef], x: z3.ArithRef) -> z3.BoolRef:
    return z3.Or(*[z3.And(x == i, arr[str(i)]) for i in IDS])


def row_card(row: dict[str, z3.BoolRef]) -> z3.ArithRef:
    return z3.Sum([z3.If(row[str(i)], 1, 0) for i in IDS])


def overlap(row: dict[str, z3.BoolRef], k: dict[str, z3.BoolRef]) -> z3.ArithRef:
    return z3.Sum([z3.If(z3.And(row[str(i)], k[str(i)]), 1, 0) for i in IDS])


def build(case: str) -> tuple[z3.Solver, dict[str, object]]:
    s = z3.SolverFor("QF_LIA")
    s.set(timeout=30_000, random_seed=971712)
    c0, c1, q0, q1, b = (v(x) for x in ("c0", "c1", "q0", "q1", "b"))
    ui = [v(f"u{i}") for i in range(4)]
    names = {"c0": c0, "c1": c1, "q0": q0, "q1": q1, "b": b}
    names.update({f"u{i}": ui[i] for i in range(4)})
    for x in names.values():
        s.add(0 <= x, x < N)
    k = {str(i): z3.Bool(f"K_{i}") for i in IDS}
    cap = {str(i): z3.Bool(f"Cap_{i}") for i in IDS}
    for arr in (k, cap):
        s.add(row_card(arr) >= 0)
    s.add(row_card(k) == 4)
    # Source packet: C sources and Q sources lie in K; C sources lie in the
    # canonical cap; K meets the closed cap in exactly {c0,c1}.
    s.add(c0 != c1, q0 != q1)
    for x in (c0, c1, q0, q1):
        s.add(member(k, x))
    for x in (c0, c1, b):
        s.add(member(cap, x))
    # No K∩Cap point may be different from c0,c1; c0,c1 are in both.
    for i in IDS:
        s.add(z3.Implies(z3.And(k[str(i)], cap[str(i)]), z3.Or(i == c0, i == c1)))
    # Four witnesses are distinct and in Cap\K.  No exhaustion assertion is
    # made: other carrier points may also be in Cap\K.
    s.add(z3.Distinct(*ui))
    for x in ui:
        s.add(member(cap, x), z3.Not(member(k, x)))
    # Common-radius class is represented only by exact equality of named
    # radius atoms; no Euclidean realization is claimed.
    radius = {x: v(f"radius_{x}") for x in ("c0", "c1")}
    s.add(radius["c0"] == radius["c1"], radius["c0"] > 0)

    # Alias-or-exact-named-shell five-way split.
    aliases = [c0 == q0, c0 == q1, c1 == q0, c1 == q1]
    exact_shell = z3.And(
        z3.Or(*[i == c0 for i in IDS]),  # tautological but keeps shell named
        z3.Or(*[i == c1 for i in IDS]),
        z3.Or(*[i == q0 for i in IDS]),
        z3.Or(*[i == q1 for i in IDS]),
        z3.And(*[z3.Implies(k[str(i)], z3.Or(i == c0, i == c1, i == q0, i == q1)) for i in IDS]),
        z3.And(*[z3.Implies(i == q0, z3.Not(cap[str(i)])) for i in IDS]),
        z3.And(*[z3.Implies(i == q1, z3.Not(cap[str(i)])) for i in IDS]),
    )
    s.add(z3.Or(*aliases, exact_shell))
    if case == "main_nonalias" or case == "regression_ui_notK_no_bfiber":
        s.add(z3.Not(z3.Or(*aliases)), exact_shell)
    elif case == "alias_c0_q0":
        s.add(c0 == q0)

    # Named selected rows: C0 and C1 have exact support K and blocker b.
    rows: dict[str, dict[str, z3.BoolRef]] = {}
    blockers: dict[str, z3.ArithRef] = {}
    for label, source, blocker in (("C0", c0, b), ("C1", c1, b), ("R0", ui[0], v("d0")), ("R1", ui[1], v("d1"))):
        row = {str(i): z3.Bool(f"row_{label}_{i}") for i in IDS}
        rows[label] = row
        blockers[label] = blocker
        s.add(row_card(row) == 4, member({str(i): row[str(i)] for i in IDS}, source))
    for i in IDS:
        s.add(rows["C0"][str(i)] == k[str(i)], rows["C1"][str(i)] == k[str(i)])
    s.add(v("d0") != b, v("d1") != b, v("d0") != v("d1"))
    # Source-faithful row rule: different blockers have row intersection ≤ 2;
    # equal blockers have identical supports.  The latter is explicit only for
    # C0/C1, the same-blocker arm.
    for i in IDS:
        s.add(rows["C0"][str(i)] == rows["C1"][str(i)])
    for left, right in (("C0", "R0"), ("C0", "R1"), ("C1", "R0"), ("C1", "R1"), ("R0", "R1")):
        s.add(z3.If(blockers[left] != blockers[right], overlap(rows[left], rows[right]) <= 2, z3.BoolVal(True)))
    # The diagnostic query: every named row whose blocker differs from b has
    # overlap at most two with K.  It is intentionally not universal over the
    # carrier and not a negation of the Lean target.
    for label in ("R0", "R1"):
        s.add(z3.Implies(blockers[label] != b, overlap(rows[label], k) <= 2))

    if case == "malformed_c0_eq_c1":
        s.add(c0 == c1)
    elif case == "malformed_duplicate_ui":
        s.add(ui[0] == ui[1])
    elif case == "malformed_third_intersection":
        t = v("third"); s.add(0 <= t, t < N, t != c0, t != c1, member(k, t), member(cap, t))
    elif case == "malformed_three_b_fiber":
        t = v("third"); s.add(0 <= t, t < N, t != c0, t != c1, member(cap, t), v("dt") == b)
        # Explicitly make t a third distinct cap source in b's fiber.
        s.add(z3.Not(z3.Or(t == c0, t == c1)))
    elif case == "allowed_two_b_fiber":
        s.add(v("d0") != b, v("d1") != b)
    elif case == "regression_ui_notK_no_bfiber":
        s.add(v("u0_blocker") != b)
    elif case not in {"main_nonalias", "alias_c0_q0"}:
        raise ValueError(case)
    # Universal cap-fiber bound: among named canonical-cap sources, at most two
    # distinct source IDs may carry blocker b. C0/C1 are the allowed pair.
    source_blockers = [(c0, b), (c1, b), (q0, v("q0_blocker")), (q1, v("q1_blocker"))]
    for i in IDS:
        for j in IDS:
            for l in IDS:
                if i < j < l:
                    xs = [source_blockers[i % 4], source_blockers[j % 4], source_blockers[l % 4]]
                    s.add(z3.Not(z3.And(*[member(cap, x) for x, _ in xs], *[blk == b for _, blk in xs], z3.Distinct(*[x for x, _ in xs]))))
    # The explicit malformed third source must be included in the fiber count.
    if case == "malformed_three_b_fiber":
        t = v("third")
        s.add(z3.Not(z3.And(member(cap, t), v("dt") == b, t != c0, t != c1)))
    extras = {name: v(name) for name in ("d0", "d1", "q0_blocker", "q1_blocker", "u0_blocker", "third", "dt")}
    meta = {"names": names, "extras": extras, "k": k, "cap": cap, "rows": rows, "blockers": blockers}
    return s, meta


def eval_int(model: z3.ModelRef, x: z3.ArithRef) -> int:
    return model.eval(x, model_completion=True).as_long()


def run_case(case: str) -> dict[str, object]:
    solver, meta = build(case)
    smt = ART / f"{case}.smt2"
    smt.write_text("(set-logic QF_LIA)\n" + solver.sexpr() + "\n(check-sat)\n", encoding="utf-8")
    z = solver.check()
    rec: dict[str, object] = {"case": case, "z3": str(z), "smt2": str(smt.relative_to(HERE))}
    if z == z3.sat:
        m = solver.model()
        vals = {name: eval_int(m, x) for name, x in meta["names"].items()}
        vals.update({name: eval_int(m, x) for name, x in meta["extras"].items()})
        vals.update({"K": [i for i in IDS if z3.is_true(m.eval(meta["k"][str(i)], model_completion=True))], "Cap": [i for i in IDS if z3.is_true(m.eval(meta["cap"][str(i)], model_completion=True))]})
        vals["rows"] = {label: [i for i in IDS if z3.is_true(m.eval(row[str(i)], model_completion=True))] for label, row in meta["rows"].items()}
        rec["model"] = vals
        (READ / f"{case}.json").write_text(json.dumps(rec, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    cp = subprocess.run(["cvc5", "--lang", "smt2", "--tlimit=30000", str(smt)], capture_output=True, text=True, timeout=40, check=False)
    rec["cvc5"] = (cp.stdout.strip() or f"exit={cp.returncode}; stderr={cp.stderr.strip()}").lower()
    return rec


def main() -> None:
    cases = ["main_nonalias", "alias_c0_q0", "allowed_two_b_fiber", "regression_ui_notK_no_bfiber", "malformed_c0_eq_c1", "malformed_duplicate_ui", "malformed_third_intersection", "malformed_three_b_fiber"]
    records = [run_case(c) for c in cases]
    out = HERE / "results.json"
    out.write_text(json.dumps(records, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    (LOG / "wave.log").write_text("\n".join(f"{r['case']}: z3={r['z3']} cvc5={r['cvc5']}" for r in records) + "\n", encoding="utf-8")
    print(json.dumps(records, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
