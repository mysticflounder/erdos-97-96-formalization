import Erdos9796Proof.P97.N9Endpoint.Shell

/-!
# Section 3 endpoint `N6/N7` rigid-packet layer

This file starts the equilateral / Apollonius-rigidity lane from
`docs/97-full-prose-proof-draft.md`, Section 3.

The sanctioned proof route is:

* `N4e` exports cap containment for every Moser-apex `4`-class;
* together with the shell's unconditional `N5` packet, this upgrades each
  apex witness class to the exact opposite cap;
* from those exact cap classes, `N6` proves the Moser triangle equilateral;
* `N7` then packages the opposite-circle placement of all three caps at the
  common side length.

This file does **not** attempt the full operational 60-degree
`OpApolloniusArc` export yet.  It closes the exact rigid-packet shell needed
before the single-apex `N8` exhaustion can be wired.
-/

open scoped EuclideanGeometry
open Finset

namespace Problem97

namespace FiniteEndpointShell

/-- Lean-facing `N4e` interface: every `4`-class centered at a Moser vertex is
contained in the corresponding opposite cap.  This is the theorem-level export
 consumed downstream by `N6` and `N7`. -/
def N4eCapContainment {A : Finset ℝ²} (S : FiniteEndpointShell A) : Prop :=
  (∀ {r : ℝ}, 0 < r →
      4 ≤ (A.filter (fun x => dist S.triangle.v1 x = r)).card →
      A.filter (fun x => dist S.triangle.v1 x = r) ⊆ S.CP.C1) ∧
  (∀ {r : ℝ}, 0 < r →
      4 ≤ (A.filter (fun x => dist S.triangle.v2 x = r)).card →
      A.filter (fun x => dist S.triangle.v2 x = r) ⊆ S.CP.C2) ∧
  (∀ {r : ℝ}, 0 < r →
      4 ≤ (A.filter (fun x => dist S.triangle.v3 x = r)).card →
      A.filter (fun x => dist S.triangle.v3 x = r) ⊆ S.CP.C3)

/-- From `N4e` containment and the closed `(4,4,4)` packet, the `v₁` witness
class is exactly the first opposite cap. -/
theorem exact_cap_class_at_v1
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (hN4e : S.N4eCapContainment) :
    ∃ r : ℝ, 0 < r ∧
      A.filter (fun x => dist S.triangle.v1 x = r) = S.CP.C1 := by
  classical
  rcases S.k4_at_v1 with ⟨r, hr, hcard⟩
  let T : Finset ℝ² := A.filter (fun x => dist S.triangle.v1 x = r)
  have hTfour : 4 ≤ T.card := by
    simpa [T] using hcard
  have hsub : T ⊆ S.CP.C1 := hN4e.1 hr hTfour
  have hcap4 : S.CP.C1.card = 4 := (S.n5_forced_m44).1
  have hcle : S.CP.C1.card ≤ T.card := by
    omega
  refine ⟨r, hr, ?_⟩
  exact Finset.eq_of_subset_of_card_le hsub hcle

/-- From `N4e` containment and the closed `(4,4,4)` packet, the `v₂` witness
class is exactly the second opposite cap. -/
theorem exact_cap_class_at_v2
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (hN4e : S.N4eCapContainment) :
    ∃ r : ℝ, 0 < r ∧
      A.filter (fun x => dist S.triangle.v2 x = r) = S.CP.C2 := by
  classical
  rcases S.k4_at_v2 with ⟨r, hr, hcard⟩
  let T : Finset ℝ² := A.filter (fun x => dist S.triangle.v2 x = r)
  have hTfour : 4 ≤ T.card := by
    simpa [T] using hcard
  have hsub : T ⊆ S.CP.C2 := hN4e.2.1 hr hTfour
  have hcap4 : S.CP.C2.card = 4 := (S.n5_forced_m44).2.1
  have hcle : S.CP.C2.card ≤ T.card := by
    omega
  refine ⟨r, hr, ?_⟩
  exact Finset.eq_of_subset_of_card_le hsub hcle

/-- From `N4e` containment and the closed `(4,4,4)` packet, the `v₃` witness
class is exactly the third opposite cap. -/
theorem exact_cap_class_at_v3
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (hN4e : S.N4eCapContainment) :
    ∃ r : ℝ, 0 < r ∧
      A.filter (fun x => dist S.triangle.v3 x = r) = S.CP.C3 := by
  classical
  rcases S.k4_at_v3 with ⟨r, hr, hcard⟩
  let T : Finset ℝ² := A.filter (fun x => dist S.triangle.v3 x = r)
  have hTfour : 4 ≤ T.card := by
    simpa [T] using hcard
  have hsub : T ⊆ S.CP.C3 := hN4e.2.2 hr hTfour
  have hcap4 : S.CP.C3.card = 4 := (S.n5_forced_m44).2.2
  have hcle : S.CP.C3.card ≤ T.card := by
    omega
  refine ⟨r, hr, ?_⟩
  exact Finset.eq_of_subset_of_card_le hsub hcle

