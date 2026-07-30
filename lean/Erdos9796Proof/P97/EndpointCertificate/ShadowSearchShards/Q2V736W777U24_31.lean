/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.ShadowSearch

/-!
# Endpoint finite shadow search shard, `.Q2`, `.v = 736`, `.w = 777`

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

/-- Valid shadows in `.Q2/736/777/564` are row-bank covered. -/
theorem q2_v736_w777_u564_valid :
    endpointDepth3SubtreeValidAllAccepted .Q2 736 777 564 =
      true := by
  native_decide

end Depth3Cert

end Search

end ShadowBank

end EndpointCertificate

end Problem97
