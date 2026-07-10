/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.ExactBridge

/-!
# Exact mask-bit certificates for direct relaxed split row-zero proofs

This generated module contains the finite exact-bank `rows.all` checks consumed
by the direct relaxed split row-zero modules.  Keeping these checks in one
compiled dependency prevents each row-zero module from re-running the same
finite incidence decisions while elaborating geometric generator zeros.
-/

set_option linter.style.longLine false
set_option linter.style.nativeDecide false

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

namespace Bank

namespace RowZeros

namespace ExactMaskBits

/-- Finite exact-bank check: row `s2_055` has `s1` in `u`'s mask. -/
theorem exactMaskAll_rs_s2_055_u_s1 :
    SurplusCOMPGBank.rows.all
      (fun row =>
        if row.pid = "s2_055" then
          SurplusCOMPGBank.maskHas
            (row.masks.getD SurplusCOMPGBank.Label.u.index 0)
            .s1
        else
          true) = true := by
  native_decide

/-- Finite exact-bank check: row `s2_055` has `s3` in `u`'s mask. -/
theorem exactMaskAll_rs_s2_055_u_s3 :
    SurplusCOMPGBank.rows.all
      (fun row =>
        if row.pid = "s2_055" then
          SurplusCOMPGBank.maskHas
            (row.masks.getD SurplusCOMPGBank.Label.u.index 0)
            .s3
        else
          true) = true := by
  native_decide

/-- Finite exact-bank check: row `s2_055` has `Pu` in `u`'s mask. -/
theorem exactMaskAll_rs_s2_055_u_Pu :
    SurplusCOMPGBank.rows.all
      (fun row =>
        if row.pid = "s2_055" then
          SurplusCOMPGBank.maskHas
            (row.masks.getD SurplusCOMPGBank.Label.u.index 0)
            .Pu
        else
          true) = true := by
  native_decide

/-- Finite exact-bank check: row `s2_055` has `Q1` in `u`'s mask. -/
theorem exactMaskAll_rs_s2_055_u_Q1 :
    SurplusCOMPGBank.rows.all
      (fun row =>
        if row.pid = "s2_055" then
          SurplusCOMPGBank.maskHas
            (row.masks.getD SurplusCOMPGBank.Label.u.index 0)
            .Q1
        else
          true) = true := by
  native_decide

/-- Finite exact-bank check: row `s2_055` has `u` in `v`'s mask. -/
theorem exactMaskAll_rs_s2_055_v_u :
    SurplusCOMPGBank.rows.all
      (fun row =>
        if row.pid = "s2_055" then
          SurplusCOMPGBank.maskHas
            (row.masks.getD SurplusCOMPGBank.Label.v.index 0)
            .u
        else
          true) = true := by
  native_decide

/-- Finite exact-bank check: row `s2_055` has `s2` in `v`'s mask. -/
theorem exactMaskAll_rs_s2_055_v_s2 :
    SurplusCOMPGBank.rows.all
      (fun row =>
        if row.pid = "s2_055" then
          SurplusCOMPGBank.maskHas
            (row.masks.getD SurplusCOMPGBank.Label.v.index 0)
            .s2
        else
          true) = true := by
  native_decide

/-- Finite exact-bank check: row `s2_055` has `Pw` in `v`'s mask. -/
theorem exactMaskAll_rs_s2_055_v_Pw :
    SurplusCOMPGBank.rows.all
      (fun row =>
        if row.pid = "s2_055" then
          SurplusCOMPGBank.maskHas
            (row.masks.getD SurplusCOMPGBank.Label.v.index 0)
            .Pw
        else
          true) = true := by
  native_decide

/-- Finite exact-bank check: row `s2_055` has `Pu` in `v`'s mask. -/
theorem exactMaskAll_rs_s2_055_v_Pu :
    SurplusCOMPGBank.rows.all
      (fun row =>
        if row.pid = "s2_055" then
          SurplusCOMPGBank.maskHas
            (row.masks.getD SurplusCOMPGBank.Label.v.index 0)
            .Pu
        else
          true) = true := by
  native_decide

/-- Finite exact-bank check: row `s2_055` has `s2` in `w`'s mask. -/
theorem exactMaskAll_rs_s2_055_w_s2 :
    SurplusCOMPGBank.rows.all
      (fun row =>
        if row.pid = "s2_055" then
          SurplusCOMPGBank.maskHas
            (row.masks.getD SurplusCOMPGBank.Label.w.index 0)
            .s2
        else
          true) = true := by
  native_decide

