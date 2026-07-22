/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FirstApexShellRoleExtractor
import Erdos9796Proof.P97.ATail.BiApexRobustCapBounds
import Erdos9796Proof.P97.ATail.CapCrossingKalmanson
import Erdos9796Proof.P97.SurplusM44Packet.Shard05

/-!
# Card-thirteen boundary normalization for the exact-five parent

This scratch module isolates the geometric labeling statement required before
the card-thirteen finite ordinal certificate can be connected to production.
It does not import or trust the external CNF.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailExactFiveCard13CnfIngressScratch

open ATailBiApexRobustCapBounds
open ATailCriticalPairFrontier
open ATailLargeCapUniqueFive
open ATailOrientedPhysicalApexIngress
open ATailPhysicalSecondApexCommonDeletion

attribute [local instance] Classical.propDecidable

/-- Reverse a cyclic labeling while keeping its zeroth cut fixed. -/
def reverseCyclicIndex13 (i : Fin 13) : Fin 13 := -i

@[simp] theorem reverseCyclicIndex13_zero :
    reverseCyclicIndex13 0 = 0 := by
  rfl

theorem reverseCyclicIndex13_val_of_pos {i : Fin 13}
    (hi : (0 : Fin 13) < i) :
    (reverseCyclicIndex13 i).val = 13 - i.val := by
  simp only [reverseCyclicIndex13, Fin.neg_def]
  rw [Nat.mod_eq_of_lt]
  omega

theorem reverseCyclicIndex13_anti_of_pos {i j : Fin 13}
    (hi : (0 : Fin 13) < i) (hij : i < j) :
    reverseCyclicIndex13 j < reverseCyclicIndex13 i := by
  have hj : (0 : Fin 13) < j := hi.trans hij
  rw [Fin.lt_def, reverseCyclicIndex13_val_of_pos hj,
    reverseCyclicIndex13_val_of_pos hi]
  omega

