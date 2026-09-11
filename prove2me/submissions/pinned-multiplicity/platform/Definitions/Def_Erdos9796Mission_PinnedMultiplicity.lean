/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under GPL-3.0-or-later as described in the file LICENSE.
Authors: Adam McKenna
-/

import Definitions.Def_Erdos9796Mission

open scoped EuclideanGeometry

namespace Erdos9796Mission

/-- The positive distances from `p` that are realized inside `A`. -/
noncomputable def pinnedRadii (A : Finset Plane) (p : Plane) : Finset ℝ :=
  (A.image (fun q => dist p q)).filter (fun r => 0 < r)

/-- The largest number of points of `A` on one positive-radius circle centered
at `p`. The value is zero when no positive distance is realized. -/
noncomputable def pinnedMultiplicity (A : Finset Plane) (p : Plane) : ℕ :=
  (pinnedRadii A p).sup (fun r => (A.filter (fun q => dist p q = r)).card)

end Erdos9796Mission
