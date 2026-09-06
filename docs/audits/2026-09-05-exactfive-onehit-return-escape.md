# Exact-five one-hit return/escape audit

Date: 2026-09-05

Lane: `exactfive-onehit-return-escape-20260905`

Base commit: `328a9577c43956974ecf629b20dcd1e13acc6e3b`

## Status: rejected draft; no proof-spine reduction

The [independent correction record](../skeptic-exactfive-onehit-return-escape-2026-09-05.md)
supersedes the draft's earlier claim of strict source-level narrowing.
The orientation-specific return/escape statements have contradictory premises.
They must not be promoted as a solution or reduction of the physical residual.

## Historical reuse preflight

The project-indexed Lean corpus was searched once for the concrete candidate:
an anchor's selected four-point row either exhausts the image of its actual
blocker fiber, or contains a source whose actual blocker differs from the
anchor's blocker.  The index was at source revision `328a9577c`.

That bounded search found no declaration stating this dichotomy. The reusable inputs are
`ATailSurvivalCover.actualBlockerFiber`,
`actualBlockerFiber_image_subset_selectedSupport`, and
`actualBlockerFiber_image_eq_selectedSupport_of_card_eq_four` in
`SurvivalCover.lean`.  The new proof uses the subset theorem and the total
source choice supplied by `CriticalShellSystem`; it does not assume that every
row point chooses the row center.

The intended consumer was a post-one-hit no-return argument, not an installed
contradiction consumer. Commit `328a9577c` transports new-shell center equality
to the old shell, but this transport is unnecessary for the draft's premises:
`CriticalShellSystem.source_mem_selectedFourClass` applies directly to the
new shell and any old selected row on the unchanged carrier.

## Rejected formal bridge

The uncompiled, uncommitted `ExactFiveOneHitBlockerFiber.lean` draft contains:

- `mem_actualBlockerFiber_of_center_eq`, converting chosen-center equality to
  membership in the source-faithful blocker fiber;
- `actualBlockerFiber_image_eq_selectedSupport_or_exists_escape`, the exhaustive
  row-exhaustion/source-escape split; and
- orientation-specific `exists_oldSupport_escape_of_new_return` theorems for
  `QOmittedWHitReselection` and `WOmittedQHitReselection`.

For any total shell H', old selected row B centered at U, and source x,
H'.centerAt x = U forces x into B by the existing source-membership theorem.
The draft also assumes x outside B. Thus its return assumptions already
contradict one another, regardless of whether the old fiber exhausts B.
An actual return source may instead lie inside B while outside the current
three rows. The fiber dichotomy does not eliminate this possibility.

## Corrected candidate and first missing consumer

Pro consult `01M1TGPRMN7EKAW68WMTZH0GD2` completed (conversation #16233).
Its proposed replacement is a selectable fresh source avoiding an old row,
or a carrier-cardinality bound of 15. This is not a proposed `False` theorem.

The counting argument uses current four-point rows K0, K1, K2, an old
four-point row B, and a point w in K0, K1, and B. Their union has at most
14 points: K0 union K1 has at most seven, adding K2 gives at most eleven,
and adding B contributes at most three because w is already present.
Adding the deleted point gives at most 15. A carrier with at least 16
points therefore supplies a point outside that union. Source membership
then excludes U as its chosen blocker. This is a pen-and-paper candidate,
not a newly kernel-checked Lean result.

The physical leaf remains an admission at inspected revision
`b23ccb104fe23aa41af83929088332770a29e263`. Independent Luna consumer audit
#16241 confirms that the cardinality bound does not meet the existing
exact-twelve tight-cover consumer: that theorem needs cardinality exactly
12, exact eleven-point row cover, erase equality, and retained-source data.
In particular, the fork leaves cardinalities 13–15 unresolved.

Avoiding the previous blocker also does not exclude a longer return cycle
or give a strictly decreasing measure. After a shell/normal-form rebase,
the retained-source omission and deletion packet must be reconstructed;
merely replacing the fresh point within a fixed normal form does not lose
those inputs, but still supplies no contradiction. Under the active closure
plan and lean-usage consumer gate, do not add this fork as disconnected
production helpers. The next mathematical obligation is a genuine descent
or contradiction consumer, not another return/escape wrapper.

## Validation

- No compilation of the rejected draft was performed or claimed. A build
  slot is not the mathematical blocker.
- Literal marker scan: no `sorry` or `#print axioms` in the new module.
- The initial review checked orientation and dependent membership but missed
  vacuity. The subsequent Pro correction and independent Luna consumer audit
  supersede its assessment of mathematical usefulness.
- Independent claim-fidelity review of both corrected reports passed
  (Luna, conversation #16245). No Lean proof was certified by that review.
- Sparse worktree hygiene report: zero lane issues; repository-wide foreign
  dirty and untracked paths remain outside this lane.
