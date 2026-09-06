/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SelectedFourClassOneBoundaryIntersection
import Erdos9796Proof.P97.Moser.TriangleNonObtuse
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.CardGeThirteenExact13SourceIndexedBankCoverage

/-!
# Source-refined exact-thirteen key coverage

`Key.Valid` remains the historical finite necessary predicate.  This module
adds only the source-derived, guarded one-boundary incidences for active global
rows, and exposes the corresponding refined coverage adapter.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure
namespace CardGeThirteenExact13StrongSourceCoverage

open ATailCriticalPairFrontier
open ATailExactFourPhysicalConsumer
open ATailExactFourRobustCapExpansion
open ATailUniqueArmRouteAuditScratch
open CardGeThirteenExact13SourceIndexedBankCoverage
open CardGeThirteenExact13SourceIndexedFiniteKey
open CardGeThirteenExact13SourceOrderBridge
open DRExactThirteenValuation
open Exact13GlobalRows
open Exact13Provider
open ExactThirteenBranchIngress
open ProviderRowNogoodCertificate

/-- The source-refined one-boundary incidence condition for active global rows.
The antecedents are essential: a suppressed global row is empty, and the
geometric one-hit lemma applies only when the relevant apex is in that row. -/
def GlobalOneBoundaryValid (k : Key) : Prop :=
  ∀ c : Exact13GlobalCenter,
    (secondApex ∈ k.rawSupport (.g c) →
      (k.rawSupport (.g c) ∩ k.rawSupport .k).card ≤ 1 ∧
      (k.rawSupport (.g c) ∩ k.rawSupport .l).card ≤ 1) ∧
    (firstApex ∈ k.rawSupport (.g c) →
      (k.rawSupport (.g c) ∩ k.rawSupport .t).card ≤ 1)

/-- The old finite validity predicate together with the source-derived guard. -/
def StrongValid (k : Key) : Prop := k.Valid ∧ GlobalOneBoundaryValid k

@[irreducible] noncomputable def strongValidKeys : Finset Key := by
  classical
  exact Finset.univ.filter StrongValid

theorem mem_strongValidKeys_iff (k : Key) :
    k ∈ strongValidKeys ↔ StrongValid k := by
  simp only [strongValidKeys, Finset.mem_filter, Finset.mem_univ, true_and]

/-- A bank cover restricted to source-refined keys. -/
def StrongValidKeyCover
    (bank : List CardGeThirteenExact13WeightedProviderBankBridge.Entry) : Prop :=
  ∀ k ∈ strongValidKeys, ∃ e ∈ bank, KeyEntryCovers k e

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

private theorem mec_boundary_data (I : Input) :
    (MEC.mec I.D.A I.S.hA).center ∈
        convexHull ℝ {q : ℝ² | q ∈ I.D.A ∧
          dist q (MEC.mec I.D.A I.S.hA).center = (MEC.mec I.D.A I.S.hA).radius} ∧
      dist (I.P.pt secondApex) (MEC.mec I.D.A I.S.hA).center =
        (MEC.mec I.D.A I.S.hA).radius := by
  obtain ⟨E⟩ := I.Q.base.exactRows
  have hcenter : (MEC.mec I.D.A I.S.hA).center ∈
      convexHull ℝ {q : ℝ² | q ∈ I.D.A ∧
        dist q (MEC.mec I.D.A I.S.hA).center = (MEC.mec I.D.A I.S.hA).radius} := by
    have hboundarySet : (MEC.boundary I.D.A I.S.hA : Set ℝ²) =
        {q : ℝ² | q ∈ I.D.A ∧
          dist q (MEC.mec I.D.A I.S.hA).center = (MEC.mec I.D.A I.S.hA).radius} := by
      ext q
      exact MEC.mem_boundary_iff I.S.hA
    rw [← hboundarySet]
    exact MEC.mec_center_mem_convexHull_boundary I.S.hA I.S.hncol
  have hPboundary : dist (I.P.pt secondApex) (MEC.mec I.D.A I.S.hA).center =
      (MEC.mec I.D.A I.S.hA).radius := by
    rw [I.P.labelMap.secondApex_eq]
    unfold SurplusCapPacket.oppApex2
    split
    · exact I.S.triangleNonObtuse.toMoserTriangle.v3_boundary
    · exact I.S.triangleNonObtuse.toMoserTriangle.v1_boundary
    · exact I.S.triangleNonObtuse.toMoserTriangle.v2_boundary
  exact ⟨hcenter, hPboundary⟩

