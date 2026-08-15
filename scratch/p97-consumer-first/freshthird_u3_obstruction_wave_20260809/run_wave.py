#!/usr/bin/env python3
"""One bounded, source-faithful structural wave for the FreshThird U3 packet.

This is theorem discovery only.  It deliberately models finite incidence and
exact-cardinality consequences, not an unsupported Euclidean realization.
"""
from __future__ import annotations

import json
import subprocess
from pathlib import Path

import z3


ROOT = Path(__file__).resolve().parent
OUT = ROOT / "results.json"
SMT = ROOT / "smt2"
SMT.mkdir(exist_ok=True)


def names(branch: str):
    base = ["q", "p", "t0", "t1", "t2", "u", "a0", "a1"]
    centers = [f"c{i}" for i in range(6)]
    rows = [f"r{i}_{j}" for i in range(6) for j in range(4)]
    tail = [f"{branch}{j}" for j in range(4)]
    return base + centers + rows + tail


def mk_model(branch: str, xname: str, probe: str | None = None):
    pts = names(branch)
    rank = {n: z3.Int(f"rank_{n}") for n in pts}
    s = z3.Solver()

    def eq(a, b):
        return rank[a] == rank[b]

    def neq(a, b):
        return rank[a] != rank[b]

    def card_inter(left, right):
        return z3.Sum([z3.If(eq(a, b), 1, 0) for a in left for b in right])

    for v in rank.values():
        s.add(0 <= v, v < len(pts))

    # SixSurvivorExactRowsBoundary: q-deleted exact four rows, six distinct
    # row centers, and actual blocker p distinct from every row center.
    s.add(neq("q", "p"))
    s.add(z3.Distinct(*(rank[f"c{i}"] for i in range(6))))
    for i in range(6):
        s.add(neq("p", f"c{i}"))
        row = [f"r{i}_{j}" for j in range(4)]
        s.add(z3.Distinct(*(rank[v] for v in row)))
        for v in row:
            s.add(neq("q", v))
    # Exact two-circle intersection bound, source-level and conditional on
    # distinct centers.  No angular/metric assumptions are added.
    for i in range(6):
        for j in range(i):
            s.add(card_inter([f"r{i}_{k}" for k in range(4)],
                             [f"r{j}_{k}" for k in range(4)]) <= 2)

    # U3FixedTripleAuditFrame: a three-point dangerous p-radius class, and
    # the derived U5 candidate u outside that exact radius class.  The finite
    # universe here is the named packet only; this is not a universal lift.
    s.add(z3.Distinct(*(rank[f"t{i}"] for i in range(3))))
    for v in ["q", "p"]:
        for i in range(3):
            s.add(neq(v, f"t{i}"))
    s.add(z3.Distinct(rank["u"], rank["a0"], rank["a1"]))
    for v in ["u", "a0", "a1"]:
        for w in ["q", "p", "t0", "t1", "t2"]:
            s.add(neq(v, w))
    # finite exact-radius abstraction: a named packet point on p's dangerous
    # radius must be one of t0,t1,t2; t's are exactly on it, u/a0/a1 are off.
    onp = {v: z3.Bool(f"on_p_radius_{v}") for v in pts}
    for i in range(3):
        s.add(onp[f"t{i}"])
    for v in ["q", "p", "u", "a0", "a1"]:
        s.add(z3.Not(onp[v]))
    for v in pts:
        if v.startswith("t") or v in {"q", "p", "u", "a0", "a1"}:
            continue
        s.add(z3.Implies(onp[v], z3.Or(*(eq(v, f"t{i}") for i in range(3)))))

    # The audit center is one of T ∪ {u,a0,a1}; each run fixes one of the six
    # source-entitled alternatives, preserving the U3 disjunction.
    x = rank[xname]

    if branch == "escape":
        tail = [f"escape{j}" for j in range(4)]
        s.add(z3.Distinct(*(rank[v] for v in tail)))
        for v in tail:
            s.add(neq("q", v))
        # z := escape0 is outside the finite bounded support from the packet.
        for v in ["p", "q", "u", "a0", "a1", "t0", "t1", "t2"]:
            s.add(neq("escape0", v))
        # If audit center differs from a survivor-row center, exact four-circle
        # intersection bounds apply.  At equal centers, no unsupported identity
        # is assumed; canonical-row equality is tested as a probe below.
        for i in range(6):
            s.add(z3.Implies(x != rank[f"c{i}"],
                             card_inter(tail, [f"r{i}_{k}" for k in range(4)]) <= 2))
        props = {
            "strict_return_or_canonical_row": z3.Or(*[
                eq("escape0", f"r{i}_{j}") for i in range(6) for j in range(4)
            ]),
            "collision_with_six_survivor_rows": z3.Or(*[
                card_inter(tail, [f"r{i}_{k}" for k in range(4)]) >= 3
                for i in range(6)
            ]),
        }
        consumers = ["U5SelectedCandidateSkeleton", "strict return/canonical-row identity",
                     "collision with six survivor rows"]
    else:
        tail = [f"shell{j}" for j in range(4)]
        s.add(z3.Distinct(*(rank[v] for v in tail)))
        # CriticalFourShell.support contains deleted q.
        s.add(eq("shell0", "q"))
        props = {
            "two_dangerous_triple_hits": card_inter(tail, ["t0", "t1", "t2"]) >= 2,
            "three_hit_named_selected_row": z3.Or(*[
                card_inter(tail, [f"r{i}_{k}" for k in range(4)]) >= 3
                for i in range(6)
            ]),
        }
        consumers = ["CriticalFourShell", "two dangerous-triple hits",
                     ">=3 intersection with named selected row",
                     "ExactOffCircleCore (missing EdgeClosure producer)"]
        # Shell/row circle intersections are bounded only when centers differ.
        for i in range(6):
            s.add(z3.Implies(x != rank[f"c{i}"],
                             card_inter(tail, [f"r{i}_{k}" for k in range(4)]) <= 2))

    if probe is not None:
        s.add(z3.Not(props[probe]))
    return s, rank, props, consumers


