/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.LocalizedCollisionMutualOmissionCycle

/-!
# Cap-order reduction of the localized mutual-omission cycle

If the fresh source's actual blocker lies outside the localized collision cap,
that location is retained explicitly.  If it lies in the cap, the collision
row and fresh row contribute two disjoint banks of unordered outside pairs.
The disjointness is the convex-cap perpendicular-bisector theorem, not a
finite-shadow assumption.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailMutualOmissionCycleTerminalScratch

open ATailLocalizedCollisionMutualOmissionCycle
open ATailOrientedPhysicalApexIngress
open ATailRetainedStrictInteriorPairSelector

attribute [local instance] Classical.propDecidable

/-- The full cap-order content available when the fresh actual blocker lies
in the localized collision cap.  The two pair banks are built from complete
critical supports, not selected representatives of an external census. -/
structure LocalizedCollisionOnCapOutsidePairSeparation
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : ATailCriticalPairFrontier.CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    (L : LocalizedCollisionCommonDeletion P)
    (C : LocalizedCollisionMutualOmissionCycle P L) : Prop where
  freshBlocker_mem_firstCap :
    H.centerAt L.fresh L.packet.q_mem_A ∈ S.capByIndex S.oppIndex1
  collisionOutside_card_eq_two :
    ((H.selectedAt P.source₁ P.source₁_mem_A).toCriticalFourShell.support \
      S.capByIndex S.oppIndex1).card = 2
  freshOutside_card_ge_two :
    2 ≤ ((H.selectedAt L.fresh L.packet.q_mem_A).toCriticalFourShell.support \
      S.capByIndex S.oppIndex1).card
  outsidePairBanks_disjoint :
    Disjoint
      (((H.selectedAt P.source₁ P.source₁_mem_A).toCriticalFourShell.support \
        S.capByIndex S.oppIndex1).powersetCard 2)
      (((H.selectedAt L.fresh L.packet.q_mem_A).toCriticalFourShell.support \
        S.capByIndex S.oppIndex1).powersetCard 2)

namespace LocalizedCollisionOnCapOutsidePairSeparation

/-- The collision row contributes exactly one unordered outside pair. -/
theorem collisionOutsidePairBank_card_eq_one
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : ATailCriticalPairFrontier.CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {P : RetainedInteriorBlockerCollision R}
    {L : LocalizedCollisionCommonDeletion P}
    {C : LocalizedCollisionMutualOmissionCycle P L}
    (Q : LocalizedCollisionOnCapOutsidePairSeparation P L C) :
    (((H.selectedAt P.source₁ P.source₁_mem_A).toCriticalFourShell.support \
      S.capByIndex S.oppIndex1).powersetCard 2).card = 1 := by
  rw [Finset.card_powersetCard, Q.collisionOutside_card_eq_two]
  norm_num

/-- The fresh row contributes at least one unordered outside pair. -/
theorem one_le_freshOutsidePairBank_card
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : ATailCriticalPairFrontier.CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {P : RetainedInteriorBlockerCollision R}
    {L : LocalizedCollisionCommonDeletion P}
    {C : LocalizedCollisionMutualOmissionCycle P L}
    (Q : LocalizedCollisionOnCapOutsidePairSeparation P L C) :
    1 ≤ (((H.selectedAt L.fresh L.packet.q_mem_A).toCriticalFourShell.support \
      S.capByIndex S.oppIndex1).powersetCard 2).card := by
  rw [Finset.card_powersetCard]
  calc
    1 = Nat.choose 2 2 := by norm_num
    _ ≤ Nat.choose
        ((H.selectedAt L.fresh
          L.packet.q_mem_A).toCriticalFourShell.support \
            S.capByIndex S.oppIndex1).card 2 :=
      Nat.choose_le_choose 2 Q.freshOutside_card_ge_two

/-- The two rows therefore contribute at least two different unordered
outside-pair incidences. -/
theorem two_le_outsidePairBank_union_card
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : ATailCriticalPairFrontier.CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {P : RetainedInteriorBlockerCollision R}
    {L : LocalizedCollisionCommonDeletion P}
    {C : LocalizedCollisionMutualOmissionCycle P L}
    (Q : LocalizedCollisionOnCapOutsidePairSeparation P L C) :
    2 ≤
      ((((H.selectedAt P.source₁
          P.source₁_mem_A).toCriticalFourShell.support \
            S.capByIndex S.oppIndex1).powersetCard 2) ∪
        (((H.selectedAt L.fresh
          L.packet.q_mem_A).toCriticalFourShell.support \
            S.capByIndex S.oppIndex1).powersetCard 2)).card := by
  rw [Finset.card_union_of_disjoint Q.outsidePairBanks_disjoint,
    Q.collisionOutsidePairBank_card_eq_one]
  have hfresh := Q.one_le_freshOutsidePairBank_card
  omega

end LocalizedCollisionOnCapOutsidePairSeparation

