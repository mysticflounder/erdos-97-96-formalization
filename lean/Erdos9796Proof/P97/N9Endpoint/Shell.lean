import Erdos9796Proof.P97.Counting
import Erdos9796Proof.P97.CircumscribedMECPacket
import Erdos9796Proof.P97.Dumitrescu.L4
import Erdos9796Proof.P97.Moser.TriangleNonObtuse
import Erdos9796Proof.P97.N9Endpoint.N4a

/-!
# Section 3 endpoint shell

This file starts the axiom-free `n = 9` endpoint lane from Section 3 of
`docs/97-full-prose-proof-draft.md`.

The immediate goal is not N4/N8 geometry itself. It is the shared shell those
lemmas work inside:

* a nine-point strict-convex `K4` counterexample;
* the K4-driven exclusion of the diameter MEC branch;
* a non-obtuse circumscribed Moser triangle;
* the associated three-cap decomposition;
* the exact cap-sum identity `|C₁| + |C₂| + |C₃| = 12`;
* the circumscribed MEC packet on the chosen structural Moser triangle.

This is exactly the sanctioned input layer for the Section 3 N4/N8 contracts.
No new geometry is introduced here.
-/

open scoped EuclideanGeometry
open scoped InnerProductSpace
open Finset

namespace Problem97

/-- Section 3 shell for the axiom-free `n = 9` endpoint.

This packages the existing Lean output that is already available before the
endpoint-specific geometry begins: noncollinearity, three boundary points on
the MEC, a non-obtuse circumscribed Moser triangle, the resulting cap triple,
the exact cap-sum `12`, and the circumscribed MEC packet. -/
structure FiniteEndpointShell (A : Finset ℝ²) where
  hne : A.Nonempty
  hcard9 : A.card = 9
  hconv : ConvexIndep A
  hK4 : HasNEquidistantProperty 4 A
  hnoncol : ¬ Collinear ℝ (A : Set ℝ²)
  hbd : 3 ≤ (A.filter (fun p =>
    dist p (Problem97.MEC.mec A hne).center =
      (Problem97.MEC.mec A hne).radius)).card
  MT : Problem97.MEC.NonObtuseCircumscribedMoserTriangle A hne hnoncol
  hCirc : ∃ h12 h23 h13,
    MT.toMoserTriangle.case_split = Or.inl ⟨h12, h23, h13⟩
  CP : Problem97.CapTriple A (MT.toMoserTriangle.toStructural hCirc)
  hcapSum12 : CP.C1.card + CP.C2.card + CP.C3.card = 12
  Packet : Problem97.CircumscribedMECPacket A (MT.toMoserTriangle.toStructural hCirc)

namespace FiniteEndpointShell

