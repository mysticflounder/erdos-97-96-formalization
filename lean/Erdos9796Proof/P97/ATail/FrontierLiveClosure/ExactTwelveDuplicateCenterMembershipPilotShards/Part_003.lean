/-
Generated membership-core shard from scratch/sidecar-sourcefaithful-common-missing-20260807-a7f3c1/ordered-cegar-jd0-v4/journal.jsonl
Journal SHA-256: 4d2ac12341f5981cf988c7add8b547e2840f26c2395161b124d73373124e8db3
Global record interval: 50..74

This file checks record validity only.  It is not a coverage or UNSAT proof.
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.GenericRowNogoodCertificate

namespace Problem97.ATailFrontierLiveClosure.ExactTwelveDuplicateCenterMembershipPilotShards.Part_003

open Problem97.Census554.EqualityCore
open Problem97.ATailFrontierLiveClosure.GenericRowNogoodCertificate
open scoped EuclideanGeometry

abbrev Label := Fin 12

/-- Journal iteration 767; certificate 40dcf4f9145baf5de59c3f1e58e0ddd10fe07d1dfa5b3c71e08ed5f0300de7d3. -/
def record50 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {5, 10} },
      { center := 2, support := {0, 3, 10} },
      { center := 3, support := {2, 4} },
      { center := 4, support := {2, 3} },
      { center := 5, support := {0, 4} },
      { center := 10, support := {0, 5} }
    ]
    data := {
      p := 0
      q := 4
      r := 10
      a := 2
      b := 5
      ap_aq := { first := (2, 0), steps := [.row 2 0 3, .flip 2 3, .row 3 2 4, .flip 3 4, .row 4 3 2, .flip 4 2], last := (2, 4) }
      ap_ar := { first := (2, 0), steps := [.row 2 0 10], last := (2, 10) }
      bp_bq := { first := (5, 0), steps := [.row 5 0 4], last := (5, 4) }
      bp_br := { first := (5, 0), steps := [.flip 5 0, .row 0 5 10, .flip 0 10, .row 10 0 5, .flip 10 5], last := (5, 10) } } }

/-- Journal iteration 768; certificate a9a8aba2052340c4b783b13c72c2b283307de0e6257350677d27e2dd16206bfc. -/
def record51 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {5, 11} },
      { center := 2, support := {0, 3, 11} },
      { center := 3, support := {2, 4} },
      { center := 4, support := {2, 3} },
      { center := 5, support := {0, 4, 9} },
      { center := 9, support := {2, 5} },
      { center := 11, support := {0, 2} }
    ]
    data := {
      p := 0
      q := 4
      r := 9
      a := 2
      b := 5
      ap_aq := { first := (2, 0), steps := [.row 2 0 3, .flip 2 3, .row 3 2 4, .flip 3 4, .row 4 3 2, .flip 4 2], last := (2, 4) }
      ap_ar := { first := (2, 0), steps := [.row 2 0 11, .flip 2 11, .row 11 2 0, .flip 11 0, .row 0 11 5, .flip 0 5, .row 5 0 9, .flip 5 9, .row 9 5 2, .flip 9 2], last := (2, 9) }
      bp_bq := { first := (5, 0), steps := [.row 5 0 4], last := (5, 4) }
      bp_br := { first := (5, 0), steps := [.row 5 0 9], last := (5, 9) } } }

/-- Journal iteration 769; certificate b18c17fa065a4541fbfd00674e53d18b5f8138d9923330b90403572324b55338. -/
def record52 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {3, 4, 10} },
      { center := 2, support := {3, 10} },
      { center := 3, support := {2, 4} },
      { center := 4, support := {2, 3} }
    ]
    data := {
      p := 3
      q := 4
      r := 10
      a := 0
      b := 2
      ap_aq := { first := (0, 3), steps := [.row 0 3 4], last := (0, 4) }
      ap_ar := { first := (0, 3), steps := [.row 0 3 10], last := (0, 10) }
      bp_bq := { first := (2, 3), steps := [.flip 2 3, .row 3 2 4, .flip 3 4, .row 4 3 2, .flip 4 2], last := (2, 4) }
      bp_br := { first := (2, 3), steps := [.row 2 3 10], last := (2, 10) } } }

