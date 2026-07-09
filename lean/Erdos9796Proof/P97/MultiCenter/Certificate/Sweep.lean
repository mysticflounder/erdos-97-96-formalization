/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Lean

/-!
# Multi-center sweep certificate bank

This generated module records finite metadata from the L2 multi-center sweep
artifacts.  The rows are recomputed from class keys across overlapping sweep
files by `scripts/multi-center-sweep-certificate.py`.

The theorems below certify only the imported finite metadata: no loaded row has
an UNSAT or INDETERMINATE cell, every loaded row has the same distinct LOCAL and
SAT class-key count, and no SAT class disappears between consecutive loaded
rows.  They do not certify the Python search implementation or the geometric
soundness of the class-key encoding.
-/

namespace Problem97
namespace MultiCenter
namespace Certificate
namespace Sweep

/-- Recomputed project-level inventory for one loaded `n` row. -/
structure SweepRow where
  n : Nat
  profileCount : Nat
  localDistinct : Nat
  satDistinct : Nat
  localInventorySha256 : String
  satInventorySha256 : String
  unsatCells : Nat
  indeterminateCells : Nat
  testedCells : Nat
  totalNodes : Nat
  fresh : Nat
  newVsPrevious : Nat
  missingPrevious : Nat
  stableFromPrevious : Bool
  sourceArtifactCount : Nat
  deriving Repr, DecidableEq

namespace SweepRow

/-- The row has no UNSAT or INDETERMINATE sweep cells. -/
def noBadStatus (row : SweepRow) : Bool :=
  row.unsatCells == 0 && row.indeterminateCells == 0

/-- The row's distinct LOCAL inventory is fully SAT at the class-key level. -/
def localEqualsSat (row : SweepRow) : Bool :=
  row.localDistinct == row.satDistinct

/-- The row's LOCAL and SAT class-key inventory digests match. -/
def localDigestEqualsSat (row : SweepRow) : Bool :=
  row.localInventorySha256 == row.satInventorySha256

/-- No SAT class from the previous loaded row is missing at this row. -/
def noMissingPrevious (row : SweepRow) : Bool :=
  row.missingPrevious == 0

/-- The row-level metadata facts exported by this certificate. -/
def metadataOK (row : SweepRow) : Bool :=
  ((row.noBadStatus && row.localEqualsSat) && row.localDigestEqualsSat) &&
    row.noMissingPrevious

end SweepRow

