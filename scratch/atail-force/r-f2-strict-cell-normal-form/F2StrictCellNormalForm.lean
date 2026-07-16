/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import F2ThreeRowChain
import F2SupportHeavyReduction

/-!
# Scratch: complete F2 strict-cell normal form

This file combines the checked live-heavy, support-heavy, and mixed strict-cap
reductions without weakening the underlying F2 packet.  The complete
`TwoLiveExactCoverSecondApexProfile` and `q ∈ surplusCap` provenance remain
available in every branch.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRF2StrictCellNormalFormScratch

open ATailCommonDeletionCriticalExpansionScratch
open ATailContinuationBankMatchScratch
open ATailRFailureProfilesParentLiftScratch
open ATailRF2SupportHeavyReductionScratch
open ATailRF2ThreeRowChainScratch
open ATailRParentDangerousRowCouplingScratch

attribute [local instance] Classical.propDecidable

/-- The three exact strict-cell outputs of the F2 profile. -/
inductive F2StrictCellBranch
    {D : CounterexampleData} {p q t1 t2 t3 deleted : ℝ²}
    (S : SurplusCapPacket D.A)
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3)
    (C : CommonDeletionTwoCenterPacket D W.H deleted p S.oppApex2) :
    Prop
  | liveHeavy :
      SourceFaithfulF2ThreeRowChain S W C →
      F2StrictCellBranch S W C
  | supportHeavy :
      F2SupportHeavyReduction S W C →
      F2StrictCellBranch S W C
  | mixed :
      F2MixedOneLiveOneSupportBoundary S W C →
      F2StrictCellBranch S W C

/-- Complete source-faithful F2 normal form.

Keeping the original profile in the wrapper is intentional: the support-heavy
and mixed branch payloads are reductions, not substitutes for the exact
`2 live-only + 2 support-only` row and its global-K4 field. -/
structure ResolvedF2StrictCellNormalForm
    {D : CounterexampleData} {p q t1 t2 t3 deleted : ℝ²}
    (S : SurplusCapPacket D.A)
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3)
    (C : CommonDeletionTwoCenterPacket D W.H deleted p S.oppApex2) :
    Prop where
  q_mem_surplus :
    q ∈ S.surplusCap
  profile :
    TwoLiveExactCoverSecondApexProfile
      (live := ({q, t1, t2, t3} : Finset ℝ²)) S C
  branch :
    F2StrictCellBranch S W C

/-- Resolve every actual F2 packet into its complete strict-cell normal form. -/
theorem resolvedF2StrictCellNormalForm
    {D : CounterexampleData} {p q t1 t2 t3 deleted : ℝ²}
    (S : SurplusCapPacket D.A)
    (W : LiveDangerousRetainingSystem D p q t1 t2 t3)
    (C : CommonDeletionTwoCenterPacket D W.H deleted p S.oppApex2)
    (hqSurplus : q ∈ S.surplusCap)
    (F2 : TwoLiveExactCoverSecondApexProfile
      (live := ({q, t1, t2, t3} : Finset ℝ²)) S C) :
    ResolvedF2StrictCellNormalForm S W C := by
  refine {
    q_mem_surplus := hqSurplus
    profile := F2
    branch := ?_ }
  rcases F2.strict_cell_distribution with hlive | hsupport | hmixed
  · exact F2StrictCellBranch.liveHeavy
      (sourceFaithfulF2ThreeRowChain S W C hqSurplus F2 hlive)
  · exact F2StrictCellBranch.supportHeavy
      (twoLiveExactCover_to_supportHeavyReduction S W C F2 hsupport)
  · exact F2StrictCellBranch.mixed ⟨hmixed.1, hmixed.2⟩

#print axioms resolvedF2StrictCellNormalForm

end ATailRF2StrictCellNormalFormScratch
end Problem97
