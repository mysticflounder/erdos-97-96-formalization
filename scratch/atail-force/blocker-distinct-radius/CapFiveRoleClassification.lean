/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import SharedDeletionRadiusBoundary

/-!
# Classification of cap-five opposite-apex roles

The cap-five opposite-apex role is impossible for every one of the four
aligned reverse-mixed blockers.  The strict-cap fields separate `x,y` from
both non-surplus Moser apices, while the outside-cap and row-incidence fields
separate `u,v` from them.

This is stronger than a failure to find a full-parent producer: no additional
choice of critical system can make an aligned reverse-mixed blocker acquire
this role.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailBlockerDistinctRadiusScratch

open ATailJointTransitionCoreScratch
open ATailReverseMixedResidualReductionScratch
open ATailThirdRowProfileBankScratch

attribute [local instance] Classical.propDecidable

private theorem oppApex1_eq_oppositeVertexByIndex_oppIndex1
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 = S.oppositeVertexByIndex S.oppIndex1 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.oppApex1,
      SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.oppIndex1, hi]

private theorem oppApex2_eq_oppositeVertexByIndex_oppIndex2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex2 = S.oppositeVertexByIndex S.oppIndex2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.oppApex2,
      SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.oppIndex2, hi]

private theorem oppApex1_mem_surplusCap
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 ∈ S.surplusCap := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.surplusCap,
      SurplusCapPacket.oppApex1, hi] using S.partition.v2_mem_C1
  · simpa [SurplusCapPacket.surplusCap,
      SurplusCapPacket.oppApex1, hi] using S.partition.v3_mem_C2
  · simpa [SurplusCapPacket.surplusCap,
      SurplusCapPacket.oppApex1, hi] using S.partition.v1_mem_C3

private theorem oppApex1_mem_oppCap2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 ∈ S.oppCap2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppCap2,
      SurplusCapPacket.oppApex1, hi] using S.partition.v2_mem_C3
  · simpa [SurplusCapPacket.oppCap2,
      SurplusCapPacket.oppApex1, hi] using S.partition.v3_mem_C1
  · simpa [SurplusCapPacket.oppCap2,
      SurplusCapPacket.oppApex1, hi] using S.partition.v1_mem_C2

private theorem oppApex2_not_mem_oppCap2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex2 ∉ S.oppCap2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppCap2,
      SurplusCapPacket.oppApex2, hi] using S.partition.v3_notin_C3
  · simpa [SurplusCapPacket.oppCap2,
      SurplusCapPacket.oppApex2, hi] using S.partition.v1_notin_C1
  · simpa [SurplusCapPacket.oppCap2,
      SurplusCapPacket.oppApex2, hi] using S.partition.v2_notin_C2

/-- The four aligned reverse-mixed center candidates are all distinct from
the first non-surplus Moser apex. -/
theorem reverseMixed_candidates_ne_oppApex1
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {x y u v : ℝ²}
    {P : EquilateralRows D.A x y S.oppApex2}
    {Ku : SelectedFourClass D.A u}
    {Kv : SelectedFourClass D.A v}
    (J : JointTransitionPacket D S H P Ku Kv) :
    x ≠ S.oppApex1 ∧ u ≠ S.oppApex1 ∧
      y ≠ S.oppApex1 ∧ v ≠ S.oppApex1 := by
  have hxNotSurplus : x ∉ S.surplusCap := by
    intro hx
    exact (Finset.mem_sdiff.mp J.x_strict).2
      (Finset.mem_union.mpr (Or.inl hx))
  have hyNotSurplus : y ∉ S.surplusCap := by
    intro hy
    exact (Finset.mem_sdiff.mp J.y_strict).2
      (Finset.mem_union.mpr (Or.inl hy))
  exact ⟨
    (fun h => hxNotSurplus (by
      simpa [h] using oppApex1_mem_surplusCap S)),
    (fun h => J.u_outside (by
      simpa [h] using oppApex1_mem_oppCap2 S)),
    (fun h => hyNotSurplus (by
      simpa [h] using oppApex1_mem_surplusCap S)),
    (fun h => J.v_outside (by
      simpa [h] using oppApex1_mem_oppCap2 S))⟩