/-- Exact cap-location split left by the localized mutual-omission cycle. -/
inductive LocalizedCollisionCapOrderOutcome
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : ATailCriticalPairFrontier.CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    (L : LocalizedCollisionCommonDeletion P)
    (C : LocalizedCollisionMutualOmissionCycle P L) : Prop
  | freshBlockerOffFirstCap
      (freshBlocker_not_mem :
        H.centerAt L.fresh L.packet.q_mem_A ∉ S.capByIndex S.oppIndex1)
  | onCapOutsidePairSeparation
      (data : LocalizedCollisionOnCapOutsidePairSeparation P L C)

private theorem outsidePairBanks_disjoint_of_freshBlocker_mem_firstCap
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : ATailCriticalPairFrontier.CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    (L : LocalizedCollisionCommonDeletion P)
    (C : LocalizedCollisionMutualOmissionCycle P L)
    (hfreshBlockerCap :
      H.centerAt L.fresh L.packet.q_mem_A ∈ S.capByIndex S.oppIndex1) :
    Disjoint
      (((H.selectedAt P.source₁ P.source₁_mem_A).toCriticalFourShell.support \
        S.capByIndex S.oppIndex1).powersetCard 2)
      (((H.selectedAt L.fresh L.packet.q_mem_A).toCriticalFourShell.support \
        S.capByIndex S.oppIndex1).powersetCard 2) := by
  classical
  rw [Finset.disjoint_left]
  intro pair hpairCollision hpairFresh
  have hcollisionData := Finset.mem_powersetCard.mp hpairCollision
  have hfreshData := Finset.mem_powersetCard.mp hpairFresh
  have hpairCard : pair.card = 2 := hcollisionData.2
  rw [Finset.card_eq_two] at hpairCard
  rcases hpairCard with ⟨a, b, hab, rfl⟩
  have haCollision :
      a ∈ (H.selectedAt P.source₁
        P.source₁_mem_A).toCriticalFourShell.support \
          S.capByIndex S.oppIndex1 :=
    hcollisionData.1 (by simp)
  have hbCollision :
      b ∈ (H.selectedAt P.source₁
        P.source₁_mem_A).toCriticalFourShell.support \
          S.capByIndex S.oppIndex1 :=
    hcollisionData.1 (by simp)
  have haFresh :
      a ∈ (H.selectedAt L.fresh
        L.packet.q_mem_A).toCriticalFourShell.support \
          S.capByIndex S.oppIndex1 :=
    hfreshData.1 (by simp)
  have hbFresh :
      b ∈ (H.selectedAt L.fresh
        L.packet.q_mem_A).toCriticalFourShell.support \
          S.capByIndex S.oppIndex1 :=
    hfreshData.1 (by simp)
  have haCollisionSupport := (Finset.mem_sdiff.mp haCollision).1
  have hbCollisionSupport := (Finset.mem_sdiff.mp hbCollision).1
  have haFreshSupport := (Finset.mem_sdiff.mp haFresh).1
  have hbFreshSupport := (Finset.mem_sdiff.mp hbFresh).1
  have haA : a ∈ D.A :=
    (H.selectedAt P.source₁ P.source₁_mem_A).toCriticalFourShell.support_subset_A
      haCollisionSupport
  have hbA : b ∈ D.A :=
    (H.selectedAt P.source₁ P.source₁_mem_A).toCriticalFourShell.support_subset_A
      hbCollisionSupport
  have hcommonEq :
      dist (H.centerAt P.source₁ P.source₁_mem_A) a =
        dist (H.centerAt P.source₁ P.source₁_mem_A) b :=
    (H.selectedAt P.source₁ P.source₁_mem_A).toCriticalFourShell.support_eq_radius
      a haCollisionSupport
    |>.trans
      ((H.selectedAt P.source₁
        P.source₁_mem_A).toCriticalFourShell.support_eq_radius
          b hbCollisionSupport).symm
  have hfreshEq :
      dist (H.centerAt L.fresh L.packet.q_mem_A) a =
        dist (H.centerAt L.fresh L.packet.q_mem_A) b :=
    (H.selectedAt L.fresh L.packet.q_mem_A).toCriticalFourShell.support_eq_radius
      a haFreshSupport
    |>.trans
      ((H.selectedAt L.fresh
        L.packet.q_mem_A).toCriticalFourShell.support_eq_radius
          b hbFreshSupport).symm
  have hcentersNe :
      H.centerAt P.source₁ P.source₁_mem_A ≠
        H.centerAt L.fresh L.packet.q_mem_A := by
    intro hcenters
    apply C.blockers_ne
    rw [C.collisionSource_blocker_eq_commonBlocker]
    exact hcenters
  rcases S.capByIndex_cgn4g_capData D.convex S.oppIndex1 with
    ⟨m, capOrder, Packet, _Hside, Hord, hcap⟩
  have hcommonImage :
      H.centerAt P.source₁ P.source₁_mem_A ∈
        Finset.univ.image capOrder.points := by
    rw [hcap]
    exact S.capInteriorByIndex_subset_capByIndex S.oppIndex1
      P.blocker_mem_capInterior
  have hfreshImage :
      H.centerAt L.fresh L.packet.q_mem_A ∈
        Finset.univ.image capOrder.points := by
    rw [hcap]
    exact hfreshBlockerCap
  rcases Finset.mem_image.mp hcommonImage with ⟨i, _hi, hiCommon⟩
  rcases Finset.mem_image.mp hfreshImage with ⟨j, _hj, hjFresh⟩
  have hij : i ≠ j := by
    intro hij
    apply hcentersNe
    calc
      H.centerAt P.source₁ P.source₁_mem_A = capOrder.points i := hiCommon.symm
      _ = capOrder.points j := by rw [hij]
      _ = H.centerAt L.fresh L.packet.q_mem_A := hjFresh
  have haOutside : a ∉ Finset.univ.image capOrder.points := by
    simpa only [hcap] using (Finset.mem_sdiff.mp haCollision).2
  have hbOutside : b ∉ Finset.univ.image capOrder.points := by
    simpa only [hcap] using (Finset.mem_sdiff.mp hbCollision).2
  rcases lt_or_gt_of_ne hij with hij | hji
  · exact CapSelectedRowCounting.outsidePair_unique_capCenter
      D.convex Hord Packet.mem_A hij haA hbA haOutside hbOutside hab
      (by simpa only [hiCommon] using hcommonEq)
      (by simpa only [hjFresh] using hfreshEq)
  · exact CapSelectedRowCounting.outsidePair_unique_capCenter
      D.convex Hord Packet.mem_A hji haA hbA haOutside hbOutside hab
      (by simpa only [hjFresh] using hfreshEq)
      (by simpa only [hiCommon] using hcommonEq)

