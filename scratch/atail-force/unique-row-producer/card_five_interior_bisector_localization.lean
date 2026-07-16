/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import card_five_interior_survivor_pair
import Erdos9796Proof.P97.CapSelectedRowCounting
import Erdos9796Proof.P97.U1CarrierInjection
import Erdos9796Proof.P97.Dumitrescu.L1

/-!
# Interior-pair bisector localization and the coincident-blocker saturation

Three results supporting the FA-UNIQ residual-configuration decomposition.

* `interior_pair_bisector_center_mem_capInterior` (T1): any carrier point
  other than the first opposite apex that is equidistant from a strict-
  interior selected pair lies in the same strict cap interior.  This
  generalizes the directed-cross blocker localization from the chosen
  blocker to every bisector center, and it needs neither a positive-radius
  nor a cardinality hypothesis, so it serves the card-four and card-five
  branches uniformly.

* `cross_survival_of_distinct_blockers` (T5): on a survivor relocation
  packet with a first-apex class of size at least five, distinct chosen
  blocker centers force at least one directed cross-deletion survival.
  This replaces the unproved `CardFiveDistinctCapLocalCrossHypothesis`
  route by a proved dichotomy: distinct blockers cannot be mutually
  cross-incident.

* `coincident_blocker_no_third_bisector_center` (D): in the exact
  card-five coincident-blocker branch, the first opposite apex and the
  common blocker already saturate Dumitrescu's perpendicular-bisector
  bound, so no other carrier point is equidistant from the frontier pair.
  In particular no residual carrier point carries a selected four-class
  through the common pair; the only escapes are the apex itself and the
  common blocker.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailUniqueRowProducerScratch

open ATAILStageOnePrescribedApexDichotomy
open ATailCriticalPairFrontier

attribute [local instance] Classical.propDecidable

private theorem oppApex1_eq_oppositeVertexByIndex_oppIndex1'
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 = S.oppositeVertexByIndex S.oppIndex1 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.oppApex1,
      SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.oppIndex1, hi]

/-- The vertex opposite one indexed cap belongs to every other indexed cap. -/
private theorem oppositeVertexByIndex_mem_capByIndex_of_ne
    {A : Finset ℝ²} (S : SurplusCapPacket A) {i j : Fin 3}
    (hij : i ≠ j) :
    S.oppositeVertexByIndex i ∈ S.capByIndex j := by
  fin_cases i <;> fin_cases j
  · exact False.elim (hij rfl)
  · simpa [SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.capByIndex] using S.partition.v1_mem_C2
  · simpa [SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.capByIndex] using S.partition.v1_mem_C3
  · simpa [SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.capByIndex] using S.partition.v2_mem_C1
  · exact False.elim (hij rfl)
  · simpa [SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.capByIndex] using S.partition.v2_mem_C3
  · simpa [SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.capByIndex] using S.partition.v3_mem_C1
  · simpa [SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.capByIndex] using S.partition.v3_mem_C2
  · exact False.elim (hij rfl)

/-- Two distinct centers in one indexed ordered cap cannot both bisect the
same distinct carrier pair outside that cap. -/
private theorem false_of_two_cap_centers_equidistant_outside_pair
    {D : CounterexampleData} (S : SurplusCapPacket D.A) (k : Fin 3)
    {c apex a b : ℝ²}
    (hcCap : c ∈ S.capByIndex k)
    (hapexCap : apex ∈ S.capByIndex k)
    (hc_ne_apex : c ≠ apex)
    (haA : a ∈ D.A) (hbA : b ∈ D.A) (hab : a ≠ b)
    (haOff : a ∉ S.capByIndex k) (hbOff : b ∉ S.capByIndex k)
    (hcEq : dist c a = dist c b)
    (hapexEq : dist apex a = dist apex b) :
    False := by
  classical
  rcases S.capByIndex_cgn4g_capData D.convex k with
    ⟨m, L, Packet, _Hside, Hord, hcap⟩
  have hcImage : c ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact hcCap
  have hapexImage : apex ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact hapexCap
  rcases Finset.mem_image.mp hcImage with ⟨ic, _hic, hic⟩
  rcases Finset.mem_image.mp hapexImage with ⟨ia, _hia, hia⟩
  have hic_ne_ia : ic ≠ ia := by
    intro h
    apply hc_ne_apex
    calc
      c = L.points ic := hic.symm
      _ = L.points ia := by simp [h]
      _ = apex := hia
  have haOutside : a ∉ Finset.univ.image L.points := by
    simpa [hcap] using haOff
  have hbOutside : b ∉ Finset.univ.image L.points := by
    simpa [hcap] using hbOff
  rcases lt_or_gt_of_ne hic_ne_ia with hlt | hgt
  · exact CapSelectedRowCounting.outsidePair_unique_capCenter
      D.convex Hord Packet.mem_A hlt haA hbA haOutside hbOutside hab
      (by simpa [hic] using hcEq)
      (by simpa [hia] using hapexEq)
  · exact CapSelectedRowCounting.outsidePair_unique_capCenter
      D.convex Hord Packet.mem_A hgt haA hbA haOutside hbOutside hab
      (by simpa [hia] using hapexEq)
      (by simpa [hic] using hcEq)

