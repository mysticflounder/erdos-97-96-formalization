/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.U1Depth5QT3PilotRecord001
import Erdos9796Proof.P97.U1Depth5SourceUnitQT3Ordinal001Manifest
import Erdos9796Proof.P97.U1Depth5HSlotRecord001F1T2CoreSeedQT2
import Erdos9796Proof.P97.U1Depth5HSlotRecord001F1T2SeedF1PAfterQT2
import Erdos9796Proof.P97.U1Depth5HSlotRecord001F1T2SupportPToF1F3
import Erdos9796Proof.P97.U1Depth5HSlotRecord001F1T2SupportPToF1F4
import Erdos9796Proof.P97.U1Depth5HSlotRecord001F1T2ProductPAReverse
import Erdos9796Proof.P97.U1Depth5HSlotRecord001F1T2ProductPBReverse
import Erdos9796Proof.P97.U1Depth5HSlotRecord001F1T2SeedF1PAfterQT2Manifest
import Erdos9796Proof.P97.U1Depth5HSlotRecord001F1T2SupportPToF1F3Manifest
import Erdos9796Proof.P97.U1Depth5HSlotRecord001F1T2SupportPToF1F4Manifest
import Erdos9796Proof.P97.U1Depth5HSlotRecord001F1T2ProductPAReverseManifest
import Erdos9796Proof.P97.U1Depth5HSlotRecord001F1T2ProductPBReverseManifest
import Erdos9796Proof.P97.U1Depth5Record001Branch0CollisionDirectExtraUnits
import Erdos9796Proof.P97.U1Depth5Record001Branch0PairCollisionPF11
import Erdos9796Proof.P97.U1Depth5Record001Branch0PairCollisionPF12
import Erdos9796Proof.P97.U1Depth5Record001Branch0PairCollisionPT20
import Erdos9796Proof.P97.U1Depth5Record001Branch0PairCollisionT20F11
import Erdos9796Proof.P97.U1Depth5Record001Branch0PairCollisionT20F12
import Erdos9796Proof.P97.U1Record001Cycle5CoreCollisionProductManifest

/-!
# Record001 branch-0 `f1:t2` product-cycle adapter

This module connects the reduced product endpoints for the `f1:t2`
extra-incidence branch to the record001 branch-0 source-UNIT replay.  It is an
adapter for a fixed packet surface, not a producer of the extra-incidence atom
or the remaining non-`f1` slot metrics.
-/

namespace Problem97
namespace U1Depth5SourceUnitGenerated

/-- Hrow-level form of the record001 `f1:t2` product-cycle close.

