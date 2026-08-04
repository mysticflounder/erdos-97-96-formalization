#!/usr/bin/env python3
"""Consolidate the packet cores, exact witnesses, and exact-solver replays."""

from __future__ import annotations

import json
from fractions import Fraction
from pathlib import Path

import z3

from five_role_euclidean_qfnra_audit import (
    EuclideanProblem, parse_fraction, run_cvc5, validate_fraction_witness,
    witness_size,
)

PACKET=Path("scratch/five_role_extended_packet_results.json")
SEARCH=Path("scratch/five_role_euclidean_qfnra_rational_search_results.json")
OUT=Path("scratch/five_role_euclidean_qfnra_results.json")
REPORT=Path("scratch/five_role_euclidean_qfnra_report.md")
WDIR=Path("scratch/five_role_euclidean_qfnra_witness_instances")


def normalize(coords, next_role):
    q={r:(parse_fraction(v["x"]),parse_fraction(v["y"])) for r,v in coords.items()}
    a,b=q[next_role]; den=a*a+b*b; assert den>0
    out={}
    for r,(x,y) in q.items():
        out[r]={"x":str((a*x+b*y)/den),"y":str((-b*x+a*y)/den)}
    return out


def fixed_replay(branch,residual,order,coords,cap):
    p=EuclideanProblem(branch,residual,order,10000)
    s=z3.SolverFor("QF_NRA")
    s.add(*p.constraints.values())
    for r in order:
        s.add(p.x[r]==z3.RealVal(coords[r]["x"]),p.y[r]==z3.RealVal(coords[r]["y"]))
        s.add(p.cap[r] if cap[r] else z3.Not(p.cap[r]))
    zr=str(s.check()).upper()
    smt=s.to_smt2()+"\n(check-sat)\n"
    path=WDIR/f"{branch.replace('=','eq')}_{residual}_{order}_fixed_witness.smt2";path.write_text(smt)
    cr=run_cvc5(smt,10)
    return {"z3":zr,"cvc5":cr["status"],"cvc5_detail":cr,"instance":str(path)}


