# FreshThird source-complete v4 wave mine (2026-08-15)

## Scope and trust status

- Run: `scratch/runs/freshthird-source-complete-static-v4/canary-20260815-0001`
- Captured repository head: `08a67857db73617eed99a0d58801caff84b7a1c0`
- Captured source aggregate: `a3604c1617da60a242069806c7730edf027671151552e261b6b76cdeadc830c7`
- Result: four `SAT_ABSTRACTION` cells, all accepted by source-complete replay.
- Claim boundary: finite discovery evidence only. This run proves neither a universal theorem nor a Lean leaf.

An independent audit matched all 27 inventory rows, evaluated all 778,674 CNF
clauses in each complete 12,104-variable model, and replayed all four result
records. The original run remains authenticated discovery evidence. Terminal
reentry is not a green custody check after the runner source changed, so a
fresh replacement canary is required after the serializer fix.

## Wave-only comparison

The four models are one boundary-index-symmetric family rather than four
different obstruction types. In every cell:

- the pinned fan row and the boundary row are the same four physical points;
- the Q row and fresh row are the same four physical points;
- the pinned/boundary center is distinct from the Q/fresh center;
- the Q-row/pinned-fan intersection has cardinality exactly one;
- the selected boundary Q-source is absent from the pinned fan row;
- all blocker and boundary-fan cap witnesses use cap 1, while the first-source
  witness uses cap 2.

Thus the source-complete local theory does not force the existing three-point
overlap terminal. The models all evade it through the same positive-incidence
gap.

## Concrete candidate and consumer

Candidate producer (CONJECTURED):

> Under the full FreshThird exact-three source packet, the boundary Q-source
> belongs to the pinned fan row, and at least two distinct points from the
> actual Q blocker-fiber image belong to that row.

Immediate consumer:

- `FreshThirdQFiberThreeBoundary.false_of_pinnedFan_source_and_twoFiberPoints`
  in `FreshThirdQFiberThreeSynchronization.lean`.

First missing antecedent:

- positive boundary-source/pinned-fan incidence. The current source theory
  deliberately does not assert any positive Q-row-slot/pinned-fan incidence.
- Even boundary-source membership alone is not enough for the terminal; the
  two-fiber-image cardinality antecedent remains necessary.

Circularity warning:

- `exists_freshThird_firstNonHit_selectedRow_overlap_card_ge_three` is derived
  by `False.elim` after the still-open direct residual
  `false_of_freshThird_firstNonHit`; it cannot supply this producer.

## Theorem-bank reuse preflight

One bounded search of the repository Lean corpus for the concrete
three-point-overlap candidate found the existing consumer above, the indexed
synchronization adapter, and the blocker-fiber cardinality helper. It found no
source theorem supplying the missing positive incidence. Re-run theorem-bank
search only if a later wave produces a materially different candidate.

## Next mathematical target

Do not add another local finite field merely to exclude these four models.
Derive the positive incidence from carrier-wide information (global selected
row transport, cap order, minimality, or a metric synchronization theorem),
or prove that one of those global mechanisms yields a different
distinct-center row with three-point Q overlap. Until such a source producer
exists, further source-complete local SAT waves are expected to reproduce this
same survivor family.
