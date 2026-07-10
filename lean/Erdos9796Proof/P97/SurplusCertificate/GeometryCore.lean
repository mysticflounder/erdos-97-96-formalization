/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCOMPGBankGeometry
import Erdos9796Proof.P97.EndpointCertificate.GeneratorZeros

/-!
# Exact-row metric geometry for surplus certificates

This module contains the row-local geometric facts used to interpret generated
surplus-certificate rules. It is independent of the generated relaxed split
certificate bank and its aggregate alignment.
-/

open scoped EuclideanGeometry

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

namespace Bank

open EndpointCertificate
open EndpointCertificate.Variables

/-- The endpoint certificate x-coordinate variable for labels that remain
ordinary variables in the `.v`, `.w` normal-axis gauge. -/
def endpointXVarOfLabel : SurplusCOMPGBank.Label → Option EndpointVar
  | .u => some .ux
  | .v => none
  | .w => none
  | .s1 => some .s1x
  | .s2 => some .s2x
  | .s3 => some .s3x
  | .Pw => some .pwx
  | .Pu => some .pux
  | .Q1 => some .q1x
  | .Q2 => some .q2x

/-- The endpoint certificate y-coordinate variable for labels that remain
ordinary variables in the `.v`, `.w` normal-axis gauge. -/
def endpointYVarOfLabel : SurplusCOMPGBank.Label → Option EndpointVar
  | .u => some .uy
  | .v => none
  | .w => none
  | .s1 => some .s1y
  | .s2 => some .s2y
  | .s3 => some .s3y
  | .Pw => some .pwy
  | .Pu => some .puy
  | .Q1 => some .q1y
  | .Q2 => some .q2y

/-- The surplus label-to-variable map agrees with any normal-axis assignment on
x-coordinates. -/
theorem endpointNormalAxisAssignment_xVar_eq
    {pointOf : SurplusCOMPGBank.Label → ℝ²}
    {τ : ℝ}
    {label : SurplusCOMPGBank.Label} {xvar : EndpointVar}
    (hvar : endpointXVarOfLabel label = some xvar) :
    endpointNormalAxisAssignment pointOf τ xvar.index =
      endpointNormalAxisCoord pointOf label 0 := by
  cases label <;> simp [endpointXVarOfLabel] at hvar
  all_goals
    subst xvar
    simp [endpointNormalAxisAssignment, EndpointVar.eval]

/-- The surplus label-to-variable map agrees with the forced `s1,s3`
normal-axis assignment on x-coordinates. -/
theorem endpointS1S3Assignment_xVar_eq
    {pointOf : SurplusCOMPGBank.Label → ℝ²}
    {label : SurplusCOMPGBank.Label} {xvar : EndpointVar}
    (hvar : endpointXVarOfLabel label = some xvar) :
    endpointS1S3Assignment pointOf xvar.index =
      endpointNormalAxisCoord pointOf label 0 := by
  exact endpointNormalAxisAssignment_xVar_eq hvar

/-- The surplus label-to-variable map agrees with any normal-axis assignment on
y-coordinates. -/
theorem endpointNormalAxisAssignment_yVar_eq
    {pointOf : SurplusCOMPGBank.Label → ℝ²}
    {τ : ℝ}
    {label : SurplusCOMPGBank.Label} {yvar : EndpointVar}
    (hvar : endpointYVarOfLabel label = some yvar) :
    endpointNormalAxisAssignment pointOf τ yvar.index =
      endpointNormalAxisCoord pointOf label 1 := by
  cases label <;> simp [endpointYVarOfLabel] at hvar
  all_goals
    subst yvar
    simp [endpointNormalAxisAssignment, EndpointVar.eval]

/-- The surplus label-to-variable map agrees with the forced `s1,s3`
normal-axis assignment on y-coordinates. -/
theorem endpointS1S3Assignment_yVar_eq
    {pointOf : SurplusCOMPGBank.Label → ℝ²}
    {label : SurplusCOMPGBank.Label} {yvar : EndpointVar}
    (hvar : endpointYVarOfLabel label = some yvar) :
    endpointS1S3Assignment pointOf yvar.index =
      endpointNormalAxisCoord pointOf label 1 := by
  exact endpointNormalAxisAssignment_yVar_eq hvar

