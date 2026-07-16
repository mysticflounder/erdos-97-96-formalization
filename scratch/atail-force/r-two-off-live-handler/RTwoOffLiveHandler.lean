/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import OriginTaggedCoordinator
import F2SecondApexRadiusTransport
import DeletedApexOmissionProducer

/-!
# Scratch: origin-aware handler for the aligned two-off-live branch

The existing aligned branch exposes either another common-deletion packet or
an `AlignedPrescribedCriticalPair` at the second center.  That disjunction
forgets two facts used to construct its pair arm: both prescribed sources were
chosen outside the live dangerous row, and hence both lie in the retained
second row.

This file reconstructs the split from the original cardinality hypothesis and
keeps those facts.  On the successor arm it also records the exact
second-center radius dichotomy:

* the successor reuses the old radius, in which case the deleted source is a
  fifth ambient point on that radius; or
* the successor uses a different radius, in which case its selected support is
  disjoint from the retained second row.

The origin tag is retained unchanged.  No recursive or well-foundedness claim
is made.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRTwoOffLiveHandlerScratch

open ATAILStageOnePrescribedApexDichotomy
open ATailCommonDeletionCriticalExpansionScratch
open ATailContinuationBankMatchScratch
open ATailCriticalPairFrontier
open ATailRFailureProfilesParentLiftScratch
open ATailRF2SecondApexRadiusTransportScratch
open ATailRFullParentEntryScratch
open ATailRLiveCommonDeletionExpansionScratch
open ATailROriginTaggedCoordinatorScratch
open ATailRParentDangerousRowCouplingScratch
open ATailRReciprocalSwapReductionScratch

attribute [local instance] Classical.propDecidable

/-- A fresh source outside the live dangerous row.  Since the first exact row
is that live row, the source necessarily belongs to the retained second row. -/
structure OffLiveSecondRowFreshSource
    {D : CounterexampleData} {p q t1 t2 t3 center₂ deleted : ℝ²}
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3)
    (C : CommonDeletionTwoCenterPacket D W.H deleted p center₂) : Type where
  source : FreshCriticalSource C
  not_mem_live :
    source.point ∉ ({q, t1, t2, t3} : Finset ℝ²)
  mem_secondRow :
    source.point ∈ C.B₂

/-- Recover the retained-second-row membership erased by the generic
`FreshCriticalSource` interface. -/
def OffLiveSecondRowFreshSource.ofFresh
    {D : CounterexampleData} {p q t1 t2 t3 center₂ deleted : ℝ²}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {C : CommonDeletionTwoCenterPacket D W.H deleted p center₂}
    (X : FreshCriticalSource C)
    (hXOff : X.point ∉ ({q, t1, t2, t3} : Finset ℝ²)) :
    OffLiveSecondRowFreshSource W C where
  source := X
  not_mem_live := hXOff
  mem_secondRow := by
    rcases Finset.mem_union.mp X.mem_rows with hfirst | hsecond
    · apply False.elim
      apply hXOff
      rw [← commonDeletion_firstRow_eq_liveBase C]
      exact hfirst
    · exact hsecond

/-- The exact second-center distinction carried by a fresh successor.
Equal radii force a fifth ambient point; unequal radii force disjoint selected
supports. -/
inductive SuccessorSecondApexShape
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {deleted next center₁ center₂ : ℝ²}
    (C : CommonDeletionTwoCenterPacket D H deleted center₁ center₂)
    (G : CommonDeletionTwoCenterPacket D H next center₁ center₂) : Prop
  | sameRadiusOverflow
      (radius_eq : G.row₂.radius = C.row₂.radius)
      (five_on_radius :
        5 ≤ (SelectedClass D.A center₂ G.row₂.radius).card)
  | alternateRadius
      (radius_ne : G.row₂.radius ≠ C.row₂.radius)
      (supports_disjoint : Disjoint C.B₂ G.B₂)

/-- A successor with its source role and its non-recursive second-apex shape
retained. -/
structure OffLiveCommonDeletionSuccessor
    {D : CounterexampleData} {p q t1 t2 t3 center₂ deleted : ℝ²}
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3)
    (C : CommonDeletionTwoCenterPacket D W.H deleted p center₂) : Type where
  source : OffLiveSecondRowFreshSource W C
  packet :
    CommonDeletionTwoCenterPacket D W.H source.source.point p center₂
  secondApexShape : SuccessorSecondApexShape C packet

/-- A center at which deleting any carrier source still leaves a K4
witness. -/
structure FullyDeletionRobustAt
    (D : CounterexampleData) (center : ℝ²) : Prop where
  survives :
    ∀ z : ℝ², z ∈ D.A →
      HasNEquidistantPointsAt 4 (D.A.erase z) center

