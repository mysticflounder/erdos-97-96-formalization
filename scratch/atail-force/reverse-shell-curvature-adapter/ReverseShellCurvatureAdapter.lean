/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import ReverseOutsidePairProducer
import Erdos9796Proof.P97.ConvexCyclicOrder.ShellCurvature

/-!
# Scratch: source-faithful reverse-row shell-curvature adapter

This file retains the actual critical row and constructs the cyclic target
roles required by the shell-curvature theorems.  It then isolates the exact
remaining angle-chart input and records a marginal regression for any proposed
aggregate consumer that uses only the per-row scalar curvature conclusions.
-/

open scoped EuclideanGeometry Real

namespace Problem97
namespace ATailReverseShellCurvatureAdapterScratch

open ATailCriticalPairFrontier
open ATailLargeCapUniqueFive
open ATailLargeCapUniqueFivePhysicalOmissionCycle
open ATailExactFiveReverseMembershipClosureScratch
open ATailPhysicalOmissionCycleParentAdapterScratch
open ATailExactFiveReverseOutsidePairProducerScratch

attribute [local instance] Classical.propDecidable

noncomputable section

set_option maxHeartbeats 2000000

/-- Periodic natural-number lift of one finite boundary enumeration. -/
def periodicPoint {n : ℕ} (hn : 0 < n) (phi : Fin n → ℝ²) (k : ℕ) : ℝ² :=
  phi ⟨k % n, Nat.mod_lt k hn⟩

@[simp] theorem periodicPoint_of_lt
    {n : ℕ} (hn : 0 < n) (phi : Fin n → ℝ²) (k : ℕ)
    (hk : k < n) :
    periodicPoint hn phi k = phi ⟨k, hk⟩ := by
  simp [periodicPoint, Nat.mod_eq_of_lt hk]

@[simp] theorem periodicPoint_add_period
    {n : ℕ} (hn : 0 < n) (phi : Fin n → ℝ²) (k : ℕ) :
    periodicPoint hn phi (k + n) = periodicPoint hn phi k := by
  simp [periodicPoint]

/-- Lift a finite index into the first forward window after `cut`. -/
def forwardLift {n : ℕ} (cut j : Fin n) : ℕ :=
  if cut < j then j.1 else j.1 + n

theorem forwardLift_mod
    {n : ℕ} (cut j : Fin n) :
    forwardLift cut j % n = j.1 := by
  simp only [forwardLift]
  split_ifs <;> simp [Nat.mod_eq_of_lt j.2]

theorem periodicPoint_forwardLift
    {n : ℕ} (hn : 0 < n) (phi : Fin n → ℝ²) (cut j : Fin n) :
    periodicPoint hn phi (forwardLift cut j) = phi j := by
  unfold periodicPoint
  apply congrArg phi
  apply Fin.ext
  exact forwardLift_mod cut j

/-- The retained global cap block, together with the actual reverse row's
same-cap source pair straddling its blocker in that block's local order. -/
structure ReverseRowGlobalBlockStraddle
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (K : PhysicalActualCriticalOmissionCycle H profile)
    (i : Fin K.period) : Type where
  localStraddle : ReverseRowCapStraddle K i
  block : CGN.StrictCapBlockData D.A (S.capByIndex S.oppIndex2)
  centerLocal : Fin block.m
  leftLocal : Fin block.m
  rightLocal : Fin block.m
  left_lt_center : leftLocal < centerLocal
  center_lt_right : centerLocal < rightLocal
  center_point_eq : block.L.points centerLocal = reverseRowCenter K i
  source_points_eq :
    (block.L.points leftLocal = (K.source i).1 ∧
      block.L.points rightLocal =
        (K.source (K.successorIndex i)).1) ∨
    (block.L.points leftLocal =
        (K.source (K.successorIndex i)).1 ∧
      block.L.points rightLocal = (K.source i).1)

