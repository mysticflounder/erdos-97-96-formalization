/-
Bounded card>=13 attempt for the two Rigid221SourceHeavy endpoint arms.

This file deliberately imports the source-clean U5 consumer, not
FrontierLiveClosure.Rigid221SourceHeavy.  The endpoint `q` is therefore
parametric and can stand for either `P.u.1` or `packet.xv`.
-/

import Erdos9796Proof.P97.U5GlobalIncidenceQDeletedTetrahedron

/-!
# Card>=13 five-cross incidence producer attempt

This is an isolated source-clean terminal and incidence-layer audit.
-/

open scoped EuclideanGeometry

namespace Problem97

/- The five fields appearing in both live missing-incidence leaves. -/
def FiveCrossIncidences
    (center₁ center₂ apex : ℝ²)
    (K₁ K₂ BO : Finset ℝ²) : Prop :=
  center₁ ∈ BO ∧
    apex ∈ K₁ ∧
    center₂ ∈ K₁ ∧
    apex ∈ K₂ ∧
    center₁ ∈ K₂

/-
The weakest endpoint-parametric terminal: once the source-clean
three-center producer has exported the common deletion point `a` into all
three exact q-deleted rows, the five extra cross-incidences are sufficient to
contradict the U5 tetrahedron consumer.  `q` is deliberately arbitrary.
-/
theorem false_of_endpoint_parametric_five_cross
    {D : CounterexampleData} {q center₁ center₂ apex a : ℝ²}
    {K₁ K₂ BO : Finset ℝ²}
    (hK₁ : U5QDeletedK4Class D q center₁ K₁)
    (hK₂ : U5QDeletedK4Class D q center₂ K₂)
    (hBO : U5QDeletedK4Class D q apex BO)
    (hcommon : a ∈ K₁ ∧ a ∈ K₂ ∧ a ∈ BO)
    (hcross : FiveCrossIncidences center₁ center₂ apex K₁ K₂ BO) :
    False := by
  rcases hcommon with ⟨haK₁, haK₂, haBO⟩
  rcases hcross with ⟨hc₁BO, h_apexK₁, hc₂K₁, h_apexK₂, hc₁K₂⟩
  exact U5QDeletedK4Class.three_exact_classes_tetrahedron_incompatibility
    hBO hK₁ hK₂ hc₁BO haBO h_apexK₁ haK₁ hc₂K₁ h_apexK₂ hc₁K₂ haK₂

/- The source-clean three-center producer gives these common memberships;
   it does not give any field of `FiveCrossIncidences`.  This proposition is
   the exact producer target shared by both endpoint arms. -/
def EndpointParametricFiveCrossProducerTarget
    {D : CounterexampleData} (q center₁ center₂ apex a : ℝ²)
    (K₁ K₂ BO : Finset ℝ²) : Prop :=
  FiveCrossIncidences center₁ center₂ apex K₁ K₂ BO

/-
Concrete independence witness for the exported incidence/card interface.
It is intentionally an incidence-layer model, not a claim to be a full
Euclidean `CounterexampleData`: the point is that row cardinalities and the
common deletion point do not logically force the first cross-incidence.
-/
section IncidenceLayerModel

def FiveCrossIncidencesOn
    {α : Type} [DecidableEq α]
    (center₁ center₂ apex : α)
    (K₁ K₂ BO : Finset α) : Prop :=
  center₁ ∈ BO ∧
    apex ∈ K₁ ∧
    center₂ ∈ K₁ ∧
    apex ∈ K₂ ∧
    center₁ ∈ K₂

def modelCenter₁ : Fin 8 := 2
def modelCenter₂ : Fin 8 := 3
def modelApex : Fin 8 := 1
def modelCommon : Fin 8 := 0
def modelK₁ : Finset (Fin 8) := {0, 1, 3, 4}
def modelK₂ : Finset (Fin 8) := {0, 1, 2, 5}
def modelBO : Finset (Fin 8) := {0, 1, 6, 7}

example :
    modelK₁.card = 4 ∧ modelK₂.card = 4 ∧ modelBO.card = 4 := by
  decide

example :
    modelCommon ∈ modelK₁ ∧
      modelCommon ∈ modelK₂ ∧
      modelCommon ∈ modelBO := by
  decide

example :
    ¬ FiveCrossIncidencesOn modelCenter₁ modelCenter₂ modelApex
      modelK₁ modelK₂ modelBO := by
  simp [FiveCrossIncidencesOn, modelCenter₁, modelCenter₂, modelApex,
    modelK₁, modelK₂, modelBO]

end IncidenceLayerModel

#print axioms false_of_endpoint_parametric_five_cross

end Problem97