/-- Journal iteration 770; certificate 17aca8417ca79eb9e64931e785fedc903d62d83593535e89d2dd72c4c91d4615. -/
def record53 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {4, 5} },
      { center := 4, support := {1, 5} },
      { center := 5, support := {0, 4} },
      { center := 9, support := {0, 1, 5} }
    ]
    data := {
      p := 0
      q := 1
      r := 5
      a := 4
      b := 9
      ap_aq := { first := (4, 0), steps := [.flip 4 0, .row 0 4 5, .flip 0 5, .row 5 0 4, .flip 5 4, .row 4 5 1], last := (4, 1) }
      ap_ar := { first := (4, 0), steps := [.flip 4 0, .row 0 4 5, .flip 0 5, .row 5 0 4, .flip 5 4], last := (4, 5) }
      bp_bq := { first := (9, 0), steps := [.row 9 0 1], last := (9, 1) }
      bp_br := { first := (9, 0), steps := [.row 9 0 5], last := (9, 5) } } }

/-- Journal iteration 771; certificate 0711cfd036e0d68eb77cc83ca88f2a875b4323e019f744f4cdecc020f9aaaf8a. -/
def record54 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {4, 5} },
      { center := 1, support := {0, 2, 6} },
      { center := 4, support := {0, 5} },
      { center := 5, support := {2, 4, 6} }
    ]
    data := {
      p := 0
      q := 2
      r := 6
      a := 1
      b := 5
      ap_aq := { first := (1, 0), steps := [.row 1 0 2], last := (1, 2) }
      ap_ar := { first := (1, 0), steps := [.row 1 0 6], last := (1, 6) }
      bp_bq := { first := (5, 0), steps := [.flip 5 0, .row 0 5 4, .flip 0 4, .row 4 0 5, .flip 4 5, .row 5 4 2], last := (5, 2) }
      bp_br := { first := (5, 0), steps := [.flip 5 0, .row 0 5 4, .flip 0 4, .row 4 0 5, .flip 4 5, .row 5 4 6], last := (5, 6) } } }

/-- Journal iteration 772; certificate 65b611e609f9d58f21efbba45d1284b1b1eee08f4a5203e523d05ae6f7d625de. -/
def record55 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {3, 11} },
      { center := 2, support := {3, 11} },
      { center := 3, support := {0, 2} },
      { center := 5, support := {0, 1, 4} },
      { center := 11, support := {1, 2, 4} }
    ]
    data := {
      p := 0
      q := 1
      r := 4
      a := 5
      b := 11
      ap_aq := { first := (5, 0), steps := [.row 5 0 1], last := (5, 1) }
      ap_ar := { first := (5, 0), steps := [.row 5 0 4], last := (5, 4) }
      bp_bq := { first := (11, 0), steps := [.flip 11 0, .row 0 11 3, .flip 0 3, .row 3 0 2, .flip 3 2, .row 2 3 11, .flip 2 11, .row 11 2 1], last := (11, 1) }
      bp_br := { first := (11, 0), steps := [.flip 11 0, .row 0 11 3, .flip 0 3, .row 3 0 2, .flip 3 2, .row 2 3 11, .flip 2 11, .row 11 2 4], last := (11, 4) } } }

/-- Journal iteration 773; certificate 34e785a2b042a0e9936c70c4d6ef939694ff0f8c494464a7775659a85fd6a98d. -/
def record56 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 2, support := {0, 3, 10} },
      { center := 4, support := {2, 10} },
      { center := 6, support := {0, 3, 4} },
      { center := 10, support := {2, 4} }
    ]
    data := {
      p := 0
      q := 3
      r := 4
      a := 2
      b := 6
      ap_aq := { first := (2, 0), steps := [.row 2 0 3], last := (2, 3) }
      ap_ar := { first := (2, 0), steps := [.row 2 0 10, .flip 2 10, .row 10 2 4, .flip 10 4, .row 4 10 2, .flip 4 2], last := (2, 4) }
      bp_bq := { first := (6, 0), steps := [.row 6 0 3], last := (6, 3) }
      bp_br := { first := (6, 0), steps := [.row 6 0 4], last := (6, 4) } } }

