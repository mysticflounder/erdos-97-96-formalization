/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.U1Depth5HrowRecord001PostAll8Independent

/-!
# Record001 post-all8 independent hrow, manifest-label surface

This module exports the checked independent `q:p=f1` post-all8 hrow
certificate on the manifest-label packet surface used by the current U1.2
spine lane.  It deliberately does not construct or expose a `RowSlotLabelPacket`.
-/

set_option linter.style.longLine false
set_option linter.style.nativeDecide false

open scoped EuclideanGeometry

namespace Problem97
namespace U1Depth5SourceUnitGenerated

open U5GramCert

set_option maxHeartbeats 0 in
-- Generated certificate replay can exceed the default heartbeat budget.
/-- The checked independent post-all8 source UNIT proves `q:p=f1` on a
manifest-label packet from the three hard-`f1` hrows and five transport hrows. -/
theorem cert_00001_17499a15ad0a1019_hrow_q_p_f1_of_manifest_label_packet
    {D : CounterexampleData}
    (packet : U1Depth5.ManifestLabelPacket D)
    (hfixed :
      U3FixedTriplePacket D packet.baseQ packet.baseP packet.baseT1
        packet.baseT2 packet.baseT3)
    (hrow_4 : dist (packet.point U1Depth5.f1) (packet.point U1Depth5.f3) =
      dist (packet.point U1Depth5.f1) (packet.point U1Depth5.f2))
    (hrow_5 : dist (packet.point U1Depth5.f1) (packet.point U1Depth5.f4) =
      dist (packet.point U1Depth5.f1) (packet.point U1Depth5.f2))
    (hrow_6 : dist (packet.point U1Depth5.f1) (packet.point U1Depth5.p) =
      dist (packet.point U1Depth5.f1) (packet.point U1Depth5.f2))
    (hrow_12 : dist (packet.point U1Depth5.q) (packet.point U1Depth5.t1) =
      dist (packet.point U1Depth5.q) (packet.point U1Depth5.f1))
    (hrow_13 : dist (packet.point U1Depth5.q) (packet.point U1Depth5.t2) =
      dist (packet.point U1Depth5.q) (packet.point U1Depth5.f1))
    (hrow_15 : dist (packet.point U1Depth5.t1) (packet.point U1Depth5.p) =
      dist (packet.point U1Depth5.t1) (packet.point U1Depth5.f1))
    (hrow_16 : dist (packet.point U1Depth5.t1) (packet.point U1Depth5.q) =
      dist (packet.point U1Depth5.t1) (packet.point U1Depth5.f1))
    (hrow_17 : dist (packet.point U1Depth5.t1) (packet.point U1Depth5.t3) =
      dist (packet.point U1Depth5.t1) (packet.point U1Depth5.f1)) :
    dist (packet.point U1Depth5.q) (packet.point U1Depth5.p) =
      dist (packet.point U1Depth5.q) (packet.point U1Depth5.f1) := by
  by_contra hrow_qp_ne
  let ν : ℕ → ℝ := fun n =>
    match n with
    | 0 => normalAxis (packet.point U1Depth5.p) (packet.point U1Depth5.q)
        (packet.point U1Depth5.f1) 0
    | 1 => normalAxis (packet.point U1Depth5.p) (packet.point U1Depth5.q)
        (packet.point U1Depth5.f1) 1
    | 2 => normalAxis (packet.point U1Depth5.p) (packet.point U1Depth5.q)
        (packet.point U1Depth5.f2) 0
    | 3 => normalAxis (packet.point U1Depth5.p) (packet.point U1Depth5.q)
        (packet.point U1Depth5.f2) 1
    | 4 => normalAxis (packet.point U1Depth5.p) (packet.point U1Depth5.q)
        (packet.point U1Depth5.f3) 0
    | 5 => normalAxis (packet.point U1Depth5.p) (packet.point U1Depth5.q)
        (packet.point U1Depth5.f3) 1
    | 6 => normalAxis (packet.point U1Depth5.p) (packet.point U1Depth5.q)
        (packet.point U1Depth5.f4) 0
    | 7 => normalAxis (packet.point U1Depth5.p) (packet.point U1Depth5.q)
        (packet.point U1Depth5.f4) 1
    | 8 => normalAxis (packet.point U1Depth5.p) (packet.point U1Depth5.q)
        (packet.point U1Depth5.f5) 0
    | 9 => normalAxis (packet.point U1Depth5.p) (packet.point U1Depth5.q)
        (packet.point U1Depth5.f5) 1
    | 10 => normalAxis (packet.point U1Depth5.p) (packet.point U1Depth5.q)
        (packet.point U1Depth5.t1) 0
    | 11 => normalAxis (packet.point U1Depth5.p) (packet.point U1Depth5.q)
        (packet.point U1Depth5.t1) 1
    | 12 => normalAxis (packet.point U1Depth5.p) (packet.point U1Depth5.q)
        (packet.point U1Depth5.t2) 0
    | 13 => normalAxis (packet.point U1Depth5.p) (packet.point U1Depth5.q)
        (packet.point U1Depth5.t2) 1
    | 14 => normalAxis (packet.point U1Depth5.p) (packet.point U1Depth5.q)
        (packet.point U1Depth5.t3) 0
    | 15 => normalAxis (packet.point U1Depth5.p) (packet.point U1Depth5.q)
        (packet.point U1Depth5.t3) 1
    | 16 =>
        (normalAxis (packet.point U1Depth5.p) (packet.point U1Depth5.q)
            (packet.point U1Depth5.f1) 0 -
          normalAxis (packet.point U1Depth5.p) (packet.point U1Depth5.q)
            (packet.point U1Depth5.f2) 0) ^ 2 +
        (normalAxis (packet.point U1Depth5.p) (packet.point U1Depth5.q)
            (packet.point U1Depth5.f1) 1 -
          normalAxis (packet.point U1Depth5.p) (packet.point U1Depth5.q)
            (packet.point U1Depth5.f2) 1) ^ 2
    | 17 => 1
    | 18 =>
        (normalAxis (packet.point U1Depth5.p) (packet.point U1Depth5.q)
            (packet.point U1Depth5.f1) 0 - 1) ^ 2 +
        normalAxis (packet.point U1Depth5.p) (packet.point U1Depth5.q)
          (packet.point U1Depth5.f1) 1 ^ 2
    | 19 =>
        (normalAxis (packet.point U1Depth5.p) (packet.point U1Depth5.q)
            (packet.point U1Depth5.t1) 0 -
          normalAxis (packet.point U1Depth5.p) (packet.point U1Depth5.q)
            (packet.point U1Depth5.f1) 0) ^ 2 +
        (normalAxis (packet.point U1Depth5.p) (packet.point U1Depth5.q)
            (packet.point U1Depth5.t1) 1 -
          normalAxis (packet.point U1Depth5.p) (packet.point U1Depth5.q)
            (packet.point U1Depth5.f1) 1) ^ 2
    | 20 =>
        (normalAxis (packet.point U1Depth5.p) (packet.point U1Depth5.q)
            (packet.point U1Depth5.t2) 0 -
          normalAxis (packet.point U1Depth5.p) (packet.point U1Depth5.q)
            (packet.point U1Depth5.f2) 0) ^ 2 +
        (normalAxis (packet.point U1Depth5.p) (packet.point U1Depth5.q)
            (packet.point U1Depth5.t2) 1 -
          normalAxis (packet.point U1Depth5.p) (packet.point U1Depth5.q)
            (packet.point U1Depth5.f2) 1) ^ 2
    | 21 =>
        (normalAxis (packet.point U1Depth5.p) (packet.point U1Depth5.q)
            (packet.point U1Depth5.t3) 0 -
          normalAxis (packet.point U1Depth5.p) (packet.point U1Depth5.q)
            (packet.point U1Depth5.f1) 0) ^ 2 +
        (normalAxis (packet.point U1Depth5.p) (packet.point U1Depth5.q)
            (packet.point U1Depth5.t3) 1 -
          normalAxis (packet.point U1Depth5.p) (packet.point U1Depth5.q)
            (packet.point U1Depth5.f1) 1) ^ 2
    | _ => 0
  have hfixed_t1_same_radius :
      dist (packet.point U1Depth5.p) (packet.point U1Depth5.t1) =
        dist (packet.point U1Depth5.p) (packet.point U1Depth5.q) := by
    simpa using hfixed.t1_same_radius
  have hfixed_t2_same_radius :
      dist (packet.point U1Depth5.p) (packet.point U1Depth5.t2) =
        dist (packet.point U1Depth5.p) (packet.point U1Depth5.q) := by
    simpa using hfixed.t2_same_radius
  have hfixed_t3_same_radius :
      dist (packet.point U1Depth5.p) (packet.point U1Depth5.t3) =
        dist (packet.point U1Depth5.p) (packet.point U1Depth5.q) := by
    simpa using hfixed.t3_same_radius
  have htarget_ne : eval ν (onePoly ++ neg (coordSqDistUnitXPoly 0 1)) ≠ 0 := by
    intro htarget_zero
    have hcoord_ne := packet.normalAxis_coordSqDist_ne_of_dist_ne hrow_qp_ne
    apply hcoord_ne
    have hpq : packet.point U1Depth5.p ≠ packet.point U1Depth5.q :=
      packet.point_ne_of_label_ne (by decide : U1Depth5.p ≠ U1Depth5.q)
    have hzero := htarget_zero
    simp [eval_append, eval_neg, eval_onePoly, eval_coordSqDistUnitXPoly] at hzero
    rw [Problem97.normalAxis_witness hpq, Problem97.normalAxis_self]
    dsimp [coordSqDist]
    simp [ν] at hzero ⊢
    nlinarith
  exact cert_00001_17499a15ad0a1019_false_of_semantic_equalities_slack_update ν
    (by
      simpa [ν] using
        packet.normalAxis_sqnorm_coord_eq_one_of_dist_eq hfixed_t1_same_radius)
    (by
      simpa [ν] using
        packet.normalAxis_sqnorm_coord_eq_one_of_dist_eq hfixed_t2_same_radius)
    (by
      simpa [ν] using
        packet.normalAxis_sqnorm_coord_eq_one_of_dist_eq hfixed_t3_same_radius)
    (by
      simp [ν])
    (by
      have hpq : packet.point U1Depth5.p ≠ packet.point U1Depth5.q :=
        packet.point_ne_of_label_ne (by decide : U1Depth5.p ≠ U1Depth5.q)
      have hcoord := packet.normalAxis_coordSqDist_eq_of_dist_eq hrow_4
      simpa [ν, coordSqDist, Problem97.normalAxis_self,
        Problem97.normalAxis_witness hpq] using hcoord)
    (by
      have hpq : packet.point U1Depth5.p ≠ packet.point U1Depth5.q :=
        packet.point_ne_of_label_ne (by decide : U1Depth5.p ≠ U1Depth5.q)
      have hcoord := packet.normalAxis_coordSqDist_eq_of_dist_eq hrow_5
      simpa [ν, coordSqDist, Problem97.normalAxis_self,
        Problem97.normalAxis_witness hpq] using hcoord)
    (by
      have hpq : packet.point U1Depth5.p ≠ packet.point U1Depth5.q :=
        packet.point_ne_of_label_ne (by decide : U1Depth5.p ≠ U1Depth5.q)
      have hcoord :=
        Problem97.normalAxis_sqnorm_eq_coordSqDist_of_dist_eq
          (p := packet.point U1Depth5.p) (q := packet.point U1Depth5.q)
          (center := packet.point U1Depth5.f1)
          (witness := packet.point U1Depth5.f2) hpq hrow_6
      simpa [ν, coordSqDist, Problem97.normalAxis_self,
        Problem97.normalAxis_witness hpq] using hcoord)
    (by
      simp [ν])
    (by
      simpa [ν] using
        packet.normalAxis_sqnorm_coord_eq_one_of_dist_eq hfixed_t1_same_radius)
    (by
      simpa [ν] using
        packet.normalAxis_sqnorm_coord_eq_one_of_dist_eq hfixed_t2_same_radius)
    (by
      simpa [ν] using
        packet.normalAxis_sqnorm_coord_eq_one_of_dist_eq hfixed_t3_same_radius)
    (by
      simp [ν])
    (by
      simpa [ν] using
        packet.normalAxis_unitX_sqdist_coord_eq_of_dist_eq hrow_12)
    (by
      simpa [ν] using
        packet.normalAxis_unitX_sqdist_coord_eq_of_dist_eq hrow_13)
    (by
      simp [ν])
    (by
      have hpq : packet.point U1Depth5.p ≠ packet.point U1Depth5.q :=
        packet.point_ne_of_label_ne (by decide : U1Depth5.p ≠ U1Depth5.q)
      have hcoord :=
        Problem97.normalAxis_sqnorm_eq_coordSqDist_of_dist_eq
          (p := packet.point U1Depth5.p) (q := packet.point U1Depth5.q)
          (center := packet.point U1Depth5.t1)
          (witness := packet.point U1Depth5.f1) hpq hrow_15
      simpa [ν, coordSqDist, Problem97.normalAxis_self,
        Problem97.normalAxis_witness hpq] using hcoord)
    (by
      have hpq : packet.point U1Depth5.p ≠ packet.point U1Depth5.q :=
        packet.point_ne_of_label_ne (by decide : U1Depth5.p ≠ U1Depth5.q)
      have hcoord :=
        Problem97.normalAxis_unitX_sqdist_eq_coordSqDist_of_dist_eq
          (p := packet.point U1Depth5.p) (q := packet.point U1Depth5.q)
          (center := packet.point U1Depth5.t1)
          (witness := packet.point U1Depth5.f1) hpq hrow_16
      simpa [ν, coordSqDist, Problem97.normalAxis_self,
        Problem97.normalAxis_witness hpq] using hcoord)
    (by
      have hpq : packet.point U1Depth5.p ≠ packet.point U1Depth5.q :=
        packet.point_ne_of_label_ne (by decide : U1Depth5.p ≠ U1Depth5.q)
      have hcoord := packet.normalAxis_coordSqDist_eq_of_dist_eq hrow_17
      simpa [ν, coordSqDist, Problem97.normalAxis_self,
        Problem97.normalAxis_witness hpq] using hcoord)
    (by
      simp [ν])
    (by
      simp [ν])
    htarget_ne

