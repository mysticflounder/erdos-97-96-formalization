import Erdos9796Proof.P97.CapBridgeFromK4
import Erdos9796Proof.P97.U1TwoShortCapReduction

/-!
# Complete `IsM44` assembly from a boundary triple

Scratch verification of the exact geometric input needed by the packet
constructor.
-/

open scoped EuclideanGeometry

namespace Problem97

attribute [local instance] Classical.propDecidable

noncomputable section

/-- A raw MEC-boundary triple with two exact arc counts is already enough to
assemble a complete same-carrier `IsM44` packet. -/
theorem exists_isM44_of_boundaryTriple_twoExactArcs
    {A : Finset ℝ²} (hA : A.Nonempty)
    (hncol : ¬ Collinear ℝ (A : Set ℝ²)) (hconv : ConvexIndep A)
    (hcard : 9 < A.card)
    (a b c : ℝ²)
    (haA : a ∈ A) (hbA : b ∈ A) (hcA : c ∈ A)
    (haB : dist a (MEC.mec A hA).center = (MEC.mec A hA).radius)
    (hbB : dist b (MEC.mec A hA).center = (MEC.mec A hA).radius)
    (hcB : dist c (MEC.mec A hA).center = (MEC.mec A hA).radius)
    (hab : a ≠ b) (hbc : b ≠ c) (hac : a ≠ c)
    (hinnA : 0 ≤ inner ℝ (b - a) (c - a))
    (hinnB : 0 ≤ inner ℝ (c - b) (a - b))
    (hinnC : 0 ≤ inner ℝ (a - c) (b - c))
    (hC1 : (A.filter (fun x ↦ OnArcOpposite a b c x)).card = 4)
    (hC2 : (A.filter (fun x ↦ OnArcOpposite b c a x)).card = 4) :
    ∃ T : SurplusCapPacket A, T.IsM44 := by
  let MT : MEC.NonObtuseCircumscribedMoserTriangle A hA hncol :=
    { toMoserTriangle :=
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
      inner_at_v1 := hinnA
      inner_at_v2 := hinnB
      inner_at_v3 := hinnC }
  have hCirc : ∃ h12 h23 h13,
      MT.toMoserTriangle.case_split = Or.inl ⟨h12, h23, h13⟩ :=
    ⟨hab, hbc, hac, rfl⟩
  have hNonDeg : signedArea2 a b c ≠ 0 := by
    simpa [MT] using MEC.moser_triangle_signed_area_ne_zero MT.toMoserTriangle hCirc
  have hCount := MEC.arc_partition_count_eq_one hconv MT.toMoserTriangle hCirc
  rcases MEC.cap_partition_from_moser_circumscribed
      MT.toMoserTriangle hCirc (by simpa [MT] using hNonDeg) hCount with ⟨CP⟩
  have hCP1 : CP.C1.card = 4 := by
    have heq : CP.C1 = A.filter (fun x ↦ OnArcOpposite a b c x) := by
      ext x
      by_cases hx : x ∈ A
      · simpa [MT, Finset.mem_filter, hx] using (CP.arc_membership x hx).1
      · have hxC : x ∉ CP.C1 := fun hxC ↦ hx (CP.C1_subset hxC)
        simp [Finset.mem_filter, hx, hxC]
    rw [heq]
    exact hC1
  have hCP2 : CP.C2.card = 4 := by
    have heq : CP.C2 = A.filter (fun x ↦ OnArcOpposite b c a x) := by
      ext x
      by_cases hx : x ∈ A
      · simpa [MT, Finset.mem_filter, hx] using (CP.arc_membership x hx).2.1
      · have hxC : x ∉ CP.C2 := fun hxC ↦ hx (CP.C2_subset hxC)
        simp [Finset.mem_filter, hx, hxC]
    rw [heq]
    exact hC2
  exact isM44Packet_of_capTriple_two_exact_of_card_gt_nine
    MT hCirc CP hcard (Or.inl ⟨hCP1, hCP2⟩)

#print axioms exists_isM44_of_boundaryTriple_twoExactArcs

end

end Problem97