/-- The exact one-field negation of full deletion robustness. -/
def HasCriticalDeletionAt
    (D : CounterexampleData) (center : ℝ²) : Prop :=
  ∃ z : ℝ², ∃ _hzA : z ∈ D.A,
    ¬ HasNEquidistantPointsAt 4 (D.A.erase z) center

/-- A selected four-row survives erasing any point outside its support. -/
theorem selectedFourClass_survives_erase_of_not_mem
    {A : Finset ℝ²} {center z : ℝ²}
    (K : SelectedFourClass A center)
    (hz : z ∉ K.support) :
    HasNEquidistantPointsAt 4 (A.erase z) center := by
  refine ⟨K.radius, K.radius_pos, ?_⟩
  calc
    4 = K.support.card := K.support_card.symm
    _ ≤ ((A.erase z).filter
        fun x => dist center x = K.radius).card := by
      apply Finset.card_le_card
      intro x hx
      exact Finset.mem_filter.mpr
        ⟨Finset.mem_erase.mpr
            ⟨fun hxz => hz (hxz ▸ hx), K.support_subset_A hx⟩,
          K.support_eq_radius x hx⟩

/-- A five-point radius class makes its center robust under every single
carrier deletion. -/
theorem fullyDeletionRobustAt_of_five_le_selectedClass
    {D : CounterexampleData} {center : ℝ²} {radius : ℝ}
    (hradius : 0 < radius)
    (hfive : 5 ≤ (SelectedClass D.A center radius).card) :
    FullyDeletionRobustAt D center where
  survives := by
    intro z _hzA
    refine ⟨radius, hradius, ?_⟩
    have hfour :
        4 ≤ (SelectedClass (D.A.erase z) center radius).card :=
      selectedClass_erase_card_ge_of_succ_le
        (A := D.A) (x := z) (s := center) (d := radius)
        (n := 4) hfive
    simpa [SelectedClass] using hfour

/-- Two support-disjoint selected four-rows at one center also make that
center robust under every single deletion: any source can hit at most one of
the two rows. -/
theorem fullyDeletionRobustAt_of_two_disjoint_selectedFourClasses
    {D : CounterexampleData} {center : ℝ²}
    (K L : SelectedFourClass D.A center)
    (hdisjoint : Disjoint K.support L.support) :
    FullyDeletionRobustAt D center where
  survives := by
    intro z _hzA
    by_cases hzK : z ∈ K.support
    · apply selectedFourClass_survives_erase_of_not_mem L
      intro hzL
      exact Finset.disjoint_left.mp hdisjoint hzK hzL
    · exact selectedFourClass_survives_erase_of_not_mem K hzK

/-- Refine an exact fresh successor by comparing its second-apex row with the
retained second row. -/
def OffLiveCommonDeletionSuccessor.ofPacket
    {D : CounterexampleData} {p q t1 t2 t3 center₂ deleted : ℝ²}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {C : CommonDeletionTwoCenterPacket D W.H deleted p center₂}
    (X : OffLiveSecondRowFreshSource W C)
    (G : CommonDeletionTwoCenterPacket
      D W.H X.source.point p center₂) :
    OffLiveCommonDeletionSuccessor W C where
  source := X
  packet := G
  secondApexShape := by
    let K :=
      Problem97.ATailRFailureProfilesParentLiftScratch.CommonDeletionTwoCenterPacket.secondRowSelectedFourClass C
    let L :=
      Problem97.ATailRFailureProfilesParentLiftScratch.CommonDeletionTwoCenterPacket.secondRowSelectedFourClass G
    by_cases hradius : G.row₂.radius = C.row₂.radius
    · apply SuccessorSecondApexShape.sameRadiusOverflow hradius
      apply five_le_selectedClass_of_selectedFourClass_and_extra
        L (by
          intro z hz
          exact L.support_subset_A hz)
        X.source.mem_A
        (by
          simpa [L] using G.row₂.q_not_mem)
      calc
        dist center₂ X.source.point = C.row₂.radius :=
          C.row₂.same_radius X.source.point X.mem_secondRow
        _ = G.row₂.radius := hradius.symm
    · apply SuccessorSecondApexShape.alternateRadius hradius
      rcases sameCenter_radius_eq_or_support_disjoint K L with
        heq | hdisjoint
      · exact False.elim (hradius heq.symm)
      · simpa [K, L] using hdisjoint