/-- Rabinowitsch slack for a row-specific separator pair. -/
noncomputable def endpointPairSlack
    (pointOf : SurplusCOMPGBank.Label → ℝ²)
    (left right : SurplusCOMPGBank.Label) : ℝ :=
  (((endpointNormalAxisCoord pointOf left 0 -
          endpointNormalAxisCoord pointOf right 0) ^ 2 +
      (endpointNormalAxisCoord pointOf left 1 -
          endpointNormalAxisCoord pointOf right 1) ^ 2)⁻¹)

/-- Normal-axis assignment whose `tau` variable is tied to a row-specific
separator pair. -/
noncomputable def endpointPairAssignment
    (pointOf : SurplusCOMPGBank.Label → ℝ²)
    (left right : SurplusCOMPGBank.Label) : Nat → ℝ :=
  endpointNormalAxisAssignment pointOf (endpointPairSlack pointOf left right)

/-- The pair-specific assignment agrees with x-coordinate endpoint variables. -/
theorem endpointPairAssignment_xVar_eq
    {pointOf : SurplusCOMPGBank.Label → ℝ²}
    {pairLeft pairRight label : SurplusCOMPGBank.Label} {xvar : EndpointVar}
    (hvar : endpointXVarOfLabel label = some xvar) :
    endpointPairAssignment pointOf pairLeft pairRight xvar.index =
      endpointNormalAxisCoord pointOf label 0 := by
  exact endpointNormalAxisAssignment_xVar_eq hvar

/-- The pair-specific assignment agrees with y-coordinate endpoint variables. -/
theorem endpointPairAssignment_yVar_eq
    {pointOf : SurplusCOMPGBank.Label → ℝ²}
    {pairLeft pairRight label : SurplusCOMPGBank.Label} {yvar : EndpointVar}
    (hvar : endpointYVarOfLabel label = some yvar) :
    endpointPairAssignment pointOf pairLeft pairRight yvar.index =
      endpointNormalAxisCoord pointOf label 1 := by
  exact endpointNormalAxisAssignment_yVar_eq hvar

/-- The row-specific Rabinowitsch separator generator evaluates to zero under
the corresponding pair-specific slack assignment. -/
theorem eval_rabinowitsch_zero_of_pair
    {pointOf : SurplusCOMPGBank.Label → ℝ²}
    {centerClass : SurplusCOMPGBank.Label → Finset ℝ²}
    {leftLabel rightLabel : SurplusCOMPGBank.Label}
    {ax ay bx b_y : EndpointVar}
    (hmetric :
      EndpointMetricShadow pointOf
        (SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass))
    (hneq : leftLabel ≠ rightLabel)
    (hax : endpointXVarOfLabel leftLabel = some ax)
    (hay : endpointYVarOfLabel leftLabel = some ay)
    (hbx : endpointXVarOfLabel rightLabel = some bx)
    (hb_y : endpointYVarOfLabel rightLabel = some b_y) :
    evalPoly (endpointPairAssignment pointOf leftLabel rightLabel)
      (rabinowitschSqDistPoly EndpointVar.tau.index ax.index ay.index bx.index
        b_y.index) = 0 := by
  refine evalPoly_rabinowitschSqDistPoly_eq_zero_of_inverse
    (endpointPairAssignment pointOf leftLabel rightLabel) ?_ ?_
  · rw [endpointPairAssignment_xVar_eq hax,
      endpointPairAssignment_yVar_eq hay,
      endpointPairAssignment_xVar_eq hbx,
      endpointPairAssignment_yVar_eq hb_y]
    simp [endpointPairAssignment, endpointPairSlack,
      endpointNormalAxisAssignment, EndpointVar.eval]
  · rw [endpointPairAssignment_xVar_eq hax,
      endpointPairAssignment_yVar_eq hay,
      endpointPairAssignment_xVar_eq hbx,
      endpointPairAssignment_yVar_eq hb_y]
    exact endpointNormalAxis_coord_sqdist_ne_zero
      (EndpointMetricShadow.v_ne_w hmetric)
      (EndpointMetricShadow.point_ne hmetric hneq)

