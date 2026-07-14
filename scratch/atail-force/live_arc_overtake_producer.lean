/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.U1LargeCapRouteBTail
import Erdos9796Proof.P97.ErasedCertificate.CardElevenBridgeStaging
import Erdos9796Proof.P97.Census554.SixPointTwoCircleArcOvertakeCarrierBridge

/-!
# Live arc-overtake producer boundary

This scratch module records the smallest currently known live-facing producer
for the six-point arc-overtake consumer.  It deliberately uses the existing
five-row surface: the dangerous row at `p`, one row selected by an arbitrary
critical-shell system, and the already-supplied `u` row are preserved in one
faithful carrier pattern.  No assertion that the `u` row came from the same
critical-shell system is needed.

The remaining mathematical producer obligation is exactly the existence of a
dangerous permutation `A,C,D,E` satisfying the two named row memberships and
the six-label boundary order in `LiveArcOvertakeFields` below.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace U1Depth5
namespace LiveArcOvertakeProducer

open Census554.GeneralCarrierBridge
open Census554.SixPointTwoCircleArcOvertakeCarrierBridge

private def transportCenter {carrier : Finset ℝ²} {center₁ center₂ : ℝ²}
    (K : SelectedFourClass carrier center₁) (hcenter : center₁ = center₂) :
    SelectedFourClass carrier center₂ :=
  Eq.mp (congrArg (SelectedFourClass carrier) hcenter) K

@[simp] private theorem transportCenter_support
    {carrier : Finset ℝ²} {center₁ center₂ : ℝ²}
    (K : SelectedFourClass carrier center₁) (hcenter : center₁ = center₂) :
    (transportCenter K hcenter).support = K.support := by
  cases hcenter
  rfl

private theorem first_ne_third_of_quad_card_four
    {alpha : Type*} [DecidableEq alpha] {a b c d : alpha}
    (hcard : ({a, b, c, d} : Finset alpha).card = 4) : a ≠ c := by
  intro hac
  subst c
  have hsubset : ({a, b, a, d} : Finset alpha) ⊆ ({a, b, d} : Finset alpha) := by
    intro x hx
    simp only [Finset.mem_insert, Finset.mem_singleton] at hx ⊢
    aesop
  have hle : ({a, b, a, d} : Finset alpha).card ≤ 3 := by
    have h₁ := Finset.card_insert_le a ({b, d} : Finset alpha)
    have h₂ := Finset.card_insert_le b ({d} : Finset alpha)
    have h₃ : ({d} : Finset alpha).card = 1 := Finset.card_singleton d
    have hsubcard := Finset.card_le_card hsubset
    omega
  omega

/-- The exact missing incidence/order packet on the existing live five-row
surface.  All four named centers are carrier labels, so their carrier
membership is retained without auxiliary proof arguments. -/
structure LiveArcOvertakeFields
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    (hfixed : U3FixedTriplePacket D q p t1 t2 t3)
    (Hcritical : CriticalShellSystem D.A)
    (rows : CriticalSourceRows D q t1 t2 t3 u)
    (boundary : BoundaryIndexing D.A) where
  A : CarrierLabel D.A
  C : CarrierLabel D.A
  Dcenter : CarrierLabel D.A
  E : CarrierLabel D.A
  dangerous_permutation :
    ({A.1, C.1, Dcenter.1, E.1} : Finset ℝ²) =
      ({q, t1, t2, t3} : Finset ℝ²)
  critical_center_at_p :
    Hcritical.centerAt p hfixed.p_mem = A.1
  C_mem_critical_p_support :
    C.1 ∈
      (Hcritical.selectedAt p hfixed.p_mem).toCriticalFourShell.support
  uRow_center : rows.uRow.center = Dcenter.1
  A_mem_uRow_support :
    A.1 ∈ rows.uRow.selected.toCriticalFourShell.support
  E_mem_uRow_support :
    E.1 ∈ rows.uRow.selected.toCriticalFourShell.support
  cyclic : CyclicSubsequence boundary
    ⟨p, hfixed.p_mem⟩ A Dcenter E ⟨u, rows.uRow.source_mem⟩ C

