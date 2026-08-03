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

The exact-11 theorem bank does not currently close either leaf. Its fixed-card
554/profile consumers require `D.A.card = 11` and additional endpoint or cap
profile hypotheses that are absent here; the live cap-source branch instead
has a cap of size at least eight. The general-`n` pieces were audited
separately: `U5DangerousTriple.exact_radius_class_eq` is already represented by
the encoder's exact critical-support partition, while the lower bounds
`iCountAt_ge_sum_choose_two...` and `iCountAt_ge_seven...` need an independent
upper incidence budget before they can eliminate a model. The fixed A1
infrastructure and M44 packet theorem have the wrong interface, and
`U5BoundedAuditSupport` would require a support-confinement producer that this
branch does not have. Therefore no additional pinned-multiplicity constraint
is justified at this checkpoint. Likewise, the imported six-point Euclidean
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

The completed schema-v7 `source-at-common` run returned finite Boolean `SAT`
after 853,449 ms and 725 connected candidates, with 7,777 structural cuts and
183,331 theorem cuts. Its serialized witness passes semantic replay. For this
witness, the global quotient of the 136 undirected distance variables has 58
spanning-forest equality generators and 78 equality classes. The compact
basis retains 77 positivity representatives, one for each non-gauge class,
and 1,001 representatives for quotient-class pairs actually separated by the
original radius disequalities; these are not all `78.choose 2` class pairs.
The gauged lazy Z3 QF_NRA run timed out `UNKNOWN` at 24 active
radius-equality atoms. Thus there is neither a Euclidean realization nor a
metric impossibility result, certificate, universal claim, or Lean closure.
The earlier schema-v4 metric-only `UNSAT` remains historical evidence about a
different finite shadow and is not the current branch verdict.

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

A strict v6 resume subsequently returned replay-PASS finite `SAT` after
396,042 ms and 438 additional candidates. Solver-free v7 equality-quotient
replay rejects that particular v6 witness, but the completed schema-v7 run
itself returned the different replay-PASS finite Boolean `SAT` witness
described above. Consequently the global-edge quotient eliminates one
serialized survivor, not the bounded branch. The current metric follow-up is
QF_NRA `UNKNOWN` at 24 active equality atoms under the 120-second cap;
`UNKNOWN` is evidence for neither realizability nor impossibility.

## 2026-08-01 formalized metric-core replay

The next useful constraint is metric, not a new pinned-multiplicity bound.
Replaying each complete serialized radius partition through the
production-aligned formalized metric-core detector rejects both schema-v7
survivors at `equality-convex-five-point`:

* the unforced survivor expands to 208 exact radius rows and contains the
  cyclic core `(a,x,b,c,y) = (q2,r2,q1,s3,a1)`;
* the forced-shared-fourth survivor expands to 210 exact radius rows and
  contains `(a,x,b,c,y) = (a2,p2,a3,s1,t1)`.

In each case the four equalities are exactly
`xa = xb`, `ya = yb`, `cb = cx`, and `cb = cy`.  The universal production
declarations are `Census554.ConvexFivePointCore.false_of_core` and its
negative-orientation wrapper `false_of_core_of_neg`; they are import-reachable
from `FrontierLiveClosure` through `Census554.GeneralCarrierBridge`.  The finite
replay artifacts are the two
`formalized-metric-core-replay.json` files beside the corresponding v7
witnesses.  They are Python replays of complete serialized partitions, not
Lean proofs of the live arbitrary-cardinality terminal.
Focused `proof-blueprint axioms` reports for both declarations contain only
`propext`, `Classical.choice`, and `Quot.sound`; this is not yet the terminal's
transitive publish-spine audit.

Schema v8 therefore registers `convex_five_point_core` as the twenty-first
guarded theorem family.  Its equality matcher uses the global undirected-edge
closure, and its cyclic guard admits both orientations.  The exhaustive guard
check covers all 120 linear orders and rejects exactly five rotations in each
orientation; the v8/v6 checkpoint migration and all 21 theorem-cut families
pass the round-trip self-check.

That resume is now complete.  The forced-shared-fourth v8 run returned finite
Boolean `SAT` after 188 replay-PASS candidates and 280,163 ms, despite learning
513 `convex_five_point_core` cuts.  Its complete partition expands to 204 exact
radius rows and survives all 21 production-aligned metric-core detectors.  A
separate exhaustive matcher also finds no embedding in any of the six
`AlgebraicRowCollisionAlternative` branches.  In particular, the smallest
previously unregistered fallback, the five-label equilateral-bisector core,
does not occur in this survivor.  Thus there is no currently import-reachable
production theorem to wire for it.

The survivor's fixed crossed shell is
`bp = q2 : {a1,t2,p1,p2}`,
`bq = r2 : {a1,q1,q2,s1}`, and
`br = p1 : {t2,r1,r2,s1}`, with common and opposite fourth both `s1`.
The provenance-checked v8 QF_NRA adapter encodes all 2,180 full-radius metric
atoms.  Both the direct metric solve and an equisatisfiable compact-basis lazy
solve returned `UNKNOWN` at the 300-second bound; this is evidence in neither
direction.  The lazy run localizes the solver hardness to a 16-equality active
prefix, before any disequality or convex-order atom is added.  That prefix is
now the algebraic/numerical extraction target.  Any resulting contradiction
still needs a general-cardinality Lean statement and proof before it can close
the crossed leaf; an external finite `UNSAT` alone would not do so.

The first exact extraction from that survivor is now available.  A bounded
algebraic miner found a deletion-minimal six-point, nine-squared-distance
equality core on `a1,a2,p2,q1,r1,t1`; after the valid similarity gauge
`a1 = (0,0)`, `r1 = (1,0)`, Singular proves that its characteristic-zero ideal
is the unit ideal, independently corroborated by msolve.  More directly useful
for Lean, the complete witness is inconsistent already in linear distance
arithmetic: sixteen radius equalities together with eight main and two
complementary Kalmanson inequalities have an exact integer Farkas certificate
whose distance coefficients cancel and whose strict margins sum to the
contradiction `0 ≥ 15`.  Z3 and cvc5 independently report `UNSAT`, and a
solver-free rational replay verifies the certificate.  These are exact
external results for one fixed CEGAR witness, not a proof of the live leaf.

The first two production steps are now complete.  The source-clean theorem
`CapCrossingKalmansonBridge.false_of_fourteen_ccw_sixteen_shell_equalities_global_core`
in `ATail/KalmansonSixteenEqualitySchema.lean` formalizes the fourteen-role core
with the exact sixteen equalities, eight main Kalmanson inequalities, and two
complementary inequalities.  Its public interface now accepts either the
direct increasing boundary chain or the reflected decreasing chain after a
cyclic recut; separate source-clean helpers prove both orientations, preventing
the guarded Python matcher's reflection symmetry from outrunning the Lean
consumer.  The proof closes with `linarith`, contains no `sorry`, and passes a
focused Lean 4.27 check.  Its transitive axiom set is the standard
`propext`, `Classical.choice`, and `Quot.sound`, with no `sorryAx`.
`crossed_arm_cegar.py` registers the matching guarded family
`global_kalmanson_14role_16eq` in schema v9/v7.  Its smoke,
roundtrip, rotation/reflection, noncyclic-transposition, and missing-equality
guards pass, and serialized replay confirms that it kills the v8 witness.
`FrontierLiveClosure.lean` imports the new theorem module, so the declaration
is production-import-reachable.  It is not yet a transitive dependency of a
publish theorem; that happens only when the exhausted-run materializer consumes
it.  A focused check of the coordinator succeeds; the ordinary Lake target
build is presently blocked before this module by the independent
`WitnessPacketInterface`/`PinnedMultiplicity` import cycle.

The immediate route is now to resume exhaustive CEGAR from the v8 checkpoint.
Each killed witness must still be covered by a source-faithful generic theorem
family; only an exhausted enumeration plus its checked materializer can feed
the live crossed terminal.  The smaller order-free algebraic core remains a
second candidate family once an explicit Lean-suitable polynomial certificate
has been extracted.

The first schema-v9 resume tranche is complete but not exhausted.  An initial
production-wrapper bug rejected the genuine v8/v6 checkpoint even though the
low-level migration self-check passed; `restore_learned_cuts` now admits the
current v9/v7 pair and its immediate v8/v6 predecessor, and a regression calls
that real file-based wrapper rather than only the lower-level helper.  Replay
of the actual checkpoint reconstructed all 203,687 guarded cuts (8,313
structural and 195,374 theorem cuts).  The subsequent 600-second solver tranche
processed 378 connected candidates, banked 285 further structural cuts and
10,054 further theorem cuts, and ended `UNKNOWN_TIMEOUT` with no uncaught
witness.  This is monotone search progress, not `UNSAT` and not Lean closure.
Check times did not grow across the tranche (the final fifty averaged less than
the first fifty); the dominant avoidable cost is the roughly four-minute
checkpoint reconstruction.  Restore-local exact-expression memoization now
preserves cached/uncached Z3 `sexpr`s and all fixture roundtrips.  On the real
second-v9 checkpoint it reconstructed 9,082 structural and 228,898 theorem
cuts in 79.027 seconds after base-audit construction, reducing that learned-cut
phase by roughly a factor of three without changing formulas.  Later resumes
should still use longer solver windows to amortize this exact load.

