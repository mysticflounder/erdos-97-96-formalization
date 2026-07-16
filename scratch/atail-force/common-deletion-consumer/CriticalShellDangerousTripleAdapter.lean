/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CriticalPairFrontier
import Erdos9796Proof.P97.U3ToU5DangerousTriple

/-!
# Critical-shell to dangerous-triple adapter

This is the lightweight part of the non-equilateral continuation interface
needed by the common-deletion expansion.  It depends only on a retained
critical-shell system and convex independence; none of the continuation-row
classifier is involved.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailCriticalShellDangerousTripleScratch

attribute [local instance] Classical.propDecidable

/-- Erasing the named source from its exact critical four-shell leaves a
dangerous triple centered at its selected blocker. -/
theorem dangerousTriple_of_criticalShellSystem
    (D : CounterexampleData) (H : CriticalShellSystem D.A)
    {q : ℝ²} (hq : q ∈ D.A) :
    U5DangerousTriple D q (H.centerAt q hq)
      ((H.selectedAt q hq).toCriticalFourShell.support.erase q) := by
  let C := (H.selectedAt q hq).toCriticalFourShell
  let T := C.support.erase q
  have hTsubsetA : T ⊆ D.A := by
    intro x hx
    exact C.support_subset_A (Finset.mem_of_mem_erase hx)
  have hTcard : T.card = 3 := by
    dsimp [T]
    rw [Finset.card_erase_of_mem C.q_mem_support, C.support_card]
  refine
    { q_mem := hq
      p_mem := (Finset.mem_erase.mp C.center_mem).2
      p_ne_q := (Finset.mem_erase.mp C.center_mem).1
      T_subset := ?_
      T_card := hTcard
      T_noncollinear := ?_
      q_radius_pos := ?_
      T_same_radius := ?_ }
  · intro x hx
    have hxT : x ∈ T := hx
    have hxC : x ∈ C.support := Finset.mem_of_mem_erase hxT
    have hxq : x ≠ q := (Finset.mem_erase.mp hxT).1
    have hxc : x ≠ H.centerAt q hq := by
      intro h
      subst x
      exact C.center_not_mem_support hxC
    exact Finset.mem_erase.mpr
      ⟨hxc, Finset.mem_erase.mpr ⟨hxq, C.support_subset_A hxC⟩⟩
  · exact
      (ConvexIndep.mono hTsubsetA D.convex).not_collinear_of_card_ge_three
        (by omega)
  · have hqRadius := C.support_eq_radius q C.q_mem_support
    linarith [C.radius_pos]
  · intro x hx
    have hxRadius := C.support_eq_radius x (Finset.mem_of_mem_erase hx)
    have hqRadius := C.support_eq_radius q C.q_mem_support
    exact hxRadius.trans hqRadius.symm

#print axioms dangerousTriple_of_criticalShellSystem

end ATailCriticalShellDangerousTripleScratch
end Problem97
