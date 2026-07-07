/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.GeometryBridge
import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R004UeqvR004NYN

/-!
# Shape facts for direct relaxed split row-zero certificate R004:u=v:R004NYN

This generated module contains the finite polynomial-normalization facts used
by the direct row-zero proof for one relaxed split surplus certificate.

Source certificate: `certificates/surplus/relaxed_split_singleton/R004_ueqv_R004NYN.json`.
-/

set_option linter.style.longLine false
set_option linter.style.nativeDecide false

open scoped EuclideanGeometry

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

namespace Bank

namespace RowZeros

namespace ShapeFacts

open Problem97.EndpointCertificate
open Problem97.EndpointCertificate.Variables

/-- Generator 0 for `R004:u=v:R004NYN` has the expected geometric shape. -/
theorem rs_R004_ueqv_R004NYN_generator_00_shape :
    normalizePoly (Problem97.SurplusCertificate.RelaxedSplit.rs_R004_ueqv_R004NYN_generators.get (Fin.mk 0 (by native_decide))) =
      normalizePoly (sqNormDiffPoly EndpointVar.ux.index EndpointVar.uy.index EndpointVar.s1x.index EndpointVar.s1y.index) := by
  native_decide

/-- Generator 1 for `R004:u=v:R004NYN` has the expected geometric shape. -/
theorem rs_R004_ueqv_R004NYN_generator_01_shape :
    normalizePoly (Problem97.SurplusCertificate.RelaxedSplit.rs_R004_ueqv_R004NYN_generators.get (Fin.mk 1 (by native_decide))) =
      normalizePoly (sqNormDiffPoly EndpointVar.ux.index EndpointVar.uy.index EndpointVar.pwx.index EndpointVar.pwy.index) := by
  native_decide

/-- Generator 2 for `R004:u=v:R004NYN` has the expected geometric shape. -/
theorem rs_R004_ueqv_R004NYN_generator_02_shape :
    normalizePoly (Problem97.SurplusCertificate.RelaxedSplit.rs_R004_ueqv_R004NYN_generators.get (Fin.mk 2 (by native_decide))) =
      normalizePoly (sqNormDiffPoly EndpointVar.ux.index EndpointVar.uy.index EndpointVar.pux.index EndpointVar.puy.index) := by
  native_decide

/-- Generator 3 for `R004:u=v:R004NYN` has the expected geometric shape. -/
theorem rs_R004_ueqv_R004NYN_generator_03_shape :
    normalizePoly (Problem97.SurplusCertificate.RelaxedSplit.rs_R004_ueqv_R004NYN_generators.get (Fin.mk 3 (by native_decide))) =
      normalizePoly (sqDistToUnitXDiffPoly EndpointVar.s3x.index EndpointVar.s3y.index EndpointVar.pwx.index EndpointVar.pwy.index) := by
  native_decide

/-- Generator 4 for `R004:u=v:R004NYN` has the expected geometric shape. -/
theorem rs_R004_ueqv_R004NYN_generator_04_shape :
    normalizePoly (Problem97.SurplusCertificate.RelaxedSplit.rs_R004_ueqv_R004NYN_generators.get (Fin.mk 4 (by native_decide))) =
      normalizePoly (sqDistToUnitXDiffPoly EndpointVar.s3x.index EndpointVar.s3y.index EndpointVar.q1x.index EndpointVar.q1y.index) := by
  native_decide

/-- Generator 5 for `R004:u=v:R004NYN` has the expected geometric shape. -/
theorem rs_R004_ueqv_R004NYN_generator_05_shape :
    normalizePoly (Problem97.SurplusCertificate.RelaxedSplit.rs_R004_ueqv_R004NYN_generators.get (Fin.mk 5 (by native_decide))) =
      normalizePoly (sqDistToUnitXDiffPoly EndpointVar.s3x.index EndpointVar.s3y.index EndpointVar.q2x.index EndpointVar.q2y.index) := by
  native_decide

/-- Generator 6 for `R004:u=v:R004NYN` has the expected geometric shape. -/
theorem rs_R004_ueqv_R004NYN_generator_06_shape :
    normalizePoly (Problem97.SurplusCertificate.RelaxedSplit.rs_R004_ueqv_R004NYN_generators.get (Fin.mk 6 (by native_decide))) =
      normalizePoly (rabinowitschSqNormPoly EndpointVar.tau.index EndpointVar.ux.index EndpointVar.uy.index) := by
  native_decide

