/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.ShadowSearch

/-!
# Endpoint finite shadow search shard, `.Q1`, `.v = 480`, `.w = 801`

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

/-- Valid shadows in `.Q1/480/801/312` are row-bank covered. -/
theorem q1_v480_w801_u312_valid :
    endpointDepth3SubtreeValidAllAccepted .Q1 480 801 312 =
      true := by
  native_decide

/-- Valid shadows in `.Q1/480/801/344` are row-bank covered. -/
theorem q1_v480_w801_u344_valid :
    endpointDepth3SubtreeValidAllAccepted .Q1 480 801 344 =
      true := by
  native_decide

/-- Valid shadows in `.Q1/480/801/360` are row-bank covered. -/
theorem q1_v480_w801_u360_valid :
    endpointDepth3SubtreeValidAllAccepted .Q1 480 801 360 =
      true := by
  native_decide

/-- Valid shadows in `.Q1/480/801/368` are row-bank covered. -/
theorem q1_v480_w801_u368_valid :
    endpointDepth3SubtreeValidAllAccepted .Q1 480 801 368 =
      true := by
  native_decide

/-- Valid shadows in `.Q1/480/801/408` are row-bank covered. -/
theorem q1_v480_w801_u408_valid :
    endpointDepth3SubtreeValidAllAccepted .Q1 480 801 408 =
      true := by
  native_decide

/-- Valid shadows in `.Q1/480/801/424` are row-bank covered. -/
theorem q1_v480_w801_u424_valid :
    endpointDepth3SubtreeValidAllAccepted .Q1 480 801 424 =
      true := by
  native_decide

/-- Valid shadows in `.Q1/480/801/432` are row-bank covered. -/
theorem q1_v480_w801_u432_valid :
    endpointDepth3SubtreeValidAllAccepted .Q1 480 801 432 =
      true := by
  native_decide

/-- Valid shadows in `.Q1/480/801/540` are row-bank covered. -/
theorem q1_v480_w801_u540_valid :
    endpointDepth3SubtreeValidAllAccepted .Q1 480 801 540 =
      true := by
  native_decide

end Depth3Cert

end Search

end ShadowBank

end EndpointCertificate

end Problem97