/-- Reversing the cyclic labels at the fixed zero cut preserves both strict
Kalmanson inequalities.  The reversed enumeration is not asserted to be CCW:
the proof instead applies the existing CCW theorem to the four raw vertices
in their increasing raw order and then permutes the distance sums. -/
theorem strictKalmanson_pair_reverseCyclicIndex13
    {A : Finset ℝ²} (hcard : A.card = 13) (hA : ConvexIndep A)
    (phi : Fin 13 → ℝ²) (hphi_inj : Function.Injective phi)
    (hphi_image : Finset.univ.image phi = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {a b c d : Fin 13} (hab : a < b) (hbc : b < c) (hcd : c < d) :
    let psi := fun i : Fin 13 => phi (reverseCyclicIndex13 i)
    (dist (psi b) (psi c) + dist (psi a) (psi d) <
        dist (psi a) (psi c) + dist (psi b) (psi d)) ∧
      (dist (psi a) (psi b) + dist (psi c) (psi d) <
        dist (psi a) (psi c) + dist (psi b) (psi d)) := by
  let toCard : Fin A.card → Fin 13 := Fin.cast hcard
  let fromCard : Fin 13 → Fin A.card := Fin.cast hcard.symm
  let phiCard : Fin A.card → ℝ² := fun i => phi (toCard i)
  have hphiCard_inj : Function.Injective phiCard := by
    intro i j hij
    apply Fin.cast_injective hcard
    apply hphi_inj
    exact hij
  have hphiCard_image : Finset.univ.image phiCard = A := by
    ext x
    constructor
    · intro hx
      rcases Finset.mem_image.mp hx with ⟨i, _hi, rfl⟩
      have hxImage : phi (toCard i) ∈ Finset.univ.image phi :=
        Finset.mem_image.mpr ⟨toCard i, Finset.mem_univ _, rfl⟩
      rwa [hphi_image] at hxImage
    · intro hx
      have hxImage : x ∈ Finset.univ.image phi := by
        rwa [hphi_image]
      rcases Finset.mem_image.mp hxImage with ⟨i, _hi, rfl⟩
      exact Finset.mem_image.mpr
        ⟨fromCard i, Finset.mem_univ _, by simp [phiCard, toCard, fromCard]⟩
  have hccwCard : EuclideanGeometry.IsCcwConvexPolygon phiCard := by
    intro i j k hij hjk
    exact hccw hij hjk
  let raw := fun i : Fin 13 => reverseCyclicIndex13 i
  let idx := fun i : Fin 13 => fromCard (raw i)
  have hidx_lt {i j : Fin 13} (hij : raw i < raw j) : idx i < idx j := hij
  dsimp only
  by_cases ha0 : a = 0
  · subst a
    have hb0 : (0 : Fin 13) < b := hab
    have hc0 : (0 : Fin 13) < c := hb0.trans hbc
    have hd0 : (0 : Fin 13) < d := hc0.trans hcd
    have hzeroD : (0 : Fin 13) < raw d := by
      rw [Fin.lt_def, reverseCyclicIndex13_val_of_pos hd0]
      omega
    have hrawDC : raw d < raw c :=
      reverseCyclicIndex13_anti_of_pos hc0 hcd
    have hrawCB : raw c < raw b :=
      reverseCyclicIndex13_anti_of_pos hb0 hbc
    have hrawZeroD : raw 0 < raw d := by
      simpa [raw] using hzeroD
    have hk1 := CapCrossingKalmansonBridge.dist_add_dist_lt_diagonal_sum_of_ccw
      hA hphiCard_inj hphiCard_image hccwCard
      (hidx_lt hrawZeroD) (hidx_lt hrawDC) (hidx_lt hrawCB)
    have hk2 :=
      CapCrossingKalmansonBridge.complementary_dist_add_dist_lt_diagonal_sum_of_ccw
        hA hphiCard_inj hphiCard_image hccwCard
        (hidx_lt hrawZeroD) (hidx_lt hrawDC) (hidx_lt hrawCB)
    constructor
    · simpa [phiCard, idx, raw, toCard, fromCard, dist_comm,
        add_comm, add_left_comm, add_assoc] using hk2
    · simpa [phiCard, idx, raw, toCard, fromCard, dist_comm,
        add_comm, add_left_comm, add_assoc] using hk1
  · have haPos : (0 : Fin 13) < a := lt_of_le_of_ne (Fin.zero_le a) (Ne.symm ha0)
    have hrawDC : raw d < raw c :=
      reverseCyclicIndex13_anti_of_pos (haPos.trans hab |>.trans hbc) hcd
    have hrawCB : raw c < raw b :=
      reverseCyclicIndex13_anti_of_pos (haPos.trans hab) hbc
    have hrawBA : raw b < raw a :=
      reverseCyclicIndex13_anti_of_pos haPos hab
    have hk1 := CapCrossingKalmansonBridge.dist_add_dist_lt_diagonal_sum_of_ccw
      hA hphiCard_inj hphiCard_image hccwCard
      (hidx_lt hrawDC) (hidx_lt hrawCB) (hidx_lt hrawBA)
    have hk2 :=
      CapCrossingKalmansonBridge.complementary_dist_add_dist_lt_diagonal_sum_of_ccw
        hA hphiCard_inj hphiCard_image hccwCard
        (hidx_lt hrawDC) (hidx_lt hrawCB) (hidx_lt hrawBA)
    constructor
    · simpa [phiCard, idx, raw, toCard, fromCard, dist_comm,
        add_comm, add_left_comm, add_assoc] using hk1
    · simpa [phiCard, idx, raw, toCard, fromCard, dist_comm,
        add_comm, add_left_comm, add_assoc] using hk2

private theorem cap_cards_eq_five_six_five
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    (Q : FrontierBiApexRobustExactFiveSecondCapResidual B)
    (hcard : D.A.card = 13) :
    S.surplusCap.card = 5 ∧ S.oppCap1.card = 6 ∧
      S.oppCap2.card = 5 := by
  have hsum := S.capSum
  have hsurplus := S.surplus_card_gt_four
  have hfirst := Q.firstOppCap_card_ge_six
  have hsecond := Q.secondOppCap_card_eq_five
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  all_goals
    simp only [SurplusCapPacket.surplusCap, SurplusCapPacket.oppCap1,
      SurplusCapPacket.oppCap2, hi] at hsum hsurplus hfirst hsecond ⊢
    omega

private theorem capByIndex_surplusIdx_eq_surplusCap
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.surplusIdx = S.surplusCap := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.surplusCap, hi]

private theorem capByIndex_oppIndex1_eq_oppCap1
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.oppIndex1 = S.oppCap1 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.oppIndex1,
      SurplusCapPacket.oppCap1, hi]

private theorem capByIndex_oppIndex2_eq_oppCap2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.oppIndex2 = S.oppCap2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.oppIndex2,
      SurplusCapPacket.oppCap2, hi]

