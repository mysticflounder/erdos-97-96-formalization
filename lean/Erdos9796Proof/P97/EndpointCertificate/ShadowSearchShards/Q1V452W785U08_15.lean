/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.ShadowSearch

/-!
# Endpoint finite shadow search shard, `.Q1`, `.v = 452`, `.w = 785`

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

/-- Valid shadows in `.Q1/452/785/120` are row-bank covered. -/
theorem q1_v452_w785_u120_valid :
    endpointDepth3SubtreeValidAllAccepted .Q1 452 785 120 =
      true := by
  native_decide

/-- Valid shadows in `.Q1/452/785/154` are row-bank covered. -/
theorem q1_v452_w785_u154_valid :
    endpointDepth3SubtreeValidAllAccepted .Q1 452 785 154 =
      true := by
  native_decide

/-- Valid shadows in `.Q1/452/785/170` are row-bank covered. -/
theorem q1_v452_w785_u170_valid :
    endpointDepth3SubtreeValidAllAccepted .Q1 452 785 170 =
      true := by
  native_decide

/-- Valid shadows in `.Q1/452/785/178` are row-bank covered. -/
theorem q1_v452_w785_u178_valid :
    endpointDepth3SubtreeValidAllAccepted .Q1 452 785 178 =
      true := by
  native_decide

/-- Valid shadows in `.Q1/452/785/184` are row-bank covered. -/
theorem q1_v452_w785_u184_valid :
    endpointDepth3SubtreeValidAllAccepted .Q1 452 785 184 =
      true := by
  native_decide

/-- Valid shadows in `.Q1/452/785/300` are row-bank covered. -/
theorem q1_v452_w785_u300_valid :
    endpointDepth3SubtreeValidAllAccepted .Q1 452 785 300 =
      true := by
  native_decide

end Depth3Cert

end Search

end ShadowBank

end EndpointCertificate

end Problem97
