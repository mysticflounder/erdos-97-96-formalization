/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.U1LargeCapRouteBTail

/-!
# ATAIL live critical-row provenance

This scratch module retains the common `CriticalShellSystem` used by the outer
Route-B wrapper to construct its five source rows and the additional `f2` row.
The live helper interface currently passes those rows separately and therefore
cannot express the stronger equal-blocker-center coupling proved below.

The module is deliberately not imported by `U1LargeCapRouteBTail` while that
shared source is owned by another proof-blueprint session.
-/

open scoped EuclideanGeometry

namespace Problem97

namespace SelectedFourClass

/-- Transport a selected class across an equality of centers. -/
def transportCenter {A : Finset ℝ²} {center₁ center₂ : ℝ²}
    (K : SelectedFourClass A center₁) (hcenter : center₁ = center₂) :
    SelectedFourClass A center₂ :=
  Eq.mp (congrArg (SelectedFourClass A) hcenter) K

@[simp] theorem transportCenter_support
    {A : Finset ℝ²} {center₁ center₂ : ℝ²}
    (K : SelectedFourClass A center₁) (hcenter : center₁ = center₂) :
    (K.transportCenter hcenter).support = K.support := by
  cases hcenter
  rfl

end SelectedFourClass

namespace CriticalShellSystem

/-- Critical shells selected by one global system have the same complete
support whenever their blocker centers agree.  No agreement of sources,
radii, or chosen slot names is required. -/
theorem selectedAt_support_eq_of_centerAt_eq
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    {source₁ source₂ : ℝ²} (hsource₁ : source₁ ∈ A)
    (hsource₂ : source₂ ∈ A)
    (hcenter : H.centerAt source₁ hsource₁ = H.centerAt source₂ hsource₂) :
    (H.selectedAt source₁ hsource₁).toCriticalFourShell.support =
      (H.selectedAt source₂ hsource₂).toCriticalFourShell.support := by
  let K₂ : SelectedFourClass A (H.centerAt source₁ hsource₁) :=
    (H.selectedAt source₂ hsource₂).toSelectedFourClass.transportCenter
      hcenter.symm
  have hK₂ :
      K₂.support =
        (H.selectedAt source₁ hsource₁).toCriticalFourShell.support :=
    H.selectedFourClass_support_eq_shell source₁ hsource₁ K₂
  have hK₂_source₂ :
      K₂.support =
        (H.selectedAt source₂ hsource₂).toCriticalFourShell.support := by
    simp [K₂, CriticalSelectedFourClass.toSelectedFourClass,
      CriticalFourShell.toSelectedFourClass]
  exact hK₂.symm.trans hK₂_source₂

end CriticalShellSystem

namespace U1Depth5

/-- Proof that the five live source rows and the additional `f2` row were all
constructed from one global critical-shell system.

The equalities are intentionally constructor-level rather than merely
center/slot comparison maps.  They retain the deletion-blocker fact and make
same-center support coupling available even when the two sources differ. -/
structure LiveCriticalRowProvenance
    {D : CounterexampleData} {q t1 t2 t3 u : Plane}
    (rows : CriticalSourceRows D q t1 t2 t3 u)
    (f2Row : CriticalRowPacket D
      (rows.pointOfChoice { source := CriticalSource.t2, slot := 0 })) where
  system : CriticalShellSystem D.A
  rowAt_eq : ∀ source : CriticalSource,
    rows.rowAt source =
      CriticalRowPacket.ofCriticalShellSystem system
        (rows.rowAt source).source_mem
  f2Row_eq : f2Row =
    CriticalRowPacket.ofCriticalShellSystem system f2Row.source_mem

namespace LiveCriticalRowProvenance

/-- The exact provenance packet carried by the construction in the outer
Route-B wrapper. -/
noncomputable def ofCriticalShellSystem
    {D : CounterexampleData} {q t1 t2 t3 u : Plane}
    (H : CriticalShellSystem D.A)
    (hq : q ∈ D.A) (ht1 : t1 ∈ D.A) (ht2 : t2 ∈ D.A)
    (ht3 : t3 ∈ D.A) (hu : u ∈ D.A) :
    let rows := CriticalSourceRows.ofCriticalShellSystem H hq ht1 ht2 ht3 hu
    let f2Row : CriticalRowPacket D
        (rows.pointOfChoice { source := CriticalSource.t2, slot := 0 }) :=
      CriticalRowPacket.ofCriticalShellSystem H
        (rows.pointOfChoice_mem
          { source := CriticalSource.t2, slot := 0 })
    LiveCriticalRowProvenance rows f2Row := by
  dsimp only
  refine
    { system := H
      rowAt_eq := ?_
      f2Row_eq := rfl }
  intro source
  cases source <;> rfl

