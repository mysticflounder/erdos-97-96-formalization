/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.ExactFiveCommonShellV7.CanonicalPacket
import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.Unique4ExactTwoSourceBridge.IndexedSource.CyclicAlternationCore

/-!
# Semantic core for the exact-five common-shell v7 delta

The valuation selects the packet's one geometric boundary order and
interprets each global equality variable as equality of the corresponding two
carrier-edge lengths.  `cyclicAlternationSat` proves the complete generic
v7 clause family.  Occurrence-map checking only has to establish that each
stored pair of global-equality indices decodes to the two displayed stars.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ExactFiveCommonShellV7

open Census554
open Census554.SeparationCore
open P5IndexedSourceScratch

noncomputable def edgeDistance (pointOf : Label → ℝ²) (edge : RawEdge) : ℝ :=
  dist (pointOf edge.1) (pointOf edge.2)

theorem edgeDistance_canonicalEdge (pointOf : Label → ℝ²)
    (a b : Label) :
    edgeDistance pointOf (canonicalEdge a b) =
      dist (pointOf a) (pointOf b) := by
  unfold canonicalEdge edgeDistance
  split
  · rfl
  · exact dist_comm _ _

theorem edgeDistance_eq_of_canonicalGlobalRow
    (pointOf : Label → ℝ²) (first second : RawEdge)
    (h :
      edgeDistance pointOf (canonicalGlobalRow first second).1 =
        edgeDistance pointOf (canonicalGlobalRow first second).2) :
    edgeDistance pointOf first = edgeDistance pointOf second := by
  unfold canonicalGlobalRow at h
  split at h
  · exact h
  · exact h.symm

def interpAtom {pointOf : Label → ℝ²}
    (P : SelectedBoundaryOrder pointOf) : Atom → Prop
  | .orderSelector i => i = P.selector
  | .globalEdgeEq i =>
      edgeDistance pointOf (globalEqRow i).1 =
        edgeDistance pointOf (globalEqRow i).2

def sourceVal {pointOf : Label → ℝ²}
    (P : SelectedBoundaryOrder pointOf) : Nat → Prop :=
  fun n => interpAtom P (atomOfVar n)

theorem sourceVal_order {pointOf : Label → ℝ²}
    (P : SelectedBoundaryOrder pointOf) (i : Fin 144) :
    sourceVal P (varOfAtom (.orderSelector i)) ↔ i = P.selector := by
  unfold sourceVal
  rw [atomOfVar_varOfAtom_order]
  rfl

theorem sourceVal_global {pointOf : Label → ℝ²}
    (P : SelectedBoundaryOrder pointOf) (i : Fin 1485) :
    sourceVal P (varOfAtom (.globalEdgeEq i)) ↔
      edgeDistance pointOf (globalEqRow i).1 =
        edgeDistance pointOf (globalEqRow i).2 := by
  unfold sourceVal
  rw [atomOfVar_varOfAtom_global]
  rfl

theorem Card11Labeling.image_pointOf_eq
    {A : Finset ℝ²} {M : MoserTriangle A}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    (L : Card11Labeling M frame) :
    Finset.univ.image L.pointOf = A := by
  ext x
  constructor
  · intro hx
    rcases Finset.mem_image.mp hx with ⟨p, _hp, rfl⟩
    exact L.mem_carrier p
  · intro hx
    rcases L.carrier_surjective x hx with ⟨p, rfl⟩
    exact Finset.mem_image.mpr ⟨p, Finset.mem_univ _, rfl⟩

