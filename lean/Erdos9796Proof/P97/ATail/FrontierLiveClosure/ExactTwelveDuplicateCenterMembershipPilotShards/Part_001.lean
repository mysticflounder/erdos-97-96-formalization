/-
Generated membership-core shard from scratch/sidecar-sourcefaithful-common-missing-20260807-a7f3c1/ordered-cegar-jd0-v4/journal.jsonl
Journal SHA-256: 4d2ac12341f5981cf988c7add8b547e2840f26c2395161b124d73373124e8db3
Global record interval: 0..24

This file checks record validity only.  It is not a coverage or UNSAT proof.
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.GenericRowNogoodCertificate

namespace Problem97.ATailFrontierLiveClosure.ExactTwelveDuplicateCenterMembershipPilotShards.Part_001

open Problem97.Census554.EqualityCore
open Problem97.ATailFrontierLiveClosure.GenericRowNogoodCertificate
open scoped EuclideanGeometry

abbrev Label := Fin 12

/-- Journal iteration 708; certificate 174b8cdef143ac9bcd7096d498258bf936b2e1e4a4af57f5ee532a6e9a366f90. -/
def record0 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {4, 5} },
      { center := 4, support := {1, 5} },
      { center := 5, support := {0, 1, 4, 9} },
      { center := 9, support := {4, 5} }
    ]
    data := {
      p := 0
      q := 1
      r := 9
      a := 4
      b := 5
      ap_aq := { first := (4, 0), steps := [.flip 4 0, .row 0 4 5, .flip 0 5, .row 5 0 4, .flip 5 4, .row 4 5 1], last := (4, 1) }
      ap_ar := { first := (4, 0), steps := [.flip 4 0, .row 0 4 5, .flip 0 5, .row 5 0 9, .flip 5 9, .row 9 5 4, .flip 9 4], last := (4, 9) }
      bp_bq := { first := (5, 0), steps := [.row 5 0 1], last := (5, 1) }
      bp_br := { first := (5, 0), steps := [.row 5 0 9], last := (5, 9) } } }

/-- Journal iteration 709; certificate 01f2c51ec6854dfffca0570128bed9aa052337cfc20452166eb5a63b44211a09. -/
def record1 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {5, 10} },
      { center := 2, support := {0, 1, 10} },
      { center := 5, support := {0, 1} },
      { center := 10, support := {0, 5} }
    ]
    data := {
      p := 0
      q := 1
      r := 10
      a := 2
      b := 5
      ap_aq := { first := (2, 0), steps := [.row 2 0 1], last := (2, 1) }
      ap_ar := { first := (2, 0), steps := [.row 2 0 10], last := (2, 10) }
      bp_bq := { first := (5, 0), steps := [.row 5 0 1], last := (5, 1) }
      bp_br := { first := (5, 0), steps := [.flip 5 0, .row 0 5 10, .flip 0 10, .row 10 0 5, .flip 10 5], last := (5, 10) } } }

/-- Journal iteration 710; certificate 311f6d5a38b3e14ea5bc7ae21d1cb5dcbf60072fe3a3acec2474903b54af87cf. -/
def record2 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {3, 11} },
      { center := 1, support := {0, 2, 8} },
      { center := 3, support := {2, 8} },
      { center := 5, support := {10, 11} },
      { center := 8, support := {3, 9} },
      { center := 9, support := {8, 10} },
      { center := 10, support := {5, 9} },
      { center := 11, support := {0, 5} }
    ]
    data := {
      p := 0
      q := 2
      r := 8
      a := 1
      b := 3
      ap_aq := { first := (1, 0), steps := [.row 1 0 2], last := (1, 2) }
      ap_ar := { first := (1, 0), steps := [.row 1 0 8], last := (1, 8) }
      bp_bq := { first := (3, 0), steps := [.flip 3 0, .row 0 3 11, .flip 0 11, .row 11 0 5, .flip 11 5, .row 5 11 10, .flip 5 10, .row 10 5 9, .flip 10 9, .row 9 10 8, .flip 9 8, .row 8 9 3, .flip 8 3, .row 3 8 2], last := (3, 2) }
      bp_br := { first := (3, 0), steps := [.flip 3 0, .row 0 3 11, .flip 0 11, .row 11 0 5, .flip 11 5, .row 5 11 10, .flip 5 10, .row 10 5 9, .flip 10 9, .row 9 10 8, .flip 9 8, .row 8 9 3, .flip 8 3], last := (3, 8) } } }