private theorem global_center_mem_carrier (I : Input) (c : Exact13GlobalCenter) :
    I.P.pt c.1 ∈ I.D.A := by
  rw [← I.P.labelMap.image_eq]
  exact Finset.mem_image.mpr ⟨c.1, Finset.mem_univ _, rfl⟩

private theorem global_inter_card_le_one
    (I : Input) (c : Exact13GlobalCenter)
    (Fraw : Finset (Fin 13)) {Fcenter : ℝ²}
    (F : SelectedFourClass I.D.A Fcenter)
    (hFcenter : Fcenter = I.P.pt secondApex)
    (hGraw : ((I.globalRows).row c).2.rawSupport.image I.P.pt =
      ((I.globalRows).row c).1.support)
    (hFraw : Fraw.image I.P.pt = F.support)
    (hmem : secondApex ∈ ((I.globalRows).row c).2.rawSupport) :
    (((I.globalRows).row c).2.rawSupport ∩ Fraw).card ≤ 1 := by
  cases hFcenter
  let M := MEC.mec I.D.A I.S.hA
  have hcenter : M.center ∈
      convexHull ℝ {q : ℝ² | q ∈ I.D.A ∧ dist q M.center = M.radius} := by
    simpa [M] using (mec_boundary_data I).1
  have hPboundary : dist (I.P.pt secondApex) M.center = M.radius := by
    simpa [M] using (mec_boundary_data I).2
  have hPC : I.P.pt secondApex ∈ ((I.globalRows).row c).1.support := by
    rw [← hGraw]
    exact Finset.mem_image.mpr ⟨secondApex, hmem, rfl⟩
  rw [raw_intersection_card_eq_of_image_eq I.P hGraw hFraw]
  apply Problem97.SelectedFourClass.inter_card_le_one_of_mem_boundary_apex
    I.D.convex M.enclosing hcenter (global_center_mem_carrier I c)
    hPboundary ((I.globalRows).row c).1 F hPC

private theorem global_inter_card_le_one_first
    (I : Input) (c : Exact13GlobalCenter)
    (Fraw : Finset (Fin 13)) {Fcenter : ℝ²}
    (F : SelectedFourClass I.D.A Fcenter)
    (hFcenter : Fcenter = I.P.pt firstApex)
    (hFraw : Fraw.image I.P.pt = F.support)
    (hmem : firstApex ∈ ((I.globalRows).row c).2.rawSupport) :
    (((I.globalRows).row c).2.rawSupport ∩ Fraw).card ≤ 1 := by
  cases hFcenter
  let M := MEC.mec I.D.A I.S.hA
  have hcenter : M.center ∈
      convexHull ℝ {q : ℝ² | q ∈ I.D.A ∧ dist q M.center = M.radius} := by
    simpa [M] using (mec_boundary_data I).1
  have hPC : I.P.pt firstApex ∈ ((I.globalRows).row c).1.support := by
    rw [← ((I.globalRows).row c).2.rawSupport_image]
    exact Finset.mem_image.mpr ⟨firstApex, hmem, rfl⟩
  rw [raw_intersection_card_eq_of_image_eq I.P
    ((I.globalRows).row c).2.rawSupport_image hFraw]
  apply Problem97.SelectedFourClass.inter_card_le_one_of_mem_boundary_apex
    I.D.convex M.enclosing hcenter (global_center_mem_carrier I c)
    (by
      rw [I.P.labelMap.firstApex_eq]
      unfold SurplusCapPacket.oppApex1
      split
      · change dist I.S.triangleNonObtuse.toMoserTriangle.v2 M.center = M.radius
        simpa [M] using I.S.triangleNonObtuse.toMoserTriangle.v2_boundary
      · change dist I.S.triangleNonObtuse.toMoserTriangle.v3 M.center = M.radius
        simpa [M] using I.S.triangleNonObtuse.toMoserTriangle.v3_boundary
      · change dist I.S.triangleNonObtuse.toMoserTriangle.v1 M.center = M.radius
        simpa [M] using I.S.triangleNonObtuse.toMoserTriangle.v1_boundary)
    ((I.globalRows).row c).1 F hPC

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