/-- Journal iteration 774; certificate 7354bfa3b7fa45a7a9cb1576816b6032a62ef6962ccb0edf5fdaab85ab867c43. -/
def record57 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 4, support := {5, 9} },
      { center := 5, support := {4, 9} },
      { center := 9, support := {0, 5} },
      { center := 11, support := {0, 4, 5} }
    ]
    data := {
      p := 0
      q := 4
      r := 5
      a := 9
      b := 11
      ap_aq := { first := (9, 0), steps := [.row 9 0 5, .flip 9 5, .row 5 9 4, .flip 5 4, .row 4 5 9, .flip 4 9], last := (9, 4) }
      ap_ar := { first := (9, 0), steps := [.row 9 0 5], last := (9, 5) }
      bp_bq := { first := (11, 0), steps := [.row 11 0 4], last := (11, 4) }
      bp_br := { first := (11, 0), steps := [.row 11 0 5], last := (11, 5) } } }

/-- Journal iteration 775; certificate 20a429e9d07f58a56502d5fbad71af06bb261d1fdb2aa5bded73e2c85a8a7ef0. -/
def record58 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 1, support := {0, 2} },
      { center := 2, support := {1, 10} },
      { center := 6, support := {0, 2, 10} },
      { center := 10, support := {1, 2} }
    ]
    data := {
      p := 0
      q := 2
      r := 10
      a := 1
      b := 6
      ap_aq := { first := (1, 0), steps := [.row 1 0 2], last := (1, 2) }
      ap_ar := { first := (1, 0), steps := [.row 1 0 2, .flip 1 2, .row 2 1 10, .flip 2 10, .row 10 2 1, .flip 10 1], last := (1, 10) }
      bp_bq := { first := (6, 0), steps := [.row 6 0 2], last := (6, 2) }
      bp_br := { first := (6, 0), steps := [.row 6 0 10], last := (6, 10) } } }

/-- Journal iteration 776; certificate 72d67150a861602fd00e68c231fb096dc4b083f63419af98bc974338707085bb. -/
def record59 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {5, 6, 11} },
      { center := 2, support := {4, 11} },
      { center := 3, support := {5, 9, 11} },
      { center := 4, support := {2, 7} },
      { center := 5, support := {2, 3} },
      { center := 6, support := {0, 7, 10} },
      { center := 7, support := {4, 6} },
      { center := 9, support := {3, 10} },
      { center := 10, support := {6, 9} }
    ]
    data := {
      p := 0
      q := 2
      r := 3
      a := 5
      b := 11
      ap_aq := { first := (5, 0), steps := [.flip 5 0, .row 0 5 6, .flip 0 6, .row 6 0 10, .flip 6 10, .row 10 6 9, .flip 10 9, .row 9 10 3, .flip 9 3, .row 3 9 5, .flip 3 5, .row 5 3 2], last := (5, 2) }
      ap_ar := { first := (5, 0), steps := [.flip 5 0, .row 0 5 6, .flip 0 6, .row 6 0 10, .flip 6 10, .row 10 6 9, .flip 10 9, .row 9 10 3, .flip 9 3, .row 3 9 5, .flip 3 5], last := (5, 3) }
      bp_bq := { first := (11, 0), steps := [.flip 11 0, .row 0 11 6, .flip 0 6, .row 6 0 7, .flip 6 7, .row 7 6 4, .flip 7 4, .row 4 7 2, .flip 4 2, .row 2 4 11, .flip 2 11], last := (11, 2) }
      bp_br := { first := (11, 0), steps := [.flip 11 0, .row 0 11 6, .flip 0 6, .row 6 0 10, .flip 6 10, .row 10 6 9, .flip 10 9, .row 9 10 3, .flip 9 3, .row 3 9 11, .flip 3 11], last := (11, 3) } } }