/-- Generated rows from schema `multi_center_l2_sweep_inventory_certificate.v1`. -/
def rows : List SweepRow :=
[
  { n := 12
    profileCount := 2
    localDistinct := 619
    satDistinct := 619
    localInventorySha256 := "1dd43ce87e05244af3c8fcc45275f349f43c1f4e85f90c67484fa60cae9dc0cc"
    satInventorySha256 := "1dd43ce87e05244af3c8fcc45275f349f43c1f4e85f90c67484fa60cae9dc0cc"
    unsatCells := 0
    indeterminateCells := 0
    testedCells := 700
    totalNodes := 397993
    fresh := 619
    newVsPrevious := 619
    missingPrevious := 0
    stableFromPrevious := false
    sourceArtifactCount := 2 },
  { n := 13
    profileCount := 3
    localDistinct := 1150
    satDistinct := 1150
    localInventorySha256 := "2a691308c0fc500286a7012cb16892f346e87f1f049e944ce5e149354353b693"
    satInventorySha256 := "2a691308c0fc500286a7012cb16892f346e87f1f049e944ce5e149354353b693"
    unsatCells := 0
    indeterminateCells := 0
    testedCells := 1736
    totalNodes := 1549535
    fresh := 531
    newVsPrevious := 531
    missingPrevious := 0
    stableFromPrevious := false
    sourceArtifactCount := 1 },
  { n := 14
    profileCount := 4
    localDistinct := 1759
    satDistinct := 1759
    localInventorySha256 := "ffb2c15f36e3b275dc4a33794ad23f8965e248ec9d766e2f4c032d6f2a00e610"
    satInventorySha256 := "ffb2c15f36e3b275dc4a33794ad23f8965e248ec9d766e2f4c032d6f2a00e610"
    unsatCells := 0
    indeterminateCells := 0
    testedCells := 3311
    totalNodes := 4570307
    fresh := 609
    newVsPrevious := 609
    missingPrevious := 0
    stableFromPrevious := false
    sourceArtifactCount := 1 },
  { n := 15
    profileCount := 6
    localDistinct := 2333
    satDistinct := 2333
    localInventorySha256 := "61429689d60970aae23b7ab0958f5dc42c32d1206f67c8c4e3cc18b4aa6367ca"
    satInventorySha256 := "61429689d60970aae23b7ab0958f5dc42c32d1206f67c8c4e3cc18b4aa6367ca"
    unsatCells := 0
    indeterminateCells := 0
    testedCells := 5476
    totalNodes := 11048054
    fresh := 574
    newVsPrevious := 574
    missingPrevious := 0
    stableFromPrevious := false
    sourceArtifactCount := 1 },
  { n := 16
    profileCount := 7
    localDistinct := 2613
    satDistinct := 2613
    localInventorySha256 := "7134324d7d59a077ce972a5bf86460b69e58a4708c0826947a2a236d02888b93"
    satInventorySha256 := "7134324d7d59a077ce972a5bf86460b69e58a4708c0826947a2a236d02888b93"
    unsatCells := 0
    indeterminateCells := 0
    testedCells := 8171
    totalNodes := 24381275
    fresh := 280
    newVsPrevious := 280
    missingPrevious := 0
    stableFromPrevious := false
    sourceArtifactCount := 1 },
  { n := 17
    profileCount := 9
    localDistinct := 2935
    satDistinct := 2935
    localInventorySha256 := "3226b812c949b3a614d38b66d38719f83763522c92f47c1534247d4a1866fce8"
    satInventorySha256 := "3226b812c949b3a614d38b66d38719f83763522c92f47c1534247d4a1866fce8"
    unsatCells := 0
    indeterminateCells := 0
    testedCells := 11456
    totalNodes := 48257057
    fresh := 322
    newVsPrevious := 322
    missingPrevious := 0
    stableFromPrevious := false
    sourceArtifactCount := 1 },
  { n := 18
    profileCount := 11
    localDistinct := 3182
    satDistinct := 3182
    localInventorySha256 := "e7aa258571c5f5bbb82da3d0c192d0e64caa7806052ccf7dd3b83f6b7f416475"
    satInventorySha256 := "e7aa258571c5f5bbb82da3d0c192d0e64caa7806052ccf7dd3b83f6b7f416475"
    unsatCells := 0
    indeterminateCells := 0
    testedCells := 15286
    totalNodes := 86998269
    fresh := 247
    newVsPrevious := 247
    missingPrevious := 0
    stableFromPrevious := false
    sourceArtifactCount := 1 },
  { n := 19
    profileCount := 13
    localDistinct := 3213
    satDistinct := 3213
    localInventorySha256 := "91189109266969324cf7e5dc001c91981763db63f4a31a8e79c51d3b500f39fc"
    satInventorySha256 := "91189109266969324cf7e5dc001c91981763db63f4a31a8e79c51d3b500f39fc"
    unsatCells := 0
    indeterminateCells := 0
    testedCells := 19691
    totalNodes := 143385137
    fresh := 31
    newVsPrevious := 31
    missingPrevious := 0
    stableFromPrevious := false
    sourceArtifactCount := 1 },
  { n := 20
    profileCount := 15
    localDistinct := 3291
    satDistinct := 3291
    localInventorySha256 := "e90e3300d2a9e5e87c3e1f6fd74e57f6b4e2f32d54b815784b9bd2fe631e360f"
    satInventorySha256 := "e90e3300d2a9e5e87c3e1f6fd74e57f6b4e2f32d54b815784b9bd2fe631e360f"
    unsatCells := 0
    indeterminateCells := 0
    testedCells := 24641
    totalNodes := 236386113
    fresh := 78
    newVsPrevious := 78
    missingPrevious := 0
    stableFromPrevious := false
    sourceArtifactCount := 1 },
  { n := 21
    profileCount := 18
    localDistinct := 3360
    satDistinct := 3360
    localInventorySha256 := "3c523271607e9ef68df8c2c2a7e5b3286bf33b8dbbbea8bfcc11d7e3e3287e46"
    satInventorySha256 := "3c523271607e9ef68df8c2c2a7e5b3286bf33b8dbbbea8bfcc11d7e3e3287e46"
    unsatCells := 0
    indeterminateCells := 0
    testedCells := 30181
    totalNodes := 375445745
    fresh := 69
    newVsPrevious := 69
    missingPrevious := 0
    stableFromPrevious := false
    sourceArtifactCount := 1 },
  { n := 22
    profileCount := 20
    localDistinct := 3360
    satDistinct := 3360
    localInventorySha256 := "3c523271607e9ef68df8c2c2a7e5b3286bf33b8dbbbea8bfcc11d7e3e3287e46"
    satInventorySha256 := "3c523271607e9ef68df8c2c2a7e5b3286bf33b8dbbbea8bfcc11d7e3e3287e46"
    unsatCells := 0
    indeterminateCells := 0
    testedCells := 36251
    totalNodes := 574883663
    fresh := 0
    newVsPrevious := 0
    missingPrevious := 0
    stableFromPrevious := true
    sourceArtifactCount := 1 },
  { n := 23
    profileCount := 23
    localDistinct := 3369
    satDistinct := 3369
    localInventorySha256 := "fde4d097d2d77d0b2b6972d9d6453917bf6d5d32b8326c1ae8943f2dc0e30765"
    satInventorySha256 := "fde4d097d2d77d0b2b6972d9d6453917bf6d5d32b8326c1ae8943f2dc0e30765"
    unsatCells := 0
    indeterminateCells := 0
    testedCells := 42911
    totalNodes := 855806285
    fresh := 9
    newVsPrevious := 9
    missingPrevious := 0
    stableFromPrevious := false
    sourceArtifactCount := 1 },
  { n := 24
    profileCount := 26
    localDistinct := 3375
    satDistinct := 3375
    localInventorySha256 := "888df36a194fd54a1a81adde336c50be295fcfa507b981b4c1f0286d196bcb40"
    satInventorySha256 := "888df36a194fd54a1a81adde336c50be295fcfa507b981b4c1f0286d196bcb40"
    unsatCells := 0
    indeterminateCells := 0
    testedCells := 50116
    totalNodes := 1232474553
    fresh := 6
    newVsPrevious := 6
    missingPrevious := 0
    stableFromPrevious := false
    sourceArtifactCount := 1 },
  { n := 25
    profileCount := 29
    localDistinct := 3375
    satDistinct := 3375
    localInventorySha256 := "888df36a194fd54a1a81adde336c50be295fcfa507b981b4c1f0286d196bcb40"
    satInventorySha256 := "888df36a194fd54a1a81adde336c50be295fcfa507b981b4c1f0286d196bcb40"
    unsatCells := 0
    indeterminateCells := 0
    testedCells := 57896
    totalNodes := 1690868064
    fresh := 0
    newVsPrevious := 0
    missingPrevious := 0
    stableFromPrevious := true
    sourceArtifactCount := 1 },
  { n := 26
    profileCount := 32
    localDistinct := 3375
    satDistinct := 3375
    localInventorySha256 := "888df36a194fd54a1a81adde336c50be295fcfa507b981b4c1f0286d196bcb40"
    satInventorySha256 := "888df36a194fd54a1a81adde336c50be295fcfa507b981b4c1f0286d196bcb40"
    unsatCells := 0
    indeterminateCells := 0
    testedCells := 66221
    totalNodes := 2356657465
    fresh := 0
    newVsPrevious := 0
    missingPrevious := 0
    stableFromPrevious := true
    sourceArtifactCount := 1 },
  { n := 27
    profileCount := 36
    localDistinct := 3375
    satDistinct := 3375
    localInventorySha256 := "888df36a194fd54a1a81adde336c50be295fcfa507b981b4c1f0286d196bcb40"
    satInventorySha256 := "888df36a194fd54a1a81adde336c50be295fcfa507b981b4c1f0286d196bcb40"
    unsatCells := 0
    indeterminateCells := 0
    testedCells := 75136
    totalNodes := 3244409704
    fresh := 0
    newVsPrevious := 0
    missingPrevious := 0
    stableFromPrevious := true
    sourceArtifactCount := 1 },
  { n := 28
    profileCount := 39
    localDistinct := 3375
    satDistinct := 3375
    localInventorySha256 := "888df36a194fd54a1a81adde336c50be295fcfa507b981b4c1f0286d196bcb40"
    satInventorySha256 := "888df36a194fd54a1a81adde336c50be295fcfa507b981b4c1f0286d196bcb40"
    unsatCells := 0
    indeterminateCells := 0
    testedCells := 84581
    totalNodes := 4355073653
    fresh := 0
    newVsPrevious := 0
    missingPrevious := 0
    stableFromPrevious := true
    sourceArtifactCount := 1 },
  { n := 29
    profileCount := 43
    localDistinct := 3375
    satDistinct := 3375
    localInventorySha256 := "888df36a194fd54a1a81adde336c50be295fcfa507b981b4c1f0286d196bcb40"
    satInventorySha256 := "888df36a194fd54a1a81adde336c50be295fcfa507b981b4c1f0286d196bcb40"
    unsatCells := 0
    indeterminateCells := 0
    testedCells := 94616
    totalNodes := 5795498263
    fresh := 0
    newVsPrevious := 0
    missingPrevious := 0
    stableFromPrevious := true
    sourceArtifactCount := 1 },
  { n := 30
    profileCount := 47
    localDistinct := 3375
    satDistinct := 3375
    localInventorySha256 := "888df36a194fd54a1a81adde336c50be295fcfa507b981b4c1f0286d196bcb40"
    satInventorySha256 := "888df36a194fd54a1a81adde336c50be295fcfa507b981b4c1f0286d196bcb40"
    unsatCells := 0
    indeterminateCells := 0
    testedCells := 105196
    totalNodes := 7555701066
    fresh := 0
    newVsPrevious := 0
    missingPrevious := 0
    stableFromPrevious := true
    sourceArtifactCount := 1 },
  { n := 31
    profileCount := 51
    localDistinct := 3375
    satDistinct := 3375
    localInventorySha256 := "888df36a194fd54a1a81adde336c50be295fcfa507b981b4c1f0286d196bcb40"
    satInventorySha256 := "888df36a194fd54a1a81adde336c50be295fcfa507b981b4c1f0286d196bcb40"
    unsatCells := 0
    indeterminateCells := 0
    testedCells := 116351
    totalNodes := 9524326062
    fresh := 0
    newVsPrevious := 0
    missingPrevious := 0
    stableFromPrevious := true
    sourceArtifactCount := 1 },
  { n := 32
    profileCount := 55
    localDistinct := 3375
    satDistinct := 3375
    localInventorySha256 := "888df36a194fd54a1a81adde336c50be295fcfa507b981b4c1f0286d196bcb40"
    satInventorySha256 := "888df36a194fd54a1a81adde336c50be295fcfa507b981b4c1f0286d196bcb40"
    unsatCells := 0
    indeterminateCells := 0
    testedCells := 128051
    totalNodes := 12234247376
    fresh := 0
    newVsPrevious := 0
    missingPrevious := 0
    stableFromPrevious := true
    sourceArtifactCount := 1 }
]

