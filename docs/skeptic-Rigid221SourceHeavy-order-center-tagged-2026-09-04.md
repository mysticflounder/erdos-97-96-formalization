# Math Skeptic Audit: Pentagon order and tagged center reductions

Target: `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/Rigid221SourceHeavy.lean`

Date: 2026-09-04

Verdict: three source-clean helper theorems proven; enclosing terminal remains open

## Claims audited

### A. Deleted-blocker strict-cap order adapter

Location: line 3626

Declaration:
`exactFourRigid221_sourceHeavy_pentagon_deleted_exists_forced_secondCap_order`

The theorem returns one strict-cap block and indices for `u`, deleted, `xv`,
and `xu`, with either the stated order or its reflection.  Its proof uses the
two row equidistance identities, strict-cap interior membership, distinctness
from the row exclusions, and the existing indexed betweenness lemma.  It does
not place `v` in the cap or assume an order for `v`.

### B. `xu`-center class reduction

Location: line 3806

Declaration:
`exactFourRigid221_sourceHeavy_pentagon_xu_center_class_reduction`

The theorem proves that a class-valued center at `xu` is `v` and that this
center is in the strict second-cap interior.  The `xu` and deleted row pair
first supplies the center localization.  The class alternatives `xu`,
deleted, and `xv` are removed by source or selected-support exclusions; the
remaining `u` alternative contradicts the A order adapter.

### C. Tagged off-class strict-cap row-center residual

Location: line 3992

Declaration:
`exactFourRigid221_sourceHeavy_pentagon_tagged_offClass_strictCap_row_center`

The conclusion is an explicit three-arm disjunction carrying, for each row,
the off-class center, strict second-cap membership, and the row's two-point
class trace.  The proof constructs the first row trace from the checked `xu`
row helper.  If that center is class-valued, B gives `cx = v`; the strict
order adapter then forces the deleted-row center off class.  Its interior
membership is obtained from the deleted--`v` physical pair, and its row trace
is obtained from the direct two-point row bound.  Thus the proof reaches the
first or second tagged arm; the third arm is retained in the public result
for downstream case consumers.

## Trust and marker checks

- Focused command: `lake env lean Erdos9796Proof/P97/ATail/FrontierLiveClosure/Rigid221SourceHeavy.lean`
- Result: exit code 0; only existing linter and open-obligation warnings remain.
- New-region marker scan (`sorry`, `admit`, `axiom`, native or unsafe escape
  markers): zero matches.
- Source-text `#print axioms` for all three declarations: only
  `[propext, Classical.choice, Quot.sound]`.

## Open boundary

The enclosing declaration at line 4313,
`false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonBlockerDeleted`,
still contains `sorry` at line 4385.  The new helpers are not presented as a
closure of that terminal and are not yet wired into a consumer proving
`False`.
