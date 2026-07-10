/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.GeometryCore
import Erdos9796Proof.P97.SurplusCertificate.ExactBridge

/-!
# Geometric bridge for singleton relaxed split surplus certificates

This module composes the finite exact-bank alignment with the geometric
`shadowOfPointClasses` construction.  Under an endpoint metric-shadow
interpretation it also turns matched common-mask membership into normal-axis
distance equalities and the first all-variable polynomial zero form.
-/

open scoped EuclideanGeometry

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

namespace Bank

open EndpointCertificate
open EndpointCertificate.Variables

/-- In a matched singleton relaxed split row, a generated common mask is the
point mask of the corresponding center in the induced geometric shadow. -/
theorem commonMask_mask_eq_pointMask_of_shadowOfPointClasses
    {α : Type _} [DecidableEq α]
    {pointOf : SurplusCOMPGBank.Label → α}
    {centerClass : SurplusCOMPGBank.Label → Finset α}
    {exactRow : SurplusCOMPGBank.Row} {rowCert : Row × Certificate}
    {commonMask : CommonMask} {center : SurplusCOMPGBank.Label}
    (hrow : exactRow ∈ SurplusCOMPGBank.rows)
    (hmasks :
      exactRow.masks =
        (SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass).masks)
    (hrowCert : rowCert ∈ certifiedRelaxedSplitRows)
    (hpid : rowCert.1.exactPids = [exactRow.pid])
    (hcommon : commonMask ∈ rowCert.1.commonMasks)
    (hcenter : labelOfString commonMask.center = some center) :
    commonMask.mask =
      SurplusCOMPGBank.pointMask pointOf (centerClass center) := by
  have hmask :=
    commonMask_mask_eq_shadow_centerMask
      (shadow := SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass)
      hrow hmasks hrowCert hpid hcommon hcenter
  simpa [SurplusCOMPGBank.shadowOfPointClasses_centerMask] using hmask

/-- A stored member of a matched singleton relaxed split common mask is present
as a finite bit in the induced geometric point mask for that center. -/
theorem maskHas_pointMask_of_commonMask_member
    {α : Type _} [DecidableEq α]
    {pointOf : SurplusCOMPGBank.Label → α}
    {centerClass : SurplusCOMPGBank.Label → Finset α}
    {exactRow : SurplusCOMPGBank.Row} {rowCert : Row × Certificate}
    {commonMask : CommonMask}
    {center memberLabel : SurplusCOMPGBank.Label} {member : String}
    (hrow : exactRow ∈ SurplusCOMPGBank.rows)
    (hmasks :
      exactRow.masks =
        (SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass).masks)
    (hrowCert : rowCert ∈ certifiedRelaxedSplitRows)
    (hpid : rowCert.1.exactPids = [exactRow.pid])
    (hcommon : commonMask ∈ rowCert.1.commonMasks)
    (hcenter : labelOfString commonMask.center = some center)
    (hmember : member ∈ commonMask.members)
    (hmemberLabel : labelOfString member = some memberLabel) :
    SurplusCOMPGBank.maskHas
      (SurplusCOMPGBank.pointMask pointOf (centerClass center))
      memberLabel = true := by
  have hbit :
      SurplusCOMPGBank.maskHas commonMask.mask memberLabel = true :=
    maskHas_commonMask_of_memberString hrowCert hcommon hmember hmemberLabel
  have hmask :
      commonMask.mask =
        SurplusCOMPGBank.pointMask pointOf (centerClass center) :=
    commonMask_mask_eq_pointMask_of_shadowOfPointClasses
      hrow hmasks hrowCert hpid hcommon hcenter
  simpa [hmask] using hbit

/-- A stored member of a matched singleton relaxed split common mask is present
in the corresponding center class of the induced geometric shadow. -/
theorem classHas_shadowOfPointClasses_of_commonMask_member
    {α : Type _} [DecidableEq α]
    {pointOf : SurplusCOMPGBank.Label → α}
    {centerClass : SurplusCOMPGBank.Label → Finset α}
    {exactRow : SurplusCOMPGBank.Row} {rowCert : Row × Certificate}
    {commonMask : CommonMask}
    {center memberLabel : SurplusCOMPGBank.Label} {member : String}
    (hrow : exactRow ∈ SurplusCOMPGBank.rows)
    (hmasks :
      exactRow.masks =
        (SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass).masks)
    (hrowCert : rowCert ∈ certifiedRelaxedSplitRows)
    (hpid : rowCert.1.exactPids = [exactRow.pid])
    (hcommon : commonMask ∈ rowCert.1.commonMasks)
    (hcenter : labelOfString commonMask.center = some center)
    (hmember : member ∈ commonMask.members)
    (hmemberLabel : labelOfString member = some memberLabel) :
    (SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass).classHas
      center memberLabel = true := by
  have hbit :=
    maskHas_pointMask_of_commonMask_member
      hrow hmasks hrowCert hpid hcommon hcenter hmember hmemberLabel
  simpa [SurplusCOMPGBank.Shadow.classHas,
    SurplusCOMPGBank.shadowOfPointClasses_centerMask] using hbit


