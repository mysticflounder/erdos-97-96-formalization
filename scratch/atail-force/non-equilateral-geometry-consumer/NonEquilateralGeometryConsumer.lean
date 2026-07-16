/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import NonEquilateralFullParentReduction

/-!
# Scratch: geometric terminal for the non-equilateral continuation

This file couples the native non-equilateral reduction to the actual
second-large-cap witness.  It also upgrades the exclusive strict-cap arm from
mere support incidences to a metric hinge: each strict witness is at the
center-chord radius from its own continuation center, while ordered-cap
geometry forces it off that radius from the other center.

The resulting terminal is not contradictory.  Its two remaining arms are a
surplus-heavy native row and a pair of one-sided strict-cap hinges.  The latter
still needs a reverse selected-row incidence (or an equivalent bank-pattern
completion); global K4 supplies a row at the strict witness but does not by
itself prescribe any member of that row.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailNonEquilateralGeometryConsumerScratch

open ATailContinuationCapOrderClassifierScratch
open ATailContinuationGeometryClassifier
open ATailCriticalPairFrontier
open ATailFrontierContinuationDispatcherScratch
open ATailJointTransitionCoreScratch
open ATailLateCriticalSystemSurfaceScratch
open ATailNonEquilateralFullParentReductionScratch
open ATailNonEquilateralParentProducerScratch
open U1LargeCapRouteBTailMetricResidualTarget

attribute [local instance] Classical.propDecidable

/-- The two support-heavy alternatives, with the unchanged native rows. -/
def SurplusHeavyNativeRow
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {K : SelectedFourClass D.A S.oppApex2}
    (P : TwoContinuationRows (rebasePacket D S) K) : Prop :=
  2 ≤ (P.row₁.support ∩ S.surplusCap).card ∨
    2 ≤ (P.row₂.support ∩ S.surplusCap).card

/-- Exact metric content of the exclusive strict-`oppCap1` arm.

The two witnesses lie on different native rows.  Each witness is at the
center-chord radius from its own row center.  The MEC ordered-cap separator
forces the cross distance to differ from that radius. -/
structure StrictWitnessMetricHinge
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {K : SelectedFourClass D.A S.oppApex2}
    {P : TwoContinuationRows (rebasePacket D S) K}
    (N : NonEquilateralOutput H P) : Type where
  x : ℝ²
  y : ℝ²
  x_mem_row₁ : x ∈ P.row₁.support
  x_not_mem_row₂ : x ∉ P.row₂.support
  x_strict_oppCap1 : x ∈ strictOppCap1Region S
  y_mem_row₂ : y ∈ P.row₂.support
  y_not_mem_row₁ : y ∉ P.row₁.support
  y_strict_oppCap1 : y ∈ strictOppCap1Region S
  x_ne_y : x ≠ y
  x_ne_z₁ : x ≠ P.z₁
  y_ne_z₂ : y ≠ P.z₂
  x_to_z₁_eq_chord : dist x P.z₁ = dist P.z₁ P.z₂
  x_to_z₂_ne_chord : dist x P.z₂ ≠ dist P.z₁ P.z₂
  y_to_z₂_eq_chord : dist y P.z₂ = dist P.z₁ P.z₂
  y_to_z₁_ne_chord : dist y P.z₁ ≠ dist P.z₁ P.z₂

