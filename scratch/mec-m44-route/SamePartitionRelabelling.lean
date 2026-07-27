import Erdos9796Proof.P97.Cap.PartitionFromMEC

/-!
# Same-partition `IsM44` obstruction

This scratch lemma records that the all-large residual cannot contradict
`noM44` merely by changing the surplus label on its existing cap triple.
-/

namespace Problem97

open scoped EuclideanGeometry

/-- The arc-membership field makes a cap triple rigid once the ordered Moser
triangle is fixed. -/
theorem capTriple_caps_eq_of_same_triangle
    {A : Finset ℝ²} {M : MoserTriangle A} (P Q : CapTriple A M) :
    P.C1 = Q.C1 ∧ P.C2 = Q.C2 ∧ P.C3 = Q.C3 := by
  constructor
  · ext x
    constructor
    · intro hx
      have hxA : x ∈ A := P.C1_subset hx
      exact (Q.arc_membership x hxA).1.mpr ((P.arc_membership x hxA).1.mp hx)
    · intro hx
      have hxA : x ∈ A := Q.C1_subset hx
      exact (P.arc_membership x hxA).1.mpr ((Q.arc_membership x hxA).1.mp hx)
  constructor
  · ext x
    constructor
    · intro hx
      have hxA : x ∈ A := P.C2_subset hx
      exact (Q.arc_membership x hxA).2.1.mpr ((P.arc_membership x hxA).2.1.mp hx)
    · intro hx
      have hxA : x ∈ A := Q.C2_subset hx
      exact (P.arc_membership x hxA).2.1.mpr ((Q.arc_membership x hxA).2.1.mp hx)
  · ext x
    constructor
    · intro hx
      have hxA : x ∈ A := P.C3_subset hx
      exact (Q.arc_membership x hxA).2.2.mpr ((P.arc_membership x hxA).2.2.mp hx)
    · intro hx
      have hxA : x ∈ A := Q.C3_subset hx
      exact (P.arc_membership x hxA).2.2.mpr ((Q.arc_membership x hxA).2.2.mp hx)

/-- If all three caps of a fixed MEC cap triple have at least six points,
changing only the surplus designation can never produce an `IsM44` packet. -/
theorem no_isM44_of_all_large_same_partition_relabelling
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hC1 : 6 ≤ S.partition.C1.card)
    (hC2 : 6 ≤ S.partition.C2.card)
    (hC3 : 6 ≤ S.partition.C3.card)
    (i : Fin 3)
    (hiLarge :
      4 <
        (match i with
          | ⟨0, _⟩ => S.partition.C1
          | ⟨1, _⟩ => S.partition.C2
          | _ => S.partition.C3).card) :
    ¬
      ({
        hA := S.hA
        hncol := S.hncol
        triangleNonObtuse := S.triangleNonObtuse
        hCirc := S.hCirc
        partition := S.partition
        surplusIdx := i
        surplus := hiLarge
      } : SurplusCapPacket A).IsM44 := by
  rcases i with ⟨j, hj⟩
  interval_cases j <;>
    simp only [SurplusCapPacket.IsM44, SurplusCapPacket.oppCap1,
      SurplusCapPacket.oppCap2]
  all_goals omega

/-- The role-level bounds carried by the live all-large residual imply the raw
`C1/C2/C3` bounds needed above.  Hence *every* surplus relabelling of that same
partition fails `IsM44`, not only the two relabellings currently named in the
production file. -/
theorem no_isM44_of_all_large_role_bounds_same_partition_relabelling
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hSurplus : 6 ≤ S.surplusCap.card)
    (hOpp1 : 6 ≤ S.oppCap1.card)
    (hOpp2 : 6 ≤ S.oppCap2.card)
    (i : Fin 3)
    (hiLarge :
      4 <
        (match i with
          | ⟨0, _⟩ => S.partition.C1
          | ⟨1, _⟩ => S.partition.C2
          | _ => S.partition.C3).card) :
    ¬
      ({
        hA := S.hA
        hncol := S.hncol
        triangleNonObtuse := S.triangleNonObtuse
        hCirc := S.hCirc
        partition := S.partition
        surplusIdx := i
        surplus := hiLarge
      } : SurplusCapPacket A).IsM44 := by
  rcases hs : S.surplusIdx with ⟨j, hj⟩
  interval_cases j
  · exact no_isM44_of_all_large_same_partition_relabelling S
      (by simpa [SurplusCapPacket.surplusCap, hs] using hSurplus)
      (by simpa [SurplusCapPacket.oppCap1, hs] using hOpp1)
      (by simpa [SurplusCapPacket.oppCap2, hs] using hOpp2)
      i hiLarge
  · exact no_isM44_of_all_large_same_partition_relabelling S
      (by simpa [SurplusCapPacket.oppCap2, hs] using hOpp2)
      (by simpa [SurplusCapPacket.surplusCap, hs] using hSurplus)
      (by simpa [SurplusCapPacket.oppCap1, hs] using hOpp1)
      i hiLarge
  · exact no_isM44_of_all_large_same_partition_relabelling S
      (by simpa [SurplusCapPacket.oppCap1, hs] using hOpp1)
      (by simpa [SurplusCapPacket.oppCap2, hs] using hOpp2)
      (by simpa [SurplusCapPacket.surplusCap, hs] using hSurplus)
      i hiLarge

end Problem97