/-- The row-specific Rabinowitsch separator generator for a variable label
against the fixed `.v` endpoint evaluates to zero under the corresponding
pair-specific slack assignment. -/
theorem eval_rabinowitsch_sqNorm_zero_of_pair_v
    {pointOf : SurplusCOMPGBank.Label → ℝ²}
    {centerClass : SurplusCOMPGBank.Label → Finset ℝ²}
    {label : SurplusCOMPGBank.Label}
    {ax ay : EndpointVar}
    (hmetric :
      EndpointMetricShadow pointOf
        (SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass))
    (hneq : label ≠ .v)
    (hax : endpointXVarOfLabel label = some ax)
    (hay : endpointYVarOfLabel label = some ay) :
    evalPoly (endpointPairAssignment pointOf label .v)
      (rabinowitschSqNormPoly EndpointVar.tau.index ax.index ay.index) =
        0 := by
  refine evalPoly_rabinowitschSqNormPoly_eq_zero_of_inverse
    (endpointPairAssignment pointOf label .v) ?_ ?_
  · rw [endpointPairAssignment_xVar_eq hax,
      endpointPairAssignment_yVar_eq hay]
    simp [endpointPairAssignment, endpointPairSlack,
      endpointNormalAxisAssignment, EndpointVar.eval]
  · rw [endpointPairAssignment_xVar_eq hax,
      endpointPairAssignment_yVar_eq hay]
    simpa using
      endpointNormalAxis_coord_sqdist_ne_zero
        (EndpointMetricShadow.v_ne_w hmetric)
        (EndpointMetricShadow.point_ne hmetric hneq)


/-- A bit in a matched exact row mask is present in the corresponding class of
the induced geometric shadow. -/
theorem classHas_shadowOfPointClasses_of_exactRow_maskHas
    {α : Type _} [DecidableEq α]
    {pointOf : SurplusCOMPGBank.Label → α}
    {centerClass : SurplusCOMPGBank.Label → Finset α}
    {exactRow : SurplusCOMPGBank.Row}
    {center memberLabel : SurplusCOMPGBank.Label}
    (hmasks :
      exactRow.masks =
        (SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass).masks)
    (hbit :
      SurplusCOMPGBank.maskHas
        (exactRow.masks.getD center.index 0) memberLabel = true) :
    (SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass).classHas
      center memberLabel = true := by
  simpa [SurplusCOMPGBank.Shadow.classHas,
    SurplusCOMPGBank.Shadow.centerMask, ← hmasks] using hbit

/-- Two ordinary-variable members of the exact `.v` center mask zero the
corresponding generated squared-norm difference polynomial. -/
theorem eval_sqNormDiff_zero_of_exactRow_v_center_members
    {pointOf : SurplusCOMPGBank.Label → ℝ²}
    {τ : ℝ}
    {centerClass : SurplusCOMPGBank.Label → Finset ℝ²}
    {exactRow : SurplusCOMPGBank.Row}
    {leftLabel rightLabel : SurplusCOMPGBank.Label}
    {ax ay bx b_y : EndpointVar}
    (hmetric :
      EndpointMetricShadow pointOf
        (SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass))
    (hmasks :
      exactRow.masks =
        (SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass).masks)
    (hleftBit :
      SurplusCOMPGBank.maskHas
        (exactRow.masks.getD SurplusCOMPGBank.Label.v.index 0)
        leftLabel = true)
    (hrightBit :
      SurplusCOMPGBank.maskHas
        (exactRow.masks.getD SurplusCOMPGBank.Label.v.index 0)
        rightLabel = true)
    (hax : endpointXVarOfLabel leftLabel = some ax)
    (hay : endpointYVarOfLabel leftLabel = some ay)
    (hbx : endpointXVarOfLabel rightLabel = some bx)
    (hb_y : endpointYVarOfLabel rightLabel = some b_y) :
    evalPoly (endpointNormalAxisAssignment pointOf τ)
      (sqNormDiffPoly ax.index ay.index bx.index b_y.index) = 0 := by
  have hleftClass :
      (SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass).classHas
        .v leftLabel = true :=
    classHas_shadowOfPointClasses_of_exactRow_maskHas
      (center := .v) hmasks hleftBit
  have hrightClass :
      (SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass).classHas
        .v rightLabel = true :=
    classHas_shadowOfPointClasses_of_exactRow_maskHas
      (center := .v) hmasks hrightBit
  exact
    evalPoly_endpoint_sqNormDiffPoly_eq_zero_of_metricShadow
      (pointOf := pointOf)
      (shadow := SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass)
      (a := leftLabel) (b := rightLabel)
      (ax := ax) (ay := ay) (bx := bx) (b_y := b_y)
      hmetric
      (endpointNormalAxisAssignment_xVar_eq hax)
      (endpointNormalAxisAssignment_yVar_eq hay)
      (endpointNormalAxisAssignment_xVar_eq hbx)
      (endpointNormalAxisAssignment_yVar_eq hb_y)
      hleftClass hrightClass

