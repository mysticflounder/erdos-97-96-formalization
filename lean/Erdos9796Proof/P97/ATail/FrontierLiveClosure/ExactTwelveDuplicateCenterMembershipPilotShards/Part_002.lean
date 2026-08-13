/-
Generated membership-core shard from scratch/sidecar-sourcefaithful-common-missing-20260807-a7f3c1/ordered-cegar-jd0-v4/journal.jsonl
Journal SHA-256: 4d2ac12341f5981cf988c7add8b547e2840f26c2395161b124d73373124e8db3
Global record interval: 25..49

This file checks record validity only.  It is not a coverage or UNSAT proof.
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.GenericRowNogoodCertificate

namespace Problem97.ATailFrontierLiveClosure.ExactTwelveDuplicateCenterMembershipPilotShards.Part_002

open Problem97.Census554.EqualityCore
open Problem97.ATailFrontierLiveClosure.GenericRowNogoodCertificate
open scoped EuclideanGeometry

abbrev Label := Fin 12

/-- Journal iteration 739; certificate e93c060e20c0030048c176b630df7c32185faa0c510cbf605e969e1b635c93ac. -/
def record25 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 5, support := {1, 4, 6} },
      { center := 6, support := {1, 4, 5, 8} },
      { center := 8, support := {5, 6} }
    ]
    data := {
      p := 1
      q := 4
      r := 8
      a := 5
      b := 6
      ap_aq := { first := (5, 1), steps := [.row 5 1 4], last := (5, 4) }
      ap_ar := { first := (5, 1), steps := [.row 5 1 6, .flip 5 6, .row 6 5 8, .flip 6 8, .row 8 6 5, .flip 8 5], last := (5, 8) }
      bp_bq := { first := (6, 1), steps := [.row 6 1 4], last := (6, 4) }
      bp_br := { first := (6, 1), steps := [.row 6 1 8], last := (6, 8) } } }

/-- Journal iteration 740; certificate 57677020d310f6865fd89840702548cda8b7d38adfe503502658302f674bcecc. -/
def record26 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {3, 4} },
      { center := 2, support := {4, 10} },
      { center := 3, support := {0, 4, 10} },
      { center := 9, support := {0, 2, 3} },
      { center := 10, support := {2, 3} }
    ]
    data := {
      p := 0
      q := 2
      r := 3
      a := 4
      b := 9
      ap_aq := { first := (4, 0), steps := [.flip 4 0, .row 0 4 3, .flip 0 3, .row 3 0 10, .flip 3 10, .row 10 3 2, .flip 10 2, .row 2 10 4, .flip 2 4], last := (4, 2) }
      ap_ar := { first := (4, 0), steps := [.flip 4 0, .row 0 4 3, .flip 0 3, .row 3 0 4, .flip 3 4], last := (4, 3) }
      bp_bq := { first := (9, 0), steps := [.row 9 0 2], last := (9, 2) }
      bp_br := { first := (9, 0), steps := [.row 9 0 3], last := (9, 3) } } }

/-- Journal iteration 741; certificate 751833d0a9f6a15f7293cd1bf082d9945b44d825e6e831cd4cfd23a79773d552. -/
def record27 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 1, support := {0, 6, 8} },
      { center := 3, support := {0, 8} },
      { center := 6, support := {3, 8} },
      { center := 8, support := {3, 6} }
    ]
    data := {
      p := 0
      q := 6
      r := 8
      a := 1
      b := 3
      ap_aq := { first := (1, 0), steps := [.row 1 0 6], last := (1, 6) }
      ap_ar := { first := (1, 0), steps := [.row 1 0 8], last := (1, 8) }
      bp_bq := { first := (3, 0), steps := [.row 3 0 8, .flip 3 8, .row 8 3 6, .flip 8 6, .row 6 8 3, .flip 6 3], last := (3, 6) }
      bp_br := { first := (3, 0), steps := [.row 3 0 8], last := (3, 8) } } }

