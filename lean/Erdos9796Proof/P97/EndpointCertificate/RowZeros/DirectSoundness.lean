/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.GeneratorZeros
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.RuleData

/-!
# Reflected soundness for endpoint row-zero rules

Endpoint certificates use a fixed finite vocabulary of geometric generator
shapes.  This module interprets that vocabulary once.  Generated rows then only
need to supply rule data plus one Boolean check that every rule is supported by
the row's own shadow.

This replaces the previous arrangement, in which each generated row re-proved a
`normalizePoly p = normalizePoly q` shape-matching subgoal for every one of its
generators.  Because generators are now *derived* from the rules
(`RowZeros.rulePolys`), no shape-matching obligation exists.

The design mirrors `SurplusCertificate.RelaxedSplit.Bank.RowZeros.DirectSoundness`,
with two differences: every endpoint row uses the single forced-collapse
`s1 = s3` assignment and carries its shadow directly rather than through an
exact-bank row lookup; and support is a `Bool`-valued function rather than a
`Decidable` proposition, so the generated row check reduces in the kernel and
can be discharged by `decide` instead of `native_decide`.
-/

open scoped EuclideanGeometry

namespace Problem97

namespace EndpointCertificate

namespace RowZeros

open EndpointCertificate.Variables

/-- The forced-collapse assignment is a normal-axis assignment. -/
theorem endpointS1S3Assignment_eq (pointOf : ShadowBank.Label → ℝ²) :
    endpointS1S3Assignment pointOf =
      endpointNormalAxisAssignment pointOf (endpointS1S3Slack pointOf) :=
  rfl

/-- A rule is supported by a shadow when that shadow carries the incidences the
rule's geometric fact needs, and when the rule's recorded endpoint variables are
the ones the gauge assigns to its labels.

The conjunctions are parenthesised to the right so that `Bool.and_eq_true`
produces a flat right-nested conjunction in the soundness proof below. -/
def EndpointGeneratorRule.ok :
    EndpointGeneratorRule → ShadowBank.Shadow → Bool
  | .exactV left right lx ly rx ry, shadow =>
      shadow.classHas .v left &&
        (shadow.classHas .v right &&
          (decide (endpointXVarOfLabel left = some lx) &&
            (decide (endpointYVarOfLabel left = some ly) &&
              (decide (endpointXVarOfLabel right = some rx) &&
                decide (endpointYVarOfLabel right = some ry)))))
  | .exactVUnit member mx my, shadow =>
      shadow.classHas .v member &&
        (shadow.classHas .v .w &&
          (decide (endpointXVarOfLabel member = some mx) &&
            decide (endpointYVarOfLabel member = some my)))
  | .exactVUnitFlipped member mx my, shadow =>
      shadow.classHas .v member &&
        (shadow.classHas .v .w &&
          (decide (endpointXVarOfLabel member = some mx) &&
            decide (endpointYVarOfLabel member = some my)))
  | .exactW left right lx ly rx ry, shadow =>
      shadow.classHas .w left &&
        (shadow.classHas .w right &&
          (decide (endpointXVarOfLabel left = some lx) &&
            (decide (endpointYVarOfLabel left = some ly) &&
              (decide (endpointXVarOfLabel right = some rx) &&
                decide (endpointYVarOfLabel right = some ry)))))
  | .exactWUnit member mx my, shadow =>
      shadow.classHas .w .v &&
        (shadow.classHas .w member &&
          (decide (endpointXVarOfLabel member = some mx) &&
            decide (endpointYVarOfLabel member = some my)))
  | .ordinary center left right cx cy lx ly rx ry, shadow =>
      shadow.classHas center left &&
        (shadow.classHas center right &&
          (decide (endpointXVarOfLabel center = some cx) &&
            (decide (endpointYVarOfLabel center = some cy) &&
              (decide (endpointXVarOfLabel left = some lx) &&
                (decide (endpointYVarOfLabel left = some ly) &&
                  (decide (endpointXVarOfLabel right = some rx) &&
                    decide (endpointYVarOfLabel right = some ry)))))))
  | .ordinaryVLeft center member cx cy mx my, shadow =>
      shadow.classHas center .v &&
        (shadow.classHas center member &&
          (decide (endpointXVarOfLabel center = some cx) &&
            (decide (endpointYVarOfLabel center = some cy) &&
              (decide (endpointXVarOfLabel member = some mx) &&
                decide (endpointYVarOfLabel member = some my)))))
  | .ordinaryVRight center member cx cy mx my, shadow =>
      shadow.classHas center member &&
        (shadow.classHas center .v &&
          (decide (endpointXVarOfLabel center = some cx) &&
            (decide (endpointYVarOfLabel center = some cy) &&
              (decide (endpointXVarOfLabel member = some mx) &&
                decide (endpointYVarOfLabel member = some my)))))
  | .ordinaryWLeft center member cx cy mx my, shadow =>
      shadow.classHas center .w &&
        (shadow.classHas center member &&
          (decide (endpointXVarOfLabel center = some cx) &&
            (decide (endpointYVarOfLabel center = some cy) &&
              (decide (endpointXVarOfLabel member = some mx) &&
                decide (endpointYVarOfLabel member = some my)))))
  | .ordinaryWRight center member cx cy mx my, shadow =>
      shadow.classHas center member &&
        (shadow.classHas center .w &&
          (decide (endpointXVarOfLabel center = some cx) &&
            (decide (endpointYVarOfLabel center = some cy) &&
              (decide (endpointXVarOfLabel member = some mx) &&
                decide (endpointYVarOfLabel member = some my)))))
  | .ordinaryVW center cx, shadow =>
      shadow.classHas center .v &&
        (shadow.classHas center .w &&
          decide (endpointXVarOfLabel center = some cx))
  | .distinctS1S3, _ => true

