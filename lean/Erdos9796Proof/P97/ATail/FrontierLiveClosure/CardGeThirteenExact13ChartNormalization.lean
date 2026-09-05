/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under GPL-3.0-or-later as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.DRExactThirteenBranchIngress
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.CardGeThirteenTwoCanonicalK4FixedCellData

/-!
# Exact-thirteen chart normalization

This module records the finite chart identity needed to compare the direct
exact-thirteen valuation with the fixed-cell data.  It also packages the
boundary facts already present in an `ExactThirteenBranchIngress`; it does not
claim any fixed-row incidence or fixed-cell occurrence theorem.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure

open DRExactThirteenValuation
open ExactThirteenBranchIngress
open CardGeThirteenTwoCanonicalK4FixedCellData

/- The direct exact-thirteen profile uses the same finite chart as the fixed
cell's raw-to-position conversion. -/

/-- The direct `.secondOpposite` label chart is the fixed-cell `rawToPos`
conversion, pointwise on `Fin 13`. -/
theorem directIndex_secondOpposite_eq_rawToPos :
    directIndex .secondOpposite = rawToPos := by
  funext l
  fin_cases l <;> decide

namespace ExactThirteenBranchIngress

variable {D : CounterexampleData} {S : SurplusCapPacket D.A}

/-- An exact-thirteen branch ingress already supplies an injective, convex CCW
boundary whose image is the carrier.  The image equality is transported from
the label map through the finite chart permutation; this package adds no
fixed-cell row incidences. -/
theorem boundary_facts (I : ExactThirteenBranchIngress S) :
    Function.Injective I.φ ∧
      Finset.univ.image I.φ = D.A ∧
        EuclideanGeometry.IsCcwConvexPolygon I.φ := by
  have hidx_injective : Function.Injective I.idx :=
    ConvexBoundaryEnumeration.idx_injective I.boundaryEnumeration
  have hidx_surjective : Function.Surjective I.idx :=
    Finite.injective_iff_surjective.mp hidx_injective
  refine ⟨I.boundaryEnumeration.injective, ?_, I.boundaryEnumeration.ccw⟩
  calc
    Finset.univ.image I.φ =
        (Finset.univ.image I.idx).image I.φ := by
      rw [Finset.image_univ_of_surjective hidx_surjective]
    _ = Finset.univ.image (fun l => I.φ (I.idx l)) := by
      rw [Finset.image_image]
      rfl
    _ = Finset.univ.image I.pt := by
      apply Finset.image_congr
      intro l hl
      exact (I.boundaryEnumeration.pt_eq l).symm
    _ = D.A := I.labelMap.image_eq

end ExactThirteenBranchIngress
end ATailFrontierLiveClosure
end Problem97
