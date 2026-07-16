import ParentTransportExtraction
import SharedDeletionRadiusBoundary

/-!
# Cap-five role exclusion for the actual robust blockers

The two actual blockers in `RobustFourCenterPacket` differ from both
non-surplus Moser apices.  Since every non-surplus cap has one of those two
apices as its opposite vertex, neither blocker can satisfy the attempted
`CapFiveOppositeApexBlockerRole`.  The cap-cardinality field is irrelevant.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailForce
namespace RobustFourCenter

open ATAILParentTransportExtraction
open ATailBlockerDistinctRadiusScratch
open ATailCriticalPairFrontier
open ATAILStageOnePrescribedApexDichotomy

private theorem oppositeVertexByIndex_oppIndex1_eq_oppApex1
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppositeVertexByIndex S.oppIndex1 = S.oppApex1 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.oppIndex1, SurplusCapPacket.oppApex1, hi]

private theorem oppositeVertexByIndex_oppIndex2_eq_oppApex2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppositeVertexByIndex S.oppIndex2 = S.oppApex2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.oppIndex2, SurplusCapPacket.oppApex2, hi]

private theorem center_ne_nonSurplusOppositeVertex
    {A : Finset ℝ²} (S : SurplusCapPacket A) {center : ℝ²}
    (hne1 : center ≠ S.oppApex1)
    (hne2 : center ≠ S.oppApex2)
    (i : Fin 3) (hi : i ≠ S.surplusIdx) :
    center ≠ S.oppositeVertexByIndex i := by
  rcases S.index_eq_surplusIdx_or_oppIndex1_or_oppIndex2 i with
      hsurplus | hfirst | hsecond
  · exact False.elim (hi hsurplus)
  · rw [hfirst, oppositeVertexByIndex_oppIndex1_eq_oppApex1 S]
    exact hne1
  · rw [hsecond, oppositeVertexByIndex_oppIndex2_eq_oppApex2 S]
    exact hne2

/-- The actual blocker selected for the first frontier source cannot be the
opposite apex of any non-surplus cap, hence cannot have the cap-five role. -/
theorem not_capFiveOppositeApexBlockerRole_at_qBlocker
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    {P : SurvivorPairRelocationPacket D S r H}
    (R : RobustFourCenterPacket P) :
    ¬ Nonempty (CapFiveOppositeApexBlockerRole S
      (H.centerAt P.q P.q_mem_A)) := by
  rintro ⟨C⟩
  exact center_ne_nonSurplusOppositeVertex S
    R.q_blocker_ne_oppApex1 R.q_blocker_ne_oppApex2
    C.capIndex C.capIndex_ne_surplus C.center_eq_oppositeVertex

/-- The symmetric exclusion for the actual blocker of the second source. -/
theorem not_capFiveOppositeApexBlockerRole_at_wBlocker
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    {P : SurvivorPairRelocationPacket D S r H}
    (R : RobustFourCenterPacket P) :
    ¬ Nonempty (CapFiveOppositeApexBlockerRole S
      (H.centerAt P.w P.w_mem_A)) := by
  rintro ⟨C⟩
  exact center_ne_nonSurplusOppositeVertex S
    R.w_blocker_ne_oppApex1 R.w_blocker_ne_oppApex2
    C.capIndex C.capIndex_ne_surplus C.center_eq_oppositeVertex

#print axioms not_capFiveOppositeApexBlockerRole_at_qBlocker
#print axioms not_capFiveOppositeApexBlockerRole_at_wBlocker

end RobustFourCenter
end ATailForce
end Problem97