/-- Journal iteration 742; certificate 5deae807efd19c85cf316cbec698abcf2284e9ec13ec6921f089def1f54731fc. -/
def record28 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 4, support := {0, 6, 10} },
      { center := 6, support := {7, 11} },
      { center := 7, support := {6, 11} },
      { center := 11, support := {0, 7, 10} }
    ]
    data := {
      p := 0
      q := 6
      r := 10
      a := 4
      b := 11
      ap_aq := { first := (4, 0), steps := [.row 4 0 6], last := (4, 6) }
      ap_ar := { first := (4, 0), steps := [.row 4 0 10], last := (4, 10) }
      bp_bq := { first := (11, 0), steps := [.row 11 0 7, .flip 11 7, .row 7 11 6, .flip 7 6, .row 6 7 11, .flip 6 11], last := (11, 6) }
      bp_br := { first := (11, 0), steps := [.row 11 0 10], last := (11, 10) } } }

/-- Journal iteration 743; certificate 03420e6c5d6bd61f5f85bf06c433e03574c6f568a964370be52e246404620893. -/
def record29 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 1, support := {6, 8} },
      { center := 3, support := {1, 6, 11} },
      { center := 6, support := {1, 8} },
      { center := 8, support := {6, 11} }
    ]
    data := {
      p := 1
      q := 6
      r := 11
      a := 3
      b := 8
      ap_aq := { first := (3, 1), steps := [.row 3 1 6], last := (3, 6) }
      ap_ar := { first := (3, 1), steps := [.row 3 1 11], last := (3, 11) }
      bp_bq := { first := (8, 1), steps := [.flip 8 1, .row 1 8 6, .flip 1 6, .row 6 1 8, .flip 6 8], last := (8, 6) }
      bp_br := { first := (8, 1), steps := [.flip 8 1, .row 1 8 6, .flip 1 6, .row 6 1 8, .flip 6 8, .row 8 6 11], last := (8, 11) } } }

/-- Journal iteration 744; certificate 2acc5bd797683ecbd7428c9717b58080622117371d20f40369983a41b1a1d286. -/
def record30 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 2, support := {9, 10, 11} },
      { center := 6, support := {7, 9, 10} },
      { center := 7, support := {6, 11} },
      { center := 11, support := {6, 7} }
    ]
    data := {
      p := 9
      q := 10
      r := 11
      a := 2
      b := 6
      ap_aq := { first := (2, 9), steps := [.row 2 9 10], last := (2, 10) }
      ap_ar := { first := (2, 9), steps := [.row 2 9 11], last := (2, 11) }
      bp_bq := { first := (6, 9), steps := [.row 6 9 10], last := (6, 10) }
      bp_br := { first := (6, 9), steps := [.row 6 9 7, .flip 6 7, .row 7 6 11, .flip 7 11, .row 11 7 6, .flip 11 6], last := (6, 11) } } }

/-- Journal iteration 745; certificate 11b328d3cb96e70463fd45cb78d611ddaa834da46ac1740f2a98f824a2fcd8da. -/
def record31 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {4, 11} },
      { center := 1, support := {0, 2, 6} },
      { center := 2, support := {10, 11} },
      { center := 4, support := {0, 10} },
      { center := 10, support := {2, 4} },
      { center := 11, support := {2, 6} }
    ]
    data := {
      p := 0
      q := 2
      r := 6
      a := 1
      b := 11
      ap_aq := { first := (1, 0), steps := [.row 1 0 2], last := (1, 2) }
      ap_ar := { first := (1, 0), steps := [.row 1 0 6], last := (1, 6) }
      bp_bq := { first := (11, 0), steps := [.flip 11 0, .row 0 11 4, .flip 0 4, .row 4 0 10, .flip 4 10, .row 10 4 2, .flip 10 2, .row 2 10 11, .flip 2 11], last := (11, 2) }
      bp_br := { first := (11, 0), steps := [.flip 11 0, .row 0 11 4, .flip 0 4, .row 4 0 10, .flip 4 10, .row 10 4 2, .flip 10 2, .row 2 10 11, .flip 2 11, .row 11 2 6], last := (11, 6) } } }

