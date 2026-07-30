/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchPruning
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q1V452W771U00_07
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q1V452W771U08_15
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q1V452W771U16_23
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q1V452W771U24_31
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q1V452W771U32_32
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q1V452W777U00_07
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q1V452W777U08_15
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q1V452W777U16_23
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q1V452W777U24_31
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q1V452W777U32_32
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q1V452W785U00_07
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q1V452W785U08_15
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q1V452W785U16_23
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q1V452W785U24_31
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q1V452W801U00_07
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q1V452W801U08_15
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q1V452W801U16_23
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q1V452W801U24_31
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q1V456W771U00_07
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q1V456W771U08_15
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q1V456W771U16_23
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q1V456W771U24_31
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q1V456W771U32_32
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q1V456W777U00_07
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q1V456W777U08_15
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q1V456W777U16_23
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q1V456W777U24_31
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q1V456W777U32_32
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q1V456W785U00_07
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q1V456W785U08_15
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q1V456W785U24_31
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q1V456W801U00_07
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q1V456W801U08_15
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q1V456W801U16_23
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q1V464W771U00_07
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q1V464W771U08_15
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q1V464W771U16_23
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q1V464W771U24_31
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q1V464W777U00_07
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q1V464W777U08_15
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q1V464W777U24_31
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q1V464W785U00_07
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q1V464W785U08_15
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q1V464W785U16_23
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q1V464W785U24_31
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q1V464W801U00_07
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q1V464W801U08_15
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q1V464W801U16_23
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q1V480W771U00_07
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q1V480W771U08_15
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q1V480W771U16_23
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q1V480W771U24_31
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q1V480W777U00_07
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q1V480W777U08_15
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q1V480W777U24_31
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q1V480W785U00_07
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q1V480W785U08_15
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q1V480W785U24_31
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q1V480W801U00_07
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q1V480W801U08_15
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q1V480W801U16_23
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q1V480W801U24_31
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q2V708W771U00_07
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q2V708W771U08_15
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q2V708W771U16_23
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q2V708W771U24_31
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q2V708W771U32_32
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q2V708W777U00_07
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q2V708W777U08_15
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q2V708W777U16_23
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q2V708W777U24_31
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q2V708W777U32_32
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q2V708W785U00_07
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q2V708W785U08_15
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q2V708W785U16_23
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q2V708W785U24_31
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q2V708W801U00_07
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q2V708W801U08_15
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q2V708W801U16_23
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q2V708W801U24_31
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q2V712W771U00_07
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q2V712W771U08_15
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q2V712W771U16_23
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q2V712W771U24_31
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q2V712W771U32_32
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q2V712W777U00_07
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q2V712W777U08_15
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q2V712W777U16_23
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q2V712W777U24_31
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q2V712W777U32_32
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q2V712W785U00_07
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q2V712W785U08_15
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q2V712W785U24_31
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q2V712W801U00_07
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q2V712W801U08_15
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q2V712W801U16_23
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q2V720W771U00_07
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q2V720W771U08_15
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q2V720W771U16_23
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q2V720W771U24_31
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q2V720W777U00_07
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q2V720W777U08_15
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q2V720W777U24_31
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q2V720W785U00_07
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q2V720W785U08_15
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q2V720W785U16_23
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q2V720W785U24_31
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q2V720W801U00_07
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q2V720W801U08_15
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q2V720W801U16_23
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q2V736W771U00_07
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q2V736W771U08_15
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q2V736W771U16_23
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q2V736W771U24_31
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q2V736W777U00_07
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q2V736W777U08_15
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q2V736W777U24_31
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q2V736W785U00_07
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q2V736W785U08_15
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q2V736W785U24_31
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q2V736W801U00_07
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q2V736W801U08_15
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q2V736W801U16_23
import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.Q2V736W801U24_31

/-!
# Endpoint finite shadow search shards

This generated coordinator imports every reachable fixed depth-3 endpoint search
shard and dispatches the unreachable triples to the enumeration-free pruning
lemmas in `EndpointCertificate.ShadowSearchPruning`.
-/


namespace Problem97

namespace EndpointCertificate

namespace ShadowBank

namespace Search

