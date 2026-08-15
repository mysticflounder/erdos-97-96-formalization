/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.U1CarrierInjection

/-!
# The canonical singleton blocking subdeletion

The global-minimal-deletion construction applied to an exact critical row has
an unavoidable trivial branch: deleting its source already blocks K4 at the
chosen blocker center, and restoring that singleton restores the critical
four-class.  Consequently an existential minimal-subdeletion theorem cannot
force a new center or a multi-point blocking set without an extra exclusion.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace FirstNonHitRichApexScratch

attribute [local instance] Classical.propDecidable

/-- Every chosen critical row supplies a singleton simultaneous blocking set
at its own chosen blocker center.  This is the exact trivial witness that a
nontrivial FirstNonHit minimal-deletion producer must exclude. -/
theorem exists_canonicalSingletonBlockingSubdeletion
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    (q : ℝ²) (hq : q ∈ A) :
    let K := (H.selectedAt q hq).toCriticalFourShell.toSelectedFourClass
    ∃ center ∈ A \ K.support, ∃ V : Finset ℝ²,
      V = {q} ∧
      V.Nonempty ∧
      V ⊆ K.support ∧
      ¬ HasNEquidistantPointsAt 4 (A \ V) center ∧
      ∀ s ∈ V,
        HasNEquidistantPointsAt 4 (A \ (V.erase s)) center := by
  classical
  let K := (H.selectedAt q hq).toCriticalFourShell.toSelectedFourClass
  let center := H.centerAt q hq
  refine ⟨center, ?_, {q}, rfl, Finset.singleton_nonempty q, ?_, ?_, ?_⟩
  · exact Finset.mem_sdiff.mpr
      ⟨(Finset.mem_erase.mp
          (H.selectedAt q hq).toCriticalFourShell.center_mem).2,
        K.center_not_mem⟩
  · intro z hz
    have hzq : z = q := by simpa using hz
    subst z
    exact (H.selectedAt q hq).toCriticalFourShell.q_mem_support
  · have hdelete : A \ ({q} : Finset ℝ²) = A.erase q := by
      ext z
      simp [and_comm]
    rw [hdelete]
    exact H.no_qfree_at q hq
  · intro s hs
    have hsq : s = q := by simpa using hs
    subst s
    refine ⟨(H.selectedAt q hq).toCriticalFourShell.radius,
      (H.selectedAt q hq).toCriticalFourShell.radius_pos, ?_⟩
    have hcard :
        (SelectedClass A (H.centerAt q hq)
          (H.selectedAt q hq).toCriticalFourShell.radius).card = 4 := by
      simpa [SelectedClass,
        (H.selectedAt q hq).toCriticalFourShell.support_eq] using
          (H.selectedAt q hq).toCriticalFourShell.support_card
    simpa [center] using le_of_eq hcard.symm

end FirstNonHitRichApexScratch
end Problem97
