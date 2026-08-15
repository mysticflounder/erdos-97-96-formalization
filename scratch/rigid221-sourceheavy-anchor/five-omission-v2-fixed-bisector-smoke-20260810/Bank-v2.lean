/-
Generated from /Users/adam/projects/math-projects/erdos-97-96-formalization/scratch/rigid221-sourceheavy-anchor/five-omission-v2-fixed-bisector-smoke-20260810/deleted-0/journal.jsonl
Journal SHA-256: 728d5a5ae5d1ad2eb75d5545c402d044ce358859d509626fd8c30628a229e9b9
Authenticated records emitted: 202 (equality-duplicate-center=201, equality-equilateral-bisector-collision=1)

Every item is a source-uniform typed cut with its exact four-row CNF choices.
This is not a terminal UNSAT, coverage, universal-lift, or live-closure proof.
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221FiveOmissionTerminalBankConsumer

namespace Problem97.ATailFrontierLiveClosure.ExactTwelveFiveOmissionTypedTerminalBank

open Problem97.Census554.EqualityCore
open Problem97.ATailFrontierLiveClosure.GenericRowNogoodCertificate
open Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress
open Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress.SourceOrderTerminalBankConsumer
open Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress.FiveOmissionTerminalBankConsumer
open scoped EuclideanGeometry

abbrev Label := Fin 12

/-- Journal iteration 0; certificate be996cebd108789f1305c5ce1c128b7996b4d68339e0e01b81be80a7f31f4ea3. -/
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

/-- Journal iteration 1; certificate d5274f46815b7999f57f9732de4b8b39ad1738213205028f51d48dc3a9ac4393. -/
def duplicateData1 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 2, support := {5, 8, 10, 11} },
      { center := 3, support := {6, 8, 9, 10} },
      { center := 8, support := {3, 4, 6, 11} },
      { center := 10, support := {2, 3, 4, 8} }
    ]
    data := {
      p := 2
      q := 3
      r := 4
      a := 8
      b := 10
      ap_aq := { first := (8, 2), steps := [.flip 8 2, .row 2 8 10, .flip 2 10, .row 10 2 3, .flip 10 3, .row 3 10 8, .flip 3 8], last := (8, 3) }
      ap_ar := { first := (8, 2), steps := [.flip 8 2, .row 2 8 10, .flip 2 10, .row 10 2 3, .flip 10 3, .row 3 10 8, .flip 3 8, .row 8 3 4], last := (8, 4) }
      bp_bq := { first := (10, 2), steps := [.row 10 2 3], last := (10, 3) }
      bp_br := { first := (10, 2), steps := [.row 10 2 4], last := (10, 4) } } }

theorem duplicateCheck1 : duplicateData1.check = true := by
  native_decide

def cut1 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData1 duplicateCheck1

/-- Journal iteration 2; certificate 1db4f53f7dcc442b6f9e8a3efe9ae38cb62856807108107a544d8a82e6b5c0ad. -/
def duplicateData2 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 3, support := {6, 8, 9, 10} },
      { center := 4, support := {6, 7, 10, 11} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 7, support := {3, 5, 6, 9} },
      { center := 8, support := {3, 4, 6, 11} }
    ]
    data := {
      p := 3
      q := 4
      r := 5
      a := 6
      b := 7
      ap_aq := { first := (6, 3), steps := [.flip 6 3, .row 3 6 8, .flip 3 8, .row 8 3 6, .flip 8 6, .row 6 8 4], last := (6, 4) }
      ap_ar := { first := (6, 3), steps := [.flip 6 3, .row 3 6 8, .flip 3 8, .row 8 3 6, .flip 8 6, .row 6 8 5], last := (6, 5) }
      bp_bq := { first := (7, 3), steps := [.row 7 3 6, .flip 7 6, .row 6 7 4, .flip 6 4, .row 4 6 7, .flip 4 7], last := (7, 4) }
      bp_br := { first := (7, 3), steps := [.row 7 3 5], last := (7, 5) } } }

theorem duplicateCheck2 : duplicateData2.check = true := by
  native_decide

def cut2 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData2 duplicateCheck2

/-- Journal iteration 3; certificate 2e889adcb411a8d3aa60c2499051821ac9d8ac2b4d55a641e229e1cc9eb23132. -/
def duplicateData3 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 2, support := {5, 8, 10, 11} },
      { center := 4, support := {6, 7, 10, 11} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 7, support := {3, 5, 6, 9} },
      { center := 10, support := {2, 4, 6, 8} }
    ]
    data := {
      p := 2
      q := 4
      r := 6
      a := 5
      b := 10
      ap_aq := { first := (5, 2), steps := [.flip 5 2, .row 2 5 10, .flip 2 10, .row 10 2 4, .flip 10 4, .row 4 10 6, .flip 4 6, .row 6 4 7, .flip 6 7, .row 7 6 5, .flip 7 5, .row 5 7 4], last := (5, 4) }
      ap_ar := { first := (5, 2), steps := [.flip 5 2, .row 2 5 10, .flip 2 10, .row 10 2 4, .flip 10 4, .row 4 10 6, .flip 4 6, .row 6 4 5, .flip 6 5], last := (5, 6) }
      bp_bq := { first := (10, 2), steps := [.row 10 2 4], last := (10, 4) }
      bp_br := { first := (10, 2), steps := [.row 10 2 6], last := (10, 6) } } }

theorem duplicateCheck3 : duplicateData3.check = true := by
  native_decide

def cut3 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData3 duplicateCheck3

/-- Journal iteration 4; certificate 489d55d9f8e53fa96d4a60bb2519c0cf76b57597744497cf75ce9b3cb29f315b. -/
def duplicateData4 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 2, support := {5, 8, 10, 11} },
      { center := 3, support := {6, 8, 9, 10} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 7, support := {3, 5, 6, 9} },
      { center := 8, support := {2, 5, 6, 7} },
      { center := 10, support := {2, 3, 4, 8} }
    ]
    data := {
      p := 2
      q := 3
      r := 5
      a := 8
      b := 10
      ap_aq := { first := (8, 2), steps := [.flip 8 2, .row 2 8 10, .flip 2 10, .row 10 2 3, .flip 10 3, .row 3 10 8, .flip 3 8], last := (8, 3) }
      ap_ar := { first := (8, 2), steps := [.row 8 2 5], last := (8, 5) }
      bp_bq := { first := (10, 2), steps := [.row 10 2 3], last := (10, 3) }
      bp_br := { first := (10, 2), steps := [.flip 10 2, .row 2 10 8, .flip 2 8, .row 8 2 6, .flip 8 6, .row 6 8 7, .flip 6 7, .row 7 6 5, .flip 7 5, .row 5 7 10, .flip 5 10], last := (10, 5) } } }

theorem duplicateCheck4 : duplicateData4.check = true := by
  native_decide

def cut4 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData4 duplicateCheck4

/-- Journal iteration 5; certificate de736b46e5662e1278217fde6c9521a069d88e15fc2f726285fe4c84bed83c55. -/
def duplicateData5 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 2, support := {5, 8, 10, 11} },
      { center := 4, support := {6, 7, 10, 11} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 7, support := {3, 5, 6, 9} },
      { center := 8, support := {2, 5, 6, 7} },
      { center := 10, support := {1, 4, 6, 8} }
    ]
    data := {
      p := 2
      q := 4
      r := 6
      a := 5
      b := 10
      ap_aq := { first := (5, 2), steps := [.flip 5 2, .row 2 5 8, .flip 2 8, .row 8 2 6, .flip 8 6, .row 6 8 7, .flip 6 7, .row 7 6 5, .flip 7 5, .row 5 7 4], last := (5, 4) }
      ap_ar := { first := (5, 2), steps := [.flip 5 2, .row 2 5 8, .flip 2 8, .row 8 2 6, .flip 8 6, .row 6 8 5, .flip 6 5], last := (5, 6) }
      bp_bq := { first := (10, 2), steps := [.flip 10 2, .row 2 10 8, .flip 2 8, .row 8 2 6, .flip 8 6, .row 6 8 4, .flip 6 4, .row 4 6 10, .flip 4 10], last := (10, 4) }
      bp_br := { first := (10, 2), steps := [.flip 10 2, .row 2 10 8, .flip 2 8, .row 8 2 6, .flip 8 6, .row 6 8 4, .flip 6 4, .row 4 6 10, .flip 4 10, .row 10 4 6], last := (10, 6) } } }

theorem duplicateCheck5 : duplicateData5.check = true := by
  native_decide

def cut5 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData5 duplicateCheck5

/-- Journal iteration 6; certificate 82d8674c43328a702ae689f4d45b814cda332a8324a70dc9685112c74051ff86. -/
def duplicateData6 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 2, support := {5, 8, 10, 11} },
      { center := 3, support := {6, 8, 9, 10} },
      { center := 4, support := {6, 7, 10, 11} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 7, support := {3, 5, 6, 9} },
      { center := 8, support := {2, 5, 6, 7} },
      { center := 10, support := {1, 3, 4, 8} }
    ]
    data := {
      p := 2
      q := 3
      r := 5
      a := 8
      b := 10
      ap_aq := { first := (8, 2), steps := [.row 8 2 6, .flip 8 6, .row 6 8 4, .flip 6 4, .row 4 6 10, .flip 4 10, .row 10 4 3, .flip 10 3, .row 3 10 8, .flip 3 8], last := (8, 3) }
      ap_ar := { first := (8, 2), steps := [.row 8 2 5], last := (8, 5) }
      bp_bq := { first := (10, 2), steps := [.flip 10 2, .row 2 10 8, .flip 2 8, .row 8 2 6, .flip 8 6, .row 6 8 4, .flip 6 4, .row 4 6 10, .flip 4 10, .row 10 4 3], last := (10, 3) }
      bp_br := { first := (10, 2), steps := [.flip 10 2, .row 2 10 8, .flip 2 8, .row 8 2 6, .flip 8 6, .row 6 8 7, .flip 6 7, .row 7 6 5, .flip 7 5, .row 5 7 10, .flip 5 10], last := (10, 5) } } }

theorem duplicateCheck6 : duplicateData6.check = true := by
  native_decide

def cut6 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData6 duplicateCheck6

/-- Journal iteration 7; certificate 0ac9b12979e0f3c83105d451511956a1f2e50ce8f021e1f5d3a07871813ce650. -/
def duplicateData7 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 2, support := {5, 8, 10, 11} },
      { center := 4, support := {6, 7, 10, 11} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 7, support := {3, 5, 6, 9} },
      { center := 8, support := {2, 5, 6, 7} },
      { center := 10, support := {1, 2, 6, 8} }
    ]
    data := {
      p := 2
      q := 4
      r := 6
      a := 5
      b := 10
      ap_aq := { first := (5, 2), steps := [.flip 5 2, .row 2 5 8, .flip 2 8, .row 8 2 6, .flip 8 6, .row 6 8 7, .flip 6 7, .row 7 6 5, .flip 7 5, .row 5 7 4], last := (5, 4) }
      ap_ar := { first := (5, 2), steps := [.flip 5 2, .row 2 5 8, .flip 2 8, .row 8 2 6, .flip 8 6, .row 6 8 5, .flip 6 5], last := (5, 6) }
      bp_bq := { first := (10, 2), steps := [.flip 10 2, .row 2 10 8, .flip 2 8, .row 8 2 6, .flip 8 6, .row 6 8 4, .flip 6 4, .row 4 6 10, .flip 4 10], last := (10, 4) }
      bp_br := { first := (10, 2), steps := [.row 10 2 6], last := (10, 6) } } }

theorem duplicateCheck7 : duplicateData7.check = true := by
  native_decide

def cut7 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData7 duplicateCheck7

/-- Journal iteration 8; certificate 1546f4deab62e9fa0ba91a4a2a325df3485ab2697a618e5eb907cd0d3b09941e. -/
def duplicateData8 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 2, support := {5, 8, 10, 11} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 7, support := {3, 5, 6, 9} },
      { center := 8, support := {2, 5, 6, 7} },
      { center := 10, support := {1, 2, 4, 8} }
    ]
    data := {
      p := 2
      q := 4
      r := 8
      a := 5
      b := 10
      ap_aq := { first := (5, 2), steps := [.flip 5 2, .row 2 5 8, .flip 2 8, .row 8 2 6, .flip 8 6, .row 6 8 7, .flip 6 7, .row 7 6 5, .flip 7 5, .row 5 7 4], last := (5, 4) }
      ap_ar := { first := (5, 2), steps := [.flip 5 2, .row 2 5 8, .flip 2 8, .row 8 2 5, .flip 8 5], last := (5, 8) }
      bp_bq := { first := (10, 2), steps := [.row 10 2 4], last := (10, 4) }
      bp_br := { first := (10, 2), steps := [.row 10 2 8], last := (10, 8) } } }

theorem duplicateCheck8 : duplicateData8.check = true := by
  native_decide

def cut8 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData8 duplicateCheck8

/-- Journal iteration 9; certificate 32c706f3d2b38aad2b48672e5f4ed72a5ade7efd3b08b936bb84410ad3b1dc7f. -/
def duplicateData9 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 2, support := {5, 8, 10, 11} },
      { center := 4, support := {6, 7, 10, 11} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 7, support := {3, 5, 6, 9} },
      { center := 10, support := {1, 2, 4, 6} }
    ]
    data := {
      p := 2
      q := 4
      r := 6
      a := 5
      b := 10
      ap_aq := { first := (5, 2), steps := [.flip 5 2, .row 2 5 10, .flip 2 10, .row 10 2 4, .flip 10 4, .row 4 10 6, .flip 4 6, .row 6 4 7, .flip 6 7, .row 7 6 5, .flip 7 5, .row 5 7 4], last := (5, 4) }
      ap_ar := { first := (5, 2), steps := [.flip 5 2, .row 2 5 10, .flip 2 10, .row 10 2 4, .flip 10 4, .row 4 10 6, .flip 4 6, .row 6 4 5, .flip 6 5], last := (5, 6) }
      bp_bq := { first := (10, 2), steps := [.row 10 2 4], last := (10, 4) }
      bp_br := { first := (10, 2), steps := [.row 10 2 6], last := (10, 6) } } }

theorem duplicateCheck9 : duplicateData9.check = true := by
  native_decide

def cut9 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData9 duplicateCheck9

/-- Journal iteration 10; certificate 387598e5111637b4c358b0fc67c56db6deb5041be86179a55d458d8f11f4feae. -/
def duplicateData10 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {4, 5, 9, 11} },
      { center := 2, support := {5, 8, 10, 11} },
      { center := 4, support := {6, 7, 10, 11} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 7, support := {3, 5, 6, 9} },
      { center := 8, support := {2, 5, 6, 7} },
      { center := 11, support := {0, 4, 6, 8} }
    ]
    data := {
      p := 0
      q := 2
      r := 4
      a := 5
      b := 11
      ap_aq := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 4, .flip 11 4, .row 4 11 6, .flip 4 6, .row 6 4 8, .flip 6 8, .row 8 6 2, .flip 8 2, .row 2 8 5, .flip 2 5], last := (5, 2) }
      ap_ar := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 4, .flip 11 4, .row 4 11 6, .flip 4 6, .row 6 4 7, .flip 6 7, .row 7 6 5, .flip 7 5, .row 5 7 4], last := (5, 4) }
      bp_bq := { first := (11, 0), steps := [.row 11 0 4, .flip 11 4, .row 4 11 6, .flip 4 6, .row 6 4 8, .flip 6 8, .row 8 6 2, .flip 8 2, .row 2 8 11, .flip 2 11], last := (11, 2) }
      bp_br := { first := (11, 0), steps := [.row 11 0 4], last := (11, 4) } } }

theorem duplicateCheck10 : duplicateData10.check = true := by
  native_decide

def cut10 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData10 duplicateCheck10

/-- Journal iteration 11; certificate 5453736c686d03f69f80602844692d3d02989a93eed8491a207877e2f616a484. -/
def duplicateData11 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {4, 5, 9, 11} },
      { center := 2, support := {5, 8, 10, 11} },
      { center := 4, support := {6, 7, 10, 11} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 7, support := {3, 5, 6, 9} },
      { center := 8, support := {2, 5, 6, 7} },
      { center := 10, support := {1, 2, 3, 11} },
      { center := 11, support := {0, 3, 5, 10} }
    ]
    data := {
      p := 0
      q := 2
      r := 4
      a := 5
      b := 11
      ap_aq := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 10, .flip 11 10, .row 10 11 2, .flip 10 2, .row 2 10 5, .flip 2 5], last := (5, 2) }
      ap_ar := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 10, .flip 11 10, .row 10 11 2, .flip 10 2, .row 2 10 8, .flip 2 8, .row 8 2 6, .flip 8 6, .row 6 8 7, .flip 6 7, .row 7 6 5, .flip 7 5, .row 5 7 4], last := (5, 4) }
      bp_bq := { first := (11, 0), steps := [.row 11 0 10, .flip 11 10, .row 10 11 2, .flip 10 2, .row 2 10 11, .flip 2 11], last := (11, 2) }
      bp_br := { first := (11, 0), steps := [.row 11 0 10, .flip 11 10, .row 10 11 2, .flip 10 2, .row 2 10 8, .flip 2 8, .row 8 2 6, .flip 8 6, .row 6 8 4, .flip 6 4, .row 4 6 11, .flip 4 11], last := (11, 4) } } }

theorem duplicateCheck11 : duplicateData11.check = true := by
  native_decide

def cut11 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData11 duplicateCheck11

/-- Journal iteration 12; certificate 5df497e687050f9d80772cf42ec617d5b28419b676c2d1c728dff7137984b2c2. -/
def duplicateData12 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {4, 5, 9, 11} },
      { center := 2, support := {5, 8, 10, 11} },
      { center := 4, support := {6, 7, 10, 11} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 7, support := {3, 5, 6, 9} },
      { center := 8, support := {2, 5, 6, 7} },
      { center := 11, support := {0, 3, 4, 10} }
    ]
    data := {
      p := 0
      q := 2
      r := 4
      a := 5
      b := 11
      ap_aq := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 4, .flip 11 4, .row 4 11 6, .flip 4 6, .row 6 4 8, .flip 6 8, .row 8 6 2, .flip 8 2, .row 2 8 5, .flip 2 5], last := (5, 2) }
      ap_ar := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 4, .flip 11 4, .row 4 11 6, .flip 4 6, .row 6 4 7, .flip 6 7, .row 7 6 5, .flip 7 5, .row 5 7 4], last := (5, 4) }
      bp_bq := { first := (11, 0), steps := [.row 11 0 4, .flip 11 4, .row 4 11 6, .flip 4 6, .row 6 4 8, .flip 6 8, .row 8 6 2, .flip 8 2, .row 2 8 11, .flip 2 11], last := (11, 2) }
      bp_br := { first := (11, 0), steps := [.row 11 0 4], last := (11, 4) } } }

theorem duplicateCheck12 : duplicateData12.check = true := by
  native_decide

def cut12 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData12 duplicateCheck12

/-- Journal iteration 13; certificate 937b4de66a3d1a3050f677018c24ddf94ffe256bfe1b0c4068651ed982a23632. -/
def duplicateData13 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {4, 5, 9, 11} },
      { center := 2, support := {5, 8, 10, 11} },
      { center := 4, support := {6, 7, 10, 11} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 7, support := {3, 5, 6, 9} },
      { center := 8, support := {2, 5, 6, 7} },
      { center := 11, support := {0, 3, 4, 8} }
    ]
    data := {
      p := 0
      q := 2
      r := 4
      a := 5
      b := 11
      ap_aq := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 4, .flip 11 4, .row 4 11 6, .flip 4 6, .row 6 4 8, .flip 6 8, .row 8 6 2, .flip 8 2, .row 2 8 5, .flip 2 5], last := (5, 2) }
      ap_ar := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 4, .flip 11 4, .row 4 11 6, .flip 4 6, .row 6 4 7, .flip 6 7, .row 7 6 5, .flip 7 5, .row 5 7 4], last := (5, 4) }
      bp_bq := { first := (11, 0), steps := [.row 11 0 4, .flip 11 4, .row 4 11 6, .flip 4 6, .row 6 4 8, .flip 6 8, .row 8 6 2, .flip 8 2, .row 2 8 11, .flip 2 11], last := (11, 2) }
      bp_br := { first := (11, 0), steps := [.row 11 0 4], last := (11, 4) } } }

theorem duplicateCheck13 : duplicateData13.check = true := by
  native_decide

def cut13 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData13 duplicateCheck13

/-- Journal iteration 14; certificate 3eb57cd717a4c72d243a4ac3c87fe4c755b891b926b0a97559365a718eedd6da. -/
def duplicateData14 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {4, 5, 9, 11} },
      { center := 2, support := {5, 8, 10, 11} },
      { center := 4, support := {6, 7, 10, 11} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 7, support := {3, 5, 6, 9} },
      { center := 8, support := {2, 5, 6, 7} },
      { center := 11, support := {0, 2, 6, 8} }
    ]
    data := {
      p := 0
      q := 2
      r := 4
      a := 5
      b := 11
      ap_aq := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 2, .flip 11 2, .row 2 11 5, .flip 2 5], last := (5, 2) }
      ap_ar := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 2, .flip 11 2, .row 2 11 8, .flip 2 8, .row 8 2 6, .flip 8 6, .row 6 8 7, .flip 6 7, .row 7 6 5, .flip 7 5, .row 5 7 4], last := (5, 4) }
      bp_bq := { first := (11, 0), steps := [.row 11 0 2], last := (11, 2) }
      bp_br := { first := (11, 0), steps := [.row 11 0 2, .flip 11 2, .row 2 11 8, .flip 2 8, .row 8 2 6, .flip 8 6, .row 6 8 4, .flip 6 4, .row 4 6 11, .flip 4 11], last := (11, 4) } } }

theorem duplicateCheck14 : duplicateData14.check = true := by
  native_decide

def cut14 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData14 duplicateCheck14

/-- Journal iteration 15; certificate 8b8b2af6a2db06d12feffbc1892c7ac108b961b84474ae39343b58ca77dc47c3. -/
def duplicateData15 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {4, 5, 9, 11} },
      { center := 2, support := {5, 8, 10, 11} },
      { center := 4, support := {6, 7, 10, 11} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 7, support := {3, 5, 6, 9} },
      { center := 8, support := {2, 5, 6, 7} },
      { center := 11, support := {0, 2, 5, 10} }
    ]
    data := {
      p := 0
      q := 2
      r := 4
      a := 5
      b := 11
      ap_aq := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 2, .flip 11 2, .row 2 11 5, .flip 2 5], last := (5, 2) }
      ap_ar := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 2, .flip 11 2, .row 2 11 8, .flip 2 8, .row 8 2 6, .flip 8 6, .row 6 8 7, .flip 6 7, .row 7 6 5, .flip 7 5, .row 5 7 4], last := (5, 4) }
      bp_bq := { first := (11, 0), steps := [.row 11 0 2], last := (11, 2) }
      bp_br := { first := (11, 0), steps := [.row 11 0 2, .flip 11 2, .row 2 11 8, .flip 2 8, .row 8 2 6, .flip 8 6, .row 6 8 4, .flip 6 4, .row 4 6 11, .flip 4 11], last := (11, 4) } } }

theorem duplicateCheck15 : duplicateData15.check = true := by
  native_decide

def cut15 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData15 duplicateCheck15

/-- Journal iteration 16; certificate 5f1f0f368971368ddc462c65f0d55b357d45c5dd4d249f52c54f8793886d28d8. -/
def duplicateData16 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {4, 5, 9, 11} },
      { center := 2, support := {5, 8, 10, 11} },
      { center := 4, support := {6, 7, 10, 11} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 7, support := {3, 5, 6, 9} },
      { center := 11, support := {0, 2, 4, 10} }
    ]
    data := {
      p := 0
      q := 2
      r := 4
      a := 5
      b := 11
      ap_aq := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 2, .flip 11 2, .row 2 11 5, .flip 2 5], last := (5, 2) }
      ap_ar := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 4, .flip 11 4, .row 4 11 6, .flip 4 6, .row 6 4 7, .flip 6 7, .row 7 6 5, .flip 7 5, .row 5 7 4], last := (5, 4) }
      bp_bq := { first := (11, 0), steps := [.row 11 0 2], last := (11, 2) }
      bp_br := { first := (11, 0), steps := [.row 11 0 4], last := (11, 4) } } }

theorem duplicateCheck16 : duplicateData16.check = true := by
  native_decide

def cut16 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData16 duplicateCheck16

/-- Journal iteration 17; certificate 138fcf7d4bd817d68635976ca45e54b6679998e48e1d8a2050a673cf94bf58b1. -/
def duplicateData17 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {4, 5, 9, 11} },
      { center := 2, support := {5, 8, 10, 11} },
      { center := 4, support := {6, 7, 10, 11} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 7, support := {3, 5, 6, 9} },
      { center := 11, support := {0, 2, 4, 8} }
    ]
    data := {
      p := 0
      q := 2
      r := 4
      a := 5
      b := 11
      ap_aq := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 2, .flip 11 2, .row 2 11 5, .flip 2 5], last := (5, 2) }
      ap_ar := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 4, .flip 11 4, .row 4 11 6, .flip 4 6, .row 6 4 7, .flip 6 7, .row 7 6 5, .flip 7 5, .row 5 7 4], last := (5, 4) }
      bp_bq := { first := (11, 0), steps := [.row 11 0 2], last := (11, 2) }
      bp_br := { first := (11, 0), steps := [.row 11 0 4], last := (11, 4) } } }

theorem duplicateCheck17 : duplicateData17.check = true := by
  native_decide

def cut17 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData17 duplicateCheck17

/-- Journal iteration 18; certificate 60348cf6ac5d94262e257515d1d6a08073ddc29dd40ef97f2f93d7f00977fb50. -/
def duplicateData18 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {4, 5, 9, 11} },
      { center := 2, support := {5, 8, 10, 11} },
      { center := 4, support := {6, 7, 10, 11} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 7, support := {3, 5, 6, 9} },
      { center := 11, support := {0, 2, 4, 6} }
    ]
    data := {
      p := 0
      q := 2
      r := 4
      a := 5
      b := 11
      ap_aq := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 2, .flip 11 2, .row 2 11 5, .flip 2 5], last := (5, 2) }
      ap_ar := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 4, .flip 11 4, .row 4 11 6, .flip 4 6, .row 6 4 7, .flip 6 7, .row 7 6 5, .flip 7 5, .row 5 7 4], last := (5, 4) }
      bp_bq := { first := (11, 0), steps := [.row 11 0 2], last := (11, 2) }
      bp_br := { first := (11, 0), steps := [.row 11 0 4], last := (11, 4) } } }

theorem duplicateCheck18 : duplicateData18.check = true := by
  native_decide

def cut18 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData18 duplicateCheck18

/-- Journal iteration 19; certificate 8609ea5328e8854dc614a96361eb91bb795864fd50e9b9ddd06e6818fc4d20c7. -/
def duplicateData19 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {4, 5, 9, 11} },
      { center := 2, support := {5, 8, 10, 11} },
      { center := 4, support := {6, 7, 10, 11} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 7, support := {3, 5, 6, 9} },
      { center := 8, support := {2, 5, 6, 7} },
      { center := 11, support := {0, 2, 3, 10} }
    ]
    data := {
      p := 0
      q := 2
      r := 4
      a := 5
      b := 11
      ap_aq := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 2, .flip 11 2, .row 2 11 5, .flip 2 5], last := (5, 2) }
      ap_ar := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 2, .flip 11 2, .row 2 11 8, .flip 2 8, .row 8 2 6, .flip 8 6, .row 6 8 7, .flip 6 7, .row 7 6 5, .flip 7 5, .row 5 7 4], last := (5, 4) }
      bp_bq := { first := (11, 0), steps := [.row 11 0 2], last := (11, 2) }
      bp_br := { first := (11, 0), steps := [.row 11 0 2, .flip 11 2, .row 2 11 8, .flip 2 8, .row 8 2 6, .flip 8 6, .row 6 8 4, .flip 6 4, .row 4 6 11, .flip 4 11], last := (11, 4) } } }

theorem duplicateCheck19 : duplicateData19.check = true := by
  native_decide

def cut19 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData19 duplicateCheck19

/-- Journal iteration 20; certificate c42889163d3acd27e564d5dc11bd6329b768d013e3cd0709f20d682a68fe71ec. -/
def duplicateData20 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {4, 5, 9, 11} },
      { center := 2, support := {5, 8, 10, 11} },
      { center := 4, support := {6, 7, 10, 11} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 7, support := {3, 5, 6, 9} },
      { center := 8, support := {2, 5, 6, 7} },
      { center := 11, support := {0, 2, 3, 9} }
    ]
    data := {
      p := 0
      q := 2
      r := 4
      a := 5
      b := 11
      ap_aq := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 2, .flip 11 2, .row 2 11 5, .flip 2 5], last := (5, 2) }
      ap_ar := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 2, .flip 11 2, .row 2 11 8, .flip 2 8, .row 8 2 6, .flip 8 6, .row 6 8 7, .flip 6 7, .row 7 6 5, .flip 7 5, .row 5 7 4], last := (5, 4) }
      bp_bq := { first := (11, 0), steps := [.row 11 0 2], last := (11, 2) }
      bp_br := { first := (11, 0), steps := [.row 11 0 2, .flip 11 2, .row 2 11 8, .flip 2 8, .row 8 2 6, .flip 8 6, .row 6 8 4, .flip 6 4, .row 4 6 11, .flip 4 11], last := (11, 4) } } }

theorem duplicateCheck20 : duplicateData20.check = true := by
  native_decide

def cut20 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData20 duplicateCheck20

/-- Journal iteration 21; certificate a5370ccea1fa07f3669cc4ea2d7e442bc142dd08d050f5d95ef69f9e06bb1b9c. -/
def duplicateData21 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {4, 5, 9, 11} },
      { center := 2, support := {5, 8, 10, 11} },
      { center := 4, support := {6, 7, 10, 11} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 7, support := {3, 5, 6, 9} },
      { center := 8, support := {2, 5, 6, 7} },
      { center := 11, support := {0, 2, 3, 8} }
    ]
    data := {
      p := 0
      q := 2
      r := 4
      a := 5
      b := 11
      ap_aq := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 2, .flip 11 2, .row 2 11 5, .flip 2 5], last := (5, 2) }
      ap_ar := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 2, .flip 11 2, .row 2 11 8, .flip 2 8, .row 8 2 6, .flip 8 6, .row 6 8 7, .flip 6 7, .row 7 6 5, .flip 7 5, .row 5 7 4], last := (5, 4) }
      bp_bq := { first := (11, 0), steps := [.row 11 0 2], last := (11, 2) }
      bp_br := { first := (11, 0), steps := [.row 11 0 2, .flip 11 2, .row 2 11 8, .flip 2 8, .row 8 2 6, .flip 8 6, .row 6 8 4, .flip 6 4, .row 4 6 11, .flip 4 11], last := (11, 4) } } }

theorem duplicateCheck21 : duplicateData21.check = true := by
  native_decide

def cut21 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData21 duplicateCheck21

/-- Journal iteration 22; certificate 19e10187f4cfbccdadaea8e4104fd66e162473fab77a77e0762907440884b6a2. -/
def duplicateData22 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {4, 5, 9, 11} },
      { center := 2, support := {5, 8, 10, 11} },
      { center := 4, support := {6, 7, 10, 11} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 7, support := {3, 5, 6, 9} },
      { center := 8, support := {2, 5, 6, 7} },
      { center := 11, support := {0, 2, 3, 7} }
    ]
    data := {
      p := 0
      q := 2
      r := 4
      a := 5
      b := 11
      ap_aq := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 2, .flip 11 2, .row 2 11 5, .flip 2 5], last := (5, 2) }
      ap_ar := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 2, .flip 11 2, .row 2 11 8, .flip 2 8, .row 8 2 6, .flip 8 6, .row 6 8 7, .flip 6 7, .row 7 6 5, .flip 7 5, .row 5 7 4], last := (5, 4) }
      bp_bq := { first := (11, 0), steps := [.row 11 0 2], last := (11, 2) }
      bp_br := { first := (11, 0), steps := [.row 11 0 2, .flip 11 2, .row 2 11 8, .flip 2 8, .row 8 2 6, .flip 8 6, .row 6 8 4, .flip 6 4, .row 4 6 11, .flip 4 11], last := (11, 4) } } }

theorem duplicateCheck22 : duplicateData22.check = true := by
  native_decide

def cut22 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData22 duplicateCheck22

/-- Journal iteration 23; certificate 6c5a031f494e013f42b71a097e544e8f0f7598eae4893107537fffd85accbcc3. -/
def duplicateData23 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {4, 5, 9, 11} },
      { center := 2, support := {5, 8, 10, 11} },
      { center := 4, support := {6, 7, 10, 11} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 7, support := {3, 5, 6, 9} },
      { center := 8, support := {2, 5, 6, 7} },
      { center := 11, support := {0, 2, 3, 5} }
    ]
    data := {
      p := 0
      q := 2
      r := 4
      a := 5
      b := 11
      ap_aq := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 2, .flip 11 2, .row 2 11 5, .flip 2 5], last := (5, 2) }
      ap_ar := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 2, .flip 11 2, .row 2 11 8, .flip 2 8, .row 8 2 6, .flip 8 6, .row 6 8 7, .flip 6 7, .row 7 6 5, .flip 7 5, .row 5 7 4], last := (5, 4) }
      bp_bq := { first := (11, 0), steps := [.row 11 0 2], last := (11, 2) }
      bp_br := { first := (11, 0), steps := [.row 11 0 2, .flip 11 2, .row 2 11 8, .flip 2 8, .row 8 2 6, .flip 8 6, .row 6 8 4, .flip 6 4, .row 4 6 11, .flip 4 11], last := (11, 4) } } }

theorem duplicateCheck23 : duplicateData23.check = true := by
  native_decide

def cut23 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData23 duplicateCheck23

/-- Journal iteration 24; certificate 5c299826cf172361a23bcbae008fcd6ff633d295bcf022d681feee73415295c9. -/
def duplicateData24 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {4, 5, 9, 11} },
      { center := 2, support := {5, 8, 10, 11} },
      { center := 4, support := {6, 7, 10, 11} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 7, support := {3, 5, 6, 9} },
      { center := 11, support := {0, 2, 3, 4} }
    ]
    data := {
      p := 0
      q := 2
      r := 4
      a := 5
      b := 11
      ap_aq := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 2, .flip 11 2, .row 2 11 5, .flip 2 5], last := (5, 2) }
      ap_ar := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 4, .flip 11 4, .row 4 11 6, .flip 4 6, .row 6 4 7, .flip 6 7, .row 7 6 5, .flip 7 5, .row 5 7 4], last := (5, 4) }
      bp_bq := { first := (11, 0), steps := [.row 11 0 2], last := (11, 2) }
      bp_br := { first := (11, 0), steps := [.row 11 0 4], last := (11, 4) } } }

theorem duplicateCheck24 : duplicateData24.check = true := by
  native_decide

def cut24 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData24 duplicateCheck24

/-- Journal iteration 25; certificate d5453c7e03ee2e29e6f3cab1b20f61b5229be2f87699204dad07cda4134044f5. -/
def duplicateData25 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 2, support := {5, 8, 10, 11} },
      { center := 3, support := {6, 8, 9, 10} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 7, support := {3, 5, 6, 9} },
      { center := 8, support := {2, 5, 6, 7} },
      { center := 10, support := {1, 2, 3, 11} }
    ]
    data := {
      p := 2
      q := 3
      r := 5
      a := 8
      b := 10
      ap_aq := { first := (8, 2), steps := [.flip 8 2, .row 2 8 10, .flip 2 10, .row 10 2 3, .flip 10 3, .row 3 10 8, .flip 3 8], last := (8, 3) }
      ap_ar := { first := (8, 2), steps := [.row 8 2 5], last := (8, 5) }
      bp_bq := { first := (10, 2), steps := [.row 10 2 3], last := (10, 3) }
      bp_br := { first := (10, 2), steps := [.flip 10 2, .row 2 10 8, .flip 2 8, .row 8 2 6, .flip 8 6, .row 6 8 7, .flip 6 7, .row 7 6 5, .flip 7 5, .row 5 7 10, .flip 5 10], last := (10, 5) } } }

theorem duplicateCheck25 : duplicateData25.check = true := by
  native_decide

def cut25 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData25 duplicateCheck25

/-- Journal iteration 26; certificate 496628a4f1b567b6a70fa1441ae3405b22e48aa7742a658009a20fc3e39be1e8. -/
def duplicateData26 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 2, support := {5, 8, 10, 11} },
      { center := 3, support := {6, 8, 9, 10} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 7, support := {3, 5, 6, 9} },
      { center := 8, support := {2, 5, 6, 7} },
      { center := 10, support := {1, 2, 3, 9} }
    ]
    data := {
      p := 2
      q := 3
      r := 5
      a := 8
      b := 10
      ap_aq := { first := (8, 2), steps := [.flip 8 2, .row 2 8 10, .flip 2 10, .row 10 2 3, .flip 10 3, .row 3 10 8, .flip 3 8], last := (8, 3) }
      ap_ar := { first := (8, 2), steps := [.row 8 2 5], last := (8, 5) }
      bp_bq := { first := (10, 2), steps := [.row 10 2 3], last := (10, 3) }
      bp_br := { first := (10, 2), steps := [.flip 10 2, .row 2 10 8, .flip 2 8, .row 8 2 6, .flip 8 6, .row 6 8 7, .flip 6 7, .row 7 6 5, .flip 7 5, .row 5 7 10, .flip 5 10], last := (10, 5) } } }

