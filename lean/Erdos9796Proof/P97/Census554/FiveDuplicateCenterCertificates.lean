/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Phase3DuplicateCenterCertificate

/-!
# Five checked duplicate-center certificates from the offline 2,875-model sweep

This module banks the five equality duplicate-center certificates found by the
exact offline classification of the formerly unclassified models. The named
SHA-256 strings identify the projected clauses in the sweep artifact; they are
provenance metadata, while each `certificate_check` theorem below is the
kernel-checked validation of the corresponding concrete path data.

The results are local to these five row patterns. They do not prove that every
live Phase-3 assignment contains one of the patterns, nor do they supply a
`FaithfulCarrierPattern` adapter or close Problem 97.
-/

namespace Problem97
namespace Census554
namespace FiveDuplicateCenterCertificates

open EqualityCore
open Phase3DuplicateCenterCertificate
open scoped EuclideanGeometry

def sourceSweepSha256 : String :=
  "1786357d5c13a16bd105d606ccc3f95bc5fbf9d8f3ac396a118a69d42ffd41fa"

def cube08ClauseSha256 : String :=
  "6f3e4142af8f1d88518a31146959210b5eb21827ca358fac87469b886c11301e"

def cube09ClauseSha256 : String :=
  "8e8f7c0903030fbf78ac69f4e92226554c643f09fdb86c20205ba7d716b08bf6"

def cube16ClauseSha256 : String :=
  "f014051747ec20538854b24f0f1f41d058c8dfe7a742bdc11681271f2d4cbe27"

def cube17ClauseSha256 : String :=
  "a3526b9958a57abfb56fffc96ec95900223368060cc4e8a0d4584a96a4ec4302"

def cube18ClauseSha256 : String :=
  "c2480021d5f51a346d63d897d5c6e5fcb67eafadfc34dd5f63da51b661b6ad81"

/- Cube 8: triple `(0, 1, 3)`, centers `2` and `8`. -/

def cube08MembershipPattern : RowPattern Label :=
![
  {2, 7, 8},
  {3, 7, 8},
  {1, 4},
  {1, 2, 8},
  {2, 7},
  {},
  {},
  {0, 1, 4},
  {},
  {}
]

def cube08Certificate : DuplicateCenterCertificate := {
  p := 0
  q := 1
  r := 3
  a := 2
  b := 8
  ap_aq := {
    first := (2, 0)
    last := (2, 1)
    steps := [
      .flip 2 0,
      .row 0 2 7,
      .flip 0 7,
      .row 7 0 4,
      .flip 7 4,
      .row 4 7 2,
      .flip 4 2,
      .row 2 4 1
    ]
  }
  ap_ar := {
    first := (2, 0)
    last := (2, 3)
    steps := [
      .flip 2 0,
      .row 0 2 7,
      .flip 0 7,
      .row 7 0 1,
      .flip 7 1,
      .row 1 7 3,
      .flip 1 3,
      .row 3 1 2,
      .flip 3 2
    ]
  }
  bp_bq := {
    first := (8, 0)
    last := (8, 1)
    steps := [
      .flip 8 0,
      .row 0 8 7,
      .flip 0 7,
      .row 7 0 1,
      .flip 7 1,
      .row 1 7 8,
      .flip 1 8
    ]
  }
  bp_br := {
    first := (8, 0)
    last := (8, 3)
    steps := [
      .flip 8 0,
      .row 0 8 7,
      .flip 0 7,
      .row 7 0 1,
      .flip 7 1,
      .row 1 7 3,
      .flip 1 3,
      .row 3 1 8,
      .flip 3 8
    ]
  }
}

theorem cube08MembershipPattern_card :
    ∑ center, (cube08MembershipPattern center).card = 16 := by
  decide

theorem cube08Certificate_check :
    cube08Certificate.check cube08MembershipPattern = true := by
  decide

theorem cube08_not_realizes :
    ¬ ∃ pointOf : Label → ℝ², Realizes cube08MembershipPattern pointOf :=
  cube08Certificate.not_realizes_of_check cube08Certificate_check

/- Cube 9: triple `(0, 1, 2)`, centers `3` and `7`. -/

