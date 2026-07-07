/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.ShadowSearch

/-!
# Endpoint finite shadow search shard, `.Q2`, `.v = 736`, `.w = 785`

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

/-- Valid shadows in `.Q2/736/785/120` are row-bank covered. -/
theorem q2_v736_w785_u120_valid :
    endpointDepth3SubtreeValidAllAccepted .Q2 736 785 120 =
      true := by
  native_decide

/-- Valid shadows in `.Q2/736/785/154` are row-bank covered. -/
theorem q2_v736_w785_u154_valid :
    endpointDepth3SubtreeValidAllAccepted .Q2 736 785 154 =
      true := by
  native_decide

/-- Valid shadows in `.Q2/736/785/170` are row-bank covered. -/
theorem q2_v736_w785_u170_valid :
    endpointDepth3SubtreeValidAllAccepted .Q2 736 785 170 =
      true := by
  native_decide

/-- Valid shadows in `.Q2/736/785/178` are row-bank covered. -/
theorem q2_v736_w785_u178_valid :
    endpointDepth3SubtreeValidAllAccepted .Q2 736 785 178 =
      true := by
  native_decide

/-- Valid shadows in `.Q2/736/785/184` are row-bank covered. -/
theorem q2_v736_w785_u184_valid :
    endpointDepth3SubtreeValidAllAccepted .Q2 736 785 184 =
      true := by
  native_decide

/-- Valid shadows in `.Q2/736/785/284` are row-bank covered. -/
theorem q2_v736_w785_u284_valid :
    endpointDepth3SubtreeValidAllAccepted .Q2 736 785 284 =
      true := by
  native_decide

/-- Valid shadows in `.Q2/736/785/300` are row-bank covered. -/
theorem q2_v736_w785_u300_valid :
    endpointDepth3SubtreeValidAllAccepted .Q2 736 785 300 =
      true := by
  native_decide

/-- Valid shadows in `.Q2/736/785/308` are row-bank covered. -/
theorem q2_v736_w785_u308_valid :
    endpointDepth3SubtreeValidAllAccepted .Q2 736 785 308 =
      true := by
  native_decide

end Depth3Cert

end Search

end ShadowBank

end EndpointCertificate

end Problem97