/-- Journal iteration 713; certificate b2495c98f6f8b91dbb15a41c7e779fc2c475cbe8641b66473dd9d99bef69ff9c. -/
def record3 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {4, 8} },
      { center := 4, support := {0, 7, 11} },
      { center := 7, support := {8, 11} },
      { center := 11, support := {4, 7, 8} }
    ]
    data := {
      p := 0
      q := 7
      r := 11
      a := 4
      b := 8
      ap_aq := { first := (4, 0), steps := [.row 4 0 7], last := (4, 7) }
      ap_ar := { first := (4, 0), steps := [.row 4 0 11], last := (4, 11) }
      bp_bq := { first := (8, 0), steps := [.flip 8 0, .row 0 8 4, .flip 0 4, .row 4 0 11, .flip 4 11, .row 11 4 7, .flip 11 7, .row 7 11 8, .flip 7 8], last := (8, 7) }
      bp_br := { first := (8, 0), steps := [.flip 8 0, .row 0 8 4, .flip 0 4, .row 4 0 11, .flip 4 11, .row 11 4 8, .flip 11 8], last := (8, 11) } } }

/-- Journal iteration 714; certificate b8b2c7738284930c47408c963474522b5c6a14184d85f570b689995ea8a0a8c6. -/
def record4 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 3, support := {5, 6} },
      { center := 5, support := {2, 3} },
      { center := 6, support := {2, 3, 7} },
      { center := 7, support := {5, 6} }
    ]
    data := {
      p := 2
      q := 3
      r := 7
      a := 5
      b := 6
      ap_aq := { first := (5, 2), steps := [.row 5 2 3], last := (5, 3) }
      ap_ar := { first := (5, 2), steps := [.row 5 2 3, .flip 5 3, .row 3 5 6, .flip 3 6, .row 6 3 7, .flip 6 7, .row 7 6 5, .flip 7 5], last := (5, 7) }
      bp_bq := { first := (6, 2), steps := [.row 6 2 3], last := (6, 3) }
      bp_br := { first := (6, 2), steps := [.row 6 2 7], last := (6, 7) } } }

/-- Journal iteration 715; certificate 75b4a162ca9de2c3cf361069d90bce9a0d550e208e5a72c23b3ac679baefe069. -/
def record5 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {3, 5, 8} },
      { center := 3, support := {0, 1, 8} },
      { center := 4, support := {5, 6} },
      { center := 5, support := {0, 4} },
      { center := 6, support := {3, 4} },
      { center := 8, support := {1, 3, 6} }
    ]
    data := {
      p := 0
      q := 1
      r := 6
      a := 3
      b := 8
      ap_aq := { first := (3, 0), steps := [.row 3 0 1], last := (3, 1) }
      ap_ar := { first := (3, 0), steps := [.flip 3 0, .row 0 3 5, .flip 0 5, .row 5 0 4, .flip 5 4, .row 4 5 6, .flip 4 6, .row 6 4 3, .flip 6 3], last := (3, 6) }
      bp_bq := { first := (8, 0), steps := [.flip 8 0, .row 0 8 3, .flip 0 3, .row 3 0 8, .flip 3 8, .row 8 3 1], last := (8, 1) }
      bp_br := { first := (8, 0), steps := [.flip 8 0, .row 0 8 3, .flip 0 3, .row 3 0 8, .flip 3 8, .row 8 3 6], last := (8, 6) } } }