/-- Two stored members of a matched singleton relaxed split common mask have
equal normal-axis coordinate squared distance from the common center under a
metric interpretation of the induced geometric shadow. -/
theorem coordSqDist_eq_of_commonMask_members
    {pointOf : SurplusCOMPGBank.Label → ℝ²}
    {centerClass : SurplusCOMPGBank.Label → Finset ℝ²}
    {exactRow : SurplusCOMPGBank.Row} {rowCert : Row × Certificate}
    {commonMask : CommonMask}
    {center leftLabel rightLabel : SurplusCOMPGBank.Label}
    {left right : String}
    (hmetric :
      EndpointCertificate.Variables.EndpointMetricShadow pointOf
        (SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass))
    (hrow : exactRow ∈ SurplusCOMPGBank.rows)
    (hmasks :
      exactRow.masks =
        (SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass).masks)
    (hrowCert : rowCert ∈ certifiedRelaxedSplitRows)
    (hpid : rowCert.1.exactPids = [exactRow.pid])
    (hcommon : commonMask ∈ rowCert.1.commonMasks)
    (hcenter : labelOfString commonMask.center = some center)
    (hleft : left ∈ commonMask.members)
    (hleftLabel : labelOfString left = some leftLabel)
    (hright : right ∈ commonMask.members)
    (hrightLabel : labelOfString right = some rightLabel) :
    coordSqDist
        (EndpointCertificate.Variables.endpointNormalAxisCoord pointOf center)
        (EndpointCertificate.Variables.endpointNormalAxisCoord pointOf leftLabel) =
      coordSqDist
        (EndpointCertificate.Variables.endpointNormalAxisCoord pointOf center)
        (EndpointCertificate.Variables.endpointNormalAxisCoord pointOf rightLabel) := by
  have hleftClass :
      (SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass).classHas
        center leftLabel = true :=
    classHas_shadowOfPointClasses_of_commonMask_member
      hrow hmasks hrowCert hpid hcommon hcenter hleft hleftLabel
  have hrightClass :
      (SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass).classHas
        center rightLabel = true :=
    classHas_shadowOfPointClasses_of_commonMask_member
      hrow hmasks hrowCert hpid hcommon hcenter hright hrightLabel
  exact
    EndpointCertificate.Variables.EndpointMetricShadow.coordSqDist_eq
      hmetric hleftClass hrightClass

/-- Two ordinary-variable members of a matched singleton relaxed split common
mask zero the corresponding generated squared-distance-to-center polynomial. -/
theorem eval_sqDistCenter_zero_of_commonMask_members
    {pointOf : SurplusCOMPGBank.Label → ℝ²}
    {τ : ℝ}
    {centerClass : SurplusCOMPGBank.Label → Finset ℝ²}
    {exactRow : SurplusCOMPGBank.Row} {rowCert : Row × Certificate}
    {commonMask : CommonMask}
    {center leftLabel rightLabel : SurplusCOMPGBank.Label}
    {left right : String}
    {cx cy ax ay bx b_y : EndpointVar}
    (hmetric :
      EndpointMetricShadow pointOf
        (SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass))
    (hrow : exactRow ∈ SurplusCOMPGBank.rows)
    (hmasks :
      exactRow.masks =
        (SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass).masks)
    (hrowCert : rowCert ∈ certifiedRelaxedSplitRows)
    (hpid : rowCert.1.exactPids = [exactRow.pid])
    (hcommon : commonMask ∈ rowCert.1.commonMasks)
    (hcenter : labelOfString commonMask.center = some center)
    (hleft : left ∈ commonMask.members)
    (hleftLabel : labelOfString left = some leftLabel)
    (hright : right ∈ commonMask.members)
    (hrightLabel : labelOfString right = some rightLabel)
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
    classHas_shadowOfPointClasses_of_commonMask_member
      hrow hmasks hrowCert hpid hcommon hcenter hleft hleftLabel
  have hrightClass :
      (SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass).classHas
        center rightLabel = true :=
    classHas_shadowOfPointClasses_of_commonMask_member
      hrow hmasks hrowCert hpid hcommon hcenter hright hrightLabel
  exact evalPoly_endpoint_sqDistToCenterDiffPoly_eq_zero_of_metricShadow
    hmetric
    (endpointNormalAxisAssignment_xVar_eq hcx)
    (endpointNormalAxisAssignment_yVar_eq hcy)
    (endpointNormalAxisAssignment_xVar_eq hax)
    (endpointNormalAxisAssignment_yVar_eq hay)
    (endpointNormalAxisAssignment_xVar_eq hbx)
      (endpointNormalAxisAssignment_yVar_eq hb_y)
      hleftClass hrightClass


