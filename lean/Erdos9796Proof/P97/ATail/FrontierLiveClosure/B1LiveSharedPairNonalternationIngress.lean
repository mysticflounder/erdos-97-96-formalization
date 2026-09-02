/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.EqualBlockerContinuation
import Erdos9796Proof.P97.Census554.GeneralCarrierBridge
import Erdos9796Proof.P97.SurplusCOMPGBankSep

/-!
# B1 shared-pair nonalternation ingress

This module connects the two-point live-slice count in the B1 five/six normal
form to the cardinality-free shared-pair consumer.  All source-entitled
incidence and boundary-index data are discharged here.  The remaining input is
only that the two points of each live slice occupy the same open boundary arc
between the physical apex and the live-row center.
-/

namespace Problem97
namespace ATailFrontierLiveClosure

open scoped EuclideanGeometry
open ATailCriticalPairFrontier
open ATailUniqueFourLateChoiceTerminalScratch
open Census554.GeneralCarrierBridge

attribute [local instance] Classical.propDecidable

/-- The second physical apex is an ambient carrier vertex. -/
theorem b1_oppApex2_mem_A {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex2 ∈ A := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v3_mem
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v1_mem
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v2_mem

/-- Every two distinct boundary points of `slice` lie on the same side of the
cyclic cut from `apex` to `source`.  For a slice of cardinality at most two,
this is exactly the order bit consumed by the shared-pair obstruction. -/
def B1SliceSameBoundaryArc {A : Finset ℝ²} (B : BoundaryIndexing A)
    (apex source : CarrierLabel A) (slice : Finset ℝ²) : Prop :=
  ∀ ix iy : Fin B.n,
    B.boundary ix ∈ slice →
    B.boundary iy ∈ slice →
    ix ≠ iy →
    (SurplusCOMPGBank.btw (B.indexOf apex) (B.indexOf source) ix ↔
      SurplusCOMPGBank.btw (B.indexOf apex) (B.indexOf source) iy)

/-- A two-point intersection of a positive-radius selected class and an exact
critical row is contradictory once its two points are on one boundary arc
between the two row centers. -/
theorem false_of_criticalShell_slice_card_two_of_sameBoundaryArc
    {A : Finset ℝ²} (B : BoundaryIndexing A)
    (apex source : CarrierLabel A) (hapexSource : apex ≠ source)
    {radius : ℝ} (hradius : 0 < radius)
    {q : ℝ²} (row : CriticalFourShell A q source.1)
    (hsliceCard :
      (row.support ∩ SelectedClass A apex.1 radius).card = 2)
    (hsame : B1SliceSameBoundaryArc B apex source
      (row.support ∩ SelectedClass A apex.1 radius)) : False := by
  classical
  let slice := row.support ∩ SelectedClass A apex.1 radius
  obtain ⟨x, y, hxy, hslice⟩ :
      ∃ x y, x ≠ y ∧ slice = {x, y} := by
    simpa [slice] using Finset.card_eq_two.mp hsliceCard
  have hxSlice : x ∈ slice := by rw [hslice]; simp
  have hySlice : y ∈ slice := by rw [hslice]; simp
  have hxA : x ∈ A := row.support_subset_A (Finset.mem_inter.mp hxSlice).1
  have hyA : y ∈ A := row.support_subset_A (Finset.mem_inter.mp hySlice).1
  let xLabel : CarrierLabel A := ⟨x, hxA⟩
  let yLabel : CarrierLabel A := ⟨y, hyA⟩
  let ic := B.indexOf apex
  let id := B.indexOf source
  let ix := B.indexOf xLabel
  let iy := B.indexOf yLabel
  have hicd : ic ≠ id := B.index_injective.ne hapexSource
  have hxyLabel : xLabel ≠ yLabel := by
    intro h
    exact hxy (congrArg Subtype.val h)
  have hxiy : ix ≠ iy := B.index_injective.ne hxyLabel
  have hxPoint : B.boundary ix = x := by
    simpa [ix, xLabel] using B.point_eq xLabel
  have hyPoint : B.boundary iy = y := by
    simpa [iy, yLabel] using B.point_eq yLabel
  have hxSlice' : B.boundary ix ∈ slice := by
    rw [hxPoint]
    exact hxSlice
  have hySlice' : B.boundary iy ∈ slice := by
    rw [hyPoint]
    exact hySlice
  have hapexPoint : B.boundary ic = apex.1 := by
    simpa [ic] using B.point_eq apex
  have hsourcePoint : B.boundary id = source.1 := by
    simpa [id] using B.point_eq source
  have hxClass := (Finset.mem_inter.mp hxSlice).2
  have hyClass := (Finset.mem_inter.mp hySlice).2
  have hxRow := (Finset.mem_inter.mp hxSlice).1
  have hyRow := (Finset.mem_inter.mp hySlice).1
  have hyNeApex : y ≠ apex.1 := by
    intro h
    have hdist := (mem_selectedClass.mp hyClass).2
    rw [h] at hdist
    have hradiusZero : radius = 0 := by simpa using hdist.symm
    exact (ne_of_gt hradius) hradiusZero
  have hiyc : iy ≠ ic := by
    apply B.index_injective.ne
    intro h
    exact hyNeApex (congrArg Subtype.val h)
  have hiyd : iy ≠ id := by
    apply B.index_injective.ne
    intro h
    have hyEq : y = source.1 := congrArg Subtype.val h
    exact row.center_not_mem_support
      (show source.1 ∈ row.support by simpa only [hyEq] using hyRow)
  have hcenterA :
      dist (B.boundary ix) (B.boundary ic) =
        dist (B.boundary iy) (B.boundary ic) := by
    rw [hxPoint, hyPoint, hapexPoint]
    simpa only [dist_comm] using
      (mem_selectedClass.mp hxClass).2.trans
        (mem_selectedClass.mp hyClass).2.symm
  have hcenterD :
      dist (B.boundary ix) (B.boundary id) =
        dist (B.boundary iy) (B.boundary id) := by
    rw [hxPoint, hyPoint, hsourcePoint]
    simpa only [dist_comm] using
      (row.support_eq_radius x hxRow).trans
        (row.support_eq_radius y hyRow).symm
  have hseparated :
      SurplusCOMPGBank.btw ic id ix ↔
        ¬ SurplusCOMPGBank.btw ic id iy :=
    SurplusCOMPGBank.btw_sep B.boundary_ccw B.boundary_injective
      hicd hiyc hiyd hcenterA hcenterD
      (B.boundary_injective.ne hxiy)
  have hsame' := hsame ix iy hxSlice' hySlice' hxiy
  by_cases hx : SurplusCOMPGBank.btw ic id ix
  · exact (hseparated.mp hx) (hsame'.mp hx)
  · have hy : SurplusCOMPGBank.btw ic id iy := by
      by_contra hny
      exact hx (hseparated.mpr hny)
    exact hx (hsame'.mpr hy)

/-- The exact remaining order producer for the two live rows in a B1 normal
form.  It supplies one global boundary indexing of the ambient carrier and the
same-arc bit for whichever live slice has cardinality two. -/
def B1LiveSlicesSameBoundaryArc
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F)) : Prop :=
  ∃ B : BoundaryIndexing D.A,
    let apex : CarrierLabel D.A := ⟨S.oppApex2, b1_oppApex2_mem_A S⟩
    let Hlate := lateFirstApexSystem C.R
    let uBlocker := blockerLabel Hlate C.u.1 C.u.2
    let vBlocker := blockerLabel Hlate C.v.1 C.v.2
    let physicalClass := SelectedClass D.A S.oppApex2 C.rho
    let uSlice :=
      (Hlate.selectedAt C.u.1 C.u.2).toCriticalFourShell.support ∩
        physicalClass
    let vSlice :=
      (Hlate.selectedAt C.v.1 C.v.2).toCriticalFourShell.support ∩
        physicalClass
    (uSlice.card = 2 → B1SliceSameBoundaryArc B apex uBlocker uSlice) ∧
      (vSlice.card = 2 → B1SliceSameBoundaryArc B apex vBlocker vSlice)

/-- The B1 five/six normal-form leaf closes from the named live-slice order
producer.  Thus no further incidence, cardinality, or global-boundary theorem
is missing between that producer and the checked contradiction. -/
theorem false_of_b1PhysicalClassFiveSixNormalForm_of_liveSlicesSameBoundaryArc
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F))
    (hnormal : B1PhysicalClassFiveSixNormalForm C)
    (hsame : B1LiveSlicesSameBoundaryArc C) : False := by
  classical
  let apex : CarrierLabel D.A := ⟨S.oppApex2, b1_oppApex2_mem_A S⟩
  let Hlate := lateFirstApexSystem C.R
  let uBlocker := blockerLabel Hlate C.u.1 C.u.2
  let vBlocker := blockerLabel Hlate C.v.1 C.v.2
  let physicalClass := SelectedClass D.A S.oppApex2 C.rho
  let uRow :=
    (Hlate.selectedAt C.u.1 C.u.2).toCriticalFourShell
  let vRow :=
    (Hlate.selectedAt C.v.1 C.v.2).toCriticalFourShell
  rcases hsame with ⟨B, harcsRaw⟩
  have harcs :
      ((uRow.support ∩ physicalClass).card = 2 →
        B1SliceSameBoundaryArc B apex uBlocker
          (uRow.support ∩ physicalClass)) ∧
      ((vRow.support ∩ physicalClass).card = 2 →
        B1SliceSameBoundaryArc B apex vBlocker
          (vRow.support ∩ physicalClass)) := by
    simpa [apex, Hlate, uBlocker, vBlocker, physicalClass, uRow, vRow] using
      harcsRaw
  have htwo := b1_live_slice_card_eq_two_of_physicalClassFiveSixNormalForm
    C hnormal
  have huCenters : apex ≠ uBlocker := by
    intro h
    exact C.surface.secondApex_robust.centerAt_ne Hlate C.u.1 C.u.2
      (congrArg Subtype.val h).symm
  have hvCenters : apex ≠ vBlocker := by
    intro h
    exact C.surface.secondApex_robust.centerAt_ne Hlate C.v.1 C.v.2
      (congrArg Subtype.val h).symm
  rcases htwo with hu | hv
  · exact false_of_criticalShell_slice_card_two_of_sameBoundaryArc
      B apex uBlocker huCenters C.hrho
      (row := uRow)
      (by simpa [apex, Hlate, uRow, physicalClass] using hu)
      (harcs.1 (by simpa [Hlate, uRow, physicalClass] using hu))
  · exact false_of_criticalShell_slice_card_two_of_sameBoundaryArc
      B apex vBlocker hvCenters C.hrho
      (row := vRow)
      (by simpa [apex, Hlate, vRow, physicalClass] using hv)
      (harcs.2 (by simpa [Hlate, vRow, physicalClass] using hv))

end ATailFrontierLiveClosure
end Problem97
