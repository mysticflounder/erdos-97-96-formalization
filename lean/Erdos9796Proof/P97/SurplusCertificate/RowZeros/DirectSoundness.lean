/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.ProductCertificateSoundness
import Erdos9796Proof.P97.SurplusCertificate.GeometryCore
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.RuleData

/-!
# Reflected soundness for direct surplus row-zero rules

Direct relaxed-split certificates use a fixed finite vocabulary of geometric
generator shapes. This module interprets that vocabulary once. Generated rows
only need to provide rule data and a Boolean check that the rules match the
certificate generators and the exact-row mask bank.
-/

open scoped EuclideanGeometry

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

namespace Bank

namespace RowZeros

open EndpointCertificate
open EndpointCertificate.Variables

/-- The real variable assignment represented by a row assignment. -/
noncomputable def RowAssignment.evaluation
    (assignment : RowAssignment)
    (pointOf : SurplusCOMPGBank.Label → ℝ²) : Nat → ℝ :=
  match assignment with
  | .s1s3 => endpointS1S3Assignment pointOf
  | .pair left right => endpointPairAssignment pointOf left right

/-- The slack coordinate used by a row assignment. -/
noncomputable def RowAssignment.slack
    (assignment : RowAssignment)
    (pointOf : SurplusCOMPGBank.Label → ℝ²) : ℝ :=
  match assignment with
  | .s1s3 => endpointS1S3Slack pointOf
  | .pair left right => endpointPairSlack pointOf left right

theorem RowAssignment.evaluation_eq_normalAxis
    (assignment : RowAssignment)
    (pointOf : SurplusCOMPGBank.Label → ℝ²) :
    assignment.evaluation pointOf =
      endpointNormalAxisAssignment pointOf (assignment.slack pointOf) := by
  cases assignment <;> rfl

