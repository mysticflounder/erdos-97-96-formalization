import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.Unique4P4MirrorValuation.MirrorIndexedFamilySatisfaction
import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.PrefixedP4OccurrenceClosures.P4RadiusPartitionOccurrenceBridge.Main
import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.PrefixedP4OccurrenceClosures.P4RowAtLeastFourOccurrenceBridge.Main
import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.Unique4P4PrefixedClosures.P4OccurrenceClosure.CyclicAlternation.Main

/-!
# Core-generic P4 ledger families on the reflected packet

The original occurrence adapters for these three slices quantified over a
direct packet even though their source theorems are stated at the common core.
Here the same authenticated entries are replayed against `mirrorIndex` and the
single reflected total valuation.
-/

namespace Problem97.P4RadiusPartitionOccurrenceBridgeScratch

open ATailCriticalPairFrontier
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourClassCapDistributionScratch
open ATailUniqueFourExactTwoBoundaryScratch
open ATailUniqueFourExactTwoSchemaDecoderScratch
open RetainedKalmansonDecoderScratch
open P4MirrorValuationScratch
open P5IndexedSourceScratch

variable {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
  {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
  {R : OriginalUniqueFourResidual F}
  {distribution : ExactTwoStrictHitDistribution R}
  {profile : S.surplusCap.card = 5 ∧
    S.oppCap1.card = 4 ∧ S.oppCap2.card = 5}

private theorem mirror_sortedRadius
    (P : P4MirrorBoundaryPacket R profile distribution)
    (center left right : Label) (hleftRight : left ≠ right)
    (hleftCenter : left ≠ center) (hrightCenter : right ≠ center) :
    mirrorTotalVal P (p4VarOfAtom (sortedRadius center left right)) ↔
      radiusEq P.core mirrorIndex center left right := by
  unfold sortedRadius
  split
  · exact (mirrorValAgreement P).radius center left right
      ‹left < right› hleftCenter hrightCenter
  · have hrightLeft : right < left :=
      lt_of_le_of_ne (le_of_not_gt ‹¬ left < right›) (Ne.symm hleftRight)
    exact ((mirrorValAgreement P).radius center right left
      hrightLeft hrightCenter hleftCenter).trans
        (radiusEq_comm P.core mirrorIndex center right left)

theorem radiusTransLitsSat_mirror
    (P : P4MirrorBoundaryPacket R profile distribution)
    (center x y z : Label)
    (hshape : x ≠ y ∧ y ≠ z ∧ x ≠ z ∧
      center ≠ x ∧ center ≠ y ∧ center ≠ z) :
    clauseSat (mirrorTotalVal P)
      (instLits (.radiusTrans center x y z)) := by
  have htrans :=
    P4GenericFamiliesScratch.radiusPartitionTransitivitySat_core
      P.core mirrorIndex
  have hxyv := mirror_sortedRadius P center x y hshape.1
    (Ne.symm hshape.2.2.2.1) (Ne.symm hshape.2.2.2.2.1)
  have hyzv := mirror_sortedRadius P center y z hshape.2.1
    (Ne.symm hshape.2.2.2.2.1) (Ne.symm hshape.2.2.2.2.2)
  have hxzv := mirror_sortedRadius P center x z hshape.2.2.1
    (Ne.symm hshape.2.2.2.1) (Ne.symm hshape.2.2.2.2.2)
  by_cases hxy : radiusEq P.core mirrorIndex center x y
  · by_cases hyz : radiusEq P.core mirrorIndex center y z
    · refine ⟨((p4VarOfAtom (sortedRadius center x z) : Nat) : Int),
        by simp [instLits], ?_⟩
      apply litSat_pos
      exact hxzv.mpr (htrans center x y z hxy hyz)
    · refine ⟨-((p4VarOfAtom (sortedRadius center y z) : Nat) : Int),
        by simp [instLits], ?_⟩
      apply litSat_neg (p4VarOfAtom_pos _)
      exact fun h => hyz (hyzv.mp h)
  · refine ⟨-((p4VarOfAtom (sortedRadius center x y) : Nat) : Int),
      by simp [instLits], ?_⟩
    apply litSat_neg (p4VarOfAtom_pos _)
    exact fun h => hxy (hxyv.mp h)

theorem entry_sat_mirror
    (P : P4MirrorBoundaryPacket R profile distribution)
    (entry : BridgeEntry) (hentry : entryWF entry = true) :
    clauseSat (mirrorTotalVal P) entry.clause := by
  rcases entry with ⟨clause, shape⟩
  cases shape with
  | radiusTrans center x y z =>
      simp only [entryWF, Bool.and_eq_true] at hentry
      apply P5OccurrenceBridgeScratch.clauseSat_of_subset hentry.2
      apply radiusTransLitsSat_mirror P center x y z
      simpa [shapeWF] using hentry.1

theorem bridgeClauses_sat_mirror
    (P : P4MirrorBoundaryPacket R profile distribution) :
    ∀ clause ∈ bridgeClauses,
      clauseSat (mirrorTotalVal P) clause := by
  intro clause hclause
  simp only [bridgeClauses, List.mem_map] at hclause
  rcases hclause with ⟨entry, hentry, rfl⟩
  exact entry_sat_mirror P entry
    (List.all_eq_true.mp bridgeEntries_wf entry hentry)

end Problem97.P4RadiusPartitionOccurrenceBridgeScratch

namespace Problem97.P4RowAtLeastFourOccurrenceBridgeScratch

open ATailCriticalPairFrontier
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourClassCapDistributionScratch
open ATailUniqueFourExactTwoBoundaryScratch
open ATailUniqueFourExactTwoSchemaDecoderScratch
open P4CriticalSupportOccurrenceBridgeScratch
open P4MirrorValuationScratch
open P5IndexedSourceScratch

variable {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
  {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
  {R : OriginalUniqueFourResidual F}
  {distribution : ExactTwoStrictHitDistribution R}
  {profile : S.surplusCap.card = 5 ∧
    S.oppCap1.card = 4 ∧ S.oppCap2.card = 5}

theorem rowAtLeastFourLitsSat_mirror
    (P : P4MirrorBoundaryPacket R profile distribution)
    (center : Label) (points : List Label)
    (hlength : points.length = 7) (hnodup : points.Nodup)
    (hcenter : center ∉ points) :
    clauseSat (mirrorTotalVal P)
      (instLits (.rowAtLeastFour center points)) := by
  have hcard : points.toFinset.card = 7 := by
    rw [List.toFinset_card_of_nodup hnodup, hlength]
  have hcenterFinset : center ∉ points.toFinset := by
    simpa using hcenter
  obtain ⟨point, hpoint, hrow⟩ :=
    P4GenericFamiliesScratch.rowAtLeastFourSat_core P.core
      mirrorIndex_injective center points.toFinset hcenterFinset hcard
  have hpointList : point ∈ points := by simpa using hpoint
  refine ⟨((p4VarOfAtom (.row center point) : Nat) : Int), ?_, ?_⟩
  · simp only [instLits]
    exact List.mem_map.mpr ⟨point, hpointList, rfl⟩
  · apply litSat_pos
    change mirrorTotalVal P (rowVariable center point)
    exact ((mirrorValAgreement P).row center point
      (fun h => hcenter (by simpa [h] using hpointList))).mpr hrow

theorem entry_sat_mirror
    (P : P4MirrorBoundaryPacket R profile distribution)
    (entry : BridgeEntry) (hentry : entryWF entry = true) :
    clauseSat (mirrorTotalVal P) entry.clause := by
  rcases entry with ⟨clause, shape⟩
  cases shape with
  | rowAtLeastFour center points =>
      simp only [entryWF, Bool.and_eq_true] at hentry
      apply P5OccurrenceBridgeScratch.clauseSat_of_subset hentry.2
      have hshape :
          points.length = 7 ∧ points.Nodup ∧ center ∉ points := by
        simpa [shapeWF] using hentry.1
      exact rowAtLeastFourLitsSat_mirror P center points
        hshape.1 hshape.2.1 hshape.2.2

theorem bridgeClauses_sat_mirror
    (P : P4MirrorBoundaryPacket R profile distribution) :
    ∀ clause ∈ bridgeClauses,
      clauseSat (mirrorTotalVal P) clause := by
  intro clause hclause
  simp only [bridgeClauses, List.mem_map] at hclause
  rcases hclause with ⟨entry, hentry, rfl⟩
  exact entry_sat_mirror P entry
    (List.all_eq_true.mp bridgeEntries_wf entry hentry)

end Problem97.P4RowAtLeastFourOccurrenceBridgeScratch

namespace Problem97.P4CyclicAlternationOccurrenceBridgeScratch

open ATailCriticalPairFrontier
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourClassCapDistributionScratch
open ATailUniqueFourExactTwoBoundaryScratch
open ATailUniqueFourExactTwoSchemaDecoderScratch
open P4MirrorValuationScratch
open P5IndexedSourceScratch

variable {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
  {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
  {R : OriginalUniqueFourResidual F}
  {distribution : ExactTwoStrictHitDistribution R}
  {profile : S.surplusCap.card = 5 ∧
    S.oppCap1.card = 4 ∧ S.oppCap2.card = 5}

private theorem mirror_sortedRadius
    (P : P4MirrorBoundaryPacket R profile distribution)
    (center left right : Label) (hleftRight : left ≠ right)
    (hleftCenter : left ≠ center) (hrightCenter : right ≠ center) :
    mirrorTotalVal P (p4VarOfAtom (sortedRadius center left right)) ↔
      radiusEq P.core mirrorIndex center left right := by
  unfold sortedRadius
  split
  · exact (mirrorValAgreement P).radius center left right
      ‹left < right› hleftCenter hrightCenter
  · have hrightLeft : right < left :=
      lt_of_le_of_ne (le_of_not_gt ‹¬ left < right›) (Ne.symm hleftRight)
    exact ((mirrorValAgreement P).radius center right left
      hrightLeft hrightCenter hleftCenter).trans
        (radiusEq_comm P.core mirrorIndex center right left)

theorem cyclicLitsSat_mirror
    (P : P4MirrorBoundaryPacket R profile distribution)
    (left right point₁ point₂ : Label)
    (hshape : left < right ∧ point₁ < point₂ ∧
      point₁ ≠ left ∧ point₁ ≠ right ∧
      point₂ ≠ left ∧ point₂ ≠ right ∧
      ((left < point₁ ∧ point₁ < right) ↔
        (left < point₂ ∧ point₂ < right))) :
    clauseSat (mirrorTotalVal P)
      (instLits (.cyclic left right point₁ point₂)) := by
  have hcyclic :=
    P4GenericFamiliesScratch.fullClassCyclicAlternationSat_mirror_core P.core
  by_cases hleft :
      radiusEq P.core mirrorIndex left point₁ point₂
  · by_cases hright :
        radiusEq P.core mirrorIndex right point₁ point₂
    · exact False.elim
        (hcyclic left right point₁ point₂ hshape.1 hshape.2.1
          hshape.2.2.1 hshape.2.2.2.1 hshape.2.2.2.2.1
          hshape.2.2.2.2.2.1 hshape.2.2.2.2.2.2 ⟨hleft, hright⟩)
    · refine ⟨-((p4VarOfAtom
          (sortedRadius right point₁ point₂) : Nat) : Int),
        by simp [instLits], ?_⟩
      apply litSat_neg (p4VarOfAtom_pos _)
      exact fun hvalue => hright
        ((mirror_sortedRadius P right point₁ point₂
          hshape.2.1.ne hshape.2.2.2.1
          hshape.2.2.2.2.2.1).mp hvalue)
  · refine ⟨-((p4VarOfAtom
        (sortedRadius left point₁ point₂) : Nat) : Int),
      by simp [instLits], ?_⟩
    apply litSat_neg (p4VarOfAtom_pos _)
    exact fun hvalue => hleft
      ((mirror_sortedRadius P left point₁ point₂
        hshape.2.1.ne hshape.2.2.1
        hshape.2.2.2.2.1).mp hvalue)

theorem entry_sat_mirror
    (P : P4MirrorBoundaryPacket R profile distribution)
    (entry : BridgeEntry) (hentry : entryWF entry = true) :
    clauseSat (mirrorTotalVal P) entry.clause := by
  rcases entry with ⟨clause, shape⟩
  cases shape with
  | cyclic left right point₁ point₂ =>
      simp only [entryWF, Bool.and_eq_true] at hentry
      apply P5OccurrenceBridgeScratch.clauseSat_of_subset hentry.2
      apply cyclicLitsSat_mirror P left right point₁ point₂
      exact of_decide_eq_true hentry.1

theorem bridgeClauses_sat_mirror
    (P : P4MirrorBoundaryPacket R profile distribution) :
    ∀ clause ∈ bridgeClauses,
      clauseSat (mirrorTotalVal P) clause := by
  intro clause hclause
  simp only [bridgeClauses, List.mem_map] at hclause
  rcases hclause with ⟨entry, hentry, rfl⟩
  exact entry_sat_mirror P entry
    (List.all_eq_true.mp bridgeEntries_wf entry hentry)

end Problem97.P4CyclicAlternationOccurrenceBridgeScratch

namespace Problem97.P4MirrorValuationScratch

open ATailCriticalPairFrontier
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourClassCapDistributionScratch
open ATailUniqueFourExactTwoBoundaryScratch

variable {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
  {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
  {R : OriginalUniqueFourResidual F}
  {distribution : ExactTwoStrictHitDistribution R}
  {profile : S.surplusCap.card = 5 ∧
    S.oppCap1.card = 4 ∧ S.oppCap2.card = 5}

theorem mirrorTotalVal_radiusPartitionClauses_sat
    (P : P4MirrorBoundaryPacket R profile distribution) :
    ∀ clause ∈ P4RadiusPartitionOccurrenceBridgeScratch.bridgeClauses,
      P5OccurrenceBridgeScratch.clauseSat (mirrorTotalVal P) clause :=
  P4RadiusPartitionOccurrenceBridgeScratch.bridgeClauses_sat_mirror P

theorem mirrorTotalVal_rowAtLeastFourClauses_sat
    (P : P4MirrorBoundaryPacket R profile distribution) :
    ∀ clause ∈ P4RowAtLeastFourOccurrenceBridgeScratch.bridgeClauses,
      P5OccurrenceBridgeScratch.clauseSat (mirrorTotalVal P) clause :=
  P4RowAtLeastFourOccurrenceBridgeScratch.bridgeClauses_sat_mirror P

theorem mirrorTotalVal_cyclicAlternationClauses_sat
    (P : P4MirrorBoundaryPacket R profile distribution) :
    ∀ clause ∈ P4CyclicAlternationOccurrenceBridgeScratch.bridgeClauses,
      P5OccurrenceBridgeScratch.clauseSat (mirrorTotalVal P) clause :=
  P4CyclicAlternationOccurrenceBridgeScratch.bridgeClauses_sat_mirror P

end Problem97.P4MirrorValuationScratch