/-- Dispatch fixed `.v`/`.w`/`.u` candidate membership in the `.Q1`
endpoint branch to the generated depth-3 valid-subtree certificates. -/
theorem endpointDepth3SubtreeValidAllAccepted_q1_of_mem
    {vmask wmask umask : Nat}
    (hv : vmask ∈ endpointQ1VMasks)
    (hw : wmask ∈ endpointWMasks)
    (hu : umask ∈ endpointUMasks) :
    endpointDepth3SubtreeValidAllAccepted .Q1 vmask wmask umask =
      true := by
  simp [endpointQ1VMasks, endpointWMasks, endpointUMasks] at hv hw hu
  rcases hv with rfl | rfl | rfl | rfl <;>
    rcases hw with rfl | rfl | rfl | rfl <;>
    rcases hu with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact Depth3Cert.q1_v452_w771_u030_valid
  · exact Depth3Cert.q1_v452_w771_u046_valid
  · exact Depth3Cert.q1_v452_w771_u054_valid
  · exact Depth3Cert.q1_v452_w771_u058_valid
  · exact Depth3Cert.q1_v452_w771_u060_valid
  · exact Depth3Cert.q1_v452_w771_u090_valid
  · exact Depth3Cert.q1_v452_w771_u106_valid
  · exact Depth3Cert.q1_v452_w771_u114_valid
  · exact Depth3Cert.q1_v452_w771_u120_valid
  · exact Depth3Cert.q1_v452_w771_u154_valid
  · exact Depth3Cert.q1_v452_w771_u170_valid
  · exact Depth3Cert.q1_v452_w771_u178_valid
  · exact Depth3Cert.q1_v452_w771_u184_valid
  · exact Depth3Cert.q1_v452_w771_u284_valid
  · exact Depth3Cert.q1_v452_w771_u300_valid
  · exact Depth3Cert.q1_v452_w771_u308_valid
  · exact Depth3Cert.q1_v452_w771_u312_valid
  · exact Depth3Cert.q1_v452_w771_u344_valid
  · exact Depth3Cert.q1_v452_w771_u360_valid
  · exact Depth3Cert.q1_v452_w771_u368_valid
  · exact Depth3Cert.q1_v452_w771_u408_valid
  · exact Depth3Cert.q1_v452_w771_u424_valid
  · exact Depth3Cert.q1_v452_w771_u432_valid
  · exact Depth3Cert.q1_v452_w771_u540_valid
  · exact Depth3Cert.q1_v452_w771_u556_valid
  · exact Depth3Cert.q1_v452_w771_u564_valid
  · exact Depth3Cert.q1_v452_w771_u568_valid
  · exact Depth3Cert.q1_v452_w771_u600_valid
  · exact Depth3Cert.q1_v452_w771_u616_valid
  · exact Depth3Cert.q1_v452_w771_u624_valid
  · exact Depth3Cert.q1_v452_w771_u664_valid
  · exact Depth3Cert.q1_v452_w771_u680_valid
  · exact Depth3Cert.q1_v452_w771_u688_valid
  · exact Depth3Cert.q1_v452_w777_u030_valid
  · exact Depth3Cert.q1_v452_w777_u046_valid
  · exact Depth3Cert.q1_v452_w777_u054_valid
  · exact Depth3Cert.q1_v452_w777_u058_valid
  · exact Depth3Cert.q1_v452_w777_u060_valid
  · exact Depth3Cert.q1_v452_w777_u090_valid
  · exact Depth3Cert.q1_v452_w777_u106_valid
  · exact Depth3Cert.q1_v452_w777_u114_valid
  · exact Depth3Cert.q1_v452_w777_u120_valid
  · exact Depth3Cert.q1_v452_w777_u154_valid
  · exact Depth3Cert.q1_v452_w777_u170_valid
  · exact Depth3Cert.q1_v452_w777_u178_valid
  · exact Depth3Cert.q1_v452_w777_u184_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact Depth3Cert.q1_v452_w777_u308_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact Depth3Cert.q1_v452_w777_u368_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact Depth3Cert.q1_v452_w777_u432_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact Depth3Cert.q1_v452_w777_u564_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact Depth3Cert.q1_v452_w777_u624_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact Depth3Cert.q1_v452_w777_u688_valid
  · exact Depth3Cert.q1_v452_w785_u030_valid
  · exact Depth3Cert.q1_v452_w785_u046_valid
  · exact Depth3Cert.q1_v452_w785_u054_valid
  · exact Depth3Cert.q1_v452_w785_u058_valid
  · exact Depth3Cert.q1_v452_w785_u060_valid
  · exact Depth3Cert.q1_v452_w785_u090_valid
  · exact Depth3Cert.q1_v452_w785_u106_valid
  · exact Depth3Cert.q1_v452_w785_u114_valid
  · exact Depth3Cert.q1_v452_w785_u120_valid
  · exact Depth3Cert.q1_v452_w785_u154_valid
  · exact Depth3Cert.q1_v452_w785_u170_valid
  · exact Depth3Cert.q1_v452_w785_u178_valid
  · exact Depth3Cert.q1_v452_w785_u184_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact Depth3Cert.q1_v452_w785_u300_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact Depth3Cert.q1_v452_w785_u360_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact Depth3Cert.q1_v452_w785_u424_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact Depth3Cert.q1_v452_w785_u556_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact Depth3Cert.q1_v452_w785_u616_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact Depth3Cert.q1_v452_w785_u680_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact Depth3Cert.q1_v452_w801_u030_valid
  · exact Depth3Cert.q1_v452_w801_u046_valid
  · exact Depth3Cert.q1_v452_w801_u054_valid
  · exact Depth3Cert.q1_v452_w801_u058_valid
  · exact Depth3Cert.q1_v452_w801_u060_valid
  · exact Depth3Cert.q1_v452_w801_u090_valid
  · exact Depth3Cert.q1_v452_w801_u106_valid
  · exact Depth3Cert.q1_v452_w801_u114_valid
  · exact Depth3Cert.q1_v452_w801_u120_valid
  · exact Depth3Cert.q1_v452_w801_u154_valid
  · exact Depth3Cert.q1_v452_w801_u170_valid
  · exact Depth3Cert.q1_v452_w801_u178_valid
  · exact Depth3Cert.q1_v452_w801_u184_valid
  · exact Depth3Cert.q1_v452_w801_u284_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact Depth3Cert.q1_v452_w801_u344_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact Depth3Cert.q1_v452_w801_u408_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact Depth3Cert.q1_v452_w801_u540_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact Depth3Cert.q1_v452_w801_u600_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact Depth3Cert.q1_v452_w801_u664_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact Depth3Cert.q1_v456_w771_u030_valid
  · exact Depth3Cert.q1_v456_w771_u046_valid
  · exact Depth3Cert.q1_v456_w771_u054_valid
  · exact Depth3Cert.q1_v456_w771_u058_valid
  · exact Depth3Cert.q1_v456_w771_u060_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact Depth3Cert.q1_v456_w771_u114_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact Depth3Cert.q1_v456_w771_u178_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact Depth3Cert.q1_v456_w771_u284_valid
  · exact Depth3Cert.q1_v456_w771_u300_valid
  · exact Depth3Cert.q1_v456_w771_u308_valid
  · exact Depth3Cert.q1_v456_w771_u312_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact Depth3Cert.q1_v456_w771_u368_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact Depth3Cert.q1_v456_w771_u432_valid
  · exact Depth3Cert.q1_v456_w771_u540_valid
  · exact Depth3Cert.q1_v456_w771_u556_valid
  · exact Depth3Cert.q1_v456_w771_u564_valid
  · exact Depth3Cert.q1_v456_w771_u568_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact Depth3Cert.q1_v456_w771_u624_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact Depth3Cert.q1_v456_w771_u688_valid
  · exact Depth3Cert.q1_v456_w777_u030_valid
  · exact Depth3Cert.q1_v456_w777_u046_valid
  · exact Depth3Cert.q1_v456_w777_u054_valid
  · exact Depth3Cert.q1_v456_w777_u058_valid
  · exact Depth3Cert.q1_v456_w777_u060_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact Depth3Cert.q1_v456_w777_u114_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact Depth3Cert.q1_v456_w777_u178_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_pairCounts_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_pairCounts_false (by decide)
  · exact Depth3Cert.q1_v456_w777_u308_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_pairCounts_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_pairCounts_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_pairCounts_false (by decide)
  · exact Depth3Cert.q1_v456_w777_u368_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_pairCounts_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_pairCounts_false (by decide)
  · exact Depth3Cert.q1_v456_w777_u432_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact Depth3Cert.q1_v456_w777_u564_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact Depth3Cert.q1_v456_w777_u624_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact Depth3Cert.q1_v456_w777_u688_valid
  · exact Depth3Cert.q1_v456_w785_u030_valid
  · exact Depth3Cert.q1_v456_w785_u046_valid
  · exact Depth3Cert.q1_v456_w785_u054_valid
  · exact Depth3Cert.q1_v456_w785_u058_valid
  · exact Depth3Cert.q1_v456_w785_u060_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact Depth3Cert.q1_v456_w785_u114_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact Depth3Cert.q1_v456_w785_u178_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact Depth3Cert.q1_v456_w785_u300_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact Depth3Cert.q1_v456_w785_u556_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact Depth3Cert.q1_v456_w801_u030_valid
  · exact Depth3Cert.q1_v456_w801_u046_valid
  · exact Depth3Cert.q1_v456_w801_u054_valid
  · exact Depth3Cert.q1_v456_w801_u058_valid
  · exact Depth3Cert.q1_v456_w801_u060_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact Depth3Cert.q1_v456_w801_u114_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact Depth3Cert.q1_v456_w801_u178_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact Depth3Cert.q1_v456_w801_u284_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact Depth3Cert.q1_v456_w801_u540_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact Depth3Cert.q1_v464_w771_u030_valid
  · exact Depth3Cert.q1_v464_w771_u046_valid
  · exact Depth3Cert.q1_v464_w771_u054_valid
  · exact Depth3Cert.q1_v464_w771_u058_valid
  · exact Depth3Cert.q1_v464_w771_u060_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact Depth3Cert.q1_v464_w771_u106_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact Depth3Cert.q1_v464_w771_u170_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact Depth3Cert.q1_v464_w771_u284_valid
  · exact Depth3Cert.q1_v464_w771_u300_valid
  · exact Depth3Cert.q1_v464_w771_u308_valid
  · exact Depth3Cert.q1_v464_w771_u312_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact Depth3Cert.q1_v464_w771_u360_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact Depth3Cert.q1_v464_w771_u424_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact Depth3Cert.q1_v464_w771_u540_valid
  · exact Depth3Cert.q1_v464_w771_u556_valid
  · exact Depth3Cert.q1_v464_w771_u564_valid
  · exact Depth3Cert.q1_v464_w771_u568_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact Depth3Cert.q1_v464_w771_u616_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact Depth3Cert.q1_v464_w771_u680_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact Depth3Cert.q1_v464_w777_u030_valid
  · exact Depth3Cert.q1_v464_w777_u046_valid
  · exact Depth3Cert.q1_v464_w777_u054_valid
  · exact Depth3Cert.q1_v464_w777_u058_valid
  · exact Depth3Cert.q1_v464_w777_u060_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact Depth3Cert.q1_v464_w777_u106_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact Depth3Cert.q1_v464_w777_u170_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact Depth3Cert.q1_v464_w777_u308_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact Depth3Cert.q1_v464_w777_u564_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact Depth3Cert.q1_v464_w785_u030_valid
  · exact Depth3Cert.q1_v464_w785_u046_valid
  · exact Depth3Cert.q1_v464_w785_u054_valid
  · exact Depth3Cert.q1_v464_w785_u058_valid
  · exact Depth3Cert.q1_v464_w785_u060_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact Depth3Cert.q1_v464_w785_u106_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact Depth3Cert.q1_v464_w785_u170_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_pairCounts_false (by decide)
  · exact Depth3Cert.q1_v464_w785_u300_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_pairCounts_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_pairCounts_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_pairCounts_false (by decide)
  · exact Depth3Cert.q1_v464_w785_u360_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_pairCounts_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_pairCounts_false (by decide)
  · exact Depth3Cert.q1_v464_w785_u424_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_pairCounts_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact Depth3Cert.q1_v464_w785_u556_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact Depth3Cert.q1_v464_w785_u616_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact Depth3Cert.q1_v464_w785_u680_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact Depth3Cert.q1_v464_w801_u030_valid
  · exact Depth3Cert.q1_v464_w801_u046_valid
  · exact Depth3Cert.q1_v464_w801_u054_valid
  · exact Depth3Cert.q1_v464_w801_u058_valid
  · exact Depth3Cert.q1_v464_w801_u060_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact Depth3Cert.q1_v464_w801_u106_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact Depth3Cert.q1_v464_w801_u170_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact Depth3Cert.q1_v464_w801_u284_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact Depth3Cert.q1_v464_w801_u540_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact Depth3Cert.q1_v480_w771_u030_valid
  · exact Depth3Cert.q1_v480_w771_u046_valid
  · exact Depth3Cert.q1_v480_w771_u054_valid
  · exact Depth3Cert.q1_v480_w771_u058_valid
  · exact Depth3Cert.q1_v480_w771_u060_valid
  · exact Depth3Cert.q1_v480_w771_u090_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact Depth3Cert.q1_v480_w771_u154_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact Depth3Cert.q1_v480_w771_u284_valid
  · exact Depth3Cert.q1_v480_w771_u300_valid
  · exact Depth3Cert.q1_v480_w771_u308_valid
  · exact Depth3Cert.q1_v480_w771_u312_valid
  · exact Depth3Cert.q1_v480_w771_u344_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact Depth3Cert.q1_v480_w771_u408_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact Depth3Cert.q1_v480_w771_u540_valid
  · exact Depth3Cert.q1_v480_w771_u556_valid
  · exact Depth3Cert.q1_v480_w771_u564_valid
  · exact Depth3Cert.q1_v480_w771_u568_valid
  · exact Depth3Cert.q1_v480_w771_u600_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact Depth3Cert.q1_v480_w771_u664_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact Depth3Cert.q1_v480_w777_u030_valid
  · exact Depth3Cert.q1_v480_w777_u046_valid
  · exact Depth3Cert.q1_v480_w777_u054_valid
  · exact Depth3Cert.q1_v480_w777_u058_valid
  · exact Depth3Cert.q1_v480_w777_u060_valid
  · exact Depth3Cert.q1_v480_w777_u090_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact Depth3Cert.q1_v480_w777_u154_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact Depth3Cert.q1_v480_w777_u308_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact Depth3Cert.q1_v480_w777_u564_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact Depth3Cert.q1_v480_w785_u030_valid
  · exact Depth3Cert.q1_v480_w785_u046_valid
  · exact Depth3Cert.q1_v480_w785_u054_valid
  · exact Depth3Cert.q1_v480_w785_u058_valid
  · exact Depth3Cert.q1_v480_w785_u060_valid
  · exact Depth3Cert.q1_v480_w785_u090_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact Depth3Cert.q1_v480_w785_u154_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact Depth3Cert.q1_v480_w785_u300_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact Depth3Cert.q1_v480_w785_u556_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact Depth3Cert.q1_v480_w801_u030_valid
  · exact Depth3Cert.q1_v480_w801_u046_valid
  · exact Depth3Cert.q1_v480_w801_u054_valid
  · exact Depth3Cert.q1_v480_w801_u058_valid
  · exact Depth3Cert.q1_v480_w801_u060_valid
  · exact Depth3Cert.q1_v480_w801_u090_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact Depth3Cert.q1_v480_w801_u154_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact Depth3Cert.q1_v480_w801_u284_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_pairCounts_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_pairCounts_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_pairCounts_false (by decide)
  · exact Depth3Cert.q1_v480_w801_u344_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_pairCounts_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_pairCounts_false (by decide)
  · exact Depth3Cert.q1_v480_w801_u408_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_pairCounts_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_pairCounts_false (by decide)
  · exact Depth3Cert.q1_v480_w801_u540_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact Depth3Cert.q1_v480_w801_u600_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact Depth3Cert.q1_v480_w801_u664_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)