/-- Journal iteration 777; certificate f56b10569b643a13ee8e074bb06330b4578ac0658ae5ae5bf3d6181a3e6a4863. -/
def record60 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 1, support := {2, 6, 8} },
      { center := 2, support := {0, 4} },
      { center := 4, support := {2, 6, 7} },
      { center := 6, support := {0, 7, 10} },
      { center := 7, support := {4, 6} },
      { center := 8, support := {1, 9} },
      { center := 9, support := {8, 10} },
      { center := 10, support := {6, 9} }
    ]
    data := {
      p := 0
      q := 1
      r := 4
      a := 2
      b := 6
      ap_aq := { first := (2, 0), steps := [.row 2 0 4, .flip 2 4, .row 4 2 7, .flip 4 7, .row 7 4 6, .flip 7 6, .row 6 7 10, .flip 6 10, .row 10 6 9, .flip 10 9, .row 9 10 8, .flip 9 8, .row 8 9 1, .flip 8 1, .row 1 8 2, .flip 1 2], last := (2, 1) }
      ap_ar := { first := (2, 0), steps := [.row 2 0 4], last := (2, 4) }
      bp_bq := { first := (6, 0), steps := [.row 6 0 10, .flip 6 10, .row 10 6 9, .flip 10 9, .row 9 10 8, .flip 9 8, .row 8 9 1, .flip 8 1, .row 1 8 6, .flip 1 6], last := (6, 1) }
      bp_br := { first := (6, 0), steps := [.row 6 0 7, .flip 6 7, .row 7 6 4, .flip 7 4, .row 4 7 6, .flip 4 6], last := (6, 4) } } }

/-- Journal iteration 778; certificate c84e2f5ab7970c39c5ec279a0cab3c25a2d9d1df8005f5287f5d444b6933ea0e. -/
def record61 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {5, 6} },
      { center := 1, support := {2, 8} },
      { center := 2, support := {0, 4} },
      { center := 3, support := {5, 9} },
      { center := 4, support := {2, 5, 7} },
      { center := 5, support := {1, 3, 4} },
      { center := 6, support := {0, 7} },
      { center := 7, support := {4, 6} },
      { center := 8, support := {1, 9} },
      { center := 9, support := {3, 8} }
    ]
    data := {
      p := 0
      q := 1
      r := 4
      a := 2
      b := 5
      ap_aq := { first := (2, 0), steps := [.row 2 0 4, .flip 2 4, .row 4 2 5, .flip 4 5, .row 5 4 3, .flip 5 3, .row 3 5 9, .flip 3 9, .row 9 3 8, .flip 9 8, .row 8 9 1, .flip 8 1, .row 1 8 2, .flip 1 2], last := (2, 1) }
      ap_ar := { first := (2, 0), steps := [.row 2 0 4], last := (2, 4) }
      bp_bq := { first := (5, 0), steps := [.flip 5 0, .row 0 5 6, .flip 0 6, .row 6 0 7, .flip 6 7, .row 7 6 4, .flip 7 4, .row 4 7 5, .flip 4 5, .row 5 4 1], last := (5, 1) }
      bp_br := { first := (5, 0), steps := [.flip 5 0, .row 0 5 6, .flip 0 6, .row 6 0 7, .flip 6 7, .row 7 6 4, .flip 7 4, .row 4 7 5, .flip 4 5], last := (5, 4) } } }

