/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under GPL-3.0-or-later as described in the file LICENSE.
Authors: Adam McKenna
-/

import Definitions.Def_Erdos9796FiniteNine_N4dPackets

open scoped EuclideanGeometry

namespace Batch3N9
namespace Problem97
namespace FiniteEndpointShell

/-- Branch conclusions from the middle N4e slice, with its cap layout fixed. -/
structure N4dFormBBranchSupport {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) where
  v1v3_longer_than_base_of_exact_packet {r s : ℝ}
      (hbranch : FormBv1A2SelectorV2Qv1Packet S Z r s)
      (_hexact : S.witnessClassAt_v2 s =
        insert Z.a2 (insert Z.b2 ({S.triangle.v3, S.triangle.v1} : Finset ℝ²))) :
      dist S.triangle.v1 S.triangle.v2 < dist S.triangle.v1 S.triangle.v3
  selectorShape_v3_q_eq_a2_impossible_of_exact_packet {r s t : ℝ}
      (hbranch : FormBv1A2SelectorV2Qv1Packet S Z r s)
      (hexact : S.witnessClassAt_v2 s =
        insert Z.a2 (insert Z.b2 ({S.triangle.v3, S.triangle.v1} : Finset ℝ²)))
      (hpacket : SelectorV3Qa2Packet S Z t) :
      False
  n4d_bB_2_q_eq_v1_impossible {r s t : ℝ}
      (hB : S.IsFormB_v1 r)
      (hlower : FormBv1B2SelectorV2LowerPacket S Z r s)
      (hpacket3 : SelectorV3Qv1Packet S Z t) :
      False
  n4d_bA_2_q_eq_v1_impossible {r s t : ℝ}
      (hB : S.IsFormB_v1 r)
      (hlower : FormBv1A2SelectorV2LowerPacket S Z r s)
      (hpacket3 : SelectorV3Qv1Packet S Z t) :
      False
  n4d_bA_2_q_eq_C_impossible {r s t : ℝ}
      (hB : S.IsFormB_v1 r)
      (hlower : FormBv1A2SelectorV2LowerPacket S Z r s)
      (hpacket3 : SelectorV3Qa2Packet S Z t) :
      False
  qEqE_row_impossible_of_reflection
      {q E : ℝ²}
      (hqI3 : q ∈ S.I3)
      (hAE : dist S.triangle.v1 E = dist S.triangle.v1 S.triangle.v2)
      (hBD : dist S.triangle.v2 S.triangle.v3 = dist S.triangle.v2 E)
      (hBq : dist S.triangle.v2 q = dist S.triangle.v2 E)
      (hDq : dist S.triangle.v3 q = dist S.triangle.v3 E)
      (hlong : dist S.triangle.v1 S.triangle.v2 < dist S.triangle.v1 S.triangle.v3)
      (hEside :
        0 < signedArea2 E S.triangle.v1 S.triangle.v2 *
          signedArea2 S.triangle.v3 S.triangle.v1 S.triangle.v2)
      (hqE : q ≠ E) :
      False
  qEqE_lowerArc_impossible
      {q qs E : ℝ²}
      (hqI3 : q ∈ S.I3) (hqsI3 : qs ∈ S.I3)
      (hDqs : dist S.triangle.v3 qs = dist S.triangle.v3 q)
      (hBq : dist S.triangle.v2 q = dist S.triangle.v2 S.triangle.v3)
      (hBE : dist S.triangle.v2 E = dist S.triangle.v2 S.triangle.v3)
      (hDE : dist S.triangle.v3 E = dist S.triangle.v3 q)
      (hsmall : dist S.triangle.v2 S.triangle.v3 < dist S.triangle.v1 S.triangle.v2)
      (hlong : dist S.triangle.v1 S.triangle.v2 < dist S.triangle.v1 S.triangle.v3)
      (hAElt : dist S.triangle.v1 E < dist S.triangle.v1 S.triangle.v2)
      (hEside :
        0 < signedArea2 E S.triangle.v1 S.triangle.v2 *
          signedArea2 S.triangle.v3 S.triangle.v1 S.triangle.v2)
      (hqE : q ≠ E)
      (hcap_opp :
        (dist S.triangle.v2 qs ^ 2 - dist S.triangle.v2 q ^ 2)
          * (dist S.triangle.v1 qs ^ 2 - dist S.triangle.v1 q ^ 2) < 0) :
      False
  qEqE_lowerArc_impossible_flipped
      {q qs E : ℝ²}
      (hqI3 : q ∈ S.I3) (hqsI3 : qs ∈ S.I3)
      (hDqs : dist S.triangle.v3 qs = dist S.triangle.v3 q)
      (hBq : dist S.triangle.v2 q = dist S.triangle.v2 S.triangle.v3)
      (hBE : dist S.triangle.v2 E = dist S.triangle.v2 S.triangle.v3)
      (hDE : dist S.triangle.v3 E = dist S.triangle.v3 q)
      (hsmall : dist S.triangle.v2 S.triangle.v3 < dist S.triangle.v1 S.triangle.v2)
      (hlong : dist S.triangle.v1 S.triangle.v2 < dist S.triangle.v1 S.triangle.v3)
      (hAEgt : dist S.triangle.v1 S.triangle.v2 < dist S.triangle.v1 E)
      (hEC2 : E ∈ S.CP.C2)
      (hEside :
        0 < signedArea2 E S.triangle.v1 S.triangle.v2 *
          signedArea2 S.triangle.v3 S.triangle.v1 S.triangle.v2)
      (hqE : q ≠ E)
      (hcap_opp :
        (dist S.triangle.v2 qs ^ 2 - dist S.triangle.v2 q ^ 2)
          * (dist S.triangle.v1 qs ^ 2 - dist S.triangle.v1 q ^ 2) < 0) :
      False

end FiniteEndpointShell
end Problem97
end Batch3N9
