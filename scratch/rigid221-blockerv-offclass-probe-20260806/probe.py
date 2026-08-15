#!/usr/bin/env python3
"""Source-faithful finite incidence probe for the Rigid221 BlockerV leaf.

This is a necessary-consequence abstraction only: SAT is not a Euclidean
realization and UNSAT would require a separate replay certificate before
promotion to Lean.
"""
from __future__ import annotations
import json, sys
from itertools import combinations
from pathlib import Path
sys.path.insert(0, str(Path(__file__).resolve().parents[2]))
from census.card_head.candidate_surface import build_model
from census.card_head.sat_encoding import CoverInstance

N = 16
PROFILE = (5, 5, 9)  # (surplus, theorem opp2, theorem opp1)
PHYS = 2  # apex opposite the U,V endpoints of the O2 cap
# O2 interior for this profile; all named packet points are in this cap.
U, XU, VV, XV, DELETED, C, SPARE = 9, 10, 11, 12, 13, 14, 15
CLASS = frozenset((U, XU, VV, XV, DELETED))

def choices(I, center, pred):
    return [I.choice_variables[(center, k)] for k, row in enumerate(I.candidates[center]) if pred(set(row))]
def some(I, vs, label):
    if not vs: raise RuntimeError("empty allowed choices: " + label)
    I.cnf.add_clause(vs)
def one(I, vs):
    I.cnf.add_clause(vs); I.cnf.at_most_sinz(vs, 1)

def main():
    M = build_model(N, PROFILE)
    if tuple(M.interiors[2]) != tuple(range(9, 16)):
        raise RuntimeError(f"unexpected O2 labels: {M.interiors[2]}")
    I = CoverInstance(M)
    # The physical five-class is full; its selected four-subclass consumes one
    # of the two possible carrier centers for every class pair.
    some(I, choices(I, PHYS, lambda r: r <= CLASS), "physical apex subclass")
    for center in range(N):
        if center == PHYS: continue
        for k, row in enumerate(I.candidates[center]):
            if len(set(row) & CLASS) > 2:
                I.cnf.add_clause((-I.choice_variables[(center, k)],))
    for pair in combinations(sorted(CLASS), 2):
        p = set(pair); hits = []
        for center in range(N):
            if center != PHYS:
                hits += choices(I, center, lambda r, p=p: p <= r)
        I.cnf.at_most_sinz(hits, 1)

    # Full row traces from the packet.  `selectedAt q` is indexed by the
    # source q but its actual row center is `centerAt q`; therefore traces are
    # imposed below on the chosen center row, not on row q itself.
    traces = {
        U: {U, XU}, VV: {VV, XV},
        XV: {U, XV}, XU: {XU, DELETED},
        DELETED: {DELETED, VV}, C: None,  # None means at most one hit.
    }
    # One blocker center per source, source belongs to its blocker row.  Fixed
    # source identities are exactly those in the Lean residual: b(u)=xv,
    # b(xv)=v, b(v)=deleted, b(deleted)=c; b(xu) is unconstrained.
    block = {}
    for source in (U, XU, VV, XV, DELETED, C):
        vs = []
        for center in range(N):
            if center in (source, PHYS): continue
            z = I.cnf.new_variable(); block[(source, center)] = z; vs.append(z)
            rows = choices(I, center, lambda r, q=source: q in r)
            if not rows: I.cnf.add_clause((-z,))
            else: I.cnf.add_clause((-z, *rows))
        one(I, vs)
    for source, target in ((U, XV), (XV, VV), (VV, DELETED), (DELETED, C)):
        I.cnf.add_clause((block[(source, target)],))
    for source in (U, XU, VV, XV, DELETED, C):
        wanted = traces[source]
        for center in range(N):
            z = block.get((source, center))
            if z is None: continue
            for k, row in enumerate(I.candidates[center]):
                hit = set(row) & CLASS
                ok = len(hit) <= 1 if wanted is None else hit == wanted
                if source not in row or not ok:
                    I.cnf.add_clause((-z, -I.choice_variables[(center, k)]))

    cnf = Path(__file__).with_suffix('.cnf')
    cnf.write_text(f"p cnf {I.cnf.n_variables} {len(I.cnf.clauses)}\n" + "\n".join(" ".join(map(str,c))+" 0" for c in I.cnf.clauses) + "\n")
    import subprocess
    out = subprocess.run(["cadical", "-q", "-t", "120", str(cnf)], capture_output=True, text=True, timeout=150, check=False)
    log = Path(__file__).with_suffix('.solver.log'); log.write_text(out.stdout + out.stderr)
    status = "SAT" if out.returncode == 10 else "UNSAT" if out.returncode == 20 else f"ERR{out.returncode}"
    result = {"status": status, "cardinality": N, "profile": PROFILE, "variables": I.cnf.n_variables, "clauses": len(I.cnf.clauses), "roles": {"u":U,"xu":XU,"v":VV,"xv":XV,"deleted":DELETED,"c":C,"physical_apex":PHYS}, "scope": "necessary incidence constraints; no Euclidean realization or universal lift"}
    if status == "SAT":
        lits = {int(t): int(t) for line in out.stdout.splitlines() if line.startswith('v ') for t in line[2:].split() if int(t) != 0}
        pos = {x for x in lits.values() if x > 0}
        result["rows"] = {str(c): list(I.decode_model(pos)[c]) for c in range(N)}
        result["blockers"] = {str(s): next(c for c in range(N) if block.get((s,c)) in pos) for s in (U,XU,VV,XV,DELETED,C)}
    Path(__file__).with_suffix('.json').write_text(json.dumps(result, indent=2, sort_keys=True) + "\n")
    print(json.dumps(result, sort_keys=True))
    return 0 if status in ("SAT", "UNSAT") else 1
if __name__ == '__main__': raise SystemExit(main())
