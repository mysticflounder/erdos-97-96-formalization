/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.U1Depth5HSlotQT1Record001
import Erdos9796Proof.P97.U1Depth5HSlotRecord001NonF1
import Erdos9796Proof.P97.U1Depth5SourceUnitQT3Ordinal001

/-!
# U1 q:t3 certification pilot, record 1

This module wires one theorem-facing hslot replay into the first q:t3
source-UNIT pilot branch.  It is intentionally narrow: the branch still needs a
row-slot packet, branch endpoint transports, seven slot metric producers, and
the residual source-UNIT hrows.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace U1Depth5SourceUnitGenerated

open U1Depth5

/-- The data-producing payload for the record-1 / branch-0 q:t3 pilot branch.

This is the theorem-facing producer target for the live U1.2 residual: it
packages the row-slot label packet, identifies it with the live critical source
rows, and records the branch choices, same-label occurrence, fixed source-row
placements, and residual generated hrows needed by the existing source-UNIT
replay.  It deliberately excludes the `f1:*` slot metrics; those are supplied
by separate certificate or split producers. -/
structure Record001Branch0Payload {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : U1Depth5.Plane}
    (rows : U1Depth5.CriticalSourceRows D baseQ baseT1 baseT2 baseT3 selectedU) where
  packet :
    U1Depth5.RowSlotLabelPacket D baseP baseQ baseT1 baseT2 baseT3 selectedU
  rows_eq : packet.rows = rows
  hchoice_f2_t2_0 :
    packet.f2Choice = { source := U1Depth5.CriticalSource.t2, slot := 0 }
  hchoice_f3_f1_1 :
    packet.f3Choice = { source := U1Depth5.CriticalSource.f1, slot := 1 }
  hchoice_f4_f1_2 :
    packet.f4Choice = { source := U1Depth5.CriticalSource.f1, slot := 2 }
  hchoice_f5_t2_1 :
    packet.f5Choice = { source := U1Depth5.CriticalSource.t2, slot := 1 }
  hocc_f2_f1_0 :
    packet.rows.pointOfChoice packet.f2Choice =
      ((packet.rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 0)
  hfix_p_f1_3 :
    baseP = ((packet.rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 3)
  hfix_t1_q_2 :
    baseT1 = ((packet.rows.rowAt U1Depth5.CriticalSource.q).slotPoint 2)
  hfix_f1_q_0 :
    selectedU = ((packet.rows.rowAt U1Depth5.CriticalSource.q).slotPoint 0)
  hfix_t2_q_3 :
    baseT2 = ((packet.rows.rowAt U1Depth5.CriticalSource.q).slotPoint 3)
  hfix_p_t1_1 :
    baseP = ((packet.rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 1)
  hfix_f1_t1_0 :
    selectedU = ((packet.rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 0)
  hfix_q_t1_2 :
    baseQ = ((packet.rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 2)
  hfix_t3_t1_3 :
    baseT3 = ((packet.rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 3)
  hrow_12 : dist (packet.point U1Depth5.q) (packet.point U1Depth5.p) =
    dist (packet.point U1Depth5.q) (packet.point U1Depth5.f1)
  hrow_20 : dist (packet.point U1Depth5.t2) (packet.point U1Depth5.f5) =
    dist (packet.point U1Depth5.t2) (packet.point U1Depth5.f2)
  hrow_21 : dist (packet.point U1Depth5.t2) (packet.point U1Depth5.p) =
    dist (packet.point U1Depth5.t2) (packet.point U1Depth5.f2)
  hrow_22 : dist (packet.point U1Depth5.t2) (packet.point U1Depth5.q) =
    dist (packet.point U1Depth5.t2) (packet.point U1Depth5.f2)
  hrow_24 : dist (packet.point U1Depth5.t3) (packet.point U1Depth5.f2) =
    dist (packet.point U1Depth5.t3) (packet.point U1Depth5.f1)
  hrow_25 : dist (packet.point U1Depth5.t3) (packet.point U1Depth5.p) =
    dist (packet.point U1Depth5.t3) (packet.point U1Depth5.f1)
  hrow_26 : dist (packet.point U1Depth5.t3) (packet.point U1Depth5.t1) =
    dist (packet.point U1Depth5.t3) (packet.point U1Depth5.f1)

namespace Record001Branch0Payload

/-- Build the record-1 / branch-0 source-UNIT payload from the all-distinct
side of the named row-slot collision split.

The inputs are exactly the remaining branch data after the packet constructor:
the record001 occurrence and placement facts, the source-row placements used by
the generated q:t3 replay, and the residual hrows. -/
def ofRecord001NoCollision {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : U1Depth5.Plane}
    {rows : U1Depth5.CriticalSourceRows D baseQ baseT1 baseT2 baseT3 selectedU}
    (H : U1Depth5.RowSlotLabelPacket.Record001Branch0NoCollision rows baseP)
    (baseP_mem : baseP ∈ D.A)
    (hbase :
      List.Pairwise (fun x y : U1Depth5.Plane => x ≠ y)
        [baseP, baseQ, baseT1, baseT2, baseT3, selectedU])
    (hocc_f2_f1_0 :
      rows.pointOfChoice { source := U1Depth5.CriticalSource.t2, slot := 0 } =
        (rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 0)
    (hfix_p_f1_3 :
      baseP = (rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 3)
    (hfix_t1_q_2 :
      baseT1 = (rows.rowAt U1Depth5.CriticalSource.q).slotPoint 2)
    (hfix_f1_q_0 :
      selectedU = (rows.rowAt U1Depth5.CriticalSource.q).slotPoint 0)
    (hfix_t2_q_3 :
      baseT2 = (rows.rowAt U1Depth5.CriticalSource.q).slotPoint 3)
    (hfix_p_t1_1 :
      baseP = (rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 1)
    (hfix_f1_t1_0 :
      selectedU = (rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 0)
    (hfix_q_t1_2 :
      baseQ = (rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 2)
    (hfix_t3_t1_3 :
      baseT3 = (rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 3)
    (hrow_12 : dist baseQ baseP = dist baseQ selectedU)
    (hrow_20 :
      dist baseT2 ((rows.rowAt U1Depth5.CriticalSource.t2).slotPoint 1) =
        dist baseT2 ((rows.rowAt U1Depth5.CriticalSource.t2).slotPoint 0))
    (hrow_21 :
      dist baseT2 baseP =
        dist baseT2 ((rows.rowAt U1Depth5.CriticalSource.t2).slotPoint 0))
    (hrow_22 :
      dist baseT2 baseQ =
        dist baseT2 ((rows.rowAt U1Depth5.CriticalSource.t2).slotPoint 0))
    (hrow_24 :
      dist baseT3 ((rows.rowAt U1Depth5.CriticalSource.t2).slotPoint 0) =
        dist baseT3 selectedU)
    (hrow_25 : dist baseT3 baseP = dist baseT3 selectedU)
    (hrow_26 : dist baseT3 baseT1 = dist baseT3 selectedU) :
    Record001Branch0Payload (D := D) (baseP := baseP) (baseQ := baseQ)
      (baseT1 := baseT1) (baseT2 := baseT2) (baseT3 := baseT3)
      (selectedU := selectedU) rows := by
  let packet :=
    H.toPacket baseP_mem hbase hocc_f2_f1_0 hfix_p_f1_3
  refine
    { packet := packet
      rows_eq := ?_
      hchoice_f2_t2_0 := ?_
      hchoice_f3_f1_1 := ?_
      hchoice_f4_f1_2 := ?_
      hchoice_f5_t2_1 := ?_
      hocc_f2_f1_0 := ?_
      hfix_p_f1_3 := ?_
      hfix_t1_q_2 := ?_
      hfix_f1_q_0 := ?_
      hfix_t2_q_3 := ?_
      hfix_p_t1_1 := ?_
      hfix_f1_t1_0 := ?_
      hfix_q_t1_2 := ?_
      hfix_t3_t1_3 := ?_
      hrow_12 := ?_
      hrow_20 := ?_
      hrow_21 := ?_
      hrow_22 := ?_
      hrow_24 := ?_
      hrow_25 := ?_
      hrow_26 := ?_ }
  · rfl
  · rfl
  · rfl
  · rfl
  · rfl
  · simpa [packet] using hocc_f2_f1_0
  · simpa [packet] using hfix_p_f1_3
  · simpa [packet] using hfix_t1_q_2
  · simpa [packet] using hfix_f1_q_0
  · simpa [packet] using hfix_t2_q_3
  · simpa [packet] using hfix_p_t1_1
  · simpa [packet] using hfix_f1_t1_0
  · simpa [packet] using hfix_q_t1_2
  · simpa [packet] using hfix_t3_t1_3
  · simpa [packet] using hrow_12
  · simpa [packet] using hrow_20
  · simpa [packet] using hrow_21
  · simpa [packet] using hrow_22
  · simpa [packet] using hrow_24
  · simpa [packet] using hrow_25
  · simpa [packet] using hrow_26

end Record001Branch0Payload

/-- Record-1 branch 0 with the `q:t1=f1` slot metric supplied by the checked
record-1 hslot replay.

This is not a U1.2 closure.  It removes one field from the all-eight metric core
assumption for the pilot branch while keeping the remaining branch and hrow
obligations explicit. -/
theorem record001_branch0_false_of_qt1_replay
    {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : U1Depth5.Plane}
    (hfixed : U3FixedTriplePacket D baseQ baseP baseT1 baseT2 baseT3)
    (packet : U1Depth5.RowSlotLabelPacket D baseP baseQ baseT1 baseT2 baseT3 selectedU)
    (hslot_f1_f3_f2 :
      dist (packet.point U1Depth5.f1)
          ((packet.rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 1) =
        dist (packet.point U1Depth5.f1)
          ((packet.rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 0))
    (hslot_f1_f4_f2 :
      dist (packet.point U1Depth5.f1)
          ((packet.rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 2) =
        dist (packet.point U1Depth5.f1)
          ((packet.rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 0))
    (hslot_f1_p_f2 :
      dist (packet.point U1Depth5.f1)
          ((packet.rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 3) =
        dist (packet.point U1Depth5.f1)
          ((packet.rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 0))
    (hslot_q_t2_f1 :
      dist (packet.point U1Depth5.q)
          ((packet.rows.rowAt U1Depth5.CriticalSource.q).slotPoint 3) =
        dist (packet.point U1Depth5.q)
          ((packet.rows.rowAt U1Depth5.CriticalSource.q).slotPoint 0))
    (hslot_t1_p_f1 :
      dist (packet.point U1Depth5.t1)
          ((packet.rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 1) =
        dist (packet.point U1Depth5.t1)
          ((packet.rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 0))
    (hslot_t1_q_f1 :
      dist (packet.point U1Depth5.t1)
          ((packet.rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 2) =
        dist (packet.point U1Depth5.t1)
          ((packet.rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 0))
    (hslot_t1_t3_f1 :
      dist (packet.point U1Depth5.t1)
          ((packet.rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 3) =
        dist (packet.point U1Depth5.t1)
          ((packet.rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 0))
    (hchoice_f3_f1_1 :
      packet.f3Choice = { source := U1Depth5.CriticalSource.f1, slot := 1 })
    (hchoice_f4_f1_2 :
      packet.f4Choice = { source := U1Depth5.CriticalSource.f1, slot := 2 })
    (hocc_f2_f1_0 :
      packet.rows.pointOfChoice packet.f2Choice =
        ((packet.rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 0))
    (hfix_p_f1_3 :
      baseP = ((packet.rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 3))
    (hfix_t1_q_2 :
      baseT1 = ((packet.rows.rowAt U1Depth5.CriticalSource.q).slotPoint 2))
    (hfix_f1_q_0 :
      selectedU = ((packet.rows.rowAt U1Depth5.CriticalSource.q).slotPoint 0))
    (hfix_t2_q_3 :
      baseT2 = ((packet.rows.rowAt U1Depth5.CriticalSource.q).slotPoint 3))
    (hfix_p_t1_1 :
      baseP = ((packet.rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 1))
    (hfix_f1_t1_0 :
      selectedU = ((packet.rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 0))
    (hfix_q_t1_2 :
      baseQ = ((packet.rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 2))
    (hfix_t3_t1_3 :
      baseT3 = ((packet.rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 3))
    (hrow_12 : dist (packet.point U1Depth5.q) (packet.point U1Depth5.p) =
      dist (packet.point U1Depth5.q) (packet.point U1Depth5.f1))
    (hrow_20 : dist (packet.point U1Depth5.t2) (packet.point U1Depth5.f5) =
      dist (packet.point U1Depth5.t2) (packet.point U1Depth5.f2))
    (hrow_21 : dist (packet.point U1Depth5.t2) (packet.point U1Depth5.p) =
      dist (packet.point U1Depth5.t2) (packet.point U1Depth5.f2))
    (hrow_22 : dist (packet.point U1Depth5.t2) (packet.point U1Depth5.q) =
      dist (packet.point U1Depth5.t2) (packet.point U1Depth5.f2))
    (hrow_24 : dist (packet.point U1Depth5.t3) (packet.point U1Depth5.f2) =
      dist (packet.point U1Depth5.t3) (packet.point U1Depth5.f1))
    (hrow_25 : dist (packet.point U1Depth5.t3) (packet.point U1Depth5.p) =
      dist (packet.point U1Depth5.t3) (packet.point U1Depth5.f1))
    (hrow_26 : dist (packet.point U1Depth5.t3) (packet.point U1Depth5.t1) =
      dist (packet.point U1Depth5.t3) (packet.point U1Depth5.f1)) :
    False := by
  have hpt_f3_f1_1 : packet.point U1Depth5.f3 =
      ((packet.rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 1) := by
    have hselected := packet.point_f3_eq_selectedSlot
    rw [hchoice_f3_f1_1] at hselected
    exact hselected
  have hpt_f2_f1_0 : packet.point U1Depth5.f2 =
      ((packet.rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 0) := by
    exact packet.point_f2_eq_slotPoint_of_occurrence hocc_f2_f1_0
  have hpt_f4_f1_2 : packet.point U1Depth5.f4 =
      ((packet.rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 2) := by
    have hselected := packet.point_f4_eq_selectedSlot
    rw [hchoice_f4_f1_2] at hselected
    exact hselected
  have hpt_p_f1_3 : packet.point U1Depth5.p =
      ((packet.rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 3) := by
    simpa using hfix_p_f1_3
  have hpt_t1_q_2 : packet.point U1Depth5.t1 =
      ((packet.rows.rowAt U1Depth5.CriticalSource.q).slotPoint 2) := by
    simpa using hfix_t1_q_2
  have hpt_f1_q_0 : packet.point U1Depth5.f1 =
      ((packet.rows.rowAt U1Depth5.CriticalSource.q).slotPoint 0) := by
    simpa using hfix_f1_q_0
  have hpt_t2_q_3 : packet.point U1Depth5.t2 =
      ((packet.rows.rowAt U1Depth5.CriticalSource.q).slotPoint 3) := by
    simpa using hfix_t2_q_3
  have hpt_p_t1_1 : packet.point U1Depth5.p =
      ((packet.rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 1) := by
    simpa using hfix_p_t1_1
  have hpt_f1_t1_0 : packet.point U1Depth5.f1 =
      ((packet.rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 0) := by
    simpa using hfix_f1_t1_0
  have hpt_q_t1_2 : packet.point U1Depth5.q =
      ((packet.rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 2) := by
    simpa using hfix_q_t1_2
  have hpt_t3_t1_3 : packet.point U1Depth5.t3 =
      ((packet.rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 3) := by
    simpa using hfix_t3_t1_3
  have hrow_4 : dist (packet.point U1Depth5.f1) (packet.point U1Depth5.f3) =
      dist (packet.point U1Depth5.f1) (packet.point U1Depth5.f2) := by
    exact packet.hrow_of_slot_metric U1Depth5.CriticalSource.f1
      hpt_f3_f1_1 hpt_f2_f1_0 hslot_f1_f3_f2
  have hrow_5 : dist (packet.point U1Depth5.f1) (packet.point U1Depth5.f4) =
      dist (packet.point U1Depth5.f1) (packet.point U1Depth5.f2) := by
    exact packet.hrow_of_slot_metric U1Depth5.CriticalSource.f1
      hpt_f4_f1_2 hpt_f2_f1_0 hslot_f1_f4_f2
  have hrow_6 : dist (packet.point U1Depth5.f1) (packet.point U1Depth5.p) =
      dist (packet.point U1Depth5.f1) (packet.point U1Depth5.f2) := by
    exact packet.hrow_of_slot_metric U1Depth5.CriticalSource.f1
      hpt_p_f1_3 hpt_f2_f1_0 hslot_f1_p_f2
  have hrow_13_for_replay :
      dist (packet.point U1Depth5.q) (packet.point U1Depth5.t2) =
        dist (packet.point U1Depth5.q) (packet.point U1Depth5.f1) := by
    exact packet.hrow_of_slot_metric U1Depth5.CriticalSource.q
      hpt_t2_q_3 hpt_f1_q_0 hslot_q_t2_f1
  have hrow_15_for_replay :
      dist (packet.point U1Depth5.t1) (packet.point U1Depth5.p) =
        dist (packet.point U1Depth5.t1) (packet.point U1Depth5.f1) := by
    exact packet.hrow_of_slot_metric U1Depth5.CriticalSource.t1
      hpt_p_t1_1 hpt_f1_t1_0 hslot_t1_p_f1
  have hrow_16_for_replay :
      dist (packet.point U1Depth5.t1) (packet.point U1Depth5.q) =
        dist (packet.point U1Depth5.t1) (packet.point U1Depth5.f1) := by
    exact packet.hrow_of_slot_metric U1Depth5.CriticalSource.t1
      hpt_q_t1_2 hpt_f1_t1_0 hslot_t1_q_f1
  have hrow_17_for_replay :
      dist (packet.point U1Depth5.t1) (packet.point U1Depth5.t3) =
        dist (packet.point U1Depth5.t1) (packet.point U1Depth5.f1) := by
    exact packet.hrow_of_slot_metric U1Depth5.CriticalSource.t1
      hpt_t3_t1_3 hpt_f1_t1_0 hslot_t1_t3_f1
  have hrow_q_t1 :
      dist (packet.point U1Depth5.q) (packet.point U1Depth5.t1) =
        dist (packet.point U1Depth5.q) (packet.point U1Depth5.f1) :=
    cert_00001_ce05b8a3cfa383b7_hslot_q_t1_f1_of_row_slot_packet
      hfixed packet hrow_4 hrow_5 hrow_6 hrow_12
      hrow_13_for_replay hrow_15_for_replay hrow_16_for_replay
      hrow_17_for_replay hrow_20 hrow_21 hrow_22 hrow_24 hrow_25 hrow_26
  have hslot_q_t1_f1 :
      dist (packet.point U1Depth5.q)
          ((packet.rows.rowAt U1Depth5.CriticalSource.q).slotPoint 2) =
        dist (packet.point U1Depth5.q)
          ((packet.rows.rowAt U1Depth5.CriticalSource.q).slotPoint 0) := by
    rw [← hpt_t1_q_2, ← hpt_f1_q_0]
    exact hrow_q_t1
  have hall8 :
      U1Depth5.RowSlotLabelPacket.AllEightSlotMetricCore packet :=
    { hslot_f1_f3_f2 := hslot_f1_f3_f2
      hslot_f1_f4_f2 := hslot_f1_f4_f2
      hslot_f1_p_f2 := hslot_f1_p_f2
      hslot_q_t1_f1 := hslot_q_t1_f1
      hslot_q_t2_f1 := hslot_q_t2_f1
      hslot_t1_p_f1 := hslot_t1_p_f1
      hslot_t1_q_f1 := hslot_t1_q_f1
      hslot_t1_t3_f1 := hslot_t1_t3_f1 }
  exact
    cert_00001_f46a07c8af1969fd_branch_00000_false_of_all8_slot_metric_core
      hfixed packet hall8 hchoice_f3_f1_1 hchoice_f4_f1_2 hocc_f2_f1_0
      hfix_p_f1_3 hfix_t1_q_2 hfix_f1_q_0 hfix_t2_q_3 hfix_p_t1_1
      hfix_f1_t1_0 hfix_q_t1_2 hfix_t3_t1_3 hrow_12 hrow_20 hrow_21
      hrow_22 hrow_24 hrow_25 hrow_26

/-- Record-1 branch 0 with the `q:t2=f1` slot metric supplied by the checked
record-1 hslot replay, then passed to `record001_branch0_false_of_qt1_replay`.

This records a second one-missing-non-f1 slot adapter.  It does not assert that
the five non-f1 slot metrics are mutually derivable without hypotheses. -/
theorem record001_branch0_false_of_qt2_replay
    {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : U1Depth5.Plane}
    (hfixed : U3FixedTriplePacket D baseQ baseP baseT1 baseT2 baseT3)
    (packet : U1Depth5.RowSlotLabelPacket D baseP baseQ baseT1 baseT2 baseT3 selectedU)
    (hslot_f1_f3_f2 :
      dist (packet.point U1Depth5.f1)
          ((packet.rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 1) =
        dist (packet.point U1Depth5.f1)
          ((packet.rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 0))
    (hslot_f1_f4_f2 :
      dist (packet.point U1Depth5.f1)
          ((packet.rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 2) =
        dist (packet.point U1Depth5.f1)
          ((packet.rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 0))
    (hslot_f1_p_f2 :
      dist (packet.point U1Depth5.f1)
          ((packet.rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 3) =
        dist (packet.point U1Depth5.f1)
          ((packet.rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 0))
    (hslot_q_t1_f1 :
      dist (packet.point U1Depth5.q)
          ((packet.rows.rowAt U1Depth5.CriticalSource.q).slotPoint 2) =
        dist (packet.point U1Depth5.q)
          ((packet.rows.rowAt U1Depth5.CriticalSource.q).slotPoint 0))
    (hslot_t1_p_f1 :
      dist (packet.point U1Depth5.t1)
          ((packet.rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 1) =
        dist (packet.point U1Depth5.t1)
          ((packet.rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 0))
    (hslot_t1_q_f1 :
      dist (packet.point U1Depth5.t1)
          ((packet.rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 2) =
        dist (packet.point U1Depth5.t1)
          ((packet.rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 0))
    (hslot_t1_t3_f1 :
      dist (packet.point U1Depth5.t1)
          ((packet.rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 3) =
        dist (packet.point U1Depth5.t1)
          ((packet.rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 0))
    (hchoice_f3_f1_1 :
      packet.f3Choice = { source := U1Depth5.CriticalSource.f1, slot := 1 })
    (hchoice_f4_f1_2 :
      packet.f4Choice = { source := U1Depth5.CriticalSource.f1, slot := 2 })
    (hocc_f2_f1_0 :
      packet.rows.pointOfChoice packet.f2Choice =
        ((packet.rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 0))
    (hfix_p_f1_3 :
      baseP = ((packet.rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 3))
    (hfix_t1_q_2 :
      baseT1 = ((packet.rows.rowAt U1Depth5.CriticalSource.q).slotPoint 2))
    (hfix_f1_q_0 :
      selectedU = ((packet.rows.rowAt U1Depth5.CriticalSource.q).slotPoint 0))
    (hfix_t2_q_3 :
      baseT2 = ((packet.rows.rowAt U1Depth5.CriticalSource.q).slotPoint 3))
    (hfix_p_t1_1 :
      baseP = ((packet.rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 1))
    (hfix_f1_t1_0 :
      selectedU = ((packet.rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 0))
    (hfix_q_t1_2 :
      baseQ = ((packet.rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 2))
    (hfix_t3_t1_3 :
      baseT3 = ((packet.rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 3))
    (hrow_12 : dist (packet.point U1Depth5.q) (packet.point U1Depth5.p) =
      dist (packet.point U1Depth5.q) (packet.point U1Depth5.f1))
    (hrow_20 : dist (packet.point U1Depth5.t2) (packet.point U1Depth5.f5) =
      dist (packet.point U1Depth5.t2) (packet.point U1Depth5.f2))
    (hrow_21 : dist (packet.point U1Depth5.t2) (packet.point U1Depth5.p) =
      dist (packet.point U1Depth5.t2) (packet.point U1Depth5.f2))
    (hrow_22 : dist (packet.point U1Depth5.t2) (packet.point U1Depth5.q) =
      dist (packet.point U1Depth5.t2) (packet.point U1Depth5.f2))
    (hrow_24 : dist (packet.point U1Depth5.t3) (packet.point U1Depth5.f2) =
      dist (packet.point U1Depth5.t3) (packet.point U1Depth5.f1))
    (hrow_25 : dist (packet.point U1Depth5.t3) (packet.point U1Depth5.p) =
      dist (packet.point U1Depth5.t3) (packet.point U1Depth5.f1))
    (hrow_26 : dist (packet.point U1Depth5.t3) (packet.point U1Depth5.t1) =
      dist (packet.point U1Depth5.t3) (packet.point U1Depth5.f1)) :
    False := by
  have hpt_f3_f1_1 : packet.point U1Depth5.f3 =
      ((packet.rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 1) := by
    have hselected := packet.point_f3_eq_selectedSlot
    rw [hchoice_f3_f1_1] at hselected
    exact hselected
  have hpt_f2_f1_0 : packet.point U1Depth5.f2 =
      ((packet.rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 0) := by
    exact packet.point_f2_eq_slotPoint_of_occurrence hocc_f2_f1_0
  have hpt_f4_f1_2 : packet.point U1Depth5.f4 =
      ((packet.rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 2) := by
    have hselected := packet.point_f4_eq_selectedSlot
    rw [hchoice_f4_f1_2] at hselected
    exact hselected
  have hpt_p_f1_3 : packet.point U1Depth5.p =
      ((packet.rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 3) := by
    simpa using hfix_p_f1_3
  have hpt_t1_q_2 : packet.point U1Depth5.t1 =
      ((packet.rows.rowAt U1Depth5.CriticalSource.q).slotPoint 2) := by
    simpa using hfix_t1_q_2
  have hpt_f1_q_0 : packet.point U1Depth5.f1 =
      ((packet.rows.rowAt U1Depth5.CriticalSource.q).slotPoint 0) := by
    simpa using hfix_f1_q_0
  have hpt_t2_q_3 : packet.point U1Depth5.t2 =
      ((packet.rows.rowAt U1Depth5.CriticalSource.q).slotPoint 3) := by
    simpa using hfix_t2_q_3
  have hpt_p_t1_1 : packet.point U1Depth5.p =
      ((packet.rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 1) := by
    simpa using hfix_p_t1_1
  have hpt_f1_t1_0 : packet.point U1Depth5.f1 =
      ((packet.rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 0) := by
    simpa using hfix_f1_t1_0
  have hpt_q_t1_2 : packet.point U1Depth5.q =
      ((packet.rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 2) := by
    simpa using hfix_q_t1_2
  have hpt_t3_t1_3 : packet.point U1Depth5.t3 =
      ((packet.rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 3) := by
    simpa using hfix_t3_t1_3
  have hrow_0 : dist (packet.point U1Depth5.p) (packet.point U1Depth5.t1) =
      dist (packet.point U1Depth5.p) (packet.point U1Depth5.q) := by
    simpa using hfixed.t1_same_radius
  have hrow_1 : dist (packet.point U1Depth5.p) (packet.point U1Depth5.t2) =
      dist (packet.point U1Depth5.p) (packet.point U1Depth5.q) := by
    simpa using hfixed.t2_same_radius
  have hrow_2 : dist (packet.point U1Depth5.p) (packet.point U1Depth5.t3) =
      dist (packet.point U1Depth5.p) (packet.point U1Depth5.q) := by
    simpa using hfixed.t3_same_radius
  have hrow_4 : dist (packet.point U1Depth5.f1) (packet.point U1Depth5.f3) =
      dist (packet.point U1Depth5.f1) (packet.point U1Depth5.f2) := by
    exact packet.hrow_of_slot_metric U1Depth5.CriticalSource.f1
      hpt_f3_f1_1 hpt_f2_f1_0 hslot_f1_f3_f2
  have hrow_5 : dist (packet.point U1Depth5.f1) (packet.point U1Depth5.f4) =
      dist (packet.point U1Depth5.f1) (packet.point U1Depth5.f2) := by
    exact packet.hrow_of_slot_metric U1Depth5.CriticalSource.f1
      hpt_f4_f1_2 hpt_f2_f1_0 hslot_f1_f4_f2
  have hrow_6 : dist (packet.point U1Depth5.f1) (packet.point U1Depth5.p) =
      dist (packet.point U1Depth5.f1) (packet.point U1Depth5.f2) := by
    exact packet.hrow_of_slot_metric U1Depth5.CriticalSource.f1
      hpt_p_f1_3 hpt_f2_f1_0 hslot_f1_p_f2
  have hrow_13_for_replay :
      dist (packet.point U1Depth5.q) (packet.point U1Depth5.t1) =
        dist (packet.point U1Depth5.q) (packet.point U1Depth5.f1) := by
    exact packet.hrow_of_slot_metric U1Depth5.CriticalSource.q
      hpt_t1_q_2 hpt_f1_q_0 hslot_q_t1_f1
  have hrow_15_for_replay :
      dist (packet.point U1Depth5.t1) (packet.point U1Depth5.p) =
        dist (packet.point U1Depth5.t1) (packet.point U1Depth5.f1) := by
    exact packet.hrow_of_slot_metric U1Depth5.CriticalSource.t1
      hpt_p_t1_1 hpt_f1_t1_0 hslot_t1_p_f1
  have hrow_16_for_replay :
      dist (packet.point U1Depth5.t1) (packet.point U1Depth5.q) =
        dist (packet.point U1Depth5.t1) (packet.point U1Depth5.f1) := by
    exact packet.hrow_of_slot_metric U1Depth5.CriticalSource.t1
      hpt_q_t1_2 hpt_f1_t1_0 hslot_t1_q_f1
  have hrow_17_for_replay :
      dist (packet.point U1Depth5.t1) (packet.point U1Depth5.t3) =
        dist (packet.point U1Depth5.t1) (packet.point U1Depth5.f1) := by
    exact packet.hrow_of_slot_metric U1Depth5.CriticalSource.t1
      hpt_t3_t1_3 hpt_f1_t1_0 hslot_t1_t3_f1
  have hrow_q_t2 :
      dist (packet.point U1Depth5.q) (packet.point U1Depth5.t2) =
        dist (packet.point U1Depth5.q) (packet.point U1Depth5.f1) :=
    cert_00001_f82b7757657a13fd_hslot_q_t2_f1_of_row_slot_packet
      packet hrow_0 hrow_1 hrow_2 hrow_4 hrow_5 hrow_6 hrow_12
      hrow_13_for_replay hrow_15_for_replay hrow_16_for_replay
      hrow_17_for_replay hrow_20 hrow_21 hrow_22 hrow_24 hrow_25 hrow_26
  have hslot_q_t2_f1 :
      dist (packet.point U1Depth5.q)
          ((packet.rows.rowAt U1Depth5.CriticalSource.q).slotPoint 3) =
        dist (packet.point U1Depth5.q)
          ((packet.rows.rowAt U1Depth5.CriticalSource.q).slotPoint 0) := by
    rw [← hpt_t2_q_3, ← hpt_f1_q_0]
    exact hrow_q_t2
  exact
    record001_branch0_false_of_qt1_replay
      hfixed packet hslot_f1_f3_f2 hslot_f1_f4_f2 hslot_f1_p_f2
      hslot_q_t2_f1 hslot_t1_p_f1 hslot_t1_q_f1 hslot_t1_t3_f1
      hchoice_f3_f1_1 hchoice_f4_f1_2 hocc_f2_f1_0 hfix_p_f1_3
      hfix_t1_q_2 hfix_f1_q_0 hfix_t2_q_3 hfix_p_t1_1 hfix_f1_t1_0
      hfix_q_t1_2 hfix_t3_t1_3 hrow_12 hrow_20 hrow_21 hrow_22 hrow_24
      hrow_25 hrow_26

/-- Record-1 branch 0 with the `t1:p=f1` slot metric supplied by the checked
record-1 hslot replay, then passed to `record001_branch0_false_of_qt1_replay`.

This is another one-missing-non-f1 adapter; it still assumes the other non-f1
slot metrics explicitly. -/
theorem record001_branch0_false_of_t1p_replay
    {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : U1Depth5.Plane}
    (hfixed : U3FixedTriplePacket D baseQ baseP baseT1 baseT2 baseT3)
    (packet : U1Depth5.RowSlotLabelPacket D baseP baseQ baseT1 baseT2 baseT3 selectedU)
    (hslot_f1_f3_f2 :
      dist (packet.point U1Depth5.f1)
          ((packet.rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 1) =
        dist (packet.point U1Depth5.f1)
          ((packet.rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 0))
    (hslot_f1_f4_f2 :
      dist (packet.point U1Depth5.f1)
          ((packet.rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 2) =
        dist (packet.point U1Depth5.f1)
          ((packet.rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 0))
    (hslot_f1_p_f2 :
      dist (packet.point U1Depth5.f1)
          ((packet.rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 3) =
        dist (packet.point U1Depth5.f1)
          ((packet.rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 0))
    (hslot_q_t1_f1 :
      dist (packet.point U1Depth5.q)
          ((packet.rows.rowAt U1Depth5.CriticalSource.q).slotPoint 2) =
        dist (packet.point U1Depth5.q)
          ((packet.rows.rowAt U1Depth5.CriticalSource.q).slotPoint 0))
    (hslot_q_t2_f1 :
      dist (packet.point U1Depth5.q)
          ((packet.rows.rowAt U1Depth5.CriticalSource.q).slotPoint 3) =
        dist (packet.point U1Depth5.q)
          ((packet.rows.rowAt U1Depth5.CriticalSource.q).slotPoint 0))
    (hslot_t1_q_f1 :
      dist (packet.point U1Depth5.t1)
          ((packet.rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 2) =
        dist (packet.point U1Depth5.t1)
          ((packet.rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 0))
    (hslot_t1_t3_f1 :
      dist (packet.point U1Depth5.t1)
          ((packet.rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 3) =
        dist (packet.point U1Depth5.t1)
          ((packet.rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 0))
    (hchoice_f3_f1_1 :
      packet.f3Choice = { source := U1Depth5.CriticalSource.f1, slot := 1 })
    (hchoice_f4_f1_2 :
      packet.f4Choice = { source := U1Depth5.CriticalSource.f1, slot := 2 })
    (hocc_f2_f1_0 :
      packet.rows.pointOfChoice packet.f2Choice =
        ((packet.rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 0))
    (hfix_p_f1_3 :
      baseP = ((packet.rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 3))
    (hfix_t1_q_2 :
      baseT1 = ((packet.rows.rowAt U1Depth5.CriticalSource.q).slotPoint 2))
    (hfix_f1_q_0 :
      selectedU = ((packet.rows.rowAt U1Depth5.CriticalSource.q).slotPoint 0))
    (hfix_t2_q_3 :
      baseT2 = ((packet.rows.rowAt U1Depth5.CriticalSource.q).slotPoint 3))
    (hfix_p_t1_1 :
      baseP = ((packet.rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 1))
    (hfix_f1_t1_0 :
      selectedU = ((packet.rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 0))
    (hfix_q_t1_2 :
      baseQ = ((packet.rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 2))
    (hfix_t3_t1_3 :
      baseT3 = ((packet.rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 3))
    (hrow_12 : dist (packet.point U1Depth5.q) (packet.point U1Depth5.p) =
      dist (packet.point U1Depth5.q) (packet.point U1Depth5.f1))
    (hrow_20 : dist (packet.point U1Depth5.t2) (packet.point U1Depth5.f5) =
      dist (packet.point U1Depth5.t2) (packet.point U1Depth5.f2))
    (hrow_21 : dist (packet.point U1Depth5.t2) (packet.point U1Depth5.p) =
      dist (packet.point U1Depth5.t2) (packet.point U1Depth5.f2))
    (hrow_22 : dist (packet.point U1Depth5.t2) (packet.point U1Depth5.q) =
      dist (packet.point U1Depth5.t2) (packet.point U1Depth5.f2))
    (hrow_24 : dist (packet.point U1Depth5.t3) (packet.point U1Depth5.f2) =
      dist (packet.point U1Depth5.t3) (packet.point U1Depth5.f1))
    (hrow_25 : dist (packet.point U1Depth5.t3) (packet.point U1Depth5.p) =
      dist (packet.point U1Depth5.t3) (packet.point U1Depth5.f1))
    (hrow_26 : dist (packet.point U1Depth5.t3) (packet.point U1Depth5.t1) =
      dist (packet.point U1Depth5.t3) (packet.point U1Depth5.f1)) :
    False := by
  have hpt_f3_f1_1 : packet.point U1Depth5.f3 =
      ((packet.rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 1) := by
    have hselected := packet.point_f3_eq_selectedSlot
    rw [hchoice_f3_f1_1] at hselected
    exact hselected
  have hpt_f2_f1_0 : packet.point U1Depth5.f2 =
      ((packet.rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 0) := by
    exact packet.point_f2_eq_slotPoint_of_occurrence hocc_f2_f1_0
  have hpt_f4_f1_2 : packet.point U1Depth5.f4 =
      ((packet.rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 2) := by
    have hselected := packet.point_f4_eq_selectedSlot
    rw [hchoice_f4_f1_2] at hselected
    exact hselected
  have hpt_p_f1_3 : packet.point U1Depth5.p =
      ((packet.rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 3) := by
    simpa using hfix_p_f1_3
  have hpt_t1_q_2 : packet.point U1Depth5.t1 =
      ((packet.rows.rowAt U1Depth5.CriticalSource.q).slotPoint 2) := by
    simpa using hfix_t1_q_2
  have hpt_f1_q_0 : packet.point U1Depth5.f1 =
      ((packet.rows.rowAt U1Depth5.CriticalSource.q).slotPoint 0) := by
    simpa using hfix_f1_q_0
  have hpt_t2_q_3 : packet.point U1Depth5.t2 =
      ((packet.rows.rowAt U1Depth5.CriticalSource.q).slotPoint 3) := by
    simpa using hfix_t2_q_3
  have hpt_p_t1_1 : packet.point U1Depth5.p =
      ((packet.rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 1) := by
    simpa using hfix_p_t1_1
  have hpt_f1_t1_0 : packet.point U1Depth5.f1 =
      ((packet.rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 0) := by
    simpa using hfix_f1_t1_0
  have hpt_q_t1_2 : packet.point U1Depth5.q =
      ((packet.rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 2) := by
    simpa using hfix_q_t1_2
  have hpt_t3_t1_3 : packet.point U1Depth5.t3 =
      ((packet.rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 3) := by
    simpa using hfix_t3_t1_3
  have hrow_0 : dist (packet.point U1Depth5.p) (packet.point U1Depth5.t1) =
      dist (packet.point U1Depth5.p) (packet.point U1Depth5.q) := by
    simpa using hfixed.t1_same_radius
  have hrow_1 : dist (packet.point U1Depth5.p) (packet.point U1Depth5.t2) =
      dist (packet.point U1Depth5.p) (packet.point U1Depth5.q) := by
    simpa using hfixed.t2_same_radius
  have hrow_2 : dist (packet.point U1Depth5.p) (packet.point U1Depth5.t3) =
      dist (packet.point U1Depth5.p) (packet.point U1Depth5.q) := by
    simpa using hfixed.t3_same_radius
  have hrow_4 : dist (packet.point U1Depth5.f1) (packet.point U1Depth5.f3) =
      dist (packet.point U1Depth5.f1) (packet.point U1Depth5.f2) := by
    exact packet.hrow_of_slot_metric U1Depth5.CriticalSource.f1
      hpt_f3_f1_1 hpt_f2_f1_0 hslot_f1_f3_f2
  have hrow_5 : dist (packet.point U1Depth5.f1) (packet.point U1Depth5.f4) =
      dist (packet.point U1Depth5.f1) (packet.point U1Depth5.f2) := by
    exact packet.hrow_of_slot_metric U1Depth5.CriticalSource.f1
      hpt_f4_f1_2 hpt_f2_f1_0 hslot_f1_f4_f2
  have hrow_6 : dist (packet.point U1Depth5.f1) (packet.point U1Depth5.p) =
      dist (packet.point U1Depth5.f1) (packet.point U1Depth5.f2) := by
    exact packet.hrow_of_slot_metric U1Depth5.CriticalSource.f1
      hpt_p_f1_3 hpt_f2_f1_0 hslot_f1_p_f2
  have hrow_13_for_replay :
      dist (packet.point U1Depth5.q) (packet.point U1Depth5.t1) =
        dist (packet.point U1Depth5.q) (packet.point U1Depth5.f1) := by
    exact packet.hrow_of_slot_metric U1Depth5.CriticalSource.q
      hpt_t1_q_2 hpt_f1_q_0 hslot_q_t1_f1
  have hrow_14_for_replay :
      dist (packet.point U1Depth5.q) (packet.point U1Depth5.t2) =
        dist (packet.point U1Depth5.q) (packet.point U1Depth5.f1) := by
    exact packet.hrow_of_slot_metric U1Depth5.CriticalSource.q
      hpt_t2_q_3 hpt_f1_q_0 hslot_q_t2_f1
  have hrow_16_for_replay :
      dist (packet.point U1Depth5.t1) (packet.point U1Depth5.q) =
        dist (packet.point U1Depth5.t1) (packet.point U1Depth5.f1) := by
    exact packet.hrow_of_slot_metric U1Depth5.CriticalSource.t1
      hpt_q_t1_2 hpt_f1_t1_0 hslot_t1_q_f1
  have hrow_17_for_replay :
      dist (packet.point U1Depth5.t1) (packet.point U1Depth5.t3) =
        dist (packet.point U1Depth5.t1) (packet.point U1Depth5.f1) := by
    exact packet.hrow_of_slot_metric U1Depth5.CriticalSource.t1
      hpt_t3_t1_3 hpt_f1_t1_0 hslot_t1_t3_f1
  have hrow_t1_p :
      dist (packet.point U1Depth5.t1) (packet.point U1Depth5.p) =
        dist (packet.point U1Depth5.t1) (packet.point U1Depth5.f1) :=
    cert_00002_3c7c52fd670c4d57_hslot_t1_p_f1_of_row_slot_packet
      packet hrow_0 hrow_1 hrow_2 hrow_4 hrow_5 hrow_6 hrow_12
      hrow_13_for_replay hrow_14_for_replay hrow_16_for_replay
      hrow_17_for_replay hrow_20 hrow_21 hrow_22 hrow_24 hrow_25 hrow_26
  have hslot_t1_p_f1 :
      dist (packet.point U1Depth5.t1)
          ((packet.rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 1) =
        dist (packet.point U1Depth5.t1)
          ((packet.rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 0) := by
    rw [← hpt_p_t1_1, ← hpt_f1_t1_0]
    exact hrow_t1_p
  exact
    record001_branch0_false_of_qt1_replay
      hfixed packet hslot_f1_f3_f2 hslot_f1_f4_f2 hslot_f1_p_f2
      hslot_q_t2_f1 hslot_t1_p_f1 hslot_t1_q_f1 hslot_t1_t3_f1
      hchoice_f3_f1_1 hchoice_f4_f1_2 hocc_f2_f1_0 hfix_p_f1_3
      hfix_t1_q_2 hfix_f1_q_0 hfix_t2_q_3 hfix_p_t1_1 hfix_f1_t1_0
      hfix_q_t1_2 hfix_t3_t1_3 hrow_12 hrow_20 hrow_21 hrow_22 hrow_24
      hrow_25 hrow_26

/-- Record-1 branch 0 with the `t1:q=f1` slot metric supplied by the checked
record-1 hslot replay.

This is a one-missing adapter for the `t1:q=f1` field only. -/
theorem record001_branch0_false_of_t1q_replay
    {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : U1Depth5.Plane}
    (hfixed : U3FixedTriplePacket D baseQ baseP baseT1 baseT2 baseT3)
    (packet : U1Depth5.RowSlotLabelPacket D baseP baseQ baseT1 baseT2 baseT3 selectedU)
    (hslot_f1_f3_f2 :
      dist (packet.point U1Depth5.f1)
          ((packet.rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 1) =
        dist (packet.point U1Depth5.f1)
          ((packet.rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 0))
    (hslot_f1_f4_f2 :
      dist (packet.point U1Depth5.f1)
          ((packet.rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 2) =
        dist (packet.point U1Depth5.f1)
          ((packet.rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 0))
    (hslot_f1_p_f2 :
      dist (packet.point U1Depth5.f1)
          ((packet.rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 3) =
        dist (packet.point U1Depth5.f1)
          ((packet.rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 0))
    (hslot_q_t1_f1 :
      dist (packet.point U1Depth5.q)
          ((packet.rows.rowAt U1Depth5.CriticalSource.q).slotPoint 2) =
        dist (packet.point U1Depth5.q)
          ((packet.rows.rowAt U1Depth5.CriticalSource.q).slotPoint 0))
    (hslot_q_t2_f1 :
      dist (packet.point U1Depth5.q)
          ((packet.rows.rowAt U1Depth5.CriticalSource.q).slotPoint 3) =
        dist (packet.point U1Depth5.q)
          ((packet.rows.rowAt U1Depth5.CriticalSource.q).slotPoint 0))
    (hslot_t1_p_f1 :
      dist (packet.point U1Depth5.t1)
          ((packet.rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 1) =
        dist (packet.point U1Depth5.t1)
          ((packet.rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 0))
    (hslot_t1_t3_f1 :
      dist (packet.point U1Depth5.t1)
          ((packet.rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 3) =
        dist (packet.point U1Depth5.t1)
          ((packet.rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 0))
    (hchoice_f3_f1_1 :
      packet.f3Choice = { source := U1Depth5.CriticalSource.f1, slot := 1 })
    (hchoice_f4_f1_2 :
      packet.f4Choice = { source := U1Depth5.CriticalSource.f1, slot := 2 })
    (hocc_f2_f1_0 :
      packet.rows.pointOfChoice packet.f2Choice =
        ((packet.rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 0))
    (hfix_p_f1_3 :
      baseP = ((packet.rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 3))
    (hfix_t1_q_2 :
      baseT1 = ((packet.rows.rowAt U1Depth5.CriticalSource.q).slotPoint 2))
    (hfix_f1_q_0 :
      selectedU = ((packet.rows.rowAt U1Depth5.CriticalSource.q).slotPoint 0))
    (hfix_t2_q_3 :
      baseT2 = ((packet.rows.rowAt U1Depth5.CriticalSource.q).slotPoint 3))
    (hfix_p_t1_1 :
      baseP = ((packet.rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 1))
    (hfix_f1_t1_0 :
      selectedU = ((packet.rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 0))
    (hfix_q_t1_2 :
      baseQ = ((packet.rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 2))
    (hfix_t3_t1_3 :
      baseT3 = ((packet.rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 3))
    (hrow_12 : dist (packet.point U1Depth5.q) (packet.point U1Depth5.p) =
      dist (packet.point U1Depth5.q) (packet.point U1Depth5.f1))
    (hrow_20 : dist (packet.point U1Depth5.t2) (packet.point U1Depth5.f5) =
      dist (packet.point U1Depth5.t2) (packet.point U1Depth5.f2))
    (hrow_21 : dist (packet.point U1Depth5.t2) (packet.point U1Depth5.p) =
      dist (packet.point U1Depth5.t2) (packet.point U1Depth5.f2))
    (hrow_22 : dist (packet.point U1Depth5.t2) (packet.point U1Depth5.q) =
      dist (packet.point U1Depth5.t2) (packet.point U1Depth5.f2))
    (hrow_24 : dist (packet.point U1Depth5.t3) (packet.point U1Depth5.f2) =
      dist (packet.point U1Depth5.t3) (packet.point U1Depth5.f1))
    (hrow_25 : dist (packet.point U1Depth5.t3) (packet.point U1Depth5.p) =
      dist (packet.point U1Depth5.t3) (packet.point U1Depth5.f1))
    (hrow_26 : dist (packet.point U1Depth5.t3) (packet.point U1Depth5.t1) =
      dist (packet.point U1Depth5.t3) (packet.point U1Depth5.f1)) :
    False := by
  have hpt_f3_f1_1 : packet.point U1Depth5.f3 =
      ((packet.rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 1) := by
    have hselected := packet.point_f3_eq_selectedSlot
    rw [hchoice_f3_f1_1] at hselected
    exact hselected
  have hpt_f2_f1_0 : packet.point U1Depth5.f2 =
      ((packet.rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 0) := by
    exact packet.point_f2_eq_slotPoint_of_occurrence hocc_f2_f1_0
  have hpt_f4_f1_2 : packet.point U1Depth5.f4 =
      ((packet.rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 2) := by
    have hselected := packet.point_f4_eq_selectedSlot
    rw [hchoice_f4_f1_2] at hselected
    exact hselected
  have hpt_p_f1_3 : packet.point U1Depth5.p =
      ((packet.rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 3) := by
    simpa using hfix_p_f1_3
  have hpt_t1_q_2 : packet.point U1Depth5.t1 =
      ((packet.rows.rowAt U1Depth5.CriticalSource.q).slotPoint 2) := by
    simpa using hfix_t1_q_2
  have hpt_f1_q_0 : packet.point U1Depth5.f1 =
      ((packet.rows.rowAt U1Depth5.CriticalSource.q).slotPoint 0) := by
    simpa using hfix_f1_q_0
  have hpt_t2_q_3 : packet.point U1Depth5.t2 =
      ((packet.rows.rowAt U1Depth5.CriticalSource.q).slotPoint 3) := by
    simpa using hfix_t2_q_3
  have hpt_p_t1_1 : packet.point U1Depth5.p =
      ((packet.rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 1) := by
    simpa using hfix_p_t1_1
  have hpt_f1_t1_0 : packet.point U1Depth5.f1 =
      ((packet.rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 0) := by
    simpa using hfix_f1_t1_0
  have hpt_q_t1_2 : packet.point U1Depth5.q =
      ((packet.rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 2) := by
    simpa using hfix_q_t1_2
  have hpt_t3_t1_3 : packet.point U1Depth5.t3 =
      ((packet.rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 3) := by
    simpa using hfix_t3_t1_3
  have hrow_0 : dist (packet.point U1Depth5.p) (packet.point U1Depth5.t1) =
      dist (packet.point U1Depth5.p) (packet.point U1Depth5.q) := by
    simpa using hfixed.t1_same_radius
  have hrow_1 : dist (packet.point U1Depth5.p) (packet.point U1Depth5.t2) =
      dist (packet.point U1Depth5.p) (packet.point U1Depth5.q) := by
    simpa using hfixed.t2_same_radius
  have hrow_2 : dist (packet.point U1Depth5.p) (packet.point U1Depth5.t3) =
      dist (packet.point U1Depth5.p) (packet.point U1Depth5.q) := by
    simpa using hfixed.t3_same_radius
  have hrow_4 : dist (packet.point U1Depth5.f1) (packet.point U1Depth5.f3) =
      dist (packet.point U1Depth5.f1) (packet.point U1Depth5.f2) := by
    exact packet.hrow_of_slot_metric U1Depth5.CriticalSource.f1
      hpt_f3_f1_1 hpt_f2_f1_0 hslot_f1_f3_f2
  have hrow_5 : dist (packet.point U1Depth5.f1) (packet.point U1Depth5.f4) =
      dist (packet.point U1Depth5.f1) (packet.point U1Depth5.f2) := by
    exact packet.hrow_of_slot_metric U1Depth5.CriticalSource.f1
      hpt_f4_f1_2 hpt_f2_f1_0 hslot_f1_f4_f2
  have hrow_6 : dist (packet.point U1Depth5.f1) (packet.point U1Depth5.p) =
      dist (packet.point U1Depth5.f1) (packet.point U1Depth5.f2) := by
    exact packet.hrow_of_slot_metric U1Depth5.CriticalSource.f1
      hpt_p_f1_3 hpt_f2_f1_0 hslot_f1_p_f2
  have hrow_13_for_replay :
      dist (packet.point U1Depth5.q) (packet.point U1Depth5.t1) =
        dist (packet.point U1Depth5.q) (packet.point U1Depth5.f1) := by
    exact packet.hrow_of_slot_metric U1Depth5.CriticalSource.q
      hpt_t1_q_2 hpt_f1_q_0 hslot_q_t1_f1
  have hrow_14_for_replay :
      dist (packet.point U1Depth5.q) (packet.point U1Depth5.t2) =
        dist (packet.point U1Depth5.q) (packet.point U1Depth5.f1) := by
    exact packet.hrow_of_slot_metric U1Depth5.CriticalSource.q
      hpt_t2_q_3 hpt_f1_q_0 hslot_q_t2_f1
  have hrow_15_for_replay :
      dist (packet.point U1Depth5.t1) (packet.point U1Depth5.p) =
        dist (packet.point U1Depth5.t1) (packet.point U1Depth5.f1) := by
    exact packet.hrow_of_slot_metric U1Depth5.CriticalSource.t1
      hpt_p_t1_1 hpt_f1_t1_0 hslot_t1_p_f1
  have hrow_17_for_replay :
      dist (packet.point U1Depth5.t1) (packet.point U1Depth5.t3) =
        dist (packet.point U1Depth5.t1) (packet.point U1Depth5.f1) := by
    exact packet.hrow_of_slot_metric U1Depth5.CriticalSource.t1
      hpt_t3_t1_3 hpt_f1_t1_0 hslot_t1_t3_f1
  have hrow_t1_q :
      dist (packet.point U1Depth5.t1) (packet.point U1Depth5.q) =
        dist (packet.point U1Depth5.t1) (packet.point U1Depth5.f1) :=
    cert_00003_76a36620a0636523_hslot_t1_q_f1_of_row_slot_packet
      packet hrow_0 hrow_1 hrow_2 hrow_4 hrow_5 hrow_6 hrow_12
      hrow_13_for_replay hrow_14_for_replay hrow_15_for_replay
      hrow_17_for_replay hrow_20 hrow_21 hrow_22 hrow_24 hrow_25 hrow_26
  have hslot_t1_q_f1 :
      dist (packet.point U1Depth5.t1)
          ((packet.rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 2) =
        dist (packet.point U1Depth5.t1)
          ((packet.rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 0) := by
    rw [← hpt_q_t1_2, ← hpt_f1_t1_0]
    exact hrow_t1_q
  exact
    record001_branch0_false_of_qt1_replay
      hfixed packet hslot_f1_f3_f2 hslot_f1_f4_f2 hslot_f1_p_f2
      hslot_q_t2_f1 hslot_t1_p_f1 hslot_t1_q_f1 hslot_t1_t3_f1
      hchoice_f3_f1_1 hchoice_f4_f1_2 hocc_f2_f1_0 hfix_p_f1_3
      hfix_t1_q_2 hfix_f1_q_0 hfix_t2_q_3 hfix_p_t1_1 hfix_f1_t1_0
      hfix_q_t1_2 hfix_t3_t1_3 hrow_12 hrow_20 hrow_21 hrow_22 hrow_24
      hrow_25 hrow_26

/-- Record-1 branch 0 with the `t1:t3=f1` slot metric supplied by the checked
record-1 hslot replay.

This is a one-missing adapter for the `t1:t3=f1` field only. -/
theorem record001_branch0_false_of_t1t3_replay
    {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : U1Depth5.Plane}
    (hfixed : U3FixedTriplePacket D baseQ baseP baseT1 baseT2 baseT3)
    (packet : U1Depth5.RowSlotLabelPacket D baseP baseQ baseT1 baseT2 baseT3 selectedU)
    (hslot_f1_f3_f2 :
      dist (packet.point U1Depth5.f1)
          ((packet.rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 1) =
        dist (packet.point U1Depth5.f1)
          ((packet.rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 0))
    (hslot_f1_f4_f2 :
      dist (packet.point U1Depth5.f1)
          ((packet.rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 2) =
        dist (packet.point U1Depth5.f1)
          ((packet.rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 0))
    (hslot_f1_p_f2 :
      dist (packet.point U1Depth5.f1)
          ((packet.rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 3) =
        dist (packet.point U1Depth5.f1)
          ((packet.rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 0))
    (hslot_q_t1_f1 :
      dist (packet.point U1Depth5.q)
          ((packet.rows.rowAt U1Depth5.CriticalSource.q).slotPoint 2) =
        dist (packet.point U1Depth5.q)
          ((packet.rows.rowAt U1Depth5.CriticalSource.q).slotPoint 0))
    (hslot_q_t2_f1 :
      dist (packet.point U1Depth5.q)
          ((packet.rows.rowAt U1Depth5.CriticalSource.q).slotPoint 3) =
        dist (packet.point U1Depth5.q)
          ((packet.rows.rowAt U1Depth5.CriticalSource.q).slotPoint 0))
    (hslot_t1_p_f1 :
      dist (packet.point U1Depth5.t1)
          ((packet.rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 1) =
        dist (packet.point U1Depth5.t1)
          ((packet.rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 0))
    (hslot_t1_q_f1 :
      dist (packet.point U1Depth5.t1)
          ((packet.rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 2) =
        dist (packet.point U1Depth5.t1)
          ((packet.rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 0))
    (hchoice_f3_f1_1 :
      packet.f3Choice = { source := U1Depth5.CriticalSource.f1, slot := 1 })
    (hchoice_f4_f1_2 :
      packet.f4Choice = { source := U1Depth5.CriticalSource.f1, slot := 2 })
    (hocc_f2_f1_0 :
      packet.rows.pointOfChoice packet.f2Choice =
        ((packet.rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 0))
    (hfix_p_f1_3 :
      baseP = ((packet.rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 3))
    (hfix_t1_q_2 :
      baseT1 = ((packet.rows.rowAt U1Depth5.CriticalSource.q).slotPoint 2))
    (hfix_f1_q_0 :
      selectedU = ((packet.rows.rowAt U1Depth5.CriticalSource.q).slotPoint 0))
    (hfix_t2_q_3 :
      baseT2 = ((packet.rows.rowAt U1Depth5.CriticalSource.q).slotPoint 3))
    (hfix_p_t1_1 :
      baseP = ((packet.rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 1))
    (hfix_f1_t1_0 :
      selectedU = ((packet.rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 0))
    (hfix_q_t1_2 :
      baseQ = ((packet.rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 2))
    (hfix_t3_t1_3 :
      baseT3 = ((packet.rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 3))
    (hrow_12 : dist (packet.point U1Depth5.q) (packet.point U1Depth5.p) =
      dist (packet.point U1Depth5.q) (packet.point U1Depth5.f1))
    (hrow_20 : dist (packet.point U1Depth5.t2) (packet.point U1Depth5.f5) =
      dist (packet.point U1Depth5.t2) (packet.point U1Depth5.f2))
    (hrow_21 : dist (packet.point U1Depth5.t2) (packet.point U1Depth5.p) =
      dist (packet.point U1Depth5.t2) (packet.point U1Depth5.f2))
    (hrow_22 : dist (packet.point U1Depth5.t2) (packet.point U1Depth5.q) =
      dist (packet.point U1Depth5.t2) (packet.point U1Depth5.f2))
    (hrow_24 : dist (packet.point U1Depth5.t3) (packet.point U1Depth5.f2) =
      dist (packet.point U1Depth5.t3) (packet.point U1Depth5.f1))
    (hrow_25 : dist (packet.point U1Depth5.t3) (packet.point U1Depth5.p) =
      dist (packet.point U1Depth5.t3) (packet.point U1Depth5.f1))
    (hrow_26 : dist (packet.point U1Depth5.t3) (packet.point U1Depth5.t1) =
      dist (packet.point U1Depth5.t3) (packet.point U1Depth5.f1)) :
    False := by
  have hpt_f3_f1_1 : packet.point U1Depth5.f3 =
      ((packet.rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 1) := by
    have hselected := packet.point_f3_eq_selectedSlot
    rw [hchoice_f3_f1_1] at hselected
    exact hselected
  have hpt_f2_f1_0 : packet.point U1Depth5.f2 =
      ((packet.rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 0) := by
    exact packet.point_f2_eq_slotPoint_of_occurrence hocc_f2_f1_0
  have hpt_f4_f1_2 : packet.point U1Depth5.f4 =
      ((packet.rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 2) := by
    have hselected := packet.point_f4_eq_selectedSlot
    rw [hchoice_f4_f1_2] at hselected
    exact hselected
  have hpt_p_f1_3 : packet.point U1Depth5.p =
      ((packet.rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 3) := by
    simpa using hfix_p_f1_3
  have hpt_t1_q_2 : packet.point U1Depth5.t1 =
      ((packet.rows.rowAt U1Depth5.CriticalSource.q).slotPoint 2) := by
    simpa using hfix_t1_q_2
  have hpt_f1_q_0 : packet.point U1Depth5.f1 =
      ((packet.rows.rowAt U1Depth5.CriticalSource.q).slotPoint 0) := by
    simpa using hfix_f1_q_0
  have hpt_t2_q_3 : packet.point U1Depth5.t2 =
      ((packet.rows.rowAt U1Depth5.CriticalSource.q).slotPoint 3) := by
    simpa using hfix_t2_q_3
  have hpt_p_t1_1 : packet.point U1Depth5.p =
      ((packet.rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 1) := by
    simpa using hfix_p_t1_1
  have hpt_f1_t1_0 : packet.point U1Depth5.f1 =
      ((packet.rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 0) := by
    simpa using hfix_f1_t1_0
  have hpt_q_t1_2 : packet.point U1Depth5.q =
      ((packet.rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 2) := by
    simpa using hfix_q_t1_2
  have hpt_t3_t1_3 : packet.point U1Depth5.t3 =
      ((packet.rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 3) := by
    simpa using hfix_t3_t1_3
  have hrow_0 : dist (packet.point U1Depth5.p) (packet.point U1Depth5.t1) =
      dist (packet.point U1Depth5.p) (packet.point U1Depth5.q) := by
    simpa using hfixed.t1_same_radius
  have hrow_1 : dist (packet.point U1Depth5.p) (packet.point U1Depth5.t2) =
      dist (packet.point U1Depth5.p) (packet.point U1Depth5.q) := by
    simpa using hfixed.t2_same_radius
  have hrow_2 : dist (packet.point U1Depth5.p) (packet.point U1Depth5.t3) =
      dist (packet.point U1Depth5.p) (packet.point U1Depth5.q) := by
    simpa using hfixed.t3_same_radius
  have hrow_4 : dist (packet.point U1Depth5.f1) (packet.point U1Depth5.f3) =
      dist (packet.point U1Depth5.f1) (packet.point U1Depth5.f2) := by
    exact packet.hrow_of_slot_metric U1Depth5.CriticalSource.f1
      hpt_f3_f1_1 hpt_f2_f1_0 hslot_f1_f3_f2
  have hrow_5 : dist (packet.point U1Depth5.f1) (packet.point U1Depth5.f4) =
      dist (packet.point U1Depth5.f1) (packet.point U1Depth5.f2) := by
    exact packet.hrow_of_slot_metric U1Depth5.CriticalSource.f1
      hpt_f4_f1_2 hpt_f2_f1_0 hslot_f1_f4_f2
  have hrow_6 : dist (packet.point U1Depth5.f1) (packet.point U1Depth5.p) =
      dist (packet.point U1Depth5.f1) (packet.point U1Depth5.f2) := by
    exact packet.hrow_of_slot_metric U1Depth5.CriticalSource.f1
      hpt_p_f1_3 hpt_f2_f1_0 hslot_f1_p_f2
  have hrow_13_for_replay :
      dist (packet.point U1Depth5.q) (packet.point U1Depth5.t1) =
        dist (packet.point U1Depth5.q) (packet.point U1Depth5.f1) := by
    exact packet.hrow_of_slot_metric U1Depth5.CriticalSource.q
      hpt_t1_q_2 hpt_f1_q_0 hslot_q_t1_f1
  have hrow_14_for_replay :
      dist (packet.point U1Depth5.q) (packet.point U1Depth5.t2) =
        dist (packet.point U1Depth5.q) (packet.point U1Depth5.f1) := by
    exact packet.hrow_of_slot_metric U1Depth5.CriticalSource.q
      hpt_t2_q_3 hpt_f1_q_0 hslot_q_t2_f1
  have hrow_15_for_replay :
      dist (packet.point U1Depth5.t1) (packet.point U1Depth5.p) =
        dist (packet.point U1Depth5.t1) (packet.point U1Depth5.f1) := by
    exact packet.hrow_of_slot_metric U1Depth5.CriticalSource.t1
      hpt_p_t1_1 hpt_f1_t1_0 hslot_t1_p_f1
  have hrow_16_for_replay :
      dist (packet.point U1Depth5.t1) (packet.point U1Depth5.q) =
        dist (packet.point U1Depth5.t1) (packet.point U1Depth5.f1) := by
    exact packet.hrow_of_slot_metric U1Depth5.CriticalSource.t1
      hpt_q_t1_2 hpt_f1_t1_0 hslot_t1_q_f1
  have hrow_t1_t3 :
      dist (packet.point U1Depth5.t1) (packet.point U1Depth5.t3) =
        dist (packet.point U1Depth5.t1) (packet.point U1Depth5.f1) :=
    cert_00004_9e0459aa495bc6ee_hslot_t1_t3_f1_of_row_slot_packet
      packet hrow_0 hrow_1 hrow_2 hrow_4 hrow_5 hrow_6 hrow_12
      hrow_13_for_replay hrow_14_for_replay hrow_15_for_replay
      hrow_16_for_replay hrow_20 hrow_21 hrow_22 hrow_24 hrow_25 hrow_26
  have hslot_t1_t3_f1 :
      dist (packet.point U1Depth5.t1)
          ((packet.rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 3) =
        dist (packet.point U1Depth5.t1)
          ((packet.rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 0) := by
    rw [← hpt_t3_t1_3, ← hpt_f1_t1_0]
    exact hrow_t1_t3
  exact
    record001_branch0_false_of_qt1_replay
      hfixed packet hslot_f1_f3_f2 hslot_f1_f4_f2 hslot_f1_p_f2
      hslot_q_t2_f1 hslot_t1_p_f1 hslot_t1_q_f1 hslot_t1_t3_f1
      hchoice_f3_f1_1 hchoice_f4_f1_2 hocc_f2_f1_0 hfix_p_f1_3
      hfix_t1_q_2 hfix_f1_q_0 hfix_t2_q_3 hfix_p_t1_1 hfix_f1_t1_0
      hfix_q_t1_2 hfix_t3_t1_3 hrow_12 hrow_20 hrow_21 hrow_22 hrow_24
      hrow_25 hrow_26

namespace Record001Branch0Payload

/-- A record-1 / branch-0 payload closes by the generated all-eight metric-core
branch theorem once the metric core is supplied.

This is a consumer endpoint only.  The live producer still must expose the
branch payload, and the `f1:*` metric facts remain a separate certificate/split
lane rather than part of the payload statement. -/
theorem false_of_all8_slot_metric_core
    {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : U1Depth5.Plane}
    {rows : U1Depth5.CriticalSourceRows D baseQ baseT1 baseT2 baseT3 selectedU}
    (hfixed : U3FixedTriplePacket D baseQ baseP baseT1 baseT2 baseT3)
    (payload :
      Record001Branch0Payload (D := D) (baseP := baseP) (baseQ := baseQ)
        (baseT1 := baseT1) (baseT2 := baseT2) (baseT3 := baseT3)
        (selectedU := selectedU) rows)
    (hall8 : U1Depth5.RowSlotLabelPacket.AllEightSlotMetricCore payload.packet) :
    False := by
  exact
    cert_00001_f46a07c8af1969fd_branch_00000_false_of_all8_slot_metric_core
      hfixed payload.packet hall8 payload.hchoice_f3_f1_1
      payload.hchoice_f4_f1_2 payload.hocc_f2_f1_0 payload.hfix_p_f1_3
      payload.hfix_t1_q_2 payload.hfix_f1_q_0 payload.hfix_t2_q_3
      payload.hfix_p_t1_1 payload.hfix_f1_t1_0 payload.hfix_q_t1_2
      payload.hfix_t3_t1_3 payload.hrow_12 payload.hrow_20
      payload.hrow_21 payload.hrow_22 payload.hrow_24 payload.hrow_25
      payload.hrow_26

/-- A record-1 / branch-0 payload closes by the existing `q:t1=f1` replay once
the remaining explicit slot metrics are supplied.

The hypotheses split the current work surface: this theorem consumes the
branch packet/equality/hrow payload, while separate producers still owe the
three `f1:*` metric facts and the non-omitted non-`f1` slot facts. -/
theorem false_of_qt1_replay
    {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : U1Depth5.Plane}
    {rows : U1Depth5.CriticalSourceRows D baseQ baseT1 baseT2 baseT3 selectedU}
    (hfixed : U3FixedTriplePacket D baseQ baseP baseT1 baseT2 baseT3)
    (payload :
      Record001Branch0Payload (D := D) (baseP := baseP) (baseQ := baseQ)
        (baseT1 := baseT1) (baseT2 := baseT2) (baseT3 := baseT3)
        (selectedU := selectedU) rows)
    (hslot_f1_f3_f2 :
      dist (payload.packet.point U1Depth5.f1)
          ((payload.packet.rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 1) =
        dist (payload.packet.point U1Depth5.f1)
          ((payload.packet.rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 0))
    (hslot_f1_f4_f2 :
      dist (payload.packet.point U1Depth5.f1)
          ((payload.packet.rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 2) =
        dist (payload.packet.point U1Depth5.f1)
          ((payload.packet.rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 0))
    (hslot_f1_p_f2 :
      dist (payload.packet.point U1Depth5.f1)
          ((payload.packet.rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 3) =
        dist (payload.packet.point U1Depth5.f1)
          ((payload.packet.rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 0))
    (hslot_q_t2_f1 :
      dist (payload.packet.point U1Depth5.q)
          ((payload.packet.rows.rowAt U1Depth5.CriticalSource.q).slotPoint 3) =
        dist (payload.packet.point U1Depth5.q)
          ((payload.packet.rows.rowAt U1Depth5.CriticalSource.q).slotPoint 0))
    (hslot_t1_p_f1 :
      dist (payload.packet.point U1Depth5.t1)
          ((payload.packet.rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 1) =
        dist (payload.packet.point U1Depth5.t1)
          ((payload.packet.rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 0))
    (hslot_t1_q_f1 :
      dist (payload.packet.point U1Depth5.t1)
          ((payload.packet.rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 2) =
        dist (payload.packet.point U1Depth5.t1)
          ((payload.packet.rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 0))
    (hslot_t1_t3_f1 :
      dist (payload.packet.point U1Depth5.t1)
          ((payload.packet.rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 3) =
        dist (payload.packet.point U1Depth5.t1)
          ((payload.packet.rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 0)) :
    False := by
  exact
    record001_branch0_false_of_qt1_replay
      hfixed payload.packet hslot_f1_f3_f2 hslot_f1_f4_f2 hslot_f1_p_f2
      hslot_q_t2_f1 hslot_t1_p_f1 hslot_t1_q_f1 hslot_t1_t3_f1
      payload.hchoice_f3_f1_1 payload.hchoice_f4_f1_2 payload.hocc_f2_f1_0
      payload.hfix_p_f1_3 payload.hfix_t1_q_2 payload.hfix_f1_q_0
      payload.hfix_t2_q_3 payload.hfix_p_t1_1 payload.hfix_f1_t1_0
      payload.hfix_q_t1_2 payload.hfix_t3_t1_3 payload.hrow_12
      payload.hrow_20 payload.hrow_21 payload.hrow_22 payload.hrow_24
      payload.hrow_25 payload.hrow_26

/-- Recover the reduced public `hqt` package from a record-1 / branch-0 payload
and the five q/t1 slot-metric facts.

This is the direct bridge from the existing branch payload surface to the
current public producer target `Record001QTFacingTransportRows`.  It uses only
the payload's stored branch choices and placements; the q/t1 slot metrics
remain external producer inputs. -/
theorem record001QTFacingTransportRows
    {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : U1Depth5.Plane}
    {rows : U1Depth5.CriticalSourceRows D baseQ baseT1 baseT2 baseT3 selectedU}
    (payload :
      Record001Branch0Payload (D := D) (baseP := baseP) (baseQ := baseQ)
        (baseT1 := baseT1) (baseT2 := baseT2) (baseT3 := baseT3)
        (selectedU := selectedU) rows)
    (hslot_q_t1_f1 :
      dist (payload.packet.point U1Depth5.q)
          ((payload.packet.rows.rowAt U1Depth5.CriticalSource.q).slotPoint 2) =
        dist (payload.packet.point U1Depth5.q)
          ((payload.packet.rows.rowAt U1Depth5.CriticalSource.q).slotPoint 0))
    (hslot_q_t2_f1 :
      dist (payload.packet.point U1Depth5.q)
          ((payload.packet.rows.rowAt U1Depth5.CriticalSource.q).slotPoint 3) =
        dist (payload.packet.point U1Depth5.q)
          ((payload.packet.rows.rowAt U1Depth5.CriticalSource.q).slotPoint 0))
    (hslot_t1_p_f1 :
      dist (payload.packet.point U1Depth5.t1)
          ((payload.packet.rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 1) =
        dist (payload.packet.point U1Depth5.t1)
          ((payload.packet.rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 0))
    (hslot_t1_q_f1 :
      dist (payload.packet.point U1Depth5.t1)
          ((payload.packet.rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 2) =
        dist (payload.packet.point U1Depth5.t1)
          ((payload.packet.rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 0))
    (hslot_t1_t3_f1 :
      dist (payload.packet.point U1Depth5.t1)
          ((payload.packet.rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 3) =
        dist (payload.packet.point U1Depth5.t1)
          ((payload.packet.rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 0)) :
    U1Depth5.Record001QTFacingTransportRows
      baseP baseQ baseT1 baseT2 baseT3 selectedU := by
  exact
    payload.packet.record001QTFacingTransportRows
      payload.hfix_t1_q_2 payload.hfix_f1_q_0 payload.hfix_t2_q_3
      payload.hfix_p_t1_1 payload.hfix_f1_t1_0 payload.hfix_q_t1_2
      payload.hfix_t3_t1_3 hslot_q_t1_f1 hslot_q_t2_f1 hslot_t1_p_f1
      hslot_t1_q_f1 hslot_t1_t3_f1

/-- A record-1 / branch-0 payload already determines the all-distinct side of
the remaining branch-0 collision split.

The payload fixes the record001 row-slot choices, the `f2=f1[0]` occurrence,
and the `p=f1[3]` placement.  Its packet also carries ten-label injectivity, so
every named collision in `Record001Branch0NoCollision` is discharged by an
appropriate label inequality. -/
theorem noCollision
    {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : U1Depth5.Plane}
    {rows : U1Depth5.CriticalSourceRows D baseQ baseT1 baseT2 baseT3 selectedU}
    (payload :
      Record001Branch0Payload (D := D) (baseP := baseP) (baseQ := baseQ)
        (baseT1 := baseT1) (baseT2 := baseT2) (baseT3 := baseT3)
        (selectedU := selectedU) rows) :
    U1Depth5.RowSlotLabelPacket.Record001Branch0NoCollision rows baseP := by
  have hpt_f2_t20 :
      payload.packet.point U1Depth5.f2 =
        (rows.rowAt U1Depth5.CriticalSource.t2).slotPoint 0 := by
    have hselected := payload.packet.point_f2_eq_selectedSlot
    rw [payload.hchoice_f2_t2_0, payload.rows_eq] at hselected
    simpa using hselected
  have hpt_f3_f11 :
      payload.packet.point U1Depth5.f3 =
        (rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 1 := by
    have hselected := payload.packet.point_f3_eq_selectedSlot
    rw [payload.hchoice_f3_f1_1, payload.rows_eq] at hselected
    simpa using hselected
  have hpt_f4_f12 :
      payload.packet.point U1Depth5.f4 =
        (rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 2 := by
    have hselected := payload.packet.point_f4_eq_selectedSlot
    rw [payload.hchoice_f4_f1_2, payload.rows_eq] at hselected
    simpa using hselected
  have hpt_f5_t21 :
      payload.packet.point U1Depth5.f5 =
        (rows.rowAt U1Depth5.CriticalSource.t2).slotPoint 1 := by
    have hselected := payload.packet.point_f5_eq_selectedSlot
    rw [payload.hchoice_f5_t2_1, payload.rows_eq] at hselected
    simpa using hselected
  refine
    { q_t20 := by
        simpa [hpt_f2_t20] using
          payload.packet.point_ne_of_label_ne (by decide : U1Depth5.q ≠ U1Depth5.f2)
      q_f11 := by
        simpa [hpt_f3_f11] using
          payload.packet.point_ne_of_label_ne (by decide : U1Depth5.q ≠ U1Depth5.f3)
      q_f12 := by
        simpa [hpt_f4_f12] using
          payload.packet.point_ne_of_label_ne (by decide : U1Depth5.q ≠ U1Depth5.f4)
      q_t21 := by
        simpa [hpt_f5_t21] using
          payload.packet.point_ne_of_label_ne (by decide : U1Depth5.q ≠ U1Depth5.f5)
      t1_t20 := by
        simpa [hpt_f2_t20] using
          payload.packet.point_ne_of_label_ne (by decide : U1Depth5.t1 ≠ U1Depth5.f2)
      t1_f11 := by
        simpa [hpt_f3_f11] using
          payload.packet.point_ne_of_label_ne (by decide : U1Depth5.t1 ≠ U1Depth5.f3)
      t1_f12 := by
        simpa [hpt_f4_f12] using
          payload.packet.point_ne_of_label_ne (by decide : U1Depth5.t1 ≠ U1Depth5.f4)
      t1_t21 := by
        simpa [hpt_f5_t21] using
          payload.packet.point_ne_of_label_ne (by decide : U1Depth5.t1 ≠ U1Depth5.f5)
      t2_t20 := by
        simpa [hpt_f2_t20] using
          payload.packet.point_ne_of_label_ne (by decide : U1Depth5.t2 ≠ U1Depth5.f2)
      t2_f11 := by
        simpa [hpt_f3_f11] using
          payload.packet.point_ne_of_label_ne (by decide : U1Depth5.t2 ≠ U1Depth5.f3)
      t2_f12 := by
        simpa [hpt_f4_f12] using
          payload.packet.point_ne_of_label_ne (by decide : U1Depth5.t2 ≠ U1Depth5.f4)
      t2_t21 := by
        simpa [hpt_f5_t21] using
          payload.packet.point_ne_of_label_ne (by decide : U1Depth5.t2 ≠ U1Depth5.f5)
      t3_t20 := by
        simpa [hpt_f2_t20] using
          payload.packet.point_ne_of_label_ne (by decide : U1Depth5.t3 ≠ U1Depth5.f2)
      t3_f11 := by
        simpa [hpt_f3_f11] using
          payload.packet.point_ne_of_label_ne (by decide : U1Depth5.t3 ≠ U1Depth5.f3)
      t3_f12 := by
        simpa [hpt_f4_f12] using
          payload.packet.point_ne_of_label_ne (by decide : U1Depth5.t3 ≠ U1Depth5.f4)
      t3_t21 := by
        simpa [hpt_f5_t21] using
          payload.packet.point_ne_of_label_ne (by decide : U1Depth5.t3 ≠ U1Depth5.f5)
      u_t20 := by
        simpa [hpt_f2_t20] using
          payload.packet.point_ne_of_label_ne (by decide : U1Depth5.f1 ≠ U1Depth5.f2)
      u_f11 := by
        simpa [hpt_f3_f11] using
          payload.packet.point_ne_of_label_ne (by decide : U1Depth5.f1 ≠ U1Depth5.f3)
      u_f12 := by
        simpa [hpt_f4_f12] using
          payload.packet.point_ne_of_label_ne (by decide : U1Depth5.f1 ≠ U1Depth5.f4)
      u_t21 := by
        simpa [hpt_f5_t21] using
          payload.packet.point_ne_of_label_ne (by decide : U1Depth5.f1 ≠ U1Depth5.f5)
      p_t21 := by
        simpa [hpt_f5_t21] using
          payload.packet.point_ne_of_label_ne (by decide : U1Depth5.p ≠ U1Depth5.f5)
      f11_t21 := by
        simpa [hpt_f3_f11, hpt_f5_t21] using
          payload.packet.point_ne_of_label_ne (by decide : U1Depth5.f3 ≠ U1Depth5.f5)
      f12_t21 := by
        simpa [hpt_f4_f12, hpt_f5_t21] using
          payload.packet.point_ne_of_label_ne (by decide : U1Depth5.f4 ≠ U1Depth5.f5) }

/-- Apply a continuation that expects exactly the record-1 / branch-0 generated
branch fields carried by the payload. -/
theorem false_of_branch_fields
    {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : U1Depth5.Plane}
    {rows : U1Depth5.CriticalSourceRows D baseQ baseT1 baseT2 baseT3 selectedU}
    (payload :
      Record001Branch0Payload (D := D) (baseP := baseP) (baseQ := baseQ)
        (baseT1 := baseT1) (baseT2 := baseT2) (baseT3 := baseT3)
        (selectedU := selectedU) rows)
    (h :
      payload.packet.f3Choice =
          { source := U1Depth5.CriticalSource.f1, slot := 1 } →
        payload.packet.f4Choice =
          { source := U1Depth5.CriticalSource.f1, slot := 2 } →
        payload.packet.rows.pointOfChoice payload.packet.f2Choice =
          ((payload.packet.rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 0) →
        baseP =
          ((payload.packet.rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 3) →
        baseT1 =
          ((payload.packet.rows.rowAt U1Depth5.CriticalSource.q).slotPoint 2) →
        selectedU =
          ((payload.packet.rows.rowAt U1Depth5.CriticalSource.q).slotPoint 0) →
        baseT2 =
          ((payload.packet.rows.rowAt U1Depth5.CriticalSource.q).slotPoint 3) →
        baseP =
          ((payload.packet.rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 1) →
        selectedU =
          ((payload.packet.rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 0) →
        baseQ =
          ((payload.packet.rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 2) →
        baseT3 =
          ((payload.packet.rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 3) →
        dist (payload.packet.point U1Depth5.q) (payload.packet.point U1Depth5.p) =
          dist (payload.packet.point U1Depth5.q) (payload.packet.point U1Depth5.f1) →
        dist (payload.packet.point U1Depth5.t2) (payload.packet.point U1Depth5.f5) =
          dist (payload.packet.point U1Depth5.t2) (payload.packet.point U1Depth5.f2) →
        dist (payload.packet.point U1Depth5.t2) (payload.packet.point U1Depth5.p) =
          dist (payload.packet.point U1Depth5.t2) (payload.packet.point U1Depth5.f2) →
        dist (payload.packet.point U1Depth5.t2) (payload.packet.point U1Depth5.q) =
          dist (payload.packet.point U1Depth5.t2) (payload.packet.point U1Depth5.f2) →
        dist (payload.packet.point U1Depth5.t3) (payload.packet.point U1Depth5.f2) =
          dist (payload.packet.point U1Depth5.t3) (payload.packet.point U1Depth5.f1) →
        dist (payload.packet.point U1Depth5.t3) (payload.packet.point U1Depth5.p) =
          dist (payload.packet.point U1Depth5.t3) (payload.packet.point U1Depth5.f1) →
        dist (payload.packet.point U1Depth5.t3) (payload.packet.point U1Depth5.t1) =
          dist (payload.packet.point U1Depth5.t3) (payload.packet.point U1Depth5.f1) →
        False) :
    False :=
  h payload.hchoice_f3_f1_1 payload.hchoice_f4_f1_2 payload.hocc_f2_f1_0
    payload.hfix_p_f1_3 payload.hfix_t1_q_2 payload.hfix_f1_q_0
    payload.hfix_t2_q_3 payload.hfix_p_t1_1 payload.hfix_f1_t1_0
    payload.hfix_q_t1_2 payload.hfix_t3_t1_3 payload.hrow_12 payload.hrow_20
    payload.hrow_21 payload.hrow_22 payload.hrow_24 payload.hrow_25 payload.hrow_26

/-- Payload consumer using the adapter that replays `q:t2=f1`. -/
theorem false_of_qt2_replay
    {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : U1Depth5.Plane}
    {rows : U1Depth5.CriticalSourceRows D baseQ baseT1 baseT2 baseT3 selectedU}
    (hfixed : U3FixedTriplePacket D baseQ baseP baseT1 baseT2 baseT3)
    (payload :
      Record001Branch0Payload (D := D) (baseP := baseP) (baseQ := baseQ)
        (baseT1 := baseT1) (baseT2 := baseT2) (baseT3 := baseT3)
        (selectedU := selectedU) rows)
    (hslot_f1_f3_f2 :
      dist (payload.packet.point U1Depth5.f1)
          ((payload.packet.rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 1) =
        dist (payload.packet.point U1Depth5.f1)
          ((payload.packet.rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 0))
    (hslot_f1_f4_f2 :
      dist (payload.packet.point U1Depth5.f1)
          ((payload.packet.rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 2) =
        dist (payload.packet.point U1Depth5.f1)
          ((payload.packet.rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 0))
    (hslot_f1_p_f2 :
      dist (payload.packet.point U1Depth5.f1)
          ((payload.packet.rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 3) =
        dist (payload.packet.point U1Depth5.f1)
          ((payload.packet.rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 0))
    (hslot_q_t1_f1 :
      dist (payload.packet.point U1Depth5.q)
          ((payload.packet.rows.rowAt U1Depth5.CriticalSource.q).slotPoint 2) =
        dist (payload.packet.point U1Depth5.q)
          ((payload.packet.rows.rowAt U1Depth5.CriticalSource.q).slotPoint 0))
    (hslot_t1_p_f1 :
      dist (payload.packet.point U1Depth5.t1)
          ((payload.packet.rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 1) =
        dist (payload.packet.point U1Depth5.t1)
          ((payload.packet.rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 0))
    (hslot_t1_q_f1 :
      dist (payload.packet.point U1Depth5.t1)
          ((payload.packet.rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 2) =
        dist (payload.packet.point U1Depth5.t1)
          ((payload.packet.rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 0))
    (hslot_t1_t3_f1 :
      dist (payload.packet.point U1Depth5.t1)
          ((payload.packet.rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 3) =
        dist (payload.packet.point U1Depth5.t1)
          ((payload.packet.rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 0)) :
    False :=
  false_of_branch_fields payload
    (record001_branch0_false_of_qt2_replay hfixed payload.packet
      hslot_f1_f3_f2 hslot_f1_f4_f2 hslot_f1_p_f2 hslot_q_t1_f1
      hslot_t1_p_f1 hslot_t1_q_f1 hslot_t1_t3_f1)

/-- Payload consumer using the adapter that replays `t1:p=f1`. -/
theorem false_of_t1p_replay
    {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : U1Depth5.Plane}
    {rows : U1Depth5.CriticalSourceRows D baseQ baseT1 baseT2 baseT3 selectedU}
    (hfixed : U3FixedTriplePacket D baseQ baseP baseT1 baseT2 baseT3)
    (payload :
      Record001Branch0Payload (D := D) (baseP := baseP) (baseQ := baseQ)
        (baseT1 := baseT1) (baseT2 := baseT2) (baseT3 := baseT3)
        (selectedU := selectedU) rows)
    (hslot_f1_f3_f2 :
      dist (payload.packet.point U1Depth5.f1)
          ((payload.packet.rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 1) =
        dist (payload.packet.point U1Depth5.f1)
          ((payload.packet.rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 0))
    (hslot_f1_f4_f2 :
      dist (payload.packet.point U1Depth5.f1)
          ((payload.packet.rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 2) =
        dist (payload.packet.point U1Depth5.f1)
          ((payload.packet.rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 0))
    (hslot_f1_p_f2 :
      dist (payload.packet.point U1Depth5.f1)
          ((payload.packet.rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 3) =
        dist (payload.packet.point U1Depth5.f1)
          ((payload.packet.rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 0))
    (hslot_q_t1_f1 :
      dist (payload.packet.point U1Depth5.q)
          ((payload.packet.rows.rowAt U1Depth5.CriticalSource.q).slotPoint 2) =
        dist (payload.packet.point U1Depth5.q)
          ((payload.packet.rows.rowAt U1Depth5.CriticalSource.q).slotPoint 0))
    (hslot_q_t2_f1 :
      dist (payload.packet.point U1Depth5.q)
          ((payload.packet.rows.rowAt U1Depth5.CriticalSource.q).slotPoint 3) =
        dist (payload.packet.point U1Depth5.q)
          ((payload.packet.rows.rowAt U1Depth5.CriticalSource.q).slotPoint 0))
    (hslot_t1_q_f1 :
      dist (payload.packet.point U1Depth5.t1)
          ((payload.packet.rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 2) =
        dist (payload.packet.point U1Depth5.t1)
          ((payload.packet.rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 0))
    (hslot_t1_t3_f1 :
      dist (payload.packet.point U1Depth5.t1)
          ((payload.packet.rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 3) =
        dist (payload.packet.point U1Depth5.t1)
          ((payload.packet.rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 0)) :
    False :=
  false_of_branch_fields payload
    (record001_branch0_false_of_t1p_replay hfixed payload.packet
      hslot_f1_f3_f2 hslot_f1_f4_f2 hslot_f1_p_f2 hslot_q_t1_f1
      hslot_q_t2_f1 hslot_t1_q_f1 hslot_t1_t3_f1)

/-- Payload consumer using the adapter that replays `t1:q=f1`. -/
theorem false_of_t1q_replay
    {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : U1Depth5.Plane}
    {rows : U1Depth5.CriticalSourceRows D baseQ baseT1 baseT2 baseT3 selectedU}
    (hfixed : U3FixedTriplePacket D baseQ baseP baseT1 baseT2 baseT3)
    (payload :
      Record001Branch0Payload (D := D) (baseP := baseP) (baseQ := baseQ)
        (baseT1 := baseT1) (baseT2 := baseT2) (baseT3 := baseT3)
        (selectedU := selectedU) rows)
    (hslot_f1_f3_f2 :
      dist (payload.packet.point U1Depth5.f1)
          ((payload.packet.rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 1) =
        dist (payload.packet.point U1Depth5.f1)
          ((payload.packet.rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 0))
    (hslot_f1_f4_f2 :
      dist (payload.packet.point U1Depth5.f1)
          ((payload.packet.rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 2) =
        dist (payload.packet.point U1Depth5.f1)
          ((payload.packet.rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 0))
    (hslot_f1_p_f2 :
      dist (payload.packet.point U1Depth5.f1)
          ((payload.packet.rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 3) =
        dist (payload.packet.point U1Depth5.f1)
          ((payload.packet.rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 0))
    (hslot_q_t1_f1 :
      dist (payload.packet.point U1Depth5.q)
          ((payload.packet.rows.rowAt U1Depth5.CriticalSource.q).slotPoint 2) =
        dist (payload.packet.point U1Depth5.q)
          ((payload.packet.rows.rowAt U1Depth5.CriticalSource.q).slotPoint 0))
    (hslot_q_t2_f1 :
      dist (payload.packet.point U1Depth5.q)
          ((payload.packet.rows.rowAt U1Depth5.CriticalSource.q).slotPoint 3) =
        dist (payload.packet.point U1Depth5.q)
          ((payload.packet.rows.rowAt U1Depth5.CriticalSource.q).slotPoint 0))
    (hslot_t1_p_f1 :
      dist (payload.packet.point U1Depth5.t1)
          ((payload.packet.rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 1) =
        dist (payload.packet.point U1Depth5.t1)
          ((payload.packet.rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 0))
    (hslot_t1_t3_f1 :
      dist (payload.packet.point U1Depth5.t1)
          ((payload.packet.rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 3) =
        dist (payload.packet.point U1Depth5.t1)
          ((payload.packet.rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 0)) :
    False :=
  false_of_branch_fields payload
    (record001_branch0_false_of_t1q_replay hfixed payload.packet
      hslot_f1_f3_f2 hslot_f1_f4_f2 hslot_f1_p_f2 hslot_q_t1_f1
      hslot_q_t2_f1 hslot_t1_p_f1 hslot_t1_t3_f1)

/-- Payload consumer using the adapter that replays `t1:t3=f1`. -/
theorem false_of_t1t3_replay
    {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : U1Depth5.Plane}
    {rows : U1Depth5.CriticalSourceRows D baseQ baseT1 baseT2 baseT3 selectedU}
    (hfixed : U3FixedTriplePacket D baseQ baseP baseT1 baseT2 baseT3)
    (payload :
      Record001Branch0Payload (D := D) (baseP := baseP) (baseQ := baseQ)
        (baseT1 := baseT1) (baseT2 := baseT2) (baseT3 := baseT3)
        (selectedU := selectedU) rows)
    (hslot_f1_f3_f2 :
      dist (payload.packet.point U1Depth5.f1)
          ((payload.packet.rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 1) =
        dist (payload.packet.point U1Depth5.f1)
          ((payload.packet.rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 0))
    (hslot_f1_f4_f2 :
      dist (payload.packet.point U1Depth5.f1)
          ((payload.packet.rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 2) =
        dist (payload.packet.point U1Depth5.f1)
          ((payload.packet.rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 0))
    (hslot_f1_p_f2 :
      dist (payload.packet.point U1Depth5.f1)
          ((payload.packet.rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 3) =
        dist (payload.packet.point U1Depth5.f1)
          ((payload.packet.rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 0))
    (hslot_q_t1_f1 :
      dist (payload.packet.point U1Depth5.q)
          ((payload.packet.rows.rowAt U1Depth5.CriticalSource.q).slotPoint 2) =
        dist (payload.packet.point U1Depth5.q)
          ((payload.packet.rows.rowAt U1Depth5.CriticalSource.q).slotPoint 0))
    (hslot_q_t2_f1 :
      dist (payload.packet.point U1Depth5.q)
          ((payload.packet.rows.rowAt U1Depth5.CriticalSource.q).slotPoint 3) =
        dist (payload.packet.point U1Depth5.q)
          ((payload.packet.rows.rowAt U1Depth5.CriticalSource.q).slotPoint 0))
    (hslot_t1_p_f1 :
      dist (payload.packet.point U1Depth5.t1)
          ((payload.packet.rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 1) =
        dist (payload.packet.point U1Depth5.t1)
          ((payload.packet.rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 0))
    (hslot_t1_q_f1 :
      dist (payload.packet.point U1Depth5.t1)
          ((payload.packet.rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 2) =
        dist (payload.packet.point U1Depth5.t1)
          ((payload.packet.rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 0)) :
    False :=
  false_of_branch_fields payload
    (record001_branch0_false_of_t1t3_replay hfixed payload.packet
      hslot_f1_f3_f2 hslot_f1_f4_f2 hslot_f1_p_f2 hslot_q_t1_f1
      hslot_q_t2_f1 hslot_t1_p_f1 hslot_t1_q_f1)

end Record001Branch0Payload

end U1Depth5SourceUnitGenerated
end Problem97
