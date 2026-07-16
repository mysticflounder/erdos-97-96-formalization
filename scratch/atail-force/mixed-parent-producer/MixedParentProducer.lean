/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import MixedParentCoupling

/-!
# Scratch: choice-free producer boundary for the reverse mixed profile

The retained `CriticalShellSystem` is an arbitrary dependent choice.  The
reverse-mixed terminal does not need to constrain that choice: after the
continuation labels are known, any certified critical shell sourced at the
common apex can be consumed directly.

This file replaces the over-quantified target
`ApexShellHitCapResidual H ...` for one preselected `H` by a choice-free
existential critical-shell target.  It also records the exact cap-refined
normal form of every apex critical shell.  The three remaining shapes are:

* the shell omits both continuation centers;
* it hits only `y` and its center is the cap-side aligned center `x` or `u`;
* it hits only `x` and its center is the cap-side aligned center `y` or `v`.

The final existence theorem visibly consumes global K4 and no-removability to
choose a certified apex shell, but it does not eliminate those three shapes.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailMixedParentProducerScratch

open ATailCriticalPairFrontier
open ATailJointTransitionCoreScratch
open ATailMixedParentCouplingScratch
open ATailMixedProfileEliminatorScratch
open ATailMixedProfileEliminatorScratch.JointTransitionPacket
open ATailThirdRowProfileBankScratch

attribute [local instance] Classical.propDecidable

/-- Choice-free form of the reverse-mixed closing producer.  It names a
critical apex shell directly, rather than constraining an arbitrary retained
`CriticalShellSystem`. -/
def ApexCriticalShellHitCapResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (x y u v : ℝ²) : Prop :=
  (∃ center : ℝ²,
    ∃ C : CriticalSelectedFourClass D.A S.oppApex2 center,
      y ∈ C.toCriticalFourShell.support ∧
        CapQuotientedSeparation S.oppCap2 center x u) ∨
    (∃ center : ℝ²,
      ∃ C : CriticalSelectedFourClass D.A S.oppApex2 center,
        x ∈ C.toCriticalFourShell.support ∧
          CapQuotientedSeparation S.oppCap2 center y v)

/-- Certified form of the choice-free producer.  The extra deletion failure
is exactly what permits pointwise installation into any existing critical
shell system. -/
def CertifiedApexCriticalShellHitCapResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (x y u v : ℝ²) : Prop :=
  (∃ center : ℝ²,
    ∃ C : CriticalSelectedFourClass D.A S.oppApex2 center,
      (¬ HasNEquidistantPointsAt 4 (D.A.erase S.oppApex2) center) ∧
        y ∈ C.toCriticalFourShell.support ∧
          CapQuotientedSeparation S.oppCap2 center x u) ∨
    (∃ center : ℝ²,
      ∃ C : CriticalSelectedFourClass D.A S.oppApex2 center,
        (¬ HasNEquidistantPointsAt 4 (D.A.erase S.oppApex2) center) ∧
          x ∈ C.toCriticalFourShell.support ∧
            CapQuotientedSeparation S.oppCap2 center y v)

/-- Negating cap-quotiented separation leaves exactly the same-side aligned
center selected by the blocker's cap bit. -/
theorem not_capQuotientedSeparation_iff_aligned
    {α : Type*} [DecidableEq α]
    {cap : Finset α} {blocker inside outside : α} :
    ¬ CapQuotientedSeparation cap blocker inside outside ↔
      (blocker ∈ cap ∧ blocker = inside) ∨
        (blocker ∉ cap ∧ blocker = outside) := by
  by_cases hblocker : blocker ∈ cap
  · simp [CapQuotientedSeparation, hblocker]
  · simp [CapQuotientedSeparation, hblocker]

