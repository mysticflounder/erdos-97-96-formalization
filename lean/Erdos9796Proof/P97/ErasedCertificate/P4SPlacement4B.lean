/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ErasedCertificate.P4SPlacement4B0
import Erdos9796Proof.P97.ErasedCertificate.P4SPlacement4B1
import Erdos9796Proof.P97.ErasedCertificate.P4SPlacement4B2
import Erdos9796Proof.P97.ErasedCertificate.P4SPlacement4B3
import Erdos9796Proof.P97.ErasedCertificate.P4SPlacement4B4
import Erdos9796Proof.P97.ErasedCertificate.P4SPlacement4B5
import Erdos9796Proof.P97.ErasedCertificate.P4SPlacement4B6
import Erdos9796Proof.P97.ErasedCertificate.P4SPlacement4B7

/-! Native P4-S placement certificate for center 4 and deleted labels 5-6. -/

namespace Problem97.ErasedCertificate.ErasedNativeClassifier

theorem p4sPlacementsAt_four_b_chunks_eq_true :
    p4sPlacementsAtDeletedPairChunks 4 5 6 = true := by
  apply List.all_eq_true.mpr
  intro chunk hchunk
  have hchunkLt : chunk < 8 := List.mem_range.mp hchunk
  interval_cases chunk
  · exact p4sPlacementsAt_four_b_chunk_0_eq_true
  · exact p4sPlacementsAt_four_b_chunk_1_eq_true
  · exact p4sPlacementsAt_four_b_chunk_2_eq_true
  · exact p4sPlacementsAt_four_b_chunk_3_eq_true
  · exact p4sPlacementsAt_four_b_chunk_4_eq_true
  · exact p4sPlacementsAt_four_b_chunk_5_eq_true
  · exact p4sPlacementsAt_four_b_chunk_6_eq_true
  · exact p4sPlacementsAt_four_b_chunk_7_eq_true

theorem p4sPlacementsAt_four_b_eq_true :
    p4sPlacementsAtDeletedPair 4 5 6 = true := by
  exact p4sPlacementsAtDeletedPair_eq_true_of_chunks
    p4sPlacementsAt_four_b_chunks_eq_true

end Problem97.ErasedCertificate.ErasedNativeClassifier
