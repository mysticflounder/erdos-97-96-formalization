# `false_of_capSourceThirdCanonicalRowSurface` refactor plan

## Current source-state correction

As of the current 2026-07-31 worktree, the exact declaration

```lean
Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal
  .false_of_capSourceThirdCanonicalRowSurface
```

is present in the live checkout at
`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean`. Its former literal
`sorry` has been replaced by a checked exhaustive coordinator over
`GeometricMultiplicityResidual`. Its transitive closure is still open through
the first enlarged-fiber leaf and the strict fresh-third residual described
below. The earlier claim that the declaration might be only a local extraction
remains stale and should not guide the implementation. The detailed source audit is recorded in
[`scratch/cap-source-refactor-plan-audit-20260731.md`](../scratch/cap-source-refactor-plan-audit-20260731.md).

## Implementation status (2026-07-31)

The first refactor stage is now installed in the live source. The earlier
two-source packet plumbing passed a direct Lean 4.27 source compile (with the
repository's pre-existing `sorry`s). The latest fresh-third narrowing and
positive residual normal form also pass the repository's Lean 4.27
`lake-build Erdos9796Proof.P97.ATail.FrontierLiveClosure` target. That build
refreshed the proof-blueprint source index and kernel call graph. This is not
yet a transitive closure:

* `TwoCapSourceThirdCanonicalRowSurface` retains two actual
  `CriticalShellSystem` vertices, their distinctness, the full canonical-row
  witnesses, and both `CrossPairDeletionView`s.
* `twoCapSourceThirdCanonicalRowSurface_of_capEight` packages the existing
  checked two-source producer. Because that producer is an existential in
  `Prop` while the packet contains actual vertices, the source-clean package
  is a `noncomputable def` using `Classical.choose` rather than a large
  elimination.
* `twoCapSourceThirdCanonicalRowSurface_of_capSource` lifts the existing
  single-source cap arm without changing `hglobalCapSplit`.
* The former root callers now target three explicit two-source residual
  interfaces: `false_of_twoCapSources_freshThirdBlockerFiber`,
  `false_of_twoCapSources_freshOutsideFirstBlockerFiber`, and
  `false_of_twoCapSources_freshOutsideSecondBlockerFiber`. The second-side
  interface is now a checked swap wrapper around the first-side interface, so
  only the fresh-third and first-enlarged branches remain independent
  mathematical leaves.
* `false_of_capSourceThirdCanonicalRowSurface` is now an exhaustive checked
  `rcases` coordinator over `GeometricMultiplicityResidual`; its transitive
  closure still depends on the two independent leaves and the checked
  second-side swap transport.

The compatibility adapters no longer recurse into the root. There are two
independent packet-level branches, but the checked fresh-third router exposes
two constructor-specific terminals. Thus the current coordinator-interface
frontier has three actual theorem obligations:

* `false_of_twoCapSources_freshOutsideFirstBlockerFiber`;
* `false_of_twoCapSources_freshThirdBlockerFiber_normalized_residual`; and
* `false_of_capSource_firstFiber_collisionFiveCenterDeletion`.

After those are proved, the remaining gates are a Lake build and refreshed
proof-blueprint/transitive-axiom audit. A clean source compile is not a claim
that the publish target is `sorry`-free.

The swap-preserving packet helper is now also source-checked: the two
canonical-row witnesses can be exchanged while preserving the full support
and deletion-survival views. An earlier direct Lean 4.27 compile validated the
fresh-third positive normalization described below. Since that check, the
equal-blocker branch has been strengthened to retain its originating
`FreshOutsideFirstBlockerFiber` packet and simultaneous omission of all four
collision endpoints. The direct check exposed a parser break in the new
all-endpoint lemma, which was repaired. A subsequent guarded Lean 4.27 target
build completed successfully and refreshed the proof-blueprint, validating
the full Q-retaining rewire. This structural check does not discharge the three
load-bearing terminal obligations. The packet-level
fresh-third theorem now checks the positive same-cap terminal against both
cap-eight sources. If neither source aligns, it passes both independently
normalized `FreshThirdCapSourceInteraction` packets to the checked two-source
core. The core removes the direct distinct-cross-row arm and sends only the
strict complement to the open residual. The former single-source theorem is
compatibility-only wiring that recovers the two-source packet before entering
the load-bearing theorem.

## Verdict

[
\boxed{\text{Refactor it—but eliminate it as a load-bearing }sorry.}
]

It should become a **checked coordinator**, while the real unresolved mathematics stays in narrower child theorems.

A theorem called

```lean
false_of_capSourceThirdCanonicalRowSurface
```

suggests that `CapSourceThirdCanonicalRowSurface P Pρ` is itself contradictory. It is not the true terminal datum. The surface merely supplies:

* the cap-eight bound;
* one strict-cap source outside the four collision sources;
* an actual third blocker distinct from both collision blockers and both physical apices;
* its actual full exact-four row;
* one omission/deletion-survival choice against each collision pair.

The contradiction only becomes targeted after combining that surface with the separately produced geometric multiplicity residual

[
\texttt{FreshThirdBlockerFiber}
;\lor;
\texttt{FreshOutsideFirstBlockerFiber}
;\lor;
\texttt{FreshOutsideSecondBlockerFiber}.
]

The source-clean multiplicity module explicitly says these are the three non-cross-hit outputs and that its normalization alone gives no global contradiction.

## The coordinator after the first refactor stage

The honest *end-state* coordinator interface is approximately:

```lean
theorem false_of_capSourceSurface_and_geometricMultiplicity
    (hcapSource : CapSourceThirdCanonicalRowSurface P Pρ)
    (hgeom : GeometricMultiplicityResidual P Pρ) :
    False := by
  rcases hgeom with hthird | hfirst | hsecond
  · exact
      false_of_capSource_freshThirdBlockerFiber
        P Pρ ... hcapSource hthird
  · exact
      false_of_capSource_freshOutsideFirstBlockerFiber
        P Pρ ... hcapSource hfirst
  · exact
      false_of_capSource_freshOutsideSecondBlockerFiber
        P Pρ ... hcapSource hsecond
```

That dispatch is now installed in the existing root. It contains no literal
`sorry`, and the old adapters no longer call it. It is not yet a transitive
closure because the three two-source residual leaves it dispatches to remain
load-bearing `sorry`s. The next acceptance gate is to prove those leaves
source-clean, then rebuild and audit the publish spine.

The outer coordinator still produces the two semantic inputs and keeps the
existing publish interface. The refactored root performs the child dispatch
after the outer coordinator supplies:

```lean
hglobalCapSplit :
  CapSourceThirdCanonicalRowSurface P Pρ ∨
    CrossBlockerCoincidence P Pρ
```

and

```lean
hgeometricMultiplicity :
  CollisionCrossHit P Pρ ∨
    GeometricMultiplicityResidual P Pρ
```

The cap-source arm is still passed to the root by name for compatibility; the
root now immediately packages the two-source surface and splits the residual.
The old root recursion has been removed, so only the three narrowed child
theorems remain on the proof frontier.

So if the local theorem has absorbed all of that into one new `sorry`, that is an architectural regression: it has merged several already-normalized semantic cases back together.

The long-term API could rename it to reflect the extra datum:

```lean
false_of_capSourceSurface_and_geometricMultiplicity
```

or, if it derives multiplicity internally,

```lean
false_of_capSourceSurface_of_threeOmissionMultiplicity
```

The current name hides the actual reason the surface is supposed to be impossible.

# The more important refactor: retain **two** cap sources

The current `CapSourceThirdCanonicalRowSurface` exposes only one source, even
though the checked cap-eight producer already proves the existence of two
distinct sources. In particular, the source-clean theorem
`exists_two_capSources_thirdBlocker_crossPairDeletionSurvivals` is already
available in `TwoCollisionGlobalProducer.lean`. There is not yet a production
`TwoCapSourceThirdCanonicalRowSurface` packet, so the low-risk change is to add
one around that producer rather than change the global split in place.

The current single-source surface also throws away stronger data that is
already proved:

It retains only

```lean
∃ source, ...
```

but cap size at least eight actually produces **two distinct strict-cap sources**, each carrying the complete third-row and cross-pair deletion-survival packet. Current main already has:

```lean
exists_two_capSources_thirdBlocker_crossPairDeletionSurvivals
```

and subsequently reconstructs two `FirstFiberCapSourceWitness` values from it.

That suggests the genuinely useful normal form is:

```lean
structure TwoCapSourceThirdCanonicalRowSurface
    (P : RetainedInteriorBlockerCollision R)
    (Pρ : RetainedInteriorBlockerCollision Rρ) where

  cap_card_ge_eight :
    8 ≤ (S.capByIndex S.oppIndex1).card

  source₁ source₂ :
    CriticalShellSystem.CarrierVertex D.A

  sources_ne :
    source₁.1 ≠ source₂.1

  source₁_data :
    CapSourceThirdCanonicalRowWitness P Pρ source₁

  source₂_data :
    CapSourceThirdCanonicalRowWitness P Pρ source₂
```

Then retain compatibility projections:

```lean
def TwoCapSourceThirdCanonicalRowSurface.toSingle :
    CapSourceThirdCanonicalRowSurface P Pρ := ...
```

and the swapped version.

This is not merely cleaner packaging. It potentially changes the difficulty of the hardest child.

## Why the second source matters for the fresh-third branch

The current hard theorem compares a fresh third blocker fiber (Q) against **one arbitrarily chosen cap-source row**:

```lean
false_of_capSource_freshThirdBlockerFiber_without_sameCapCrossRow
    (source ...)
    (hsource ...)
    (Q ...)
    (hnoAlignment : ¬ FreshThirdSameCapCrossRowAlignment ... Q source)
```

The positive alignment for that one source is closed. The residual says only that this particular source fails to align with (Q).

But cap-eight supplies two cap-source rows. Comparing (Q) with both gives a much stronger alternative:

1. one of the two rows has the checked same-cap alignment, closing immediately;
2. both rows fail alignment;
3. one or both source rows omit a fiber source;
4. the two cap-source blockers coincide;
5. the two cap-source blockers are distinct and acquire constrained cap locations relative to the common blocker of (Q).

The second case supplies **two simultaneous failure packets**, not one. That is the sort of input that can feed:

* the existing mutual-cross-membership versus one-sided-deletion split;
* a perpendicular-bisector saturation argument;
* a (5\times5) power-matrix support obstruction;
* a Hall/deletion-survival synchronization;
* a same-cap interval contradiction.

Current main already demonstrates the usefulness of two sources in the enlarged-first-fiber arm: it obtains two witnesses, splits their mutual cross-membership, and routes the alternative to `false_of_twoCapSources_oneSidedDeletionSurvival`.

The live implementation now gives the fresh-third arm this two-source strength
before treating its residual as irreducible.

# Recommended final architecture

I would use three layers.

## Layer 1: source-clean producer

Add a two-source packet without changing the existing publish interface or
introducing a new open theorem. The live implementation uses a `structure` in
`Type` (a `Prop`-valued structure cannot contain the actual source vertices)
and a source-clean `noncomputable def` package:

```lean
noncomputable def twoCapSourceThirdCanonicalRowSurface_of_capEight
    (...) :
    TwoCapSourceThirdCanonicalRowSurface P Pρ := by
  -- package the existing checked two-source producer with Classical.choose
```

The packet must retain both actual sources, their distinctness, the complete
third-blocker/cross-pair deletion-survival data, the actual selected exact-four
supports, and both `CrossPairDeletionView` witnesses. Do not replace that
provenance with arbitrary four-subsets. Keep this layer source-clean and
acyclic.

## Layer 2: checked multiplicity coordinator (after Layer 3 is source-clean)

```lean
theorem false_of_twoCapSourceSurface_and_geometricMultiplicity
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (G : GeometricMultiplicityResidual P Pρ) :
    False := by
  rcases G with hthird | hfirst | hsecond
  · exact false_of_twoCapSources_freshThirdBlockerFiber ... C hthird
  · exact false_of_twoCapSources_freshOutsideFirstBlockerFiber ... C hfirst
  · exact false_of_twoCapSources_freshOutsideSecondBlockerFiber ... C hsecond
```

This should be sorry-free once the true children exist. Until then, it must
remain a planned interface rather than a wrapper around the current root.

## Layer 3: actual load-bearing children

The actual remaining proof work is concentrated in genuinely source-clean
children. The two independent packet-level targets are:

```lean
false_of_twoCapSources_freshThirdBlockerFiber
```

and

```lean
false_of_twoCapSources_freshOutsideFirstBlockerFiber
```

The packet-level second-side interface is already a checked swap wrapper around
the first-side interface, so it is not a separate independent proof target.
The fresh-third target must cover the strict residual after the
negative-alignment case has been normalized and its direct three-center arm
removed, not only the already-proved positive same-cap alignment subcase. The
enlarged-first child must discharge its common-omission and one-sided-deletion
branches without calling the root.

The 2026-07-31 audit found no existing source-clean producer for either of
those two terminal branches. In particular:

* distinct-blocker mutual cross-membership is already closed by
  `false_of_twoCapSources_mutualCrossMembership_distinctBlockers`, and the
  equal-blocker complementary branch is already closed by
  `false_of_equalBlockers_complementaryMembership`;
* the former equal-blocker common-omission packet erased the originating
  `FreshOutsideFirstBlockerFiber`; the live producer now retains that packet
  and proves the stronger fact that both equal-blocker rows omit all four
  collision endpoints; and
* one-sided deletion survival currently constructs only a
  `SixCenterDeletionSurvivalPacket`, with no downstream contradiction.

Therefore the next implementation step is a direct, source-clean terminal
for the all-endpoint-omission packet and a direct, source-clean terminal for
the one-sided packet (or a single checked theorem that consumes both packets).
Do not add compatibility wrappers or re-use the old first-fiber/enlarged-fiber
adapters as proofs: those adapters now depend on the packet-level leaves and
would reintroduce the recursion this refactor removed. The second-side theorem
remains a swap wrapper and becomes source-clean when the first-side theorem is
independently source-clean.

The acceptance condition is unchanged: each new terminal must be a genuine
mathematical contradiction with no `sorry`, be wired into its packet-level
leaf and the checked root coordinator, and then pass the Lean 4.27 build plus
the transitive proof-blueprint/axiom audit.

## Radius-profile and theorem-bank audit

The universal two-source packet should **not** acquire a common-radius field.
Its generic cap-eight producer proves two distinct cap sources with complete
canonical rows, but it does not prove that those sources lie on one common
first-apex radius. The old common-radius pair is conditional data constructed
only after negating `FirstCapMultiPointRadiiRetained`, via
`exists_two_firstFiberCapSourceWitness_of_commonRadius`.

Consequently, the enlarged-first proof should retain this global split:

1. in the aligned arm, use the named cap source and the checked singleton-radius
   reduction;
2. in the nonaligned arm, construct a separate refined pair carrying
   `commonRadius` and both selected-class memberships;
3. apply the mutual-cross-membership versus one-sided-deletion split only to
   that refined pair.

This conditional refinement is the minimum honest interface. Adding
`commonRadius` to `TwoCapSourceThirdCanonicalRowSurface` would overstate the
generic producer; omitting the global split would discard information needed
by the checked distinct-blocker branch.

The exact-11 theorem bank does not currently close either leaf. Its relevant
554/profile theorems require `D.A.card = 11` and additional endpoint or cap
profile hypotheses that are absent here; the live cap-source branch instead
has a cap of size at least eight. Likewise, the imported six-point Euclidean
and sparse Euclidean contradiction theorems require a concrete injective CCW
boundary order plus two or three selected-row incidence patterns. Neither the
two-source packet nor the fresh-third packet presently produces that
embedding.

For the fresh-third core, the live target is now
`FreshThirdTwoCapSourceObstruction`, with two constructors:

* `normalized C Q firstInteraction secondInteraction` retains one positive
  `FreshThirdCapSourceInteraction` for each of the two distinct cap sources;
* `sameBlockerAllEndpointOmission Q ...` retains the stronger equal-blocker
  first-fiber packet, including the originating
  `FreshOutsideFirstBlockerFiber Q`, common radius, both source witnesses,
  mutual row incidence, actual-blocker equality, simultaneous omission of all
  four collision endpoints by both rows, and the exact shell/cap
  intersection.

The checked producer
`allCollisionEndpointsOmitted_of_equalBlocker_shell_inter_cap_eq` derives the
all-four omission from the exact common-shell intersection and support
equality. Consequently the old
`CommonCollisionEndpointOmission ∨ complementaryMembership` split is no
longer part of the first-fiber equal-blocker producer. It remains relevant
only to the separate normalized equal-center residual described below.

The normalized constructor initially has a sixteen-cell product: each
interaction is one of `sameBlocker`, `sourceRowOmission`,
`distinctBlockersDifferentCaps`, and `sameCapWithInternalFiberSource`.
However, it is no longer accurate to call all sixteen cells open.
`FreshThirdTwoCapSourceObstruction.HasDistinctCrossRows` identifies the arm in
which both source rows contain both fresh sources and their two blocker centers
are distinct. The checked theorem
`false_of_two_freshThirdCrossRowHits_distinctCenters` places those two centers
and the fresh common blocker on the perpendicular bisector of the fresh source
pair and contradicts the convex-carrier two-center bound.
`FreshThirdTwoCapSourceObstruction.false_of_hasDistinctCrossRows` lifts that
terminal to either obstruction constructor, and the checked
`false_of_twoCapSources_freshThirdBlockerFiber_core` routes the positive arm to
it.

The former mixed open leaf was

```lean
false_of_twoCapSources_freshThirdBlockerFiber_residual
    (obstruction : FreshThirdTwoCapSourceObstruction P Pρ)
    (hresidual : obstruction.ResidualCase) : False
```

That interface combined two disjoint constructors whose useful data and
likely terminals are different. It has now become a checked exhaustive
coordinator with immediate constructor fan-out two. The live leaves are:

```lean
false_of_twoCapSources_freshThirdBlockerFiber_normalized_residual
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (firstInteraction : FreshThirdCapSourceInteraction ... C.firstSource Q)
    (secondInteraction : FreshThirdCapSourceInteraction ... C.secondSource Q)
    (hresidual : FreshThirdNormalizedResidualCase P Pρ C Q) : False

false_of_capSource_firstFiber_collisionFiveCenterDeletion
    {commonRadius : ℝ}
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (source source' : CarrierVertex D.A)
    ...
    (all_endpoint_omission :
      AllCollisionEndpointsOmitted P Pρ source source')
    (blocker_mem_capInterior : ...)
    (shell_inter_cap_eq : ... = {source.1, source'.1})
    (houtsidePair :
      FirstFiberOutsidePairFiveCenterExactRowsOrCrossedResidual
        P Pρ Q source)
    (hexactRows :
      FirstFiberCollisionFiveCenterExactRowsResidual
        P Pρ source S.oppApex2 S.surplusApex) : False
```

Before this split, the coordinator-interface frontier was one mixed residual
carrying an indexed sum. After it, the coordinator itself is source-clean and
the frontier is two strictly constructor-specific leaves: the normalized
interaction product and the stronger first-fiber/common-blocker all-endpoint
omission packet, now narrowed one further step to the positive four-way
five-center exact-row residual and the independent outside-pair exact-row-or-
crossed residual. The old all-endpoint theorem is checked wiring:
`collisionFiveCenterDeletion_of_allCollisionEndpointsOmitted` supplies
`hdeletion`; `collisionFiveCenterExactRows_of_deletionResidual` then trims all
five surviving witnesses in the selected arm to exact q-free cardinal-four
rows and exposes the deleted source's actual blocker as a distinct blocked
center. The outside-pair producer simultaneously gives two further five-row
deletion packets or one of two crossed positive-incidence patterns. The
terminal consumes both theorem-bank-ready interfaces. This changes the
local raw `sorry`
count from one to two but narrows
each branch by a checked constructor split, preserves every positive field,
and prevents the strong packet from being erased into the generic normal
form. Both leaves are immediately wired through the old residual coordinator
to the publish target. This is an aggregate-tractability refactor, not a
closure claim.

`IsResidual` replaces the opaque negative guard with a checked positive normal
form. For a normalized obstruction it is
`FreshThirdCrossRowResidual`: the first row is not a cross-row hit, the second
row is not a cross-row hit, or their blocker centers coincide. The checked
`isResidual_of_not_hasDistinctCrossRows` producer proves that this exhausts
the complement of the three-center arm. For `sameBlockerAllEndpointOmission`,
`IsResidual` is true while the indexed obstruction retains every stronger
field.

The negated hit arms are now constructive as well. The checked
`FreshThirdCapSourceInteraction.nonHit_of_not_crossRowHit` converts a failed
hit to `FreshThirdCapSourceNonHit`, whose only constructors are
`sameBlocker` (retaining center and selected-support equality) and
`sourceRowOmission` (retaining the omitted fresh source and four-point
deletion survival). The checked
`freshThirdNormalizedResidualCase_of_crossRowResidual` then converts the
normalized residual into exactly three positive arms: first-source non-hit,
second-source non-hit, or equality of the two cap-source blocker centers while
retaining both positive cross-row hits.
The checked `freshThirdEqualCenterExactFourRow_of_hits` strengthens the last
arm to a named exact row: both cap-source selected supports are equal to
`{C.firstSource, C.secondSource, Q.source₁, Q.source₂}`. The proof derives all
four-point distinctness from the hit center inequalities and source
distinctness, then uses exact shell cardinality. The checked
`commonCollisionEndpointOmission_of_equalCenterHits` feeds that exact row into
`commonCollisionEndpointOmission_or_complementaryMembership`: the
complementary-membership arm gives mutual cap-source membership at equal
blockers and is discharged by
`false_of_equalBlockers_complementaryMembership`. Consequently the honest
equal-center residue is precisely `CommonCollisionEndpointOmission`; the named
exact row is not by itself contradictory.
The checked `residualCase_of_isResidual` lifts this result to the indexed
`ResidualCase` consumed by the source-clean coordinator; its common-omission
arm retains the original obstruction packet. This removes the opaque
negations and disjunctions from the load-bearing interfaces. The deliberate
two-leaf constructor split is the only new fan-out.

The normalized complement therefore consists of configurations where one
source row has the explicit equal-blocker or omitted-source packet, or both
rows are the same named exact four-source row with a common collision-endpoint
omission. The separate
`sameBlockerAllEndpointOmission` constructor also remains live: by definition
it does not satisfy `HasDistinctCrossRows`, so it enters the residual with its
stronger first-fiber, common-radius, and all-endpoint-omission data intact.
Its concrete closure route now produces the existing F3c five-center deletion
residual from `Q` and the cap-source witness, then applies the live
`false_of_capSource_firstFiber_collisionFiveCenterDeletion` terminal. The
terminal now consumes the exact-row form rather than the opaque K4-survival
conjunction. It is on-spine, and a direct Lean 4.27 compile checks the acyclic wiring;
it remains `sorry`-backed. The normalized complement still needs a
source-clean occurrence/embedding or direct incidence terminal. The cells
should become separate live obligations only when constructor-specific
interfaces expose such a route. A fixed-cardinality SAT/QF_NRA result alone
is not a universal proof of this unbounded packet.

A bounded fixed-`n = 15..18` incidence model under
`scratch/atail-force/same-blocker-common-omission-euclidean-v3/` validates the
packet plumbing but does not contradict it. The profile gate rejects `n = 15`
and `n = 16`; the complete radius-equivalence, chosen-K4-row, critical-shell,
minimality-connectivity, blocker, cap-intersection, and omission abstraction is
replay-checked `SAT` at `n = 17` and all three `n = 18` profiles. This rules out
the original abstract incidence package as a closure route. The audit now also
models the newly exposed four-arm five-center deletion residual exactly: it
chooses one Lean-order arm, extracts one selected K4 row at each of its five
named centers after the specified deletion, and independently replays that
every row avoids the deleted endpoint. The smallest feasible `n = 17`, cap
profile `(6, 8, 6)` instance remains replay-checked `SAT` (the witness chooses
the `P.source₁` deletion arm). Thus the five-center packet is a sound strict
narrowing and certificate interface, but it is not a contradiction in the
current incidence abstraction. The first missing bridge is now after exact-row
extraction: a metric or ordered-cap theorem must either confine the five row
supports incompatibly or force one survivor center to be the deleted source's
actual blocker. These external Z3 models are neither Euclidean realizations,
universal proofs, certificates, nor Lean closure.

The first source-proved ordered-cap strengthening has also been replayed. It
adds the block-order specialization of
`CapCrossingKalmanson.false_of_two_selected_rows_shared_late_pair`, forbidding
the first apex and a preceding-cap interior center from sharing two points of
the indexed cap interior. This eliminates the first replay witness's shared
`{q₁,q₂}` pattern, but the bounded `n = 17`, profile `(6,8,6)` model is
still replay-checked `SAT` at iteration zero. The stronger audit now includes
existential cyclic positions, geometric-incidence constraints, and the full
selected-row shared-pair separation family. It is still replay-checked `SAT`
at `n = 17`, profile `(6,8,6)`, at iteration zero: all 14,280 shared-pair
candidates were generated, 13 were active in the witness, and the 61,880
circle-overlap plus 61,880 perpendicular-bisector candidates replayed
successfully. The selected deletion arm is `P.source₁`. The result and witness
are recorded under
`scratch/atail-force/same-blocker-common-omission-euclidean-v3/incidence-audit/n17-profile-6-8-6-incidence-five-center-deletion-geometric-incidence-full-shared-pair-separation/`.
Thus no further incidence-only refinement is presently a credible closer. A
faithful fixed-witness Euclidean coordinate check was attempted next. The
audited QF_NRA formula uses one coordinate pair for each of the 17 points, all
680 strict-convex/general-position orientation inequalities, 51 selected-row
squared-distance equalities, 108 critical-blocker completeness disequalities,
and the exact class partition at the first apex (858 assertions total). Z3
4.16 returned `UNKNOWN` after its 300-second timeout. This is neither SAT nor
UNSAT, and the monolithic query should not simply be rerun. It is recorded in
`scratch/atail-force/same-blocker-common-omission-euclidean-v3/euclidean-realization-audit/`.
The next computational boundary is therefore decomposed theorem-bank CEGAR
and, only where needed, small coordinate cores. Any bounded result will guide
the universal Lean lemma; it will not itself close the unbounded branch.

The first theorem-bank cut instantiates
`FivePointEuclideanObstruction.false_of_five_ccw_second_two_selected_rows` on
every increasing quintuple in the solver's common strict-CCW enumeration. The
original witness contains exactly two such antecedents. Guarded CEGAR removes
them, but remains replay-checked `SAT` at `n = 17`, profile `(6,8,6)`, after
three candidates and five theorem cuts. The survivor has zero anchored
antecedents among all 6,188 increasing quintuples. An independent replay finds
eight cyclic-rotation-only instances. Production Lean now supplies
`false_of_five_ccw_second_two_selected_rows_cyclicShift`, which transports the
same exact obstruction through any cyclic cut using
`injective_cyclicShift` and `isCcwConvexPolygon_cyclicShift`; its source check
is clean and `lean_verify` reports only `propext`, `Classical.choice`, and
`Quot.sound`. A guarded target build remains pending behind the current project
build lock. The exact cyclic-recut CEGAR run is now complete. It remains
replay-checked `SAT` at `n = 17`, profile `(6,8,6)`, after four connected
candidates and 32 cyclic cuts. Independent replay checks all 6,188 quintuples
and 30,940 direction-preserving rotations; the survivor has zero anchored or
cyclic target matches. The guard self-check exhausts all 120 orders and rejects
exactly the five rotations, while no reversal is generated. Thus the cyclic
adapter is sound and useful, but this particular five-point bank theorem is
not a universal closer for the live packet. The implementation, self-check,
iterations, survivor, and independent replay are under
`scratch/atail-force/same-blocker-common-omission-euclidean-v3/theorem-bank-cegar-audit/`.
This rejects the particular first witness but does not yet prove that the
theorem antecedent is forced by the live terminal packet.

The bank also already contained the genuinely reversed-row consumer
`false_of_five_ccw_reversed_second_two_selected_rows`. Production Lean now
adds the corresponding source-clean
`false_of_five_ccw_reversed_second_two_selected_rows_cyclicShift` transport.
Its direct Lean 4.27 source check reports only `propext`, `Classical.choice`,
and `Quot.sound`. This does not retroactively make the preceding forward-only
run exhaustive: both proved direction-preserving cyclic families must be
included in the next dual-row CEGAR pass and replayed separately.
The same checkpoint also adds the source-clean cyclic transport
`false_of_five_ccw_two_selected_rows_cyclicShift` for the bank's other
nonlinear two-row obstruction. The next pass must therefore test all three
proved cyclic pattern families, not extrapolate from the one already run.

The pre-cyclic-cut surviving witness was also mapped back to the new outside-pair
interface. It takes `Q.source = a1`, `Q.otherOutsidePoint = t2`, the cap-source
row `p1 = {a1,t1,q1,q2}`, and the opposite-blocker row
`p2 = {t3,r1,r2,s2}`. Hence it selects common deletion of
`Q.otherOutsidePoint`; neither crossed arm holds. Across all five anchored and
49 cyclic-rotation-only five-point matches in the audit, every positive row
membership is arbitrary relative to that live deletion arm. In particular,
none is a universal occurrence consequence of the current packet. The full
source/artifact-only mapping is recorded in
`theorem-bank-cegar-audit/live-split-witness-audit.md`; it is not a Lean,
solver, kernel, or closure result.

The post-cyclic-cut survivor takes `Q.source = s3`,
`Q.otherOutsidePoint = t3`, with actual blockers `bq = r2` and `br = q1`.
Both outside points are omitted from both relevant rows, so both common-
deletion propositions hold; the constructor truth table is deliberately not
exclusive. It has 21 non-target cyclic five-point matches, ten involving a
split row, but none positively uses either deleted outside point in that row.
This is the concrete reason to stop extending the same single-row theorem cut
and model the two independently selected deleted-row layers instead.

The first half of that route is now production Lean. The source-clean theorem
`collisionFiveCenterDeletion_of_allCollisionEndpointsOmitted` applies
`firstFiber_cycleAlignedHits_or_collisionFiveCenterDeletion` with the two
robust remaining apices. Its non-deletion arm contains `P.source₁` in the
cap-source row, contradicting the retained all-four omission; the other arm is
exactly `FirstFiberCollisionFiveCenterDeletionResidual`. Production module
`ATail/FiveCenterDeletionBoundary.lean` now performs the exact-row extraction;
its guarded Lean 4.27 target build passed on 2026-08-01. The live coordinator
converts the four deletion arms to
`FirstFiberCollisionFiveCenterExactRowsResidual`, and a direct Lean 4.27 source
check of `FrontierLiveClosure.lean` passed after that rewire. The positive
terminal is wired and the former all-endpoint theorem is source-clean. This
replaces its `sorry` by one more explicit on-spine `sorry`; it closes no
terminal by itself. The mathematical task is now a positive metric alignment
or cyclic-order incompatibility among those extracted rows. In particular, an
equality making the opposite collision blocker bisect the two named first-fiber
outside points would close the branch immediately by
`CapSelectedRowCounting.outsidePair_unique_capCenter`; the present incidence
packet does not imply that equality. Merely splitting the four deletion arms
again would not increase aggregate tractability.

There is now an additional checked source-level positive consequence. Any
canonical row whose center lies in the first ordered cap and differs from the
first collision blocker must omit at least one of the two named off-cap points
from the first blocker row. This is exposed by
`capCenter_omits_firstFiber_outsidePair`; the opposite-blocker specialization
is `oppositeBlocker_omits_firstFiber_outsidePair`, with positive deletion form
`oppositeBlocker_outsideDeletionSurvival`. In each exact five-center deletion
arm, `collisionFiveCenterExactRows_projects_to_omissions` also projects the
deleted collision endpoint out of both the cap-source row and the opposite
collision-blocker row.

The proposed compact interface is also now installed, without a permanent
`4 × 2` leaf explosion. `firstFiberOutsidePair_fiveCenter_or_crossed` proves
`FirstFiberOutsidePairFiveCenterOrCrossedResidual`: either deleting one named
outside point preserves K4 at the cap-source center, the opposite collision
blocker, and all three rich apices, or the two cap-center rows realize one of
the two crossed outside-point membership patterns.
`firstFiberOutsidePair_exactRows_or_crossed` then trims either deletion arm to
five exact q-free rows, yielding
`FirstFiberOutsidePairFiveCenterExactRowsOrCrossedResidual`. The parent proves
this exact packet and passes it explicitly to
`false_of_capSource_firstFiber_collisionFiveCenterDeletion`; no new `sorry`
was introduced. Before this strengthening, the terminal frontier exposed only
the four collision-endpoint exact-row arms. After it, the same single terminal
also exposes a two-deletion/two-crossed constructor with immediate fan-out four
and a checked producer. The remaining proof should match these two positive
interfaces against a universal Euclidean occurrence theorem, rather than split
the four endpoint arms mechanically again.

The first two-interface incidence replay was incomplete and its reported SAT
witness is retired as evidence for this branch. It searched only the ten
packet-row aliases, although the live theorem also supplies all seventeen
canonical K4 rows. Composing those rows gives immediate production-theorem
hits: two shared-late-pair instances, one shared-endpoint-pair instance, a
two-triple six-point instance, and
`FivePointCircleIsoscelesOrderBridge.false_of_two_selected_rows_of_ccw`.
The corrected CEGAR now searches the full canonical-plus-packet row universe
and deduplicates realized selected classes. Its first full-row pass
learned more than twelve thousand sound guarded theorem cuts over 321
candidates before the 300-second total budget expired. This is
`UNKNOWN_TIMEOUT`, not SAT or UNSAT. A second pass generalized each cut over
all row providers with the same realized center/support requirement. It also
expired fail-closed after 600 seconds: 271 candidates, 730 shared-pair cuts,
and 11,378 theorem cuts. Those cuts are sound, but the two runs did not inspect
equality-only theorem antecedents in the complete radius partition: they
looked for those antecedents only through selected-row providers and also
omitted `CapCrossingKalmanson.false_of_selected_rows_in_five_ccw_order`.
Consequently the timeouts are not exhaustive theorem-bank passes. Provider
aggregation is a sound speedup, but it did not settle the dual-deletion
constructor at this budget; no SAT witness or UNSAT conclusion may be inferred
from either timeout.

The crossed-constructor audit found one source-fidelity loss before the next
bounded run. The raw producer already proved all four polarities: each outside
point belongs to its designated common/opposite row and is omitted from the
other row. An intermediate residual retained only the two positive memberships.
The live residual, normalizer, and fixed-role support packet now preserve both
complementary omissions. The source-clean shell lemma
`CriticalFourShell.dist_ne_radius_of_mem_A_not_mem_support` converts exact-row
omission into a strict distance non-equality, and the packet exposes the two
specializations as `commonRow_cross_dist_ne` and
`oppositeRow_cross_dist_ne`. A direct Lean 4.27 source check of both the shell
module and `FrontierLiveClosure.lean` passes. This strengthens the on-spine
interface without adding an obligation.

The refreshed incidence encoder exposes all seventeen canonical rows, uses
selected rows only for selected-row consumers, and matches equality-only
consumers against the complete raw radius-equivalence relation. Its artifact
format serializes that full relation, and its self-check covers all nineteen
registered theorem families plus both crossed-arm polarity maps. Imported
learned cuts are accepted only after reconstructing and validating every
formula; serialized formulas are never trusted.

The first bank-complete schema-v3 run reached its 1,000-candidate limit after
446,760 ms and 48,978 sound theorem cuts. It is retired as a branch verdict
because it predated the source-fidelity repair and did not encode the two
complementary omissions, although its theorem cuts remain universal and may be
reconstructed in a stricter run. The corrected schema-v4 source-at-common run
encoded and replayed all four polarities and returned a replay-PASS finite SAT
shadow after 889 connected candidates, 404,496 ms, and 43,556 theorem cuts. A
second schema-v4 run reconstructed the 48,978 legacy universal cuts, learned
additional cuts, and still returned a replay-PASS finite SAT shadow after 905
connected candidates, 458,029 ms, and 85,003 total theorem cuts. Thus the
registered nineteen-family incidence/order bank does not eliminate this
particular `n = 17`, closed-cap-profile `(6,8,6)`, source-at-common shadow.
This is not a Euclidean coordinate model, a universal counterexample, or Lean
closure.

The later crossed-arm QF_NRA artifacts are the incomplete ones: their
three-row metric cores omitted the anchor's unconditional four-way
`hexactRows` hypothesis. They remain useful diagnostics for those encoded
cores, but they are not coordinate models of either full crossed branch.

The fixed-role QF_NRA lane validates the stronger SAT artifact and encodes the
complete radius partition at all seventeen centers: every within-class
distance equality, every cross-class distance disequality, a similarity gauge,
and all named-point distinctness constraints. Its first metric-only target is
`UNSAT` after 50,143 ms on 2,180 atoms, before any cyclic-order constraint is
added. Z3 supplies no independently checked certificate here, so this is an
external discovery result, not Lean closure. It has not yet been reduced to a
certificate or a universal metric lemma, and the cyclic observation below is
not claimed to explain that metric-only `UNSAT` result.

A separate sound replay found that the schema-v4 SAT shadow already violates
the generic cyclic separation theorem `SurplusCOMPGBank.btw_sep`. In the live
instance the endpoints are the two cap sources and the equidistant centers are
the first apex and their common blocker. Both equalities are forced by the two
common-radius memberships and mutual source-row membership. The witness puts
the two centers on the same cyclic side of the sources, whereas `btw_sep`
forces them onto opposite sides. This invalidates that finite shadow; it is not
a direct contradiction in the live theorem, because another cyclic order may
place the common blocker between the two sources.

Production Lean now states this exact consequence as
`firstFiber_capSources_alternate_between_firstApex_and_commonBlocker`. The
schema-v5 crossed-arm encoder adds the corresponding recut- and
reversal-invariant raw-equality cut for every endpoint pair and pair of
nonendpoint centers. Its exhaustive self-check covers all 24 four-point orders
and all 120 five-point orders, including equality valuations, recuts, reversal,
and role swaps. Solver-free replay finds eight violations in the previous
witness, including the live source/source/apex/blocker instance.

The corrected schema-v5 `raw_btw_sep` source-at-common run, importing and
reconstructing the schema-v4 universal cuts, nevertheless returned finite
`SAT` after 435,815 ms: 767 candidates, 3,149 structural raw-betweenness cuts,
and 112,601 theorem cuts. Its witness cyclic order is
`a1,t2,t3,t4,t1,a2,q1,r1,p2,r2,p1,q2,a3,s1,s4,s3,s2`. That witness is not a
valid shadow of the existing production Lean metric consequences. It has
`E(a1,p2,p1)` and `E(p1,p2,a1)`, so
`Problem97.dist_eq_dist_of_mutual_bisector` gives `E(p2,a1,p1)`; together with
`E(t3,a1,p1)` and `a1 < t3 < p2 < p1`, this contradicts
`Problem97.false_of_two_centers_equidistant_pair_enclosed`. Declaration-level
axiom reports for those two theorems contain only `propext`,
`Classical.choice`, and `Quot.sound`, with no `sorryAx` or custom axiom. This is
not a global import-closure audit.

The schema-v6 encoder therefore adds the sound canonical Horn family
`mutual_bisector_transport`,
`not E(c1,q,c2) or not E(c2,q,c1) or E(q,c1,c2)`, with exactly 2,040 canonical
`(q,{c1,c2})` instances at `n = 17`, and imports the validated v5 result. No v6
survivor was produced in the first 900-second tranche: it ended
`UNKNOWN_FAIL_CLOSED` after eliminating 1,443 candidates and learning 6,382
structural cuts (5,411 raw-`btw_sep` and 971 mutual-bisector transports) plus
153,894 theorem cuts.  The final solver call was canceled by the exhausted
total budget, so this is neither `SAT` nor `UNSAT`; the validated v6 cut
checkpoint is the input to the next resume tranche. The full-radius
and lazy-v5 QF_NRA attempts both returned `UNKNOWN` at about 123 seconds;
the earlier schema-v4 metric-only `UNSAT` is historical and belongs to a
different shadow. Even eliminating the v5 witness would settle only this
finite abstraction, not the universal Lean anchor.

# Convert the conjunction packets into structures

Both

```lean
CapSourceThirdCanonicalRowSurface
```

and

```lean
CapSourceThirdCanonicalRowWitness
```

are currently long nested conjunctions. This forces repeated positional destructuring and reconstruction:

```lean
rcases hcapSource with
  ⟨hcap, source, hsourceInterior, ...⟩
```

A structure would give stable named projections and make future additions much safer:

```lean
structure CapSourceThirdCanonicalRowData
    (source : CarrierVertex D.A) : Prop where
  cap_card_ge_eight : ...
  source_mem_capInterior : ...
  source_outside_collisionPairs : ...
  blocker_ne_firstCollision : ...
  blocker_ne_secondCollision : ...
  blocker_ne_firstApex : ...
  blocker_ne_secondApex : ...
  firstPairView : ...
  secondPairView : ...
```

The row self-membership and row cardinality need not necessarily be stored if they are immediate projections of `H.selectedAt`; storing derived tautological fields makes the packet longer without increasing mathematical strength.

For a low-risk transition, add this as an additive wrapper around the existing
`abbrev` and provide equivalence constructors in both directions. Do not
wholesale change the imported single-source surface or `hglobalCapSplit` until
the new packet and its consumers compile on the live spine.

All these structures must continue to refer to the **actual full `CriticalShellSystem` support**. They must not silently replace it with a chosen four-subset carried by a common-deletion certificate; that distinction is load-bearing throughout the live interface.

# What I would not do

I would not:

* leave `false_of_capSourceThirdCanonicalRowSurface` as one monolithic `sorry`;
* replace it with the proposed `rcases` dispatch while any child still calls it;
* claim that the single-source surface alone is the contradiction;
* split its long conjunction into ten separate leaves;
* retain only one arbitrarily selected cap source when two are already constructible;
* combine the sibling `CrossBlockerCoincidence` arm into this theorem;
* create a (2\times4) explosion of eight permanent open leaves;
* treat the named sources as exhausting the carrier.

The `CrossBlockerCoincidence` arm comes from the other constructor of `TwoCollisionGlobalSplit`; it should remain a sibling theorem, not become part of a cap-source-surface theorem.

## Bottom line and acceptance gate

[
\boxed{\text{The acyclic refactor is installed; prove its three terminal leaves next.}}
]

The main objective is not another finer case split. It is a staged, acyclic
refactor:

1. freeze the current root hypotheses and publish-spine call; **done**;
2. add the two-source packet around the existing checked producer; **done**;
3. prove source-clean leaves for the strict fresh-third residual and first
  enlarged-fiber residual arms, including the normalized complement,
  retained all-endpoint omission, and one-sided cases; **the fresh-third residual is
  now a checked two-constructor router, while its two terminal leaves and the
  first enlarged-fiber leaf remain open**;
4. rewire or privatize compatibility adapters so none calls the root; **done**;
5. replace `false_of_capSourceThirdCanonicalRowSurface` with the checked
   exhaustive coordinator; **done, but transitively open through step 3**;
6. rebuild under Lean 4.27, refresh the proof blueprint, and audit the
   transitive axioms and spine before claiming closure.

Steps 3 and 6 are the active acceptance gates. The coordinator's literal
`sorry` is gone, but the publish target remains open until all three terminal
leaves are source-clean and the transitive audit passes. This does not close
the sibling `CrossBlockerCoincidence` obligation or unrelated
retained-omission cores.

The two-source strengthening and the direct distinct-cross-row terminal are
now installed. The checked fresh-third core retains both normalized
interaction packets (or the stronger all-endpoint-omission packet with its
originating first-fiber data), eliminates the
`HasDistinctCrossRows` arm, converts its complement to the positive
constructor-level `ResidualCase` interface, and dispatches through the now
source-clean residual coordinator to the two constructor-specific leaves.
The root is not closed. The latest all-endpoint/Q rewire is covered by a
successful guarded Lean 4.27 target build and refreshed proof-blueprint. The
terminal leaves remain `sorry`-backed. The subsequent source-clean five-center
bridge, production exact-row boundary, and narrowed terminal wiring pass their
respective guarded boundary-target build and direct Lean 4.27 coordinator
source check. The latest direct coordinator check also covers the compact
outside-pair exact-row normalization and passed on 2026-08-01. The crossed
constructors are now further normalized on spine to a fixed-role three-row
packet: the first collision support is fully named, and the common-source and
opposite-collision supports expose their anonymous fourth members together
with carrier membership and first-cap exclusion. The packet also retains the
two complementary cross-row omissions that the raw producer already proved.
The exact-shell API turns those omissions into strict distance
non-equalities. This preserves the same four constructor arms while giving the
metric extraction/QF_NRA stage an exact support signature; direct Lean 4.27
source checks of the strengthened shell module and coordinator passed after
rebuilding the dependency. A previous guarded Lean 4.27 build of both
`FivePointEuclideanObstruction` and `FrontierLiveClosure` also passed. This is
only a source/build checkpoint: the terminal remains `sorry`-backed and has
not passed a closing transitive proof-blueprint and axiom audit. Those gates
must be rerun after the terminal is proved before any closure claim.
