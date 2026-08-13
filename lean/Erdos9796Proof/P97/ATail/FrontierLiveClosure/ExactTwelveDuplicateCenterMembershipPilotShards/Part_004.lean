/-
Generated membership-core shard from scratch/sidecar-sourcefaithful-common-missing-20260807-a7f3c1/ordered-cegar-jd0-v4/journal.jsonl
Journal SHA-256: 4d2ac12341f5981cf988c7add8b547e2840f26c2395161b124d73373124e8db3
Global record interval: 75..99

This file checks record validity only.  It is not a coverage or UNSAT proof.
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.GenericRowNogoodCertificate

namespace Problem97.ATailFrontierLiveClosure.ExactTwelveDuplicateCenterMembershipPilotShards.Part_004

open Problem97.Census554.EqualityCore
open Problem97.ATailFrontierLiveClosure.GenericRowNogoodCertificate
open scoped EuclideanGeometry

abbrev Label := Fin 12

/-- Journal iteration 794; certificate 4d3184e1c1846fd3ffc2bc28f8d33beb077477caee0697f06f989a1c3c35f95f. -/
def record75 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {5, 6} },
      { center := 4, support := {1, 5, 9} },
      { center := 5, support := {0, 4} },
      { center := 6, support := {0, 4} },
      { center := 8, support := {1, 6, 9} }
    ]
    data := {
      p := 1
      q := 6
      r := 9
      a := 4
      b := 8
      ap_aq := { first := (4, 1), steps := [.row 4 1 5, .flip 4 5, .row 5 4 0, .flip 5 0, .row 0 5 6, .flip 0 6, .row 6 0 4, .flip 6 4], last := (4, 6) }
      ap_ar := { first := (4, 1), steps := [.row 4 1 9], last := (4, 9) }
      bp_bq := { first := (8, 1), steps := [.row 8 1 6], last := (8, 6) }
      bp_br := { first := (8, 1), steps := [.row 8 1 9], last := (8, 9) } } }

/-- Journal iteration 795; certificate 6ea1180ab09ee3a3e006850bca18ca15305b0d19749fcc4ea5506695be6b8299. -/
def record76 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {3, 5, 10} },
      { center := 1, support := {0, 2, 6} },
      { center := 2, support := {5, 10} },
      { center := 3, support := {0, 6} },
      { center := 6, support := {3, 5} },
      { center := 10, support := {0, 2} }
    ]
    data := {
      p := 0
      q := 2
      r := 6
      a := 1
      b := 5
      ap_aq := { first := (1, 0), steps := [.row 1 0 2], last := (1, 2) }
      ap_ar := { first := (1, 0), steps := [.row 1 0 6], last := (1, 6) }
      bp_bq := { first := (5, 0), steps := [.flip 5 0, .row 0 5 10, .flip 0 10, .row 10 0 2, .flip 10 2, .row 2 10 5, .flip 2 5], last := (5, 2) }
      bp_br := { first := (5, 0), steps := [.flip 5 0, .row 0 5 3, .flip 0 3, .row 3 0 6, .flip 3 6, .row 6 3 5, .flip 6 5], last := (5, 6) } } }

/-- Journal iteration 796; certificate bf19cef88e198e30549ffab33a2d93a030efb83c1222a71dc7740c4006ef8cc4. -/
def record77 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {3, 5} },
      { center := 3, support := {0, 4} },
      { center := 4, support := {0, 1, 3} },
      { center := 5, support := {0, 1, 9} },
      { center := 9, support := {4, 5} }
    ]
    data := {
      p := 0
      q := 1
      r := 9
      a := 4
      b := 5
      ap_aq := { first := (4, 0), steps := [.row 4 0 1], last := (4, 1) }
      ap_ar := { first := (4, 0), steps := [.row 4 0 3, .flip 4 3, .row 3 4 0, .flip 3 0, .row 0 3 5, .flip 0 5, .row 5 0 9, .flip 5 9, .row 9 5 4, .flip 9 4], last := (4, 9) }
      bp_bq := { first := (5, 0), steps := [.row 5 0 1], last := (5, 1) }
      bp_br := { first := (5, 0), steps := [.row 5 0 9], last := (5, 9) } } }