/-- Journal iteration 779; certificate 4928fa52bc15f5b79341c21c76a017dc11259bc6d452b702230bca068bcd7f2a. -/
def record62 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {3, 11} },
      { center := 3, support := {0, 6} },
      { center := 5, support := {0, 1, 4} },
      { center := 6, support := {3, 11} },
      { center := 11, support := {1, 4, 6} }
    ]
    data := {
      p := 0
      q := 1
      r := 4
      a := 5
      b := 11
      ap_aq := { first := (5, 0), steps := [.row 5 0 1], last := (5, 1) }
      ap_ar := { first := (5, 0), steps := [.row 5 0 4], last := (5, 4) }
      bp_bq := { first := (11, 0), steps := [.flip 11 0, .row 0 11 3, .flip 0 3, .row 3 0 6, .flip 3 6, .row 6 3 11, .flip 6 11, .row 11 6 1], last := (11, 1) }
      bp_br := { first := (11, 0), steps := [.flip 11 0, .row 0 11 3, .flip 0 3, .row 3 0 6, .flip 3 6, .row 6 3 11, .flip 6 11, .row 11 6 4], last := (11, 4) } } }

/-- Journal iteration 780; certificate 57a8593ed59238711a82a4dc4948ac6c7c63d9d43b98cb0e3f579bcc6ac45115. -/
def record63 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {4, 5, 10} },
      { center := 1, support := {2, 8} },
      { center := 2, support := {1, 10} },
      { center := 3, support := {8, 9} },
      { center := 4, support := {1, 2, 5} },
      { center := 5, support := {0, 4, 9} },
      { center := 8, support := {1, 3} },
      { center := 9, support := {3, 5} },
      { center := 10, support := {0, 1} }
    ]
    data := {
      p := 0
      q := 1
      r := 2
      a := 4
      b := 10
      ap_aq := { first := (4, 0), steps := [.flip 4 0, .row 0 4 5, .flip 0 5, .row 5 0 4, .flip 5 4, .row 4 5 1], last := (4, 1) }
      ap_ar := { first := (4, 0), steps := [.flip 4 0, .row 0 4 5, .flip 0 5, .row 5 0 4, .flip 5 4, .row 4 5 2], last := (4, 2) }
      bp_bq := { first := (10, 0), steps := [.row 10 0 1], last := (10, 1) }
      bp_br := { first := (10, 0), steps := [.flip 10 0, .row 0 10 5, .flip 0 5, .row 5 0 9, .flip 5 9, .row 9 5 3, .flip 9 3, .row 3 9 8, .flip 3 8, .row 8 3 1, .flip 8 1, .row 1 8 2, .flip 1 2, .row 2 1 10, .flip 2 10], last := (10, 2) } } }

/-- Journal iteration 781; certificate 2682e39106e7f18f4a474a0847d17a7242f6e3dcdf40a647919fd0ce4f933378. -/
def record64 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {4, 5, 10} },
      { center := 3, support := {4, 10} },
      { center := 4, support := {1, 3, 5} },
      { center := 5, support := {0, 4} },
      { center := 10, support := {0, 1} }
    ]
    data := {
      p := 0
      q := 1
      r := 3
      a := 4
      b := 10
      ap_aq := { first := (4, 0), steps := [.flip 4 0, .row 0 4 5, .flip 0 5, .row 5 0 4, .flip 5 4, .row 4 5 1], last := (4, 1) }
      ap_ar := { first := (4, 0), steps := [.flip 4 0, .row 0 4 5, .flip 0 5, .row 5 0 4, .flip 5 4, .row 4 5 3], last := (4, 3) }
      bp_bq := { first := (10, 0), steps := [.row 10 0 1], last := (10, 1) }
      bp_br := { first := (10, 0), steps := [.flip 10 0, .row 0 10 5, .flip 0 5, .row 5 0 4, .flip 5 4, .row 4 5 3, .flip 4 3, .row 3 4 10, .flip 3 10], last := (10, 3) } } }

