import Residual55Data

/-! Source-satisfaction bridge for the generic 55-clause P4 residual slice. -/

namespace Problem97
namespace P4CriticalSupportOccurrenceBridgeScratch

open ATailCriticalPairFrontier
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourClassCapDistributionScratch
open ATailUniqueFourExactTwoBoundaryScratch
open ATailUniqueFourExactTwoSchemaDecoderScratch
open RetainedKalmansonDecoderScratch
open P5IndexedSourceScratch

/-- Every compact residual clause whose source shape lies in the generic
four-point cap interface is satisfied by the same valuation as the critical
support bridge.  The 21 P4-only cap and six CEGAR occurrences need distinct
P4 terminals; the two strict-unit occurrences need the P4 positional source
bridge rather than the generic strict-hit interface. -/
theorem residual55Entries_sat
    {distribution : ExactTwoStrictHitDistribution R}
    (Q : ExactTwoBoundaryCore R distribution)
    (σ : Label → Label) {v : Nat → Prop} (hv : ValAgreement Q σ v)
    (hfamilies : DenseFamilySatisfaction Q σ) :
    ∀ entry ∈ residual55Entries, P5OccurrenceBridgeScratch.clauseSat v entry.clause := by
  intro entry hentry
  have hwf : residualEntryWF entry = true :=
    List.all_eq_true.mp residual55Entries_wf entry hentry
  exact entrySat Q σ hv hfamilies entry hwf

end P4CriticalSupportOccurrenceBridgeScratch
end Problem97