theorem SelectedBoundaryOrder.image_boundary_eq
    {A : Finset ℝ²} {pointOf : Label → ℝ²}
    (P : SelectedBoundaryOrder pointOf)
    (himage : Finset.univ.image pointOf = A) :
    Finset.univ.image P.boundary = A := by
  rw [← himage]
  apply Finset.Subset.antisymm
  · intro x hx
    rcases Finset.mem_image.mp hx with ⟨i, _hi, rfl⟩
    refine Finset.mem_image.mpr
      ⟨(selectorIndexEquiv P.selector).symm i, Finset.mem_univ _, ?_⟩
    simpa using (P.point_eq ((selectorIndexEquiv P.selector).symm i)).symm
  · intro x hx
    rcases Finset.mem_image.mp hx with ⟨label, _hlabel, rfl⟩
    exact Finset.mem_image.mpr
      ⟨selectorIndexEquiv P.selector label, Finset.mem_univ _,
        P.point_eq label⟩

/-- Generic v7 family satisfaction.  `l<r` are the two center positions and
`p<q` the endpoint positions in the selected boundary order. -/
def CyclicAlternationSat {pointOf : Label → ℝ²}
    (P : SelectedBoundaryOrder pointOf) : Prop :=
  ∀ selector leftEq rightEq l r p q,
    sourceVal P (varOfAtom (.orderSelector selector)) →
    globalEqRow leftEq =
      canonicalGlobalRow
        (canonicalEdge
          ((selectorIndexEquiv selector).symm l)
          ((selectorIndexEquiv selector).symm p))
        (canonicalEdge
          ((selectorIndexEquiv selector).symm l)
          ((selectorIndexEquiv selector).symm q)) →
    globalEqRow rightEq =
      canonicalGlobalRow
        (canonicalEdge
          ((selectorIndexEquiv selector).symm r)
          ((selectorIndexEquiv selector).symm p))
        (canonicalEdge
          ((selectorIndexEquiv selector).symm r)
          ((selectorIndexEquiv selector).symm q)) →
    l < r → p < q →
    p ≠ l → p ≠ r → q ≠ l → q ≠ r →
    ((l < p ∧ p < r) ↔ (l < q ∧ q < r)) →
    ¬(sourceVal P (varOfAtom (.globalEdgeEq leftEq)) ∧
      sourceVal P (varOfAtom (.globalEdgeEq rightEq)))

theorem cyclicAlternationSat
    {A : Finset ℝ²} (hconv : ConvexIndep A) (hcard : A.card = 11)
    {pointOf : Label → ℝ²}
    (himage : Finset.univ.image pointOf = A)
    (P : SelectedBoundaryOrder pointOf) :
    CyclicAlternationSat P := by
  intro selector leftEq rightEq l r p q hselector hleft hright
    hlr hpq hpl hpr hql hqr hside heqs
  have hselector' : selector = P.selector :=
    (sourceVal_order P selector).mp hselector
  subst selector
  have heql := (sourceVal_global P leftEq).mp heqs.1
  have heqr := (sourceVal_global P rightEq).mp heqs.2
  rw [hleft] at heql
  rw [hright] at heqr
  apply edgeDistance_eq_of_canonicalGlobalRow at heql
  apply edgeDistance_eq_of_canonicalGlobalRow at heqr
  simp only [edgeDistance_canonicalEdge] at heql heqr
  have heql' :
      dist (P.boundary l) (P.boundary p) =
        dist (P.boundary l) (P.boundary q) := by
    simpa only [← P.point_eq, Equiv.apply_symm_apply] using heql
  have heqr' :
      dist (P.boundary r) (P.boundary p) =
        dist (P.boundary r) (P.boundary q) := by
    simpa only [← P.point_eq, Equiv.apply_symm_apply] using heqr
  exact false_of_nonalternating_equidistant hconv
    (cardBoundary_injective hcard P.boundary_injective)
    (cardBoundary_image hcard (P.image_boundary_eq himage))
    (cardBoundary_ccw hcard P.boundary_ccw)
    (idx := toCardIndex hcard)
    (Or.inl fun i j hij => toCardIndex_lt hcard hij)
    hlr hpq hpl hpr hql hqr hside heql' heqr'

end ExactFiveCommonShellV7
end Problem97

#print axioms Problem97.ExactFiveCommonShellV7.cyclicAlternationSat
