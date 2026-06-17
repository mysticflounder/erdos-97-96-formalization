import Erdos9796Proof.P97.N9EndpointN67
import Erdos9796Proof.P97.CircumcenterSide
import Erdos9796Proof.P97.N4dTrackBPilotSupport

/-!
# Section 3 endpoint `N4e` containment shell

This file formalizes the theorem-facing `N4c -> N4d -> N4e` packaging pinned
in `docs/97-full-prose-proof-draft.md`.

It does **not** prove the escaped-form trichotomy or the geometric exclusions.
Instead it records their exact Lean consumer shape and proves the sanctioned
assembly:

* `N4c` classifies any escaped Moser-apex `4`-class into Form `a`, `b`, or `c`;
* `N4d` rules out each of those forms;
* therefore every Moser-apex `4`-class is contained in the opposite cap.

This is the first honest Lean step on `N4e`: theorem-level scaffolding only,
with no new geometry.
-/

open scoped EuclideanGeometry
open Finset

namespace Problem97

namespace FiniteEndpointShell

/-- The three escaped forms from the Section 3 `N4c` classification. -/
inductive EscapedForm where
  | a
  | b
  | c
  deriving DecidableEq, Repr

/-- The zero-defect `(4,4,4)` interior-point naming packet used by `N4c/N4d`.
It records the two interior vertices of each opposite cap. -/
structure ZeroDefectCapLayout {A : Finset ℝ²} (S : FiniteEndpointShell A) where
  a1 : ℝ²
  b1 : ℝ²
  a2 : ℝ²
  b2 : ℝ²
  a3 : ℝ²
  b3 : ℝ²
  hI1 : S.I1 = ({a1, b1} : Finset ℝ²)
  hI2 : S.I2 = ({a2, b2} : Finset ℝ²)
  hI3 : S.I3 = ({a3, b3} : Finset ℝ²)

/-- In the exact `(4,4,4)` shell, each opposite-cap interior has cardinality
`2`. -/
theorem I1_card_eq_two
    {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    S.I1.card = 2 := by
  have hI1 : S.I1.card + 2 = S.CP.C1.card := S.I1_card
  have hC1 : S.CP.C1.card = 4 := (S.n5_forced_m44).1
  omega

/-- In the exact `(4,4,4)` shell, each opposite-cap interior has cardinality
`2`. -/
theorem I2_card_eq_two
    {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    S.I2.card = 2 := by
  have hI2 : S.I2.card + 2 = S.CP.C2.card := S.I2_card
  have hC2 : S.CP.C2.card = 4 := (S.n5_forced_m44).2.1
  omega

/-- In the exact `(4,4,4)` shell, each opposite-cap interior has cardinality
`2`. -/
theorem I3_card_eq_two
    {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    S.I3.card = 2 := by
  have hI3 : S.I3.card + 2 = S.CP.C3.card := S.I3_card
  have hC3 : S.CP.C3.card = 4 := (S.n5_forced_m44).2.2
  omega

/-- The exact `(4,4,4)` shell admits the named interior-point packet used in
the Section 3 `N4c/N4d` prose. -/
noncomputable def zeroDefectCapLayout
    {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    ZeroDefectCapLayout (S := S) := by
  classical
  have hI1 : ∃ x y : ℝ², x ≠ y ∧ S.I1 = ({x, y} : Finset ℝ²) := by
    simpa [Finset.card_eq_two] using S.I1_card_eq_two
  have hI2 : ∃ x y : ℝ², x ≠ y ∧ S.I2 = ({x, y} : Finset ℝ²) := by
    simpa [Finset.card_eq_two] using S.I2_card_eq_two
  have hI3 : ∃ x y : ℝ², x ≠ y ∧ S.I3 = ({x, y} : Finset ℝ²) := by
    simpa [Finset.card_eq_two] using S.I3_card_eq_two
  choose a1 b1 hab1 hI1eq using hI1
  choose a2 b2 hab2 hI2eq using hI2
  choose a3 b3 hab3 hI3eq using hI3
  exact ⟨a1, b1, a2, b2, a3, b3, hI1eq, hI2eq, hI3eq⟩

/-- The `v₁` witness class at radius `r`. -/
@[reducible] noncomputable def witnessClassAt_v1 {A : Finset ℝ²}
    (S : FiniteEndpointShell A) (r : ℝ) : Finset ℝ² :=
  A.filter (fun x => dist S.triangle.v1 x = r)

/-- The `v₂` witness class at radius `r`. -/
@[reducible] noncomputable def witnessClassAt_v2 {A : Finset ℝ²}
    (S : FiniteEndpointShell A) (r : ℝ) : Finset ℝ² :=
  A.filter (fun x => dist S.triangle.v2 x = r)

/-- The `v₃` witness class at radius `r`. -/
@[reducible] noncomputable def witnessClassAt_v3 {A : Finset ℝ²}
    (S : FiniteEndpointShell A) (r : ℝ) : Finset ℝ² :=
  A.filter (fun x => dist S.triangle.v3 x = r)

private theorem witnessClassAt_v1_sideBounds
    {A : Finset ℝ²} (S : FiniteEndpointShell A) {r : ℝ} :
    ((S.witnessClassAt_v1 r) ∩ S.CP.C2).card ≤ 1
      ∧ ((S.witnessClassAt_v1 r) ∩ S.CP.C3).card ≤ 1 := by
  classical
  constructor
  · apply Problem97.FiniteEndpoint.one_hit_sameRadius_at_v3_of_supportCap
      (A := A) (C := S.CP.C2) (M := S.triangle2)
      S.hconv S.hnoncol S.CP.C2_subset
      (fun x hxA => (S.CP.arc_membership x hxA).2.1)
      S.CP.v3_mem_C2 S.CP.v1_mem_C2 S.packet2 S.packet2.inner_at_v1
      (S := (S.witnessClassAt_v1 r) ∩ S.CP.C2) (r := r)
    · exact Finset.inter_subset_right
    · intro x hx
      exact (Finset.mem_filter.mp (Finset.mem_of_mem_inter_left hx)).2
  · apply Problem97.FiniteEndpoint.one_hit_sameRadius_at_v2_of_supportCap
      (A := A) (C := S.CP.C3) (M := S.triangle3)
      S.hconv S.hnoncol S.CP.C3_subset
      (fun x hxA => (S.CP.arc_membership x hxA).2.2)
      S.CP.v1_mem_C3 S.CP.v2_mem_C3 S.packet3 S.packet3.inner_at_v1
      (S := (S.witnessClassAt_v1 r) ∩ S.CP.C3) (r := r)
    · exact Finset.inter_subset_right
    · intro x hx
      exact (Finset.mem_filter.mp (Finset.mem_of_mem_inter_left hx)).2

private theorem witnessClassAt_v2_sideBounds
    {A : Finset ℝ²} (S : FiniteEndpointShell A) {r : ℝ} :
    ((S.witnessClassAt_v2 r) ∩ S.CP.C1).card ≤ 1
      ∧ ((S.witnessClassAt_v2 r) ∩ S.CP.C3).card ≤ 1 := by
  classical
  constructor
  · apply Problem97.FiniteEndpoint.one_hit_sameRadius_at_v2_of_supportCap
      (A := A) (C := S.CP.C1) (M := S.triangle)
      S.hconv S.hnoncol S.CP.C1_subset
      (fun x hxA => (S.CP.arc_membership x hxA).1)
      S.CP.v2_mem_C1 S.CP.v3_mem_C1 S.Packet S.Packet.inner_at_v1
      (S := (S.witnessClassAt_v2 r) ∩ S.CP.C1) (r := r)
    · exact Finset.inter_subset_right
    · intro x hx
      exact (Finset.mem_filter.mp (Finset.mem_of_mem_inter_left hx)).2
  · apply Problem97.FiniteEndpoint.one_hit_sameRadius_at_v3_of_supportCap
      (A := A) (C := S.CP.C3) (M := S.triangle3)
      S.hconv S.hnoncol S.CP.C3_subset
      (fun x hxA => (S.CP.arc_membership x hxA).2.2)
      S.CP.v1_mem_C3 S.CP.v2_mem_C3 S.packet3 S.packet3.inner_at_v1
      (S := (S.witnessClassAt_v2 r) ∩ S.CP.C3) (r := r)
    · exact Finset.inter_subset_right
    · intro x hx
      exact (Finset.mem_filter.mp (Finset.mem_of_mem_inter_left hx)).2

private theorem witnessClassAt_v3_sideBounds
    {A : Finset ℝ²} (S : FiniteEndpointShell A) {r : ℝ} :
    ((S.witnessClassAt_v3 r) ∩ S.CP.C1).card ≤ 1
      ∧ ((S.witnessClassAt_v3 r) ∩ S.CP.C2).card ≤ 1 := by
  classical
  constructor
  · apply Problem97.FiniteEndpoint.one_hit_sameRadius_at_v3_of_supportCap
      (A := A) (C := S.CP.C1) (M := S.triangle)
      S.hconv S.hnoncol S.CP.C1_subset
      (fun x hxA => (S.CP.arc_membership x hxA).1)
      S.CP.v2_mem_C1 S.CP.v3_mem_C1 S.Packet S.Packet.inner_at_v1
      (S := (S.witnessClassAt_v3 r) ∩ S.CP.C1) (r := r)
    · exact Finset.inter_subset_right
    · intro x hx
      exact (Finset.mem_filter.mp (Finset.mem_of_mem_inter_left hx)).2
  · apply Problem97.FiniteEndpoint.one_hit_sameRadius_at_v2_of_supportCap
      (A := A) (C := S.CP.C2) (M := S.triangle2)
      S.hconv S.hnoncol S.CP.C2_subset
      (fun x hxA => (S.CP.arc_membership x hxA).2.1)
      S.CP.v3_mem_C2 S.CP.v1_mem_C2 S.packet2 S.packet2.inner_at_v1
      (S := (S.witnessClassAt_v3 r) ∩ S.CP.C2) (r := r)
    · exact Finset.inter_subset_right
    · intro x hx
      exact (Finset.mem_filter.mp (Finset.mem_of_mem_inter_left hx)).2

/-- Section 3 MEC-apex core selector at `v₁`: any same-radius class with at
least four vertices has exactly four vertices, contains the two interior
vertices of the opposite cap, and hits each adjacent side cap at most once. -/
theorem coreSelector_v1
    {A : Finset ℝ²} (S : FiniteEndpointShell A) {r : ℝ}
    (hr : 0 < r) (hcard : 4 ≤ (S.witnessClassAt_v1 r).card) :
    (S.witnessClassAt_v1 r).card = 4 ∧
      S.I1 ⊆ S.witnessClassAt_v1 r ∧
      ((S.witnessClassAt_v1 r) ∩ S.CP.C2).card ≤ 1 ∧
      ((S.witnessClassAt_v1 r) ∩ S.CP.C3).card ≤ 1 := by
  classical
  let T : Finset ℝ² := S.witnessClassAt_v1 r
  have hside := S.witnessClassAt_v1_sideBounds (r := r)
  rcases hside with ⟨hC2_one, hC3_one⟩
  have hcardT : 4 ≤ T.card := by simpa [T] using hcard
  have hC2_oneT : (T ∩ S.CP.C2).card ≤ 1 := by simpa [T] using hC2_one
  have hC3_oneT : (T ∩ S.CP.C3).card ≤ 1 := by simpa [T] using hC3_one
  have hv1_not_mem_T : S.triangle.v1 ∉ T := by
    intro hv1T
    have hv1eq : dist S.triangle.v1 S.triangle.v1 = r := (Finset.mem_filter.mp hv1T).2
    have h0r : (0 : ℝ) = r := by simpa using hv1eq
    nlinarith
  have hcover :
      T \ S.I1 ⊆ (T ∩ S.CP.C2) ∪ (T ∩ S.CP.C3) := by
    intro x hx
    rcases Finset.mem_sdiff.mp hx with ⟨hxT, hxnotI1⟩
    have hxA : x ∈ A := (Finset.mem_filter.mp hxT).1
    by_cases hxv3 : x = S.triangle.v3
    · apply Finset.mem_union_left
      exact Finset.mem_inter.mpr ⟨hxT, by simpa [hxv3] using S.CP.v3_mem_C2⟩
    by_cases hxv2 : x = S.triangle.v2
    · apply Finset.mem_union_right
      exact Finset.mem_inter.mpr ⟨hxT, by simpa [hxv2] using S.CP.v2_mem_C3⟩
    by_cases hxv1 : x = S.triangle.v1
    · exact False.elim (hv1_not_mem_T (hxv1 ▸ hxT))
    have hxnonmoser : x ∉ S.triangle.verts := by
      simp [Problem97.MoserTriangle.verts, hxv1, hxv2, hxv3]
    have hxnotC1 : x ∉ S.CP.C1 := by
      intro hxC1
      have hxI1 : x ∈ S.I1 := by
        unfold I1
        exact Finset.mem_erase.mpr ⟨hxv3, Finset.mem_erase.mpr ⟨hxv2, hxC1⟩⟩
      exact hxnotI1 hxI1
    have hone := S.CP.nonmoser_in_one x hxA hxnonmoser
    by_cases hxC2 : x ∈ S.CP.C2
    · apply Finset.mem_union_left
      exact Finset.mem_inter.mpr ⟨hxT, hxC2⟩
    · have hxC3 : x ∈ S.CP.C3 := by
        by_cases hxC3 : x ∈ S.CP.C3
        · exact hxC3
        · have : (0 : ℕ) = 1 := by
            simpa [hxnotC1, hxC2, hxC3] using hone
          omega
      apply Finset.mem_union_right
      exact Finset.mem_inter.mpr ⟨hxT, hxC3⟩
  have houtside_le :
      (T \ S.I1).card ≤ 2 := by
    calc
      (T \ S.I1).card ≤ ((T ∩ S.CP.C2) ∪ (T ∩ S.CP.C3)).card := Finset.card_le_card hcover
      _ ≤ (T ∩ S.CP.C2).card + (T ∩ S.CP.C3).card := Finset.card_union_le _ _
      _ ≤ 1 + 1 := by omega
      _ = 2 := by norm_num
  have hsplit : (T \ S.I1).card + (T ∩ S.I1).card = T.card := by
    simpa [T, Finset.inter_comm] using Finset.card_sdiff_add_card_inter T S.I1
  have hinter_le : (T ∩ S.I1).card ≤ S.I1.card := Finset.card_le_card Finset.inter_subset_right
  have hI1_two : S.I1.card = 2 := S.I1_card_eq_two
  have hT_le_four : T.card ≤ 4 := by
    omega
  have hT_eq_four : T.card = 4 := by
    omega
  have hinter_ge : S.I1.card ≤ (T ∩ S.I1).card := by
    omega
  have hI1eq : T ∩ S.I1 = S.I1 := Finset.eq_of_subset_of_card_le Finset.inter_subset_right hinter_ge
  have hI1sub : S.I1 ⊆ T := by
    intro x hx
    have : x ∈ T ∩ S.I1 := by simpa [hI1eq] using hx
    exact Finset.mem_of_mem_inter_left this
  exact ⟨hT_eq_four, hI1sub, hC2_oneT, hC3_oneT⟩

/-- Section 3 MEC-apex core selector at `v₂`. -/
theorem coreSelector_v2
    {A : Finset ℝ²} (S : FiniteEndpointShell A) {r : ℝ}
    (hr : 0 < r) (hcard : 4 ≤ (S.witnessClassAt_v2 r).card) :
    (S.witnessClassAt_v2 r).card = 4 ∧
      S.I2 ⊆ S.witnessClassAt_v2 r ∧
      ((S.witnessClassAt_v2 r) ∩ S.CP.C1).card ≤ 1 ∧
      ((S.witnessClassAt_v2 r) ∩ S.CP.C3).card ≤ 1 := by
  classical
  let T : Finset ℝ² := S.witnessClassAt_v2 r
  have hside := S.witnessClassAt_v2_sideBounds (r := r)
  rcases hside with ⟨hC1_one, hC3_one⟩
  have hcardT : 4 ≤ T.card := by simpa [T] using hcard
  have hC1_oneT : (T ∩ S.CP.C1).card ≤ 1 := by simpa [T] using hC1_one
  have hC3_oneT : (T ∩ S.CP.C3).card ≤ 1 := by simpa [T] using hC3_one
  have hv2_not_mem_T : S.triangle.v2 ∉ T := by
    intro hv2T
    have hv2eq : dist S.triangle.v2 S.triangle.v2 = r := (Finset.mem_filter.mp hv2T).2
    have h0r : (0 : ℝ) = r := by simpa using hv2eq
    nlinarith
  have hcover :
      T \ S.I2 ⊆ (T ∩ S.CP.C1) ∪ (T ∩ S.CP.C3) := by
    intro x hx
    rcases Finset.mem_sdiff.mp hx with ⟨hxT, hxnotI2⟩
    have hxA : x ∈ A := (Finset.mem_filter.mp hxT).1
    by_cases hxv1 : x = S.triangle.v1
    · apply Finset.mem_union_right
      exact Finset.mem_inter.mpr ⟨hxT, by simpa [hxv1] using S.CP.v1_mem_C3⟩
    by_cases hxv3 : x = S.triangle.v3
    · apply Finset.mem_union_left
      exact Finset.mem_inter.mpr ⟨hxT, by simpa [hxv3] using S.CP.v3_mem_C1⟩
    by_cases hxv2 : x = S.triangle.v2
    · exact False.elim (hv2_not_mem_T (hxv2 ▸ hxT))
    have hxnonmoser : x ∉ S.triangle.verts := by
      simp [Problem97.MoserTriangle.verts, hxv1, hxv2, hxv3]
    have hxnotC2 : x ∉ S.CP.C2 := by
      intro hxC2
      have hxI2 : x ∈ S.I2 := by
        unfold I2
        exact Finset.mem_erase.mpr ⟨hxv1, Finset.mem_erase.mpr ⟨hxv3, hxC2⟩⟩
      exact hxnotI2 hxI2
    have hone := S.CP.nonmoser_in_one x hxA hxnonmoser
    by_cases hxC1 : x ∈ S.CP.C1
    · apply Finset.mem_union_left
      exact Finset.mem_inter.mpr ⟨hxT, hxC1⟩
    · have hxC3 : x ∈ S.CP.C3 := by
        by_cases hxC3 : x ∈ S.CP.C3
        · exact hxC3
        · have : (0 : ℕ) = 1 := by
            simpa [hxC1, hxnotC2, hxC3] using hone
          omega
      apply Finset.mem_union_right
      exact Finset.mem_inter.mpr ⟨hxT, hxC3⟩
  have houtside_le :
      (T \ S.I2).card ≤ 2 := by
    calc
      (T \ S.I2).card ≤ ((T ∩ S.CP.C1) ∪ (T ∩ S.CP.C3)).card := Finset.card_le_card hcover
      _ ≤ (T ∩ S.CP.C1).card + (T ∩ S.CP.C3).card := Finset.card_union_le _ _
      _ ≤ 1 + 1 := by omega
      _ = 2 := by norm_num
  have hsplit : (T \ S.I2).card + (T ∩ S.I2).card = T.card := by
    simpa [T, Finset.inter_comm] using Finset.card_sdiff_add_card_inter T S.I2
  have hinter_le : (T ∩ S.I2).card ≤ S.I2.card := Finset.card_le_card Finset.inter_subset_right
  have hI2_two : S.I2.card = 2 := S.I2_card_eq_two
  have hT_eq_four : T.card = 4 := by
    omega
  have hinter_ge : S.I2.card ≤ (T ∩ S.I2).card := by
    omega
  have hI2eq : T ∩ S.I2 = S.I2 := Finset.eq_of_subset_of_card_le Finset.inter_subset_right hinter_ge
  have hI2sub : S.I2 ⊆ T := by
    intro x hx
    have : x ∈ T ∩ S.I2 := by simpa [hI2eq] using hx
    exact Finset.mem_of_mem_inter_left this
  exact ⟨hT_eq_four, hI2sub, hC1_oneT, hC3_oneT⟩

/-- Section 3 MEC-apex core selector at `v₃`. -/
theorem coreSelector_v3
    {A : Finset ℝ²} (S : FiniteEndpointShell A) {r : ℝ}
    (hr : 0 < r) (hcard : 4 ≤ (S.witnessClassAt_v3 r).card) :
    (S.witnessClassAt_v3 r).card = 4 ∧
      S.I3 ⊆ S.witnessClassAt_v3 r ∧
      ((S.witnessClassAt_v3 r) ∩ S.CP.C1).card ≤ 1 ∧
      ((S.witnessClassAt_v3 r) ∩ S.CP.C2).card ≤ 1 := by
  classical
  let T : Finset ℝ² := S.witnessClassAt_v3 r
  have hside := S.witnessClassAt_v3_sideBounds (r := r)
  rcases hside with ⟨hC1_one, hC2_one⟩
  have hcardT : 4 ≤ T.card := by simpa [T] using hcard
  have hC1_oneT : (T ∩ S.CP.C1).card ≤ 1 := by simpa [T] using hC1_one
  have hC2_oneT : (T ∩ S.CP.C2).card ≤ 1 := by simpa [T] using hC2_one
  have hv3_not_mem_T : S.triangle.v3 ∉ T := by
    intro hv3T
    have hv3eq : dist S.triangle.v3 S.triangle.v3 = r := (Finset.mem_filter.mp hv3T).2
    have h0r : (0 : ℝ) = r := by simpa using hv3eq
    nlinarith
  have hcover :
      T \ S.I3 ⊆ (T ∩ S.CP.C1) ∪ (T ∩ S.CP.C2) := by
    intro x hx
    rcases Finset.mem_sdiff.mp hx with ⟨hxT, hxnotI3⟩
    have hxA : x ∈ A := (Finset.mem_filter.mp hxT).1
    by_cases hxv2 : x = S.triangle.v2
    · apply Finset.mem_union_left
      exact Finset.mem_inter.mpr ⟨hxT, by simpa [hxv2] using S.CP.v2_mem_C1⟩
    by_cases hxv1 : x = S.triangle.v1
    · apply Finset.mem_union_right
      exact Finset.mem_inter.mpr ⟨hxT, by simpa [hxv1] using S.CP.v1_mem_C2⟩
    by_cases hxv3 : x = S.triangle.v3
    · exact False.elim (hv3_not_mem_T (hxv3 ▸ hxT))
    have hxnonmoser : x ∉ S.triangle.verts := by
      simp [Problem97.MoserTriangle.verts, hxv1, hxv2, hxv3]
    have hxnotC3 : x ∉ S.CP.C3 := by
      intro hxC3
      have hxI3 : x ∈ S.I3 := by
        unfold I3
        exact Finset.mem_erase.mpr ⟨hxv2, Finset.mem_erase.mpr ⟨hxv1, hxC3⟩⟩
      exact hxnotI3 hxI3
    have hone := S.CP.nonmoser_in_one x hxA hxnonmoser
    by_cases hxC1 : x ∈ S.CP.C1
    · apply Finset.mem_union_left
      exact Finset.mem_inter.mpr ⟨hxT, hxC1⟩
    · have hxC2 : x ∈ S.CP.C2 := by
        by_cases hxC2 : x ∈ S.CP.C2
        · exact hxC2
        · have : (0 : ℕ) = 1 := by
            simpa [hxC1, hxC2, hxnotC3] using hone
          omega
      apply Finset.mem_union_right
      exact Finset.mem_inter.mpr ⟨hxT, hxC2⟩
  have houtside_le :
      (T \ S.I3).card ≤ 2 := by
    calc
      (T \ S.I3).card ≤ ((T ∩ S.CP.C1) ∪ (T ∩ S.CP.C2)).card := Finset.card_le_card hcover
      _ ≤ (T ∩ S.CP.C1).card + (T ∩ S.CP.C2).card := Finset.card_union_le _ _
      _ ≤ 1 + 1 := by omega
      _ = 2 := by norm_num
  have hsplit : (T \ S.I3).card + (T ∩ S.I3).card = T.card := by
    simpa [T, Finset.inter_comm] using Finset.card_sdiff_add_card_inter T S.I3
  have hinter_le : (T ∩ S.I3).card ≤ S.I3.card := Finset.card_le_card Finset.inter_subset_right
  have hI3_two : S.I3.card = 2 := S.I3_card_eq_two
  have hT_eq_four : T.card = 4 := by
    omega
  have hinter_ge : S.I3.card ≤ (T ∩ S.I3).card := by
    omega
  have hI3eq : T ∩ S.I3 = S.I3 := Finset.eq_of_subset_of_card_le Finset.inter_subset_right hinter_ge
  have hI3sub : S.I3 ⊆ T := by
    intro x hx
    have : x ∈ T ∩ S.I3 := by simpa [hI3eq] using hx
    exact Finset.mem_of_mem_inter_left this
  exact ⟨hT_eq_four, hI3sub, hC1_oneT, hC2_oneT⟩

/-- `N4c` Form `a` at `v₁`: the escaped `4`-class uses one interior point from
each side chain. -/
def IsFormA_v1 {A : Finset ℝ²} (S : FiniteEndpointShell A) (r : ℝ) : Prop :=
  ∃ x y : ℝ²,
    x ∈ S.I2 ∧
    y ∈ S.I3 ∧
    (S.witnessClassAt_v1 r ∩ S.CP.C2 = ({x} : Finset ℝ²)) ∧
    (S.witnessClassAt_v1 r ∩ S.CP.C3 = ({y} : Finset ℝ²))

/-- `N4c` Form `b` at `v₁`: the escaped `4`-class uses `v₂` and one interior
point from the `C₂` side chain. -/
def IsFormB_v1 {A : Finset ℝ²} (S : FiniteEndpointShell A) (r : ℝ) : Prop :=
  ∃ x : ℝ²,
    x ∈ S.I2 ∧
    (S.witnessClassAt_v1 r ∩ S.CP.C2 = ({x} : Finset ℝ²)) ∧
    (S.witnessClassAt_v1 r ∩ S.CP.C3 = ({S.triangle.v2} : Finset ℝ²))

/-- `N4c` Form `c` at `v₁`: the escaped `4`-class uses `v₃` and one interior
point from the `C₃` side chain. -/
def IsFormC_v1 {A : Finset ℝ²} (S : FiniteEndpointShell A) (r : ℝ) : Prop :=
  ∃ y : ℝ²,
    y ∈ S.I3 ∧
    (S.witnessClassAt_v1 r ∩ S.CP.C2 = ({S.triangle.v3} : Finset ℝ²)) ∧
    (S.witnessClassAt_v1 r ∩ S.CP.C3 = ({y} : Finset ℝ²))

/-- `N4c` Form `a` at `v₂`: the escaped `4`-class uses one interior point from
each side chain. -/
def IsFormA_v2 {A : Finset ℝ²} (S : FiniteEndpointShell A) (r : ℝ) : Prop :=
  ∃ x y : ℝ²,
    x ∈ S.I3 ∧
    y ∈ S.I1 ∧
    (S.witnessClassAt_v2 r ∩ S.CP.C3 = ({x} : Finset ℝ²)) ∧
    (S.witnessClassAt_v2 r ∩ S.CP.C1 = ({y} : Finset ℝ²))

/-- `N4c` Form `b` at `v₂`: the escaped `4`-class uses `v₃` and one interior
point from the `C₃` side chain. -/
def IsFormB_v2 {A : Finset ℝ²} (S : FiniteEndpointShell A) (r : ℝ) : Prop :=
  ∃ x : ℝ²,
    x ∈ S.I3 ∧
    (S.witnessClassAt_v2 r ∩ S.CP.C3 = ({x} : Finset ℝ²)) ∧
    (S.witnessClassAt_v2 r ∩ S.CP.C1 = ({S.triangle.v3} : Finset ℝ²))

/-- `N4c` Form `c` at `v₂`: the escaped `4`-class uses `v₁` and one interior
point from the `C₁` side chain. -/
def IsFormC_v2 {A : Finset ℝ²} (S : FiniteEndpointShell A) (r : ℝ) : Prop :=
  ∃ y : ℝ²,
    y ∈ S.I1 ∧
    (S.witnessClassAt_v2 r ∩ S.CP.C3 = ({S.triangle.v1} : Finset ℝ²)) ∧
    (S.witnessClassAt_v2 r ∩ S.CP.C1 = ({y} : Finset ℝ²))

/-- `N4c` Form `a` at `v₃`: the escaped `4`-class uses one interior point from
each side chain. -/
def IsFormA_v3 {A : Finset ℝ²} (S : FiniteEndpointShell A) (r : ℝ) : Prop :=
  ∃ x y : ℝ²,
    x ∈ S.I1 ∧
    y ∈ S.I2 ∧
    (S.witnessClassAt_v3 r ∩ S.CP.C1 = ({x} : Finset ℝ²)) ∧
    (S.witnessClassAt_v3 r ∩ S.CP.C2 = ({y} : Finset ℝ²))

/-- `N4c` Form `b` at `v₃`: the escaped `4`-class uses `v₁` and one interior
point from the `C₁` side chain. -/
def IsFormB_v3 {A : Finset ℝ²} (S : FiniteEndpointShell A) (r : ℝ) : Prop :=
  ∃ x : ℝ²,
    x ∈ S.I1 ∧
    (S.witnessClassAt_v3 r ∩ S.CP.C1 = ({x} : Finset ℝ²)) ∧
    (S.witnessClassAt_v3 r ∩ S.CP.C2 = ({S.triangle.v1} : Finset ℝ²))

/-- `N4c` Form `c` at `v₃`: the escaped `4`-class uses `v₂` and one interior
point from the `C₂` side chain. -/
def IsFormC_v3 {A : Finset ℝ²} (S : FiniteEndpointShell A) (r : ℝ) : Prop :=
  ∃ y : ℝ²,
    y ∈ S.I2 ∧
    (S.witnessClassAt_v3 r ∩ S.CP.C1 = ({S.triangle.v2} : Finset ℝ²)) ∧
    (S.witnessClassAt_v3 r ∩ S.CP.C2 = ({y} : Finset ℝ²))

/-- `N4d-b1` packaging at `v₁`: in the zero-defect layout, a Form `b` witness
uses one of the two named interior vertices of `C₂`. -/
theorem formB_v1_split
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) {r : ℝ}
    (hB : S.IsFormB_v1 r) :
    (∃ h : (Z.a2 : ℝ²) ∈ S.I2,
        S.witnessClassAt_v1 r ∩ S.CP.C2 = ({Z.a2} : Finset ℝ²)) ∨
      (∃ h : (Z.b2 : ℝ²) ∈ S.I2,
        S.witnessClassAt_v1 r ∩ S.CP.C2 = ({Z.b2} : Finset ℝ²)) := by
  rcases hB with ⟨x, hxI2, hxeq, -⟩
  have hxmem : x ∈ ({Z.a2, Z.b2} : Finset ℝ²) := by
    rw [← Z.hI2]
    simpa using hxI2
  rcases Finset.mem_insert.mp hxmem with rfl | hx
  · exact Or.inl ⟨by simpa [Z.hI2] using hxI2, hxeq⟩
  · have : x = Z.b2 := by simpa using hx
    subst this
    exact Or.inr ⟨by simpa [Z.hI2] using hxI2, hxeq⟩

/-- In the zero-defect layout, a Form `c` witness at `v₁` uses one of the two
named interior vertices of `C₃`. -/
theorem formC_v1_split
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) {r : ℝ}
    (hC : S.IsFormC_v1 r) :
    (∃ h : (Z.a3 : ℝ²) ∈ S.I3,
        S.witnessClassAt_v1 r ∩ S.CP.C3 = ({Z.a3} : Finset ℝ²)) ∨
      (∃ h : (Z.b3 : ℝ²) ∈ S.I3,
        S.witnessClassAt_v1 r ∩ S.CP.C3 = ({Z.b3} : Finset ℝ²)) := by
  rcases hC with ⟨y, hyI3, -, hyeq⟩
  have hymem : y ∈ ({Z.a3, Z.b3} : Finset ℝ²) := by
    rw [← Z.hI3]
    simpa using hyI3
  rcases Finset.mem_insert.mp hymem with rfl | hy
  · exact Or.inl ⟨by simpa [Z.hI3] using hyI3, hyeq⟩
  · have : y = Z.b3 := by simpa using hy
    subst this
    exact Or.inr ⟨by simpa [Z.hI3] using hyI3, hyeq⟩

/-- `N4d-a1` packaging at `v₁`: in the zero-defect layout, a Form `a` witness
falls into one of the four named side-witness placements. -/
theorem formA_v1_split
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) {r : ℝ}
    (hA : S.IsFormA_v1 r) :
    ((∃ h2 : (Z.a2 : ℝ²) ∈ S.I2, ∃ h3 : (Z.a3 : ℝ²) ∈ S.I3,
        S.witnessClassAt_v1 r ∩ S.CP.C2 = ({Z.a2} : Finset ℝ²) ∧
        S.witnessClassAt_v1 r ∩ S.CP.C3 = ({Z.a3} : Finset ℝ²))) ∨
    ((∃ h2 : (Z.a2 : ℝ²) ∈ S.I2, ∃ h3 : (Z.b3 : ℝ²) ∈ S.I3,
        S.witnessClassAt_v1 r ∩ S.CP.C2 = ({Z.a2} : Finset ℝ²) ∧
        S.witnessClassAt_v1 r ∩ S.CP.C3 = ({Z.b3} : Finset ℝ²))) ∨
    ((∃ h2 : (Z.b2 : ℝ²) ∈ S.I2, ∃ h3 : (Z.a3 : ℝ²) ∈ S.I3,
        S.witnessClassAt_v1 r ∩ S.CP.C2 = ({Z.b2} : Finset ℝ²) ∧
        S.witnessClassAt_v1 r ∩ S.CP.C3 = ({Z.a3} : Finset ℝ²))) ∨
    ((∃ h2 : (Z.b2 : ℝ²) ∈ S.I2, ∃ h3 : (Z.b3 : ℝ²) ∈ S.I3,
        S.witnessClassAt_v1 r ∩ S.CP.C2 = ({Z.b2} : Finset ℝ²) ∧
        S.witnessClassAt_v1 r ∩ S.CP.C3 = ({Z.b3} : Finset ℝ²))) := by
  rcases hA with ⟨x, y, hxI2, hyI3, hxeq, hyeq⟩
  have hxmem : x ∈ ({Z.a2, Z.b2} : Finset ℝ²) := by
    rw [← Z.hI2]
    simpa using hxI2
  have hymem : y ∈ ({Z.a3, Z.b3} : Finset ℝ²) := by
    rw [← Z.hI3]
    simpa using hyI3
  rcases Finset.mem_insert.mp hxmem with rfl | hx
  · rcases Finset.mem_insert.mp hymem with rfl | hy
    · exact Or.inl ⟨by simpa [Z.hI2] using hxI2, by simpa [Z.hI3] using hyI3, hxeq, hyeq⟩
    · have : y = Z.b3 := by simpa using hy
      subst this
      exact Or.inr (Or.inl ⟨by simpa [Z.hI2] using hxI2, by simpa [Z.hI3] using hyI3, hxeq, hyeq⟩)
  · have hx' : x = Z.b2 := by simpa using hx
    subst hx'
    rcases Finset.mem_insert.mp hymem with rfl | hy
    · exact Or.inr (Or.inr (Or.inl
        ⟨by simpa [Z.hI2] using hxI2, by simpa [Z.hI3] using hyI3, hxeq, hyeq⟩))
    · have : y = Z.b3 := by simpa using hy
      subst this
      exact Or.inr (Or.inr (Or.inr
        ⟨by simpa [Z.hI2] using hxI2, by simpa [Z.hI3] using hyI3, hxeq, hyeq⟩))

/-- Forced `v₂` selector shape from the MEC-apex core selector: in the exact
`(4,4,4)` shell, a `K4` witness class at `v₂` is `{a₂,b₂,p,q}` with
`p ∈ {a₁,b₁,v₃}` and `q ∈ {a₃,b₃,v₁}`. -/
theorem selectorShape_v2
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) :
    ∃ r : ℝ, 0 < r ∧
      let T := S.witnessClassAt_v2 r
      T.card = 4 ∧
      S.I2 ⊆ T ∧
      ∃ p q : ℝ²,
        p ∈ ({Z.a1, Z.b1, S.triangle.v3} : Finset ℝ²) ∧
        q ∈ ({Z.a3, Z.b3, S.triangle.v1} : Finset ℝ²) ∧
        T ∩ S.CP.C1 = ({p} : Finset ℝ²) ∧
        T ∩ S.CP.C3 = ({q} : Finset ℝ²) := by
  classical
  rcases S.k4_at_v2 with ⟨r, hr, hcard⟩
  let T : Finset ℝ² := S.witnessClassAt_v2 r
  have hcore := S.coreSelector_v2 hr hcard
  rcases hcore with ⟨hTcard, hI2sub, hC1le, hC3le⟩
  have hTcard' : T.card = 4 := by simpa [T] using hTcard
  have hC1le' : (T ∩ S.CP.C1).card ≤ 1 := by simpa [T] using hC1le
  have hC3le' : (T ∩ S.CP.C3).card ≤ 1 := by simpa [T] using hC3le
  have hv2notT : S.triangle.v2 ∉ T := by
    intro hv2T
    have hv2eq : dist S.triangle.v2 S.triangle.v2 = r := (Finset.mem_filter.mp hv2T).2
    have h0r : (0 : ℝ) = r := by simpa using hv2eq
    nlinarith
  have hI2two : S.I2.card = 2 := S.I2_card_eq_two
  have hI2sub' : S.I2 ⊆ T ∩ S.I2 := by
    intro z hz
    exact Finset.mem_inter.mpr ⟨hI2sub hz, hz⟩
  have hTminus_eq_two : (T \ S.I2).card = 2 := by
    have hsplit : (T \ S.I2).card + (T ∩ S.I2).card = T.card := by
      simpa [T, Finset.inter_comm] using Finset.card_sdiff_add_card_inter T S.I2
    have hI2ge : S.I2.card ≤ (T ∩ S.I2).card := Finset.card_le_card hI2sub'
    have hI2le : (T ∩ S.I2).card ≤ S.I2.card := Finset.card_le_card Finset.inter_subset_right
    omega
  have hcover :
      T \ S.I2 ⊆ (T ∩ S.CP.C1) ∪ (T ∩ S.CP.C3) := by
    intro x hx
    rcases Finset.mem_sdiff.mp hx with ⟨hxT, hxnotI2⟩
    have hxA : x ∈ A := (Finset.mem_filter.mp hxT).1
    by_cases hxv1 : x = S.triangle.v1
    · apply Finset.mem_union_right
      exact Finset.mem_inter.mpr ⟨hxT, by simpa [hxv1] using S.CP.v1_mem_C3⟩
    by_cases hxv3 : x = S.triangle.v3
    · apply Finset.mem_union_left
      exact Finset.mem_inter.mpr ⟨hxT, by simpa [hxv3] using S.CP.v3_mem_C1⟩
    by_cases hxv2 : x = S.triangle.v2
    · exact False.elim (hv2notT (hxv2 ▸ hxT))
    have hxnonmoser : x ∉ S.triangle.verts := by
      simp [Problem97.MoserTriangle.verts, hxv1, hxv2, hxv3]
    have hxnotC2 : x ∉ S.CP.C2 := by
      intro hxC2
      have hxI2 : x ∈ S.I2 := by
        unfold I2
        exact Finset.mem_erase.mpr ⟨hxv1, Finset.mem_erase.mpr ⟨hxv3, hxC2⟩⟩
      exact hxnotI2 hxI2
    have hone := S.CP.nonmoser_in_one x hxA hxnonmoser
    by_cases hxC1 : x ∈ S.CP.C1
    · exact Finset.mem_union.mpr (Or.inl (Finset.mem_inter.mpr ⟨hxT, hxC1⟩))
    · have hxC3 : x ∈ S.CP.C3 := by
        by_cases hxC3 : x ∈ S.CP.C3
        · exact hxC3
        · have : (0 : ℕ) = 1 := by
            simpa [hxC1, hxnotC2, hxC3] using hone
          omega
      exact Finset.mem_union.mpr (Or.inr (Finset.mem_inter.mpr ⟨hxT, hxC3⟩))
  have hUnion_eq_two :
      ((T ∩ S.CP.C1) ∪ (T ∩ S.CP.C3)).card = 2 := by
    have hTminus_le : (T \ S.I2).card ≤ ((T ∩ S.CP.C1) ∪ (T ∩ S.CP.C3)).card :=
      Finset.card_le_card hcover
    have hUnion_le :
        ((T ∩ S.CP.C1) ∪ (T ∩ S.CP.C3)).card ≤ 2 := by
      calc
        ((T ∩ S.CP.C1) ∪ (T ∩ S.CP.C3)).card
            ≤ (T ∩ S.CP.C1).card + (T ∩ S.CP.C3).card := Finset.card_union_le _ _
        _ ≤ 1 + 1 := by omega
        _ = 2 := by norm_num
    omega
  have hsum_eq_two : (T ∩ S.CP.C1).card + (T ∩ S.CP.C3).card = 2 := by
    have hUnion_le_sum : ((T ∩ S.CP.C1) ∪ (T ∩ S.CP.C3)).card ≤
        (T ∩ S.CP.C1).card + (T ∩ S.CP.C3).card := Finset.card_union_le _ _
    omega
  have hC1eq1 : (T ∩ S.CP.C1).card = 1 := by omega
  have hC3eq1 : (T ∩ S.CP.C3).card = 1 := by omega
  obtain ⟨p, hpeq⟩ := Finset.card_eq_one.mp hC1eq1
  obtain ⟨q, hqeq⟩ := Finset.card_eq_one.mp hC3eq1
  have hpT : p ∈ T := by
    have hpmem : p ∈ ({p} : Finset ℝ²) := by simp
    rw [← hpeq] at hpmem
    exact (Finset.mem_inter.mp hpmem).1
  have hqT : q ∈ T := by
    have hqmem : q ∈ ({q} : Finset ℝ²) := by simp
    rw [← hqeq] at hqmem
    exact (Finset.mem_inter.mp hqmem).1
  have hpC1 : p ∈ S.CP.C1 := by
    have hpmem : p ∈ ({p} : Finset ℝ²) := by simp
    rw [← hpeq] at hpmem
    exact (Finset.mem_inter.mp hpmem).2
  have hqC3 : q ∈ S.CP.C3 := by
    have hqmem : q ∈ ({q} : Finset ℝ²) := by simp
    rw [← hqeq] at hqmem
    exact (Finset.mem_inter.mp hqmem).2
  have hp_ne_v2 : p ≠ S.triangle.v2 := by
    intro h
    exact hv2notT (h ▸ hpT)
  have hq_ne_v2 : q ≠ S.triangle.v2 := by
    intro h
    exact hv2notT (h ▸ hqT)
  have hp_named : p ∈ ({Z.a1, Z.b1, S.triangle.v3} : Finset ℝ²) := by
    by_cases hpv3 : p = S.triangle.v3
    · simp [hpv3]
    · have hpI1 : p ∈ S.I1 := by
        unfold I1
        exact Finset.mem_erase.mpr ⟨hpv3, Finset.mem_erase.mpr ⟨hp_ne_v2, hpC1⟩⟩
      have hpI1' : p ∈ ({Z.a1, Z.b1} : Finset ℝ²) := by
        have : p ∈ S.I1 := hpI1
        rw [Z.hI1] at this
        exact this
      rcases Finset.mem_insert.mp hpI1' with hpa1 | hpb1
      · simp [hpa1]
      · have hpb1' : p = Z.b1 := by simpa using hpb1
        exact Finset.mem_insert.mpr (Or.inr (Finset.mem_insert.mpr (Or.inl hpb1')))
  have hq_named : q ∈ ({Z.a3, Z.b3, S.triangle.v1} : Finset ℝ²) := by
    by_cases hqv1 : q = S.triangle.v1
    · simp [hqv1]
    · have hqI3 : q ∈ S.I3 := by
        unfold I3
        exact Finset.mem_erase.mpr ⟨hq_ne_v2, Finset.mem_erase.mpr ⟨hqv1, hqC3⟩⟩
      have hqI3' : q ∈ ({Z.a3, Z.b3} : Finset ℝ²) := by
        have : q ∈ S.I3 := hqI3
        rw [Z.hI3] at this
        exact this
      rcases Finset.mem_insert.mp hqI3' with hqa3 | hqb3
      · simp [hqa3]
      · have hqb3' : q = Z.b3 := by simpa using hqb3
        exact Finset.mem_insert.mpr (Or.inr (Finset.mem_insert.mpr (Or.inl hqb3')))
  refine ⟨r, hr, ?_⟩
  dsimp [T]
  exact ⟨hTcard, hI2sub, p, q, hp_named, hq_named, hpeq, hqeq⟩

/-- Forced `v₃` selector shape from the MEC-apex core selector: in the exact
`(4,4,4)` shell, a `K4` witness class at `v₃` is `{a₃,b₃,p,q}` with
`p ∈ {a₁,b₁,v₂}` and `q ∈ {a₂,b₂,v₁}`. -/
theorem selectorShape_v3
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) :
    ∃ r : ℝ, 0 < r ∧
      let T := S.witnessClassAt_v3 r
      T.card = 4 ∧
      S.I3 ⊆ T ∧
      ∃ p q : ℝ²,
        p ∈ ({Z.a1, Z.b1, S.triangle.v2} : Finset ℝ²) ∧
        q ∈ ({Z.a2, Z.b2, S.triangle.v1} : Finset ℝ²) ∧
        T ∩ S.CP.C1 = ({p} : Finset ℝ²) ∧
        T ∩ S.CP.C2 = ({q} : Finset ℝ²) := by
  classical
  rcases S.k4_at_v3 with ⟨r, hr, hcard⟩
  let T : Finset ℝ² := S.witnessClassAt_v3 r
  have hcore := S.coreSelector_v3 hr hcard
  rcases hcore with ⟨hTcard, hI3sub, hC1le, hC2le⟩
  have hTcard' : T.card = 4 := by simpa [T] using hTcard
  have hC1le' : (T ∩ S.CP.C1).card ≤ 1 := by simpa [T] using hC1le
  have hC2le' : (T ∩ S.CP.C2).card ≤ 1 := by simpa [T] using hC2le
  have hv3notT : S.triangle.v3 ∉ T := by
    intro hv3T
    have hv3eq : dist S.triangle.v3 S.triangle.v3 = r := (Finset.mem_filter.mp hv3T).2
    have h0r : (0 : ℝ) = r := by simpa using hv3eq
    nlinarith
  have hI3sub' : S.I3 ⊆ T ∩ S.I3 := by
    intro z hz
    exact Finset.mem_inter.mpr ⟨hI3sub hz, hz⟩
  have hTminus_eq_two : (T \ S.I3).card = 2 := by
    have hsplit : (T \ S.I3).card + (T ∩ S.I3).card = T.card := by
      simpa [T, Finset.inter_comm] using Finset.card_sdiff_add_card_inter T S.I3
    have hI3ge : S.I3.card ≤ (T ∩ S.I3).card := Finset.card_le_card hI3sub'
    have hI3le : (T ∩ S.I3).card ≤ S.I3.card := Finset.card_le_card Finset.inter_subset_right
    have hI3two : S.I3.card = 2 := S.I3_card_eq_two
    omega
  have hcover :
      T \ S.I3 ⊆ (T ∩ S.CP.C1) ∪ (T ∩ S.CP.C2) := by
    intro x hx
    rcases Finset.mem_sdiff.mp hx with ⟨hxT, hxnotI3⟩
    have hxA : x ∈ A := (Finset.mem_filter.mp hxT).1
    by_cases hxv2 : x = S.triangle.v2
    · apply Finset.mem_union_left
      exact Finset.mem_inter.mpr ⟨hxT, by simpa [hxv2] using S.CP.v2_mem_C1⟩
    by_cases hxv1 : x = S.triangle.v1
    · apply Finset.mem_union_right
      exact Finset.mem_inter.mpr ⟨hxT, by simpa [hxv1] using S.CP.v1_mem_C2⟩
    by_cases hxv3 : x = S.triangle.v3
    · exact False.elim (hv3notT (hxv3 ▸ hxT))
    have hxnonmoser : x ∉ S.triangle.verts := by
      simp [Problem97.MoserTriangle.verts, hxv1, hxv2, hxv3]
    have hxnotC3 : x ∉ S.CP.C3 := by
      intro hxC3
      have hxI3 : x ∈ S.I3 := by
        unfold I3
        exact Finset.mem_erase.mpr ⟨hxv2, Finset.mem_erase.mpr ⟨hxv1, hxC3⟩⟩
      exact hxnotI3 hxI3
    have hone := S.CP.nonmoser_in_one x hxA hxnonmoser
    by_cases hxC1 : x ∈ S.CP.C1
    · exact Finset.mem_union.mpr (Or.inl (Finset.mem_inter.mpr ⟨hxT, hxC1⟩))
    · have hxC2 : x ∈ S.CP.C2 := by
        by_cases hxC2 : x ∈ S.CP.C2
        · exact hxC2
        · have : (0 : ℕ) = 1 := by
            simpa [hxC1, hxC2, hxnotC3] using hone
          omega
      exact Finset.mem_union.mpr (Or.inr (Finset.mem_inter.mpr ⟨hxT, hxC2⟩))
  have hUnion_eq_two :
      ((T ∩ S.CP.C1) ∪ (T ∩ S.CP.C2)).card = 2 := by
    have hTminus_le : (T \ S.I3).card ≤ ((T ∩ S.CP.C1) ∪ (T ∩ S.CP.C2)).card :=
      Finset.card_le_card hcover
    have hUnion_le :
        ((T ∩ S.CP.C1) ∪ (T ∩ S.CP.C2)).card ≤ 2 := by
      calc
        ((T ∩ S.CP.C1) ∪ (T ∩ S.CP.C2)).card
            ≤ (T ∩ S.CP.C1).card + (T ∩ S.CP.C2).card := Finset.card_union_le _ _
        _ ≤ 1 + 1 := by omega
        _ = 2 := by norm_num
    omega
  have hsum_eq_two : (T ∩ S.CP.C1).card + (T ∩ S.CP.C2).card = 2 := by
    have hUnion_le_sum : ((T ∩ S.CP.C1) ∪ (T ∩ S.CP.C2)).card ≤
        (T ∩ S.CP.C1).card + (T ∩ S.CP.C2).card := Finset.card_union_le _ _
    omega
  have hC1eq1 : (T ∩ S.CP.C1).card = 1 := by omega
  have hC2eq1 : (T ∩ S.CP.C2).card = 1 := by omega
  obtain ⟨p, hpeq⟩ := Finset.card_eq_one.mp hC1eq1
  obtain ⟨q, hqeq⟩ := Finset.card_eq_one.mp hC2eq1
  have hpT : p ∈ T := by
    have hpmem : p ∈ ({p} : Finset ℝ²) := by simp
    rw [← hpeq] at hpmem
    exact (Finset.mem_inter.mp hpmem).1
  have hqT : q ∈ T := by
    have hqmem : q ∈ ({q} : Finset ℝ²) := by simp
    rw [← hqeq] at hqmem
    exact (Finset.mem_inter.mp hqmem).1
  have hpC1 : p ∈ S.CP.C1 := by
    have hpmem : p ∈ ({p} : Finset ℝ²) := by simp
    rw [← hpeq] at hpmem
    exact (Finset.mem_inter.mp hpmem).2
  have hqC2 : q ∈ S.CP.C2 := by
    have hqmem : q ∈ ({q} : Finset ℝ²) := by simp
    rw [← hqeq] at hqmem
    exact (Finset.mem_inter.mp hqmem).2
  have hp_ne_v3 : p ≠ S.triangle.v3 := by
    intro h
    exact hv3notT (h ▸ hpT)
  have hq_ne_v3 : q ≠ S.triangle.v3 := by
    intro h
    exact hv3notT (h ▸ hqT)
  have hp_named : p ∈ ({Z.a1, Z.b1, S.triangle.v2} : Finset ℝ²) := by
    by_cases hpv2 : p = S.triangle.v2
    · simp [hpv2]
    · have hpI1 : p ∈ S.I1 := by
        unfold I1
        exact Finset.mem_erase.mpr ⟨hp_ne_v3, Finset.mem_erase.mpr ⟨hpv2, hpC1⟩⟩
      have hpI1' : p ∈ ({Z.a1, Z.b1} : Finset ℝ²) := by
        have : p ∈ S.I1 := hpI1
        rw [Z.hI1] at this
        exact this
      rcases Finset.mem_insert.mp hpI1' with hpa1 | hpb1
      · simp [hpa1]
      · have hpb1' : p = Z.b1 := by simpa using hpb1
        exact Finset.mem_insert.mpr (Or.inr (Finset.mem_insert.mpr (Or.inl hpb1')))
  have hq_named : q ∈ ({Z.a2, Z.b2, S.triangle.v1} : Finset ℝ²) := by
    by_cases hqv1 : q = S.triangle.v1
    · simp [hqv1]
    · have hqI2 : q ∈ S.I2 := by
        unfold I2
        exact Finset.mem_erase.mpr ⟨hqv1, Finset.mem_erase.mpr ⟨hq_ne_v3, hqC2⟩⟩
      have hqI2' : q ∈ ({Z.a2, Z.b2} : Finset ℝ²) := by
        have : q ∈ S.I2 := hqI2
        rw [Z.hI2] at this
        exact this
      rcases Finset.mem_insert.mp hqI2' with hqa2 | hqb2
      · simp [hqa2]
      · have hqb2' : q = Z.b2 := by simpa using hqb2
        exact Finset.mem_insert.mpr (Or.inr (Finset.mem_insert.mpr (Or.inl hqb2')))
  refine ⟨r, hr, ?_⟩
  dsimp [T]
  exact ⟨hTcard, hI3sub, p, q, hp_named, hq_named, hpeq, hqeq⟩

/-- `N4d-b2/b5` selector split at `v₂`: the forced `v₂` witness class uses
either the endpoint `v₁` on the `C₃` side, or one of the two named lower-side
interior vertices `a₃,b₃`. -/
theorem selectorShape_v2_split
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) :
    ∃ r : ℝ, 0 < r ∧
      let T := S.witnessClassAt_v2 r
      T.card = 4 ∧
      S.I2 ⊆ T ∧
      ((∃ p : ℝ²,
          p ∈ ({Z.a1, Z.b1, S.triangle.v3} : Finset ℝ²) ∧
          T ∩ S.CP.C1 = ({p} : Finset ℝ²) ∧
          T ∩ S.CP.C3 = ({S.triangle.v1} : Finset ℝ²)) ∨
       (∃ p : ℝ²,
          p ∈ ({Z.a1, Z.b1, S.triangle.v3} : Finset ℝ²) ∧
          T ∩ S.CP.C1 = ({p} : Finset ℝ²) ∧
          T ∩ S.CP.C3 = ({Z.a3} : Finset ℝ²)) ∨
       (∃ p : ℝ²,
          p ∈ ({Z.a1, Z.b1, S.triangle.v3} : Finset ℝ²) ∧
          T ∩ S.CP.C1 = ({p} : Finset ℝ²) ∧
          T ∩ S.CP.C3 = ({Z.b3} : Finset ℝ²))) := by
  classical
  rcases S.selectorShape_v2 Z with ⟨r, hr, hshape⟩
  dsimp at hshape
  rcases hshape with ⟨hTcard, hI2sub, p, q, hp, hq, hpeq, hqeq⟩
  rcases Finset.mem_insert.mp hq with hqa3 | hq
  · refine ⟨r, hr, ?_⟩
    dsimp
    exact ⟨hTcard, hI2sub, Or.inr (Or.inl ⟨p, hp, hpeq, by simpa [hqa3] using hqeq⟩)⟩
  rcases Finset.mem_insert.mp hq with hqb3 | hq
  · have hqb3' : q = Z.b3 := by simpa using hqb3
    refine ⟨r, hr, ?_⟩
    dsimp
    exact ⟨hTcard, hI2sub, Or.inr (Or.inr ⟨p, hp, hpeq, by simpa [hqb3'] using hqeq⟩)⟩
  have hqv1 : q = S.triangle.v1 := by simpa using hq
  refine ⟨r, hr, ?_⟩
  dsimp
  exact ⟨hTcard, hI2sub, Or.inl ⟨p, hp, hpeq, by simpa [hqv1] using hqeq⟩⟩

/-- `N4d-b3/b5` companion selector split at `v₃`: the forced `v₃` witness
class uses either the endpoint `v₁` on the `C₂` side, or one of the two named
upper-side interior vertices `a₂,b₂`. -/
theorem selectorShape_v3_split
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) :
    ∃ r : ℝ, 0 < r ∧
      let T := S.witnessClassAt_v3 r
      T.card = 4 ∧
      S.I3 ⊆ T ∧
      ((∃ p : ℝ²,
          p ∈ ({Z.a1, Z.b1, S.triangle.v2} : Finset ℝ²) ∧
          T ∩ S.CP.C1 = ({p} : Finset ℝ²) ∧
          T ∩ S.CP.C2 = ({S.triangle.v1} : Finset ℝ²)) ∨
       (∃ p : ℝ²,
          p ∈ ({Z.a1, Z.b1, S.triangle.v2} : Finset ℝ²) ∧
          T ∩ S.CP.C1 = ({p} : Finset ℝ²) ∧
          T ∩ S.CP.C2 = ({Z.a2} : Finset ℝ²)) ∨
       (∃ p : ℝ²,
          p ∈ ({Z.a1, Z.b1, S.triangle.v2} : Finset ℝ²) ∧
          T ∩ S.CP.C1 = ({p} : Finset ℝ²) ∧
          T ∩ S.CP.C2 = ({Z.b2} : Finset ℝ²))) := by
  classical
  rcases S.selectorShape_v3 Z with ⟨r, hr, hshape⟩
  dsimp at hshape
  rcases hshape with ⟨hTcard, hI3sub, p, q, hp, hq, hpeq, hqeq⟩
  rcases Finset.mem_insert.mp hq with hqa2 | hq
  · refine ⟨r, hr, ?_⟩
    dsimp
    exact ⟨hTcard, hI3sub, Or.inr (Or.inl ⟨p, hp, hpeq, by simpa [hqa2] using hqeq⟩)⟩
  rcases Finset.mem_insert.mp hq with hqb2 | hq
  · have hqb2' : q = Z.b2 := by simpa using hqb2
    refine ⟨r, hr, ?_⟩
    dsimp
    exact ⟨hTcard, hI3sub, Or.inr (Or.inr ⟨p, hp, hpeq, by simpa [hqb2'] using hqeq⟩)⟩
  have hqv1 : q = S.triangle.v1 := by simpa using hq
  refine ⟨r, hr, ?_⟩
  dsimp
  exact ⟨hTcard, hI3sub, Or.inl ⟨p, hp, hpeq, by simpa [hqv1] using hqeq⟩⟩

/-- Local support-cap distance order on `I₁` viewed from `v₃`: after orienting
`C₁` from `v₃` toward `v₂`, the two interior points appear in strict radial
order before the endpoint `v₂`.  This is packaging only, using the existing
support-cap extractor and `E3-L20` monotonicity exports. -/
theorem I1_v3_distance_chain
    {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    ∃ near far : ℝ²,
      ({near, far} : Finset ℝ²) = S.I1 ∧
      dist S.triangle.v3 near < dist S.triangle.v3 far ∧
      dist S.triangle.v3 far < dist S.triangle.v3 S.triangle.v2 := by
  classical
  have hC1four : S.CP.C1.card = 4 := (S.n5_forced_m44).1
  rcases Problem97.CGN.CGN4g_capData_of_supportCap_oriented
      (A := A) (C := S.CP.C1) (M := S.triangle)
      S.hconv S.hnoncol S.CP.C1_subset
      (fun x hxA => (S.CP.arc_membership x hxA).1)
      S.CP.v2_mem_C1 S.CP.v3_mem_C1 S.Packet S.Packet.inner_at_v1 with
    ⟨m, L, Packet, Hside, Hord, hLC, hEnds⟩
  have hm4 : m = 4 := by
    calc
      m = (Finset.univ.image L.points).card := by
        symm
        simpa using Finset.card_image_of_injective (s := Finset.univ) (f := L.points) L.injective
      _ = S.CP.C1.card := by rw [hLC]
      _ = 4 := hC1four
  subst m
  let i0 : Fin 4 := ⟨0, by decide⟩
  let i1 : Fin 4 := ⟨1, by decide⟩
  let i2 : Fin 4 := ⟨2, by decide⟩
  let i3 : Fin 4 := ⟨3, by decide⟩
  have hi12 : i1 < i2 := by decide
  have hi23 : i2 < i3 := by decide
  have hidx0 : (Problem97.CGN.firstIndex Packet.hm : Fin 4) = i0 := by
    ext
    simp [Problem97.CGN.firstIndex, i0]
  have hidx3 : (Problem97.CGN.lastIndex Packet.hm : Fin 4) = i3 := by
    ext
    simp [Problem97.CGN.lastIndex, i3]
  rcases hEnds with hFirstLast | hLastFirst
  · have hmono :
        Problem97.FiniteEndpoint.E3L20b_rightEndpoint_capDistance_strict
          (L.points (Problem97.CGN.lastIndex Packet.hm))
          (Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCapRev L) := by
      intro i j hij
      exact Problem97.FiniteEndpoint.E3L20b_of_cgnCapData Packet Hside Hord hij
    have hfirst0 : L.points i0 = S.triangle.v2 := by
      simpa [hidx0, i0] using hFirstLast.1
    have hlast3 : L.points i3 = S.triangle.v3 := by
      simpa [hidx3, i3] using hFirstLast.2
    have hi1rev : i1.rev = i2 := by decide
    have hi2rev : i2.rev = i1 := by decide
    have hi3rev : i3.rev = i0 := by decide
    have hnearfar : dist S.triangle.v3 (L.points i2) < dist S.triangle.v3 (L.points i1) := by
      have htmp :
          dist (L.points i3) (L.points i2) < dist (L.points i3) (L.points i1) := by
        simpa [Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCapRev_points, hidx3,
            hi1rev, hi2rev] using hmono hi12
      simpa [hlast3] using htmp
    have hfarv2 : dist S.triangle.v3 (L.points i1) < dist S.triangle.v3 S.triangle.v2 := by
      have htmp :
          dist (L.points i3) (L.points i1) < dist (L.points i3) (L.points i0) := by
        simpa [Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCapRev_points, hidx3,
            hi2rev, hi3rev] using hmono hi23
      simpa [hlast3, hfirst0] using htmp
    have hnearC1 : L.points i2 ∈ S.CP.C1 := by
      rw [← hLC]
      exact Finset.mem_image.mpr ⟨i2, by simp [i2]⟩
    have hfarC1 : L.points i1 ∈ S.CP.C1 := by
      rw [← hLC]
      exact Finset.mem_image.mpr ⟨i1, by simp [i1]⟩
    have hnear_ne_v2 : L.points i2 ≠ S.triangle.v2 := by
      intro h
      have : i2 = i0 := L.injective (by simpa [hfirst0] using h)
      simpa [i0, i2] using this
    have hnear_ne_v3 : L.points i2 ≠ S.triangle.v3 := by
      intro h
      have : i2 = i3 := L.injective (by simpa [hlast3] using h)
      simpa [i2, i3] using this
    have hfar_ne_v2 : L.points i1 ≠ S.triangle.v2 := by
      intro h
      have : i1 = i0 := L.injective (by simpa [hfirst0] using h)
      simpa [i0, i1] using this
    have hfar_ne_v3 : L.points i1 ≠ S.triangle.v3 := by
      intro h
      have : i1 = i3 := L.injective (by simpa [hlast3] using h)
      simpa [i1, i3] using this
    have hnearI1 : L.points i2 ∈ S.I1 := by
      unfold Problem97.FiniteEndpointShell.I1
      exact Finset.mem_erase.mpr ⟨hnear_ne_v3, Finset.mem_erase.mpr ⟨hnear_ne_v2, hnearC1⟩⟩
    have hfarI1 : L.points i1 ∈ S.I1 := by
      unfold Problem97.FiniteEndpointShell.I1
      exact Finset.mem_erase.mpr ⟨hfar_ne_v3, Finset.mem_erase.mpr ⟨hfar_ne_v2, hfarC1⟩⟩
    have hpair_sub : ({L.points i2, L.points i1} : Finset ℝ²) ⊆ S.I1 := by
      intro x hx
      rcases Finset.mem_insert.mp hx with hx | hx
      · simpa [hx] using hnearI1
      · have hx' : x = L.points i1 := by simpa using hx
        simpa [hx'] using hfarI1
    have hpair_card : ({L.points i2, L.points i1} : Finset ℝ²).card = 2 := by
      have hne : L.points i2 ≠ L.points i1 := by
        intro h
        have : i2 = i1 := L.injective h
        simpa [i1, i2] using this
      simp [hne]
    have hI1le : S.I1.card ≤ ({L.points i2, L.points i1} : Finset ℝ²).card := by
      rw [S.I1_card_eq_two, hpair_card]
    refine ⟨L.points i2, L.points i1, ?_, hnearfar, hfarv2⟩
    exact Finset.eq_of_subset_of_card_le hpair_sub hI1le
  · have hmono :
        Problem97.FiniteEndpoint.E3L20a_leftEndpoint_capDistance_strict
          (L.points (Problem97.CGN.firstIndex Packet.hm))
          (Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCap L) := by
      intro i j hij
      exact Problem97.FiniteEndpoint.E3L20a_of_cgnCapData Packet Hside Hord hij
    have hfirst0 : L.points i0 = S.triangle.v3 := by
      simpa [hidx0, i0] using hLastFirst.1
    have hlast3 : L.points i3 = S.triangle.v2 := by
      simpa [hidx3, i3] using hLastFirst.2
    have hnearfar : dist S.triangle.v3 (L.points i1) < dist S.triangle.v3 (L.points i2) := by
      have htmp :
          dist (L.points i0) (L.points i1) < dist (L.points i0) (L.points i2) := by
        simpa [Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCap_points, hidx0] using hmono hi12
      simpa [hfirst0] using htmp
    have hfarv2 : dist S.triangle.v3 (L.points i2) < dist S.triangle.v3 S.triangle.v2 := by
      have htmp :
          dist (L.points i0) (L.points i2) < dist (L.points i0) (L.points i3) := by
        simpa [Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCap_points, hidx0, hidx3]
          using hmono hi23
      simpa [hfirst0, hlast3] using htmp
    have hnearC1 : L.points i1 ∈ S.CP.C1 := by
      rw [← hLC]
      exact Finset.mem_image.mpr ⟨i1, by simp [i1]⟩
    have hfarC1 : L.points i2 ∈ S.CP.C1 := by
      rw [← hLC]
      exact Finset.mem_image.mpr ⟨i2, by simp [i2]⟩
    have hnear_ne_v2 : L.points i1 ≠ S.triangle.v2 := by
      intro h
      have : i1 = i3 := L.injective (by simpa [hlast3] using h)
      simpa [i1, i3] using this
    have hnear_ne_v3 : L.points i1 ≠ S.triangle.v3 := by
      intro h
      have : i1 = i0 := L.injective (by simpa [hfirst0] using h)
      simpa [i0, i1] using this
    have hfar_ne_v2 : L.points i2 ≠ S.triangle.v2 := by
      intro h
      have : i2 = i3 := L.injective (by simpa [hlast3] using h)
      simpa [i2, i3] using this
    have hfar_ne_v3 : L.points i2 ≠ S.triangle.v3 := by
      intro h
      have : i2 = i0 := L.injective (by simpa [hfirst0] using h)
      simpa [i0, i2] using this
    have hnearI1 : L.points i1 ∈ S.I1 := by
      unfold Problem97.FiniteEndpointShell.I1
      exact Finset.mem_erase.mpr ⟨hnear_ne_v3, Finset.mem_erase.mpr ⟨hnear_ne_v2, hnearC1⟩⟩
    have hfarI1 : L.points i2 ∈ S.I1 := by
      unfold Problem97.FiniteEndpointShell.I1
      exact Finset.mem_erase.mpr ⟨hfar_ne_v3, Finset.mem_erase.mpr ⟨hfar_ne_v2, hfarC1⟩⟩
    have hpair_sub : ({L.points i1, L.points i2} : Finset ℝ²) ⊆ S.I1 := by
      intro x hx
      rcases Finset.mem_insert.mp hx with hx | hx
      · simpa [hx] using hnearI1
      · have hx' : x = L.points i2 := by simpa using hx
        simpa [hx'] using hfarI1
    have hpair_card : ({L.points i1, L.points i2} : Finset ℝ²).card = 2 := by
      have hne : L.points i1 ≠ L.points i2 := by
        intro h
        have : i1 = i2 := L.injective h
        simpa [i1, i2] using this
      simp [hne]
    have hI1le : S.I1.card ≤ ({L.points i1, L.points i2} : Finset ℝ²).card := by
      rw [S.I1_card_eq_two, hpair_card]
    refine ⟨L.points i1, L.points i2, ?_, hnearfar, hfarv2⟩
    exact Finset.eq_of_subset_of_card_le hpair_sub hI1le

/-- Cap-order opposite-sign pairing for the lower cap `C₃` (endpoints `v₁`,
`v₂`, opposite apex `v₃`).  Extract the `C₃` cap data once as a single ordered
side-chain `L`, then apply the `E3-L20a` monotonicity export from the left
endpoint `v₁` and the `E3-L20b` export from the right endpoint `v₂` to the
*same* interior index pair.  Because the two endpoints sit at opposite ends of
the chain, the `v₁`-distance order and the `v₂`-distance order over the interior
pair come out **opposite**: the chosen `near` is simultaneously the `v₁`-nearer
and the `v₂`-farther interior vertex.  This is the cap-order contradiction form
consumed by the `q'=E` closer.  Mirror of `I1_v3_distance_chain`. -/
theorem I3_cap_order_chain
    {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    ∃ near far : ℝ²,
      ({near, far} : Finset ℝ²) = S.I3 ∧
      dist S.triangle.v1 near < dist S.triangle.v1 far ∧
      dist S.triangle.v2 far < dist S.triangle.v2 near := by
  classical
  have hC3four : S.CP.C3.card = 4 := (S.n5_forced_m44).2.2
  rcases Problem97.CGN.CGN4g_capData_of_supportCap_oriented
      (A := A) (C := S.CP.C3) (M := S.triangle3)
      S.hconv S.hnoncol S.CP.C3_subset
      (fun x hxA => (S.CP.arc_membership x hxA).2.2)
      S.CP.v1_mem_C3 S.CP.v2_mem_C3 S.packet3 S.packet3.inner_at_v1 with
    ⟨m, L, Packet, Hside, Hord, hLC, hEnds⟩
  have hm4 : m = 4 := by
    calc
      m = (Finset.univ.image L.points).card := by
        symm
        simpa using Finset.card_image_of_injective (s := Finset.univ) (f := L.points) L.injective
      _ = S.CP.C3.card := by rw [hLC]
      _ = 4 := hC3four
  subst m
  let i0 : Fin 4 := ⟨0, by decide⟩
  let i1 : Fin 4 := ⟨1, by decide⟩
  let i2 : Fin 4 := ⟨2, by decide⟩
  let i3 : Fin 4 := ⟨3, by decide⟩
  have hi12 : i1 < i2 := by decide
  have hi23 : i2 < i3 := by decide
  have hidx0 : (Problem97.CGN.firstIndex Packet.hm : Fin 4) = i0 := by
    ext
    simp [Problem97.CGN.firstIndex, i0]
  have hidx3 : (Problem97.CGN.lastIndex Packet.hm : Fin 4) = i3 := by
    ext
    simp [Problem97.CGN.lastIndex, i3]
  have hi1rev : i1.rev = i2 := by decide
  have hi2rev : i2.rev = i1 := by decide
  -- The `E3-L20a` (left endpoint) and `E3-L20b` (right endpoint) monotonicity
  -- exports for the single chain `L`, used in both orientation branches.
  have hmonoA :
      Problem97.FiniteEndpoint.E3L20a_leftEndpoint_capDistance_strict
        (L.points (Problem97.CGN.firstIndex Packet.hm))
        (Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCap L) := by
    intro i j hij
    exact Problem97.FiniteEndpoint.E3L20a_of_cgnCapData Packet Hside Hord hij
  have hmonoB :
      Problem97.FiniteEndpoint.E3L20b_rightEndpoint_capDistance_strict
        (L.points (Problem97.CGN.lastIndex Packet.hm))
        (Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCapRev L) := by
    intro i j hij
    exact Problem97.FiniteEndpoint.E3L20b_of_cgnCapData Packet Hside Hord hij
  -- Membership / distinctness packaging for the interior pair `{L i1, L i2}`,
  -- valid in both branches: `i1, i2` are the two interior indices, distinct
  -- from each other and from the endpoint indices `i0, i3`.
  have hL_i1_C3 : L.points i1 ∈ S.CP.C3 := by
    rw [← hLC]; exact Finset.mem_image.mpr ⟨i1, by simp [i1]⟩
  have hL_i2_C3 : L.points i2 ∈ S.CP.C3 := by
    rw [← hLC]; exact Finset.mem_image.mpr ⟨i2, by simp [i2]⟩
  have hne12 : L.points i1 ≠ L.points i2 := by
    intro h; have : i1 = i2 := L.injective h; simpa [i1, i2] using this
  rcases hEnds with hFirstLast | hLastFirst
  · -- `firstIndex ↦ v₁` (i0), `lastIndex ↦ v₂` (i3).
    have hfirst0 : L.points i0 = S.triangle.v1 := by
      simpa [hidx0, i0] using hFirstLast.1
    have hlast3 : L.points i3 = S.triangle.v2 := by
      simpa [hidx3, i3] using hFirstLast.2
    -- `E3-L20a` from `v₁` (left endpoint): `dist v₁ (L i1) < dist v₁ (L i2)`.
    have hv1order : dist S.triangle.v1 (L.points i1) < dist S.triangle.v1 (L.points i2) := by
      have htmp :
          dist (L.points i0) (L.points i1) < dist (L.points i0) (L.points i2) := by
        simpa [Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCap_points, hidx0]
          using hmonoA hi12
      simpa [hfirst0] using htmp
    -- `E3-L20b` from `v₂` (right endpoint, reversed): `dist v₂ (L i2) < dist v₂ (L i1)`.
    have hv2order : dist S.triangle.v2 (L.points i2) < dist S.triangle.v2 (L.points i1) := by
      have htmp :
          dist (L.points i3) (L.points i2) < dist (L.points i3) (L.points i1) := by
        simpa [Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCapRev_points, hidx3,
            hi1rev, hi2rev] using hmonoB hi12
      simpa [hlast3] using htmp
    -- `near := L i1` (v₁-nearer, v₂-farther), `far := L i2`.
    have hnear_ne_v1 : L.points i1 ≠ S.triangle.v1 := by
      intro h; have : i1 = i0 := L.injective (by simpa [hfirst0] using h); simpa [i0, i1] using this
    have hnear_ne_v2 : L.points i1 ≠ S.triangle.v2 := by
      intro h; have : i1 = i3 := L.injective (by simpa [hlast3] using h); simpa [i1, i3] using this
    have hfar_ne_v1 : L.points i2 ≠ S.triangle.v1 := by
      intro h; have : i2 = i0 := L.injective (by simpa [hfirst0] using h); simpa [i0, i2] using this
    have hfar_ne_v2 : L.points i2 ≠ S.triangle.v2 := by
      intro h; have : i2 = i3 := L.injective (by simpa [hlast3] using h); simpa [i2, i3] using this
    have hnearI3 : L.points i1 ∈ S.I3 := by
      unfold Problem97.FiniteEndpointShell.I3
      exact Finset.mem_erase.mpr ⟨hnear_ne_v2, Finset.mem_erase.mpr ⟨hnear_ne_v1, hL_i1_C3⟩⟩
    have hfarI3 : L.points i2 ∈ S.I3 := by
      unfold Problem97.FiniteEndpointShell.I3
      exact Finset.mem_erase.mpr ⟨hfar_ne_v2, Finset.mem_erase.mpr ⟨hfar_ne_v1, hL_i2_C3⟩⟩
    have hpair_sub : ({L.points i1, L.points i2} : Finset ℝ²) ⊆ S.I3 := by
      intro x hx
      rcases Finset.mem_insert.mp hx with hx | hx
      · simpa [hx] using hnearI3
      · have hx' : x = L.points i2 := by simpa using hx
        simpa [hx'] using hfarI3
    have hpair_card : ({L.points i1, L.points i2} : Finset ℝ²).card = 2 := by
      simp [hne12]
    have hI3le : S.I3.card ≤ ({L.points i1, L.points i2} : Finset ℝ²).card := by
      rw [S.I3_card_eq_two, hpair_card]
    refine ⟨L.points i1, L.points i2, ?_, hv1order, hv2order⟩
    exact Finset.eq_of_subset_of_card_le hpair_sub hI3le
  · -- `firstIndex ↦ v₂` (i0), `lastIndex ↦ v₁` (i3).
    have hfirst0 : L.points i0 = S.triangle.v2 := by
      simpa [hidx0, i0] using hLastFirst.1
    have hlast3 : L.points i3 = S.triangle.v1 := by
      simpa [hidx3, i3] using hLastFirst.2
    -- `E3-L20a` from `v₂` (left endpoint): `dist v₂ (L i1) < dist v₂ (L i2)`.
    have hv2order : dist S.triangle.v2 (L.points i1) < dist S.triangle.v2 (L.points i2) := by
      have htmp :
          dist (L.points i0) (L.points i1) < dist (L.points i0) (L.points i2) := by
        simpa [Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCap_points, hidx0]
          using hmonoA hi12
      simpa [hfirst0] using htmp
    -- `E3-L20b` from `v₁` (right endpoint, reversed): `dist v₁ (L i2) < dist v₁ (L i1)`.
    have hv1order : dist S.triangle.v1 (L.points i2) < dist S.triangle.v1 (L.points i1) := by
      have htmp :
          dist (L.points i3) (L.points i2) < dist (L.points i3) (L.points i1) := by
        simpa [Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCapRev_points, hidx3,
            hi1rev, hi2rev] using hmonoB hi12
      simpa [hlast3] using htmp
    -- `near := L i2` (v₁-nearer, v₂-farther), `far := L i1`.
    have hnear_ne_v2 : L.points i2 ≠ S.triangle.v2 := by
      intro h; have : i2 = i0 := L.injective (by simpa [hfirst0] using h); simpa [i0, i2] using this
    have hnear_ne_v1 : L.points i2 ≠ S.triangle.v1 := by
      intro h; have : i2 = i3 := L.injective (by simpa [hlast3] using h); simpa [i2, i3] using this
    have hfar_ne_v2 : L.points i1 ≠ S.triangle.v2 := by
      intro h; have : i1 = i0 := L.injective (by simpa [hfirst0] using h); simpa [i0, i1] using this
    have hfar_ne_v1 : L.points i1 ≠ S.triangle.v1 := by
      intro h; have : i1 = i3 := L.injective (by simpa [hlast3] using h); simpa [i1, i3] using this
    have hnearI3 : L.points i2 ∈ S.I3 := by
      unfold Problem97.FiniteEndpointShell.I3
      exact Finset.mem_erase.mpr ⟨hnear_ne_v2, Finset.mem_erase.mpr ⟨hnear_ne_v1, hL_i2_C3⟩⟩
    have hfarI3 : L.points i1 ∈ S.I3 := by
      unfold Problem97.FiniteEndpointShell.I3
      exact Finset.mem_erase.mpr ⟨hfar_ne_v2, Finset.mem_erase.mpr ⟨hfar_ne_v1, hL_i1_C3⟩⟩
    have hpair_sub : ({L.points i2, L.points i1} : Finset ℝ²) ⊆ S.I3 := by
      intro x hx
      rcases Finset.mem_insert.mp hx with hx | hx
      · simpa [hx] using hnearI3
      · have hx' : x = L.points i1 := by simpa using hx
        simpa [hx'] using hfarI3
    have hpair_card : ({L.points i2, L.points i1} : Finset ℝ²).card = 2 := by
      simp [hne12.symm]
    have hI3le : S.I3.card ≤ ({L.points i2, L.points i1} : Finset ℝ²).card := by
      rw [S.I3_card_eq_two, hpair_card]
    refine ⟨L.points i2, L.points i1, ?_, hv1order, hv2order⟩
    exact Finset.eq_of_subset_of_card_le hpair_sub hI3le

/-- Cap-order opposite-sign producer for the `q'=E` lower-arc column.  The two
`I₃` vertices sit in strictly opposite cap-order on `C₃` (`I3_cap_order_chain`):
one is `v₁`-nearer/`v₂`-farther, the other `v₁`-farther/`v₂`-nearer.  Hence the
product of their squared-distance differences to `v₂` and `v₁` is strictly
negative.  This is exactly the `hcap_opp` input that
`qEqE_lowerArc_impossible` contradicts against the same-sign keystone, and the
conclusion is orientation-robust (the product `< 0` holds for either assignment
of `{q, qs}` to the two cap vertices). -/
theorem qEqE_capOrder_opposite
    {A : Finset ℝ²} (S : FiniteEndpointShell A) {q qs : ℝ²}
    (hqI3 : q ∈ S.I3) (hqsI3 : qs ∈ S.I3) (hne : q ≠ qs) :
    (dist S.triangle.v2 qs ^ 2 - dist S.triangle.v2 q ^ 2)
      * (dist S.triangle.v1 qs ^ 2 - dist S.triangle.v1 q ^ 2) < 0 := by
  classical
  obtain ⟨near, far, hset, h1, h2⟩ := S.I3_cap_order_chain
  rw [← hset] at hqI3 hqsI3
  simp only [Finset.mem_insert, Finset.mem_singleton] at hqI3 hqsI3
  rcases hqI3 with hq | hq <;> rcases hqsI3 with hqs | hqs <;> subst hq <;> subst hqs
  · exact absurd rfl hne
  · -- q ↦ near (v₁-near, v₂-far), qs ↦ far:  h1 : |v₁q|<|v₁qs|, h2 : |v₂qs|<|v₂q|
    have hA : dist S.triangle.v2 qs ^ 2 - dist S.triangle.v2 q ^ 2 < 0 := by
      nlinarith [h2, (dist_nonneg : (0 : ℝ) ≤ dist S.triangle.v2 q),
        (dist_nonneg : (0 : ℝ) ≤ dist S.triangle.v2 qs)]
    have hB : 0 < dist S.triangle.v1 qs ^ 2 - dist S.triangle.v1 q ^ 2 := by
      nlinarith [h1, (dist_nonneg : (0 : ℝ) ≤ dist S.triangle.v1 q),
        (dist_nonneg : (0 : ℝ) ≤ dist S.triangle.v1 qs)]
    exact mul_neg_of_neg_of_pos hA hB
  · -- q ↦ far (v₁-far, v₂-near), qs ↦ near:  h1 : |v₁qs|<|v₁q|, h2 : |v₂q|<|v₂qs|
    have hA : 0 < dist S.triangle.v2 qs ^ 2 - dist S.triangle.v2 q ^ 2 := by
      nlinarith [h2, (dist_nonneg : (0 : ℝ) ≤ dist S.triangle.v2 q),
        (dist_nonneg : (0 : ℝ) ≤ dist S.triangle.v2 qs)]
    have hB : dist S.triangle.v1 qs ^ 2 - dist S.triangle.v1 q ^ 2 < 0 := by
      nlinarith [h1, (dist_nonneg : (0 : ℝ) ≤ dist S.triangle.v1 q),
        (dist_nonneg : (0 : ℝ) ≤ dist S.triangle.v1 qs)]
    exact mul_neg_of_pos_of_neg hA hB
  · exact absurd rfl hne

/-- The selector packet from `selectorShape_v2_split`, factored out so later
`N4d-b` branches can refer to it without repeating the full proposition. -/
private def SelectorV2SplitPacket
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) (r : ℝ) : Prop :=
  let T := S.witnessClassAt_v2 r
  T.card = 4 ∧
  S.I2 ⊆ T ∧
  ((∃ p : ℝ²,
      p ∈ ({Z.a1, Z.b1, S.triangle.v3} : Finset ℝ²) ∧
      T ∩ S.CP.C1 = ({p} : Finset ℝ²) ∧
      T ∩ S.CP.C3 = ({S.triangle.v1} : Finset ℝ²)) ∨
   (∃ p : ℝ²,
      p ∈ ({Z.a1, Z.b1, S.triangle.v3} : Finset ℝ²) ∧
      T ∩ S.CP.C1 = ({p} : Finset ℝ²) ∧
      T ∩ S.CP.C3 = ({Z.a3} : Finset ℝ²)) ∨
   (∃ p : ℝ²,
      p ∈ ({Z.a1, Z.b1, S.triangle.v3} : Finset ℝ²) ∧
      T ∩ S.CP.C1 = ({p} : Finset ℝ²) ∧
      T ∩ S.CP.C3 = ({Z.b3} : Finset ℝ²)))

/-- The `q = v₁` row inside the forced `v₂` selector.  The selector contains
the whole opposite interior pair `I₂`, meets `C₃` in the endpoint `v₁`, and
meets `C₁` in one named point from `{a₁,b₁,v₃}`. -/
private def SelectorV2Qv1Packet
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) (r : ℝ) : Prop :=
  let T := S.witnessClassAt_v2 r
  T.card = 4 ∧
  S.I2 ⊆ T ∧
  ∃ p : ℝ²,
    p ∈ ({Z.a1, Z.b1, S.triangle.v3} : Finset ℝ²) ∧
    T ∩ S.CP.C1 = ({p} : Finset ℝ²) ∧
    T ∩ S.CP.C3 = ({S.triangle.v1} : Finset ℝ²)

/-- The selector packet from `selectorShape_v3_split`, factored out so later
`N4d-b3/b5` branches can refer to it without repeating the full proposition. -/
private def SelectorV3SplitPacket
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) (r : ℝ) : Prop :=
  let T := S.witnessClassAt_v3 r
  T.card = 4 ∧
  S.I3 ⊆ T ∧
  ((∃ p : ℝ²,
      p ∈ ({Z.a1, Z.b1, S.triangle.v2} : Finset ℝ²) ∧
      T ∩ S.CP.C1 = ({p} : Finset ℝ²) ∧
      T ∩ S.CP.C2 = ({S.triangle.v1} : Finset ℝ²)) ∨
   (∃ p : ℝ²,
      p ∈ ({Z.a1, Z.b1, S.triangle.v2} : Finset ℝ²) ∧
      T ∩ S.CP.C1 = ({p} : Finset ℝ²) ∧
      T ∩ S.CP.C2 = ({Z.a2} : Finset ℝ²)) ∨
   (∃ p : ℝ²,
      p ∈ ({Z.a1, Z.b1, S.triangle.v2} : Finset ℝ²) ∧
      T ∩ S.CP.C1 = ({p} : Finset ℝ²) ∧
      T ∩ S.CP.C2 = ({Z.b2} : Finset ℝ²)))

/-- The `q = v₁` row inside the forced `v₃` selector. -/
private def SelectorV3Qv1Packet
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) (r : ℝ) : Prop :=
  let T := S.witnessClassAt_v3 r
  ∃ p : ℝ²,
    p ∈ ({Z.a1, Z.b1, S.triangle.v2} : Finset ℝ²) ∧
    T ∩ S.CP.C1 = ({p} : Finset ℝ²) ∧
    T ∩ S.CP.C2 = ({S.triangle.v1} : Finset ℝ²)

/-- The `q = a₂` row inside the forced `v₃` selector.  The selector contains
the whole opposite interior pair `I₃`, meets `C₁` in one named point, and
meets `C₂` in the selected witness `a₂`. -/
private def SelectorV3Qa2Packet
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) (r : ℝ) : Prop :=
  let T := S.witnessClassAt_v3 r
  S.I3 ⊆ T ∧
  ∃ p : ℝ²,
    p ∈ ({Z.a1, Z.b1, S.triangle.v2} : Finset ℝ²) ∧
    T ∩ S.CP.C1 = ({p} : Finset ℝ²) ∧
    T ∩ S.CP.C2 = ({Z.a2} : Finset ℝ²)

/-- The `p = v₂` rows inside the forced `v₃` selector.  The selector contains
the whole lower witness pair `I₃`, meets `C₁` in the named point `v₂`, and
meets `C₂` in one of the two upper witnesses `a₂` or `b₂`.  This is the exact
theorem-facing packet for `N4d-bB-3`. -/
def SelectorV3Pv2Packet
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) (r : ℝ) : Prop :=
  let T := S.witnessClassAt_v3 r
  S.I3 ⊆ T ∧
  T ∩ S.CP.C1 = ({S.triangle.v2} : Finset ℝ²) ∧
  ((T ∩ S.CP.C2 = ({Z.a2} : Finset ℝ²)) ∨
   (T ∩ S.CP.C2 = ({Z.b2} : Finset ℝ²)))

/-- Lean-facing shell export for the `q = a₂` row of `N4d-b3`: on the circle
centered at `v₃` with radius `|v₃a₂|`, the lower-chain interior set `I₃`
contributes at most one point.  The coordinate proof is pinned in the prose;
this name records the exact consumer shape used by the selector contradiction. -/
abbrev I3OnV3RadiusAtA2CardLeOne
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) : Prop :=
  (S.I3.filter (fun x => dist S.triangle.v3 x = dist S.triangle.v3 Z.a2)).card ≤ 1

/-- Stronger local no-hit form of the `q = a₂` shell export.  This is
sanctioned in the prose only as an implementation convenience: if the
circle centered at `v₃` with radius `|v₃a₂|` meets no point of `I₃`, then the
published shell bound `I3OnV3RadiusAtA2CardLeOne` follows immediately. -/
abbrev I3NoPointOnV3RadiusAtA2
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) : Prop :=
  ∀ x ∈ S.I3, dist S.triangle.v3 x ≠ dist S.triangle.v3 Z.a2

/-- Branch-local normalized height-gap packet for the `q = a₂` row of
`N4d-b3`. The full `delta` computation is pinned in the prose; this interface
records only the exact outputs the Lean consumer needs:

* after a similarity transport `T`, the radius `|v₃a₂|` becomes strictly
  smaller than the second coordinate of the transported center `T(v₃)`;
* every lower-chain interior point of `I₃` has negative second coordinate.

From this packet, the stronger no-hit statement
`I3NoPointOnV3RadiusAtA2` is immediate. -/
abbrev I3V3A2NormalizedHeightGap
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) : Prop :=
  ∃ T : ℝ² → ℝ², ∃ tau : Problem97.CGN.SimilarityTransportData T,
    dist (T S.triangle.v3) (T Z.a2) < (T S.triangle.v3) 1 ∧
    ∀ x ∈ S.I3, (T x) 1 < 0

/-- The theorem-level normalization input pinned in the prose for the
`q = a₂` row of `N4d-b3`.  Under the forced branch packet, one may choose a
similarity chart in which the selected support endpoints are normalized to
`(0,0)` and `(1,0)`, the selected upper witness is `(1/2, √3/2)`, the apex
has the `delta`-parameterized form `2 cos δ (cos δ, sin δ)`, and every lower
interior point of `I₃` has negative second coordinate. -/
abbrev I3V3A2DeltaNormalization
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) : Prop :=
  ∃ T : ℝ² → ℝ², ∃ tau : Problem97.CGN.SimilarityTransportData T, ∃ δ : ℝ,
    T S.triangle.v1 = Problem97.CGN.vec2 0 0 ∧
    T S.triangle.v2 = Problem97.CGN.vec2 1 0 ∧
    T Z.a2 = Problem97.CGN.vec2 ((1 : ℝ) / 2) (Real.sqrt 3 / 2) ∧
    T S.triangle.v3 =
      Problem97.CGN.vec2
        (2 * Real.cos δ * Real.cos δ)
        (2 * Real.cos δ * Real.sin δ) ∧
    Real.pi / 4 ≤ δ ∧ δ < Real.pi / 3 ∧
    ∀ x ∈ S.I3, (T x) 1 < 0

private theorem dist_sq_eq_coord_sq_add_coord_sq (x y : ℝ²) :
    dist x y ^ 2 = (x 0 - y 0) ^ 2 + (x 1 - y 1) ^ 2 := by
  rw [dist_eq_norm, EuclideanSpace.norm_sq_eq]
  simp [Fin.sum_univ_two, sq_abs, Real.norm_eq_abs, PiLp.sub_apply]

/-- **(A) Affine identity** for the `q'=E` column.  When `qs` and `q` lie on a
common circle centred at `v₃` (`hD : |v₃ qs| = |v₃ q|`), each squared-distance
difference to `v₂` and to `v₁` is twice the corresponding dot product of
`w := qs − q` against `v₃ − v₂` and `v₃ − v₁`:

```text
|v₂ qs|² − |v₂ q|² = 2 w·(v₃ − v₂),   |v₁ qs|² − |v₁ q|² = 2 w·(v₃ − v₁).
```

Pure coordinate algebra (`linear_combination` on the `v₃`-circle equality).
The right-hand dot products are the two linear functionals whose common sign is
the content of the lower-arc same-sign step (B); combined with the cap-order
*opposite*-sign pairing `I3_cap_order_chain`, they close the `q'=E` rows. -/
theorem qEqE_affine_identity {A : Finset ℝ²} (S : FiniteEndpointShell A)
    {q qs : ℝ²}
    (hD : dist S.triangle.v3 qs = dist S.triangle.v3 q) :
    dist S.triangle.v2 qs ^ 2 - dist S.triangle.v2 q ^ 2
        = 2 * ((qs 0 - q 0) * (S.triangle.v3 0 - S.triangle.v2 0)
             + (qs 1 - q 1) * (S.triangle.v3 1 - S.triangle.v2 1)) ∧
    dist S.triangle.v1 qs ^ 2 - dist S.triangle.v1 q ^ 2
        = 2 * ((qs 0 - q 0) * (S.triangle.v3 0 - S.triangle.v1 0)
             + (qs 1 - q 1) * (S.triangle.v3 1 - S.triangle.v1 1)) := by
  have hDsq : dist S.triangle.v3 qs ^ 2 = dist S.triangle.v3 q ^ 2 := by rw [hD]
  simp only [dist_sq_eq_coord_sq_add_coord_sq] at hDsq ⊢
  refine ⟨?_, ?_⟩ <;> linear_combination hDsq

/-! ### `q'=E` lower-arc sign-block — Phase-0 machinery

The crux of the `q'=E` column (`qEqE_lowerArc_sameSign`, not yet assembled) is
the *same-sign* claim

```text
((q*−q)·(D−B)) · ((q*−q)·(D−A)) > 0
```

for a free lower-arc point `q*` on the circle `Γ` centred at `D` through `q`.
By the affine identity `qEqE_affine_identity` this equals
`(|Bq*|²−|Bq|²)·(|Aq*|²−|Aq|²)/4`, so it is the statement that the two
distance-order differences agree in sign.  The sound route (adjudication §3.3)
parametrizes `Γ` by angle `t` about `D`, writes each linear functional as a
sinusoid, and locates its two zeros; both *second* zeros (`E` for the `D−B`
functional, the `AD`-reflection `qref` of `q` for the `D−A` functional) are
*upper*, so the product carries a single sign on the lower arc.

These four lemmas are the reusable Phase-0 atoms for that argument, in the
`q'=C` coordinate angle-frame (`A=(0,0)`, `B=(1,0)`, `D=B+r(cos δ,sin δ)`,
`q=B+r(cos(2δ−ε),sin(2δ−ε))` the `BD`-reflection of `E`):

* `qEqE_gamma_param_dist`  — the angle parametrization `P(t)=D+ρ(cos t,sin t)`
  lies on the circle of radius `|ρ|` about `D` (here `ρ = r·S`, `S = |Dq|/r`).
* `qEqE_f1_sinusoid` / `qEqE_f2_sinusoid` — the two linear functionals
  `(P(t)−q)·(D−B)` and `(P(t)−q)·(D−A)`, in closed sinusoid form, with
  `S² = 2−2 cos(δ−ε)` (so `ρ = r·S = |Dq|`).  The `D−B` functional collapses to
  the single-cosine form `r²·S·(cos(t−δ)+S/2)`, exposing its zeros at
  `cos(t−δ)=−S/2`; the `D−A` functional keeps a constant offset (its two zeros
  are `q` and `qref`).
* `qEqE_qref_angle_arith` — the angle-arithmetic core: the `AD`-reflection
  `ψ ↦ 2φ−ψ` sends the polar angle `ψ∈(−π/2,0)` of `q` (about `A`) into `(0,π)`
  whenever the polar angle `φ` of `D` lies in `(0,π/4)`, i.e. `qref` is upper.

What remains for Phase 1 (the still-blocked step): the constant-sign / arc
argument that ties these together — `f1·f2` has a *double* zero at `q` and its
only *simple* zeros at the two upper points `E`, `qref`, so it keeps one sign on
the connected lower arc.  This is an intermediate-value statement over the
circle (Mathlib's `Real.Angle.sign_eq_of_continuousOn` is the candidate tool);
`nlinarith`/SMT are ruled out (the product touches `0` on the boundary `q*→q`,
so there is no low-degree Positivstellensatz certificate). -/

/-- **(0a)** The angle parametrization `P(t) = D + ρ·(cos t, sin t)` of the
`D`-centred circle lies at distance `|ρ|` from `D`.  Pure coordinate algebra. -/
private theorem qEqE_gamma_param_dist (Dx Dy ρ t : ℝ) :
    Real.sqrt (((Dx + ρ * Real.cos t) - Dx) ^ 2 + ((Dy + ρ * Real.sin t) - Dy) ^ 2) = |ρ| := by
  have hsq :
      ((Dx + ρ * Real.cos t) - Dx) ^ 2 + ((Dy + ρ * Real.sin t) - Dy) ^ 2 = ρ ^ 2 := by
    nlinarith [Real.sin_sq_add_cos_sq t]
  rw [hsq, Real.sqrt_sq_eq_abs]

/-- **(0b, `D−B` functional)** Closed sinusoid form of the first linear
functional `(P(t)−q)·(D−B)` along the angle parametrization of `Γ`, in the
`q'=E` frame.  With `S² = 2−2 cos(δ−ε)` and `ρ = r·S`, the `D−B` functional
collapses to a single-cosine sinusoid `r²·S·(cos(t−δ)+S/2)`, whose zeros sit at
`cos(t−δ)=−S/2` (the angles of `q` and `E` about `D`).  Pure trig algebra. -/
private theorem qEqE_f1_sinusoid (r δ ε t S : ℝ) (hS : S ^ 2 = 2 - 2 * Real.cos (δ - ε)) :
    ((((1 + r * Real.cos δ) + r * S * Real.cos t) - (1 + r * Real.cos (2 * δ - ε)))
          * ((1 + r * Real.cos δ) - 1)
        + (((r * Real.sin δ) + r * S * Real.sin t) - r * Real.sin (2 * δ - ε))
          * ((r * Real.sin δ) - 0))
      = r ^ 2 * S * (Real.cos (t - δ) + S / 2) := by
  have e1 :
      Real.cos (2 * δ - ε)
        = (2 * Real.cos δ ^ 2 - 1) * Real.cos ε + (2 * Real.sin δ * Real.cos δ) * Real.sin ε := by
    rw [show (2 * δ - ε) = 2 * δ + (-ε) by ring, Real.cos_add, Real.cos_two_mul,
        Real.sin_two_mul, Real.cos_neg, Real.sin_neg]; ring
  have e2 :
      Real.sin (2 * δ - ε)
        = (2 * Real.sin δ * Real.cos δ) * Real.cos ε - (2 * Real.cos δ ^ 2 - 1) * Real.sin ε := by
    rw [show (2 * δ - ε) = 2 * δ + (-ε) by ring, Real.sin_add, Real.cos_two_mul,
        Real.sin_two_mul, Real.cos_neg, Real.sin_neg]; ring
  have e3 : Real.cos (t - δ) = Real.cos t * Real.cos δ + Real.sin t * Real.sin δ :=
    Real.cos_sub t δ
  have hSe : S ^ 2 = 2 - 2 * (Real.cos δ * Real.cos ε + Real.sin δ * Real.sin ε) := by
    rw [hS, Real.cos_sub]
  have hp : Real.sin δ ^ 2 + Real.cos δ ^ 2 = 1 := Real.sin_sq_add_cos_sq δ
  rw [e1, e2, e3]
  linear_combination (-r ^ 2 * (2 * Real.cos δ * Real.cos ε - 1)) * hp + (-r ^ 2 / 2) * hSe

/-- **(0b, `D−A` functional)** Closed sinusoid form of the second linear
functional `(P(t)−q)·(D−A)` along the angle parametrization of `Γ`.  Here
`D−A = D`, so the functional retains a constant offset (its two zeros are `q`
and the `AD`-reflection `qref` of `q`).  Pure trig algebra. -/
private theorem qEqE_f2_sinusoid (r δ ε t S : ℝ) :
    ((((1 + r * Real.cos δ) + r * S * Real.cos t) - (1 + r * Real.cos (2 * δ - ε)))
          * (1 + r * Real.cos δ)
        + (((r * Real.sin δ) + r * S * Real.sin t) - r * Real.sin (2 * δ - ε))
          * (r * Real.sin δ))
      = r * S * ((1 + r * Real.cos δ) * Real.cos t + r * Real.sin δ * Real.sin t)
        + r * (r - r * (Real.cos δ * Real.cos ε + Real.sin δ * Real.sin ε) + Real.cos δ
               - ((2 * Real.cos δ ^ 2 - 1) * Real.cos ε
                  + (2 * Real.sin δ * Real.cos δ) * Real.sin ε)) := by
  have e1 :
      Real.cos (2 * δ - ε)
        = (2 * Real.cos δ ^ 2 - 1) * Real.cos ε + (2 * Real.sin δ * Real.cos δ) * Real.sin ε := by
    rw [show (2 * δ - ε) = 2 * δ + (-ε) by ring, Real.cos_add, Real.cos_two_mul,
        Real.sin_two_mul, Real.cos_neg, Real.sin_neg]; ring
  have e2 :
      Real.sin (2 * δ - ε)
        = (2 * Real.sin δ * Real.cos δ) * Real.cos ε - (2 * Real.cos δ ^ 2 - 1) * Real.sin ε := by
    rw [show (2 * δ - ε) = 2 * δ + (-ε) by ring, Real.sin_add, Real.cos_two_mul,
        Real.sin_two_mul, Real.cos_neg, Real.sin_neg]; ring
  have hp : Real.sin δ ^ 2 + Real.cos δ ^ 2 = 1 := Real.sin_sq_add_cos_sq δ
  rw [e1, e2]
  linear_combination (-r ^ 2 * (2 * Real.cos δ * Real.cos ε - 1)) * hp

/-- **(0d, angle-arithmetic core)** The `AD`-reflection `ψ ↦ 2φ−ψ` sends the
polar angle `ψ ∈ (−π/2,0)` of `q` (about `A`) into the *open upper* range
`(0,π)` whenever the polar angle `φ` of `D` (about `A`) lies in `(0,π/4)`.  This
is the algebraic heart of `qref` upper (`qref_y > 0`); deriving the bounds
`φ∈(0,π/4)`, `ψ∈(−π/2,0)` from the packet cosine constraints and converting
`2φ−ψ∈(0,π)` to `qref_y > 0` are the remaining (still-open) Phase-1 steps. -/
private theorem qEqE_qref_angle_arith (φ ψ : ℝ)
    (hφlo : 0 < φ) (hφhi : φ < Real.pi / 4)
    (hψlo : -(Real.pi / 2) < ψ) (hψhi : ψ < 0) :
    0 < 2 * φ - ψ ∧ 2 * φ - ψ < Real.pi := by
  refine ⟨by linarith, by linarith [Real.pi_pos]⟩

/-- **Phase-1 keystone reduction** for the `q'=E` lower-arc sign-block.

The gating same-sign claim of the `q'=E` column is `f1·f2 ≥ 0` for the two
linear functionals along `Γ`, in the Phase-0 closed forms (`qEqE_f1_sinusoid`
RHS `= r²·S·(cos(t−δ)+S/2)` and `qEqE_f2_sinusoid` RHS).  Via the Gröbner-exact
master identity `f2 = f1 + r·wxb` (with `wxb = S·cos t + cosδ − cos(2δ−ε)`,
reduced mod `S² = 2−2cos(δ−ε)`), the product collapses:

```text
f1·f2 = f1·(f1 + r·wxb) = r³·S·(r·S·U² + U·wxb),    U := cos(t−δ)+S/2,
```

so since `r³S > 0` and `r·S·U² ≥ 0`, the entire two-sinusoid product crux
reduces to the **single scalar inequality** `hUwxb : 0 ≤ U·wxb`.  This step is
purely algebraic — it consumes neither `hlower` nor the reflection pin
`η=2δ−ε`; all of that data is needed only to discharge `hUwxb` itself.

`hUwxb` is the *one-cosine crux* `cos(t−β) ≤ cosδ` (`β := arccos(−S/2)`,
`U·wxb = 2S·sin²(·)·(cosδ − cos(t−β))`).  It is EMPIRICALLY VERIFIED
(0/15726 in-packet evals) and PROVEN on paper (the lower conditions force
`|reduced(t−β)| ≥ δ`, then `cos` is decreasing on `[0,π]`), but it has **no
polynomial certificate at any degree** (six Positivstellensatz formulations
infeasible; `nlinarith`/SMT/SOS ruled out) — closing it needs the angle-interval
(`Real.Angle`) development, tracked as the lone remaining `q'=E` sub-project.
See `docs/n-lane/97-n4d-qeqe-phase1-signblock.md`.  Carrying `hUwxb` as a hypothesis
here lets the rest of the column (affine identity, cap-order) wire in parallel,
with only the one angle lemma gating final closure. -/
private theorem qEqE_signblock_reduction (r δ ε t S : ℝ) (hr : 0 < r) (hS : 0 < S)
    (hS2 : S ^ 2 = 2 - 2 * Real.cos (δ - ε))
    (hUwxb : 0 ≤ (Real.cos (t - δ) + S / 2)
              * (S * Real.cos t + Real.cos δ - Real.cos (2 * δ - ε))) :
    0 ≤ (r ^ 2 * S * (Real.cos (t - δ) + S / 2))
        * (r * S * ((1 + r * Real.cos δ) * Real.cos t
              + r * Real.sin δ * Real.sin t)
           + r * (r - r * (Real.cos δ * Real.cos ε + Real.sin δ * Real.sin ε)
                + Real.cos δ
                - ((2 * Real.cos δ ^ 2 - 1) * Real.cos ε
                   + (2 * Real.sin δ * Real.cos δ) * Real.sin ε))) := by
  have hcsub : Real.cos (t - δ)
      = Real.cos t * Real.cos δ + Real.sin t * Real.sin δ := Real.cos_sub t δ
  have he1 : Real.cos (2 * δ - ε)
      = (2 * Real.cos δ ^ 2 - 1) * Real.cos ε
        + (2 * Real.sin δ * Real.cos δ) * Real.sin ε := by
    rw [show (2 * δ - ε) = 2 * δ + (-ε) by ring, Real.cos_add, Real.cos_two_mul,
        Real.sin_two_mul, Real.cos_neg, Real.sin_neg]; ring
  have hcsd : Real.cos (δ - ε)
      = Real.cos δ * Real.cos ε + Real.sin δ * Real.sin ε := Real.cos_sub δ ε
  have hSe : S ^ 2 = 2 - 2 * (Real.cos δ * Real.cos ε + Real.sin δ * Real.sin ε) := by
    rw [hS2, hcsd]
  set U := Real.cos (t - δ) + S / 2 with hU
  have key : (r ^ 2 * S * U)
        * (r * S * ((1 + r * Real.cos δ) * Real.cos t
              + r * Real.sin δ * Real.sin t)
           + r * (r - r * (Real.cos δ * Real.cos ε + Real.sin δ * Real.sin ε)
                + Real.cos δ
                - ((2 * Real.cos δ ^ 2 - 1) * Real.cos ε
                   + (2 * Real.sin δ * Real.cos δ) * Real.sin ε)))
      = r ^ 3 * S * (r * S * U ^ 2
          + U * (S * Real.cos t + Real.cos δ - Real.cos (2 * δ - ε))) := by
    rw [he1, hU, hcsub]
    linear_combination
      (-(S * r ^ 4 * (Real.cos t * Real.cos δ + Real.sin t * Real.sin δ + S / 2)) / 2) * hSe
  rw [show (r ^ 2 * S * (Real.cos (t - δ) + S / 2)) = (r ^ 2 * S * U) by rw [hU], key]
  have h3 : 0 ≤ r * S * U ^ 2
        + U * (S * Real.cos t + Real.cos δ - Real.cos (2 * δ - ε)) := by
    have h2 : 0 ≤ r * S * U ^ 2 := by positivity
    have hb : 0 ≤ U * (S * Real.cos t + Real.cos δ - Real.cos (2 * δ - ε)) := hUwxb
    linarith
  exact mul_nonneg (by positivity) h3

/-! ### `q'=E` lower-arc sign-block — Phase-2: the one-cosine crux, closed

`qEqE_signblock_reduction` left the entire `q'=E` sign-block gated on the single
inequality `hUwxb : 0 ≤ U·wxb`.  The lemmas here discharge it **unconditionally**
from the geometric packet, so `qEqE_lowerArc_sameSign` below closes `f1·f2 ≥ 0`.

Contrary to the Phase-1 prognosis (`docs/n-lane/97-n4d-qeqe-phase1-signblock.md`), the
crux needs **no** `Real.Angle`/`arccos` development.  With the explicit witness
`Z = √(1 − S²/4)` (so `n := (−S/2, Z)` is the relevant unit vector), the master
factorization `U·wxb = S·(1 − ⟨m,n⟩)·(cosδ − cos(t−β))` (`m := (cos t, sin t)`)
reduces it to (i) Cauchy–Schwarz `⟨m,n⟩ ≤ 1` and (ii) `cos(t−β) ≤ cosδ`, the
latter by a squaring argument whose only packet input is
`sinε·(2 sinδ − sin(2δ−ε)) ≥ 0` (immediate from `sinε,sinδ>0`, `sin(2δ−ε)<0`).
No polynomial certificate is used — the `√` witness is exactly what the
degree-bounded Positivstellensatz search (`dead-ends.md`) could not express. -/
namespace QEqEOneCosine

private lemma cs_bound (ct st nx ny : ℝ) (hpt : ct ^ 2 + st ^ 2 = 1)
    (hn1 : nx ^ 2 + ny ^ 2 = 1) : ct * nx + st * ny ≤ 1 := by
  have h : 0 ≤ (ct - nx) ^ 2 + (st - ny) ^ 2 := by positivity
  nlinarith [h, hpt, hn1]

private lemma cd_nonneg (r cd sd ce se : ℝ) (hr : 0 < r)
    (hpd : cd ^ 2 + sd ^ 2 = 1) (hpe : ce ^ 2 + se ^ 2 = 1)
    (hsd : 0 < sd) (hse : 0 < se) (hce : ce < -(r / 2)) (hcd : -(r / 2) < cd)
    (hs2de' : 2 * sd * cd * ce - (2 * cd ^ 2 - 1) * se < 0)
    (hc2de' : (2 * cd ^ 2 - 1) * ce + 2 * sd * cd * se < -(r / 2)) : 0 ≤ cd := by
  nlinarith [hpd, hpe, hsd, hse, hce, hcd, hs2de', hc2de', mul_pos hsd hse, sq_nonneg sd,
    mul_pos hr hse, hr, mul_pos hsd hsd]

private lemma sz_eq (S Z cd sd ce se : ℝ) (hS : 0 < S) (hZ : 0 ≤ Z)
    (hZsq : Z ^ 2 = 1 - S ^ 2 / 4) (hS2 : S ^ 2 = 2 - 2 * (cd * ce + sd * se))
    (hpd : cd ^ 2 + sd ^ 2 = 1) (hpe : ce ^ 2 + se ^ 2 = 1)
    (hsed : 0 ≤ se * cd - ce * sd) : S * Z = se * cd - ce * sd := by
  have hSZsq : (S * Z) ^ 2 = (se * cd - ce * sd) ^ 2 := by
    have hexp : (S * Z) ^ 2 = S ^ 2 * (Z ^ 2) := by ring
    rw [hexp, hZsq]
    linear_combination (-(S ^ 2 - 2 * cd * ce - 2 * sd * se - 2) / 4) * hS2
      + (-ce ^ 2 - se ^ 2) * hpd + (-1 : ℝ) * hpe
  have hSZnn : 0 ≤ S * Z := mul_nonneg (le_of_lt hS) hZ
  nlinarith [hSZsq, hSZnn, hsed, sq_nonneg (S * Z - (se * cd - ce * sd))]

private lemma E_nonneg (S Z cd sd ce se st : ℝ)
    (hsd : 0 < sd) (hse : 0 < se) (hcd0 : 0 ≤ cd) (hZ : 0 ≤ Z) (hS : 0 < S)
    (hst_le : S * st + sd ≤ 0) (hSZ : S * Z = se * cd - ce * sd)
    (hS2 : S ^ 2 = 2 - 2 * (cd * ce + sd * se))
    (hpd : cd ^ 2 + sd ^ 2 = 1) (hpe : ce ^ 2 + se ^ 2 = 1)
    (hs2de' : 2 * sd * cd * ce - (2 * cd ^ 2 - 1) * se < 0) :
    0 ≤ cd ^ 2 + st ^ 2 - S ^ 2 / 4 - 2 * Z * cd * st := by
  have hS2pos : 0 < S ^ 2 := by positivity
  have hT : 0 ≤ se * (2 * sd - (2 * sd * cd * ce - (2 * cd ^ 2 - 1) * se)) :=
    mul_nonneg (le_of_lt hse) (by linarith)
  set EsmaxS2 := -S ^ 4 / 4 + S ^ 2 * cd ^ 2 + 2 * S * Z * cd * sd + sd ^ 2 with hEs
  have hEsT : EsmaxS2 = se * (2 * sd - (2 * sd * cd * ce - (2 * cd ^ 2 - 1) * se)) := by
    rw [hEs]
    linear_combination (2 * cd * sd) * hSZ
      + (-(S ^ 2 - 4 * cd ^ 2 - 2 * cd * ce - 2 * sd * se + 2) / 4) * hS2
      + (-2 * cd * ce - ce ^ 2 - 2 * se ^ 2 + 2) * hpd + ((sd - 1) * (sd + 1)) * hpe
  have hEsmax : 0 ≤ EsmaxS2 := hEsT ▸ hT
  have hSZcd : 0 ≤ 2 * S * Z * cd := by positivity
  have hfac2 : S * st - sd - 2 * S * Z * cd ≤ 0 := by nlinarith [hst_le, hsd, hSZcd]
  have hprod : 0 ≤ (S * st + sd) * (S * st - sd - 2 * S * Z * cd) := by
    have h := mul_nonneg (neg_nonneg.mpr hst_le) (neg_nonneg.mpr hfac2); nlinarith [h]
  have hES2 : (cd ^ 2 + st ^ 2 - S ^ 2 / 4 - 2 * Z * cd * st) * S ^ 2
      = EsmaxS2 + (S * st + sd) * (S * st - sd - 2 * S * Z * cd) := by rw [hEs]; ring
  nlinarith [hES2, hEsmax, hprod, hS2pos]

private lemma one_cosine (S Z cd ct st : ℝ)
    (hS : 0 < S) (hZ : 0 ≤ Z) (hZsq : Z ^ 2 = 1 - S ^ 2 / 4)
    (hpt : ct ^ 2 + st ^ 2 = 1) (hcd0 : 0 ≤ cd) (hstneg : st < 0)
    (hE : 0 ≤ cd ^ 2 + st ^ 2 - S ^ 2 / 4 - 2 * Z * cd * st) :
    -(S / 2) * ct + Z * st ≤ cd := by
  have hZst : Z * st ≤ 0 := mul_nonpos_of_nonneg_of_nonpos hZ (le_of_lt hstneg)
  have hrhs : 0 ≤ cd - Z * st := by linarith
  have hsq : (S / 2 * |ct|) ^ 2 ≤ (cd - Z * st) ^ 2 := by
    have hct2 : ct ^ 2 = 1 - st ^ 2 := by linarith [hpt]
    have heq : (S / 2 * |ct|) ^ 2 = S ^ 2 / 4 * (1 - st ^ 2) := by rw [mul_pow, sq_abs, hct2]; ring
    rw [heq]; nlinarith [hE, hZsq]
  have habs : S / 2 * |ct| ≤ cd - Z * st := by
    have h1 : (0:ℝ) ≤ S / 2 * |ct| := by positivity
    nlinarith [hsq, h1, hrhs]
  have hnct : -ct ≤ |ct| := neg_le_abs ct
  have hmul : (S / 2) * (-ct) ≤ S / 2 * |ct| := mul_le_mul_of_nonneg_left hnct (by positivity)
  nlinarith [hmul, habs]

end QEqEOneCosine

set_option maxHeartbeats 400000 in
/-- **One-cosine crux, sign-fact interface** for the `q'=E` lower-arc
sign-block.  This is the reusable analytic core: the original packet derives
`0 ≤ cos δ` and `0 ≤ sin ε cos δ − cos ε sin δ` from the left-side pin
`cos ε < -r/2`; flipped-pin packets must supply these sign facts directly (or
derive them from a narrower no-wrap branch). -/
theorem qEqE_oneCosine_crux_of_signs (r δ ε t S : ℝ)
    (hr : 0 < r) (hS : 0 < S)
    (hS2eq : S ^ 2 = 2 - 2 * Real.cos (δ - ε))
    (hsd : 0 < Real.sin δ) (hse : 0 < Real.sin ε)
    (hcd0 : 0 ≤ Real.cos δ)
    (hsed : 0 ≤ Real.sin ε * Real.cos δ - Real.cos ε * Real.sin δ)
    (hs2de : Real.sin (2 * δ - ε) < 0)
    (hlower : r * Real.sin δ + r * S * Real.sin t < 0) :
    0 ≤ (Real.cos (t - δ) + S / 2)
        * (S * Real.cos t + Real.cos δ - Real.cos (2 * δ - ε)) := by
  set cd := Real.cos δ with hcd_def
  set sd := Real.sin δ with hsd_def
  set ce := Real.cos ε with hce_def
  set se := Real.sin ε with hse_def
  set ct := Real.cos t with hct_def
  set st := Real.sin t with hst_def
  have hpd : cd ^ 2 + sd ^ 2 = 1 := by rw [hcd_def, hsd_def, add_comm]; exact Real.sin_sq_add_cos_sq δ
  have hpe : ce ^ 2 + se ^ 2 = 1 := by rw [hce_def, hse_def, add_comm]; exact Real.sin_sq_add_cos_sq ε
  have hpt : ct ^ 2 + st ^ 2 = 1 := by rw [hct_def, hst_def, add_comm]; exact Real.sin_sq_add_cos_sq t
  have hc2de_eq : Real.cos (2 * δ - ε) = (2 * cd ^ 2 - 1) * ce + 2 * sd * cd * se := by
    rw [hcd_def, hce_def, hsd_def, hse_def,
        show (2 * δ - ε) = 2 * δ + (-ε) by ring, Real.cos_add, Real.cos_two_mul,
        Real.sin_two_mul, Real.cos_neg, Real.sin_neg]; ring
  have hs2de_eq : Real.sin (2 * δ - ε) = 2 * sd * cd * ce - (2 * cd ^ 2 - 1) * se := by
    rw [hcd_def, hce_def, hsd_def, hse_def,
        show (2 * δ - ε) = 2 * δ + (-ε) by ring, Real.sin_add, Real.cos_two_mul,
        Real.sin_two_mul, Real.cos_neg, Real.sin_neg]; ring
  have hcde_eq : Real.cos (δ - ε) = cd * ce + sd * se := by
    rw [hcd_def, hce_def, hsd_def, hse_def, Real.cos_sub]
  have hctd_eq : Real.cos (t - δ) = ct * cd + st * sd := by
    rw [hct_def, hcd_def, hst_def, hsd_def, Real.cos_sub]
  have hS2 : S ^ 2 = 2 - 2 * (cd * ce + sd * se) := by rw [hS2eq, hcde_eq]
  have hs2de' : 2 * sd * cd * ce - (2 * cd ^ 2 - 1) * se < 0 := by rw [← hs2de_eq]; exact hs2de
  have hcd0_cd : 0 ≤ cd := by simpa [hcd_def] using hcd0
  have hsed_cd : 0 ≤ se * cd - ce * sd := by
    simpa [hse_def, hcd_def, hce_def, hsd_def] using hsed
  have hcde_gt : -1 < cd * ce + sd * se := by
    nlinarith [mul_pos hsd hse, sq_nonneg (cd - ce), sq_nonneg (sd - se)]
  have h14 : (0:ℝ) ≤ 1 - S ^ 2 / 4 := by rw [hS2]; linarith
  set Z := Real.sqrt (1 - S ^ 2 / 4) with hZ_def
  have hZ : 0 ≤ Z := Real.sqrt_nonneg _
  have hZsq : Z ^ 2 = 1 - S ^ 2 / 4 := by rw [hZ_def, Real.sq_sqrt h14]
  have hSZ : S * Z = se * cd - ce * sd :=
    QEqEOneCosine.sz_eq S Z cd sd ce se hS hZ hZsq hS2 hpd hpe hsed_cd
  have hst_le : S * st + sd ≤ 0 := by nlinarith [hlower, hr]
  have hstneg : st < 0 := by nlinarith [hS, hsd, hst_le]
  set nx := -(S/2) * cd + Z * sd with hnx_def
  set ny := -(S/2) * sd - Z * cd with hny_def
  set ctb := -(S/2) * ct + Z * st with hctb_def
  have hn1 : nx ^ 2 + ny ^ 2 = 1 := by
    rw [hnx_def, hny_def]; linear_combination ((S ^ 2 + 4 * Z ^ 2) / 4) * hpd + hZsq
  have hwxbA : S * ct + cd - Real.cos (2 * δ - ε) = S * (ct - nx) := by
    rw [hc2de_eq, hnx_def]; linear_combination (-ce) * hpd + sd * hSZ + (-cd / 2) * hS2
  have hU_def : Real.cos (t - δ) + S / 2 = ct * cd + st * sd + S / 2 := by rw [hctd_eq]
  have hwxbB : (ct * cd + st * sd + S / 2) * (S * (ct - nx))
      = S * (1 - (ct * nx + st * ny)) * (cd - ctb) := by
    rw [hnx_def, hny_def, hctb_def]
    linear_combination (-S * Z * st) * hpd
      + (-S * (S ^ 2 * cd - 2 * S * Z * sd - 4 * cd) / 4) * hpt
      + (S * st * (cd * st - ct * sd)) * hZsq
  have hmaster : (Real.cos (t - δ) + S / 2) * (S * Real.cos t + Real.cos δ - Real.cos (2 * δ - ε))
      = S * (1 - (ct * nx + st * ny)) * (cd - ctb) := by
    rw [hU_def, ← hct_def, ← hcd_def, hwxbA, hwxbB]
  rw [hmaster]
  have hmn : ct * nx + st * ny ≤ 1 := QEqEOneCosine.cs_bound ct st nx ny hpt hn1
  have hfac1 : 0 ≤ S * (1 - (ct * nx + st * ny)) := mul_nonneg (le_of_lt hS) (by linarith [hmn])
  have hE : 0 ≤ cd ^ 2 + st ^ 2 - S ^ 2 / 4 - 2 * Z * cd * st :=
    QEqEOneCosine.E_nonneg S Z cd sd ce se st hsd hse hcd0_cd hZ hS hst_le hSZ hS2 hpd hpe hs2de'
  have hone : ctb ≤ cd := by
    rw [hctb_def]; exact QEqEOneCosine.one_cosine S Z cd ct st hS hZ hZsq hpt hcd0_cd hstneg hE
  have hfac3 : 0 ≤ cd - ctb := by linarith [hone]
  exact mul_nonneg hfac1 hfac3

set_option maxHeartbeats 400000 in
/-- **One-cosine crux** for the `q'=E` lower-arc sign-block (N4d, Phase-2):
discharges the `hUwxb` hypothesis of `qEqE_signblock_reduction` from the
original left-side geometric packet, via the explicit `√(1−S²/4)` witness +
Cauchy–Schwarz + a squaring argument (NO `Real.Angle`, NO polynomial
certificate; see the section comment above and
`docs/n-lane/97-n4d-qeqe-phase1-signblock.md`). -/
theorem qEqE_oneCosine_crux (r δ ε t S : ℝ)
    (hr : 0 < r) (hr1 : r < 1) (hS : 0 < S)
    (hS2eq : S ^ 2 = 2 - 2 * Real.cos (δ - ε))
    (hsd : 0 < Real.sin δ) (hcd : -(r / 2) < Real.cos δ)
    (hse : 0 < Real.sin ε) (hce : Real.cos ε < -(r / 2))
    (hs2de : Real.sin (2 * δ - ε) < 0) (hc2de : Real.cos (2 * δ - ε) < -(r / 2))
    (hlower : r * Real.sin δ + r * S * Real.sin t < 0) :
    0 ≤ (Real.cos (t - δ) + S / 2)
        * (S * Real.cos t + Real.cos δ - Real.cos (2 * δ - ε)) := by
  have hpd : Real.cos δ ^ 2 + Real.sin δ ^ 2 = 1 := by
    rw [add_comm]
    exact Real.sin_sq_add_cos_sq δ
  have hpe : Real.cos ε ^ 2 + Real.sin ε ^ 2 = 1 := by
    rw [add_comm]
    exact Real.sin_sq_add_cos_sq ε
  have hc2de_eq :
      Real.cos (2 * δ - ε) =
        (2 * Real.cos δ ^ 2 - 1) * Real.cos ε
          + 2 * Real.sin δ * Real.cos δ * Real.sin ε := by
    rw [show (2 * δ - ε) = 2 * δ + (-ε) by ring, Real.cos_add,
      Real.cos_two_mul, Real.sin_two_mul, Real.cos_neg, Real.sin_neg]
    ring
  have hs2de_eq :
      Real.sin (2 * δ - ε) =
        2 * Real.sin δ * Real.cos δ * Real.cos ε
          - (2 * Real.cos δ ^ 2 - 1) * Real.sin ε := by
    rw [show (2 * δ - ε) = 2 * δ + (-ε) by ring, Real.sin_add,
      Real.cos_two_mul, Real.sin_two_mul, Real.cos_neg, Real.sin_neg]
    ring
  have hs2de' :
      2 * Real.sin δ * Real.cos δ * Real.cos ε
          - (2 * Real.cos δ ^ 2 - 1) * Real.sin ε < 0 := by
    rw [← hs2de_eq]
    exact hs2de
  have hc2de' :
      (2 * Real.cos δ ^ 2 - 1) * Real.cos ε
          + 2 * Real.sin δ * Real.cos δ * Real.sin ε < -(r / 2) := by
    rw [← hc2de_eq]
    exact hc2de
  have hcd0 : 0 ≤ Real.cos δ :=
    QEqEOneCosine.cd_nonneg r (Real.cos δ) (Real.sin δ) (Real.cos ε) (Real.sin ε)
      hr hpd hpe hsd hse hce hcd hs2de' hc2de'
  have hsed : 0 ≤ Real.sin ε * Real.cos δ - Real.cos ε * Real.sin δ := by
    have h1 : 0 ≤ Real.sin ε * Real.cos δ := mul_nonneg (le_of_lt hse) hcd0
    have h2 : Real.cos ε * Real.sin δ < 0 := mul_neg_of_neg_of_pos (by linarith) hsd
    linarith
  exact qEqE_oneCosine_crux_of_signs r δ ε t S hr hS hS2eq hsd hse hcd0 hsed hs2de hlower

set_option maxHeartbeats 400000 in
/-- **`q'=E` lower-arc same-sign (piece B), unconditional.**  Composes the
keystone reduction `qEqE_signblock_reduction` with the one-cosine crux
`qEqE_oneCosine_crux`: from the geometric packet (`D` upper / `|AD|>1`,
`E` upper / `|AE|<1`, the reflection pin `η=2δ−ε`, and `q*` lower `hlower`),
the full sign-block `f1·f2 ≥ 0` holds in the Phase-0 closed forms — the last
analytic obligation of the `q'=E` column, discharged. -/
theorem qEqE_lowerArc_sameSign (r δ ε t S : ℝ)
    (hr : 0 < r) (hr1 : r < 1) (hS : 0 < S)
    (hS2eq : S ^ 2 = 2 - 2 * Real.cos (δ - ε))
    (hsd : 0 < Real.sin δ) (hcd : -(r / 2) < Real.cos δ)
    (hse : 0 < Real.sin ε) (hce : Real.cos ε < -(r / 2))
    (hs2de : Real.sin (2 * δ - ε) < 0) (hc2de : Real.cos (2 * δ - ε) < -(r / 2))
    (hlower : r * Real.sin δ + r * S * Real.sin t < 0) :
    0 ≤ (r ^ 2 * S * (Real.cos (t - δ) + S / 2))
        * (r * S * ((1 + r * Real.cos δ) * Real.cos t
              + r * Real.sin δ * Real.sin t)
           + r * (r - r * (Real.cos δ * Real.cos ε + Real.sin δ * Real.sin ε)
                + Real.cos δ
                - ((2 * Real.cos δ ^ 2 - 1) * Real.cos ε
                   + (2 * Real.sin δ * Real.cos δ) * Real.sin ε))) :=
  qEqE_signblock_reduction r δ ε t S hr hS hS2eq
    (qEqE_oneCosine_crux r δ ε t S hr hr1 hS hS2eq hsd hcd hse hce hs2de hc2de hlower)

/-- Strengthened flipped-pin lower-arc same-sign theorem.  The weak flipped
statement with only `-(r/2) < cos ε` is false; the actual analytic proof only
needs the two no-wrap sign facts `0 ≤ cos δ` and
`0 ≤ sin ε cos δ − cos ε sin δ`, supplied here explicitly. -/
theorem qEqE_lowerArc_sameSign_flipped_of_signs (r δ ε t S : ℝ)
    (hr : 0 < r) (hS : 0 < S)
    (hS2eq : S ^ 2 = 2 - 2 * Real.cos (δ - ε))
    (hsd : 0 < Real.sin δ) (hse : 0 < Real.sin ε)
    (hcd0 : 0 ≤ Real.cos δ)
    (hsed : 0 ≤ Real.sin ε * Real.cos δ - Real.cos ε * Real.sin δ)
    (hs2de : Real.sin (2 * δ - ε) < 0)
    (hlower : r * Real.sin δ + r * S * Real.sin t < 0) :
    0 ≤ (r ^ 2 * S * (Real.cos (t - δ) + S / 2))
        * (r * S * ((1 + r * Real.cos δ) * Real.cos t
              + r * Real.sin δ * Real.sin t)
           + r * (r - r * (Real.cos δ * Real.cos ε + Real.sin δ * Real.sin ε)
                + Real.cos δ
                - ((2 * Real.cos δ ^ 2 - 1) * Real.cos ε
                   + (2 * Real.sin δ * Real.cos δ) * Real.sin ε))) :=
  qEqE_signblock_reduction r δ ε t S hr hS hS2eq
    (qEqE_oneCosine_crux_of_signs r δ ε t S hr hS hS2eq hsd hse hcd0 hsed hs2de hlower)

/-- The C₂-side condition for `E` rules out the wrapped reflection branch.
In normalized coordinates, `E ∈ C₂` on the side opposite `B` across chord `DA`
is exactly the displayed inequality; if `sin(2δ - ε) < 0` wrapped instead of
giving `2δ < ε`, that side expression becomes strictly positive. -/
private theorem qEqE_noWrap_of_c2Side (r δ ε : ℝ)
    (hr : 0 < r) (hδπ : δ ≤ Real.pi) (hε0 : 0 ≤ ε)
    (hsd : 0 < Real.sin δ) (hse : 0 < Real.sin ε)
    (hcd : -(r / 2) < Real.cos δ)
    (hs2de : Real.sin (2 * δ - ε) < 0)
    (hside :
      Real.sin δ - Real.sin ε
        - r * (Real.sin ε * Real.cos δ - Real.cos ε * Real.sin δ) ≤ 0) :
    2 * δ < ε := by
  by_contra hnot
  push_neg at hnot
  set w : ℝ := 2 * δ - ε with hw_def
  have hw_nonneg : 0 ≤ w := by
    rw [hw_def]
    linarith
  have hδ_lt_pi : δ < Real.pi := by
    rcases lt_or_eq_of_le hδπ with h | h
    · exact h
    · exfalso
      rw [h, Real.sin_pi] at hsd
      exact lt_irrefl _ hsd
  have hπ_lt_w : Real.pi < w := by
    by_contra hnotπ
    push_neg at hnotπ
    have hsin_nonneg : 0 ≤ Real.sin w :=
      Real.sin_nonneg_of_nonneg_of_le_pi hw_nonneg hnotπ
    rw [hw_def] at hsin_nonneg
    exact (not_le_of_gt hs2de) hsin_nonneg
  have hε_lt_δ : ε < δ := by
    rw [hw_def] at hπ_lt_w
    linarith [hδ_lt_pi]
  have hε_pos : 0 < ε := by
    rcases lt_or_eq_of_le hε0 with h | h
    · exact h
    · exfalso
      rw [← h, Real.sin_zero] at hse
      exact lt_irrefl _ hse
  set u : ℝ := δ - ε with hu_def
  have hu_pos : 0 < u := by
    rw [hu_def]
    linarith
  have hu_lt_pi : u < Real.pi := by
    rw [hu_def]
    linarith [hδπ, hε_pos]
  have hsin_u_pos : 0 < Real.sin u :=
    Real.sin_pos_of_pos_of_lt_pi hu_pos hu_lt_pi
  have hsd_nonneg : 0 ≤ Real.sin δ := le_of_lt hsd
  have hone_minus_cos_nonneg : 0 ≤ 1 - Real.cos u := by
    nlinarith [Real.cos_le_one u]
  have hr_cos_pos : 0 < r + Real.cos δ := by
    linarith
  have hpos :
      0 < Real.sin δ * (1 - Real.cos u) + (r + Real.cos δ) * Real.sin u := by
    have hfirst : 0 ≤ Real.sin δ * (1 - Real.cos u) :=
      mul_nonneg hsd_nonneg hone_minus_cos_nonneg
    have hsecond : 0 < (r + Real.cos δ) * Real.sin u :=
      mul_pos hr_cos_pos hsin_u_pos
    linarith
  have hrewrite :
      Real.sin δ - Real.sin ε
          - r * (Real.sin ε * Real.cos δ - Real.cos ε * Real.sin δ)
        = Real.sin δ * (1 - Real.cos u) + (r + Real.cos δ) * Real.sin u := by
    rw [show Real.sin ε * Real.cos δ - Real.cos ε * Real.sin δ =
        Real.sin (ε - δ) by rw [Real.sin_sub]]
    rw [show ε - δ = -u by rw [hu_def]; ring, Real.sin_neg]
    rw [show ε = δ - u by rw [hu_def]; ring, Real.sin_sub]
    ring
  rw [hrewrite] at hside
  linarith

/-- No-wrap flipped-pin lower-arc same-sign theorem.  The no-wrap branch
`2δ < ε`, together with the arccos angle ranges, proves the two sign facts used
by `qEqE_lowerArc_sameSign_flipped_of_signs`: `0 ≤ cos δ` and
`0 ≤ sin(ε - δ)`. -/
theorem qEqE_lowerArc_sameSign_flipped_of_noWrap (r δ ε t S : ℝ)
    (hr : 0 < r) (hS : 0 < S)
    (hS2eq : S ^ 2 = 2 - 2 * Real.cos (δ - ε))
    (hsd : 0 < Real.sin δ) (hse : 0 < Real.sin ε)
    (hδ0 : 0 ≤ δ) (hεπ : ε ≤ Real.pi)
    (h2δε : 2 * δ < ε)
    (hs2de : Real.sin (2 * δ - ε) < 0)
    (hlower : r * Real.sin δ + r * S * Real.sin t < 0) :
    0 ≤ (r ^ 2 * S * (Real.cos (t - δ) + S / 2))
        * (r * S * ((1 + r * Real.cos δ) * Real.cos t
              + r * Real.sin δ * Real.sin t)
           + r * (r - r * (Real.cos δ * Real.cos ε + Real.sin δ * Real.sin ε)
                + Real.cos δ
                - ((2 * Real.cos δ ^ 2 - 1) * Real.cos ε
                   + (2 * Real.sin δ * Real.cos δ) * Real.sin ε))) := by
  have hδlt : δ < Real.pi / 2 := by
    nlinarith [h2δε, hεπ]
  have hcd0 : 0 ≤ Real.cos δ := by
    exact le_of_lt (Real.cos_pos_of_mem_Ioo ⟨by linarith [Real.pi_pos], hδlt⟩)
  have hsed : 0 ≤ Real.sin ε * Real.cos δ - Real.cos ε * Real.sin δ := by
    have hdiff_nonneg : 0 ≤ ε - δ := by
      nlinarith [h2δε]
    have hdiff_le_pi : ε - δ ≤ Real.pi := by
      linarith [hεπ, hδ0]
    have hsin : 0 ≤ Real.sin (ε - δ) :=
      Real.sin_nonneg_of_nonneg_of_le_pi hdiff_nonneg hdiff_le_pi
    rwa [Real.sin_sub] at hsin
  exact qEqE_lowerArc_sameSign_flipped_of_signs r δ ε t S hr hS hS2eq hsd hse
    hcd0 hsed hs2de hlower

/-- C₂-side flipped-pin lower-arc same-sign theorem.  This is the analytic
interface closest to the real bB-5 packet: instead of assuming the two sign
facts or the no-wrap inequality, it assumes the transported C₂-side inequality
for `E` and derives no-wrap internally. -/
theorem qEqE_lowerArc_sameSign_flipped_of_c2Side (r δ ε t S : ℝ)
    (hr : 0 < r) (hS : 0 < S)
    (hS2eq : S ^ 2 = 2 - 2 * Real.cos (δ - ε))
    (hsd : 0 < Real.sin δ) (hcd : -(r / 2) < Real.cos δ)
    (hse : 0 < Real.sin ε)
    (hδ0 : 0 ≤ δ) (hδπ : δ ≤ Real.pi)
    (hε0 : 0 ≤ ε) (hεπ : ε ≤ Real.pi)
    (hs2de : Real.sin (2 * δ - ε) < 0)
    (hside :
      Real.sin δ - Real.sin ε
        - r * (Real.sin ε * Real.cos δ - Real.cos ε * Real.sin δ) ≤ 0)
    (hlower : r * Real.sin δ + r * S * Real.sin t < 0) :
    0 ≤ (r ^ 2 * S * (Real.cos (t - δ) + S / 2))
        * (r * S * ((1 + r * Real.cos δ) * Real.cos t
              + r * Real.sin δ * Real.sin t)
           + r * (r - r * (Real.cos δ * Real.cos ε + Real.sin δ * Real.sin ε)
                + Real.cos δ
                - ((2 * Real.cos δ ^ 2 - 1) * Real.cos ε
                   + (2 * Real.sin δ * Real.cos δ) * Real.sin ε))) := by
  have h2δε : 2 * δ < ε :=
    qEqE_noWrap_of_c2Side r δ ε hr hδπ hε0 hsd hse hcd hs2de hside
  exact qEqE_lowerArc_sameSign_flipped_of_noWrap r δ ε t S hr hS hS2eq hsd hse
    hδ0 hεπ h2δε hs2de hlower

private theorem secondCoord_pos_of_dist_lt_centerHeight
    {c p : ℝ²}
    (hr : dist c p < c 1)
    (hpneg : p 1 < 0) :
    False := by
  have hcy : 0 < c 1 := by
    exact lt_of_le_of_lt dist_nonneg hr
  have hsquare :
      dist c p ^ 2 = (c 0 - p 0) ^ 2 + (c 1 - p 1) ^ 2 := by
    rw [dist_sq_eq_coord_sq_add_coord_sq]
  have hygap : c 1 < c 1 - p 1 := by
    linarith
  have hygap_sq : (c 1) ^ 2 < (c 1 - p 1) ^ 2 := by
    have hpos : 0 < c 1 - p 1 := by linarith
    nlinarith
  have hlt_sq : (c 1) ^ 2 < dist c p ^ 2 := by
    rw [hsquare]
    nlinarith [sq_nonneg (c 0 - p 0), hygap_sq]
  have hdist_nonneg : 0 ≤ dist c p := dist_nonneg
  have hdist_sq_lt : dist c p ^ 2 < (c 1) ^ 2 := by
    nlinarith [hdist_nonneg, hr]
  nlinarith

/-- Direct Lean consumer of the pinned `delta`-normalization interface:
the normalized coordinate formulas imply the branch-local height-gap packet
used by the `q = a₂` contradiction. -/
theorem i3_v3_a2_normalized_height_gap_of_delta_normalization
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S)
    (hnorm : S.I3V3A2DeltaNormalization Z) :
    S.I3V3A2NormalizedHeightGap Z := by
  rcases hnorm with ⟨T, tau, δ, hv1, hv2, ha2, hv3, hδlo, hδhi, hbelow⟩
  refine ⟨T, tau, ?_, hbelow⟩
  have htwoδ_lo : Real.pi / 2 ≤ 2 * δ := by
    linarith
  have htwoδ_hi : 2 * δ < 2 * Real.pi / 3 := by
    linarith
  have hsin_lb :
      Real.sqrt 3 / 2 < Real.sin (2 * δ) := by
    have hpi_sub_lo : Real.pi / 3 < Real.pi - 2 * δ := by
      linarith
    have hpi_sub_hi : Real.pi - 2 * δ ≤ Real.pi / 2 := by
      linarith
    have hsin :
        Real.sin (Real.pi / 3) < Real.sin (Real.pi - 2 * δ) := by
      apply Real.sin_lt_sin_of_lt_of_le_pi_div_two
      · linarith [Real.pi_pos]
      · exact hpi_sub_hi
      · exact hpi_sub_lo
    rw [Real.sin_pi_sub] at hsin
    simpa [Real.sin_pi_div_three] using hsin
  have hcos_nonpos : Real.cos (2 * δ) ≤ 0 := by
    apply Real.cos_nonpos_of_pi_div_two_le_of_le
    · exact htwoδ_lo
    · linarith [Real.pi_pos, hδhi]
  have hdist_sq :
      dist (T S.triangle.v3) (T Z.a2) ^ 2 =
        2 + Real.cos (2 * δ) - Real.sqrt 3 * Real.sin (2 * δ) := by
    have hsqrt3_sq : Real.sqrt 3 ^ 2 = 3 := by
      exact Real.sq_sqrt (show (0 : ℝ) ≤ 3 by positivity)
    have hsin_sq_add_cos_sq : Real.sin δ ^ 2 + Real.cos δ ^ 2 = 1 := by
      simpa using Real.sin_sq_add_cos_sq δ
    rw [hv3, ha2, dist_sq_eq_coord_sq_add_coord_sq]
    simp [Problem97.CGN.vec2, EuclideanSpace.single_apply]
    rw [Real.sin_two_mul, Real.cos_two_mul]
    nlinarith
  have hsqrt3_sq : Real.sqrt 3 ^ 2 = 3 := by
    exact Real.sq_sqrt (show (0 : ℝ) ≤ 3 by positivity)
  have hsqrt3_pos : 0 < Real.sqrt 3 := by
    positivity
  have hs3mul : 3 / 2 < Real.sqrt 3 * Real.sin (2 * δ) := by
    nlinarith [hsin_lb, hsqrt3_sq, hsqrt3_pos]
  have hdist_sq_lt_half : dist (T S.triangle.v3) (T Z.a2) ^ 2 < 1 / 2 := by
    rw [hdist_sq]
    linarith [hcos_nonpos, hs3mul]
  have hdist_nonneg : 0 ≤ dist (T S.triangle.v3) (T Z.a2) := dist_nonneg
  have hsqrt_nonneg : 0 ≤ Real.sqrt 3 / 2 := by
    positivity
  have hdist_lt_sqrt3 :
      dist (T S.triangle.v3) (T Z.a2) < Real.sqrt 3 / 2 := by
    have hsqrt_sq : (Real.sqrt 3 / 2) ^ 2 = 3 / 4 := by
      nlinarith [hsqrt3_sq]
    set d : ℝ := dist (T S.triangle.v3) (T Z.a2)
    set s : ℝ := Real.sqrt 3 / 2
    have hd : 0 ≤ d := by
      dsimp [d]
      exact hdist_nonneg
    have hs : 0 ≤ s := by
      dsimp [s]
      exact hsqrt_nonneg
    have hdsq : d ^ 2 < s ^ 2 := by
      dsimp [d, s]
      rw [hsqrt_sq]
      linarith [hdist_sq_lt_half]
    by_contra h
    have hsle : s ≤ d := le_of_not_gt h
    have hsq_ge : s ^ 2 ≤ d ^ 2 := by
      gcongr
    linarith
  have hv3_y : (T S.triangle.v3) 1 = Real.sin (2 * δ) := by
    rw [hv3]
    simp [Problem97.CGN.vec2, EuclideanSpace.single_apply]
    rw [Real.sin_two_mul]
    ring_nf
  calc
    dist (T S.triangle.v3) (T Z.a2) < Real.sqrt 3 / 2 := hdist_lt_sqrt3
    _ < Real.sin (2 * δ) := hsin_lb
    _ = (T S.triangle.v3) 1 := hv3_y.symm

/-- The stronger local no-hit helper is an immediate consumer of the
normalized height-gap packet.  No coordinate algebra is replayed here; the
proof uses only distance preservation under similarity transport and the fact
that a circle of radius strictly smaller than the center height lies in the
open upper half-plane. -/
theorem i3_no_point_on_v3_radius_at_a2_of_normalized_height_gap
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S)
    (hgap : S.I3V3A2NormalizedHeightGap Z) :
    S.I3NoPointOnV3RadiusAtA2 Z := by
  rcases hgap with ⟨T, tau, hradius, hbelow⟩
  intro x hxI3 hEq
  have hEqT :
      dist (T S.triangle.v3) (T x) = dist (T S.triangle.v3) (T Z.a2) := by
    exact (tau.dist_eq_iff S.triangle.v3 x Z.a2).2 hEq
  have hradius' : dist (T S.triangle.v3) (T x) < (T S.triangle.v3) 1 := by
    rw [hEqT]
    exact hradius
  exact secondCoord_pos_of_dist_lt_centerHeight hradius' (hbelow x hxI3)

/-- Derive the public `q = a₂` shell bound from the stronger local no-hit
statement.  This keeps the theorem-facing surface aligned with the prose while
allowing the eventual coordinate proof to target the cleaner negated-equality
form. -/
theorem i3_on_v3_radius_at_a2_card_le_one_of_no_hit
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S)
    (hnohit : S.I3NoPointOnV3RadiusAtA2 Z) :
    S.I3OnV3RadiusAtA2CardLeOne Z := by
  classical
  unfold I3OnV3RadiusAtA2CardLeOne
  have hfilter_empty :
      S.I3.filter (fun x => dist S.triangle.v3 x = dist S.triangle.v3 Z.a2) = ∅ := by
    ext x
    constructor
    · intro hx
      exact False.elim ((hnohit x (Finset.mem_filter.mp hx).1) ((Finset.mem_filter.mp hx).2))
    · intro hx
      exact False.elim (by simpa using hx)
  have hfilter_card :
      (S.I3.filter (fun x => dist S.triangle.v3 x = dist S.triangle.v3 Z.a2)).card = 0 := by
    simpa [hfilter_empty]
  omega

/-- Convenience wrapper from the normalized height-gap packet directly to the
public shell bound consumed by the `q = a₂` selector contradiction. -/
theorem i3_on_v3_radius_at_a2_card_le_one_of_normalized_height_gap
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S)
    (hgap : S.I3V3A2NormalizedHeightGap Z) :
    S.I3OnV3RadiusAtA2CardLeOne Z := by
  exact S.i3_on_v3_radius_at_a2_card_le_one_of_no_hit Z
    (S.i3_no_point_on_v3_radius_at_a2_of_normalized_height_gap Z hgap)

/-- Swap the two `I₁` names of a zero-defect layout.  This is a local
relabeling helper for `N4d-b3`; it does not change `I₂` or `I₃`. -/
private def ZeroDefectCapLayout.swapI1
    {A : Finset ℝ²} {S : FiniteEndpointShell A}
    (Z : ZeroDefectCapLayout S) : ZeroDefectCapLayout S where
  a1 := Z.b1
  b1 := Z.a1
  a2 := Z.a2
  b2 := Z.b2
  a3 := Z.a3
  b3 := Z.b3
  hI1 := by simpa [Finset.pair_comm] using Z.hI1
  hI2 := Z.hI2
  hI3 := Z.hI3

/-- Swap the two `I₂` names of a zero-defect layout.  This is a local
relabeling helper for the `x = b₂` branch; it does not change `I₁` or `I₃`. -/
private def ZeroDefectCapLayout.swapI2
    {A : Finset ℝ²} {S : FiniteEndpointShell A}
    (Z : ZeroDefectCapLayout S) : ZeroDefectCapLayout S where
  a1 := Z.a1
  b1 := Z.b1
  a2 := Z.b2
  b2 := Z.a2
  a3 := Z.a3
  b3 := Z.b3
  hI1 := Z.hI1
  hI2 := by
    ext x
    constructor <;> intro hx <;> simpa [Z.hI2, or_comm] using hx
  hI3 := Z.hI3

/-- The `q = v₁` row in the forced `v₃` selector is impossible once the local
distance-order chain from the prose is available.  This theorem is purely a
consumer of that chain; it does not derive the geometric inequalities. -/
theorem selectorShape_v3_q_eq_v1_impossible_of_distance_chain
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) {r : ℝ}
    (hpacket : SelectorV3Qv1Packet S Z r)
    (hb1a1 : dist S.triangle.v3 Z.b1 < dist S.triangle.v3 Z.a1)
    (ha1v2 : dist S.triangle.v3 Z.a1 < dist S.triangle.v3 S.triangle.v2)
    (hv2v1 : dist S.triangle.v3 S.triangle.v2 < dist S.triangle.v3 S.triangle.v1) :
    False := by
  classical
  let T := S.witnessClassAt_v3 r
  rcases hpacket with ⟨p, hp, hpeq, hqeq⟩
  have hpT : p ∈ T := by
    have hpmem : p ∈ ({p} : Finset ℝ²) := by simp
    rw [← hpeq] at hpmem
    exact (Finset.mem_inter.mp hpmem).1
  have hv1T : S.triangle.v1 ∈ T := by
    have hv1mem : S.triangle.v1 ∈ ({S.triangle.v1} : Finset ℝ²) := by simp
    rw [← hqeq] at hv1mem
    exact (Finset.mem_inter.mp hv1mem).1
  have hpeqd : dist S.triangle.v3 p = dist S.triangle.v3 S.triangle.v1 := by
    exact (Finset.mem_filter.mp hpT).2.trans ((Finset.mem_filter.mp hv1T).2.symm)
  rcases Finset.mem_insert.mp hp with hpa1 | hp
  · subst hpa1
    linarith
  rcases Finset.mem_insert.mp hp with hpb1 | hpv2
  · have hpb1' : p = Z.b1 := by simpa using hpb1
    subst hpb1'
    linarith
  have hpv2' : p = S.triangle.v2 := by simpa using hpv2
  subst hpv2'
  linarith

/-- Close the `q = v₁` row of the forced `v₃` selector by combining the
support-cap distance order on `I₁` with the already pinned inequality
`|v₃v₂| < |v₃v₁|`.  If the arbitrary `ZeroDefectCapLayout` names `I₁` in the
opposite order, swap those two names locally and apply the previous consumer
theorem. -/
theorem selectorShape_v3_q_eq_v1_impossible
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) {r : ℝ}
    (hpacket : SelectorV3Qv1Packet S Z r)
    (hv2v1 : dist S.triangle.v3 S.triangle.v2 < dist S.triangle.v3 S.triangle.v1) :
    False := by
  classical
  rcases S.I1_v3_distance_chain with ⟨near, far, hI1eq, hnearfar, hfarv2⟩
  have hI1card : ({Z.a1, Z.b1} : Finset ℝ²).card = 2 := by
    simpa [Z.hI1] using S.I1_card_eq_two
  have hab_ne : Z.a1 ≠ Z.b1 := by
    intro h
    simp [h] at hI1card
  have haI1 : Z.a1 ∈ S.I1 := by
    rw [Z.hI1]
    simp
  have hbI1 : Z.b1 ∈ S.I1 := by
    rw [Z.hI1]
    simp
  rw [← hI1eq] at haI1 hbI1
  rcases Finset.mem_insert.mp haI1 with haNear | haFar
  · have hbFar : Z.b1 = far := by
      rcases Finset.mem_insert.mp hbI1 with hbNear | hbFar
      · exfalso
        exact hab_ne (haNear.trans hbNear.symm)
      · simpa using hbFar
    have hpacket' : SelectorV3Qv1Packet S (Z.swapI1) r := by
      simpa [SelectorV3Qv1Packet, ZeroDefectCapLayout.swapI1, Finset.insert_comm] using hpacket
    apply selectorShape_v3_q_eq_v1_impossible_of_distance_chain
      (S := S) (Z := Z.swapI1) (r := r) hpacket'
    · simpa [ZeroDefectCapLayout.swapI1, haNear, hbFar] using hnearfar
    · simpa [ZeroDefectCapLayout.swapI1, hbFar] using hfarv2
    · exact hv2v1
  · have haFar' : Z.a1 = far := by
      simpa using haFar
    have hbNear : Z.b1 = near := by
      rcases Finset.mem_insert.mp hbI1 with hbNear | hbFar
      · simpa using hbNear
      · exfalso
        have hbFar' : Z.b1 = far := by simpa using hbFar
        exact hab_ne (haFar'.trans hbFar'.symm)
    apply selectorShape_v3_q_eq_v1_impossible_of_distance_chain
      (S := S) (Z := Z) (r := r) hpacket
    · simpa [hbNear, haFar'] using hnearfar
    · simpa [haFar'] using hfarv2
    · exact hv2v1

/-- Close the `q = a₂` row of the forced `v₃` selector from the shell-level
cardinality bound exported by the prose: both `I₃` points would lie on the
circle centered at `v₃` with radius `|v₃a₂|`, contradicting that the filtered
`I₃` set has cardinality at most `1`. -/
theorem selectorShape_v3_q_eq_a2_impossible
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) {r : ℝ}
    (hpacket : SelectorV3Qa2Packet S Z r)
    (hbound : S.I3OnV3RadiusAtA2CardLeOne Z) :
    False := by
  classical
  let T := S.witnessClassAt_v3 r
  rcases hpacket with ⟨hI3sub, p, hp, hpeq, hqeq⟩
  have ha2T : Z.a2 ∈ T := by
    have ha2mem : Z.a2 ∈ ({Z.a2} : Finset ℝ²) := by simp
    rw [← hqeq] at ha2mem
    exact (Finset.mem_inter.mp ha2mem).1
  have hra2 : dist S.triangle.v3 Z.a2 = r := by
    exact (Finset.mem_filter.mp ha2T).2
  have hsub :
      S.I3 ⊆ S.I3.filter (fun x => dist S.triangle.v3 x = dist S.triangle.v3 Z.a2) := by
    intro x hxI3
    have hxT : x ∈ T := hI3sub hxI3
    have hxr : dist S.triangle.v3 x = r := (Finset.mem_filter.mp hxT).2
    exact Finset.mem_filter.mpr ⟨hxI3, by simpa [hra2] using hxr⟩
  have hfiltered_ge :
      2 ≤ (S.I3.filter (fun x => dist S.triangle.v3 x = dist S.triangle.v3 Z.a2)).card := by
    have hI3two : S.I3.card = 2 := S.I3_card_eq_two
    have hcard_le := Finset.card_le_card hsub
    omega
  omega

/-- The `x = a₂` branch from Form `b` at `v₁`, together with the forced `v₂`
selector trichotomy. -/
private def FormBv1A2WithSelectorV2
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) (r : ℝ) : Prop :=
  ∃ h2 : (Z.a2 : ℝ²) ∈ S.I2,
    S.witnessClassAt_v1 r ∩ S.CP.C2 = ({Z.a2} : Finset ℝ²) ∧
    ∃ s : ℝ, 0 < s ∧ SelectorV2SplitPacket S Z s

/-- The `x = a₂` row of Form `b` at `v₁` before any `v₂`-selector split:
the `v₁` witness class meets `C₂` in `{a₂}` and meets `C₃` in `{v₂}`. -/
private def FormBv1A2Packet
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) (r : ℝ) : Prop :=
  (Z.a2 : ℝ²) ∈ S.I2 ∧
  S.witnessClassAt_v1 r ∩ S.CP.C2 = ({Z.a2} : Finset ℝ²) ∧
  S.witnessClassAt_v1 r ∩ S.CP.C3 = ({S.triangle.v2} : Finset ℝ²)

/-- The `x = a₂`, `q = v₁` row packet for `N4d-b3`: combine the Form-`b`
`v₁` selector with the forced `v₂` selector row that uses `v₁`. -/
private def FormBv1A2SelectorV2Qv1Packet
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) (r s : ℝ) : Prop :=
  FormBv1A2Packet S Z r ∧ 0 < s ∧ SelectorV2Qv1Packet S Z s

/-- The `x = b₂` row of Form `b` at `v₁` before any `v₂`-selector split:
the `v₁` witness class meets `C₂` in `{b₂}` and meets `C₃` in `{v₂}`. -/
private def FormBv1B2Packet
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) (r : ℝ) : Prop :=
  (Z.b2 : ℝ²) ∈ S.I2 ∧
  S.witnessClassAt_v1 r ∩ S.CP.C2 = ({Z.b2} : Finset ℝ²) ∧
  S.witnessClassAt_v1 r ∩ S.CP.C3 = ({S.triangle.v2} : Finset ℝ²)

/-- The `x = b₂`, `q = v₁` row packet for the `N4d-bB1` branch: combine the
Form-`b` `v₁` selector with the forced `v₂` selector row that uses `v₁`. -/
private def FormBv1B2SelectorV2Qv1Packet
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) (r s : ℝ) : Prop :=
  FormBv1B2Packet S Z r ∧ 0 < s ∧ SelectorV2Qv1Packet S Z s

/-- The theorem-facing predecessor route pinned in the prose for the
`q = a₂` row of `N4d-b3`: once the Form-`b`, `x = a₂`, `q = v₁` branch packet
is available and the `v₂` selector has been upgraded to the literal forced
packet `S(v₂) = {a₂,b₂,v₃,v₁}`, the branch-local `delta` normalization may be
constructed.  This declaration records only the exact Lean consumer shape of
that step. -/
abbrev I3V3A2DeltaNormalizationOfExactPacket
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) : Prop :=
  ∀ {r s : ℝ},
    FormBv1A2SelectorV2Qv1Packet S Z r s →
    S.witnessClassAt_v2 s =
      insert Z.a2 (insert Z.b2 ({S.triangle.v3, S.triangle.v1} : Finset ℝ²)) →
    S.I3V3A2DeltaNormalization Z

-- The same-side proof uses the full chord-frame algebra for the equilateral
-- intersection and the MEC center in one theorem.
set_option maxHeartbeats 2000000 in
theorem C2_same_open_side_of_base_chord_as_v3
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) {r s : ℝ}
    (hbranch : FormBv1A2SelectorV2Qv1Packet S Z r s)
    (hexact : S.witnessClassAt_v2 s =
      insert Z.a2 (insert Z.b2 ({S.triangle.v3, S.triangle.v1} : Finset ℝ²))) :
    ∀ y ∈ ({Z.a2, S.triangle.v3} : Finset ℝ²),
      signedArea2 y S.triangle.v1 S.triangle.v2 *
        signedArea2 S.triangle.v3 S.triangle.v1 S.triangle.v2 > 0 := by
  classical
  intro y hy
  rcases Finset.mem_insert.mp hy with hya2 | hyv3
  · subst hya2
    rcases hbranch with ⟨⟨hA2, h_a2eq, h_v2eq⟩, _, _⟩
    let q1 : ℝ² := S.triangle.v1
    let q2 : ℝ² := S.triangle.v2
    let q3 : ℝ² := S.triangle.v3
    let a : ℝ² := Z.a2
    let center : ℝ² := S.Packet.center
    have haT1 : a ∈ S.witnessClassAt_v1 r := by
      have hamem : a ∈ ({a} : Finset ℝ²) := by simp
      rw [← h_a2eq] at hamem
      exact (Finset.mem_inter.mp hamem).1
    have hv2T1 : q2 ∈ S.witnessClassAt_v1 r := by
      have hv2mem : q2 ∈ ({q2} : Finset ℝ²) := by simp [q2]
      rw [← h_v2eq] at hv2mem
      exact (Finset.mem_inter.mp hv2mem).1
    have haT2 : a ∈ S.witnessClassAt_v2 s := by
      have hamem : a ∈ insert Z.a2 (insert Z.b2 ({S.triangle.v3, S.triangle.v1} : Finset ℝ²)) := by
        simp [a]
      rw [← hexact] at hamem
      exact hamem
    have hv1T2 : q1 ∈ S.witnessClassAt_v2 s := by
      have hv1mem : q1 ∈ insert Z.a2 (insert Z.b2 ({S.triangle.v3, S.triangle.v1} : Finset ℝ²)) := by
        simp [q1]
      rw [← hexact] at hv1mem
      exact hv1mem
    have hv3T2 : q3 ∈ S.witnessClassAt_v2 s := by
      have hv3mem : q3 ∈ insert Z.a2 (insert Z.b2 ({S.triangle.v3, S.triangle.v1} : Finset ℝ²)) := by
        simp [q3]
      rw [← hexact] at hv3mem
      exact hv3mem
    have haC2 : a ∈ S.CP.C2 := by
      unfold Problem97.FiniteEndpointShell.I2 at hA2
      exact (Finset.mem_erase.mp (Finset.mem_erase.mp hA2).2).2
    have haA : a ∈ A := S.CP.C2_subset haC2
    have hr_q1q2 : dist q1 q2 = r := by
      simpa [q1, q2] using (Finset.mem_filter.mp hv2T1).2
    have hr_q1a : dist q1 a = r := by
      simpa [q1, a] using (Finset.mem_filter.mp haT1).2
    have hs_q2q1 : dist q2 q1 = s := by
      simpa [q1, q2] using (Finset.mem_filter.mp hv1T2).2
    have hs_q2a : dist q2 a = s := by
      simpa [q2, a] using (Finset.mem_filter.mp haT2).2
    have hs_q2q3 : dist q2 q3 = s := by
      simpa [q2, q3] using (Finset.mem_filter.mp hv3T2).2
    have ha_q1 : dist q1 a = dist q1 q2 := by
      rw [hr_q1a, hr_q1q2]
    have ha_q2 : dist q2 a = dist q1 q2 := by
      rw [hs_q2a, dist_comm q1 q2, hs_q2q1]
    have hq3_q2 : dist q2 q3 = dist q1 q2 := by
      rw [hs_q2q3, dist_comm q1 q2, hs_q2q1]
    have hu : q2 - q1 ≠ 0 := by
      exact sub_ne_zero.mpr S.triangle.v12_ne.symm
    let u : ℝ² := q2 - q1
    let nvec : ℝ² := Problem97.stdOrientation.rightAngleRotation u
    let β := Problem97.stdOrientation.basisRightAngleRotation u hu
    let M : ℝ² := midpoint ℝ q1 q2
    let X : ℝ² → ℝ := fun z => β.repr (z - M) 0
    let Y : ℝ² → ℝ := fun z => β.repr (z - M) 1
    let yc : ℝ := Y center
    have hsum_pt : ∀ z : ℝ², z - M = X z • u + Y z • nvec := by
      intro z
      simpa [β, X, Y, nvec] using (β.sum_repr (z - M)).symm
    have hnorm_nvec : ‖nvec‖ = ‖u‖ := by
      simpa [nvec] using Problem97.stdOrientation.rightAngleRotation.norm_map u
    have hβu : β.repr u = Finsupp.single 0 (1 : ℝ) := by
      simpa [β, nvec] using (β.repr_self 0)
    have horth : inner ℝ u nvec = 0 := by
      simpa [nvec] using Problem97.stdOrientation.inner_rightAngleRotation_self u
    have harea_u_left : ∀ t : ℝ, Problem97.stdOrientation.areaForm u (t • u) = 0 := by
      intro t
      rw [map_smul]
      simp
    have harea_u_right : ∀ t : ℝ,
        Problem97.stdOrientation.areaForm u (t • nvec) = t * ‖u‖ ^ 2 := by
      intro t
      rw [map_smul]
      simp [nvec, Orientation.areaForm_rightAngleRotation_right]
    have hu_sq_pos : 0 < ‖u‖ ^ 2 := by
      exact sq_pos_of_ne_zero (norm_ne_zero_iff.mpr hu)
    have hq1mid : q1 - M = (-(1 / 2 : ℝ)) • u := by
      calc
        q1 - M = (1 / 2 : ℝ) • (q1 - q2) := by
          simpa [M] using (left_sub_midpoint ℝ q1 q2)
        _ = (-(1 / 2 : ℝ)) • u := by
          rw [show q1 - q2 = -u by
            dsimp [u]
            abel_nf]
          simp [smul_neg]
    have hq2mid : q2 - M = (1 / 2 : ℝ) • u := by
      simpa [M, u] using (right_sub_midpoint ℝ q1 q2)
    have hX_q1 : X q1 = -(1 / 2 : ℝ) := by
      have h := congrArg (fun v : ℝ² => β.repr v 0) hq1mid
      change X q1 = (β.repr ((-(1 / 2 : ℝ)) • u)) 0 at h
      rw [map_smul, hβu] at h
      simpa using h
    have hY_q1 : Y q1 = 0 := by
      have h := congrArg (fun v : ℝ² => β.repr v 1) hq1mid
      change Y q1 = (β.repr ((-(1 / 2 : ℝ)) • u)) 1 at h
      rw [map_smul, hβu] at h
      simpa using h
    have hpt_minus_q1 : ∀ z : ℝ²,
        z - q1 = (X z + 1 / 2) • u + Y z • nvec := by
      intro z
      calc
        z - q1 = (z - M) - (q1 - M) := by
          rw [sub_eq_add_neg, sub_eq_add_neg, sub_eq_add_neg]
          abel_nf
        _ = (X z • u + Y z • nvec) - ((-(1 / 2 : ℝ)) • u) := by
          rw [hsum_pt z, hq1mid]
        _ = (X z • u + (1 / 2 : ℝ) • u) + Y z • nvec := by
          rw [sub_eq_add_neg, neg_smul]
          abel_nf
        _ = (X z + 1 / 2) • u + Y z • nvec := by
          rw [← add_smul]
    have hpt_minus_q2 : ∀ z : ℝ²,
        z - q2 = (X z - 1 / 2) • u + Y z • nvec := by
      intro z
      calc
        z - q2 = (z - M) - (q2 - M) := by
          rw [sub_eq_add_neg, sub_eq_add_neg, sub_eq_add_neg]
          abel_nf
        _ = (X z • u + Y z • nvec) - ((1 / 2 : ℝ) • u) := by
          rw [hsum_pt z, hq2mid]
        _ = (X z • u + (-(1 / 2 : ℝ)) • u) + Y z • nvec := by
          rw [sub_eq_add_neg, neg_smul]
          abel_nf
        _ = (X z - 1 / 2) • u + Y z • nvec := by
          rw [← add_smul]
          simp [sub_eq_add_neg]
    have hpt_minus_center : ∀ z : ℝ²,
        z - center = X z • u + (Y z - yc) • nvec := by
      intro z
      have hcenter_perp : inner ℝ (center - M) u = 0 := by
        have hdist_eq : dist center q1 = dist center q2 := by
          rw [dist_comm center q1, dist_comm center q2]
          simpa [q1, q2] using S.Packet.moser_on_boundary_1.trans S.Packet.moser_on_boundary_2.symm
        have hperp : center ∈ AffineSubspace.perpBisector q1 q2 := by
          rw [AffineSubspace.mem_perpBisector_iff_dist_eq]
          simpa using hdist_eq
        have h :=
          (AffineSubspace.mem_perpBisector_iff_inner_eq_zero
            (c := center) (p₁ := q1) (p₂ := q2)).mp hperp
        simpa [M] using h
      have hxc_zero : X center = 0 := by
        have hinner : inner ℝ (center - M) u = X center * ‖u‖ ^ 2 := by
          have horth_rev : inner ℝ nvec u = 0 := by simpa [real_inner_comm] using horth
          calc
            inner ℝ (center - M) u = inner ℝ (X center • u + Y center • nvec) u := by
              rw [hsum_pt center]
            _ = inner ℝ (X center • u) u + inner ℝ (Y center • nvec) u := by
              rw [inner_add_left]
            _ = X center * ‖u‖ ^ 2 + Y center * 0 := by
              rw [inner_smul_left, inner_smul_left, real_inner_self_eq_norm_sq, horth_rev]
              simp
            _ = X center * ‖u‖ ^ 2 := by ring
        have hsqpos : 0 < ‖u‖ ^ 2 := by
          exact sq_pos_of_ne_zero (norm_ne_zero_iff.mpr hu)
        nlinarith
      calc
        z - center = (z - M) - (center - M) := by
          rw [sub_eq_add_neg, sub_eq_add_neg, sub_eq_add_neg]
          abel_nf
        _ = (X z • u + Y z • nvec) - (Y center • nvec) := by
          rw [hsum_pt z, hsum_pt center, hxc_zero, zero_smul, zero_add]
        _ = X z • u + (Y z • nvec + (-Y center) • nvec) := by
          rw [sub_eq_add_neg, neg_smul]
          abel_nf
        _ = X z • u + (Y z - yc) • nvec := by
          rw [← add_smul]
          rfl
    have hdist_sq_coeff :
        ∀ x y : ℝ, ‖x • u + y • nvec‖ ^ 2 = (x ^ 2 + y ^ 2) * ‖u‖ ^ 2 := by
      intro x y
      have horth' : inner ℝ (x • u) (y • nvec) = 0 := by
        rw [inner_smul_left, inner_smul_right, horth]
        ring
      have hnorm :
          ‖x • u + y • nvec‖ ^ 2 = ‖x • u‖ ^ 2 + ‖y • nvec‖ ^ 2 := by
        simpa [pow_two] using
          norm_add_sq_eq_norm_sq_add_norm_sq_of_inner_eq_zero (x • u) (y • nvec) horth'
      have hu_part : ‖x • u‖ ^ 2 = x ^ 2 * ‖u‖ ^ 2 := by
        calc
          ‖x • u‖ ^ 2 = (|x| * ‖u‖) ^ 2 := by rw [norm_smul, Real.norm_eq_abs]
          _ = |x| ^ 2 * ‖u‖ ^ 2 := by ring
          _ = x ^ 2 * ‖u‖ ^ 2 := by rw [sq_abs]
      have hn_part : ‖y • nvec‖ ^ 2 = y ^ 2 * ‖u‖ ^ 2 := by
        calc
          ‖y • nvec‖ ^ 2 = (|y| * ‖u‖) ^ 2 := by
            rw [norm_smul, Real.norm_eq_abs, hnorm_nvec]
          _ = |y| ^ 2 * ‖u‖ ^ 2 := by ring
          _ = y ^ 2 * ‖u‖ ^ 2 := by rw [sq_abs]
      rw [hnorm, hu_part, hn_part]
      ring
    have hdist_center_sq :
        ∀ z : ℝ², dist center z ^ 2 = (X z ^ 2 + (Y z - yc) ^ 2) * ‖u‖ ^ 2 := by
      intro z
      rw [dist_comm, dist_eq_norm, hpt_minus_center, hdist_sq_coeff]
    have hdist_q1_sq :
        ∀ z : ℝ², dist q1 z ^ 2 = ((X z + 1 / 2) ^ 2 + Y z ^ 2) * ‖u‖ ^ 2 := by
      intro z
      rw [dist_comm, dist_eq_norm, hpt_minus_q1, hdist_sq_coeff]
    have hdist_q2_sq :
        ∀ z : ℝ², dist q2 z ^ 2 = ((X z - 1 / 2) ^ 2 + Y z ^ 2) * ‖u‖ ^ 2 := by
      intro z
      rw [dist_comm, dist_eq_norm, hpt_minus_q2, hdist_sq_coeff]
    have hcommon_coords :
        ∀ z : ℝ²,
          dist q1 z = dist q1 q2 →
          dist q2 z = dist q1 q2 →
          X z = 0 ∧ Y z ^ 2 = (3 : ℝ) / 4 := by
      intro z hz1 hz2
      have hu_sq_ne : ‖u‖ ^ 2 ≠ 0 := ne_of_gt hu_sq_pos
      have h1 : ((X z + 1 / 2) ^ 2 + Y z ^ 2) * ‖u‖ ^ 2 = ‖u‖ ^ 2 := by
        rw [← hdist_q1_sq z, hz1, dist_eq_norm]
        simpa [u, norm_sub_rev]
      have h2 : ((X z - 1 / 2) ^ 2 + Y z ^ 2) * ‖u‖ ^ 2 = ‖u‖ ^ 2 := by
        rw [← hdist_q2_sq z, hz2, dist_eq_norm]
        simpa [u, norm_sub_rev]
      have h1' : (X z + 1 / 2) ^ 2 + Y z ^ 2 = 1 := by
        have h1'' : ((X z + 1 / 2) ^ 2 + Y z ^ 2) * ‖u‖ ^ 2 = 1 * ‖u‖ ^ 2 := by
          simpa using h1
        exact mul_right_cancel₀ hu_sq_ne h1''
      have h2' : (X z - 1 / 2) ^ 2 + Y z ^ 2 = 1 := by
        have h2'' : ((X z - 1 / 2) ^ 2 + Y z ^ 2) * ‖u‖ ^ 2 = 1 * ‖u‖ ^ 2 := by
          simpa using h2
        exact mul_right_cancel₀ hu_sq_ne h2''
      have hx : X z = 0 := by
        have h1r := h1'
        have h2r := h2'
        ring_nf at h1r h2r
        linarith
      have hy : Y z ^ 2 = (3 : ℝ) / 4 := by
        have h1r := h1'
        rw [hx] at h1r
        norm_num at h1r
        linarith
      exact ⟨hx, hy⟩
    have haXhY := hcommon_coords a ha_q1 ha_q2
    rcases haXhY with ⟨haX, haYsq⟩
    have hyc_pos : 0 < Y a * yc := by
      have hdisk_a' : ‖a - center‖ ≤ S.Packet.radius := by
        simpa [center] using S.Packet.disk_contains_A a haA
      have hdisk_a : dist center a ≤ S.Packet.radius := by
        rw [dist_eq_norm, norm_sub_rev]
        exact hdisk_a'
      have hradius : dist center q1 = S.Packet.radius := by
        rw [dist_comm]
        simpa [q1, center] using S.Packet.moser_on_boundary_1
      have hdist_sq : dist center a ^ 2 ≤ dist center q1 ^ 2 := by
        have hnonneg_a : 0 ≤ dist center a := dist_nonneg
        have hnonneg_q1 : 0 ≤ dist center q1 := dist_nonneg
        nlinarith [hdisk_a, hradius, hnonneg_a, hnonneg_q1]
      rw [hdist_center_sq a, hdist_center_sq q1, haX, hX_q1, hY_q1] at hdist_sq
      have hdist_sq' : (Y a - yc) ^ 2 ≤ ((1 / 2 : ℝ) ^ 2) + yc ^ 2 := by
        have htmp :
            (Y a - yc) ^ 2 * ‖u‖ ^ 2 ≤
              (((1 / 2 : ℝ) ^ 2) + yc ^ 2) * ‖u‖ ^ 2 := by
          simpa [pow_two] using hdist_sq
        exact le_of_mul_le_mul_right htmp hu_sq_pos
      have hquarter : ((1 / 2 : ℝ) ^ 2) ≤ Y a * yc := by
        have hsq := hdist_sq'
        ring_nf at hsq
        nlinarith [haYsq, hsq]
      linarith
    have harea_q1q2 : ∀ z : ℝ², signedArea2 q1 q2 z = Y z * ‖u‖ ^ 2 := by
      intro z
      calc
        signedArea2 q1 q2 z = Problem97.stdOrientation.areaForm u (z - q1) := by
          rw [Problem97.signedArea2_eq_stdOrientation_areaForm]
        _ = Problem97.stdOrientation.areaForm u ((X z + 1 / 2) • u + Y z • nvec) := by
          rw [hpt_minus_q1]
        _ = Y z * ‖u‖ ^ 2 := by
          rw [map_add, harea_u_left (X z + 1 / 2), harea_u_right (Y z)]
          simp
    have hprod_a_center :
        signedArea2 a q1 q2 * signedArea2 center q1 q2 > 0 := by
      have hcyc_a : signedArea2 a q1 q2 = signedArea2 q1 q2 a := by
        unfold signedArea2
        ring
      have hcyc_c : signedArea2 center q1 q2 = signedArea2 q1 q2 center := by
        unfold signedArea2
        ring
      rw [hcyc_a, hcyc_c, harea_q1q2 a, harea_q1q2 center]
      have hu_sq_sq_pos : 0 < ‖u‖ ^ 2 * ‖u‖ ^ 2 := mul_pos hu_sq_pos hu_sq_pos
      have hrew :
          Y a * ‖u‖ ^ 2 * (Y center * ‖u‖ ^ 2) =
            (Y a * yc) * (‖u‖ ^ 2 * ‖u‖ ^ 2) := by
        dsimp [yc]
        ring
      rw [hrew]
      exact mul_pos hyc_pos hu_sq_sq_pos
    have hq1O : ‖q1 - center‖ = S.Packet.radius := by
      simpa [q1, center] using S.Packet.moser_on_boundary_1
    have hq2O : ‖q2 - center‖ = S.Packet.radius := by
      simpa [q2, center] using S.Packet.moser_on_boundary_2
    have hq3O : ‖q3 - center‖ = S.Packet.radius := by
      simpa [q3, center] using S.Packet.moser_on_boundary_3
    have hinner_v3_pos : 0 < inner ℝ (q1 - q3) (q2 - q3) := by
      have hnn : 0 ≤ inner ℝ (q1 - q3) (q2 - q3) := by
        simpa [q1, q2, q3] using S.Packet.inner_at_v3
      by_contra hnot
      have hzero : inner ℝ (q1 - q3) (q2 - q3) = 0 := by linarith
      have hpyth :
          dist q1 q2 ^ 2 = dist q1 q3 ^ 2 + dist q2 q3 ^ 2 := by
        have hvec : q1 - q2 = (q1 - q3) - (q2 - q3) := by
          dsimp [q1, q2, q3]
          abel_nf
        rw [dist_eq_norm, dist_eq_norm, dist_eq_norm, hvec, norm_sub_sq_real]
        nlinarith [hzero]
      have hq3q1_sq : dist q1 q3 ^ 2 = 0 := by
        rw [hq3_q2] at hpyth
        nlinarith
      have hq3q1_zero : dist q1 q3 = 0 := by
        have hnn' : 0 ≤ dist q1 q3 := dist_nonneg
        nlinarith
      exact S.triangle.v13_ne (dist_eq_zero.mp hq3q1_zero)
    have hcenter_q3 :
        signedArea2 center q1 q2 * signedArea2 q3 q1 q2 > 0 := by
      have hmid_pos : 0 < inner ℝ (midpoint ℝ q1 q2 - center) (midpoint ℝ q1 q2 - q3) := by
        have hq1q3 : ‖q1 - center‖ = ‖q3 - center‖ := by rw [hq1O, hq3O]
        have hq2q3 : ‖q2 - center‖ = ‖q3 - center‖ := by rw [hq2O, hq3O]
        have hchord := inner_chord_eq_two_mul_inner_midpoint hq1q3 hq2q3
        nlinarith [hchord, hinner_v3_pos]
      have hperp : ‖q1 - center‖ ^ 2 = ‖q2 - center‖ ^ 2 := by
        rw [hq1O, hq2O]
      rw [Problem97.signedArea_prod_eq_inner_mul_dist_sq center q1 q2 q3 hperp]
      have hchord_sq_pos : 0 < ‖q1 - q2‖ ^ 2 := by
        exact sq_pos_of_ne_zero (norm_ne_zero_iff.mpr (sub_ne_zero.mpr S.triangle.v12_ne))
      nlinarith [hmid_pos, hchord_sq_pos]
    have hcenter_ne :
        signedArea2 center q1 q2 ≠ 0 := by
      have : signedArea2 center q1 q2 * signedArea2 q3 q1 q2 ≠ 0 := by
        exact ne_of_gt hcenter_q3
      exact left_ne_zero_of_mul this
    have hprod_av3 :
        signedArea2 a q1 q2 * signedArea2 q3 q1 q2 > 0 := by
      have hcombo :
          0 < (signedArea2 a q1 q2 * signedArea2 center q1 q2) *
            (signedArea2 center q1 q2 * signedArea2 q3 q1 q2) := by
        exact mul_pos hprod_a_center hcenter_q3
      have hrew :
          (signedArea2 a q1 q2 * signedArea2 center q1 q2) *
              (signedArea2 center q1 q2 * signedArea2 q3 q1 q2) =
            (signedArea2 a q1 q2 * signedArea2 q3 q1 q2) *
              (signedArea2 center q1 q2) ^ 2 := by
        ring
      rw [hrew] at hcombo
      have hcenter_sq_pos : 0 < (signedArea2 center q1 q2) ^ 2 := by
        exact sq_pos_of_ne_zero hcenter_ne
      nlinarith [hcombo, hcenter_sq_pos]
    simpa [a, q1, q2, q3] using hprod_av3
  · have hyv3' : y = S.triangle.v3 := by simpa using hyv3
    subst y
    have hnd :
        signedArea2 S.triangle.v3 S.triangle.v1 S.triangle.v2 ≠ 0 := by
      have hv1O : ‖S.triangle.v1 - S.Packet.center‖ = S.Packet.radius :=
        S.Packet.moser_on_boundary_1
      have hv2O : ‖S.triangle.v2 - S.Packet.center‖ = S.Packet.radius :=
        S.Packet.moser_on_boundary_2
      have hv3O : ‖S.triangle.v3 - S.Packet.center‖ = S.Packet.radius :=
        S.Packet.moser_on_boundary_3
      exact MEC.signedArea2_ne_zero_of_three_dist_eq
        (by simpa [dist_eq_norm] using hv3O)
        (by simpa [dist_eq_norm] using hv1O)
        (by simpa [dist_eq_norm] using hv2O)
        S.triangle.v13_ne.symm S.triangle.v12_ne S.triangle.v23_ne.symm
    have hsqpos :
        0 < signedArea2 S.triangle.v3 S.triangle.v1 S.triangle.v2 *
          signedArea2 S.triangle.v3 S.triangle.v1 S.triangle.v2 := by
      exact mul_self_pos.mpr hnd
    simpa [mul_comm] using hsqpos

/-- **Core scalar inequality for the `C₂` same-side lemma.**

In the `v₁v₂`-chord frame (chord half-length normalized to `1/2`), with
`(p, q)` the frame coordinates of the candidate point, `(s, t)` those of the
apex `v₃`, and `c` the frame `y`-coordinate of the circumcenter, the four
geometric facts

* the circumcenter is strictly on the same side as `v₃` (`0 < c * t`);
* the candidate is strictly across the chord `v₃v₁` from `v₂` (`hARC`);
* the candidate lies in the MEC disk (`hD`);
* `v₃` lies on the MEC (`hC`);

force the candidate to be strictly on `v₃`'s side of the chord `v₁v₂`,
i.e. `0 < q * t`. -/
private theorem c2_sameSide_core (p q s t c : ℝ)
    (hCT : 0 ≤ c * t)
    (hARC : t * (2 * p * t - 2 * q * s - q + t) < 0)
    (hD : p ^ 2 + q ^ 2 ≤ 1 / 4 + 2 * c * q)
    (hC : 8 * c * t = 4 * s ^ 2 + 4 * t ^ 2 - 1) :
    0 < q * t := by
  rcases lt_trichotomy t 0 with ht | ht | ht
  · have hc : c ≤ 0 := by nlinarith [hCT, ht]
    have hARC' : 0 < 2 * p * t - 2 * q * s - q + t := by
      by_contra h; push_neg at h
      nlinarith [mul_nonpos_of_nonpos_of_nonneg
        (by linarith : (2 * p * t - 2 * q * s - q + t) ≤ 0)
        (by linarith : (0 : ℝ) ≤ -t), hARC]
    by_contra hcon; push_neg at hcon
    have hcon' : 0 ≤ q := by nlinarith [ht]
    nlinarith [ht, hc, hARC', hD, hC,
      mul_nonneg (neg_nonneg.mpr ht.le) (neg_nonneg.mpr hc), sq_nonneg (p - s),
      mul_nonneg hcon' (neg_nonneg.mpr ht.le),
      mul_nonneg hcon' (neg_nonneg.mpr hc),
      sq_nonneg (p * t - q * s), sq_nonneg (q - c), sq_nonneg p, sq_nonneg q]
  · exfalso; rw [ht] at hARC; simp at hARC
  · have hc : 0 ≤ c := by nlinarith [hCT, ht]
    have hARC' : 2 * p * t - 2 * q * s - q + t < 0 := by
      by_contra h; push_neg at h
      nlinarith [mul_nonneg h (le_of_lt ht), hARC]
    by_contra hcon; push_neg at hcon
    have hcon' : q ≤ 0 := by nlinarith [ht]
    nlinarith [ht, hc, hARC', hD, hC,
      mul_nonneg ht.le hc, sq_nonneg (p - s),
      mul_nonneg (neg_nonneg.mpr hcon') (le_of_lt ht),
      mul_nonneg (neg_nonneg.mpr hcon') hc,
      sq_nonneg (p * t - q * s), sq_nonneg (q - c), sq_nonneg p, sq_nonneg q]

set_option maxHeartbeats 4000000 in
/-- **`C₂` cap vertices lie on the same open side of the base chord `v₁v₂`
as the apex `v₃` — selector-independent form.**

Unlike `C2_same_open_side_of_base_chord_as_v3`, which pins the candidate via
the exact `v₂`-selector packet (`|v₂a₂| = |v₂v₃| = |v₁v₂|`), this version uses
only that `a₂` is a vertex of the cap `C₂`.  The cap-membership invariant
(`CapTriple.arc_membership`) places `a₂` on the closed MEC arc opposite `v₂`
across the chord `v₃v₁`; convex-independence of `A` upgrades this to the strict
open side; the circumscribed-MEC packet (disk containment, non-obtuse apex at
`v₃`) then forces `a₂` strictly onto `v₃`'s side of `v₁v₂`.  No
`ZeroDefectCapLayout`, selector packet, or exact equidistance hypothesis is
required, so the conclusion serves both the lower (`v₁ ∉ S(v₂)`) and upper
residual branches of the `q' = C` column.

The heartbeat budget is raised because the proof carries the full chord-frame
coordinate scaffolding plus several `nlinarith` certificate searches. -/
theorem c2_vertex_same_open_side_as_v3
    {A : Finset ℝ²} (S : FiniteEndpointShell A) {a₂ : ℝ²}
    (ha2 : a₂ ∈ S.I2) :
    0 < signedArea2 a₂ S.triangle.v1 S.triangle.v2 *
      signedArea2 S.triangle.v3 S.triangle.v1 S.triangle.v2 := by
  classical
  let q1 : ℝ² := S.triangle.v1
  let q2 : ℝ² := S.triangle.v2
  let q3 : ℝ² := S.triangle.v3
  let a : ℝ² := a₂
  let center : ℝ² := S.Packet.center
  -- Decompose the open-cap membership `a₂ ∈ I2 = (C₂.erase v₃).erase v₁`.
  have haC2 : a ∈ S.CP.C2 :=
    (Finset.mem_erase.mp (Finset.mem_erase.mp ha2).2).2
  have ha_ne_v1 : a ≠ q1 := (Finset.mem_erase.mp ha2).1
  have ha_ne_v3 : a ≠ q3 := (Finset.mem_erase.mp (Finset.mem_erase.mp ha2).2).1
  have haA : a ∈ A := S.CP.C2_subset haC2
  -- Cap membership ⇒ `a` on the closed arc opposite `v₂` across chord `v₃v₁`.
  have harc_le :
      signedArea2 a q3 q1 * signedArea2 q2 q3 q1 ≤ 0 := by
    have h := ((S.CP.arc_membership a haA).2.1).mp haC2
    simpa [Problem97.OnArcOpposite, q1, q2, q3, a] using h
  -- Convex-independence: `a, v₃, v₁` are not collinear, so `signedArea2 a v₃ v₁ ≠ 0`.
  have hav3v1_ne : signedArea2 a q3 q1 ≠ 0 := by
    intro hΔ
    have hcol : Collinear ℝ ({a, q3, q1} : Set ℝ²) :=
      Problem97.collinear_of_signedArea2_eq_zero a q3 q1 hΔ
    have hconv : ConvexIndep A := S.hconv
    have h3A : q3 ∈ A := S.triangle.v3_mem
    have h1A : q1 ∈ A := S.triangle.v1_mem
    rcases hcol.wbtw_or_wbtw_or_wbtw with hw | hw | hw
    · -- Wbtw a q3 q1 : q3 ∈ segment a q1 ⊆ convexHull (A \ {q3}).
      apply hconv q3 (by exact_mod_cast h3A)
      have hseg : q3 ∈ segment ℝ a q1 := hw.mem_segment
      rw [← convexHull_pair] at hseg
      refine convexHull_mono ?_ hseg
      intro x hx
      rcases hx with rfl | hx
      · exact ⟨by exact_mod_cast haA, by
          simp only [Set.mem_singleton_iff]; exact fun h => ha_ne_v3 h⟩
      · rcases hx with rfl
        exact ⟨by exact_mod_cast h1A, by
          simp only [Set.mem_singleton_iff]; exact fun h => S.triangle.v13_ne h⟩
    · -- Wbtw q3 q1 a : q1 ∈ segment q3 a ⊆ convexHull (A \ {q1}).
      apply hconv q1 (by exact_mod_cast h1A)
      have hseg : q1 ∈ segment ℝ q3 a := hw.mem_segment
      rw [← convexHull_pair] at hseg
      refine convexHull_mono ?_ hseg
      intro x hx
      rcases hx with rfl | hx
      · exact ⟨by exact_mod_cast h3A, by
          simp only [Set.mem_singleton_iff]; exact fun h => S.triangle.v13_ne h.symm⟩
      · rcases hx with rfl
        exact ⟨by exact_mod_cast haA, by
          simp only [Set.mem_singleton_iff]; exact fun h => ha_ne_v1 h⟩
    · -- Wbtw q1 a q3 : a ∈ segment q1 q3 ⊆ convexHull (A \ {a}).
      apply hconv a (by exact_mod_cast haA)
      have hseg : a ∈ segment ℝ q1 q3 := hw.mem_segment
      rw [← convexHull_pair] at hseg
      refine convexHull_mono ?_ hseg
      intro x hx
      rcases hx with rfl | hx
      · exact ⟨by exact_mod_cast h1A, by
          simp only [Set.mem_singleton_iff]; exact fun h => ha_ne_v1 h.symm⟩
      · rcases hx with rfl
        exact ⟨by exact_mod_cast h3A, by
          simp only [Set.mem_singleton_iff]; exact fun h => ha_ne_v3 h.symm⟩
  have hv2v3v1_ne : signedArea2 q2 q3 q1 ≠ 0 := by
    have hv1O : ‖q1 - S.Packet.center‖ = S.Packet.radius := S.Packet.moser_on_boundary_1
    have hv2O : ‖q2 - S.Packet.center‖ = S.Packet.radius := S.Packet.moser_on_boundary_2
    have hv3O : ‖q3 - S.Packet.center‖ = S.Packet.radius := S.Packet.moser_on_boundary_3
    exact MEC.signedArea2_ne_zero_of_three_dist_eq
      (by simpa [dist_eq_norm] using hv2O)
      (by simpa [dist_eq_norm] using hv3O)
      (by simpa [dist_eq_norm] using hv1O)
      S.triangle.v23_ne S.triangle.v13_ne.symm S.triangle.v12_ne.symm
  -- Hence the arc product is *strictly* negative.
  have harc : signedArea2 a q3 q1 * signedArea2 q2 q3 q1 < 0 :=
    lt_of_le_of_ne harc_le (mul_ne_zero hav3v1_ne hv2v3v1_ne)
  -- ===== Chord frame on `v₁v₂` (selector-independent scaffolding). =====
  have hu : q2 - q1 ≠ 0 := sub_ne_zero.mpr S.triangle.v12_ne.symm
  let u : ℝ² := q2 - q1
  let nvec : ℝ² := Problem97.stdOrientation.rightAngleRotation u
  let β := Problem97.stdOrientation.basisRightAngleRotation u hu
  let M : ℝ² := midpoint ℝ q1 q2
  let X : ℝ² → ℝ := fun z => β.repr (z - M) 0
  let Y : ℝ² → ℝ := fun z => β.repr (z - M) 1
  let yc : ℝ := Y center
  have hsum_pt : ∀ z : ℝ², z - M = X z • u + Y z • nvec := by
    intro z
    simpa [β, X, Y, nvec] using (β.sum_repr (z - M)).symm
  have hnorm_nvec : ‖nvec‖ = ‖u‖ := by
    simpa [nvec] using Problem97.stdOrientation.rightAngleRotation.norm_map u
  have horth : inner ℝ u nvec = 0 := by
    simpa [nvec] using Problem97.stdOrientation.inner_rightAngleRotation_self u
  have harea_u_left : ∀ r : ℝ, Problem97.stdOrientation.areaForm u (r • u) = 0 := by
    intro r; rw [map_smul]; simp
  have harea_u_right : ∀ r : ℝ,
      Problem97.stdOrientation.areaForm u (r • nvec) = r * ‖u‖ ^ 2 := by
    intro r; rw [map_smul]
    simp [nvec, Orientation.areaForm_rightAngleRotation_right]
  have hu_sq_pos : 0 < ‖u‖ ^ 2 := sq_pos_of_ne_zero (norm_ne_zero_iff.mpr hu)
  -- Difference of two points in frame coordinates.
  have hdiff : ∀ z w : ℝ², z - w = (X z - X w) • u + (Y z - Y w) • nvec := by
    intro z w
    have : (z - M) - (w - M) = z - w := by abel
    rw [← this, hsum_pt z, hsum_pt w, sub_smul, sub_smul]; abel
  -- General signed area in frame coordinates.
  have hun : Problem97.stdOrientation.areaForm u nvec = ‖u‖ ^ 2 := by
    simpa using harea_u_right 1
  have hnu : Problem97.stdOrientation.areaForm nvec u = -‖u‖ ^ 2 := by
    rw [Problem97.stdOrientation.areaForm_swap, hun]
  have huu : Problem97.stdOrientation.areaForm u u = 0 := by
    simpa using harea_u_left 1
  have hnn : Problem97.stdOrientation.areaForm nvec nvec = 0 := by simp
  have harea_bilin : ∀ xa ya xb yb : ℝ,
      Problem97.stdOrientation.areaForm (xa • u + ya • nvec) (xb • u + yb • nvec)
        = (xa * yb - ya * xb) * ‖u‖ ^ 2 := by
    intro xa ya xb yb
    simp only [map_add, LinearMap.add_apply, map_smul, LinearMap.smul_apply,
      smul_eq_mul, huu, hun, hnu, hnn]
    ring
  have harea_gen : ∀ z w x : ℝ²,
      signedArea2 z w x =
        ((X w - X z) * (Y x - Y z) - (Y w - Y z) * (X x - X z)) * ‖u‖ ^ 2 := by
    intro z w x
    rw [Problem97.signedArea2_eq_stdOrientation_areaForm, hdiff w z, hdiff x z,
        harea_bilin]
  -- Center perp-bisector: `X center = 0`.
  have hXc : X center = 0 := by
    have hdist_eq : dist center q1 = dist center q2 := by
      rw [dist_comm center q1, dist_comm center q2]
      simpa [q1, q2] using
        S.Packet.moser_on_boundary_1.trans S.Packet.moser_on_boundary_2.symm
    have hperp : center ∈ AffineSubspace.perpBisector q1 q2 := by
      rw [AffineSubspace.mem_perpBisector_iff_dist_eq]; simpa using hdist_eq
    have hcenter_perp : inner ℝ (center - M) u = 0 := by
      have h := (AffineSubspace.mem_perpBisector_iff_inner_eq_zero
        (c := center) (p₁ := q1) (p₂ := q2)).mp hperp
      simpa [M] using h
    have horth_rev : inner ℝ nvec u = 0 := by simpa [real_inner_comm] using horth
    have hinner : inner ℝ (center - M) u = X center * ‖u‖ ^ 2 := by
      calc
        inner ℝ (center - M) u
            = inner ℝ (X center • u + Y center • nvec) u := by rw [hsum_pt center]
        _ = X center * ‖u‖ ^ 2 + Y center * 0 := by
              rw [inner_add_left, inner_smul_left, inner_smul_left,
                real_inner_self_eq_norm_sq, horth_rev]; simp
        _ = X center * ‖u‖ ^ 2 := by ring
    rw [hcenter_perp] at hinner
    have hprod : X center * ‖u‖ ^ 2 = 0 := hinner.symm
    rcases mul_eq_zero.mp hprod with h | h
    · exact h
    · exact absurd h (ne_of_gt hu_sq_pos)
  -- Frame `X`/`Y` of `v₁` and `v₂`.
  have hq1mid : q1 - M = (-(1 / 2 : ℝ)) • u := by
    calc
      q1 - M = (1 / 2 : ℝ) • (q1 - q2) := by
        simpa [M] using (left_sub_midpoint ℝ q1 q2)
      _ = (-(1 / 2 : ℝ)) • u := by
        rw [show q1 - q2 = -u by dsimp [u]; abel_nf]; simp [smul_neg]
  have hq2mid : q2 - M = (1 / 2 : ℝ) • u := by
    simpa [M, u] using (right_sub_midpoint ℝ q1 q2)
  have hβu : β.repr u = Finsupp.single 0 (1 : ℝ) := by
    simpa [β, nvec] using (β.repr_self 0)
  have hX_q1 : X q1 = -(1 / 2 : ℝ) := by
    have h := congrArg (fun v : ℝ² => β.repr v 0) hq1mid
    change X q1 = (β.repr ((-(1 / 2 : ℝ)) • u)) 0 at h
    rw [map_smul, hβu] at h; simpa using h
  have hY_q1 : Y q1 = 0 := by
    have h := congrArg (fun v : ℝ² => β.repr v 1) hq1mid
    change Y q1 = (β.repr ((-(1 / 2 : ℝ)) • u)) 1 at h
    rw [map_smul, hβu] at h; simpa using h
  have hX_q2 : X q2 = (1 / 2 : ℝ) := by
    have h := congrArg (fun v : ℝ² => β.repr v 0) hq2mid
    change X q2 = (β.repr ((1 / 2 : ℝ) • u)) 0 at h
    rw [map_smul, hβu] at h; simpa using h
  have hY_q2 : Y q2 = 0 := by
    have h := congrArg (fun v : ℝ² => β.repr v 1) hq2mid
    change Y q2 = (β.repr ((1 / 2 : ℝ) • u)) 1 at h
    rw [map_smul, hβu] at h; simpa using h
  -- Squared distances in frame coordinates.
  have hpt_minus_center : ∀ z : ℝ²,
      z - center = X z • u + (Y z - yc) • nvec := by
    intro z
    rw [hdiff z center, hXc]; simp [yc]
  have hdist_sq_coeff :
      ∀ x y : ℝ, ‖x • u + y • nvec‖ ^ 2 = (x ^ 2 + y ^ 2) * ‖u‖ ^ 2 := by
    intro x y
    have horth' : inner ℝ (x • u) (y • nvec) = 0 := by
      rw [inner_smul_left, inner_smul_right, horth]; ring
    have hnorm : ‖x • u + y • nvec‖ ^ 2 = ‖x • u‖ ^ 2 + ‖y • nvec‖ ^ 2 := by
      simpa [pow_two] using
        norm_add_sq_eq_norm_sq_add_norm_sq_of_inner_eq_zero (x • u) (y • nvec) horth'
    have hu_part : ‖x • u‖ ^ 2 = x ^ 2 * ‖u‖ ^ 2 := by
      rw [norm_smul, Real.norm_eq_abs, mul_pow, sq_abs]
    have hn_part : ‖y • nvec‖ ^ 2 = y ^ 2 * ‖u‖ ^ 2 := by
      rw [norm_smul, Real.norm_eq_abs, hnorm_nvec, mul_pow, sq_abs]
    rw [hnorm, hu_part, hn_part]; ring
  have hdist_center_sq :
      ∀ z : ℝ², dist center z ^ 2 = (X z ^ 2 + (Y z - yc) ^ 2) * ‖u‖ ^ 2 := by
    intro z
    rw [dist_comm, dist_eq_norm, hpt_minus_center, hdist_sq_coeff]
  -- `v₃` on the MEC, `a` in the disk, expressed via frame coordinates.
  have hradius_sq : S.Packet.radius ^ 2 = ((1 / 4 : ℝ) + yc ^ 2) * ‖u‖ ^ 2 := by
    have hr : dist center q1 = S.Packet.radius := by
      rw [dist_comm]; simpa [q1, center] using S.Packet.moser_on_boundary_1
    have := hdist_center_sq q1
    rw [hr, hX_q1, hY_q1] at this
    rw [this]; ring
  have hC1 : 8 * yc * Y q3 = 4 * (X q3) ^ 2 + 4 * (Y q3) ^ 2 - 1 := by
    have hr : dist center q3 = S.Packet.radius := by
      rw [dist_comm]; simpa [q3, center] using S.Packet.moser_on_boundary_3
    have h := hdist_center_sq q3
    rw [hr, hradius_sq] at h
    have hcancel : (X q3) ^ 2 + (Y q3 - yc) ^ 2 = (1 / 4 : ℝ) + yc ^ 2 :=
      (mul_right_cancel₀ (ne_of_gt hu_sq_pos) h).symm
    nlinarith [hcancel]
  have hD : (X a) ^ 2 + (Y a) ^ 2 ≤ 1 / 4 + 2 * yc * Y a := by
    have hdisk_a' : ‖a - center‖ ≤ S.Packet.radius := by
      simpa [center] using S.Packet.disk_contains_A a haA
    have hdisk_a : dist center a ≤ S.Packet.radius := by
      rw [dist_eq_norm, norm_sub_rev]; exact hdisk_a'
    have hsq : dist center a ^ 2 ≤ S.Packet.radius ^ 2 := by
      have h0 : 0 ≤ dist center a := dist_nonneg
      have h1 : 0 ≤ S.Packet.radius := le_of_lt S.Packet.radius_pos
      nlinarith [hdisk_a, h0, h1]
    rw [hdist_center_sq a, hradius_sq] at hsq
    have hsq' : (X a) ^ 2 + (Y a - yc) ^ 2 ≤ (1 / 4 : ℝ) + yc ^ 2 :=
      le_of_mul_le_mul_right (by linarith [hsq]) hu_sq_pos
    nlinarith [hsq']
  -- Frame area of the center and of `v₃` on the chord `v₁v₂`.
  have hca : signedArea2 center q1 q2 = yc * ‖u‖ ^ 2 := by
    have hyc : Y center = yc := rfl
    rw [harea_gen center q1 q2, hX_q1, hY_q1, hX_q2, hY_q2, hXc, hyc]; ring
  have hc3 : signedArea2 q3 q1 q2 = Y q3 * ‖u‖ ^ 2 := by
    rw [harea_gen q3 q1 q2, hX_q1, hY_q1, hX_q2, hY_q2]; ring
  -- Center on the *closed* same side as the non-obtuse apex `v₃` (selector-free).
  have hcenter_q3 : 0 ≤ yc * Y q3 := by
    have hq1O : ‖q1 - center‖ = S.Packet.radius := by
      simpa [q1, center] using S.Packet.moser_on_boundary_1
    have hq2O : ‖q2 - center‖ = S.Packet.radius := by
      simpa [q2, center] using S.Packet.moser_on_boundary_2
    have hq3O : ‖q3 - center‖ = S.Packet.radius := by
      simpa [q3, center] using S.Packet.moser_on_boundary_3
    have hinn : inner ℝ (q1 - q3) (q2 - q3) ≥ 0 := by
      simpa [q1, q2, q3] using S.Packet.inner_at_v3
    have hprod :
        signedArea2 center q1 q2 * signedArea2 q3 q1 q2 ≥ 0 :=
      center_same_side_as_apex_of_nonobtuse hq1O hq2O hq3O hinn
    rw [hca, hc3] at hprod
    have hpos : 0 < ‖u‖ ^ 2 * ‖u‖ ^ 2 := mul_pos hu_sq_pos hu_sq_pos
    nlinarith [hprod, hpos]
  -- Arc product in frame coordinates ⇒ the `hARC` premise of the core lemma.
  have hARC : Y q3 * (2 * X a * Y q3 - 2 * Y a * X q3 - Y a + Y q3) < 0 := by
    have hf1 : signedArea2 a q3 q1 =
        ((X q3 - X a) * (Y q1 - Y a) - (Y q3 - Y a) * (X q1 - X a)) * ‖u‖ ^ 2 :=
      harea_gen a q3 q1
    have hf2 : signedArea2 q2 q3 q1 =
        ((X q3 - X q2) * (Y q1 - Y q2) - (Y q3 - Y q2) * (X q1 - X q2)) * ‖u‖ ^ 2 :=
      harea_gen q2 q3 q1
    rw [hf1, hf2, hX_q1, hY_q1, hX_q2, hY_q2] at harc
    have hexpand :
        ((X q3 - X a) * (0 - Y a) - (Y q3 - Y a) * (-(1 / 2) - X a)) * ‖u‖ ^ 2 *
          (((X q3 - (1 / 2)) * (0 - 0) - (Y q3 - 0) * (-(1 / 2) - (1 / 2))) * ‖u‖ ^ 2)
        = (Y q3 * (2 * X a * Y q3 - 2 * Y a * X q3 - Y a + Y q3)) *
            ((1 / 2) * (‖u‖ ^ 2 * ‖u‖ ^ 2)) := by ring
    rw [hexpand] at harc
    have hpos : 0 < (1 / 2 : ℝ) * (‖u‖ ^ 2 * ‖u‖ ^ 2) := by positivity
    nlinarith [harc, hpos]
  -- Apply the core scalar inequality.
  have hcore : 0 < Y a * Y q3 :=
    c2_sameSide_core (X a) (Y a) (X q3) (Y q3) yc hcenter_q3 hARC hD hC1
  -- Translate back to signed areas.
  have hsa_a : signedArea2 a q1 q2 = Y a * ‖u‖ ^ 2 := by
    rw [harea_gen a q1 q2, hX_q1, hY_q1, hX_q2, hY_q2]; ring
  have hsa_3 : signedArea2 q3 q1 q2 = Y q3 * ‖u‖ ^ 2 := by
    rw [harea_gen q3 q1 q2, hX_q1, hY_q1, hX_q2, hY_q2]; ring
  change 0 < signedArea2 a q1 q2 * signedArea2 q3 q1 q2
  rw [hsa_a, hsa_3]
  have : Y a * ‖u‖ ^ 2 * (Y q3 * ‖u‖ ^ 2) = (Y a * Y q3) * (‖u‖ ^ 2 * ‖u‖ ^ 2) := by ring
  rw [this]
  exact mul_pos hcore (mul_pos hu_sq_pos hu_sq_pos)

private theorem signedArea2_baseChord_vec2 (p : ℝ²) :
    signedArea2 p (Problem97.CGN.vec2 (-1) 0) (Problem97.CGN.vec2 1 0) = 2 * p 1 := by
  simp [Problem97.signedArea2, Problem97.CGN.vec2, EuclideanSpace.single_apply]
  ring

private noncomputable def similarityTransportComp
    {T1 T2 : ℝ² → ℝ²}
    (tau1 : Problem97.CGN.SimilarityTransportData T1)
    (tau2 : Problem97.CGN.SimilarityTransportData T2) :
    Problem97.CGN.SimilarityTransportData (fun x => T2 (T1 x)) := by
  classical
  refine
    { scale := tau2.scale * tau1.scale
      scale_pos := mul_pos tau2.scale_pos tau1.scale_pos
      dist_image := ?_
      dist_eq_iff := ?_
      convexHull_mem_iff := ?_
      orientation := tau2.orientation * tau1.orientation
      orientation_sq := ?_
      halfplane_sign := ?_ }
  · intro a b
    rw [tau2.dist_image, tau1.dist_image]
    ring
  · intro a b c
    constructor
    · intro h
      exact (tau1.dist_eq_iff a b c).1 ((tau2.dist_eq_iff (T1 a) (T1 b) (T1 c)).1 h)
    · intro h
      exact (tau2.dist_eq_iff (T1 a) (T1 b) (T1 c)).2 ((tau1.dist_eq_iff a b c).2 h)
  · intro S a
    have himage :
        (fun x => T2 (T1 x)) '' S = T2 '' (T1 '' S) := by
      ext y
      constructor
      · intro hy
        rcases hy with ⟨x, hxS, rfl⟩
        exact ⟨T1 x, ⟨x, hxS, rfl⟩, rfl⟩
      · intro hy
        rcases hy with ⟨z, ⟨x, hxS, rfl⟩, rfl⟩
        exact ⟨x, hxS, rfl⟩
    rw [himage]
    exact Iff.trans
      (tau2.convexHull_mem_iff (S := T1 '' S) (a := T1 a))
      (tau1.convexHull_mem_iff (S := S) (a := a))
  · have h1 := tau2.orientation_sq
    have h2 := tau1.orientation_sq
    ring_nf
    nlinarith
  · intro a b c
    rw [tau2.halfplane_sign, tau1.halfplane_sign]
    ring

private noncomputable def halfShift (p : ℝ²) : ℝ² :=
  Problem97.CGN.vec2 ((p 0 + 1) / 2) (p 1 / 2)

private theorem halfShift_injective : Function.Injective halfShift := by
  intro p q hpq
  ext i <;> fin_cases i
  · have h := congrArg (fun z : ℝ² => z 0) hpq
    simpa [halfShift, Problem97.CGN.vec2, EuclideanSpace.single_apply] using h
  · have h := congrArg (fun z : ℝ² => z 1) hpq
    simpa [halfShift, Problem97.CGN.vec2, EuclideanSpace.single_apply] using h

private noncomputable def halfShiftSimilarityTransportData :
    Problem97.CGN.SimilarityTransportData halfShift := by
  classical
  let F : ℝ² →ₗ[ℝ] ℝ² := (1 / 2 : ℝ) • LinearMap.id
  let c : ℝ² := Problem97.CGN.vec2 ((1 : ℝ) / 2) 0
  let Taff : ℝ² →ᵃ[ℝ] ℝ² := AffineMap.mk' halfShift F c (by
    intro p
    ext i <;> fin_cases i <;>
      simp [halfShift, F, c, Problem97.CGN.vec2, EuclideanSpace.single_apply, Pi.add_apply]
    · ring
    · ring
    )
  have hdist0 : ∀ a b : ℝ², dist (halfShift a) (halfShift b) = ((1 : ℝ) / 2) * dist a b := by
    intro a b
    have hcoord :
        halfShift a - halfShift b =
          (1 / 2 : ℝ) • (a - b) := by
      ext i <;> fin_cases i <;>
        simp [halfShift, Problem97.CGN.vec2, EuclideanSpace.single_apply, sub_eq_add_neg]
        <;> ring
    rw [dist_eq_norm, hcoord, norm_smul, Real.norm_of_nonneg (by positivity), dist_eq_norm]
  refine
    { scale := (1 : ℝ) / 2
      scale_pos := by positivity
      dist_image := ?_
      dist_eq_iff := ?_
      convexHull_mem_iff := ?_
      orientation := 1
      orientation_sq := by norm_num
      halfplane_sign := ?_ }
  · intro a b
    exact hdist0 a b
  · intro a b c
    constructor
    · intro h
      rw [hdist0 a b, hdist0 a c] at h
      nlinarith
    · intro h
      rw [hdist0 a b, hdist0 a c]
      nlinarith
  · intro S a
    have hmap : halfShift '' convexHull ℝ S = convexHull ℝ (halfShift '' S) := by
      simpa [Taff] using (AffineMap.image_convexHull Taff S)
    constructor
    · intro ha
      rw [← hmap] at ha
      rcases ha with ⟨b, hb, hTb⟩
      have hba : b = a := halfShift_injective hTb
      simpa [hba] using hb
    · intro ha
      simpa [hmap] using (show halfShift a ∈ halfShift '' convexHull ℝ S from ⟨a, ha, rfl⟩)
  · intro a b c
    unfold halfShift
    simp [Problem97.signedArea2, Problem97.CGN.vec2, EuclideanSpace.single_apply]
    ring

private noncomputable def flipY (p : ℝ²) : ℝ² :=
  Problem97.CGN.vec2 (p 0) (-p 1)

private theorem flipY_injective : Function.Injective flipY := by
  intro p q hpq
  ext i <;> fin_cases i
  · have h := congrArg (fun z : ℝ² => z 0) hpq
    simpa [flipY, Problem97.CGN.vec2, EuclideanSpace.single_apply] using h
  · have h := congrArg (fun z : ℝ² => z 1) hpq
    simpa [flipY, Problem97.CGN.vec2, EuclideanSpace.single_apply] using h

private noncomputable def flipYSimilarityTransportData :
    Problem97.CGN.SimilarityTransportData flipY := by
  classical
  let F : ℝ² →ₗ[ℝ] ℝ² :=
    { toFun := flipY
      map_add' := by
        intro x y
        ext i <;> fin_cases i <;>
          simp [flipY, Problem97.CGN.vec2, EuclideanSpace.single_apply]
        · ring
      map_smul' := by
        intro r x
        ext i <;> fin_cases i <;>
          simp [flipY, Problem97.CGN.vec2, EuclideanSpace.single_apply]
      }
  let Taff : ℝ² →ᵃ[ℝ] ℝ² := AffineMap.mk' flipY F 0 (by
    intro p
    ext i <;> fin_cases i <;>
      simp [flipY, F, Problem97.CGN.vec2, EuclideanSpace.single_apply]
    )
  have hdist0 : ∀ a b : ℝ², dist (flipY a) (flipY b) = dist a b := by
    intro a b
    have hsq :
        ‖flipY a - flipY b‖ ^ 2 = ‖a - b‖ ^ 2 := by
      rw [EuclideanSpace.norm_sq_eq, EuclideanSpace.norm_sq_eq]
      simp [flipY, Problem97.CGN.vec2, EuclideanSpace.single_apply, Fin.sum_univ_two, sq_abs,
        Real.norm_eq_abs, PiLp.sub_apply]
      ring
    have hnonneg1 : 0 ≤ ‖flipY a - flipY b‖ := norm_nonneg _
    have hnonneg2 : 0 ≤ ‖a - b‖ := norm_nonneg _
    rw [dist_eq_norm, dist_eq_norm]
    nlinarith
  refine
    { scale := 1
      scale_pos := by norm_num
      dist_image := ?_
      dist_eq_iff := ?_
      convexHull_mem_iff := ?_
      orientation := -1
      orientation_sq := by norm_num
      halfplane_sign := ?_ }
  · intro a b
    simpa using hdist0 a b
  · intro a b c
    simpa [hdist0 a b, hdist0 a c]
  · intro S a
    have hmap : flipY '' convexHull ℝ S = convexHull ℝ (flipY '' S) := by
      simpa [Taff] using (AffineMap.image_convexHull Taff S)
    constructor
    · intro ha
      rw [← hmap] at ha
      rcases ha with ⟨b, hb, hTb⟩
      have hba : b = a := flipY_injective hTb
      simpa [hba] using hb
    · intro ha
      simpa [hmap] using (show flipY a ∈ flipY '' convexHull ℝ S from ⟨a, ha, rfl⟩)
  · intro a b c
    unfold flipY
    simp [Problem97.signedArea2, Problem97.CGN.vec2, EuclideanSpace.single_apply]
    ring

private theorem exists_base_transportData
    (q1 q2 : ℝ²) (hqne : q1 ≠ q2) :
    ∃ T0, ∃ tau0 : Problem97.CGN.SimilarityTransportData T0,
      T0 q1 = Problem97.CGN.vec2 (-1) 0 ∧
      T0 q2 = Problem97.CGN.vec2 1 0 := by
  classical
  let A2 : Finset ℝ² := ({q1, q2} : Finset ℝ²)
  let L2 : Problem97.CGN.OrderedCap 2 :=
    { points := ![q1, q2]
      injective := by
        intro i j hij
        fin_cases i <;> fin_cases j
        · rfl
        · exfalso
          exact hqne hij
        · exfalso
          exact hqne hij.symm
        · rfl }
  let P2 : Problem97.CGN.MecCapPacket A2 L2 :=
    { hm := by decide
      center := midpoint ℝ q1 q2
      radius := dist q1 q2 / 2
      radius_nonneg := by positivity
      mem_A := by
        intro t
        fin_cases t <;> simp [A2, L2]
      disk_mem := by
        intro t
        fin_cases t
        · simpa [L2, div_eq_mul_inv, mul_comm, mul_left_comm, mul_assoc] using
            (le_of_eq (by
              simpa [div_eq_mul_inv, mul_comm, mul_left_comm, mul_assoc] using
                (dist_midpoint_left (𝕜 := ℝ) q1 q2)))
        · simpa [L2, dist_comm, div_eq_mul_inv, mul_comm, mul_left_comm, mul_assoc] using
            (le_of_eq (by
              simpa [div_eq_mul_inv, mul_comm, mul_left_comm, mul_assoc] using
                (dist_midpoint_right (𝕜 := ℝ) q1 q2)))
      first_on_circle := by
        simpa [L2, Problem97.CGN.firstIndex, div_eq_mul_inv, mul_comm, mul_left_comm, mul_assoc] using
          (dist_left_midpoint (𝕜 := ℝ) q1 q2)
      last_on_circle := by
        simpa [L2, Problem97.CGN.lastIndex, div_eq_mul_inv, mul_comm, mul_left_comm, mul_assoc] using
          (dist_right_midpoint (𝕜 := ℝ) q1 q2) }
  let Hside2 : Problem97.CGN.MinorCapSideHypotheses P2 :=
    { cap_side_nonneg := by
        intro t
        fin_cases t <;> simp [L2, Problem97.CGN.firstIndex, Problem97.CGN.lastIndex, Problem97.signedArea2]
      center_side_nonpos := by
        simp [P2, L2, Problem97.CGN.firstIndex, Problem97.CGN.lastIndex, Problem97.signedArea2, midpoint_eq_smul_add]
        linarith }
  let Hord2 : Problem97.CGN.StrictCapOrder A2 L2 :=
    { hm := by decide
      consecutive_turn_nonpos := by
        intro t ht
        omega
      chord_projection_strict := by
        intro i j hij
        have hijval : i.val < j.val := Fin.lt_def.mp hij
        fin_cases i <;> fin_cases j
        · exfalso
          exact Nat.lt_irrefl 0 hijval
        · simpa [L2, Problem97.CGN.firstIndex, Problem97.CGN.lastIndex, real_inner_self_eq_norm_sq] using
            sq_pos_of_ne_zero (norm_ne_zero_iff.mpr (sub_ne_zero.mpr hqne.symm))
        · exfalso
          exact Nat.not_lt_zero 1 hijval
        · exfalso
          exact Nat.lt_irrefl 1 hijval
      subchord_open_side_iff_A := by
        intro r s hrs x hxA
        have hrsval : r.val < s.val := Fin.lt_def.mp hrs
        fin_cases r <;> fin_cases s
        · exfalso
          exact Nat.lt_irrefl 0 hrsval
        · constructor
          · intro hx
            exfalso
            simp [A2] at hxA
            rcases hxA with rfl | rfl
            · simp [L2, Problem97.signedArea2] at hx
            · simp [L2, Problem97.signedArea2] at hx
          · intro hx
            rcases hx with ⟨j, hrj, hjs, _⟩
            fin_cases j <;> omega
        · exfalso
          exact Nat.not_lt_zero 1 hrsval
        · exfalso
          exact Nat.lt_irrefl 1 hrsval }
  rcases Problem97.CGN.CGN6norm_minorCapChainModel_of_mecCapPacket P2 Hside2 Hord2 with
    ⟨T0, hT0, tau0, hModel⟩
  let LT0 : Problem97.CGN.OrderedCap 2 := L2.map T0 hT0
  let M0 : Problem97.CGN.MinorCapChainModel LT0 := Classical.choice hModel
  refine ⟨T0, tau0, ?_, ?_⟩
  · have hpt := M0.points_eq (Problem97.CGN.firstIndex (by decide : 2 ≤ 2))
    ext i <;> fin_cases i
    · calc
        (T0 q1) 0 = M0.coords.X (Problem97.CGN.firstIndex (by decide : 2 ≤ 2)) := by
          simpa [LT0, L2, Problem97.CGN.OrderedCap.map_points, Problem97.CGN.firstIndex,
            Problem97.CGN.point, Problem97.CGN.vec2, EuclideanSpace.single_apply]
            using congrArg (fun z : ℝ² => z 0) hpt
        _ = -1 := M0.coords.X_first
        _ = (Problem97.CGN.vec2 (-1) 0) 0 := by
          simp [Problem97.CGN.vec2, EuclideanSpace.single_apply]
    · calc
        (T0 q1) 1 = M0.coords.Y (Problem97.CGN.firstIndex (by decide : 2 ≤ 2)) := by
          simpa [LT0, L2, Problem97.CGN.OrderedCap.map_points, Problem97.CGN.firstIndex,
            Problem97.CGN.point, Problem97.CGN.vec2, EuclideanSpace.single_apply]
            using congrArg (fun z : ℝ² => z 1) hpt
        _ = 0 := M0.coords.Y_first
        _ = (Problem97.CGN.vec2 (-1) 0) 1 := by
          simp [Problem97.CGN.vec2, EuclideanSpace.single_apply]
  · have hpt := M0.points_eq (Problem97.CGN.lastIndex (by decide : 2 ≤ 2))
    ext i <;> fin_cases i
    · calc
        (T0 q2) 0 = M0.coords.X (Problem97.CGN.lastIndex (by decide : 2 ≤ 2)) := by
          simpa [LT0, L2, Problem97.CGN.OrderedCap.map_points, Problem97.CGN.lastIndex,
            Problem97.CGN.point, Problem97.CGN.vec2, EuclideanSpace.single_apply]
            using congrArg (fun z : ℝ² => z 0) hpt
        _ = 1 := M0.coords.X_last
        _ = (Problem97.CGN.vec2 1 0) 0 := by
          simp [Problem97.CGN.vec2, EuclideanSpace.single_apply]
    · calc
        (T0 q2) 1 = M0.coords.Y (Problem97.CGN.lastIndex (by decide : 2 ≤ 2)) := by
          simpa [LT0, L2, Problem97.CGN.OrderedCap.map_points, Problem97.CGN.lastIndex,
            Problem97.CGN.point, Problem97.CGN.vec2, EuclideanSpace.single_apply]
            using congrArg (fun z : ℝ² => z 1) hpt
        _ = 0 := M0.coords.Y_last
        _ = (Problem97.CGN.vec2 1 0) 1 := by
          simp [Problem97.CGN.vec2, EuclideanSpace.single_apply]

/-- Branch-local sign package for the `q = a₂` row: in any
positive-orientation base transport sending `v₁,v₂,a₂` to the normalized
positions `(-1,0),(1,0),(0,√3)`, the apex `v₃` lands above the base chord and
every lower-chain point of `I₃` lands below it. -/
theorem i3_v3_a2_base_chord_side_signs_of_exact_packet
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) {r s : ℝ}
    (hbranch : FormBv1A2SelectorV2Qv1Packet S Z r s)
    (hexact : S.witnessClassAt_v2 s =
      insert Z.a2 (insert Z.b2 ({S.triangle.v3, S.triangle.v1} : Finset ℝ²)))
    {T0 : ℝ² → ℝ²} (tau : Problem97.CGN.SimilarityTransportData T0)
    (hv1 : T0 S.triangle.v1 = Problem97.CGN.vec2 (-1) 0)
    (hv2 : T0 S.triangle.v2 = Problem97.CGN.vec2 1 0)
    (ha2 : T0 Z.a2 = Problem97.CGN.vec2 0 (Real.sqrt 3)) :
    0 < (T0 S.triangle.v3) 1 ∧ ∀ x ∈ S.I3, (T0 x) 1 < 0 := by
  let q1 : ℝ² := S.triangle.v1
  let q2 : ℝ² := S.triangle.v2
  let q3 : ℝ² := S.triangle.v3
  let a : ℝ² := Z.a2
  have hside_a :
      signedArea2 a q1 q2 * signedArea2 q3 q1 q2 > 0 := by
    exact S.C2_same_open_side_of_base_chord_as_v3 (Z := Z) hbranch hexact a (by simp [a, q3])
  have ha_img_pos :
      0 < signedArea2 (T0 a) (T0 q1) (T0 q2) := by
    rw [ha2, hv1, hv2, signedArea2_baseChord_vec2]
    simp [Problem97.CGN.vec2, EuclideanSpace.single_apply]
  have himg_prod :
      0 < signedArea2 (T0 a) (T0 q1) (T0 q2) *
        signedArea2 (T0 q3) (T0 q1) (T0 q2) := by
    rw [tau.halfplane_sign a q1 q2, tau.halfplane_sign q3 q1 q2]
    have hscale_sq_pos : 0 < tau.scale ^ 2 := sq_pos_of_ne_zero (ne_of_gt tau.scale_pos)
    have hrew :
        (tau.orientation * (tau.scale ^ 2) * signedArea2 a q1 q2) *
            (tau.orientation * (tau.scale ^ 2) * signedArea2 q3 q1 q2) =
          (tau.orientation ^ 2) * (tau.scale ^ 2 * tau.scale ^ 2) *
            (signedArea2 a q1 q2 * signedArea2 q3 q1 q2) := by
      ring
    rw [hrew]
    rw [tau.orientation_sq]
    exact mul_pos (mul_pos (by positivity) (mul_pos hscale_sq_pos hscale_sq_pos)) hside_a
  have hq3_img_pos :
      0 < signedArea2 (T0 q3) (T0 q1) (T0 q2) := by
    have hle : 0 < signedArea2 (T0 q3) (T0 q1) (T0 q2) := by
      by_contra hnot
      have hnonpos : signedArea2 (T0 q3) (T0 q1) (T0 q2) ≤ 0 := by linarith
      have : signedArea2 (T0 a) (T0 q1) (T0 q2) *
          signedArea2 (T0 q3) (T0 q1) (T0 q2) ≤ 0 :=
        mul_nonpos_of_nonneg_of_nonpos (le_of_lt ha_img_pos) hnonpos
      linarith
    exact hle
  have hq3_y_pos : 0 < (T0 q3) 1 := by
    rw [hv1, hv2] at hq3_img_pos
    rw [signedArea2_baseChord_vec2] at hq3_img_pos
    linarith
  refine ⟨by simpa [q3] using hq3_y_pos, ?_⟩
  intro x hxI3
  have hxA : x ∈ A := S.CP.C3_subset (by
    unfold Problem97.FiniteEndpointShell.I3 at hxI3
    exact Finset.mem_of_mem_erase (Finset.mem_of_mem_erase hxI3))
  have hxC3 : x ∈ S.CP.C3 := by
    unfold Problem97.FiniteEndpointShell.I3 at hxI3
    exact Finset.mem_of_mem_erase (Finset.mem_of_mem_erase hxI3)
  have hx_ne_v1 : x ≠ q1 := by
    unfold Problem97.FiniteEndpointShell.I3 at hxI3
    exact (Finset.mem_erase.mp (Finset.mem_erase.mp hxI3).2).1
  have hx_ne_v2 : x ≠ q2 := by
    unfold Problem97.FiniteEndpointShell.I3 at hxI3
    exact (Finset.mem_erase.mp hxI3).1
  have hq3_base_ne : signedArea2 q3 q1 q2 ≠ 0 := by
    have hv1O : dist q3 S.Packet.center = S.Packet.radius := by
      simpa [q3, dist_eq_norm] using S.Packet.moser_on_boundary_3
    have hv2O : dist q1 S.Packet.center = S.Packet.radius := by
      simpa [q1, dist_eq_norm] using S.Packet.moser_on_boundary_1
    have hv3O : dist q2 S.Packet.center = S.Packet.radius := by
      simpa [q2, dist_eq_norm] using S.Packet.moser_on_boundary_2
    exact MEC.signedArea2_ne_zero_of_three_dist_eq
      hv1O hv2O hv3O
      S.triangle.v13_ne.symm S.triangle.v12_ne S.triangle.v23_ne.symm
  have hx_arc :
      signedArea2 x q1 q2 * signedArea2 q3 q1 q2 ≤ 0 := by
    exact (S.CP.arc_membership x hxA).2.2.1 hxC3
  have hx_base_ne : signedArea2 x q1 q2 ≠ 0 := by
    intro hz
    have hcol : Collinear ℝ ({x, q1, q2} : Set ℝ²) :=
      (Problem97.signedArea2_eq_zero_iff_collinear x q1 q2).1 hz
    exact False.elim <|
      S.hconv.not_three_collinear hxA S.triangle.v1_mem S.triangle.v2_mem
        hx_ne_v1 hx_ne_v2 S.triangle.v12_ne hcol
  have himg_nonpos :
      signedArea2 (T0 x) (T0 q1) (T0 q2) *
        signedArea2 (T0 q3) (T0 q1) (T0 q2) ≤ 0 := by
    rw [tau.halfplane_sign x q1 q2, tau.halfplane_sign q3 q1 q2]
    have hrew :
        (tau.orientation * (tau.scale ^ 2) * signedArea2 x q1 q2) *
            (tau.orientation * (tau.scale ^ 2) * signedArea2 q3 q1 q2) =
          (tau.orientation ^ 2) * (tau.scale ^ 2 * tau.scale ^ 2) *
            (signedArea2 x q1 q2 * signedArea2 q3 q1 q2) := by
      ring
    rw [hrew, tau.orientation_sq]
    have hscale_nonneg : 0 ≤ tau.scale ^ 2 * tau.scale ^ 2 := by positivity
    simpa using mul_nonpos_of_nonneg_of_nonpos hscale_nonneg hx_arc
  have hx_img_lt :
      signedArea2 (T0 x) (T0 q1) (T0 q2) < 0 := by
    have hx_img_le : signedArea2 (T0 x) (T0 q1) (T0 q2) ≤ 0 := by
      by_contra hx_pos
      have : 0 < signedArea2 (T0 x) (T0 q1) (T0 q2) *
          signedArea2 (T0 q3) (T0 q1) (T0 q2) :=
        mul_pos (by linarith) hq3_img_pos
      linarith
    have hx_img_ne : signedArea2 (T0 x) (T0 q1) (T0 q2) ≠ 0 := by
      rw [tau.halfplane_sign x q1 q2]
      have horient_ne : tau.orientation ≠ 0 := by
        intro h0
        have : (0 : ℝ) ^ 2 = 1 := by simpa [h0] using tau.orientation_sq
        norm_num at this
      exact mul_ne_zero (mul_ne_zero horient_ne (pow_ne_zero 2 (ne_of_gt tau.scale_pos))) hx_base_ne
    exact lt_of_le_of_ne hx_img_le hx_img_ne
  rw [hv1, hv2] at hx_img_lt
  rw [signedArea2_baseChord_vec2] at hx_img_lt
  linarith

/-- Branch-local strict long-side export for the `q = a₂` row: once the
`v₂` selector is upgraded to the literal packet
`S(v₂) = {a₂,b₂,v₃,v₁}`, the endpoint monotonicity on support cap `C₂`
forces `|v₁v₃| > |v₁v₂|`.  This is the theorem-facing predecessor consumed by
the `delta`-normalization route. -/
theorem v1v3_longer_than_base_of_exact_packet
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) {r s : ℝ}
    (hbranch : FormBv1A2SelectorV2Qv1Packet S Z r s)
    (_hexact : S.witnessClassAt_v2 s =
      insert Z.a2 (insert Z.b2 ({S.triangle.v3, S.triangle.v1} : Finset ℝ²))) :
    dist S.triangle.v1 S.triangle.v2 < dist S.triangle.v1 S.triangle.v3 := by
  classical
  rcases hbranch with ⟨⟨hA2, h_a2eq, h_v2eq⟩, _, _⟩
  have ha2T1 : Z.a2 ∈ S.witnessClassAt_v1 r := by
    have ha2mem : Z.a2 ∈ ({Z.a2} : Finset ℝ²) := by simp
    rw [← h_a2eq] at ha2mem
    exact (Finset.mem_inter.mp ha2mem).1
  have hv2T1 : S.triangle.v2 ∈ S.witnessClassAt_v1 r := by
    have hv2mem : S.triangle.v2 ∈ ({S.triangle.v2} : Finset ℝ²) := by simp
    rw [← h_v2eq] at hv2mem
    exact (Finset.mem_inter.mp hv2mem).1
  have hbase_eq : dist S.triangle.v1 S.triangle.v2 = dist S.triangle.v1 Z.a2 := by
    have hv2dist : dist S.triangle.v1 S.triangle.v2 = r := by
      simpa using (Finset.mem_filter.mp hv2T1).2
    have ha2dist : dist S.triangle.v1 Z.a2 = r := by
      simpa using (Finset.mem_filter.mp ha2T1).2
    rw [hv2dist, ha2dist]
  have ha2C2 : Z.a2 ∈ S.CP.C2 := by
    unfold Problem97.FiniteEndpointShell.I2 at hA2
    exact (Finset.mem_erase.mp (Finset.mem_erase.mp hA2).2).2
  have ha2_ne_v3 : Z.a2 ≠ S.triangle.v3 := by
    unfold Problem97.FiniteEndpointShell.I2 at hA2
    exact (Finset.mem_erase.mp (Finset.mem_erase.mp hA2).2).1
  have ha2_ne_v1 : Z.a2 ≠ S.triangle.v1 := by
    unfold Problem97.FiniteEndpointShell.I2 at hA2
    exact (Finset.mem_erase.mp hA2).1
  rcases Problem97.CGN.CGN4g_capData_of_supportCap_oriented
      (A := A) (C := S.CP.C2) (M := S.triangle2)
      S.hconv S.hnoncol S.CP.C2_subset
      (fun x hxA => (S.CP.arc_membership x hxA).2.1)
      S.CP.v3_mem_C2 S.CP.v1_mem_C2 S.packet2 S.packet2.inner_at_v1 with
    ⟨m, L, Packet, Hside, Hord, hLC, hEnds⟩
  have ha2L : Z.a2 ∈ Finset.univ.image L.points := by
    rw [hLC]
    exact ha2C2
  rcases Finset.mem_image.mp ha2L with ⟨i, -, hi⟩
  rcases hEnds with hFirstLast | hLastFirst
  · have hi_ne_first : i ≠ Problem97.CGN.firstIndex Packet.hm := by
      intro hi_first
      apply ha2_ne_v3
      calc
        Z.a2 = L.points i := hi.symm
        _ = L.points (Problem97.CGN.firstIndex Packet.hm) := by simpa [hi_first]
        _ = S.triangle.v3 := hFirstLast.1
    have hi_rev_lt_last : i.rev < Problem97.CGN.lastIndex Packet.hm := by
      apply Fin.lt_def.mpr
      rw [Fin.val_rev, Problem97.CGN.lastIndex_val]
      have hi_pos : 0 < i.val := by
        apply Nat.pos_of_ne_zero
        intro hi_zero
        apply hi_ne_first
        ext
        simpa [Problem97.CGN.firstIndex] using hi_zero
      omega
    have hmono :
        Problem97.FiniteEndpoint.E3L20b_rightEndpoint_capDistance_strict
          (L.points (Problem97.CGN.lastIndex Packet.hm))
          (Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCapRev L) :=
      Problem97.FiniteEndpoint.E3L20b_of_cgnCapData Packet Hside Hord
    have hlt :=
      hmono (i := i.rev) (j := Problem97.CGN.lastIndex Packet.hm) hi_rev_lt_last
    have hlast_rev_first : (Problem97.CGN.lastIndex Packet.hm).rev =
        Problem97.CGN.firstIndex Packet.hm := by
      ext
      rw [Fin.val_rev, Problem97.CGN.lastIndex_val]
      simp [Problem97.CGN.firstIndex]
      omega
    have hlt' : dist S.triangle.v1 Z.a2 < dist S.triangle.v1 S.triangle.v3 := by
      simpa [Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCapRev_points,
        hi, hFirstLast.1, hFirstLast.2, hlast_rev_first] using hlt
    simpa [hbase_eq] using hlt'
  · have hi_lt_last : i < Problem97.CGN.lastIndex Packet.hm := by
      apply Fin.lt_def.mpr
      rw [Problem97.CGN.lastIndex_val]
      have hi_ne_last : i ≠ Problem97.CGN.lastIndex Packet.hm := by
        intro hi_last
        apply ha2_ne_v3
        calc
          Z.a2 = L.points i := hi.symm
          _ = L.points (Problem97.CGN.lastIndex Packet.hm) := by simpa [hi_last]
          _ = S.triangle.v3 := hLastFirst.2
      have hi_lt_top : i.val < m := i.is_lt
      have hi_ne_top : i.val ≠ m - 1 := by
        intro hi_top
        apply hi_ne_last
        ext
        simpa [Problem97.CGN.lastIndex, Problem97.CGN.finIndex] using hi_top
      omega
    have hmono :
        Problem97.FiniteEndpoint.E3L20a_leftEndpoint_capDistance_strict
          (L.points (Problem97.CGN.firstIndex Packet.hm))
          (Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCap L) :=
      Problem97.FiniteEndpoint.E3L20a_of_cgnCapData Packet Hside Hord
    have hlt :=
      hmono (i := i) (j := Problem97.CGN.lastIndex Packet.hm) hi_lt_last
    have hlt' : dist S.triangle.v1 Z.a2 < dist S.triangle.v1 S.triangle.v3 := by
      simpa [Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCap_points,
        hi, hLastFirst.1, hLastFirst.2] using hlt
    simpa [hbase_eq] using hlt'

/-- In the Form-`b`, `x = b₂` branch at `v₁`, the selected upper witness
`b₂` lies strictly before `v₃` in the `v₁`-radial order on support cap `C₂`.
This is the direct `x = b₂` analogue of
`v1v3_longer_than_base_of_exact_packet`, using only the cap-order export on
`C₂` and the equality `|v₁b₂| = |v₁v₂|` from the Form-`b` packet. -/
private theorem v1b2_lt_v1v3_of_formB_v1_b2
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) {r : ℝ}
    (hB : S.IsFormB_v1 r)
    (hxb2 : ∃ h : (Z.b2 : ℝ²) ∈ S.I2,
      S.witnessClassAt_v1 r ∩ S.CP.C2 = ({Z.b2} : Finset ℝ²)) :
    dist S.triangle.v1 Z.b2 < dist S.triangle.v1 S.triangle.v3 := by
  classical
  rcases hxb2 with ⟨hB2, h_b2eq⟩
  rcases hB with ⟨x, hxI2, hxeq, hv2eq⟩
  have hb2T1 : Z.b2 ∈ S.witnessClassAt_v1 r := by
    have hb2mem : Z.b2 ∈ ({Z.b2} : Finset ℝ²) := by simp
    rw [← h_b2eq] at hb2mem
    exact (Finset.mem_inter.mp hb2mem).1
  have hv2T1 : S.triangle.v2 ∈ S.witnessClassAt_v1 r := by
    have hv2mem : S.triangle.v2 ∈ ({S.triangle.v2} : Finset ℝ²) := by simp
    rw [← hv2eq] at hv2mem
    exact (Finset.mem_inter.mp hv2mem).1
  have hbase_eq : dist S.triangle.v1 Z.b2 = dist S.triangle.v1 S.triangle.v2 := by
    have hv2dist : dist S.triangle.v1 S.triangle.v2 = r := by
      simpa using (Finset.mem_filter.mp hv2T1).2
    have hb2dist : dist S.triangle.v1 Z.b2 = r := by
      simpa using (Finset.mem_filter.mp hb2T1).2
    rw [hb2dist, hv2dist]
  have hb2C2 : Z.b2 ∈ S.CP.C2 := by
    unfold Problem97.FiniteEndpointShell.I2 at hB2
    exact (Finset.mem_erase.mp (Finset.mem_erase.mp hB2).2).2
  have hb2_ne_v3 : Z.b2 ≠ S.triangle.v3 := by
    unfold Problem97.FiniteEndpointShell.I2 at hB2
    exact (Finset.mem_erase.mp (Finset.mem_erase.mp hB2).2).1
  have hb2_ne_v1 : Z.b2 ≠ S.triangle.v1 := by
    unfold Problem97.FiniteEndpointShell.I2 at hB2
    exact (Finset.mem_erase.mp hB2).1
  rcases Problem97.CGN.CGN4g_capData_of_supportCap_oriented
      (A := A) (C := S.CP.C2) (M := S.triangle2)
      S.hconv S.hnoncol S.CP.C2_subset
      (fun x hxA => (S.CP.arc_membership x hxA).2.1)
      S.CP.v3_mem_C2 S.CP.v1_mem_C2 S.packet2 S.packet2.inner_at_v1 with
    ⟨m, L, Packet, Hside, Hord, hLC, hEnds⟩
  have hb2L : Z.b2 ∈ Finset.univ.image L.points := by
    rw [hLC]
    exact hb2C2
  rcases Finset.mem_image.mp hb2L with ⟨i, -, hi⟩
  rcases hEnds with hFirstLast | hLastFirst
  · have hi_ne_first : i ≠ Problem97.CGN.firstIndex Packet.hm := by
      intro hi_first
      apply hb2_ne_v3
      calc
        Z.b2 = L.points i := hi.symm
        _ = L.points (Problem97.CGN.firstIndex Packet.hm) := by simpa [hi_first]
        _ = S.triangle.v3 := hFirstLast.1
    have hi_rev_lt_last : i.rev < Problem97.CGN.lastIndex Packet.hm := by
      apply Fin.lt_def.mpr
      rw [Fin.val_rev, Problem97.CGN.lastIndex_val]
      have hi_pos : 0 < i.val := by
        apply Nat.pos_of_ne_zero
        intro hi_zero
        apply hi_ne_first
        ext
        simpa [Problem97.CGN.firstIndex] using hi_zero
      omega
    have hmono :
        Problem97.FiniteEndpoint.E3L20b_rightEndpoint_capDistance_strict
          (L.points (Problem97.CGN.lastIndex Packet.hm))
          (Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCapRev L) :=
      Problem97.FiniteEndpoint.E3L20b_of_cgnCapData Packet Hside Hord
    have hlt :=
      hmono (i := i.rev) (j := Problem97.CGN.lastIndex Packet.hm) hi_rev_lt_last
    have hlast_rev_first : (Problem97.CGN.lastIndex Packet.hm).rev =
        Problem97.CGN.firstIndex Packet.hm := by
      ext
      rw [Fin.val_rev, Problem97.CGN.lastIndex_val]
      simp [Problem97.CGN.firstIndex]
      omega
    simpa [Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCapRev_points,
      hi, hFirstLast.1, hFirstLast.2, hlast_rev_first] using hlt
  · have hi_lt_last : i < Problem97.CGN.lastIndex Packet.hm := by
      apply Fin.lt_def.mpr
      rw [Problem97.CGN.lastIndex_val]
      have hi_ne_last : i ≠ Problem97.CGN.lastIndex Packet.hm := by
        intro hi_last
        apply hb2_ne_v3
        calc
          Z.b2 = L.points i := hi.symm
          _ = L.points (Problem97.CGN.lastIndex Packet.hm) := by simpa [hi_last]
          _ = S.triangle.v3 := hLastFirst.2
      have hi_lt_top : i.val < m := i.is_lt
      have hi_ne_top : i.val ≠ m - 1 := by
        intro hi_top
        apply hi_ne_last
        ext
        simpa [Problem97.CGN.lastIndex, Problem97.CGN.finIndex] using hi_top
      omega
    have hmono :
        Problem97.FiniteEndpoint.E3L20a_leftEndpoint_capDistance_strict
          (L.points (Problem97.CGN.firstIndex Packet.hm))
          (Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCap L) :=
      Problem97.FiniteEndpoint.E3L20a_of_cgnCapData Packet Hside Hord
    have hlt :=
      hmono (i := i) (j := Problem97.CGN.lastIndex Packet.hm) hi_lt_last
    simpa [Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCap_points,
      hi, hLastFirst.1, hLastFirst.2] using hlt

private theorem base_transport_a2_eq_upper
    {q1 q2 a : ℝ²} {T0 : ℝ² → ℝ²}
    (tau0 : Problem97.CGN.SimilarityTransportData T0)
    (hq1 : T0 q1 = Problem97.CGN.vec2 (-1) 0)
    (hq2 : T0 q2 = Problem97.CGN.vec2 1 0)
    (hleft : dist q1 a = dist q1 q2)
    (hright : dist q2 a = dist q2 q1)
    (hypos : 0 < (T0 a) 1) :
    T0 a = Problem97.CGN.vec2 0 (Real.sqrt 3) := by
  have hleft_img : dist (T0 q1) (T0 a) = dist (T0 q1) (T0 q2) := by
    exact (tau0.dist_eq_iff q1 a q2).2 hleft
  have hright_img : dist (T0 q2) (T0 a) = dist (T0 q2) (T0 q1) := by
    exact (tau0.dist_eq_iff q2 a q1).2 hright
  have hdist_left : dist (T0 a) (Problem97.CGN.vec2 (-1) 0) = 2 := by
    calc
      dist (T0 a) (Problem97.CGN.vec2 (-1) 0) = dist (T0 q1) (T0 a) := by
        rw [hq1, dist_comm]
      _ = dist (T0 q1) (T0 q2) := hleft_img
      _ = 2 := by
        rw [hq1, hq2]
        rw [dist_eq_norm]
        have hvec :
            Problem97.CGN.vec2 (-1) 0 - Problem97.CGN.vec2 1 0 =
              Problem97.CGN.vec2 (-2) 0 := by
          ext i <;> fin_cases i <;>
            simp [Problem97.CGN.vec2, EuclideanSpace.single_apply]
          · norm_num
        rw [hvec]
        rw [EuclideanSpace.norm_eq]
        norm_num [Problem97.CGN.vec2, EuclideanSpace.single_apply]
  have hdist_right : dist (T0 a) (Problem97.CGN.vec2 1 0) = 2 := by
    calc
      dist (T0 a) (Problem97.CGN.vec2 1 0) = dist (T0 q2) (T0 a) := by
        rw [hq2, dist_comm]
      _ = dist (T0 q2) (T0 q1) := hright_img
      _ = 2 := by
        rw [hq1, hq2]
        rw [dist_eq_norm]
        have hvec :
            Problem97.CGN.vec2 1 0 - Problem97.CGN.vec2 (-1) 0 =
              Problem97.CGN.vec2 2 0 := by
          ext i <;> fin_cases i <;>
            simp [Problem97.CGN.vec2, EuclideanSpace.single_apply]
          · norm_num
        rw [hvec]
        rw [EuclideanSpace.norm_eq]
        norm_num [Problem97.CGN.vec2, EuclideanSpace.single_apply]
  have hsq_left :
      ((T0 a) 0 + 1) ^ 2 + ((T0 a) 1) ^ 2 = 4 := by
    have hsq :
        ((T0 a) 0 + 1) ^ 2 + ((T0 a) 1) ^ 2 = dist (T0 a) (Problem97.CGN.vec2 (-1) 0) ^ 2 := by
      symm
      simpa [Problem97.CGN.vec2, EuclideanSpace.single_apply, add_comm, add_left_comm, add_assoc,
        sub_eq_add_neg] using
        (dist_sq_eq_coord_sq_add_coord_sq (T0 a) (Problem97.CGN.vec2 (-1) 0))
    nlinarith
  have hsq_right :
      ((T0 a) 0 - 1) ^ 2 + ((T0 a) 1) ^ 2 = 4 := by
    have hsq :
        ((T0 a) 0 - 1) ^ 2 + ((T0 a) 1) ^ 2 = dist (T0 a) (Problem97.CGN.vec2 1 0) ^ 2 := by
      symm
      simpa [Problem97.CGN.vec2, EuclideanSpace.single_apply, add_comm, add_left_comm, add_assoc,
        sub_eq_add_neg] using
        (dist_sq_eq_coord_sq_add_coord_sq (T0 a) (Problem97.CGN.vec2 1 0))
    nlinarith
  have hx0 : (T0 a) 0 = 0 := by
    nlinarith [hsq_left, hsq_right]
  have hy_sq : ((T0 a) 1) ^ 2 = 3 := by
    nlinarith [hsq_left, hx0]
  have hy_eq : (T0 a) 1 = Real.sqrt 3 := by
    have hsqeq : ((T0 a) 1) ^ 2 = (Real.sqrt 3) ^ 2 := by
      rw [Real.sq_sqrt (show (0 : ℝ) ≤ 3 by positivity)]
      exact hy_sq
    rcases sq_eq_sq_iff_eq_or_eq_neg.mp hsqeq with h | h
    · exact h
    · exfalso
      have hsqrt_nonneg : 0 ≤ Real.sqrt 3 := by positivity
      have hy_nonneg : 0 ≤ (T0 a) 1 := le_of_lt hypos
      linarith
  ext i <;> fin_cases i
  · simpa [Problem97.CGN.vec2, EuclideanSpace.single_apply] using hx0
  · calc
      (T0 a) 1 = Real.sqrt 3 := hy_eq
      _ = (Problem97.CGN.vec2 0 (Real.sqrt 3)) 1 := by
        simp [Problem97.CGN.vec2, EuclideanSpace.single_apply]

private theorem delta_parameterization_of_normalized_apex
    (p : ℝ²)
    (hunit : dist p (Problem97.CGN.vec2 1 0) = 1)
    (hupper : 0 < p 1)
    (horigin_sq_le_two : dist (Problem97.CGN.vec2 0 0) p ^ 2 ≤ 2)
    (horigin_gt_one : 1 < dist (Problem97.CGN.vec2 0 0) p) :
    ∃ δ : ℝ,
      p =
        Problem97.CGN.vec2
          (2 * Real.cos δ * Real.cos δ)
          (2 * Real.cos δ * Real.sin δ) ∧
      Real.pi / 4 ≤ δ ∧
      δ < Real.pi / 3 := by
  let x : ℝ := p 0
  let y : ℝ := p 1
  let u : ℝ := x - 1
  have hcircle :
      u ^ 2 + y ^ 2 = 1 := by
    have hdist_sq : dist p (Problem97.CGN.vec2 1 0) ^ 2 = 1 := by
      have hnonneg : 0 ≤ dist p (Problem97.CGN.vec2 1 0) := dist_nonneg
      nlinarith [hunit, hnonneg]
    have hcoord :
        dist p (Problem97.CGN.vec2 1 0) ^ 2 = u ^ 2 + y ^ 2 := by
      dsimp [u, x, y]
      rw [dist_sq_eq_coord_sq_add_coord_sq]
      simp [Problem97.CGN.vec2, EuclideanSpace.single_apply]
    linarith
  have horigin_sq :
      dist (Problem97.CGN.vec2 0 0) p ^ 2 = x ^ 2 + y ^ 2 := by
    dsimp [x, y]
    rw [dist_sq_eq_coord_sq_add_coord_sq]
    simp [Problem97.CGN.vec2, EuclideanSpace.single_apply]
  have hx2y2_eq_twox : x ^ 2 + y ^ 2 = 2 * x := by
    dsimp [u] at hcircle
    nlinarith
  have hx_le_one : x ≤ 1 := by
    rw [horigin_sq] at horigin_sq_le_two
    nlinarith [horigin_sq_le_two, hx2y2_eq_twox]
  have horigin_sq_gt_one : 1 < x ^ 2 + y ^ 2 := by
    rw [← horigin_sq]
    have hnonneg : 0 ≤ dist (Problem97.CGN.vec2 0 0) p := dist_nonneg
    nlinarith [horigin_gt_one]
  have hx_gt_half : (1 : ℝ) / 2 < x := by
    nlinarith [horigin_sq_gt_one, hx2y2_eq_twox]
  have hu_le_zero : u ≤ 0 := by
    dsimp [u]
    linarith
  have hu_gt_neg_half : -(1 : ℝ) / 2 < u := by
    dsimp [u]
    linarith
  have hu_sq_lt_one : u ^ 2 < 1 := by
    have hy_sq_pos : 0 < y ^ 2 := sq_pos_of_pos (by simpa [y] using hupper)
    nlinarith [hcircle, hy_sq_pos]
  have hu_bounds : -1 ≤ u ∧ u ≤ 1 := by
    constructor
    · nlinarith [hu_sq_lt_one]
    · linarith
  let δ : ℝ := Real.arccos u / 2
  have hδ_lo : Real.pi / 4 ≤ δ := by
    have hhalf : Real.pi / 2 ≤ Real.arccos u := by
      by_contra hlt
      have hupos : 0 < u := by
        exact (Real.arccos_lt_pi_div_two).1 (lt_of_not_ge hlt)
      linarith
    dsimp [δ]
    linarith
  have harccos_neg_half :
      Real.arccos (-(1 / 2 : ℝ)) = 2 * Real.pi / 3 := by
    have harccos_half : Real.arccos ((1 : ℝ) / 2) = Real.pi / 3 := by
      have hlo : 0 ≤ Real.pi / 3 := by positivity
      have hhi : Real.pi / 3 ≤ Real.pi := by
        have hpi : 0 < Real.pi := Real.pi_pos
        linarith
      simpa [Real.cos_pi_div_three] using (Real.arccos_cos hlo hhi)
    rw [Real.arccos_neg, harccos_half]
    nlinarith [Real.pi_pos]
  have hδ_hi : δ < Real.pi / 3 := by
    have hu_gt_neg_half' : (-(1 / 2 : ℝ)) < u := by
      have htmp := hu_gt_neg_half
      norm_num at htmp ⊢
      exact htmp
    have harccos_lt :
        Real.arccos u < 2 * Real.pi / 3 := by
      have hlt :=
        Real.arccos_lt_arccos (x := (-(1 / 2 : ℝ))) (y := u)
          (by norm_num) hu_gt_neg_half' hu_bounds.2
      rwa [harccos_neg_half] at hlt
    change Real.arccos u / 2 < Real.pi / 3
    linarith
  have hcos2δ : Real.cos (2 * δ) = u := by
    dsimp [δ]
    have htwo : 2 * (Real.arccos u / 2) = Real.arccos u := by ring
    rw [htwo, Real.cos_arccos hu_bounds.1 hu_bounds.2]
  have hy_sq :
      y ^ 2 = 1 - u ^ 2 := by
    nlinarith [hcircle]
  have hy_eq_sqrt :
      y = Real.sqrt (1 - u ^ 2) := by
    have hnonneg : 0 ≤ 1 - u ^ 2 := by
      nlinarith [hcircle, sq_nonneg y]
    have hsqeq : y ^ 2 = (Real.sqrt (1 - u ^ 2)) ^ 2 := by
      rw [Real.sq_sqrt hnonneg]
      exact hy_sq
    rcases sq_eq_sq_iff_eq_or_eq_neg.mp hsqeq with hy' | hy'
    · exact hy'
    · exfalso
      have hsqrt_nonneg : 0 ≤ Real.sqrt (1 - u ^ 2) := by positivity
      have hy_nonneg : 0 ≤ y := le_of_lt (by simpa [y] using hupper)
      linarith
  have hsin2δ : Real.sin (2 * δ) = y := by
    dsimp [δ]
    have htwo : 2 * (Real.arccos u / 2) = Real.arccos u := by ring
    rw [htwo, Real.sin_arccos]
    exact hy_eq_sqrt.symm
  have hx_formula : x = 2 * Real.cos δ * Real.cos δ := by
    calc
      x = 1 + u := by
        dsimp [u]
        ring
      _ = 1 + Real.cos (2 * δ) := by rw [hcos2δ]
      _ = 2 * Real.cos δ * Real.cos δ := by
        rw [Real.cos_two_mul]
        nlinarith [Real.sin_sq_add_cos_sq δ]
  have hy_formula : y = 2 * Real.cos δ * Real.sin δ := by
    calc
      y = Real.sin (2 * δ) := hsin2δ.symm
      _ = 2 * Real.sin δ * Real.cos δ := by rw [Real.sin_two_mul]
      _ = 2 * Real.cos δ * Real.sin δ := by ring
  refine ⟨δ, ?_, hδ_lo, hδ_hi⟩
  ext i <;> fin_cases i
  · simpa [x, Problem97.CGN.vec2, EuclideanSpace.single_apply] using hx_formula
  · simpa [y, Problem97.CGN.vec2, EuclideanSpace.single_apply] using hy_formula

/-
Construct the exact `delta`-normalization packet for the `q = a₂` row from
the forced `v₂` selector packet.  The proof follows the pinned route: choose a
base transport, flip it if necessary so that `v₃` lies above the base chord,
identify `a₂` with the upper equilateral intersection, postcompose by the
fixed half-shift similarity, and package the resulting point on the unit circle
around `(1,0)` using `δ = arccos ((T(v₃))ₓ - 1) / 2`. -/
set_option maxHeartbeats 8000000 in
theorem i3_v3_a2_delta_normalization_of_exact_packet
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) :
    S.I3V3A2DeltaNormalizationOfExactPacket Z := by
  classical
  intro r s hbranch hexact
  have hbranch0 := hbranch
  let q1 : ℝ² := S.triangle.v1
  let q2 : ℝ² := S.triangle.v2
  let q3 : ℝ² := S.triangle.v3
  let a : ℝ² := Z.a2
  rcases hbranch with ⟨⟨hA2, h_a2eq, h_v2eq⟩, hs_pos, hpacket⟩
  have haT1 : a ∈ S.witnessClassAt_v1 r := by
    have hamem : a ∈ ({a} : Finset ℝ²) := by simp
    rw [← h_a2eq] at hamem
    exact (Finset.mem_inter.mp hamem).1
  have hv2T1 : q2 ∈ S.witnessClassAt_v1 r := by
    have hv2mem : q2 ∈ ({q2} : Finset ℝ²) := by simp [q2]
    rw [← h_v2eq] at hv2mem
    exact (Finset.mem_inter.mp hv2mem).1
  have haT2 : a ∈ S.witnessClassAt_v2 s := by
    have hamem : a ∈ insert Z.a2 (insert Z.b2 ({S.triangle.v3, S.triangle.v1} : Finset ℝ²)) := by
      simp [a]
    rw [← hexact] at hamem
    exact hamem
  have hv1T2 : q1 ∈ S.witnessClassAt_v2 s := by
    have hv1mem : q1 ∈ insert Z.a2 (insert Z.b2 ({S.triangle.v3, S.triangle.v1} : Finset ℝ²)) := by
      simp [q1]
    rw [← hexact] at hv1mem
    exact hv1mem
  have hv3T2 : q3 ∈ S.witnessClassAt_v2 s := by
    have hv3mem : q3 ∈ insert Z.a2 (insert Z.b2 ({S.triangle.v3, S.triangle.v1} : Finset ℝ²)) := by
      simp [q3]
    rw [← hexact] at hv3mem
    exact hv3mem
  have hleft : dist q1 a = dist q1 q2 := by
    have hr_q1a : dist q1 a = r := by
      simpa [q1, a] using (Finset.mem_filter.mp haT1).2
    have hr_q1q2 : dist q1 q2 = r := by
      simpa [q1, q2] using (Finset.mem_filter.mp hv2T1).2
    rw [hr_q1a, hr_q1q2]
  have hright : dist q2 a = dist q2 q1 := by
    have hs_q2a : dist q2 a = s := by
      simpa [q2, a] using (Finset.mem_filter.mp haT2).2
    have hs_q2q1 : dist q2 q1 = s := by
      simpa [q1, q2] using (Finset.mem_filter.mp hv1T2).2
    rw [hs_q2a, hs_q2q1]
  have hq2q3_eq : dist q2 q3 = dist q2 q1 := by
    have hs_q2q3 : dist q2 q3 = s := by
      simpa [q2, q3] using (Finset.mem_filter.mp hv3T2).2
    have hs_q2q1 : dist q2 q1 = s := by
      simpa [q1, q2] using (Finset.mem_filter.mp hv1T2).2
    rw [hs_q2q3, hs_q2q1]
  have hinner_dist :
      dist q1 q3 ^ 2 ≤ dist q1 q2 ^ 2 + dist q2 q3 ^ 2 := by
    have hvec : q1 - q3 = (q1 - q2) - (q3 - q2) := by
      dsimp [q1, q2, q3]
      abel_nf
    have hinner : 0 ≤ inner ℝ (q3 - q2) (q1 - q2) := by
      simpa [q1, q2, q3] using S.Packet.inner_at_v2
    have hinner' : 0 ≤ inner ℝ (q1 - q2) (q3 - q2) := by
      simpa [real_inner_comm] using hinner
    calc
      dist q1 q3 ^ 2 = ‖q1 - q3‖ ^ 2 := by rw [dist_eq_norm]
      _ = ‖q1 - q2‖ ^ 2 - 2 * inner ℝ (q1 - q2) (q3 - q2) + ‖q3 - q2‖ ^ 2 := by
        rw [hvec, norm_sub_sq_real]
      _ ≤ ‖q1 - q2‖ ^ 2 + ‖q3 - q2‖ ^ 2 := by
        nlinarith
      _ = dist q1 q2 ^ 2 + dist q2 q3 ^ 2 := by
        rw [dist_eq_norm, dist_eq_norm]
        congr 1
        rw [norm_sub_rev]
  have hlong : dist q1 q2 < dist q1 q3 :=
    S.v1v3_longer_than_base_of_exact_packet (Z := Z) hbranch0 hexact
  have hq1ne : q1 ≠ q2 := by
    simpa [q1, q2] using S.triangle.v12_ne
  rcases exists_base_transportData q1 q2 hq1ne with
    ⟨Tbase, tauBase, hv1Base, hv2Base⟩
  have horientBase_ne : tauBase.orientation ≠ 0 := by
    intro h0
    have : (0 : ℝ) ^ 2 = 1 := by simpa [h0] using tauBase.orientation_sq
    norm_num at this
  have hq3_base_nonzero : (Tbase q3) 1 ≠ 0 := by
    have hq3_sa_ne :
        signedArea2 q3 q1 q2 ≠ 0 := by
      have hv1O : ‖q1 - S.Packet.center‖ = S.Packet.radius := by
        simpa [q1] using S.Packet.moser_on_boundary_1
      have hv2O : ‖q2 - S.Packet.center‖ = S.Packet.radius := by
        simpa [q2] using S.Packet.moser_on_boundary_2
      have hv3O : ‖q3 - S.Packet.center‖ = S.Packet.radius := by
        simpa [q3] using S.Packet.moser_on_boundary_3
      exact MEC.signedArea2_ne_zero_of_three_dist_eq
        hv3O hv1O hv2O
        S.triangle.v13_ne.symm S.triangle.v12_ne S.triangle.v23_ne.symm
    have himg_ne :
        signedArea2 (Tbase q3) (Tbase q1) (Tbase q2) ≠ 0 := by
      rw [tauBase.halfplane_sign q3 q1 q2]
      exact mul_ne_zero
        (mul_ne_zero horientBase_ne (pow_ne_zero 2 (ne_of_gt tauBase.scale_pos)))
        hq3_sa_ne
    intro h0
    apply himg_ne
    rw [hv1Base, hv2Base, signedArea2_baseChord_vec2]
    linarith
  have build_from :
      ∀ {T0 : ℝ² → ℝ²},
        (tau0 : Problem97.CGN.SimilarityTransportData T0) →
        T0 q1 = Problem97.CGN.vec2 (-1) 0 →
        T0 q2 = Problem97.CGN.vec2 1 0 →
        0 < (T0 q3) 1 →
        S.I3V3A2DeltaNormalization Z := by
    intro T0 tau0 hv1 hv2 hq3y_pos
    have hside_a :
        signedArea2 a q1 q2 * signedArea2 q3 q1 q2 > 0 := by
      exact S.C2_same_open_side_of_base_chord_as_v3 (Z := Z) hbranch0 hexact a (by simp [a, q3])
    have hq3_img_pos :
        0 < signedArea2 (T0 q3) (T0 q1) (T0 q2) := by
      rw [hv1, hv2, signedArea2_baseChord_vec2]
      linarith
    have hprod_img :
        0 < signedArea2 (T0 a) (T0 q1) (T0 q2) *
          signedArea2 (T0 q3) (T0 q1) (T0 q2) := by
      rw [tau0.halfplane_sign a q1 q2, tau0.halfplane_sign q3 q1 q2]
      have hscale_sq_pos : 0 < tau0.scale ^ 2 := sq_pos_of_ne_zero (ne_of_gt tau0.scale_pos)
      have hrew :
          (tau0.orientation * (tau0.scale ^ 2) * signedArea2 a q1 q2) *
              (tau0.orientation * (tau0.scale ^ 2) * signedArea2 q3 q1 q2) =
            (tau0.orientation ^ 2) * (tau0.scale ^ 2 * tau0.scale ^ 2) *
              (signedArea2 a q1 q2 * signedArea2 q3 q1 q2) := by
        ring
      rw [hrew, tau0.orientation_sq]
      exact mul_pos (mul_pos (by positivity) (mul_pos hscale_sq_pos hscale_sq_pos)) hside_a
    have ha_img_pos :
        0 < signedArea2 (T0 a) (T0 q1) (T0 q2) := by
      by_contra hnot
      have hnonpos : signedArea2 (T0 a) (T0 q1) (T0 q2) ≤ 0 := by linarith
      have : signedArea2 (T0 a) (T0 q1) (T0 q2) *
          signedArea2 (T0 q3) (T0 q1) (T0 q2) ≤ 0 :=
        mul_nonpos_of_nonpos_of_nonneg hnonpos (le_of_lt hq3_img_pos)
      linarith
    have ha_y_pos : 0 < (T0 a) 1 := by
      rw [hv1, hv2, signedArea2_baseChord_vec2] at ha_img_pos
      linarith
    have ha2T0 : T0 a = Problem97.CGN.vec2 0 (Real.sqrt 3) := by
      exact base_transport_a2_eq_upper tau0 hv1 hv2 hleft hright ha_y_pos
    rcases S.i3_v3_a2_base_chord_side_signs_of_exact_packet
        (Z := Z) hbranch0 hexact tau0 hv1 hv2 ha2T0 with
      ⟨hq3y_pos0, hbelow0⟩
    let T : ℝ² → ℝ² := fun x => halfShift (T0 x)
    let tau : Problem97.CGN.SimilarityTransportData T :=
      similarityTransportComp tau0 halfShiftSimilarityTransportData
    have hv1T : T q1 = Problem97.CGN.vec2 0 0 := by
      dsimp [T]
      rw [hv1]
      ext i <;> fin_cases i <;>
        simp [halfShift, Problem97.CGN.vec2, EuclideanSpace.single_apply]
    have hv2T : T q2 = Problem97.CGN.vec2 1 0 := by
      dsimp [T]
      rw [hv2]
      ext i <;> fin_cases i <;>
        simp [halfShift, Problem97.CGN.vec2, EuclideanSpace.single_apply]
    have ha2T : T a = Problem97.CGN.vec2 ((1 : ℝ) / 2) (Real.sqrt 3 / 2) := by
      dsimp [T]
      rw [ha2T0]
      ext i <;> fin_cases i <;>
        simp [halfShift, Problem97.CGN.vec2, EuclideanSpace.single_apply]
    have hbelow :
        ∀ x ∈ S.I3, (T x) 1 < 0 := by
      intro x hxI3
      dsimp [T]
      have hxlt := hbelow0 x hxI3
      simp [halfShift, Problem97.CGN.vec2, EuclideanSpace.single_apply]
      linarith
    have hq3y_T : 0 < (T q3) 1 := by
      dsimp [T]
      simp [halfShift, Problem97.CGN.vec2, EuclideanSpace.single_apply]
      linarith
    have hdist_q2q3 :
        dist (T q2) (T q3) = dist (T q2) (T q1) := by
      exact (tau.dist_eq_iff q2 q3 q1).2 hq2q3_eq
    have hbase_dist :
        dist (T q2) (T q1) = 1 := by
      rw [hv2T, hv1T, dist_eq_norm]
      have hvec :
          Problem97.CGN.vec2 1 0 - Problem97.CGN.vec2 0 0 =
            Problem97.CGN.vec2 1 0 := by
        ext i <;> fin_cases i <;>
          simp [Problem97.CGN.vec2, EuclideanSpace.single_apply]
      rw [hvec, EuclideanSpace.norm_eq]
      norm_num [Problem97.CGN.vec2, EuclideanSpace.single_apply]
    have hdist_q2q3_one : dist (T q2) (T q3) = 1 := by
      rw [hdist_q2q3, hbase_dist]
    have hnonobtuse_T :
        dist (T q1) (T q3) ^ 2 ≤ dist (T q1) (T q2) ^ 2 + dist (T q2) (T q3) ^ 2 := by
      have hmul :
          tau.scale ^ 2 * dist q1 q3 ^ 2 ≤
            tau.scale ^ 2 * (dist q1 q2 ^ 2 + dist q2 q3 ^ 2) := by
        exact mul_le_mul_of_nonneg_left hinner_dist (sq_nonneg tau.scale)
      have hscaled :
          (tau.scale * dist q1 q3) ^ 2 ≤
            (tau.scale * dist q1 q2) ^ 2 + (tau.scale * dist q2 q3) ^ 2 := by
        nlinarith [hmul]
      simpa [tau.dist_image] using hscaled
    have hlong_T : dist (T q1) (T q2) < dist (T q1) (T q3) := by
      rw [tau.dist_image, tau.dist_image]
      nlinarith [hlong, tau.scale_pos]
    have horigin_sq_le_two :
        dist (Problem97.CGN.vec2 0 0) (T q3) ^ 2 ≤ 2 := by
      have hdist_q1q2_sq :
          dist (T q1) (T q2) ^ 2 = 1 := by
        have hdist : dist (T q1) (T q2) = 1 := by
          rw [dist_comm]
          exact hbase_dist
        have hnonneg : 0 ≤ dist (T q1) (T q2) := dist_nonneg
        nlinarith [hdist, hnonneg]
      have hdist_q2q3_sq :
          dist (T q2) (T q3) ^ 2 = 1 := by
        have hnonneg : 0 ≤ dist (T q2) (T q3) := dist_nonneg
        nlinarith [hdist_q2q3_one, hnonneg]
      have htmp := hnonobtuse_T
      rw [hdist_q1q2_sq, hdist_q2q3_sq] at htmp
      have : dist (Problem97.CGN.vec2 0 0) (T q3) ^ 2 ≤ 2 := by
        have htmp' : dist (Problem97.CGN.vec2 0 0) (T q3) ^ 2 ≤ 1 + 1 := by
          simpa [hv1T, dist_comm] using htmp
        nlinarith [htmp']
      exact this
    have horigin_gt_one :
        1 < dist (Problem97.CGN.vec2 0 0) (T q3) := by
      have h01 : dist (Problem97.CGN.vec2 0 0) (Problem97.CGN.vec2 1 0) = 1 := by
        rw [dist_eq_norm]
        have hvec :
            Problem97.CGN.vec2 0 0 - Problem97.CGN.vec2 1 0 =
              Problem97.CGN.vec2 (-1) 0 := by
          ext i <;> fin_cases i <;>
            simp [Problem97.CGN.vec2, EuclideanSpace.single_apply]
        rw [hvec, EuclideanSpace.norm_eq]
        norm_num [Problem97.CGN.vec2, EuclideanSpace.single_apply]
      have hlong_T' := hlong_T
      rw [hv1T, hv2T] at hlong_T'
      simpa [h01] using hlong_T'
    have hunit_T :
        dist (T q3) (Problem97.CGN.vec2 1 0) = 1 := by
      simpa [hv2T, dist_comm] using hdist_q2q3_one
    rcases delta_parameterization_of_normalized_apex
        (p := T q3) hunit_T hq3y_T horigin_sq_le_two horigin_gt_one with
      ⟨δ, hv3T, hδ_lo, hδ_hi⟩
    refine ⟨T, tau, δ, hv1T, hv2T, ha2T, hv3T, hδ_lo, hδ_hi, hbelow⟩
  by_cases hq3pos : 0 < (Tbase q3) 1
  · exact build_from tauBase hv1Base hv2Base hq3pos
  · let Tflip : ℝ² → ℝ² := fun x => flipY (Tbase x)
    let tauFlip : Problem97.CGN.SimilarityTransportData Tflip :=
      similarityTransportComp tauBase flipYSimilarityTransportData
    have hv1Flip : Tflip q1 = Problem97.CGN.vec2 (-1) 0 := by
      dsimp [Tflip]
      rw [hv1Base]
      ext i <;> fin_cases i <;>
        simp [flipY, Problem97.CGN.vec2, EuclideanSpace.single_apply]
    have hv2Flip : Tflip q2 = Problem97.CGN.vec2 1 0 := by
      dsimp [Tflip]
      rw [hv2Base]
      ext i <;> fin_cases i <;>
        simp [flipY, Problem97.CGN.vec2, EuclideanSpace.single_apply]
    have hq3Flip : 0 < (Tflip q3) 1 := by
      dsimp [Tflip]
      simp [flipY, Problem97.CGN.vec2, EuclideanSpace.single_apply]
      have hq3neg : (Tbase q3) 1 < 0 := by
        have hle : (Tbase q3) 1 ≤ 0 := le_of_not_gt hq3pos
        exact lt_of_le_of_ne hle hq3_base_nonzero
      linarith
    exact build_from tauFlip hv1Flip hv2Flip hq3Flip

/-- The `q = a₂` row's forced exact packet immediately yields the normalized
height-gap export by composing the exact-packet delta normalization with the
already-closed coordinate consumer. -/
theorem i3_v3_a2_normalized_height_gap_of_exact_packet
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) {r s : ℝ}
    (hbranch : FormBv1A2SelectorV2Qv1Packet S Z r s)
    (hexact : S.witnessClassAt_v2 s =
      insert Z.a2 (insert Z.b2 ({S.triangle.v3, S.triangle.v1} : Finset ℝ²))) :
    S.I3V3A2NormalizedHeightGap Z := by
  have hdelta : S.I3V3A2DeltaNormalizationOfExactPacket Z :=
    S.i3_v3_a2_delta_normalization_of_exact_packet Z
  exact S.i3_v3_a2_normalized_height_gap_of_delta_normalization Z
    (hdelta hbranch hexact)

/-- Under the forced exact packet for the `q = a₂` row, no lower-chain point
of `I₃` lies on the circle centered at `v₃` through `a₂`. -/
theorem i3_no_point_on_v3_radius_at_a2_of_exact_packet
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) {r s : ℝ}
    (hbranch : FormBv1A2SelectorV2Qv1Packet S Z r s)
    (hexact : S.witnessClassAt_v2 s =
      insert Z.a2 (insert Z.b2 ({S.triangle.v3, S.triangle.v1} : Finset ℝ²))) :
    S.I3NoPointOnV3RadiusAtA2 Z := by
  exact S.i3_no_point_on_v3_radius_at_a2_of_normalized_height_gap Z
    (S.i3_v3_a2_normalized_height_gap_of_exact_packet Z hbranch hexact)

/-- Public shell export for the `q = a₂` row: once the `v₂` selector has been
forced to the exact packet, at most one lower-chain point can lie on the
circle centered at `v₃` through `a₂`. -/
theorem i3_on_v3_radius_at_a2_card_le_one_of_exact_packet
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) {r s : ℝ}
    (hbranch : FormBv1A2SelectorV2Qv1Packet S Z r s)
    (hexact : S.witnessClassAt_v2 s =
      insert Z.a2 (insert Z.b2 ({S.triangle.v3, S.triangle.v1} : Finset ℝ²))) :
    S.I3OnV3RadiusAtA2CardLeOne Z := by
  exact S.i3_on_v3_radius_at_a2_card_le_one_of_no_hit Z
    (S.i3_no_point_on_v3_radius_at_a2_of_exact_packet Z hbranch hexact)

/-- Close the `q = a₂` selector row once the companion `v₂` selector has
already been forced to the exact packet.  This is the sanctioned composition:
exact packet to shell bound, then shell bound to selector contradiction. -/
theorem selectorShape_v3_q_eq_a2_impossible_of_exact_packet
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) {r s t : ℝ}
    (hbranch : FormBv1A2SelectorV2Qv1Packet S Z r s)
    (hexact : S.witnessClassAt_v2 s =
      insert Z.a2 (insert Z.b2 ({S.triangle.v3, S.triangle.v1} : Finset ℝ²)))
    (hpacket : SelectorV3Qa2Packet S Z t) :
    False := by
  exact S.selectorShape_v3_q_eq_a2_impossible Z hpacket
    (S.i3_on_v3_radius_at_a2_card_le_one_of_exact_packet Z hbranch hexact)

/-- The branch-local geometric input used to force the named `C₁` witness in
the `q = v₁` row of the `v₂` selector to be `v₃`.  This is exactly the
lower-unit-circle exclusion from the prose, expressed only in the form the
row theorem consumes. -/
abbrev SharedCirclePointForcesV3
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) (r s : ℝ) : Prop :=
  ∀ p : ℝ²,
    p ∈ ({Z.a1, Z.b1, S.triangle.v3} : Finset ℝ²) →
    p ∈ S.witnessClassAt_v2 s →
    p ∈ S.witnessClassAt_v1 r →
    p = S.triangle.v3

/-- The `x = b₂` branch from Form `b` at `v₁`, together with the forced `v₂`
selector trichotomy. -/
private def FormBv1B2WithSelectorV2
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) (r : ℝ) : Prop :=
  ∃ h2 : (Z.b2 : ℝ²) ∈ S.I2,
    S.witnessClassAt_v1 r ∩ S.CP.C2 = ({Z.b2} : Finset ℝ²) ∧
    ∃ s : ℝ, 0 < s ∧ SelectorV2SplitPacket S Z s

/-- The `x = b₂`, `p = D` lower-side packet from the prose: the `v₁` Form-`b`
class chooses `b₂`, and the forced `v₂` selector chooses the named `C₁`
witness `v₃` together with one lower-chain witness from `{a₃,b₃}`. -/
private def FormBv1B2SelectorV2LowerPacket
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) (r s : ℝ) : Prop :=
  let T := S.witnessClassAt_v2 s
  (Z.b2 : ℝ²) ∈ S.I2 ∧
  S.witnessClassAt_v1 r ∩ S.CP.C2 = ({Z.b2} : Finset ℝ²) ∧
  T.card = 4 ∧
  S.I2 ⊆ T ∧
  T ∩ S.CP.C1 = ({S.triangle.v3} : Finset ℝ²) ∧
  ((T ∩ S.CP.C3 = ({Z.a3} : Finset ℝ²)) ∨
   (T ∩ S.CP.C3 = ({Z.b3} : Finset ℝ²)))

/-- `N4d-b1/b2/b5` branch packet at `v₁`: a Form `b` witness first chooses
`x ∈ {a₂,b₂}`, and independently the forced `v₂` selector falls into the
documented trichotomy `v₁ / a₃ / b₃` on the `C₃` side. -/
theorem formB_v1_split_with_selector_v2
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) {r : ℝ}
    (hB : S.IsFormB_v1 r) :
    FormBv1A2WithSelectorV2 S Z r ∨ FormBv1B2WithSelectorV2 S Z r := by
  rcases S.formB_v1_split Z hB with hxa2 | hxb2
  · rcases hxa2 with ⟨ha2, hxa2eq⟩
    rcases S.selectorShape_v2_split Z with ⟨s, hs, hsplit⟩
    exact Or.inl ⟨ha2, hxa2eq, s, hs, hsplit⟩
  · rcases hxb2 with ⟨hb2, hxb2eq⟩
    rcases S.selectorShape_v2_split Z with ⟨s, hs, hsplit⟩
    exact Or.inr ⟨hb2, hxb2eq, s, hs, hsplit⟩

/-- `N4d-bB-2`: in the `x = b₂`, `p = D` lower-side branch, the `q' = A`
column of the `v₃` selector is impossible.  The proof is exactly the pinned
route: the lower-side witness gives `|v₂q| < |v₂v₁|`, the Form-`b`, `x=b₂`
packet gives `|v₂v₁| < |v₃v₁|`, and the existing `q = v₁` selector
contradiction on `S(v₃)` closes the row. -/
theorem n4d_bB_2_q_eq_v1_impossible
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) {r s t : ℝ}
    (hB : S.IsFormB_v1 r)
    (hlower : FormBv1B2SelectorV2LowerPacket S Z r s)
    (hpacket3 : SelectorV3Qv1Packet S Z t) :
    False := by
  classical
  rcases hlower with ⟨hB2, hb2eq, hTcard, hI2sub, hC1eq, hC3eq⟩
  let T := S.witnessClassAt_v2 s
  have hv3T : S.triangle.v3 ∈ T := by
    have hmem : S.triangle.v3 ∈ ({S.triangle.v3} : Finset ℝ²) := by simp
    rw [← hC1eq] at hmem
    exact (Finset.mem_inter.mp hmem).1
  have hq :
      (Z.a3 : ℝ²) ∈ T ∩ S.CP.C3 ∨ (Z.b3 : ℝ²) ∈ T ∩ S.CP.C3 := by
    rcases hC3eq with hqa3 | hqb3
    · left
      have hmem : Z.a3 ∈ ({Z.a3} : Finset ℝ²) := by simp
      rw [← hqa3] at hmem
      exact hmem
    · right
      have hmem : Z.b3 ∈ ({Z.b3} : Finset ℝ²) := by simp
      rw [← hqb3] at hmem
      exact hmem
  obtain ⟨q, hqI3, hqT2⟩ : ∃ q : ℝ², q ∈ S.I3 ∧ q ∈ T := by
    rcases hq with hqa3 | hqb3
    · refine ⟨Z.a3, ?_, ?_⟩
      · rw [Z.hI3]
        simp
      · exact (Finset.mem_inter.mp hqa3).1
    · refine ⟨Z.b3, ?_, ?_⟩
      · rw [Z.hI3]
        simp
      · exact (Finset.mem_inter.mp hqb3).1
  have hv3rad : dist S.triangle.v2 S.triangle.v3 = s := by
    simpa using (Finset.mem_filter.mp hv3T).2
  have hqrad : dist S.triangle.v2 q = s := by
    simpa using (Finset.mem_filter.mp hqT2).2
  have hq_lt_base : dist S.triangle.v2 q < dist S.triangle.v2 S.triangle.v1 := by
    rcases Problem97.CGN.CGN4g_capData_of_supportCap_oriented
        (A := A) (C := S.CP.C3) (M := S.triangle3)
        S.hconv S.hnoncol S.CP.C3_subset
        (fun x hxA => (S.CP.arc_membership x hxA).2.2)
        S.CP.v1_mem_C3 S.CP.v2_mem_C3 S.packet3 S.packet3.inner_at_v1 with
      ⟨m, L, Packet, Hside, Hord, hLC, hEnds⟩
    have hqC3 : q ∈ S.CP.C3 := by
      unfold Problem97.FiniteEndpointShell.I3 at hqI3
      exact Finset.mem_of_mem_erase (Finset.mem_of_mem_erase hqI3)
    have hqL : q ∈ Finset.univ.image L.points := by
      rw [hLC]
      exact hqC3
    rcases Finset.mem_image.mp hqL with ⟨i, -, hi⟩
    have hq_ne_v2 : q ≠ S.triangle.v2 := by
      unfold Problem97.FiniteEndpointShell.I3 at hqI3
      exact (Finset.mem_erase.mp hqI3).1
    have hq_ne_v1 : q ≠ S.triangle.v1 := by
      unfold Problem97.FiniteEndpointShell.I3 at hqI3
      exact (Finset.mem_erase.mp (Finset.mem_erase.mp hqI3).2).1
    rcases hEnds with hFirstLast | hLastFirst
    · have hi_ne_last : i ≠ Problem97.CGN.lastIndex Packet.hm := by
        intro hi_last
        apply hq_ne_v2
        calc
          q = L.points i := hi.symm
          _ = L.points (Problem97.CGN.lastIndex Packet.hm) := by simpa [hi_last]
          _ = S.triangle.v2 := hFirstLast.2
      have hi_rev_lt_last : i.rev < Problem97.CGN.lastIndex Packet.hm := by
        apply Fin.lt_def.mpr
        rw [Fin.val_rev, Problem97.CGN.lastIndex_val]
        have hi_lt_top : i.val < m := i.is_lt
        have hi_ne_zero : i.val ≠ 0 := by
          intro hi_zero
          have hi_first : i = Problem97.CGN.firstIndex Packet.hm := by
            ext
            simpa [Problem97.CGN.firstIndex] using hi_zero
          apply hq_ne_v1
          calc
            q = L.points i := hi.symm
            _ = L.points (Problem97.CGN.firstIndex Packet.hm) := by simpa [hi_first]
            _ = S.triangle.v1 := hFirstLast.1
        omega
      have hmono :
          Problem97.FiniteEndpoint.E3L20b_rightEndpoint_capDistance_strict
            (L.points (Problem97.CGN.lastIndex Packet.hm))
            (Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCapRev L) :=
        Problem97.FiniteEndpoint.E3L20b_of_cgnCapData Packet Hside Hord
      have hlt :=
        hmono (i := i.rev) (j := Problem97.CGN.lastIndex Packet.hm) hi_rev_lt_last
      have hlast_rev_first :
          (Problem97.CGN.lastIndex Packet.hm).rev = Problem97.CGN.firstIndex Packet.hm := by
        ext
        rw [Fin.val_rev, Problem97.CGN.lastIndex_val]
        simp [Problem97.CGN.firstIndex]
        omega
      simpa [Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCapRev_points,
        hi, hFirstLast.1, hFirstLast.2, hlast_rev_first] using hlt
    · have hi_lt_last : i < Problem97.CGN.lastIndex Packet.hm := by
        apply Fin.lt_def.mpr
        rw [Problem97.CGN.lastIndex_val]
        have hi_lt_top : i.val < m := i.is_lt
        have hi_ne_last : i ≠ Problem97.CGN.lastIndex Packet.hm := by
          intro hi_last
          apply hq_ne_v1
          calc
            q = L.points i := hi.symm
            _ = L.points (Problem97.CGN.lastIndex Packet.hm) := by simpa [hi_last]
            _ = S.triangle.v1 := hLastFirst.2
        have hi_ne_top : i.val ≠ m - 1 := by
          intro hi_top
          apply hi_ne_last
          ext
          simpa [Problem97.CGN.lastIndex, Problem97.CGN.finIndex] using hi_top
        omega
      have hmono :
          Problem97.FiniteEndpoint.E3L20a_leftEndpoint_capDistance_strict
            (L.points (Problem97.CGN.firstIndex Packet.hm))
            (Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCap L) :=
        Problem97.FiniteEndpoint.E3L20a_of_cgnCapData Packet Hside Hord
      have hlt :=
        hmono (i := i) (j := Problem97.CGN.lastIndex Packet.hm) hi_lt_last
      simpa [Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCap_points,
        hi, hLastFirst.1, hLastFirst.2] using hlt
  have hbase_lt_long : dist S.triangle.v2 S.triangle.v1 < dist S.triangle.v3 S.triangle.v1 := by
    have hb2T1 : Z.b2 ∈ S.witnessClassAt_v1 r := by
      have hb2mem : Z.b2 ∈ ({Z.b2} : Finset ℝ²) := by simp
      rw [← hb2eq] at hb2mem
      exact (Finset.mem_inter.mp hb2mem).1
    have hv2T1 : S.triangle.v2 ∈ S.witnessClassAt_v1 r := by
      rcases hB with ⟨x, hxI2, hxeq, hv2eq⟩
      have hv2mem : S.triangle.v2 ∈ ({S.triangle.v2} : Finset ℝ²) := by simp
      rw [← hv2eq] at hv2mem
      exact (Finset.mem_inter.mp hv2mem).1
    have hbase_eq : dist S.triangle.v1 S.triangle.v2 = dist S.triangle.v1 Z.b2 := by
      have hv2dist : dist S.triangle.v1 S.triangle.v2 = r := by
        simpa using (Finset.mem_filter.mp hv2T1).2
      have hb2dist : dist S.triangle.v1 Z.b2 = r := by
        simpa using (Finset.mem_filter.mp hb2T1).2
      rw [hv2dist, hb2dist]
    have h := S.v1b2_lt_v1v3_of_formB_v1_b2 Z hB ⟨hB2, hb2eq⟩
    simpa [hbase_eq, dist_comm] using h
  have hv2v1 : dist S.triangle.v3 S.triangle.v2 < dist S.triangle.v3 S.triangle.v1 := by
    calc
      dist S.triangle.v3 S.triangle.v2 = dist S.triangle.v2 S.triangle.v3 := by rw [dist_comm]
      _ = dist S.triangle.v2 q := by rw [hqrad, hv3rad]
      _ < dist S.triangle.v2 S.triangle.v1 := hq_lt_base
      _ < dist S.triangle.v3 S.triangle.v1 := hbase_lt_long
  exact S.selectorShape_v3_q_eq_v1_impossible Z hpacket3 hv2v1


/-- Cap-order helper: any interior point `p` of the support cap `C₂` is
strictly closer to the endpoint `v₁` than to the far endpoint `v₃`.  This is
the generic side-chain distance bound underlying the Form-`b` lower-side
`q'=A` closures at `v₁`. -/
private theorem v1_lt_v1v3_of_mem_I2
    {A : Finset ℝ²} (S : FiniteEndpointShell A) {p : ℝ²}
    (hpI2 : p ∈ S.I2) :
    dist S.triangle.v1 p < dist S.triangle.v1 S.triangle.v3 := by
  classical
  have hpC2 : p ∈ S.CP.C2 := by
    unfold Problem97.FiniteEndpointShell.I2 at hpI2
    exact (Finset.mem_erase.mp (Finset.mem_erase.mp hpI2).2).2
  have hp_ne_v3 : p ≠ S.triangle.v3 := by
    unfold Problem97.FiniteEndpointShell.I2 at hpI2
    exact (Finset.mem_erase.mp (Finset.mem_erase.mp hpI2).2).1
  have hp_ne_v1 : p ≠ S.triangle.v1 := by
    unfold Problem97.FiniteEndpointShell.I2 at hpI2
    exact (Finset.mem_erase.mp hpI2).1
  rcases Problem97.CGN.CGN4g_capData_of_supportCap_oriented
      (A := A) (C := S.CP.C2) (M := S.triangle2)
      S.hconv S.hnoncol S.CP.C2_subset
      (fun x hxA => (S.CP.arc_membership x hxA).2.1)
      S.CP.v3_mem_C2 S.CP.v1_mem_C2 S.packet2 S.packet2.inner_at_v1 with
    ⟨m, L, Packet, Hside, Hord, hLC, hEnds⟩
  have hpL : p ∈ Finset.univ.image L.points := by
    rw [hLC]
    exact hpC2
  rcases Finset.mem_image.mp hpL with ⟨i, -, hi⟩
  rcases hEnds with hFirstLast | hLastFirst
  · have hi_ne_first : i ≠ Problem97.CGN.firstIndex Packet.hm := by
      intro hi_first
      apply hp_ne_v3
      calc
        p = L.points i := hi.symm
        _ = L.points (Problem97.CGN.firstIndex Packet.hm) := by simpa [hi_first]
        _ = S.triangle.v3 := hFirstLast.1
    have hi_rev_lt_last : i.rev < Problem97.CGN.lastIndex Packet.hm := by
      apply Fin.lt_def.mpr
      rw [Fin.val_rev, Problem97.CGN.lastIndex_val]
      have hi_pos : 0 < i.val := by
        apply Nat.pos_of_ne_zero
        intro hi_zero
        apply hi_ne_first
        ext
        simpa [Problem97.CGN.firstIndex] using hi_zero
      omega
    have hmono :
        Problem97.FiniteEndpoint.E3L20b_rightEndpoint_capDistance_strict
          (L.points (Problem97.CGN.lastIndex Packet.hm))
          (Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCapRev L) :=
      Problem97.FiniteEndpoint.E3L20b_of_cgnCapData Packet Hside Hord
    have hlt :=
      hmono (i := i.rev) (j := Problem97.CGN.lastIndex Packet.hm) hi_rev_lt_last
    have hlast_rev_first : (Problem97.CGN.lastIndex Packet.hm).rev =
        Problem97.CGN.firstIndex Packet.hm := by
      ext
      rw [Fin.val_rev, Problem97.CGN.lastIndex_val]
      simp [Problem97.CGN.firstIndex]
      omega
    simpa [Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCapRev_points,
      hi, hFirstLast.1, hFirstLast.2, hlast_rev_first] using hlt
  · have hi_lt_last : i < Problem97.CGN.lastIndex Packet.hm := by
      apply Fin.lt_def.mpr
      rw [Problem97.CGN.lastIndex_val]
      have hi_ne_last : i ≠ Problem97.CGN.lastIndex Packet.hm := by
        intro hi_last
        apply hp_ne_v3
        calc
          p = L.points i := hi.symm
          _ = L.points (Problem97.CGN.lastIndex Packet.hm) := by simpa [hi_last]
          _ = S.triangle.v3 := hLastFirst.2
      have hi_lt_top : i.val < m := i.is_lt
      have hi_ne_top : i.val ≠ m - 1 := by
        intro hi_top
        apply hi_ne_last
        ext
        simpa [Problem97.CGN.lastIndex, Problem97.CGN.finIndex] using hi_top
      omega
    have hmono :
        Problem97.FiniteEndpoint.E3L20a_leftEndpoint_capDistance_strict
          (L.points (Problem97.CGN.firstIndex Packet.hm))
          (Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCap L) :=
      Problem97.FiniteEndpoint.E3L20a_of_cgnCapData Packet Hside Hord
    have hlt :=
      hmono (i := i) (j := Problem97.CGN.lastIndex Packet.hm) hi_lt_last
    simpa [Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCap_points,
      hi, hLastFirst.1, hLastFirst.2] using hlt

/-- The `x = a₂`, `p = D` lower-side packet (mirror of the `x = b₂` packet):
the `v₁` Form-`b` class chooses `a₂`, and the forced `v₂` selector chooses the
named `C₁` witness `v₃` together with one lower-chain witness from `{a₃,b₃}`. -/
def FormBv1A2SelectorV2LowerPacket
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) (r s : ℝ) : Prop :=
  let T := S.witnessClassAt_v2 s
  (Z.a2 : ℝ²) ∈ S.I2 ∧
  S.witnessClassAt_v1 r ∩ S.CP.C2 = ({Z.a2} : Finset ℝ²) ∧
  T.card = 4 ∧
  S.I2 ⊆ T ∧
  T ∩ S.CP.C1 = ({S.triangle.v3} : Finset ℝ²) ∧
  ((T ∩ S.CP.C3 = ({Z.a3} : Finset ℝ²)) ∨
   (T ∩ S.CP.C3 = ({Z.b3} : Finset ℝ²)))

/-- `N4d-bA-2`: the `x = a₂`, `p = D` lower-side `q'=A` column of the `v₃`
selector is impossible.  Mirror of `n4d_bB_2_q_eq_v1_impossible`: the
lower-side witness gives `|v₂q| < |v₂v₁|`, the Form-`b`, `x=a₂` cap order gives
`|v₂v₁| < |v₃v₁|`, and the `q = v₁` selector contradiction on `S(v₃)` closes
the row. -/
theorem n4d_bA_2_q_eq_v1_impossible
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) {r s t : ℝ}
    (hB : S.IsFormB_v1 r)
    (hlower : FormBv1A2SelectorV2LowerPacket S Z r s)
    (hpacket3 : SelectorV3Qv1Packet S Z t) :
    False := by
  classical
  rcases hlower with ⟨hA2, ha2eq, hTcard, hI2sub, hC1eq, hC3eq⟩
  let T := S.witnessClassAt_v2 s
  have hv3T : S.triangle.v3 ∈ T := by
    have hmem : S.triangle.v3 ∈ ({S.triangle.v3} : Finset ℝ²) := by simp
    rw [← hC1eq] at hmem
    exact (Finset.mem_inter.mp hmem).1
  have hq :
      (Z.a3 : ℝ²) ∈ T ∩ S.CP.C3 ∨ (Z.b3 : ℝ²) ∈ T ∩ S.CP.C3 := by
    rcases hC3eq with hqa3 | hqb3
    · left
      have hmem : Z.a3 ∈ ({Z.a3} : Finset ℝ²) := by simp
      rw [← hqa3] at hmem
      exact hmem
    · right
      have hmem : Z.b3 ∈ ({Z.b3} : Finset ℝ²) := by simp
      rw [← hqb3] at hmem
      exact hmem
  obtain ⟨q, hqI3, hqT2⟩ : ∃ q : ℝ², q ∈ S.I3 ∧ q ∈ T := by
    rcases hq with hqa3 | hqb3
    · refine ⟨Z.a3, ?_, ?_⟩
      · rw [Z.hI3]
        simp
      · exact (Finset.mem_inter.mp hqa3).1
    · refine ⟨Z.b3, ?_, ?_⟩
      · rw [Z.hI3]
        simp
      · exact (Finset.mem_inter.mp hqb3).1
  have hv3rad : dist S.triangle.v2 S.triangle.v3 = s := by
    simpa using (Finset.mem_filter.mp hv3T).2
  have hqrad : dist S.triangle.v2 q = s := by
    simpa using (Finset.mem_filter.mp hqT2).2
  have hq_lt_base : dist S.triangle.v2 q < dist S.triangle.v2 S.triangle.v1 := by
    rcases Problem97.CGN.CGN4g_capData_of_supportCap_oriented
        (A := A) (C := S.CP.C3) (M := S.triangle3)
        S.hconv S.hnoncol S.CP.C3_subset
        (fun x hxA => (S.CP.arc_membership x hxA).2.2)
        S.CP.v1_mem_C3 S.CP.v2_mem_C3 S.packet3 S.packet3.inner_at_v1 with
      ⟨m, L, Packet, Hside, Hord, hLC, hEnds⟩
    have hqC3 : q ∈ S.CP.C3 := by
      unfold Problem97.FiniteEndpointShell.I3 at hqI3
      exact Finset.mem_of_mem_erase (Finset.mem_of_mem_erase hqI3)
    have hqL : q ∈ Finset.univ.image L.points := by
      rw [hLC]
      exact hqC3
    rcases Finset.mem_image.mp hqL with ⟨i, -, hi⟩
    have hq_ne_v2 : q ≠ S.triangle.v2 := by
      unfold Problem97.FiniteEndpointShell.I3 at hqI3
      exact (Finset.mem_erase.mp hqI3).1
    have hq_ne_v1 : q ≠ S.triangle.v1 := by
      unfold Problem97.FiniteEndpointShell.I3 at hqI3
      exact (Finset.mem_erase.mp (Finset.mem_erase.mp hqI3).2).1
    rcases hEnds with hFirstLast | hLastFirst
    · have hi_ne_last : i ≠ Problem97.CGN.lastIndex Packet.hm := by
        intro hi_last
        apply hq_ne_v2
        calc
          q = L.points i := hi.symm
          _ = L.points (Problem97.CGN.lastIndex Packet.hm) := by simpa [hi_last]
          _ = S.triangle.v2 := hFirstLast.2
      have hi_rev_lt_last : i.rev < Problem97.CGN.lastIndex Packet.hm := by
        apply Fin.lt_def.mpr
        rw [Fin.val_rev, Problem97.CGN.lastIndex_val]
        have hi_lt_top : i.val < m := i.is_lt
        have hi_ne_zero : i.val ≠ 0 := by
          intro hi_zero
          have hi_first : i = Problem97.CGN.firstIndex Packet.hm := by
            ext
            simpa [Problem97.CGN.firstIndex] using hi_zero
          apply hq_ne_v1
          calc
            q = L.points i := hi.symm
            _ = L.points (Problem97.CGN.firstIndex Packet.hm) := by simpa [hi_first]
            _ = S.triangle.v1 := hFirstLast.1
        omega
      have hmono :
          Problem97.FiniteEndpoint.E3L20b_rightEndpoint_capDistance_strict
            (L.points (Problem97.CGN.lastIndex Packet.hm))
            (Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCapRev L) :=
        Problem97.FiniteEndpoint.E3L20b_of_cgnCapData Packet Hside Hord
      have hlt :=
        hmono (i := i.rev) (j := Problem97.CGN.lastIndex Packet.hm) hi_rev_lt_last
      have hlast_rev_first :
          (Problem97.CGN.lastIndex Packet.hm).rev = Problem97.CGN.firstIndex Packet.hm := by
        ext
        rw [Fin.val_rev, Problem97.CGN.lastIndex_val]
        simp [Problem97.CGN.firstIndex]
        omega
      simpa [Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCapRev_points,
        hi, hFirstLast.1, hFirstLast.2, hlast_rev_first] using hlt
    · have hi_lt_last : i < Problem97.CGN.lastIndex Packet.hm := by
        apply Fin.lt_def.mpr
        rw [Problem97.CGN.lastIndex_val]
        have hi_lt_top : i.val < m := i.is_lt
        have hi_ne_last : i ≠ Problem97.CGN.lastIndex Packet.hm := by
          intro hi_last
          apply hq_ne_v1
          calc
            q = L.points i := hi.symm
            _ = L.points (Problem97.CGN.lastIndex Packet.hm) := by simpa [hi_last]
            _ = S.triangle.v1 := hLastFirst.2
        have hi_ne_top : i.val ≠ m - 1 := by
          intro hi_top
          apply hi_ne_last
          ext
          simpa [Problem97.CGN.lastIndex, Problem97.CGN.finIndex] using hi_top
        omega
      have hmono :
          Problem97.FiniteEndpoint.E3L20a_leftEndpoint_capDistance_strict
            (L.points (Problem97.CGN.firstIndex Packet.hm))
            (Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCap L) :=
        Problem97.FiniteEndpoint.E3L20a_of_cgnCapData Packet Hside Hord
      have hlt :=
        hmono (i := i) (j := Problem97.CGN.lastIndex Packet.hm) hi_lt_last
      simpa [Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCap_points,
        hi, hLastFirst.1, hLastFirst.2] using hlt
  have hbase_lt_long : dist S.triangle.v2 S.triangle.v1 < dist S.triangle.v3 S.triangle.v1 := by
    have ha2T1 : Z.a2 ∈ S.witnessClassAt_v1 r := by
      have ha2mem : Z.a2 ∈ ({Z.a2} : Finset ℝ²) := by simp
      rw [← ha2eq] at ha2mem
      exact (Finset.mem_inter.mp ha2mem).1
    have hv2T1 : S.triangle.v2 ∈ S.witnessClassAt_v1 r := by
      rcases hB with ⟨x, hxI2, hxeq, hv2eq⟩
      have hv2mem : S.triangle.v2 ∈ ({S.triangle.v2} : Finset ℝ²) := by simp
      rw [← hv2eq] at hv2mem
      exact (Finset.mem_inter.mp hv2mem).1
    have hbase_eq : dist S.triangle.v1 S.triangle.v2 = dist S.triangle.v1 Z.a2 := by
      have hv2dist : dist S.triangle.v1 S.triangle.v2 = r := by
        simpa using (Finset.mem_filter.mp hv2T1).2
      have ha2dist : dist S.triangle.v1 Z.a2 = r := by
        simpa using (Finset.mem_filter.mp ha2T1).2
      rw [hv2dist, ha2dist]
    have h := S.v1_lt_v1v3_of_mem_I2 (p := Z.a2) hA2
    simpa [hbase_eq, dist_comm] using h
  have hv2v1 : dist S.triangle.v3 S.triangle.v2 < dist S.triangle.v3 S.triangle.v1 := by
    calc
      dist S.triangle.v3 S.triangle.v2 = dist S.triangle.v2 S.triangle.v3 := by rw [dist_comm]
      _ = dist S.triangle.v2 q := by rw [hqrad, hv3rad]
      _ < dist S.triangle.v2 S.triangle.v1 := hq_lt_base
      _ < dist S.triangle.v3 S.triangle.v1 := hbase_lt_long
  exact S.selectorShape_v3_q_eq_v1_impossible Z hpacket3 hv2v1

/-- Cap-order helper for the `p'=B` lower-side rows: any interior point `q` of
the support cap `C₃` is strictly closer to the endpoint `v₁` than to the far
endpoint `v₂`.  This is the `|A q| < |A B| = 1` lower-chain cap order
(`A = v₁`, `B = v₂`) used by the `p'=B` equilateral-apex closure.  It is the
`C₃` analog of `v1_lt_v1v3_of_mem_I2`, bounding from `v₁` as the *left*
endpoint of `C₃`. -/
private theorem v1_lt_v1v2_of_mem_I3
    {A : Finset ℝ²} (S : FiniteEndpointShell A) {q : ℝ²}
    (hqI3 : q ∈ S.I3) :
    dist S.triangle.v1 q < dist S.triangle.v1 S.triangle.v2 := by
  classical
  have hqC3 : q ∈ S.CP.C3 := by
    unfold Problem97.FiniteEndpointShell.I3 at hqI3
    exact Finset.mem_of_mem_erase (Finset.mem_of_mem_erase hqI3)
  have hq_ne_v2 : q ≠ S.triangle.v2 := by
    unfold Problem97.FiniteEndpointShell.I3 at hqI3
    exact (Finset.mem_erase.mp hqI3).1
  have hq_ne_v1 : q ≠ S.triangle.v1 := by
    unfold Problem97.FiniteEndpointShell.I3 at hqI3
    exact (Finset.mem_erase.mp (Finset.mem_erase.mp hqI3).2).1
  rcases Problem97.CGN.CGN4g_capData_of_supportCap_oriented
      (A := A) (C := S.CP.C3) (M := S.triangle3)
      S.hconv S.hnoncol S.CP.C3_subset
      (fun x hxA => (S.CP.arc_membership x hxA).2.2)
      S.CP.v1_mem_C3 S.CP.v2_mem_C3 S.packet3 S.packet3.inner_at_v1 with
    ⟨m, L, Packet, Hside, Hord, hLC, hEnds⟩
  have hqL : q ∈ Finset.univ.image L.points := by
    rw [hLC]
    exact hqC3
  rcases Finset.mem_image.mp hqL with ⟨i, -, hi⟩
  rcases hEnds with hFirstLast | hLastFirst
  · -- `firstIndex ↦ v₁`, `lastIndex ↦ v₂`: bound from `v₁` as the *left* endpoint.
    have hi_ne_last : i ≠ Problem97.CGN.lastIndex Packet.hm := by
      intro hi_last
      apply hq_ne_v2
      calc
        q = L.points i := hi.symm
        _ = L.points (Problem97.CGN.lastIndex Packet.hm) := by simpa [hi_last]
        _ = S.triangle.v2 := hFirstLast.2
    have hi_lt_last : i < Problem97.CGN.lastIndex Packet.hm := by
      apply Fin.lt_def.mpr
      rw [Problem97.CGN.lastIndex_val]
      have hi_lt_top : i.val < m := i.is_lt
      have hi_ne_top : i.val ≠ m - 1 := by
        intro hi_top
        apply hi_ne_last
        ext
        simpa [Problem97.CGN.lastIndex, Problem97.CGN.finIndex] using hi_top
      omega
    have hmono :
        Problem97.FiniteEndpoint.E3L20a_leftEndpoint_capDistance_strict
          (L.points (Problem97.CGN.firstIndex Packet.hm))
          (Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCap L) :=
      Problem97.FiniteEndpoint.E3L20a_of_cgnCapData Packet Hside Hord
    have hlt :=
      hmono (i := i) (j := Problem97.CGN.lastIndex Packet.hm) hi_lt_last
    simpa [Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCap_points,
      hi, hFirstLast.1, hFirstLast.2] using hlt
  · -- `firstIndex ↦ v₂`, `lastIndex ↦ v₁`: bound from `v₁` as the right endpoint
    -- of the reversed chain.
    have hi_ne_first : i ≠ Problem97.CGN.firstIndex Packet.hm := by
      intro hi_first
      apply hq_ne_v2
      calc
        q = L.points i := hi.symm
        _ = L.points (Problem97.CGN.firstIndex Packet.hm) := by simpa [hi_first]
        _ = S.triangle.v2 := hLastFirst.1
    have hi_rev_lt_last : i.rev < Problem97.CGN.lastIndex Packet.hm := by
      apply Fin.lt_def.mpr
      rw [Fin.val_rev, Problem97.CGN.lastIndex_val]
      have hi_pos : 0 < i.val := by
        apply Nat.pos_of_ne_zero
        intro hi_zero
        apply hi_ne_first
        ext
        simpa [Problem97.CGN.firstIndex] using hi_zero
      omega
    have hmono :
        Problem97.FiniteEndpoint.E3L20b_rightEndpoint_capDistance_strict
          (L.points (Problem97.CGN.lastIndex Packet.hm))
          (Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCapRev L) :=
      Problem97.FiniteEndpoint.E3L20b_of_cgnCapData Packet Hside Hord
    have hlt :=
      hmono (i := i.rev) (j := Problem97.CGN.lastIndex Packet.hm) hi_rev_lt_last
    have hlast_rev_first : (Problem97.CGN.lastIndex Packet.hm).rev =
        Problem97.CGN.firstIndex Packet.hm := by
      ext
      rw [Fin.val_rev, Problem97.CGN.lastIndex_val]
      simp [Problem97.CGN.firstIndex]
      omega
    simpa [Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCapRev_points,
      hi, hLastFirst.1, hLastFirst.2, hlast_rev_first] using hlt

-- The shell-level Track-B consumer combines one similarity transport with the
-- new shared-triple sign kernel; the local heartbeat bump keeps the transport
-- algebra from timing out inside this large file.
/-- Shell-level Track-B shared-triple contradiction.  If `a₂` and `b₂` are the
two `I₂` vertices, `a₂` is the normalized upper selector witness
(`|v₁a₂| = |v₁v₂|`, `|v₂a₂| = |v₂v₃|`, `|v₂v₃| < |v₁v₂|`), and `b₂` is
equidistant from `v₁`, `v₃`, and `a₂`, then the shell is impossible: transport
to the normalized `(0,0),(1,0)` frame, `qEqE_b2_familyB_sharedTriple_circumcenter_below_axis`
forces `b₂` below the base while the `I₂` side constraint forces it above. -/
theorem qEqE_b2_familyB_sharedTriple_impossible_of_shell
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) {rb : ℝ}
    (hA2 : Z.a2 ∈ S.I2) (hB2 : Z.b2 ∈ S.I2)
    (hAC : dist S.triangle.v1 Z.a2 = dist S.triangle.v1 S.triangle.v2)
    (hBD : dist S.triangle.v2 Z.a2 = dist S.triangle.v2 S.triangle.v3)
    (hsmall : dist S.triangle.v2 S.triangle.v3 < dist S.triangle.v1 S.triangle.v2)
    (hb2v1 : dist Z.b2 S.triangle.v1 = rb)
    (hb2v3 : dist Z.b2 S.triangle.v3 = rb)
    (hb2a2 : dist Z.b2 Z.a2 = rb) :
    False := by
  let q1 : ℝ² := S.triangle.v1
  let q2 : ℝ² := S.triangle.v2
  let q3 : ℝ² := S.triangle.v3
  have hq1ne : q1 ≠ q2 := by
    simpa [q1, q2] using S.triangle.v12_ne
  rcases exists_base_transportData q1 q2 hq1ne with
    ⟨Tbase, tauBase, hv1Base, hv2Base⟩
  have hq3base_ne : (Tbase q3) 1 ≠ 0 := by
    have hq3_sa_ne : signedArea2 q3 q1 q2 ≠ 0 := by
      have hv1O : ‖q1 - S.Packet.center‖ = S.Packet.radius := by
        simpa [q1] using S.Packet.moser_on_boundary_1
      have hv2O : ‖q2 - S.Packet.center‖ = S.Packet.radius := by
        simpa [q2] using S.Packet.moser_on_boundary_2
      have hv3O : ‖q3 - S.Packet.center‖ = S.Packet.radius := by
        simpa [q3] using S.Packet.moser_on_boundary_3
      exact MEC.signedArea2_ne_zero_of_three_dist_eq
        hv3O hv1O hv2O
        S.triangle.v13_ne.symm S.triangle.v12_ne S.triangle.v23_ne.symm
    have himg_ne : signedArea2 (Tbase q3) (Tbase q1) (Tbase q2) ≠ 0 := by
      rw [tauBase.halfplane_sign q3 q1 q2]
      exact mul_ne_zero
        (mul_ne_zero
          (by
            intro h0
            have : (0 : ℝ) ^ 2 = 1 := by simpa [h0] using tauBase.orientation_sq
            norm_num at this)
          (pow_ne_zero 2 (ne_of_gt tauBase.scale_pos)))
        hq3_sa_ne
    intro h0
    apply himg_ne
    rw [hv1Base, hv2Base, signedArea2_baseChord_vec2]
    linarith
  have build_from :
      ∀ {T0 : ℝ² → ℝ²},
        (tau0 : Problem97.CGN.SimilarityTransportData T0) →
        T0 q1 = Problem97.CGN.vec2 (-1) 0 →
        T0 q2 = Problem97.CGN.vec2 1 0 →
        0 < (T0 q3) 1 →
        False := by
    intro T0 tau0 hv1 hv2 hq3y_pos
    let T : ℝ² → ℝ² := fun x => halfShift (T0 x)
    let tau : Problem97.CGN.SimilarityTransportData T :=
      similarityTransportComp tau0 halfShiftSimilarityTransportData
    have hv1T : T q1 = Problem97.CGN.vec2 0 0 := by
      dsimp [T]
      rw [hv1]
      ext i <;> fin_cases i <;> simp [halfShift, Problem97.CGN.vec2]
    have hv2T : T q2 = Problem97.CGN.vec2 1 0 := by
      dsimp [T]
      rw [hv2]
      ext i <;> fin_cases i <;> simp [halfShift, Problem97.CGN.vec2]
    have hq3yT : 0 < (T q3) 1 := by
      have hhalf : 0 < (T0 q3) 1 / 2 := by linarith
      simpa [T, halfShift, Problem97.CGN.vec2] using hhalf
    have hq3_img_pos :
        0 < signedArea2 (T0 q3) (T0 q1) (T0 q2) := by
      rw [hv1, hv2, signedArea2_baseChord_vec2]
      linarith
    have upper_y :
        ∀ {x : ℝ²},
          0 < signedArea2 x q1 q2 * signedArea2 q3 q1 q2 →
          0 < (T x) 1 := by
      intro x hside
      have hx_img_prod :
          0 < signedArea2 (T0 x) (T0 q1) (T0 q2) *
            signedArea2 (T0 q3) (T0 q1) (T0 q2) := by
        rw [tau0.halfplane_sign x q1 q2, tau0.halfplane_sign q3 q1 q2]
        have hrew :
            (tau0.orientation * (tau0.scale ^ 2) * signedArea2 x q1 q2) *
                (tau0.orientation * (tau0.scale ^ 2) * signedArea2 q3 q1 q2) =
              (tau0.orientation ^ 2) * (tau0.scale ^ 2 * tau0.scale ^ 2) *
                (signedArea2 x q1 q2 * signedArea2 q3 q1 q2) := by
          ring
        rw [hrew, tau0.orientation_sq]
        have hscale_sq_pos : 0 < tau0.scale ^ 2 := sq_pos_of_ne_zero (ne_of_gt tau0.scale_pos)
        exact mul_pos (mul_pos (by positivity) (mul_pos hscale_sq_pos hscale_sq_pos)) hside
      have hx_img_pos :
          0 < signedArea2 (T0 x) (T0 q1) (T0 q2) := by
        by_contra hnot
        have hnonpos : signedArea2 (T0 x) (T0 q1) (T0 q2) ≤ 0 := by linarith
        have :
            signedArea2 (T0 x) (T0 q1) (T0 q2) *
              signedArea2 (T0 q3) (T0 q1) (T0 q2) ≤ 0 :=
          mul_nonpos_of_nonpos_of_nonneg hnonpos (le_of_lt hq3_img_pos)
        linarith
      rw [hv1, hv2, signedArea2_baseChord_vec2] at hx_img_pos
      have hx0 : 0 < (T0 x) 1 := by linarith
      have hxhalf : 0 < (T0 x) 1 / 2 := by linarith
      simpa [T, halfShift, Problem97.CGN.vec2] using hxhalf
    have ha2side :
        0 < signedArea2 Z.a2 q1 q2 * signedArea2 q3 q1 q2 :=
      S.c2_vertex_same_open_side_as_v3 hA2
    have hb2side :
        0 < signedArea2 Z.b2 q1 q2 * signedArea2 q3 q1 q2 :=
      S.c2_vertex_same_open_side_as_v3 hB2
    have ha2yT : 0 < (T Z.a2) 1 := upper_y ha2side
    have hb2yT : 0 < (T Z.b2) 1 := upper_y hb2side
    have hbase : dist (T q1) (T q2) = 1 := by
      have hsq : dist (T q1) (T q2) ^ 2 = 1 := by
        rw [hv1T, hv2T, dist_sq_eq_coord_sq_add_coord_sq]
        norm_num [Problem97.CGN.vec2, EuclideanSpace.single_apply]
      have hnonneg : 0 ≤ dist (T q1) (T q2) := dist_nonneg
      nlinarith
    have hsmallT : dist (T q2) (T q3) < dist (T q1) (T q2) := by
      rw [tau.dist_image, tau.dist_image]
      exact mul_lt_mul_of_pos_left hsmall tau.scale_pos
    let s : ℝ := dist (T q3) (T q2)
    have hs0 : 0 < s := by
      have hq3ne_q2 : q3 ≠ q2 := by
        intro h
        apply S.triangle.v23_ne
        simpa [q2, q3] using h.symm
      dsimp [s]
      rw [tau.dist_image]
      exact mul_pos tau.scale_pos (dist_pos.mpr hq3ne_q2)
    have hs1 : s < 1 := by
      dsimp [s] at *
      rw [hbase] at hsmallT
      simpa [dist_comm] using hsmallT
    have hlong0 : dist S.triangle.v1 Z.a2 < dist S.triangle.v1 S.triangle.v3 :=
      S.v1_lt_v1v3_of_mem_I2 (p := Z.a2) hA2
    have hlong : dist q1 q2 < dist q1 q3 := by
      simpa [q1, q3, hAC] using hlong0
    have hlongT : dist (T q1) (T q2) < dist (T q1) (T q3) := by
      rw [tau.dist_image, tau.dist_image]
      exact mul_lt_mul_of_pos_left hlong tau.scale_pos
    have hv3v1T : 1 < dist (T q3) (T q1) := by
      rw [hbase] at hlongT
      simpa [dist_comm] using hlongT
    have h1x : (T q1) 0 = 0 := by
      rw [hv1T]
      simp [Problem97.CGN.vec2]
    have h1y : (T q1) 1 = 0 := by
      rw [hv1T]
      simp [Problem97.CGN.vec2]
    have h2x : (T q2) 0 = 1 := by
      rw [hv2T]
      simp [Problem97.CGN.vec2]
    have h2y : (T q2) 1 = 0 := by
      rw [hv2T]
      simp [Problem97.CGN.vec2]
    have ha2v1T : dist (T Z.a2) (T q1) = 1 := by
      calc
        dist (T Z.a2) (T q1) = dist (T q1) (T Z.a2) := by rw [dist_comm]
        _ = dist (T q1) (T q2) := by
          rw [tau.dist_image, tau.dist_image, hAC]
        _ = 1 := hbase
    have hBD' : dist Z.a2 q2 = dist q3 q2 := by
      simpa [q2, q3, dist_comm] using hBD
    have ha2v2T : dist (T Z.a2) (T q2) = s := by
      dsimp [s]
      rw [tau.dist_image, tau.dist_image, hBD']
    have hv3v2T : dist (T q3) (T q2) = s := by
      rfl
    let rbT : ℝ := dist (T Z.b2) (T q1)
    have hb2v1T : dist (T Z.b2) (T q1) = rbT := rfl
    have hb2v3T : dist (T Z.b2) (T q3) = rbT := by
      dsimp [rbT]
      rw [tau.dist_image, tau.dist_image, hb2v3, hb2v1]
    have hb2a2T : dist (T Z.b2) (T Z.a2) = rbT := by
      dsimp [rbT]
      rw [tau.dist_image, tau.dist_image, hb2a2, hb2v1]
    have hneg : (T Z.b2) 1 < 0 := by
      exact Problem97.qEqE_b2_familyB_sharedTriple_circumcenter_below_axis
        (T q1) (T q2) (T q3) (T Z.a2) (T Z.b2) s rbT
        hs0 hs1 h1x h1y h2x h2y ha2v1T ha2v2T hv3v2T hv3v1T
        ha2yT hq3yT hb2v1T hb2v3T hb2a2T
    linarith
  by_cases hq3y_pos : 0 < (Tbase q3) 1
  · exact build_from tauBase hv1Base hv2Base hq3y_pos
  · have hq3y_neg : (Tbase q3) 1 < 0 := by
      have hq3y_le : (Tbase q3) 1 ≤ 0 := by linarith
      exact lt_of_le_of_ne hq3y_le hq3base_ne
    let Tflip : ℝ² → ℝ² := fun x => flipY (Tbase x)
    let tauFlip : Problem97.CGN.SimilarityTransportData Tflip :=
      similarityTransportComp tauBase flipYSimilarityTransportData
    have hv1Flip : Tflip q1 = Problem97.CGN.vec2 (-1) 0 := by
      dsimp [Tflip]
      rw [hv1Base]
      ext i <;> fin_cases i <;> simp [flipY, Problem97.CGN.vec2]
    have hv2Flip : Tflip q2 = Problem97.CGN.vec2 1 0 := by
      dsimp [Tflip]
      rw [hv2Base]
      ext i <;> fin_cases i <;> simp [flipY, Problem97.CGN.vec2]
    have hq3yFlip : 0 < (Tflip q3) 1 := by
      have : 0 < -(Tbase q3) 1 := by linarith
      simpa [Tflip, flipY, Problem97.CGN.vec2] using this
    exact build_from tauFlip hv1Flip hv2Flip hq3yFlip

/- ### `p'=B` equilateral-apex closure (rows N4d-bA2c-D4/D7, N4d-bA3c-D4/D7)

These are the residual `p=v₃` lower-side D-selector rows in which the
`D`-selector vertex `p'` equals the selector center `B=v₂`.  Following the
pinned prose (`docs/97-full-prose-proof-draft.md`, "Closed residual slice:
`p'=B`", lines ~2045-2093):

With `A=v₁`, `B=v₂`, `D=v₃`, in any such row the `D`-selector radius is
`|DB|=r`, and the residual upper witness `q' ∈ {C,E}` together with `B,D`
forms an equilateral triangle of side `r`.  The lower-chain witness `q`
(`q ∈ I₃ ⊆ {a₃,b₃}`) satisfies `|Bq|=|Dq|=r`, so it is the *other* equilateral
apex over the side `BD`.

Normalize by a similarity transport placing `A=v₁ ↦ (0,0)` and `B=v₂ ↦ (1,0)`,
so `|AB|=1`.  Write the apex direction of `D=v₃` about the center `B` with
polar angle `δ`, `sin δ > 0`.  The two equilateral apexes over `BD` then sit at
`B + r(\cos(δ ± π/3), \sin(δ ± π/3))`.  The lower-chain point `q` has negative
second coordinate, which is only possible for the `δ - π/3` apex and forces
`0 < δ < π/3`; there `\cos δ, \sin δ > 0`, so the apex horizontal offset
`a = q_x - 1` is strictly positive.  Hence

```text
|Aq|² = (1+a)² + b² = 1 + 2a + r² > 1 = |AB|²,
```

contradicting the lower-chain cap order `|Aq| < |AB| = 1`. -/

/-- Core coordinate contradiction for the `p'=B` equilateral-apex rows.

In the normalized frame `A = (0,0)`, `B = (1,0)`, the lower equilateral apex
`q = B + (a,b) = (1+a, b)` over the side `BD` (with `D = B + r(\cos δ,\sin δ)`)
satisfies the two circle constraints

* `a² + b² = r²`            (`q` lies on the circle of radius `r` about `B`),
* `a \cos δ + b \sin δ = r/2`  (`q` lies on the circle of radius `r` about `D`,
  equivalently `|Dq| = |BD| = r`),

is the *lower* apex (`b < 0`), and `0 < δ < π/3`.  Then `q` is strictly farther
from `A` than `B` is, i.e. `dist A q ≥ dist A B`; combined with the lower-chain
cap order `dist A q < dist A B` this is a contradiction. -/
private theorem pEqB_lower_apex_dist_contradiction
    (A B q : ℝ²) (r δ a b : ℝ) (hr : 0 < r)
    (hA : A = Problem97.CGN.vec2 0 0) (hB : B = Problem97.CGN.vec2 1 0)
    (hq : q = Problem97.CGN.vec2 (1 + a) b)
    (hcirc : a ^ 2 + b ^ 2 = r ^ 2)
    (hdot : a * Real.cos δ + b * Real.sin δ = r / 2)
    (hblo : b < 0) (hδlo : 0 < δ) (hδhi : δ < Real.pi / 3)
    (hcap : dist A q < dist A B) : False := by
  have hsin : 0 < Real.sin δ := by
    apply Real.sin_pos_of_pos_of_lt_pi hδlo
    have := Real.pi_pos; linarith
  have hcos : 0 < Real.cos δ := by
    apply Real.cos_pos_of_mem_Ioo
    constructor
    · have := Real.pi_pos; linarith
    · have := Real.pi_pos; linarith
  have ha_pos : 0 < a := by
    have h1 : 0 < a * Real.cos δ := by nlinarith [hdot, hblo, hsin, hr]
    rcases lt_trichotomy a 0 with h | h | h
    · nlinarith
    · simp [h] at h1
    · exact h
  have hAB_sq : dist A B ^ 2 = 1 := by
    rw [hA, hB, dist_sq_eq_coord_sq_add_coord_sq]
    simp [Problem97.CGN.vec2, EuclideanSpace.single_apply]
  have hAq_sq : dist A q ^ 2 = 1 + 2 * a + r ^ 2 := by
    rw [hA, hq, dist_sq_eq_coord_sq_add_coord_sq]
    simp [Problem97.CGN.vec2, EuclideanSpace.single_apply]
    nlinarith [hcirc]
  have h1 : 0 ≤ dist A q := dist_nonneg
  have h2 : 0 ≤ dist A B := dist_nonneg
  nlinarith [hcap, hAB_sq, hAq_sq, ha_pos, hr, h1, h2]

/-- Branch-local normalized configuration packet for the `p'=B` rows.

After a similarity transport `T` (placing `A=v₁ ↦ (0,0)`, `B=v₂ ↦ (1,0)`), the
lower equilateral apex `q` over the side `BD` is presented in the
prose-normalized coordinate form `(1 + a, b)` with the two circle constraints
`a² + b² = r²` and `a \cos δ + b \sin δ = r/2`, with `b < 0` (lower apex) and
`0 < δ < π/3` (the angle of `D=v₃` about `B`, restricted by `q` being the lower
apex).  This is the exact data the coordinate contradiction
`pEqB_lower_apex_dist_contradiction` consumes; producing it from the shell-level
equilateral data is the companion frame-construction interface (see the prose
slice). -/
abbrev PEqBLowerApexConfig
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (q : ℝ²) (r : ℝ) : Prop :=
  ∃ T : ℝ² → ℝ², ∃ _tau : Problem97.CGN.SimilarityTransportData T, ∃ δ a b : ℝ,
    T S.triangle.v1 = Problem97.CGN.vec2 0 0 ∧
    T S.triangle.v2 = Problem97.CGN.vec2 1 0 ∧
    T q = Problem97.CGN.vec2 (1 + a) b ∧
    0 < r ∧
    a ^ 2 + b ^ 2 = r ^ 2 ∧
    a * Real.cos δ + b * Real.sin δ = r / 2 ∧
    b < 0 ∧ 0 < δ ∧ δ < Real.pi / 3

/-- Consumer step for the `p'=B` rows: once the lower-chain witness `q` of a
`p'=B` D-selector row is presented in the prose-normalized frame
(`PEqBLowerApexConfig`), the lower-chain cap order `|v₁q| < |v₁v₂|` is
impossible.  This is a pure consumer of the coordinate contradiction; it
replays no geometry beyond similarity-distance preservation. -/
theorem pEqB_row_impossible_of_normalized_config
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    {q : ℝ²} {r : ℝ}
    (hconfig : S.PEqBLowerApexConfig q r)
    (hcap : dist S.triangle.v1 q < dist S.triangle.v1 S.triangle.v2) :
    False := by
  rcases hconfig with ⟨T, tau, δ, a, b, hv1, hv2, hqT, hr, hcirc, hdot, hblo, hδlo, hδhi⟩
  have hcapT :
      dist (T S.triangle.v1) (T q) < dist (T S.triangle.v1) (T S.triangle.v2) := by
    rw [tau.dist_image, tau.dist_image]
    have hscale : 0 < tau.scale := tau.scale_pos
    nlinarith [hcap, hscale, dist_nonneg (x := S.triangle.v1) (y := q),
      dist_nonneg (x := S.triangle.v1) (y := S.triangle.v2)]
  exact pEqB_lower_apex_dist_contradiction
    (T S.triangle.v1) (T S.triangle.v2) (T q) r δ a b hr
    hv1 hv2 hqT hcirc hdot hblo hδlo hδhi hcapT

/-- Row-level closure for the `p'=B` equilateral-apex rows
(`N4d-bA2c-D4`, `N4d-bA2c-D7`, `N4d-bA3c-D4`, `N4d-bA3c-D7`).

The lower-chain witness `q` of such a row lies in `I₃` (it is the chosen
`a₃`/`b₃` lower vertex), so the support-cap distance order on `C₃` supplies the
cap inequality `|v₁q| < |v₁v₂|` automatically.  Combined with the
prose-normalized equilateral-apex configuration `PEqBLowerApexConfig`
(`A=v₁ ↦ (0,0)`, `B=v₂ ↦ (1,0)`, `q` the lower apex over `BD`), the coordinate
contradiction `pEqB_row_impossible_of_normalized_config` closes the row. -/
theorem pEqB_row_impossible_of_lower_witness
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    {q : ℝ²} {r : ℝ}
    (hqI3 : q ∈ S.I3)
    (hconfig : S.PEqBLowerApexConfig q r) :
    False :=
  S.pEqB_row_impossible_of_normalized_config hconfig (S.v1_lt_v1v2_of_mem_I3 hqI3)

/- PRODUCER for the `p'=B` rows: build the prose-normalized
`PEqBLowerApexConfig` from shell-level equilateral data.

The geometric input is the equilateral situation `B=v₂`, `D=v₃`, lower apex
`q ∈ I₃` over the side `BD`:

* `hBq : |Bq| = |BD|`        (`q` on the radius-`|BD|` circle about `B`),
* `hDq : |Dq| = |BD|`        (`q` on the radius-`|BD|` circle about `D`),

together with the two shell cap-order facts that pin down the angle of `D`:

* `hsmall : |BD| < |AB|`     (the selector radius `r < 1`),
* `hlong  : |AB| < |AD|`     (`v₃` is the far apex: `|AD| > 1`).

Normalizing by a similarity transport `A=v₁ ↦ (0,0)`, `B=v₂ ↦ (1,0)` (flipped so
`(T v₃)₁ > 0`), write `D = B + r(cos δ, sin δ)` with `sin δ > 0`.  The two
equidistances put `q` on both circles, hence at one of the equilateral apex
angles `δ ± π/3`.  Being the lower-chain witness (`(T q)₁ < 0`, from `q ∈ I₃`)
forces the `δ - π/3` apex, and the cap-order facts force `0 < δ < π/3`.  This is
exactly the `PEqBLowerApexConfig` data the consumer
`pEqB_row_impossible_of_lower_witness` requires; here `r` is the transported
selector radius `dist (T v₂) (T q)`. -/
set_option maxHeartbeats 8000000 in
-- Large heartbeat budget: the proof packages a full similarity transport,
-- several coordinate `nlinarith` certificates, and the lower-apex angle bound.
theorem pEqB_lower_apex_config_of_equilateral
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    {q : ℝ²}
    (hqI3 : q ∈ S.I3)
    (hBq : dist S.triangle.v2 q = dist S.triangle.v2 S.triangle.v3)
    (hDq : dist S.triangle.v3 q = dist S.triangle.v2 S.triangle.v3)
    (hsmall : dist S.triangle.v2 S.triangle.v3 < dist S.triangle.v1 S.triangle.v2)
    (hlong : dist S.triangle.v1 S.triangle.v2 < dist S.triangle.v1 S.triangle.v3) :
    ∃ r : ℝ, S.PEqBLowerApexConfig q r := by
  classical
  let q1 : ℝ² := S.triangle.v1
  let q2 : ℝ² := S.triangle.v2
  let q3 : ℝ² := S.triangle.v3
  -- Base transport `v₁ ↦ (-1,0)`, `v₂ ↦ (1,0)`.
  have hq1ne : q1 ≠ q2 := by simpa [q1, q2] using S.triangle.v12_ne
  rcases exists_base_transportData q1 q2 hq1ne with
    ⟨Tbase, tauBase, hv1Base, hv2Base⟩
  have horientBase_ne : tauBase.orientation ≠ 0 := by
    intro h0
    have : (0 : ℝ) ^ 2 = 1 := by simpa [h0] using tauBase.orientation_sq
    norm_num at this
  -- `v₃` is off the base chord, so its image second coordinate is nonzero.
  have hq3_base_nonzero : (Tbase q3) 1 ≠ 0 := by
    have hq3_sa_ne : signedArea2 q3 q1 q2 ≠ 0 := by
      have hv1O : ‖q1 - S.Packet.center‖ = S.Packet.radius := by
        simpa [q1] using S.Packet.moser_on_boundary_1
      have hv2O : ‖q2 - S.Packet.center‖ = S.Packet.radius := by
        simpa [q2] using S.Packet.moser_on_boundary_2
      have hv3O : ‖q3 - S.Packet.center‖ = S.Packet.radius := by
        simpa [q3] using S.Packet.moser_on_boundary_3
      exact MEC.signedArea2_ne_zero_of_three_dist_eq
        hv3O hv1O hv2O
        S.triangle.v13_ne.symm S.triangle.v12_ne S.triangle.v23_ne.symm
    have himg_ne : signedArea2 (Tbase q3) (Tbase q1) (Tbase q2) ≠ 0 := by
      rw [tauBase.halfplane_sign q3 q1 q2]
      exact mul_ne_zero
        (mul_ne_zero horientBase_ne (pow_ne_zero 2 (ne_of_gt tauBase.scale_pos)))
        hq3_sa_ne
    intro h0
    apply himg_ne
    rw [hv1Base, hv2Base, signedArea2_baseChord_vec2]
    linarith
  -- Reusable construction from any base transport with `v₃` above the chord.
  have build_from :
      ∀ {T0 : ℝ² → ℝ²},
        (tau0 : Problem97.CGN.SimilarityTransportData T0) →
        T0 q1 = Problem97.CGN.vec2 (-1) 0 →
        T0 q2 = Problem97.CGN.vec2 1 0 →
        0 < (T0 q3) 1 →
        ∃ r : ℝ, S.PEqBLowerApexConfig q r := by
    intro T0 tau0 hv1 hv2 hq3y_pos
    -- Postcompose by the fixed half-shift: `v₁ ↦ (0,0)`, `v₂ ↦ (1,0)`.
    let T : ℝ² → ℝ² := fun x => halfShift (T0 x)
    let tau : Problem97.CGN.SimilarityTransportData T :=
      similarityTransportComp tau0 halfShiftSimilarityTransportData
    have hv1T : T q1 = Problem97.CGN.vec2 0 0 := by
      dsimp [T]; rw [hv1]
      ext i <;> fin_cases i <;>
        simp [halfShift, Problem97.CGN.vec2, EuclideanSpace.single_apply]
    have hv2T : T q2 = Problem97.CGN.vec2 1 0 := by
      dsimp [T]; rw [hv2]
      ext i <;> fin_cases i <;>
        simp [halfShift, Problem97.CGN.vec2, EuclideanSpace.single_apply]
    -- `v₃` stays above the chord after the half-shift.
    have hq3y_T : 0 < (T q3) 1 := by
      dsimp [T]
      simp only [halfShift, Problem97.CGN.vec2, EuclideanSpace.single_apply]
      have : (0 : ℝ) < (T0 q3) 1 / 2 := by linarith
      simpa using this
    -- `q ∈ I₃` lies strictly below the base chord `AB`.
    have hqy_T : (T q) 1 < 0 := by
      have hxA : q ∈ A := S.CP.C3_subset (by
        unfold Problem97.FiniteEndpointShell.I3 at hqI3
        exact Finset.mem_of_mem_erase (Finset.mem_of_mem_erase hqI3))
      have hqC3 : q ∈ S.CP.C3 := by
        unfold Problem97.FiniteEndpointShell.I3 at hqI3
        exact Finset.mem_of_mem_erase (Finset.mem_of_mem_erase hqI3)
      have hq_ne_v1 : q ≠ q1 := by
        unfold Problem97.FiniteEndpointShell.I3 at hqI3
        exact (Finset.mem_erase.mp (Finset.mem_erase.mp hqI3).2).1
      have hq_ne_v2 : q ≠ q2 := by
        unfold Problem97.FiniteEndpointShell.I3 at hqI3
        exact (Finset.mem_erase.mp hqI3).1
      have hq3_base_ne : signedArea2 q3 q1 q2 ≠ 0 := by
        have hv1O : dist q3 S.Packet.center = S.Packet.radius := by
          simpa [q3, dist_eq_norm] using S.Packet.moser_on_boundary_3
        have hv2O : dist q1 S.Packet.center = S.Packet.radius := by
          simpa [q1, dist_eq_norm] using S.Packet.moser_on_boundary_1
        have hv3O : dist q2 S.Packet.center = S.Packet.radius := by
          simpa [q2, dist_eq_norm] using S.Packet.moser_on_boundary_2
        exact MEC.signedArea2_ne_zero_of_three_dist_eq
          hv1O hv2O hv3O
          S.triangle.v13_ne.symm S.triangle.v12_ne S.triangle.v23_ne.symm
      have hq_arc :
          signedArea2 q q1 q2 * signedArea2 q3 q1 q2 ≤ 0 := by
        exact (S.CP.arc_membership q hxA).2.2.1 hqC3
      have hq_base_ne : signedArea2 q q1 q2 ≠ 0 := by
        intro hz
        have hcol : Collinear ℝ ({q, q1, q2} : Set ℝ²) :=
          (Problem97.signedArea2_eq_zero_iff_collinear q q1 q2).1 hz
        exact False.elim <|
          S.hconv.not_three_collinear hxA S.triangle.v1_mem S.triangle.v2_mem
            hq_ne_v1 hq_ne_v2 S.triangle.v12_ne hcol
      -- The image of `v₃` above the chord fixes the orientation; `q` is on the
      -- opposite side, so its image second coordinate is negative.
      have hq3_img_pos : 0 < signedArea2 (T0 q3) (T0 q1) (T0 q2) := by
        rw [hv1, hv2, signedArea2_baseChord_vec2]; linarith
      have himg_nonpos :
          signedArea2 (T0 q) (T0 q1) (T0 q2) *
            signedArea2 (T0 q3) (T0 q1) (T0 q2) ≤ 0 := by
        rw [tau0.halfplane_sign q q1 q2, tau0.halfplane_sign q3 q1 q2]
        have hrew :
            (tau0.orientation * (tau0.scale ^ 2) * signedArea2 q q1 q2) *
                (tau0.orientation * (tau0.scale ^ 2) * signedArea2 q3 q1 q2) =
              (tau0.orientation ^ 2) * (tau0.scale ^ 2 * tau0.scale ^ 2) *
                (signedArea2 q q1 q2 * signedArea2 q3 q1 q2) := by ring
        rw [hrew, tau0.orientation_sq]
        have hscale_nonneg : 0 ≤ tau0.scale ^ 2 * tau0.scale ^ 2 := by positivity
        simpa using mul_nonpos_of_nonneg_of_nonpos hscale_nonneg hq_arc
      have hq_img_lt : signedArea2 (T0 q) (T0 q1) (T0 q2) < 0 := by
        have hq_img_le : signedArea2 (T0 q) (T0 q1) (T0 q2) ≤ 0 := by
          by_contra hq_pos
          have : 0 < signedArea2 (T0 q) (T0 q1) (T0 q2) *
              signedArea2 (T0 q3) (T0 q1) (T0 q2) :=
            mul_pos (by linarith) hq3_img_pos
          linarith
        have hq_img_ne : signedArea2 (T0 q) (T0 q1) (T0 q2) ≠ 0 := by
          rw [tau0.halfplane_sign q q1 q2]
          have horient_ne : tau0.orientation ≠ 0 := by
            intro h0
            have : (0 : ℝ) ^ 2 = 1 := by simpa [h0] using tau0.orientation_sq
            norm_num at this
          exact mul_ne_zero
            (mul_ne_zero horient_ne (pow_ne_zero 2 (ne_of_gt tau0.scale_pos))) hq_base_ne
        exact lt_of_le_of_ne hq_img_le hq_img_ne
      rw [hv1, hv2, signedArea2_baseChord_vec2] at hq_img_lt
      dsimp [T]
      simp only [halfShift, Problem97.CGN.vec2, EuclideanSpace.single_apply]
      have : (T0 q) 1 / 2 < 0 := by linarith
      simpa using this
    -- `q ≠ v₂` and `v₃ ≠ v₂` (needed for positive transported radius).
    have hq_ne_v2 : q ≠ q2 := by
      unfold Problem97.FiniteEndpointShell.I3 at hqI3
      exact (Finset.mem_erase.mp hqI3).1
    have hv3_ne_v2 : q3 ≠ q2 := by simpa [q2, q3] using S.triangle.v23_ne.symm
    -- Transported radius `r := |Bq|` and its identification with `|BD|`.
    set r : ℝ := dist (T q2) (T q) with hr_def
    have hd_q : 0 < dist q2 q := by
      rw [dist_pos]; exact fun h => hq_ne_v2 h.symm
    have hr_pos : 0 < r := by
      rw [hr_def, tau.dist_image]
      exact mul_pos tau.scale_pos hd_q
    have hBq_T : dist (T q2) (T q) = r := hr_def.symm
    have hBD_T : dist (T q2) (T q3) = r := by
      rw [hr_def, tau.dist_image, tau.dist_image]
      congr 1
      simpa [q2, q3] using hBq.symm
    have hDq_T : dist (T q3) (T q) = r := by
      rw [hr_def, tau.dist_image, tau.dist_image]
      congr 1
      calc dist q3 q = dist q2 q3 := by simpa [q2, q3] using hDq
        _ = dist q2 q := by simpa [q2, q3] using hBq.symm
    -- Coordinate values of `T v₂ = (1,0)`.
    have hv2c0 : (T q2) 0 = 1 := by rw [hv2T]; simp [Problem97.CGN.vec2]
    have hv2c1 : (T q2) 1 = 0 := by rw [hv2T]; simp [Problem97.CGN.vec2]
    have hv1c0 : (T q1) 0 = 0 := by rw [hv1T]; simp [Problem97.CGN.vec2]
    have hv1c1 : (T q1) 1 = 0 := by rw [hv1T]; simp [Problem97.CGN.vec2]
    -- Coordinate names.
    set dx : ℝ := (T q3) 0 - 1 with hdx_def
    set dy : ℝ := (T q3) 1 with hdy_def
    set a : ℝ := (T q) 0 - 1 with ha_def
    set b : ℝ := (T q) 1 with hb_def
    have hdy_pos : 0 < dy := by rw [hdy_def]; exact hq3y_T
    have hb_neg : b < 0 := by rw [hb_def]; exact hqy_T
    -- Circle constraints from the transported distances.
    have hcircD : dx ^ 2 + dy ^ 2 = r ^ 2 := by
      have hsq := dist_sq_eq_coord_sq_add_coord_sq (T q2) (T q3)
      rw [hBD_T, hv2c0, hv2c1] at hsq
      rw [hdx_def, hdy_def]; nlinarith [hsq]
    have hcircQ : a ^ 2 + b ^ 2 = r ^ 2 := by
      have hsq := dist_sq_eq_coord_sq_add_coord_sq (T q2) (T q)
      rw [hBq_T, hv2c0, hv2c1] at hsq
      rw [ha_def, hb_def]; nlinarith [hsq]
    -- `|Dq| = r` gives the dot relation `a·dx + b·dy = r²/2`.
    have hdot_raw : a * dx + b * dy = r ^ 2 / 2 := by
      have hsq := dist_sq_eq_coord_sq_add_coord_sq (T q3) (T q)
      rw [hDq_T] at hsq
      rw [ha_def, hb_def, hdx_def, hdy_def]
      nlinarith [hsq, hcircD, hcircQ]
    -- Long-side fact `|AD| > 1` transports to `1 + 2dx + r² > 1`.
    have hlong_T : (1 : ℝ) < 1 + 2 * dx + r ^ 2 := by
      have hAB_T : dist (T q1) (T q2) = r * 0 + 1 := by
        rw [hv1T, hv2T, dist_eq_norm]
        have hvec :
            Problem97.CGN.vec2 0 0 - Problem97.CGN.vec2 1 0 =
              Problem97.CGN.vec2 (-1) 0 := by
          ext i <;> fin_cases i <;>
            simp [Problem97.CGN.vec2, EuclideanSpace.single_apply]
        rw [hvec, EuclideanSpace.norm_eq]
        norm_num [Problem97.CGN.vec2, EuclideanSpace.single_apply]
      have hAD :
          dist (T q1) (T q2) < dist (T q1) (T q3) := by
        rw [tau.dist_image, tau.dist_image]
        have hscale : 0 < tau.scale := tau.scale_pos
        have : dist q1 q2 < dist q1 q3 := by simpa [q1, q2, q3] using hlong
        nlinarith [this, hscale, dist_nonneg (x := q1) (y := q2)]
      have hAB1 : dist (T q1) (T q2) = 1 := by rw [hAB_T]; ring
      have hAD_sq := dist_sq_eq_coord_sq_add_coord_sq (T q1) (T q3)
      rw [hv1c0, hv1c1] at hAD_sq
      have hAD_sq' : dist (T q1) (T q3) ^ 2 = 1 + 2 * dx + r ^ 2 := by
        rw [hAD_sq]; nlinarith [hcircD, hdx_def, hdy_def]
      have hAD' : (1 : ℝ) < dist (T q1) (T q3) := by rw [hAB1] at hAD; exact hAD
      nlinarith [hAD', hAD_sq', dist_nonneg (x := T q1) (y := T q3)]
    -- `r < 1` (the selector radius), transported.
    have hr_lt_one : r < 1 := by
      have hBD : dist (T q2) (T q3) < dist (T q1) (T q2) := by
        rw [tau.dist_image, tau.dist_image]
        have hscale : 0 < tau.scale := tau.scale_pos
        have : dist q2 q3 < dist q1 q2 := by simpa [q1, q2, q3] using hsmall
        nlinarith [this, hscale, dist_nonneg (x := q1) (y := q2)]
      have hAB1 : dist (T q1) (T q2) = 1 := by
        rw [hv1T, hv2T, dist_eq_norm]
        have hvec :
            Problem97.CGN.vec2 0 0 - Problem97.CGN.vec2 1 0 =
              Problem97.CGN.vec2 (-1) 0 := by
          ext i <;> fin_cases i <;>
            simp [Problem97.CGN.vec2, EuclideanSpace.single_apply]
        rw [hvec, EuclideanSpace.norm_eq]
        norm_num [Problem97.CGN.vec2, EuclideanSpace.single_apply]
      rw [hBD_T, hAB1] at hBD; exact hBD
    -- Key sign fact: `dx > r/2`, i.e. `cos δ > 1/2`, forcing `δ < π/3`.
    -- `a·dx > r²/2`, from `a·dx + b·dy = r²/2` with `b·dy < 0`.
    have hadx_big : r ^ 2 / 2 < a * dx := by
      have hbdy_neg : b * dy < 0 := mul_neg_of_neg_of_pos hb_neg hdy_pos
      linarith [hdot_raw]
    -- `|a| ≤ r` from `a² + b² = r²`.
    have ha_le : a ≤ r := by nlinarith [hcircQ, sq_nonneg b, hr_pos]
    have ha_ge : -r ≤ a := by nlinarith [hcircQ, sq_nonneg b, hr_pos]
    -- The lower bound `dx > -r²/2` from `|AD| > 1`; with `r < 1` it gives
    -- `dx > -r/2`, excluding the far (`a ≤ 0`) apex.
    have hdx_lb : -(r ^ 2) / 2 < dx := by nlinarith [hlong_T]
    have hdx_gt : r / 2 < dx := by
      -- `a > 0`: else `a·dx > r²/2 > 0` with `a ≤ 0` forces `dx < -r/2`,
      -- contradicting `dx > -r²/2 > -r/2`.
      have ha_pos : 0 < a := by
        by_contra hanot
        have ha0 : a ≤ 0 := le_of_not_gt hanot
        -- `a·dx > r²/2 > 0` and `a ≤ 0` give `dx < 0`.
        have hdx_neg : dx < 0 := by
          rcases lt_trichotomy dx 0 with h | h | h
          · exact h
          · exfalso; rw [h, mul_zero] at hadx_big; nlinarith [hr_pos, mul_pos hr_pos hr_pos]
          · exfalso
            have : a * dx ≤ 0 := mul_nonpos_of_nonpos_of_nonneg ha0 (le_of_lt h)
            nlinarith [hadx_big, mul_pos hr_pos hr_pos]
        -- `a·dx = |a|·|dx| ≤ r·|dx| = -r·dx`, so `r²/2 < -r·dx`, i.e. `dx < -r/2`.
        have hbound : a * dx ≤ -r * dx := by nlinarith [ha_ge, hdx_neg]
        have hdx_lt : dx < -(r / 2) := by
          have : r ^ 2 / 2 < -r * dx := lt_of_lt_of_le hadx_big hbound
          nlinarith [this, hr_pos]
        nlinarith [hdx_lt, hdx_lb, hr_pos, hr_lt_one, mul_pos hr_pos hr_pos]
      -- With `a > 0`, `a ≤ r`: `a·dx > r²/2` gives `r·dx ≥ a·dx > r²/2`,
      -- hence `dx > r/2`.
      have hdx_pos : 0 < dx := by
        by_contra hdxnot
        have hdx0 : dx ≤ 0 := le_of_not_gt hdxnot
        have : a * dx ≤ 0 := mul_nonpos_of_nonneg_of_nonpos (le_of_lt ha_pos) hdx0
        nlinarith [hadx_big, mul_pos hr_pos hr_pos]
      have hrdx : a * dx ≤ r * dx := by nlinarith [ha_le, hdx_pos]
      nlinarith [hadx_big, hrdx, hr_pos]
    -- Parameterize `D`'s direction by `δ = arccos (dx / r)`.
    have hcos_le : dx / r ≤ 1 := by
      rw [div_le_one hr_pos]
      nlinarith [hcircD, hdy_pos, sq_nonneg (dx - r), mul_pos hr_pos hr_pos]
    have hcos_ge : -1 ≤ dx / r := by
      rw [le_div_iff₀ hr_pos]
      nlinarith [hcircD, hdy_pos, sq_nonneg (dx + r), mul_pos hr_pos hr_pos]
    set δ : ℝ := Real.arccos (dx / r) with hδ_def
    have hcosδ : Real.cos δ = dx / r := by
      rw [hδ_def, Real.cos_arccos hcos_ge hcos_le]
    have hsinδ : Real.sin δ = dy / r := by
      rw [hδ_def, Real.sin_arccos]
      have hsq : 1 - (dx / r) ^ 2 = (dy / r) ^ 2 := by
        field_simp
        nlinarith [hcircD]
      rw [hsq, Real.sqrt_sq (by positivity)]
    -- `0 < δ`: since `dx/r < 1`.
    have hδ_lo : 0 < δ := by
      rw [hδ_def]
      apply Real.arccos_pos.mpr
      rw [div_lt_one hr_pos]
      nlinarith [hdy_pos]
    -- `δ < π/3`: since `cos δ = dx/r > 1/2`.
    have hδ_hi : δ < Real.pi / 3 := by
      have hcos_gt_half : (1 : ℝ) / 2 < Real.cos δ := by
        rw [hcosδ, lt_div_iff₀ hr_pos]; linarith [hdx_gt]
      have hcos_third : Real.cos (Real.pi / 3) = 1 / 2 := by
        rw [Real.cos_pi_div_three]
      by_contra hnot
      have hge : Real.pi / 3 ≤ δ := le_of_not_gt hnot
      have hδ_le_pi : δ ≤ Real.pi := by
        rw [hδ_def]; exact Real.arccos_le_pi _
      have hmono : Real.cos δ ≤ Real.cos (Real.pi / 3) := by
        apply Real.cos_le_cos_of_nonneg_of_le_pi
        · positivity
        · exact hδ_le_pi
        · exact hge
      rw [hcos_third] at hmono
      linarith [hcos_gt_half, hmono]
    -- The dot relation in trigonometric form.
    have hdot : a * Real.cos δ + b * Real.sin δ = r / 2 := by
      rw [hcosδ, hsinδ]
      have heq : a * (dx / r) + b * (dy / r) = (a * dx + b * dy) / r := by ring
      rw [heq, hdot_raw]
      field_simp
    -- `T q = (1 + a, b)`.
    have hqT : T q = Problem97.CGN.vec2 (1 + a) b := by
      rw [ha_def, hb_def]
      ext i <;> fin_cases i <;>
        simp [Problem97.CGN.vec2, EuclideanSpace.single_apply]
    -- Package the configuration.
    refine ⟨r, T, tau, δ, a, b, hv1T, hv2T, hqT, hr_pos, hcircQ, hdot, hb_neg, hδ_lo, hδ_hi⟩
  -- Orient so that `(T q3) 1 > 0`, flipping if necessary.
  by_cases hq3pos : 0 < (Tbase q3) 1
  · exact build_from tauBase hv1Base hv2Base hq3pos
  · let Tflip : ℝ² → ℝ² := fun x => flipY (Tbase x)
    let tauFlip : Problem97.CGN.SimilarityTransportData Tflip :=
      similarityTransportComp tauBase flipYSimilarityTransportData
    have hv1Flip : Tflip q1 = Problem97.CGN.vec2 (-1) 0 := by
      dsimp [Tflip]; rw [hv1Base]
      ext i <;> fin_cases i <;>
        simp [flipY, Problem97.CGN.vec2, EuclideanSpace.single_apply]
    have hv2Flip : Tflip q2 = Problem97.CGN.vec2 1 0 := by
      dsimp [Tflip]; rw [hv2Base]
      ext i <;> fin_cases i <;>
        simp [flipY, Problem97.CGN.vec2, EuclideanSpace.single_apply]
    have hq3Flip : 0 < (Tflip q3) 1 := by
      dsimp [Tflip]
      simp only [flipY, Problem97.CGN.vec2, EuclideanSpace.single_apply]
      have hq3neg : (Tbase q3) 1 < 0 := by
        have hle : (Tbase q3) 1 ≤ 0 := le_of_not_gt hq3pos
        exact lt_of_le_of_ne hle hq3_base_nonzero
      simpa using hq3neg
    exact build_from tauFlip hv1Flip hv2Flip hq3Flip

/-- Row-level closure for the `p'=B` equilateral-apex rows
(`N4d-bA2c-D4`, `N4d-bA2c-D7`, `N4d-bA3c-D4`, `N4d-bA3c-D7`), wired end to end
from shell-level equilateral data.

The producer `pEqB_lower_apex_config_of_equilateral` turns the equidistances
`|Bq| = |Dq| = |BD|` (with the shell cap-order facts `|BD| < |AB| < |AD|`) into
the prose-normalized `PEqBLowerApexConfig`; the consumer
`pEqB_row_impossible_of_lower_witness` then closes the row using the lower-chain
cap order automatic for `q ∈ I₃`. -/
theorem pEqB_row_impossible_of_equilateral
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    {q : ℝ²}
    (hqI3 : q ∈ S.I3)
    (hBq : dist S.triangle.v2 q = dist S.triangle.v2 S.triangle.v3)
    (hDq : dist S.triangle.v3 q = dist S.triangle.v2 S.triangle.v3)
    (hsmall : dist S.triangle.v2 S.triangle.v3 < dist S.triangle.v1 S.triangle.v2)
    (hlong : dist S.triangle.v1 S.triangle.v2 < dist S.triangle.v1 S.triangle.v3) :
    False := by
  obtain ⟨r, hconfig⟩ :=
    S.pEqB_lower_apex_config_of_equilateral hqI3 hBq hDq hsmall hlong
  exact S.pEqB_row_impossible_of_lower_witness hqI3 hconfig

/- ### `q'=C`, `p' ∈ {a₁,b₁}` reflection-side rows
(`N4d-bA2c-D5`, `N4d-bA2c-D6`, `N4d-bA3c-D5`, `N4d-bA3c-D6`).

In these rows `C` is the exact upper cap-apex over `AB` (`|AC| = |AB| = 1`,
`|BC| = r`, `C` above `AB`), and the lower witness `q` is the *other* common
point of the circle of radius `r` about `B` and the `D`-centered circle through
`C`; equivalently `q` is the reflection of `C` across line `BD`.  Writing polar
angles about center `B`,

* `θ` for `C` (so `\cos θ = -r/2`, `\sin θ > 0`, since `C` is the exact apex),
* `δ` for `D` (so `\sin δ > 0` as `D` is above `AB`, and `\cos δ > -r/2` because
  `|AD| > 1`),

the reflection of `C` across `BD` sits at polar angle `2δ - θ` about `B`, i.e.
`q = B + r(\cos(2δ - θ), \sin(2δ - θ))`.  The two shell constraints on `q` are

* `q` is below `AB`:           `\sin(2δ - θ) < 0`,
* the lower-chain cap order:   `|Aq| < |AB| = 1`, i.e. `\cos(2δ - θ) < -r/2`.

These are jointly impossible.  This is a cleaner contradiction than the prose's
`φ < α/2` tangent comparison (whose stated reduction is *not* implied by
`δ < θ/2` alone — it fails for `δ` just below `θ/2`); the sound route is a pure
cosine-monotonicity argument:

`\cos δ > -r/2 = \cos θ` with `δ, θ ∈ (0,π)` forces `δ < θ`; then
`w := 2δ - θ ∈ (-π, π)` and `\sin w < 0` give `w < 0`, so `-w = θ - 2δ ∈ (0,θ)`
and `\cos w = \cos(-w) > \cos θ = -r/2`, contradicting `\cos w < -r/2`. -/
private theorem qEqC_reflection_below_contradiction
    (r θ δ : ℝ) (hr : 0 < r)
    (hcosθ : Real.cos θ = -(r / 2)) (hsinθ : 0 < Real.sin θ)
    (hθ0 : 0 ≤ θ) (hθπ : θ ≤ Real.pi)
    (hcosδ : -(r / 2) < Real.cos δ) (hsinδ : 0 < Real.sin δ)
    (hδ0 : 0 ≤ δ) (hδπ : δ ≤ Real.pi)
    (hqbelow : Real.sin (2 * δ - θ) < 0)
    (hAq : Real.cos (2 * δ - θ) < -(r / 2)) : False := by
  -- `δ > 0`: `sin δ > 0` rules out `δ = 0`.
  have hδpos : 0 < δ := by
    rcases lt_or_eq_of_le hδ0 with h | h
    · exact h
    · exfalso; rw [← h, Real.sin_zero] at hsinδ; exact lt_irrefl _ hsinδ
  -- `δ < θ` from `cos δ > cos θ` with both angles in `[0, π]`.
  have hδ_lt_θ : δ < θ := by
    rcases lt_trichotomy δ θ with hlt | heq | hgt
    · exact hlt
    · exfalso; rw [heq, hcosθ] at hcosδ; exact lt_irrefl _ hcosδ
    · exfalso
      have hcc := Real.cos_lt_cos_of_nonneg_of_le_pi hθ0 hδπ hgt
      rw [hcosθ] at hcc
      linarith [hcc, hcosδ]
  -- `w := 2δ - θ` lies in `(-π, π)`.
  set w : ℝ := 2 * δ - θ with hw_def
  have hw_lo : -Real.pi < w := by rw [hw_def]; linarith [hδpos, hθπ]
  have hw_hi : w < Real.pi := by rw [hw_def]; linarith [hδ_lt_θ, hθπ]
  -- `sin w < 0` forces `w < 0`.
  have hw_neg : w < 0 := by
    by_contra hge
    push_neg at hge
    exact absurd (Real.sin_nonneg_of_nonneg_of_le_pi hge (le_of_lt hw_hi))
      (not_le.mpr hqbelow)
  -- `-w = θ - 2δ ∈ (0, θ)`, so `cos w = cos(-w) > cos θ = -r/2`.
  have hneg_w_lo : 0 ≤ -w := by linarith [hw_neg]
  have hneg_w_lt : -w < θ := by rw [hw_def]; linarith [hδpos]
  have hcos_gt : Real.cos θ < Real.cos (-w) :=
    Real.cos_lt_cos_of_nonneg_of_le_pi hneg_w_lo hθπ hneg_w_lt
  rw [Real.cos_neg] at hcos_gt
  rw [hcosθ] at hcos_gt
  linarith [hAq, hcos_gt]

/-- Branch-local normalized configuration packet for the `q'=C`, `p' ∈ {a₁,b₁}`
reflection-side rows.

After a similarity transport `T` (placing `A=v₁ ↦ (0,0)`, `B=v₂ ↦ (1,0)`), the
exact upper cap-apex `C` over `AB` has polar angle `θ` about `B` with
`\cos θ = -r/2`, `\sin θ > 0`; the upper far apex `D` (`|AD| > 1`) has polar
angle `δ` about `B` with `\cos δ > -r/2`, `\sin δ > 0`; and the lower witness
`q`, being the reflection of `C` across line `BD`, sits at polar angle `2δ - θ`,
i.e.

```text
T q = (1 + r \cos(2δ - θ), r \sin(2δ - θ)),    \sin(2δ - θ) < 0.
```

This is exactly the data the coordinate contradiction
`qEqC_reflection_below_contradiction` consumes once the lower-chain cap order
`|v₁q| < |v₁v₂| = 1` is supplied (which converts to `\cos(2δ - θ) < -r/2`). -/
abbrev QEqCReflectionConfig
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (q : ℝ²) (r : ℝ) : Prop :=
  ∃ T : ℝ² → ℝ², ∃ _tau : Problem97.CGN.SimilarityTransportData T, ∃ θ δ : ℝ,
    T S.triangle.v1 = Problem97.CGN.vec2 0 0 ∧
    T S.triangle.v2 = Problem97.CGN.vec2 1 0 ∧
    0 < r ∧
    Real.cos θ = -(r / 2) ∧ 0 < Real.sin θ ∧ 0 ≤ θ ∧ θ ≤ Real.pi ∧
    -(r / 2) < Real.cos δ ∧ 0 < Real.sin δ ∧ 0 ≤ δ ∧ δ ≤ Real.pi ∧
    T q =
      Problem97.CGN.vec2
        (1 + r * Real.cos (2 * δ - θ)) (r * Real.sin (2 * δ - θ)) ∧
    Real.sin (2 * δ - θ) < 0

/-- Consumer step for the `q'=C`, `p' ∈ {a₁,b₁}` reflection-side rows: once the
lower witness `q` is presented in the prose-normalized reflection frame
(`QEqCReflectionConfig`), the lower-chain cap order `|v₁q| < |v₁v₂|` is
impossible.  This is a pure consumer of the cosine-monotonicity contradiction;
it replays no geometry beyond similarity-distance preservation. -/
theorem qEqC_row_impossible_of_normalized_config
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    {q : ℝ²} {r : ℝ}
    (hconfig : S.QEqCReflectionConfig q r)
    (hcap : dist S.triangle.v1 q < dist S.triangle.v1 S.triangle.v2) :
    False := by
  rcases hconfig with
    ⟨T, tau, θ, δ, hv1, hv2, hr, hcosθ, hsinθ, hθ0, hθπ,
      hcosδ, hsinδ, hδ0, hδπ, hqT, hqbelow⟩
  -- Transport the cap order to the normalized frame.
  have hcapT : dist (T S.triangle.v1) (T q) < dist (T S.triangle.v1) (T S.triangle.v2) := by
    rw [tau.dist_image, tau.dist_image]
    have hscale : 0 < tau.scale := tau.scale_pos
    nlinarith [hcap, hscale, dist_nonneg (x := S.triangle.v1) (y := q),
      dist_nonneg (x := S.triangle.v1) (y := S.triangle.v2)]
  -- `|T v₁ T v₂| = 1` and `|T v₁ T q|² = 1 + 2 r cos(2δ-θ) + r²`.
  have hAB1 : dist (T S.triangle.v1) (T S.triangle.v2) = 1 := by
    rw [hv1, hv2, dist_eq_norm]
    have hvec :
        Problem97.CGN.vec2 0 0 - Problem97.CGN.vec2 1 0 = Problem97.CGN.vec2 (-1) 0 := by
      ext i <;> fin_cases i <;>
        simp [Problem97.CGN.vec2, EuclideanSpace.single_apply]
    rw [hvec, EuclideanSpace.norm_eq]
    norm_num [Problem97.CGN.vec2, EuclideanSpace.single_apply]
  have hAq_sq : dist (T S.triangle.v1) (T q) ^ 2
      = 1 + 2 * r * Real.cos (2 * δ - θ) + r ^ 2 := by
    rw [hv1, hqT, dist_sq_eq_coord_sq_add_coord_sq]
    simp [Problem97.CGN.vec2, EuclideanSpace.single_apply]
    nlinarith [Real.sin_sq_add_cos_sq (2 * δ - θ)]
  -- Convert the cap order into `cos(2δ-θ) < -r/2`.
  have hAq : Real.cos (2 * δ - θ) < -(r / 2) := by
    rw [hAB1] at hcapT
    have hAq_nonneg : 0 ≤ dist (T S.triangle.v1) (T q) := dist_nonneg
    nlinarith [hcapT, hAq_sq, hAq_nonneg, hr]
  exact qEqC_reflection_below_contradiction r θ δ hr hcosθ hsinθ hθ0 hθπ
    hcosδ hsinδ hδ0 hδπ hqbelow hAq

/-- Row-level closure for the `q'=C`, `p' ∈ {a₁,b₁}` reflection-side rows
(`N4d-bA2c-D5`, `N4d-bA2c-D6`, `N4d-bA3c-D5`, `N4d-bA3c-D6`).

The lower witness `q` of such a row lies in `I₃`, so the support-cap distance
order on `C₃` supplies the cap inequality `|v₁q| < |v₁v₂|` automatically.
Combined with the prose-normalized reflection configuration
`QEqCReflectionConfig`, the cosine-monotonicity contradiction
`qEqC_row_impossible_of_normalized_config` closes the row. -/
theorem qEqC_row_impossible_of_lower_witness
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    {q : ℝ²} {r : ℝ}
    (hqI3 : q ∈ S.I3)
    (hconfig : S.QEqCReflectionConfig q r) :
    False :=
  S.qEqC_row_impossible_of_normalized_config hconfig (S.v1_lt_v1v2_of_mem_I3 hqI3)

/-- Reflection-angle coordinate core for the `q'=C` producer.

In the normalized frame `A=(0,0)`, `B=(1,0)`, the points `C`, `D`, `q` all lie on
the circle of radius `r` about `B`:

* `C = (1 + r\cosθ, r\sinθ)` is the exact upper cap-apex (`\cosθ = -r/2`,
  `\sinθ > 0`),
* `D = (1 + r\cosδ, r\sinδ)` is the upper far apex (`\sinδ > 0`, `\cosδ > -r/2`),
* `q = (1 + r c_η, r s_η)` with `c_η² + s_η² = 1`, `s_η < 0` (q below `AB`).

The single geometric input is that `q` lies on the same `D`-centered circle as
`C` (the radical condition `c_η\cosδ + s_η\sinδ = \cosθ\cosδ + \sinθ\sinδ`) and
`q ≠ C`.  Then `q` is the reflection of `C` across line `BD`, i.e.
`c_η = \cos(2δ-θ)` and `s_η = \sin(2δ-θ)`.

The output is exactly the trigonometric data of `QEqCReflectionConfig`. -/
private theorem qEqC_reflection_coords
    (r cθ sθ cδ sδ cη sη : ℝ) (hr : 0 < r)
    (hcθ : cθ = -(r / 2)) (hsθ : 0 < sθ) (hθpyth : cθ ^ 2 + sθ ^ 2 = 1)
    (hcδ : -(r / 2) < cδ) (hsδ : 0 < sδ) (hδpyth : cδ ^ 2 + sδ ^ 2 = 1)
    (hηpyth : cη ^ 2 + sη ^ 2 = 1) (hsη : sη < 0)
    (hradical : cη * cδ + sη * sδ = cθ * cδ + sθ * sδ)
    (hne : ¬ (cη = cθ ∧ sη = sθ)) :
    ∃ θ δ : ℝ,
      Real.cos θ = cθ ∧ Real.sin θ = sθ ∧ 0 ≤ θ ∧ θ ≤ Real.pi ∧
      Real.cos δ = cδ ∧ Real.sin δ = sδ ∧ 0 ≤ δ ∧ δ ≤ Real.pi ∧
      cη = Real.cos (2 * δ - θ) ∧ sη = Real.sin (2 * δ - θ) := by
  -- Recover genuine angles `θ = arccos cθ`, `δ = arccos cδ` for `C`, `D` (upper).
  have hcθ_mem : -1 ≤ cθ ∧ cθ ≤ 1 := by
    constructor <;> nlinarith [hθpyth, sq_nonneg sθ, sq_nonneg cθ]
  have hcδ_mem : -1 ≤ cδ ∧ cδ ≤ 1 := by
    constructor <;> nlinarith [hδpyth, sq_nonneg sδ, sq_nonneg cδ]
  have hcη_mem : -1 ≤ cη ∧ cη ≤ 1 := by
    constructor <;> nlinarith [hηpyth, sq_nonneg sη, sq_nonneg cη]
  -- Set up genuine angles `θ = arccos cθ`, `δ = arccos cδ` (upper), and
  -- `η := -arccos cη` so that `cos η = cη` and `sin η = sη` (`sη < 0`).
  set θ : ℝ := Real.arccos cθ with hθ_def
  set δ : ℝ := Real.arccos cδ with hδ_def
  set η : ℝ := -Real.arccos cη with hη_def
  have hcosθ : Real.cos θ = cθ := Real.cos_arccos hcθ_mem.1 hcθ_mem.2
  have hsinθ : Real.sin θ = sθ := by
    rw [hθ_def, Real.sin_arccos]
    have : Real.sqrt (1 - cθ ^ 2) = Real.sqrt (sθ ^ 2) := by congr 1; nlinarith [hθpyth]
    rw [this, Real.sqrt_sq (le_of_lt hsθ)]
  have hcosδ : Real.cos δ = cδ := Real.cos_arccos hcδ_mem.1 hcδ_mem.2
  have hsinδ : Real.sin δ = sδ := by
    rw [hδ_def, Real.sin_arccos]
    have : Real.sqrt (1 - cδ ^ 2) = Real.sqrt (sδ ^ 2) := by congr 1; nlinarith [hδpyth]
    rw [this, Real.sqrt_sq (le_of_lt hsδ)]
  have hcosη : Real.cos η = cη := by
    rw [hη_def, Real.cos_neg]; exact Real.cos_arccos hcη_mem.1 hcη_mem.2
  have hsinη : Real.sin η = sη := by
    rw [hη_def, Real.sin_neg, Real.sin_arccos]
    have hsqrt : Real.sqrt (1 - cη ^ 2) = Real.sqrt (sη ^ 2) := by congr 1; nlinarith [hηpyth]
    rw [hsqrt, Real.sqrt_sq_eq_abs, abs_of_neg hsη]; ring
  -- The radical condition is `cos (η - δ) = cos (θ - δ)`.
  have hcoseq : Real.cos (η - δ) = Real.cos (θ - δ) := by
    rw [Real.cos_sub, Real.cos_sub, hcosη, hsinη, hcosθ, hsinθ, hcosδ, hsinδ]
    linarith [hradical]
  have hcoords : ¬ (Real.cos η = Real.cos θ ∧ Real.sin η = Real.sin θ) := by
    rw [hcosη, hsinη, hcosθ, hsinθ]; exact hne
  -- Reflection identity from the chord condition and `q ≠ C`.
  have hrefl : Real.cos η = Real.cos (2 * δ - θ) ∧ Real.sin η = Real.sin (2 * δ - θ) := by
    rw [Real.cos_eq_cos_iff] at hcoseq
    obtain ⟨k, hk | hk⟩ := hcoseq
    · exfalso; apply hcoords
      have he : η = θ + ((-k : ℤ) : ℝ) * (2 * Real.pi) := by push_cast; linarith
      rw [he, Real.cos_add_int_mul_two_pi, Real.sin_add_int_mul_two_pi]; exact ⟨rfl, rfl⟩
    · have he : η = (2 * δ - θ) + ((k : ℤ) : ℝ) * (2 * Real.pi) := by linarith
      rw [he, Real.cos_add_int_mul_two_pi, Real.sin_add_int_mul_two_pi]; exact ⟨rfl, rfl⟩
  refine ⟨θ, δ, hcosθ, hsinθ, Real.arccos_nonneg cθ, Real.arccos_le_pi cθ,
    hcosδ, hsinδ, Real.arccos_nonneg cδ, Real.arccos_le_pi cδ, ?_, ?_⟩
  · rw [← hcosη, hrefl.1]
  · rw [← hsinη, hrefl.2]

/- PRODUCER for the `q'=C`, `p' ∈ {a₁,b₁}` reflection-side rows: build the
prose-normalized `QEqCReflectionConfig` from shell-level reflection data.

The geometric input is `B=v₂`, `D=v₃`, the exact upper cap-apex `C` over `AB`,
and the lower witness `q ∈ I₃` that is the reflection of `C` across line `BD`:

* `hAC  : |AC| = |AB|`        (`C` is the exact cap-apex; gives `cos θ = -r/2`),
* `hBD  : |BD| = |BC|`        (`D` lies on the radius-`r=|BC|` circle about `B`),
* `hBq  : |Bq| = |BC|`        (`q` on the radius-`r` circle about `B`),
* `hDq  : |Dq| = |DC|`        (`q` on the `D`-centered circle through `C`),
* `hlong : |AB| < |AD|`       (`v₃` is the far apex: `|AD| > 1`, gives `cos δ > -r/2`),
* `hCside : C` is on the same open side of `AB` as `v₃` (above),
* `hqC : q ≠ C`               (`q` is the *other* common point).

Normalizing by a similarity transport `A=v₁ ↦ (0,0)`, `B=v₂ ↦ (1,0)` (flipped so
`(T v₃)₁` is above the chord), `C`, `D`, `q` all sit on the circle of radius
`r := |BC|` about `B`.  The chord condition `|Dq| = |DC|` makes `q` the
reflection of `C` across `BD`, so `T q = (1 + r\cos(2δ-θ), r\sin(2δ-θ))` with
`\sin(2δ-θ) < 0` (`q` below `AB`).  This is exactly the `QEqCReflectionConfig`
data the consumer `qEqC_row_impossible_of_lower_witness` requires. -/
set_option maxHeartbeats 8000000 in
-- Large heartbeat budget: the proof packages a full similarity transport,
-- several coordinate `nlinarith` certificates, and the reflection-angle core.
theorem qEqC_reflection_config_of_shell
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    {q C : ℝ²}
    (hqI3 : q ∈ S.I3)
    (hAC : dist S.triangle.v1 C = dist S.triangle.v1 S.triangle.v2)
    (hBD : dist S.triangle.v2 S.triangle.v3 = dist S.triangle.v2 C)
    (hBq : dist S.triangle.v2 q = dist S.triangle.v2 C)
    (hDq : dist S.triangle.v3 q = dist S.triangle.v3 C)
    (hlong : dist S.triangle.v1 S.triangle.v2 < dist S.triangle.v1 S.triangle.v3)
    (hCside :
      0 < signedArea2 C S.triangle.v1 S.triangle.v2 *
        signedArea2 S.triangle.v3 S.triangle.v1 S.triangle.v2)
    (hqC : q ≠ C) :
    ∃ r : ℝ, S.QEqCReflectionConfig q r := by
  classical
  let q1 : ℝ² := S.triangle.v1
  let q2 : ℝ² := S.triangle.v2
  let q3 : ℝ² := S.triangle.v3
  -- Base transport `v₁ ↦ (-1,0)`, `v₂ ↦ (1,0)`.
  have hq1ne : q1 ≠ q2 := by simpa [q1, q2] using S.triangle.v12_ne
  rcases exists_base_transportData q1 q2 hq1ne with
    ⟨Tbase, tauBase, hv1Base, hv2Base⟩
  have horientBase_ne : tauBase.orientation ≠ 0 := by
    intro h0
    have : (0 : ℝ) ^ 2 = 1 := by simpa [h0] using tauBase.orientation_sq
    norm_num at this
  -- `v₃` is off the base chord, so its image second coordinate is nonzero.
  have hq3_base_nonzero : (Tbase q3) 1 ≠ 0 := by
    have hq3_sa_ne : signedArea2 q3 q1 q2 ≠ 0 := by
      have hv1O : ‖q1 - S.Packet.center‖ = S.Packet.radius := by
        simpa [q1] using S.Packet.moser_on_boundary_1
      have hv2O : ‖q2 - S.Packet.center‖ = S.Packet.radius := by
        simpa [q2] using S.Packet.moser_on_boundary_2
      have hv3O : ‖q3 - S.Packet.center‖ = S.Packet.radius := by
        simpa [q3] using S.Packet.moser_on_boundary_3
      exact MEC.signedArea2_ne_zero_of_three_dist_eq
        hv3O hv1O hv2O
        S.triangle.v13_ne.symm S.triangle.v12_ne S.triangle.v23_ne.symm
    have himg_ne : signedArea2 (Tbase q3) (Tbase q1) (Tbase q2) ≠ 0 := by
      rw [tauBase.halfplane_sign q3 q1 q2]
      exact mul_ne_zero
        (mul_ne_zero horientBase_ne (pow_ne_zero 2 (ne_of_gt tauBase.scale_pos)))
        hq3_sa_ne
    intro h0
    apply himg_ne
    rw [hv1Base, hv2Base, signedArea2_baseChord_vec2]
    linarith
  -- Reusable construction from any base transport with `v₃` above the chord.
  have build_from :
      ∀ {T0 : ℝ² → ℝ²},
        (tau0 : Problem97.CGN.SimilarityTransportData T0) →
        T0 q1 = Problem97.CGN.vec2 (-1) 0 →
        T0 q2 = Problem97.CGN.vec2 1 0 →
        0 < (T0 q3) 1 →
        ∃ r : ℝ, S.QEqCReflectionConfig q r := by
    intro T0 tau0 hv1 hv2 hq3y_pos
    -- Postcompose by the fixed half-shift: `v₁ ↦ (0,0)`, `v₂ ↦ (1,0)`.
    let T : ℝ² → ℝ² := fun x => halfShift (T0 x)
    let tau : Problem97.CGN.SimilarityTransportData T :=
      similarityTransportComp tau0 halfShiftSimilarityTransportData
    have hv1T : T q1 = Problem97.CGN.vec2 0 0 := by
      dsimp [T]; rw [hv1]
      ext i <;> fin_cases i <;>
        simp [halfShift, Problem97.CGN.vec2, EuclideanSpace.single_apply]
    have hv2T : T q2 = Problem97.CGN.vec2 1 0 := by
      dsimp [T]; rw [hv2]
      ext i <;> fin_cases i <;>
        simp [halfShift, Problem97.CGN.vec2, EuclideanSpace.single_apply]
    -- `v₃` stays above the chord after the half-shift.
    have hq3y_T : 0 < (T q3) 1 := by
      dsimp [T]
      simp only [halfShift, Problem97.CGN.vec2, EuclideanSpace.single_apply]
      have : (0 : ℝ) < (T0 q3) 1 / 2 := by linarith
      simpa using this
    -- Coordinate values of the base endpoints.
    have hv2c0 : (T q2) 0 = 1 := by rw [hv2T]; simp [Problem97.CGN.vec2]
    have hv2c1 : (T q2) 1 = 0 := by rw [hv2T]; simp [Problem97.CGN.vec2]
    have hv1c0 : (T q1) 0 = 0 := by rw [hv1T]; simp [Problem97.CGN.vec2]
    have hv1c1 : (T q1) 1 = 0 := by rw [hv1T]; simp [Problem97.CGN.vec2]
    -- `q ∈ I₃` lies strictly below the base chord `AB`; first some shell facts.
    have hxA : q ∈ A := S.CP.C3_subset (by
      unfold Problem97.FiniteEndpointShell.I3 at hqI3
      exact Finset.mem_of_mem_erase (Finset.mem_of_mem_erase hqI3))
    have hqC3 : q ∈ S.CP.C3 := by
      unfold Problem97.FiniteEndpointShell.I3 at hqI3
      exact Finset.mem_of_mem_erase (Finset.mem_of_mem_erase hqI3)
    have hq_ne_v1 : q ≠ q1 := by
      unfold Problem97.FiniteEndpointShell.I3 at hqI3
      exact (Finset.mem_erase.mp (Finset.mem_erase.mp hqI3).2).1
    have hq_ne_v2 : q ≠ q2 := by
      unfold Problem97.FiniteEndpointShell.I3 at hqI3
      exact (Finset.mem_erase.mp hqI3).1
    have hq3_base_ne : signedArea2 q3 q1 q2 ≠ 0 := by
      have hv1O : dist q3 S.Packet.center = S.Packet.radius := by
        simpa [q3, dist_eq_norm] using S.Packet.moser_on_boundary_3
      have hv2O : dist q1 S.Packet.center = S.Packet.radius := by
        simpa [q1, dist_eq_norm] using S.Packet.moser_on_boundary_1
      have hv3O : dist q2 S.Packet.center = S.Packet.radius := by
        simpa [q2, dist_eq_norm] using S.Packet.moser_on_boundary_2
      exact MEC.signedArea2_ne_zero_of_three_dist_eq
        hv1O hv2O hv3O
        S.triangle.v13_ne.symm S.triangle.v12_ne S.triangle.v23_ne.symm
    have hq_arc : signedArea2 q q1 q2 * signedArea2 q3 q1 q2 ≤ 0 :=
      (S.CP.arc_membership q hxA).2.2.1 hqC3
    have hq_base_ne : signedArea2 q q1 q2 ≠ 0 := by
      intro hz
      have hcol : Collinear ℝ ({q, q1, q2} : Set ℝ²) :=
        (Problem97.signedArea2_eq_zero_iff_collinear q q1 q2).1 hz
      exact False.elim <|
        S.hconv.not_three_collinear hxA S.triangle.v1_mem S.triangle.v2_mem
          hq_ne_v1 hq_ne_v2 S.triangle.v12_ne hcol
    have hq3_img_pos : 0 < signedArea2 (T0 q3) (T0 q1) (T0 q2) := by
      rw [hv1, hv2, signedArea2_baseChord_vec2]; linarith
    -- `q` below `AB`: `(T q)₁ < 0`.
    have hqy_T : (T q) 1 < 0 := by
      have himg_nonpos :
          signedArea2 (T0 q) (T0 q1) (T0 q2) * signedArea2 (T0 q3) (T0 q1) (T0 q2) ≤ 0 := by
        rw [tau0.halfplane_sign q q1 q2, tau0.halfplane_sign q3 q1 q2]
        have hrew :
            (tau0.orientation * (tau0.scale ^ 2) * signedArea2 q q1 q2) *
                (tau0.orientation * (tau0.scale ^ 2) * signedArea2 q3 q1 q2) =
              (tau0.orientation ^ 2) * (tau0.scale ^ 2 * tau0.scale ^ 2) *
                (signedArea2 q q1 q2 * signedArea2 q3 q1 q2) := by ring
        rw [hrew, tau0.orientation_sq]
        have hscale_nonneg : 0 ≤ tau0.scale ^ 2 * tau0.scale ^ 2 := by positivity
        simpa using mul_nonpos_of_nonneg_of_nonpos hscale_nonneg hq_arc
      have hq_img_lt : signedArea2 (T0 q) (T0 q1) (T0 q2) < 0 := by
        have hq_img_le : signedArea2 (T0 q) (T0 q1) (T0 q2) ≤ 0 := by
          by_contra hq_pos
          have : 0 < signedArea2 (T0 q) (T0 q1) (T0 q2) *
              signedArea2 (T0 q3) (T0 q1) (T0 q2) := mul_pos (by linarith) hq3_img_pos
          linarith
        have hq_img_ne : signedArea2 (T0 q) (T0 q1) (T0 q2) ≠ 0 := by
          rw [tau0.halfplane_sign q q1 q2]
          have horient_ne : tau0.orientation ≠ 0 := by
            intro h0
            have : (0 : ℝ) ^ 2 = 1 := by simpa [h0] using tau0.orientation_sq
            norm_num at this
          exact mul_ne_zero
            (mul_ne_zero horient_ne (pow_ne_zero 2 (ne_of_gt tau0.scale_pos))) hq_base_ne
        exact lt_of_le_of_ne hq_img_le hq_img_ne
      rw [hv1, hv2, signedArea2_baseChord_vec2] at hq_img_lt
      dsimp [T]
      simp only [halfShift, Problem97.CGN.vec2, EuclideanSpace.single_apply]
      have : (T0 q) 1 / 2 < 0 := by linarith
      simpa using this
    -- `C` above `AB`: `(T C)₁ > 0`, from `hCside` (same side as `v₃`).
    have hC_base_ne : signedArea2 C q1 q2 ≠ 0 := by
      intro hz; rw [hz, zero_mul] at hCside; exact lt_irrefl _ hCside
    have hCy_T : 0 < (T C) 1 := by
      have hC_img_prod :
          0 < signedArea2 (T0 C) (T0 q1) (T0 q2) * signedArea2 (T0 q3) (T0 q1) (T0 q2) := by
        rw [tau0.halfplane_sign C q1 q2, tau0.halfplane_sign q3 q1 q2]
        have hrew :
            (tau0.orientation * (tau0.scale ^ 2) * signedArea2 C q1 q2) *
                (tau0.orientation * (tau0.scale ^ 2) * signedArea2 q3 q1 q2) =
              (tau0.orientation ^ 2) * (tau0.scale ^ 2 * tau0.scale ^ 2) *
                (signedArea2 C q1 q2 * signedArea2 q3 q1 q2) := by ring
        rw [hrew, tau0.orientation_sq]
        have hscale_pos : 0 < tau0.scale ^ 2 * tau0.scale ^ 2 := by
          have := tau0.scale_pos; positivity
        have hprod : 0 < signedArea2 C q1 q2 * signedArea2 q3 q1 q2 := by
          simpa [q1, q2, q3] using hCside
        have : 0 < tau0.scale ^ 2 * tau0.scale ^ 2 *
            (signedArea2 C q1 q2 * signedArea2 q3 q1 q2) := mul_pos hscale_pos hprod
        linarith [this]
      have hC_img_pos : 0 < signedArea2 (T0 C) (T0 q1) (T0 q2) := by
        by_contra hle
        push_neg at hle
        have : signedArea2 (T0 C) (T0 q1) (T0 q2) *
            signedArea2 (T0 q3) (T0 q1) (T0 q2) ≤ 0 :=
          mul_nonpos_of_nonpos_of_nonneg hle (le_of_lt hq3_img_pos)
        linarith
      rw [hv1, hv2, signedArea2_baseChord_vec2] at hC_img_pos
      dsimp [T]
      simp only [halfShift, Problem97.CGN.vec2, EuclideanSpace.single_apply]
      have : (0 : ℝ) < (T0 C) 1 / 2 := by linarith
      simpa using this
    -- Transported radius `r := |Bq| = |BC|`.
    have hv3_ne_v2 : q3 ≠ q2 := by simpa [q2, q3] using S.triangle.v23_ne.symm
    set r : ℝ := dist (T q2) (T C) with hr_def
    have hC_ne_v2 : C ≠ q2 := by
      intro h; rw [h] at hC_base_ne
      exact hC_base_ne (by
        have : signedArea2 q2 q1 q2 = 0 := by
          simp [signedArea2]
        simpa [q1, q2] using this)
    have hd_C : 0 < dist q2 C := by rw [dist_pos]; exact fun h => hC_ne_v2 h.symm
    have hr_pos : 0 < r := by
      rw [hr_def, tau.dist_image]; exact mul_pos tau.scale_pos hd_C
    -- The three radius-`r` circle facts (all about center `T v₂`).
    have hBC_T : dist (T q2) (T C) = r := hr_def.symm
    have hBq_T : dist (T q2) (T q) = r := by
      rw [hr_def, tau.dist_image, tau.dist_image]
      have : dist q2 q = dist q2 C := by simpa [q2] using hBq
      rw [this]
    have hBD_T : dist (T q2) (T q3) = r := by
      rw [hr_def, tau.dist_image, tau.dist_image]
      have : dist q2 q3 = dist q2 C := by simpa [q2, q3] using hBD
      rw [this]
    -- `|Dq| = |DC|` transported (the chord condition; `|Dq|` need not equal `r`).
    have hDq_T : dist (T q3) (T q) = dist (T q3) (T C) := by
      rw [tau.dist_image, tau.dist_image]
      have : dist q3 q = dist q3 C := by simpa [q3] using hDq
      rw [this]
    -- Coordinate abbreviations on the circle of radius `r` about `(1,0)`.
    set cθ : ℝ := ((T C) 0 - 1) / r with hcθ_def
    set sθ : ℝ := (T C) 1 / r with hsθ_def
    set cδ : ℝ := ((T q3) 0 - 1) / r with hcδ_def
    set sδ : ℝ := (T q3) 1 / r with hsδ_def
    set cη : ℝ := ((T q) 0 - 1) / r with hcη_def
    set sη : ℝ := (T q) 1 / r with hsη_def
    -- Pythagorean identities from the circle facts.
    have hθpyth : cθ ^ 2 + sθ ^ 2 = 1 := by
      have hsq := dist_sq_eq_coord_sq_add_coord_sq (T q2) (T C)
      rw [hBC_T, hv2c0, hv2c1] at hsq
      rw [hcθ_def, hsθ_def]; field_simp; nlinarith [hsq]
    have hδpyth : cδ ^ 2 + sδ ^ 2 = 1 := by
      have hsq := dist_sq_eq_coord_sq_add_coord_sq (T q2) (T q3)
      rw [hBD_T, hv2c0, hv2c1] at hsq
      rw [hcδ_def, hsδ_def]; field_simp; nlinarith [hsq]
    have hηpyth : cη ^ 2 + sη ^ 2 = 1 := by
      have hsq := dist_sq_eq_coord_sq_add_coord_sq (T q2) (T q)
      rw [hBq_T, hv2c0, hv2c1] at hsq
      rw [hcη_def, hsη_def]; field_simp; nlinarith [hsq]
    -- `sθ > 0`, `sδ > 0` (above), `sη < 0` (below).
    have hsθ_pos : 0 < sθ := by rw [hsθ_def]; positivity
    have hsδ_pos : 0 < sδ := by rw [hsδ_def]; positivity
    have hsη_neg : sη < 0 := by
      rw [hsη_def]; exact div_neg_of_neg_of_pos hqy_T hr_pos
    -- `cθ = -r/2` from `|AC| = |AB| = 1`.
    have hAB1 : dist (T q1) (T q2) = 1 := by
      rw [hv1T, hv2T, dist_eq_norm]
      have hvec :
          Problem97.CGN.vec2 0 0 - Problem97.CGN.vec2 1 0 = Problem97.CGN.vec2 (-1) 0 := by
        ext i <;> fin_cases i <;>
          simp [Problem97.CGN.vec2, EuclideanSpace.single_apply]
      rw [hvec, EuclideanSpace.norm_eq]
      norm_num [Problem97.CGN.vec2, EuclideanSpace.single_apply]
    have hAC_T : dist (T q1) (T C) = 1 := by
      rw [tau.dist_image]
      have : dist (T q1) (T q2) = tau.scale * dist q1 q2 := tau.dist_image q1 q2
      rw [hAB1] at this
      have hAC' : dist q1 C = dist q1 q2 := by simpa [q1, q2] using hAC
      rw [hAC']; linarith [this]
    have hcθ_eq : cθ = -(r / 2) := by
      -- `|AC|² = 1`: `(TC₀)² + (TC₁)² = 1` (no `r`-unfolding).
      have hACsq : (T C) 0 ^ 2 + (T C) 1 ^ 2 = 1 := by
        have h := dist_sq_eq_coord_sq_add_coord_sq (T q1) (T C)
        rw [hAC_T, hv1c0, hv1c1] at h
        nlinarith [h]
      -- The circle identity `(TC₀-1)² + (TC₁)² = r²` from `hθpyth`.
      have hcirc : ((T C) 0 - 1) ^ 2 + (T C) 1 ^ 2 = r ^ 2 := by
        have h := hθpyth
        rw [hcθ_def, hsθ_def] at h
        field_simp at h
        nlinarith [h]
      -- Subtract to get `TC₀ = 1 - r²/2`, hence `cθ = -r/2`.
      have hTC0 : (T C) 0 = 1 - r ^ 2 / 2 := by nlinarith [hACsq, hcirc]
      rw [hcθ_def, hTC0]; field_simp; ring
    -- `cδ > -r/2` from `|AD| > 1`.
    have hcδ_gt : -(r / 2) < cδ := by
      have hAD : 1 < dist (T q1) (T q3) := by
        rw [tau.dist_image]
        have hsc : dist (T q1) (T q2) = tau.scale * dist q1 q2 := tau.dist_image q1 q2
        rw [hAB1] at hsc
        have hlong' : dist q1 q2 < dist q1 q3 := by simpa [q1, q2, q3] using hlong
        nlinarith [hsc, hlong', tau.scale_pos, dist_nonneg (x := q1) (y := q2)]
      have hADsq : 1 < (T q3) 0 ^ 2 + (T q3) 1 ^ 2 := by
        have h := dist_sq_eq_coord_sq_add_coord_sq (T q1) (T q3)
        rw [hv1c0, hv1c1] at h
        nlinarith [hAD, dist_nonneg (x := T q1) (y := T q3), h]
      -- circle identity `(TD₀-1)² + (TD₁)² = r²` from `hδpyth`.
      have hBDsq : ((T q3) 0 - 1) ^ 2 + (T q3) 1 ^ 2 = r ^ 2 := by
        have h := hδpyth
        rw [hcδ_def, hsδ_def] at h
        field_simp at h
        nlinarith [h]
      -- `(TD₀)² + (TD₁)² > 1` and `(TD₀-1)² + (TD₁)² = r²` give `TD₀ > 1 - r²/2 > -r²/2`.
      rw [hcδ_def, lt_div_iff₀ hr_pos]
      nlinarith [hADsq, hBDsq]
    -- Coordinate values on the circle of radius `r` about `(1,0)`.
    have hrne : r ≠ 0 := ne_of_gt hr_pos
    have hTC0 : (T C) 0 = 1 + r * cθ := by rw [hcθ_def]; field_simp; ring
    have hTC1 : (T C) 1 = r * sθ := by rw [hsθ_def]; field_simp
    have hTD0 : (T q3) 0 = 1 + r * cδ := by rw [hcδ_def]; field_simp; ring
    have hTD1 : (T q3) 1 = r * sδ := by rw [hsδ_def]; field_simp
    have hTq0 : (T q) 0 = 1 + r * cη := by rw [hcη_def]; field_simp; ring
    have hTq1 : (T q) 1 = r * sη := by rw [hsη_def]; field_simp
    -- The radical (chord) condition `cη·cδ + sη·sδ = cθ·cδ + sθ·sδ` from `|Dq| = |DC|`.
    have hradical : cη * cδ + sη * sδ = cθ * cδ + sθ * sδ := by
      have hsqeq : dist (T q3) (T q) ^ 2 = dist (T q3) (T C) ^ 2 := by rw [hDq_T]
      rw [dist_sq_eq_coord_sq_add_coord_sq, dist_sq_eq_coord_sq_add_coord_sq] at hsqeq
      rw [hTC0, hTC1, hTD0, hTD1, hTq0, hTq1] at hsqeq
      have hrne : r ≠ 0 := ne_of_gt hr_pos
      have hkey : (cη * cδ + sη * sδ) * r ^ 2 = (cθ * cδ + sθ * sδ) * r ^ 2 := by
        nlinarith [hsqeq, hδpyth]
      have hr2pos : (0 : ℝ) < r ^ 2 := by positivity
      exact mul_right_cancel₀ (ne_of_gt hr2pos) hkey
    -- `q ≠ C` gives `(cη, sη) ≠ (cθ, sθ)`.
    have hne : ¬ (cη = cθ ∧ sη = sθ) := by
      rintro ⟨hc, hs⟩
      apply hqC
      have h0 : (T q) 0 = (T C) 0 := by rw [hTq0, hTC0, hc]
      have h1 : (T q) 1 = (T C) 1 := by rw [hTq1, hTC1, hs]
      have hTqC : T q = T C := by
        ext i; fin_cases i
        · exact h0
        · exact h1
      have hd0 : dist (T q) (T C) = 0 := by rw [hTqC]; simp
      rw [tau.dist_image] at hd0
      have : dist q C = 0 := by
        rcases mul_eq_zero.mp hd0 with h | h
        · exact absurd h (ne_of_gt tau.scale_pos)
        · exact h
      exact dist_eq_zero.mp this
    -- Build the genuine angles via the reflection-angle core.
    obtain ⟨θ, δ, hcosθ, hsinθ, hθ0, hθπ, hcosδ, hsinδ, hδ0, hδπ, hcη_eq, hsη_eq⟩ :=
      qEqC_reflection_coords r cθ sθ cδ sδ cη sη hr_pos hcθ_eq hsθ_pos hθpyth
        hcδ_gt hsδ_pos hδpyth hηpyth hsη_neg hradical hne
    -- Assemble the configuration: `T q = (1 + r cos(2δ-θ), r sin(2δ-θ))`.
    have hcosθ' : Real.cos θ = -(r / 2) := by rw [hcosθ]; exact hcθ_eq
    have hsinθ' : 0 < Real.sin θ := by rw [hsinθ]; exact hsθ_pos
    have hcosδ' : -(r / 2) < Real.cos δ := by rw [hcosδ]; exact hcδ_gt
    have hsinδ' : 0 < Real.sin δ := by rw [hsinδ]; exact hsδ_pos
    have hqbelow' : Real.sin (2 * δ - θ) < 0 := by rw [← hsη_eq]; exact hsη_neg
    have hTq0' : (T q) 0 = 1 + r * Real.cos (2 * δ - θ) := by rw [hTq0, hcη_eq]
    have hTq1' : (T q) 1 = r * Real.sin (2 * δ - θ) := by rw [hTq1, hsη_eq]
    have hqcoord : T q =
        Problem97.CGN.vec2 (1 + r * Real.cos (2 * δ - θ)) (r * Real.sin (2 * δ - θ)) := by
      ext i; fin_cases i
      · change (T q) 0 = _
        rw [hTq0']; simp [Problem97.CGN.vec2, EuclideanSpace.single_apply]
      · change (T q) 1 = _
        rw [hTq1']; simp [Problem97.CGN.vec2, EuclideanSpace.single_apply]
    exact ⟨r, T, tau, θ, δ, hv1T, hv2T, hr_pos,
      hcosθ', hsinθ', hθ0, hθπ, hcosδ', hsinδ', hδ0, hδπ, hqcoord, hqbelow'⟩
  -- Orient so that `(T q3) 1 > 0`, flipping if necessary.
  by_cases hq3pos : 0 < (Tbase q3) 1
  · exact build_from tauBase hv1Base hv2Base hq3pos
  · let Tflip : ℝ² → ℝ² := fun x => flipY (Tbase x)
    let tauFlip : Problem97.CGN.SimilarityTransportData Tflip :=
      similarityTransportComp tauBase flipYSimilarityTransportData
    have hv1Flip : Tflip q1 = Problem97.CGN.vec2 (-1) 0 := by
      dsimp [Tflip]; rw [hv1Base]
      ext i <;> fin_cases i <;>
        simp [flipY, Problem97.CGN.vec2, EuclideanSpace.single_apply]
    have hv2Flip : Tflip q2 = Problem97.CGN.vec2 1 0 := by
      dsimp [Tflip]; rw [hv2Base]
      ext i <;> fin_cases i <;>
        simp [flipY, Problem97.CGN.vec2, EuclideanSpace.single_apply]
    have hq3Flip : 0 < (Tflip q3) 1 := by
      dsimp [Tflip]
      simp only [flipY, Problem97.CGN.vec2, EuclideanSpace.single_apply]
      have hq3neg : (Tbase q3) 1 < 0 := by
        have hle : (Tbase q3) 1 ≤ 0 := le_of_not_gt hq3pos
        exact lt_of_le_of_ne hle hq3_base_nonzero
      simpa using hq3neg
    exact build_from tauFlip hv1Flip hv2Flip hq3Flip

/-- Row-level closure for the `q'=C`, `p' ∈ {a₁,b₁}` reflection-side rows
(`N4d-bA2c-D5`, `N4d-bA2c-D6`, `N4d-bA3c-D5`, `N4d-bA3c-D6`), wired end to end
from shell-level reflection data.

The producer `qEqC_reflection_config_of_shell` turns the cap-apex/reflection
equidistances into the prose-normalized `QEqCReflectionConfig`; the consumer
`qEqC_row_impossible_of_lower_witness` then closes the row using the lower-chain
cap order automatic for `q ∈ I₃`. -/
theorem qEqC_row_impossible_of_reflection
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    {q C : ℝ²}
    (hqI3 : q ∈ S.I3)
    (hAC : dist S.triangle.v1 C = dist S.triangle.v1 S.triangle.v2)
    (hBD : dist S.triangle.v2 S.triangle.v3 = dist S.triangle.v2 C)
    (hBq : dist S.triangle.v2 q = dist S.triangle.v2 C)
    (hDq : dist S.triangle.v3 q = dist S.triangle.v3 C)
    (hlong : dist S.triangle.v1 S.triangle.v2 < dist S.triangle.v1 S.triangle.v3)
    (hCside :
      0 < signedArea2 C S.triangle.v1 S.triangle.v2 *
        signedArea2 S.triangle.v3 S.triangle.v1 S.triangle.v2)
    (hqC : q ≠ C) :
    False := by
  obtain ⟨r, hconfig⟩ :=
    S.qEqC_reflection_config_of_shell hqI3 hAC hBD hBq hDq hlong hCside hqC
  exact S.qEqC_row_impossible_of_lower_witness hqI3 hconfig

/-- `N4d-bA2c-D5/D6` (and `N4d-bA3c-D5/D6`): the `x = a₂`, `p = v₃`
lower-side `q' = C` reflection column of the `v₃` selector is impossible.

This is the cell-level *producer* that derives the eight geometric
hypotheses of `qEqC_row_impossible_of_reflection` from the lower-branch
selector packets, then calls that closer.  The upper unit-apex `C` is the
Form-`b`, `x = a₂` witness `a₂`: in the `bA` branch the `v₁` witness class
meets `C₂` in `{a₂}` and `C₃` in `{v₂}`, so `|v₁a₂| = r = |v₁v₂|`, i.e. `a₂`
is the exact unit apex `|AC| = |AB|`.  The `v₂`-selector circle puts `v₃` and
the lower witness `q` at radius `s = |v₂a₂|` about `v₂` (`|BD| = |Bq| = |BC|`),
and the `v₃`-selector circle puts `q` and `a₂` at the common radius about `v₃`
(`|Dq| = |DC|`).  Cap order gives `|v₁v₂| < |v₁v₃|`, and
`c2_vertex_same_open_side_as_v3` gives the same-side product `hCside`.  The
closer then refutes the row by the lower-witness cosine-monotonicity
contradiction. -/
theorem n4d_bA_2_q_eq_C_impossible
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) {r s t : ℝ}
    (hB : S.IsFormB_v1 r)
    (hlower : FormBv1A2SelectorV2LowerPacket S Z r s)
    (hpacket3 : SelectorV3Qa2Packet S Z t) :
    False := by
  classical
  rcases hlower with ⟨hA2, ha2eq, hTcard, hI2sub, hC1eq, hC3eq⟩
  rcases hpacket3 with ⟨hI3sub, p, hp, hpeq, hqeqC2⟩
  let T := S.witnessClassAt_v2 s
  -- `v₃` is on the `v₂`-selector circle (radius `s`), via `T ∩ C₁ = {v₃}`.
  have hv3T : S.triangle.v3 ∈ T := by
    have hmem : S.triangle.v3 ∈ ({S.triangle.v3} : Finset ℝ²) := by simp
    rw [← hC1eq] at hmem
    exact (Finset.mem_inter.mp hmem).1
  -- The lower witness `q ∈ I₃` lying on the `v₂`-selector circle.
  have hq :
      (Z.a3 : ℝ²) ∈ T ∩ S.CP.C3 ∨ (Z.b3 : ℝ²) ∈ T ∩ S.CP.C3 := by
    rcases hC3eq with hqa3 | hqb3
    · left
      have hmem : Z.a3 ∈ ({Z.a3} : Finset ℝ²) := by simp
      rw [← hqa3] at hmem
      exact hmem
    · right
      have hmem : Z.b3 ∈ ({Z.b3} : Finset ℝ²) := by simp
      rw [← hqb3] at hmem
      exact hmem
  obtain ⟨q, hqI3, hqT2⟩ : ∃ q : ℝ², q ∈ S.I3 ∧ q ∈ T := by
    rcases hq with hqa3 | hqb3
    · refine ⟨Z.a3, ?_, ?_⟩
      · rw [Z.hI3]; simp
      · exact (Finset.mem_inter.mp hqa3).1
    · refine ⟨Z.b3, ?_, ?_⟩
      · rw [Z.hI3]; simp
      · exact (Finset.mem_inter.mp hqb3).1
  -- The upper unit apex `C := a₂`.
  -- `hAC : |v₁a₂| = |v₁v₂|`.  Both equal the Form-`b` radius `r`.
  have hAC : dist S.triangle.v1 Z.a2 = dist S.triangle.v1 S.triangle.v2 := by
    have ha2T1 : Z.a2 ∈ S.witnessClassAt_v1 r := by
      have ha2mem : Z.a2 ∈ ({Z.a2} : Finset ℝ²) := by simp
      rw [← ha2eq] at ha2mem
      exact (Finset.mem_inter.mp ha2mem).1
    have hv2T1 : S.triangle.v2 ∈ S.witnessClassAt_v1 r := by
      rcases hB with ⟨x, hxI2, hxeq, hv2eq⟩
      have hv2mem : S.triangle.v2 ∈ ({S.triangle.v2} : Finset ℝ²) := by simp
      rw [← hv2eq] at hv2mem
      exact (Finset.mem_inter.mp hv2mem).1
    have ha2dist : dist S.triangle.v1 Z.a2 = r := by
      simpa using (Finset.mem_filter.mp ha2T1).2
    have hv2dist : dist S.triangle.v1 S.triangle.v2 = r := by
      simpa using (Finset.mem_filter.mp hv2T1).2
    rw [ha2dist, hv2dist]
  -- `hBD : |v₂v₃| = |v₂a₂|`.  Both equal the `v₂`-selector radius `s`.
  have ha2T2 : Z.a2 ∈ T := hI2sub hA2
  have hv3rad : dist S.triangle.v2 S.triangle.v3 = s := by
    simpa using (Finset.mem_filter.mp hv3T).2
  have ha2rad2 : dist S.triangle.v2 Z.a2 = s := by
    simpa using (Finset.mem_filter.mp ha2T2).2
  have hBD : dist S.triangle.v2 S.triangle.v3 = dist S.triangle.v2 Z.a2 := by
    rw [hv3rad, ha2rad2]
  -- `hBq : |v₂q| = |v₂a₂|`.  `q` on the `v₂`-selector circle.
  have hqrad2 : dist S.triangle.v2 q = s := by
    simpa using (Finset.mem_filter.mp hqT2).2
  have hBq : dist S.triangle.v2 q = dist S.triangle.v2 Z.a2 := by
    rw [hqrad2, ha2rad2]
  -- `hDq : |v₃q| = |v₃a₂|`.  Both on the `v₃`-selector circle (radius `t`).
  have ha2T3 : Z.a2 ∈ S.witnessClassAt_v3 t := by
    have ha2mem : Z.a2 ∈ ({Z.a2} : Finset ℝ²) := by simp
    rw [← hqeqC2] at ha2mem
    exact (Finset.mem_inter.mp ha2mem).1
  have hqT3 : q ∈ S.witnessClassAt_v3 t := hI3sub hqI3
  have ha2rad3 : dist S.triangle.v3 Z.a2 = t := by
    simpa using (Finset.mem_filter.mp ha2T3).2
  have hqrad3 : dist S.triangle.v3 q = t := by
    simpa using (Finset.mem_filter.mp hqT3).2
  have hDq : dist S.triangle.v3 q = dist S.triangle.v3 Z.a2 := by
    rw [hqrad3, ha2rad3]
  -- `hlong : |v₁v₂| < |v₁v₃|`.  Cap order at `a₂ ∈ I₂` plus `hAC`.
  have hlong : dist S.triangle.v1 S.triangle.v2 < dist S.triangle.v1 S.triangle.v3 := by
    have h := S.v1_lt_v1v3_of_mem_I2 (p := Z.a2) hA2
    rwa [hAC] at h
  -- `hCside`: `a₂` lies on the same open side of `v₁v₂` as `v₃`.
  have hCside :
      0 < signedArea2 Z.a2 S.triangle.v1 S.triangle.v2 *
        signedArea2 S.triangle.v3 S.triangle.v1 S.triangle.v2 :=
    S.c2_vertex_same_open_side_as_v3 hA2
  -- `hqC : q ≠ a₂`.  `q` is strictly closer to `v₁` than `a₂` is.
  have hqC : q ≠ Z.a2 := by
    intro hqa2
    have hlt := S.v1_lt_v1v2_of_mem_I3 hqI3
    rw [hqa2, ← hAC] at hlt
    exact lt_irrefl _ hlt
  exact S.qEqC_row_impossible_of_reflection hqI3 hAC hBD hBq hDq hlong hCside hqC

/- ### `q'=E`, `p' ∈ {a₁,b₁}` lower-arc column
(`N4d-bA2c-D8`, `N4d-bA2c-D9`, `N4d-bA3c-D8`, `N4d-bA3c-D9`).

These are the residual `p=v₃` lower-side D-selector rows in which the upper
`q'`-selector vertex equals `E = b₂` (the *other* `C₂` cap-apex), with the
lower-chain `D`-selector vertex `p' ∈ {a₁,b₁}` and the lower witness
`q ∈ I₃ ⊆ {a₃,b₃}`.  Fixed labels `A=v₁`, `B=v₂`, `D=v₃`.

**Soundness audit (2026-05-29).**  The prose `docs/97-full-prose-proof-draft.md`
closes this column two different ways:

* the `x=b₂` branch (lines ~2463-2477) via the **unit-reflection lemma** — the
  *same* mechanism as the `q'=C` slice, with `E` in place of `C`;
* the `x=a₂` branch (lines ~2214-2360) via a general **lower-arc
  distance-order lemma** (microlemmas N4d-bE-1..5) plus an "affine shortcut"
  proposed in the implementation plan §2a.

The implementation-plan §2a affine shortcut reduces the row to the claim that
`w·(v₁−v₃)` and `w·(v₂−v₃)` (with `w = b₃−a₃`) have the **same sign**, then
combines with cap order to get a contradiction.  This is **unsound**: the
squared-distance/dot-product identity it rests on is correct, but the
"same sign" conclusion is *uniformly false* in every realizable configuration.
A numerical sweep over genuine concyclic configurations (`a₃,b₃` on the MEC,
`|v₃a₃| = |v₃b₃|`, both on the support-cap side opposite `v₃`) finds the two
dot products always have **opposite** sign — and cap order already forces that
same opposite pairing, so there is nothing left to contradict.  (Concretely,
with `A=(0,0)`, `B=(1,0)`, `D=(1.041,0.506)`, `a₃=(-0.729,-1.237)`,
`b₃=(1.334,-1.961)` both on the circle centered `D`, one gets
`w·(A−D) = -1.782 < 0` while `w·(B−D) = +0.281 > 0`.)  The general lower-arc
lemma's hypothesis "the second intersection `E` is upper" likewise fails for a
large fraction (~55%) of cap-order configurations, so the continuity route is
*not* applicable as a blanket statement either.

**RETRACTION (2026-05-29, corrected second pass).**  The paragraph that stood
here claimed the `x=a₂`-branch `q'=E` rows (N4d-bA2c-D8/D9, N4d-bA3c-D8/D9) are
closed by relabeling the `q'=C` cosine-monotonicity argument with `E` "in place
of `C`" as an upper unit apex (`|AE|=|AB|=1`).  **That conflates two branches and
is false for these rows.**  The reflection argument needs the upper point to be a
*unit apex* (`hAE : |AE|=|AB|`).  In the `x=b₂` branch `E=b₂` is indeed the unit
apex — but the rows these declarations target are in the `x=a₂` branch, where the
unit apex is `a₂` and the `q'=E` selector vertex is the *other* cap vertex
`E=b₂`.  `IsFormB_v1` forces `witnessClassAt_v1 r ∩ C₂ = {a₂}` (singleton), so
`|A b₂| ≠ |AB|`: `hAE` is **provably unsatisfiable** for these rows.  Hence the
`qEqE_*` declarations below, though kernel-clean as isolated lemmas (they are
parametric in the upper point and merely re-skin the frame-agnostic `q'=C`
core), are a **dead lemma** for N4d-bA2c/bA3c-D8/D9 — there is no satisfiable
call site.  Those rows remain **OPEN**; their sound route is the prose lower-arc
distance-order lemma (N4d-bE-1..5), whose hypothesis is currently disputed
(professor: sound; a prover: fails ~55% of configs).  The reflection route
legitimately closes only the unit-apex column `q'=C` (`C=a₂`), wired as
`n4d_bA_2_q_eq_C_impossible`.  The declarations are retained as a frame-agnostic
core that a future `x=b₂`-branch wiring (where `E=b₂` *is* the unit apex) could
reuse.

**UPDATE 2026-06-01.**  The "disputed lower-arc lemma" above is no longer the
route, and the dispute is moot.  The sound `q'=E` closer is the *lower-arc
sign-block* spine, now BUILT and compiling sorry-free in this file:
`qEqE_lowerArc_sameSign_of_shell` (:6341, via the `√`-witness one-cosine crux
`qEqE_oneCosine_crux` :1772 — no `Real.Angle` development), the cap-order
opposite-sign `qEqE_capOrder_opposite` (:1283, off `I3_cap_order_chain` :1122),
and the combiner `qEqE_lowerArc_impossible` (:6816).  This spine needs only the
strict bound `hAElt : |v₁ b₂| < |v₁ v₂|` (NOT the unsatisfiable `|AE|=|AB|`).
The single remaining OPEN item is therefore `hAElt` itself — and it is **not a
cap-order fact**: `a₂ ∈ circle(v₁,r)∩circle(v₂,s)` while `b₂ ∈
circle(v₂,s)∩circle(v₃,t)`, so it reduces to `cos∠(v₁v₂b₂) > |v₂v₃|/(2|v₁v₂|)`,
a height/angle bound whose truth on the genuine packet is still to be
established.  Also still missing: a `SelectorV3` `q'=b₂` packet (3rd disjunct of
`SelectorV3SplitPacket` :1349) and the row producer `n4d_bA_2_q_eq_E_impossible`
(mirror of `n4d_bA_2_q_eq_C_impossible` :5928, routed through
`qEqE_lowerArc_impossible`).  See `docs/n-lane/97-n4d-qeqe-formalization-feasibility.md`
(§2026-06-01) and the closure-plan q'=E section.

**UPDATE 2026-06-01 (later) — `hAElt` is REFUTED, so this keystone is itself a
DEAD LEMMA for the b₂ rows.**  `hAElt : dist v₁ b₂ < dist v₁ v₂` (consumed at
:6351) does NOT follow from the shell + selector data — counterexample
re-verified, `|v₁b₂|=1.2165 ≥ 1=|v₁v₂|` with every keystone hypothesis satisfied.
Roots (PROVEN): the shell has no interior-cap concyclicity (`MecCapPacket`
`CGN.lean` puts only cap *endpoints* on the MEC circle), and b₂∈I₂'s only
cap-order bound is `|v₁b₂| < |v₁v₃|` (far endpoint, `v1_lt_v1v3_of_mem_I2`),
strictly weaker than `hAElt`; the v₂-bound exists only for I₃ vertices
(`v1_lt_v1v2_of_mem_I3`).  Do NOT build a producer asserting `hAElt`.

**UPDATE 2026-06-01 (later still) — NO Φ sign-block closes these rows; the whole
spine below is inapplicable to the q'=E b₂ rows.**  `qEqE_capOrder_opposite`
(:1283) proves `Φ < 0` UNCONDITIONALLY for any distinct I₃ pair, so the `Φ ≥ 0`
the combiner (:6816) needs is realizable NOWHERE for the genuine I₃ pair — the
keystone's `Φ ≥ 0` was a pure artifact of the impossible `hAElt`.  The I₃-pair
reframe is therefore ALSO dead (`Φ < 0` is a theorem there).  Four q'=E routes
dead: reflPt, affine §2a, cap-order-via-hAElt, any Φ sign-block.  The b₂ column
reduces to ONE question: does a global 9-point shell realize the b₂ selector?
NO → vacuity lemma; YES → global K4 / no-5-concyclic incidence (piece 3).  Full
records: `docs/n-lane/97-n4d-qeqe-hAElt-refutation.md` and
`…-I3pair-signblock-dead.md`. -/

/- PRODUCER for the `q'=E`, `p' ∈ {a₁,b₁}` rows: build the prose-normalized
`QEqCReflectionConfig` from shell-level reflection data with the upper point
`E` (`= b₂`).  Identical to `qEqC_reflection_config_of_shell` with `C ↦ E`:

* `hAE  : |AE| = |AB|`        (`E` is the exact upper unit-apex; `cos θ = -r/2`),
* `hBD  : |BD| = |BE|`        (`D` on the radius-`r=|BE|` circle about `B`),
* `hBq  : |Bq| = |BE|`        (`q` on the radius-`r` circle about `B`),
* `hDq  : |Dq| = |DE|`        (`q` on the `D`-centered circle through `E`),
* `hlong : |AB| < |AD|`,      (`v₃` is the far apex),
* `hEside : E` above `AB` (same open side as `v₃`),
* `hqE : q ≠ E`. -/
theorem qEqE_reflection_config_of_shell
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    {q E : ℝ²}
    (hqI3 : q ∈ S.I3)
    (hAE : dist S.triangle.v1 E = dist S.triangle.v1 S.triangle.v2)
    (hBD : dist S.triangle.v2 S.triangle.v3 = dist S.triangle.v2 E)
    (hBq : dist S.triangle.v2 q = dist S.triangle.v2 E)
    (hDq : dist S.triangle.v3 q = dist S.triangle.v3 E)
    (hlong : dist S.triangle.v1 S.triangle.v2 < dist S.triangle.v1 S.triangle.v3)
    (hEside :
      0 < signedArea2 E S.triangle.v1 S.triangle.v2 *
        signedArea2 S.triangle.v3 S.triangle.v1 S.triangle.v2)
    (hqE : q ≠ E) :
    ∃ r : ℝ, S.QEqCReflectionConfig q r :=
  S.qEqC_reflection_config_of_shell hqI3 hAE hBD hBq hDq hlong hEside hqE

/-- Frame-agnostic `q'=E` reflection closer.  **DEAD LEMMA for its nominal rows
(N4d-bA2c-D8/D9, N4d-bA3c-D8/D9) — see the RETRACTION in the soundness audit
above.**  It is kernel-clean (it just re-skins the `q'=C` core with `E` for
`C`), but its precondition `hAE : |AE|=|AB|` is **unsatisfiable** for those
`x=a₂`-branch rows: there `E=b₂` is the non-witness cap vertex and
`witnessClassAt_v1 r ∩ C₂={a₂}` forces `|A b₂|≠|AB|`.  Those rows are OPEN
(sound route = the disputed lower-arc distance-order lemma).  The lemma is kept
because it *is* a valid closer wherever `E` genuinely is the unit apex (e.g. a
future `x=b₂`-branch wiring), exactly mirroring `qEqC_row_impossible_of_reflection`. -/
theorem qEqE_row_impossible_of_reflection
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    {q E : ℝ²}
    (hqI3 : q ∈ S.I3)
    (hAE : dist S.triangle.v1 E = dist S.triangle.v1 S.triangle.v2)
    (hBD : dist S.triangle.v2 S.triangle.v3 = dist S.triangle.v2 E)
    (hBq : dist S.triangle.v2 q = dist S.triangle.v2 E)
    (hDq : dist S.triangle.v3 q = dist S.triangle.v3 E)
    (hlong : dist S.triangle.v1 S.triangle.v2 < dist S.triangle.v1 S.triangle.v3)
    (hEside :
      0 < signedArea2 E S.triangle.v1 S.triangle.v2 *
        signedArea2 S.triangle.v3 S.triangle.v1 S.triangle.v2)
    (hqE : q ≠ E) :
    False :=
  S.qEqC_row_impossible_of_reflection hqI3 hAE hBD hBq hDq hlong hEside hqE

/- ### `q'=E`, `x=a₂`-branch lower-arc column — the SOUND producer (feasibility
steps 4 + 5)

The dead reflection closer above must NOT be used for the `x=a₂` rows.  The
genuine route combines the three proven building blocks:

* **(A)** `qEqE_affine_identity` — on the common `v₃`-circle, the squared-distance
  differences to `v₂`/`v₁` are twice the coordinate dot products of `w := qs − q`
  against `v₃ − v₂` / `v₃ − v₁`;
* **(B)** `qEqE_lowerArc_sameSign` — in the normalized angle frame, the product of
  the two dot-product functionals is `≥ 0` (the same-sign block), discharged from
  the full packet pins (incl. the reflection pin `η = 2δ − ε` and `qs` lower);
* **(C)** `I3_cap_order_chain` — the two `I₃` vertices are STRICTLY opposite in
  their `v₁`/`v₂` distance orderings.

(B) is stated in the transported frame.  The producer
`qEqE_lowerArc_sameSign_of_shell` transports `(v₁,v₂)↦((0,0),(1,0))`, extracts the
angles `δ` (for `D`), `ε` (for `E`), the reflection angle `η = 2δ − ε` for the
B-circle witness `q`, the free Γ-angle `t` for the other lower vertex `qs`, and
`S = |DE|/r`; it derives every (B) sign-pin from the cap-order facts and feeds the
sinusoid bridge to land (B)'s `≥ 0` conclusion as the shell-level same-sign
statement.  `qEqE_lowerArc_row_impossible_of_lower_arc` then contradicts (C). -/

/-- Pure-ℝ reflection-angle core for the `q'=E` column.  Generalizes
`qEqC_reflection_coords` by dropping the unit-apex constraint `cε = −r/2` (here
`E = b₂` is NOT a unit apex).  Given `E`, `D`, `q` on the radius-`r` circle about
`B = (1,0)` with `q` on the `D`-centred circle through `E` (radical condition) and
`q ≠ E`, recovers genuine angles `ε`, `δ` and the reflection identity
`(cη,sη) = (cos(2δ−ε), sin(2δ−ε))`. -/
private theorem qEqE_reflection_coords
    (r cε sε cδ sδ cη sη : ℝ)
    (hsε : 0 < sε) (hεpyth : cε ^ 2 + sε ^ 2 = 1)
    (hsδ : 0 < sδ) (hδpyth : cδ ^ 2 + sδ ^ 2 = 1)
    (hηpyth : cη ^ 2 + sη ^ 2 = 1) (hsη : sη < 0)
    (hradical : cη * cδ + sη * sδ = cε * cδ + sε * sδ)
    (hne : ¬ (cη = cε ∧ sη = sε)) :
    ∃ ε δ : ℝ,
      Real.cos ε = cε ∧ Real.sin ε = sε ∧ 0 ≤ ε ∧ ε ≤ Real.pi ∧
      Real.cos δ = cδ ∧ Real.sin δ = sδ ∧ 0 ≤ δ ∧ δ ≤ Real.pi ∧
      cη = Real.cos (2 * δ - ε) ∧ sη = Real.sin (2 * δ - ε) := by
  have hcε_mem : -1 ≤ cε ∧ cε ≤ 1 := by
    constructor <;> nlinarith [hεpyth, sq_nonneg sε, sq_nonneg cε]
  have hcδ_mem : -1 ≤ cδ ∧ cδ ≤ 1 := by
    constructor <;> nlinarith [hδpyth, sq_nonneg sδ, sq_nonneg cδ]
  have hcη_mem : -1 ≤ cη ∧ cη ≤ 1 := by
    constructor <;> nlinarith [hηpyth, sq_nonneg sη, sq_nonneg cη]
  set ε : ℝ := Real.arccos cε with hε_def
  set δ : ℝ := Real.arccos cδ with hδ_def
  set η : ℝ := -Real.arccos cη with hη_def
  have hcosε : Real.cos ε = cε := Real.cos_arccos hcε_mem.1 hcε_mem.2
  have hsinε : Real.sin ε = sε := by
    rw [hε_def, Real.sin_arccos]
    have : Real.sqrt (1 - cε ^ 2) = Real.sqrt (sε ^ 2) := by congr 1; nlinarith [hεpyth]
    rw [this, Real.sqrt_sq (le_of_lt hsε)]
  have hcosδ : Real.cos δ = cδ := Real.cos_arccos hcδ_mem.1 hcδ_mem.2
  have hsinδ : Real.sin δ = sδ := by
    rw [hδ_def, Real.sin_arccos]
    have : Real.sqrt (1 - cδ ^ 2) = Real.sqrt (sδ ^ 2) := by congr 1; nlinarith [hδpyth]
    rw [this, Real.sqrt_sq (le_of_lt hsδ)]
  have hcosη : Real.cos η = cη := by
    rw [hη_def, Real.cos_neg]; exact Real.cos_arccos hcη_mem.1 hcη_mem.2
  have hsinη : Real.sin η = sη := by
    rw [hη_def, Real.sin_neg, Real.sin_arccos]
    have hsqrt : Real.sqrt (1 - cη ^ 2) = Real.sqrt (sη ^ 2) := by congr 1; nlinarith [hηpyth]
    rw [hsqrt, Real.sqrt_sq_eq_abs, abs_of_neg hsη]; ring
  have hcoseq : Real.cos (η - δ) = Real.cos (ε - δ) := by
    rw [Real.cos_sub, Real.cos_sub, hcosη, hsinη, hcosε, hsinε, hcosδ, hsinδ]
    linarith [hradical]
  have hcoords : ¬ (Real.cos η = Real.cos ε ∧ Real.sin η = Real.sin ε) := by
    rw [hcosη, hsinη, hcosε, hsinε]; exact hne
  have hrefl : Real.cos η = Real.cos (2 * δ - ε) ∧ Real.sin η = Real.sin (2 * δ - ε) := by
    rw [Real.cos_eq_cos_iff] at hcoseq
    obtain ⟨k, hk | hk⟩ := hcoseq
    · exfalso; apply hcoords
      have he : η = ε + ((-k : ℤ) : ℝ) * (2 * Real.pi) := by push_cast; linarith
      rw [he, Real.cos_add_int_mul_two_pi, Real.sin_add_int_mul_two_pi]; exact ⟨rfl, rfl⟩
    · have he : η = (2 * δ - ε) + ((k : ℤ) : ℝ) * (2 * Real.pi) := by linarith
      rw [he, Real.cos_add_int_mul_two_pi, Real.sin_add_int_mul_two_pi]; exact ⟨rfl, rfl⟩
  refine ⟨ε, δ, hcosε, hsinε, Real.arccos_nonneg cε, Real.arccos_le_pi cε,
    hcosδ, hsinδ, Real.arccos_nonneg cδ, Real.arccos_le_pi cδ, ?_, ?_⟩
  · rw [← hcosη, hrefl.1]
  · rw [← hsinη, hrefl.2]

/-- Pure-ℝ angle parametrization of the free lower vertex `qs` on `Γ` (the circle
of radius `r·S` about `D = (1 + r cδ, r sδ)`).  Recovers a `t` with
`qs = (1 + r cδ + r S cos t, r sδ + r S sin t)`. -/
private theorem qEqE_param_t (r S cd sd Sx Sy : ℝ) (hr : 0 < r) (hS : 0 < S)
    (hcirc : (Sx - (1 + r * cd)) ^ 2 + (Sy - r * sd) ^ 2 = (r * S) ^ 2) :
    ∃ t : ℝ, Sx = 1 + r * cd + r * S * Real.cos t ∧ Sy = r * sd + r * S * Real.sin t := by
  set ct := (Sx - (1 + r * cd)) / (r * S) with hct
  set st := (Sy - r * sd) / (r * S) with hst
  have hrS : 0 < r * S := mul_pos hr hS
  have hrSne : r * S ≠ 0 := ne_of_gt hrS
  have hpyth : ct ^ 2 + st ^ 2 = 1 := by rw [hct, hst]; field_simp; nlinarith [hcirc]
  have hcx : r * S * ct = Sx - (1 + r * cd) := by rw [hct]; field_simp
  have hsy : r * S * st = Sy - r * sd := by rw [hst]; field_simp
  by_cases hsnn : 0 ≤ st
  · refine ⟨Real.arccos ct, ?_, ?_⟩
    · rw [Real.cos_arccos (by nlinarith [sq_nonneg st]) (by nlinarith [sq_nonneg st])]
      linarith [hcx]
    · rw [Real.sin_arccos]
      have : Real.sqrt (1 - ct ^ 2) = Real.sqrt (st ^ 2) := by congr 1; nlinarith
      rw [this, Real.sqrt_sq hsnn]; linarith [hsy]
  · push_neg at hsnn
    refine ⟨-Real.arccos ct, ?_, ?_⟩
    · rw [Real.cos_neg, Real.cos_arccos (by nlinarith [sq_nonneg st]) (by nlinarith [sq_nonneg st])]
      linarith [hcx]
    · rw [Real.sin_neg, Real.sin_arccos]
      have : Real.sqrt (1 - ct ^ 2) = Real.sqrt (st ^ 2) := by congr 1; nlinarith
      rw [this, Real.sqrt_sq_eq_abs, abs_of_neg hsnn]
      have hneg : r * S * (-st) = -(Sy - r * sd) := by rw [← hsy]; ring
      linarith [hneg]

-- Helper lemmas extracted from qEqE_lowerArc_sameSign_of_shell to reduce
-- cumulative heartbeat cost of the sign-pin cluster.

set_option maxHeartbeats 800000 in
/-- Pure-ℝ lower bound: from `(x0-1)²/r² + x1²/r² = 1` (circle) and `x0²+x1² > 1`
(norm > 1), deduce `-(r/2) < (x0-1)/r`. -/
private lemma sign_pin_lower_bound (r x0 x1 : ℝ) (hr : 0 < r)
    (hpyth : ((x0 - 1) / r) ^ 2 + (x1 / r) ^ 2 = 1)
    (hbig : 1 < x0 ^ 2 + x1 ^ 2) :
    -(r / 2) < (x0 - 1) / r := by
  have hcirc : (x0 - 1) ^ 2 + x1 ^ 2 = r ^ 2 := by
    field_simp at hpyth; nlinarith [hpyth]
  rw [lt_div_iff₀ hr]
  nlinarith [hcirc, hbig, sq_nonneg x1]

set_option maxHeartbeats 800000 in
/-- Pure-ℝ upper bound: from `(x0-1)²/r² + x1²/r² = 1` (circle) and `x0²+x1² < 1`
(norm < 1), deduce `(x0-1)/r < -(r/2)`. -/
private lemma sign_pin_upper_bound (r x0 x1 : ℝ) (hr : 0 < r)
    (hpyth : ((x0 - 1) / r) ^ 2 + (x1 / r) ^ 2 = 1)
    (hsmall : x0 ^ 2 + x1 ^ 2 < 1) :
    (x0 - 1) / r < -(r / 2) := by
  have hcirc : (x0 - 1) ^ 2 + x1 ^ 2 = r ^ 2 := by
    field_simp at hpyth; nlinarith [hpyth]
  rw [div_lt_iff₀ hr]
  nlinarith [hcirc, hsmall, sq_nonneg x1]

set_option maxHeartbeats 800000 in
/-- Pure-trig chord-square formula: `2 - 2cos(δ-ε)` equals the coordinate-squared
ratio for points `(1+r cosδ, r sinδ)` and `(1+r cosε, r sinε)` on a circle of
radius `r` about `(1,0)`. -/
private lemma chord_sq_formula (r : ℝ) (hr : 0 < r) (δ ε : ℝ) :
    (2 - 2 * Real.cos (δ - ε)) =
        ((1 + r * Real.cos δ - (1 + r * Real.cos ε)) ^ 2
          + (r * Real.sin δ - r * Real.sin ε) ^ 2) / r ^ 2 := by
  rw [Real.cos_sub]
  have hpd : Real.sin δ ^ 2 + Real.cos δ ^ 2 = 1 := Real.sin_sq_add_cos_sq δ
  have hpe : Real.sin ε ^ 2 + Real.cos ε ^ 2 = 1 := Real.sin_sq_add_cos_sq ε
  field_simp
  nlinarith [hpd, hpe]

set_option maxHeartbeats 400000 in
-- Reduces hδpyth/hεpyth/hηpyth Pythagorean identities to single-application in keystone.
private lemma circle_pyth (p q2 : ℝ²) (r : ℝ) (hrne : r ≠ 0)
    (hq20 : q2 0 = 1) (hq21 : q2 1 = 0)
    (hdist : dist q2 p = r) :
    ((p 0 - 1) / r) ^ 2 + (p 1 / r) ^ 2 = 1 := by
  have hsq := dist_sq_eq_coord_sq_add_coord_sq q2 p
  rw [hq20, hq21, hdist] at hsq
  field_simp
  nlinarith [hsq]

set_option maxHeartbeats 400000 in
-- Reduces hADsq/hAEsq/hAqsq from inline nlinarith to single-application in keystone.
private lemma normsq_lt_of_origin_dist_lt (p q1 : ℝ²)
    (hq10 : q1 0 = 0) (hq11 : q1 1 = 0)
    (h : dist q1 p < 1) :
    p 0 ^ 2 + p 1 ^ 2 < 1 := by
  have hh := dist_sq_eq_coord_sq_add_coord_sq q1 p
  rw [hq10, hq11] at hh; simp only [zero_sub, neg_sq] at hh
  nlinarith [hh, dist_nonneg (x := q1) (y := p)]

set_option maxHeartbeats 400000 in
-- Reduces hADsq from inline nlinarith to single-application in keystone.
private lemma normsq_gt_of_origin_dist_gt (p q1 : ℝ²)
    (hq10 : q1 0 = 0) (hq11 : q1 1 = 0)
    (h : 1 < dist q1 p) :
    1 < p 0 ^ 2 + p 1 ^ 2 := by
  have hh := dist_sq_eq_coord_sq_add_coord_sq q1 p
  rw [hq10, hq11] at hh; simp only [zero_sub, neg_sq] at hh
  nlinarith [hh, dist_nonneg (x := q1) (y := p)]

set_option maxHeartbeats 400000 in
-- Reduces hDq_T_eq from inline nlinarith chain to single application in keystone.
private lemma dist_eq_r_sqrt_of_sq (distDq r : ℝ) (hr : 0 < r) (δ ε : ℝ)
    (hgeq : 0 ≤ distDq)
    (heqsq : distDq ^ 2 = r ^ 2 * (2 - 2 * Real.cos (δ - ε))) :
    distDq = r * Real.sqrt (2 - 2 * Real.cos (δ - ε)) := by
  have hnn : 0 ≤ 2 - 2 * Real.cos (δ - ε) := by nlinarith [Real.cos_le_one (δ - ε)]
  have hrS_nn : 0 ≤ r * Real.sqrt (2 - 2 * Real.cos (δ - ε)) :=
    mul_nonneg (le_of_lt hr) (Real.sqrt_nonneg _)
  have heqsq2 : distDq ^ 2 = (r * Real.sqrt (2 - 2 * Real.cos (δ - ε))) ^ 2 := by
    rw [heqsq, mul_pow, Real.sq_sqrt hnn]
  nlinarith [sq_nonneg (distDq - r * Real.sqrt (2 - 2 * Real.cos (δ - ε)))]

set_option maxHeartbeats 8000000 in
-- Large heartbeat budget: a full similarity transport, the reflection-angle and
-- Γ-parametrization extractions, the (B) sign-block bridge, and several
-- coordinate `nlinarith`/`linear_combination` certificates.
/-- **Frame closer (feasibility step 4).**  The SOUND `q'=E`, `x=a₂`-branch
same-sign producer.  From shell-level geometric data pinning the two `I₃` lower
vertices `q`, `qs` to the common `v₃`-circle `Γ`, `q` (and the cap apex `E = b₂`)
to the radius-`|v₂v₃|` circle about `v₂`, and `E` to `Γ` (so `q` is the
`BD`-reflection of `E`, `η = 2δ − ε`), this transports to the normalized frame
`v₁ ↦ (0,0)`, `v₂ ↦ (1,0)`, derives **all** the sign-pins of
`qEqE_lowerArc_sameSign`, and lands its `≥ 0` conclusion as the shell-level
same-sign statement
`0 ≤ (|v₂qs|²−|v₂q|²)·(|v₁qs|²−|v₁q|²)`.  Contradicting `I3_cap_order_chain`
(opposite signs) closes the rows. -/
theorem qEqE_lowerArc_sameSign_of_shell
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    {q qs E : ℝ²}
    (hqI3 : q ∈ S.I3) (hqsI3 : qs ∈ S.I3)
    (hDqs : dist S.triangle.v3 qs = dist S.triangle.v3 q)
    (hBq : dist S.triangle.v2 q = dist S.triangle.v2 S.triangle.v3)
    (hBE : dist S.triangle.v2 E = dist S.triangle.v2 S.triangle.v3)
    (hDE : dist S.triangle.v3 E = dist S.triangle.v3 q)
    (hsmall : dist S.triangle.v2 S.triangle.v3 < dist S.triangle.v1 S.triangle.v2)
    (hlong : dist S.triangle.v1 S.triangle.v2 < dist S.triangle.v1 S.triangle.v3)
    (hAElt : dist S.triangle.v1 E < dist S.triangle.v1 S.triangle.v2)
    (hEside :
      0 < signedArea2 E S.triangle.v1 S.triangle.v2 *
        signedArea2 S.triangle.v3 S.triangle.v1 S.triangle.v2)
    (hqE : q ≠ E) :
    0 ≤ (dist S.triangle.v2 qs ^ 2 - dist S.triangle.v2 q ^ 2)
        * (dist S.triangle.v1 qs ^ 2 - dist S.triangle.v1 q ^ 2) := by
  classical
  let q1 : ℝ² := S.triangle.v1
  let q2 : ℝ² := S.triangle.v2
  let q3 : ℝ² := S.triangle.v3
  -- Base transport `v₁ ↦ (-1,0)`, `v₂ ↦ (1,0)`.
  have hq1ne : q1 ≠ q2 := by simpa [q1, q2] using S.triangle.v12_ne
  rcases exists_base_transportData q1 q2 hq1ne with
    ⟨Tbase, tauBase, hv1Base, hv2Base⟩
  have horientBase_ne : tauBase.orientation ≠ 0 := by
    intro h0
    have : (0 : ℝ) ^ 2 = 1 := by simpa [h0] using tauBase.orientation_sq
    norm_num at this
  have hq3_base_nonzero : (Tbase q3) 1 ≠ 0 := by
    have hq3_sa_ne : signedArea2 q3 q1 q2 ≠ 0 := by
      have hv1O : ‖q1 - S.Packet.center‖ = S.Packet.radius := by
        simpa [q1] using S.Packet.moser_on_boundary_1
      have hv2O : ‖q2 - S.Packet.center‖ = S.Packet.radius := by
        simpa [q2] using S.Packet.moser_on_boundary_2
      have hv3O : ‖q3 - S.Packet.center‖ = S.Packet.radius := by
        simpa [q3] using S.Packet.moser_on_boundary_3
      exact MEC.signedArea2_ne_zero_of_three_dist_eq
        hv3O hv1O hv2O
        S.triangle.v13_ne.symm S.triangle.v12_ne S.triangle.v23_ne.symm
    have himg_ne : signedArea2 (Tbase q3) (Tbase q1) (Tbase q2) ≠ 0 := by
      rw [tauBase.halfplane_sign q3 q1 q2]
      exact mul_ne_zero
        (mul_ne_zero horientBase_ne (pow_ne_zero 2 (ne_of_gt tauBase.scale_pos)))
        hq3_sa_ne
    intro h0
    apply himg_ne
    rw [hv1Base, hv2Base, signedArea2_baseChord_vec2]
    linarith
  -- Reusable construction from any base transport with `v₃` above the chord.
  have build_from :
      ∀ {T0 : ℝ² → ℝ²},
        (tau0 : Problem97.CGN.SimilarityTransportData T0) →
        T0 q1 = Problem97.CGN.vec2 (-1) 0 →
        T0 q2 = Problem97.CGN.vec2 1 0 →
        0 < (T0 q3) 1 →
        0 ≤ (dist S.triangle.v2 qs ^ 2 - dist S.triangle.v2 q ^ 2)
            * (dist S.triangle.v1 qs ^ 2 - dist S.triangle.v1 q ^ 2) := by
    intro T0 tau0 hv1 hv2 hq3y_pos
    -- Postcompose by the fixed half-shift: `v₁ ↦ (0,0)`, `v₂ ↦ (1,0)`.
    let T : ℝ² → ℝ² := fun x => halfShift (T0 x)
    let tau : Problem97.CGN.SimilarityTransportData T :=
      similarityTransportComp tau0 halfShiftSimilarityTransportData
    have hv1T : T q1 = Problem97.CGN.vec2 0 0 := by
      dsimp [T]; rw [hv1]
      ext i <;> fin_cases i <;>
        simp [halfShift, Problem97.CGN.vec2, EuclideanSpace.single_apply]
    have hv2T : T q2 = Problem97.CGN.vec2 1 0 := by
      dsimp [T]; rw [hv2]
      ext i <;> fin_cases i <;>
        simp [halfShift, Problem97.CGN.vec2, EuclideanSpace.single_apply]
    have hq3y_T : 0 < (T q3) 1 := by
      dsimp [T]
      simp only [halfShift, Problem97.CGN.vec2, EuclideanSpace.single_apply]
      have : (0 : ℝ) < (T0 q3) 1 / 2 := by linarith
      simpa using this
    -- Coordinate values of the base endpoints.
    have hv2c0 : (T q2) 0 = 1 := by rw [hv2T]; simp [Problem97.CGN.vec2]
    have hv2c1 : (T q2) 1 = 0 := by rw [hv2T]; simp [Problem97.CGN.vec2]
    have hv1c0 : (T q1) 0 = 0 := by rw [hv1T]; simp [Problem97.CGN.vec2]
    have hv1c1 : (T q1) 1 = 0 := by rw [hv1T]; simp [Problem97.CGN.vec2]
    -- Shell membership facts for `q`, `qs`.
    have hxAq : q ∈ A := S.CP.C3_subset (by
      unfold Problem97.FiniteEndpointShell.I3 at hqI3
      exact Finset.mem_of_mem_erase (Finset.mem_of_mem_erase hqI3))
    have hqC3 : q ∈ S.CP.C3 := by
      unfold Problem97.FiniteEndpointShell.I3 at hqI3
      exact Finset.mem_of_mem_erase (Finset.mem_of_mem_erase hqI3)
    have hq_ne_v1 : q ≠ q1 := by
      unfold Problem97.FiniteEndpointShell.I3 at hqI3
      exact (Finset.mem_erase.mp (Finset.mem_erase.mp hqI3).2).1
    have hq_ne_v2 : q ≠ q2 := by
      unfold Problem97.FiniteEndpointShell.I3 at hqI3
      exact (Finset.mem_erase.mp hqI3).1
    have hxAqs : qs ∈ A := S.CP.C3_subset (by
      unfold Problem97.FiniteEndpointShell.I3 at hqsI3
      exact Finset.mem_of_mem_erase (Finset.mem_of_mem_erase hqsI3))
    have hqsC3 : qs ∈ S.CP.C3 := by
      unfold Problem97.FiniteEndpointShell.I3 at hqsI3
      exact Finset.mem_of_mem_erase (Finset.mem_of_mem_erase hqsI3)
    have hqs_ne_v1 : qs ≠ q1 := by
      unfold Problem97.FiniteEndpointShell.I3 at hqsI3
      exact (Finset.mem_erase.mp (Finset.mem_erase.mp hqsI3).2).1
    have hqs_ne_v2 : qs ≠ q2 := by
      unfold Problem97.FiniteEndpointShell.I3 at hqsI3
      exact (Finset.mem_erase.mp hqsI3).1
    have hq3_base_ne : signedArea2 q3 q1 q2 ≠ 0 := by
      have hv1O : dist q3 S.Packet.center = S.Packet.radius := by
        simpa [q3, dist_eq_norm] using S.Packet.moser_on_boundary_3
      have hv2O : dist q1 S.Packet.center = S.Packet.radius := by
        simpa [q1, dist_eq_norm] using S.Packet.moser_on_boundary_1
      have hv3O : dist q2 S.Packet.center = S.Packet.radius := by
        simpa [q2, dist_eq_norm] using S.Packet.moser_on_boundary_2
      exact MEC.signedArea2_ne_zero_of_three_dist_eq
        hv1O hv2O hv3O
        S.triangle.v13_ne.symm S.triangle.v12_ne S.triangle.v23_ne.symm
    have hq3_img_pos : 0 < signedArea2 (T0 q3) (T0 q1) (T0 q2) := by
      rw [hv1, hv2, signedArea2_baseChord_vec2]; linarith
    -- `q` below `AB`: `(T q)₁ < 0`.
    have hbelow : ∀ {x : ℝ²}, x ∈ A → x ∈ S.CP.C3 → x ≠ q1 → x ≠ q2 →
        (T x) 1 < 0 := by
      intro x hxA hxC3 hx_ne_v1 hx_ne_v2
      have hx_arc : signedArea2 x q1 q2 * signedArea2 q3 q1 q2 ≤ 0 :=
        (S.CP.arc_membership x hxA).2.2.1 hxC3
      have hx_base_ne : signedArea2 x q1 q2 ≠ 0 := by
        intro hz
        have hcol : Collinear ℝ ({x, q1, q2} : Set ℝ²) :=
          (Problem97.signedArea2_eq_zero_iff_collinear x q1 q2).1 hz
        exact False.elim <|
          S.hconv.not_three_collinear hxA S.triangle.v1_mem S.triangle.v2_mem
            hx_ne_v1 hx_ne_v2 S.triangle.v12_ne hcol
      have himg_nonpos :
          signedArea2 (T0 x) (T0 q1) (T0 q2) * signedArea2 (T0 q3) (T0 q1) (T0 q2) ≤ 0 := by
        rw [tau0.halfplane_sign x q1 q2, tau0.halfplane_sign q3 q1 q2]
        have hrew :
            (tau0.orientation * (tau0.scale ^ 2) * signedArea2 x q1 q2) *
                (tau0.orientation * (tau0.scale ^ 2) * signedArea2 q3 q1 q2) =
              (tau0.orientation ^ 2) * (tau0.scale ^ 2 * tau0.scale ^ 2) *
                (signedArea2 x q1 q2 * signedArea2 q3 q1 q2) := by ring
        rw [hrew, tau0.orientation_sq]
        have hscale_nonneg : 0 ≤ tau0.scale ^ 2 * tau0.scale ^ 2 := by positivity
        simpa using mul_nonpos_of_nonneg_of_nonpos hscale_nonneg hx_arc
      have hx_img_lt : signedArea2 (T0 x) (T0 q1) (T0 q2) < 0 := by
        have hx_img_le : signedArea2 (T0 x) (T0 q1) (T0 q2) ≤ 0 := by
          by_contra hx_pos
          have : 0 < signedArea2 (T0 x) (T0 q1) (T0 q2) *
              signedArea2 (T0 q3) (T0 q1) (T0 q2) := mul_pos (by linarith) hq3_img_pos
          linarith
        have hx_img_ne : signedArea2 (T0 x) (T0 q1) (T0 q2) ≠ 0 := by
          rw [tau0.halfplane_sign x q1 q2]
          have horient_ne : tau0.orientation ≠ 0 := by
            intro h0
            have : (0 : ℝ) ^ 2 = 1 := by simpa [h0] using tau0.orientation_sq
            norm_num at this
          exact mul_ne_zero
            (mul_ne_zero horient_ne (pow_ne_zero 2 (ne_of_gt tau0.scale_pos))) hx_base_ne
        exact lt_of_le_of_ne hx_img_le hx_img_ne
      rw [hv1, hv2, signedArea2_baseChord_vec2] at hx_img_lt
      dsimp [T]
      simp only [halfShift, Problem97.CGN.vec2, EuclideanSpace.single_apply]
      have : (T0 x) 1 / 2 < 0 := by linarith
      simpa using this
    have hqy_T : (T q) 1 < 0 := hbelow hxAq hqC3 hq_ne_v1 hq_ne_v2
    have hqsy_T : (T qs) 1 < 0 := hbelow hxAqs hqsC3 hqs_ne_v1 hqs_ne_v2
    -- `E` above `AB`: `(T E)₁ > 0`, from `hEside` (same side as `v₃`).
    have hE_base_ne : signedArea2 E q1 q2 ≠ 0 := by
      intro hz; rw [hz, zero_mul] at hEside; exact lt_irrefl _ hEside
    have hEy_T : 0 < (T E) 1 := by
      have hE_img_prod :
          0 < signedArea2 (T0 E) (T0 q1) (T0 q2) * signedArea2 (T0 q3) (T0 q1) (T0 q2) := by
        rw [tau0.halfplane_sign E q1 q2, tau0.halfplane_sign q3 q1 q2]
        have hrew :
            (tau0.orientation * (tau0.scale ^ 2) * signedArea2 E q1 q2) *
                (tau0.orientation * (tau0.scale ^ 2) * signedArea2 q3 q1 q2) =
              (tau0.orientation ^ 2) * (tau0.scale ^ 2 * tau0.scale ^ 2) *
                (signedArea2 E q1 q2 * signedArea2 q3 q1 q2) := by ring
        rw [hrew, tau0.orientation_sq]
        have hscale_pos : 0 < tau0.scale ^ 2 * tau0.scale ^ 2 := by
          have := tau0.scale_pos; positivity
        have hprod : 0 < signedArea2 E q1 q2 * signedArea2 q3 q1 q2 := by
          simpa [q1, q2, q3] using hEside
        have : 0 < tau0.scale ^ 2 * tau0.scale ^ 2 *
            (signedArea2 E q1 q2 * signedArea2 q3 q1 q2) := mul_pos hscale_pos hprod
        linarith [this]
      have hE_img_pos : 0 < signedArea2 (T0 E) (T0 q1) (T0 q2) := by
        by_contra hle
        push_neg at hle
        have : signedArea2 (T0 E) (T0 q1) (T0 q2) *
            signedArea2 (T0 q3) (T0 q1) (T0 q2) ≤ 0 :=
          mul_nonpos_of_nonpos_of_nonneg hle (le_of_lt hq3_img_pos)
        linarith
      rw [hv1, hv2, signedArea2_baseChord_vec2] at hE_img_pos
      dsimp [T]
      simp only [halfShift, Problem97.CGN.vec2, EuclideanSpace.single_apply]
      have : (0 : ℝ) < (T0 E) 1 / 2 := by linarith
      simpa using this
    -- Transported radius `r := |v₂v₃| = |Bq| = |BE|`.
    have hv3_ne_v2 : q3 ≠ q2 := by simpa [q2, q3] using S.triangle.v23_ne.symm
    set r : ℝ := dist (T q2) (T q3) with hr_def
    have hd_BD : 0 < dist q2 q3 := by rw [dist_pos]; exact fun h => hv3_ne_v2 h.symm
    have hr_pos : 0 < r := by
      rw [hr_def, tau.dist_image]; exact mul_pos tau.scale_pos hd_BD
    have hBD_T : dist (T q2) (T q3) = r := hr_def.symm
    have hBq_T : dist (T q2) (T q) = r := by
      rw [hr_def, tau.dist_image, tau.dist_image]
      have : dist q2 q = dist q2 q3 := by
        have := hBq; simp only [q2, q3] at this ⊢; rw [this]
      rw [this]
    have hBE_T : dist (T q2) (T E) = r := by
      rw [hr_def, tau.dist_image, tau.dist_image]
      have : dist q2 E = dist q2 q3 := by
        have := hBE; simp only [q2, q3] at this ⊢; rw [this]
      rw [this]
    -- `|DE| = |Dq|` transported (the chord/radical condition).
    have hDE_T : dist (T q3) (T E) = dist (T q3) (T q) := by
      rw [tau.dist_image, tau.dist_image]
      have : dist q3 E = dist q3 q := by
        have := hDE; simp only [q3] at this ⊢; rw [this]
      rw [this]
    -- `|Dqs| = |Dq|` transported (both lower vertices on Γ).
    have hDqs_T : dist (T q3) (T qs) = dist (T q3) (T q) := by
      rw [tau.dist_image, tau.dist_image]
      have : dist q3 qs = dist q3 q := by
        have := hDqs; simp only [q3] at this ⊢; rw [this]
      rw [this]
    -- Coordinate abbreviations on the radius-`r` circle about `(1,0)`.
    set cδ : ℝ := ((T q3) 0 - 1) / r with hcδ_def
    set sδ : ℝ := (T q3) 1 / r with hsδ_def
    set cε : ℝ := ((T E) 0 - 1) / r with hcε_def
    set sε : ℝ := (T E) 1 / r with hsε_def
    set cη : ℝ := ((T q) 0 - 1) / r with hcη_def
    set sη : ℝ := (T q) 1 / r with hsη_def
    have hrne : r ≠ 0 := ne_of_gt hr_pos
    -- Pythagorean identities from the three circle facts.
    have hδpyth : cδ ^ 2 + sδ ^ 2 = 1 :=
      circle_pyth (T q3) (T q2) r hrne hv2c0 hv2c1 hBD_T
    have hεpyth : cε ^ 2 + sε ^ 2 = 1 :=
      circle_pyth (T E) (T q2) r hrne hv2c0 hv2c1 hBE_T
    have hηpyth : cη ^ 2 + sη ^ 2 = 1 :=
      circle_pyth (T q) (T q2) r hrne hv2c0 hv2c1 hBq_T
    -- `sδ > 0`, `sε > 0` (above), `sη < 0` (below).
    have hsδ_pos : 0 < sδ := by rw [hsδ_def]; positivity
    have hsε_pos : 0 < sε := by rw [hsε_def]; exact div_pos hEy_T hr_pos
    have hsη_neg : sη < 0 := by rw [hsη_def]; exact div_neg_of_neg_of_pos hqy_T hr_pos
    -- Coordinate values on the radius-`r` circle about `(1,0)`.
    have hTD0 : (T q3) 0 = 1 + r * cδ := by rw [hcδ_def]; field_simp; ring
    have hTD1 : (T q3) 1 = r * sδ := by rw [hsδ_def]; field_simp
    have hTE0 : (T E) 0 = 1 + r * cε := by rw [hcε_def]; field_simp; ring
    have hTE1 : (T E) 1 = r * sε := by rw [hsε_def]; field_simp
    have hTq0 : (T q) 0 = 1 + r * cη := by rw [hcη_def]; field_simp; ring
    have hTq1 : (T q) 1 = r * sη := by rw [hsη_def]; field_simp
    -- The radical (chord) condition `cη·cδ + sη·sδ = cε·cδ + sε·sδ` from `|Dq| = |DE|`.
    have hradical : cη * cδ + sη * sδ = cε * cδ + sε * sδ := by
      have hsqeq : dist (T q3) (T E) ^ 2 = dist (T q3) (T q) ^ 2 := by rw [hDE_T]
      rw [dist_sq_eq_coord_sq_add_coord_sq, dist_sq_eq_coord_sq_add_coord_sq] at hsqeq
      rw [hTD0, hTD1, hTE0, hTE1, hTq0, hTq1] at hsqeq
      have hkey : (cε * cδ + sε * sδ) * r ^ 2 = (cη * cδ + sη * sδ) * r ^ 2 := by
        nlinarith [hsqeq, hδpyth]
      have hr2pos : (0 : ℝ) < r ^ 2 := by positivity
      exact (mul_right_cancel₀ (ne_of_gt hr2pos) hkey).symm
    -- `q ≠ E` gives `(cη, sη) ≠ (cε, sε)`.
    have hne : ¬ (cη = cε ∧ sη = sε) := by
      rintro ⟨hc, hs⟩
      apply hqE
      have h0 : (T q) 0 = (T E) 0 := by rw [hTq0, hTE0, hc]
      have h1 : (T q) 1 = (T E) 1 := by rw [hTq1, hTE1, hs]
      have hTqE : T q = T E := by ext i; fin_cases i
                                  · exact h0
                                  · exact h1
      have hd0 : dist (T q) (T E) = 0 := by rw [hTqE]; simp
      rw [tau.dist_image] at hd0
      have hdqE : dist q E = 0 := by
        rcases mul_eq_zero.mp hd0 with h | h
        · exact absurd h (ne_of_gt tau.scale_pos)
        · exact h
      exact dist_eq_zero.mp hdqE
    -- Recover genuine angles `ε`, `δ` and the reflection identity `η = 2δ − ε`.
    obtain ⟨ε, δ, hcosε, hsinε, _hε0, _hεπ, hcosδ, hsinδ, _hδ0, _hδπ, hcη_eq, hsη_eq⟩ :=
      qEqE_reflection_coords r cε sε cδ sδ cη sη hsε_pos hεpyth hsδ_pos hδpyth hηpyth
        hsη_neg hradical hne
    -- Sign-pins in trig form.
    have hsd : 0 < Real.sin δ := by rw [hsinδ]; exact hsδ_pos
    have hse : 0 < Real.sin ε := by rw [hsinε]; exact hsε_pos
    -- Trig-form coordinate values for `v₃` (needed for hDqsdist and hDEdist).
    have hTD0' : (T q3) 0 = 1 + r * Real.cos δ := by rw [hTD0, ← hcosδ]
    have hTD1' : (T q3) 1 = r * Real.sin δ := by rw [hTD1, ← hsinδ]
    -- `cos δ > -r/2` from `|AD| > 1` (the long-side fact).
    have hAB1 : dist (T q1) (T q2) = 1 := by
      rw [hv1T, hv2T, dist_eq_norm]
      have hvec :
          Problem97.CGN.vec2 0 0 - Problem97.CGN.vec2 1 0 = Problem97.CGN.vec2 (-1) 0 := by
        ext i <;> fin_cases i <;>
          simp [Problem97.CGN.vec2, EuclideanSpace.single_apply]
      rw [hvec, EuclideanSpace.norm_eq]
      norm_num [Problem97.CGN.vec2, EuclideanSpace.single_apply]
    have hcd : -(r / 2) < Real.cos δ := by
      rw [hcosδ, hcδ_def]
      have hAD : 1 < dist (T q1) (T q3) := by
        rw [tau.dist_image]
        have hsc : dist (T q1) (T q2) = tau.scale * dist q1 q2 := tau.dist_image q1 q2
        rw [hAB1] at hsc
        have hlong' : dist q1 q2 < dist q1 q3 := by simpa [q1, q2, q3] using hlong
        nlinarith [hsc, hlong', tau.scale_pos, dist_nonneg (x := q1) (y := q2)]
      have hADsq : 1 < (T q3) 0 ^ 2 + (T q3) 1 ^ 2 :=
        normsq_gt_of_origin_dist_gt (T q3) (T q1) hv1c0 hv1c1 hAD
      exact sign_pin_lower_bound r _ _ hr_pos (by rwa [← hcδ_def, ← hsδ_def]) hADsq
    -- `cos ε < -r/2` from `|AE| < 1`.
    have hce : Real.cos ε < -(r / 2) := by
      rw [hcosε, hcε_def]
      have hAE : dist (T q1) (T E) < 1 := by
        rw [tau.dist_image]
        have hsc : dist (T q1) (T q2) = tau.scale * dist q1 q2 := tau.dist_image q1 q2
        rw [hAB1] at hsc
        have hAElt' : dist q1 E < dist q1 q2 := by simpa [q1, q2] using hAElt
        nlinarith [hsc, hAElt', tau.scale_pos, dist_nonneg (x := q1) (y := q2)]
      have hAEsq : (T E) 0 ^ 2 + (T E) 1 ^ 2 < 1 :=
        normsq_lt_of_origin_dist_lt (T E) (T q1) hv1c0 hv1c1 hAE
      exact sign_pin_upper_bound r _ _ hr_pos (by rwa [← hcε_def, ← hsε_def]) hAEsq
    -- `cos η < -r/2` from `|Aq| < 1` (cap order for `q ∈ I₃`), i.e. `cos(2δ-ε) < -r/2`.
    have hc2de : Real.cos (2 * δ - ε) < -(r / 2) := by
      rw [← hcη_eq, hcη_def]
      have hAq : dist (T q1) (T q) < 1 := by
        rw [tau.dist_image]
        have hsc : dist (T q1) (T q2) = tau.scale * dist q1 q2 := tau.dist_image q1 q2
        rw [hAB1] at hsc
        have hAqlt' : dist q1 q < dist q1 q2 := by
          simpa [q1, q2] using S.v1_lt_v1v2_of_mem_I3 hqI3
        nlinarith [hsc, hAqlt', tau.scale_pos, dist_nonneg (x := q1) (y := q2)]
      have hAqsq : (T q) 0 ^ 2 + (T q) 1 ^ 2 < 1 :=
        normsq_lt_of_origin_dist_lt (T q) (T q1) hv1c0 hv1c1 hAq
      exact sign_pin_upper_bound r _ _ hr_pos (by rwa [← hcη_def, ← hsη_def]) hAqsq
    -- `sin(2δ-ε) < 0` from `q` below `AB`.
    have hs2de : Real.sin (2 * δ - ε) < 0 := by rw [← hsη_eq]; exact hsη_neg
    -- The radial parameter `S = |Dq|/r`, with `S > 0` and `S² = 2 − 2cos(δ−ε)`.
    have hDq_T_eq : dist (T q3) (T q) = r * Real.sqrt (2 - 2 * Real.cos (δ - ε)) := by
      have hDEdist : dist (T q3) (T E) ^ 2 = r ^ 2 * (2 - 2 * Real.cos (δ - ε)) := by
        rw [dist_sq_eq_coord_sq_add_coord_sq, hTD0', hTD1', hTE0, hTE1, ← hcosε, ← hsinε,
            chord_sq_formula r hr_pos δ ε]
        field_simp
      rw [hDE_T] at hDEdist
      exact dist_eq_r_sqrt_of_sq _ r hr_pos δ ε dist_nonneg hDEdist
    set Sr : ℝ := Real.sqrt (2 - 2 * Real.cos (δ - ε)) with hSr_def
    have hS2eq : Sr ^ 2 = 2 - 2 * Real.cos (δ - ε) := by
      rw [hSr_def, Real.sq_sqrt]; nlinarith [Real.cos_le_one (δ - ε)]
    -- `q ≠ v₃` since `q ∈ C₃` but `v₃ ∉ C₃` (opposite apex), so `|Dq| > 0`.
    have hq_ne_v3 : q ≠ q3 := by
      intro h; exact S.CP.v3_notin_C3 (by simpa [q3, h] using hqC3)
    have hSr_pos : 0 < Sr := by
      have hDq_pos : 0 < dist (T q3) (T q) := by
        rw [tau.dist_image]; apply mul_pos tau.scale_pos
        rw [dist_pos]; exact fun h => hq_ne_v3 h.symm
      show 0 < Real.sqrt (2 - 2 * Real.cos (δ - ε))
      have hh : Real.sqrt (2 - 2 * Real.cos (δ - ε)) = dist (T q3) (T q) / r := by
        rw [hDq_T_eq, mul_div_cancel_left₀ _ (ne_of_gt hr_pos)]
      rw [hh]; exact div_pos hDq_pos hr_pos
    -- Parametrize `qs` on `Γ` (radius `r·Sr` about `D`).
    have hDqsdist :
        ((T qs) 0 - (1 + r * Real.cos δ)) ^ 2 + ((T qs) 1 - r * Real.sin δ) ^ 2
          = (r * Sr) ^ 2 := by
      have h_coord : dist (T q3) (T qs) ^ 2 =
          ((T qs) 0 - (1 + r * Real.cos δ)) ^ 2 + ((T qs) 1 - r * Real.sin δ) ^ 2 := by
        rw [dist_sq_eq_coord_sq_add_coord_sq, hTD0', hTD1']; ring
      rw [← h_coord, hDqs_T, hDq_T_eq]
    obtain ⟨t, hqsx, hqsy⟩ :=
      qEqE_param_t r Sr (Real.cos δ) (Real.sin δ) ((T qs) 0) ((T qs) 1) hr_pos hSr_pos
        hDqsdist
    -- `hlower : r sinδ + r Sr sin t < 0` from `qs` below `AB`.
    have hlower : r * Real.sin δ + r * Sr * Real.sin t < 0 := by
      rw [← hqsy]; exact hqsy_T
    -- `r < 1`: the selector radius `|v₂v₃| < |v₁v₂| = 1`.
    have hr_lt_one : r < 1 := by
      have hBD : dist (T q2) (T q3) < dist (T q1) (T q2) := by
        rw [tau.dist_image, tau.dist_image]
        have hsc : 0 < tau.scale := tau.scale_pos
        have hlt : dist q2 q3 < dist q1 q2 := by simpa [q1, q2, q3] using hsmall
        nlinarith [hlt, hsc, dist_nonneg (x := q1) (y := q2)]
      rw [hBD_T, hAB1] at hBD; exact hBD
    -- Apply (B): the same-sign block in the Phase-0 closed forms.
    have hB := qEqE_lowerArc_sameSign r δ ε t Sr hr_pos hr_lt_one
      hSr_pos hS2eq hsd hcd hse hce hs2de hc2de hlower
    -- Rewrite the two sinusoid RHS back to the literal coordinate functionals
    -- via the Phase-0 sinusoid lemmas.
    rw [← qEqE_f1_sinusoid r δ ε t Sr hS2eq, ← qEqE_f2_sinusoid r δ ε t Sr] at hB
    -- Parametrized coordinate values.
    have hqsx' : (T qs) 0 = (1 + r * Real.cos δ) + r * Sr * Real.cos t := by
      rw [hqsx]
    have hqsy' : (T qs) 1 = r * Real.sin δ + r * Sr * Real.sin t := hqsy
    have hTq0' : (T q) 0 = 1 + r * Real.cos (2 * δ - ε) := by rw [hTq0, hcη_eq]
    have hTq1' : (T q) 1 = r * Real.sin (2 * δ - ε) := by rw [hTq1, hsη_eq]
    -- Γ equality in parametrized coordinate form (needed by both bridges).
    have hGparam :
        (((1 + r * Real.cos δ) + r * Sr * Real.cos t) - (1 + r * Real.cos δ)) ^ 2
            + ((r * Real.sin δ + r * Sr * Real.sin t) - r * Real.sin δ) ^ 2
          = ((1 + r * Real.cos (2 * δ - ε)) - (1 + r * Real.cos δ)) ^ 2
            + (r * Real.sin (2 * δ - ε) - r * Real.sin δ) ^ 2 := by
      have hsq : dist (T q3) (T qs) ^ 2 = dist (T q3) (T q) ^ 2 := by rw [hDqs_T]
      rw [dist_sq_eq_coord_sq_add_coord_sq, dist_sq_eq_coord_sq_add_coord_sq,
        hTD0', hTD1', hqsx', hqsy', hTq0', hTq1'] at hsq
      linarith [hsq]
    -- v₂-functional = (|TB,Tqs|² − |TB,Tq|²)/2 and v₁-functional likewise.
    have hbridge2 :
        (((1 + r * Real.cos δ) + r * Sr * Real.cos t) - (1 + r * Real.cos (2 * δ - ε)))
              * ((1 + r * Real.cos δ) - 1)
            + (((r * Real.sin δ) + r * Sr * Real.sin t) - r * Real.sin (2 * δ - ε))
              * ((r * Real.sin δ) - 0)
          = (dist (T q2) (T qs) ^ 2 - dist (T q2) (T q) ^ 2) / 2 := by
      rw [dist_sq_eq_coord_sq_add_coord_sq, dist_sq_eq_coord_sq_add_coord_sq,
        hv2c0, hv2c1, hqsx', hqsy', hTq0', hTq1']
      linear_combination (-(1 : ℝ) / 2) * hGparam
    have hbridge1 :
        (((1 + r * Real.cos δ) + r * Sr * Real.cos t) - (1 + r * Real.cos (2 * δ - ε)))
              * (1 + r * Real.cos δ)
            + (((r * Real.sin δ) + r * Sr * Real.sin t) - r * Real.sin (2 * δ - ε))
              * (r * Real.sin δ)
          = (dist (T q1) (T qs) ^ 2 - dist (T q1) (T q) ^ 2) / 2 := by
      rw [dist_sq_eq_coord_sq_add_coord_sq, dist_sq_eq_coord_sq_add_coord_sq,
        hv1c0, hv1c1, hqsx', hqsy', hTq0', hTq1']
      linear_combination (-(1 : ℝ) / 2) * hGparam
    rw [hbridge2, hbridge1] at hB
    -- `hB : 0 ≤ (|TB,Tqs|²−|TB,Tq|²)/2 · (|TA,Tqs|²−|TA,Tq|²)/2`.
    -- Transport distances back via `dist_image` (`|T·,·| = scale·|·,·|`).
    have hsc_pos : 0 < tau.scale := tau.scale_pos
    have hTB2qs : dist (T q2) (T qs) ^ 2 = tau.scale ^ 2 * dist q2 qs ^ 2 := by
      rw [tau.dist_image]; ring
    have hTB2q : dist (T q2) (T q) ^ 2 = tau.scale ^ 2 * dist q2 q ^ 2 := by
      rw [tau.dist_image]; ring
    have hTA2qs : dist (T q1) (T qs) ^ 2 = tau.scale ^ 2 * dist q1 qs ^ 2 := by
      rw [tau.dist_image]; ring
    have hTA2q : dist (T q1) (T q) ^ 2 = tau.scale ^ 2 * dist q1 q ^ 2 := by
      rw [tau.dist_image]; ring
    rw [hTB2qs, hTB2q, hTA2qs, hTA2q] at hB
    -- Factor out `scale⁴/4 > 0` to get the shell-level same-sign inequality.
    have hsc4 : 0 < tau.scale ^ 2 * tau.scale ^ 2 / 4 := by positivity
    have hfac :
        (tau.scale ^ 2 * dist q2 qs ^ 2 - tau.scale ^ 2 * dist q2 q ^ 2) / 2
            * ((tau.scale ^ 2 * dist q1 qs ^ 2 - tau.scale ^ 2 * dist q1 q ^ 2) / 2)
          = (dist q2 qs ^ 2 - dist q2 q ^ 2) * (dist q1 qs ^ 2 - dist q1 q ^ 2)
            * (tau.scale ^ 2 * tau.scale ^ 2 / 4) := by
      ring
    rw [hfac] at hB
    have hgoal :
        0 ≤ (dist q2 qs ^ 2 - dist q2 q ^ 2) * (dist q1 qs ^ 2 - dist q1 q ^ 2) :=
      nonneg_of_mul_nonneg_left hB hsc4
    simpa [q1, q2] using hgoal
  -- Orient so that `(T q3) 1 > 0`, flipping if necessary.
  by_cases hq3pos : 0 < (Tbase q3) 1
  · exact build_from tauBase hv1Base hv2Base hq3pos
  · let Tflip : ℝ² → ℝ² := fun x => flipY (Tbase x)
    let tauFlip : Problem97.CGN.SimilarityTransportData Tflip :=
      similarityTransportComp tauBase flipYSimilarityTransportData
    have hv1Flip : Tflip q1 = Problem97.CGN.vec2 (-1) 0 := by
      dsimp [Tflip]; rw [hv1Base]
      ext i <;> fin_cases i <;>
        simp [flipY, Problem97.CGN.vec2, EuclideanSpace.single_apply]
    have hv2Flip : Tflip q2 = Problem97.CGN.vec2 1 0 := by
      dsimp [Tflip]; rw [hv2Base]
      ext i <;> fin_cases i <;>
        simp [flipY, Problem97.CGN.vec2, EuclideanSpace.single_apply]
    have hq3Flip : 0 < (Tflip q3) 1 := by
      dsimp [Tflip]
      simp only [flipY, Problem97.CGN.vec2, EuclideanSpace.single_apply]
      have hq3neg : (Tbase q3) 1 < 0 := by
        have hle : (Tbase q3) 1 ≤ 0 := le_of_not_gt hq3pos
        exact lt_of_le_of_ne hle hq3_base_nonzero
      simpa using hq3neg
    exact build_from tauFlip hv1Flip hv2Flip hq3Flip

set_option maxHeartbeats 8000000 in
/-- Flipped-pin shell-level same-sign producer for the `q'=E` column.  This is
the variant of `qEqE_lowerArc_sameSign_of_shell` used when the `v₁`-distance of
`E` lies on the opposite side of `|v₁v₂|`, so the normalized pin becomes
`-(r/2) < cos ε` instead of `cos ε < -(r/2)`. -/
theorem qEqE_lowerArc_sameSign_of_shell_flipped
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    {q qs E : ℝ²}
    (hqI3 : q ∈ S.I3) (hqsI3 : qs ∈ S.I3)
    (hDqs : dist S.triangle.v3 qs = dist S.triangle.v3 q)
    (hBq : dist S.triangle.v2 q = dist S.triangle.v2 S.triangle.v3)
    (hBE : dist S.triangle.v2 E = dist S.triangle.v2 S.triangle.v3)
    (hDE : dist S.triangle.v3 E = dist S.triangle.v3 q)
    (hsmall : dist S.triangle.v2 S.triangle.v3 < dist S.triangle.v1 S.triangle.v2)
    (hlong : dist S.triangle.v1 S.triangle.v2 < dist S.triangle.v1 S.triangle.v3)
    (hAEgt : dist S.triangle.v1 S.triangle.v2 < dist S.triangle.v1 E)
    (hEC2 : E ∈ S.CP.C2)
    (hEside :
      0 < signedArea2 E S.triangle.v1 S.triangle.v2 *
        signedArea2 S.triangle.v3 S.triangle.v1 S.triangle.v2)
    (hqE : q ≠ E) :
    0 ≤ (dist S.triangle.v2 qs ^ 2 - dist S.triangle.v2 q ^ 2)
        * (dist S.triangle.v1 qs ^ 2 - dist S.triangle.v1 q ^ 2) := by
  classical
  let q1 : ℝ² := S.triangle.v1
  let q2 : ℝ² := S.triangle.v2
  let q3 : ℝ² := S.triangle.v3
  -- Base transport `v₁ ↦ (-1,0)`, `v₂ ↦ (1,0)`.
  have hq1ne : q1 ≠ q2 := by simpa [q1, q2] using S.triangle.v12_ne
  rcases exists_base_transportData q1 q2 hq1ne with
    ⟨Tbase, tauBase, hv1Base, hv2Base⟩
  have horientBase_ne : tauBase.orientation ≠ 0 := by
    intro h0
    have : (0 : ℝ) ^ 2 = 1 := by simpa [h0] using tauBase.orientation_sq
    norm_num at this
  have hq3_base_nonzero : (Tbase q3) 1 ≠ 0 := by
    have hq3_sa_ne : signedArea2 q3 q1 q2 ≠ 0 := by
      have hv1O : ‖q1 - S.Packet.center‖ = S.Packet.radius := by
        simpa [q1] using S.Packet.moser_on_boundary_1
      have hv2O : ‖q2 - S.Packet.center‖ = S.Packet.radius := by
        simpa [q2] using S.Packet.moser_on_boundary_2
      have hv3O : ‖q3 - S.Packet.center‖ = S.Packet.radius := by
        simpa [q3] using S.Packet.moser_on_boundary_3
      exact MEC.signedArea2_ne_zero_of_three_dist_eq
        hv3O hv1O hv2O
        S.triangle.v13_ne.symm S.triangle.v12_ne S.triangle.v23_ne.symm
    have himg_ne : signedArea2 (Tbase q3) (Tbase q1) (Tbase q2) ≠ 0 := by
      rw [tauBase.halfplane_sign q3 q1 q2]
      exact mul_ne_zero
        (mul_ne_zero horientBase_ne (pow_ne_zero 2 (ne_of_gt tauBase.scale_pos)))
        hq3_sa_ne
    intro h0
    apply himg_ne
    rw [hv1Base, hv2Base, signedArea2_baseChord_vec2]
    linarith
  -- Reusable construction from any base transport with `v₃` above the chord.
  have build_from :
      ∀ {T0 : ℝ² → ℝ²},
        (tau0 : Problem97.CGN.SimilarityTransportData T0) →
        T0 q1 = Problem97.CGN.vec2 (-1) 0 →
        T0 q2 = Problem97.CGN.vec2 1 0 →
        0 < (T0 q3) 1 →
        0 ≤ (dist S.triangle.v2 qs ^ 2 - dist S.triangle.v2 q ^ 2)
            * (dist S.triangle.v1 qs ^ 2 - dist S.triangle.v1 q ^ 2) := by
    intro T0 tau0 hv1 hv2 hq3y_pos
    -- Postcompose by the fixed half-shift: `v₁ ↦ (0,0)`, `v₂ ↦ (1,0)`.
    let T : ℝ² → ℝ² := fun x => halfShift (T0 x)
    let tau : Problem97.CGN.SimilarityTransportData T :=
      similarityTransportComp tau0 halfShiftSimilarityTransportData
    have hv1T : T q1 = Problem97.CGN.vec2 0 0 := by
      dsimp [T]; rw [hv1]
      ext i <;> fin_cases i <;>
        simp [halfShift, Problem97.CGN.vec2, EuclideanSpace.single_apply]
    have hv2T : T q2 = Problem97.CGN.vec2 1 0 := by
      dsimp [T]; rw [hv2]
      ext i <;> fin_cases i <;>
        simp [halfShift, Problem97.CGN.vec2, EuclideanSpace.single_apply]
    have hq3y_T : 0 < (T q3) 1 := by
      dsimp [T]
      simp only [halfShift, Problem97.CGN.vec2, EuclideanSpace.single_apply]
      have : (0 : ℝ) < (T0 q3) 1 / 2 := by linarith
      simpa using this
    -- Coordinate values of the base endpoints.
    have hv2c0 : (T q2) 0 = 1 := by rw [hv2T]; simp [Problem97.CGN.vec2]
    have hv2c1 : (T q2) 1 = 0 := by rw [hv2T]; simp [Problem97.CGN.vec2]
    have hv1c0 : (T q1) 0 = 0 := by rw [hv1T]; simp [Problem97.CGN.vec2]
    have hv1c1 : (T q1) 1 = 0 := by rw [hv1T]; simp [Problem97.CGN.vec2]
    -- Shell membership facts for `q`, `qs`.
    have hxAq : q ∈ A := S.CP.C3_subset (by
      unfold Problem97.FiniteEndpointShell.I3 at hqI3
      exact Finset.mem_of_mem_erase (Finset.mem_of_mem_erase hqI3))
    have hqC3 : q ∈ S.CP.C3 := by
      unfold Problem97.FiniteEndpointShell.I3 at hqI3
      exact Finset.mem_of_mem_erase (Finset.mem_of_mem_erase hqI3)
    have hq_ne_v1 : q ≠ q1 := by
      unfold Problem97.FiniteEndpointShell.I3 at hqI3
      exact (Finset.mem_erase.mp (Finset.mem_erase.mp hqI3).2).1
    have hq_ne_v2 : q ≠ q2 := by
      unfold Problem97.FiniteEndpointShell.I3 at hqI3
      exact (Finset.mem_erase.mp hqI3).1
    have hxAqs : qs ∈ A := S.CP.C3_subset (by
      unfold Problem97.FiniteEndpointShell.I3 at hqsI3
      exact Finset.mem_of_mem_erase (Finset.mem_of_mem_erase hqsI3))
    have hqsC3 : qs ∈ S.CP.C3 := by
      unfold Problem97.FiniteEndpointShell.I3 at hqsI3
      exact Finset.mem_of_mem_erase (Finset.mem_of_mem_erase hqsI3)
    have hqs_ne_v1 : qs ≠ q1 := by
      unfold Problem97.FiniteEndpointShell.I3 at hqsI3
      exact (Finset.mem_erase.mp (Finset.mem_erase.mp hqsI3).2).1
    have hqs_ne_v2 : qs ≠ q2 := by
      unfold Problem97.FiniteEndpointShell.I3 at hqsI3
      exact (Finset.mem_erase.mp hqsI3).1
    have hq3_base_ne : signedArea2 q3 q1 q2 ≠ 0 := by
      have hv1O : dist q3 S.Packet.center = S.Packet.radius := by
        simpa [q3, dist_eq_norm] using S.Packet.moser_on_boundary_3
      have hv2O : dist q1 S.Packet.center = S.Packet.radius := by
        simpa [q1, dist_eq_norm] using S.Packet.moser_on_boundary_1
      have hv3O : dist q2 S.Packet.center = S.Packet.radius := by
        simpa [q2, dist_eq_norm] using S.Packet.moser_on_boundary_2
      exact MEC.signedArea2_ne_zero_of_three_dist_eq
        hv1O hv2O hv3O
        S.triangle.v13_ne.symm S.triangle.v12_ne S.triangle.v23_ne.symm
    have hq3_img_pos : 0 < signedArea2 (T0 q3) (T0 q1) (T0 q2) := by
      rw [hv1, hv2, signedArea2_baseChord_vec2]; linarith
    -- `q` below `AB`: `(T x)₁ < 0`.
    have hbelow : ∀ {x : ℝ²}, x ∈ A → x ∈ S.CP.C3 → x ≠ q1 → x ≠ q2 →
        (T x) 1 < 0 := by
      intro x hxA hxC3 hx_ne_v1 hx_ne_v2
      have hx_arc : signedArea2 x q1 q2 * signedArea2 q3 q1 q2 ≤ 0 :=
        (S.CP.arc_membership x hxA).2.2.1 hxC3
      have hx_base_ne : signedArea2 x q1 q2 ≠ 0 := by
        intro hz
        have hcol : Collinear ℝ ({x, q1, q2} : Set ℝ²) :=
          (Problem97.signedArea2_eq_zero_iff_collinear x q1 q2).1 hz
        exact False.elim <|
          S.hconv.not_three_collinear hxA S.triangle.v1_mem S.triangle.v2_mem
            hx_ne_v1 hx_ne_v2 S.triangle.v12_ne hcol
      have himg_nonpos :
          signedArea2 (T0 x) (T0 q1) (T0 q2) * signedArea2 (T0 q3) (T0 q1) (T0 q2) ≤ 0 := by
        rw [tau0.halfplane_sign x q1 q2, tau0.halfplane_sign q3 q1 q2]
        have hrew :
            (tau0.orientation * (tau0.scale ^ 2) * signedArea2 x q1 q2) *
                (tau0.orientation * (tau0.scale ^ 2) * signedArea2 q3 q1 q2) =
              (tau0.orientation ^ 2) * (tau0.scale ^ 2 * tau0.scale ^ 2) *
                (signedArea2 x q1 q2 * signedArea2 q3 q1 q2) := by ring
        rw [hrew, tau0.orientation_sq]
        have hscale_nonneg : 0 ≤ tau0.scale ^ 2 * tau0.scale ^ 2 := by positivity
        simpa using mul_nonpos_of_nonneg_of_nonpos hscale_nonneg hx_arc
      have hx_img_lt : signedArea2 (T0 x) (T0 q1) (T0 q2) < 0 := by
        have hx_img_le : signedArea2 (T0 x) (T0 q1) (T0 q2) ≤ 0 := by
          by_contra hx_pos
          have : 0 < signedArea2 (T0 x) (T0 q1) (T0 q2) *
              signedArea2 (T0 q3) (T0 q1) (T0 q2) := mul_pos (by linarith) hq3_img_pos
          linarith
        have hx_img_ne : signedArea2 (T0 x) (T0 q1) (T0 q2) ≠ 0 := by
          rw [tau0.halfplane_sign x q1 q2]
          have horient_ne : tau0.orientation ≠ 0 := by
            intro h0
            have : (0 : ℝ) ^ 2 = 1 := by simpa [h0] using tau0.orientation_sq
            norm_num at this
          exact mul_ne_zero
            (mul_ne_zero horient_ne (pow_ne_zero 2 (ne_of_gt tau0.scale_pos))) hx_base_ne
        exact lt_of_le_of_ne hx_img_le hx_img_ne
      rw [hv1, hv2, signedArea2_baseChord_vec2] at hx_img_lt
      dsimp [T]
      simp only [halfShift, Problem97.CGN.vec2, EuclideanSpace.single_apply]
      have : (T0 x) 1 / 2 < 0 := by linarith
      simpa using this
    have hqy_T : (T q) 1 < 0 := hbelow hxAq hqC3 hq_ne_v1 hq_ne_v2
    have hqsy_T : (T qs) 1 < 0 := hbelow hxAqs hqsC3 hqs_ne_v1 hqs_ne_v2
    -- `E` above `AB`: `(T E)₁ > 0`, from `hEside` (same side as `v₃`).
    have hE_base_ne : signedArea2 E q1 q2 ≠ 0 := by
      intro hz; rw [hz, zero_mul] at hEside; exact lt_irrefl _ hEside
    have hEy_T : 0 < (T E) 1 := by
      have hE_img_prod :
          0 < signedArea2 (T0 E) (T0 q1) (T0 q2) * signedArea2 (T0 q3) (T0 q1) (T0 q2) := by
        rw [tau0.halfplane_sign E q1 q2, tau0.halfplane_sign q3 q1 q2]
        have hrew :
            (tau0.orientation * (tau0.scale ^ 2) * signedArea2 E q1 q2) *
                (tau0.orientation * (tau0.scale ^ 2) * signedArea2 q3 q1 q2) =
              (tau0.orientation ^ 2) * (tau0.scale ^ 2 * tau0.scale ^ 2) *
                (signedArea2 E q1 q2 * signedArea2 q3 q1 q2) := by ring
        rw [hrew, tau0.orientation_sq]
        have hscale_pos : 0 < tau0.scale ^ 2 * tau0.scale ^ 2 := by
          have := tau0.scale_pos; positivity
        have hprod : 0 < signedArea2 E q1 q2 * signedArea2 q3 q1 q2 := by
          simpa [q1, q2, q3] using hEside
        have : 0 < tau0.scale ^ 2 * tau0.scale ^ 2 *
            (signedArea2 E q1 q2 * signedArea2 q3 q1 q2) := mul_pos hscale_pos hprod
        linarith [this]
      have hE_img_pos : 0 < signedArea2 (T0 E) (T0 q1) (T0 q2) := by
        by_contra hle
        push_neg at hle
        have : signedArea2 (T0 E) (T0 q1) (T0 q2) *
            signedArea2 (T0 q3) (T0 q1) (T0 q2) ≤ 0 :=
          mul_nonpos_of_nonpos_of_nonneg hle (le_of_lt hq3_img_pos)
        linarith
      rw [hv1, hv2, signedArea2_baseChord_vec2] at hE_img_pos
      dsimp [T]
      simp only [halfShift, Problem97.CGN.vec2, EuclideanSpace.single_apply]
      have : (0 : ℝ) < (T0 E) 1 / 2 := by linarith
      simpa using this
    -- Transported radius `r := |v₂v₃| = |Bq| = |BE|`.
    have hv3_ne_v2 : q3 ≠ q2 := by simpa [q2, q3] using S.triangle.v23_ne.symm
    set r : ℝ := dist (T q2) (T q3) with hr_def
    have hd_BD : 0 < dist q2 q3 := by rw [dist_pos]; exact fun h => hv3_ne_v2 h.symm
    have hr_pos : 0 < r := by
      rw [hr_def, tau.dist_image]; exact mul_pos tau.scale_pos hd_BD
    have hBD_T : dist (T q2) (T q3) = r := hr_def.symm
    have hBq_T : dist (T q2) (T q) = r := by
      rw [hr_def, tau.dist_image, tau.dist_image]
      have : dist q2 q = dist q2 q3 := by
        have := hBq; simp only [q2, q3] at this ⊢; rw [this]
      rw [this]
    have hBE_T : dist (T q2) (T E) = r := by
      rw [hr_def, tau.dist_image, tau.dist_image]
      have : dist q2 E = dist q2 q3 := by
        have := hBE; simp only [q2, q3] at this ⊢; rw [this]
      rw [this]
    -- `|DE| = |Dq|` transported (the chord/radical condition).
    have hDE_T : dist (T q3) (T E) = dist (T q3) (T q) := by
      rw [tau.dist_image, tau.dist_image]
      have : dist q3 E = dist q3 q := by
        have := hDE; simp only [q3] at this ⊢; rw [this]
      rw [this]
    -- `|Dqs| = |Dq|` transported (both lower vertices on Γ).
    have hDqs_T : dist (T q3) (T qs) = dist (T q3) (T q) := by
      rw [tau.dist_image, tau.dist_image]
      have : dist q3 qs = dist q3 q := by
        have := hDqs; simp only [q3] at this ⊢; rw [this]
      rw [this]
    -- Coordinate abbreviations on the radius-`r` circle about `(1,0)`.
    set cδ : ℝ := ((T q3) 0 - 1) / r with hcδ_def
    set sδ : ℝ := (T q3) 1 / r with hsδ_def
    set cε : ℝ := ((T E) 0 - 1) / r with hcε_def
    set sε : ℝ := (T E) 1 / r with hsε_def
    set cη : ℝ := ((T q) 0 - 1) / r with hcη_def
    set sη : ℝ := (T q) 1 / r with hsη_def
    have hrne : r ≠ 0 := ne_of_gt hr_pos
    -- Pythagorean identities from the three circle facts.
    have hδpyth : cδ ^ 2 + sδ ^ 2 = 1 :=
      circle_pyth (T q3) (T q2) r hrne hv2c0 hv2c1 hBD_T
    have hεpyth : cε ^ 2 + sε ^ 2 = 1 :=
      circle_pyth (T E) (T q2) r hrne hv2c0 hv2c1 hBE_T
    have hηpyth : cη ^ 2 + sη ^ 2 = 1 :=
      circle_pyth (T q) (T q2) r hrne hv2c0 hv2c1 hBq_T
    -- `sδ > 0`, `sε > 0` (above), `sη < 0` (below).
    have hsδ_pos : 0 < sδ := by rw [hsδ_def]; exact div_pos hq3y_T hr_pos
    have hsε_pos : 0 < sε := by rw [hsε_def]; exact div_pos hEy_T hr_pos
    have hsη_neg : sη < 0 := by rw [hsη_def]; exact div_neg_of_neg_of_pos hqy_T hr_pos
    -- Coordinate values on the radius-`r` circle about `(1,0)`.
    have hTD0 : (T q3) 0 = 1 + r * cδ := by rw [hcδ_def]; field_simp; ring
    have hTD1 : (T q3) 1 = r * sδ := by rw [hsδ_def]; field_simp
    have hTE0 : (T E) 0 = 1 + r * cε := by rw [hcε_def]; field_simp; ring
    have hTE1 : (T E) 1 = r * sε := by rw [hsε_def]; field_simp
    have hTq0 : (T q) 0 = 1 + r * cη := by rw [hcη_def]; field_simp; ring
    have hTq1 : (T q) 1 = r * sη := by rw [hsη_def]; field_simp
    -- The radical (chord) condition `cη·cδ + sη·sδ = cε·cδ + sε·sδ` from `|Dq| = |DE|`.
    have hradical : cη * cδ + sη * sδ = cε * cδ + sε * sδ := by
      have hsqeq : dist (T q3) (T E) ^ 2 = dist (T q3) (T q) ^ 2 := by rw [hDE_T]
      rw [dist_sq_eq_coord_sq_add_coord_sq, dist_sq_eq_coord_sq_add_coord_sq] at hsqeq
      rw [hTD0, hTD1, hTE0, hTE1, hTq0, hTq1] at hsqeq
      have hkey : (cε * cδ + sε * sδ) * r ^ 2 = (cη * cδ + sη * sδ) * r ^ 2 := by
        nlinarith [hsqeq, hδpyth]
      have hr2pos : (0 : ℝ) < r ^ 2 := by positivity
      exact (mul_right_cancel₀ (ne_of_gt hr2pos) hkey).symm
    -- `q ≠ E` gives `(cη, sη) ≠ (cε, sε)`.
    have hne : ¬ (cη = cε ∧ sη = sε) := by
      rintro ⟨hc, hs⟩
      apply hqE
      have h0 : (T q) 0 = (T E) 0 := by rw [hTq0, hTE0, hc]
      have h1 : (T q) 1 = (T E) 1 := by rw [hTq1, hTE1, hs]
      have hTqE : T q = T E := by ext i; fin_cases i
                                  · exact h0
                                  · exact h1
      have hd0 : dist (T q) (T E) = 0 := by rw [hTqE]; simp
      rw [tau.dist_image] at hd0
      have hdqE : dist q E = 0 := by
        rcases mul_eq_zero.mp hd0 with h | h
        · exact absurd h (ne_of_gt tau.scale_pos)
        · exact h
      exact dist_eq_zero.mp hdqE
    -- Recover genuine angles `ε`, `δ` and the reflection identity `η = 2δ − ε`.
    obtain ⟨ε, δ, hcosε, hsinε, hε0, hεπ, hcosδ, hsinδ, hδ0, hδπ, hcη_eq, hsη_eq⟩ :=
      qEqE_reflection_coords r cε sε cδ sδ cη sη hsε_pos hεpyth hsδ_pos hδpyth hηpyth
        hsη_neg hradical hne
    -- Sign-pins in trig form.
    have hsd : 0 < Real.sin δ := by rw [hsinδ]; exact hsδ_pos
    have hse : 0 < Real.sin ε := by rw [hsinε]; exact hsε_pos
    -- Trig-form coordinate values for `v₃` (needed for hDqsdist and hDEdist).
    have hTD0' : (T q3) 0 = 1 + r * Real.cos δ := by rw [hTD0, ← hcosδ]
    have hTD1' : (T q3) 1 = r * Real.sin δ := by rw [hTD1, ← hsinδ]
    have hTE0' : (T E) 0 = 1 + r * Real.cos ε := by rw [hTE0, ← hcosε]
    have hTE1' : (T E) 1 = r * Real.sin ε := by rw [hTE1, ← hsinε]
    -- Full `E ∈ C₂` membership supplies the side inequality needed to rule out
    -- the wrapped reflected branch.
    have hEC2_arc :
        signedArea2 E q3 q1 * signedArea2 q2 q3 q1 ≤ 0 := by
      have hEA : E ∈ A := S.CP.C2_subset hEC2
      have h := ((S.CP.arc_membership E hEA).2.1).mp hEC2
      simpa [Problem97.OnArcOpposite, q1, q2, q3] using h
    have hEC2_img :
        signedArea2 (T E) (T q3) (T q1) *
            signedArea2 (T q2) (T q3) (T q1) ≤ 0 := by
      rw [tau.halfplane_sign E q3 q1, tau.halfplane_sign q2 q3 q1]
      have hrew :
          (tau.orientation * (tau.scale ^ 2) * signedArea2 E q3 q1) *
              (tau.orientation * (tau.scale ^ 2) * signedArea2 q2 q3 q1) =
            (tau.orientation ^ 2) * (tau.scale ^ 2 * tau.scale ^ 2) *
              (signedArea2 E q3 q1 * signedArea2 q2 q3 q1) := by ring
      rw [hrew, tau.orientation_sq]
      have hscale_nonneg : 0 ≤ tau.scale ^ 2 * tau.scale ^ 2 := by positivity
      simpa using mul_nonpos_of_nonneg_of_nonpos hscale_nonneg hEC2_arc
    set side : ℝ :=
      Real.sin δ - Real.sin ε
        - r * (Real.sin ε * Real.cos δ - Real.cos ε * Real.sin δ) with hside_def
    have hE_c2_area : signedArea2 (T E) (T q3) (T q1) = r * side := by
      rw [Problem97.signedArea2, hTE0', hTE1', hTD0', hTD1', hv1T, hside_def]
      simp [Problem97.CGN.vec2, EuclideanSpace.single_apply]
      ring
    have hq2_c2_area : signedArea2 (T q2) (T q3) (T q1) = r * Real.sin δ := by
      rw [Problem97.signedArea2, hv2T, hTD0', hTD1', hv1T]
      simp [Problem97.CGN.vec2, EuclideanSpace.single_apply]
    have hside_scaled : r * side ≤ 0 := by
      have hprod : (r * side) * (r * Real.sin δ) ≤ 0 := by
        simpa [hE_c2_area, hq2_c2_area] using hEC2_img
      have hfactor_pos : 0 < r * Real.sin δ := mul_pos hr_pos hsd
      by_contra hpos
      push_neg at hpos
      have : 0 < (r * side) * (r * Real.sin δ) := mul_pos hpos hfactor_pos
      linarith
    have hside : Real.sin δ - Real.sin ε
        - r * (Real.sin ε * Real.cos δ - Real.cos ε * Real.sin δ) ≤ 0 := by
      have hside_le : side ≤ 0 := by
        by_contra hpos
        push_neg at hpos
        have : 0 < r * side := mul_pos hr_pos hpos
        linarith
      simpa [hside_def] using hside_le
    -- `cos δ > -r/2` from `|AD| > 1` (the long-side fact).
    have hAB1 : dist (T q1) (T q2) = 1 := by
      rw [hv1T, hv2T, dist_eq_norm]
      have hvec :
          Problem97.CGN.vec2 0 0 - Problem97.CGN.vec2 1 0 = Problem97.CGN.vec2 (-1) 0 := by
        ext i <;> fin_cases i <;>
          simp [Problem97.CGN.vec2, EuclideanSpace.single_apply]
      rw [hvec, EuclideanSpace.norm_eq]
      norm_num [Problem97.CGN.vec2, EuclideanSpace.single_apply]
    have hcd : -(r / 2) < Real.cos δ := by
      rw [hcosδ, hcδ_def]
      have hAD : 1 < dist (T q1) (T q3) := by
        rw [tau.dist_image]
        have hsc : dist (T q1) (T q2) = tau.scale * dist q1 q2 := tau.dist_image q1 q2
        rw [hAB1] at hsc
        have hlong' : dist q1 q2 < dist q1 q3 := by simpa [q1, q2, q3] using hlong
        nlinarith [hsc, hlong', tau.scale_pos, dist_nonneg (x := q1) (y := q2)]
      have hADsq : 1 < (T q3) 0 ^ 2 + (T q3) 1 ^ 2 :=
        normsq_gt_of_origin_dist_gt (T q3) (T q1) hv1c0 hv1c1 hAD
      exact sign_pin_lower_bound r _ _ hr_pos (by rwa [← hcδ_def, ← hsδ_def]) hADsq
    -- `sin(2δ-ε) < 0` from `q` below `AB`.
    have hs2de : Real.sin (2 * δ - ε) < 0 := by rw [← hsη_eq]; exact hsη_neg
    -- The radial parameter `S = |Dq|/r`, with `S > 0` and `S² = 2 − 2cos(δ−ε)`.
    have hDq_T_eq : dist (T q3) (T q) = r * Real.sqrt (2 - 2 * Real.cos (δ - ε)) := by
      have hDEdist : dist (T q3) (T E) ^ 2 = r ^ 2 * (2 - 2 * Real.cos (δ - ε)) := by
        rw [dist_sq_eq_coord_sq_add_coord_sq, hTD0', hTD1', hTE0, hTE1, ← hcosε, ← hsinε,
            chord_sq_formula r hr_pos δ ε]
        field_simp
      rw [hDE_T] at hDEdist
      exact dist_eq_r_sqrt_of_sq _ r hr_pos δ ε dist_nonneg hDEdist
    set Sr : ℝ := Real.sqrt (2 - 2 * Real.cos (δ - ε)) with hSr_def
    have hS2eq : Sr ^ 2 = 2 - 2 * Real.cos (δ - ε) := by
      rw [hSr_def, Real.sq_sqrt]; nlinarith [Real.cos_le_one (δ - ε)]
    -- `q ≠ v₃` since `q ∈ C₃` but `v₃ ∉ C₃` (opposite apex), so `|Dq| > 0`.
    have hq_ne_v3 : q ≠ q3 := by
      intro h; exact S.CP.v3_notin_C3 (by simpa [q3, h] using hqC3)
    have hSr_pos : 0 < Sr := by
      have hDq_pos : 0 < dist (T q3) (T q) := by
        rw [tau.dist_image]; apply mul_pos tau.scale_pos
        rw [dist_pos]; exact fun h => hq_ne_v3 h.symm
      show 0 < Real.sqrt (2 - 2 * Real.cos (δ - ε))
      have hh : Real.sqrt (2 - 2 * Real.cos (δ - ε)) = dist (T q3) (T q) / r := by
        rw [hDq_T_eq, mul_div_cancel_left₀ _ (ne_of_gt hr_pos)]
      rw [hh]; exact div_pos hDq_pos hr_pos
    -- Parametrize `qs` on `Γ` (radius `r·Sr` about `D`).
    have hDqsdist :
        ((T qs) 0 - (1 + r * Real.cos δ)) ^ 2 + ((T qs) 1 - r * Real.sin δ) ^ 2
          = (r * Sr) ^ 2 := by
      have h_coord : dist (T q3) (T qs) ^ 2 =
          ((T qs) 0 - (1 + r * Real.cos δ)) ^ 2 + ((T qs) 1 - r * Real.sin δ) ^ 2 := by
        rw [dist_sq_eq_coord_sq_add_coord_sq, hTD0', hTD1']; ring
      rw [← h_coord, hDqs_T, hDq_T_eq]
    obtain ⟨t, hqsx, hqsy⟩ :=
      qEqE_param_t r Sr (Real.cos δ) (Real.sin δ) ((T qs) 0) ((T qs) 1) hr_pos hSr_pos
        hDqsdist
    -- `hlower : r sinδ + r Sr sin t < 0` from `qs` below `AB`.
    have hlower : r * Real.sin δ + r * Sr * Real.sin t < 0 := by
      rw [← hqsy]; exact hqsy_T
    -- Apply the C₂-side flipped (B): C₂ membership supplies the missing no-wrap
    -- sign facts, so the weak flipped helper is not used.
    have hB := qEqE_lowerArc_sameSign_flipped_of_c2Side r δ ε t Sr hr_pos
      hSr_pos hS2eq hsd hcd hse hδ0 hδπ hε0 hεπ hs2de hside hlower
    -- Rewrite the two sinusoid RHS back to the literal coordinate functionals
    -- via the Phase-0 sinusoid lemmas.
    rw [← qEqE_f1_sinusoid r δ ε t Sr hS2eq, ← qEqE_f2_sinusoid r δ ε t Sr] at hB
    -- Parametrized coordinate values.
    have hqsx' : (T qs) 0 = (1 + r * Real.cos δ) + r * Sr * Real.cos t := by
      rw [hqsx]
    have hqsy' : (T qs) 1 = r * Real.sin δ + r * Sr * Real.sin t := hqsy
    have hTq0' : (T q) 0 = 1 + r * Real.cos (2 * δ - ε) := by rw [hTq0, hcη_eq]
    have hTq1' : (T q) 1 = r * Real.sin (2 * δ - ε) := by rw [hTq1, hsη_eq]
    -- Γ equality in parametrized coordinate form (needed by both bridges).
    have hGparam :
        (((1 + r * Real.cos δ) + r * Sr * Real.cos t) - (1 + r * Real.cos δ)) ^ 2
            + ((r * Real.sin δ + r * Sr * Real.sin t) - r * Real.sin δ) ^ 2
          = ((1 + r * Real.cos (2 * δ - ε)) - (1 + r * Real.cos δ)) ^ 2
            + (r * Real.sin (2 * δ - ε) - r * Real.sin δ) ^ 2 := by
      have hsq : dist (T q3) (T qs) ^ 2 = dist (T q3) (T q) ^ 2 := by rw [hDqs_T]
      rw [dist_sq_eq_coord_sq_add_coord_sq, dist_sq_eq_coord_sq_add_coord_sq,
        hTD0', hTD1', hqsx', hqsy', hTq0', hTq1'] at hsq
      linarith [hsq]
    -- v₂-functional = (|TB,Tqs|² − |TB,Tq|²)/2 and v₁-functional likewise.
    have hbridge2 :
        (((1 + r * Real.cos δ) + r * Sr * Real.cos t) - (1 + r * Real.cos (2 * δ - ε)))
              * ((1 + r * Real.cos δ) - 1)
            + (((r * Real.sin δ) + r * Sr * Real.sin t) - r * Real.sin (2 * δ - ε))
              * ((r * Real.sin δ) - 0)
          = (dist (T q2) (T qs) ^ 2 - dist (T q2) (T q) ^ 2) / 2 := by
      rw [dist_sq_eq_coord_sq_add_coord_sq, dist_sq_eq_coord_sq_add_coord_sq,
        hv2c0, hv2c1, hqsx', hqsy', hTq0', hTq1']
      linear_combination (-(1 : ℝ) / 2) * hGparam
    have hbridge1 :
        (((1 + r * Real.cos δ) + r * Sr * Real.cos t) - (1 + r * Real.cos (2 * δ - ε)))
              * (1 + r * Real.cos δ)
            + (((r * Real.sin δ) + r * Sr * Real.sin t) - r * Real.sin (2 * δ - ε))
              * (r * Real.sin δ)
          = (dist (T q1) (T qs) ^ 2 - dist (T q1) (T q) ^ 2) / 2 := by
      rw [dist_sq_eq_coord_sq_add_coord_sq, dist_sq_eq_coord_sq_add_coord_sq,
        hv1c0, hv1c1, hqsx', hqsy', hTq0', hTq1']
      linear_combination (-(1 : ℝ) / 2) * hGparam
    rw [hbridge2, hbridge1] at hB
    -- `hB : 0 ≤ (|TB,Tqs|²−|TB,Tq|²)/2 · (|TA,Tqs|²−|TA,Tq|²)/2`.
    -- Transport distances back via `dist_image` (`|T·,·| = scale·|·,·|`).
    have hsc_pos : 0 < tau.scale := tau.scale_pos
    have hTB2qs : dist (T q2) (T qs) ^ 2 = tau.scale ^ 2 * dist q2 qs ^ 2 := by
      rw [tau.dist_image]; ring
    have hTB2q : dist (T q2) (T q) ^ 2 = tau.scale ^ 2 * dist q2 q ^ 2 := by
      rw [tau.dist_image]; ring
    have hTA2qs : dist (T q1) (T qs) ^ 2 = tau.scale ^ 2 * dist q1 qs ^ 2 := by
      rw [tau.dist_image]; ring
    have hTA2q : dist (T q1) (T q) ^ 2 = tau.scale ^ 2 * dist q1 q ^ 2 := by
      rw [tau.dist_image]; ring
    rw [hTB2qs, hTB2q, hTA2qs, hTA2q] at hB
    -- Factor out `scale⁴/4 > 0` to get the shell-level same-sign inequality.
    have hsc4 : 0 < tau.scale ^ 2 * tau.scale ^ 2 / 4 := by positivity
    have hfac :
        (tau.scale ^ 2 * dist q2 qs ^ 2 - tau.scale ^ 2 * dist q2 q ^ 2) / 2
            * ((tau.scale ^ 2 * dist q1 qs ^ 2 - tau.scale ^ 2 * dist q1 q ^ 2) / 2)
          = (dist q2 qs ^ 2 - dist q2 q ^ 2) * (dist q1 qs ^ 2 - dist q1 q ^ 2)
            * (tau.scale ^ 2 * tau.scale ^ 2 / 4) := by
      ring
    rw [hfac] at hB
    have hgoal :
        0 ≤ (dist q2 qs ^ 2 - dist q2 q ^ 2) * (dist q1 qs ^ 2 - dist q1 q ^ 2) :=
      nonneg_of_mul_nonneg_left hB hsc4
    simpa [q1, q2] using hgoal
  -- Orient so that `(T q3) 1 > 0`, flipping if necessary.
  by_cases hq3pos : 0 < (Tbase q3) 1
  · exact build_from tauBase hv1Base hv2Base hq3pos
  · let Tflip : ℝ² → ℝ² := fun x => flipY (Tbase x)
    let tauFlip : Problem97.CGN.SimilarityTransportData Tflip :=
      similarityTransportComp tauBase flipYSimilarityTransportData
    have hv1Flip : Tflip q1 = Problem97.CGN.vec2 (-1) 0 := by
      dsimp [Tflip]; rw [hv1Base]
      ext i <;> fin_cases i <;>
        simp [flipY, Problem97.CGN.vec2, EuclideanSpace.single_apply]
    have hv2Flip : Tflip q2 = Problem97.CGN.vec2 1 0 := by
      dsimp [Tflip]; rw [hv2Base]
      ext i <;> fin_cases i <;>
        simp [flipY, Problem97.CGN.vec2, EuclideanSpace.single_apply]
    have hq3Flip : 0 < (Tflip q3) 1 := by
      dsimp [Tflip]
      simp only [flipY, Problem97.CGN.vec2, EuclideanSpace.single_apply]
      have hq3neg : (Tbase q3) 1 < 0 := by
        have hle : (Tbase q3) 1 ≤ 0 := le_of_not_gt hq3pos
        exact lt_of_le_of_ne hle hq3_base_nonzero
      simpa using hq3neg
    exact build_from tauFlip hv1Flip hv2Flip hq3Flip

/-- `q'=E` lower-arc column closer (the `(C) → False` combiner). The lower-arc
same-sign keystone `qEqE_lowerArc_sameSign_of_shell` forces the product of the
two squared-distance differences `≥ 0`; the cap order on `C₃` places the two cap
vertices `q, qs` at opposite ends of the monotone distance comparisons, forcing
the *same* product `< 0`.  Orientation-robust: the cap-order input is the single
product-negativity fact `hcap_opp`, so either assignment of `{q, qs}` to the two
`C₃` cap vertices discharges it (the producer establishes `hcap_opp` from the
`E3L20` cap-distance monotonicity, mirroring `n4d_bA_2_q_eq_v1_impossible`). -/
theorem qEqE_lowerArc_impossible
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    {q qs E : ℝ²}
    (hqI3 : q ∈ S.I3) (hqsI3 : qs ∈ S.I3)
    (hDqs : dist S.triangle.v3 qs = dist S.triangle.v3 q)
    (hBq : dist S.triangle.v2 q = dist S.triangle.v2 S.triangle.v3)
    (hBE : dist S.triangle.v2 E = dist S.triangle.v2 S.triangle.v3)
    (hDE : dist S.triangle.v3 E = dist S.triangle.v3 q)
    (hsmall : dist S.triangle.v2 S.triangle.v3 < dist S.triangle.v1 S.triangle.v2)
    (hlong : dist S.triangle.v1 S.triangle.v2 < dist S.triangle.v1 S.triangle.v3)
    (hAElt : dist S.triangle.v1 E < dist S.triangle.v1 S.triangle.v2)
    (hEside :
      0 < signedArea2 E S.triangle.v1 S.triangle.v2 *
        signedArea2 S.triangle.v3 S.triangle.v1 S.triangle.v2)
    (hqE : q ≠ E)
    (hcap_opp :
      (dist S.triangle.v2 qs ^ 2 - dist S.triangle.v2 q ^ 2)
        * (dist S.triangle.v1 qs ^ 2 - dist S.triangle.v1 q ^ 2) < 0) :
    False := by
  have hsign := S.qEqE_lowerArc_sameSign_of_shell hqI3 hqsI3 hDqs hBq hBE hDE
    hsmall hlong hAElt hEside hqE
  linarith [hsign, hcap_opp]

theorem qEqE_lowerArc_impossible_flipped
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    {q qs E : ℝ²}
    (hqI3 : q ∈ S.I3) (hqsI3 : qs ∈ S.I3)
    (hDqs : dist S.triangle.v3 qs = dist S.triangle.v3 q)
    (hBq : dist S.triangle.v2 q = dist S.triangle.v2 S.triangle.v3)
    (hBE : dist S.triangle.v2 E = dist S.triangle.v2 S.triangle.v3)
    (hDE : dist S.triangle.v3 E = dist S.triangle.v3 q)
    (hsmall : dist S.triangle.v2 S.triangle.v3 < dist S.triangle.v1 S.triangle.v2)
    (hlong : dist S.triangle.v1 S.triangle.v2 < dist S.triangle.v1 S.triangle.v3)
    (hAEgt : dist S.triangle.v1 S.triangle.v2 < dist S.triangle.v1 E)
    (hEC2 : E ∈ S.CP.C2)
    (hEside :
      0 < signedArea2 E S.triangle.v1 S.triangle.v2 *
        signedArea2 S.triangle.v3 S.triangle.v1 S.triangle.v2)
    (hqE : q ≠ E)
    (hcap_opp :
      (dist S.triangle.v2 qs ^ 2 - dist S.triangle.v2 q ^ 2)
        * (dist S.triangle.v1 qs ^ 2 - dist S.triangle.v1 q ^ 2) < 0) :
    False := by
  have hsign := S.qEqE_lowerArc_sameSign_of_shell_flipped hqI3 hqsI3 hDqs hBq hBE hDE
    hsmall hlong hAEgt hEC2 hEside hqE
  linarith [hsign, hcap_opp]

-- The shared-circle exclusion expands a full chord-frame coordinate
-- computation inside one theorem.
set_option maxHeartbeats 2000000 in
/-- In the `x = a₂`, `q = v₁` branch, the only possible named `C₁` witness of
the `v₂` selector is `v₃`.  The proof follows the pinned shared-circle route:
use the branch packet to put any named `C₁` candidate on both equal-radius
circles centered at `v₁` and `v₂`, compare the two possible common points in a
chord-frame chart, and rule out the reflected lower point by MEC-disk
containment. -/
theorem selectorShape_v2_q_eq_v1_forces_v3
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) {r s : ℝ}
    (hr : 0 < r)
    (hcard : 4 ≤ (S.witnessClassAt_v1 r).card)
    (hbranch : FormBv1A2SelectorV2Qv1Packet S Z r s) :
    S.witnessClassAt_v2 s ∩ S.CP.C1 = ({S.triangle.v3} : Finset ℝ²) := by
  classical
  rcases hbranch with ⟨⟨hA2, h_a2eq, h_v2eq⟩, -, hpacket⟩
  rcases hpacket with ⟨hTcard_packet, hI2sub_packet, p, hp, hpeq, hqeq⟩
  have hforce : S.SharedCirclePointForcesV3 Z r s := by
    intro q hqnamed hqT2 hqT1
    let q1 : ℝ² := S.triangle.v1
    let q2 : ℝ² := S.triangle.v2
    let a : ℝ² := Z.a2
    let center : ℝ² := S.Packet.center
    have hqA : q ∈ A := (Finset.mem_filter.mp hqT1).1
    have haC2 : a ∈ S.CP.C2 := by
      unfold Problem97.FiniteEndpointShell.I2 at hA2
      exact (Finset.mem_erase.mp (Finset.mem_erase.mp hA2).2).2
    have haA : a ∈ A := S.CP.C2_subset haC2
    have haT1 : a ∈ S.witnessClassAt_v1 r := by
      have hamem : a ∈ ({a} : Finset ℝ²) := by simp
      rw [← h_a2eq] at hamem
      exact (Finset.mem_inter.mp hamem).1
    have haT2 : a ∈ S.witnessClassAt_v2 s := by
      exact hI2sub_packet hA2
    have hv2T1 : q2 ∈ S.witnessClassAt_v1 r := by
      have hv2mem : q2 ∈ ({q2} : Finset ℝ²) := by simp [q2]
      rw [← h_v2eq] at hv2mem
      exact (Finset.mem_inter.mp hv2mem).1
    have hv1T2 : q1 ∈ S.witnessClassAt_v2 s := by
      have hv1mem : q1 ∈ ({q1} : Finset ℝ²) := by simp [q1]
      rw [← hqeq] at hv1mem
      exact (Finset.mem_inter.mp hv1mem).1
    have hr_q1q2 : dist q1 q2 = r := by
      simpa [q1, q2] using (Finset.mem_filter.mp hv2T1).2
    have hr_q1a : dist q1 a = r := by
      simpa [q1, a] using (Finset.mem_filter.mp haT1).2
    have hr_q1q : dist q1 q = r := by
      simpa [q1] using (Finset.mem_filter.mp hqT1).2
    have hs_q2q1 : dist q2 q1 = s := by
      simpa [q1, q2] using (Finset.mem_filter.mp hv1T2).2
    have hs_q2a : dist q2 a = s := by
      simpa [q2, a] using (Finset.mem_filter.mp haT2).2
    have hs_q2q : dist q2 q = s := by
      simpa [q2] using (Finset.mem_filter.mp hqT2).2
    have ha_q1 : dist q1 a = dist q1 q2 := by
      rw [hr_q1a, hr_q1q2]
    have ha_q2 : dist q2 a = dist q1 q2 := by
      rw [hs_q2a, dist_comm q1 q2, hs_q2q1]
    have hq_q1 : dist q1 q = dist q1 q2 := by
      rw [hr_q1q, hr_q1q2]
    have hq_q2 : dist q2 q = dist q1 q2 := by
      rw [hs_q2q, dist_comm q1 q2, hs_q2q1]
    have hu : q2 - q1 ≠ 0 := by
      exact sub_ne_zero.mpr S.triangle.v12_ne.symm
    let u : ℝ² := q2 - q1
    let nvec : ℝ² := Problem97.stdOrientation.rightAngleRotation u
    let β := Problem97.stdOrientation.basisRightAngleRotation u hu
    let M : ℝ² := midpoint ℝ q1 q2
    let X : ℝ² → ℝ := fun z => β.repr (z - M) 0
    let Y : ℝ² → ℝ := fun z => β.repr (z - M) 1
    let yc : ℝ := Y center
    have hsum_pt : ∀ z : ℝ², z - M = X z • u + Y z • nvec := by
      intro z
      simpa [β, X, Y, nvec] using (β.sum_repr (z - M)).symm
    have hnorm_nvec : ‖nvec‖ = ‖u‖ := by
      simpa [nvec] using Problem97.stdOrientation.rightAngleRotation.norm_map u
    have hβu : β.repr u = Finsupp.single 0 (1 : ℝ) := by
      simpa [β, nvec] using (β.repr_self 0)
    have hβu0 : β.repr u 0 = 1 := by simp [hβu]
    have horth : inner ℝ u nvec = 0 := by
      simpa [nvec] using Problem97.stdOrientation.inner_rightAngleRotation_self u
    have hq1mid : q1 - M = (-(1 / 2 : ℝ)) • u := by
      calc
        q1 - M = (1 / 2 : ℝ) • (q1 - q2) := by
          simpa [M] using (left_sub_midpoint ℝ q1 q2)
        _ = (-(1 / 2 : ℝ)) • u := by
          rw [show q1 - q2 = -u by
            dsimp [u]
            abel_nf]
          simp [smul_neg]
    have hq2mid : q2 - M = (1 / 2 : ℝ) • u := by
      simpa [M, u] using (right_sub_midpoint ℝ q1 q2)
    have hX_q1 : X q1 = -(1 / 2 : ℝ) := by
      have h := congrArg (fun v : ℝ² => β.repr v 0) hq1mid
      change X q1 = (β.repr ((-(1 / 2 : ℝ)) • u)) 0 at h
      rw [map_smul, hβu] at h
      simpa using h
    have hY_q1 : Y q1 = 0 := by
      have h := congrArg (fun v : ℝ² => β.repr v 1) hq1mid
      change Y q1 = (β.repr ((-(1 / 2 : ℝ)) • u)) 1 at h
      rw [map_smul, hβu] at h
      simpa using h
    have hX_q2 : X q2 = (1 / 2 : ℝ) := by
      have h := congrArg (fun v : ℝ² => β.repr v 0) hq2mid
      change X q2 = (β.repr ((1 / 2 : ℝ) • u)) 0 at h
      rw [map_smul, hβu] at h
      simpa using h
    have hY_q2 : Y q2 = 0 := by
      have h := congrArg (fun v : ℝ² => β.repr v 1) hq2mid
      change Y q2 = (β.repr ((1 / 2 : ℝ) • u)) 1 at h
      rw [map_smul, hβu] at h
      simpa using h
    have hdist_sq_coeff :
        ∀ a b : ℝ, ‖a • u + b • nvec‖ ^ 2 = (a ^ 2 + b ^ 2) * ‖u‖ ^ 2 := by
      intro a b
      have horth' : inner ℝ (a • u) (b • nvec) = 0 := by
        rw [inner_smul_left, inner_smul_right, horth]
        ring
      have hnorm :
          ‖a • u + b • nvec‖ ^ 2 = ‖a • u‖ ^ 2 + ‖b • nvec‖ ^ 2 := by
        simpa [pow_two] using
          norm_add_sq_eq_norm_sq_add_norm_sq_of_inner_eq_zero (a • u) (b • nvec) horth'
      have hu_part : ‖a • u‖ ^ 2 = a ^ 2 * ‖u‖ ^ 2 := by
        calc
          ‖a • u‖ ^ 2 = (|a| * ‖u‖) ^ 2 := by rw [norm_smul, Real.norm_eq_abs]
          _ = |a| ^ 2 * ‖u‖ ^ 2 := by ring
          _ = a ^ 2 * ‖u‖ ^ 2 := by rw [sq_abs]
      have hn_part : ‖b • nvec‖ ^ 2 = b ^ 2 * ‖u‖ ^ 2 := by
        calc
          ‖b • nvec‖ ^ 2 = (|b| * ‖u‖) ^ 2 := by
            rw [norm_smul, Real.norm_eq_abs, hnorm_nvec]
          _ = |b| ^ 2 * ‖u‖ ^ 2 := by ring
          _ = b ^ 2 * ‖u‖ ^ 2 := by rw [sq_abs]
      rw [hnorm, hu_part, hn_part]
      ring
    have hpt_minus_q1 : ∀ z : ℝ²,
        z - q1 = (X z + 1 / 2) • u + Y z • nvec := by
      intro z
      calc
        z - q1 = (z - M) - (q1 - M) := by
          rw [sub_eq_add_neg, sub_eq_add_neg, sub_eq_add_neg]
          abel_nf
        _ = (X z • u + Y z • nvec) - ((-(1 / 2 : ℝ)) • u) := by
          rw [hsum_pt z, hq1mid]
        _ = (X z • u + (1 / 2 : ℝ) • u) + Y z • nvec := by
          rw [sub_eq_add_neg, neg_smul]
          abel_nf
        _ = (X z + 1 / 2) • u + Y z • nvec := by
          rw [← add_smul]
    have hpt_minus_q2 : ∀ z : ℝ²,
        z - q2 = (X z - 1 / 2) • u + Y z • nvec := by
      intro z
      calc
        z - q2 = (z - M) - (q2 - M) := by
          rw [sub_eq_add_neg, sub_eq_add_neg, sub_eq_add_neg]
          abel_nf
        _ = (X z • u + Y z • nvec) - ((1 / 2 : ℝ) • u) := by
          rw [hsum_pt z, hq2mid]
        _ = (X z • u + (-(1 / 2 : ℝ)) • u) + Y z • nvec := by
          rw [sub_eq_add_neg, neg_smul]
          abel_nf
        _ = (X z - 1 / 2) • u + Y z • nvec := by
          rw [← add_smul]
          simp [sub_eq_add_neg]
    have hpt_minus_center : ∀ z : ℝ²,
        z - center = X z • u + (Y z - yc) • nvec := by
      intro z
      have hcenter_perp : inner ℝ (center - M) u = 0 := by
        have hdist_eq : dist center q1 = dist center q2 := by
          rw [dist_comm center q1, dist_comm center q2]
          simpa [q1, q2] using S.Packet.moser_on_boundary_1.trans S.Packet.moser_on_boundary_2.symm
        have hperp : center ∈ AffineSubspace.perpBisector q1 q2 := by
          rw [AffineSubspace.mem_perpBisector_iff_dist_eq]
          simpa using hdist_eq
        have h :=
          (AffineSubspace.mem_perpBisector_iff_inner_eq_zero
            (c := center) (p₁ := q1) (p₂ := q2)).mp hperp
        simpa [M] using h
      have hxc_zero : X center = 0 := by
        have hinner : inner ℝ (center - M) u = X center * ‖u‖ ^ 2 := by
          have horth_rev : inner ℝ nvec u = 0 := by simpa [real_inner_comm] using horth
          calc
            inner ℝ (center - M) u = inner ℝ (X center • u + Y center • nvec) u := by
              rw [hsum_pt center]
            _ = inner ℝ (X center • u) u + inner ℝ (Y center • nvec) u := by
              rw [inner_add_left]
            _ = X center * ‖u‖ ^ 2 + Y center * 0 := by
              rw [inner_smul_left, inner_smul_left, real_inner_self_eq_norm_sq, horth_rev]
              simp
            _ = X center * ‖u‖ ^ 2 := by ring
        have hsqpos : 0 < ‖u‖ ^ 2 := by
          exact sq_pos_of_ne_zero (norm_ne_zero_iff.mpr hu)
        nlinarith
      calc
        z - center = (z - M) - (center - M) := by
          rw [sub_eq_add_neg, sub_eq_add_neg, sub_eq_add_neg]
          abel_nf
        _ = (X z • u + Y z • nvec) - (Y center • nvec) := by
          rw [hsum_pt z, hsum_pt center, hxc_zero, zero_smul, zero_add]
        _ = X z • u + (Y z • nvec + (-Y center) • nvec) := by
          rw [sub_eq_add_neg, neg_smul]
          abel_nf
        _ = X z • u + (Y z - yc) • nvec := by
          rw [← add_smul]
          rfl
    have hdist_q1_sq :
        ∀ z : ℝ², dist q1 z ^ 2 = ((X z + 1 / 2) ^ 2 + Y z ^ 2) * ‖u‖ ^ 2 := by
      intro z
      rw [dist_comm, dist_eq_norm, hpt_minus_q1, hdist_sq_coeff]
    have hdist_q2_sq :
        ∀ z : ℝ², dist q2 z ^ 2 = ((X z - 1 / 2) ^ 2 + Y z ^ 2) * ‖u‖ ^ 2 := by
      intro z
      rw [dist_comm, dist_eq_norm, hpt_minus_q2, hdist_sq_coeff]
    have hdist_center_sq :
        ∀ z : ℝ², dist center z ^ 2 = (X z ^ 2 + (Y z - yc) ^ 2) * ‖u‖ ^ 2 := by
      intro z
      rw [dist_comm, dist_eq_norm, hpt_minus_center, hdist_sq_coeff]
    have hu_sq_pos : 0 < ‖u‖ ^ 2 := by
      exact sq_pos_of_ne_zero (norm_ne_zero_iff.mpr hu)
    have hcommon_coords :
        ∀ z : ℝ²,
          dist q1 z = dist q1 q2 →
          dist q2 z = dist q1 q2 →
          X z = 0 ∧ Y z ^ 2 = (3 : ℝ) / 4 := by
      intro z hz1 hz2
      have h1 : ((X z + 1 / 2) ^ 2 + Y z ^ 2) * ‖u‖ ^ 2 = ‖u‖ ^ 2 := by
        rw [← hdist_q1_sq z, hz1, dist_eq_norm]
        simpa [u, norm_sub_rev]
      have h2 : ((X z - 1 / 2) ^ 2 + Y z ^ 2) * ‖u‖ ^ 2 = ‖u‖ ^ 2 := by
        rw [← hdist_q2_sq z, hz2, dist_eq_norm]
        simpa [u, norm_sub_rev]
      have hx : X z = 0 := by
        nlinarith [h1, h2, hu_sq_pos]
      have hy : Y z ^ 2 = (3 : ℝ) / 4 := by
        nlinarith [h1, hu_sq_pos, hx]
      exact ⟨hx, hy⟩
    have haXhY := hcommon_coords a ha_q1 ha_q2
    have hqXhY := hcommon_coords q hq_q1 hq_q2
    rcases haXhY with ⟨haX, haYsq⟩
    rcases hqXhY with ⟨hqX, hqYsq⟩
    have hy_cases : Y q = Y a ∨ Y q = -Y a := by
      apply sq_eq_sq_iff_eq_or_eq_neg.mp
      rw [hqYsq, haYsq]
    rcases Finset.mem_insert.mp hqnamed with hqa1 | hqrest
    · have hq_a1 : q = Z.a1 := by simpa using hqa1
      rcases hy_cases with hsame | hopp
      · have hqa2 : q = a := by
          have hsub : q - M = a - M := by
            calc
              q - M = X q • u + Y q • nvec := by rw [hsum_pt q]
              _ = 0 • u + Y a • nvec := by simpa [hqX, hsame]
              _ = X a • u + Y a • nvec := by simpa [haX]
              _ = a - M := by rw [hsum_pt a]
          have hadd := congrArg (fun t : ℝ² => t + M) hsub
          simpa [sub_eq_add_neg, add_assoc, add_left_comm, add_comm] using hadd
        have hqI1 : q ∈ S.I1 := by
          rw [hq_a1, Z.hI1]
          simp
        have ha_not_verts : a ∉ S.triangle.verts := by
          have ha_ne_v1 : a ≠ q1 := by
            unfold Problem97.FiniteEndpointShell.I2 at hA2
            exact (Finset.mem_erase.mp hA2).1
          have ha_ne_v3 : a ≠ S.triangle.v3 := by
            unfold Problem97.FiniteEndpointShell.I2 at hA2
            exact (Finset.mem_erase.mp (Finset.mem_erase.mp hA2).2).1
          have ha_ne_v2 : a ≠ q2 := by
            intro h
            have : q2 ∈ S.CP.C2 := by simpa [h] using haC2
            exact S.CP.v2_notin_C2 this
          simp [Problem97.MoserTriangle.verts, q1, q2, ha_ne_v1, ha_ne_v2, ha_ne_v3]
        have hone_a := S.CP.nonmoser_in_one a haA ha_not_verts
        have haI1 : a ∈ S.I1 := by simpa [hqa2] using hqI1
        have haC1 : a ∈ S.CP.C1 := by
          unfold Problem97.FiniteEndpointShell.I1 at haI1
          exact Finset.mem_of_mem_erase (Finset.mem_of_mem_erase haI1)
        have : False := by
          have hone_a' : (2 + if a ∈ S.CP.C3 then 1 else 0) = 1 := by
            simpa [haC1, haC2] using hone_a
          by_cases haC3 : a ∈ S.CP.C3 <;> simp [haC3] at hone_a'
        exact False.elim this
      · have hyc_pos : 0 < Y a * yc := by
          have hdisk_a' : ‖a - center‖ ≤ S.Packet.radius := by
            simpa [center] using S.Packet.disk_contains_A a haA
          have hdisk_a : dist center a ≤ S.Packet.radius := by
            rw [dist_eq_norm, norm_sub_rev]
            exact hdisk_a'
          have hradius : dist center q1 = S.Packet.radius := by
            rw [dist_comm]
            simpa [q1, center] using S.Packet.moser_on_boundary_1
          have hdist_sq : dist center a ^ 2 ≤ dist center q1 ^ 2 := by
            have hnonneg_a : 0 ≤ dist center a := dist_nonneg
            have hnonneg_q1 : 0 ≤ dist center q1 := dist_nonneg
            nlinarith [hdisk_a, hradius, hnonneg_a, hnonneg_q1]
          rw [hdist_center_sq a, hdist_center_sq q1, haX, hX_q1, hY_q1] at hdist_sq
          nlinarith [haYsq, hdist_sq, hu_sq_pos]
        have hq_out : dist center q > S.Packet.radius := by
          have hradius : dist center q1 = S.Packet.radius := by
            rw [dist_comm]
            simpa [q1, center] using S.Packet.moser_on_boundary_1
          have hdist_sq_q :
              dist center q ^ 2 > S.Packet.radius ^ 2 := by
            rw [hdist_center_sq q]
            have hradius_sq :
                S.Packet.radius ^ 2 = ((1 / 2 : ℝ) ^ 2 + yc ^ 2) * ‖u‖ ^ 2 := by
              have hq1sq := hdist_center_sq q1
              rw [hradius, hX_q1, hY_q1] at hq1sq
              nlinarith
            rw [hradius_sq]
            have hqY : Y q = -Y a := by
              exact hopp
            rw [hqX, hqY]
            nlinarith [haYsq, hyc_pos, hu_sq_pos]
          have hrad_nn : 0 ≤ S.Packet.radius := le_of_lt S.Packet.radius_pos
          have hdist_nn : 0 ≤ dist center q := dist_nonneg
          nlinarith
        have hdisk_q' : ‖q - center‖ ≤ S.Packet.radius := by
          simpa [center] using S.Packet.disk_contains_A q hqA
        have hdisk_q : dist center q ≤ S.Packet.radius := by
          rw [dist_eq_norm, norm_sub_rev]
          exact hdisk_q'
        exact False.elim (not_le_of_gt hq_out hdisk_q)
    rcases Finset.mem_insert.mp hqrest with hqb1 | hqv3
    · have hq_b1 : q = Z.b1 := by simpa using hqb1
      rcases hy_cases with hsame | hopp
      · have hqb2 : q = a := by
          have hsub : q - M = a - M := by
            calc
              q - M = X q • u + Y q • nvec := by rw [hsum_pt q]
              _ = 0 • u + Y a • nvec := by simpa [hqX, hsame]
              _ = X a • u + Y a • nvec := by simpa [haX]
              _ = a - M := by rw [hsum_pt a]
          have hadd := congrArg (fun t : ℝ² => t + M) hsub
          simpa [sub_eq_add_neg, add_assoc, add_left_comm, add_comm] using hadd
        have hqI1 : q ∈ S.I1 := by
          rw [hq_b1, Z.hI1]
          simp
        have ha_not_verts : a ∉ S.triangle.verts := by
          have ha_ne_v1 : a ≠ q1 := by
            unfold Problem97.FiniteEndpointShell.I2 at hA2
            exact (Finset.mem_erase.mp hA2).1
          have ha_ne_v3 : a ≠ S.triangle.v3 := by
            unfold Problem97.FiniteEndpointShell.I2 at hA2
            exact (Finset.mem_erase.mp (Finset.mem_erase.mp hA2).2).1
          have ha_ne_v2 : a ≠ q2 := by
            intro h
            have : q2 ∈ S.CP.C2 := by simpa [h] using haC2
            exact S.CP.v2_notin_C2 this
          simp [Problem97.MoserTriangle.verts, q1, q2, ha_ne_v1, ha_ne_v2, ha_ne_v3]
        have hone_a := S.CP.nonmoser_in_one a haA ha_not_verts
        have haI1 : a ∈ S.I1 := by simpa [hqb2] using hqI1
        have haC1 : a ∈ S.CP.C1 := by
          unfold Problem97.FiniteEndpointShell.I1 at haI1
          exact Finset.mem_of_mem_erase (Finset.mem_of_mem_erase haI1)
        have : False := by
          have hone_a' : (2 + if a ∈ S.CP.C3 then 1 else 0) = 1 := by
            simpa [haC1, haC2] using hone_a
          by_cases haC3 : a ∈ S.CP.C3 <;> simp [haC3] at hone_a'
        exact False.elim this
      · have hyc_pos : 0 < Y a * yc := by
          have hdisk_a' : ‖a - center‖ ≤ S.Packet.radius := by
            simpa [center] using S.Packet.disk_contains_A a haA
          have hdisk_a : dist center a ≤ S.Packet.radius := by
            rw [dist_eq_norm, norm_sub_rev]
            exact hdisk_a'
          have hradius : dist center q1 = S.Packet.radius := by
            rw [dist_comm]
            simpa [q1, center] using S.Packet.moser_on_boundary_1
          have hdist_sq : dist center a ^ 2 ≤ dist center q1 ^ 2 := by
            have hnonneg_a : 0 ≤ dist center a := dist_nonneg
            have hnonneg_q1 : 0 ≤ dist center q1 := dist_nonneg
            nlinarith [hdisk_a, hradius, hnonneg_a, hnonneg_q1]
          rw [hdist_center_sq a, hdist_center_sq q1, haX, hX_q1, hY_q1] at hdist_sq
          nlinarith [haYsq, hdist_sq, hu_sq_pos]
        have hq_out : dist center q > S.Packet.radius := by
          have hradius : dist center q1 = S.Packet.radius := by
            rw [dist_comm]
            simpa [q1, center] using S.Packet.moser_on_boundary_1
          have hdist_sq_q :
              dist center q ^ 2 > S.Packet.radius ^ 2 := by
            rw [hdist_center_sq q]
            have hradius_sq :
                S.Packet.radius ^ 2 = ((1 / 2 : ℝ) ^ 2 + yc ^ 2) * ‖u‖ ^ 2 := by
              have hq1sq := hdist_center_sq q1
              rw [hradius, hX_q1, hY_q1] at hq1sq
              nlinarith
            rw [hqX, hopp, hradius_sq]
            nlinarith [haYsq, hyc_pos, hu_sq_pos]
          have hrad_nn : 0 ≤ S.Packet.radius := le_of_lt S.Packet.radius_pos
          have hdist_nn : 0 ≤ dist center q := dist_nonneg
          nlinarith
        have hdisk_q' : ‖q - center‖ ≤ S.Packet.radius := by
          simpa [center] using S.Packet.disk_contains_A q hqA
        have hdisk_q : dist center q ≤ S.Packet.radius := by
          rw [dist_eq_norm, norm_sub_rev]
          exact hdisk_q'
        exact False.elim (not_le_of_gt hq_out hdisk_q)
    simpa using hqv3
  have hcore := S.coreSelector_v1 hr hcard
  rcases hcore with ⟨-, hI1sub, -, -⟩
  have hpT2 : p ∈ S.witnessClassAt_v2 s := by
    have hpmem : p ∈ ({p} : Finset ℝ²) := by simp
    rw [← hpeq] at hpmem
    exact (Finset.mem_inter.mp hpmem).1
  rcases Finset.mem_insert.mp hp with hpa1 | hp
  · have hpa1' : p = Z.a1 := by simpa using hpa1
    have ha1I1 : Z.a1 ∈ S.I1 := by
      rw [Z.hI1]
      simp
    have ha1T1 : Z.a1 ∈ S.witnessClassAt_v1 r := hI1sub ha1I1
    have hpv3 : p = S.triangle.v3 := hforce p hp hpT2 (by simpa [hpa1'] using ha1T1)
    simpa [hpv3] using hpeq
  rcases Finset.mem_insert.mp hp with hpb1 | hpv3
  · have hpb1' : p = Z.b1 := by simpa using hpb1
    have hb1I1 : Z.b1 ∈ S.I1 := by
      rw [Z.hI1]
      simp
    have hb1T1 : Z.b1 ∈ S.witnessClassAt_v1 r := hI1sub hb1I1
    have hp123 : p ∈ ({Z.a1, Z.b1, S.triangle.v3} : Finset ℝ²) := by
      simp [hpb1']
    have hpv3 : p = S.triangle.v3 := hforce p hp123 hpT2 (by simpa [hpb1'] using hb1T1)
    simpa [hpv3] using hpeq
  have hpv3' : p = S.triangle.v3 := by simpa using hpv3
  simpa [hpv3'] using hpeq

/-- Upgrade the `x = a₂`, `q = v₁` selector row to the literal forced packet
`S(v₂) = {a₂,b₂,v₃,v₁}` once the named `C₁` witness has been forced to `v₃`.
This is bookkeeping only; the geometric content is entirely in
`selectorShape_v2_q_eq_v1_forces_v3`. -/
theorem selectorShape_v2_q_eq_v1_exact_packet
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) {r s : ℝ}
    (hr : 0 < r)
    (hcard : 4 ≤ (S.witnessClassAt_v1 r).card)
    (hbranch : FormBv1A2SelectorV2Qv1Packet S Z r s) :
    S.witnessClassAt_v2 s =
      insert Z.a2 (insert Z.b2 ({S.triangle.v3, S.triangle.v1} : Finset ℝ²)) := by
  classical
  let T := S.witnessClassAt_v2 s
  have hC1eq :
      T ∩ S.CP.C1 = ({S.triangle.v3} : Finset ℝ²) :=
    S.selectorShape_v2_q_eq_v1_forces_v3 (Z := Z) (r := r) (s := s) hr hcard hbranch
  rcases hbranch with ⟨⟨-, _, _⟩, _, hpacket⟩
  rcases hpacket with ⟨hTcard, hI2sub, _, _, _, hqeq⟩
  have ha2I2 : Z.a2 ∈ S.I2 := by
    rw [Z.hI2]
    simp
  have hb2I2 : Z.b2 ∈ S.I2 := by
    rw [Z.hI2]
    simp
  have ha2T : Z.a2 ∈ T := hI2sub ha2I2
  have hb2T : Z.b2 ∈ T := hI2sub hb2I2
  have hv3T : S.triangle.v3 ∈ T := by
    have hv3mem : S.triangle.v3 ∈ ({S.triangle.v3} : Finset ℝ²) := by simp
    rw [← hC1eq] at hv3mem
    exact (Finset.mem_inter.mp hv3mem).1
  have hv1T : S.triangle.v1 ∈ T := by
    have hv1mem : S.triangle.v1 ∈ ({S.triangle.v1} : Finset ℝ²) := by simp
    rw [← hqeq] at hv1mem
    exact (Finset.mem_inter.mp hv1mem).1
  have ha2_ne_b2 : Z.a2 ≠ Z.b2 := by
    have hI2card : ({Z.a2, Z.b2} : Finset ℝ²).card = 2 := by
      simpa [Z.hI2] using S.I2_card_eq_two
    intro h
    simp [h] at hI2card
  have ha2_ne_v1 : Z.a2 ≠ S.triangle.v1 := by
    unfold Problem97.FiniteEndpointShell.I2 at ha2I2
    exact (Finset.mem_erase.mp ha2I2).1
  have hb2_ne_v1 : Z.b2 ≠ S.triangle.v1 := by
    unfold Problem97.FiniteEndpointShell.I2 at hb2I2
    exact (Finset.mem_erase.mp hb2I2).1
  have ha2_ne_v3 : Z.a2 ≠ S.triangle.v3 := by
    unfold Problem97.FiniteEndpointShell.I2 at ha2I2
    exact (Finset.mem_erase.mp (Finset.mem_erase.mp ha2I2).2).1
  have hb2_ne_v3 : Z.b2 ≠ S.triangle.v3 := by
    unfold Problem97.FiniteEndpointShell.I2 at hb2I2
    exact (Finset.mem_erase.mp (Finset.mem_erase.mp hb2I2).2).1
  have hUsub :
      insert Z.a2 (insert Z.b2 ({S.triangle.v3, S.triangle.v1} : Finset ℝ²)) ⊆ T := by
    intro x hx
    simp at hx
    rcases hx with rfl | rfl | rfl | rfl
    · exact ha2T
    · exact hb2T
    · exact hv3T
    · exact hv1T
  have hUcard :
      (insert Z.a2 (insert Z.b2 ({S.triangle.v3, S.triangle.v1} : Finset ℝ²))).card = 4 := by
    simp [ha2_ne_b2, ha2_ne_v1, hb2_ne_v1, ha2_ne_v3, hb2_ne_v3, S.triangle.v13_ne,
      S.triangle.v13_ne.symm]
  have hTle :
      T.card ≤ (insert Z.a2 (insert Z.b2 ({S.triangle.v3, S.triangle.v1} : Finset ℝ²))).card := by
    rw [hTcard, hUcard]
  exact (Finset.eq_of_subset_of_card_le hUsub hTle).symm

/-- The `x = b₂`, `q = v₁` row is the already-closed `x = a₂`, `q = v₁` row
after swapping the two names of `I₂`.  So the same shared-circle argument
forces the named `C₁` witness in `S(v₂)` to be `v₃`. -/
theorem selectorShape_v2_q_eq_v1_forces_v3_of_b2
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) {r s : ℝ}
    (hr : 0 < r)
    (hcard : 4 ≤ (S.witnessClassAt_v1 r).card)
    (hbranch : FormBv1B2SelectorV2Qv1Packet S Z r s) :
    S.witnessClassAt_v2 s ∩ S.CP.C1 = ({S.triangle.v3} : Finset ℝ²) := by
  rcases hbranch with ⟨⟨hb2I2, hb2eq, hv2eq⟩, hs, hpacket⟩
  have hbranch' : FormBv1A2SelectorV2Qv1Packet S (Z.swapI2) r s := by
    refine ⟨?_, hs, ?_⟩
    · refine ⟨?_, ?_, ?_⟩
      · simpa [ZeroDefectCapLayout.swapI2] using hb2I2
      · simpa [FormBv1A2Packet, ZeroDefectCapLayout.swapI2] using hb2eq
      · simpa [FormBv1A2Packet, ZeroDefectCapLayout.swapI2] using hv2eq
    · simpa [SelectorV2Qv1Packet, ZeroDefectCapLayout.swapI2] using hpacket
  simpa [ZeroDefectCapLayout.swapI2] using
    (S.selectorShape_v2_q_eq_v1_forces_v3 (Z := Z.swapI2) (r := r) (s := s) hr hcard hbranch')

/-- The `x = b₂`, `q = v₁` row also upgrades to the same exact packet
`S(v₂) = {a₂,b₂,v₃,v₁}` by the same `I₂`-swap reuse. -/
theorem selectorShape_v2_q_eq_v1_exact_packet_of_b2
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) {r s : ℝ}
    (hr : 0 < r)
    (hcard : 4 ≤ (S.witnessClassAt_v1 r).card)
    (hbranch : FormBv1B2SelectorV2Qv1Packet S Z r s) :
    S.witnessClassAt_v2 s =
      insert Z.a2 (insert Z.b2 ({S.triangle.v3, S.triangle.v1} : Finset ℝ²)) := by
  rcases hbranch with ⟨⟨hb2I2, hb2eq, hv2eq⟩, hs, hpacket⟩
  have hbranch' : FormBv1A2SelectorV2Qv1Packet S (Z.swapI2) r s := by
    refine ⟨?_, hs, ?_⟩
    · refine ⟨?_, ?_, ?_⟩
      · simpa [ZeroDefectCapLayout.swapI2] using hb2I2
      · simpa [FormBv1A2Packet, ZeroDefectCapLayout.swapI2] using hb2eq
      · simpa [FormBv1A2Packet, ZeroDefectCapLayout.swapI2] using hv2eq
    · simpa [SelectorV2Qv1Packet, ZeroDefectCapLayout.swapI2] using hpacket
  have hswap :=
    S.selectorShape_v2_q_eq_v1_exact_packet (Z := Z.swapI2) (r := r) (s := s) hr hcard hbranch'
  ext x
  simpa [ZeroDefectCapLayout.swapI2, hswap, Finset.mem_insert, Finset.mem_singleton,
    or_left_comm, or_assoc]

/-- The strict long-side export for the `x = b₂`, `q = v₁` branch is again
the already-proved `a₂` theorem after swapping the `I₂` names. -/
theorem v1v3_longer_than_base_of_exact_packet_of_b2
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) {r s : ℝ}
    (hbranch : FormBv1B2SelectorV2Qv1Packet S Z r s)
    (hexact : S.witnessClassAt_v2 s =
      insert Z.a2 (insert Z.b2 ({S.triangle.v3, S.triangle.v1} : Finset ℝ²))) :
    dist S.triangle.v1 S.triangle.v2 < dist S.triangle.v1 S.triangle.v3 := by
  rcases hbranch with ⟨⟨hb2I2, hb2eq, hv2eq⟩, hs, hpacket⟩
  have hbranch' : FormBv1A2SelectorV2Qv1Packet S (Z.swapI2) r s := by
    refine ⟨?_, hs, ?_⟩
    · refine ⟨?_, ?_, ?_⟩
      · simpa [ZeroDefectCapLayout.swapI2] using hb2I2
      · simpa [FormBv1A2Packet, ZeroDefectCapLayout.swapI2] using hb2eq
      · simpa [FormBv1A2Packet, ZeroDefectCapLayout.swapI2] using hv2eq
    · simpa [SelectorV2Qv1Packet, ZeroDefectCapLayout.swapI2] using hpacket
  have hswap :
      S.witnessClassAt_v2 s =
        insert (Z.swapI2).a2
          (insert (Z.swapI2).b2 ({S.triangle.v3, S.triangle.v1} : Finset ℝ²)) := by
    ext x
    simpa [ZeroDefectCapLayout.swapI2, hexact, Finset.mem_insert, Finset.mem_singleton,
      or_left_comm, or_assoc]
  simpa [ZeroDefectCapLayout.swapI2] using
    (S.v1v3_longer_than_base_of_exact_packet (Z := Z.swapI2) hbranch' hswap)

/-- `N4d-bB1-3`: once the `x = b₂`, `q = v₁` branch has been upgraded to the
exact packet, the `q' = A` column of the `v₃` selector is impossible by the
same distance-chain contradiction used earlier. -/
theorem selectorShape_v3_q_eq_v1_impossible_of_b2_exact_packet
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) {r s t : ℝ}
    (hbranch : FormBv1B2SelectorV2Qv1Packet S Z r s)
    (hexact : S.witnessClassAt_v2 s =
      insert Z.a2 (insert Z.b2 ({S.triangle.v3, S.triangle.v1} : Finset ℝ²)))
    (hpacket3 : SelectorV3Qv1Packet S Z t) :
    False := by
  have hlong := S.v1v3_longer_than_base_of_exact_packet_of_b2 Z hbranch hexact
  have hv3T : S.triangle.v3 ∈ S.witnessClassAt_v2 s := by
    have hv3mem : S.triangle.v3 ∈ ({S.triangle.v3} : Finset ℝ²) := by simp
    simpa [hexact] using hv3mem
  have hv1T : S.triangle.v1 ∈ S.witnessClassAt_v2 s := by
    have hv1mem : S.triangle.v1 ∈ ({S.triangle.v1} : Finset ℝ²) := by simp
    simpa [hexact] using hv1mem
  have hv3dist : dist S.triangle.v2 S.triangle.v3 = s := by
    simpa using (Finset.mem_filter.mp hv3T).2
  have hv1dist : dist S.triangle.v2 S.triangle.v1 = s := by
    simpa using (Finset.mem_filter.mp hv1T).2
  have hv2v1 : dist S.triangle.v3 S.triangle.v2 < dist S.triangle.v3 S.triangle.v1 := by
    calc
      dist S.triangle.v3 S.triangle.v2 = dist S.triangle.v2 S.triangle.v3 := by rw [dist_comm]
      _ = dist S.triangle.v2 S.triangle.v1 := by rw [hv3dist, hv1dist]
      _ = dist S.triangle.v1 S.triangle.v2 := by rw [dist_comm]
      _ < dist S.triangle.v1 S.triangle.v3 := hlong
      _ = dist S.triangle.v3 S.triangle.v1 := by rw [dist_comm]
  exact S.selectorShape_v3_q_eq_v1_impossible Z hpacket3 hv2v1


/-- `Q3-22` at `v₁`: once the exact `(4,4,4)` shell and core selector are in
place, any escaped Moser-apex `4`-class at `v₁` has one of the three
documented forms. -/
theorem n4c_forms_v1
    {A : Finset ℝ²} (S : FiniteEndpointShell A) {r : ℝ}
    (hr : 0 < r) (hcard : 4 ≤ (S.witnessClassAt_v1 r).card)
    (hesc : ¬ S.witnessClassAt_v1 r ⊆ S.CP.C1) :
    S.IsFormA_v1 r ∨ S.IsFormB_v1 r ∨ S.IsFormC_v1 r := by
  classical
  let T : Finset ℝ² := S.witnessClassAt_v1 r
  have hcore := S.coreSelector_v1 hr hcard
  rcases hcore with ⟨hTcard, hI1sub, hC2le, hC3le⟩
  have hTcard' : T.card = 4 := by simpa [T] using hTcard
  have hC2le' : (T ∩ S.CP.C2).card ≤ 1 := by simpa [T] using hC2le
  have hC3le' : (T ∩ S.CP.C3).card ≤ 1 := by simpa [T] using hC3le
  have hI1two : S.I1.card = 2 := S.I1_card_eq_two
  have hI1sub' : S.I1 ⊆ T ∩ S.I1 := by
    intro z hz
    exact Finset.mem_inter.mpr ⟨hI1sub hz, hz⟩
  have hTminus_eq_two : (T \ S.I1).card = 2 := by
    have hsplit : (T \ S.I1).card + (T ∩ S.I1).card = T.card := by
      simpa [T, Finset.inter_comm] using Finset.card_sdiff_add_card_inter T S.I1
    have hI1ge : S.I1.card ≤ (T ∩ S.I1).card := Finset.card_le_card hI1sub'
    have hI1le : (T ∩ S.I1).card ≤ S.I1.card := Finset.card_le_card Finset.inter_subset_right
    omega
  have hcover :
      T \ S.I1 ⊆ (T ∩ S.CP.C2) ∪ (T ∩ S.CP.C3) := by
    intro x hx
    rcases Finset.mem_sdiff.mp hx with ⟨hxT, hxnotI1⟩
    have hxA : x ∈ A := (Finset.mem_filter.mp hxT).1
    by_cases hxv3 : x = S.triangle.v3
    · apply Finset.mem_union_left
      exact Finset.mem_inter.mpr ⟨hxT, by simpa [hxv3] using S.CP.v3_mem_C2⟩
    by_cases hxv2 : x = S.triangle.v2
    · apply Finset.mem_union_right
      exact Finset.mem_inter.mpr ⟨hxT, by simpa [hxv2] using S.CP.v2_mem_C3⟩
    by_cases hxv1 : x = S.triangle.v1
    · have hv1not : S.triangle.v1 ∉ T := by
        intro hv1T
        have hv1eq : dist S.triangle.v1 S.triangle.v1 = r :=
          (Finset.mem_filter.mp hv1T).2
        have h0r : (0 : ℝ) = r := by simpa using hv1eq
        nlinarith
      exact False.elim (hv1not (hxv1 ▸ hxT))
    have hxnonmoser : x ∉ S.triangle.verts := by
      simp [Problem97.MoserTriangle.verts, hxv1, hxv2, hxv3]
    have hxnotC1 : x ∉ S.CP.C1 := by
      intro hxC1
      have hxI1 : x ∈ S.I1 := by
        unfold I1
        exact Finset.mem_erase.mpr ⟨hxv3, Finset.mem_erase.mpr ⟨hxv2, hxC1⟩⟩
      exact hxnotI1 hxI1
    have hone := S.CP.nonmoser_in_one x hxA hxnonmoser
    by_cases hxC2 : x ∈ S.CP.C2
    · exact Finset.mem_union.mpr (Or.inl (Finset.mem_inter.mpr ⟨hxT, hxC2⟩))
    · have hxC3 : x ∈ S.CP.C3 := by
        by_cases hxC3 : x ∈ S.CP.C3
        · exact hxC3
        · have : (0 : ℕ) = 1 := by
            simpa [hxnotC1, hxC2, hxC3] using hone
          omega
      exact Finset.mem_union.mpr (Or.inr (Finset.mem_inter.mpr ⟨hxT, hxC3⟩))
  have hUnion_le :
      ((T ∩ S.CP.C2) ∪ (T ∩ S.CP.C3)).card ≤ 2 := by
    calc
      ((T ∩ S.CP.C2) ∪ (T ∩ S.CP.C3)).card
          ≤ (T ∩ S.CP.C2).card + (T ∩ S.CP.C3).card := Finset.card_union_le _ _
      _ ≤ 1 + 1 := by omega
      _ = 2 := by norm_num
  have hUnion_eq_two :
      ((T ∩ S.CP.C2) ∪ (T ∩ S.CP.C3)).card = 2 := by
    have hTminus_le : (T \ S.I1).card ≤ ((T ∩ S.CP.C2) ∪ (T ∩ S.CP.C3)).card :=
      Finset.card_le_card hcover
    omega
  have hsum_eq_two : (T ∩ S.CP.C2).card + (T ∩ S.CP.C3).card = 2 := by
    have hUnion_le_sum : ((T ∩ S.CP.C2) ∪ (T ∩ S.CP.C3)).card ≤
        (T ∩ S.CP.C2).card + (T ∩ S.CP.C3).card := Finset.card_union_le _ _
    omega
  have hC2eq1 : (T ∩ S.CP.C2).card = 1 := by
    omega
  have hC3eq1 : (T ∩ S.CP.C3).card = 1 := by
    omega
  obtain ⟨x, hxeq⟩ := Finset.card_eq_one.mp hC2eq1
  obtain ⟨y, hyeq⟩ := Finset.card_eq_one.mp hC3eq1
  have hxT : x ∈ T := by
    have hxmem : x ∈ ({x} : Finset ℝ²) := by simp
    rw [← hxeq] at hxmem
    exact (Finset.mem_inter.mp hxmem).1
  have hyT : y ∈ T := by
    have hymem : y ∈ ({y} : Finset ℝ²) := by simp
    rw [← hyeq] at hymem
    exact (Finset.mem_inter.mp hymem).1
  have hxC2 : x ∈ S.CP.C2 := by
    have hxmem : x ∈ ({x} : Finset ℝ²) := by simp
    rw [← hxeq] at hxmem
    exact (Finset.mem_inter.mp hxmem).2
  have hyC3 : y ∈ S.CP.C3 := by
    have hymem : y ∈ ({y} : Finset ℝ²) := by simp
    rw [← hyeq] at hymem
    exact (Finset.mem_inter.mp hymem).2
  have hv1notT : S.triangle.v1 ∉ T := by
    intro hv1T
    have hv1eq : dist S.triangle.v1 S.triangle.v1 = r := (Finset.mem_filter.mp hv1T).2
    have h0r : (0 : ℝ) = r := by simpa using hv1eq
    nlinarith
  have hx_ne_v1 : x ≠ S.triangle.v1 := by
    intro h
    exact hv1notT (h ▸ hxT)
  have hy_ne_v1 : y ≠ S.triangle.v1 := by
    intro h
    exact hv1notT (h ▸ hyT)
  by_cases hxv3 : x = S.triangle.v3
  · by_cases hyv2 : y = S.triangle.v2
    · have hsubC1 : T ⊆ S.CP.C1 := by
        intro z hz
        by_cases hzI1 : z ∈ S.I1
        · unfold I1 at hzI1
          exact (Finset.mem_erase.mp (Finset.mem_erase.mp hzI1).2).2
        · have hzout : z ∈ T \ S.I1 := Finset.mem_sdiff.mpr ⟨hz, hzI1⟩
          have hzcover := hcover hzout
          rcases Finset.mem_union.mp hzcover with hzC2 | hzC3
          · have : z = x := by
              rw [hxeq] at hzC2
              simpa using hzC2
            simpa [this, hxv3] using S.CP.v3_mem_C1
          · have : z = y := by
              rw [hyeq] at hzC3
              simpa using hzC3
            simpa [this, hyv2] using S.CP.v2_mem_C1
      exact False.elim (hesc hsubC1)
    · have hyI3 : y ∈ S.I3 := by
        unfold I3
        exact Finset.mem_erase.mpr ⟨hyv2, Finset.mem_erase.mpr ⟨hy_ne_v1, hyC3⟩⟩
      exact Or.inr (Or.inr ⟨y, hyI3, by simpa [T, hxv3] using hxeq, by simpa [T] using hyeq⟩)
  · by_cases hyv2 : y = S.triangle.v2
    · have hxI2 : x ∈ S.I2 := by
        unfold I2
        exact Finset.mem_erase.mpr ⟨hx_ne_v1, Finset.mem_erase.mpr ⟨hxv3, hxC2⟩⟩
      exact Or.inr (Or.inl ⟨x, hxI2, by simpa [T] using hxeq, by simpa [T, hyv2] using hyeq⟩)
    · have hxI2 : x ∈ S.I2 := by
        unfold I2
        exact Finset.mem_erase.mpr ⟨hx_ne_v1, Finset.mem_erase.mpr ⟨hxv3, hxC2⟩⟩
      have hyI3 : y ∈ S.I3 := by
        unfold I3
        exact Finset.mem_erase.mpr ⟨hyv2, Finset.mem_erase.mpr ⟨hy_ne_v1, hyC3⟩⟩
      exact Or.inl ⟨x, y, hxI2, hyI3, by simpa [T] using hxeq, by simpa [T] using hyeq⟩

/-- `Q3-22` at `v₂`: once the exact `(4,4,4)` shell and core selector are in
place, any escaped Moser-apex `4`-class at `v₂` has one of the three
documented forms. -/
theorem n4c_forms_v2
    {A : Finset ℝ²} (S : FiniteEndpointShell A) {r : ℝ}
    (hr : 0 < r) (hcard : 4 ≤ (S.witnessClassAt_v2 r).card)
    (hesc : ¬ S.witnessClassAt_v2 r ⊆ S.CP.C2) :
    S.IsFormA_v2 r ∨ S.IsFormB_v2 r ∨ S.IsFormC_v2 r := by
  classical
  let T : Finset ℝ² := S.witnessClassAt_v2 r
  have hcore := S.coreSelector_v2 hr hcard
  rcases hcore with ⟨hTcard, hI2sub, hC1le, hC3le⟩
  have hTcard' : T.card = 4 := by simpa [T] using hTcard
  have hC1le' : (T ∩ S.CP.C1).card ≤ 1 := by simpa [T] using hC1le
  have hC3le' : (T ∩ S.CP.C3).card ≤ 1 := by simpa [T] using hC3le
  have hI2two : S.I2.card = 2 := S.I2_card_eq_two
  have hI2sub' : S.I2 ⊆ T ∩ S.I2 := by
    intro z hz
    exact Finset.mem_inter.mpr ⟨hI2sub hz, hz⟩
  have hTminus_eq_two : (T \ S.I2).card = 2 := by
    have hsplit : (T \ S.I2).card + (T ∩ S.I2).card = T.card := by
      simpa [T, Finset.inter_comm] using Finset.card_sdiff_add_card_inter T S.I2
    have hI2ge : S.I2.card ≤ (T ∩ S.I2).card := Finset.card_le_card hI2sub'
    have hI2le : (T ∩ S.I2).card ≤ S.I2.card := Finset.card_le_card Finset.inter_subset_right
    omega
  have hcover :
      T \ S.I2 ⊆ (T ∩ S.CP.C1) ∪ (T ∩ S.CP.C3) := by
    intro x hx
    rcases Finset.mem_sdiff.mp hx with ⟨hxT, hxnotI2⟩
    have hxA : x ∈ A := (Finset.mem_filter.mp hxT).1
    by_cases hxv1 : x = S.triangle.v1
    · apply Finset.mem_union_right
      exact Finset.mem_inter.mpr ⟨hxT, by simpa [hxv1] using S.CP.v1_mem_C3⟩
    by_cases hxv3 : x = S.triangle.v3
    · apply Finset.mem_union_left
      exact Finset.mem_inter.mpr ⟨hxT, by simpa [hxv3] using S.CP.v3_mem_C1⟩
    by_cases hxv2 : x = S.triangle.v2
    · have hv2not : S.triangle.v2 ∉ T := by
        intro hv2T
        have hv2eq : dist S.triangle.v2 S.triangle.v2 = r :=
          (Finset.mem_filter.mp hv2T).2
        have h0r : (0 : ℝ) = r := by simpa using hv2eq
        nlinarith
      exact False.elim (hv2not (hxv2 ▸ hxT))
    have hxnonmoser : x ∉ S.triangle.verts := by
      simp [Problem97.MoserTriangle.verts, hxv1, hxv2, hxv3]
    have hxnotC2 : x ∉ S.CP.C2 := by
      intro hxC2
      have hxI2 : x ∈ S.I2 := by
        unfold I2
        exact Finset.mem_erase.mpr ⟨hxv1, Finset.mem_erase.mpr ⟨hxv3, hxC2⟩⟩
      exact hxnotI2 hxI2
    have hone := S.CP.nonmoser_in_one x hxA hxnonmoser
    by_cases hxC1 : x ∈ S.CP.C1
    · exact Finset.mem_union.mpr (Or.inl (Finset.mem_inter.mpr ⟨hxT, hxC1⟩))
    · have hxC3 : x ∈ S.CP.C3 := by
        by_cases hxC3 : x ∈ S.CP.C3
        · exact hxC3
        · have : (0 : ℕ) = 1 := by
            simpa [hxC1, hxnotC2, hxC3] using hone
          omega
      exact Finset.mem_union.mpr (Or.inr (Finset.mem_inter.mpr ⟨hxT, hxC3⟩))
  have hUnion_le :
      ((T ∩ S.CP.C1) ∪ (T ∩ S.CP.C3)).card ≤ 2 := by
    calc
      ((T ∩ S.CP.C1) ∪ (T ∩ S.CP.C3)).card
          ≤ (T ∩ S.CP.C1).card + (T ∩ S.CP.C3).card := Finset.card_union_le _ _
      _ ≤ 1 + 1 := by omega
      _ = 2 := by norm_num
  have hUnion_eq_two :
      ((T ∩ S.CP.C1) ∪ (T ∩ S.CP.C3)).card = 2 := by
    have hTminus_le : (T \ S.I2).card ≤ ((T ∩ S.CP.C1) ∪ (T ∩ S.CP.C3)).card :=
      Finset.card_le_card hcover
    omega
  have hsum_eq_two : (T ∩ S.CP.C1).card + (T ∩ S.CP.C3).card = 2 := by
    have hUnion_le_sum : ((T ∩ S.CP.C1) ∪ (T ∩ S.CP.C3)).card ≤
        (T ∩ S.CP.C1).card + (T ∩ S.CP.C3).card := Finset.card_union_le _ _
    omega
  have hC1eq1 : (T ∩ S.CP.C1).card = 1 := by omega
  have hC3eq1 : (T ∩ S.CP.C3).card = 1 := by omega
  obtain ⟨y, hyeq⟩ := Finset.card_eq_one.mp hC1eq1
  obtain ⟨x, hxeq⟩ := Finset.card_eq_one.mp hC3eq1
  have hxT : x ∈ T := by
    have hxmem : x ∈ ({x} : Finset ℝ²) := by simp
    rw [← hxeq] at hxmem
    exact (Finset.mem_inter.mp hxmem).1
  have hyT : y ∈ T := by
    have hymem : y ∈ ({y} : Finset ℝ²) := by simp
    rw [← hyeq] at hymem
    exact (Finset.mem_inter.mp hymem).1
  have hxC3 : x ∈ S.CP.C3 := by
    have hxmem : x ∈ ({x} : Finset ℝ²) := by simp
    rw [← hxeq] at hxmem
    exact (Finset.mem_inter.mp hxmem).2
  have hyC1 : y ∈ S.CP.C1 := by
    have hymem : y ∈ ({y} : Finset ℝ²) := by simp
    rw [← hyeq] at hymem
    exact (Finset.mem_inter.mp hymem).2
  have hv2notT : S.triangle.v2 ∉ T := by
    intro hv2T
    have hv2eq : dist S.triangle.v2 S.triangle.v2 = r := (Finset.mem_filter.mp hv2T).2
    have h0r : (0 : ℝ) = r := by simpa using hv2eq
    nlinarith
  have hx_ne_v2 : x ≠ S.triangle.v2 := by
    intro h
    exact hv2notT (h ▸ hxT)
  have hy_ne_v2 : y ≠ S.triangle.v2 := by
    intro h
    exact hv2notT (h ▸ hyT)
  by_cases hxv1 : x = S.triangle.v1
  · by_cases hyv3 : y = S.triangle.v3
    · have hsubC2 : T ⊆ S.CP.C2 := by
        intro z hz
        by_cases hzI2 : z ∈ S.I2
        · unfold I2 at hzI2
          exact (Finset.mem_erase.mp (Finset.mem_erase.mp hzI2).2).2
        · have hzout : z ∈ T \ S.I2 := Finset.mem_sdiff.mpr ⟨hz, hzI2⟩
          have hzcover := hcover hzout
          rcases Finset.mem_union.mp hzcover with hzC1 | hzC3
          · have : z = y := by
              rw [hyeq] at hzC1
              simpa using hzC1
            simpa [this, hyv3] using S.CP.v3_mem_C2
          · have : z = x := by
              rw [hxeq] at hzC3
              simpa using hzC3
            simpa [this, hxv1] using S.CP.v1_mem_C2
      exact False.elim (hesc hsubC2)
    · have hyI1 : y ∈ S.I1 := by
        unfold I1
        exact Finset.mem_erase.mpr ⟨hyv3, Finset.mem_erase.mpr ⟨hy_ne_v2, hyC1⟩⟩
      exact Or.inr (Or.inr ⟨y, hyI1, by simpa [T, hxv1] using hxeq, by simpa [T] using hyeq⟩)
  · by_cases hyv3 : y = S.triangle.v3
    · have hxI3 : x ∈ S.I3 := by
        unfold I3
        exact Finset.mem_erase.mpr ⟨hx_ne_v2, Finset.mem_erase.mpr ⟨hxv1, hxC3⟩⟩
      exact Or.inr (Or.inl ⟨x, hxI3, by simpa [T] using hxeq, by simpa [T, hyv3] using hyeq⟩)
    · have hxI3 : x ∈ S.I3 := by
        unfold I3
        exact Finset.mem_erase.mpr ⟨hx_ne_v2, Finset.mem_erase.mpr ⟨hxv1, hxC3⟩⟩
      have hyI1 : y ∈ S.I1 := by
        unfold I1
        exact Finset.mem_erase.mpr ⟨hyv3, Finset.mem_erase.mpr ⟨hy_ne_v2, hyC1⟩⟩
      exact Or.inl ⟨x, y, hxI3, hyI1, by simpa [T] using hxeq, by simpa [T] using hyeq⟩

/-- `Q3-22` at `v₃`: once the exact `(4,4,4)` shell and core selector are in
place, any escaped Moser-apex `4`-class at `v₃` has one of the three
documented forms. -/
theorem n4c_forms_v3
    {A : Finset ℝ²} (S : FiniteEndpointShell A) {r : ℝ}
    (hr : 0 < r) (hcard : 4 ≤ (S.witnessClassAt_v3 r).card)
    (hesc : ¬ S.witnessClassAt_v3 r ⊆ S.CP.C3) :
    S.IsFormA_v3 r ∨ S.IsFormB_v3 r ∨ S.IsFormC_v3 r := by
  classical
  let T : Finset ℝ² := S.witnessClassAt_v3 r
  have hcore := S.coreSelector_v3 hr hcard
  rcases hcore with ⟨hTcard, hI3sub, hC1le, hC2le⟩
  have hTcard' : T.card = 4 := by simpa [T] using hTcard
  have hC1le' : (T ∩ S.CP.C1).card ≤ 1 := by simpa [T] using hC1le
  have hC2le' : (T ∩ S.CP.C2).card ≤ 1 := by simpa [T] using hC2le
  have hI3two : S.I3.card = 2 := S.I3_card_eq_two
  have hI3sub' : S.I3 ⊆ T ∩ S.I3 := by
    intro z hz
    exact Finset.mem_inter.mpr ⟨hI3sub hz, hz⟩
  have hTminus_eq_two : (T \ S.I3).card = 2 := by
    have hsplit : (T \ S.I3).card + (T ∩ S.I3).card = T.card := by
      simpa [T, Finset.inter_comm] using Finset.card_sdiff_add_card_inter T S.I3
    have hI3ge : S.I3.card ≤ (T ∩ S.I3).card := Finset.card_le_card hI3sub'
    have hI3le : (T ∩ S.I3).card ≤ S.I3.card := Finset.card_le_card Finset.inter_subset_right
    omega
  have hcover :
      T \ S.I3 ⊆ (T ∩ S.CP.C1) ∪ (T ∩ S.CP.C2) := by
    intro x hx
    rcases Finset.mem_sdiff.mp hx with ⟨hxT, hxnotI3⟩
    have hxA : x ∈ A := (Finset.mem_filter.mp hxT).1
    by_cases hxv2 : x = S.triangle.v2
    · apply Finset.mem_union_left
      exact Finset.mem_inter.mpr ⟨hxT, by simpa [hxv2] using S.CP.v2_mem_C1⟩
    by_cases hxv1 : x = S.triangle.v1
    · apply Finset.mem_union_right
      exact Finset.mem_inter.mpr ⟨hxT, by simpa [hxv1] using S.CP.v1_mem_C2⟩
    by_cases hxv3 : x = S.triangle.v3
    · have hv3not : S.triangle.v3 ∉ T := by
        intro hv3T
        have hv3eq : dist S.triangle.v3 S.triangle.v3 = r :=
          (Finset.mem_filter.mp hv3T).2
        have h0r : (0 : ℝ) = r := by simpa using hv3eq
        nlinarith
      exact False.elim (hv3not (hxv3 ▸ hxT))
    have hxnonmoser : x ∉ S.triangle.verts := by
      simp [Problem97.MoserTriangle.verts, hxv1, hxv2, hxv3]
    have hxnotC3 : x ∉ S.CP.C3 := by
      intro hxC3
      have hxI3 : x ∈ S.I3 := by
        unfold I3
        exact Finset.mem_erase.mpr ⟨hxv2, Finset.mem_erase.mpr ⟨hxv1, hxC3⟩⟩
      exact hxnotI3 hxI3
    have hone := S.CP.nonmoser_in_one x hxA hxnonmoser
    by_cases hxC1 : x ∈ S.CP.C1
    · exact Finset.mem_union.mpr (Or.inl (Finset.mem_inter.mpr ⟨hxT, hxC1⟩))
    · have hxC2 : x ∈ S.CP.C2 := by
        by_cases hxC2 : x ∈ S.CP.C2
        · exact hxC2
        · have : (0 : ℕ) = 1 := by
            simpa [hxC1, hxC2, hxnotC3] using hone
          omega
      exact Finset.mem_union.mpr (Or.inr (Finset.mem_inter.mpr ⟨hxT, hxC2⟩))
  have hUnion_le :
      ((T ∩ S.CP.C1) ∪ (T ∩ S.CP.C2)).card ≤ 2 := by
    calc
      ((T ∩ S.CP.C1) ∪ (T ∩ S.CP.C2)).card
          ≤ (T ∩ S.CP.C1).card + (T ∩ S.CP.C2).card := Finset.card_union_le _ _
      _ ≤ 1 + 1 := by omega
      _ = 2 := by norm_num
  have hUnion_eq_two :
      ((T ∩ S.CP.C1) ∪ (T ∩ S.CP.C2)).card = 2 := by
    have hTminus_le : (T \ S.I3).card ≤ ((T ∩ S.CP.C1) ∪ (T ∩ S.CP.C2)).card :=
      Finset.card_le_card hcover
    omega
  have hsum_eq_two : (T ∩ S.CP.C1).card + (T ∩ S.CP.C2).card = 2 := by
    have hUnion_le_sum : ((T ∩ S.CP.C1) ∪ (T ∩ S.CP.C2)).card ≤
        (T ∩ S.CP.C1).card + (T ∩ S.CP.C2).card := Finset.card_union_le _ _
    omega
  have hC1eq1 : (T ∩ S.CP.C1).card = 1 := by omega
  have hC2eq1 : (T ∩ S.CP.C2).card = 1 := by omega
  obtain ⟨x, hxeq⟩ := Finset.card_eq_one.mp hC1eq1
  obtain ⟨y, hyeq⟩ := Finset.card_eq_one.mp hC2eq1
  have hxT : x ∈ T := by
    have hxmem : x ∈ ({x} : Finset ℝ²) := by simp
    rw [← hxeq] at hxmem
    exact (Finset.mem_inter.mp hxmem).1
  have hyT : y ∈ T := by
    have hymem : y ∈ ({y} : Finset ℝ²) := by simp
    rw [← hyeq] at hymem
    exact (Finset.mem_inter.mp hymem).1
  have hxC1 : x ∈ S.CP.C1 := by
    have hxmem : x ∈ ({x} : Finset ℝ²) := by simp
    rw [← hxeq] at hxmem
    exact (Finset.mem_inter.mp hxmem).2
  have hyC2 : y ∈ S.CP.C2 := by
    have hymem : y ∈ ({y} : Finset ℝ²) := by simp
    rw [← hyeq] at hymem
    exact (Finset.mem_inter.mp hymem).2
  have hv3notT : S.triangle.v3 ∉ T := by
    intro hv3T
    have hv3eq : dist S.triangle.v3 S.triangle.v3 = r := (Finset.mem_filter.mp hv3T).2
    have h0r : (0 : ℝ) = r := by simpa using hv3eq
    nlinarith
  have hx_ne_v3 : x ≠ S.triangle.v3 := by
    intro h
    exact hv3notT (h ▸ hxT)
  have hy_ne_v3 : y ≠ S.triangle.v3 := by
    intro h
    exact hv3notT (h ▸ hyT)
  by_cases hxv2 : x = S.triangle.v2
  · by_cases hyv1 : y = S.triangle.v1
    · have hsubC3 : T ⊆ S.CP.C3 := by
        intro z hz
        by_cases hzI3 : z ∈ S.I3
        · unfold I3 at hzI3
          exact (Finset.mem_erase.mp (Finset.mem_erase.mp hzI3).2).2
        · have hzout : z ∈ T \ S.I3 := Finset.mem_sdiff.mpr ⟨hz, hzI3⟩
          have hzcover := hcover hzout
          rcases Finset.mem_union.mp hzcover with hzC1 | hzC2
          · have : z = x := by
              rw [hxeq] at hzC1
              simpa using hzC1
            simpa [this, hxv2] using S.CP.v2_mem_C3
          · have : z = y := by
              rw [hyeq] at hzC2
              simpa using hzC2
            simpa [this, hyv1] using S.CP.v1_mem_C3
      exact False.elim (hesc hsubC3)
    · have hyI2 : y ∈ S.I2 := by
        unfold I2
        exact Finset.mem_erase.mpr ⟨hyv1, Finset.mem_erase.mpr ⟨hy_ne_v3, hyC2⟩⟩
      exact Or.inr (Or.inr ⟨y, hyI2, by simpa [T, hxv2] using hxeq, by simpa [T] using hyeq⟩)
  · by_cases hyv1 : y = S.triangle.v1
    · have hxI1 : x ∈ S.I1 := by
        unfold I1
        exact Finset.mem_erase.mpr ⟨hx_ne_v3, Finset.mem_erase.mpr ⟨hxv2, hxC1⟩⟩
      exact Or.inr (Or.inl ⟨x, hxI1, by simpa [T] using hxeq, by simpa [T, hyv1] using hyeq⟩)
    · have hxI1 : x ∈ S.I1 := by
        unfold I1
        exact Finset.mem_erase.mpr ⟨hx_ne_v3, Finset.mem_erase.mpr ⟨hxv2, hxC1⟩⟩
      have hyI2 : y ∈ S.I2 := by
        unfold I2
        exact Finset.mem_erase.mpr ⟨hyv1, Finset.mem_erase.mpr ⟨hy_ne_v3, hyC2⟩⟩
      exact Or.inl ⟨x, y, hxI1, hyI2, by simpa [T] using hxeq, by simpa [T] using hyeq⟩

/-- Lean-facing `N4c` interface at `v₁`: every escaped `4`-class has one of the
three documented forms. -/
abbrev N4cClassifies_v1 {A : Finset ℝ²} (S : FiniteEndpointShell A) : Type :=
  ∀ {r : ℝ}, 0 < r →
    4 ≤ (S.witnessClassAt_v1 r).card →
    ¬ S.witnessClassAt_v1 r ⊆ S.CP.C1 →
    EscapedForm

/-- Lean-facing `N4c` interface at `v₂`. -/
abbrev N4cClassifies_v2 {A : Finset ℝ²} (S : FiniteEndpointShell A) : Type :=
  ∀ {r : ℝ}, 0 < r →
    4 ≤ (S.witnessClassAt_v2 r).card →
    ¬ S.witnessClassAt_v2 r ⊆ S.CP.C2 →
    EscapedForm

/-- Lean-facing `N4c` interface at `v₃`. -/
abbrev N4cClassifies_v3 {A : Finset ℝ²} (S : FiniteEndpointShell A) : Type :=
  ∀ {r : ℝ}, 0 < r →
    4 ≤ (S.witnessClassAt_v3 r).card →
    ¬ S.witnessClassAt_v3 r ⊆ S.CP.C3 →
    EscapedForm

/-- The `v₁` `N4c` classifier exported in the theorem-facing shape used by the
`N4e` shell. -/
noncomputable def n4cClassifies_v1
    {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    S.N4cClassifies_v1 := by
  classical
  intro r hr hcard hesc
  by_cases hA : S.IsFormA_v1 r
  · exact EscapedForm.a
  · by_cases hB : S.IsFormB_v1 r
    · exact EscapedForm.b
    · have hC : S.IsFormC_v1 r := by
        rcases S.n4c_forms_v1 hr hcard hesc with hA' | hB' | hC'
        · exact False.elim (hA hA')
        · exact False.elim (hB hB')
        · exact hC'
      exact EscapedForm.c

/-- The `v₂` `N4c` classifier exported in the theorem-facing shape used by the
`N4e` shell. -/
noncomputable def n4cClassifies_v2
    {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    S.N4cClassifies_v2 := by
  classical
  intro r hr hcard hesc
  by_cases hA : S.IsFormA_v2 r
  · exact EscapedForm.a
  · by_cases hB : S.IsFormB_v2 r
    · exact EscapedForm.b
    · have hC : S.IsFormC_v2 r := by
        rcases S.n4c_forms_v2 hr hcard hesc with hA' | hB' | hC'
        · exact False.elim (hA hA')
        · exact False.elim (hB hB')
        · exact hC'
      exact EscapedForm.c

/-- The `v₃` `N4c` classifier exported in the theorem-facing shape used by the
`N4e` shell. -/
noncomputable def n4cClassifies_v3
    {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    S.N4cClassifies_v3 := by
  classical
  intro r hr hcard hesc
  by_cases hA : S.IsFormA_v3 r
  · exact EscapedForm.a
  · by_cases hB : S.IsFormB_v3 r
    · exact EscapedForm.b
    · have hC : S.IsFormC_v3 r := by
        rcases S.n4c_forms_v3 hr hcard hesc with hA' | hB' | hC'
        · exact False.elim (hA hA')
        · exact False.elim (hB hB')
        · exact hC'
      exact EscapedForm.c


/-- Lean-facing `N4d` interface at `v₁`: the classified escaped form is
geometrically impossible. -/
abbrev N4dExcludes_v1 {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (classify : S.N4cClassifies_v1) : Prop :=
  ∀ {r : ℝ} (hr : 0 < r) (hcard : 4 ≤ (S.witnessClassAt_v1 r).card)
      (hesc : ¬ S.witnessClassAt_v1 r ⊆ S.CP.C1),
    False

/-- Lean-facing `N4d` interface at `v₂`. -/
abbrev N4dExcludes_v2 {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (classify : S.N4cClassifies_v2) : Prop :=
  ∀ {r : ℝ} (hr : 0 < r) (hcard : 4 ≤ (S.witnessClassAt_v2 r).card)
      (hesc : ¬ S.witnessClassAt_v2 r ⊆ S.CP.C2),
    False

/-- Lean-facing `N4d` interface at `v₃`. -/
abbrev N4dExcludes_v3 {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (classify : S.N4cClassifies_v3) : Prop :=
  ∀ {r : ℝ} (hr : 0 < r) (hcard : 4 ≤ (S.witnessClassAt_v3 r).card)
      (hesc : ¬ S.witnessClassAt_v3 r ⊆ S.CP.C3),
    False

/-- Witness-level Form `a` exclusion at `v₁` predicate. -/
private abbrev N4dExcludesFormA_v1Pred {A : Finset ℝ²} (S : FiniteEndpointShell A) : Prop :=
  ∀ {r : ℝ} (hr : 0 < r) (hcard : 4 ≤ (S.witnessClassAt_v1 r).card)
      (hesc : ¬ S.witnessClassAt_v1 r ⊆ S.CP.C1),
    S.IsFormA_v1 r → False

/-- Lean-facing export: witness-level Form `a` exclusion at `v₁`. -/
abbrev N4dExcludesFormA_v1 {A : Finset ℝ²} (S : FiniteEndpointShell A) : Prop :=
  N4dExcludesFormA_v1Pred S

/-- Witness-level Form `b` exclusion at `v₁` predicate. -/
private abbrev N4dExcludesFormB_v1Pred {A : Finset ℝ²} (S : FiniteEndpointShell A) : Prop :=
  ∀ {r : ℝ} (hr : 0 < r) (hcard : 4 ≤ (S.witnessClassAt_v1 r).card)
      (hesc : ¬ S.witnessClassAt_v1 r ⊆ S.CP.C1),
    S.IsFormB_v1 r → False

/-- Lean-facing export: witness-level Form `b` exclusion at `v₁`. -/
abbrev N4dExcludesFormB_v1 {A : Finset ℝ²} (S : FiniteEndpointShell A) : Prop :=
  N4dExcludesFormB_v1Pred S

/-- Witness-level Form `c` exclusion at `v₁` predicate. -/
private abbrev N4dExcludesFormC_v1Pred {A : Finset ℝ²} (S : FiniteEndpointShell A) : Prop :=
  ∀ {r : ℝ} (hr : 0 < r) (hcard : 4 ≤ (S.witnessClassAt_v1 r).card)
      (hesc : ¬ S.witnessClassAt_v1 r ⊆ S.CP.C1),
    S.IsFormC_v1 r → False

/-- Lean-facing export: witness-level Form `c` exclusion at `v₁`. -/
abbrev N4dExcludesFormC_v1 {A : Finset ℝ²} (S : FiniteEndpointShell A) : Prop :=
  N4dExcludesFormC_v1Pred S

/-- Witness-level Form `a` exclusion at `v₂` predicate. -/
private abbrev N4dExcludesFormA_v2Pred {A : Finset ℝ²} (S : FiniteEndpointShell A) : Prop :=
  ∀ {r : ℝ} (hr : 0 < r) (hcard : 4 ≤ (S.witnessClassAt_v2 r).card)
      (hesc : ¬ S.witnessClassAt_v2 r ⊆ S.CP.C2),
    S.IsFormA_v2 r → False

/-- Lean-facing export: witness-level Form `a` exclusion at `v₂`. -/
abbrev N4dExcludesFormA_v2 {A : Finset ℝ²} (S : FiniteEndpointShell A) : Prop :=
  N4dExcludesFormA_v2Pred S

/-- Witness-level Form `b` exclusion at `v₂` predicate. -/
private abbrev N4dExcludesFormB_v2Pred {A : Finset ℝ²} (S : FiniteEndpointShell A) : Prop :=
  ∀ {r : ℝ} (hr : 0 < r) (hcard : 4 ≤ (S.witnessClassAt_v2 r).card)
      (hesc : ¬ S.witnessClassAt_v2 r ⊆ S.CP.C2),
    S.IsFormB_v2 r → False

/-- Lean-facing export: witness-level Form `b` exclusion at `v₂`. -/
abbrev N4dExcludesFormB_v2 {A : Finset ℝ²} (S : FiniteEndpointShell A) : Prop :=
  N4dExcludesFormB_v2Pred S

/-- Witness-level Form `c` exclusion at `v₂` predicate. -/
private abbrev N4dExcludesFormC_v2Pred {A : Finset ℝ²} (S : FiniteEndpointShell A) : Prop :=
  ∀ {r : ℝ} (hr : 0 < r) (hcard : 4 ≤ (S.witnessClassAt_v2 r).card)
      (hesc : ¬ S.witnessClassAt_v2 r ⊆ S.CP.C2),
    S.IsFormC_v2 r → False

/-- Lean-facing export: witness-level Form `c` exclusion at `v₂`. -/
abbrev N4dExcludesFormC_v2 {A : Finset ℝ²} (S : FiniteEndpointShell A) : Prop :=
  N4dExcludesFormC_v2Pred S

/-- Witness-level Form `a` exclusion at `v₃` predicate. -/
private abbrev N4dExcludesFormA_v3Pred {A : Finset ℝ²} (S : FiniteEndpointShell A) : Prop :=
  ∀ {r : ℝ} (hr : 0 < r) (hcard : 4 ≤ (S.witnessClassAt_v3 r).card)
      (hesc : ¬ S.witnessClassAt_v3 r ⊆ S.CP.C3),
    S.IsFormA_v3 r → False

/-- Lean-facing export: witness-level Form `a` exclusion at `v₃`. -/
abbrev N4dExcludesFormA_v3 {A : Finset ℝ²} (S : FiniteEndpointShell A) : Prop :=
  N4dExcludesFormA_v3Pred S

/-- Witness-level Form `b` exclusion at `v₃` predicate. -/
private abbrev N4dExcludesFormB_v3Pred {A : Finset ℝ²} (S : FiniteEndpointShell A) : Prop :=
  ∀ {r : ℝ} (hr : 0 < r) (hcard : 4 ≤ (S.witnessClassAt_v3 r).card)
      (hesc : ¬ S.witnessClassAt_v3 r ⊆ S.CP.C3),
    S.IsFormB_v3 r → False

/-- Lean-facing export: witness-level Form `b` exclusion at `v₃`. -/
abbrev N4dExcludesFormB_v3 {A : Finset ℝ²} (S : FiniteEndpointShell A) : Prop :=
  N4dExcludesFormB_v3Pred S

/-- Witness-level Form `c` exclusion at `v₃` predicate. -/
private abbrev N4dExcludesFormC_v3Pred {A : Finset ℝ²} (S : FiniteEndpointShell A) : Prop :=
  ∀ {r : ℝ} (hr : 0 < r) (hcard : 4 ≤ (S.witnessClassAt_v3 r).card)
      (hesc : ¬ S.witnessClassAt_v3 r ⊆ S.CP.C3),
    S.IsFormC_v3 r → False

/-- Lean-facing export: witness-level Form `c` exclusion at `v₃`. -/
abbrev N4dExcludesFormC_v3 {A : Finset ℝ²} (S : FiniteEndpointShell A) : Prop :=
  N4dExcludesFormC_v3Pred S

/-- `N4d` assembly at `v₁`: once Forms `a`, `b`, and `c` are each excluded,
the whole escaped-class branch is impossible. -/
theorem n4dExcludes_v1_of_forms
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (hA : S.N4dExcludesFormA_v1)
    (hB : S.N4dExcludesFormB_v1)
    (hC : S.N4dExcludesFormC_v1) :
    S.N4dExcludes_v1 S.n4cClassifies_v1 := by
  intro r hr hcard hesc
  rcases S.n4c_forms_v1 hr hcard hesc with hform | hform | hform
  · exact hA hr hcard hesc hform
  · exact hB hr hcard hesc hform
  · exact hC hr hcard hesc hform

/-- `N4d` assembly at `v₂`: once Forms `a`, `b`, and `c` are each excluded,
the whole escaped-class branch is impossible. -/
theorem n4dExcludes_v2_of_forms
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (hA : S.N4dExcludesFormA_v2)
    (hB : S.N4dExcludesFormB_v2)
    (hC : S.N4dExcludesFormC_v2) :
    S.N4dExcludes_v2 S.n4cClassifies_v2 := by
  intro r hr hcard hesc
  rcases S.n4c_forms_v2 hr hcard hesc with hform | hform | hform
  · exact hA hr hcard hesc hform
  · exact hB hr hcard hesc hform
  · exact hC hr hcard hesc hform

/-- `N4d` assembly at `v₃`: once Forms `a`, `b`, and `c` are each excluded,
the whole escaped-class branch is impossible. -/
theorem n4dExcludes_v3_of_forms
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (hA : S.N4dExcludesFormA_v3)
    (hB : S.N4dExcludesFormB_v3)
    (hC : S.N4dExcludesFormC_v3) :
    S.N4dExcludes_v3 S.n4cClassifies_v3 := by
  intro r hr hcard hesc
  rcases S.n4c_forms_v3 hr hcard hesc with hform | hform | hform
  · exact hA hr hcard hesc hform
  · exact hB hr hcard hesc hform
  · exact hC hr hcard hesc hform

/-- `Q3-26`: once `N4c` classifies escaped Moser-apex classes and `N4d`
excludes them, the theorem-facing `N4e` cap-containment export follows. -/
theorem n4eCapContainment_of_n4c_n4d
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (hClass1 : S.N4cClassifies_v1) (hClass2 : S.N4cClassifies_v2)
    (hClass3 : S.N4cClassifies_v3)
    (hExcl1 : S.N4dExcludes_v1 hClass1)
    (hExcl2 : S.N4dExcludes_v2 hClass2)
    (hExcl3 : S.N4dExcludes_v3 hClass3) :
    S.N4eCapContainment := by
  constructor
  · intro r hr hcard
    by_contra hsub
    exact hExcl1 hr hcard hsub
  constructor
  · intro r hr hcard
    by_contra hsub
    exact hExcl2 hr hcard hsub
  · intro r hr hcard
    by_contra hsub
    exact hExcl3 hr hcard hsub

/-! ### q'=E producer scratch — E-construction + hBE/hDE/hqE (in verification) -/

noncomputable def reflPt (B D q : ℝ²) : ℝ² :=
  let n2 := (D 0 - B 0)^2 + (D 1 - B 1)^2
  let k := ((q 0 - B 0)*(D 0 - B 0) + (q 1 - B 1)*(D 1 - B 1))/n2
  Problem97.CGN.vec2 (2*(B 0 + k*(D 0 - B 0)) - q 0) (2*(B 1 + k*(D 1 - B 1)) - q 1)

theorem reflPt_facts (B D q : ℝ²) (hBD : B ≠ D) :
    dist B (reflPt B D q) = dist B q ∧ dist D (reflPt B D q) = dist D q := by
  have hn : (D 0 - B 0)^2 + (D 1 - B 1)^2 ≠ 0 := by
    intro h; apply hBD
    have h0 : D 0 - B 0 = 0 := by nlinarith [sq_nonneg (D 0 - B 0), sq_nonneg (D 1 - B 1)]
    have h1 : D 1 - B 1 = 0 := by nlinarith [sq_nonneg (D 0 - B 0), sq_nonneg (D 1 - B 1)]
    have hcoord : ∀ i : Fin 2, B i = D i := by
      intro i; fin_cases i <;> simp_all <;> linarith
    ext i; exact hcoord i
  have hvz : ∀ x y : ℝ, (Problem97.CGN.vec2 x y) 0 = x :=
    fun x y => by simp [Problem97.CGN.vec2, EuclideanSpace.single_apply]
  have hvo : ∀ x y : ℝ, (Problem97.CGN.vec2 x y) 1 = y :=
    fun x y => by simp [Problem97.CGN.vec2, EuclideanSpace.single_apply]
  have key :
      dist B (reflPt B D q) ^ 2 = dist B q ^ 2 ∧
      dist D (reflPt B D q) ^ 2 = dist D q ^ 2 := by
    rw [dist_sq_eq_coord_sq_add_coord_sq, dist_sq_eq_coord_sq_add_coord_sq,
        dist_sq_eq_coord_sq_add_coord_sq, dist_sq_eq_coord_sq_add_coord_sq]
    simp only [reflPt, hvz, hvo]
    refine ⟨?_, ?_⟩ <;> · field_simp; ring
  refine ⟨?_, ?_⟩
  · nlinarith [key.1, dist_nonneg (x := B) (y := reflPt B D q), dist_nonneg (x := B) (y := q)]
  · nlinarith [key.2, dist_nonneg (x := D) (y := reflPt B D q), dist_nonneg (x := D) (y := q)]

theorem reflPt_ne_of_not_collinear (B D q : ℝ²) (hBD : B ≠ D)
    (hnc : signedArea2 q B D ≠ 0) : q ≠ reflPt B D q := by
  have hn : (D 0 - B 0)^2 + (D 1 - B 1)^2 ≠ 0 := by
    intro h; apply hBD
    have h0 : D 0 - B 0 = 0 := by nlinarith [sq_nonneg (D 0 - B 0), sq_nonneg (D 1 - B 1)]
    have h1 : D 1 - B 1 = 0 := by nlinarith [sq_nonneg (D 0 - B 0), sq_nonneg (D 1 - B 1)]
    have hcoord : ∀ i : Fin 2, B i = D i := by
      intro i; fin_cases i <;> simp_all <;> linarith
    ext i; exact hcoord i
  have hvz : ∀ x y : ℝ, (Problem97.CGN.vec2 x y) 0 = x :=
    fun x y => by simp [Problem97.CGN.vec2, EuclideanSpace.single_apply]
  have hvo : ∀ x y : ℝ, (Problem97.CGN.vec2 x y) 1 = y :=
    fun x y => by simp [Problem97.CGN.vec2, EuclideanSpace.single_apply]
  intro heq
  apply hnc
  have e0 := congrArg (fun z : ℝ² => z 0) heq.symm
  have e1 := congrArg (fun z : ℝ² => z 1) heq.symm
  simp only [reflPt, hvz, hvo] at e0 e1
  field_simp at e0 e1
  -- `e0, e1` say `q` is fixed by the reflection, i.e. `q` lies on line `BD`.
  -- Each yields `(coord of D−B) · signedArea2 = 0`; with `‖D−B‖² ≠ 0` (hn),
  -- the signed area vanishes.
  have hsa : signedArea2 q B D =
      (q 1 - B 1) * (D 0 - B 0) - (q 0 - B 0) * (D 1 - B 1) := by
    simp only [signedArea2]; ring
  have hbP : (D 1 - B 1) *
      ((q 1 - B 1) * (D 0 - B 0) - (q 0 - B 0) * (D 1 - B 1)) = 0 := by
    linear_combination e0 / 2
  have haP : (D 0 - B 0) *
      ((q 1 - B 1) * (D 0 - B 0) - (q 0 - B 0) * (D 1 - B 1)) = 0 := by
    linear_combination -e1 / 2
  rw [hsa]
  by_contra hP0
  refine hn ?_
  have ha0 : D 0 - B 0 = 0 := (mul_eq_zero.mp haP).resolve_right hP0
  have hb0 : D 1 - B 1 = 0 := (mul_eq_zero.mp hbP).resolve_right hP0
  rw [ha0, hb0]; ring

theorem signedArea2_q_v2_v3_ne {A : Finset ℝ²} (S : FiniteEndpointShell A) {q : ℝ²}
    (hqI3 : q ∈ S.I3) : signedArea2 q S.triangle.v2 S.triangle.v3 ≠ 0 := by
  classical
  have hqC3 : q ∈ S.CP.C3 := by
    unfold Problem97.FiniteEndpointShell.I3 at hqI3
    exact Finset.mem_of_mem_erase (Finset.mem_of_mem_erase hqI3)
  have hqA : q ∈ A := S.CP.C3_subset hqC3
  have hq_ne_v2 : q ≠ S.triangle.v2 := by
    unfold Problem97.FiniteEndpointShell.I3 at hqI3
    exact (Finset.mem_erase.mp hqI3).1
  have hq_ne_v3 : q ≠ S.triangle.v3 := by
    intro h; rw [h] at hqC3; exact S.CP.v3_notin_C3 hqC3
  intro hΔ
  have hcol : Collinear ℝ ({q, S.triangle.v2, S.triangle.v3} : Set ℝ²) :=
    Problem97.collinear_of_signedArea2_eq_zero q S.triangle.v2 S.triangle.v3 hΔ
  have hconv : ConvexIndep A := S.hconv
  have h2A : S.triangle.v2 ∈ A := S.triangle.v2_mem
  have h3A : S.triangle.v3 ∈ A := S.triangle.v3_mem
  rcases hcol.wbtw_or_wbtw_or_wbtw with hw | hw | hw
  · apply hconv S.triangle.v2 (by exact_mod_cast h2A)
    have hseg : S.triangle.v2 ∈ segment ℝ q S.triangle.v3 := hw.mem_segment
    rw [← convexHull_pair] at hseg
    refine convexHull_mono ?_ hseg
    intro x hx; rcases hx with rfl | hx
    · exact ⟨by exact_mod_cast hqA, by simp only [Set.mem_singleton_iff]; exact fun h => hq_ne_v2 h⟩
    · rcases hx with rfl
      exact ⟨by exact_mod_cast h3A, by simp only [Set.mem_singleton_iff]; exact fun h => S.triangle.v23_ne h.symm⟩
  · apply hconv S.triangle.v3 (by exact_mod_cast h3A)
    have hseg : S.triangle.v3 ∈ segment ℝ S.triangle.v2 q := hw.mem_segment
    rw [← convexHull_pair] at hseg
    refine convexHull_mono ?_ hseg
    intro x hx; rcases hx with rfl | hx
    · exact ⟨by exact_mod_cast h2A, by simp only [Set.mem_singleton_iff]; exact fun h => S.triangle.v23_ne h⟩
    · rcases hx with rfl
      exact ⟨by exact_mod_cast hqA, by simp only [Set.mem_singleton_iff]; exact fun h => hq_ne_v3 h⟩
  · apply hconv q (by exact_mod_cast hqA)
    have hseg : q ∈ segment ℝ S.triangle.v2 S.triangle.v3 := by
      rw [segment_symm]; exact hw.mem_segment
    rw [← convexHull_pair] at hseg
    refine convexHull_mono ?_ hseg
    intro x hx; rcases hx with rfl | hx
    · exact ⟨by exact_mod_cast h2A, by simp only [Set.mem_singleton_iff]; exact fun h => hq_ne_v2 h.symm⟩
    · rcases hx with rfl
      exact ⟨by exact_mod_cast h3A, by simp only [Set.mem_singleton_iff]; exact fun h => hq_ne_v3 h.symm⟩

end FiniteEndpointShell

end Problem97