theorem duplicateCheck26 : duplicateData26.check = true := by
  native_decide

def cut26 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData26 duplicateCheck26

/-- Journal iteration 27; certificate 8317a9475f89e1efd785eae5f53f02d847ebba79cf95cf759d1230366e22ad2f. -/
def duplicateData27 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 2, support := {5, 8, 10, 11} },
      { center := 3, support := {6, 8, 9, 10} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 7, support := {3, 5, 6, 9} },
      { center := 8, support := {2, 5, 6, 7} },
      { center := 10, support := {1, 2, 3, 8} }
    ]
    data := {
      p := 2
      q := 3
      r := 5
      a := 8
      b := 10
      ap_aq := { first := (8, 2), steps := [.flip 8 2, .row 2 8 10, .flip 2 10, .row 10 2 3, .flip 10 3, .row 3 10 8, .flip 3 8], last := (8, 3) }
      ap_ar := { first := (8, 2), steps := [.row 8 2 5], last := (8, 5) }
      bp_bq := { first := (10, 2), steps := [.row 10 2 3], last := (10, 3) }
      bp_br := { first := (10, 2), steps := [.flip 10 2, .row 2 10 8, .flip 2 8, .row 8 2 6, .flip 8 6, .row 6 8 7, .flip 6 7, .row 7 6 5, .flip 7 5, .row 5 7 10, .flip 5 10], last := (10, 5) } } }

theorem duplicateCheck27 : duplicateData27.check = true := by
  native_decide

def cut27 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData27 duplicateCheck27

/-- Journal iteration 28; certificate b1e1fe45a25da1996a5ad522580d03b25057bd902d76fc9ba4976ac884dff770. -/
def duplicateData28 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 2, support := {5, 8, 10, 11} },
      { center := 3, support := {6, 8, 9, 10} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 7, support := {3, 5, 6, 9} },
      { center := 8, support := {2, 5, 6, 7} },
      { center := 10, support := {1, 2, 3, 7} }
    ]
    data := {
      p := 2
      q := 3
      r := 5
      a := 8
      b := 10
      ap_aq := { first := (8, 2), steps := [.flip 8 2, .row 2 8 10, .flip 2 10, .row 10 2 3, .flip 10 3, .row 3 10 8, .flip 3 8], last := (8, 3) }
      ap_ar := { first := (8, 2), steps := [.row 8 2 5], last := (8, 5) }
      bp_bq := { first := (10, 2), steps := [.row 10 2 3], last := (10, 3) }
      bp_br := { first := (10, 2), steps := [.flip 10 2, .row 2 10 8, .flip 2 8, .row 8 2 6, .flip 8 6, .row 6 8 7, .flip 6 7, .row 7 6 5, .flip 7 5, .row 5 7 10, .flip 5 10], last := (10, 5) } } }

theorem duplicateCheck28 : duplicateData28.check = true := by
  native_decide

def cut28 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData28 duplicateCheck28

/-- Journal iteration 29; certificate bb6242b14dc0a9438895d589cdea33e3fdb132a32e2e82c5fd56447fa3681677. -/
def duplicateData29 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 2, support := {5, 8, 10, 11} },
      { center := 3, support := {6, 8, 9, 10} },
      { center := 8, support := {2, 5, 6, 7} },
      { center := 10, support := {1, 2, 3, 5} }
    ]
    data := {
      p := 2
      q := 3
      r := 5
      a := 8
      b := 10
      ap_aq := { first := (8, 2), steps := [.flip 8 2, .row 2 8 10, .flip 2 10, .row 10 2 3, .flip 10 3, .row 3 10 8, .flip 3 8], last := (8, 3) }
      ap_ar := { first := (8, 2), steps := [.row 8 2 5], last := (8, 5) }
      bp_bq := { first := (10, 2), steps := [.row 10 2 3], last := (10, 3) }
      bp_br := { first := (10, 2), steps := [.row 10 2 5], last := (10, 5) } } }

theorem duplicateCheck29 : duplicateData29.check = true := by
  native_decide

def cut29 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData29 duplicateCheck29

/-- Journal iteration 30; certificate 74b5cd5d9a1854f689d8ffe2060461ae82635b83dadf1d6151c3947b678a848e. -/
def duplicateData30 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 2, support := {5, 8, 10, 11} },
      { center := 3, support := {6, 8, 9, 10} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 7, support := {3, 5, 6, 9} },
      { center := 8, support := {2, 5, 6, 7} },
      { center := 10, support := {1, 2, 3, 4} }
    ]
    data := {
      p := 2
      q := 3
      r := 5
      a := 8
      b := 10
      ap_aq := { first := (8, 2), steps := [.flip 8 2, .row 2 8 10, .flip 2 10, .row 10 2 3, .flip 10 3, .row 3 10 8, .flip 3 8], last := (8, 3) }
      ap_ar := { first := (8, 2), steps := [.row 8 2 5], last := (8, 5) }
      bp_bq := { first := (10, 2), steps := [.row 10 2 3], last := (10, 3) }
      bp_br := { first := (10, 2), steps := [.flip 10 2, .row 2 10 8, .flip 2 8, .row 8 2 6, .flip 8 6, .row 6 8 7, .flip 6 7, .row 7 6 5, .flip 7 5, .row 5 7 10, .flip 5 10], last := (10, 5) } } }

theorem duplicateCheck30 : duplicateData30.check = true := by
  native_decide

def cut30 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData30 duplicateCheck30

/-- Journal iteration 31; certificate cdf081e500eb6d06fdf7e161972059efabdb128430fe0a89d06be89c0c76ec0a. -/
def duplicateData31 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 2, support := {5, 8, 10, 11} },
      { center := 4, support := {6, 7, 10, 11} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 7, support := {3, 5, 6, 9} },
      { center := 8, support := {2, 5, 6, 7} },
      { center := 11, support := {2, 3, 5, 10} }
    ]
    data := {
      p := 2
      q := 4
      r := 5
      a := 10
      b := 11
      ap_aq := { first := (10, 2), steps := [.flip 10 2, .row 2 10 8, .flip 2 8, .row 8 2 6, .flip 8 6, .row 6 8 4, .flip 6 4, .row 4 6 10, .flip 4 10], last := (10, 4) }
      ap_ar := { first := (10, 2), steps := [.flip 10 2, .row 2 10 8, .flip 2 8, .row 8 2 6, .flip 8 6, .row 6 8 7, .flip 6 7, .row 7 6 5, .flip 7 5, .row 5 7 10, .flip 5 10], last := (10, 5) }
      bp_bq := { first := (11, 2), steps := [.flip 11 2, .row 2 11 8, .flip 2 8, .row 8 2 6, .flip 8 6, .row 6 8 4, .flip 6 4, .row 4 6 11, .flip 4 11], last := (11, 4) }
      bp_br := { first := (11, 2), steps := [.row 11 2 5], last := (11, 5) } } }

theorem duplicateCheck31 : duplicateData31.check = true := by
  native_decide

def cut31 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData31 duplicateCheck31

/-- Journal iteration 32; certificate 59a0fa7e8ff53f90f79b919057787728989929af66e002a9136a81469f178c02. -/
def duplicateData32 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 2, support := {5, 8, 10, 11} },
      { center := 4, support := {6, 7, 10, 11} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 7, support := {3, 5, 6, 9} },
      { center := 8, support := {2, 5, 6, 7} },
      { center := 10, support := {0, 4, 6, 8} }
    ]
    data := {
      p := 2
      q := 4
      r := 6
      a := 5
      b := 10
      ap_aq := { first := (5, 2), steps := [.flip 5 2, .row 2 5 8, .flip 2 8, .row 8 2 6, .flip 8 6, .row 6 8 7, .flip 6 7, .row 7 6 5, .flip 7 5, .row 5 7 4], last := (5, 4) }
      ap_ar := { first := (5, 2), steps := [.flip 5 2, .row 2 5 8, .flip 2 8, .row 8 2 6, .flip 8 6, .row 6 8 5, .flip 6 5], last := (5, 6) }
      bp_bq := { first := (10, 2), steps := [.flip 10 2, .row 2 10 8, .flip 2 8, .row 8 2 6, .flip 8 6, .row 6 8 4, .flip 6 4, .row 4 6 10, .flip 4 10], last := (10, 4) }
      bp_br := { first := (10, 2), steps := [.flip 10 2, .row 2 10 8, .flip 2 8, .row 8 2 6, .flip 8 6, .row 6 8 4, .flip 6 4, .row 4 6 10, .flip 4 10, .row 10 4 6], last := (10, 6) } } }

theorem duplicateCheck32 : duplicateData32.check = true := by
  native_decide

def cut32 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData32 duplicateCheck32

/-- Journal iteration 33; certificate de5f182ac41d882ce8a7e84758e74512c2b227d2b9ce3139a0c806aca66378b2. -/
def duplicateData33 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 2, support := {5, 8, 10, 11} },
      { center := 3, support := {6, 8, 9, 10} },
      { center := 4, support := {6, 7, 10, 11} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 7, support := {3, 5, 6, 9} },
      { center := 8, support := {2, 5, 6, 7} },
      { center := 10, support := {0, 3, 4, 8} }
    ]
    data := {
      p := 2
      q := 3
      r := 5
      a := 8
      b := 10
      ap_aq := { first := (8, 2), steps := [.row 8 2 6, .flip 8 6, .row 6 8 4, .flip 6 4, .row 4 6 10, .flip 4 10, .row 10 4 3, .flip 10 3, .row 3 10 8, .flip 3 8], last := (8, 3) }
      ap_ar := { first := (8, 2), steps := [.row 8 2 5], last := (8, 5) }
      bp_bq := { first := (10, 2), steps := [.flip 10 2, .row 2 10 8, .flip 2 8, .row 8 2 6, .flip 8 6, .row 6 8 4, .flip 6 4, .row 4 6 10, .flip 4 10, .row 10 4 3], last := (10, 3) }
      bp_br := { first := (10, 2), steps := [.flip 10 2, .row 2 10 8, .flip 2 8, .row 8 2 6, .flip 8 6, .row 6 8 7, .flip 6 7, .row 7 6 5, .flip 7 5, .row 5 7 10, .flip 5 10], last := (10, 5) } } }

theorem duplicateCheck33 : duplicateData33.check = true := by
  native_decide

def cut33 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData33 duplicateCheck33

/-- Journal iteration 34; certificate fc19fd95c3fd97864887922f73e9a36172cea967b7ce2068a2bd3a18d4ea951e. -/
def duplicateData34 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 2, support := {5, 8, 10, 11} },
      { center := 4, support := {6, 7, 10, 11} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 7, support := {3, 5, 6, 9} },
      { center := 8, support := {2, 5, 6, 7} },
      { center := 10, support := {0, 2, 6, 8} }
    ]
    data := {
      p := 2
      q := 4
      r := 6
      a := 5
      b := 10
      ap_aq := { first := (5, 2), steps := [.flip 5 2, .row 2 5 8, .flip 2 8, .row 8 2 6, .flip 8 6, .row 6 8 7, .flip 6 7, .row 7 6 5, .flip 7 5, .row 5 7 4], last := (5, 4) }
      ap_ar := { first := (5, 2), steps := [.flip 5 2, .row 2 5 8, .flip 2 8, .row 8 2 6, .flip 8 6, .row 6 8 5, .flip 6 5], last := (5, 6) }
      bp_bq := { first := (10, 2), steps := [.flip 10 2, .row 2 10 8, .flip 2 8, .row 8 2 6, .flip 8 6, .row 6 8 4, .flip 6 4, .row 4 6 10, .flip 4 10], last := (10, 4) }
      bp_br := { first := (10, 2), steps := [.row 10 2 6], last := (10, 6) } } }

theorem duplicateCheck34 : duplicateData34.check = true := by
  native_decide

def cut34 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData34 duplicateCheck34

/-- Journal iteration 35; certificate 261948d1eff819bd97afaf9dbf16fe1e2099f6f2cea710469ebf7bcee433952a. -/
def duplicateData35 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 2, support := {5, 8, 10, 11} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 7, support := {3, 5, 6, 9} },
      { center := 8, support := {2, 5, 6, 7} },
      { center := 10, support := {0, 2, 4, 8} }
    ]
    data := {
      p := 2
      q := 4
      r := 8
      a := 5
      b := 10
      ap_aq := { first := (5, 2), steps := [.flip 5 2, .row 2 5 8, .flip 2 8, .row 8 2 6, .flip 8 6, .row 6 8 7, .flip 6 7, .row 7 6 5, .flip 7 5, .row 5 7 4], last := (5, 4) }
      ap_ar := { first := (5, 2), steps := [.flip 5 2, .row 2 5 8, .flip 2 8, .row 8 2 5, .flip 8 5], last := (5, 8) }
      bp_bq := { first := (10, 2), steps := [.row 10 2 4], last := (10, 4) }
      bp_br := { first := (10, 2), steps := [.row 10 2 8], last := (10, 8) } } }

theorem duplicateCheck35 : duplicateData35.check = true := by
  native_decide

def cut35 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData35 duplicateCheck35

/-- Journal iteration 36; certificate 3293f3221ea58a62315efb19885da875fe0b6a0f6cb04f8a9cc9cef86ac58c91. -/
def duplicateData36 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 2, support := {5, 8, 10, 11} },
      { center := 4, support := {6, 7, 10, 11} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 7, support := {3, 5, 6, 9} },
      { center := 10, support := {0, 2, 4, 6} }
    ]
    data := {
      p := 2
      q := 4
      r := 6
      a := 5
      b := 10
      ap_aq := { first := (5, 2), steps := [.flip 5 2, .row 2 5 10, .flip 2 10, .row 10 2 4, .flip 10 4, .row 4 10 6, .flip 4 6, .row 6 4 7, .flip 6 7, .row 7 6 5, .flip 7 5, .row 5 7 4], last := (5, 4) }
      ap_ar := { first := (5, 2), steps := [.flip 5 2, .row 2 5 10, .flip 2 10, .row 10 2 4, .flip 10 4, .row 4 10 6, .flip 4 6, .row 6 4 5, .flip 6 5], last := (5, 6) }
      bp_bq := { first := (10, 2), steps := [.row 10 2 4], last := (10, 4) }
      bp_br := { first := (10, 2), steps := [.row 10 2 6], last := (10, 6) } } }

theorem duplicateCheck36 : duplicateData36.check = true := by
  native_decide

def cut36 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData36 duplicateCheck36

/-- Journal iteration 37; certificate d52124f97b3efc88e5a76f96420fd47990b708defd7c29bc3aaeaa09df058bd3. -/
def duplicateData37 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 2, support := {5, 8, 10, 11} },
      { center := 3, support := {6, 8, 9, 10} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 7, support := {3, 5, 6, 9} },
      { center := 8, support := {2, 5, 6, 7} },
      { center := 10, support := {0, 2, 3, 11} }
    ]
    data := {
      p := 2
      q := 3
      r := 5
      a := 8
      b := 10
      ap_aq := { first := (8, 2), steps := [.flip 8 2, .row 2 8 10, .flip 2 10, .row 10 2 3, .flip 10 3, .row 3 10 8, .flip 3 8], last := (8, 3) }
      ap_ar := { first := (8, 2), steps := [.row 8 2 5], last := (8, 5) }
      bp_bq := { first := (10, 2), steps := [.row 10 2 3], last := (10, 3) }
      bp_br := { first := (10, 2), steps := [.flip 10 2, .row 2 10 8, .flip 2 8, .row 8 2 6, .flip 8 6, .row 6 8 7, .flip 6 7, .row 7 6 5, .flip 7 5, .row 5 7 10, .flip 5 10], last := (10, 5) } } }

theorem duplicateCheck37 : duplicateData37.check = true := by
  native_decide

def cut37 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData37 duplicateCheck37

/-- Journal iteration 38; certificate 1f9cf05d6fc75606bfd455c24dd820a95179525259668effa23396b2034af5c0. -/
def duplicateData38 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 2, support := {5, 8, 10, 11} },
      { center := 3, support := {6, 8, 9, 10} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 7, support := {3, 5, 6, 9} },
      { center := 8, support := {2, 5, 6, 7} },
      { center := 10, support := {0, 2, 3, 9} }
    ]
    data := {
      p := 2
      q := 3
      r := 5
      a := 8
      b := 10
      ap_aq := { first := (8, 2), steps := [.flip 8 2, .row 2 8 10, .flip 2 10, .row 10 2 3, .flip 10 3, .row 3 10 8, .flip 3 8], last := (8, 3) }
      ap_ar := { first := (8, 2), steps := [.row 8 2 5], last := (8, 5) }
      bp_bq := { first := (10, 2), steps := [.row 10 2 3], last := (10, 3) }
      bp_br := { first := (10, 2), steps := [.flip 10 2, .row 2 10 8, .flip 2 8, .row 8 2 6, .flip 8 6, .row 6 8 7, .flip 6 7, .row 7 6 5, .flip 7 5, .row 5 7 10, .flip 5 10], last := (10, 5) } } }

theorem duplicateCheck38 : duplicateData38.check = true := by
  native_decide

def cut38 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData38 duplicateCheck38

/-- Journal iteration 39; certificate 46c444ced113a196d1b87df38fdc052574bc78feae8aabb74db2eb6807b0d036. -/
def duplicateData39 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 2, support := {5, 8, 10, 11} },
      { center := 3, support := {6, 8, 9, 10} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 7, support := {3, 5, 6, 9} },
      { center := 8, support := {2, 5, 6, 7} },
      { center := 10, support := {0, 2, 3, 8} }
    ]
    data := {
      p := 2
      q := 3
      r := 5
      a := 8
      b := 10
      ap_aq := { first := (8, 2), steps := [.flip 8 2, .row 2 8 10, .flip 2 10, .row 10 2 3, .flip 10 3, .row 3 10 8, .flip 3 8], last := (8, 3) }
      ap_ar := { first := (8, 2), steps := [.row 8 2 5], last := (8, 5) }
      bp_bq := { first := (10, 2), steps := [.row 10 2 3], last := (10, 3) }
      bp_br := { first := (10, 2), steps := [.flip 10 2, .row 2 10 8, .flip 2 8, .row 8 2 6, .flip 8 6, .row 6 8 7, .flip 6 7, .row 7 6 5, .flip 7 5, .row 5 7 10, .flip 5 10], last := (10, 5) } } }

theorem duplicateCheck39 : duplicateData39.check = true := by
  native_decide

def cut39 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData39 duplicateCheck39

/-- Journal iteration 40; certificate ec4bffe6aa5b1bcde29fc7491f22f55ec4cd544be65b9675d7632d3f5ba07ebc. -/
def duplicateData40 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 2, support := {5, 8, 10, 11} },
      { center := 3, support := {6, 8, 9, 10} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 7, support := {3, 5, 6, 9} },
      { center := 8, support := {2, 5, 6, 7} },
      { center := 10, support := {0, 2, 3, 7} }
    ]
    data := {
      p := 2
      q := 3
      r := 5
      a := 8
      b := 10
      ap_aq := { first := (8, 2), steps := [.flip 8 2, .row 2 8 10, .flip 2 10, .row 10 2 3, .flip 10 3, .row 3 10 8, .flip 3 8], last := (8, 3) }
      ap_ar := { first := (8, 2), steps := [.row 8 2 5], last := (8, 5) }
      bp_bq := { first := (10, 2), steps := [.row 10 2 3], last := (10, 3) }
      bp_br := { first := (10, 2), steps := [.flip 10 2, .row 2 10 8, .flip 2 8, .row 8 2 6, .flip 8 6, .row 6 8 7, .flip 6 7, .row 7 6 5, .flip 7 5, .row 5 7 10, .flip 5 10], last := (10, 5) } } }

theorem duplicateCheck40 : duplicateData40.check = true := by
  native_decide

def cut40 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData40 duplicateCheck40

/-- Journal iteration 41; certificate b0425c361a2f45c036c1b694529e8aacd80947ba7bf368def105dd1f22c8d0d8. -/
def duplicateData41 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 2, support := {5, 8, 10, 11} },
      { center := 3, support := {6, 8, 9, 10} },
      { center := 8, support := {2, 5, 6, 7} },
      { center := 10, support := {0, 2, 3, 5} }
    ]
    data := {
      p := 2
      q := 3
      r := 5
      a := 8
      b := 10
      ap_aq := { first := (8, 2), steps := [.flip 8 2, .row 2 8 10, .flip 2 10, .row 10 2 3, .flip 10 3, .row 3 10 8, .flip 3 8], last := (8, 3) }
      ap_ar := { first := (8, 2), steps := [.row 8 2 5], last := (8, 5) }
      bp_bq := { first := (10, 2), steps := [.row 10 2 3], last := (10, 3) }
      bp_br := { first := (10, 2), steps := [.row 10 2 5], last := (10, 5) } } }

theorem duplicateCheck41 : duplicateData41.check = true := by
  native_decide

def cut41 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData41 duplicateCheck41

/-- Journal iteration 42; certificate 73c015d06725a355d17f418972800004a97f10b746ff37cf4f2c0e0550d6329b. -/
def duplicateData42 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 2, support := {5, 8, 10, 11} },
      { center := 3, support := {6, 8, 9, 10} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 7, support := {3, 5, 6, 9} },
      { center := 8, support := {2, 5, 6, 7} },
      { center := 10, support := {0, 2, 3, 4} }
    ]
    data := {
      p := 2
      q := 3
      r := 5
      a := 8
      b := 10
      ap_aq := { first := (8, 2), steps := [.flip 8 2, .row 2 8 10, .flip 2 10, .row 10 2 3, .flip 10 3, .row 3 10 8, .flip 3 8], last := (8, 3) }
      ap_ar := { first := (8, 2), steps := [.row 8 2 5], last := (8, 5) }
      bp_bq := { first := (10, 2), steps := [.row 10 2 3], last := (10, 3) }
      bp_br := { first := (10, 2), steps := [.flip 10 2, .row 2 10 8, .flip 2 8, .row 8 2 6, .flip 8 6, .row 6 8 7, .flip 6 7, .row 7 6 5, .flip 7 5, .row 5 7 10, .flip 5 10], last := (10, 5) } } }

theorem duplicateCheck42 : duplicateData42.check = true := by
  native_decide

def cut42 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData42 duplicateCheck42

/-- Journal iteration 43; certificate 488014411e354027550ed6f4db103f441e352399c45c94b70d0af50f027ec110. -/
def duplicateData43 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 2, support := {5, 8, 10, 11} },
      { center := 4, support := {6, 7, 10, 11} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 7, support := {3, 5, 6, 9} },
      { center := 11, support := {2, 3, 4, 10} }
    ]
    data := {
      p := 2
      q := 4
      r := 10
      a := 5
      b := 11
      ap_aq := { first := (5, 2), steps := [.flip 5 2, .row 2 5 11, .flip 2 11, .row 11 2 4, .flip 11 4, .row 4 11 6, .flip 4 6, .row 6 4 7, .flip 6 7, .row 7 6 5, .flip 7 5, .row 5 7 4], last := (5, 4) }
      ap_ar := { first := (5, 2), steps := [.flip 5 2, .row 2 5 11, .flip 2 11, .row 11 2 4, .flip 11 4, .row 4 11 6, .flip 4 6, .row 6 4 7, .flip 6 7, .row 7 6 5, .flip 7 5, .row 5 7 10], last := (5, 10) }
      bp_bq := { first := (11, 2), steps := [.row 11 2 4], last := (11, 4) }
      bp_br := { first := (11, 2), steps := [.row 11 2 10], last := (11, 10) } } }

theorem duplicateCheck43 : duplicateData43.check = true := by
  native_decide

def cut43 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData43 duplicateCheck43

/-- Journal iteration 44; certificate 8370d8b1c78502c12859160af3066a94a2054413721afb06ec862a0ff579fe98. -/
def duplicateData44 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 2, support := {5, 8, 10, 11} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 7, support := {3, 5, 6, 9} },
      { center := 8, support := {2, 5, 6, 7} },
      { center := 11, support := {2, 3, 4, 8} }
    ]
    data := {
      p := 2
      q := 4
      r := 8
      a := 5
      b := 11
      ap_aq := { first := (5, 2), steps := [.flip 5 2, .row 2 5 8, .flip 2 8, .row 8 2 6, .flip 8 6, .row 6 8 7, .flip 6 7, .row 7 6 5, .flip 7 5, .row 5 7 4], last := (5, 4) }
      ap_ar := { first := (5, 2), steps := [.flip 5 2, .row 2 5 8, .flip 2 8, .row 8 2 5, .flip 8 5], last := (5, 8) }
      bp_bq := { first := (11, 2), steps := [.row 11 2 4], last := (11, 4) }
      bp_br := { first := (11, 2), steps := [.row 11 2 8], last := (11, 8) } } }

theorem duplicateCheck44 : duplicateData44.check = true := by
  native_decide

def cut44 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData44 duplicateCheck44

/-- Journal iteration 45; certificate 802ebe2e8c0c3df1fb1c06c4d765e7628ce02588ab99ffcc2902f79eab41f8cd. -/
def duplicateData45 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 2, support := {5, 8, 10, 11} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 7, support := {3, 5, 6, 9} },
      { center := 8, support := {2, 5, 6, 7} }
    ]
    data := {
      p := 2
      q := 6
      r := 7
      a := 5
      b := 8
      ap_aq := { first := (5, 2), steps := [.flip 5 2, .row 2 5 8, .flip 2 8, .row 8 2 6, .flip 8 6, .row 6 8 5, .flip 6 5], last := (5, 6) }
      ap_ar := { first := (5, 2), steps := [.flip 5 2, .row 2 5 8, .flip 2 8, .row 8 2 6, .flip 8 6, .row 6 8 7, .flip 6 7, .row 7 6 5, .flip 7 5], last := (5, 7) }
      bp_bq := { first := (8, 2), steps := [.row 8 2 6], last := (8, 6) }
      bp_br := { first := (8, 2), steps := [.row 8 2 7], last := (8, 7) } } }

theorem duplicateCheck45 : duplicateData45.check = true := by
  native_decide

def cut45 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData45 duplicateCheck45

/-- Journal iteration 46; certificate f5f94230d746c87b75eedc0a7f9cd03f5acbfc9987ff143335490e60d2ec2b2b. -/
def duplicateData46 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 2, support := {5, 8, 10, 11} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 7, support := {3, 5, 6, 9} },
      { center := 8, support := {2, 4, 6, 11} }
    ]
    data := {
      p := 2
      q := 4
      r := 6
      a := 5
      b := 8
      ap_aq := { first := (5, 2), steps := [.flip 5 2, .row 2 5 8, .flip 2 8, .row 8 2 6, .flip 8 6, .row 6 8 7, .flip 6 7, .row 7 6 5, .flip 7 5, .row 5 7 4], last := (5, 4) }
      ap_ar := { first := (5, 2), steps := [.flip 5 2, .row 2 5 8, .flip 2 8, .row 8 2 6, .flip 8 6, .row 6 8 5, .flip 6 5], last := (5, 6) }
      bp_bq := { first := (8, 2), steps := [.row 8 2 4], last := (8, 4) }
      bp_br := { first := (8, 2), steps := [.row 8 2 6], last := (8, 6) } } }

theorem duplicateCheck46 : duplicateData46.check = true := by
  native_decide

def cut46 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData46 duplicateCheck46

/-- Journal iteration 47; certificate 2a4fe410d88396a9627103eabea874738256386113db5b91ac912fd5b60426af. -/
def duplicateData47 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 2, support := {5, 8, 10, 11} },
      { center := 3, support := {6, 8, 9, 10} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 7, support := {3, 5, 6, 9} },
      { center := 8, support := {2, 3, 6, 11} },
      { center := 9, support := {2, 5, 6, 7} }
    ]
    data := {
      p := 2
      q := 3
      r := 5
      a := 9
      b := 10
      ap_aq := { first := (9, 2), steps := [.row 9 2 7, .flip 9 7, .row 7 9 6, .flip 7 6, .row 6 7 8, .flip 6 8, .row 8 6 3, .flip 8 3, .row 3 8 9, .flip 3 9], last := (9, 3) }
      ap_ar := { first := (9, 2), steps := [.row 9 2 5], last := (9, 5) }
      bp_bq := { first := (10, 2), steps := [.flip 10 2, .row 2 10 8, .flip 2 8, .row 8 2 3, .flip 8 3, .row 3 8 10, .flip 3 10], last := (10, 3) }
      bp_br := { first := (10, 2), steps := [.flip 10 2, .row 2 10 8, .flip 2 8, .row 8 2 6, .flip 8 6, .row 6 8 7, .flip 6 7, .row 7 6 5, .flip 7 5, .row 5 7 10, .flip 5 10], last := (10, 5) } } }

theorem duplicateCheck47 : duplicateData47.check = true := by
  native_decide

def cut47 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData47 duplicateCheck47

/-- Journal iteration 48; certificate 33273bf00da75a22f2a9d78ecff956b23d89d8d27cbe06a164963048181e007d. -/
def duplicateData48 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {4, 5, 9, 11} },
      { center := 2, support := {5, 8, 10, 11} },
      { center := 4, support := {6, 7, 10, 11} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 7, support := {3, 5, 6, 9} },
      { center := 8, support := {2, 3, 6, 11} },
      { center := 11, support := {0, 3, 4, 10} }
    ]
    data := {
      p := 0
      q := 2
      r := 4
      a := 5
      b := 11
      ap_aq := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 4, .flip 11 4, .row 4 11 6, .flip 4 6, .row 6 4 8, .flip 6 8, .row 8 6 2, .flip 8 2, .row 2 8 5, .flip 2 5], last := (5, 2) }
      ap_ar := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 4, .flip 11 4, .row 4 11 6, .flip 4 6, .row 6 4 7, .flip 6 7, .row 7 6 5, .flip 7 5, .row 5 7 4], last := (5, 4) }
      bp_bq := { first := (11, 0), steps := [.row 11 0 4, .flip 11 4, .row 4 11 6, .flip 4 6, .row 6 4 8, .flip 6 8, .row 8 6 2, .flip 8 2, .row 2 8 11, .flip 2 11], last := (11, 2) }
      bp_br := { first := (11, 0), steps := [.row 11 0 4], last := (11, 4) } } }

theorem duplicateCheck48 : duplicateData48.check = true := by
  native_decide

def cut48 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData48 duplicateCheck48

/-- Journal iteration 49; certificate c281d846761573daee85d57272b1e70859c885aa8b65fa63e0a9c0a871a806ec. -/
def duplicateData49 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {4, 5, 9, 11} },
      { center := 2, support := {5, 8, 10, 11} },
      { center := 4, support := {6, 7, 10, 11} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 7, support := {3, 5, 6, 9} },
      { center := 8, support := {2, 3, 6, 11} },
      { center := 11, support := {0, 2, 5, 10} }
    ]
    data := {
      p := 0
      q := 2
      r := 4
      a := 5
      b := 11
      ap_aq := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 2, .flip 11 2, .row 2 11 5, .flip 2 5], last := (5, 2) }
      ap_ar := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 2, .flip 11 2, .row 2 11 8, .flip 2 8, .row 8 2 6, .flip 8 6, .row 6 8 7, .flip 6 7, .row 7 6 5, .flip 7 5, .row 5 7 4], last := (5, 4) }
      bp_bq := { first := (11, 0), steps := [.row 11 0 2], last := (11, 2) }
      bp_br := { first := (11, 0), steps := [.row 11 0 2, .flip 11 2, .row 2 11 8, .flip 2 8, .row 8 2 6, .flip 8 6, .row 6 8 4, .flip 6 4, .row 4 6 11, .flip 4 11], last := (11, 4) } } }

theorem duplicateCheck49 : duplicateData49.check = true := by
  native_decide

def cut49 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData49 duplicateCheck49

/-- Journal iteration 50; certificate cbe125a2b4c883b40a6bd71383a0d2800c47a4dc6a6cef8d4268327d7797b8f4. -/
def duplicateData50 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 2, support := {5, 8, 10, 11} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 7, support := {3, 5, 6, 9} },
      { center := 8, support := {2, 3, 6, 11} },
      { center := 9, support := {2, 4, 6, 8} }
    ]
    data := {
      p := 2
      q := 4
      r := 6
      a := 5
      b := 9
      ap_aq := { first := (5, 2), steps := [.flip 5 2, .row 2 5 8, .flip 2 8, .row 8 2 6, .flip 8 6, .row 6 8 7, .flip 6 7, .row 7 6 5, .flip 7 5, .row 5 7 4], last := (5, 4) }
      ap_ar := { first := (5, 2), steps := [.flip 5 2, .row 2 5 8, .flip 2 8, .row 8 2 6, .flip 8 6, .row 6 8 5, .flip 6 5], last := (5, 6) }
      bp_bq := { first := (9, 2), steps := [.row 9 2 4], last := (9, 4) }
      bp_br := { first := (9, 2), steps := [.row 9 2 6], last := (9, 6) } } }

theorem duplicateCheck50 : duplicateData50.check = true := by
  native_decide

def cut50 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData50 duplicateCheck50

/-- Journal iteration 51; certificate f9e6d9f906bcb6de03de5718cee46288804387d736c2e6ec6b7ee6f4cdc8cf7c. -/
def duplicateData51 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {4, 5, 9, 11} },
      { center := 2, support := {5, 8, 10, 11} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 8, support := {2, 3, 6, 11} },
      { center := 10, support := {2, 5, 6, 7} },
      { center := 11, support := {0, 4, 6, 8} }
    ]
    data := {
      p := 0
      q := 2
      r := 4
      a := 5
      b := 11
      ap_aq := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 8, .flip 11 8, .row 8 11 2, .flip 8 2, .row 2 8 5, .flip 2 5], last := (5, 2) }
      ap_ar := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 8, .flip 11 8, .row 8 11 2, .flip 8 2, .row 2 8 10, .flip 2 10, .row 10 2 5, .flip 10 5, .row 5 10 4], last := (5, 4) }
      bp_bq := { first := (11, 0), steps := [.row 11 0 8, .flip 11 8, .row 8 11 2, .flip 8 2, .row 2 8 11, .flip 2 11], last := (11, 2) }
      bp_br := { first := (11, 0), steps := [.row 11 0 4], last := (11, 4) } } }

theorem duplicateCheck51 : duplicateData51.check = true := by
  native_decide

def cut51 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData51 duplicateCheck51

/-- Journal iteration 52; certificate 6d630775676fc6e29c964c6dfa6e5b1d603d82f87b4c3494018048830fef7144. -/
def duplicateData52 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {4, 5, 9, 11} },
      { center := 2, support := {5, 8, 10, 11} },
      { center := 3, support := {6, 8, 9, 10} },
      { center := 8, support := {2, 3, 6, 11} },
      { center := 9, support := {2, 3, 5, 10} },
      { center := 11, support := {0, 3, 4, 8} }
    ]
    data := {
      p := 0
      q := 2
      r := 3
      a := 9
      b := 11
      ap_aq := { first := (9, 0), steps := [.flip 9 0, .row 0 9 11, .flip 0 11, .row 11 0 8, .flip 11 8, .row 8 11 3, .flip 8 3, .row 3 8 9, .flip 3 9, .row 9 3 2], last := (9, 2) }
      ap_ar := { first := (9, 0), steps := [.flip 9 0, .row 0 9 11, .flip 0 11, .row 11 0 8, .flip 11 8, .row 8 11 3, .flip 8 3, .row 3 8 9, .flip 3 9], last := (9, 3) }
      bp_bq := { first := (11, 0), steps := [.row 11 0 8, .flip 11 8, .row 8 11 2, .flip 8 2, .row 2 8 11, .flip 2 11], last := (11, 2) }
      bp_br := { first := (11, 0), steps := [.row 11 0 3], last := (11, 3) } } }

theorem duplicateCheck52 : duplicateData52.check = true := by
  native_decide

def cut52 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData52 duplicateCheck52

/-- Journal iteration 53; certificate de505d7000033f39968ab73c4954bd7ba916833b12da8ebdc5493031371b9e30. -/
def duplicateData53 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {4, 5, 9, 11} },
      { center := 1, support := {7, 8, 9, 11} },
      { center := 2, support := {5, 8, 10, 11} },
      { center := 3, support := {6, 8, 9, 10} },
      { center := 8, support := {2, 3, 6, 11} },
      { center := 9, support := {2, 3, 5, 10} },
      { center := 11, support := {0, 1, 6, 8} }
    ]
    data := {
      p := 0
      q := 1
      r := 2
      a := 9
      b := 11
      ap_aq := { first := (9, 0), steps := [.flip 9 0, .row 0 9 11, .flip 0 11, .row 11 0 1, .flip 11 1, .row 1 11 9, .flip 1 9], last := (9, 1) }
      ap_ar := { first := (9, 0), steps := [.flip 9 0, .row 0 9 11, .flip 0 11, .row 11 0 8, .flip 11 8, .row 8 11 3, .flip 8 3, .row 3 8 9, .flip 3 9, .row 9 3 2], last := (9, 2) }
      bp_bq := { first := (11, 0), steps := [.row 11 0 1], last := (11, 1) }
      bp_br := { first := (11, 0), steps := [.row 11 0 8, .flip 11 8, .row 8 11 2, .flip 8 2, .row 2 8 11, .flip 2 11], last := (11, 2) } } }