/-- Journal iteration 782; certificate aae2b5f610e21e79565bffbd13e823bcf3da621f10972ca1638bd3e9a524f742. -/
def record65 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 3, support := {4, 6, 7} },
      { center := 4, support := {0, 3} },
      { center := 6, support := {0, 3} },
      { center := 7, support := {3, 4, 6} }
    ]
    data := {
      p := 0
      q := 3
      r := 7
      a := 4
      b := 6
      ap_aq := { first := (4, 0), steps := [.row 4 0 3], last := (4, 3) }
      ap_ar := { first := (4, 0), steps := [.row 4 0 3, .flip 4 3, .row 3 4 7, .flip 3 7, .row 7 3 4, .flip 7 4], last := (4, 7) }
      bp_bq := { first := (6, 0), steps := [.row 6 0 3], last := (6, 3) }
      bp_br := { first := (6, 0), steps := [.row 6 0 3, .flip 6 3, .row 3 6 7, .flip 3 7, .row 7 3 6, .flip 7 6], last := (6, 7) } } }

/-- Journal iteration 784; certificate 4940b35e9d4180b1ffb1a7d8fd472e85840da8b92d8f4a6019dab306892acccf. -/
def record66 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 3, support := {4, 7} },
      { center := 4, support := {0, 3} },
      { center := 6, support := {0, 3, 7} },
      { center := 7, support := {3, 4} }
    ]
    data := {
      p := 0
      q := 3
      r := 7
      a := 4
      b := 6
      ap_aq := { first := (4, 0), steps := [.row 4 0 3], last := (4, 3) }
      ap_ar := { first := (4, 0), steps := [.row 4 0 3, .flip 4 3, .row 3 4 7, .flip 3 7, .row 7 3 4, .flip 7 4], last := (4, 7) }
      bp_bq := { first := (6, 0), steps := [.row 6 0 3], last := (6, 3) }
      bp_br := { first := (6, 0), steps := [.row 6 0 7], last := (6, 7) } } }

/-- Journal iteration 785; certificate 503c8458dd59537318b08d5afb9084411ee7d1c5b9be4ab90e07b4333ed6d208. -/
def record67 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 3, support := {4, 7} },
      { center := 4, support := {0, 3} },
      { center := 7, support := {3, 4} },
      { center := 10, support := {0, 3, 7} }
    ]
    data := {
      p := 0
      q := 3
      r := 7
      a := 4
      b := 10
      ap_aq := { first := (4, 0), steps := [.row 4 0 3], last := (4, 3) }
      ap_ar := { first := (4, 0), steps := [.row 4 0 3, .flip 4 3, .row 3 4 7, .flip 3 7, .row 7 3 4, .flip 7 4], last := (4, 7) }
      bp_bq := { first := (10, 0), steps := [.row 10 0 3], last := (10, 3) }
      bp_br := { first := (10, 0), steps := [.row 10 0 7], last := (10, 7) } } }

/-- Journal iteration 786; certificate 61cc506870ac13c18df8c2c1dcd01d26eaaa1bfbac55ea769bbf336283f25d91. -/
def record68 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {1, 5, 6} },
      { center := 1, support := {0, 6} },
      { center := 3, support := {0, 1, 9} },
      { center := 5, support := {0, 3, 6} },
      { center := 6, support := {5, 7} },
      { center := 7, support := {6, 11} },
      { center := 8, support := {9, 11} },
      { center := 9, support := {3, 8} },
      { center := 11, support := {7, 8} }
    ]
    data := {
      p := 0
      q := 1
      r := 5
      a := 3
      b := 6
      ap_aq := { first := (3, 0), steps := [.row 3 0 1], last := (3, 1) }
      ap_ar := { first := (3, 0), steps := [.row 3 0 9, .flip 3 9, .row 9 3 8, .flip 9 8, .row 8 9 11, .flip 8 11, .row 11 8 7, .flip 11 7, .row 7 11 6, .flip 7 6, .row 6 7 5, .flip 6 5, .row 5 6 3, .flip 5 3], last := (3, 5) }
      bp_bq := { first := (6, 0), steps := [.flip 6 0, .row 0 6 1, .flip 0 1, .row 1 0 6, .flip 1 6], last := (6, 1) }
      bp_br := { first := (6, 0), steps := [.flip 6 0, .row 0 6 5, .flip 0 5, .row 5 0 6, .flip 5 6], last := (6, 5) } } }

