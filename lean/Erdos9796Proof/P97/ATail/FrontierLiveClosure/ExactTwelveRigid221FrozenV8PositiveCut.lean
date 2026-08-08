/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SourceOrderCoverage
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SourceOrderTerminalBankConsumer
import Erdos9796Proof.P97.ATail.KalmansonThreeEqualitySchemas

/-!
# First proof-carrying exact-twelve source-order positive cut

This file translates the independently checked eight-schema order coverage
for the frozen-v8 survivor into one `SourceOrderPositiveNogood`.  Every metric
branch uses only the positive incidences in the eleven recorded selected rows.

This proves one finite learned cut.  It does not establish terminal UNSAT,
all-cell coverage, a universal exact-twelve lift, or closure of a live sorry.
-/

open scoped Convex EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress

open Census554.EqualityCore
open ExactTwelveCarrierIngress
open GenericRowNogoodCertificate
open SourceOrderTerminalBankConsumer

/-- The eleven selected rows whose positive incidences support all eight
metric branches of the frozen-v8 order certificate. -/
def frozenV8PositiveChoices : List (RowChoice Label) :=
  [ { center := 0, support := {3, 5, 8, 10} }
  , { center := 1, support := {0, 2, 6, 8} }
  , { center := 2, support := {4, 8, 10, 11} }
  , { center := 3, support := {1, 2, 9, 10} }
  , { center := 4, support := {0, 1, 3, 9} }
  , { center := 5, support := {0, 2, 7, 11} }
  , { center := 7, support := {1, 3, 6, 8} }
  , { center := 8, support := {3, 4, 6, 9} }
  , { center := 9, support := {2, 5, 7, 8} }
  , { center := 10, support := {1, 5, 6, 7} }
  , { center := 11, support := {1, 4, 5, 10} } ]

private theorem FrozenBoundaryOrder.boundary_image_eq_pointOf_image_frozenV8
    {pointOf : Label → ℝ²} (order : FrozenBoundaryOrder pointOf) :
    Finset.univ.image order.boundary = Finset.univ.image pointOf := by
  classical
  have hindex_bijective : Function.Bijective order.index :=
    (Fintype.bijective_iff_injective_and_card order.index).2
      ⟨order.index_injective, by simp [order.n_eq_twelve]⟩
  ext p
  constructor
  · intro hp
    rcases Finset.mem_image.mp hp with ⟨i, -, rfl⟩
    rcases hindex_bijective.surjective i with ⟨label, rfl⟩
    exact Finset.mem_image.mpr
      ⟨label, Finset.mem_univ _, (order.point_eq label).symm⟩
  · intro hp
    rcases Finset.mem_image.mp hp with ⟨label, -, rfl⟩
    exact Finset.mem_image.mpr
      ⟨order.index label, Finset.mem_univ _, order.point_eq label⟩

/-- Source-local Kalmanson replay for one strict five-position chain. -/
private theorem FrozenBoundaryOrder.false_of_kalmansonOrderAt_frozenV8
    {row : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes row pointOf) (order : FrozenBoundaryOrder pointOf)
    (hconv : ConvexIndep (Finset.univ.image pointOf))
    (o a y e c : Label) (horder : KalmansonOrderAt order.position o a y e c)
    (hO_mem_y : o ∈ row y) (hE_mem_y : e ∈ row y)
    (hE_mem_o : e ∈ row o) (hC_mem_o : c ∈ row o)
    (hC_mem_a : c ∈ row a) (hO_mem_a : o ∈ row a) : False := by
  rcases horder with ⟨hOA, hAY, hYE, hEC⟩
  have hOA_lt_AE :=
    CapCrossingKalmansonBridge.complementary_dist_add_dist_lt_diagonal_sum_of_ccw
      hconv order.boundary_injective
        order.boundary_image_eq_pointOf_image_frozenV8 order.boundary_ccw
      (by simpa only [FrozenBoundaryOrder.position] using hOA)
      (by simpa only [FrozenBoundaryOrder.position] using hAY)
      (by simpa only [FrozenBoundaryOrder.position] using hYE)
  have hAE_lt_AO :=
    CapCrossingKalmansonBridge.dist_add_dist_lt_diagonal_sum_of_ccw
      hconv order.boundary_injective
        order.boundary_image_eq_pointOf_image_frozenV8 order.boundary_ccw
      (by simpa only [FrozenBoundaryOrder.position] using hOA)
      (by simpa only [FrozenBoundaryOrder.position] using hAY.trans hYE)
      (by simpa only [FrozenBoundaryOrder.position] using hEC)
  have hYRow := hreal.equidist y o hO_mem_y e hE_mem_y
  have hORow := hreal.equidist o e hE_mem_o c hC_mem_o
  have hARow := hreal.equidist a c hC_mem_a o hO_mem_a
  simp only [order.point_eq] at hOA_lt_AE hAE_lt_AO
  have hYRow' : dist (pointOf o) (pointOf y) = dist (pointOf y) (pointOf e) := by
    simpa only [dist_comm (pointOf o) (pointOf y)] using hYRow
  have hARow' : dist (pointOf a) (pointOf c) = dist (pointOf o) (pointOf a) := by
    simpa only [dist_comm (pointOf a) (pointOf o)] using hARow
  linarith

