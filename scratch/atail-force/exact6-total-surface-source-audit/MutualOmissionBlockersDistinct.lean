import Erdos9796Proof.P97.ATail.ParentExactFiveAssembler

/-!
# Actual blockers of a mutual-omission pair are distinct

This source audit checks one constraint used by
`exact6-allcenter-capaware-gate/allcenter_gate.py`.  The arbitrary physical
mutual-omission pair is not the equal-blocker pair appearing later in the
full-parent normal form.  If its two actual blockers coincided, deletion of
the first source would survive at the second source's blocker, contradicting
the first source's `no_qfree_at` field.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailExactSixTotalSurfaceSourceAudit

open ATailCriticalPairFrontier
open ATailLargeCapUniqueFive
open ATailLargeCapUniqueFivePhysicalOmissionCycle
open ATailLargeCapUniqueFivePhysicalOmissionTransitionGlobal

attribute [local instance] Classical.propDecidable

noncomputable section

/-- Mutual omission in one `CriticalShellSystem` forces the two named actual
blockers to be distinct. -/
theorem mutualOmissionPair_actualBlockers_ne
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (P : PhysicalActualCriticalMutualOmissionPair H profile) :
    H.centerAt P.source.1 (PhysicalVertex.mem_A P.source) ≠
      H.centerAt P.target.1 (PhysicalVertex.mem_A P.target) := by
  intro hblockers
  have hsurvives :
      HasNEquidistantPointsAt 4 (D.A.erase P.source.1)
        (H.centerAt P.target.1 (PhysicalVertex.mem_A P.target)) :=
    (cross_deletion_survives_iff_not_mem_selected_support H
      (PhysicalVertex.mem_A P.target)).mpr P.source_not_mem_targetSupport
  apply H.no_qfree_at P.source.1 (PhysicalVertex.mem_A P.source)
  simpa only [hblockers] using hsurvives

#print axioms mutualOmissionPair_actualBlockers_ne

end

end ATailExactSixTotalSurfaceSourceAudit
end Problem97
