import Erdos9796Proof.P97.ATail.FrontierLiveClosure

open scoped EuclideanGeometry

namespace Problem97
namespace CapSelectedRowCounting

attribute [local instance] Classical.propDecidable

/-- Strongest direct packet-level consequence of the ordered-cap pair count:
the inequality applies independently to every one of the three cap indices. -/
theorem audit_cap_card_add_four_le_choose_complement
    {D : CounterexampleData} (S : SurplusCapPacket D.A) (i : Fin 3) :
    (S.capByIndex i).card + 4 ≤
      Nat.choose (D.A \ S.capByIndex i).card 2 := by
  classical
  rcases exists_faithfulCarrierPattern_of_globalK4
      D.K4 S.triangle.v1_mem with ⟨F⟩
  rcases S.capByIndex_cgn4g_capData D.convex i with
    ⟨m, L, Packet, Hside, Hord, hcap⟩
  have hcount :=
    orderedCap_card_add_four_le_choose_outside
      Packet Hside Hord D.convex F
  have hCcard : (Finset.univ.image L.points).card = m := by
    rw [Finset.card_image_of_injective _ L.injective, Finset.card_univ,
      Fintype.card_fin]
  have hm : m = (S.capByIndex i).card := by
    rw [← hCcard, hcap]
  calc
    (S.capByIndex i).card + 4 = m + 4 := by omega
    _ ≤ Nat.choose (D.A \ Finset.univ.image L.points).card 2 := hcount
    _ = Nat.choose (D.A \ S.capByIndex i).card 2 := by rw [hcap]

/-- An eight-point cap forces only six points in its complement. -/
theorem audit_complement_card_ge_six_of_cap_card_ge_eight
    {D : CounterexampleData} (S : SurplusCapPacket D.A) (i : Fin 3)
    (hcapEight : 8 ≤ (S.capByIndex i).card) :
    6 ≤ (D.A \ S.capByIndex i).card := by
  have hcount := audit_cap_card_add_four_le_choose_complement S i
  by_contra hnot
  have hsmall : (D.A \ S.capByIndex i).card < 6 := by omega
  interval_cases hB : (D.A \ S.capByIndex i).card <;>
    norm_num [Nat.choose, hB] at hcount
  all_goals omega

/-- The profile `(surplus, opp1, opp2; carrier) = (6,8,6;17)` satisfies all
three independent ordered-cap count inequalities and the cap-sum identity. -/
theorem audit_count_profile_686_is_feasible :
    6 + 8 + 6 = 17 + 3 ∧
      6 + 4 ≤ Nat.choose (17 - 6) 2 ∧
      8 + 4 ≤ Nat.choose (17 - 8) 2 ∧
      6 + 4 ≤ Nat.choose (17 - 6) 2 ∧
      ¬ (8 = 4 ∧ 6 = 4) := by
  norm_num [Nat.choose]

end CapSelectedRowCounting
end Problem97

#print axioms
  Problem97.CapSelectedRowCounting.audit_cap_card_add_four_le_choose_complement
#print axioms
  Problem97.CapSelectedRowCounting.audit_complement_card_ge_six_of_cap_card_ge_eight
#print axioms
  Problem97.CapSelectedRowCounting.audit_count_profile_686_is_feasible