The second source-at-common tranche resumed the first v9 result for an
1,800-second solver window.  It processed 947 further connected candidates,
added 484 `raw_btw_sep` structural cuts and 23,470 theorem cuts, and found no
uncaught witness.  Z3 returned `unknown` with reason `canceled` at the exact
deadline, so the runner correctly recorded `UNKNOWN_FAIL_CLOSED`; this is still
neither `UNSAT` nor Lean closure.  The accumulated source-at-common checkpoint
now contains 9,082 structural and 228,898 theorem cuts.

Every completed CEGAR wave now has a mandatory universal-theorem review before
another wave begins.  Launch a bounded subagent for a global indexed-Lean and
theorem-bank pass, in addition to comparing the result checkpoint with its resume input,
cluster fresh witnesses and learned keys up to the encoder's proved symmetries,
and ask whether any recurring exact incidence/metric core can be stated without
the finite-search bound.  Classify each candidate as a genuinely new
general-cardinality theorem, an instance of an existing theorem-bank family, or
fixed-witness evidence only.  Search the indexed Lean corpus once with an
agentic natural-language query for each plausible new statement; after one
substantive miss, write the lemma instead of continuing broad theorem search.
Record a short report even when the result is “no new universal candidate.”
This review does not turn an `UNKNOWN`, external `UNSAT`, or fixed-witness core
into Lean closure.

The required global pass for the second v9 tranche is recorded in
`crossed-arm-audit/V9_WAVE_UNIVERSAL_CANDIDATES.md`.  It found no credible new
general-cardinality theorem: all 23,470 fresh theorem keys instantiate the 21
already registered families, all 484 fresh structural keys instantiate
`raw_btw_sep`, and the new fourteen-role Kalmanson family matched zero times.
The pass did identify 712 exactly subsumed selected-row cuts: 495
`six_sparse_two_selected_rows` keys are redundant when the corresponding
`six_sparse_row_equalities` cut is present, and 217
`five_kalmanson_three_selected_rows` keys are redundant under the corresponding
`five_kalmanson_three_shell_equalities` cut.  Suppressing those exact pairs is
a fidelity-preserving encoder optimization, not a new theorem or closure.  The
same exact normalization removes 6,195 keys from the complete checkpoint,
reducing its theorem formulas from 228,898 to 222,703.  It preserves the v9/v7
schemas and serialized key format, rejects mismatched guards or point tuples,
and retains non-subsumed selected-row keys.  The focused self-check reports
`SMOKE_OK` and `EXACT_SUBSUMPTION_OK`, including strict implication, insertion
order independence, and the legacy selected-first/raw-later retirement case.

The much larger assertion count has a second exact representation-level
compression.  The 371,280 clauses in
`critical_no_K4_after_source_deletion` are precisely the negative-triple CNF
expansion of one guarded at-most-two constraint for each eligible
`(source, center, anchor)`.  The compact unit-weight `PbLe` representation has
3,264 assertions at `n = 17`.  An exhaustive Boolean check over all 32,760
assignments for tail sizes 3 through 14 proves equivalence to the legacy
triple clauses; constructing the two complete `n = 17` base encodings took
31.326 seconds and 2.631 seconds respectively.  Both representations remain
selectable.  After the live compact-arm benchmark below, `compact-pb` became
the new-run default.  A separate immutable legacy constant ensures that v9/v7
checkpoints omitting both metadata fields still mean `triple-clauses`;
explicit top-level/manifest conflicts reject, and restore records both source
and target representations.  This is an exact encoding optimization, not a
stronger mathematical constraint or closure progress.

That live benchmark has now passed on the source arm.  Restoring the complete
legacy checkpoint into the compact model normalized 38,707 exact-orbit keys
and 6,195 selected-row/raw-equality keys, leaving 183,996 theorem formulas.
The resulting model had 352,325 total assertions rather than the previously
recorded roughly 765,214.  Its first solver check returned `sat` in 8.220
seconds; the candidate was processed normally and added three structural and
26 non-suppressed existing-family theorem cuts (27 matches before one exact
selected-row suppression).  The runner then stopped at the requested one-
iteration limit with `UNKNOWN_ITERATION_LIMIT`.  This validates live
restore/check/matcher compatibility of the compact representation; it remains
non-exhaustive and supplies no closure evidence.

The subsequent full compact source continuation did reach a matcher fixed
point, but not exhaustion.  It processed 1,197 connected candidates and ended
with a replay-validated `SAT` survivor, 9,488 structural keys, and 205,225
canonical theorem keys.  No registered family matched the survivor, so simply
extending the timeout under the same 22-family schema cannot make progress.
The mandatory global pass in
`crossed-arm-audit/COMPACT_SOURCE_V9_SAT_WAVE_UNIVERSAL_AUDIT.md` confirms that
all fresh keys are existing-family instances and that no banked theorem closes
the survivor.

The next route is therefore a new universal equality theorem, not another
bulk cut tranche.  The full 17-point QF_NRA replay contains 2,180 metric atoms
and timed out `UNKNOWN` after 300 seconds.  Exact induced-core mining found a
seven-point subsystem with eleven squared-distance equalities and closure-
class sizes `5,3,3,2,2,2`.  Singular over characteristic zero proves the
gauge-fixed ideal is the unit ideal, and msolve agrees in both variable
orders; Z3 and cvc5 remain `UNKNOWN`.  The existing production signature
matcher and one exact indexed-Lean search find no match.  The universal
strengthening to prove is that these eleven equalities force the two gauge
anchors to coincide.  Only after that Lean theorem and a sound generic
`EdgeClosure` occurrence matcher are installed should the source CEGAR arm be
resumed.  A fixed witness match or external algebraic `UNIT` result alone does
not license a production cut or close the terminal.

The production implementation has since narrowed the kernel frontier further.
`CrossedArmSevenPointEuclideanObstruction.lean` now contains the normalized
metric theorem, the exact eleven-atom injective adapter named by the matcher,
and the `EqualityCore` realization bridge.  The independent matcher oracle,
all eleven single-atom mutation checks, and the declaration gate pass (six
focused tests).  The geometric terminal no longer needs the auxiliary `G7`
and `G39` elimination consequences: retaining the conjugacy of the normalized
point `V` lets the single `G3` consequence force `R = V`, after which the
original distance equation gives the forbidden normalized endpoint.  Thus the
only deliberate non-compiling term in this new theorem is the producer for
`G3`.

The exact global Buchberger ancestry for `G3` is checkpointed but is about 178
MB and therefore fails the aggregate-tractability gate.  Direct reflection is
also rejected: the available exact coefficients retain multi-megabyte entropy,
and the `MvPolynomial` carrier is not executable for `native_decide`.  The
current extraction route is instead the stronger localized contradiction that
matches the Lean branch exactly, under the already proved nonzero hypotheses
`bu - bs != 0`, `br - bv != 0`, `bv != 0`, and `bw != 0`.  No new CEGAR round
may start until that localized certificate is kernel checked.  Completing the
seven-point theorem will unlock, but will not by itself close, the live
terminal: the source arm must then be rerun, globally theorem-audited, replayed,
and wired through the Lean 4.27 spine and transitive axiom gate.

The localized search has now produced an exact characteristic-zero
product-unit identity in the best variable order `(t,bv,bs,bw,x,y)`:
`x*y*bv*bw*t - 1` together with the six branch polynomials reduces to `1`.
The Singular audit reports 3,355 multiplier terms (the prior order reported
10,731), with an independently checked identity.  This is a certificate
candidate, not yet a Lean artifact: the emitted rational multipliers are still
too large for an unstructured one-shot `linear_combination`, so the next
promotion step is a factored or staged kernel-checkable translation.  The
exact staged DAG remains live as a second extraction route.

The preferred exact artifact is now the localization-free square certificate
`scratch/atail-force/same-blocker-common-omission-euclidean-v3/theorem-bank-cegar-audit/crossed-arm-qf-nra-v4/metric-core-miner-v9/localized-g3-product-square-certificate-exact-v1.singexpr`.
With `x = bu - bs` and `y = br - bv`, its six exact rational multipliers satisfy
`D1*e2 + D2*e5 + D3*e7 + D4*e8 + D5*e9 + D6*q1 =
(x*y*bv*bw)^2`; the independent Singular replay has zero residual terms.
The artifact is externally exact (SHA-256
`36d337d0235e2a5d00c03a1a6ea433b1f3a8d58222c160a1b545a834e3bae64a`) but is
not yet kernel evidence.  It still has 3,353 multiplier terms, so promotion
must use a factored/staged Lean helper rather than silently importing the
multi-megabyte expression.  Until that helper compiles under Lean 4.27, the
`G3` producer remains the sole deliberate blocker in the seven-point shard.

