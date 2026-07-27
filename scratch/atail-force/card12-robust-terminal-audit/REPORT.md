# Card-12 robust terminal audit

## Verdict

No current theorem or short import-clean, source-clean chain was found that
consumes

```lean
R : Problem97.ATailFrontierLiveClosure.OriginalUniqueFourResidual F
hcard : 12 ≤ D.A.card
surface : ExactFourPostCardElevenRobustSurface R
```

and proves `False`.

The exact production theorem remains the explicit obligation
`ATailFrontierLiveClosure.false_of_exactFourPostCardElevenRobustSurface` at
`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean:76-84`.  Lean 4.27
reports `sorryAx` in its axiom set.  Its wrappers therefore do not provide an
independent terminal.

## Exact live information

`OriginalUniqueFourResidual` is at
`OriginalUniqueResidualDispatch.lean:43-69`.  It supplies minimality, `noM44`,
`9 < D.A.card`, a **first-apex class of cardinality four**, uniqueness of its
positive K4 radius, deletion blockers, two strict first-cap interior points,
and first-cap localization for carrier bisector centers of that pair.

`ExactFourPostCardElevenRobustSurface` is at
`ExactFourRobustCapExpansion.lean:200-210`.  It supplies physical ingress,
full deletion robustness at the second apex, first/second opposite-cap lower
bounds `4`/`5`, the second-apex radius classification, and the cap-growth
trichotomy.  The checked producer
`nonempty_postCardElevenRobustSurface_of_robust` is at lines 250-269.  Once the
surface is present, the separate `hcard` has no additional use in the strongest
available scratch normalization.

## Named candidates

### `CapFiveApexRigidity`

`scratch/atail-force/full-geometry-producer/CapFiveApexRigidity.lean` is
source-clean and recompiles under Lean 4.27.

- `both_opposite_apices_distinct_K4_radii_force_card_ge_fourteen`
  (lines 436-450) proves only `14 ≤ D.A.card`.  This is compatible with the
  live `12 ≤ D.A.card`, and its first-apex premise conflicts with
  `R.unique_K4_radius`.
- `card_twelve_has_opposite_cap_card_four_or_five` (499-505) and the full
  filter theorem (543-555) require exact card `12` (their more general versions
  require the unavailable upper bound `D.A.card ≤ 13`).  They choose an
  existential opposite apex and conclude a profile, not `False`; the chosen
  apex may simply be the already-known first apex.

### `apex_class_finite_profile_classifier`

`scratch/atail-force/apex_class_finite_profile_classifier.lean` has no
`sorry`, but its only contradiction is
`false_of_card_eleven_surplus_six` (58-68).  The card-12 producers at 88-100
and 104-118 require the first-apex selected class to have cardinality **five**,
incompatible with `R.class_card_eq_four`, and they conclude only a second-apex
four/five profile.

### `GlobalMinimalDeletionCore`

`scratch/atail-force/global-minimal-deletion-core/GlobalMinimalDeletionCore.lean`
has no theorem concluding `False`.

- `MinimalDeletionCore.card_le_three_of_card_twelve` (696-704) needs an
  already-built core and exact card `12`.
- The strongest card-12 reduction found,
  `SurvivorPairRelocationPacket.exists_strictCapFresh_collision_or_twoThreeCore_or_installedSingleton`
  (1079-1120), needs an unavailable `SurvivorPairRelocationPacket` and
  additional cross-hit/blocker data.  It returns a collision/core/singleton
  trichotomy; no collective terminal consumes it.
- There is no checked adapter from the robust surface ingress to the required
  relocation packet.

This file is also unusable from the live target without refactoring:
`GlobalMinimalDeletionCore.lean:7` imports `U1LargeCapRouteBTail`, while
`lean/Erdos9796Proof/P97/U1LargeCapRouteBTail.lean:33` imports
`ATail.FrontierLiveClosure`.  Importing the global core into the target would
create

```text
FrontierLiveClosure
  -> GlobalMinimalDeletionCore
  -> U1LargeCapRouteBTail
  -> FrontierLiveClosure.
```

## Strongest direct continuation

`scratch/atail-force/unique4-robust-cap-expansion/ExactFourRobustLargeRadiusContinuation.lean`
defines `ExactFourPostCardElevenRobustContinuation` at lines 637-681 and a
producer at 687-750.  It normalizes the surface to five live constructors:

1. a surplus five-point radius;
2. a first-opposite-cap five-point radius;
3. a second-opposite large-radius common-deletion residual;
4. a second-opposite exact-five omission cycle; or
5. two distinct second-apex radii.

There is no `False` consumer for this inductive.

Moreover, this is not currently an import-clean checked chain.  The current
source is newer than its cached `olean` (13:03 versus 12:50 on 2026-07-25).
A Lean 4.27 recompile fails because the scratch module
`card_five_interior_survivor_pair` and the promoted production module
`Erdos9796Proof...UniqueRowProducer.card_five_interior_survivor_pair` both
install `Problem97.ATailUniqueRowProducerScratch.CardFiveInteriorSurvivorPair`.
Thus the old cached artifact is not evidence of current-source closure.

## Theorem-bank screen

Exact-name searches in the sibling, legacy, and older general theorem-bank
registries found no occurrence of either live structure name.  The closest
consumers all lack ingress:

- endpoint, surplus, and K4-window banks need a bank-membership or metric-shadow
  producer;
- the 18 unimported U1 consumers need row-slot packets and many exact row
  equalities;
- sibling
  `Problem97.U1LargeCapRouteBTailMetricResidualTarget.u1TwoLargeCapObstruction`
  needs five points satisfying seven specified distance equalities, none of
  which is produced by `R` or `surface`;
- legacy candidates are fixed-`n = 9` contradictions.

## Lean 4.27 trust checks

Lean version: `4.27.0`, commit `db93dceb...`.

- `false_of_exactFourPostCardElevenRobustSurface`: axioms include `sorryAx`.
- `nonempty_postCardElevenRobustSurface_of_robust`: only `propext`,
  `Classical.choice`, and `Quot.sound`.
- `CapFiveApexRigidity.lean`: fresh compile succeeds; every printed candidate
  above has only `propext`, `Classical.choice`, and `Quot.sound`.
- All twelve files listed in
  `scratch/card12-original-unique-four-robust-files.txt` are textually
  `sorry`-free, but the strongest continuation currently fails the import-clean
  recompile described above.  Therefore “no `sorry` in source” is not being
  promoted to a current checked theorem claim.

Evidence logs are
`cap-five-apex-rigidity-lean427.log` and
`large-radius-continuation-lean427.log` in this directory.

## Smallest stable missing theorem

After making the continuation imports production-clean, the smallest stable
aggregate boundary is:

```lean
theorem false_of_exactFourPostCardElevenRobustContinuation
    (R : OriginalUniqueFourResidual F)
    (C : ExactFourPostCardElevenRobustContinuation R) :
    False
```

Together with `nonempty_exactFourPostCardElevenRobustContinuation`, this would
close the live surface theorem directly.  The current hypotheses fail to prove
this eliminator because they provide only cap lower bounds and local
deletion/radius normal forms.  They do **not** provide:

- an upper bound (`card ≤ 13`) or exact-card information for the full
  `card ≥ 12` range;
- the first-apex exact-five premise used by the card-12 profile classifier;
- an adapter to the global relocation/core packet;
- bank membership or the exact seven-equality metric packet; or
- a global localization theorem aligning the generated K4 escape rows with an
  existing repeated-pair, critical-fiber, `IsM44`, or omission-cycle terminal.

Accordingly, closing only one of the five continuation constructors would be
partial progress, not a proof of the production obligation.
