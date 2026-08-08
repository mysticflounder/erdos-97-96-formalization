# P97 exact-17 shared-late-pair cut

Date: 2026-08-08

## Checked consumer

The cap-nine source-faithful lane can use the kernel-clean theorem
`Problem97.CapCrossingKalmanson.false_of_two_selected_rows_shared_late_pair`.
For every increasing quadruple `a < b < c < d` in the one frozen boundary
order, it forbids the four simultaneous selected-row incidences
`a:{c,d}, b:{c,d}`.  This gives exactly `C(17,4) = 2,380` clauses.

Cyclic rotations are deliberately absent.  Using all `9,520` rotated clauses
would require a separate checked boundary-recut adapter, which has not been
proved for this exact-17 packet.

## Independent validation

The direct CNF candidate has 74,813 variables and 2,481,097 clauses.  Its
validator-v3 report is `PASS`: it regenerates every static family, checks three
source-Z3 model round trips, and checks 145,975 structural clauses with
CaDiCaL.  The candidate CNF SHA-256 is
`dd260e98aeb0791fba1f30b85b7854332b110ea478179059257c0a614939093b`.

During the audit a fail-closed validator defect was found and fixed.  The old
comparison cross-check enumerated only the 2,040 same-center edge comparisons,
whereas the exporter allocates all 9,180 unordered pairs of the 136 carrier
edges.  Before the fix the validator rejected the candidate; it never produced
a false `PASS`.

The admitted cut family has the following independent multiset digest:

- count: 2,380;
- xor: `e46003efb0512f28fdea4e2d0cff2570ceb306c66aa6d893ea4799771896e832`;
- sum: `cc37318298546b3925c04aed9f3a0b4c4e72f76f173957fba27f373cb0f41daa`;
- square sum:
  `ab44ac78e764e5b43fd5560e70c8ee521dd13e9a082223bab61eb72545fdf480`.

## Scope and measured yield

Across the historical scratch census, the motif occurs in 2,455 of 23,583
distinct row systems, about 10.4 percent.  It does not occur in the current
hardest cap-nine survivor.  It is therefore a reusable arithmetic-call
accelerator and a source-faithful static cut, not exact-17 coverage, a live
`sorry` closure, or evidence for full P97.

The source-frozen pre-cut CEGAR run must finish before this cut is integrated
into a fresh authenticated wave.  The exporter and validator wiring remain a
local scratch change until that dependency boundary can be checkpointed as one
coherent source bundle.
