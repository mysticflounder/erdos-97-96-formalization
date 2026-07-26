/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.Unique4P4SourceBridge.P4DirectOuterArcAdapter

/-!
# Finite support computation for the direct P4 outer-arc adapter

This file reduces the noncomputable geometric definition of a retained
outer-arc mask to a calculation on the displayed four boundary indices.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace P4DirectOuterArcAdapterScratch

open ShellCurvatureRows
open ShellCurvatureRows.ShellBoundaryIndexing
open ATailUniqueFourExactTwoCurvatureScratch
open ATailUniqueFourExactTwoCurvatureScratch.P5CurvatureSource

/-- The selected support in the boundary chart re-cut at `center`. -/
def centeredSupportIndices (center : Fin 11) (support : Finset (Fin 11)) :
    Finset (Fin 11) :=
  support.image fun point ↦ center - point

theorem centeredSupportIndices_card
    (center : Fin 11) (support : Finset (Fin 11))
    (hcard : support.card = 4) :
    (centeredSupportIndices center support).card = 4 := by
  rw [centeredSupportIndices, Finset.card_image_of_injective]
  · exact hcard
  · exact sub_right_injective

/-- The `i`th displayed support position in increasing centered-chart order. -/
def centeredSupportIndex
    (center : Fin 11) (support : Finset (Fin 11))
    (hcard : support.card = 4) (i : Fin 4) : ℕ :=
  ((centeredSupportIndices center support).orderEmbOfFin
      (centeredSupportIndices_card center support hcard) i).val

theorem selectedCenteredSupportIndices_eq
    {A : Finset ℝ²} (Q : P5CurvatureSource A) (center : Fin 11) :
    (Q.indexing.selectedCenteredSupportIndices
        (Q.selectedRow center) (Q.boundary_mem center)) =
      centeredSupportIndices center (Q.selectedRowSupport center) := by
  classical
  rw [selectedCenteredSupportIndices, centeredSupportIndices]
  ext j
  constructor
  · intro hj
    rcases Finset.mem_image.mp hj with ⟨z, _hz, hjz⟩
    have hzSupport : z.1 ∈ (Q.selectedRow center).support := z.2
    have hzImage :
        z.1 ∈ (Q.selectedRowSupport center).image Q.boundary := by
      rw [Q.image_selectedRowSupport center]
      exact hzSupport
    rcases Finset.mem_image.mp hzImage with ⟨point, hpoint, hzpoint⟩
    apply Finset.mem_image.mpr
    refine ⟨point, hpoint, ?_⟩
    rw [← hjz]
    apply Fin.ext
    change
      (center - point).val =
        (Q.boundaryIndexOf
          ⟨Q.boundary center, Q.boundary_mem center⟩ -
        Q.boundaryIndexOf
          ⟨z.1, (Q.selectedRow center).support_subset_A z.2⟩).val
    rw [show
      Q.boundaryIndexOf
          ⟨Q.boundary center, Q.boundary_mem center⟩ = center by
        exact Q.boundaryIndexOf_boundary center]
    have hindex :
        Q.boundaryIndexOf
            ⟨z.1, (Q.selectedRow center).support_subset_A z.2⟩ = point := by
      apply Q.boundary_injective
      rw [Q.boundary_boundaryIndexOf]
      exact hzpoint.symm
    rw [hindex]
  · intro hj
    rcases Finset.mem_image.mp hj with ⟨point, hpoint, hjpoint⟩
    have hboundary :
        Q.boundary point ∈ (Q.selectedRow center).support :=
      (Finset.mem_filter.mp hpoint).2
    let z : (Q.selectedRow center).support := ⟨Q.boundary point, hboundary⟩
    apply Finset.mem_image.mpr
    refine ⟨z, Finset.mem_attach _ z, ?_⟩
    rw [← hjpoint]
    apply Fin.ext
    change
      (Q.boundaryIndexOf
          ⟨Q.boundary center, Q.boundary_mem center⟩ -
        Q.boundaryIndexOf
          ⟨Q.boundary point,
            (Q.selectedRow center).support_subset_A hboundary⟩).val =
        (center - point).val
    rw [show
      Q.boundaryIndexOf
          ⟨Q.boundary center, Q.boundary_mem center⟩ = center by
        exact Q.boundaryIndexOf_boundary center]
    rw [show
      Q.boundaryIndexOf
          ⟨Q.boundary point,
            (Q.selectedRow center).support_subset_A hboundary⟩ = point by
        exact Q.boundaryIndexOf_boundary point]

