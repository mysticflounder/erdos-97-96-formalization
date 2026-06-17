import Erdos9796Proof.P97.N9EndpointN67
import Erdos9796Proof.P97.U2OneHitBound
import Erdos9796Proof.P97.N8.N8aArcTwoCircle

/-!
# N8b endpoint-pair split and N8e own-mid residual

This file implements the W8 theorem-facing surface from
`docs/n-lane/specs/W8-n8b-endpoint-pair-spec.md`.

Retyped 2026-06-05 onto W7's accepted shared N8 vocabulary
(`N8aArcTwoCircle.lean`: `N8ArcCircle` / `N8ApexArcWitness` /
`N8AdjacentArcWitness`): the own-mid residual packet now carries the
`N8AdjacentArcWitness` for its adjacent cap, and `N8e` consumes W7's real
`FiniteEndpointShell.N8a3_adjacent_one_hit` export directly — the former
local fallback theorem and its `SORRY-GATE` are gone.  Producing the
witness (ambient cap circle + ordered chain + E3-L13 monotonicity) is the
obligation of whoever constructs the residual (the N8b split / W10
producers), where it belongs.
-/

open scoped EuclideanGeometry
open Finset

namespace Problem97

namespace FiniteEndpointShell

/-- Local fallback for W7's shared N8 adjacent-cap selector. -/
inductive AdjacentSide where
  | left
  | right
  deriving DecidableEq, Repr

/-- The cap selected by the N8 index `i`. -/
@[reducible] noncomputable def capByIndex
    {A : Finset ℝ²} (S : FiniteEndpointShell A) (i : Fin 3) : Finset ℝ² :=
  match i.1 with
  | 0 => S.CP.C1
  | 1 => S.CP.C2
  | _ => S.CP.C3

/-- The open interior of the cap selected by the N8 index `i`. -/
@[reducible] noncomputable def capInteriorByIndex
    {A : Finset ℝ²} (S : FiniteEndpointShell A) (i : Fin 3) : Finset ℝ² :=
  match i.1 with
  | 0 => S.I1
  | 1 => S.I2
  | _ => S.I3

/-- One endpoint of the selected cap, in cyclic order. -/
@[reducible] def ownLeftEndpointByIndex
    {A : Finset ℝ²} (S : FiniteEndpointShell A) (i : Fin 3) : ℝ² :=
  match i.1 with
  | 0 => S.triangle.v2
  | 1 => S.triangle.v3
  | _ => S.triangle.v1

/-- The other endpoint of the selected cap, in cyclic order. -/
@[reducible] def ownRightEndpointByIndex
    {A : Finset ℝ²} (S : FiniteEndpointShell A) (i : Fin 3) : ℝ² :=
  match i.1 with
  | 0 => S.triangle.v3
  | 1 => S.triangle.v1
  | _ => S.triangle.v2

/-- The strict interior of the left-adjacent cap. -/
@[reducible] noncomputable def leftAdjacentInteriorByIndex
    {A : Finset ℝ²} (S : FiniteEndpointShell A) (i : Fin 3) : Finset ℝ² :=
  match i.1 with
  | 0 => S.I2
  | 1 => S.I3
  | _ => S.I1

/-- The strict interior of the right-adjacent cap. -/
@[reducible] noncomputable def rightAdjacentInteriorByIndex
    {A : Finset ℝ²} (S : FiniteEndpointShell A) (i : Fin 3) : Finset ℝ² :=
  match i.1 with
  | 0 => S.I3
  | 1 => S.I1
  | _ => S.I2

/-- The strict interior of the chosen adjacent cap. -/
@[reducible] noncomputable def adjacentInteriorByIndex
    {A : Finset ℝ²} (S : FiniteEndpointShell A) (i : Fin 3) (side : AdjacentSide) :
    Finset ℝ² :=
  match side with
  | .left => S.leftAdjacentInteriorByIndex i
  | .right => S.rightAdjacentInteriorByIndex i