/-- The four aligned reverse-mixed center candidates are all distinct from
the second non-surplus Moser apex. -/
theorem reverseMixed_candidates_ne_oppApex2
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {x y u v : ℝ²}
    {P : EquilateralRows D.A x y S.oppApex2}
    {Ku : SelectedFourClass D.A u}
    {Kv : SelectedFourClass D.A v}
    (J : JointTransitionPacket D S H P Ku Kv) :
    x ≠ S.oppApex2 ∧ u ≠ S.oppApex2 ∧
      y ≠ S.oppApex2 ∧ v ≠ S.oppApex2 := by
  have hxCap : x ∈ S.oppCap2 := (Finset.mem_sdiff.mp J.x_strict).1
  have hyCap : y ∈ S.oppCap2 := (Finset.mem_sdiff.mp J.y_strict).1
  exact ⟨
    (fun h => oppApex2_not_mem_oppCap2 S (by simpa [h] using hxCap)),
    (fun h => J.u_not_mem_rowY (by simpa [h] using P.a_mem_rowY)),
    (fun h => oppApex2_not_mem_oppCap2 S (by simpa [h] using hyCap)),
    (fun h => J.v_not_mem_rowX (by simpa [h] using P.a_mem_rowX))⟩

/-- Total non-surplus-apex classification: an aligned reverse-mixed blocker
is never the Moser vertex opposite a non-surplus cap. -/
theorem reverseMixedAligned_center_ne_nonSurplusOppositeVertex
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {x y u v center : ℝ²}
    {P : EquilateralRows D.A x y S.oppApex2}
    {Ku : SelectedFourClass D.A u}
    {Kv : SelectedFourClass D.A v}
    (J : JointTransitionPacket D S H P Ku Kv)
    {C : CriticalSelectedFourClass D.A S.oppApex2 center}
    (aligned : AlignedKnownRowResidual P Ku Kv C)
    (i : Fin 3) (hi : i ≠ S.surplusIdx) :
    center ≠ S.oppositeVertexByIndex i := by
  have hne1 := reverseMixed_candidates_ne_oppApex1 J
  have hne2 := reverseMixed_candidates_ne_oppApex2 J
  rcases S.index_eq_surplusIdx_or_oppIndex1_or_oppIndex2 i with
      his | hi1 | hi2
  · exact False.elim (hi his)
  · rw [hi1, ← oppApex1_eq_oppositeVertexByIndex_oppIndex1 S]
    rcases aligned with ⟨hcenter, _⟩ | ⟨hcenter, _⟩ |
        ⟨hcenter, _⟩ | ⟨hcenter, _⟩
    · exact hcenter.symm ▸ hne1.1
    · exact hcenter.symm ▸ hne1.2.1
    · exact hcenter.symm ▸ hne1.2.2.1
    · exact hcenter.symm ▸ hne1.2.2.2
  · rw [hi2, ← oppApex2_eq_oppositeVertexByIndex_oppIndex2 S]
    rcases aligned with ⟨hcenter, _⟩ | ⟨hcenter, _⟩ |
        ⟨hcenter, _⟩ | ⟨hcenter, _⟩
    · exact hcenter.symm ▸ hne2.1
    · exact hcenter.symm ▸ hne2.2.1
    · exact hcenter.symm ▸ hne2.2.2.1
    · exact hcenter.symm ▸ hne2.2.2.2

/-- Consequently the cap-five opposite-apex role isolated by the generic
radius audit is impossible on every aligned reverse-mixed arm. -/
theorem not_capFiveOppositeApexBlockerRole_of_reverseMixedAligned
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {x y u v center : ℝ²}
    {P : EquilateralRows D.A x y S.oppApex2}
    {Ku : SelectedFourClass D.A u}
    {Kv : SelectedFourClass D.A v}
    (J : JointTransitionPacket D S H P Ku Kv)
    {C : CriticalSelectedFourClass D.A S.oppApex2 center}
    (aligned : AlignedKnownRowResidual P Ku Kv C) :
    ¬ Nonempty (CapFiveOppositeApexBlockerRole S center) := by
  rintro ⟨R⟩
  exact reverseMixedAligned_center_ne_nonSurplusOppositeVertex
    J aligned R.capIndex R.capIndex_ne_surplus
      R.center_eq_oppositeVertex

#print axioms reverseMixed_candidates_ne_oppApex1
#print axioms reverseMixed_candidates_ne_oppApex2
#print axioms reverseMixedAligned_center_ne_nonSurplusOppositeVertex
#print axioms not_capFiveOppositeApexBlockerRole_of_reverseMixedAligned

end ATailBlockerDistinctRadiusScratch
end Problem97