/-- Every source row retains the blocker fact that deleting its source destroys
all four-point equal-radius witnesses at its chosen center. -/
theorem rowAt_no_qfree
    {D : CounterexampleData} {q t1 t2 t3 u : Plane}
    {rows : CriticalSourceRows D q t1 t2 t3 u}
    {f2Row : CriticalRowPacket D
      (rows.pointOfChoice { source := CriticalSource.t2, slot := 0 })}
    (P : LiveCriticalRowProvenance rows f2Row)
    (source : CriticalSource) :
    ¬ HasNEquidistantPointsAt 4
      (D.A.erase (rows.sourcePoint source)) (rows.rowAt source).center := by
  rw [P.rowAt_eq source]
  exact P.system.no_qfree_at
    (rows.sourcePoint source) (rows.rowAt source).source_mem

/-- The additional `f2` row retains its deletion-blocker fact. -/
theorem f2Row_no_qfree
    {D : CounterexampleData} {q t1 t2 t3 u : Plane}
    {rows : CriticalSourceRows D q t1 t2 t3 u}
    {f2Row : CriticalRowPacket D
      (rows.pointOfChoice { source := CriticalSource.t2, slot := 0 })}
    (P : LiveCriticalRowProvenance rows f2Row) :
    ¬ HasNEquidistantPointsAt 4
      (D.A.erase
        (rows.pointOfChoice { source := CriticalSource.t2, slot := 0 }))
      f2Row.center := by
  rw [P.f2Row_eq]
  exact P.system.no_qfree_at _ f2Row.source_mem

/-- Every four-point class selected at the additional row's blocker center
contains the `f2` source.  This is the packet-label membership requirement
exposed by the retained deletion provenance. -/
theorem f2Source_mem_selectedFourClass
    {D : CounterexampleData} {q t1 t2 t3 u : Plane}
    {rows : CriticalSourceRows D q t1 t2 t3 u}
    {f2Row : CriticalRowPacket D
      (rows.pointOfChoice { source := CriticalSource.t2, slot := 0 })}
    (P : LiveCriticalRowProvenance rows f2Row)
    (K : SelectedFourClass D.A f2Row.center) :
    rows.pointOfChoice { source := CriticalSource.t2, slot := 0 } ∈
      K.support := by
  have hcenter := congrArg (fun row => row.center) P.f2Row_eq
  let K' := K.transportCenter hcenter
  have hmem := P.system.source_mem_selectedFourClass _ f2Row.source_mem K'
  rw [K.transportCenter_support hcenter] at hmem
  exact hmem

/-- A globally selected row at the additional row's blocker center is exactly
the additional row's complete critical support. -/
theorem selectedFourClass_support_eq_f2Row
    {D : CounterexampleData} {q t1 t2 t3 u : Plane}
    {rows : CriticalSourceRows D q t1 t2 t3 u}
    {f2Row : CriticalRowPacket D
      (rows.pointOfChoice { source := CriticalSource.t2, slot := 0 })}
    (P : LiveCriticalRowProvenance rows f2Row)
    (K : SelectedFourClass D.A f2Row.center) :
    K.support = f2Row.selected.toCriticalFourShell.support := by
  have hcenter := congrArg (fun row => row.center) P.f2Row_eq
  let K' := K.transportCenter hcenter
  have hbank :=
    P.system.selectedFourClass_support_eq_shell _ f2Row.source_mem K'
  have hf2Support := congrArg
    (fun row => row.selected.toCriticalFourShell.support) P.f2Row_eq
  exact (K.transportCenter_support hcenter).symm.trans
    (hbank.trans hf2Support.symm)

/-- Named-center form of `f2Source_mem_selectedFourClass`, matching the
`center_q`, `center_t1`, `center_t2`, `center_t3`, and `center_u` LIVE-C
branches. -/
theorem f2Source_mem_selectedFourClass_of_center_eq
    {D : CounterexampleData} {q t1 t2 t3 u center : Plane}
    {rows : CriticalSourceRows D q t1 t2 t3 u}
    {f2Row : CriticalRowPacket D
      (rows.pointOfChoice { source := CriticalSource.t2, slot := 0 })}
    (P : LiveCriticalRowProvenance rows f2Row)
    (K : SelectedFourClass D.A center) (hcenter : f2Row.center = center) :
    rows.pointOfChoice { source := CriticalSource.t2, slot := 0 } ∈
      K.support := by
  subst center
  exact P.f2Source_mem_selectedFourClass K