/-- Journal iteration 716; certificate 9fe7a78784041738db44d7283a7efcc4cc830e0904e225a5a76565b18fffe609. -/
def record6 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {3, 9} },
      { center := 3, support := {0, 1} },
      { center := 5, support := {0, 1, 9} },
      { center := 9, support := {0, 3} }
    ]
    data := {
      p := 0
      q := 1
      r := 9
      a := 3
      b := 5
      ap_aq := { first := (3, 0), steps := [.row 3 0 1], last := (3, 1) }
      ap_ar := { first := (3, 0), steps := [.flip 3 0, .row 0 3 9, .flip 0 9, .row 9 0 3, .flip 9 3], last := (3, 9) }
      bp_bq := { first := (5, 0), steps := [.row 5 0 1], last := (5, 1) }
      bp_br := { first := (5, 0), steps := [.row 5 0 9], last := (5, 9) } } }

/-- Journal iteration 717; certificate 761476bdc499adde2132e3891aa38e43babb4ef874f1ece2c69a552b6974d62a. -/
def record7 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 1, support := {0, 2, 6} },
      { center := 6, support := {1, 10} },
      { center := 9, support := {0, 2, 10} },
      { center := 10, support := {1, 6} }
    ]
    data := {
      p := 0
      q := 2
      r := 10
      a := 1
      b := 9
      ap_aq := { first := (1, 0), steps := [.row 1 0 2], last := (1, 2) }
      ap_ar := { first := (1, 0), steps := [.row 1 0 6, .flip 1 6, .row 6 1 10, .flip 6 10, .row 10 6 1, .flip 10 1], last := (1, 10) }
      bp_bq := { first := (9, 0), steps := [.row 9 0 2], last := (9, 2) }
      bp_br := { first := (9, 0), steps := [.row 9 0 10], last := (9, 10) } } }

/-- Journal iteration 718; certificate 38f91fc495bbf2697345722d3604b763fb7af0215f56dfabc1caa55c0ca73190. -/
def record8 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 5, support := {7, 9} },
      { center := 6, support := {0, 7, 10} },
      { center := 7, support := {5, 11} },
      { center := 9, support := {5, 11} },
      { center := 11, support := {0, 9, 10} }
    ]
    data := {
      p := 0
      q := 7
      r := 10
      a := 6
      b := 11
      ap_aq := { first := (6, 0), steps := [.row 6 0 7], last := (6, 7) }
      ap_ar := { first := (6, 0), steps := [.row 6 0 10], last := (6, 10) }
      bp_bq := { first := (11, 0), steps := [.row 11 0 9, .flip 11 9, .row 9 11 5, .flip 9 5, .row 5 9 7, .flip 5 7, .row 7 5 11, .flip 7 11], last := (11, 7) }
      bp_br := { first := (11, 0), steps := [.row 11 0 10], last := (11, 10) } } }

/-- Journal iteration 719; certificate 7093b9a50818d7935e2d2b7f1a2d9df84eb7ed3632aed69cfbc70efdf23f75b7. -/
def record9 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {3, 4} },
      { center := 1, support := {0, 6, 8} },
      { center := 3, support := {0, 8} },
      { center := 4, support := {0, 1} },
      { center := 8, support := {1, 3} },
      { center := 10, support := {0, 4, 6} }
    ]
    data := {
      p := 0
      q := 4
      r := 6
      a := 1
      b := 10
      ap_aq := { first := (1, 0), steps := [.row 1 0 8, .flip 1 8, .row 8 1 3, .flip 8 3, .row 3 8 0, .flip 3 0, .row 0 3 4, .flip 0 4, .row 4 0 1, .flip 4 1], last := (1, 4) }
      ap_ar := { first := (1, 0), steps := [.row 1 0 6], last := (1, 6) }
      bp_bq := { first := (10, 0), steps := [.row 10 0 4], last := (10, 4) }
      bp_br := { first := (10, 0), steps := [.row 10 0 6], last := (10, 6) } } }