theorem globalOneBoundaryValid_of_source
    (I : Input) (k : Key)
    (_hcenter : k.centerOf = I.positionalPattern.centerOf)
    (hsupport : k.supportOf = I.positionalPattern.supportOf)
    (ho : sourceOrderValid I k.orientation) :
    GlobalOneBoundaryValid k := by
  intro c
  have hG := source_global_support_eq I c k hsupport ho
  have hK : k.rawSupport .k = I.X.tightSupport.Kraw := by
    have h := rawSupport_eq_providerSupport I k hsupport ho .k
    simpa [Input.providerPattern, exact13RawProviderPattern_of_dispatch,
      Exact13RawProviderPattern] using h
  have hL : k.rawSupport .l = I.O.Lraw := by
    have h := rawSupport_eq_providerSupport I k hsupport ho .l
    simpa [Input.providerPattern, exact13RawProviderPattern_of_dispatch,
      Exact13RawProviderPattern] using h
  have hT : k.rawSupport .t = I.X.fivePositionalRows.firstApexRow.rawSupport := by
    have h := rawSupport_eq_providerSupport I k hsupport ho .t
    simpa [Input.providerPattern, exact13RawProviderPattern_of_dispatch,
      Exact13RawProviderPattern] using h
  have hGmem : secondApex ∈ k.rawSupport (.g c) →
      secondApex ∈ ((I.globalRows).row c).2.rawSupport := by
    intro h
    have h' : secondApex ∈
        guardedGlobalSupport I.X.fivePositionalRows.blocker₁
          I.X.fivePositionalRows.blocker₂
          (fun c => ((I.globalRows).row c).2.rawSupport) c := by
      rw [← hG]
      exact h
    by_cases hg : c.1 = I.X.fivePositionalRows.blocker₁ ∨
        c.1 = I.X.fivePositionalRows.blocker₂
    · simp [guardedGlobalSupport, hg] at h'
    · simpa [guardedGlobalSupport, hg] using h'
  have hFmem : firstApex ∈ k.rawSupport (.g c) →
      firstApex ∈ ((I.globalRows).row c).2.rawSupport := by
    intro h
    have h' : firstApex ∈
        guardedGlobalSupport I.X.fivePositionalRows.blocker₁
          I.X.fivePositionalRows.blocker₂
          (fun c => ((I.globalRows).row c).2.rawSupport) c := by
      rw [← hG]
      exact h
    by_cases hg : c.1 = I.X.fivePositionalRows.blocker₁ ∨
        c.1 = I.X.fivePositionalRows.blocker₂
    · simp [guardedGlobalSupport, hg] at h'
    · simpa [guardedGlobalSupport, hg] using h'
  have hG_un_guarded {p : Fin 13} (hp : p ∈ k.rawSupport (.g c)) :
      k.rawSupport (.g c) = ((I.globalRows).row c).2.rawSupport := by
    have hp' : p ∈
        guardedGlobalSupport I.X.fivePositionalRows.blocker₁
          I.X.fivePositionalRows.blocker₂
          (fun c => ((I.globalRows).row c).2.rawSupport) c := by
      rw [← hG]
      exact hp
    by_cases hg : c.1 = I.X.fivePositionalRows.blocker₁ ∨
        c.1 = I.X.fivePositionalRows.blocker₂
    · simp [guardedGlobalSupport, hg] at hp'
    · rw [hG]
      simp [guardedGlobalSupport, hg]
  constructor
  · intro hsecond
    have hsecond' := hGmem hsecond
    let hTclass : SelectedFourClass I.D.A I.S.oppApex1 :=
      SelectedFourClass.ofSelectedClass (frontier_radius_pos I.F)
        I.R.class_card_eq_four
    have hTimage : I.X.fivePositionalRows.firstApexRow.rawSupport.image I.P.pt =
        hTclass.support := by
      simpa [hTclass, SelectedFourClass.ofSelectedClass] using
        I.X.fivePositionalRows.firstApexRow.rawSupport_image
    rcases I.O.is_other with h | h
    · have hKimage : I.X.tightSupport.Kraw.image I.P.pt = I.secondRow.support := by
        rw [I.X.tightSupport.Kraw_image, h.1]
      have hLimage : I.O.Lraw.image I.P.pt = I.firstRow.support := h.2
      refine ⟨?_, ?_⟩
      · rw [hG_un_guarded hsecond, hK]
        exact global_inter_card_le_one I c I.X.tightSupport.Kraw I.secondRow
          I.P.labelMap.secondApex_eq.symm
          ((I.globalRows).row c).2.rawSupport_image hKimage hsecond'
      · rw [hG_un_guarded hsecond, hL]
        exact global_inter_card_le_one I c I.O.Lraw I.firstRow
          I.P.labelMap.secondApex_eq.symm
          ((I.globalRows).row c).2.rawSupport_image hLimage hsecond'
    · have hKimage : I.X.tightSupport.Kraw.image I.P.pt = I.firstRow.support := by
        rw [I.X.tightSupport.Kraw_image, h.1]
      have hLimage : I.O.Lraw.image I.P.pt = I.secondRow.support := h.2
      refine ⟨?_, ?_⟩
      · rw [hG_un_guarded hsecond, hK]
        exact global_inter_card_le_one I c I.X.tightSupport.Kraw I.firstRow
          I.P.labelMap.secondApex_eq.symm
          ((I.globalRows).row c).2.rawSupport_image hKimage hsecond'
      · rw [hG_un_guarded hsecond, hL]
        exact global_inter_card_le_one I c I.O.Lraw I.secondRow
          I.P.labelMap.secondApex_eq.symm
          ((I.globalRows).row c).2.rawSupport_image hLimage hsecond'
  · intro hfirst
    have hfirst' := hFmem hfirst
    let hTclass : SelectedFourClass I.D.A I.S.oppApex1 :=
      SelectedFourClass.ofSelectedClass (frontier_radius_pos I.F)
        I.R.class_card_eq_four
    have hTimage : I.X.fivePositionalRows.firstApexRow.rawSupport.image I.P.pt =
        hTclass.support := by
      simpa [hTclass, SelectedFourClass.ofSelectedClass] using
        I.X.fivePositionalRows.firstApexRow.rawSupport_image
    rw [hG_un_guarded hfirst, hT]
    exact global_inter_card_le_one_first I c
      I.X.fivePositionalRows.firstApexRow.rawSupport
      hTclass I.P.labelMap.firstApex_eq.symm hTimage hfirst'

