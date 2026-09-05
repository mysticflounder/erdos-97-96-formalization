# Exact-five profile 0034 physical assertion deletion: postrun audit

Date: 2026-09-04

## Result

The governed PIQD campaign
`exactfive-hard-source-swap-profile0034-physical-assertion-deletion-piqd-20260904/run-0002`
completed at its 160-target-query cap. The two controls behaved as specified:
the positive control was replayed SAT and the negative control carried valid
UNSAT custody. Of the 48 physical assertions supplied by the parent run, the
campaign removed 37 and retained 11.

The selected current-run result is a custody-valid UNSAT discovery result for
the physically reduced formula. The run stopped at `QUERY_CAP`, reports
`deletion_stable: false`, and singleton-tested only assertions 000, 001, and
003 in its final residue. The result is therefore not a minimality claim.

## Retained formula

Under the fixed role map `c000=U=c1`, `c001=O`, `c002=c2`, `c003=a`,
`c004=d`, `c005=p`, and `c007=s`, the retained assertions are:

| ID | Retained condition |
|---|---|
| 000 | `turn(U,p,s) > 0` |
| 001 | `turn(U,p,a) > 0` |
| 003 | `turn(U,p,c2) > 0` |
| 012 | `turn(p,s,a) > 0` |
| 024 | `turn(s,a,d) > 0` |
| 025 | `turn(a,d,c2) > 0` |
| 033 | `turn(U,d,c2) > 0` |
| 044 | `dist(O,a) = dist(O,d)` |
| 045 | `dist(O,a) = dist(O,p)` |
| 046 | `dist(U,O) = dist(U,s)` |
| 047 | `dist(c2,O) = dist(c2,a)` |

The selected result key is
`z3-r031-c321b8ebbbeb30c7-drop-263fda838a069986`; its result SHA-256 is
`1e046ac0ffb35d13b2021cde26164544a8416062e9efcf93b5d74e0aa2e99408`.
The terminal self-hash is
`08ebeb6c76dc839b15e56a933983e1899018fdb7a9db8e9df5b502ddbd4c829e`.
The compact machine-readable record is
`docs/computation/exactfive-profile0034-physical-assertion-deletion-20260904/run-0002-summary.json`.

## Verification

The producer's terminal replay rechecked the run manifest, launch record,
all 162 query trees, all round transitions, the controls, and the selected
UNSAT result, then exited zero in 7.1 seconds. An independent postrun audit
repeated the replay and returned PASS. The disposition totals are 28
`SAT_REPLAYED`, 113 `SAT_REPLAY_UNRESOLVED`, and 21
`UNSAT_CUSTODY_VALID`.

## Theorem mine

This wave produced one concrete theorem candidate: the seven retained turns
and four retained metric equations are inconsistent. A repository theorem-bank
search found the current profile-0034 boundary theorem as the only direct hit.
The nearest older candidate,
`u5_equilateral_bisector_metric_incompatibility`, requires a different set of
common-radius hypotheses and cannot serve this consumer.

The candidate has now been proved in
`Erdos9796Proof.P97.Census554.ExactFiveProfile0034CommonObstruction`.
Its scalar proof derives the two turns discarded by the campaign from the
retained circle, bisector, and turn data. This formalization does not change
the computation record's claims: the run itself still makes no theorem,
source-realization, live-ingress, promotion, or live-closure claim.

## Next boundary

The result is source-faithful only to the fixed profile cell. Production
closure still needs a source-backed adapter that selects the row points and
supplies the increasing boundary roles `c1,p,s,a,d,c2,O`, or a source case
split that reaches the same seven retained turns. The proved theorem uses
`c1` in its `U` slot and therefore does not require the diagnostic
blocker/surplus-apex alias.
