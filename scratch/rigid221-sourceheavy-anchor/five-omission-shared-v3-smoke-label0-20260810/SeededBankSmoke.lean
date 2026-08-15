import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221FiveOmissionTerminalBankConsumer

/-!
Generated from authenticated bootstrap plus /Users/adam/projects/math-projects/erdos-97-96-formalization/scratch/rigid221-sourceheavy-anchor/five-omission-shared-v3-smoke-label0-20260810/journal.jsonl
Shared-bank document SHA-256: 560765255fd5c52d552d84e5bf3ee108d7f50d27dc5c81913cfdeb93f5a9b4d6
Journal SHA-256: 6239daa9816d7ed5768b09b27e86e15aadbfdffe42f4fbaab47614e88dc28f9e
Authenticated bootstrap records: 441
Authenticated local records: 1
Authenticated records emitted: 2 (equality-duplicate-center=2)

Every item is a source-uniform typed cut with its exact four-row CNF choices.
This is not a terminal UNSAT, coverage, universal-lift, or live-closure proof.
-/

namespace Problem97.SeededBankSmoke

open Problem97.Census554.EqualityCore
open Problem97.ATailFrontierLiveClosure.GenericRowNogoodCertificate
open Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress
open Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress.SourceOrderTerminalBankConsumer
open Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress.FiveOmissionTerminalBankConsumer
open scoped EuclideanGeometry

abbrev Label := Fin 12

/-- Journal iteration 0; certificate de5915f91ce3a0a98f39fe65bf75a2f7f6b7b8dc72f6fd3067f346499a83bd6f. -/
def duplicateData0 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 4, support := {6, 7, 10, 11} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 8, support := {2, 5, 6, 9} },
      { center := 10, support := {1, 4, 6, 8} },
      { center := 11, support := {2, 3, 5, 10} }
    ]
    data := {
      p := 2
      q := 5
      r := 10
      a := 8
      b := 11
      ap_aq := { first := (8, 2), steps := [.row 8 2 5], last := (8, 5) }
      ap_ar := { first := (8, 2), steps := [.row 8 2 6, .flip 8 6, .row 6 8 4, .flip 6 4, .row 4 6 10, .flip 4 10, .row 10 4 8, .flip 10 8], last := (8, 10) }
      bp_bq := { first := (11, 2), steps := [.row 11 2 5], last := (11, 5) }
      bp_br := { first := (11, 2), steps := [.row 11 2 10], last := (11, 10) } } }

theorem duplicateCheck0 : duplicateData0.check = true := by
  native_decide

def cut0 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData0 duplicateCheck0

/-- Kernel-checked agreement with this record's authenticated journal clause. -/
theorem cut0_learnedClause_eq :
    SafeCoverIndexBridge.learnedClause cut0.choices = [-809, -1424, -2000, -2564, -2925] := by
  native_decide

/-- Every concrete row choice in this cut occurs in the frozen candidate table. -/
theorem cut0_encodable :
    ∀ choice ∈ cut0.choices,
      FrozenSafeCandidateAt choice.center choice.support := by
  native_decide

/-- Journal iteration 1; certificate 5f54cf743391a96b3118157c5c344a5dedafcf12a882abdff09723c73eebdb91. -/
def duplicateData1 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 4, support := {6, 7, 10, 11} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 8, support := {2, 5, 6, 9} },
      { center := 10, support := {0, 4, 6, 8} },
      { center := 11, support := {2, 3, 5, 10} }
    ]
    data := {
      p := 2
      q := 5
      r := 10
      a := 8
      b := 11
      ap_aq := { first := (8, 2), steps := [.row 8 2 5], last := (8, 5) }
      ap_ar := { first := (8, 2), steps := [.row 8 2 6, .flip 8 6, .row 6 8 4, .flip 6 4, .row 4 6 10, .flip 4 10, .row 10 4 8, .flip 10 8], last := (8, 10) }
      bp_bq := { first := (11, 2), steps := [.row 11 2 5], last := (11, 5) }
      bp_br := { first := (11, 2), steps := [.row 11 2 10], last := (11, 10) } } }

theorem duplicateCheck1 : duplicateData1.check = true := by
  native_decide

def cut1 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData1 duplicateCheck1

/-- Kernel-checked agreement with this record's authenticated journal clause. -/
theorem cut1_learnedClause_eq :
    SafeCoverIndexBridge.learnedClause cut1.choices = [-809, -1424, -2000, -2480, -2925] := by
  native_decide

/-- Every concrete row choice in this cut occurs in the frozen candidate table. -/
theorem cut1_encodable :
    ∀ choice ∈ cut1.choices,
      FrozenSafeCandidateAt choice.center choice.support := by
  native_decide

def bank : List SourceOrderPositiveNogood := [cut0, cut1]

set_option maxRecDepth 4096 in
/-- Consumer-ready encodability premise for the terminal bank theorem.
The scoped recursion budget is for this generated 2-arm membership
proof only. -/
theorem bank_encodable :
    ∀ nogood ∈ bank, ∀ choice ∈ nogood.choices,
      FrozenSafeCandidateAt choice.center choice.support := by
  intro nogood hnogood
  simp only [bank, List.mem_cons] at hnogood
  rcases hnogood with rfl | hnogood
  · exact cut0_encodable
  rcases hnogood with rfl | hnogood
  · exact cut1_encodable
  · simp at hnogood


end Problem97.SeededBankSmoke