/-- Journal iteration 720; certificate 3fa3bfa5c1fd17f585f1eecedab3793bea1f2e2adef9e1b293eaa977bc050491. -/
def record10 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {3, 5} },
      { center := 3, support := {0, 5} },
      { center := 5, support := {0, 4} },
      { center := 10, support := {0, 3, 4} }
    ]
    data := {
      p := 0
      q := 3
      r := 4
      a := 5
      b := 10
      ap_aq := { first := (5, 0), steps := [.flip 5 0, .row 0 5 3, .flip 0 3, .row 3 0 5, .flip 3 5], last := (5, 3) }
      ap_ar := { first := (5, 0), steps := [.row 5 0 4], last := (5, 4) }
      bp_bq := { first := (10, 0), steps := [.row 10 0 3], last := (10, 3) }
      bp_br := { first := (10, 0), steps := [.row 10 0 4], last := (10, 4) } } }

/-- Journal iteration 722; certificate 539466efe24c70293e5bbd45ce4e130e4bdb38dadd99d5ab263225391bca4496. -/
def record11 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 1, support := {0, 2, 8} },
      { center := 6, support := {0, 2, 7} },
      { center := 7, support := {6, 10} },
      { center := 8, support := {6, 10} },
      { center := 10, support := {7, 8} }
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
      bp_br := { first := (6, 0), steps := [.row 6 0 7, .flip 6 7, .row 7 6 10, .flip 7 10, .row 10 7 8, .flip 10 8, .row 8 10 6, .flip 8 6], last := (6, 8) } } }

/-- Journal iteration 723; certificate 24292779da4c04fa8a205ed31cfbf9347fc6c14e6a43ab5ed477553ee7efa93c. -/
def record12 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 2, support := {3, 10} },
      { center := 3, support := {0, 10} },
      { center := 4, support := {0, 2, 10} },
      { center := 10, support := {2, 3} }
    ]
    data := {
      p := 0
      q := 2
      r := 10
      a := 3
      b := 4
      ap_aq := { first := (3, 0), steps := [.row 3 0 10, .flip 3 10, .row 10 3 2, .flip 10 2, .row 2 10 3, .flip 2 3], last := (3, 2) }
      ap_ar := { first := (3, 0), steps := [.row 3 0 10], last := (3, 10) }
      bp_bq := { first := (4, 0), steps := [.row 4 0 2], last := (4, 2) }
      bp_br := { first := (4, 0), steps := [.row 4 0 10], last := (4, 10) } } }

/-- Journal iteration 724; certificate 02e04fede94cb035769953d1a7f9a12999ebbe2c2ca76deb8988adcae1428970. -/
def record13 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {4, 11} },
      { center := 2, support := {3, 10, 11} },
      { center := 3, support := {0, 10} },
      { center := 4, support := {0, 3, 11} },
      { center := 10, support := {2, 3} },
      { center := 11, support := {2, 4} }
    ]
    data := {
      p := 0
      q := 2
      r := 4
      a := 3
      b := 11
      ap_aq := { first := (3, 0), steps := [.row 3 0 10, .flip 3 10, .row 10 3 2, .flip 10 2, .row 2 10 3, .flip 2 3], last := (3, 2) }
      ap_ar := { first := (3, 0), steps := [.row 3 0 10, .flip 3 10, .row 10 3 2, .flip 10 2, .row 2 10 11, .flip 2 11, .row 11 2 4, .flip 11 4, .row 4 11 3, .flip 4 3], last := (3, 4) }
      bp_bq := { first := (11, 0), steps := [.flip 11 0, .row 0 11 4, .flip 0 4, .row 4 0 11, .flip 4 11, .row 11 4 2], last := (11, 2) }
      bp_br := { first := (11, 0), steps := [.flip 11 0, .row 0 11 4, .flip 0 4, .row 4 0 11, .flip 4 11], last := (11, 4) } } }

/-- Journal iteration 725; certificate 6d635c1edfe2e7f946f87ad9370e72e8fd7499dfc4b6b278389892dd80c0c7b8. -/
def record14 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {4, 9} },
      { center := 4, support := {0, 1} },
      { center := 5, support := {0, 1, 9} },
      { center := 9, support := {0, 4} }
    ]
    data := {
      p := 0
      q := 1
      r := 9
      a := 4
      b := 5
      ap_aq := { first := (4, 0), steps := [.row 4 0 1], last := (4, 1) }
      ap_ar := { first := (4, 0), steps := [.flip 4 0, .row 0 4 9, .flip 0 9, .row 9 0 4, .flip 9 4], last := (4, 9) }
      bp_bq := { first := (5, 0), steps := [.row 5 0 1], last := (5, 1) }
      bp_br := { first := (5, 0), steps := [.row 5 0 9], last := (5, 9) } } }

