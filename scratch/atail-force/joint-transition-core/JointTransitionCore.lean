/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import ThirdRowProfileBank
import RobustClassifierTarget
import EquilateralSecondGeneration
import ParentFalseSurface
import ContinuationGeometryClassifier

/-!
# Scratch: the A-TAIL joint transition core

This file composes the live third-row normal form, the retained-critical-map
blocker classifier, the second-generation q-deleted-row producer, and the
equilateral continuation geometry.  It deliberately stops at an explicit
`JointTransitionCoreEliminator`: none of the imported results proves that
eliminator.

The parent leaf uses a locally constructed surplus packet `S`, not necessarily
`D.packet`.  `rebasePacket D S` makes that transport explicit and all adapters
below are checked over the rebased datum; no packet equality is assumed.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailJointTransitionCoreScratch

open ATailThirdRowProfileBankScratch
open ATailRobustClassifierTargetScratch
open ATailEquilateralSecondGenerationScratch
open ATailContinuationGeometryClassifier

attribute [local instance] Classical.propDecidable

/-- Replace only the surplus packet.  The carrier, convexity, and global-K4
data are definitionally the corresponding fields of `D`. -/
def rebasePacket (D : CounterexampleData) (S : SurplusCapPacket D.A) :
    CounterexampleData :=
  { A := D.A
    nonempty := D.nonempty
    convex := D.convex
    K4 := D.K4
    packet := S }

@[simp] theorem rebasePacket_A
    (D : CounterexampleData) (S : SurplusCapPacket D.A) :
    (rebasePacket D S).A = D.A := rfl

@[simp] theorem rebasePacket_packet
    (D : CounterexampleData) (S : SurplusCapPacket D.A) :
    (rebasePacket D S).packet = S := rfl

@[simp] theorem rebasePacket_nonempty
    (D : CounterexampleData) (S : SurplusCapPacket D.A) :
    (rebasePacket D S).nonempty = D.nonempty := rfl

@[simp] theorem rebasePacket_convex
    (D : CounterexampleData) (S : SurplusCapPacket D.A) :
    (rebasePacket D S).convex = D.convex := rfl

@[simp] theorem rebasePacket_K4
    (D : CounterexampleData) (S : SurplusCapPacket D.A) :
    (rebasePacket D S).K4 = D.K4 := rfl

/-- The branch in which the generated row hits no pair among the two
continuation centers and the opposite apex. -/
def LowHit {A : Finset ℝ²} {center : ℝ²}
    (K : SelectedFourClass A center) (x y a : ℝ²) : Prop :=
  ¬ ((x ∈ K.support ∧ y ∈ K.support) ∨
      (x ∈ K.support ∧ a ∈ K.support) ∨
      (y ∈ K.support ∧ a ∈ K.support))

/-- The choice-safe retained-critical-map output for both endpoints of a
realizable common-pair profile. -/
def TwoEndpointBlockerOutcome
    {A : Finset ℝ²}
    (H : CriticalShellSystem A)
    {source partner center₁ : ℝ²}
    (center₂ : ℝ²)
    (K : SelectedFourClass A center₁)
    (hsource : source ∈ K.support)
    (hpartner : partner ∈ K.support) : Prop :=
  (HasNEquidistantPointsAt 4 (A.erase partner)
        (H.centerAt source (K.support_subset_A hsource)) ∨
      H.centerAt source (K.support_subset_A hsource) = center₁ ∨
      H.centerAt source (K.support_subset_A hsource) = center₂) ∧
    (HasNEquidistantPointsAt 4 (A.erase source)
        (H.centerAt partner (K.support_subset_A hpartner)) ∨
      H.centerAt partner (K.support_subset_A hpartner) = center₁ ∨
      H.centerAt partner (K.support_subset_A hpartner) = center₂)

/-- Total realizability-safe state of one generated row.

The two apex-pair branches retain the blocker outcomes; neither is declared
impossible. -/
def ThirdRowTransition
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    (H : CriticalShellSystem D.A)
    {x y b : ℝ²}
    (_P : EquilateralRows D.A x y S.oppApex2)
    (Kb : SelectedFourClass D.A b) : Prop :=
  LowHit Kb x y S.oppApex2 ∨
    (∃ hx : x ∈ Kb.support,
      ∃ ha : S.oppApex2 ∈ Kb.support,
        y ∉ Kb.support ∧
          TwoEndpointBlockerOutcome H y Kb hx ha) ∨
    (∃ hy : y ∈ Kb.support,
      ∃ ha : S.oppApex2 ∈ Kb.support,
        x ∉ Kb.support ∧
          TwoEndpointBlockerOutcome H x Kb hy ha)