/-- Both exact radius arms of the successor imply the same strong geometric
normal form: the second center survives every single carrier deletion. -/
theorem OffLiveCommonDeletionSuccessor.secondApexFullyDeletionRobust
    {D : CounterexampleData} {p q t1 t2 t3 center₂ deleted : ℝ²}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {C : CommonDeletionTwoCenterPacket D W.H deleted p center₂}
    (N : OffLiveCommonDeletionSuccessor W C) :
    FullyDeletionRobustAt D center₂ := by
  rcases N.secondApexShape with
    ⟨_radiusEq, hfive⟩ | ⟨_radiusNe, hdisjoint⟩
  · exact fullyDeletionRobustAt_of_five_le_selectedClass
      N.packet.row₂.radius_pos hfive
  · let K :=
      Problem97.ATailRFailureProfilesParentLiftScratch.CommonDeletionTwoCenterPacket.secondRowSelectedFourClass C
    let L :=
      Problem97.ATailRFailureProfilesParentLiftScratch.CommonDeletionTwoCenterPacket.secondRowSelectedFourClass N.packet
    apply fullyDeletionRobustAt_of_two_disjoint_selectedFourClasses K L
    simpa [K, L] using hdisjoint

/-- The smallest source-clean successor eliminator: one genuinely critical
deletion at the second center contradicts either exact successor arm. -/
theorem false_of_offLiveCommonDeletionSuccessor_and_criticalDeletion
    {D : CounterexampleData} {p q t1 t2 t3 center₂ deleted : ℝ²}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {C : CommonDeletionTwoCenterPacket D W.H deleted p center₂}
    (N : OffLiveCommonDeletionSuccessor W C)
    (hcritical : HasCriticalDeletionAt D center₂) :
    False := by
  rcases hcritical with ⟨z, hzA, hblocked⟩
  exact hblocked (N.secondApexFullyDeletionRobust.survives z hzA)

/-- Equivalent fixed-map reading: a fully robust center cannot occur in the
image of any legal `CriticalShellSystem`. -/
theorem FullyDeletionRobustAt.centerAt_ne
    {D : CounterexampleData} {center : ℝ²}
    (R : FullyDeletionRobustAt D center)
    (H : CriticalShellSystem D.A)
    (z : ℝ²) (hzA : z ∈ D.A) :
    H.centerAt z hzA ≠ center := by
  intro hcenter
  apply H.no_qfree_at z hzA
  rw [hcenter]
  exact R.survives z hzA

/-- The source-faithful second-center pair.  The two off-live facts are not
fields of `AlignedPrescribedCriticalPair`, so they must be retained beside the
existing pair. -/
structure OffLiveSecondCenterCriticalPair
    {D : CounterexampleData} {p q t1 t2 t3 center₂ deleted : ℝ²}
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3)
    (C : CommonDeletionTwoCenterPacket D W.H deleted p center₂) : Type where
  pair : AlignedPrescribedCriticalPair C (1 : Fin 2)
  first_not_mem_live :
    pair.first.point ∉ ({q, t1, t2, t3} : Finset ℝ²)
  second_not_mem_live :
    pair.second.point ∉ ({q, t1, t2, t3} : Finset ℝ²)
  first_mem_secondRow :
    pair.first.point ∈ C.B₂
  second_mem_secondRow :
    pair.second.point ∈ C.B₂

/-- Away from the two prescribed sources, installing the second-center pair
leaves the chosen blocker center unchanged. -/
theorem OffLiveSecondCenterCriticalPair.installedSystem_centerAt_of_ne
    {D : CounterexampleData} {p q t1 t2 t3 center₂ deleted z : ℝ²}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {C : CommonDeletionTwoCenterPacket D W.H deleted p center₂}
    (P : OffLiveSecondCenterCriticalPair W C)
    (hzA : z ∈ D.A)
    (hzFirst : z ≠ P.pair.first.point)
    (hzSecond : z ≠ P.pair.second.point) :
    P.pair.installedSystem.centerAt z hzA =
      W.H.centerAt z hzA := by
  calc
    P.pair.installedSystem.centerAt z hzA =
        (W.H.overrideAt P.pair.firstCritical.shell
          P.pair.firstCritical.blocks).centerAt z hzA := by
      exact CriticalShellSystem.overrideAt_centerAt_of_ne
        _ P.pair.secondCritical.shell P.pair.secondCritical.blocks
        hzA hzSecond
    _ = W.H.centerAt z hzA := by
      exact CriticalShellSystem.overrideAt_centerAt_of_ne
        W.H P.pair.firstCritical.shell P.pair.firstCritical.blocks
        hzA hzFirst

