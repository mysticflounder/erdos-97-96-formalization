/-
Generated from /Users/adam/projects/math-projects/erdos-97-96-formalization/scratch/rigid221-sourceheavy-anchor/five-omission-v2-summary-fix-smoke-20260810/deleted-0/journal.jsonl
Journal SHA-256: bea427e6c69620d1ad38d0abef0b82f6f62d13dce50efb79afd3aa37ef3793da
Authenticated records emitted: 1 (equality-duplicate-center=1)

Every item is a source-uniform typed cut with its exact four-row CNF choices.
This is not a terminal UNSAT, coverage, universal-lift, or live-closure proof.
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221FiveOmissionTerminalBankConsumer

namespace Problem97.ATailFrontierLiveClosure.ExactTwelveFiveOmissionTypedTerminalBankSmoke

open Problem97.Census554.EqualityCore
open Problem97.ATailFrontierLiveClosure.GenericRowNogoodCertificate
open Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress
open Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress.SourceOrderTerminalBankConsumer
open Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress.FiveOmissionTerminalBankConsumer
open scoped EuclideanGeometry

abbrev Label := Fin 12

/-- Journal iteration None; certificate be996cebd108789f1305c5ce1c128b7996b4d68339e0e01b81be80a7f31f4ea3. -/
def duplicateData0 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 2, support := {5, 8, 10, 11} },
      { center := 3, support := {6, 8, 9, 10} },
      { center := 4, support := {6, 7, 10, 11} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 8, support := {3, 4, 6, 11} },
      { center := 10, support := {2, 4, 6, 8} }
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

theorem duplicateCheck0 : duplicateData0.check = true := by
  native_decide

def cut0 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData0 duplicateCheck0

def bank : List SourceOrderPositiveNogood := [cut0]

end Problem97.ATailFrontierLiveClosure.ExactTwelveFiveOmissionTypedTerminalBankSmoke
