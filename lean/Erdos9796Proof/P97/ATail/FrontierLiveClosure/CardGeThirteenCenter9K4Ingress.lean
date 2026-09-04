/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.DRExactThirteenBranchIngress
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.CardGeThirteenCenter9K4RowDomain

/-!
# Global-K4 ingress for the raw center-9 four-support row

The exact-thirteen branch ingress exposes a finite boundary enumeration.  A
global `K4` hypothesis supplies a selected four-class at its point in position
`2`; injectivity and the image of the boundary pull that geometric support back
to a `Fin 13` support.  This module supplies only that existential row and does
not identify any of the five fixed rows.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure

open ATailCriticalPairFrontier
open Census554.ZeroCutBoundaryIndexing
open DRExactThirteenValuation
open CardGeThirteenCenter9K4RowDomain

namespace ExactThirteenBranchIngress

variable {D : CounterexampleData} {S : SurplusCapPacket D.A}

/-- Global `K4` supplies a four-support row at raw center `9`, whose exact
positional label in the exact-thirteen boundary chart is `2`. -/
theorem exists_center9FourSupportRow_of_globalK4
    (P : ExactThirteenBranchIngress S) :
    ∃ support : Finset (Fin 13),
      Center9FourSupportRow P.φ support := by
  classical
  let cast : Fin 13 → Fin P.P.B.n := Fin.cast P.P.card_n.symm
  have hcast_surjective : Function.Surjective cast := by
    intro q
    refine ⟨Fin.cast P.P.card_n q, ?_⟩
    simp [cast]
  have hphi_image : Finset.univ.image P.φ = D.A := by
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
    calc
      Finset.univ.image P.φ =
          Finset.univ.image (fun q : Fin 13 => P.P.B.boundary (cast q)) := by
        apply Finset.ext
        intro x
        constructor
        · intro hx
          rcases Finset.mem_image.mp hx with ⟨q, hq, hqx⟩
          exact Finset.mem_image.mpr
            ⟨q, hq, (P.boundary_realization q).symm.trans hqx⟩
        · intro hx
          rcases Finset.mem_image.mp hx with ⟨q, hq, hqx⟩
          exact Finset.mem_image.mpr
            ⟨q, hq, (P.boundary_realization q).trans hqx⟩
      _ = D.A := hboundary_image
  have hcenter_mem : P.φ (2 : Fin 13) ∈ D.A := by
    rw [← hphi_image]
    exact Finset.mem_image.mpr ⟨2, Finset.mem_univ _, rfl⟩
  obtain ⟨K⟩ := exists_selectedFourClass_of_globalK4 D.K4 hcenter_mem
  let support : Finset (Fin 13) :=
    Finset.univ.filter (fun i => P.φ i ∈ K.support)
  have hsupport_image : support.image P.φ = K.support := by
    ext x
    constructor
    · intro hx
      rcases Finset.mem_image.mp hx with ⟨i, hi, rfl⟩
      exact (Finset.mem_filter.mp hi).2
    · intro hx
      have hxA : x ∈ D.A := K.support_subset_A hx
      have hximage : x ∈ Finset.univ.image P.φ := by
        rw [hphi_image]
        exact hxA
      rcases Finset.mem_image.mp hximage with ⟨i, hi, hix⟩
      exact Finset.mem_image.mpr ⟨i, Finset.mem_filter.mpr ⟨hi, hix.symm ▸ hx⟩, hix⟩
  have hsupport_card : support.card = 4 := by
    calc
      support.card = (support.image P.φ).card := by
        rw [Finset.card_image_of_injective _ P.boundaryEnumeration.injective]
      _ = K.support.card := congrArg Finset.card hsupport_image
      _ = 4 := K.support_card
  have hcenter_not_mem : (2 : Fin 13) ∉ support := by
    intro h2
    exact K.center_not_mem (Finset.mem_filter.mp h2).2
  refine ⟨support, ?_, hcenter_not_mem, ?_⟩
  · exact hsupport_card
  · intro u hu v hv
    have huK : P.φ u ∈ K.support := (Finset.mem_filter.mp hu).2
    have hvK : P.φ v ∈ K.support := (Finset.mem_filter.mp hv).2
    exact (K.support_eq_radius (P.φ u) huK).trans
      (K.support_eq_radius (P.φ v) hvK).symm

end ExactThirteenBranchIngress
end ATailFrontierLiveClosure
end Problem97