/-- Finite exact-bank check: row `s2_055` has `Pu` in `w`'s mask. -/
theorem exactMaskAll_rs_s2_055_w_Pu :
    SurplusCOMPGBank.rows.all
      (fun row =>
        if row.pid = "s2_055" then
          SurplusCOMPGBank.maskHas
            (row.masks.getD SurplusCOMPGBank.Label.w.index 0)
            .Pu
        else
          true) = true := by
  native_decide

/-- Finite exact-bank check: row `s2_055` has `Q1` in `w`'s mask. -/
theorem exactMaskAll_rs_s2_055_w_Q1 :
    SurplusCOMPGBank.rows.all
      (fun row =>
        if row.pid = "s2_055" then
          SurplusCOMPGBank.maskHas
            (row.masks.getD SurplusCOMPGBank.Label.w.index 0)
            .Q1
        else
          true) = true := by
  native_decide

/-- Finite exact-bank check: row `s2_055` has `Q2` in `w`'s mask. -/
theorem exactMaskAll_rs_s2_055_w_Q2 :
    SurplusCOMPGBank.rows.all
      (fun row =>
        if row.pid = "s2_055" then
          SurplusCOMPGBank.maskHas
            (row.masks.getD SurplusCOMPGBank.Label.w.index 0)
            .Q2
        else
          true) = true := by
  native_decide

/-- Finite exact-bank check: row `s2_055` has `v` in `s1`'s mask. -/
theorem exactMaskAll_rs_s2_055_s1_v :
    SurplusCOMPGBank.rows.all
      (fun row =>
        if row.pid = "s2_055" then
          SurplusCOMPGBank.maskHas
            (row.masks.getD SurplusCOMPGBank.Label.s1.index 0)
            .v
        else
          true) = true := by
  native_decide

/-- Finite exact-bank check: row `s2_055` has `w` in `s1`'s mask. -/
theorem exactMaskAll_rs_s2_055_s1_w :
    SurplusCOMPGBank.rows.all
      (fun row =>
        if row.pid = "s2_055" then
          SurplusCOMPGBank.maskHas
            (row.masks.getD SurplusCOMPGBank.Label.s1.index 0)
            .w
        else
          true) = true := by
  native_decide

/-- Finite exact-bank check: row `s2_055` has `s2` in `s1`'s mask. -/
theorem exactMaskAll_rs_s2_055_s1_s2 :
    SurplusCOMPGBank.rows.all
      (fun row =>
        if row.pid = "s2_055" then
          SurplusCOMPGBank.maskHas
            (row.masks.getD SurplusCOMPGBank.Label.s1.index 0)
            .s2
        else
          true) = true := by
  native_decide

/-- Finite exact-bank check: row `s2_055` has `Q2` in `s1`'s mask. -/
theorem exactMaskAll_rs_s2_055_s1_Q2 :
    SurplusCOMPGBank.rows.all
      (fun row =>
        if row.pid = "s2_055" then
          SurplusCOMPGBank.maskHas
            (row.masks.getD SurplusCOMPGBank.Label.s1.index 0)
            .Q2
        else
          true) = true := by
  native_decide

/-- Finite exact-bank check: row `s2_055` has `u` in `s2`'s mask. -/
theorem exactMaskAll_rs_s2_055_s2_u :
    SurplusCOMPGBank.rows.all
      (fun row =>
        if row.pid = "s2_055" then
          SurplusCOMPGBank.maskHas
            (row.masks.getD SurplusCOMPGBank.Label.s2.index 0)
            .u
        else
          true) = true := by
  native_decide

/-- Finite exact-bank check: row `s2_055` has `v` in `s2`'s mask. -/
theorem exactMaskAll_rs_s2_055_s2_v :
    SurplusCOMPGBank.rows.all
      (fun row =>
        if row.pid = "s2_055" then
          SurplusCOMPGBank.maskHas
            (row.masks.getD SurplusCOMPGBank.Label.s2.index 0)
            .v
        else
          true) = true := by
  native_decide

/-- Finite exact-bank check: row `s2_055` has `s3` in `s2`'s mask. -/
theorem exactMaskAll_rs_s2_055_s2_s3 :
    SurplusCOMPGBank.rows.all
      (fun row =>
        if row.pid = "s2_055" then
          SurplusCOMPGBank.maskHas
            (row.masks.getD SurplusCOMPGBank.Label.s2.index 0)
            .s3
        else
          true) = true := by
  native_decide

/-- Finite exact-bank check: row `s2_055` has `Q1` in `s2`'s mask. -/
theorem exactMaskAll_rs_s2_055_s2_Q1 :
    SurplusCOMPGBank.rows.all
      (fun row =>
        if row.pid = "s2_055" then
          SurplusCOMPGBank.maskHas
            (row.masks.getD SurplusCOMPGBank.Label.s2.index 0)
            .Q1
        else
          true) = true := by
  native_decide