theorem duplicateCheck53 : duplicateData53.check = true := by
  native_decide

def cut53 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData53 duplicateCheck53

/-- Journal iteration 54; certificate 3af601b66266acf2ac09f8eee53b5c2ccb4b120af0c8b8c8aea08eb4168814f8. -/
def duplicateData54 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {4, 5, 9, 11} },
      { center := 1, support := {7, 8, 9, 11} },
      { center := 2, support := {5, 8, 10, 11} },
      { center := 3, support := {6, 8, 9, 10} },
      { center := 4, support := {6, 7, 10, 11} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 8, support := {2, 3, 6, 11} },
      { center := 9, support := {2, 3, 5, 10} },
      { center := 11, support := {0, 1, 4, 10} }
    ]
    data := {
      p := 0
      q := 1
      r := 2
      a := 9
      b := 11
      ap_aq := { first := (9, 0), steps := [.flip 9 0, .row 0 9 11, .flip 0 11, .row 11 0 1, .flip 11 1, .row 1 11 9, .flip 1 9], last := (9, 1) }
      ap_ar := { first := (9, 0), steps := [.flip 9 0, .row 0 9 11, .flip 0 11, .row 11 0 4, .flip 11 4, .row 4 11 6, .flip 4 6, .row 6 4 8, .flip 6 8, .row 8 6 3, .flip 8 3, .row 3 8 9, .flip 3 9, .row 9 3 2], last := (9, 2) }
      bp_bq := { first := (11, 0), steps := [.row 11 0 1], last := (11, 1) }
      bp_br := { first := (11, 0), steps := [.row 11 0 4, .flip 11 4, .row 4 11 6, .flip 4 6, .row 6 4 8, .flip 6 8, .row 8 6 2, .flip 8 2, .row 2 8 11, .flip 2 11], last := (11, 2) } } }

theorem duplicateCheck54 : duplicateData54.check = true := by
  native_decide

def cut54 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData54 duplicateCheck54

/-- Journal iteration 55; certificate 8a4ae36488d02e3c9f94a148cff8b674b0017339bcc4ce40d21ddf63be0247d4. -/
def duplicateData55 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {4, 5, 9, 11} },
      { center := 1, support := {7, 8, 9, 11} },
      { center := 2, support := {5, 8, 10, 11} },
      { center := 3, support := {6, 8, 9, 10} },
      { center := 8, support := {2, 3, 6, 11} },
      { center := 9, support := {2, 3, 5, 10} },
      { center := 11, support := {0, 1, 4, 8} }
    ]
    data := {
      p := 0
      q := 1
      r := 2
      a := 9
      b := 11
      ap_aq := { first := (9, 0), steps := [.flip 9 0, .row 0 9 11, .flip 0 11, .row 11 0 1, .flip 11 1, .row 1 11 9, .flip 1 9], last := (9, 1) }
      ap_ar := { first := (9, 0), steps := [.flip 9 0, .row 0 9 11, .flip 0 11, .row 11 0 8, .flip 11 8, .row 8 11 3, .flip 8 3, .row 3 8 9, .flip 3 9, .row 9 3 2], last := (9, 2) }
      bp_bq := { first := (11, 0), steps := [.row 11 0 1], last := (11, 1) }
      bp_br := { first := (11, 0), steps := [.row 11 0 8, .flip 11 8, .row 8 11 2, .flip 8 2, .row 2 8 11, .flip 2 11], last := (11, 2) } } }

theorem duplicateCheck55 : duplicateData55.check = true := by
  native_decide

def cut55 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData55 duplicateCheck55

/-- Journal iteration 56; certificate e18e776de098f335f5f23479b916417adb1f64a28328adf3a5fe7852c5274fb4. -/
def duplicateData56 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {4, 5, 9, 11} },
      { center := 1, support := {7, 8, 9, 11} },
      { center := 2, support := {5, 8, 10, 11} },
      { center := 3, support := {6, 8, 9, 10} },
      { center := 4, support := {6, 7, 10, 11} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 8, support := {2, 3, 6, 11} },
      { center := 9, support := {2, 3, 5, 10} },
      { center := 11, support := {0, 1, 4, 6} }
    ]
    data := {
      p := 0
      q := 1
      r := 2
      a := 9
      b := 11
      ap_aq := { first := (9, 0), steps := [.flip 9 0, .row 0 9 11, .flip 0 11, .row 11 0 1, .flip 11 1, .row 1 11 9, .flip 1 9], last := (9, 1) }
      ap_ar := { first := (9, 0), steps := [.flip 9 0, .row 0 9 11, .flip 0 11, .row 11 0 4, .flip 11 4, .row 4 11 6, .flip 4 6, .row 6 4 8, .flip 6 8, .row 8 6 3, .flip 8 3, .row 3 8 9, .flip 3 9, .row 9 3 2], last := (9, 2) }
      bp_bq := { first := (11, 0), steps := [.row 11 0 1], last := (11, 1) }
      bp_br := { first := (11, 0), steps := [.row 11 0 4, .flip 11 4, .row 4 11 6, .flip 4 6, .row 6 4 8, .flip 6 8, .row 8 6 2, .flip 8 2, .row 2 8 11, .flip 2 11], last := (11, 2) } } }

theorem duplicateCheck56 : duplicateData56.check = true := by
  native_decide

def cut56 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData56 duplicateCheck56

/-- Journal iteration 57; certificate e43b918396060d18b796edddc1c42c1ef639db7d5825973ca694561d110cd52d. -/
def duplicateData57 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 3, support := {6, 8, 9, 10} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 9, support := {2, 3, 5, 10} },
      { center := 10, support := {2, 5, 6, 7} }
    ]
    data := {
      p := 2
      q := 3
      r := 5
      a := 9
      b := 10
      ap_aq := { first := (9, 2), steps := [.row 9 2 3], last := (9, 3) }
      ap_ar := { first := (9, 2), steps := [.row 9 2 5], last := (9, 5) }
      bp_bq := { first := (10, 2), steps := [.row 10 2 5, .flip 10 5, .row 5 10 9, .flip 5 9, .row 9 5 3, .flip 9 3, .row 3 9 10, .flip 3 10], last := (10, 3) }
      bp_br := { first := (10, 2), steps := [.row 10 2 5], last := (10, 5) } } }

theorem duplicateCheck57 : duplicateData57.check = true := by
  native_decide

def cut57 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData57 duplicateCheck57

/-- Journal iteration 58; certificate 8a61f37e8ecfe400bda3346acab5544508656257980fa8d755453a3696ecadf9. -/
def duplicateData58 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {4, 5, 9, 11} },
      { center := 2, support := {5, 8, 10, 11} },
      { center := 3, support := {6, 8, 9, 10} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 8, support := {2, 3, 6, 11} },
      { center := 9, support := {2, 3, 5, 10} },
      { center := 11, support := {0, 4, 6, 8} }
    ]
    data := {
      p := 0
      q := 2
      r := 4
      a := 5
      b := 11
      ap_aq := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 8, .flip 11 8, .row 8 11 2, .flip 8 2, .row 2 8 5, .flip 2 5], last := (5, 2) }
      ap_ar := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 8, .flip 11 8, .row 8 11 3, .flip 8 3, .row 3 8 9, .flip 3 9, .row 9 3 5, .flip 9 5, .row 5 9 4], last := (5, 4) }
      bp_bq := { first := (11, 0), steps := [.row 11 0 8, .flip 11 8, .row 8 11 2, .flip 8 2, .row 2 8 11, .flip 2 11], last := (11, 2) }
      bp_br := { first := (11, 0), steps := [.row 11 0 4], last := (11, 4) } } }

theorem duplicateCheck58 : duplicateData58.check = true := by
  native_decide

def cut58 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData58 duplicateCheck58

/-- Journal iteration 59; certificate 761be3dac4695a752027974b4b48de5940d3cc6b3a782279cd0dda1d1fe20290. -/
def duplicateData59 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {4, 5, 9, 11} },
      { center := 2, support := {5, 8, 10, 11} },
      { center := 4, support := {6, 7, 10, 11} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 7, support := {3, 5, 6, 9} },
      { center := 8, support := {2, 3, 6, 11} },
      { center := 11, support := {0, 2, 6, 8} }
    ]
    data := {
      p := 0
      q := 2
      r := 4
      a := 5
      b := 11
      ap_aq := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 2, .flip 11 2, .row 2 11 5, .flip 2 5], last := (5, 2) }
      ap_ar := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 8, .flip 11 8, .row 8 11 6, .flip 8 6, .row 6 8 7, .flip 6 7, .row 7 6 5, .flip 7 5, .row 5 7 4], last := (5, 4) }
      bp_bq := { first := (11, 0), steps := [.row 11 0 2], last := (11, 2) }
      bp_br := { first := (11, 0), steps := [.row 11 0 8, .flip 11 8, .row 8 11 6, .flip 8 6, .row 6 8 4, .flip 6 4, .row 4 6 11, .flip 4 11], last := (11, 4) } } }

theorem duplicateCheck59 : duplicateData59.check = true := by
  native_decide

def cut59 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData59 duplicateCheck59

/-- Journal iteration 60; certificate 82eac91ee470e51f7883a1bca11094f1332ddb4cbf9d247ca6f7bd7e24d32b87. -/
def duplicateData60 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 2, support := {5, 8, 10, 11} },
      { center := 3, support := {6, 8, 9, 10} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 8, support := {2, 3, 6, 11} },
      { center := 9, support := {2, 3, 5, 10} }
    ]
    data := {
      p := 2
      q := 3
      r := 5
      a := 9
      b := 10
      ap_aq := { first := (9, 2), steps := [.row 9 2 3], last := (9, 3) }
      ap_ar := { first := (9, 2), steps := [.row 9 2 5], last := (9, 5) }
      bp_bq := { first := (10, 2), steps := [.flip 10 2, .row 2 10 8, .flip 2 8, .row 8 2 3, .flip 8 3, .row 3 8 10, .flip 3 10], last := (10, 3) }
      bp_br := { first := (10, 2), steps := [.flip 10 2, .row 2 10 8, .flip 2 8, .row 8 2 3, .flip 8 3, .row 3 8 9, .flip 3 9, .row 9 3 5, .flip 9 5, .row 5 9 10, .flip 5 10], last := (10, 5) } } }

theorem duplicateCheck60 : duplicateData60.check = true := by
  native_decide

def cut60 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData60 duplicateCheck60

/-- Journal iteration 61; certificate e672f76d02c6ee64238c063d63349a9d40ebab0e6c141dee7c9d5b4c9dacaff3. -/
def duplicateData61 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {4, 5, 9, 11} },
      { center := 2, support := {5, 8, 10, 11} },
      { center := 4, support := {6, 7, 10, 11} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 7, support := {3, 5, 6, 9} },
      { center := 8, support := {2, 3, 6, 11} },
      { center := 11, support := {0, 2, 6, 7} }
    ]
    data := {
      p := 0
      q := 2
      r := 4
      a := 5
      b := 11
      ap_aq := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 2, .flip 11 2, .row 2 11 5, .flip 2 5], last := (5, 2) }
      ap_ar := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 2, .flip 11 2, .row 2 11 8, .flip 2 8, .row 8 2 6, .flip 8 6, .row 6 8 7, .flip 6 7, .row 7 6 5, .flip 7 5, .row 5 7 4], last := (5, 4) }
      bp_bq := { first := (11, 0), steps := [.row 11 0 2], last := (11, 2) }
      bp_br := { first := (11, 0), steps := [.row 11 0 2, .flip 11 2, .row 2 11 8, .flip 2 8, .row 8 2 6, .flip 8 6, .row 6 8 4, .flip 6 4, .row 4 6 11, .flip 4 11], last := (11, 4) } } }

theorem duplicateCheck61 : duplicateData61.check = true := by
  native_decide

def cut61 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData61 duplicateCheck61

/-- Journal iteration 62; certificate 079bd8f53f7d8f4963c03e684c0b9249d61ac4e1d9f188a978bb74a47c22a449. -/
def duplicateData62 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {4, 5, 9, 11} },
      { center := 2, support := {5, 8, 10, 11} },
      { center := 4, support := {6, 7, 10, 11} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 7, support := {3, 5, 6, 9} },
      { center := 8, support := {2, 3, 6, 11} },
      { center := 11, support := {0, 2, 5, 6} }
    ]
    data := {
      p := 0
      q := 2
      r := 4
      a := 5
      b := 11
      ap_aq := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 2, .flip 11 2, .row 2 11 5, .flip 2 5], last := (5, 2) }
      ap_ar := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 2, .flip 11 2, .row 2 11 8, .flip 2 8, .row 8 2 6, .flip 8 6, .row 6 8 7, .flip 6 7, .row 7 6 5, .flip 7 5, .row 5 7 4], last := (5, 4) }
      bp_bq := { first := (11, 0), steps := [.row 11 0 2], last := (11, 2) }
      bp_br := { first := (11, 0), steps := [.row 11 0 2, .flip 11 2, .row 2 11 8, .flip 2 8, .row 8 2 6, .flip 8 6, .row 6 8 4, .flip 6 4, .row 4 6 11, .flip 4 11], last := (11, 4) } } }

theorem duplicateCheck62 : duplicateData62.check = true := by
  native_decide

def cut62 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData62 duplicateCheck62

/-- Journal iteration 63; certificate 5bc6226de6a58c3a14c7147a9a6cf1379f3134c0ae0efba68dfd696c82cacc27. -/
def duplicateData63 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 2, support := {5, 8, 10, 11} },
      { center := 3, support := {6, 8, 9, 10} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 8, support := {2, 3, 6, 11} },
      { center := 9, support := {2, 3, 5, 7} }
    ]
    data := {
      p := 2
      q := 3
      r := 5
      a := 9
      b := 10
      ap_aq := { first := (9, 2), steps := [.row 9 2 3], last := (9, 3) }
      ap_ar := { first := (9, 2), steps := [.row 9 2 5], last := (9, 5) }
      bp_bq := { first := (10, 2), steps := [.flip 10 2, .row 2 10 8, .flip 2 8, .row 8 2 3, .flip 8 3, .row 3 8 10, .flip 3 10], last := (10, 3) }
      bp_br := { first := (10, 2), steps := [.flip 10 2, .row 2 10 8, .flip 2 8, .row 8 2 3, .flip 8 3, .row 3 8 9, .flip 3 9, .row 9 3 5, .flip 9 5, .row 5 9 10, .flip 5 10], last := (10, 5) } } }

theorem duplicateCheck63 : duplicateData63.check = true := by
  native_decide

def cut63 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData63 duplicateCheck63

/-- Journal iteration 64; certificate 495abfb222d9a62e7e724ce8cd9ca3436db39b183583ef5f8f8c9e6abe0164a0. -/
def duplicateData64 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 2, support := {5, 8, 10, 11} },
      { center := 3, support := {6, 8, 9, 10} },
      { center := 4, support := {6, 7, 10, 11} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 8, support := {2, 3, 6, 11} },
      { center := 9, support := {2, 3, 4, 10} }
    ]
    data := {
      p := 2
      q := 3
      r := 4
      a := 9
      b := 10
      ap_aq := { first := (9, 2), steps := [.row 9 2 3], last := (9, 3) }
      ap_ar := { first := (9, 2), steps := [.row 9 2 4], last := (9, 4) }
      bp_bq := { first := (10, 2), steps := [.flip 10 2, .row 2 10 8, .flip 2 8, .row 8 2 3, .flip 8 3, .row 3 8 10, .flip 3 10], last := (10, 3) }
      bp_br := { first := (10, 2), steps := [.flip 10 2, .row 2 10 8, .flip 2 8, .row 8 2 6, .flip 8 6, .row 6 8 4, .flip 6 4, .row 4 6 10, .flip 4 10], last := (10, 4) } } }

theorem duplicateCheck64 : duplicateData64.check = true := by
  native_decide

def cut64 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData64 duplicateCheck64

/-- Journal iteration 65; certificate 6637de9b2773fb34be78ae296c6a5f41744a74deddf57b7c813e1fa3d6de2fc9. -/
def duplicateData65 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 2, support := {5, 8, 10, 11} },
      { center := 3, support := {6, 8, 9, 10} },
      { center := 4, support := {6, 7, 10, 11} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 8, support := {2, 3, 6, 11} },
      { center := 9, support := {2, 3, 4, 8} }
    ]
    data := {
      p := 2
      q := 3
      r := 4
      a := 9
      b := 10
      ap_aq := { first := (9, 2), steps := [.row 9 2 3], last := (9, 3) }
      ap_ar := { first := (9, 2), steps := [.row 9 2 4], last := (9, 4) }
      bp_bq := { first := (10, 2), steps := [.flip 10 2, .row 2 10 8, .flip 2 8, .row 8 2 3, .flip 8 3, .row 3 8 10, .flip 3 10], last := (10, 3) }
      bp_br := { first := (10, 2), steps := [.flip 10 2, .row 2 10 8, .flip 2 8, .row 8 2 6, .flip 8 6, .row 6 8 4, .flip 6 4, .row 4 6 10, .flip 4 10], last := (10, 4) } } }

theorem duplicateCheck65 : duplicateData65.check = true := by
  native_decide

def cut65 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData65 duplicateCheck65

/-- Journal iteration 66; certificate dc64a623739b31705bbec09edbdcdd1aca0502ed0792ac992408596677be9bf5. -/
def duplicateData66 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 1, support := {7, 8, 9, 11} },
      { center := 3, support := {6, 8, 9, 10} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 7, support := {3, 5, 6, 9} },
      { center := 8, support := {2, 3, 6, 11} },
      { center := 9, support := {1, 5, 6, 7} }
    ]
    data := {
      p := 1
      q := 3
      r := 5
      a := 7
      b := 9
      ap_aq := { first := (7, 1), steps := [.flip 7 1, .row 1 7 9, .flip 1 9, .row 9 1 7, .flip 9 7, .row 7 9 3], last := (7, 3) }
      ap_ar := { first := (7, 1), steps := [.flip 7 1, .row 1 7 9, .flip 1 9, .row 9 1 7, .flip 9 7, .row 7 9 5], last := (7, 5) }
      bp_bq := { first := (9, 1), steps := [.row 9 1 7, .flip 9 7, .row 7 9 6, .flip 7 6, .row 6 7 8, .flip 6 8, .row 8 6 3, .flip 8 3, .row 3 8 9, .flip 3 9], last := (9, 3) }
      bp_br := { first := (9, 1), steps := [.row 9 1 5], last := (9, 5) } } }

theorem duplicateCheck66 : duplicateData66.check = true := by
  native_decide

def cut66 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData66 duplicateCheck66

/-- Journal iteration 67; certificate 31131ab96de0280d37c92aff6a98625a753786f14a86507145751a5f239406e1. -/
def duplicateData67 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 2, support := {5, 8, 10, 11} },
      { center := 3, support := {6, 8, 9, 10} },
      { center := 8, support := {2, 3, 6, 11} },
      { center := 10, support := {2, 5, 6, 7} }
    ]
    data := {
      p := 2
      q := 3
      r := 6
      a := 8
      b := 10
      ap_aq := { first := (8, 2), steps := [.row 8 2 3], last := (8, 3) }
      ap_ar := { first := (8, 2), steps := [.row 8 2 6], last := (8, 6) }
      bp_bq := { first := (10, 2), steps := [.flip 10 2, .row 2 10 8, .flip 2 8, .row 8 2 3, .flip 8 3, .row 3 8 10, .flip 3 10], last := (10, 3) }
      bp_br := { first := (10, 2), steps := [.row 10 2 6], last := (10, 6) } } }

theorem duplicateCheck67 : duplicateData67.check = true := by
  native_decide

def cut67 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData67 duplicateCheck67

/-- Journal iteration 68; certificate 665e07512e96cd9eeafdd117436793c871417a785e9edf8e3278436a881cf992. -/
def duplicateData68 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {4, 5, 9, 11} },
      { center := 1, support := {7, 8, 9, 11} },
      { center := 9, support := {1, 4, 6, 8} },
      { center := 11, support := {0, 1, 6, 7} }
    ]
    data := {
      p := 0
      q := 1
      r := 6
      a := 9
      b := 11
      ap_aq := { first := (9, 0), steps := [.flip 9 0, .row 0 9 11, .flip 0 11, .row 11 0 1, .flip 11 1, .row 1 11 9, .flip 1 9], last := (9, 1) }
      ap_ar := { first := (9, 0), steps := [.flip 9 0, .row 0 9 11, .flip 0 11, .row 11 0 1, .flip 11 1, .row 1 11 9, .flip 1 9, .row 9 1 6], last := (9, 6) }
      bp_bq := { first := (11, 0), steps := [.row 11 0 1], last := (11, 1) }
      bp_br := { first := (11, 0), steps := [.row 11 0 6], last := (11, 6) } } }

theorem duplicateCheck68 : duplicateData68.check = true := by
  native_decide

def cut68 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData68 duplicateCheck68

/-- Journal iteration 69; certificate ca028d16362a897194db62ad8d5e1079c9858d9b025d226d01d0c8ea39b20c4e. -/
def duplicateData69 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 2, support := {5, 8, 10, 11} },
      { center := 4, support := {6, 7, 10, 11} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 7, support := {3, 5, 6, 9} },
      { center := 10, support := {2, 3, 5, 7} }
    ]
    data := {
      p := 2
      q := 4
      r := 7
      a := 5
      b := 10
      ap_aq := { first := (5, 2), steps := [.flip 5 2, .row 2 5 10, .flip 2 10, .row 10 2 5, .flip 10 5, .row 5 10 4], last := (5, 4) }
      ap_ar := { first := (5, 2), steps := [.flip 5 2, .row 2 5 10, .flip 2 10, .row 10 2 5, .flip 10 5, .row 5 10 7], last := (5, 7) }
      bp_bq := { first := (10, 2), steps := [.row 10 2 5, .flip 10 5, .row 5 10 7, .flip 5 7, .row 7 5 6, .flip 7 6, .row 6 7 4, .flip 6 4, .row 4 6 10, .flip 4 10], last := (10, 4) }
      bp_br := { first := (10, 2), steps := [.row 10 2 7], last := (10, 7) } } }

theorem duplicateCheck69 : duplicateData69.check = true := by
  native_decide

def cut69 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData69 duplicateCheck69

/-- Journal iteration 70; certificate a6d7a6dca29e4e7dd2b0e83a721f7bd4b2389117c1c3605c07bd50c1467e3b44. -/
def duplicateData70 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 4, support := {6, 7, 10, 11} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 7, support := {3, 5, 6, 9} },
      { center := 9, support := {1, 4, 6, 8} },
      { center := 10, support := {1, 5, 6, 7} }
    ]
    data := {
      p := 1
      q := 4
      r := 6
      a := 9
      b := 10
      ap_aq := { first := (9, 1), steps := [.row 9 1 4], last := (9, 4) }
      ap_ar := { first := (9, 1), steps := [.row 9 1 6], last := (9, 6) }
      bp_bq := { first := (10, 1), steps := [.row 10 1 5, .flip 10 5, .row 5 10 7, .flip 5 7, .row 7 5 6, .flip 7 6, .row 6 7 4, .flip 6 4, .row 4 6 10, .flip 4 10], last := (10, 4) }
      bp_br := { first := (10, 1), steps := [.row 10 1 6], last := (10, 6) } } }

theorem duplicateCheck70 : duplicateData70.check = true := by
  native_decide

def cut70 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData70 duplicateCheck70

/-- Journal iteration 71; certificate 096aa3928f4a07246eed481e0ea3e0f2097455122fa601a6b9ebde842629b0f8. -/
def duplicateData71 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {4, 5, 9, 11} },
      { center := 2, support := {5, 8, 10, 11} },
      { center := 4, support := {6, 7, 10, 11} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 7, support := {3, 5, 6, 9} },
      { center := 8, support := {2, 3, 6, 11} },
      { center := 11, support := {0, 2, 3, 10} }
    ]
    data := {
      p := 0
      q := 2
      r := 4
      a := 5
      b := 11
      ap_aq := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 2, .flip 11 2, .row 2 11 5, .flip 2 5], last := (5, 2) }
      ap_ar := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 2, .flip 11 2, .row 2 11 8, .flip 2 8, .row 8 2 6, .flip 8 6, .row 6 8 7, .flip 6 7, .row 7 6 5, .flip 7 5, .row 5 7 4], last := (5, 4) }
      bp_bq := { first := (11, 0), steps := [.row 11 0 2], last := (11, 2) }
      bp_br := { first := (11, 0), steps := [.row 11 0 2, .flip 11 2, .row 2 11 8, .flip 2 8, .row 8 2 6, .flip 8 6, .row 6 8 4, .flip 6 4, .row 4 6 11, .flip 4 11], last := (11, 4) } } }

theorem duplicateCheck71 : duplicateData71.check = true := by
  native_decide

def cut71 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData71 duplicateCheck71

/-- Journal iteration 72; certificate d569e8e0fac73290e09484edee651c73de86f075e01774df41733470a4e29d1e. -/
def duplicateData72 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {4, 5, 9, 11} },
      { center := 2, support := {5, 8, 10, 11} },
      { center := 4, support := {6, 7, 10, 11} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 7, support := {3, 5, 6, 9} },
      { center := 8, support := {2, 3, 6, 11} },
      { center := 11, support := {0, 2, 3, 9} }
    ]
    data := {
      p := 0
      q := 2
      r := 4
      a := 5
      b := 11
      ap_aq := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 2, .flip 11 2, .row 2 11 5, .flip 2 5], last := (5, 2) }
      ap_ar := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 2, .flip 11 2, .row 2 11 8, .flip 2 8, .row 8 2 6, .flip 8 6, .row 6 8 7, .flip 6 7, .row 7 6 5, .flip 7 5, .row 5 7 4], last := (5, 4) }
      bp_bq := { first := (11, 0), steps := [.row 11 0 2], last := (11, 2) }
      bp_br := { first := (11, 0), steps := [.row 11 0 2, .flip 11 2, .row 2 11 8, .flip 2 8, .row 8 2 6, .flip 8 6, .row 6 8 4, .flip 6 4, .row 4 6 11, .flip 4 11], last := (11, 4) } } }

theorem duplicateCheck72 : duplicateData72.check = true := by
  native_decide

def cut72 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData72 duplicateCheck72

/-- Journal iteration 73; certificate 19e5708139a4b1e17cd87bbc97ec1e0131e7ccb6174441d386e8f197d111ca8b. -/
def duplicateData73 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {4, 5, 9, 11} },
      { center := 2, support := {5, 8, 10, 11} },
      { center := 4, support := {6, 7, 10, 11} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 7, support := {3, 5, 6, 9} },
      { center := 8, support := {2, 3, 6, 11} },
      { center := 11, support := {0, 2, 3, 8} }
    ]
    data := {
      p := 0
      q := 2
      r := 4
      a := 5
      b := 11
      ap_aq := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 2, .flip 11 2, .row 2 11 5, .flip 2 5], last := (5, 2) }
      ap_ar := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 8, .flip 11 8, .row 8 11 6, .flip 8 6, .row 6 8 7, .flip 6 7, .row 7 6 5, .flip 7 5, .row 5 7 4], last := (5, 4) }
      bp_bq := { first := (11, 0), steps := [.row 11 0 2], last := (11, 2) }
      bp_br := { first := (11, 0), steps := [.row 11 0 8, .flip 11 8, .row 8 11 6, .flip 8 6, .row 6 8 4, .flip 6 4, .row 4 6 11, .flip 4 11], last := (11, 4) } } }

theorem duplicateCheck73 : duplicateData73.check = true := by
  native_decide

def cut73 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData73 duplicateCheck73

/-- Journal iteration 74; certificate d95753ca7e336a616b855510361015edc758837cd02fbdce41fb39f01ed2b8e5. -/
def duplicateData74 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {4, 5, 9, 11} },
      { center := 2, support := {5, 8, 10, 11} },
      { center := 4, support := {6, 7, 10, 11} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 7, support := {3, 5, 6, 9} },
      { center := 8, support := {2, 3, 6, 11} },
      { center := 11, support := {0, 2, 3, 7} }
    ]
    data := {
      p := 0
      q := 2
      r := 4
      a := 5
      b := 11
      ap_aq := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 2, .flip 11 2, .row 2 11 5, .flip 2 5], last := (5, 2) }
      ap_ar := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 2, .flip 11 2, .row 2 11 8, .flip 2 8, .row 8 2 6, .flip 8 6, .row 6 8 7, .flip 6 7, .row 7 6 5, .flip 7 5, .row 5 7 4], last := (5, 4) }
      bp_bq := { first := (11, 0), steps := [.row 11 0 2], last := (11, 2) }
      bp_br := { first := (11, 0), steps := [.row 11 0 2, .flip 11 2, .row 2 11 8, .flip 2 8, .row 8 2 6, .flip 8 6, .row 6 8 4, .flip 6 4, .row 4 6 11, .flip 4 11], last := (11, 4) } } }

theorem duplicateCheck74 : duplicateData74.check = true := by
  native_decide

def cut74 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData74 duplicateCheck74

/-- Journal iteration 75; certificate 8ba44a58a97cc8c569dbd990143dbe4c82005f0db50621138126ea90b9c0d808. -/
def duplicateData75 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 2, support := {5, 8, 10, 11} },
      { center := 3, support := {6, 8, 9, 10} },
      { center := 4, support := {6, 7, 10, 11} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 8, support := {2, 3, 6, 11} },
      { center := 10, support := {1, 3, 5, 7} }
    ]
    data := {
      p := 2
      q := 4
      r := 7
      a := 5
      b := 10
      ap_aq := { first := (5, 2), steps := [.flip 5 2, .row 2 5 8, .flip 2 8, .row 8 2 3, .flip 8 3, .row 3 8 10, .flip 3 10, .row 10 3 5, .flip 10 5, .row 5 10 4], last := (5, 4) }
      ap_ar := { first := (5, 2), steps := [.flip 5 2, .row 2 5 8, .flip 2 8, .row 8 2 3, .flip 8 3, .row 3 8 10, .flip 3 10, .row 10 3 5, .flip 10 5, .row 5 10 7], last := (5, 7) }
      bp_bq := { first := (10, 2), steps := [.flip 10 2, .row 2 10 8, .flip 2 8, .row 8 2 6, .flip 8 6, .row 6 8 4, .flip 6 4, .row 4 6 10, .flip 4 10], last := (10, 4) }
      bp_br := { first := (10, 2), steps := [.flip 10 2, .row 2 10 8, .flip 2 8, .row 8 2 3, .flip 8 3, .row 3 8 10, .flip 3 10, .row 10 3 7], last := (10, 7) } } }

theorem duplicateCheck75 : duplicateData75.check = true := by
  native_decide

def cut75 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData75 duplicateCheck75

/-- Journal iteration 76; certificate d79451acf016879330685a7feb8a5ebc437473f09c4d6d518ccd06a89fed8da0. -/
def duplicateData76 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 2, support := {5, 8, 10, 11} },
      { center := 3, support := {6, 8, 9, 10} },
      { center := 8, support := {2, 3, 6, 11} },
      { center := 10, support := {1, 3, 4, 11} }
    ]
    data := {
      p := 2
      q := 3
      r := 11
      a := 8
      b := 10
      ap_aq := { first := (8, 2), steps := [.row 8 2 3], last := (8, 3) }
      ap_ar := { first := (8, 2), steps := [.row 8 2 11], last := (8, 11) }
      bp_bq := { first := (10, 2), steps := [.flip 10 2, .row 2 10 8, .flip 2 8, .row 8 2 3, .flip 8 3, .row 3 8 10, .flip 3 10], last := (10, 3) }
      bp_br := { first := (10, 2), steps := [.flip 10 2, .row 2 10 8, .flip 2 8, .row 8 2 3, .flip 8 3, .row 3 8 10, .flip 3 10, .row 10 3 11], last := (10, 11) } } }

theorem duplicateCheck76 : duplicateData76.check = true := by
  native_decide

def cut76 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData76 duplicateCheck76

/-- Journal iteration 77; certificate 35e348c2e7c3bb4029380ee753b1e574adc6633218cb3f533c69af347b90bc71. -/
def duplicateData77 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 2, support := {5, 8, 10, 11} },
      { center := 4, support := {6, 7, 10, 11} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 8, support := {2, 3, 6, 11} },
      { center := 9, support := {1, 4, 6, 8} },
      { center := 10, support := {1, 2, 6, 7} }
    ]
    data := {
      p := 1
      q := 4
      r := 6
      a := 9
      b := 10
      ap_aq := { first := (9, 1), steps := [.row 9 1 4], last := (9, 4) }
      ap_ar := { first := (9, 1), steps := [.row 9 1 6], last := (9, 6) }
      bp_bq := { first := (10, 1), steps := [.row 10 1 2, .flip 10 2, .row 2 10 8, .flip 2 8, .row 8 2 6, .flip 8 6, .row 6 8 4, .flip 6 4, .row 4 6 10, .flip 4 10], last := (10, 4) }
      bp_br := { first := (10, 1), steps := [.row 10 1 6], last := (10, 6) } } }

theorem duplicateCheck77 : duplicateData77.check = true := by
  native_decide

def cut77 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData77 duplicateCheck77

/-- Journal iteration 78; certificate 3ddab28f521625e682b118ccf3a33d7a38ae7f26a2fd304d4e521c9ba6410bb3. -/
def duplicateData78 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 2, support := {5, 8, 10, 11} },
      { center := 4, support := {6, 7, 10, 11} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 7, support := {3, 5, 6, 9} },
      { center := 10, support := {1, 2, 5, 7} }
    ]
    data := {
      p := 2
      q := 4
      r := 7
      a := 5
      b := 10
      ap_aq := { first := (5, 2), steps := [.flip 5 2, .row 2 5 10, .flip 2 10, .row 10 2 5, .flip 10 5, .row 5 10 4], last := (5, 4) }
      ap_ar := { first := (5, 2), steps := [.flip 5 2, .row 2 5 10, .flip 2 10, .row 10 2 5, .flip 10 5, .row 5 10 7], last := (5, 7) }
      bp_bq := { first := (10, 2), steps := [.row 10 2 5, .flip 10 5, .row 5 10 7, .flip 5 7, .row 7 5 6, .flip 7 6, .row 6 7 4, .flip 6 4, .row 4 6 10, .flip 4 10], last := (10, 4) }
      bp_br := { first := (10, 2), steps := [.row 10 2 7], last := (10, 7) } } }

theorem duplicateCheck78 : duplicateData78.check = true := by
  native_decide

def cut78 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData78 duplicateCheck78

/-- Journal iteration 79; certificate eed0623416e427f4bc143f9c949ae90a85a5fd7a2e939e34333b836d246d303f. -/
def duplicateData79 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 2, support := {5, 8, 10, 11} },
      { center := 4, support := {6, 7, 10, 11} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 8, support := {2, 3, 6, 11} },
      { center := 9, support := {1, 4, 6, 8} },
      { center := 10, support := {1, 2, 5, 6} }
    ]
    data := {
      p := 1
      q := 4
      r := 6
      a := 9
      b := 10
      ap_aq := { first := (9, 1), steps := [.row 9 1 4], last := (9, 4) }
      ap_ar := { first := (9, 1), steps := [.row 9 1 6], last := (9, 6) }
      bp_bq := { first := (10, 1), steps := [.row 10 1 2, .flip 10 2, .row 2 10 8, .flip 2 8, .row 8 2 6, .flip 8 6, .row 6 8 4, .flip 6 4, .row 4 6 10, .flip 4 10], last := (10, 4) }
      bp_br := { first := (10, 1), steps := [.row 10 1 6], last := (10, 6) } } }

theorem duplicateCheck79 : duplicateData79.check = true := by
  native_decide

def cut79 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData79 duplicateCheck79

/-- Journal iteration 80; certificate 6787ee665fc26c436e1f761cf2ef86abf30e26f6b01f61aacefdee9236210f20. -/
def duplicateData80 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 2, support := {5, 8, 10, 11} },
      { center := 3, support := {6, 8, 9, 10} },
      { center := 8, support := {2, 3, 6, 11} },
      { center := 10, support := {1, 2, 4, 11} }
    ]
    data := {
      p := 2
      q := 3
      r := 11
      a := 8
      b := 10
      ap_aq := { first := (8, 2), steps := [.row 8 2 3], last := (8, 3) }
      ap_ar := { first := (8, 2), steps := [.row 8 2 11], last := (8, 11) }
      bp_bq := { first := (10, 2), steps := [.flip 10 2, .row 2 10 8, .flip 2 8, .row 8 2 3, .flip 8 3, .row 3 8 10, .flip 3 10], last := (10, 3) }
      bp_br := { first := (10, 2), steps := [.row 10 2 11], last := (10, 11) } } }

theorem duplicateCheck80 : duplicateData80.check = true := by
  native_decide