/-- Generator 7 for `R004:u=v:R004NYN` has the expected geometric shape. -/
theorem rs_R004_ueqv_R004NYN_generator_07_shape :
    normalizePoly (Problem97.SurplusCertificate.RelaxedSplit.rs_R004_ueqv_R004NYN_generators.get (Fin.mk 7 (by native_decide))) =
      normalizePoly (sqNormFirstMinusSqDistPoly EndpointVar.ux.index EndpointVar.uy.index EndpointVar.s2x.index EndpointVar.s2y.index) := by
  native_decide

/-- Generator 8 for `R004:u=v:R004NYN` has the expected geometric shape. -/
theorem rs_R004_ueqv_R004NYN_generator_08_shape :
    normalizePoly (Problem97.SurplusCertificate.RelaxedSplit.rs_R004_ueqv_R004NYN_generators.get (Fin.mk 8 (by native_decide))) =
      normalizePoly (sqNormFirstMinusSqDistPoly EndpointVar.ux.index EndpointVar.uy.index EndpointVar.s3x.index EndpointVar.s3y.index) := by
  native_decide

/-- Generator 9 for `R004:u=v:R004NYN` has the expected geometric shape. -/
theorem rs_R004_ueqv_R004NYN_generator_09_shape :
    normalizePoly (Problem97.SurplusCertificate.RelaxedSplit.rs_R004_ueqv_R004NYN_generators.get (Fin.mk 9 (by native_decide))) =
      normalizePoly (sqNormFirstMinusSqDistPoly EndpointVar.ux.index EndpointVar.uy.index EndpointVar.pux.index EndpointVar.puy.index) := by
  native_decide

/-- Generator 10 for `R004:u=v:R004NYN` has the expected geometric shape. -/
theorem rs_R004_ueqv_R004NYN_generator_10_shape :
    normalizePoly (Problem97.SurplusCertificate.RelaxedSplit.rs_R004_ueqv_R004NYN_generators.get (Fin.mk 10 (by native_decide))) =
      normalizePoly (sqDistMinusSqNormFirstPoly EndpointVar.s1x.index EndpointVar.s1y.index EndpointVar.ux.index EndpointVar.uy.index) := by
  native_decide

/-- Generator 11 for `R004:u=v:R004NYN` has the expected geometric shape. -/
theorem rs_R004_ueqv_R004NYN_generator_11_shape :
    normalizePoly (Problem97.SurplusCertificate.RelaxedSplit.rs_R004_ueqv_R004NYN_generators.get (Fin.mk 11 (by native_decide))) =
      normalizePoly (sqDistToCenterDiffPoly EndpointVar.s1x.index EndpointVar.s1y.index EndpointVar.ux.index EndpointVar.uy.index EndpointVar.s2x.index EndpointVar.s2y.index) := by
  native_decide

/-- Generator 12 for `R004:u=v:R004NYN` has the expected geometric shape. -/
theorem rs_R004_ueqv_R004NYN_generator_12_shape :
    normalizePoly (Problem97.SurplusCertificate.RelaxedSplit.rs_R004_ueqv_R004NYN_generators.get (Fin.mk 12 (by native_decide))) =
      normalizePoly (sqDistToCenterDiffPoly EndpointVar.s1x.index EndpointVar.s1y.index EndpointVar.ux.index EndpointVar.uy.index EndpointVar.q2x.index EndpointVar.q2y.index) := by
  native_decide

/-- Generator 13 for `R004:u=v:R004NYN` has the expected geometric shape. -/
theorem rs_R004_ueqv_R004NYN_generator_13_shape :
    normalizePoly (Problem97.SurplusCertificate.RelaxedSplit.rs_R004_ueqv_R004NYN_generators.get (Fin.mk 13 (by native_decide))) =
      normalizePoly (sqNormFirstMinusSqDistPoly EndpointVar.s2x.index EndpointVar.s2y.index EndpointVar.s1x.index EndpointVar.s1y.index) := by
  native_decide

/-- Generator 14 for `R004:u=v:R004NYN` has the expected geometric shape. -/
theorem rs_R004_ueqv_R004NYN_generator_14_shape :
    normalizePoly (Problem97.SurplusCertificate.RelaxedSplit.rs_R004_ueqv_R004NYN_generators.get (Fin.mk 14 (by native_decide))) =
      normalizePoly (sqNormFirstMinusSqDistPoly EndpointVar.s2x.index EndpointVar.s2y.index EndpointVar.s3x.index EndpointVar.s3y.index) := by
  native_decide

