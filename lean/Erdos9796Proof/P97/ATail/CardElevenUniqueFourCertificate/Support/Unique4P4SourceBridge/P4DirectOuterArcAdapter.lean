/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.Unique4ExactTwoSourceBridge.Curvature.P5RetainedOuterArcMasks
import Erdos9796Proof.P97.Census554.GeneralCarrierBridge

/-!
# Direct P4 source adapter for the retained outer-arc overlay

This file gives source semantics to the three dominant direct P4 families in
the canonical compact occurrence ledger:

* `direct_memberships_imply_row_pattern` (1,265 retained clauses);
* `direct_row_pattern_implies_outer_arc` (3,179 retained clauses);
* `direct_no_four_turn_disjoint_outer_arcs` (6,170 retained clauses).

The atom names are geometric data, not clause indices.  A membership atom is
membership in the actual selected four-row of an `ExactTwoBoundaryCore`; a row
atom says that this actual row has the displayed four-element boundary
support; an outer-arc atom says that the actual retained arc has the displayed
turn mask.

The first and third family theorems are completely generic.  The middle
family is exposed through `DirectRowArcSchema`: constructing one value is
exactly the finite source obligation that the encoder's mask computation for
one displayed support agrees with `RetainedOuterArc.turnMask`.  Thus no
solver assignment or clause-number lookup is hidden in the adapter.

The direct packet is obtained from
`nonempty_p4DirectBoundaryPacket_or_mirror`.  The theorem
`nonempty_directSource_or_mirrorPacket` deliberately leaves the mirror packet
as an explicit seam: reflection of the ledger's support and mask parameters
has not been authenticated here.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace P4DirectOuterArcAdapterScratch

open ATailCriticalPairFrontier
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourClassCapDistributionScratch
open ATailUniqueFourExactTwoBoundaryScratch
open ATailUniqueFourExactTwoCurvatureScratch
open ATailUniqueFourExactTwoCurvatureScratch.P5CurvatureSource
open Census554.GeneralCarrierBridge

abbrev Label := Fin 11

