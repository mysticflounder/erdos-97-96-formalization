/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.U1CarrierInjection

/-!
# Scratch: global minimality and selected-witness connectivity

This file checks the exact graph-theoretic consequence proposed in the
global-minimality audit.  A `FaithfulCarrierPattern` chooses an arbitrary
four-point same-radius row at every carrier point.  On a minimal
`CounterexampleData`, the resulting directed relation is strongly connected
on the carrier.

The result is a corollary of the stronger production theorem
`FaithfulCarrierPattern.eq_carrier_of_nonempty_closed`: the set reachable from
one seed is nonempty, is contained in the carrier, and is closed under every
selected row.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace GlobalMinimalityConnectivityAudit

attribute [local instance] Classical.propDecidable

/-- The directed edge relation determined by the selected row at each center.
The membership proof is included existentially so the relation is independent
of any particular proof term supplied by a caller. -/
def SelectedWitnessEdge {A : Finset ℝ²} (P : FaithfulCarrierPattern A)
    (center target : ℝ²) : Prop :=
  ∃ hcenter : center ∈ A, target ∈ (P.classAt center hcenter).support

/-- Every arbitrary choice of one selected four-point witness row at each
point of a minimal carrier gives a strongly connected directed relation on
that carrier. -/
theorem selectedWitnessEdge_reflTransGen
    {D : CounterexampleData} (hmin : D.Minimal)
    (P : FaithfulCarrierPattern D.A) {source target : ℝ²}
    (hsource : source ∈ D.A) (htarget : target ∈ D.A) :
    Relation.ReflTransGen (SelectedWitnessEdge P) source target := by
  classical
  let reachable : Finset ℝ² :=
    D.A.filter fun z => Relation.ReflTransGen (SelectedWitnessEdge P) source z
  have hreachable_nonempty : reachable.Nonempty := by
    refine ⟨source, Finset.mem_filter.mpr ⟨hsource, ?_⟩⟩
    exact Relation.ReflTransGen.refl
  have hreachable_subset : reachable ⊆ D.A := by
    intro z hz
    exact (Finset.mem_filter.mp hz).1
  have hreachable_closed :
      ∀ center : ℝ², ∀ hcenter : center ∈ reachable,
        (P.classAt center (hreachable_subset hcenter)).support ⊆ reachable := by
    intro center hcenter z hz
    have hpath : Relation.ReflTransGen (SelectedWitnessEdge P) source center :=
      (Finset.mem_filter.mp hcenter).2
    have hedge : SelectedWitnessEdge P center z :=
      ⟨hreachable_subset hcenter, hz⟩
    exact Finset.mem_filter.mpr
      ⟨(P.classAt center (hreachable_subset hcenter)).support_subset_A hz,
        hpath.tail hedge⟩
  have hreachable_eq : reachable = D.A :=
    P.eq_carrier_of_nonempty_closed hmin hreachable_nonempty
      hreachable_subset hreachable_closed
  have htarget_reachable : target ∈ reachable := by
    rw [hreachable_eq]
    exact htarget
  exact (Finset.mem_filter.mp htarget_reachable).2

/-- The purely logical final step in the proposed crossing argument.  If every
cross-pair satisfies the strict diagonal inequality, then one entire witness
set lies strictly inside the other apex disk.  Establishing `hcross` from the
actual cap cyclic order is a separate geometric obligation. -/
theorem strictContainment_or_strictContainment_of_crossingInequality
    {P Q : Finset ℝ²} {apexP apexQ : ℝ²} {radiusP radiusQ : ℝ}
    (hcross : ∀ x ∈ P, ∀ y ∈ Q,
      dist apexP x + dist apexQ y > dist apexQ x + dist apexP y)
    (hPcircle : ∀ x ∈ P, dist apexP x = radiusP)
    (hQcircle : ∀ y ∈ Q, dist apexQ y = radiusQ) :
    (∀ x ∈ P, dist apexQ x < radiusQ) ∨
      (∀ y ∈ Q, dist apexP y < radiusP) := by
  classical
  by_cases hinsideP : ∀ x ∈ P, dist apexQ x < radiusQ
  · exact Or.inl hinsideP
  · apply Or.inr
    push_neg at hinsideP
    rcases hinsideP with ⟨x, hxP, hxOutside⟩
    intro y hyQ
    have hxy := hcross x hxP y hyQ
    rw [hPcircle x hxP, hQcircle y hyQ] at hxy
    linarith

#print axioms selectedWitnessEdge_reflTransGen
#print axioms strictContainment_or_strictContainment_of_crossingInequality

end GlobalMinimalityConnectivityAudit
end Problem97
