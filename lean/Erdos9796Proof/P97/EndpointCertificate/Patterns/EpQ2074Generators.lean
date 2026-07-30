/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.ProductCertificate
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.RuleData

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_074 generators

This generated module stores the endpoint generator list once. Product rows
refer to these generators by index from computed coefficient blocks.

Generators are *derived* from the semantic rule list rather than emitted as
literal polynomial data, so the row-zero proof needs no polynomial-shape
matching subgoals.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2074Generators

open Variables

/-- Generator rules for endpoint certificate `ep_Q2_074`. -/
def ep_Q2_074_rules : List RowZeros.EndpointGeneratorRule :=
[
  .ordinary .u .s1 .s2 EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y EndpointVar.s2x EndpointVar.s2y,
  .ordinary .u .s1 .Pu EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y EndpointVar.pux EndpointVar.puy,
  .ordinary .u .s1 .Q1 EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y EndpointVar.q1x EndpointVar.q1y,
  .exactV .s3 .Pw EndpointVar.s3x EndpointVar.s3y EndpointVar.pwx EndpointVar.pwy,
  .exactV .s3 .Pu EndpointVar.s3x EndpointVar.s3y EndpointVar.pux EndpointVar.puy,
  .exactV .s3 .Q2 EndpointVar.s3x EndpointVar.s3y EndpointVar.q2x EndpointVar.q2y,
  .exactW .u .s3 EndpointVar.ux EndpointVar.uy EndpointVar.s3x EndpointVar.s3y,
  .exactW .u .Q1 EndpointVar.ux EndpointVar.uy EndpointVar.q1x EndpointVar.q1y,
  .exactW .u .Q2 EndpointVar.ux EndpointVar.uy EndpointVar.q2x EndpointVar.q2y,
  .ordinaryVRight .s1 .u EndpointVar.s1x EndpointVar.s1y EndpointVar.ux EndpointVar.uy,
  .ordinary .s1 .u .s2 EndpointVar.s1x EndpointVar.s1y EndpointVar.ux EndpointVar.uy EndpointVar.s2x EndpointVar.s2y,
  .ordinary .s1 .u .s3 EndpointVar.s1x EndpointVar.s1y EndpointVar.ux EndpointVar.uy EndpointVar.s3x EndpointVar.s3y,
  .ordinaryWRight .s2 .u EndpointVar.s2x EndpointVar.s2y EndpointVar.ux EndpointVar.uy,
  .ordinary .s2 .u .s1 EndpointVar.s2x EndpointVar.s2y EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y,
  .ordinary .s2 .u .Pu EndpointVar.s2x EndpointVar.s2y EndpointVar.ux EndpointVar.uy EndpointVar.pux EndpointVar.puy,
  .ordinaryVW .s3 EndpointVar.s3x,
  .ordinaryVLeft .s3 .s2 EndpointVar.s3x EndpointVar.s3y EndpointVar.s2x EndpointVar.s2y,
  .ordinaryVLeft .s3 .Q2 EndpointVar.s3x EndpointVar.s3y EndpointVar.q2x EndpointVar.q2y,
  .ordinaryVW .Pw EndpointVar.pwx,
  .ordinaryVLeft .Pw .Pu EndpointVar.pwx EndpointVar.pwy EndpointVar.pux EndpointVar.puy,
  .ordinaryVLeft .Pw .Q1 EndpointVar.pwx EndpointVar.pwy EndpointVar.q1x EndpointVar.q1y,
  .ordinaryWRight .Pu .u EndpointVar.pux EndpointVar.puy EndpointVar.ux EndpointVar.uy,
  .ordinary .Pu .u .s2 EndpointVar.pux EndpointVar.puy EndpointVar.ux EndpointVar.uy EndpointVar.s2x EndpointVar.s2y,
  .ordinary .Pu .u .Pw EndpointVar.pux EndpointVar.puy EndpointVar.ux EndpointVar.uy EndpointVar.pwx EndpointVar.pwy,
  .ordinaryVRight .Q1 .u EndpointVar.q1x EndpointVar.q1y EndpointVar.ux EndpointVar.uy,
  .ordinary .Q1 .u .s1 EndpointVar.q1x EndpointVar.q1y EndpointVar.ux EndpointVar.uy EndpointVar.s1x EndpointVar.s1y,
  .ordinary .Q1 .u .Pw EndpointVar.q1x EndpointVar.q1y EndpointVar.ux EndpointVar.uy EndpointVar.pwx EndpointVar.pwy,
  .ordinaryWLeft .Q2 .s1 EndpointVar.q2x EndpointVar.q2y EndpointVar.s1x EndpointVar.s1y,
  .ordinaryWLeft .Q2 .s3 EndpointVar.q2x EndpointVar.q2y EndpointVar.s3x EndpointVar.s3y,
  .ordinaryWLeft .Q2 .Q1 EndpointVar.q2x EndpointVar.q2y EndpointVar.q1x EndpointVar.q1y,
  .distinctS1S3
]

/-- Generator list for endpoint certificate `ep_Q2_074`. -/
def ep_Q2_074_generators : List Poly :=
  RowZeros.rulePolys ep_Q2_074_rules

end EpQ2074Generators

end Patterns

end EndpointCertificate

end Problem97
