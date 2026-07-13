/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ErasedCertificate.P2Placement10B0
import Erdos9796Proof.P97.ErasedCertificate.P2Placement10B1
import Erdos9796Proof.P97.ErasedCertificate.P2Placement10B2
import Erdos9796Proof.P97.ErasedCertificate.P2Placement10B3
import Erdos9796Proof.P97.ErasedCertificate.P2Placement10B4
import Erdos9796Proof.P97.ErasedCertificate.P2Placement10B5
import Erdos9796Proof.P97.ErasedCertificate.P2Placement10B6
import Erdos9796Proof.P97.ErasedCertificate.P2Placement10B7

/-! Native P2 placement certificate for center 10 and deleted labels 5-6. -/

namespace Problem97.ErasedCertificate.ErasedNativeClassifier

theorem p2PlacementsAt_ten_b_chunks_eq_true :
    p2PlacementsAtDeletedPairChunks 10 5 6 = true := by
  apply List.all_eq_true.mpr
  intro chunk hchunk
  have hchunkLt : chunk < 8 := List.mem_range.mp hchunk
  interval_cases chunk
  · exact p2PlacementsAt_ten_b_chunk_0_eq_true
  · exact p2PlacementsAt_ten_b_chunk_1_eq_true
  · exact p2PlacementsAt_ten_b_chunk_2_eq_true
  · exact p2PlacementsAt_ten_b_chunk_3_eq_true
  · exact p2PlacementsAt_ten_b_chunk_4_eq_true
  · exact p2PlacementsAt_ten_b_chunk_5_eq_true
  · exact p2PlacementsAt_ten_b_chunk_6_eq_true
  · exact p2PlacementsAt_ten_b_chunk_7_eq_true

theorem p2PlacementsAt_ten_b_eq_true :
    p2PlacementsAtDeletedPair 10 5 6 = true := by
  exact p2PlacementsAtDeletedPair_eq_true_of_chunks
    p2PlacementsAt_ten_b_chunks_eq_true

end Problem97.ErasedCertificate.ErasedNativeClassifier
