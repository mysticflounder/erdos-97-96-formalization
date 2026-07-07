/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.ShadowSearch

/-!
# Endpoint finite shadow search shard, `.Q1`, `.v = 456`, `.w = 801`

This generated shard checks fixed `.u` subtrees in the endpoint shadow search.
Each theorem says every valid endpoint shadow in that subtree is row-bank
covered.  Keeping these native computations in small modules lets downstream
coverage proofs import theorem constants instead of re-running the search.
-/

namespace Problem97

namespace EndpointCertificate

namespace ShadowBank

namespace Search

namespace Depth3Cert

/-- Valid shadows in `.Q1/456/801/30` are row-bank covered. -/
theorem q1_v456_w801_u030_valid :
    endpointDepth3SubtreeValidAllAccepted .Q1 456 801 30 =
      true := by
  native_decide

/-- Valid shadows in `.Q1/456/801/46` are row-bank covered. -/
theorem q1_v456_w801_u046_valid :
    endpointDepth3SubtreeValidAllAccepted .Q1 456 801 46 =
      true := by
  native_decide

/-- Valid shadows in `.Q1/456/801/54` are row-bank covered. -/
theorem q1_v456_w801_u054_valid :
    endpointDepth3SubtreeValidAllAccepted .Q1 456 801 54 =
      true := by
  native_decide

/-- Valid shadows in `.Q1/456/801/58` are row-bank covered. -/
theorem q1_v456_w801_u058_valid :
    endpointDepth3SubtreeValidAllAccepted .Q1 456 801 58 =
      true := by
  native_decide

/-- Valid shadows in `.Q1/456/801/60` are row-bank covered. -/
theorem q1_v456_w801_u060_valid :
    endpointDepth3SubtreeValidAllAccepted .Q1 456 801 60 =
      true := by
  native_decide

/-- Valid shadows in `.Q1/456/801/90` are row-bank covered. -/
theorem q1_v456_w801_u090_valid :
    endpointDepth3SubtreeValidAllAccepted .Q1 456 801 90 =
      true := by
  native_decide

/-- Valid shadows in `.Q1/456/801/106` are row-bank covered. -/
theorem q1_v456_w801_u106_valid :
    endpointDepth3SubtreeValidAllAccepted .Q1 456 801 106 =
      true := by
  native_decide

/-- Valid shadows in `.Q1/456/801/114` are row-bank covered. -/
theorem q1_v456_w801_u114_valid :
    endpointDepth3SubtreeValidAllAccepted .Q1 456 801 114 =
      true := by
  native_decide

end Depth3Cert

end Search

end ShadowBank

end EndpointCertificate

end Problem97