private theorem nonempty_strictWitnessMetricHinge
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {K : SelectedFourClass D.A S.oppApex2}
    {P : TwoContinuationRows (rebasePacket D S) K}
    (N : NonEquilateralOutput H P)
    {x y : ℝ²}
    (hx₁ : x ∈ P.row₁.support)
    (hx₂ : x ∉ P.row₂.support)
    (hxStrict : x ∈ strictOppCap1Region S)
    (hy₂ : y ∈ P.row₂.support)
    (hy₁ : y ∉ P.row₁.support)
    (hyStrict : y ∈ strictOppCap1Region S)
    (hxy : x ≠ y) :
    Nonempty (StrictWitnessMetricHinge N) := by
  rcases N.residual with
    ⟨_hd, _hz₂, _hz₁, hradius₁, hradius₂, _hapex₁, _hapex₂⟩
  have hxEq : dist x P.z₁ = dist P.z₁ P.z₂ := by
    calc
      dist x P.z₁ = dist P.z₁ x := dist_comm _ _
      _ = P.row₁.radius := P.row₁.support_eq_radius x hx₁
      _ = dist P.z₁ P.z₂ := hradius₁
  have hyEq : dist y P.z₂ = dist P.z₁ P.z₂ := by
    calc
      dist y P.z₂ = dist P.z₂ y := dist_comm _ _
      _ = P.row₂.radius := P.row₂.support_eq_radius y hy₂
      _ = dist P.z₁ P.z₂ := hradius₂
  have hxSep : dist x P.z₁ ≠ dist x P.z₂ := by
    exact firstCap_center_separates_secondApex_pair
      (rebasePacket D S) K P.z₁_mem P.z₂_mem P.z₁_ne_z₂
        (by simpa [strictOppCap1Region] using hxStrict)
  have hySep : dist y P.z₁ ≠ dist y P.z₂ := by
    exact firstCap_center_separates_secondApex_pair
      (rebasePacket D S) K P.z₁_mem P.z₂_mem P.z₁_ne_z₂
        (by simpa [strictOppCap1Region] using hyStrict)
  exact ⟨{
    x := x
    y := y
    x_mem_row₁ := hx₁
    x_not_mem_row₂ := hx₂
    x_strict_oppCap1 := hxStrict
    y_mem_row₂ := hy₂
    y_not_mem_row₁ := hy₁
    y_strict_oppCap1 := hyStrict
    x_ne_y := hxy
    x_ne_z₁ := fun hxz => P.row₁.center_not_mem (hxz ▸ hx₁)
    y_ne_z₂ := fun hyz => P.row₂.center_not_mem (hyz ▸ hy₂)
    x_to_z₁_eq_chord := hxEq
    x_to_z₂_ne_chord := by
      intro hxCross
      exact hxSep (hxEq.trans hxCross.symm)
    y_to_z₂_eq_chord := hyEq
    y_to_z₁_ne_chord := by
      intro hyCross
      exact hySep (hyCross.trans hyEq.symm) }⟩

/-- The support dichotomy with all available cap-order metric content exposed.
No universal common-hit or reverse-incidence producer is inserted. -/
theorem surplusHeavy_or_strictWitnessMetricHinge
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {K : SelectedFourClass D.A S.oppApex2}
    {P : TwoContinuationRows (rebasePacket D S) K}
    (N : NonEquilateralOutput H P) :
    SurplusHeavyNativeRow P ∨
      Nonempty (StrictWitnessMetricHinge N) := by
  rcases nonEquilateralSupportDichotomy N with
    hheavy₁ | hheavy₂ | ⟨x, y, hx₁, hx₂, hxStrict,
      hy₂, hy₁, hyStrict, hxy⟩
  · exact Or.inl (Or.inl hheavy₁)
  · exact Or.inl (Or.inr hheavy₂)
  · exact Or.inr (nonempty_strictWitnessMetricHinge N
      hx₁ hx₂ hxStrict hy₂ hy₁ hyStrict hxy)

/-- The exact five-point metric hypotheses consumed by the sibling theorem
`u1TwoLargeCapObstruction`.  They are recorded locally because that source
theorem is not import-reachable in this worktree. -/
structure U1TwoLargeCapHypotheses (a c d e f : ℝ²) : Prop where
  a_ne_c : a ≠ c
  c_a_eq_c_d : dist c a = dist c d
  c_a_eq_c_f : dist c a = dist c f
  d_c_eq_d_e : dist d c = dist d e
  d_c_eq_d_f : dist d c = dist d f
  f_a_eq_f_d : dist f a = dist f d
  f_a_eq_f_e : dist f a = dist f e
  e_a_eq_e_c : dist e a = dist e c

/-- The missing producer interface for the natural strict-terminal embedding
`(a,c,d,e) = (x,z₁,z₂,y)`.  Native row membership supplies the first four
circle equalities once a common point `f` is produced; only the two
`f`-centered and one `y`-centered reverse equalities remain explicit. -/
structure StrictWitnessBankCompletion
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {K : SelectedFourClass D.A S.oppApex2}
    {P : TwoContinuationRows (rebasePacket D S) K}
    {N : NonEquilateralOutput H P}
    (T : StrictWitnessMetricHinge N) : Type where
  f : ℝ²
  f_mem_row₁ : f ∈ P.row₁.support
  f_mem_row₂ : f ∈ P.row₂.support
  f_x_eq_f_z₂ : dist f T.x = dist f P.z₂
  f_x_eq_f_y : dist f T.x = dist f T.y
  y_x_eq_y_z₁ : dist T.y T.x = dist T.y P.z₁

