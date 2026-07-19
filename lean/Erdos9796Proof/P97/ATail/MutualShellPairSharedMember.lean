/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.U1CarrierInjection

/-!
# Mutual shell pair with a shared member excludes the source from a third class

Lean terminals for the exact-seven L2u equality-layer laws (REPORT Finding 13
in `scratch/atail-force/exact7-role-coverage-gate`): when the critical shell
of a point `P` centered at `C` and a shell centered at `P` share members, the
source `P` is forced onto a third radius class that excludes it.  Every
census minimal core is a pure equality-symmetry chain — `dist_comm` plus
exact-class memberships, no Kalmanson/order content — so these ports are
radius-class bookkeeping only.

- `false_of_mutualShellPair_sharedMember_selectedClassExcludes`: the third
  class is a bare `SelectedClass` (covers the four 192-kill O-coupling
  cores, e.g. `u=b1 uc=s1 m=O` with core
  `{cls_eq|O|s1, cls_eq|b1|O, cls_ne|O|b1, row_eq|unu|O}`).
- `false_of_mutualShellPair_sharedMember_thirdShellExcludes`: the third
  class is itself a `CriticalFourShell` (covers Laws U1/U2, universal on
  all 876 retro survivors: `shell(b0)@s0 ∌ s1` and `shell(b1)@s2 ∌ s1`).
- `false_of_mutualShellPair_selectedClassBridge_thirdShellExcludes`: the
  four-center chain through an intermediate `SelectedClass` (covers the two
  216-kill r2-carrier cores, e.g. `u=b0 uc=s0 m=O` with `O ∈ r2`).

Census instantiations (Round-188 aligned names): Law U1 is
`(P, C, M) = (b0, s0, s1)` with `K0 = r0`, `K2 = r2`, and `Kb` the unused
critical row of `b0` at `s0`; Law U2 is `(b1, s2, s1)` with `K0 = r1`,
`K2 = r2`.  The O-coupling cores take `M = O` (Lemma 2) or bridge through
`W = O` into `K2 = r2` (Lemma 3).  These are case-kill instruments for the
exact-seven branch; the spine `sorry` is unchanged until closure assembles.
-/

open scoped EuclideanGeometry

namespace Problem97

/-- Mutual shell pair with a shared member, `SelectedClass` terminal: `Kb`
is the critical shell of `P` centered at `C`; `K0` is a shell centered at
`P` containing both `M` and `C`; and `M`'s selected class at radius `rad`
contains `C`.  The equality chain forces `dist M P = rad`, so that class
cannot exclude `P`. -/
theorem false_of_mutualShellPair_sharedMember_selectedClassExcludes
    {A : Finset ℝ²} {P C M q0 : ℝ²} {rad : ℝ}
    (Kb : CriticalFourShell A P C)
    (K0 : CriticalFourShell A q0 P)
    (hMb : M ∈ Kb.support)
    (hM0 : M ∈ K0.support)
    (hC0 : C ∈ K0.support)
    (hC2 : C ∈ SelectedClass A M rad)
    (hP2 : P ∉ SelectedClass A M rad) : False := by
  have hMP : dist M P = rad := by
    calc dist M P = dist P M := dist_comm M P
      _ = K0.radius := K0.support_eq_radius M hM0
      _ = dist P C := (K0.support_eq_radius C hC0).symm
      _ = dist C P := dist_comm P C
      _ = Kb.radius := Kb.support_eq_radius P Kb.q_mem_support
      _ = dist C M := (Kb.support_eq_radius M hMb).symm
      _ = dist M C := dist_comm C M
      _ = rad := (mem_selectedClass.mp hC2).2
  exact hP2 (mem_selectedClass.mpr ⟨Kb.q_mem_A, hMP⟩)

/-- Mutual shell pair with a shared member, critical-shell terminal: the
third radius class is itself a `CriticalFourShell` at `M` whose exactness
excludes `P`.  Covers Laws U1/U2 of the exact-seven census. -/
theorem false_of_mutualShellPair_sharedMember_thirdShellExcludes
    {A : Finset ℝ²} {P C M q0 q2 : ℝ²}
    (Kb : CriticalFourShell A P C)
    (K0 : CriticalFourShell A q0 P)
    (K2 : CriticalFourShell A q2 M)
    (hMb : M ∈ Kb.support)
    (hM0 : M ∈ K0.support)
    (hC0 : C ∈ K0.support)
    (hC2 : C ∈ K2.support)
    (hP2 : P ∉ K2.support) : False :=
  false_of_mutualShellPair_sharedMember_selectedClassExcludes Kb K0 hMb hM0 hC0
    (mem_selectedClass.mpr ⟨K2.support_subset_A hC2, K2.support_eq_radius C hC2⟩)
    fun hP => hP2 (K2.off_row_named_label_forbidden Kb.q_mem_A
      (mem_selectedClass.mp hP).2)

/-- Four-center chain: the shell pair at `P`/`C` shares the bridge point `W`
instead of `M`; a `SelectedClass` at `W` carries the radius from `C` to `M`,
and `W` lies on the terminal shell at `M`, which excludes `P`.  Covers the
two 216-kill r2-carrier O-cores of the exact-seven census. -/
theorem false_of_mutualShellPair_selectedClassBridge_thirdShellExcludes
    {A : Finset ℝ²} {P C W M q0 q2 : ℝ²} {radW : ℝ}
    (Kb : CriticalFourShell A P C)
    (K0 : CriticalFourShell A q0 P)
    (K2 : CriticalFourShell A q2 M)
    (hWb : W ∈ Kb.support)
    (hM0 : M ∈ K0.support)
    (hC0 : C ∈ K0.support)
    (hCW : C ∈ SelectedClass A W radW)
    (hMW : M ∈ SelectedClass A W radW)
    (hW2 : W ∈ K2.support)
    (hP2 : P ∉ K2.support) : False := by
  have hMP : dist M P = K2.radius := by
    calc dist M P = dist P M := dist_comm M P
      _ = K0.radius := K0.support_eq_radius M hM0
      _ = dist P C := (K0.support_eq_radius C hC0).symm
      _ = dist C P := dist_comm P C
      _ = Kb.radius := Kb.support_eq_radius P Kb.q_mem_support
      _ = dist C W := (Kb.support_eq_radius W hWb).symm
      _ = dist W C := dist_comm C W
      _ = radW := (mem_selectedClass.mp hCW).2
      _ = dist W M := ((mem_selectedClass.mp hMW).2).symm
      _ = dist M W := dist_comm W M
      _ = K2.radius := K2.support_eq_radius W hW2
  exact hP2 (K2.off_row_named_label_forbidden Kb.q_mem_A hMP)

end Problem97
