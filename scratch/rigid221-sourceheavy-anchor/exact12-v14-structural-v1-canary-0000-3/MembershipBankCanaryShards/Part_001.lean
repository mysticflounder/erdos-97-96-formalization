/-
Generated membership-core shard from scratch/rigid221-sourceheavy-anchor/exact12-v14-structural-v1-canary-0000-3/journal.jsonl
Journal SHA-256: 3708cf60f9cce9fb5b04565c9ee783b062cb60b540dfbabefc4b634b3284e264
Global record interval: 0..0

This file checks record validity only.  It is not a coverage or UNSAT proof.
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.GenericRowNogoodCertificate

namespace Scratch.Exact12V14Cell0MembershipBankCanaryShards.Part_001

open Problem97.Census554.EqualityCore
open Problem97.ATailFrontierLiveClosure.GenericRowNogoodCertificate
open scoped EuclideanGeometry

abbrev Label := Fin 12

/-- Journal iteration None; certificate c247b4f7ce8a4b64b74360e1c8e4c3661d4ed107af73ad27ea7135d9c33cf409. -/
def record0 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {1, 4} },
      { center := 1, support := {0, 2} },
      { center := 2, support := {0, 1} },
      { center := 3, support := {0, 1, 4} },
      { center := 4, support := {0, 2} }
    ]
    data := {
      p := 0
      q := 1
      r := 4
      a := 2
      b := 3
      ap_aq := { first := (2, 0), steps := [.row 2 0 1], last := (2, 1) }
      ap_ar := { first := (2, 0), steps := [.row 2 0 1, .flip 2 1, .row 1 2 0, .flip 1 0, .row 0 1 4, .flip 0 4, .row 4 0 2, .flip 4 2], last := (2, 4) }
      bp_bq := { first := (3, 0), steps := [.row 3 0 1], last := (3, 1) }
      bp_br := { first := (3, 0), steps := [.row 3 0 4], last := (3, 4) } } }

def bank : List (DuplicateCenterNogood Label) :=
  [record0]

def bankCheck : Bool := bank.all fun nogood => nogood.check

theorem bankCheck_true : bankCheck = true := by
  native_decide

theorem bank_valid : ∀ nogood ∈ bank, nogood.check = true := by
  apply List.all_eq_true.mp
  simpa [bankCheck] using bankCheck_true

end Scratch.Exact12V14Cell0MembershipBankCanaryShards.Part_001
