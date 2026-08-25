/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ContextFrames
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.TwoSourceFirstFiberCollision
import Erdos9796Proof.P97.ATail.ThirdCenterCommonPair
import Erdos9796Proof.P97.U3EscapingAuditCycle
import Erdos9796Proof.P97.U3ToU5MixedExtraction
import Erdos9796Proof.P97.U3ToU5Terminal

namespace Problem97
namespace ATailFrontierLiveClosure

open scoped EuclideanGeometry
open ATailApexRichClassStructure
open ATailBiApexBlockerMultiplicity
open ATailCriticalPairFrontier
open ATailBiApexRobustCapBounds
open ATailBlockerMultiplicityGeometry
open ATailCommonDeletionTwoCenter
open ATailCriticalFiberClosingCore
open ATailCriticalFiberRetainedRadiusSelector
open ATailDeletionRobustness
open ATailExactFourPhysicalConsumer
open ATailExactFourRobustCapExpansion
open ATailMinimalUniqueFourCover
open ATailLargeCapUniqueFive
open ATailLargeOppositeCapsBiApexSurface
open ATailLocalizedCollisionMutualOmissionCycle
open Census554.CapSelectedGeometry
open ATailCriticalSystemRebase
open ATailOrientedPhysicalApexIngress
open ATailPhysicalSecondApexCommonDeletion
open ATailPhysicalSecondApexSwap
open ATailRetainedMatchingGeometricReduction
open ATailRetainedMatchingLargeCapConsumer
open ATailRetainedMatchingCommonDeletionCycle
open ATailRetainedMatchingEndpointCollisionLocalization
open ATailRetainedMatchingEndpointContinuation
open ATailRetainedCollisionCapLocalization
open ATailRetainedStrictInteriorPairSelector
open ATailSurvivalCover
open ATailTwoCollisionGlobalProducer
open ATailTwoCenterCapLocalization
open ATailUniqueFourLateChoiceTerminalScratch
open FirstApexUniqueRadiusResidual
open Census554.GeneralCarrierBridge

attribute [local instance] Classical.propDecidable

private theorem oppApex1_mem_A
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 ∈ A := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v2_mem
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v3_mem
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v1_mem

private theorem oppApex2_mem_A
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex2 ∈ A := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v3_mem
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v1_mem
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v2_mem

private theorem surplusApex_mem_A
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.surplusApex ∈ A := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.surplusApex, hi] using S.triangle.v1_mem
  · simpa [SurplusCapPacket.surplusApex, hi] using S.triangle.v2_mem
  · simpa [SurplusCapPacket.surplusApex, hi] using S.triangle.v3_mem

private theorem five_point_literal_card_le
    {a b c d e : ℝ²} :
    ({a, b, c, d, e} : Finset ℝ²).card ≤ 5 := by
  have h1 := Finset.card_insert_le a ({b, c, d, e} : Finset ℝ²)
  have h2 := Finset.card_insert_le b ({c, d, e} : Finset ℝ²)
  have h3 := Finset.card_insert_le c ({d, e} : Finset ℝ²)
  have h4 := Finset.card_insert_le d ({e} : Finset ℝ²)
  have h5 : ({e} : Finset ℝ²).card = 1 := Finset.card_singleton e
  omega

private theorem first_two_ne_of_six_point_literal_card
    {a b c d e f : ℝ²}
    (hcard : ({a, b, c, d, e, f} : Finset ℝ²).card = 6) :
    a ≠ b := by
  intro hab
  have hsub :
      ({a, b, c, d, e, f} : Finset ℝ²) ⊆ {a, c, d, e, f} := by
    simp [hab]
  have hle := le_trans (Finset.card_le_card hsub)
    (five_point_literal_card_le (a := a) (b := c) (c := d) (d := e) (e := f))
  omega

private theorem false_of_six_point_literal_subset_five
    {a b c d e f u v w x y : ℝ²}
    (hcard : ({a, b, c, d, e, f} : Finset ℝ²).card = 6)
    (hsub : ({a, b, c, d, e, f} : Finset ℝ²) ⊆ {u, v, w, x, y}) :
    False := by
  have hle := le_trans (Finset.card_le_card hsub)
    (five_point_literal_card_le (a := u) (b := v) (c := w) (d := x) (e := y))
  omega

namespace TwoSourceExactCollisionRowsTerminal

section

variable
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (hρne : ρ ≠ radius)
    (hfrontierFour :
      (SelectedClass D.A S.oppApex1 radius).card = 4)
    (hρfour :
      (SelectedClass D.A S.oppApex1 ρ).card = 4)
    (hfrontierInteriorEq :
      SelectedClass D.A S.oppApex1 radius ∩
          S.capInteriorByIndex S.oppIndex1 =
        {P.source₁, P.source₂})
    (hρInteriorEq :
      SelectedClass D.A S.oppApex1 ρ ∩
          S.capInteriorByIndex S.oppIndex1 =
        {Pρ.source₁, Pρ.source₂})
    {B : FrontierBiApexRobustResidual R}
    {L : FrontierLargeOppositeCapsBiApexRobustResidual B}
    {N : FrontierAllLargeCapsBiApexRobustResidual L}
    (T : FrontierAllLargeCapsTriApexRobustResidual N)
    (hpairsDisjoint :
      Disjoint
        ({P.source₁, P.source₂} : Finset ℝ²)
        {Pρ.source₁, Pρ.source₂})
    (hblockersNe :
      H.centerAt Pρ.source₁ Pρ.source₁_mem_A ≠
        H.centerAt P.source₁ P.source₁_mem_A)
    (LPρ : LocalizedCollisionCommonDeletion P)
    (hLPρ : LPρ.fresh = Pρ.source₁)
    (MPρ : LocalizedCollisionMutualOmissionCycle P LPρ)
    (LP : LocalizedCollisionCommonDeletion Pρ)
    (hLP : LP.fresh = P.source₁)
    (MP : LocalizedCollisionMutualOmissionCycle Pρ LP)

include hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP -- [shard-prologue-state]

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- The two-source canonical surface is intrinsically an `n ≥ 17` surface:
its designated first cap has at least eight points, while the tri-apex
residual makes every indexed cap have at least six.  This is the source-level
cardinality contract for any finite FreshThird computation. -/
theorem twoCapSourceSurface_carrier_card_ge_seventeen
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ) :
    17 ≤ D.A.card := by
  exact
    ATailExactFifteenApexProfile.card_ge_seventeen_of_one_cap_card_ge_eight
      S S.oppIndex1 C.cap_card_ge_eight
      (triApexAllLargeContext_of_residuals L N T).cap_card_ge_six

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- At exact carrier size seventeen, the FreshThird surface forces the cap
profile `(8, 6, 6)`, with the eight-point cap at its designated first index.
This is the finite source contract for exact-17 computation. -/
theorem twoCapSourceSurface_exact_seventeen_cap_profile_frame
    (frame : TwoSourceCollisionFrame P Pρ)
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (hcard : D.A.card = 17) :
    (S.capByIndex S.oppIndex1).card = 8 ∧
      ∀ j : Fin 3, j ≠ S.oppIndex1 → (S.capByIndex j).card = 6 := by
  obtain ⟨hρne, hfrontierFour, hρfour, hfrontierInteriorEq, hρInteriorEq,
    hpairsDisjoint, hblockersNe, LPρ, hLPρ, MPρ, LP, hLP, MP⟩ := frame
  exact
    ATailExactFifteenApexProfile.capByIndex_card_profile_of_card_eq_seventeen
      S S.oppIndex1 hcard C.cap_card_ge_eight
      (triApexAllLargeContext_of_residuals L N T).cap_card_ge_six