/-- A choice-free critical shell with the cap-quotiented hit is already a
third center on one of the two realized mixed-pair bisectors. -/
theorem false_of_reverseMixed_of_apexCriticalShellHitCapResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {x y u v : ℝ²}
    {P : EquilateralRows D.A x y S.oppApex2}
    {Ku : SelectedFourClass D.A u}
    {Kv : SelectedFourClass D.A v}
    (J : JointTransitionPacket D S H P Ku Kv)
    (hxKv : x ∈ Kv.support) (haKv : S.oppApex2 ∈ Kv.support)
    (hyKu : y ∈ Ku.support) (haKu : S.oppApex2 ∈ Ku.support)
    (R : ApexCriticalShellHitCapResidual (S := S) x y u v) : False := by
  have hxCap : x ∈ S.oppCap2 := (Finset.mem_sdiff.mp J.x_strict).1
  have hyCap : y ∈ S.oppCap2 := (Finset.mem_sdiff.mp J.y_strict).1
  rcases R with ⟨center, C, hyC, hsep⟩ | ⟨center, C, hxC, hsep⟩
  · have hne : center ≠ x ∧ center ≠ u :=
      (capQuotientedSeparation_iff hxCap J.u_outside).mp hsep
    have hcenterA : center ∈ D.A :=
      (Finset.mem_erase.mp C.toCriticalFourShell.center_mem).2
    have hbis : dist center y = dist center S.oppApex2 :=
      (C.toCriticalFourShell.support_eq_radius y hyC).trans
        (C.toCriticalFourShell.support_eq_radius S.oppApex2
          C.toCriticalFourShell.q_mem_support).symm
    have hthird : HasThirdMixedPairBisectorCenter
        D x y S.oppApex2 u v :=
      Or.inl ⟨center, hcenterA, hne.1.symm, hne.2.symm, hbis⟩
    exact false_of_thirdMixedPairBisectorCenter
      J hxKv haKv hyKu haKu hthird
  · have hne : center ≠ y ∧ center ≠ v :=
      (capQuotientedSeparation_iff hyCap J.v_outside).mp hsep
    have hcenterA : center ∈ D.A :=
      (Finset.mem_erase.mp C.toCriticalFourShell.center_mem).2
    have hbis : dist center x = dist center S.oppApex2 :=
      (C.toCriticalFourShell.support_eq_radius x hxC).trans
        (C.toCriticalFourShell.support_eq_radius S.oppApex2
          C.toCriticalFourShell.q_mem_support).symm
    have hthird : HasThirdMixedPairBisectorCenter
        D x y S.oppApex2 u v :=
      Or.inr ⟨center, hcenterA, hne.1.symm, hne.2.symm, hbis⟩
    exact false_of_thirdMixedPairBisectorCenter
      J hxKv haKv hyKu haKu hthird

/-- The certified choice-free target implies the same direct closing target;
the blocker certification is needed only for selector installation. -/
theorem apexCriticalShellHitCapResidual_of_certified
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {x y u v : ℝ²}
    (R : CertifiedApexCriticalShellHitCapResidual (S := S) x y u v) :
    ApexCriticalShellHitCapResidual (S := S) x y u v := by
  rcases R with ⟨center, C, _hblocked, hyC, hsep⟩ |
      ⟨center, C, _hblocked, hxC, hsep⟩
  · exact Or.inl ⟨center, C, hyC, hsep⟩
  · exact Or.inr ⟨center, C, hxC, hsep⟩

private theorem overrideAt_selectedAt_support
    {A : Finset ℝ²} (H0 : CriticalShellSystem A)
    {source center : ℝ²}
    (C : CriticalSelectedFourClass A source center)
    (hblocked :
      ¬ HasNEquidistantPointsAt 4 (A.erase source) center)
    (hsource : source ∈ A) :
    ((H0.overrideAt C hblocked).selectedAt source hsource).toCriticalFourShell.support =
      C.toCriticalFourShell.support := by
  simp only [CriticalShellSystem.selectedAt, CriticalShellSystem.centerAt,
    CriticalShellSystem.overrideAt]
  rw [dif_pos rfl]

/-- A certified choice-free shell can be installed sourcewise into any
existing critical system.  Thus the corrected target is existential over a
favorable retained system, not universal over the parent's arbitrary one. -/
theorem exists_retainedSystem_shellHit_of_certified
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (H0 : CriticalShellSystem D.A)
    {x y u v : ℝ²}
    {Ku : SelectedFourClass D.A u}
    (haKu : S.oppApex2 ∈ Ku.support)
    (R : CertifiedApexCriticalShellHitCapResidual (S := S) x y u v) :
    ∃ H : CriticalShellSystem D.A,
      ApexShellHitCapResidual H x y u v haKu := by
  rcases R with ⟨center, C, hblocked, hyC, hsep⟩ |
      ⟨center, C, hblocked, hxC, hsep⟩
  · let H := H0.overrideAt C hblocked
    refine ⟨H, ?_⟩
    refine Or.inl ⟨?_, ?_⟩
    · rw [overrideAt_selectedAt_support H0 C hblocked
          (Ku.support_subset_A haKu)]
      exact hyC
    · simpa [ApexShellHitCapResidual, H,
        CriticalShellSystem.centerAt, CriticalShellSystem.overrideAt] using hsep
  · let H := H0.overrideAt C hblocked
    refine ⟨H, ?_⟩
    refine Or.inr ⟨?_, ?_⟩
    · rw [overrideAt_selectedAt_support H0 C hblocked
          (Ku.support_subset_A haKu)]
      exact hxC
    · simpa [ApexShellHitCapResidual, H,
        CriticalShellSystem.centerAt, CriticalShellSystem.overrideAt] using hsep