The q-branch has since yielded a smaller exact target.  The existing
`verify-generic-factor-branches-q.sing` audit proves, over characteristic zero,
that `e2,e5,e7,e8,e9,q1` imply
`br * bs^2 * bw^2 * (bv - 1)^2 = 0`.  This target contradicts the already
available nonzero hypotheses directly and is now preferred to the `G3`
square route.  A direct Lean automation attempt did not close the implication
within the configured matching/ring limits, so an exact Singular lift is being
staged for a small kernel-checkable helper.  Until that lift and its Lean 4.27
consumer compile, neither the q-branch nor the seven-point producer is closed;
the square certificate above remains a recorded, externally checked fallback,
not a promoted proof artifact.

There is also an exact cyclic-orbit duplication among learned theorem cuts:
`reversed_second(q0,q1,q2,q3,q4)` is the same guarded formula as
`first(q4,q0,q1,q2,q3)`.  All 38,707 live-v9 keys in each family pair under
that rotation, with no unmatched keys.  The encoder now canonicalizes that
orbit only after checking arity, distinct in-range points, cyclic guard and
orientation, and row signature; unproved or malformed matches are retained
fail-closed.  Restore, import, live insertion, and both insertion orders now
assert one canonical `first` formula.  This removes 38,707 assertions from the
source checkpoint (and all 41,640 from the accumulated other-arm checkpoint),
about 5.1 percent of the pre-compression total, without changing the accepted
schema/family manifest.

The first `other-at-common` tranche imported the normalized source checkpoint
(9,082 structural and 222,703 theorem cuts after suppressing 6,195 exact
redundancies) and ran for 1,800 seconds.  It processed 871 connected
candidates, added 346 structural and 18,418 theorem cuts, and ended with 9,428
structural and 241,121 theorem cuts.  The last solver call returned `unknown`
with reason `canceled`, so the recorded status is correctly
`UNKNOWN_FAIL_CLOSED`; this is not exhaustion, `UNSAT`, or Lean closure.  The
global fourteen-role family again matched zero times.  Its mandatory global
theorem-bank review is recorded in
`crossed-arm-audit/OTHER_AT_COMMON_V9_WAVE_UNIVERSAL_CANDIDATES.md`.  It found
no new universal/general-cardinality candidate: all fresh theorem cuts are
instances of existing families and the 346 fresh structural cuts are
`raw_btw_sep`.  It also confirmed that the 2,933 fresh `reversed_second` keys
are exact rotations of fresh `first` keys.  One agentic search for the
strongest remaining arbitrary-packet classifier and the required sibling and
legacy registry pass found no reusable theorem.

A source-to-Lean registry audit found that all 22 theorem-cut families have an
exact mathematical producer, but six promotion interfaces needed repair.  Four
Kalmanson entries named the obsolete `Problem97.CapCrossingKalmanson`
namespace; the five-point convex family named only its positive-orientation
half despite a dihedral guard; and the six-point two-`K2` family named a theorem
in an explicit `Scratch` namespace.  The namespace metadata is corrected,
`ConvexFivePointCore.false_of_core_of_common_orientation` now dispatches both
strict orientations, and
`CapCrossingKalmansonBridge.false_of_six_ccw_two_k2_three_selected_rows`
provides the cardinality-generic production six-point proof.  Both new Lean
theorems pass focused Lean 4.27 checks with transitive axioms exactly `propext`,
`Classical.choice`, and `Quot.sound`.  This repairs the theorem-family producer
registry; it does not discharge the separate decoder-level obligations for the
base CNF or the five structural clause families.

Both crossed orientations must presently be exhausted and certified.  This is
not a removable labeling symmetry in the live interface:
`FreshOutsideFirstBlockerFiber.blockers_eq` is supplied only for `source`, while
`otherOutsidePoint` has no corresponding blocker equality.  The existing
`FreshOutsideSecondBlockerFiber.toSwappedFirst` swaps the collision rows but
preserves the source/other roles, and the producer, exact-support normalizer,
coordinator, and CEGAR encoder all retain the two orientations separately.  A
single-arm certificate would suffice only after proving the new geometric fact
that `otherOutsidePoint` has the same blocker as the first source; no current
source or theorem-bank entry supplies that fact.  Thus the materialization
route must cover both `source-at-common` and `other-at-common`, unless that
specific blocker-equality lemma is proved first.

The replay back end itself does not need to be redesigned.  The production
modules `Certificate/CheckpointedRup.lean`,
`Certificate/CheckpointedRupCompact.lean`,
`Certificate/CheckpointedRupCompactBoundary.lean`, and
`Certificate/CheckpointedRupSemanticBoundary.lean` already provide the
two-shard checkpoint composition, compact CPF1/CPA1 decoding, and the generic
signed-DIMACS satisfaction boundary.  Their action language has no RAT
constructor, and both the Python materializer and compact decoder reject RAT,
malformed hints, and trailing data fail-closed.  The generated window proofs
use `native_decide`, so the accepted trust profile is compiler-trusted Lean
closure with `Lean.trustCompiler`, not compiler-independent kernel closure.

The reusable scratch implementation consists of
`materialize_checkpointed_rup.py`, `materialize_windowed_rup.py`, and
`emit_compact_windowed_rup_replay_package.py` under
`scratch/atail-force/unique4-exact-two-lrat-ingress/`, together with their
same-named tests.  Promotion must parameterize the currently fixed replay
namespace/module prefix and remove hard-coded source schemas, scratch-depth
checker paths, and scratch provenance.  Build runners, text emitters, and the
attester are not dependencies of the compact route.  Consequently the first
missing implementation is the deterministic crossed-arm CNF/source-certificate
exporter, not another RUP checker.

That exporter must be a direct deterministic Boolean encoding, not Z3's
generic `tseitin-cnf` tactic.  The live model contains bounded integer cyclic
positions and an uninterpreted global edge-length class sort; generic tactic
CNF would merely Boolean-abstract those theory atoms unless their consistency
were encoded separately.  Use intra-block strict-order variables with total-
order clauses for the movable cyclic positions, canonically defined
strict-between auxiliaries, and one propositional edge-equivalence relation
whose transitivity clauses model the global length-class equality.  The
manifest must distinguish this semantic Booleanization from the current Z3
research model and bind every variable/clause family and learned-key origin.

The first exporter slice is now implemented in
`scripts/crossed_arm_cegar_v9_encoding.py` and
`scripts/materialize_crossed_arm_cegar_v9.py`, with adversarial tests in
`scripts/test_materialize_crossed_arm_cegar_v9.py`.  It emits deterministic
DIMACS, variable, clause-provenance, canonical learned-cut, and manifest
artifacts.  Both discovery representations normalize to the same direct
negative-triple Boolean semantics.  Verification regenerates the complete
ledger from canonical learned keys rather than trusting coordinated artifact
digests; CNF, provenance, alias, learned-key, and source-substitution tampering
tests reject.  Standalone verification is explicitly source-unauthenticated,
while authenticated status requires an external checkpoint `Path` whose bytes
and normalized cuts the verifier rereads itself; fabricated prevalidated
objects cannot receive that status.  Twenty-two bounded/adversarial tests and
an independent acceptance audit pass.

For the legacy source checkpoint the authenticated input-formula package has
89,152 variables and 1,224,020 unique clauses, with CNF SHA-256
`6a6257624904869b908980f6548825418efa71a2e67ec62b8878a383ab73cc88`.
The later compact one-candidate checkpoint has the same 1,023,270-clause base
and 89,152 variables, but cut normalization plus 29 genuinely fresh keys gives
1,217,857 unique clauses and CNF SHA-256
`e00fc35916ad54f6c0a24bf2b81ea1f0cdd2de8d6bc0e42c05f6a4b271e3bd27`.
Both verify only as input formulas; neither package contains a SAT witness,
`UNSAT` proof, LRAT/RUP evidence, or Lean semantic-bridge closure.

If an arm reaches Boolean exhaustion, promotion follows this checked route:

1. Add `scripts/materialize_crossed_arm_cegar_v9.py` to emit a canonical
   DIMACS formula from the exact arm encoder and its validated guarded-cut
   checkpoint.  The manifest must bind the arm, encoder/cut schemas, all input
   digests, variable map, clause-family counts, and final CNF digest.
2. Use the now-promoted generic scripts
   `materialize_checkpointed_rup.py`, `materialize_windowed_rup.py`, and
   `emit_compact_windowed_rup_replay_package.py`.  Their exact
   `p97-pure-rup-source-v1` ingress hash-binds the source manifest, CNF, and
   normalized LRAT; they reject RAT or malformed references fail-closed and
   emit bounded replay windows.  The 18 focused tests pass.  A crossed-arm
   adapter must still authenticate the encoder checkpoint and stage an actual
   pure-RUP proof before these tools can be applied.
3. Put generated Lean packages under
   `ATail/CrossedArmCegarCertificate/Generated/{SourceAtCommon,OtherAtCommon}/`.
   They may depend only on production source and committed generated payloads,
   never on `scratch/`, `vendor/`, or a historical Lean tree.
4. Add `ATail/CrossedArmCegarEncoding.lean`, defining the packet-induced
   Boolean valuation and proving every parsed base, structural, and guarded
   theorem-family clause.  Digests, Python replay, and an external `UNSAT`
   result do not replace this semantic bridge.
