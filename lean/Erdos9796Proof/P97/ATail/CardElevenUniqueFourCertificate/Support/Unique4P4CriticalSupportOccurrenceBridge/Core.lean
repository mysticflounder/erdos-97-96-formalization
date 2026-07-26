/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.Unique4P4SourceBridge.P4GenericFamilies
import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.Unique4LateChoiceTerminal.UniqueFourLateChoiceTerminal

/-!
# P4 critical-support auxiliary valuation

The compact P4 formula has auxiliary `b_s_c` and `h_s_p` atoms in addition to
the source-faithful row, radius, and first-apex-class atoms.  They need not be
identified with the arbitrary carrier-pattern rows in an exact-two core.

This module gives them the only synchronized meaning required by their
clauses: `h` is the late critical shell of its source, while `b` is true only
when that source is in the first-apex class and the requested center is the
first-apex label.  On this true `b` fiber the late shell is exactly the
first-apex class, which is also the prescribed row of the exact-two core.
-/

namespace Problem97
namespace P4CriticalSupportOccurrenceBridgeScratch

open ATailCriticalPairFrontier
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourClassCapDistributionScratch
open ATailUniqueFourExactTwoBoundaryScratch
open ATailUniqueFourExactTwoSchemaDecoderScratch
open ATailUniqueFourLateChoiceTerminalScratch
open RetainedKalmansonDecoderScratch
open P5IndexedSourceScratch