/-- Source-local replay for two rows sharing the two late vertices of a strict
four-position chain. -/
private theorem FrozenBoundaryOrder.false_of_sharedLatePairOrderAt_frozenV8
    {row : RowPattern Label} {pointOf : Label → ℝ²}
    (hreal : Realizes row pointOf) (order : FrozenBoundaryOrder pointOf)
    (hconv : ConvexIndep (Finset.univ.image pointOf))
    (a b c d : Label) (horder : SharedLatePairOrderAt order.position a b c d)
    (hC_mem_a : c ∈ row a) (hD_mem_a : d ∈ row a)
    (hC_mem_b : c ∈ row b) (hD_mem_b : d ∈ row b) : False := by
  rcases horder with ⟨hAB, hBC, hCD⟩
  have hstrict :=
    CapCrossingKalmansonBridge.dist_add_dist_lt_diagonal_sum_of_ccw
      hconv order.boundary_injective
        order.boundary_image_eq_pointOf_image_frozenV8 order.boundary_ccw
      (by simpa only [FrozenBoundaryOrder.position] using hAB)
      (by simpa only [FrozenBoundaryOrder.position] using hBC)
      (by simpa only [FrozenBoundaryOrder.position] using hCD)
  have hAeq := hreal.equidist a c hC_mem_a d hD_mem_a
  have hBeq := hreal.equidist b c hC_mem_b d hD_mem_b
  simp only [order.point_eq] at hstrict
  linarith

