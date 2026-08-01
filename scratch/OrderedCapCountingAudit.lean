import Erdos9796Proof.P97.ATail.FrontierLiveClosure

/-!
# Ordered-cap counting audit

Kernel checks for the read-only audit of the first-fiber five-center deletion
terminal.  This file is intentionally outside the production Lean tree.
-/

open scoped EuclideanGeometry

namespace Problem97.OrderedCapCountingAudit

open CapSelectedRowCounting

/-- The uncompressed outside-pair sum bound specializes to the first opposite
cap without any use of the terminal's collision/deletion data. -/
theorem exists_oppIndex1_ordered_sum_bound
    {D : CounterexampleData} (S : SurplusCapPacket D.A) :
    ∃ m, ∃ L : CGN.OrderedCap m,
      ∃ Packet : CGN.MecCapPacket D.A L,
      ∃ _Hord : CGN.StrictCapOrder D.A L,
      ∃ F : FaithfulCarrierPattern D.A,
        Finset.univ.image L.points = S.capByIndex S.oppIndex1 ∧
        (∑ j : Fin m,
          Nat.choose
            ((F.classAt (L.points j) (Packet.mem_A j)).support \
              Finset.univ.image L.points).card 2) ≤
          Nat.choose (D.A \ Finset.univ.image L.points).card 2 := by
  classical
  rcases exists_faithfulCarrierPattern_of_globalK4 D.K4
      S.triangle.v1_mem with ⟨F⟩
  rcases S.capByIndex_cgn4g_capData D.convex S.oppIndex1 with
    ⟨m, L, Packet, _Hside, Hord, hcap⟩
  exact ⟨m, L, Packet, Hord, F, hcap,
    orderedCap_outsidePairCount_sum_le Packet Hord D.convex F⟩

/-- Exact consequence of the ordered-cap pair count for the first opposite
cap.  This is an audit theorem only. -/
theorem oppIndex1_card_add_four_le_choose_outside
    {D : CounterexampleData} (S : SurplusCapPacket D.A) :
    (S.capByIndex S.oppIndex1).card + 4 ≤
      Nat.choose (D.A \ S.capByIndex S.oppIndex1).card 2 := by
  classical
  rcases exists_faithfulCarrierPattern_of_globalK4 D.K4
      S.triangle.v1_mem with ⟨F⟩
  rcases S.capByIndex_cgn4g_capData D.convex S.oppIndex1 with
    ⟨m, L, Packet, Hside, Hord, hcap⟩
  have hindexed :=
    orderedCap_card_add_four_le_choose_outside Packet Hside Hord D.convex F
  have hCcard : (Finset.univ.image L.points).card = m := by
    rw [Finset.card_image_of_injective _ L.injective, Finset.card_univ,
      Fintype.card_fin]
  have hm : m = (S.capByIndex S.oppIndex1).card := by
    rw [← hCcard, hcap]
  simpa [hm, hcap] using hindexed

/-- The pair-count inequality alone forces only six outside points when the
cap has at least eight points. -/
theorem six_le_outside_of_oppIndex1_card_ge_eight
    {D : CounterexampleData} (S : SurplusCapPacket D.A)
    (hcap : 8 ≤ (S.capByIndex S.oppIndex1).card) :
    6 ≤ (D.A \ S.capByIndex S.oppIndex1).card := by
  have hcount := oppIndex1_card_add_four_le_choose_outside S
  by_contra h
  simp only [Nat.not_le] at h
  interval_cases hout :
      (D.A \ S.capByIndex S.oppIndex1).card <;>
    norm_num [Nat.choose, hout] at hcount <;>
    omega

/-- The cap-sum identity and the two other all-large-cap bounds already force
nine outside points, independently of selected-row counting. -/
theorem nine_le_outside_of_other_caps_ge_six
    {D : CounterexampleData} (S : SurplusCapPacket D.A)
    (hsurplus : 6 ≤ S.surplusCap.card)
    (hopp2 : 6 ≤ S.oppCap2.card) :
    9 ≤ (D.A \ S.capByIndex S.oppIndex1).card := by
  classical
  have hcapEq : S.capByIndex S.oppIndex1 = S.oppCap1 := by
    rcases hi : S.surplusIdx with ⟨i, hi3⟩
    interval_cases i <;>
      simp [SurplusCapPacket.capByIndex, SurplusCapPacket.oppIndex1,
        SurplusCapPacket.oppCap1, hi]
  rw [Finset.card_sdiff_of_subset (S.capByIndex_subset S.oppIndex1), hcapEq]
  have hsum := S.capSum
  omega

/-- Thus the target's `card ≥ 8` hypothesis plus all-large-cap data gives only
the already-compatible carrier lower bound `17 ≤ |A|`. -/
theorem carrier_card_ge_seventeen
    {D : CounterexampleData} (S : SurplusCapPacket D.A)
    (hcap : 8 ≤ (S.capByIndex S.oppIndex1).card)
    (hsurplus : 6 ≤ S.surplusCap.card)
    (hopp2 : 6 ≤ S.oppCap2.card) :
    17 ≤ D.A.card := by
  have hsubset := S.capByIndex_subset S.oppIndex1
  have hout := nine_le_outside_of_other_caps_ge_six S hsurplus hopp2
  rw [Finset.card_sdiff_of_subset hsubset] at hout
  omega

/-- The least cardinal profile allowed by the target's bounds is numerically
compatible with the ordered-cap inequality: `c = 8`, other caps `6,6`, hence
`|A| = 17`, outside size `9`, and `12 ≤ choose 9 2 = 36`. -/
example : 8 + 4 ≤ Nat.choose 9 2 := by
  norm_num [Nat.choose]

end Problem97.OrderedCapCountingAudit