/-- Dispatch fixed `.v`/`.w`/`.u` candidate membership in the `.Q2`
endpoint branch to the generated depth-3 valid-subtree certificates. -/
theorem endpointDepth3SubtreeValidAllAccepted_q2_of_mem
    {vmask wmask umask : Nat}
    (hv : vmask ∈ endpointQ2VMasks)
    (hw : wmask ∈ endpointWMasks)
    (hu : umask ∈ endpointUMasks) :
    endpointDepth3SubtreeValidAllAccepted .Q2 vmask wmask umask =
      true := by
  simp [endpointQ2VMasks, endpointWMasks, endpointUMasks] at hv hw hu
  rcases hv with rfl | rfl | rfl | rfl <;>
    rcases hw with rfl | rfl | rfl | rfl <;>
    rcases hu with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact Depth3Cert.q2_v708_w771_u030_valid
  · exact Depth3Cert.q2_v708_w771_u046_valid
  · exact Depth3Cert.q2_v708_w771_u054_valid
  · exact Depth3Cert.q2_v708_w771_u058_valid
  · exact Depth3Cert.q2_v708_w771_u060_valid
  · exact Depth3Cert.q2_v708_w771_u090_valid
  · exact Depth3Cert.q2_v708_w771_u106_valid
  · exact Depth3Cert.q2_v708_w771_u114_valid
  · exact Depth3Cert.q2_v708_w771_u120_valid
  · exact Depth3Cert.q2_v708_w771_u154_valid
  · exact Depth3Cert.q2_v708_w771_u170_valid
  · exact Depth3Cert.q2_v708_w771_u178_valid
  · exact Depth3Cert.q2_v708_w771_u184_valid
  · exact Depth3Cert.q2_v708_w771_u284_valid
  · exact Depth3Cert.q2_v708_w771_u300_valid
  · exact Depth3Cert.q2_v708_w771_u308_valid
  · exact Depth3Cert.q2_v708_w771_u312_valid
  · exact Depth3Cert.q2_v708_w771_u344_valid
  · exact Depth3Cert.q2_v708_w771_u360_valid
  · exact Depth3Cert.q2_v708_w771_u368_valid
  · exact Depth3Cert.q2_v708_w771_u408_valid
  · exact Depth3Cert.q2_v708_w771_u424_valid
  · exact Depth3Cert.q2_v708_w771_u432_valid
  · exact Depth3Cert.q2_v708_w771_u540_valid
  · exact Depth3Cert.q2_v708_w771_u556_valid
  · exact Depth3Cert.q2_v708_w771_u564_valid
  · exact Depth3Cert.q2_v708_w771_u568_valid
  · exact Depth3Cert.q2_v708_w771_u600_valid
  · exact Depth3Cert.q2_v708_w771_u616_valid
  · exact Depth3Cert.q2_v708_w771_u624_valid
  · exact Depth3Cert.q2_v708_w771_u664_valid
  · exact Depth3Cert.q2_v708_w771_u680_valid
  · exact Depth3Cert.q2_v708_w771_u688_valid
  · exact Depth3Cert.q2_v708_w777_u030_valid
  · exact Depth3Cert.q2_v708_w777_u046_valid
  · exact Depth3Cert.q2_v708_w777_u054_valid
  · exact Depth3Cert.q2_v708_w777_u058_valid
  · exact Depth3Cert.q2_v708_w777_u060_valid
  · exact Depth3Cert.q2_v708_w777_u090_valid
  · exact Depth3Cert.q2_v708_w777_u106_valid
  · exact Depth3Cert.q2_v708_w777_u114_valid
  · exact Depth3Cert.q2_v708_w777_u120_valid
  · exact Depth3Cert.q2_v708_w777_u154_valid
  · exact Depth3Cert.q2_v708_w777_u170_valid
  · exact Depth3Cert.q2_v708_w777_u178_valid
  · exact Depth3Cert.q2_v708_w777_u184_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact Depth3Cert.q2_v708_w777_u308_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact Depth3Cert.q2_v708_w777_u368_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact Depth3Cert.q2_v708_w777_u432_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact Depth3Cert.q2_v708_w777_u564_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact Depth3Cert.q2_v708_w777_u624_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact Depth3Cert.q2_v708_w777_u688_valid
  · exact Depth3Cert.q2_v708_w785_u030_valid
  · exact Depth3Cert.q2_v708_w785_u046_valid
  · exact Depth3Cert.q2_v708_w785_u054_valid
  · exact Depth3Cert.q2_v708_w785_u058_valid
  · exact Depth3Cert.q2_v708_w785_u060_valid
  · exact Depth3Cert.q2_v708_w785_u090_valid
  · exact Depth3Cert.q2_v708_w785_u106_valid
  · exact Depth3Cert.q2_v708_w785_u114_valid
  · exact Depth3Cert.q2_v708_w785_u120_valid
  · exact Depth3Cert.q2_v708_w785_u154_valid
  · exact Depth3Cert.q2_v708_w785_u170_valid
  · exact Depth3Cert.q2_v708_w785_u178_valid
  · exact Depth3Cert.q2_v708_w785_u184_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact Depth3Cert.q2_v708_w785_u300_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact Depth3Cert.q2_v708_w785_u360_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact Depth3Cert.q2_v708_w785_u424_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact Depth3Cert.q2_v708_w785_u556_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact Depth3Cert.q2_v708_w785_u616_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact Depth3Cert.q2_v708_w785_u680_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact Depth3Cert.q2_v708_w801_u030_valid
  · exact Depth3Cert.q2_v708_w801_u046_valid
  · exact Depth3Cert.q2_v708_w801_u054_valid
  · exact Depth3Cert.q2_v708_w801_u058_valid
  · exact Depth3Cert.q2_v708_w801_u060_valid
  · exact Depth3Cert.q2_v708_w801_u090_valid
  · exact Depth3Cert.q2_v708_w801_u106_valid
  · exact Depth3Cert.q2_v708_w801_u114_valid
  · exact Depth3Cert.q2_v708_w801_u120_valid
  · exact Depth3Cert.q2_v708_w801_u154_valid
  · exact Depth3Cert.q2_v708_w801_u170_valid
  · exact Depth3Cert.q2_v708_w801_u178_valid
  · exact Depth3Cert.q2_v708_w801_u184_valid
  · exact Depth3Cert.q2_v708_w801_u284_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact Depth3Cert.q2_v708_w801_u344_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact Depth3Cert.q2_v708_w801_u408_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact Depth3Cert.q2_v708_w801_u540_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact Depth3Cert.q2_v708_w801_u600_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact Depth3Cert.q2_v708_w801_u664_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact Depth3Cert.q2_v712_w771_u030_valid
  · exact Depth3Cert.q2_v712_w771_u046_valid
  · exact Depth3Cert.q2_v712_w771_u054_valid
  · exact Depth3Cert.q2_v712_w771_u058_valid
  · exact Depth3Cert.q2_v712_w771_u060_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact Depth3Cert.q2_v712_w771_u114_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact Depth3Cert.q2_v712_w771_u178_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact Depth3Cert.q2_v712_w771_u284_valid
  · exact Depth3Cert.q2_v712_w771_u300_valid
  · exact Depth3Cert.q2_v712_w771_u308_valid
  · exact Depth3Cert.q2_v712_w771_u312_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact Depth3Cert.q2_v712_w771_u368_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact Depth3Cert.q2_v712_w771_u432_valid
  · exact Depth3Cert.q2_v712_w771_u540_valid
  · exact Depth3Cert.q2_v712_w771_u556_valid
  · exact Depth3Cert.q2_v712_w771_u564_valid
  · exact Depth3Cert.q2_v712_w771_u568_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact Depth3Cert.q2_v712_w771_u624_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact Depth3Cert.q2_v712_w771_u688_valid
  · exact Depth3Cert.q2_v712_w777_u030_valid
  · exact Depth3Cert.q2_v712_w777_u046_valid
  · exact Depth3Cert.q2_v712_w777_u054_valid
  · exact Depth3Cert.q2_v712_w777_u058_valid
  · exact Depth3Cert.q2_v712_w777_u060_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact Depth3Cert.q2_v712_w777_u114_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact Depth3Cert.q2_v712_w777_u178_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact Depth3Cert.q2_v712_w777_u308_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact Depth3Cert.q2_v712_w777_u368_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact Depth3Cert.q2_v712_w777_u432_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_pairCounts_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_pairCounts_false (by decide)
  · exact Depth3Cert.q2_v712_w777_u564_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_pairCounts_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_pairCounts_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_pairCounts_false (by decide)
  · exact Depth3Cert.q2_v712_w777_u624_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_pairCounts_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_pairCounts_false (by decide)
  · exact Depth3Cert.q2_v712_w777_u688_valid
  · exact Depth3Cert.q2_v712_w785_u030_valid
  · exact Depth3Cert.q2_v712_w785_u046_valid
  · exact Depth3Cert.q2_v712_w785_u054_valid
  · exact Depth3Cert.q2_v712_w785_u058_valid
  · exact Depth3Cert.q2_v712_w785_u060_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact Depth3Cert.q2_v712_w785_u114_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact Depth3Cert.q2_v712_w785_u178_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact Depth3Cert.q2_v712_w785_u300_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact Depth3Cert.q2_v712_w785_u556_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact Depth3Cert.q2_v712_w801_u030_valid
  · exact Depth3Cert.q2_v712_w801_u046_valid
  · exact Depth3Cert.q2_v712_w801_u054_valid
  · exact Depth3Cert.q2_v712_w801_u058_valid
  · exact Depth3Cert.q2_v712_w801_u060_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact Depth3Cert.q2_v712_w801_u114_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact Depth3Cert.q2_v712_w801_u178_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact Depth3Cert.q2_v712_w801_u284_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact Depth3Cert.q2_v712_w801_u540_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact Depth3Cert.q2_v720_w771_u030_valid
  · exact Depth3Cert.q2_v720_w771_u046_valid
  · exact Depth3Cert.q2_v720_w771_u054_valid
  · exact Depth3Cert.q2_v720_w771_u058_valid
  · exact Depth3Cert.q2_v720_w771_u060_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact Depth3Cert.q2_v720_w771_u106_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact Depth3Cert.q2_v720_w771_u170_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact Depth3Cert.q2_v720_w771_u284_valid
  · exact Depth3Cert.q2_v720_w771_u300_valid
  · exact Depth3Cert.q2_v720_w771_u308_valid
  · exact Depth3Cert.q2_v720_w771_u312_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact Depth3Cert.q2_v720_w771_u360_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact Depth3Cert.q2_v720_w771_u424_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact Depth3Cert.q2_v720_w771_u540_valid
  · exact Depth3Cert.q2_v720_w771_u556_valid
  · exact Depth3Cert.q2_v720_w771_u564_valid
  · exact Depth3Cert.q2_v720_w771_u568_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact Depth3Cert.q2_v720_w771_u616_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact Depth3Cert.q2_v720_w771_u680_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact Depth3Cert.q2_v720_w777_u030_valid
  · exact Depth3Cert.q2_v720_w777_u046_valid
  · exact Depth3Cert.q2_v720_w777_u054_valid
  · exact Depth3Cert.q2_v720_w777_u058_valid
  · exact Depth3Cert.q2_v720_w777_u060_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact Depth3Cert.q2_v720_w777_u106_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact Depth3Cert.q2_v720_w777_u170_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact Depth3Cert.q2_v720_w777_u308_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact Depth3Cert.q2_v720_w777_u564_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact Depth3Cert.q2_v720_w785_u030_valid
  · exact Depth3Cert.q2_v720_w785_u046_valid
  · exact Depth3Cert.q2_v720_w785_u054_valid
  · exact Depth3Cert.q2_v720_w785_u058_valid
  · exact Depth3Cert.q2_v720_w785_u060_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact Depth3Cert.q2_v720_w785_u106_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact Depth3Cert.q2_v720_w785_u170_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact Depth3Cert.q2_v720_w785_u300_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact Depth3Cert.q2_v720_w785_u360_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact Depth3Cert.q2_v720_w785_u424_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_pairCounts_false (by decide)
  · exact Depth3Cert.q2_v720_w785_u556_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_pairCounts_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_pairCounts_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_pairCounts_false (by decide)
  · exact Depth3Cert.q2_v720_w785_u616_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_pairCounts_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_pairCounts_false (by decide)
  · exact Depth3Cert.q2_v720_w785_u680_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_pairCounts_false (by decide)
  · exact Depth3Cert.q2_v720_w801_u030_valid
  · exact Depth3Cert.q2_v720_w801_u046_valid
  · exact Depth3Cert.q2_v720_w801_u054_valid
  · exact Depth3Cert.q2_v720_w801_u058_valid
  · exact Depth3Cert.q2_v720_w801_u060_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact Depth3Cert.q2_v720_w801_u106_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact Depth3Cert.q2_v720_w801_u170_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact Depth3Cert.q2_v720_w801_u284_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact Depth3Cert.q2_v720_w801_u540_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact Depth3Cert.q2_v736_w771_u030_valid
  · exact Depth3Cert.q2_v736_w771_u046_valid
  · exact Depth3Cert.q2_v736_w771_u054_valid
  · exact Depth3Cert.q2_v736_w771_u058_valid
  · exact Depth3Cert.q2_v736_w771_u060_valid
  · exact Depth3Cert.q2_v736_w771_u090_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact Depth3Cert.q2_v736_w771_u154_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact Depth3Cert.q2_v736_w771_u284_valid
  · exact Depth3Cert.q2_v736_w771_u300_valid
  · exact Depth3Cert.q2_v736_w771_u308_valid
  · exact Depth3Cert.q2_v736_w771_u312_valid
  · exact Depth3Cert.q2_v736_w771_u344_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact Depth3Cert.q2_v736_w771_u408_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact Depth3Cert.q2_v736_w771_u540_valid
  · exact Depth3Cert.q2_v736_w771_u556_valid
  · exact Depth3Cert.q2_v736_w771_u564_valid
  · exact Depth3Cert.q2_v736_w771_u568_valid
  · exact Depth3Cert.q2_v736_w771_u600_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact Depth3Cert.q2_v736_w771_u664_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact Depth3Cert.q2_v736_w777_u030_valid
  · exact Depth3Cert.q2_v736_w777_u046_valid
  · exact Depth3Cert.q2_v736_w777_u054_valid
  · exact Depth3Cert.q2_v736_w777_u058_valid
  · exact Depth3Cert.q2_v736_w777_u060_valid
  · exact Depth3Cert.q2_v736_w777_u090_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact Depth3Cert.q2_v736_w777_u154_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact Depth3Cert.q2_v736_w777_u308_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact Depth3Cert.q2_v736_w777_u564_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact Depth3Cert.q2_v736_w785_u030_valid
  · exact Depth3Cert.q2_v736_w785_u046_valid
  · exact Depth3Cert.q2_v736_w785_u054_valid
  · exact Depth3Cert.q2_v736_w785_u058_valid
  · exact Depth3Cert.q2_v736_w785_u060_valid
  · exact Depth3Cert.q2_v736_w785_u090_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact Depth3Cert.q2_v736_w785_u154_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact Depth3Cert.q2_v736_w785_u300_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact Depth3Cert.q2_v736_w785_u556_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact Depth3Cert.q2_v736_w801_u030_valid
  · exact Depth3Cert.q2_v736_w801_u046_valid
  · exact Depth3Cert.q2_v736_w801_u054_valid
  · exact Depth3Cert.q2_v736_w801_u058_valid
  · exact Depth3Cert.q2_v736_w801_u060_valid
  · exact Depth3Cert.q2_v736_w801_u090_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact Depth3Cert.q2_v736_w801_u154_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false (by decide)
  · exact Depth3Cert.q2_v736_w801_u284_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact Depth3Cert.q2_v736_w801_u344_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact Depth3Cert.q2_v736_w801_u408_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false (by decide)
  · exact Depth3Cert.q2_v736_w801_u540_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_pairCounts_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_pairCounts_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_pairCounts_false (by decide)
  · exact Depth3Cert.q2_v736_w801_u600_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_pairCounts_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_pairCounts_false (by decide)
  · exact Depth3Cert.q2_v736_w801_u664_valid
  · exact endpointDepth3SubtreeValidAllAccepted_of_pairCounts_false (by decide)
  · exact endpointDepth3SubtreeValidAllAccepted_of_pairCounts_false (by decide)


