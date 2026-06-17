import Erdos9796Proof.P97.N9EndpointN67
import Erdos9796Proof.P97.U2OneHitRealization

/-!
# Section 3 N8a same-arc two-circle bound and N8a3 adjacent-cap one-hit

This file lands the W7 packet from
`docs/n-lane/specs/W7-n8a-arc-twocircle-spec.md`.

It does two things:

* proves the generic finite-circle kernel behind prose `N8a`: a selected
  same-radius class around a non-Moser apex meets a fixed cap arc in at most
  two points;
* packages the already-proved E3-L13 monotonicity machinery into the
  shell-facing `N8a3_adjacent_one_hit` export.

The rigid-packet shell vocabulary for "non-Moser apex", "selected 4-class at
that apex", and "adjacent cap chain" does not yet exist upstream, so W7 takes
the spec's default `{{NEEDS_ADAM_INPUT}}` route: this file defines a minimal N8
packet vocabulary at the top and uses it as the shared interface for W8/W9/W10.

All declarations are axiom-clean (`{propext, Classical.choice, Quot.sound}`).
-/

open scoped EuclideanGeometry
open EuclideanGeometry

namespace Problem97

/- ## N8 shared vocabulary

These are the default W7 packet shapes for the spec's `{{NEEDS_ADAM_INPUT}}`
slots.  They deliberately expose only the data consumed by the N8a/N8a3
geometry:

* an arc is a finite support known to lie on one ambient circle;
* an apex/arc packet adds the selected same-radius class at the apex and the
  distinct-circle hypothesis needed for the two-circle bound;
* an adjacent-arc packet adds an ordered chain covering that cap support and
  the strict radial monotonicity exported by the E3-L13 Route-A proof.
-/

/-- A finite cap-arc support together with its ambient circle.  This is the
minimal finite packet behind the prose phrase "the target arc is cap `i`". -/
structure N8ArcCircle where
  support : Finset ℝ²
  circleCenter : ℝ²
  circleRadius : ℝ
  on_circle : ∀ x ∈ support, dist circleCenter x = circleRadius

namespace N8ArcCircle

/-- Any support point of an `N8ArcCircle` lies on its ambient sphere. -/
theorem mem_sphere (P : N8ArcCircle) {x : ℝ²} (hx : x ∈ P.support) :
    x ∈ (⟨P.circleCenter, P.circleRadius⟩ : Sphere ℝ²) := by
  exact EuclideanGeometry.mem_sphere.mpr <| by
    calc
      dist x P.circleCenter = dist P.circleCenter x := dist_comm x P.circleCenter
      _ = P.circleRadius := P.on_circle x hx

end N8ArcCircle

/-- A non-Moser-apex / cap-arc packet for `N8a`: the selected class
`SelectedClass A apex selectedRadius` is intersected against a cap arc lying on
another circle.  The distinct-circle field is the spec's default Lean shape for
"`x` is a non-Moser apex; the target arc is cap `i`". -/
structure N8ApexArcWitness where
  apex : ℝ²
  selectedRadius : ℝ
  arc : N8ArcCircle
  circles_ne : (⟨apex, selectedRadius⟩ : Sphere ℝ²) ≠
    ⟨arc.circleCenter, arc.circleRadius⟩

/-- An adjacent-cap packet for `N8a3`: in addition to the apex/arc data, the
arc support is covered by an ordered side chain on which the distance from the
apex is strictly monotone.  This is the default Lean shape for the spec's
"cap `j` is adjacent to apex `x ∈ cap i`". -/
structure N8AdjacentArcWitness where
  base : N8ApexArcWitness
  m : ℕ
  chain : FiniteEndpoint.OrderedSideChain m
  chain_covers : base.arc.support ⊆ chain.support
  monotone : N8a3AdjacentCapDistanceStrict base.apex chain

namespace N8ApexArcWitness