/-- Journal iteration 798; certificate f140ae2a0b834bcf3c58cea5e68318956248a53fe6468f3344ff2ed16e05af94. -/
def record78 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {3, 5} },
      { center := 1, support := {6, 8} },
      { center := 3, support := {0, 4, 7, 8} },
      { center := 4, support := {0, 1, 5} },
      { center := 5, support := {0, 4} },
      { center := 6, support := {0, 3, 7} },
      { center := 7, support := {3, 6} },
      { center := 8, support := {1, 3} }
    ]
    data := {
      p := 0
      q := 1
      r := 3
      a := 4
      b := 6
      ap_aq := { first := (4, 0), steps := [.row 4 0 1], last := (4, 1) }
      ap_ar := { first := (4, 0), steps := [.row 4 0 5, .flip 4 5, .row 5 4 0, .flip 5 0, .row 0 5 3, .flip 0 3, .row 3 0 4, .flip 3 4], last := (4, 3) }
      bp_bq := { first := (6, 0), steps := [.row 6 0 7, .flip 6 7, .row 7 6 3, .flip 7 3, .row 3 7 8, .flip 3 8, .row 8 3 1, .flip 8 1, .row 1 8 6, .flip 1 6], last := (6, 1) }
      bp_br := { first := (6, 0), steps := [.row 6 0 3], last := (6, 3) } } }

/-- Journal iteration 801; certificate 0af563093455524d4db2fe7ed10b13bf6cfc398736c38e53f4383c6cbbacfbe6. -/
def record79 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 1, support := {0, 2, 8} },
      { center := 3, support := {7, 8} },
      { center := 6, support := {0, 2, 7} },
      { center := 7, support := {3, 6} },
      { center := 8, support := {3, 6} }
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
      bp_br := { first := (6, 0), steps := [.row 6 0 7, .flip 6 7, .row 7 6 3, .flip 7 3, .row 3 7 8, .flip 3 8, .row 8 3 6, .flip 8 6], last := (6, 8) } } }

/-- Journal iteration 802; certificate 103664814e37a2d0579fe88a110a0eea072b2e47af4d4d9fcf6a2746a98a8887. -/
def record80 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {1, 2, 4} },
      { center := 1, support := {0, 2} },
      { center := 2, support := {4, 11} },
      { center := 4, support := {0, 2} },
      { center := 10, support := {0, 1, 11} }
    ]
    data := {
      p := 0
      q := 1
      r := 11
      a := 2
      b := 10
      ap_aq := { first := (2, 0), steps := [.flip 2 0, .row 0 2 1, .flip 0 1, .row 1 0 2, .flip 1 2], last := (2, 1) }
      ap_ar := { first := (2, 0), steps := [.flip 2 0, .row 0 2 4, .flip 0 4, .row 4 0 2, .flip 4 2, .row 2 4 11], last := (2, 11) }
      bp_bq := { first := (10, 0), steps := [.row 10 0 1], last := (10, 1) }
      bp_br := { first := (10, 0), steps := [.row 10 0 11], last := (10, 11) } } }

/-- Journal iteration 803; certificate 454452eb39157622a5b4a0a7e4bf285562f0e79890e7f59f4c1f132543bed97a. -/
def record81 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {3, 5} },
      { center := 1, support := {2, 6} },
      { center := 2, support := {0, 1} },
      { center := 3, support := {0, 6} },
      { center := 4, support := {2, 5} },
      { center := 5, support := {0, 1, 4} },
      { center := 6, support := {1, 3} }
    ]
    data := {
      p := 0
      q := 1
      r := 4
      a := 2
      b := 5
      ap_aq := { first := (2, 0), steps := [.row 2 0 1], last := (2, 1) }
      ap_ar := { first := (2, 0), steps := [.row 2 0 1, .flip 2 1, .row 1 2 6, .flip 1 6, .row 6 1 3, .flip 6 3, .row 3 6 0, .flip 3 0, .row 0 3 5, .flip 0 5, .row 5 0 4, .flip 5 4, .row 4 5 2, .flip 4 2], last := (2, 4) }
      bp_bq := { first := (5, 0), steps := [.row 5 0 1], last := (5, 1) }
      bp_br := { first := (5, 0), steps := [.row 5 0 4], last := (5, 4) } } }