variable {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
  {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
  {R : OriginalUniqueFourResidual F}
  {profile : S.surplusCap.card = 5 ∧
    S.oppCap1.card = 4 ∧ S.oppCap2.card = 5}
  {distribution : ExactTwoStrictHitDistribution R}

/-- Direct P4 packet together with its source-level curvature projection. -/
structure DirectSource
    (R : OriginalUniqueFourResidual F)
    (profile : S.surplusCap.card = 5 ∧
      S.oppCap1.card = 4 ∧ S.oppCap2.card = 5)
    (distribution : ExactTwoStrictHitDistribution R) : Type where
  packet : P4DirectBoundaryPacket R profile distribution

namespace DirectSource

/-- Forget the P4 cap layout while retaining the actual boundary and selected
rows needed by the generic curvature theorem. -/
def curvature
    (Q : DirectSource R profile distribution) :
    P5CurvatureSource D.A :=
  P5CurvatureSource.ofExactTwoBoundaryCore Q.packet.core

/-- The source row at a critical blocker is the production critical shell.
This is the adapter hook from the P4 core's faithful global pattern to
`CriticalShellSystem`. -/
theorem blockerRow_support_eq_shell
    (Q : DirectSource R profile distribution)
    (q : ℝ²) (hq : q ∈ D.A) :
    (Q.packet.core.carrierPattern.classAt
        (blockerLabel H q hq).1
        (blockerLabel H q hq).2).support =
      (H.selectedAt q hq).toCriticalFourShell.support :=
  blocker_row_support_eq_shell Q.packet.core.carrierPattern H q hq

end DirectSource

/- ## Indexed source atoms and valuation -/

/-- The dense atom `m_center_point`. -/
structure MembershipAtom where
  center : Label
  point : Label
  deriving DecidableEq

/-- The dense atom `row_support_center_point0_point1_point2_point3`, represented
without imposing an arbitrary order on its four displayed points. -/
structure RowSupportAtom where
  center : Label
  support : Finset Label
  deriving DecidableEq

/-- The dense atom `outer_arc_center_side_mask`. -/
structure OuterArcAtom where
  center : Label
  side : OuterSide
  mask : Finset Label
  deriving DecidableEq

namespace OuterArcAtom

/-- The actual geometric arc named by an outer-arc atom. -/
def retainedArc (a : OuterArcAtom) : RetainedOuterArc where
  center := a.center
  side := a.side

end OuterArcAtom

/-- Source valuation of `m_center_point`. -/
def membershipVal {A : Finset ℝ²} (Q : P5CurvatureSource A)
    (a : MembershipAtom) : Prop :=
  a.point ∈ Q.selectedRowSupport a.center

/-- Source valuation of `row_support_center_...`. -/
def rowSupportVal {A : Finset ℝ²} (Q : P5CurvatureSource A)
    (a : RowSupportAtom) : Prop :=
  Q.selectedRowSupport a.center = a.support

/-- Source valuation of `outer_arc_center_side_mask`. -/
def outerArcVal {A : Finset ℝ²} (Q : P5CurvatureSource A)
    (a : OuterArcAtom) : Prop :=
  a.retainedArc.turnMask Q = a.mask

/- ## The three retained direct families -/

/-- Source theorem for every retained
`direct_memberships_imply_row_pattern` clause.

The four positive source memberships exhaust the actual selected row because
both the displayed support and the selected row have cardinality four. -/
theorem direct_memberships_imply_row_pattern
    {A : Finset ℝ²} (Q : P5CurvatureSource A)
    (row : RowSupportAtom)
    (hcard : row.support.card = 4)
    (hmembers :
      ∀ point ∈ row.support,
        membershipVal Q ⟨row.center, point⟩) :
    rowSupportVal Q row := by
  have hsubset :
      row.support ⊆ Q.selectedRowSupport row.center := by
    intro point hpoint
    exact hmembers point hpoint
  have hcardLe :
      (Q.selectedRowSupport row.center).card ≤ row.support.card := by
    rw [Q.selectedRowSupport_card, hcard]
  exact (Finset.eq_of_subset_of_card_le hsubset hcardLe).symm

/-- One authenticated schema instance for
`direct_row_pattern_implies_outer_arc`.

The `source_sound` field is the exact remaining finite-index theorem: for
every source boundary, the encoder's displayed support forces its displayed
turn mask.  It is intentionally stronger than satisfaction for one packet,
so authenticated schema values can be reused on both source branches after
the mirror parameter transport is proved. -/
structure DirectRowArcSchema where
  row : RowSupportAtom
  arc : OuterArcAtom
  same_center : arc.center = row.center
  source_sound :
    ∀ {A : Finset ℝ²} (Q : P5CurvatureSource A),
      rowSupportVal Q row → outerArcVal Q arc

/-- Source theorem for every authenticated
`direct_row_pattern_implies_outer_arc` schema instance. -/
theorem direct_row_pattern_implies_outer_arc
    {A : Finset ℝ²} (Q : P5CurvatureSource A)
    (schema : DirectRowArcSchema)
    (hrow : rowSupportVal Q schema.row) :
    outerArcVal Q schema.arc :=
  schema.source_sound Q hrow

/-- Source theorem for every retained
`direct_no_four_turn_disjoint_outer_arcs` clause.

The static clause generator supplies the six disjointness facts about the
displayed masks.  The four positive atom valuations identify those masks with
the actual source masks, after which the generic shell-curvature theorem
closes the clause. -/
theorem direct_no_four_turn_disjoint_outer_arcs
    {A : Finset ℝ²} (Q : P5CurvatureSource A)
    (a₁ a₂ a₃ a₄ : OuterArcAtom)
    (ha₁ : outerArcVal Q a₁)
    (ha₂ : outerArcVal Q a₂)
    (ha₃ : outerArcVal Q a₃)
    (ha₄ : outerArcVal Q a₄)
    (h₁₂ : Disjoint a₁.mask a₂.mask)
    (h₁₃ : Disjoint a₁.mask a₃.mask)
    (h₁₄ : Disjoint a₁.mask a₄.mask)
    (h₂₃ : Disjoint a₂.mask a₃.mask)
    (h₂₄ : Disjoint a₂.mask a₄.mask)
    (h₃₄ : Disjoint a₃.mask a₄.mask) : False := by
  change a₁.retainedArc.turnMask Q = a₁.mask at ha₁
  change a₂.retainedArc.turnMask Q = a₂.mask at ha₂
  change a₃.retainedArc.turnMask Q = a₃.mask at ha₃
  change a₄.retainedArc.turnMask Q = a₄.mask at ha₄
  apply false_of_four_pairwiseDisjoint_retainedOuterArcMasks Q
    a₁.retainedArc a₂.retainedArc a₃.retainedArc a₄.retainedArc
  · rw [ha₁, ha₂]
    exact h₁₂
  · rw [ha₁, ha₃]
    exact h₁₃
  · rw [ha₁, ha₄]
    exact h₁₄
  · rw [ha₂, ha₃]
    exact h₂₃
  · rw [ha₂, ha₄]
    exact h₂₄
  · rw [ha₃, ha₄]
    exact h₃₄

/- ## Packet entry point and explicit mirror seam -/

/-- The production P4 packet theorem yields either the direct adapter handled
above or the still-explicit mirror packet. -/
theorem nonempty_directSource_or_mirrorPacket
    (R : OriginalUniqueFourResidual F)
    (profile : S.surplusCap.card = 5 ∧
      S.oppCap1.card = 4 ∧ S.oppCap2.card = 5)
    (distribution : ExactTwoStrictHitDistribution R) :
    Nonempty (DirectSource R profile distribution) ∨
      Nonempty (P4MirrorBoundaryPacket R profile distribution) := by
  rcases nonempty_p4DirectBoundaryPacket_or_mirror R profile distribution with
    hdirect | hmirror
  · rcases hdirect with ⟨packet⟩
    exact Or.inl ⟨⟨packet⟩⟩
  · exact Or.inr hmirror

/- ## Authenticated compact-ledger coverage constants -/

def membershipsImplyRowPatternClauseCount : ℕ := 1265
def rowPatternImpliesOuterArcClauseCount : ℕ := 3179
def noFourDisjointOuterArcsClauseCount : ℕ := 6170
def coveredDirectClauseCount : ℕ :=
  membershipsImplyRowPatternClauseCount +
    rowPatternImpliesOuterArcClauseCount +
    noFourDisjointOuterArcsClauseCount

theorem coveredDirectClauseCount_eq : coveredDirectClauseCount = 10614 := by
  norm_num [coveredDirectClauseCount, membershipsImplyRowPatternClauseCount,
    rowPatternImpliesOuterArcClauseCount,
    noFourDisjointOuterArcsClauseCount]

#print axioms DirectSource.blockerRow_support_eq_shell
#print axioms direct_memberships_imply_row_pattern
#print axioms direct_row_pattern_implies_outer_arc
#print axioms direct_no_four_turn_disjoint_outer_arcs
#print axioms nonempty_directSource_or_mirrorPacket
#print axioms coveredDirectClauseCount_eq

end P4DirectOuterArcAdapterScratch
end Problem97
