/-
Generated from scratch/pentagon-offclass-exact12-v2/cegar-d0-v2-common-v7-u-q-mask-census-500/journal.jsonl
Journal SHA-256: f34642b71a492b44d24edb3328c33b171c9f010eda55b65d6c43cdd4bfaa021c
Duplicate-center records: 1

This file checks record validity only.  It is not a coverage or UNSAT proof.
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.GenericRowNogoodCertificate

namespace Problem97.ATailFrontierLiveClosure.ExactTwelveGeneratedDuplicateCenterBank

open Problem97.Census554.EqualityCore
open Problem97.ATailFrontierLiveClosure.GenericRowNogoodCertificate
open scoped EuclideanGeometry

abbrev Label := Fin 12

/-- Journal iteration 11351; certificate 474376bef45c02dc95c595d0c01966c6996ed9bcffd87892dcf413860573568c. -/
def record0 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {3, 4, 5, 7} },
      { center := 2, support := {5, 9, 10, 11} },
      { center := 3, support := {0, 1, 7, 9} },
      { center := 5, support := {1, 2, 6, 7} },
      { center := 9, support := {0, 2, 3, 5} }
    ]
    data := {
      p := 0
      q := 1
      r := 7
      a := 3
      b := 5
      ap_aq := { first := (3, 0), steps := [.row 3 0 1], last := (3, 1) }
      ap_ar := { first := (3, 0), steps := [.row 3 0 7], last := (3, 7) }
      bp_bq := { first := (5, 0), steps := [.flip 5 0, .row 0 5 3, .flip 0 3, .row 3 0 9, .flip 3 9, .row 9 3 2, .flip 9 2, .row 2 9 5, .flip 2 5, .row 5 2 1], last := (5, 1) }
      bp_br := { first := (5, 0), steps := [.flip 5 0, .row 0 5 3, .flip 0 3, .row 3 0 9, .flip 3 9, .row 9 3 2, .flip 9 2, .row 2 9 5, .flip 2 5, .row 5 2 7], last := (5, 7) } } }

def bankChunk0 : List (DuplicateCenterNogood Label) :=
  [record0]

def bank : List (DuplicateCenterNogood Label) :=
  bankChunk0

def bankCheck : Bool := bank.all fun nogood => nogood.check

def bankFourSupportedCheck : Bool :=
  bank.all fun nogood => nogood.fourSupportedCheck

theorem bankCheck_true : bankCheck = true := by
  native_decide

theorem bankFourSupportedCheck_true : bankFourSupportedCheck = true := by
  native_decide

theorem bank_valid : ∀ nogood ∈ bank, nogood.check = true := by
  apply List.all_eq_true.mp
  simpa [bankCheck] using bankCheck_true

theorem bank_fourSupported : ∀ nogood ∈ bank, nogood.FourSupported := by
  intro nogood hnogood
  apply nogood.fourSupported_of_check
  have hall : bank.all (fun item => item.fourSupportedCheck) = true := by
    simpa [bankFourSupportedCheck] using bankFourSupportedCheck_true
  exact List.all_eq_true.mp hall nogood hnogood

end Problem97.ATailFrontierLiveClosure.ExactTwelveGeneratedDuplicateCenterBank