/-- A `.v` member and an ordinary-variable member of a matched singleton
relaxed split common mask zero the corresponding generated mixed
squared-norm/distance polynomial. -/
theorem eval_sqNormVsDist_zero_of_commonMask_v_member
    {pointOf : SurplusCOMPGBank.Label → ℝ²}
    {τ : ℝ}
    {centerClass : SurplusCOMPGBank.Label → Finset ℝ²}
    {exactRow : SurplusCOMPGBank.Row} {rowCert : Row × Certificate}
    {commonMask : CommonMask}
    {center memberLabel : SurplusCOMPGBank.Label}
    {vMember member : String}
    {ax ay bx b_y : EndpointVar}
    (hmetric :
      EndpointMetricShadow pointOf
        (SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass))
    (hrow : exactRow ∈ SurplusCOMPGBank.rows)
    (hmasks :
      exactRow.masks =
        (SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass).masks)
    (hrowCert : rowCert ∈ certifiedRelaxedSplitRows)
    (hpid : rowCert.1.exactPids = [exactRow.pid])
    (hcommon : commonMask ∈ rowCert.1.commonMasks)
    (hcenter : labelOfString commonMask.center = some center)
    (hvMember : vMember ∈ commonMask.members)
    (hvLabel : labelOfString vMember = some (.v))
    (hmember : member ∈ commonMask.members)
    (hmemberLabel : labelOfString member = some memberLabel)
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
    classHas_shadowOfPointClasses_of_commonMask_member
      hrow hmasks hrowCert hpid hcommon hcenter hvMember hvLabel
  have hmemberClass :
      (SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass).classHas
        center memberLabel = true :=
    classHas_shadowOfPointClasses_of_commonMask_member
      hrow hmasks hrowCert hpid hcommon hcenter hmember hmemberLabel
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

/-- A `.v` member and an ordinary-variable member of a matched singleton
relaxed split common mask zero the opposite generated mixed
squared-distance/norm polynomial. -/
theorem eval_sqDistVsNorm_zero_of_commonMask_v_member
    {pointOf : SurplusCOMPGBank.Label → ℝ²}
    {τ : ℝ}
    {centerClass : SurplusCOMPGBank.Label → Finset ℝ²}
    {exactRow : SurplusCOMPGBank.Row} {rowCert : Row × Certificate}
    {commonMask : CommonMask}
    {center memberLabel : SurplusCOMPGBank.Label}
    {vMember member : String}
    {ax ay bx b_y : EndpointVar}
    (hmetric :
      EndpointMetricShadow pointOf
        (SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass))
    (hrow : exactRow ∈ SurplusCOMPGBank.rows)
    (hmasks :
      exactRow.masks =
        (SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass).masks)
    (hrowCert : rowCert ∈ certifiedRelaxedSplitRows)
    (hpid : rowCert.1.exactPids = [exactRow.pid])
    (hcommon : commonMask ∈ rowCert.1.commonMasks)
    (hcenter : labelOfString commonMask.center = some center)
    (hvMember : vMember ∈ commonMask.members)
    (hvLabel : labelOfString vMember = some (.v))
    (hmember : member ∈ commonMask.members)
    (hmemberLabel : labelOfString member = some memberLabel)
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
    classHas_shadowOfPointClasses_of_commonMask_member
      hrow hmasks hrowCert hpid hcommon hcenter hvMember hvLabel
  have hmemberClass :
      (SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass).classHas
        center memberLabel = true :=
    classHas_shadowOfPointClasses_of_commonMask_member
      hrow hmasks hrowCert hpid hcommon hcenter hmember hmemberLabel
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

