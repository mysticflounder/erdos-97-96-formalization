import Erdos9796Proof.P97.UniversalLocal

/-!
# Upstream-vocabulary bridge to `Erdos97.erdos_97` (Milestone 6)

Since `Foundation.lean` defines `Problem97.HasNEquidistantProperty`,
`Problem97.HasNEquidistantPointsAt/On`, and `Problem97.ConvexIndep`
as **abbreviations** over upstream `Erdos97.*` / `EuclideanGeometry.ConvexIndep`,
the M1 universal statement and the RHS of `Erdos97.erdos_97` are
definitionally equal — the bridge is `Iff.rfl`-trivial.

This file packages that equality and exports the upstream-shape
result.
-/

open scoped EuclideanGeometry

namespace Problem97

/-- The local `UniversalProblem97Statement` is literally the RHS of
`Erdos97.erdos_97`, modulo `Finset.coe`. -/
theorem upstream_iff :
    UniversalProblem97Statement ↔
      (∀ A : Finset ℝ², A.Nonempty → EuclideanGeometry.ConvexIndep (A : Set ℝ²) →
        ¬ Erdos97.HasNEquidistantProperty 4 A) :=
  Iff.rfl

/-- **Upstream-vocabulary form.**  The RHS of `Erdos97.erdos_97`,
discharged by `UniversalProblem97` (modulo the three tracked axioms). -/
theorem erdos97_rhs :
    ∀ A : Finset ℝ², A.Nonempty → EuclideanGeometry.ConvexIndep (A : Set ℝ²) →
      ¬ Erdos97.HasNEquidistantProperty 4 A :=
  UniversalProblem97

end Problem97