/-- Journal iteration 746; certificate 9f11d243cd2508ac66206616676e459087494abb0dc0a0e68aff586b4631b016. -/
def record32 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {4, 5} },
      { center := 4, support := {1, 5} },
      { center := 5, support := {0, 4} },
      { center := 11, support := {0, 1, 5} }
    ]
    data := {
      p := 0
      q := 1
      r := 5
      a := 4
      b := 11
      ap_aq := { first := (4, 0), steps := [.flip 4 0, .row 0 4 5, .flip 0 5, .row 5 0 4, .flip 5 4, .row 4 5 1], last := (4, 1) }
      ap_ar := { first := (4, 0), steps := [.flip 4 0, .row 0 4 5, .flip 0 5, .row 5 0 4, .flip 5 4], last := (4, 5) }
      bp_bq := { first := (11, 0), steps := [.row 11 0 1], last := (11, 1) }
      bp_br := { first := (11, 0), steps := [.row 11 0 5], last := (11, 5) } } }

/-- Journal iteration 748; certificate f3c5708cd199e97ac011e7d91d97bdf9a9a4c83a2d83543cb6e66b5c7d020d73. -/
def record33 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 2, support := {3, 8, 10} },
      { center := 3, support := {7, 10} },
      { center := 7, support := {3, 8} },
      { center := 10, support := {3, 7} }
    ]
    data := {
      p := 3
      q := 8
      r := 10
      a := 2
      b := 7
      ap_aq := { first := (2, 3), steps := [.row 2 3 8], last := (2, 8) }
      ap_ar := { first := (2, 3), steps := [.row 2 3 10], last := (2, 10) }
      bp_bq := { first := (7, 3), steps := [.row 7 3 8], last := (7, 8) }
      bp_br := { first := (7, 3), steps := [.flip 7 3, .row 3 7 10, .flip 3 10, .row 10 3 7, .flip 10 7], last := (7, 10) } } }

/-- Journal iteration 749; certificate 570581bfce172fdaa749dbc4e4420e538731d4eb98014da9a4ed517f2a2e7a39. -/
def record34 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {4, 11} },
      { center := 3, support := {4, 7} },
      { center := 4, support := {0, 3, 6} },
      { center := 6, support := {0, 2, 7} },
      { center := 7, support := {3, 6, 11} },
      { center := 11, support := {2, 4, 7} }
    ]
    data := {
      p := 0
      q := 2
      r := 4
      a := 6
      b := 11
      ap_aq := { first := (6, 0), steps := [.row 6 0 2], last := (6, 2) }
      ap_ar := { first := (6, 0), steps := [.row 6 0 7, .flip 6 7, .row 7 6 3, .flip 7 3, .row 3 7 4, .flip 3 4, .row 4 3 6, .flip 4 6], last := (6, 4) }
      bp_bq := { first := (11, 0), steps := [.flip 11 0, .row 0 11 4, .flip 0 4, .row 4 0 3, .flip 4 3, .row 3 4 7, .flip 3 7, .row 7 3 11, .flip 7 11, .row 11 7 2], last := (11, 2) }
      bp_br := { first := (11, 0), steps := [.flip 11 0, .row 0 11 4, .flip 0 4, .row 4 0 3, .flip 4 3, .row 3 4 7, .flip 3 7, .row 7 3 11, .flip 7 11, .row 11 7 4], last := (11, 4) } } }

