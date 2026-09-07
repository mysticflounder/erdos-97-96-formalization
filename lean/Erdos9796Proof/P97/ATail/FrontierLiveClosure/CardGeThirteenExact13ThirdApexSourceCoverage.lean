/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.CardGeThirteenExact13StrongSourceCoverage

/-!
# Third-apex source refinement for exact-thirteen coverage

This module preserves the historical `StrongValid` predicate and adds the
source-derived guard comparing an active global row with the global row
centered at `thirdApex`.  The finite bank for this refinement is intentionally
separate from the historical strong-valid bank.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure
namespace CardGeThirteenExact13ThirdApexSourceCoverage

open ATailCriticalPairFrontier
open ATailExactFourPhysicalConsumer
open ATailExactFourRobustCapExpansion
open ATailUniqueArmRouteAuditScratch
open CardGeThirteenExact13SourceIndexedFiniteKey
open CardGeThirteenExact13SourceIndexedBankCoverage
open CardGeThirteenExact13SourceOrderBridge
open CardGeThirteenExact13StrongSourceCoverage
open DRExactThirteenValuation
open Exact13GlobalRows
open Exact13Provider
open ExactThirteenBranchIngress
open ProviderRowNogoodCertificate

attribute [local instance] Classical.propDecidable

/-- The third-apex incidence guard, kept separate from historical `StrongValid`.
The target row is the global row centered at raw label `thirdApex` (label `2`). -/
def GlobalThirdApexValid (k : Key) : Prop :=
  ∀ c : Exact13GlobalCenter,
    (thirdApex ∈ k.rawSupport (.g c) →
      (k.rawSupport (.g c) ∩
        k.rawSupport (.g ⟨thirdApex, by decide⟩)).card ≤ 1)

/-- Historical strong validity together with the third-apex guard. -/
def ThirdApexStrongValid (k : Key) : Prop :=
  StrongValid k ∧ GlobalThirdApexValid k

@[irreducible] noncomputable def thirdApexStrongValidKeys : Finset Key := by
  classical
  exact Finset.univ.filter ThirdApexStrongValid

theorem mem_thirdApexStrongValidKeys_iff (k : Key) :
    k ∈ thirdApexStrongValidKeys ↔ ThirdApexStrongValid k := by
  simp only [thirdApexStrongValidKeys, Finset.mem_filter, Finset.mem_univ, true_and]

/-- A bank cover restricted to the third-apex-refined source keys. -/
def ThirdApexStrongValidKeyCover
    (bank : List CardGeThirteenExact13WeightedProviderBankBridge.Entry) : Prop :=
  ∀ k ∈ thirdApexStrongValidKeys, ∃ e ∈ bank, KeyEntryCovers k e

private theorem sourceIndex_eq_orderIndex
    (I : Input) (orientation : Bool) (ho : sourceOrderValid I orientation) :
    I.P.idx = orderIndex orientation := by
  cases orientation <;>
    simpa [sourceOrderValid, orderIndex, I.coarse.profile_eq_secondOpposite] using ho

private theorem rawSupport_eq_providerSupport
    (I : Input) (k : Key)
    (hsupport : k.supportOf = I.positionalPattern.supportOf)
    (ho : sourceOrderValid I k.orientation) (provider : Exact13Provider) :
    k.rawSupport provider = I.providerPattern.supportOf provider := by
  ext x
  simp only [Key.rawSupport, Finset.mem_filter]
  rw [hsupport]
  change (x ∈ Finset.univ ∧ orderIndex k.orientation x ∈
    (I.providerPattern.supportOf provider).image I.P.idx) ↔
      x ∈ I.providerPattern.supportOf provider
  rw [← sourceIndex_eq_orderIndex I k.orientation ho]
  simp only [Finset.mem_univ, true_and]
  constructor
  · intro hx
    obtain ⟨y, hy, heq⟩ := Finset.mem_image.mp hx
    exact I.P.boundaryEnumeration.idx_injective heq ▸ hy
  · intro hx
    exact Finset.mem_image.mpr ⟨x, hx, rfl⟩

private theorem source_global_support_eq
    (I : Input) (c : Exact13GlobalCenter) (k : Key)
    (hsupport : k.supportOf = I.positionalPattern.supportOf)
    (ho : sourceOrderValid I k.orientation) :
    k.rawSupport (.g c) =
      guardedGlobalSupport I.X.fivePositionalRows.blocker₁
        I.X.fivePositionalRows.blocker₂
        (fun c => ((I.globalRows).row c).2.rawSupport) c := by
  have h := rawSupport_eq_providerSupport I k hsupport ho (.g c)
  simpa [Input.providerPattern, exact13RawProviderPattern_of_dispatch,
    Exact13RawProviderPattern] using h