/-- Compose the live third-row profile classifier with the robust blocker
classifier.  For `{x, O2}` the second carrier is `P.rowY` (center `y`); for
`{y, O2}` it is `P.rowX` (center `x`). -/
theorem thirdRowTransition_of_live_profile
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    (H : CriticalShellSystem D.A)
    {x y b : ℝ²}
    (P : EquilateralRows D.A x y S.oppApex2)
    (Kb : SelectedFourClass D.A b)
    (hbOld : b ∈ P.rowX.support ∨ b ∈ P.rowY.support)
    (hab : S.oppApex2 ≠ b)
    (hxStrict : x ∈ S.oppCap2 \ (S.surplusCap ∪ S.oppCap1))
    (hyStrict : y ∈ S.oppCap2 \ (S.surplusCap ∪ S.oppCap1))
    (hbOutside : b ∉ S.oppCap2) :
    ThirdRowTransition D S H P Kb := by
  have hbA : b ∈ D.A := by
    rcases hbOld with hbX | hbY
    · exact P.rowX.support_subset_A hbX
    · exact P.rowY.support_subset_A hbY
  have hprofile :=
    low_hit_or_live_apex_pair_profile
      D S P Kb hbOld hab hxStrict hyStrict hbOutside
  rcases hprofile with hlow | hxa | hya
  · exact Or.inl hlow
  · refine Or.inr (Or.inl ⟨hxa.1, hxa.2.1, hxa.2.2, ?_⟩)
    have hby : b ≠ y := by
      intro h
      apply hbOutside
      simpa [h] using (Finset.mem_sdiff.mp hyStrict).1
    exact selected_commonPair_two_source_blocker_classifier
      (D := rebasePacket D S) H Kb P.rowY
      hxa.1 hxa.2.1 P.x_mem_rowY P.a_mem_rowY
      P.x_ne_a hbA (P.rowX.support_subset_A P.y_mem_rowX) hby
  · refine Or.inr (Or.inr ⟨hya.1, hya.2.1, hya.2.2, ?_⟩)
    have hbx : b ≠ x := by
      intro h
      apply hbOutside
      simpa [h] using (Finset.mem_sdiff.mp hxStrict).1
    exact selected_commonPair_two_source_blocker_classifier
      (D := rebasePacket D S) H Kb P.rowX
      hya.1 hya.2.1 P.y_mem_rowX P.a_mem_rowX
      P.y_ne_a hbA (P.rowY.support_subset_A P.x_mem_rowY) hbx

/-- The derived data at two divergent outside members of the continuation
rows.  This is the finite joint state that the missing producer must consume. -/
structure JointTransitionPacket
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    (H : CriticalShellSystem D.A)
    {x y u v : ℝ²}
    (P : EquilateralRows D.A x y S.oppApex2)
    (Ku : SelectedFourClass D.A u)
    (Kv : SelectedFourClass D.A v) : Prop where
  x_strict : x ∈ S.oppCap2 \ (S.surplusCap ∪ S.oppCap1)
  y_strict : y ∈ S.oppCap2 \ (S.surplusCap ∪ S.oppCap1)
  u_mem_rowX : u ∈ P.rowX.support
  u_not_mem_rowY : u ∉ P.rowY.support
  u_outside : u ∉ S.oppCap2
  v_mem_rowY : v ∈ P.rowY.support
  v_not_mem_rowX : v ∉ P.rowX.support
  v_outside : v ∉ S.oppCap2
  u_transition : ThirdRowTransition D S H P Ku
  v_transition : ThirdRowTransition D S H P Kv
  u_deleted_row :
    Nonempty (ThreeAnchorDeletedK4Row (rebasePacket D S)
      y x S.oppApex2 u)
  v_deleted_row :
    Nonempty (ThreeAnchorDeletedK4Row (rebasePacket D S)
      x y S.oppApex2 v)

/-- Once the two divergent members and their generated rows are named, all
fields of `JointTransitionPacket` follow from the current theorem bank. -/
theorem jointTransitionPacket_of_divergent_rows
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    (H : CriticalShellSystem D.A)
    {x y u v : ℝ²}
    (P : EquilateralRows D.A x y S.oppApex2)
    (Ku : SelectedFourClass D.A u)
    (Kv : SelectedFourClass D.A v)
    (hxStrict : x ∈ S.oppCap2 \ (S.surplusCap ∪ S.oppCap1))
    (hyStrict : y ∈ S.oppCap2 \ (S.surplusCap ∪ S.oppCap1))
    (huX : u ∈ P.rowX.support)
    (huNotY : u ∉ P.rowY.support)
    (huOutside : u ∉ S.oppCap2)
    (hvY : v ∈ P.rowY.support)
    (hvNotX : v ∉ P.rowX.support)
    (hvOutside : v ∉ S.oppCap2) :
    JointTransitionPacket D S H P Ku Kv := by
  have hau : S.oppApex2 ≠ u := by
    intro h
    subst u
    exact huNotY P.a_mem_rowY
  have hav : S.oppApex2 ≠ v := by
    intro h
    subst v
    exact hvNotX P.a_mem_rowX
  have huTransition := thirdRowTransition_of_live_profile
    D S H P Ku (Or.inl huX) hau hxStrict hyStrict huOutside
  have hvTransition := thirdRowTransition_of_live_profile
    D S H P Kv (Or.inr hvY) hav hxStrict hyStrict hvOutside
  have hdeleted := nonempty_paired_threeAnchorDeletedK4Rows
    (rebasePacket D S) P.rowX P.rowY
    P.y_mem_rowX P.a_mem_rowX P.x_mem_rowY P.a_mem_rowY huX hvY
  exact
    { x_strict := hxStrict
      y_strict := hyStrict
      u_mem_rowX := huX
      u_not_mem_rowY := huNotY
      u_outside := huOutside
      v_mem_rowY := hvY
      v_not_mem_rowX := hvNotX
      v_outside := hvOutside
      u_transition := huTransition
      v_transition := hvTransition
      u_deleted_row := hdeleted.1
      v_deleted_row := hdeleted.2 }

