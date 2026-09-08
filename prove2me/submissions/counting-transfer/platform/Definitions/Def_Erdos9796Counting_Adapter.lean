/-
Copyright 2025 The Formal Conjectures Authors.

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

import Definitions.Def_Erdos9796Mission

scoped[EuclideanGeometry] notation "ℝ²" => EuclideanSpace ℝ (Fin 2)

open scoped EuclideanGeometry Finset Real

/-- Oriented angles on the two-dimensional Euclidean space. -/
noncomputable instance Module.orientedEuclideanSpaceFinTwo :
    Module.Oriented ℝ ℝ² (Fin 2) :=
  ⟨Basis.orientation <| PiLp.basisFun 2 _ _⟩

/-- The two-dimensional Euclidean space has real dimension two. -/
instance fact_finrank_euclideanSpace_fin_two :
    Fact (Module.finrank ℝ ℝ² = 2) :=
  ⟨finrank_euclideanSpace_fin⟩

namespace EuclideanGeometry

variable {V P : Type*} {n : ℕ}
variable [NormedAddCommGroup V] [InnerProductSpace ℝ V]
variable [MetricSpace P] [NormedAddTorsor V P]
variable [Module.Oriented ℝ V (Fin 2)]
variable [Fact (Module.finrank ℝ V = 2)] {p : Fin n → P}

/-- Compatibility name for the mission's extreme-point predicate. -/
abbrev ConvexIndep (S : Set ℝ²) : Prop :=
  Erdos9796Mission.ConvexIndep S

/-- A sequence of points forms a counter-clockwise convex polygon. -/
def IsCcwConvexPolygon (p : Fin n → P) : Prop :=
  ∀ ⦃i j k⦄, i < j → j < k → (∡ (p i) (p j) (p k)).sign = 1

theorem IsCcwConvexPolygon.sign_oangle (hp : IsCcwConvexPolygon p)
    {i j k : Fin n} (hij : i < j) (hjk : j < k) :
    (∡ (p i) (p j) (p k)).sign = 1 :=
  hp hij hjk

set_option linter.docPrime false in
theorem IsCcwConvexPolygon.sign_oangle' (hp : IsCcwConvexPolygon p)
    {i j k : Fin n} (hij : i < j) (hjk : j < k) :
    (∡ (p j) (p k) (p i)).sign = 1 := by
  rw [EuclideanGeometry.oangle_rotate_sign]
  exact hp hij hjk

set_option linter.docPrime false in
theorem IsCcwConvexPolygon.sign_oangle'' (hp : IsCcwConvexPolygon p)
    {i j k : Fin n} (hij : i < j) (hjk : j < k) :
    (∡ (p k) (p i) (p j)).sign = 1 := by
  rw [← EuclideanGeometry.oangle_rotate_sign]
  exact hp hij hjk

end EuclideanGeometry

namespace Erdos97

abbrev HasNEquidistantPointsAt :=
  Erdos9796Mission.HasNEquidistantPointsAt

abbrev HasNEquidistantPointsOn :=
  Erdos9796Mission.HasNEquidistantPointsOn

abbrev HasNEquidistantProperty :=
  Erdos9796Mission.HasNEquidistantProperty

end Erdos97

namespace Problem97

/-- A stable namespace anchor used by independently compiled theorem nodes. -/
def prove2meCountingNamespaceAnchor : Unit := ()

namespace ConvexIndep

/-- A stable namespace anchor for lemmas attached to convex independence. -/
def prove2meCountingNamespaceAnchor : Unit := ()

end ConvexIndep

namespace CGN

/-- A stable namespace anchor for the CGN counting subgraph. -/
def prove2meCountingNamespaceAnchor : Unit := ()

end CGN

namespace MEC

/-- A stable namespace anchor for the minimum-enclosing-circle subgraph. -/
def prove2meCountingNamespaceAnchor : Unit := ()

end MEC

namespace Dumitrescu

/-- A stable namespace anchor for the Dumitrescu counting subgraph. -/
def prove2meCountingNamespaceAnchor : Unit := ()

end Dumitrescu

end Problem97