def cube09MembershipPattern : RowPattern Label :=
![
  {2, 3},
  {3, 4},
  {0, 3, 4},
  {},
  {1, 2},
  {},
  {},
  {0, 1, 2},
  {},
  {}
]

def cube09Certificate : DuplicateCenterCertificate := {
  p := 0
  q := 1
  r := 2
  a := 3
  b := 7
  ap_aq := {
    first := (3, 0)
    last := (3, 1)
    steps := [
      .flip 3 0,
      .row 0 3 2,
      .flip 0 2,
      .row 2 0 4,
      .flip 2 4,
      .row 4 2 1,
      .flip 4 1,
      .row 1 4 3,
      .flip 1 3
    ]
  }
  ap_ar := {
    first := (3, 0)
    last := (3, 2)
    steps := [
      .flip 3 0,
      .row 0 3 2,
      .flip 0 2,
      .row 2 0 3,
      .flip 2 3
    ]
  }
  bp_bq := {
    first := (7, 0)
    last := (7, 1)
    steps := [
      .row 7 0 1
    ]
  }
  bp_br := {
    first := (7, 0)
    last := (7, 2)
    steps := [
      .row 7 0 2
    ]
  }
}

theorem cube09MembershipPattern_card :
    ∑ center, (cube09MembershipPattern center).card = 12 := by
  decide

theorem cube09Certificate_check :
    cube09Certificate.check cube09MembershipPattern = true := by
  decide

theorem cube09_not_realizes :
    ¬ ∃ pointOf : Label → ℝ², Realizes cube09MembershipPattern pointOf :=
  cube09Certificate.not_realizes_of_check cube09Certificate_check

/- Cube 16: triple `(0, 1, 4)`, centers `6` and `7`. -/

def cube16MembershipPattern : RowPattern Label :=
![
  {5, 6},
  {},
  {},
  {},
  {},
  {0, 6},
  {1, 4, 5},
  {0, 1, 4},
  {},
  {}
]

def cube16Certificate : DuplicateCenterCertificate := {
  p := 0
  q := 1
  r := 4
  a := 6
  b := 7
  ap_aq := {
    first := (6, 0)
    last := (6, 1)
    steps := [
      .flip 6 0,
      .row 0 6 5,
      .flip 0 5,
      .row 5 0 6,
      .flip 5 6,
      .row 6 5 1
    ]
  }
  ap_ar := {
    first := (6, 0)
    last := (6, 4)
    steps := [
      .flip 6 0,
      .row 0 6 5,
      .flip 0 5,
      .row 5 0 6,
      .flip 5 6,
      .row 6 5 4
    ]
  }
  bp_bq := {
    first := (7, 0)
    last := (7, 1)
    steps := [
      .row 7 0 1
    ]
  }
  bp_br := {
    first := (7, 0)
    last := (7, 4)
    steps := [
      .row 7 0 4
    ]
  }
}

theorem cube16MembershipPattern_card :
    ∑ center, (cube16MembershipPattern center).card = 10 := by
  decide

theorem cube16Certificate_check :
    cube16Certificate.check cube16MembershipPattern = true := by
  decide

theorem cube16_not_realizes :
    ¬ ∃ pointOf : Label → ℝ², Realizes cube16MembershipPattern pointOf :=
  cube16Certificate.not_realizes_of_check cube16Certificate_check

/- Cube 17: triple `(0, 1, 2)`, centers `3` and `7`. -/

def cube17MembershipPattern : RowPattern Label :=
![
  {3, 7, 8},
  {7, 8},
  {3, 7},
  {1, 2, 8},
  {},
  {},
  {},
  {},
  {0, 1, 3},
  {}
]

