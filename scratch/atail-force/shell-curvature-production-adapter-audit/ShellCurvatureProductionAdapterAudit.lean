import RobustSecondApexMinimalDeletion

/-!
# Scratch: robust multi-core to shell-curvature input

The robust second-apex minimal-deletion theorem is already a checked
trichotomy.  This file isolates the one endpoint that has the geometric input
shape needed by a shell-curvature consumer: the multi-core arm contains two
source-indexed, pairwise-disjoint exact four-shells at one fresh carrier
center.

No curvature contradiction is claimed here.  Constructing the finite lifted
angle chart and proving the terminal two-shell curvature theorem remain
separate geometric obligations.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailShellCurvatureProductionAdapterAudit

open ATAILStageOneMinimalDeletionCore
open ATAILStageOnePrescribedApexDichotomy
open ATailCriticalPairFrontier
open ATailRobustSecondApexMinimalDeletionScratch
open ATailRTwoOffLiveHandlerScratch

attribute [local instance] Classical.propDecidable

private theorem exists_two_distinct_of_two_le_card
    {alpha : Type*} [DecidableEq alpha] {T : Finset alpha}
    (hT : 2 ≤ T.card) :
    ∃ a b, a ∈ T ∧ b ∈ T ∧ a ≠ b := by
  rcases Finset.one_lt_card.mp (by omega : 1 < T.card) with
    ⟨a, ha, b, hb, hab⟩
  exact ⟨a, b, ha, hb, hab⟩

/-- The multi-core endpoint already contains two distinct exact four-shells
with a common fresh center and disjoint supports.  The source subtype keeps
the shells tied to the actual minimal-deletion core. -/
theorem exists_two_disjoint_exactFourShells_at_freshCenter
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    {P : ATAILStageOnePrescribedApexDichotomy.SurvivorPairRelocationPacket D S r H}
    {C : RobustSecondApexMinimalDeletionContext P}
    (M : RobustSecondApexMinimalDeletionMultiCore P C) :
    ∃ s t : {x : ℝ² // x ∈ M.fresh.deleted},
      s ≠ t ∧
      Disjoint
        (M.core.shellAt s).toCriticalFourShell.support
        (M.core.shellAt t).toCriticalFourShell.support := by
  obtain ⟨s, t, hs, ht, hst⟩ :=
    exists_two_distinct_of_two_le_card M.deleted_card_ge_two
  let s' : {x : ℝ² // x ∈ M.fresh.deleted} := ⟨s, hs⟩
  let t' : {x : ℝ² // x ∈ M.fresh.deleted} := ⟨t, ht⟩
  have hst' : s' ≠ t' := by
    intro h
    exact hst (congrArg Subtype.val h)
  exact ⟨s', t', hst', M.core.supports_pairwise_disjoint s' t' hst'⟩

/-- The common shell center is an actual carrier vertex, not an auxiliary
Euclidean point. -/
theorem freshCenter_mem_carrier
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    {P : ATAILStageOnePrescribedApexDichotomy.SurvivorPairRelocationPacket D S r H}
    {C : RobustSecondApexMinimalDeletionContext P}
    (M : RobustSecondApexMinimalDeletionMultiCore P C) :
    M.fresh.center ∈ D.A :=
  (Finset.mem_sdiff.mp M.fresh.center_fresh).1

#print axioms exists_two_disjoint_exactFourShells_at_freshCenter
#print axioms freshCenter_mem_carrier

end ATailShellCurvatureProductionAdapterAudit
end Problem97