/-- Named-center form of `selectedFourClass_support_eq_f2Row`: every selected
K4 row at a LIVE-C named blocker center is the complete `f2` critical shell. -/
theorem selectedFourClass_support_eq_f2Row_of_center_eq
    {D : CounterexampleData} {q t1 t2 t3 u center : Plane}
    {rows : CriticalSourceRows D q t1 t2 t3 u}
    {f2Row : CriticalRowPacket D
      (rows.pointOfChoice { source := CriticalSource.t2, slot := 0 })}
    (P : LiveCriticalRowProvenance rows f2Row)
    (K : SelectedFourClass D.A center) (hcenter : f2Row.center = center) :
    K.support = f2Row.selected.toCriticalFourShell.support := by
  subst center
  exact P.selectedFourClass_support_eq_f2Row K

/-- The f2 critical row itself is the q-critical arm of the global-K4
dichotomy after deleting its source.  This packages the retained information
in the existing U5 consumer vocabulary; it is not a contradiction. -/
theorem f2Row_to_qCriticalTriple
    {D : CounterexampleData} {q t1 t2 t3 u : Plane}
    {rows : CriticalSourceRows D q t1 t2 t3 u}
    (f2Row : CriticalRowPacket D
      (rows.pointOfChoice { source := CriticalSource.t2, slot := 0 })) :
    Nonempty (U5QCriticalTripleClass D
      (rows.pointOfChoice { source := CriticalSource.t2, slot := 0 })
      f2Row.center
      (f2Row.selected.toCriticalFourShell.support.erase
        (rows.pointOfChoice { source := CriticalSource.t2, slot := 0 }))) := by
  classical
  let Krow : SelectedFourClass D.A f2Row.center :=
    f2Row.selected.toSelectedFourClass
  let Kallowed : U5QAllowedK4Class D f2Row.center Krow.support :=
    { subset := by
        intro y hy
        exact Finset.mem_erase.mpr
          ⟨fun hycenter => Krow.center_not_mem (by simpa [hycenter] using hy),
            Krow.support_subset_A hy⟩
      card_four := by rw [Krow.support_card]
      radius := Krow.radius
      radius_pos := Krow.radius_pos
      same_radius := Krow.support_eq_radius }
  have hsource :
      rows.pointOfChoice { source := CriticalSource.t2, slot := 0 } ∈
        Krow.support := by
    simpa [Krow, CriticalSelectedFourClass.toSelectedFourClass,
      CriticalFourShell.toSelectedFourClass] using
        f2Row.selected.toCriticalFourShell.q_mem_support
  have hcritical := U5QAllowedK4Class.qCriticalTriple_of_mem_q
    Kallowed Krow.support_card hsource
  simpa [Krow, CriticalSelectedFourClass.toSelectedFourClass,
    CriticalFourShell.toSelectedFourClass] using hcritical

/-- Any additional critical row centered away from the dangerous apex has at
least two support points outside the exact dangerous four-point circle.

This is the strongest selection-robust positive row fact currently available
uniformly in all seven LIVE-C center branches.  It is only a one-center
off-dangerous pair, not the two-center off-surplus pair required by
`DoubleApexOffSurplusSharedRadiusPair`. -/
theorem two_le_f2Row_support_sdiff_dangerousBase
    {D : CounterexampleData} {p q t1 t2 t3 u : Plane}
    (hfixed : U3FixedTriplePacket D q p t1 t2 t3)
    {rows : CriticalSourceRows D q t1 t2 t3 u}
    (f2Row : CriticalRowPacket D
      (rows.pointOfChoice { source := CriticalSource.t2, slot := 0 }))
    (hcenter_ne_p : f2Row.center ≠ p) :
    2 ≤ (f2Row.selected.toCriticalFourShell.support \
      ({q, t1, t2, t3} : Finset Plane)).card := by
  classical
  let Krow : SelectedFourClass D.A f2Row.center :=
    f2Row.selected.toSelectedFourClass
  let Kbase : SelectedFourClass D.A p :=
    dangerousBaseSelectedFourClass hfixed
  have hinter_le : (Krow.support ∩ Kbase.support).card ≤ 2 :=
    SelectedFourClass.inter_card_le_two Krow Kbase hcenter_ne_p
  have hsplit :
      (Krow.support ∩ Kbase.support).card +
          (Krow.support \ Kbase.support).card = Krow.support.card :=
    Finset.card_inter_add_card_sdiff Krow.support Kbase.support
  have hrow_card : Krow.support.card = 4 := Krow.support_card
  have htwo : 2 ≤ (Krow.support \ Kbase.support).card := by omega
  simpa [Krow, Kbase, dangerousBaseSelectedFourClass,
    CriticalSelectedFourClass.toSelectedFourClass,
    CriticalFourShell.toSelectedFourClass] using htwo

