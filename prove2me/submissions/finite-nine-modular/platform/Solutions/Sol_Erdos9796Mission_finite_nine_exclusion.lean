/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under GPL-3.0-or-later as described in the file LICENSE.
Authors: Adam McKenna
-/

import Theorems.Thm_Erdos9796FiniteNine_shell
import Theorems.Thm_Erdos9796FiniteNine_form_b_v1
import Theorems.Thm_Erdos9796FiniteNine_form_b_v2
import Theorems.Thm_Erdos9796FiniteNine_form_a_v1
import Theorems.Thm_Erdos9796FiniteNine_form_c_v1
import Theorems.Thm_Erdos9796FiniteNine_cyclic_forms
import Theorems.Thm_Erdos9796FiniteNine_cap_containment
import Theorems.Thm_Erdos9796FiniteNine_circle_placement
import Theorems.Thm_Erdos9796FiniteNine_single_apex_exhaustion
import Definitions.Def_Erdos9796Counting_Adapter

/-! SKETCH — NOT PROMOTABLE. This candidate root has no direct `sorry`, but its
nine imported child declarations remain sketches until Stage 2 supplies and
audits their proof solutions. -/

open Erdos9796Mission

theorem solution :
    ∀ A : Finset Plane, A.card = 9 → ConvexIndep (A : Set Plane) →
      ¬ HasNEquidistantProperty 4 A := by
  intro A hcard hconv hK4
  have hne : A.Nonempty := Finset.card_pos.mp (by omega)
  obtain ⟨S⟩ := Erdos9796FiniteNine.shell hne hcard hconv hK4
  have hB1 := Erdos9796FiniteNine.form_b_v1 S
  have hB2 := Erdos9796FiniteNine.form_b_v2 S
  have hA1 := Erdos9796FiniteNine.form_a_v1 S hB2
  have hC1 := Erdos9796FiniteNine.form_c_v1 S
  have hcyclic := Erdos9796FiniteNine.cyclic_forms S
  have hN4e := Erdos9796FiniteNine.cap_containment S hA1 hB1 hC1 hB2 hcyclic
  classical
  obtain ⟨x, hxI1⟩ : S.I1.Nonempty :=
    Finset.card_pos.mp (by have := S.I1_card_ge_two; omega)
  exact Erdos9796FiniteNine.single_apex_exhaustion S hN4e S.hK4 hxI1
