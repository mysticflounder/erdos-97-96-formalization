/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import NonEquilateralGeometryConsumer

/-!
# Scratch: geometry of a common native support point

This file identifies the exact geometric content of the first proposed
strict-arm producer.  A point selected by both native continuation rows is
an equilateral apex over the continuation-center chord.  The converse still
requires the apex to be selected by both arbitrary four-point supports;
membership of the ambient radius classes alone does not provide that choice.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailCommonSupportGeometryScratch

open ATailContinuationGeometryClassifier
open ATailFrontierContinuationDispatcherScratch
open ATailJointTransitionCoreScratch
open ATailNonEquilateralGeometryConsumerScratch

/-- Ambient geometric content of a common native support point. -/
def NativeEquilateralApex
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {K : SelectedFourClass D.A S.oppApex2}
    (P : TwoContinuationRows (rebasePacket D S) K)
    (f : ℝ²) : Prop :=
  f ∈ D.A ∧
    f ≠ P.z₁ ∧
    f ≠ P.z₂ ∧
    dist f P.z₁ = dist P.z₁ P.z₂ ∧
    dist f P.z₂ = dist P.z₁ P.z₂

/-- In the actual strict arm, every common selected support point is an
ambient equilateral apex over the continuation-center chord. -/
theorem nativeEquilateralApex_of_commonSupport
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {K : SelectedFourClass D.A S.oppApex2}
    {P : TwoContinuationRows (rebasePacket D S) K}
    (N : NonEquilateralOutput H P)
    {f : ℝ²}
    (hf₁ : f ∈ P.row₁.support)
    (hf₂ : f ∈ P.row₂.support) :
    NativeEquilateralApex P f := by
  rcases N.residual with
    ⟨_hd, _hz₂, _hz₁, hradius₁, hradius₂, _hapex₁, _hapex₂⟩
  refine ⟨P.row₁.support_subset_A hf₁, ?_, ?_, ?_, ?_⟩
  · intro hfz₁
    exact P.row₁.center_not_mem (hfz₁ ▸ hf₁)
  · intro hfz₂
    exact P.row₂.center_not_mem (hfz₂ ▸ hf₂)
  · calc
      dist f P.z₁ = dist P.z₁ f := dist_comm _ _
      _ = P.row₁.radius := P.row₁.support_eq_radius f hf₁
      _ = dist P.z₁ P.z₂ := hradius₁
  · calc
      dist f P.z₂ = dist P.z₂ f := dist_comm _ _
      _ = P.row₂.radius := P.row₂.support_eq_radius f hf₂
      _ = dist P.z₁ P.z₂ := hradius₂

/-- Common-support nonemptiness therefore implies existence of an ambient
equilateral apex. -/
theorem exists_nativeEquilateralApex_of_commonSupport
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {K : SelectedFourClass D.A S.oppApex2}
    {P : TwoContinuationRows (rebasePacket D S) K}
    (N : NonEquilateralOutput H P)
    (hcommon : (P.row₁.support ∩ P.row₂.support).Nonempty) :
    ∃ f : ℝ², NativeEquilateralApex P f := by
  rcases hcommon with ⟨f, hf⟩
  rcases Finset.mem_inter.mp hf with ⟨hf₁, hf₂⟩
  exact ⟨f, nativeEquilateralApex_of_commonSupport N hf₁ hf₂⟩

/-- If the carrier omits both equilateral apices of the center chord, the two
native selected supports are disjoint.  This exposes the genuinely geometric
antecedent that a common-support proof must produce before selection issues
are considered. -/
theorem native_supports_disjoint_of_no_equilateralApex
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {K : SelectedFourClass D.A S.oppApex2}
    {P : TwoContinuationRows (rebasePacket D S) K}
    (N : NonEquilateralOutput H P)
    (hno : ∀ f : ℝ², ¬ NativeEquilateralApex P f) :
    P.row₁.support ∩ P.row₂.support = ∅ := by
  apply Finset.not_nonempty_iff_eq_empty.mp
  rintro ⟨f, hf⟩
  rcases Finset.mem_inter.mp hf with ⟨hf₁, hf₂⟩
  exact hno f (nativeEquilateralApex_of_commonSupport N hf₁ hf₂)

/-- A selected row is saturated when it contains every ambient point at its
chosen radius.  `SelectedFourClass` does not include this field. -/
def RadiusSaturated
    {A : Finset ℝ²} {center : ℝ²}
    (R : SelectedFourClass A center) : Prop :=
  ∀ f ∈ A, dist center f = R.radius → f ∈ R.support

/-- An ambient equilateral apex enters both selected supports once both rows
are radius-saturated.  This is the exact selection bridge absent from the
current arbitrary-four-subset interface. -/
theorem commonSupport_of_nativeEquilateralApex_of_radiusSaturated
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {K : SelectedFourClass D.A S.oppApex2}
    {P : TwoContinuationRows (rebasePacket D S) K}
    (N : NonEquilateralOutput H P)
    {f : ℝ²}
    (hf : NativeEquilateralApex P f)
    (hsat₁ : RadiusSaturated P.row₁)
    (hsat₂ : RadiusSaturated P.row₂) :
    f ∈ P.row₁.support ∩ P.row₂.support := by
  rcases N.residual with
    ⟨_hd, _hz₂, _hz₁, hradius₁, hradius₂, _hapex₁, _hapex₂⟩
  refine Finset.mem_inter.mpr ⟨hsat₁ f hf.1 ?_, hsat₂ f hf.1 ?_⟩
  · calc
      dist P.z₁ f = dist f P.z₁ := dist_comm _ _
      _ = dist P.z₁ P.z₂ := hf.2.2.2.1
      _ = P.row₁.radius := hradius₁.symm
  · calc
      dist P.z₂ f = dist f P.z₂ := dist_comm _ _
      _ = dist P.z₁ P.z₂ := hf.2.2.2.2
      _ = P.row₂.radius := hradius₂.symm

#print axioms nativeEquilateralApex_of_commonSupport
#print axioms exists_nativeEquilateralApex_of_commonSupport
#print axioms native_supports_disjoint_of_no_equilateralApex
#print axioms commonSupport_of_nativeEquilateralApex_of_radiusSaturated

end ATailCommonSupportGeometryScratch
end Problem97