private theorem card_eq_card_Icc_of_interval_image
    {n : ℕ} {phi : Fin n → ℝ²} (hinj : Function.Injective phi)
    {C : Finset ℝ²} {lo hi : Fin n}
    (hC : ∀ x : ℝ²,
      x ∈ C ↔ ∃ q : Fin n, lo ≤ q ∧ q ≤ hi ∧ phi q = x) :
    C.card = (Finset.Icc lo hi).card := by
  have hset : C = (Finset.Icc lo hi).image phi := by
    ext x
    constructor
    · intro hx
      rcases (hC x).1 hx with ⟨q, hlo, hhi, rfl⟩
      exact Finset.mem_image.mpr ⟨q, Finset.mem_Icc.mpr ⟨hlo, hhi⟩, rfl⟩
    · intro hx
      rcases Finset.mem_image.mp hx with ⟨q, hq, rfl⟩
      rcases Finset.mem_Icc.mp hq with ⟨hlo, hhi⟩
      exact (hC (phi q)).2 ⟨q, hlo, hhi, rfl⟩
  rw [hset, Finset.card_image_of_injective _ hinj]

/-- Exact CCW normalization before reflecting the second branch.  The two
branches are the only possible placements of the named Moser vertices after
cutting the ambient boundary order at the vertex opposite the surplus cap. -/
inductive Card13CcwApexPlacement
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (phi : Fin 13 → ℝ²) : Prop
  | direct
      (zero_eq : phi 0 = S.oppositeVertexByIndex S.surplusIdx)
      (first_eq : phi 4 = S.oppositeVertexByIndex S.oppIndex1)
      (second_eq : phi 8 = S.oppositeVertexByIndex S.oppIndex2)
  | reverse
      (zero_eq : phi 0 = S.oppositeVertexByIndex S.surplusIdx)
      (second_eq : phi 5 = S.oppositeVertexByIndex S.oppIndex2)
      (first_eq : phi 9 = S.oppositeVertexByIndex S.oppIndex1)

/-- Three points in the strict part of a five-point cap have only the two
reflected asymmetric order types once the blocker lies strictly between the
source and the third point.  This is the finite bookkeeping behind the
`asymmetricSourceLeft` / `asymmetricSourceRight` split in the ordinal CNF. -/
theorem fin5_straddling_interior_orbits
    (source blocker third : Fin 5)
    (hsource : (0 : Fin 5) < source ∧ source < (4 : Fin 5))
    (hblocker : (0 : Fin 5) < blocker ∧ blocker < (4 : Fin 5))
    (hthird : (0 : Fin 5) < third ∧ third < (4 : Fin 5))
    (hstraddle :
      (source < blocker ∧ blocker < third) ∨
        (third < blocker ∧ blocker < source)) :
    (source = (1 : Fin 5) ∧ blocker = (2 : Fin 5) ∧
        third = (3 : Fin 5)) ∨
      (source = (3 : Fin 5) ∧ blocker = (2 : Fin 5) ∧
        third = (1 : Fin 5)) := by
  omega