/-- A `.w` member and an ordinary-variable member of a matched singleton
relaxed split common mask zero the generated point-to-`(1,0)` difference
polynomial. -/
theorem eval_sqDistPointToUnitX_zero_of_commonMask_w_member
    {pointOf : SurplusCOMPGBank.Label → ℝ²}
    {τ : ℝ}
    {centerClass : SurplusCOMPGBank.Label → Finset ℝ²}
    {exactRow : SurplusCOMPGBank.Row} {rowCert : Row × Certificate}
    {commonMask : CommonMask}
    {center memberLabel : SurplusCOMPGBank.Label}
    {wMember member : String}
    {cx cy ax ay : EndpointVar}
    (hmetric :
      EndpointMetricShadow pointOf
        (SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass))
    (hrow : exactRow ∈ SurplusCOMPGBank.rows)
    (hmasks :
      exactRow.masks =
        (SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass).masks)
    (hrowCert : rowCert ∈ certifiedRelaxedSplitRows)
    (hpid : rowCert.1.exactPids = [exactRow.pid])
    (hcommon : commonMask ∈ rowCert.1.commonMasks)
    (hcenter : labelOfString commonMask.center = some center)
    (hwMember : wMember ∈ commonMask.members)
    (hwLabel : labelOfString wMember = some (.w))
    (hmember : member ∈ commonMask.members)
    (hmemberLabel : labelOfString member = some memberLabel)
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
    classHas_shadowOfPointClasses_of_commonMask_member
      hrow hmasks hrowCert hpid hcommon hcenter hwMember hwLabel
  have hmemberClass :
      (SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass).classHas
        center memberLabel = true :=
    classHas_shadowOfPointClasses_of_commonMask_member
      hrow hmasks hrowCert hpid hcommon hcenter hmember hmemberLabel
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

/-- A `.w` member and an ordinary-variable member of a matched singleton
relaxed split common mask zero the opposite generated unit-x/point-center
difference polynomial. -/
theorem eval_sqDistUnitXToPoint_zero_of_commonMask_w_member
    {pointOf : SurplusCOMPGBank.Label → ℝ²}
    {τ : ℝ}
    {centerClass : SurplusCOMPGBank.Label → Finset ℝ²}
    {exactRow : SurplusCOMPGBank.Row} {rowCert : Row × Certificate}
    {commonMask : CommonMask}
    {center memberLabel : SurplusCOMPGBank.Label}
    {wMember member : String}
    {cx cy ax ay : EndpointVar}
    (hmetric :
      EndpointMetricShadow pointOf
        (SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass))
    (hrow : exactRow ∈ SurplusCOMPGBank.rows)
    (hmasks :
      exactRow.masks =
        (SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass).masks)
    (hrowCert : rowCert ∈ certifiedRelaxedSplitRows)
    (hpid : rowCert.1.exactPids = [exactRow.pid])
    (hcommon : commonMask ∈ rowCert.1.commonMasks)
    (hcenter : labelOfString commonMask.center = some center)
    (hwMember : wMember ∈ commonMask.members)
    (hwLabel : labelOfString wMember = some (.w))
    (hmember : member ∈ commonMask.members)
    (hmemberLabel : labelOfString member = some memberLabel)
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
    classHas_shadowOfPointClasses_of_commonMask_member
      hrow hmasks hrowCert hpid hcommon hcenter hwMember hwLabel
  have hmemberClass :
      (SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass).classHas
        center memberLabel = true :=
    classHas_shadowOfPointClasses_of_commonMask_member
      hrow hmasks hrowCert hpid hcommon hcenter hmember hmemberLabel
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

/-- `.v` and `.w` members of a matched singleton relaxed split common mask zero
the generated endpoint frame equation for the ordinary center. -/
theorem eval_twiceVarMinusOne_zero_of_commonMask_v_w_members
    {pointOf : SurplusCOMPGBank.Label → ℝ²}
    {τ : ℝ}
    {centerClass : SurplusCOMPGBank.Label → Finset ℝ²}
    {exactRow : SurplusCOMPGBank.Row} {rowCert : Row × Certificate}
    {commonMask : CommonMask}
    {center : SurplusCOMPGBank.Label}
    {vMember wMember : String} {ax : EndpointVar}
    (hmetric :
      EndpointMetricShadow pointOf
        (SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass))
    (hrow : exactRow ∈ SurplusCOMPGBank.rows)
    (hmasks :
      exactRow.masks =
        (SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass).masks)
    (hrowCert : rowCert ∈ certifiedRelaxedSplitRows)
    (hpid : rowCert.1.exactPids = [exactRow.pid])
    (hcommon : commonMask ∈ rowCert.1.commonMasks)
    (hcenter : labelOfString commonMask.center = some center)
    (hvMember : vMember ∈ commonMask.members)
    (hvLabel : labelOfString vMember = some (.v))
    (hwMember : wMember ∈ commonMask.members)
    (hwLabel : labelOfString wMember = some (.w))
    (hax : endpointXVarOfLabel center = some ax) :
    evalPoly (endpointNormalAxisAssignment pointOf τ)
      (twiceVarMinusOnePoly ax.index) = 0 := by
  have hvClass :
      (SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass).classHas
        center .v = true :=
    classHas_shadowOfPointClasses_of_commonMask_member
      hrow hmasks hrowCert hpid hcommon hcenter hvMember hvLabel
  have hwClass :
      (SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass).classHas
        center .w = true :=
    classHas_shadowOfPointClasses_of_commonMask_member
      hrow hmasks hrowCert hpid hcommon hcenter hwMember hwLabel
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