/-- Dispatch endpoint candidate membership to the generated depth-3
valid-subtree certificates. -/
theorem endpointDepth3SubtreeValidAllAccepted_of_mem_candidates
    {escapee : Label} {vmask wmask umask : Nat}
    (hesc : escapee ∈ endpointSearchEscapees)
    (hv : vmask ∈ endpointCandidateMasks escapee .v)
    (hw : wmask ∈ endpointCandidateMasks escapee .w)
    (hu : umask ∈ endpointCandidateMasks escapee .u) :
    endpointDepth3SubtreeValidAllAccepted escapee vmask wmask umask =
      true := by
  simp [endpointSearchEscapees] at hesc
  rcases hesc with rfl | rfl
  · rw [endpointCandidateMasks_q1_v] at hv
    rw [endpointCandidateMasks_q1_w] at hw
    rw [endpointCandidateMasks_q1_u] at hu
    exact endpointDepth3SubtreeValidAllAccepted_q1_of_mem hv hw hu
  · rw [endpointCandidateMasks_q2_v] at hv
    rw [endpointCandidateMasks_q2_w] at hw
    rw [endpointCandidateMasks_q2_u] at hu
    exact endpointDepth3SubtreeValidAllAccepted_q2_of_mem hv hw hu

end Search

end ShadowBank

end EndpointCertificate

end Problem97

