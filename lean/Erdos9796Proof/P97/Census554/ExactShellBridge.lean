/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Census554.EqualityCore
import Erdos9796Proof.P97.U1CarrierInjection

/-!
# Exact-shell equality-closure bridge

The generic equality core records a finite pattern's distance equalities.  A
`CriticalFourShell` supplies the corresponding exact-radius exclusion in the
live P97 geometry: an ambient label outside its support cannot lie on the shell
circle.  This file connects those two interfaces without asserting that a
particular confinement-probe assignment is realized in Lean.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace Census554
namespace EqualityCore

/-- An equality-closure path cannot force a label outside an exact critical
shell onto that shell's circle. -/
theorem false_of_criticalFourShell_exactOffCircleCore
    {α : Type*} {P : RowPattern α} {pointOf : α → ℝ²}
    (hreal : Realizes P pointOf) (core : ExactOffCircleCore P)
    {A : Finset ℝ²} {q : ℝ²}
    (shell : CriticalFourShell A q (pointOf core.c))
    (ha : pointOf core.a ∈ shell.support)
    (hzA : pointOf core.z ∈ A)
    (hznot : pointOf core.z ∉ shell.support) : False := by
  have heq :
      dist (pointOf core.c) (pointOf core.a) =
        dist (pointOf core.c) (pointOf core.z) := by
    simpa [edgeDist] using EdgeClosure.sound hreal core.hacz
  have hzradius : dist (pointOf core.c) (pointOf core.z) = shell.radius := by
    calc
      dist (pointOf core.c) (pointOf core.z) =
          dist (pointOf core.c) (pointOf core.a) := heq.symm
      _ = shell.radius := shell.support_eq_radius _ ha
  exact hznot (shell.off_row_named_label_forbidden hzA hzradius)

end EqualityCore
end Census554
end Problem97
