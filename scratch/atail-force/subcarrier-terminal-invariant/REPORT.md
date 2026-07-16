# R-branch terminal-subcarrier invariant audit

Date: 2026-07-15

Status: **kernel-checked scratch result; no production file changed**.

## Result

The R branch now has a constructive descent theorem which retains the erased
pair history on the ambient carrier instead of forgetting it at the terminal
subcarrier.

`SubcarrierTerminalInvariant.lean` proves:

- `exists_firstApex_terminal_subcarrier_with_robust_history`: recursive
  first-apex descent terminates and retains, for every erased point, a distinct
  off-surplus co-radial mate whose simultaneous deletion preserves K4 at both
  opposite apices on `D.A`;
- `exists_terminal_with_nonempty_robust_history_of_frontier`: on the robust
  frontier branch, the original frontier point is certified erased, so the
  ambient history is nonempty;
- `exists_ambientRobustHistoryPair_of_erased`: any named erased point yields
  an `AmbientRobustHistoryPair`; the cap cover plus
  `oppApex1_otherCap_one_hit` puts at least one endpoint in strict `oppCap1`;
- `exists_terminal_and_ambientRobustHistoryPair_of_frontier`: the direct
  R-branch export combines the terminal carrier, full ambient history, and an
  ambient robust pair.  It requires no comparison between the pair radius and
  the terminal radius;
- `AmbientRobustHistoryPair.false_of_sourceBlocker_surplus_cross`: the stable
  ordered-cap sink survives re-adding all erased history.

The last theorem's extra premises are exact.  For source `P.x`, it requires:

1. `H.centerAt P.x (mem_selectedClass.mp P.x_mem_class).1` lies in
   `S.surplusCap`; and
2. `P.y` lies in the exact selected critical support sourced at `P.x`.

With those two facts, the source blocker and `S.oppApex1` are distinct centers
of the ordered surplus cap and are both equidistant from the same distinct
outside-cap pair `P.x, P.y`; `outsidePair_unique_capCenter` gives `False`.

The checked complement is also exported:

```text
source blocker outside surplus
  OR
mate omitted from the source selected support
```

The second arm is checked equivalent, through
`cross_deletion_survives_iff_not_mem_selected_support`, to K4 surviving after
deleting the mate at the source blocker.

## Exact remaining transition

The next producer must rule out both complement arms for one oriented ambient
history pair: place its source blocker in the surplus cap and put its mate in
the source's selected support.  The constructive descent and the ordered-cap
consumer do not produce either fact themselves.

The theorem-bank and indexed-corpus preflight found the ordered-cap consumer,
one-hit/cover classifiers, and deletion/support equivalence, but no theorem
which supplies that combined blocker-placement plus cross-incidence producer.

## Finite regression boundary

`FiniteRobustHistoryBoundary.lean` is a kernel-checked finite
radius-class/incidence abstraction, not a Euclidean counterexample.  It
retains:

- the `(5,5,5)` cap profile;
- a distinct off-surplus pair in strict `oppCap1`;
- an ambient first-apex four-class containing the pair;
- a different first-apex four-class surviving both erasures;
- a second-apex four-class surviving both erasures;
- terminal uniqueness in the displayed two-radius carrier abstraction; and
- the saved total source-indexed critical-row interface.

Nevertheless both history blockers lie outside the surplus cap, both directed
cross hits fail, and no second recorded center contains the whole pair.  Thus
the missing transition is not a consequence of the retained finite
history/CSS/cardinality interface alone; a genuinely geometric or stronger
incidence producer is required.

## Validation

Both owned files were checked with Lean 4.27.0 using an 8192 MB cap.  The
scratch dependency `DoubleSurvivorConsumer.lean` was compiled to a temporary
olean under `/tmp`; no production build artifact was written.

```text
FiniteRobustHistoryBoundary.lean                 PASS
DoubleSurvivorConsumer.lean temporary dependency PASS
SubcarrierTerminalInvariant.lean                 PASS
```

All printed theorem endpoints depend only on the standard axioms reported by
Mathlib (`propext`, `Classical.choice`, `Quot.sound`).  No `sorryAx` appears.
The host emitted its usual non-fatal `Not privileged to set domain
environment` message.