/-- A completion of the explicit producer interface gives exactly all seven
equalities and the inequality required by `u1TwoLargeCapObstruction`. -/
theorem u1TwoLargeCapHypotheses_of_strictWitnessBankCompletion
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {K : SelectedFourClass D.A S.oppApex2}
    {P : TwoContinuationRows (rebasePacket D S) K}
    {N : NonEquilateralOutput H P}
    (T : StrictWitnessMetricHinge N)
    (C : StrictWitnessBankCompletion T) :
    U1TwoLargeCapHypotheses T.x P.z₁ P.z₂ T.y C.f := by
  rcases N.residual with
    ⟨_hd, hz₂, hz₁, _hradius₁, _hradius₂, _hapex₁, _hapex₂⟩
  exact {
    a_ne_c := T.x_ne_z₁
    c_a_eq_c_d :=
      (P.row₁.support_eq_radius T.x T.x_mem_row₁).trans
        (P.row₁.support_eq_radius P.z₂ hz₂).symm
    c_a_eq_c_f :=
      (P.row₁.support_eq_radius T.x T.x_mem_row₁).trans
        (P.row₁.support_eq_radius C.f C.f_mem_row₁).symm
    d_c_eq_d_e :=
      (P.row₂.support_eq_radius P.z₁ hz₁).trans
        (P.row₂.support_eq_radius T.y T.y_mem_row₂).symm
    d_c_eq_d_f :=
      (P.row₂.support_eq_radius P.z₁ hz₁).trans
        (P.row₂.support_eq_radius C.f C.f_mem_row₂).symm
    f_a_eq_f_d := C.f_x_eq_f_z₂
    f_a_eq_f_e := C.f_x_eq_f_y
    e_a_eq_e_c := C.y_x_eq_y_z₁ }

/-- The no-`IsM44` cap datum expressed on the exact leaf packet used by the
continuation: at least one of its two opposite caps is genuinely large. -/
def OppositeLargeCapLocation
    {A : Finset ℝ²} (S : SurplusCapPacket A) : Prop :=
  5 ≤ S.oppCap1.card ∨ 5 ≤ S.oppCap2.card

theorem oppositeLargeCapLocation_of_leaf_noM44
    {D : CounterexampleData}
    {hncol : ¬ Collinear ℝ (D.A : Set ℝ²)}
    (MT : MEC.NonObtuseCircumscribedMoserTriangle D.A D.nonempty hncol)
    (hCirc : ∃ h12 h23 h13,
      MT.toMoserTriangle.case_split = Or.inl ⟨h12, h23, h13⟩)
    {M : MoserTriangle D.A} (CP : CapTriple D.A M) (i : Fin 3)
    (hM : M = MT.toMoserTriangle.toStructural hCirc)
    (hsurplus : 4 < (CP.capAt i).card)
    (hNoM44 : ¬ ∃ S : SurplusCapPacket D.A, S.IsM44)
    {S : SurplusCapPacket D.A}
    (hS : S = leafSurplusPacket MT hCirc CP i hM hsurplus) :
    OppositeLargeCapLocation S := by
  subst hM
  subst S
  have hLower := oppositeCapLowerBoundsAt_of_circumscribed
    MT hCirc CP rfl i
  have hNotM44 :
      ¬ (leafSurplusPacket MT hCirc CP i rfl hsurplus).IsM44 := by
    intro hM44
    exact hNoM44 ⟨leafSurplusPacket MT hCirc CP i rfl hsurplus, hM44⟩
  fin_cases i <;>
    simp [OppositeLargeCapLocation, leafSurplusPacket,
      SurplusCapPacket.IsM44, SurplusCapPacket.oppCap1,
      SurplusCapPacket.oppCap2, OppositeCapLowerBoundsAt] at hLower hNotM44 ⊢ <;>
    omega

/-- Exact non-equilateral terminal after coupling the genuine large-cap datum
to the native critical expansion. -/
structure NonEquilateralGeometryTerminal
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {K : SelectedFourClass D.A S.oppApex2}
    {P : TwoContinuationRows (rebasePacket D S) K}
    (N : NonEquilateralOutput H P)
    (Hfav : CriticalShellSystem D.A) : Type where
  oppositeLargeCap : OppositeLargeCapLocation S
  nativeExpansion : NonEquilateralNativeCriticalExpansion N Hfav
  metricTerminal : SurplusHeavyNativeRow P ∨
    Nonempty (StrictWitnessMetricHinge N)

