# Post-run theorem-bank audit

## Search performed

After the dual-SAT result, the repository Lean corpus was searched again for
cardinality-independent consequences of an exact four-point selected row,
actual-blocker fibers, and deletion-survival successors.  The search was run
after, rather than before, interpreting the two models so that the missing
clauses were fixed by the solver output.

## Strongest existing source-clean boundary

The current bank proves all of the following:

- `freshThird_qRow_member_sameBlocker_or_omissionSuccessor`: each carrier
  source in the Q support either has the Q blocker or supplies a surviving
  Q-support deletion at its own blocker;
- `freshThird_qRow_distinctBlocker_has_two_omissionSuccessors`: a source with a
  blocker distinct from Q omits at least two points of the Q support, and each
  omitted point survives deletion at that source's blocker;
- `actualBlockerFiber_card_le_four`: the Q blocker fiber has card at most four;
  and
- `actualBlockerFiber_image_eq_selectedSupport_of_card_eq_four`: if that fiber
  has card four, its carrier image is exactly the Q support.

Together these yield the exact four-point blocker boundary:

```text
the Q blocker fiber is saturated and maps onto the Q support
or
there is a Q-support source at a distinct blocker with at least two
deletion-survival successors in the Q support.
```

## Why this is not closure

The saturated arm is compatible with four carrier points on one circle sharing
one blocker.  In the distinct-blocker arm, two surviving deletions do not
produce the positive third Q-row incidence required by the clean two-circle
terminal, and the bank contains no strictly decreasing measure or collision
theorem for iterating these successors.

Therefore the SAT result does not license a second local wave.  The next new
source theorem must contradict the saturated fiber, turn the omission graph
into a terminating descent or forced collision, or directly produce a
distinct-center selected row with at least three Q-support points.  No theorem
found in the post-run search currently supplies any of those conclusions.

## Classification

This audit is a theorem-bank boundary analysis.  It is not a Lean closure, a
finite-to-universal lift, a P97 counterexample, or evidence that either SAT
assignment extends to a complete Euclidean `CounterexampleData` model.