/-- W8's "non-Moser apex in cap `i` with a selected `4`-class" packet.
**Frozen as canonical (Adam, 2026-06-12):** W7's shared vocabulary covers the
arc types only, not this apex-selection packet, so this local shape IS the N8b
surface; the N7→N8 (D3) and N8k→N8b (W10) seams adapt to it. -/
structure N8SelectedApex
    {A : Finset ℝ²} (S : FiniteEndpointShell A) (i : Fin 3) (x : ℝ²) where
  radius : ℝ
  radius_pos : 0 < radius
  cap_mem : x ∈ S.capInteriorByIndex i
  selected_card : 4 ≤ (SelectedClass A x radius).card

/-- W8's "the class contains two Moser vertices" packet. **Frozen as canonical
(Adam, 2026-06-12):** kept local rather than retyped onto a shared rigid-packet
vocabulary; the assembly adapts at the seams. -/
structure N8MoserEndpointPair
    {A : Finset ℝ²} (S : FiniteEndpointShell A) (i : Fin 3) (x : ℝ²) (radius : ℝ) where
  m₁ : ℝ²
  m₂ : ℝ²
  m₁_moser : m₁ ∈ S.triangle.verts
  m₂_moser : m₂ ∈ S.triangle.verts
  m₁_mem : m₁ ∈ SelectedClass A x radius
  m₂_mem : m₂ ∈ SelectedClass A x radius
  m₁_ne_m₂ : m₁ ≠ m₂

/-- The own-mid residual packet (W8 D1 export surface, retyped onto W7's
accepted vocabulary 2026-06-05). It records the own-endpoint case together
with the remaining adjacent-cap obstruction — two distinct strict witnesses
in one adjacent open cap — plus the `N8AdjacentArcWitness` (W7) tying the
apex's selected class to that cap's ordered-chain monotonicity data. The
witness fields are the producer's obligation (N8b split / W10). -/
structure EndpointOwnMidAdjacentResidual
    {A : Finset ℝ²} (S : FiniteEndpointShell A) (i : Fin 3) (x : ℝ²) where
  apex : N8SelectedApex S i x
  ownLeft_mem : S.ownLeftEndpointByIndex i ∈ SelectedClass A x apex.radius
  ownRight_mem : S.ownRightEndpointByIndex i ∈ SelectedClass A x apex.radius
  adjacentSide : AdjacentSide
  adj : N8AdjacentArcWitness
  adj_apex : adj.base.apex = x
  adj_radius : adj.base.selectedRadius = apex.radius
  adj_support : adj.base.arc.support = S.adjacentInteriorByIndex i adjacentSide
  w₁ : ℝ²
  w₂ : ℝ²
  w₁_mem :
    w₁ ∈ SelectedClass A x apex.radius ∩ S.adjacentInteriorByIndex i adjacentSide
  w₂_mem :
    w₂ ∈ SelectedClass A x apex.radius ∩ S.adjacentInteriorByIndex i adjacentSide
  w₁_ne_w₂ : w₁ ≠ w₂

/-- Proposition-level wrapper for the own-mid adjacent residual packet. -/
abbrev HasEndpointOwnMidAdjacentResidual
    {A : Finset ℝ²} (S : FiniteEndpointShell A) (i : Fin 3) (x : ℝ²) : Prop :=
  Nonempty (EndpointOwnMidAdjacentResidual S i x)

