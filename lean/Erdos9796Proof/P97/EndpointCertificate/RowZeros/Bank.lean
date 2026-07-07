/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.BankSoundness
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Direct.All
import Erdos9796Proof.P97.EndpointCertificate.RowZeros.Product.All

/-!
# Endpoint bank row-zero dispatch

This generated module dispatches a matched finite endpoint-bank row to the
corresponding generated direct or product-sum row-zero theorem.
-/

set_option linter.style.longLine false

open scoped EuclideanGeometry

namespace Problem97

namespace EndpointCertificate

namespace Variables

/-- A metric interpretation transports across equality of finite shadow masks. -/
theorem metricShadow_of_row_masks_eq
    {pointOf : ShadowBank.Label → ℝ²}
    {row : ShadowBank.EndpointRow} {shadow : ShadowBank.Shadow}
    (hmetric : EndpointMetricShadow pointOf shadow)
    (hmasks : row.masks = shadow.masks) :
    EndpointMetricShadow pointOf row.toShadow := by
  cases row with
  | mk id escapee masks =>
      cases shadow with
      | mk shadowMasks =>
          dsimp [ShadowBank.EndpointRow.toShadow] at hmasks ⊢
          subst shadowMasks
          exact hmetric

/-- A certified endpoint-bank row carries the zero-evaluation condition for its
matched algebraic certificate payload. -/
theorem payload_zeros_of_certifiedEndpointRow
    {pointOf : ShadowBank.Label → ℝ²}
    {shadow : ShadowBank.Shadow}
    (hmetric : EndpointMetricShadow pointOf shadow)
    (rowCert : Bank.Row × Bank.Certificate)
    (hrowCert : rowCert ∈ Bank.certifiedEndpointRows)
    (hmasks : rowCert.1.masks = shadow.masks) :
    rowCert.2.payload.evaluationZeros (endpointS1S3Assignment pointOf) := by
  change rowCert ∈
    [
      (ShadowBank.endpointRowsQ1.get (Fin.mk 0 (by decide)), { id := "ep_Q1_000", payload := .direct Patterns.ep_Q1_000, valid := Patterns.ep_Q1_000_valid }),
      (ShadowBank.endpointRowsQ1.get (Fin.mk 1 (by decide)), { id := "ep_Q1_001", payload := .direct Patterns.ep_Q1_001, valid := Patterns.ep_Q1_001_valid }),
      (ShadowBank.endpointRowsQ1.get (Fin.mk 2 (by decide)), { id := "ep_Q1_002", payload := .direct Patterns.ep_Q1_002, valid := Patterns.ep_Q1_002_valid }),
      (ShadowBank.endpointRowsQ1.get (Fin.mk 3 (by decide)), { id := "ep_Q1_003", payload := .direct Patterns.ep_Q1_003, valid := Patterns.ep_Q1_003_valid }),
      (ShadowBank.endpointRowsQ1.get (Fin.mk 4 (by decide)), { id := "ep_Q1_004", payload := .direct Patterns.ep_Q1_004, valid := Patterns.ep_Q1_004_valid }),
      (ShadowBank.endpointRowsQ1.get (Fin.mk 5 (by decide)), { id := "ep_Q1_005", payload := .direct Patterns.ep_Q1_005, valid := Patterns.ep_Q1_005_valid }),
      (ShadowBank.endpointRowsQ1.get (Fin.mk 6 (by decide)), { id := "ep_Q1_006", payload := .direct Patterns.ep_Q1_006, valid := Patterns.ep_Q1_006_valid }),
      (ShadowBank.endpointRowsQ1.get (Fin.mk 7 (by decide)), { id := "ep_Q1_007", payload := .direct Patterns.ep_Q1_007, valid := Patterns.ep_Q1_007_valid }),
      (ShadowBank.endpointRowsQ1.get (Fin.mk 8 (by decide)), { id := "ep_Q1_008", payload := .productSum Patterns.ep_Q1_008_blocks, valid := Patterns.ep_Q1_008_valid }),
      (ShadowBank.endpointRowsQ1.get (Fin.mk 9 (by decide)), { id := "ep_Q1_009", payload := .productSum Patterns.ep_Q1_009_blocks, valid := Patterns.ep_Q1_009_valid }),
      (ShadowBank.endpointRowsQ1.get (Fin.mk 10 (by decide)), { id := "ep_Q1_010", payload := .direct Patterns.ep_Q1_010, valid := Patterns.ep_Q1_010_valid }),
      (ShadowBank.endpointRowsQ1.get (Fin.mk 11 (by decide)), { id := "ep_Q1_011", payload := .direct Patterns.ep_Q1_011, valid := Patterns.ep_Q1_011_valid }),
      (ShadowBank.endpointRowsQ1.get (Fin.mk 12 (by decide)), { id := "ep_Q1_012", payload := .direct Patterns.ep_Q1_012, valid := Patterns.ep_Q1_012_valid }),
      (ShadowBank.endpointRowsQ1.get (Fin.mk 13 (by decide)), { id := "ep_Q1_013", payload := .direct Patterns.ep_Q1_013, valid := Patterns.ep_Q1_013_valid }),
      (ShadowBank.endpointRowsQ1.get (Fin.mk 14 (by decide)), { id := "ep_Q1_014", payload := .direct Patterns.ep_Q1_014, valid := Patterns.ep_Q1_014_valid }),
      (ShadowBank.endpointRowsQ1.get (Fin.mk 15 (by decide)), { id := "ep_Q1_015", payload := .direct Patterns.ep_Q1_015, valid := Patterns.ep_Q1_015_valid }),
      (ShadowBank.endpointRowsQ1.get (Fin.mk 16 (by decide)), { id := "ep_Q1_016", payload := .direct Patterns.ep_Q1_016, valid := Patterns.ep_Q1_016_valid }),
      (ShadowBank.endpointRowsQ1.get (Fin.mk 17 (by decide)), { id := "ep_Q1_017", payload := .direct Patterns.ep_Q1_017, valid := Patterns.ep_Q1_017_valid }),
      (ShadowBank.endpointRowsQ1.get (Fin.mk 18 (by decide)), { id := "ep_Q1_018", payload := .direct Patterns.ep_Q1_018, valid := Patterns.ep_Q1_018_valid }),
      (ShadowBank.endpointRowsQ1.get (Fin.mk 19 (by decide)), { id := "ep_Q1_019", payload := .direct Patterns.ep_Q1_019, valid := Patterns.ep_Q1_019_valid }),
      (ShadowBank.endpointRowsQ1.get (Fin.mk 20 (by decide)), { id := "ep_Q1_020", payload := .direct Patterns.ep_Q1_020, valid := Patterns.ep_Q1_020_valid }),
      (ShadowBank.endpointRowsQ1.get (Fin.mk 21 (by decide)), { id := "ep_Q1_021", payload := .direct Patterns.ep_Q1_021, valid := Patterns.ep_Q1_021_valid }),
      (ShadowBank.endpointRowsQ1.get (Fin.mk 22 (by decide)), { id := "ep_Q1_022", payload := .direct Patterns.ep_Q1_022, valid := Patterns.ep_Q1_022_valid }),
      (ShadowBank.endpointRowsQ1.get (Fin.mk 23 (by decide)), { id := "ep_Q1_023", payload := .direct Patterns.ep_Q1_023, valid := Patterns.ep_Q1_023_valid }),
      (ShadowBank.endpointRowsQ1.get (Fin.mk 24 (by decide)), { id := "ep_Q1_024", payload := .direct Patterns.ep_Q1_024, valid := Patterns.ep_Q1_024_valid }),
      (ShadowBank.endpointRowsQ1.get (Fin.mk 25 (by decide)), { id := "ep_Q1_025", payload := .direct Patterns.ep_Q1_025, valid := Patterns.ep_Q1_025_valid }),
      (ShadowBank.endpointRowsQ1.get (Fin.mk 26 (by decide)), { id := "ep_Q1_026", payload := .direct Patterns.ep_Q1_026, valid := Patterns.ep_Q1_026_valid }),
      (ShadowBank.endpointRowsQ1.get (Fin.mk 27 (by decide)), { id := "ep_Q1_027", payload := .direct Patterns.ep_Q1_027, valid := Patterns.ep_Q1_027_valid }),
      (ShadowBank.endpointRowsQ1.get (Fin.mk 28 (by decide)), { id := "ep_Q1_028", payload := .productSum Patterns.ep_Q1_028_blocks, valid := Patterns.ep_Q1_028_valid }),
      (ShadowBank.endpointRowsQ1.get (Fin.mk 29 (by decide)), { id := "ep_Q1_029", payload := .direct Patterns.ep_Q1_029, valid := Patterns.ep_Q1_029_valid }),
      (ShadowBank.endpointRowsQ1.get (Fin.mk 30 (by decide)), { id := "ep_Q1_030", payload := .direct Patterns.ep_Q1_030, valid := Patterns.ep_Q1_030_valid }),
      (ShadowBank.endpointRowsQ1.get (Fin.mk 31 (by decide)), { id := "ep_Q1_031", payload := .direct Patterns.ep_Q1_031, valid := Patterns.ep_Q1_031_valid }),
      (ShadowBank.endpointRowsQ1.get (Fin.mk 32 (by decide)), { id := "ep_Q1_032", payload := .direct Patterns.ep_Q1_032, valid := Patterns.ep_Q1_032_valid }),
      (ShadowBank.endpointRowsQ2.get (Fin.mk 0 (by decide)), { id := "ep_Q2_000", payload := .direct Patterns.ep_Q2_000, valid := Patterns.ep_Q2_000_valid }),
      (ShadowBank.endpointRowsQ2.get (Fin.mk 1 (by decide)), { id := "ep_Q2_001", payload := .direct Patterns.ep_Q2_001, valid := Patterns.ep_Q2_001_valid }),
      (ShadowBank.endpointRowsQ2.get (Fin.mk 2 (by decide)), { id := "ep_Q2_002", payload := .productSum Patterns.ep_Q2_002_blocks, valid := Patterns.ep_Q2_002_valid }),
      (ShadowBank.endpointRowsQ2.get (Fin.mk 3 (by decide)), { id := "ep_Q2_003", payload := .direct Patterns.ep_Q2_003, valid := Patterns.ep_Q2_003_valid }),
      (ShadowBank.endpointRowsQ2.get (Fin.mk 4 (by decide)), { id := "ep_Q2_004", payload := .direct Patterns.ep_Q2_004, valid := Patterns.ep_Q2_004_valid }),
      (ShadowBank.endpointRowsQ2.get (Fin.mk 5 (by decide)), { id := "ep_Q2_005", payload := .direct Patterns.ep_Q2_005, valid := Patterns.ep_Q2_005_valid }),
      (ShadowBank.endpointRowsQ2.get (Fin.mk 6 (by decide)), { id := "ep_Q2_006", payload := .direct Patterns.ep_Q2_006, valid := Patterns.ep_Q2_006_valid }),
      (ShadowBank.endpointRowsQ2.get (Fin.mk 7 (by decide)), { id := "ep_Q2_007", payload := .direct Patterns.ep_Q2_007, valid := Patterns.ep_Q2_007_valid }),
      (ShadowBank.endpointRowsQ2.get (Fin.mk 8 (by decide)), { id := "ep_Q2_008", payload := .productSum Patterns.ep_Q2_008_blocks, valid := Patterns.ep_Q2_008_valid }),
      (ShadowBank.endpointRowsQ2.get (Fin.mk 9 (by decide)), { id := "ep_Q2_009", payload := .direct Patterns.ep_Q2_009, valid := Patterns.ep_Q2_009_valid }),
      (ShadowBank.endpointRowsQ2.get (Fin.mk 10 (by decide)), { id := "ep_Q2_010", payload := .direct Patterns.ep_Q2_010, valid := Patterns.ep_Q2_010_valid }),
      (ShadowBank.endpointRowsQ2.get (Fin.mk 11 (by decide)), { id := "ep_Q2_011", payload := .direct Patterns.ep_Q2_011, valid := Patterns.ep_Q2_011_valid }),
      (ShadowBank.endpointRowsQ2.get (Fin.mk 12 (by decide)), { id := "ep_Q2_012", payload := .direct Patterns.ep_Q2_012, valid := Patterns.ep_Q2_012_valid }),
      (ShadowBank.endpointRowsQ2.get (Fin.mk 13 (by decide)), { id := "ep_Q2_013", payload := .direct Patterns.ep_Q2_013, valid := Patterns.ep_Q2_013_valid }),
      (ShadowBank.endpointRowsQ2.get (Fin.mk 14 (by decide)), { id := "ep_Q2_014", payload := .direct Patterns.ep_Q2_014, valid := Patterns.ep_Q2_014_valid }),
      (ShadowBank.endpointRowsQ2.get (Fin.mk 15 (by decide)), { id := "ep_Q2_015", payload := .direct Patterns.ep_Q2_015, valid := Patterns.ep_Q2_015_valid }),
      (ShadowBank.endpointRowsQ2.get (Fin.mk 16 (by decide)), { id := "ep_Q2_016", payload := .direct Patterns.ep_Q2_016, valid := Patterns.ep_Q2_016_valid }),
      (ShadowBank.endpointRowsQ2.get (Fin.mk 17 (by decide)), { id := "ep_Q2_017", payload := .direct Patterns.ep_Q2_017, valid := Patterns.ep_Q2_017_valid }),
      (ShadowBank.endpointRowsQ2.get (Fin.mk 18 (by decide)), { id := "ep_Q2_018", payload := .direct Patterns.ep_Q2_018, valid := Patterns.ep_Q2_018_valid }),
      (ShadowBank.endpointRowsQ2.get (Fin.mk 19 (by decide)), { id := "ep_Q2_019", payload := .productSum Patterns.ep_Q2_019_blocks, valid := Patterns.ep_Q2_019_valid }),
      (ShadowBank.endpointRowsQ2.get (Fin.mk 20 (by decide)), { id := "ep_Q2_020", payload := .productSum Patterns.ep_Q2_020_blocks, valid := Patterns.ep_Q2_020_valid }),
      (ShadowBank.endpointRowsQ2.get (Fin.mk 21 (by decide)), { id := "ep_Q2_021", payload := .direct Patterns.ep_Q2_021, valid := Patterns.ep_Q2_021_valid }),
      (ShadowBank.endpointRowsQ2.get (Fin.mk 22 (by decide)), { id := "ep_Q2_022", payload := .direct Patterns.ep_Q2_022, valid := Patterns.ep_Q2_022_valid }),
      (ShadowBank.endpointRowsQ2.get (Fin.mk 23 (by decide)), { id := "ep_Q2_023", payload := .direct Patterns.ep_Q2_023, valid := Patterns.ep_Q2_023_valid }),
      (ShadowBank.endpointRowsQ2.get (Fin.mk 24 (by decide)), { id := "ep_Q2_024", payload := .productSum Patterns.ep_Q2_024_blocks, valid := Patterns.ep_Q2_024_valid }),
      (ShadowBank.endpointRowsQ2.get (Fin.mk 25 (by decide)), { id := "ep_Q2_025", payload := .direct Patterns.ep_Q2_025, valid := Patterns.ep_Q2_025_valid }),
      (ShadowBank.endpointRowsQ2.get (Fin.mk 26 (by decide)), { id := "ep_Q2_026", payload := .direct Patterns.ep_Q2_026, valid := Patterns.ep_Q2_026_valid }),
      (ShadowBank.endpointRowsQ2.get (Fin.mk 27 (by decide)), { id := "ep_Q2_027", payload := .direct Patterns.ep_Q2_027, valid := Patterns.ep_Q2_027_valid }),
      (ShadowBank.endpointRowsQ2.get (Fin.mk 28 (by decide)), { id := "ep_Q2_028", payload := .direct Patterns.ep_Q2_028, valid := Patterns.ep_Q2_028_valid }),
      (ShadowBank.endpointRowsQ2.get (Fin.mk 29 (by decide)), { id := "ep_Q2_029", payload := .direct Patterns.ep_Q2_029, valid := Patterns.ep_Q2_029_valid }),
      (ShadowBank.endpointRowsQ2.get (Fin.mk 30 (by decide)), { id := "ep_Q2_030", payload := .direct Patterns.ep_Q2_030, valid := Patterns.ep_Q2_030_valid }),
      (ShadowBank.endpointRowsQ2.get (Fin.mk 31 (by decide)), { id := "ep_Q2_031", payload := .direct Patterns.ep_Q2_031, valid := Patterns.ep_Q2_031_valid }),
      (ShadowBank.endpointRowsQ2.get (Fin.mk 32 (by decide)), { id := "ep_Q2_032", payload := .direct Patterns.ep_Q2_032, valid := Patterns.ep_Q2_032_valid }),
      (ShadowBank.endpointRowsQ2.get (Fin.mk 33 (by decide)), { id := "ep_Q2_033", payload := .direct Patterns.ep_Q2_033, valid := Patterns.ep_Q2_033_valid }),
      (ShadowBank.endpointRowsQ2.get (Fin.mk 34 (by decide)), { id := "ep_Q2_034", payload := .direct Patterns.ep_Q2_034, valid := Patterns.ep_Q2_034_valid }),
      (ShadowBank.endpointRowsQ2.get (Fin.mk 35 (by decide)), { id := "ep_Q2_035", payload := .direct Patterns.ep_Q2_035, valid := Patterns.ep_Q2_035_valid }),
      (ShadowBank.endpointRowsQ2.get (Fin.mk 36 (by decide)), { id := "ep_Q2_036", payload := .direct Patterns.ep_Q2_036, valid := Patterns.ep_Q2_036_valid }),
      (ShadowBank.endpointRowsQ2.get (Fin.mk 37 (by decide)), { id := "ep_Q2_037", payload := .direct Patterns.ep_Q2_037, valid := Patterns.ep_Q2_037_valid }),
      (ShadowBank.endpointRowsQ2.get (Fin.mk 38 (by decide)), { id := "ep_Q2_038", payload := .direct Patterns.ep_Q2_038, valid := Patterns.ep_Q2_038_valid }),
      (ShadowBank.endpointRowsQ2.get (Fin.mk 39 (by decide)), { id := "ep_Q2_039", payload := .direct Patterns.ep_Q2_039, valid := Patterns.ep_Q2_039_valid }),
      (ShadowBank.endpointRowsQ2.get (Fin.mk 40 (by decide)), { id := "ep_Q2_040", payload := .direct Patterns.ep_Q2_040, valid := Patterns.ep_Q2_040_valid }),
      (ShadowBank.endpointRowsQ2.get (Fin.mk 41 (by decide)), { id := "ep_Q2_041", payload := .productSum Patterns.ep_Q2_041_blocks, valid := Patterns.ep_Q2_041_valid }),
      (ShadowBank.endpointRowsQ2.get (Fin.mk 42 (by decide)), { id := "ep_Q2_042", payload := .direct Patterns.ep_Q2_042, valid := Patterns.ep_Q2_042_valid }),
      (ShadowBank.endpointRowsQ2.get (Fin.mk 43 (by decide)), { id := "ep_Q2_043", payload := .direct Patterns.ep_Q2_043, valid := Patterns.ep_Q2_043_valid }),
      (ShadowBank.endpointRowsQ2.get (Fin.mk 44 (by decide)), { id := "ep_Q2_044", payload := .direct Patterns.ep_Q2_044, valid := Patterns.ep_Q2_044_valid }),
      (ShadowBank.endpointRowsQ2.get (Fin.mk 45 (by decide)), { id := "ep_Q2_045", payload := .direct Patterns.ep_Q2_045, valid := Patterns.ep_Q2_045_valid }),
      (ShadowBank.endpointRowsQ2.get (Fin.mk 46 (by decide)), { id := "ep_Q2_046", payload := .direct Patterns.ep_Q2_046, valid := Patterns.ep_Q2_046_valid }),
      (ShadowBank.endpointRowsQ2.get (Fin.mk 47 (by decide)), { id := "ep_Q2_047", payload := .direct Patterns.ep_Q2_047, valid := Patterns.ep_Q2_047_valid }),
      (ShadowBank.endpointRowsQ2.get (Fin.mk 48 (by decide)), { id := "ep_Q2_048", payload := .direct Patterns.ep_Q2_048, valid := Patterns.ep_Q2_048_valid }),
      (ShadowBank.endpointRowsQ2.get (Fin.mk 49 (by decide)), { id := "ep_Q2_049", payload := .direct Patterns.ep_Q2_049, valid := Patterns.ep_Q2_049_valid }),
      (ShadowBank.endpointRowsQ2.get (Fin.mk 50 (by decide)), { id := "ep_Q2_050", payload := .direct Patterns.ep_Q2_050, valid := Patterns.ep_Q2_050_valid }),
      (ShadowBank.endpointRowsQ2.get (Fin.mk 51 (by decide)), { id := "ep_Q2_051", payload := .direct Patterns.ep_Q2_051, valid := Patterns.ep_Q2_051_valid }),
      (ShadowBank.endpointRowsQ2.get (Fin.mk 52 (by decide)), { id := "ep_Q2_052", payload := .direct Patterns.ep_Q2_052, valid := Patterns.ep_Q2_052_valid }),
      (ShadowBank.endpointRowsQ2.get (Fin.mk 53 (by decide)), { id := "ep_Q2_053", payload := .direct Patterns.ep_Q2_053, valid := Patterns.ep_Q2_053_valid }),
      (ShadowBank.endpointRowsQ2.get (Fin.mk 54 (by decide)), { id := "ep_Q2_054", payload := .productSum Patterns.ep_Q2_054_blocks, valid := Patterns.ep_Q2_054_valid }),
      (ShadowBank.endpointRowsQ2.get (Fin.mk 55 (by decide)), { id := "ep_Q2_055", payload := .direct Patterns.ep_Q2_055, valid := Patterns.ep_Q2_055_valid }),
      (ShadowBank.endpointRowsQ2.get (Fin.mk 56 (by decide)), { id := "ep_Q2_056", payload := .direct Patterns.ep_Q2_056, valid := Patterns.ep_Q2_056_valid }),
      (ShadowBank.endpointRowsQ2.get (Fin.mk 57 (by decide)), { id := "ep_Q2_057", payload := .direct Patterns.ep_Q2_057, valid := Patterns.ep_Q2_057_valid }),
      (ShadowBank.endpointRowsQ2.get (Fin.mk 58 (by decide)), { id := "ep_Q2_058", payload := .direct Patterns.ep_Q2_058, valid := Patterns.ep_Q2_058_valid }),
      (ShadowBank.endpointRowsQ2.get (Fin.mk 59 (by decide)), { id := "ep_Q2_059", payload := .direct Patterns.ep_Q2_059, valid := Patterns.ep_Q2_059_valid }),
      (ShadowBank.endpointRowsQ2.get (Fin.mk 60 (by decide)), { id := "ep_Q2_060", payload := .direct Patterns.ep_Q2_060, valid := Patterns.ep_Q2_060_valid }),
      (ShadowBank.endpointRowsQ2.get (Fin.mk 61 (by decide)), { id := "ep_Q2_061", payload := .direct Patterns.ep_Q2_061, valid := Patterns.ep_Q2_061_valid }),
      (ShadowBank.endpointRowsQ2.get (Fin.mk 62 (by decide)), { id := "ep_Q2_062", payload := .direct Patterns.ep_Q2_062, valid := Patterns.ep_Q2_062_valid }),
      (ShadowBank.endpointRowsQ2.get (Fin.mk 63 (by decide)), { id := "ep_Q2_063", payload := .direct Patterns.ep_Q2_063, valid := Patterns.ep_Q2_063_valid }),
      (ShadowBank.endpointRowsQ2.get (Fin.mk 64 (by decide)), { id := "ep_Q2_064", payload := .productSum Patterns.ep_Q2_064_blocks, valid := Patterns.ep_Q2_064_valid }),
      (ShadowBank.endpointRowsQ2.get (Fin.mk 65 (by decide)), { id := "ep_Q2_065", payload := .direct Patterns.ep_Q2_065, valid := Patterns.ep_Q2_065_valid }),
      (ShadowBank.endpointRowsQ2.get (Fin.mk 66 (by decide)), { id := "ep_Q2_066", payload := .direct Patterns.ep_Q2_066, valid := Patterns.ep_Q2_066_valid }),
      (ShadowBank.endpointRowsQ2.get (Fin.mk 67 (by decide)), { id := "ep_Q2_067", payload := .direct Patterns.ep_Q2_067, valid := Patterns.ep_Q2_067_valid }),
      (ShadowBank.endpointRowsQ2.get (Fin.mk 68 (by decide)), { id := "ep_Q2_068", payload := .direct Patterns.ep_Q2_068, valid := Patterns.ep_Q2_068_valid }),
      (ShadowBank.endpointRowsQ2.get (Fin.mk 69 (by decide)), { id := "ep_Q2_069", payload := .direct Patterns.ep_Q2_069, valid := Patterns.ep_Q2_069_valid }),
      (ShadowBank.endpointRowsQ2.get (Fin.mk 70 (by decide)), { id := "ep_Q2_070", payload := .direct Patterns.ep_Q2_070, valid := Patterns.ep_Q2_070_valid }),
      (ShadowBank.endpointRowsQ2.get (Fin.mk 71 (by decide)), { id := "ep_Q2_071", payload := .direct Patterns.ep_Q2_071, valid := Patterns.ep_Q2_071_valid }),
      (ShadowBank.endpointRowsQ2.get (Fin.mk 72 (by decide)), { id := "ep_Q2_072", payload := .direct Patterns.ep_Q2_072, valid := Patterns.ep_Q2_072_valid }),
      (ShadowBank.endpointRowsQ2.get (Fin.mk 73 (by decide)), { id := "ep_Q2_073", payload := .direct Patterns.ep_Q2_073, valid := Patterns.ep_Q2_073_valid }),
      (ShadowBank.endpointRowsQ2.get (Fin.mk 74 (by decide)), { id := "ep_Q2_074", payload := .productSum Patterns.ep_Q2_074_blocks, valid := Patterns.ep_Q2_074_valid }),
      (ShadowBank.endpointRowsQ2.get (Fin.mk 75 (by decide)), { id := "ep_Q2_075", payload := .direct Patterns.ep_Q2_075, valid := Patterns.ep_Q2_075_valid }),
      (ShadowBank.endpointRowsQ2.get (Fin.mk 76 (by decide)), { id := "ep_Q2_076", payload := .direct Patterns.ep_Q2_076, valid := Patterns.ep_Q2_076_valid }),
      (ShadowBank.endpointRowsQ2.get (Fin.mk 77 (by decide)), { id := "ep_Q2_077", payload := .direct Patterns.ep_Q2_077, valid := Patterns.ep_Q2_077_valid }),
      (ShadowBank.endpointRowsQ2.get (Fin.mk 78 (by decide)), { id := "ep_Q2_078", payload := .direct Patterns.ep_Q2_078, valid := Patterns.ep_Q2_078_valid }),
      (ShadowBank.endpointRowsQ2.get (Fin.mk 79 (by decide)), { id := "ep_Q2_079", payload := .direct Patterns.ep_Q2_079, valid := Patterns.ep_Q2_079_valid }),
      (ShadowBank.endpointRowsQ2.get (Fin.mk 80 (by decide)), { id := "ep_Q2_080", payload := .direct Patterns.ep_Q2_080, valid := Patterns.ep_Q2_080_valid }),
      (ShadowBank.endpointRowsQ2.get (Fin.mk 81 (by decide)), { id := "ep_Q2_081", payload := .direct Patterns.ep_Q2_081, valid := Patterns.ep_Q2_081_valid }),
      (ShadowBank.endpointRowsQ2.get (Fin.mk 82 (by decide)), { id := "ep_Q2_082", payload := .direct Patterns.ep_Q2_082, valid := Patterns.ep_Q2_082_valid }),
      (ShadowBank.endpointRowsQ2.get (Fin.mk 83 (by decide)), { id := "ep_Q2_083", payload := .direct Patterns.ep_Q2_083, valid := Patterns.ep_Q2_083_valid })
    ] at hrowCert
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ep_Q1_000_evaluationZeros_of_metricShadow
      (metricShadow_of_row_masks_eq hmetric hmasks)
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ep_Q1_001_evaluationZeros_of_metricShadow
      (metricShadow_of_row_masks_eq hmetric hmasks)
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ep_Q1_002_evaluationZeros_of_metricShadow
      (metricShadow_of_row_masks_eq hmetric hmasks)
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ep_Q1_003_evaluationZeros_of_metricShadow
      (metricShadow_of_row_masks_eq hmetric hmasks)
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ep_Q1_004_evaluationZeros_of_metricShadow
      (metricShadow_of_row_masks_eq hmetric hmasks)
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ep_Q1_005_evaluationZeros_of_metricShadow
      (metricShadow_of_row_masks_eq hmetric hmasks)
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ep_Q1_006_evaluationZeros_of_metricShadow
      (metricShadow_of_row_masks_eq hmetric hmasks)
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ep_Q1_007_evaluationZeros_of_metricShadow
      (metricShadow_of_row_masks_eq hmetric hmasks)
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ep_Q1_008_evaluationZeros_of_metricShadow
      (metricShadow_of_row_masks_eq hmetric hmasks)
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ep_Q1_009_evaluationZeros_of_metricShadow
      (metricShadow_of_row_masks_eq hmetric hmasks)
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ep_Q1_010_evaluationZeros_of_metricShadow
      (metricShadow_of_row_masks_eq hmetric hmasks)
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ep_Q1_011_evaluationZeros_of_metricShadow
      (metricShadow_of_row_masks_eq hmetric hmasks)
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ep_Q1_012_evaluationZeros_of_metricShadow
      (metricShadow_of_row_masks_eq hmetric hmasks)
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ep_Q1_013_evaluationZeros_of_metricShadow
      (metricShadow_of_row_masks_eq hmetric hmasks)
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ep_Q1_014_evaluationZeros_of_metricShadow
      (metricShadow_of_row_masks_eq hmetric hmasks)
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ep_Q1_015_evaluationZeros_of_metricShadow
      (metricShadow_of_row_masks_eq hmetric hmasks)
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ep_Q1_016_evaluationZeros_of_metricShadow
      (metricShadow_of_row_masks_eq hmetric hmasks)
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ep_Q1_017_evaluationZeros_of_metricShadow
      (metricShadow_of_row_masks_eq hmetric hmasks)
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ep_Q1_018_evaluationZeros_of_metricShadow
      (metricShadow_of_row_masks_eq hmetric hmasks)
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ep_Q1_019_evaluationZeros_of_metricShadow
      (metricShadow_of_row_masks_eq hmetric hmasks)
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ep_Q1_020_evaluationZeros_of_metricShadow
      (metricShadow_of_row_masks_eq hmetric hmasks)
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ep_Q1_021_evaluationZeros_of_metricShadow
      (metricShadow_of_row_masks_eq hmetric hmasks)
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ep_Q1_022_evaluationZeros_of_metricShadow
      (metricShadow_of_row_masks_eq hmetric hmasks)
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ep_Q1_023_evaluationZeros_of_metricShadow
      (metricShadow_of_row_masks_eq hmetric hmasks)
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ep_Q1_024_evaluationZeros_of_metricShadow
      (metricShadow_of_row_masks_eq hmetric hmasks)
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ep_Q1_025_evaluationZeros_of_metricShadow
      (metricShadow_of_row_masks_eq hmetric hmasks)
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ep_Q1_026_evaluationZeros_of_metricShadow
      (metricShadow_of_row_masks_eq hmetric hmasks)
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ep_Q1_027_evaluationZeros_of_metricShadow
      (metricShadow_of_row_masks_eq hmetric hmasks)
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ep_Q1_028_evaluationZeros_of_metricShadow
      (metricShadow_of_row_masks_eq hmetric hmasks)
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ep_Q1_029_evaluationZeros_of_metricShadow
      (metricShadow_of_row_masks_eq hmetric hmasks)
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ep_Q1_030_evaluationZeros_of_metricShadow
      (metricShadow_of_row_masks_eq hmetric hmasks)
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ep_Q1_031_evaluationZeros_of_metricShadow
      (metricShadow_of_row_masks_eq hmetric hmasks)
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ep_Q1_032_evaluationZeros_of_metricShadow
      (metricShadow_of_row_masks_eq hmetric hmasks)
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ep_Q2_000_evaluationZeros_of_metricShadow
      (metricShadow_of_row_masks_eq hmetric hmasks)
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ep_Q2_001_evaluationZeros_of_metricShadow
      (metricShadow_of_row_masks_eq hmetric hmasks)
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ep_Q2_002_evaluationZeros_of_metricShadow
      (metricShadow_of_row_masks_eq hmetric hmasks)
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ep_Q2_003_evaluationZeros_of_metricShadow
      (metricShadow_of_row_masks_eq hmetric hmasks)
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ep_Q2_004_evaluationZeros_of_metricShadow
      (metricShadow_of_row_masks_eq hmetric hmasks)
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ep_Q2_005_evaluationZeros_of_metricShadow
      (metricShadow_of_row_masks_eq hmetric hmasks)
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ep_Q2_006_evaluationZeros_of_metricShadow
      (metricShadow_of_row_masks_eq hmetric hmasks)
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ep_Q2_007_evaluationZeros_of_metricShadow
      (metricShadow_of_row_masks_eq hmetric hmasks)
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ep_Q2_008_evaluationZeros_of_metricShadow
      (metricShadow_of_row_masks_eq hmetric hmasks)
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ep_Q2_009_evaluationZeros_of_metricShadow
      (metricShadow_of_row_masks_eq hmetric hmasks)
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ep_Q2_010_evaluationZeros_of_metricShadow
      (metricShadow_of_row_masks_eq hmetric hmasks)
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ep_Q2_011_evaluationZeros_of_metricShadow
      (metricShadow_of_row_masks_eq hmetric hmasks)
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ep_Q2_012_evaluationZeros_of_metricShadow
      (metricShadow_of_row_masks_eq hmetric hmasks)
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ep_Q2_013_evaluationZeros_of_metricShadow
      (metricShadow_of_row_masks_eq hmetric hmasks)
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ep_Q2_014_evaluationZeros_of_metricShadow
      (metricShadow_of_row_masks_eq hmetric hmasks)
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ep_Q2_015_evaluationZeros_of_metricShadow
      (metricShadow_of_row_masks_eq hmetric hmasks)
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ep_Q2_016_evaluationZeros_of_metricShadow
      (metricShadow_of_row_masks_eq hmetric hmasks)
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ep_Q2_017_evaluationZeros_of_metricShadow
      (metricShadow_of_row_masks_eq hmetric hmasks)
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ep_Q2_018_evaluationZeros_of_metricShadow
      (metricShadow_of_row_masks_eq hmetric hmasks)
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ep_Q2_019_evaluationZeros_of_metricShadow
      (metricShadow_of_row_masks_eq hmetric hmasks)
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ep_Q2_020_evaluationZeros_of_metricShadow
      (metricShadow_of_row_masks_eq hmetric hmasks)
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ep_Q2_021_evaluationZeros_of_metricShadow
      (metricShadow_of_row_masks_eq hmetric hmasks)
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ep_Q2_022_evaluationZeros_of_metricShadow
      (metricShadow_of_row_masks_eq hmetric hmasks)
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ep_Q2_023_evaluationZeros_of_metricShadow
      (metricShadow_of_row_masks_eq hmetric hmasks)
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ep_Q2_024_evaluationZeros_of_metricShadow
      (metricShadow_of_row_masks_eq hmetric hmasks)
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ep_Q2_025_evaluationZeros_of_metricShadow
      (metricShadow_of_row_masks_eq hmetric hmasks)
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ep_Q2_026_evaluationZeros_of_metricShadow
      (metricShadow_of_row_masks_eq hmetric hmasks)
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ep_Q2_027_evaluationZeros_of_metricShadow
      (metricShadow_of_row_masks_eq hmetric hmasks)
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ep_Q2_028_evaluationZeros_of_metricShadow
      (metricShadow_of_row_masks_eq hmetric hmasks)
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ep_Q2_029_evaluationZeros_of_metricShadow
      (metricShadow_of_row_masks_eq hmetric hmasks)
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ep_Q2_030_evaluationZeros_of_metricShadow
      (metricShadow_of_row_masks_eq hmetric hmasks)
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ep_Q2_031_evaluationZeros_of_metricShadow
      (metricShadow_of_row_masks_eq hmetric hmasks)
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ep_Q2_032_evaluationZeros_of_metricShadow
      (metricShadow_of_row_masks_eq hmetric hmasks)
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ep_Q2_033_evaluationZeros_of_metricShadow
      (metricShadow_of_row_masks_eq hmetric hmasks)
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ep_Q2_034_evaluationZeros_of_metricShadow
      (metricShadow_of_row_masks_eq hmetric hmasks)
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ep_Q2_035_evaluationZeros_of_metricShadow
      (metricShadow_of_row_masks_eq hmetric hmasks)
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ep_Q2_036_evaluationZeros_of_metricShadow
      (metricShadow_of_row_masks_eq hmetric hmasks)
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ep_Q2_037_evaluationZeros_of_metricShadow
      (metricShadow_of_row_masks_eq hmetric hmasks)
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ep_Q2_038_evaluationZeros_of_metricShadow
      (metricShadow_of_row_masks_eq hmetric hmasks)
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ep_Q2_039_evaluationZeros_of_metricShadow
      (metricShadow_of_row_masks_eq hmetric hmasks)
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ep_Q2_040_evaluationZeros_of_metricShadow
      (metricShadow_of_row_masks_eq hmetric hmasks)
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ep_Q2_041_evaluationZeros_of_metricShadow
      (metricShadow_of_row_masks_eq hmetric hmasks)
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ep_Q2_042_evaluationZeros_of_metricShadow
      (metricShadow_of_row_masks_eq hmetric hmasks)
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ep_Q2_043_evaluationZeros_of_metricShadow
      (metricShadow_of_row_masks_eq hmetric hmasks)
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ep_Q2_044_evaluationZeros_of_metricShadow
      (metricShadow_of_row_masks_eq hmetric hmasks)
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ep_Q2_045_evaluationZeros_of_metricShadow
      (metricShadow_of_row_masks_eq hmetric hmasks)
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ep_Q2_046_evaluationZeros_of_metricShadow
      (metricShadow_of_row_masks_eq hmetric hmasks)
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ep_Q2_047_evaluationZeros_of_metricShadow
      (metricShadow_of_row_masks_eq hmetric hmasks)
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ep_Q2_048_evaluationZeros_of_metricShadow
      (metricShadow_of_row_masks_eq hmetric hmasks)
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ep_Q2_049_evaluationZeros_of_metricShadow
      (metricShadow_of_row_masks_eq hmetric hmasks)
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ep_Q2_050_evaluationZeros_of_metricShadow
      (metricShadow_of_row_masks_eq hmetric hmasks)
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ep_Q2_051_evaluationZeros_of_metricShadow
      (metricShadow_of_row_masks_eq hmetric hmasks)
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ep_Q2_052_evaluationZeros_of_metricShadow
      (metricShadow_of_row_masks_eq hmetric hmasks)
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ep_Q2_053_evaluationZeros_of_metricShadow
      (metricShadow_of_row_masks_eq hmetric hmasks)
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ep_Q2_054_evaluationZeros_of_metricShadow
      (metricShadow_of_row_masks_eq hmetric hmasks)
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ep_Q2_055_evaluationZeros_of_metricShadow
      (metricShadow_of_row_masks_eq hmetric hmasks)
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ep_Q2_056_evaluationZeros_of_metricShadow
      (metricShadow_of_row_masks_eq hmetric hmasks)
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ep_Q2_057_evaluationZeros_of_metricShadow
      (metricShadow_of_row_masks_eq hmetric hmasks)
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ep_Q2_058_evaluationZeros_of_metricShadow
      (metricShadow_of_row_masks_eq hmetric hmasks)
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ep_Q2_059_evaluationZeros_of_metricShadow
      (metricShadow_of_row_masks_eq hmetric hmasks)
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ep_Q2_060_evaluationZeros_of_metricShadow
      (metricShadow_of_row_masks_eq hmetric hmasks)
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ep_Q2_061_evaluationZeros_of_metricShadow
      (metricShadow_of_row_masks_eq hmetric hmasks)
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ep_Q2_062_evaluationZeros_of_metricShadow
      (metricShadow_of_row_masks_eq hmetric hmasks)
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ep_Q2_063_evaluationZeros_of_metricShadow
      (metricShadow_of_row_masks_eq hmetric hmasks)
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ep_Q2_064_evaluationZeros_of_metricShadow
      (metricShadow_of_row_masks_eq hmetric hmasks)
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ep_Q2_065_evaluationZeros_of_metricShadow
      (metricShadow_of_row_masks_eq hmetric hmasks)
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ep_Q2_066_evaluationZeros_of_metricShadow
      (metricShadow_of_row_masks_eq hmetric hmasks)
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ep_Q2_067_evaluationZeros_of_metricShadow
      (metricShadow_of_row_masks_eq hmetric hmasks)
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ep_Q2_068_evaluationZeros_of_metricShadow
      (metricShadow_of_row_masks_eq hmetric hmasks)
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ep_Q2_069_evaluationZeros_of_metricShadow
      (metricShadow_of_row_masks_eq hmetric hmasks)
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ep_Q2_070_evaluationZeros_of_metricShadow
      (metricShadow_of_row_masks_eq hmetric hmasks)
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ep_Q2_071_evaluationZeros_of_metricShadow
      (metricShadow_of_row_masks_eq hmetric hmasks)
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ep_Q2_072_evaluationZeros_of_metricShadow
      (metricShadow_of_row_masks_eq hmetric hmasks)
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ep_Q2_073_evaluationZeros_of_metricShadow
      (metricShadow_of_row_masks_eq hmetric hmasks)
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ep_Q2_074_evaluationZeros_of_metricShadow
      (metricShadow_of_row_masks_eq hmetric hmasks)
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ep_Q2_075_evaluationZeros_of_metricShadow
      (metricShadow_of_row_masks_eq hmetric hmasks)
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ep_Q2_076_evaluationZeros_of_metricShadow
      (metricShadow_of_row_masks_eq hmetric hmasks)
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ep_Q2_077_evaluationZeros_of_metricShadow
      (metricShadow_of_row_masks_eq hmetric hmasks)
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ep_Q2_078_evaluationZeros_of_metricShadow
      (metricShadow_of_row_masks_eq hmetric hmasks)
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ep_Q2_079_evaluationZeros_of_metricShadow
      (metricShadow_of_row_masks_eq hmetric hmasks)
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ep_Q2_080_evaluationZeros_of_metricShadow
      (metricShadow_of_row_masks_eq hmetric hmasks)
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ep_Q2_081_evaluationZeros_of_metricShadow
      (metricShadow_of_row_masks_eq hmetric hmasks)
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ep_Q2_082_evaluationZeros_of_metricShadow
      (metricShadow_of_row_masks_eq hmetric hmasks)
  rcases List.mem_cons.mp hrowCert with rfl | hrowCert
  · exact ep_Q2_083_evaluationZeros_of_metricShadow
      (metricShadow_of_row_masks_eq hmetric hmasks)
  cases hrowCert