/-- Rebuild the straddling indices in the retained global cap block.  The
input `P` keeps the previously checked local straddle certificate attached;
the proof uses the same one-sided distance-injectivity argument for the
block's own local order. -/
theorem nonempty_reverseRowGlobalBlockStraddle
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (K : PhysicalActualCriticalOmissionCycle H profile)
    (hreverse : ∀ i : Fin K.period,
      (K.source i).1 ∈
        (H.selectedAt (K.source (K.successorIndex i)).1
          (PhysicalVertex.mem_A
            (K.source (K.successorIndex i)))).toCriticalFourShell.support)
    (i : Fin K.period) (P : ReverseRowCapStraddle K i) :
    Nonempty (ReverseRowGlobalBlockStraddle K i) := by
  let row := (H.selectedAt (K.source (K.successorIndex i)).1
    (PhysicalVertex.mem_A
      (K.source (K.successorIndex i)))).toCriticalFourShell
  have hcenterCap : reverseRowCenter K i ∈ S.capByIndex S.oppIndex2 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex2
      (successor_actualBlocker_mem_physicalCapInterior K hreverse i)
  have hleftCap : (K.source i).1 ∈ S.capByIndex S.oppIndex2 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex2
      (K.source_mem_capInterior i)
  have hrightCap :
      (K.source (K.successorIndex i)).1 ∈
        S.capByIndex S.oppIndex2 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex2
      (K.source_mem_capInterior (K.successorIndex i))
  rcases S.capByIndex_cgn4g_strictCapBlockData D.convex S.oppIndex2 with
    ⟨B⟩
  rcases B.exists_index_of_mem_cap hcenterCap with ⟨c, hc⟩
  rcases B.exists_index_of_mem_cap hleftCap with ⟨r, hr⟩
  rcases B.exists_index_of_mem_cap hrightCap with ⟨s, hs⟩
  have hdist : dist (B.L.points c) (B.L.points r) =
      dist (B.L.points c) (B.L.points s) := by
    have hrowEq :
        dist (reverseRowCenter K i) (K.source i).1 =
          dist (reverseRowCenter K i)
            (K.source (K.successorIndex i)).1 :=
      (row.support_eq_radius (K.source i).1 (hreverse i)).trans
        (row.support_eq_radius (K.source (K.successorIndex i)).1
          row.q_mem_support).symm
    simpa [hc, hr, hs] using hrowEq
  have hcenter_ne_left : reverseRowCenter K i ≠ (K.source i).1 := by
    intro h
    apply row.center_not_mem_support
    have h' :
        H.centerAt (K.source (K.successorIndex i)).1
            (PhysicalVertex.mem_A (K.source (K.successorIndex i))) =
          (K.source i).1 := by
      simpa [reverseRowCenter] using h
    exact (congrArg (fun x => x ∈ row.support) h').symm.mp (hreverse i)
  have hcenter_ne_right :
      reverseRowCenter K i ≠ (K.source (K.successorIndex i)).1 := by
    intro h
    apply row.center_not_mem_support
    have h' :
        H.centerAt (K.source (K.successorIndex i)).1
            (PhysicalVertex.mem_A (K.source (K.successorIndex i))) =
          (K.source (K.successorIndex i)).1 := by
      simpa [reverseRowCenter] using h
    exact
      (congrArg (fun x => x ∈ row.support) h').symm.mp
        row.q_mem_support
  have hcr : c ≠ r := by
    intro h
    apply hcenter_ne_left
    calc
      reverseRowCenter K i = B.L.points c := hc.symm
      _ = B.L.points r := by rw [h]
      _ = (K.source i).1 := hr
  have hcs : c ≠ s := by
    intro h
    apply hcenter_ne_right
    calc
      reverseRowCenter K i = B.L.points c := hc.symm
      _ = B.L.points s := by rw [h]
      _ = (K.source (K.successorIndex i)).1 := hs
  have hrs : r ≠ s := by
    intro h
    apply K.successor_source_ne i
    apply Subtype.ext
    calc
      (K.source (K.successorIndex i)).1 = B.L.points s := hs.symm
      _ = B.L.points r := by rw [h]
      _ = (K.source i).1 := hr
  have hinj := CGN.oneSidedDistanceInjective_of_mecCapPacket
    B.Packet B.Hside B.Hord
  rcases lt_or_gt_of_ne hcr with hcrLt | hrcLt
  · have hscLt : s < c := by
      rcases lt_or_gt_of_ne hcs with hcsLt | hscLt
      · rcases lt_or_gt_of_ne hrs with hrsLt | hsrLt
        · exact False.elim ((hinj.1 hcrLt hrsLt) hdist)
        · exact False.elim ((hinj.1 hcsLt hsrLt) hdist.symm)
      · exact hscLt
    exact ⟨{
      localStraddle := P
      block := B
      centerLocal := c
      leftLocal := s
      rightLocal := r
      left_lt_center := hscLt
      center_lt_right := hcrLt
      center_point_eq := hc
      source_points_eq := Or.inr ⟨hs, hr⟩ }⟩
  · have hcsLt : c < s := by
      rcases lt_or_gt_of_ne hcs with hcsLt | hscLt
      · exact hcsLt
      · rcases lt_or_gt_of_ne hrs with hrsLt | hsrLt
        · exact False.elim ((hinj.2 hrsLt hscLt) hdist)
        · exact False.elim ((hinj.2 hsrLt hrcLt) hdist.symm)
    exact ⟨{
      localStraddle := P
      block := B
      centerLocal := c
      leftLocal := r
      rightLocal := s
      left_lt_center := hrcLt
      center_lt_right := hcsLt
      center_point_eq := hc
      source_points_eq := Or.inl ⟨hr, hs⟩ }⟩

/-- Natural-number cyclic window for one actual reverse row.  The exact two
same-cap sources occupy the endpoint roles `q1,q4`, while the exact outside
residual occupies the middle roles `q2,q3`. -/
structure ReverseRowCyclicRoles
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (K : PhysicalActualCriticalOmissionCycle H profile)
    (i : Fin K.period) : Type where
  global : ReverseRowGlobalBlockStraddle K i
  point : ℕ → ℝ²
  p : ℕ
  q1 : ℕ
  q2 : ℕ
  q3 : ℕ
  q4 : ℕ
  cycleEnd : ℕ
  p_pos : 0 < p
  p_lt_q1 : p < q1
  q1_lt_q2 : q1 < q2
  q2_lt_q3 : q2 < q3
  q3_lt_q4 : q3 < q4
  q4_lt_cycleEnd : q4 < cycleEnd
  point_p_eq_center : point p = reverseRowCenter K i
  point_cycleEnd_eq_point_p : point cycleEnd = point p
  sameCap_endpoint_roles :
    ({point q1, point q4} : Finset ℝ²) =
      {(K.source i).1, (K.source (K.successorIndex i)).1}
  outside_middle_roles :
    ({point q2, point q3} : Finset ℝ²) = reverseOutsidePair K i
  support_eq_ordered_roles :
    (H.selectedAt (K.source (K.successorIndex i)).1
      (PhysicalVertex.mem_A
        (K.source (K.successorIndex i)))).toCriticalFourShell.support =
      {point q1, point q2, point q3, point q4}

private theorem outside_index_side
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (B : CGN.StrictCapBlockData D.A (S.capByIndex S.oppIndex2))
    {x : ℝ²} (hxOutside : x ∉ S.capByIndex S.oppIndex2)
    {j : Fin B.n} (hj : B.phi j = x) :
    j < B.Block.lo ∨ B.Block.hi < j := by
  by_contra h
  push_neg at h
  have hjRange : B.Block.lo ≤ j ∧ j ≤ B.Block.hi := h
  rcases (B.Block.idx_range_exact j).mp hjRange with ⟨t, ht⟩
  apply hxOutside
  have hpoint : B.L.points t = x := by
    rw [B.Block.points_eq t, ht, hj]
  have himage : B.L.points t ∈ Finset.univ.image B.L.points :=
    Finset.mem_image_of_mem B.L.points (Finset.mem_univ t)
  rw [B.cap_image, hpoint] at himage
  exact himage

private theorem forwardLift_between_block_sides
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (B : CGN.StrictCapBlockData D.A (S.capByIndex S.oppIndex2))
    {l c r : Fin B.m} (hlc : l < c) (hcr : c < r)
    {j : Fin B.n} (hjSide : j < B.Block.lo ∨ B.Block.hi < j) :
    (B.Block.idx r).1 < forwardLift (B.Block.idx c) j ∧
      forwardLift (B.Block.idx c) j < (B.Block.idx l).1 + B.n := by
  have hlRange := (B.Block.idx_range_exact (B.Block.idx l)).mpr ⟨l, rfl⟩
  have hrRange := (B.Block.idx_range_exact (B.Block.idx r)).mpr ⟨r, rfl⟩
  have hlcGlobal := B.Block.idx_strict hlc
  have hcrGlobal := B.Block.idx_strict hcr
  simp only [forwardLift]
  split_ifs with hcj
  · rcases hjSide with hjLo | hHiJ
    · exact False.elim (by omega)
    · constructor <;> omega
  · rcases hjSide with hjLo | hHiJ
    · constructor <;> omega
    · exact False.elim (by omega)

/-- Construct the exact source-faithful cyclic roles.  No angle lift is
assumed: this is the complete finite/order adapter immediately before the
`CounterclockwiseAngleChart` construction. -/
theorem nonempty_reverseRowCyclicRoles
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (K : PhysicalActualCriticalOmissionCycle H profile)
    (hreverse : ∀ i : Fin K.period,
      (K.source i).1 ∈
        (H.selectedAt (K.source (K.successorIndex i)).1
          (PhysicalVertex.mem_A
            (K.source (K.successorIndex i)))).toCriticalFourShell.support)
    (i : Fin K.period) (P : ReverseRowCapStraddle K i) :
    Nonempty (ReverseRowCyclicRoles K i) := by
  rcases nonempty_reverseRowGlobalBlockStraddle K hreverse i P with ⟨G⟩
  let B := G.block
  let c := B.Block.idx G.centerLocal
  let l := B.Block.idx G.leftLocal
  let r := B.Block.idx G.rightLocal
  have hn : 0 < B.n := by
    have := B.Block.lo.2
    omega
  have hlc : l < c := B.Block.idx_strict G.left_lt_center
  have hcr : c < r := B.Block.idx_strict G.center_lt_right
  have hpPos : 0 < c.1 := by
    have hloRange :=
      (B.Block.idx_range_exact c).mpr ⟨G.centerLocal, rfl⟩
    have hloCenter : B.Block.lo < c := by
      have hfirstLeLeft : B.Block.lo ≤ l :=
        ((B.Block.idx_range_exact l).mpr ⟨G.leftLocal, rfl⟩).1
      exact lt_of_le_of_lt hfirstLeLeft hlc
    omega
  have hpairCard := reverseOutsidePair_card_eq_two K hreverse i
  rw [Finset.card_eq_two] at hpairCard
  rcases hpairCard with ⟨a, b, hab, hpair⟩
  have haPair : a ∈ reverseOutsidePair K i := by simp [hpair]
  have hbPair : b ∈ reverseOutsidePair K i := by simp [hpair]
  have haComp := reverseOutsidePair_subset_complement K i haPair
  have hbComp := reverseOutsidePair_subset_complement K i hbPair
  have haA : a ∈ D.A := (Finset.mem_sdiff.mp haComp).1
  have hbA : b ∈ D.A := (Finset.mem_sdiff.mp hbComp).1
  have haOutside : a ∉ S.capByIndex S.oppIndex2 :=
    (Finset.mem_sdiff.mp haComp).2
  have hbOutside : b ∉ S.capByIndex S.oppIndex2 :=
    (Finset.mem_sdiff.mp hbComp).2
  have haImage : a ∈ Finset.univ.image B.phi := by
    rw [B.Block.phi_image]
    exact haA
  have hbImage : b ∈ Finset.univ.image B.phi := by
    rw [B.Block.phi_image]
    exact hbA
  rcases Finset.mem_image.mp haImage with ⟨ia, _hia, hia⟩
  rcases Finset.mem_image.mp hbImage with ⟨ib, _hib, hib⟩
  have hiaSide := outside_index_side B haOutside hia
  have hibSide := outside_index_side B hbOutside hib
  let qa := forwardLift c ia
  let qb := forwardLift c ib
  have hqaBounds : r.1 < qa ∧ qa < l.1 + B.n := by
    simpa [qa, B, c, l, r] using
      forwardLift_between_block_sides B G.left_lt_center
        G.center_lt_right hiaSide
  have hqbBounds : r.1 < qb ∧ qb < l.1 + B.n := by
    simpa [qb, B, c, l, r] using
      forwardLift_between_block_sides B G.left_lt_center
        G.center_lt_right hibSide
  have hqab : qa ≠ qb := by
    intro h
    have hmods := congrArg (fun x : ℕ => x % B.n) h
    have hijVal : ia.1 = ib.1 := by
      simpa [qa, qb, forwardLift_mod] using hmods
    have hij : ia = ib := Fin.ext hijVal
    apply hab
    calc
      a = B.phi ia := hia.symm
      _ = B.phi ib := by rw [hij]
      _ = b := hib
  let point := periodicPoint hn B.phi
  have hpPoint : point c.1 = reverseRowCenter K i := by
    calc
      point c.1 = B.phi c := by
        change periodicPoint hn B.phi c.1 = B.phi c
        exact periodicPoint_of_lt hn B.phi c.1 c.2
      _ = B.L.points G.centerLocal := (B.Block.points_eq _).symm
      _ = reverseRowCenter K i := G.center_point_eq
  have hendPoint : point (c.1 + B.n) = point c.1 := by
    change periodicPoint hn B.phi (c.1 + B.n) =
      periodicPoint hn B.phi c.1
    exact periodicPoint_add_period hn B.phi c.1
  have hrPoint : point r.1 = B.L.points G.rightLocal := by
    calc
      point r.1 = B.phi r := by
        change periodicPoint hn B.phi r.1 = B.phi r
        exact periodicPoint_of_lt hn B.phi r.1 r.2
      _ = B.L.points G.rightLocal := (B.Block.points_eq _).symm
  have hlPoint : point (l.1 + B.n) = B.L.points G.leftLocal := by
    calc
      point (l.1 + B.n) = point l.1 := by
        change periodicPoint hn B.phi (l.1 + B.n) =
          periodicPoint hn B.phi l.1
        exact periodicPoint_add_period hn B.phi l.1
      _ = B.phi l := by
        change periodicPoint hn B.phi l.1 = B.phi l
        exact periodicPoint_of_lt hn B.phi l.1 l.2
      _ = B.L.points G.leftLocal := (B.Block.points_eq _).symm
  have hqaPoint : point qa = a := by
    calc
      point qa = B.phi ia := by
        simpa [point, qa] using periodicPoint_forwardLift hn B.phi c ia
      _ = a := hia
  have hqbPoint : point qb = b := by
    calc
      point qb = B.phi ib := by
        simpa [point, qb] using periodicPoint_forwardLift hn B.phi c ib
      _ = b := hib
  have hsameRoles :
      ({point r.1, point (l.1 + B.n)} : Finset ℝ²) =
        {(K.source i).1, (K.source (K.successorIndex i)).1} := by
    rw [hrPoint, hlPoint]
    rcases G.source_points_eq with h | h
    · rw [h.1, h.2]
      exact Finset.pair_comm _ _
    · rw [h.1, h.2]
  have houtsideRoles :
      ({point qa, point qb} : Finset ℝ²) = reverseOutsidePair K i := by
    rw [hqaPoint, hqbPoint, hpair]
  let rowSupport : Finset ℝ² :=
    (H.selectedAt (K.source (K.successorIndex i)).1
      (PhysicalVertex.mem_A
        (K.source (K.successorIndex i)))).toCriticalFourShell.support
  have hdecomp :
      rowSupport =
        (rowSupport ∩ S.capByIndex S.oppIndex2) ∪ reverseOutsidePair K i := by
    ext x
    simp only [Finset.mem_union, Finset.mem_inter, reverseOutsidePair,
      Finset.mem_sdiff]
    tauto
  have hinter :
      rowSupport ∩ S.capByIndex S.oppIndex2 =
        {(K.source i).1, (K.source (K.successorIndex i)).1} := by
    simpa [rowSupport] using
      successor_actualCriticalSupport_inter_physicalCap_eq_pair
        K hreverse i
  have hsupportRoles :
      rowSupport =
        {point r.1, point qa, point qb, point (l.1 + B.n)} := by
    rw [hdecomp, hinter, ← hsameRoles, ← houtsideRoles]
    ext x
    simp only [Finset.mem_union, Finset.mem_insert, Finset.mem_singleton]
    tauto
  by_cases habPos : qa < qb
  · exact ⟨{
      global := G
      point := point
      p := c.1
      q1 := r.1
      q2 := qa
      q3 := qb
      q4 := l.1 + B.n
      cycleEnd := c.1 + B.n
      p_pos := hpPos
      p_lt_q1 := by exact_mod_cast hcr
      q1_lt_q2 := hqaBounds.1
      q2_lt_q3 := habPos
      q3_lt_q4 := hqbBounds.2
      q4_lt_cycleEnd := by omega
      point_p_eq_center := hpPoint
      point_cycleEnd_eq_point_p := hendPoint
      sameCap_endpoint_roles := hsameRoles
      outside_middle_roles := houtsideRoles
      support_eq_ordered_roles := by simpa [rowSupport] using hsupportRoles }⟩
  · have hbaPos : qb < qa := lt_of_le_of_ne (le_of_not_gt habPos) hqab.symm
    have hsupportSwap :
        rowSupport =
          {point r.1, point qb, point qa, point (l.1 + B.n)} := by
      rw [hsupportRoles]
      ext x
      simp only [Finset.mem_insert, Finset.mem_singleton]
      tauto
    exact ⟨{
      global := G
      point := point
      p := c.1
      q1 := r.1
      q2 := qb
      q3 := qa
      q4 := l.1 + B.n
      cycleEnd := c.1 + B.n
      p_pos := hpPos
      p_lt_q1 := by exact_mod_cast hcr
      q1_lt_q2 := hqbBounds.1
      q2_lt_q3 := hbaPos
      q3_lt_q4 := hqaBounds.2
      q4_lt_cycleEnd := by omega
      point_p_eq_center := hpPoint
      point_cycleEnd_eq_point_p := hendPoint
      sameCap_endpoint_roles := hsameRoles
      outside_middle_roles := by
        rw [Finset.pair_comm]
        exact houtsideRoles
      support_eq_ordered_roles := by
        simpa [rowSupport] using hsupportSwap }⟩

/-- The current angle-chart interface cannot coexist with the periodic point
identity required by its equal-radius Lemma 30/37 wrappers.  Its unrestricted
ordered-triple sign field sees the triple `p < q < cycleEnd`; after identifying
the endpoint with `p`, that triple has repeated endpoints and sign zero. -/
theorem false_of_counterclockwiseAngleChart_point_period
    (chart : ShellCurvature.CounterclockwiseAngleChart)
    {p q cycleEnd : ℕ} (hpq : p < q) (hqend : q < cycleEnd)
    (hperiod : chart.point cycleEnd = chart.point p) : False := by
  have hsign := chart.orderedTriple_sign_neg hpq hqend
  rw [hperiod] at hsign
  simp at hsign

/-- In particular, the source-faithful cyclic roles cannot be connected to
the current chart type by pointwise equality.  This is a signature
incompatibility, not a missing geometric fact about the reverse row. -/
theorem not_exists_counterclockwiseAngleChart_for_reverseRowCyclicRoles
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {K : PhysicalActualCriticalOmissionCycle H profile}
    {i : Fin K.period} (R : ReverseRowCyclicRoles K i) :
    ¬ ∃ chart : ShellCurvature.CounterclockwiseAngleChart,
      chart.point = R.point := by
  rintro ⟨chart, hpoint⟩
  apply false_of_counterclockwiseAngleChart_point_period chart
    R.p_lt_q1
    (R.q1_lt_q2.trans
      (R.q2_lt_q3.trans (R.q3_lt_q4.trans R.q4_lt_cycleEnd)))
  rw [hpoint]
  exact R.point_cycleEnd_eq_point_p

#print axioms nonempty_reverseRowGlobalBlockStraddle
#print axioms nonempty_reverseRowCyclicRoles
#print axioms false_of_counterclockwiseAngleChart_point_period
#print axioms not_exists_counterclockwiseAngleChart_for_reverseRowCyclicRoles

end

end ATailReverseShellCurvatureAdapterScratch
end Problem97