5. Add `ATail/CrossedArmCegarCertificate.lean` to compose the generated windows
   with `CheckpointedRup.CompactBoundary.startUnsatisfiable`, transfer packet
   satisfaction using
   `CheckpointedRup.SemanticBoundary.entails_formula_of_signedClauses_sat`, and
   expose one source-clean contradiction theorem per arm.  Wire both into
   `false_of_capSource_firstFiber_crossedThreeRowExactSupports`.
6. Accept closure only after the focused and full Lean 4.27 builds, refreshed
   proof-blueprint spine, and transitive axiom audit pass.  `native_decide` and
   its permitted `Lean.trustCompiler` boundary are allowed, but `sorryAx`,
   scratch imports, unchecked RAT, and an `UNSAT_UNCERTIFIED` status are not.

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

## 2026-08-01 constructor-frontier refinement

The former mixed terminal
`false_of_capSource_firstFiber_collisionFiveCenterDeletion` is now a
source-clean two-constructor coordinator.  Its literal `sorry` was replaced by
exactly two load-bearing leaves:

* `false_of_capSource_firstFiber_outsidePairDeletionExactRows`; and
* `false_of_capSource_firstFiber_crossedThreeRowExactSupports`.

This is not a mechanical split into the four collision-endpoint deletions or
the raw two-deletion/two-crossed orientation cases.  The deletion leaf is
generic in a deleted point proved to be one of the two named first-row
off-cap points and receives its complete
`FiveSurvivorExactRowsBoundary`.  The crossed leaf is generic in the two
orientations and receives the complete fixed-role three-row support packet.
Both retain the independent four-way
`FirstFiberCollisionFiveCenterExactRowsResidual`.  The parent proves the two
orientation disjunctions and dispatches all four raw constructors to these two
leaves.  Thus the coordinator-interface frontier changed from one mixed
obligation with an implicit immediate fan-out of four to two explicit
constructor obligations with immediate fan-out two.  Each new leaf has
strictly stronger, parent-produced hypotheses and is transitively consumed by
the same publish target.  A direct Lean 4.27 source check of
`FrontierLiveClosure.lean` exits successfully after the rewire; this is not a
full-build, refreshed-blueprint, or transitive-axiom closure claim.

The theorem-bank audit fixes the first missing bridge for each leaf:

1. The deletion leaf already has the exact
   `U5QDeletedK4Class` row type used by the general-n U5 bank, but it exposes no
   positive cross-row incidence.  The closest three-row tetrahedron consumer
   already fails at its first membership `y ∈ Bx`.  The closest five-row
   consumer additionally requires a dangerous-triple classifier, two
   q-critical triple rows, and twelve positive incidences.  Those sibling-bank
   declarations are not currently present or import-reachable in this Lean
   tree, and copying them would still leave the positive producer open.
2. The crossed leaf has three exact selected supports and both complementary
   omissions.  No current or registered theorem unconditionally produces a
   shared fourth occurrence.  The smallest incidence bridge is
   `crossedRows.commonFourth ∈ oppositeRow.support` (equivalently, but more
   weakly than, equality of the two anonymous fourth points).  A shared
   occurrence does not by itself leave only a generic cyclic-recut adapter.
   Coarse center/support block separation (`CCC|SSS`) plus the three row
   equalities admits the strict-convex cyclic configuration
   `C=(-2,-1), A=(0,-2), B=(2,-1), V=(1,1), X=(0,2), U=(-1,1)`, with
   `|A-U|²=|A-V|²=10`, `|B-U|²=|B-X|²=13`, and
   `|C-V|²=|C-X|²=13`.  Its consecutive turn determinants are
   `4,5,1,2,1,5`.  The remaining producer must therefore consume additional
   five-center exact-row geometry to eliminate the realizable cyclic phase
   and prove the exact direct or reflected six-role order, or derive a direct
   crossed-row metric contradiction.  The generic consumers themselves are
   cardinality-independent and source-clean; the card-11 decoder adapter is
   not reusable because it assumes `D.A.card = 11`.

The first source-clean blocker-map extraction for the crossed leaf is now in
production Lean.  Both anonymous fourth points have actual blocker distinct
from the first collision blocker.  Moreover, support locking proves both
cross directions:

* if `crossedRows.oppositeFourth` has the common source blocker, then it equals
  `crossedRows.commonFourth`; and
* if `crossedRows.commonFourth` has the opposite collision blocker, then it
  equals `crossedRows.oppositeFourth`.

Thus either cross-blocker equality supplies the previously missing shared
occurrence without an extra incidence assumption.  This does **not** prove
that either equality holds.  The honest remaining producer is a finite
blocker-map saturation/classification theorem forcing one of these cross
equalities, or else a direct metric contradiction in the complementary arm.
A single fourth point with blocker distinct from the two named collision
blockers is not a `FreshThirdBlockerFiber`: that packet requires a second,
distinct source with the same blocker.  The existing fresh-third terminal is
also downstream through this crossed leaf, so routing through it here would be
cyclic.  The new extraction and its downstream deduplication pass a direct
Lean 4.27 source check of `FrontierLiveClosure.lean`; this remains short of a
full build, blueprint refresh, or transitive-axiom closure gate.

Accordingly, the concrete closure route is now:

```text
checked four-way outside-pair producer
  -> checked two-leaf coordinator
     -> deletion leaf:
          positive survivor-row occurrence/classifier
          -> general-n U5 incompatibility
     -> crossed leaf:
          cross-blocker equality / saturation classifier
          -> shared occurrence (or a stronger direct crossed-row consumer)
          -> five-center phase elimination
          -> exact direct-or-reflected six-role order
          -> generic Kalmanson incompatibility
  -> former anchor coordinator
  -> existing cap-source and publish coordinators
```

The acceptance gate is to prove both leaves, run the Lean 4.27 target/full
build as appropriate, refresh the autogenerated proof blueprint, and verify
the transitive axiom profile.  Closing the former mixed theorem syntactically
does not yet close a production obligation because its two descendants are
still open.

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

## 2026-08-02 producer checkpoint

The post-G3 semantic tail has now been isolated and kernel-checked in
`scratch/q1_g3_tail.lean`: from
`(bu - bs) * (br - bv) * bv * bw = 0`, the q1, e7, e8, and e9 equations
successively force `bu = bs`, `bw = bs`, `bv = bs`, `bs = 1`, and then
`(br - 1)^2 = 0`. This is a scratch proof only; it is not yet wired into the
production coordinator.

The exact characteristic-zero square certificate
`localized-g3-product-square-certificate-exact-v1.singexpr` remains
externally verified (zero Singular residual, 3,353 multiplier terms). A
mechanical Lean translation parses, but the unstructured rational definitions
hit deterministic `whnf` heartbeat exhaustion at 12,000,000 heartbeats after
roughly 22 minutes. It is therefore `UNKNOWN`/resource-blocked, not kernel
evidence, and must not be promoted as-is.

The current computational route is an exact staged reconstruction of the
stronger q-branch consequence
`(bu - bs)^8 * bv^2 * bw ∈ (e2,e5,e7,e8,e9,q1)`, which would yield `bu = bs`
under the already available nonzero hypotheses without the large G3
multiplier. Finite-field discovery alone is insufficient; promotion requires
an exact characteristic-zero certificate and a Lean 4.27 scratch check.

## 2026-08-02 certificate correction

The first shifted Singular report was invalid: its `e2` substitution omitted
the `x` contribution in two `br * bu` terms.  Its reported 57-element basis,
single-row lift, and 3,685-term reconstruction are stale and must not be used.
The corrected QQ run passes an explicit source/substitution consistency check,
reduces the target to zero, and reports a 61-element basis with 55 nonzero
lift rows (1,100 coefficient terms).  A variable-order probe found a shorter
439-term *basis lift* in order `(br,bs,bv,bw,x)`, but that is still only a
component decomposition and not a standalone certificate; composing it back
to the six shifted generators produced no compact Lean-facing identity.  No
kernel-checked producer or production wiring follows from these runs.  The
corrected metrics are recorded in
`scratch/q1-power-search/compact_shifted_relation.txt` and
`scratch/q1-power-search/x_subst_qq_corrected.out`; the older
`scratch/q1-power-search/REPORT.txt` is explicitly marked stale.

## 2026-08-02 spine-reachability correction

The indexed theorem search does find the exact source-clean crossed-arm
consumer in `ATail/CrossedArmSevenPointEuclideanObstruction.lean`:
`crossed_arm_seven_point_collision` and its
`not_realizes_of_crossedArmSevenPointCollisionCore` equality-core bridge.
That result is a reusable banked theorem, but it does **not** currently count
for the live closure. A read-only import/call-graph audit found that the two
crossed-arm modules are only connected to each other; no production module
imports either one, and the live
`false_of_capSourceThirdCanonicalRowSurface` spine still reaches the three
sorry-backed terminal leaves listed above. The source index also has no
crossed-arm declarations because these files are unbuilt/uncommitted.