/-- `N6`: once the opposite caps are exact `4`-classes at the three Moser
vertices, the Moser triangle is equilateral. -/
theorem n6_equilateral_moser_triangle
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (hN4e : S.N4eCapContainment) :
    dist S.triangle.v1 S.triangle.v2 = dist S.triangle.v2 S.triangle.v3 ∧
      dist S.triangle.v2 S.triangle.v3 = dist S.triangle.v3 S.triangle.v1 := by
  classical
  rcases S.exact_cap_class_at_v1 hN4e with ⟨r1, -, hC1⟩
  rcases S.exact_cap_class_at_v2 hN4e with ⟨r2, -, hC2⟩
  have hv2C1 : S.triangle.v2 ∈ A.filter (fun x => dist S.triangle.v1 x = r1) := by
    rw [hC1]
    exact S.CP.v2_mem_C1
  have hv3C1 : S.triangle.v3 ∈ A.filter (fun x => dist S.triangle.v1 x = r1) := by
    rw [hC1]
    exact S.CP.v3_mem_C1
  have hv3C2 : S.triangle.v3 ∈ A.filter (fun x => dist S.triangle.v2 x = r2) := by
    rw [hC2]
    exact S.CP.v3_mem_C2
  have hv1C2 : S.triangle.v1 ∈ A.filter (fun x => dist S.triangle.v2 x = r2) := by
    rw [hC2]
    exact S.CP.v1_mem_C2
  have d12 : dist S.triangle.v1 S.triangle.v2 = r1 := (Finset.mem_filter.mp hv2C1).2
  have d13 : dist S.triangle.v1 S.triangle.v3 = r1 := (Finset.mem_filter.mp hv3C1).2
  have d23 : dist S.triangle.v2 S.triangle.v3 = r2 := (Finset.mem_filter.mp hv3C2).2
  have d21 : dist S.triangle.v2 S.triangle.v1 = r2 := (Finset.mem_filter.mp hv1C2).2
  have d12' : dist S.triangle.v1 S.triangle.v2 = r2 := by
    rw [dist_comm]
    exact d21
  refine ⟨?_, ?_⟩
  · calc
      dist S.triangle.v1 S.triangle.v2 = r1 := d12
      _ = dist S.triangle.v1 S.triangle.v2 := d12.symm
      _ = r2 := d12'
      _ = dist S.triangle.v2 S.triangle.v3 := d23.symm
  · calc
      dist S.triangle.v2 S.triangle.v3 = r2 := d23
      _ = dist S.triangle.v1 S.triangle.v2 := d12'.symm
      _ = r1 := d12
      _ = dist S.triangle.v3 S.triangle.v1 := by
        rw [dist_comm]
        exact d13.symm

/-- Circle-placement packet for `N7`: the three opposite caps lie on the three
circles centered at the corresponding Moser vertices, all at the common side
length `d`. -/
theorem n7_circle_placement
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (hN4e : S.N4eCapContainment) :
    ∃ d : ℝ, 0 < d ∧
      (∀ x ∈ S.CP.C1, dist S.triangle.v1 x = d) ∧
      (∀ x ∈ S.CP.C2, dist S.triangle.v2 x = d) ∧
      (∀ x ∈ S.CP.C3, dist S.triangle.v3 x = d) := by
  classical
  rcases S.exact_cap_class_at_v1 hN4e with ⟨r1, hr1, hC1⟩
  rcases S.exact_cap_class_at_v2 hN4e with ⟨r2, -, hC2⟩
  rcases S.exact_cap_class_at_v3 hN4e with ⟨r3, -, hC3⟩
  have hEq := S.n6_equilateral_moser_triangle hN4e
  have hv2C1 : S.triangle.v2 ∈ A.filter (fun x => dist S.triangle.v1 x = r1) := by
    rw [hC1]
    exact S.CP.v2_mem_C1
  have hv3C2 : S.triangle.v3 ∈ A.filter (fun x => dist S.triangle.v2 x = r2) := by
    rw [hC2]
    exact S.CP.v3_mem_C2
  have hv1C3 : S.triangle.v1 ∈ A.filter (fun x => dist S.triangle.v3 x = r3) := by
    rw [hC3]
    exact S.CP.v1_mem_C3
  have hr1d : r1 = dist S.triangle.v1 S.triangle.v2 := by
    symm
    exact (Finset.mem_filter.mp hv2C1).2
  have hr2d : r2 = dist S.triangle.v2 S.triangle.v3 := by
    symm
    exact (Finset.mem_filter.mp hv3C2).2
  have hr3d : r3 = dist S.triangle.v3 S.triangle.v1 := by
    symm
    exact (Finset.mem_filter.mp hv1C3).2
  let d : ℝ := dist S.triangle.v1 S.triangle.v2
  have hdpos : 0 < d := dist_pos.mpr S.triangle.v12_ne
  refine ⟨d, hdpos, ?_, ?_, ?_⟩
  · intro x hx
    have hxT : x ∈ A.filter (fun y => dist S.triangle.v1 y = r1) := by
      rw [hC1]
      exact hx
    have hxdist : dist S.triangle.v1 x = r1 := (Finset.mem_filter.mp hxT).2
    simpa [d, hr1d] using hxdist
  · intro x hx
    have hxT : x ∈ A.filter (fun y => dist S.triangle.v2 y = r2) := by
      rw [hC2]
      exact hx
    have hxdist : dist S.triangle.v2 x = r2 := (Finset.mem_filter.mp hxT).2
    calc
      dist S.triangle.v2 x = r2 := hxdist
      _ = dist S.triangle.v2 S.triangle.v3 := hr2d
      _ = dist S.triangle.v1 S.triangle.v2 := hEq.1.symm
      _ = d := by rfl
  · intro x hx
    have hxT : x ∈ A.filter (fun y => dist S.triangle.v3 y = r3) := by
      rw [hC3]
      exact hx
    have hxdist : dist S.triangle.v3 x = r3 := (Finset.mem_filter.mp hxT).2
    calc
      dist S.triangle.v3 x = r3 := hxdist
      _ = dist S.triangle.v3 S.triangle.v1 := hr3d
      _ = dist S.triangle.v2 S.triangle.v3 := hEq.2.symm
      _ = dist S.triangle.v1 S.triangle.v2 := hEq.1.symm
      _ = d := by rfl

end FiniteEndpointShell

end Problem97