/-- Journal iteration 787; certificate 52c267a5d5ce7b3b5f151d20ef14cdf2313c4bedbbae5c7e76afaea892a2c245. -/
def record69 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {1, 4, 5, 6} },
      { center := 1, support := {0, 6} },
      { center := 2, support := {4, 11} },
      { center := 4, support := {0, 2} },
      { center := 5, support := {0, 6} },
      { center := 6, support := {2, 5, 7} },
      { center := 7, support := {6, 11} },
      { center := 11, support := {0, 1, 7} }
    ]
    data := {
      p := 0
      q := 1
      r := 2
      a := 6
      b := 11
      ap_aq := { first := (6, 0), steps := [.flip 6 0, .row 0 6 1, .flip 0 1, .row 1 0 6, .flip 1 6], last := (6, 1) }
      ap_ar := { first := (6, 0), steps := [.flip 6 0, .row 0 6 5, .flip 0 5, .row 5 0 6, .flip 5 6, .row 6 5 2], last := (6, 2) }
      bp_bq := { first := (11, 0), steps := [.row 11 0 1], last := (11, 1) }
      bp_br := { first := (11, 0), steps := [.row 11 0 7, .flip 11 7, .row 7 11 6, .flip 7 6, .row 6 7 5, .flip 6 5, .row 5 6 0, .flip 5 0, .row 0 5 4, .flip 0 4, .row 4 0 2, .flip 4 2, .row 2 4 11, .flip 2 11], last := (11, 2) } } }

/-- Journal iteration 788; certificate cf21ed1c174c25f821745d4deb2330304c65094a5a5b80d513c36ec5f7efcc7a. -/
def record70 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 4, support := {2, 3, 5} },
      { center := 5, support := {7, 9} },
      { center := 7, support := {5, 11} },
      { center := 8, support := {9, 11} },
      { center := 9, support := {2, 3, 8} },
      { center := 11, support := {7, 8} }
    ]
    data := {
      p := 2
      q := 3
      r := 5
      a := 4
      b := 9
      ap_aq := { first := (4, 2), steps := [.row 4 2 3], last := (4, 3) }
      ap_ar := { first := (4, 2), steps := [.row 4 2 5], last := (4, 5) }
      bp_bq := { first := (9, 2), steps := [.row 9 2 3], last := (9, 3) }
      bp_br := { first := (9, 2), steps := [.row 9 2 8, .flip 9 8, .row 8 9 11, .flip 8 11, .row 11 8 7, .flip 11 7, .row 7 11 5, .flip 7 5, .row 5 7 9, .flip 5 9], last := (9, 5) } } }

/-- Journal iteration 790; certificate 365d0c2f93d3656d771bca9fcaaef337820ab3f6e01d3915a2936c4ab0032271. -/
def record71 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 3, support := {0, 4, 6, 7} },
      { center := 4, support := {0, 3} },
      { center := 6, support := {3, 4} },
      { center := 7, support := {3, 4} }
    ]
    data := {
      p := 0
      q := 6
      r := 7
      a := 3
      b := 4
      ap_aq := { first := (3, 0), steps := [.row 3 0 6], last := (3, 6) }
      ap_ar := { first := (3, 0), steps := [.row 3 0 7], last := (3, 7) }
      bp_bq := { first := (4, 0), steps := [.row 4 0 3, .flip 4 3, .row 3 4 6, .flip 3 6, .row 6 3 4, .flip 6 4], last := (4, 6) }
      bp_br := { first := (4, 0), steps := [.row 4 0 3, .flip 4 3, .row 3 4 7, .flip 3 7, .row 7 3 4, .flip 7 4], last := (4, 7) } } }