/-- Journal iteration 805; certificate bb75fbbbea7304b2e5de54e678e46182a0c3d0bdd3581e1fc560414c3ea23dac. -/
def record82 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {4, 5, 9} },
      { center := 4, support := {2, 5} },
      { center := 5, support := {0, 4, 9} },
      { center := 9, support := {0, 2} }
    ]
    data := {
      p := 0
      q := 2
      r := 5
      a := 4
      b := 9
      ap_aq := { first := (4, 0), steps := [.flip 4 0, .row 0 4 5, .flip 0 5, .row 5 0 4, .flip 5 4, .row 4 5 2], last := (4, 2) }
      ap_ar := { first := (4, 0), steps := [.flip 4 0, .row 0 4 5, .flip 0 5, .row 5 0 4, .flip 5 4], last := (4, 5) }
      bp_bq := { first := (9, 0), steps := [.row 9 0 2], last := (9, 2) }
      bp_br := { first := (9, 0), steps := [.flip 9 0, .row 0 9 5, .flip 0 5, .row 5 0 9, .flip 5 9], last := (9, 5) } } }

/-- Journal iteration 809; certificate 3b702f17c9dbf948d8b04e2e479f7d7301c2be0d812a379ad74f2f2a82b1d98f. -/
def record83 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 1, support := {2, 6} },
      { center := 2, support := {0, 1, 10} },
      { center := 6, support := {0, 10} },
      { center := 10, support := {2, 6} }
    ]
    data := {
      p := 0
      q := 1
      r := 10
      a := 2
      b := 6
      ap_aq := { first := (2, 0), steps := [.row 2 0 1], last := (2, 1) }
      ap_ar := { first := (2, 0), steps := [.row 2 0 10], last := (2, 10) }
      bp_bq := { first := (6, 0), steps := [.row 6 0 10, .flip 6 10, .row 10 6 2, .flip 10 2, .row 2 10 1, .flip 2 1, .row 1 2 6, .flip 1 6], last := (6, 1) }
      bp_br := { first := (6, 0), steps := [.row 6 0 10], last := (6, 10) } } }

/-- Journal iteration 810; certificate fadb4e7dddbfde7c2cd4116b66b9064b5d47086b3c01c262c77e15fef435d5a0. -/
def record84 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {3, 8, 10} },
      { center := 1, support := {2, 8} },
      { center := 2, support := {0, 3, 10} },
      { center := 3, support := {0, 8} },
      { center := 8, support := {1, 3} },
      { center := 10, support := {0, 2} }
    ]
    data := {
      p := 0
      q := 1
      r := 3
      a := 2
      b := 8
      ap_aq := { first := (2, 0), steps := [.row 2 0 10, .flip 2 10, .row 10 2 0, .flip 10 0, .row 0 10 3, .flip 0 3, .row 3 0 8, .flip 3 8, .row 8 3 1, .flip 8 1, .row 1 8 2, .flip 1 2], last := (2, 1) }
      ap_ar := { first := (2, 0), steps := [.row 2 0 3], last := (2, 3) }
      bp_bq := { first := (8, 0), steps := [.flip 8 0, .row 0 8 3, .flip 0 3, .row 3 0 8, .flip 3 8, .row 8 3 1], last := (8, 1) }
      bp_br := { first := (8, 0), steps := [.flip 8 0, .row 0 8 3, .flip 0 3, .row 3 0 8, .flip 3 8], last := (8, 3) } } }