/-- Generator 15 for `R004:u=v:R004NYN` has the expected geometric shape. -/
theorem rs_R004_ueqv_R004NYN_generator_15_shape :
    normalizePoly (Problem97.SurplusCertificate.RelaxedSplit.rs_R004_ueqv_R004NYN_generators.get (Fin.mk 15 (by native_decide))) =
      normalizePoly (sqNormFirstMinusSqDistPoly EndpointVar.s2x.index EndpointVar.s2y.index EndpointVar.pwx.index EndpointVar.pwy.index) := by
  native_decide

/-- Generator 16 for `R004:u=v:R004NYN` has the expected geometric shape. -/
theorem rs_R004_ueqv_R004NYN_generator_16_shape :
    normalizePoly (Problem97.SurplusCertificate.RelaxedSplit.rs_R004_ueqv_R004NYN_generators.get (Fin.mk 16 (by native_decide))) =
      normalizePoly (sqDistUnitXToPointMinusCenterDistPoly EndpointVar.s1x.index EndpointVar.s1y.index EndpointVar.s3x.index EndpointVar.s3y.index) := by
  native_decide

/-- Generator 17 for `R004:u=v:R004NYN` has the expected geometric shape. -/
theorem rs_R004_ueqv_R004NYN_generator_17_shape :
    normalizePoly (Problem97.SurplusCertificate.RelaxedSplit.rs_R004_ueqv_R004NYN_generators.get (Fin.mk 17 (by native_decide))) =
      normalizePoly (sqDistUnitXToPointMinusCenterDistPoly EndpointVar.pux.index EndpointVar.puy.index EndpointVar.s3x.index EndpointVar.s3y.index) := by
  native_decide

/-- Generator 18 for `R004:u=v:R004NYN` has the expected geometric shape. -/
theorem rs_R004_ueqv_R004NYN_generator_18_shape :
    normalizePoly (Problem97.SurplusCertificate.RelaxedSplit.rs_R004_ueqv_R004NYN_generators.get (Fin.mk 18 (by native_decide))) =
      normalizePoly (sqDistUnitXToPointMinusCenterDistPoly EndpointVar.q2x.index EndpointVar.q2y.index EndpointVar.s3x.index EndpointVar.s3y.index) := by
  native_decide

/-- Generator 19 for `R004:u=v:R004NYN` has the expected geometric shape. -/
theorem rs_R004_ueqv_R004NYN_generator_19_shape :
    normalizePoly (Problem97.SurplusCertificate.RelaxedSplit.rs_R004_ueqv_R004NYN_generators.get (Fin.mk 19 (by native_decide))) =
      normalizePoly (twiceVarMinusOnePoly EndpointVar.pwx.index) := by
  native_decide

/-- Generator 20 for `R004:u=v:R004NYN` has the expected geometric shape. -/
theorem rs_R004_ueqv_R004NYN_generator_20_shape :
    normalizePoly (Problem97.SurplusCertificate.RelaxedSplit.rs_R004_ueqv_R004NYN_generators.get (Fin.mk 20 (by native_decide))) =
      normalizePoly (sqNormFirstMinusSqDistPoly EndpointVar.pwx.index EndpointVar.pwy.index EndpointVar.pux.index EndpointVar.puy.index) := by
  native_decide

/-- Generator 21 for `R004:u=v:R004NYN` has the expected geometric shape. -/
theorem rs_R004_ueqv_R004NYN_generator_21_shape :
    normalizePoly (Problem97.SurplusCertificate.RelaxedSplit.rs_R004_ueqv_R004NYN_generators.get (Fin.mk 21 (by native_decide))) =
      normalizePoly (sqNormFirstMinusSqDistPoly EndpointVar.pwx.index EndpointVar.pwy.index EndpointVar.q1x.index EndpointVar.q1y.index) := by
  native_decide

/-- Generator 22 for `R004:u=v:R004NYN` has the expected geometric shape. -/
theorem rs_R004_ueqv_R004NYN_generator_22_shape :
    normalizePoly (Problem97.SurplusCertificate.RelaxedSplit.rs_R004_ueqv_R004NYN_generators.get (Fin.mk 22 (by native_decide))) =
      normalizePoly (sqDistToCenterDiffPoly EndpointVar.pux.index EndpointVar.puy.index EndpointVar.ux.index EndpointVar.uy.index EndpointVar.s1x.index EndpointVar.s1y.index) := by
  native_decide