This theorem is the common algebraic consumer for both blocker-row and
packet-label-centered producers.  It assumes the packet-label hrow facts
directly and uses the banked product-cycle certificates to close the branch. -/
theorem false_of_f1t2_extra_omit3_of_row_slot_packet_hrows
    {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : U1Depth5.Plane}
    (hfixed : U3FixedTriplePacket D baseQ baseP baseT1 baseT2 baseT3)
    (packet :
      U1Depth5.RowSlotLabelPacket D baseP baseQ baseT1 baseT2 baseT3 selectedU)
    (hrow_12 :
      dist (packet.point U1Depth5.q) (packet.point U1Depth5.p) =
        dist (packet.point U1Depth5.q) (packet.point U1Depth5.f1))
    (hrow_10 :
      dist (packet.point U1Depth5.q) (packet.point U1Depth5.t1) =
        dist (packet.point U1Depth5.q) (packet.point U1Depth5.f1))
    (hrow_11 :
      dist (packet.point U1Depth5.q) (packet.point U1Depth5.t2) =
        dist (packet.point U1Depth5.q) (packet.point U1Depth5.f1))
    (hrow_13 :
      dist (packet.point U1Depth5.t1) (packet.point U1Depth5.p) =
        dist (packet.point U1Depth5.t1) (packet.point U1Depth5.f1))
    (hrow_14 :
      dist (packet.point U1Depth5.t1) (packet.point U1Depth5.q) =
        dist (packet.point U1Depth5.t1) (packet.point U1Depth5.f1))
    (hrow_15 :
      dist (packet.point U1Depth5.t1) (packet.point U1Depth5.t3) =
        dist (packet.point U1Depth5.t1) (packet.point U1Depth5.f1))
    (hrow_20 :
      dist (packet.point U1Depth5.t2) (packet.point U1Depth5.f5) =
        dist (packet.point U1Depth5.t2) (packet.point U1Depth5.f2))
    (hrow_21 :
      dist (packet.point U1Depth5.t2) (packet.point U1Depth5.p) =
        dist (packet.point U1Depth5.t2) (packet.point U1Depth5.f2))
    (hrow_22 :
      dist (packet.point U1Depth5.t2) (packet.point U1Depth5.q) =
        dist (packet.point U1Depth5.t2) (packet.point U1Depth5.f2))
    (hrow_24 :
      dist (packet.point U1Depth5.t3) (packet.point U1Depth5.f2) =
        dist (packet.point U1Depth5.t3) (packet.point U1Depth5.f1))
    (hrow_25 :
      dist (packet.point U1Depth5.t3) (packet.point U1Depth5.p) =
        dist (packet.point U1Depth5.t3) (packet.point U1Depth5.f1))
    (hrow_26 :
      dist (packet.point U1Depth5.t3) (packet.point U1Depth5.t1) =
        dist (packet.point U1Depth5.t3) (packet.point U1Depth5.f1))
    (hextra_f1_t2 :
      dist (packet.point U1Depth5.f1) (packet.point U1Depth5.t2) =
        dist (packet.point U1Depth5.f1) (packet.point U1Depth5.f2)) :
    False := by
  have hrow_0 : dist (packet.point U1Depth5.p)
        (packet.point U1Depth5.t1) =
      dist (packet.point U1Depth5.p)
        (packet.point U1Depth5.q) := by
    simpa using hfixed.t1_same_radius
  have hrow_1 : dist (packet.point U1Depth5.p)
        (packet.point U1Depth5.t2) =
      dist (packet.point U1Depth5.p)
        (packet.point U1Depth5.q) := by
    simpa using hfixed.t2_same_radius
  have hrow_2 : dist (packet.point U1Depth5.p)
        (packet.point U1Depth5.t3) =
      dist (packet.point U1Depth5.p)
        (packet.point U1Depth5.q) := by
    simpa using hfixed.t3_same_radius
  have hprod_pa :
      dist (packet.point U1Depth5.f1)
          (packet.point U1Depth5.p) =
        dist (packet.point U1Depth5.f1)
          (packet.point U1Depth5.f2) ∨
      dist (packet.point U1Depth5.f1)
          (packet.point U1Depth5.f3) =
        dist (packet.point U1Depth5.f1)
          (packet.point U1Depth5.f2) :=
    cert_00001_f9db3a3c66ba3ed2_hslot_f1_p_f2_or_hslot_f1_f3_f2_of_row_slot_packet
      packet hrow_0 hrow_1 hrow_2 hrow_12 hrow_10 hrow_11
      hrow_13 hrow_14 hrow_15 hrow_20 hrow_21 hrow_22
      hrow_24 hrow_25 hrow_26 hextra_f1_t2
  have hprod_pb :
      dist (packet.point U1Depth5.f1)
          (packet.point U1Depth5.p) =
        dist (packet.point U1Depth5.f1)
          (packet.point U1Depth5.f2) ∨
      dist (packet.point U1Depth5.f1)
          (packet.point U1Depth5.f4) =
        dist (packet.point U1Depth5.f1)
          (packet.point U1Depth5.f2) :=
    cert_00001_4be28408170103ef_hslot_f1_p_f2_or_hslot_f1_f4_f2_of_row_slot_packet
      packet hrow_0 hrow_1 hrow_2 hrow_12 hrow_10 hrow_11
      hrow_13 hrow_14 hrow_15 hrow_20 hrow_21 hrow_22
      hrow_24 hrow_25 hrow_26 hextra_f1_t2
  have hrow_6 :
      dist (packet.point U1Depth5.f1)
          (packet.point U1Depth5.p) =
        dist (packet.point U1Depth5.f1)
          (packet.point U1Depth5.f2) := by
    by_cases hP :
        dist (packet.point U1Depth5.f1)
            (packet.point U1Depth5.p) =
          dist (packet.point U1Depth5.f1)
            (packet.point U1Depth5.f2)
    · exact hP
    · rcases hprod_pa with hP' | hA
      · exact False.elim (hP hP')
      rcases hprod_pb with hP'' | hB
      · exact False.elim (hP hP'')
      exact
        cert_00001_173424fd500c50ea_hslot_f1_p_f2_of_row_slot_packet
          packet hrow_0 hrow_1 hrow_2 hA hB hrow_12
          hrow_13 hrow_14 hrow_20 hrow_21 hrow_22
          hrow_24 hrow_25 hrow_26 hextra_f1_t2
  have hrow_4 :
      dist (packet.point U1Depth5.f1)
          (packet.point U1Depth5.f3) =
        dist (packet.point U1Depth5.f1)
          (packet.point U1Depth5.f2) :=
    cert_00001_f80a3e310cfe6dbb_hslot_f1_f3_f2_of_row_slot_packet
      packet hrow_0 hrow_1 hrow_2 hrow_6 hrow_12 hrow_11
      hrow_13 hrow_14 hrow_20 hrow_21 hrow_22
      hrow_24 hrow_25 hrow_26 hextra_f1_t2
  have hrow_5 :
      dist (packet.point U1Depth5.f1)
          (packet.point U1Depth5.f4) =
        dist (packet.point U1Depth5.f1)
          (packet.point U1Depth5.f2) :=
    cert_00001_bbb8733e43de2265_hslot_f1_f4_f2_of_row_slot_packet
      packet hrow_0 hrow_1 hrow_2 hrow_6 hrow_12 hrow_11
      hrow_13 hrow_14 hrow_20 hrow_21 hrow_22
      hrow_24 hrow_25 hrow_26 hextra_f1_t2
  exact
    cert_00001_f46a07c8af1969fd_false_of_row_slot_packet
      hfixed packet hrow_4 hrow_5 hrow_6 hrow_12 hrow_10 hrow_11
      hrow_13 hrow_14 hrow_15 hrow_20 hrow_21 hrow_22 hrow_24 hrow_25
      hrow_26

/-- Packet-level form of the record001 `f1:t2` product-cycle close.

This is the same banked `P/A/B` product-cycle contradiction used by the
record001 branch-0 payload adapter, but stated directly for a
`RowSlotLabelPacket` and the concrete source-row placement/hrow facts consumed
by the generated certificates.  In particular, it does not require the
branch-0 payload wrapper or any branch-choice equalities not used by the
underlying product/source-UNIT certificates. -/
theorem false_of_f1t2_extra_omit3_of_row_slot_packet
    {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : U1Depth5.Plane}
    (hfixed : U3FixedTriplePacket D baseQ baseP baseT1 baseT2 baseT3)
    (packet :
      U1Depth5.RowSlotLabelPacket D baseP baseQ baseT1 baseT2 baseT3 selectedU)
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
    (hrow_12 :
      dist (packet.point U1Depth5.q) (packet.point U1Depth5.p) =
        dist (packet.point U1Depth5.q) (packet.point U1Depth5.f1))
    (hrow_20 :
      dist (packet.point U1Depth5.t2) (packet.point U1Depth5.f5) =
        dist (packet.point U1Depth5.t2) (packet.point U1Depth5.f2))
    (hrow_21 :
      dist (packet.point U1Depth5.t2) (packet.point U1Depth5.p) =
        dist (packet.point U1Depth5.t2) (packet.point U1Depth5.f2))
    (hrow_22 :
      dist (packet.point U1Depth5.t2) (packet.point U1Depth5.q) =
        dist (packet.point U1Depth5.t2) (packet.point U1Depth5.f2))
    (hrow_24 :
      dist (packet.point U1Depth5.t3) (packet.point U1Depth5.f2) =
        dist (packet.point U1Depth5.t3) (packet.point U1Depth5.f1))
    (hrow_25 :
      dist (packet.point U1Depth5.t3) (packet.point U1Depth5.p) =
        dist (packet.point U1Depth5.t3) (packet.point U1Depth5.f1))
    (hrow_26 :
      dist (packet.point U1Depth5.t3) (packet.point U1Depth5.t1) =
        dist (packet.point U1Depth5.t3) (packet.point U1Depth5.f1))
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
    (hslot_t1_t3_f1 :
      dist (packet.point U1Depth5.t1)
          ((packet.rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 3) =
        dist (packet.point U1Depth5.t1)
          ((packet.rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 0))
    (hextra_f1_t2 :
      dist (packet.point U1Depth5.f1) (packet.point U1Depth5.t2) =
        dist (packet.point U1Depth5.f1) (packet.point U1Depth5.f2)) :
    False := by
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
  have hrow_0 : dist (packet.point U1Depth5.p)
        (packet.point U1Depth5.t1) =
      dist (packet.point U1Depth5.p)
        (packet.point U1Depth5.q) := by
    simpa using hfixed.t1_same_radius
  have hrow_1 : dist (packet.point U1Depth5.p)
        (packet.point U1Depth5.t2) =
      dist (packet.point U1Depth5.p)
        (packet.point U1Depth5.q) := by
    simpa using hfixed.t2_same_radius
  have hrow_2 : dist (packet.point U1Depth5.p)
        (packet.point U1Depth5.t3) =
      dist (packet.point U1Depth5.p)
        (packet.point U1Depth5.q) := by
    simpa using hfixed.t3_same_radius
  have hqt :
      U1Depth5.Record001QTFacingTransportRows
        (packet.point U1Depth5.p) (packet.point U1Depth5.q)
        (packet.point U1Depth5.t1) (packet.point U1Depth5.t2)
        (packet.point U1Depth5.t3) (packet.point U1Depth5.f1) := by
    exact
      packet.record001QTFacingTransportRows
        hpt_t1_q_2 hpt_f1_q_0 hpt_t2_q_3 hpt_p_t1_1 hpt_f1_t1_0
        hpt_q_t1_2 hpt_t3_t1_3 hslot_q_t1_f1 hslot_q_t2_f1
        hslot_t1_p_f1 hslot_t1_q_f1 hslot_t1_t3_f1
  have hprod_pa :
      dist (packet.point U1Depth5.f1)
          (packet.point U1Depth5.p) =
        dist (packet.point U1Depth5.f1)
          (packet.point U1Depth5.f2) ∨
      dist (packet.point U1Depth5.f1)
          (packet.point U1Depth5.f3) =
        dist (packet.point U1Depth5.f1)
          (packet.point U1Depth5.f2) :=
    cert_00001_f9db3a3c66ba3ed2_hslot_f1_p_f2_or_hslot_f1_f3_f2_of_row_slot_packet
      packet hrow_0 hrow_1 hrow_2 hrow_12 hqt.hrow_q_t1_f1 hqt.hrow_q_t2_f1
      hqt.hrow_t1_p_f1 hqt.hrow_t1_q_f1 hqt.hrow_t1_t3_f1 hrow_20 hrow_21 hrow_22
      hrow_24 hrow_25 hrow_26 hextra_f1_t2
  have hprod_pb :
      dist (packet.point U1Depth5.f1)
          (packet.point U1Depth5.p) =
        dist (packet.point U1Depth5.f1)
          (packet.point U1Depth5.f2) ∨
      dist (packet.point U1Depth5.f1)
          (packet.point U1Depth5.f4) =
        dist (packet.point U1Depth5.f1)
          (packet.point U1Depth5.f2) :=
    cert_00001_4be28408170103ef_hslot_f1_p_f2_or_hslot_f1_f4_f2_of_row_slot_packet
      packet hrow_0 hrow_1 hrow_2 hrow_12 hqt.hrow_q_t1_f1 hqt.hrow_q_t2_f1
      hqt.hrow_t1_p_f1 hqt.hrow_t1_q_f1 hqt.hrow_t1_t3_f1 hrow_20 hrow_21 hrow_22
      hrow_24 hrow_25 hrow_26 hextra_f1_t2
  have hrow_6 :
      dist (packet.point U1Depth5.f1)
          (packet.point U1Depth5.p) =
        dist (packet.point U1Depth5.f1)
          (packet.point U1Depth5.f2) := by
    by_cases hP :
        dist (packet.point U1Depth5.f1)
            (packet.point U1Depth5.p) =
          dist (packet.point U1Depth5.f1)
            (packet.point U1Depth5.f2)
    · exact hP
    · rcases hprod_pa with hP' | hA
      · exact False.elim (hP hP')
      rcases hprod_pb with hP'' | hB
      · exact False.elim (hP hP'')
      exact
        cert_00001_173424fd500c50ea_hslot_f1_p_f2_of_row_slot_packet
          packet hrow_0 hrow_1 hrow_2 hA hB hrow_12
          hqt.hrow_t1_p_f1 hqt.hrow_t1_q_f1 hrow_20 hrow_21 hrow_22
          hrow_24 hrow_25 hrow_26 hextra_f1_t2
  have hrow_4 :
      dist (packet.point U1Depth5.f1)
          (packet.point U1Depth5.f3) =
        dist (packet.point U1Depth5.f1)
          (packet.point U1Depth5.f2) :=
    cert_00001_f80a3e310cfe6dbb_hslot_f1_f3_f2_of_row_slot_packet
      packet hrow_0 hrow_1 hrow_2 hrow_6 hrow_12 hqt.hrow_q_t2_f1
      hqt.hrow_t1_p_f1 hqt.hrow_t1_q_f1 hrow_20 hrow_21 hrow_22
      hrow_24 hrow_25 hrow_26 hextra_f1_t2
  have hrow_5 :
      dist (packet.point U1Depth5.f1)
          (packet.point U1Depth5.f4) =
        dist (packet.point U1Depth5.f1)
          (packet.point U1Depth5.f2) :=
    cert_00001_bbb8733e43de2265_hslot_f1_f4_f2_of_row_slot_packet
      packet hrow_0 hrow_1 hrow_2 hrow_6 hrow_12 hqt.hrow_q_t2_f1
      hqt.hrow_t1_p_f1 hqt.hrow_t1_q_f1 hrow_20 hrow_21 hrow_22
      hrow_24 hrow_25 hrow_26 hextra_f1_t2
  exact
    cert_00001_f46a07c8af1969fd_false_of_row_slot_packet
      hfixed packet hrow_4 hrow_5 hrow_6 hrow_12
      hqt.hrow_q_t1_f1 hqt.hrow_q_t2_f1 hqt.hrow_t1_p_f1
      hqt.hrow_t1_q_f1 hqt.hrow_t1_t3_f1 hrow_20 hrow_21 hrow_22 hrow_24 hrow_25
      hrow_26

/-- Packet-level `f1:t2` close using packet-label-centered K4 rows for the
five all-eight hrows that previously came from blocker-row slot metrics.

The finite manifest still supplies the centered slot placements explicitly.
This theorem does not construct a row-slot packet or prove record001 branch
placement; it only connects the centered K4 row surface to the banked packet
consumer. -/
theorem false_of_f1t2_extra_omit3_of_packet_label_centered_rows
    {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : U1Depth5.Plane}
    (hfixed : U3FixedTriplePacket D baseQ baseP baseT1 baseT2 baseT3)
    (packet :
      U1Depth5.RowSlotLabelPacket D baseP baseQ baseT1 baseT2 baseT3 selectedU)
    (centered :
      U1Depth5.Record001QTTwoCenteredRows
        D baseP baseQ baseT1 baseT2 baseT3 selectedU)
    (hrow_12 :
      dist (packet.point U1Depth5.q) (packet.point U1Depth5.p) =
        dist (packet.point U1Depth5.q) (packet.point U1Depth5.f1))
    (hrow_20 :
      dist (packet.point U1Depth5.t2) (packet.point U1Depth5.f5) =
        dist (packet.point U1Depth5.t2) (packet.point U1Depth5.f2))
    (hrow_21 :
      dist (packet.point U1Depth5.t2) (packet.point U1Depth5.p) =
        dist (packet.point U1Depth5.t2) (packet.point U1Depth5.f2))
    (hrow_22 :
      dist (packet.point U1Depth5.t2) (packet.point U1Depth5.q) =
        dist (packet.point U1Depth5.t2) (packet.point U1Depth5.f2))
    (hrow_24 :
      dist (packet.point U1Depth5.t3) (packet.point U1Depth5.f2) =
        dist (packet.point U1Depth5.t3) (packet.point U1Depth5.f1))
    (hrow_25 :
      dist (packet.point U1Depth5.t3) (packet.point U1Depth5.p) =
        dist (packet.point U1Depth5.t3) (packet.point U1Depth5.f1))
    (hrow_26 :
      dist (packet.point U1Depth5.t3) (packet.point U1Depth5.t1) =
        dist (packet.point U1Depth5.t3) (packet.point U1Depth5.f1))
    (hextra_f1_t2 :
      dist (packet.point U1Depth5.f1) (packet.point U1Depth5.t2) =
        dist (packet.point U1Depth5.f1) (packet.point U1Depth5.f2)) :
    False := by
  let hqt :
      U1Depth5.Record001QTFacingTransportRows
        baseP baseQ baseT1 baseT2 baseT3 selectedU :=
    U1Depth5.PacketLabelCenteredRows.record001QTFacingTransportRows_of_twoCenteredRows
      centered.qRow centered.t1Row centered.hpt_t1_q_2 centered.hpt_f1_q_0
      centered.hpt_t2_q_3 centered.hpt_p_t1_1 centered.hpt_f1_t1_0
      centered.hpt_q_t1_2 centered.hpt_t3_t1_3
  have hrow_10 : dist (packet.point U1Depth5.q)
        (packet.point U1Depth5.t1) =
      dist (packet.point U1Depth5.q)
        (packet.point U1Depth5.f1) := by
    simpa [hqt] using hqt.hrow_q_t1_f1
  have hrow_11 : dist (packet.point U1Depth5.q)
        (packet.point U1Depth5.t2) =
      dist (packet.point U1Depth5.q)
        (packet.point U1Depth5.f1) := by
    simpa [hqt] using hqt.hrow_q_t2_f1
  have hrow_13 : dist (packet.point U1Depth5.t1)
        (packet.point U1Depth5.p) =
      dist (packet.point U1Depth5.t1)
        (packet.point U1Depth5.f1) := by
    simpa [hqt] using hqt.hrow_t1_p_f1
  have hrow_14 : dist (packet.point U1Depth5.t1)
        (packet.point U1Depth5.q) =
      dist (packet.point U1Depth5.t1)
        (packet.point U1Depth5.f1) := by
    simpa [hqt] using hqt.hrow_t1_q_f1
  have hrow_15 : dist (packet.point U1Depth5.t1)
        (packet.point U1Depth5.t3) =
      dist (packet.point U1Depth5.t1)
        (packet.point U1Depth5.f1) := by
    simpa [hqt] using hqt.hrow_t1_t3_f1
  exact
    false_of_f1t2_extra_omit3_of_row_slot_packet_hrows
      hfixed packet hrow_12 hrow_10 hrow_11 hrow_13 hrow_14 hrow_15
      hrow_20 hrow_21 hrow_22 hrow_24 hrow_25 hrow_26 hextra_f1_t2

open U1Depth5SourceUnitManifestGenerated in
/-- Manifest-label close for record001 using packet-label-centered K4 rows.

This is the same source-UNIT record001 certificate replayed on
`ManifestLabelPacket`, so it no longer requires a `RowSlotLabelPacket`.  The
remaining finite data are the centered slot placements that produce the
generated packet-label hrow equalities. -/
theorem false_of_record001_manifest_label_centered_rows
    {D : CounterexampleData}
    (packet : U1Depth5.ManifestLabelPacket D)
    (hfixed :
      U3FixedTriplePacket D packet.baseQ packet.baseP packet.baseT1
        packet.baseT2 packet.baseT3)
    (centered :
      U1Depth5.PacketLabelCenteredRows D packet.baseQ packet.baseT1
        packet.baseT2 packet.baseT3 packet.selectedU)
    (hfix_f1_q_0 : packet.selectedU = centered.qRow.slotPoint 0)
    (hfix_p_q_1 : packet.baseP = centered.qRow.slotPoint 1)
    (hfix_t1_q_2 : packet.baseT1 = centered.qRow.slotPoint 2)
    (hfix_t2_q_3 : packet.baseT2 = centered.qRow.slotPoint 3)
    (hfix_f1_t1_0 : packet.selectedU = centered.t1Row.slotPoint 0)
    (hfix_p_t1_1 : packet.baseP = centered.t1Row.slotPoint 1)
    (hfix_q_t1_2 : packet.baseQ = centered.t1Row.slotPoint 2)
    (hfix_t3_t1_3 : packet.baseT3 = centered.t1Row.slotPoint 3)
    (hfix_f2_t2_0 : packet.f2Point = centered.t2Row.slotPoint 0)
    (hfix_f5_t2_1 : packet.f5Point = centered.t2Row.slotPoint 1)
    (hfix_p_t2_2 : packet.baseP = centered.t2Row.slotPoint 2)
    (hfix_q_t2_3 : packet.baseQ = centered.t2Row.slotPoint 3)
    (hfix_f1_t3_0 : packet.selectedU = centered.t3Row.slotPoint 0)
    (hfix_f2_t3_1 : packet.f2Point = centered.t3Row.slotPoint 1)
    (hfix_p_t3_2 : packet.baseP = centered.t3Row.slotPoint 2)
    (hfix_t1_t3_3 : packet.baseT1 = centered.t3Row.slotPoint 3)
    (hfix_f2_f1_0 : packet.f2Point = centered.uRow.slotPoint 0)
    (hfix_f3_f1_1 : packet.f3Point = centered.uRow.slotPoint 1)
    (hfix_f4_f1_2 : packet.f4Point = centered.uRow.slotPoint 2)
    (hfix_p_f1_3 : packet.baseP = centered.uRow.slotPoint 3) :
    False := by
  have hrow_4 :
      dist (packet.point U1Depth5.f1)
          (packet.point U1Depth5.f3) =
        dist (packet.point U1Depth5.f1)
          (packet.point U1Depth5.f2) := by
    simpa using
      U1Depth5.PacketLabelCenteredRows.hrow_f1_f3_f2 centered
        hfix_f3_f1_1 hfix_f2_f1_0
  have hrow_5 :
      dist (packet.point U1Depth5.f1)
          (packet.point U1Depth5.f4) =
        dist (packet.point U1Depth5.f1)
          (packet.point U1Depth5.f2) := by
    simpa using
      U1Depth5.PacketLabelCenteredRows.hrow_f1_f4_f2 centered
        hfix_f4_f1_2 hfix_f2_f1_0
  have hrow_6 :
      dist (packet.point U1Depth5.f1)
          (packet.point U1Depth5.p) =
        dist (packet.point U1Depth5.f1)
          (packet.point U1Depth5.f2) := by
    simpa using
      U1Depth5.PacketLabelCenteredRows.hrow_f1_p_f2 centered
        hfix_p_f1_3 hfix_f2_f1_0
  have hrow_12 :
      dist (packet.point U1Depth5.q) (packet.point U1Depth5.p) =
        dist (packet.point U1Depth5.q) (packet.point U1Depth5.f1) := by
    simpa using
      U1Depth5.PacketLabelCenteredRows.hrow_q_p_f1 centered
        hfix_p_q_1 hfix_f1_q_0
  have hrow_13 :
      dist (packet.point U1Depth5.q) (packet.point U1Depth5.t1) =
        dist (packet.point U1Depth5.q) (packet.point U1Depth5.f1) := by
    simpa using
      U1Depth5.PacketLabelCenteredRows.hrow_q_t1_f1 centered
        hfix_t1_q_2 hfix_f1_q_0
  have hrow_14 :
      dist (packet.point U1Depth5.q) (packet.point U1Depth5.t2) =
        dist (packet.point U1Depth5.q) (packet.point U1Depth5.f1) := by
    simpa using
      U1Depth5.PacketLabelCenteredRows.hrow_q_t2_f1 centered
        hfix_t2_q_3 hfix_f1_q_0
  have hrow_16 :
      dist (packet.point U1Depth5.t1) (packet.point U1Depth5.p) =
        dist (packet.point U1Depth5.t1) (packet.point U1Depth5.f1) := by
    simpa using
      U1Depth5.PacketLabelCenteredRows.hrow_t1_p_f1 centered
        hfix_p_t1_1 hfix_f1_t1_0
  have hrow_17 :
      dist (packet.point U1Depth5.t1) (packet.point U1Depth5.q) =
        dist (packet.point U1Depth5.t1) (packet.point U1Depth5.f1) := by
    simpa using
      U1Depth5.PacketLabelCenteredRows.hrow_t1_q_f1 centered
        hfix_q_t1_2 hfix_f1_t1_0
  have hrow_18 :
      dist (packet.point U1Depth5.t1) (packet.point U1Depth5.t3) =
        dist (packet.point U1Depth5.t1) (packet.point U1Depth5.f1) := by
    simpa using
      U1Depth5.PacketLabelCenteredRows.hrow_t1_t3_f1 centered
        hfix_t3_t1_3 hfix_f1_t1_0
  have hrow_20 :
      dist (packet.point U1Depth5.t2) (packet.point U1Depth5.f5) =
        dist (packet.point U1Depth5.t2) (packet.point U1Depth5.f2) := by
    simpa using
      U1Depth5.PacketLabelCenteredRows.hrow_t2_f5_f2 centered
        hfix_f5_t2_1 hfix_f2_t2_0
  have hrow_21 :
      dist (packet.point U1Depth5.t2) (packet.point U1Depth5.p) =
        dist (packet.point U1Depth5.t2) (packet.point U1Depth5.f2) := by
    simpa using
      U1Depth5.PacketLabelCenteredRows.hrow_t2_p_f2 centered
        hfix_p_t2_2 hfix_f2_t2_0
  have hrow_22 :
      dist (packet.point U1Depth5.t2) (packet.point U1Depth5.q) =
        dist (packet.point U1Depth5.t2) (packet.point U1Depth5.f2) := by
    simpa using
      U1Depth5.PacketLabelCenteredRows.hrow_t2_q_f2 centered
        hfix_q_t2_3 hfix_f2_t2_0
  have hrow_24 :
      dist (packet.point U1Depth5.t3) (packet.point U1Depth5.f2) =
        dist (packet.point U1Depth5.t3) (packet.point U1Depth5.f1) := by
    simpa using
      U1Depth5.PacketLabelCenteredRows.hrow_t3_f2_f1 centered
        hfix_f2_t3_1 hfix_f1_t3_0
  have hrow_25 :
      dist (packet.point U1Depth5.t3) (packet.point U1Depth5.p) =
        dist (packet.point U1Depth5.t3) (packet.point U1Depth5.f1) := by
    simpa using
      U1Depth5.PacketLabelCenteredRows.hrow_t3_p_f1 centered
        hfix_p_t3_2 hfix_f1_t3_0
  have hrow_26 :
      dist (packet.point U1Depth5.t3) (packet.point U1Depth5.t1) =
        dist (packet.point U1Depth5.t3) (packet.point U1Depth5.f1) := by
    simpa using
      U1Depth5.PacketLabelCenteredRows.hrow_t3_t1_f1 centered
        hfix_t1_t3_3 hfix_f1_t3_0
  exact
    cert_00001_f46a07c8af1969fd_false_of_manifest_label_packet
      packet hfixed hrow_4 hrow_5 hrow_6 hrow_12 hrow_13 hrow_14
      hrow_16 hrow_17 hrow_18 hrow_20 hrow_21 hrow_22 hrow_24 hrow_25
      hrow_26

/-- Centered-slot specialization of the manifest-label record001 close.

This is the proof-facing record001 branch-0 surface for the manifest-label
lane.  It builds the `ManifestLabelPacket` internally from the centered row
slots
`f2 = t2Row[0]`, `f3 = uRow[1]`, `f4 = uRow[2]`, and `f5 = t2Row[1]`.
The remaining hypotheses are exactly the finite centered placement data and
the ten-label pairwise branch needed for packet injectivity. -/
theorem false_of_record001_manifest_label_centered_slots
    {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : U1Depth5.Plane}
    (hfixed : U3FixedTriplePacket D baseQ baseP baseT1 baseT2 baseT3)
    (selectedU_mem : selectedU ∈ D.A)
    (centered :
      U1Depth5.PacketLabelCenteredRows D baseQ baseT1 baseT2 baseT3 selectedU)
    (hlabels :
      List.Pairwise (fun x y : U1Depth5.Plane => x ≠ y)
        [baseP, baseQ, baseT1, baseT2, baseT3, selectedU,
          centered.t2Row.slotPoint 0, centered.uRow.slotPoint 1,
          centered.uRow.slotPoint 2, centered.t2Row.slotPoint 1])
    (hfix_f1_q_0 : selectedU = centered.qRow.slotPoint 0)
    (hfix_p_q_1 : baseP = centered.qRow.slotPoint 1)
    (hfix_t1_q_2 : baseT1 = centered.qRow.slotPoint 2)
    (hfix_t2_q_3 : baseT2 = centered.qRow.slotPoint 3)
    (hfix_f1_t1_0 : selectedU = centered.t1Row.slotPoint 0)
    (hfix_p_t1_1 : baseP = centered.t1Row.slotPoint 1)
    (hfix_q_t1_2 : baseQ = centered.t1Row.slotPoint 2)
    (hfix_t3_t1_3 : baseT3 = centered.t1Row.slotPoint 3)
    (hfix_p_t2_2 : baseP = centered.t2Row.slotPoint 2)
    (hfix_q_t2_3 : baseQ = centered.t2Row.slotPoint 3)
    (hfix_f1_t3_0 : selectedU = centered.t3Row.slotPoint 0)
    (hfix_f2_t3_1 :
      centered.t2Row.slotPoint 0 = centered.t3Row.slotPoint 1)
    (hfix_p_t3_2 : baseP = centered.t3Row.slotPoint 2)
    (hfix_t1_t3_3 : baseT1 = centered.t3Row.slotPoint 3)
    (hfix_f2_f1_0 :
      centered.t2Row.slotPoint 0 = centered.uRow.slotPoint 0)
    (hfix_p_f1_3 : baseP = centered.uRow.slotPoint 3) :
    False := by
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
      f2Point := centered.t2Row.slotPoint 0
      f3Point := centered.uRow.slotPoint 1
      f4Point := centered.uRow.slotPoint 2
      f5Point := centered.t2Row.slotPoint 1
      baseP_mem := hfixed.p_mem
      baseQ_mem := hfixed.q_mem
      baseT1_mem := baseT1_mem
      baseT2_mem := baseT2_mem
      baseT3_mem := baseT3_mem
      selectedU_mem := selectedU_mem
      f2_mem := centered.t2Row.slotPoint_mem 0
      f3_mem := centered.uRow.slotPoint_mem 1
      f4_mem := centered.uRow.slotPoint_mem 2
      f5_mem := centered.t2Row.slotPoint_mem 1
      point_injective := by
        exact U1Depth5.pointOf_injective_of_pairwise hlabels }
  exact
    false_of_record001_manifest_label_centered_rows
      packet
      (by simpa [packet] using hfixed)
      (by simpa [packet] using centered)
      (by simpa [packet] using hfix_f1_q_0)
      (by simpa [packet] using hfix_p_q_1)
      (by simpa [packet] using hfix_t1_q_2)
      (by simpa [packet] using hfix_t2_q_3)
      (by simpa [packet] using hfix_f1_t1_0)
      (by simpa [packet] using hfix_p_t1_1)
      (by simpa [packet] using hfix_q_t1_2)
      (by simpa [packet] using hfix_t3_t1_3)
      (by simp [packet])
      (by simp [packet])
      (by simpa [packet] using hfix_p_t2_2)
      (by simpa [packet] using hfix_q_t2_3)
      (by simpa [packet] using hfix_f1_t3_0)
      (by simpa [packet] using hfix_f2_t3_1)
      (by simpa [packet] using hfix_p_t3_2)
      (by simpa [packet] using hfix_t1_t3_3)
      (by simpa [packet] using hfix_f2_f1_0)
      (by simp [packet])
      (by simp [packet])
      (by simpa [packet] using hfix_p_f1_3)

/-- Direct hrow form of the manifest-label record001 close.

This is the same branch-0 certificate consumer as
`false_of_record001_manifest_label_centered_slots`, but it bypasses centered
rows entirely: the producer owes the ten-label packet data and the fifteen
metric hrow equalities consumed by the manifest certificate. -/
theorem false_of_record001_manifest_label_hrows
    {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU
      f2Point f3Point f4Point f5Point : U1Depth5.Plane}
    (hfixed : U3FixedTriplePacket D baseQ baseP baseT1 baseT2 baseT3)
    (selectedU_mem : selectedU ∈ D.A)
    (f2_mem : f2Point ∈ D.A)
    (f3_mem : f3Point ∈ D.A)
    (f4_mem : f4Point ∈ D.A)
    (f5_mem : f5Point ∈ D.A)
    (hlabels :
      List.Pairwise (fun x y : U1Depth5.Plane => x ≠ y)
        [baseP, baseQ, baseT1, baseT2, baseT3, selectedU,
          f2Point, f3Point, f4Point, f5Point])
    (hrow_q_p_f1 : dist baseQ baseP = dist baseQ selectedU)
    (hqt :
      U1Depth5.Record001QTFacingTransportRows
        baseP baseQ baseT1 baseT2 baseT3 selectedU)
    (hrow_t2_f5_f2 : dist baseT2 f5Point = dist baseT2 f2Point)
    (hrow_t2_p_f2 : dist baseT2 baseP = dist baseT2 f2Point)
    (hrow_t2_q_f2 : dist baseT2 baseQ = dist baseT2 f2Point)
    (hrow_t3_f2_f1 : dist baseT3 f2Point = dist baseT3 selectedU)
    (hrow_t3_p_f1 : dist baseT3 baseP = dist baseT3 selectedU)
    (hrow_t3_t1_f1 : dist baseT3 baseT1 = dist baseT3 selectedU)
    (hrow_f1_f3_f2 : dist selectedU f3Point = dist selectedU f2Point)
    (hrow_f1_f4_f2 : dist selectedU f4Point = dist selectedU f2Point)
    (hrow_f1_p_f2 : dist selectedU baseP = dist selectedU f2Point) :
    False := by
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
      f2Point := f2Point
      f3Point := f3Point
      f4Point := f4Point
      f5Point := f5Point
      baseP_mem := hfixed.p_mem
      baseQ_mem := hfixed.q_mem
      baseT1_mem := baseT1_mem
      baseT2_mem := baseT2_mem
      baseT3_mem := baseT3_mem
      selectedU_mem := selectedU_mem
      f2_mem := f2_mem
      f3_mem := f3_mem
      f4_mem := f4_mem
      f5_mem := f5_mem
      point_injective := by
        exact U1Depth5.pointOf_injective_of_pairwise hlabels }
  exact
    U1Depth5SourceUnitManifestGenerated.cert_00001_f46a07c8af1969fd_false_of_manifest_label_packet
      packet
      (by simpa [packet] using hfixed)
      (by simpa [packet] using hrow_f1_f3_f2)
      (by simpa [packet] using hrow_f1_f4_f2)
      (by simpa [packet] using hrow_f1_p_f2)
      (by simpa [packet] using hrow_q_p_f1)
      (by simpa [packet] using hqt.hrow_q_t1_f1)
      (by simpa [packet] using hqt.hrow_q_t2_f1)
      (by simpa [packet] using hqt.hrow_t1_p_f1)
      (by simpa [packet] using hqt.hrow_t1_q_f1)
      (by simpa [packet] using hqt.hrow_t1_t3_f1)
      (by simpa [packet] using hrow_t2_f5_f2)
      (by simpa [packet] using hrow_t2_p_f2)
      (by simpa [packet] using hrow_t2_q_f2)
      (by simpa [packet] using hrow_t3_f2_f1)
      (by simpa [packet] using hrow_t3_p_f1)
      (by simpa [packet] using hrow_t3_t1_f1)

open U1Depth5SourceUnitManifestGenerated in
/-- Manifest-label hrow-level form of the record001 `f1:t2` collision-product
close.

The checked product target is
`pairDistance(p,t3) * pairDistance(p,f1) * pairDistance(q,t3)`.  Compared with
the older product-cycle close below, this terminal certificate no longer asks
for the `t2:f5=f2` or `t3:f2=f1` packet-label hrows; the three `p`-centered
hrows are supplied by the fixed triple. -/
theorem false_of_f1t2_collision_product_of_manifest_label_packet_hrows
    {D : CounterexampleData}
    (packet : U1Depth5.ManifestLabelPacket D)
    (hfixed :
      U3FixedTriplePacket D packet.baseQ packet.baseP packet.baseT1
        packet.baseT2 packet.baseT3)
    (hrow_q_p_f1 :
      dist (packet.point U1Depth5.q) (packet.point U1Depth5.p) =
        dist (packet.point U1Depth5.q) (packet.point U1Depth5.f1))
    (hqt :
      U1Depth5.Record001QTFacingTransportRows
        (packet.point U1Depth5.p) (packet.point U1Depth5.q)
        (packet.point U1Depth5.t1) (packet.point U1Depth5.t2)
        (packet.point U1Depth5.t3) (packet.point U1Depth5.f1))
    (hrow_t2_p_f2 :
      dist (packet.point U1Depth5.t2) (packet.point U1Depth5.p) =
        dist (packet.point U1Depth5.t2) (packet.point U1Depth5.f2))
    (hrow_t2_q_f2 :
      dist (packet.point U1Depth5.t2) (packet.point U1Depth5.q) =
        dist (packet.point U1Depth5.t2) (packet.point U1Depth5.f2))
    (hrow_t3_p_f1 :
      dist (packet.point U1Depth5.t3) (packet.point U1Depth5.p) =
        dist (packet.point U1Depth5.t3) (packet.point U1Depth5.f1))
    (hrow_t3_t1_f1 :
      dist (packet.point U1Depth5.t3) (packet.point U1Depth5.t1) =
        dist (packet.point U1Depth5.t3) (packet.point U1Depth5.f1))
    (hextra_f1_t2 :
      dist (packet.point U1Depth5.f1) (packet.point U1Depth5.t2) =
        dist (packet.point U1Depth5.f1) (packet.point U1Depth5.f2)) :
    False := by
  exact
    cert_00001_3ee64424c9eb2360_false_of_manifest_label_packet
      packet
      (by simpa [U1Depth5.ManifestLabelPacket.point] using hfixed.t1_same_radius)
      (by simpa [U1Depth5.ManifestLabelPacket.point] using hfixed.t2_same_radius)
      (by simpa [U1Depth5.ManifestLabelPacket.point] using hfixed.t3_same_radius)
      hrow_q_p_f1 hqt.hrow_q_t1_f1 hqt.hrow_q_t2_f1
      hqt.hrow_t1_p_f1 hqt.hrow_t1_q_f1 hqt.hrow_t1_t3_f1
      hrow_t2_p_f2 hrow_t2_q_f2 hrow_t3_p_f1
      hrow_t3_t1_f1 hextra_f1_t2

/-- Record001 branch-0 row-slot-choice form of the `f1:t2`
collision-product close.

The four produced labels are fixed to the branch-0 choices
`f2=t2[0]`, `f3=f1[1]`, `f4=f1[2]`, and `f5=t2[1]`.  Compared with the older
product-cycle branch below, this certificate does not ask for the two B/E rows
or the three hard `f1` hrows; the fixed triple supplies the three `p`-centered
hrows. -/
theorem false_of_f1t2_collision_product_of_branch0_choices
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
    (hrow_q_p_f1 : dist baseQ baseP = dist baseQ selectedU)
    (hqt :
      U1Depth5.Record001QTFacingTransportRows
        baseP baseQ baseT1 baseT2 baseT3 selectedU)
    (hrow_t2_p_f2 :
      dist baseT2 baseP =
        dist baseT2
          (rows.pointOfChoice
            { source := U1Depth5.CriticalSource.t2, slot := 0 }))
    (hrow_t2_q_f2 :
      dist baseT2 baseQ =
        dist baseT2
          (rows.pointOfChoice
            { source := U1Depth5.CriticalSource.t2, slot := 0 }))
    (hrow_t3_p_f1 : dist baseT3 baseP = dist baseT3 selectedU)
    (hrow_t3_t1_f1 : dist baseT3 baseT1 = dist baseT3 selectedU)
    (hextra_f1_t2 :
      dist selectedU baseT2 =
        dist selectedU
          (rows.pointOfChoice
            { source := U1Depth5.CriticalSource.t2, slot := 0 })) :
    False := by
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
      f2Point :=
        rows.pointOfChoice
          { source := U1Depth5.CriticalSource.t2, slot := 0 }
      f3Point :=
        rows.pointOfChoice
          { source := U1Depth5.CriticalSource.f1, slot := 1 }
      f4Point :=
        rows.pointOfChoice
          { source := U1Depth5.CriticalSource.f1, slot := 2 }
      f5Point :=
        rows.pointOfChoice
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
  exact
    false_of_f1t2_collision_product_of_manifest_label_packet_hrows
      packet
      (by simpa [packet] using hfixed)
      (by simpa [packet] using hrow_q_p_f1)
      (by simpa [packet] using hqt)
      (by simpa [packet] using hrow_t2_p_f2)
      (by simpa [packet] using hrow_t2_q_f2)
      (by simpa [packet] using hrow_t3_p_f1)
      (by simpa [packet] using hrow_t3_t1_f1)
      (by simpa [packet] using hextra_f1_t2)

open U1Depth5SourceUnitManifestGenerated in
/-- Manifest-label hrow-level form of the record001 `f1:t2` product-cycle
close.

The hypotheses are the non-hard packet-label hrows plus the `f1:t2`
extra-incidence atom.  The three hard `f1` hrows are produced by the five
generated manifest-label product-cycle certificates before replaying the
record001 q:t3 source-UNIT close. -/
theorem false_of_f1t2_extra_omit3_of_manifest_label_packet_hrows
    {D : CounterexampleData}
    (packet : U1Depth5.ManifestLabelPacket D)
    (hfixed :
      U3FixedTriplePacket D packet.baseQ packet.baseP packet.baseT1
        packet.baseT2 packet.baseT3)
    (hrow_q_p_f1 :
      dist (packet.point U1Depth5.q) (packet.point U1Depth5.p) =
        dist (packet.point U1Depth5.q) (packet.point U1Depth5.f1))
    (hqt :
      U1Depth5.Record001QTFacingTransportRows
        (packet.point U1Depth5.p) (packet.point U1Depth5.q)
        (packet.point U1Depth5.t1) (packet.point U1Depth5.t2)
        (packet.point U1Depth5.t3) (packet.point U1Depth5.f1))
    (hrow_t2_f5_f2 :
      dist (packet.point U1Depth5.t2) (packet.point U1Depth5.f5) =
        dist (packet.point U1Depth5.t2) (packet.point U1Depth5.f2))
    (hrow_t2_p_f2 :
      dist (packet.point U1Depth5.t2) (packet.point U1Depth5.p) =
        dist (packet.point U1Depth5.t2) (packet.point U1Depth5.f2))
    (hrow_t2_q_f2 :
      dist (packet.point U1Depth5.t2) (packet.point U1Depth5.q) =
        dist (packet.point U1Depth5.t2) (packet.point U1Depth5.f2))
    (hrow_t3_f2_f1 :
      dist (packet.point U1Depth5.t3) (packet.point U1Depth5.f2) =
        dist (packet.point U1Depth5.t3) (packet.point U1Depth5.f1))
    (hrow_t3_p_f1 :
      dist (packet.point U1Depth5.t3) (packet.point U1Depth5.p) =
        dist (packet.point U1Depth5.t3) (packet.point U1Depth5.f1))
    (hrow_t3_t1_f1 :
      dist (packet.point U1Depth5.t3) (packet.point U1Depth5.t1) =
        dist (packet.point U1Depth5.t3) (packet.point U1Depth5.f1))
    (hextra_f1_t2 :
      dist (packet.point U1Depth5.f1) (packet.point U1Depth5.t2) =
        dist (packet.point U1Depth5.f1) (packet.point U1Depth5.f2)) :
    False := by
  have hprod_pa :
      dist (packet.point U1Depth5.f1)
          (packet.point U1Depth5.p) =
        dist (packet.point U1Depth5.f1)
          (packet.point U1Depth5.f2) ∨
      dist (packet.point U1Depth5.f1)
          (packet.point U1Depth5.f3) =
        dist (packet.point U1Depth5.f1)
          (packet.point U1Depth5.f2) :=
    cert_00001_f9db3a3c66ba3ed2_hslot_f1_p_f2_or_hslot_f1_f3_f2_of_manifest_label_packet
      packet hfixed hrow_q_p_f1 hqt.hrow_q_t1_f1 hqt.hrow_q_t2_f1
      hqt.hrow_t1_p_f1 hqt.hrow_t1_q_f1 hqt.hrow_t1_t3_f1 hrow_t2_f5_f2
      hrow_t2_p_f2 hrow_t2_q_f2 hrow_t3_f2_f1 hrow_t3_p_f1
      hrow_t3_t1_f1 hextra_f1_t2
  have hprod_pb :
      dist (packet.point U1Depth5.f1)
          (packet.point U1Depth5.p) =
        dist (packet.point U1Depth5.f1)
          (packet.point U1Depth5.f2) ∨
      dist (packet.point U1Depth5.f1)
          (packet.point U1Depth5.f4) =
        dist (packet.point U1Depth5.f1)
          (packet.point U1Depth5.f2) :=
    cert_00001_4be28408170103ef_hslot_f1_p_f2_or_hslot_f1_f4_f2_of_manifest_label_packet
      packet hfixed hrow_q_p_f1 hqt.hrow_q_t1_f1 hqt.hrow_q_t2_f1
      hqt.hrow_t1_p_f1 hqt.hrow_t1_q_f1 hqt.hrow_t1_t3_f1 hrow_t2_f5_f2
      hrow_t2_p_f2 hrow_t2_q_f2 hrow_t3_f2_f1 hrow_t3_p_f1
      hrow_t3_t1_f1 hextra_f1_t2
  have hrow_f1_p_f2 :
      dist (packet.point U1Depth5.f1)
          (packet.point U1Depth5.p) =
        dist (packet.point U1Depth5.f1)
          (packet.point U1Depth5.f2) := by
    by_cases hP :
        dist (packet.point U1Depth5.f1)
            (packet.point U1Depth5.p) =
          dist (packet.point U1Depth5.f1)
            (packet.point U1Depth5.f2)
    · exact hP
    · rcases hprod_pa with hP' | hA
      · exact False.elim (hP hP')
      rcases hprod_pb with hP'' | hB
      · exact False.elim (hP hP'')
      exact
        cert_00001_173424fd500c50ea_hslot_f1_p_f2_of_manifest_label_packet
          packet hfixed hA hB hrow_q_p_f1 hqt.hrow_t1_p_f1
          hqt.hrow_t1_q_f1 hrow_t2_f5_f2 hrow_t2_p_f2 hrow_t2_q_f2
          hrow_t3_f2_f1 hrow_t3_p_f1 hrow_t3_t1_f1 hextra_f1_t2
  have hrow_f1_f3_f2 :
      dist (packet.point U1Depth5.f1)
          (packet.point U1Depth5.f3) =
        dist (packet.point U1Depth5.f1)
          (packet.point U1Depth5.f2) :=
    cert_00001_f80a3e310cfe6dbb_hslot_f1_f3_f2_of_manifest_label_packet
      packet hfixed hrow_f1_p_f2 hrow_q_p_f1 hqt.hrow_q_t2_f1
      hqt.hrow_t1_p_f1 hqt.hrow_t1_q_f1 hrow_t2_f5_f2 hrow_t2_p_f2
      hrow_t2_q_f2 hrow_t3_f2_f1 hrow_t3_p_f1 hrow_t3_t1_f1
      hextra_f1_t2
  have hrow_f1_f4_f2 :
      dist (packet.point U1Depth5.f1)
          (packet.point U1Depth5.f4) =
        dist (packet.point U1Depth5.f1)
          (packet.point U1Depth5.f2) :=
    cert_00001_bbb8733e43de2265_hslot_f1_f4_f2_of_manifest_label_packet
      packet hfixed hrow_f1_p_f2 hrow_q_p_f1 hqt.hrow_q_t2_f1
      hqt.hrow_t1_p_f1 hqt.hrow_t1_q_f1 hrow_t2_f5_f2 hrow_t2_p_f2
      hrow_t2_q_f2 hrow_t3_f2_f1 hrow_t3_p_f1 hrow_t3_t1_f1
      hextra_f1_t2
  exact
    cert_00001_f46a07c8af1969fd_false_of_manifest_label_packet
      packet hfixed hrow_f1_f3_f2 hrow_f1_f4_f2 hrow_f1_p_f2
      hrow_q_p_f1 hqt.hrow_q_t1_f1 hqt.hrow_q_t2_f1 hqt.hrow_t1_p_f1
      hqt.hrow_t1_q_f1 hqt.hrow_t1_t3_f1 hrow_t2_f5_f2 hrow_t2_p_f2
      hrow_t2_q_f2 hrow_t3_f2_f1 hrow_t3_p_f1 hrow_t3_t1_f1

/-- Record001 branch-0 row-slot-choice form of the direct manifest-label hrow
close.

The four produced labels are fixed to the branch-0 choices
`f2=t2[0]`, `f3=f1[1]`, `f4=f1[2]`, and `f5=t2[1]`, so their carrier
membership is derived from `CriticalSourceRows` rather than supplied as
separate producer facts. -/
theorem false_of_record001_manifest_label_hrows_of_branch0_choices
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
    (hrow_q_p_f1 : dist baseQ baseP = dist baseQ selectedU)
    (hqt :
      U1Depth5.Record001QTFacingTransportRows
        baseP baseQ baseT1 baseT2 baseT3 selectedU)
    (hrow_t2_f5_f2 :
      dist baseT2
          (rows.pointOfChoice
            { source := U1Depth5.CriticalSource.t2, slot := 1 }) =
        dist baseT2
          (rows.pointOfChoice
            { source := U1Depth5.CriticalSource.t2, slot := 0 }))
    (hrow_t2_p_f2 :
      dist baseT2 baseP =
        dist baseT2
          (rows.pointOfChoice
            { source := U1Depth5.CriticalSource.t2, slot := 0 }))
    (hrow_t2_q_f2 :
      dist baseT2 baseQ =
        dist baseT2
          (rows.pointOfChoice
            { source := U1Depth5.CriticalSource.t2, slot := 0 }))
    (hrow_t3_f2_f1 :
      dist baseT3
          (rows.pointOfChoice
            { source := U1Depth5.CriticalSource.t2, slot := 0 }) =
        dist baseT3 selectedU)
    (hrow_t3_p_f1 : dist baseT3 baseP = dist baseT3 selectedU)
    (hrow_t3_t1_f1 : dist baseT3 baseT1 = dist baseT3 selectedU)
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
            { source := U1Depth5.CriticalSource.t2, slot := 0 })) :
    False := by
  exact
    false_of_record001_manifest_label_hrows
      hfixed rows.uRow.source_mem
      (rows.pointOfChoice_mem
        { source := U1Depth5.CriticalSource.t2, slot := 0 })
      (rows.pointOfChoice_mem
        { source := U1Depth5.CriticalSource.f1, slot := 1 })
      (rows.pointOfChoice_mem
        { source := U1Depth5.CriticalSource.f1, slot := 2 })
      (rows.pointOfChoice_mem
        { source := U1Depth5.CriticalSource.t2, slot := 1 })
      hlabels hrow_q_p_f1 hqt hrow_t2_f5_f2 hrow_t2_p_f2
      hrow_t2_q_f2 hrow_t3_f2_f1 hrow_t3_p_f1 hrow_t3_t1_f1
      hrow_f1_f3_f2 hrow_f1_f4_f2 hrow_f1_p_f2

/-- Record001 branch-0 row-slot-choice form of the `f1:t2` product-cycle close.

The four produced labels are fixed to the branch-0 choices
`f2=t2[0]`, `f3=f1[1]`, `f4=f1[2]`, and `f5=t2[1]`.  The producer therefore
owes the ten-label injectivity branch, the twelve non-hard packet-label hrows,
and the `f1:t2` extra-incidence atom; the three hard `f1` hrows are supplied by
the banked product-cycle certificates. -/
theorem false_of_f1t2_extra_omit3_of_branch0_choices
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
    (hrow_q_p_f1 : dist baseQ baseP = dist baseQ selectedU)
    (hqt :
      U1Depth5.Record001QTFacingTransportRows
        baseP baseQ baseT1 baseT2 baseT3 selectedU)
    (hrow_t2_f5_f2 :
      dist baseT2
          (rows.pointOfChoice
            { source := U1Depth5.CriticalSource.t2, slot := 1 }) =
        dist baseT2
          (rows.pointOfChoice
            { source := U1Depth5.CriticalSource.t2, slot := 0 }))
    (hrow_t2_p_f2 :
      dist baseT2 baseP =
        dist baseT2
          (rows.pointOfChoice
            { source := U1Depth5.CriticalSource.t2, slot := 0 }))
    (hrow_t2_q_f2 :
      dist baseT2 baseQ =
        dist baseT2
          (rows.pointOfChoice
            { source := U1Depth5.CriticalSource.t2, slot := 0 }))
    (hrow_t3_f2_f1 :
      dist baseT3
          (rows.pointOfChoice
            { source := U1Depth5.CriticalSource.t2, slot := 0 }) =
        dist baseT3 selectedU)
    (hrow_t3_p_f1 : dist baseT3 baseP = dist baseT3 selectedU)
    (hrow_t3_t1_f1 : dist baseT3 baseT1 = dist baseT3 selectedU)
    (hextra_f1_t2 :
      dist selectedU baseT2 =
        dist selectedU
          (rows.pointOfChoice
            { source := U1Depth5.CriticalSource.t2, slot := 0 })) :
    False := by
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
      f2Point :=
        rows.pointOfChoice
          { source := U1Depth5.CriticalSource.t2, slot := 0 }
      f3Point :=
        rows.pointOfChoice
          { source := U1Depth5.CriticalSource.f1, slot := 1 }
      f4Point :=
        rows.pointOfChoice
          { source := U1Depth5.CriticalSource.f1, slot := 2 }
      f5Point :=
        rows.pointOfChoice
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
  exact
    false_of_f1t2_extra_omit3_of_manifest_label_packet_hrows
      packet
      (by simpa [packet] using hfixed)
      (by simpa [packet] using hrow_q_p_f1)
      (by simpa [packet] using hqt)
      (by simpa [packet] using hrow_t2_f5_f2)
      (by simpa [packet] using hrow_t2_p_f2)
      (by simpa [packet] using hrow_t2_q_f2)
      (by simpa [packet] using hrow_t3_f2_f1)
      (by simpa [packet] using hrow_t3_p_f1)
      (by simpa [packet] using hrow_t3_t1_f1)
      (by simpa [packet] using hextra_f1_t2)

private theorem branch0_pairwise_of_noCollision
    {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : U1Depth5.Plane}
    (rows : U1Depth5.CriticalSourceRows D baseQ baseT1 baseT2 baseT3 selectedU)
    (hbase :
      List.Pairwise (fun x y : U1Depth5.Plane => x ≠ y)
        [baseP, baseQ, baseT1, baseT2, baseT3, selectedU])
    (hNoCollision :
      U1Depth5.RowSlotLabelPacket.Record001Branch0NoCollision rows baseP)
    (hp_f2 :
      baseP ≠
        rows.pointOfChoice
          { source := U1Depth5.CriticalSource.t2, slot := 0 })
    (hp_f3 :
      baseP ≠
        rows.pointOfChoice
          { source := U1Depth5.CriticalSource.f1, slot := 1 })
    (hp_f4 :
      baseP ≠
        rows.pointOfChoice
          { source := U1Depth5.CriticalSource.f1, slot := 2 })
    (hf2_f3 :
      rows.pointOfChoice
          { source := U1Depth5.CriticalSource.t2, slot := 0 } ≠
        rows.pointOfChoice
          { source := U1Depth5.CriticalSource.f1, slot := 1 })
    (hf2_f4 :
      rows.pointOfChoice
          { source := U1Depth5.CriticalSource.t2, slot := 0 } ≠
        rows.pointOfChoice
          { source := U1Depth5.CriticalSource.f1, slot := 2 }) :
    List.Pairwise (fun x y : U1Depth5.Plane => x ≠ y)
      [baseP, baseQ, baseT1, baseT2, baseT3, selectedU,
        rows.pointOfChoice
          { source := U1Depth5.CriticalSource.t2, slot := 0 },
        rows.pointOfChoice
          { source := U1Depth5.CriticalSource.f1, slot := 1 },
        rows.pointOfChoice
          { source := U1Depth5.CriticalSource.f1, slot := 2 },
        rows.pointOfChoice
          { source := U1Depth5.CriticalSource.t2, slot := 1 }] := by
  let f2Choice : U1Depth5.CriticalSlotChoice :=
    { source := U1Depth5.CriticalSource.t2, slot := 0 }
  let f3Choice : U1Depth5.CriticalSlotChoice :=
    { source := U1Depth5.CriticalSource.f1, slot := 1 }
  let f4Choice : U1Depth5.CriticalSlotChoice :=
    { source := U1Depth5.CriticalSource.f1, slot := 2 }
  let f5Choice : U1Depth5.CriticalSlotChoice :=
    { source := U1Depth5.CriticalSource.t2, slot := 1 }
  have htail :
      List.Pairwise (fun x y : U1Depth5.Plane => x ≠ y)
        [rows.pointOfChoice f2Choice, rows.pointOfChoice f3Choice,
          rows.pointOfChoice f4Choice, rows.pointOfChoice f5Choice] := by
    change List.Pairwise (fun x y : U1Depth5.Plane => x ≠ y)
      [(rows.rowAt U1Depth5.CriticalSource.t2).slotPoint 0,
        (rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 1,
        (rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 2,
        (rows.rowAt U1Depth5.CriticalSource.t2).slotPoint 1]
    simp only [List.pairwise_cons, List.mem_cons, List.not_mem_nil, or_false,
      forall_eq_or_imp, forall_eq, IsEmpty.forall_iff, implies_true,
      List.Pairwise.nil, and_true]
    exact
      ⟨⟨by simpa [f2Choice, f3Choice] using hf2_f3,
          by simpa [f2Choice, f4Choice] using hf2_f4,
          by
            simpa using
              (rows.rowAt U1Depth5.CriticalSource.t2).selected.l1_ne_l2⟩,
        ⟨by
            simpa using
              (rows.rowAt U1Depth5.CriticalSource.f1).selected.l2_ne_l3,
          hNoCollision.f11_t21⟩,
        hNoCollision.f12_t21⟩
  have hcross :
      ∀ a ∈ [baseP, baseQ, baseT1, baseT2, baseT3, selectedU],
        ∀ b ∈ [rows.pointOfChoice f2Choice, rows.pointOfChoice f3Choice,
          rows.pointOfChoice f4Choice, rows.pointOfChoice f5Choice], a ≠ b := by
    intro a ha b hb
    simp only [List.mem_cons, List.not_mem_nil, or_false] at ha hb
    rcases ha with rfl | rfl | rfl | rfl | rfl | rfl
    · rcases hb with rfl | rfl | rfl | rfl
      · simpa [f2Choice] using hp_f2
      · simpa [f3Choice] using hp_f3
      · simpa [f4Choice] using hp_f4
      · simpa [f5Choice] using hNoCollision.p_t21
    · rcases hb with rfl | rfl | rfl | rfl
      · simpa [f2Choice] using hNoCollision.q_t20
      · simpa [f3Choice] using hNoCollision.q_f11
      · simpa [f4Choice] using hNoCollision.q_f12
      · simpa [f5Choice] using hNoCollision.q_t21
    · rcases hb with rfl | rfl | rfl | rfl
      · simpa [f2Choice] using hNoCollision.t1_t20
      · simpa [f3Choice] using hNoCollision.t1_f11
      · simpa [f4Choice] using hNoCollision.t1_f12
      · simpa [f5Choice] using hNoCollision.t1_t21
    · rcases hb with rfl | rfl | rfl | rfl
      · simpa [f2Choice] using hNoCollision.t2_t20
      · simpa [f3Choice] using hNoCollision.t2_f11
      · simpa [f4Choice] using hNoCollision.t2_f12
      · simpa [f5Choice] using hNoCollision.t2_t21
    · rcases hb with rfl | rfl | rfl | rfl
      · simpa [f2Choice] using hNoCollision.t3_t20
      · simpa [f3Choice] using hNoCollision.t3_f11
      · simpa [f4Choice] using hNoCollision.t3_f12
      · simpa [f5Choice] using hNoCollision.t3_t21
    · rcases hb with rfl | rfl | rfl | rfl
      · simpa [f2Choice] using hNoCollision.u_t20
      · simpa [f3Choice] using hNoCollision.u_f11
      · simpa [f4Choice] using hNoCollision.u_f12
      · simpa [f5Choice] using hNoCollision.u_t21
  have hlabels :
      List.Pairwise (fun x y : U1Depth5.Plane => x ≠ y)
        [baseP, baseQ, baseT1, baseT2, baseT3, selectedU,
          rows.pointOfChoice f2Choice, rows.pointOfChoice f3Choice,
          rows.pointOfChoice f4Choice, rows.pointOfChoice f5Choice] :=
    U1Depth5.ten_pairwise_of_base_tail_cross hbase htail hcross
  simpa [f2Choice, f3Choice, f4Choice, f5Choice] using hlabels

/-- No-collision form of the record001 branch-0 collision-product close.

The product target
`pairDistance(p,t3) * pairDistance(p,f1) * pairDistance(q,t3)` removes the
two B/E packet-label hrows from the no-collision side of the current `f1:t2`
branch.  Collision branches are still handled by the existing pair-collision
certificates. -/
theorem false_of_f1t2_collision_product_of_branch0_noCollision
    {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : U1Depth5.Plane}
    (rows : U1Depth5.CriticalSourceRows D baseQ baseT1 baseT2 baseT3 selectedU)
    (hfixed : U3FixedTriplePacket D baseQ baseP baseT1 baseT2 baseT3)
    (hbase :
      List.Pairwise (fun x y : U1Depth5.Plane => x ≠ y)
        [baseP, baseQ, baseT1, baseT2, baseT3, selectedU])
    (hNoCollision :
      U1Depth5.RowSlotLabelPacket.Record001Branch0NoCollision rows baseP)
    (hp_f2 :
      baseP ≠
        rows.pointOfChoice
          { source := U1Depth5.CriticalSource.t2, slot := 0 })
    (hp_f3 :
      baseP ≠
        rows.pointOfChoice
          { source := U1Depth5.CriticalSource.f1, slot := 1 })
    (hp_f4 :
      baseP ≠
        rows.pointOfChoice
          { source := U1Depth5.CriticalSource.f1, slot := 2 })
    (hf2_f3 :
      rows.pointOfChoice
          { source := U1Depth5.CriticalSource.t2, slot := 0 } ≠
        rows.pointOfChoice
          { source := U1Depth5.CriticalSource.f1, slot := 1 })
    (hf2_f4 :
      rows.pointOfChoice
          { source := U1Depth5.CriticalSource.t2, slot := 0 } ≠
        rows.pointOfChoice
          { source := U1Depth5.CriticalSource.f1, slot := 2 })
    (hrow_q_p_f1 : dist baseQ baseP = dist baseQ selectedU)
    (hqt :
      U1Depth5.Record001QTFacingTransportRows
        baseP baseQ baseT1 baseT2 baseT3 selectedU)
    (hrow_t2_p_f2 :
      dist baseT2 baseP =
        dist baseT2
          (rows.pointOfChoice
            { source := U1Depth5.CriticalSource.t2, slot := 0 }))
    (hrow_t2_q_f2 :
      dist baseT2 baseQ =
        dist baseT2
          (rows.pointOfChoice
            { source := U1Depth5.CriticalSource.t2, slot := 0 }))
    (hrow_t3_p_f1 : dist baseT3 baseP = dist baseT3 selectedU)
    (hrow_t3_t1_f1 : dist baseT3 baseT1 = dist baseT3 selectedU)
    (hextra_f1_t2 :
      dist selectedU baseT2 =
        dist selectedU
          (rows.pointOfChoice
            { source := U1Depth5.CriticalSource.t2, slot := 0 })) :
    False := by
  exact
    false_of_f1t2_collision_product_of_branch0_choices rows hfixed
      (branch0_pairwise_of_noCollision rows hbase hNoCollision
        hp_f2 hp_f3 hp_f4 hf2_f3 hf2_f4)
      hrow_q_p_f1 hqt hrow_t2_p_f2 hrow_t2_q_f2
      hrow_t3_p_f1 hrow_t3_t1_f1 hextra_f1_t2

/-- Branch-data form of the record001 branch-0 collision-product close.

On the no-collision side, the five formerly explicit inequalities
`p≠f2,f3,f4` and `f2≠f3,f4` are already forced by the branch-0 occurrence
`t2[0]=f1[0]`, the placement `p=f1[3]`, and same-row distinctness in the
selected `f1` row. -/
theorem false_of_f1t2_collision_product_of_branch0_noCollision_branch_data
    {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : U1Depth5.Plane}
    (rows : U1Depth5.CriticalSourceRows D baseQ baseT1 baseT2 baseT3 selectedU)
    (hfixed : U3FixedTriplePacket D baseQ baseP baseT1 baseT2 baseT3)
    (hbase :
      List.Pairwise (fun x y : U1Depth5.Plane => x ≠ y)
        [baseP, baseQ, baseT1, baseT2, baseT3, selectedU])
    (hNoCollision :
      U1Depth5.RowSlotLabelPacket.Record001Branch0NoCollision rows baseP)
    (hocc_f2_f1_0 :
      rows.pointOfChoice
          { source := U1Depth5.CriticalSource.t2, slot := 0 } =
        (rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 0)
    (hfix_p_f1_3 :
      baseP = (rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 3)
    (hrow_q_p_f1 : dist baseQ baseP = dist baseQ selectedU)
    (hqt :
      U1Depth5.Record001QTFacingTransportRows
        baseP baseQ baseT1 baseT2 baseT3 selectedU)
    (hrow_t2_p_f2 :
      dist baseT2 baseP =
        dist baseT2
          (rows.pointOfChoice
            { source := U1Depth5.CriticalSource.t2, slot := 0 }))
    (hrow_t2_q_f2 :
      dist baseT2 baseQ =
        dist baseT2
          (rows.pointOfChoice
            { source := U1Depth5.CriticalSource.t2, slot := 0 }))
    (hrow_t3_p_f1 : dist baseT3 baseP = dist baseT3 selectedU)
    (hrow_t3_t1_f1 : dist baseT3 baseT1 = dist baseT3 selectedU)
    (hextra_f1_t2 :
      dist selectedU baseT2 =
        dist selectedU
          (rows.pointOfChoice
            { source := U1Depth5.CriticalSource.t2, slot := 0 })) :
    False := by
  have hp_f2 :
      baseP ≠
        rows.pointOfChoice
          { source := U1Depth5.CriticalSource.t2, slot := 0 } := by
    intro h
    have h' :
        (rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 3 =
          (rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 0 := by
      exact hfix_p_f1_3.symm.trans (h.trans hocc_f2_f1_0)
    exact (rows.rowAt U1Depth5.CriticalSource.f1).selected.l1_ne_l4 h'.symm
  have hp_f3 :
      baseP ≠
        rows.pointOfChoice
          { source := U1Depth5.CriticalSource.f1, slot := 1 } := by
    intro h
    have h' :
        (rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 3 =
          (rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 1 := by
      exact hfix_p_f1_3.symm.trans h
    exact (rows.rowAt U1Depth5.CriticalSource.f1).selected.l2_ne_l4 h'.symm
  have hp_f4 :
      baseP ≠
        rows.pointOfChoice
          { source := U1Depth5.CriticalSource.f1, slot := 2 } := by
    intro h
    have h' :
        (rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 3 =
          (rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 2 := by
      exact hfix_p_f1_3.symm.trans h
    exact (rows.rowAt U1Depth5.CriticalSource.f1).selected.l3_ne_l4 h'.symm
  have hf2_f3 :
      rows.pointOfChoice
          { source := U1Depth5.CriticalSource.t2, slot := 0 } ≠
        rows.pointOfChoice
          { source := U1Depth5.CriticalSource.f1, slot := 1 } := by
    intro h
    have h' :
        (rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 0 =
          (rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 1 := by
      exact hocc_f2_f1_0.symm.trans h
    exact (rows.rowAt U1Depth5.CriticalSource.f1).selected.l1_ne_l2 h'
  have hf2_f4 :
      rows.pointOfChoice
          { source := U1Depth5.CriticalSource.t2, slot := 0 } ≠
        rows.pointOfChoice
          { source := U1Depth5.CriticalSource.f1, slot := 2 } := by
    intro h
    have h' :
        (rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 0 =
          (rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 2 := by
      exact hocc_f2_f1_0.symm.trans h
    exact (rows.rowAt U1Depth5.CriticalSource.f1).selected.l1_ne_l3 h'
  exact
    false_of_f1t2_collision_product_of_branch0_noCollision
      rows hfixed hbase hNoCollision hp_f2 hp_f3 hp_f4 hf2_f3 hf2_f4
      hrow_q_p_f1 hqt hrow_t2_p_f2 hrow_t2_q_f2
      hrow_t3_p_f1 hrow_t3_t1_f1 hextra_f1_t2

/-- No-collision form of the record001 branch-0 row-slot-choice close.

The base-six pairwise data and two same-row tail inequalities are structural.
The existing record001 no-collision structure covers the split-backed pair
families; the five remaining cross-row inequalities are kept explicit. -/
theorem false_of_f1t2_extra_omit3_of_branch0_noCollision
    {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : U1Depth5.Plane}
    (rows : U1Depth5.CriticalSourceRows D baseQ baseT1 baseT2 baseT3 selectedU)
    (hfixed : U3FixedTriplePacket D baseQ baseP baseT1 baseT2 baseT3)
    (hbase :
      List.Pairwise (fun x y : U1Depth5.Plane => x ≠ y)
        [baseP, baseQ, baseT1, baseT2, baseT3, selectedU])
    (hNoCollision :
      U1Depth5.RowSlotLabelPacket.Record001Branch0NoCollision rows baseP)
    (hp_f2 :
      baseP ≠
        rows.pointOfChoice
          { source := U1Depth5.CriticalSource.t2, slot := 0 })
    (hp_f3 :
      baseP ≠
        rows.pointOfChoice
          { source := U1Depth5.CriticalSource.f1, slot := 1 })
    (hp_f4 :
      baseP ≠
        rows.pointOfChoice
          { source := U1Depth5.CriticalSource.f1, slot := 2 })
    (hf2_f3 :
      rows.pointOfChoice
          { source := U1Depth5.CriticalSource.t2, slot := 0 } ≠
        rows.pointOfChoice
          { source := U1Depth5.CriticalSource.f1, slot := 1 })
    (hf2_f4 :
      rows.pointOfChoice
          { source := U1Depth5.CriticalSource.t2, slot := 0 } ≠
        rows.pointOfChoice
          { source := U1Depth5.CriticalSource.f1, slot := 2 })
    (hrow_q_p_f1 : dist baseQ baseP = dist baseQ selectedU)
    (hqt :
      U1Depth5.Record001QTFacingTransportRows
        baseP baseQ baseT1 baseT2 baseT3 selectedU)
    (hrow_t2_f5_f2 :
      dist baseT2
          (rows.pointOfChoice
            { source := U1Depth5.CriticalSource.t2, slot := 1 }) =
        dist baseT2
          (rows.pointOfChoice
            { source := U1Depth5.CriticalSource.t2, slot := 0 }))
    (hrow_t2_p_f2 :
      dist baseT2 baseP =
        dist baseT2
          (rows.pointOfChoice
            { source := U1Depth5.CriticalSource.t2, slot := 0 }))
    (hrow_t2_q_f2 :
      dist baseT2 baseQ =
        dist baseT2
          (rows.pointOfChoice
            { source := U1Depth5.CriticalSource.t2, slot := 0 }))
    (hrow_t3_f2_f1 :
      dist baseT3
          (rows.pointOfChoice
            { source := U1Depth5.CriticalSource.t2, slot := 0 }) =
        dist baseT3 selectedU)
    (hrow_t3_p_f1 : dist baseT3 baseP = dist baseT3 selectedU)
    (hrow_t3_t1_f1 : dist baseT3 baseT1 = dist baseT3 selectedU)
    (hextra_f1_t2 :
      dist selectedU baseT2 =
        dist selectedU
          (rows.pointOfChoice
            { source := U1Depth5.CriticalSource.t2, slot := 0 })) :
    False := by
  let f2Choice : U1Depth5.CriticalSlotChoice :=
    { source := U1Depth5.CriticalSource.t2, slot := 0 }
  let f3Choice : U1Depth5.CriticalSlotChoice :=
    { source := U1Depth5.CriticalSource.f1, slot := 1 }
  let f4Choice : U1Depth5.CriticalSlotChoice :=
    { source := U1Depth5.CriticalSource.f1, slot := 2 }
  let f5Choice : U1Depth5.CriticalSlotChoice :=
    { source := U1Depth5.CriticalSource.t2, slot := 1 }
  have htail :
      List.Pairwise (fun x y : U1Depth5.Plane => x ≠ y)
        [rows.pointOfChoice f2Choice, rows.pointOfChoice f3Choice,
          rows.pointOfChoice f4Choice, rows.pointOfChoice f5Choice] := by
    change List.Pairwise (fun x y : U1Depth5.Plane => x ≠ y)
      [(rows.rowAt U1Depth5.CriticalSource.t2).slotPoint 0,
        (rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 1,
        (rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 2,
        (rows.rowAt U1Depth5.CriticalSource.t2).slotPoint 1]
    simp only [List.pairwise_cons, List.mem_cons, List.not_mem_nil, or_false,
      forall_eq_or_imp, forall_eq, IsEmpty.forall_iff, implies_true,
      List.Pairwise.nil, and_true]
    exact
      ⟨⟨by simpa [f2Choice, f3Choice] using hf2_f3,
          by simpa [f2Choice, f4Choice] using hf2_f4,
          by
            simpa using
              (rows.rowAt U1Depth5.CriticalSource.t2).selected.l1_ne_l2⟩,
        ⟨by
            simpa using
              (rows.rowAt U1Depth5.CriticalSource.f1).selected.l2_ne_l3,
          hNoCollision.f11_t21⟩,
        hNoCollision.f12_t21⟩
  have hcross :
      ∀ a ∈ [baseP, baseQ, baseT1, baseT2, baseT3, selectedU],
        ∀ b ∈ [rows.pointOfChoice f2Choice, rows.pointOfChoice f3Choice,
          rows.pointOfChoice f4Choice, rows.pointOfChoice f5Choice], a ≠ b := by
    intro a ha b hb
    simp only [List.mem_cons, List.not_mem_nil, or_false] at ha hb
    rcases ha with rfl | rfl | rfl | rfl | rfl | rfl
    · rcases hb with rfl | rfl | rfl | rfl
      · simpa [f2Choice] using hp_f2
      · simpa [f3Choice] using hp_f3
      · simpa [f4Choice] using hp_f4
      · simpa [f5Choice] using hNoCollision.p_t21
    · rcases hb with rfl | rfl | rfl | rfl
      · simpa [f2Choice] using hNoCollision.q_t20
      · simpa [f3Choice] using hNoCollision.q_f11
      · simpa [f4Choice] using hNoCollision.q_f12
      · simpa [f5Choice] using hNoCollision.q_t21
    · rcases hb with rfl | rfl | rfl | rfl
      · simpa [f2Choice] using hNoCollision.t1_t20
      · simpa [f3Choice] using hNoCollision.t1_f11
      · simpa [f4Choice] using hNoCollision.t1_f12
      · simpa [f5Choice] using hNoCollision.t1_t21
    · rcases hb with rfl | rfl | rfl | rfl
      · simpa [f2Choice] using hNoCollision.t2_t20
      · simpa [f3Choice] using hNoCollision.t2_f11
      · simpa [f4Choice] using hNoCollision.t2_f12
      · simpa [f5Choice] using hNoCollision.t2_t21
    · rcases hb with rfl | rfl | rfl | rfl
      · simpa [f2Choice] using hNoCollision.t3_t20
      · simpa [f3Choice] using hNoCollision.t3_f11
      · simpa [f4Choice] using hNoCollision.t3_f12
      · simpa [f5Choice] using hNoCollision.t3_t21
    · rcases hb with rfl | rfl | rfl | rfl
      · simpa [f2Choice] using hNoCollision.u_t20
      · simpa [f3Choice] using hNoCollision.u_f11
      · simpa [f4Choice] using hNoCollision.u_f12
      · simpa [f5Choice] using hNoCollision.u_t21
  have hlabels :
      List.Pairwise (fun x y : U1Depth5.Plane => x ≠ y)
        [baseP, baseQ, baseT1, baseT2, baseT3, selectedU,
          rows.pointOfChoice f2Choice, rows.pointOfChoice f3Choice,
          rows.pointOfChoice f4Choice, rows.pointOfChoice f5Choice] :=
    U1Depth5.ten_pairwise_of_base_tail_cross hbase htail hcross
  exact
    false_of_f1t2_extra_omit3_of_branch0_choices rows hfixed
      (by simpa [f2Choice, f3Choice, f4Choice, f5Choice] using hlabels)
      hrow_q_p_f1 hqt hrow_t2_f5_f2 hrow_t2_p_f2
      hrow_t2_q_f2 hrow_t3_f2_f1 hrow_t3_p_f1 hrow_t3_t1_f1
      hextra_f1_t2

set_option linter.flexible false in
/-- Equality-branch form of the five record001 branch-0 pair cases not covered
by `Record001Branch0Collision`.

The surrounding split should send the complementary all-inequality branch to
`false_of_f1t2_extra_omit3_of_branch0_noCollision`. -/
theorem false_of_f1t2_extra_omit3_of_branch0_pairCollision
    {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : U1Depth5.Plane}
    (rows : U1Depth5.CriticalSourceRows D baseQ baseT1 baseT2 baseT3 selectedU)
    (hfixed : U3FixedTriplePacket D baseQ baseP baseT1 baseT2 baseT3)
    (hbase :
      List.Pairwise (fun x y : U1Depth5.Plane => x ≠ y)
        [baseP, baseQ, baseT1, baseT2, baseT3, selectedU])
    (hPair :
      baseP =
          rows.pointOfChoice
            { source := U1Depth5.CriticalSource.t2, slot := 0 } ∨
        baseP =
          rows.pointOfChoice
            { source := U1Depth5.CriticalSource.f1, slot := 1 } ∨
        baseP =
          rows.pointOfChoice
            { source := U1Depth5.CriticalSource.f1, slot := 2 } ∨
        rows.pointOfChoice
            { source := U1Depth5.CriticalSource.t2, slot := 0 } =
          rows.pointOfChoice
            { source := U1Depth5.CriticalSource.f1, slot := 1 } ∨
        rows.pointOfChoice
            { source := U1Depth5.CriticalSource.t2, slot := 0 } =
          rows.pointOfChoice
            { source := U1Depth5.CriticalSource.f1, slot := 2 })
    (hrow_q_p_f1 : dist baseQ baseP = dist baseQ selectedU)
    (hrow_q_t1_f1 : dist baseQ baseT1 = dist baseQ selectedU)
    (hrow_q_t2_f1 : dist baseQ baseT2 = dist baseQ selectedU)
    (hrow_t1_p_f1 : dist baseT1 baseP = dist baseT1 selectedU)
    (hrow_t1_q_f1 : dist baseT1 baseQ = dist baseT1 selectedU)
    (hrow_t1_t3_f1 : dist baseT1 baseT3 = dist baseT1 selectedU)
    (hrow_t2_f5_f2 :
      dist baseT2
          (rows.pointOfChoice
            { source := U1Depth5.CriticalSource.t2, slot := 1 }) =
        dist baseT2
          (rows.pointOfChoice
            { source := U1Depth5.CriticalSource.t2, slot := 0 }))
    (hrow_t2_p_f2 :
      dist baseT2 baseP =
        dist baseT2
          (rows.pointOfChoice
            { source := U1Depth5.CriticalSource.t2, slot := 0 }))
    (hrow_t2_q_f2 :
      dist baseT2 baseQ =
        dist baseT2
          (rows.pointOfChoice
            { source := U1Depth5.CriticalSource.t2, slot := 0 }))
    (hrow_t3_f2_f1 :
      dist baseT3
          (rows.pointOfChoice
            { source := U1Depth5.CriticalSource.t2, slot := 0 }) =
        dist baseT3 selectedU)
    (hrow_t3_p_f1 : dist baseT3 baseP = dist baseT3 selectedU)
    (hrow_t3_t1_f1 : dist baseT3 baseT1 = dist baseT3 selectedU)
    (hextra_f1_t2 :
      dist selectedU baseT2 =
        dist selectedU
          (rows.pointOfChoice
            { source := U1Depth5.CriticalSource.t2, slot := 0 })) :
    False := by
  let f2Choice : U1Depth5.CriticalSlotChoice :=
    { source := U1Depth5.CriticalSource.t2, slot := 0 }
  let f3Choice : U1Depth5.CriticalSlotChoice :=
    { source := U1Depth5.CriticalSource.f1, slot := 1 }
  let f4Choice : U1Depth5.CriticalSlotChoice :=
    { source := U1Depth5.CriticalSource.f1, slot := 2 }
  let f5Choice : U1Depth5.CriticalSlotChoice :=
    { source := U1Depth5.CriticalSource.t2, slot := 1 }
  have hbase' := hbase
  simp only [List.pairwise_cons, List.mem_cons, List.not_mem_nil, or_false,
    forall_eq_or_imp, forall_eq, IsEmpty.forall_iff, implies_true,
    List.Pairwise.nil, and_true] at hbase'
  rcases hbase' with ⟨⟨hpq, _, _, _, _⟩, _, _, _, _⟩
  let f2 : U1Depth5.Plane :=
    (rows.rowAt U1Depth5.CriticalSource.t2).slotPoint 0
  let f3 : U1Depth5.Plane :=
    (rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 1
  let f4 : U1Depth5.Plane :=
    (rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 2
  let f5 : U1Depth5.Plane :=
    (rows.rowAt U1Depth5.CriticalSource.t2).slotPoint 1
  let ν : ℕ → ℝ
    | 0 => normalAxis baseP baseQ selectedU 0
    | 1 => normalAxis baseP baseQ selectedU 1
    | 2 => normalAxis baseP baseQ f2 0
    | 3 => normalAxis baseP baseQ f2 1
    | 4 => normalAxis baseP baseQ f3 0
    | 5 => normalAxis baseP baseQ f3 1
    | 6 => normalAxis baseP baseQ f4 0
    | 7 => normalAxis baseP baseQ f4 1
    | 8 => normalAxis baseP baseQ f5 0
    | 9 => normalAxis baseP baseQ f5 1
    | 10 => normalAxis baseP baseQ baseT1 0
    | 11 => normalAxis baseP baseQ baseT1 1
    | 12 => normalAxis baseP baseQ baseT2 0
    | 13 => normalAxis baseP baseQ baseT2 1
    | 14 => normalAxis baseP baseQ baseT3 0
    | 15 => normalAxis baseP baseQ baseT3 1
    | 17 => 1
    | 18 => 1
    | 19 => coordSqDist (normalAxis baseP baseQ baseT1)
        (normalAxis baseP baseQ selectedU)
    | 20 => coordSqDist (normalAxis baseP baseQ baseT2)
        (normalAxis baseP baseQ f2)
    | 21 => coordSqDist (normalAxis baseP baseQ baseT3)
        (normalAxis baseP baseQ selectedU)
    | _ => 0
  have hq_t1 : dist baseQ baseP = dist baseQ baseT1 :=
    hrow_q_p_f1.trans hrow_q_t1_f1.symm
  have hq_t2 : dist baseQ baseP = dist baseQ baseT2 :=
    hrow_q_p_f1.trans hrow_q_t2_f1.symm
  have hfact_0 : ν 10 ^ 2 + ν 11 ^ 2 = 1 := by
    simpa [ν] using
      Problem97.normalAxis_sqnorm_coord_eq_one_of_dist_eq hpq
        hfixed.t1_same_radius
  have hfact_1 : ν 12 ^ 2 + ν 13 ^ 2 = 1 := by
    simpa [ν] using
      Problem97.normalAxis_sqnorm_coord_eq_one_of_dist_eq hpq
        hfixed.t2_same_radius
  have hfact_2 : ν 14 ^ 2 + ν 15 ^ 2 = 1 := by
    simpa [ν] using
      Problem97.normalAxis_sqnorm_coord_eq_one_of_dist_eq hpq
        hfixed.t3_same_radius
  have hfact_3 : ν 17 = 1 := by
    simp [ν]
  have hfact_4 : ν 10 ^ 2 + ν 11 ^ 2 = ν 17 := by
    simpa [ν] using hfact_0
  have hfact_5 : ν 12 ^ 2 + ν 13 ^ 2 = ν 17 := by
    simpa [ν] using hfact_1
  have hfact_6 : ν 14 ^ 2 + ν 15 ^ 2 = ν 17 := by
    simpa [ν] using hfact_2
  have hfact_7 : (ν 0 - 1) ^ 2 + ν 1 ^ 2 = ν 18 := by
    have hcoord :=
      Problem97.normalAxis_coordSqDist_witness_eq_one_of_dist_eq hpq
        hrow_q_p_f1
    rw [Problem97.normalAxis_witness hpq] at hcoord
    dsimp [coordSqDist] at hcoord
    calc
      (ν 0 - 1) ^ 2 + ν 1 ^ 2 =
          (1 - (normalAxis baseP baseQ selectedU) 0) ^ 2 +
            (0 - (normalAxis baseP baseQ selectedU) 1) ^ 2 := by
        simp [ν]
        ring
      _ = 1 := hcoord
  have hfact_8 : ν 18 = 1 := by
    simp [ν]
  have hfact_9 : (ν 10 - 1) ^ 2 + ν 11 ^ 2 = ν 18 := by
    have hcoord :=
      Problem97.normalAxis_coordSqDist_witness_eq_one_of_dist_eq hpq hq_t1
    rw [Problem97.normalAxis_witness hpq] at hcoord
    dsimp [coordSqDist] at hcoord
    calc
      (ν 10 - 1) ^ 2 + ν 11 ^ 2 =
          (1 - (normalAxis baseP baseQ baseT1) 0) ^ 2 +
            (0 - (normalAxis baseP baseQ baseT1) 1) ^ 2 := by
        simp [ν]
        ring
      _ = 1 := hcoord
  have hfact_10 : (ν 12 - 1) ^ 2 + ν 13 ^ 2 = ν 18 := by
    have hcoord :=
      Problem97.normalAxis_coordSqDist_witness_eq_one_of_dist_eq hpq hq_t2
    rw [Problem97.normalAxis_witness hpq] at hcoord
    dsimp [coordSqDist] at hcoord
    calc
      (ν 12 - 1) ^ 2 + ν 13 ^ 2 =
          (1 - (normalAxis baseP baseQ baseT2) 0) ^ 2 +
            (0 - (normalAxis baseP baseQ baseT2) 1) ^ 2 := by
        simp [ν]
        ring
      _ = 1 := hcoord
  have hfact_11 : (ν 10 - ν 0) ^ 2 + (ν 11 - ν 1) ^ 2 = ν 19 := by
    simp [ν, coordSqDist]
  have hfact_12 : ν 10 ^ 2 + ν 11 ^ 2 = ν 19 := by
    simpa [ν] using
      Problem97.normalAxis_sqnorm_eq_coordSqDist_of_dist_eq hpq
        hrow_t1_p_f1
  have hfact_13 : (ν 10 - 1) ^ 2 + ν 11 ^ 2 = ν 19 := by
    simpa [ν] using
      Problem97.normalAxis_unitX_sqdist_eq_coordSqDist_of_dist_eq hpq
        hrow_t1_q_f1
  have hfact_14 : (ν 10 - ν 14) ^ 2 + (ν 11 - ν 15) ^ 2 = ν 19 := by
    have hcoord :=
      Problem97.normalAxis_coord_sqdist_eq_of_dist_eq hpq hrow_t1_t3_f1
    simpa [ν, coordSqDist] using hcoord
  have hfact_15 : (ν 12 - ν 2) ^ 2 + (ν 13 - ν 3) ^ 2 = ν 20 := by
    simp [ν, coordSqDist]
  have hfact_16 : (ν 12 - ν 8) ^ 2 + (ν 13 - ν 9) ^ 2 = ν 20 := by
    have hcoord :=
      Problem97.normalAxis_coord_sqdist_eq_of_dist_eq hpq (by
        simpa [f2Choice, f5Choice, f2, f5] using hrow_t2_f5_f2)
    simpa [ν, coordSqDist] using hcoord
  have hfact_17 : ν 12 ^ 2 + ν 13 ^ 2 = ν 20 := by
    simpa [ν, f2Choice, f2] using
      Problem97.normalAxis_sqnorm_eq_coordSqDist_of_dist_eq hpq
        hrow_t2_p_f2
  have hfact_18 : (ν 12 - 1) ^ 2 + ν 13 ^ 2 = ν 20 := by
    simpa [ν, f2Choice, f2] using
      Problem97.normalAxis_unitX_sqdist_eq_coordSqDist_of_dist_eq hpq
        hrow_t2_q_f2
  have hfact_19 : (ν 14 - ν 0) ^ 2 + (ν 15 - ν 1) ^ 2 = ν 21 := by
    simp [ν, coordSqDist]
  have hfact_20 : (ν 14 - ν 2) ^ 2 + (ν 15 - ν 3) ^ 2 = ν 21 := by
    have hcoord :=
      Problem97.normalAxis_coord_sqdist_eq_of_dist_eq hpq (by
        simpa [f2Choice, f2] using hrow_t3_f2_f1)
    simpa [ν, coordSqDist] using hcoord
  have hfact_21 : ν 14 ^ 2 + ν 15 ^ 2 = ν 21 := by
    simpa [ν] using
      Problem97.normalAxis_sqnorm_eq_coordSqDist_of_dist_eq hpq
        hrow_t3_p_f1
  have hfact_22 : (ν 14 - ν 10) ^ 2 + (ν 15 - ν 11) ^ 2 = ν 21 := by
    have hcoord :=
      Problem97.normalAxis_coord_sqdist_eq_of_dist_eq hpq hrow_t3_t1_f1
    simpa [ν, coordSqDist] using hcoord
  have hfact_25 :
      U5GramCert.eval ν
          ((U5GramCert.coordSqDistPoly 0 1 12 13) ++
            U5GramCert.neg (U5GramCert.coordSqDistPoly 0 1 2 3)) = 0 := by
    have hcoord :=
      Problem97.normalAxis_coord_sqdist_eq_of_dist_eq hpq (by
        simpa [f2Choice, f2] using hextra_f1_t2)
    rw [U5GramCert.eval_append, U5GramCert.eval_neg,
      U5GramCert.eval_coordSqDistPoly, U5GramCert.eval_coordSqDistPoly]
    dsimp [ν, coordSqDist, f2, U1Depth5.CriticalRowPacket.slotPoint]
      at hcoord ⊢
    rw [hcoord]
    ring_nf
  rcases hPair with hpt20 | hpf11 | hpf12 | ht20f11 | ht20f12
  · have hpt20' : baseP = f2 := by
      simpa [f2, f2Choice] using hpt20
    have hfact_23 :
        U5GramCert.eval ν [([0, 0, 1], (-1 : ℚ))] = 0 := by
      simp [U5GramCert.eval, U5GramCert.evalMono, ν, f2, hpt20',
        Problem97.normalAxis_self]
    have hfact_24 :
        U5GramCert.eval ν [([0, 0, 0, 1], (-1 : ℚ))] = 0 := by
      simp [U5GramCert.eval, U5GramCert.evalMono, ν, f2, hpt20',
        Problem97.normalAxis_self]
    exact
      cert_00003_b2f01338be2c60db_false_of_semantic_equalities ν
        hfact_0 hfact_1 hfact_2 hfact_3 hfact_4 hfact_5 hfact_6
        hfact_7 hfact_8 hfact_9 hfact_10 hfact_11 hfact_12 hfact_13
        hfact_14 hfact_15 hfact_16 hfact_17 hfact_18 hfact_19
        hfact_20 hfact_21 hfact_22 hfact_23 hfact_24 hfact_25
  · have hpf11' : baseP = f3 := by
      simpa [f3, f3Choice] using hpf11
    have hfact_23 :
        U5GramCert.eval ν [([0, 0, 0, 0, 1], (-1 : ℚ))] = 0 := by
      simp [U5GramCert.eval, U5GramCert.evalMono, ν, f3, hpf11',
        Problem97.normalAxis_self]
    have hfact_24 :
        U5GramCert.eval ν [([0, 0, 0, 0, 0, 1], (-1 : ℚ))] = 0 := by
      simp [U5GramCert.eval, U5GramCert.evalMono, ν, f3, hpf11',
        Problem97.normalAxis_self]
    exact
      cert_00001_f1b95031031d9e80_false_of_semantic_equalities ν
        hfact_0 hfact_1 hfact_2 hfact_3 hfact_4 hfact_5 hfact_6
        hfact_7 hfact_8 hfact_9 hfact_10 hfact_11 hfact_12 hfact_13
        hfact_14 hfact_15 hfact_16 hfact_17 hfact_18 hfact_19
        hfact_20 hfact_21 hfact_22 hfact_23 hfact_24 hfact_25
  · have hpf12' : baseP = f4 := by
      simpa [f4, f4Choice] using hpf12
    have hfact_23 :
        U5GramCert.eval ν [([0, 0, 0, 0, 0, 0, 1], (-1 : ℚ))] = 0 := by
      simp [U5GramCert.eval, U5GramCert.evalMono, ν, f4, hpf12',
        Problem97.normalAxis_self]
    have hfact_24 :
        U5GramCert.eval ν [([0, 0, 0, 0, 0, 0, 0, 1], (-1 : ℚ))] = 0 := by
      simp [U5GramCert.eval, U5GramCert.evalMono, ν, f4, hpf12',
        Problem97.normalAxis_self]
    exact
      cert_00002_196e6e09192eea58_false_of_semantic_equalities ν
        hfact_0 hfact_1 hfact_2 hfact_3 hfact_4 hfact_5 hfact_6
        hfact_7 hfact_8 hfact_9 hfact_10 hfact_11 hfact_12 hfact_13
        hfact_14 hfact_15 hfact_16 hfact_17 hfact_18 hfact_19
        hfact_20 hfact_21 hfact_22 hfact_23 hfact_24 hfact_25
  · have ht20f11' : f2 = f3 := by
      simpa [f2, f3, f2Choice, f3Choice] using ht20f11
    have hfact_23 :
        U5GramCert.eval ν
          [([0, 0, 0, 0, 1], (-1 : ℚ)), ([0, 0, 1], (1 : ℚ))] = 0 := by
      simp [U5GramCert.eval, U5GramCert.evalMono, ν]
      rw [ht20f11']
      ring_nf
    have hfact_24 :
        U5GramCert.eval ν
          [([0, 0, 0, 0, 0, 1], (-1 : ℚ)), ([0, 0, 0, 1], (1 : ℚ))] = 0 := by
      simp [U5GramCert.eval, U5GramCert.evalMono, ν]
      rw [ht20f11']
      ring_nf
    exact
      cert_00004_bfc50bd0af4a27b8_false_of_semantic_equalities ν
        hfact_0 hfact_1 hfact_2 hfact_3 hfact_4 hfact_5 hfact_6
        hfact_7 hfact_8 hfact_9 hfact_10 hfact_11 hfact_12 hfact_13
        hfact_14 hfact_15 hfact_16 hfact_17 hfact_18 hfact_19
        hfact_20 hfact_21 hfact_22 hfact_23 hfact_24 hfact_25
  · have ht20f12' : f2 = f4 := by
      simpa [f2, f4, f2Choice, f4Choice] using ht20f12
    have hfact_23 :
        U5GramCert.eval ν
          [([0, 0, 0, 0, 0, 0, 1], (-1 : ℚ)), ([0, 0, 1], (1 : ℚ))] = 0 := by
      simp [U5GramCert.eval, U5GramCert.evalMono, ν]
      rw [ht20f12']
      ring_nf
    have hfact_24 :
        U5GramCert.eval ν
          [([0, 0, 0, 0, 0, 0, 0, 1], (-1 : ℚ)), ([0, 0, 0, 1], (1 : ℚ))] = 0 := by
      simp [U5GramCert.eval, U5GramCert.evalMono, ν]
      rw [ht20f12']
      ring_nf
    exact
      cert_00005_b35a430fdd9fb58e_false_of_semantic_equalities ν
        hfact_0 hfact_1 hfact_2 hfact_3 hfact_4 hfact_5 hfact_6
        hfact_7 hfact_8 hfact_9 hfact_10 hfact_11 hfact_12 hfact_13
        hfact_14 hfact_15 hfact_16 hfact_17 hfact_18 hfact_19
        hfact_20 hfact_21 hfact_22 hfact_23 hfact_24 hfact_25

/-- Producer-facing bundle for the current record001 branch-0 consumer.

This is exactly the live data still missing after the pair-collision split:
the no-collision side of the existing branch0 collision split, the twelve
non-hard packet-label hrows, and the `f1:t2` extra-incidence atom. -/
structure Record001Branch0ProducerData {D : CounterexampleData}
    {baseQ baseT1 baseT2 baseT3 selectedU : U1Depth5.Plane}
    (rows : U1Depth5.CriticalSourceRows D baseQ baseT1 baseT2 baseT3 selectedU)
    (baseP : U1Depth5.Plane) : Prop where
  noCollision :
    U1Depth5.RowSlotLabelPacket.Record001Branch0NoCollision rows baseP
  hrow_q_p_f1 : dist baseQ baseP = dist baseQ selectedU
  hqt :
    U1Depth5.Record001QTFacingTransportRows
      baseP baseQ baseT1 baseT2 baseT3 selectedU
  hrow_t2_f5_f2 :
    dist baseT2
        (rows.pointOfChoice
          { source := U1Depth5.CriticalSource.t2, slot := 1 }) =
      dist baseT2
        (rows.pointOfChoice
          { source := U1Depth5.CriticalSource.t2, slot := 0 })
  hrow_t2_p_f2 :
    dist baseT2 baseP =
      dist baseT2
        (rows.pointOfChoice
          { source := U1Depth5.CriticalSource.t2, slot := 0 })
  hrow_t2_q_f2 :
    dist baseT2 baseQ =
      dist baseT2
        (rows.pointOfChoice
          { source := U1Depth5.CriticalSource.t2, slot := 0 })
  hrow_t3_f2_f1 :
    dist baseT3
        (rows.pointOfChoice
          { source := U1Depth5.CriticalSource.t2, slot := 0 }) =
      dist baseT3 selectedU
  hrow_t3_p_f1 : dist baseT3 baseP = dist baseT3 selectedU
  hrow_t3_t1_f1 : dist baseT3 baseT1 = dist baseT3 selectedU
  hextra_f1_t2 :
    dist selectedU baseT2 =
      dist selectedU
        (rows.pointOfChoice
          { source := U1Depth5.CriticalSource.t2, slot := 0 })

namespace Record001Branch0ProducerData

/-- Any complete producer bundle for the current branch0 surface contradicts
the banked record001 branch-0 certificates. -/
theorem false {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : U1Depth5.Plane}
    {rows : U1Depth5.CriticalSourceRows D baseQ baseT1 baseT2 baseT3 selectedU}
    (B : Record001Branch0ProducerData rows baseP)
    (hfixed : U3FixedTriplePacket D baseQ baseP baseT1 baseT2 baseT3)
    (hbase :
      List.Pairwise (fun x y : U1Depth5.Plane => x ≠ y)
        [baseP, baseQ, baseT1, baseT2, baseT3, selectedU]) :
    False := by
  by_cases hp_f2 :
      baseP =
        rows.pointOfChoice
          { source := U1Depth5.CriticalSource.t2, slot := 0 }
  · exact
      false_of_f1t2_extra_omit3_of_branch0_pairCollision
        rows hfixed hbase (Or.inl hp_f2)
        B.hrow_q_p_f1 B.hqt.hrow_q_t1_f1 B.hqt.hrow_q_t2_f1
        B.hqt.hrow_t1_p_f1 B.hqt.hrow_t1_q_f1 B.hqt.hrow_t1_t3_f1
        B.hrow_t2_f5_f2
        B.hrow_t2_p_f2 B.hrow_t2_q_f2 B.hrow_t3_f2_f1
        B.hrow_t3_p_f1 B.hrow_t3_t1_f1 B.hextra_f1_t2
  by_cases hp_f3 :
      baseP =
        rows.pointOfChoice
          { source := U1Depth5.CriticalSource.f1, slot := 1 }
  · exact
      false_of_f1t2_extra_omit3_of_branch0_pairCollision
        rows hfixed hbase (Or.inr (Or.inl hp_f3))
        B.hrow_q_p_f1 B.hqt.hrow_q_t1_f1 B.hqt.hrow_q_t2_f1
        B.hqt.hrow_t1_p_f1 B.hqt.hrow_t1_q_f1 B.hqt.hrow_t1_t3_f1
        B.hrow_t2_f5_f2
        B.hrow_t2_p_f2 B.hrow_t2_q_f2 B.hrow_t3_f2_f1
        B.hrow_t3_p_f1 B.hrow_t3_t1_f1 B.hextra_f1_t2
  by_cases hp_f4 :
      baseP =
        rows.pointOfChoice
          { source := U1Depth5.CriticalSource.f1, slot := 2 }
  · exact
      false_of_f1t2_extra_omit3_of_branch0_pairCollision
        rows hfixed hbase (Or.inr (Or.inr (Or.inl hp_f4)))
        B.hrow_q_p_f1 B.hqt.hrow_q_t1_f1 B.hqt.hrow_q_t2_f1
        B.hqt.hrow_t1_p_f1 B.hqt.hrow_t1_q_f1 B.hqt.hrow_t1_t3_f1
        B.hrow_t2_f5_f2
        B.hrow_t2_p_f2 B.hrow_t2_q_f2 B.hrow_t3_f2_f1
        B.hrow_t3_p_f1 B.hrow_t3_t1_f1 B.hextra_f1_t2
  by_cases hf2_f3 :
      rows.pointOfChoice
          { source := U1Depth5.CriticalSource.t2, slot := 0 } =
        rows.pointOfChoice
          { source := U1Depth5.CriticalSource.f1, slot := 1 }
  · exact
      false_of_f1t2_extra_omit3_of_branch0_pairCollision
        rows hfixed hbase (Or.inr (Or.inr (Or.inr (Or.inl hf2_f3))))
        B.hrow_q_p_f1 B.hqt.hrow_q_t1_f1 B.hqt.hrow_q_t2_f1
        B.hqt.hrow_t1_p_f1 B.hqt.hrow_t1_q_f1 B.hqt.hrow_t1_t3_f1
        B.hrow_t2_f5_f2
        B.hrow_t2_p_f2 B.hrow_t2_q_f2 B.hrow_t3_f2_f1
        B.hrow_t3_p_f1 B.hrow_t3_t1_f1 B.hextra_f1_t2
  by_cases hf2_f4 :
      rows.pointOfChoice
          { source := U1Depth5.CriticalSource.t2, slot := 0 } =
        rows.pointOfChoice
          { source := U1Depth5.CriticalSource.f1, slot := 2 }
  · exact
      false_of_f1t2_extra_omit3_of_branch0_pairCollision
        rows hfixed hbase (Or.inr (Or.inr (Or.inr (Or.inr hf2_f4))))
        B.hrow_q_p_f1 B.hqt.hrow_q_t1_f1 B.hqt.hrow_q_t2_f1
        B.hqt.hrow_t1_p_f1 B.hqt.hrow_t1_q_f1 B.hqt.hrow_t1_t3_f1
        B.hrow_t2_f5_f2
        B.hrow_t2_p_f2 B.hrow_t2_q_f2 B.hrow_t3_f2_f1
        B.hrow_t3_p_f1 B.hrow_t3_t1_f1 B.hextra_f1_t2
  exact
    false_of_f1t2_extra_omit3_of_branch0_noCollision
      rows hfixed hbase B.noCollision hp_f2 hp_f3 hp_f4 hf2_f3 hf2_f4
      B.hrow_q_p_f1 B.hqt B.hrow_t2_f5_f2
      B.hrow_t2_p_f2 B.hrow_t2_q_f2 B.hrow_t3_f2_f1
      B.hrow_t3_p_f1 B.hrow_t3_t1_f1 B.hextra_f1_t2

/-- Direct branch-data consumer for the current branch0 producer surface.

This theorem is the explicit imported form of `Record001Branch0ProducerData`:
the no-collision branch together with the twelve non-hard packet-label hrows
and the `f1:t2` extra-incidence atom already suffices to contradict the banked
record001 branch-0 certificates. -/
theorem false_of_fields {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : U1Depth5.Plane}
    {rows : U1Depth5.CriticalSourceRows D baseQ baseT1 baseT2 baseT3 selectedU}
    (hfixed : U3FixedTriplePacket D baseQ baseP baseT1 baseT2 baseT3)
    (hbase :
      List.Pairwise (fun x y : U1Depth5.Plane => x ≠ y)
        [baseP, baseQ, baseT1, baseT2, baseT3, selectedU])
    (noCollision :
      U1Depth5.RowSlotLabelPacket.Record001Branch0NoCollision rows baseP)
    (hrow_q_p_f1 : dist baseQ baseP = dist baseQ selectedU)
    (hqt :
      U1Depth5.Record001QTFacingTransportRows
        baseP baseQ baseT1 baseT2 baseT3 selectedU)
    (hrow_t2_f5_f2 :
      dist baseT2
          (rows.pointOfChoice
            { source := U1Depth5.CriticalSource.t2, slot := 1 }) =
        dist baseT2
          (rows.pointOfChoice
            { source := U1Depth5.CriticalSource.t2, slot := 0 }))
    (hrow_t2_p_f2 :
      dist baseT2 baseP =
        dist baseT2
          (rows.pointOfChoice
            { source := U1Depth5.CriticalSource.t2, slot := 0 }))
    (hrow_t2_q_f2 :
      dist baseT2 baseQ =
        dist baseT2
          (rows.pointOfChoice
            { source := U1Depth5.CriticalSource.t2, slot := 0 }))
    (hrow_t3_f2_f1 :
      dist baseT3
          (rows.pointOfChoice
            { source := U1Depth5.CriticalSource.t2, slot := 0 }) =
        dist baseT3 selectedU)
    (hrow_t3_p_f1 : dist baseT3 baseP = dist baseT3 selectedU)
    (hrow_t3_t1_f1 : dist baseT3 baseT1 = dist baseT3 selectedU)
    (hextra_f1_t2 :
      dist selectedU baseT2 =
        dist selectedU
          (rows.pointOfChoice
            { source := U1Depth5.CriticalSource.t2, slot := 0 })) :
    False := by
  let B : Record001Branch0ProducerData rows baseP :=
    { noCollision := noCollision
      hrow_q_p_f1 := hrow_q_p_f1
      hqt := hqt
      hrow_t2_f5_f2 := hrow_t2_f5_f2
      hrow_t2_p_f2 := hrow_t2_p_f2
      hrow_t2_q_f2 := hrow_t2_q_f2
      hrow_t3_f2_f1 := hrow_t3_f2_f1
      hrow_t3_p_f1 := hrow_t3_p_f1
      hrow_t3_t1_f1 := hrow_t3_t1_f1
      hextra_f1_t2 := hextra_f1_t2 }
  exact B.false hfixed hbase

end Record001Branch0ProducerData

/-- Producer-facing bundle for the reduced record001 branch-0 collision-product
consumer.

This is the active no-collision theorem-facing surface after the `f1:t2`
collision-product shrink.  Unlike `Record001Branch0ProducerData`, it uses the
two branch-data equalities `f2 = f1[0]` and `p = f1[3]` instead of the older
`t2:f5=f2` and `t3:f2=f1` packet-label hrows, because those two rows are now
discharged internally on the no-collision side.  The current tree proves an
even stronger simplification: `Record001Branch0NoCollision` plus those two
equalities already contradicts directly via
`Record001Branch0NoCollision.false_of_f1Tail_source`, so this bundle is now
an over-strong packaging of the active no-collision lane rather than the
minimal contradiction surface. -/
structure Record001Branch0CollisionProductProducerData {D : CounterexampleData}
    {baseQ baseT1 baseT2 baseT3 selectedU : U1Depth5.Plane}
    (rows : U1Depth5.CriticalSourceRows D baseQ baseT1 baseT2 baseT3 selectedU)
    (baseP : U1Depth5.Plane) : Prop where
  noCollision :
    U1Depth5.RowSlotLabelPacket.Record001Branch0NoCollision rows baseP
  hocc_f2_f1_0 :
    rows.pointOfChoice
        { source := U1Depth5.CriticalSource.t2, slot := 0 } =
      (rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 0
  hfix_p_f1_3 :
    baseP = (rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 3
  hrow_q_p_f1 : dist baseQ baseP = dist baseQ selectedU
  hqt :
    U1Depth5.Record001QTFacingTransportRows
      baseP baseQ baseT1 baseT2 baseT3 selectedU
  hrow_t2_p_f2 :
    dist baseT2 baseP =
      dist baseT2
        (rows.pointOfChoice
          { source := U1Depth5.CriticalSource.t2, slot := 0 })
  hrow_t2_q_f2 :
    dist baseT2 baseQ =
      dist baseT2
        (rows.pointOfChoice
          { source := U1Depth5.CriticalSource.t2, slot := 0 })
  hrow_t3_p_f1 : dist baseT3 baseP = dist baseT3 selectedU
  hrow_t3_t1_f1 : dist baseT3 baseT1 = dist baseT3 selectedU
  hextra_f1_t2 :
    dist selectedU baseT2 =
      dist selectedU
        (rows.pointOfChoice
          { source := U1Depth5.CriticalSource.t2, slot := 0 })

namespace Record001Branch0CollisionProductProducerData

/-- Any complete producer bundle for the reduced record001 branch-0
collision-product surface contradicts the banked `f1:t2` no-collision
consumer. -/
theorem false {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : U1Depth5.Plane}
    {rows : U1Depth5.CriticalSourceRows D baseQ baseT1 baseT2 baseT3 selectedU}
    (B : Record001Branch0CollisionProductProducerData rows baseP)
    (hP_U : baseP ≠ selectedU) :
    False := by
  exact
    U1Depth5.RowSlotLabelPacket.Record001Branch0NoCollision.false_of_f1Tail_source
      B.noCollision hP_U B.hocc_f2_f1_0 B.hfix_p_f1_3

/-- Direct field-based form of
`Record001Branch0CollisionProductProducerData.false`. -/
theorem false_of_fields {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : U1Depth5.Plane}
    {rows : U1Depth5.CriticalSourceRows D baseQ baseT1 baseT2 baseT3 selectedU}
    (hP_U : baseP ≠ selectedU)
    (noCollision :
      U1Depth5.RowSlotLabelPacket.Record001Branch0NoCollision rows baseP)
    (hocc_f2_f1_0 :
      rows.pointOfChoice
          { source := U1Depth5.CriticalSource.t2, slot := 0 } =
        (rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 0)
    (hfix_p_f1_3 :
      baseP = (rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 3)
    (hrow_q_p_f1 : dist baseQ baseP = dist baseQ selectedU)
    (hqt :
      U1Depth5.Record001QTFacingTransportRows
        baseP baseQ baseT1 baseT2 baseT3 selectedU)
    (hrow_t2_p_f2 :
      dist baseT2 baseP =
        dist baseT2
          (rows.pointOfChoice
            { source := U1Depth5.CriticalSource.t2, slot := 0 }))
    (hrow_t2_q_f2 :
      dist baseT2 baseQ =
        dist baseT2
          (rows.pointOfChoice
            { source := U1Depth5.CriticalSource.t2, slot := 0 }))
    (hrow_t3_p_f1 : dist baseT3 baseP = dist baseT3 selectedU)
    (hrow_t3_t1_f1 : dist baseT3 baseT1 = dist baseT3 selectedU)
    (hextra_f1_t2 :
      dist selectedU baseT2 =
        dist selectedU
          (rows.pointOfChoice
            { source := U1Depth5.CriticalSource.t2, slot := 0 })) :
    False := by
  let _B : Record001Branch0CollisionProductProducerData rows baseP :=
    { noCollision := noCollision
      hocc_f2_f1_0 := hocc_f2_f1_0
      hfix_p_f1_3 := hfix_p_f1_3
      hrow_q_p_f1 := hrow_q_p_f1
      hqt := hqt
      hrow_t2_p_f2 := hrow_t2_p_f2
      hrow_t2_q_f2 := hrow_t2_q_f2
      hrow_t3_p_f1 := hrow_t3_p_f1
      hrow_t3_t1_f1 := hrow_t3_t1_f1
      hextra_f1_t2 := hextra_f1_t2 }
  exact
    U1Depth5.RowSlotLabelPacket.Record001Branch0NoCollision.false_of_f1Tail_source
      noCollision hP_U hocc_f2_f1_0 hfix_p_f1_3

end Record001Branch0CollisionProductProducerData

/-- Stronger scratch/artifact producer surface for the record001 branch-0
`f1:t2` lane.

This mirrors the scratch `source_core_facts()` contract used by the mining
scripts.  It is intentionally stronger than the minimal live target
`f2 = f1[0]` and `p = f1[3]`: besides those two branch equalities, it also
packages the q/t1 source-row placements, residual rows, q/t1 slot equalities,
and the live `f1:t2` extra-incidence atom.  It is a shared landing pad for
solver/emitter work, not a claim that the live blocker-centered
`CriticalSourceRows` theorem already produces these facts. -/
structure Record001Branch0SourceCoreProducerData {D : CounterexampleData}
    {baseQ baseT1 baseT2 baseT3 selectedU : U1Depth5.Plane}
    (rows : U1Depth5.CriticalSourceRows D baseQ baseT1 baseT2 baseT3 selectedU)
    (baseP : U1Depth5.Plane) : Prop where
  hocc_f2_f1_0 :
    rows.pointOfChoice
        { source := U1Depth5.CriticalSource.t2, slot := 0 } =
      (rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 0
  hfix_p_f1_3 :
    baseP = (rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 3
  hfix_t1_q_2 :
    baseT1 = (rows.rowAt U1Depth5.CriticalSource.q).slotPoint 2
  hfix_f1_q_0 :
    selectedU = (rows.rowAt U1Depth5.CriticalSource.q).slotPoint 0
  hfix_t2_q_3 :
    baseT2 = (rows.rowAt U1Depth5.CriticalSource.q).slotPoint 3
  hfix_p_t1_1 :
    baseP = (rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 1
  hfix_f1_t1_0 :
    selectedU = (rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 0
  hfix_q_t1_2 :
    baseQ = (rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 2
  hfix_t3_t1_3 :
    baseT3 = (rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 3
  hrow_12 : dist baseQ baseP = dist baseQ selectedU
  hrow_20 :
    dist baseT2 ((rows.rowAt U1Depth5.CriticalSource.t2).slotPoint 1) =
      dist baseT2 ((rows.rowAt U1Depth5.CriticalSource.t2).slotPoint 0)
  hrow_21 :
    dist baseT2 baseP =
      dist baseT2 ((rows.rowAt U1Depth5.CriticalSource.t2).slotPoint 0)
  hrow_22 :
    dist baseT2 baseQ =
      dist baseT2 ((rows.rowAt U1Depth5.CriticalSource.t2).slotPoint 0)
  hrow_24 :
    dist baseT3 ((rows.rowAt U1Depth5.CriticalSource.t2).slotPoint 0) =
      dist baseT3 selectedU
  hrow_25 : dist baseT3 baseP = dist baseT3 selectedU
  hrow_26 : dist baseT3 baseT1 = dist baseT3 selectedU
  hslot_q_t1_f1 :
    dist baseQ ((rows.rowAt U1Depth5.CriticalSource.q).slotPoint 2) =
      dist baseQ ((rows.rowAt U1Depth5.CriticalSource.q).slotPoint 0)
  hslot_q_t2_f1 :
    dist baseQ ((rows.rowAt U1Depth5.CriticalSource.q).slotPoint 3) =
      dist baseQ ((rows.rowAt U1Depth5.CriticalSource.q).slotPoint 0)
  hslot_t1_p_f1 :
    dist baseT1 ((rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 1) =
      dist baseT1 ((rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 0)
  hslot_t1_q_f1 :
    dist baseT1 ((rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 2) =
      dist baseT1 ((rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 0)
  hslot_t1_t3_f1 :
    dist baseT1 ((rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 3) =
      dist baseT1 ((rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 0)
  hextra_f1_t2 :
    dist selectedU baseT2 =
      dist selectedU ((rows.rowAt U1Depth5.CriticalSource.t2).slotPoint 0)

namespace Record001Branch0Payload

/-- Under the `f1:t2` packet-label extra-incidence atom, the three record001
hard-`f1` rows are supplied by the product cycle:

* product endpoints give `P ∨ A` and `P ∨ B`;
* the P seed gives `A -> B -> P`;
* the support rows give `P -> A` and `P -> B`.

Here `A = hslot_f1_f3_f2`, `B = hslot_f1_f4_f2`, and
`P = hslot_f1_p_f2`. -/
theorem false_of_f1t2_extra_omit3
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
    (hextra_f1_t2 :
      dist (payload.packet.point U1Depth5.f1)
          (payload.packet.point U1Depth5.t2) =
        dist (payload.packet.point U1Depth5.f1)
          (payload.packet.point U1Depth5.f2)) :
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
  have hqt :
      U1Depth5.Record001QTFacingTransportRows
        (payload.packet.point U1Depth5.p) (payload.packet.point U1Depth5.q)
        (payload.packet.point U1Depth5.t1) (payload.packet.point U1Depth5.t2)
        (payload.packet.point U1Depth5.t3) (payload.packet.point U1Depth5.f1) := by
    exact
      payload.packet.record001QTFacingTransportRows
        hpt_t1_q_2 hpt_f1_q_0 hpt_t2_q_3 hpt_p_t1_1 hpt_f1_t1_0
        hpt_q_t1_2 hpt_t3_t1_3 hslot_q_t1_f1 hslot_q_t2_f1
        hslot_t1_p_f1 hslot_t1_q_f1 hslot_t1_t3_f1
  have hprod_pa :
      dist (payload.packet.point U1Depth5.f1)
          (payload.packet.point U1Depth5.p) =
        dist (payload.packet.point U1Depth5.f1)
          (payload.packet.point U1Depth5.f2) ∨
      dist (payload.packet.point U1Depth5.f1)
          (payload.packet.point U1Depth5.f3) =
        dist (payload.packet.point U1Depth5.f1)
          (payload.packet.point U1Depth5.f2) :=
    cert_00001_f9db3a3c66ba3ed2_hslot_f1_p_f2_or_hslot_f1_f3_f2_of_row_slot_packet
      payload.packet hrow_0 hrow_1 hrow_2 payload.hrow_12
      hqt.hrow_q_t1_f1 hqt.hrow_q_t2_f1 hqt.hrow_t1_p_f1
      hqt.hrow_t1_q_f1 hqt.hrow_t1_t3_f1 payload.hrow_20 payload.hrow_21 payload.hrow_22
      payload.hrow_24 payload.hrow_25 payload.hrow_26 hextra_f1_t2
  have hprod_pb :
      dist (payload.packet.point U1Depth5.f1)
          (payload.packet.point U1Depth5.p) =
        dist (payload.packet.point U1Depth5.f1)
          (payload.packet.point U1Depth5.f2) ∨
      dist (payload.packet.point U1Depth5.f1)
          (payload.packet.point U1Depth5.f4) =
        dist (payload.packet.point U1Depth5.f1)
          (payload.packet.point U1Depth5.f2) :=
    cert_00001_4be28408170103ef_hslot_f1_p_f2_or_hslot_f1_f4_f2_of_row_slot_packet
      payload.packet hrow_0 hrow_1 hrow_2 payload.hrow_12
      hqt.hrow_q_t1_f1 hqt.hrow_q_t2_f1 hqt.hrow_t1_p_f1
      hqt.hrow_t1_q_f1 hqt.hrow_t1_t3_f1 payload.hrow_20 payload.hrow_21 payload.hrow_22
      payload.hrow_24 payload.hrow_25 payload.hrow_26 hextra_f1_t2
  have hrow_6 :
      dist (payload.packet.point U1Depth5.f1)
          (payload.packet.point U1Depth5.p) =
        dist (payload.packet.point U1Depth5.f1)
          (payload.packet.point U1Depth5.f2) := by
    by_cases hP :
        dist (payload.packet.point U1Depth5.f1)
            (payload.packet.point U1Depth5.p) =
          dist (payload.packet.point U1Depth5.f1)
            (payload.packet.point U1Depth5.f2)
    · exact hP
    · rcases hprod_pa with hP' | hA
      · exact False.elim (hP hP')
      rcases hprod_pb with hP'' | hB
      · exact False.elim (hP hP'')
      exact
        cert_00001_173424fd500c50ea_hslot_f1_p_f2_of_row_slot_packet
          payload.packet hrow_0 hrow_1 hrow_2 hA hB payload.hrow_12
          hqt.hrow_t1_p_f1 hqt.hrow_t1_q_f1
          payload.hrow_20 payload.hrow_21 payload.hrow_22
          payload.hrow_24 payload.hrow_25 payload.hrow_26 hextra_f1_t2
  have hrow_4 :
      dist (payload.packet.point U1Depth5.f1)
          (payload.packet.point U1Depth5.f3) =
        dist (payload.packet.point U1Depth5.f1)
          (payload.packet.point U1Depth5.f2) :=
    cert_00001_f80a3e310cfe6dbb_hslot_f1_f3_f2_of_row_slot_packet
      payload.packet hrow_0 hrow_1 hrow_2 hrow_6 payload.hrow_12 hqt.hrow_q_t2_f1
      hqt.hrow_t1_p_f1 hqt.hrow_t1_q_f1 payload.hrow_20 payload.hrow_21 payload.hrow_22
      payload.hrow_24 payload.hrow_25 payload.hrow_26 hextra_f1_t2
  have hrow_5 :
      dist (payload.packet.point U1Depth5.f1)
          (payload.packet.point U1Depth5.f4) =
        dist (payload.packet.point U1Depth5.f1)
          (payload.packet.point U1Depth5.f2) :=
    cert_00001_bbb8733e43de2265_hslot_f1_f4_f2_of_row_slot_packet
      payload.packet hrow_0 hrow_1 hrow_2 hrow_6 payload.hrow_12 hqt.hrow_q_t2_f1
      hqt.hrow_t1_p_f1 hqt.hrow_t1_q_f1 payload.hrow_20 payload.hrow_21 payload.hrow_22
      payload.hrow_24 payload.hrow_25 payload.hrow_26 hextra_f1_t2
  exact
    cert_00001_f46a07c8af1969fd_false_of_row_slot_packet
      hfixed payload.packet hrow_4 hrow_5 hrow_6 payload.hrow_12
      hqt.hrow_q_t1_f1 hqt.hrow_q_t2_f1 hqt.hrow_t1_p_f1
      hqt.hrow_t1_q_f1 hqt.hrow_t1_t3_f1 payload.hrow_20 payload.hrow_21
      payload.hrow_22 payload.hrow_24 payload.hrow_25 payload.hrow_26

/-- Reduced payload-side close for the active `f1:t2` collision-product lane.

The record001 payload already fixes the branch-0 row-slot choices and carries
packet injectivity, so after replaying the five q/t1 transport hrows it also
supplies the no-collision branch data and the five complementary inequalities
needed by the smaller manifest-label collision-product consumer. -/
theorem false_of_f1t2_collision_product
    {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : U1Depth5.Plane}
    {rows : U1Depth5.CriticalSourceRows D baseQ baseT1 baseT2 baseT3 selectedU}
    (hfixed : U3FixedTriplePacket D baseQ baseP baseT1 baseT2 baseT3)
    (hbase :
      List.Pairwise (fun x y : U1Depth5.Plane => x ≠ y)
        [baseP, baseQ, baseT1, baseT2, baseT3, selectedU])
    (payload :
      Record001Branch0Payload (D := D) (baseP := baseP) (baseQ := baseQ)
        (baseT1 := baseT1) (baseT2 := baseT2) (baseT3 := baseT3)
        (selectedU := selectedU) rows)
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
          ((payload.packet.rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 0))
    (hextra_f1_t2 :
      dist (payload.packet.point U1Depth5.f1)
          (payload.packet.point U1Depth5.t2) =
        dist (payload.packet.point U1Depth5.f1)
          (payload.packet.point U1Depth5.f2)) :
    False := by
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
  have hslot_q_t2_f1 :
      dist (payload.packet.point U1Depth5.q)
          ((payload.packet.rows.rowAt U1Depth5.CriticalSource.q).slotPoint 3) =
        dist (payload.packet.point U1Depth5.q)
          ((payload.packet.rows.rowAt U1Depth5.CriticalSource.q).slotPoint 0) := by
    simpa [payload.hfix_t2_q_3, payload.hfix_f1_q_0] using
      cert_00001_1ca0a033ec4ff97b_hslot_q_t2_f1_of_row_slot_packet
        payload.packet hrow_0 hrow_1 hrow_2 payload.hrow_12 payload.hrow_20
        payload.hrow_21 payload.hrow_22 payload.hrow_24 payload.hrow_25
        payload.hrow_26 hextra_f1_t2
  have hNoCollision := payload.noCollision
  have hqt :
      U1Depth5.Record001QTFacingTransportRows
        (payload.packet.point U1Depth5.p) (payload.packet.point U1Depth5.q)
        (payload.packet.point U1Depth5.t1) (payload.packet.point U1Depth5.t2)
        (payload.packet.point U1Depth5.t3) (payload.packet.point U1Depth5.f1) := by
    exact
      payload.record001QTFacingTransportRows
        hslot_q_t1_f1 hslot_q_t2_f1 hslot_t1_p_f1
        hslot_t1_q_f1 hslot_t1_t3_f1
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
  have hp_f2 :
      payload.packet.point U1Depth5.p ≠
        rows.pointOfChoice { source := U1Depth5.CriticalSource.t2, slot := 0 } := by
    simpa [hpt_f2_t20] using
      payload.packet.point_ne_of_label_ne (by decide : U1Depth5.p ≠ U1Depth5.f2)
  have hp_f3 :
      payload.packet.point U1Depth5.p ≠
        rows.pointOfChoice { source := U1Depth5.CriticalSource.f1, slot := 1 } := by
    simpa [hpt_f3_f11] using
      payload.packet.point_ne_of_label_ne (by decide : U1Depth5.p ≠ U1Depth5.f3)
  have hp_f4 :
      payload.packet.point U1Depth5.p ≠
        rows.pointOfChoice { source := U1Depth5.CriticalSource.f1, slot := 2 } := by
    simpa [hpt_f4_f12] using
      payload.packet.point_ne_of_label_ne (by decide : U1Depth5.p ≠ U1Depth5.f4)
  have hf2_f3 :
      rows.pointOfChoice { source := U1Depth5.CriticalSource.t2, slot := 0 } ≠
        rows.pointOfChoice { source := U1Depth5.CriticalSource.f1, slot := 1 } := by
    simpa [hpt_f2_t20, hpt_f3_f11] using
      payload.packet.point_ne_of_label_ne (by decide : U1Depth5.f2 ≠ U1Depth5.f3)
  have hf2_f4 :
      rows.pointOfChoice { source := U1Depth5.CriticalSource.t2, slot := 0 } ≠
        rows.pointOfChoice { source := U1Depth5.CriticalSource.f1, slot := 2 } := by
    simpa [hpt_f2_t20, hpt_f4_f12] using
      payload.packet.point_ne_of_label_ne (by decide : U1Depth5.f2 ≠ U1Depth5.f4)
  exact
    false_of_f1t2_collision_product_of_branch0_noCollision
      rows hfixed hbase hNoCollision hp_f2 hp_f3 hp_f4 hf2_f3 hf2_f4
      payload.hrow_12 hqt
      (by simpa [hpt_f2_t20] using payload.hrow_21)
      (by simpa [hpt_f2_t20] using payload.hrow_22)
      payload.hrow_25 payload.hrow_26
      (by simpa [hpt_f2_t20] using hextra_f1_t2)
end Record001Branch0Payload

namespace Record001Branch0Collision

/-- Collision-side sink for the branch-0 `f1:t2` extra-incidence adapter.

Each named collision contradicts either one of the live cross-distinctness
assumptions, the remaining `p ≠ f5` tail fact, or one of the two same-row `f1`
inequalities. -/
theorem false_of_f1t2_extra_omit3_collision
    {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : U1Depth5.Plane}
    {rows : U1Depth5.CriticalSourceRows D baseQ baseT1 baseT2 baseT3 selectedU}
    (hcrossNoP :
      ∀ a ∈ [baseQ, baseT1, baseT2, baseT3, selectedU],
        ∀ b ∈ [(rows.rowAt U1Depth5.CriticalSource.t2).slotPoint 0,
          (rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 1,
          (rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 2,
          (rows.rowAt U1Depth5.CriticalSource.t2).slotPoint 1], a ≠ b)
    (hp_f5 :
      baseP ≠ (rows.rowAt U1Depth5.CriticalSource.t2).slotPoint 1)
    (hf11_t21 :
      (rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 1 ≠
        (rows.rowAt U1Depth5.CriticalSource.t2).slotPoint 1)
    (hf12_t21 :
      (rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 2 ≠
        (rows.rowAt U1Depth5.CriticalSource.t2).slotPoint 1)
  (hCollision :
      U1Depth5.RowSlotLabelPacket.Record001Branch0Collision rows baseP) :
    False := by
  let sp_t2_0 : U1Depth5.Plane := (rows.rowAt U1Depth5.CriticalSource.t2).slotPoint 0
  let sp_f1_1 : U1Depth5.Plane := (rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 1
  let sp_f1_2 : U1Depth5.Plane := (rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 2
  let sp_t2_1 : U1Depth5.Plane := (rows.rowAt U1Depth5.CriticalSource.t2).slotPoint 1
  have hbaseQ_mem : baseQ ∈ [baseQ, baseT1, baseT2, baseT3, selectedU] := by
    simp only [List.mem_cons, List.not_mem_nil, or_false, true_or]
  have hbaseT1_mem : baseT1 ∈ [baseQ, baseT1, baseT2, baseT3, selectedU] := by
    simp only [List.mem_cons, List.not_mem_nil, or_false, true_or, or_true]
  have hbaseT2_mem : baseT2 ∈ [baseQ, baseT1, baseT2, baseT3, selectedU] := by
    simp only [List.mem_cons, List.not_mem_nil, or_false, true_or, or_true]
  have hbaseT3_mem : baseT3 ∈ [baseQ, baseT1, baseT2, baseT3, selectedU] := by
    simp only [List.mem_cons, List.not_mem_nil, or_false, true_or, or_true]
  have hselectedU_mem : selectedU ∈ [baseQ, baseT1, baseT2, baseT3, selectedU] := by
    simp only [List.mem_cons, List.not_mem_nil, or_false, or_true]
  have ht2_q_f1_mem : sp_t2_0 ∈ [sp_t2_0, sp_f1_1, sp_f1_2, sp_t2_1] := by
    simp only [List.mem_cons, List.not_mem_nil, or_false, true_or]
  have hf1_0_mem : sp_f1_1 ∈ [sp_t2_0, sp_f1_1, sp_f1_2, sp_t2_1] := by
    simp only [List.mem_cons, List.not_mem_nil, or_false, true_or, or_true]
  have hf1_1_mem : sp_f1_2 ∈ [sp_t2_0, sp_f1_1, sp_f1_2, sp_t2_1] := by
    simp only [List.mem_cons, List.not_mem_nil, or_false, true_or, or_true]
  have ht2_1_mem : sp_t2_1 ∈ [sp_t2_0, sp_f1_1, sp_f1_2, sp_t2_1] := by
    simp only [List.mem_cons, List.not_mem_nil, or_false, or_true]
  cases hCollision with
  | q_t20 h =>
      exact (hcrossNoP baseQ hbaseQ_mem sp_t2_0 ht2_q_f1_mem) h
  | q_f11 h =>
      exact (hcrossNoP baseQ hbaseQ_mem sp_f1_1 hf1_0_mem) h
  | q_f12 h =>
      exact (hcrossNoP baseQ hbaseQ_mem sp_f1_2 hf1_1_mem) h
  | q_t21 h =>
      exact (hcrossNoP baseQ hbaseQ_mem sp_t2_1 ht2_1_mem) h
  | t1_t20 h =>
      exact (hcrossNoP baseT1 hbaseT1_mem sp_t2_0 ht2_q_f1_mem) h
  | t1_f11 h =>
      exact (hcrossNoP baseT1 hbaseT1_mem sp_f1_1 hf1_0_mem) h
  | t1_f12 h =>
      exact (hcrossNoP baseT1 hbaseT1_mem sp_f1_2 hf1_1_mem) h
  | t1_t21 h =>
      exact (hcrossNoP baseT1 hbaseT1_mem sp_t2_1 ht2_1_mem) h
  | t2_t20 h =>
      exact (hcrossNoP baseT2 hbaseT2_mem sp_t2_0 ht2_q_f1_mem) h
  | t2_f11 h =>
      exact (hcrossNoP baseT2 hbaseT2_mem sp_f1_1 hf1_0_mem) h
  | t2_f12 h =>
      exact (hcrossNoP baseT2 hbaseT2_mem sp_f1_2 hf1_1_mem) h
  | t2_t21 h =>
      exact (hcrossNoP baseT2 hbaseT2_mem sp_t2_1 ht2_1_mem) h
  | t3_t20 h =>
      exact (hcrossNoP baseT3 hbaseT3_mem sp_t2_0 ht2_q_f1_mem) h
  | t3_f11 h =>
      exact (hcrossNoP baseT3 hbaseT3_mem sp_f1_1 hf1_0_mem) h
  | t3_f12 h =>
      exact (hcrossNoP baseT3 hbaseT3_mem sp_f1_2 hf1_1_mem) h
  | t3_t21 h =>
      exact (hcrossNoP baseT3 hbaseT3_mem sp_t2_1 ht2_1_mem) h
  | u_t20 h =>
      exact (hcrossNoP selectedU hselectedU_mem sp_t2_0 ht2_q_f1_mem) h
  | u_f11 h =>
      exact (hcrossNoP selectedU hselectedU_mem sp_f1_1 hf1_0_mem) h
  | u_f12 h =>
      exact (hcrossNoP selectedU hselectedU_mem sp_f1_2 hf1_1_mem) h
  | u_t21 h =>
      exact (hcrossNoP selectedU hselectedU_mem sp_t2_1 ht2_1_mem) h
  | p_t21 h =>
      exact hp_f5 h
  | f11_t21 h =>
      exact hf11_t21 h
  | f12_t21 h =>
      exact hf12_t21 h

/-- The branch-0 `f1` source-row contradiction closes the `f1:t2`
extra-incidence surface before any collision-sink side conditions are needed. -/
theorem false_of_f1t2_extra_omit3_f1_tail_source
    {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : U1Depth5.Plane}
    {rows : U1Depth5.CriticalSourceRows D baseQ baseT1 baseT2 baseT3 selectedU}
    (hbase :
      List.Pairwise (fun x y : U1Depth5.Plane => x ≠ y)
        [baseP, baseQ, baseT1, baseT2, baseT3, selectedU])
    (hU_t20 :
      selectedU ≠ (rows.rowAt U1Depth5.CriticalSource.t2).slotPoint 0)
    (hU_f11 :
      selectedU ≠ (rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 1)
    (hU_f12 :
      selectedU ≠ (rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 2)
    (hocc_f2_f1_0 :
      rows.pointOfChoice { source := U1Depth5.CriticalSource.t2, slot := 0 } =
        (rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 0)
    (hfix_p_f1_3 :
      baseP = (rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 3) :
    False := by
  exact
    U1Depth5.CriticalSourceRows.record001Branch0_f1Tail_absurd_of_selectedU_ne
      rows hbase hU_t20 hU_f11 hU_f12 hocc_f2_f1_0 hfix_p_f1_3

/-- Direct-extra replay for the three record001 branch-0 `f1` source-label
collision cases.

The source row for `f1` must place `selectedU` in one of
`t2[0]`, `f1[1]`, or `f1[2]`.  Each equality is discharged by the
direct-extra source-UNIT certificate that uses the live `f1:t2` distance atom,
rather than by assuming those collisions impossible. -/
theorem false_of_f1t2_extra_omit3_f1_tail_source_direct_extra
    {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : U1Depth5.Plane}
    {rows : U1Depth5.CriticalSourceRows D baseQ baseT1 baseT2 baseT3 selectedU}
    (hfixed : U3FixedTriplePacket D baseQ baseP baseT1 baseT2 baseT3)
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
    (hrow_26 : dist baseT3 baseT1 = dist baseT3 selectedU)
    (hslot_q_t1_f1 :
      dist baseQ ((rows.rowAt U1Depth5.CriticalSource.q).slotPoint 2) =
        dist baseQ ((rows.rowAt U1Depth5.CriticalSource.q).slotPoint 0))
    (hslot_q_t2_f1 :
      dist baseQ ((rows.rowAt U1Depth5.CriticalSource.q).slotPoint 3) =
        dist baseQ ((rows.rowAt U1Depth5.CriticalSource.q).slotPoint 0))
    (hslot_t1_p_f1 :
      dist baseT1 ((rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 1) =
        dist baseT1 ((rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 0))
    (hslot_t1_q_f1 :
      dist baseT1 ((rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 2) =
        dist baseT1 ((rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 0))
    (hslot_t1_t3_f1 :
      dist baseT1 ((rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 3) =
        dist baseT1 ((rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 0))
    (hextra_f1_t2 :
      dist selectedU baseT2 =
        dist selectedU
          ((rows.rowAt U1Depth5.CriticalSource.t2).slotPoint 0)) :
    False := by
  have hbase' := hbase
  simp only [List.pairwise_cons, List.mem_cons, List.not_mem_nil, or_false,
    forall_eq_or_imp, forall_eq, IsEmpty.forall_iff, implies_true,
    List.Pairwise.nil, and_true] at hbase'
  rcases hbase' with ⟨⟨hpq, _, _, _, _⟩, _, _, _, _⟩
  let f2 : U1Depth5.Plane :=
    (rows.rowAt U1Depth5.CriticalSource.t2).slotPoint 0
  let f3 : U1Depth5.Plane :=
    (rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 1
  let f4 : U1Depth5.Plane :=
    (rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 2
  let f5 : U1Depth5.Plane :=
    (rows.rowAt U1Depth5.CriticalSource.t2).slotPoint 1
  let ν : ℕ → ℝ
    | 0 => normalAxis baseP baseQ selectedU 0
    | 1 => normalAxis baseP baseQ selectedU 1
    | 2 => normalAxis baseP baseQ f2 0
    | 3 => normalAxis baseP baseQ f2 1
    | 4 => normalAxis baseP baseQ f3 0
    | 5 => normalAxis baseP baseQ f3 1
    | 6 => normalAxis baseP baseQ f4 0
    | 7 => normalAxis baseP baseQ f4 1
    | 8 => normalAxis baseP baseQ f5 0
    | 9 => normalAxis baseP baseQ f5 1
    | 10 => normalAxis baseP baseQ baseT1 0
    | 11 => normalAxis baseP baseQ baseT1 1
    | 12 => normalAxis baseP baseQ baseT2 0
    | 13 => normalAxis baseP baseQ baseT2 1
    | 14 => normalAxis baseP baseQ baseT3 0
    | 15 => normalAxis baseP baseQ baseT3 1
    | 17 => 1
    | 18 => 1
    | 19 => coordSqDist (normalAxis baseP baseQ baseT1)
        (normalAxis baseP baseQ selectedU)
    | 20 => coordSqDist (normalAxis baseP baseQ baseT2)
        (normalAxis baseP baseQ f2)
    | 21 => coordSqDist (normalAxis baseP baseQ baseT3)
        (normalAxis baseP baseQ selectedU)
    | _ => 0
  have hq_t1 : dist baseQ baseP = dist baseQ baseT1 := by
    have hslot : dist baseQ baseT1 = dist baseQ selectedU := by
      simpa [hfix_t1_q_2, hfix_f1_q_0] using hslot_q_t1_f1
    exact hrow_12.trans hslot.symm
  have hq_t2 : dist baseQ baseP = dist baseQ baseT2 := by
    have hslot : dist baseQ baseT2 = dist baseQ selectedU := by
      simpa [hfix_t2_q_3, hfix_f1_q_0] using hslot_q_t2_f1
    exact hrow_12.trans hslot.symm
  have ht1_p : dist baseT1 baseP = dist baseT1 selectedU := by
    simpa [hfix_p_t1_1, hfix_f1_t1_0] using hslot_t1_p_f1
  have ht1_q : dist baseT1 baseQ = dist baseT1 selectedU := by
    simpa [hfix_q_t1_2, hfix_f1_t1_0] using hslot_t1_q_f1
  have ht1_t3 : dist baseT1 baseT3 = dist baseT1 selectedU := by
    simpa [hfix_t3_t1_3, hfix_f1_t1_0] using hslot_t1_t3_f1
  have hfact_0 : ν 10 ^ 2 + ν 11 ^ 2 = 1 := by
    simpa [ν] using
      Problem97.normalAxis_sqnorm_coord_eq_one_of_dist_eq hpq
        hfixed.t1_same_radius
  have hfact_1 : ν 12 ^ 2 + ν 13 ^ 2 = 1 := by
    simpa [ν] using
      Problem97.normalAxis_sqnorm_coord_eq_one_of_dist_eq hpq
        hfixed.t2_same_radius
  have hfact_2 : ν 14 ^ 2 + ν 15 ^ 2 = 1 := by
    simpa [ν] using
      Problem97.normalAxis_sqnorm_coord_eq_one_of_dist_eq hpq
        hfixed.t3_same_radius
  have hfact_3 : ν 17 = 1 := by
    simp [ν]
  have hfact_4 : ν 10 ^ 2 + ν 11 ^ 2 = ν 17 := by
    simpa [ν] using hfact_0
  have hfact_5 : ν 12 ^ 2 + ν 13 ^ 2 = ν 17 := by
    simpa [ν] using hfact_1
  have hfact_6 : ν 14 ^ 2 + ν 15 ^ 2 = ν 17 := by
    simpa [ν] using hfact_2
  have hfact_7 : (ν 0 - 1) ^ 2 + ν 1 ^ 2 = ν 18 := by
    have hcoord :=
      Problem97.normalAxis_coordSqDist_witness_eq_one_of_dist_eq hpq
        hrow_12
    rw [Problem97.normalAxis_witness hpq] at hcoord
    dsimp [coordSqDist] at hcoord
    calc
      (ν 0 - 1) ^ 2 + ν 1 ^ 2 =
          (1 - (normalAxis baseP baseQ selectedU) 0) ^ 2 +
            (0 - (normalAxis baseP baseQ selectedU) 1) ^ 2 := by
        simp [ν]
        ring
      _ = 1 := hcoord
  have hfact_8 : ν 18 = 1 := by
    simp [ν]
  have hfact_9 : (ν 10 - 1) ^ 2 + ν 11 ^ 2 = ν 18 := by
    have hcoord :=
      Problem97.normalAxis_coordSqDist_witness_eq_one_of_dist_eq hpq hq_t1
    rw [Problem97.normalAxis_witness hpq] at hcoord
    dsimp [coordSqDist] at hcoord
    calc
      (ν 10 - 1) ^ 2 + ν 11 ^ 2 =
          (1 - (normalAxis baseP baseQ baseT1) 0) ^ 2 +
            (0 - (normalAxis baseP baseQ baseT1) 1) ^ 2 := by
        simp [ν]
        ring
      _ = 1 := hcoord
  have hfact_10 : (ν 12 - 1) ^ 2 + ν 13 ^ 2 = ν 18 := by
    have hcoord :=
      Problem97.normalAxis_coordSqDist_witness_eq_one_of_dist_eq hpq hq_t2
    rw [Problem97.normalAxis_witness hpq] at hcoord
    dsimp [coordSqDist] at hcoord
    calc
      (ν 12 - 1) ^ 2 + ν 13 ^ 2 =
          (1 - (normalAxis baseP baseQ baseT2) 0) ^ 2 +
            (0 - (normalAxis baseP baseQ baseT2) 1) ^ 2 := by
        simp [ν]
        ring
      _ = 1 := hcoord
  have hfact_11 : (ν 10 - ν 0) ^ 2 + (ν 11 - ν 1) ^ 2 = ν 19 := by
    simp [ν, coordSqDist]
  have hfact_12 : ν 10 ^ 2 + ν 11 ^ 2 = ν 19 := by
    simpa [ν] using
      Problem97.normalAxis_sqnorm_eq_coordSqDist_of_dist_eq hpq ht1_p
  have hfact_13 : (ν 10 - 1) ^ 2 + ν 11 ^ 2 = ν 19 := by
    simpa [ν] using
      Problem97.normalAxis_unitX_sqdist_eq_coordSqDist_of_dist_eq hpq ht1_q
  have hfact_14 : (ν 10 - ν 14) ^ 2 + (ν 11 - ν 15) ^ 2 = ν 19 := by
    have hcoord :=
      Problem97.normalAxis_coord_sqdist_eq_of_dist_eq hpq ht1_t3
    simpa [ν, coordSqDist] using hcoord
  have hfact_15 : (ν 12 - ν 2) ^ 2 + (ν 13 - ν 3) ^ 2 = ν 20 := by
    simp [ν, coordSqDist]
  have hfact_16 : (ν 12 - ν 8) ^ 2 + (ν 13 - ν 9) ^ 2 = ν 20 := by
    have hcoord :=
      Problem97.normalAxis_coord_sqdist_eq_of_dist_eq hpq (by
        simpa [f2, f5] using hrow_20)
    simpa [ν, coordSqDist] using hcoord
  have hfact_17 : ν 12 ^ 2 + ν 13 ^ 2 = ν 20 := by
    simpa [ν, f2] using
      Problem97.normalAxis_sqnorm_eq_coordSqDist_of_dist_eq hpq hrow_21
  have hfact_18 : (ν 12 - 1) ^ 2 + ν 13 ^ 2 = ν 20 := by
    simpa [ν, f2] using
      Problem97.normalAxis_unitX_sqdist_eq_coordSqDist_of_dist_eq hpq hrow_22
  have hfact_19 : (ν 14 - ν 0) ^ 2 + (ν 15 - ν 1) ^ 2 = ν 21 := by
    simp [ν, coordSqDist]
  have hfact_20 : (ν 14 - ν 2) ^ 2 + (ν 15 - ν 3) ^ 2 = ν 21 := by
    have hcoord :=
      Problem97.normalAxis_coord_sqdist_eq_of_dist_eq hpq (by
        simpa [f2] using hrow_24)
    simpa [ν, coordSqDist] using hcoord
  have hfact_21 : ν 14 ^ 2 + ν 15 ^ 2 = ν 21 := by
    simpa [ν] using
      Problem97.normalAxis_sqnorm_eq_coordSqDist_of_dist_eq hpq hrow_25
  have hfact_22 : (ν 14 - ν 10) ^ 2 + (ν 15 - ν 11) ^ 2 = ν 21 := by
    have hcoord :=
      Problem97.normalAxis_coord_sqdist_eq_of_dist_eq hpq hrow_26
    simpa [ν, coordSqDist] using hcoord
  have hfact_25 :
      U5GramCert.eval ν
          ((U5GramCert.coordSqDistPoly 0 1 12 13) ++
            U5GramCert.neg (U5GramCert.coordSqDistPoly 0 1 2 3)) = 0 := by
    have hcoord :=
      Problem97.normalAxis_coord_sqdist_eq_of_dist_eq hpq (by
        simpa [f2] using hextra_f1_t2)
    rw [U5GramCert.eval_append, U5GramCert.eval_neg,
      U5GramCert.eval_coordSqDistPoly, U5GramCert.eval_coordSqDistPoly]
    dsimp [ν, coordSqDist, f2, U1Depth5.CriticalRowPacket.slotPoint]
      at hcoord ⊢
    rw [hcoord]
    ring_nf
  rcases U1Depth5.RowSlotLabelPacket.record001Branch0_f1Tail_source_cases
      rows
      (U1Depth5.baseP_ne_selectedU_of_baseSixPairwise hbase)
      hocc_f2_f1_0 hfix_p_f1_3 with hU_t20 | hU_f11 | hU_f12
  · have hfact_23 :
        U5GramCert.eval ν
          [([0, 0, 1], (-1 : ℚ)), ([1], (1 : ℚ))] = 0 := by
      simp [U5GramCert.eval, U5GramCert.evalMono, ν, f2, hU_t20]
    have hfact_24 :
        U5GramCert.eval ν
          [([0, 0, 0, 1], (-1 : ℚ)), ([0, 1], (1 : ℚ))] = 0 := by
      simp [U5GramCert.eval, U5GramCert.evalMono, ν, f2, hU_t20]
    exact
      cert_00003_4c284c3dc2e96ac3_false_of_semantic_equalities ν
        hfact_0 hfact_1 hfact_2 hfact_3 hfact_4 hfact_5 hfact_6
        hfact_7 hfact_8 hfact_9 hfact_10 hfact_11 hfact_12 hfact_13
        hfact_14 hfact_15 hfact_16 hfact_17 hfact_18 hfact_19
        hfact_20 hfact_21 hfact_22 hfact_23 hfact_24 hfact_25
  · have hfact_23 :
        U5GramCert.eval ν
          [([0, 0, 0, 0, 1], (-1 : ℚ)), ([1], (1 : ℚ))] = 0 := by
      simp [U5GramCert.eval, U5GramCert.evalMono, ν, f3, hU_f11]
    have hfact_24 :
        U5GramCert.eval ν
          [([0, 0, 0, 0, 0, 1], (-1 : ℚ)), ([0, 1], (1 : ℚ))] = 0 := by
      simp [U5GramCert.eval, U5GramCert.evalMono, ν, f3, hU_f11]
    exact
      cert_00001_1fd78cc992f28c47_false_of_semantic_equalities ν
        hfact_0 hfact_1 hfact_2 hfact_3 hfact_4 hfact_5 hfact_6
        hfact_7 hfact_8 hfact_9 hfact_10 hfact_11 hfact_12 hfact_13
        hfact_14 hfact_15 hfact_16 hfact_17 hfact_18 hfact_19
        hfact_20 hfact_21 hfact_22 hfact_23 hfact_24 hfact_25
  · have hfact_23 :
        U5GramCert.eval ν
          [([0, 0, 0, 0, 0, 0, 1], (-1 : ℚ)), ([1], (1 : ℚ))] = 0 := by
      simp [U5GramCert.eval, U5GramCert.evalMono, ν, f4, hU_f12]
    have hfact_24 :
        U5GramCert.eval ν
          [([0, 0, 0, 0, 0, 0, 0, 1], (-1 : ℚ)), ([0, 1], (1 : ℚ))] = 0 := by
      simp [U5GramCert.eval, U5GramCert.evalMono, ν, f4, hU_f12]
    exact
      cert_00002_77a205db4dfbd6c9_false_of_semantic_equalities ν
        hfact_0 hfact_1 hfact_2 hfact_3 hfact_4 hfact_5 hfact_6
        hfact_7 hfact_8 hfact_9 hfact_10 hfact_11 hfact_12 hfact_13
        hfact_14 hfact_15 hfact_16 hfact_17 hfact_18 hfact_19
        hfact_20 hfact_21 hfact_22 hfact_23 hfact_24 hfact_25

end Record001Branch0Collision

namespace Record001Branch0SourceCoreProducerData

set_option linter.style.longLine false in
/-- Any complete source-core producer bundle already contradicts the
source-indexed critical-row semantics.

The source-core bundle contains the record001 branch-0 `t1` placement block.
That block is impossible for the blocker-centered `CriticalSourceRows` row
before any generated direct-extra replay is needed. -/
theorem false {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : U1Depth5.Plane}
    (hbase :
      List.Pairwise (fun x y : U1Depth5.Plane => x ≠ y)
        [baseP, baseQ, baseT1, baseT2, baseT3, selectedU])
    {rows : U1Depth5.CriticalSourceRows D baseQ baseT1 baseT2 baseT3 selectedU}
    (B : Record001Branch0SourceCoreProducerData rows baseP) :
    False := by
  exact
    U1Depth5.CriticalSourceRows.record001Branch0_t1Placements_absurd
      rows hbase B.hfix_f1_t1_0 B.hfix_p_t1_1 B.hfix_q_t1_2 B.hfix_t3_t1_3

end Record001Branch0SourceCoreProducerData

/-- Core source-row branch-data form of the record001 branch-0 `f1:t2`
close, after removing the legacy packet/cross-distinctness inputs. -/
theorem record001_branch0_false_of_f1t2_extra_omit3_branch_core
    {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : U1Depth5.Plane}
    {rows : U1Depth5.CriticalSourceRows D baseQ baseT1 baseT2 baseT3 selectedU}
    (hfixed : U3FixedTriplePacket D baseQ baseP baseT1 baseT2 baseT3)
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
    (hrow_26 : dist baseT3 baseT1 = dist baseT3 selectedU)
    (hslot_q_t1_f1 :
      dist baseQ ((rows.rowAt U1Depth5.CriticalSource.q).slotPoint 2) =
        dist baseQ ((rows.rowAt U1Depth5.CriticalSource.q).slotPoint 0))
    (hslot_q_t2_f1 :
      dist baseQ ((rows.rowAt U1Depth5.CriticalSource.q).slotPoint 3) =
        dist baseQ ((rows.rowAt U1Depth5.CriticalSource.q).slotPoint 0))
    (hslot_t1_p_f1 :
      dist baseT1 ((rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 1) =
        dist baseT1 ((rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 0))
    (hslot_t1_q_f1 :
      dist baseT1 ((rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 2) =
        dist baseT1 ((rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 0))
    (hslot_t1_t3_f1 :
      dist baseT1 ((rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 3) =
        dist baseT1 ((rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 0))
    (hextra_f1_t2 :
      dist selectedU baseT2 =
        dist selectedU
          ((rows.rowAt U1Depth5.CriticalSource.t2).slotPoint 0)) :
    False := by
  exact
    Record001Branch0Collision.false_of_f1t2_extra_omit3_f1_tail_source_direct_extra
      hfixed hbase hocc_f2_f1_0 hfix_p_f1_3 hfix_t1_q_2 hfix_f1_q_0
      hfix_t2_q_3 hfix_p_t1_1 hfix_f1_t1_0 hfix_q_t1_2 hfix_t3_t1_3
      hrow_12 hrow_20 hrow_21 hrow_22 hrow_24 hrow_25 hrow_26
      hslot_q_t1_f1 hslot_q_t2_f1 hslot_t1_p_f1 hslot_t1_q_f1
      hslot_t1_t3_f1 hextra_f1_t2

/-- Branch-data form of the record001 branch-0 `f1:t2` close.

The proof now uses the branch-data-compatible direct-extra certificates:
the `f1` source row forces `selectedU` into one of `t2[0]`, `f1[1]`, or
`f1[2]`, and each equality case is discharged by the corresponding source-UNIT
certificate.  The legacy packet/cross-distinctness arguments remain in the
signature for existing callers, but they are no longer used by this close. -/
theorem record001_branch0_false_of_f1t2_extra_omit3_branch_data
    {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : U1Depth5.Plane}
    {rows : U1Depth5.CriticalSourceRows D baseQ baseT1 baseT2 baseT3 selectedU}
    (hfixed : U3FixedTriplePacket D baseQ baseP baseT1 baseT2 baseT3)
    (_baseP_mem : baseP ∈ D.A)
    (hbase :
      List.Pairwise (fun x y : U1Depth5.Plane => x ≠ y)
        [baseP, baseQ, baseT1, baseT2, baseT3, selectedU])
    (_hcrossNoP :
      ∀ a ∈ [baseQ, baseT1, baseT2, baseT3, selectedU],
        ∀ b ∈ [(rows.rowAt U1Depth5.CriticalSource.t2).slotPoint 0,
          (rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 1,
          (rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 2,
          (rows.rowAt U1Depth5.CriticalSource.t2).slotPoint 1], a ≠ b)
    (_hp_f5 :
      baseP ≠ (rows.rowAt U1Depth5.CriticalSource.t2).slotPoint 1)
    (hocc_f2_f1_0 :
      rows.pointOfChoice { source := U1Depth5.CriticalSource.t2, slot := 0 } =
        (rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 0)
    (hfix_p_f1_3 :
      baseP = (rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 3)
    (_hf11_t21 :
      (rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 1 ≠
        (rows.rowAt U1Depth5.CriticalSource.t2).slotPoint 1)
    (_hf12_t21 :
      (rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 2 ≠
        (rows.rowAt U1Depth5.CriticalSource.t2).slotPoint 1)
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
    (hrow_26 : dist baseT3 baseT1 = dist baseT3 selectedU)
    (hslot_q_t1_f1 :
      dist baseQ ((rows.rowAt U1Depth5.CriticalSource.q).slotPoint 2) =
        dist baseQ ((rows.rowAt U1Depth5.CriticalSource.q).slotPoint 0))
    (hslot_q_t2_f1 :
      dist baseQ ((rows.rowAt U1Depth5.CriticalSource.q).slotPoint 3) =
        dist baseQ ((rows.rowAt U1Depth5.CriticalSource.q).slotPoint 0))
    (hslot_t1_p_f1 :
      dist baseT1 ((rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 1) =
        dist baseT1 ((rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 0))
    (hslot_t1_q_f1 :
      dist baseT1 ((rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 2) =
        dist baseT1 ((rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 0))
    (hslot_t1_t3_f1 :
      dist baseT1 ((rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 3) =
        dist baseT1 ((rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 0))
    (hextra_f1_t2 :
      dist selectedU baseT2 =
        dist selectedU
          ((rows.rowAt U1Depth5.CriticalSource.t2).slotPoint 0)) :
    False := by
  exact
    record001_branch0_false_of_f1t2_extra_omit3_branch_core
      hfixed hbase hocc_f2_f1_0 hfix_p_f1_3 hfix_t1_q_2 hfix_f1_q_0
      hfix_t2_q_3 hfix_p_t1_1 hfix_f1_t1_0 hfix_q_t1_2 hfix_t3_t1_3
      hrow_12 hrow_20 hrow_21 hrow_22 hrow_24 hrow_25 hrow_26
      hslot_q_t1_f1 hslot_q_t2_f1 hslot_t1_p_f1 hslot_t1_q_f1
      hslot_t1_t3_f1 hextra_f1_t2

/-- Under a no-collision branch-0 split, the live record001 branch-data inputs
produce exactly the reduced q/t1 transport package `hqt`.

This is the theorem-facing producer target for the current reduced consumer
surface: it exports only the five q/t1 transport hrows, not the stronger raw
slot-metric source surface. -/
theorem record001QTFacingTransportRows_of_noCollision_branch_data
    {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : U1Depth5.Plane}
    {rows : U1Depth5.CriticalSourceRows D baseQ baseT1 baseT2 baseT3 selectedU}
    (hNoCollision :
      U1Depth5.RowSlotLabelPacket.Record001Branch0NoCollision rows baseP)
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
    (hslot_q_t1_f1 :
      dist baseQ ((rows.rowAt U1Depth5.CriticalSource.q).slotPoint 2) =
        dist baseQ ((rows.rowAt U1Depth5.CriticalSource.q).slotPoint 0))
    (hslot_q_t2_f1 :
      dist baseQ ((rows.rowAt U1Depth5.CriticalSource.q).slotPoint 3) =
        dist baseQ ((rows.rowAt U1Depth5.CriticalSource.q).slotPoint 0))
    (hslot_t1_p_f1 :
      dist baseT1 ((rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 1) =
        dist baseT1 ((rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 0))
    (hslot_t1_q_f1 :
      dist baseT1 ((rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 2) =
        dist baseT1 ((rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 0))
    (hslot_t1_t3_f1 :
      dist baseT1 ((rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 3) =
        dist baseT1 ((rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 0)) :
    U1Depth5.Record001QTFacingTransportRows
      baseP baseQ baseT1 baseT2 baseT3 selectedU := by
  let packet :
      U1Depth5.RowSlotLabelPacket D baseP baseQ baseT1 baseT2 baseT3 selectedU :=
    hNoCollision.toPacket baseP_mem hbase hocc_f2_f1_0 hfix_p_f1_3
  have hpt_t1_q_2 :
      packet.point U1Depth5.t1 =
        (packet.rows.rowAt U1Depth5.CriticalSource.q).slotPoint 2 := by
    simpa using hfix_t1_q_2
  have hpt_f1_q_0 :
      packet.point U1Depth5.f1 =
        (packet.rows.rowAt U1Depth5.CriticalSource.q).slotPoint 0 := by
    simpa using hfix_f1_q_0
  have hpt_t2_q_3 :
      packet.point U1Depth5.t2 =
        (packet.rows.rowAt U1Depth5.CriticalSource.q).slotPoint 3 := by
    simpa using hfix_t2_q_3
  have hpt_p_t1_1 :
      packet.point U1Depth5.p =
        (packet.rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 1 := by
    simpa using hfix_p_t1_1
  have hpt_f1_t1_0 :
      packet.point U1Depth5.f1 =
        (packet.rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 0 := by
    simpa using hfix_f1_t1_0
  have hpt_q_t1_2 :
      packet.point U1Depth5.q =
        (packet.rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 2 := by
    simpa using hfix_q_t1_2
  have hpt_t3_t1_3 :
      packet.point U1Depth5.t3 =
        (packet.rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 3 := by
    simpa using hfix_t3_t1_3
  simpa [packet] using
    packet.record001QTFacingTransportRows
      hpt_t1_q_2 hpt_f1_q_0 hpt_t2_q_3 hpt_p_t1_1 hpt_f1_t1_0
      hpt_q_t1_2 hpt_t3_t1_3 hslot_q_t1_f1 hslot_q_t2_f1
      hslot_t1_p_f1 hslot_t1_q_f1 hslot_t1_t3_f1

namespace Record001Branch0SourceCoreProducerData

/-- Under a no-collision split, the stronger source-core artifact bundle
projects to the reduced record001 branch-0 collision-product producer
surface. -/
theorem toCollisionProductProducerData
    {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : U1Depth5.Plane}
    {rows : U1Depth5.CriticalSourceRows D baseQ baseT1 baseT2 baseT3 selectedU}
    (B : Record001Branch0SourceCoreProducerData rows baseP)
    (hNoCollision :
      U1Depth5.RowSlotLabelPacket.Record001Branch0NoCollision rows baseP)
    (baseP_mem : baseP ∈ D.A)
    (hbase :
      List.Pairwise (fun x y : U1Depth5.Plane => x ≠ y)
        [baseP, baseQ, baseT1, baseT2, baseT3, selectedU]) :
    Record001Branch0CollisionProductProducerData rows baseP := by
  have hqt :
      U1Depth5.Record001QTFacingTransportRows
        baseP baseQ baseT1 baseT2 baseT3 selectedU :=
    record001QTFacingTransportRows_of_noCollision_branch_data
      hNoCollision baseP_mem hbase
      B.hocc_f2_f1_0 B.hfix_p_f1_3
      B.hfix_t1_q_2 B.hfix_f1_q_0 B.hfix_t2_q_3
      B.hfix_p_t1_1 B.hfix_f1_t1_0 B.hfix_q_t1_2 B.hfix_t3_t1_3
      B.hslot_q_t1_f1 B.hslot_q_t2_f1
      B.hslot_t1_p_f1 B.hslot_t1_q_f1 B.hslot_t1_t3_f1
  exact
    { noCollision := hNoCollision
      hocc_f2_f1_0 := B.hocc_f2_f1_0
      hfix_p_f1_3 := B.hfix_p_f1_3
      hrow_q_p_f1 := B.hrow_12
      hqt := hqt
      hrow_t2_p_f2 := B.hrow_21
      hrow_t2_q_f2 := B.hrow_22
      hrow_t3_p_f1 := B.hrow_25
      hrow_t3_t1_f1 := B.hrow_26
      hextra_f1_t2 := B.hextra_f1_t2 }

end Record001Branch0SourceCoreProducerData

/-- The public reduced producer surface for the current record001 branch-0
f1:t2 lane: either the branch is already on a packet collision, or the live
branch-data inputs produce the reduced q/t1 transport package `hqt`. -/
theorem record001QTFacingTransportRows_or_branch0Collision_of_branch_data
    {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : U1Depth5.Plane}
    {rows : U1Depth5.CriticalSourceRows D baseQ baseT1 baseT2 baseT3 selectedU}
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
    (hslot_q_t1_f1 :
      dist baseQ ((rows.rowAt U1Depth5.CriticalSource.q).slotPoint 2) =
        dist baseQ ((rows.rowAt U1Depth5.CriticalSource.q).slotPoint 0))
    (hslot_q_t2_f1 :
      dist baseQ ((rows.rowAt U1Depth5.CriticalSource.q).slotPoint 3) =
        dist baseQ ((rows.rowAt U1Depth5.CriticalSource.q).slotPoint 0))
    (hslot_t1_p_f1 :
      dist baseT1 ((rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 1) =
        dist baseT1 ((rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 0))
    (hslot_t1_q_f1 :
      dist baseT1 ((rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 2) =
        dist baseT1 ((rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 0))
    (hslot_t1_t3_f1 :
      dist baseT1 ((rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 3) =
        dist baseT1 ((rows.rowAt U1Depth5.CriticalSource.t1).slotPoint 0)) :
    U1Depth5.Record001QTFacingTransportRows
        baseP baseQ baseT1 baseT2 baseT3 selectedU ∨
      U1Depth5.RowSlotLabelPacket.Record001Branch0Collision rows baseP := by
  rcases U1Depth5.RowSlotLabelPacket.record001Branch0_split rows baseP with
    hNoCollision | hCollision
  · exact Or.inl <|
      record001QTFacingTransportRows_of_noCollision_branch_data
        hNoCollision baseP_mem hbase hocc_f2_f1_0 hfix_p_f1_3
        hfix_t1_q_2 hfix_f1_q_0 hfix_t2_q_3 hfix_p_t1_1
        hfix_f1_t1_0 hfix_q_t1_2 hfix_t3_t1_3 hslot_q_t1_f1
        hslot_q_t2_f1 hslot_t1_p_f1 hslot_t1_q_f1 hslot_t1_t3_f1
  · exact Or.inr hCollision

namespace Record001Branch0SourceCoreProducerData

/-- The stronger source-core artifact bundle already reaches the public reduced
`hqt ∨ collision` producer surface. -/
theorem toQTFacingTransportRowsOrBranch0Collision
    {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : U1Depth5.Plane}
    {rows : U1Depth5.CriticalSourceRows D baseQ baseT1 baseT2 baseT3 selectedU}
    (B : Record001Branch0SourceCoreProducerData rows baseP)
    (baseP_mem : baseP ∈ D.A)
    (hbase :
      List.Pairwise (fun x y : U1Depth5.Plane => x ≠ y)
        [baseP, baseQ, baseT1, baseT2, baseT3, selectedU]) :
    U1Depth5.Record001QTFacingTransportRows
        baseP baseQ baseT1 baseT2 baseT3 selectedU ∨
      U1Depth5.RowSlotLabelPacket.Record001Branch0Collision rows baseP := by
  exact
    record001QTFacingTransportRows_or_branch0Collision_of_branch_data
      baseP_mem hbase
      B.hocc_f2_f1_0 B.hfix_p_f1_3
      B.hfix_t1_q_2 B.hfix_f1_q_0 B.hfix_t2_q_3
      B.hfix_p_t1_1 B.hfix_f1_t1_0 B.hfix_q_t1_2 B.hfix_t3_t1_3
      B.hslot_q_t1_f1 B.hslot_q_t2_f1
      B.hslot_t1_p_f1 B.hslot_t1_q_f1 B.hslot_t1_t3_f1

end Record001Branch0SourceCoreProducerData

/-- Structurally different q/t1 producer target for the current branch-0 lane.

Unlike `record001QTFacingTransportRows_or_branch0Collision_of_branch_data`,
this surface does not mention any explicit q-row/t1-row slot placements.  It
asks only for a weaker internal q/t1 shell-support witness, or an existing
branch-0 collision. -/
abbrev Record001QTShellSupportOrBranch0Collision
    {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : U1Depth5.Plane}
    (rows : U1Depth5.CriticalSourceRows D baseQ baseT1 baseT2 baseT3 selectedU) :
    Prop :=
  Nonempty
      (U1Depth5.Record001QTShellSupport
        D baseP baseQ baseT1 baseT2 baseT3 selectedU) ∨
    U1Depth5.RowSlotLabelPacket.Record001Branch0Collision rows baseP

/-- Exact remaining q/t1 packet-label input over the canonical global-K4 rows.

This is the current best candidate for the next live-tail producer surface:
once `q,t1,t2,t3,u ∈ D.A` are known, the centered q/t1 rows themselves are
canonical via `PacketLabelCenteredRows.ofGlobalK4`, so only these seven shell
equalities remain to build `Record001QTShellSupport`. -/
abbrev Record001QTGlobalK4ShellData
    {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : U1Depth5.Plane}
    (baseQ_mem : baseQ ∈ D.A)
    (baseT1_mem : baseT1 ∈ D.A)
    (baseT2_mem : baseT2 ∈ D.A)
    (baseT3_mem : baseT3 ∈ D.A)
    (selectedU_mem : selectedU ∈ D.A) : Prop :=
  let centered :=
    U1Depth5.PacketLabelCenteredRows.ofGlobalK4
      (D := D) baseQ_mem baseT1_mem baseT2_mem baseT3_mem selectedU_mem
  dist baseQ baseT1 = centered.qRow.row.radius ∧
    dist baseQ baseT2 = centered.qRow.row.radius ∧
    dist baseQ selectedU = centered.qRow.row.radius ∧
    dist baseT1 baseP = centered.t1Row.row.radius ∧
    dist baseT1 baseQ = centered.t1Row.row.radius ∧
    dist baseT1 baseT3 = centered.t1Row.row.radius ∧
    dist baseT1 selectedU = centered.t1Row.row.radius

/-- Package the canonical global-K4 shell data into the new q/t1 shell-support
or collision surface. -/
theorem record001QTShellSupportOrBranch0Collision_ofGlobalK4ShellData
    {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : U1Depth5.Plane}
    {rows : U1Depth5.CriticalSourceRows D baseQ baseT1 baseT2 baseT3 selectedU}
    (baseQ_mem : baseQ ∈ D.A)
    (baseT1_mem : baseT1 ∈ D.A)
    (baseT2_mem : baseT2 ∈ D.A)
    (baseT3_mem : baseT3 ∈ D.A)
    (selectedU_mem : selectedU ∈ D.A)
    (hShell :
      Record001QTGlobalK4ShellData
        (D := D) (baseP := baseP) (baseQ := baseQ) (baseT1 := baseT1)
        (baseT2 := baseT2) (baseT3 := baseT3) (selectedU := selectedU)
        baseQ_mem baseT1_mem baseT2_mem baseT3_mem selectedU_mem) :
    Record001QTShellSupportOrBranch0Collision
      (baseP := baseP) (baseQ := baseQ) (baseT1 := baseT1) (baseT2 := baseT2)
      (baseT3 := baseT3) (selectedU := selectedU) rows := by
  rcases hShell with
    ⟨hq_t1, hq_t2, hq_f1, ht1_p, ht1_q, ht1_t3, ht1_f1⟩
  exact Or.inl <|
    U1Depth5.PacketLabelCenteredRows.record001QTShellSupport_ofGlobalK4
      baseQ_mem baseT1_mem baseT2_mem baseT3_mem selectedU_mem
      hq_t1 hq_t2 hq_f1 ht1_p ht1_q ht1_t3 ht1_f1

/-- Exact theorem-facing metric-bridge target after the q/t1 shell-support
retarget: either the seven canonical global-K4 shell equalities hold, or the
branch is already on a named record001 collision. -/
abbrev Record001QTGlobalK4ShellDataOrBranch0Collision
    {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : U1Depth5.Plane}
    (baseQ_mem : baseQ ∈ D.A)
    (baseT1_mem : baseT1 ∈ D.A)
    (baseT2_mem : baseT2 ∈ D.A)
    (baseT3_mem : baseT3 ∈ D.A)
    (selectedU_mem : selectedU ∈ D.A)
    (rows : U1Depth5.CriticalSourceRows D baseQ baseT1 baseT2 baseT3 selectedU) :
    Prop :=
  Record001QTGlobalK4ShellData
      (D := D) (baseP := baseP) (baseQ := baseQ) (baseT1 := baseT1)
      (baseT2 := baseT2) (baseT3 := baseT3) (selectedU := selectedU)
      baseQ_mem baseT1_mem baseT2_mem baseT3_mem selectedU_mem ∨
    U1Depth5.RowSlotLabelPacket.Record001Branch0Collision rows baseP

/-- The q-centered half of the current canonical global-K4 shell-data target. -/
abbrev Record001QTGlobalK4QShellData
    {D : CounterexampleData}
    {baseQ baseT1 baseT2 baseT3 selectedU : U1Depth5.Plane}
    (baseQ_mem : baseQ ∈ D.A)
    (baseT1_mem : baseT1 ∈ D.A)
    (baseT2_mem : baseT2 ∈ D.A)
    (baseT3_mem : baseT3 ∈ D.A)
    (selectedU_mem : selectedU ∈ D.A) : Prop :=
  let centered :=
    U1Depth5.PacketLabelCenteredRows.ofGlobalK4
      (D := D) baseQ_mem baseT1_mem baseT2_mem baseT3_mem selectedU_mem
  dist baseQ baseT1 = centered.qRow.row.radius ∧
    dist baseQ baseT2 = centered.qRow.row.radius ∧
    dist baseQ selectedU = centered.qRow.row.radius

/-- The t1-centered half of the current canonical global-K4 shell-data target. -/
abbrev Record001QTGlobalK4T1ShellData
    {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : U1Depth5.Plane}
    (baseQ_mem : baseQ ∈ D.A)
    (baseT1_mem : baseT1 ∈ D.A)
    (baseT2_mem : baseT2 ∈ D.A)
    (baseT3_mem : baseT3 ∈ D.A)
    (selectedU_mem : selectedU ∈ D.A) : Prop :=
  let centered :=
    U1Depth5.PacketLabelCenteredRows.ofGlobalK4
      (D := D) baseQ_mem baseT1_mem baseT2_mem baseT3_mem selectedU_mem
  dist baseT1 baseP = centered.t1Row.row.radius ∧
    dist baseT1 baseQ = centered.t1Row.row.radius ∧
    dist baseT1 baseT3 = centered.t1Row.row.radius ∧
    dist baseT1 selectedU = centered.t1Row.row.radius

/-- Repackage the seven canonical shell equalities into q-side and t1-side
subtargets.  This is the exact split surface for the next theorem-facing
sublemma search: prove either one/both shell blocks or the collision branch. -/
theorem record001QTGlobalK4ShellData_iff_q_t1_shellData
    {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : U1Depth5.Plane}
    (baseQ_mem : baseQ ∈ D.A)
    (baseT1_mem : baseT1 ∈ D.A)
    (baseT2_mem : baseT2 ∈ D.A)
    (baseT3_mem : baseT3 ∈ D.A)
    (selectedU_mem : selectedU ∈ D.A) :
    Record001QTGlobalK4ShellData
        (D := D) (baseP := baseP) (baseQ := baseQ) (baseT1 := baseT1)
        (baseT2 := baseT2) (baseT3 := baseT3) (selectedU := selectedU)
        baseQ_mem baseT1_mem baseT2_mem baseT3_mem selectedU_mem ↔
      Record001QTGlobalK4QShellData
          (D := D) (baseQ := baseQ) (baseT1 := baseT1)
          (baseT2 := baseT2) (baseT3 := baseT3) (selectedU := selectedU)
          baseQ_mem baseT1_mem baseT2_mem baseT3_mem selectedU_mem ∧
        Record001QTGlobalK4T1ShellData
          (D := D) (baseP := baseP) (baseQ := baseQ) (baseT1 := baseT1)
          (baseT2 := baseT2) (baseT3 := baseT3) (selectedU := selectedU)
          baseQ_mem baseT1_mem baseT2_mem baseT3_mem selectedU_mem := by
  constructor
  · rintro ⟨hq_t1, hq_t2, hq_f1, ht1_p, ht1_q, ht1_t3, ht1_f1⟩
    exact ⟨⟨hq_t1, hq_t2, hq_f1⟩, ⟨ht1_p, ht1_q, ht1_t3, ht1_f1⟩⟩
  · rintro ⟨⟨hq_t1, hq_t2, hq_f1⟩, ⟨ht1_p, ht1_q, ht1_t3, ht1_f1⟩⟩
    exact ⟨hq_t1, hq_t2, hq_f1, ht1_p, ht1_q, ht1_t3, ht1_f1⟩

/-- The exact canonical bridge target is equivalent to either both explicit
q/t1 shell blocks or the existing branch0 collision alternative. -/
theorem record001QTGlobalK4ShellDataOrBranch0Collision_iff_q_t1_shellData_or_collision
    {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : U1Depth5.Plane}
    {rows : U1Depth5.CriticalSourceRows D baseQ baseT1 baseT2 baseT3 selectedU}
    (baseQ_mem : baseQ ∈ D.A)
    (baseT1_mem : baseT1 ∈ D.A)
    (baseT2_mem : baseT2 ∈ D.A)
    (baseT3_mem : baseT3 ∈ D.A)
    (selectedU_mem : selectedU ∈ D.A) :
    Record001QTGlobalK4ShellDataOrBranch0Collision
        (baseP := baseP) (baseQ := baseQ) (baseT1 := baseT1)
        (baseT2 := baseT2) (baseT3 := baseT3) (selectedU := selectedU)
        baseQ_mem baseT1_mem baseT2_mem baseT3_mem selectedU_mem rows ↔
      (Record001QTGlobalK4QShellData
          (D := D) (baseQ := baseQ) (baseT1 := baseT1)
          (baseT2 := baseT2) (baseT3 := baseT3) (selectedU := selectedU)
          baseQ_mem baseT1_mem baseT2_mem baseT3_mem selectedU_mem ∧
        Record001QTGlobalK4T1ShellData
          (D := D) (baseP := baseP) (baseQ := baseQ) (baseT1 := baseT1)
          (baseT2 := baseT2) (baseT3 := baseT3) (selectedU := selectedU)
          baseQ_mem baseT1_mem baseT2_mem baseT3_mem selectedU_mem) ∨
        U1Depth5.RowSlotLabelPacket.Record001Branch0Collision rows baseP := by
  constructor
  · intro h
    rcases h with hshell | hcollision
    · exact Or.inl <|
        (record001QTGlobalK4ShellData_iff_q_t1_shellData
          (D := D) (baseP := baseP) (baseQ := baseQ) (baseT1 := baseT1)
          (baseT2 := baseT2) (baseT3 := baseT3) (selectedU := selectedU)
          baseQ_mem baseT1_mem baseT2_mem baseT3_mem selectedU_mem).mp hshell
    · exact Or.inr hcollision
  · intro h
    rcases h with hshell | hcollision
    · exact Or.inl <|
        (record001QTGlobalK4ShellData_iff_q_t1_shellData
          (D := D) (baseP := baseP) (baseQ := baseQ) (baseT1 := baseT1)
          (baseT2 := baseT2) (baseT3 := baseT3) (selectedU := selectedU)
          baseQ_mem baseT1_mem baseT2_mem baseT3_mem selectedU_mem).mpr hshell
    · exact Or.inr hcollision

/-- Row-packaged form of the exact canonical global-K4 shell-data target.

This is the same metric-bridge surface as
`Record001QTGlobalK4ShellDataOrBranch0Collision`, but stated directly from the
live `CriticalSourceRows` package so the theorem-facing target matches the tail
context more closely. -/
abbrev Record001QTGlobalK4ShellDataOrBranch0CollisionOfRows
    {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : U1Depth5.Plane}
    (rows : U1Depth5.CriticalSourceRows D baseQ baseT1 baseT2 baseT3 selectedU) :
    Prop :=
  Record001QTGlobalK4ShellDataOrBranch0Collision
    (baseP := baseP) (baseQ := baseQ) (baseT1 := baseT1)
    (baseT2 := baseT2) (baseT3 := baseT3) (selectedU := selectedU)
    rows.qRow.source_mem rows.t1Row.source_mem rows.t2Row.source_mem
    rows.t3Row.source_mem rows.uRow.source_mem rows

/-- Row-packaged form of the q/t1-shell-or-collision split target. -/
theorem record001QTGlobalK4ShellDataOrBranch0CollisionOfRows_iff_q_t1_shellData_or_collision
    {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : U1Depth5.Plane}
    {rows : U1Depth5.CriticalSourceRows D baseQ baseT1 baseT2 baseT3 selectedU} :
    Record001QTGlobalK4ShellDataOrBranch0CollisionOfRows
        (baseP := baseP) (baseQ := baseQ) (baseT1 := baseT1)
        (baseT2 := baseT2) (baseT3 := baseT3) (selectedU := selectedU) rows ↔
      (Record001QTGlobalK4QShellData
          (D := D) (baseQ := baseQ) (baseT1 := baseT1)
          (baseT2 := baseT2) (baseT3 := baseT3) (selectedU := selectedU)
          rows.qRow.source_mem rows.t1Row.source_mem rows.t2Row.source_mem
          rows.t3Row.source_mem rows.uRow.source_mem ∧
        Record001QTGlobalK4T1ShellData
          (D := D) (baseP := baseP) (baseQ := baseQ) (baseT1 := baseT1)
          (baseT2 := baseT2) (baseT3 := baseT3) (selectedU := selectedU)
          rows.qRow.source_mem rows.t1Row.source_mem rows.t2Row.source_mem
          rows.t3Row.source_mem rows.uRow.source_mem) ∨
        U1Depth5.RowSlotLabelPacket.Record001Branch0Collision rows baseP :=
  record001QTGlobalK4ShellDataOrBranch0Collision_iff_q_t1_shellData_or_collision
    rows.qRow.source_mem rows.t1Row.source_mem rows.t2Row.source_mem
    rows.t3Row.source_mem rows.uRow.source_mem

/-- Export the public `hqt ∨ collision` shape from the exact canonical
global-K4 shell-data target. -/
theorem record001QTFacingTransportRows_or_branch0Collision_ofGlobalK4ShellData
    {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : U1Depth5.Plane}
    {rows : U1Depth5.CriticalSourceRows D baseQ baseT1 baseT2 baseT3 selectedU}
    (baseQ_mem : baseQ ∈ D.A)
    (baseT1_mem : baseT1 ∈ D.A)
    (baseT2_mem : baseT2 ∈ D.A)
    (baseT3_mem : baseT3 ∈ D.A)
    (selectedU_mem : selectedU ∈ D.A)
    (h :
      Record001QTGlobalK4ShellDataOrBranch0Collision
        (baseP := baseP) (baseQ := baseQ) (baseT1 := baseT1)
        (baseT2 := baseT2) (baseT3 := baseT3) (selectedU := selectedU)
        baseQ_mem baseT1_mem baseT2_mem baseT3_mem selectedU_mem rows) :
    U1Depth5.Record001QTFacingTransportRows
        baseP baseQ baseT1 baseT2 baseT3 selectedU ∨
      U1Depth5.RowSlotLabelPacket.Record001Branch0Collision rows baseP := by
  rcases h with hShell | hCollision
  · rcases hShell with
      ⟨hq_t1, hq_t2, hq_f1, ht1_p, ht1_q, ht1_t3, ht1_f1⟩
    have hSupport :
        Nonempty
          (U1Depth5.Record001QTShellSupport
            D baseP baseQ baseT1 baseT2 baseT3 selectedU) :=
      U1Depth5.PacketLabelCenteredRows.record001QTShellSupport_ofGlobalK4
        baseQ_mem baseT1_mem baseT2_mem baseT3_mem selectedU_mem
        hq_t1 hq_t2 hq_f1 ht1_p ht1_q ht1_t3 ht1_f1
    exact Or.inl <|
      U1Depth5.PacketLabelCenteredRows.record001QTFacingTransportRows_of_shellSupport
        hSupport.some
  · exact Or.inr hCollision

/-- Export the public `hqt ∨ collision` shape from the row-packaged exact
canonical global-K4 shell-data target. -/
theorem record001QTFacingTransportRows_or_branch0Collision_ofGlobalK4ShellDataOfRows
    {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : U1Depth5.Plane}
    {rows : U1Depth5.CriticalSourceRows D baseQ baseT1 baseT2 baseT3 selectedU}
    (h :
      Record001QTGlobalK4ShellDataOrBranch0CollisionOfRows
        (baseP := baseP) (baseQ := baseQ) (baseT1 := baseT1)
        (baseT2 := baseT2) (baseT3 := baseT3) (selectedU := selectedU) rows) :
    U1Depth5.Record001QTFacingTransportRows
        baseP baseQ baseT1 baseT2 baseT3 selectedU ∨
      U1Depth5.RowSlotLabelPacket.Record001Branch0Collision rows baseP :=
  record001QTFacingTransportRows_or_branch0Collision_ofGlobalK4ShellData
    rows.qRow.source_mem rows.t1Row.source_mem rows.t2Row.source_mem
    rows.t3Row.source_mem rows.uRow.source_mem h

/-- Export the public q/t1 transport package from the weaker shell-support
branch surface. -/
theorem record001QTFacingTransportRows_or_branch0Collision_of_shellSupport
    {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : U1Depth5.Plane}
    {rows : U1Depth5.CriticalSourceRows D baseQ baseT1 baseT2 baseT3 selectedU}
    (h :
      Record001QTShellSupportOrBranch0Collision
        (baseP := baseP) (baseQ := baseQ) (baseT1 := baseT1)
        (baseT2 := baseT2) (baseT3 := baseT3) (selectedU := selectedU) rows) :
    U1Depth5.Record001QTFacingTransportRows
        baseP baseQ baseT1 baseT2 baseT3 selectedU ∨
      U1Depth5.RowSlotLabelPacket.Record001Branch0Collision rows baseP := by
  rcases h with hSupport | hCollision
  · exact Or.inl <|
      U1Depth5.PacketLabelCenteredRows.record001QTFacingTransportRows_of_shellSupport
        hSupport.some
  · exact Or.inr hCollision

/-- Branch-data form of the record001 branch-0 `f1:t2` close using
packet-label-centered rows for the `q` and `t1` hrows.

The critical source rows are still used to construct the row-slot packet for
`f2..f5` and to split the remaining packet collisions.  The hrows centered at
`q` and `t1` come from the separate packet-label-centered K4 row surface. -/
theorem record001_branch0_false_of_f1t2_extra_omit3_centered_branch_data
    {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : U1Depth5.Plane}
    {rows : U1Depth5.CriticalSourceRows D baseQ baseT1 baseT2 baseT3 selectedU}
    (centered :
      U1Depth5.Record001QTTwoCenteredRows
        D baseP baseQ baseT1 baseT2 baseT3 selectedU)
    (hfixed : U3FixedTriplePacket D baseQ baseP baseT1 baseT2 baseT3)
    (baseP_mem : baseP ∈ D.A)
    (hbase :
      List.Pairwise (fun x y : U1Depth5.Plane => x ≠ y)
        [baseP, baseQ, baseT1, baseT2, baseT3, selectedU])
    (hcrossNoP :
      ∀ a ∈ [baseQ, baseT1, baseT2, baseT3, selectedU],
        ∀ b ∈ [(rows.rowAt U1Depth5.CriticalSource.t2).slotPoint 0,
          (rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 1,
          (rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 2,
          (rows.rowAt U1Depth5.CriticalSource.t2).slotPoint 1], a ≠ b)
    (hp_f5 :
      baseP ≠ (rows.rowAt U1Depth5.CriticalSource.t2).slotPoint 1)
    (hocc_f2_f1_0 :
      rows.pointOfChoice { source := U1Depth5.CriticalSource.t2, slot := 0 } =
        (rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 0)
    (hfix_p_f1_3 :
      baseP = (rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 3)
    (hf11_t21 :
      (rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 1 ≠
        (rows.rowAt U1Depth5.CriticalSource.t2).slotPoint 1)
    (hf12_t21 :
      (rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 2 ≠
        (rows.rowAt U1Depth5.CriticalSource.t2).slotPoint 1)
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
    (hrow_26 : dist baseT3 baseT1 = dist baseT3 selectedU)
    (hextra_f1_t2 :
      dist selectedU baseT2 =
        dist selectedU
          ((rows.rowAt U1Depth5.CriticalSource.t2).slotPoint 0)) :
    False := by
  rcases U1Depth5.RowSlotLabelPacket.record001Branch0_split rows baseP with
    hNoCollision | hCollision
  · let packet :
        U1Depth5.RowSlotLabelPacket D baseP baseQ baseT1 baseT2 baseT3 selectedU :=
      hNoCollision.toPacket baseP_mem hbase hocc_f2_f1_0 hfix_p_f1_3
    exact
      false_of_f1t2_extra_omit3_of_packet_label_centered_rows
        hfixed packet centered
        (by simpa [packet] using hrow_12)
        (by simpa [packet] using hrow_20)
        (by simpa [packet] using hrow_21)
        (by simpa [packet] using hrow_22)
        (by simpa [packet] using hrow_24)
        (by simpa [packet] using hrow_25)
        (by simpa [packet] using hrow_26)
        (by simpa [packet] using hextra_f1_t2)
  · exact
      Record001Branch0Collision.false_of_f1t2_extra_omit3_collision
        hcrossNoP hp_f5 hf11_t21 hf12_t21 hCollision

/-- Branch-data form of the record001 branch-0 `f1:t2` close using
packet-label-centered rows for all seven residual hrows.

The finite manifest supplies the centered slot placements explicitly.  The
only distance input still not reduced to row placement is the `f1:t2`
extra-incidence atom. -/
theorem record001_branch0_false_of_f1t2_extra_omit3_centered_placements
    {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : U1Depth5.Plane}
    {rows : U1Depth5.CriticalSourceRows D baseQ baseT1 baseT2 baseT3 selectedU}
    (centered :
      U1Depth5.PacketLabelCenteredRows D baseQ baseT1 baseT2 baseT3 selectedU)
    (hfixed : U3FixedTriplePacket D baseQ baseP baseT1 baseT2 baseT3)
    (baseP_mem : baseP ∈ D.A)
    (hbase :
      List.Pairwise (fun x y : U1Depth5.Plane => x ≠ y)
        [baseP, baseQ, baseT1, baseT2, baseT3, selectedU])
    (hcrossNoP :
      ∀ a ∈ [baseQ, baseT1, baseT2, baseT3, selectedU],
        ∀ b ∈ [(rows.rowAt U1Depth5.CriticalSource.t2).slotPoint 0,
          (rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 1,
          (rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 2,
          (rows.rowAt U1Depth5.CriticalSource.t2).slotPoint 1], a ≠ b)
    (hp_f5 :
      baseP ≠ (rows.rowAt U1Depth5.CriticalSource.t2).slotPoint 1)
    (hocc_f2_f1_0 :
      rows.pointOfChoice { source := U1Depth5.CriticalSource.t2, slot := 0 } =
        (rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 0)
    (hfix_p_f1_3 :
      baseP = (rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 3)
    (hf11_t21 :
      (rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 1 ≠
        (rows.rowAt U1Depth5.CriticalSource.t2).slotPoint 1)
    (hf12_t21 :
      (rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 2 ≠
        (rows.rowAt U1Depth5.CriticalSource.t2).slotPoint 1)
    (hfix_f1_q_0 : selectedU = centered.qRow.slotPoint 0)
    (hfix_p_q_1 : baseP = centered.qRow.slotPoint 1)
    (hfix_t1_q_2 : baseT1 = centered.qRow.slotPoint 2)
    (hfix_t2_q_3 : baseT2 = centered.qRow.slotPoint 3)
    (hfix_f1_t1_0 : selectedU = centered.t1Row.slotPoint 0)
    (hfix_p_t1_1 : baseP = centered.t1Row.slotPoint 1)
    (hfix_q_t1_2 : baseQ = centered.t1Row.slotPoint 2)
    (hfix_t3_t1_3 : baseT3 = centered.t1Row.slotPoint 3)
    (hfix_f2_t2_0 :
      (rows.rowAt U1Depth5.CriticalSource.t2).slotPoint 0 =
        centered.t2Row.slotPoint 0)
    (hfix_f5_t2_1 :
      (rows.rowAt U1Depth5.CriticalSource.t2).slotPoint 1 =
        centered.t2Row.slotPoint 1)
    (hfix_p_t2_2 : baseP = centered.t2Row.slotPoint 2)
    (hfix_q_t2_3 : baseQ = centered.t2Row.slotPoint 3)
    (hfix_f1_t3_0 : selectedU = centered.t3Row.slotPoint 0)
    (hfix_f2_t3_1 :
      (rows.rowAt U1Depth5.CriticalSource.t2).slotPoint 0 =
        centered.t3Row.slotPoint 1)
    (hfix_p_t3_2 : baseP = centered.t3Row.slotPoint 2)
    (hfix_t1_t3_3 : baseT1 = centered.t3Row.slotPoint 3)
    (hextra_f1_t2 :
      dist selectedU baseT2 =
        dist selectedU
          ((rows.rowAt U1Depth5.CriticalSource.t2).slotPoint 0)) :
    False := by
  have hrow_12 : dist baseQ baseP = dist baseQ selectedU := by
    exact U1Depth5.PacketLabelCenteredRows.hrow_q_p_f1
      centered hfix_p_q_1 hfix_f1_q_0
  have hrow_20 :
      dist baseT2 ((rows.rowAt U1Depth5.CriticalSource.t2).slotPoint 1) =
        dist baseT2 ((rows.rowAt U1Depth5.CriticalSource.t2).slotPoint 0) := by
    exact U1Depth5.PacketLabelCenteredRows.hrow_t2_f5_f2
      centered hfix_f5_t2_1 hfix_f2_t2_0
  have hrow_21 :
      dist baseT2 baseP =
        dist baseT2 ((rows.rowAt U1Depth5.CriticalSource.t2).slotPoint 0) := by
    exact U1Depth5.PacketLabelCenteredRows.hrow_t2_p_f2
      centered hfix_p_t2_2 hfix_f2_t2_0
  have hrow_22 :
      dist baseT2 baseQ =
        dist baseT2 ((rows.rowAt U1Depth5.CriticalSource.t2).slotPoint 0) := by
    exact U1Depth5.PacketLabelCenteredRows.hrow_t2_q_f2
      centered hfix_q_t2_3 hfix_f2_t2_0
  have hrow_24 :
      dist baseT3 ((rows.rowAt U1Depth5.CriticalSource.t2).slotPoint 0) =
        dist baseT3 selectedU := by
    exact U1Depth5.PacketLabelCenteredRows.hrow_t3_f2_f1
      centered hfix_f2_t3_1 hfix_f1_t3_0
  have hrow_25 : dist baseT3 baseP = dist baseT3 selectedU := by
    exact U1Depth5.PacketLabelCenteredRows.hrow_t3_p_f1
      centered hfix_p_t3_2 hfix_f1_t3_0
  have hrow_26 : dist baseT3 baseT1 = dist baseT3 selectedU := by
    exact U1Depth5.PacketLabelCenteredRows.hrow_t3_t1_f1
      centered hfix_t1_t3_3 hfix_f1_t3_0
  let centeredQT :
      U1Depth5.Record001QTTwoCenteredRows
        D baseP baseQ baseT1 baseT2 baseT3 selectedU :=
    U1Depth5.PacketLabelCenteredRows.record001QTTwoCenteredRows centered
      hfix_t1_q_2 hfix_f1_q_0 hfix_t2_q_3 hfix_p_t1_1
      hfix_f1_t1_0 hfix_q_t1_2 hfix_t3_t1_3
  exact
    record001_branch0_false_of_f1t2_extra_omit3_centered_branch_data
      centeredQT hfixed baseP_mem hbase hcrossNoP hp_f5 hocc_f2_f1_0
      hfix_p_f1_3 hf11_t21 hf12_t21 hrow_12 hrow_20 hrow_21 hrow_22 hrow_24
      hrow_25 hrow_26 hextra_f1_t2

/-- Branch-data form of the record001 branch-0 `f1:t2` close using centered
placements plus a centered `f1`-row radius incidence for the extra atom. -/
theorem record001_branch0_false_of_f1t2_extra_omit3_centered_incidence
    {D : CounterexampleData}
    {baseP baseQ baseT1 baseT2 baseT3 selectedU : U1Depth5.Plane}
    {rows : U1Depth5.CriticalSourceRows D baseQ baseT1 baseT2 baseT3 selectedU}
    (centered :
      U1Depth5.PacketLabelCenteredRows D baseQ baseT1 baseT2 baseT3 selectedU)
    (hfixed : U3FixedTriplePacket D baseQ baseP baseT1 baseT2 baseT3)
    (baseP_mem : baseP ∈ D.A)
    (hbase :
      List.Pairwise (fun x y : U1Depth5.Plane => x ≠ y)
        [baseP, baseQ, baseT1, baseT2, baseT3, selectedU])
    (hcrossNoP :
      ∀ a ∈ [baseQ, baseT1, baseT2, baseT3, selectedU],
        ∀ b ∈ [(rows.rowAt U1Depth5.CriticalSource.t2).slotPoint 0,
          (rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 1,
          (rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 2,
          (rows.rowAt U1Depth5.CriticalSource.t2).slotPoint 1], a ≠ b)
    (hp_f5 :
      baseP ≠ (rows.rowAt U1Depth5.CriticalSource.t2).slotPoint 1)
    (hocc_f2_f1_0 :
      rows.pointOfChoice { source := U1Depth5.CriticalSource.t2, slot := 0 } =
        (rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 0)
    (hfix_p_f1_3 :
      baseP = (rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 3)
    (hf11_t21 :
      (rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 1 ≠
        (rows.rowAt U1Depth5.CriticalSource.t2).slotPoint 1)
    (hf12_t21 :
      (rows.rowAt U1Depth5.CriticalSource.f1).slotPoint 2 ≠
        (rows.rowAt U1Depth5.CriticalSource.t2).slotPoint 1)
    (hfix_f1_q_0 : selectedU = centered.qRow.slotPoint 0)
    (hfix_p_q_1 : baseP = centered.qRow.slotPoint 1)
    (hfix_t1_q_2 : baseT1 = centered.qRow.slotPoint 2)
    (hfix_t2_q_3 : baseT2 = centered.qRow.slotPoint 3)
    (hfix_f1_t1_0 : selectedU = centered.t1Row.slotPoint 0)
    (hfix_p_t1_1 : baseP = centered.t1Row.slotPoint 1)
    (hfix_q_t1_2 : baseQ = centered.t1Row.slotPoint 2)
    (hfix_t3_t1_3 : baseT3 = centered.t1Row.slotPoint 3)
    (hfix_f2_t2_0 :
      (rows.rowAt U1Depth5.CriticalSource.t2).slotPoint 0 =
        centered.t2Row.slotPoint 0)
    (hfix_f5_t2_1 :
      (rows.rowAt U1Depth5.CriticalSource.t2).slotPoint 1 =
        centered.t2Row.slotPoint 1)
    (hfix_p_t2_2 : baseP = centered.t2Row.slotPoint 2)
    (hfix_q_t2_3 : baseQ = centered.t2Row.slotPoint 3)
    (hfix_f1_t3_0 : selectedU = centered.t3Row.slotPoint 0)
    (hfix_f2_t3_1 :
      (rows.rowAt U1Depth5.CriticalSource.t2).slotPoint 0 =
        centered.t3Row.slotPoint 1)
    (hfix_p_t3_2 : baseP = centered.t3Row.slotPoint 2)
    (hfix_t1_t3_3 : baseT1 = centered.t3Row.slotPoint 3)
    (hfix_f2_f1_0 :
      (rows.rowAt U1Depth5.CriticalSource.t2).slotPoint 0 =
        centered.uRow.slotPoint 0)
    (ht2_on_f1_radius :
      dist selectedU baseT2 = centered.uRow.row.radius) :
    False := by
  have hextra_f1_t2 :
      dist selectedU baseT2 =
        dist selectedU
          ((rows.rowAt U1Depth5.CriticalSource.t2).slotPoint 0) := by
    exact U1Depth5.PacketLabelCenteredRows.hrow_f1_t2_f2_of_radius
      centered hfix_f2_f1_0 ht2_on_f1_radius
  exact
    record001_branch0_false_of_f1t2_extra_omit3_centered_placements
      centered hfixed baseP_mem hbase hcrossNoP hp_f5 hocc_f2_f1_0
      hfix_p_f1_3 hf11_t21 hf12_t21 hfix_f1_q_0 hfix_p_q_1
      hfix_t1_q_2 hfix_t2_q_3 hfix_f1_t1_0 hfix_p_t1_1
      hfix_q_t1_2 hfix_t3_t1_3 hfix_f2_t2_0 hfix_f5_t2_1
      hfix_p_t2_2 hfix_q_t2_3 hfix_f1_t3_0 hfix_f2_t3_1
      hfix_p_t3_2 hfix_t1_t3_3 hextra_f1_t2

end U1Depth5SourceUnitGenerated
end Problem97
