# Exact-12 source-constraint CEGAR v4 run

Date: 2026-08-06

Status: **diagnostic `ITERATION_LIMIT`; not promotable and not closure**.

## Scope

This fresh v4 namespace replays the 10,000 inherited row-only clauses and adds
only two constraints backed by checked Lean source theorems:

1. 245 clauses encoding `K_xv ∩ secondCap = {u,xv}` under the frozen exact-12
   adapter; and
2. 535 conditional clauses encoding
   `|K_(centerAt c) ∩ {u,xu,xv}| ≤ 1`.

The Lean producers are checked, but the Python source-to-CNF adapter is not
kernel checked.  The run therefore remains theorem-mining evidence only.
Moreover, this namespace inherits the first SAT role placement selected by
`probe.py`, namely `deleted=0,v=2`; it is not an exhaustive run over the 42
ordered outside-interior placements.

## Validation

The smoke run completed one classified SAT iteration, the existing SAT/UNSAT
self-test passed (including DRAT verification), and an independent audit
confirmed the frozen-label and row-index mappings.  The resume counter was
then made invocation-relative; this accounting-only change does not alter the
CNF semantics or journal records.

## Constraint novelty

A separate negated-predicate probe against the inherited 10,000-clause bank
gave a useful split:

* the second-cap-pair violation is UNSAT, with a verified DRAT proof, so those
  245 clauses are already implied by the inherited row bank; and
* the next-row-triple violation is SAT, so the 535 conditional clauses are a
  genuine source-level strengthening of the inherited abstraction; and
* the checked two-off-center second-cap fan violation is UNSAT, again with a
  verified DRAT proof, so that existential fan conclusion is also already
  implied by the frozen base plus inherited bank and would add no refinement.

The exact witness and proof artifacts are under
`source-constraints-v4-novelty/`.

## Run result

After the 250-iteration pilot, a further 1,000 iterations in the same frozen
namespace ended at 39,733 variables and 327,953 clauses, with 11,250 total
learned clauses.  The 1,250 v4 records classified as:

* 1,107 duplicate-center equality contradictions;
* 1 equal-K4 contradiction;
* 27 equilateral-bisector collisions;
* 88 perpendicular-bisector/convexity contradictions;
* 20 three-triad collision contradictions; and
* 7 ordered-cap-cover contradictions.

All 1,250 source models passed the blocker-membership check.  Sixty-six had a
fiber of cardinality four, and the already-checked saturated-fiber support
theorem explains why all 66 exhausted their selected support; the other 1,184
models had maximum fiber size at most three.  Thus saturated-fiber existence
is not an invariant of the current abstraction.

This is not an exact-12 contradiction.  Another undirected extension of the
same detector loop is not the recommended next action: the remaining checked
fan conclusion is already redundant, while the promising saturated-fiber
route lacks a producer forcing such a fiber or a consuming cross-fan
collision.  Promotion of a future exact-12 UNSAT result would require a
checked Lean ingress/replay adapter.  It would close only the checked
exact-cardinality-12 branch; no claim is made about the separate `13 ≤ card`
siblings.

## Placement audit and rejected cross-fan shortcut

An exhaustive base-abstraction diagnostic subsequently tested all 42 ordered
placements of `deleted` and `v`.  Every placement was SAT.  Only the two
endpoint permutations put both roles on the second-cap endpoints; the other
40 SAT placements do not.  Hence the three-point overlap between the
second-cap fan and the physical-class fan visible in the frozen `d0-v2` model
is not a source-level invariant and cannot be promoted as the missing
cross-fan producer.  The exact table is
`all-placement-audit.json`; the generating script is
`audit_all_placements.py`.  This audit is diagnostic only and has no proof
artifacts.