Therefore the crossed-arm route is presently an off-spine candidate, not a
closed sorry. To make it count, first add a production import edge (preferably
through a dedicated adapter), then prove a packet-to-eleven-equality-core
adapter for one terminal leaf. Importing the module alone is insufficient, and
even a successful adapter would leave the other two terminal leaves open. The
universal polynomial `q1EqZeroG7` remains unproved/resource-blocked; the
source-clean geometric theorem must not be described as a kernel closure of
the live root until its packet adapter and transitive spine wiring are both
checked.

The follow-up global indexed-bank pass also found no theorem that forces a
cross-blocker equality from finite saturation alone. Existing declarations
only provide equality-or-residual-avoidance dichotomies (or force equality
after an equated-blocker hypothesis). The missing producer is therefore still
the finite residual classifier or a direct metric contradiction, not a wiring
alias to an existing bank theorem.

## 2026-08-02 direct-lift and subset checkpoint

An exact QQ Singular lift of the target
`(bu - bs) * (br - bv) * bv * bw` against the six original generators
`(q1,e2,e5,e7,e8,e9)` is now audited directly.  The target is a reduced
Groebner-basis element, but the direct six-row lift has 5,038 coefficient
terms, roughly 5.2 million coefficient characters, and no practical Lean
translation path.  This is external algebra evidence only.

A four-generator auxiliary subset (`U8,U24,U32,U34`) gives the same target in
the scratch theorem `q1_g3_subset_test.lean`; the earlier cached run reported
exit 0, but a fresh rerun and the full adapter theorem were killed with exit
137 under current host memory pressure.  The adapter identities themselves
are short `linear_combination` steps, and the post-target semantic tail is
already kernel-checked in scratch.  Until the subset theorem recompiles
independently under the current Lean 4.27 environment and is moved behind a
production import/geometry adapter, this remains a promising route rather
  than a closed producer or a closed sorry.

### 2026-08-02 latest global theorem-bank check

The latest agentic Lean-corpus search was run against the remaining enlarged-
first-fiber leaf and its one-sided branch.  It found only the already-indexed
compatibility adapters (`false_of_twoCapSources_oneSidedDeletionSurvival` and
the first-fiber coordinator) plus the exact membership characterization
`mem_outside_qBlockerFiber_iff_frontierDeletion_survival`.  A second search for
a contradiction from `SixCenterDeletionSurvivalPacket` likewise found no
source-clean terminal: the indexed five-center boundary explicitly treats the
sixth actual blocker as blocked rather than as a sixth surviving row.

Conclusion: the latest round has a completed global theorem-bank audit, but it
did not produce a reusable producer for the one-sided leaf.  The leaf still
needs a new terminal or a checked finite incidence classifier; adding another
adapter would not improve the proof spine.

## 2026-08-02 V21 FreshThird residual bank checkpoint

The bounded V21 probe added explicit selectors for the two fresh source labels
and the unordered `Q` pair, then ran the equal-center, same-blocker, and
omission residual modes separately.  All three 60-second external-Z3 runs
ended `UNKNOWN`/`canceled`; none produced an UNSAT core, Boolean cut, model,
finite coverage result, or Lean ingress.  The exact run records and trust
boundary are in
`scratch/retained-omission-e1/round5-general-cegar/V21-FRESH-RESIDUAL-PROBE.md`.

The required post-round global theorem-bank audit is recorded in
`scratch/retained-omission-e1/round5-general-cegar/V21-GLOBAL-THEOREM-BANK-AUDIT.md`.
All three local theorem-bank registries contain zero declarations matching
FreshThird/NormalizedResidual/equal-center/same-blocker/common-endpoint
producers, and the indexed Lean search found only existing helpers or generic
unrelated consumers.  Therefore V21 is a documented computational NO-GO, not a
closure or a reusable source-clean bridge.  The live normalized-residual
`sorry` remains the next direct proof target; the next admissible route must be
a new incidence/metric producer or a materially smaller incremental classifier.

### V21 fidelity correction and n≥17 handoff

The V21 result must not be read as evidence about the full live packet.  Its
base script fixes the relaxed exact-`n=15`, `(6,6,6)` cap profile and labels the
two selected cap sources from a four-point interior.  The production witness
has `cap_card_ge_eight`, so the minimum live size is `n≥17`; it also requires
both selected sources to lie in the same indexed cap interior, to avoid all
four collision endpoints, and to carry exact selected-four support and
deletion-survival data.  V21 does not encode those conditions.  Its NO-GO is
therefore only a bounded-relaxation search result, not a satisfiability or
impossibility statement for the live theorem.

The post-round inventory
`scratch/retained-omission-e1/round5-general-cegar/N17-ENCODER-INVENTORY.md`
confirms that no existing scratch encoder contains all of these n≥17 fields.
The faithful computational handoff is consequently an explicit n=17
`(6,8,6)` model (or a uniform n≥17 model) with the cap-source, endpoint-
exclusion, exact-support, and deletion-survival predicates represented before
any new CEGAR run.  Until that model exists, do not spend another round on the
V21 n=15 relaxation or promote its cuts into the theorem bank.

## 2026-08-02 n>=17 faithful-model and bank-search checkpoint

The first repaired concrete n=17 `(6,8,6)` incidence probe is now available
at `scratch/retained-omission-e1/round5-general-cegar/n17_freshthird_incidence_probe.py`.
Two encoding defects found during staged checking were corrected: the named
apex indices now follow the actual carrier labels, and selector projections
use implications rather than forcing every Q selector simultaneously.  The
row-cap selector is deliberately an abstract geometric-center cap label and
is no longer identified with carrier-vertex cap membership.

The repaired model is SAT for each normalized residual arm
(`firstNonHit`, `secondNonHit`, and `equalCrossRowCenters`).  This is bounded
external incidence evidence only; coordinates, QF_NRA realization,
cyclic/Kalmanson constraints, CEGAR cuts, Lean ingress, and general-n
quantification remain absent.  It is therefore a diagnostic NO-GO for an
incidence-only closure route, not a theorem or a counterexample to the Lean
statement.  The run record and trust boundary are in
`scratch/retained-omission-e1/round5-general-cegar/N17-FRESH-THIRD-INCIDENCE-ROUND1.md`.

The post-round global theorem-bank audit is
`scratch/retained-omission-e1/round5-general-cegar/LATEST-GLOBAL-BANK-AUDIT.md`.
It confirms that no new n>=17/general-n certificate was banked, all three
mandatory theorem-bank JSON registries have zero FreshThird/normalized-residual
matches, and indexed Lean search finds only the current sorry-backed routers,
helpers, and unrelated consumers.  In particular, the agentic search result
that described the normalized-residual declaration as a contradiction was
verified against its source and is only a `by sorry` declaration, not a
reusable producer.  Do not promote that search hit or the SAT models into the
closure matrix.

## 2026-08-02 n>=17 cyclic/metric refinement checkpoint

The repaired n=17 `(6,8,6)` model was strengthened with an optional bounded
cyclic/metric layer: permutation positions with fixed apex blocks, exact-radius
equalities, positive symmetric distances, triangle inequalities, the
source-clean alternating shared-pair separator, and guarded strict Kalmanson
implications for the two consecutive-center orientations.  The implementation
keeps the prior implication-based Q projections and does not restore the old
strong-arm clauses.  Details and the run record are in
`scratch/retained-omission-e1/round5-general-cegar/N17-FRESH-THIRD-CYCLIC-METRIC-ROUND2.md`.

The bounded external Z3 run returned `SAT` in 12,855 ms.  No UNSAT core,
general-n cut, or Lean producer resulted; coordinates/QF_NRA realization,
Lean ingress, and universal quantification remain omitted.  This is therefore
another diagnostic NO-GO for this relaxation, not theorem closure.  A fresh
global theorem-bank audit is required and is the next gate before choosing a
different computational route.

The required post-round bank audit is now complete at
`scratch/retained-omission-e1/round5-general-cegar/ROUND2-GLOBAL-BANK-AUDIT.md`.
All three theorem-bank registries have zero FreshThird,
normalized-residual, or two-cap-source matches.  Agentic indexed search found
only the live `sorry`, checked helpers, and fixed U1 packets that do not accept
the FreshThird hypotheses; no transitive kernel-checked producer is available.
The cyclic/metric round is therefore a documented NO-GO for bank reuse and
closure.  Do not promote the SAT artifact or the search hits into the closure
matrix.

An arm-isolation replay of this same bounded model also forced each residual
selector separately; `firstNonHit`, `secondNonHit`, and
`equalCrossRowCenters` all remained `SAT`.  This is diagnostic evidence only,
not a new CEGAR cut, and it leaves no arm-specific producer to wire.

## 2026-08-02 banked convex-five-point CEGAR checkpoint

The next bounded route used the already importable
`Census554.ConvexFivePointCore.false_of_core_of_common_orientation` consumer.
`scratch/retained-omission-e1/round5-general-cegar/n17_convex_core_cegar.py`
detects four exact radius equalities in each n=17 cyclic/metric SAT model and
learns only the same-orientation convex-order exclusion.  The replay reached
finite `SAT` after five rounds and 323 learned cuts (84, 175, 48, 16, then 0),
with no observed violating core in the final model.  The result and trust
boundary are recorded in
`scratch/retained-omission-e1/round5-general-cegar/N17-CONVEX-FIVE-POINT-CORE-ROUND3.md`.