def cvc5_status(path: Path) -> str:
    p = subprocess.run(["/Users/adam/bin/cvc5", "--lang=smt2", "--produce-models",
                        str(path)], capture_output=True, text=True, timeout=120)
    text = p.stdout + p.stderr
    if "unsat" in text:
        return "UNSAT"
    if "sat" in text:
        return "SAT"
    return "UNKNOWN"


def smoke_controls():
    """Small controls: a known SAT incidence fragment and a known UNSAT one."""
    sat = z3.Solver()
    cs = [z3.Int(f"smoke_c{i}") for i in range(6)]
    rs = [z3.Int(f"smoke_r{j}") for j in range(4)]
    sat.add(*(0 <= v for v in cs + rs), *(v < 20 for v in cs + rs), z3.Distinct(*cs), z3.Distinct(*rs))
    unsat = z3.Solver()
    unsat.add(sat.assertions())
    unsat.add(cs[0] == cs[1])
    out = []
    for name, solver, expected in [("known_sat", sat, "sat"), ("known_unsat", unsat, "unsat")]:
        path = SMT / f"smoke_{name}.smt2"
        path.write_text(solver.to_smt2())
        z = str(solver.check())
        c = cvc5_status(path)
        out.append({"name": name, "expected": expected, "z3": z, "cvc5": c,
                    "matched": z == expected and c.lower() == expected})
    return out


def validate(model, rank, branch: str):
    def rv(v):
        return model.eval(rank[v], model_completion=True).as_long()
    rows = [[rv(f"r{i}_{j}") for j in range(4)] for i in range(6)]
    tail = [rv(f"{branch}{j}") for j in range(4)]
    centers = [rv(f"c{i}") for i in range(6)]
    checks = {
        "blocker_differs_from_q": rv("p") != rv("q"),
        "six_centers_distinct": len(set(centers)) == 6,
        "blocker_differs_from_six_centers": all(rv("p") != c for c in centers),
        "dangerous_triple_card_three": len({rv("t0"), rv("t1"), rv("t2")}) == 3,
        "candidate_and_auxiliaries_outside_named_triple": all(
            rv(v) not in {rv("q"), rv("p"), rv("t0"), rv("t1"), rv("t2")}
            for v in ["u", "a0", "a1"]
        ),
        "six_row_cards_four": all(len(set(r)) == 4 for r in rows),
        "six_row_pairwise_intersection_le_two": all(
            len(set(rows[i]) & set(rows[j])) <= 2
            for i in range(6) for j in range(i)
        ),
        "tail_card_four": len(set(tail)) == 4,
    }
    if branch == "escape":
        checks["escape_z_outside_named_bounded_support"] = all(
            rv("escape0") != rv(v)
            for v in ["p", "q", "u", "a0", "a1", "t0", "t1", "t2"]
        )
    else:
        checks["shell_contains_q"] = rv("shell0") == rv("q")
    return checks


def main():
    smoke = smoke_controls()
    rows = []
    centers = ["t0", "t1", "t2", "u", "a0", "a1"]
    for branch in ["escape", "shell"]:
        for xname in centers:
            s, rank, props, consumers = mk_model(branch, xname)
            base = s.check()
            smt_path = SMT / f"{branch}_{xname}_base.smt2"
            smt_path.write_text(s.to_smt2())
            cv = cvc5_status(smt_path)
            rec = {"branch": branch, "audit_center": xname, "base_z3": str(base),
                   "base_cvc5": cv, "source_consumers": consumers}
            if base == z3.sat:
                m = s.model()
                rec["independent_validation"] = validate(m, rank, branch)
                rec["witness_ranks"] = {v: m.eval(rank[v], model_completion=True).as_long()
                                         for v in names(branch)}
                rec["probes"] = {}
                for pname in props:
                    sp, _, _, _ = mk_model(branch, xname, pname)
                    st = sp.check()
                    probe_path = SMT / f"{branch}_{xname}_not_{pname.replace(' ', '_')}.smt2"
                    probe_path.write_text(sp.to_smt2())
                    rec["probes"][pname] = {"not_property_z3": str(st),
                                               "not_property_cvc5": cvc5_status(probe_path),
                                               "forced_in_bounded_model": st == z3.unsat}
            rows.append(rec)
    OUT.write_text(json.dumps({"smoke_controls": smoke, "configurations": rows}, indent=2) + "\n")
    print(f"wrote {OUT} ({len(rows)} configurations)")
    print("smoke:", smoke)
    print("base statuses:", [(r["branch"], r["audit_center"], r["base_z3"], r["base_cvc5"]) for r in rows])
    print("forced probes:", [(r["branch"], r["audit_center"],
                               [k for k,v in r.get("probes", {}).items() if v["forced_in_bounded_model"]])
                              for r in rows])


if __name__ == "__main__":
    main()