/-- Journal iteration 750; certificate ddddaa89bb51745d483e8a0da867161741b8edec40723da0c96ccc0783cdb1da. -/
def record35 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 1, support := {0, 2, 8} },
      { center := 6, support := {0, 2, 7} },
      { center := 7, support := {6, 11} },
      { center := 8, support := {6, 11} },
      { center := 11, support := {7, 8} }
    ]
    data := {
      p := 0
      q := 2
      r := 8
      a := 1
      b := 6
      ap_aq := { first := (1, 0), steps := [.row 1 0 2], last := (1, 2) }
      ap_ar := { first := (1, 0), steps := [.row 1 0 8], last := (1, 8) }
      bp_bq := { first := (6, 0), steps := [.row 6 0 2], last := (6, 2) }
      bp_br := { first := (6, 0), steps := [.row 6 0 7, .flip 6 7, .row 7 6 11, .flip 7 11, .row 11 7 8, .flip 11 8, .row 8 11 6, .flip 8 6], last := (6, 8) } } }

/-- Journal iteration 751; certificate cc1e10d8553aa79d74b9f7f08c6466cf01ab275ef005bba8ebfbfcee535496bd. -/
def record36 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 1, support := {6, 8} },
      { center := 3, support := {1, 7, 8} },
      { center := 7, support := {3, 6} },
      { center := 8, support := {1, 3, 6} }
    ]
    data := {
      p := 1
      q := 7
      r := 8
      a := 3
      b := 6
      ap_aq := { first := (3, 1), steps := [.row 3 1 7], last := (3, 7) }
      ap_ar := { first := (3, 1), steps := [.row 3 1 8], last := (3, 8) }
      bp_bq := { first := (6, 1), steps := [.flip 6 1, .row 1 6 8, .flip 1 8, .row 8 1 3, .flip 8 3, .row 3 8 7, .flip 3 7, .row 7 3 6, .flip 7 6], last := (6, 7) }
      bp_br := { first := (6, 1), steps := [.flip 6 1, .row 1 6 8, .flip 1 8, .row 8 1 6, .flip 8 6], last := (6, 8) } } }

/-- Journal iteration 752; certificate 7bf78158d52aecf11583b06a8dbb2dd7b412808718c076d906894ccedd6841c6. -/
def record37 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {3, 4} },
      { center := 3, support := {0, 4} },
      { center := 4, support := {1, 3, 8} },
      { center := 10, support := {0, 1, 8} }
    ]
    data := {
      p := 0
      q := 1
      r := 8
      a := 4
      b := 10
      ap_aq := { first := (4, 0), steps := [.flip 4 0, .row 0 4 3, .flip 0 3, .row 3 0 4, .flip 3 4, .row 4 3 1], last := (4, 1) }
      ap_ar := { first := (4, 0), steps := [.flip 4 0, .row 0 4 3, .flip 0 3, .row 3 0 4, .flip 3 4, .row 4 3 8], last := (4, 8) }
      bp_bq := { first := (10, 0), steps := [.row 10 0 1], last := (10, 1) }
      bp_br := { first := (10, 0), steps := [.row 10 0 8], last := (10, 8) } } }

/-- Journal iteration 753; certificate c41753e5edbbd9a8ba66470d629f673576c165de4d2d1bbcfa60b183009f668a. -/
def record38 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {1, 9} },
      { center := 1, support := {0, 2} },
      { center := 2, support := {10, 11} },
      { center := 5, support := {0, 2, 10} },
      { center := 9, support := {0, 11} },
      { center := 10, support := {1, 2} },
      { center := 11, support := {2, 9} }
    ]
    data := {
      p := 0
      q := 2
      r := 10
      a := 1
      b := 5
      ap_aq := { first := (1, 0), steps := [.row 1 0 2], last := (1, 2) }
      ap_ar := { first := (1, 0), steps := [.flip 1 0, .row 0 1 9, .flip 0 9, .row 9 0 11, .flip 9 11, .row 11 9 2, .flip 11 2, .row 2 11 10, .flip 2 10, .row 10 2 1, .flip 10 1], last := (1, 10) }
      bp_bq := { first := (5, 0), steps := [.row 5 0 2], last := (5, 2) }
      bp_br := { first := (5, 0), steps := [.row 5 0 10], last := (5, 10) } } }