def main():
    packet=json.loads(PACKET.read_text()); search=json.loads(SEARCH.read_text())
    found={(r["branch"],r["order"]):r["result"] for r in search["rows"] if r["result"]["status"]=="SAT"}
    param={}
    for start in (0,4,8,12):
        for r in json.loads(Path(f"scratch/five_role_euclidean_qfnra_parametric_shard_{start}.json").read_text())["rows"]:
            param[(r["branch"],r["order"])]=r
    WDIR.mkdir(exist_ok=True); rows=[]
    for branch,bdata in packet["branches"].items():
        for source in bdata["rows"]:
            key=(branch,source["order"]); base={"branch":branch,"residual":source["residual"],"order":source["order"]}
            if source["baseline"]["status"]=="UNSAT":
                rows.append({**base,"classification":"UNSAT_KALMANSON_NECESSARY_CORE",
                    "solver_trust":"Z3 exact-rational QF_LRA core from source packet; not a proof certificate",
                    "core":source["baseline"]["core"],
                    "euclidean_bridge":"strictly convex Euclidean cyclic distances satisfy strict Kalmanson inequalities; homogeneous scaling realizes the packet gap normalization"})
            elif key in found:
                f=found[key]; coords=normalize(f["coordinates"],source["order"][1]);cap=f["cap"]
                ok,detail=validate_fraction_witness(branch,tuple(source["order"]),coords,cap)
                assert ok,detail
                replay=fixed_replay(branch,source["residual"],source["order"],coords,cap)
                assert replay["z3"]==replay["cvc5"]=="SAT",replay
                rows.append({**base,"classification":"SAT_EXACT_RATIONAL_NAMED_LOCAL",
                    "coordinates":coords,"cap":cap,"witness_size":witness_size(coords),
                    "independent_fraction_validation":"PASS","fixed_witness_exact_solver_replay":replay})
            else:
                attempt=param[key]
                rows.append({**base,"classification":"UNKNOWN",
                    "exact_parametric_qfnra":{"z3":attempt["z3"],"cvc5":attempt["cvc5"],"instance":attempt["instance"]},
                    "rational_search":"NOT_FOUND (not an UNSAT result)"})
    counts={k:sum(r["classification"]==k for r in rows) for k in
            ("SAT_EXACT_RATIONAL_NAMED_LOCAL","UNSAT_KALMANSON_NECESSARY_CORE","UNKNOWN")}
    sats=[r for r in rows if r["classification"].startswith("SAT_")]
    smallest=[]
    for branch,residual in sorted({(r["branch"],r["residual"]) for r in sats}):
        lane=min((r for r in sats if (r["branch"],r["residual"])==(branch,residual)),
                 key=lambda r:(r["witness_size"]["max_abs_numerator"],r["witness_size"]["max_denominator"],r["witness_size"]["sum_abs_numerators"]))
        smallest.append({k:lane[k] for k in ("branch","residual","order","coordinates","witness_size")})
    out={"diagnostic_only":True,"counts":counts,"total":len(rows),
         "normalization":"O=(0,0), next cyclic role=(1,0), obtained exactly by z -> conjugate(next)*z/|next|^2; this combines translation, orientation-preserving rotation, and positive scaling",
         "strict_convexity":"all 35 orientations i<j<k are strictly positive",
         "witness_ordering":"smallest returned witness per residual, lexicographically by max absolute numerator, max denominator, then sum of absolute numerators; no global minimality claim",
         "exact_solver_versions":{"z3":z3.get_version_string(),"cvc5":"1.3.3"},
         "smallest_witness_per_residual":smallest,"rows":rows,
         "omitted":["anonymous shell fillers","existential O-centered deletion rows and their overlap <=2 with exact Sigma_A/Sigma_B","physical cap/MEC geometry","full ambient carrier","global no-K4"]}
    OUT.write_text(json.dumps(out,indent=2)+"\n")
    lines=["# Five-role endpoint exact Euclidean QF_NRA audit","",
      "**Status: bounded local named-geometry diagnostic only. No Lean theorem and no full P97 realization is claimed.**","",
      "## Result","",
      f"All 120 source-faithful M/B insertions were audited: **{counts['SAT_EXACT_RATIONAL_NAMED_LOCAL']} SAT**, **{counts['UNSAT_KALMANSON_NECESSARY_CORE']} UNSAT by a necessary strict-Kalmanson core**, and **{counts['UNKNOWN']} UNKNOWN**.","",
      "Every SAT lane has rational planar coordinates, all 35 exact strict orientations, exact Fraction readback of every named metric/cap/cardinality/multiplicity constraint, and SAT replay of the fixed witness in both Z3 4.17.0 and cvc5 1.3.3. The SAT result is a constructive producer for the bounded named model only.","",
      "The UNSAT lanes inherit the source packet's exact-rational Z3 QF_LRA cores. They obstruct Euclidean realization because strict convex cyclic Euclidean distances satisfy the strict Kalmanson inequalities; finite homogeneity permits the packet's gap-1 normalization. These are solver-trusted cores, not independently checked proof certificates.","",
      "The UNKNOWN lanes survived the abstract packet, yielded no rational witness in the five-parameter open-cell search, and returned UNKNOWN under 60-second Z3 / 30-second cvc5 exact parametric QF_NRA runs. No infeasibility is inferred.","",
      "## Smallest returned witnesses","",
      "These are the smallest among the constructed witnesses under the JSON's stated coefficient-height ordering; no global minimality is claimed.","" ]
    for w in smallest: lines.append(f"- `{w['branch']}` / `{w['residual']}`: `{w['order']}`, size `{w['witness_size']}`, coordinates `{w['coordinates']}`")
    lines += ["","## Boundary","",
      "The model includes only named planar points and the source-recorded named equalities, exclusions, shell cardinalities, cap/Sigma-B coupling, and named pair/triple multiplicities. It does **not** encode the existential anonymous O-centered deletion rows or their overlap ≤2 with the now-identified exact Sigma_A/Sigma_B rows. Anonymous shell fillers, physical cap/MEC geometry, the full ambient carrier, and global no-K4 are also absent. Therefore SAT means local named geometry only.","",
      "P1/P2 are not assumed. Translation/rotation/scale are normalized soundly by fixing O=(0,0) and the next cyclic role=(1,0); rational witnesses use the exact similarity `z ↦ conjugate(next)·z/|next|²`.","",
      f"Machine-readable results: `{OUT}`. Fixed-witness SMT-LIB: `{WDIR}/`.",""]
    REPORT.write_text("\n".join(lines));print(json.dumps(counts))


if __name__=="__main__":main()