This remains external diagnostic evidence: the cyclic positions are not a
`Realizes` witness, QF_NRA coordinates and universal-`n` coverage are absent,
and the final SAT shadow does not imply a source-clean producer.  The learned
cuts cannot be promoted without a Lean adapter that supplies the theorem's
equality closure and convex-order hypotheses.  A fresh global theorem-bank
audit is the next mandatory gate.

The post-round audit is complete at
`scratch/retained-omission-e1/round5-general-cegar/ROUND3-GLOBAL-BANK-AUDIT.md`.
All three theorem-bank registries again have zero FreshThird,
ConvexFivePointCore, normalized-residual, or general-n producers.  Agentic
search found only residual coordinators, finite pattern-code detectors, and
the live `sorry`; the fixed U1/N9 near-misses do not supply the FreshThird
adapter.  Round 3 is therefore a NO-GO for bank reuse and closure.  No learned
cut or search hit may be promoted without a source-clean Lean adapter and a
transitive spine audit.

## 2026-08-02 v26 PB-lowering/source-core checkpoint

The latest computational artifact is the bounded v26
PB-lowering/source-core pilot at
`scratch/retained-omission-e1/round5-general-cegar/v26-pb-lowering-source-core.md`.
After substituting the authenticated v22 55-fix projection, two independent
fresh Z3 parses returned `UNSAT` for the lowered QF_LRA formula.  The returned
source selectors are cyclic alternation, exact rich profiles, and strict
Kalmanson.  This is an authenticated finite external result only: it has no
proof certificate, no coordinate realization for the live packet, no
universal-n argument, and no Lean/kernel ingress.  It does not close or
narrow the live normalized-residual `sorry` by itself.

The v26 global theorem-bank pass checked the required current-project prose and
all four named P97 registries, then made exactly one indexed Lean search.  The
only close hit was the fixed-card-11
`RetainedKalmansonDecoder.false_of_retainedOccurrence` consumer.  It requires
a proved carrier/boundary labeling and transformation from the v26 n=15
exact-rich pattern to `RetainedOccurrence`; that bridge is absent.  Therefore
v26 is a bridge target and bank NO-GO, not a reusable theorem.  Do not promote
its finite UNSAT or its three source selectors into the closure matrix.

The focused residual audit at
`scratch/retained-omission-e1/round5-general-cegar/RESIDUAL-ROUTE-AUDIT-R2.md`
confirms the same source frontier: the distinct-center arm is already
source-clean, while the two non-hit arms end in `sameBlocker` or
`sourceRowOmission`, and the equal-center arm ends in
`CommonCollisionEndpointOmission`/complementary-membership data.  No current
import supplies a terminal for those residual interfaces.  The next honest
closure target is a new source-clean producer or terminal for one of those
interfaces, not another wrapper or bank alias.

## 2026-08-02 independent artifact-reuse and bank audit (R2)

The independent audit at
`scratch/retained-omission-e1/round5-general-cegar/CEGAR-ARTIFACT-REUSE-AUDIT-R2.md`
checked the retained V21--V26 artifacts, the round-5 core-mining outputs, and
the six named P97 registry files.  It also ran one agentic Lean-index query,
which surfaced only the source-clean constructor
`freshThirdNormalizedResidualCase_of_crossRowResidual`; source inspection
confirms that it only packages the residual disjunction and does not derive
`False`.  No banked exact-rich/five-support producer or normalized-residual
terminal was found.

The strongest bounded candidate is the 31-clause finite set-system lemma in
`scratch/retained-omission-e1/round5-core-mining/MINIMIZATION-REPORT.md`.
It uses three six-element rich supports, two four-element K4 rows, and nine
cyclic-alternation cuts.  It is a finite Boolean obstruction, not yet a Lean
theorem and not yet an adapter for the live packet.  Formalizing that lemma is
the next computationally informed route; it must be followed by a
source-faithful construction of its five supports and a transitive axiom
audit.  Until those two bridges exist, broad CEGAR and direct sorry removal
remain out of scope.

## 2026-08-02 finite-cardinality bridge checkpoint

The literal nested `native_decide` encoding of the 31-clause packet was
stopped after more than twenty minutes without a result; raw witness
enumeration is not a useful Lean target.  The first generic source-clean
component now compiles in
`scratch/retained-omission-e1/round5-core-mining/ThreeCoverCard.lean`:
`Finset.card_le_three_of_three_cover_atMostOne` proves that a finite set
covered by three domains, with at most one point in each domain, has
cardinality at most three.  The check used Lean 4.27 via `lake env lean` and
introduced no production imports or axioms.  This is only a bridge lemma: the
live packet still lacks a proved construction of the three covering domains
and their at-most-one bounds, so no closure or narrowing of the live
`FreshThirdNormalizedResidualCase` obligation is claimed.

## 2026-08-02 exact-15 adapter audit R3

The independent audit at
`scratch/retained-omission-e1/round5-general-cegar/EXACT15-ADAPTER-AUDIT-R3.md`
checked whether `ATail/ExactFifteenApexProfile.lean` can be imported as a
live adapter.  It cannot: its producers require `D.A.card = 15` and are
apex-indexed `SelectedFourClass` statements, whereas the normalized residual
contains arbitrary blocker-centered `CriticalFourShell`s and only the live
`cap_card_ge_eight` lower bound.  The first missing bridge is therefore an
apex-to-blocker-row transfer (or a new metric contradiction), not an import
alias.  The exact-15 profile remains a conditional finite-slice producer and
must not be counted as closure.

The same audit confirms that `K7`/`K8` in the finite packet are scratch labels
for four-point rows avoiding centers 7 and 8; they are not production
interfaces.  The next constructive target is the rich--rich apex-cover
counting lemma, followed by the three-domain cardinality bridge already
checked in `ThreeCoverCard.lean`.

## 2026-08-02 v27 ordered-distance minimization checkpoint

The authenticated v27 external replay reduced the fixed n=15 shadow to two
exact-rich profile literals plus strict Kalmanson; fresh parses returned
`UNSAT`.  Its proposed theorem-facing shape is recorded in
`scratch/retained-omission-e1/round5-general-cegar/v27-source-assertion-minimization.md`.
This is discovery evidence only: there is no coordinate realization,
general-n quantifier, proof certificate, or Lean ingress, and the required
ordered-distance producer is absent from the current bank.  It therefore
does not narrow the live normalized residual, but it identifies a smaller
finite geometry target if the missing apex-to-blocker transfer is later
proved.

## 2026-08-02 v29 contract and theorem-bank checkpoint

The latest completed v29 retry is recorded at
`scratch/retained-omission-e1/round5-general-cegar/artifacts-v29-c-full-nonapex-shell/20260802T210119.317640Z-retry-pid32065/summary.json`.
Its child-process contract is valid and all 67 cases completed, but every case
is `UNKNOWN`; there is no cut, certificate, or mathematical narrowing.  The
round is therefore a clean process result only and is not a closure artifact.

The required post-round global theorem-bank pass is recorded at
`scratch/retained-omission-e1/round5-general-cegar/V29-POST-ROUND-GLOBAL-THEOREM-BANK-AUDIT.md`.
The three P97 registry scans found no retained-omission, tri-apex, cross-cap,
or K8 producer, and one agentic Lean-index query found no exact target.  The
closest source-clean facts remain fixed-radius cross-cap intersection bounds
and the two-hit critical-shell terminal; the live `Q`/`G` interfaces do not
provide the required same-radius two-hit bridge.  The next honest target is
therefore still a source-faithful cross-cap incidence producer or a metric
terminal, not a wrapper or bank alias.

## 2026-08-02 paired-branch terminal audit

The paired-common-deletion arm has now been checked against the available
source-clean consumers. `ApexRichClassStructure` supplies only upper bounds
for cap-slice intersections; `CommonDeletionTwoCenterPacket` supplies two
exact-four rows with overlap at most two, but no lower overlap bound or global
boundary order. The two-center bisector terminals therefore cannot be
instantiated: the reverse-omission hypothesis explicitly says the retained
source is outside the reverse shell, and the packet does not provide the
shared chord/order data those terminals require. The Kalmanson and
CapCrossing consumers have the same missing ordered-support hypotheses.

The smallest honest paired-branch bridge would have to prove all of the
following from the live packet: two distinct points in the two row supports,
their distinctness from both centers, and a global CCW/nonalternation adapter
(or an equivalent three-row Kalmanson pattern). None is currently available.
The brute-force `native_decide` proof of the fixed n=15 five-support shadow is
also not a practical terminal: nested finite enumeration has remained
running for tens of minutes. The active computational route is consequently
to formalize the human-readable three-domain/cardinality obstruction in
small source-clean lemmas, then separately prove the geometric support/order
adapter; no closure is claimed at this checkpoint.

## 2026-08-02 rich--rich count-kernel checkpoint

