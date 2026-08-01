/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Phase3DuplicateCenterCertificate

/-!
# A checked duplicate-center core on labels 0, 1, 2, 4, 5, and 6

This module banks the exact fourteen selected-row memberships in the learned
clause with SHA-256
`eaf997a3a2a5f8b46576ae6e604b6e79744c62cc64353269f7b046476462e083`.
The corresponding duplicate-center certificate has nogood SHA-256
`a951a0c64cc3794dc9f5bf2d3bb1ef7773d4132c5d224e1dd07c2e95c8400779`.

The result is local to this concrete row pattern. It does not prove that every
Phase-3 assignment contains this pattern, nor does it connect the pattern to a
live `FaithfulCarrierPattern`.
-/

namespace Problem97
namespace Phase3DuplicateCenterA2B5P0Q1R6

open Census554.EqualityCore
open Phase3DuplicateCenterCertificate
open scoped EuclideanGeometry

def learnedClauseSha256 : String :=
  "eaf997a3a2a5f8b46576ae6e604b6e79744c62cc64353269f7b046476462e083"

def certificateNogoodSha256 : String :=
  "a951a0c64cc3794dc9f5bf2d3bb1ef7773d4132c5d224e1dd07c2e95c8400779"

/-- The exact fourteen positive row-membership antecedents negated by the
learned clause. -/
def membershipPattern : RowPattern Label :=
![
  {1, 4},
  {0, 5},
  {0, 1, 6},
  {},
  {0, 5, 6},
  {0, 4},
  {4, 5},
  {},
  {},
  {}
]

/-- The concrete closure paths make centers 2 and 5 equidistant from the same
three labels 0, 1, and 6. -/
def certificate : DuplicateCenterCertificate := {
  p := 0
  q := 1
  r := 6
  a := 2
  b := 5
  ap_aq := {
    first := (2, 0)
    last := (2, 1)
    steps := [
      .row 2 0 1
    ]
  }
  ap_ar := {
    first := (2, 0)
    last := (2, 6)
    steps := [
      .row 2 0 6
    ]
  }
  bp_bq := {
    first := (5, 0)
    last := (5, 1)
    steps := [
      .row 5 0 4,
      .flip 5 4,
      .row 4 5 0,
      .flip 4 0,
      .row 0 4 1,
      .flip 0 1,
      .row 1 0 5,
      .flip 1 5
    ]
  }
  bp_br := {
    first := (5, 0)
    last := (5, 6)
    steps := [
      .row 5 0 4,
      .flip 5 4,
      .row 4 5 6,
      .flip 4 6,
      .row 6 4 5,
      .flip 6 5
    ]
  }
}

/-- The banked pattern contains exactly the fourteen clause antecedents. -/
theorem membershipPattern_card :
    ∑ center, (membershipPattern center).card = 14 := by
  decide

/-- The concrete duplicate-center certificate reduces successfully. -/
theorem certificate_check :
    certificate.check membershipPattern = true := by
  decide

/-- The exact fourteen row memberships rule out an injective planar
realization. -/
theorem not_realizes :
    ¬ ∃ pointOf : Label → ℝ², Realizes membershipPattern pointOf :=
  certificate.not_realizes_of_check certificate_check

end Phase3DuplicateCenterA2B5P0Q1R6
end Problem97
