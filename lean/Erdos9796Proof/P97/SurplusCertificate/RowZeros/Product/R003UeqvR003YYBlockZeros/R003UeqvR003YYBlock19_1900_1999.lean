/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.GeometryBridge
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.ExactMaskBits.S1024
import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.R003UeqvR003YYBlock19_1900_1999

/-!
# Product-sum row block zero for relaxed split surplus certificate R003:u=v:R003YY

This generated module proves semantic zero-evaluation for one checked block in
the term-sharded product-sum relaxed split surplus certificate row `R003:u=v:R003YY`.

Source certificate: `certificates/surplus/relaxed_split_singleton/R003_ueqv_R003YY.json`.
-/

set_option linter.style.longLine false
set_option linter.unusedSimpArgs false
set_option linter.style.nativeDecide false

open scoped EuclideanGeometry

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

namespace Bank

namespace RowZeros

namespace Product

open Problem97.EndpointCertificate
open Problem97.EndpointCertificate.Variables

private theorem rs_R003_ueqv_R003YY_generator_19_1900_1999_shape :
    normalizePoly (Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_generator_19_1900_1999) =
      normalizePoly (twiceVarMinusOnePoly EndpointVar.pwx.index) := by
  native_decide

/-- Checked block `19:1900-1999` in product-sum row `R003:u=v:R003YY`
evaluates to zero under the row-local normal-axis assignment. -/
theorem rs_R003_ueqv_R003YY_block_19_1900_1999_eval_zero
    {pointOf : SurplusCOMPGBank.Label → ℝ²}
    {centerClass : SurplusCOMPGBank.Label → Finset ℝ²}
    {exactRow : SurplusCOMPGBank.Row}
    (hmetric :
      EndpointMetricShadow pointOf
        (SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass))
    (hrow : exactRow ∈ SurplusCOMPGBank.rows)
    (hmasks :
      exactRow.masks =
        (SurplusCOMPGBank.shadowOfPointClasses pointOf centerClass).masks)
    (hpidEq : exactRow.pid = "s1_024") :
    evalPoly (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_block_19_1900_1999 = 0 := by
  have hgenerator :
      evalPoly (endpointPairAssignment pointOf .u .v) (Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_generator_19_1900_1999) = 0 := by
    exact evalPoly_eq_zero_of_normalizePoly_eq
      (endpointPairAssignment pointOf .u .v) (q := twiceVarMinusOnePoly EndpointVar.pwx.index)
      rs_R003_ueqv_R003YY_generator_19_1900_1999_shape
      (by
        exact (
          eval_twiceVarMinusOne_zero_of_exactRow_v_w_members
          (pointOf := pointOf) (centerClass := centerClass)
          (exactRow := exactRow)
          (center := .Pw)
          (ax := EndpointVar.pwx)
          hmetric hmasks
          (maskHas_exactRow_of_pid (pid := "s1_024") (center := .Pw) (label := .v) hrow hpidEq Problem97.SurplusCertificate.RelaxedSplit.Bank.RowZeros.ExactMaskBits.exactMaskAll_rs_s1_024_Pw_v)
          (maskHas_exactRow_of_pid (pid := "s1_024") (center := .Pw) (label := .w) hrow hpidEq Problem97.SurplusCertificate.RelaxedSplit.Bank.RowZeros.ExactMaskBits.exactMaskAll_rs_s1_024_Pw_w)
          (by native_decide)))
  refine evalPoly_target_eq_zero_of_checkProductSumEq
    (endpointPairAssignment pointOf .u .v)
    Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_block_19_1900_1999_valid ?_
  intro p hp
  simp only [Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partials_19_1900_1999,
    List.mem_cons, List.not_mem_nil, or_false] at hp
  rcases hp with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_19_1900_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_19_1901_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_19_1902_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_19_1903_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_19_1904_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_19_1905_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_19_1906_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_19_1907_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_19_1908_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_19_1909_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_19_1910_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_19_1911_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_19_1912_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_19_1913_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_19_1914_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_19_1915_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_19_1916_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_19_1917_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_19_1918_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_19_1919_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_19_1920_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_19_1921_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_19_1922_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_19_1923_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_19_1924_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_19_1925_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_19_1926_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_19_1927_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_19_1928_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_19_1929_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_19_1930_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_19_1931_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_19_1932_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_19_1933_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_19_1934_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_19_1935_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_19_1936_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_19_1937_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_19_1938_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_19_1939_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_19_1940_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_19_1941_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_19_1942_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_19_1943_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_19_1944_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_19_1945_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_19_1946_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_19_1947_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_19_1948_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_19_1949_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_19_1950_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_19_1951_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_19_1952_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_19_1953_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_19_1954_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_19_1955_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_19_1956_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_19_1957_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_19_1958_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_19_1959_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_19_1960_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_19_1961_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_19_1962_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_19_1963_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_19_1964_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_19_1965_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_19_1966_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_19_1967_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_19_1968_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_19_1969_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_19_1970_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_19_1971_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_19_1972_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_19_1973_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_19_1974_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_19_1975_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_19_1976_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_19_1977_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_19_1978_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_19_1979_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_19_1980_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_19_1981_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_19_1982_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_19_1983_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_19_1984_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_19_1985_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_19_1986_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_19_1987_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_19_1988_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_19_1989_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_19_1990_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_19_1991_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_19_1992_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_19_1993_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_19_1994_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_19_1995_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_19_1996_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_19_1997_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_19_1998_valid
      hgenerator
  · exact evalPoly_eq_zero_of_mulPoly_eq_right_zero
      (endpointPairAssignment pointOf .u .v)
      Problem97.SurplusCertificate.RelaxedSplit.R003UeqvR003YYTermShards.rs_R003_ueqv_R003YY_partial_19_1999_valid
      hgenerator

end Product

end RowZeros

end Bank

end RelaxedSplit

end SurplusCertificate

end Problem97