/-- Away from the two prescribed sources, installing the pair also leaves the
full chosen critical support unchanged. -/
theorem OffLiveSecondCenterCriticalPair.installedSystem_selectedAt_support_of_ne
    {D : CounterexampleData} {p q t1 t2 t3 center₂ deleted z : ℝ²}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {C : CommonDeletionTwoCenterPacket D W.H deleted p center₂}
    (P : OffLiveSecondCenterCriticalPair W C)
    (hzA : z ∈ D.A)
    (hzFirst : z ≠ P.pair.first.point)
    (hzSecond : z ≠ P.pair.second.point) :
    (P.pair.installedSystem.selectedAt z hzA).toCriticalFourShell.support =
      (W.H.selectedAt z hzA).toCriticalFourShell.support := by
  simp only [
    AlignedPrescribedCriticalPair.installedSystem,
    CriticalShellSystem.selectedAt,
    CriticalShellSystem.centerAt,
    CriticalShellSystem.overrideAt,
    Fin.isValue]
  rw [dif_neg hzSecond, dif_neg hzFirst]

/-- The late pair installation preserves the complete live dangerous system,
not merely its center labels.  Thus the second-center critical pair remains
coupled to the same exact live row. -/
noncomputable def OffLiveSecondCenterCriticalPair.installedLiveSystem
    {D : CounterexampleData} {p q t1 t2 t3 center₂ deleted : ℝ²}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {C : CommonDeletionTwoCenterPacket D W.H deleted p center₂}
    (P : OffLiveSecondCenterCriticalPair W C) :
    LiveDangerousRetainingSystem D p q t1 t2 t3 where
  H := P.pair.installedSystem
  liveRow := W.liveRow
  liveRow_support := W.liveRow_support
  liveRow_blocks := W.liveRow_blocks
  centerAt_eq_p_iff := by
    intro z hzA
    constructor
    · intro hcenter
      by_cases hzFirst : z = P.pair.first.point
      · subst z
        have hfirst :
            P.pair.installedSystem.centerAt
                P.pair.first.point hzA = center₂ := by
          simpa using P.pair.installedSystem_centerAt_first
        exact False.elim
          (C.centers_ne (hcenter.symm.trans hfirst))
      · by_cases hzSecond : z = P.pair.second.point
        · subst z
          have hsecond :
              P.pair.installedSystem.centerAt
                  P.pair.second.point hzA = center₂ := by
            simpa using P.pair.installedSystem_centerAt_second
          exact False.elim
            (C.centers_ne (hcenter.symm.trans hsecond))
        · apply (W.centerAt_eq_p_iff z hzA).1
          rw [← P.installedSystem_centerAt_of_ne hzA hzFirst hzSecond]
          exact hcenter
    · intro hzLive
      have hzFirst : z ≠ P.pair.first.point := by
        intro hz
        exact P.first_not_mem_live (hz ▸ hzLive)
      have hzSecond : z ≠ P.pair.second.point := by
        intro hz
        exact P.second_not_mem_live (hz ▸ hzLive)
      rw [P.installedSystem_centerAt_of_ne hzA hzFirst hzSecond]
      exact (W.centerAt_eq_p_iff z hzA).2 hzLive
  selectedAt_support := by
    intro z hzA hzLive
    have hzFirst : z ≠ P.pair.first.point := by
      intro hz
      exact P.first_not_mem_live (hz ▸ hzLive)
    have hzSecond : z ≠ P.pair.second.point := by
      intro hz
      exact P.second_not_mem_live (hz ▸ hzLive)
    rw [P.installedSystem_selectedAt_support_of_ne
      hzA hzFirst hzSecond]
    exact W.selectedAt_support z hzA hzLive

/-- The exact unique-radius terminal forced by deletion-criticality at either
member of the second-center pair. -/
structure SecondCenterExactUniqueRadius
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {deleted center₁ center₂ : ℝ²}
    (C : CommonDeletionTwoCenterPacket D H deleted center₁ center₂) :
    Type where
  radius : ℝ
  radius_pos : 0 < radius
  selectedClass_eq_secondRow :
    SelectedClass D.A center₂ radius = C.B₂
  selectedClass_card_eq_four :
    (SelectedClass D.A center₂ radius).card = 4
  unique_K4_radius :
    ∀ rho : ℝ, 0 < rho →
      4 ≤ (SelectedClass D.A center₂ rho).card →
      rho = radius

