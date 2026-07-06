/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.U1Depth5QT3PilotRecord001
import Erdos9796Proof.P97.U1Depth5HSlotRecord001F1ExtraOmit3003
import Erdos9796Proof.P97.U1Depth5HSlotRecord001F1ExtraOmit3004
import Erdos9796Proof.P97.U1Depth5HSlotRecord001F1ExtraOmit3008

/-!
# Record001 branch-0 `f1:t3` omit3 adapter

This module connects the non-circular hard-`f1` omit3 hslot certificates for
the `f1:t3` extra-incidence branch to the record001 branch-0 source-UNIT replay.
It is an adapter for a fixed packet surface, not a producer of the
extra-incidence atom or the remaining non-`f1` slot metrics.
-/

namespace Problem97
namespace U1Depth5SourceUnitGenerated
namespace Record001Branch0Payload

/-- Under the `f1:t3` packet-label extra-incidence atom, the three record001
hard-`f1` slot metrics are supplied by the non-circular omit3 certificates.

This is a branch adapter, not a producer of the extra-incidence atom and not a
producer of the five non-`f1` slot metrics. -/
theorem false_of_f1t3_extra_omit3
    {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : U1Depth5.Plane}
    {rows : U1Depth5.CriticalSourceRows D baseQ baseT1 baseT2 baseT3 selectedU}
    (hfixed : U3FixedTriplePacket D baseQ baseP baseT1 baseT2 baseT3)
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
          ((payload.packet.rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 0))
    (hextra_f1_t3 :
      dist (payload.packet.point U1Depth5.f1) (payload.packet.point U1Depth5.t3) =
        dist (payload.packet.point U1Depth5.f1) (payload.packet.point U1Depth5.f2)) :
    False := by
  have hpt_t1_q_2 : payload.packet.point U1Depth5.t1 =
      ((payload.packet.rows.rowAt U1Depth5.CriticalSource.q).slotPoint 2) := by
    simpa using payload.hfix_t1_q_2
  have hpt_f1_q_0 : payload.packet.point U1Depth5.f1 =
      ((payload.packet.rows.rowAt U1Depth5.CriticalSource.q).slotPoint 0) := by
    simpa using payload.hfix_f1_q_0
  have hpt_t2_q_3 : payload.packet.point U1Depth5.t2 =
      ((payload.packet.rows.rowAt U1Depth5.CriticalSource.q).slotPoint 3) := by
    simpa using payload.hfix_t2_q_3
  have hpt_p_t1_1 : payload.packet.point U1Depth5.p =
      ((payload.packet.rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 1) := by
    simpa using payload.hfix_p_t1_1
  have hpt_f1_t1_0 : payload.packet.point U1Depth5.f1 =
      ((payload.packet.rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 0) := by
    simpa using payload.hfix_f1_t1_0
  have hpt_q_t1_2 : payload.packet.point U1Depth5.q =
      ((payload.packet.rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 2) := by
    simpa using payload.hfix_q_t1_2
  have hpt_t3_t1_3 : payload.packet.point U1Depth5.t3 =
      ((payload.packet.rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 3) := by
    simpa using payload.hfix_t3_t1_3
  have hrow_0 : dist (payload.packet.point U1Depth5.p)
        (payload.packet.point U1Depth5.t1) =
      dist (payload.packet.point U1Depth5.p)
        (payload.packet.point U1Depth5.q) := by
    simpa using hfixed.t1_same_radius
  have hrow_1 : dist (payload.packet.point U1Depth5.p)
        (payload.packet.point U1Depth5.t2) =
      dist (payload.packet.point U1Depth5.p)
        (payload.packet.point U1Depth5.q) := by
    simpa using hfixed.t2_same_radius
  have hrow_2 : dist (payload.packet.point U1Depth5.p)
        (payload.packet.point U1Depth5.t3) =
      dist (payload.packet.point U1Depth5.p)
        (payload.packet.point U1Depth5.q) := by
    simpa using hfixed.t3_same_radius
  have hrow_10 : dist (payload.packet.point U1Depth5.q)
        (payload.packet.point U1Depth5.t1) =
      dist (payload.packet.point U1Depth5.q)
        (payload.packet.point U1Depth5.f1) := by
    exact payload.packet.hrow_of_slot_metric U1Depth5.CriticalSource.q
      hpt_t1_q_2 hpt_f1_q_0 hslot_q_t1_f1
  have hrow_11 : dist (payload.packet.point U1Depth5.q)
        (payload.packet.point U1Depth5.t2) =
      dist (payload.packet.point U1Depth5.q)
        (payload.packet.point U1Depth5.f1) := by
    exact payload.packet.hrow_of_slot_metric U1Depth5.CriticalSource.q
      hpt_t2_q_3 hpt_f1_q_0 hslot_q_t2_f1
  have hrow_13 : dist (payload.packet.point U1Depth5.t1)
        (payload.packet.point U1Depth5.p) =
      dist (payload.packet.point U1Depth5.t1)
        (payload.packet.point U1Depth5.f1) := by
    exact payload.packet.hrow_of_slot_metric U1Depth5.CriticalSource.t1
      hpt_p_t1_1 hpt_f1_t1_0 hslot_t1_p_f1
  have hrow_14 : dist (payload.packet.point U1Depth5.t1)
        (payload.packet.point U1Depth5.q) =
      dist (payload.packet.point U1Depth5.t1)
        (payload.packet.point U1Depth5.f1) := by
    exact payload.packet.hrow_of_slot_metric U1Depth5.CriticalSource.t1
      hpt_q_t1_2 hpt_f1_t1_0 hslot_t1_q_f1
  have hrow_15 : dist (payload.packet.point U1Depth5.t1)
        (payload.packet.point U1Depth5.t3) =
      dist (payload.packet.point U1Depth5.t1)
        (payload.packet.point U1Depth5.f1) := by
    exact payload.packet.hrow_of_slot_metric U1Depth5.CriticalSource.t1
      hpt_t3_t1_3 hpt_f1_t1_0 hslot_t1_t3_f1
  have hrow_4 :
      dist (payload.packet.point U1Depth5.f1)
          (payload.packet.point U1Depth5.f3) =
        dist (payload.packet.point U1Depth5.f1)
          (payload.packet.point U1Depth5.f2) :=
    cert_00004_d478830f0957aa75_hslot_f1_f3_f2_of_row_slot_packet
      payload.packet hrow_0 hrow_1 hrow_2 payload.hrow_12 hrow_10 hrow_11
      hrow_13 hrow_14 hrow_15 payload.hrow_20 payload.hrow_21 payload.hrow_22
      payload.hrow_24 payload.hrow_25 payload.hrow_26 hextra_f1_t3
  have hrow_5 :
      dist (payload.packet.point U1Depth5.f1)
          (payload.packet.point U1Depth5.f4) =
        dist (payload.packet.point U1Depth5.f1)
          (payload.packet.point U1Depth5.f2) :=
    cert_00005_2499aa50ea0ffd0e_hslot_f1_f4_f2_of_row_slot_packet
      payload.packet hrow_0 hrow_1 hrow_2 payload.hrow_12 hrow_10 hrow_11
      hrow_13 hrow_14 hrow_15 payload.hrow_20 payload.hrow_21 payload.hrow_22
      payload.hrow_24 payload.hrow_25 payload.hrow_26 hextra_f1_t3
  have hrow_6 :
      dist (payload.packet.point U1Depth5.f1)
          (payload.packet.point U1Depth5.p) =
        dist (payload.packet.point U1Depth5.f1)
          (payload.packet.point U1Depth5.f2) :=
    cert_00009_0a4caee5e84ab220_hslot_f1_p_f2_of_row_slot_packet
      payload.packet hrow_0 hrow_1 hrow_2 payload.hrow_12 hrow_10 hrow_11
      hrow_13 hrow_14 hrow_15 payload.hrow_20 payload.hrow_21 payload.hrow_22
      payload.hrow_24 payload.hrow_25 payload.hrow_26 hextra_f1_t3
  exact
    cert_00001_f46a07c8af1969fd_false_of_row_slot_packet
      hfixed payload.packet hrow_4 hrow_5 hrow_6 payload.hrow_12 hrow_10
      hrow_11 hrow_13 hrow_14 hrow_15 payload.hrow_20 payload.hrow_21
      payload.hrow_22 payload.hrow_24 payload.hrow_25 payload.hrow_26

end Record001Branch0Payload
end U1Depth5SourceUnitGenerated
end Problem97
