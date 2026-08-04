#!/usr/bin/env python3
"""Exact five-variable QF_NRA replay for rational-search unresolved orders."""

from __future__ import annotations

import json
import argparse
import subprocess
import time
from itertools import combinations, product
from pathlib import Path

import z3

from five_role_euclidean_qfnra_audit import BRANCHES, at_most

SEARCH = Path("scratch/five_role_euclidean_qfnra_rational_search_results.json")
OUT = Path("scratch/five_role_euclidean_qfnra_parametric_exact_results.json")
DIR = Path("scratch/five_role_euclidean_qfnra_parametric_instances")


def circle(t): return ((1-t*t)/(1+t*t), 2*t/(1+t*t))
def add(a,b): return (a[0]+b[0],a[1]+b[1])
def sub(a,b): return (a[0]-b[0],a[1]-b[1])
def scale(c,a): return (c*a[0],c*a[1])
def perp(a): return (-a[1],a[0])
def rot(v,t):
    c,s=circle(t); return (c*v[0]-s*v[1],s*v[0]+c*v[1])


def coords(branch, p):
    zero=(z3.RealVal(0),z3.RealVal(0)); one=circle(z3.RealVal(0))
    if branch == "A=J":
        tc,tm,sk,lx,lb=p; O=zero; A=one; C=circle(tc); M=circle(tm)
        K=add(A,rot(sub(C,A),sk)); X=add(scale(z3.RealVal("1/2"),add(A,K)),scale(lx,perp(sub(K,A))))
        B=add(scale(z3.RealVal("1/2"),add(C,M)),scale(lb,perp(sub(M,C))))
        return {"O":O,"A":A,"C":C,"M":M,"K":K,"X":X,"B":B}
    tj,tm,sk,la,lb=p; O=zero; C=one; J=circle(tj); M=circle(tm)
    K=add(C,rot(sub(J,C),sk)); A=add(scale(z3.RealVal("1/2"),add(C,K)),scale(la,perp(sub(K,C))))
    B=add(scale(z3.RealVal("1/2"),add(C,M)),scale(lb,perp(sub(M,C))))
    return {"O":O,"C":C,"J":J,"M":M,"K":K,"A":A,"B":B}


def formula(branch, order):
    p=z3.Reals("p0 p1 p2 p3 p4"); q=coords(branch,p); cs={}
    d2=lambda a,b:(q[a][0]-q[b][0])**2+(q[a][1]-q[b][1])**2
    eq=lambda z,u,v:z3.BoolVal(False) if z in (u,v) else d2(z,u)==d2(z,v)
    for i,j,k in combinations(range(7),3):
        a,b,c=(order[i],order[j],order[k]); u=sub(q[b],q[a]); v=sub(q[c],q[a])
        cs[f"orient_{a}{b}{c}"]=u[0]*v[1]-u[1]*v[0]>0
    for z,u,v in BRANCHES[branch]["inequalities"]: cs[f"neq_{z}_{u}{v}"]=z3.Not(eq(z,u,v))
    for shell,(z,radius) in BRANCHES[branch]["shells"].items():
        cs[f"{shell}_named_card_le4"]=at_most([eq(z,radius,r) for r in order if r!=z],4)
    for u,v in combinations(sorted(order),2):
        cs[f"pair_center_le2_{u}{v}"]=at_most([eq(z,u,v) for z in order if z not in (u,v)],2)
    for u,v,w in combinations(sorted(order),3):
        cs[f"triple_center_le1_{u}{v}{w}"]=at_most([z3.And(eq(z,u,v),eq(z,u,w)) for z in order if z not in (u,v,w)],1)
    unknown=[r for r in order if r not in ("C","M","K","B","O")]; lanes=[]
    for bits in product((False,True),repeat=len(unknown)):
        cap={r:True for r in ("C","M","K","B")}; cap["O"]=False; cap.update(dict(zip(unknown,bits)))
        if sum(cap[order[i]] and not cap[order[(i+1)%7]] for i in range(7))>1: continue
        lanes.append(z3.And(*[z3.Not(eq("B","C",r)) for r in order if cap[r] and r not in ("C","M","B")]))
    cs["cap_and_SigmaB_exact"]=z3.Or(*lanes)
    return p,q,cs


def cvc5(smt,timeout):
    try:
        r=subprocess.run(["cvc5","--lang","smt2","--nl-cov","--force-logic=QF_NRA","--tlimit",str(timeout*1000)],input=smt,text=True,capture_output=True,timeout=timeout+20)
    except subprocess.TimeoutExpired:return {"status":"UNKNOWN","reason":"subprocess_timeout"}
    verdict="UNKNOWN"
    for line in r.stdout.splitlines():
        if line.strip() in ("sat","unsat","unknown"):verdict=line.strip().upper();break
    return {"status":verdict,"returncode":r.returncode,"stderr_tail":r.stderr.splitlines()[-3:]}


def main():
    ap=argparse.ArgumentParser();ap.add_argument("--start",type=int,default=0);ap.add_argument("--limit",type=int);ap.add_argument("--output",type=Path,default=OUT);args=ap.parse_args()
    unresolved=[r for r in json.loads(SEARCH.read_text())["rows"] if r["result"]["status"]!="SAT"]
    unresolved=unresolved[args.start:]
    if args.limit: unresolved=unresolved[:args.limit]
    DIR.mkdir(exist_ok=True); rows=[]
    for row in unresolved:
        p,q,cs=formula(row["branch"],row["order"]); s=z3.SolverFor("QF_NRA");s.set(timeout=60000);s.add(*cs.values())
        started=time.monotonic(); zr=s.check(); wall=time.monotonic()-started
        sm=z3.SolverFor("QF_NRA");sm.add(*cs.values());smt=sm.to_smt2()+"\n(check-sat)\n"
        path=DIR/f"{row['branch'].replace('=','eq')}_{row['residual']}_{row['order']}.smt2";path.write_text(smt)
        cr=cvc5(smt,30); z={"status":str(zr).upper(),"wall_seconds":wall,"reason":s.reason_unknown() if zr==z3.unknown else None}
        if zr==z3.sat:z["parameters"]=[str(s.model().eval(x,model_completion=True)) for x in p]
        rows.append({**{k:row[k] for k in ("branch","residual","order")},"z3":z,"cvc5":cr,"instance":str(path)})
        print(row["branch"],row["order"],z["status"],cr["status"],flush=True)
    out={"normalization":"O=(0,0), branch circle radius=1, A=(1,0) in A=J or C=(1,0) in X=C; rational circle chart omits one angle point but strict cells are open","rows":rows,
         "counts":{solver:{k:sum(r[solver]["status"]==k for r in rows) for k in ("SAT","UNSAT","UNKNOWN")} for solver in ("z3","cvc5")}}
    args.output.write_text(json.dumps(out,indent=2)+"\n");print(json.dumps(out["counts"]))


if __name__=="__main__":main()