def cube17Certificate : DuplicateCenterCertificate := {
  p := 0
  q := 1
  r := 2
  a := 3
  b := 7
  ap_aq := {
    first := (3, 0)
    last := (3, 1)
    steps := [
      .flip 3 0,
      .row 0 3 8,
      .flip 0 8,
      .row 8 0 3,
      .flip 8 3,
      .row 3 8 1
    ]
  }
  ap_ar := {
    first := (3, 0)
    last := (3, 2)
    steps := [
      .flip 3 0,
      .row 0 3 8,
      .flip 0 8,
      .row 8 0 3,
      .flip 8 3,
      .row 3 8 2
    ]
  }
  bp_bq := {
    first := (7, 0)
    last := (7, 1)
    steps := [
      .flip 7 0,
      .row 0 7 8,
      .flip 0 8,
      .row 8 0 1,
      .flip 8 1,
      .row 1 8 7,
      .flip 1 7
    ]
  }
  bp_br := {
    first := (7, 0)
    last := (7, 2)
    steps := [
      .flip 7 0,
      .row 0 7 8,
      .flip 0 8,
      .row 8 0 3,
      .flip 8 3,
      .row 3 8 2,
      .flip 3 2,
      .row 2 3 7,
      .flip 2 7
    ]
  }
}

theorem cube17MembershipPattern_card :
    ∑ center, (cube17MembershipPattern center).card = 13 := by
  decide

theorem cube17Certificate_check :
    cube17Certificate.check cube17MembershipPattern = true := by
  decide

theorem cube17_not_realizes :
    ¬ ∃ pointOf : Label → ℝ², Realizes cube17MembershipPattern pointOf :=
  cube17Certificate.not_realizes_of_check cube17Certificate_check

/- Cube 18: triple `(0, 3, 4)`, centers `2` and `6`. -/

def cube18MembershipPattern : RowPattern Label :=
![
  {2, 7},
  {},
  {4, 9},
  {2, 9},
  {2, 6, 7},
  {},
  {0, 3, 9},
  {0, 4},
  {},
  {2, 3, 6}
]

def cube18Certificate : DuplicateCenterCertificate := {
  p := 0
  q := 3
  r := 4
  a := 2
  b := 6
  ap_aq := {
    first := (2, 0)
    last := (2, 3)
    steps := [
      .flip 2 0,
      .row 0 2 7,
      .flip 0 7,
      .row 7 0 4,
      .flip 7 4,
      .row 4 7 2,
      .flip 4 2,
      .row 2 4 9,
      .flip 2 9,
      .row 9 2 3,
      .flip 9 3,
      .row 3 9 2,
      .flip 3 2
    ]
  }
  ap_ar := {
    first := (2, 0)
    last := (2, 4)
    steps := [
      .flip 2 0,
      .row 0 2 7,
      .flip 0 7,
      .row 7 0 4,
      .flip 7 4,
      .row 4 7 2,
      .flip 4 2
    ]
  }
  bp_bq := {
    first := (6, 0)
    last := (6, 3)
    steps := [
      .row 6 0 3
    ]
  }
  bp_br := {
    first := (6, 0)
    last := (6, 4)
    steps := [
      .row 6 0 9,
      .flip 6 9,
      .row 9 6 2,
      .flip 9 2,
      .row 2 9 4,
      .flip 2 4,
      .row 4 2 6,
      .flip 4 6
    ]
  }
}

theorem cube18MembershipPattern_card :
    ∑ center, (cube18MembershipPattern center).card = 17 := by
  decide

theorem cube18Certificate_check :
    cube18Certificate.check cube18MembershipPattern = true := by
  decide

theorem cube18_not_realizes :
    ¬ ∃ pointOf : Label → ℝ², Realizes cube18MembershipPattern pointOf :=
  cube18Certificate.not_realizes_of_check cube18Certificate_check

/-- All five concrete projected-clause patterns are nonrealizable. This is only
an aggregate certificate-bank theorem; it does not assert coverage. -/
theorem allFive_not_realizes :
    (¬ ∃ pointOf : Label → ℝ², Realizes cube08MembershipPattern pointOf) ∧
    (¬ ∃ pointOf : Label → ℝ², Realizes cube09MembershipPattern pointOf) ∧
    (¬ ∃ pointOf : Label → ℝ², Realizes cube16MembershipPattern pointOf) ∧
    (¬ ∃ pointOf : Label → ℝ², Realizes cube17MembershipPattern pointOf) ∧
    (¬ ∃ pointOf : Label → ℝ², Realizes cube18MembershipPattern pointOf) :=
  ⟨cube08_not_realizes, cube09_not_realizes, cube16_not_realizes,
    cube17_not_realizes, cube18_not_realizes⟩

end FiveDuplicateCenterCertificates
end Census554
end Problem97