private theorem list_all_eq_true_of_mem
    {α : Type _} {p : α → Bool} {a : α} :
    ∀ {items : List α}, items.all p = true → a ∈ items → p a = true
  | [], _hall, hmem => by
      cases hmem
  | head :: tail, hall, hmem => by
      simp only [List.all_cons, Bool.and_eq_true] at hall
      simp only [List.mem_cons] at hmem
      rcases hmem with rfl | htail
      · exact hall.1
      · exact list_all_eq_true_of_mem hall.2 htail

def allRowsMetadataOK : Bool :=
  rows.all SweepRow.metadataOK

def rowsHaveSources : Bool :=
  rows.all (fun row => decide (0 < row.sourceArtifactCount))

def stableFromPreviousNs : List Nat :=
  (rows.filter (fun row => row.stableFromPrevious)).map SweepRow.n

/-- The loaded sweep rows cover exactly the generated `n` values. -/
theorem rows_nValues :
    rows.map SweepRow.n = [12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32] := by
  native_decide

/-- Every generated row satisfies the exported finite metadata checks. -/
theorem allRows_metadataOK : allRowsMetadataOK = true := by
  native_decide

/-- Every generated row is backed by at least one source artifact. -/
theorem rows_haveSources : rowsHaveSources = true := by
  native_decide

