#!/usr/bin/env python3
"""Bounded tracked triangle core for the corrected source-valid model."""
import sys
from pathlib import Path
from z3 import Bool, SolverFor, sat, unsat
HERE=Path(__file__).resolve().parent
sys.path.insert(0,str(HERE))
from freshthird_full_fidelity_cegar import ORDER_ARMS,STRUCTURAL_TIMEOUT_MS,add_full_fidelity_constraints,build_pure_arm
from freshthird_metric_core import tracked_metric

def main():
 s,_,c=build_pure_arm(ORDER_ARMS['outside_fresh_between_source_canonical'],STRUCTURAL_TIMEOUT_MS)
 add_full_fidelity_constraints(s,c,1,1,enforce_equal_shell_slots_in_row=True)
 assert s.check()==sat
 r=tracked_metric(s.model(),c,solve_core=False)
 records=r['records']; base=[x for x in records if x[1] != 'triangle']; tri=[x for x in records if x[1]=='triangle']
 q=SolverFor('QF_LRA'); q.set(timeout=60000); q.add(*[x[3] for x in base])
 for label,_fam,_det,expr in tri: q.assert_and_track(expr,Bool('track_'+label))
 result=q.check(); raw=[str(x).removeprefix('track_') for x in q.unsat_core()] if result==unsat else []
 by={x[0]:(x[1],x[2],x[3]) for x in tri}; shrunk=list(raw); statuses=[]
 for label in list(raw):
  cand=[x for x in shrunk if x!=label]; p=SolverFor('QF_LRA'); p.set(timeout=10000); p.add(*[x[3] for x in base]); p.add(*[by[x][2] for x in cand]); t=p.check(); statuses.append((label,str(t))); 
  if t==unsat: shrunk=cand
 lines=['campaign=freshthird_metric_refined_triangle_core_v1','configuration=outside_fresh_between_source_canonical fresh_cap=1 row_cap=1 first_source_valid_model','base=all exact metric assertions except triangle inequalities are untracked; triangle assertions tracked','metric_result='+str(result),f'triangle_total={len(tri)}',f'raw_core_size={len(raw)}']
 for x in raw: lines.append(f'raw_core={x} family={by[x][0]} detail={by[x][1]}')
 lines.append(f'shrunk_core_size={len(shrunk)}')
 for x in shrunk: lines.append(f'shrunk_core={x} family={by[x][0]} detail={by[x][1]}')
 lines.append('source_mapping=triangle inequalities are Euclidean metric consumer obligations; source rows/shells provide only equal-radius and exact-support premises, not strict triangle itself')
 lines.append('cardinality_status=core depends on finite representative tuple and is not cardinality-independent; source lift would require selecting these physical points and applying Euclidean strict triangle')
 lines.append('source_gap=anonymous slot-to-physical-shell lift remains absent; no Lean closure')
 out=Path(__file__).with_suffix('.results.txt');out.write_text('\n'.join(lines)+'\n');print(f'wrote {out} raw_core={len(raw)} shrunk_core={len(shrunk)} result={result}')

if __name__=='__main__': main()