/-- Two ordinary-variable members of the exact `.w` center mask zero the
corresponding generated squared-distance-to-`(1,0)` difference polynomial. -/
theorem eval_sqDistToUnitX_zero_of_exactRow_w_center_members
    {pointOf : SurplusCOMPGBank.Label → ℝ²}
    {τ : ℝ}
    {centerClass : SurplusCOMPGBank.Label → Finset ℝ²}
    {exactRow : SurplusCOMPGBank.Row}
    {leftLabel rightLabel : SurplusCOMPGBank.Label}
    {ax ay bx b_y : EndpointVar}
    (hmetric :
      EndpointMetricShadow pointOf
        (SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass))
    (hmasks :
      exactRow.masks =
        (SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass).masks)
    (hleftBit :
      SurplusCOMPGBank.maskHas
        (exactRow.masks.getD SurplusCOMPGBank.Label.w.index 0)
        leftLabel = true)
    (hrightBit :
      SurplusCOMPGBank.maskHas
        (exactRow.masks.getD SurplusCOMPGBank.Label.w.index 0)
        rightLabel = true)
    (hax : endpointXVarOfLabel leftLabel = some ax)
    (hay : endpointYVarOfLabel leftLabel = some ay)
    (hbx : endpointXVarOfLabel rightLabel = some bx)
    (hb_y : endpointYVarOfLabel rightLabel = some b_y) :
    evalPoly (endpointNormalAxisAssignment pointOf τ)
      (sqDistToUnitXDiffPoly ax.index ay.index bx.index b_y.index) = 0 := by
  have hleftClass :
      (SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass).classHas
        .w leftLabel = true :=
    classHas_shadowOfPointClasses_of_exactRow_maskHas
      (center := .w) hmasks hleftBit
  have hrightClass :
      (SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass).classHas
        .w rightLabel = true :=
    classHas_shadowOfPointClasses_of_exactRow_maskHas
      (center := .w) hmasks hrightBit
  exact
    evalPoly_endpoint_sqDistToUnitXDiffPoly_eq_zero_of_metricShadow
      (pointOf := pointOf)
      (shadow := SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass)
      (a := leftLabel) (b := rightLabel)
      (ax := ax) (ay := ay) (bx := bx) (b_y := b_y)
      hmetric
      (endpointNormalAxisAssignment_xVar_eq hax)
      (endpointNormalAxisAssignment_yVar_eq hay)
      (endpointNormalAxisAssignment_xVar_eq hbx)
      (endpointNormalAxisAssignment_yVar_eq hb_y)
      hleftClass hrightClass