/-- Loaded rows whose exact SAT inventory is unchanged from the previous row. -/
theorem stableFromPreviousNs_eq :
    stableFromPreviousNs = [22, 25, 26, 27, 28, 29, 30, 31, 32] := by
  native_decide

/-- Membership in the generated bank implies the row metadata check. -/
theorem metadataOK_of_mem_rows {row : SweepRow} (hrow : row ∈ rows) :
    row.metadataOK = true :=
  list_all_eq_true_of_mem allRows_metadataOK hrow

/-- Membership in the generated bank implies no bad status cells. -/
theorem noBadStatus_of_mem_rows {row : SweepRow} (hrow : row ∈ rows) :
    row.noBadStatus = true := by
  have hmetadata := metadataOK_of_mem_rows hrow
  simp only [SweepRow.metadataOK, Bool.and_eq_true] at hmetadata
  exact hmetadata.1.1.1

/-- Membership in the generated bank implies `LOCAL = SAT` at class-key level. -/
theorem localEqualsSat_of_mem_rows {row : SweepRow} (hrow : row ∈ rows) :
    row.localEqualsSat = true := by
  have hmetadata := metadataOK_of_mem_rows hrow
  simp only [SweepRow.metadataOK, Bool.and_eq_true] at hmetadata
  exact hmetadata.1.1.2

/-- Membership in the generated bank implies matching class-key inventory digests. -/
theorem localDigestEqualsSat_of_mem_rows {row : SweepRow} (hrow : row ∈ rows) :
    row.localDigestEqualsSat = true := by
  have hmetadata := metadataOK_of_mem_rows hrow
  simp only [SweepRow.metadataOK, Bool.and_eq_true] at hmetadata
  exact hmetadata.1.2

/-- Membership in the generated bank implies no previous SAT class is missing. -/
theorem noMissingPrevious_of_mem_rows {row : SweepRow} (hrow : row ∈ rows) :
    row.noMissingPrevious = true := by
  have hmetadata := metadataOK_of_mem_rows hrow
  simp only [SweepRow.metadataOK, Bool.and_eq_true] at hmetadata
  exact hmetadata.2

end Sweep
end Certificate
end MultiCenter
end Problem97