/-- Exact cap-refined residual for one critical shell sourced at the common
apex. -/
def ApexCriticalShellCapNormalForm
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {x y u v center : ℝ²}
    (C : CriticalSelectedFourClass D.A S.oppApex2 center) : Prop :=
  let T := C.toCriticalFourShell.support
  (x ∉ T ∧ y ∉ T) ∨
    (x ∉ T ∧ y ∈ T ∧
      ((center ∈ S.oppCap2 ∧ center = x) ∨
        (center ∉ S.oppCap2 ∧ center = u))) ∨
    (y ∉ T ∧ x ∈ T ∧
      ((center ∈ S.oppCap2 ∧ center = y) ∨
        (center ∉ S.oppCap2 ∧ center = v)))

/-- No apex critical shell can contain both continuation centers in the
reverse mixed profile.  If its center coincides with `u`, the other mixed
bisector supplies the third-center contradiction; otherwise the first does. -/
theorem apexCriticalShell_omits_x_or_y_of_reverseMixed
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {x y u v center : ℝ²}
    {P : EquilateralRows D.A x y S.oppApex2}
    {Ku : SelectedFourClass D.A u}
    {Kv : SelectedFourClass D.A v}
    (J : JointTransitionPacket D S H P Ku Kv)
    (hxKv : x ∈ Kv.support) (haKv : S.oppApex2 ∈ Kv.support)
    (hyKu : y ∈ Ku.support) (haKu : S.oppApex2 ∈ Ku.support)
    (C : CriticalSelectedFourClass D.A S.oppApex2 center) :
    x ∉ C.toCriticalFourShell.support ∨
      y ∉ C.toCriticalFourShell.support := by
  by_cases hxC : x ∈ C.toCriticalFourShell.support
  · by_cases hyC : y ∈ C.toCriticalFourShell.support
    · have hcenterA : center ∈ D.A :=
        (Finset.mem_erase.mp C.toCriticalFourShell.center_mem).2
      have hxCenter : x ≠ center := by
        intro hEq
        apply C.toCriticalFourShell.center_not_mem_support
        simpa [hEq] using hxC
      have huv : u ≠ v := by
        intro hEq
        apply J.u_not_mem_rowY
        simpa [hEq] using J.v_mem_rowY
      by_cases huCenter : u = center
      · have hyCenter : y ≠ center := by
          intro hEq
          apply J.u_outside
          have hyCap : y ∈ S.oppCap2 :=
            (Finset.mem_sdiff.mp J.y_strict).1
          have hyu : y = u := hEq.trans huCenter.symm
          simpa [hyu] using hyCap
        have hvCenter : v ≠ center := by
          intro hEq
          exact huv (huCenter.trans hEq.symm)
        have hbis : dist center x = dist center S.oppApex2 :=
          (C.toCriticalFourShell.support_eq_radius x hxC).trans
            (C.toCriticalFourShell.support_eq_radius S.oppApex2
              C.toCriticalFourShell.q_mem_support).symm
        have hthird : HasThirdMixedPairBisectorCenter
            D x y S.oppApex2 u v :=
          Or.inr ⟨center, hcenterA, hyCenter, hvCenter, hbis⟩
        exact False.elim
          (false_of_thirdMixedPairBisectorCenter
            J hxKv haKv hyKu haKu hthird)
      · have hbis : dist center y = dist center S.oppApex2 :=
          (C.toCriticalFourShell.support_eq_radius y hyC).trans
            (C.toCriticalFourShell.support_eq_radius S.oppApex2
              C.toCriticalFourShell.q_mem_support).symm
        have hthird : HasThirdMixedPairBisectorCenter
            D x y S.oppApex2 u v :=
          Or.inl ⟨center, hcenterA, hxCenter, huCenter, hbis⟩
        exact False.elim
          (false_of_thirdMixedPairBisectorCenter
            J hxKv haKv hyKu haKu hthird)
    · exact Or.inr hyC
  · exact Or.inl hxC

