/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.GeneralCarrierAbstractRowSystem
import Erdos9796Proof.P97.N9Endpoint.Closure

/-!
# Compatibility of the general carrier with the exact Fin-9 cell

The RVOL Wave-2b computation closes one abstract row-system cell on `Fin 9`.
That cell is not an induced subsystem of a live minimal counterexample.  A
nonempty support-closed subsystem of the faithful carrier is the whole carrier,
and the existing finite-nine endpoint excludes a nine-point counterexample.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace GeneralCarrierAbstractRowSystem

open Census554.GeneralCarrierBridge

/-- A minimal faithful carrier has no nonempty support-closed subsystem with
exactly nine labels.  Consequently the closed abstract `Fin 9` canary is not a
source-faithful induced subsystem of this carrier. -/
theorem no_fin9_supportClosed_subsystem_of_minimal
    {D : CounterexampleData} (hminimal : D.Minimal)
    (F : FaithfulCarrierPattern D.A) :
    ¬ ∃ T : Finset (CarrierLabel D.A),
      T.Nonempty ∧ T.card = 9 ∧ (system F).SupportClosed T := by
  classical
  rintro ⟨T, hTne, hTcard, hclosed⟩
  have hTuniv : T = Finset.univ :=
    system_supportMinimal hminimal F hTne hclosed
  have hcarrierCard : D.A.card = 9 := by
    calc
      D.A.card = (Finset.univ : Finset (CarrierLabel D.A)).card := by simp
      _ = T.card := by rw [hTuniv]
      _ = 9 := hTcard
  exact FiniteN9Closure D.A hcarrierCard D.convex D.K4

end GeneralCarrierAbstractRowSystem
end Problem97
