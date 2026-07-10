/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NNNYN, term block 18:0-99

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NNNYNTermShards

/-- Generator polynomial 18 for relaxed split surplus certificate `R009:u=v:R009NNNYN`. -/
def rs_R009_ueqv_R009NNNYN_generator_18_0000_0099 : Poly :=
[
  term (2 : Rat) [(6, 1), (8, 1)],
  term (2 : Rat) [(7, 1), (9, 1)],
  term (-1 : Rat) [(8, 2)],
  term (-1 : Rat) [(9, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0000 : Poly :=
[
  term ((-125 : Rat) / 536) []
]

/-- Partial product 0 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0000 : Poly :=
[
  term ((-125 : Rat) / 268) [(6, 1), (8, 1)],
  term ((-125 : Rat) / 268) [(7, 1), (9, 1)],
  term ((125 : Rat) / 536) [(8, 2)],
  term ((125 : Rat) / 536) [(9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0000_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0000
        rs_R009_ueqv_R009NNNYN_generator_18_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_18_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0001 : Poly :=
[
  term ((4429690496 : Rat) / 110226591) [(0, 1), (9, 1), (11, 1)]
]

/-- Partial product 1 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0001 : Poly :=
[
  term ((8859380992 : Rat) / 110226591) [(0, 1), (6, 1), (8, 1), (9, 1), (11, 1)],
  term ((8859380992 : Rat) / 110226591) [(0, 1), (7, 1), (9, 2), (11, 1)],
  term ((-4429690496 : Rat) / 110226591) [(0, 1), (8, 2), (9, 1), (11, 1)],
  term ((-4429690496 : Rat) / 110226591) [(0, 1), (9, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0001_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0001
        rs_R009_ueqv_R009NNNYN_generator_18_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_18_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0002 : Poly :=
[
  term ((207641742 : Rat) / 12247399) [(0, 1), (9, 1), (13, 1)]
]

/-- Partial product 2 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0002 : Poly :=
[
  term ((415283484 : Rat) / 12247399) [(0, 1), (6, 1), (8, 1), (9, 1), (13, 1)],
  term ((415283484 : Rat) / 12247399) [(0, 1), (7, 1), (9, 2), (13, 1)],
  term ((-207641742 : Rat) / 12247399) [(0, 1), (8, 2), (9, 1), (13, 1)],
  term ((-207641742 : Rat) / 12247399) [(0, 1), (9, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0002_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0002
        rs_R009_ueqv_R009NNNYN_generator_18_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_18_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0003 : Poly :=
[
  term ((-3994631608 : Rat) / 110226591) [(0, 1), (9, 1), (15, 1)]
]

/-- Partial product 3 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0003 : Poly :=
[
  term ((-7989263216 : Rat) / 110226591) [(0, 1), (6, 1), (8, 1), (9, 1), (15, 1)],
  term ((-7989263216 : Rat) / 110226591) [(0, 1), (7, 1), (9, 2), (15, 1)],
  term ((3994631608 : Rat) / 110226591) [(0, 1), (8, 2), (9, 1), (15, 1)],
  term ((3994631608 : Rat) / 110226591) [(0, 1), (9, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0003_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0003
        rs_R009_ueqv_R009NNNYN_generator_18_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_18_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0004 : Poly :=
[
  term ((-13434125824 : Rat) / 330679773) [(0, 1), (11, 1), (13, 1)]
]

/-- Partial product 4 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0004 : Poly :=
[
  term ((-26868251648 : Rat) / 330679773) [(0, 1), (6, 1), (8, 1), (11, 1), (13, 1)],
  term ((-26868251648 : Rat) / 330679773) [(0, 1), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((13434125824 : Rat) / 330679773) [(0, 1), (8, 2), (11, 1), (13, 1)],
  term ((13434125824 : Rat) / 330679773) [(0, 1), (9, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0004_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0004
        rs_R009_ueqv_R009NNNYN_generator_18_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_18_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0005 : Poly :=
[
  term ((12114702752 : Rat) / 330679773) [(0, 1), (13, 1), (15, 1)]
]

/-- Partial product 5 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0005 : Poly :=
[
  term ((24229405504 : Rat) / 330679773) [(0, 1), (6, 1), (8, 1), (13, 1), (15, 1)],
  term ((24229405504 : Rat) / 330679773) [(0, 1), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((-12114702752 : Rat) / 330679773) [(0, 1), (8, 2), (13, 1), (15, 1)],
  term ((-12114702752 : Rat) / 330679773) [(0, 1), (9, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0005_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0005
        rs_R009_ueqv_R009NNNYN_generator_18_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_18_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0006 : Poly :=
[
  term ((-209908216 : Rat) / 12247399) [(0, 1), (13, 2)]
]

/-- Partial product 6 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0006 : Poly :=
[
  term ((-419816432 : Rat) / 12247399) [(0, 1), (6, 1), (8, 1), (13, 2)],
  term ((-419816432 : Rat) / 12247399) [(0, 1), (7, 1), (9, 1), (13, 2)],
  term ((209908216 : Rat) / 12247399) [(0, 1), (8, 2), (13, 2)],
  term ((209908216 : Rat) / 12247399) [(0, 1), (9, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0006_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0006
        rs_R009_ueqv_R009NNNYN_generator_18_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_18_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0007 : Poly :=
[
  term ((334888960 : Rat) / 110226591) [(1, 1), (2, 1), (11, 1)]
]

/-- Partial product 7 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0007 : Poly :=
[
  term ((669777920 : Rat) / 110226591) [(1, 1), (2, 1), (6, 1), (8, 1), (11, 1)],
  term ((669777920 : Rat) / 110226591) [(1, 1), (2, 1), (7, 1), (9, 1), (11, 1)],
  term ((-334888960 : Rat) / 110226591) [(1, 1), (2, 1), (8, 2), (11, 1)],
  term ((-334888960 : Rat) / 110226591) [(1, 1), (2, 1), (9, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0007_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0007
        rs_R009_ueqv_R009NNNYN_generator_18_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_18_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0008 : Poly :=
[
  term ((15697920 : Rat) / 12247399) [(1, 1), (2, 1), (13, 1)]
]

/-- Partial product 8 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0008 : Poly :=
[
  term ((31395840 : Rat) / 12247399) [(1, 1), (2, 1), (6, 1), (8, 1), (13, 1)],
  term ((31395840 : Rat) / 12247399) [(1, 1), (2, 1), (7, 1), (9, 1), (13, 1)],
  term ((-15697920 : Rat) / 12247399) [(1, 1), (2, 1), (8, 2), (13, 1)],
  term ((-15697920 : Rat) / 12247399) [(1, 1), (2, 1), (9, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0008_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0008
        rs_R009_ueqv_R009NNNYN_generator_18_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_18_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0009 : Poly :=
[
  term ((-301998080 : Rat) / 110226591) [(1, 1), (2, 1), (15, 1)]
]

/-- Partial product 9 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0009 : Poly :=
[
  term ((-603996160 : Rat) / 110226591) [(1, 1), (2, 1), (6, 1), (8, 1), (15, 1)],
  term ((-603996160 : Rat) / 110226591) [(1, 1), (2, 1), (7, 1), (9, 1), (15, 1)],
  term ((301998080 : Rat) / 110226591) [(1, 1), (2, 1), (8, 2), (15, 1)],
  term ((301998080 : Rat) / 110226591) [(1, 1), (2, 1), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0009_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0009
        rs_R009_ueqv_R009NNNYN_generator_18_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_18_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0010 : Poly :=
[
  term ((-34033664 : Rat) / 182797) [(1, 1), (5, 1), (11, 1), (13, 1)]
]

/-- Partial product 10 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0010 : Poly :=
[
  term ((-68067328 : Rat) / 182797) [(1, 1), (5, 1), (6, 1), (8, 1), (11, 1), (13, 1)],
  term ((-68067328 : Rat) / 182797) [(1, 1), (5, 1), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((34033664 : Rat) / 182797) [(1, 1), (5, 1), (8, 2), (11, 1), (13, 1)],
  term ((34033664 : Rat) / 182797) [(1, 1), (5, 1), (9, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0010_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0010
        rs_R009_ueqv_R009NNNYN_generator_18_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_18_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0011 : Poly :=
[
  term ((1951010752 : Rat) / 12247399) [(1, 1), (5, 1), (13, 1), (15, 1)]
]

/-- Partial product 11 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0011 : Poly :=
[
  term ((3902021504 : Rat) / 12247399) [(1, 1), (5, 1), (6, 1), (8, 1), (13, 1), (15, 1)],
  term ((3902021504 : Rat) / 12247399) [(1, 1), (5, 1), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((-1951010752 : Rat) / 12247399) [(1, 1), (5, 1), (8, 2), (13, 1), (15, 1)],
  term ((-1951010752 : Rat) / 12247399) [(1, 1), (5, 1), (9, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0011_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0011
        rs_R009_ueqv_R009NNNYN_generator_18_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_18_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0012 : Poly :=
[
  term ((-14357952 : Rat) / 182797) [(1, 1), (5, 1), (13, 2)]
]

/-- Partial product 12 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0012 : Poly :=
[
  term ((-28715904 : Rat) / 182797) [(1, 1), (5, 1), (6, 1), (8, 1), (13, 2)],
  term ((-28715904 : Rat) / 182797) [(1, 1), (5, 1), (7, 1), (9, 1), (13, 2)],
  term ((14357952 : Rat) / 182797) [(1, 1), (5, 1), (8, 2), (13, 2)],
  term ((14357952 : Rat) / 182797) [(1, 1), (5, 1), (9, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0012_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0012
        rs_R009_ueqv_R009NNNYN_generator_18_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_18_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0013 : Poly :=
[
  term ((-54 : Rat) / 67) [(1, 1), (9, 1)]
]

/-- Partial product 13 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0013 : Poly :=
[
  term ((-108 : Rat) / 67) [(1, 1), (6, 1), (8, 1), (9, 1)],
  term ((-108 : Rat) / 67) [(1, 1), (7, 1), (9, 2)],
  term ((54 : Rat) / 67) [(1, 1), (8, 2), (9, 1)],
  term ((54 : Rat) / 67) [(1, 1), (9, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0013_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0013
        rs_R009_ueqv_R009NNNYN_generator_18_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_18_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0014 : Poly :=
[
  term ((17016832 : Rat) / 182797) [(1, 1), (9, 1), (11, 1), (13, 1)]
]

/-- Partial product 14 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0014 : Poly :=
[
  term ((34033664 : Rat) / 182797) [(1, 1), (6, 1), (8, 1), (9, 1), (11, 1), (13, 1)],
  term ((34033664 : Rat) / 182797) [(1, 1), (7, 1), (9, 2), (11, 1), (13, 1)],
  term ((-17016832 : Rat) / 182797) [(1, 1), (8, 2), (9, 1), (11, 1), (13, 1)],
  term ((-17016832 : Rat) / 182797) [(1, 1), (9, 3), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0014_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0014
        rs_R009_ueqv_R009NNNYN_generator_18_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_18_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0015 : Poly :=
[
  term ((-975505376 : Rat) / 12247399) [(1, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 15 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0015 : Poly :=
[
  term ((-1951010752 : Rat) / 12247399) [(1, 1), (6, 1), (8, 1), (9, 1), (13, 1), (15, 1)],
  term ((-1951010752 : Rat) / 12247399) [(1, 1), (7, 1), (9, 2), (13, 1), (15, 1)],
  term ((975505376 : Rat) / 12247399) [(1, 1), (8, 2), (9, 1), (13, 1), (15, 1)],
  term ((975505376 : Rat) / 12247399) [(1, 1), (9, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0015_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0015
        rs_R009_ueqv_R009NNNYN_generator_18_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_18_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0016 : Poly :=
[
  term ((7178976 : Rat) / 182797) [(1, 1), (9, 1), (13, 2)]
]

/-- Partial product 16 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0016 : Poly :=
[
  term ((14357952 : Rat) / 182797) [(1, 1), (6, 1), (8, 1), (9, 1), (13, 2)],
  term ((14357952 : Rat) / 182797) [(1, 1), (7, 1), (9, 2), (13, 2)],
  term ((-7178976 : Rat) / 182797) [(1, 1), (8, 2), (9, 1), (13, 2)],
  term ((-7178976 : Rat) / 182797) [(1, 1), (9, 3), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0016_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0016
        rs_R009_ueqv_R009NNNYN_generator_18_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_18_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0017 : Poly :=
[
  term ((-1290205715456 : Rat) / 31414578435) [(1, 1), (10, 1), (11, 1)]
]

/-- Partial product 17 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0017 : Poly :=
[
  term ((-2580411430912 : Rat) / 31414578435) [(1, 1), (6, 1), (8, 1), (10, 1), (11, 1)],
  term ((-2580411430912 : Rat) / 31414578435) [(1, 1), (7, 1), (9, 1), (10, 1), (11, 1)],
  term ((1290205715456 : Rat) / 31414578435) [(1, 1), (8, 2), (10, 1), (11, 1)],
  term ((1290205715456 : Rat) / 31414578435) [(1, 1), (9, 2), (10, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0017_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0017
        rs_R009_ueqv_R009NNNYN_generator_18_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_18_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0018 : Poly :=
[
  term ((-20159464304 : Rat) / 1163502905) [(1, 1), (10, 1), (13, 1)]
]

/-- Partial product 18 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0018 : Poly :=
[
  term ((-40318928608 : Rat) / 1163502905) [(1, 1), (6, 1), (8, 1), (10, 1), (13, 1)],
  term ((-40318928608 : Rat) / 1163502905) [(1, 1), (7, 1), (9, 1), (10, 1), (13, 1)],
  term ((20159464304 : Rat) / 1163502905) [(1, 1), (8, 2), (10, 1), (13, 1)],
  term ((20159464304 : Rat) / 1163502905) [(1, 1), (9, 2), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0018_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0018
        rs_R009_ueqv_R009NNNYN_generator_18_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_18_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0019 : Poly :=
[
  term ((1163489082688 : Rat) / 31414578435) [(1, 1), (10, 1), (15, 1)]
]

/-- Partial product 19 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0019 : Poly :=
[
  term ((2326978165376 : Rat) / 31414578435) [(1, 1), (6, 1), (8, 1), (10, 1), (15, 1)],
  term ((2326978165376 : Rat) / 31414578435) [(1, 1), (7, 1), (9, 1), (10, 1), (15, 1)],
  term ((-1163489082688 : Rat) / 31414578435) [(1, 1), (8, 2), (10, 1), (15, 1)],
  term ((-1163489082688 : Rat) / 31414578435) [(1, 1), (9, 2), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0019_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0019
        rs_R009_ueqv_R009NNNYN_generator_18_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_18_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0020 : Poly :=
[
  term ((6166162075096 : Rat) / 94243735305) [(1, 1), (11, 1)]
]

/-- Partial product 20 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0020 : Poly :=
[
  term ((12332324150192 : Rat) / 94243735305) [(1, 1), (6, 1), (8, 1), (11, 1)],
  term ((12332324150192 : Rat) / 94243735305) [(1, 1), (7, 1), (9, 1), (11, 1)],
  term ((-6166162075096 : Rat) / 94243735305) [(1, 1), (8, 2), (11, 1)],
  term ((-6166162075096 : Rat) / 94243735305) [(1, 1), (9, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0020_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0020
        rs_R009_ueqv_R009NNNYN_generator_18_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_18_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0021 : Poly :=
[
  term ((-9372783616 : Rat) / 110226591) [(1, 1), (11, 1), (12, 1)]
]

/-- Partial product 21 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0021 : Poly :=
[
  term ((-18745567232 : Rat) / 110226591) [(1, 1), (6, 1), (8, 1), (11, 1), (12, 1)],
  term ((-18745567232 : Rat) / 110226591) [(1, 1), (7, 1), (9, 1), (11, 1), (12, 1)],
  term ((9372783616 : Rat) / 110226591) [(1, 1), (8, 2), (11, 1), (12, 1)],
  term ((9372783616 : Rat) / 110226591) [(1, 1), (9, 2), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0021_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0021
        rs_R009_ueqv_R009NNNYN_generator_18_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_18_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0022 : Poly :=
[
  term ((-19496960 : Rat) / 110226591) [(1, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 22 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0022 : Poly :=
[
  term ((-38993920 : Rat) / 110226591) [(1, 1), (6, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((-38993920 : Rat) / 110226591) [(1, 1), (7, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((19496960 : Rat) / 110226591) [(1, 1), (8, 2), (11, 1), (13, 1), (15, 1)],
  term ((19496960 : Rat) / 110226591) [(1, 1), (9, 2), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0022_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0022
        rs_R009_ueqv_R009NNNYN_generator_18_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_18_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0023 : Poly :=
[
  term ((773448704 : Rat) / 330679773) [(1, 1), (11, 1), (14, 1)]
]

/-- Partial product 23 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0023 : Poly :=
[
  term ((1546897408 : Rat) / 330679773) [(1, 1), (6, 1), (8, 1), (11, 1), (14, 1)],
  term ((1546897408 : Rat) / 330679773) [(1, 1), (7, 1), (9, 1), (11, 1), (14, 1)],
  term ((-773448704 : Rat) / 330679773) [(1, 1), (8, 2), (11, 1), (14, 1)],
  term ((-773448704 : Rat) / 330679773) [(1, 1), (9, 2), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0023_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0023
        rs_R009_ueqv_R009NNNYN_generator_18_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_18_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0024 : Poly :=
[
  term ((-48742400 : Rat) / 110226591) [(1, 1), (11, 1), (15, 2)]
]

/-- Partial product 24 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0024 : Poly :=
[
  term ((-97484800 : Rat) / 110226591) [(1, 1), (6, 1), (8, 1), (11, 1), (15, 2)],
  term ((-97484800 : Rat) / 110226591) [(1, 1), (7, 1), (9, 1), (11, 1), (15, 2)],
  term ((48742400 : Rat) / 110226591) [(1, 1), (8, 2), (11, 1), (15, 2)],
  term ((48742400 : Rat) / 110226591) [(1, 1), (9, 2), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0024_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0024
        rs_R009_ueqv_R009NNNYN_generator_18_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_18_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0025 : Poly :=
[
  term ((-439349232 : Rat) / 12247399) [(1, 1), (12, 1), (13, 1)]
]

/-- Partial product 25 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0025 : Poly :=
[
  term ((-878698464 : Rat) / 12247399) [(1, 1), (6, 1), (8, 1), (12, 1), (13, 1)],
  term ((-878698464 : Rat) / 12247399) [(1, 1), (7, 1), (9, 1), (12, 1), (13, 1)],
  term ((439349232 : Rat) / 12247399) [(1, 1), (8, 2), (12, 1), (13, 1)],
  term ((439349232 : Rat) / 12247399) [(1, 1), (9, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0025_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0025
        rs_R009_ueqv_R009NNNYN_generator_18_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_18_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0026 : Poly :=
[
  term ((8215337456 : Rat) / 110226591) [(1, 1), (12, 1), (15, 1)]
]

/-- Partial product 26 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0026 : Poly :=
[
  term ((16430674912 : Rat) / 110226591) [(1, 1), (6, 1), (8, 1), (12, 1), (15, 1)],
  term ((16430674912 : Rat) / 110226591) [(1, 1), (7, 1), (9, 1), (12, 1), (15, 1)],
  term ((-8215337456 : Rat) / 110226591) [(1, 1), (8, 2), (12, 1), (15, 1)],
  term ((-8215337456 : Rat) / 110226591) [(1, 1), (9, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0026_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0026
        rs_R009_ueqv_R009NNNYN_generator_18_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_18_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0027 : Poly :=
[
  term ((98983700389 : Rat) / 3490508715) [(1, 1), (13, 1)]
]

/-- Partial product 27 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0027 : Poly :=
[
  term ((197967400778 : Rat) / 3490508715) [(1, 1), (6, 1), (8, 1), (13, 1)],
  term ((197967400778 : Rat) / 3490508715) [(1, 1), (7, 1), (9, 1), (13, 1)],
  term ((-98983700389 : Rat) / 3490508715) [(1, 1), (8, 2), (13, 1)],
  term ((-98983700389 : Rat) / 3490508715) [(1, 1), (9, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0027_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0027
        rs_R009_ueqv_R009NNNYN_generator_18_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_18_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0028 : Poly :=
[
  term ((12085136 : Rat) / 12247399) [(1, 1), (13, 1), (14, 1)]
]

/-- Partial product 28 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0028 : Poly :=
[
  term ((24170272 : Rat) / 12247399) [(1, 1), (6, 1), (8, 1), (13, 1), (14, 1)],
  term ((24170272 : Rat) / 12247399) [(1, 1), (7, 1), (9, 1), (13, 1), (14, 1)],
  term ((-12085136 : Rat) / 12247399) [(1, 1), (8, 2), (13, 1), (14, 1)],
  term ((-12085136 : Rat) / 12247399) [(1, 1), (9, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0028_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0028
        rs_R009_ueqv_R009NNNYN_generator_18_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_18_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0029 : Poly :=
[
  term ((-2981120 : Rat) / 110226591) [(1, 1), (13, 1), (15, 2)]
]

/-- Partial product 29 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0029 : Poly :=
[
  term ((-5962240 : Rat) / 110226591) [(1, 1), (6, 1), (8, 1), (13, 1), (15, 2)],
  term ((-5962240 : Rat) / 110226591) [(1, 1), (7, 1), (9, 1), (13, 1), (15, 2)],
  term ((2981120 : Rat) / 110226591) [(1, 1), (8, 2), (13, 1), (15, 2)],
  term ((2981120 : Rat) / 110226591) [(1, 1), (9, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0029_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0029
        rs_R009_ueqv_R009NNNYN_generator_18_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_18_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0030 : Poly :=
[
  term ((-913920 : Rat) / 12247399) [(1, 1), (13, 2), (15, 1)]
]

/-- Partial product 30 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0030 : Poly :=
[
  term ((-1827840 : Rat) / 12247399) [(1, 1), (6, 1), (8, 1), (13, 2), (15, 1)],
  term ((-1827840 : Rat) / 12247399) [(1, 1), (7, 1), (9, 1), (13, 2), (15, 1)],
  term ((913920 : Rat) / 12247399) [(1, 1), (8, 2), (13, 2), (15, 1)],
  term ((913920 : Rat) / 12247399) [(1, 1), (9, 2), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0030_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0030
        rs_R009_ueqv_R009NNNYN_generator_18_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_18_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0031 : Poly :=
[
  term ((-697484992 : Rat) / 330679773) [(1, 1), (14, 1), (15, 1)]
]

/-- Partial product 31 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0031 : Poly :=
[
  term ((-1394969984 : Rat) / 330679773) [(1, 1), (6, 1), (8, 1), (14, 1), (15, 1)],
  term ((-1394969984 : Rat) / 330679773) [(1, 1), (7, 1), (9, 1), (14, 1), (15, 1)],
  term ((697484992 : Rat) / 330679773) [(1, 1), (8, 2), (14, 1), (15, 1)],
  term ((697484992 : Rat) / 330679773) [(1, 1), (9, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0031_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0031
        rs_R009_ueqv_R009NNNYN_generator_18_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_18_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0032 : Poly :=
[
  term ((-5850622610978 : Rat) / 94243735305) [(1, 1), (15, 1)]
]

/-- Partial product 32 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0032 : Poly :=
[
  term ((-11701245221956 : Rat) / 94243735305) [(1, 1), (6, 1), (8, 1), (15, 1)],
  term ((-11701245221956 : Rat) / 94243735305) [(1, 1), (7, 1), (9, 1), (15, 1)],
  term ((5850622610978 : Rat) / 94243735305) [(1, 1), (8, 2), (15, 1)],
  term ((5850622610978 : Rat) / 94243735305) [(1, 1), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0032_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0032
        rs_R009_ueqv_R009NNNYN_generator_18_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_18_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0033 : Poly :=
[
  term ((43955200 : Rat) / 110226591) [(1, 1), (15, 3)]
]

/-- Partial product 33 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0033 : Poly :=
[
  term ((87910400 : Rat) / 110226591) [(1, 1), (6, 1), (8, 1), (15, 3)],
  term ((87910400 : Rat) / 110226591) [(1, 1), (7, 1), (9, 1), (15, 3)],
  term ((-43955200 : Rat) / 110226591) [(1, 1), (8, 2), (15, 3)],
  term ((-43955200 : Rat) / 110226591) [(1, 1), (9, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0033_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0033
        rs_R009_ueqv_R009NNNYN_generator_18_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_18_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0034 : Poly :=
[
  term ((-4761451520 : Rat) / 330679773) [(2, 1), (5, 1), (11, 1)]
]

/-- Partial product 34 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0034 : Poly :=
[
  term ((-9522903040 : Rat) / 330679773) [(2, 1), (5, 1), (6, 1), (8, 1), (11, 1)],
  term ((-9522903040 : Rat) / 330679773) [(2, 1), (5, 1), (7, 1), (9, 1), (11, 1)],
  term ((4761451520 : Rat) / 330679773) [(2, 1), (5, 1), (8, 2), (11, 1)],
  term ((4761451520 : Rat) / 330679773) [(2, 1), (5, 1), (9, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0034_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0034
        rs_R009_ueqv_R009NNNYN_generator_18_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_18_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0035 : Poly :=
[
  term ((-2685562880 : Rat) / 330679773) [(2, 1), (5, 1), (11, 1), (12, 1)]
]

/-- Partial product 35 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0035 : Poly :=
[
  term ((-5371125760 : Rat) / 330679773) [(2, 1), (5, 1), (6, 1), (8, 1), (11, 1), (12, 1)],
  term ((-5371125760 : Rat) / 330679773) [(2, 1), (5, 1), (7, 1), (9, 1), (11, 1), (12, 1)],
  term ((2685562880 : Rat) / 330679773) [(2, 1), (5, 1), (8, 2), (11, 1), (12, 1)],
  term ((2685562880 : Rat) / 330679773) [(2, 1), (5, 1), (9, 2), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0035_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0035
        rs_R009_ueqv_R009NNNYN_generator_18_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_18_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0036 : Poly :=
[
  term ((-6478151680 : Rat) / 330679773) [(2, 1), (5, 1), (11, 1), (14, 1)]
]

/-- Partial product 36 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0036 : Poly :=
[
  term ((-12956303360 : Rat) / 330679773) [(2, 1), (5, 1), (6, 1), (8, 1), (11, 1), (14, 1)],
  term ((-12956303360 : Rat) / 330679773) [(2, 1), (5, 1), (7, 1), (9, 1), (11, 1), (14, 1)],
  term ((6478151680 : Rat) / 330679773) [(2, 1), (5, 1), (8, 2), (11, 1), (14, 1)],
  term ((6478151680 : Rat) / 330679773) [(2, 1), (5, 1), (9, 2), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0036_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0036
        rs_R009_ueqv_R009NNNYN_generator_18_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_18_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0037 : Poly :=
[
  term ((-838369280 : Rat) / 110226591) [(2, 1), (5, 1), (11, 1), (15, 2)]
]

/-- Partial product 37 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0037 : Poly :=
[
  term ((-1676738560 : Rat) / 110226591) [(2, 1), (5, 1), (6, 1), (8, 1), (11, 1), (15, 2)],
  term ((-1676738560 : Rat) / 110226591) [(2, 1), (5, 1), (7, 1), (9, 1), (11, 1), (15, 2)],
  term ((838369280 : Rat) / 110226591) [(2, 1), (5, 1), (8, 2), (11, 1), (15, 2)],
  term ((838369280 : Rat) / 110226591) [(2, 1), (5, 1), (9, 2), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0037_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0037
        rs_R009_ueqv_R009NNNYN_generator_18_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_18_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0038 : Poly :=
[
  term ((-41961920 : Rat) / 12247399) [(2, 1), (5, 1), (12, 1), (13, 1)]
]

/-- Partial product 38 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0038 : Poly :=
[
  term ((-83923840 : Rat) / 12247399) [(2, 1), (5, 1), (6, 1), (8, 1), (12, 1), (13, 1)],
  term ((-83923840 : Rat) / 12247399) [(2, 1), (5, 1), (7, 1), (9, 1), (12, 1), (13, 1)],
  term ((41961920 : Rat) / 12247399) [(2, 1), (5, 1), (8, 2), (12, 1), (13, 1)],
  term ((41961920 : Rat) / 12247399) [(2, 1), (5, 1), (9, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0038_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0038
        rs_R009_ueqv_R009NNNYN_generator_18_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_18_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0039 : Poly :=
[
  term ((2421802240 : Rat) / 330679773) [(2, 1), (5, 1), (12, 1), (15, 1)]
]

/-- Partial product 39 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0039 : Poly :=
[
  term ((4843604480 : Rat) / 330679773) [(2, 1), (5, 1), (6, 1), (8, 1), (12, 1), (15, 1)],
  term ((4843604480 : Rat) / 330679773) [(2, 1), (5, 1), (7, 1), (9, 1), (12, 1), (15, 1)],
  term ((-2421802240 : Rat) / 330679773) [(2, 1), (5, 1), (8, 2), (12, 1), (15, 1)],
  term ((-2421802240 : Rat) / 330679773) [(2, 1), (5, 1), (9, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0039_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0039
        rs_R009_ueqv_R009NNNYN_generator_18_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_18_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0040 : Poly :=
[
  term ((-74397680 : Rat) / 12247399) [(2, 1), (5, 1), (13, 1)]
]

/-- Partial product 40 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0040 : Poly :=
[
  term ((-148795360 : Rat) / 12247399) [(2, 1), (5, 1), (6, 1), (8, 1), (13, 1)],
  term ((-148795360 : Rat) / 12247399) [(2, 1), (5, 1), (7, 1), (9, 1), (13, 1)],
  term ((74397680 : Rat) / 12247399) [(2, 1), (5, 1), (8, 2), (13, 1)],
  term ((74397680 : Rat) / 12247399) [(2, 1), (5, 1), (9, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0040_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0040
        rs_R009_ueqv_R009NNNYN_generator_18_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_18_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0041 : Poly :=
[
  term ((-101221120 : Rat) / 12247399) [(2, 1), (5, 1), (13, 1), (14, 1)]
]

/-- Partial product 41 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0041 : Poly :=
[
  term ((-202442240 : Rat) / 12247399) [(2, 1), (5, 1), (6, 1), (8, 1), (13, 1), (14, 1)],
  term ((-202442240 : Rat) / 12247399) [(2, 1), (5, 1), (7, 1), (9, 1), (13, 1), (14, 1)],
  term ((101221120 : Rat) / 12247399) [(2, 1), (5, 1), (8, 2), (13, 1), (14, 1)],
  term ((101221120 : Rat) / 12247399) [(2, 1), (5, 1), (9, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0041_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0041
        rs_R009_ueqv_R009NNNYN_generator_18_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_18_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0042 : Poly :=
[
  term ((-39298560 : Rat) / 12247399) [(2, 1), (5, 1), (13, 1), (15, 2)]
]

/-- Partial product 42 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0042 : Poly :=
[
  term ((-78597120 : Rat) / 12247399) [(2, 1), (5, 1), (6, 1), (8, 1), (13, 1), (15, 2)],
  term ((-78597120 : Rat) / 12247399) [(2, 1), (5, 1), (7, 1), (9, 1), (13, 1), (15, 2)],
  term ((39298560 : Rat) / 12247399) [(2, 1), (5, 1), (8, 2), (13, 1), (15, 2)],
  term ((39298560 : Rat) / 12247399) [(2, 1), (5, 1), (9, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0042_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0042
        rs_R009_ueqv_R009NNNYN_generator_18_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_18_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0043 : Poly :=
[
  term ((5841904640 : Rat) / 330679773) [(2, 1), (5, 1), (14, 1), (15, 1)]
]

/-- Partial product 43 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0043 : Poly :=
[
  term ((11683809280 : Rat) / 330679773) [(2, 1), (5, 1), (6, 1), (8, 1), (14, 1), (15, 1)],
  term ((11683809280 : Rat) / 330679773) [(2, 1), (5, 1), (7, 1), (9, 1), (14, 1), (15, 1)],
  term ((-5841904640 : Rat) / 330679773) [(2, 1), (5, 1), (8, 2), (14, 1), (15, 1)],
  term ((-5841904640 : Rat) / 330679773) [(2, 1), (5, 1), (9, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0043_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0043
        rs_R009_ueqv_R009NNNYN_generator_18_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_18_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0044 : Poly :=
[
  term ((4293808960 : Rat) / 330679773) [(2, 1), (5, 1), (15, 1)]
]

/-- Partial product 44 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0044 : Poly :=
[
  term ((8587617920 : Rat) / 330679773) [(2, 1), (5, 1), (6, 1), (8, 1), (15, 1)],
  term ((8587617920 : Rat) / 330679773) [(2, 1), (5, 1), (7, 1), (9, 1), (15, 1)],
  term ((-4293808960 : Rat) / 330679773) [(2, 1), (5, 1), (8, 2), (15, 1)],
  term ((-4293808960 : Rat) / 330679773) [(2, 1), (5, 1), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0044_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0044
        rs_R009_ueqv_R009NNNYN_generator_18_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_18_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0045 : Poly :=
[
  term ((756029440 : Rat) / 110226591) [(2, 1), (5, 1), (15, 3)]
]

/-- Partial product 45 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0045 : Poly :=
[
  term ((1512058880 : Rat) / 110226591) [(2, 1), (5, 1), (6, 1), (8, 1), (15, 3)],
  term ((1512058880 : Rat) / 110226591) [(2, 1), (5, 1), (7, 1), (9, 1), (15, 3)],
  term ((-756029440 : Rat) / 110226591) [(2, 1), (5, 1), (8, 2), (15, 3)],
  term ((-756029440 : Rat) / 110226591) [(2, 1), (5, 1), (9, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0045_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0045
        rs_R009_ueqv_R009NNNYN_generator_18_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_18_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0046 : Poly :=
[
  term ((-83722240 : Rat) / 110226591) [(2, 1), (7, 1), (11, 1)]
]

/-- Partial product 46 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0046 : Poly :=
[
  term ((-167444480 : Rat) / 110226591) [(2, 1), (6, 1), (7, 1), (8, 1), (11, 1)],
  term ((83722240 : Rat) / 110226591) [(2, 1), (7, 1), (8, 2), (11, 1)],
  term ((83722240 : Rat) / 110226591) [(2, 1), (7, 1), (9, 2), (11, 1)],
  term ((-167444480 : Rat) / 110226591) [(2, 1), (7, 2), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0046_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0046
        rs_R009_ueqv_R009NNNYN_generator_18_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_18_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0047 : Poly :=
[
  term ((-3924480 : Rat) / 12247399) [(2, 1), (7, 1), (13, 1)]
]

/-- Partial product 47 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0047 : Poly :=
[
  term ((-7848960 : Rat) / 12247399) [(2, 1), (6, 1), (7, 1), (8, 1), (13, 1)],
  term ((3924480 : Rat) / 12247399) [(2, 1), (7, 1), (8, 2), (13, 1)],
  term ((3924480 : Rat) / 12247399) [(2, 1), (7, 1), (9, 2), (13, 1)],
  term ((-7848960 : Rat) / 12247399) [(2, 1), (7, 2), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0047_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0047
        rs_R009_ueqv_R009NNNYN_generator_18_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_18_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0048 : Poly :=
[
  term ((75499520 : Rat) / 110226591) [(2, 1), (7, 1), (15, 1)]
]

/-- Partial product 48 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0048 : Poly :=
[
  term ((150999040 : Rat) / 110226591) [(2, 1), (6, 1), (7, 1), (8, 1), (15, 1)],
  term ((-75499520 : Rat) / 110226591) [(2, 1), (7, 1), (8, 2), (15, 1)],
  term ((-75499520 : Rat) / 110226591) [(2, 1), (7, 1), (9, 2), (15, 1)],
  term ((150999040 : Rat) / 110226591) [(2, 1), (7, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0048_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0048
        rs_R009_ueqv_R009NNNYN_generator_18_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_18_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0049 : Poly :=
[
  term ((1023357440 : Rat) / 330679773) [(2, 1), (9, 1), (11, 1)]
]

/-- Partial product 49 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0049 : Poly :=
[
  term ((2046714880 : Rat) / 330679773) [(2, 1), (6, 1), (8, 1), (9, 1), (11, 1)],
  term ((2046714880 : Rat) / 330679773) [(2, 1), (7, 1), (9, 2), (11, 1)],
  term ((-1023357440 : Rat) / 330679773) [(2, 1), (8, 2), (9, 1), (11, 1)],
  term ((-1023357440 : Rat) / 330679773) [(2, 1), (9, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0049_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0049
        rs_R009_ueqv_R009NNNYN_generator_18_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_18_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0050 : Poly :=
[
  term ((1342781440 : Rat) / 330679773) [(2, 1), (9, 1), (11, 1), (12, 1)]
]

/-- Partial product 50 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0050 : Poly :=
[
  term ((2685562880 : Rat) / 330679773) [(2, 1), (6, 1), (8, 1), (9, 1), (11, 1), (12, 1)],
  term ((2685562880 : Rat) / 330679773) [(2, 1), (7, 1), (9, 2), (11, 1), (12, 1)],
  term ((-1342781440 : Rat) / 330679773) [(2, 1), (8, 2), (9, 1), (11, 1), (12, 1)],
  term ((-1342781440 : Rat) / 330679773) [(2, 1), (9, 3), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0050_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0050
        rs_R009_ueqv_R009NNNYN_generator_18_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_18_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0051 : Poly :=
[
  term ((3239075840 : Rat) / 330679773) [(2, 1), (9, 1), (11, 1), (14, 1)]
]

/-- Partial product 51 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0051 : Poly :=
[
  term ((6478151680 : Rat) / 330679773) [(2, 1), (6, 1), (8, 1), (9, 1), (11, 1), (14, 1)],
  term ((6478151680 : Rat) / 330679773) [(2, 1), (7, 1), (9, 2), (11, 1), (14, 1)],
  term ((-3239075840 : Rat) / 330679773) [(2, 1), (8, 2), (9, 1), (11, 1), (14, 1)],
  term ((-3239075840 : Rat) / 330679773) [(2, 1), (9, 3), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0051_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0051
        rs_R009_ueqv_R009NNNYN_generator_18_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_18_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0052 : Poly :=
[
  term ((419184640 : Rat) / 110226591) [(2, 1), (9, 1), (11, 1), (15, 2)]
]

/-- Partial product 52 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0052 : Poly :=
[
  term ((838369280 : Rat) / 110226591) [(2, 1), (6, 1), (8, 1), (9, 1), (11, 1), (15, 2)],
  term ((838369280 : Rat) / 110226591) [(2, 1), (7, 1), (9, 2), (11, 1), (15, 2)],
  term ((-419184640 : Rat) / 110226591) [(2, 1), (8, 2), (9, 1), (11, 1), (15, 2)],
  term ((-419184640 : Rat) / 110226591) [(2, 1), (9, 3), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0052_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0052
        rs_R009_ueqv_R009NNNYN_generator_18_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_18_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0053 : Poly :=
[
  term ((20980960 : Rat) / 12247399) [(2, 1), (9, 1), (12, 1), (13, 1)]
]

/-- Partial product 53 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0053 : Poly :=
[
  term ((41961920 : Rat) / 12247399) [(2, 1), (6, 1), (8, 1), (9, 1), (12, 1), (13, 1)],
  term ((41961920 : Rat) / 12247399) [(2, 1), (7, 1), (9, 2), (12, 1), (13, 1)],
  term ((-20980960 : Rat) / 12247399) [(2, 1), (8, 2), (9, 1), (12, 1), (13, 1)],
  term ((-20980960 : Rat) / 12247399) [(2, 1), (9, 3), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0053_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0053
        rs_R009_ueqv_R009NNNYN_generator_18_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_18_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0054 : Poly :=
[
  term ((-1210901120 : Rat) / 330679773) [(2, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 54 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0054 : Poly :=
[
  term ((-2421802240 : Rat) / 330679773) [(2, 1), (6, 1), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((-2421802240 : Rat) / 330679773) [(2, 1), (7, 1), (9, 2), (12, 1), (15, 1)],
  term ((1210901120 : Rat) / 330679773) [(2, 1), (8, 2), (9, 1), (12, 1), (15, 1)],
  term ((1210901120 : Rat) / 330679773) [(2, 1), (9, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0054_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0054
        rs_R009_ueqv_R009NNNYN_generator_18_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_18_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0055 : Poly :=
[
  term ((15989960 : Rat) / 12247399) [(2, 1), (9, 1), (13, 1)]
]

/-- Partial product 55 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0055 : Poly :=
[
  term ((31979920 : Rat) / 12247399) [(2, 1), (6, 1), (8, 1), (9, 1), (13, 1)],
  term ((31979920 : Rat) / 12247399) [(2, 1), (7, 1), (9, 2), (13, 1)],
  term ((-15989960 : Rat) / 12247399) [(2, 1), (8, 2), (9, 1), (13, 1)],
  term ((-15989960 : Rat) / 12247399) [(2, 1), (9, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0055_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0055
        rs_R009_ueqv_R009NNNYN_generator_18_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_18_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0056 : Poly :=
[
  term ((50610560 : Rat) / 12247399) [(2, 1), (9, 1), (13, 1), (14, 1)]
]

/-- Partial product 56 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0056 : Poly :=
[
  term ((101221120 : Rat) / 12247399) [(2, 1), (6, 1), (8, 1), (9, 1), (13, 1), (14, 1)],
  term ((101221120 : Rat) / 12247399) [(2, 1), (7, 1), (9, 2), (13, 1), (14, 1)],
  term ((-50610560 : Rat) / 12247399) [(2, 1), (8, 2), (9, 1), (13, 1), (14, 1)],
  term ((-50610560 : Rat) / 12247399) [(2, 1), (9, 3), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0056_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0056
        rs_R009_ueqv_R009NNNYN_generator_18_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_18_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0057 : Poly :=
[
  term ((19649280 : Rat) / 12247399) [(2, 1), (9, 1), (13, 1), (15, 2)]
]

/-- Partial product 57 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0057 : Poly :=
[
  term ((39298560 : Rat) / 12247399) [(2, 1), (6, 1), (8, 1), (9, 1), (13, 1), (15, 2)],
  term ((39298560 : Rat) / 12247399) [(2, 1), (7, 1), (9, 2), (13, 1), (15, 2)],
  term ((-19649280 : Rat) / 12247399) [(2, 1), (8, 2), (9, 1), (13, 1), (15, 2)],
  term ((-19649280 : Rat) / 12247399) [(2, 1), (9, 3), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0057_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0057
        rs_R009_ueqv_R009NNNYN_generator_18_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_18_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0058 : Poly :=
[
  term ((-2920952320 : Rat) / 330679773) [(2, 1), (9, 1), (14, 1), (15, 1)]
]

/-- Partial product 58 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0058 : Poly :=
[
  term ((-5841904640 : Rat) / 330679773) [(2, 1), (6, 1), (8, 1), (9, 1), (14, 1), (15, 1)],
  term ((-5841904640 : Rat) / 330679773) [(2, 1), (7, 1), (9, 2), (14, 1), (15, 1)],
  term ((2920952320 : Rat) / 330679773) [(2, 1), (8, 2), (9, 1), (14, 1), (15, 1)],
  term ((2920952320 : Rat) / 330679773) [(2, 1), (9, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0058_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0058
        rs_R009_ueqv_R009NNNYN_generator_18_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_18_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0059 : Poly :=
[
  term ((-922849120 : Rat) / 330679773) [(2, 1), (9, 1), (15, 1)]
]

/-- Partial product 59 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0059 : Poly :=
[
  term ((-1845698240 : Rat) / 330679773) [(2, 1), (6, 1), (8, 1), (9, 1), (15, 1)],
  term ((-1845698240 : Rat) / 330679773) [(2, 1), (7, 1), (9, 2), (15, 1)],
  term ((922849120 : Rat) / 330679773) [(2, 1), (8, 2), (9, 1), (15, 1)],
  term ((922849120 : Rat) / 330679773) [(2, 1), (9, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0059_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0059
        rs_R009_ueqv_R009NNNYN_generator_18_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_18_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0060 : Poly :=
[
  term ((-378014720 : Rat) / 110226591) [(2, 1), (9, 1), (15, 3)]
]

/-- Partial product 60 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0060 : Poly :=
[
  term ((-756029440 : Rat) / 110226591) [(2, 1), (6, 1), (8, 1), (9, 1), (15, 3)],
  term ((-756029440 : Rat) / 110226591) [(2, 1), (7, 1), (9, 2), (15, 3)],
  term ((378014720 : Rat) / 110226591) [(2, 1), (8, 2), (9, 1), (15, 3)],
  term ((378014720 : Rat) / 110226591) [(2, 1), (9, 3), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0060_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0060
        rs_R009_ueqv_R009NNNYN_generator_18_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_18_0060 := by
  native_decide

/-- Coefficient term 61 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0061 : Poly :=
[
  term ((604549120 : Rat) / 330679773) [(2, 1), (11, 1), (13, 1)]
]

/-- Partial product 61 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0061 : Poly :=
[
  term ((1209098240 : Rat) / 330679773) [(2, 1), (6, 1), (8, 1), (11, 1), (13, 1)],
  term ((1209098240 : Rat) / 330679773) [(2, 1), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((-604549120 : Rat) / 330679773) [(2, 1), (8, 2), (11, 1), (13, 1)],
  term ((-604549120 : Rat) / 330679773) [(2, 1), (9, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 61 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0061_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0061
        rs_R009_ueqv_R009NNNYN_generator_18_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_18_0061 := by
  native_decide

/-- Coefficient term 62 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0062 : Poly :=
[
  term ((-545173760 : Rat) / 330679773) [(2, 1), (13, 1), (15, 1)]
]

/-- Partial product 62 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0062 : Poly :=
[
  term ((-1090347520 : Rat) / 330679773) [(2, 1), (6, 1), (8, 1), (13, 1), (15, 1)],
  term ((-1090347520 : Rat) / 330679773) [(2, 1), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((545173760 : Rat) / 330679773) [(2, 1), (8, 2), (13, 1), (15, 1)],
  term ((545173760 : Rat) / 330679773) [(2, 1), (9, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 62 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0062_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0062
        rs_R009_ueqv_R009NNNYN_generator_18_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_18_0062 := by
  native_decide

/-- Coefficient term 63 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0063 : Poly :=
[
  term ((9446080 : Rat) / 12247399) [(2, 1), (13, 2)]
]

/-- Partial product 63 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0063 : Poly :=
[
  term ((18892160 : Rat) / 12247399) [(2, 1), (6, 1), (8, 1), (13, 2)],
  term ((18892160 : Rat) / 12247399) [(2, 1), (7, 1), (9, 1), (13, 2)],
  term ((-9446080 : Rat) / 12247399) [(2, 1), (8, 2), (13, 2)],
  term ((-9446080 : Rat) / 12247399) [(2, 1), (9, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 63 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0063_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0063
        rs_R009_ueqv_R009NNNYN_generator_18_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_18_0063 := by
  native_decide

/-- Coefficient term 64 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0064 : Poly :=
[
  term ((-19066880 : Rat) / 6239241) [(3, 1), (11, 1)]
]

/-- Partial product 64 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0064 : Poly :=
[
  term ((-38133760 : Rat) / 6239241) [(3, 1), (6, 1), (8, 1), (11, 1)],
  term ((-38133760 : Rat) / 6239241) [(3, 1), (7, 1), (9, 1), (11, 1)],
  term ((19066880 : Rat) / 6239241) [(3, 1), (8, 2), (11, 1)],
  term ((19066880 : Rat) / 6239241) [(3, 1), (9, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 64 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0064_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0064
        rs_R009_ueqv_R009NNNYN_generator_18_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_18_0064 := by
  native_decide

/-- Coefficient term 65 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0065 : Poly :=
[
  term ((604549120 : Rat) / 330679773) [(3, 1), (11, 1), (12, 1)]
]

/-- Partial product 65 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0065 : Poly :=
[
  term ((1209098240 : Rat) / 330679773) [(3, 1), (6, 1), (8, 1), (11, 1), (12, 1)],
  term ((1209098240 : Rat) / 330679773) [(3, 1), (7, 1), (9, 1), (11, 1), (12, 1)],
  term ((-604549120 : Rat) / 330679773) [(3, 1), (8, 2), (11, 1), (12, 1)],
  term ((-604549120 : Rat) / 330679773) [(3, 1), (9, 2), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 65 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0065_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0065
        rs_R009_ueqv_R009NNNYN_generator_18_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_18_0065 := by
  native_decide

/-- Coefficient term 66 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0066 : Poly :=
[
  term ((1165373440 : Rat) / 330679773) [(3, 1), (11, 1), (14, 1)]
]

/-- Partial product 66 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0066 : Poly :=
[
  term ((2330746880 : Rat) / 330679773) [(3, 1), (6, 1), (8, 1), (11, 1), (14, 1)],
  term ((2330746880 : Rat) / 330679773) [(3, 1), (7, 1), (9, 1), (11, 1), (14, 1)],
  term ((-1165373440 : Rat) / 330679773) [(3, 1), (8, 2), (11, 1), (14, 1)],
  term ((-1165373440 : Rat) / 330679773) [(3, 1), (9, 2), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 66 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0066_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0066
        rs_R009_ueqv_R009NNNYN_generator_18_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_18_0066 := by
  native_decide

/-- Coefficient term 67 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0067 : Poly :=
[
  term ((9446080 : Rat) / 12247399) [(3, 1), (12, 1), (13, 1)]
]

/-- Partial product 67 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0067 : Poly :=
[
  term ((18892160 : Rat) / 12247399) [(3, 1), (6, 1), (8, 1), (12, 1), (13, 1)],
  term ((18892160 : Rat) / 12247399) [(3, 1), (7, 1), (9, 1), (12, 1), (13, 1)],
  term ((-9446080 : Rat) / 12247399) [(3, 1), (8, 2), (12, 1), (13, 1)],
  term ((-9446080 : Rat) / 12247399) [(3, 1), (9, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 67 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0067_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0067
        rs_R009_ueqv_R009NNNYN_generator_18_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_18_0067 := by
  native_decide

/-- Coefficient term 68 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0068 : Poly :=
[
  term ((-545173760 : Rat) / 330679773) [(3, 1), (12, 1), (15, 1)]
]

/-- Partial product 68 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0068 : Poly :=
[
  term ((-1090347520 : Rat) / 330679773) [(3, 1), (6, 1), (8, 1), (12, 1), (15, 1)],
  term ((-1090347520 : Rat) / 330679773) [(3, 1), (7, 1), (9, 1), (12, 1), (15, 1)],
  term ((545173760 : Rat) / 330679773) [(3, 1), (8, 2), (12, 1), (15, 1)],
  term ((545173760 : Rat) / 330679773) [(3, 1), (9, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 68 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0068_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0068
        rs_R009_ueqv_R009NNNYN_generator_18_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_18_0068 := by
  native_decide

/-- Coefficient term 69 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0069 : Poly :=
[
  term ((-297920 : Rat) / 231083) [(3, 1), (13, 1)]
]

/-- Partial product 69 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0069 : Poly :=
[
  term ((-595840 : Rat) / 231083) [(3, 1), (6, 1), (8, 1), (13, 1)],
  term ((-595840 : Rat) / 231083) [(3, 1), (7, 1), (9, 1), (13, 1)],
  term ((297920 : Rat) / 231083) [(3, 1), (8, 2), (13, 1)],
  term ((297920 : Rat) / 231083) [(3, 1), (9, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 69 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0069_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0069
        rs_R009_ueqv_R009NNNYN_generator_18_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_18_0069 := by
  native_decide

/-- Coefficient term 70 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0070 : Poly :=
[
  term ((18208960 : Rat) / 12247399) [(3, 1), (13, 1), (14, 1)]
]

/-- Partial product 70 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0070 : Poly :=
[
  term ((36417920 : Rat) / 12247399) [(3, 1), (6, 1), (8, 1), (13, 1), (14, 1)],
  term ((36417920 : Rat) / 12247399) [(3, 1), (7, 1), (9, 1), (13, 1), (14, 1)],
  term ((-18208960 : Rat) / 12247399) [(3, 1), (8, 2), (13, 1), (14, 1)],
  term ((-18208960 : Rat) / 12247399) [(3, 1), (9, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 70 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0070_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0070
        rs_R009_ueqv_R009NNNYN_generator_18_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_18_0070 := by
  native_decide

/-- Coefficient term 71 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0071 : Poly :=
[
  term ((-1050917120 : Rat) / 330679773) [(3, 1), (14, 1), (15, 1)]
]

/-- Partial product 71 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0071 : Poly :=
[
  term ((-2101834240 : Rat) / 330679773) [(3, 1), (6, 1), (8, 1), (14, 1), (15, 1)],
  term ((-2101834240 : Rat) / 330679773) [(3, 1), (7, 1), (9, 1), (14, 1), (15, 1)],
  term ((1050917120 : Rat) / 330679773) [(3, 1), (8, 2), (14, 1), (15, 1)],
  term ((1050917120 : Rat) / 330679773) [(3, 1), (9, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 71 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0071_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0071
        rs_R009_ueqv_R009NNNYN_generator_18_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_18_0071 := by
  native_decide

/-- Coefficient term 72 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0072 : Poly :=
[
  term ((17194240 : Rat) / 6239241) [(3, 1), (15, 1)]
]

/-- Partial product 72 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0072 : Poly :=
[
  term ((34388480 : Rat) / 6239241) [(3, 1), (6, 1), (8, 1), (15, 1)],
  term ((34388480 : Rat) / 6239241) [(3, 1), (7, 1), (9, 1), (15, 1)],
  term ((-17194240 : Rat) / 6239241) [(3, 1), (8, 2), (15, 1)],
  term ((-17194240 : Rat) / 6239241) [(3, 1), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 72 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0072_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0072
        rs_R009_ueqv_R009NNNYN_generator_18_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_18_0072 := by
  native_decide

/-- Coefficient term 73 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0073 : Poly :=
[
  term ((1264 : Rat) / 67) [(5, 1), (7, 1)]
]

/-- Partial product 73 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0073 : Poly :=
[
  term ((2528 : Rat) / 67) [(5, 1), (6, 1), (7, 1), (8, 1)],
  term ((-1264 : Rat) / 67) [(5, 1), (7, 1), (8, 2)],
  term ((-1264 : Rat) / 67) [(5, 1), (7, 1), (9, 2)],
  term ((2528 : Rat) / 67) [(5, 1), (7, 2), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 73 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0073_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0073
        rs_R009_ueqv_R009NNNYN_generator_18_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_18_0073 := by
  native_decide

/-- Coefficient term 74 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0074 : Poly :=
[
  term ((-20839164776192 : Rat) / 471218676525) [(5, 1), (7, 1), (9, 1), (11, 1)]
]

/-- Partial product 74 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0074 : Poly :=
[
  term ((-41678329552384 : Rat) / 471218676525) [(5, 1), (6, 1), (7, 1), (8, 1), (9, 1), (11, 1)],
  term ((20839164776192 : Rat) / 471218676525) [(5, 1), (7, 1), (8, 2), (9, 1), (11, 1)],
  term ((20839164776192 : Rat) / 471218676525) [(5, 1), (7, 1), (9, 3), (11, 1)],
  term ((-41678329552384 : Rat) / 471218676525) [(5, 1), (7, 2), (9, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 74 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0074_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0074
        rs_R009_ueqv_R009NNNYN_generator_18_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_18_0074 := by
  native_decide

/-- Coefficient term 75 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0075 : Poly :=
[
  term ((-325611949628 : Rat) / 17452543575) [(5, 1), (7, 1), (9, 1), (13, 1)]
]

/-- Partial product 75 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0075 : Poly :=
[
  term ((-651223899256 : Rat) / 17452543575) [(5, 1), (6, 1), (7, 1), (8, 1), (9, 1), (13, 1)],
  term ((325611949628 : Rat) / 17452543575) [(5, 1), (7, 1), (8, 2), (9, 1), (13, 1)],
  term ((325611949628 : Rat) / 17452543575) [(5, 1), (7, 1), (9, 3), (13, 1)],
  term ((-651223899256 : Rat) / 17452543575) [(5, 1), (7, 2), (9, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 75 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0075_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0075
        rs_R009_ueqv_R009NNNYN_generator_18_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_18_0075 := by
  native_decide

/-- Coefficient term 76 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0076 : Poly :=
[
  term ((23476515399766 : Rat) / 471218676525) [(5, 1), (7, 1), (9, 1), (15, 1)]
]

/-- Partial product 76 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0076 : Poly :=
[
  term ((46953030799532 : Rat) / 471218676525) [(5, 1), (6, 1), (7, 1), (8, 1), (9, 1), (15, 1)],
  term ((-23476515399766 : Rat) / 471218676525) [(5, 1), (7, 1), (8, 2), (9, 1), (15, 1)],
  term ((-23476515399766 : Rat) / 471218676525) [(5, 1), (7, 1), (9, 3), (15, 1)],
  term ((46953030799532 : Rat) / 471218676525) [(5, 1), (7, 2), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 76 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0076_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0076
        rs_R009_ueqv_R009NNNYN_generator_18_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_18_0076 := by
  native_decide

/-- Coefficient term 77 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0077 : Poly :=
[
  term ((-397843040 : Rat) / 12247399) [(5, 1), (7, 1), (11, 1), (13, 1)]
]

/-- Partial product 77 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0077 : Poly :=
[
  term ((-795686080 : Rat) / 12247399) [(5, 1), (6, 1), (7, 1), (8, 1), (11, 1), (13, 1)],
  term ((397843040 : Rat) / 12247399) [(5, 1), (7, 1), (8, 2), (11, 1), (13, 1)],
  term ((397843040 : Rat) / 12247399) [(5, 1), (7, 1), (9, 2), (11, 1), (13, 1)],
  term ((-795686080 : Rat) / 12247399) [(5, 1), (7, 2), (9, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 77 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0077_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0077
        rs_R009_ueqv_R009NNNYN_generator_18_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_18_0077 := by
  native_decide

/-- Coefficient term 78 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0078 : Poly :=
[
  term ((33753231443752 : Rat) / 157072892175) [(5, 1), (7, 1), (11, 1), (15, 1)]
]

/-- Partial product 78 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0078 : Poly :=
[
  term ((67506462887504 : Rat) / 157072892175) [(5, 1), (6, 1), (7, 1), (8, 1), (11, 1), (15, 1)],
  term ((-33753231443752 : Rat) / 157072892175) [(5, 1), (7, 1), (8, 2), (11, 1), (15, 1)],
  term ((-33753231443752 : Rat) / 157072892175) [(5, 1), (7, 1), (9, 2), (11, 1), (15, 1)],
  term ((67506462887504 : Rat) / 157072892175) [(5, 1), (7, 2), (9, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 78 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0078_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0078
        rs_R009_ueqv_R009NNNYN_generator_18_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_18_0078 := by
  native_decide

/-- Coefficient term 79 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0079 : Poly :=
[
  term ((-4385912120576 : Rat) / 157072892175) [(5, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 79 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0079 : Poly :=
[
  term ((-8771824241152 : Rat) / 157072892175) [(5, 1), (6, 1), (7, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((4385912120576 : Rat) / 157072892175) [(5, 1), (7, 1), (8, 2), (11, 1), (15, 1), (16, 1)],
  term ((4385912120576 : Rat) / 157072892175) [(5, 1), (7, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-8771824241152 : Rat) / 157072892175) [(5, 1), (7, 2), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 79 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0079_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0079
        rs_R009_ueqv_R009NNNYN_generator_18_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_18_0079 := by
  native_decide

/-- Coefficient term 80 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0080 : Poly :=
[
  term ((-25461954560 : Rat) / 330679773) [(5, 1), (7, 1), (11, 2)]
]

/-- Partial product 80 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0080 : Poly :=
[
  term ((-50923909120 : Rat) / 330679773) [(5, 1), (6, 1), (7, 1), (8, 1), (11, 2)],
  term ((25461954560 : Rat) / 330679773) [(5, 1), (7, 1), (8, 2), (11, 2)],
  term ((25461954560 : Rat) / 330679773) [(5, 1), (7, 1), (9, 2), (11, 2)],
  term ((-50923909120 : Rat) / 330679773) [(5, 1), (7, 2), (9, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 80 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0080_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0080
        rs_R009_ueqv_R009NNNYN_generator_18_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_18_0080 := by
  native_decide

/-- Coefficient term 81 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0081 : Poly :=
[
  term ((323864637768 : Rat) / 5817514525) [(5, 1), (7, 1), (13, 1), (15, 1)]
]

/-- Partial product 81 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0081 : Poly :=
[
  term ((647729275536 : Rat) / 5817514525) [(5, 1), (6, 1), (7, 1), (8, 1), (13, 1), (15, 1)],
  term ((-323864637768 : Rat) / 5817514525) [(5, 1), (7, 1), (8, 2), (13, 1), (15, 1)],
  term ((-323864637768 : Rat) / 5817514525) [(5, 1), (7, 1), (9, 2), (13, 1), (15, 1)],
  term ((647729275536 : Rat) / 5817514525) [(5, 1), (7, 2), (9, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 81 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0081_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0081
        rs_R009_ueqv_R009NNNYN_generator_18_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_18_0081 := by
  native_decide

/-- Coefficient term 82 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0082 : Poly :=
[
  term ((-68529876884 : Rat) / 5817514525) [(5, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 82 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0082 : Poly :=
[
  term ((-137059753768 : Rat) / 5817514525) [(5, 1), (6, 1), (7, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((68529876884 : Rat) / 5817514525) [(5, 1), (7, 1), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((68529876884 : Rat) / 5817514525) [(5, 1), (7, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-137059753768 : Rat) / 5817514525) [(5, 1), (7, 2), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 82 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0082_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0082
        rs_R009_ueqv_R009NNNYN_generator_18_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_18_0082 := by
  native_decide

/-- Coefficient term 83 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0083 : Poly :=
[
  term ((-392 : Rat) / 67) [(5, 1), (7, 1), (14, 1)]
]

/-- Partial product 83 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0083 : Poly :=
[
  term ((-784 : Rat) / 67) [(5, 1), (6, 1), (7, 1), (8, 1), (14, 1)],
  term ((392 : Rat) / 67) [(5, 1), (7, 1), (8, 2), (14, 1)],
  term ((392 : Rat) / 67) [(5, 1), (7, 1), (9, 2), (14, 1)],
  term ((-784 : Rat) / 67) [(5, 1), (7, 2), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 83 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0083_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0083
        rs_R009_ueqv_R009NNNYN_generator_18_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_18_0083 := by
  native_decide

/-- Coefficient term 84 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0084 : Poly :=
[
  term ((-2094906592144 : Rat) / 17452543575) [(5, 1), (7, 1), (15, 2)]
]

/-- Partial product 84 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0084 : Poly :=
[
  term ((-4189813184288 : Rat) / 17452543575) [(5, 1), (6, 1), (7, 1), (8, 1), (15, 2)],
  term ((2094906592144 : Rat) / 17452543575) [(5, 1), (7, 1), (8, 2), (15, 2)],
  term ((2094906592144 : Rat) / 17452543575) [(5, 1), (7, 1), (9, 2), (15, 2)],
  term ((-4189813184288 : Rat) / 17452543575) [(5, 1), (7, 2), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 84 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0084_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0084
        rs_R009_ueqv_R009NNNYN_generator_18_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_18_0084 := by
  native_decide

/-- Coefficient term 85 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0085 : Poly :=
[
  term ((4789749157348 : Rat) / 157072892175) [(5, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 85 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0085 : Poly :=
[
  term ((9579498314696 : Rat) / 157072892175) [(5, 1), (6, 1), (7, 1), (8, 1), (15, 2), (16, 1)],
  term ((-4789749157348 : Rat) / 157072892175) [(5, 1), (7, 1), (8, 2), (15, 2), (16, 1)],
  term ((-4789749157348 : Rat) / 157072892175) [(5, 1), (7, 1), (9, 2), (15, 2), (16, 1)],
  term ((9579498314696 : Rat) / 157072892175) [(5, 1), (7, 2), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 85 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0085_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0085
        rs_R009_ueqv_R009NNNYN_generator_18_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_18_0085 := by
  native_decide

/-- Coefficient term 86 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0086 : Poly :=
[
  term ((4385912120576 : Rat) / 157072892175) [(5, 1), (7, 2), (11, 1)]
]

/-- Partial product 86 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0086 : Poly :=
[
  term ((8771824241152 : Rat) / 157072892175) [(5, 1), (6, 1), (7, 2), (8, 1), (11, 1)],
  term ((-4385912120576 : Rat) / 157072892175) [(5, 1), (7, 2), (8, 2), (11, 1)],
  term ((-4385912120576 : Rat) / 157072892175) [(5, 1), (7, 2), (9, 2), (11, 1)],
  term ((8771824241152 : Rat) / 157072892175) [(5, 1), (7, 3), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 86 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0086_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0086
        rs_R009_ueqv_R009NNNYN_generator_18_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_18_0086 := by
  native_decide

/-- Coefficient term 87 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0087 : Poly :=
[
  term ((68529876884 : Rat) / 5817514525) [(5, 1), (7, 2), (13, 1)]
]

/-- Partial product 87 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0087 : Poly :=
[
  term ((137059753768 : Rat) / 5817514525) [(5, 1), (6, 1), (7, 2), (8, 1), (13, 1)],
  term ((-68529876884 : Rat) / 5817514525) [(5, 1), (7, 2), (8, 2), (13, 1)],
  term ((-68529876884 : Rat) / 5817514525) [(5, 1), (7, 2), (9, 2), (13, 1)],
  term ((137059753768 : Rat) / 5817514525) [(5, 1), (7, 3), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 87 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0087_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0087
        rs_R009_ueqv_R009NNNYN_generator_18_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_18_0087 := by
  native_decide

/-- Coefficient term 88 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0088 : Poly :=
[
  term ((-4789749157348 : Rat) / 157072892175) [(5, 1), (7, 2), (15, 1)]
]

/-- Partial product 88 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0088 : Poly :=
[
  term ((-9579498314696 : Rat) / 157072892175) [(5, 1), (6, 1), (7, 2), (8, 1), (15, 1)],
  term ((4789749157348 : Rat) / 157072892175) [(5, 1), (7, 2), (8, 2), (15, 1)],
  term ((4789749157348 : Rat) / 157072892175) [(5, 1), (7, 2), (9, 2), (15, 1)],
  term ((-9579498314696 : Rat) / 157072892175) [(5, 1), (7, 3), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 88 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0088_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0088
        rs_R009_ueqv_R009NNNYN_generator_18_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_18_0088 := by
  native_decide

/-- Coefficient term 89 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0089 : Poly :=
[
  term ((-1133 : Rat) / 134) [(5, 1), (9, 1)]
]

/-- Partial product 89 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0089 : Poly :=
[
  term ((-1133 : Rat) / 67) [(5, 1), (6, 1), (8, 1), (9, 1)],
  term ((-1133 : Rat) / 67) [(5, 1), (7, 1), (9, 2)],
  term ((1133 : Rat) / 134) [(5, 1), (8, 2), (9, 1)],
  term ((1133 : Rat) / 134) [(5, 1), (9, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 89 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0089_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0089
        rs_R009_ueqv_R009NNNYN_generator_18_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_18_0089 := by
  native_decide

/-- Coefficient term 90 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0090 : Poly :=
[
  term ((596764560 : Rat) / 12247399) [(5, 1), (9, 1), (11, 1), (13, 1)]
]

/-- Partial product 90 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0090 : Poly :=
[
  term ((1193529120 : Rat) / 12247399) [(5, 1), (6, 1), (8, 1), (9, 1), (11, 1), (13, 1)],
  term ((1193529120 : Rat) / 12247399) [(5, 1), (7, 1), (9, 2), (11, 1), (13, 1)],
  term ((-596764560 : Rat) / 12247399) [(5, 1), (8, 2), (9, 1), (11, 1), (13, 1)],
  term ((-596764560 : Rat) / 12247399) [(5, 1), (9, 3), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 90 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0090_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0090
        rs_R009_ueqv_R009NNNYN_generator_18_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_18_0090 := by
  native_decide

/-- Coefficient term 91 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0091 : Poly :=
[
  term ((-4584858115156 : Rat) / 18848747061) [(5, 1), (9, 1), (11, 1), (15, 1)]
]

/-- Partial product 91 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0091 : Poly :=
[
  term ((-9169716230312 : Rat) / 18848747061) [(5, 1), (6, 1), (8, 1), (9, 1), (11, 1), (15, 1)],
  term ((-9169716230312 : Rat) / 18848747061) [(5, 1), (7, 1), (9, 2), (11, 1), (15, 1)],
  term ((4584858115156 : Rat) / 18848747061) [(5, 1), (8, 2), (9, 1), (11, 1), (15, 1)],
  term ((4584858115156 : Rat) / 18848747061) [(5, 1), (9, 3), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 91 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0091_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0091
        rs_R009_ueqv_R009NNNYN_generator_18_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_18_0091 := by
  native_decide

/-- Coefficient term 92 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0092 : Poly :=
[
  term ((44102409344 : Rat) / 18848747061) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 92 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0092 : Poly :=
[
  term ((88204818688 : Rat) / 18848747061) [(5, 1), (6, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((88204818688 : Rat) / 18848747061) [(5, 1), (7, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-44102409344 : Rat) / 18848747061) [(5, 1), (8, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-44102409344 : Rat) / 18848747061) [(5, 1), (9, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 92 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0092_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0092
        rs_R009_ueqv_R009NNNYN_generator_18_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_18_0092 := by
  native_decide

/-- Coefficient term 93 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0093 : Poly :=
[
  term ((12730977280 : Rat) / 110226591) [(5, 1), (9, 1), (11, 2)]
]

/-- Partial product 93 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0093 : Poly :=
[
  term ((25461954560 : Rat) / 110226591) [(5, 1), (6, 1), (8, 1), (9, 1), (11, 2)],
  term ((25461954560 : Rat) / 110226591) [(5, 1), (7, 1), (9, 2), (11, 2)],
  term ((-12730977280 : Rat) / 110226591) [(5, 1), (8, 2), (9, 1), (11, 2)],
  term ((-12730977280 : Rat) / 110226591) [(5, 1), (9, 3), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 93 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0093_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0093
        rs_R009_ueqv_R009NNNYN_generator_18_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_18_0093 := by
  native_decide

/-- Coefficient term 94 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0094 : Poly :=
[
  term ((-35003079412 : Rat) / 698101743) [(5, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 94 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0094 : Poly :=
[
  term ((-70006158824 : Rat) / 698101743) [(5, 1), (6, 1), (8, 1), (9, 1), (13, 1), (15, 1)],
  term ((-70006158824 : Rat) / 698101743) [(5, 1), (7, 1), (9, 2), (13, 1), (15, 1)],
  term ((35003079412 : Rat) / 698101743) [(5, 1), (8, 2), (9, 1), (13, 1), (15, 1)],
  term ((35003079412 : Rat) / 698101743) [(5, 1), (9, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 94 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0094_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0094
        rs_R009_ueqv_R009NNNYN_generator_18_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_18_0094 := by
  native_decide

/-- Coefficient term 95 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0095 : Poly :=
[
  term ((689100146 : Rat) / 698101743) [(5, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 95 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0095 : Poly :=
[
  term ((1378200292 : Rat) / 698101743) [(5, 1), (6, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((1378200292 : Rat) / 698101743) [(5, 1), (7, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-689100146 : Rat) / 698101743) [(5, 1), (8, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-689100146 : Rat) / 698101743) [(5, 1), (9, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 95 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0095_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0095
        rs_R009_ueqv_R009NNNYN_generator_18_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_18_0095 := by
  native_decide

/-- Coefficient term 96 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0096 : Poly :=
[
  term ((1823250517964 : Rat) / 18848747061) [(5, 1), (9, 1), (15, 2)]
]

/-- Partial product 96 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0096 : Poly :=
[
  term ((3646501035928 : Rat) / 18848747061) [(5, 1), (6, 1), (8, 1), (9, 1), (15, 2)],
  term ((3646501035928 : Rat) / 18848747061) [(5, 1), (7, 1), (9, 2), (15, 2)],
  term ((-1823250517964 : Rat) / 18848747061) [(5, 1), (8, 2), (9, 1), (15, 2)],
  term ((-1823250517964 : Rat) / 18848747061) [(5, 1), (9, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 96 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0096_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0096
        rs_R009_ueqv_R009NNNYN_generator_18_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_18_0096 := by
  native_decide

/-- Coefficient term 97 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0097 : Poly :=
[
  term ((-76905767668 : Rat) / 18848747061) [(5, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 97 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0097 : Poly :=
[
  term ((-153811535336 : Rat) / 18848747061) [(5, 1), (6, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((-153811535336 : Rat) / 18848747061) [(5, 1), (7, 1), (9, 2), (15, 2), (16, 1)],
  term ((76905767668 : Rat) / 18848747061) [(5, 1), (8, 2), (9, 1), (15, 2), (16, 1)],
  term ((76905767668 : Rat) / 18848747061) [(5, 1), (9, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 97 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0097_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0097
        rs_R009_ueqv_R009NNNYN_generator_18_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_18_0097 := by
  native_decide

/-- Coefficient term 98 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0098 : Poly :=
[
  term ((22051204672 : Rat) / 6282915687) [(5, 1), (9, 2), (11, 1)]
]

/-- Partial product 98 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0098 : Poly :=
[
  term ((44102409344 : Rat) / 6282915687) [(5, 1), (6, 1), (8, 1), (9, 2), (11, 1)],
  term ((44102409344 : Rat) / 6282915687) [(5, 1), (7, 1), (9, 3), (11, 1)],
  term ((-22051204672 : Rat) / 6282915687) [(5, 1), (8, 2), (9, 2), (11, 1)],
  term ((-22051204672 : Rat) / 6282915687) [(5, 1), (9, 4), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 98 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0098_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0098
        rs_R009_ueqv_R009NNNYN_generator_18_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_18_0098 := by
  native_decide

/-- Coefficient term 99 from coefficient polynomial 18. -/
def rs_R009_ueqv_R009NNNYN_coefficient_18_0099 : Poly :=
[
  term ((344550073 : Rat) / 232700581) [(5, 1), (9, 2), (13, 1)]
]

/-- Partial product 99 for generator 18. -/
def rs_R009_ueqv_R009NNNYN_partial_18_0099 : Poly :=
[
  term ((689100146 : Rat) / 232700581) [(5, 1), (6, 1), (8, 1), (9, 2), (13, 1)],
  term ((689100146 : Rat) / 232700581) [(5, 1), (7, 1), (9, 3), (13, 1)],
  term ((-344550073 : Rat) / 232700581) [(5, 1), (8, 2), (9, 2), (13, 1)],
  term ((-344550073 : Rat) / 232700581) [(5, 1), (9, 4), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 99 for generator 18. -/
theorem rs_R009_ueqv_R009NNNYN_partial_18_0099_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_18_0099
        rs_R009_ueqv_R009NNNYN_generator_18_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_18_0099 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NNNYN_partials_18_0000_0099 : List Poly :=
[
  rs_R009_ueqv_R009NNNYN_partial_18_0000,
  rs_R009_ueqv_R009NNNYN_partial_18_0001,
  rs_R009_ueqv_R009NNNYN_partial_18_0002,
  rs_R009_ueqv_R009NNNYN_partial_18_0003,
  rs_R009_ueqv_R009NNNYN_partial_18_0004,
  rs_R009_ueqv_R009NNNYN_partial_18_0005,
  rs_R009_ueqv_R009NNNYN_partial_18_0006,
  rs_R009_ueqv_R009NNNYN_partial_18_0007,
  rs_R009_ueqv_R009NNNYN_partial_18_0008,
  rs_R009_ueqv_R009NNNYN_partial_18_0009,
  rs_R009_ueqv_R009NNNYN_partial_18_0010,
  rs_R009_ueqv_R009NNNYN_partial_18_0011,
  rs_R009_ueqv_R009NNNYN_partial_18_0012,
  rs_R009_ueqv_R009NNNYN_partial_18_0013,
  rs_R009_ueqv_R009NNNYN_partial_18_0014,
  rs_R009_ueqv_R009NNNYN_partial_18_0015,
  rs_R009_ueqv_R009NNNYN_partial_18_0016,
  rs_R009_ueqv_R009NNNYN_partial_18_0017,
  rs_R009_ueqv_R009NNNYN_partial_18_0018,
  rs_R009_ueqv_R009NNNYN_partial_18_0019,
  rs_R009_ueqv_R009NNNYN_partial_18_0020,
  rs_R009_ueqv_R009NNNYN_partial_18_0021,
  rs_R009_ueqv_R009NNNYN_partial_18_0022,
  rs_R009_ueqv_R009NNNYN_partial_18_0023,
  rs_R009_ueqv_R009NNNYN_partial_18_0024,
  rs_R009_ueqv_R009NNNYN_partial_18_0025,
  rs_R009_ueqv_R009NNNYN_partial_18_0026,
  rs_R009_ueqv_R009NNNYN_partial_18_0027,
  rs_R009_ueqv_R009NNNYN_partial_18_0028,
  rs_R009_ueqv_R009NNNYN_partial_18_0029,
  rs_R009_ueqv_R009NNNYN_partial_18_0030,
  rs_R009_ueqv_R009NNNYN_partial_18_0031,
  rs_R009_ueqv_R009NNNYN_partial_18_0032,
  rs_R009_ueqv_R009NNNYN_partial_18_0033,
  rs_R009_ueqv_R009NNNYN_partial_18_0034,
  rs_R009_ueqv_R009NNNYN_partial_18_0035,
  rs_R009_ueqv_R009NNNYN_partial_18_0036,
  rs_R009_ueqv_R009NNNYN_partial_18_0037,
  rs_R009_ueqv_R009NNNYN_partial_18_0038,
  rs_R009_ueqv_R009NNNYN_partial_18_0039,
  rs_R009_ueqv_R009NNNYN_partial_18_0040,
  rs_R009_ueqv_R009NNNYN_partial_18_0041,
  rs_R009_ueqv_R009NNNYN_partial_18_0042,
  rs_R009_ueqv_R009NNNYN_partial_18_0043,
  rs_R009_ueqv_R009NNNYN_partial_18_0044,
  rs_R009_ueqv_R009NNNYN_partial_18_0045,
  rs_R009_ueqv_R009NNNYN_partial_18_0046,
  rs_R009_ueqv_R009NNNYN_partial_18_0047,
  rs_R009_ueqv_R009NNNYN_partial_18_0048,
  rs_R009_ueqv_R009NNNYN_partial_18_0049,
  rs_R009_ueqv_R009NNNYN_partial_18_0050,
  rs_R009_ueqv_R009NNNYN_partial_18_0051,
  rs_R009_ueqv_R009NNNYN_partial_18_0052,
  rs_R009_ueqv_R009NNNYN_partial_18_0053,
  rs_R009_ueqv_R009NNNYN_partial_18_0054,
  rs_R009_ueqv_R009NNNYN_partial_18_0055,
  rs_R009_ueqv_R009NNNYN_partial_18_0056,
  rs_R009_ueqv_R009NNNYN_partial_18_0057,
  rs_R009_ueqv_R009NNNYN_partial_18_0058,
  rs_R009_ueqv_R009NNNYN_partial_18_0059,
  rs_R009_ueqv_R009NNNYN_partial_18_0060,
  rs_R009_ueqv_R009NNNYN_partial_18_0061,
  rs_R009_ueqv_R009NNNYN_partial_18_0062,
  rs_R009_ueqv_R009NNNYN_partial_18_0063,
  rs_R009_ueqv_R009NNNYN_partial_18_0064,
  rs_R009_ueqv_R009NNNYN_partial_18_0065,
  rs_R009_ueqv_R009NNNYN_partial_18_0066,
  rs_R009_ueqv_R009NNNYN_partial_18_0067,
  rs_R009_ueqv_R009NNNYN_partial_18_0068,
  rs_R009_ueqv_R009NNNYN_partial_18_0069,
  rs_R009_ueqv_R009NNNYN_partial_18_0070,
  rs_R009_ueqv_R009NNNYN_partial_18_0071,
  rs_R009_ueqv_R009NNNYN_partial_18_0072,
  rs_R009_ueqv_R009NNNYN_partial_18_0073,
  rs_R009_ueqv_R009NNNYN_partial_18_0074,
  rs_R009_ueqv_R009NNNYN_partial_18_0075,
  rs_R009_ueqv_R009NNNYN_partial_18_0076,
  rs_R009_ueqv_R009NNNYN_partial_18_0077,
  rs_R009_ueqv_R009NNNYN_partial_18_0078,
  rs_R009_ueqv_R009NNNYN_partial_18_0079,
  rs_R009_ueqv_R009NNNYN_partial_18_0080,
  rs_R009_ueqv_R009NNNYN_partial_18_0081,
  rs_R009_ueqv_R009NNNYN_partial_18_0082,
  rs_R009_ueqv_R009NNNYN_partial_18_0083,
  rs_R009_ueqv_R009NNNYN_partial_18_0084,
  rs_R009_ueqv_R009NNNYN_partial_18_0085,
  rs_R009_ueqv_R009NNNYN_partial_18_0086,
  rs_R009_ueqv_R009NNNYN_partial_18_0087,
  rs_R009_ueqv_R009NNNYN_partial_18_0088,
  rs_R009_ueqv_R009NNNYN_partial_18_0089,
  rs_R009_ueqv_R009NNNYN_partial_18_0090,
  rs_R009_ueqv_R009NNNYN_partial_18_0091,
  rs_R009_ueqv_R009NNNYN_partial_18_0092,
  rs_R009_ueqv_R009NNNYN_partial_18_0093,
  rs_R009_ueqv_R009NNNYN_partial_18_0094,
  rs_R009_ueqv_R009NNNYN_partial_18_0095,
  rs_R009_ueqv_R009NNNYN_partial_18_0096,
  rs_R009_ueqv_R009NNNYN_partial_18_0097,
  rs_R009_ueqv_R009NNNYN_partial_18_0098,
  rs_R009_ueqv_R009NNNYN_partial_18_0099
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NNNYN_block_18_0000_0099 : Poly :=
[
  term ((8859380992 : Rat) / 110226591) [(0, 1), (6, 1), (8, 1), (9, 1), (11, 1)],
  term ((415283484 : Rat) / 12247399) [(0, 1), (6, 1), (8, 1), (9, 1), (13, 1)],
  term ((-7989263216 : Rat) / 110226591) [(0, 1), (6, 1), (8, 1), (9, 1), (15, 1)],
  term ((-26868251648 : Rat) / 330679773) [(0, 1), (6, 1), (8, 1), (11, 1), (13, 1)],
  term ((24229405504 : Rat) / 330679773) [(0, 1), (6, 1), (8, 1), (13, 1), (15, 1)],
  term ((-419816432 : Rat) / 12247399) [(0, 1), (6, 1), (8, 1), (13, 2)],
  term ((-26868251648 : Rat) / 330679773) [(0, 1), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((24229405504 : Rat) / 330679773) [(0, 1), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((-419816432 : Rat) / 12247399) [(0, 1), (7, 1), (9, 1), (13, 2)],
  term ((8859380992 : Rat) / 110226591) [(0, 1), (7, 1), (9, 2), (11, 1)],
  term ((415283484 : Rat) / 12247399) [(0, 1), (7, 1), (9, 2), (13, 1)],
  term ((-7989263216 : Rat) / 110226591) [(0, 1), (7, 1), (9, 2), (15, 1)],
  term ((-4429690496 : Rat) / 110226591) [(0, 1), (8, 2), (9, 1), (11, 1)],
  term ((-207641742 : Rat) / 12247399) [(0, 1), (8, 2), (9, 1), (13, 1)],
  term ((3994631608 : Rat) / 110226591) [(0, 1), (8, 2), (9, 1), (15, 1)],
  term ((13434125824 : Rat) / 330679773) [(0, 1), (8, 2), (11, 1), (13, 1)],
  term ((-12114702752 : Rat) / 330679773) [(0, 1), (8, 2), (13, 1), (15, 1)],
  term ((209908216 : Rat) / 12247399) [(0, 1), (8, 2), (13, 2)],
  term ((13434125824 : Rat) / 330679773) [(0, 1), (9, 2), (11, 1), (13, 1)],
  term ((-12114702752 : Rat) / 330679773) [(0, 1), (9, 2), (13, 1), (15, 1)],
  term ((209908216 : Rat) / 12247399) [(0, 1), (9, 2), (13, 2)],
  term ((-4429690496 : Rat) / 110226591) [(0, 1), (9, 3), (11, 1)],
  term ((-207641742 : Rat) / 12247399) [(0, 1), (9, 3), (13, 1)],
  term ((3994631608 : Rat) / 110226591) [(0, 1), (9, 3), (15, 1)],
  term ((669777920 : Rat) / 110226591) [(1, 1), (2, 1), (6, 1), (8, 1), (11, 1)],
  term ((31395840 : Rat) / 12247399) [(1, 1), (2, 1), (6, 1), (8, 1), (13, 1)],
  term ((-603996160 : Rat) / 110226591) [(1, 1), (2, 1), (6, 1), (8, 1), (15, 1)],
  term ((669777920 : Rat) / 110226591) [(1, 1), (2, 1), (7, 1), (9, 1), (11, 1)],
  term ((31395840 : Rat) / 12247399) [(1, 1), (2, 1), (7, 1), (9, 1), (13, 1)],
  term ((-603996160 : Rat) / 110226591) [(1, 1), (2, 1), (7, 1), (9, 1), (15, 1)],
  term ((-334888960 : Rat) / 110226591) [(1, 1), (2, 1), (8, 2), (11, 1)],
  term ((-15697920 : Rat) / 12247399) [(1, 1), (2, 1), (8, 2), (13, 1)],
  term ((301998080 : Rat) / 110226591) [(1, 1), (2, 1), (8, 2), (15, 1)],
  term ((-334888960 : Rat) / 110226591) [(1, 1), (2, 1), (9, 2), (11, 1)],
  term ((-15697920 : Rat) / 12247399) [(1, 1), (2, 1), (9, 2), (13, 1)],
  term ((301998080 : Rat) / 110226591) [(1, 1), (2, 1), (9, 2), (15, 1)],
  term ((-68067328 : Rat) / 182797) [(1, 1), (5, 1), (6, 1), (8, 1), (11, 1), (13, 1)],
  term ((3902021504 : Rat) / 12247399) [(1, 1), (5, 1), (6, 1), (8, 1), (13, 1), (15, 1)],
  term ((-28715904 : Rat) / 182797) [(1, 1), (5, 1), (6, 1), (8, 1), (13, 2)],
  term ((-68067328 : Rat) / 182797) [(1, 1), (5, 1), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((3902021504 : Rat) / 12247399) [(1, 1), (5, 1), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((-28715904 : Rat) / 182797) [(1, 1), (5, 1), (7, 1), (9, 1), (13, 2)],
  term ((34033664 : Rat) / 182797) [(1, 1), (5, 1), (8, 2), (11, 1), (13, 1)],
  term ((-1951010752 : Rat) / 12247399) [(1, 1), (5, 1), (8, 2), (13, 1), (15, 1)],
  term ((14357952 : Rat) / 182797) [(1, 1), (5, 1), (8, 2), (13, 2)],
  term ((34033664 : Rat) / 182797) [(1, 1), (5, 1), (9, 2), (11, 1), (13, 1)],
  term ((-1951010752 : Rat) / 12247399) [(1, 1), (5, 1), (9, 2), (13, 1), (15, 1)],
  term ((14357952 : Rat) / 182797) [(1, 1), (5, 1), (9, 2), (13, 2)],
  term ((-108 : Rat) / 67) [(1, 1), (6, 1), (8, 1), (9, 1)],
  term ((34033664 : Rat) / 182797) [(1, 1), (6, 1), (8, 1), (9, 1), (11, 1), (13, 1)],
  term ((-1951010752 : Rat) / 12247399) [(1, 1), (6, 1), (8, 1), (9, 1), (13, 1), (15, 1)],
  term ((14357952 : Rat) / 182797) [(1, 1), (6, 1), (8, 1), (9, 1), (13, 2)],
  term ((-2580411430912 : Rat) / 31414578435) [(1, 1), (6, 1), (8, 1), (10, 1), (11, 1)],
  term ((-40318928608 : Rat) / 1163502905) [(1, 1), (6, 1), (8, 1), (10, 1), (13, 1)],
  term ((2326978165376 : Rat) / 31414578435) [(1, 1), (6, 1), (8, 1), (10, 1), (15, 1)],
  term ((12332324150192 : Rat) / 94243735305) [(1, 1), (6, 1), (8, 1), (11, 1)],
  term ((-18745567232 : Rat) / 110226591) [(1, 1), (6, 1), (8, 1), (11, 1), (12, 1)],
  term ((-38993920 : Rat) / 110226591) [(1, 1), (6, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((1546897408 : Rat) / 330679773) [(1, 1), (6, 1), (8, 1), (11, 1), (14, 1)],
  term ((-97484800 : Rat) / 110226591) [(1, 1), (6, 1), (8, 1), (11, 1), (15, 2)],
  term ((-878698464 : Rat) / 12247399) [(1, 1), (6, 1), (8, 1), (12, 1), (13, 1)],
  term ((16430674912 : Rat) / 110226591) [(1, 1), (6, 1), (8, 1), (12, 1), (15, 1)],
  term ((197967400778 : Rat) / 3490508715) [(1, 1), (6, 1), (8, 1), (13, 1)],
  term ((24170272 : Rat) / 12247399) [(1, 1), (6, 1), (8, 1), (13, 1), (14, 1)],
  term ((-5962240 : Rat) / 110226591) [(1, 1), (6, 1), (8, 1), (13, 1), (15, 2)],
  term ((-1827840 : Rat) / 12247399) [(1, 1), (6, 1), (8, 1), (13, 2), (15, 1)],
  term ((-1394969984 : Rat) / 330679773) [(1, 1), (6, 1), (8, 1), (14, 1), (15, 1)],
  term ((-11701245221956 : Rat) / 94243735305) [(1, 1), (6, 1), (8, 1), (15, 1)],
  term ((87910400 : Rat) / 110226591) [(1, 1), (6, 1), (8, 1), (15, 3)],
  term ((-2580411430912 : Rat) / 31414578435) [(1, 1), (7, 1), (9, 1), (10, 1), (11, 1)],
  term ((-40318928608 : Rat) / 1163502905) [(1, 1), (7, 1), (9, 1), (10, 1), (13, 1)],
  term ((2326978165376 : Rat) / 31414578435) [(1, 1), (7, 1), (9, 1), (10, 1), (15, 1)],
  term ((12332324150192 : Rat) / 94243735305) [(1, 1), (7, 1), (9, 1), (11, 1)],
  term ((-18745567232 : Rat) / 110226591) [(1, 1), (7, 1), (9, 1), (11, 1), (12, 1)],
  term ((-38993920 : Rat) / 110226591) [(1, 1), (7, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((1546897408 : Rat) / 330679773) [(1, 1), (7, 1), (9, 1), (11, 1), (14, 1)],
  term ((-97484800 : Rat) / 110226591) [(1, 1), (7, 1), (9, 1), (11, 1), (15, 2)],
  term ((-878698464 : Rat) / 12247399) [(1, 1), (7, 1), (9, 1), (12, 1), (13, 1)],
  term ((16430674912 : Rat) / 110226591) [(1, 1), (7, 1), (9, 1), (12, 1), (15, 1)],
  term ((197967400778 : Rat) / 3490508715) [(1, 1), (7, 1), (9, 1), (13, 1)],
  term ((24170272 : Rat) / 12247399) [(1, 1), (7, 1), (9, 1), (13, 1), (14, 1)],
  term ((-5962240 : Rat) / 110226591) [(1, 1), (7, 1), (9, 1), (13, 1), (15, 2)],
  term ((-1827840 : Rat) / 12247399) [(1, 1), (7, 1), (9, 1), (13, 2), (15, 1)],
  term ((-1394969984 : Rat) / 330679773) [(1, 1), (7, 1), (9, 1), (14, 1), (15, 1)],
  term ((-11701245221956 : Rat) / 94243735305) [(1, 1), (7, 1), (9, 1), (15, 1)],
  term ((87910400 : Rat) / 110226591) [(1, 1), (7, 1), (9, 1), (15, 3)],
  term ((-108 : Rat) / 67) [(1, 1), (7, 1), (9, 2)],
  term ((34033664 : Rat) / 182797) [(1, 1), (7, 1), (9, 2), (11, 1), (13, 1)],
  term ((-1951010752 : Rat) / 12247399) [(1, 1), (7, 1), (9, 2), (13, 1), (15, 1)],
  term ((14357952 : Rat) / 182797) [(1, 1), (7, 1), (9, 2), (13, 2)],
  term ((54 : Rat) / 67) [(1, 1), (8, 2), (9, 1)],
  term ((-17016832 : Rat) / 182797) [(1, 1), (8, 2), (9, 1), (11, 1), (13, 1)],
  term ((975505376 : Rat) / 12247399) [(1, 1), (8, 2), (9, 1), (13, 1), (15, 1)],
  term ((-7178976 : Rat) / 182797) [(1, 1), (8, 2), (9, 1), (13, 2)],
  term ((1290205715456 : Rat) / 31414578435) [(1, 1), (8, 2), (10, 1), (11, 1)],
  term ((20159464304 : Rat) / 1163502905) [(1, 1), (8, 2), (10, 1), (13, 1)],
  term ((-1163489082688 : Rat) / 31414578435) [(1, 1), (8, 2), (10, 1), (15, 1)],
  term ((-6166162075096 : Rat) / 94243735305) [(1, 1), (8, 2), (11, 1)],
  term ((9372783616 : Rat) / 110226591) [(1, 1), (8, 2), (11, 1), (12, 1)],
  term ((19496960 : Rat) / 110226591) [(1, 1), (8, 2), (11, 1), (13, 1), (15, 1)],
  term ((-773448704 : Rat) / 330679773) [(1, 1), (8, 2), (11, 1), (14, 1)],
  term ((48742400 : Rat) / 110226591) [(1, 1), (8, 2), (11, 1), (15, 2)],
  term ((439349232 : Rat) / 12247399) [(1, 1), (8, 2), (12, 1), (13, 1)],
  term ((-8215337456 : Rat) / 110226591) [(1, 1), (8, 2), (12, 1), (15, 1)],
  term ((-98983700389 : Rat) / 3490508715) [(1, 1), (8, 2), (13, 1)],
  term ((-12085136 : Rat) / 12247399) [(1, 1), (8, 2), (13, 1), (14, 1)],
  term ((2981120 : Rat) / 110226591) [(1, 1), (8, 2), (13, 1), (15, 2)],
  term ((913920 : Rat) / 12247399) [(1, 1), (8, 2), (13, 2), (15, 1)],
  term ((697484992 : Rat) / 330679773) [(1, 1), (8, 2), (14, 1), (15, 1)],
  term ((5850622610978 : Rat) / 94243735305) [(1, 1), (8, 2), (15, 1)],
  term ((-43955200 : Rat) / 110226591) [(1, 1), (8, 2), (15, 3)],
  term ((1290205715456 : Rat) / 31414578435) [(1, 1), (9, 2), (10, 1), (11, 1)],
  term ((20159464304 : Rat) / 1163502905) [(1, 1), (9, 2), (10, 1), (13, 1)],
  term ((-1163489082688 : Rat) / 31414578435) [(1, 1), (9, 2), (10, 1), (15, 1)],
  term ((-6166162075096 : Rat) / 94243735305) [(1, 1), (9, 2), (11, 1)],
  term ((9372783616 : Rat) / 110226591) [(1, 1), (9, 2), (11, 1), (12, 1)],
  term ((19496960 : Rat) / 110226591) [(1, 1), (9, 2), (11, 1), (13, 1), (15, 1)],
  term ((-773448704 : Rat) / 330679773) [(1, 1), (9, 2), (11, 1), (14, 1)],
  term ((48742400 : Rat) / 110226591) [(1, 1), (9, 2), (11, 1), (15, 2)],
  term ((439349232 : Rat) / 12247399) [(1, 1), (9, 2), (12, 1), (13, 1)],
  term ((-8215337456 : Rat) / 110226591) [(1, 1), (9, 2), (12, 1), (15, 1)],
  term ((-98983700389 : Rat) / 3490508715) [(1, 1), (9, 2), (13, 1)],
  term ((-12085136 : Rat) / 12247399) [(1, 1), (9, 2), (13, 1), (14, 1)],
  term ((2981120 : Rat) / 110226591) [(1, 1), (9, 2), (13, 1), (15, 2)],
  term ((913920 : Rat) / 12247399) [(1, 1), (9, 2), (13, 2), (15, 1)],
  term ((697484992 : Rat) / 330679773) [(1, 1), (9, 2), (14, 1), (15, 1)],
  term ((5850622610978 : Rat) / 94243735305) [(1, 1), (9, 2), (15, 1)],
  term ((-43955200 : Rat) / 110226591) [(1, 1), (9, 2), (15, 3)],
  term ((54 : Rat) / 67) [(1, 1), (9, 3)],
  term ((-17016832 : Rat) / 182797) [(1, 1), (9, 3), (11, 1), (13, 1)],
  term ((975505376 : Rat) / 12247399) [(1, 1), (9, 3), (13, 1), (15, 1)],
  term ((-7178976 : Rat) / 182797) [(1, 1), (9, 3), (13, 2)],
  term ((-9522903040 : Rat) / 330679773) [(2, 1), (5, 1), (6, 1), (8, 1), (11, 1)],
  term ((-5371125760 : Rat) / 330679773) [(2, 1), (5, 1), (6, 1), (8, 1), (11, 1), (12, 1)],
  term ((-12956303360 : Rat) / 330679773) [(2, 1), (5, 1), (6, 1), (8, 1), (11, 1), (14, 1)],
  term ((-1676738560 : Rat) / 110226591) [(2, 1), (5, 1), (6, 1), (8, 1), (11, 1), (15, 2)],
  term ((-83923840 : Rat) / 12247399) [(2, 1), (5, 1), (6, 1), (8, 1), (12, 1), (13, 1)],
  term ((4843604480 : Rat) / 330679773) [(2, 1), (5, 1), (6, 1), (8, 1), (12, 1), (15, 1)],
  term ((-148795360 : Rat) / 12247399) [(2, 1), (5, 1), (6, 1), (8, 1), (13, 1)],
  term ((-202442240 : Rat) / 12247399) [(2, 1), (5, 1), (6, 1), (8, 1), (13, 1), (14, 1)],
  term ((-78597120 : Rat) / 12247399) [(2, 1), (5, 1), (6, 1), (8, 1), (13, 1), (15, 2)],
  term ((11683809280 : Rat) / 330679773) [(2, 1), (5, 1), (6, 1), (8, 1), (14, 1), (15, 1)],
  term ((8587617920 : Rat) / 330679773) [(2, 1), (5, 1), (6, 1), (8, 1), (15, 1)],
  term ((1512058880 : Rat) / 110226591) [(2, 1), (5, 1), (6, 1), (8, 1), (15, 3)],
  term ((-9522903040 : Rat) / 330679773) [(2, 1), (5, 1), (7, 1), (9, 1), (11, 1)],
  term ((-5371125760 : Rat) / 330679773) [(2, 1), (5, 1), (7, 1), (9, 1), (11, 1), (12, 1)],
  term ((-12956303360 : Rat) / 330679773) [(2, 1), (5, 1), (7, 1), (9, 1), (11, 1), (14, 1)],
  term ((-1676738560 : Rat) / 110226591) [(2, 1), (5, 1), (7, 1), (9, 1), (11, 1), (15, 2)],
  term ((-83923840 : Rat) / 12247399) [(2, 1), (5, 1), (7, 1), (9, 1), (12, 1), (13, 1)],
  term ((4843604480 : Rat) / 330679773) [(2, 1), (5, 1), (7, 1), (9, 1), (12, 1), (15, 1)],
  term ((-148795360 : Rat) / 12247399) [(2, 1), (5, 1), (7, 1), (9, 1), (13, 1)],
  term ((-202442240 : Rat) / 12247399) [(2, 1), (5, 1), (7, 1), (9, 1), (13, 1), (14, 1)],
  term ((-78597120 : Rat) / 12247399) [(2, 1), (5, 1), (7, 1), (9, 1), (13, 1), (15, 2)],
  term ((11683809280 : Rat) / 330679773) [(2, 1), (5, 1), (7, 1), (9, 1), (14, 1), (15, 1)],
  term ((8587617920 : Rat) / 330679773) [(2, 1), (5, 1), (7, 1), (9, 1), (15, 1)],
  term ((1512058880 : Rat) / 110226591) [(2, 1), (5, 1), (7, 1), (9, 1), (15, 3)],
  term ((4761451520 : Rat) / 330679773) [(2, 1), (5, 1), (8, 2), (11, 1)],
  term ((2685562880 : Rat) / 330679773) [(2, 1), (5, 1), (8, 2), (11, 1), (12, 1)],
  term ((6478151680 : Rat) / 330679773) [(2, 1), (5, 1), (8, 2), (11, 1), (14, 1)],
  term ((838369280 : Rat) / 110226591) [(2, 1), (5, 1), (8, 2), (11, 1), (15, 2)],
  term ((41961920 : Rat) / 12247399) [(2, 1), (5, 1), (8, 2), (12, 1), (13, 1)],
  term ((-2421802240 : Rat) / 330679773) [(2, 1), (5, 1), (8, 2), (12, 1), (15, 1)],
  term ((74397680 : Rat) / 12247399) [(2, 1), (5, 1), (8, 2), (13, 1)],
  term ((101221120 : Rat) / 12247399) [(2, 1), (5, 1), (8, 2), (13, 1), (14, 1)],
  term ((39298560 : Rat) / 12247399) [(2, 1), (5, 1), (8, 2), (13, 1), (15, 2)],
  term ((-5841904640 : Rat) / 330679773) [(2, 1), (5, 1), (8, 2), (14, 1), (15, 1)],
  term ((-4293808960 : Rat) / 330679773) [(2, 1), (5, 1), (8, 2), (15, 1)],
  term ((-756029440 : Rat) / 110226591) [(2, 1), (5, 1), (8, 2), (15, 3)],
  term ((4761451520 : Rat) / 330679773) [(2, 1), (5, 1), (9, 2), (11, 1)],
  term ((2685562880 : Rat) / 330679773) [(2, 1), (5, 1), (9, 2), (11, 1), (12, 1)],
  term ((6478151680 : Rat) / 330679773) [(2, 1), (5, 1), (9, 2), (11, 1), (14, 1)],
  term ((838369280 : Rat) / 110226591) [(2, 1), (5, 1), (9, 2), (11, 1), (15, 2)],
  term ((41961920 : Rat) / 12247399) [(2, 1), (5, 1), (9, 2), (12, 1), (13, 1)],
  term ((-2421802240 : Rat) / 330679773) [(2, 1), (5, 1), (9, 2), (12, 1), (15, 1)],
  term ((74397680 : Rat) / 12247399) [(2, 1), (5, 1), (9, 2), (13, 1)],
  term ((101221120 : Rat) / 12247399) [(2, 1), (5, 1), (9, 2), (13, 1), (14, 1)],
  term ((39298560 : Rat) / 12247399) [(2, 1), (5, 1), (9, 2), (13, 1), (15, 2)],
  term ((-5841904640 : Rat) / 330679773) [(2, 1), (5, 1), (9, 2), (14, 1), (15, 1)],
  term ((-4293808960 : Rat) / 330679773) [(2, 1), (5, 1), (9, 2), (15, 1)],
  term ((-756029440 : Rat) / 110226591) [(2, 1), (5, 1), (9, 2), (15, 3)],
  term ((-167444480 : Rat) / 110226591) [(2, 1), (6, 1), (7, 1), (8, 1), (11, 1)],
  term ((-7848960 : Rat) / 12247399) [(2, 1), (6, 1), (7, 1), (8, 1), (13, 1)],
  term ((150999040 : Rat) / 110226591) [(2, 1), (6, 1), (7, 1), (8, 1), (15, 1)],
  term ((2046714880 : Rat) / 330679773) [(2, 1), (6, 1), (8, 1), (9, 1), (11, 1)],
  term ((2685562880 : Rat) / 330679773) [(2, 1), (6, 1), (8, 1), (9, 1), (11, 1), (12, 1)],
  term ((6478151680 : Rat) / 330679773) [(2, 1), (6, 1), (8, 1), (9, 1), (11, 1), (14, 1)],
  term ((838369280 : Rat) / 110226591) [(2, 1), (6, 1), (8, 1), (9, 1), (11, 1), (15, 2)],
  term ((41961920 : Rat) / 12247399) [(2, 1), (6, 1), (8, 1), (9, 1), (12, 1), (13, 1)],
  term ((-2421802240 : Rat) / 330679773) [(2, 1), (6, 1), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((31979920 : Rat) / 12247399) [(2, 1), (6, 1), (8, 1), (9, 1), (13, 1)],
  term ((101221120 : Rat) / 12247399) [(2, 1), (6, 1), (8, 1), (9, 1), (13, 1), (14, 1)],
  term ((39298560 : Rat) / 12247399) [(2, 1), (6, 1), (8, 1), (9, 1), (13, 1), (15, 2)],
  term ((-5841904640 : Rat) / 330679773) [(2, 1), (6, 1), (8, 1), (9, 1), (14, 1), (15, 1)],
  term ((-1845698240 : Rat) / 330679773) [(2, 1), (6, 1), (8, 1), (9, 1), (15, 1)],
  term ((-756029440 : Rat) / 110226591) [(2, 1), (6, 1), (8, 1), (9, 1), (15, 3)],
  term ((1209098240 : Rat) / 330679773) [(2, 1), (6, 1), (8, 1), (11, 1), (13, 1)],
  term ((-1090347520 : Rat) / 330679773) [(2, 1), (6, 1), (8, 1), (13, 1), (15, 1)],
  term ((18892160 : Rat) / 12247399) [(2, 1), (6, 1), (8, 1), (13, 2)],
  term ((83722240 : Rat) / 110226591) [(2, 1), (7, 1), (8, 2), (11, 1)],
  term ((3924480 : Rat) / 12247399) [(2, 1), (7, 1), (8, 2), (13, 1)],
  term ((-75499520 : Rat) / 110226591) [(2, 1), (7, 1), (8, 2), (15, 1)],
  term ((1209098240 : Rat) / 330679773) [(2, 1), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((-1090347520 : Rat) / 330679773) [(2, 1), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((18892160 : Rat) / 12247399) [(2, 1), (7, 1), (9, 1), (13, 2)],
  term ((2297881600 : Rat) / 330679773) [(2, 1), (7, 1), (9, 2), (11, 1)],
  term ((2685562880 : Rat) / 330679773) [(2, 1), (7, 1), (9, 2), (11, 1), (12, 1)],
  term ((6478151680 : Rat) / 330679773) [(2, 1), (7, 1), (9, 2), (11, 1), (14, 1)],
  term ((838369280 : Rat) / 110226591) [(2, 1), (7, 1), (9, 2), (11, 1), (15, 2)],
  term ((41961920 : Rat) / 12247399) [(2, 1), (7, 1), (9, 2), (12, 1), (13, 1)],
  term ((-2421802240 : Rat) / 330679773) [(2, 1), (7, 1), (9, 2), (12, 1), (15, 1)],
  term ((35904400 : Rat) / 12247399) [(2, 1), (7, 1), (9, 2), (13, 1)],
  term ((101221120 : Rat) / 12247399) [(2, 1), (7, 1), (9, 2), (13, 1), (14, 1)],
  term ((39298560 : Rat) / 12247399) [(2, 1), (7, 1), (9, 2), (13, 1), (15, 2)],
  term ((-5841904640 : Rat) / 330679773) [(2, 1), (7, 1), (9, 2), (14, 1), (15, 1)],
  term ((-2072196800 : Rat) / 330679773) [(2, 1), (7, 1), (9, 2), (15, 1)],
  term ((-756029440 : Rat) / 110226591) [(2, 1), (7, 1), (9, 2), (15, 3)],
  term ((-167444480 : Rat) / 110226591) [(2, 1), (7, 2), (9, 1), (11, 1)],
  term ((-7848960 : Rat) / 12247399) [(2, 1), (7, 2), (9, 1), (13, 1)],
  term ((150999040 : Rat) / 110226591) [(2, 1), (7, 2), (9, 1), (15, 1)],
  term ((-1023357440 : Rat) / 330679773) [(2, 1), (8, 2), (9, 1), (11, 1)],
  term ((-1342781440 : Rat) / 330679773) [(2, 1), (8, 2), (9, 1), (11, 1), (12, 1)],
  term ((-3239075840 : Rat) / 330679773) [(2, 1), (8, 2), (9, 1), (11, 1), (14, 1)],
  term ((-419184640 : Rat) / 110226591) [(2, 1), (8, 2), (9, 1), (11, 1), (15, 2)],
  term ((-20980960 : Rat) / 12247399) [(2, 1), (8, 2), (9, 1), (12, 1), (13, 1)],
  term ((1210901120 : Rat) / 330679773) [(2, 1), (8, 2), (9, 1), (12, 1), (15, 1)],
  term ((-15989960 : Rat) / 12247399) [(2, 1), (8, 2), (9, 1), (13, 1)],
  term ((-50610560 : Rat) / 12247399) [(2, 1), (8, 2), (9, 1), (13, 1), (14, 1)],
  term ((-19649280 : Rat) / 12247399) [(2, 1), (8, 2), (9, 1), (13, 1), (15, 2)],
  term ((2920952320 : Rat) / 330679773) [(2, 1), (8, 2), (9, 1), (14, 1), (15, 1)],
  term ((922849120 : Rat) / 330679773) [(2, 1), (8, 2), (9, 1), (15, 1)],
  term ((378014720 : Rat) / 110226591) [(2, 1), (8, 2), (9, 1), (15, 3)],
  term ((-604549120 : Rat) / 330679773) [(2, 1), (8, 2), (11, 1), (13, 1)],
  term ((545173760 : Rat) / 330679773) [(2, 1), (8, 2), (13, 1), (15, 1)],
  term ((-9446080 : Rat) / 12247399) [(2, 1), (8, 2), (13, 2)],
  term ((-604549120 : Rat) / 330679773) [(2, 1), (9, 2), (11, 1), (13, 1)],
  term ((545173760 : Rat) / 330679773) [(2, 1), (9, 2), (13, 1), (15, 1)],
  term ((-9446080 : Rat) / 12247399) [(2, 1), (9, 2), (13, 2)],
  term ((-1023357440 : Rat) / 330679773) [(2, 1), (9, 3), (11, 1)],
  term ((-1342781440 : Rat) / 330679773) [(2, 1), (9, 3), (11, 1), (12, 1)],
  term ((-3239075840 : Rat) / 330679773) [(2, 1), (9, 3), (11, 1), (14, 1)],
  term ((-419184640 : Rat) / 110226591) [(2, 1), (9, 3), (11, 1), (15, 2)],
  term ((-20980960 : Rat) / 12247399) [(2, 1), (9, 3), (12, 1), (13, 1)],
  term ((1210901120 : Rat) / 330679773) [(2, 1), (9, 3), (12, 1), (15, 1)],
  term ((-15989960 : Rat) / 12247399) [(2, 1), (9, 3), (13, 1)],
  term ((-50610560 : Rat) / 12247399) [(2, 1), (9, 3), (13, 1), (14, 1)],
  term ((-19649280 : Rat) / 12247399) [(2, 1), (9, 3), (13, 1), (15, 2)],
  term ((2920952320 : Rat) / 330679773) [(2, 1), (9, 3), (14, 1), (15, 1)],
  term ((922849120 : Rat) / 330679773) [(2, 1), (9, 3), (15, 1)],
  term ((378014720 : Rat) / 110226591) [(2, 1), (9, 3), (15, 3)],
  term ((-38133760 : Rat) / 6239241) [(3, 1), (6, 1), (8, 1), (11, 1)],
  term ((1209098240 : Rat) / 330679773) [(3, 1), (6, 1), (8, 1), (11, 1), (12, 1)],
  term ((2330746880 : Rat) / 330679773) [(3, 1), (6, 1), (8, 1), (11, 1), (14, 1)],
  term ((18892160 : Rat) / 12247399) [(3, 1), (6, 1), (8, 1), (12, 1), (13, 1)],
  term ((-1090347520 : Rat) / 330679773) [(3, 1), (6, 1), (8, 1), (12, 1), (15, 1)],
  term ((-595840 : Rat) / 231083) [(3, 1), (6, 1), (8, 1), (13, 1)],
  term ((36417920 : Rat) / 12247399) [(3, 1), (6, 1), (8, 1), (13, 1), (14, 1)],
  term ((-2101834240 : Rat) / 330679773) [(3, 1), (6, 1), (8, 1), (14, 1), (15, 1)],
  term ((34388480 : Rat) / 6239241) [(3, 1), (6, 1), (8, 1), (15, 1)],
  term ((-38133760 : Rat) / 6239241) [(3, 1), (7, 1), (9, 1), (11, 1)],
  term ((1209098240 : Rat) / 330679773) [(3, 1), (7, 1), (9, 1), (11, 1), (12, 1)],
  term ((2330746880 : Rat) / 330679773) [(3, 1), (7, 1), (9, 1), (11, 1), (14, 1)],
  term ((18892160 : Rat) / 12247399) [(3, 1), (7, 1), (9, 1), (12, 1), (13, 1)],
  term ((-1090347520 : Rat) / 330679773) [(3, 1), (7, 1), (9, 1), (12, 1), (15, 1)],
  term ((-595840 : Rat) / 231083) [(3, 1), (7, 1), (9, 1), (13, 1)],
  term ((36417920 : Rat) / 12247399) [(3, 1), (7, 1), (9, 1), (13, 1), (14, 1)],
  term ((-2101834240 : Rat) / 330679773) [(3, 1), (7, 1), (9, 1), (14, 1), (15, 1)],
  term ((34388480 : Rat) / 6239241) [(3, 1), (7, 1), (9, 1), (15, 1)],
  term ((19066880 : Rat) / 6239241) [(3, 1), (8, 2), (11, 1)],
  term ((-604549120 : Rat) / 330679773) [(3, 1), (8, 2), (11, 1), (12, 1)],
  term ((-1165373440 : Rat) / 330679773) [(3, 1), (8, 2), (11, 1), (14, 1)],
  term ((-9446080 : Rat) / 12247399) [(3, 1), (8, 2), (12, 1), (13, 1)],
  term ((545173760 : Rat) / 330679773) [(3, 1), (8, 2), (12, 1), (15, 1)],
  term ((297920 : Rat) / 231083) [(3, 1), (8, 2), (13, 1)],
  term ((-18208960 : Rat) / 12247399) [(3, 1), (8, 2), (13, 1), (14, 1)],
  term ((1050917120 : Rat) / 330679773) [(3, 1), (8, 2), (14, 1), (15, 1)],
  term ((-17194240 : Rat) / 6239241) [(3, 1), (8, 2), (15, 1)],
  term ((19066880 : Rat) / 6239241) [(3, 1), (9, 2), (11, 1)],
  term ((-604549120 : Rat) / 330679773) [(3, 1), (9, 2), (11, 1), (12, 1)],
  term ((-1165373440 : Rat) / 330679773) [(3, 1), (9, 2), (11, 1), (14, 1)],
  term ((-9446080 : Rat) / 12247399) [(3, 1), (9, 2), (12, 1), (13, 1)],
  term ((545173760 : Rat) / 330679773) [(3, 1), (9, 2), (12, 1), (15, 1)],
  term ((297920 : Rat) / 231083) [(3, 1), (9, 2), (13, 1)],
  term ((-18208960 : Rat) / 12247399) [(3, 1), (9, 2), (13, 1), (14, 1)],
  term ((1050917120 : Rat) / 330679773) [(3, 1), (9, 2), (14, 1), (15, 1)],
  term ((-17194240 : Rat) / 6239241) [(3, 1), (9, 2), (15, 1)],
  term ((2528 : Rat) / 67) [(5, 1), (6, 1), (7, 1), (8, 1)],
  term ((-41678329552384 : Rat) / 471218676525) [(5, 1), (6, 1), (7, 1), (8, 1), (9, 1), (11, 1)],
  term ((-651223899256 : Rat) / 17452543575) [(5, 1), (6, 1), (7, 1), (8, 1), (9, 1), (13, 1)],
  term ((46953030799532 : Rat) / 471218676525) [(5, 1), (6, 1), (7, 1), (8, 1), (9, 1), (15, 1)],
  term ((-795686080 : Rat) / 12247399) [(5, 1), (6, 1), (7, 1), (8, 1), (11, 1), (13, 1)],
  term ((67506462887504 : Rat) / 157072892175) [(5, 1), (6, 1), (7, 1), (8, 1), (11, 1), (15, 1)],
  term ((-8771824241152 : Rat) / 157072892175) [(5, 1), (6, 1), (7, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-50923909120 : Rat) / 330679773) [(5, 1), (6, 1), (7, 1), (8, 1), (11, 2)],
  term ((647729275536 : Rat) / 5817514525) [(5, 1), (6, 1), (7, 1), (8, 1), (13, 1), (15, 1)],
  term ((-137059753768 : Rat) / 5817514525) [(5, 1), (6, 1), (7, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-784 : Rat) / 67) [(5, 1), (6, 1), (7, 1), (8, 1), (14, 1)],
  term ((-4189813184288 : Rat) / 17452543575) [(5, 1), (6, 1), (7, 1), (8, 1), (15, 2)],
  term ((9579498314696 : Rat) / 157072892175) [(5, 1), (6, 1), (7, 1), (8, 1), (15, 2), (16, 1)],
  term ((8771824241152 : Rat) / 157072892175) [(5, 1), (6, 1), (7, 2), (8, 1), (11, 1)],
  term ((137059753768 : Rat) / 5817514525) [(5, 1), (6, 1), (7, 2), (8, 1), (13, 1)],
  term ((-9579498314696 : Rat) / 157072892175) [(5, 1), (6, 1), (7, 2), (8, 1), (15, 1)],
  term ((-1133 : Rat) / 67) [(5, 1), (6, 1), (8, 1), (9, 1)],
  term ((1193529120 : Rat) / 12247399) [(5, 1), (6, 1), (8, 1), (9, 1), (11, 1), (13, 1)],
  term ((-9169716230312 : Rat) / 18848747061) [(5, 1), (6, 1), (8, 1), (9, 1), (11, 1), (15, 1)],
  term ((88204818688 : Rat) / 18848747061) [(5, 1), (6, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((25461954560 : Rat) / 110226591) [(5, 1), (6, 1), (8, 1), (9, 1), (11, 2)],
  term ((-70006158824 : Rat) / 698101743) [(5, 1), (6, 1), (8, 1), (9, 1), (13, 1), (15, 1)],
  term ((1378200292 : Rat) / 698101743) [(5, 1), (6, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((3646501035928 : Rat) / 18848747061) [(5, 1), (6, 1), (8, 1), (9, 1), (15, 2)],
  term ((-153811535336 : Rat) / 18848747061) [(5, 1), (6, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((44102409344 : Rat) / 6282915687) [(5, 1), (6, 1), (8, 1), (9, 2), (11, 1)],
  term ((689100146 : Rat) / 232700581) [(5, 1), (6, 1), (8, 1), (9, 2), (13, 1)],
  term ((-1264 : Rat) / 67) [(5, 1), (7, 1), (8, 2)],
  term ((20839164776192 : Rat) / 471218676525) [(5, 1), (7, 1), (8, 2), (9, 1), (11, 1)],
  term ((325611949628 : Rat) / 17452543575) [(5, 1), (7, 1), (8, 2), (9, 1), (13, 1)],
  term ((-23476515399766 : Rat) / 471218676525) [(5, 1), (7, 1), (8, 2), (9, 1), (15, 1)],
  term ((397843040 : Rat) / 12247399) [(5, 1), (7, 1), (8, 2), (11, 1), (13, 1)],
  term ((-33753231443752 : Rat) / 157072892175) [(5, 1), (7, 1), (8, 2), (11, 1), (15, 1)],
  term ((4385912120576 : Rat) / 157072892175) [(5, 1), (7, 1), (8, 2), (11, 1), (15, 1), (16, 1)],
  term ((25461954560 : Rat) / 330679773) [(5, 1), (7, 1), (8, 2), (11, 2)],
  term ((-323864637768 : Rat) / 5817514525) [(5, 1), (7, 1), (8, 2), (13, 1), (15, 1)],
  term ((68529876884 : Rat) / 5817514525) [(5, 1), (7, 1), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((392 : Rat) / 67) [(5, 1), (7, 1), (8, 2), (14, 1)],
  term ((2094906592144 : Rat) / 17452543575) [(5, 1), (7, 1), (8, 2), (15, 2)],
  term ((-4789749157348 : Rat) / 157072892175) [(5, 1), (7, 1), (8, 2), (15, 2), (16, 1)],
  term ((-2397 : Rat) / 67) [(5, 1), (7, 1), (9, 2)],
  term ((1591372160 : Rat) / 12247399) [(5, 1), (7, 1), (9, 2), (11, 1), (13, 1)],
  term ((-330502600089056 : Rat) / 471218676525) [(5, 1), (7, 1), (9, 2), (11, 1), (15, 1)],
  term ((15362856828928 : Rat) / 471218676525) [(5, 1), (7, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((101847818240 : Rat) / 330679773) [(5, 1), (7, 1), (9, 2), (11, 2)],
  term ((-2721747883904 : Rat) / 17452543575) [(5, 1), (7, 1), (9, 2), (13, 1), (15, 1)],
  term ((240044637952 : Rat) / 17452543575) [(5, 1), (7, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((392 : Rat) / 67) [(5, 1), (7, 1), (9, 2), (14, 1)],
  term ((147725003886088 : Rat) / 471218676525) [(5, 1), (7, 1), (9, 2), (15, 2)],
  term ((-18214535855444 : Rat) / 471218676525) [(5, 1), (7, 1), (9, 2), (15, 2), (16, 1)],
  term ((24146845476992 : Rat) / 471218676525) [(5, 1), (7, 1), (9, 3), (11, 1)],
  term ((377294460578 : Rat) / 17452543575) [(5, 1), (7, 1), (9, 3), (13, 1)],
  term ((-23476515399766 : Rat) / 471218676525) [(5, 1), (7, 1), (9, 3), (15, 1)],
  term ((-4385912120576 : Rat) / 157072892175) [(5, 1), (7, 2), (8, 2), (11, 1)],
  term ((-68529876884 : Rat) / 5817514525) [(5, 1), (7, 2), (8, 2), (13, 1)],
  term ((4789749157348 : Rat) / 157072892175) [(5, 1), (7, 2), (8, 2), (15, 1)],
  term ((2528 : Rat) / 67) [(5, 1), (7, 2), (9, 1)],
  term ((-795686080 : Rat) / 12247399) [(5, 1), (7, 2), (9, 1), (11, 1), (13, 1)],
  term ((67506462887504 : Rat) / 157072892175) [(5, 1), (7, 2), (9, 1), (11, 1), (15, 1)],
  term ((-8771824241152 : Rat) / 157072892175) [(5, 1), (7, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-50923909120 : Rat) / 330679773) [(5, 1), (7, 2), (9, 1), (11, 2)],
  term ((647729275536 : Rat) / 5817514525) [(5, 1), (7, 2), (9, 1), (13, 1), (15, 1)],
  term ((-137059753768 : Rat) / 5817514525) [(5, 1), (7, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-784 : Rat) / 67) [(5, 1), (7, 2), (9, 1), (14, 1)],
  term ((-4189813184288 : Rat) / 17452543575) [(5, 1), (7, 2), (9, 1), (15, 2)],
  term ((9579498314696 : Rat) / 157072892175) [(5, 1), (7, 2), (9, 1), (15, 2), (16, 1)],
  term ((-54836065914112 : Rat) / 471218676525) [(5, 1), (7, 2), (9, 2), (11, 1)],
  term ((-856813529908 : Rat) / 17452543575) [(5, 1), (7, 2), (9, 2), (13, 1)],
  term ((61322278271576 : Rat) / 471218676525) [(5, 1), (7, 2), (9, 2), (15, 1)],
  term ((8771824241152 : Rat) / 157072892175) [(5, 1), (7, 3), (9, 1), (11, 1)],
  term ((137059753768 : Rat) / 5817514525) [(5, 1), (7, 3), (9, 1), (13, 1)],
  term ((-9579498314696 : Rat) / 157072892175) [(5, 1), (7, 3), (9, 1), (15, 1)],
  term ((1133 : Rat) / 134) [(5, 1), (8, 2), (9, 1)],
  term ((-596764560 : Rat) / 12247399) [(5, 1), (8, 2), (9, 1), (11, 1), (13, 1)],
  term ((4584858115156 : Rat) / 18848747061) [(5, 1), (8, 2), (9, 1), (11, 1), (15, 1)],
  term ((-44102409344 : Rat) / 18848747061) [(5, 1), (8, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-12730977280 : Rat) / 110226591) [(5, 1), (8, 2), (9, 1), (11, 2)],
  term ((35003079412 : Rat) / 698101743) [(5, 1), (8, 2), (9, 1), (13, 1), (15, 1)],
  term ((-689100146 : Rat) / 698101743) [(5, 1), (8, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1823250517964 : Rat) / 18848747061) [(5, 1), (8, 2), (9, 1), (15, 2)],
  term ((76905767668 : Rat) / 18848747061) [(5, 1), (8, 2), (9, 1), (15, 2), (16, 1)],
  term ((-22051204672 : Rat) / 6282915687) [(5, 1), (8, 2), (9, 2), (11, 1)],
  term ((-344550073 : Rat) / 232700581) [(5, 1), (8, 2), (9, 2), (13, 1)],
  term ((1133 : Rat) / 134) [(5, 1), (9, 3)],
  term ((-596764560 : Rat) / 12247399) [(5, 1), (9, 3), (11, 1), (13, 1)],
  term ((4584858115156 : Rat) / 18848747061) [(5, 1), (9, 3), (11, 1), (15, 1)],
  term ((-44102409344 : Rat) / 18848747061) [(5, 1), (9, 3), (11, 1), (15, 1), (16, 1)],
  term ((-12730977280 : Rat) / 110226591) [(5, 1), (9, 3), (11, 2)],
  term ((35003079412 : Rat) / 698101743) [(5, 1), (9, 3), (13, 1), (15, 1)],
  term ((-689100146 : Rat) / 698101743) [(5, 1), (9, 3), (13, 1), (15, 1), (16, 1)],
  term ((-1823250517964 : Rat) / 18848747061) [(5, 1), (9, 3), (15, 2)],
  term ((76905767668 : Rat) / 18848747061) [(5, 1), (9, 3), (15, 2), (16, 1)],
  term ((-22051204672 : Rat) / 6282915687) [(5, 1), (9, 4), (11, 1)],
  term ((-344550073 : Rat) / 232700581) [(5, 1), (9, 4), (13, 1)],
  term ((-125 : Rat) / 268) [(6, 1), (8, 1)],
  term ((-125 : Rat) / 268) [(7, 1), (9, 1)],
  term ((125 : Rat) / 536) [(8, 2)],
  term ((125 : Rat) / 536) [(9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 18, terms 0 through 99. -/
theorem rs_R009_ueqv_R009NNNYN_block_18_0000_0099_valid :
    checkProductSumEq rs_R009_ueqv_R009NNNYN_partials_18_0000_0099
      rs_R009_ueqv_R009NNNYN_block_18_0000_0099 = true := by
  native_decide

end R009UeqvR009NNNYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