/-- A source-faithful second-center aligned pair is already the exact
card-four, unique-K4-radius terminal at that center. -/
noncomputable def OffLiveSecondCenterCriticalPair.secondCenterExactUniqueRadius
    {D : CounterexampleData} {p q t1 t2 t3 center₂ deleted : ℝ²}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {C : CommonDeletionTwoCenterPacket D W.H deleted p center₂}
    (P : OffLiveSecondCenterCriticalPair W C) :
    SecondCenterExactUniqueRadius C := by
  let R := P.pair.firstCritical.shell.toCriticalFourShell
  have hsupport : R.support = C.B₂ := by
    simpa [R] using P.pair.support_eq_prescribed_row
  have hfull :
      R.support = SelectedClass D.A center₂ R.radius := by
    simpa [R, SelectedClass] using R.support_eq
  refine {
    radius := R.radius
    radius_pos := R.radius_pos
    selectedClass_eq_secondRow := hfull.symm.trans hsupport
    selectedClass_card_eq_four := by
      rw [hfull.symm.trans hsupport, C.B₂_card]
    unique_K4_radius := ?_ }
  intro rho hrho hfour
  rcases
      Problem97.ATailDeletedApexOmissionProducerScratch.exists_selectedFourClass_at_radius_of_four_le_selectedClass
        hrho hfour with
    ⟨K, hKradius⟩
  by_contra hrhoNe
  apply P.pair.firstCritical.blocks
  have hsourceNot : P.pair.first.point ∉ K.support := by
    intro hsource
    apply hrhoNe
    calc
      rho = K.radius := hKradius.symm
      _ = dist center₂ P.pair.first.point :=
        (K.support_eq_radius P.pair.first.point hsource).symm
      _ = R.radius := by
        simpa [R] using
          (P.pair.firstCritical.shell.toCriticalFourShell
            ).support_eq_radius P.pair.first.point
              (P.pair.firstCritical.shell.toCriticalFourShell
                ).q_mem_support
  refine ⟨K.radius, K.radius_pos, ?_⟩
  calc
    4 = K.support.card := K.support_card.symm
    _ ≤ ((D.A.erase P.pair.first.point).filter
        fun z => dist center₂ z = K.radius).card := by
      apply Finset.card_le_card
      intro z hz
      exact Finset.mem_filter.mpr
        ⟨Finset.mem_erase.mpr
            ⟨fun hzSource => hsourceNot (hzSource ▸ hz),
              K.support_subset_A hz⟩,
          K.support_eq_radius z hz⟩

/-- The existing reciprocal-swap consumer needs only one prescribed critical
shell at the physical second apex.  Hence the aligned pair arm immediately
reorients to the already-displayed swapped `FA-UNIQ4` frontier. -/
theorem OffLiveSecondCenterCriticalPair.reorients_to_swappedFirstApexUniqueFour
    {D : CounterexampleData}
    {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 deleted : ℝ²}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {C : CommonDeletionTwoCenterPacket
      D W.H deleted p S.oppApex2}
    (P : OffLiveSecondCenterCriticalPair W C) :
    Nonempty (SwappedFirstApexUniqueFourFrontier D S W.H) := by
  apply secondApexCritical_reorients_to_firstApexUniqueFour
  · simpa using P.pair.firstCritical.shell
  · simpa using P.pair.firstCritical.blocks

/-- The corrected theorem-facing output of the positive aligned branch. -/
inductive TwoOffLiveHandlerOutcome
    {D : CounterexampleData} {p q t1 t2 t3 : ℝ²}
    (S : SurplusCapPacket D.A)
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3)
    {deleted : ℝ²}
    (C : CommonDeletionTwoCenterPacket
      D W.H deleted p S.oppApex2) : Type
  | successor
      (next : OffLiveCommonDeletionSuccessor W C) :
      TwoOffLiveHandlerOutcome S W C
  | alignedPair
      (critical : OffLiveSecondCenterCriticalPair W C) :
      TwoOffLiveHandlerOutcome S W C

/-- The pair arm has an existing terminal consumer, so only the
radius-classified successor remains as a new mathematical residual. -/
inductive TwoOffLiveReducedOutcome
    {D : CounterexampleData} {p q t1 t2 t3 : ℝ²}
    (S : SurplusCapPacket D.A)
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3)
    {deleted : ℝ²}
    (C : CommonDeletionTwoCenterPacket
      D W.H deleted p S.oppApex2) : Type
  | successor
      (next : OffLiveCommonDeletionSuccessor W C) :
      TwoOffLiveReducedOutcome S W C
  | swappedFirstApexUniqueFour
      (terminal : SwappedFirstApexUniqueFourFrontier D S W.H) :
      TwoOffLiveReducedOutcome S W C

