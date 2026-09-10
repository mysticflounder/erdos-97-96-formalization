/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under GPL-3.0-or-later as described in the file LICENSE.
Authors: Adam McKenna
-/

import Definitions.Def_Erdos9796Mission

open Erdos9796Mission

/-! Exact statement mirror for the finite-nine mission root. -/
-- PROVE2ME_FORMAL_STATEMENT
theorem Erdos9796Mission.finite_nine_exclusion :
    ∀ A : Finset Plane, A.card = 9 → ConvexIndep (A : Set Plane) → ¬ HasNEquidistantProperty 4 A := by sorry