/-- Every rule in the list is supported by the shadow.  This is the whole
per-row proof obligation for a generated endpoint certificate, and it reduces in
the kernel. -/
def rulesOK
    (rules : List EndpointGeneratorRule) (shadow : ShadowBank.Shadow) : Bool :=
  rules.all fun rule => rule.ok shadow

/-- A supported rule's polynomial vanishes under the forced-collapse assignment
of any metric interpretation of its shadow. -/
theorem EndpointGeneratorRule.evalPoly_eq_zero
    {pointOf : ShadowBank.Label → ℝ²} {shadow : ShadowBank.Shadow}
    {rule : EndpointGeneratorRule}
    (hmetric : EndpointMetricShadow pointOf shadow)
    (hok : rule.ok shadow = true) :
    evalPoly (endpointS1S3Assignment pointOf) rule.poly = 0 := by
  cases rule with
  | distinctS1S3 =>
      exact evalPoly_endpointS1S3_rabinowitschSqDistPoly_eq_zero_of_metricShadow
        hmetric
  | exactV left right lx ly rx ry =>
      simp only [EndpointGeneratorRule.ok, Bool.and_eq_true,
        decide_eq_true_eq] at hok
      obtain ⟨hl, hr, hlx, hly, hrx, hry⟩ := hok
      rw [EndpointGeneratorRule.poly, endpointS1S3Assignment_eq]
      exact evalPoly_endpoint_sqNormDiffPoly_eq_zero_of_metricShadow hmetric
        (endpointNormalAxisAssignment_xVar_eq hlx)
        (endpointNormalAxisAssignment_yVar_eq hly)
        (endpointNormalAxisAssignment_xVar_eq hrx)
        (endpointNormalAxisAssignment_yVar_eq hry) hl hr
  | exactVUnit member mx my =>
      simp only [EndpointGeneratorRule.ok, Bool.and_eq_true,
        decide_eq_true_eq] at hok
      obtain ⟨hm, hw, hmx, hmy⟩ := hok
      rw [EndpointGeneratorRule.poly, endpointS1S3Assignment_eq]
      exact evalPoly_endpoint_sqNormMinusOnePoly_eq_zero_of_metricShadow hmetric
        (endpointNormalAxisAssignment_xVar_eq hmx)
        (endpointNormalAxisAssignment_yVar_eq hmy) hm hw
  | exactVUnitFlipped member mx my =>
      simp only [EndpointGeneratorRule.ok, Bool.and_eq_true,
        decide_eq_true_eq] at hok
      obtain ⟨hm, hw, hmx, hmy⟩ := hok
      rw [EndpointGeneratorRule.poly, endpointS1S3Assignment_eq]
      exact evalPoly_endpoint_oneMinusSqNormPoly_eq_zero_of_metricShadow hmetric
        (endpointNormalAxisAssignment_xVar_eq hmx)
        (endpointNormalAxisAssignment_yVar_eq hmy) hm hw
  | exactW left right lx ly rx ry =>
      simp only [EndpointGeneratorRule.ok, Bool.and_eq_true,
        decide_eq_true_eq] at hok
      obtain ⟨hl, hr, hlx, hly, hrx, hry⟩ := hok
      rw [EndpointGeneratorRule.poly, endpointS1S3Assignment_eq]
      exact evalPoly_endpoint_sqDistToUnitXDiffPoly_eq_zero_of_metricShadow
        hmetric
        (endpointNormalAxisAssignment_xVar_eq hlx)
        (endpointNormalAxisAssignment_yVar_eq hly)
        (endpointNormalAxisAssignment_xVar_eq hrx)
        (endpointNormalAxisAssignment_yVar_eq hry) hl hr
  | exactWUnit member mx my =>
      simp only [EndpointGeneratorRule.ok, Bool.and_eq_true,
        decide_eq_true_eq] at hok
      obtain ⟨hv, hm, hmx, hmy⟩ := hok
      rw [EndpointGeneratorRule.poly, endpointS1S3Assignment_eq]
      exact evalPoly_endpoint_sqDistToUnitXMinusOnePoly_eq_zero_of_metricShadow
        hmetric
        (endpointNormalAxisAssignment_xVar_eq hmx)
        (endpointNormalAxisAssignment_yVar_eq hmy) hv hm
  | ordinary center left right cx cy lx ly rx ry =>
      simp only [EndpointGeneratorRule.ok, Bool.and_eq_true,
        decide_eq_true_eq] at hok
      obtain ⟨hl, hr, hcx, hcy, hlx, hly, hrx, hry⟩ := hok
      rw [EndpointGeneratorRule.poly, endpointS1S3Assignment_eq]
      exact evalPoly_endpoint_sqDistToCenterDiffPoly_eq_zero_of_metricShadow
        hmetric
        (endpointNormalAxisAssignment_xVar_eq hcx)
        (endpointNormalAxisAssignment_yVar_eq hcy)
        (endpointNormalAxisAssignment_xVar_eq hlx)
        (endpointNormalAxisAssignment_yVar_eq hly)
        (endpointNormalAxisAssignment_xVar_eq hrx)
        (endpointNormalAxisAssignment_yVar_eq hry) hl hr
  | ordinaryVLeft center member cx cy mx my =>
      simp only [EndpointGeneratorRule.ok, Bool.and_eq_true,
        decide_eq_true_eq] at hok
      obtain ⟨hv, hm, hcx, hcy, hmx, hmy⟩ := hok
      rw [EndpointGeneratorRule.poly, endpointS1S3Assignment_eq]
      exact evalPoly_endpoint_sqNormFirstMinusSqDistPoly_eq_zero_of_metricShadow
        hmetric
        (endpointNormalAxisAssignment_xVar_eq hcx)
        (endpointNormalAxisAssignment_yVar_eq hcy)
        (endpointNormalAxisAssignment_xVar_eq hmx)
        (endpointNormalAxisAssignment_yVar_eq hmy) hv hm
  | ordinaryVRight center member cx cy mx my =>
      simp only [EndpointGeneratorRule.ok, Bool.and_eq_true,
        decide_eq_true_eq] at hok
      obtain ⟨hm, hv, hcx, hcy, hmx, hmy⟩ := hok
      rw [EndpointGeneratorRule.poly, endpointS1S3Assignment_eq]
      exact evalPoly_endpoint_sqDistMinusSqNormFirstPoly_eq_zero_of_metricShadow
        hmetric
        (endpointNormalAxisAssignment_xVar_eq hcx)
        (endpointNormalAxisAssignment_yVar_eq hcy)
        (endpointNormalAxisAssignment_xVar_eq hmx)
        (endpointNormalAxisAssignment_yVar_eq hmy) hm hv
  | ordinaryWLeft center member cx cy mx my =>
      simp only [EndpointGeneratorRule.ok, Bool.and_eq_true,
        decide_eq_true_eq] at hok
      obtain ⟨hw, hm, hcx, hcy, hmx, hmy⟩ := hok
      rw [EndpointGeneratorRule.poly, endpointS1S3Assignment_eq]
      exact
        evalPoly_endpoint_sqDistUnitXToPointMinusCenterDistPoly_eq_zero_of_metricShadow
          hmetric
          (endpointNormalAxisAssignment_xVar_eq hmx)
          (endpointNormalAxisAssignment_yVar_eq hmy)
          (endpointNormalAxisAssignment_xVar_eq hcx)
          (endpointNormalAxisAssignment_yVar_eq hcy) hw hm
  | ordinaryWRight center member cx cy mx my =>
      simp only [EndpointGeneratorRule.ok, Bool.and_eq_true,
        decide_eq_true_eq] at hok
      obtain ⟨hm, hw, hcx, hcy, hmx, hmy⟩ := hok
      rw [EndpointGeneratorRule.poly, endpointS1S3Assignment_eq]
      exact evalPoly_endpoint_sqDistPointToUnitXDiffPoly_eq_zero_of_metricShadow
        hmetric
        (endpointNormalAxisAssignment_xVar_eq hmx)
        (endpointNormalAxisAssignment_yVar_eq hmy)
        (endpointNormalAxisAssignment_xVar_eq hcx)
        (endpointNormalAxisAssignment_yVar_eq hcy) hm hw
  | ordinaryVW center cx =>
      simp only [EndpointGeneratorRule.ok, Bool.and_eq_true,
        decide_eq_true_eq] at hok
      obtain ⟨hv, hw, hcx⟩ := hok
      rw [EndpointGeneratorRule.poly, endpointS1S3Assignment_eq]
      exact evalPoly_endpoint_twiceVarMinusOnePoly_eq_zero_of_metricShadow
        hmetric (endpointNormalAxisAssignment_xVar_eq hcx) hv hw

/-- One kernel-decidable row check proves the semantic zero condition for every
generator derived from the checked rule list.  This is the endpoint replacement
for the per-generator `normalizePoly` shape-matching subgoals. -/
theorem evaluationZeros_of_rulesOK
    {pointOf : ShadowBank.Label → ℝ²} {shadow : ShadowBank.Shadow}
    {rules : List EndpointGeneratorRule}
    (hall : rulesOK rules shadow = true)
    (hmetric : EndpointMetricShadow pointOf shadow) :
    ∀ generator ∈ rulePolys rules,
      evalPoly (endpointS1S3Assignment pointOf) generator = 0 := by
  intro generator hgenerator
  rcases List.mem_map.mp hgenerator with ⟨rule, hrule, rfl⟩
  rw [EndpointGeneratorRule.normalizedPoly, evalPoly_normalizePoly]
  exact rule.evalPoly_eq_zero hmetric
    (List.all_eq_true.mp (by simpa [rulesOK] using hall) rule hrule)

end RowZeros

end EndpointCertificate

end Problem97
