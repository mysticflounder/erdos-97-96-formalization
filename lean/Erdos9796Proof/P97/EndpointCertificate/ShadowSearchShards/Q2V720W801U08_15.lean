/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.ShadowSearch

/-!
# Endpoint finite shadow search shard, `.Q2`, `.v = 720`, `.w = 801`

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

/-- Valid shadows in `.Q2/720/801/120` are row-bank covered. -/
theorem q2_v720_w801_u120_valid :
    endpointDepth3SubtreeValidAllAccepted .Q2 720 801 120 =
      true := by
  native_decide

/-- Valid shadows in `.Q2/720/801/154` are row-bank covered. -/
theorem q2_v720_w801_u154_valid :
    endpointDepth3SubtreeValidAllAccepted .Q2 720 801 154 =
      true := by
  native_decide

/-- Valid shadows in `.Q2/720/801/170` are row-bank covered. -/
theorem q2_v720_w801_u170_valid :
    endpointDepth3SubtreeValidAllAccepted .Q2 720 801 170 =
      true := by
  native_decide

/-- Valid shadows in `.Q2/720/801/178` are row-bank covered. -/
theorem q2_v720_w801_u178_valid :
    endpointDepth3SubtreeValidAllAccepted .Q2 720 801 178 =
      true := by
  native_decide

/-- Valid shadows in `.Q2/720/801/184` are row-bank covered. -/
theorem q2_v720_w801_u184_valid :
    endpointDepth3SubtreeValidAllAccepted .Q2 720 801 184 =
      true := by
  native_decide

/-- Valid shadows in `.Q2/720/801/284` are row-bank covered. -/
theorem q2_v720_w801_u284_valid :
    endpointDepth3SubtreeValidAllAccepted .Q2 720 801 284 =
      true := by
  native_decide

/-- Valid shadows in `.Q2/720/801/300` are row-bank covered. -/
theorem q2_v720_w801_u300_valid :
    endpointDepth3SubtreeValidAllAccepted .Q2 720 801 300 =
      true := by
  native_decide

/-- Valid shadows in `.Q2/720/801/308` are row-bank covered. -/
theorem q2_v720_w801_u308_valid :
    endpointDepth3SubtreeValidAllAccepted .Q2 720 801 308 =
      true := by
  native_decide

end Depth3Cert

end Search

end ShadowBank

end EndpointCertificate

end Problem97