/-- Journal iteration 727; certificate e8c48c37c13890f32750322381b256108d64ba8d58dfed59edadf3bc7aee099a. -/
def record15 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 2, support := {10, 11} },
      { center := 7, support := {10, 11} },
      { center := 10, support := {0, 11} },
      { center := 11, support := {0, 2, 7, 10} }
    ]
    data := {
      p := 0
      q := 2
      r := 7
      a := 10
      b := 11
      ap_aq := { first := (10, 0), steps := [.row 10 0 11, .flip 10 11, .row 11 10 2, .flip 11 2, .row 2 11 10, .flip 2 10], last := (10, 2) }
      ap_ar := { first := (10, 0), steps := [.row 10 0 11, .flip 10 11, .row 11 10 7, .flip 11 7, .row 7 11 10, .flip 7 10], last := (10, 7) }
      bp_bq := { first := (11, 0), steps := [.row 11 0 2], last := (11, 2) }
      bp_br := { first := (11, 0), steps := [.row 11 0 7], last := (11, 7) } } }

/-- Journal iteration 728; certificate c88f9b15c9fa547c709c04b227b22eabd9ac96a36efc255baeafe71a0cd8a20e. -/
def record16 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 2, support := {10, 11} },
      { center := 10, support := {0, 7, 11} },
      { center := 11, support := {0, 2, 7, 10} }
    ]
    data := {
      p := 0
      q := 2
      r := 7
      a := 10
      b := 11
      ap_aq := { first := (10, 0), steps := [.row 10 0 11, .flip 10 11, .row 11 10 2, .flip 11 2, .row 2 11 10, .flip 2 10], last := (10, 2) }
      ap_ar := { first := (10, 0), steps := [.row 10 0 7], last := (10, 7) }
      bp_bq := { first := (11, 0), steps := [.row 11 0 2], last := (11, 2) }
      bp_br := { first := (11, 0), steps := [.row 11 0 7], last := (11, 7) } } }

/-- Journal iteration 729; certificate f6f826dc4cf4f35c07ffe05971e3786302a33555a8c74b379f4effe11a856500. -/
def record17 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {3, 4, 11} },
      { center := 2, support := {4, 11} },
      { center := 3, support := {0, 4} },
      { center := 4, support := {2, 3} },
      { center := 11, support := {0, 3} }
    ]
    data := {
      p := 0
      q := 2
      r := 3
      a := 4
      b := 11
      ap_aq := { first := (4, 0), steps := [.flip 4 0, .row 0 4 3, .flip 0 3, .row 3 0 4, .flip 3 4, .row 4 3 2], last := (4, 2) }
      ap_ar := { first := (4, 0), steps := [.flip 4 0, .row 0 4 3, .flip 0 3, .row 3 0 4, .flip 3 4], last := (4, 3) }
      bp_bq := { first := (11, 0), steps := [.flip 11 0, .row 0 11 3, .flip 0 3, .row 3 0 4, .flip 3 4, .row 4 3 2, .flip 4 2, .row 2 4 11, .flip 2 11], last := (11, 2) }
      bp_br := { first := (11, 0), steps := [.row 11 0 3], last := (11, 3) } } }

/-- Journal iteration 730; certificate 7b27c934f3c52361e8ed11c5c7fbcacf5c96647948bc4beab0c03d6ef817804f. -/
def record18 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {5, 11} },
      { center := 2, support := {4, 11} },
      { center := 4, support := {2, 11} },
      { center := 5, support := {0, 2, 4, 11} },
      { center := 11, support := {2, 5} }
    ]
    data := {
      p := 0
      q := 2
      r := 4
      a := 5
      b := 11
      ap_aq := { first := (5, 0), steps := [.row 5 0 2], last := (5, 2) }
      ap_ar := { first := (5, 0), steps := [.row 5 0 4], last := (5, 4) }
      bp_bq := { first := (11, 0), steps := [.flip 11 0, .row 0 11 5, .flip 0 5, .row 5 0 11, .flip 5 11, .row 11 5 2], last := (11, 2) }
      bp_br := { first := (11, 0), steps := [.flip 11 0, .row 0 11 5, .flip 0 5, .row 5 0 11, .flip 5 11, .row 11 5 2, .flip 11 2, .row 2 11 4, .flip 2 4, .row 4 2 11, .flip 4 11], last := (11, 4) } } }