/-- Journal iteration 811; certificate 19ae76d93991be48836417ce4c34025db55fd819a11d83fb7b13680359ce8b58. -/
def record85 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {4, 5} },
      { center := 4, support := {0, 5} },
      { center := 5, support := {2, 4} },
      { center := 6, support := {0, 2, 4} }
    ]
    data := {
      p := 0
      q := 2
      r := 4
      a := 5
      b := 6
      ap_aq := { first := (5, 0), steps := [.flip 5 0, .row 0 5 4, .flip 0 4, .row 4 0 5, .flip 4 5, .row 5 4 2], last := (5, 2) }
      ap_ar := { first := (5, 0), steps := [.flip 5 0, .row 0 5 4, .flip 0 4, .row 4 0 5, .flip 4 5], last := (5, 4) }
      bp_bq := { first := (6, 0), steps := [.row 6 0 2], last := (6, 2) }
      bp_br := { first := (6, 0), steps := [.row 6 0 4], last := (6, 4) } } }

/-- Journal iteration 815; certificate 7a50469532ecb2b2cae1835ae47755782b25dad611b28fcc63bfe3aff89b4b6d. -/
def record86 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {3, 7} },
      { center := 1, support := {0, 6, 8} },
      { center := 3, support := {0, 7} },
      { center := 7, support := {3, 6, 8} }
    ]
    data := {
      p := 0
      q := 6
      r := 8
      a := 1
      b := 7
      ap_aq := { first := (1, 0), steps := [.row 1 0 6], last := (1, 6) }
      ap_ar := { first := (1, 0), steps := [.row 1 0 8], last := (1, 8) }
      bp_bq := { first := (7, 0), steps := [.flip 7 0, .row 0 7 3, .flip 0 3, .row 3 0 7, .flip 3 7, .row 7 3 6], last := (7, 6) }
      bp_br := { first := (7, 0), steps := [.flip 7 0, .row 0 7 3, .flip 0 3, .row 3 0 7, .flip 3 7, .row 7 3 8], last := (7, 8) } } }

/-- Journal iteration 816; certificate a320426e9e2462c89392fe4c7248e16934b4cf99888661e71e4f8d8a8c2077ab. -/
def record87 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 1, support := {2, 8} },
      { center := 2, support := {0, 3, 10} },
      { center := 3, support := {2, 4} },
      { center := 4, support := {0, 1, 9} },
      { center := 8, support := {1, 9, 10} },
      { center := 9, support := {4, 8} },
      { center := 10, support := {2, 8} }
    ]
    data := {
      p := 0
      q := 1
      r := 3
      a := 2
      b := 4
      ap_aq := { first := (2, 0), steps := [.row 2 0 10, .flip 2 10, .row 10 2 8, .flip 10 8, .row 8 10 1, .flip 8 1, .row 1 8 2, .flip 1 2], last := (2, 1) }
      ap_ar := { first := (2, 0), steps := [.row 2 0 3], last := (2, 3) }
      bp_bq := { first := (4, 0), steps := [.row 4 0 1], last := (4, 1) }
      bp_br := { first := (4, 0), steps := [.row 4 0 9, .flip 4 9, .row 9 4 8, .flip 9 8, .row 8 9 10, .flip 8 10, .row 10 8 2, .flip 10 2, .row 2 10 3, .flip 2 3, .row 3 2 4, .flip 3 4], last := (4, 3) } } }

/-- Journal iteration 817; certificate 42d031e9ed77192fecb97ec2d3231d32e785f49245ba4517168935041538a8a8. -/
def record88 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 1, support := {2, 8} },
      { center := 2, support := {0, 3, 10} },
      { center := 8, support := {1, 10} },
      { center := 9, support := {0, 1, 3} },
      { center := 10, support := {2, 8} }
    ]
    data := {
      p := 0
      q := 1
      r := 3
      a := 2
      b := 9
      ap_aq := { first := (2, 0), steps := [.row 2 0 10, .flip 2 10, .row 10 2 8, .flip 10 8, .row 8 10 1, .flip 8 1, .row 1 8 2, .flip 1 2], last := (2, 1) }
      ap_ar := { first := (2, 0), steps := [.row 2 0 3], last := (2, 3) }
      bp_bq := { first := (9, 0), steps := [.row 9 0 1], last := (9, 1) }
      bp_br := { first := (9, 0), steps := [.row 9 0 3], last := (9, 3) } } }