The first unconditional production slice of that route is now isolated in
`lean/Erdos9796Proof/P97/ATail/RichApexCoverCount.lean`.  It contains an
`omega` contradiction for the twelve decomposition counts and a finite-set
cover lemma reducing three at-most-one cuts to `K.card ≤ 3`.  These kernels
are independent of the scratch `Fin 15` labels (`K7`/`K8`) and therefore do
not claim an exact-15 or live `FreshThird` result.  The targeted Lean 4.27
build completed successfully with no linter warnings, and an explicit
`#print axioms` check reports only the standard `propext`, `Classical.choice`
(for the finite-set cover), and `Quot.sound` dependencies.  The next
promotion step is an explicit import plus a source-faithful adapter supplying
the count variables and the three cut bounds from the live blocker packet.
Until that adapter is proved, the normalized-residual `sorry` remains open.

## 2026-08-02 parity-adapter correction and corpus search

The parity audit corrected the earlier domain classification: all nine finite
clauses can be partitioned into the four existing nonalternating order
terminals.  Three clauses are wholly between their centers (`_split`), one is
wholly after them (`_before`), and five are before-or-after unions; the latter
split into the `_after`, `_before`, or `_enclosed` cases.  This removes the
previously recorded concern that an additional cyclic-rotation terminal was
needed.

An agentic Lean-corpus search for the combined live adapter shape returned no
single reusable theorem.  It found the existing FreshThird normalization and
support-radius facts separately, but no theorem deriving five finite support
sets, common-radius equalities, and the order partitions from
`FreshThirdBlockerFiber`.  Consequently the next source-faithful target is a
three-part adapter (support extraction, radius transfer, then finite order
partition), not another scratch `K8` enumeration or an import alias.

## 2026-08-02 finite order-kernel checkpoint

The finite order component is now isolated in
`lean/Erdos9796Proof/P97/ATail/FreshThirdOrderPartition.lean`.  Its
`Problem97.freshThird_pair_order_partition` theorem proves the four-way
nonalternating partition for two ordered `Fin n` endpoints lying either on
the same outside side or in the open interval between their centers.  The
targeted Lean 4.27 build completed successfully with no linter warnings, and
`#print axioms` reports only `propext`, `Classical.choice`, and `Quot.sound`.
This is a reusable finite producer for the future parity adapter, not closure:
the live `FreshThirdBlockerFiber` packet still does not derive its region
hypothesis (nor the support extraction and radius-transfer data) for the
residual theorem.

## 2026-08-02 full-fidelity FreshThird residual checkpoint

The repaired N17 probe is recorded at
`scratch/retained-omission-e1/round5-general-cegar/N17-FRESH-THIRD-FIDELITY-PROBE-ROUND5.md`.
It uses independent selectors for `C.firstSource` and `C.secondSource`,
explicit cap-row survival predicates, guarded deletion-survival predicates,
and the corrected equal-center arm.  The incidence artifact
`artifacts-n17-generic/20260802T184918Z/result.json` is SAT in all three
normalized residual arms (`firstNonHit`, `secondNonHit`, and
`equalCrossRowCenters`).  The cyclic/metric artifact
`artifacts-n17-generic/20260802T184331Z/result.json` and its per-arm runs are
`UNKNOWN` at the bounded time limits, so this is an external finite diagnostic
only: it has no coordinate realization, universal-n quantifier, Lean ingress,
or kernel-checked certificate.

The mandatory post-round theorem-bank audit is recorded by the round-5 global
bank pass.  All six required P97 registries (including the general-n census)
and one focused agentic Lean search returned no `FreshThird`,
`sourceRowOmission`, normalized-residual, or equivalent terminal/adapter.
The nearest imported facts are the existing cross-deletion survival/support
equivalences and the distinct-center FreshThird terminal; neither supplies the
missing common-radius, boundary-order, or blocker-row hypotheses.  The
load-bearing `false_of_twoCapSources_freshThirdBlockerFiber_normalized_residual`
obligation therefore remains open, with no promotion or closure claim from
this round.  The next honest implementation target is a source-faithful
support/radius/order adapter or a new metric terminal, not a wrapper around the
existing `sorry`.

## 2026-08-03 normalized-residual adapter audit

Two bounded audits rechecked the live `FreshThird` residual against the current
source-clean bank.  The support audit confirms that `support_eq_radius` is
directly usable only on the existing hit arms; the equal-center arm yields the
exact four-point row and endpoint-omission facts already recorded, while the
`FreshThirdOrderPartition` producer has no geometric input bridge.  The branch
audit confirms that the `firstNonHit` and `secondNonHit` packets reduce only to
equal-blocker/support equality or one-sided `Q` endpoint deletion-survival.
Neither audit found a source-clean `False` consumer for the generic
`FreshThirdBlockerFiber` packet, and neither changed the live obligation.

One `nthdegree docs search --lean --agentic` query for the combined
source-row-omission/equal-blocker/deletion-survival shape returned only the
existing residual wrapper and consumers requiring first-fiber witnesses or
common-radius hypotheses.  The search therefore supplies no reusable bridge;
the next implementation target remains a new branch-specific incidence/metric
consumer (or a producer strengthening that supplies its hypotheses), not an
alias, wrapper, or scratch enumeration.

## 2026-08-03 terminal API audit and cleanup checkpoint

The normalized-residual terminal was re-audited against the current theorem
bank after the Lean-file cleanup.  The first- and second-non-hit constructors
provide only equal-blocker/support equality or one-sided `Q` deletion
survival; `cross_deletion_survives_iff_not_mem_selected_support` normalizes the
latter but does not produce `False`.  The equal-center both-hit constructor
does provide the exact four-point support and simultaneous omission of all four
collision endpoints, but no imported consumer accepts a generic
`FreshThirdBlockerFiber` with those hypotheses.  The available
`ThirdCenterCommonPair` and first-fiber five-center consumers additionally
require absent survivor-relocation, common-radius, or first-fiber witness data.

Thus there is still no source-faithful terminal or import-only bridge for the
load-bearing normalized-residual `sorry`.  The next implementation must add a
new occurrence/embedding or direct incidence/metric consumer (with its
hypotheses constructed from this packet); adding another wrapper or finite
enumeration would not narrow the live obligation.  The two untracked Lean
axiom-audit probes were committed and pushed in `b35b77ab`; no untracked `.lean`
files remain at this checkpoint.

## 2026-08-03 equal-center canonical-cap branch checkpoint

The first source-faithful consumer for the normalized packet is now present
in `ATail/FrontierLiveClosure.lean` as
`false_of_freshThirdEqualCenter_sameCapOppIndex`.  It consumes the genuine
same-cap interaction data at `capIndex = S.oppIndex1`, the two both-hit
hypotheses, and the equal-center equation.  The existing exact-row producer
then identifies the first selected support with the four named sources; two
cap sources and whichever fresh fiber source is in the canonical cap form a
three-point subset of that selected row intersected with the cap.  The
imported `CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two`
consumer closes the branch unconditionally.

The file typechecks directly under Lean 4.27.0.  This is a real branch
consumer, not a wrapper or finite-search claim, but it does not yet close the
parent normalized-residual `sorry`: the distinct-cap interaction, the
same-cap interactions at the other cap indices, and the two non-hit packets
still lack source-faithful consumers.  The next integration step is to wire
this branch into the load-bearing coordinator while keeping those residual
interfaces explicit.

## 2026-08-03 build-hygiene checkpoint

The shared endpoint-classification adapter in `FrontierLiveClosure.lean` had
drifted from the producer's interface: the classifier returns `Nonempty`
wrappers, while the terminal constructors consume the underlying witness
types.  The adapter now unwraps those witnesses explicitly.  The equal-center
canonical-cap consumer also now rewrites its selected support explicitly with
`FreshThirdEqualCenterExactFourRow.first_support_eq`; this removes an
elaboration-dependent `simpa` step.

`lake-build Erdos9796Proof.P97.ATail.FrontierLiveClosure` succeeds under Lean
4.27.0 after these repairs.  This is build hygiene only and closes no
load-bearing `sorry`; the normalized-residual branch frontier recorded above
is unchanged.

## 2026-08-03 non-hit route audit

The indexed theorem-bank audit for `firstNonHit` and `secondNonHit` found no
source-faithful terminal or import-only bridge.  The two packets normalize only
to equal selected supports (the `sameBlocker` constructor) or one-sided
`Q.source₁`/`Q.source₂` deletion survival (the `sourceRowOmission` constructor).
`cross_deletion_survives_iff_not_mem_selected_support` and the blocker-center
separation lemma rewrite these facts, but yield only center inequality or an
intersection upper bound; they do not supply the reciprocal row incidence,
common radius, cap placement, or boundary-order hypotheses needed by an
existing contradiction.

Accordingly, the non-hit leaves remain genuine open interfaces.  The next
implementation must construct a new incidence/metric consumer or strengthen
the producer with a strictly narrowing packet.  Reusing the residual wrapper,
an alias, or a finite SAT result would be circular or non-kernel evidence and
does not advance the closure matrix.

## 2026-08-03 normalized-residual coordinator wiring checkpoint