/-- Journal iteration 731; certificate c3441c69573bdb1c743962277bbb14d055eb8402bbc33fa2e0e1f1e955f504da. -/
def record19 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {8, 10} },
      { center := 1, support := {2, 8} },
      { center := 2, support := {1, 10} },
      { center := 8, support := {1, 6} },
      { center := 9, support := {0, 1, 6} },
      { center := 10, support := {0, 2} }
    ]
    data := {
      p := 0
      q := 1
      r := 6
      a := 8
      b := 9
      ap_aq := { first := (8, 0), steps := [.flip 8 0, .row 0 8 10, .flip 0 10, .row 10 0 2, .flip 10 2, .row 2 10 1, .flip 2 1, .row 1 2 8, .flip 1 8], last := (8, 1) }
      ap_ar := { first := (8, 0), steps := [.flip 8 0, .row 0 8 10, .flip 0 10, .row 10 0 2, .flip 10 2, .row 2 10 1, .flip 2 1, .row 1 2 8, .flip 1 8, .row 8 1 6], last := (8, 6) }
      bp_bq := { first := (9, 0), steps := [.row 9 0 1], last := (9, 1) }
      bp_br := { first := (9, 0), steps := [.row 9 0 6], last := (9, 6) } } }

/-- Journal iteration 732; certificate 77efe6d5ce06930c92159403cee2192386872e60ed40eaffedf55be3dd3d6a22. -/
def record20 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {3, 10} },
      { center := 1, support := {2, 6, 8} },
      { center := 2, support := {1, 6, 10} },
      { center := 3, support := {0, 8} },
      { center := 6, support := {0, 2} },
      { center := 8, support := {1, 3} },
      { center := 10, support := {0, 1} }
    ]
    data := {
      p := 0
      q := 1
      r := 2
      a := 6
      b := 10
      ap_aq := { first := (6, 0), steps := [.row 6 0 2, .flip 6 2, .row 2 6 1, .flip 2 1, .row 1 2 6, .flip 1 6], last := (6, 1) }
      ap_ar := { first := (6, 0), steps := [.row 6 0 2], last := (6, 2) }
      bp_bq := { first := (10, 0), steps := [.row 10 0 1], last := (10, 1) }
      bp_br := { first := (10, 0), steps := [.flip 10 0, .row 0 10 3, .flip 0 3, .row 3 0 8, .flip 3 8, .row 8 3 1, .flip 8 1, .row 1 8 2, .flip 1 2, .row 2 1 10, .flip 2 10], last := (10, 2) } } }

/-- Journal iteration 733; certificate f79f7375fa029492ea4e1509074d97b72c9e1c4938fa479966b8f92803cb4cd8. -/
def record21 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {3, 11} },
      { center := 1, support := {2, 6, 8} },
      { center := 2, support := {1, 6, 11} },
      { center := 3, support := {0, 8} },
      { center := 6, support := {0, 2} },
      { center := 8, support := {1, 3} },
      { center := 11, support := {1, 2} }
    ]
    data := {
      p := 0
      q := 1
      r := 2
      a := 6
      b := 11
      ap_aq := { first := (6, 0), steps := [.row 6 0 2, .flip 6 2, .row 2 6 1, .flip 2 1, .row 1 2 6, .flip 1 6], last := (6, 1) }
      ap_ar := { first := (6, 0), steps := [.row 6 0 2], last := (6, 2) }
      bp_bq := { first := (11, 0), steps := [.flip 11 0, .row 0 11 3, .flip 0 3, .row 3 0 8, .flip 3 8, .row 8 3 1, .flip 8 1, .row 1 8 2, .flip 1 2, .row 2 1 11, .flip 2 11, .row 11 2 1], last := (11, 1) }
      bp_br := { first := (11, 0), steps := [.flip 11 0, .row 0 11 3, .flip 0 3, .row 3 0 8, .flip 3 8, .row 8 3 1, .flip 8 1, .row 1 8 2, .flip 1 2, .row 2 1 11, .flip 2 11], last := (11, 2) } } }