private theorem interior_oppIndex1_not_mem_surplusCap
    {A : Finset ℝ²} (S : SurplusCapPacket A) {x : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.oppIndex1) :
    x ∉ S.surplusCap := by
  have hnot := S.capInteriorByIndex_not_mem_capByIndex_of_ne hx
    S.surplusIdx_ne_oppIndex1.symm
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simpa [SurplusCapPacket.capByIndex,
      SurplusCapPacket.surplusCap, hi] using hnot

/-- T1.  Any carrier point other than the first opposite apex that is
equidistant from a strict-interior selected pair lies in the pair's own
strict cap interior.  No positive-radius or cardinality hypothesis is
needed, so this localizes bisector centers uniformly in the card-four and
card-five branches. -/
theorem interior_pair_bisector_center_mem_capInterior
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {q w c : ℝ²}
    (hq : q ∈ SelectedClass D.A S.oppApex1 r ∩
      S.capInteriorByIndex S.oppIndex1)
    (hw : w ∈ SelectedClass D.A S.oppApex1 r ∩
      S.capInteriorByIndex S.oppIndex1)
    (hqw : q ≠ w)
    (hcA : c ∈ D.A)
    (hcApex : c ≠ S.oppApex1)
    (hcEq : dist c q = dist c w) :
    c ∈ S.capInteriorByIndex S.oppIndex1 := by
  classical
  have hqClass := (Finset.mem_inter.mp hq).1
  have hwClass := (Finset.mem_inter.mp hw).1
  have hqInterior := (Finset.mem_inter.mp hq).2
  have hwInterior := (Finset.mem_inter.mp hw).2
  have hqA := (mem_selectedClass.mp hqClass).1
  have hwA := (mem_selectedClass.mp hwClass).1
  have happ := oppApex1_eq_oppositeVertexByIndex_oppIndex1' S
  have hqClass' :
      q ∈ SelectedClass D.A
        (S.oppositeVertexByIndex S.oppIndex1) r := by
    simpa [← happ] using hqClass
  have hwClass' :
      w ∈ SelectedClass D.A
        (S.oppositeVertexByIndex S.oppIndex1) r := by
    simpa [← happ] using hwClass
  have hc_ne_opp : c ≠ S.oppositeVertexByIndex S.oppIndex1 := by
    simpa [← happ] using hcApex
  have hc_ne_left : c ≠ S.leftOuterVertexByIndex S.oppIndex1 := by
    intro hc
    have hne := S.capInterior_pair_dist_ne_leftOuter_of_selectedClass
      S.oppIndex1 hqInterior hwInterior hqw hqClass' hwClass'
    apply hne
    simpa [hc, dist_comm] using hcEq
  have hc_ne_right : c ≠ S.rightOuterVertexByIndex S.oppIndex1 := by
    intro hc
    have hne := S.capInterior_pair_dist_ne_rightOuter_of_selectedClass
      S.oppIndex1 hqInterior hwInterior hqw hqClass' hwClass'
    apply hne
    simpa [hc, dist_comm] using hcEq
  have hc_ne_surplusOpp :
      c ≠ S.oppositeVertexByIndex S.surplusIdx := by
    intro hc
    apply hc_ne_left
    exact hc.trans
      S.leftOuterVertexByIndex_oppIndex1_eq_oppositeVertexByIndex_surplusIdx.symm
  have hc_ne_opp2 : c ≠ S.oppositeVertexByIndex S.oppIndex2 := by
    intro hc
    apply hc_ne_right
    exact hc.trans
      S.rightOuterVertexByIndex_oppIndex1_eq_oppositeVertexByIndex_oppIndex2.symm
  have hc_not_triangle : c ∉ S.triangle.verts := by
    intro hcTriangle
    rcases S.mem_triangle_verts_oppositeVertexByIndex_cases hcTriangle with
      hc | hc | hc
    · exact hc_ne_surplusOpp hc
    · exact hc_ne_opp hc
    · exact hc_ne_opp2 hc
  rcases S.mem_triangle_verts_or_exists_capInteriorByIndex_of_mem hcA with
    hcTriangle | ⟨j, hcInterior⟩
  · exact False.elim (hc_not_triangle hcTriangle)
  · have hj : j = S.oppIndex1 := by
      by_contra hji
      have hij : S.oppIndex1 ≠ j := Ne.symm hji
      have hcCap : c ∈ S.capByIndex j :=
        S.capInteriorByIndex_subset_capByIndex j hcInterior
      have hapexCap :
          S.oppositeVertexByIndex S.oppIndex1 ∈ S.capByIndex j :=
        oppositeVertexByIndex_mem_capByIndex_of_ne S hij
      have hqOff : q ∉ S.capByIndex j :=
        S.capInteriorByIndex_not_mem_capByIndex_of_ne hqInterior hij
      have hwOff : w ∉ S.capByIndex j :=
        S.capInteriorByIndex_not_mem_capByIndex_of_ne hwInterior hij
      have hapexEq :
          dist (S.oppositeVertexByIndex S.oppIndex1) q =
            dist (S.oppositeVertexByIndex S.oppIndex1) w :=
        (mem_selectedClass.mp hqClass').2.trans
          (mem_selectedClass.mp hwClass').2.symm
      exact false_of_two_cap_centers_equidistant_outside_pair S j
        hcCap hapexCap hc_ne_opp hqA hwA hqw
        hqOff hwOff hcEq hapexEq
    simpa [hj] using hcInterior

/-- Every bisector center localized by T1 avoids the surplus cap. -/
theorem interior_pair_bisector_center_not_mem_surplusCap
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {q w c : ℝ²}
    (hq : q ∈ SelectedClass D.A S.oppApex1 r ∩
      S.capInteriorByIndex S.oppIndex1)
    (hw : w ∈ SelectedClass D.A S.oppApex1 r ∩
      S.capInteriorByIndex S.oppIndex1)
    (hqw : q ≠ w)
    (hcA : c ∈ D.A)
    (hcApex : c ≠ S.oppApex1)
    (hcEq : dist c q = dist c w) :
    c ∉ S.surplusCap :=
  interior_oppIndex1_not_mem_surplusCap S
    (interior_pair_bisector_center_mem_capInterior
      hq hw hqw hcA hcApex hcEq)

/-- The card-four analogue of the interior counting: an exact card-four
class at an opposite vertex has at least two members in the strict interior
of that vertex's opposite cap. -/
theorem selectedClass_capInteriorByIndex_card_ge_two_of_card_four
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) (i : Fin 3) {radius : ℝ}
    (hradius : 0 < radius)
    (hcard :
      (SelectedClass A (S.oppositeVertexByIndex i) radius).card = 4) :
    2 ≤ (SelectedClass A (S.oppositeVertexByIndex i) radius ∩
      S.capInteriorByIndex i).card := by
  classical
  let T : Finset ℝ² :=
    SelectedClass A (S.oppositeVertexByIndex i) radius
  have hleftOne :
      (T ∩ S.leftAdjacentCapByIndex i).card ≤ 1 := by
    simpa [T] using
      S.leftAdjacentCap_at_opposite_card_le_one_of_convexIndep
        hconv i radius
  have hrightOne :
      (T ∩ S.rightAdjacentCapByIndex i).card ≤ 1 := by
    simpa [T] using
      S.rightAdjacentCap_at_opposite_card_le_one_of_convexIndep
        hconv i radius
  have hcover :
      T \ S.capInteriorByIndex i ⊆
        (T ∩ S.leftAdjacentCapByIndex i) ∪
          (T ∩ S.rightAdjacentCapByIndex i) := by
    simpa [T] using
      S.selectedClass_sdiff_capInteriorByIndex_subset_adjacentCaps i hradius
  have houtside :
      (T \ S.capInteriorByIndex i).card ≤ 2 := by
    calc
      (T \ S.capInteriorByIndex i).card
          ≤ ((T ∩ S.leftAdjacentCapByIndex i) ∪
              (T ∩ S.rightAdjacentCapByIndex i)).card :=
        Finset.card_le_card hcover
      _ ≤ (T ∩ S.leftAdjacentCapByIndex i).card +
            (T ∩ S.rightAdjacentCapByIndex i).card :=
        Finset.card_union_le _ _
      _ ≤ 1 + 1 := by omega
      _ = 2 := by norm_num
  have hsplit :
      (T \ S.capInteriorByIndex i).card +
          (T ∩ S.capInteriorByIndex i).card = T.card := by
    simp [T, Finset.card_sdiff_add_card_inter]
  have hcardT : T.card = 4 := by
    simpa [T] using hcard
  change 2 ≤ (T ∩ S.capInteriorByIndex i).card
  omega

/-- The exact first-apex card-four class has at least two members in the
strict interior of the first non-surplus cap. -/
theorem firstApex_cardFour_interior_card_ge_two
    (D : CounterexampleData) (S : SurplusCapPacket D.A) {r : ℝ}
    (hr : 0 < r)
    (hcard : (SelectedClass D.A S.oppApex1 r).card = 4) :
    2 ≤ (SelectedClass D.A S.oppApex1 r ∩
      S.capInteriorByIndex S.oppIndex1).card := by
  rw [oppApex1_eq_oppositeVertexByIndex_oppIndex1' S] at hcard ⊢
  exact selectedClass_capInteriorByIndex_card_ge_two_of_card_four
    S D.convex S.oppIndex1 hr hcard

/-- The exact card-four branch has a strict-interior selected pair, so the
bisector-center localization T1 applies to it verbatim. -/
theorem exists_cardFour_interior_pair
    (D : CounterexampleData) (S : SurplusCapPacket D.A) {r : ℝ}
    (hr : 0 < r)
    (hcard : (SelectedClass D.A S.oppApex1 r).card = 4) :
    ∃ q w : ℝ²,
      q ∈ SelectedClass D.A S.oppApex1 r ∩
        S.capInteriorByIndex S.oppIndex1 ∧
      w ∈ SelectedClass D.A S.oppApex1 r ∩
        S.capInteriorByIndex S.oppIndex1 ∧
      q ≠ w := by
  have htwo := firstApex_cardFour_interior_card_ge_two D S hr hcard
  have hone : 1 < (SelectedClass D.A S.oppApex1 r ∩
      S.capInteriorByIndex S.oppIndex1).card := by omega
  rcases Finset.one_lt_card.mp hone with ⟨q, hq, w, hw, hqw⟩
  exact ⟨q, w, hq, hw, hqw⟩

/-- T5.  On a first-apex class of size at least five, distinct chosen
blocker centers force at least one directed cross-deletion survival:
otherwise both cross memberships hold and the blockers coincide. -/
theorem cross_survival_of_distinct_blockers
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    (hr : 0 < r)
    (hfive : 5 ≤ (SelectedClass D.A S.oppApex1 r).card)
    (hcenters : H.centerAt P.q P.q_mem_A ≠ H.centerAt P.w P.w_mem_A) :
    HasNEquidistantPointsAt 4 (D.A.erase P.w)
        (H.centerAt P.q P.q_mem_A) ∨
      HasNEquidistantPointsAt 4 (D.A.erase P.q)
        (H.centerAt P.w P.w_mem_A) := by
  rcases cross_deletion_survives_or_cross_membership P with hqSurv | hwq
  · exact Or.inl hqSurv
  · let P' : SurvivorPairRelocationPacket D S r H :=
      { q := P.w
        w := P.q
        q_mem_A := P.w_mem_A
        w_mem_A := P.q_mem_A
        q_mem_marginal := P.w_mem_marginal
        w_mem_marginal := P.q_mem_marginal
        q_ne_w := P.q_ne_w.symm
        q_survives := P.w_survives
        w_survives := P.q_survives
        q_blocker_ne_oppApex2 := P.w_blocker_ne_oppApex2
        w_blocker_ne_oppApex2 := P.q_blocker_ne_oppApex2 }
    rcases cross_deletion_survives_or_cross_membership P' with hwSurv | hqw
    · exact Or.inr (by simpa [P'] using hwSurv)
    · exact absurd
        (blocker_centers_eq_of_five_le_of_mutual_cross_membership
          P hr hfive hwq (by simpa [P'] using hqw))
        hcenters

private theorem oppApex1_mem_A'
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 ∈ A := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v2_mem
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v3_mem
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v1_mem

private theorem packet_blocker_ne_oppApex1_of_card_five
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    (hr : 0 < r)
    (hcard : (SelectedClass D.A S.oppApex1 r).card = 5) :
    H.centerAt P.q P.q_mem_A ≠ S.oppApex1 := by
  have hfourErase :
      4 ≤ (SelectedClass (D.A.erase P.q) S.oppApex1 r).card :=
    selectedClass_erase_card_ge_of_succ_le
      (by omega : 5 ≤ (SelectedClass D.A S.oppApex1 r).card)
  exact actual_blocker_ne_of_deletion_survives H P.q_mem_A
    ⟨r, hr, by simpa [SelectedClass] using hfourErase⟩

/-- D.  In the exact card-five coincident-blocker branch the first opposite
apex and the common blocker saturate Dumitrescu's perpendicular-bisector
bound: no other carrier point is equidistant from the frontier pair. -/
theorem coincident_blocker_no_third_bisector_center
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    (hr : 0 < r)
    (hcard : (SelectedClass D.A S.oppApex1 r).card = 5)
    (hcenters : H.centerAt P.q P.q_mem_A = H.centerAt P.w P.w_mem_A)
    {x : ℝ²} (hxA : x ∈ D.A)
    (hxApex : x ≠ S.oppApex1)
    (hxBlocker : x ≠ H.centerAt P.q P.q_mem_A) :
    dist x P.q ≠ dist x P.w := by
  classical
  intro hxEq
  have hfive : 5 ≤ (SelectedClass D.A S.oppApex1 r).card := by omega
  rcases (blocker_centers_eq_iff_mutual_cross_membership_of_five_le
      P hr hfive).mp hcenters with ⟨hwq, _hqw⟩
  let c := H.centerAt P.q P.q_mem_A
  let K := (H.selectedAt P.q P.q_mem_A).toCriticalFourShell
  have hcA : c ∈ D.A :=
    (Finset.mem_erase.mp K.center_mem).2
  have hcEq : dist c P.q = dist c P.w :=
    (K.support_eq_radius P.q K.q_mem_support).trans
      (K.support_eq_radius P.w hwq).symm
  have hc_ne_apex : c ≠ S.oppApex1 :=
    packet_blocker_ne_oppApex1_of_card_five P hr hcard
  have hqRadius : dist P.q S.oppApex1 = r :=
    (Finset.mem_filter.mp (Finset.mem_sdiff.mp P.q_mem_marginal).1).2
  have hwRadius : dist P.w S.oppApex1 = r :=
    (Finset.mem_filter.mp (Finset.mem_sdiff.mp P.w_mem_marginal).1).2
  have hapexEq : dist S.oppApex1 P.q = dist S.oppApex1 P.w := by
    rw [dist_comm S.oppApex1 P.q, dist_comm S.oppApex1 P.w,
      hqRadius, hwRadius]
  have hbound := Dumitrescu.perpBisector_apex_bound
    D.convex P.q_mem_A P.w_mem_A P.q_ne_w
  have hthree :
      2 < (D.A.filter (fun y => dist y P.q = dist y P.w)).card := by
    rw [Finset.two_lt_card]
    exact ⟨S.oppApex1, Finset.mem_filter.mpr ⟨oppApex1_mem_A' S, hapexEq⟩,
      c, Finset.mem_filter.mpr ⟨hcA, hcEq⟩,
      x, Finset.mem_filter.mpr ⟨hxA, hxEq⟩,
      Ne.symm hc_ne_apex, Ne.symm hxApex, Ne.symm hxBlocker⟩
  exact (not_lt_of_ge hbound) hthree

/-- Consequence of D: no carrier point other than the apex and the common
blocker carries a selected four-class through the frontier pair.  The two
excluded points are genuine escapes: the apex's card-five class and the
common blocker's own selected shell both contain the pair. -/
theorem coincident_blocker_no_residual_class_through_pair
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    (hr : 0 < r)
    (hcard : (SelectedClass D.A S.oppApex1 r).card = 5)
    (hcenters : H.centerAt P.q P.q_mem_A = H.centerAt P.w P.w_mem_A)
    {x : ℝ²} (hxA : x ∈ D.A)
    (hxApex : x ≠ S.oppApex1)
    (hxBlocker : x ≠ H.centerAt P.q P.q_mem_A)
    (Kx : SelectedFourClass D.A x)
    (hqKx : P.q ∈ Kx.support) (hwKx : P.w ∈ Kx.support) : False :=
  coincident_blocker_no_third_bisector_center P hr hcard hcenters
    hxA hxApex hxBlocker
    ((Kx.support_eq_radius P.q hqKx).trans
      (Kx.support_eq_radius P.w hwKx).symm)

#print axioms interior_pair_bisector_center_mem_capInterior
#print axioms interior_pair_bisector_center_not_mem_surplusCap
#print axioms selectedClass_capInteriorByIndex_card_ge_two_of_card_four
#print axioms firstApex_cardFour_interior_card_ge_two
#print axioms exists_cardFour_interior_pair
#print axioms cross_survival_of_distinct_blockers
#print axioms coincident_blocker_no_third_bisector_center
#print axioms coincident_blocker_no_residual_class_through_pair

end ATailUniqueRowProducerScratch
end Problem97