def cut80 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData80 duplicateCheck80

/-- Journal iteration 81; certificate 93a11ef4787c9e787b740d935fcb70618d5d9e848d2c9dd47769db0d5fa3a369. -/
def duplicateData81 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 2, support := {5, 8, 10, 11} },
      { center := 4, support := {6, 7, 10, 11} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 7, support := {3, 5, 6, 9} },
      { center := 8, support := {2, 3, 6, 11} },
      { center := 10, support := {1, 2, 3, 9} }
    ]
    data := {
      p := 2
      q := 4
      r := 9
      a := 5
      b := 10
      ap_aq := { first := (5, 2), steps := [.flip 5 2, .row 2 5 8, .flip 2 8, .row 8 2 6, .flip 8 6, .row 6 8 7, .flip 6 7, .row 7 6 5, .flip 7 5, .row 5 7 4], last := (5, 4) }
      ap_ar := { first := (5, 2), steps := [.flip 5 2, .row 2 5 8, .flip 2 8, .row 8 2 6, .flip 8 6, .row 6 8 7, .flip 6 7, .row 7 6 5, .flip 7 5, .row 5 7 9], last := (5, 9) }
      bp_bq := { first := (10, 2), steps := [.flip 10 2, .row 2 10 8, .flip 2 8, .row 8 2 6, .flip 8 6, .row 6 8 4, .flip 6 4, .row 4 6 10, .flip 4 10], last := (10, 4) }
      bp_br := { first := (10, 2), steps := [.row 10 2 9], last := (10, 9) } } }

theorem duplicateCheck81 : duplicateData81.check = true := by
  native_decide

def cut81 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData81 duplicateCheck81

/-- Journal iteration 82; certificate d0f1297c56df0cb08b00d9f1dd1712dc2cf98961b76979ace9b13df5d5eb356b. -/
def duplicateData82 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 2, support := {5, 8, 10, 11} },
      { center := 4, support := {6, 7, 10, 11} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 8, support := {2, 3, 6, 11} },
      { center := 9, support := {1, 4, 6, 8} },
      { center := 10, support := {1, 2, 3, 8} }
    ]
    data := {
      p := 1
      q := 4
      r := 8
      a := 9
      b := 10
      ap_aq := { first := (9, 1), steps := [.row 9 1 4], last := (9, 4) }
      ap_ar := { first := (9, 1), steps := [.row 9 1 8], last := (9, 8) }
      bp_bq := { first := (10, 1), steps := [.row 10 1 2, .flip 10 2, .row 2 10 8, .flip 2 8, .row 8 2 6, .flip 8 6, .row 6 8 4, .flip 6 4, .row 4 6 10, .flip 4 10], last := (10, 4) }
      bp_br := { first := (10, 1), steps := [.row 10 1 8], last := (10, 8) } } }

theorem duplicateCheck82 : duplicateData82.check = true := by
  native_decide

def cut82 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData82 duplicateCheck82

/-- Journal iteration 83; certificate 08e22e5f5c5f6e1010728600708d2d0c1f391774e8eeffe717e2b0dcea084164. -/
def duplicateData83 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 2, support := {5, 8, 10, 11} },
      { center := 4, support := {6, 7, 10, 11} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 7, support := {3, 5, 6, 9} },
      { center := 8, support := {2, 3, 6, 11} },
      { center := 10, support := {1, 2, 3, 7} }
    ]
    data := {
      p := 2
      q := 4
      r := 7
      a := 5
      b := 10
      ap_aq := { first := (5, 2), steps := [.flip 5 2, .row 2 5 8, .flip 2 8, .row 8 2 6, .flip 8 6, .row 6 8 7, .flip 6 7, .row 7 6 5, .flip 7 5, .row 5 7 4], last := (5, 4) }
      ap_ar := { first := (5, 2), steps := [.flip 5 2, .row 2 5 8, .flip 2 8, .row 8 2 6, .flip 8 6, .row 6 8 7, .flip 6 7, .row 7 6 5, .flip 7 5], last := (5, 7) }
      bp_bq := { first := (10, 2), steps := [.flip 10 2, .row 2 10 8, .flip 2 8, .row 8 2 6, .flip 8 6, .row 6 8 4, .flip 6 4, .row 4 6 10, .flip 4 10], last := (10, 4) }
      bp_br := { first := (10, 2), steps := [.row 10 2 7], last := (10, 7) } } }

theorem duplicateCheck83 : duplicateData83.check = true := by
  native_decide

def cut83 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData83 duplicateCheck83

/-- Journal iteration 84; certificate 34b3923d424efa3423620f942bd674381cb0c658e4527e80b98c18e3070b948b. -/
def duplicateData84 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 3, support := {6, 8, 9, 10} },
      { center := 4, support := {6, 7, 10, 11} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 7, support := {3, 5, 6, 9} },
      { center := 8, support := {2, 3, 6, 11} }
    ]
    data := {
      p := 3
      q := 4
      r := 5
      a := 6
      b := 7
      ap_aq := { first := (6, 3), steps := [.flip 6 3, .row 3 6 8, .flip 3 8, .row 8 3 6, .flip 8 6, .row 6 8 4], last := (6, 4) }
      ap_ar := { first := (6, 3), steps := [.flip 6 3, .row 3 6 8, .flip 3 8, .row 8 3 6, .flip 8 6, .row 6 8 5], last := (6, 5) }
      bp_bq := { first := (7, 3), steps := [.row 7 3 6, .flip 7 6, .row 6 7 4, .flip 6 4, .row 4 6 7, .flip 4 7], last := (7, 4) }
      bp_br := { first := (7, 3), steps := [.row 7 3 5], last := (7, 5) } } }

theorem duplicateCheck84 : duplicateData84.check = true := by
  native_decide

def cut84 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData84 duplicateCheck84

/-- Journal iteration 85; certificate 26492a7c2328955c6a3869b31ad1cf7f430c66beedd6dc944b07146072aaf676. -/
def duplicateData85 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 2, support := {5, 8, 10, 11} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 7, support := {3, 5, 6, 9} },
      { center := 8, support := {2, 3, 6, 7} },
      { center := 9, support := {2, 4, 6, 11} }
    ]
    data := {
      p := 2
      q := 4
      r := 6
      a := 5
      b := 9
      ap_aq := { first := (5, 2), steps := [.flip 5 2, .row 2 5 8, .flip 2 8, .row 8 2 6, .flip 8 6, .row 6 8 7, .flip 6 7, .row 7 6 5, .flip 7 5, .row 5 7 4], last := (5, 4) }
      ap_ar := { first := (5, 2), steps := [.flip 5 2, .row 2 5 8, .flip 2 8, .row 8 2 6, .flip 8 6, .row 6 8 5, .flip 6 5], last := (5, 6) }
      bp_bq := { first := (9, 2), steps := [.row 9 2 4], last := (9, 4) }
      bp_br := { first := (9, 2), steps := [.row 9 2 6], last := (9, 6) } } }

theorem duplicateCheck85 : duplicateData85.check = true := by
  native_decide

def cut85 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData85 duplicateCheck85

/-- Journal iteration 86; certificate 795d1c0dae1d7e9767ce9b9e125ef37d9c66868f5ccdc66ebf6ace9cf950b48b. -/
def duplicateData86 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {4, 5, 9, 11} },
      { center := 2, support := {5, 8, 10, 11} },
      { center := 4, support := {6, 7, 10, 11} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 7, support := {3, 5, 6, 9} },
      { center := 10, support := {2, 3, 4, 11} },
      { center := 11, support := {0, 3, 5, 10} }
    ]
    data := {
      p := 0
      q := 2
      r := 4
      a := 5
      b := 11
      ap_aq := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 10, .flip 11 10, .row 10 11 2, .flip 10 2, .row 2 10 5, .flip 2 5], last := (5, 2) }
      ap_ar := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 10, .flip 11 10, .row 10 11 4, .flip 10 4, .row 4 10 6, .flip 4 6, .row 6 4 7, .flip 6 7, .row 7 6 5, .flip 7 5, .row 5 7 4], last := (5, 4) }
      bp_bq := { first := (11, 0), steps := [.row 11 0 10, .flip 11 10, .row 10 11 2, .flip 10 2, .row 2 10 11, .flip 2 11], last := (11, 2) }
      bp_br := { first := (11, 0), steps := [.row 11 0 10, .flip 11 10, .row 10 11 4, .flip 10 4, .row 4 10 11, .flip 4 11], last := (11, 4) } } }

theorem duplicateCheck86 : duplicateData86.check = true := by
  native_decide

def cut86 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData86 duplicateCheck86

/-- Journal iteration 87; certificate 38363aab527209189e755b5cb4e9c5952fbf5130905da37faab5f1e15d409074. -/
def duplicateData87 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 2, support := {5, 8, 10, 11} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 7, support := {3, 5, 6, 9} },
      { center := 8, support := {2, 3, 6, 7} },
      { center := 9, support := {2, 4, 6, 8} }
    ]
    data := {
      p := 2
      q := 4
      r := 6
      a := 5
      b := 9
      ap_aq := { first := (5, 2), steps := [.flip 5 2, .row 2 5 8, .flip 2 8, .row 8 2 6, .flip 8 6, .row 6 8 7, .flip 6 7, .row 7 6 5, .flip 7 5, .row 5 7 4], last := (5, 4) }
      ap_ar := { first := (5, 2), steps := [.flip 5 2, .row 2 5 8, .flip 2 8, .row 8 2 6, .flip 8 6, .row 6 8 5, .flip 6 5], last := (5, 6) }
      bp_bq := { first := (9, 2), steps := [.row 9 2 4], last := (9, 4) }
      bp_br := { first := (9, 2), steps := [.row 9 2 6], last := (9, 6) } } }

theorem duplicateCheck87 : duplicateData87.check = true := by
  native_decide

def cut87 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData87 duplicateCheck87

/-- Journal iteration 88; certificate c56775278d3dbd180d6b41e08446eeee1d10f5072b137784334b4259faa7ae2e. -/
def duplicateData88 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {4, 5, 9, 11} },
      { center := 2, support := {5, 8, 10, 11} },
      { center := 4, support := {6, 7, 10, 11} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 7, support := {3, 5, 6, 9} },
      { center := 8, support := {2, 3, 6, 7} },
      { center := 11, support := {0, 4, 6, 8} }
    ]
    data := {
      p := 0
      q := 2
      r := 4
      a := 5
      b := 11
      ap_aq := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 4, .flip 11 4, .row 4 11 6, .flip 4 6, .row 6 4 8, .flip 6 8, .row 8 6 2, .flip 8 2, .row 2 8 5, .flip 2 5], last := (5, 2) }
      ap_ar := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 4, .flip 11 4, .row 4 11 6, .flip 4 6, .row 6 4 7, .flip 6 7, .row 7 6 5, .flip 7 5, .row 5 7 4], last := (5, 4) }
      bp_bq := { first := (11, 0), steps := [.row 11 0 4, .flip 11 4, .row 4 11 6, .flip 4 6, .row 6 4 8, .flip 6 8, .row 8 6 2, .flip 8 2, .row 2 8 11, .flip 2 11], last := (11, 2) }
      bp_br := { first := (11, 0), steps := [.row 11 0 4], last := (11, 4) } } }

theorem duplicateCheck88 : duplicateData88.check = true := by
  native_decide

def cut88 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData88 duplicateCheck88

/-- Journal iteration 89; certificate 046cd75948f4683092283e3748f0d57e89ae209b7b487522ad7ad54ef74ac316. -/
def duplicateData89 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {4, 5, 9, 11} },
      { center := 2, support := {5, 8, 10, 11} },
      { center := 3, support := {6, 8, 9, 10} },
      { center := 8, support := {2, 3, 6, 7} },
      { center := 9, support := {2, 3, 5, 10} },
      { center := 10, support := {2, 4, 6, 11} },
      { center := 11, support := {0, 3, 4, 10} }
    ]
    data := {
      p := 0
      q := 2
      r := 3
      a := 9
      b := 11
      ap_aq := { first := (9, 0), steps := [.flip 9 0, .row 0 9 11, .flip 0 11, .row 11 0 10, .flip 11 10, .row 10 11 2, .flip 10 2, .row 2 10 8, .flip 2 8, .row 8 2 3, .flip 8 3, .row 3 8 9, .flip 3 9, .row 9 3 2], last := (9, 2) }
      ap_ar := { first := (9, 0), steps := [.flip 9 0, .row 0 9 11, .flip 0 11, .row 11 0 10, .flip 11 10, .row 10 11 2, .flip 10 2, .row 2 10 8, .flip 2 8, .row 8 2 3, .flip 8 3, .row 3 8 9, .flip 3 9], last := (9, 3) }
      bp_bq := { first := (11, 0), steps := [.row 11 0 10, .flip 11 10, .row 10 11 2, .flip 10 2, .row 2 10 11, .flip 2 11], last := (11, 2) }
      bp_br := { first := (11, 0), steps := [.row 11 0 3], last := (11, 3) } } }

theorem duplicateCheck89 : duplicateData89.check = true := by
  native_decide

def cut89 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData89 duplicateCheck89

/-- Journal iteration 90; certificate b92a038c57ad2aa397b034602fb5406de42e9b409a08df36003577687402b2f9. -/
def duplicateData90 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {4, 5, 9, 11} },
      { center := 2, support := {5, 8, 10, 11} },
      { center := 3, support := {6, 8, 9, 10} },
      { center := 4, support := {6, 7, 10, 11} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 8, support := {2, 3, 6, 7} },
      { center := 9, support := {2, 3, 5, 10} },
      { center := 11, support := {0, 3, 4, 8} }
    ]
    data := {
      p := 0
      q := 2
      r := 3
      a := 9
      b := 11
      ap_aq := { first := (9, 0), steps := [.flip 9 0, .row 0 9 11, .flip 0 11, .row 11 0 4, .flip 11 4, .row 4 11 6, .flip 4 6, .row 6 4 8, .flip 6 8, .row 8 6 3, .flip 8 3, .row 3 8 9, .flip 3 9, .row 9 3 2], last := (9, 2) }
      ap_ar := { first := (9, 0), steps := [.flip 9 0, .row 0 9 11, .flip 0 11, .row 11 0 4, .flip 11 4, .row 4 11 6, .flip 4 6, .row 6 4 8, .flip 6 8, .row 8 6 3, .flip 8 3, .row 3 8 9, .flip 3 9], last := (9, 3) }
      bp_bq := { first := (11, 0), steps := [.row 11 0 4, .flip 11 4, .row 4 11 6, .flip 4 6, .row 6 4 8, .flip 6 8, .row 8 6 2, .flip 8 2, .row 2 8 11, .flip 2 11], last := (11, 2) }
      bp_br := { first := (11, 0), steps := [.row 11 0 3], last := (11, 3) } } }

theorem duplicateCheck90 : duplicateData90.check = true := by
  native_decide

def cut90 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData90 duplicateCheck90

/-- Journal iteration 91; certificate 0bb1fd12d529ece2117c4ac06ffbb4fe8f5180bd9665e03167f87a3bced049f5. -/
def duplicateData91 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {4, 5, 9, 11} },
      { center := 2, support := {5, 8, 10, 11} },
      { center := 4, support := {6, 7, 10, 11} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 7, support := {3, 5, 6, 9} },
      { center := 8, support := {2, 3, 6, 7} },
      { center := 11, support := {0, 2, 5, 7} }
    ]
    data := {
      p := 0
      q := 2
      r := 4
      a := 5
      b := 11
      ap_aq := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 2, .flip 11 2, .row 2 11 5, .flip 2 5], last := (5, 2) }
      ap_ar := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 2, .flip 11 2, .row 2 11 8, .flip 2 8, .row 8 2 6, .flip 8 6, .row 6 8 7, .flip 6 7, .row 7 6 5, .flip 7 5, .row 5 7 4], last := (5, 4) }
      bp_bq := { first := (11, 0), steps := [.row 11 0 2], last := (11, 2) }
      bp_br := { first := (11, 0), steps := [.row 11 0 2, .flip 11 2, .row 2 11 8, .flip 2 8, .row 8 2 6, .flip 8 6, .row 6 8 4, .flip 6 4, .row 4 6 11, .flip 4 11], last := (11, 4) } } }

theorem duplicateCheck91 : duplicateData91.check = true := by
  native_decide

def cut91 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData91 duplicateCheck91

/-- Journal iteration 92; certificate b69406dcaba2ac1d64a58c852bc2b8a48928e806e5546d24f0d0bdd64636fe5f. -/
def duplicateData92 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 2, support := {5, 8, 10, 11} },
      { center := 3, support := {6, 8, 9, 10} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 8, support := {2, 3, 6, 7} },
      { center := 9, support := {2, 3, 5, 10} }
    ]
    data := {
      p := 2
      q := 3
      r := 5
      a := 9
      b := 10
      ap_aq := { first := (9, 2), steps := [.row 9 2 3], last := (9, 3) }
      ap_ar := { first := (9, 2), steps := [.row 9 2 5], last := (9, 5) }
      bp_bq := { first := (10, 2), steps := [.flip 10 2, .row 2 10 8, .flip 2 8, .row 8 2 3, .flip 8 3, .row 3 8 10, .flip 3 10], last := (10, 3) }
      bp_br := { first := (10, 2), steps := [.flip 10 2, .row 2 10 8, .flip 2 8, .row 8 2 3, .flip 8 3, .row 3 8 9, .flip 3 9, .row 9 3 5, .flip 9 5, .row 5 9 10, .flip 5 10], last := (10, 5) } } }

theorem duplicateCheck92 : duplicateData92.check = true := by
  native_decide

def cut92 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData92 duplicateCheck92

/-- Journal iteration 93; certificate 38712022a58e6ce94e0bf0077a3de243266bf141d7b04f623a55334536a6d103. -/
def duplicateData93 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 2, support := {5, 8, 10, 11} },
      { center := 3, support := {6, 8, 9, 10} },
      { center := 4, support := {6, 7, 10, 11} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 8, support := {2, 3, 6, 7} },
      { center := 9, support := {2, 3, 4, 11} }
    ]
    data := {
      p := 2
      q := 3
      r := 4
      a := 9
      b := 10
      ap_aq := { first := (9, 2), steps := [.row 9 2 3], last := (9, 3) }
      ap_ar := { first := (9, 2), steps := [.row 9 2 4], last := (9, 4) }
      bp_bq := { first := (10, 2), steps := [.flip 10 2, .row 2 10 8, .flip 2 8, .row 8 2 3, .flip 8 3, .row 3 8 10, .flip 3 10], last := (10, 3) }
      bp_br := { first := (10, 2), steps := [.flip 10 2, .row 2 10 8, .flip 2 8, .row 8 2 6, .flip 8 6, .row 6 8 4, .flip 6 4, .row 4 6 10, .flip 4 10], last := (10, 4) } } }

theorem duplicateCheck93 : duplicateData93.check = true := by
  native_decide

def cut93 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData93 duplicateCheck93

/-- Journal iteration 94; certificate a6539010c93ca0bb0e42e6782939d12d3d84a0bd4d7b6dadf632995f621cbe9a. -/
def duplicateData94 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {4, 5, 9, 11} },
      { center := 2, support := {5, 8, 10, 11} },
      { center := 3, support := {6, 8, 9, 10} },
      { center := 8, support := {2, 3, 6, 7} },
      { center := 9, support := {2, 3, 4, 10} },
      { center := 10, support := {2, 4, 6, 11} },
      { center := 11, support := {0, 3, 5, 10} }
    ]
    data := {
      p := 0
      q := 2
      r := 3
      a := 9
      b := 11
      ap_aq := { first := (9, 0), steps := [.flip 9 0, .row 0 9 11, .flip 0 11, .row 11 0 10, .flip 11 10, .row 10 11 2, .flip 10 2, .row 2 10 8, .flip 2 8, .row 8 2 3, .flip 8 3, .row 3 8 9, .flip 3 9, .row 9 3 2], last := (9, 2) }
      ap_ar := { first := (9, 0), steps := [.flip 9 0, .row 0 9 11, .flip 0 11, .row 11 0 10, .flip 11 10, .row 10 11 2, .flip 10 2, .row 2 10 8, .flip 2 8, .row 8 2 3, .flip 8 3, .row 3 8 9, .flip 3 9], last := (9, 3) }
      bp_bq := { first := (11, 0), steps := [.row 11 0 10, .flip 11 10, .row 10 11 2, .flip 10 2, .row 2 10 11, .flip 2 11], last := (11, 2) }
      bp_br := { first := (11, 0), steps := [.row 11 0 3], last := (11, 3) } } }

theorem duplicateCheck94 : duplicateData94.check = true := by
  native_decide

def cut94 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData94 duplicateCheck94

/-- Journal iteration 95; certificate a4421162a36db84527c6729162b0662c630f079ea2a8a470784567e3b157abd6. -/
def duplicateData95 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 2, support := {5, 8, 10, 11} },
      { center := 3, support := {6, 8, 9, 10} },
      { center := 8, support := {2, 3, 6, 7} },
      { center := 9, support := {2, 3, 4, 10} },
      { center := 10, support := {2, 4, 6, 11} }
    ]
    data := {
      p := 2
      q := 3
      r := 4
      a := 9
      b := 10
      ap_aq := { first := (9, 2), steps := [.row 9 2 3], last := (9, 3) }
      ap_ar := { first := (9, 2), steps := [.row 9 2 4], last := (9, 4) }
      bp_bq := { first := (10, 2), steps := [.flip 10 2, .row 2 10 8, .flip 2 8, .row 8 2 3, .flip 8 3, .row 3 8 10, .flip 3 10], last := (10, 3) }
      bp_br := { first := (10, 2), steps := [.row 10 2 4], last := (10, 4) } } }

theorem duplicateCheck95 : duplicateData95.check = true := by
  native_decide

def cut95 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData95 duplicateCheck95

/-- Journal iteration 96; certificate 5657a33b04c1c5426a5ca393c245a65ac93092412fe91b07454e3fd047d02d87. -/
def duplicateData96 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {4, 5, 9, 11} },
      { center := 2, support := {5, 8, 10, 11} },
      { center := 3, support := {6, 8, 9, 10} },
      { center := 4, support := {6, 7, 10, 11} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 8, support := {2, 3, 6, 7} },
      { center := 9, support := {2, 3, 4, 10} },
      { center := 10, support := {1, 4, 6, 11} },
      { center := 11, support := {0, 3, 5, 10} }
    ]
    data := {
      p := 0
      q := 2
      r := 3
      a := 9
      b := 11
      ap_aq := { first := (9, 0), steps := [.flip 9 0, .row 0 9 11, .flip 0 11, .row 11 0 10, .flip 11 10, .row 10 11 4, .flip 10 4, .row 4 10 6, .flip 4 6, .row 6 4 8, .flip 6 8, .row 8 6 3, .flip 8 3, .row 3 8 9, .flip 3 9, .row 9 3 2], last := (9, 2) }
      ap_ar := { first := (9, 0), steps := [.flip 9 0, .row 0 9 11, .flip 0 11, .row 11 0 10, .flip 11 10, .row 10 11 4, .flip 10 4, .row 4 10 6, .flip 4 6, .row 6 4 8, .flip 6 8, .row 8 6 3, .flip 8 3, .row 3 8 9, .flip 3 9], last := (9, 3) }
      bp_bq := { first := (11, 0), steps := [.row 11 0 10, .flip 11 10, .row 10 11 4, .flip 10 4, .row 4 10 6, .flip 4 6, .row 6 4 8, .flip 6 8, .row 8 6 2, .flip 8 2, .row 2 8 11, .flip 2 11], last := (11, 2) }
      bp_br := { first := (11, 0), steps := [.row 11 0 3], last := (11, 3) } } }

theorem duplicateCheck96 : duplicateData96.check = true := by
  native_decide

def cut96 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData96 duplicateCheck96

/-- Journal iteration 97; certificate 0958d1378aad77bc63ce0eec97908f9c15122ca4e2c0439a4f016802b749f453. -/
def duplicateData97 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 2, support := {5, 8, 10, 11} },
      { center := 3, support := {6, 8, 9, 10} },
      { center := 4, support := {6, 7, 10, 11} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 8, support := {2, 3, 6, 7} },
      { center := 9, support := {2, 3, 4, 10} }
    ]
    data := {
      p := 2
      q := 3
      r := 4
      a := 9
      b := 10
      ap_aq := { first := (9, 2), steps := [.row 9 2 3], last := (9, 3) }
      ap_ar := { first := (9, 2), steps := [.row 9 2 4], last := (9, 4) }
      bp_bq := { first := (10, 2), steps := [.flip 10 2, .row 2 10 8, .flip 2 8, .row 8 2 3, .flip 8 3, .row 3 8 10, .flip 3 10], last := (10, 3) }
      bp_br := { first := (10, 2), steps := [.flip 10 2, .row 2 10 8, .flip 2 8, .row 8 2 6, .flip 8 6, .row 6 8 4, .flip 6 4, .row 4 6 10, .flip 4 10], last := (10, 4) } } }

theorem duplicateCheck97 : duplicateData97.check = true := by
  native_decide

def cut97 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData97 duplicateCheck97

/-- Journal iteration 98; certificate 9a3356bbb0e096632f509bc59077376ffe9eb07a341166624659713c73e51e53. -/
def duplicateData98 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {4, 5, 9, 11} },
      { center := 2, support := {5, 8, 10, 11} },
      { center := 3, support := {6, 8, 9, 10} },
      { center := 8, support := {2, 3, 6, 7} },
      { center := 9, support := {2, 3, 4, 8} },
      { center := 10, support := {2, 4, 6, 11} },
      { center := 11, support := {0, 3, 5, 10} }
    ]
    data := {
      p := 0
      q := 2
      r := 3
      a := 9
      b := 11
      ap_aq := { first := (9, 0), steps := [.flip 9 0, .row 0 9 11, .flip 0 11, .row 11 0 10, .flip 11 10, .row 10 11 2, .flip 10 2, .row 2 10 8, .flip 2 8, .row 8 2 3, .flip 8 3, .row 3 8 9, .flip 3 9, .row 9 3 2], last := (9, 2) }
      ap_ar := { first := (9, 0), steps := [.flip 9 0, .row 0 9 11, .flip 0 11, .row 11 0 10, .flip 11 10, .row 10 11 2, .flip 10 2, .row 2 10 8, .flip 2 8, .row 8 2 3, .flip 8 3, .row 3 8 9, .flip 3 9], last := (9, 3) }
      bp_bq := { first := (11, 0), steps := [.row 11 0 10, .flip 11 10, .row 10 11 2, .flip 10 2, .row 2 10 11, .flip 2 11], last := (11, 2) }
      bp_br := { first := (11, 0), steps := [.row 11 0 3], last := (11, 3) } } }

theorem duplicateCheck98 : duplicateData98.check = true := by
  native_decide

def cut98 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData98 duplicateCheck98

/-- Journal iteration 99; certificate c9505a4e37b89bec3e4d2691b03ac6aab6c8b69aef3e9d7f9e53d16ca084f2d5. -/
def duplicateData99 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 2, support := {5, 8, 10, 11} },
      { center := 3, support := {6, 8, 9, 10} },
      { center := 8, support := {2, 3, 6, 7} },
      { center := 9, support := {2, 3, 4, 8} },
      { center := 10, support := {2, 4, 6, 11} }
    ]
    data := {
      p := 2
      q := 3
      r := 4
      a := 9
      b := 10
      ap_aq := { first := (9, 2), steps := [.row 9 2 3], last := (9, 3) }
      ap_ar := { first := (9, 2), steps := [.row 9 2 4], last := (9, 4) }
      bp_bq := { first := (10, 2), steps := [.flip 10 2, .row 2 10 8, .flip 2 8, .row 8 2 3, .flip 8 3, .row 3 8 10, .flip 3 10], last := (10, 3) }
      bp_br := { first := (10, 2), steps := [.row 10 2 4], last := (10, 4) } } }

theorem duplicateCheck99 : duplicateData99.check = true := by
  native_decide

def cut99 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData99 duplicateCheck99

/-- Journal iteration 100; certificate aee840b80762ec80ea3b5a454d358b20bce5d3072c49ce5c4c9bdc3c0260277a. -/
def duplicateData100 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {4, 5, 9, 11} },
      { center := 2, support := {5, 8, 10, 11} },
      { center := 3, support := {6, 8, 9, 10} },
      { center := 4, support := {6, 7, 10, 11} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 8, support := {2, 3, 6, 7} },
      { center := 9, support := {2, 3, 4, 8} },
      { center := 10, support := {1, 4, 6, 11} },
      { center := 11, support := {0, 3, 5, 10} }
    ]
    data := {
      p := 0
      q := 2
      r := 3
      a := 9
      b := 11
      ap_aq := { first := (9, 0), steps := [.flip 9 0, .row 0 9 11, .flip 0 11, .row 11 0 10, .flip 11 10, .row 10 11 4, .flip 10 4, .row 4 10 6, .flip 4 6, .row 6 4 8, .flip 6 8, .row 8 6 3, .flip 8 3, .row 3 8 9, .flip 3 9, .row 9 3 2], last := (9, 2) }
      ap_ar := { first := (9, 0), steps := [.flip 9 0, .row 0 9 11, .flip 0 11, .row 11 0 10, .flip 11 10, .row 10 11 4, .flip 10 4, .row 4 10 6, .flip 4 6, .row 6 4 8, .flip 6 8, .row 8 6 3, .flip 8 3, .row 3 8 9, .flip 3 9], last := (9, 3) }
      bp_bq := { first := (11, 0), steps := [.row 11 0 10, .flip 11 10, .row 10 11 4, .flip 10 4, .row 4 10 6, .flip 4 6, .row 6 4 8, .flip 6 8, .row 8 6 2, .flip 8 2, .row 2 8 11, .flip 2 11], last := (11, 2) }
      bp_br := { first := (11, 0), steps := [.row 11 0 3], last := (11, 3) } } }

theorem duplicateCheck100 : duplicateData100.check = true := by
  native_decide

def cut100 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData100 duplicateCheck100

/-- Journal iteration 101; certificate 5b9c07ab8e4d576c0e34c98d33d871840da2b891726c367b064df3032ab8aa4d. -/
def duplicateData101 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 2, support := {5, 8, 10, 11} },
      { center := 3, support := {6, 8, 9, 10} },
      { center := 4, support := {6, 7, 10, 11} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 8, support := {2, 3, 6, 7} },
      { center := 9, support := {2, 3, 4, 8} }
    ]
    data := {
      p := 2
      q := 3
      r := 4
      a := 9
      b := 10
      ap_aq := { first := (9, 2), steps := [.row 9 2 3], last := (9, 3) }
      ap_ar := { first := (9, 2), steps := [.row 9 2 4], last := (9, 4) }
      bp_bq := { first := (10, 2), steps := [.flip 10 2, .row 2 10 8, .flip 2 8, .row 8 2 3, .flip 8 3, .row 3 8 10, .flip 3 10], last := (10, 3) }
      bp_br := { first := (10, 2), steps := [.flip 10 2, .row 2 10 8, .flip 2 8, .row 8 2 6, .flip 8 6, .row 6 8 4, .flip 6 4, .row 4 6 10, .flip 4 10], last := (10, 4) } } }

theorem duplicateCheck101 : duplicateData101.check = true := by
  native_decide

def cut101 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData101 duplicateCheck101

/-- Journal iteration 102; certificate 7e5907ad7d5f21facb9a39cb24f1f90246bef52e4c057861720474a2b1c7449b. -/
def duplicateData102 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 2, support := {5, 8, 10, 11} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 7, support := {3, 5, 6, 9} },
      { center := 8, support := {2, 3, 6, 7} }
    ]
    data := {
      p := 2
      q := 6
      r := 7
      a := 5
      b := 8
      ap_aq := { first := (5, 2), steps := [.flip 5 2, .row 2 5 8, .flip 2 8, .row 8 2 6, .flip 8 6, .row 6 8 5, .flip 6 5], last := (5, 6) }
      ap_ar := { first := (5, 2), steps := [.flip 5 2, .row 2 5 8, .flip 2 8, .row 8 2 6, .flip 8 6, .row 6 8 7, .flip 6 7, .row 7 6 5, .flip 7 5], last := (5, 7) }
      bp_bq := { first := (8, 2), steps := [.row 8 2 6], last := (8, 6) }
      bp_br := { first := (8, 2), steps := [.row 8 2 7], last := (8, 7) } } }

theorem duplicateCheck102 : duplicateData102.check = true := by
  native_decide

def cut102 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData102 duplicateCheck102

/-- Journal iteration 103; certificate 2b3054b78b1f1782f6ef92ea56f77552af181453f084e2436fa25c6fbbd860ec. -/
def duplicateData103 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {4, 5, 9, 11} },
      { center := 2, support := {5, 8, 10, 11} },
      { center := 4, support := {6, 7, 10, 11} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 7, support := {3, 5, 6, 9} },
      { center := 10, support := {2, 5, 6, 7} },
      { center := 11, support := {0, 4, 6, 8} }
    ]
    data := {
      p := 0
      q := 2
      r := 4
      a := 5
      b := 11
      ap_aq := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 4, .flip 11 4, .row 4 11 6, .flip 4 6, .row 6 4 7, .flip 6 7, .row 7 6 5, .flip 7 5, .row 5 7 10, .flip 5 10, .row 10 5 2, .flip 10 2, .row 2 10 5, .flip 2 5], last := (5, 2) }
      ap_ar := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 4, .flip 11 4, .row 4 11 6, .flip 4 6, .row 6 4 7, .flip 6 7, .row 7 6 5, .flip 7 5, .row 5 7 4], last := (5, 4) }
      bp_bq := { first := (11, 0), steps := [.row 11 0 4, .flip 11 4, .row 4 11 6, .flip 4 6, .row 6 4 7, .flip 6 7, .row 7 6 5, .flip 7 5, .row 5 7 10, .flip 5 10, .row 10 5 2, .flip 10 2, .row 2 10 11, .flip 2 11], last := (11, 2) }
      bp_br := { first := (11, 0), steps := [.row 11 0 4], last := (11, 4) } } }

theorem duplicateCheck103 : duplicateData103.check = true := by
  native_decide

def cut103 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData103 duplicateCheck103

/-- Journal iteration 104; certificate ec4540fc09890c04d9c559c5a311a2afb68d6b1fd37ad95274ba6a723c1dd887. -/
def duplicateData104 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {4, 5, 9, 11} },
      { center := 2, support := {5, 8, 10, 11} },
      { center := 4, support := {6, 7, 10, 11} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 7, support := {3, 5, 6, 9} },
      { center := 10, support := {2, 5, 6, 7} },
      { center := 11, support := {0, 3, 4, 10} }
    ]
    data := {
      p := 0
      q := 2
      r := 4
      a := 5
      b := 11
      ap_aq := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 4, .flip 11 4, .row 4 11 6, .flip 4 6, .row 6 4 7, .flip 6 7, .row 7 6 5, .flip 7 5, .row 5 7 10, .flip 5 10, .row 10 5 2, .flip 10 2, .row 2 10 5, .flip 2 5], last := (5, 2) }
      ap_ar := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 4, .flip 11 4, .row 4 11 6, .flip 4 6, .row 6 4 7, .flip 6 7, .row 7 6 5, .flip 7 5, .row 5 7 4], last := (5, 4) }
      bp_bq := { first := (11, 0), steps := [.row 11 0 4, .flip 11 4, .row 4 11 6, .flip 4 6, .row 6 4 7, .flip 6 7, .row 7 6 5, .flip 7 5, .row 5 7 10, .flip 5 10, .row 10 5 2, .flip 10 2, .row 2 10 11, .flip 2 11], last := (11, 2) }
      bp_br := { first := (11, 0), steps := [.row 11 0 4], last := (11, 4) } } }

theorem duplicateCheck104 : duplicateData104.check = true := by
  native_decide

def cut104 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData104 duplicateCheck104

/-- Journal iteration 105; certificate 0be3b1c4a82bbc867022cd6286b6c939cd414f5a51b966e8c015af2dfa94bc98. -/
def duplicateData105 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {4, 5, 9, 11} },
      { center := 2, support := {5, 8, 10, 11} },
      { center := 4, support := {6, 7, 10, 11} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 7, support := {3, 5, 6, 9} },
      { center := 10, support := {2, 5, 6, 7} },
      { center := 11, support := {0, 3, 4, 8} }
    ]
    data := {
      p := 0
      q := 2
      r := 4
      a := 5
      b := 11
      ap_aq := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 4, .flip 11 4, .row 4 11 6, .flip 4 6, .row 6 4 7, .flip 6 7, .row 7 6 5, .flip 7 5, .row 5 7 10, .flip 5 10, .row 10 5 2, .flip 10 2, .row 2 10 5, .flip 2 5], last := (5, 2) }
      ap_ar := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 4, .flip 11 4, .row 4 11 6, .flip 4 6, .row 6 4 7, .flip 6 7, .row 7 6 5, .flip 7 5, .row 5 7 4], last := (5, 4) }
      bp_bq := { first := (11, 0), steps := [.row 11 0 4, .flip 11 4, .row 4 11 6, .flip 4 6, .row 6 4 7, .flip 6 7, .row 7 6 5, .flip 7 5, .row 5 7 10, .flip 5 10, .row 10 5 2, .flip 10 2, .row 2 10 11, .flip 2 11], last := (11, 2) }
      bp_br := { first := (11, 0), steps := [.row 11 0 4], last := (11, 4) } } }