/-- Journal iteration 791; certificate 78c951cb66cf84e78d497e07aee66439f743efeb7a74e3445a7ab0ff039d247f. -/
def record72 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {2, 4, 10} },
      { center := 2, support := {0, 10} },
      { center := 3, support := {9, 10} },
      { center := 4, support := {0, 7} },
      { center := 6, support := {0, 2, 7} },
      { center := 7, support := {4, 6} },
      { center := 9, support := {3, 6} },
      { center := 10, support := {0, 3, 9} }
    ]
    data := {
      p := 0
      q := 2
      r := 9
      a := 6
      b := 10
      ap_aq := { first := (6, 0), steps := [.row 6 0 2], last := (6, 2) }
      ap_ar := { first := (6, 0), steps := [.row 6 0 7, .flip 6 7, .row 7 6 4, .flip 7 4, .row 4 7 0, .flip 4 0, .row 0 4 10, .flip 0 10, .row 10 0 3, .flip 10 3, .row 3 10 9, .flip 3 9, .row 9 3 6, .flip 9 6], last := (6, 9) }
      bp_bq := { first := (10, 0), steps := [.flip 10 0, .row 0 10 2, .flip 0 2, .row 2 0 10, .flip 2 10], last := (10, 2) }
      bp_br := { first := (10, 0), steps := [.row 10 0 9], last := (10, 9) } } }

/-- Journal iteration 792; certificate 3425cbd181ed2b6b5169caccc5e1f41a2540638d2e3aa04d29af50187a1f433d. -/
def record73 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {4, 11} },
      { center := 2, support := {4, 6} },
      { center := 4, support := {0, 2, 3} },
      { center := 6, support := {0, 3, 11} },
      { center := 11, support := {0, 6} }
    ]
    data := {
      p := 0
      q := 2
      r := 3
      a := 4
      b := 6
      ap_aq := { first := (4, 0), steps := [.row 4 0 2], last := (4, 2) }
      ap_ar := { first := (4, 0), steps := [.row 4 0 3], last := (4, 3) }
      bp_bq := { first := (6, 0), steps := [.row 6 0 11, .flip 6 11, .row 11 6 0, .flip 11 0, .row 0 11 4, .flip 0 4, .row 4 0 2, .flip 4 2, .row 2 4 6, .flip 2 6], last := (6, 2) }
      bp_br := { first := (6, 0), steps := [.row 6 0 3], last := (6, 3) } } }

/-- Journal iteration 793; certificate 89ecc16d697e8956740a72d842940c3d5b7c41c0040d80a4c5111a35035a7ec7. -/
def record74 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {3, 10} },
      { center := 3, support := {5, 9, 10} },
      { center := 10, support := {0, 3, 5, 9} }
    ]
    data := {
      p := 0
      q := 5
      r := 9
      a := 3
      b := 10
      ap_aq := { first := (3, 0), steps := [.flip 3 0, .row 0 3 10, .flip 0 10, .row 10 0 3, .flip 10 3, .row 3 10 5], last := (3, 5) }
      ap_ar := { first := (3, 0), steps := [.flip 3 0, .row 0 3 10, .flip 0 10, .row 10 0 3, .flip 10 3, .row 3 10 9], last := (3, 9) }
      bp_bq := { first := (10, 0), steps := [.row 10 0 5], last := (10, 5) }
      bp_br := { first := (10, 0), steps := [.row 10 0 9], last := (10, 9) } } }

def bank : List (DuplicateCenterNogood Label) :=
  [record50, record51, record52, record53, record54, record55, record56, record57, record58, record59, record60, record61, record62, record63, record64, record65, record66, record67, record68, record69, record70, record71, record72, record73, record74]

def bankCheck : Bool := bank.all fun nogood => nogood.check

theorem bankCheck_true : bankCheck = true := by
  native_decide

theorem bank_valid : ∀ nogood ∈ bank, nogood.check = true := by
  apply List.all_eq_true.mp
  simpa [bankCheck] using bankCheck_true

end Problem97.ATailFrontierLiveClosure.ExactTwelveDuplicateCenterMembershipPilotShards.Part_003