/-- Journal iteration 736; certificate f441339daf96896260feb5e9bf3b90dff801fb3de97868325a649bd0af05b5a5. -/
def record22 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 3, support := {0, 1, 7} },
      { center := 4, support := {3, 7} },
      { center := 7, support := {3, 4} },
      { center := 10, support := {0, 1, 4} }
    ]
    data := {
      p := 0
      q := 1
      r := 4
      a := 3
      b := 10
      ap_aq := { first := (3, 0), steps := [.row 3 0 1], last := (3, 1) }
      ap_ar := { first := (3, 0), steps := [.row 3 0 7, .flip 3 7, .row 7 3 4, .flip 7 4, .row 4 7 3, .flip 4 3], last := (3, 4) }
      bp_bq := { first := (10, 0), steps := [.row 10 0 1], last := (10, 1) }
      bp_br := { first := (10, 0), steps := [.row 10 0 4], last := (10, 4) } } }

/-- Journal iteration 737; certificate 30ad5931ca84ce7876299b31dd2935cfd3417a41c8303ac01787650c8beee875. -/
def record23 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {3, 5, 10} },
      { center := 3, support := {0, 5} },
      { center := 6, support := {0, 3, 10} },
      { center := 10, support := {0, 5} }
    ]
    data := {
      p := 0
      q := 3
      r := 10
      a := 5
      b := 6
      ap_aq := { first := (5, 0), steps := [.flip 5 0, .row 0 5 3, .flip 0 3, .row 3 0 5, .flip 3 5], last := (5, 3) }
      ap_ar := { first := (5, 0), steps := [.flip 5 0, .row 0 5 10, .flip 0 10, .row 10 0 5, .flip 10 5], last := (5, 10) }
      bp_bq := { first := (6, 0), steps := [.row 6 0 3], last := (6, 3) }
      bp_br := { first := (6, 0), steps := [.row 6 0 10], last := (6, 10) } } }

/-- Journal iteration 738; certificate 8c0e52704ddea62dccadb8541f7c6442dcfc935d05dd4183dc449dc478340c90. -/
def record24 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 1, support := {0, 2, 6} },
      { center := 3, support := {6, 7} },
      { center := 4, support := {0, 2, 7} },
      { center := 6, support := {3, 4} },
      { center := 7, support := {3, 4} }
    ]
    data := {
      p := 0
      q := 2
      r := 6
      a := 1
      b := 4
      ap_aq := { first := (1, 0), steps := [.row 1 0 2], last := (1, 2) }
      ap_ar := { first := (1, 0), steps := [.row 1 0 6], last := (1, 6) }
      bp_bq := { first := (4, 0), steps := [.row 4 0 2], last := (4, 2) }
      bp_br := { first := (4, 0), steps := [.row 4 0 7, .flip 4 7, .row 7 4 3, .flip 7 3, .row 3 7 6, .flip 3 6, .row 6 3 4, .flip 6 4], last := (4, 6) } } }

def bank : List (DuplicateCenterNogood Label) :=
  [record0, record1, record2, record3, record4, record5, record6, record7, record8, record9, record10, record11, record12, record13, record14, record15, record16, record17, record18, record19, record20, record21, record22, record23, record24]

def bankCheck : Bool := bank.all fun nogood => nogood.check

theorem bankCheck_true : bankCheck = true := by
  native_decide

theorem bank_valid : ∀ nogood ∈ bank, nogood.check = true := by
  apply List.all_eq_true.mp
  simpa [bankCheck] using bankCheck_true

end Problem97.ATailFrontierLiveClosure.ExactTwelveDuplicateCenterMembershipPilotShards.Part_001
