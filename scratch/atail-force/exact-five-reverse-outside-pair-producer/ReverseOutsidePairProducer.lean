/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import PhysicalOmissionCycleParentAdapter
import ReverseMembershipClosure

/-!
# Scratch: exact-five reverse outside-pair producer audit

This file keeps the complete frontier-coupled exact-five parent residual while
auditing the proposed repeated outside-pair producer in the all-reverse arm.

The result has the opposite polarity from the proposed producer.  Actual
blocker centers on the reverse cycle are injective, and the two-point
outside-cap residuals of their exact critical shells are injective as well.
Consequently the current packet supplies a sharp capacity inequality, not a
repeated pair.  A repeat would already close through the ordered-cap terminal.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailExactFiveReverseOutsidePairProducerScratch

open ATailCriticalPairFrontier
open ATailLargeCapUniqueFive
open ATailLargeCapUniqueFivePhysicalOmissionCycle
open ATailExactFiveReverseMembershipClosureScratch
open ATailPhysicalOmissionCycleParentAdapterScratch

attribute [local instance] Classical.propDecidable

noncomputable section

/-- The actual blocker center of the successor row indexed by one omission
cycle edge. -/
def reverseRowCenter
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (K : PhysicalActualCriticalOmissionCycle H profile)
    (i : Fin K.period) : ℝ² :=
  H.centerAt (K.source (K.successorIndex i)).1
    (PhysicalVertex.mem_A (K.source (K.successorIndex i)))

/-- The exact two-point residual of the successor actual critical shell
outside the physical cap. -/
def reverseOutsidePair
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (K : PhysicalActualCriticalOmissionCycle H profile)
    (i : Fin K.period) : Finset ℝ² :=
  (H.selectedAt (K.source (K.successorIndex i)).1
      (PhysicalVertex.mem_A
        (K.source (K.successorIndex i)))).toCriticalFourShell.support \
    S.capByIndex S.oppIndex2

/-- Cyclic successor indices form a permutation of the normalized cycle
indices. -/
theorem successorIndex_injective
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (K : PhysicalActualCriticalOmissionCycle H profile) :
    Function.Injective K.successorIndex := by
  intro i j hij
  apply Fin.ext
  have hval := congrArg Fin.val hij
  change (i.1 + 1) % K.period = (j.1 + 1) % K.period at hval
  have hadd : i.1 + 1 ≡ j.1 + 1 [MOD K.period] := hval
  have hmod : i.1 ≡ j.1 [MOD K.period] :=
    Nat.ModEq.add_right_cancel' 1 hadd
  change i.1 % K.period = j.1 % K.period at hmod
  simpa [Nat.mod_eq_of_lt i.2, Nat.mod_eq_of_lt j.2] using hmod

/-- Every reverse successor row has exactly two points outside the physical
cap. -/
theorem reverseOutsidePair_card_eq_two
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (K : PhysicalActualCriticalOmissionCycle H profile)
    (hreverse : ∀ i : Fin K.period,
      (K.source i).1 ∈
        (H.selectedAt (K.source (K.successorIndex i)).1
          (PhysicalVertex.mem_A
            (K.source (K.successorIndex i)))).toCriticalFourShell.support)
    (i : Fin K.period) :
    (reverseOutsidePair K i).card = 2 := by
  exact successor_actualCriticalSupport_outside_physicalCap_card_eq_two
    K hreverse i

/-- Every reverse outside pair lies in the ambient complement of the physical
cap. -/
theorem reverseOutsidePair_subset_complement
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (K : PhysicalActualCriticalOmissionCycle H profile)
    (i : Fin K.period) :
    reverseOutsidePair K i ⊆ D.A \ S.capByIndex S.oppIndex2 := by
  intro x hx
  rcases Finset.mem_sdiff.mp hx with ⟨hxSupport, hxOutside⟩
  exact Finset.mem_sdiff.mpr
    ⟨(H.selectedAt (K.source (K.successorIndex i)).1
        (PhysicalVertex.mem_A
          (K.source (K.successorIndex i)))).toCriticalFourShell.support_subset_A
        hxSupport,
      hxOutside⟩

