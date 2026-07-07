/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.ShadowSearch

/-!
# Endpoint finite shadow search shard, `.Q1`, `.v = 464`, `.w = 785`

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

/-- Valid shadows in `.Q1/464/785/556` are row-bank covered. -/
theorem q1_v464_w785_u556_valid :
    endpointDepth3SubtreeValidAllAccepted .Q1 464 785 556 =
      true := by
  native_decide

/-- Valid shadows in `.Q1/464/785/564` are row-bank covered. -/
theorem q1_v464_w785_u564_valid :
    endpointDepth3SubtreeValidAllAccepted .Q1 464 785 564 =
      true := by
  native_decide

/-- Valid shadows in `.Q1/464/785/568` are row-bank covered. -/
theorem q1_v464_w785_u568_valid :
    endpointDepth3SubtreeValidAllAccepted .Q1 464 785 568 =
      true := by
  native_decide

/-- Valid shadows in `.Q1/464/785/600` are row-bank covered. -/
theorem q1_v464_w785_u600_valid :
    endpointDepth3SubtreeValidAllAccepted .Q1 464 785 600 =
      true := by
  native_decide

/-- Valid shadows in `.Q1/464/785/616` are row-bank covered. -/
theorem q1_v464_w785_u616_valid :
    endpointDepth3SubtreeValidAllAccepted .Q1 464 785 616 =
      true := by
  native_decide

/-- Valid shadows in `.Q1/464/785/624` are row-bank covered. -/
theorem q1_v464_w785_u624_valid :
    endpointDepth3SubtreeValidAllAccepted .Q1 464 785 624 =
      true := by
  native_decide

/-- Valid shadows in `.Q1/464/785/664` are row-bank covered. -/
theorem q1_v464_w785_u664_valid :
    endpointDepth3SubtreeValidAllAccepted .Q1 464 785 664 =
      true := by
  native_decide

/-- Valid shadows in `.Q1/464/785/680` are row-bank covered. -/
theorem q1_v464_w785_u680_valid :
    endpointDepth3SubtreeValidAllAccepted .Q1 464 785 680 =
      true := by
  native_decide

end Depth3Cert

end Search

end ShadowBank

end EndpointCertificate

end Problem97
