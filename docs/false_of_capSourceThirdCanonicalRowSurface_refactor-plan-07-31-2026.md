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

The compatibility adapters no longer recurse into the root. The remaining
work is the mathematical proof of two independent narrowed obligations,
`false_of_twoCapSources_freshOutsideFirstBlockerFiber` and
`false_of_twoCapSources_freshThirdBlockerFiber_residual`, followed by a Lake
build and proof-blueprint/axiom audit. The current refreshed spine confirms
exactly those two theorem obligations plus their transitive `sorryAx`; no
additional child of this coordinator is open. A clean source compile is not a
claim that the publish target is `sorry`-free.

The swap-preserving packet helper is now also source-checked: the two
canonical-row witnesses can be exchanged while preserving the full support
and deletion-survival views. An earlier direct Lean 4.27 compile validated the
fresh-third positive normalization described below. Since that check, the
equal-blocker branch has been strengthened to retain its originating
`FreshOutsideFirstBlockerFiber` packet and simultaneous omission of all four
collision endpoints. The direct check exposed a parser break in the new
all-endpoint lemma, which was repaired. A subsequent guarded Lean 4.27 target
build completed successfully and refreshed the proof-blueprint, validating
the full Q-retaining rewire. This structural check does not discharge the two
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

false_of_twoCapSources_sameBlockerAllEndpointOmission
    {commonRadius : ℝ}
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (source source' : CarrierVertex D.A)
    ...
    (all_endpoint_omission :
      AllCollisionEndpointsOmitted P Pρ source source')
    (blocker_mem_capInterior : ...)
    (shell_inter_cap_eq : ... = {source.1, source'.1}) : False
```

Before this split, the coordinator-interface frontier was one mixed residual
carrying an indexed sum. After it, the coordinator itself is source-clean and
the frontier is two strictly constructor-specific leaves: the normalized
interaction product and the stronger first-fiber/common-blocker all-endpoint
omission packet. This changes the local raw `sorry` count from one to two but
narrows
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
Its concrete closure route is to produce the existing F3c five-center deletion
residual from `Q` and the cap-source witness, then apply an independently
proved source-clean
`false_of_capSource_firstFiber_collisionFiveCenterDeletion`. The terminal is
not yet present in the live source and must be checked for import reachability
and acyclicity before wiring. The normalized complement still needs a
source-clean occurrence/embedding or direct incidence terminal. The cells
should become separate live obligations only when constructor-specific
interfaces expose such a route. A fixed-cardinality SAT/QF_NRA result alone
is not a universal proof of this unbounded packet.

A bounded fixed-`n = 17` model under
`scratch/atail-force/same-blocker-common-omission-euclidean-v3/` validates the
new interface-level implication and confirms that the existential common
omission is redundant under the exact intersection assumptions. It does not
encode global K4 and is neither a universal proof nor a Lean closure. A
separate fixed-`n = 15..18` incidence/K4 audit is pending and will be reported
only as computational evidence.

The first half of that route is now production Lean. The source-clean theorem
`collisionFiveCenterDeletion_of_allCollisionEndpointsOmitted` applies
`firstFiber_cycleAlignedHits_or_collisionFiveCenterDeletion` with the two
robust remaining apices. Its non-deletion arm contains `P.source₁` in the
cap-source row, contradicting the retained all-four omission; the other arm is
exactly `FirstFiberCollisionFiveCenterDeletionResidual`. A direct Lean 4.27
source check of `FrontierLiveClosure.lean` passed on 2026-08-01. This
introduces no new obligation and closes no terminal by itself: the
independently owned positive-incidence contradiction is still the next call
to wire.

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
\boxed{\text{The acyclic refactor is installed; prove its two independent leaves next.}}
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
`sorry` is gone, but the publish target remains open until the two independent
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
bridge also passes a direct Lean 4.27 source check, but has not yet been
followed by a guarded target rebuild or a transitive proof-blueprint and axiom
audit. Those gates must be rerun after the terminal is proved before any
closure claim.