/-- Record001 branch-0 flat manifest-label export for the independent
post-all8 row `q:p=f1`.

The statement matches the spine-facing branch-0 choices: `f2=t2[0]`,
`f3=f1[1]`, `f4=f1[2]`, and `f5=t2[1]`. -/
theorem record001_branch0_hrow_q_p_f1_of_manifest
    {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : U1Depth5.Plane}
    (rows : U1Depth5.CriticalSourceRows D baseQ baseT1 baseT2 baseT3 selectedU)
    (hfixed : U3FixedTriplePacket D baseQ baseP baseT1 baseT2 baseT3)
    (hlabels :
      List.Pairwise (fun x y : U1Depth5.Plane => x ≠ y)
        [baseP, baseQ, baseT1, baseT2, baseT3, selectedU,
          rows.pointOfChoice
            { source := U1Depth5.CriticalSource.t2, slot := 0 },
          rows.pointOfChoice
            { source := U1Depth5.CriticalSource.f1, slot := 1 },
          rows.pointOfChoice
            { source := U1Depth5.CriticalSource.f1, slot := 2 },
          rows.pointOfChoice
            { source := U1Depth5.CriticalSource.t2, slot := 1 }])
    (hrow_f1_f3_f2 :
      dist selectedU
          (rows.pointOfChoice
            { source := U1Depth5.CriticalSource.f1, slot := 1 }) =
        dist selectedU
          (rows.pointOfChoice
            { source := U1Depth5.CriticalSource.t2, slot := 0 }))
    (hrow_f1_f4_f2 :
      dist selectedU
          (rows.pointOfChoice
            { source := U1Depth5.CriticalSource.f1, slot := 2 }) =
        dist selectedU
          (rows.pointOfChoice
            { source := U1Depth5.CriticalSource.t2, slot := 0 }))
    (hrow_f1_p_f2 :
      dist selectedU baseP =
        dist selectedU
          (rows.pointOfChoice
            { source := U1Depth5.CriticalSource.t2, slot := 0 }))
    (hqt :
      U1Depth5.Record001QTFacingTransportRows
        baseP baseQ baseT1 baseT2 baseT3 selectedU) :
    dist baseQ baseP = dist baseQ selectedU := by
  have baseT1_mem : baseT1 ∈ D.A := by
    have hskel : baseT1 ∈ D.skeleton baseQ :=
      (Finset.mem_erase.mp hfixed.t1_mem).2
    have hmem_erase : baseT1 ∈ D.A.erase baseQ := by
      simpa [CounterexampleData.skeleton] using hskel
    exact (Finset.mem_erase.mp hmem_erase).2
  have baseT2_mem : baseT2 ∈ D.A := by
    have hskel : baseT2 ∈ D.skeleton baseQ :=
      (Finset.mem_erase.mp hfixed.t2_mem).2
    have hmem_erase : baseT2 ∈ D.A.erase baseQ := by
      simpa [CounterexampleData.skeleton] using hskel
    exact (Finset.mem_erase.mp hmem_erase).2
  have baseT3_mem : baseT3 ∈ D.A := by
    have hskel : baseT3 ∈ D.skeleton baseQ :=
      (Finset.mem_erase.mp hfixed.t3_mem).2
    have hmem_erase : baseT3 ∈ D.A.erase baseQ := by
      simpa [CounterexampleData.skeleton] using hskel
    exact (Finset.mem_erase.mp hmem_erase).2
  let packet : U1Depth5.ManifestLabelPacket D :=
    { baseP := baseP
      baseQ := baseQ
      baseT1 := baseT1
      baseT2 := baseT2
      baseT3 := baseT3
      selectedU := selectedU
      f2Point := rows.pointOfChoice
        { source := U1Depth5.CriticalSource.t2, slot := 0 }
      f3Point := rows.pointOfChoice
        { source := U1Depth5.CriticalSource.f1, slot := 1 }
      f4Point := rows.pointOfChoice
        { source := U1Depth5.CriticalSource.f1, slot := 2 }
      f5Point := rows.pointOfChoice
        { source := U1Depth5.CriticalSource.t2, slot := 1 }
      baseP_mem := hfixed.p_mem
      baseQ_mem := hfixed.q_mem
      baseT1_mem := baseT1_mem
      baseT2_mem := baseT2_mem
      baseT3_mem := baseT3_mem
      selectedU_mem := rows.uRow.source_mem
      f2_mem := rows.pointOfChoice_mem
        { source := U1Depth5.CriticalSource.t2, slot := 0 }
      f3_mem := rows.pointOfChoice_mem
        { source := U1Depth5.CriticalSource.f1, slot := 1 }
      f4_mem := rows.pointOfChoice_mem
        { source := U1Depth5.CriticalSource.f1, slot := 2 }
      f5_mem := rows.pointOfChoice_mem
        { source := U1Depth5.CriticalSource.t2, slot := 1 }
      point_injective := by
        exact U1Depth5.pointOf_injective_of_pairwise hlabels }
  simpa [packet] using
    cert_00001_17499a15ad0a1019_hrow_q_p_f1_of_manifest_label_packet
      packet
      (by simpa [packet] using hfixed)
      (by simpa [packet] using hrow_f1_f3_f2)
      (by simpa [packet] using hrow_f1_f4_f2)
      (by simpa [packet] using hrow_f1_p_f2)
      (by simpa [packet] using hqt.hrow_q_t1_f1)
      (by simpa [packet] using hqt.hrow_q_t2_f1)
      (by simpa [packet] using hqt.hrow_t1_p_f1)
      (by simpa [packet] using hqt.hrow_t1_q_f1)
      (by simpa [packet] using hqt.hrow_t1_t3_f1)

end U1Depth5SourceUnitGenerated
end Problem97