/-- Finite exact-bank check: row `s2_055` has `w` in `s3`'s mask. -/
theorem exactMaskAll_rs_s2_055_s3_w :
    SurplusCOMPGBank.rows.all
      (fun row =>
        if row.pid = "s2_055" then
          SurplusCOMPGBank.maskHas
            (row.masks.getD SurplusCOMPGBank.Label.s3.index 0)
            .w
        else
          true) = true := by
  native_decide

/-- Finite exact-bank check: row `s2_055` has `s1` in `s3`'s mask. -/
theorem exactMaskAll_rs_s2_055_s3_s1 :
    SurplusCOMPGBank.rows.all
      (fun row =>
        if row.pid = "s2_055" then
          SurplusCOMPGBank.maskHas
            (row.masks.getD SurplusCOMPGBank.Label.s3.index 0)
            .s1
        else
          true) = true := by
  native_decide

/-- Finite exact-bank check: row `s2_055` has `s2` in `s3`'s mask. -/
theorem exactMaskAll_rs_s2_055_s3_s2 :
    SurplusCOMPGBank.rows.all
      (fun row =>
        if row.pid = "s2_055" then
          SurplusCOMPGBank.maskHas
            (row.masks.getD SurplusCOMPGBank.Label.s3.index 0)
            .s2
        else
          true) = true := by
  native_decide

/-- Finite exact-bank check: row `s2_055` has `Pw` in `s3`'s mask. -/
theorem exactMaskAll_rs_s2_055_s3_Pw :
    SurplusCOMPGBank.rows.all
      (fun row =>
        if row.pid = "s2_055" then
          SurplusCOMPGBank.maskHas
            (row.masks.getD SurplusCOMPGBank.Label.s3.index 0)
            .Pw
        else
          true) = true := by
  native_decide

/-- Finite exact-bank check: row `s2_055` has `v` in `Pw`'s mask. -/
theorem exactMaskAll_rs_s2_055_Pw_v :
    SurplusCOMPGBank.rows.all
      (fun row =>
        if row.pid = "s2_055" then
          SurplusCOMPGBank.maskHas
            (row.masks.getD SurplusCOMPGBank.Label.Pw.index 0)
            .v
        else
          true) = true := by
  native_decide

/-- Finite exact-bank check: row `s2_055` has `w` in `Pw`'s mask. -/
theorem exactMaskAll_rs_s2_055_Pw_w :
    SurplusCOMPGBank.rows.all
      (fun row =>
        if row.pid = "s2_055" then
          SurplusCOMPGBank.maskHas
            (row.masks.getD SurplusCOMPGBank.Label.Pw.index 0)
            .w
        else
          true) = true := by
  native_decide

/-- Finite exact-bank check: row `s2_055` has `s3` in `Pw`'s mask. -/
theorem exactMaskAll_rs_s2_055_Pw_s3 :
    SurplusCOMPGBank.rows.all
      (fun row =>
        if row.pid = "s2_055" then
          SurplusCOMPGBank.maskHas
            (row.masks.getD SurplusCOMPGBank.Label.Pw.index 0)
            .s3
        else
          true) = true := by
  native_decide

/-- Finite exact-bank check: row `s2_055` has `Pu` in `Pw`'s mask. -/
theorem exactMaskAll_rs_s2_055_Pw_Pu :
    SurplusCOMPGBank.rows.all
      (fun row =>
        if row.pid = "s2_055" then
          SurplusCOMPGBank.maskHas
            (row.masks.getD SurplusCOMPGBank.Label.Pw.index 0)
            .Pu
        else
          true) = true := by
  native_decide

/-- Finite exact-bank check: row `s2_055` has `u` in `Pu`'s mask. -/
theorem exactMaskAll_rs_s2_055_Pu_u :
    SurplusCOMPGBank.rows.all
      (fun row =>
        if row.pid = "s2_055" then
          SurplusCOMPGBank.maskHas
            (row.masks.getD SurplusCOMPGBank.Label.Pu.index 0)
            .u
        else
          true) = true := by
  native_decide

/-- Finite exact-bank check: row `s2_055` has `s3` in `Pu`'s mask. -/
theorem exactMaskAll_rs_s2_055_Pu_s3 :
    SurplusCOMPGBank.rows.all
      (fun row =>
        if row.pid = "s2_055" then
          SurplusCOMPGBank.maskHas
            (row.masks.getD SurplusCOMPGBank.Label.Pu.index 0)
            .s3
        else
          true) = true := by
  native_decide