/-- A rule is supported by one exact row and uses the variable encoding and
separator represented by its row assignment. -/
def GeneratorRule.Valid
    (rule : GeneratorRule)
    (row : SurplusCOMPGBank.Row)
    (assignment : RowAssignment) : Prop :=
  match rule with
  | .exactV left right lx ly rx ry =>
      SurplusCOMPGBank.maskHas
          (row.masks.getD SurplusCOMPGBank.Label.v.index 0) left = true ∧
        SurplusCOMPGBank.maskHas
          (row.masks.getD SurplusCOMPGBank.Label.v.index 0) right = true ∧
        endpointXVarOfLabel left = some lx ∧
        endpointYVarOfLabel left = some ly ∧
        endpointXVarOfLabel right = some rx ∧
        endpointYVarOfLabel right = some ry
  | .exactW left right lx ly rx ry =>
      SurplusCOMPGBank.maskHas
          (row.masks.getD SurplusCOMPGBank.Label.w.index 0) left = true ∧
        SurplusCOMPGBank.maskHas
          (row.masks.getD SurplusCOMPGBank.Label.w.index 0) right = true ∧
        endpointXVarOfLabel left = some lx ∧
        endpointYVarOfLabel left = some ly ∧
        endpointXVarOfLabel right = some rx ∧
        endpointYVarOfLabel right = some ry
  | .exactWV member mx my =>
      SurplusCOMPGBank.maskHas
          (row.masks.getD SurplusCOMPGBank.Label.w.index 0) .v = true ∧
        SurplusCOMPGBank.maskHas
          (row.masks.getD SurplusCOMPGBank.Label.w.index 0) member = true ∧
        endpointXVarOfLabel member = some mx ∧
        endpointYVarOfLabel member = some my
  | .ordinary center left right cx cy lx ly rx ry =>
      SurplusCOMPGBank.maskHas (row.masks.getD center.index 0) left = true ∧
        SurplusCOMPGBank.maskHas (row.masks.getD center.index 0) right = true ∧
        endpointXVarOfLabel center = some cx ∧
        endpointYVarOfLabel center = some cy ∧
        endpointXVarOfLabel left = some lx ∧
        endpointYVarOfLabel left = some ly ∧
        endpointXVarOfLabel right = some rx ∧
        endpointYVarOfLabel right = some ry
  | .ordinaryVLeft center member cx cy mx my =>
      SurplusCOMPGBank.maskHas (row.masks.getD center.index 0) .v = true ∧
        SurplusCOMPGBank.maskHas (row.masks.getD center.index 0) member = true ∧
        endpointXVarOfLabel center = some cx ∧
        endpointYVarOfLabel center = some cy ∧
        endpointXVarOfLabel member = some mx ∧
        endpointYVarOfLabel member = some my
  | .ordinaryVRight center member cx cy mx my =>
      SurplusCOMPGBank.maskHas (row.masks.getD center.index 0) .v = true ∧
        SurplusCOMPGBank.maskHas (row.masks.getD center.index 0) member = true ∧
        endpointXVarOfLabel center = some cx ∧
        endpointYVarOfLabel center = some cy ∧
        endpointXVarOfLabel member = some mx ∧
        endpointYVarOfLabel member = some my
  | .ordinaryWLeft center member cx cy mx my =>
      SurplusCOMPGBank.maskHas (row.masks.getD center.index 0) .w = true ∧
        SurplusCOMPGBank.maskHas (row.masks.getD center.index 0) member = true ∧
        endpointXVarOfLabel center = some cx ∧
        endpointYVarOfLabel center = some cy ∧
        endpointXVarOfLabel member = some mx ∧
        endpointYVarOfLabel member = some my
  | .ordinaryWRight center member cx cy mx my =>
      SurplusCOMPGBank.maskHas (row.masks.getD center.index 0) .w = true ∧
        SurplusCOMPGBank.maskHas (row.masks.getD center.index 0) member = true ∧
        endpointXVarOfLabel center = some cx ∧
        endpointYVarOfLabel center = some cy ∧
        endpointXVarOfLabel member = some mx ∧
        endpointYVarOfLabel member = some my
  | .ordinaryVW center cx =>
      SurplusCOMPGBank.maskHas (row.masks.getD center.index 0) .v = true ∧
        SurplusCOMPGBank.maskHas (row.masks.getD center.index 0) .w = true ∧
        endpointXVarOfLabel center = some cx
  | .distinct left right lx ly rx ry =>
      assignment = .pair left right ∧
        left ≠ right ∧
        endpointXVarOfLabel left = some lx ∧
        endpointYVarOfLabel left = some ly ∧
        endpointXVarOfLabel right = some rx ∧
        endpointYVarOfLabel right = some ry
  | .distinctV left lx ly =>
      assignment = .pair left .v ∧
        left ≠ .v ∧
        endpointXVarOfLabel left = some lx ∧
        endpointYVarOfLabel left = some ly

instance GeneratorRule.instDecidableValid
    (rule : GeneratorRule) (row : SurplusCOMPGBank.Row)
    (assignment : RowAssignment) : Decidable (rule.Valid row assignment) := by
  cases rule <;> simp only [GeneratorRule.Valid] <;> infer_instance

/-- The generated rules have the same normalized polynomials as the certificate
generator list. -/
def rulesMatchGenerators
    (rules : List GeneratorRule) (generators : List Poly) : Bool :=
  decide
    (rules.map (fun rule => normalizePoly rule.poly) =
      generators.map normalizePoly)

/-- Every exact-bank row with the selected pid validates every generated rule. -/
def rulesValidForPid
    (pid : String) (assignment : RowAssignment)
    (rules : List GeneratorRule) : Bool :=
  SurplusCOMPGBank.rows.all fun row =>
    if row.pid = pid then
      rules.all fun rule => decide (rule.Valid row assignment)
    else
      true

/-- Reflected checker consumed by a direct row-zero proof. -/
def directRowCheck
    (pid : String) (assignment : RowAssignment)
    (rules : List GeneratorRule) (generators : List Poly) : Bool :=
  rulesMatchGenerators rules generators &&
    rulesValidForPid pid assignment rules

