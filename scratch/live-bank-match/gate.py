#!/usr/bin/env python3
"""ENCODING VALIDATION GATE for the leaf extraction pipeline.

The 24 closed polarity branches of LIVE-T1 are ground truth: the snapshot
closes each with a specific in-file `hfalse_of_*` lemma. The gate demands
that the extracted packet for each closed branch re-derives that closure:

  hfalse_of_q_slot0_t1Row_l1  : q = f2.l1, t1 = t1row[0], f2.l1 = t1row[0]
                                ==> q ~ t1        (violates hfixed.q_ne_t1)
  hfalse_of_l1_t1_not_t1Row_l1: f2.l1 = t1, f2.l1 = t1row[0], t1 != t1row[0]
                                ==> t1 ~ t1row[0] (violates the polarity diseq)
  hfalse_of_l1_t2_t1Row_l1    : f2.l1 = t2, t1 = t1row[0], f2.l1 = t1row[0]
                                ==> t1 ~ t2       (violates hfixed.t1_ne_t2)
  hfalse_of_l1_t3_t1Row_l1    : likewise ==> t1 ~ t3

Gate conditions (ALL must hold):
  G1. every closed branch's closure contains a disequality violation;
  G2. the violated pair is exactly the pair the closing lemma derives;
  G3. every OPEN leaf's closure contains NO violation (consistency);
  G4. at every LIVE-Q/T1/T3 open leaf the f2-row members resolve to exactly
      {q,t1,t2,t3} (re-derives hselected_support_eq_base from the case atoms).
"""
import json
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).parent))
from leafmodel import UF, closure, violations, resolve_rows

BASE = Path("/Users/adam/projects/math-projects/erdos-97-96-formalization/scratch/live-bank-match")
data = json.loads((BASE / "leaf_packets.json").read_text())

EXPECTED_PAIR = {
    "hfalse_of_q_slot0_t1Row_l1": ("q", "t1"),
    "hfalse_of_l1_t1_not_t1Row_l1": ("t1", "t1row[0]"),
    "hfalse_of_l1_t2_t1Row_l1": ("t1", "t2"),
    "hfalse_of_l1_t3_t1Row_l1": ("t1", "t3"),
}

failures = []
g1 = g2 = g3 = g4 = 0

for leaf in data["leaves"]:
    uf = closure(leaf)
    viols = violations(leaf, uf)
    if leaf["status"] == "closed":
        # G1
        if not viols:
            failures.append(f"G1 {leaf['leaf_id']}: no violation found")
            continue
        g1 += 1
        # G2: expected pair must be among the violations
        exp = EXPECTED_PAIR[leaf["closed_by"]]
        uf2 = UF()
        hit = any(
            {uf.find(exp[0]), uf.find(exp[1])} == {uf.find(v["lhs"]), uf.find(v["rhs"])}
            or (uf.find(exp[0]) == uf.find(v["lhs"]) == uf.find(exp[1]))
            for v in viols)
        # simpler: the expected pair itself must be identified and be a diseq
        identified = uf.find(exp[0]) == uf.find(exp[1])
        is_diseq = any({v["lhs"], v["rhs"]} == set(exp)
                       or {uf.find(v["lhs"]), uf.find(v["rhs"])} ==
                          {uf.find(exp[0]), uf.find(exp[1])} for v in viols)
        if identified and is_diseq:
            g2 += 1
        else:
            failures.append(
                f"G2 {leaf['leaf_id']}: closed_by {leaf['closed_by']} expects "
                f"{exp} identified+violated; identified={identified}, "
                f"violations={[(v['lhs'], v['rhs']) for v in viols]}")
    else:
        # G3
        if viols:
            failures.append(
                f"G3 {leaf['leaf_id']} (:{leaf['line']}): unexpected violation "
                f"{[(v['lhs'], v['rhs']) for v in viols]}")
        else:
            g3 += 1
        # G4
        if leaf["family"] in ("LIVE-Q", "LIVE-T1", "LIVE-T3"):
            rows = resolve_rows(leaf, uf)
            f2row = next(r for r in rows if r["row"] == "f2row")
            want = {uf.find(x) for x in ("q", "t1", "t2", "t3")}
            if f2row["members"] == want and len(want) == 4:
                g4 += 1
            else:
                failures.append(
                    f"G4 {leaf['leaf_id']}: f2row members {sorted(f2row['members'])} "
                    f"!= base four {sorted(want)}")

n_closed = data["n_closed_gate"]
n_open = data["n_open"]
n_qt = sum(1 for l in data["leaves"]
           if l["status"] == "open" and l["family"] in ("LIVE-Q", "LIVE-T1", "LIVE-T3"))

report = {
    "G1_closed_branches_rederive_contradiction": f"{g1}/{n_closed}",
    "G2_contradiction_matches_closing_lemma": f"{g2}/{n_closed}",
    "G3_open_leaves_consistent": f"{g3}/{n_open}",
    "G4_f2row_support_rederived": f"{g4}/{n_qt}",
    "failures": failures,
    "verdict": "PASS" if (not failures and g1 == n_closed and g2 == n_closed
                          and g3 == n_open and g4 == n_qt) else "FAIL",
}
(BASE / "gate_result.json").write_text(json.dumps(report, indent=2))
print(json.dumps(report, indent=2))
sys.exit(0 if report["verdict"] == "PASS" else 1)