theorem duplicateCheck105 : duplicateData105.check = true := by
  native_decide

def cut105 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData105 duplicateCheck105

/-- Journal iteration 106; certificate 36389270d28f2f73d85927d2dc6ea3fe87cfafde282f1c5aee944bf13bdcec97. -/
def duplicateData106 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {4, 5, 9, 11} },
      { center := 2, support := {5, 8, 10, 11} },
      { center := 4, support := {6, 7, 10, 11} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 7, support := {3, 5, 6, 9} },
      { center := 10, support := {2, 5, 6, 7} },
      { center := 11, support := {0, 2, 6, 8} }
    ]
    data := {
      p := 0
      q := 2
      r := 4
      a := 5
      b := 11
      ap_aq := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 2, .flip 11 2, .row 2 11 5, .flip 2 5], last := (5, 2) }
      ap_ar := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 2, .flip 11 2, .row 2 11 10, .flip 2 10, .row 10 2 5, .flip 10 5, .row 5 10 4], last := (5, 4) }
      bp_bq := { first := (11, 0), steps := [.row 11 0 2], last := (11, 2) }
      bp_br := { first := (11, 0), steps := [.row 11 0 2, .flip 11 2, .row 2 11 10, .flip 2 10, .row 10 2 5, .flip 10 5, .row 5 10 7, .flip 5 7, .row 7 5 6, .flip 7 6, .row 6 7 4, .flip 6 4, .row 4 6 11, .flip 4 11], last := (11, 4) } } }

theorem duplicateCheck106 : duplicateData106.check = true := by
  native_decide

def cut106 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData106 duplicateCheck106

/-- Journal iteration 107; certificate f8d2aab78bb4774782388cf66b21840877470279618a29df796d995c4df927e8. -/
def duplicateData107 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {4, 5, 9, 11} },
      { center := 2, support := {5, 8, 10, 11} },
      { center := 4, support := {6, 7, 10, 11} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 7, support := {3, 5, 6, 9} },
      { center := 10, support := {2, 5, 6, 7} },
      { center := 11, support := {0, 2, 3, 9} }
    ]
    data := {
      p := 0
      q := 2
      r := 4
      a := 5
      b := 11
      ap_aq := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 2, .flip 11 2, .row 2 11 5, .flip 2 5], last := (5, 2) }
      ap_ar := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 2, .flip 11 2, .row 2 11 10, .flip 2 10, .row 10 2 5, .flip 10 5, .row 5 10 4], last := (5, 4) }
      bp_bq := { first := (11, 0), steps := [.row 11 0 2], last := (11, 2) }
      bp_br := { first := (11, 0), steps := [.row 11 0 2, .flip 11 2, .row 2 11 10, .flip 2 10, .row 10 2 5, .flip 10 5, .row 5 10 7, .flip 5 7, .row 7 5 6, .flip 7 6, .row 6 7 4, .flip 6 4, .row 4 6 11, .flip 4 11], last := (11, 4) } } }

theorem duplicateCheck107 : duplicateData107.check = true := by
  native_decide

def cut107 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData107 duplicateCheck107

/-- Journal iteration 108; certificate 701b0255f2c28e0ba2952a49061763c6aa352634416e35e03e77a0770891670f. -/
def duplicateData108 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {4, 5, 9, 11} },
      { center := 2, support := {5, 8, 10, 11} },
      { center := 4, support := {6, 7, 10, 11} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 7, support := {3, 5, 6, 9} },
      { center := 10, support := {2, 5, 6, 7} },
      { center := 11, support := {0, 2, 3, 8} }
    ]
    data := {
      p := 0
      q := 2
      r := 4
      a := 5
      b := 11
      ap_aq := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 2, .flip 11 2, .row 2 11 5, .flip 2 5], last := (5, 2) }
      ap_ar := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 2, .flip 11 2, .row 2 11 10, .flip 2 10, .row 10 2 5, .flip 10 5, .row 5 10 4], last := (5, 4) }
      bp_bq := { first := (11, 0), steps := [.row 11 0 2], last := (11, 2) }
      bp_br := { first := (11, 0), steps := [.row 11 0 2, .flip 11 2, .row 2 11 10, .flip 2 10, .row 10 2 5, .flip 10 5, .row 5 10 7, .flip 5 7, .row 7 5 6, .flip 7 6, .row 6 7 4, .flip 6 4, .row 4 6 11, .flip 4 11], last := (11, 4) } } }

theorem duplicateCheck108 : duplicateData108.check = true := by
  native_decide

def cut108 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData108 duplicateCheck108

/-- Journal iteration 109; certificate 31482cd21854eecad7868c88077f1210e168258176e804c07119a16d1e89e232. -/
def duplicateData109 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {4, 5, 9, 11} },
      { center := 2, support := {5, 8, 10, 11} },
      { center := 4, support := {6, 7, 10, 11} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 7, support := {3, 5, 6, 9} },
      { center := 10, support := {2, 5, 6, 7} },
      { center := 11, support := {0, 2, 3, 7} }
    ]
    data := {
      p := 0
      q := 2
      r := 4
      a := 5
      b := 11
      ap_aq := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 2, .flip 11 2, .row 2 11 5, .flip 2 5], last := (5, 2) }
      ap_ar := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 2, .flip 11 2, .row 2 11 10, .flip 2 10, .row 10 2 5, .flip 10 5, .row 5 10 4], last := (5, 4) }
      bp_bq := { first := (11, 0), steps := [.row 11 0 2], last := (11, 2) }
      bp_br := { first := (11, 0), steps := [.row 11 0 2, .flip 11 2, .row 2 11 10, .flip 2 10, .row 10 2 5, .flip 10 5, .row 5 10 7, .flip 5 7, .row 7 5 6, .flip 7 6, .row 6 7 4, .flip 6 4, .row 4 6 11, .flip 4 11], last := (11, 4) } } }

theorem duplicateCheck109 : duplicateData109.check = true := by
  native_decide

def cut109 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData109 duplicateCheck109

/-- Journal iteration 110; certificate dab9c6f14b789074e05350dea774810937ae00651f31e25731cddeff379de379. -/
def duplicateData110 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 2, support := {5, 8, 10, 11} },
      { center := 3, support := {6, 8, 9, 10} },
      { center := 8, support := {2, 3, 5, 10} },
      { center := 10, support := {2, 5, 6, 7} }
    ]
    data := {
      p := 2
      q := 3
      r := 5
      a := 8
      b := 10
      ap_aq := { first := (8, 2), steps := [.row 8 2 3], last := (8, 3) }
      ap_ar := { first := (8, 2), steps := [.row 8 2 5], last := (8, 5) }
      bp_bq := { first := (10, 2), steps := [.flip 10 2, .row 2 10 8, .flip 2 8, .row 8 2 3, .flip 8 3, .row 3 8 10, .flip 3 10], last := (10, 3) }
      bp_br := { first := (10, 2), steps := [.row 10 2 5], last := (10, 5) } } }

theorem duplicateCheck110 : duplicateData110.check = true := by
  native_decide

def cut110 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData110 duplicateCheck110

/-- Journal iteration 111; certificate 3298cddf842772a9ae3504761c092aba7e389cb87d0abdcd390db99710b6ce97. -/
def duplicateData111 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 4, support := {6, 7, 10, 11} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 7, support := {3, 5, 6, 9} },
      { center := 8, support := {2, 3, 5, 10} },
      { center := 10, support := {2, 3, 4, 8} }
    ]
    data := {
      p := 2
      q := 3
      r := 5
      a := 8
      b := 10
      ap_aq := { first := (8, 2), steps := [.row 8 2 3], last := (8, 3) }
      ap_ar := { first := (8, 2), steps := [.row 8 2 5], last := (8, 5) }
      bp_bq := { first := (10, 2), steps := [.row 10 2 3], last := (10, 3) }
      bp_br := { first := (10, 2), steps := [.row 10 2 4, .flip 10 4, .row 4 10 6, .flip 4 6, .row 6 4 7, .flip 6 7, .row 7 6 5, .flip 7 5, .row 5 7 10, .flip 5 10], last := (10, 5) } } }

theorem duplicateCheck111 : duplicateData111.check = true := by
  native_decide

def cut111 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData111 duplicateCheck111

/-- Journal iteration 112; certificate df312816f55b98d82ae05009f09af279631e93677821ddb2969a6995ca3b9f2e. -/
def duplicateData112 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {4, 5, 9, 11} },
      { center := 4, support := {6, 7, 10, 11} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 7, support := {3, 5, 6, 9} },
      { center := 11, support := {0, 4, 6, 8} }
    ]
    data := {
      p := 0
      q := 4
      r := 6
      a := 5
      b := 11
      ap_aq := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 4, .flip 11 4, .row 4 11 6, .flip 4 6, .row 6 4 7, .flip 6 7, .row 7 6 5, .flip 7 5, .row 5 7 4], last := (5, 4) }
      ap_ar := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 4, .flip 11 4, .row 4 11 6, .flip 4 6, .row 6 4 5, .flip 6 5], last := (5, 6) }
      bp_bq := { first := (11, 0), steps := [.row 11 0 4], last := (11, 4) }
      bp_br := { first := (11, 0), steps := [.row 11 0 6], last := (11, 6) } } }

theorem duplicateCheck112 : duplicateData112.check = true := by
  native_decide

def cut112 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData112 duplicateCheck112

/-- Journal iteration 113; certificate bc8cc50845673b65dfb295a3b53bbb5eec23b6a33f12f2203f72ee5be528347d. -/
def duplicateData113 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {4, 5, 9, 11} },
      { center := 4, support := {6, 7, 10, 11} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 7, support := {3, 5, 6, 9} },
      { center := 11, support := {0, 3, 4, 10} }
    ]
    data := {
      p := 0
      q := 4
      r := 10
      a := 5
      b := 11
      ap_aq := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 4, .flip 11 4, .row 4 11 6, .flip 4 6, .row 6 4 7, .flip 6 7, .row 7 6 5, .flip 7 5, .row 5 7 4], last := (5, 4) }
      ap_ar := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 4, .flip 11 4, .row 4 11 6, .flip 4 6, .row 6 4 7, .flip 6 7, .row 7 6 5, .flip 7 5, .row 5 7 10], last := (5, 10) }
      bp_bq := { first := (11, 0), steps := [.row 11 0 4], last := (11, 4) }
      bp_br := { first := (11, 0), steps := [.row 11 0 10], last := (11, 10) } } }

theorem duplicateCheck113 : duplicateData113.check = true := by
  native_decide

def cut113 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData113 duplicateCheck113

/-- Journal iteration 114; certificate 2b1a60b9aec2b14f1db0e3c69cc13d0853499eaa658a98c02590914ac26da666. -/
def duplicateData114 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {4, 5, 9, 11} },
      { center := 4, support := {6, 7, 10, 11} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 7, support := {3, 5, 6, 9} },
      { center := 11, support := {0, 3, 4, 8} }
    ]
    data := {
      p := 0
      q := 5
      r := 7
      a := 4
      b := 9
      ap_aq := { first := (4, 0), steps := [.flip 4 0, .row 0 4 11, .flip 0 11, .row 11 0 4, .flip 11 4, .row 4 11 6, .flip 4 6, .row 6 4 7, .flip 6 7, .row 7 6 5, .flip 7 5, .row 5 7 4, .flip 5 4], last := (4, 5) }
      ap_ar := { first := (4, 0), steps := [.flip 4 0, .row 0 4 11, .flip 0 11, .row 11 0 4, .flip 11 4, .row 4 11 7], last := (4, 7) }
      bp_bq := { first := (9, 0), steps := [.flip 9 0, .row 0 9 11, .flip 0 11, .row 11 0 4, .flip 11 4, .row 4 11 6, .flip 4 6, .row 6 4 7, .flip 6 7, .row 7 6 5, .flip 7 5, .row 5 7 9, .flip 5 9], last := (9, 5) }
      bp_br := { first := (9, 0), steps := [.flip 9 0, .row 0 9 11, .flip 0 11, .row 11 0 4, .flip 11 4, .row 4 11 6, .flip 4 6, .row 6 4 7, .flip 6 7, .row 7 6 9, .flip 7 9], last := (9, 7) } } }

theorem duplicateCheck114 : duplicateData114.check = true := by
  native_decide

def cut114 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData114 duplicateCheck114

/-- Journal iteration 115; certificate dac17c94f1338d0fe131afbd45b35e7f3b631ddb90fd4ad6a228d56a5d8638b1. -/
def duplicateData115 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {4, 5, 9, 11} },
      { center := 2, support := {5, 8, 10, 11} },
      { center := 8, support := {2, 3, 5, 10} },
      { center := 11, support := {0, 2, 6, 8} }
    ]
    data := {
      p := 0
      q := 2
      r := 8
      a := 5
      b := 11
      ap_aq := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 2, .flip 11 2, .row 2 11 5, .flip 2 5], last := (5, 2) }
      ap_ar := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 2, .flip 11 2, .row 2 11 8, .flip 2 8, .row 8 2 5, .flip 8 5], last := (5, 8) }
      bp_bq := { first := (11, 0), steps := [.row 11 0 2], last := (11, 2) }
      bp_br := { first := (11, 0), steps := [.row 11 0 8], last := (11, 8) } } }

theorem duplicateCheck115 : duplicateData115.check = true := by
  native_decide

def cut115 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData115 duplicateCheck115

/-- Journal iteration 116; certificate 4f1fe55311732105194b17926e1a4464de54f5b21d1d496c1506e398b20f44e3. -/
def duplicateData116 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 4, support := {6, 7, 10, 11} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 7, support := {3, 5, 6, 9} },
      { center := 9, support := {3, 4, 6, 11} }
    ]
    data := {
      p := 3
      q := 4
      r := 6
      a := 7
      b := 9
      ap_aq := { first := (7, 3), steps := [.row 7 3 6, .flip 7 6, .row 6 7 4, .flip 6 4, .row 4 6 7, .flip 4 7], last := (7, 4) }
      ap_ar := { first := (7, 3), steps := [.row 7 3 6], last := (7, 6) }
      bp_bq := { first := (9, 3), steps := [.row 9 3 4], last := (9, 4) }
      bp_br := { first := (9, 3), steps := [.row 9 3 6], last := (9, 6) } } }

theorem duplicateCheck116 : duplicateData116.check = true := by
  native_decide

def cut116 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData116 duplicateCheck116

/-- Journal iteration 117; certificate 8e5181938913d6d86d71c0a7c1b8924afd4656b805f91cbcc4e6a3a60f36bbc8. -/
def duplicateData117 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 2, support := {5, 8, 10, 11} },
      { center := 3, support := {6, 8, 9, 10} },
      { center := 4, support := {6, 7, 10, 11} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 7, support := {3, 5, 6, 9} },
      { center := 8, support := {2, 3, 5, 10} },
      { center := 10, support := {2, 4, 6, 11} }
    ]
    data := {
      p := 2
      q := 3
      r := 5
      a := 8
      b := 10
      ap_aq := { first := (8, 2), steps := [.row 8 2 3], last := (8, 3) }
      ap_ar := { first := (8, 2), steps := [.row 8 2 5], last := (8, 5) }
      bp_bq := { first := (10, 2), steps := [.flip 10 2, .row 2 10 8, .flip 2 8, .row 8 2 3, .flip 8 3, .row 3 8 10, .flip 3 10], last := (10, 3) }
      bp_br := { first := (10, 2), steps := [.row 10 2 4, .flip 10 4, .row 4 10 6, .flip 4 6, .row 6 4 7, .flip 6 7, .row 7 6 5, .flip 7 5, .row 5 7 10, .flip 5 10], last := (10, 5) } } }

theorem duplicateCheck117 : duplicateData117.check = true := by
  native_decide

def cut117 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData117 duplicateCheck117

/-- Journal iteration 118; certificate 54acdbcba11734592739ac86d561c0dccbf67739fe33c0bddc52527518d5aab1. -/
def duplicateData118 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 4, support := {6, 7, 10, 11} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 7, support := {3, 5, 6, 9} },
      { center := 8, support := {2, 3, 5, 10} },
      { center := 10, support := {2, 3, 4, 11} }
    ]
    data := {
      p := 2
      q := 3
      r := 5
      a := 8
      b := 10
      ap_aq := { first := (8, 2), steps := [.row 8 2 3], last := (8, 3) }
      ap_ar := { first := (8, 2), steps := [.row 8 2 5], last := (8, 5) }
      bp_bq := { first := (10, 2), steps := [.row 10 2 3], last := (10, 3) }
      bp_br := { first := (10, 2), steps := [.row 10 2 4, .flip 10 4, .row 4 10 6, .flip 4 6, .row 6 4 7, .flip 6 7, .row 7 6 5, .flip 7 5, .row 5 7 10, .flip 5 10], last := (10, 5) } } }

theorem duplicateCheck118 : duplicateData118.check = true := by
  native_decide

def cut118 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData118 duplicateCheck118

/-- Journal iteration 119; certificate d0abf34e0ea88ad6fe0aad27a36e5e44f0d8f9d0f5fbb334dbac76cc691e7926. -/
def duplicateData119 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 3, support := {6, 8, 9, 10} },
      { center := 8, support := {2, 3, 5, 10} },
      { center := 9, support := {3, 4, 6, 8} },
      { center := 11, support := {0, 2, 3, 9} }
    ]
    data := {
      p := 2
      q := 3
      r := 9
      a := 8
      b := 11
      ap_aq := { first := (8, 2), steps := [.row 8 2 3], last := (8, 3) }
      ap_ar := { first := (8, 2), steps := [.row 8 2 3, .flip 8 3, .row 3 8 9, .flip 3 9, .row 9 3 8, .flip 9 8], last := (8, 9) }
      bp_bq := { first := (11, 2), steps := [.row 11 2 3], last := (11, 3) }
      bp_br := { first := (11, 2), steps := [.row 11 2 9], last := (11, 9) } } }

theorem duplicateCheck119 : duplicateData119.check = true := by
  native_decide

def cut119 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData119 duplicateCheck119

/-- Journal iteration 120; certificate e3f46ea7ae6f8f6f2075151c1cc9f404352ac58dee1719ff9fec5f09703f47f6. -/
def duplicateData120 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {4, 5, 9, 11} },
      { center := 2, support := {5, 8, 10, 11} },
      { center := 8, support := {2, 3, 5, 10} },
      { center := 11, support := {0, 2, 3, 8} }
    ]
    data := {
      p := 0
      q := 2
      r := 8
      a := 5
      b := 11
      ap_aq := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 2, .flip 11 2, .row 2 11 5, .flip 2 5], last := (5, 2) }
      ap_ar := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 2, .flip 11 2, .row 2 11 8, .flip 2 8, .row 8 2 5, .flip 8 5], last := (5, 8) }
      bp_bq := { first := (11, 0), steps := [.row 11 0 2], last := (11, 2) }
      bp_br := { first := (11, 0), steps := [.row 11 0 8], last := (11, 8) } } }

theorem duplicateCheck120 : duplicateData120.check = true := by
  native_decide

def cut120 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData120 duplicateCheck120

/-- Journal iteration 121; certificate a1261c4ea8adb8c900235d1ab3932ea370ecde048f3833bc488b0407ebcb3c23. -/
def duplicateData121 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 4, support := {6, 7, 10, 11} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 7, support := {3, 5, 6, 9} },
      { center := 9, support := {3, 4, 6, 8} }
    ]
    data := {
      p := 3
      q := 4
      r := 6
      a := 7
      b := 9
      ap_aq := { first := (7, 3), steps := [.row 7 3 6, .flip 7 6, .row 6 7 4, .flip 6 4, .row 4 6 7, .flip 4 7], last := (7, 4) }
      ap_ar := { first := (7, 3), steps := [.row 7 3 6], last := (7, 6) }
      bp_bq := { first := (9, 3), steps := [.row 9 3 4], last := (9, 4) }
      bp_br := { first := (9, 3), steps := [.row 9 3 6], last := (9, 6) } } }

theorem duplicateCheck121 : duplicateData121.check = true := by
  native_decide

def cut121 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData121 duplicateCheck121

/-- Journal iteration 122; certificate d9f5b55427113ab6194604051475fdae87daf5de26e675a3f95d6f37aac671bd. -/
def duplicateData122 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {4, 5, 9, 11} },
      { center := 2, support := {5, 8, 10, 11} },
      { center := 3, support := {6, 8, 9, 10} },
      { center := 4, support := {6, 7, 10, 11} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 7, support := {3, 5, 6, 9} },
      { center := 8, support := {2, 3, 5, 10} },
      { center := 9, support := {2, 5, 6, 7} },
      { center := 10, support := {3, 4, 6, 11} },
      { center := 11, support := {0, 2, 3, 9} }
    ]
    data := {
      p := 0
      q := 2
      r := 3
      a := 9
      b := 11
      ap_aq := { first := (9, 0), steps := [.flip 9 0, .row 0 9 11, .flip 0 11, .row 11 0 2, .flip 11 2, .row 2 11 8, .flip 2 8, .row 8 2 3, .flip 8 3, .row 3 8 10, .flip 3 10, .row 10 3 4, .flip 10 4, .row 4 10 6, .flip 4 6, .row 6 4 7, .flip 6 7, .row 7 6 9, .flip 7 9, .row 9 7 2], last := (9, 2) }
      ap_ar := { first := (9, 0), steps := [.flip 9 0, .row 0 9 11, .flip 0 11, .row 11 0 2, .flip 11 2, .row 2 11 8, .flip 2 8, .row 8 2 3, .flip 8 3, .row 3 8 9, .flip 3 9], last := (9, 3) }
      bp_bq := { first := (11, 0), steps := [.row 11 0 2], last := (11, 2) }
      bp_br := { first := (11, 0), steps := [.row 11 0 3], last := (11, 3) } } }

theorem duplicateCheck122 : duplicateData122.check = true := by
  native_decide

def cut122 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData122 duplicateCheck122

/-- Journal iteration 123; certificate 1725328467e629a370dc5a740b65d03830b117ba0a4e6b9ca0171523bcc39092. -/
def duplicateData123 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {4, 5, 9, 11} },
      { center := 2, support := {5, 8, 10, 11} },
      { center := 3, support := {6, 8, 9, 10} },
      { center := 4, support := {6, 7, 10, 11} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 7, support := {3, 5, 6, 9} },
      { center := 8, support := {2, 3, 5, 10} },
      { center := 9, support := {2, 5, 6, 7} },
      { center := 10, support := {3, 4, 6, 11} },
      { center := 11, support := {0, 2, 3, 7} }
    ]
    data := {
      p := 0
      q := 2
      r := 3
      a := 9
      b := 11
      ap_aq := { first := (9, 0), steps := [.flip 9 0, .row 0 9 11, .flip 0 11, .row 11 0 2, .flip 11 2, .row 2 11 8, .flip 2 8, .row 8 2 3, .flip 8 3, .row 3 8 10, .flip 3 10, .row 10 3 4, .flip 10 4, .row 4 10 6, .flip 4 6, .row 6 4 7, .flip 6 7, .row 7 6 9, .flip 7 9, .row 9 7 2], last := (9, 2) }
      ap_ar := { first := (9, 0), steps := [.flip 9 0, .row 0 9 11, .flip 0 11, .row 11 0 2, .flip 11 2, .row 2 11 8, .flip 2 8, .row 8 2 3, .flip 8 3, .row 3 8 9, .flip 3 9], last := (9, 3) }
      bp_bq := { first := (11, 0), steps := [.row 11 0 2], last := (11, 2) }
      bp_br := { first := (11, 0), steps := [.row 11 0 3], last := (11, 3) } } }

theorem duplicateCheck123 : duplicateData123.check = true := by
  native_decide

def cut123 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData123 duplicateCheck123

/-- Journal iteration 124; certificate ed1991240957602a01a5a2807914a9ce15fab70ea704bd8b50600c75859cfec8. -/
def duplicateData124 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 3, support := {6, 8, 9, 10} },
      { center := 4, support := {6, 7, 10, 11} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 7, support := {3, 5, 6, 9} },
      { center := 8, support := {2, 3, 5, 10} },
      { center := 9, support := {2, 5, 6, 7} },
      { center := 10, support := {3, 4, 6, 11} }
    ]
    data := {
      p := 2
      q := 3
      r := 5
      a := 8
      b := 9
      ap_aq := { first := (8, 2), steps := [.row 8 2 3], last := (8, 3) }
      ap_ar := { first := (8, 2), steps := [.row 8 2 5], last := (8, 5) }
      bp_bq := { first := (9, 2), steps := [.row 9 2 7, .flip 9 7, .row 7 9 6, .flip 7 6, .row 6 7 4, .flip 6 4, .row 4 6 10, .flip 4 10, .row 10 4 3, .flip 10 3, .row 3 10 9, .flip 3 9], last := (9, 3) }
      bp_br := { first := (9, 2), steps := [.row 9 2 5], last := (9, 5) } } }

theorem duplicateCheck124 : duplicateData124.check = true := by
  native_decide

def cut124 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData124 duplicateCheck124

/-- Journal iteration 125; certificate 0407eee1c4f964cd4b4f8a6de1befb5a85fca148d3f8bb37a5a587d8143570e7. -/
def duplicateData125 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {4, 5, 9, 11} },
      { center := 2, support := {5, 8, 10, 11} },
      { center := 3, support := {6, 8, 9, 10} },
      { center := 4, support := {6, 7, 10, 11} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 7, support := {3, 5, 6, 9} },
      { center := 8, support := {2, 3, 5, 10} },
      { center := 9, support := {2, 5, 6, 7} },
      { center := 10, support := {3, 4, 6, 8} },
      { center := 11, support := {0, 2, 3, 9} }
    ]
    data := {
      p := 0
      q := 2
      r := 3
      a := 9
      b := 11
      ap_aq := { first := (9, 0), steps := [.flip 9 0, .row 0 9 11, .flip 0 11, .row 11 0 2, .flip 11 2, .row 2 11 8, .flip 2 8, .row 8 2 10, .flip 8 10, .row 10 8 4, .flip 10 4, .row 4 10 6, .flip 4 6, .row 6 4 7, .flip 6 7, .row 7 6 9, .flip 7 9, .row 9 7 2], last := (9, 2) }
      ap_ar := { first := (9, 0), steps := [.flip 9 0, .row 0 9 11, .flip 0 11, .row 11 0 2, .flip 11 2, .row 2 11 8, .flip 2 8, .row 8 2 3, .flip 8 3, .row 3 8 9, .flip 3 9], last := (9, 3) }
      bp_bq := { first := (11, 0), steps := [.row 11 0 2], last := (11, 2) }
      bp_br := { first := (11, 0), steps := [.row 11 0 3], last := (11, 3) } } }

theorem duplicateCheck125 : duplicateData125.check = true := by
  native_decide

def cut125 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData125 duplicateCheck125

/-- Journal iteration 126; certificate 58880b537c8171a37f73c89e28cebf1399557f3128b1efa7292367afa5eaf512. -/
def duplicateData126 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {4, 5, 9, 11} },
      { center := 2, support := {5, 8, 10, 11} },
      { center := 3, support := {6, 8, 9, 10} },
      { center := 4, support := {6, 7, 10, 11} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 7, support := {3, 5, 6, 9} },
      { center := 8, support := {2, 3, 5, 10} },
      { center := 9, support := {2, 5, 6, 7} },
      { center := 10, support := {3, 4, 6, 8} },
      { center := 11, support := {0, 2, 3, 7} }
    ]
    data := {
      p := 0
      q := 2
      r := 3
      a := 9
      b := 11
      ap_aq := { first := (9, 0), steps := [.flip 9 0, .row 0 9 11, .flip 0 11, .row 11 0 2, .flip 11 2, .row 2 11 8, .flip 2 8, .row 8 2 10, .flip 8 10, .row 10 8 4, .flip 10 4, .row 4 10 6, .flip 4 6, .row 6 4 7, .flip 6 7, .row 7 6 9, .flip 7 9, .row 9 7 2], last := (9, 2) }
      ap_ar := { first := (9, 0), steps := [.flip 9 0, .row 0 9 11, .flip 0 11, .row 11 0 2, .flip 11 2, .row 2 11 8, .flip 2 8, .row 8 2 3, .flip 8 3, .row 3 8 9, .flip 3 9], last := (9, 3) }
      bp_bq := { first := (11, 0), steps := [.row 11 0 2], last := (11, 2) }
      bp_br := { first := (11, 0), steps := [.row 11 0 3], last := (11, 3) } } }

theorem duplicateCheck126 : duplicateData126.check = true := by
  native_decide

def cut126 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData126 duplicateCheck126

/-- Journal iteration 127; certificate fd0b7b7166f9cbc36a50de4c448eaa6044c57653eb678116cb7193c59e896dc8. -/
def duplicateData127 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {4, 5, 9, 11} },
      { center := 1, support := {7, 8, 9, 11} },
      { center := 2, support := {5, 8, 10, 11} },
      { center := 4, support := {6, 7, 10, 11} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 7, support := {3, 5, 6, 9} },
      { center := 8, support := {2, 3, 5, 10} },
      { center := 9, support := {2, 5, 6, 7} },
      { center := 10, support := {3, 4, 6, 8} },
      { center := 11, support := {0, 1, 4, 10} }
    ]
    data := {
      p := 0
      q := 1
      r := 2
      a := 9
      b := 11
      ap_aq := { first := (9, 0), steps := [.flip 9 0, .row 0 9 11, .flip 0 11, .row 11 0 1, .flip 11 1, .row 1 11 9, .flip 1 9], last := (9, 1) }
      ap_ar := { first := (9, 0), steps := [.flip 9 0, .row 0 9 11, .flip 0 11, .row 11 0 4, .flip 11 4, .row 4 11 6, .flip 4 6, .row 6 4 7, .flip 6 7, .row 7 6 9, .flip 7 9, .row 9 7 2], last := (9, 2) }
      bp_bq := { first := (11, 0), steps := [.row 11 0 1], last := (11, 1) }
      bp_br := { first := (11, 0), steps := [.row 11 0 4, .flip 11 4, .row 4 11 10, .flip 4 10, .row 10 4 8, .flip 10 8, .row 8 10 2, .flip 8 2, .row 2 8 11, .flip 2 11], last := (11, 2) } } }

theorem duplicateCheck127 : duplicateData127.check = true := by
  native_decide

def cut127 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData127 duplicateCheck127

/-- Journal iteration 128; certificate 1d73508c9da68b23ce67007aceb351a5e0615fab03a366d2debcbb93c911eafb. -/
def duplicateData128 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {4, 5, 9, 11} },
      { center := 1, support := {7, 8, 9, 11} },
      { center := 2, support := {5, 8, 10, 11} },
      { center := 4, support := {6, 7, 10, 11} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 7, support := {3, 5, 6, 9} },
      { center := 8, support := {2, 3, 5, 10} },
      { center := 9, support := {2, 5, 6, 7} },
      { center := 10, support := {3, 4, 6, 8} },
      { center := 11, support := {0, 1, 4, 6} }
    ]
    data := {
      p := 0
      q := 1
      r := 2
      a := 9
      b := 11
      ap_aq := { first := (9, 0), steps := [.flip 9 0, .row 0 9 11, .flip 0 11, .row 11 0 1, .flip 11 1, .row 1 11 9, .flip 1 9], last := (9, 1) }
      ap_ar := { first := (9, 0), steps := [.flip 9 0, .row 0 9 11, .flip 0 11, .row 11 0 4, .flip 11 4, .row 4 11 6, .flip 4 6, .row 6 4 7, .flip 6 7, .row 7 6 9, .flip 7 9, .row 9 7 2], last := (9, 2) }
      bp_bq := { first := (11, 0), steps := [.row 11 0 1], last := (11, 1) }
      bp_br := { first := (11, 0), steps := [.row 11 0 4, .flip 11 4, .row 4 11 10, .flip 4 10, .row 10 4 8, .flip 10 8, .row 8 10 2, .flip 8 2, .row 2 8 11, .flip 2 11], last := (11, 2) } } }

theorem duplicateCheck128 : duplicateData128.check = true := by
  native_decide

def cut128 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData128 duplicateCheck128

/-- Journal iteration 129; certificate 879bddd38c82d09375ef2b64c5aa195f3e8f40ea6bb9af3e10ddeb59372f5419. -/
def duplicateData129 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 3, support := {6, 8, 9, 10} },
      { center := 4, support := {6, 7, 10, 11} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 7, support := {3, 5, 6, 9} },
      { center := 8, support := {2, 3, 5, 10} },
      { center := 9, support := {2, 5, 6, 7} },
      { center := 10, support := {3, 4, 6, 8} }
    ]
    data := {
      p := 2
      q := 3
      r := 5
      a := 8
      b := 9
      ap_aq := { first := (8, 2), steps := [.row 8 2 3], last := (8, 3) }
      ap_ar := { first := (8, 2), steps := [.row 8 2 5], last := (8, 5) }
      bp_bq := { first := (9, 2), steps := [.row 9 2 7, .flip 9 7, .row 7 9 6, .flip 7 6, .row 6 7 4, .flip 6 4, .row 4 6 10, .flip 4 10, .row 10 4 3, .flip 10 3, .row 3 10 9, .flip 3 9], last := (9, 3) }
      bp_br := { first := (9, 2), steps := [.row 9 2 5], last := (9, 5) } } }

theorem duplicateCheck129 : duplicateData129.check = true := by
  native_decide

def cut129 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData129 duplicateCheck129

/-- Journal iteration 130; certificate ec970d366d64a0a855fd92a03ed8b3edced47c518a32e9517d5f312fd6ef903f. -/
def duplicateData130 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {4, 5, 9, 11} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 7, support := {3, 5, 6, 9} },
      { center := 9, support := {2, 5, 6, 7} }
    ]
    data := {
      p := 4
      q := 5
      r := 9
      a := 0
      b := 6
      ap_aq := { first := (0, 4), steps := [.row 0 4 5], last := (0, 5) }
      ap_ar := { first := (0, 4), steps := [.row 0 4 9], last := (0, 9) }
      bp_bq := { first := (6, 4), steps := [.row 6 4 5], last := (6, 5) }
      bp_br := { first := (6, 4), steps := [.row 6 4 7, .flip 6 7, .row 7 6 9, .flip 7 9, .row 9 7 6, .flip 9 6], last := (6, 9) } } }

theorem duplicateCheck130 : duplicateData130.check = true := by
  native_decide

def cut130 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData130 duplicateCheck130

/-- Journal iteration 131; certificate d9986b84e037679ce3ad7a19c74acc956f1c6c69165caded06a384a0b16931a8. -/
def duplicateData131 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 2, support := {5, 8, 10, 11} },
      { center := 4, support := {6, 7, 10, 11} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 7, support := {3, 5, 6, 9} },
      { center := 8, support := {2, 3, 5, 10} },
      { center := 10, support := {3, 4, 6, 8} }
    ]
    data := {
      p := 2
      q := 3
      r := 5
      a := 8
      b := 10
      ap_aq := { first := (8, 2), steps := [.row 8 2 3], last := (8, 3) }
      ap_ar := { first := (8, 2), steps := [.row 8 2 5], last := (8, 5) }
      bp_bq := { first := (10, 2), steps := [.flip 10 2, .row 2 10 8, .flip 2 8, .row 8 2 10, .flip 8 10, .row 10 8 3], last := (10, 3) }
      bp_br := { first := (10, 2), steps := [.flip 10 2, .row 2 10 8, .flip 2 8, .row 8 2 10, .flip 8 10, .row 10 8 4, .flip 10 4, .row 4 10 6, .flip 4 6, .row 6 4 7, .flip 6 7, .row 7 6 5, .flip 7 5, .row 5 7 10, .flip 5 10], last := (10, 5) } } }

theorem duplicateCheck131 : duplicateData131.check = true := by
  native_decide

def cut131 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData131 duplicateCheck131

/-- Journal iteration 132; certificate 98b80eebe9eb666c2f5c9a62c2fd6ec3ee96816589dce339747eec5b277dfcf5. -/
def duplicateData132 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {4, 5, 9, 11} },
      { center := 4, support := {6, 7, 10, 11} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 7, support := {3, 5, 6, 9} }
    ]
    data := {
      p := 4
      q := 5
      r := 9
      a := 0
      b := 7
      ap_aq := { first := (0, 4), steps := [.row 0 4 5], last := (0, 5) }
      ap_ar := { first := (0, 4), steps := [.row 0 4 9], last := (0, 9) }
      bp_bq := { first := (7, 4), steps := [.flip 7 4, .row 4 7 6, .flip 4 6, .row 6 4 7, .flip 6 7, .row 7 6 5], last := (7, 5) }
      bp_br := { first := (7, 4), steps := [.flip 7 4, .row 4 7 6, .flip 4 6, .row 6 4 7, .flip 6 7, .row 7 6 9], last := (7, 9) } } }

theorem duplicateCheck132 : duplicateData132.check = true := by
  native_decide

def cut132 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData132 duplicateCheck132