/-- **Exact-cap-class step.**  If a class member `ve` (a Moser vertex) is at the
same apex distance `radius` as the cap apex `va` — and that apex distance equals
the equilateral side `d = dist va x` — then `x` lies in the exact cap class
`Ce = A.filter (dist ve · = r)` opposite `ve`.  No chord/angle geometry: the
apex-distance forces `radius = d`, hence `dist ve x = d = r`, so `x` is in `ve`'s
exact opposite-cap class. -/
theorem mem_oppositeCap_of_selected
    {A : Finset ℝ²}
    {x va ve w : ℝ²} {radius d r : ℝ}
    (hxA : x ∈ A) {Ce : Finset ℝ²}
    (hdist_va_x : dist va x = d)
    (hva_mem : va ∈ SelectedClass A x radius)
    (hve_mem : ve ∈ SelectedClass A x radius)
    (hCeEq : A.filter (fun y => dist ve y = r) = Ce)
    (hw_mem : w ∈ Ce) (hw_dist : dist ve w = d) :
    x ∈ Ce := by
  classical
  have hxva : dist x va = radius := (mem_selectedClass.mp hva_mem).2
  have hrad : radius = d := by rw [← hxva, dist_comm]; exact hdist_va_x
  have hxve : dist x ve = radius := (mem_selectedClass.mp hve_mem).2
  have hdist_ve_x : dist ve x = d := by rw [dist_comm, hxve, hrad]
  have hw_filter : w ∈ A.filter (fun y => dist ve y = r) := by rw [hCeEq]; exact hw_mem
  have hrd : r = d := by rw [← hw_dist]; exact ((Finset.mem_filter.mp hw_filter).2).symm
  rw [← hCeEq, Finset.mem_filter]
  exact ⟨hxA, by rw [hrd]; exact hdist_ve_x⟩

/-- A non-Moser point cannot lie in caps `C₁` and `C₂` at once (`nonmoser_in_one`). -/
theorem two_caps_nonmoser_false_12
    {A : Finset ℝ²} (S : FiniteEndpointShell A) {x : ℝ²}
    (hxA : x ∈ A) (hxnon : x ∉ S.triangle.verts)
    (h1 : x ∈ S.CP.C1) (h2 : x ∈ S.CP.C2) : False := by
  have h := S.CP.nonmoser_in_one x hxA hxnon
  rw [if_pos h1, if_pos h2] at h; split at h <;> omega

/-- A non-Moser point cannot lie in caps `C₁` and `C₃` at once. -/
theorem two_caps_nonmoser_false_13
    {A : Finset ℝ²} (S : FiniteEndpointShell A) {x : ℝ²}
    (hxA : x ∈ A) (hxnon : x ∉ S.triangle.verts)
    (h1 : x ∈ S.CP.C1) (h3 : x ∈ S.CP.C3) : False := by
  have h := S.CP.nonmoser_in_one x hxA hxnon
  rw [if_pos h1, if_pos h3] at h; split at h <;> omega

/-- A non-Moser point cannot lie in caps `C₂` and `C₃` at once. -/
theorem two_caps_nonmoser_false_23
    {A : Finset ℝ²} (S : FiniteEndpointShell A) {x : ℝ²}
    (hxA : x ∈ A) (hxnon : x ∉ S.triangle.verts)
    (h2 : x ∈ S.CP.C2) (h3 : x ∈ S.CP.C3) : False := by
  have h := S.CP.nonmoser_in_one x hxA hxnon
  rw [if_pos h2, if_pos h3] at h; split at h <;> omega

/-- **Pair enumeration for the non-own branch.**  The non-own pair `{m₁, m₂}` of
Moser vertices `{va, vb, vc}` — distinct, and not the ordered own endpoints
`{vb, vc}` — must contain the apex `va`.  Each surviving (apex + endpoint) case is
discharged by the supplied apex/endpoint refuters. -/
theorem nonOwnPair_index_false
    {A : Finset ℝ²}
    {x va vb vc : ℝ²} {radius : ℝ}
    {m₁ m₂ : ℝ²}
    (hm₁ : m₁ = va ∨ m₁ = vb ∨ m₁ = vc) (hm₂ : m₂ = va ∨ m₂ = vb ∨ m₂ = vc)
    (hne : m₁ ≠ m₂)
    (hown : ¬((m₁ = vb ∧ m₂ = vc) ∨ (m₁ = vc ∧ m₂ = vb)))
    (hm₁mem : m₁ ∈ SelectedClass A x radius) (hm₂mem : m₂ ∈ SelectedClass A x radius)
    (hContraB : va ∈ SelectedClass A x radius → vb ∈ SelectedClass A x radius → False)
    (hContraC : va ∈ SelectedClass A x radius → vc ∈ SelectedClass A x radius → False) :
    False := by
  classical
  rcases hm₁ with rfl | rfl | rfl <;> rcases hm₂ with rfl | rfl | rfl <;>
    first
    | exact absurd rfl hne
    | exact hContraB hm₁mem hm₂mem
    | exact hContraB hm₂mem hm₁mem
    | exact hContraC hm₁mem hm₂mem
    | exact hContraC hm₂mem hm₁mem
    | exact hown (Or.inl ⟨rfl, rfl⟩)
    | exact hown (Or.inr ⟨rfl, rfl⟩)