/-- A `.v` member and an ordinary-variable member of the exact `.w` center mask
zero the generated opposite-orientation unit squared-distance polynomial. -/
theorem eval_oneMinusSqDistToUnitX_zero_of_exactRow_w_v_member
    {pointOf : SurplusCOMPGBank.Label → ℝ²}
    {τ : ℝ}
    {centerClass : SurplusCOMPGBank.Label → Finset ℝ²}
    {exactRow : SurplusCOMPGBank.Row}
    {memberLabel : SurplusCOMPGBank.Label}
    {ax ay : EndpointVar}
    (hmetric :
      EndpointMetricShadow pointOf
        (SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass))
    (hmasks :
      exactRow.masks =
        (SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass).masks)
    (hvBit :
      SurplusCOMPGBank.maskHas
        (exactRow.masks.getD SurplusCOMPGBank.Label.w.index 0)
        .v = true)
    (hmemberBit :
      SurplusCOMPGBank.maskHas
        (exactRow.masks.getD SurplusCOMPGBank.Label.w.index 0)
        memberLabel = true)
    (hax : endpointXVarOfLabel memberLabel = some ax)
    (hay : endpointYVarOfLabel memberLabel = some ay) :
    evalPoly (endpointNormalAxisAssignment pointOf τ)
      (oneMinusSqDistToUnitXPoly ax.index ay.index) = 0 := by
  have hvClass :
      (SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass).classHas
        .w .v = true :=
    classHas_shadowOfPointClasses_of_exactRow_maskHas
      (center := .w) hmasks hvBit
  have hmemberClass :
      (SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass).classHas
        .w memberLabel = true :=
    classHas_shadowOfPointClasses_of_exactRow_maskHas
      (center := .w) hmasks hmemberBit
  exact
    evalPoly_endpoint_oneMinusSqDistToUnitXPoly_eq_zero_of_metricShadow
      (pointOf := pointOf)
      (shadow := SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass)
      (a := memberLabel) (ax := ax) (ay := ay)
      hmetric
      (endpointNormalAxisAssignment_xVar_eq hax)
      (endpointNormalAxisAssignment_yVar_eq hay)
      hvClass hmemberClass

/-- Two ordinary-variable members of any exact-row center mask zero the
corresponding generated squared-distance-to-center polynomial. -/
theorem eval_sqDistCenter_zero_of_exactRow_members
    {pointOf : SurplusCOMPGBank.Label → ℝ²}
    {τ : ℝ}
    {centerClass : SurplusCOMPGBank.Label → Finset ℝ²}
    {exactRow : SurplusCOMPGBank.Row}
    {center leftLabel rightLabel : SurplusCOMPGBank.Label}
    {cx cy ax ay bx b_y : EndpointVar}
    (hmetric :
      EndpointMetricShadow pointOf
        (SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass))
    (hmasks :
      exactRow.masks =
        (SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass).masks)
    (hleftBit :
      SurplusCOMPGBank.maskHas
        (exactRow.masks.getD center.index 0) leftLabel = true)
    (hrightBit :
      SurplusCOMPGBank.maskHas
        (exactRow.masks.getD center.index 0) rightLabel = true)
    (hcx : endpointXVarOfLabel center = some cx)
    (hcy : endpointYVarOfLabel center = some cy)
    (hax : endpointXVarOfLabel leftLabel = some ax)
    (hay : endpointYVarOfLabel leftLabel = some ay)
    (hbx : endpointXVarOfLabel rightLabel = some bx)
    (hb_y : endpointYVarOfLabel rightLabel = some b_y) :
    evalPoly (endpointNormalAxisAssignment pointOf τ)
      (sqDistToCenterDiffPoly cx.index cy.index ax.index ay.index bx.index
        b_y.index) = 0 := by
  have hleftClass :
      (SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass).classHas
        center leftLabel = true :=
    classHas_shadowOfPointClasses_of_exactRow_maskHas
      (center := center) hmasks hleftBit
  have hrightClass :
      (SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass).classHas
        center rightLabel = true :=
    classHas_shadowOfPointClasses_of_exactRow_maskHas
      (center := center) hmasks hrightBit
  exact
    evalPoly_endpoint_sqDistToCenterDiffPoly_eq_zero_of_metricShadow
      (pointOf := pointOf)
      (shadow := SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass)
      (center := center) (a := leftLabel) (b := rightLabel)
      (cx := cx) (cy := cy) (ax := ax) (ay := ay) (bx := bx) (b_y := b_y)
      hmetric
      (endpointNormalAxisAssignment_xVar_eq hcx)
      (endpointNormalAxisAssignment_yVar_eq hcy)
      (endpointNormalAxisAssignment_xVar_eq hax)
      (endpointNormalAxisAssignment_yVar_eq hay)
      (endpointNormalAxisAssignment_xVar_eq hbx)
      (endpointNormalAxisAssignment_yVar_eq hb_y)
      hleftClass hrightClass