/-- Journal iteration 754; certificate b4817e247e43bee608cb6d63c9d567b59bf1a34c9854f7920feb2faae070cc4d. -/
def record39 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {1, 9} },
      { center := 1, support := {0, 6} },
      { center := 6, support := {0, 1} },
      { center := 8, support := {6, 9} },
      { center := 9, support := {0, 1, 8} }
    ]
    data := {
      p := 0
      q := 1
      r := 8
      a := 6
      b := 9
      ap_aq := { first := (6, 0), steps := [.row 6 0 1], last := (6, 1) }
      ap_ar := { first := (6, 0), steps := [.row 6 0 1, .flip 6 1, .row 1 6 0, .flip 1 0, .row 0 1 9, .flip 0 9, .row 9 0 8, .flip 9 8, .row 8 9 6, .flip 8 6], last := (6, 8) }
      bp_bq := { first := (9, 0), steps := [.row 9 0 1], last := (9, 1) }
      bp_br := { first := (9, 0), steps := [.row 9 0 8], last := (9, 8) } } }

/-- Journal iteration 755; certificate b2bac281900fc92eac1df029b03ad011b1e7b0f7730f16c724cef09c13a5fe73. -/
def record40 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {1, 3} },
      { center := 1, support := {0, 6} },
      { center := 3, support := {0, 1} },
      { center := 6, support := {0, 1, 7} },
      { center := 7, support := {3, 6} }
    ]
    data := {
      p := 0
      q := 1
      r := 7
      a := 3
      b := 6
      ap_aq := { first := (3, 0), steps := [.row 3 0 1], last := (3, 1) }
      ap_ar := { first := (3, 0), steps := [.flip 3 0, .row 0 3 1, .flip 0 1, .row 1 0 6, .flip 1 6, .row 6 1 7, .flip 6 7, .row 7 6 3, .flip 7 3], last := (3, 7) }
      bp_bq := { first := (6, 0), steps := [.row 6 0 1], last := (6, 1) }
      bp_br := { first := (6, 0), steps := [.row 6 0 7], last := (6, 7) } } }

/-- Journal iteration 756; certificate f88d8013a204f49bcd8db7373fd0c819667792d109ead589ee78d80887255256. -/
def record41 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {1, 6} },
      { center := 1, support := {0, 6} },
      { center := 6, support := {1, 4, 9} },
      { center := 10, support := {0, 4, 9} }
    ]
    data := {
      p := 0
      q := 4
      r := 9
      a := 6
      b := 10
      ap_aq := { first := (6, 0), steps := [.flip 6 0, .row 0 6 1, .flip 0 1, .row 1 0 6, .flip 1 6, .row 6 1 4], last := (6, 4) }
      ap_ar := { first := (6, 0), steps := [.flip 6 0, .row 0 6 1, .flip 0 1, .row 1 0 6, .flip 1 6, .row 6 1 9], last := (6, 9) }
      bp_bq := { first := (10, 0), steps := [.row 10 0 4], last := (10, 4) }
      bp_br := { first := (10, 0), steps := [.row 10 0 9], last := (10, 9) } } }

/-- Journal iteration 757; certificate 91b82c38a3ffbb483592d32f32ed65eee92b7706c12d41a5ace0f0fa26e18d3a. -/
def record42 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {5, 6} },
      { center := 5, support := {1, 6, 10} },
      { center := 6, support := {0, 5} },
      { center := 9, support := {0, 1, 10} }
    ]
    data := {
      p := 0
      q := 1
      r := 10
      a := 5
      b := 9
      ap_aq := { first := (5, 0), steps := [.flip 5 0, .row 0 5 6, .flip 0 6, .row 6 0 5, .flip 6 5, .row 5 6 1], last := (5, 1) }
      ap_ar := { first := (5, 0), steps := [.flip 5 0, .row 0 5 6, .flip 0 6, .row 6 0 5, .flip 6 5, .row 5 6 10], last := (5, 10) }
      bp_bq := { first := (9, 0), steps := [.row 9 0 1], last := (9, 1) }
      bp_br := { first := (9, 0), steps := [.row 9 0 10], last := (9, 10) } } }