/-- Reconstruct the positive split without discarding the off-live source
roles. -/
theorem nonempty_twoOffLiveHandlerOutcome
    {D : CounterexampleData} {p q t1 t2 t3 deleted : ℝ²}
    (S : SurplusCapPacket D.A)
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3)
    (C : CommonDeletionTwoCenterPacket
      D W.H deleted p S.oppApex2)
    (htwo :
      2 ≤ ((((C.B₁ ∪ C.B₂) \ deletedCriticalSupport C) \
        ({q, t1, t2, t3} : Finset ℝ²))).card) :
    Nonempty (TwoOffLiveHandlerOutcome S W C) := by
  have hone :
      1 < ((((C.B₁ ∪ C.B₂) \ deletedCriticalSupport C) \
        ({q, t1, t2, t3} : Finset ℝ²))).card := by
    omega
  rcases Finset.one_lt_card.mp hone with ⟨a, ha, b, hb, hab⟩
  rcases Finset.mem_sdiff.mp ha with ⟨haFresh, haOffLive⟩
  rcases Finset.mem_sdiff.mp hb with ⟨hbFresh, hbOffLive⟩
  rcases Finset.mem_sdiff.mp haFresh with ⟨haRows, haOutside⟩
  rcases Finset.mem_sdiff.mp hbFresh with ⟨hbRows, hbOutside⟩
  let Xraw := freshCriticalSource_of_mem C haRows haOutside
  let Yraw := freshCriticalSource_of_mem C hbRows hbOutside
  let X : OffLiveSecondRowFreshSource W C :=
    OffLiveSecondRowFreshSource.ofFresh Xraw haOffLive
  let Y : OffLiveSecondRowFreshSource W C :=
    OffLiveSecondRowFreshSource.ofFresh Yraw hbOffLive
  have hXp :
      HasNEquidistantPointsAt 4 (D.A.erase X.source.point) p :=
    deletion_survives_liveFirstCenter_of_not_mem_liveBase W
      X.not_mem_live
  have hYp :
      HasNEquidistantPointsAt 4 (D.A.erase Y.source.point) p :=
    deletion_survives_liveFirstCenter_of_not_mem_liveBase W
      Y.not_mem_live
  rcases erase_survives_or_criticalSelectedFourClass_at
      (q := X.source.point) D.K4 C.center₂_mem_A with
    hXcenter₂ | ⟨KX, hXblocks⟩
  · rcases nonempty_commonDeletionTwoCenterPacket
      W.H X.source.mem_A C.center₁_mem_A C.center₂_mem_A
      C.centers_ne hXp hXcenter₂ with ⟨G⟩
    exact ⟨TwoOffLiveHandlerOutcome.successor
      (OffLiveCommonDeletionSuccessor.ofPacket X G)⟩
  · rcases erase_survives_or_criticalSelectedFourClass_at
        (q := Y.source.point) D.K4 C.center₂_mem_A with
      hYcenter₂ | ⟨KY, hYblocks⟩
    · rcases nonempty_commonDeletionTwoCenterPacket
        W.H Y.source.mem_A C.center₁_mem_A C.center₂_mem_A
        C.centers_ne hYp hYcenter₂ with ⟨G⟩
      exact ⟨TwoOffLiveHandlerOutcome.successor
        (OffLiveCommonDeletionSuccessor.ofPacket Y G)⟩
    · let PX : PrescribedCriticalAt D X.source.point S.oppApex2 :=
        { shell := KX, blocks := hXblocks }
      let PY : PrescribedCriticalAt D Y.source.point S.oppApex2 :=
        { shell := KY, blocks := hYblocks }
      let P : AlignedPrescribedCriticalPair C (1 : Fin 2) :=
        { first := X.source
          second := Y.source
          ne := hab
          firstCritical := by simpa using PX
          secondCritical := by simpa using PY
          supports_eq := by
            simpa using
              prescribedCritical_support_eq_of_common_center PX PY
          support_eq_prescribed_row := by
            simpa using
              prescribedCritical_support_eq_qDeletedRow PX C.row₂ C.B₂_card }
      exact ⟨TwoOffLiveHandlerOutcome.alignedPair {
        pair := P
        first_not_mem_live := by simpa [P] using X.not_mem_live
        second_not_mem_live := by simpa [P] using Y.not_mem_live
        first_mem_secondRow := by simpa [P] using X.mem_secondRow
        second_mem_secondRow := by simpa [P] using Y.mem_secondRow }⟩

/-- Consume the prescribed-pair arm immediately with the existing
second-apex-to-swapped-frontier theorem. -/
theorem nonempty_twoOffLiveReducedOutcome
    {D : CounterexampleData} {p q t1 t2 t3 deleted : ℝ²}
    (S : SurplusCapPacket D.A)
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3)
    (C : CommonDeletionTwoCenterPacket
      D W.H deleted p S.oppApex2)
    (htwo :
      2 ≤ ((((C.B₁ ∪ C.B₂) \ deletedCriticalSupport C) \
        ({q, t1, t2, t3} : Finset ℝ²))).card) :
    Nonempty (TwoOffLiveReducedOutcome S W C) := by
  rcases nonempty_twoOffLiveHandlerOutcome S W C htwo with
    ⟨next | critical⟩
  · exact ⟨TwoOffLiveReducedOutcome.successor next⟩
  · rcases critical.reorients_to_swappedFirstApexUniqueFour
      (S := S) with ⟨terminal⟩
    exact ⟨TwoOffLiveReducedOutcome.swappedFirstApexUniqueFour terminal⟩