/-- A `.v` member and an ordinary-variable member of any exact-row center mask
zero the corresponding generated mixed squared-norm/distance polynomial. -/
theorem eval_sqNormVsDist_zero_of_exactRow_v_member
    {pointOf : SurplusCOMPGBank.Label → ℝ²}
    {τ : ℝ}
    {centerClass : SurplusCOMPGBank.Label → Finset ℝ²}
    {exactRow : SurplusCOMPGBank.Row}
    {center memberLabel : SurplusCOMPGBank.Label}
    {ax ay bx b_y : EndpointVar}
    (hmetric :
      EndpointMetricShadow pointOf
        (SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass))
    (hmasks :
      exactRow.masks =
        (SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass).masks)
    (hvBit :
      SurplusCOMPGBank.maskHas
        (exactRow.masks.getD center.index 0) .v = true)
    (hmemberBit :
      SurplusCOMPGBank.maskHas
        (exactRow.masks.getD center.index 0) memberLabel = true)
    (hax : endpointXVarOfLabel center = some ax)
    (hay : endpointYVarOfLabel center = some ay)
    (hbx : endpointXVarOfLabel memberLabel = some bx)
    (hb_y : endpointYVarOfLabel memberLabel = some b_y) :
    evalPoly (endpointNormalAxisAssignment pointOf τ)
      (sqNormFirstMinusSqDistPoly ax.index ay.index bx.index b_y.index) =
        0 := by
  have hvClass :
      (SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass).classHas
        center .v = true :=
    classHas_shadowOfPointClasses_of_exactRow_maskHas
      (center := center) hmasks hvBit
  have hmemberClass :
      (SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass).classHas
        center memberLabel = true :=
    classHas_shadowOfPointClasses_of_exactRow_maskHas
      (center := center) hmasks hmemberBit
  exact
    evalPoly_endpoint_sqNormFirstMinusSqDistPoly_eq_zero_of_metricShadow
      (pointOf := pointOf)
      (shadow := SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass)
      (a := center) (b := memberLabel)
      (ax := ax) (ay := ay) (bx := bx) (b_y := b_y)
      hmetric
      (endpointNormalAxisAssignment_xVar_eq hax)
      (endpointNormalAxisAssignment_yVar_eq hay)
      (endpointNormalAxisAssignment_xVar_eq hbx)
      (endpointNormalAxisAssignment_yVar_eq hb_y)
      hvClass hmemberClass