/-- Witness form of `two_le_f2Row_support_sdiff_dangerousBase`: the live f2
row supplies two distinct, same-f2-radius points off the dangerous base. -/
theorem exists_two_f2Row_support_off_dangerousBase
    {D : CounterexampleData} {p q t1 t2 t3 u : Plane}
    (hfixed : U3FixedTriplePacket D q p t1 t2 t3)
    {rows : CriticalSourceRows D q t1 t2 t3 u}
    (f2Row : CriticalRowPacket D
      (rows.pointOfChoice { source := CriticalSource.t2, slot := 0 }))
    (hcenter_ne_p : f2Row.center ≠ p) :
    ∃ x w : Plane,
      x ≠ w ∧
        x ∈ f2Row.selected.toCriticalFourShell.support ∧
        w ∈ f2Row.selected.toCriticalFourShell.support ∧
        x ∉ ({q, t1, t2, t3} : Finset Plane) ∧
        w ∉ ({q, t1, t2, t3} : Finset Plane) := by
  classical
  let outside := f2Row.selected.toCriticalFourShell.support \
    ({q, t1, t2, t3} : Finset Plane)
  have htwo : 2 ≤ outside.card := by
    simpa [outside] using
      two_le_f2Row_support_sdiff_dangerousBase hfixed f2Row hcenter_ne_p
  have hone : 1 < outside.card := by omega
  rcases Finset.one_lt_card.mp hone with ⟨x, hx, w, hw, hxw⟩
  rcases Finset.mem_sdiff.mp hx with ⟨hxSupport, hxOff⟩
  rcases Finset.mem_sdiff.mp hw with ⟨hwSupport, hwOff⟩
  exact ⟨x, w, hxw, hxSupport, hwSupport, hxOff, hwOff⟩

/-- Two of the five source rows have identical complete supports whenever
their blocker centers agree. -/
theorem rowAt_support_eq_of_center_eq
    {D : CounterexampleData} {q t1 t2 t3 u : Plane}
    {rows : CriticalSourceRows D q t1 t2 t3 u}
    {f2Row : CriticalRowPacket D
      (rows.pointOfChoice { source := CriticalSource.t2, slot := 0 })}
    (P : LiveCriticalRowProvenance rows f2Row)
    (source₁ source₂ : CriticalSource)
    (hcenter : (rows.rowAt source₁).center = (rows.rowAt source₂).center) :
    (rows.rowAt source₁).selected.toCriticalFourShell.support =
      (rows.rowAt source₂).selected.toCriticalFourShell.support := by
  rw [P.rowAt_eq source₁, P.rowAt_eq source₂] at hcenter ⊢
  exact P.system.selectedAt_support_eq_of_centerAt_eq
    (rows.rowAt source₁).source_mem (rows.rowAt source₂).source_mem hcenter

/-- The additional `f2` row and any source row have identical complete
supports whenever their blocker centers agree, without any source collision or
selected-slot equality assumption. -/
theorem f2Row_support_eq_rowAt_of_center_eq
    {D : CounterexampleData} {q t1 t2 t3 u : Plane}
    {rows : CriticalSourceRows D q t1 t2 t3 u}
    {f2Row : CriticalRowPacket D
      (rows.pointOfChoice { source := CriticalSource.t2, slot := 0 })}
    (P : LiveCriticalRowProvenance rows f2Row)
    (source : CriticalSource)
    (hcenter : f2Row.center = (rows.rowAt source).center) :
    f2Row.selected.toCriticalFourShell.support =
      (rows.rowAt source).selected.toCriticalFourShell.support := by
  rw [P.f2Row_eq, P.rowAt_eq source] at hcenter ⊢
  exact P.system.selectedAt_support_eq_of_centerAt_eq
    f2Row.source_mem (rows.rowAt source).source_mem hcenter

end LiveCriticalRowProvenance

end U1Depth5

end Problem97