theorem exists_mem_strongValidKeys (I : Input) :
    ∃ k ∈ strongValidKeys,
      k.centerOf = I.positionalPattern.centerOf ∧
      k.supportOf = I.positionalPattern.supportOf ∧
      k.z = I.X.tightSupport.zraw ∧
      sourceOrderValid I k.orientation := by
  obtain ⟨k, hk, hcenter, hsupport, hz, ho, _, _⟩ := exists_valid_key I
  have hstrong := globalOneBoundaryValid_of_source I k hcenter hsupport ho
  exact ⟨k, (mem_strongValidKeys_iff k).2 ⟨hk, hstrong⟩,
    hcenter, hsupport, hz, ho⟩

theorem bankCovers_of_strongValidKeyCover
    (bank : List CardGeThirteenExact13WeightedProviderBankBridge.Entry)
    (hcover : StrongValidKeyCover bank) :
    CardGeThirteenExact13WeightedProviderBankBridge.BankCovers bank := by
  intro I
  obtain ⟨k, hk, hcenter, hsupport, _, ho⟩ := exists_mem_strongValidKeys I
  obtain ⟨e, he, hmatch⟩ := hcover k hk
  exact ⟨e, he, entry_covers_of_key_match I k e hcenter hsupport ho hmatch⟩

end CardGeThirteenExact13StrongSourceCoverage
end ATailFrontierLiveClosure
end Problem97
