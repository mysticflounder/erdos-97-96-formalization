/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.DRExactThirteenBranchIngress
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.CardGeThirteenCenter9K4Ingress

/-!
# Source adapter for the exact-thirteen center-9 terminal

The center-9 row-domain module proves a finite cancellation terminal once the
five fixed source rows and one global four-support row are available in the
same `Fin 13` boundary chart.  This module transports the boundary/image and
convexity data from `ExactThirteenBranchIngress`; it leaves the five fixed-row
source packet explicit rather than silently reconstructing it.
-/

namespace Problem97
namespace ATailFrontierLiveClosure

open scoped EuclideanGeometry
open Census554.GeneralCarrierBridge
open CardGeThirteenCenter9K4RowDomain

namespace ExactThirteenBranchIngress

variable {D : CounterexampleData} {S : SurplusCapPacket D.A}

/-- The exact-thirteen source chart cannot realize a center-9 four-support row
when the five row-tagged equalities are supplied in that same chart. -/
theorem false_of_center9FourSupportRow_of_ingress
    (P : ExactThirteenBranchIngress S)
    (hfixed : FixedFiveRows P.φ)
    {support : Finset (Fin 13)}
    (hcenter9 : Center9FourSupportRow P.φ support) : False := by
  let cast : Fin 13 → Fin P.P.B.n := Fin.cast P.P.card_n.symm
  have hcast_surjective : Function.Surjective cast := by
    intro q
    refine ⟨Fin.cast P.P.card_n q, ?_⟩
    simp [cast]
  have himage : (Finset.univ : Finset (Fin 13)).image P.φ = D.A := by
    have hboundary_image :
        Finset.univ.image (fun q : Fin 13 => P.P.B.boundary (cast q)) = D.A := by
      calc
        Finset.univ.image (fun q : Fin 13 => P.P.B.boundary (cast q)) =
            (Finset.univ.image cast).image P.P.B.boundary := by
          simpa [Function.comp_def] using
            (Finset.image_image (s := (Finset.univ : Finset (Fin 13)))
              (f := cast) (g := P.P.B.boundary)).symm
        _ = Finset.univ.image P.P.B.boundary := by
          rw [Finset.image_univ_of_surjective hcast_surjective]
        _ = D.A := P.P.B.boundary_image
    have hφ : P.φ = fun q : Fin 13 => P.P.B.boundary (cast q) := by
      funext q
      exact P.boundary_realization q
    rw [hφ]
    exact hboundary_image
  have hconv : ConvexIndep D.A := by
    rw [← himage]
    exact P.boundaryEnumeration.convexIndep
  exact false_of_center9_fourSupportRow hconv
    P.boundaryEnumeration.injective himage P.boundaryEnumeration.ccw
    hfixed hcenter9

/-- The same terminal with the global `K4` existential discharged by the
source ingress.  This is the form a C3 arm can use once it has supplied the
five fixed row equalities in the exact-thirteen chart. -/
theorem false_of_center9_globalK4_of_ingress
    (P : ExactThirteenBranchIngress S)
    (hfixed : FixedFiveRows P.φ) : False := by
  obtain ⟨support, hcenter9⟩ :=
    exists_center9FourSupportRow_of_globalK4 P
  exact false_of_center9FourSupportRow_of_ingress P hfixed hcenter9

end ExactThirteenBranchIngress
end ATailFrontierLiveClosure
end Problem97