/-- The same generated row-zero dispatch exposed through the coefficient-aware
payload condition. -/
theorem weighted_payload_zeros_of_certifiedEndpointRow
    {pointOf : ShadowBank.Label → ℝ²}
    {shadow : ShadowBank.Shadow}
    (hmetric : EndpointMetricShadow pointOf shadow)
    (rowCert : Bank.Row × Bank.Certificate)
    (hrowCert : rowCert ∈ Bank.certifiedEndpointRows)
    (hmasks : rowCert.1.masks = shadow.masks) :
    rowCert.2.payload.weightedEvaluationZeros
      (endpointS1S3Assignment pointOf) := by
  exact rowCert.2.payload.weightedEvaluationZeros_of_evaluationZeros
    (payload_zeros_of_certifiedEndpointRow hmetric rowCert hrowCert hmasks)

/-- Endpoint row-bank membership contradicts a metric interpretation of the
matched finite shadow. -/
theorem false_of_endpointShadowInBank_of_metricShadow
    {pointOf : ShadowBank.Label → ℝ²}
    {escapee : ShadowBank.Label} {shadow : ShadowBank.Shadow}
    (hin : ShadowBank.endpointShadowInBank escapee shadow = true)
    (hmetric : EndpointMetricShadow pointOf shadow) :
    False := by
  exact Bank.false_of_endpointShadowInBank_of_payload_zeros
    (endpointS1S3Assignment pointOf) hin
    (fun rowCert hrowCert _hescapee hmasks =>
      payload_zeros_of_certifiedEndpointRow hmetric rowCert hrowCert hmasks)

/-- Weighted endpoint row-bank soundness.  This theorem currently reuses the
generated full row-zero lemmas; it is the call-site that can later consume
coefficient-support-minimized row proofs. -/
theorem false_of_endpointShadowInBank_of_weighted_metricShadow
    {pointOf : ShadowBank.Label → ℝ²}
    {escapee : ShadowBank.Label} {shadow : ShadowBank.Shadow}
    (hin : ShadowBank.endpointShadowInBank escapee shadow = true)
    (hmetric : EndpointMetricShadow pointOf shadow) :
    False := by
  exact Bank.false_of_endpointShadowInBank_of_weighted_payload_zeros
    (endpointS1S3Assignment pointOf) hin
    (fun rowCert hrowCert _hescapee hmasks =>
      weighted_payload_zeros_of_certifiedEndpointRow hmetric rowCert
        hrowCert hmasks)

end Variables

end EndpointCertificate

end Problem97
