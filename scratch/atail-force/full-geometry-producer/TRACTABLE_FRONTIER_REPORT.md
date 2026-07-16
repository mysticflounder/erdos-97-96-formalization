# Tractable critical-pair frontier contract

Date: 2026-07-14

Status: **KERNEL-CHECKED BRANCH REDUCTION; TERMINAL PRODUCER STILL OPEN.**

This report is scratch-only. It does not modify production Lean,
`SurplusM44`, the user-owned unique-row lane, or the closure documents.

## Exact interface defect

`exists_criticalPairFrontier_of_K4` chooses `r` from global K4 and has the
local proof

```text
4 <= card (SelectedClass D.A S.oppApex1 r).
```

Its conclusion returns only `r > 0` and `CriticalPairFrontier`; the
four-point field is discarded. `CriticalPairFrontier` itself stores only the
pair and the two deletion splits. Consequently cap-four/five radius
uniqueness cannot identify the frontier radius with the unique K4 radius
from the current structure alone.

This is the one bookkeeping field that should be restored. It is already
proved at the extractor and does not require new mathematics.

## Kernel-checked current-frontier matrix

Write

```text
F-R = K4 survives deletion of q,w at oppApex1
F-U = the r-class is the unique K4 class and has card 4 or 5
S-R = K4 survives deletion of q,w at oppApex2
S-E = two disjoint exact four-shells at distinct oppApex2 radii
```

The production `CriticalPairFrontier` is the four-cell product
`(F-R or F-U) x (S-R or S-E)`.

`SmallCapFrontierReduction.lean` proves:

1. If `cap(oppIndex1)` has card four or five and the dropped
   `r`-is-a-K4-radius field is restored, `F-R` is impossible. Hence the first
   split is `F-U`.
2. If `cap(oppIndex2)` has card four or five, `S-E` is impossible without any
   extra field. Its two exact shells are two distinct positive full K4 radii,
   contradicting cap-four/five radius uniqueness. Hence the second split is
   `S-R`.

Thus the exact matrix is:

| Small cap information | Remaining production cells |
|---|---|
| only `oppIndex1` is known small | `F-U x S-R`, `F-U x S-E` |
| only `oppIndex2` is known small | `F-R x S-R`, `F-U x S-R` |
| both are small | only `F-U x S-R` |

These are branch exclusions, not a contradiction. In particular `F-U x S-R`
is compatible with all currently proved frontier fields.

## Cap-size profiles

On the live two-large-cap branch, every closed cap has card at least four,
the surplus cap has card at least five, a second cap has card at least five,
and the three closed-cap cards sum to `D.A.card + 3`.

Up to the allowed orientations, the small-card profiles are:

| `D.A.card` | closed-cap profiles |
|---:|---|
| 11 | `(5,5,4)` |
| 12 | `(5,5,5)`, `(6,5,4)` |
| 13 | `(6,5,5)`, `(6,6,4)`, `(7,5,4)` |

Therefore through card thirteen at least one non-surplus cap is four or five.
The new full-geometry theorem proves this directly. At card fourteen the
profile `(5,6,6)` becomes possible, so the small-cap shortcut is not uniform
over the current unbounded K-A-PAIR signature.

## Stronger tractable extractor

The already checked scratch theorem
`exists_pair_double_deletion_survives_secondApex` chooses the pair from the
same three-point off-surplus first-apex marginal so that `S-R` holds by
construction. It is strictly better than first choosing two separate
single-deletion survivors and then storing `S-R or S-E`.

For card at most thirteen, orient the small non-surplus cap as `oppIndex1`,
retain the chosen radius's four-point field, and use that stronger pair
selection. The entire four-cell frontier then reduces on the original
carrier to exactly:

```text
q,w are distinct and off the surplus cap;
q,w lie in one positive oppApex1 class of card 4 or 5;
that class is the unique full K4 radius at oppApex1;
deleting q,w together preserves K4 at oppApex2.
```

No iterative apex flip and no second-apex exact-eight branch remain.

The exact class refines further:

- if the small cap has card four, the full class has card exactly four;
- if the small cap has card five, the full class may have card four or five.

Neither case is currently contradictory.

## Smallest genuine residual

The next open theorem should consume the exact packet above and produce an
already-terminal field, not repackage `CriticalPairFrontier`.

A precise one-sorry disjunction is:

```lean
theorem smallApexPair_closingFields
    (P : SmallApexExactPairPacket D S H r) :
    ((SelectedClass D.A S.oppApex1 r).card = 4 /\
      ExistsSurplusPairCriticalBlocker
        S S.oppApex1 P.q P.w) \/
    ((SelectedClass D.A S.oppApex1 r).card = 5 /\
      Nonempty (CardFiveCapOrMutualFields S H r))
```

Here `SmallApexExactPairPacket` should contain only the fields displayed in
the preceding section. This statement is content-bearing:

- `false_of_existsSurplusPairCriticalBlocker` immediately consumes the
  card-four arm by ordered-cap outside-pair center uniqueness;
- `false_of_cardFive_exists_capLocal_or_mutualIncidence` immediately consumes
  the card-five arm by either the same ordered-cap sink or the three-bisector
  bound.

For independent proof work it is better to split this disjunction into two
branch-local lemmas. The mathematical missing field is the same in both:
source-indexed critical-row coupling. One must produce a non-apex critical
center containing the pair with usable cap placement, or reciprocal
cross-incidence for two distinct blockers. Cap counting and K4-radius
uniqueness do not produce that incidence.

An h4/h5 prescribed-center deletion failure is a valid third terminal output:
the checked adapters turn it into the missing row extension and the current
bank cores consume it. No current live theorem produces that failure.

## Dependencies and validation

The branch reductions depend on:

- `CriticalPairFrontier`, `FirstApexSplit`, and `SecondApexSplit`;
- `SurvivorPairRelocationPacket.oppApex2_dist_ne`;
- cap-four/five full-filter bounds and radius uniqueness from
  `CapFiveApexRigidity.lean`; and
- the exact support identity of `CriticalSelectedFourClass`.

Direct validation of `SmallCapFrontierReduction.lean` exits zero. Its four
printed declarations depend exactly on:

```text
propext, Classical.choice, Quot.sound
```

There is no `sorryAx`, custom axiom, `native_decide`, or solver trust step in
the checked reduction.

Required theorem-bank registries and indexed Lean searches were checked. The
existing banks supply the terminal consumers but no producer for the missing
source-to-blocker incidence, cap localization, reciprocal membership, or
prescribed deletion failure.