variable {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
  {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
  {R : OriginalUniqueFourResidual F}
  {distribution : ExactTwoStrictHitDistribution R}

/-- Auxiliary blocker atom.  The compact source only needs a named blocker on
the first-apex fiber; all other blocker atoms are deliberately false. -/
def blockerVal (Q : ExactTwoBoundaryCore R distribution)
    (σ : Label → Label) (source center : Label) : Prop :=
  center = 0 ∧ classHit Q σ source

/-- Auxiliary critical-support atom, interpreted by the selected full shell
of the late first-apex critical system. -/
def criticalSupportVal (Q : ExactTwoBoundaryCore R distribution)
    (σ : Label → Label) (source point : Label) : Prop :=
  Q.boundary (σ point) ∈
    ((lateFirstApexSystem R).selectedAt (Q.boundary (σ source))
      (boundary_mem_carrier Q (σ source))).toCriticalFourShell.support

/-- The five compact atom kinds occurring in the P4 critical-support block.
The source variable number is held separately, because compacting renumbers
only the variables that actually survive the RUP projection. -/
inductive Atom where
  | row (center point : Label)
  | radius (center left right : Label)
  | blocker (source center : Label)
  | firstApexClass (point : Label)
  | support (source point : Label)
deriving DecidableEq

/-- Source interpretation of an atom under either P4 boundary orientation. -/
def interpAtom (Q : ExactTwoBoundaryCore R distribution) (σ : Label → Label) :
    Atom → Prop
  | .row center point => rowMem Q σ center point
  | .radius center left right => radiusEq Q σ center left right
  | .blocker source center => blockerVal Q σ source center
  | .firstApexClass point => classHit Q σ point
  | .support source point => criticalSupportVal Q σ source point

/-- An authenticated compact variable together with its source atom. -/
structure Binding where
  var : Nat
  atom : Atom
deriving DecidableEq

/-- A signed occurrence of an authenticated compact atom. -/
structure SignedBinding where
  binding : Binding
  positive : Bool
deriving DecidableEq

def SignedBinding.literal (occurrence : SignedBinding) : Int :=
  if occurrence.positive then occurrence.binding.var else -occurrence.binding.var

theorem blockerVal_zero_iff (Q : ExactTwoBoundaryCore R distribution)
    (σ : Label → Label) (source : Label) :
    blockerVal Q σ source 0 ↔ classHit Q σ source := by
  simp [blockerVal]

theorem blockerVal_false_of_center_ne_zero
    (Q : ExactTwoBoundaryCore R distribution) (σ : Label → Label)
    {source center : Label} (hcenter : center ≠ 0) :
    ¬ blockerVal Q σ source center := by
  simp [blockerVal, hcenter]

/-- Every late critical support contains its own source. -/
theorem criticalSupportVal_source
    (Q : ExactTwoBoundaryCore R distribution) (σ : Label → Label)
    (source : Label) : criticalSupportVal Q σ source source := by
  unfold criticalSupportVal
  simpa [CriticalSelectedFourClass.toSelectedFourClass,
    CriticalFourShell.toSelectedFourClass] using
    (CriticalShellSystem.source_mem_selectedFourClass
      (lateFirstApexSystem R) (Q.boundary (σ source))
      (boundary_mem_carrier Q (σ source))
      ((lateFirstApexSystem R).selectedAt (Q.boundary (σ source))
        (boundary_mem_carrier Q (σ source))).toSelectedFourClass)

/-- A late critical support whose source is in the first-apex class is itself
that class. -/
theorem classHit_of_criticalSupportVal
    (Q : ExactTwoBoundaryCore R distribution) (σ : Label → Label)
    {source point : Label}
    (hsource : classHit Q σ source)
    (hpoint : criticalSupportVal Q σ source point) :
    classHit Q σ point := by
  unfold classHit at hsource ⊢
  unfold criticalSupportVal at hpoint
  have hsupport := lateFirstApexSystem_support_eq_class R
    (boundary_mem_carrier Q (σ source)) hsource
  rw [hsupport] at hpoint
  exact hpoint

/-- When the source and point lie in the first-apex class, the selected late
critical support of the source contains the point. -/
theorem criticalSupportVal_of_classHits
    (Q : ExactTwoBoundaryCore R distribution) (σ : Label → Label)
    {source point : Label}
    (hsource : classHit Q σ source) (hpoint : classHit Q σ point) :
    criticalSupportVal Q σ source point := by
  unfold criticalSupportVal
  rw [lateFirstApexSystem_support_eq_class R
    (boundary_mem_carrier Q (σ source)) hsource]
  exact hpoint

/-- On the only true blocker fiber, the late critical support is the exact
first-apex row stored in the exact-two source core. -/
theorem rowMem_of_blockerVal_criticalSupportVal
    (Q : ExactTwoBoundaryCore R distribution) (σ : Label → Label)
    (hσzero : σ 0 = 0) {source point : Label}
    (hblocker : blockerVal Q σ source 0)
    (hsupport : criticalSupportVal Q σ source point) :
    rowMem Q σ 0 point := by
  have hsource : classHit Q σ source := (blockerVal_zero_iff Q σ source).mp hblocker
  have hpoint : classHit Q σ point :=
    classHit_of_criticalSupportVal Q σ hsource hsupport
  unfold rowMem
  unfold classHit at hpoint
  rw [classAt_transported_zero_support Q hσzero]
  exact hpoint

/-- Conversely, on the true first-apex blocker fiber, a prescribed row member
belongs to the late critical support.  This is the reverse direction of the
row/support compact equivalence. -/
theorem criticalSupportVal_of_blockerVal_rowMem
    (Q : ExactTwoBoundaryCore R distribution) (σ : Label → Label)
    (hσzero : σ 0 = 0) {source point : Label}
    (hblocker : blockerVal Q σ source 0)
    (hrow : rowMem Q σ 0 point) :
    criticalSupportVal Q σ source point := by
  have hsource : classHit Q σ source :=
    (blockerVal_zero_iff Q σ source).mp hblocker
  have hpoint : classHit Q σ point := by
    unfold rowMem at hrow
    unfold classHit
    rw [classAt_transported_zero_support Q hσzero] at hrow
    exact hrow
  unfold criticalSupportVal
  rw [lateFirstApexSystem_support_eq_class R
    (boundary_mem_carrier Q (σ source)) hsource]
  exact hpoint

/-- A radius equality about the first apex sends a class source into its late
critical support.  This supplies the `b ∧ eq → h` compact clauses. -/
theorem criticalSupportVal_of_blockerVal_radiusEq
    (Q : ExactTwoBoundaryCore R distribution) (σ : Label → Label)
    (hσzero : σ 0 = 0) {source point : Label}
    (hblocker : blockerVal Q σ source 0)
    (heq : radiusEq Q σ 0 source point) :
    criticalSupportVal Q σ source point := by
  have hsource : classHit Q σ source :=
    (blockerVal_zero_iff Q σ source).mp hblocker
  have heq' : dist S.oppApex1 (Q.boundary (σ source)) =
      dist S.oppApex1 (Q.boundary (σ point)) := by
    simpa only [radiusEq, hσzero, Q.boundary_zero] using heq
  have hpoint : classHit Q σ point := by
    unfold classHit
    refine mem_selectedClass.mpr ⟨boundary_mem_carrier Q (σ point), ?_⟩
    exact heq'.symm.trans (mem_selectedClass.mp hsource).2
  unfold criticalSupportVal
  rw [lateFirstApexSystem_support_eq_class R
    (boundary_mem_carrier Q (σ source)) hsource]
  exact hpoint

/-- The first apex itself is outside every true auxiliary critical support. -/
theorem not_criticalSupportVal_zero_of_blockerVal
    (Q : ExactTwoBoundaryCore R distribution) (σ : Label → Label)
    (hσzero : σ 0 = 0) {source : Label}
    (hblocker : blockerVal Q σ source 0) :
    ¬ criticalSupportVal Q σ source 0 := by
  intro hsupport
  have hsource : classHit Q σ source :=
    (blockerVal_zero_iff Q σ source).mp hblocker
  unfold criticalSupportVal at hsupport
  rw [lateFirstApexSystem_support_eq_class R
    (boundary_mem_carrier Q (σ source)) hsource] at hsupport
  rw [hσzero, Q.boundary_zero] at hsupport
  have hzeroRadius : (0 : ℝ) = radius := by
    simpa using (mem_selectedClass.mp hsupport).2
  exact (ne_of_gt (frontier_radius_pos F)) hzeroRadius.symm

/-- Two first-apex class hits have equal first-apex radii. -/
theorem radiusEq_zero_of_classHits
    (Q : ExactTwoBoundaryCore R distribution) (σ : Label → Label)
    (hσzero : σ 0 = 0) {left right : Label}
    (hleft : classHit Q σ left) (hright : classHit Q σ right) :
    radiusEq Q σ 0 left right := by
  unfold classHit at hleft hright
  unfold radiusEq
  rw [hσzero, Q.boundary_zero]
  exact (mem_selectedClass.mp hleft).2.trans
    (mem_selectedClass.mp hright).2.symm

/-- A cover of one late critical support by boundary labels bounds its
cardinality.  The transport is stated abstractly so the direct and reflected
P4 orientations can share the finite complement argument. -/
theorem criticalSupport_card_le_of_cover
    (Q : ExactTwoBoundaryCore R distribution) (σ : Label → Label)
    (hσinj : Function.Injective σ) (hσsurj : Function.Surjective σ)
    (source : Label) (T : Finset Label)
    (hcover : ∀ point : Label, criticalSupportVal Q σ source point → point ∈ T) :
    ((lateFirstApexSystem R).selectedAt (Q.boundary (σ source))
      (boundary_mem_carrier Q (σ source))).toCriticalFourShell.support.card ≤ T.card := by
  let K := ((lateFirstApexSystem R).selectedAt (Q.boundary (σ source))
    (boundary_mem_carrier Q (σ source))).toCriticalFourShell
  have hsubset : K.support ⊆ T.image (fun point => Q.boundary (σ point)) := by
    intro z hz
    have hzA : z ∈ D.A := K.support_subset_A hz
    rw [← Q.boundary_image] at hzA
    rcases Finset.mem_image.mp hzA with ⟨i, _hi, rfl⟩
    rcases hσsurj i with ⟨point, hpoint⟩
    refine Finset.mem_image.mpr ⟨point, hcover point ?_, ?_⟩
    · unfold criticalSupportVal
      change Q.boundary (σ point) ∈ K.support
      rw [hpoint]
      exact hz
    · simp only [hpoint]
  have htransportInj : Function.Injective (fun point => Q.boundary (σ point)) := by
    intro left right heq
    exact hσinj (Q.boundary_injective heq)
  change K.support.card ≤ T.card
  calc
    K.support.card ≤ (T.image fun point => Q.boundary (σ point)).card :=
      Finset.card_le_card hsubset
    _ = T.card := Finset.card_image_of_injective _ htransportInj

/-- A late critical support cannot be covered by fewer than four transported
boundary labels. -/
theorem false_of_criticalSupport_cover_card_lt_four
    (Q : ExactTwoBoundaryCore R distribution) (σ : Label → Label)
    (hσinj : Function.Injective σ) (hσsurj : Function.Surjective σ)
    (source : Label) (T : Finset Label) (hTcard : T.card < 4)
    (hcover : ∀ point : Label, criticalSupportVal Q σ source point → point ∈ T) :
    False := by
  have hle := criticalSupport_card_le_of_cover Q σ hσinj hσsurj source T hcover
  have hcard :
      ((lateFirstApexSystem R).selectedAt (Q.boundary (σ source))
        (boundary_mem_carrier Q (σ source))).toCriticalFourShell.support.card = 4 :=
    ((lateFirstApexSystem R).selectedAt (Q.boundary (σ source))
      (boundary_mem_carrier Q (σ source))).toCriticalFourShell.support_card
  omega

end P4CriticalSupportOccurrenceBridgeScratch
end Problem97