/-- Convert the equilateral arm of continuation geometry into the row
interface used by the third-row bank. -/
def equilateralRowsOfResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {K : SelectedFourClass D.A S.oppApex2}
    (C : TwoContinuationRows (rebasePacket D S) K)
    (h : C.EquilateralResidual) :
    EquilateralRows D.A C.z₁ C.z₂ S.oppApex2 :=
  { rowX := C.row₁
    rowY := C.row₂
    y_mem_rowX := h.2.1
    a_mem_rowX := h.2.2.2.1
    x_mem_rowY := h.2.2.1
    a_mem_rowY := h.2.2.2.2.1 }

/-- The continuation-geometry equilateral residual supplies a complete joint
transition packet after two routine global-K4 choices. -/
theorem exists_jointTransitionPacket_of_equilateralResidual
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    (H : CriticalShellSystem D.A)
    {K : SelectedFourClass D.A S.oppApex2}
    (C : TwoContinuationRows (rebasePacket D S) K)
    (h : C.EquilateralResidual) :
    ∃ u v : ℝ²,
      ∃ Ku : SelectedFourClass D.A u,
      ∃ Kv : SelectedFourClass D.A v,
        JointTransitionPacket D S H (equilateralRowsOfResidual C h) Ku Kv := by
  rcases C.exists_divergent_outside_witnesses with
    ⟨u, v, hu, huNotY, hv, hvNotX⟩
  have huX : u ∈ C.row₁.support := (Finset.mem_sdiff.mp hu).1
  have huOutside : u ∉ S.oppCap2 := by
    simpa [rebasePacket] using (Finset.mem_sdiff.mp hu).2
  have hvY : v ∈ C.row₂.support := (Finset.mem_sdiff.mp hv).1
  have hvOutside : v ∉ S.oppCap2 := by
    simpa [rebasePacket] using (Finset.mem_sdiff.mp hv).2
  let Ku := Classical.choice
    (exists_selectedFourClass_of_globalK4 D.K4
      (C.row₁.support_subset_A huX))
  let Kv := Classical.choice
    (exists_selectedFourClass_of_globalK4 D.K4
      (C.row₂.support_subset_A hvY))
  have hxStrict : C.z₁ ∈
      S.oppCap2 \ (S.surplusCap ∪ S.oppCap1) := by
    simpa [rebasePacket] using (Finset.mem_inter.mp C.z₁_mem).2
  have hyStrict : C.z₂ ∈
      S.oppCap2 \ (S.surplusCap ∪ S.oppCap1) := by
    simpa [rebasePacket] using (Finset.mem_inter.mp C.z₂_mem).2
  exact ⟨u, v, Ku, Kv,
    jointTransitionPacket_of_divergent_rows D S H
      (equilateralRowsOfResidual C h) Ku Kv
      hxStrict hyStrict huX huNotY huOutside hvY hvNotX hvOutside⟩

/-- The precise still-unproved producer data for the equilateral joint arm.

A proof may use the full parent MEC/cap/no-M44 hypotheses to construct this
function.  This abbreviation does not assert such a function exists. -/
abbrev JointTransitionCoreEliminator
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    (H : CriticalShellSystem D.A) : Prop :=
  ∀ {K : SelectedFourClass D.A S.oppApex2}
      (C : TwoContinuationRows (rebasePacket D S) K)
      (h : C.EquilateralResidual)
      {u v : ℝ²}
      (Ku : SelectedFourClass D.A u)
      (Kv : SelectedFourClass D.A v),
    JointTransitionPacket D S H (equilateralRowsOfResidual C h) Ku Kv → False

/-- Consumer adapter: the explicit joint eliminator closes every equilateral
continuation residual because the existing producers build its input. -/
theorem false_of_equilateralResidual_of_jointTransitionCoreEliminator
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    (H : CriticalShellSystem D.A)
    (eliminate : JointTransitionCoreEliminator D S H)
    {K : SelectedFourClass D.A S.oppApex2}
    (C : TwoContinuationRows (rebasePacket D S) K)
    (h : C.EquilateralResidual) : False := by
  rcases exists_jointTransitionPacket_of_equilateralResidual D S H C h with
    ⟨u, v, Ku, Kv, J⟩
  exact eliminate C h Ku Kv J

#print axioms thirdRowTransition_of_live_profile
#print axioms jointTransitionPacket_of_divergent_rows
#print axioms equilateralRowsOfResidual
#print axioms exists_jointTransitionPacket_of_equilateralResidual
#print axioms false_of_equilateralResidual_of_jointTransitionCoreEliminator

end ATailJointTransitionCoreScratch
end Problem97
