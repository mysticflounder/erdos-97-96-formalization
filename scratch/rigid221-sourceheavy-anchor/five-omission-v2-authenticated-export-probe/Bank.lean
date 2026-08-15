/-
Generated from /Users/adam/projects/math-projects/erdos-97-96-formalization/scratch/rigid221-sourceheavy-anchor/five-omission-v2-wave-seed25-plus250-20260809T2232/deleted-0/journal.jsonl
Journal SHA-256: 865389a9fac3c1eaf6abedc9c9201d7a600db483474a56c9f56916160d107c96
Duplicate-center distinct membership cores: 1

This file checks record validity only.  It is not a coverage or UNSAT proof.
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.GenericRowNogoodCertificate

namespace Problem97.ATailFrontierLiveClosure.ExactTwelveFiveOmissionDuplicateCenterProbe

open Problem97.Census554.EqualityCore
open Problem97.ATailFrontierLiveClosure.GenericRowNogoodCertificate
open scoped EuclideanGeometry

abbrev Label := Fin 12

/-- Journal iteration 0; certificate be996cebd108789f1305c5ce1c128b7996b4d68339e0e01b81be80a7f31f4ea3. -/
def record0 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 2, support := {8, 10} },
      { center := 3, support := {8, 10} },
      { center := 4, support := {6, 10} },
      { center := 6, support := {4, 8} },
      { center := 8, support := {3, 4, 6} },
      { center := 10, support := {2, 4} }
    ]
    data := {
      p := 2
      q := 3
      r := 4
      a := 8
      b := 10
      ap_aq := { first := (8, 2), steps := [.flip 8 2, .row 2 8 10, .flip 2 10, .row 10 2 4, .flip 10 4, .row 4 10 6, .flip 4 6, .row 6 4 8, .flip 6 8, .row 8 6 3], last := (8, 3) }
      ap_ar := { first := (8, 2), steps := [.flip 8 2, .row 2 8 10, .flip 2 10, .row 10 2 4, .flip 10 4, .row 4 10 6, .flip 4 6, .row 6 4 8, .flip 6 8, .row 8 6 4], last := (8, 4) }
      bp_bq := { first := (10, 2), steps := [.row 10 2 4, .flip 10 4, .row 4 10 6, .flip 4 6, .row 6 4 8, .flip 6 8, .row 8 6 3, .flip 8 3, .row 3 8 10, .flip 3 10], last := (10, 3) }
      bp_br := { first := (10, 2), steps := [.row 10 2 4], last := (10, 4) } } }

def bankChunk0 : List (DuplicateCenterNogood Label) :=
  [record0]

def bank : List (DuplicateCenterNogood Label) :=
  bankChunk0

def bankCheck : Bool := bank.all fun nogood => nogood.check

theorem bankCheck_true : bankCheck = true := by
  native_decide

theorem bank_valid : ∀ nogood ∈ bank, nogood.check = true := by
  apply List.all_eq_true.mp
  simpa [bankCheck] using bankCheck_true



end Problem97.ATailFrontierLiveClosure.ExactTwelveFiveOmissionDuplicateCenterProbe
