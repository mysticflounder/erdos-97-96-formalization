/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.ShadowSearch

/-!
# Endpoint finite shadow search shard, `.Q1`, `.v = 464`, `.w = 771`

This generated shard checks the *reachable* fixed `.u` subtrees in the endpoint
shadow search.  Each theorem says every valid endpoint shadow in that subtree is
row-bank covered.  Keeping these native computations in small modules lets
downstream coverage proofs import theorem constants instead of re-running the
search.  Triples the DFS pruning tests already reject carry no theorem here;
`EndpointCertificate.ShadowSearchPruning` covers them without enumeration.
-/

namespace Problem97

namespace EndpointCertificate

namespace ShadowBank

namespace Search

namespace Depth3Cert

/-- Valid shadows in `.Q1/464/771/312` are row-bank covered. -/
theorem q1_v464_w771_u312_valid :
    endpointDepth3SubtreeValidAllAccepted .Q1 464 771 312 =
      true := by
  native_decide

/-- Valid shadows in `.Q1/464/771/360` are row-bank covered. -/
theorem q1_v464_w771_u360_valid :
    endpointDepth3SubtreeValidAllAccepted .Q1 464 771 360 =
      true := by
  native_decide

/-- Valid shadows in `.Q1/464/771/424` are row-bank covered. -/
theorem q1_v464_w771_u424_valid :
    endpointDepth3SubtreeValidAllAccepted .Q1 464 771 424 =
      true := by
  native_decide

/-- Valid shadows in `.Q1/464/771/540` are row-bank covered. -/
theorem q1_v464_w771_u540_valid :
    endpointDepth3SubtreeValidAllAccepted .Q1 464 771 540 =
      true := by
  native_decide

end Depth3Cert

end Search

end ShadowBank

end EndpointCertificate

end Problem97