/-- A `.v` member and an ordinary-variable member of any exact-row center mask
zero the opposite generated mixed squared-distance/norm polynomial. -/
theorem eval_sqDistVsNorm_zero_of_exactRow_v_member
    {pointOf : SurplusCOMPGBank.Label → ℝ²}
    {τ : ℝ}
    {centerClass : SurplusCOMPGBank.Label → Finset ℝ²}
    {exactRow : SurplusCOMPGBank.Row}
    {center memberLabel : SurplusCOMPGBank.Label}
    {ax ay bx b_y : EndpointVar}
    (hmetric :
      EndpointMetricShadow pointOf
        (SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass))
    (hmasks :
      exactRow.masks =
        (SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass).masks)
    (hvBit :
      SurplusCOMPGBank.maskHas
        (exactRow.masks.getD center.index 0) .v = true)
    (hmemberBit :
      SurplusCOMPGBank.maskHas
        (exactRow.masks.getD center.index 0) memberLabel = true)
    (hax : endpointXVarOfLabel center = some ax)
    (hay : endpointYVarOfLabel center = some ay)
    (hbx : endpointXVarOfLabel memberLabel = some bx)
    (hb_y : endpointYVarOfLabel memberLabel = some b_y) :
    evalPoly (endpointNormalAxisAssignment pointOf τ)
      (sqDistMinusSqNormFirstPoly ax.index ay.index bx.index b_y.index) =
        0 := by
  have hvClass :
      (SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass).classHas
        center .v = true :=
    classHas_shadowOfPointClasses_of_exactRow_maskHas
      (center := center) hmasks hvBit
  have hmemberClass :
      (SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass).classHas
        center memberLabel = true :=
    classHas_shadowOfPointClasses_of_exactRow_maskHas
      (center := center) hmasks hmemberBit
  exact
    evalPoly_endpoint_sqDistMinusSqNormFirstPoly_eq_zero_of_metricShadow
      (pointOf := pointOf)
      (shadow := SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass)
      (a := center) (b := memberLabel)
      (ax := ax) (ay := ay) (bx := bx) (b_y := b_y)
      hmetric
      (endpointNormalAxisAssignment_xVar_eq hax)
      (endpointNormalAxisAssignment_yVar_eq hay)
      (endpointNormalAxisAssignment_xVar_eq hbx)
      (endpointNormalAxisAssignment_yVar_eq hb_y)
      hmemberClass hvClass

/-- A `.w` member and an ordinary-variable member of any exact-row center mask
zero the generated point-to-`(1,0)` difference polynomial. -/
theorem eval_sqDistPointToUnitX_zero_of_exactRow_w_member
    {pointOf : SurplusCOMPGBank.Label → ℝ²}
    {τ : ℝ}
    {centerClass : SurplusCOMPGBank.Label → Finset ℝ²}
    {exactRow : SurplusCOMPGBank.Row}
    {center memberLabel : SurplusCOMPGBank.Label}
    {cx cy ax ay : EndpointVar}
    (hmetric :
      EndpointMetricShadow pointOf
        (SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass))
    (hmasks :
      exactRow.masks =
        (SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass).masks)
    (hwBit :
      SurplusCOMPGBank.maskHas
        (exactRow.masks.getD center.index 0) .w = true)
    (hmemberBit :
      SurplusCOMPGBank.maskHas
        (exactRow.masks.getD center.index 0) memberLabel = true)
    (hcx : endpointXVarOfLabel memberLabel = some cx)
    (hcy : endpointYVarOfLabel memberLabel = some cy)
    (hax : endpointXVarOfLabel center = some ax)
    (hay : endpointYVarOfLabel center = some ay) :
    evalPoly (endpointNormalAxisAssignment pointOf τ)
      (sqDistPointToUnitXDiffPoly cx.index cy.index ax.index ay.index) =
        0 := by
  have hwClass :
      (SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass).classHas
        center .w = true :=
    classHas_shadowOfPointClasses_of_exactRow_maskHas
      (center := center) hmasks hwBit
  have hmemberClass :
      (SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass).classHas
        center memberLabel = true :=
    classHas_shadowOfPointClasses_of_exactRow_maskHas
      (center := center) hmasks hmemberBit
  exact
    evalPoly_endpoint_sqDistPointToUnitXDiffPoly_eq_zero_of_metricShadow
      (pointOf := pointOf)
      (shadow := SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass)
      (center := memberLabel) (a := center)
      (cx := cx) (cy := cy) (ax := ax) (ay := ay)
      hmetric
      (endpointNormalAxisAssignment_xVar_eq hcx)
      (endpointNormalAxisAssignment_yVar_eq hcy)
      (endpointNormalAxisAssignment_xVar_eq hax)
      (endpointNormalAxisAssignment_yVar_eq hay)
      hmemberClass hwClass