/-- The first generated positive cut, with its source-order semantic proof
stored in the term consumed by the terminal-bank adapter. -/
def frozenV8PositiveNogood : SourceOrderPositiveNogood where
  choices := frozenV8PositiveChoices
  refutes := by
    intro row pointOf hreal order hforced hconv hpositive
    have hrow0 : ({3, 5, 8, 10} : Finset Label) ⊆ row 0 :=
      hpositive ({ center := 0, support := {3, 5, 8, 10} } : RowChoice Label)
        (by simp [frozenV8PositiveChoices])
    have hrow1 : ({0, 2, 6, 8} : Finset Label) ⊆ row 1 :=
      hpositive ({ center := 1, support := {0, 2, 6, 8} } : RowChoice Label)
        (by simp [frozenV8PositiveChoices])
    have hrow2 : ({4, 8, 10, 11} : Finset Label) ⊆ row 2 :=
      hpositive ({ center := 2, support := {4, 8, 10, 11} } : RowChoice Label)
        (by simp [frozenV8PositiveChoices])
    have hrow3 : ({1, 2, 9, 10} : Finset Label) ⊆ row 3 :=
      hpositive ({ center := 3, support := {1, 2, 9, 10} } : RowChoice Label)
        (by simp [frozenV8PositiveChoices])
    have hrow4 : ({0, 1, 3, 9} : Finset Label) ⊆ row 4 :=
      hpositive ({ center := 4, support := {0, 1, 3, 9} } : RowChoice Label)
        (by simp [frozenV8PositiveChoices])
    have hrow5 : ({0, 2, 7, 11} : Finset Label) ⊆ row 5 :=
      hpositive ({ center := 5, support := {0, 2, 7, 11} } : RowChoice Label)
        (by simp [frozenV8PositiveChoices])
    have hrow7 : ({1, 3, 6, 8} : Finset Label) ⊆ row 7 :=
      hpositive ({ center := 7, support := {1, 3, 6, 8} } : RowChoice Label)
        (by simp [frozenV8PositiveChoices])
    have hrow8 : ({3, 4, 6, 9} : Finset Label) ⊆ row 8 :=
      hpositive ({ center := 8, support := {3, 4, 6, 9} } : RowChoice Label)
        (by simp [frozenV8PositiveChoices])
    have hrow9 : ({2, 5, 7, 8} : Finset Label) ⊆ row 9 :=
      hpositive ({ center := 9, support := {2, 5, 7, 8} } : RowChoice Label)
        (by simp [frozenV8PositiveChoices])
    have hrow10 : ({1, 5, 6, 7} : Finset Label) ⊆ row 10 :=
      hpositive ({ center := 10, support := {1, 5, 6, 7} } : RowChoice Label)
        (by simp [frozenV8PositiveChoices])
    have hrow11 : ({1, 4, 5, 10} : Finset Label) ⊆ row 11 :=
      hpositive ({ center := 11, support := {1, 4, 5, 10} } : RowChoice Label)
        (by simp [frozenV8PositiveChoices])
    rcases order.sourceOrderCoverage_frozenV8 hforced with
      hcommon | hK1 | hK2 | hK3 | hK4 | hS1 | hS2 | hS3
    · let core : Census554.ConvexFivePointCore.Core row :=
        { a := 1
          x := 3
          b := 9
          c := 8
          y := 4
          hab := by decide
          hxy := by decide
          xa_xb := EdgeClosure.row 3 1 9
            (hrow3 (by decide)) (hrow3 (by decide))
          ya_yb := EdgeClosure.row 4 1 9
            (hrow4 (by decide)) (hrow4 (by decide))
          cb_cx := EdgeClosure.row 8 9 3
            (hrow8 (by decide)) (hrow8 (by decide))
          cb_cy := EdgeClosure.row 8 9 4
            (hrow8 (by decide)) (hrow8 (by decide)) }
      exact order.false_of_convexFivePointCore hreal core hcommon
    · exact order.false_of_kalmansonOrderAt_frozenV8 hreal hconv
        2 3 5 11 10 hK1
        (hrow5 (by decide)) (hrow5 (by decide))
        (hrow2 (by decide)) (hrow2 (by decide))
        (hrow3 (by decide)) (hrow3 (by decide))
    · exact order.false_of_kalmansonOrderAt_frozenV8 hreal hconv
        8 7 2 4 3 hK2
        (hrow2 (by decide)) (hrow2 (by decide))
        (hrow8 (by decide)) (hrow8 (by decide))
        (hrow7 (by decide)) (hrow7 (by decide))
    · exact order.false_of_kalmansonOrderAt_frozenV8 hreal hconv
        2 5 3 10 11 hK3
        (hrow3 (by decide)) (hrow3 (by decide))
        (hrow2 (by decide)) (hrow2 (by decide))
        (hrow5 (by decide)) (hrow5 (by decide))
    · exact order.false_of_kalmansonOrderAt_frozenV8 hreal hconv
        0 1 4 3 8 hK4
        (hrow4 (by decide)) (hrow4 (by decide))
        (hrow0 (by decide)) (hrow0 (by decide))
        (hrow1 (by decide)) (hrow1 (by decide))
    · exact order.false_of_sharedLatePairOrderAt_frozenV8 hreal hconv
        0 9 8 5 hS1
        (hrow0 (by decide)) (hrow0 (by decide))
        (hrow9 (by decide)) (hrow9 (by decide))
    · exact order.false_of_sharedLatePairOrderAt_frozenV8 hreal hconv
        10 11 1 5 hS2
        (hrow10 (by decide)) (hrow10 (by decide))
        (hrow11 (by decide)) (hrow11 (by decide))
    · exact order.false_of_sharedLatePairOrderAt_frozenV8 hreal hconv
        0 11 10 5 hS3
        (hrow0 (by decide)) (hrow0 (by decide))
        (hrow11 (by decide)) (hrow11 (by decide))

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