/-- Journal iteration 133; certificate 3e380c6fade67c1fba95bf95b046be822de9daf053ef54e5bfc951f443660cc2. -/
def duplicateData133 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 2, support := {5, 8, 10, 11} },
      { center := 3, support := {6, 8, 9, 10} },
      { center := 4, support := {6, 7, 10, 11} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 8, support := {3, 5, 6, 9} },
      { center := 10, support := {2, 4, 6, 8} }
    ]
    data := {
      p := 2
      q := 3
      r := 6
      a := 8
      b := 10
      ap_aq := { first := (8, 2), steps := [.flip 8 2, .row 2 8 10, .flip 2 10, .row 10 2 4, .flip 10 4, .row 4 10 6, .flip 4 6, .row 6 4 8, .flip 6 8, .row 8 6 3], last := (8, 3) }
      ap_ar := { first := (8, 2), steps := [.flip 8 2, .row 2 8 10, .flip 2 10, .row 10 2 4, .flip 10 4, .row 4 10 6, .flip 4 6, .row 6 4 8, .flip 6 8], last := (8, 6) }
      bp_bq := { first := (10, 2), steps := [.row 10 2 4, .flip 10 4, .row 4 10 6, .flip 4 6, .row 6 4 8, .flip 6 8, .row 8 6 3, .flip 8 3, .row 3 8 10, .flip 3 10], last := (10, 3) }
      bp_br := { first := (10, 2), steps := [.row 10 2 6], last := (10, 6) } } }

theorem duplicateCheck133 : duplicateData133.check = true := by
  native_decide

def cut133 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData133 duplicateCheck133

/-- Journal iteration 134; certificate 1e12cbb72de7b8fb16d6a6232379f503cc280c8b923703cee8cdee18ca2a2b2f. -/
def duplicateData134 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 2, support := {5, 8, 10, 11} },
      { center := 3, support := {6, 8, 9, 10} },
      { center := 8, support := {3, 5, 6, 9} },
      { center := 9, support := {2, 5, 6, 7} },
      { center := 10, support := {2, 3, 4, 8} }
    ]
    data := {
      p := 2
      q := 5
      r := 6
      a := 8
      b := 9
      ap_aq := { first := (8, 2), steps := [.flip 8 2, .row 2 8 10, .flip 2 10, .row 10 2 3, .flip 10 3, .row 3 10 8, .flip 3 8, .row 8 3 5], last := (8, 5) }
      ap_ar := { first := (8, 2), steps := [.flip 8 2, .row 2 8 10, .flip 2 10, .row 10 2 3, .flip 10 3, .row 3 10 8, .flip 3 8, .row 8 3 6], last := (8, 6) }
      bp_bq := { first := (9, 2), steps := [.row 9 2 5], last := (9, 5) }
      bp_br := { first := (9, 2), steps := [.row 9 2 6], last := (9, 6) } } }

theorem duplicateCheck134 : duplicateData134.check = true := by
  native_decide

def cut134 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData134 duplicateCheck134

/-- Journal iteration 135; certificate 9fbee8bccd924e1e99b1bd44e7eaa8719af27291b81b65dcd6c466d854d7d246. -/
def duplicateData135 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 3, support := {6, 8, 9, 10} },
      { center := 4, support := {6, 7, 10, 11} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 7, support := {3, 4, 6, 11} },
      { center := 8, support := {3, 5, 6, 9} },
      { center := 10, support := {1, 4, 6, 8} }
    ]
    data := {
      p := 3
      q := 4
      r := 6
      a := 7
      b := 10
      ap_aq := { first := (7, 3), steps := [.row 7 3 4], last := (7, 4) }
      ap_ar := { first := (7, 3), steps := [.row 7 3 6], last := (7, 6) }
      bp_bq := { first := (10, 3), steps := [.flip 10 3, .row 3 10 8, .flip 3 8, .row 8 3 6, .flip 8 6, .row 6 8 4, .flip 6 4, .row 4 6 10, .flip 4 10], last := (10, 4) }
      bp_br := { first := (10, 3), steps := [.flip 10 3, .row 3 10 8, .flip 3 8, .row 8 3 6, .flip 8 6, .row 6 8 4, .flip 6 4, .row 4 6 10, .flip 4 10, .row 10 4 6], last := (10, 6) } } }

theorem duplicateCheck135 : duplicateData135.check = true := by
  native_decide

def cut135 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData135 duplicateCheck135

/-- Journal iteration 136; certificate 8cd93fed92e1842aac0f000d3332f23d72f87b27ba0a16a59d9b018717da331f. -/
def duplicateData136 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 3, support := {6, 8, 9, 10} },
      { center := 4, support := {6, 7, 10, 11} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 10, support := {1, 3, 4, 8} }
    ]
    data := {
      p := 3
      q := 4
      r := 8
      a := 6
      b := 10
      ap_aq := { first := (6, 3), steps := [.flip 6 3, .row 3 6 10, .flip 3 10, .row 10 3 4, .flip 10 4, .row 4 10 6, .flip 4 6], last := (6, 4) }
      ap_ar := { first := (6, 3), steps := [.flip 6 3, .row 3 6 10, .flip 3 10, .row 10 3 4, .flip 10 4, .row 4 10 6, .flip 4 6, .row 6 4 8], last := (6, 8) }
      bp_bq := { first := (10, 3), steps := [.row 10 3 4], last := (10, 4) }
      bp_br := { first := (10, 3), steps := [.row 10 3 8], last := (10, 8) } } }

theorem duplicateCheck136 : duplicateData136.check = true := by
  native_decide

def cut136 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData136 duplicateCheck136

/-- Journal iteration 137; certificate bc9e89740c9a1fa330c0cf0ef6237279bf88cb6ff625753ef445a8ec903a9fd5. -/
def duplicateData137 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 3, support := {6, 8, 9, 10} },
      { center := 4, support := {6, 7, 10, 11} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 7, support := {3, 4, 6, 11} },
      { center := 8, support := {3, 5, 6, 9} }
    ]
    data := {
      p := 6
      q := 7
      r := 10
      a := 3
      b := 4
      ap_aq := { first := (3, 6), steps := [.row 3 6 8, .flip 3 8, .row 8 3 6, .flip 8 6, .row 6 8 7, .flip 6 7, .row 7 6 3, .flip 7 3], last := (3, 7) }
      ap_ar := { first := (3, 6), steps := [.row 3 6 10], last := (3, 10) }
      bp_bq := { first := (4, 6), steps := [.row 4 6 7], last := (4, 7) }
      bp_br := { first := (4, 6), steps := [.row 4 6 10], last := (4, 10) } } }

theorem duplicateCheck137 : duplicateData137.check = true := by
  native_decide

def cut137 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData137 duplicateCheck137

/-- Journal iteration 138; certificate e66c3ec4ed3bc814ddd9db189e0a1e81bc3da4b8b25098d9a586dab7378ce13d. -/
def duplicateData138 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 3, support := {6, 8, 9, 10} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 7, support := {3, 4, 6, 11} },
      { center := 8, support := {3, 5, 6, 7} }
    ]
    data := {
      p := 3
      q := 4
      r := 8
      a := 6
      b := 7
      ap_aq := { first := (6, 3), steps := [.flip 6 3, .row 3 6 8, .flip 3 8, .row 8 3 6, .flip 8 6, .row 6 8 4], last := (6, 4) }
      ap_ar := { first := (6, 3), steps := [.flip 6 3, .row 3 6 8, .flip 3 8, .row 8 3 6, .flip 8 6], last := (6, 8) }
      bp_bq := { first := (7, 3), steps := [.row 7 3 4], last := (7, 4) }
      bp_br := { first := (7, 3), steps := [.row 7 3 6, .flip 7 6, .row 6 7 8, .flip 6 8, .row 8 6 7, .flip 8 7], last := (7, 8) } } }

theorem duplicateCheck138 : duplicateData138.check = true := by
  native_decide

def cut138 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData138 duplicateCheck138

/-- Journal iteration 139; certificate 3f69a97ab667678ecbb971e3909c2805a1f8f15fe16b53e93c2223cd50879272. -/
def duplicateData139 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 2, support := {5, 8, 10, 11} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 8, support := {2, 5, 6, 9} },
      { center := 10, support := {2, 4, 6, 8} }
    ]
    data := {
      p := 2
      q := 6
      r := 8
      a := 5
      b := 10
      ap_aq := { first := (5, 2), steps := [.flip 5 2, .row 2 5 8, .flip 2 8, .row 8 2 6, .flip 8 6, .row 6 8 5, .flip 6 5], last := (5, 6) }
      ap_ar := { first := (5, 2), steps := [.flip 5 2, .row 2 5 8, .flip 2 8, .row 8 2 5, .flip 8 5], last := (5, 8) }
      bp_bq := { first := (10, 2), steps := [.row 10 2 6], last := (10, 6) }
      bp_br := { first := (10, 2), steps := [.row 10 2 8], last := (10, 8) } } }

theorem duplicateCheck139 : duplicateData139.check = true := by
  native_decide

def cut139 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData139 duplicateCheck139

/-- Journal iteration 140; certificate a1c8268270d4472fa5b317d76849dcbc55c644eb9432cf9fb55889789b625541. -/
def duplicateData140 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 2, support := {5, 8, 10, 11} },
      { center := 3, support := {6, 8, 9, 10} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 8, support := {2, 5, 6, 9} },
      { center := 9, support := {3, 5, 6, 7} },
      { center := 10, support := {2, 3, 4, 8} }
    ]
    data := {
      p := 2
      q := 3
      r := 5
      a := 8
      b := 10
      ap_aq := { first := (8, 2), steps := [.flip 8 2, .row 2 8 10, .flip 2 10, .row 10 2 3, .flip 10 3, .row 3 10 8, .flip 3 8], last := (8, 3) }
      ap_ar := { first := (8, 2), steps := [.row 8 2 5], last := (8, 5) }
      bp_bq := { first := (10, 2), steps := [.row 10 2 3], last := (10, 3) }
      bp_br := { first := (10, 2), steps := [.row 10 2 3, .flip 10 3, .row 3 10 9, .flip 3 9, .row 9 3 5, .flip 9 5, .row 5 9 10, .flip 5 10], last := (10, 5) } } }

theorem duplicateCheck140 : duplicateData140.check = true := by
  native_decide

def cut140 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData140 duplicateCheck140

/-- Journal iteration 141; certificate b36382002736483bbfd97e24e8601830954760ff053ebfa09a66f3017ad20178. -/
def duplicateData141 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 2, support := {5, 8, 10, 11} },
      { center := 4, support := {6, 7, 10, 11} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 8, support := {2, 5, 6, 9} },
      { center := 10, support := {1, 4, 6, 8} }
    ]
    data := {
      p := 2
      q := 6
      r := 8
      a := 5
      b := 10
      ap_aq := { first := (5, 2), steps := [.flip 5 2, .row 2 5 8, .flip 2 8, .row 8 2 6, .flip 8 6, .row 6 8 5, .flip 6 5], last := (5, 6) }
      ap_ar := { first := (5, 2), steps := [.flip 5 2, .row 2 5 8, .flip 2 8, .row 8 2 5, .flip 8 5], last := (5, 8) }
      bp_bq := { first := (10, 2), steps := [.flip 10 2, .row 2 10 8, .flip 2 8, .row 8 2 6, .flip 8 6, .row 6 8 4, .flip 6 4, .row 4 6 10, .flip 4 10, .row 10 4 6], last := (10, 6) }
      bp_br := { first := (10, 2), steps := [.flip 10 2, .row 2 10 8, .flip 2 8, .row 8 2 6, .flip 8 6, .row 6 8 4, .flip 6 4, .row 4 6 10, .flip 4 10, .row 10 4 8], last := (10, 8) } } }

theorem duplicateCheck141 : duplicateData141.check = true := by
  native_decide

def cut141 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData141 duplicateCheck141

/-- Journal iteration 142; certificate deb96e792f2914f437452e226c5245e7b0c1087a010ef89cc69aa88f89ec4718. -/
def duplicateData142 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 2, support := {5, 8, 10, 11} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 8, support := {2, 5, 6, 9} },
      { center := 10, support := {1, 2, 6, 8} }
    ]
    data := {
      p := 2
      q := 6
      r := 8
      a := 5
      b := 10
      ap_aq := { first := (5, 2), steps := [.flip 5 2, .row 2 5 8, .flip 2 8, .row 8 2 6, .flip 8 6, .row 6 8 5, .flip 6 5], last := (5, 6) }
      ap_ar := { first := (5, 2), steps := [.flip 5 2, .row 2 5 8, .flip 2 8, .row 8 2 5, .flip 8 5], last := (5, 8) }
      bp_bq := { first := (10, 2), steps := [.row 10 2 6], last := (10, 6) }
      bp_br := { first := (10, 2), steps := [.row 10 2 8], last := (10, 8) } } }

theorem duplicateCheck142 : duplicateData142.check = true := by
  native_decide

def cut142 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData142 duplicateCheck142

/-- Journal iteration 143; certificate 94005078999588c80a35f3636ccda18d08b3f24efb89e075364758015f62c68f. -/
def duplicateData143 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 2, support := {5, 8, 10, 11} },
      { center := 3, support := {6, 8, 9, 10} },
      { center := 8, support := {2, 5, 6, 9} },
      { center := 10, support := {1, 2, 4, 8} }
    ]
    data := {
      p := 6
      q := 9
      r := 10
      a := 3
      b := 8
      ap_aq := { first := (3, 6), steps := [.row 3 6 9], last := (3, 9) }
      ap_ar := { first := (3, 6), steps := [.row 3 6 10], last := (3, 10) }
      bp_bq := { first := (8, 6), steps := [.row 8 6 9], last := (8, 9) }
      bp_br := { first := (8, 6), steps := [.row 8 6 2, .flip 8 2, .row 2 8 10, .flip 2 10, .row 10 2 8, .flip 10 8], last := (8, 10) } } }

theorem duplicateCheck143 : duplicateData143.check = true := by
  native_decide

def cut143 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData143 duplicateCheck143

/-- Journal iteration 144; certificate 9a8e213201664f26e8bef456635ec17908aa92d10cf668d72007793b33a2ac9b. -/
def duplicateData144 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 4, support := {6, 7, 10, 11} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 10, support := {1, 2, 4, 6} }
    ]
    data := {
      p := 4
      q := 7
      r := 10
      a := 5
      b := 6
      ap_aq := { first := (5, 4), steps := [.row 5 4 7], last := (5, 7) }
      ap_ar := { first := (5, 4), steps := [.row 5 4 10], last := (5, 10) }
      bp_bq := { first := (6, 4), steps := [.row 6 4 7], last := (6, 7) }
      bp_br := { first := (6, 4), steps := [.flip 6 4, .row 4 6 10, .flip 4 10, .row 10 4 6, .flip 10 6], last := (6, 10) } } }

theorem duplicateCheck144 : duplicateData144.check = true := by
  native_decide

def cut144 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData144 duplicateCheck144

/-- Journal iteration 145; certificate f7d3f53ee1afd8daba1dcc2431e20140a2ff884d9208caa69866f0bdb9598e35. -/
def duplicateData145 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {4, 5, 9, 11} },
      { center := 2, support := {5, 8, 10, 11} },
      { center := 3, support := {6, 8, 9, 10} },
      { center := 4, support := {6, 7, 10, 11} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 8, support := {2, 5, 6, 9} },
      { center := 9, support := {3, 5, 6, 7} },
      { center := 10, support := {1, 2, 3, 11} },
      { center := 11, support := {0, 4, 6, 8} }
    ]
    data := {
      p := 0
      q := 2
      r := 4
      a := 5
      b := 11
      ap_aq := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 4, .flip 11 4, .row 4 11 6, .flip 4 6, .row 6 4 8, .flip 6 8, .row 8 6 2, .flip 8 2, .row 2 8 5, .flip 2 5], last := (5, 2) }
      ap_ar := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 4, .flip 11 4, .row 4 11 6, .flip 4 6, .row 6 4 8, .flip 6 8, .row 8 6 2, .flip 8 2, .row 2 8 10, .flip 2 10, .row 10 2 3, .flip 10 3, .row 3 10 9, .flip 3 9, .row 9 3 5, .flip 9 5, .row 5 9 4], last := (5, 4) }
      bp_bq := { first := (11, 0), steps := [.row 11 0 4, .flip 11 4, .row 4 11 6, .flip 4 6, .row 6 4 8, .flip 6 8, .row 8 6 2, .flip 8 2, .row 2 8 11, .flip 2 11], last := (11, 2) }
      bp_br := { first := (11, 0), steps := [.row 11 0 4], last := (11, 4) } } }

theorem duplicateCheck145 : duplicateData145.check = true := by
  native_decide

def cut145 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData145 duplicateCheck145

/-- Journal iteration 146; certificate 8bf1405ed9f76eff36355ff817348c83611fa1c22827e4d0e3a38f6b2e4e6005. -/
def duplicateData146 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {4, 5, 9, 11} },
      { center := 2, support := {5, 8, 10, 11} },
      { center := 3, support := {6, 8, 9, 10} },
      { center := 4, support := {6, 7, 10, 11} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 8, support := {2, 5, 6, 9} },
      { center := 9, support := {3, 5, 6, 7} },
      { center := 10, support := {1, 2, 3, 11} },
      { center := 11, support := {0, 3, 5, 10} }
    ]
    data := {
      p := 0
      q := 2
      r := 4
      a := 5
      b := 11
      ap_aq := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 10, .flip 11 10, .row 10 11 2, .flip 10 2, .row 2 10 5, .flip 2 5], last := (5, 2) }
      ap_ar := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 10, .flip 11 10, .row 10 11 3, .flip 10 3, .row 3 10 9, .flip 3 9, .row 9 3 5, .flip 9 5, .row 5 9 4], last := (5, 4) }
      bp_bq := { first := (11, 0), steps := [.row 11 0 10, .flip 11 10, .row 10 11 2, .flip 10 2, .row 2 10 11, .flip 2 11], last := (11, 2) }
      bp_br := { first := (11, 0), steps := [.row 11 0 10, .flip 11 10, .row 10 11 2, .flip 10 2, .row 2 10 8, .flip 2 8, .row 8 2 6, .flip 8 6, .row 6 8 4, .flip 6 4, .row 4 6 11, .flip 4 11], last := (11, 4) } } }

theorem duplicateCheck146 : duplicateData146.check = true := by
  native_decide

def cut146 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData146 duplicateCheck146

/-- Journal iteration 147; certificate 5c785675e96b627856194cee4b5ce4d7aa32f8aa3b701e5835f8be1f2c505fbb. -/
def duplicateData147 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {4, 5, 9, 11} },
      { center := 2, support := {5, 8, 10, 11} },
      { center := 3, support := {6, 8, 9, 10} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 9, support := {3, 5, 6, 7} },
      { center := 10, support := {1, 2, 3, 11} },
      { center := 11, support := {0, 3, 4, 10} }
    ]
    data := {
      p := 0
      q := 2
      r := 4
      a := 5
      b := 11
      ap_aq := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 10, .flip 11 10, .row 10 11 2, .flip 10 2, .row 2 10 5, .flip 2 5], last := (5, 2) }
      ap_ar := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 10, .flip 11 10, .row 10 11 3, .flip 10 3, .row 3 10 9, .flip 3 9, .row 9 3 5, .flip 9 5, .row 5 9 4], last := (5, 4) }
      bp_bq := { first := (11, 0), steps := [.row 11 0 10, .flip 11 10, .row 10 11 2, .flip 10 2, .row 2 10 11, .flip 2 11], last := (11, 2) }
      bp_br := { first := (11, 0), steps := [.row 11 0 4], last := (11, 4) } } }

theorem duplicateCheck147 : duplicateData147.check = true := by
  native_decide

def cut147 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData147 duplicateCheck147

/-- Journal iteration 148; certificate 3e755b2b8858dd4ab36059d7d13f1788861d0201ee0fb51b6cac3a6380343423. -/
def duplicateData148 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {4, 5, 9, 11} },
      { center := 2, support := {5, 8, 10, 11} },
      { center := 3, support := {6, 8, 9, 10} },
      { center := 4, support := {6, 7, 10, 11} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 8, support := {2, 5, 6, 9} },
      { center := 9, support := {3, 5, 6, 7} },
      { center := 10, support := {1, 2, 3, 11} },
      { center := 11, support := {0, 3, 4, 8} }
    ]
    data := {
      p := 0
      q := 2
      r := 4
      a := 5
      b := 11
      ap_aq := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 4, .flip 11 4, .row 4 11 6, .flip 4 6, .row 6 4 8, .flip 6 8, .row 8 6 2, .flip 8 2, .row 2 8 5, .flip 2 5], last := (5, 2) }
      ap_ar := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 4, .flip 11 4, .row 4 11 6, .flip 4 6, .row 6 4 8, .flip 6 8, .row 8 6 2, .flip 8 2, .row 2 8 10, .flip 2 10, .row 10 2 3, .flip 10 3, .row 3 10 9, .flip 3 9, .row 9 3 5, .flip 9 5, .row 5 9 4], last := (5, 4) }
      bp_bq := { first := (11, 0), steps := [.row 11 0 4, .flip 11 4, .row 4 11 6, .flip 4 6, .row 6 4 8, .flip 6 8, .row 8 6 2, .flip 8 2, .row 2 8 11, .flip 2 11], last := (11, 2) }
      bp_br := { first := (11, 0), steps := [.row 11 0 4], last := (11, 4) } } }

theorem duplicateCheck148 : duplicateData148.check = true := by
  native_decide

def cut148 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData148 duplicateCheck148

/-- Journal iteration 149; certificate 5fe67a8c591ce16cd4de004cf497d2eb337da94fa8e9575da8f8c5da587dc576. -/
def duplicateData149 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {4, 5, 9, 11} },
      { center := 2, support := {5, 8, 10, 11} },
      { center := 3, support := {6, 8, 9, 10} },
      { center := 4, support := {6, 7, 10, 11} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 8, support := {2, 5, 6, 9} },
      { center := 9, support := {3, 5, 6, 7} },
      { center := 10, support := {1, 2, 3, 11} },
      { center := 11, support := {0, 2, 6, 8} }
    ]
    data := {
      p := 0
      q := 2
      r := 4
      a := 5
      b := 11
      ap_aq := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 2, .flip 11 2, .row 2 11 5, .flip 2 5], last := (5, 2) }
      ap_ar := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 2, .flip 11 2, .row 2 11 10, .flip 2 10, .row 10 2 3, .flip 10 3, .row 3 10 9, .flip 3 9, .row 9 3 5, .flip 9 5, .row 5 9 4], last := (5, 4) }
      bp_bq := { first := (11, 0), steps := [.row 11 0 2], last := (11, 2) }
      bp_br := { first := (11, 0), steps := [.row 11 0 2, .flip 11 2, .row 2 11 8, .flip 2 8, .row 8 2 6, .flip 8 6, .row 6 8 4, .flip 6 4, .row 4 6 11, .flip 4 11], last := (11, 4) } } }

theorem duplicateCheck149 : duplicateData149.check = true := by
  native_decide

def cut149 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData149 duplicateCheck149

/-- Journal iteration 150; certificate 35afb0a9b18a5f97f8024fd374e8c5055411253c1c400f9ed06c245c18cbc434. -/
def duplicateData150 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {4, 5, 9, 11} },
      { center := 2, support := {5, 8, 10, 11} },
      { center := 3, support := {6, 8, 9, 10} },
      { center := 4, support := {6, 7, 10, 11} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 8, support := {2, 5, 6, 9} },
      { center := 9, support := {3, 5, 6, 7} },
      { center := 10, support := {1, 2, 3, 11} },
      { center := 11, support := {0, 2, 5, 10} }
    ]
    data := {
      p := 0
      q := 2
      r := 4
      a := 5
      b := 11
      ap_aq := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 2, .flip 11 2, .row 2 11 5, .flip 2 5], last := (5, 2) }
      ap_ar := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 10, .flip 11 10, .row 10 11 3, .flip 10 3, .row 3 10 9, .flip 3 9, .row 9 3 5, .flip 9 5, .row 5 9 4], last := (5, 4) }
      bp_bq := { first := (11, 0), steps := [.row 11 0 2], last := (11, 2) }
      bp_br := { first := (11, 0), steps := [.row 11 0 2, .flip 11 2, .row 2 11 8, .flip 2 8, .row 8 2 6, .flip 8 6, .row 6 8 4, .flip 6 4, .row 4 6 11, .flip 4 11], last := (11, 4) } } }

theorem duplicateCheck150 : duplicateData150.check = true := by
  native_decide

def cut150 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData150 duplicateCheck150

/-- Journal iteration 151; certificate cc79e5d3485c92243227ea2b5585ff83aa38a92a3b982a4d6c2051e8af0fc729. -/
def duplicateData151 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {4, 5, 9, 11} },
      { center := 2, support := {5, 8, 10, 11} },
      { center := 3, support := {6, 8, 9, 10} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 9, support := {3, 5, 6, 7} },
      { center := 10, support := {1, 2, 3, 11} },
      { center := 11, support := {0, 2, 4, 10} }
    ]
    data := {
      p := 0
      q := 2
      r := 4
      a := 5
      b := 11
      ap_aq := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 2, .flip 11 2, .row 2 11 5, .flip 2 5], last := (5, 2) }
      ap_ar := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 10, .flip 11 10, .row 10 11 3, .flip 10 3, .row 3 10 9, .flip 3 9, .row 9 3 5, .flip 9 5, .row 5 9 4], last := (5, 4) }
      bp_bq := { first := (11, 0), steps := [.row 11 0 2], last := (11, 2) }
      bp_br := { first := (11, 0), steps := [.row 11 0 4], last := (11, 4) } } }

theorem duplicateCheck151 : duplicateData151.check = true := by
  native_decide

def cut151 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData151 duplicateCheck151

/-- Journal iteration 152; certificate e5e8a2b4aaced1d413a32c87791cbbdfbca6bfc017e0ef9606802c39075f171d. -/
def duplicateData152 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {4, 5, 9, 11} },
      { center := 2, support := {5, 8, 10, 11} },
      { center := 3, support := {6, 8, 9, 10} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 9, support := {3, 5, 6, 7} },
      { center := 10, support := {1, 2, 3, 11} },
      { center := 11, support := {0, 2, 4, 8} }
    ]
    data := {
      p := 0
      q := 2
      r := 4
      a := 5
      b := 11
      ap_aq := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 2, .flip 11 2, .row 2 11 5, .flip 2 5], last := (5, 2) }
      ap_ar := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 2, .flip 11 2, .row 2 11 10, .flip 2 10, .row 10 2 3, .flip 10 3, .row 3 10 9, .flip 3 9, .row 9 3 5, .flip 9 5, .row 5 9 4], last := (5, 4) }
      bp_bq := { first := (11, 0), steps := [.row 11 0 2], last := (11, 2) }
      bp_br := { first := (11, 0), steps := [.row 11 0 4], last := (11, 4) } } }

theorem duplicateCheck152 : duplicateData152.check = true := by
  native_decide

def cut152 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData152 duplicateCheck152

/-- Journal iteration 153; certificate acec97e736bdaa39a63b53e544755c59cd15d48ee118bb57181e4d4b07477690. -/
def duplicateData153 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {4, 5, 9, 11} },
      { center := 2, support := {5, 8, 10, 11} },
      { center := 3, support := {6, 8, 9, 10} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 9, support := {3, 5, 6, 7} },
      { center := 10, support := {1, 2, 3, 11} },
      { center := 11, support := {0, 2, 4, 6} }
    ]
    data := {
      p := 0
      q := 2
      r := 4
      a := 5
      b := 11
      ap_aq := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 2, .flip 11 2, .row 2 11 5, .flip 2 5], last := (5, 2) }
      ap_ar := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 2, .flip 11 2, .row 2 11 10, .flip 2 10, .row 10 2 3, .flip 10 3, .row 3 10 9, .flip 3 9, .row 9 3 5, .flip 9 5, .row 5 9 4], last := (5, 4) }
      bp_bq := { first := (11, 0), steps := [.row 11 0 2], last := (11, 2) }
      bp_br := { first := (11, 0), steps := [.row 11 0 4], last := (11, 4) } } }

theorem duplicateCheck153 : duplicateData153.check = true := by
  native_decide

def cut153 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData153 duplicateCheck153

/-- Journal iteration 154; certificate f4d9719bcae69c8557ab41ed86c6c87e41b811be30d063b527a7a877bcb85607. -/
def duplicateData154 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {4, 5, 9, 11} },
      { center := 2, support := {5, 8, 10, 11} },
      { center := 3, support := {6, 8, 9, 10} },
      { center := 4, support := {6, 7, 10, 11} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 8, support := {2, 5, 6, 9} },
      { center := 9, support := {3, 5, 6, 7} },
      { center := 10, support := {1, 2, 3, 11} },
      { center := 11, support := {0, 2, 3, 10} }
    ]
    data := {
      p := 0
      q := 2
      r := 4
      a := 5
      b := 11
      ap_aq := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 2, .flip 11 2, .row 2 11 5, .flip 2 5], last := (5, 2) }
      ap_ar := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 10, .flip 11 10, .row 10 11 3, .flip 10 3, .row 3 10 9, .flip 3 9, .row 9 3 5, .flip 9 5, .row 5 9 4], last := (5, 4) }
      bp_bq := { first := (11, 0), steps := [.row 11 0 2], last := (11, 2) }
      bp_br := { first := (11, 0), steps := [.row 11 0 2, .flip 11 2, .row 2 11 8, .flip 2 8, .row 8 2 6, .flip 8 6, .row 6 8 4, .flip 6 4, .row 4 6 11, .flip 4 11], last := (11, 4) } } }

theorem duplicateCheck154 : duplicateData154.check = true := by
  native_decide

def cut154 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData154 duplicateCheck154

/-- Journal iteration 155; certificate d2a80aeae971b6058ab98456c64fe9e3c0297013718d59ad81e5178b52ccd590. -/
def duplicateData155 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {4, 5, 9, 11} },
      { center := 2, support := {5, 8, 10, 11} },
      { center := 3, support := {6, 8, 9, 10} },
      { center := 4, support := {6, 7, 10, 11} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 8, support := {2, 5, 6, 9} },
      { center := 9, support := {3, 5, 6, 7} },
      { center := 10, support := {1, 2, 3, 11} },
      { center := 11, support := {0, 2, 3, 9} }
    ]
    data := {
      p := 0
      q := 2
      r := 4
      a := 5
      b := 11
      ap_aq := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 2, .flip 11 2, .row 2 11 5, .flip 2 5], last := (5, 2) }
      ap_ar := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 2, .flip 11 2, .row 2 11 10, .flip 2 10, .row 10 2 3, .flip 10 3, .row 3 10 9, .flip 3 9, .row 9 3 5, .flip 9 5, .row 5 9 4], last := (5, 4) }
      bp_bq := { first := (11, 0), steps := [.row 11 0 2], last := (11, 2) }
      bp_br := { first := (11, 0), steps := [.row 11 0 2, .flip 11 2, .row 2 11 8, .flip 2 8, .row 8 2 6, .flip 8 6, .row 6 8 4, .flip 6 4, .row 4 6 11, .flip 4 11], last := (11, 4) } } }

theorem duplicateCheck155 : duplicateData155.check = true := by
  native_decide

def cut155 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData155 duplicateCheck155

/-- Journal iteration 156; certificate 16ddbb9c39d0dee5be4ce61832919fbafc98861b6ff71f1f9ff1ee9607b04b01. -/
def duplicateData156 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {4, 5, 9, 11} },
      { center := 2, support := {5, 8, 10, 11} },
      { center := 3, support := {6, 8, 9, 10} },
      { center := 4, support := {6, 7, 10, 11} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 8, support := {2, 5, 6, 9} },
      { center := 9, support := {3, 5, 6, 7} },
      { center := 10, support := {1, 2, 3, 11} },
      { center := 11, support := {0, 2, 3, 8} }
    ]
    data := {
      p := 0
      q := 2
      r := 4
      a := 5
      b := 11
      ap_aq := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 2, .flip 11 2, .row 2 11 5, .flip 2 5], last := (5, 2) }
      ap_ar := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 2, .flip 11 2, .row 2 11 10, .flip 2 10, .row 10 2 3, .flip 10 3, .row 3 10 9, .flip 3 9, .row 9 3 5, .flip 9 5, .row 5 9 4], last := (5, 4) }
      bp_bq := { first := (11, 0), steps := [.row 11 0 2], last := (11, 2) }
      bp_br := { first := (11, 0), steps := [.row 11 0 2, .flip 11 2, .row 2 11 8, .flip 2 8, .row 8 2 6, .flip 8 6, .row 6 8 4, .flip 6 4, .row 4 6 11, .flip 4 11], last := (11, 4) } } }

theorem duplicateCheck156 : duplicateData156.check = true := by
  native_decide

def cut156 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData156 duplicateCheck156

/-- Journal iteration 157; certificate 98183b7ab3960d5bd02e7fc6dac605818b9184a5dd5f174473076fced8f1c55a. -/
def duplicateData157 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {4, 5, 9, 11} },
      { center := 2, support := {5, 8, 10, 11} },
      { center := 3, support := {6, 8, 9, 10} },
      { center := 4, support := {6, 7, 10, 11} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 7, support := {3, 4, 6, 11} },
      { center := 9, support := {3, 5, 6, 7} },
      { center := 10, support := {1, 2, 3, 11} },
      { center := 11, support := {0, 2, 3, 7} }
    ]
    data := {
      p := 0
      q := 2
      r := 4
      a := 5
      b := 11
      ap_aq := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 2, .flip 11 2, .row 2 11 5, .flip 2 5], last := (5, 2) }
      ap_ar := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 2, .flip 11 2, .row 2 11 10, .flip 2 10, .row 10 2 3, .flip 10 3, .row 3 10 9, .flip 3 9, .row 9 3 5, .flip 9 5, .row 5 9 4], last := (5, 4) }
      bp_bq := { first := (11, 0), steps := [.row 11 0 2], last := (11, 2) }
      bp_br := { first := (11, 0), steps := [.row 11 0 7, .flip 11 7, .row 7 11 4, .flip 7 4, .row 4 7 11, .flip 4 11], last := (11, 4) } } }

theorem duplicateCheck157 : duplicateData157.check = true := by
  native_decide

def cut157 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData157 duplicateCheck157

/-- Journal iteration 158; certificate b45b15727de1fa9e80b1341e70e7f757af3b0be47dea44174baf6a9d44134275. -/
def duplicateData158 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {4, 5, 9, 11} },
      { center := 2, support := {5, 8, 10, 11} },
      { center := 3, support := {6, 8, 9, 10} },
      { center := 4, support := {6, 7, 10, 11} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 8, support := {2, 5, 6, 9} },
      { center := 9, support := {3, 5, 6, 7} },
      { center := 10, support := {1, 2, 3, 11} },
      { center := 11, support := {0, 2, 3, 5} }
    ]
    data := {
      p := 0
      q := 2
      r := 4
      a := 5
      b := 11
      ap_aq := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 2, .flip 11 2, .row 2 11 5, .flip 2 5], last := (5, 2) }
      ap_ar := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 2, .flip 11 2, .row 2 11 10, .flip 2 10, .row 10 2 3, .flip 10 3, .row 3 10 9, .flip 3 9, .row 9 3 5, .flip 9 5, .row 5 9 4], last := (5, 4) }
      bp_bq := { first := (11, 0), steps := [.row 11 0 2], last := (11, 2) }
      bp_br := { first := (11, 0), steps := [.row 11 0 2, .flip 11 2, .row 2 11 8, .flip 2 8, .row 8 2 6, .flip 8 6, .row 6 8 4, .flip 6 4, .row 4 6 11, .flip 4 11], last := (11, 4) } } }

theorem duplicateCheck158 : duplicateData158.check = true := by
  native_decide

def cut158 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData158 duplicateCheck158

/-- Journal iteration 159; certificate 1e66eb8d43a592444a83fbb0c90cc464249f987f93d1d0370ec36858fc9c1596. -/
def duplicateData159 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {4, 5, 9, 11} },
      { center := 2, support := {5, 8, 10, 11} },
      { center := 3, support := {6, 8, 9, 10} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 9, support := {3, 5, 6, 7} },
      { center := 10, support := {1, 2, 3, 11} },
      { center := 11, support := {0, 2, 3, 4} }
    ]
    data := {
      p := 0
      q := 2
      r := 4
      a := 5
      b := 11
      ap_aq := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 2, .flip 11 2, .row 2 11 5, .flip 2 5], last := (5, 2) }
      ap_ar := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 2, .flip 11 2, .row 2 11 10, .flip 2 10, .row 10 2 3, .flip 10 3, .row 3 10 9, .flip 3 9, .row 9 3 5, .flip 9 5, .row 5 9 4], last := (5, 4) }
      bp_bq := { first := (11, 0), steps := [.row 11 0 2], last := (11, 2) }
      bp_br := { first := (11, 0), steps := [.row 11 0 4], last := (11, 4) } } }

theorem duplicateCheck159 : duplicateData159.check = true := by
  native_decide

def cut159 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData159 duplicateCheck159