/-- Origin-retaining wrapper for the corrected positive output. -/
structure OriginAwareTwoOffLiveHandlerOutcome
    {D : CounterexampleData}
    (S : SurplusCapPacket D.A)
    {p q t1 t2 t3 : ℝ²}
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3)
    {radius : ℝ}
    (F : CriticalPairFrontier D S radius W.H)
    {deleted : ℝ²}
    (C : CommonDeletionTwoCenterPacket
      D W.H deleted p S.oppApex2) : Type where
  origin : RCommonDeletionOrigin S W F deleted p C
  outcome : TwoOffLiveHandlerOutcome S W C

/-- Origin-retaining wrapper after the prescribed-pair arm has been routed to
its existing swapped-frontier consumer. -/
structure OriginAwareTwoOffLiveReducedOutcome
    {D : CounterexampleData}
    (S : SurplusCapPacket D.A)
    {p q t1 t2 t3 : ℝ²}
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3)
    {radius : ℝ}
    (F : CriticalPairFrontier D S radius W.H)
    {deleted : ℝ²}
    (C : CommonDeletionTwoCenterPacket
      D W.H deleted p S.oppApex2) : Type where
  origin : RCommonDeletionOrigin S W F deleted p C
  outcome : TwoOffLiveReducedOutcome S W C

/-- Handler matching the aligned eliminator's `twoOffLive` surface.  The
already-produced lossy continuation is accepted for signature compatibility,
but the stronger result is reconstructed from `htwo`. -/
theorem nonempty_originAwareTwoOffLiveHandlerOutcome
    {D : CounterexampleData}
    {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 : ℝ²}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {radius : ℝ}
    {F : CriticalPairFrontier D S radius W.H}
    {deleted : ℝ²}
    {C : CommonDeletionTwoCenterPacket
      D W.H deleted p S.oppApex2}
    (origin : RCommonDeletionOrigin S W F deleted p C)
    (htwo :
      2 ≤ ((((C.B₁ ∪ C.B₂) \ deletedCriticalSupport C) \
        ({q, t1, t2, t3} : Finset ℝ²))).card)
    (_continuation :
      (∃ X : FreshCriticalSource C,
        X.point ∉ ({q, t1, t2, t3} : Finset ℝ²) ∧
          Nonempty (CommonDeletionTwoCenterPacket
            D W.H X.point p S.oppApex2)) ∨
        Nonempty (AlignedPrescribedCriticalPair C (1 : Fin 2))) :
    Nonempty (OriginAwareTwoOffLiveHandlerOutcome S W F C) := by
  rcases nonempty_twoOffLiveHandlerOutcome S W C htwo with ⟨outcome⟩
  exact ⟨{ origin := origin, outcome := outcome }⟩

/-- Final aligned-handler form: the exact origin survives, the pair arm has
already reached the existing swapped frontier, and the only remaining new
branch is the classified successor. -/
theorem nonempty_originAwareTwoOffLiveReducedOutcome
    {D : CounterexampleData}
    {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 : ℝ²}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {radius : ℝ}
    {F : CriticalPairFrontier D S radius W.H}
    {deleted : ℝ²}
    {C : CommonDeletionTwoCenterPacket
      D W.H deleted p S.oppApex2}
    (origin : RCommonDeletionOrigin S W F deleted p C)
    (htwo :
      2 ≤ ((((C.B₁ ∪ C.B₂) \ deletedCriticalSupport C) \
        ({q, t1, t2, t3} : Finset ℝ²))).card)
    (_continuation :
      (∃ X : FreshCriticalSource C,
        X.point ∉ ({q, t1, t2, t3} : Finset ℝ²) ∧
          Nonempty (CommonDeletionTwoCenterPacket
            D W.H X.point p S.oppApex2)) ∨
        Nonempty (AlignedPrescribedCriticalPair C (1 : Fin 2))) :
    Nonempty (OriginAwareTwoOffLiveReducedOutcome S W F C) := by
  rcases nonempty_twoOffLiveReducedOutcome S W C htwo with ⟨outcome⟩
  exact ⟨{ origin := origin, outcome := outcome }⟩