theorem selectedCenteredSupportIndex_eq
    {A : Finset ℝ²} (Q : P5CurvatureSource A)
    (row : RowSupportAtom) (hcard : row.support.card = 4)
    (hrow : rowSupportVal Q row) (i : Fin 4) :
    Q.indexing.selectedCenteredSupportIndex
        (Q.selectedRow row.center) (Q.boundary_mem row.center) i =
      centeredSupportIndex row.center row.support hcard i := by
  have hindices :
      Q.indexing.selectedCenteredSupportIndices
          (Q.selectedRow row.center) (Q.boundary_mem row.center) =
        centeredSupportIndices row.center row.support := by
    rw [selectedCenteredSupportIndices_eq, hrow]
  have horder :
      Q.indexing.selectedCenteredSupportOrder
          (Q.selectedRow row.center) (Q.boundary_mem row.center) =
        (centeredSupportIndices row.center row.support).orderEmbOfFin
          (centeredSupportIndices_card row.center row.support hcard) := by
    apply Finset.orderEmbOfFin_unique'
    intro j
    rw [← hindices]
    exact Finset.orderEmbOfFin_mem _ _ j
  exact congrArg (fun f : Fin 4 ↪o Fin 11 ↦ (f i).val) horder

/-- The global reversed-chart start is a pure function of the boundary label. -/
def globalStart (center : Fin 11) : ℕ :=
  (-center).val

theorem globalChartStartAt_eq
    {A : Finset ℝ²} (Q : P5CurvatureSource A) (center : Fin 11) :
    Q.indexing.globalChartStartAt
        ⟨Q.boundary center, Q.boundary_mem center⟩ =
      globalStart center := by
  rw [globalChartStartAt, globalStart]
  change
    (-Q.boundaryIndexOf
      ⟨Q.boundary center, Q.boundary_mem center⟩).val = (-center).val
  rw [Q.boundaryIndexOf_boundary]

/-- Start of the retained arc computed solely from displayed boundary labels. -/
def finiteArcStart
    (center : Fin 11) (support : Finset (Fin 11))
    (hcard : support.card = 4) (side : OuterSide) : ℕ :=
  match side with
  | .left => globalStart center
  | .right =>
      globalStart center + centeredSupportIndex center support hcard 2

/-- Number of strict exterior turns in the displayed retained arc. -/
def finiteArcTurnCount
    (center : Fin 11) (support : Finset (Fin 11))
    (hcard : support.card = 4) (side : OuterSide) : ℕ :=
  match side with
  | .left => centeredSupportIndex center support hcard 1 - 1
  | .right => 10 - centeredSupportIndex center support hcard 2

/-- The encoder's pure finite mask formula. -/
def finiteArcTurnMask
    (center : Fin 11) (support : Finset (Fin 11))
    (hcard : support.card = 4) (side : OuterSide) : Finset (Fin 11) :=
  (Finset.range (finiteArcTurnCount center support hcard side)).image fun k ↦
    ⟨(finiteArcStart center support hcard side + k) % 11,
      Nat.mod_lt _ (by omega)⟩

theorem retainedArc_turnMask_eq_finite
    {A : Finset ℝ²} (Q : P5CurvatureSource A)
    (row : RowSupportAtom) (hcard : row.support.card = 4)
    (hrow : rowSupportVal Q row) (side : OuterSide) :
    (RetainedOuterArc.mk row.center side).turnMask Q =
      finiteArcTurnMask row.center row.support hcard side := by
  cases side with
  | left =>
      simp only [RetainedOuterArc.turnMask, RetainedOuterArc.turnCount,
        RetainedOuterArc.start, finiteArcTurnMask, finiteArcTurnCount,
        finiteArcStart, selectedClassCenterLabel]
      simp only [globalChartStartAt_eq,
        selectedCenteredSupportIndex_eq Q row hcard hrow]
  | right =>
      simp only [RetainedOuterArc.turnMask, RetainedOuterArc.turnCount,
        RetainedOuterArc.start, finiteArcTurnMask, finiteArcTurnCount,
        finiteArcStart, selectedClassCenterLabel]
      simp only [globalChartStartAt_eq,
        selectedCenteredSupportIndex_eq Q row hcard hrow]

/-- A finite certificate for one retained row-pattern-to-outer-arc clause.

Only `mask_eq` is computational: it states that the encoder's pure formula
returns the displayed mask. -/
structure DirectRowArcFiniteCertificate where
  row : RowSupportAtom
  arc : OuterArcAtom
  same_center : arc.center = row.center
  support_card : row.support.card = 4
  mask_eq :
    finiteArcTurnMask row.center row.support support_card arc.side = arc.mask

