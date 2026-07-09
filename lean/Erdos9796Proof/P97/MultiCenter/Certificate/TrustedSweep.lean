/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.MultiCenter.Certificate.Sweep
import Erdos9796Proof.P97.MultiCenter.Certificate.ProfileInventory
import Erdos9796Proof.P97.MultiCenter.Certificate.ClassInventory

/-!
# Multi-center trusted sweep semantics certificate

This generated module records the summary of the stdlib-only trusted checker
`scripts/multi-center-trusted-sweep-check.py`.  The checker independently
parses the sweep artifacts and validates raw class-key local semantics,
profile summaries, artifact summaries, and project-level terminal inventory
agreement.

The Lean layer certifies the finite checker report and its agreement with the
generated sweep/profile/class certificate banks.  It does not prove the DFS
implementation complete.
-/

namespace Problem97
namespace MultiCenter
namespace Certificate
namespace TrustedSweep

structure TrustedReport where
  artifactCount : Nat
  artifactNRows : Nat
  rawProfileRows : Nat
  rawClassCells : Nat
  selectedProfileRows : Nat
  selectedClassCells : Nat
  distinctClassKeys : Nat
  terminalN : Nat
  terminalClassKeys : Nat
  errorCount : Nat
  classKeySemanticErrors : Nat
  artifactMetadataErrors : Nat
  profileMetadataErrors : Nat
  projectConsistencyErrors : Nat
  fullInventorySha256 : String
  terminalInventorySha256 : String
  deriving Repr, DecidableEq

/-- Summary emitted by schema `multi_center_l2_trusted_sweep_semantics.v1`. -/
def report : TrustedReport where
  artifactCount := 11
  artifactNRows := 22
  rawProfileRows := 491
  rawClassCells := 978675
  selectedProfileRows := 489
  selectedClassCells := 977975
  distinctClassKeys := 3375
  terminalN := 32
  terminalClassKeys := 3375
  errorCount := 0
  classKeySemanticErrors := 0
  artifactMetadataErrors := 0
  profileMetadataErrors := 0
  projectConsistencyErrors := 0
  fullInventorySha256 := "888df36a194fd54a1a81adde336c50be295fcfa507b981b4c1f0286d196bcb40"
  terminalInventorySha256 := "888df36a194fd54a1a81adde336c50be295fcfa507b981b4c1f0286d196bcb40"

def loadedNs : List Nat :=
  [12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32]

def firstSeenCounts : List (Nat × Nat) :=
  [
    (12, 619),
    (13, 531),
    (14, 609),
    (15, 574),
    (16, 280),
    (17, 322),
    (18, 247),
    (19, 31),
    (20, 78),
    (21, 69),
    (22, 0),
    (23, 9),
    (24, 6),
    (25, 0),
    (26, 0),
    (27, 0),
    (28, 0),
    (29, 0),
    (30, 0),
    (31, 0),
    (32, 0)
  ]

def reportErrorFree : Bool :=
  report.errorCount == 0

def classKeySemanticsOK : Bool :=
  report.classKeySemanticErrors == 0

def rawMetadataOK : Bool :=
  report.artifactMetadataErrors == 0 &&
    report.profileMetadataErrors == 0 &&
      report.projectConsistencyErrors == 0

def agreesWithCertificateBanks : Bool :=
  loadedNs.length ==
      Problem97.MultiCenter.Certificate.Sweep.rows.length &&
    report.selectedProfileRows ==
      Problem97.MultiCenter.Certificate.ProfileInventory.rows.length &&
    report.distinctClassKeys ==
      Problem97.MultiCenter.Certificate.ClassInventory.rows.length &&
    report.terminalClassKeys ==
      Problem97.MultiCenter.Certificate.ClassInventory.terminalClassCount

def terminalDigestEqualsFullDigest : Bool :=
  report.terminalInventorySha256 == report.fullInventorySha256

/-- The trusted checker found no errors. -/
theorem report_errorFree : reportErrorFree = true := by
  native_decide

/-- The trusted checker accepted every raw class key semantically. -/
theorem classKeySemantics_ok : classKeySemanticsOK = true := by
  native_decide

/-- The trusted checker recomputed profile, artifact, and project metadata. -/
theorem rawMetadata_ok : rawMetadataOK = true := by
  native_decide

/-- The trusted checker summary agrees with the generated certificate banks. -/
theorem agreesWithCertificateBanks_eq : agreesWithCertificateBanks = true := by
  native_decide

/-- The terminal inventory has the same digest as the full loaded inventory. -/
theorem terminalDigestEqualsFullDigest_eq :
    terminalDigestEqualsFullDigest = true := by
  native_decide

/-- The trusted checker uses the same loaded `n` values as the sweep bank. -/
theorem loadedNs_eq_sweepRows :
    loadedNs =
      Problem97.MultiCenter.Certificate.Sweep.rows.map
        Problem97.MultiCenter.Certificate.Sweep.SweepRow.n := by
  native_decide

/-- The trusted checker recovered the same first-seen distribution. -/
theorem firstSeenCounts_eq_classInventory :
    firstSeenCounts =
      Problem97.MultiCenter.Certificate.ClassInventory.firstSeenCounts := by
  native_decide

end TrustedSweep
end Certificate
end MultiCenter
end Problem97