theorem GeneratorRule.evalPoly_eq_zero
    {pointOf : SurplusCOMPGBank.Label → ℝ²}
    {centerClass : SurplusCOMPGBank.Label → Finset ℝ²}
    {exactRow : SurplusCOMPGBank.Row}
    {assignment : RowAssignment} {rule : GeneratorRule}
    (hmetric :
      EndpointMetricShadow pointOf
        (SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass))
    (hmasks :
      exactRow.masks =
        (SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass).masks)
    (hvalid : rule.Valid exactRow assignment) :
    evalPoly (assignment.evaluation pointOf) rule.poly = 0 := by
  cases rule with
  | exactV left right lx ly rx ry =>
      rcases hvalid with ⟨hl, hr, hlx, hly, hrx, hry⟩
      rw [RowAssignment.evaluation_eq_normalAxis]
      exact eval_sqNormDiff_zero_of_exactRow_v_center_members
        hmetric hmasks hl hr hlx hly hrx hry
  | exactW left right lx ly rx ry =>
      rcases hvalid with ⟨hl, hr, hlx, hly, hrx, hry⟩
      rw [RowAssignment.evaluation_eq_normalAxis]
      exact eval_sqDistToUnitX_zero_of_exactRow_w_center_members
        hmetric hmasks hl hr hlx hly hrx hry
  | exactWV member mx my =>
      rcases hvalid with ⟨hv, hm, hmx, hmy⟩
      rw [RowAssignment.evaluation_eq_normalAxis]
      exact eval_oneMinusSqDistToUnitX_zero_of_exactRow_w_v_member
        hmetric hmasks hv hm hmx hmy
  | ordinary center left right cx cy lx ly rx ry =>
      rcases hvalid with ⟨hl, hr, hcx, hcy, hlx, hly, hrx, hry⟩
      rw [RowAssignment.evaluation_eq_normalAxis]
      exact eval_sqDistCenter_zero_of_exactRow_members
        hmetric hmasks hl hr hcx hcy hlx hly hrx hry
  | ordinaryVLeft center member cx cy mx my =>
      rcases hvalid with ⟨hv, hm, hcx, hcy, hmx, hmy⟩
      rw [RowAssignment.evaluation_eq_normalAxis]
      exact eval_sqNormVsDist_zero_of_exactRow_v_member
        hmetric hmasks hv hm hcx hcy hmx hmy
  | ordinaryVRight center member cx cy mx my =>
      rcases hvalid with ⟨hv, hm, hcx, hcy, hmx, hmy⟩
      rw [RowAssignment.evaluation_eq_normalAxis]
      exact eval_sqDistVsNorm_zero_of_exactRow_v_member
        hmetric hmasks hv hm hcx hcy hmx hmy
  | ordinaryWLeft center member cx cy mx my =>
      rcases hvalid with ⟨hw, hm, hcx, hcy, hmx, hmy⟩
      rw [RowAssignment.evaluation_eq_normalAxis]
      exact eval_sqDistUnitXToPoint_zero_of_exactRow_w_member
        hmetric hmasks hw hm hmx hmy hcx hcy
  | ordinaryWRight center member cx cy mx my =>
      rcases hvalid with ⟨hw, hm, hcx, hcy, hmx, hmy⟩
      rw [RowAssignment.evaluation_eq_normalAxis]
      exact eval_sqDistPointToUnitX_zero_of_exactRow_w_member
        hmetric hmasks hw hm hmx hmy hcx hcy
  | ordinaryVW center cx =>
      rcases hvalid with ⟨hv, hw, hcx⟩
      rw [RowAssignment.evaluation_eq_normalAxis]
      exact eval_twiceVarMinusOne_zero_of_exactRow_v_w_members
        hmetric hmasks hv hw hcx
  | distinct left right lx ly rx ry =>
      rcases hvalid with ⟨rfl, hne, hlx, hly, hrx, hry⟩
      exact eval_rabinowitsch_zero_of_pair hmetric hne hlx hly hrx hry
  | distinctV left lx ly =>
      rcases hvalid with ⟨rfl, hne, hlx, hly⟩
      exact eval_rabinowitsch_sqNorm_zero_of_pair_v hmetric hne hlx hly