theorem nonempty_nonEquilateralGeometryTerminal
    {D : CounterexampleData}
    {hncol : ¬ Collinear ℝ (D.A : Set ℝ²)}
    (MT : MEC.NonObtuseCircumscribedMoserTriangle D.A D.nonempty hncol)
    (hCirc : ∃ h12 h23 h13,
      MT.toMoserTriangle.case_split = Or.inl ⟨h12, h23, h13⟩)
    {M : MoserTriangle D.A} (CP : CapTriple D.A M) (i : Fin 3)
    (hM : M = MT.toMoserTriangle.toStructural hCirc)
    (hsurplus : 4 < (CP.capAt i).card)
    (hNoM44 : ¬ ∃ S : SurplusCapPacket D.A, S.IsM44)
    {S : SurplusCapPacket D.A}
    (hS : S = leafSurplusPacket MT hCirc CP i hM hsurplus)
    {H : CriticalShellSystem D.A}
    {K : SelectedFourClass D.A S.oppApex2}
    {P : TwoContinuationRows (rebasePacket D S) K}
    (N : NonEquilateralOutput H P)
    (Hfav : CriticalShellSystem D.A) :
    Nonempty (NonEquilateralGeometryTerminal N Hfav) := by
  rcases nonempty_nonEquilateralNativeCriticalExpansion N Hfav with ⟨E⟩
  exact ⟨{
    oppositeLargeCap := oppositeLargeCapLocation_of_leaf_noM44
      MT hCirc CP i hM hsurplus hNoM44 hS
    nativeExpansion := E
    metricTerminal := surplusHeavy_or_strictWitnessMetricHinge N }⟩

/-- Routed late-system output with the strengthened non-equilateral terminal. -/
def RoutedContinuationWithNonEquilateralGeometryTerminal
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {Hinitial : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S r Hinitial}
    (G : GeometricFrontierContinuation F)
    (Hfav : CriticalShellSystem D.A) : Prop :=
  CrossSurvivalOutput G.rows ∨
    (∃ N : NonEquilateralOutput Hfav G.rows,
      Nonempty (NonEquilateralGeometryTerminal N Hfav)) ∨
    G.rows.EquilateralResidual

/-- Full-parent handoff.  MEC/cap geometry and no-`IsM44` supply the exact
opposite-large-cap disjunction, while global K4 plus no removability supplies
the late critical system.  Only the actually routed branch is retained. -/
theorem fullParent_nonEquilateralGeometryTerminal
    {D : CounterexampleData}
    {hncol : ¬ Collinear ℝ (D.A : Set ℝ²)}
    (MT : MEC.NonObtuseCircumscribedMoserTriangle D.A D.nonempty hncol)
    (hCirc : ∃ h12 h23 h13,
      MT.toMoserTriangle.case_split = Or.inl ⟨h12, h23, h13⟩)
    {M : MoserTriangle D.A} (CP : CapTriple D.A M) (i : Fin 3)
    (hM : M = MT.toMoserTriangle.toStructural hCirc)
    (hsurplus : 4 < (CP.capAt i).card)
    (hNoM44 : ¬ ∃ S : SurplusCapPacket D.A, S.IsM44)
    (hnoRem : ∀ x : ℝ², ¬ IsRemovableVertex D.A x)
    {S : SurplusCapPacket D.A}
    (hS : S = leafSurplusPacket MT hCirc CP i hM hsurplus)
    {r : ℝ} {Hinitial : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S r Hinitial) :
    ∃ G : GeometricFrontierContinuation F,
      ∃ Hfav : CriticalShellSystem D.A,
        RoutedContinuationWithNonEquilateralGeometryTerminal G Hfav := by
  rcases nonempty_geometricFrontierContinuation F with ⟨G⟩
  rcases exists_criticalShellSystem D.K4 hnoRem with ⟨Hfav⟩
  refine ⟨G, Hfav, ?_⟩
  rcases (G.toDispatch Hfav).branch with hcross | hnon | heq
  · exact Or.inl hcross
  · exact Or.inr (Or.inl ⟨hnon,
      nonempty_nonEquilateralGeometryTerminal
        MT hCirc CP i hM hsurplus hNoM44 hS hnon Hfav⟩)
  · exact Or.inr (Or.inr heq)

#print axioms surplusHeavy_or_strictWitnessMetricHinge
#print axioms u1TwoLargeCapHypotheses_of_strictWitnessBankCompletion
#print axioms oppositeLargeCapLocation_of_leaf_noM44
#print axioms nonempty_nonEquilateralGeometryTerminal
#print axioms fullParent_nonEquilateralGeometryTerminal

end ATailNonEquilateralGeometryConsumerScratch
end Problem97