/-- The card-thirteen exact-five parent has one ambient CCW boundary
enumeration with the named apices in exactly the direct `(0,4,8)` placement or
the reverse `(0,5,9)` placement. -/
theorem exists_card13_ccw_boundary_apexPlacement
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    (Q : FrontierBiApexRobustExactFiveSecondCapResidual B)
    (hcard : D.A.card = 13) :
    ∃ phi : Fin 13 → ℝ²,
      Function.Injective phi ∧
      Finset.univ.image phi = D.A ∧
      EuclideanGeometry.IsCcwConvexPolygon phi ∧
      Card13CcwApexPlacement (D := D) (S := S) phi := by
  rcases S.exists_ccw_boundary_order_at_surplus_apex_with_opposite_indices
      D.nonempty D.convex D.K4 with
    ⟨n, hn, phi, iv, iw, hinj, himage, hccw, hzero, hfirst, hsecond, horder⟩
  have hn13 : n = 13 := by
    have hcardImage := Finset.card_image_of_injective Finset.univ hinj
    rw [himage, Finset.card_univ, Fintype.card_fin] at hcardImage
    omega
  subst n
  have hzeroFin : (⟨0, hn⟩ : Fin 13) = 0 := by rfl
  rw [hzeroFin] at hzero horder
  refine ⟨phi, hinj, himage, hccw, ?_⟩
  have hcards := cap_cards_eq_five_six_five Q hcard
  rcases horder with ⟨hzeroIv, hivIw⟩ | ⟨hzeroIw, hiwIv⟩
  · have hphysicalInterval :=
        S.capByIndex_interval_of_global_indices S.oppIndex2 hccw hinj himage
          hzeroIv (Or.inr hivIw)
          (by simpa [S.triangleByIndex_v1_eq_oppositeVertexByIndex]
            using hsecond)
          (by simpa [S.triangleByIndex_oppIndex2_v2_eq_oppositeVertexByIndex_surplusIdx]
            using hzero)
          (by simpa [S.triangleByIndex_oppIndex2_v3_eq_oppositeVertexByIndex_oppIndex1]
            using hfirst)
    have hphysicalCard : (S.capByIndex S.oppIndex2).card = 5 := by
      rw [capByIndex_oppIndex2_eq_oppCap2]
      exact hcards.2.2
    have hgap0 := card_eq_card_Icc_of_interval_image hinj hphysicalInterval
    rw [hphysicalCard, Fin.card_Icc] at hgap0
    have hivVal : iv.val = 4 := by omega
    have hivEq : iv = (4 : Fin 13) := Fin.ext hivVal
    have hsurplusInterval :=
      S.capByIndex_interval_of_global_indices S.surplusIdx hccw hinj himage
        hivIw (Or.inl hzeroIv)
        (by simpa [S.triangleByIndex_v1_eq_oppositeVertexByIndex] using hzero)
        (by simpa [S.triangleByIndex_surplusIdx_v2_eq_oppositeVertexByIndex_oppIndex1]
          using hfirst)
        (by simpa [S.triangleByIndex_surplusIdx_v3_eq_oppositeVertexByIndex_oppIndex2]
          using hsecond)
    have hsurplusCard : (S.capByIndex S.surplusIdx).card = 5 := by
      rw [capByIndex_surplusIdx_eq_surplusCap]
      exact hcards.1
    have hgap1 := card_eq_card_Icc_of_interval_image hinj hsurplusInterval
    rw [hsurplusCard, Fin.card_Icc] at hgap1
    have hiwVal : iw.val = 8 := by omega
    have hiwEq : iw = (8 : Fin 13) := Fin.ext hiwVal
    apply Card13CcwApexPlacement.direct
    · exact hzero
    · simpa [hivEq] using hfirst
    · simpa [hiwEq] using hsecond
  · have hfirstOppInterval :=
        S.capByIndex_reverse_interval_of_global_indices S.oppIndex1 hccw hinj himage
          hzeroIw (Or.inr hiwIv)
          (by simpa [S.triangleByIndex_v1_eq_oppositeVertexByIndex] using hfirst)
          (by simpa [S.triangleByIndex_oppIndex1_v2_eq_oppositeVertexByIndex_oppIndex2]
            using hsecond)
          (by simpa [S.triangleByIndex_oppIndex1_v3_eq_oppositeVertexByIndex_surplusIdx]
            using hzero)
    have hfirstOppCard : (S.capByIndex S.oppIndex1).card = 6 := by
      rw [capByIndex_oppIndex1_eq_oppCap1]
      exact hcards.2.1
    have hgap0 := card_eq_card_Icc_of_interval_image hinj hfirstOppInterval
    rw [hfirstOppCard, Fin.card_Icc] at hgap0
    have hiwVal : iw.val = 5 := by omega
    have hiwEq : iw = (5 : Fin 13) := Fin.ext hiwVal
    have hsurplusInterval :=
      S.capByIndex_reverse_interval_of_global_indices S.surplusIdx hccw hinj himage
        hiwIv (Or.inl hzeroIw)
        (by simpa [S.triangleByIndex_v1_eq_oppositeVertexByIndex] using hzero)
        (by simpa [S.triangleByIndex_surplusIdx_v2_eq_oppositeVertexByIndex_oppIndex1]
          using hfirst)
        (by simpa [S.triangleByIndex_surplusIdx_v3_eq_oppositeVertexByIndex_oppIndex2]
          using hsecond)
    have hsurplusCard : (S.capByIndex S.surplusIdx).card = 5 := by
      rw [capByIndex_surplusIdx_eq_surplusCap]
      exact hcards.1
    have hgap1 := card_eq_card_Icc_of_interval_image hinj hsurplusInterval
    rw [hsurplusCard, Fin.card_Icc] at hgap1
    have hivVal : iv.val = 9 := by omega
    have hivEq : iv = (9 : Fin 13) := Fin.ext hivVal
    apply Card13CcwApexPlacement.reverse
    · exact hzero
    · simpa [hiwEq] using hsecond
    · simpa [hivEq] using hfirst

#print axioms exists_card13_ccw_boundary_apexPlacement
#print axioms fin5_straddling_interior_orbits
#print axioms strictKalmanson_pair_reverseCyclicIndex13

end ATailExactFiveCard13CnfIngressScratch
end Problem97