theorem generatorRuleValid_of_rulesValidForPid
    {pid : String} {assignment : RowAssignment}
    {rules : List GeneratorRule} {exactRow : SurplusCOMPGBank.Row}
    {rule : GeneratorRule}
    (hall : rulesValidForPid pid assignment rules = true)
    (hrow : exactRow ∈ SurplusCOMPGBank.rows)
    (hpid : exactRow.pid = pid)
    (hrule : rule ∈ rules) :
    rule.Valid exactRow assignment := by
  have hrows :
      SurplusCOMPGBank.rows.all
        (fun row =>
          if row.pid = pid then
            rules.all fun item => decide (item.Valid row assignment)
          else true) = true := by
    simpa [rulesValidForPid] using hall
  have hexact := List.all_eq_true.mp hrows exactRow hrow
  have hrules :
      rules.all (fun item => decide (item.Valid exactRow assignment)) = true := by
    simpa [hpid] using hexact
  exact of_decide_eq_true (List.all_eq_true.mp hrules rule hrule)

/-- A validated rule list proves the semantic zero condition for its derived
generator list. -/
theorem evaluationZeros_of_rulesValidForPid
    {pointOf : SurplusCOMPGBank.Label → ℝ²}
    {centerClass : SurplusCOMPGBank.Label → Finset ℝ²}
    {exactRow : SurplusCOMPGBank.Row}
    {pid : String} {assignment : RowAssignment}
    {rules : List GeneratorRule}
    (hall : rulesValidForPid pid assignment rules = true)
    (hmetric :
      EndpointMetricShadow pointOf
        (SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass))
    (hrow : exactRow ∈ SurplusCOMPGBank.rows)
    (hmasks :
      exactRow.masks =
        (SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass).masks)
    (hpid : exactRow.pid = pid) :
    ∀ generator ∈ rules.map GeneratorRule.normalizedPoly,
      evalPoly (assignment.evaluation pointOf) generator = 0 := by
  intro generator hgenerator
  rcases List.mem_map.mp hgenerator with ⟨rule, hrule, rfl⟩
  rw [GeneratorRule.normalizedPoly, evalPoly_normalizePoly]
  exact rule.evalPoly_eq_zero hmetric hmasks
    (generatorRuleValid_of_rulesValidForPid hall hrow hpid hrule)

/-- One reflected row check proves the semantic zero condition for every
generator in the checked list. -/
theorem evaluationZeros_of_directRowCheck
    {pointOf : SurplusCOMPGBank.Label → ℝ²}
    {centerClass : SurplusCOMPGBank.Label → Finset ℝ²}
    {exactRow : SurplusCOMPGBank.Row}
    {pid : String} {assignment : RowAssignment}
    {rules : List GeneratorRule} {generators : List Poly}
    (hcheck : directRowCheck pid assignment rules generators = true)
    (hmetric :
      EndpointMetricShadow pointOf
        (SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass))
    (hrow : exactRow ∈ SurplusCOMPGBank.rows)
    (hmasks :
      exactRow.masks =
        (SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass).masks)
    (hpid : exactRow.pid = pid) :
    ∀ generator ∈ generators,
      evalPoly (assignment.evaluation pointOf) generator = 0 := by
  have hparts :
      rulesMatchGenerators rules generators = true ∧
        rulesValidForPid pid assignment rules = true := by
    simpa [directRowCheck] using hcheck
  have hmaps :
      rules.map (fun rule => normalizePoly rule.poly) =
        generators.map normalizePoly :=
    of_decide_eq_true (by
      simpa [rulesMatchGenerators] using hparts.1)
  intro generator hgenerator
  have hnorm : normalizePoly generator ∈ generators.map normalizePoly :=
    List.mem_map.mpr ⟨generator, hgenerator, rfl⟩
  rw [← hmaps] at hnorm
  rcases List.mem_map.mp hnorm with ⟨rule, hrule, hruleNorm⟩
  exact evalPoly_eq_zero_of_normalizePoly_eq
    (assignment.evaluation pointOf) hruleNorm.symm
    (rule.evalPoly_eq_zero hmetric hmasks
      (generatorRuleValid_of_rulesValidForPid
        hparts.2 hrow hpid hrule))

end RowZeros

end Bank

end RelaxedSplit

end SurplusCertificate

end Problem97
