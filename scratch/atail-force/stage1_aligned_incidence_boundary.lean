/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import live_arc_overtake_producer

/-!
# ATAIL Stage-I aligned-incidence boundary

This scratch module separates the incidence producer from the independent
cyclic-order producer in `LiveArcOvertakeFields`.  The structure below is the
same live-facing packet with the cyclic field removed.  It is therefore the
weakest direct Stage-I packet currently feeding the checked arc-overtake
consumer without introducing stronger common-fiber hypotheses.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace U1Depth5
namespace LiveArcOvertakeProducer

open Census554.GeneralCarrierBridge
open Census554.SixPointTwoCircleArcOvertakeCarrierBridge

/-- The live arc-overtake packet before the independent cyclic-order field is
supplied.  In particular, the `p`-critical row and the supplied `u` row are
allowed to come from different critical-shell systems. -/
structure LiveArcOvertakeStageOneFields
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    (hfixed : U3FixedTriplePacket D q p t1 t2 t3)
    (Hcritical : CriticalShellSystem D.A)
    (rows : CriticalSourceRows D q t1 t2 t3 u) where
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

private theorem first_ne_fourth_of_quad_card_four
    {α : Type*} [DecidableEq α] {a b c d : α}
    (hcard : ({a, b, c, d} : Finset α).card = 4) : a ≠ d := by
  intro had
  subst d
  have hsubset :
      ({a, b, c, a} : Finset α) ⊆ ({a, b, c} : Finset α) := by
    intro x hx
    simp only [Finset.mem_insert, Finset.mem_singleton] at hx ⊢
    aesop
  have hle : ({a, b, c, a} : Finset α).card ≤ 3 := by
    have h₁ := Finset.card_insert_le a ({b, c} : Finset α)
    have h₂ := Finset.card_insert_le b ({c} : Finset α)
    have h₃ : ({c} : Finset α).card = 1 := Finset.card_singleton c
    have hsubcard := Finset.card_le_card hsubset
    omega
  omega

/-- The Stage-I packet already forces the first quantitative frontier:
the supplied `u` row has at least two dangerous-base support members. -/
theorem two_le_uRow_inter_dangerousBase
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    (hfixed : U3FixedTriplePacket D q p t1 t2 t3)
    (Hcritical : CriticalShellSystem D.A)
    (rows : CriticalSourceRows D q t1 t2 t3 u)
    (fields : LiveArcOvertakeStageOneFields hfixed Hcritical rows) :
    2 ≤ (rows.uRow.selected.toCriticalFourShell.support ∩
      ({q, t1, t2, t3} : Finset ℝ²)).card := by
  classical
  let Kp : SelectedFourClass D.A p :=
    dangerousBaseSelectedFourClass hfixed
  have hquadCard :
      ({fields.A.1, fields.C.1, fields.Dcenter.1, fields.E.1} :
          Finset ℝ²).card = 4 := by
    rw [fields.dangerous_permutation]
    simpa [Kp] using Kp.support_card
  have hAE : fields.A.1 ≠ fields.E.1 :=
    first_ne_fourth_of_quad_card_four hquadCard
  have hABase : fields.A.1 ∈ ({q, t1, t2, t3} : Finset ℝ²) := by
    rw [← fields.dangerous_permutation]
    simp
  have hEBase : fields.E.1 ∈ ({q, t1, t2, t3} : Finset ℝ²) := by
    rw [← fields.dangerous_permutation]
    simp
  have hsubset :
      ({fields.A.1, fields.E.1} : Finset ℝ²) ⊆
        rows.uRow.selected.toCriticalFourShell.support ∩
          ({q, t1, t2, t3} : Finset ℝ²) := by
    intro z hz
    simp only [Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with rfl | rfl
    · exact Finset.mem_inter.mpr
        ⟨fields.A_mem_uRow_support, hABase⟩
    · exact Finset.mem_inter.mpr
        ⟨fields.E_mem_uRow_support, hEBase⟩
  have hcard := Finset.card_le_card hsubset
  simpa [hAE] using hcard

/-- The lower bound saturates the two-circle upper bound: the Stage-I packet
forces exactly two dangerous-base hits in the supplied `u` row. -/
theorem uRow_inter_dangerousBase_card_eq_two
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    (hfixed : U3FixedTriplePacket D q p t1 t2 t3)
    (Hcritical : CriticalShellSystem D.A)
    (rows : CriticalSourceRows D q t1 t2 t3 u)
    (fields : LiveArcOvertakeStageOneFields hfixed Hcritical rows) :
    (rows.uRow.selected.toCriticalFourShell.support ∩
      ({q, t1, t2, t3} : Finset ℝ²)).card = 2 := by
  classical
  let Kp : SelectedFourClass D.A p :=
    dangerousBaseSelectedFourClass hfixed
  let Ku : SelectedFourClass D.A rows.uRow.center :=
    rows.uRow.selected.toSelectedFourClass
  have hDBase :
      fields.Dcenter.1 ∈ ({q, t1, t2, t3} : Finset ℝ²) := by
    rw [← fields.dangerous_permutation]
    simp
  have hD_ne_p : fields.Dcenter.1 ≠ p := by
    intro hDp
    apply Kp.center_not_mem
    change p ∈ ({q, t1, t2, t3} : Finset ℝ²)
    simpa [hDp] using hDBase
  have hcenter_ne_p : rows.uRow.center ≠ p := by
    intro hcenter
    exact hD_ne_p (fields.uRow_center.symm.trans hcenter)
  have hle :
      (rows.uRow.selected.toCriticalFourShell.support ∩
        ({q, t1, t2, t3} : Finset ℝ²)).card ≤ 2 := by
    have h := SelectedFourClass.inter_card_le_two Ku Kp hcenter_ne_p
    simpa [Ku, Kp, dangerousBaseSelectedFourClass,
      CriticalSelectedFourClass.toSelectedFourClass,
      CriticalFourShell.toSelectedFourClass] using h
  have hge :=
    two_le_uRow_inter_dangerousBase hfixed Hcritical rows fields
  omega

/-- Adding exactly the independent cyclic-order field reconstructs the final
consumer packet without any further incidence assumptions. -/
def LiveArcOvertakeStageOneFields.toLiveFields
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    {hfixed : U3FixedTriplePacket D q p t1 t2 t3}
    {Hcritical : CriticalShellSystem D.A}
    {rows : CriticalSourceRows D q t1 t2 t3 u}
    (fields : LiveArcOvertakeStageOneFields hfixed Hcritical rows)
    (boundary : BoundaryIndexing D.A)
    (hcyclic : CyclicSubsequence boundary
      ⟨p, hfixed.p_mem⟩ fields.A fields.Dcenter fields.E
        ⟨u, rows.uRow.source_mem⟩ fields.C) :
    LiveArcOvertakeFields hfixed Hcritical rows boundary where
  A := fields.A
  C := fields.C
  Dcenter := fields.Dcenter
  E := fields.E
  dangerous_permutation := fields.dangerous_permutation
  critical_center_at_p := fields.critical_center_at_p
  C_mem_critical_p_support := fields.C_mem_critical_p_support
  uRow_center := fields.uRow_center
  A_mem_uRow_support := fields.A_mem_uRow_support
  E_mem_uRow_support := fields.E_mem_uRow_support
  cyclic := hcyclic

#print axioms two_le_uRow_inter_dangerousBase
#print axioms uRow_inter_dangerousBase_card_eq_two
#print axioms LiveArcOvertakeStageOneFields.toLiveFields

end LiveArcOvertakeProducer
end U1Depth5
end Problem97
