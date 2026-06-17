import Erdos9796Proof.P97.Foundation
import Erdos9796Proof.P97.N9Endpoint

/-!
# Universal descent assembly for Erdős Problem 97 (Milestone 1)

This file packages the universal-descent reduction from
`docs/97-universal-lean-proof-blueprint.md`:

  Given a counting obstruction (`9 ≤ |A|` for every convex 4-equidistant set)
  and a descent step (`|A| > 9 ⇒ ∃` strictly smaller counterexample),
  the all-cardinality statement follows by strong induction on `|A|`,
  with `FiniteN9Closure` discharging the `|A| = 9` base case.

All predicates (`HasNEquidistantProperty`, `ConvexIndep`) are upstream
declarations (`Erdos97.*`, `EuclideanGeometry.ConvexIndep`) — see
`Foundation.lean`.  Modulo `Finset.coe`, the conclusion is exactly the
RHS of `Erdos97.erdos_97`.
-/

open scoped EuclideanGeometry

namespace Problem97

/-- A nonempty convex-independent finset of plane points exhibiting the
4-equidistant property — i.e., a Problem-97 counterexample. -/
def IsCounterexample (A : Finset ℝ²) : Prop :=
  A.Nonempty ∧ ConvexIndep A ∧ HasNEquidistantProperty 4 A

/-- The all-cardinality statement of Problem 97 — identical in shape to
the RHS of upstream `Erdos97.erdos_97`. -/
abbrev UniversalProblem97Statement : Prop :=
  ∀ A : Finset ℝ², A.Nonempty → ConvexIndep A →
    ¬ HasNEquidistantProperty 4 A

/-- The two hypotheses used by the universal-descent assembly. -/
structure UniversalReductionHypotheses : Prop where
  /-- Milestone 3: every nonempty convex 4-equidistant counterexample
  has `≥ 9` vertices.  Nonempty is required: `HasNEquidistantProperty 4 ∅`
  is vacuously true, so the bound fails on the empty set. -/
  counting :
    ∀ A : Finset ℝ²,
      A.Nonempty → ConvexIndep A → HasNEquidistantProperty 4 A → 9 ≤ A.card
  /-- Milestone 4: no counterexample with strictly more than 9 vertices can
  be a *minimal* counterexample.  The trailing hypothesis is the strong
  induction IH ("no strictly-smaller K4 counterexample exists") supplied
  by `UniversalProblem97_of_reduction`.  Carrying the IH through the
  descent step lets the M4 proof program assume minimality, which
  simplifies the K4-witness pinning step in U1.3. -/
  descent :
    ∀ A : Finset ℝ²,
      A.Nonempty → ConvexIndep A → HasNEquidistantProperty 4 A → 9 < A.card →
      (∀ B : Finset ℝ², B.card < A.card →
        B.Nonempty → ConvexIndep B → HasNEquidistantProperty 4 B → False) →
        False

/-- **Universal descent assembly.**  The counting obstruction and descent
step, together with `FiniteN9Closure`, close the all-cardinality statement
by strong induction on `|A|`. -/
theorem UniversalProblem97_of_reduction
    (H : UniversalReductionHypotheses) :
    UniversalProblem97Statement := by
  classical
  -- It suffices to prove the cardinality-indexed contrapositive.
  suffices h : ∀ n : ℕ, ∀ A : Finset ℝ²,
      A.card = n → A.Nonempty → ConvexIndep A →
        HasNEquidistantProperty 4 A → False by
    intro A hne hconv hbad
    exact h A.card A rfl hne hconv hbad
  intro n
  induction n using Nat.strong_induction_on with
  | _ n ih =>
    intro A hcard hne hconv hbad
    -- The counting obstruction gives `9 ≤ |A|`; case on `<` vs `=`.
    have hge : 9 ≤ A.card := H.counting A hne hconv hbad
    rcases hge.lt_or_eq with hgt | heq
    · -- Descent step on `|A| > 9`: build the IH-as-hypothesis from the
      -- strong-induction `ih` and feed it to `H.descent`, which now
      -- returns `False` directly under the minimality assumption.
      refine H.descent A hne hconv hbad hgt
        (fun B hBlt hBne hBconv hBbad => ?_)
      have hBn : B.card < n := hcard ▸ hBlt
      exact ih B.card hBn B rfl hBne hBconv hBbad
    · -- Base case `|A| = 9` is discharged by `FiniteN9Closure`.
      exact FiniteN9Closure A heq.symm hconv hbad

end Problem97
