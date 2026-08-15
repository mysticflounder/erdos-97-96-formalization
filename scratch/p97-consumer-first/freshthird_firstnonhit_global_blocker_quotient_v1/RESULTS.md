# Result

Final status: **SAT obstruction (discovery quotient); no new producer**.

One wave was run with three explicit ingress cases.  Z3 4.17.0 and cvc5
1.3.3 independently returned SAT for `retained`, `common`, and the materially
new `common_sameblocker` refinement.  Exact solver readbacks passed the
independent semantic validator.  Both solvers returned UNSAT on the explicit
contradiction control and rejected the malformed SMT-LIB control.

## Minimized survivor

`SURVIVOR.json` records the smallest useful semantic survivor.  Choose the
common-radius ingress with both named source constructors `sameBlocker`.
The Q blocker fiber has the explicit card-four premise and its image is exactly
Q support.  All four Q-support sources have actual blocker `qCenter`; hence all
four canonical selected rows are the Q row, the deletion fan reports
`qCenter` nonrobust, and the repeated-cap pair exits through actual-blocker
collision.  Independently, the retained packet uses a mixed location arm and
mutual cross-row omissions but has zero Q incidence.  The common helper emits
four pairwise-distinct, off-Q strict-cap sources with blocker centers distinct
from `qCenter`; each of their actual selected rows may have zero Q overlap.
No source vertex cap membership is transferred to a blocker center.

Thus every named distinct-center actual selected row has Q-overlap at most two.
The new cap/deletion-fan clauses are all active, but none yields three Q-row
incidences at one distinct actual blocker center.

## Exact missing source clause

The model suggests the missing producer must say, under the live FirstNonHit
antecedents, that there is an **actual carrier source** `s` with
`H.centerAt s != qCenter` and three distinct points of Q support whose
deletions are blocked/survive at that same actual selected-row center, enough
to prove all three points belong to `selectedAt(s).support`.  Equivalently, a
source-clean relocation theorem must turn either the retained mutual-deletion
packet, the repeated-cap noncollision arms, or the four common off-shell
sources into three Q incidences at one named actual blocker.  A theorem about
an anonymous minimal-deletion center, cap membership alone, or a finite carrier
ceiling would not lift.

SAT is not a Euclidean/P97 counterexample.  It establishes only that the named
source-proved quotient remains consistent with the negated target.  There is
therefore no Lean promotion or cardinality-independent closure contract.