/-- Every apex critical shell has exactly one of the three cap-refined
residual shapes.  A separated one-hit arm is impossible by the direct
choice-free terminal above. -/
theorem apexCriticalShell_capNormalForm_of_reverseMixed
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {x y u v center : ℝ²}
    {P : EquilateralRows D.A x y S.oppApex2}
    {Ku : SelectedFourClass D.A u}
    {Kv : SelectedFourClass D.A v}
    (J : JointTransitionPacket D S H P Ku Kv)
    (hxKv : x ∈ Kv.support) (haKv : S.oppApex2 ∈ Kv.support)
    (hyKu : y ∈ Ku.support) (haKu : S.oppApex2 ∈ Ku.support)
    (C : CriticalSelectedFourClass D.A S.oppApex2 center) :
    ApexCriticalShellCapNormalForm (S := S) (x := x) (y := y)
      (u := u) (v := v) C := by
  rcases apexCriticalShell_omits_x_or_y_of_reverseMixed
      J hxKv haKv hyKu haKu C with hxOmit | hyOmit
  · by_cases hyC : y ∈ C.toCriticalFourShell.support
    · by_cases hsep :
          CapQuotientedSeparation S.oppCap2 center x u
      · exact False.elim
          (false_of_reverseMixed_of_apexCriticalShellHitCapResidual
            J hxKv haKv hyKu haKu
              (Or.inl ⟨center, C, hyC, hsep⟩))
      · exact Or.inr (Or.inl
          ⟨hxOmit, hyC,
            (not_capQuotientedSeparation_iff_aligned.mp hsep)⟩)
    · exact Or.inl ⟨hxOmit, hyC⟩
  · by_cases hxC : x ∈ C.toCriticalFourShell.support
    · by_cases hsep :
          CapQuotientedSeparation S.oppCap2 center y v
      · exact False.elim
          (false_of_reverseMixed_of_apexCriticalShellHitCapResidual
            J hxKv haKv hyKu haKu
              (Or.inr ⟨center, C, hxC, hsep⟩))
      · exact Or.inr (Or.inr
          ⟨hyOmit, hxC,
            (not_capQuotientedSeparation_iff_aligned.mp hsep)⟩)
    · exact Or.inl ⟨hxC, hyOmit⟩

/-- Choice-free certified apex shell together with its exact residual shape. -/
structure ApexCriticalShellResidualPacket
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    (x y u v : ℝ²) where
  center : ℝ²
  shell : CriticalSelectedFourClass D.A S.oppApex2 center
  blocked :
    ¬ HasNEquidistantPointsAt 4 (D.A.erase S.oppApex2) center
  normalForm :
    ApexCriticalShellCapNormalForm (S := S) (x := x) (y := y)
      (u := u) (v := v) shell

/-- Global K4 plus no-removability chooses a certified apex shell after the
reverse-mixed labels are known.  The result is independent of the arbitrary
critical system carried by the outer parent, and leaves precisely the three
normal-form residuals above. -/
theorem nonempty_apexCriticalShellResidualPacket_of_reverseMixed
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {x y u v : ℝ²}
    {P : EquilateralRows D.A x y S.oppApex2}
    {Ku : SelectedFourClass D.A u}
    {Kv : SelectedFourClass D.A v}
    (hnoRem : ∀ z : ℝ², ¬ IsRemovableVertex D.A z)
    (J : JointTransitionPacket D S H P Ku Kv)
    (hxKv : x ∈ Kv.support) (haKv : S.oppApex2 ∈ Kv.support)
    (hyKu : y ∈ Ku.support) (haKu : S.oppApex2 ∈ Ku.support) :
    Nonempty (ApexCriticalShellResidualPacket D S x y u v) := by
  have haA : S.oppApex2 ∈ D.A :=
    Ku.support_subset_A haKu
  rcases exists_criticalSelectedFourClass_and_no_qfree
      D.K4 haA (hnoRem S.oppApex2) with
    ⟨center, ⟨C⟩, hblocked⟩
  exact ⟨
    { center := center
      shell := C
      blocked := hblocked
      normalForm :=
        apexCriticalShell_capNormalForm_of_reverseMixed
          J hxKv haKv hyKu haKu C }⟩

#print axioms not_capQuotientedSeparation_iff_aligned
#print axioms false_of_reverseMixed_of_apexCriticalShellHitCapResidual
#print axioms exists_retainedSystem_shellHit_of_certified
#print axioms apexCriticalShell_omits_x_or_y_of_reverseMixed
#print axioms apexCriticalShell_capNormalForm_of_reverseMixed
#print axioms nonempty_apexCriticalShellResidualPacket_of_reverseMixed

end ATailMixedParentProducerScratch
end Problem97
