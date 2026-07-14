import Erdos9796Proof.P97.U2NonSurplusOneHit

/-!
# One-point cap/MEC kernel for the ATAIL producer census

Scratch-only validation of the weakest Lean-facing consequence behind the
15 recurring one-point cvc5 cores.  This is not imported by production code.
-/

open scoped EuclideanGeometry

namespace Problem97.ATAILForceScratch

/-- A positive-radius class about the first opposing apex cannot contain a
strict surplus-cap point once it contains both Moser endpoints of the first
opposing cap. -/
theorem onePointSurplusCapExactRadius_false
    (D : CounterexampleData) {x : ℝ²} {r : ℝ}
    (hr : 0 < r)
    (hOther : dist D.packet.oppApex2 D.packet.oppApex1 = r)
    (hSurplusApex : dist D.packet.surplusApex D.packet.oppApex1 = r)
    (hxDist : dist x D.packet.oppApex1 = r)
    (hxSurplus : x ∈ D.packet.surplusCap)
    (hxNeSharedEndpoint : x ≠ D.packet.oppApex2) : False := by
  have hxA : x ∈ D.A := by
    rcases hi : D.packet.surplusIdx with ⟨i, hilt⟩
    interval_cases i
    · exact D.packet.partition.C1_subset
        (by simpa [SurplusCapPacket.surplusCap, hi] using hxSurplus)
    · exact D.packet.partition.C2_subset
        (by simpa [SurplusCapPacket.surplusCap, hi] using hxSurplus)
    · exact D.packet.partition.C3_subset
        (by simpa [SurplusCapPacket.surplusCap, hi] using hxSurplus)
  have hxFilter :
      x ∈ D.A.filter (fun y => dist y D.packet.oppApex1 = r) := by
    exact Finset.mem_filter.mpr ⟨hxA, hxDist⟩
  have hxOpp1 : x ∈ D.packet.oppCap1 :=
    U2NonSurplusSqueeze.oppApex1_filter_subset_oppCap1_of_endpointRadius
      D hr hOther hSurplusApex hxFilter
  have hxInter : x ∈ D.packet.surplusCap ∩ D.packet.oppCap1 :=
    Finset.mem_inter.mpr ⟨hxSurplus, hxOpp1⟩
  have hxSingleton : x ∈ ({D.packet.oppApex2} : Finset ℝ²) :=
    U2NonSurplusSqueeze.surplus_inter_oppCap1_subset_oppApex2 D hxInter
  exact hxNeSharedEndpoint (by simpa using hxSingleton)

end Problem97.ATAILForceScratch

#print axioms Problem97.ATAILForceScratch.onePointSurplusCapExactRadius_false