/-- The actual blocker centers of distinct reverse successor rows are
distinct.  Equal centers would force one successor source into the other's
exact shell; the exact cap split then either identifies the edge indices or
contradicts the known separation of consecutive blockers. -/
theorem reverseRowCenter_injective
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (K : PhysicalActualCriticalOmissionCycle H profile)
    (hreverse : ∀ i : Fin K.period,
      (K.source i).1 ∈
        (H.selectedAt (K.source (K.successorIndex i)).1
          (PhysicalVertex.mem_A
            (K.source (K.successorIndex i)))).toCriticalFourShell.support) :
    Function.Injective (reverseRowCenter K) := by
  intro i j hcenters
  have hsourceJ_mem_rowI :
      (K.source (K.successorIndex j)).1 ∈
        (H.selectedAt (K.source (K.successorIndex i)).1
          (PhysicalVertex.mem_A
            (K.source (K.successorIndex i)))).toCriticalFourShell.support := by
    by_contra houtside
    have hne := blocker_centers_ne_of_not_mem_other_selected_support H
      (PhysicalVertex.mem_A (K.source (K.successorIndex j)))
      (PhysicalVertex.mem_A (K.source (K.successorIndex i))) houtside
    exact hne hcenters.symm
  have hsourceJ_mem_cap :
      (K.source (K.successorIndex j)).1 ∈
        S.capByIndex S.oppIndex2 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex2
      (K.source_mem_capInterior (K.successorIndex j))
  have hpair := successor_actualCriticalSupport_inter_physicalCap_eq_pair
    K hreverse i
  have hsourceJ_mem_pair :
      (K.source (K.successorIndex j)).1 ∈
        ({(K.source i).1,
          (K.source (K.successorIndex i)).1} : Finset ℝ²) := by
    rw [← hpair]
    exact Finset.mem_inter.mpr ⟨hsourceJ_mem_rowI, hsourceJ_mem_cap⟩
  simp only [Finset.mem_insert, Finset.mem_singleton] at hsourceJ_mem_pair
  rcases hsourceJ_mem_pair with hback | hsame
  · have hindex : K.successorIndex j = i :=
      K.source_injective (Subtype.ext hback)
    have hcenters' :
        H.centerAt (K.source (K.successorIndex i)).1
            (PhysicalVertex.mem_A (K.source (K.successorIndex i))) =
          H.centerAt (K.source i).1
            (PhysicalVertex.mem_A (K.source i)) := by
      simpa [reverseRowCenter, hindex] using hcenters
    exact False.elim ((K.successor_actualBlockers_ne i) hcenters')
  · have hsuccessor : K.successorIndex j = K.successorIndex i :=
      K.source_injective (Subtype.ext hsame)
    exact (successorIndex_injective K hsuccessor).symm

/-- Two distinct reverse successor rows cannot repeat their exact outside-cap
pair.  Such a repeat is precisely the antecedent of the existing ordered-cap
terminal. -/
theorem false_of_repeated_reverseOutsidePair
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (K : PhysicalActualCriticalOmissionCycle H profile)
    (hreverse : ∀ i : Fin K.period,
      (K.source i).1 ∈
        (H.selectedAt (K.source (K.successorIndex i)).1
          (PhysicalVertex.mem_A
            (K.source (K.successorIndex i)))).toCriticalFourShell.support)
    (i j : Fin K.period) (hij : i ≠ j)
    (hpairs : reverseOutsidePair K i = reverseOutsidePair K j) : False := by
  have hcard := reverseOutsidePair_card_eq_two K hreverse i
  rw [Finset.card_eq_two] at hcard
  rcases hcard with ⟨a, b, hab, habPair⟩
  have ha_i : a ∈ reverseOutsidePair K i := by simp [habPair]
  have hb_i : b ∈ reverseOutsidePair K i := by simp [habPair]
  have ha_j : a ∈ reverseOutsidePair K j := by rw [← hpairs]; exact ha_i
  have hb_j : b ∈ reverseOutsidePair K j := by rw [← hpairs]; exact hb_i
  rcases Finset.mem_sdiff.mp ha_i with ⟨ha_i_support, haOutside⟩
  rcases Finset.mem_sdiff.mp hb_i with ⟨hb_i_support, hbOutside⟩
  rcases Finset.mem_sdiff.mp ha_j with ⟨ha_j_support, _⟩
  rcases Finset.mem_sdiff.mp hb_j with ⟨hb_j_support, _⟩
  exact false_of_two_reverseRows_common_outsidePair K hreverse i j
    (fun hcenters ↦ hij (reverseRowCenter_injective K hreverse hcenters))
    ha_i_support hb_i_support ha_j_support hb_j_support
    haOutside hbOutside hab

/-- Therefore the map from reverse successor rows to their exact two-point
outside residuals is injective. -/
theorem reverseOutsidePair_injective
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (K : PhysicalActualCriticalOmissionCycle H profile)
    (hreverse : ∀ i : Fin K.period,
      (K.source i).1 ∈
        (H.selectedAt (K.source (K.successorIndex i)).1
          (PhysicalVertex.mem_A
            (K.source (K.successorIndex i)))).toCriticalFourShell.support) :
    Function.Injective (reverseOutsidePair K) := by
  intro i j hpairs
  by_contra hij
  exact false_of_repeated_reverseOutsidePair K hreverse i j hij hpairs

/-- The sharp consequence of the current reverse packet is a pair-capacity
bound.  It does not force a repeated pair. -/
theorem period_le_choose_capComplement_two
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (K : PhysicalActualCriticalOmissionCycle H profile)
    (hreverse : ∀ i : Fin K.period,
      (K.source i).1 ∈
        (H.selectedAt (K.source (K.successorIndex i)).1
          (PhysicalVertex.mem_A
            (K.source (K.successorIndex i)))).toCriticalFourShell.support) :
    K.period ≤ Nat.choose (D.A \ S.capByIndex S.oppIndex2).card 2 := by
  let pairs : Finset (Finset ℝ²) :=
    Finset.univ.image (reverseOutsidePair K)
  have hpairsCard : pairs.card = K.period := by
    rw [Finset.card_image_of_injective _
      (reverseOutsidePair_injective K hreverse)]
    simp
  have hpairsSub :
      pairs ⊆ (D.A \ S.capByIndex S.oppIndex2).powersetCard 2 := by
    intro pair hpair
    rcases Finset.mem_image.mp hpair with ⟨i, _hi, rfl⟩
    exact Finset.mem_powersetCard.mpr
      ⟨reverseOutsidePair_subset_complement K i,
        reverseOutsidePair_card_eq_two K hreverse i⟩
  calc
    K.period = pairs.card := hpairsCard.symm
    _ ≤ ((D.A \ S.capByIndex S.oppIndex2).powersetCard 2).card :=
      Finset.card_le_card hpairsSub
    _ = Nat.choose (D.A \ S.capByIndex S.oppIndex2).card 2 :=
      Finset.card_powersetCard 2 _

/-- Ordered-cap form of the source-role bridge needed by a future lifted
curvature adapter.  The two same-cap targets of a reverse row lie on opposite
sides of its actual blocker in strict cap order. -/
structure ReverseRowCapStraddle
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (K : PhysicalActualCriticalOmissionCycle H profile)
    (i : Fin K.period) : Type where
  capCard : ℕ
  orderedCap : CGN.OrderedCap capCard
  packet : CGN.MecCapPacket D.A orderedCap
  side : CGN.MinorCapSideHypotheses packet
  order : CGN.StrictCapOrder D.A orderedCap
  cap_eq : Finset.univ.image orderedCap.points =
    S.capByIndex S.oppIndex2
  centerIndex : Fin capCard
  leftIndex : Fin capCard
  rightIndex : Fin capCard
  left_lt_center : leftIndex < centerIndex
  center_lt_right : centerIndex < rightIndex
  center_point_eq : orderedCap.points centerIndex = reverseRowCenter K i
  source_points_eq :
    (orderedCap.points leftIndex = (K.source i).1 ∧
      orderedCap.points rightIndex =
        (K.source (K.successorIndex i)).1) ∨
    (orderedCap.points leftIndex =
        (K.source (K.successorIndex i)).1 ∧
      orderedCap.points rightIndex = (K.source i).1)

/-- The same-cap source pair of every reverse successor row straddles the
actual blocker in strict ordered-cap index order. -/
theorem nonempty_reverseRowCapStraddle
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (K : PhysicalActualCriticalOmissionCycle H profile)
    (hreverse : ∀ i : Fin K.period,
      (K.source i).1 ∈
        (H.selectedAt (K.source (K.successorIndex i)).1
          (PhysicalVertex.mem_A
            (K.source (K.successorIndex i)))).toCriticalFourShell.support)
    (i : Fin K.period) :
    Nonempty (ReverseRowCapStraddle K i) := by
  let row := (H.selectedAt (K.source (K.successorIndex i)).1
    (PhysicalVertex.mem_A
      (K.source (K.successorIndex i)))).toCriticalFourShell
  have hcenterCap : reverseRowCenter K i ∈ S.capByIndex S.oppIndex2 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex2
      (successor_actualBlocker_mem_physicalCapInterior K hreverse i)
  have hleftCap : (K.source i).1 ∈ S.capByIndex S.oppIndex2 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex2
      (K.source_mem_capInterior i)
  have hrightCap :
      (K.source (K.successorIndex i)).1 ∈
        S.capByIndex S.oppIndex2 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex2
      (K.source_mem_capInterior (K.successorIndex i))
  rcases S.capByIndex_cgn4g_capData D.convex S.oppIndex2 with
    ⟨m, L, Packet, Hside, Hord, hcap⟩
  have hcenterImage : reverseRowCenter K i ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact hcenterCap
  have hleftImage : (K.source i).1 ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact hleftCap
  have hrightImage :
      (K.source (K.successorIndex i)).1 ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact hrightCap
  rcases Finset.mem_image.mp hcenterImage with ⟨c, _hc, hc⟩
  rcases Finset.mem_image.mp hleftImage with ⟨r, _hr, hr⟩
  rcases Finset.mem_image.mp hrightImage with ⟨s, _hs, hs⟩
  have hdist : dist (L.points c) (L.points r) =
      dist (L.points c) (L.points s) := by
    have hrowEq :
        dist (reverseRowCenter K i) (K.source i).1 =
          dist (reverseRowCenter K i)
            (K.source (K.successorIndex i)).1 :=
      (row.support_eq_radius (K.source i).1 (hreverse i)).trans
        (row.support_eq_radius (K.source (K.successorIndex i)).1
          row.q_mem_support).symm
    simpa [hc, hr, hs] using hrowEq
  have hcenter_ne_left : reverseRowCenter K i ≠ (K.source i).1 := by
    intro h
    apply row.center_not_mem_support
    have h' :
        H.centerAt (K.source (K.successorIndex i)).1
            (PhysicalVertex.mem_A (K.source (K.successorIndex i))) =
          (K.source i).1 := by
      simpa [reverseRowCenter] using h
    exact (congrArg (fun x => x ∈ row.support) h').symm.mp (hreverse i)
  have hcenter_ne_right :
      reverseRowCenter K i ≠ (K.source (K.successorIndex i)).1 := by
    intro h
    apply row.center_not_mem_support
    have h' :
        H.centerAt (K.source (K.successorIndex i)).1
            (PhysicalVertex.mem_A (K.source (K.successorIndex i))) =
          (K.source (K.successorIndex i)).1 := by
      simpa [reverseRowCenter] using h
    exact
      (congrArg (fun x => x ∈ row.support) h').symm.mp
        row.q_mem_support
  have hcr : c ≠ r := by
    intro h
    apply hcenter_ne_left
    calc
      reverseRowCenter K i = L.points c := hc.symm
      _ = L.points r := by rw [h]
      _ = (K.source i).1 := hr
  have hcs : c ≠ s := by
    intro h
    apply hcenter_ne_right
    calc
      reverseRowCenter K i = L.points c := hc.symm
      _ = L.points s := by rw [h]
      _ = (K.source (K.successorIndex i)).1 := hs
  have hrs : r ≠ s := by
    intro h
    apply K.successor_source_ne i
    apply Subtype.ext
    calc
      (K.source (K.successorIndex i)).1 = L.points s := hs.symm
      _ = L.points r := by rw [h]
      _ = (K.source i).1 := hr
  have hinj := CGN.oneSidedDistanceInjective_of_mecCapPacket
    Packet Hside Hord
  rcases lt_or_gt_of_ne hcr with hcrLt | hrcLt
  · have hscLt : s < c := by
      rcases lt_or_gt_of_ne hcs with hcsLt | hscLt
      · rcases lt_or_gt_of_ne hrs with hrsLt | hsrLt
        · exact False.elim ((hinj.1 hcrLt hrsLt) hdist)
        · exact False.elim ((hinj.1 hcsLt hsrLt) hdist.symm)
      · exact hscLt
    exact ⟨{
      capCard := m
      orderedCap := L
      packet := Packet
      side := Hside
      order := Hord
      cap_eq := hcap
      centerIndex := c
      leftIndex := s
      rightIndex := r
      left_lt_center := hscLt
      center_lt_right := hcrLt
      center_point_eq := hc
      source_points_eq := Or.inr ⟨hs, hr⟩ }⟩
  · have hcsLt : c < s := by
      rcases lt_or_gt_of_ne hcs with hcsLt | hscLt
      · exact hcsLt
      · rcases lt_or_gt_of_ne hrs with hrsLt | hsrLt
        · exact False.elim ((hinj.2 hrsLt hscLt) hdist)
        · exact False.elim ((hinj.2 hsrLt hrcLt) hdist.symm)
    exact ⟨{
      capCard := m
      orderedCap := L
      packet := Packet
      side := Hside
      order := Hord
      cap_eq := hcap
      centerIndex := c
      leftIndex := r
      rightIndex := s
      left_lt_center := hrcLt
      center_lt_right := hcsLt
      center_point_eq := hc
      source_points_eq := Or.inl ⟨hr, hs⟩ }⟩

/-- Parent-indexed obstruction packet.  Its type retains the entire robust
parent, first-apex frontier, continuation, anchored cycle, and concrete
critical-shell system even though none of those fields currently supplies a
cross-row pair collision. -/
structure FrontierCoupledReverseOutsidePairCapacity
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {F : ATailRobustLargeRadius.RobustLargeRadiusParentSurface D S}
    (R : FrontierCoupledExactFivePhysicalCycleParentResidual H F) : Prop where
  all_reverseMembership : ∀ i : Fin R.exactFive.cycle.period,
    (R.exactFive.cycle.source i).1 ∈
      (H.selectedAt
        (R.exactFive.cycle.source
          (R.exactFive.cycle.successorIndex i)).1
        (PhysicalVertex.mem_A
          (R.exactFive.cycle.source
            (R.exactFive.cycle.successorIndex i)))).toCriticalFourShell.support
  period_ge_three : 3 ≤ R.exactFive.cycle.period
  period_le_five : R.exactFive.cycle.period ≤ 5
  centers_injective :
    Function.Injective (reverseRowCenter R.exactFive.cycle)
  outsidePairs_card_two : ∀ i : Fin R.exactFive.cycle.period,
    (reverseOutsidePair R.exactFive.cycle i).card = 2
  outsidePairs_injective :
    Function.Injective (reverseOutsidePair R.exactFive.cycle)
  pair_capacity :
    R.exactFive.cycle.period ≤
      Nat.choose (D.A \ S.capByIndex S.oppIndex2).card 2

/-- Construct the complete parent-indexed capacity obstruction in the
all-reverse arm. -/
theorem nonempty_frontierCoupledReverseOutsidePairCapacity
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {F : ATailRobustLargeRadius.RobustLargeRadiusParentSurface D S}
    (R : FrontierCoupledExactFivePhysicalCycleParentResidual H F)
    (hreverse : ∀ i : Fin R.exactFive.cycle.period,
      (R.exactFive.cycle.source i).1 ∈
        (H.selectedAt
          (R.exactFive.cycle.source
            (R.exactFive.cycle.successorIndex i)).1
          (PhysicalVertex.mem_A
            (R.exactFive.cycle.source
              (R.exactFive.cycle.successorIndex i)))).toCriticalFourShell.support) :
    Nonempty (FrontierCoupledReverseOutsidePairCapacity R) := by
  exact ⟨{
    all_reverseMembership := hreverse
    period_ge_three := three_le_period_of_all_reverseMembership
      R.exactFive.cycle hreverse
    period_le_five := R.exactFive.cycle.period_le_five
    centers_injective := reverseRowCenter_injective
      R.exactFive.cycle hreverse
    outsidePairs_card_two := reverseOutsidePair_card_eq_two
      R.exactFive.cycle hreverse
    outsidePairs_injective := reverseOutsidePair_injective
      R.exactFive.cycle hreverse
    pair_capacity := period_le_choose_capComplement_two
      R.exactFive.cycle hreverse }⟩

/-- The already-available source-faithful U5 output, lifted without erasing
the parent residual.  This is the strongest unconditional U5 packet; the
dangerous-triple and named cross-incidence fields of the banked sinks remain
absent. -/
theorem nonempty_parentReverseMembershipQCriticalPair
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {F : ATailRobustLargeRadius.RobustLargeRadiusParentSurface D S}
    (R : FrontierCoupledExactFivePhysicalCycleParentResidual H F)
    (hreverse : ∀ i : Fin R.exactFive.cycle.period,
      (R.exactFive.cycle.source i).1 ∈
        (H.selectedAt
          (R.exactFive.cycle.source
            (R.exactFive.cycle.successorIndex i)).1
          (PhysicalVertex.mem_A
            (R.exactFive.cycle.source
              (R.exactFive.cycle.successorIndex i)))).toCriticalFourShell.support)
    (i : Fin R.exactFive.cycle.period) :
    Nonempty (ReverseMembershipQCriticalPair R.exactFive.cycle i) :=
  nonempty_reverseMembershipQCriticalPair R.exactFive.cycle hreverse i

#print axioms successorIndex_injective
#print axioms reverseOutsidePair_card_eq_two
#print axioms reverseOutsidePair_subset_complement
#print axioms reverseRowCenter_injective
#print axioms false_of_repeated_reverseOutsidePair
#print axioms reverseOutsidePair_injective
#print axioms period_le_choose_capComplement_two
#print axioms nonempty_reverseRowCapStraddle
#print axioms nonempty_frontierCoupledReverseOutsidePairCapacity
#print axioms nonempty_parentReverseMembershipQCriticalPair

end

end ATailExactFiveReverseOutsidePairProducerScratch
end Problem97
