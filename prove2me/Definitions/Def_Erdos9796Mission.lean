/-
Copyright 2026 The Formal Conjectures Authors.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    https://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
-/

import Mathlib

/-!
# Combined Erdős Problems 97 and 96 mission vocabulary

The equidistance predicates follow `FormalConjectures/ErdosProblems/97.lean`,
and the convex unit-distance counting definitions follow
`FormalConjectures/ErdosProblems/96.lean` from the Formal Conjectures project.
The source problems are also documented at
<https://www.erdosproblems.com/96> and <https://www.erdosproblems.com/97>.
-/

open Filter

namespace Erdos9796Mission

abbrev Plane := EuclideanSpace ℝ (Fin 2)

def ConvexIndep (S : Set Plane) : Prop :=
  ∀ a ∈ S, a ∉ convexHull ℝ (S \ {a})

def HasNEquidistantPointsAt (n : ℕ) (A : Finset Plane) (p : Plane) : Prop :=
  ∃ r : ℝ, r > 0 ∧ (A.filter fun q ↦ dist p q = r).card ≥ n

def HasNEquidistantPointsOn (n : ℕ) (A B : Finset Plane) : Prop :=
  ∀ p ∈ B, HasNEquidistantPointsAt n A p

def HasNEquidistantProperty (n : ℕ) (A : Finset Plane) : Prop :=
  HasNEquidistantPointsOn n A A

noncomputable def unitDistancePairsCount (A : Finset Plane) : ℕ := by
  classical
  let relation : Plane → Plane → Prop := fun p q ↦ 0 < dist p q ∧ dist p q = 1
  let symmetricRelation : {f : Plane → Plane → Prop // ∀ p q, f p q = f q p} :=
    ⟨relation, by
      intro p q
      exact congrArg (fun d : ℝ => 0 < d ∧ d = 1) (dist_comm p q)⟩
  exact (A.sym2.filter (Sym2.lift symmetricRelation)).card

noncomputable def convexUnitDistanceCounts (n : ℕ) : Set ℕ :=
  {unitDistancePairsCount points |
    (points : Finset Plane) (_ : points.card = n) (_ : ConvexIndep (points : Set Plane))}

noncomputable def maxConvexUnitDistances (n : ℕ) : ℕ :=
  sSup (convexUnitDistanceCounts n)

def Problem97 : Prop :=
  ∀ A : Finset Plane, A.Nonempty → ConvexIndep (A : Set Plane) →
    ¬ HasNEquidistantProperty 4 A

def Problem96 : Prop :=
  (fun n => (maxConvexUnitDistances n : ℝ)) =O[atTop] fun n => (n : ℝ)

end Erdos9796Mission