/-- Journal iteration 818; certificate a85e81e2f146ef61e8b29c7fcc4020996ddd2fea5bee62c4c7b74bbdf8e986db. -/
def record89 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {4, 11} },
      { center := 4, support := {0, 9} },
      { center := 9, support := {0, 1, 11} },
      { center := 11, support := {0, 1, 4, 9} }
    ]
    data := {
      p := 0
      q := 1
      r := 4
      a := 9
      b := 11
      ap_aq := { first := (9, 0), steps := [.row 9 0 1], last := (9, 1) }
      ap_ar := { first := (9, 0), steps := [.row 9 0 11, .flip 9 11, .row 11 9 0, .flip 11 0, .row 0 11 4, .flip 0 4, .row 4 0 9, .flip 4 9], last := (9, 4) }
      bp_bq := { first := (11, 0), steps := [.row 11 0 1], last := (11, 1) }
      bp_br := { first := (11, 0), steps := [.row 11 0 4], last := (11, 4) } } }

/-- Journal iteration 819; certificate f14247d633bffafd4c0e95dccbf0d31f08c21e30b3c851b21b7bf2008592d593. -/
def record90 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {4, 6} },
      { center := 1, support := {6, 8} },
      { center := 4, support := {0, 6} },
      { center := 5, support := {0, 1, 4} },
      { center := 6, support := {0, 8} },
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
      bp_br := { first := (6, 0), steps := [.flip 6 0, .row 0 6 4, .flip 0 4, .row 4 0 6, .flip 4 6], last := (6, 4) } } }

/-- Journal iteration 820; certificate fe8801c21d99e334c0779b2946005a554316d7f72c22d3b01560c0eca717331e. -/
def record91 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 1, support := {6, 8} },
      { center := 4, support := {0, 1, 5} },
      { center := 6, support := {0, 5, 8} },
      { center := 8, support := {1, 6} }
    ]
    data := {
      p := 0
      q := 1
      r := 5
      a := 4
      b := 6
      ap_aq := { first := (4, 0), steps := [.row 4 0 1], last := (4, 1) }
      ap_ar := { first := (4, 0), steps := [.row 4 0 5], last := (4, 5) }
      bp_bq := { first := (6, 0), steps := [.row 6 0 8, .flip 6 8, .row 8 6 1, .flip 8 1, .row 1 8 6, .flip 1 6], last := (6, 1) }
      bp_br := { first := (6, 0), steps := [.row 6 0 5], last := (6, 5) } } }

/-- Journal iteration 821; certificate dd79778adf17e7a3bc1f29b4fac522d3d9d3f8fa09f90188eb29348225b3715d. -/
def record92 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 1, support := {0, 2, 8} },
      { center := 6, support := {0, 2, 11} },
      { center := 8, support := {1, 9} },
      { center := 9, support := {8, 11} },
      { center := 11, support := {1, 9} }
    ]
    data := {
      p := 0
      q := 2
      r := 11
      a := 1
      b := 6
      ap_aq := { first := (1, 0), steps := [.row 1 0 2], last := (1, 2) }
      ap_ar := { first := (1, 0), steps := [.row 1 0 8, .flip 1 8, .row 8 1 9, .flip 8 9, .row 9 8 11, .flip 9 11, .row 11 9 1, .flip 11 1], last := (1, 11) }
      bp_bq := { first := (6, 0), steps := [.row 6 0 2], last := (6, 2) }
      bp_br := { first := (6, 0), steps := [.row 6 0 11], last := (6, 11) } } }

