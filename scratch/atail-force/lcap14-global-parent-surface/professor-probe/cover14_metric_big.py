#!/usr/bin/env python3
"""CEGAR screen: card-14 combinatorial witnesses vs strict-Kalmanson metric.

SAT side: full+frontier system from cover14.py.
Metric side (all PROVEN consequences of strict convex position, cyclic
order 0..13):
  d_uv > 0; strict triangle; for every cyclic 4-subset a<b<c<d:
    d_ac + d_bd > d_ab + d_cd  and  d_ac + d_bd > d_ad + d_bc;
  equalities  d_yu = d_yv for e-true, disequalities for e-false.
Blocking: z3 unsat core over named e-assertions -> block that sign pattern.
"""
import itertools, subprocess, sys, importlib.util

spec = importlib.util.spec_from_file_location("cover14",
    "/private/tmp/claude-1000/-Users-adam-projects-math-projects-erdos-97-96-formalization/d4fa82b5-5541-499b-a62a-7f77e86add50/scratchpad/cover14.py")
# import only the Enc/build machinery without running its __main__ runs:
src = open(spec.origin).read()
src = src.split("FULL = set(")[0]
mod = {}
exec(compile(src, "cover14_core", "exec"), mod)
build, solve_stub, N = mod["build"], mod["solve"], mod["N"]

def sat_solve(E, tag):
    path = f"/tmp/cover14m-{tag}.cnf"
    with open(path, "w") as fh:
        fh.write(f"p cnf {E.n} {len(E.clauses)}\n")
        for c in E.clauses:
            fh.write(" ".join(map(str, c)) + " 0\n")
    r = subprocess.run(["cadical", "-q", path], capture_output=True, text=True)
    if "s UNSATISFIABLE" in r.stdout:
        return None
    model = set()
    for line in r.stdout.splitlines():
        if line.startswith("v"):
            for tok in line.split()[1:]:
                v = int(tok)
                if v > 0: model.add(v)
    return model

def dvar(u, v):
    u, v = min(u,v), max(u,v)
    return f"d_{u}_{v}"

def emit_smt(epos, eneg, path):
    lines = ["(set-option :produce-unsat-cores true)", "(set-logic QF_LRA)"]
    for u, v in itertools.combinations(range(N), 2):
        lines.append(f"(declare-const {dvar(u,v)} Real)")
        lines.append(f"(assert (> {dvar(u,v)} 0))")
    for a, b, c in itertools.combinations(range(N), 3):
        lines.append(f"(assert (< {dvar(a,c)} (+ {dvar(a,b)} {dvar(b,c)})))")
        lines.append(f"(assert (< {dvar(a,b)} (+ {dvar(a,c)} {dvar(b,c)})))")
        lines.append(f"(assert (< {dvar(b,c)} (+ {dvar(a,b)} {dvar(a,c)})))")
    for a, b, c, d in itertools.combinations(range(N), 4):
        diag = f"(+ {dvar(a,c)} {dvar(b,d)})"
        lines.append(f"(assert (> {diag} (+ {dvar(a,b)} {dvar(c,d)})))")
        lines.append(f"(assert (> {diag} (+ {dvar(a,d)} {dvar(b,c)})))")
    named = {}
    for i, (y, u, v) in enumerate(sorted(epos)):
        nm = f"EP{i}"; named[nm] = ("+", y, u, v)
        lines.append(f"(assert (! (= {dvar(y,u)} {dvar(y,v)}) :named {nm}))")
    for i, (y, u, v) in enumerate(sorted(eneg)):
        nm = f"EN{i}"; named[nm] = ("-", y, u, v)
        lines.append(
            f"(assert (! (not (= {dvar(y,u)} {dvar(y,v)})) :named {nm}))")
    lines.append("(check-sat)")
    lines.append("(get-unsat-core)")
    with open(path, "w") as fh:
        fh.write("\n".join(lines) + "\n")
    return named

def main():
    corelog = open("/tmp/cover14-cores.txt", "w")
    opts = set("TARNHIOXF")
    E, V = build(opts)
    e = V["e"]
    blocked = 0
    for it in range(1, 1201):
        model = sat_solve(E, "loop")
        if model is None:
            print(f"[iter {it}] SAT side UNSAT after {blocked} blocking "
                  f"clauses: every card-14 combinatorial witness pattern "
                  f"generated so far is strict-Kalmanson-infeasible.")
            return
        epos = [k for k, var in e.items() if var in model]
        eneg = [k for k, var in e.items() if var not in model]
        smt = "/tmp/cover14m.smt2"
        named = emit_smt(epos, eneg, smt)
        r = subprocess.run(["z3", "-smt2", smt], capture_output=True,
                          text=True, timeout=600)
        out = r.stdout
        if out.startswith("sat"):
            print(f"[iter {it}] METRIC SURVIVOR: strict-Kalmanson-feasible "
                  f"witness found.")
            nrset = [y for y in range(N) if V["nr"][y] in model]
            print(f"  NR = {nrset}")
            for y in nrset:
                Ey = [x for x in range(N) if x != y and V["m"][(y,x)] in model]
                print(f"  E_{y} = {Ey}")
            Hmap = {x: y for x in range(N) for y in range(N)
                    if y != x and V["h"][(x,y)] in model}
            print(f"  H = {Hmap}")
            print(f"  |e-pos| = {len(epos)}")
            with open("/tmp/cover14-survivor-epos.txt", "w") as fh:
                for k in sorted(epos):
                    fh.write(f"{k}\n")
            return
        # unsat: extract core over named e-assertions, block
        corenames = []
        for line in out.splitlines():
            line = line.strip()
            if line.startswith("(") and ("EP" in line or "EN" in line):
                corenames = [t.strip("()") for t in line.split()
                             if t.strip("()") in named]
        lits = []
        for nm in corenames:
            sign, y, u, v = named[nm]
            var = e[(y, u, v)]
            lits.append(-var if sign == "+" else var)
        if not lits:
            print(f"[iter {it}] z3 UNSAT but empty e-core (geometry-only "
                  f"infeasibility?) -- aborting to avoid unsound block.")
            print(out[:500])
            return
        E.add(*lits)
        blocked += 1
        corelog.write(repr([named[nm] for nm in corenames]) + "\n"); corelog.flush(); print(f"[iter {it}] witness metric-UNSAT; core size {len(lits)}; "
              f"blocked.")
    print(f"[budget] 1200 iterations exhausted; {blocked} patterns blocked; "
          f"no metric survivor yet, SAT side not exhausted.")

main()