/-- The structural Moser triangle carried by the shell. -/
@[reducible] def triangle {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    Problem97.MoserTriangle A :=
  S.MT.toMoserTriangle.toStructural S.hCirc

/-- The cyclic rotation of the shell triangle with apex `v₂`. -/
@[reducible] def triangle2 {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    Problem97.MoserTriangle A :=
  { v1 := S.triangle.v2
    v2 := S.triangle.v3
    v3 := S.triangle.v1
    v1_mem := S.triangle.v2_mem
    v2_mem := S.triangle.v3_mem
    v3_mem := S.triangle.v1_mem
    v12_ne := S.triangle.v23_ne
    v13_ne := S.triangle.v12_ne.symm
    v23_ne := S.triangle.v13_ne.symm }

/-- The cyclic rotation of the shell triangle with apex `v₃`. -/
@[reducible] def triangle3 {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    Problem97.MoserTriangle A :=
  { v1 := S.triangle.v3
    v2 := S.triangle.v1
    v3 := S.triangle.v2
    v1_mem := S.triangle.v3_mem
    v2_mem := S.triangle.v1_mem
    v3_mem := S.triangle.v2_mem
    v12_ne := S.triangle.v13_ne.symm
    v13_ne := S.triangle.v23_ne.symm
    v23_ne := S.triangle.v12_ne }

/-- The shell packet rotated to `triangle2`. -/
@[reducible] def packet2 {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    Problem97.CircumscribedMECPacket A S.triangle2 :=
  { center := S.Packet.center
    radius := S.Packet.radius
    radius_pos := S.Packet.radius_pos
    moser_on_boundary_1 := S.Packet.moser_on_boundary_2
    moser_on_boundary_2 := S.Packet.moser_on_boundary_3
    moser_on_boundary_3 := S.Packet.moser_on_boundary_1
    inner_at_v1 := S.Packet.inner_at_v2
    inner_at_v2 := S.Packet.inner_at_v3
    inner_at_v3 := S.Packet.inner_at_v1
    disk_contains_A := S.Packet.disk_contains_A }

/-- The shell packet rotated to `triangle3`. -/
@[reducible] def packet3 {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    Problem97.CircumscribedMECPacket A S.triangle3 :=
  { center := S.Packet.center
    radius := S.Packet.radius
    radius_pos := S.Packet.radius_pos
    moser_on_boundary_1 := S.Packet.moser_on_boundary_3
    moser_on_boundary_2 := S.Packet.moser_on_boundary_1
    moser_on_boundary_3 := S.Packet.moser_on_boundary_2
    inner_at_v1 := S.Packet.inner_at_v3
    inner_at_v2 := S.Packet.inner_at_v1
    inner_at_v3 := S.Packet.inner_at_v2
    disk_contains_A := S.Packet.disk_contains_A }

/-- The open interior of the first opposite cap, i.e. `C₁ \ {v₂, v₃}`. -/
@[reducible] noncomputable def I1 {A : Finset ℝ²} (S : FiniteEndpointShell A) : Finset ℝ² :=
  (S.CP.C1.erase S.MT.toMoserTriangle.v2).erase S.MT.toMoserTriangle.v3

/-- The open interior of the second opposite cap, i.e. `C₂ \ {v₃, v₁}`. -/
@[reducible] noncomputable def I2 {A : Finset ℝ²} (S : FiniteEndpointShell A) : Finset ℝ² :=
  (S.CP.C2.erase S.MT.toMoserTriangle.v3).erase S.MT.toMoserTriangle.v1

/-- The open interior of the third opposite cap, i.e. `C₃ \ {v₁, v₂}`. -/
@[reducible] noncomputable def I3 {A : Finset ℝ²} (S : FiniteEndpointShell A) : Finset ℝ² :=
  (S.CP.C3.erase S.MT.toMoserTriangle.v1).erase S.MT.toMoserTriangle.v2

/-- The shell's cap-sum identity in the original `|A| + 3` form. -/
theorem hcapSum
    {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    S.CP.C1.card + S.CP.C2.card + S.CP.C3.card = A.card + 3 := by
  rw [S.hcard9]
  norm_num [S.hcapSum12]

/-- The global `K4` hypothesis specialized to the first Moser vertex. -/
theorem k4_at_v1
    {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    HasNEquidistantPointsAt 4 A S.MT.toMoserTriangle.v1 :=
  S.hK4 _ S.MT.toMoserTriangle.v1_mem

/-- The global `K4` hypothesis specialized to the second Moser vertex. -/
theorem k4_at_v2
    {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    HasNEquidistantPointsAt 4 A S.MT.toMoserTriangle.v2 :=
  S.hK4 _ S.MT.toMoserTriangle.v2_mem

/-- The global `K4` hypothesis specialized to the third Moser vertex. -/
theorem k4_at_v3
    {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    HasNEquidistantPointsAt 4 A S.MT.toMoserTriangle.v3 :=
  S.hK4 _ S.MT.toMoserTriangle.v3_mem

/-- Shell-facing `N4a/N4b` bridge at the first opposite cap. -/
theorem I1_card_ge_two
    {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    2 ≤ S.I1.card := by
  classical
  rcases S.k4_at_v1 with ⟨r, hrpos, hTcard⟩
  let T : Finset ℝ² := A.filter (fun x => dist S.triangle.v1 x = r)
  have hv1_not_mem_T : S.triangle.v1 ∉ T := by
    intro hv1T
    have hv1eq : dist S.triangle.v1 S.triangle.v1 = r := (Finset.mem_filter.mp hv1T).2
    have h0r : (0 : ℝ) = r := by simpa using hv1eq
    nlinarith
  have hC2_one : (T ∩ S.CP.C2).card ≤ 1 := by
    apply Problem97.FiniteEndpoint.one_hit_sameRadius_at_v3_of_supportCap
      (A := A) (C := S.CP.C2) (M := S.triangle2)
      S.hconv S.hnoncol S.CP.C2_subset
      (fun x hxA => (S.CP.arc_membership x hxA).2.1)
      S.CP.v3_mem_C2 S.CP.v1_mem_C2 S.packet2 S.packet2.inner_at_v1
      (S := T ∩ S.CP.C2) (r := r)
    · exact Finset.inter_subset_right
    · intro x hx
      exact (Finset.mem_filter.mp (Finset.mem_of_mem_inter_left hx)).2
  have hC3_one : (T ∩ S.CP.C3).card ≤ 1 := by
    apply Problem97.FiniteEndpoint.one_hit_sameRadius_at_v2_of_supportCap
      (A := A) (C := S.CP.C3) (M := S.triangle3)
      S.hconv S.hnoncol S.CP.C3_subset
      (fun x hxA => (S.CP.arc_membership x hxA).2.2)
      S.CP.v1_mem_C3 S.CP.v2_mem_C3 S.packet3 S.packet3.inner_at_v1
      (S := T ∩ S.CP.C3) (r := r)
    · exact Finset.inter_subset_right
    · intro x hx
      exact (Finset.mem_filter.mp (Finset.mem_of_mem_inter_left hx)).2
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
    simpa [Finset.inter_comm] using Finset.card_sdiff_add_card_inter T S.I1
  have hinter_le : (T ∩ S.I1).card ≤ S.I1.card := Finset.card_le_card Finset.inter_subset_right
  have hTfour : 4 ≤ T.card := by
    simpa [T] using hTcard
  omega

/-- Shell-facing `N4a/N4b` bridge at the second opposite cap. -/
theorem I2_card_ge_two
    {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    2 ≤ S.I2.card := by
  classical
  rcases S.k4_at_v2 with ⟨r, hrpos, hTcard⟩
  let T : Finset ℝ² := A.filter (fun x => dist S.triangle.v2 x = r)
  have hv2_not_mem_T : S.triangle.v2 ∉ T := by
    intro hv2T
    have hv2eq : dist S.triangle.v2 S.triangle.v2 = r := (Finset.mem_filter.mp hv2T).2
    have h0r : (0 : ℝ) = r := by simpa using hv2eq
    nlinarith
  have hC1_one : (T ∩ S.CP.C1).card ≤ 1 := by
    apply Problem97.FiniteEndpoint.one_hit_sameRadius_at_v2_of_supportCap
      (A := A) (C := S.CP.C1) (M := S.triangle)
      S.hconv S.hnoncol S.CP.C1_subset
      (fun x hxA => (S.CP.arc_membership x hxA).1)
      S.CP.v2_mem_C1 S.CP.v3_mem_C1 S.Packet S.Packet.inner_at_v1
      (S := T ∩ S.CP.C1) (r := r)
    · exact Finset.inter_subset_right
    · intro x hx
      simpa using (Finset.mem_filter.mp (Finset.mem_of_mem_inter_left hx)).2
  have hC3_one : (T ∩ S.CP.C3).card ≤ 1 := by
    apply Problem97.FiniteEndpoint.one_hit_sameRadius_at_v3_of_supportCap
      (A := A) (C := S.CP.C3) (M := S.triangle3)
      S.hconv S.hnoncol S.CP.C3_subset
      (fun x hxA => (S.CP.arc_membership x hxA).2.2)
      S.CP.v1_mem_C3 S.CP.v2_mem_C3 S.packet3 S.packet3.inner_at_v1
      (S := T ∩ S.CP.C3) (r := r)
    · exact Finset.inter_subset_right
    · intro x hx
      exact (Finset.mem_filter.mp (Finset.mem_of_mem_inter_left hx)).2
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
    simpa [Finset.inter_comm] using Finset.card_sdiff_add_card_inter T S.I2
  have hinter_le : (T ∩ S.I2).card ≤ S.I2.card := Finset.card_le_card Finset.inter_subset_right
  have hTfour : 4 ≤ T.card := by
    simpa [T] using hTcard
  omega

/-- Shell-facing `N4a/N4b` bridge at the third opposite cap. -/
theorem I3_card_ge_two
    {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    2 ≤ S.I3.card := by
  classical
  rcases S.k4_at_v3 with ⟨r, hrpos, hTcard⟩
  let T : Finset ℝ² := A.filter (fun x => dist S.triangle.v3 x = r)
  have hv3_not_mem_T : S.triangle.v3 ∉ T := by
    intro hv3T
    have hv3eq : dist S.triangle.v3 S.triangle.v3 = r := (Finset.mem_filter.mp hv3T).2
    have h0r : (0 : ℝ) = r := by simpa using hv3eq
    nlinarith
  have hC1_one : (T ∩ S.CP.C1).card ≤ 1 := by
    apply Problem97.FiniteEndpoint.one_hit_sameRadius_at_v3_of_supportCap
      (A := A) (C := S.CP.C1) (M := S.triangle)
      S.hconv S.hnoncol S.CP.C1_subset
      (fun x hxA => (S.CP.arc_membership x hxA).1)
      S.CP.v2_mem_C1 S.CP.v3_mem_C1 S.Packet S.Packet.inner_at_v1
      (S := T ∩ S.CP.C1) (r := r)
    · exact Finset.inter_subset_right
    · intro x hx
      simpa using (Finset.mem_filter.mp (Finset.mem_of_mem_inter_left hx)).2
  have hC2_one : (T ∩ S.CP.C2).card ≤ 1 := by
    apply Problem97.FiniteEndpoint.one_hit_sameRadius_at_v2_of_supportCap
      (A := A) (C := S.CP.C2) (M := S.triangle2)
      S.hconv S.hnoncol S.CP.C2_subset
      (fun x hxA => (S.CP.arc_membership x hxA).2.1)
      S.CP.v3_mem_C2 S.CP.v1_mem_C2 S.packet2 S.packet2.inner_at_v1
      (S := T ∩ S.CP.C2) (r := r)
    · exact Finset.inter_subset_right
    · intro x hx
      exact (Finset.mem_filter.mp (Finset.mem_of_mem_inter_left hx)).2
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
    simpa [Finset.inter_comm] using Finset.card_sdiff_add_card_inter T S.I3
  have hinter_le : (T ∩ S.I3).card ≤ S.I3.card := Finset.card_le_card Finset.inter_subset_right
  have hTfour : 4 ≤ T.card := by
    simpa [T] using hTcard
  omega

/-- The first cap decomposes as its open interior plus the two Moser endpoints. -/
theorem I1_card
    {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    S.I1.card + 2 = S.CP.C1.card := by
  classical
  obtain ⟨h12, h23, h13, _⟩ := S.hCirc
  have hv3 :
      S.MT.toMoserTriangle.v3 ∈ S.CP.C1.erase S.MT.toMoserTriangle.v2 := by
    exact Finset.mem_erase.mpr ⟨by intro h; exact h23 h.symm, S.CP.v3_mem_C1⟩
  have hC1erase :
      (S.CP.C1.erase S.MT.toMoserTriangle.v2).card = S.CP.C1.card - 1 :=
    Finset.card_erase_of_mem S.CP.v2_mem_C1
  have hI1 :
      S.I1.card = (S.CP.C1.erase S.MT.toMoserTriangle.v2).card - 1 := by
    unfold I1
    exact Finset.card_erase_of_mem hv3
  have hC1_ge_two : 2 ≤ S.CP.C1.card := by
    have hsubset :
        ({S.MT.toMoserTriangle.v2, S.MT.toMoserTriangle.v3} : Finset ℝ²) ⊆ S.CP.C1 := by
      intro x hx
      simp at hx
      rcases hx with rfl | rfl
      · exact S.CP.v2_mem_C1
      · exact S.CP.v3_mem_C1
    have hcard_le := Finset.card_le_card hsubset
    simpa [h23] using hcard_le
  rw [hI1, hC1erase]
  omega

/-- The second cap decomposes as its open interior plus the two Moser endpoints. -/
theorem I2_card
    {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    S.I2.card + 2 = S.CP.C2.card := by
  classical
  obtain ⟨h12, h23, h13, _⟩ := S.hCirc
  have hv1 :
      S.MT.toMoserTriangle.v1 ∈ S.CP.C2.erase S.MT.toMoserTriangle.v3 := by
    exact Finset.mem_erase.mpr ⟨h13, S.CP.v1_mem_C2⟩
  have hC2erase :
      (S.CP.C2.erase S.MT.toMoserTriangle.v3).card = S.CP.C2.card - 1 :=
    Finset.card_erase_of_mem S.CP.v3_mem_C2
  have hI2 :
      S.I2.card = (S.CP.C2.erase S.MT.toMoserTriangle.v3).card - 1 := by
    unfold I2
    exact Finset.card_erase_of_mem hv1
  have hC2_ge_two : 2 ≤ S.CP.C2.card := by
    have hsubset :
        ({S.MT.toMoserTriangle.v3, S.MT.toMoserTriangle.v1} : Finset ℝ²) ⊆ S.CP.C2 := by
      intro x hx
      simp at hx
      rcases hx with rfl | rfl
      · exact S.CP.v3_mem_C2
      · exact S.CP.v1_mem_C2
    have h31 : S.MT.toMoserTriangle.v3 ≠ S.MT.toMoserTriangle.v1 := by
      intro h
      exact h13 h.symm
    have hpair :
        ({S.MT.toMoserTriangle.v3, S.MT.toMoserTriangle.v1} : Finset ℝ²).card = 2 := by
      simp [h31]
    have hcard_le := Finset.card_le_card hsubset
    rw [hpair] at hcard_le
    exact hcard_le
  rw [hI2, hC2erase]
  omega

/-- The third cap decomposes as its open interior plus the two Moser endpoints. -/
theorem I3_card
    {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    S.I3.card + 2 = S.CP.C3.card := by
  classical
  obtain ⟨h12, h23, h13, _⟩ := S.hCirc
  have hv2 :
      S.MT.toMoserTriangle.v2 ∈ S.CP.C3.erase S.MT.toMoserTriangle.v1 := by
    exact Finset.mem_erase.mpr ⟨by intro h; exact h12 h.symm, S.CP.v2_mem_C3⟩
  have hC3erase :
      (S.CP.C3.erase S.MT.toMoserTriangle.v1).card = S.CP.C3.card - 1 :=
    Finset.card_erase_of_mem S.CP.v1_mem_C3
  have hI3 :
      S.I3.card = (S.CP.C3.erase S.MT.toMoserTriangle.v1).card - 1 := by
    unfold I3
    exact Finset.card_erase_of_mem hv2
  have hC3_ge_two : 2 ≤ S.CP.C3.card := by
    have hsubset :
        ({S.MT.toMoserTriangle.v1, S.MT.toMoserTriangle.v2} : Finset ℝ²) ⊆ S.CP.C3 := by
      intro x hx
      simp at hx
      rcases hx with rfl | rfl
      · exact S.CP.v1_mem_C3
      · exact S.CP.v2_mem_C3
    have hcard_le := Finset.card_le_card hsubset
    simpa [h12] using hcard_le
  rw [hI3, hC3erase]
  omega

/-- N4b arithmetic for the first cap: two interior vertices force `|C₁| ≥ 4`. -/
theorem cap1_card_ge_four_of_I1_card_ge_two
    {A : Finset ℝ²} (S : FiniteEndpointShell A) (hI1 : 2 ≤ S.I1.card) :
    4 ≤ S.CP.C1.card := by
  have hcard := S.I1_card
  omega

/-- N4b arithmetic for the second cap: two interior vertices force `|C₂| ≥ 4`. -/
theorem cap2_card_ge_four_of_I2_card_ge_two
    {A : Finset ℝ²} (S : FiniteEndpointShell A) (hI2 : 2 ≤ S.I2.card) :
    4 ≤ S.CP.C2.card := by
  have hcard := S.I2_card
  omega

/-- N4b arithmetic for the third cap: two interior vertices force `|C₃| ≥ 4`. -/
theorem cap3_card_ge_four_of_I3_card_ge_two
    {A : Finset ℝ²} (S : FiniteEndpointShell A) (hI3 : 2 ≤ S.I3.card) :
    4 ≤ S.CP.C3.card := by
  have hcard := S.I3_card
  omega

/-- N4b/N5 arithmetic packet: once every opposite cap has at least two interior
vertices, the cap vector is exactly `(4,4,4)` and each cap interior has
cardinality `2`. -/
theorem n4b_n5_exact_cap_vector_of_interior_lower_bounds
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (hI1 : 2 ≤ S.I1.card) (hI2 : 2 ≤ S.I2.card) (hI3 : 2 ≤ S.I3.card) :
    S.CP.C1.card = 4 ∧ S.CP.C2.card = 4 ∧ S.CP.C3.card = 4
      ∧ S.I1.card = 2 ∧ S.I2.card = 2 ∧ S.I3.card = 2 := by
  have hC1_ge : 4 ≤ S.CP.C1.card := S.cap1_card_ge_four_of_I1_card_ge_two hI1
  have hC2_ge : 4 ≤ S.CP.C2.card := S.cap2_card_ge_four_of_I2_card_ge_two hI2
  have hC3_ge : 4 ≤ S.CP.C3.card := S.cap3_card_ge_four_of_I3_card_ge_two hI3
  have hsum := S.hcapSum12
  have hC1_eq : S.CP.C1.card = 4 := by
    omega
  have hC2_eq : S.CP.C2.card = 4 := by
    omega
  have hC3_eq : S.CP.C3.card = 4 := by
    omega
  have hI1_eq : S.I1.card = 2 := by
    have hcard := S.I1_card
    omega
  have hI2_eq : S.I2.card = 2 := by
    have hcard := S.I2_card
    omega
  have hI3_eq : S.I3.card = 2 := by
    have hcard := S.I3_card
    omega
  exact ⟨hC1_eq, hC2_eq, hC3_eq, hI1_eq, hI2_eq, hI3_eq⟩

/-- N5, isolated as the named `(4,4,4)` cap-partition consequence. -/
theorem n5_forced_m44_of_interior_lower_bounds
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (hI1 : 2 ≤ S.I1.card) (hI2 : 2 ≤ S.I2.card) (hI3 : 2 ≤ S.I3.card) :
    S.CP.C1.card = 4 ∧ S.CP.C2.card = 4 ∧ S.CP.C3.card = 4 := by
  rcases S.n4b_n5_exact_cap_vector_of_interior_lower_bounds hI1 hI2 hI3 with
    ⟨hC1, hC2, hC3, -, -, -⟩
  exact ⟨hC1, hC2, hC3⟩

/-- Shell-facing `N4a -> N5` export: the instantiated endpoint one-hit bounds
force the exact `(4,4,4)` cap vector. -/
theorem n5_forced_m44
    {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    S.CP.C1.card = 4 ∧ S.CP.C2.card = 4 ∧ S.CP.C3.card = 4 := by
  exact S.n5_forced_m44_of_interior_lower_bounds
    S.I1_card_ge_two S.I2_card_ge_two S.I3_card_ge_two

end FiniteEndpointShell

/-- Build the Section 3 endpoint shell from a nine-point convex `K4`
counterexample.

This is the Lean packaging of the already-closed N1-N3 shell:

* `not_collinear_of_K4`,
* `boundary_card_ge_three_of_K4`,
* circumscribed non-obtuse Moser triangle extraction,
* three-cap decomposition,
* and the cap-sum identity specialized to `|A| = 9`. -/
noncomputable def finiteEndpointShellOfCounterexample
    {A : Finset ℝ²} (hne : A.Nonempty) (hcard9 : A.card = 9)
    (hconv : ConvexIndep A) (hK4 : HasNEquidistantProperty 4 A) :
    FiniteEndpointShell A := by
  classical
  let hnoncol : ¬ Collinear ℝ (A : Set ℝ²) :=
    not_collinear_of_K4 hne hconv hK4
  let hbd :
      3 ≤ (A.filter (fun p =>
        dist p (Problem97.MEC.mec A hne).center =
          (Problem97.MEC.mec A hne).radius)).card :=
    boundary_card_ge_three_of_K4 hne hconv hK4
  let htriple :=
    Problem97.MEC.exists_nonobtuse_circumscribed_triple hne hnoncol hbd
  let a := Classical.choose htriple
  let htriple1 := Classical.choose_spec htriple
  let b := Classical.choose htriple1
  let htriple2 := Classical.choose_spec htriple1
  let c := Classical.choose htriple2
  let htriple3 := Classical.choose_spec htriple2
  rcases htriple3 with
    ⟨haA, hbA, hcA, hab, hbc, hac, haB, hbB, hcB, hacute1, hacute2, hacute3⟩
  let MT : Problem97.MEC.MoserTriangle A hne hnoncol :=
    { v1 := a
      v2 := b
      v3 := c
      v1_mem := haA
      v2_mem := hbA
      v3_mem := hcA
      v1_boundary := haB
      v2_boundary := hbB
      v3_boundary := hcB
      case_split := Or.inl ⟨hab, hbc, hac⟩ }
  let N : Problem97.MEC.NonObtuseCircumscribedMoserTriangle A hne hnoncol :=
    { toMoserTriangle := MT
      inner_at_v1 := hacute1
      inner_at_v2 := hacute2
      inner_at_v3 := hacute3 }
  have hCirc : ∃ h12 h23 h13,
      MT.case_split = Or.inl ⟨h12, h23, h13⟩ := by
    exact ⟨hab, hbc, hac, rfl⟩
  let hdecomp :=
    Problem97.Dumitrescu.three_cap_decomposition hconv MT hCirc
  let CP := Classical.choose hdecomp
  let hcapSum := Classical.choose_spec hdecomp
  have hcapSum' : CP.C1.card + CP.C2.card + CP.C3.card = A.card + 3 := by
    simpa [CP] using hcapSum
  have hcapSum12 : CP.C1.card + CP.C2.card + CP.C3.card = 12 := by
    have hcard9' : A.card + 3 = 12 := by omega
    rw [hcapSum']
    exact hcard9'
  let Packet : Problem97.CircumscribedMECPacket A
      (MT.toStructural hCirc) :=
    Problem97.CircumscribedMECPacket.ofNonObtuse N hCirc
  exact
    { hne := hne
      hcard9 := hcard9
      hconv := hconv
      hK4 := hK4
      hnoncol := hnoncol
      hbd := hbd
      MT := N
      hCirc := hCirc
      CP := CP
      hcapSum12 := hcapSum12
      Packet := Packet }

end Problem97
