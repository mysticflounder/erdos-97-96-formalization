/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.ShadowSearch

/-!
# Endpoint finite shadow search shard, `.Q2`, `.v = 720`, `.w = 777`

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

/-- Valid shadows in `.Q2/720/777/30` are row-bank covered. -/
theorem q2_v720_w777_u030_valid :
    endpointDepth3SubtreeValidAllAccepted .Q2 720 777 30 =
      true := by
  native_decide

/-- Valid shadows in `.Q2/720/777/46` are row-bank covered. -/
theorem q2_v720_w777_u046_valid :
    endpointDepth3SubtreeValidAllAccepted .Q2 720 777 46 =
      true := by
  native_decide

/-- Valid shadows in `.Q2/720/777/54` are row-bank covered. -/
theorem q2_v720_w777_u054_valid :
    endpointDepth3SubtreeValidAllAccepted .Q2 720 777 54 =
      true := by
  native_decide

/-- Valid shadows in `.Q2/720/777/58` are row-bank covered. -/
theorem q2_v720_w777_u058_valid :
    endpointDepth3SubtreeValidAllAccepted .Q2 720 777 58 =
      true := by
  native_decide

/-- Valid shadows in `.Q2/720/777/60` are row-bank covered. -/
theorem q2_v720_w777_u060_valid :
    endpointDepth3SubtreeValidAllAccepted .Q2 720 777 60 =
      true := by
  native_decide

/-- Valid shadows in `.Q2/720/777/90` are row-bank covered. -/
theorem q2_v720_w777_u090_valid :
    endpointDepth3SubtreeValidAllAccepted .Q2 720 777 90 =
      true := by
  native_decide

/-- Valid shadows in `.Q2/720/777/106` are row-bank covered. -/
theorem q2_v720_w777_u106_valid :
    endpointDepth3SubtreeValidAllAccepted .Q2 720 777 106 =
      true := by
  native_decide

/-- Valid shadows in `.Q2/720/777/114` are row-bank covered. -/
theorem q2_v720_w777_u114_valid :
    endpointDepth3SubtreeValidAllAccepted .Q2 720 777 114 =
      true := by
  native_decide

end Depth3Cert

end Search

end ShadowBank

end EndpointCertificate

end Problem97