/-- Journal iteration 160; certificate 52c0f58f8f59a1d9200ed5a629fabf2648f95f68f5df1cdaa75968a4c55132f0. -/
def duplicateData160 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 2, support := {5, 8, 10, 11} },
      { center := 3, support := {6, 8, 9, 10} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 8, support := {2, 5, 6, 9} },
      { center := 9, support := {3, 5, 6, 7} },
      { center := 10, support := {1, 2, 3, 11} }
    ]
    data := {
      p := 2
      q := 3
      r := 5
      a := 8
      b := 10
      ap_aq := { first := (8, 2), steps := [.flip 8 2, .row 2 8 10, .flip 2 10, .row 10 2 3, .flip 10 3, .row 3 10 8, .flip 3 8], last := (8, 3) }
      ap_ar := { first := (8, 2), steps := [.row 8 2 5], last := (8, 5) }
      bp_bq := { first := (10, 2), steps := [.row 10 2 3], last := (10, 3) }
      bp_br := { first := (10, 2), steps := [.row 10 2 3, .flip 10 3, .row 3 10 9, .flip 3 9, .row 9 3 5, .flip 9 5, .row 5 9 10, .flip 5 10], last := (10, 5) } } }

theorem duplicateCheck160 : duplicateData160.check = true := by
  native_decide

def cut160 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData160 duplicateCheck160

/-- Journal iteration 161; certificate 39dbcaf21ad336cb23997620e925056eaf9cf53f9b55be3c8c9ecc83c8dd5efc. -/
def duplicateData161 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {4, 5, 9, 11} },
      { center := 2, support := {5, 8, 10, 11} },
      { center := 3, support := {6, 8, 9, 10} },
      { center := 4, support := {6, 7, 10, 11} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 8, support := {2, 5, 6, 9} },
      { center := 9, support := {3, 5, 6, 7} },
      { center := 10, support := {1, 2, 3, 9} },
      { center := 11, support := {0, 4, 6, 8} }
    ]
    data := {
      p := 0
      q := 2
      r := 4
      a := 5
      b := 11
      ap_aq := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 4, .flip 11 4, .row 4 11 6, .flip 4 6, .row 6 4 8, .flip 6 8, .row 8 6 2, .flip 8 2, .row 2 8 5, .flip 2 5], last := (5, 2) }
      ap_ar := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 4, .flip 11 4, .row 4 11 6, .flip 4 6, .row 6 4 8, .flip 6 8, .row 8 6 2, .flip 8 2, .row 2 8 10, .flip 2 10, .row 10 2 3, .flip 10 3, .row 3 10 9, .flip 3 9, .row 9 3 5, .flip 9 5, .row 5 9 4], last := (5, 4) }
      bp_bq := { first := (11, 0), steps := [.row 11 0 4, .flip 11 4, .row 4 11 6, .flip 4 6, .row 6 4 8, .flip 6 8, .row 8 6 2, .flip 8 2, .row 2 8 11, .flip 2 11], last := (11, 2) }
      bp_br := { first := (11, 0), steps := [.row 11 0 4], last := (11, 4) } } }

theorem duplicateCheck161 : duplicateData161.check = true := by
  native_decide

def cut161 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData161 duplicateCheck161

/-- Journal iteration 162; certificate 29ae43cd69f1b9d4199e4a8bf4df960b57eb03562be308f89925c177975d3f71. -/
def duplicateData162 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 2, support := {5, 8, 10, 11} },
      { center := 3, support := {6, 8, 9, 10} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 8, support := {2, 5, 6, 9} },
      { center := 9, support := {3, 5, 6, 7} },
      { center := 10, support := {1, 2, 3, 9} }
    ]
    data := {
      p := 2
      q := 3
      r := 5
      a := 8
      b := 10
      ap_aq := { first := (8, 2), steps := [.flip 8 2, .row 2 8 10, .flip 2 10, .row 10 2 3, .flip 10 3, .row 3 10 8, .flip 3 8], last := (8, 3) }
      ap_ar := { first := (8, 2), steps := [.row 8 2 5], last := (8, 5) }
      bp_bq := { first := (10, 2), steps := [.row 10 2 3], last := (10, 3) }
      bp_br := { first := (10, 2), steps := [.row 10 2 3, .flip 10 3, .row 3 10 9, .flip 3 9, .row 9 3 5, .flip 9 5, .row 5 9 10, .flip 5 10], last := (10, 5) } } }

theorem duplicateCheck162 : duplicateData162.check = true := by
  native_decide

def cut162 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData162 duplicateCheck162

/-- Journal iteration 163; certificate 187221f07047e3133005adece9908ada7baeed9889084938583afb11942517c7. -/
def duplicateData163 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {4, 5, 9, 11} },
      { center := 2, support := {5, 8, 10, 11} },
      { center := 3, support := {6, 8, 9, 10} },
      { center := 4, support := {6, 7, 10, 11} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 8, support := {2, 5, 6, 9} },
      { center := 9, support := {3, 5, 6, 7} },
      { center := 10, support := {1, 2, 3, 8} },
      { center := 11, support := {0, 4, 6, 8} }
    ]
    data := {
      p := 0
      q := 2
      r := 4
      a := 5
      b := 11
      ap_aq := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 4, .flip 11 4, .row 4 11 6, .flip 4 6, .row 6 4 8, .flip 6 8, .row 8 6 2, .flip 8 2, .row 2 8 5, .flip 2 5], last := (5, 2) }
      ap_ar := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 4, .flip 11 4, .row 4 11 6, .flip 4 6, .row 6 4 8, .flip 6 8, .row 8 6 2, .flip 8 2, .row 2 8 10, .flip 2 10, .row 10 2 3, .flip 10 3, .row 3 10 9, .flip 3 9, .row 9 3 5, .flip 9 5, .row 5 9 4], last := (5, 4) }
      bp_bq := { first := (11, 0), steps := [.row 11 0 4, .flip 11 4, .row 4 11 6, .flip 4 6, .row 6 4 8, .flip 6 8, .row 8 6 2, .flip 8 2, .row 2 8 11, .flip 2 11], last := (11, 2) }
      bp_br := { first := (11, 0), steps := [.row 11 0 4], last := (11, 4) } } }

theorem duplicateCheck163 : duplicateData163.check = true := by
  native_decide

def cut163 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData163 duplicateCheck163

/-- Journal iteration 164; certificate 51dcedbb9c416989745c8178476f6766075d50c6476b5d770843f668255315c5. -/
def duplicateData164 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 2, support := {5, 8, 10, 11} },
      { center := 3, support := {6, 8, 9, 10} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 8, support := {2, 5, 6, 9} },
      { center := 9, support := {3, 5, 6, 7} },
      { center := 10, support := {1, 2, 3, 8} }
    ]
    data := {
      p := 2
      q := 3
      r := 5
      a := 8
      b := 10
      ap_aq := { first := (8, 2), steps := [.flip 8 2, .row 2 8 10, .flip 2 10, .row 10 2 3, .flip 10 3, .row 3 10 8, .flip 3 8], last := (8, 3) }
      ap_ar := { first := (8, 2), steps := [.row 8 2 5], last := (8, 5) }
      bp_bq := { first := (10, 2), steps := [.row 10 2 3], last := (10, 3) }
      bp_br := { first := (10, 2), steps := [.row 10 2 3, .flip 10 3, .row 3 10 9, .flip 3 9, .row 9 3 5, .flip 9 5, .row 5 9 10, .flip 5 10], last := (10, 5) } } }

theorem duplicateCheck164 : duplicateData164.check = true := by
  native_decide

def cut164 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData164 duplicateCheck164

/-- Journal iteration 165; certificate 8bed1afef3bea42f24ec926c82ac2b91c6b2f603dc9424f79efe6914da0b7258. -/
def duplicateData165 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {4, 5, 9, 11} },
      { center := 2, support := {5, 8, 10, 11} },
      { center := 3, support := {6, 8, 9, 10} },
      { center := 4, support := {6, 7, 10, 11} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 8, support := {2, 5, 6, 9} },
      { center := 9, support := {3, 5, 6, 7} },
      { center := 10, support := {1, 2, 3, 7} },
      { center := 11, support := {0, 4, 6, 8} }
    ]
    data := {
      p := 0
      q := 2
      r := 4
      a := 5
      b := 11
      ap_aq := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 4, .flip 11 4, .row 4 11 6, .flip 4 6, .row 6 4 8, .flip 6 8, .row 8 6 2, .flip 8 2, .row 2 8 5, .flip 2 5], last := (5, 2) }
      ap_ar := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 4, .flip 11 4, .row 4 11 6, .flip 4 6, .row 6 4 8, .flip 6 8, .row 8 6 2, .flip 8 2, .row 2 8 10, .flip 2 10, .row 10 2 3, .flip 10 3, .row 3 10 9, .flip 3 9, .row 9 3 5, .flip 9 5, .row 5 9 4], last := (5, 4) }
      bp_bq := { first := (11, 0), steps := [.row 11 0 4, .flip 11 4, .row 4 11 6, .flip 4 6, .row 6 4 8, .flip 6 8, .row 8 6 2, .flip 8 2, .row 2 8 11, .flip 2 11], last := (11, 2) }
      bp_br := { first := (11, 0), steps := [.row 11 0 4], last := (11, 4) } } }

theorem duplicateCheck165 : duplicateData165.check = true := by
  native_decide

def cut165 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData165 duplicateCheck165

/-- Journal iteration 166; certificate f1cf99bf09531ec47a93631687a180aa1bf0c32a511bc5c2f9b40c9df179d0d0. -/
def duplicateData166 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 2, support := {5, 8, 10, 11} },
      { center := 3, support := {6, 8, 9, 10} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 8, support := {2, 5, 6, 9} },
      { center := 9, support := {3, 5, 6, 7} },
      { center := 10, support := {1, 2, 3, 7} }
    ]
    data := {
      p := 2
      q := 3
      r := 5
      a := 8
      b := 10
      ap_aq := { first := (8, 2), steps := [.flip 8 2, .row 2 8 10, .flip 2 10, .row 10 2 3, .flip 10 3, .row 3 10 8, .flip 3 8], last := (8, 3) }
      ap_ar := { first := (8, 2), steps := [.row 8 2 5], last := (8, 5) }
      bp_bq := { first := (10, 2), steps := [.row 10 2 3], last := (10, 3) }
      bp_br := { first := (10, 2), steps := [.row 10 2 3, .flip 10 3, .row 3 10 9, .flip 3 9, .row 9 3 5, .flip 9 5, .row 5 9 10, .flip 5 10], last := (10, 5) } } }

theorem duplicateCheck166 : duplicateData166.check = true := by
  native_decide

def cut166 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData166 duplicateCheck166

/-- Journal iteration 167; certificate 39e20af26b45a060e558747efb213e0ad5d8dcb4107ea486ddf9db91c5f63d4d. -/
def duplicateData167 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {4, 5, 9, 11} },
      { center := 2, support := {5, 8, 10, 11} },
      { center := 4, support := {6, 7, 10, 11} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 8, support := {2, 5, 6, 9} },
      { center := 10, support := {1, 2, 3, 5} },
      { center := 11, support := {0, 4, 6, 8} }
    ]
    data := {
      p := 0
      q := 2
      r := 4
      a := 5
      b := 11
      ap_aq := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 4, .flip 11 4, .row 4 11 6, .flip 4 6, .row 6 4 8, .flip 6 8, .row 8 6 2, .flip 8 2, .row 2 8 5, .flip 2 5], last := (5, 2) }
      ap_ar := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 4, .flip 11 4, .row 4 11 6, .flip 4 6, .row 6 4 8, .flip 6 8, .row 8 6 2, .flip 8 2, .row 2 8 10, .flip 2 10, .row 10 2 5, .flip 10 5, .row 5 10 4], last := (5, 4) }
      bp_bq := { first := (11, 0), steps := [.row 11 0 4, .flip 11 4, .row 4 11 6, .flip 4 6, .row 6 4 8, .flip 6 8, .row 8 6 2, .flip 8 2, .row 2 8 11, .flip 2 11], last := (11, 2) }
      bp_br := { first := (11, 0), steps := [.row 11 0 4], last := (11, 4) } } }

theorem duplicateCheck167 : duplicateData167.check = true := by
  native_decide

def cut167 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData167 duplicateCheck167

/-- Journal iteration 168; certificate f3d3562baa68ee06bdcccae772174d8c789fbcaf03461bffdfd2a557509c10fb. -/
def duplicateData168 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {4, 5, 9, 11} },
      { center := 2, support := {5, 8, 10, 11} },
      { center := 4, support := {6, 7, 10, 11} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 8, support := {2, 5, 6, 9} },
      { center := 10, support := {1, 2, 3, 5} },
      { center := 11, support := {0, 3, 4, 10} }
    ]
    data := {
      p := 0
      q := 2
      r := 4
      a := 5
      b := 11
      ap_aq := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 4, .flip 11 4, .row 4 11 6, .flip 4 6, .row 6 4 8, .flip 6 8, .row 8 6 2, .flip 8 2, .row 2 8 5, .flip 2 5], last := (5, 2) }
      ap_ar := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 4, .flip 11 4, .row 4 11 6, .flip 4 6, .row 6 4 8, .flip 6 8, .row 8 6 2, .flip 8 2, .row 2 8 10, .flip 2 10, .row 10 2 5, .flip 10 5, .row 5 10 4], last := (5, 4) }
      bp_bq := { first := (11, 0), steps := [.row 11 0 4, .flip 11 4, .row 4 11 6, .flip 4 6, .row 6 4 8, .flip 6 8, .row 8 6 2, .flip 8 2, .row 2 8 11, .flip 2 11], last := (11, 2) }
      bp_br := { first := (11, 0), steps := [.row 11 0 4], last := (11, 4) } } }

theorem duplicateCheck168 : duplicateData168.check = true := by
  native_decide

def cut168 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData168 duplicateCheck168

/-- Journal iteration 169; certificate c1d90b957f325471c29599970b56addf13a14560b1d4bab8f9370c80cf75d919. -/
def duplicateData169 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {4, 5, 9, 11} },
      { center := 2, support := {5, 8, 10, 11} },
      { center := 4, support := {6, 7, 10, 11} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 8, support := {2, 5, 6, 9} },
      { center := 10, support := {1, 2, 3, 5} },
      { center := 11, support := {0, 3, 4, 8} }
    ]
    data := {
      p := 0
      q := 2
      r := 4
      a := 5
      b := 11
      ap_aq := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 4, .flip 11 4, .row 4 11 6, .flip 4 6, .row 6 4 8, .flip 6 8, .row 8 6 2, .flip 8 2, .row 2 8 5, .flip 2 5], last := (5, 2) }
      ap_ar := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 4, .flip 11 4, .row 4 11 6, .flip 4 6, .row 6 4 8, .flip 6 8, .row 8 6 2, .flip 8 2, .row 2 8 10, .flip 2 10, .row 10 2 5, .flip 10 5, .row 5 10 4], last := (5, 4) }
      bp_bq := { first := (11, 0), steps := [.row 11 0 4, .flip 11 4, .row 4 11 6, .flip 4 6, .row 6 4 8, .flip 6 8, .row 8 6 2, .flip 8 2, .row 2 8 11, .flip 2 11], last := (11, 2) }
      bp_br := { first := (11, 0), steps := [.row 11 0 4], last := (11, 4) } } }

theorem duplicateCheck169 : duplicateData169.check = true := by
  native_decide

def cut169 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData169 duplicateCheck169

/-- Journal iteration 170; certificate 9e5bcf101fa61fdd2706c3349bd1bd505b151ec1a82cae216a8765fc861d6f7c. -/
def duplicateData170 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {4, 5, 9, 11} },
      { center := 2, support := {5, 8, 10, 11} },
      { center := 4, support := {6, 7, 10, 11} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 8, support := {2, 5, 6, 9} },
      { center := 10, support := {1, 2, 3, 5} },
      { center := 11, support := {0, 2, 6, 8} }
    ]
    data := {
      p := 0
      q := 2
      r := 4
      a := 5
      b := 11
      ap_aq := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 2, .flip 11 2, .row 2 11 5, .flip 2 5], last := (5, 2) }
      ap_ar := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 2, .flip 11 2, .row 2 11 10, .flip 2 10, .row 10 2 5, .flip 10 5, .row 5 10 4], last := (5, 4) }
      bp_bq := { first := (11, 0), steps := [.row 11 0 2], last := (11, 2) }
      bp_br := { first := (11, 0), steps := [.row 11 0 2, .flip 11 2, .row 2 11 8, .flip 2 8, .row 8 2 6, .flip 8 6, .row 6 8 4, .flip 6 4, .row 4 6 11, .flip 4 11], last := (11, 4) } } }

theorem duplicateCheck170 : duplicateData170.check = true := by
  native_decide

def cut170 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData170 duplicateCheck170

/-- Journal iteration 171; certificate b8fbf34763cd3fd6c2662cd9ecd1aed6c2e85be7e9a0199dbb3037c831f500ff. -/
def duplicateData171 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {4, 5, 9, 11} },
      { center := 2, support := {5, 8, 10, 11} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 10, support := {1, 2, 3, 5} },
      { center := 11, support := {0, 2, 4, 10} }
    ]
    data := {
      p := 0
      q := 2
      r := 4
      a := 5
      b := 11
      ap_aq := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 2, .flip 11 2, .row 2 11 5, .flip 2 5], last := (5, 2) }
      ap_ar := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 2, .flip 11 2, .row 2 11 10, .flip 2 10, .row 10 2 5, .flip 10 5, .row 5 10 4], last := (5, 4) }
      bp_bq := { first := (11, 0), steps := [.row 11 0 2], last := (11, 2) }
      bp_br := { first := (11, 0), steps := [.row 11 0 4], last := (11, 4) } } }

theorem duplicateCheck171 : duplicateData171.check = true := by
  native_decide

def cut171 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData171 duplicateCheck171

/-- Journal iteration 172; certificate 0f4172d44650b54b9c09fa39b4fb91e55a1a7ab5c47542a0d194606dc454d1ec. -/
def duplicateData172 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {4, 5, 9, 11} },
      { center := 2, support := {5, 8, 10, 11} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 10, support := {1, 2, 3, 5} },
      { center := 11, support := {0, 2, 4, 8} }
    ]
    data := {
      p := 0
      q := 2
      r := 4
      a := 5
      b := 11
      ap_aq := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 2, .flip 11 2, .row 2 11 5, .flip 2 5], last := (5, 2) }
      ap_ar := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 2, .flip 11 2, .row 2 11 10, .flip 2 10, .row 10 2 5, .flip 10 5, .row 5 10 4], last := (5, 4) }
      bp_bq := { first := (11, 0), steps := [.row 11 0 2], last := (11, 2) }
      bp_br := { first := (11, 0), steps := [.row 11 0 4], last := (11, 4) } } }

theorem duplicateCheck172 : duplicateData172.check = true := by
  native_decide

def cut172 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData172 duplicateCheck172

/-- Journal iteration 173; certificate 535285e5fcbb4b579c24fc38abd3ac1d3e1e199fa0899b1429b83090f3c371a2. -/
def duplicateData173 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {4, 5, 9, 11} },
      { center := 2, support := {5, 8, 10, 11} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 10, support := {1, 2, 3, 5} },
      { center := 11, support := {0, 2, 4, 6} }
    ]
    data := {
      p := 0
      q := 2
      r := 4
      a := 5
      b := 11
      ap_aq := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 2, .flip 11 2, .row 2 11 5, .flip 2 5], last := (5, 2) }
      ap_ar := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 2, .flip 11 2, .row 2 11 10, .flip 2 10, .row 10 2 5, .flip 10 5, .row 5 10 4], last := (5, 4) }
      bp_bq := { first := (11, 0), steps := [.row 11 0 2], last := (11, 2) }
      bp_br := { first := (11, 0), steps := [.row 11 0 4], last := (11, 4) } } }

theorem duplicateCheck173 : duplicateData173.check = true := by
  native_decide

def cut173 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData173 duplicateCheck173

/-- Journal iteration 174; certificate 5bf5a81ba04a56afb4d9b263888cbf5ace2858d361c1858bc4240371b0d5c6b3. -/
def duplicateData174 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {4, 5, 9, 11} },
      { center := 2, support := {5, 8, 10, 11} },
      { center := 4, support := {6, 7, 10, 11} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 8, support := {2, 5, 6, 9} },
      { center := 10, support := {1, 2, 3, 5} },
      { center := 11, support := {0, 2, 3, 10} }
    ]
    data := {
      p := 0
      q := 2
      r := 4
      a := 5
      b := 11
      ap_aq := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 2, .flip 11 2, .row 2 11 5, .flip 2 5], last := (5, 2) }
      ap_ar := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 2, .flip 11 2, .row 2 11 10, .flip 2 10, .row 10 2 5, .flip 10 5, .row 5 10 4], last := (5, 4) }
      bp_bq := { first := (11, 0), steps := [.row 11 0 2], last := (11, 2) }
      bp_br := { first := (11, 0), steps := [.row 11 0 2, .flip 11 2, .row 2 11 8, .flip 2 8, .row 8 2 6, .flip 8 6, .row 6 8 4, .flip 6 4, .row 4 6 11, .flip 4 11], last := (11, 4) } } }

theorem duplicateCheck174 : duplicateData174.check = true := by
  native_decide

def cut174 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData174 duplicateCheck174

/-- Journal iteration 175; certificate e349703b2377ad3ef8398231f8d8cc61883eea0eda269fc97c3d83124533fa02. -/
def duplicateData175 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {4, 5, 9, 11} },
      { center := 2, support := {5, 8, 10, 11} },
      { center := 4, support := {6, 7, 10, 11} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 8, support := {2, 5, 6, 9} },
      { center := 10, support := {1, 2, 3, 5} },
      { center := 11, support := {0, 2, 3, 9} }
    ]
    data := {
      p := 0
      q := 2
      r := 4
      a := 5
      b := 11
      ap_aq := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 2, .flip 11 2, .row 2 11 5, .flip 2 5], last := (5, 2) }
      ap_ar := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 2, .flip 11 2, .row 2 11 10, .flip 2 10, .row 10 2 5, .flip 10 5, .row 5 10 4], last := (5, 4) }
      bp_bq := { first := (11, 0), steps := [.row 11 0 2], last := (11, 2) }
      bp_br := { first := (11, 0), steps := [.row 11 0 2, .flip 11 2, .row 2 11 8, .flip 2 8, .row 8 2 6, .flip 8 6, .row 6 8 4, .flip 6 4, .row 4 6 11, .flip 4 11], last := (11, 4) } } }

theorem duplicateCheck175 : duplicateData175.check = true := by
  native_decide

def cut175 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData175 duplicateCheck175

/-- Journal iteration 176; certificate bccec74844511f7bcc2b1acbc2d55ea47893346dbce0d111303c810dcf1f2d62. -/
def duplicateData176 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {4, 5, 9, 11} },
      { center := 2, support := {5, 8, 10, 11} },
      { center := 4, support := {6, 7, 10, 11} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 8, support := {2, 5, 6, 9} },
      { center := 10, support := {1, 2, 3, 5} },
      { center := 11, support := {0, 2, 3, 8} }
    ]
    data := {
      p := 0
      q := 2
      r := 4
      a := 5
      b := 11
      ap_aq := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 2, .flip 11 2, .row 2 11 5, .flip 2 5], last := (5, 2) }
      ap_ar := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 2, .flip 11 2, .row 2 11 10, .flip 2 10, .row 10 2 5, .flip 10 5, .row 5 10 4], last := (5, 4) }
      bp_bq := { first := (11, 0), steps := [.row 11 0 2], last := (11, 2) }
      bp_br := { first := (11, 0), steps := [.row 11 0 2, .flip 11 2, .row 2 11 8, .flip 2 8, .row 8 2 6, .flip 8 6, .row 6 8 4, .flip 6 4, .row 4 6 11, .flip 4 11], last := (11, 4) } } }

theorem duplicateCheck176 : duplicateData176.check = true := by
  native_decide

def cut176 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData176 duplicateCheck176

/-- Journal iteration 177; certificate 3771b15b17fcc697101d2eb2e08c3456d84c3e8cb12da6c0f565b37dc4c01755. -/
def duplicateData177 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {4, 5, 9, 11} },
      { center := 2, support := {5, 8, 10, 11} },
      { center := 4, support := {6, 7, 10, 11} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 7, support := {3, 4, 6, 11} },
      { center := 10, support := {1, 2, 3, 5} },
      { center := 11, support := {0, 2, 3, 7} }
    ]
    data := {
      p := 0
      q := 2
      r := 4
      a := 5
      b := 11
      ap_aq := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 2, .flip 11 2, .row 2 11 5, .flip 2 5], last := (5, 2) }
      ap_ar := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 2, .flip 11 2, .row 2 11 10, .flip 2 10, .row 10 2 5, .flip 10 5, .row 5 10 4], last := (5, 4) }
      bp_bq := { first := (11, 0), steps := [.row 11 0 2], last := (11, 2) }
      bp_br := { first := (11, 0), steps := [.row 11 0 7, .flip 11 7, .row 7 11 4, .flip 7 4, .row 4 7 11, .flip 4 11], last := (11, 4) } } }

theorem duplicateCheck177 : duplicateData177.check = true := by
  native_decide

def cut177 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData177 duplicateCheck177

/-- Journal iteration 178; certificate 22cb7a58d74ded3b4c7250b60e2eddaa3198c2eabab84d4aab6ee0a23a6ec11c. -/
def duplicateData178 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {4, 5, 9, 11} },
      { center := 2, support := {5, 8, 10, 11} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 10, support := {1, 2, 3, 5} },
      { center := 11, support := {0, 2, 3, 4} }
    ]
    data := {
      p := 0
      q := 2
      r := 4
      a := 5
      b := 11
      ap_aq := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 2, .flip 11 2, .row 2 11 5, .flip 2 5], last := (5, 2) }
      ap_ar := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 2, .flip 11 2, .row 2 11 10, .flip 2 10, .row 10 2 5, .flip 10 5, .row 5 10 4], last := (5, 4) }
      bp_bq := { first := (11, 0), steps := [.row 11 0 2], last := (11, 2) }
      bp_br := { first := (11, 0), steps := [.row 11 0 4], last := (11, 4) } } }

theorem duplicateCheck178 : duplicateData178.check = true := by
  native_decide

def cut178 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData178 duplicateCheck178

/-- Journal iteration 179; certificate 1a6b94dfe07f2e33d73619728c4f9ec34010af333f5b7755fe711956f02e38cf. -/
def duplicateData179 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 2, support := {5, 8, 10, 11} },
      { center := 3, support := {6, 8, 9, 10} },
      { center := 8, support := {2, 5, 6, 9} },
      { center := 10, support := {1, 2, 3, 5} }
    ]
    data := {
      p := 2
      q := 3
      r := 5
      a := 8
      b := 10
      ap_aq := { first := (8, 2), steps := [.flip 8 2, .row 2 8 10, .flip 2 10, .row 10 2 3, .flip 10 3, .row 3 10 8, .flip 3 8], last := (8, 3) }
      ap_ar := { first := (8, 2), steps := [.row 8 2 5], last := (8, 5) }
      bp_bq := { first := (10, 2), steps := [.row 10 2 3], last := (10, 3) }
      bp_br := { first := (10, 2), steps := [.row 10 2 5], last := (10, 5) } } }

theorem duplicateCheck179 : duplicateData179.check = true := by
  native_decide

def cut179 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData179 duplicateCheck179

/-- Journal iteration 180; certificate 6596d9ccbc4bf056951fbe63903db5084f4b58f5a4ff6acabc3f7e3f8bdfcad9. -/
def duplicateData180 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {4, 5, 9, 11} },
      { center := 2, support := {5, 8, 10, 11} },
      { center := 3, support := {6, 8, 9, 10} },
      { center := 4, support := {6, 7, 10, 11} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 9, support := {3, 5, 6, 7} },
      { center := 10, support := {1, 2, 3, 4} },
      { center := 11, support := {0, 4, 6, 8} }
    ]
    data := {
      p := 0
      q := 2
      r := 4
      a := 5
      b := 11
      ap_aq := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 4, .flip 11 4, .row 4 11 10, .flip 4 10, .row 10 4 2, .flip 10 2, .row 2 10 5, .flip 2 5], last := (5, 2) }
      ap_ar := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 4, .flip 11 4, .row 4 11 10, .flip 4 10, .row 10 4 3, .flip 10 3, .row 3 10 9, .flip 3 9, .row 9 3 5, .flip 9 5, .row 5 9 4], last := (5, 4) }
      bp_bq := { first := (11, 0), steps := [.row 11 0 4, .flip 11 4, .row 4 11 10, .flip 4 10, .row 10 4 2, .flip 10 2, .row 2 10 11, .flip 2 11], last := (11, 2) }
      bp_br := { first := (11, 0), steps := [.row 11 0 4], last := (11, 4) } } }

theorem duplicateCheck180 : duplicateData180.check = true := by
  native_decide

def cut180 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData180 duplicateCheck180

/-- Journal iteration 181; certificate 194e58411c2c1152c44545e2eafa8b9f408a06aaa1410e492a58e07ba7bbcb93. -/
def duplicateData181 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 2, support := {5, 8, 10, 11} },
      { center := 3, support := {6, 8, 9, 10} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 8, support := {2, 5, 6, 9} },
      { center := 9, support := {3, 5, 6, 7} },
      { center := 10, support := {1, 2, 3, 4} }
    ]
    data := {
      p := 2
      q := 3
      r := 5
      a := 8
      b := 10
      ap_aq := { first := (8, 2), steps := [.flip 8 2, .row 2 8 10, .flip 2 10, .row 10 2 3, .flip 10 3, .row 3 10 8, .flip 3 8], last := (8, 3) }
      ap_ar := { first := (8, 2), steps := [.row 8 2 5], last := (8, 5) }
      bp_bq := { first := (10, 2), steps := [.row 10 2 3], last := (10, 3) }
      bp_br := { first := (10, 2), steps := [.row 10 2 3, .flip 10 3, .row 3 10 9, .flip 3 9, .row 9 3 5, .flip 9 5, .row 5 9 10, .flip 5 10], last := (10, 5) } } }

theorem duplicateCheck181 : duplicateData181.check = true := by
  native_decide

def cut181 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData181 duplicateCheck181

/-- Journal iteration 182; certificate 5f54cf743391a96b3118157c5c344a5dedafcf12a882abdff09723c73eebdb91. -/
def duplicateData182 : DuplicateCenterNogood Label :=
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

theorem duplicateCheck182 : duplicateData182.check = true := by
  native_decide

def cut182 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData182 duplicateCheck182

/-- Journal iteration 183; certificate c43d99ed262828deabe7584e3d5216c4bd527d3620875d6455011b02a46d33b4. -/
def duplicateData183 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 2, support := {5, 8, 10, 11} },
      { center := 4, support := {6, 7, 10, 11} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 8, support := {2, 5, 6, 9} },
      { center := 10, support := {0, 4, 6, 8} }
    ]
    data := {
      p := 2
      q := 6
      r := 8
      a := 5
      b := 10
      ap_aq := { first := (5, 2), steps := [.flip 5 2, .row 2 5 8, .flip 2 8, .row 8 2 6, .flip 8 6, .row 6 8 5, .flip 6 5], last := (5, 6) }
      ap_ar := { first := (5, 2), steps := [.flip 5 2, .row 2 5 8, .flip 2 8, .row 8 2 5, .flip 8 5], last := (5, 8) }
      bp_bq := { first := (10, 2), steps := [.flip 10 2, .row 2 10 8, .flip 2 8, .row 8 2 6, .flip 8 6, .row 6 8 4, .flip 6 4, .row 4 6 10, .flip 4 10, .row 10 4 6], last := (10, 6) }
      bp_br := { first := (10, 2), steps := [.flip 10 2, .row 2 10 8, .flip 2 8, .row 8 2 6, .flip 8 6, .row 6 8 4, .flip 6 4, .row 4 6 10, .flip 4 10, .row 10 4 8], last := (10, 8) } } }

theorem duplicateCheck183 : duplicateData183.check = true := by
  native_decide

def cut183 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData183 duplicateCheck183

/-- Journal iteration 184; certificate 0f1e54e4d6a045206ed77edaaf94685967fd4493c95bc6c74bf1aac755276930. -/
def duplicateData184 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 2, support := {5, 8, 10, 11} },
      { center := 4, support := {6, 7, 10, 11} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 8, support := {2, 5, 6, 9} },
      { center := 10, support := {0, 3, 4, 8} },
      { center := 11, support := {2, 3, 5, 10} }
    ]
    data := {
      p := 2
      q := 3
      r := 4
      a := 10
      b := 11
      ap_aq := { first := (10, 2), steps := [.flip 10 2, .row 2 10 8, .flip 2 8, .row 8 2 6, .flip 8 6, .row 6 8 4, .flip 6 4, .row 4 6 10, .flip 4 10, .row 10 4 3], last := (10, 3) }
      ap_ar := { first := (10, 2), steps := [.flip 10 2, .row 2 10 8, .flip 2 8, .row 8 2 6, .flip 8 6, .row 6 8 4, .flip 6 4, .row 4 6 10, .flip 4 10], last := (10, 4) }
      bp_bq := { first := (11, 2), steps := [.row 11 2 3], last := (11, 3) }
      bp_br := { first := (11, 2), steps := [.flip 11 2, .row 2 11 8, .flip 2 8, .row 8 2 6, .flip 8 6, .row 6 8 4, .flip 6 4, .row 4 6 11, .flip 4 11], last := (11, 4) } } }

theorem duplicateCheck184 : duplicateData184.check = true := by
  native_decide

def cut184 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData184 duplicateCheck184

/-- Journal iteration 185; certificate 0c167a84d284417062606db17a60c085a91a84b5b285077ef6f3552a2bb752b3. -/
def duplicateData185 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 2, support := {5, 8, 10, 11} },
      { center := 3, support := {6, 8, 9, 10} },
      { center := 4, support := {6, 7, 10, 11} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 8, support := {2, 5, 6, 9} },
      { center := 9, support := {3, 5, 6, 7} },
      { center := 10, support := {0, 3, 4, 8} }
    ]
    data := {
      p := 2
      q := 3
      r := 5
      a := 8
      b := 10
      ap_aq := { first := (8, 2), steps := [.row 8 2 6, .flip 8 6, .row 6 8 4, .flip 6 4, .row 4 6 10, .flip 4 10, .row 10 4 3, .flip 10 3, .row 3 10 8, .flip 3 8], last := (8, 3) }
      ap_ar := { first := (8, 2), steps := [.row 8 2 5], last := (8, 5) }
      bp_bq := { first := (10, 2), steps := [.flip 10 2, .row 2 10 8, .flip 2 8, .row 8 2 6, .flip 8 6, .row 6 8 4, .flip 6 4, .row 4 6 10, .flip 4 10, .row 10 4 3], last := (10, 3) }
      bp_br := { first := (10, 2), steps := [.flip 10 2, .row 2 10 8, .flip 2 8, .row 8 2 6, .flip 8 6, .row 6 8 4, .flip 6 4, .row 4 6 10, .flip 4 10, .row 10 4 3, .flip 10 3, .row 3 10 9, .flip 3 9, .row 9 3 5, .flip 9 5, .row 5 9 10, .flip 5 10], last := (10, 5) } } }

theorem duplicateCheck185 : duplicateData185.check = true := by
  native_decide

def cut185 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData185 duplicateCheck185

/-- Journal iteration 186; certificate 8f8c4c82bb1b65d302eaa3d39e456799390266045b25378dd46d70c0d9cff1aa. -/
def duplicateData186 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 2, support := {5, 8, 10, 11} },
      { center := 8, support := {2, 5, 6, 9} },
      { center := 10, support := {0, 2, 6, 8} },
      { center := 11, support := {2, 3, 5, 10} }
    ]
    data := {
      p := 2
      q := 5
      r := 10
      a := 8
      b := 11
      ap_aq := { first := (8, 2), steps := [.row 8 2 5], last := (8, 5) }
      ap_ar := { first := (8, 2), steps := [.flip 8 2, .row 2 8 10, .flip 2 10, .row 10 2 8, .flip 10 8], last := (8, 10) }
      bp_bq := { first := (11, 2), steps := [.row 11 2 5], last := (11, 5) }
      bp_br := { first := (11, 2), steps := [.row 11 2 10], last := (11, 10) } } }

theorem duplicateCheck186 : duplicateData186.check = true := by
  native_decide

def cut186 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData186 duplicateCheck186

/-- Journal iteration 187; certificate 11cc5f60f8a78e85b6d849a97ce783cb7c4db1613cbcb56ab8158568e89f4fca. -/
def duplicateData187 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 2, support := {5, 8, 10, 11} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 8, support := {2, 5, 6, 9} },
      { center := 10, support := {0, 2, 6, 8} }
    ]
    data := {
      p := 2
      q := 6
      r := 8
      a := 5
      b := 10
      ap_aq := { first := (5, 2), steps := [.flip 5 2, .row 2 5 8, .flip 2 8, .row 8 2 6, .flip 8 6, .row 6 8 5, .flip 6 5], last := (5, 6) }
      ap_ar := { first := (5, 2), steps := [.flip 5 2, .row 2 5 8, .flip 2 8, .row 8 2 5, .flip 8 5], last := (5, 8) }
      bp_bq := { first := (10, 2), steps := [.row 10 2 6], last := (10, 6) }
      bp_br := { first := (10, 2), steps := [.row 10 2 8], last := (10, 8) } } }