/-- **N8a generic two-circle kernel.**  A selected same-radius class about the
apex meets the finite cap-arc support in at most two points.  This is the
finite-set packaging of "two distinct circles meet in at most two points". -/
theorem selectedClass_inter_card_le_two
    {A : Finset ℝ²} (W : N8ApexArcWitness) :
    ((SelectedClass A W.apex W.selectedRadius) ∩ W.arc.support).card ≤ 2 := by
  classical
  by_contra hle
  have h3 : 3 ≤ ((SelectedClass A W.apex W.selectedRadius) ∩ W.arc.support).card := by
    omega
  rcases Finset.exists_subset_card_eq
      (s := (SelectedClass A W.apex W.selectedRadius) ∩ W.arc.support) h3 with
    ⟨E, hEsubset, hEcard⟩
  rw [Finset.card_eq_three] at hEcard
  rcases hEcard with ⟨a, b, c, hab, hac, hbc, hEeq⟩
  have haE : a ∈ E := by simp [hEeq]
  have hbE : b ∈ E := by simp [hEeq]
  have hcE : c ∈ E := by simp [hEeq]
  have haSel : a ∈ SelectedClass A W.apex W.selectedRadius :=
    (Finset.mem_inter.mp (hEsubset haE)).1
  have hbSel : b ∈ SelectedClass A W.apex W.selectedRadius :=
    (Finset.mem_inter.mp (hEsubset hbE)).1
  have hcSel : c ∈ SelectedClass A W.apex W.selectedRadius :=
    (Finset.mem_inter.mp (hEsubset hcE)).1
  have haArc : a ∈ W.arc.support := (Finset.mem_inter.mp (hEsubset haE)).2
  have hbArc : b ∈ W.arc.support := (Finset.mem_inter.mp (hEsubset hbE)).2
  have hcArc : c ∈ W.arc.support := (Finset.mem_inter.mp (hEsubset hcE)).2
  have haApex : a ∈ (⟨W.apex, W.selectedRadius⟩ : Sphere ℝ²) := by
    rw [mem_sphere]
    exact dist_self_of_mem_selectedClass haSel
  have hbApex : b ∈ (⟨W.apex, W.selectedRadius⟩ : Sphere ℝ²) := by
    rw [mem_sphere]
    exact dist_self_of_mem_selectedClass hbSel
  have hcApex : c ∈ (⟨W.apex, W.selectedRadius⟩ : Sphere ℝ²) := by
    rw [mem_sphere]
    exact dist_self_of_mem_selectedClass hcSel
  have haCircle : a ∈ (⟨W.arc.circleCenter, W.arc.circleRadius⟩ : Sphere ℝ²) :=
    W.arc.mem_sphere haArc
  have hbCircle : b ∈ (⟨W.arc.circleCenter, W.arc.circleRadius⟩ : Sphere ℝ²) :=
    W.arc.mem_sphere hbArc
  have hcCircle : c ∈ (⟨W.arc.circleCenter, W.arc.circleRadius⟩ : Sphere ℝ²) :=
    W.arc.mem_sphere hcArc
  rcases two_circle_common_point_eq_endpoint W.circles_ne hab
      haApex hbApex haCircle hbCircle hcApex hcCircle with hca | hcb
  · exact hac hca.symm
  · exact hbc hcb.symm

end N8ApexArcWitness

namespace N8AdjacentArcWitness

/-- **N8a3 generic one-hit kernel.**  If the cap support is carried by an
ordered chain on which the apex-distance is strictly monotone, then the
selected same-radius class about the apex meets that cap in at most one point. -/
theorem selectedClass_inter_card_le_one
    {A : Finset ℝ²} (W : N8AdjacentArcWitness) :
    ((SelectedClass A W.base.apex W.base.selectedRadius) ∩ W.base.arc.support).card ≤ 1 := by
  apply FiniteEndpoint.OrderedSideChain.card_le_one_of_subset_sameRadius
      W.base.apex W.chain W.monotone W.base.selectedRadius
  · intro x hx
    exact W.chain_covers (Finset.mem_of_mem_inter_right hx)
  · intro x hx
    exact (mem_selectedClass.mp (Finset.mem_of_mem_inter_left hx)).2

end N8AdjacentArcWitness

namespace FiniteEndpointShell

/-- **N8a shell export** (W7 default packet shape; `{{NEEDS_ADAM_INPUT}}`).
For a rigid shell `S`, a selected same-radius class at a non-Moser apex meets a
cap arc in at most two points, provided the caller supplies that data as an
`N8ApexArcWitness`.

The current theorem keeps the shell arguments explicit, as required by the N8
lane interface, but the actual rigid-packet producers are still to be wired in a
later N8 shell pass. -/
theorem N8a_two_intersection_bound
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (_hN4e : S.N4eCapContainment)
    (harc : N8ApexArcWitness) :
    ((SelectedClass A harc.apex harc.selectedRadius) ∩ harc.arc.support).card ≤ 2 := by
  exact harc.selectedClass_inter_card_le_two

/-- **N8a3 shell export** (W7 default packet shape; `{{NEEDS_ADAM_INPUT}}`).
For an adjacent cap encoded by an `N8AdjacentArcWitness`, the selected
same-radius class at the apex hits that cap in at most one point. -/
theorem N8a3_adjacent_one_hit
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (_hN4e : S.N4eCapContainment)
    (hadj : N8AdjacentArcWitness) :
    ((SelectedClass A hadj.base.apex hadj.base.selectedRadius) ∩
      hadj.base.arc.support).card ≤ 1 := by
  exact hadj.selectedClass_inter_card_le_one

end FiniteEndpointShell

end Problem97