/-- Every localized mutual-omission cycle reaches the exact cap-order split.
On the on-cap arm the two complete critical rows contribute distinct outside
pair incidences. -/
theorem nonempty_localizedCollisionCapOrderOutcome
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : ATailCriticalPairFrontier.CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    (L : LocalizedCollisionCommonDeletion P)
    (C : LocalizedCollisionMutualOmissionCycle P L) :
    Nonempty (LocalizedCollisionCapOrderOutcome P L C) := by
  classical
  by_cases hfreshBlockerCap :
      H.centerAt L.fresh L.packet.q_mem_A ∈ S.capByIndex S.oppIndex1
  · have hcollisionOutside :
        ((H.selectedAt P.source₁
          P.source₁_mem_A).toCriticalFourShell.support \
            S.capByIndex S.oppIndex1).card = 2 := by
      have hinter :
          ((H.selectedAt P.source₁
            P.source₁_mem_A).toCriticalFourShell.support ∩
              S.capByIndex S.oppIndex1).card = 2 := by
        rw [P.shell_inter_cap_eq_sources]
        simp [P.sources_ne]
      have hsplit := Finset.card_sdiff_add_card_inter
        (H.selectedAt P.source₁
          P.source₁_mem_A).toCriticalFourShell.support
        (S.capByIndex S.oppIndex1)
      rw [(H.selectedAt P.source₁
        P.source₁_mem_A).toCriticalFourShell.support_card, hinter] at hsplit
      omega
    have hfreshOutside :
        2 ≤ ((H.selectedAt L.fresh
          L.packet.q_mem_A).toCriticalFourShell.support \
            S.capByIndex S.oppIndex1).card := by
      have hinter :
          ((H.selectedAt L.fresh
            L.packet.q_mem_A).toCriticalFourShell.support ∩
              S.capByIndex S.oppIndex1).card ≤ 2 := by
        simpa using
          CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
            S D.convex S.oppIndex1
            (H.selectedAt L.fresh
              L.packet.q_mem_A).toCriticalFourShell.toSelectedFourClass
            hfreshBlockerCap
      have hsplit := Finset.card_sdiff_add_card_inter
        (H.selectedAt L.fresh
          L.packet.q_mem_A).toCriticalFourShell.support
        (S.capByIndex S.oppIndex1)
      rw [(H.selectedAt L.fresh
        L.packet.q_mem_A).toCriticalFourShell.support_card] at hsplit
      omega
    exact ⟨LocalizedCollisionCapOrderOutcome.onCapOutsidePairSeparation {
      freshBlocker_mem_firstCap := hfreshBlockerCap
      collisionOutside_card_eq_two := hcollisionOutside
      freshOutside_card_ge_two := hfreshOutside
      outsidePairBanks_disjoint :=
        outsidePairBanks_disjoint_of_freshBlocker_mem_firstCap
          P L C hfreshBlockerCap }⟩
  · exact ⟨LocalizedCollisionCapOrderOutcome.freshBlockerOffFirstCap
      hfreshBlockerCap⟩

#print axioms LocalizedCollisionOnCapOutsidePairSeparation
#print axioms LocalizedCollisionOnCapOutsidePairSeparation.two_le_outsidePairBank_union_card
#print axioms nonempty_localizedCollisionCapOrderOutcome

end ATailMutualOmissionCycleTerminalScratch
end Problem97
