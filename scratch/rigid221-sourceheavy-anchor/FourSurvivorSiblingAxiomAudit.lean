import RVOL.P97.U5GlobalIncidenceQCriticalExactTetrahedron

open scoped EuclideanGeometry
open EuclideanGeometry

namespace Problem97

/-- Exact five-extra-incidence adapter after three common `a` incidences have
been supplied by the physical row at `O` and two adjacent C5 traces. -/
theorem fourSurvivor_adjacentC5_tetrahedron_bridge
    {D : CounterexampleData} {q O cᵢ cᵢ₁ a : ℝ²}
    {BO Bᵢ Bᵢ₁ : Finset ℝ²}
    (KO : U5QDeletedK4Class D q O BO)
    (Kᵢ : U5QDeletedK4Class D q cᵢ Bᵢ)
    (Kᵢ₁ : U5QDeletedK4Class D q cᵢ₁ Bᵢ₁)
    (haBO : a ∈ BO) (haBᵢ : a ∈ Bᵢ) (haBᵢ₁ : a ∈ Bᵢ₁)
    (hcᵢBO : cᵢ ∈ BO)
    (hOBᵢ : O ∈ Bᵢ)
    (hcᵢ₁Bᵢ : cᵢ₁ ∈ Bᵢ)
    (hOBᵢ₁ : O ∈ Bᵢ₁)
    (hcᵢBᵢ₁ : cᵢ ∈ Bᵢ₁) : False := by
  exact U5QDeletedK4Class.three_exact_classes_tetrahedron_incompatibility
    KO Kᵢ Kᵢ₁ hcᵢBO haBO hOBᵢ haBᵢ hcᵢ₁Bᵢ hOBᵢ₁ hcᵢBᵢ₁ haBᵢ₁

#print axioms fourSurvivor_adjacentC5_tetrahedron_bridge

end Problem97

#print axioms Problem97.U5QDeletedK4Class.three_exact_classes_tetrahedron_incompatibility

#print axioms Problem97.u5_equilateral_bisector_incompatibility

#print axioms Problem97.u5_equilateral_circumcenter_on_p_circle_incompatibility