namespace DirectRowArcFiniteCertificate

/-- Every checked finite certificate supplies the geometric source theorem
expected by `DirectRowArcSchema`. -/
def toSchema (certificate : DirectRowArcFiniteCertificate) :
    DirectRowArcSchema where
  row := certificate.row
  arc := certificate.arc
  same_center := certificate.same_center
  source_sound := by
    intro A Q hrow
    change
      (RetainedOuterArc.mk certificate.arc.center certificate.arc.side).turnMask
          Q =
        certificate.arc.mask
    rw [certificate.same_center]
    rw [retainedArc_turnMask_eq_finite Q certificate.row
      certificate.support_card hrow certificate.arc.side]
    exact certificate.mask_eq

end DirectRowArcFiniteCertificate

/-- A proof-free row/arc record suitable for generated certificate tables. -/
structure DirectRowArcFiniteDatum where
  row : RowSupportAtom
  arc : OuterArcAtom
  deriving DecidableEq

/-- A finite datum with the exact compact/source occurrence that selected it.

Keeping these indices as data, rather than generated comments, permits a
later source bridge to establish occurrence-wise agreement without assuming
any alignment between independently generated lists. -/
structure DirectRowArcFiniteOccurrence where
  outputClauseIndex : Nat
  coreClauseIndex : Nat
  terminalClauseIndex : Nat
  datum : DirectRowArcFiniteDatum
  deriving DecidableEq

namespace DirectRowArcFiniteDatum

/-- Fail-closed finite mask computation.  Malformed supports produce `none`. -/
def checkedMask (datum : DirectRowArcFiniteDatum) : Option (Finset (Fin 11)) :=
  if hcard : datum.row.support.card = 4 then
    some (finiteArcTurnMask datum.row.center datum.row.support hcard datum.arc.side)
  else
    none

/-- Exact validity predicate checked on a generated datum. -/
def Valid (datum : DirectRowArcFiniteDatum) : Prop :=
  datum.arc.center = datum.row.center ∧ checkedMask datum = some datum.arc.mask

instance (datum : DirectRowArcFiniteDatum) : Decidable datum.Valid := by
  unfold Valid
  infer_instance

theorem support_card_of_valid
    (datum : DirectRowArcFiniteDatum) (hvalid : datum.Valid) :
    datum.row.support.card = 4 := by
  by_contra hcard
  have hbad : (none : Option (Finset (Fin 11))) = some datum.arc.mask := by
    simpa only [checkedMask, hcard, ↓reduceDIte] using hvalid.2
  cases hbad

theorem mask_eq_of_valid
    (datum : DirectRowArcFiniteDatum) (hvalid : datum.Valid) :
    finiteArcTurnMask datum.row.center datum.row.support
        (datum.support_card_of_valid hvalid) datum.arc.side =
      datum.arc.mask := by
  have hmask := hvalid.2
  simp only [checkedMask, datum.support_card_of_valid hvalid,
    ↓reduceDIte, Option.some.injEq] at hmask
  exact hmask

/-- Convert one batch-checked generated datum into the geometric schema. -/
def toCertificate
    (datum : DirectRowArcFiniteDatum) (hvalid : datum.Valid) :
    DirectRowArcFiniteCertificate where
  row := datum.row
  arc := datum.arc
  same_center := hvalid.1
  support_card := datum.support_card_of_valid hvalid
  mask_eq := datum.mask_eq_of_valid hvalid

def toSchema
    (datum : DirectRowArcFiniteDatum) (hvalid : datum.Valid) :
    DirectRowArcSchema :=
  (datum.toCertificate hvalid).toSchema

end DirectRowArcFiniteDatum

private def exampleLeftDatum : DirectRowArcFiniteDatum where
  row := ⟨0, {1, 5, 6, 7}⟩
  arc := ⟨0, .left, {0, 1, 2, 3}⟩

private theorem exampleLeftDatum_valid : exampleLeftDatum.Valid := by
  native_decide

example : DirectRowArcSchema :=
  exampleLeftDatum.toSchema exampleLeftDatum_valid

#print axioms selectedCenteredSupportIndices_eq
#print axioms retainedArc_turnMask_eq_finite
#print axioms DirectRowArcFiniteCertificate.toSchema
#print axioms DirectRowArcFiniteDatum.toSchema
#print axioms exampleLeftDatum_valid

end P4DirectOuterArcAdapterScratch
end Problem97