theorem duplicateCheck187 : duplicateData187.check = true := by
  native_decide

def cut187 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData187 duplicateCheck187

/-- Journal iteration 188; certificate ced64a82462ec52fac106f4f01a7383c571222a889fd7d3f96cb73c5c4813b1e. -/
def duplicateData188 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 2, support := {5, 8, 10, 11} },
      { center := 8, support := {2, 5, 6, 9} },
      { center := 10, support := {0, 2, 4, 8} },
      { center := 11, support := {2, 3, 5, 10} }
    ]
    data := {
      p := 2
      q := 5
      r := 10
      a := 8
      b := 11
      ap_aq := { first := (8, 2), steps := [.row 8 2 5], last := (8, 5) }
      ap_ar := { first := (8, 2), steps := [.flip 8 2, .row 2 8 10, .flip 2 10, .row 10 2 8, .flip 10 8], last := (8, 10) }
      bp_bq := { first := (11, 2), steps := [.row 11 2 5], last := (11, 5) }
      bp_br := { first := (11, 2), steps := [.row 11 2 10], last := (11, 10) } } }

theorem duplicateCheck188 : duplicateData188.check = true := by
  native_decide

def cut188 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData188 duplicateCheck188

/-- Journal iteration 189; certificate 8c2b964539a75a51eca093a0f9399bd2416801e03f7f121d6660959520e04b5d. -/
def duplicateData189 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 4, support := {6, 7, 10, 11} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 7, support := {3, 4, 6, 11} },
      { center := 11, support := {2, 3, 4, 10} }
    ]
    data := {
      p := 4
      q := 7
      r := 10
      a := 5
      b := 11
      ap_aq := { first := (5, 4), steps := [.row 5 4 7], last := (5, 7) }
      ap_ar := { first := (5, 4), steps := [.row 5 4 10], last := (5, 10) }
      bp_bq := { first := (11, 4), steps := [.flip 11 4, .row 4 11 7, .flip 4 7, .row 7 4 11, .flip 7 11], last := (11, 7) }
      bp_br := { first := (11, 4), steps := [.row 11 4 10], last := (11, 10) } } }

theorem duplicateCheck189 : duplicateData189.check = true := by
  native_decide

def cut189 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData189 duplicateCheck189

/-- Journal iteration 190; certificate 5b7de62f7fea32ddc8188ef9e72f6ad6be438529f799c5f1febf59ae5e99d4cd. -/
def duplicateData190 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 2, support := {5, 8, 10, 11} },
      { center := 3, support := {6, 8, 9, 10} },
      { center := 8, support := {2, 5, 6, 9} },
      { center := 10, support := {0, 2, 4, 8} }
    ]
    data := {
      p := 6
      q := 9
      r := 10
      a := 3
      b := 8
      ap_aq := { first := (3, 6), steps := [.row 3 6 9], last := (3, 9) }
      ap_ar := { first := (3, 6), steps := [.row 3 6 10], last := (3, 10) }
      bp_bq := { first := (8, 6), steps := [.row 8 6 9], last := (8, 9) }
      bp_br := { first := (8, 6), steps := [.row 8 6 2, .flip 8 2, .row 2 8 10, .flip 2 10, .row 10 2 8, .flip 10 8], last := (8, 10) } } }

theorem duplicateCheck190 : duplicateData190.check = true := by
  native_decide

def cut190 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData190 duplicateCheck190

/-- Journal iteration 191; certificate f027fdc5cdc8bc79e94505c1442b3acffcd0338f8690cc62b921b5bdf85cccf9. -/
def duplicateData191 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 2, support := {5, 8, 10, 11} },
      { center := 4, support := {6, 7, 10, 11} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 10, support := {0, 2, 4, 6} },
      { center := 11, support := {2, 3, 5, 10} }
    ]
    data := {
      p := 2
      q := 6
      r := 11
      a := 5
      b := 10
      ap_aq := { first := (5, 2), steps := [.flip 5 2, .row 2 5 10, .flip 2 10, .row 10 2 4, .flip 10 4, .row 4 10 6, .flip 4 6, .row 6 4 5, .flip 6 5], last := (5, 6) }
      ap_ar := { first := (5, 2), steps := [.flip 5 2, .row 2 5 11, .flip 2 11, .row 11 2 5, .flip 11 5], last := (5, 11) }
      bp_bq := { first := (10, 2), steps := [.row 10 2 6], last := (10, 6) }
      bp_br := { first := (10, 2), steps := [.flip 10 2, .row 2 10 11, .flip 2 11, .row 11 2 10, .flip 11 10], last := (10, 11) } } }

theorem duplicateCheck191 : duplicateData191.check = true := by
  native_decide

def cut191 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData191 duplicateCheck191

/-- Journal iteration 192; certificate c4a86b55cfaa5053538430d8217d3d8ee6db47f6eb11fddae67e808490145b56. -/
def duplicateData192 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 4, support := {6, 7, 10, 11} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 7, support := {3, 4, 6, 11} },
      { center := 11, support := {2, 3, 4, 8} }
    ]
    data := {
      p := 4
      q := 7
      r := 8
      a := 6
      b := 11
      ap_aq := { first := (6, 4), steps := [.row 6 4 7], last := (6, 7) }
      ap_ar := { first := (6, 4), steps := [.row 6 4 8], last := (6, 8) }
      bp_bq := { first := (11, 4), steps := [.flip 11 4, .row 4 11 7, .flip 4 7, .row 7 4 11, .flip 7 11], last := (11, 7) }
      bp_br := { first := (11, 4), steps := [.row 11 4 8], last := (11, 8) } } }

theorem duplicateCheck192 : duplicateData192.check = true := by
  native_decide

def cut192 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData192 duplicateCheck192

/-- Journal iteration 193; certificate 8de1f41ecb91482d3588e00ec31e4d849c9ca0ffd27eb1e4ccd25b8faa0f35dc. -/
def duplicateData193 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 4, support := {6, 7, 10, 11} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 10, support := {0, 2, 4, 6} }
    ]
    data := {
      p := 4
      q := 7
      r := 10
      a := 5
      b := 6
      ap_aq := { first := (5, 4), steps := [.row 5 4 7], last := (5, 7) }
      ap_ar := { first := (5, 4), steps := [.row 5 4 10], last := (5, 10) }
      bp_bq := { first := (6, 4), steps := [.row 6 4 7], last := (6, 7) }
      bp_br := { first := (6, 4), steps := [.flip 6 4, .row 4 6 10, .flip 4 10, .row 10 4 6, .flip 10 6], last := (6, 10) } } }

theorem duplicateCheck193 : duplicateData193.check = true := by
  native_decide

def cut193 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData193 duplicateCheck193

/-- Journal iteration 194; certificate ed42c33ed4fc933d26ac3bf3c0f361bda0254424587a0453e48ddceddfc346c1. -/
def duplicateData194 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 2, support := {5, 8, 10, 11} },
      { center := 3, support := {6, 8, 9, 10} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 8, support := {2, 5, 6, 9} },
      { center := 9, support := {3, 5, 6, 7} },
      { center := 10, support := {0, 2, 3, 11} }
    ]
    data := {
      p := 2
      q := 3
      r := 5
      a := 8
      b := 10
      ap_aq := { first := (8, 2), steps := [.flip 8 2, .row 2 8 10, .flip 2 10, .row 10 2 3, .flip 10 3, .row 3 10 8, .flip 3 8], last := (8, 3) }
      ap_ar := { first := (8, 2), steps := [.row 8 2 5], last := (8, 5) }
      bp_bq := { first := (10, 2), steps := [.row 10 2 3], last := (10, 3) }
      bp_br := { first := (10, 2), steps := [.row 10 2 3, .flip 10 3, .row 3 10 9, .flip 3 9, .row 9 3 5, .flip 9 5, .row 5 9 10, .flip 5 10], last := (10, 5) } } }

theorem duplicateCheck194 : duplicateData194.check = true := by
  native_decide

def cut194 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData194 duplicateCheck194

/-- Journal iteration 195; certificate df87e5a32d94d43b15bd9e86bf9f15878f8e3a1e04336f91c21cc74ea4b3e279. -/
def duplicateData195 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 2, support := {5, 8, 10, 11} },
      { center := 3, support := {6, 8, 9, 10} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 8, support := {2, 5, 6, 9} },
      { center := 9, support := {3, 5, 6, 7} },
      { center := 10, support := {0, 2, 3, 9} }
    ]
    data := {
      p := 2
      q := 3
      r := 5
      a := 8
      b := 10
      ap_aq := { first := (8, 2), steps := [.flip 8 2, .row 2 8 10, .flip 2 10, .row 10 2 3, .flip 10 3, .row 3 10 8, .flip 3 8], last := (8, 3) }
      ap_ar := { first := (8, 2), steps := [.row 8 2 5], last := (8, 5) }
      bp_bq := { first := (10, 2), steps := [.row 10 2 3], last := (10, 3) }
      bp_br := { first := (10, 2), steps := [.row 10 2 3, .flip 10 3, .row 3 10 9, .flip 3 9, .row 9 3 5, .flip 9 5, .row 5 9 10, .flip 5 10], last := (10, 5) } } }

theorem duplicateCheck195 : duplicateData195.check = true := by
  native_decide

def cut195 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData195 duplicateCheck195

/-- Journal iteration 196; certificate 83c1a919f497866d10f84a9908a4f7ca625fbfe21263f8d83cd2ffb9f28dd0cb. -/
def duplicateData196 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 2, support := {5, 8, 10, 11} },
      { center := 3, support := {6, 8, 9, 10} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 8, support := {2, 5, 6, 9} },
      { center := 9, support := {3, 5, 6, 7} },
      { center := 10, support := {0, 2, 3, 8} }
    ]
    data := {
      p := 2
      q := 3
      r := 5
      a := 8
      b := 10
      ap_aq := { first := (8, 2), steps := [.flip 8 2, .row 2 8 10, .flip 2 10, .row 10 2 3, .flip 10 3, .row 3 10 8, .flip 3 8], last := (8, 3) }
      ap_ar := { first := (8, 2), steps := [.row 8 2 5], last := (8, 5) }
      bp_bq := { first := (10, 2), steps := [.row 10 2 3], last := (10, 3) }
      bp_br := { first := (10, 2), steps := [.row 10 2 3, .flip 10 3, .row 3 10 9, .flip 3 9, .row 9 3 5, .flip 9 5, .row 5 9 10, .flip 5 10], last := (10, 5) } } }

theorem duplicateCheck196 : duplicateData196.check = true := by
  native_decide

def cut196 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData196 duplicateCheck196

/-- Journal iteration 197; certificate 3cf9374bb209b0241f37115de9eda4b729cb4ba4f6d8e385519e9a8842f8828e. -/
def duplicateData197 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 2, support := {5, 8, 10, 11} },
      { center := 3, support := {6, 8, 9, 10} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 8, support := {2, 5, 6, 9} },
      { center := 9, support := {3, 5, 6, 7} },
      { center := 10, support := {0, 2, 3, 7} }
    ]
    data := {
      p := 2
      q := 3
      r := 5
      a := 8
      b := 10
      ap_aq := { first := (8, 2), steps := [.flip 8 2, .row 2 8 10, .flip 2 10, .row 10 2 3, .flip 10 3, .row 3 10 8, .flip 3 8], last := (8, 3) }
      ap_ar := { first := (8, 2), steps := [.row 8 2 5], last := (8, 5) }
      bp_bq := { first := (10, 2), steps := [.row 10 2 3], last := (10, 3) }
      bp_br := { first := (10, 2), steps := [.row 10 2 3, .flip 10 3, .row 3 10 9, .flip 3 9, .row 9 3 5, .flip 9 5, .row 5 9 10, .flip 5 10], last := (10, 5) } } }

theorem duplicateCheck197 : duplicateData197.check = true := by
  native_decide

def cut197 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData197 duplicateCheck197

/-- Journal iteration 198; certificate 76bd06f29a473f57c4dd4b542968f8a9a5adf5b3435de6546b0179bc1428f855. -/
def duplicateData198 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 2, support := {5, 8, 10, 11} },
      { center := 3, support := {6, 8, 9, 10} },
      { center := 8, support := {2, 5, 6, 9} },
      { center := 10, support := {0, 2, 3, 5} }
    ]
    data := {
      p := 2
      q := 3
      r := 5
      a := 8
      b := 10
      ap_aq := { first := (8, 2), steps := [.flip 8 2, .row 2 8 10, .flip 2 10, .row 10 2 3, .flip 10 3, .row 3 10 8, .flip 3 8], last := (8, 3) }
      ap_ar := { first := (8, 2), steps := [.row 8 2 5], last := (8, 5) }
      bp_bq := { first := (10, 2), steps := [.row 10 2 3], last := (10, 3) }
      bp_br := { first := (10, 2), steps := [.row 10 2 5], last := (10, 5) } } }

theorem duplicateCheck198 : duplicateData198.check = true := by
  native_decide

def cut198 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData198 duplicateCheck198

/-- Journal iteration 199; certificate e4be5876a6b7b871e8433344c5250b11e4c1a6f6f63460f9a84ff78e63d17c39. -/
def duplicateData199 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 2, support := {5, 8, 10, 11} },
      { center := 3, support := {6, 8, 9, 10} },
      { center := 5, support := {4, 7, 9, 10} },
      { center := 8, support := {2, 5, 6, 9} },
      { center := 9, support := {3, 5, 6, 7} },
      { center := 10, support := {0, 2, 3, 4} }
    ]
    data := {
      p := 2
      q := 3
      r := 5
      a := 8
      b := 10
      ap_aq := { first := (8, 2), steps := [.flip 8 2, .row 2 8 10, .flip 2 10, .row 10 2 3, .flip 10 3, .row 3 10 8, .flip 3 8], last := (8, 3) }
      ap_ar := { first := (8, 2), steps := [.row 8 2 5], last := (8, 5) }
      bp_bq := { first := (10, 2), steps := [.row 10 2 3], last := (10, 3) }
      bp_br := { first := (10, 2), steps := [.row 10 2 3, .flip 10 3, .row 3 10 9, .flip 3 9, .row 9 3 5, .flip 9 5, .row 5 9 10, .flip 5 10], last := (10, 5) } } }

theorem duplicateCheck199 : duplicateData199.check = true := by
  native_decide

def cut199 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData199 duplicateCheck199

/-- Journal iteration 200; certificate ed45c39d5dc78baa1433610e0c62e801ed7ed4f32a7ab4413e4bc30e2864996b. -/
def duplicateData200 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 2, support := {5, 8, 10, 11} },
      { center := 6, support := {4, 5, 7, 8} },
      { center := 7, support := {3, 4, 6, 11} },
      { center := 8, support := {2, 5, 6, 9} },
      { center := 9, support := {3, 5, 6, 7} },
      { center := 11, support := {2, 3, 5, 10} }
    ]
    data := {
      p := 3
      q := 5
      r := 7
      a := 9
      b := 11
      ap_aq := { first := (9, 3), steps := [.row 9 3 5], last := (9, 5) }
      ap_ar := { first := (9, 3), steps := [.row 9 3 7], last := (9, 7) }
      bp_bq := { first := (11, 3), steps := [.row 11 3 5], last := (11, 5) }
      bp_br := { first := (11, 3), steps := [.row 11 3 2, .flip 11 2, .row 2 11 8, .flip 2 8, .row 8 2 6, .flip 8 6, .row 6 8 7, .flip 6 7, .row 7 6 11, .flip 7 11], last := (11, 7) } } }

theorem duplicateCheck200 : duplicateData200.check = true := by
  native_decide

def cut200 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData200 duplicateCheck200

/-- Journal iteration 201; certificate
    de7397381a1511fd886fa67c46badf12e4617d99abca510ed8cc6127e1f1e1b6. -/
def bisectorChoices201 : List (RowChoice Label) := [
    { center := 2, support := {5, 8, 10, 11} },
    { center := 6, support := {4, 5, 7, 8} },
    { center := 8, support := {2, 5, 6, 9} },
    { center := 10, support := {0, 1, 6, 8} }
  ]

def bisectorData201 : EquilateralBisectorCollisionData Label := {
    p := 2
    a := 8
    b := 5
    c := 10
    x := 6
    pa_pb := { first := (2, 8), steps := [.row 2 8 5], last := (2, 5) }
    pa_pc := { first := (2, 8), steps := [.row 2 8 10], last := (2, 10) }
    pa_ab := { first := (2, 8), steps := [.flip 2 8, .row 8 2 5], last := (8, 5) }
    pa_ax := { first := (2, 8), steps := [.flip 2 8, .row 8 2 6], last := (8, 6) }
    pa_bx := { first := (2, 8), steps := [.flip 2 8, .row 8 2 6, .flip 8 6, .row 6 8 5, .flip 6 5], last := (5, 6) }
    cx_ca := { first := (10, 6), steps := [.row 10 6 8], last := (10, 8) } }

theorem bisectorCheck201 :
    bisectorData201.check bisectorChoices201 = true := by
  native_decide

def cut201 : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofEquilateralBisectorCertificate
    bisectorChoices201 bisectorData201 bisectorCheck201

def bank : List SourceOrderPositiveNogood := [cut0, cut1, cut2, cut3, cut4, cut5, cut6, cut7, cut8, cut9, cut10, cut11, cut12, cut13, cut14, cut15, cut16, cut17, cut18, cut19, cut20, cut21, cut22, cut23, cut24, cut25, cut26, cut27, cut28, cut29, cut30, cut31, cut32, cut33, cut34, cut35, cut36, cut37, cut38, cut39, cut40, cut41, cut42, cut43, cut44, cut45, cut46, cut47, cut48, cut49, cut50, cut51, cut52, cut53, cut54, cut55, cut56, cut57, cut58, cut59, cut60, cut61, cut62, cut63, cut64, cut65, cut66, cut67, cut68, cut69, cut70, cut71, cut72, cut73, cut74, cut75, cut76, cut77, cut78, cut79, cut80, cut81, cut82, cut83, cut84, cut85, cut86, cut87, cut88, cut89, cut90, cut91, cut92, cut93, cut94, cut95, cut96, cut97, cut98, cut99, cut100, cut101, cut102, cut103, cut104, cut105, cut106, cut107, cut108, cut109, cut110, cut111, cut112, cut113, cut114, cut115, cut116, cut117, cut118, cut119, cut120, cut121, cut122, cut123, cut124, cut125, cut126, cut127, cut128, cut129, cut130, cut131, cut132, cut133, cut134, cut135, cut136, cut137, cut138, cut139, cut140, cut141, cut142, cut143, cut144, cut145, cut146, cut147, cut148, cut149, cut150, cut151, cut152, cut153, cut154, cut155, cut156, cut157, cut158, cut159, cut160, cut161, cut162, cut163, cut164, cut165, cut166, cut167, cut168, cut169, cut170, cut171, cut172, cut173, cut174, cut175, cut176, cut177, cut178, cut179, cut180, cut181, cut182, cut183, cut184, cut185, cut186, cut187, cut188, cut189, cut190, cut191, cut192, cut193, cut194, cut195, cut196, cut197, cut198, cut199, cut200, cut201]

/-- The exact learned clauses authenticated from the source journal. -/
def journalLearnedClauses : List (List Int) := [
    [-173, -488, -809, -1424, -2026, -2620],
    [-173, -488, -2026, -2596],
    [-488, -809, -1424, -1720, -2026],
    [-173, -809, -1119, -1424, -1720, -2620],
    [-173, -488, -1119, -1424, -1720, -1999, -2596],
    [-173, -809, -1119, -1424, -1720, -1999, -2564],
    [-173, -488, -809, -1119, -1424, -1720, -1999, -2540],
    [-173, -809, -1119, -1424, -1720, -1999, -2528],
    [-173, -1119, -1424, -1720, -1999, -2519],
    [-173, -809, -1119, -1424, -1720, -2517],
    [-53, -173, -809, -1119, -1424, -1720, -1999, -2802],
    [-53, -173, -809, -1119, -1424, -1720, -1999, -2515, -2785],
    [-53, -173, -809, -1119, -1424, -1720, -1999, -2780],
    [-53, -173, -809, -1119, -1424, -1720, -1999, -2778],
    [-53, -173, -809, -1119, -1424, -1720, -1999, -2766],
    [-53, -173, -809, -1119, -1424, -1720, -1999, -2764],
    [-53, -173, -809, -1119, -1424, -1720, -2759],
    [-53, -173, -809, -1119, -1424, -1720, -2757],
    [-53, -173, -809, -1119, -1424, -1720, -2755],
    [-53, -173, -809, -1119, -1424, -1720, -1999, -2753],
    [-53, -173, -809, -1119, -1424, -1720, -1999, -2752],
    [-53, -173, -809, -1119, -1424, -1720, -1999, -2751],
    [-53, -173, -809, -1119, -1424, -1720, -1999, -2750],
    [-53, -173, -809, -1119, -1424, -1720, -1999, -2748],
    [-53, -173, -809, -1119, -1424, -1720, -2747],
    [-173, -488, -1119, -1424, -1720, -1999, -2515],
    [-173, -488, -1119, -1424, -1720, -1999, -2514],
    [-173, -488, -1119, -1424, -1720, -1999, -2513],
    [-173, -488, -1119, -1424, -1720, -1999, -2512],
    [-173, -488, -1999, -2510],
    [-173, -488, -1119, -1424, -1720, -1999, -2509],
    [-173, -809, -1119, -1424, -1720, -1999, -2925],
    [-173, -809, -1119, -1424, -1720, -1999, -2480],
    [-173, -488, -809, -1119, -1424, -1720, -1999, -2456],
    [-173, -809, -1119, -1424, -1720, -1999, -2444],
    [-173, -1119, -1424, -1720, -1999, -2435],
    [-173, -809, -1119, -1424, -1720, -2433],
    [-173, -488, -1119, -1424, -1720, -1999, -2431],
    [-173, -488, -1119, -1424, -1720, -1999, -2430],
    [-173, -488, -1119, -1424, -1720, -1999, -2429],
    [-173, -488, -1119, -1424, -1720, -1999, -2428],
    [-173, -488, -1999, -2426],
    [-173, -488, -1119, -1424, -1720, -1999, -2425],
    [-173, -809, -1119, -1424, -1720, -2920],
    [-173, -1119, -1424, -1720, -1999, -2918],
    [-173, -1424, -1720, -1999],
    [-173, -1119, -1424, -1720, -1992],
    [-173, -488, -1119, -1424, -1720, -1977, -2313],
    [-53, -173, -809, -1119, -1424, -1720, -1977, -2780],
    [-53, -173, -809, -1119, -1424, -1720, -1977, -2764],
    [-173, -1119, -1424, -1720, -1977, -2304],
    [-53, -173, -1119, -1977, -2629, -2802],
    [-53, -173, -488, -1977, -2286, -2778],
    [-53, -154, -173, -488, -1977, -2286, -2738],
    [-53, -154, -173, -488, -809, -1424, -1977, -2286, -2731],
    [-53, -154, -173, -488, -1977, -2286, -2729],
    [-53, -154, -173, -488, -809, -1424, -1977, -2286, -2727],
    [-488, -1119, -2286, -2629],
    [-53, -173, -488, -1119, -1977, -2286, -2802],
    [-53, -173, -809, -1119, -1424, -1720, -1977, -2766],
    [-173, -488, -1119, -1977, -2286],
    [-53, -173, -809, -1119, -1424, -1720, -1977, -2765],
    [-53, -173, -809, -1119, -1424, -1720, -1977, -2760],
    [-173, -488, -1119, -1977, -2284],
    [-173, -488, -809, -1424, -1977, -2281],
    [-173, -488, -809, -1424, -1977, -2280],
    [-154, -488, -1424, -1720, -1977, -2258],
    [-173, -488, -1977, -2629],
    [-53, -154, -2249, -2737],
    [-173, -809, -1119, -1424, -1720, -2600],
    [-809, -1119, -1424, -1720, -2249, -2573],
    [-53, -173, -809, -1119, -1424, -1720, -1977, -2753],
    [-53, -173, -809, -1119, -1424, -1720, -1977, -2752],
    [-53, -173, -809, -1119, -1424, -1720, -1977, -2751],
    [-53, -173, -809, -1119, -1424, -1720, -1977, -2750],
    [-173, -488, -809, -1119, -1424, -1977, -2544],
    [-173, -488, -1977, -2542],
    [-173, -809, -1424, -1977, -2249, -2527],
    [-173, -809, -1119, -1424, -1720, -2523],
    [-173, -809, -1424, -1977, -2249, -2522],
    [-173, -488, -1977, -2521],
    [-173, -809, -1119, -1424, -1720, -1977, -2514],
    [-173, -809, -1424, -1977, -2249, -2513],
    [-173, -809, -1119, -1424, -1720, -1977, -2512],
    [-488, -809, -1424, -1720, -1977],
    [-173, -1119, -1424, -1720, -1974, -2306],
    [-53, -173, -809, -1119, -1424, -1720, -2598, -2785],
    [-173, -1119, -1424, -1720, -1974, -2304],
    [-53, -173, -809, -1119, -1424, -1720, -1974, -2802],
    [-53, -173, -488, -1974, -2286, -2622, -2780],
    [-53, -173, -488, -809, -1424, -1974, -2286, -2778],
    [-53, -173, -809, -1119, -1424, -1720, -1974, -2761],
    [-173, -488, -1119, -1974, -2286],
    [-173, -488, -809, -1424, -1974, -2282],
    [-53, -173, -488, -1974, -2281, -2622, -2785],
    [-173, -488, -1974, -2281, -2622],
    [-53, -173, -488, -809, -1424, -1974, -2281, -2566, -2785],
    [-173, -488, -809, -1424, -1974, -2281],
    [-53, -173, -488, -1974, -2280, -2622, -2785],
    [-173, -488, -1974, -2280, -2622],
    [-53, -173, -488, -809, -1424, -1974, -2280, -2566, -2785],
    [-173, -488, -809, -1424, -1974, -2280],
    [-173, -1424, -1720, -1974],
    [-53, -173, -809, -1119, -1424, -1720, -2629, -2802],
    [-53, -173, -809, -1119, -1424, -1720, -2629, -2780],
    [-53, -173, -809, -1119, -1424, -1720, -2629, -2778],
    [-53, -173, -809, -1119, -1424, -1720, -2629, -2766],
    [-53, -173, -809, -1119, -1424, -1720, -2629, -2752],
    [-53, -173, -809, -1119, -1424, -1720, -2629, -2751],
    [-53, -173, -809, -1119, -1424, -1720, -2629, -2750],
    [-173, -488, -1972, -2629],
    [-809, -1119, -1424, -1720, -1972, -2596],
    [-53, -809, -1119, -1424, -1720, -2802],
    [-53, -809, -1119, -1424, -1720, -2780],
    [-53, -809, -1119, -1424, -1720, -2778],
    [-53, -173, -1972, -2766],
    [-809, -1424, -1720, -2340],
    [-173, -488, -809, -1119, -1424, -1720, -1972, -2622],
    [-809, -1119, -1424, -1720, -1972, -2598],
    [-488, -1972, -2338, -2752],
    [-53, -173, -1972, -2751],
    [-809, -1424, -1720, -2338],
    [-53, -173, -488, -809, -1424, -1720, -1972, -2313, -2657, -2752],
    [-53, -173, -488, -809, -1424, -1720, -1972, -2313, -2657, -2750],
    [-488, -809, -1424, -1720, -1972, -2313, -2657],
    [-53, -173, -488, -809, -1424, -1720, -1972, -2313, -2655, -2752],
    [-53, -173, -488, -809, -1424, -1720, -1972, -2313, -2655, -2750],
    [-53, -154, -173, -809, -1424, -1720, -1972, -2313, -2655, -2731],
    [-53, -154, -173, -809, -1424, -1720, -1972, -2313, -2655, -2727],
    [-488, -809, -1424, -1720, -1972, -2313, -2655],
    [-53, -1424, -1720, -2313],
    [-173, -809, -1119, -1424, -1720, -1972, -2655],
    [-53, -809, -1424, -1720],
    [-173, -488, -809, -1424, -2034, -2620],
    [-173, -488, -2034, -2313, -2596],
    [-488, -809, -1424, -1712, -2034, -2564],
    [-488, -809, -1424, -2540],
    [-488, -809, -1424, -1712, -2034],
    [-488, -1424, -1712, -2033],
    [-173, -1424, -2000, -2620],
    [-173, -488, -1119, -2000, -2347, -2596],
    [-173, -809, -1424, -2000, -2564],
    [-173, -1424, -2000, -2528],
    [-173, -488, -2000, -2519],
    [-809, -1119, -1424, -2517],
    [-53, -173, -488, -809, -1119, -1424, -2000, -2347, -2515, -2802],
    [-53, -173, -488, -809, -1119, -1424, -2000, -2347, -2515, -2785],
    [-53, -173, -488, -1119, -2347, -2515, -2780],
    [-53, -173, -488, -809, -1119, -1424, -2000, -2347, -2515, -2778],
    [-53, -173, -488, -809, -1119, -1424, -2000, -2347, -2515, -2766],
    [-53, -173, -488, -809, -1119, -1424, -2000, -2347, -2515, -2764],
    [-53, -173, -488, -1119, -2347, -2515, -2759],
    [-53, -173, -488, -1119, -2347, -2515, -2757],
    [-53, -173, -488, -1119, -2347, -2515, -2755],
    [-53, -173, -488, -809, -1119, -1424, -2000, -2347, -2515, -2753],
    [-53, -173, -488, -809, -1119, -1424, -2000, -2347, -2515, -2752],
    [-53, -173, -488, -809, -1119, -1424, -2000, -2347, -2515, -2751],
    [-53, -173, -488, -809, -1119, -1712, -2347, -2515, -2750],
    [-53, -173, -488, -809, -1119, -1424, -2000, -2347, -2515, -2748],
    [-53, -173, -488, -1119, -2347, -2515, -2747],
    [-173, -488, -1119, -2000, -2347, -2515],
    [-53, -173, -488, -809, -1119, -1424, -2000, -2347, -2514, -2802],
    [-173, -488, -1119, -2000, -2347, -2514],
    [-53, -173, -488, -809, -1119, -1424, -2000, -2347, -2513, -2802],
    [-173, -488, -1119, -2000, -2347, -2513],
    [-53, -173, -488, -809, -1119, -1424, -2000, -2347, -2512, -2802],
    [-173, -488, -1119, -2000, -2347, -2512],
    [-53, -173, -809, -1119, -1424, -2000, -2510, -2802],
    [-53, -173, -809, -1119, -1424, -2000, -2510, -2780],
    [-53, -173, -809, -1119, -1424, -2000, -2510, -2778],
    [-53, -173, -809, -1119, -1424, -2000, -2510, -2766],
    [-53, -173, -1119, -2510, -2759],
    [-53, -173, -1119, -2510, -2757],
    [-53, -173, -1119, -2510, -2755],
    [-53, -173, -809, -1119, -1424, -2000, -2510, -2753],
    [-53, -173, -809, -1119, -1424, -2000, -2510, -2752],
    [-53, -173, -809, -1119, -1424, -2000, -2510, -2751],
    [-53, -173, -809, -1119, -1712, -2510, -2750],
    [-53, -173, -1119, -2510, -2747],
    [-173, -488, -2000, -2510],
    [-53, -173, -488, -809, -1119, -2347, -2509, -2802],
    [-173, -488, -1119, -2000, -2347, -2509],
    [-809, -1424, -2000, -2480, -2925],
    [-173, -809, -1424, -2000, -2480],
    [-173, -809, -1424, -2000, -2456, -2925],
    [-173, -488, -809, -1119, -1424, -2000, -2347, -2456],
    [-173, -2000, -2444, -2925],
    [-173, -1424, -2000, -2444],
    [-173, -2000, -2435, -2925],
    [-809, -1119, -1712, -2920],
    [-173, -488, -2000, -2435],
    [-173, -809, -1424, -2433, -2925],
    [-809, -1424, -1712, -2918],
    [-809, -1119, -1424, -2433],
    [-173, -488, -1119, -2000, -2347, -2431],
    [-173, -488, -1119, -2000, -2347, -2430],
    [-173, -488, -1119, -2000, -2347, -2429],
    [-173, -488, -1119, -2000, -2347, -2428],
    [-173, -488, -2000, -2426],
    [-173, -488, -1119, -2000, -2347, -2425],
    [-173, -1424, -1712, -2000, -2347, -2925],
    [-173, -1424, -2000, -2416]
  ]

/-- Kernel-checked agreement between every typed cut and the exact literal
list authenticated from the source journal. -/
theorem bankLearnedClauses_eq_journal :
    bank.map (fun nogood => learnedClause nogood.choices) =
      journalLearnedClauses := by
  native_decide

/-- The concrete source-row choices carried by the typed bank. -/
def bankChoices : List (List (RowChoice Label)) := [cut0.choices, cut1.choices, cut2.choices, cut3.choices, cut4.choices, cut5.choices, cut6.choices, cut7.choices, cut8.choices, cut9.choices, cut10.choices, cut11.choices, cut12.choices, cut13.choices, cut14.choices, cut15.choices, cut16.choices, cut17.choices, cut18.choices, cut19.choices, cut20.choices, cut21.choices, cut22.choices, cut23.choices, cut24.choices, cut25.choices, cut26.choices, cut27.choices, cut28.choices, cut29.choices, cut30.choices, cut31.choices, cut32.choices, cut33.choices, cut34.choices, cut35.choices, cut36.choices, cut37.choices, cut38.choices, cut39.choices, cut40.choices, cut41.choices, cut42.choices, cut43.choices, cut44.choices, cut45.choices, cut46.choices, cut47.choices, cut48.choices, cut49.choices, cut50.choices, cut51.choices, cut52.choices, cut53.choices, cut54.choices, cut55.choices, cut56.choices, cut57.choices, cut58.choices, cut59.choices, cut60.choices, cut61.choices, cut62.choices, cut63.choices, cut64.choices, cut65.choices, cut66.choices, cut67.choices, cut68.choices, cut69.choices, cut70.choices, cut71.choices, cut72.choices, cut73.choices, cut74.choices, cut75.choices, cut76.choices, cut77.choices, cut78.choices, cut79.choices, cut80.choices, cut81.choices, cut82.choices, cut83.choices, cut84.choices, cut85.choices, cut86.choices, cut87.choices, cut88.choices, cut89.choices, cut90.choices, cut91.choices, cut92.choices, cut93.choices, cut94.choices, cut95.choices, cut96.choices, cut97.choices, cut98.choices, cut99.choices, cut100.choices, cut101.choices, cut102.choices, cut103.choices, cut104.choices, cut105.choices, cut106.choices, cut107.choices, cut108.choices, cut109.choices, cut110.choices, cut111.choices, cut112.choices, cut113.choices, cut114.choices, cut115.choices, cut116.choices, cut117.choices, cut118.choices, cut119.choices, cut120.choices, cut121.choices, cut122.choices, cut123.choices, cut124.choices, cut125.choices, cut126.choices, cut127.choices, cut128.choices, cut129.choices, cut130.choices, cut131.choices, cut132.choices, cut133.choices, cut134.choices, cut135.choices, cut136.choices, cut137.choices, cut138.choices, cut139.choices, cut140.choices, cut141.choices, cut142.choices, cut143.choices, cut144.choices, cut145.choices, cut146.choices, cut147.choices, cut148.choices, cut149.choices, cut150.choices, cut151.choices, cut152.choices, cut153.choices, cut154.choices, cut155.choices, cut156.choices, cut157.choices, cut158.choices, cut159.choices, cut160.choices, cut161.choices, cut162.choices, cut163.choices, cut164.choices, cut165.choices, cut166.choices, cut167.choices, cut168.choices, cut169.choices, cut170.choices, cut171.choices, cut172.choices, cut173.choices, cut174.choices, cut175.choices, cut176.choices, cut177.choices, cut178.choices, cut179.choices, cut180.choices, cut181.choices, cut182.choices, cut183.choices, cut184.choices, cut185.choices, cut186.choices, cut187.choices, cut188.choices, cut189.choices, cut190.choices, cut191.choices, cut192.choices, cut193.choices, cut194.choices, cut195.choices, cut196.choices, cut197.choices, cut198.choices, cut199.choices, cut200.choices, cut201.choices]

theorem bankChoices_eq :
    bank.map (fun nogood => nogood.choices) = bankChoices := by
  rfl

/-- Every concrete row choice is present in the frozen candidate table. -/
theorem bankChoices_encodable :
    ∀ choices ∈ bankChoices, ∀ choice ∈ choices,
      FrozenSafeCandidateAt choice.center choice.support := by
  native_decide

/-- Consumer-ready encodability premise for the terminal bank theorem. -/
theorem bank_encodable :
    ∀ nogood ∈ bank, ∀ choice ∈ nogood.choices,
      FrozenSafeCandidateAt choice.center choice.support := by
  intro nogood hnogood
  apply bankChoices_encodable nogood.choices
  rw [← bankChoices_eq]
  exact List.mem_map_of_mem _ hnogood

end Problem97.ATailFrontierLiveClosure.ExactTwelveFiveOmissionTypedTerminalBank
