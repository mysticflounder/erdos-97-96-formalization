/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.GenericRowNogoodCertificate

/-!
# Checked exact-twelve duplicate-center records

This module replays concrete equality-closure records emitted by the
pentagon-off-class exact-twelve CEGAR lane.  Each theorem validates one
learned row nogood: if a proof-facing row pattern realizes the listed five
complete rows, then it has no injective planar realization.

These are sound learned cuts, not a coverage theorem and not an UNSAT result.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveDuplicateCenterRecords

open Census554.EqualityCore
open GenericRowNogoodCertificate
open scoped EuclideanGeometry

abbrev Label := Fin 12

/-- First duplicate-center record in the authenticated v7 common-arm journal.
Its five rows are the unique minimum whole-row core found by exhaustive
subset minimization. -/
def record0Rows : List (RowChoice Label) := [
  { center := 0, support := {3, 4, 5, 7} },
  { center := 2, support := {5, 9, 10, 11} },
  { center := 3, support := {0, 1, 7, 9} },
  { center := 5, support := {1, 2, 6, 7} },
  { center := 9, support := {0, 2, 3, 5} }
]

def record0ApAq : ClosurePathData Label :=
  { first := (3, 0)
    steps := [.row 3 0 1]
    last := (3, 1) }

def record0ApAr : ClosurePathData Label :=
  { first := (3, 0)
    steps := [.row 3 0 7]
    last := (3, 7) }

def record0BpAq : ClosurePathData Label :=
  { first := (5, 0)
    steps := [
      .flip 5 0,
      .row 0 5 3,
      .flip 0 3,
      .row 3 0 9,
      .flip 3 9,
      .row 9 3 2,
      .flip 9 2,
      .row 2 9 5,
      .flip 2 5,
      .row 5 2 1]
    last := (5, 1) }

def record0BpAr : ClosurePathData Label :=
  { first := (5, 0)
    steps := [
      .flip 5 0,
      .row 0 5 3,
      .flip 0 3,
      .row 3 0 9,
      .flip 3 9,
      .row 9 3 2,
      .flip 9 2,
      .row 2 9 5,
      .flip 2 5,
      .row 5 2 7]
    last := (5, 7) }

def record0 : DuplicateCenterData Label :=
  { p := 0
    q := 1
    r := 7
    a := 3
    b := 5
    ap_aq := record0ApAq
    ap_ar := record0ApAr
    bp_bq := record0BpAq
    bp_br := record0BpAr }

/-- The first journal record in the generic proof-free bank format. -/
def record0Nogood : DuplicateCenterNogood Label :=
  { choices := record0Rows
    data := record0 }

theorem record0_check : record0.check record0Rows = true := by
  decide

theorem record0Nogood_check : record0Nogood.check = true := by
  decide

/-- Kernel-replayed soundness of the first learned exact-twelve row nogood. -/
theorem record0_not_realizes {P : RowPattern Label}
    (hrows : RowsMatch P record0Rows) :
    ¬ (∃ pointOf : Label → ℝ², Realizes P pointOf) := by
  exact record0Nogood.not_realizes_of_check record0Nogood_check hrows

end ExactTwelveDuplicateCenterRecords
end ATailFrontierLiveClosure
end Problem97
