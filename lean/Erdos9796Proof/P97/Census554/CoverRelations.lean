/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.Census554.GeometryBridge

/-!
# Census-554 cover relations

Bank-independent relational interface between the finite cover checker, the
banked dead patterns, and a geometric realization of a Census554 cube.

The cover checker remains purely combinatorial: `PatternEmbedsUnder P f kappa`
says that `f` is injective on the labels mentioned by `P` and maps each mask
of `P` into the corresponding class of `kappa`. `RealizesCube x kappa` is the
separate geometric assertion that `x` is injective and realizes every cube
class as an equidistance class. Combining the two supplies exactly the input
to `motif_transfer_of_supportInjOn`; `CubeOk kappa` alone never implies a
geometric contradiction.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace Census554

/-- A generated cover-bank row. The finite checker consumes `pattern`; the
generated certificate index uses `sourceId` to attach the corresponding
`IsDead pattern` theorem. Embedding witnesses remain separate because they
belong to individual cover instances, not to the source certificate row. -/
structure CoverRow where
  sourceId : String
  pattern : Pattern

/-- A cover row is certified when its source pattern has a checked deadness
proof. This proposition is intentionally separate from the computable row
data. -/
def CoverRow.Certified (row : CoverRow) : Prop := IsDead row.pattern

/-- `P` embeds into `kappa` under the total label map `f`. Only the support of
`P` must be injective; the support-extension theorem supplies a globally
injective permutation when motif transfer is invoked. -/
structure PatternEmbedsUnder (P : Pattern) (f : Fin 11 → Fin 11)
    (kappa : Cube) : Prop where
  injOn : Set.InjOn f (support P)
  map_mem : ∀ {c a}, a ∈ P c → f a ∈ kappa (f c)

/-- A geometric realization of every class in a Census554 cube. Injectivity
is retained here, rather than inferred from `CubeOk`, because it is geometric
data required by motif transfer. -/
structure RealizesCube (x : Fin 11 → ℝ²) (kappa : Cube) : Prop where
  injective : Function.Injective x
  equidist : ∀ c, ∀ a ∈ kappa c, ∀ b ∈ kappa c,
    dist (x c) (x a) = dist (x c) (x b)

/-- A realized cube realizes every pattern embedded into it, after applying
the embedding map to the pattern labels. -/
theorem RealizesCube.equidist_of_patternEmbedsUnder
    {P : Pattern} {f : Fin 11 → Fin 11} {kappa : Cube}
    {x : Fin 11 → ℝ²} (hx : RealizesCube x kappa)
    (hEmbed : PatternEmbedsUnder P f kappa) :
    ∀ c, ∀ a ∈ P c, ∀ b ∈ P c,
      dist (x (f c)) (x (f a)) = dist (x (f c)) (x (f b)) := by
  intro c a ha b hb
  exact hx.equidist (f c) (f a) (hEmbed.map_mem ha)
    (f b) (hEmbed.map_mem hb)

/-- A checked dead pattern embedded in a cube rules out every geometric
realization of that cube. This is the bank-independent implication consumed
after the finite cover theorem selects a row and embedding. -/
theorem not_realizesCube_of_isDead_of_patternEmbedsUnder
    {P : Pattern} {f : Fin 11 → Fin 11} {kappa : Cube}
    {x : Fin 11 → ℝ²} (hDead : IsDead P)
    (hEmbed : PatternEmbedsUnder P f kappa) :
    ¬RealizesCube x kappa := by
  intro hx
  exact motif_transfer_of_supportInjOn P hDead f hEmbed.injOn
    x hx.injective (hx.equidist_of_patternEmbedsUnder hEmbed)

/-- Row-oriented form of the dead-pattern implication used by the generated
cover-core bank. -/
theorem CoverRow.not_realizesCube_of_embeds
    {row : CoverRow} {f : Fin 11 → Fin 11} {kappa : Cube}
    {x : Fin 11 → ℝ²} (hDead : row.Certified)
    (hEmbed : PatternEmbedsUnder row.pattern f kappa) :
    ¬RealizesCube x kappa :=
  not_realizesCube_of_isDead_of_patternEmbedsUnder hDead hEmbed

namespace Card11SelectedCube

/-- The selected geometric cube constructed by `GeometryBridge` realizes its
pulled-back support masks. -/
theorem realizesCube
    {A : Finset ℝ²} {M : MoserTriangle A}
    {CP : CapTriple A M} {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    (S : Card11SelectedCube L) :
    RealizesCube L.pointOf S.cube where
  injective := L.injective
  equidist := fun c a ha b hb =>
    S.equidist_of_mem_cube c a b ha hb

end Card11SelectedCube

/- ## Relational smoke

The source pattern below has two participating centers. Swapping source label
`0` with target label `6` embeds it into `twoRowCube`; the second example checks
that `RealizesCube` transports both pattern rows through that nontrivial map.
-/

private def twoRowPattern : Pattern := fun c =>
  if c = 0 then {1, 2}
  else if c = 3 then {4, 5}
  else ∅

private def twoRowRelabel : Fin 11 → Fin 11 :=
  Equiv.swap (0 : Fin 11) 6

private def twoRowCube : Cube := fun c =>
  if c = 6 then {1, 2}
  else if c = 3 then {4, 5}
  else ∅

private theorem twoRowPattern_embeds :
    PatternEmbedsUnder twoRowPattern twoRowRelabel twoRowCube := by
  refine ⟨(Equiv.swap (0 : Fin 11) 6).injective.injOn, ?_⟩
  intro c a ha
  by_cases hc0 : c = 0
  · subst c
    have ha' : a = 1 ∨ a = 2 := by
      simpa [twoRowPattern] using ha
    rcases ha' with rfl | rfl <;> decide
  · by_cases hc3 : c = 3
    · subst c
      have ha' : a = 4 ∨ a = 5 := by
        simpa [twoRowPattern] using ha
      rcases ha' with rfl | rfl <;> decide
    · exfalso
      change a ∈ (if c = 0 then {1, 2}
        else if c = 3 then {4, 5} else ∅) at ha
      rw [if_neg hc0, if_neg hc3] at ha
      have hnot : a ∉ (∅ : Finset (Fin 11)) := by simp
      exact hnot ha

example {x : Fin 11 → ℝ²} (hx : RealizesCube x twoRowCube) :
    ∀ c, ∀ a ∈ twoRowPattern c, ∀ b ∈ twoRowPattern c,
      dist (x (twoRowRelabel c)) (x (twoRowRelabel a)) =
        dist (x (twoRowRelabel c)) (x (twoRowRelabel b)) :=
  hx.equidist_of_patternEmbedsUnder twoRowPattern_embeds

end Census554
end Problem97