/-- At exact carrier size seventeen, the FreshThird surface forces the cap
profile `(8, 6, 6)`, with the eight-point cap at its designated first index.
This is the finite source contract for exact-17 computation.
This is a compatibility wrapper over
`twoCapSourceSurface_exact_seventeen_cap_profile_frame`, which takes the
same hypotheses packaged as a `TwoSourceCollisionFrame`. -/
theorem twoCapSourceSurface_exact_seventeen_cap_profile
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (hcard : D.A.card = 17) :
    (S.capByIndex S.oppIndex1).card = 8 ∧
      ∀ j : Fin 3, j ≠ S.oppIndex1 → (S.capByIndex j).card = 6 :=
  twoCapSourceSurface_exact_seventeen_cap_profile_frame P Pρ T
    ⟨hρne, hfrontierFour, hρfour, hfrontierInteriorEq, hρInteriorEq,
      hpairsDisjoint, hblockersNe, LPρ, hLPρ, MPρ, LP, hLP, MP⟩
    C hcard

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- The two distinct blockers of a mutually incident cap-source pair can
occupy the same indexed strict cap only when it is the source cap. -/
theorem exists_mutualBlockerCapIndices_same_only_first
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (hsourcesNe : source.1 ≠ source'.1)
    (hsource : FirstFiberCapSourceWitness P Pρ source)
    (hsource' : FirstFiberCapSourceWitness P Pρ source')
    (hmutual :
      TwoCapSourcesMutualCrossMembership (H := H) source source')
    (hblockersNe' : H.blockerVertex source ≠ H.blockerVertex source') :
    ∃ i j : Fin 3,
      H.centerAt source.1 source.2 ∈ S.capInteriorByIndex i ∧
        H.centerAt source'.1 source'.2 ∈ S.capInteriorByIndex j ∧
        (i = j → i = S.oppIndex1) := by
  rcases exists_blockerCenter_mem_capInteriorByIndex
      (T := T) source with ⟨i, hi⟩
  rcases exists_blockerCenter_mem_capInteriorByIndex
      (T := T) source' with ⟨j, hj⟩
  refine ⟨i, j, hi, hj, ?_⟩
  intro hij
  subst j
  by_contra hifirst
  have hcentersNe :
      H.centerAt source.1 source.2 ≠
        H.centerAt source'.1 source'.2 := by
    intro hcenters
    apply hblockersNe'
    apply Subtype.ext
    exact hcenters
  have hsourceOff :
      source.1 ∉ S.capByIndex i :=
    S.capInteriorByIndex_not_mem_capByIndex_of_ne
      hsource.2.1 (Ne.symm hifirst)
  have hsourceOff' :
      source'.1 ∉ S.capByIndex i :=
    S.capInteriorByIndex_not_mem_capByIndex_of_ne
      hsource'.2.1 (Ne.symm hifirst)
  have hcenterEq :
      dist (H.centerAt source.1 source.2) source.1 =
        dist (H.centerAt source.1 source.2) source'.1 :=
    ((H.selectedAt source.1
        source.2).toCriticalFourShell.support_eq_radius
      source.1
      (H.selectedAt source.1
        source.2).toCriticalFourShell.q_mem_support).trans
      ((H.selectedAt source.1
        source.2).toCriticalFourShell.support_eq_radius
      source'.1 hmutual.1).symm
  have hcenterEq' :
      dist (H.centerAt source'.1 source'.2) source.1 =
        dist (H.centerAt source'.1 source'.2) source'.1 :=
    ((H.selectedAt source'.1
        source'.2).toCriticalFourShell.support_eq_radius
      source.1 hmutual.2).trans
      ((H.selectedAt source'.1
        source'.2).toCriticalFourShell.support_eq_radius
      source'.1
      (H.selectedAt source'.1
        source'.2).toCriticalFourShell.q_mem_support).symm
  exact
    ATailUniqueRowProducerScratch.false_of_two_cap_centers_equidistant_outside_pair
      S i
      (S.capInteriorByIndex_subset_capByIndex i hi)
      (S.capInteriorByIndex_subset_capByIndex i hj)
      hcentersNe source.2 source'.2 hsourcesNe
      hsourceOff hsourceOff' hcenterEq hcenterEq'

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- Two mutually incident source rows with distinct blockers cannot have both
blocker centers in the first strict cap.  The ordered-cap bisector theorem
places both centers strictly between the source endpoints; the retained
local-to-global cap block then turns them into an increasing ambient-boundary
quadruple forbidden by the four-point Kalmanson equality obstruction. -/
private theorem false_of_mutualBlockerCenters_both_in_firstCap
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (hsourcesNe : source.1 ≠ source'.1)
    (hsource : FirstFiberCapSourceWitness P Pρ source)
    (hsource' : FirstFiberCapSourceWitness P Pρ source')
    (hmutual :
      TwoCapSourcesMutualCrossMembership (H := H) source source')
    (hblockersNe' : H.blockerVertex source ≠ H.blockerVertex source')
    (hcenterCap :
      H.centerAt source.1 source.2 ∈ S.capByIndex S.oppIndex1)
    (hcenterCap' :
      H.centerAt source'.1 source'.2 ∈ S.capByIndex S.oppIndex1) :
    False := by
  classical
  rcases S.capByIndex_cgn4g_strictCapBlockData
      D.convex S.oppIndex1 with ⟨B⟩
  have hsourceCap : source.1 ∈ S.capByIndex S.oppIndex1 :=
    S.capInteriorByIndex_subset_capByIndex
      S.oppIndex1 hsource.2.1
  have hsourceCap' : source'.1 ∈ S.capByIndex S.oppIndex1 :=
    S.capInteriorByIndex_subset_capByIndex
      S.oppIndex1 hsource'.2.1
  rcases B.exists_index_of_mem_cap hsourceCap with ⟨r, hr⟩
  rcases B.exists_index_of_mem_cap hsourceCap' with ⟨s, hs⟩
  rcases B.exists_index_of_mem_cap hcenterCap with ⟨k, hk⟩
  rcases B.exists_index_of_mem_cap hcenterCap' with ⟨k', hk'⟩
  have hrs : r ≠ s := by
    intro hrs
    apply hsourcesNe
    calc
      source.1 = B.L.points r := hr.symm
      _ = B.L.points s := by rw [hrs]
      _ = source'.1 := hs
  have hcentersNe :
      H.centerAt source.1 source.2 ≠
        H.centerAt source'.1 source'.2 := by
    intro hcenters
    apply hblockersNe'
    exact Subtype.ext hcenters
  have hkk' : k ≠ k' := by
    intro hkk'
    apply hcentersNe
    calc
      H.centerAt source.1 source.2 = B.L.points k := hk.symm
      _ = B.L.points k' := by rw [hkk']
      _ = H.centerAt source'.1 source'.2 := hk'
  have hkr : k ≠ r := by
    intro hkr
    apply centerAt_ne_source H source.1 source.2
    calc
      H.centerAt source.1 source.2 = B.L.points k := hk.symm
      _ = B.L.points r := by rw [hkr]
      _ = source.1 := hr
  have hk's : k' ≠ s := by
    intro hk's
    apply centerAt_ne_source H source'.1 source'.2
    calc
      H.centerAt source'.1 source'.2 = B.L.points k' := hk'.symm
      _ = B.L.points s := by rw [hk's]
      _ = source'.1 := hs
  have hks : k ≠ s := by
    intro hks
    have hcenterMem :
        H.centerAt source.1 source.2 ∈
          (H.selectedAt source.1 source.2).toCriticalFourShell.support := by
      simpa only [← hk, hks, hs] using hmutual.1
    exact
      (H.selectedAt source.1
        source.2).toCriticalFourShell.center_not_mem_support hcenterMem
  have hk'r : k' ≠ r := by
    intro hk'r
    have hcenterMem :
        H.centerAt source'.1 source'.2 ∈
          (H.selectedAt source'.1 source'.2).toCriticalFourShell.support := by
      simpa only [← hk', hk'r, hr] using hmutual.2
    exact
      (H.selectedAt source'.1
        source'.2).toCriticalFourShell.center_not_mem_support hcenterMem
  have hcenterEq :
      dist (H.centerAt source.1 source.2) source.1 =
        dist (H.centerAt source.1 source.2) source'.1 :=
    ((H.selectedAt source.1
        source.2).toCriticalFourShell.support_eq_radius
      source.1
      (H.selectedAt source.1
        source.2).toCriticalFourShell.q_mem_support).trans
      ((H.selectedAt source.1
        source.2).toCriticalFourShell.support_eq_radius
      source'.1 hmutual.1).symm
  have hcenterEq' :
      dist (H.centerAt source'.1 source'.2) source.1 =
        dist (H.centerAt source'.1 source'.2) source'.1 :=
    ((H.selectedAt source'.1
        source'.2).toCriticalFourShell.support_eq_radius
      source.1 hmutual.2).trans
      ((H.selectedAt source'.1
        source'.2).toCriticalFourShell.support_eq_radius
      source'.1
      (H.selectedAt source'.1
        source'.2).toCriticalFourShell.q_mem_support).symm
  have hEq :
      dist (B.L.points k) (B.L.points r) =
        dist (B.L.points k) (B.L.points s) := by
    simpa only [hk, hr, hs] using hcenterEq
  have hEq' :
      dist (B.L.points k') (B.L.points r) =
        dist (B.L.points k') (B.L.points s) := by
    simpa only [hk', hr, hs] using hcenterEq'
  rcases lt_or_gt_of_ne hrs with hrs | hsr
  · have hkBetween :=
      CGN.index_strictly_between_of_equidistant
        B.Packet B.Hside B.Hord hrs hkr hks hEq
    have hk'Between :=
      CGN.index_strictly_between_of_equidistant
        B.Packet B.Hside B.Hord hrs hk'r hk's hEq'
    rcases lt_or_gt_of_ne hkk' with hkk' | hk'k
    · exact
        CapCrossingKalmansonBridge.false_of_four_ccw_middle_centers_bisect_endpoint_pair
          D.convex B.phi_injective B.Block.phi_image B.phi_ccw
          (B.Block.idx_strict hkBetween.1)
          (B.Block.idx_strict hkk')
          (B.Block.idx_strict hk'Between.2)
          (by simpa only [← B.Block.points_eq] using hEq)
          (by simpa only [← B.Block.points_eq] using hEq')
    · exact
        CapCrossingKalmansonBridge.false_of_four_ccw_middle_centers_bisect_endpoint_pair
          D.convex B.phi_injective B.Block.phi_image B.phi_ccw
          (B.Block.idx_strict hk'Between.1)
          (B.Block.idx_strict hk'k)
          (B.Block.idx_strict hkBetween.2)
          (by simpa only [← B.Block.points_eq] using hEq')
          (by simpa only [← B.Block.points_eq] using hEq)
  · have hkBetween :=
      CGN.index_strictly_between_of_equidistant
        B.Packet B.Hside B.Hord hsr hks hkr hEq.symm
    have hk'Between :=
      CGN.index_strictly_between_of_equidistant
        B.Packet B.Hside B.Hord hsr hk's hk'r hEq'.symm
    rcases lt_or_gt_of_ne hkk' with hkk' | hk'k
    · exact
        CapCrossingKalmansonBridge.false_of_four_ccw_middle_centers_bisect_endpoint_pair
          D.convex B.phi_injective B.Block.phi_image B.phi_ccw
          (B.Block.idx_strict hkBetween.1)
          (B.Block.idx_strict hkk')
          (B.Block.idx_strict hk'Between.2)
          (by simpa only [← B.Block.points_eq] using hEq.symm)
          (by simpa only [← B.Block.points_eq] using hEq'.symm)
    · exact
        CapCrossingKalmansonBridge.false_of_four_ccw_middle_centers_bisect_endpoint_pair
          D.convex B.phi_injective B.Block.phi_image B.phi_ccw
          (B.Block.idx_strict hk'Between.1)
          (B.Block.idx_strict hk'k)
          (B.Block.idx_strict hkBetween.2)
          (by simpa only [← B.Block.points_eq] using hEq'.symm)
          (by simpa only [← B.Block.points_eq] using hEq.symm)

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- The two blocker centers of mutually incident first-fiber sources occupy
distinct indexed strict caps. -/
theorem exists_mutualBlockerCapIndices_distinct
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (hsourcesNe : source.1 ≠ source'.1)
    (hsource : FirstFiberCapSourceWitness P Pρ source)
    (hsource' : FirstFiberCapSourceWitness P Pρ source')
    (hmutual :
      TwoCapSourcesMutualCrossMembership (H := H) source source')
    (hblockersNe' : H.blockerVertex source ≠ H.blockerVertex source') :
    ∃ i j : Fin 3,
      H.centerAt source.1 source.2 ∈ S.capInteriorByIndex i ∧
        H.centerAt source'.1 source'.2 ∈ S.capInteriorByIndex j ∧
        i ≠ j := by
  rcases exists_mutualBlockerCapIndices_same_only_first
      (P := P) (Pρ := Pρ) T source source' hsourcesNe
      hsource hsource' hmutual hblockersNe' with
    ⟨i, j, hi, hj, hsameOnlyFirst⟩
  refine ⟨i, j, hi, hj, ?_⟩
  intro hij
  have hiFirst : i = S.oppIndex1 := hsameOnlyFirst hij
  subst j
  subst i
  exact false_of_mutualBlockerCenters_both_in_firstCap
    (P := P) (Pρ := Pρ)
    source source' hsourcesNe hsource hsource' hmutual hblockersNe'
    (S.capInteriorByIndex_subset_capByIndex S.oppIndex1 hi)
    (S.capInteriorByIndex_subset_capByIndex S.oppIndex1 hj)

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
private theorem false_of_three_firstCap_hits_at_firstCap_blocker
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (z : ℝ²)
    (hsourcesNe : source.1 ≠ source'.1)
    (hzNeSource : z ≠ source.1)
    (hzNeSource' : z ≠ source'.1)
    (hsourceCap : source.1 ∈ S.capByIndex S.oppIndex1)
    (hsourceCap' : source'.1 ∈ S.capByIndex S.oppIndex1)
    (hzCap : z ∈ S.capByIndex S.oppIndex1)
    (hsource'Mem :
      source'.1 ∈
        (H.selectedAt source.1
          source.2).toCriticalFourShell.support)
    (hzMem :
      z ∈
        (H.selectedAt source.1
          source.2).toCriticalFourShell.support)
    (hcenterCap :
      H.centerAt source.1 source.2 ∈
        S.capByIndex S.oppIndex1) :
    False := by
  classical
  have htriple :
      ({source.1, source'.1, z} : Finset ℝ²) ⊆
        (H.selectedAt source.1
            source.2).toCriticalFourShell.support ∩
          S.capByIndex S.oppIndex1 := by
    intro x hx
    simp only [Finset.mem_insert, Finset.mem_singleton] at hx
    rcases hx with rfl | rfl | rfl
    · exact Finset.mem_inter.mpr
        ⟨(H.selectedAt source.1
            source.2).toCriticalFourShell.q_mem_support,
          hsourceCap⟩
    · exact Finset.mem_inter.mpr ⟨hsource'Mem, hsourceCap'⟩
    · exact Finset.mem_inter.mpr ⟨hzMem, hzCap⟩
  have hthree :
      3 ≤
        ((H.selectedAt source.1
            source.2).toCriticalFourShell.support ∩
          S.capByIndex S.oppIndex1).card := by
    have hle := Finset.card_le_card htriple
    simpa [hsourcesNe, Ne.symm hzNeSource,
      Ne.symm hzNeSource'] using hle
  have htwo :
      ((H.selectedAt source.1
          source.2).toCriticalFourShell.support ∩
        S.capByIndex S.oppIndex1).card ≤ 2 := by
    simpa using
      CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
        S D.convex S.oppIndex1
        (H.selectedAt source.1
          source.2).toCriticalFourShell.toSelectedFourClass
        hcenterCap
  omega

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- In the complementary first-collision-pair branch, neither cap-source
blocker can lie in the source cap.  A blocker in that cap would see the two
mutually incident sources and one collision endpoint, contradicting the
two-hit bound for a selected row centered in its own indexed cap. -/
theorem false_of_firstPair_complementaryMembership_of_blocker_mem_firstCap
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (hsourcesNe : source.1 ≠ source'.1)
    (hsource : FirstFiberCapSourceWitness P Pρ source)
    (hsource' : FirstFiberCapSourceWitness P Pρ source')
    (hmutual :
      TwoCapSourcesMutualCrossMembership (H := H) source source')
    (hcomplementary :
      (P.source₁ ∈
            (H.selectedAt source.1
              source.2).toCriticalFourShell.support ∧
          P.source₂ ∈
            (H.selectedAt source'.1
              source'.2).toCriticalFourShell.support) ∨
        (P.source₂ ∈
            (H.selectedAt source.1
              source.2).toCriticalFourShell.support ∧
          P.source₁ ∈
            (H.selectedAt source'.1
              source'.2).toCriticalFourShell.support))
    (hcenterFirst :
      H.centerAt source.1 source.2 ∈
          S.capByIndex S.oppIndex1 ∨
        H.centerAt source'.1 source'.2 ∈
          S.capByIndex S.oppIndex1) :
    False := by
  rcases hsource with
    ⟨_, hsourceInterior, hsourceOutside, _, _, _, _, _, _, _, _⟩
  rcases hsource' with
    ⟨_, hsourceInterior', hsourceOutside', _, _, _, _, _, _, _, _⟩
  have hsourceCap :
      source.1 ∈ S.capByIndex S.oppIndex1 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex1 hsourceInterior
  have hsourceCap' :
      source'.1 ∈ S.capByIndex S.oppIndex1 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex1 hsourceInterior'
  have hP₁Cap :
      P.source₁ ∈ S.capByIndex S.oppIndex1 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex1
      P.source₁_mem_capInterior
  have hP₂Cap :
      P.source₂ ∈ S.capByIndex S.oppIndex1 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex1
      P.source₂_mem_capInterior
  have hP₁NeSource : P.source₁ ≠ source.1 := by
    intro h
    apply hsourceOutside
    exact h ▸ (by simp)
  have hP₁NeSource' : P.source₁ ≠ source'.1 := by
    intro h
    apply hsourceOutside'
    exact h ▸ (by simp)
  have hP₂NeSource : P.source₂ ≠ source.1 := by
    intro h
    apply hsourceOutside
    exact h ▸ (by simp)
  have hP₂NeSource' : P.source₂ ≠ source'.1 := by
    intro h
    apply hsourceOutside'
    exact h ▸ (by simp)
  rcases hcenterFirst with hcenterFirst | hcenterFirst
  · rcases hcomplementary with hfirst | hsecond
    · exact false_of_three_firstCap_hits_at_firstCap_blocker
        source source' P.source₁ hsourcesNe
        hP₁NeSource hP₁NeSource' hsourceCap hsourceCap'
        hP₁Cap hmutual.1 hfirst.1 hcenterFirst
    · exact false_of_three_firstCap_hits_at_firstCap_blocker
        source source' P.source₂ hsourcesNe
        hP₂NeSource hP₂NeSource' hsourceCap hsourceCap'
        hP₂Cap hmutual.1 hsecond.1 hcenterFirst
  · rcases hcomplementary with hfirst | hsecond
    · exact false_of_three_firstCap_hits_at_firstCap_blocker
        source' source P.source₂ hsourcesNe.symm
        hP₂NeSource' hP₂NeSource hsourceCap' hsourceCap
        hP₂Cap hmutual.2 hfirst.2 hcenterFirst
    · exact false_of_three_firstCap_hits_at_firstCap_blocker
        source' source P.source₁ hsourcesNe.symm
        hP₁NeSource' hP₁NeSource hsourceCap' hsourceCap
        hP₁Cap hmutual.2 hsecond.2 hcenterFirst

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- In the complementary first-collision-pair branch, the two blockers lie in
the two distinct cap interiors other than the source cap. -/
theorem exists_mutualBlockerCapIndices_distinct_otherCaps
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (hsourcesNe : source.1 ≠ source'.1)
    (hsource : FirstFiberCapSourceWitness P Pρ source)
    (hsource' : FirstFiberCapSourceWitness P Pρ source')
    (hmutual :
      TwoCapSourcesMutualCrossMembership (H := H) source source')
    (hblockersNe' : H.blockerVertex source ≠ H.blockerVertex source')
    (hcomplementary :
      (P.source₁ ∈
            (H.selectedAt source.1
              source.2).toCriticalFourShell.support ∧
          P.source₂ ∈
            (H.selectedAt source'.1
              source'.2).toCriticalFourShell.support) ∨
        (P.source₂ ∈
            (H.selectedAt source.1
              source.2).toCriticalFourShell.support ∧
          P.source₁ ∈
            (H.selectedAt source'.1
              source'.2).toCriticalFourShell.support)) :
    ∃ i j : Fin 3,
      H.centerAt source.1 source.2 ∈ S.capInteriorByIndex i ∧
        H.centerAt source'.1 source'.2 ∈ S.capInteriorByIndex j ∧
        i ≠ S.oppIndex1 ∧
        j ≠ S.oppIndex1 ∧
        i ≠ j := by
  rcases exists_mutualBlockerCapIndices_same_only_first
      P Pρ T source source' hsourcesNe hsource hsource'
      hmutual hblockersNe' with
    ⟨i, j, hi, hj, hsameOnlyFirst⟩
  have hiNe : i ≠ S.oppIndex1 := by
    intro hiFirst
    apply false_of_firstPair_complementaryMembership_of_blocker_mem_firstCap
      P Pρ source source' hsourcesNe hsource hsource'
      hmutual hcomplementary
    left
    rw [hiFirst] at hi
    exact S.capInteriorByIndex_subset_capByIndex S.oppIndex1 hi
  have hjNe : j ≠ S.oppIndex1 := by
    intro hjFirst
    apply false_of_firstPair_complementaryMembership_of_blocker_mem_firstCap
      P Pρ source source' hsourcesNe hsource hsource'
      hmutual hcomplementary
    right
    rw [hjFirst] at hj
    exact S.capInteriorByIndex_subset_capByIndex S.oppIndex1 hj
  have hijNe : i ≠ j := by
    intro hij
    exact hiNe (hsameOnlyFirst hij)
  exact ⟨i, j, hi, hj, hiNe, hjNe, hijNe⟩

omit D S radius ρ H F R P Fρ Rρ Pρ hρne
  hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- Two distinct carrier points outside an ordered cap cannot both bisect one
of its chords.  The CGN side dichotomy puts one bisector point back on the
open subchain, contradicting that it is outside the cap. -/
private theorem false_of_two_offCap_bisectors
    {A : Finset ℝ²} {m : ℕ} {L : CGN.OrderedCap m}
    (hconv : ConvexIndep A)
    (hmem : ∀ t : Fin m, L.points t ∈ A)
    (Hord : CGN.StrictCapOrder A L)
    {r s : Fin m} (hrs : r < s) {a b : ℝ²}
    (haA : a ∈ A) (hbA : b ∈ A) (hab : a ≠ b)
    (har : a ≠ L.points r) (has : a ≠ L.points s)
    (hbr : b ≠ L.points r) (hbs : b ≠ L.points s)
    (haeq : dist a (L.points r) = dist a (L.points s))
    (hbeq : dist b (L.points r) = dist b (L.points s))
    (haOff : a ∉ Finset.univ.image L.points)
    (hbOff : b ∉ Finset.univ.image L.points) :
    False := by
  classical
  rcases CGN.CGN6e3_exists_subchain_side_apex
      hconv hmem hrs haA hbA hab har has hbr hbs haeq hbeq with
    haPos | hbPos
  · obtain ⟨j, _, _, hj⟩ :=
      (Hord.subchord_open_side_iff_A hrs haA).mp haPos
    exact haOff (Finset.mem_image.mpr ⟨j, Finset.mem_univ _, hj⟩)
  · obtain ⟨j, _, _, hj⟩ :=
      (Hord.subchord_open_side_iff_A hrs hbA).mp hbPos
    exact hbOff (Finset.mem_image.mpr ⟨j, Finset.mem_univ _, hj⟩)

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- Two distinct blocker centers outside the source cap cannot both bisect
the chord joining two distinct source-cap points. -/
private theorem false_of_twoCapSources_of_blockers_off_firstCap
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (hsourcesNe : source.1 ≠ source'.1)
    (hsourceCap :
      source.1 ∈ S.capInteriorByIndex S.oppIndex1)
    (hsourceCap' :
      source'.1 ∈ S.capInteriorByIndex S.oppIndex1)
    (hmutual :
      TwoCapSourcesMutualCrossMembership (H := H) source source')
    (hblockersNe' : H.blockerVertex source ≠ H.blockerVertex source')
    (haOff :
      H.centerAt source.1 source.2 ∉
        S.capByIndex S.oppIndex1)
    (hbOff :
      H.centerAt source'.1 source'.2 ∉
        S.capByIndex S.oppIndex1) :
    False := by
  classical
  rcases S.capByIndex_cgn4g_capData D.convex S.oppIndex1 with
    ⟨m, L, Packet, _Hside, Hord, hcap⟩
  have hsourceImage :
      source.1 ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact S.capInteriorByIndex_subset_capByIndex
      S.oppIndex1 hsourceCap
  have hsourceImage' :
      source'.1 ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact S.capInteriorByIndex_subset_capByIndex
      S.oppIndex1 hsourceCap'
  rcases Finset.mem_image.mp hsourceImage with
    ⟨r, _hrMem, hr⟩
  rcases Finset.mem_image.mp hsourceImage' with
    ⟨s, _hsMem, hs⟩
  have hrsNe : r ≠ s := by
    intro hrs
    apply hsourcesNe
    calc
      source.1 = L.points r := hr.symm
      _ = L.points s := by rw [hrs]
      _ = source'.1 := hs
  have hab :
      H.centerAt source.1 source.2 ≠
        H.centerAt source'.1 source'.2 := by
    intro hab
    apply hblockersNe'
    apply Subtype.ext
    exact hab
  have haImageOff :
      H.centerAt source.1 source.2 ∉
        Finset.univ.image L.points := by
    simpa [hcap] using haOff
  have hbImageOff :
      H.centerAt source'.1 source'.2 ∉
        Finset.univ.image L.points := by
    simpa [hcap] using hbOff
  have har :
      H.centerAt source.1 source.2 ≠ L.points r := by
    intro har
    exact haImageOff
      (Finset.mem_image.mpr
        ⟨r, Finset.mem_univ _, har.symm⟩)
  have has :
      H.centerAt source.1 source.2 ≠ L.points s := by
    intro has
    exact haImageOff
      (Finset.mem_image.mpr
        ⟨s, Finset.mem_univ _, has.symm⟩)
  have hbr :
      H.centerAt source'.1 source'.2 ≠ L.points r := by
    intro hbr
    exact hbImageOff
      (Finset.mem_image.mpr
        ⟨r, Finset.mem_univ _, hbr.symm⟩)
  have hbs :
      H.centerAt source'.1 source'.2 ≠ L.points s := by
    intro hbs
    exact hbImageOff
      (Finset.mem_image.mpr
        ⟨s, Finset.mem_univ _, hbs.symm⟩)
  have haeq :
      dist (H.centerAt source.1 source.2) (L.points r) =
        dist (H.centerAt source.1 source.2) (L.points s) := by
    rw [hr, hs]
    exact
      ((H.selectedAt source.1
          source.2).toCriticalFourShell.support_eq_radius
        source.1
        (H.selectedAt source.1
          source.2).toCriticalFourShell.q_mem_support).trans
        ((H.selectedAt source.1
          source.2).toCriticalFourShell.support_eq_radius
        source'.1 hmutual.1).symm
  have hbeq :
      dist (H.centerAt source'.1 source'.2) (L.points r) =
        dist (H.centerAt source'.1 source'.2) (L.points s) := by
    rw [hr, hs]
    exact
      ((H.selectedAt source'.1
          source'.2).toCriticalFourShell.support_eq_radius
        source.1 hmutual.2).trans
        ((H.selectedAt source'.1
          source'.2).toCriticalFourShell.support_eq_radius
        source'.1
        (H.selectedAt source'.1
          source'.2).toCriticalFourShell.q_mem_support).symm
  rcases lt_or_gt_of_ne hrsNe with hrs | hsr
  · exact false_of_two_offCap_bisectors
      D.convex Packet.mem_A Hord hrs
      (H.blockerVertex source).2
      (H.blockerVertex source').2 hab
      har has hbr hbs haeq hbeq haImageOff hbImageOff
  · exact false_of_two_offCap_bisectors
      D.convex Packet.mem_A Hord hsr
      (H.blockerVertex source).2
      (H.blockerVertex source').2 hab
      has har hbs hbr haeq.symm hbeq.symm
      haImageOff hbImageOff

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- Complementary choices from the first collision pair are impossible for
two mutually incident cap-source rows with distinct blockers.  The blockers
would be two distinct off-cap bisectors of the chord joining the sources. -/
theorem false_of_twoCapSources_complementaryMembership
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (hsourcesNe : source.1 ≠ source'.1)
    (hsource : FirstFiberCapSourceWitness P Pρ source)
    (hsource' : FirstFiberCapSourceWitness P Pρ source')
    (hmutual :
      TwoCapSourcesMutualCrossMembership (H := H) source source')
    (hblockersNe' : H.blockerVertex source ≠ H.blockerVertex source')
    (hcomplementary :
      (P.source₁ ∈
            (H.selectedAt source.1
              source.2).toCriticalFourShell.support ∧
          P.source₂ ∈
            (H.selectedAt source'.1
              source'.2).toCriticalFourShell.support) ∨
        (P.source₂ ∈
            (H.selectedAt source.1
              source.2).toCriticalFourShell.support ∧
          P.source₁ ∈
            (H.selectedAt source'.1
              source'.2).toCriticalFourShell.support)) :
    False := by
  classical
  rcases exists_mutualBlockerCapIndices_distinct_otherCaps
      P Pρ T source source' hsourcesNe hsource hsource'
      hmutual hblockersNe' hcomplementary with
    ⟨i, j, hi, hj, hiNe, hjNe, _hijNe⟩
  have haOff :
      H.centerAt source.1 source.2 ∉
        S.capByIndex S.oppIndex1 :=
    S.capInteriorByIndex_not_mem_capByIndex_of_ne
      hi hiNe
  have hbOff :
      H.centerAt source'.1 source'.2 ∉
        S.capByIndex S.oppIndex1 :=
    S.capInteriorByIndex_not_mem_capByIndex_of_ne
      hj hjNe
  rcases S.capByIndex_cgn4g_capData D.convex S.oppIndex1 with
    ⟨m, L, Packet, _Hside, Hord, hcap⟩
  have hsourceImage :
      source.1 ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact S.capInteriorByIndex_subset_capByIndex
      S.oppIndex1 hsource.2.1
  have hsourceImage' :
      source'.1 ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact S.capInteriorByIndex_subset_capByIndex
      S.oppIndex1 hsource'.2.1
  rcases Finset.mem_image.mp hsourceImage with
    ⟨r, _hrMem, hr⟩
  rcases Finset.mem_image.mp hsourceImage' with
    ⟨s, _hsMem, hs⟩
  have hrsNe : r ≠ s := by
    intro hrs
    apply hsourcesNe
    calc
      source.1 = L.points r := hr.symm
      _ = L.points s := by rw [hrs]
      _ = source'.1 := hs
  have hab :
      H.centerAt source.1 source.2 ≠
        H.centerAt source'.1 source'.2 := by
    intro hab
    apply hblockersNe'
    apply Subtype.ext
    exact hab
  have haImageOff :
      H.centerAt source.1 source.2 ∉
        Finset.univ.image L.points := by
    simpa [hcap] using haOff
  have hbImageOff :
      H.centerAt source'.1 source'.2 ∉
        Finset.univ.image L.points := by
    simpa [hcap] using hbOff
  have har :
      H.centerAt source.1 source.2 ≠ L.points r := by
    intro har
    exact haImageOff
      (Finset.mem_image.mpr
        ⟨r, Finset.mem_univ _, har.symm⟩)
  have has :
      H.centerAt source.1 source.2 ≠ L.points s := by
    intro has
    exact haImageOff
      (Finset.mem_image.mpr
        ⟨s, Finset.mem_univ _, has.symm⟩)
  have hbr :
      H.centerAt source'.1 source'.2 ≠ L.points r := by
    intro hbr
    exact hbImageOff
      (Finset.mem_image.mpr
        ⟨r, Finset.mem_univ _, hbr.symm⟩)
  have hbs :
      H.centerAt source'.1 source'.2 ≠ L.points s := by
    intro hbs
    exact hbImageOff
      (Finset.mem_image.mpr
        ⟨s, Finset.mem_univ _, hbs.symm⟩)
  have haeq :
      dist (H.centerAt source.1 source.2) (L.points r) =
        dist (H.centerAt source.1 source.2) (L.points s) := by
    rw [hr, hs]
    exact
      ((H.selectedAt source.1
          source.2).toCriticalFourShell.support_eq_radius
        source.1
        (H.selectedAt source.1
          source.2).toCriticalFourShell.q_mem_support).trans
        ((H.selectedAt source.1
          source.2).toCriticalFourShell.support_eq_radius
        source'.1 hmutual.1).symm
  have hbeq :
      dist (H.centerAt source'.1 source'.2) (L.points r) =
        dist (H.centerAt source'.1 source'.2) (L.points s) := by
    rw [hr, hs]
    exact
      ((H.selectedAt source'.1
          source'.2).toCriticalFourShell.support_eq_radius
        source.1 hmutual.2).trans
        ((H.selectedAt source'.1
          source'.2).toCriticalFourShell.support_eq_radius
        source'.1
        (H.selectedAt source'.1
          source'.2).toCriticalFourShell.q_mem_support).symm
  rcases lt_or_gt_of_ne hrsNe with hrs | hsr
  · exact false_of_two_offCap_bisectors
      D.convex Packet.mem_A Hord hrs
      (H.blockerVertex source).2
      (H.blockerVertex source').2 hab
      har has hbr hbs haeq hbeq haImageOff hbImageOff
  · exact false_of_two_offCap_bisectors
      D.convex Packet.mem_A Hord hsr
      (H.blockerVertex source).2
      (H.blockerVertex source').2 hab
      has har hbs hbr haeq.symm hbeq.symm
      haImageOff hbImageOff

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Mutual cross-membership with distinct blocker values is the remaining
geometric arm of the two-cap-source split. -/
theorem false_of_twoCapSources_mutualCrossMembership_distinctBlockers_frame
    (frame : TwoSourceCollisionFrame P Pρ)
    {commonRadius : ℝ}
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (hsourcesNe : source.1 ≠ source'.1)
    (hsourceRadius :
      source.1 ∈ SelectedClass D.A S.oppApex1 commonRadius)
    (hsourceRadius' :
      source'.1 ∈ SelectedClass D.A S.oppApex1 commonRadius)
    (hmutual :
      TwoCapSourcesMutualCrossMembership (H := H) source source')
    (hblockersNe' : H.blockerVertex source ≠ H.blockerVertex source') :
    False := by
  obtain ⟨hρne, hfrontierFour, hρfour, hfrontierInteriorEq, hρInteriorEq,
    hpairsDisjoint, hblockersNe, LPρ, hLPρ, MPρ, LP, hLP, MP⟩ := frame
  apply hblockersNe'
  apply Subtype.ext
  exact blocker_centers_eq_of_secondRadius_mutual_cross_membership
    R source.2 source'.2 hsourcesNe hsourceRadius hsourceRadius'
    hmutual.1 hmutual.2

/-- Mutual cross-membership with distinct blocker values is the remaining
geometric arm of the two-cap-source split.
This is a compatibility wrapper over
`false_of_twoCapSources_mutualCrossMembership_distinctBlockers_frame`,
which takes the same hypotheses packaged as a `TwoSourceCollisionFrame`. -/
theorem false_of_twoCapSources_mutualCrossMembership_distinctBlockers
    {commonRadius : ℝ}
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (hsourcesNe : source.1 ≠ source'.1)
    (hsourceRadius :
      source.1 ∈ SelectedClass D.A S.oppApex1 commonRadius)
    (hsourceRadius' :
      source'.1 ∈ SelectedClass D.A S.oppApex1 commonRadius)
    (hmutual :
      TwoCapSourcesMutualCrossMembership (H := H) source source')
    (hblockersNe' : H.blockerVertex source ≠ H.blockerVertex source') :
    False :=
  false_of_twoCapSources_mutualCrossMembership_distinctBlockers_frame P Pρ T
    ⟨hρne, hfrontierFour, hρfour, hfrontierInteriorEq, hρInteriorEq,
      hpairsDisjoint, hblockersNe, LPρ, hLPρ, MPρ, LP, hLP, MP⟩
    source source' hsourcesNe hsourceRadius hsourceRadius' hmutual hblockersNe'

/-- Six pairwise distinct centers whose exact-four rows survive one common
deletion.  The first five centers are the two collision blockers and the
three robust Moser apices; the last center is the surviving cap-source
blocker. -/
abbrev SixCenterDeletionSurvivalPacket
    (deleted c₀ c₁ c₂ c₃ c₄ c₅ : ℝ²) : Prop :=
  ATailFirstFiberOverlapDescent.FiveCenterDeletionSurvival
      D deleted c₀ c₁ c₂ c₃ c₄ ∧
    HasNEquidistantPointsAt 4 (D.A.erase deleted) c₅ ∧
    ({c₀, c₁, c₂, c₃, c₄, c₅} : Finset ℝ²).card = 6

omit P Pρ hρne hfrontierInteriorEq hρInteriorEq T hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- In an aligned five-row deletion packet, the exact row centered at the
first Moser apex is one of the two retained exact-four classes, and the
deleted point is absent from that full class. -/
theorem fiveSurvivor_firstApexRow_eq_retained_and_deleted_not_mem
    {deleted : ℝ²} {hdeleted : deleted ∈ D.A}
    {c₀ c₁ c₃ c₄ : ℝ²}
    (haligned :
      FirstCapMultiPointRadiiRetained
        (S := S) (radius := radius) (ρ := ρ))
    (B : ATailFiveCenterDeletionBoundary.FiveSurvivorExactRowsBoundary
      D H deleted hdeleted c₀ c₁ S.oppApex1 c₃ c₄) :
    (B.B₂ = SelectedClass D.A S.oppApex1 radius ∧
        deleted ∉ SelectedClass D.A S.oppApex1 radius) ∨
      (B.B₂ = SelectedClass D.A S.oppApex1 ρ ∧
        deleted ∉ SelectedClass D.A S.oppApex1 ρ) := by
  let K₂ : SelectedFourClass D.A S.oppApex1 :=
    ATailFiveCenterDeletionBoundary.qDeletedK4ClassToSelectedFourClass
      B.K₂ B.B₂_card
  have hdeletedB₂ : deleted ∉ B.B₂ :=
    ATailFiveCenterDeletionBoundary.qDeletedK4Class_deleted_not_mem_support
      B.K₂
  rcases
      firstApex_selectedFourClass_support_eq_retained_of_aligned
        (hfrontierFour := hfrontierFour) (hρfour := hρfour)
        haligned K₂ with hrow | hrow
  · left
    refine ⟨hrow, ?_⟩
    rwa [← hrow]
  · right
    refine ⟨hrow, ?_⟩
    rwa [← hrow]

/-- Exact theorem-facing boundary of a six-center deletion-survival packet. -/
structure SixSurvivorExactRowsBoundary
    (deleted : CriticalShellSystem.CarrierVertex D.A)
    (c₀ c₁ c₂ c₃ c₄ c₅ : ℝ²) : Type where
  firstFive :
    ATailFiveCenterDeletionBoundary.FiveSurvivorExactRowsBoundary
      D H deleted.1 deleted.2 c₀ c₁ c₂ c₃ c₄
  B₅ : Finset ℝ²
  K₅ : U5QDeletedK4Class D deleted.1 c₅ B₅
  B₅_card : B₅.card = 4
  actualBlocker_ne₅ : H.centerAt deleted.1 deleted.2 ≠ c₅
  centers_card : ({c₀, c₁, c₂, c₃, c₄, c₅} : Finset ℝ²).card = 6

omit P Pρ hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Forget the upstream seventh-blocker wrapper into the canonical six-row
U3 ingress packet.  This is a field-for-field adapter; it adds no hypothesis
and discards no row provenance. -/
def SeventhBlockerQDeletedSixthRowBoundary.toSixSurvivorExactRowsBoundary
    {deleted : CriticalShellSystem.CarrierVertex D.A}
    {c₀ c₁ c₂ c₃ c₄ c₅ : ℝ²}
    (B : SeventhBlockerQDeletedSixthRowBoundary (D := D) (H := H) deleted
      c₀ c₁ c₂ c₃ c₄ c₅) :
    SixSurvivorExactRowsBoundary (D := D) (H := H) deleted
      c₀ c₁ c₂ c₃ c₄ c₅ where
  firstFive := B.firstFive
  B₅ := B.B₅
  K₅ := B.K₅
  B₅_card := B.B₅_card
  actualBlocker_ne₅ := B.actualBlocker_ne₅
  centers_card := B.centers_card

omit P Pρ hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Install the first five exact rows of a six-survivor boundary in one
faithful carrier pattern.  The sixth center supplies the distinctness needed
to show that the first five centers really form a five-element set.

This is an ingress adapter only: it preserves the five named rows but does not
produce a closure edge or a metric contradiction. -/
theorem SixSurvivorExactRowsBoundary.exists_faithfulCarrierPattern_firstFive
    {deleted : CriticalShellSystem.CarrierVertex D.A}
    {c₀ c₁ c₂ c₃ c₄ c₅ : ℝ²}
    (B : SixSurvivorExactRowsBoundary (D := D) (H := H) deleted
      c₀ c₁ c₂ c₃ c₄ c₅)
    (hc₀ : c₀ ∈ D.A) (hc₁ : c₁ ∈ D.A) (hc₂ : c₂ ∈ D.A)
    (hc₃ : c₃ ∈ D.A) (hc₄ : c₄ ∈ D.A) :
    ∃ F : FaithfulCarrierPattern D.A,
      F.classAt c₀ hc₀ =
          ATailFiveCenterDeletionBoundary.qDeletedK4ClassToSelectedFourClass
            B.firstFive.K₀ B.firstFive.B₀_card ∧
      F.classAt c₁ hc₁ =
          ATailFiveCenterDeletionBoundary.qDeletedK4ClassToSelectedFourClass
            B.firstFive.K₁ B.firstFive.B₁_card ∧
      F.classAt c₂ hc₂ =
          ATailFiveCenterDeletionBoundary.qDeletedK4ClassToSelectedFourClass
            B.firstFive.K₂ B.firstFive.B₂_card ∧
      F.classAt c₃ hc₃ =
          ATailFiveCenterDeletionBoundary.qDeletedK4ClassToSelectedFourClass
            B.firstFive.K₃ B.firstFive.B₃_card ∧
      F.classAt c₄ hc₄ =
          ATailFiveCenterDeletionBoundary.qDeletedK4ClassToSelectedFourClass
            B.firstFive.K₄ B.firstFive.B₄_card := by
  have hfullLe :
      ({c₀, c₁, c₂, c₃, c₄, c₅} : Finset ℝ²).card ≤
        ({c₀, c₁, c₂, c₃, c₄} : Finset ℝ²).card + 1 := by
    calc
      ({c₀, c₁, c₂, c₃, c₄, c₅} : Finset ℝ²).card =
          (insert c₅ ({c₀, c₁, c₂, c₃, c₄} : Finset ℝ²)).card := by
            apply congrArg Finset.card
            ext x
            simp only [Finset.mem_insert, Finset.mem_singleton]
            aesop
      _ ≤ ({c₀, c₁, c₂, c₃, c₄} : Finset ℝ²).card + 1 :=
        Finset.card_insert_le c₅ _
  have hcenters : ({c₀, c₁, c₂, c₃, c₄} : Finset ℝ²).card = 5 := by
    have hfull := B.centers_card
    have hupper := five_point_literal_card_le
      (a := c₀) (b := c₁) (c := c₂) (d := c₃) (e := c₄)
    omega
  exact
    ATailFiveCenterDeletionBoundary.exists_faithfulCarrierPattern_with_fiveSurvivorClasses
      B.firstFive hc₀ hc₁ hc₂ hc₃ hc₄ hcenters

omit P Pρ hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- The deleted point's blocked actual center is exactly the localized
no-q-free center required by the U3 fixed-triple extractor. -/
theorem SixSurvivorExactRowsBoundary.localizedNoQFreePacket
    {deleted : CriticalShellSystem.CarrierVertex D.A}
    {c₀ c₁ c₂ c₃ c₄ c₅ : ℝ²}
    (B : SixSurvivorExactRowsBoundary (D := D) (H := H) deleted
      c₀ c₁ c₂ c₃ c₄ c₅) :
    U3LocalizedNoQFreePacket D deleted.1
      (H.centerAt deleted.1 deleted.2) := by
  refine
    { q_mem := deleted.2
      p_mem_skeleton := mem_skeleton_of_mem_ne
        (H.blockerVertex deleted).2 B.firstFive.actualBlocker_ne_deleted
      no_qfree := ?_ }
  intro hfree
  exact B.firstFive.actualBlocker_fails
    (hasNEquidistantPointsAt_of_erase hfree)

omit P Pρ hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Every six-row deletion boundary produces a U3 dangerous triple and its
bounded audit frame.  The remaining terminal premise is rowwise confinement
of the audit-center classes, not construction of the U3 packet itself. -/
theorem SixSurvivorExactRowsBoundary.exists_fixedTripleAuditFrame
    {deleted : CriticalShellSystem.CarrierVertex D.A}
    {c₀ c₁ c₂ c₃ c₄ c₅ : ℝ²}
    (B : SixSurvivorExactRowsBoundary (D := D) (H := H) deleted
      c₀ c₁ c₂ c₃ c₄ c₅)
    (hcard : 9 < D.A.card) :
    ∃ t₁ t₂ t₃ : ℝ²,
      Nonempty
        (U3FixedTripleAuditFrame D deleted.1
          (H.centerAt deleted.1 deleted.2) t₁ t₂ t₃) := by
  let P₃ := B.localizedNoQFreePacket
  rcases B.firstFive.actualBlocker_uniqueFour with
    ⟨hblockerMem, r, hr, hclassCard, -⟩
  have hK4 :
      HasNEquidistantPointsAt 4 D.A (H.centerAt deleted.1 deleted.2) :=
    ⟨r, hr, le_of_eq hclassCard.symm⟩
  rcases exists_u3FixedTriplePacket_of_k4_no_qfree
      P₃.q_mem hblockerMem B.firstFive.actualBlocker_ne_deleted hK4
      P₃.no_qfree with ⟨t₁, t₂, t₃, F₃⟩
  exact
    ⟨t₁, t₂, t₃,
      P₃.exists_fixedTripleAuditFrame_of_card_gt_nine F₃ hcard⟩

/-- Exact finite obstruction exposed by a fixed U3 audit frame: one bounded
audit center has either an exact q-deleted four-row escaping the bounded
support or an ambient critical four-shell through the deleted point. -/
abbrev SixSurvivorU3AuditObstruction
    (deleted : CriticalShellSystem.CarrierVertex D.A) : Prop :=
  ∃ t₁ t₂ t₃ : ℝ²,
    ∃ F : U3FixedTripleAuditFrame D deleted.1
        (H.centerAt deleted.1 deleted.2) t₁ t₂ t₃,
      ∃ x,
        x ∈ U5BoundedAuditCenters D deleted.1
          (H.centerAt deleted.1 deleted.2)
          ({t₁, t₂, t₃} : Finset ℝ²) F.u F.a0 F.a1 ∧
          ((∃ (B : Finset ℝ²) (z : ℝ²),
              Nonempty (U5QDeletedK4Class D deleted.1 x B) ∧
                B.card = 4 ∧
                z ∈ B ∧
                z ∉ U5BoundedSupport D deleted.1
                  (H.centerAt deleted.1 deleted.2)
                  ({t₁, t₂, t₃} : Finset ℝ²) F.u F.a0 F.a1) ∨
            Nonempty (CriticalFourShell D.A deleted.1 x))

omit P Pρ hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- The six-row boundary supplies the exact finite U3 obstruction consumed by
the source-faithful computational ingress. -/
theorem SixSurvivorExactRowsBoundary.exists_u3AuditObstruction
    {deleted : CriticalShellSystem.CarrierVertex D.A}
    {c₀ c₁ c₂ c₃ c₄ c₅ : ℝ²}
    (B : SixSurvivorExactRowsBoundary (D := D) (H := H) deleted
      c₀ c₁ c₂ c₃ c₄ c₅)
    (hcard : 9 < D.A.card) :
    SixSurvivorU3AuditObstruction (H := H) deleted := by
  rcases B.exists_fixedTripleAuditFrame hcard with ⟨t₁, t₂, t₃, ⟨F⟩⟩
  rcases F.exists_qDeleted_escape_or_criticalFourShell with ⟨x, hx, hobs⟩
  exact ⟨t₁, t₂, t₃, F, x, hx, hobs⟩

/-- The U3 audit obstruction with the source-derived exact dangerous radius
and the resulting off-circle candidate attached to every escaping row.

This is stronger than `SixSurvivorU3AuditObstruction`, but it is still only an
obstruction packet: the critical-shell arm and an escaping candidate both need
a further universal consumer. -/
abbrev SixSurvivorU3ExactRadiusAuditObstruction
    (deleted : CriticalShellSystem.CarrierVertex D.A) : Prop :=
  ∃ t₁ t₂ t₃ : ℝ²,
    ∃ F : U3FixedTripleAuditFrame D deleted.1
        (H.centerAt deleted.1 deleted.2) t₁ t₂ t₃,
      (((D.skeleton deleted.1).erase
          (H.centerAt deleted.1 deleted.2)).filter fun y =>
        dist (H.centerAt deleted.1 deleted.2) y =
          dist (H.centerAt deleted.1 deleted.2) deleted.1).card = 3 ∧
        ∃ x,
          x ∈ U5BoundedAuditCenters D deleted.1
            (H.centerAt deleted.1 deleted.2)
            ({t₁, t₂, t₃} : Finset ℝ²) F.u F.a0 F.a1 ∧
            ((∃ (B : Finset ℝ²) (z : ℝ²),
                Nonempty (U5QDeletedK4Class D deleted.1 x B) ∧
                  B.card = 4 ∧
                  (B ∩ insert deleted.1
                    ({t₁, t₂, t₃} : Finset ℝ²)).card ≤ 2 ∧
                  2 ≤ (B \ insert deleted.1
                    ({t₁, t₂, t₃} : Finset ℝ²)).card ∧
                  z ∈ B ∧
                  z ∉ U5BoundedSupport D deleted.1
                    (H.centerAt deleted.1 deleted.2)
                    ({t₁, t₂, t₃} : Finset ℝ²) F.u F.a0 F.a1 ∧
                  U5SelectedCandidateSkeleton D deleted.1
                    (H.centerAt deleted.1 deleted.2)
                    ({t₁, t₂, t₃} : Finset ℝ²) z ∧
                  dist (H.centerAt deleted.1 deleted.2) z ≠
                    dist (H.centerAt deleted.1 deleted.2) deleted.1) ∨
              ∃ K : CriticalFourShell D.A deleted.1 x,
                (K.support ∩ insert deleted.1
                  ({t₁, t₂, t₃} : Finset ℝ²)).card ≤ 2 ∧
                2 ≤ (K.support \ insert deleted.1
                  ({t₁, t₂, t₃} : Finset ℝ²)).card)

omit P Pρ hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- A six-row deletion boundary supplies the exact-radius U3 obstruction.
The proof only composes the localized no-q-free exactness theorem with the
existing escape-or-critical-shell producer. -/
theorem SixSurvivorExactRowsBoundary.exists_u3ExactRadiusAuditObstruction
    {deleted : CriticalShellSystem.CarrierVertex D.A}
    {c₀ c₁ c₂ c₃ c₄ c₅ : ℝ²}
    (B : SixSurvivorExactRowsBoundary (D := D) (H := H) deleted
      c₀ c₁ c₂ c₃ c₄ c₅)
    (hcard : 9 < D.A.card) :
    SixSurvivorU3ExactRadiusAuditObstruction (H := H) deleted := by
  let P₃ := B.localizedNoQFreePacket
  rcases B.exists_fixedTripleAuditFrame hcard with ⟨t₁, t₂, t₃, ⟨F⟩⟩
  have hexact :=
    P₃.exact_radius_class_card_eq_three_of_dangerousTriple F.dangerous
  rcases F.exists_qDeleted_escape_or_criticalFourShell with ⟨x, hx, hobs⟩
  refine ⟨t₁, t₂, t₃, F, hexact, x, hx, ?_⟩
  rcases hobs with hescape | hshell
  · left
    rcases hescape with ⟨Brow, z, ⟨K⟩, hBrowCard, hzBrow, hzOutside⟩
    have hdistribution :=
      F.qDeletedRow_dangerousCircle_distribution hx K hBrowCard
    have hcandidate :=
      F.dangerous.candidate_of_not_mem_boundedSupport
        K hzBrow hzOutside hexact
    exact
      ⟨Brow, z, ⟨K⟩, hBrowCard, hdistribution.1, hdistribution.2,
        hzBrow, hzOutside,
        hcandidate.1, hcandidate.2⟩
  · rcases hshell with ⟨K⟩
    have hdistribution :=
      F.criticalFourShell_dangerousCircle_distribution hx K
    exact Or.inr ⟨K, hdistribution⟩

omit P Pρ hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- The upstream seventh-blocker packet enters the exact-radius U3 reduction
without a separate cardinality hypothesis.  The live tri-apex context already
forces every indexed cap to have at least six points, hence the carrier has at
least fifteen points. -/
theorem SeventhBlockerQDeletedSixthRowBoundary.exists_u3ExactRadiusAuditObstruction
    {deleted : CriticalShellSystem.CarrierVertex D.A}
    {c₀ c₁ c₂ c₃ c₄ c₅ : ℝ²}
    (B : SeventhBlockerQDeletedSixthRowBoundary (D := D) (H := H) deleted
      c₀ c₁ c₂ c₃ c₄ c₅) :
    SixSurvivorU3ExactRadiusAuditObstruction (H := H) deleted := by
  have hcard15 : 15 ≤ D.A.card :=
    ATailExactFifteenApexProfile.card_ge_fifteen_of_all_cap_card_ge_six
      S (triApexAllLargeContext_of_residuals L N T).cap_card_ge_six
  have hcard : 9 < D.A.card := by omega
  exact B.toSixSurvivorExactRowsBoundary.exists_u3ExactRadiusAuditObstruction
    hcard

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Consumer-facing form of the seventh-row split.  Either the deleted endpoint
is a positive incidence in the escaping point's actual-blocker row, or the
same source packet reaches the exact-radius U3 escape/mixed residual. -/
theorem FirstFiberCrossedSeventhBlockerBoundary.deleted_mem_actualBlockerClass_or_u3ExactRadiusAuditObstruction
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (commonOutside oppositeOutside : ℝ²)
    (E : FirstFiberCrossedThreeRowExactSupports
      P Pρ Q source source' commonOutside oppositeOutside)
    {q : ℝ²} {hq : q ∈ D.A} {c₀ c₁ c₂ c₃ c₄ c₅ : ℝ²}
    (B₇ : FirstFiberCrossedSeventhBlockerBoundary
      P Pρ Q source source' commonOutside oppositeOutside E
      q hq c₀ c₁ c₂ c₃ c₄ c₅)
    (hblockerEq : H.centerAt q hq = c₅) :
    q ∈
        (B₇.boundary.carrierPattern.classAt
          (H.centerAt B₇.escape.escapePoint B₇.escapePoint_mem_A)
          (Census554.GeneralCarrierBridge.blockerLabel H
            B₇.escape.escapePoint B₇.escapePoint_mem_A).2).support ∨
      SixSurvivorU3ExactRadiusAuditObstruction (H := H) ⟨q, hq⟩ := by
  rcases B₇.deleted_mem_actualBlockerClass_or_sixSurvivor
      (P := P) (Pρ := Pρ) Q source source' commonOutside oppositeOutside E
      hblockerEq with hrow | hsix
  · exact Or.inl hrow
  · rcases hsix with ⟨Bsix⟩
    exact Or.inr
      (SeventhBlockerQDeletedSixthRowBoundary.exists_u3ExactRadiusAuditObstruction
        (T := T) Bsix)

/-- Positive-incidence endpoint of the seventh-blocker reduction.  The packet
retains the original boundary, the identity of its deleted source, and the
identification of the sixth center with that source's actual blocker. -/
structure FirstFiberCrossedSeventhPositiveIncidenceBoundary
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (commonOutside oppositeOutside : ℝ²)
    (E : FirstFiberCrossedThreeRowExactSupports
      P Pρ Q source source' commonOutside oppositeOutside) : Type where
  deleted : CriticalShellSystem.CarrierVertex D.A
  c₀ : ℝ²
  c₁ : ℝ²
  c₂ : ℝ²
  c₃ : ℝ²
  c₄ : ℝ²
  c₅ : ℝ²
  boundary : FirstFiberCrossedSeventhBlockerBoundary
    P Pρ Q source source' commonOutside oppositeOutside E
    deleted.1 deleted.2 c₀ c₁ c₂ c₃ c₄ c₅
  deleted_point_eq_source :
    deleted.1 = P.source₁ ∨ deleted.1 = Pρ.source₁ ∨
      deleted.1 = P.source₂ ∨ deleted.1 = Pρ.source₂
  actualBlocker_eq_sixth : H.centerAt deleted.1 deleted.2 = c₅
  deleted_mem_actualBlockerClass :
    deleted.1 ∈
      (boundary.boundary.carrierPattern.classAt
        (H.centerAt boundary.escape.escapePoint boundary.escapePoint_mem_A)
        (Census554.GeneralCarrierBridge.blockerLabel H
          boundary.escape.escapePoint boundary.escapePoint_mem_A).2).support

/-- U3 endpoint of the seventh-blocker reduction, retaining which of the four
canonical sources supplied the deleted row. -/
structure FirstFiberCrossedSeventhU3ExactRadiusBoundary : Type where
  deleted : CriticalShellSystem.CarrierVertex D.A
  deleted_point_eq_source :
    deleted.1 = P.source₁ ∨ deleted.1 = Pρ.source₁ ∨
      deleted.1 = P.source₂ ∨ deleted.1 = Pρ.source₂
  obstruction : SixSurvivorU3ExactRadiusAuditObstruction (H := H) deleted

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Collapse the four source choices in the faithful seventh-blocker residual
to the two mathematically distinct endpoints: positive incidence in the
seventh row, or the exact-radius U3 escape/mixed obstruction. -/
theorem FirstFiberCollisionCrossedSeventhBlockerResidual.to_positive_or_u3
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (commonOutside oppositeOutside : ℝ²)
    (E : FirstFiberCrossedThreeRowExactSupports
      P Pρ Q source source' commonOutside oppositeOutside)
    (R : FirstFiberCollisionCrossedSeventhBlockerResidual
      P Pρ Q source source' commonOutside oppositeOutside E) :
    Nonempty (FirstFiberCrossedSeventhPositiveIncidenceBoundary
      (P := P) (Pρ := Pρ) (H := H)
      Q source source' commonOutside oppositeOutside E) ∨
      Nonempty (FirstFiberCrossedSeventhU3ExactRadiusBoundary
        (P := P) (Pρ := Pρ) (H := H)) := by
  rcases R with hP₁ | hPρ₁ | hP₂ | hPρ₂
  · rcases hP₁ with ⟨B₇⟩
    rcases FirstFiberCrossedSeventhBlockerBoundary.deleted_mem_actualBlockerClass_or_u3ExactRadiusAuditObstruction
        (P := P) (Pρ := Pρ) (T := T)
        Q source source' commonOutside oppositeOutside E B₇ rfl with h | h
    · exact Or.inl ⟨{
        deleted := ⟨P.source₁, P.source₁_mem_A⟩
        c₀ := H.centerAt source.1 source.2
        c₁ := S.oppApex1
        c₂ := H.centerAt Pρ.source₁ Pρ.source₁_mem_A
        c₃ := S.oppApex2
        c₄ := S.surplusApex
        c₅ := H.centerAt P.source₁ P.source₁_mem_A
        boundary := B₇
        deleted_point_eq_source := Or.inl rfl
        actualBlocker_eq_sixth := rfl
        deleted_mem_actualBlockerClass := h }⟩
    · exact Or.inr ⟨{
        deleted := ⟨P.source₁, P.source₁_mem_A⟩
        deleted_point_eq_source := Or.inl rfl
        obstruction := h }⟩
  · rcases hPρ₁ with ⟨B₇⟩
    rcases FirstFiberCrossedSeventhBlockerBoundary.deleted_mem_actualBlockerClass_or_u3ExactRadiusAuditObstruction
        (P := P) (Pρ := Pρ) (T := T)
        Q source source' commonOutside oppositeOutside E B₇ rfl with h | h
    · exact Or.inl ⟨{
        deleted := ⟨Pρ.source₁, Pρ.source₁_mem_A⟩
        c₀ := H.centerAt source.1 source.2
        c₁ := S.oppApex1
        c₂ := H.centerAt P.source₁ P.source₁_mem_A
        c₃ := S.oppApex2
        c₄ := S.surplusApex
        c₅ := H.centerAt Pρ.source₁ Pρ.source₁_mem_A
        boundary := B₇
        deleted_point_eq_source := Or.inr (Or.inl rfl)
        actualBlocker_eq_sixth := rfl
        deleted_mem_actualBlockerClass := h }⟩
    · exact Or.inr ⟨{
        deleted := ⟨Pρ.source₁, Pρ.source₁_mem_A⟩
        deleted_point_eq_source := Or.inr (Or.inl rfl)
        obstruction := h }⟩
  · rcases hP₂ with ⟨B₇⟩
    have hblockerEq :
        H.centerAt P.source₂ P.source₂_mem_A =
          H.centerAt P.source₁ P.source₁_mem_A := P.blockers_eq.symm
    rcases FirstFiberCrossedSeventhBlockerBoundary.deleted_mem_actualBlockerClass_or_u3ExactRadiusAuditObstruction
        (P := P) (Pρ := Pρ) (T := T)
        Q source source' commonOutside oppositeOutside E B₇ hblockerEq
        with h | h
    · exact Or.inl ⟨{
        deleted := ⟨P.source₂, P.source₂_mem_A⟩
        c₀ := H.centerAt source.1 source.2
        c₁ := S.oppApex1
        c₂ := H.centerAt Pρ.source₁ Pρ.source₁_mem_A
        c₃ := S.oppApex2
        c₄ := S.surplusApex
        c₅ := H.centerAt P.source₁ P.source₁_mem_A
        boundary := B₇
        deleted_point_eq_source := Or.inr (Or.inr (Or.inl rfl))
        actualBlocker_eq_sixth := hblockerEq
        deleted_mem_actualBlockerClass := h }⟩
    · exact Or.inr ⟨{
        deleted := ⟨P.source₂, P.source₂_mem_A⟩
        deleted_point_eq_source := Or.inr (Or.inr (Or.inl rfl))
        obstruction := h }⟩
  · rcases hPρ₂ with ⟨B₇⟩
    have hblockerEq :
        H.centerAt Pρ.source₂ Pρ.source₂_mem_A =
          H.centerAt Pρ.source₁ Pρ.source₁_mem_A := Pρ.blockers_eq.symm
    rcases FirstFiberCrossedSeventhBlockerBoundary.deleted_mem_actualBlockerClass_or_u3ExactRadiusAuditObstruction
        (P := P) (Pρ := Pρ) (T := T)
        Q source source' commonOutside oppositeOutside E B₇ hblockerEq
        with h | h
    · exact Or.inl ⟨{
        deleted := ⟨Pρ.source₂, Pρ.source₂_mem_A⟩
        c₀ := H.centerAt source.1 source.2
        c₁ := S.oppApex1
        c₂ := H.centerAt P.source₁ P.source₁_mem_A
        c₃ := S.oppApex2
        c₄ := S.surplusApex
        c₅ := H.centerAt Pρ.source₁ Pρ.source₁_mem_A
        boundary := B₇
        deleted_point_eq_source := Or.inr (Or.inr (Or.inr rfl))
        actualBlocker_eq_sixth := hblockerEq
        deleted_mem_actualBlockerClass := h }⟩
    · exact Or.inr ⟨{
        deleted := ⟨Pρ.source₂, Pρ.source₂_mem_A⟩
        deleted_point_eq_source := Or.inr (Or.inr (Or.inr rfl))
        obstruction := h }⟩

omit P Pρ hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- If the exact-radius U3 frame emitted by a six-row boundary admits the
mixed confined packet, the finite all-shell exclusion returns one actual
confined q-deleted row.  This is a strict mode refinement, not a contradiction:
the remaining producer is the universal construction of the mixed packet. -/
theorem SixSurvivorExactRowsBoundary.exists_confined_qDeletedRow_of_mixedFrame
    {deleted : CriticalShellSystem.CarrierVertex D.A}
    {c₀ c₁ c₂ c₃ c₄ c₅ : ℝ²}
    (B : SixSurvivorExactRowsBoundary (D := D) (H := H) deleted
      c₀ c₁ c₂ c₃ c₄ c₅)
    (hcard : 9 < D.A.card)
    (hmixed :
      ∀ {t₁ t₂ t₃ : ℝ²}
        (F : U3FixedTripleAuditFrame D deleted.1
          (H.centerAt deleted.1 deleted.2) t₁ t₂ t₃),
        (((D.skeleton deleted.1).erase
          (H.centerAt deleted.1 deleted.2)).filter fun y =>
            dist (H.centerAt deleted.1 deleted.2) y =
              dist (H.centerAt deleted.1 deleted.2) deleted.1).card = 3 →
          F.MixedConfinedAuditPacket) :
    ∃ t₁ t₂ t₃ : ℝ²,
      ∃ F : U3FixedTripleAuditFrame D deleted.1
          (H.centerAt deleted.1 deleted.2) t₁ t₂ t₃,
        (((D.skeleton deleted.1).erase
          (H.centerAt deleted.1 deleted.2)).filter fun y =>
            dist (H.centerAt deleted.1 deleted.2) y =
              dist (H.centerAt deleted.1 deleted.2) deleted.1).card = 3 ∧
          ∃ x ∈ U5BoundedAuditCenters D deleted.1
              (H.centerAt deleted.1 deleted.2)
              ({t₁, t₂, t₃} : Finset ℝ²) F.u F.a0 F.a1,
            ∃ Brow : Finset ℝ²,
              Nonempty (U5QDeletedK4Class D deleted.1 x Brow) ∧
                Brow.card = 4 ∧
                Brow ⊆ U5BoundedSupport D deleted.1
                  (H.centerAt deleted.1 deleted.2)
                  ({t₁, t₂, t₃} : Finset ℝ²)
                  F.u F.a0 F.a1 := by
  let P₃ := B.localizedNoQFreePacket
  rcases B.exists_fixedTripleAuditFrame hcard with ⟨t₁, t₂, t₃, ⟨F⟩⟩
  have hexact :=
    P₃.exact_radius_class_card_eq_three_of_dangerousTriple F.dangerous
  have hrow :=
    _root_.Problem97.U3MixedFiniteExtraction.MixedConfinedAuditPacket.exists_confined_qDeletedRow_of_mode
      (hmixed F hexact)
  exact ⟨t₁, t₂, t₃, F, hexact, hrow⟩

omit P Pρ hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- The uniform shell-multiplicity bound strengthens the mixed-frame adapter:
two distinct audit centers carry actual confined q-deleted rows.  This is a
strict mode descent, but still not a contradiction without a reciprocal-
incidence or return/collision producer for the two rows. -/
theorem SixSurvivorExactRowsBoundary.exists_two_confined_qDeletedRows_of_mixedFrame
    {deleted : CriticalShellSystem.CarrierVertex D.A}
    {c₀ c₁ c₂ c₃ c₄ c₅ : ℝ²}
    (B : SixSurvivorExactRowsBoundary (D := D) (H := H) deleted
      c₀ c₁ c₂ c₃ c₄ c₅)
    (hcard : 9 < D.A.card)
    (hmixed :
      ∀ {t₁ t₂ t₃ : ℝ²}
        (F : U3FixedTripleAuditFrame D deleted.1
          (H.centerAt deleted.1 deleted.2) t₁ t₂ t₃),
        (((D.skeleton deleted.1).erase
          (H.centerAt deleted.1 deleted.2)).filter fun y =>
            dist (H.centerAt deleted.1 deleted.2) y =
              dist (H.centerAt deleted.1 deleted.2) deleted.1).card = 3 →
          F.MixedConfinedAuditPacket) :
    ∃ t₁ t₂ t₃ : ℝ²,
      ∃ F : U3FixedTripleAuditFrame D deleted.1
          (H.centerAt deleted.1 deleted.2) t₁ t₂ t₃,
        (((D.skeleton deleted.1).erase
          (H.centerAt deleted.1 deleted.2)).filter fun y =>
            dist (H.centerAt deleted.1 deleted.2) y =
              dist (H.centerAt deleted.1 deleted.2) deleted.1).card = 3 ∧
          ∃ x₁ x₂,
            x₁ ∈ U5BoundedAuditCenters D deleted.1
                (H.centerAt deleted.1 deleted.2)
                ({t₁, t₂, t₃} : Finset ℝ²) F.u F.a0 F.a1 ∧
            x₂ ∈ U5BoundedAuditCenters D deleted.1
                (H.centerAt deleted.1 deleted.2)
                ({t₁, t₂, t₃} : Finset ℝ²) F.u F.a0 F.a1 ∧
            x₁ ≠ x₂ ∧
            ∃ Brow₁ Brow₂ : Finset ℝ²,
              Nonempty (U5QDeletedK4Class D deleted.1 x₁ Brow₁) ∧
              Brow₁.card = 4 ∧
              Brow₁ ⊆ U5BoundedSupport D deleted.1
                (H.centerAt deleted.1 deleted.2)
                ({t₁, t₂, t₃} : Finset ℝ²)
                F.u F.a0 F.a1 ∧
              Nonempty (U5QDeletedK4Class D deleted.1 x₂ Brow₂) ∧
              Brow₂.card = 4 ∧
              Brow₂ ⊆ U5BoundedSupport D deleted.1
                (H.centerAt deleted.1 deleted.2)
                ({t₁, t₂, t₃} : Finset ℝ²)
                F.u F.a0 F.a1 := by
  let P₃ := B.localizedNoQFreePacket
  rcases B.exists_fixedTripleAuditFrame hcard with ⟨t₁, t₂, t₃, ⟨F⟩⟩
  have hexact :=
    P₃.exact_radius_class_card_eq_three_of_dangerousTriple F.dangerous
  have hrows :=
    _root_.Problem97.U3MixedFiniteExtraction.MixedConfinedAuditPacket.exists_two_confined_qDeletedRows_of_mode
      (hmixed F hexact)
  exact ⟨t₁, t₂, t₃, F, hexact, hrows⟩

omit P Pρ hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Strengthened mixed-frame adapter: the two confined q-deleted rows overlap
in exactly one or two points.  This is the stable boundary ingress for any
later reciprocal-incidence consumer. -/
theorem SixSurvivorExactRowsBoundary.exists_two_confined_qDeletedRows_with_intersection_of_mixedFrame
    {deleted : CriticalShellSystem.CarrierVertex D.A}
    {c₀ c₁ c₂ c₃ c₄ c₅ : ℝ²}
    (B : SixSurvivorExactRowsBoundary (D := D) (H := H) deleted
      c₀ c₁ c₂ c₃ c₄ c₅)
    (hcard : 9 < D.A.card)
    (hmixed :
      ∀ {t₁ t₂ t₃ : ℝ²}
        (F : U3FixedTripleAuditFrame D deleted.1
          (H.centerAt deleted.1 deleted.2) t₁ t₂ t₃),
        (((D.skeleton deleted.1).erase
          (H.centerAt deleted.1 deleted.2)).filter fun y =>
            dist (H.centerAt deleted.1 deleted.2) y =
              dist (H.centerAt deleted.1 deleted.2) deleted.1).card = 3 →
          F.MixedConfinedAuditPacket) :
    ∃ t₁ t₂ t₃ : ℝ²,
      ∃ F : U3FixedTripleAuditFrame D deleted.1
          (H.centerAt deleted.1 deleted.2) t₁ t₂ t₃,
        (((D.skeleton deleted.1).erase
          (H.centerAt deleted.1 deleted.2)).filter fun y =>
            dist (H.centerAt deleted.1 deleted.2) y =
              dist (H.centerAt deleted.1 deleted.2) deleted.1).card = 3 ∧
          ∃ x₁ x₂,
            x₁ ∈ U5BoundedAuditCenters D deleted.1
                (H.centerAt deleted.1 deleted.2)
                ({t₁, t₂, t₃} : Finset ℝ²) F.u F.a0 F.a1 ∧
            x₂ ∈ U5BoundedAuditCenters D deleted.1
                (H.centerAt deleted.1 deleted.2)
                ({t₁, t₂, t₃} : Finset ℝ²) F.u F.a0 F.a1 ∧
            x₁ ≠ x₂ ∧
            ∃ Brow₁ Brow₂ : Finset ℝ²,
              Nonempty (U5QDeletedK4Class D deleted.1 x₁ Brow₁) ∧
              Brow₁.card = 4 ∧
              Brow₁ ⊆ U5BoundedSupport D deleted.1
                (H.centerAt deleted.1 deleted.2)
                ({t₁, t₂, t₃} : Finset ℝ²)
                F.u F.a0 F.a1 ∧
              Nonempty (U5QDeletedK4Class D deleted.1 x₂ Brow₂) ∧
              Brow₂.card = 4 ∧
              Brow₂ ⊆ U5BoundedSupport D deleted.1
                (H.centerAt deleted.1 deleted.2)
                ({t₁, t₂, t₃} : Finset ℝ²)
                F.u F.a0 F.a1 ∧
              1 ≤ (Brow₁ ∩ Brow₂).card ∧
              (Brow₁ ∩ Brow₂).card ≤ 2 := by
  let P₃ := B.localizedNoQFreePacket
  rcases B.exists_fixedTripleAuditFrame hcard with ⟨t₁, t₂, t₃, ⟨F⟩⟩
  have hexact :=
    P₃.exact_radius_class_card_eq_three_of_dangerousTriple F.dangerous
  have hrows :=
    _root_.Problem97.U3MixedFiniteExtraction.MixedConfinedAuditPacket.exists_two_confined_qDeletedRows_with_intersection
      (hmixed F hexact)
  exact ⟨t₁, t₂, t₃, F, hexact, hrows⟩

omit P Pρ hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Finite-orbit reduction for a six-row deletion boundary.  From one
source-produced exact-radius U3 frame, either some reachable frame has the
mixed confined packet, or the provenance-preserving escaping-step relation
contains a return cycle of period at least four.  This is a strict residual
decomposition, not yet a contradiction. -/
theorem SixSurvivorExactRowsBoundary.exists_mixedFrame_or_u3EscapingAuditCycle
    {deleted : CriticalShellSystem.CarrierVertex D.A}
    {c₀ c₁ c₂ c₃ c₄ c₅ : ℝ²}
    (B : SixSurvivorExactRowsBoundary (D := D) (H := H) deleted
      c₀ c₁ c₂ c₃ c₄ c₅)
    (hcard : 9 < D.A.card) :
    ∃ t₁ t₂ t₃ : ℝ²,
      ∃ F : U3FixedTripleAuditFrame D deleted.1
          (H.centerAt deleted.1 deleted.2) t₁ t₂ t₃,
        (((D.skeleton deleted.1).erase
          (H.centerAt deleted.1 deleted.2)).filter fun y =>
            dist (H.centerAt deleted.1 deleted.2) y =
              dist (H.centerAt deleted.1 deleted.2) deleted.1).card = 3 ∧
          U3EscapingAuditCycle.MixedOrStepCycle F := by
  let P₃ := B.localizedNoQFreePacket
  rcases B.exists_fixedTripleAuditFrame hcard with ⟨t₁, t₂, t₃, ⟨F⟩⟩
  have hexact :=
    P₃.exact_radius_class_card_eq_three_of_dangerousTriple F.dangerous
  exact ⟨t₁, t₂, t₃, F, hexact,
    U3EscapingAuditCycle.exists_mixed_or_step_cycle F hexact⟩

omit P Pρ hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- A uniform confinement theorem for an exact-radius fixed-triple frame
emitted by a six-row boundary closes the boundary immediately.  This adapter
isolates the remaining universal producer: every such exact-radius frame must
confine all of its q-deleted audit rows to its bounded support. -/
theorem SixSurvivorExactRowsBoundary.false_of_u3ExactRadiusAuditObstruction_of_rowwiseConfined
    {deleted : CriticalShellSystem.CarrierVertex D.A}
    {c₀ c₁ c₂ c₃ c₄ c₅ : ℝ²}
    (B : SixSurvivorExactRowsBoundary (D := D) (H := H) deleted
      c₀ c₁ c₂ c₃ c₄ c₅)
    (hcard : 9 < D.A.card)
    (hconf :
      ∀ {t₁ t₂ t₃ : ℝ²}
        (F : U3FixedTripleAuditFrame D deleted.1
          (H.centerAt deleted.1 deleted.2) t₁ t₂ t₃),
        (((D.skeleton deleted.1).erase
          (H.centerAt deleted.1 deleted.2)).filter fun y =>
            dist (H.centerAt deleted.1 deleted.2) y =
              dist (H.centerAt deleted.1 deleted.2) deleted.1).card = 3 →
          F.RowwiseConfinedQDeletedClasses) : False := by
  rcases B.exists_u3ExactRadiusAuditObstruction hcard with
    ⟨t₁, t₂, t₃, F, hexact, _, _, _⟩
  exact F.false_of_rowwiseConfinedQDeletedClasses (hconf F hexact)

omit P Pρ hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- When three of the surviving row centers are actual blockers, the deleted
point is omitted from all three corresponding canonical selected shells. -/
theorem SixSurvivorExactRowsBoundary.deleted_not_mem_three_selectedShells
    (deleted source₀ source₁ source₅ :
      CriticalShellSystem.CarrierVertex D.A)
    (c₂ c₃ c₄ : ℝ²)
    (B : SixSurvivorExactRowsBoundary (D := D) (H := H) deleted
      (H.centerAt source₀.1 source₀.2)
      (H.centerAt source₁.1 source₁.2)
      c₂ c₃ c₄
      (H.centerAt source₅.1 source₅.2)) :
    deleted.1 ∉
        (H.selectedAt source₀.1 source₀.2).toCriticalFourShell.support ∧
      deleted.1 ∉
        (H.selectedAt source₁.1 source₁.2).toCriticalFourShell.support ∧
      deleted.1 ∉
        (H.selectedAt source₅.1 source₅.2).toCriticalFourShell.support := by
  refine ⟨?_, ?_, ?_⟩
  · exact
      ATailFiveCenterDeletionBoundary.qDeletedK4Class_deleted_not_mem_selectedShell
        source₀.2 B.firstFive.K₀ B.firstFive.B₀_card
  · exact
      ATailFiveCenterDeletionBoundary.qDeletedK4Class_deleted_not_mem_selectedShell
        source₁.2 B.firstFive.K₁ B.firstFive.B₁_card
  · exact
      ATailFiveCenterDeletionBoundary.qDeletedK4Class_deleted_not_mem_selectedShell
        source₅.2 B.K₅ B.B₅_card

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- The three deleted rows whose centers are named actual blockers retain
their own canonical sources.  This is the positive incidence counterpart to
`deleted_not_mem_three_selectedShells`; unlike the anonymous apex rows, these
three row supports have source provenance after the foreign deletion. -/
theorem SixSurvivorExactRowsBoundary.source_mem_three_deletedRows_frame
    (frame : TwoSourceCollisionFrame P Pρ)
    (deleted source₀ source₁ source₅ :
      CriticalShellSystem.CarrierVertex D.A)
    (c₂ c₃ c₄ : ℝ²)
    (B : SixSurvivorExactRowsBoundary (D := D) (H := H) deleted
      (H.centerAt source₀.1 source₀.2)
      (H.centerAt source₁.1 source₁.2)
      c₂ c₃ c₄
      (H.centerAt source₅.1 source₅.2)) :
    source₀.1 ∈ B.firstFive.B₀ ∧
      source₁.1 ∈ B.firstFive.B₁ ∧
      source₅.1 ∈ B.B₅ := by
  obtain ⟨hρne, hfrontierFour, hρfour, hfrontierInteriorEq, hρInteriorEq,
    hpairsDisjoint, hblockersNe, LPρ, hLPρ, MPρ, LP, hLP, MP⟩ := frame
  exact ⟨
    ATailFiveCenterDeletionBoundary.qDeletedK4Class_source_mem_support
      source₀.2 B.firstFive.K₀ B.firstFive.B₀_card,
    ATailFiveCenterDeletionBoundary.qDeletedK4Class_source_mem_support
      source₁.2 B.firstFive.K₁ B.firstFive.B₁_card,
    ATailFiveCenterDeletionBoundary.qDeletedK4Class_source_mem_support
      source₅.2 B.K₅ B.B₅_card⟩

/-- The three deleted rows whose centers are named actual blockers retain
their own canonical sources.  This is the positive incidence counterpart to
`deleted_not_mem_three_selectedShells`; unlike the anonymous apex rows, these
three row supports have source provenance after the foreign deletion.
This is a compatibility wrapper over
`SixSurvivorExactRowsBoundary.source_mem_three_deletedRows_frame`, which
takes the same hypotheses packaged as a `TwoSourceCollisionFrame`. -/
theorem SixSurvivorExactRowsBoundary.source_mem_three_deletedRows
    (deleted source₀ source₁ source₅ :
      CriticalShellSystem.CarrierVertex D.A)
    (c₂ c₃ c₄ : ℝ²)
    (B : SixSurvivorExactRowsBoundary (D := D) (H := H) deleted
      (H.centerAt source₀.1 source₀.2)
      (H.centerAt source₁.1 source₁.2)
      c₂ c₃ c₄
      (H.centerAt source₅.1 source₅.2)) :
    source₀.1 ∈ B.firstFive.B₀ ∧
      source₁.1 ∈ B.firstFive.B₁ ∧
      source₅.1 ∈ B.B₅ :=
  SixSurvivorExactRowsBoundary.source_mem_three_deletedRows_frame P Pρ T
    ⟨hρne, hfrontierFour, hρfour, hfrontierInteriorEq, hρInteriorEq,
      hpairsDisjoint, hblockersNe, LPρ, hLPρ, MPρ, LP, hLP, MP⟩
    deleted source₀ source₁ source₅ c₂ c₃ c₄ B

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- The two collision-blocker rows retain their full source provenance after
the foreign deletion.  The opposite-radius row contains both of its collision
sources, while the first-fiber row is the explicit four-point support supplied
by `Q`; the surviving cap-source row also retains its own source. -/
theorem SixSurvivorExactRowsBoundary.collisionRows_sourceProvenance
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (deleted source₅ : CriticalShellSystem.CarrierVertex D.A)
    (c₂ c₃ c₄ : ℝ²)
    (B : SixSurvivorExactRowsBoundary (D := D) (H := H) deleted
      (H.centerAt Pρ.source₁ Pρ.source₁_mem_A)
      (H.centerAt P.source₁ P.source₁_mem_A)
      c₂ c₃ c₄
      (H.centerAt source₅.1 source₅.2)) :
    Pρ.source₁ ∈ B.firstFive.B₀ ∧
      Pρ.source₂ ∈ B.firstFive.B₀ ∧
      B.firstFive.B₁ =
        {P.source₁, P.source₂, Q.source.1, Q.otherOutsidePoint} ∧
      source₅.1 ∈ B.B₅ := by
  have hB₀ :
      B.firstFive.B₀ =
        (H.selectedAt Pρ.source₁
          Pρ.source₁_mem_A).toCriticalFourShell.support :=
    ATailFiveCenterDeletionBoundary.qDeletedK4Class_support_eq_selectedShell
      Pρ.source₁_mem_A B.firstFive.K₀ B.firstFive.B₀_card
  have hB₁ :
      B.firstFive.B₁ =
        (H.selectedAt P.source₁
          P.source₁_mem_A).toCriticalFourShell.support :=
    ATailFiveCenterDeletionBoundary.qDeletedK4Class_support_eq_selectedShell
      P.source₁_mem_A B.firstFive.K₁ B.firstFive.B₁_card
  refine ⟨?_, ?_, ?_, ?_⟩
  · rw [hB₀]
    exact
      (H.selectedAt Pρ.source₁
        Pρ.source₁_mem_A).toCriticalFourShell.q_mem_support
  · rw [hB₀]
    exact Pρ.source₂_mem_source₁_shell
  · exact hB₁.trans (firstFiber_shell_eq_explicitFour P Pρ Q)
  · exact
      ATailFiveCenterDeletionBoundary.qDeletedK4Class_source_mem_support
        source₅.2 B.K₅ B.B₅_card

/-- The theorem-facing form of six-center deletion survival.  All six
survivors are exposed as exact deleted K4 rows, together with the deleted
point's blocked actual center and pairwise distinctness of the six centers. -/
abbrev SixCenterDeletionExactRowsBoundary
    (deleted : CriticalShellSystem.CarrierVertex D.A)
    (c₀ c₁ c₂ c₃ c₄ c₅ : ℝ²) : Prop :=
  Nonempty
    (SixSurvivorExactRowsBoundary
      (D := D) (H := H) deleted c₀ c₁ c₂ c₃ c₄ c₅)

omit P Pρ hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Normalize raw six-center survival to six explicit exact deleted rows. -/
theorem sixCenterDeletionExactRowsBoundary_of_survival
    (deleted : CriticalShellSystem.CarrierVertex D.A)
    (c₀ c₁ c₂ c₃ c₄ c₅ : ℝ²)
    (h : SixCenterDeletionSurvivalPacket
      (D := D) deleted.1 c₀ c₁ c₂ c₃ c₄ c₅) :
    SixCenterDeletionExactRowsBoundary
      (H := H) deleted c₀ c₁ c₂ c₃ c₄ c₅ := by
  rcases ATailFiveCenterDeletionBoundary.fiveSurvivorExactRowsBoundary
      H deleted.2 h.1 with ⟨hfirstFive⟩
  have hskeleton₅ :
      HasNEquidistantPointsAt 4 (D.skeleton deleted.1) c₅ := by
    simpa [CounterexampleData.skeleton] using h.2.1
  rcases
      U5QDeletedK4Class.exists_card_four_of_hasNEquidistantPointsAt_skeleton
        hskeleton₅ with ⟨B₅, ⟨K₅⟩, hB₅⟩
  have hne₅ : H.centerAt deleted.1 deleted.2 ≠ c₅ := by
    intro heq
    exact hfirstFive.actualBlocker_fails (by simpa only [heq] using h.2.1)
  exact ⟨{
    firstFive := hfirstFive
    B₅ := B₅
    K₅ := K₅
    B₅_card := hB₅
    actualBlocker_ne₅ := hne₅
    centers_card := h.2.2
  }⟩

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  hpairsDisjoint LPρ hLPρ MPρ LP hLP MP in
/-- A one-sided cap-source deletion synchronizes the surviving source row
with the two collision-blocker rows and the three robust apex rows.  The six
named centers are pairwise distinct, recorded by the cardinality of their
finite packet. -/
theorem sixCenterDeletionSurvivalPacket_of_oneSided
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (hsource : FirstFiberCapSourceWitness P Pρ source)
    (hsource' : FirstFiberCapSourceWitness P Pρ source')
    (hsurvival :
      TwoCapSourcesOneSidedDeletionSurvival (H := H) source source') :
    SixCenterDeletionSurvivalPacket (D := D) source'.1
        (H.centerAt Pρ.source₁ Pρ.source₁_mem_A)
        (H.centerAt P.source₁ P.source₁_mem_A)
        S.oppApex1 S.oppApex2 S.surplusApex
        (H.centerAt source.1 source.2) ∨
      SixCenterDeletionSurvivalPacket (D := D) source.1
        (H.centerAt Pρ.source₁ Pρ.source₁_mem_A)
        (H.centerAt P.source₁ P.source₁_mem_A)
        S.oppApex1 S.oppApex2 S.surplusApex
        (H.centerAt source'.1 source'.2) := by
  classical
  rcases hsource with
    ⟨_, hsourceInterior, hsourceOutside, hsourceNeP, hsourceNePρ,
      _, _, _, _, _, _⟩
  rcases hsource' with
    ⟨_, hsourceInterior', hsourceOutside', hsourceNeP', hsourceNePρ',
      _, _, _, _, _, _⟩
  have hrobust₁ : FullyDeletionRobustAt D S.oppApex1 :=
    fullyDeletionRobustAt_of_apexRichClassStructure T.oppApex1_rich
  have hrobust₂ : FullyDeletionRobustAt D S.oppApex2 :=
    fullyDeletionRobustAt_of_apexRichClassStructure T.oppApex2_rich
  have hrobust₃ : FullyDeletionRobustAt D S.surplusApex :=
    fullyDeletionRobustAt_of_apexRichClassStructure T.surplusApex_rich
  have hPρNeApex₁ :
      H.centerAt Pρ.source₁ Pρ.source₁_mem_A ≠ S.oppApex1 :=
    hrobust₁.centerAt_ne H Pρ.source₁ Pρ.source₁_mem_A
  have hPρNeApex₂ :
      H.centerAt Pρ.source₁ Pρ.source₁_mem_A ≠ S.oppApex2 :=
    hrobust₂.centerAt_ne H Pρ.source₁ Pρ.source₁_mem_A
  have hPρNeApex₃ :
      H.centerAt Pρ.source₁ Pρ.source₁_mem_A ≠ S.surplusApex :=
    hrobust₃.centerAt_ne H Pρ.source₁ Pρ.source₁_mem_A
  have hPNeApex₁ :
      H.centerAt P.source₁ P.source₁_mem_A ≠ S.oppApex1 :=
    hrobust₁.centerAt_ne H P.source₁ P.source₁_mem_A
  have hPNeApex₂ :
      H.centerAt P.source₁ P.source₁_mem_A ≠ S.oppApex2 :=
    hrobust₂.centerAt_ne H P.source₁ P.source₁_mem_A
  have hPNeApex₃ :
      H.centerAt P.source₁ P.source₁_mem_A ≠ S.surplusApex :=
    hrobust₃.centerAt_ne H P.source₁ P.source₁_mem_A
  have hsourceNeApex₁ :
      H.centerAt source.1 source.2 ≠ S.oppApex1 :=
    hrobust₁.centerAt_ne H source.1 source.2
  have hsourceNeApex₂ :
      H.centerAt source.1 source.2 ≠ S.oppApex2 :=
    hrobust₂.centerAt_ne H source.1 source.2
  have hsourceNeApex₃ :
      H.centerAt source.1 source.2 ≠ S.surplusApex :=
    hrobust₃.centerAt_ne H source.1 source.2
  have hsourceNeApex₁' :
      H.centerAt source'.1 source'.2 ≠ S.oppApex1 :=
    hrobust₁.centerAt_ne H source'.1 source'.2
  have hsourceNeApex₂' :
      H.centerAt source'.1 source'.2 ≠ S.oppApex2 :=
    hrobust₂.centerAt_ne H source'.1 source'.2
  have hsourceNeApex₃' :
      H.centerAt source'.1 source'.2 ≠ S.surplusApex :=
    hrobust₃.centerAt_ne H source'.1 source'.2
  have hApex₁NeApex₂ : S.oppApex1 ≠ S.oppApex2 := by
    simpa using
      S.oppositeVertexByIndex_ne_of_ne S.oppIndex1_ne_oppIndex2
  have hApex₁NeApex₃ : S.oppApex1 ≠ S.surplusApex := by
    simpa using
      S.oppositeVertexByIndex_ne_of_ne
        S.surplusIdx_ne_oppIndex1.symm
  have hApex₂NeApex₃ : S.oppApex2 ≠ S.surplusApex := by
    simpa using
      S.oppositeVertexByIndex_ne_of_ne
        S.surplusIdx_ne_oppIndex2.symm
  have hsourceNotP :
      source.1 ∉
        (H.selectedAt P.source₁
          P.source₁_mem_A).toCriticalFourShell.support :=
    ATailFirstFiberOverlapDescent.capSource_not_mem_firstCollisionShell
      P Pρ source hsourceInterior hsourceOutside
  have hsourceNotPρ :
      source.1 ∉
        (H.selectedAt Pρ.source₁
          Pρ.source₁_mem_A).toCriticalFourShell.support :=
    ATailFirstFiberOverlapDescent.capSource_not_mem_firstCollisionShell
      Pρ P source hsourceInterior
        (by simpa [Finset.union_comm] using hsourceOutside)
  have hsourceNotP' :
      source'.1 ∉
        (H.selectedAt P.source₁
          P.source₁_mem_A).toCriticalFourShell.support :=
    ATailFirstFiberOverlapDescent.capSource_not_mem_firstCollisionShell
      P Pρ source' hsourceInterior' hsourceOutside'
  have hsourceNotPρ' :
      source'.1 ∉
        (H.selectedAt Pρ.source₁
          Pρ.source₁_mem_A).toCriticalFourShell.support :=
    ATailFirstFiberOverlapDescent.capSource_not_mem_firstCollisionShell
      Pρ P source' hsourceInterior'
        (by simpa [Finset.union_comm] using hsourceOutside')
  have hcentersCard :
      ({H.centerAt Pρ.source₁ Pρ.source₁_mem_A,
          H.centerAt P.source₁ P.source₁_mem_A,
          S.oppApex1, S.oppApex2, S.surplusApex,
          H.centerAt source.1 source.2} : Finset ℝ²).card = 6 := by
    simp [hblockersNe, hPρNeApex₁, hPρNeApex₂, hPρNeApex₃,
      hPNeApex₁, hPNeApex₂, hPNeApex₃,
      hApex₁NeApex₂, hApex₁NeApex₃, hApex₂NeApex₃,
      hsourceNeP.symm, hsourceNePρ.symm,
      hsourceNeApex₁.symm, hsourceNeApex₂.symm,
      hsourceNeApex₃.symm]
  have hcentersCard' :
      ({H.centerAt Pρ.source₁ Pρ.source₁_mem_A,
          H.centerAt P.source₁ P.source₁_mem_A,
          S.oppApex1, S.oppApex2, S.surplusApex,
          H.centerAt source'.1 source'.2} : Finset ℝ²).card = 6 := by
    simp [hblockersNe, hPρNeApex₁, hPρNeApex₂, hPρNeApex₃,
      hPNeApex₁, hPNeApex₂, hPNeApex₃,
      hApex₁NeApex₂, hApex₁NeApex₃, hApex₂NeApex₃,
      hsourceNeP'.symm, hsourceNePρ'.symm,
      hsourceNeApex₁'.symm, hsourceNeApex₂'.symm,
      hsourceNeApex₃'.symm]
  rcases hsurvival with hsurvival | hsurvival
  · exact Or.inl
      ⟨⟨
        (cross_deletion_survives_iff_not_mem_selected_support
          H Pρ.source₁_mem_A).2 hsourceNotPρ',
        (cross_deletion_survives_iff_not_mem_selected_support
          H P.source₁_mem_A).2 hsourceNotP',
        hrobust₁.survives source'.1 source'.2,
        hrobust₂.survives source'.1 source'.2,
        hrobust₃.survives source'.1 source'.2⟩,
        hsurvival, hcentersCard⟩
  · exact Or.inr
      ⟨⟨
        (cross_deletion_survives_iff_not_mem_selected_support
          H Pρ.source₁_mem_A).2 hsourceNotPρ,
        (cross_deletion_survives_iff_not_mem_selected_support
          H P.source₁_mem_A).2 hsourceNotP,
        hrobust₁.survives source.1 source.2,
        hrobust₂.survives source.1 source.2,
        hrobust₃.survives source.1 source.2⟩,
        hsurvival, hcentersCard'⟩

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Compatibility adapter for the former one-sided-deletion leaf.

The first enlarged fiber supplies the corresponding blocker-multiplicity arm.
The second source, common-radius, and one-sided-deletion refinements are not
separate terminal inputs after consolidation. -/
theorem false_of_twoCapSources_oneSidedDeletionSurvival_frame
    (frame : TwoSourceCollisionFrame P Pρ)
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    {commonRadius : ℝ}
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (hsourcesNe : source.1 ≠ source'.1)
    (hsourceRadius :
      source.1 ∈ SelectedClass D.A S.oppApex1 commonRadius)
    (hsourceRadius' :
      source'.1 ∈ SelectedClass D.A S.oppApex1 commonRadius)
    (hsource : FirstFiberCapSourceWitness P Pρ source)
    (hsource' : FirstFiberCapSourceWitness P Pρ source')
    (hsurvival :
      TwoCapSourcesOneSidedDeletionSurvival (H := H) source source') :
    False := by
  obtain ⟨hρne, hfrontierFour, hρfour, hfrontierInteriorEq, hρInteriorEq,
    hpairsDisjoint, hblockersNe, LPρ, hLPρ, MPρ, LP, hLP, MP⟩ := frame
  exact
    false_of_twoCapSources_freshOutsideFirstBlockerFiber
      P Pρ hρne hfrontierFour hρfour
      hfrontierInteriorEq hρInteriorEq
      T hpairsDisjoint hblockersNe
      LPρ hLPρ MPρ LP hLP MP
      ⟨hsource.1, source, source', hsourcesNe, hsource, hsource'⟩
      ⟨Q⟩

/-- Compatibility adapter for the former one-sided-deletion leaf.

The first enlarged fiber supplies the corresponding blocker-multiplicity arm.
The second source, common-radius, and one-sided-deletion refinements are not
separate terminal inputs after consolidation.
This is a compatibility wrapper over
`false_of_twoCapSources_oneSidedDeletionSurvival_frame`, which takes the
same hypotheses packaged as a `TwoSourceCollisionFrame`. -/
theorem false_of_twoCapSources_oneSidedDeletionSurvival
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    {commonRadius : ℝ}
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (hsourcesNe : source.1 ≠ source'.1)
    (hsourceRadius :
      source.1 ∈ SelectedClass D.A S.oppApex1 commonRadius)
    (hsourceRadius' :
      source'.1 ∈ SelectedClass D.A S.oppApex1 commonRadius)
    (hsource : FirstFiberCapSourceWitness P Pρ source)
    (hsource' : FirstFiberCapSourceWitness P Pρ source')
    (hsurvival :
      TwoCapSourcesOneSidedDeletionSurvival (H := H) source source') :
    False :=
  false_of_twoCapSources_oneSidedDeletionSurvival_frame P Pρ T
    ⟨hρne, hfrontierFour, hρfour, hfrontierInteriorEq, hρInteriorEq,
      hpairsDisjoint, hblockersNe, LPρ, hLPρ, MPρ, LP, hLP, MP⟩
    Q source source' hsourcesNe hsourceRadius hsourceRadius' hsource hsource' hsurvival

/-- Compatibility coordinator for the former two-source first-fiber split.

Its detailed mutual-cross-membership/deletion analysis remains checked, but
all branches now ultimately depend on the common cap-source obstruction. -/
theorem false_of_twoCapSources_firstFiber
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    {commonRadius : ℝ}
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (hsourcesNe : source.1 ≠ source'.1)
    (hsourceRadius :
      source.1 ∈ SelectedClass D.A S.oppApex1 commonRadius)
    (hsourceRadius' :
      source'.1 ∈ SelectedClass D.A S.oppApex1 commonRadius)
    (hsource : FirstFiberCapSourceWitness P Pρ source)
    (hsource' : FirstFiberCapSourceWitness P Pρ source') :
    False := by
  rcases mutualCrossMembership_or_oneSidedDeletionSurvival
      source source' with hmutual | hsurvival
  · by_cases hblockersEq :
      H.blockerVertex source = H.blockerVertex source'
    · exact false_of_twoCapSources_freshThirdBlockerFiber_core
        (P := P) (Pρ := Pρ)
        (hρne := hρne) (hfrontierFour := hfrontierFour)
        (hρfour := hρfour)
        (hfrontierInteriorEq := hfrontierInteriorEq)
        (hρInteriorEq := hρInteriorEq)
        (T := T) (hpairsDisjoint := hpairsDisjoint)
        (hblockersNe := hblockersNe)
        (LPρ := LPρ) (hLPρ := hLPρ) (MPρ := MPρ)
        (LP := LP) (hLP := hLP) (MP := MP)
        (by
          have hcenter :
              S.oppApex1 =
                S.oppositeVertexByIndex S.oppIndex1 := by
            rcases hi : S.surplusIdx with ⟨i, hi3⟩
            interval_cases i <;>
              simp [SurplusCapPacket.oppApex1,
                SurplusCapPacket.oppositeVertexByIndex,
                SurplusCapPacket.oppIndex1, hi]
          have hsourceIndexed :
              source.1 ∈
                SelectedClass D.A
                    (S.oppositeVertexByIndex S.oppIndex1) commonRadius ∩
                  S.capInteriorByIndex S.oppIndex1 := by
            simpa only [← hcenter] using
              Finset.mem_inter.mpr ⟨hsourceRadius, hsource.2.1⟩
          have hsource'Indexed :
              source'.1 ∈
                SelectedClass D.A
                    (S.oppositeVertexByIndex S.oppIndex1) commonRadius ∩
                  S.capInteriorByIndex S.oppIndex1 := by
            simpa only [← hcenter] using
              Finset.mem_inter.mpr ⟨hsourceRadius', hsource'.2.1⟩
          have hcentersEq :
              H.centerAt source.1 source.2 =
                H.centerAt source'.1 source'.2 := by
            simpa [CriticalShellSystem.blockerVertex] using
              congrArg Subtype.val hblockersEq
          have hgeometry :=
            equalBlocker_sameRadiusInterior_shell_inter_cap_eq_pair
              source.2 source'.2 hsourceIndexed hsource'Indexed hsourcesNe
              hcentersEq
              (by simpa only [← hcenter] using T.oppApex1_rich)
              (isUniqueFourCenter_centerAt H source.1 source.2)
          have hallEndpointOmission :=
            allCollisionEndpointsOmitted_of_equalBlocker_shell_inter_cap_eq
              (P := P) (Pρ := Pρ) source source' hsource hsource'
              hblockersEq hgeometry.2
          exact .sameBlockerAllEndpointOmission Q source source' hsourcesNe
            hsourceRadius hsourceRadius' hsource hsource' hmutual
            hblockersEq hallEndpointOmission hgeometry.1 hgeometry.2)
    · exact false_of_twoCapSources_mutualCrossMembership_distinctBlockers_frame
        P Pρ T
        ⟨hρne, hfrontierFour, hρfour, hfrontierInteriorEq, hρInteriorEq,
          hpairsDisjoint, hblockersNe, LPρ, hLPρ, MPρ, LP, hLP, MP⟩
        source source' hsourcesNe hsourceRadius hsourceRadius'
        hmutual hblockersEq
  · exact false_of_twoCapSources_oneSidedDeletionSurvival_frame
      P Pρ T
      ⟨hρne, hfrontierFour, hρfour, hfrontierInteriorEq, hρInteriorEq,
        hpairsDisjoint, hblockersNe, LPρ, hLPρ, MPρ, LP, hLP, MP⟩
      Q source source' hsourcesNe hsourceRadius hsourceRadius'
      hsource hsource' hsurvival

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- The common-radius mutual-incidence arm is already reduced to the checked
distinct-blocker contradiction or the exact-row equal-blocker terminal. -/
theorem false_of_twoCapSources_commonRadius_mutualCrossMembership_frame
    (frame : TwoSourceCollisionFrame P Pρ)
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    {commonRadius : ℝ}
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (hsourcesNe : source.1 ≠ source'.1)
    (hsourceRadius :
      source.1 ∈ SelectedClass D.A S.oppApex1 commonRadius)
    (hsourceRadius' :
      source'.1 ∈ SelectedClass D.A S.oppApex1 commonRadius)
    (hsource : FirstFiberCapSourceWitness P Pρ source)
    (hsource' : FirstFiberCapSourceWitness P Pρ source')
    (hmutual :
      TwoCapSourcesMutualCrossMembership (H := H) source source') :
    False := by
  obtain ⟨hρne, hfrontierFour, hρfour, hfrontierInteriorEq, hρInteriorEq,
    hpairsDisjoint, hblockersNe, LPρ, hLPρ, MPρ, LP, hLP, MP⟩ := frame
  by_cases hblockersEq :
      H.blockerVertex source = H.blockerVertex source'
  · have hcenter :
        S.oppApex1 = S.oppositeVertexByIndex S.oppIndex1 := by
      rcases hi : S.surplusIdx with ⟨i, hi3⟩
      interval_cases i <;>
        simp [SurplusCapPacket.oppApex1,
          SurplusCapPacket.oppositeVertexByIndex,
          SurplusCapPacket.oppIndex1, hi]
    have hsourceIndexed :
        source.1 ∈
          SelectedClass D.A
              (S.oppositeVertexByIndex S.oppIndex1) commonRadius ∩
            S.capInteriorByIndex S.oppIndex1 := by
      simpa only [← hcenter] using
        Finset.mem_inter.mpr ⟨hsourceRadius, hsource.2.1⟩
    have hsource'Indexed :
        source'.1 ∈
          SelectedClass D.A
              (S.oppositeVertexByIndex S.oppIndex1) commonRadius ∩
            S.capInteriorByIndex S.oppIndex1 := by
      simpa only [← hcenter] using
        Finset.mem_inter.mpr ⟨hsourceRadius', hsource'.2.1⟩
    have hcentersEq :
        H.centerAt source.1 source.2 =
          H.centerAt source'.1 source'.2 := by
      simpa [CriticalShellSystem.blockerVertex] using
        congrArg Subtype.val hblockersEq
    have hgeometry :=
      equalBlocker_sameRadiusInterior_shell_inter_cap_eq_pair
        source.2 source'.2 hsourceIndexed hsource'Indexed hsourcesNe
        hcentersEq
        (by simpa only [← hcenter] using T.oppApex1_rich)
        (isUniqueFourCenter_centerAt H source.1 source.2)
    have hallEndpointOmission :=
      allCollisionEndpointsOmitted_of_equalBlocker_shell_inter_cap_eq
        (P := P) (Pρ := Pρ) source source' hsource hsource'
        hblockersEq hgeometry.2
    exact
      false_of_twoCapSources_sameBlockerAllEndpointOmission
        (P := P) (Pρ := Pρ)
        (hρne := hρne) (hfrontierFour := hfrontierFour)
        (hρfour := hρfour)
        (hfrontierInteriorEq := hfrontierInteriorEq)
        (hρInteriorEq := hρInteriorEq)
        (T := T) (hpairsDisjoint := hpairsDisjoint)
        (hblockersNe := hblockersNe)
        (LPρ := LPρ) (hLPρ := hLPρ) (MPρ := MPρ)
        (LP := LP) (hLP := hLP) (MP := MP)
        Q source source' hsourcesNe hsourceRadius hsourceRadius'
        hsource hsource' hmutual hblockersEq hallEndpointOmission
        hgeometry.1 hgeometry.2
  · exact
      false_of_twoCapSources_mutualCrossMembership_distinctBlockers_frame
        P Pρ T
        ⟨hρne, hfrontierFour, hρfour, hfrontierInteriorEq, hρInteriorEq,
          hpairsDisjoint, hblockersNe, LPρ, hLPρ, MPρ, LP, hLP, MP⟩
        source source' hsourcesNe hsourceRadius hsourceRadius'
        hmutual hblockersEq

/-- The common-radius mutual-incidence arm is already reduced to the checked
distinct-blocker contradiction or the exact-row equal-blocker terminal.
This is a compatibility wrapper over
`false_of_twoCapSources_commonRadius_mutualCrossMembership_frame`, which
takes the same hypotheses packaged as a `TwoSourceCollisionFrame`. -/
theorem false_of_twoCapSources_commonRadius_mutualCrossMembership
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    {commonRadius : ℝ}
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (hsourcesNe : source.1 ≠ source'.1)
    (hsourceRadius :
      source.1 ∈ SelectedClass D.A S.oppApex1 commonRadius)
    (hsourceRadius' :
      source'.1 ∈ SelectedClass D.A S.oppApex1 commonRadius)
    (hsource : FirstFiberCapSourceWitness P Pρ source)
    (hsource' : FirstFiberCapSourceWitness P Pρ source')
    (hmutual :
      TwoCapSourcesMutualCrossMembership (H := H) source source') :
    False :=
  false_of_twoCapSources_commonRadius_mutualCrossMembership_frame P Pρ T
    ⟨hρne, hfrontierFour, hρfour, hfrontierInteriorEq, hρInteriorEq,
      hpairsDisjoint, hblockersNe, LPρ, hLPρ, MPρ, LP, hLP, MP⟩
    Q source source' hsourcesNe hsourceRadius hsourceRadius' hsource hsource' hmutual

/-- The two source-oriented six-center packets produced by one-sided row
survival.  Keeping both orientations explicit avoids choosing a preferred
source during finite obstruction extraction. -/
abbrev TwoCapSourcesSixCenterDeletionSurvival
    (source source' : CriticalShellSystem.CarrierVertex D.A) : Prop :=
  SixCenterDeletionSurvivalPacket (D := D) source'.1
      (H.centerAt Pρ.source₁ Pρ.source₁_mem_A)
      (H.centerAt P.source₁ P.source₁_mem_A)
      S.oppApex1 S.oppApex2 S.surplusApex
      (H.centerAt source.1 source.2) ∨
    SixCenterDeletionSurvivalPacket (D := D) source.1
      (H.centerAt Pρ.source₁ Pρ.source₁_mem_A)
      (H.centerAt P.source₁ P.source₁_mem_A)
      S.oppApex1 S.oppApex2 S.surplusApex
      (H.centerAt source'.1 source'.2)

/-- Exact-row normalization of the two source-oriented six-center packets. -/
abbrev TwoCapSourcesSixCenterExactRowsBoundary
    (source source' : CriticalShellSystem.CarrierVertex D.A) : Prop :=
  SixCenterDeletionExactRowsBoundary (H := H) source'
      (H.centerAt Pρ.source₁ Pρ.source₁_mem_A)
      (H.centerAt P.source₁ P.source₁_mem_A)
      S.oppApex1 S.oppApex2 S.surplusApex
      (H.centerAt source.1 source.2) ∨
    SixCenterDeletionExactRowsBoundary (H := H) source
      (H.centerAt Pρ.source₁ Pρ.source₁_mem_A)
      (H.centerAt P.source₁ P.source₁_mem_A)
      S.oppApex1 S.oppApex2 S.surplusApex
      (H.centerAt source'.1 source'.2)

/-- One oriented six-center boundary with the source information needed by
finite incidence consumers kept explicit.  Besides the six exact deleted
rows, this records the two collision-row source incidences, the full named
first-fiber support, the surviving source incidence, and the three omissions
forced by the common deletion. -/
abbrev SixSurvivorExactRowsSourceProvenanceBoundary
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (deleted source₅ : CriticalShellSystem.CarrierVertex D.A) : Prop :=
  ∃ B : SixSurvivorExactRowsBoundary (D := D) (H := H) deleted
      (H.centerAt Pρ.source₁ Pρ.source₁_mem_A)
      (H.centerAt P.source₁ P.source₁_mem_A)
      S.oppApex1 S.oppApex2 S.surplusApex
      (H.centerAt source₅.1 source₅.2),
    Pρ.source₁ ∈ B.firstFive.B₀ ∧
      Pρ.source₂ ∈ B.firstFive.B₀ ∧
      B.firstFive.B₁ =
        {P.source₁, P.source₂, Q.source.1, Q.otherOutsidePoint} ∧
      source₅.1 ∈ B.B₅ ∧
      deleted.1 ∉ B.firstFive.B₀ ∧
      deleted.1 ∉ B.firstFive.B₁ ∧
      deleted.1 ∉ B.B₅

/-- The two source orientations of the provenance-preserving exact-row
boundary. -/
abbrev TwoCapSourcesSixCenterSourceProvenanceBoundary
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (source source' : CriticalShellSystem.CarrierVertex D.A) : Prop :=
  SixSurvivorExactRowsSourceProvenanceBoundary
      (P := P) (Pρ := Pρ) Q source' source ∨
    SixSurvivorExactRowsSourceProvenanceBoundary
      (P := P) (Pρ := Pρ) Q source source'

/-- A provenance-preserving six-center boundary together with the fixed-triple
audit obstruction forced at the deleted point's actual blocker center. -/
abbrev SixSurvivorExactRowsSourceProvenanceFixedTripleAuditBoundary
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (deleted source₅ : CriticalShellSystem.CarrierVertex D.A) : Prop :=
  SixSurvivorExactRowsSourceProvenanceBoundary
      (P := P) (Pρ := Pρ) Q deleted source₅ ∧
    SixSurvivorU3ExactRadiusAuditObstruction (H := H) deleted

/-- The two source orientations of the provenance-preserving six-center
boundary, strengthened by their source-produced fixed-triple obstructions. -/
abbrev TwoCapSourcesSixCenterSourceProvenanceFixedTripleAuditBoundary
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (source source' : CriticalShellSystem.CarrierVertex D.A) : Prop :=
  SixSurvivorExactRowsSourceProvenanceFixedTripleAuditBoundary
      (P := P) (Pρ := Pρ) Q source' source ∨
    SixSurvivorExactRowsSourceProvenanceFixedTripleAuditBoundary
      (P := P) (Pρ := Pρ) Q source source'

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Promote either oriented six-center provenance boundary to the exact U3
audit boundary used by the terminal row-confinement interface. -/
theorem twoCapSourcesSixCenterSourceProvenanceFixedTripleAuditBoundary_of_boundary
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (hcard : 9 < D.A.card)
    (h : TwoCapSourcesSixCenterSourceProvenanceBoundary
      (P := P) (Pρ := Pρ) Q source source') :
    TwoCapSourcesSixCenterSourceProvenanceFixedTripleAuditBoundary
      (P := P) (Pρ := Pρ) Q source source' := by
  rcases h with ⟨B, hprovenance⟩ | ⟨B, hprovenance⟩
  · exact Or.inl
      ⟨⟨B, hprovenance⟩, B.exists_u3ExactRadiusAuditObstruction hcard⟩
  · exact Or.inr
      ⟨⟨B, hprovenance⟩, B.exists_u3ExactRadiusAuditObstruction hcard⟩

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- In a provenance-preserving six-center boundary, neither of the two
remaining physical-apex rows can contain both points of either retained
first-apex pair.  The first apex and the corresponding collision blocker
already saturate the convex-carrier two-center bound for that pair.

This is a source-clean pinned-multiplicity cut.  It is not itself a
contradiction: the exact-four rows may use anonymous filler points. -/
theorem SixSurvivorExactRowsBoundary.physicalRows_inter_retainedPairs_card_le_one
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    {deleted source₅ : CriticalShellSystem.CarrierVertex D.A}
    (B : SixSurvivorExactRowsBoundary (D := D) (H := H) deleted
      (H.centerAt Pρ.source₁ Pρ.source₁_mem_A)
      (H.centerAt P.source₁ P.source₁_mem_A)
      S.oppApex1 S.oppApex2 S.surplusApex
      (H.centerAt source₅.1 source₅.2))
    (hPρ₁B₀ : Pρ.source₁ ∈ B.firstFive.B₀)
    (hPρ₂B₀ : Pρ.source₂ ∈ B.firstFive.B₀)
    (hB₁ : B.firstFive.B₁ =
      {P.source₁, P.source₂, Q.source.1, Q.otherOutsidePoint}) :
    (B.firstFive.B₃ ∩ {P.source₁, P.source₂}).card ≤ 1 ∧
      (B.firstFive.B₄ ∩ {P.source₁, P.source₂}).card ≤ 1 ∧
      (B.firstFive.B₃ ∩ {Pρ.source₁, Pρ.source₂}).card ≤ 1 ∧
      (B.firstFive.B₄ ∩ {Pρ.source₁, Pρ.source₂}).card ≤ 1 := by
  have hP₁B₁ : P.source₁ ∈ B.firstFive.B₁ := by
    rw [hB₁]
    simp
  have hP₂B₁ : P.source₂ ∈ B.firstFive.B₁ := by
    rw [hB₁]
    simp
  have hPfirst :
      dist S.oppApex1 P.source₁ = dist S.oppApex1 P.source₂ := by
    simpa only [dist_comm] using
      (mem_selectedClass.mp P.source₁_mem_radius).2.trans
        (mem_selectedClass.mp P.source₂_mem_radius).2.symm
  have hPblocker :
      dist (H.centerAt P.source₁ P.source₁_mem_A) P.source₁ =
        dist (H.centerAt P.source₁ P.source₁_mem_A) P.source₂ := by
    simpa only [dist_comm] using
      (B.firstFive.K₁.same_radius P.source₁ hP₁B₁).trans
        (B.firstFive.K₁.same_radius P.source₂ hP₂B₁).symm
  have hPρfirst :
      dist S.oppApex1 Pρ.source₁ = dist S.oppApex1 Pρ.source₂ := by
    simpa only [dist_comm] using
      (mem_selectedClass.mp Pρ.source₁_mem_radius).2.trans
        (mem_selectedClass.mp Pρ.source₂_mem_radius).2.symm
  have hPρblocker :
      dist (H.centerAt Pρ.source₁ Pρ.source₁_mem_A) Pρ.source₁ =
        dist (H.centerAt Pρ.source₁ Pρ.source₁_mem_A) Pρ.source₂ := by
    simpa only [dist_comm] using
      (B.firstFive.K₀.same_radius Pρ.source₁ hPρ₁B₀).trans
        (B.firstFive.K₀.same_radius Pρ.source₂ hPρ₂B₀).symm
  have hfirstP :
      S.oppApex1 ≠ H.centerAt P.source₁ P.source₁_mem_A := by
    intro h
    have hsub :
        ({H.centerAt Pρ.source₁ Pρ.source₁_mem_A,
          H.centerAt P.source₁ P.source₁_mem_A,
          S.oppApex1, S.oppApex2, S.surplusApex,
          H.centerAt source₅.1 source₅.2} : Finset ℝ²) ⊆
          {H.centerAt Pρ.source₁ Pρ.source₁_mem_A,
            H.centerAt P.source₁ P.source₁_mem_A,
            S.oppApex2, S.surplusApex,
            H.centerAt source₅.1 source₅.2} := by
      intro x hx
      simp only [Finset.mem_insert, Finset.mem_singleton, h] at hx ⊢
      aesop
    exact false_of_six_point_literal_subset_five B.centers_card hsub
  have hfirstPρ :
      S.oppApex1 ≠ H.centerAt Pρ.source₁ Pρ.source₁_mem_A := by
    intro h
    have hsub :
        ({H.centerAt Pρ.source₁ Pρ.source₁_mem_A,
          H.centerAt P.source₁ P.source₁_mem_A,
          S.oppApex1, S.oppApex2, S.surplusApex,
          H.centerAt source₅.1 source₅.2} : Finset ℝ²) ⊆
          {H.centerAt Pρ.source₁ Pρ.source₁_mem_A,
            H.centerAt P.source₁ P.source₁_mem_A,
            S.oppApex2, S.surplusApex,
            H.centerAt source₅.1 source₅.2} := by
      intro x hx
      simp only [Finset.mem_insert, Finset.mem_singleton, h] at hx ⊢
      aesop
    exact false_of_six_point_literal_subset_five B.centers_card hsub
  have hsecondFirst : S.oppApex2 ≠ S.oppApex1 := by
    intro h
    have hsub :
        ({H.centerAt Pρ.source₁ Pρ.source₁_mem_A,
          H.centerAt P.source₁ P.source₁_mem_A,
          S.oppApex1, S.oppApex2, S.surplusApex,
          H.centerAt source₅.1 source₅.2} : Finset ℝ²) ⊆
          {H.centerAt Pρ.source₁ Pρ.source₁_mem_A,
            H.centerAt P.source₁ P.source₁_mem_A,
            S.oppApex1, S.surplusApex,
            H.centerAt source₅.1 source₅.2} := by
      intro x hx
      simp only [Finset.mem_insert, Finset.mem_singleton, h] at hx ⊢
      aesop
    exact false_of_six_point_literal_subset_five B.centers_card hsub
  have hsecondP :
      S.oppApex2 ≠ H.centerAt P.source₁ P.source₁_mem_A := by
    intro h
    apply false_of_six_point_literal_subset_five B.centers_card
    show
      ({H.centerAt Pρ.source₁ Pρ.source₁_mem_A,
        H.centerAt P.source₁ P.source₁_mem_A,
        S.oppApex1, S.oppApex2, S.surplusApex,
        H.centerAt source₅.1 source₅.2} : Finset ℝ²) ⊆
        {H.centerAt Pρ.source₁ Pρ.source₁_mem_A,
          H.centerAt P.source₁ P.source₁_mem_A,
          S.oppApex1, S.surplusApex,
          H.centerAt source₅.1 source₅.2}
    intro x hx
    simp only [Finset.mem_insert, Finset.mem_singleton, h] at hx ⊢
    aesop
  have hsecondPρ :
      S.oppApex2 ≠ H.centerAt Pρ.source₁ Pρ.source₁_mem_A := by
    intro h
    apply false_of_six_point_literal_subset_five B.centers_card
    show
      ({H.centerAt Pρ.source₁ Pρ.source₁_mem_A,
        H.centerAt P.source₁ P.source₁_mem_A,
        S.oppApex1, S.oppApex2, S.surplusApex,
        H.centerAt source₅.1 source₅.2} : Finset ℝ²) ⊆
        {H.centerAt Pρ.source₁ Pρ.source₁_mem_A,
          H.centerAt P.source₁ P.source₁_mem_A,
          S.oppApex1, S.surplusApex,
          H.centerAt source₅.1 source₅.2}
    intro x hx
    simp only [Finset.mem_insert, Finset.mem_singleton, h] at hx ⊢
    aesop
  have hsurplusFirst : S.surplusApex ≠ S.oppApex1 := by
    intro h
    apply false_of_six_point_literal_subset_five B.centers_card
    show
      ({H.centerAt Pρ.source₁ Pρ.source₁_mem_A,
        H.centerAt P.source₁ P.source₁_mem_A,
        S.oppApex1, S.oppApex2, S.surplusApex,
        H.centerAt source₅.1 source₅.2} : Finset ℝ²) ⊆
        {H.centerAt Pρ.source₁ Pρ.source₁_mem_A,
          H.centerAt P.source₁ P.source₁_mem_A,
          S.oppApex1, S.oppApex2,
          H.centerAt source₅.1 source₅.2}
    intro x hx
    simp only [Finset.mem_insert, Finset.mem_singleton, h] at hx ⊢
    aesop
  have hsurplusP :
      S.surplusApex ≠ H.centerAt P.source₁ P.source₁_mem_A := by
    intro h
    apply false_of_six_point_literal_subset_five B.centers_card
    show
      ({H.centerAt Pρ.source₁ Pρ.source₁_mem_A,
        H.centerAt P.source₁ P.source₁_mem_A,
        S.oppApex1, S.oppApex2, S.surplusApex,
        H.centerAt source₅.1 source₅.2} : Finset ℝ²) ⊆
        {H.centerAt Pρ.source₁ Pρ.source₁_mem_A,
          H.centerAt P.source₁ P.source₁_mem_A,
          S.oppApex1, S.oppApex2,
          H.centerAt source₅.1 source₅.2}
    intro x hx
    simp only [Finset.mem_insert, Finset.mem_singleton, h] at hx ⊢
    aesop
  have hsurplusPρ :
      S.surplusApex ≠ H.centerAt Pρ.source₁ Pρ.source₁_mem_A := by
    intro h
    apply false_of_six_point_literal_subset_five B.centers_card
    show
      ({H.centerAt Pρ.source₁ Pρ.source₁_mem_A,
        H.centerAt P.source₁ P.source₁_mem_A,
        S.oppApex1, S.oppApex2, S.surplusApex,
        H.centerAt source₅.1 source₅.2} : Finset ℝ²) ⊆
        {H.centerAt Pρ.source₁ Pρ.source₁_mem_A,
          H.centerAt P.source₁ P.source₁_mem_A,
          S.oppApex1, S.oppApex2,
          H.centerAt source₅.1 source₅.2}
    intro x hx
    simp only [Finset.mem_insert, Finset.mem_singleton, h] at hx ⊢
    aesop
  let K₃ : SelectedFourClass D.A S.oppApex2 :=
    ATailFiveCenterDeletionBoundary.qDeletedK4ClassToSelectedFourClass
      B.firstFive.K₃ B.firstFive.B₃_card
  let K₄ : SelectedFourClass D.A S.surplusApex :=
    ATailFiveCenterDeletionBoundary.qDeletedK4ClassToSelectedFourClass
      B.firstFive.K₄ B.firstFive.B₄_card
  have hblockerPA : H.centerAt P.source₁ P.source₁_mem_A ∈ D.A :=
    (H.blockerVertex ⟨P.source₁, P.source₁_mem_A⟩).2
  have hblockerPρA : H.centerAt Pρ.source₁ Pρ.source₁_mem_A ∈ D.A :=
    (H.blockerVertex ⟨Pρ.source₁, Pρ.source₁_mem_A⟩).2
  refine ⟨?_, ?_, ?_, ?_⟩
  · exact
      ATailThirdCenterCommonPair.selectedFourClass_inter_pair_card_le_one_of_two_saturated_centers
        P.source₁_mem_A P.source₂_mem_A P.sources_ne
        (oppApex1_mem_A S) hblockerPA (oppApex2_mem_A S)
        hfirstP hsecondFirst hsecondP hPfirst hPblocker K₃
  · exact
      ATailThirdCenterCommonPair.selectedFourClass_inter_pair_card_le_one_of_two_saturated_centers
        P.source₁_mem_A P.source₂_mem_A P.sources_ne
        (oppApex1_mem_A S) hblockerPA (surplusApex_mem_A S)
        hfirstP hsurplusFirst hsurplusP hPfirst hPblocker K₄
  · exact
      ATailThirdCenterCommonPair.selectedFourClass_inter_pair_card_le_one_of_two_saturated_centers
        Pρ.source₁_mem_A Pρ.source₂_mem_A Pρ.sources_ne
        (oppApex1_mem_A S) hblockerPρA (oppApex2_mem_A S)
        hfirstPρ hsecondFirst hsecondPρ hPρfirst hPρblocker K₃
  · exact
      ATailThirdCenterCommonPair.selectedFourClass_inter_pair_card_le_one_of_two_saturated_centers
        Pρ.source₁_mem_A Pρ.source₂_mem_A Pρ.sources_ne
        (oppApex1_mem_A S) hblockerPρA (surplusApex_mem_A S)
        hfirstPρ hsurplusFirst hsurplusPρ hPρfirst hPρblocker K₄

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- Every actual blocker center has the boundary position dictated by the
strict indexed cap containing it.  This projection is deliberately generic:
it becomes a restrictive ingress only after a saturation branch identifies
the blocker with one of the already ordered source blockers. -/
theorem exists_blockerCenter_capIndex_and_boundaryPosition
    (source : CriticalShellSystem.CarrierVertex D.A)
    (B : BoundaryIndexing D.A) (hn : 0 < B.n)
    (iv iw : Fin B.n)
    (hblocks :
      DirectBoundaryBlocks S B.boundary hn iv iw ∨
        MirrorBoundaryBlocks S B.boundary hn iv iw) :
    ∃ k : Fin 3,
      H.centerAt source.1 source.2 ∈ S.capInteriorByIndex k ∧
        ((DirectBoundaryBlocks S B.boundary hn iv iw ∧
            ((k = S.oppIndex1 ∧
                iw < B.indexOf (H.blockerVertex source)) ∨
              (k = S.oppIndex2 ∧
                zeroIndex hn < B.indexOf (H.blockerVertex source) ∧
                B.indexOf (H.blockerVertex source) < iv) ∨
              (k = S.surplusIdx ∧
                iv < B.indexOf (H.blockerVertex source) ∧
                B.indexOf (H.blockerVertex source) < iw))) ∨
          (MirrorBoundaryBlocks S B.boundary hn iv iw ∧
            ((k = S.oppIndex1 ∧
                zeroIndex hn < B.indexOf (H.blockerVertex source) ∧
                B.indexOf (H.blockerVertex source) < iw) ∨
              (k = S.oppIndex2 ∧
                iv < B.indexOf (H.blockerVertex source)) ∨
              (k = S.surplusIdx ∧
                iw < B.indexOf (H.blockerVertex source) ∧
                B.indexOf (H.blockerVertex source) < iv)))) := by
  rcases exists_blockerCenter_mem_capInteriorByIndex
      (T := T) source with ⟨k, hk⟩
  refine ⟨k, hk, ?_⟩
  have hindex {q : Fin B.n}
      (hq : B.boundary q = H.centerAt source.1 source.2) :
      q = B.indexOf (H.blockerVertex source) := by
    apply B.boundary_injective
    calc
      B.boundary q = H.centerAt source.1 source.2 := hq
      _ = pointOf (H.blockerVertex source) := rfl
      _ = B.boundary (B.indexOf (H.blockerVertex source)) :=
        (B.point_eq (H.blockerVertex source)).symm
  rcases hblocks with hdirect | hmirror
  · refine Or.inl ⟨hdirect, ?_⟩
    rcases triApexAllLargeContext_index_cases S k with hkFirst | hkSecond | hkSurplus
    · subst k
      have hmem : H.centerAt source.1 source.2 ∈ S.oppInterior1 := by
        simpa [SurplusCapPacket.oppInterior1] using hk
      rcases hdirect.opp1_after _ hmem with ⟨q, hq, hqValue⟩
      have hqIndex := hindex hqValue
      subst q
      exact Or.inl ⟨rfl, hq⟩
    · subst k
      have hmem : H.centerAt source.1 source.2 ∈ S.oppInterior2 := by
        simpa [SurplusCapPacket.oppInterior2] using hk
      rcases hdirect.opp2_between _ hmem with
        ⟨q, hqZero, hqIv, hqValue⟩
      have hqIndex := hindex hqValue
      subst q
      exact Or.inr (Or.inl ⟨rfl, hqZero, hqIv⟩)
    · subst k
      rcases hdirect.surplus_between _ hk with
        ⟨q, hqIv, hqIw, hqValue⟩
      have hqIndex := hindex hqValue
      subst q
      exact Or.inr (Or.inr ⟨rfl, hqIv, hqIw⟩)
  · refine Or.inr ⟨hmirror, ?_⟩
    rcases triApexAllLargeContext_index_cases S k with hkFirst | hkSecond | hkSurplus
    · subst k
      have hmem : H.centerAt source.1 source.2 ∈ S.oppInterior1 := by
        simpa [SurplusCapPacket.oppInterior1] using hk
      rcases hmirror.opp1_between _ hmem with
        ⟨q, hqZero, hqIw, hqValue⟩
      have hqIndex := hindex hqValue
      subst q
      exact Or.inl ⟨rfl, hqZero, hqIw⟩
    · subst k
      have hmem : H.centerAt source.1 source.2 ∈ S.oppInterior2 := by
        simpa [SurplusCapPacket.oppInterior2] using hk
      rcases hmirror.opp2_after _ hmem with ⟨q, hq, hqValue⟩
      have hqIndex := hindex hqValue
      subst q
      exact Or.inr (Or.inl ⟨rfl, hq⟩)
    · subst k
      rcases hmirror.surplus_between _ hk with
        ⟨q, hqIw, hqIv, hqValue⟩
      have hqIndex := hindex hqValue
      subst q
      exact Or.inr (Or.inr ⟨rfl, hqIw, hqIv⟩)

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Convert the oriented raw survival split without choosing a preferred
source. -/
theorem twoCapSourcesSixCenterExactRowsBoundary_of_survival
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (h : TwoCapSourcesSixCenterDeletionSurvival
      (P := P) (Pρ := Pρ) source source') :
    TwoCapSourcesSixCenterExactRowsBoundary
      (P := P) (Pρ := Pρ) source source' := by
  rcases h with h | h
  · exact Or.inl
      (sixCenterDeletionExactRowsBoundary_of_survival
        (H := H) source'
        (H.centerAt Pρ.source₁ Pρ.source₁_mem_A)
        (H.centerAt P.source₁ P.source₁_mem_A)
        S.oppApex1 S.oppApex2 S.surplusApex
        (H.centerAt source.1 source.2) h)
  · exact Or.inr
      (sixCenterDeletionExactRowsBoundary_of_survival
        (H := H) source
        (H.centerAt Pρ.source₁ Pρ.source₁_mem_A)
        (H.centerAt P.source₁ P.source₁_mem_A)
        S.oppApex1 S.oppApex2 S.surplusApex
        (H.centerAt source'.1 source'.2) h)

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Enrich an oriented exact-row boundary with every collision/source fact
that follows source-cleanly from the live first-fiber packet. -/
theorem twoCapSourcesSixCenterSourceProvenanceBoundary_of_exactRows
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (h : TwoCapSourcesSixCenterExactRowsBoundary
      (P := P) (Pρ := Pρ) source source') :
    TwoCapSourcesSixCenterSourceProvenanceBoundary
      (P := P) (Pρ := Pρ) Q source source' := by
  rcases h with h | h
  · rcases h with ⟨B⟩
    refine Or.inl ⟨B, ?_⟩
    have hprovenance :=
      SixSurvivorExactRowsBoundary.collisionRows_sourceProvenance
        (P := P) (Pρ := Pρ) Q source' source
        S.oppApex1 S.oppApex2 S.surplusApex B
    exact ⟨hprovenance.1, hprovenance.2.1, hprovenance.2.2.1,
      hprovenance.2.2.2,
      ATailFiveCenterDeletionBoundary.qDeletedK4Class_deleted_not_mem_support
        B.firstFive.K₀,
      ATailFiveCenterDeletionBoundary.qDeletedK4Class_deleted_not_mem_support
        B.firstFive.K₁,
      ATailFiveCenterDeletionBoundary.qDeletedK4Class_deleted_not_mem_support
        B.K₅⟩
  · rcases h with ⟨B⟩
    refine Or.inr ⟨B, ?_⟩
    have hprovenance :=
      SixSurvivorExactRowsBoundary.collisionRows_sourceProvenance
        (P := P) (Pρ := Pρ) Q source source'
        S.oppApex1 S.oppApex2 S.surplusApex B
    exact ⟨hprovenance.1, hprovenance.2.1, hprovenance.2.2.1,
      hprovenance.2.2.2,
      ATailFiveCenterDeletionBoundary.qDeletedK4Class_deleted_not_mem_support
        B.firstFive.K₀,
      ATailFiveCenterDeletionBoundary.qDeletedK4Class_deleted_not_mem_support
        B.firstFive.K₁,
      ATailFiveCenterDeletionBoundary.qDeletedK4Class_deleted_not_mem_support
        B.K₅⟩

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Mutual incidence eliminates the complementary endpoint choices in the
finite two-pair split.  Thus both selected source rows omit one common
collision endpoint.  This is a genuine normalization step: the remaining
aligned branch may use the common omission without assuming a favorable
endpoint choice. -/
theorem commonCollisionEndpointOmission_of_mutualCrossMembership_frame
    (frame : TwoSourceCollisionFrame P Pρ)
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (hmutual :
      TwoCapSourcesMutualCrossMembership
        (H := H) C.firstSource C.secondSource) :
    CommonCollisionEndpointOmission
      (H := H) P Pρ C.firstSource C.secondSource := by
  obtain ⟨hρne, hfrontierFour, hρfour, hfrontierInteriorEq, hρInteriorEq,
    hpairsDisjoint, hblockersNe, LPρ, hLPρ, MPρ, LP, hLP, MP⟩ := frame
  rcases commonCollisionEndpointOmission_or_complementaryMembership
      (P := P) (Pρ := Pρ)
      hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
      T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP
      C.firstSource C.secondSource
      C.firstSource_data C.secondSource_data with hcommon | hcomplementary
  · exact hcommon
  · by_cases hblockersEq :
        H.blockerVertex C.firstSource = H.blockerVertex C.secondSource
    · exact
        (false_of_equalBlockers_complementaryMembership
          (P := P) (Pρ := Pρ) hpairsDisjoint
          C.firstSource C.secondSource C.sources_ne
          C.firstSource_data C.secondSource_data
          hmutual hblockersEq hcomplementary).elim
    · exact
        (false_of_twoCapSources_complementaryMembership
          (P := P) (Pρ := Pρ) (T := T)
          C.firstSource C.secondSource C.sources_ne
          C.firstSource_data C.secondSource_data
          hmutual hblockersEq hcomplementary.1).elim

include hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Mutual incidence eliminates the complementary endpoint choices in the
finite two-pair split.  Thus both selected source rows omit one common
collision endpoint.  This is a genuine normalization step: the remaining
aligned branch may use the common omission without assuming a favorable
endpoint choice.
This is a compatibility wrapper over
`commonCollisionEndpointOmission_of_mutualCrossMembership_frame`, which
takes the same hypotheses packaged as a `TwoSourceCollisionFrame`. -/
theorem commonCollisionEndpointOmission_of_mutualCrossMembership
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (hmutual :
      TwoCapSourcesMutualCrossMembership
        (H := H) C.firstSource C.secondSource) :
    CommonCollisionEndpointOmission
      (H := H) P Pρ C.firstSource C.secondSource :=
  commonCollisionEndpointOmission_of_mutualCrossMembership_frame P Pρ T
    ⟨hρne, hfrontierFour, hρfour, hfrontierInteriorEq, hρInteriorEq,
      hpairsDisjoint, hblockersNe, LPρ, hLPρ, MPρ, LP, hLP, MP⟩
    C hmutual

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- If the blocker of one source in a mutually incident cap-source pair lies
in the first cap, its exact row meets that cap in exactly the two sources. -/
private theorem selectedShell_inter_firstCap_eq_sourcePair
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (sources_ne : source.1 ≠ source'.1)
    (source_witness : FirstFiberCapSourceWitness P Pρ source)
    (source'_witness : FirstFiberCapSourceWitness P Pρ source')
    (hmutual :
      TwoCapSourcesMutualCrossMembership
        (H := H) source source')
    (hcenterFirst :
      H.centerAt source.1 source.2 ∈
        S.capInteriorByIndex S.oppIndex1) :
    (H.selectedAt source.1
        source.2).toCriticalFourShell.support ∩
        S.capByIndex S.oppIndex1 =
      {source.1, source'.1} := by
  classical
  have hpairSubset :
      ({source.1, source'.1} : Finset ℝ²) ⊆
        (H.selectedAt source.1
            source.2).toCriticalFourShell.support ∩
          S.capByIndex S.oppIndex1 := by
    intro z hz
    simp only [Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with rfl | rfl
    · exact Finset.mem_inter.mpr
        ⟨(H.selectedAt source.1
            source.2).toCriticalFourShell.q_mem_support,
          S.capInteriorByIndex_subset_capByIndex S.oppIndex1
            source_witness.2.1⟩
    · exact Finset.mem_inter.mpr
        ⟨hmutual.1,
          S.capInteriorByIndex_subset_capByIndex S.oppIndex1
            source'_witness.2.1⟩
  have hcapTwo :
      ((H.selectedAt source.1
          source.2).toCriticalFourShell.support ∩
        S.capByIndex S.oppIndex1).card ≤ 2 := by
    simpa using
      CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
        S D.convex S.oppIndex1
        (H.selectedAt source.1
          source.2).toCriticalFourShell.toSelectedFourClass
        (S.capInteriorByIndex_subset_capByIndex S.oppIndex1 hcenterFirst)
  exact
    (Finset.eq_of_subset_of_card_le hpairSubset
      (by simpa [sources_ne] using hcapTwo)).symm

/-- Source-facing equal-blocker remainder.  The common blocker is localized
in one indexed cap and equality of actual blockers is promoted to equality of
the two exact selected supports.  If that cap is the first cap, the packet
also exposes the exact shell/cap intersection and simultaneous omission of
all four collision endpoints. -/
abbrev FreshThirdAlignedEqualBlockerResidual
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ) : Prop :=
  H.blockerVertex C.firstSource = H.blockerVertex C.secondSource ∧
    ∃ i : Fin 3,
      H.centerAt C.firstSource.1 C.firstSource.2 ∈
          S.capInteriorByIndex i ∧
        H.centerAt C.secondSource.1 C.secondSource.2 ∈
          S.capInteriorByIndex i ∧
        (H.selectedAt C.firstSource.1
            C.firstSource.2).toCriticalFourShell.support =
          (H.selectedAt C.secondSource.1
            C.secondSource.2).toCriticalFourShell.support ∧
        (i = S.oppIndex1 →
          (H.selectedAt C.firstSource.1
              C.firstSource.2).toCriticalFourShell.support ∩
                S.capByIndex S.oppIndex1 =
              {C.firstSource.1, C.secondSource.1} ∧
            AllCollisionEndpointsOmitted
              (H := H) P Pρ C.firstSource C.secondSource)

/-- Distinct-blocker remainder of the aligned mutual-incidence arm.  It
retains both distinct blocker-cap indices, which blocker center lies in the
first strict cap, the exact two-source cap intersection of that blocker row,
and the fully normalized outside-pair deletion/crossed-row packet.  Keeping
the second cap index is essential for the downstream cyclic-order consumer. -/
abbrev FreshThirdAlignedDistinctBlockerFirstCapResidual
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshOutsideFirstBlockerFiber P Pρ) : Prop :=
  H.blockerVertex C.firstSource ≠ H.blockerVertex C.secondSource ∧
    ∃ i j : Fin 3,
      H.centerAt C.firstSource.1 C.firstSource.2 ∈
          S.capInteriorByIndex i ∧
        H.centerAt C.secondSource.1 C.secondSource.2 ∈
          S.capInteriorByIndex j ∧
        i ≠ j ∧
        ((i = S.oppIndex1 ∧
            (H.selectedAt C.firstSource.1
                C.firstSource.2).toCriticalFourShell.support ∩
                  S.capByIndex S.oppIndex1 =
                {C.firstSource.1, C.secondSource.1} ∧
            FirstFiberOutsidePairExactRowsOrCrossedThreeRowsResidual
              P Pρ Q C.firstSource C.secondSource) ∨
          (j = S.oppIndex1 ∧
            (H.selectedAt C.secondSource.1
                C.secondSource.2).toCriticalFourShell.support ∩
                  S.capByIndex S.oppIndex1 =
                {C.secondSource.1, C.firstSource.1} ∧
            FirstFiberOutsidePairExactRowsOrCrossedThreeRowsResidual
              P Pρ Q C.secondSource C.firstSource))

/-- Source-clean boundary packet for the distinct-blocker mutual-incidence
arm.  Besides retaining both blocker-cap indices, it places all three strict
caps in a zero-cut direct-or-mirror boundary and records the cyclic separation
forced by the two selected source rows sharing both source points. -/
def FreshThirdAlignedMutualBlockerBoundaryPacket
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ) : Prop :=
  ∃ (i j : Fin 3) (B : BoundaryIndexing D.A) (hn : 0 < B.n)
      (iv iw : Fin B.n),
    H.centerAt C.firstSource.1 C.firstSource.2 ∈
        S.capInteriorByIndex i ∧
      H.centerAt C.secondSource.1 C.secondSource.2 ∈
        S.capInteriorByIndex j ∧
      i ≠ j ∧
      B.boundary (zeroIndex hn) =
        S.oppositeVertexByIndex S.surplusIdx ∧
      B.boundary iv = S.oppositeVertexByIndex S.oppIndex1 ∧
      B.boundary iw = S.oppositeVertexByIndex S.oppIndex2 ∧
      (DirectBoundaryBlocks S B.boundary hn iv iw ∨
        MirrorBoundaryBlocks S B.boundary hn iv iw) ∧
      (SurplusCOMPGBank.btw
          (B.indexOf (H.blockerVertex C.firstSource))
          (B.indexOf (H.blockerVertex C.secondSource))
          (B.indexOf C.firstSource) ↔
        ¬ SurplusCOMPGBank.btw
          (B.indexOf (H.blockerVertex C.firstSource))
          (B.indexOf (H.blockerVertex C.secondSource))
          (B.indexOf C.secondSource))

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- The full indexed-cap and cyclic-order ingress for two mutually incident
aligned sources with distinct blockers.  This is cardinality-independent and
uses only global K4 plus the ordered Moser-cap boundary. -/
theorem freshThird_alignedMutualBlockerBoundaryPacket_frame
    (frame : TwoSourceCollisionFrame P Pρ)
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (hmutual :
      TwoCapSourcesMutualCrossMembership
        (H := H) C.firstSource C.secondSource)
    (hsourceBlockersNe :
      H.blockerVertex C.firstSource ≠ H.blockerVertex C.secondSource) :
    FreshThirdAlignedMutualBlockerBoundaryPacket
      (S := S) (H := H) P Pρ C := by
  obtain ⟨hρne, hfrontierFour, hρfour, hfrontierInteriorEq, hρInteriorEq,
    hpairsDisjoint, hblockersNe, LPρ, hLPρ, MPρ, LP, hLP, MP⟩ := frame
  rcases exists_mutualBlockerCapIndices_distinct
      (P := P) (Pρ := Pρ) T
      C.firstSource C.secondSource C.sources_ne
      C.firstSource_data C.secondSource_data hmutual hsourceBlockersNe with
    ⟨i, j, hfirstInterior, hsecondInterior, hijNe⟩
  rcases Census554.ZeroCutBoundaryIndexing.exists_with_capBlocks S with
    ⟨B, hn, iv, iw, hzero, hiv, hiw, hblocks⟩
  have hcentersNe :
      H.centerAt C.firstSource.1 C.firstSource.2 ≠
        H.centerAt C.secondSource.1 C.secondSource.2 := by
    intro h
    exact hsourceBlockersNe (Subtype.ext h)
  have hsourcesValNe : C.firstSource.1 ≠ C.secondSource.1 := by
    intro h
    exact C.sources_ne h
  refine ⟨i, j, B, hn, iv, iw, hfirstInterior, hsecondInterior,
    hijNe, hzero, hiv, hiw, hblocks, ?_⟩
  simpa [CriticalShellSystem.blockerVertex] using
    selectedFourClass_sharedPairCyclicSeparation_atBoundary
      B (H.blockerVertex C.firstSource).2
      (H.blockerVertex C.secondSource).2
      C.firstSource.2 C.secondSource.2 hcentersNe hsourcesValNe
      (H.selectedAt C.firstSource.1
        C.firstSource.2).toCriticalFourShell.toSelectedFourClass
      (H.selectedAt C.secondSource.1
        C.secondSource.2).toCriticalFourShell.toSelectedFourClass
      (H.selectedAt C.firstSource.1
        C.firstSource.2).toCriticalFourShell.q_mem_support
      hmutual.1 hmutual.2
      (H.selectedAt C.secondSource.1
        C.secondSource.2).toCriticalFourShell.q_mem_support

include T hblockersNe in
/-- The full indexed-cap and cyclic-order ingress for two mutually incident
aligned sources with distinct blockers.  This is cardinality-independent and
uses only global K4 plus the ordered Moser-cap boundary.
This is a compatibility wrapper over
`freshThird_alignedMutualBlockerBoundaryPacket_frame`, which takes the
same hypotheses packaged as a `TwoSourceCollisionFrame`. -/
theorem freshThird_alignedMutualBlockerBoundaryPacket
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (hmutual :
      TwoCapSourcesMutualCrossMembership
        (H := H) C.firstSource C.secondSource)
    (hsourceBlockersNe :
      H.blockerVertex C.firstSource ≠ H.blockerVertex C.secondSource) :
    FreshThirdAlignedMutualBlockerBoundaryPacket
      (S := S) (H := H) P Pρ C :=
  freshThird_alignedMutualBlockerBoundaryPacket_frame P Pρ T
    ⟨hρne, hfrontierFour, hρfour, hfrontierInteriorEq, hρInteriorEq,
      hpairsDisjoint, hblockersNe, LPρ, hLPρ, MPρ, LP, hLP, MP⟩
    C hmutual hsourceBlockersNe

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Global K4 saturation for a crossed three-row packet.  Unless the two
unnamed support points coincide, each one either exposes a selected exact-four
row after deleting one of the mutually incident sources, or is owned by the
only source blocker compatible with the exact crossed supports.  This is the
source-level clause needed by the next finite blocker-saturation query; it
introduces no cardinality bound. -/
theorem FirstFiberCrossedThreeRowExactSupports.sharedFourth_or_sourceDeletionSaturation
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (hsourcesNe : source.1 ≠ source'.1)
    (source_witness : FirstFiberCapSourceWitness P Pρ source)
    (source'_witness : FirstFiberCapSourceWitness P Pρ source')
    (hmutual :
      TwoCapSourcesMutualCrossMembership (H := H) source source')
    (hblockersNe' : H.blockerVertex source ≠ H.blockerVertex source')
    (commonOutside oppositeOutside : ℝ²)
    (E : FirstFiberCrossedThreeRowExactSupports
      P Pρ Q source source' commonOutside oppositeOutside) :
    E.commonFourth = E.oppositeFourth ∨
      ((HasNEquidistantPointsAt 4 (D.A.erase source.1)
            (H.centerAt E.commonFourth E.commonFourth_mem_A) ∨
          HasNEquidistantPointsAt 4 (D.A.erase source'.1)
            (H.centerAt E.commonFourth E.commonFourth_mem_A) ∨
          H.blockerVertex ⟨E.commonFourth, E.commonFourth_mem_A⟩ =
            H.blockerVertex source) ∧
        (HasNEquidistantPointsAt 4 (D.A.erase source.1)
            (H.centerAt E.oppositeFourth E.oppositeFourth_mem_A) ∨
          HasNEquidistantPointsAt 4 (D.A.erase source'.1)
            (H.centerAt E.oppositeFourth E.oppositeFourth_mem_A) ∨
          H.blockerVertex ⟨E.oppositeFourth, E.oppositeFourth_mem_A⟩ =
            H.blockerVertex source')) := by
  by_cases hshared : E.commonFourth = E.oppositeFourth
  · exact Or.inl hshared
  have hcommonNotOther :
      H.blockerVertex ⟨E.commonFourth, E.commonFourth_mem_A⟩ ≠
        H.blockerVertex source' := by
    intro hblocker
    let commonRow : SelectedFourClass D.A
        (H.centerAt source.1 source.2) :=
      (H.selectedAt source.1 source.2).toCriticalFourShell.toSelectedFourClass
    let otherRow : SelectedFourClass D.A
        (H.centerAt source'.1 source'.2) :=
      (H.selectedAt source'.1 source'.2).toCriticalFourShell.toSelectedFourClass
    have hcentersNe :
        H.centerAt source.1 source.2 ≠ H.centerAt source'.1 source'.2 := by
      intro hcenters
      apply hblockersNe'
      apply Subtype.ext
      exact hcenters
    have hcommonMemOther : E.commonFourth ∈ otherRow.support := by
      have hsupports :=
        ATailSurvivalCover.selectedSupports_eq_of_actualBlockers_eq H
          E.commonFourth_mem_A source'.2 (congrArg Subtype.val hblocker)
      change E.commonFourth ∈
        (H.selectedAt source'.1 source'.2).toCriticalFourShell.support
      rw [← hsupports]
      exact
        (H.selectedAt E.commonFourth
          E.commonFourth_mem_A).toCriticalFourShell.q_mem_support
    have hthreeSubset :
        ({source.1, source'.1, E.commonFourth} : Finset ℝ²) ⊆
          commonRow.support ∩ otherRow.support := by
      intro z hz
      simp only [Finset.mem_insert, Finset.mem_singleton] at hz
      rcases hz with rfl | rfl | rfl
      · exact Finset.mem_inter.mpr
          ⟨by simpa [commonRow] using
              (H.selectedAt source.1 source.2).toCriticalFourShell.q_mem_support,
            by simpa [otherRow] using hmutual.2⟩
      · exact Finset.mem_inter.mpr
          ⟨by simpa [commonRow] using hmutual.1,
            by simpa [otherRow] using
              (H.selectedAt source'.1 source'.2).toCriticalFourShell.q_mem_support⟩
      · exact Finset.mem_inter.mpr
          ⟨by
            change E.commonFourth ∈
              (H.selectedAt source.1 source.2).toCriticalFourShell.support
            rw [E.commonRow_support_eq]
            simp,
            hcommonMemOther⟩
    have hcommonNeSource : E.commonFourth ≠ source.1 := by
      intro h
      apply E.commonFourth_not_mem_named
      simp [h]
    have hcommonNeOther : E.commonFourth ≠ source'.1 := by
      intro h
      apply E.commonFourth_not_mem_named
      simp [h]
    have hthreeCard :
        ({source.1, source'.1, E.commonFourth} : Finset ℝ²).card = 3 := by
      simp [hsourcesNe, Ne.symm hcommonNeSource, Ne.symm hcommonNeOther]
    have hthreeLe := Finset.card_le_card hthreeSubset
    have hinter :=
      SelectedFourClass.inter_card_le_two commonRow otherRow hcentersNe
    rw [hthreeCard] at hthreeLe
    omega
  have hoppositeNotCommon :
      H.blockerVertex ⟨E.oppositeFourth, E.oppositeFourth_mem_A⟩ ≠
        H.blockerVertex source := by
    intro hblocker
    apply hshared
    exact
      (FirstFiberCrossedThreeRowExactSupports.oppositeFourth_eq_commonFourth_of_blocker_eq
        (P := P) (Pρ := Pρ) (H := H) (Q := Q) (source := source)
        (source' := source') (source_witness := source_witness)
        (source'_witness := source'_witness) (commonOutside := commonOutside)
        (oppositeOutside := oppositeOutside) (E := E) hblocker).symm
  refine Or.inr ⟨?_, ?_⟩
  · rcases sourceDeletionSurvival_or_blockerVertex_eq_mutualPair
        (D := D) (H := H)
        source source' ⟨E.commonFourth, E.commonFourth_mem_A⟩
        hsourcesNe hmutual hblockersNe' with h | h | h | h
    · exact Or.inl h
    · exact Or.inr (Or.inl h)
    · exact Or.inr (Or.inr h)
    · exact False.elim (hcommonNotOther h)
  · rcases sourceDeletionSurvival_or_blockerVertex_eq_mutualPair
        (D := D) (H := H)
        source source' ⟨E.oppositeFourth, E.oppositeFourth_mem_A⟩
        hsourcesNe hmutual hblockersNe' with h | h | h | h
    · exact Or.inl h
    · exact Or.inr (Or.inl h)
    · exact False.elim (hoppositeNotCommon h)
    · exact Or.inr (Or.inr h)

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Canonical-row form of crossed-source deletion saturation.  The two K4
survival alternatives are converted to exact omissions from the selected row
at the corresponding fourth point's actual blocker.  This is the finite
incidence ingress consumed by the blocker-saturation search. -/
theorem FirstFiberCrossedThreeRowExactSupports.sharedFourth_or_selectedRowOmissionSaturation
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (source source' : CriticalShellSystem.CarrierVertex D.A)
    (hsourcesNe : source.1 ≠ source'.1)
    (source_witness : FirstFiberCapSourceWitness P Pρ source)
    (source'_witness : FirstFiberCapSourceWitness P Pρ source')
    (hmutual :
      TwoCapSourcesMutualCrossMembership (H := H) source source')
    (hblockersNe' : H.blockerVertex source ≠ H.blockerVertex source')
    (commonOutside oppositeOutside : ℝ²)
    (E : FirstFiberCrossedThreeRowExactSupports
      P Pρ Q source source' commonOutside oppositeOutside) :
    E.commonFourth = E.oppositeFourth ∨
      (((source.1 ∉
            (H.selectedAt E.commonFourth
              E.commonFourth_mem_A).toCriticalFourShell.support) ∨
          (source'.1 ∉
            (H.selectedAt E.commonFourth
              E.commonFourth_mem_A).toCriticalFourShell.support) ∨
          H.blockerVertex ⟨E.commonFourth, E.commonFourth_mem_A⟩ =
            H.blockerVertex source) ∧
        ((source.1 ∉
            (H.selectedAt E.oppositeFourth
              E.oppositeFourth_mem_A).toCriticalFourShell.support) ∨
          (source'.1 ∉
            (H.selectedAt E.oppositeFourth
              E.oppositeFourth_mem_A).toCriticalFourShell.support) ∨
          H.blockerVertex ⟨E.oppositeFourth, E.oppositeFourth_mem_A⟩ =
            H.blockerVertex source')) := by
  rcases
      FirstFiberCrossedThreeRowExactSupports.sharedFourth_or_sourceDeletionSaturation
        (P := P) (Pρ := Pρ) (H := H) Q source source' hsourcesNe
        source_witness source'_witness hmutual hblockersNe'
        commonOutside oppositeOutside E with hshared | ⟨hcommon, hopposite⟩
  · exact Or.inl hshared
  refine Or.inr ⟨?_, ?_⟩
  · rcases hcommon with h | h | h
    · exact Or.inl
        ((cross_deletion_survives_iff_not_mem_selected_support
          H E.commonFourth_mem_A).mp h)
    · exact Or.inr (Or.inl
        ((cross_deletion_survives_iff_not_mem_selected_support
          H E.commonFourth_mem_A).mp h))
    · exact Or.inr (Or.inr h)
  · rcases hopposite with h | h | h
    · exact Or.inl
        ((cross_deletion_survives_iff_not_mem_selected_support
          H E.oppositeFourth_mem_A).mp h)
    · exact Or.inr (Or.inl
        ((cross_deletion_survives_iff_not_mem_selected_support
          H E.oppositeFourth_mem_A).mp h))
    · exact Or.inr (Or.inr h)

/-- Exact first-fiber remainder of the aligned mutual-incidence arm.  Equal
blockers retain their common-cap and common-support geometry.  Distinct
blockers retain a first-cap localization and exact supports for all rows in
the normalized outside-pair packet. -/
abbrev FreshThirdAlignedMutualFirstFiberResidual
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshOutsideFirstBlockerFiber P Pρ) : Prop :=
  FreshThirdAlignedEqualBlockerResidual
      (S := S) (H := H) P Pρ C ∨
    FreshThirdAlignedDistinctBlockerFirstCapResidual
      (S := S) (H := H) P Pρ C Q

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Source-clean producer for the aligned mutual first-fiber remainder.  This
uses no cardinality cutoff: the cap localization is the general ordered-cap
bisector theorem, and the exact-row alternatives come from the checked
outside-pair deletion split. -/
theorem freshThird_alignedMutualFirstFiberResidual_of_mutualCrossMembership_frame
    (frame : TwoSourceCollisionFrame P Pρ)
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (hmutual :
      TwoCapSourcesMutualCrossMembership
        (H := H) C.firstSource C.secondSource) :
    FreshThirdAlignedMutualFirstFiberResidual
      (H := H) P Pρ C Q := by
  obtain ⟨hρne, hfrontierFour, hρfour, hfrontierInteriorEq, hρInteriorEq,
    hpairsDisjoint, hblockersNe, LPρ, hLPρ, MPρ, LP, hLP, MP⟩ := frame
  by_cases hblockersEq :
      H.blockerVertex C.firstSource = H.blockerVertex C.secondSource
  · have hcentersEq :
        H.centerAt C.firstSource.1 C.firstSource.2 =
          H.centerAt C.secondSource.1 C.secondSource.2 :=
      congrArg Subtype.val hblockersEq
    rcases exists_blockerCenter_mem_capInteriorByIndex
        (T := T) C.firstSource with ⟨i, hfirstCap⟩
    have hsecondCap :
        H.centerAt C.secondSource.1 C.secondSource.2 ∈
          S.capInteriorByIndex i := by
      rw [← hcentersEq]
      exact hfirstCap
    have hsupportsEq :
        (H.selectedAt C.firstSource.1
            C.firstSource.2).toCriticalFourShell.support =
          (H.selectedAt C.secondSource.1
            C.secondSource.2).toCriticalFourShell.support :=
      ATailSurvivalCover.selectedSupports_eq_of_actualBlockers_eq
        H C.firstSource.2 C.secondSource.2 hcentersEq
    have hfirstCapGeometry :
        i = S.oppIndex1 →
          (H.selectedAt C.firstSource.1
              C.firstSource.2).toCriticalFourShell.support ∩
                S.capByIndex S.oppIndex1 =
              {C.firstSource.1, C.secondSource.1} ∧
            AllCollisionEndpointsOmitted
              (H := H) P Pρ C.firstSource C.secondSource := by
      intro hi
      subst i
      have hshell :=
        selectedShell_inter_firstCap_eq_sourcePair
          (P := P) (Pρ := Pρ)
          C.firstSource C.secondSource C.sources_ne
          C.firstSource_data C.secondSource_data hmutual hfirstCap
      exact ⟨hshell,
        allCollisionEndpointsOmitted_of_equalBlocker_shell_inter_cap_eq
          (P := P) (Pρ := Pρ)
          C.firstSource C.secondSource
          C.firstSource_data C.secondSource_data
          hblockersEq hshell⟩
    exact Or.inl
      ⟨hblockersEq, i, hfirstCap, hsecondCap, hsupportsEq,
        hfirstCapGeometry⟩
  · rcases exists_mutualBlockerCapIndices_distinct
        (P := P) (Pρ := Pρ) T
        C.firstSource C.secondSource C.sources_ne
        C.firstSource_data C.secondSource_data hmutual hblockersEq with
      ⟨i, j, hfirstInterior, hsecondInterior, hijNe⟩
    have hindexFirst : i = S.oppIndex1 ∨ j = S.oppIndex1 := by
      by_contra hneither
      have hiNe : i ≠ S.oppIndex1 := by
        intro hi
        exact hneither (Or.inl hi)
      have hjNe : j ≠ S.oppIndex1 := by
        intro hj
        exact hneither (Or.inr hj)
      have hfirstOff :
          H.centerAt C.firstSource.1 C.firstSource.2 ∉
            S.capByIndex S.oppIndex1 :=
        S.capInteriorByIndex_not_mem_capByIndex_of_ne
          hfirstInterior hiNe
      have hsecondOff :
          H.centerAt C.secondSource.1 C.secondSource.2 ∉
            S.capByIndex S.oppIndex1 :=
        S.capInteriorByIndex_not_mem_capByIndex_of_ne
          hsecondInterior hjNe
      exact
        false_of_twoCapSources_of_blockers_off_firstCap
          C.firstSource C.secondSource C.sources_ne
          C.firstSource_data.2.1 C.secondSource_data.2.1
          hmutual hblockersEq hfirstOff hsecondOff
    rcases hindexFirst with hi | hj
    · subst i
      have hfirstCap :
          H.centerAt C.firstSource.1 C.firstSource.2 ∈
            S.capByIndex S.oppIndex1 :=
        S.capInteriorByIndex_subset_capByIndex
          S.oppIndex1 hfirstInterior
      have hshell :=
        selectedShell_inter_firstCap_eq_sourcePair
          (P := P) (Pρ := Pρ)
          C.firstSource C.secondSource C.sources_ne
          C.firstSource_data C.secondSource_data hmutual hfirstInterior
      have hraw :=
        firstFiberOutsidePair_exactRows_or_crossed
          (P := P) (Pρ := Pρ) Q C.firstSource
          (firstFiberOutsidePair_fiveCenter_or_crossed
            (P := P) (Pρ := Pρ) (T := T)
            (hblockersNe := hblockersNe) Q C.firstSource hfirstCap
            C.firstSource_data.2.2.2.1)
      have hnormalized :=
        firstFiberOutsidePair_exactRows_or_crossedThreeRows
          (P := P) (Pρ := Pρ) Q
          C.firstSource C.secondSource C.sources_ne
          C.firstSource_data C.secondSource_data hmutual hshell hraw
      exact Or.inr ⟨hblockersEq, S.oppIndex1, j,
        hfirstInterior, hsecondInterior, hijNe, Or.inl
          ⟨rfl, hshell, hnormalized⟩⟩
    · subst j
      have hsecondCap :
          H.centerAt C.secondSource.1 C.secondSource.2 ∈
            S.capByIndex S.oppIndex1 :=
        S.capInteriorByIndex_subset_capByIndex
          S.oppIndex1 hsecondInterior
      have hmutualRev :
          TwoCapSourcesMutualCrossMembership
            (H := H) C.secondSource C.firstSource :=
        ⟨hmutual.2, hmutual.1⟩
      have hshell :=
        selectedShell_inter_firstCap_eq_sourcePair
          (P := P) (Pρ := Pρ)
          C.secondSource C.firstSource (Ne.symm C.sources_ne)
          C.secondSource_data C.firstSource_data hmutualRev hsecondInterior
      have hraw :=
        firstFiberOutsidePair_exactRows_or_crossed
          (P := P) (Pρ := Pρ) Q C.secondSource
          (firstFiberOutsidePair_fiveCenter_or_crossed
            (P := P) (Pρ := Pρ) (T := T)
            (hblockersNe := hblockersNe) Q C.secondSource hsecondCap
            C.secondSource_data.2.2.2.1)
      have hnormalized :=
        firstFiberOutsidePair_exactRows_or_crossedThreeRows
          (P := P) (Pρ := Pρ) Q
          C.secondSource C.firstSource (Ne.symm C.sources_ne)
          C.secondSource_data C.firstSource_data hmutualRev hshell hraw
      exact Or.inr ⟨hblockersEq, i, S.oppIndex1,
        hfirstInterior, hsecondInterior, hijNe, Or.inr
          ⟨rfl, hshell, hnormalized⟩⟩

include T hblockersNe in
/-- Source-clean producer for the aligned mutual first-fiber remainder.  This
uses no cardinality cutoff: the cap localization is the general ordered-cap
bisector theorem, and the exact-row alternatives come from the checked
outside-pair deletion split.
This is a compatibility wrapper over
`freshThird_alignedMutualFirstFiberResidual_of_mutualCrossMembership_frame`,
which takes the same hypotheses packaged as a `TwoSourceCollisionFrame`. -/
theorem freshThird_alignedMutualFirstFiberResidual_of_mutualCrossMembership
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (hmutual :
      TwoCapSourcesMutualCrossMembership
        (H := H) C.firstSource C.secondSource) :
    FreshThirdAlignedMutualFirstFiberResidual
      (H := H) P Pρ C Q :=
  freshThird_alignedMutualFirstFiberResidual_of_mutualCrossMembership_frame P Pρ T
    ⟨hρne, hfrontierFour, hρfour, hfrontierInteriorEq, hρInteriorEq,
      hpairsDisjoint, hblockersNe, LPρ, hLPρ, MPρ, LP, hLP, MP⟩
    C Q hmutual

/-- Strict acyclic first-fiber residual after consuming the common-radius
mutual-incidence arm.  Each surviving constructor retains its source-produced
provenance: aligned mutual incidence, aligned one-sided six-center survival,
or common-radius one-sided six-center survival. -/
abbrev FreshThirdAcyclicHardResidual
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshOutsideFirstBlockerFiber P Pρ) : Prop :=
  (FreshThirdAlignedRetainedConsumerPacket (P := P) (Pρ := Pρ) C ∧
      TwoCapSourcesMutualCrossMembership
        (H := H) C.firstSource C.secondSource ∧
      FreshThirdAlignedCommonDeletionCorePairPacket
        (S := S) (H := H) P Pρ C ∧
      FreshThirdAlignedMutualFirstFiberResidual
        (H := H) P Pρ C Q) ∨
    (FreshThirdAlignedRetainedConsumerPacket (P := P) (Pρ := Pρ) C ∧
      TwoCapSourcesSixCenterSourceProvenanceFixedTripleAuditBoundary
        (P := P) (Pρ := Pρ) Q C.firstSource C.secondSource) ∨
    ∃ Ccommon : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ,
      TwoCapSourcesSixCenterSourceProvenanceFixedTripleAuditBoundary
        (P := P) (Pρ := Pρ) Q
        Ccommon.surface.firstSource Ccommon.surface.secondSource

include hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- The remaining universal first-fiber obligation after the acyclic ingress
has been normalized and its common-radius mutual-incidence arm discharged. -/
theorem false_of_twoCapSources_freshOutsideFirstBlockerFiber_acyclicHardResidual
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (hresidual :
      FreshThirdAcyclicHardResidual (P := P) (Pρ := Pρ) C Q) :
    False := by
  sorry

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- The live enlarged-first-fiber consumer.  The source-clean ingress is split
once, and only the three provenance-preserving hard constructors reach the
remaining residual. -/
theorem false_of_twoCapSources_freshOutsideFirstBlockerFiber_acyclicIngress_frame
    (frame : TwoSourceCollisionFrame P Pρ)
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (hingress :
      FreshThirdAcyclicCanonicalConsumerPacket (P := P) (Pρ := Pρ) C) :
    False := by
  obtain ⟨hρne, hfrontierFour, hρfour, hfrontierInteriorEq, hρInteriorEq,
    hpairsDisjoint, hblockersNe, LPρ, hLPρ, MPρ, LP, hLP, MP⟩ := frame
  have hcard9 : 9 < D.A.card := by
    have hcard17 :=
      twoCapSourceSurface_carrier_card_ge_seventeen
        (P := P) (Pρ := Pρ) (T := T) C
    omega
  rcases hingress with haligned | hcommon
  · rcases mutualCrossMembership_or_oneSidedDeletionSurvival
        C.firstSource C.secondSource with hmutual | hsurvival
    · have hcommon :
          CommonCollisionEndpointOmission
            (H := H) P Pρ C.firstSource C.secondSource :=
        commonCollisionEndpointOmission_of_mutualCrossMembership_frame
          (P := P) (Pρ := Pρ) (T := T)
          (frame :=
            ⟨hρne, hfrontierFour, hρfour, hfrontierInteriorEq, hρInteriorEq,
              hpairsDisjoint, hblockersNe, LPρ, hLPρ, MPρ, LP, hLP, MP⟩)
          C hmutual
      have hcommonCore :
          FreshThirdAlignedCommonDeletionCorePairPacket
            (S := S) (H := H) P Pρ C :=
        freshThird_alignedCommonDeletionCorePairPacket_of_commonOmission
          (P := P) (Pρ := Pρ) (hρne := hρne)
          (hfrontierFour := hfrontierFour) (hρfour := hρfour)
          (hfrontierInteriorEq := hfrontierInteriorEq)
          (hρInteriorEq := hρInteriorEq) (T := T)
          C haligned.2.2.2.2.2 hcommon
      have hfirstFiberResidual :
          FreshThirdAlignedMutualFirstFiberResidual
            (H := H) P Pρ C Q :=
        freshThird_alignedMutualFirstFiberResidual_of_mutualCrossMembership_frame
          (P := P) (Pρ := Pρ) (T := T)
          (frame :=
            ⟨hρne, hfrontierFour, hρfour, hfrontierInteriorEq, hρInteriorEq,
              hpairsDisjoint, hblockersNe, LPρ, hLPρ, MPρ, LP, hLP, MP⟩)
          C Q hmutual
      exact
        false_of_twoCapSources_freshOutsideFirstBlockerFiber_acyclicHardResidual
          (P := P) (Pρ := Pρ)
          (hρne := hρne) (hfrontierFour := hfrontierFour)
          (hρfour := hρfour)
          (hfrontierInteriorEq := hfrontierInteriorEq)
          (hρInteriorEq := hρInteriorEq)
          (T := T) (hpairsDisjoint := hpairsDisjoint)
          (hblockersNe := hblockersNe)
          (LPρ := LPρ) (hLPρ := hLPρ) (MPρ := MPρ)
          (LP := LP) (hLP := hLP) (MP := MP)
          C Q
          (Or.inl
            ⟨haligned, hmutual, hcommonCore, hfirstFiberResidual⟩)
    · have hsix :
          TwoCapSourcesSixCenterDeletionSurvival
            (P := P) (Pρ := Pρ) C.firstSource C.secondSource :=
        sixCenterDeletionSurvivalPacket_of_oneSided
          (P := P) (Pρ := Pρ) (T := T)
          (hblockersNe := hblockersNe)
          C.firstSource C.secondSource
          C.firstSource_data C.secondSource_data hsurvival
      have hsixExact :
          TwoCapSourcesSixCenterExactRowsBoundary
            (P := P) (Pρ := Pρ) C.firstSource C.secondSource :=
        twoCapSourcesSixCenterExactRowsBoundary_of_survival
          (P := P) (Pρ := Pρ) C.firstSource C.secondSource hsix
      have hsixProvenance :
          TwoCapSourcesSixCenterSourceProvenanceBoundary
            (P := P) (Pρ := Pρ) Q C.firstSource C.secondSource :=
        twoCapSourcesSixCenterSourceProvenanceBoundary_of_exactRows
          (P := P) (Pρ := Pρ) Q C.firstSource C.secondSource hsixExact
      have hsixAudit :
          TwoCapSourcesSixCenterSourceProvenanceFixedTripleAuditBoundary
            (P := P) (Pρ := Pρ) Q C.firstSource C.secondSource :=
        twoCapSourcesSixCenterSourceProvenanceFixedTripleAuditBoundary_of_boundary
          (P := P) (Pρ := Pρ) Q C.firstSource C.secondSource
          hcard9 hsixProvenance
      exact
        false_of_twoCapSources_freshOutsideFirstBlockerFiber_acyclicHardResidual
          (P := P) (Pρ := Pρ)
          (hρne := hρne) (hfrontierFour := hfrontierFour)
          (hρfour := hρfour)
          (hfrontierInteriorEq := hfrontierInteriorEq)
          (hρInteriorEq := hρInteriorEq)
          (T := T) (hpairsDisjoint := hpairsDisjoint)
          (hblockersNe := hblockersNe)
          (LPρ := LPρ) (hLPρ := hLPρ) (MPρ := MPρ)
          (LP := LP) (hLP := hLP) (MP := MP)
          C Q (Or.inr (Or.inl ⟨haligned, hsixAudit⟩))
  · rcases hcommon with ⟨Ccommon⟩
    rcases mutualCrossMembership_or_oneSidedDeletionSurvival
        Ccommon.surface.firstSource Ccommon.surface.secondSource with
      hmutual | hsurvival
    · exact
        false_of_twoCapSources_commonRadius_mutualCrossMembership_frame
          (P := P) (Pρ := Pρ) (T := T)
          (frame :=
            ⟨hρne, hfrontierFour, hρfour, hfrontierInteriorEq, hρInteriorEq,
              hpairsDisjoint, hblockersNe, LPρ, hLPρ, MPρ, LP, hLP, MP⟩)
          Q Ccommon.surface.firstSource Ccommon.surface.secondSource
          Ccommon.surface.sources_ne Ccommon.firstSource_mem
          Ccommon.secondSource_mem Ccommon.surface.firstSource_data
          Ccommon.surface.secondSource_data hmutual
    · have hsix :
          TwoCapSourcesSixCenterDeletionSurvival
            (P := P) (Pρ := Pρ)
            Ccommon.surface.firstSource Ccommon.surface.secondSource :=
        sixCenterDeletionSurvivalPacket_of_oneSided
          (P := P) (Pρ := Pρ) (T := T)
          (hblockersNe := hblockersNe)
          Ccommon.surface.firstSource Ccommon.surface.secondSource
          Ccommon.surface.firstSource_data Ccommon.surface.secondSource_data
          hsurvival
      have hsixExact :
          TwoCapSourcesSixCenterExactRowsBoundary
            (P := P) (Pρ := Pρ)
            Ccommon.surface.firstSource Ccommon.surface.secondSource :=
        twoCapSourcesSixCenterExactRowsBoundary_of_survival
          (P := P) (Pρ := Pρ)
          Ccommon.surface.firstSource Ccommon.surface.secondSource hsix
      have hsixProvenance :
          TwoCapSourcesSixCenterSourceProvenanceBoundary
            (P := P) (Pρ := Pρ) Q
            Ccommon.surface.firstSource Ccommon.surface.secondSource :=
        twoCapSourcesSixCenterSourceProvenanceBoundary_of_exactRows
          (P := P) (Pρ := Pρ) Q
          Ccommon.surface.firstSource Ccommon.surface.secondSource hsixExact
      have hsixAudit :
          TwoCapSourcesSixCenterSourceProvenanceFixedTripleAuditBoundary
            (P := P) (Pρ := Pρ) Q
            Ccommon.surface.firstSource Ccommon.surface.secondSource :=
        twoCapSourcesSixCenterSourceProvenanceFixedTripleAuditBoundary_of_boundary
          (P := P) (Pρ := Pρ) Q
          Ccommon.surface.firstSource Ccommon.surface.secondSource
          hcard9 hsixProvenance
      exact
        false_of_twoCapSources_freshOutsideFirstBlockerFiber_acyclicHardResidual
          (P := P) (Pρ := Pρ)
          (hρne := hρne) (hfrontierFour := hfrontierFour)
          (hρfour := hρfour)
          (hfrontierInteriorEq := hfrontierInteriorEq)
          (hρInteriorEq := hρInteriorEq)
          (T := T) (hpairsDisjoint := hpairsDisjoint)
          (hblockersNe := hblockersNe)
          (LPρ := LPρ) (hLPρ := hLPρ) (MPρ := MPρ)
          (LP := LP) (hLP := hLP) (MP := MP)
          C Q (Or.inr (Or.inr ⟨Ccommon, hsixAudit⟩))

include hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- The live enlarged-first-fiber consumer.  The source-clean ingress is split
once, and only the three provenance-preserving hard constructors reach the
remaining residual.
This is a compatibility wrapper over
`false_of_twoCapSources_freshOutsideFirstBlockerFiber_acyclicIngress_frame`,
which takes the same hypotheses packaged as a `TwoSourceCollisionFrame`. -/
theorem false_of_twoCapSources_freshOutsideFirstBlockerFiber_acyclicIngress
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (hingress :
      FreshThirdAcyclicCanonicalConsumerPacket (P := P) (Pρ := Pρ) C) :
    False :=
  false_of_twoCapSources_freshOutsideFirstBlockerFiber_acyclicIngress_frame P Pρ T
    ⟨hρne, hfrontierFour, hρfour, hfrontierInteriorEq, hρInteriorEq,
      hpairsDisjoint, hblockersNe, LPρ, hLPρ, MPρ, LP, hLP, MP⟩
    C Q hingress

include hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Checked adapter from the live surface to the acyclic ingress consumer. -/
theorem false_of_twoCapSources_freshOutsideFirstBlockerFiber_viaAcyclicIngress
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (hfirst : Nonempty (FreshOutsideFirstBlockerFiber P Pρ)) :
    False := by
  rcases hfirst with ⟨Q⟩
  exact
    false_of_twoCapSources_freshOutsideFirstBlockerFiber_acyclicIngress_frame
      (P := P) (Pρ := Pρ) (T := T)
      (frame :=
        ⟨hρne, hfrontierFour, hρfour, hfrontierInteriorEq, hρInteriorEq,
          hpairsDisjoint, hblockersNe, LPρ, hLPρ, MPρ, LP, hLP, MP⟩)
      C Q
      (freshThird_acyclic_canonical_consumerPacket
        (P := P) (Pρ := Pρ)
        (hρne := hρne) (hfrontierFour := hfrontierFour)
        (hρfour := hρfour)
        (hfrontierInteriorEq := hfrontierInteriorEq)
        (hρInteriorEq := hρInteriorEq)
        (T := T) (hpairsDisjoint := hpairsDisjoint)
        (hblockersNe := hblockersNe)
        (LPρ := LPρ) (hLPρ := hLPρ) (MPρ := MPρ)
        (LP := LP) (hLP := hLP) (MP := MP) C)

include hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- Swap-compatible adapter for the second enlarged blocker fiber. -/
theorem false_of_twoCapSources_freshOutsideSecondBlockerFiber_viaAcyclicIngress
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (hsecond : Nonempty (FreshOutsideSecondBlockerFiber P Pρ)) :
    False := by
  let Bswap : FrontierBiApexRobustResidual Rρ :=
    ⟨B.secondApex_robust⟩
  let Lswap : FrontierLargeOppositeCapsBiApexRobustResidual Bswap :=
    ⟨L.firstOppCap_card_ge_six, L.secondOppCap_card_ge_six⟩
  let Nswap : FrontierAllLargeCapsBiApexRobustResidual Lswap :=
    ⟨N.surplusCap_card_ge_six⟩
  let Tswap : FrontierAllLargeCapsTriApexRobustResidual Nswap :=
    ⟨T.oppApex1_rich, T.oppApex2_rich, T.surplusApex_rich,
      T.notRobustCover_card, T.no_center_covers_all_apices⟩
  exact false_of_twoCapSources_freshOutsideFirstBlockerFiber_viaAcyclicIngress
    Pρ P hρne.symm hρfour hfrontierFour
    hρInteriorEq hfrontierInteriorEq Tswap
    hpairsDisjoint.symm hblockersNe.symm
    LP hLP MP LPρ hLPρ MPρ
    (twoCapSourceThirdCanonicalRowSurface_swap P Pρ C)
    (hsecond.map FreshOutsideSecondBlockerFiber.toSwappedFirst)

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- Under alignment, every first-apex K4 radius is one of the two retained
collision radii.  This is the global form needed when a deletion produces an
otherwise unnamed four-point class at the first apex. -/
private theorem firstApex_K4Radius_eq_retained_of_aligned
    (haligned :
      FirstCapMultiPointRadiiRetained
        (S := S) (radius := radius) (ρ := ρ))
    {r : ℝ} (hr : 0 < r)
    (hfour : 4 ≤ (SelectedClass D.A S.oppApex1 r).card) :
    r = radius ∨ r = ρ := by
  apply haligned r
  have hfour' :
      4 ≤
        (SelectedClass D.A
          (S.oppositeVertexByIndex S.oppIndex1) r).card := by
    simpa using hfour
  simpa using
    S.selectedClass_capInteriorByIndex_card_ge_two
      D.convex S.oppIndex1 hr hfour'

omit hρne hfrontierInteriorEq hρInteriorEq T hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- Deleting one point from each retained exact-four class destroys every K4
at the first apex.  Alignment is essential here: it rules out an unnamed
radius appearing after the deletion. -/
private theorem crossRetainedEndpoints_doubleDeletion_obstructsFirstApex
    (haligned :
      FirstCapMultiPointRadiiRetained
        (S := S) (radius := radius) (ρ := ρ))
    {x y : ℝ²}
    (hx : x ∈ SelectedClass D.A S.oppApex1 radius)
    (hy : y ∈ SelectedClass D.A S.oppApex1 ρ) :
    ¬ HasNEquidistantPointsAt 4
      ((D.A.erase x).erase y) S.oppApex1 := by
  intro hsurvives
  rcases exists_selectedClass_card_ge_of_hasNEquidistantPointsAt
      hsurvives with
    ⟨r, hr, hfourErase⟩
  have hfourFull :
      4 ≤ (SelectedClass D.A S.oppApex1 r).card := by
    refine hfourErase.trans (Finset.card_le_card ?_)
    intro z hz
    rcases mem_selectedClass.mp hz with ⟨hzErase, hzdist⟩
    exact mem_selectedClass.mpr
      ⟨Finset.mem_of_mem_erase (Finset.mem_of_mem_erase hzErase), hzdist⟩
  rcases
      firstApex_K4Radius_eq_retained_of_aligned
        haligned hr hfourFull with
    hradius | hρ
  · rw [hradius, selectedClass_erase_eq, selectedClass_erase_eq] at hfourErase
    have hle :
        (((SelectedClass D.A S.oppApex1 radius).erase x).erase y).card ≤
          ((SelectedClass D.A S.oppApex1 radius).erase x).card :=
      Finset.card_le_card (Finset.erase_subset _ _)
    rw [Finset.card_erase_of_mem hx, hfrontierFour] at hle
    omega
  · rw [hρ, selectedClass_erase_eq, selectedClass_erase_eq] at hfourErase
    have hsub :
        ((SelectedClass D.A S.oppApex1 ρ).erase x).erase y ⊆
          (SelectedClass D.A S.oppApex1 ρ).erase y := by
      intro z hz
      simp only [Finset.mem_erase] at hz ⊢
      exact ⟨hz.1, hz.2.2⟩
    have hle := Finset.card_le_card hsub
    rw [Finset.card_erase_of_mem hy, hρfour] at hle
    omega

omit hρne T hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- The cap-source row omits one endpoint from each retained collision pair.
Deleting those two omitted endpoints therefore preserves the source row, while
alignment makes the same deletion fatal at the first apex. -/
theorem exists_crossRetainedEndpoints_sourceSurvives_doubleDeletion
    (source : CriticalShellSystem.CarrierVertex D.A)
    (hsource : FirstFiberCapSourceWitness P Pρ source)
    (haligned :
      FirstCapMultiPointRadiiRetained
        (S := S) (radius := radius) (ρ := ρ)) :
    ∃ x y : ℝ²,
      x ∈ ({P.source₁, P.source₂} : Finset ℝ²) ∧
      y ∈ ({Pρ.source₁, Pρ.source₂} : Finset ℝ²) ∧
      x ∉
        (H.selectedAt source.1 source.2).toCriticalFourShell.support ∧
      y ∉
        (H.selectedAt source.1 source.2).toCriticalFourShell.support ∧
      HasNEquidistantPointsAt 4
        ((D.A.erase x).erase y) (H.centerAt source.1 source.2) ∧
      ¬ HasNEquidistantPointsAt 4
        ((D.A.erase x).erase y) S.oppApex1 := by
  classical
  rcases hsource with
    ⟨_, _, _, _, _, _, _, _, _, hfirstView, hsecondView⟩
  have hfirstOmitted :
      ∃ x : ℝ²,
        x ∈ ({P.source₁, P.source₂} : Finset ℝ²) ∧
        x ∉
          (H.selectedAt source.1 source.2).toCriticalFourShell.support := by
    rcases hfirstView.omits with hx | hx
    · exact ⟨P.source₁, by simp, hx⟩
    · exact ⟨P.source₂, by simp, hx⟩
  have hsecondOmitted :
      ∃ y : ℝ²,
        y ∈ ({Pρ.source₁, Pρ.source₂} : Finset ℝ²) ∧
        y ∉
          (H.selectedAt source.1 source.2).toCriticalFourShell.support := by
    rcases hsecondView.omits with hy | hy
    · exact ⟨Pρ.source₁, by simp, hy⟩
    · exact ⟨Pρ.source₂, by simp, hy⟩
  rcases hfirstOmitted with ⟨x, hxPair, hxOmitted⟩
  rcases hsecondOmitted with ⟨y, hyPair, hyOmitted⟩
  have hxSelected :
      x ∈ SelectedClass D.A S.oppApex1 radius := by
    have hxIntersection :
        x ∈
          SelectedClass D.A S.oppApex1 radius ∩
            S.capInteriorByIndex S.oppIndex1 := by
      rw [hfrontierInteriorEq]
      exact hxPair
    exact (Finset.mem_inter.mp hxIntersection).1
  have hySelected :
      y ∈ SelectedClass D.A S.oppApex1 ρ := by
    have hyIntersection :
        y ∈
          SelectedClass D.A S.oppApex1 ρ ∩
            S.capInteriorByIndex S.oppIndex1 := by
      rw [hρInteriorEq]
      exact hyPair
    exact (Finset.mem_inter.mp hyIntersection).1
  let K :=
    (H.selectedAt source.1 source.2).toCriticalFourShell
  have hclassEq :
      SelectedClass D.A (H.centerAt source.1 source.2) K.radius =
        K.support := by
    simpa [SelectedClass, K] using K.support_eq.symm
  have hsourceSurvives :
      HasNEquidistantPointsAt 4
        ((D.A.erase x).erase y) (H.centerAt source.1 source.2) := by
    have hxOmittedK : x ∉ K.support := by
      simpa [K] using hxOmitted
    have hyOmittedK : y ∉ K.support := by
      simpa [K] using hyOmitted
    refine ⟨K.radius, K.radius_pos, ?_⟩
    change
      4 ≤
        (SelectedClass ((D.A.erase x).erase y)
          (H.centerAt source.1 source.2) K.radius).card
    rw [selectedClass_erase_eq, selectedClass_erase_eq, hclassEq]
    rw [Finset.erase_eq_of_notMem hxOmittedK,
      Finset.erase_eq_of_notMem hyOmittedK]
    exact K.support_card.ge
  exact
    ⟨x, y, hxPair, hyPair, hxOmitted, hyOmitted, hsourceSurvives,
      crossRetainedEndpoints_doubleDeletion_obstructsFirstApex
        (hfrontierFour := hfrontierFour) (hρfour := hρfour)
        haligned hxSelected hySelected⟩

omit hρne hfrontierFour hρfour hfrontierInteriorEq hρInteriorEq
  T hblockersNe LPρ hLPρ MPρ LP hLP MP in
/-- The second collision row has two points outside the first cap.  Since its
center cannot bisect the two named outside points of the first collision row,
at least one of its outside points is genuinely new. -/
private theorem exists_secondRowOutsidePoint_ne_firstOutsidePair
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (hsecondNe :
      dist (H.centerAt Pρ.source₁ Pρ.source₁_mem_A) Q.source.1 ≠
        dist (H.centerAt Pρ.source₁ Pρ.source₁_mem_A)
          Q.otherOutsidePoint) :
    ∃ z : ℝ²,
      z ∈
          (H.selectedAt Pρ.source₁
            Pρ.source₁_mem_A).toCriticalFourShell.support ∧
        z ∉ S.capByIndex S.oppIndex1 ∧
        z ≠ Q.source.1 ∧
        z ≠ Q.otherOutsidePoint := by
  classical
  let K :=
    (H.selectedAt Pρ.source₁
      Pρ.source₁_mem_A).toCriticalFourShell.support \
        S.capByIndex S.oppIndex1
  have houtsideCard : K.card = 2 := by
    rcases
        exact_disjoint_cap_pairs_force_cross_omission_and_two_outside
          (H.selectedAt P.source₁
            P.source₁_mem_A).toCriticalFourShell.support_card
          (H.selectedAt Pρ.source₁
            Pρ.source₁_mem_A).toCriticalFourShell.support_card
          P.shell_inter_cap_eq_sources Pρ.shell_inter_cap_eq_sources
          P.sources_ne Pρ.sources_ne hpairsDisjoint with
      ⟨_, _, _, _, _, hcard⟩
    exact hcard
  by_cases hsub :
      K ⊆ ({Q.source.1, Q.otherOutsidePoint} : Finset ℝ²)
  · have hK :
        K = ({Q.source.1, Q.otherOutsidePoint} : Finset ℝ²) := by
      apply Finset.eq_of_subset_of_card_le hsub
      rw [houtsideCard]
      exact Finset.card_le_two
    have hsourceMem :
        Q.source.1 ∈
          (H.selectedAt Pρ.source₁
            Pρ.source₁_mem_A).toCriticalFourShell.support := by
      have :
          Q.source.1 ∈ K := by
        rw [hK]
        simp
      exact (Finset.mem_sdiff.mp this).1
    have hotherMem :
        Q.otherOutsidePoint ∈
          (H.selectedAt Pρ.source₁
            Pρ.source₁_mem_A).toCriticalFourShell.support := by
      have :
          Q.otherOutsidePoint ∈ K := by
        rw [hK]
        simp
      exact (Finset.mem_sdiff.mp this).1
    exact
      (hsecondNe
        (((H.selectedAt Pρ.source₁
              Pρ.source₁_mem_A).toCriticalFourShell.support_eq_radius
            Q.source.1 hsourceMem).trans
          ((H.selectedAt Pρ.source₁
              Pρ.source₁_mem_A).toCriticalFourShell.support_eq_radius
            Q.otherOutsidePoint hotherMem).symm)).elim
  · rw [Finset.not_subset] at hsub
    rcases hsub with ⟨z, hzK, hzPair⟩
    have hz := Finset.mem_sdiff.mp hzK
    refine ⟨z, hz.1, hz.2, ?_, ?_⟩
    · intro h
      subst z
      exact hzPair (by simp)
    · intro h
      subst z
      exact hzPair (by simp)

omit hfrontierFour hρfour hpairsDisjoint hblockersNe
  LPρ hLPρ MPρ LP hLP MP in
/-- One deletion from each retained first-apex row is a genuine two-source
minimal deletion core at the first apex.  The double deletion is blocking,
while tri-apex richness restores a K4 after either source is put back. -/
theorem firstApex_minimalDeletionCore_of_crossRetainedEndpoints
    {x y : ℝ²}
    (hxPair : x ∈ ({P.source₁, P.source₂} : Finset ℝ²))
    (hyPair : y ∈ ({Pρ.source₁, Pρ.source₂} : Finset ℝ²))
    (hblocked :
      ¬ HasNEquidistantPointsAt 4
        ((D.A.erase x).erase y) S.oppApex1) :
    Nonempty
      (ATAILStageOneMinimalDeletionCore.MinimalDeletionCore
        D.A {x, y} S.oppApex1) := by
  classical
  have hxIntersection :
      x ∈
        SelectedClass D.A S.oppApex1 radius ∩
          S.capInteriorByIndex S.oppIndex1 := by
    rw [hfrontierInteriorEq]
    exact hxPair
  have hyIntersection :
      y ∈
        SelectedClass D.A S.oppApex1 ρ ∩
          S.capInteriorByIndex S.oppIndex1 := by
    rw [hρInteriorEq]
    exact hyPair
  have hxSelected :
      x ∈ SelectedClass D.A S.oppApex1 radius :=
    (Finset.mem_inter.mp hxIntersection).1
  have hySelected :
      y ∈ SelectedClass D.A S.oppApex1 ρ :=
    (Finset.mem_inter.mp hyIntersection).1
  have hxA : x ∈ D.A := (mem_selectedClass.mp hxSelected).1
  have hyA : y ∈ D.A := (mem_selectedClass.mp hySelected).1
  have hxDist : dist S.oppApex1 x = radius :=
    (mem_selectedClass.mp hxSelected).2
  have hyDist : dist S.oppApex1 y = ρ :=
    (mem_selectedClass.mp hySelected).2
  have hxy : x ≠ y := by
    intro h
    apply hρne
    calc
      ρ = dist S.oppApex1 y := hyDist.symm
      _ = dist S.oppApex1 x := by rw [h]
      _ = radius := hxDist
  apply ATAILStageOneMinimalDeletionCore.exists_minimalDeletionCore
  · intro z hz
    simp only [Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with rfl | rfl
    · exact hxA
    · exact hyA
  · simpa using S.oppositeVertexByIndex_mem S.oppIndex1
  · intro s hs t ht hst
    simp only [Finset.mem_insert, Finset.mem_singleton] at hs ht
    rcases hs with rfl | rfl <;> rcases ht with rfl | rfl
    · exact (hst rfl).elim
    · simpa [hxDist, hyDist] using hρne.symm
    · simpa [hxDist, hyDist] using hρne
    · exact (hst rfl).elim
  · have hsdiff :
        D.A \ ({x, y} : Finset ℝ²) = (D.A.erase x).erase y := by
      ext w
      simp [and_assoc, and_left_comm, and_comm]
    simpa [hsdiff] using hblocked
  · intro s hs
    have hrobust :
        FullyDeletionRobustAt D S.oppApex1 :=
      fullyDeletionRobustAt_of_apexRichClassStructure T.oppApex1_rich
    rcases Finset.mem_insert.mp hs with rfl | hs
    · simpa [Finset.sdiff_singleton_eq_erase, hxy] using
        hrobust.survives y hyA
    · have hsEq : s = y := Finset.mem_singleton.mp hs
      subst s
      have herase :
          ({x, y} : Finset ℝ²).erase y = {x} := by
        ext w
        simp only [Finset.mem_erase, Finset.mem_insert,
          Finset.mem_singleton]
        constructor
        · rintro ⟨hwy, hwx | hwy'⟩
          · exact hwx
          · exact (hwy hwy').elim
        · intro hwx
          subst w
          exact ⟨hxy, Or.inl rfl⟩
      rw [herase, Finset.sdiff_singleton_eq_erase]
      exact hrobust.survives x hxA


end
end TwoSourceExactCollisionRowsTerminal
end ATailFrontierLiveClosure
end Problem97