/-- A `.w` member and an ordinary-variable member of any exact-row center mask
zero the opposite generated unit-x/point-center difference polynomial. -/
theorem eval_sqDistUnitXToPoint_zero_of_exactRow_w_member
    {pointOf : SurplusCOMPGBank.Label → ℝ²}
    {τ : ℝ}
    {centerClass : SurplusCOMPGBank.Label → Finset ℝ²}
    {exactRow : SurplusCOMPGBank.Row}
    {center memberLabel : SurplusCOMPGBank.Label}
    {cx cy ax ay : EndpointVar}
    (hmetric :
      EndpointMetricShadow pointOf
        (SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass))
    (hmasks :
      exactRow.masks =
        (SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass).masks)
    (hwBit :
      SurplusCOMPGBank.maskHas
        (exactRow.masks.getD center.index 0) .w = true)
    (hmemberBit :
      SurplusCOMPGBank.maskHas
        (exactRow.masks.getD center.index 0) memberLabel = true)
    (hcx : endpointXVarOfLabel memberLabel = some cx)
    (hcy : endpointYVarOfLabel memberLabel = some cy)
    (hax : endpointXVarOfLabel center = some ax)
    (hay : endpointYVarOfLabel center = some ay) :
    evalPoly (endpointNormalAxisAssignment pointOf τ)
      (sqDistUnitXToPointMinusCenterDistPoly cx.index cy.index ax.index
        ay.index) = 0 := by
  have hwClass :
      (SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass).classHas
        center .w = true :=
    classHas_shadowOfPointClasses_of_exactRow_maskHas
      (center := center) hmasks hwBit
  have hmemberClass :
      (SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass).classHas
        center memberLabel = true :=
    classHas_shadowOfPointClasses_of_exactRow_maskHas
      (center := center) hmasks hmemberBit
  exact
    evalPoly_endpoint_sqDistUnitXToPointMinusCenterDistPoly_eq_zero_of_metricShadow
      (pointOf := pointOf)
      (shadow := SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass)
      (center := memberLabel) (a := center)
      (cx := cx) (cy := cy) (ax := ax) (ay := ay)
      hmetric
      (endpointNormalAxisAssignment_xVar_eq hcx)
      (endpointNormalAxisAssignment_yVar_eq hcy)
      (endpointNormalAxisAssignment_xVar_eq hax)
      (endpointNormalAxisAssignment_yVar_eq hay)
      hwClass hmemberClass

/-- `.v` and `.w` members of any exact-row center mask zero the generated
endpoint frame equation for the ordinary center. -/
theorem eval_twiceVarMinusOne_zero_of_exactRow_v_w_members
    {pointOf : SurplusCOMPGBank.Label → ℝ²}
    {τ : ℝ}
    {centerClass : SurplusCOMPGBank.Label → Finset ℝ²}
    {exactRow : SurplusCOMPGBank.Row}
    {center : SurplusCOMPGBank.Label}
    {ax : EndpointVar}
    (hmetric :
      EndpointMetricShadow pointOf
        (SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass))
    (hmasks :
      exactRow.masks =
        (SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass).masks)
    (hvBit :
      SurplusCOMPGBank.maskHas
        (exactRow.masks.getD center.index 0) .v = true)
    (hwBit :
      SurplusCOMPGBank.maskHas
        (exactRow.masks.getD center.index 0) .w = true)
    (hax : endpointXVarOfLabel center = some ax) :
    evalPoly (endpointNormalAxisAssignment pointOf τ)
      (twiceVarMinusOnePoly ax.index) = 0 := by
  have hvClass :
      (SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass).classHas
        center .v = true :=
    classHas_shadowOfPointClasses_of_exactRow_maskHas
      (center := center) hmasks hvBit
  have hwClass :
      (SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass).classHas
        center .w = true :=
    classHas_shadowOfPointClasses_of_exactRow_maskHas
      (center := center) hmasks hwBit
  exact
    evalPoly_endpoint_twiceVarMinusOnePoly_eq_zero_of_metricShadow
      (pointOf := pointOf)
      (shadow := SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass)
      (a := center) (ax := ax)
      hmetric
      (endpointNormalAxisAssignment_xVar_eq hax)
      hvClass hwClass

end Bank

end RelaxedSplit

end SurplusCertificate

end Problem97