/-- Journal iteration 758; certificate f50adedc59e112799e61435743492f8cd0dc643b87a5a9d19d185d40aee2c5c9. -/
def record43 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {1, 4} },
      { center := 1, support := {0, 2} },
      { center := 2, support := {0, 1} },
      { center := 4, support := {0, 1, 5} },
      { center := 5, support := {2, 4} }
    ]
    data := {
      p := 0
      q := 1
      r := 5
      a := 2
      b := 4
      ap_aq := { first := (2, 0), steps := [.row 2 0 1], last := (2, 1) }
      ap_ar := { first := (2, 0), steps := [.row 2 0 1, .flip 2 1, .row 1 2 0, .flip 1 0, .row 0 1 4, .flip 0 4, .row 4 0 5, .flip 4 5, .row 5 4 2, .flip 5 2], last := (2, 5) }
      bp_bq := { first := (4, 0), steps := [.row 4 0 1], last := (4, 1) }
      bp_br := { first := (4, 0), steps := [.row 4 0 5], last := (4, 5) } } }

/-- Journal iteration 759; certificate 6e172866337ea775115967e0093ae4012d6cd05447cf2d4946bd4dc5e2069dba. -/
def record44 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {5, 6, 11} },
      { center := 1, support := {2, 6} },
      { center := 2, support := {1, 10} },
      { center := 3, support := {5, 10} },
      { center := 5, support := {2, 3, 11} },
      { center := 6, support := {0, 1} },
      { center := 10, support := {0, 2} },
      { center := 11, support := {0, 5} }
    ]
    data := {
      p := 0
      q := 2
      r := 3
      a := 5
      b := 10
      ap_aq := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 5, .flip 11 5, .row 5 11 2], last := (5, 2) }
      ap_ar := { first := (5, 0), steps := [.flip 5 0, .row 0 5 11, .flip 0 11, .row 11 0 5, .flip 11 5, .row 5 11 3], last := (5, 3) }
      bp_bq := { first := (10, 0), steps := [.row 10 0 2], last := (10, 2) }
      bp_br := { first := (10, 0), steps := [.row 10 0 2, .flip 10 2, .row 2 10 1, .flip 2 1, .row 1 2 6, .flip 1 6, .row 6 1 0, .flip 6 0, .row 0 6 11, .flip 0 11, .row 11 0 5, .flip 11 5, .row 5 11 3, .flip 5 3, .row 3 5 10, .flip 3 10], last := (10, 3) } } }

/-- Journal iteration 760; certificate 907df4360f958a9258d5a11867f589e8647c858a515538479a18d63416c89192. -/
def record45 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 4, support := {0, 1, 5} },
      { center := 5, support := {0, 1, 4, 9} },
      { center := 9, support := {4, 5} }
    ]
    data := {
      p := 0
      q := 1
      r := 9
      a := 4
      b := 5
      ap_aq := { first := (4, 0), steps := [.row 4 0 1], last := (4, 1) }
      ap_ar := { first := (4, 0), steps := [.row 4 0 5, .flip 4 5, .row 5 4 9, .flip 5 9, .row 9 5 4, .flip 9 4], last := (4, 9) }
      bp_bq := { first := (5, 0), steps := [.row 5 0 1], last := (5, 1) }
      bp_br := { first := (5, 0), steps := [.row 5 0 9], last := (5, 9) } } }

/-- Journal iteration 761; certificate e1dc910f252fe3ebb60dfa847476c7094488686de8306c6854c4dc1b308efc90. -/
def record46 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 1, support := {2, 8} },
      { center := 2, support := {1, 10} },
      { center := 3, support := {8, 10} },
      { center := 6, support := {0, 2, 3} },
      { center := 8, support := {1, 3} },
      { center := 10, support := {0, 3} }
    ]
    data := {
      p := 0
      q := 2
      r := 3
      a := 6
      b := 10
      ap_aq := { first := (6, 0), steps := [.row 6 0 2], last := (6, 2) }
      ap_ar := { first := (6, 0), steps := [.row 6 0 3], last := (6, 3) }
      bp_bq := { first := (10, 0), steps := [.row 10 0 3, .flip 10 3, .row 3 10 8, .flip 3 8, .row 8 3 1, .flip 8 1, .row 1 8 2, .flip 1 2, .row 2 1 10, .flip 2 10], last := (10, 2) }
      bp_br := { first := (10, 0), steps := [.row 10 0 3], last := (10, 3) } } }

