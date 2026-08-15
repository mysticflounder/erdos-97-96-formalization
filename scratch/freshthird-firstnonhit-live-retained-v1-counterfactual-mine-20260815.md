# FirstNonHit live-retained v1 counterfactual mine (2026-08-15)

## Scope and trust

This is a bounded conjecture-mining pass over the existing 24-cell
`freshthird_firstnonhit_live_retained_v1` abstraction.  For each cell, both
polarities of each synchronization predicate were checked in a fresh Z3
solver.  The packet explicitly sets source-entitlement, source-totality,
constructor-realization, theorem, universal, Lean, Euclidean-realizability,
and terminal-UNSAT claims to false.  Accordingly, the classifications below
are observations about this finite abstraction only.

All 24 base cells were already `SAT_ABSTRACTION`.  The counterfactual pass
made 240 polarity checks and completed after replacing the encoder's
quadratic provenance-key scan with an equivalent set-membership check.
The pre-change and post-change encoders emitted byte-identical solver
expressions and ordered provenance rows in all 24 cells; the canonical
differential hash was
`595742601e13afee65d6ef86d21ad0bd05cedbe0b0a2c8122efc53a370246a95`.

## Classification totals

| Predicate | Forced true | Forced false | Undetermined |
| --- | ---: | ---: | ---: |
| common P omission | 3 | 0 | 21 |
| common Pρ omission | 3 | 0 | 21 |
| retained centers equal | 3 | 6 | 15 |
| retained support overlap at least two | 9 | 0 | 15 |
| retained cross-center membership | 0 | 3 | 21 |

The counts are multiples of the three escape-row origins.  The forced cells
are explained by the local constructors already present in the packet:

- both `sameBlocker` constructors identify both retained supports with the Q
  support, forcing equal centers, common endpoint omissions, and overlap;
- first `sameBlocker` plus either positive second interaction identifies the
  first center with Q while the positive interaction separates the second
  center and includes both fresh endpoints, forcing center inequality and
  support overlap;
- the remaining constructor combinations admit both polarities.

## Theorem-mine verdict

None of the five predicates is a new carrier-wide producer.  Every forced
classification is a direct local consequence of an existing constructor,
while the cells in which synchronization would be genuinely new remain
two-sided SAT.  In particular, this wave does not produce the missing three
blocked Q deletions, a new three-point Q-row overlap, or a uniform retained
finite-payload impossibility theorem.

Stop pursuing these five predicates as the direct FirstNonHit bridge.  The
next search must add a source-entitled global clause—most plausibly a complete
deletion-core witness, a carrier-wide cap-order producer, or a bounded-core
lift—not another local synchronization atom over the same named rows.

The post-wave theorem-bank preflight at source revision `3fa09662` checked the
existing four- and six-point Kalmanson consumers, in particular
`false_of_two_selected_middle_rows_shared_endpoint_pair` and
`false_of_six_ccw_two_k2_three_selected_rows`.  Their immediate application
would require two distinct actual centers whose selected rows contain the
prescribed Q endpoints, plus the corresponding boundary order.  The live
NonHit and Interaction rows do not supply those antecedents: the equal-center
constructors identify a row with Q, and every distinct-center named row has
Q-overlap at most two.  Reusing either theorem is therefore blocked at the
same genuinely new third-row incidence, not by a missing adapter or import.

## New carrier-wide clauses

The post-wave contract audit did identify two source-entitled constraints that
were absent from the complete finite API.  They are now proved in
`FirstNonHitFiniteBlockerFiber.lean`:

1. every indexed preimage of the complete `blockerMap` has cardinality at most
   four, by an injective transport to `actualBlockerFiber_card_le_four`;
2. two indexed sources have equal blocker-map values if and only if their
   exact indexed selected rows are equal.

These are arbitrary-carrier theorems, not solver axioms or fixed-`n`
assumptions.  A successor source-total query should compile them directly.
They constrain the global blocker partition and propagate blocker equality to
all row incidences, but do not by themselves force three Q-row points into one
distinct blocker fiber, so this checkpoint still does not close either live
branch.

## Authenticated v4 survivor delta

The exact model readback from the independently audited v4 finite relaxation
(`problem.cnf` SHA-256
`387c98b39dc7c6cb81f350b7b506c730ec2a9574d0fde0a46b8ed18251008b2e`)
satisfies all 463,822 emitted clauses.  Replaying its complete assignment
against the two new blocker-fiber laws gives:

- maximum blocker-fiber cardinality `4`;
- `14` unordered equal-blocker source pairs and exactly the same `14`
  unordered equal-row pairs (equivalently `45` reflexive/ordered quotient
  pairs), with empty symmetric difference;
- every row has cardinality four.

Thus adding only those two generic laws would leave the recorded survivor
unchanged.  However, the same exact readback finds two source pairs with
distinct blocker-map values and three-point row overlap:

| Sources | Blockers | First row | Second row | Intersection |
| --- | --- | --- | --- | --- |
| `(7, 15)` | `(0, 2)` | `{7, 8, 15, 16}` | `{7, 8, 9, 15}` | `{7, 8, 15}` |
| `(8, 15)` | `(0, 2)` | `{7, 8, 15, 16}` | `{7, 8, 9, 15}` | `{7, 8, 15}` |

This is an exact countermodel to the *current emitted abstraction*, not an
Euclidean or universal source countermodel: the terminal receipt itself marks
`source_total` false and scopes the result to a sound exact-17 finite
relaxation.  The model pinpoints the first material successor clause.  Compile
the arbitrary-carrier theorem that distinct actual blockers have selected-row
intersection at most two (equivalently, three-point overlap forces blocker
equality), then replay v4.  That clause cuts the recorded survivor in two
placements, whereas a blocker-fiber-only successor cuts it in none.