/-- Generator 23 for `R004:u=v:R004NYN` has the expected geometric shape. -/
theorem rs_R004_ueqv_R004NYN_generator_23_shape :
    normalizePoly (Problem97.SurplusCertificate.RelaxedSplit.rs_R004_ueqv_R004NYN_generators.get (Fin.mk 23 (by native_decide))) =
      normalizePoly (sqDistToCenterDiffPoly EndpointVar.pux.index EndpointVar.puy.index EndpointVar.ux.index EndpointVar.uy.index EndpointVar.s2x.index EndpointVar.s2y.index) := by
  native_decide

/-- Generator 24 for `R004:u=v:R004NYN` has the expected geometric shape. -/
theorem rs_R004_ueqv_R004NYN_generator_24_shape :
    normalizePoly (Problem97.SurplusCertificate.RelaxedSplit.rs_R004_ueqv_R004NYN_generators.get (Fin.mk 24 (by native_decide))) =
      normalizePoly (sqDistToCenterDiffPoly EndpointVar.pux.index EndpointVar.puy.index EndpointVar.ux.index EndpointVar.uy.index EndpointVar.q1x.index EndpointVar.q1y.index) := by
  native_decide

/-- Generator 25 for `R004:u=v:R004NYN` has the expected geometric shape. -/
theorem rs_R004_ueqv_R004NYN_generator_25_shape :
    normalizePoly (Problem97.SurplusCertificate.RelaxedSplit.rs_R004_ueqv_R004NYN_generators.get (Fin.mk 25 (by native_decide))) =
      normalizePoly (sqDistUnitXToPointMinusCenterDistPoly EndpointVar.s2x.index EndpointVar.s2y.index EndpointVar.q1x.index EndpointVar.q1y.index) := by
  native_decide

/-- Generator 26 for `R004:u=v:R004NYN` has the expected geometric shape. -/
theorem rs_R004_ueqv_R004NYN_generator_26_shape :
    normalizePoly (Problem97.SurplusCertificate.RelaxedSplit.rs_R004_ueqv_R004NYN_generators.get (Fin.mk 26 (by native_decide))) =
      normalizePoly (sqDistUnitXToPointMinusCenterDistPoly EndpointVar.pwx.index EndpointVar.pwy.index EndpointVar.q1x.index EndpointVar.q1y.index) := by
  native_decide

/-- Generator 27 for `R004:u=v:R004NYN` has the expected geometric shape. -/
theorem rs_R004_ueqv_R004NYN_generator_27_shape :
    normalizePoly (Problem97.SurplusCertificate.RelaxedSplit.rs_R004_ueqv_R004NYN_generators.get (Fin.mk 27 (by native_decide))) =
      normalizePoly (sqDistUnitXToPointMinusCenterDistPoly EndpointVar.q2x.index EndpointVar.q2y.index EndpointVar.q1x.index EndpointVar.q1y.index) := by
  native_decide

/-- Generator 28 for `R004:u=v:R004NYN` has the expected geometric shape. -/
theorem rs_R004_ueqv_R004NYN_generator_28_shape :
    normalizePoly (Problem97.SurplusCertificate.RelaxedSplit.rs_R004_ueqv_R004NYN_generators.get (Fin.mk 28 (by native_decide))) =
      normalizePoly (sqDistUnitXToPointMinusCenterDistPoly EndpointVar.s1x.index EndpointVar.s1y.index EndpointVar.q2x.index EndpointVar.q2y.index) := by
  native_decide

/-- Generator 29 for `R004:u=v:R004NYN` has the expected geometric shape. -/
theorem rs_R004_ueqv_R004NYN_generator_29_shape :
    normalizePoly (Problem97.SurplusCertificate.RelaxedSplit.rs_R004_ueqv_R004NYN_generators.get (Fin.mk 29 (by native_decide))) =
      normalizePoly (sqDistUnitXToPointMinusCenterDistPoly EndpointVar.s3x.index EndpointVar.s3y.index EndpointVar.q2x.index EndpointVar.q2y.index) := by
  native_decide

/-- Generator 30 for `R004:u=v:R004NYN` has the expected geometric shape. -/
theorem rs_R004_ueqv_R004NYN_generator_30_shape :
    normalizePoly (Problem97.SurplusCertificate.RelaxedSplit.rs_R004_ueqv_R004NYN_generators.get (Fin.mk 30 (by native_decide))) =
      normalizePoly (sqDistUnitXToPointMinusCenterDistPoly EndpointVar.q1x.index EndpointVar.q1y.index EndpointVar.q2x.index EndpointVar.q2y.index) := by
  native_decide

end ShapeFacts

end RowZeros

end Bank

end RelaxedSplit

end SurplusCertificate

end Problem97
