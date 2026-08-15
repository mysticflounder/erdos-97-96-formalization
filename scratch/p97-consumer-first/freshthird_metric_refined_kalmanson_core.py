#!/usr/bin/env python3
"""Bounded tracked Kalmanson core for the corrected source-valid model."""
import sys
from time import monotonic
from pathlib import Path
from z3 import Bool, SolverFor, sat, unsat
HERE=Path(__file__).resolve().parent;sys.path.insert(0,str(HERE))
from freshthird_full_fidelity_cegar import ORDER_ARMS,STRUCTURAL_TIMEOUT_MS,add_full_fidelity_constraints,build_pure_arm
from freshthird_metric_core import tracked_metric

def main():
 s,_,c=build_pure_arm(ORDER_ARMS['outside_fresh_between_source_canonical'],STRUCTURAL_TIMEOUT_MS)
 add_full_fidelity_constraints(s,c,1,1,enforce_equal_shell_slots_in_row=True); assert s.check()==sat
 r=tracked_metric(s.model(),c,solve_core=False); records=r['records']
 base=[x for x in records if x[1] != 'kalmanson']; kal=[x for x in records if x[1]=='kalmanson']
 q=SolverFor('QF_LRA'); q.set(timeout=120000); q.add(*[x[3] for x in base])
 for label,_fam,_det,expr in kal: q.assert_and_track(expr,Bool('track_'+label))
 started=monotonic(); result=q.check(); raw=[str(x).removeprefix('track_') for x in q.unsat_core()] if result==unsat else []; raw_seconds=monotonic()-started
 by={x[0]:(x[1],x[2],x[3]) for x in kal}; shrunk=list(raw); statuses=[]
 for label in list(raw):
  cand=[x for x in shrunk if x!=label]; p=SolverFor('QF_LRA');p.set(timeout=10000);p.add(*[x[3] for x in base]);p.add(*[by[x][2] for x in cand]); t=p.check();statuses.append((label,str(t)))
  if t==unsat: shrunk=cand
 lines=['campaign=freshthird_metric_refined_kalmanson_core_v1','configuration=outside_fresh_between_source_canonical fresh_cap=1 row_cap=1 first_source_valid_model','base=all exact metric assertions except Kalmanson inequalities are untracked; Kalmanson assertions tracked','metric_result='+str(result),f'raw_core_runtime_seconds={raw_seconds:.3f}',f'kalmanson_total={len(kal)}',f'raw_core_size={len(raw)}']
 for x in raw: lines.append(f'raw_core={x} family={by[x][0]} detail={by[x][1]}')
 lines.append(f'shrunk_core_size={len(shrunk)}')
 for x in shrunk: lines.append(f'shrunk_core={x} family={by[x][0]} detail={by[x][1]}')
 if raw:
  lines.append('core_premise_mapping=a08717_kalmanson: d(f1,w2)+d(w1,b2) < d(f1,w1)+d(w2,b2); source_producer=none (Euclidean Kalmanson consumer obligation); source_context=U1CarrierInjection.CriticalFourShell.support_card and SelectedFourClass.support_eq_radius provide exact-four/equal-radius premises only')
 lines.append('source_mapping=Kalmanson inequalities are Euclidean metric consumer obligations; source rows/shells provide finite exact-support/equal-radius premises but not Kalmanson ordering')
 lines.append('cardinality_status=core is fixed to this 25-representative tuple and is not cardinality-independent; Lean lift needs explicit ordered physical representatives')
 lines.append('source_gap=anonymous slot-to-physical-shell lift remains absent; no Lean closure')
 out=Path(__file__).with_suffix('.results.txt');out.write_text('\n'.join(lines)+'\n');print(f'wrote {out} raw_core={len(raw)} shrunk_core={len(shrunk)} result={result}')

if __name__=='__main__': main()
