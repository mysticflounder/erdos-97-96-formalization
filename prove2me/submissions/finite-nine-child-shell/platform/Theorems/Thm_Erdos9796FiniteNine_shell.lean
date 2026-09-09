/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under GPL-3.0-or-later as described in the file LICENSE.
Authors: Adam McKenna
-/

import Definitions.Def_Erdos9796FiniteNine_Shell

open scoped EuclideanGeometry

-- PROVE2ME_FORMAL_STATEMENT
theorem Erdos9796FiniteNine.shell :
    ∀ {A : Finset ℝ²}, A.Nonempty → A.card = 9 →
      Batch3N9.Problem97.ConvexIndep A →
      Batch3N9.Problem97.HasNEquidistantProperty 4 A →
      Nonempty (Batch3N9.Problem97.FiniteEndpointShell A) := by sorry