private theorem global_third_apex_inter_card_le_one
    (I : Input) (c : Exact13GlobalCenter)
    (hmem : thirdApex ∈ ((I.globalRows).row c).2.rawSupport) :
    (((I.globalRows).row c).2.rawSupport ∩
      ((I.globalRows).row ⟨thirdApex, by decide⟩).2.rawSupport).card ≤ 1 := by
  let M := MEC.mec I.D.A I.S.hA
  have hboundarySet : (MEC.boundary I.D.A I.S.hA : Set ℝ²) =
      {q : ℝ² | q ∈ I.D.A ∧ dist q M.center = M.radius} := by
    ext q
    exact MEC.mem_boundary_iff I.S.hA
  have hcenter : M.center ∈
      convexHull ℝ {q : ℝ² | q ∈ I.D.A ∧ dist q M.center = M.radius} := by
    rw [← hboundarySet]
    exact MEC.mec_center_mem_convexHull_boundary I.S.hA I.S.hncol
  have hB : I.P.pt c.1 ∈ I.D.A := by
    rw [← I.P.labelMap.image_eq]
    exact Finset.mem_image.mpr ⟨c.1, Finset.mem_univ _, rfl⟩
  have hPboundary : dist (I.P.pt thirdApex) M.center = M.radius := by
    rw [I.P.labelMap.thirdApex_eq]
    rcases hi : I.S.surplusIdx with ⟨i, hi3⟩
    simp only [SurplusCapPacket.surplusApex, hi]
    interval_cases i
    · exact I.S.triangleNonObtuse.toMoserTriangle.v1_boundary
    · exact I.S.triangleNonObtuse.toMoserTriangle.v2_boundary
    · exact I.S.triangleNonObtuse.toMoserTriangle.v3_boundary
  have hPC : I.P.pt thirdApex ∈ ((I.globalRows).row c).1.support := by
    rw [← ((I.globalRows).row c).2.rawSupport_image]
    exact Finset.mem_image.mpr ⟨thirdApex, hmem, rfl⟩
  rw [I.P.raw_intersection_card_eq_of_image_eq
    ((I.globalRows).row c).2.rawSupport_image
    ((I.globalRows).row ⟨thirdApex, by decide⟩).2.rawSupport_image]
  apply SelectedFourClass.inter_card_le_one_of_mem_boundary_apex
    I.D.convex M.enclosing hcenter hB hPboundary
    ((I.globalRows).row c).1 ((I.globalRows).row ⟨thirdApex, by decide⟩).1 hPC

theorem globalThirdApexValid_of_source
    (I : Input) (k : Key)
    (_hcenter : k.centerOf = I.positionalPattern.centerOf)
    (hsupport : k.supportOf = I.positionalPattern.supportOf)
    (ho : sourceOrderValid I k.orientation) :
    GlobalThirdApexValid k := by
  intro c hmem
  have hG := source_global_support_eq I c k hsupport ho
  have hGmem : thirdApex ∈ ((I.globalRows).row c).2.rawSupport := by
    have h' : thirdApex ∈
        guardedGlobalSupport I.X.fivePositionalRows.blocker₁
          I.X.fivePositionalRows.blocker₂
          (fun c => ((I.globalRows).row c).2.rawSupport) c := by
      rw [← hG]
      exact hmem
    by_cases hg : c.1 = I.X.fivePositionalRows.blocker₁ ∨
        c.1 = I.X.fivePositionalRows.blocker₂
    · simp [guardedGlobalSupport, hg] at h'
    · simpa [guardedGlobalSupport, hg] using h'
  have hgc_active : ¬ (c.1 = I.X.fivePositionalRows.blocker₁ ∨
      c.1 = I.X.fivePositionalRows.blocker₂) := by
    intro hg
    have h' : thirdApex ∈
        guardedGlobalSupport I.X.fivePositionalRows.blocker₁
          I.X.fivePositionalRows.blocker₂
          (fun c => ((I.globalRows).row c).2.rawSupport) c := by
      rw [← hG]
      exact hmem
    simp [guardedGlobalSupport, hg] at h'
  have hGc : k.rawSupport (.g c) = ((I.globalRows).row c).2.rawSupport := by
    rw [hG]
    simp [guardedGlobalSupport, hgc_active]
  let cThird : Exact13GlobalCenter := ⟨thirdApex, by decide⟩
  have hGThird := source_global_support_eq I cThird k hsupport ho
  by_cases hthird_active :
      thirdApex = I.X.fivePositionalRows.blocker₁ ∨
        thirdApex = I.X.fivePositionalRows.blocker₂
  · have hGThirdEmpty : k.rawSupport (.g cThird) = ∅ := by
      rw [hGThird]
      simp [cThird, guardedGlobalSupport, hthird_active]
    rw [hGc, hGThirdEmpty]
    simp
  · have hGThird' :
        k.rawSupport (.g cThird) = ((I.globalRows).row cThird).2.rawSupport := by
      rw [hGThird]
      simp [cThird, guardedGlobalSupport, hthird_active]
    rw [hGc, hGThird']
    exact global_third_apex_inter_card_le_one I c hGmem

theorem exists_mem_thirdApexStrongValidKeys (I : Input) :
    ∃ k ∈ thirdApexStrongValidKeys,
      k.centerOf = I.positionalPattern.centerOf ∧
      k.supportOf = I.positionalPattern.supportOf ∧
      k.z = I.X.tightSupport.zraw ∧
      sourceOrderValid I k.orientation := by
  obtain ⟨k, hk, hcenter, hsupport, hz, ho, _, _⟩ := exists_valid_key I
  have hstrong := globalOneBoundaryValid_of_source I k hcenter hsupport ho
  have hthird := globalThirdApexValid_of_source I k hcenter hsupport ho
  exact ⟨k, (mem_thirdApexStrongValidKeys_iff k).2 ⟨⟨hk, hstrong⟩, hthird⟩,
    hcenter, hsupport, hz, ho⟩

theorem bankCovers_of_thirdApexStrongValidKeyCover
    (bank : List CardGeThirteenExact13WeightedProviderBankBridge.Entry)
    (hcover : ThirdApexStrongValidKeyCover bank) :
    CardGeThirteenExact13WeightedProviderBankBridge.BankCovers bank := by
  intro I
  obtain ⟨k, hk, hcenter, hsupport, _, ho⟩ :=
    exists_mem_thirdApexStrongValidKeys I
  obtain ⟨e, he, hmatch⟩ := hcover k hk
  exact ⟨e, he, entry_covers_of_key_match I k e hcenter hsupport ho hmatch⟩

end CardGeThirteenExact13ThirdApexSourceCoverage
end ATailFrontierLiveClosure
end Problem97