/-- Motive-valued adapter for wiring this lane into the origin-tagged
coordinator.  The caller now owes only the classified successor handler; the
pair arm is delegated to the coordinator's existing swapped-frontier
handler. -/
theorem originAwareTwoOffLive_goal_of_successor_and_swapped
    {D : CounterexampleData}
    {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 : ℝ²}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {radius : ℝ}
    {F : CriticalPairFrontier D S radius W.H}
    {deleted : ℝ²}
    {C : CommonDeletionTwoCenterPacket
      D W.H deleted p S.oppApex2}
    {Goal : Prop}
    (origin : RCommonDeletionOrigin S W F deleted p C)
    (successorHandler :
      ∀ _next : OffLiveCommonDeletionSuccessor W C, Goal)
    (swappedHandler :
      Nonempty (SwappedFirstApexUniqueFourFrontier D S W.H) → Goal)
    (htwo :
      2 ≤ ((((C.B₁ ∪ C.B₂) \ deletedCriticalSupport C) \
        ({q, t1, t2, t3} : Finset ℝ²))).card)
    (continuation :
      (∃ X : FreshCriticalSource C,
        X.point ∉ ({q, t1, t2, t3} : Finset ℝ²) ∧
          Nonempty (CommonDeletionTwoCenterPacket
            D W.H X.point p S.oppApex2)) ∨
        Nonempty (AlignedPrescribedCriticalPair C (1 : Fin 2))) :
    Goal := by
  rcases nonempty_originAwareTwoOffLiveReducedOutcome
      origin htwo continuation with
    ⟨⟨_origin, next | terminal⟩⟩
  · exact successorHandler next
  · exact swappedHandler ⟨terminal⟩

/-- One critical deletion at the physical second apex closes the remaining
successor while the prescribed-pair arm continues to the existing swapped
frontier.  This exposes the exact single new producer required by the complete
aligned `twoOffLive` handler. -/
theorem originAwareTwoOffLive_goal_of_criticalDeletion_and_swapped
    {D : CounterexampleData}
    {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 : ℝ²}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    {radius : ℝ}
    {F : CriticalPairFrontier D S radius W.H}
    {deleted : ℝ²}
    {C : CommonDeletionTwoCenterPacket
      D W.H deleted p S.oppApex2}
    {Goal : Prop}
    (origin : RCommonDeletionOrigin S W F deleted p C)
    (criticalDeletion : HasCriticalDeletionAt D S.oppApex2)
    (swappedHandler :
      Nonempty (SwappedFirstApexUniqueFourFrontier D S W.H) → Goal)
    (htwo :
      2 ≤ ((((C.B₁ ∪ C.B₂) \ deletedCriticalSupport C) \
        ({q, t1, t2, t3} : Finset ℝ²))).card)
    (continuation :
      (∃ X : FreshCriticalSource C,
        X.point ∉ ({q, t1, t2, t3} : Finset ℝ²) ∧
          Nonempty (CommonDeletionTwoCenterPacket
            D W.H X.point p S.oppApex2)) ∨
        Nonempty (AlignedPrescribedCriticalPair C (1 : Fin 2))) :
    Goal := by
  refine originAwareTwoOffLive_goal_of_successor_and_swapped
    origin (fun next => ?_) swappedHandler htwo continuation
  exact False.elim
    (false_of_offLiveCommonDeletionSuccessor_and_criticalDeletion
      next criticalDeletion)

#print axioms OffLiveSecondRowFreshSource.ofFresh
#print axioms fullyDeletionRobustAt_of_five_le_selectedClass
#print axioms fullyDeletionRobustAt_of_two_disjoint_selectedFourClasses
#print axioms OffLiveCommonDeletionSuccessor.ofPacket
#print axioms OffLiveCommonDeletionSuccessor.secondApexFullyDeletionRobust
#print axioms false_of_offLiveCommonDeletionSuccessor_and_criticalDeletion
#print axioms FullyDeletionRobustAt.centerAt_ne
#print axioms OffLiveSecondCenterCriticalPair.installedLiveSystem
#print axioms OffLiveSecondCenterCriticalPair.secondCenterExactUniqueRadius
#print axioms
  OffLiveSecondCenterCriticalPair.reorients_to_swappedFirstApexUniqueFour
#print axioms nonempty_twoOffLiveHandlerOutcome
#print axioms nonempty_twoOffLiveReducedOutcome
#print axioms nonempty_originAwareTwoOffLiveHandlerOutcome
#print axioms nonempty_originAwareTwoOffLiveReducedOutcome
#print axioms originAwareTwoOffLive_goal_of_successor_and_swapped
#print axioms
  originAwareTwoOffLive_goal_of_criticalDeletion_and_swapped

end ATailRTwoOffLiveHandlerScratch
end Problem97