/-- `N8b`: if a selected `4`-class at a non-Moser apex contains two Moser
vertices that are NOT the own endpoints of cap `i`, the configuration is
contradictory. Closes by the exact-cap-class characterization
(`mem_oppositeCap_of_selected`) plus the partition's "each non-Moser point
lies in exactly one cap" invariant — no endpoint-chord / bisector geometry.

The own-pair case is handled at the W10 seam (`N8kDistribution.lean`) where
the adjacent-arc producers are in scope; `hnotown` guarantees this theorem
is only called with non-own pairs (Option B restructure, 2026-06-13). -/
theorem N8b_endpoint_pair_split
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (hN4e : S.N4eCapContainment)
    {x : ℝ²} {i : Fin 3}
    (hx : N8SelectedApex S i x)
    (hMoser2 : N8MoserEndpointPair S i x hx.radius)
    (hnotown : ¬((hMoser2.m₁ = S.ownLeftEndpointByIndex i ∧
                  hMoser2.m₂ = S.ownRightEndpointByIndex i) ∨
                 (hMoser2.m₁ = S.ownRightEndpointByIndex i ∧
                  hMoser2.m₂ = S.ownLeftEndpointByIndex i))) :
    False := by
  classical
  obtain ⟨m₁, m₂, m₁_moser, m₂_moser, m₁_mem, m₂_mem, m₁_ne_m₂⟩ := hMoser2
  -- After `obtain`, m₁ = hMoser2.m₁ and m₂ = hMoser2.m₂ definitionally.
  -- `hnotown` can therefore be used directly as the non-own negation.
  have hown : ¬((m₁ = S.ownLeftEndpointByIndex i ∧ m₂ = S.ownRightEndpointByIndex i) ∨
               (m₁ = S.ownRightEndpointByIndex i ∧ m₂ = S.ownLeftEndpointByIndex i)) :=
    hnotown
  -- Non-own-pair: `{m₁, m₂} ≠ {ownLeft, ownRight}` (guaranteed by `hnotown`).
  -- The pair must contain the apex `vᵢ` of cap `i`.  The apex is at distance `d`
  -- from `x` (`n7_circle_placement`, `x ∈ Cᵢ`) and at distance `hx.radius` from
  -- `x` (`vᵢ ∈ SelectedClass`), so `hx.radius = d`.  The own endpoint `e` in the
  -- pair is then at distance `d` from `x` as well, so by the exact opposite-cap
  -- class (`mem_oppositeCap_of_selected`) `x` also lies in `e`'s opposite cap —
  -- a different cap from the one `x` already inhabits, contradicting the
  -- partition's "each non-Moser point lies in exactly one cap" invariant.
  classical
    -- `n7` common side length `d` and the three opposite-cap placements.
    obtain ⟨d, hdpos, hC1d, hC2d, hC3d⟩ := S.n7_circle_placement hN4e
    -- Exact opposite-cap classes (with radii `= d`, certified via a Moser endpoint).
    obtain ⟨r1, hr1, hC1eq⟩ := S.exact_cap_class_at_v1 hN4e
    obtain ⟨r2, hr2, hC2eq⟩ := S.exact_cap_class_at_v2 hN4e
    obtain ⟨r3, hr3, hC3eq⟩ := S.exact_cap_class_at_v3 hN4e
    -- The two Moser vertices, as a disjunction over `{v1, v2, v3}`.
    have hm₁v : m₁ = S.triangle.v1 ∨ m₁ = S.triangle.v2 ∨ m₁ = S.triangle.v3 := by
      simpa only [MoserTriangle.verts, Finset.mem_insert, Finset.mem_singleton]
        using m₁_moser
    have hm₂v : m₂ = S.triangle.v1 ∨ m₂ = S.triangle.v2 ∨ m₂ = S.triangle.v3 := by
      simpa only [MoserTriangle.verts, Finset.mem_insert, Finset.mem_singleton]
        using m₂_moser
    fin_cases i
    · -- i = 0: apex v1, own endpoints (v2, v3), cap interior I1 ⊆ C1.
      have hxI1 : x ∈ S.I1 := hx.cap_mem
      have hxC1 : x ∈ S.CP.C1 := Finset.mem_of_mem_erase (Finset.mem_of_mem_erase hxI1)
      have hxA : x ∈ A := S.CP.C1_subset hxC1
      have hxnon : x ∉ S.triangle.verts := by
        simp only [MoserTriangle.verts, Finset.mem_insert, Finset.mem_singleton]
        push_neg
        refine ⟨fun h => S.CP.v1_notin_C1 (h ▸ hxC1),
          (Finset.mem_erase.mp (Finset.mem_erase.mp hxI1).2).1,
          (Finset.mem_erase.mp hxI1).1⟩
      exact nonOwnPair_index_false (va := S.triangle.v1) (vb := S.triangle.v2)
        (vc := S.triangle.v3) hm₁v hm₂v m₁_ne_m₂ hown m₁_mem m₂_mem
        (fun hva hvb =>
          two_caps_nonmoser_false_12 S hxA hxnon hxC1
            (mem_oppositeCap_of_selected hxA (hC1d x hxC1) hva hvb hC2eq
              S.CP.v3_mem_C2 (hC2d _ S.CP.v3_mem_C2)))
        (fun hva hvc =>
          two_caps_nonmoser_false_13 S hxA hxnon hxC1
            (mem_oppositeCap_of_selected hxA (hC1d x hxC1) hva hvc hC3eq
              S.CP.v2_mem_C3 (hC3d _ S.CP.v2_mem_C3)))
    · -- i = 1: apex v2, own endpoints (v3, v1), cap interior I2 ⊆ C2.
      have hxI2 : x ∈ S.I2 := hx.cap_mem
      have hxC2 : x ∈ S.CP.C2 := Finset.mem_of_mem_erase (Finset.mem_of_mem_erase hxI2)
      have hxA : x ∈ A := S.CP.C2_subset hxC2
      have hxnon : x ∉ S.triangle.verts := by
        simp only [MoserTriangle.verts, Finset.mem_insert, Finset.mem_singleton]
        push_neg
        refine ⟨(Finset.mem_erase.mp hxI2).1,
          fun h => S.CP.v2_notin_C2 (h ▸ hxC2),
          (Finset.mem_erase.mp (Finset.mem_erase.mp hxI2).2).1⟩
      have hm₁v' : m₁ = S.triangle.v2 ∨ m₁ = S.triangle.v3 ∨ m₁ = S.triangle.v1 := by
        rcases hm₁v with h | h | h
        · exact Or.inr (Or.inr h)
        · exact Or.inl h
        · exact Or.inr (Or.inl h)
      have hm₂v' : m₂ = S.triangle.v2 ∨ m₂ = S.triangle.v3 ∨ m₂ = S.triangle.v1 := by
        rcases hm₂v with h | h | h
        · exact Or.inr (Or.inr h)
        · exact Or.inl h
        · exact Or.inr (Or.inl h)
      exact nonOwnPair_index_false (va := S.triangle.v2) (vb := S.triangle.v3)
        (vc := S.triangle.v1)
        hm₁v' hm₂v' m₁_ne_m₂ hown m₁_mem m₂_mem
        (fun hva hvb =>
          two_caps_nonmoser_false_23 S hxA hxnon hxC2
            (mem_oppositeCap_of_selected hxA (hC2d x hxC2) hva hvb hC3eq
              S.CP.v1_mem_C3 (hC3d _ S.CP.v1_mem_C3)))
        (fun hva hvc =>
          two_caps_nonmoser_false_12 S hxA hxnon
            (mem_oppositeCap_of_selected hxA (hC2d x hxC2) hva hvc hC1eq
              S.CP.v3_mem_C1 (hC1d _ S.CP.v3_mem_C1)) hxC2)
    · -- i = 2: apex v3, own endpoints (v1, v2), cap interior I3 ⊆ C3.
      have hxI3 : x ∈ S.I3 := hx.cap_mem
      have hxC3 : x ∈ S.CP.C3 := Finset.mem_of_mem_erase (Finset.mem_of_mem_erase hxI3)
      have hxA : x ∈ A := S.CP.C3_subset hxC3
      have hxnon : x ∉ S.triangle.verts := by
        simp only [MoserTriangle.verts, Finset.mem_insert, Finset.mem_singleton]
        push_neg
        refine ⟨(Finset.mem_erase.mp (Finset.mem_erase.mp hxI3).2).1,
          (Finset.mem_erase.mp hxI3).1,
          fun h => S.CP.v3_notin_C3 (h ▸ hxC3)⟩
      have hm₁v' : m₁ = S.triangle.v3 ∨ m₁ = S.triangle.v1 ∨ m₁ = S.triangle.v2 := by
        rcases hm₁v with h | h | h
        · exact Or.inr (Or.inl h)
        · exact Or.inr (Or.inr h)
        · exact Or.inl h
      have hm₂v' : m₂ = S.triangle.v3 ∨ m₂ = S.triangle.v1 ∨ m₂ = S.triangle.v2 := by
        rcases hm₂v with h | h | h
        · exact Or.inr (Or.inl h)
        · exact Or.inr (Or.inr h)
        · exact Or.inl h
      exact nonOwnPair_index_false (va := S.triangle.v3) (vb := S.triangle.v1)
        (vc := S.triangle.v2)
        hm₁v' hm₂v' m₁_ne_m₂ hown m₁_mem m₂_mem
        (fun hva hvb =>
          two_caps_nonmoser_false_13 S hxA hxnon
            (mem_oppositeCap_of_selected hxA (hC3d x hxC3) hva hvb hC1eq
              S.CP.v2_mem_C1 (hC1d _ S.CP.v2_mem_C1)) hxC3)
        (fun hva hvc =>
          two_caps_nonmoser_false_23 S hxA hxnon
            (mem_oppositeCap_of_selected hxA (hC3d x hxC3) hva hvc hC2eq
              S.CP.v1_mem_C2 (hC2d _ S.CP.v1_mem_C2)) hxC3)

/-- `N8e`: the own-mid adjacent-cap residual is impossible once the selected
class is required to hit one adjacent strict cap in two distinct points, because
W7's `N8a3_adjacent_one_hit` export bounds that intersection by `1`. -/
theorem N8e_own_mid_residual_false
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (hN4e : S.N4eCapContainment)
    {x : ℝ²} {i : Fin 3}
    (hres : EndpointOwnMidAdjacentResidual S i x) :
    False := by
  classical
  have hone := S.N8a3_adjacent_one_hit hN4e hres.adj
  rw [hres.adj_apex, hres.adj_radius, hres.adj_support] at hone
  rw [Finset.card_le_one] at hone
  exact hres.w₁_ne_w₂ (hone _ hres.w₁_mem _ hres.w₂_mem)

end FiniteEndpointShell

end Problem97