/-- Journal iteration 822; certificate 8a6f1493648d9a5b90805b31737ec4a7cf6d5dc606ca08e391928569c804fec3. -/
def record93 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {3, 4} },
      { center := 3, support := {0, 4} },
      { center := 4, support := {0, 7} },
      { center := 10, support := {0, 3, 7} }
    ]
    data := {
      p := 0
      q := 3
      r := 7
      a := 4
      b := 10
      ap_aq := { first := (4, 0), steps := [.flip 4 0, .row 0 4 3, .flip 0 3, .row 3 0 4, .flip 3 4], last := (4, 3) }
      ap_ar := { first := (4, 0), steps := [.row 4 0 7], last := (4, 7) }
      bp_bq := { first := (10, 0), steps := [.row 10 0 3], last := (10, 3) }
      bp_br := { first := (10, 0), steps := [.row 10 0 7], last := (10, 7) } } }

/-- Journal iteration 824; certificate 447f1c8317649ed94c7b3a0a863dab4cee191e7f899f48c092244dec11fd6dbc. -/
def record94 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {4, 5} },
      { center := 4, support := {0, 5} },
      { center := 5, support := {1, 4} },
      { center := 9, support := {0, 1, 4} }
    ]
    data := {
      p := 0
      q := 1
      r := 4
      a := 5
      b := 9
      ap_aq := { first := (5, 0), steps := [.flip 5 0, .row 0 5 4, .flip 0 4, .row 4 0 5, .flip 4 5, .row 5 4 1], last := (5, 1) }
      ap_ar := { first := (5, 0), steps := [.flip 5 0, .row 0 5 4, .flip 0 4, .row 4 0 5, .flip 4 5], last := (5, 4) }
      bp_bq := { first := (9, 0), steps := [.row 9 0 1], last := (9, 1) }
      bp_br := { first := (9, 0), steps := [.row 9 0 4], last := (9, 4) } } }

/-- Journal iteration 825; certificate 461984f3fb219f2447c79a2d35302e526700edd429ba09e5ae75b94fd355cb69. -/
def record95 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {4, 5, 11} },
      { center := 2, support := {5, 11} },
      { center := 4, support := {0, 5} },
      { center := 5, support := {1, 2, 4} },
      { center := 11, support := {1, 2} }
    ]
    data := {
      p := 0
      q := 1
      r := 2
      a := 5
      b := 11
      ap_aq := { first := (5, 0), steps := [.flip 5 0, .row 0 5 4, .flip 0 4, .row 4 0 5, .flip 4 5, .row 5 4 1], last := (5, 1) }
      ap_ar := { first := (5, 0), steps := [.flip 5 0, .row 0 5 4, .flip 0 4, .row 4 0 5, .flip 4 5, .row 5 4 2], last := (5, 2) }
      bp_bq := { first := (11, 0), steps := [.flip 11 0, .row 0 11 4, .flip 0 4, .row 4 0 5, .flip 4 5, .row 5 4 2, .flip 5 2, .row 2 5 11, .flip 2 11, .row 11 2 1], last := (11, 1) }
      bp_br := { first := (11, 0), steps := [.flip 11 0, .row 0 11 4, .flip 0 4, .row 4 0 5, .flip 4 5, .row 5 4 2, .flip 5 2, .row 2 5 11, .flip 2 11], last := (11, 2) } } }

/-- Journal iteration 826; certificate 849944f3ab1ea7c760d37d9c410fd67813c16935204a9208803646a62963247a. -/
def record96 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 2, support := {4, 7, 10} },
      { center := 3, support := {2, 4} },
      { center := 4, support := {2, 3} },
      { center := 11, support := {3, 7, 10} }
    ]
    data := {
      p := 3
      q := 7
      r := 10
      a := 2
      b := 11
      ap_aq := { first := (2, 3), steps := [.flip 2 3, .row 3 2 4, .flip 3 4, .row 4 3 2, .flip 4 2, .row 2 4 7], last := (2, 7) }
      ap_ar := { first := (2, 3), steps := [.flip 2 3, .row 3 2 4, .flip 3 4, .row 4 3 2, .flip 4 2, .row 2 4 10], last := (2, 10) }
      bp_bq := { first := (11, 3), steps := [.row 11 3 7], last := (11, 7) }
      bp_br := { first := (11, 3), steps := [.row 11 3 10], last := (11, 10) } } }