/-- Finite exact-bank check: row `s2_055` has `Pw` in `Pu`'s mask. -/
theorem exactMaskAll_rs_s2_055_Pu_Pw :
    SurplusCOMPGBank.rows.all
      (fun row =>
        if row.pid = "s2_055" then
          SurplusCOMPGBank.maskHas
            (row.masks.getD SurplusCOMPGBank.Label.Pu.index 0)
            .Pw
        else
          true) = true := by
  native_decide

/-- Finite exact-bank check: row `s2_055` has `Q2` in `Pu`'s mask. -/
theorem exactMaskAll_rs_s2_055_Pu_Q2 :
    SurplusCOMPGBank.rows.all
      (fun row =>
        if row.pid = "s2_055" then
          SurplusCOMPGBank.maskHas
            (row.masks.getD SurplusCOMPGBank.Label.Pu.index 0)
            .Q2
        else
          true) = true := by
  native_decide

/-- Finite exact-bank check: row `s2_055` has `u` in `Q1`'s mask. -/
theorem exactMaskAll_rs_s2_055_Q1_u :
    SurplusCOMPGBank.rows.all
      (fun row =>
        if row.pid = "s2_055" then
          SurplusCOMPGBank.maskHas
            (row.masks.getD SurplusCOMPGBank.Label.Q1.index 0)
            .u
        else
          true) = true := by
  native_decide

/-- Finite exact-bank check: row `s2_055` has `w` in `Q1`'s mask. -/
theorem exactMaskAll_rs_s2_055_Q1_w :
    SurplusCOMPGBank.rows.all
      (fun row =>
        if row.pid = "s2_055" then
          SurplusCOMPGBank.maskHas
            (row.masks.getD SurplusCOMPGBank.Label.Q1.index 0)
            .w
        else
          true) = true := by
  native_decide

/-- Finite exact-bank check: row `s2_055` has `s1` in `Q1`'s mask. -/
theorem exactMaskAll_rs_s2_055_Q1_s1 :
    SurplusCOMPGBank.rows.all
      (fun row =>
        if row.pid = "s2_055" then
          SurplusCOMPGBank.maskHas
            (row.masks.getD SurplusCOMPGBank.Label.Q1.index 0)
            .s1
        else
          true) = true := by
  native_decide

/-- Finite exact-bank check: row `s2_055` has `Q2` in `Q1`'s mask. -/
theorem exactMaskAll_rs_s2_055_Q1_Q2 :
    SurplusCOMPGBank.rows.all
      (fun row =>
        if row.pid = "s2_055" then
          SurplusCOMPGBank.maskHas
            (row.masks.getD SurplusCOMPGBank.Label.Q1.index 0)
            .Q2
        else
          true) = true := by
  native_decide

/-- Finite exact-bank check: row `s2_055` has `v` in `Q2`'s mask. -/
theorem exactMaskAll_rs_s2_055_Q2_v :
    SurplusCOMPGBank.rows.all
      (fun row =>
        if row.pid = "s2_055" then
          SurplusCOMPGBank.maskHas
            (row.masks.getD SurplusCOMPGBank.Label.Q2.index 0)
            .v
        else
          true) = true := by
  native_decide

/-- Finite exact-bank check: row `s2_055` has `s1` in `Q2`'s mask. -/
theorem exactMaskAll_rs_s2_055_Q2_s1 :
    SurplusCOMPGBank.rows.all
      (fun row =>
        if row.pid = "s2_055" then
          SurplusCOMPGBank.maskHas
            (row.masks.getD SurplusCOMPGBank.Label.Q2.index 0)
            .s1
        else
          true) = true := by
  native_decide

/-- Finite exact-bank check: row `s2_055` has `Pw` in `Q2`'s mask. -/
theorem exactMaskAll_rs_s2_055_Q2_Pw :
    SurplusCOMPGBank.rows.all
      (fun row =>
        if row.pid = "s2_055" then
          SurplusCOMPGBank.maskHas
            (row.masks.getD SurplusCOMPGBank.Label.Q2.index 0)
            .Pw
        else
          true) = true := by
  native_decide

/-- Finite exact-bank check: row `s2_055` has `Q1` in `Q2`'s mask. -/
theorem exactMaskAll_rs_s2_055_Q2_Q1 :
    SurplusCOMPGBank.rows.all
      (fun row =>
        if row.pid = "s2_055" then
          SurplusCOMPGBank.maskHas
            (row.masks.getD SurplusCOMPGBank.Label.Q2.index 0)
            .Q1
        else
          true) = true := by
  native_decide

end ExactMaskBits

end RowZeros

end Bank

end RelaxedSplit

end SurplusCertificate

end Problem97