/-- The minimal live arc-overtake packet is inconsistent.  The proof preserves
three selected classes in one faithful carrier pattern and invokes the generic
three-row arbitrary-carrier adapter. -/
theorem false_of_liveArcOvertakeFields
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    (hfixed : U3FixedTriplePacket D q p t1 t2 t3)
    (Hcritical : CriticalShellSystem D.A)
    (rows : CriticalSourceRows D q t1 t2 t3 u)
    (boundary : BoundaryIndexing D.A)
    (fields : LiveArcOvertakeFields hfixed Hcritical rows boundary) :
    False := by
  classical
  let Kp : SelectedFourClass D.A p :=
    dangerousBaseSelectedFourClass hfixed
  let KA₀ : SelectedFourClass D.A
      (Hcritical.centerAt p hfixed.p_mem) :=
    (Hcritical.selectedAt p hfixed.p_mem).toSelectedFourClass
  let KA : SelectedFourClass D.A fields.A.1 :=
    transportCenter KA₀ fields.critical_center_at_p
  let KD₀ : SelectedFourClass D.A rows.uRow.center :=
    rows.uRow.selected.toSelectedFourClass
  let KD : SelectedFourClass D.A fields.Dcenter.1 :=
    transportCenter KD₀ fields.uRow_center

  have hAin : fields.A.1 ∈ Kp.support := by
    change fields.A.1 ∈ ({q, t1, t2, t3} : Finset ℝ²)
    rw [← fields.dangerous_permutation]
    simp
  have hCin : fields.C.1 ∈ Kp.support := by
    change fields.C.1 ∈ ({q, t1, t2, t3} : Finset ℝ²)
    rw [← fields.dangerous_permutation]
    simp
  have hDin : fields.Dcenter.1 ∈ Kp.support := by
    change fields.Dcenter.1 ∈ ({q, t1, t2, t3} : Finset ℝ²)
    rw [← fields.dangerous_permutation]
    simp
  have hEin : fields.E.1 ∈ Kp.support := by
    change fields.E.1 ∈ ({q, t1, t2, t3} : Finset ℝ²)
    rw [← fields.dangerous_permutation]
    simp

  have hpA : p ≠ fields.A.1 := by
    intro hpA
    apply Kp.center_not_mem
    simpa [hpA] using hAin
  have hpD : p ≠ fields.Dcenter.1 := by
    intro hpD
    apply Kp.center_not_mem
    simpa [hpD] using hDin
  have hquadCard :
      ({fields.A.1, fields.C.1, fields.Dcenter.1, fields.E.1} :
          Finset ℝ²).card = 4 := by
    rw [fields.dangerous_permutation]
    simpa [Kp] using Kp.support_card
  have hAD : fields.A.1 ≠ fields.Dcenter.1 :=
    first_ne_third_of_quad_card_four hquadCard

  obtain ⟨F, hFp, hFA, hFD⟩ :=
    ErasedCertificate.exists_faithfulCarrierPattern_with_three_classes
      D.K4 hfixed.p_mem fields.A.2 fields.Dcenter.2 hpA hpD hAD Kp KA KD

  let data : ThreeRowSupportData F := {
    o := ⟨p, hfixed.p_mem⟩
    a := fields.A
    c := fields.C
    d := fields.Dcenter
    e := fields.E
    f := ⟨u, rows.uRow.source_mem⟩
    a_mem_o := by
      rw [hFp hfixed.p_mem]
      exact hAin
    c_mem_o := by
      rw [hFp hfixed.p_mem]
      exact hCin
    d_mem_o := by
      rw [hFp hfixed.p_mem]
      exact hDin
    e_mem_o := by
      rw [hFp hfixed.p_mem]
      exact hEin
    o_mem_a := by
      rw [hFA fields.A.2]
      simpa [KA, KA₀] using
        (Hcritical.selectedAt p hfixed.p_mem).toCriticalFourShell.q_mem_support
    c_mem_a := by
      rw [hFA fields.A.2]
      simpa [KA, KA₀] using fields.C_mem_critical_p_support
    a_mem_d := by
      rw [hFD fields.Dcenter.2]
      simpa [KD, KD₀] using fields.A_mem_uRow_support
    e_mem_d := by
      rw [hFD fields.Dcenter.2]
      simpa [KD, KD₀] using fields.E_mem_uRow_support
    f_mem_d := by
      rw [hFD fields.Dcenter.2]
      simpa [KD, KD₀] using
        rows.uRow.selected.toCriticalFourShell.q_mem_support }
  exact false_of_three_rows_and_cyclic_subsequence F boundary data fields.cyclic

/-- Stronger blocker-fiber formulation.  A collision
`centerAt p = centerAt C = A` automatically supplies the minimal packet's
`C`-membership in the exact critical row selected for source `p`.

This corollary makes the common-system provenance explicit while also showing
that no provenance equality between that system and `rows.uRow` is required. -/
theorem false_of_commonSystemFiberCollision
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    (hfixed : U3FixedTriplePacket D q p t1 t2 t3)
    (Hcritical : CriticalShellSystem D.A)
    (rows : CriticalSourceRows D q t1 t2 t3 u)
    (boundary : BoundaryIndexing D.A)
    (A C Dcenter E : CarrierLabel D.A)
    (hdangerous :
      ({A.1, C.1, Dcenter.1, E.1} : Finset ℝ²) =
        ({q, t1, t2, t3} : Finset ℝ²))
    (hcenterP : Hcritical.centerAt p hfixed.p_mem = A.1)
    (hcenterC : Hcritical.centerAt C.1 C.2 = A.1)
    (huCenter : rows.uRow.center = Dcenter.1)
    (hAu : A.1 ∈ rows.uRow.selected.toCriticalFourShell.support)
    (hEu : E.1 ∈ rows.uRow.selected.toCriticalFourShell.support)
    (hcyclic : CyclicSubsequence boundary
      ⟨p, hfixed.p_mem⟩ A Dcenter E ⟨u, rows.uRow.source_mem⟩ C) :
    False := by
  let KpAtC : SelectedFourClass D.A (Hcritical.centerAt C.1 C.2) :=
    transportCenter
      (Hcritical.selectedAt p hfixed.p_mem).toSelectedFourClass
      (hcenterP.trans hcenterC.symm)
  have hCmem :
      C.1 ∈
        (Hcritical.selectedAt p hfixed.p_mem).toCriticalFourShell.support := by
    have hmem := Hcritical.source_mem_selectedFourClass C.1 C.2 KpAtC
    simpa [KpAtC] using hmem
  exact false_of_liveArcOvertakeFields hfixed Hcritical rows boundary {
    A := A
    C := C
    Dcenter := Dcenter
    E := E
    dangerous_permutation := hdangerous
    critical_center_at_p := hcenterP
    C_mem_critical_p_support := hCmem
    uRow_center := huCenter
    A_mem_uRow_support := hAu
    E_mem_uRow_support := hEu
    cyclic := hcyclic }

#print axioms false_of_liveArcOvertakeFields
#print axioms false_of_commonSystemFiberCollision

end LiveArcOvertakeProducer
end U1Depth5
end Problem97