/-- Journal iteration 762; certificate 8e3d6fb225bcee3079fd403e6783c77202c40ccc1a3d884a138a1949ccd068eb. -/
def record47 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 1, support := {0, 2, 8} },
      { center := 2, support := {1, 11} },
      { center := 3, support := {0, 8, 11} },
      { center := 11, support := {1, 2} }
    ]
    data := {
      p := 0
      q := 8
      r := 11
      a := 1
      b := 3
      ap_aq := { first := (1, 0), steps := [.row 1 0 8], last := (1, 8) }
      ap_ar := { first := (1, 0), steps := [.row 1 0 2, .flip 1 2, .row 2 1 11, .flip 2 11, .row 11 2 1, .flip 11 1], last := (1, 11) }
      bp_bq := { first := (3, 0), steps := [.row 3 0 8], last := (3, 8) }
      bp_br := { first := (3, 0), steps := [.row 3 0 11], last := (3, 11) } } }

/-- Journal iteration 763; certificate 8aeb86d2298dad9694a69dae558b2258aa5c787870c3be059dcdd5b1a241c926. -/
def record48 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 1, support := {0, 2, 8} },
      { center := 3, support := {1, 8} },
      { center := 8, support := {1, 3} },
      { center := 11, support := {0, 2, 3} }
    ]
    data := {
      p := 0
      q := 2
      r := 3
      a := 1
      b := 11
      ap_aq := { first := (1, 0), steps := [.row 1 0 2], last := (1, 2) }
      ap_ar := { first := (1, 0), steps := [.row 1 0 8, .flip 1 8, .row 8 1 3, .flip 8 3, .row 3 8 1, .flip 3 1], last := (1, 3) }
      bp_bq := { first := (11, 0), steps := [.row 11 0 2], last := (11, 2) }
      bp_br := { first := (11, 0), steps := [.row 11 0 3], last := (11, 3) } } }

/-- Journal iteration 766; certificate edea4d0d424e6ba842d21b164a134145e60fd164089e5da0ab47f75a6e1bfe0c. -/
def record49 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 1, support := {6, 8} },
      { center := 5, support := {0, 1, 4} },
      { center := 6, support := {0, 4, 8} },
      { center := 8, support := {1, 6} }
    ]
    data := {
      p := 0
      q := 1
      r := 4
      a := 5
      b := 6
      ap_aq := { first := (5, 0), steps := [.row 5 0 1], last := (5, 1) }
      ap_ar := { first := (5, 0), steps := [.row 5 0 4], last := (5, 4) }
      bp_bq := { first := (6, 0), steps := [.row 6 0 8, .flip 6 8, .row 8 6 1, .flip 8 1, .row 1 8 6, .flip 1 6], last := (6, 1) }
      bp_br := { first := (6, 0), steps := [.row 6 0 4], last := (6, 4) } } }

def bank : List (DuplicateCenterNogood Label) :=
  [record25, record26, record27, record28, record29, record30, record31, record32, record33, record34, record35, record36, record37, record38, record39, record40, record41, record42, record43, record44, record45, record46, record47, record48, record49]

def bankCheck : Bool := bank.all fun nogood => nogood.check

theorem bankCheck_true : bankCheck = true := by
  native_decide

theorem bank_valid : ∀ nogood ∈ bank, nogood.check = true := by
  apply List.all_eq_true.mp
  simpa [bankCheck] using bankCheck_true

end Problem97.ATailFrontierLiveClosure.ExactTwelveDuplicateCenterMembershipPilotShards.Part_002
