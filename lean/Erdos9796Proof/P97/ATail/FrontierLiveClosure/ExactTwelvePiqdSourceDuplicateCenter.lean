/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveV14DuplicateCenterCanary

/-!
# Typed provenance for one exact-twelve PIQD source classifier

This generated module records one externally validated source classifier and
kernel-checks that its typed certificate is the pre-existing normalized-v14
`ExactTwelveV14DuplicateCenterCanary.record0`. The logical obstruction and its
conditional source consumers therefore predate this generated provenance map.

The SHA-256 strings below are provenance metadata, not kernel authentication
of the classifier JSON. This module proves no aggregate coverage, universal
lift, live-spine closure, or executed-byte provenance claim.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveSourceDuplicateCenter0000

open Census554.EqualityCore
open Problem97.ATailFrontierLiveClosure.GenericRowNogoodCertificate
open scoped EuclideanGeometry

/-- The finite label type of this local source record. -/
abbrev Label := Fin 12

/-- Canonical JSON hash of the validated source classifier. -/
def canonicalClassifierSha256 : String := "f183e53818371bcb4b060ed981301e67db0b51d9fc7ed9072571f05fefb30c91"
def modelSha256 : String := "1c9c7ef27850fa1c2d50d49b3fe886f24ce0d6aba7d74cbe9fdffcdeafd3557e"
def sourceJobSha256 : String := "8b597e1cc2092cdbf2c4b4dc06b5dc5e3ae9f57e21cf7107e14259c1e81d1191"
def discoveryCnfSha256 : String := "cfc268f2915ff31e1af24a66a036e41e81f93aca0967e88c1b4a4158eb67a379"
def sourceBundleSha256 : String := "51bf83555104a9045bdcdaf5b04c4980bc722fec7c149477fdbca84ca2a146b1"
def cubeSha256 : String := "ac75e36047af69bfa66959d5d6e706c48b77b4497bf3e83cd1ca8c30479a35dc"
def detectorContractSha256 : String := "6dcd58dfcb4dae2756882162e978e5763fb7e005d8c16ca5bf516f5446294968"
def certificateSha256 : String := "202acebee1d1d043f7c081ac042482a317aa1f603d8ea0f0f4465accd3683ca0"
def selectedPositiveVariablesSha256 : String := "e9b440646e2443a6924905fe6cc8eea5eebfbf37be475c9980ece4349ab715df"

/-- The captured detector sources are not authenticated as executed bytes. -/
def executedByteProvenance : Bool := false
/-- This one obstruction does not establish schedule coverage. -/
def aggregateCoverage : Bool := false
/-- This finite normalized record has no proved universal lift. -/
def universalLift : Bool := false
/-- The classifier metadata does not claim Lean theorem closure. -/
def leanTheoremClosure : Bool := false

/-- Selected positive row incidences used by the closure certificate. -/
def positiveRowChoices : List (RowChoice Label) :=
  [
    { center := 0, support := {1, 3, 4, 7} },
    { center := 1, support := {0, 2, 6, 8} },
    { center := 2, support := {0, 1, 10, 11} },
    { center := 3, support := {0, 1, 4, 5} },
    { center := 4, support := {0, 2, 3, 5} }
  ]

/-- Equality-closure data for the recorded duplicate-center core. -/
def duplicateCenterData : DuplicateCenterData Label :=
  { p := 0
    q := 1
    r := 4
    a := 2
    b := 3
    ap_aq :=
      { first := (2, 0)
        steps :=
          [
            .row 2 0 1
          ]
        last := (2, 1) }
    ap_ar :=
      { first := (2, 0)
        steps :=
          [
            .row 2 0 1,
            .flip 2 1,
            .row 1 2 0,
            .flip 1 0,
            .row 0 1 4,
            .flip 0 4,
            .row 4 0 2,
            .flip 4 2
          ]
        last := (2, 4) }
    bp_bq :=
      { first := (3, 0)
        steps :=
          [
            .row 3 0 1
          ]
        last := (3, 1) }
    bp_br :=
      { first := (3, 0)
        steps :=
          [
            .row 3 0 4
          ]
        last := (3, 4) }
  }

/-- The classifier's typed finite-local source record. -/
def sourceNogood : DuplicateCenterNogood Label :=
  { choices := positiveRowChoices
    data := duplicateCenterData }

/-- The recorded positive incidences compose to a duplicate-center core. -/
theorem sourceNogood_check :
    sourceNogood.check = true := by
  decide

/-- Kernel-checked content mapping from the validated classifier to the
pre-existing canary record. The SHA-256 strings remain metadata. -/
theorem sourceNogood_eq_existingRecord0 :
    sourceNogood =
      ExactTwelveRigid221Ingress.ExactTwelveV14DuplicateCenterCanary.record0 := by
  decide

set_option maxRecDepth 100000 in
/-- The classifier rows encode the pre-existing learned blocking clause.
This computes only the local clause; it does not show that any source
assignment falsifies it. -/
theorem sourceNogood_learnedClause :
    ExactTwelveRigid221Ingress.SafeCoverIndexBridge.learnedClause
        sourceNogood.choices =
      [-6, -55, -155, -175, -525] := by
  decide

/-- Any exact-twelve row pattern containing these positive incidences has
no injective planar realization. This restates the pre-existing finite-local
obstruction; it is not a coverage or live-spine theorem. -/
theorem not_realizes_of_positiveMatches {P : RowPattern Label}
    (hpositive : sourceNogood.PositivelyMatches P) :
    ¬ (∃ pointOf : Label → ℝ², Realizes P pointOf) :=
  sourceNogood.not_realizes_of_positiveCheck
    sourceNogood_check hpositive

end ExactTwelveSourceDuplicateCenter0000
end ATailFrontierLiveClosure
end Problem97