/-- Journal iteration 827; certificate e2c93faa2a510e9fd1a63affafcecc729655ed791f19f84da02dbc0855f49ba1. -/
def record97 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {3, 10} },
      { center := 2, support := {10, 11} },
      { center := 3, support := {0, 1} },
      { center := 4, support := {0, 1, 11} },
      { center := 10, support := {0, 2} },
      { center := 11, support := {2, 3} }
    ]
    data := {
      p := 0
      q := 1
      r := 11
      a := 3
      b := 4
      ap_aq := { first := (3, 0), steps := [.row 3 0 1], last := (3, 1) }
      ap_ar := { first := (3, 0), steps := [.flip 3 0, .row 0 3 10, .flip 0 10, .row 10 0 2, .flip 10 2, .row 2 10 11, .flip 2 11, .row 11 2 3, .flip 11 3], last := (3, 11) }
      bp_bq := { first := (4, 0), steps := [.row 4 0 1], last := (4, 1) }
      bp_br := { first := (4, 0), steps := [.row 4 0 11], last := (4, 11) } } }

/-- Journal iteration 828; certificate b2ec9cd0d54f78991c2dfe4e54afadeaca52150791a6fde180978da59b119f0d. -/
def record98 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {4, 10} },
      { center := 2, support := {4, 10} },
      { center := 4, support := {0, 7} },
      { center := 10, support := {0, 2, 7} }
    ]
    data := {
      p := 0
      q := 2
      r := 7
      a := 4
      b := 10
      ap_aq := { first := (4, 0), steps := [.flip 4 0, .row 0 4 10, .flip 0 10, .row 10 0 2, .flip 10 2, .row 2 10 4, .flip 2 4], last := (4, 2) }
      ap_ar := { first := (4, 0), steps := [.row 4 0 7], last := (4, 7) }
      bp_bq := { first := (10, 0), steps := [.row 10 0 2], last := (10, 2) }
      bp_br := { first := (10, 0), steps := [.row 10 0 7], last := (10, 7) } } }

/-- Journal iteration 829; certificate 90872021f48ce5ccb74cb4d90493e03a265f9470137d5625f988cade91f54574. -/
def record99 : DuplicateCenterNogood Label :=
  { choices := [
      { center := 0, support := {3, 5} },
      { center := 3, support := {0, 5} },
      { center := 5, support := {0, 1} },
      { center := 9, support := {0, 1, 3} }
    ]
    data := {
      p := 0
      q := 1
      r := 3
      a := 5
      b := 9
      ap_aq := { first := (5, 0), steps := [.row 5 0 1], last := (5, 1) }
      ap_ar := { first := (5, 0), steps := [.flip 5 0, .row 0 5 3, .flip 0 3, .row 3 0 5, .flip 3 5], last := (5, 3) }
      bp_bq := { first := (9, 0), steps := [.row 9 0 1], last := (9, 1) }
      bp_br := { first := (9, 0), steps := [.row 9 0 3], last := (9, 3) } } }

def bank : List (DuplicateCenterNogood Label) :=
  [record75, record76, record77, record78, record79, record80, record81, record82, record83, record84, record85, record86, record87, record88, record89, record90, record91, record92, record93, record94, record95, record96, record97, record98, record99]

def bankCheck : Bool := bank.all fun nogood => nogood.check

theorem bankCheck_true : bankCheck = true := by
  native_decide

theorem bank_valid : ∀ nogood ∈ bank, nogood.check = true := by
  apply List.all_eq_true.mp
  simpa [bankCheck] using bankCheck_true

end Problem97.ATailFrontierLiveClosure.ExactTwelveDuplicateCenterMembershipPilotShards.Part_004