The normalized coordinator now performs the source-clean narrowing that is
available at this frontier.  The two non-hit constructors and every
same-blocker/source-row-omission interaction are routed into the explicit
`FreshThirdNormalizedResidualRemainingCase` packet.  In the equal-center
positive branch, the canonical same-cap `oppIndex1` interaction is consumed by
`false_of_freshThirdEqualCenter_sameCapOppIndex`; distinct-cap interactions and
same-cap interactions at the other two indices are retained as the narrowed
`FreshThirdNonCanonicalInteraction` pair.  No source-clean terminal has been
invented for that remaining packet: its single theorem remains the loud
load-bearing leaf
`false_of_twoCapSources_freshThirdBlockerFiber_normalized_remaining`.

The coordinator call sites now pass the full section interface explicitly,
which avoids Lean treating the first geometric hypothesis as the source row.
`lake build Erdos9796Proof.P97.ATail.FrontierLiveClosure` succeeds under Lean
4.27.0.  This is a genuine narrowing/wiring checkpoint, not closure: the
remaining packet still contains the non-hit and noncanonical equal-center
obligations, and the closure matrix must continue to count that leaf as open.

## 2026-08-03 source-faithful consumer audit checkpoint

The read-only theorem-bank audit is complete. It confirms that
`false_of_twoCapSources_freshThirdBlockerFiber_normalized_remaining` has no
import-reachable source-clean consumer in the current tree or the indexed P97
banks. The `firstNonHit` and `secondNonHit` constructors expose only equal
selected supports or one-sided deletion survival; the noncanonical
equal-center constructors expose only distinct cap indices or same-cap
interaction away from `S.oppIndex1`. Existing consumers require additional
reciprocal row incidence, a common radius/first-fiber witness, or boundary
order data that this packet does not retain. The closest RVOL tetrahedron
consumer is not import-reachable and its U5 hypotheses do not map to this
interface.

Therefore the next closure step is a new source-faithful incidence/metric
producer or terminal, or a producer strengthening that retains one of those
missing invariants. An alias, wrapper, finite-search result, or conditional
`Closers` package would be circular and receives no closure credit. The
load-bearing leaf remains open and must stay explicit in the coordinator
frontier. No new CEGAR round was run at this checkpoint.

## 2026-08-03 shared-pair and agentic-search checkpoint

The latest deep Lean search and a read-only audit of the generic shared-pair
modules found no import-reachable consumer for the remaining leaf.  The
nearest result, `selectedFourClass_shared_pair_separated`, requires an
injective CCW convex boundary, a carrier-to-boundary index map, and two
distinct centers; FreshThird supplies neither the boundary transport nor the
distinct-center hypothesis in its residual arm.  `GeneralCarrierBridge` and
the P4 family adapters likewise require a full faithful-carrier/core packet
and produce alternative/SAT predicates rather than `False`.

This confirms the current missing bridge precisely: either (a) a source-clean
producer that adds the missing boundary/incidence or radius-class invariant to
the FreshThird packet, or (b) a direct metric/incidence terminal consuming the
existing exact-row and deletion data.  The non-hit and noncanonical
equal-center constructors remain genuine load-bearing obligations.  No new
`sorry`, alias, finite-search wrapper, or scratch theorem is promoted by this
checkpoint; the closure matrix must continue to count
`false_of_twoCapSources_freshThirdBlockerFiber_normalized_remaining` as open.

## 2026-08-03 CEGAR and certificate audit checkpoint

The bounded retained-omission CEGAR artifacts were checked against the
normalized FreshThird residual.  The n=17 generic arms are `SAT` in the
external Z3 model; the cyclic refinements are `UNKNOWN`, and the exact-n=15
probe was cancelled/`UNKNOWN`.  The result metadata explicitly records
`external_solver_only`, `lean_kernel_proof = false`, and
`universal_n_claim = false`; the models omit the Euclidean realization and
Lean ingress.  These artifacts therefore cannot be promoted as a terminal or
as a producer for the live theorem.

The certificate and script registries contain no FreshThird,
`firstNonHit`, `secondNonHit`, or `normalized_residual` certificate.  The
indexed Lean search likewise found only the current wrappers and branch-local
producers.  The first missing source-faithful bridge remains a new cap,
common-radius/fiber, cyclic-order, incidence, or metric invariant strong
enough to consume both non-hit constructors.  The literal load-bearing
`false_of_twoCapSources_freshThirdBlockerFiber_normalized_remaining` remains
open; no wrapper, SAT result, or conditional theorem is promoted.

## 2026-08-03 round-6 exact-row/global-bank checkpoint

The round-6 global theorem-bank audit is complete.  The mandatory certificate
registries and indexed Lean corpus contain no import-reachable, source-clean
consumer of the full `FreshThirdEqualCenterExactFourRow` packet together with
the noncanonical exact-overlap/cap data.  The closest reusable declarations
are the exact-overlap incidence lemma at `FrontierLiveClosure:10039`, the
ordered Kalmanson terminal
`CapCrossingKalmansonBridge.false_of_two_selected_rows_shared_late_pair`, and
the shared-pair alternation theorem
`Problem97.selectedFourClass_shared_pair_separated`; each requires additional
boundary/index, strict-order, or distinct-center hypotheses absent from this
residual.  The audit report is retained at
`scratch/retained-omission-e1/round5-general-cegar/round6-global-bank-audit-20260803.md`.

The equal-center CEGAR overlay was strengthened to exact four-point rows,
exact fresh-row overlap, noncanonical cap-interior membership, and the cyclic
metric relaxation.  Both the incidence and cyclic n=17 models are SAT (the
cyclic v2/v3 run is about 26 seconds), with metadata explicitly limiting the
result to external Z3, bounded n=17, and no Lean or Euclidean realization.
The witness alternates the shared fresh pair across the two equal-center rows,
so exact row support and cyclic relaxation alone do not supply the missing
contradiction.

The first source-faithful implementation target is therefore a
branch-preserving `ConvexCyclicOrder`/strict-boundary adapter: export the
subtype values, prove the required convex-independence and boundary index
transport, and convert the two exact shells to the row interface expected by
the Kalmanson consumer.  This is a producer/adapter target, not a closure
claim.  The non-hit constructors remain untouched, and
`false_of_twoCapSources_freshThirdBlockerFiber_normalized_remaining` remains
the explicit open leaf in the coordinator frontier.

## 2026-08-03 ShellCurvatureRows adapter audit

The direct generic adapter route was checked under Lean 4.27.0.  The
`ConvexCyclicOrder/ShellCurvatureRows` module provides a source-clean
`ShellBoundaryIndexing` producer, with non-collinearity discharged from the
convex carrier and `card_gt_four`; the
`SelectedFourClassCurvature` module also provides source-clean support-order
and quarter-turn-arc adapters.  These modules compile without `sorryAx`.

They do not yet consume the live FreshThird residual.  The residual packet
does not package `H.selectedAt` as the `SelectedFourClass` objects expected by
the adapters, does not retain the common-radius membership needed by the
mutual-cross-membership consumers, and does not provide the finite
permutation/strict-order transport for the named source points.  The
`firstNonHit` and `secondNonHit` branches still expose only one-sided deletion
survival or equal selected supports.  Thus the first source-faithful bridge
remains either a global erase/removability theorem or a branch-preserving
cross-row incidence/order producer; generic boundary construction alone is
insufficient.

This is an audit and implementation-direction checkpoint only.  No new
obligation was introduced, no wrapper or SAT artifact was promoted, and
`false_of_twoCapSources_freshThirdBlockerFiber_normalized_remaining` remains
the explicit open load-bearing leaf.

## 2026-08-03 retained-opposite-interaction and round-7 provenance checkpoint

The normalized residual packet was strengthened without adding an obligation:
`FreshThirdNormalizedResidualRemainingCase.firstNonHit` now retains the
opposite source-row interaction, and `secondNonHit` retains the first-row
interaction.  The coordinator and residual dispatcher pass these values
through explicitly.  This preserves the cross-row information that the old
packet erased before the load-bearing leaf, and is a genuine narrowing of the
interface rather than a wrapper or a recursive assumption.  The targeted
`FrontierLiveClosure` source check succeeds under Lean 4.27.0.

The round-7 triple-center smoke was rerun after repairing its worker
provenance: the v6 globals are now overridden at wrapper import time, so both
worker `result.json` and run `summary.json` report schema 7 and the v7 script
hash.  Case `fresh_DDD_k0_d1_f2` is `unsat` in the bounded external Z3 model.
The artifact still targets the all-large retained-omission coordinator, not
the FreshThird normalized leaf; it has no Lean certificate, no Euclidean
realization, and no universal claim.  It is therefore diagnostic evidence
only and receives no closure credit.  Fresh artifacts are under
`scratch/retained-omission-e1/round7-triple-center-multiplicity/artifacts-v7-provenance-fixed/`.

The mandatory post-round global theorem-bank pass found no FreshThird or
normalized-residual declaration.  `Problem97.eq_of_equidistant_three_noncollinear`
is import-reachable, but needs two centers sharing a non-collinear triple;
the RVOL triple-center incompatibility kernels are source-clean but not
imported here and their U5 interfaces do not adapt directly.  Consequently
the next source-faithful target remains a producer/consumer that retains a
third common incidence, common-radius/fiber witness, or boundary transport
for the non-hit and noncanonical equal-center branches.  The explicit
`false_of_twoCapSources_freshThirdBlockerFiber_normalized_remaining` leaf is
still open.
