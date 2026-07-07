/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NNNYN, term block 9:0-86

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NNNYNTermShards

/-- Generator polynomial 9 for relaxed split surplus certificate `R009:u=v:R009NNNYN`. -/
def rs_R009_ueqv_R009NNNYN_generator_09_0000_0086 : Poly :=
[
  term (-2 : Rat) [(0, 1), (2, 1)],
  term (2 : Rat) [(0, 1), (12, 1)],
  term (-2 : Rat) [(1, 1), (3, 1)],
  term (2 : Rat) [(1, 1), (13, 1)],
  term (1 : Rat) [(2, 2)],
  term (1 : Rat) [(3, 2)],
  term (-1 : Rat) [(12, 2)],
  term (-1 : Rat) [(13, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNYN_coefficient_09_0000 : Poly :=
[
  term ((49315840 : Rat) / 36742197) [(2, 1), (11, 1), (13, 1)]
]

/-- Partial product 0 for generator 9. -/
def rs_R009_ueqv_R009NNNYN_partial_09_0000 : Poly :=
[
  term ((98631680 : Rat) / 36742197) [(0, 1), (2, 1), (11, 1), (12, 1), (13, 1)],
  term ((-98631680 : Rat) / 36742197) [(0, 1), (2, 2), (11, 1), (13, 1)],
  term ((-98631680 : Rat) / 36742197) [(1, 1), (2, 1), (3, 1), (11, 1), (13, 1)],
  term ((98631680 : Rat) / 36742197) [(1, 1), (2, 1), (11, 1), (13, 2)],
  term ((49315840 : Rat) / 36742197) [(2, 1), (3, 2), (11, 1), (13, 1)],
  term ((-49315840 : Rat) / 36742197) [(2, 1), (11, 1), (12, 2), (13, 1)],
  term ((-49315840 : Rat) / 36742197) [(2, 1), (11, 1), (13, 3)],
  term ((49315840 : Rat) / 36742197) [(2, 3), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 9. -/
theorem rs_R009_ueqv_R009NNNYN_partial_09_0000_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_09_0000
        rs_R009_ueqv_R009NNNYN_generator_09_0000_0086 =
      rs_R009_ueqv_R009NNNYN_partial_09_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNYN_coefficient_09_0001 : Poly :=
[
  term ((-902030080 : Rat) / 330679773) [(2, 1), (11, 1), (15, 1)]
]

/-- Partial product 1 for generator 9. -/
def rs_R009_ueqv_R009NNNYN_partial_09_0001 : Poly :=
[
  term ((-1804060160 : Rat) / 330679773) [(0, 1), (2, 1), (11, 1), (12, 1), (15, 1)],
  term ((1804060160 : Rat) / 330679773) [(0, 1), (2, 2), (11, 1), (15, 1)],
  term ((1804060160 : Rat) / 330679773) [(1, 1), (2, 1), (3, 1), (11, 1), (15, 1)],
  term ((-1804060160 : Rat) / 330679773) [(1, 1), (2, 1), (11, 1), (13, 1), (15, 1)],
  term ((-902030080 : Rat) / 330679773) [(2, 1), (3, 2), (11, 1), (15, 1)],
  term ((902030080 : Rat) / 330679773) [(2, 1), (11, 1), (12, 2), (15, 1)],
  term ((902030080 : Rat) / 330679773) [(2, 1), (11, 1), (13, 2), (15, 1)],
  term ((-902030080 : Rat) / 330679773) [(2, 3), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 9. -/
theorem rs_R009_ueqv_R009NNNYN_partial_09_0001_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_09_0001
        rs_R009_ueqv_R009NNNYN_generator_09_0000_0086 =
      rs_R009_ueqv_R009NNNYN_partial_09_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNYN_coefficient_09_0002 : Poly :=
[
  term ((-86754980 : Rat) / 36742197) [(2, 1), (13, 1), (15, 1)]
]

/-- Partial product 2 for generator 9. -/
def rs_R009_ueqv_R009NNNYN_partial_09_0002 : Poly :=
[
  term ((-173509960 : Rat) / 36742197) [(0, 1), (2, 1), (12, 1), (13, 1), (15, 1)],
  term ((173509960 : Rat) / 36742197) [(0, 1), (2, 2), (13, 1), (15, 1)],
  term ((173509960 : Rat) / 36742197) [(1, 1), (2, 1), (3, 1), (13, 1), (15, 1)],
  term ((-173509960 : Rat) / 36742197) [(1, 1), (2, 1), (13, 2), (15, 1)],
  term ((-86754980 : Rat) / 36742197) [(2, 1), (3, 2), (13, 1), (15, 1)],
  term ((86754980 : Rat) / 36742197) [(2, 1), (12, 2), (13, 1), (15, 1)],
  term ((86754980 : Rat) / 36742197) [(2, 1), (13, 3), (15, 1)],
  term ((-86754980 : Rat) / 36742197) [(2, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 9. -/
theorem rs_R009_ueqv_R009NNNYN_partial_09_0002_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_09_0002
        rs_R009_ueqv_R009NNNYN_generator_09_0000_0086 =
      rs_R009_ueqv_R009NNNYN_partial_09_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNYN_coefficient_09_0003 : Poly :=
[
  term ((6935040 : Rat) / 12247399) [(2, 1), (13, 2)]
]

/-- Partial product 3 for generator 9. -/
def rs_R009_ueqv_R009NNNYN_partial_09_0003 : Poly :=
[
  term ((13870080 : Rat) / 12247399) [(0, 1), (2, 1), (12, 1), (13, 2)],
  term ((-13870080 : Rat) / 12247399) [(0, 1), (2, 2), (13, 2)],
  term ((-13870080 : Rat) / 12247399) [(1, 1), (2, 1), (3, 1), (13, 2)],
  term ((13870080 : Rat) / 12247399) [(1, 1), (2, 1), (13, 3)],
  term ((6935040 : Rat) / 12247399) [(2, 1), (3, 2), (13, 2)],
  term ((-6935040 : Rat) / 12247399) [(2, 1), (12, 2), (13, 2)],
  term ((-6935040 : Rat) / 12247399) [(2, 1), (13, 4)],
  term ((6935040 : Rat) / 12247399) [(2, 3), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 9. -/
theorem rs_R009_ueqv_R009NNNYN_partial_09_0003_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_09_0003
        rs_R009_ueqv_R009NNNYN_generator_09_0000_0086 =
      rs_R009_ueqv_R009NNNYN_partial_09_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNYN_coefficient_09_0004 : Poly :=
[
  term ((813437840 : Rat) / 330679773) [(2, 1), (15, 2)]
]

/-- Partial product 4 for generator 9. -/
def rs_R009_ueqv_R009NNNYN_partial_09_0004 : Poly :=
[
  term ((1626875680 : Rat) / 330679773) [(0, 1), (2, 1), (12, 1), (15, 2)],
  term ((-1626875680 : Rat) / 330679773) [(0, 1), (2, 2), (15, 2)],
  term ((-1626875680 : Rat) / 330679773) [(1, 1), (2, 1), (3, 1), (15, 2)],
  term ((1626875680 : Rat) / 330679773) [(1, 1), (2, 1), (13, 1), (15, 2)],
  term ((813437840 : Rat) / 330679773) [(2, 1), (3, 2), (15, 2)],
  term ((-813437840 : Rat) / 330679773) [(2, 1), (12, 2), (15, 2)],
  term ((-813437840 : Rat) / 330679773) [(2, 1), (13, 2), (15, 2)],
  term ((813437840 : Rat) / 330679773) [(2, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 9. -/
theorem rs_R009_ueqv_R009NNNYN_partial_09_0004_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_09_0004
        rs_R009_ueqv_R009NNNYN_generator_09_0000_0086 =
      rs_R009_ueqv_R009NNNYN_partial_09_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNYN_coefficient_09_0005 : Poly :=
[
  term ((1185873920 : Rat) / 330679773) [(3, 1), (11, 1)]
]

/-- Partial product 5 for generator 9. -/
def rs_R009_ueqv_R009NNNYN_partial_09_0005 : Poly :=
[
  term ((-2371747840 : Rat) / 330679773) [(0, 1), (2, 1), (3, 1), (11, 1)],
  term ((2371747840 : Rat) / 330679773) [(0, 1), (3, 1), (11, 1), (12, 1)],
  term ((2371747840 : Rat) / 330679773) [(1, 1), (3, 1), (11, 1), (13, 1)],
  term ((-2371747840 : Rat) / 330679773) [(1, 1), (3, 2), (11, 1)],
  term ((1185873920 : Rat) / 330679773) [(2, 2), (3, 1), (11, 1)],
  term ((-1185873920 : Rat) / 330679773) [(3, 1), (11, 1), (12, 2)],
  term ((-1185873920 : Rat) / 330679773) [(3, 1), (11, 1), (13, 2)],
  term ((1185873920 : Rat) / 330679773) [(3, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 9. -/
theorem rs_R009_ueqv_R009NNNYN_partial_09_0005_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_09_0005
        rs_R009_ueqv_R009NNNYN_generator_09_0000_0086 =
      rs_R009_ueqv_R009NNNYN_partial_09_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNYN_coefficient_09_0006 : Poly :=
[
  term ((335695360 : Rat) / 110226591) [(3, 1), (11, 1), (12, 1)]
]

/-- Partial product 6 for generator 9. -/
def rs_R009_ueqv_R009NNNYN_partial_09_0006 : Poly :=
[
  term ((-671390720 : Rat) / 110226591) [(0, 1), (2, 1), (3, 1), (11, 1), (12, 1)],
  term ((671390720 : Rat) / 110226591) [(0, 1), (3, 1), (11, 1), (12, 2)],
  term ((671390720 : Rat) / 110226591) [(1, 1), (3, 1), (11, 1), (12, 1), (13, 1)],
  term ((-671390720 : Rat) / 110226591) [(1, 1), (3, 2), (11, 1), (12, 1)],
  term ((335695360 : Rat) / 110226591) [(2, 2), (3, 1), (11, 1), (12, 1)],
  term ((-335695360 : Rat) / 110226591) [(3, 1), (11, 1), (12, 1), (13, 2)],
  term ((-335695360 : Rat) / 110226591) [(3, 1), (11, 1), (12, 3)],
  term ((335695360 : Rat) / 110226591) [(3, 3), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 9. -/
theorem rs_R009_ueqv_R009NNNYN_partial_09_0006_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_09_0006
        rs_R009_ueqv_R009NNNYN_generator_09_0000_0086 =
      rs_R009_ueqv_R009NNNYN_partial_09_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNYN_coefficient_09_0007 : Poly :=
[
  term ((-4161463040 : Rat) / 330679773) [(3, 1), (11, 1), (14, 1)]
]

/-- Partial product 7 for generator 9. -/
def rs_R009_ueqv_R009NNNYN_partial_09_0007 : Poly :=
[
  term ((8322926080 : Rat) / 330679773) [(0, 1), (2, 1), (3, 1), (11, 1), (14, 1)],
  term ((-8322926080 : Rat) / 330679773) [(0, 1), (3, 1), (11, 1), (12, 1), (14, 1)],
  term ((-8322926080 : Rat) / 330679773) [(1, 1), (3, 1), (11, 1), (13, 1), (14, 1)],
  term ((8322926080 : Rat) / 330679773) [(1, 1), (3, 2), (11, 1), (14, 1)],
  term ((-4161463040 : Rat) / 330679773) [(2, 2), (3, 1), (11, 1), (14, 1)],
  term ((4161463040 : Rat) / 330679773) [(3, 1), (11, 1), (12, 2), (14, 1)],
  term ((4161463040 : Rat) / 330679773) [(3, 1), (11, 1), (13, 2), (14, 1)],
  term ((-4161463040 : Rat) / 330679773) [(3, 3), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 9. -/
theorem rs_R009_ueqv_R009NNNYN_partial_09_0007_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_09_0007
        rs_R009_ueqv_R009NNNYN_generator_09_0000_0086 =
      rs_R009_ueqv_R009NNNYN_partial_09_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNYN_coefficient_09_0008 : Poly :=
[
  term ((15735720 : Rat) / 12247399) [(3, 1), (12, 1), (13, 1)]
]

/-- Partial product 8 for generator 9. -/
def rs_R009_ueqv_R009NNNYN_partial_09_0008 : Poly :=
[
  term ((-31471440 : Rat) / 12247399) [(0, 1), (2, 1), (3, 1), (12, 1), (13, 1)],
  term ((31471440 : Rat) / 12247399) [(0, 1), (3, 1), (12, 2), (13, 1)],
  term ((31471440 : Rat) / 12247399) [(1, 1), (3, 1), (12, 1), (13, 2)],
  term ((-31471440 : Rat) / 12247399) [(1, 1), (3, 2), (12, 1), (13, 1)],
  term ((15735720 : Rat) / 12247399) [(2, 2), (3, 1), (12, 1), (13, 1)],
  term ((-15735720 : Rat) / 12247399) [(3, 1), (12, 1), (13, 3)],
  term ((-15735720 : Rat) / 12247399) [(3, 1), (12, 3), (13, 1)],
  term ((15735720 : Rat) / 12247399) [(3, 3), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 9. -/
theorem rs_R009_ueqv_R009NNNYN_partial_09_0008_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_09_0008
        rs_R009_ueqv_R009NNNYN_generator_09_0000_0086 =
      rs_R009_ueqv_R009NNNYN_partial_09_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNYN_coefficient_09_0009 : Poly :=
[
  term ((-302725280 : Rat) / 110226591) [(3, 1), (12, 1), (15, 1)]
]

/-- Partial product 9 for generator 9. -/
def rs_R009_ueqv_R009NNNYN_partial_09_0009 : Poly :=
[
  term ((605450560 : Rat) / 110226591) [(0, 1), (2, 1), (3, 1), (12, 1), (15, 1)],
  term ((-605450560 : Rat) / 110226591) [(0, 1), (3, 1), (12, 2), (15, 1)],
  term ((-605450560 : Rat) / 110226591) [(1, 1), (3, 1), (12, 1), (13, 1), (15, 1)],
  term ((605450560 : Rat) / 110226591) [(1, 1), (3, 2), (12, 1), (15, 1)],
  term ((-302725280 : Rat) / 110226591) [(2, 2), (3, 1), (12, 1), (15, 1)],
  term ((302725280 : Rat) / 110226591) [(3, 1), (12, 1), (13, 2), (15, 1)],
  term ((302725280 : Rat) / 110226591) [(3, 1), (12, 3), (15, 1)],
  term ((-302725280 : Rat) / 110226591) [(3, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 9. -/
theorem rs_R009_ueqv_R009NNNYN_partial_09_0009_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_09_0009
        rs_R009_ueqv_R009NNNYN_generator_09_0000_0086 =
      rs_R009_ueqv_R009NNNYN_partial_09_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNYN_coefficient_09_0010 : Poly :=
[
  term ((18529280 : Rat) / 12247399) [(3, 1), (13, 1)]
]

/-- Partial product 10 for generator 9. -/
def rs_R009_ueqv_R009NNNYN_partial_09_0010 : Poly :=
[
  term ((-37058560 : Rat) / 12247399) [(0, 1), (2, 1), (3, 1), (13, 1)],
  term ((37058560 : Rat) / 12247399) [(0, 1), (3, 1), (12, 1), (13, 1)],
  term ((37058560 : Rat) / 12247399) [(1, 1), (3, 1), (13, 2)],
  term ((-37058560 : Rat) / 12247399) [(1, 1), (3, 2), (13, 1)],
  term ((18529280 : Rat) / 12247399) [(2, 2), (3, 1), (13, 1)],
  term ((-18529280 : Rat) / 12247399) [(3, 1), (12, 2), (13, 1)],
  term ((-18529280 : Rat) / 12247399) [(3, 1), (13, 3)],
  term ((18529280 : Rat) / 12247399) [(3, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 9. -/
theorem rs_R009_ueqv_R009NNNYN_partial_09_0010_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_09_0010
        rs_R009_ueqv_R009NNNYN_generator_09_0000_0086 =
      rs_R009_ueqv_R009NNNYN_partial_09_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNYN_coefficient_09_0011 : Poly :=
[
  term ((-65022860 : Rat) / 12247399) [(3, 1), (13, 1), (14, 1)]
]

/-- Partial product 11 for generator 9. -/
def rs_R009_ueqv_R009NNNYN_partial_09_0011 : Poly :=
[
  term ((130045720 : Rat) / 12247399) [(0, 1), (2, 1), (3, 1), (13, 1), (14, 1)],
  term ((-130045720 : Rat) / 12247399) [(0, 1), (3, 1), (12, 1), (13, 1), (14, 1)],
  term ((-130045720 : Rat) / 12247399) [(1, 1), (3, 1), (13, 2), (14, 1)],
  term ((130045720 : Rat) / 12247399) [(1, 1), (3, 2), (13, 1), (14, 1)],
  term ((-65022860 : Rat) / 12247399) [(2, 2), (3, 1), (13, 1), (14, 1)],
  term ((65022860 : Rat) / 12247399) [(3, 1), (12, 2), (13, 1), (14, 1)],
  term ((65022860 : Rat) / 12247399) [(3, 1), (13, 3), (14, 1)],
  term ((-65022860 : Rat) / 12247399) [(3, 3), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 9. -/
theorem rs_R009_ueqv_R009NNNYN_partial_09_0011_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_09_0011
        rs_R009_ueqv_R009NNNYN_generator_09_0000_0086 =
      rs_R009_ueqv_R009NNNYN_partial_09_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNYN_coefficient_09_0012 : Poly :=
[
  term ((3752747920 : Rat) / 330679773) [(3, 1), (14, 1), (15, 1)]
]

/-- Partial product 12 for generator 9. -/
def rs_R009_ueqv_R009NNNYN_partial_09_0012 : Poly :=
[
  term ((-7505495840 : Rat) / 330679773) [(0, 1), (2, 1), (3, 1), (14, 1), (15, 1)],
  term ((7505495840 : Rat) / 330679773) [(0, 1), (3, 1), (12, 1), (14, 1), (15, 1)],
  term ((7505495840 : Rat) / 330679773) [(1, 1), (3, 1), (13, 1), (14, 1), (15, 1)],
  term ((-7505495840 : Rat) / 330679773) [(1, 1), (3, 2), (14, 1), (15, 1)],
  term ((3752747920 : Rat) / 330679773) [(2, 2), (3, 1), (14, 1), (15, 1)],
  term ((-3752747920 : Rat) / 330679773) [(3, 1), (12, 2), (14, 1), (15, 1)],
  term ((-3752747920 : Rat) / 330679773) [(3, 1), (13, 2), (14, 1), (15, 1)],
  term ((3752747920 : Rat) / 330679773) [(3, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 9. -/
theorem rs_R009_ueqv_R009NNNYN_partial_09_0012_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_09_0012
        rs_R009_ueqv_R009NNNYN_generator_09_0000_0086 =
      rs_R009_ueqv_R009NNNYN_partial_09_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNYN_coefficient_09_0013 : Poly :=
[
  term ((-1069404160 : Rat) / 330679773) [(3, 1), (15, 1)]
]

/-- Partial product 13 for generator 9. -/
def rs_R009_ueqv_R009NNNYN_partial_09_0013 : Poly :=
[
  term ((2138808320 : Rat) / 330679773) [(0, 1), (2, 1), (3, 1), (15, 1)],
  term ((-2138808320 : Rat) / 330679773) [(0, 1), (3, 1), (12, 1), (15, 1)],
  term ((-2138808320 : Rat) / 330679773) [(1, 1), (3, 1), (13, 1), (15, 1)],
  term ((2138808320 : Rat) / 330679773) [(1, 1), (3, 2), (15, 1)],
  term ((-1069404160 : Rat) / 330679773) [(2, 2), (3, 1), (15, 1)],
  term ((1069404160 : Rat) / 330679773) [(3, 1), (12, 2), (15, 1)],
  term ((1069404160 : Rat) / 330679773) [(3, 1), (13, 2), (15, 1)],
  term ((-1069404160 : Rat) / 330679773) [(3, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 9. -/
theorem rs_R009_ueqv_R009NNNYN_partial_09_0013_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_09_0013
        rs_R009_ueqv_R009NNNYN_generator_09_0000_0086 =
      rs_R009_ueqv_R009NNNYN_partial_09_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNYN_coefficient_09_0014 : Poly :=
[
  term ((294 : Rat) / 67) [(5, 1), (9, 1)]
]

/-- Partial product 14 for generator 9. -/
def rs_R009_ueqv_R009NNNYN_partial_09_0014 : Poly :=
[
  term ((-588 : Rat) / 67) [(0, 1), (2, 1), (5, 1), (9, 1)],
  term ((588 : Rat) / 67) [(0, 1), (5, 1), (9, 1), (12, 1)],
  term ((-588 : Rat) / 67) [(1, 1), (3, 1), (5, 1), (9, 1)],
  term ((588 : Rat) / 67) [(1, 1), (5, 1), (9, 1), (13, 1)],
  term ((294 : Rat) / 67) [(2, 2), (5, 1), (9, 1)],
  term ((294 : Rat) / 67) [(3, 2), (5, 1), (9, 1)],
  term ((-294 : Rat) / 67) [(5, 1), (9, 1), (12, 2)],
  term ((-294 : Rat) / 67) [(5, 1), (9, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 9. -/
theorem rs_R009_ueqv_R009NNNYN_partial_09_0014_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_09_0014
        rs_R009_ueqv_R009NNNYN_generator_09_0000_0086 =
      rs_R009_ueqv_R009NNNYN_partial_09_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNYN_coefficient_09_0015 : Poly :=
[
  term ((-1290205715456 : Rat) / 31414578435) [(5, 1), (10, 1), (11, 1)]
]

/-- Partial product 15 for generator 9. -/
def rs_R009_ueqv_R009NNNYN_partial_09_0015 : Poly :=
[
  term ((2580411430912 : Rat) / 31414578435) [(0, 1), (2, 1), (5, 1), (10, 1), (11, 1)],
  term ((-2580411430912 : Rat) / 31414578435) [(0, 1), (5, 1), (10, 1), (11, 1), (12, 1)],
  term ((2580411430912 : Rat) / 31414578435) [(1, 1), (3, 1), (5, 1), (10, 1), (11, 1)],
  term ((-2580411430912 : Rat) / 31414578435) [(1, 1), (5, 1), (10, 1), (11, 1), (13, 1)],
  term ((-1290205715456 : Rat) / 31414578435) [(2, 2), (5, 1), (10, 1), (11, 1)],
  term ((-1290205715456 : Rat) / 31414578435) [(3, 2), (5, 1), (10, 1), (11, 1)],
  term ((1290205715456 : Rat) / 31414578435) [(5, 1), (10, 1), (11, 1), (12, 2)],
  term ((1290205715456 : Rat) / 31414578435) [(5, 1), (10, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 9. -/
theorem rs_R009_ueqv_R009NNNYN_partial_09_0015_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_09_0015
        rs_R009_ueqv_R009NNNYN_generator_09_0000_0086 =
      rs_R009_ueqv_R009NNNYN_partial_09_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNYN_coefficient_09_0016 : Poly :=
[
  term ((-20159464304 : Rat) / 1163502905) [(5, 1), (10, 1), (13, 1)]
]

/-- Partial product 16 for generator 9. -/
def rs_R009_ueqv_R009NNNYN_partial_09_0016 : Poly :=
[
  term ((40318928608 : Rat) / 1163502905) [(0, 1), (2, 1), (5, 1), (10, 1), (13, 1)],
  term ((-40318928608 : Rat) / 1163502905) [(0, 1), (5, 1), (10, 1), (12, 1), (13, 1)],
  term ((40318928608 : Rat) / 1163502905) [(1, 1), (3, 1), (5, 1), (10, 1), (13, 1)],
  term ((-40318928608 : Rat) / 1163502905) [(1, 1), (5, 1), (10, 1), (13, 2)],
  term ((-20159464304 : Rat) / 1163502905) [(2, 2), (5, 1), (10, 1), (13, 1)],
  term ((-20159464304 : Rat) / 1163502905) [(3, 2), (5, 1), (10, 1), (13, 1)],
  term ((20159464304 : Rat) / 1163502905) [(5, 1), (10, 1), (12, 2), (13, 1)],
  term ((20159464304 : Rat) / 1163502905) [(5, 1), (10, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 9. -/
theorem rs_R009_ueqv_R009NNNYN_partial_09_0016_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_09_0016
        rs_R009_ueqv_R009NNNYN_generator_09_0000_0086 =
      rs_R009_ueqv_R009NNNYN_partial_09_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNYN_coefficient_09_0017 : Poly :=
[
  term ((1163489082688 : Rat) / 31414578435) [(5, 1), (10, 1), (15, 1)]
]

/-- Partial product 17 for generator 9. -/
def rs_R009_ueqv_R009NNNYN_partial_09_0017 : Poly :=
[
  term ((-2326978165376 : Rat) / 31414578435) [(0, 1), (2, 1), (5, 1), (10, 1), (15, 1)],
  term ((2326978165376 : Rat) / 31414578435) [(0, 1), (5, 1), (10, 1), (12, 1), (15, 1)],
  term ((-2326978165376 : Rat) / 31414578435) [(1, 1), (3, 1), (5, 1), (10, 1), (15, 1)],
  term ((2326978165376 : Rat) / 31414578435) [(1, 1), (5, 1), (10, 1), (13, 1), (15, 1)],
  term ((1163489082688 : Rat) / 31414578435) [(2, 2), (5, 1), (10, 1), (15, 1)],
  term ((1163489082688 : Rat) / 31414578435) [(3, 2), (5, 1), (10, 1), (15, 1)],
  term ((-1163489082688 : Rat) / 31414578435) [(5, 1), (10, 1), (12, 2), (15, 1)],
  term ((-1163489082688 : Rat) / 31414578435) [(5, 1), (10, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 9. -/
theorem rs_R009_ueqv_R009NNNYN_partial_09_0017_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_09_0017
        rs_R009_ueqv_R009NNNYN_generator_09_0000_0086 =
      rs_R009_ueqv_R009NNNYN_partial_09_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNYN_coefficient_09_0018 : Poly :=
[
  term ((-2512096726048 : Rat) / 94243735305) [(5, 1), (11, 1)]
]

/-- Partial product 18 for generator 9. -/
def rs_R009_ueqv_R009NNNYN_partial_09_0018 : Poly :=
[
  term ((5024193452096 : Rat) / 94243735305) [(0, 1), (2, 1), (5, 1), (11, 1)],
  term ((-5024193452096 : Rat) / 94243735305) [(0, 1), (5, 1), (11, 1), (12, 1)],
  term ((5024193452096 : Rat) / 94243735305) [(1, 1), (3, 1), (5, 1), (11, 1)],
  term ((-5024193452096 : Rat) / 94243735305) [(1, 1), (5, 1), (11, 1), (13, 1)],
  term ((-2512096726048 : Rat) / 94243735305) [(2, 2), (5, 1), (11, 1)],
  term ((-2512096726048 : Rat) / 94243735305) [(3, 2), (5, 1), (11, 1)],
  term ((2512096726048 : Rat) / 94243735305) [(5, 1), (11, 1), (12, 2)],
  term ((2512096726048 : Rat) / 94243735305) [(5, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 9. -/
theorem rs_R009_ueqv_R009NNNYN_partial_09_0018_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_09_0018
        rs_R009_ueqv_R009NNNYN_generator_09_0000_0086 =
      rs_R009_ueqv_R009NNNYN_partial_09_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNYN_coefficient_09_0019 : Poly :=
[
  term ((9224029696 : Rat) / 110226591) [(5, 1), (11, 1), (12, 1)]
]

/-- Partial product 19 for generator 9. -/
def rs_R009_ueqv_R009NNNYN_partial_09_0019 : Poly :=
[
  term ((-18448059392 : Rat) / 110226591) [(0, 1), (2, 1), (5, 1), (11, 1), (12, 1)],
  term ((18448059392 : Rat) / 110226591) [(0, 1), (5, 1), (11, 1), (12, 2)],
  term ((-18448059392 : Rat) / 110226591) [(1, 1), (3, 1), (5, 1), (11, 1), (12, 1)],
  term ((18448059392 : Rat) / 110226591) [(1, 1), (5, 1), (11, 1), (12, 1), (13, 1)],
  term ((9224029696 : Rat) / 110226591) [(2, 2), (5, 1), (11, 1), (12, 1)],
  term ((9224029696 : Rat) / 110226591) [(3, 2), (5, 1), (11, 1), (12, 1)],
  term ((-9224029696 : Rat) / 110226591) [(5, 1), (11, 1), (12, 1), (13, 2)],
  term ((-9224029696 : Rat) / 110226591) [(5, 1), (11, 1), (12, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 9. -/
theorem rs_R009_ueqv_R009NNNYN_partial_09_0019_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_09_0019
        rs_R009_ueqv_R009NNNYN_generator_09_0000_0086 =
      rs_R009_ueqv_R009NNNYN_partial_09_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNYN_coefficient_09_0020 : Poly :=
[
  term ((19496960 : Rat) / 110226591) [(5, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 20 for generator 9. -/
def rs_R009_ueqv_R009NNNYN_partial_09_0020 : Poly :=
[
  term ((-38993920 : Rat) / 110226591) [(0, 1), (2, 1), (5, 1), (11, 1), (13, 1), (15, 1)],
  term ((38993920 : Rat) / 110226591) [(0, 1), (5, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-38993920 : Rat) / 110226591) [(1, 1), (3, 1), (5, 1), (11, 1), (13, 1), (15, 1)],
  term ((38993920 : Rat) / 110226591) [(1, 1), (5, 1), (11, 1), (13, 2), (15, 1)],
  term ((19496960 : Rat) / 110226591) [(2, 2), (5, 1), (11, 1), (13, 1), (15, 1)],
  term ((19496960 : Rat) / 110226591) [(3, 2), (5, 1), (11, 1), (13, 1), (15, 1)],
  term ((-19496960 : Rat) / 110226591) [(5, 1), (11, 1), (12, 2), (13, 1), (15, 1)],
  term ((-19496960 : Rat) / 110226591) [(5, 1), (11, 1), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 9. -/
theorem rs_R009_ueqv_R009NNNYN_partial_09_0020_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_09_0020
        rs_R009_ueqv_R009NNNYN_generator_09_0000_0086 =
      rs_R009_ueqv_R009NNNYN_partial_09_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNYN_coefficient_09_0021 : Poly :=
[
  term ((6149457664 : Rat) / 330679773) [(5, 1), (11, 1), (14, 1)]
]

/-- Partial product 21 for generator 9. -/
def rs_R009_ueqv_R009NNNYN_partial_09_0021 : Poly :=
[
  term ((-12298915328 : Rat) / 330679773) [(0, 1), (2, 1), (5, 1), (11, 1), (14, 1)],
  term ((12298915328 : Rat) / 330679773) [(0, 1), (5, 1), (11, 1), (12, 1), (14, 1)],
  term ((-12298915328 : Rat) / 330679773) [(1, 1), (3, 1), (5, 1), (11, 1), (14, 1)],
  term ((12298915328 : Rat) / 330679773) [(1, 1), (5, 1), (11, 1), (13, 1), (14, 1)],
  term ((6149457664 : Rat) / 330679773) [(2, 2), (5, 1), (11, 1), (14, 1)],
  term ((6149457664 : Rat) / 330679773) [(3, 2), (5, 1), (11, 1), (14, 1)],
  term ((-6149457664 : Rat) / 330679773) [(5, 1), (11, 1), (12, 2), (14, 1)],
  term ((-6149457664 : Rat) / 330679773) [(5, 1), (11, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 9. -/
theorem rs_R009_ueqv_R009NNNYN_partial_09_0021_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_09_0021
        rs_R009_ueqv_R009NNNYN_generator_09_0000_0086 =
      rs_R009_ueqv_R009NNNYN_partial_09_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNYN_coefficient_09_0022 : Poly :=
[
  term ((-185221120 : Rat) / 110226591) [(5, 1), (11, 1), (15, 2)]
]

/-- Partial product 22 for generator 9. -/
def rs_R009_ueqv_R009NNNYN_partial_09_0022 : Poly :=
[
  term ((370442240 : Rat) / 110226591) [(0, 1), (2, 1), (5, 1), (11, 1), (15, 2)],
  term ((-370442240 : Rat) / 110226591) [(0, 1), (5, 1), (11, 1), (12, 1), (15, 2)],
  term ((370442240 : Rat) / 110226591) [(1, 1), (3, 1), (5, 1), (11, 1), (15, 2)],
  term ((-370442240 : Rat) / 110226591) [(1, 1), (5, 1), (11, 1), (13, 1), (15, 2)],
  term ((-185221120 : Rat) / 110226591) [(2, 2), (5, 1), (11, 1), (15, 2)],
  term ((-185221120 : Rat) / 110226591) [(3, 2), (5, 1), (11, 1), (15, 2)],
  term ((185221120 : Rat) / 110226591) [(5, 1), (11, 1), (12, 2), (15, 2)],
  term ((185221120 : Rat) / 110226591) [(5, 1), (11, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 9. -/
theorem rs_R009_ueqv_R009NNNYN_partial_09_0022_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_09_0022
        rs_R009_ueqv_R009NNNYN_generator_09_0000_0086 =
      rs_R009_ueqv_R009NNNYN_partial_09_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNYN_coefficient_09_0023 : Poly :=
[
  term ((432376392 : Rat) / 12247399) [(5, 1), (12, 1), (13, 1)]
]

/-- Partial product 23 for generator 9. -/
def rs_R009_ueqv_R009NNNYN_partial_09_0023 : Poly :=
[
  term ((-864752784 : Rat) / 12247399) [(0, 1), (2, 1), (5, 1), (12, 1), (13, 1)],
  term ((864752784 : Rat) / 12247399) [(0, 1), (5, 1), (12, 2), (13, 1)],
  term ((-864752784 : Rat) / 12247399) [(1, 1), (3, 1), (5, 1), (12, 1), (13, 1)],
  term ((864752784 : Rat) / 12247399) [(1, 1), (5, 1), (12, 1), (13, 2)],
  term ((432376392 : Rat) / 12247399) [(2, 2), (5, 1), (12, 1), (13, 1)],
  term ((432376392 : Rat) / 12247399) [(3, 2), (5, 1), (12, 1), (13, 1)],
  term ((-432376392 : Rat) / 12247399) [(5, 1), (12, 1), (13, 3)],
  term ((-432376392 : Rat) / 12247399) [(5, 1), (12, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 9. -/
theorem rs_R009_ueqv_R009NNNYN_partial_09_0023_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_09_0023
        rs_R009_ueqv_R009NNNYN_generator_09_0000_0086 =
      rs_R009_ueqv_R009NNNYN_partial_09_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNYN_coefficient_09_0024 : Poly :=
[
  term ((-8081193296 : Rat) / 110226591) [(5, 1), (12, 1), (15, 1)]
]

/-- Partial product 24 for generator 9. -/
def rs_R009_ueqv_R009NNNYN_partial_09_0024 : Poly :=
[
  term ((16162386592 : Rat) / 110226591) [(0, 1), (2, 1), (5, 1), (12, 1), (15, 1)],
  term ((-16162386592 : Rat) / 110226591) [(0, 1), (5, 1), (12, 2), (15, 1)],
  term ((16162386592 : Rat) / 110226591) [(1, 1), (3, 1), (5, 1), (12, 1), (15, 1)],
  term ((-16162386592 : Rat) / 110226591) [(1, 1), (5, 1), (12, 1), (13, 1), (15, 1)],
  term ((-8081193296 : Rat) / 110226591) [(2, 2), (5, 1), (12, 1), (15, 1)],
  term ((-8081193296 : Rat) / 110226591) [(3, 2), (5, 1), (12, 1), (15, 1)],
  term ((8081193296 : Rat) / 110226591) [(5, 1), (12, 1), (13, 2), (15, 1)],
  term ((8081193296 : Rat) / 110226591) [(5, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 9. -/
theorem rs_R009_ueqv_R009NNNYN_partial_09_0024_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_09_0024
        rs_R009_ueqv_R009NNNYN_generator_09_0000_0086 =
      rs_R009_ueqv_R009NNNYN_partial_09_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNYN_coefficient_09_0025 : Poly :=
[
  term ((-78503022689 : Rat) / 6981017430) [(5, 1), (13, 1)]
]

/-- Partial product 25 for generator 9. -/
def rs_R009_ueqv_R009NNNYN_partial_09_0025 : Poly :=
[
  term ((78503022689 : Rat) / 3490508715) [(0, 1), (2, 1), (5, 1), (13, 1)],
  term ((-78503022689 : Rat) / 3490508715) [(0, 1), (5, 1), (12, 1), (13, 1)],
  term ((78503022689 : Rat) / 3490508715) [(1, 1), (3, 1), (5, 1), (13, 1)],
  term ((-78503022689 : Rat) / 3490508715) [(1, 1), (5, 1), (13, 2)],
  term ((-78503022689 : Rat) / 6981017430) [(2, 2), (5, 1), (13, 1)],
  term ((-78503022689 : Rat) / 6981017430) [(3, 2), (5, 1), (13, 1)],
  term ((78503022689 : Rat) / 6981017430) [(5, 1), (12, 2), (13, 1)],
  term ((78503022689 : Rat) / 6981017430) [(5, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 9. -/
theorem rs_R009_ueqv_R009NNNYN_partial_09_0025_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_09_0025
        rs_R009_ueqv_R009NNNYN_generator_09_0000_0086 =
      rs_R009_ueqv_R009NNNYN_partial_09_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNYN_coefficient_09_0026 : Poly :=
[
  term ((96085276 : Rat) / 12247399) [(5, 1), (13, 1), (14, 1)]
]

/-- Partial product 26 for generator 9. -/
def rs_R009_ueqv_R009NNNYN_partial_09_0026 : Poly :=
[
  term ((-192170552 : Rat) / 12247399) [(0, 1), (2, 1), (5, 1), (13, 1), (14, 1)],
  term ((192170552 : Rat) / 12247399) [(0, 1), (5, 1), (12, 1), (13, 1), (14, 1)],
  term ((-192170552 : Rat) / 12247399) [(1, 1), (3, 1), (5, 1), (13, 1), (14, 1)],
  term ((192170552 : Rat) / 12247399) [(1, 1), (5, 1), (13, 2), (14, 1)],
  term ((96085276 : Rat) / 12247399) [(2, 2), (5, 1), (13, 1), (14, 1)],
  term ((96085276 : Rat) / 12247399) [(3, 2), (5, 1), (13, 1), (14, 1)],
  term ((-96085276 : Rat) / 12247399) [(5, 1), (12, 2), (13, 1), (14, 1)],
  term ((-96085276 : Rat) / 12247399) [(5, 1), (13, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 9. -/
theorem rs_R009_ueqv_R009NNNYN_partial_09_0026_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_09_0026
        rs_R009_ueqv_R009NNNYN_generator_09_0000_0086 =
      rs_R009_ueqv_R009NNNYN_partial_09_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNYN_coefficient_09_0027 : Poly :=
[
  term ((-1806080 : Rat) / 2079747) [(5, 1), (13, 1), (15, 2)]
]

/-- Partial product 27 for generator 9. -/
def rs_R009_ueqv_R009NNNYN_partial_09_0027 : Poly :=
[
  term ((3612160 : Rat) / 2079747) [(0, 1), (2, 1), (5, 1), (13, 1), (15, 2)],
  term ((-3612160 : Rat) / 2079747) [(0, 1), (5, 1), (12, 1), (13, 1), (15, 2)],
  term ((3612160 : Rat) / 2079747) [(1, 1), (3, 1), (5, 1), (13, 1), (15, 2)],
  term ((-3612160 : Rat) / 2079747) [(1, 1), (5, 1), (13, 2), (15, 2)],
  term ((-1806080 : Rat) / 2079747) [(2, 2), (5, 1), (13, 1), (15, 2)],
  term ((-1806080 : Rat) / 2079747) [(3, 2), (5, 1), (13, 1), (15, 2)],
  term ((1806080 : Rat) / 2079747) [(5, 1), (12, 2), (13, 1), (15, 2)],
  term ((1806080 : Rat) / 2079747) [(5, 1), (13, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 9. -/
theorem rs_R009_ueqv_R009NNNYN_partial_09_0027_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_09_0027
        rs_R009_ueqv_R009NNNYN_generator_09_0000_0086 =
      rs_R009_ueqv_R009NNNYN_partial_09_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNYN_coefficient_09_0028 : Poly :=
[
  term ((913920 : Rat) / 12247399) [(5, 1), (13, 2), (15, 1)]
]

/-- Partial product 28 for generator 9. -/
def rs_R009_ueqv_R009NNNYN_partial_09_0028 : Poly :=
[
  term ((-1827840 : Rat) / 12247399) [(0, 1), (2, 1), (5, 1), (13, 2), (15, 1)],
  term ((1827840 : Rat) / 12247399) [(0, 1), (5, 1), (12, 1), (13, 2), (15, 1)],
  term ((-1827840 : Rat) / 12247399) [(1, 1), (3, 1), (5, 1), (13, 2), (15, 1)],
  term ((1827840 : Rat) / 12247399) [(1, 1), (5, 1), (13, 3), (15, 1)],
  term ((913920 : Rat) / 12247399) [(2, 2), (5, 1), (13, 2), (15, 1)],
  term ((913920 : Rat) / 12247399) [(3, 2), (5, 1), (13, 2), (15, 1)],
  term ((-913920 : Rat) / 12247399) [(5, 1), (12, 2), (13, 2), (15, 1)],
  term ((-913920 : Rat) / 12247399) [(5, 1), (13, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 9. -/
theorem rs_R009_ueqv_R009NNNYN_partial_09_0028_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_09_0028
        rs_R009_ueqv_R009NNNYN_generator_09_0000_0086 =
      rs_R009_ueqv_R009NNNYN_partial_09_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNYN_coefficient_09_0029 : Poly :=
[
  term ((-5545493072 : Rat) / 330679773) [(5, 1), (14, 1), (15, 1)]
]

/-- Partial product 29 for generator 9. -/
def rs_R009_ueqv_R009NNNYN_partial_09_0029 : Poly :=
[
  term ((11090986144 : Rat) / 330679773) [(0, 1), (2, 1), (5, 1), (14, 1), (15, 1)],
  term ((-11090986144 : Rat) / 330679773) [(0, 1), (5, 1), (12, 1), (14, 1), (15, 1)],
  term ((11090986144 : Rat) / 330679773) [(1, 1), (3, 1), (5, 1), (14, 1), (15, 1)],
  term ((-11090986144 : Rat) / 330679773) [(1, 1), (5, 1), (13, 1), (14, 1), (15, 1)],
  term ((-5545493072 : Rat) / 330679773) [(2, 2), (5, 1), (14, 1), (15, 1)],
  term ((-5545493072 : Rat) / 330679773) [(3, 2), (5, 1), (14, 1), (15, 1)],
  term ((5545493072 : Rat) / 330679773) [(5, 1), (12, 2), (14, 1), (15, 1)],
  term ((5545493072 : Rat) / 330679773) [(5, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 9. -/
theorem rs_R009_ueqv_R009NNNYN_partial_09_0029_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_09_0029
        rs_R009_ueqv_R009NNNYN_generator_09_0000_0086 =
      rs_R009_ueqv_R009NNNYN_partial_09_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNYN_coefficient_09_0030 : Poly :=
[
  term ((2403221986124 : Rat) / 94243735305) [(5, 1), (15, 1)]
]

/-- Partial product 30 for generator 9. -/
def rs_R009_ueqv_R009NNNYN_partial_09_0030 : Poly :=
[
  term ((-4806443972248 : Rat) / 94243735305) [(0, 1), (2, 1), (5, 1), (15, 1)],
  term ((4806443972248 : Rat) / 94243735305) [(0, 1), (5, 1), (12, 1), (15, 1)],
  term ((-4806443972248 : Rat) / 94243735305) [(1, 1), (3, 1), (5, 1), (15, 1)],
  term ((4806443972248 : Rat) / 94243735305) [(1, 1), (5, 1), (13, 1), (15, 1)],
  term ((2403221986124 : Rat) / 94243735305) [(2, 2), (5, 1), (15, 1)],
  term ((2403221986124 : Rat) / 94243735305) [(3, 2), (5, 1), (15, 1)],
  term ((-2403221986124 : Rat) / 94243735305) [(5, 1), (12, 2), (15, 1)],
  term ((-2403221986124 : Rat) / 94243735305) [(5, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 9. -/
theorem rs_R009_ueqv_R009NNNYN_partial_09_0030_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_09_0030
        rs_R009_ueqv_R009NNNYN_generator_09_0000_0086 =
      rs_R009_ueqv_R009NNNYN_partial_09_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNYN_coefficient_09_0031 : Poly :=
[
  term ((167029760 : Rat) / 110226591) [(5, 1), (15, 3)]
]

/-- Partial product 31 for generator 9. -/
def rs_R009_ueqv_R009NNNYN_partial_09_0031 : Poly :=
[
  term ((-334059520 : Rat) / 110226591) [(0, 1), (2, 1), (5, 1), (15, 3)],
  term ((334059520 : Rat) / 110226591) [(0, 1), (5, 1), (12, 1), (15, 3)],
  term ((-334059520 : Rat) / 110226591) [(1, 1), (3, 1), (5, 1), (15, 3)],
  term ((334059520 : Rat) / 110226591) [(1, 1), (5, 1), (13, 1), (15, 3)],
  term ((167029760 : Rat) / 110226591) [(2, 2), (5, 1), (15, 3)],
  term ((167029760 : Rat) / 110226591) [(3, 2), (5, 1), (15, 3)],
  term ((-167029760 : Rat) / 110226591) [(5, 1), (12, 2), (15, 3)],
  term ((-167029760 : Rat) / 110226591) [(5, 1), (13, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 9. -/
theorem rs_R009_ueqv_R009NNNYN_partial_09_0031_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_09_0031
        rs_R009_ueqv_R009NNNYN_generator_09_0000_0086 =
      rs_R009_ueqv_R009NNNYN_partial_09_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNYN_coefficient_09_0032 : Poly :=
[
  term ((-218121304576 : Rat) / 10471526145) [(7, 1), (10, 1), (11, 1)]
]

/-- Partial product 32 for generator 9. -/
def rs_R009_ueqv_R009NNNYN_partial_09_0032 : Poly :=
[
  term ((436242609152 : Rat) / 10471526145) [(0, 1), (2, 1), (7, 1), (10, 1), (11, 1)],
  term ((-436242609152 : Rat) / 10471526145) [(0, 1), (7, 1), (10, 1), (11, 1), (12, 1)],
  term ((436242609152 : Rat) / 10471526145) [(1, 1), (3, 1), (7, 1), (10, 1), (11, 1)],
  term ((-436242609152 : Rat) / 10471526145) [(1, 1), (7, 1), (10, 1), (11, 1), (13, 1)],
  term ((-218121304576 : Rat) / 10471526145) [(2, 2), (7, 1), (10, 1), (11, 1)],
  term ((-218121304576 : Rat) / 10471526145) [(3, 2), (7, 1), (10, 1), (11, 1)],
  term ((218121304576 : Rat) / 10471526145) [(7, 1), (10, 1), (11, 1), (12, 2)],
  term ((218121304576 : Rat) / 10471526145) [(7, 1), (10, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 9. -/
theorem rs_R009_ueqv_R009NNNYN_partial_09_0032_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_09_0032
        rs_R009_ueqv_R009NNNYN_generator_09_0000_0086 =
      rs_R009_ueqv_R009NNNYN_partial_09_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNYN_coefficient_09_0033 : Poly :=
[
  term ((-10224436152 : Rat) / 1163502905) [(7, 1), (10, 1), (13, 1)]
]

/-- Partial product 33 for generator 9. -/
def rs_R009_ueqv_R009NNNYN_partial_09_0033 : Poly :=
[
  term ((20448872304 : Rat) / 1163502905) [(0, 1), (2, 1), (7, 1), (10, 1), (13, 1)],
  term ((-20448872304 : Rat) / 1163502905) [(0, 1), (7, 1), (10, 1), (12, 1), (13, 1)],
  term ((20448872304 : Rat) / 1163502905) [(1, 1), (3, 1), (7, 1), (10, 1), (13, 1)],
  term ((-20448872304 : Rat) / 1163502905) [(1, 1), (7, 1), (10, 1), (13, 2)],
  term ((-10224436152 : Rat) / 1163502905) [(2, 2), (7, 1), (10, 1), (13, 1)],
  term ((-10224436152 : Rat) / 1163502905) [(3, 2), (7, 1), (10, 1), (13, 1)],
  term ((10224436152 : Rat) / 1163502905) [(7, 1), (10, 1), (12, 2), (13, 1)],
  term ((10224436152 : Rat) / 1163502905) [(7, 1), (10, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 9. -/
theorem rs_R009_ueqv_R009NNNYN_partial_09_0033_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_09_0033
        rs_R009_ueqv_R009NNNYN_generator_09_0000_0086 =
      rs_R009_ueqv_R009NNNYN_partial_09_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNYN_coefficient_09_0034 : Poly :=
[
  term ((196698676448 : Rat) / 10471526145) [(7, 1), (10, 1), (15, 1)]
]

/-- Partial product 34 for generator 9. -/
def rs_R009_ueqv_R009NNNYN_partial_09_0034 : Poly :=
[
  term ((-393397352896 : Rat) / 10471526145) [(0, 1), (2, 1), (7, 1), (10, 1), (15, 1)],
  term ((393397352896 : Rat) / 10471526145) [(0, 1), (7, 1), (10, 1), (12, 1), (15, 1)],
  term ((-393397352896 : Rat) / 10471526145) [(1, 1), (3, 1), (7, 1), (10, 1), (15, 1)],
  term ((393397352896 : Rat) / 10471526145) [(1, 1), (7, 1), (10, 1), (13, 1), (15, 1)],
  term ((196698676448 : Rat) / 10471526145) [(2, 2), (7, 1), (10, 1), (15, 1)],
  term ((196698676448 : Rat) / 10471526145) [(3, 2), (7, 1), (10, 1), (15, 1)],
  term ((-196698676448 : Rat) / 10471526145) [(7, 1), (10, 1), (12, 2), (15, 1)],
  term ((-196698676448 : Rat) / 10471526145) [(7, 1), (10, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 9. -/
theorem rs_R009_ueqv_R009NNNYN_partial_09_0034_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_09_0034
        rs_R009_ueqv_R009NNNYN_generator_09_0000_0086 =
      rs_R009_ueqv_R009NNNYN_partial_09_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNYN_coefficient_09_0035 : Poly :=
[
  term ((490847168 : Rat) / 110226591) [(7, 1), (11, 1)]
]

/-- Partial product 35 for generator 9. -/
def rs_R009_ueqv_R009NNNYN_partial_09_0035 : Poly :=
[
  term ((-981694336 : Rat) / 110226591) [(0, 1), (2, 1), (7, 1), (11, 1)],
  term ((981694336 : Rat) / 110226591) [(0, 1), (7, 1), (11, 1), (12, 1)],
  term ((-981694336 : Rat) / 110226591) [(1, 1), (3, 1), (7, 1), (11, 1)],
  term ((981694336 : Rat) / 110226591) [(1, 1), (7, 1), (11, 1), (13, 1)],
  term ((490847168 : Rat) / 110226591) [(2, 2), (7, 1), (11, 1)],
  term ((490847168 : Rat) / 110226591) [(3, 2), (7, 1), (11, 1)],
  term ((-490847168 : Rat) / 110226591) [(7, 1), (11, 1), (12, 2)],
  term ((-490847168 : Rat) / 110226591) [(7, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 9. -/
theorem rs_R009_ueqv_R009NNNYN_partial_09_0035_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_09_0035
        rs_R009_ueqv_R009NNNYN_generator_09_0000_0086 =
      rs_R009_ueqv_R009NNNYN_partial_09_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNYN_coefficient_09_0036 : Poly :=
[
  term ((-12911247104 : Rat) / 330679773) [(7, 1), (11, 1), (12, 1)]
]

/-- Partial product 36 for generator 9. -/
def rs_R009_ueqv_R009NNNYN_partial_09_0036 : Poly :=
[
  term ((25822494208 : Rat) / 330679773) [(0, 1), (2, 1), (7, 1), (11, 1), (12, 1)],
  term ((-25822494208 : Rat) / 330679773) [(0, 1), (7, 1), (11, 1), (12, 2)],
  term ((25822494208 : Rat) / 330679773) [(1, 1), (3, 1), (7, 1), (11, 1), (12, 1)],
  term ((-25822494208 : Rat) / 330679773) [(1, 1), (7, 1), (11, 1), (12, 1), (13, 1)],
  term ((-12911247104 : Rat) / 330679773) [(2, 2), (7, 1), (11, 1), (12, 1)],
  term ((-12911247104 : Rat) / 330679773) [(3, 2), (7, 1), (11, 1), (12, 1)],
  term ((12911247104 : Rat) / 330679773) [(7, 1), (11, 1), (12, 1), (13, 2)],
  term ((12911247104 : Rat) / 330679773) [(7, 1), (11, 1), (12, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 9. -/
theorem rs_R009_ueqv_R009NNNYN_partial_09_0036_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_09_0036
        rs_R009_ueqv_R009NNNYN_generator_09_0000_0086 =
      rs_R009_ueqv_R009NNNYN_partial_09_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNYN_coefficient_09_0037 : Poly :=
[
  term ((4569600 : Rat) / 12247399) [(7, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 37 for generator 9. -/
def rs_R009_ueqv_R009NNNYN_partial_09_0037 : Poly :=
[
  term ((-9139200 : Rat) / 12247399) [(0, 1), (2, 1), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((9139200 : Rat) / 12247399) [(0, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-9139200 : Rat) / 12247399) [(1, 1), (3, 1), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((9139200 : Rat) / 12247399) [(1, 1), (7, 1), (11, 1), (13, 2), (15, 1)],
  term ((4569600 : Rat) / 12247399) [(2, 2), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((4569600 : Rat) / 12247399) [(3, 2), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-4569600 : Rat) / 12247399) [(7, 1), (11, 1), (12, 2), (13, 1), (15, 1)],
  term ((-4569600 : Rat) / 12247399) [(7, 1), (11, 1), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 9. -/
theorem rs_R009_ueqv_R009NNNYN_partial_09_0037_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_09_0037
        rs_R009_ueqv_R009NNNYN_generator_09_0000_0086 =
      rs_R009_ueqv_R009NNNYN_partial_09_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNYN_coefficient_09_0038 : Poly :=
[
  term ((2680294400 : Rat) / 330679773) [(7, 1), (11, 1), (14, 1)]
]

/-- Partial product 38 for generator 9. -/
def rs_R009_ueqv_R009NNNYN_partial_09_0038 : Poly :=
[
  term ((-5360588800 : Rat) / 330679773) [(0, 1), (2, 1), (7, 1), (11, 1), (14, 1)],
  term ((5360588800 : Rat) / 330679773) [(0, 1), (7, 1), (11, 1), (12, 1), (14, 1)],
  term ((-5360588800 : Rat) / 330679773) [(1, 1), (3, 1), (7, 1), (11, 1), (14, 1)],
  term ((5360588800 : Rat) / 330679773) [(1, 1), (7, 1), (11, 1), (13, 1), (14, 1)],
  term ((2680294400 : Rat) / 330679773) [(2, 2), (7, 1), (11, 1), (14, 1)],
  term ((2680294400 : Rat) / 330679773) [(3, 2), (7, 1), (11, 1), (14, 1)],
  term ((-2680294400 : Rat) / 330679773) [(7, 1), (11, 1), (12, 2), (14, 1)],
  term ((-2680294400 : Rat) / 330679773) [(7, 1), (11, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 9. -/
theorem rs_R009_ueqv_R009NNNYN_partial_09_0038_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_09_0038
        rs_R009_ueqv_R009NNNYN_generator_09_0000_0086 =
      rs_R009_ueqv_R009NNNYN_partial_09_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNYN_coefficient_09_0039 : Poly :=
[
  term ((-87910400 : Rat) / 110226591) [(7, 1), (11, 1), (15, 2)]
]

/-- Partial product 39 for generator 9. -/
def rs_R009_ueqv_R009NNNYN_partial_09_0039 : Poly :=
[
  term ((175820800 : Rat) / 110226591) [(0, 1), (2, 1), (7, 1), (11, 1), (15, 2)],
  term ((-175820800 : Rat) / 110226591) [(0, 1), (7, 1), (11, 1), (12, 1), (15, 2)],
  term ((175820800 : Rat) / 110226591) [(1, 1), (3, 1), (7, 1), (11, 1), (15, 2)],
  term ((-175820800 : Rat) / 110226591) [(1, 1), (7, 1), (11, 1), (13, 1), (15, 2)],
  term ((-87910400 : Rat) / 110226591) [(2, 2), (7, 1), (11, 1), (15, 2)],
  term ((-87910400 : Rat) / 110226591) [(3, 2), (7, 1), (11, 1), (15, 2)],
  term ((87910400 : Rat) / 110226591) [(7, 1), (11, 1), (12, 2), (15, 2)],
  term ((87910400 : Rat) / 110226591) [(7, 1), (11, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 9. -/
theorem rs_R009_ueqv_R009NNNYN_partial_09_0039_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_09_0039
        rs_R009_ueqv_R009NNNYN_generator_09_0000_0086 =
      rs_R009_ueqv_R009NNNYN_partial_09_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNYN_coefficient_09_0040 : Poly :=
[
  term ((97484800 : Rat) / 110226591) [(7, 1), (11, 2), (15, 1)]
]

/-- Partial product 40 for generator 9. -/
def rs_R009_ueqv_R009NNNYN_partial_09_0040 : Poly :=
[
  term ((-194969600 : Rat) / 110226591) [(0, 1), (2, 1), (7, 1), (11, 2), (15, 1)],
  term ((194969600 : Rat) / 110226591) [(0, 1), (7, 1), (11, 2), (12, 1), (15, 1)],
  term ((-194969600 : Rat) / 110226591) [(1, 1), (3, 1), (7, 1), (11, 2), (15, 1)],
  term ((194969600 : Rat) / 110226591) [(1, 1), (7, 1), (11, 2), (13, 1), (15, 1)],
  term ((97484800 : Rat) / 110226591) [(2, 2), (7, 1), (11, 2), (15, 1)],
  term ((97484800 : Rat) / 110226591) [(3, 2), (7, 1), (11, 2), (15, 1)],
  term ((-97484800 : Rat) / 110226591) [(7, 1), (11, 2), (12, 2), (15, 1)],
  term ((-97484800 : Rat) / 110226591) [(7, 1), (11, 2), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 9. -/
theorem rs_R009_ueqv_R009NNNYN_partial_09_0040_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_09_0040
        rs_R009_ueqv_R009NNNYN_generator_09_0000_0086 =
      rs_R009_ueqv_R009NNNYN_partial_09_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNYN_coefficient_09_0041 : Poly :=
[
  term ((-201738236 : Rat) / 12247399) [(7, 1), (12, 1), (13, 1)]
]

/-- Partial product 41 for generator 9. -/
def rs_R009_ueqv_R009NNNYN_partial_09_0041 : Poly :=
[
  term ((403476472 : Rat) / 12247399) [(0, 1), (2, 1), (7, 1), (12, 1), (13, 1)],
  term ((-403476472 : Rat) / 12247399) [(0, 1), (7, 1), (12, 2), (13, 1)],
  term ((403476472 : Rat) / 12247399) [(1, 1), (3, 1), (7, 1), (12, 1), (13, 1)],
  term ((-403476472 : Rat) / 12247399) [(1, 1), (7, 1), (12, 1), (13, 2)],
  term ((-201738236 : Rat) / 12247399) [(2, 2), (7, 1), (12, 1), (13, 1)],
  term ((-201738236 : Rat) / 12247399) [(3, 2), (7, 1), (12, 1), (13, 1)],
  term ((201738236 : Rat) / 12247399) [(7, 1), (12, 1), (13, 3)],
  term ((201738236 : Rat) / 12247399) [(7, 1), (12, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 9. -/
theorem rs_R009_ueqv_R009NNNYN_partial_09_0041_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_09_0041
        rs_R009_ueqv_R009NNNYN_generator_09_0000_0086 =
      rs_R009_ueqv_R009NNNYN_partial_09_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNYN_coefficient_09_0042 : Poly :=
[
  term ((10932463456 : Rat) / 330679773) [(7, 1), (12, 1), (15, 1)]
]

/-- Partial product 42 for generator 9. -/
def rs_R009_ueqv_R009NNNYN_partial_09_0042 : Poly :=
[
  term ((-21864926912 : Rat) / 330679773) [(0, 1), (2, 1), (7, 1), (12, 1), (15, 1)],
  term ((21864926912 : Rat) / 330679773) [(0, 1), (7, 1), (12, 2), (15, 1)],
  term ((-21864926912 : Rat) / 330679773) [(1, 1), (3, 1), (7, 1), (12, 1), (15, 1)],
  term ((21864926912 : Rat) / 330679773) [(1, 1), (7, 1), (12, 1), (13, 1), (15, 1)],
  term ((10932463456 : Rat) / 330679773) [(2, 2), (7, 1), (12, 1), (15, 1)],
  term ((10932463456 : Rat) / 330679773) [(3, 2), (7, 1), (12, 1), (15, 1)],
  term ((-10932463456 : Rat) / 330679773) [(7, 1), (12, 1), (13, 2), (15, 1)],
  term ((-10932463456 : Rat) / 330679773) [(7, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 9. -/
theorem rs_R009_ueqv_R009NNNYN_partial_09_0042_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_09_0042
        rs_R009_ueqv_R009NNNYN_generator_09_0000_0086 =
      rs_R009_ueqv_R009NNNYN_partial_09_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNYN_coefficient_09_0043 : Poly :=
[
  term ((23008461 : Rat) / 12247399) [(7, 1), (13, 1)]
]

/-- Partial product 43 for generator 9. -/
def rs_R009_ueqv_R009NNNYN_partial_09_0043 : Poly :=
[
  term ((-46016922 : Rat) / 12247399) [(0, 1), (2, 1), (7, 1), (13, 1)],
  term ((46016922 : Rat) / 12247399) [(0, 1), (7, 1), (12, 1), (13, 1)],
  term ((-46016922 : Rat) / 12247399) [(1, 1), (3, 1), (7, 1), (13, 1)],
  term ((46016922 : Rat) / 12247399) [(1, 1), (7, 1), (13, 2)],
  term ((23008461 : Rat) / 12247399) [(2, 2), (7, 1), (13, 1)],
  term ((23008461 : Rat) / 12247399) [(3, 2), (7, 1), (13, 1)],
  term ((-23008461 : Rat) / 12247399) [(7, 1), (12, 2), (13, 1)],
  term ((-23008461 : Rat) / 12247399) [(7, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 9. -/
theorem rs_R009_ueqv_R009NNNYN_partial_09_0043_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_09_0043
        rs_R009_ueqv_R009NNNYN_generator_09_0000_0086 =
      rs_R009_ueqv_R009NNNYN_partial_09_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNYN_coefficient_09_0044 : Poly :=
[
  term ((41879600 : Rat) / 12247399) [(7, 1), (13, 1), (14, 1)]
]

/-- Partial product 44 for generator 9. -/
def rs_R009_ueqv_R009NNNYN_partial_09_0044 : Poly :=
[
  term ((-83759200 : Rat) / 12247399) [(0, 1), (2, 1), (7, 1), (13, 1), (14, 1)],
  term ((83759200 : Rat) / 12247399) [(0, 1), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((-83759200 : Rat) / 12247399) [(1, 1), (3, 1), (7, 1), (13, 1), (14, 1)],
  term ((83759200 : Rat) / 12247399) [(1, 1), (7, 1), (13, 2), (14, 1)],
  term ((41879600 : Rat) / 12247399) [(2, 2), (7, 1), (13, 1), (14, 1)],
  term ((41879600 : Rat) / 12247399) [(3, 2), (7, 1), (13, 1), (14, 1)],
  term ((-41879600 : Rat) / 12247399) [(7, 1), (12, 2), (13, 1), (14, 1)],
  term ((-41879600 : Rat) / 12247399) [(7, 1), (13, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 9. -/
theorem rs_R009_ueqv_R009NNNYN_partial_09_0044_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_09_0044
        rs_R009_ueqv_R009NNNYN_generator_09_0000_0086 =
      rs_R009_ueqv_R009NNNYN_partial_09_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNYN_coefficient_09_0045 : Poly :=
[
  term ((-2417051200 : Rat) / 330679773) [(7, 1), (14, 1), (15, 1)]
]

/-- Partial product 45 for generator 9. -/
def rs_R009_ueqv_R009NNNYN_partial_09_0045 : Poly :=
[
  term ((4834102400 : Rat) / 330679773) [(0, 1), (2, 1), (7, 1), (14, 1), (15, 1)],
  term ((-4834102400 : Rat) / 330679773) [(0, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((4834102400 : Rat) / 330679773) [(1, 1), (3, 1), (7, 1), (14, 1), (15, 1)],
  term ((-4834102400 : Rat) / 330679773) [(1, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((-2417051200 : Rat) / 330679773) [(2, 2), (7, 1), (14, 1), (15, 1)],
  term ((-2417051200 : Rat) / 330679773) [(3, 2), (7, 1), (14, 1), (15, 1)],
  term ((2417051200 : Rat) / 330679773) [(7, 1), (12, 2), (14, 1), (15, 1)],
  term ((2417051200 : Rat) / 330679773) [(7, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 9. -/
theorem rs_R009_ueqv_R009NNNYN_partial_09_0045_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_09_0045
        rs_R009_ueqv_R009NNNYN_generator_09_0000_0086 =
      rs_R009_ueqv_R009NNNYN_partial_09_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNYN_coefficient_09_0046 : Poly :=
[
  term ((-442638964 : Rat) / 110226591) [(7, 1), (15, 1)]
]

/-- Partial product 46 for generator 9. -/
def rs_R009_ueqv_R009NNNYN_partial_09_0046 : Poly :=
[
  term ((885277928 : Rat) / 110226591) [(0, 1), (2, 1), (7, 1), (15, 1)],
  term ((-885277928 : Rat) / 110226591) [(0, 1), (7, 1), (12, 1), (15, 1)],
  term ((885277928 : Rat) / 110226591) [(1, 1), (3, 1), (7, 1), (15, 1)],
  term ((-885277928 : Rat) / 110226591) [(1, 1), (7, 1), (13, 1), (15, 1)],
  term ((-442638964 : Rat) / 110226591) [(2, 2), (7, 1), (15, 1)],
  term ((-442638964 : Rat) / 110226591) [(3, 2), (7, 1), (15, 1)],
  term ((442638964 : Rat) / 110226591) [(7, 1), (12, 2), (15, 1)],
  term ((442638964 : Rat) / 110226591) [(7, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 9. -/
theorem rs_R009_ueqv_R009NNNYN_partial_09_0046_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_09_0046
        rs_R009_ueqv_R009NNNYN_generator_09_0000_0086 =
      rs_R009_ueqv_R009NNNYN_partial_09_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNYN_coefficient_09_0047 : Poly :=
[
  term ((754232161984 : Rat) / 18848747061) [(9, 1), (10, 1), (11, 1)]
]

/-- Partial product 47 for generator 9. -/
def rs_R009_ueqv_R009NNNYN_partial_09_0047 : Poly :=
[
  term ((-1508464323968 : Rat) / 18848747061) [(0, 1), (2, 1), (9, 1), (10, 1), (11, 1)],
  term ((1508464323968 : Rat) / 18848747061) [(0, 1), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((-1508464323968 : Rat) / 18848747061) [(1, 1), (3, 1), (9, 1), (10, 1), (11, 1)],
  term ((1508464323968 : Rat) / 18848747061) [(1, 1), (9, 1), (10, 1), (11, 1), (13, 1)],
  term ((754232161984 : Rat) / 18848747061) [(2, 2), (9, 1), (10, 1), (11, 1)],
  term ((754232161984 : Rat) / 18848747061) [(3, 2), (9, 1), (10, 1), (11, 1)],
  term ((-754232161984 : Rat) / 18848747061) [(9, 1), (10, 1), (11, 1), (12, 2)],
  term ((-754232161984 : Rat) / 18848747061) [(9, 1), (10, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 9. -/
theorem rs_R009_ueqv_R009NNNYN_partial_09_0047_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_09_0047
        rs_R009_ueqv_R009NNNYN_generator_09_0000_0086 =
      rs_R009_ueqv_R009NNNYN_partial_09_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNYN_coefficient_09_0048 : Poly :=
[
  term ((11784877531 : Rat) / 698101743) [(9, 1), (10, 1), (13, 1)]
]

/-- Partial product 48 for generator 9. -/
def rs_R009_ueqv_R009NNNYN_partial_09_0048 : Poly :=
[
  term ((-23569755062 : Rat) / 698101743) [(0, 1), (2, 1), (9, 1), (10, 1), (13, 1)],
  term ((23569755062 : Rat) / 698101743) [(0, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((-23569755062 : Rat) / 698101743) [(1, 1), (3, 1), (9, 1), (10, 1), (13, 1)],
  term ((23569755062 : Rat) / 698101743) [(1, 1), (9, 1), (10, 1), (13, 2)],
  term ((11784877531 : Rat) / 698101743) [(2, 2), (9, 1), (10, 1), (13, 1)],
  term ((11784877531 : Rat) / 698101743) [(3, 2), (9, 1), (10, 1), (13, 1)],
  term ((-11784877531 : Rat) / 698101743) [(9, 1), (10, 1), (12, 2), (13, 1)],
  term ((-11784877531 : Rat) / 698101743) [(9, 1), (10, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 9. -/
theorem rs_R009_ueqv_R009NNNYN_partial_09_0048_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_09_0048
        rs_R009_ueqv_R009NNNYN_generator_09_0000_0086 =
      rs_R009_ueqv_R009NNNYN_partial_09_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNYN_coefficient_09_0049 : Poly :=
[
  term ((-680155788932 : Rat) / 18848747061) [(9, 1), (10, 1), (15, 1)]
]

/-- Partial product 49 for generator 9. -/
def rs_R009_ueqv_R009NNNYN_partial_09_0049 : Poly :=
[
  term ((1360311577864 : Rat) / 18848747061) [(0, 1), (2, 1), (9, 1), (10, 1), (15, 1)],
  term ((-1360311577864 : Rat) / 18848747061) [(0, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((1360311577864 : Rat) / 18848747061) [(1, 1), (3, 1), (9, 1), (10, 1), (15, 1)],
  term ((-1360311577864 : Rat) / 18848747061) [(1, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((-680155788932 : Rat) / 18848747061) [(2, 2), (9, 1), (10, 1), (15, 1)],
  term ((-680155788932 : Rat) / 18848747061) [(3, 2), (9, 1), (10, 1), (15, 1)],
  term ((680155788932 : Rat) / 18848747061) [(9, 1), (10, 1), (12, 2), (15, 1)],
  term ((680155788932 : Rat) / 18848747061) [(9, 1), (10, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 9. -/
theorem rs_R009_ueqv_R009NNNYN_partial_09_0049_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_09_0049
        rs_R009_ueqv_R009NNNYN_generator_09_0000_0086 =
      rs_R009_ueqv_R009NNNYN_partial_09_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNYN_coefficient_09_0050 : Poly :=
[
  term ((1455109002658 : Rat) / 94243735305) [(9, 1), (11, 1)]
]

/-- Partial product 50 for generator 9. -/
def rs_R009_ueqv_R009NNNYN_partial_09_0050 : Poly :=
[
  term ((-2910218005316 : Rat) / 94243735305) [(0, 1), (2, 1), (9, 1), (11, 1)],
  term ((2910218005316 : Rat) / 94243735305) [(0, 1), (9, 1), (11, 1), (12, 1)],
  term ((-2910218005316 : Rat) / 94243735305) [(1, 1), (3, 1), (9, 1), (11, 1)],
  term ((2910218005316 : Rat) / 94243735305) [(1, 1), (9, 1), (11, 1), (13, 1)],
  term ((1455109002658 : Rat) / 94243735305) [(2, 2), (9, 1), (11, 1)],
  term ((1455109002658 : Rat) / 94243735305) [(3, 2), (9, 1), (11, 1)],
  term ((-1455109002658 : Rat) / 94243735305) [(9, 1), (11, 1), (12, 2)],
  term ((-1455109002658 : Rat) / 94243735305) [(9, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 9. -/
theorem rs_R009_ueqv_R009NNNYN_partial_09_0050_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_09_0050
        rs_R009_ueqv_R009NNNYN_generator_09_0000_0086 =
      rs_R009_ueqv_R009NNNYN_partial_09_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNYN_coefficient_09_0051 : Poly :=
[
  term ((-5046861568 : Rat) / 110226591) [(9, 1), (11, 1), (12, 1)]
]

/-- Partial product 51 for generator 9. -/
def rs_R009_ueqv_R009NNNYN_partial_09_0051 : Poly :=
[
  term ((10093723136 : Rat) / 110226591) [(0, 1), (2, 1), (9, 1), (11, 1), (12, 1)],
  term ((-10093723136 : Rat) / 110226591) [(0, 1), (9, 1), (11, 1), (12, 2)],
  term ((10093723136 : Rat) / 110226591) [(1, 1), (3, 1), (9, 1), (11, 1), (12, 1)],
  term ((-10093723136 : Rat) / 110226591) [(1, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((-5046861568 : Rat) / 110226591) [(2, 2), (9, 1), (11, 1), (12, 1)],
  term ((-5046861568 : Rat) / 110226591) [(3, 2), (9, 1), (11, 1), (12, 1)],
  term ((5046861568 : Rat) / 110226591) [(9, 1), (11, 1), (12, 1), (13, 2)],
  term ((5046861568 : Rat) / 110226591) [(9, 1), (11, 1), (12, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 9. -/
theorem rs_R009_ueqv_R009NNNYN_partial_09_0051_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_09_0051
        rs_R009_ueqv_R009NNNYN_generator_09_0000_0086 =
      rs_R009_ueqv_R009NNNYN_partial_09_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNYN_coefficient_09_0052 : Poly :=
[
  term ((-19496960 : Rat) / 110226591) [(9, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 52 for generator 9. -/
def rs_R009_ueqv_R009NNNYN_partial_09_0052 : Poly :=
[
  term ((38993920 : Rat) / 110226591) [(0, 1), (2, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-38993920 : Rat) / 110226591) [(0, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((38993920 : Rat) / 110226591) [(1, 1), (3, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-38993920 : Rat) / 110226591) [(1, 1), (9, 1), (11, 1), (13, 2), (15, 1)],
  term ((-19496960 : Rat) / 110226591) [(2, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-19496960 : Rat) / 110226591) [(3, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((19496960 : Rat) / 110226591) [(9, 1), (11, 1), (12, 2), (13, 1), (15, 1)],
  term ((19496960 : Rat) / 110226591) [(9, 1), (11, 1), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 9. -/
theorem rs_R009_ueqv_R009NNNYN_partial_09_0052_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_09_0052
        rs_R009_ueqv_R009NNNYN_generator_09_0000_0086 =
      rs_R009_ueqv_R009NNNYN_partial_09_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNYN_coefficient_09_0053 : Poly :=
[
  term ((10390094848 : Rat) / 330679773) [(9, 1), (11, 1), (14, 1)]
]

/-- Partial product 53 for generator 9. -/
def rs_R009_ueqv_R009NNNYN_partial_09_0053 : Poly :=
[
  term ((-20780189696 : Rat) / 330679773) [(0, 1), (2, 1), (9, 1), (11, 1), (14, 1)],
  term ((20780189696 : Rat) / 330679773) [(0, 1), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((-20780189696 : Rat) / 330679773) [(1, 1), (3, 1), (9, 1), (11, 1), (14, 1)],
  term ((20780189696 : Rat) / 330679773) [(1, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((10390094848 : Rat) / 330679773) [(2, 2), (9, 1), (11, 1), (14, 1)],
  term ((10390094848 : Rat) / 330679773) [(3, 2), (9, 1), (11, 1), (14, 1)],
  term ((-10390094848 : Rat) / 330679773) [(9, 1), (11, 1), (12, 2), (14, 1)],
  term ((-10390094848 : Rat) / 330679773) [(9, 1), (11, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 9. -/
theorem rs_R009_ueqv_R009NNNYN_partial_09_0053_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_09_0053
        rs_R009_ueqv_R009NNNYN_generator_09_0000_0086 =
      rs_R009_ueqv_R009NNNYN_partial_09_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNYN_coefficient_09_0054 : Poly :=
[
  term ((9748480 : Rat) / 36742197) [(9, 1), (11, 1), (15, 2)]
]

/-- Partial product 54 for generator 9. -/
def rs_R009_ueqv_R009NNNYN_partial_09_0054 : Poly :=
[
  term ((-19496960 : Rat) / 36742197) [(0, 1), (2, 1), (9, 1), (11, 1), (15, 2)],
  term ((19496960 : Rat) / 36742197) [(0, 1), (9, 1), (11, 1), (12, 1), (15, 2)],
  term ((-19496960 : Rat) / 36742197) [(1, 1), (3, 1), (9, 1), (11, 1), (15, 2)],
  term ((19496960 : Rat) / 36742197) [(1, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((9748480 : Rat) / 36742197) [(2, 2), (9, 1), (11, 1), (15, 2)],
  term ((9748480 : Rat) / 36742197) [(3, 2), (9, 1), (11, 1), (15, 2)],
  term ((-9748480 : Rat) / 36742197) [(9, 1), (11, 1), (12, 2), (15, 2)],
  term ((-9748480 : Rat) / 36742197) [(9, 1), (11, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 9. -/
theorem rs_R009_ueqv_R009NNNYN_partial_09_0054_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_09_0054
        rs_R009_ueqv_R009NNNYN_generator_09_0000_0086 =
      rs_R009_ueqv_R009NNNYN_partial_09_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNYN_coefficient_09_0055 : Poly :=
[
  term ((-236571636 : Rat) / 12247399) [(9, 1), (12, 1), (13, 1)]
]

/-- Partial product 55 for generator 9. -/
def rs_R009_ueqv_R009NNNYN_partial_09_0055 : Poly :=
[
  term ((473143272 : Rat) / 12247399) [(0, 1), (2, 1), (9, 1), (12, 1), (13, 1)],
  term ((-473143272 : Rat) / 12247399) [(0, 1), (9, 1), (12, 2), (13, 1)],
  term ((473143272 : Rat) / 12247399) [(1, 1), (3, 1), (9, 1), (12, 1), (13, 1)],
  term ((-473143272 : Rat) / 12247399) [(1, 1), (9, 1), (12, 1), (13, 2)],
  term ((-236571636 : Rat) / 12247399) [(2, 2), (9, 1), (12, 1), (13, 1)],
  term ((-236571636 : Rat) / 12247399) [(3, 2), (9, 1), (12, 1), (13, 1)],
  term ((236571636 : Rat) / 12247399) [(9, 1), (12, 1), (13, 3)],
  term ((236571636 : Rat) / 12247399) [(9, 1), (12, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 9. -/
theorem rs_R009_ueqv_R009NNNYN_partial_09_0055_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_09_0055
        rs_R009_ueqv_R009NNNYN_generator_09_0000_0086 =
      rs_R009_ueqv_R009NNNYN_partial_09_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNYN_coefficient_09_0056 : Poly :=
[
  term ((4551187664 : Rat) / 110226591) [(9, 1), (12, 1), (15, 1)]
]

/-- Partial product 56 for generator 9. -/
def rs_R009_ueqv_R009NNNYN_partial_09_0056 : Poly :=
[
  term ((-9102375328 : Rat) / 110226591) [(0, 1), (2, 1), (9, 1), (12, 1), (15, 1)],
  term ((9102375328 : Rat) / 110226591) [(0, 1), (9, 1), (12, 2), (15, 1)],
  term ((-9102375328 : Rat) / 110226591) [(1, 1), (3, 1), (9, 1), (12, 1), (15, 1)],
  term ((9102375328 : Rat) / 110226591) [(1, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((4551187664 : Rat) / 110226591) [(2, 2), (9, 1), (12, 1), (15, 1)],
  term ((4551187664 : Rat) / 110226591) [(3, 2), (9, 1), (12, 1), (15, 1)],
  term ((-4551187664 : Rat) / 110226591) [(9, 1), (12, 1), (13, 2), (15, 1)],
  term ((-4551187664 : Rat) / 110226591) [(9, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 9. -/
theorem rs_R009_ueqv_R009NNNYN_partial_09_0056_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_09_0056
        rs_R009_ueqv_R009NNNYN_generator_09_0000_0086 =
      rs_R009_ueqv_R009NNNYN_partial_09_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNYN_coefficient_09_0057 : Poly :=
[
  term ((21999136439 : Rat) / 6981017430) [(9, 1), (13, 1)]
]

/-- Partial product 57 for generator 9. -/
def rs_R009_ueqv_R009NNNYN_partial_09_0057 : Poly :=
[
  term ((-21999136439 : Rat) / 3490508715) [(0, 1), (2, 1), (9, 1), (13, 1)],
  term ((21999136439 : Rat) / 3490508715) [(0, 1), (9, 1), (12, 1), (13, 1)],
  term ((-21999136439 : Rat) / 3490508715) [(1, 1), (3, 1), (9, 1), (13, 1)],
  term ((21999136439 : Rat) / 3490508715) [(1, 1), (9, 1), (13, 2)],
  term ((21999136439 : Rat) / 6981017430) [(2, 2), (9, 1), (13, 1)],
  term ((21999136439 : Rat) / 6981017430) [(3, 2), (9, 1), (13, 1)],
  term ((-21999136439 : Rat) / 6981017430) [(9, 1), (12, 2), (13, 1)],
  term ((-21999136439 : Rat) / 6981017430) [(9, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 9. -/
theorem rs_R009_ueqv_R009NNNYN_partial_09_0057_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_09_0057
        rs_R009_ueqv_R009NNNYN_generator_09_0000_0086 =
      rs_R009_ueqv_R009NNNYN_partial_09_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNYN_coefficient_09_0058 : Poly :=
[
  term ((162345232 : Rat) / 12247399) [(9, 1), (13, 1), (14, 1)]
]

/-- Partial product 58 for generator 9. -/
def rs_R009_ueqv_R009NNNYN_partial_09_0058 : Poly :=
[
  term ((-324690464 : Rat) / 12247399) [(0, 1), (2, 1), (9, 1), (13, 1), (14, 1)],
  term ((324690464 : Rat) / 12247399) [(0, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-324690464 : Rat) / 12247399) [(1, 1), (3, 1), (9, 1), (13, 1), (14, 1)],
  term ((324690464 : Rat) / 12247399) [(1, 1), (9, 1), (13, 2), (14, 1)],
  term ((162345232 : Rat) / 12247399) [(2, 2), (9, 1), (13, 1), (14, 1)],
  term ((162345232 : Rat) / 12247399) [(3, 2), (9, 1), (13, 1), (14, 1)],
  term ((-162345232 : Rat) / 12247399) [(9, 1), (12, 2), (13, 1), (14, 1)],
  term ((-162345232 : Rat) / 12247399) [(9, 1), (13, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 9. -/
theorem rs_R009_ueqv_R009NNNYN_partial_09_0058_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_09_0058
        rs_R009_ueqv_R009NNNYN_generator_09_0000_0086 =
      rs_R009_ueqv_R009NNNYN_partial_09_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNYN_coefficient_09_0059 : Poly :=
[
  term ((29920000 : Rat) / 110226591) [(9, 1), (13, 1), (15, 2)]
]

/-- Partial product 59 for generator 9. -/
def rs_R009_ueqv_R009NNNYN_partial_09_0059 : Poly :=
[
  term ((-59840000 : Rat) / 110226591) [(0, 1), (2, 1), (9, 1), (13, 1), (15, 2)],
  term ((59840000 : Rat) / 110226591) [(0, 1), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((-59840000 : Rat) / 110226591) [(1, 1), (3, 1), (9, 1), (13, 1), (15, 2)],
  term ((59840000 : Rat) / 110226591) [(1, 1), (9, 1), (13, 2), (15, 2)],
  term ((29920000 : Rat) / 110226591) [(2, 2), (9, 1), (13, 1), (15, 2)],
  term ((29920000 : Rat) / 110226591) [(3, 2), (9, 1), (13, 1), (15, 2)],
  term ((-29920000 : Rat) / 110226591) [(9, 1), (12, 2), (13, 1), (15, 2)],
  term ((-29920000 : Rat) / 110226591) [(9, 1), (13, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 9. -/
theorem rs_R009_ueqv_R009NNNYN_partial_09_0059_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_09_0059
        rs_R009_ueqv_R009NNNYN_generator_09_0000_0086 =
      rs_R009_ueqv_R009NNNYN_partial_09_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNYN_coefficient_09_0060 : Poly :=
[
  term ((-913920 : Rat) / 12247399) [(9, 1), (13, 2), (15, 1)]
]

/-- Partial product 60 for generator 9. -/
def rs_R009_ueqv_R009NNNYN_partial_09_0060 : Poly :=
[
  term ((1827840 : Rat) / 12247399) [(0, 1), (2, 1), (9, 1), (13, 2), (15, 1)],
  term ((-1827840 : Rat) / 12247399) [(0, 1), (9, 1), (12, 1), (13, 2), (15, 1)],
  term ((1827840 : Rat) / 12247399) [(1, 1), (3, 1), (9, 1), (13, 2), (15, 1)],
  term ((-1827840 : Rat) / 12247399) [(1, 1), (9, 1), (13, 3), (15, 1)],
  term ((-913920 : Rat) / 12247399) [(2, 2), (9, 1), (13, 2), (15, 1)],
  term ((-913920 : Rat) / 12247399) [(3, 2), (9, 1), (13, 2), (15, 1)],
  term ((913920 : Rat) / 12247399) [(9, 1), (12, 2), (13, 2), (15, 1)],
  term ((913920 : Rat) / 12247399) [(9, 1), (13, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 9. -/
theorem rs_R009_ueqv_R009NNNYN_partial_09_0060_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_09_0060
        rs_R009_ueqv_R009NNNYN_generator_09_0000_0086 =
      rs_R009_ueqv_R009NNNYN_partial_09_0060 := by
  native_decide

/-- Coefficient term 61 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNYN_coefficient_09_0061 : Poly :=
[
  term ((-9369639104 : Rat) / 330679773) [(9, 1), (14, 1), (15, 1)]
]

/-- Partial product 61 for generator 9. -/
def rs_R009_ueqv_R009NNNYN_partial_09_0061 : Poly :=
[
  term ((18739278208 : Rat) / 330679773) [(0, 1), (2, 1), (9, 1), (14, 1), (15, 1)],
  term ((-18739278208 : Rat) / 330679773) [(0, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((18739278208 : Rat) / 330679773) [(1, 1), (3, 1), (9, 1), (14, 1), (15, 1)],
  term ((-18739278208 : Rat) / 330679773) [(1, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((-9369639104 : Rat) / 330679773) [(2, 2), (9, 1), (14, 1), (15, 1)],
  term ((-9369639104 : Rat) / 330679773) [(3, 2), (9, 1), (14, 1), (15, 1)],
  term ((9369639104 : Rat) / 330679773) [(9, 1), (12, 2), (14, 1), (15, 1)],
  term ((9369639104 : Rat) / 330679773) [(9, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 61 for generator 9. -/
theorem rs_R009_ueqv_R009NNNYN_partial_09_0061_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_09_0061
        rs_R009_ueqv_R009NNNYN_generator_09_0000_0086 =
      rs_R009_ueqv_R009NNNYN_partial_09_0061 := by
  native_decide

/-- Coefficient term 62 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNYN_coefficient_09_0062 : Poly :=
[
  term ((-772681268624 : Rat) / 94243735305) [(9, 1), (15, 1)]
]

/-- Partial product 62 for generator 9. -/
def rs_R009_ueqv_R009NNNYN_partial_09_0062 : Poly :=
[
  term ((1545362537248 : Rat) / 94243735305) [(0, 1), (2, 1), (9, 1), (15, 1)],
  term ((-1545362537248 : Rat) / 94243735305) [(0, 1), (9, 1), (12, 1), (15, 1)],
  term ((1545362537248 : Rat) / 94243735305) [(1, 1), (3, 1), (9, 1), (15, 1)],
  term ((-1545362537248 : Rat) / 94243735305) [(1, 1), (9, 1), (13, 1), (15, 1)],
  term ((-772681268624 : Rat) / 94243735305) [(2, 2), (9, 1), (15, 1)],
  term ((-772681268624 : Rat) / 94243735305) [(3, 2), (9, 1), (15, 1)],
  term ((772681268624 : Rat) / 94243735305) [(9, 1), (12, 2), (15, 1)],
  term ((772681268624 : Rat) / 94243735305) [(9, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 62 for generator 9. -/
theorem rs_R009_ueqv_R009NNNYN_partial_09_0062_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_09_0062
        rs_R009_ueqv_R009NNNYN_generator_09_0000_0086 =
      rs_R009_ueqv_R009NNNYN_partial_09_0062 := by
  native_decide

/-- Coefficient term 63 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNYN_coefficient_09_0063 : Poly :=
[
  term ((-8791040 : Rat) / 36742197) [(9, 1), (15, 3)]
]

/-- Partial product 63 for generator 9. -/
def rs_R009_ueqv_R009NNNYN_partial_09_0063 : Poly :=
[
  term ((17582080 : Rat) / 36742197) [(0, 1), (2, 1), (9, 1), (15, 3)],
  term ((-17582080 : Rat) / 36742197) [(0, 1), (9, 1), (12, 1), (15, 3)],
  term ((17582080 : Rat) / 36742197) [(1, 1), (3, 1), (9, 1), (15, 3)],
  term ((-17582080 : Rat) / 36742197) [(1, 1), (9, 1), (13, 1), (15, 3)],
  term ((-8791040 : Rat) / 36742197) [(2, 2), (9, 1), (15, 3)],
  term ((-8791040 : Rat) / 36742197) [(3, 2), (9, 1), (15, 3)],
  term ((8791040 : Rat) / 36742197) [(9, 1), (12, 2), (15, 3)],
  term ((8791040 : Rat) / 36742197) [(9, 1), (13, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 63 for generator 9. -/
theorem rs_R009_ueqv_R009NNNYN_partial_09_0063_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_09_0063
        rs_R009_ueqv_R009NNNYN_generator_09_0000_0086 =
      rs_R009_ueqv_R009NNNYN_partial_09_0063 := by
  native_decide

/-- Coefficient term 64 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNYN_coefficient_09_0064 : Poly :=
[
  term ((-294 : Rat) / 67) [(9, 2)]
]

/-- Partial product 64 for generator 9. -/
def rs_R009_ueqv_R009NNNYN_partial_09_0064 : Poly :=
[
  term ((588 : Rat) / 67) [(0, 1), (2, 1), (9, 2)],
  term ((-588 : Rat) / 67) [(0, 1), (9, 2), (12, 1)],
  term ((588 : Rat) / 67) [(1, 1), (3, 1), (9, 2)],
  term ((-588 : Rat) / 67) [(1, 1), (9, 2), (13, 1)],
  term ((-294 : Rat) / 67) [(2, 2), (9, 2)],
  term ((-294 : Rat) / 67) [(3, 2), (9, 2)],
  term ((294 : Rat) / 67) [(9, 2), (12, 2)],
  term ((294 : Rat) / 67) [(9, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 64 for generator 9. -/
theorem rs_R009_ueqv_R009NNNYN_partial_09_0064_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_09_0064
        rs_R009_ueqv_R009NNNYN_generator_09_0000_0086 =
      rs_R009_ueqv_R009NNNYN_partial_09_0064 := by
  native_decide

/-- Coefficient term 65 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNYN_coefficient_09_0065 : Poly :=
[
  term ((120 : Rat) / 67) [(10, 1)]
]

/-- Partial product 65 for generator 9. -/
def rs_R009_ueqv_R009NNNYN_partial_09_0065 : Poly :=
[
  term ((-240 : Rat) / 67) [(0, 1), (2, 1), (10, 1)],
  term ((240 : Rat) / 67) [(0, 1), (10, 1), (12, 1)],
  term ((-240 : Rat) / 67) [(1, 1), (3, 1), (10, 1)],
  term ((240 : Rat) / 67) [(1, 1), (10, 1), (13, 1)],
  term ((120 : Rat) / 67) [(2, 2), (10, 1)],
  term ((120 : Rat) / 67) [(3, 2), (10, 1)],
  term ((-120 : Rat) / 67) [(10, 1), (12, 2)],
  term ((-120 : Rat) / 67) [(10, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 65 for generator 9. -/
theorem rs_R009_ueqv_R009NNNYN_partial_09_0065_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_09_0065
        rs_R009_ueqv_R009NNNYN_generator_09_0000_0086 =
      rs_R009_ueqv_R009NNNYN_partial_09_0065 := by
  native_decide

/-- Coefficient term 66 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNYN_coefficient_09_0066 : Poly :=
[
  term ((-56502158398 : Rat) / 3490508715) [(10, 1), (11, 1), (13, 1)]
]

/-- Partial product 66 for generator 9. -/
def rs_R009_ueqv_R009NNNYN_partial_09_0066 : Poly :=
[
  term ((113004316796 : Rat) / 3490508715) [(0, 1), (2, 1), (10, 1), (11, 1), (13, 1)],
  term ((-113004316796 : Rat) / 3490508715) [(0, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((113004316796 : Rat) / 3490508715) [(1, 1), (3, 1), (10, 1), (11, 1), (13, 1)],
  term ((-113004316796 : Rat) / 3490508715) [(1, 1), (10, 1), (11, 1), (13, 2)],
  term ((-56502158398 : Rat) / 3490508715) [(2, 2), (10, 1), (11, 1), (13, 1)],
  term ((-56502158398 : Rat) / 3490508715) [(3, 2), (10, 1), (11, 1), (13, 1)],
  term ((56502158398 : Rat) / 3490508715) [(10, 1), (11, 1), (12, 2), (13, 1)],
  term ((56502158398 : Rat) / 3490508715) [(10, 1), (11, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 66 for generator 9. -/
theorem rs_R009_ueqv_R009NNNYN_partial_09_0066_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_09_0066
        rs_R009_ueqv_R009NNNYN_generator_09_0000_0086 =
      rs_R009_ueqv_R009NNNYN_partial_09_0066 := by
  native_decide

/-- Coefficient term 67 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNYN_coefficient_09_0067 : Poly :=
[
  term ((3260981713256 : Rat) / 94243735305) [(10, 1), (11, 1), (15, 1)]
]

/-- Partial product 67 for generator 9. -/
def rs_R009_ueqv_R009NNNYN_partial_09_0067 : Poly :=
[
  term ((-6521963426512 : Rat) / 94243735305) [(0, 1), (2, 1), (10, 1), (11, 1), (15, 1)],
  term ((6521963426512 : Rat) / 94243735305) [(0, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-6521963426512 : Rat) / 94243735305) [(1, 1), (3, 1), (10, 1), (11, 1), (15, 1)],
  term ((6521963426512 : Rat) / 94243735305) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((3260981713256 : Rat) / 94243735305) [(2, 2), (10, 1), (11, 1), (15, 1)],
  term ((3260981713256 : Rat) / 94243735305) [(3, 2), (10, 1), (11, 1), (15, 1)],
  term ((-3260981713256 : Rat) / 94243735305) [(10, 1), (11, 1), (12, 2), (15, 1)],
  term ((-3260981713256 : Rat) / 94243735305) [(10, 1), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 67 for generator 9. -/
theorem rs_R009_ueqv_R009NNNYN_partial_09_0067_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_09_0067
        rs_R009_ueqv_R009NNNYN_generator_09_0000_0086 =
      rs_R009_ueqv_R009NNNYN_partial_09_0067 := by
  native_decide

/-- Coefficient term 68 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNYN_coefficient_09_0068 : Poly :=
[
  term ((-3616138137472 : Rat) / 94243735305) [(10, 1), (11, 2)]
]

/-- Partial product 68 for generator 9. -/
def rs_R009_ueqv_R009NNNYN_partial_09_0068 : Poly :=
[
  term ((7232276274944 : Rat) / 94243735305) [(0, 1), (2, 1), (10, 1), (11, 2)],
  term ((-7232276274944 : Rat) / 94243735305) [(0, 1), (10, 1), (11, 2), (12, 1)],
  term ((7232276274944 : Rat) / 94243735305) [(1, 1), (3, 1), (10, 1), (11, 2)],
  term ((-7232276274944 : Rat) / 94243735305) [(1, 1), (10, 1), (11, 2), (13, 1)],
  term ((-3616138137472 : Rat) / 94243735305) [(2, 2), (10, 1), (11, 2)],
  term ((-3616138137472 : Rat) / 94243735305) [(3, 2), (10, 1), (11, 2)],
  term ((3616138137472 : Rat) / 94243735305) [(10, 1), (11, 2), (12, 2)],
  term ((3616138137472 : Rat) / 94243735305) [(10, 1), (11, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 68 for generator 9. -/
theorem rs_R009_ueqv_R009NNNYN_partial_09_0068_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_09_0068
        rs_R009_ueqv_R009NNNYN_generator_09_0000_0086 =
      rs_R009_ueqv_R009NNNYN_partial_09_0068 := by
  native_decide

/-- Coefficient term 69 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNYN_coefficient_09_0069 : Poly :=
[
  term ((-1827840 : Rat) / 12247399) [(11, 1), (12, 1), (13, 1)]
]

/-- Partial product 69 for generator 9. -/
def rs_R009_ueqv_R009NNNYN_partial_09_0069 : Poly :=
[
  term ((3655680 : Rat) / 12247399) [(0, 1), (2, 1), (11, 1), (12, 1), (13, 1)],
  term ((-3655680 : Rat) / 12247399) [(0, 1), (11, 1), (12, 2), (13, 1)],
  term ((3655680 : Rat) / 12247399) [(1, 1), (3, 1), (11, 1), (12, 1), (13, 1)],
  term ((-3655680 : Rat) / 12247399) [(1, 1), (11, 1), (12, 1), (13, 2)],
  term ((-1827840 : Rat) / 12247399) [(2, 2), (11, 1), (12, 1), (13, 1)],
  term ((-1827840 : Rat) / 12247399) [(3, 2), (11, 1), (12, 1), (13, 1)],
  term ((1827840 : Rat) / 12247399) [(11, 1), (12, 1), (13, 3)],
  term ((1827840 : Rat) / 12247399) [(11, 1), (12, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 69 for generator 9. -/
theorem rs_R009_ueqv_R009NNNYN_partial_09_0069_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_09_0069
        rs_R009_ueqv_R009NNNYN_generator_09_0000_0086 =
      rs_R009_ueqv_R009NNNYN_partial_09_0069 := by
  native_decide

/-- Coefficient term 70 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNYN_coefficient_09_0070 : Poly :=
[
  term ((35164160 : Rat) / 110226591) [(11, 1), (12, 1), (15, 1)]
]

/-- Partial product 70 for generator 9. -/
def rs_R009_ueqv_R009NNNYN_partial_09_0070 : Poly :=
[
  term ((-70328320 : Rat) / 110226591) [(0, 1), (2, 1), (11, 1), (12, 1), (15, 1)],
  term ((70328320 : Rat) / 110226591) [(0, 1), (11, 1), (12, 2), (15, 1)],
  term ((-70328320 : Rat) / 110226591) [(1, 1), (3, 1), (11, 1), (12, 1), (15, 1)],
  term ((70328320 : Rat) / 110226591) [(1, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((35164160 : Rat) / 110226591) [(2, 2), (11, 1), (12, 1), (15, 1)],
  term ((35164160 : Rat) / 110226591) [(3, 2), (11, 1), (12, 1), (15, 1)],
  term ((-35164160 : Rat) / 110226591) [(11, 1), (12, 1), (13, 2), (15, 1)],
  term ((-35164160 : Rat) / 110226591) [(11, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 70 for generator 9. -/
theorem rs_R009_ueqv_R009NNNYN_partial_09_0070_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_09_0070
        rs_R009_ueqv_R009NNNYN_generator_09_0000_0086 =
      rs_R009_ueqv_R009NNNYN_partial_09_0070 := by
  native_decide

/-- Coefficient term 71 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNYN_coefficient_09_0071 : Poly :=
[
  term ((423542858669 : Rat) / 62829156870) [(11, 1), (13, 1)]
]

/-- Partial product 71 for generator 9. -/
def rs_R009_ueqv_R009NNNYN_partial_09_0071 : Poly :=
[
  term ((-423542858669 : Rat) / 31414578435) [(0, 1), (2, 1), (11, 1), (13, 1)],
  term ((423542858669 : Rat) / 31414578435) [(0, 1), (11, 1), (12, 1), (13, 1)],
  term ((-423542858669 : Rat) / 31414578435) [(1, 1), (3, 1), (11, 1), (13, 1)],
  term ((423542858669 : Rat) / 31414578435) [(1, 1), (11, 1), (13, 2)],
  term ((423542858669 : Rat) / 62829156870) [(2, 2), (11, 1), (13, 1)],
  term ((423542858669 : Rat) / 62829156870) [(3, 2), (11, 1), (13, 1)],
  term ((-423542858669 : Rat) / 62829156870) [(11, 1), (12, 2), (13, 1)],
  term ((-423542858669 : Rat) / 62829156870) [(11, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 71 for generator 9. -/
theorem rs_R009_ueqv_R009NNNYN_partial_09_0071_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_09_0071
        rs_R009_ueqv_R009NNNYN_generator_09_0000_0086 =
      rs_R009_ueqv_R009NNNYN_partial_09_0071 := by
  native_decide

/-- Coefficient term 72 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNYN_coefficient_09_0072 : Poly :=
[
  term ((3655680 : Rat) / 12247399) [(11, 1), (13, 1), (14, 1)]
]

/-- Partial product 72 for generator 9. -/
def rs_R009_ueqv_R009NNNYN_partial_09_0072 : Poly :=
[
  term ((-7311360 : Rat) / 12247399) [(0, 1), (2, 1), (11, 1), (13, 1), (14, 1)],
  term ((7311360 : Rat) / 12247399) [(0, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-7311360 : Rat) / 12247399) [(1, 1), (3, 1), (11, 1), (13, 1), (14, 1)],
  term ((7311360 : Rat) / 12247399) [(1, 1), (11, 1), (13, 2), (14, 1)],
  term ((3655680 : Rat) / 12247399) [(2, 2), (11, 1), (13, 1), (14, 1)],
  term ((3655680 : Rat) / 12247399) [(3, 2), (11, 1), (13, 1), (14, 1)],
  term ((-3655680 : Rat) / 12247399) [(11, 1), (12, 2), (13, 1), (14, 1)],
  term ((-3655680 : Rat) / 12247399) [(11, 1), (13, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 72 for generator 9. -/
theorem rs_R009_ueqv_R009NNNYN_partial_09_0072_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_09_0072
        rs_R009_ueqv_R009NNNYN_generator_09_0000_0086 =
      rs_R009_ueqv_R009NNNYN_partial_09_0072 := by
  native_decide

/-- Coefficient term 73 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNYN_coefficient_09_0073 : Poly :=
[
  term ((2981120 : Rat) / 110226591) [(11, 1), (13, 1), (15, 2)]
]

/-- Partial product 73 for generator 9. -/
def rs_R009_ueqv_R009NNNYN_partial_09_0073 : Poly :=
[
  term ((-5962240 : Rat) / 110226591) [(0, 1), (2, 1), (11, 1), (13, 1), (15, 2)],
  term ((5962240 : Rat) / 110226591) [(0, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((-5962240 : Rat) / 110226591) [(1, 1), (3, 1), (11, 1), (13, 1), (15, 2)],
  term ((5962240 : Rat) / 110226591) [(1, 1), (11, 1), (13, 2), (15, 2)],
  term ((2981120 : Rat) / 110226591) [(2, 2), (11, 1), (13, 1), (15, 2)],
  term ((2981120 : Rat) / 110226591) [(3, 2), (11, 1), (13, 1), (15, 2)],
  term ((-2981120 : Rat) / 110226591) [(11, 1), (12, 2), (13, 1), (15, 2)],
  term ((-2981120 : Rat) / 110226591) [(11, 1), (13, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 73 for generator 9. -/
theorem rs_R009_ueqv_R009NNNYN_partial_09_0073_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_09_0073
        rs_R009_ueqv_R009NNNYN_generator_09_0000_0086 =
      rs_R009_ueqv_R009NNNYN_partial_09_0073 := by
  native_decide

/-- Coefficient term 74 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNYN_coefficient_09_0074 : Poly :=
[
  term ((913920 : Rat) / 12247399) [(11, 1), (13, 2), (15, 1)]
]

/-- Partial product 74 for generator 9. -/
def rs_R009_ueqv_R009NNNYN_partial_09_0074 : Poly :=
[
  term ((-1827840 : Rat) / 12247399) [(0, 1), (2, 1), (11, 1), (13, 2), (15, 1)],
  term ((1827840 : Rat) / 12247399) [(0, 1), (11, 1), (12, 1), (13, 2), (15, 1)],
  term ((-1827840 : Rat) / 12247399) [(1, 1), (3, 1), (11, 1), (13, 2), (15, 1)],
  term ((1827840 : Rat) / 12247399) [(1, 1), (11, 1), (13, 3), (15, 1)],
  term ((913920 : Rat) / 12247399) [(2, 2), (11, 1), (13, 2), (15, 1)],
  term ((913920 : Rat) / 12247399) [(3, 2), (11, 1), (13, 2), (15, 1)],
  term ((-913920 : Rat) / 12247399) [(11, 1), (12, 2), (13, 2), (15, 1)],
  term ((-913920 : Rat) / 12247399) [(11, 1), (13, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 74 for generator 9. -/
theorem rs_R009_ueqv_R009NNNYN_partial_09_0074_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_09_0074
        rs_R009_ueqv_R009NNNYN_generator_09_0000_0086 =
      rs_R009_ueqv_R009NNNYN_partial_09_0074 := by
  native_decide

/-- Coefficient term 75 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNYN_coefficient_09_0075 : Poly :=
[
  term ((-70328320 : Rat) / 110226591) [(11, 1), (14, 1), (15, 1)]
]

/-- Partial product 75 for generator 9. -/
def rs_R009_ueqv_R009NNNYN_partial_09_0075 : Poly :=
[
  term ((140656640 : Rat) / 110226591) [(0, 1), (2, 1), (11, 1), (14, 1), (15, 1)],
  term ((-140656640 : Rat) / 110226591) [(0, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((140656640 : Rat) / 110226591) [(1, 1), (3, 1), (11, 1), (14, 1), (15, 1)],
  term ((-140656640 : Rat) / 110226591) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-70328320 : Rat) / 110226591) [(2, 2), (11, 1), (14, 1), (15, 1)],
  term ((-70328320 : Rat) / 110226591) [(3, 2), (11, 1), (14, 1), (15, 1)],
  term ((70328320 : Rat) / 110226591) [(11, 1), (12, 2), (14, 1), (15, 1)],
  term ((70328320 : Rat) / 110226591) [(11, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 75 for generator 9. -/
theorem rs_R009_ueqv_R009NNNYN_partial_09_0075_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_09_0075
        rs_R009_ueqv_R009NNNYN_generator_09_0000_0086 =
      rs_R009_ueqv_R009NNNYN_partial_09_0075 := by
  native_decide

/-- Coefficient term 76 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNYN_coefficient_09_0076 : Poly :=
[
  term ((-2343219447256 : Rat) / 94243735305) [(11, 1), (15, 1)]
]

/-- Partial product 76 for generator 9. -/
def rs_R009_ueqv_R009NNNYN_partial_09_0076 : Poly :=
[
  term ((4686438894512 : Rat) / 94243735305) [(0, 1), (2, 1), (11, 1), (15, 1)],
  term ((-4686438894512 : Rat) / 94243735305) [(0, 1), (11, 1), (12, 1), (15, 1)],
  term ((4686438894512 : Rat) / 94243735305) [(1, 1), (3, 1), (11, 1), (15, 1)],
  term ((-4686438894512 : Rat) / 94243735305) [(1, 1), (11, 1), (13, 1), (15, 1)],
  term ((-2343219447256 : Rat) / 94243735305) [(2, 2), (11, 1), (15, 1)],
  term ((-2343219447256 : Rat) / 94243735305) [(3, 2), (11, 1), (15, 1)],
  term ((2343219447256 : Rat) / 94243735305) [(11, 1), (12, 2), (15, 1)],
  term ((2343219447256 : Rat) / 94243735305) [(11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 76 for generator 9. -/
theorem rs_R009_ueqv_R009NNNYN_partial_09_0076_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_09_0076
        rs_R009_ueqv_R009NNNYN_generator_09_0000_0086 =
      rs_R009_ueqv_R009NNNYN_partial_09_0076 := by
  native_decide

/-- Coefficient term 77 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNYN_coefficient_09_0077 : Poly :=
[
  term ((-43955200 : Rat) / 110226591) [(11, 1), (15, 3)]
]

/-- Partial product 77 for generator 9. -/
def rs_R009_ueqv_R009NNNYN_partial_09_0077 : Poly :=
[
  term ((87910400 : Rat) / 110226591) [(0, 1), (2, 1), (11, 1), (15, 3)],
  term ((-87910400 : Rat) / 110226591) [(0, 1), (11, 1), (12, 1), (15, 3)],
  term ((87910400 : Rat) / 110226591) [(1, 1), (3, 1), (11, 1), (15, 3)],
  term ((-87910400 : Rat) / 110226591) [(1, 1), (11, 1), (13, 1), (15, 3)],
  term ((-43955200 : Rat) / 110226591) [(2, 2), (11, 1), (15, 3)],
  term ((-43955200 : Rat) / 110226591) [(3, 2), (11, 1), (15, 3)],
  term ((43955200 : Rat) / 110226591) [(11, 1), (12, 2), (15, 3)],
  term ((43955200 : Rat) / 110226591) [(11, 1), (13, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 77 for generator 9. -/
theorem rs_R009_ueqv_R009NNNYN_partial_09_0077_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_09_0077
        rs_R009_ueqv_R009NNNYN_generator_09_0000_0086 =
      rs_R009_ueqv_R009NNNYN_partial_09_0077 := by
  native_decide

/-- Coefficient term 78 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNYN_coefficient_09_0078 : Poly :=
[
  term ((1275152921912 : Rat) / 94243735305) [(11, 2)]
]

/-- Partial product 78 for generator 9. -/
def rs_R009_ueqv_R009NNNYN_partial_09_0078 : Poly :=
[
  term ((-2550305843824 : Rat) / 94243735305) [(0, 1), (2, 1), (11, 2)],
  term ((2550305843824 : Rat) / 94243735305) [(0, 1), (11, 2), (12, 1)],
  term ((-2550305843824 : Rat) / 94243735305) [(1, 1), (3, 1), (11, 2)],
  term ((2550305843824 : Rat) / 94243735305) [(1, 1), (11, 2), (13, 1)],
  term ((1275152921912 : Rat) / 94243735305) [(2, 2), (11, 2)],
  term ((1275152921912 : Rat) / 94243735305) [(3, 2), (11, 2)],
  term ((-1275152921912 : Rat) / 94243735305) [(11, 2), (12, 2)],
  term ((-1275152921912 : Rat) / 94243735305) [(11, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 78 for generator 9. -/
theorem rs_R009_ueqv_R009NNNYN_partial_09_0078_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_09_0078
        rs_R009_ueqv_R009NNNYN_generator_09_0000_0086 =
      rs_R009_ueqv_R009NNNYN_partial_09_0078 := by
  native_decide

/-- Coefficient term 79 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNYN_coefficient_09_0079 : Poly :=
[
  term ((-38993920 : Rat) / 110226591) [(11, 2), (12, 1)]
]

/-- Partial product 79 for generator 9. -/
def rs_R009_ueqv_R009NNNYN_partial_09_0079 : Poly :=
[
  term ((77987840 : Rat) / 110226591) [(0, 1), (2, 1), (11, 2), (12, 1)],
  term ((-77987840 : Rat) / 110226591) [(0, 1), (11, 2), (12, 2)],
  term ((77987840 : Rat) / 110226591) [(1, 1), (3, 1), (11, 2), (12, 1)],
  term ((-77987840 : Rat) / 110226591) [(1, 1), (11, 2), (12, 1), (13, 1)],
  term ((-38993920 : Rat) / 110226591) [(2, 2), (11, 2), (12, 1)],
  term ((-38993920 : Rat) / 110226591) [(3, 2), (11, 2), (12, 1)],
  term ((38993920 : Rat) / 110226591) [(11, 2), (12, 1), (13, 2)],
  term ((38993920 : Rat) / 110226591) [(11, 2), (12, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 79 for generator 9. -/
theorem rs_R009_ueqv_R009NNNYN_partial_09_0079_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_09_0079
        rs_R009_ueqv_R009NNNYN_generator_09_0000_0086 =
      rs_R009_ueqv_R009NNNYN_partial_09_0079 := by
  native_decide

/-- Coefficient term 80 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNYN_coefficient_09_0080 : Poly :=
[
  term ((-62755840 : Rat) / 110226591) [(11, 2), (13, 1), (15, 1)]
]

/-- Partial product 80 for generator 9. -/
def rs_R009_ueqv_R009NNNYN_partial_09_0080 : Poly :=
[
  term ((125511680 : Rat) / 110226591) [(0, 1), (2, 1), (11, 2), (13, 1), (15, 1)],
  term ((-125511680 : Rat) / 110226591) [(0, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((125511680 : Rat) / 110226591) [(1, 1), (3, 1), (11, 2), (13, 1), (15, 1)],
  term ((-125511680 : Rat) / 110226591) [(1, 1), (11, 2), (13, 2), (15, 1)],
  term ((-62755840 : Rat) / 110226591) [(2, 2), (11, 2), (13, 1), (15, 1)],
  term ((-62755840 : Rat) / 110226591) [(3, 2), (11, 2), (13, 1), (15, 1)],
  term ((62755840 : Rat) / 110226591) [(11, 2), (12, 2), (13, 1), (15, 1)],
  term ((62755840 : Rat) / 110226591) [(11, 2), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 80 for generator 9. -/
theorem rs_R009_ueqv_R009NNNYN_partial_09_0080_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_09_0080
        rs_R009_ueqv_R009NNNYN_generator_09_0000_0086 =
      rs_R009_ueqv_R009NNNYN_partial_09_0080 := by
  native_decide

/-- Coefficient term 81 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNYN_coefficient_09_0081 : Poly :=
[
  term ((77987840 : Rat) / 110226591) [(11, 2), (14, 1)]
]

/-- Partial product 81 for generator 9. -/
def rs_R009_ueqv_R009NNNYN_partial_09_0081 : Poly :=
[
  term ((-155975680 : Rat) / 110226591) [(0, 1), (2, 1), (11, 2), (14, 1)],
  term ((155975680 : Rat) / 110226591) [(0, 1), (11, 2), (12, 1), (14, 1)],
  term ((-155975680 : Rat) / 110226591) [(1, 1), (3, 1), (11, 2), (14, 1)],
  term ((155975680 : Rat) / 110226591) [(1, 1), (11, 2), (13, 1), (14, 1)],
  term ((77987840 : Rat) / 110226591) [(2, 2), (11, 2), (14, 1)],
  term ((77987840 : Rat) / 110226591) [(3, 2), (11, 2), (14, 1)],
  term ((-77987840 : Rat) / 110226591) [(11, 2), (12, 2), (14, 1)],
  term ((-77987840 : Rat) / 110226591) [(11, 2), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 81 for generator 9. -/
theorem rs_R009_ueqv_R009NNNYN_partial_09_0081_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_09_0081
        rs_R009_ueqv_R009NNNYN_generator_09_0000_0086 =
      rs_R009_ueqv_R009NNNYN_partial_09_0081 := by
  native_decide

/-- Coefficient term 82 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNYN_coefficient_09_0082 : Poly :=
[
  term ((74854400 : Rat) / 36742197) [(11, 2), (15, 2)]
]

/-- Partial product 82 for generator 9. -/
def rs_R009_ueqv_R009NNNYN_partial_09_0082 : Poly :=
[
  term ((-149708800 : Rat) / 36742197) [(0, 1), (2, 1), (11, 2), (15, 2)],
  term ((149708800 : Rat) / 36742197) [(0, 1), (11, 2), (12, 1), (15, 2)],
  term ((-149708800 : Rat) / 36742197) [(1, 1), (3, 1), (11, 2), (15, 2)],
  term ((149708800 : Rat) / 36742197) [(1, 1), (11, 2), (13, 1), (15, 2)],
  term ((74854400 : Rat) / 36742197) [(2, 2), (11, 2), (15, 2)],
  term ((74854400 : Rat) / 36742197) [(3, 2), (11, 2), (15, 2)],
  term ((-74854400 : Rat) / 36742197) [(11, 2), (12, 2), (15, 2)],
  term ((-74854400 : Rat) / 36742197) [(11, 2), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 82 for generator 9. -/
theorem rs_R009_ueqv_R009NNNYN_partial_09_0082_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_09_0082
        rs_R009_ueqv_R009NNNYN_generator_09_0000_0086 =
      rs_R009_ueqv_R009NNNYN_partial_09_0082 := by
  native_decide

/-- Coefficient term 83 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNYN_coefficient_09_0083 : Poly :=
[
  term ((-194969600 : Rat) / 110226591) [(11, 3), (15, 1)]
]

/-- Partial product 83 for generator 9. -/
def rs_R009_ueqv_R009NNNYN_partial_09_0083 : Poly :=
[
  term ((389939200 : Rat) / 110226591) [(0, 1), (2, 1), (11, 3), (15, 1)],
  term ((-389939200 : Rat) / 110226591) [(0, 1), (11, 3), (12, 1), (15, 1)],
  term ((389939200 : Rat) / 110226591) [(1, 1), (3, 1), (11, 3), (15, 1)],
  term ((-389939200 : Rat) / 110226591) [(1, 1), (11, 3), (13, 1), (15, 1)],
  term ((-194969600 : Rat) / 110226591) [(2, 2), (11, 3), (15, 1)],
  term ((-194969600 : Rat) / 110226591) [(3, 2), (11, 3), (15, 1)],
  term ((194969600 : Rat) / 110226591) [(11, 3), (12, 2), (15, 1)],
  term ((194969600 : Rat) / 110226591) [(11, 3), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 83 for generator 9. -/
theorem rs_R009_ueqv_R009NNNYN_partial_09_0083_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_09_0083
        rs_R009_ueqv_R009NNNYN_generator_09_0000_0086 =
      rs_R009_ueqv_R009NNNYN_partial_09_0083 := by
  native_decide

/-- Coefficient term 84 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNYN_coefficient_09_0084 : Poly :=
[
  term ((-1827876370 : Rat) / 330679773) [(13, 1), (15, 1)]
]

/-- Partial product 84 for generator 9. -/
def rs_R009_ueqv_R009NNNYN_partial_09_0084 : Poly :=
[
  term ((3655752740 : Rat) / 330679773) [(0, 1), (2, 1), (13, 1), (15, 1)],
  term ((-3655752740 : Rat) / 330679773) [(0, 1), (12, 1), (13, 1), (15, 1)],
  term ((3655752740 : Rat) / 330679773) [(1, 1), (3, 1), (13, 1), (15, 1)],
  term ((-3655752740 : Rat) / 330679773) [(1, 1), (13, 2), (15, 1)],
  term ((-1827876370 : Rat) / 330679773) [(2, 2), (13, 1), (15, 1)],
  term ((-1827876370 : Rat) / 330679773) [(3, 2), (13, 1), (15, 1)],
  term ((1827876370 : Rat) / 330679773) [(12, 2), (13, 1), (15, 1)],
  term ((1827876370 : Rat) / 330679773) [(13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 84 for generator 9. -/
theorem rs_R009_ueqv_R009NNNYN_partial_09_0084_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_09_0084
        rs_R009_ueqv_R009NNNYN_generator_09_0000_0086 =
      rs_R009_ueqv_R009NNNYN_partial_09_0084 := by
  native_decide

/-- Coefficient term 85 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNYN_coefficient_09_0085 : Poly :=
[
  term ((1433600 : Rat) / 12247399) [(13, 2)]
]

/-- Partial product 85 for generator 9. -/
def rs_R009_ueqv_R009NNNYN_partial_09_0085 : Poly :=
[
  term ((-2867200 : Rat) / 12247399) [(0, 1), (2, 1), (13, 2)],
  term ((2867200 : Rat) / 12247399) [(0, 1), (12, 1), (13, 2)],
  term ((-2867200 : Rat) / 12247399) [(1, 1), (3, 1), (13, 2)],
  term ((2867200 : Rat) / 12247399) [(1, 1), (13, 3)],
  term ((1433600 : Rat) / 12247399) [(2, 2), (13, 2)],
  term ((1433600 : Rat) / 12247399) [(3, 2), (13, 2)],
  term ((-1433600 : Rat) / 12247399) [(12, 2), (13, 2)],
  term ((-1433600 : Rat) / 12247399) [(13, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 85 for generator 9. -/
theorem rs_R009_ueqv_R009NNNYN_partial_09_0085_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_09_0085
        rs_R009_ueqv_R009NNNYN_generator_09_0000_0086 =
      rs_R009_ueqv_R009NNNYN_partial_09_0085 := by
  native_decide

/-- Coefficient term 86 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009NNNYN_coefficient_09_0086 : Poly :=
[
  term ((3730346120 : Rat) / 330679773) [(15, 2)]
]

/-- Partial product 86 for generator 9. -/
def rs_R009_ueqv_R009NNNYN_partial_09_0086 : Poly :=
[
  term ((-7460692240 : Rat) / 330679773) [(0, 1), (2, 1), (15, 2)],
  term ((7460692240 : Rat) / 330679773) [(0, 1), (12, 1), (15, 2)],
  term ((-7460692240 : Rat) / 330679773) [(1, 1), (3, 1), (15, 2)],
  term ((7460692240 : Rat) / 330679773) [(1, 1), (13, 1), (15, 2)],
  term ((3730346120 : Rat) / 330679773) [(2, 2), (15, 2)],
  term ((3730346120 : Rat) / 330679773) [(3, 2), (15, 2)],
  term ((-3730346120 : Rat) / 330679773) [(12, 2), (15, 2)],
  term ((-3730346120 : Rat) / 330679773) [(13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 86 for generator 9. -/
theorem rs_R009_ueqv_R009NNNYN_partial_09_0086_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_09_0086
        rs_R009_ueqv_R009NNNYN_generator_09_0000_0086 =
      rs_R009_ueqv_R009NNNYN_partial_09_0086 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NNNYN_partials_09_0000_0086 : List Poly :=
[
  rs_R009_ueqv_R009NNNYN_partial_09_0000,
  rs_R009_ueqv_R009NNNYN_partial_09_0001,
  rs_R009_ueqv_R009NNNYN_partial_09_0002,
  rs_R009_ueqv_R009NNNYN_partial_09_0003,
  rs_R009_ueqv_R009NNNYN_partial_09_0004,
  rs_R009_ueqv_R009NNNYN_partial_09_0005,
  rs_R009_ueqv_R009NNNYN_partial_09_0006,
  rs_R009_ueqv_R009NNNYN_partial_09_0007,
  rs_R009_ueqv_R009NNNYN_partial_09_0008,
  rs_R009_ueqv_R009NNNYN_partial_09_0009,
  rs_R009_ueqv_R009NNNYN_partial_09_0010,
  rs_R009_ueqv_R009NNNYN_partial_09_0011,
  rs_R009_ueqv_R009NNNYN_partial_09_0012,
  rs_R009_ueqv_R009NNNYN_partial_09_0013,
  rs_R009_ueqv_R009NNNYN_partial_09_0014,
  rs_R009_ueqv_R009NNNYN_partial_09_0015,
  rs_R009_ueqv_R009NNNYN_partial_09_0016,
  rs_R009_ueqv_R009NNNYN_partial_09_0017,
  rs_R009_ueqv_R009NNNYN_partial_09_0018,
  rs_R009_ueqv_R009NNNYN_partial_09_0019,
  rs_R009_ueqv_R009NNNYN_partial_09_0020,
  rs_R009_ueqv_R009NNNYN_partial_09_0021,
  rs_R009_ueqv_R009NNNYN_partial_09_0022,
  rs_R009_ueqv_R009NNNYN_partial_09_0023,
  rs_R009_ueqv_R009NNNYN_partial_09_0024,
  rs_R009_ueqv_R009NNNYN_partial_09_0025,
  rs_R009_ueqv_R009NNNYN_partial_09_0026,
  rs_R009_ueqv_R009NNNYN_partial_09_0027,
  rs_R009_ueqv_R009NNNYN_partial_09_0028,
  rs_R009_ueqv_R009NNNYN_partial_09_0029,
  rs_R009_ueqv_R009NNNYN_partial_09_0030,
  rs_R009_ueqv_R009NNNYN_partial_09_0031,
  rs_R009_ueqv_R009NNNYN_partial_09_0032,
  rs_R009_ueqv_R009NNNYN_partial_09_0033,
  rs_R009_ueqv_R009NNNYN_partial_09_0034,
  rs_R009_ueqv_R009NNNYN_partial_09_0035,
  rs_R009_ueqv_R009NNNYN_partial_09_0036,
  rs_R009_ueqv_R009NNNYN_partial_09_0037,
  rs_R009_ueqv_R009NNNYN_partial_09_0038,
  rs_R009_ueqv_R009NNNYN_partial_09_0039,
  rs_R009_ueqv_R009NNNYN_partial_09_0040,
  rs_R009_ueqv_R009NNNYN_partial_09_0041,
  rs_R009_ueqv_R009NNNYN_partial_09_0042,
  rs_R009_ueqv_R009NNNYN_partial_09_0043,
  rs_R009_ueqv_R009NNNYN_partial_09_0044,
  rs_R009_ueqv_R009NNNYN_partial_09_0045,
  rs_R009_ueqv_R009NNNYN_partial_09_0046,
  rs_R009_ueqv_R009NNNYN_partial_09_0047,
  rs_R009_ueqv_R009NNNYN_partial_09_0048,
  rs_R009_ueqv_R009NNNYN_partial_09_0049,
  rs_R009_ueqv_R009NNNYN_partial_09_0050,
  rs_R009_ueqv_R009NNNYN_partial_09_0051,
  rs_R009_ueqv_R009NNNYN_partial_09_0052,
  rs_R009_ueqv_R009NNNYN_partial_09_0053,
  rs_R009_ueqv_R009NNNYN_partial_09_0054,
  rs_R009_ueqv_R009NNNYN_partial_09_0055,
  rs_R009_ueqv_R009NNNYN_partial_09_0056,
  rs_R009_ueqv_R009NNNYN_partial_09_0057,
  rs_R009_ueqv_R009NNNYN_partial_09_0058,
  rs_R009_ueqv_R009NNNYN_partial_09_0059,
  rs_R009_ueqv_R009NNNYN_partial_09_0060,
  rs_R009_ueqv_R009NNNYN_partial_09_0061,
  rs_R009_ueqv_R009NNNYN_partial_09_0062,
  rs_R009_ueqv_R009NNNYN_partial_09_0063,
  rs_R009_ueqv_R009NNNYN_partial_09_0064,
  rs_R009_ueqv_R009NNNYN_partial_09_0065,
  rs_R009_ueqv_R009NNNYN_partial_09_0066,
  rs_R009_ueqv_R009NNNYN_partial_09_0067,
  rs_R009_ueqv_R009NNNYN_partial_09_0068,
  rs_R009_ueqv_R009NNNYN_partial_09_0069,
  rs_R009_ueqv_R009NNNYN_partial_09_0070,
  rs_R009_ueqv_R009NNNYN_partial_09_0071,
  rs_R009_ueqv_R009NNNYN_partial_09_0072,
  rs_R009_ueqv_R009NNNYN_partial_09_0073,
  rs_R009_ueqv_R009NNNYN_partial_09_0074,
  rs_R009_ueqv_R009NNNYN_partial_09_0075,
  rs_R009_ueqv_R009NNNYN_partial_09_0076,
  rs_R009_ueqv_R009NNNYN_partial_09_0077,
  rs_R009_ueqv_R009NNNYN_partial_09_0078,
  rs_R009_ueqv_R009NNNYN_partial_09_0079,
  rs_R009_ueqv_R009NNNYN_partial_09_0080,
  rs_R009_ueqv_R009NNNYN_partial_09_0081,
  rs_R009_ueqv_R009NNNYN_partial_09_0082,
  rs_R009_ueqv_R009NNNYN_partial_09_0083,
  rs_R009_ueqv_R009NNNYN_partial_09_0084,
  rs_R009_ueqv_R009NNNYN_partial_09_0085,
  rs_R009_ueqv_R009NNNYN_partial_09_0086
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NNNYN_block_09_0000_0086 : Poly :=
[
  term ((-2371747840 : Rat) / 330679773) [(0, 1), (2, 1), (3, 1), (11, 1)],
  term ((-671390720 : Rat) / 110226591) [(0, 1), (2, 1), (3, 1), (11, 1), (12, 1)],
  term ((8322926080 : Rat) / 330679773) [(0, 1), (2, 1), (3, 1), (11, 1), (14, 1)],
  term ((-31471440 : Rat) / 12247399) [(0, 1), (2, 1), (3, 1), (12, 1), (13, 1)],
  term ((605450560 : Rat) / 110226591) [(0, 1), (2, 1), (3, 1), (12, 1), (15, 1)],
  term ((-37058560 : Rat) / 12247399) [(0, 1), (2, 1), (3, 1), (13, 1)],
  term ((130045720 : Rat) / 12247399) [(0, 1), (2, 1), (3, 1), (13, 1), (14, 1)],
  term ((-7505495840 : Rat) / 330679773) [(0, 1), (2, 1), (3, 1), (14, 1), (15, 1)],
  term ((2138808320 : Rat) / 330679773) [(0, 1), (2, 1), (3, 1), (15, 1)],
  term ((-588 : Rat) / 67) [(0, 1), (2, 1), (5, 1), (9, 1)],
  term ((2580411430912 : Rat) / 31414578435) [(0, 1), (2, 1), (5, 1), (10, 1), (11, 1)],
  term ((40318928608 : Rat) / 1163502905) [(0, 1), (2, 1), (5, 1), (10, 1), (13, 1)],
  term ((-2326978165376 : Rat) / 31414578435) [(0, 1), (2, 1), (5, 1), (10, 1), (15, 1)],
  term ((5024193452096 : Rat) / 94243735305) [(0, 1), (2, 1), (5, 1), (11, 1)],
  term ((-18448059392 : Rat) / 110226591) [(0, 1), (2, 1), (5, 1), (11, 1), (12, 1)],
  term ((-38993920 : Rat) / 110226591) [(0, 1), (2, 1), (5, 1), (11, 1), (13, 1), (15, 1)],
  term ((-12298915328 : Rat) / 330679773) [(0, 1), (2, 1), (5, 1), (11, 1), (14, 1)],
  term ((370442240 : Rat) / 110226591) [(0, 1), (2, 1), (5, 1), (11, 1), (15, 2)],
  term ((-864752784 : Rat) / 12247399) [(0, 1), (2, 1), (5, 1), (12, 1), (13, 1)],
  term ((16162386592 : Rat) / 110226591) [(0, 1), (2, 1), (5, 1), (12, 1), (15, 1)],
  term ((78503022689 : Rat) / 3490508715) [(0, 1), (2, 1), (5, 1), (13, 1)],
  term ((-192170552 : Rat) / 12247399) [(0, 1), (2, 1), (5, 1), (13, 1), (14, 1)],
  term ((3612160 : Rat) / 2079747) [(0, 1), (2, 1), (5, 1), (13, 1), (15, 2)],
  term ((-1827840 : Rat) / 12247399) [(0, 1), (2, 1), (5, 1), (13, 2), (15, 1)],
  term ((11090986144 : Rat) / 330679773) [(0, 1), (2, 1), (5, 1), (14, 1), (15, 1)],
  term ((-4806443972248 : Rat) / 94243735305) [(0, 1), (2, 1), (5, 1), (15, 1)],
  term ((-334059520 : Rat) / 110226591) [(0, 1), (2, 1), (5, 1), (15, 3)],
  term ((436242609152 : Rat) / 10471526145) [(0, 1), (2, 1), (7, 1), (10, 1), (11, 1)],
  term ((20448872304 : Rat) / 1163502905) [(0, 1), (2, 1), (7, 1), (10, 1), (13, 1)],
  term ((-393397352896 : Rat) / 10471526145) [(0, 1), (2, 1), (7, 1), (10, 1), (15, 1)],
  term ((-981694336 : Rat) / 110226591) [(0, 1), (2, 1), (7, 1), (11, 1)],
  term ((25822494208 : Rat) / 330679773) [(0, 1), (2, 1), (7, 1), (11, 1), (12, 1)],
  term ((-9139200 : Rat) / 12247399) [(0, 1), (2, 1), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-5360588800 : Rat) / 330679773) [(0, 1), (2, 1), (7, 1), (11, 1), (14, 1)],
  term ((175820800 : Rat) / 110226591) [(0, 1), (2, 1), (7, 1), (11, 1), (15, 2)],
  term ((-194969600 : Rat) / 110226591) [(0, 1), (2, 1), (7, 1), (11, 2), (15, 1)],
  term ((403476472 : Rat) / 12247399) [(0, 1), (2, 1), (7, 1), (12, 1), (13, 1)],
  term ((-21864926912 : Rat) / 330679773) [(0, 1), (2, 1), (7, 1), (12, 1), (15, 1)],
  term ((-46016922 : Rat) / 12247399) [(0, 1), (2, 1), (7, 1), (13, 1)],
  term ((-83759200 : Rat) / 12247399) [(0, 1), (2, 1), (7, 1), (13, 1), (14, 1)],
  term ((4834102400 : Rat) / 330679773) [(0, 1), (2, 1), (7, 1), (14, 1), (15, 1)],
  term ((885277928 : Rat) / 110226591) [(0, 1), (2, 1), (7, 1), (15, 1)],
  term ((-1508464323968 : Rat) / 18848747061) [(0, 1), (2, 1), (9, 1), (10, 1), (11, 1)],
  term ((-23569755062 : Rat) / 698101743) [(0, 1), (2, 1), (9, 1), (10, 1), (13, 1)],
  term ((1360311577864 : Rat) / 18848747061) [(0, 1), (2, 1), (9, 1), (10, 1), (15, 1)],
  term ((-2910218005316 : Rat) / 94243735305) [(0, 1), (2, 1), (9, 1), (11, 1)],
  term ((10093723136 : Rat) / 110226591) [(0, 1), (2, 1), (9, 1), (11, 1), (12, 1)],
  term ((38993920 : Rat) / 110226591) [(0, 1), (2, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-20780189696 : Rat) / 330679773) [(0, 1), (2, 1), (9, 1), (11, 1), (14, 1)],
  term ((-19496960 : Rat) / 36742197) [(0, 1), (2, 1), (9, 1), (11, 1), (15, 2)],
  term ((473143272 : Rat) / 12247399) [(0, 1), (2, 1), (9, 1), (12, 1), (13, 1)],
  term ((-9102375328 : Rat) / 110226591) [(0, 1), (2, 1), (9, 1), (12, 1), (15, 1)],
  term ((-21999136439 : Rat) / 3490508715) [(0, 1), (2, 1), (9, 1), (13, 1)],
  term ((-324690464 : Rat) / 12247399) [(0, 1), (2, 1), (9, 1), (13, 1), (14, 1)],
  term ((-59840000 : Rat) / 110226591) [(0, 1), (2, 1), (9, 1), (13, 1), (15, 2)],
  term ((1827840 : Rat) / 12247399) [(0, 1), (2, 1), (9, 1), (13, 2), (15, 1)],
  term ((18739278208 : Rat) / 330679773) [(0, 1), (2, 1), (9, 1), (14, 1), (15, 1)],
  term ((1545362537248 : Rat) / 94243735305) [(0, 1), (2, 1), (9, 1), (15, 1)],
  term ((17582080 : Rat) / 36742197) [(0, 1), (2, 1), (9, 1), (15, 3)],
  term ((588 : Rat) / 67) [(0, 1), (2, 1), (9, 2)],
  term ((-240 : Rat) / 67) [(0, 1), (2, 1), (10, 1)],
  term ((113004316796 : Rat) / 3490508715) [(0, 1), (2, 1), (10, 1), (11, 1), (13, 1)],
  term ((-6521963426512 : Rat) / 94243735305) [(0, 1), (2, 1), (10, 1), (11, 1), (15, 1)],
  term ((7232276274944 : Rat) / 94243735305) [(0, 1), (2, 1), (10, 1), (11, 2)],
  term ((109598720 : Rat) / 36742197) [(0, 1), (2, 1), (11, 1), (12, 1), (13, 1)],
  term ((-2015045120 : Rat) / 330679773) [(0, 1), (2, 1), (11, 1), (12, 1), (15, 1)],
  term ((-423542858669 : Rat) / 31414578435) [(0, 1), (2, 1), (11, 1), (13, 1)],
  term ((-7311360 : Rat) / 12247399) [(0, 1), (2, 1), (11, 1), (13, 1), (14, 1)],
  term ((-5962240 : Rat) / 110226591) [(0, 1), (2, 1), (11, 1), (13, 1), (15, 2)],
  term ((-1827840 : Rat) / 12247399) [(0, 1), (2, 1), (11, 1), (13, 2), (15, 1)],
  term ((140656640 : Rat) / 110226591) [(0, 1), (2, 1), (11, 1), (14, 1), (15, 1)],
  term ((4686438894512 : Rat) / 94243735305) [(0, 1), (2, 1), (11, 1), (15, 1)],
  term ((87910400 : Rat) / 110226591) [(0, 1), (2, 1), (11, 1), (15, 3)],
  term ((-2550305843824 : Rat) / 94243735305) [(0, 1), (2, 1), (11, 2)],
  term ((77987840 : Rat) / 110226591) [(0, 1), (2, 1), (11, 2), (12, 1)],
  term ((125511680 : Rat) / 110226591) [(0, 1), (2, 1), (11, 2), (13, 1), (15, 1)],
  term ((-155975680 : Rat) / 110226591) [(0, 1), (2, 1), (11, 2), (14, 1)],
  term ((-149708800 : Rat) / 36742197) [(0, 1), (2, 1), (11, 2), (15, 2)],
  term ((389939200 : Rat) / 110226591) [(0, 1), (2, 1), (11, 3), (15, 1)],
  term ((-173509960 : Rat) / 36742197) [(0, 1), (2, 1), (12, 1), (13, 1), (15, 1)],
  term ((13870080 : Rat) / 12247399) [(0, 1), (2, 1), (12, 1), (13, 2)],
  term ((1626875680 : Rat) / 330679773) [(0, 1), (2, 1), (12, 1), (15, 2)],
  term ((3655752740 : Rat) / 330679773) [(0, 1), (2, 1), (13, 1), (15, 1)],
  term ((-2867200 : Rat) / 12247399) [(0, 1), (2, 1), (13, 2)],
  term ((-7460692240 : Rat) / 330679773) [(0, 1), (2, 1), (15, 2)],
  term ((-98631680 : Rat) / 36742197) [(0, 1), (2, 2), (11, 1), (13, 1)],
  term ((1804060160 : Rat) / 330679773) [(0, 1), (2, 2), (11, 1), (15, 1)],
  term ((173509960 : Rat) / 36742197) [(0, 1), (2, 2), (13, 1), (15, 1)],
  term ((-13870080 : Rat) / 12247399) [(0, 1), (2, 2), (13, 2)],
  term ((-1626875680 : Rat) / 330679773) [(0, 1), (2, 2), (15, 2)],
  term ((2371747840 : Rat) / 330679773) [(0, 1), (3, 1), (11, 1), (12, 1)],
  term ((-8322926080 : Rat) / 330679773) [(0, 1), (3, 1), (11, 1), (12, 1), (14, 1)],
  term ((671390720 : Rat) / 110226591) [(0, 1), (3, 1), (11, 1), (12, 2)],
  term ((37058560 : Rat) / 12247399) [(0, 1), (3, 1), (12, 1), (13, 1)],
  term ((-130045720 : Rat) / 12247399) [(0, 1), (3, 1), (12, 1), (13, 1), (14, 1)],
  term ((7505495840 : Rat) / 330679773) [(0, 1), (3, 1), (12, 1), (14, 1), (15, 1)],
  term ((-2138808320 : Rat) / 330679773) [(0, 1), (3, 1), (12, 1), (15, 1)],
  term ((31471440 : Rat) / 12247399) [(0, 1), (3, 1), (12, 2), (13, 1)],
  term ((-605450560 : Rat) / 110226591) [(0, 1), (3, 1), (12, 2), (15, 1)],
  term ((588 : Rat) / 67) [(0, 1), (5, 1), (9, 1), (12, 1)],
  term ((-2580411430912 : Rat) / 31414578435) [(0, 1), (5, 1), (10, 1), (11, 1), (12, 1)],
  term ((-40318928608 : Rat) / 1163502905) [(0, 1), (5, 1), (10, 1), (12, 1), (13, 1)],
  term ((2326978165376 : Rat) / 31414578435) [(0, 1), (5, 1), (10, 1), (12, 1), (15, 1)],
  term ((-5024193452096 : Rat) / 94243735305) [(0, 1), (5, 1), (11, 1), (12, 1)],
  term ((38993920 : Rat) / 110226591) [(0, 1), (5, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((12298915328 : Rat) / 330679773) [(0, 1), (5, 1), (11, 1), (12, 1), (14, 1)],
  term ((-370442240 : Rat) / 110226591) [(0, 1), (5, 1), (11, 1), (12, 1), (15, 2)],
  term ((18448059392 : Rat) / 110226591) [(0, 1), (5, 1), (11, 1), (12, 2)],
  term ((-78503022689 : Rat) / 3490508715) [(0, 1), (5, 1), (12, 1), (13, 1)],
  term ((192170552 : Rat) / 12247399) [(0, 1), (5, 1), (12, 1), (13, 1), (14, 1)],
  term ((-3612160 : Rat) / 2079747) [(0, 1), (5, 1), (12, 1), (13, 1), (15, 2)],
  term ((1827840 : Rat) / 12247399) [(0, 1), (5, 1), (12, 1), (13, 2), (15, 1)],
  term ((-11090986144 : Rat) / 330679773) [(0, 1), (5, 1), (12, 1), (14, 1), (15, 1)],
  term ((4806443972248 : Rat) / 94243735305) [(0, 1), (5, 1), (12, 1), (15, 1)],
  term ((334059520 : Rat) / 110226591) [(0, 1), (5, 1), (12, 1), (15, 3)],
  term ((864752784 : Rat) / 12247399) [(0, 1), (5, 1), (12, 2), (13, 1)],
  term ((-16162386592 : Rat) / 110226591) [(0, 1), (5, 1), (12, 2), (15, 1)],
  term ((-436242609152 : Rat) / 10471526145) [(0, 1), (7, 1), (10, 1), (11, 1), (12, 1)],
  term ((-20448872304 : Rat) / 1163502905) [(0, 1), (7, 1), (10, 1), (12, 1), (13, 1)],
  term ((393397352896 : Rat) / 10471526145) [(0, 1), (7, 1), (10, 1), (12, 1), (15, 1)],
  term ((981694336 : Rat) / 110226591) [(0, 1), (7, 1), (11, 1), (12, 1)],
  term ((9139200 : Rat) / 12247399) [(0, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((5360588800 : Rat) / 330679773) [(0, 1), (7, 1), (11, 1), (12, 1), (14, 1)],
  term ((-175820800 : Rat) / 110226591) [(0, 1), (7, 1), (11, 1), (12, 1), (15, 2)],
  term ((-25822494208 : Rat) / 330679773) [(0, 1), (7, 1), (11, 1), (12, 2)],
  term ((194969600 : Rat) / 110226591) [(0, 1), (7, 1), (11, 2), (12, 1), (15, 1)],
  term ((46016922 : Rat) / 12247399) [(0, 1), (7, 1), (12, 1), (13, 1)],
  term ((83759200 : Rat) / 12247399) [(0, 1), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((-4834102400 : Rat) / 330679773) [(0, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-885277928 : Rat) / 110226591) [(0, 1), (7, 1), (12, 1), (15, 1)],
  term ((-403476472 : Rat) / 12247399) [(0, 1), (7, 1), (12, 2), (13, 1)],
  term ((21864926912 : Rat) / 330679773) [(0, 1), (7, 1), (12, 2), (15, 1)],
  term ((1508464323968 : Rat) / 18848747061) [(0, 1), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((23569755062 : Rat) / 698101743) [(0, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((-1360311577864 : Rat) / 18848747061) [(0, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((2910218005316 : Rat) / 94243735305) [(0, 1), (9, 1), (11, 1), (12, 1)],
  term ((-38993920 : Rat) / 110226591) [(0, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((20780189696 : Rat) / 330679773) [(0, 1), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((19496960 : Rat) / 36742197) [(0, 1), (9, 1), (11, 1), (12, 1), (15, 2)],
  term ((-10093723136 : Rat) / 110226591) [(0, 1), (9, 1), (11, 1), (12, 2)],
  term ((21999136439 : Rat) / 3490508715) [(0, 1), (9, 1), (12, 1), (13, 1)],
  term ((324690464 : Rat) / 12247399) [(0, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((59840000 : Rat) / 110226591) [(0, 1), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((-1827840 : Rat) / 12247399) [(0, 1), (9, 1), (12, 1), (13, 2), (15, 1)],
  term ((-18739278208 : Rat) / 330679773) [(0, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1545362537248 : Rat) / 94243735305) [(0, 1), (9, 1), (12, 1), (15, 1)],
  term ((-17582080 : Rat) / 36742197) [(0, 1), (9, 1), (12, 1), (15, 3)],
  term ((-473143272 : Rat) / 12247399) [(0, 1), (9, 1), (12, 2), (13, 1)],
  term ((9102375328 : Rat) / 110226591) [(0, 1), (9, 1), (12, 2), (15, 1)],
  term ((-588 : Rat) / 67) [(0, 1), (9, 2), (12, 1)],
  term ((-113004316796 : Rat) / 3490508715) [(0, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((6521963426512 : Rat) / 94243735305) [(0, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-7232276274944 : Rat) / 94243735305) [(0, 1), (10, 1), (11, 2), (12, 1)],
  term ((240 : Rat) / 67) [(0, 1), (10, 1), (12, 1)],
  term ((423542858669 : Rat) / 31414578435) [(0, 1), (11, 1), (12, 1), (13, 1)],
  term ((7311360 : Rat) / 12247399) [(0, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((5962240 : Rat) / 110226591) [(0, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((1827840 : Rat) / 12247399) [(0, 1), (11, 1), (12, 1), (13, 2), (15, 1)],
  term ((-140656640 : Rat) / 110226591) [(0, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-4686438894512 : Rat) / 94243735305) [(0, 1), (11, 1), (12, 1), (15, 1)],
  term ((-87910400 : Rat) / 110226591) [(0, 1), (11, 1), (12, 1), (15, 3)],
  term ((-3655680 : Rat) / 12247399) [(0, 1), (11, 1), (12, 2), (13, 1)],
  term ((70328320 : Rat) / 110226591) [(0, 1), (11, 1), (12, 2), (15, 1)],
  term ((2550305843824 : Rat) / 94243735305) [(0, 1), (11, 2), (12, 1)],
  term ((-125511680 : Rat) / 110226591) [(0, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((155975680 : Rat) / 110226591) [(0, 1), (11, 2), (12, 1), (14, 1)],
  term ((149708800 : Rat) / 36742197) [(0, 1), (11, 2), (12, 1), (15, 2)],
  term ((-77987840 : Rat) / 110226591) [(0, 1), (11, 2), (12, 2)],
  term ((-389939200 : Rat) / 110226591) [(0, 1), (11, 3), (12, 1), (15, 1)],
  term ((-3655752740 : Rat) / 330679773) [(0, 1), (12, 1), (13, 1), (15, 1)],
  term ((2867200 : Rat) / 12247399) [(0, 1), (12, 1), (13, 2)],
  term ((7460692240 : Rat) / 330679773) [(0, 1), (12, 1), (15, 2)],
  term ((-98631680 : Rat) / 36742197) [(1, 1), (2, 1), (3, 1), (11, 1), (13, 1)],
  term ((1804060160 : Rat) / 330679773) [(1, 1), (2, 1), (3, 1), (11, 1), (15, 1)],
  term ((173509960 : Rat) / 36742197) [(1, 1), (2, 1), (3, 1), (13, 1), (15, 1)],
  term ((-13870080 : Rat) / 12247399) [(1, 1), (2, 1), (3, 1), (13, 2)],
  term ((-1626875680 : Rat) / 330679773) [(1, 1), (2, 1), (3, 1), (15, 2)],
  term ((-1804060160 : Rat) / 330679773) [(1, 1), (2, 1), (11, 1), (13, 1), (15, 1)],
  term ((98631680 : Rat) / 36742197) [(1, 1), (2, 1), (11, 1), (13, 2)],
  term ((1626875680 : Rat) / 330679773) [(1, 1), (2, 1), (13, 1), (15, 2)],
  term ((-173509960 : Rat) / 36742197) [(1, 1), (2, 1), (13, 2), (15, 1)],
  term ((13870080 : Rat) / 12247399) [(1, 1), (2, 1), (13, 3)],
  term ((-588 : Rat) / 67) [(1, 1), (3, 1), (5, 1), (9, 1)],
  term ((2580411430912 : Rat) / 31414578435) [(1, 1), (3, 1), (5, 1), (10, 1), (11, 1)],
  term ((40318928608 : Rat) / 1163502905) [(1, 1), (3, 1), (5, 1), (10, 1), (13, 1)],
  term ((-2326978165376 : Rat) / 31414578435) [(1, 1), (3, 1), (5, 1), (10, 1), (15, 1)],
  term ((5024193452096 : Rat) / 94243735305) [(1, 1), (3, 1), (5, 1), (11, 1)],
  term ((-18448059392 : Rat) / 110226591) [(1, 1), (3, 1), (5, 1), (11, 1), (12, 1)],
  term ((-38993920 : Rat) / 110226591) [(1, 1), (3, 1), (5, 1), (11, 1), (13, 1), (15, 1)],
  term ((-12298915328 : Rat) / 330679773) [(1, 1), (3, 1), (5, 1), (11, 1), (14, 1)],
  term ((370442240 : Rat) / 110226591) [(1, 1), (3, 1), (5, 1), (11, 1), (15, 2)],
  term ((-864752784 : Rat) / 12247399) [(1, 1), (3, 1), (5, 1), (12, 1), (13, 1)],
  term ((16162386592 : Rat) / 110226591) [(1, 1), (3, 1), (5, 1), (12, 1), (15, 1)],
  term ((78503022689 : Rat) / 3490508715) [(1, 1), (3, 1), (5, 1), (13, 1)],
  term ((-192170552 : Rat) / 12247399) [(1, 1), (3, 1), (5, 1), (13, 1), (14, 1)],
  term ((3612160 : Rat) / 2079747) [(1, 1), (3, 1), (5, 1), (13, 1), (15, 2)],
  term ((-1827840 : Rat) / 12247399) [(1, 1), (3, 1), (5, 1), (13, 2), (15, 1)],
  term ((11090986144 : Rat) / 330679773) [(1, 1), (3, 1), (5, 1), (14, 1), (15, 1)],
  term ((-4806443972248 : Rat) / 94243735305) [(1, 1), (3, 1), (5, 1), (15, 1)],
  term ((-334059520 : Rat) / 110226591) [(1, 1), (3, 1), (5, 1), (15, 3)],
  term ((436242609152 : Rat) / 10471526145) [(1, 1), (3, 1), (7, 1), (10, 1), (11, 1)],
  term ((20448872304 : Rat) / 1163502905) [(1, 1), (3, 1), (7, 1), (10, 1), (13, 1)],
  term ((-393397352896 : Rat) / 10471526145) [(1, 1), (3, 1), (7, 1), (10, 1), (15, 1)],
  term ((-981694336 : Rat) / 110226591) [(1, 1), (3, 1), (7, 1), (11, 1)],
  term ((25822494208 : Rat) / 330679773) [(1, 1), (3, 1), (7, 1), (11, 1), (12, 1)],
  term ((-9139200 : Rat) / 12247399) [(1, 1), (3, 1), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-5360588800 : Rat) / 330679773) [(1, 1), (3, 1), (7, 1), (11, 1), (14, 1)],
  term ((175820800 : Rat) / 110226591) [(1, 1), (3, 1), (7, 1), (11, 1), (15, 2)],
  term ((-194969600 : Rat) / 110226591) [(1, 1), (3, 1), (7, 1), (11, 2), (15, 1)],
  term ((403476472 : Rat) / 12247399) [(1, 1), (3, 1), (7, 1), (12, 1), (13, 1)],
  term ((-21864926912 : Rat) / 330679773) [(1, 1), (3, 1), (7, 1), (12, 1), (15, 1)],
  term ((-46016922 : Rat) / 12247399) [(1, 1), (3, 1), (7, 1), (13, 1)],
  term ((-83759200 : Rat) / 12247399) [(1, 1), (3, 1), (7, 1), (13, 1), (14, 1)],
  term ((4834102400 : Rat) / 330679773) [(1, 1), (3, 1), (7, 1), (14, 1), (15, 1)],
  term ((885277928 : Rat) / 110226591) [(1, 1), (3, 1), (7, 1), (15, 1)],
  term ((-1508464323968 : Rat) / 18848747061) [(1, 1), (3, 1), (9, 1), (10, 1), (11, 1)],
  term ((-23569755062 : Rat) / 698101743) [(1, 1), (3, 1), (9, 1), (10, 1), (13, 1)],
  term ((1360311577864 : Rat) / 18848747061) [(1, 1), (3, 1), (9, 1), (10, 1), (15, 1)],
  term ((-2910218005316 : Rat) / 94243735305) [(1, 1), (3, 1), (9, 1), (11, 1)],
  term ((10093723136 : Rat) / 110226591) [(1, 1), (3, 1), (9, 1), (11, 1), (12, 1)],
  term ((38993920 : Rat) / 110226591) [(1, 1), (3, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-20780189696 : Rat) / 330679773) [(1, 1), (3, 1), (9, 1), (11, 1), (14, 1)],
  term ((-19496960 : Rat) / 36742197) [(1, 1), (3, 1), (9, 1), (11, 1), (15, 2)],
  term ((473143272 : Rat) / 12247399) [(1, 1), (3, 1), (9, 1), (12, 1), (13, 1)],
  term ((-9102375328 : Rat) / 110226591) [(1, 1), (3, 1), (9, 1), (12, 1), (15, 1)],
  term ((-21999136439 : Rat) / 3490508715) [(1, 1), (3, 1), (9, 1), (13, 1)],
  term ((-324690464 : Rat) / 12247399) [(1, 1), (3, 1), (9, 1), (13, 1), (14, 1)],
  term ((-59840000 : Rat) / 110226591) [(1, 1), (3, 1), (9, 1), (13, 1), (15, 2)],
  term ((1827840 : Rat) / 12247399) [(1, 1), (3, 1), (9, 1), (13, 2), (15, 1)],
  term ((18739278208 : Rat) / 330679773) [(1, 1), (3, 1), (9, 1), (14, 1), (15, 1)],
  term ((1545362537248 : Rat) / 94243735305) [(1, 1), (3, 1), (9, 1), (15, 1)],
  term ((17582080 : Rat) / 36742197) [(1, 1), (3, 1), (9, 1), (15, 3)],
  term ((588 : Rat) / 67) [(1, 1), (3, 1), (9, 2)],
  term ((-240 : Rat) / 67) [(1, 1), (3, 1), (10, 1)],
  term ((113004316796 : Rat) / 3490508715) [(1, 1), (3, 1), (10, 1), (11, 1), (13, 1)],
  term ((-6521963426512 : Rat) / 94243735305) [(1, 1), (3, 1), (10, 1), (11, 1), (15, 1)],
  term ((7232276274944 : Rat) / 94243735305) [(1, 1), (3, 1), (10, 1), (11, 2)],
  term ((704291840 : Rat) / 110226591) [(1, 1), (3, 1), (11, 1), (12, 1), (13, 1)],
  term ((-70328320 : Rat) / 110226591) [(1, 1), (3, 1), (11, 1), (12, 1), (15, 1)],
  term ((-7341733847 : Rat) / 1163502905) [(1, 1), (3, 1), (11, 1), (13, 1)],
  term ((-8520332800 : Rat) / 330679773) [(1, 1), (3, 1), (11, 1), (13, 1), (14, 1)],
  term ((-5962240 : Rat) / 110226591) [(1, 1), (3, 1), (11, 1), (13, 1), (15, 2)],
  term ((-1827840 : Rat) / 12247399) [(1, 1), (3, 1), (11, 1), (13, 2), (15, 1)],
  term ((140656640 : Rat) / 110226591) [(1, 1), (3, 1), (11, 1), (14, 1), (15, 1)],
  term ((4686438894512 : Rat) / 94243735305) [(1, 1), (3, 1), (11, 1), (15, 1)],
  term ((87910400 : Rat) / 110226591) [(1, 1), (3, 1), (11, 1), (15, 3)],
  term ((-2550305843824 : Rat) / 94243735305) [(1, 1), (3, 1), (11, 2)],
  term ((77987840 : Rat) / 110226591) [(1, 1), (3, 1), (11, 2), (12, 1)],
  term ((125511680 : Rat) / 110226591) [(1, 1), (3, 1), (11, 2), (13, 1), (15, 1)],
  term ((-155975680 : Rat) / 110226591) [(1, 1), (3, 1), (11, 2), (14, 1)],
  term ((-149708800 : Rat) / 36742197) [(1, 1), (3, 1), (11, 2), (15, 2)],
  term ((389939200 : Rat) / 110226591) [(1, 1), (3, 1), (11, 3), (15, 1)],
  term ((-605450560 : Rat) / 110226591) [(1, 1), (3, 1), (12, 1), (13, 1), (15, 1)],
  term ((31471440 : Rat) / 12247399) [(1, 1), (3, 1), (12, 1), (13, 2)],
  term ((7505495840 : Rat) / 330679773) [(1, 1), (3, 1), (13, 1), (14, 1), (15, 1)],
  term ((168549380 : Rat) / 36742197) [(1, 1), (3, 1), (13, 1), (15, 1)],
  term ((645120 : Rat) / 231083) [(1, 1), (3, 1), (13, 2)],
  term ((-130045720 : Rat) / 12247399) [(1, 1), (3, 1), (13, 2), (14, 1)],
  term ((-7460692240 : Rat) / 330679773) [(1, 1), (3, 1), (15, 2)],
  term ((-2371747840 : Rat) / 330679773) [(1, 1), (3, 2), (11, 1)],
  term ((-671390720 : Rat) / 110226591) [(1, 1), (3, 2), (11, 1), (12, 1)],
  term ((8322926080 : Rat) / 330679773) [(1, 1), (3, 2), (11, 1), (14, 1)],
  term ((-31471440 : Rat) / 12247399) [(1, 1), (3, 2), (12, 1), (13, 1)],
  term ((605450560 : Rat) / 110226591) [(1, 1), (3, 2), (12, 1), (15, 1)],
  term ((-37058560 : Rat) / 12247399) [(1, 1), (3, 2), (13, 1)],
  term ((130045720 : Rat) / 12247399) [(1, 1), (3, 2), (13, 1), (14, 1)],
  term ((-7505495840 : Rat) / 330679773) [(1, 1), (3, 2), (14, 1), (15, 1)],
  term ((2138808320 : Rat) / 330679773) [(1, 1), (3, 2), (15, 1)],
  term ((588 : Rat) / 67) [(1, 1), (5, 1), (9, 1), (13, 1)],
  term ((-2580411430912 : Rat) / 31414578435) [(1, 1), (5, 1), (10, 1), (11, 1), (13, 1)],
  term ((2326978165376 : Rat) / 31414578435) [(1, 1), (5, 1), (10, 1), (13, 1), (15, 1)],
  term ((-40318928608 : Rat) / 1163502905) [(1, 1), (5, 1), (10, 1), (13, 2)],
  term ((18448059392 : Rat) / 110226591) [(1, 1), (5, 1), (11, 1), (12, 1), (13, 1)],
  term ((-5024193452096 : Rat) / 94243735305) [(1, 1), (5, 1), (11, 1), (13, 1)],
  term ((12298915328 : Rat) / 330679773) [(1, 1), (5, 1), (11, 1), (13, 1), (14, 1)],
  term ((-370442240 : Rat) / 110226591) [(1, 1), (5, 1), (11, 1), (13, 1), (15, 2)],
  term ((38993920 : Rat) / 110226591) [(1, 1), (5, 1), (11, 1), (13, 2), (15, 1)],
  term ((-16162386592 : Rat) / 110226591) [(1, 1), (5, 1), (12, 1), (13, 1), (15, 1)],
  term ((864752784 : Rat) / 12247399) [(1, 1), (5, 1), (12, 1), (13, 2)],
  term ((-11090986144 : Rat) / 330679773) [(1, 1), (5, 1), (13, 1), (14, 1), (15, 1)],
  term ((4806443972248 : Rat) / 94243735305) [(1, 1), (5, 1), (13, 1), (15, 1)],
  term ((334059520 : Rat) / 110226591) [(1, 1), (5, 1), (13, 1), (15, 3)],
  term ((-78503022689 : Rat) / 3490508715) [(1, 1), (5, 1), (13, 2)],
  term ((192170552 : Rat) / 12247399) [(1, 1), (5, 1), (13, 2), (14, 1)],
  term ((-3612160 : Rat) / 2079747) [(1, 1), (5, 1), (13, 2), (15, 2)],
  term ((1827840 : Rat) / 12247399) [(1, 1), (5, 1), (13, 3), (15, 1)],
  term ((-436242609152 : Rat) / 10471526145) [(1, 1), (7, 1), (10, 1), (11, 1), (13, 1)],
  term ((393397352896 : Rat) / 10471526145) [(1, 1), (7, 1), (10, 1), (13, 1), (15, 1)],
  term ((-20448872304 : Rat) / 1163502905) [(1, 1), (7, 1), (10, 1), (13, 2)],
  term ((-25822494208 : Rat) / 330679773) [(1, 1), (7, 1), (11, 1), (12, 1), (13, 1)],
  term ((981694336 : Rat) / 110226591) [(1, 1), (7, 1), (11, 1), (13, 1)],
  term ((5360588800 : Rat) / 330679773) [(1, 1), (7, 1), (11, 1), (13, 1), (14, 1)],
  term ((-175820800 : Rat) / 110226591) [(1, 1), (7, 1), (11, 1), (13, 1), (15, 2)],
  term ((9139200 : Rat) / 12247399) [(1, 1), (7, 1), (11, 1), (13, 2), (15, 1)],
  term ((194969600 : Rat) / 110226591) [(1, 1), (7, 1), (11, 2), (13, 1), (15, 1)],
  term ((21864926912 : Rat) / 330679773) [(1, 1), (7, 1), (12, 1), (13, 1), (15, 1)],
  term ((-403476472 : Rat) / 12247399) [(1, 1), (7, 1), (12, 1), (13, 2)],
  term ((-4834102400 : Rat) / 330679773) [(1, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((-885277928 : Rat) / 110226591) [(1, 1), (7, 1), (13, 1), (15, 1)],
  term ((46016922 : Rat) / 12247399) [(1, 1), (7, 1), (13, 2)],
  term ((83759200 : Rat) / 12247399) [(1, 1), (7, 1), (13, 2), (14, 1)],
  term ((1508464323968 : Rat) / 18848747061) [(1, 1), (9, 1), (10, 1), (11, 1), (13, 1)],
  term ((-1360311577864 : Rat) / 18848747061) [(1, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((23569755062 : Rat) / 698101743) [(1, 1), (9, 1), (10, 1), (13, 2)],
  term ((-10093723136 : Rat) / 110226591) [(1, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((2910218005316 : Rat) / 94243735305) [(1, 1), (9, 1), (11, 1), (13, 1)],
  term ((20780189696 : Rat) / 330679773) [(1, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((19496960 : Rat) / 36742197) [(1, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((-38993920 : Rat) / 110226591) [(1, 1), (9, 1), (11, 1), (13, 2), (15, 1)],
  term ((9102375328 : Rat) / 110226591) [(1, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-473143272 : Rat) / 12247399) [(1, 1), (9, 1), (12, 1), (13, 2)],
  term ((-18739278208 : Rat) / 330679773) [(1, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1545362537248 : Rat) / 94243735305) [(1, 1), (9, 1), (13, 1), (15, 1)],
  term ((-17582080 : Rat) / 36742197) [(1, 1), (9, 1), (13, 1), (15, 3)],
  term ((21999136439 : Rat) / 3490508715) [(1, 1), (9, 1), (13, 2)],
  term ((324690464 : Rat) / 12247399) [(1, 1), (9, 1), (13, 2), (14, 1)],
  term ((59840000 : Rat) / 110226591) [(1, 1), (9, 1), (13, 2), (15, 2)],
  term ((-1827840 : Rat) / 12247399) [(1, 1), (9, 1), (13, 3), (15, 1)],
  term ((-588 : Rat) / 67) [(1, 1), (9, 2), (13, 1)],
  term ((6521963426512 : Rat) / 94243735305) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-113004316796 : Rat) / 3490508715) [(1, 1), (10, 1), (11, 1), (13, 2)],
  term ((-7232276274944 : Rat) / 94243735305) [(1, 1), (10, 1), (11, 2), (13, 1)],
  term ((240 : Rat) / 67) [(1, 1), (10, 1), (13, 1)],
  term ((70328320 : Rat) / 110226591) [(1, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-3655680 : Rat) / 12247399) [(1, 1), (11, 1), (12, 1), (13, 2)],
  term ((-140656640 : Rat) / 110226591) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-4686438894512 : Rat) / 94243735305) [(1, 1), (11, 1), (13, 1), (15, 1)],
  term ((-87910400 : Rat) / 110226591) [(1, 1), (11, 1), (13, 1), (15, 3)],
  term ((423542858669 : Rat) / 31414578435) [(1, 1), (11, 1), (13, 2)],
  term ((7311360 : Rat) / 12247399) [(1, 1), (11, 1), (13, 2), (14, 1)],
  term ((5962240 : Rat) / 110226591) [(1, 1), (11, 1), (13, 2), (15, 2)],
  term ((1827840 : Rat) / 12247399) [(1, 1), (11, 1), (13, 3), (15, 1)],
  term ((-77987840 : Rat) / 110226591) [(1, 1), (11, 2), (12, 1), (13, 1)],
  term ((2550305843824 : Rat) / 94243735305) [(1, 1), (11, 2), (13, 1)],
  term ((155975680 : Rat) / 110226591) [(1, 1), (11, 2), (13, 1), (14, 1)],
  term ((149708800 : Rat) / 36742197) [(1, 1), (11, 2), (13, 1), (15, 2)],
  term ((-125511680 : Rat) / 110226591) [(1, 1), (11, 2), (13, 2), (15, 1)],
  term ((-389939200 : Rat) / 110226591) [(1, 1), (11, 3), (13, 1), (15, 1)],
  term ((7460692240 : Rat) / 330679773) [(1, 1), (13, 1), (15, 2)],
  term ((-3655752740 : Rat) / 330679773) [(1, 1), (13, 2), (15, 1)],
  term ((2867200 : Rat) / 12247399) [(1, 1), (13, 3)],
  term ((49315840 : Rat) / 36742197) [(2, 1), (3, 2), (11, 1), (13, 1)],
  term ((-902030080 : Rat) / 330679773) [(2, 1), (3, 2), (11, 1), (15, 1)],
  term ((-86754980 : Rat) / 36742197) [(2, 1), (3, 2), (13, 1), (15, 1)],
  term ((6935040 : Rat) / 12247399) [(2, 1), (3, 2), (13, 2)],
  term ((813437840 : Rat) / 330679773) [(2, 1), (3, 2), (15, 2)],
  term ((-49315840 : Rat) / 36742197) [(2, 1), (11, 1), (12, 2), (13, 1)],
  term ((902030080 : Rat) / 330679773) [(2, 1), (11, 1), (12, 2), (15, 1)],
  term ((902030080 : Rat) / 330679773) [(2, 1), (11, 1), (13, 2), (15, 1)],
  term ((-49315840 : Rat) / 36742197) [(2, 1), (11, 1), (13, 3)],
  term ((86754980 : Rat) / 36742197) [(2, 1), (12, 2), (13, 1), (15, 1)],
  term ((-6935040 : Rat) / 12247399) [(2, 1), (12, 2), (13, 2)],
  term ((-813437840 : Rat) / 330679773) [(2, 1), (12, 2), (15, 2)],
  term ((-813437840 : Rat) / 330679773) [(2, 1), (13, 2), (15, 2)],
  term ((86754980 : Rat) / 36742197) [(2, 1), (13, 3), (15, 1)],
  term ((-6935040 : Rat) / 12247399) [(2, 1), (13, 4)],
  term ((1185873920 : Rat) / 330679773) [(2, 2), (3, 1), (11, 1)],
  term ((335695360 : Rat) / 110226591) [(2, 2), (3, 1), (11, 1), (12, 1)],
  term ((-4161463040 : Rat) / 330679773) [(2, 2), (3, 1), (11, 1), (14, 1)],
  term ((15735720 : Rat) / 12247399) [(2, 2), (3, 1), (12, 1), (13, 1)],
  term ((-302725280 : Rat) / 110226591) [(2, 2), (3, 1), (12, 1), (15, 1)],
  term ((18529280 : Rat) / 12247399) [(2, 2), (3, 1), (13, 1)],
  term ((-65022860 : Rat) / 12247399) [(2, 2), (3, 1), (13, 1), (14, 1)],
  term ((3752747920 : Rat) / 330679773) [(2, 2), (3, 1), (14, 1), (15, 1)],
  term ((-1069404160 : Rat) / 330679773) [(2, 2), (3, 1), (15, 1)],
  term ((294 : Rat) / 67) [(2, 2), (5, 1), (9, 1)],
  term ((-1290205715456 : Rat) / 31414578435) [(2, 2), (5, 1), (10, 1), (11, 1)],
  term ((-20159464304 : Rat) / 1163502905) [(2, 2), (5, 1), (10, 1), (13, 1)],
  term ((1163489082688 : Rat) / 31414578435) [(2, 2), (5, 1), (10, 1), (15, 1)],
  term ((-2512096726048 : Rat) / 94243735305) [(2, 2), (5, 1), (11, 1)],
  term ((9224029696 : Rat) / 110226591) [(2, 2), (5, 1), (11, 1), (12, 1)],
  term ((19496960 : Rat) / 110226591) [(2, 2), (5, 1), (11, 1), (13, 1), (15, 1)],
  term ((6149457664 : Rat) / 330679773) [(2, 2), (5, 1), (11, 1), (14, 1)],
  term ((-185221120 : Rat) / 110226591) [(2, 2), (5, 1), (11, 1), (15, 2)],
  term ((432376392 : Rat) / 12247399) [(2, 2), (5, 1), (12, 1), (13, 1)],
  term ((-8081193296 : Rat) / 110226591) [(2, 2), (5, 1), (12, 1), (15, 1)],
  term ((-78503022689 : Rat) / 6981017430) [(2, 2), (5, 1), (13, 1)],
  term ((96085276 : Rat) / 12247399) [(2, 2), (5, 1), (13, 1), (14, 1)],
  term ((-1806080 : Rat) / 2079747) [(2, 2), (5, 1), (13, 1), (15, 2)],
  term ((913920 : Rat) / 12247399) [(2, 2), (5, 1), (13, 2), (15, 1)],
  term ((-5545493072 : Rat) / 330679773) [(2, 2), (5, 1), (14, 1), (15, 1)],
  term ((2403221986124 : Rat) / 94243735305) [(2, 2), (5, 1), (15, 1)],
  term ((167029760 : Rat) / 110226591) [(2, 2), (5, 1), (15, 3)],
  term ((-218121304576 : Rat) / 10471526145) [(2, 2), (7, 1), (10, 1), (11, 1)],
  term ((-10224436152 : Rat) / 1163502905) [(2, 2), (7, 1), (10, 1), (13, 1)],
  term ((196698676448 : Rat) / 10471526145) [(2, 2), (7, 1), (10, 1), (15, 1)],
  term ((490847168 : Rat) / 110226591) [(2, 2), (7, 1), (11, 1)],
  term ((-12911247104 : Rat) / 330679773) [(2, 2), (7, 1), (11, 1), (12, 1)],
  term ((4569600 : Rat) / 12247399) [(2, 2), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((2680294400 : Rat) / 330679773) [(2, 2), (7, 1), (11, 1), (14, 1)],
  term ((-87910400 : Rat) / 110226591) [(2, 2), (7, 1), (11, 1), (15, 2)],
  term ((97484800 : Rat) / 110226591) [(2, 2), (7, 1), (11, 2), (15, 1)],
  term ((-201738236 : Rat) / 12247399) [(2, 2), (7, 1), (12, 1), (13, 1)],
  term ((10932463456 : Rat) / 330679773) [(2, 2), (7, 1), (12, 1), (15, 1)],
  term ((23008461 : Rat) / 12247399) [(2, 2), (7, 1), (13, 1)],
  term ((41879600 : Rat) / 12247399) [(2, 2), (7, 1), (13, 1), (14, 1)],
  term ((-2417051200 : Rat) / 330679773) [(2, 2), (7, 1), (14, 1), (15, 1)],
  term ((-442638964 : Rat) / 110226591) [(2, 2), (7, 1), (15, 1)],
  term ((754232161984 : Rat) / 18848747061) [(2, 2), (9, 1), (10, 1), (11, 1)],
  term ((11784877531 : Rat) / 698101743) [(2, 2), (9, 1), (10, 1), (13, 1)],
  term ((-680155788932 : Rat) / 18848747061) [(2, 2), (9, 1), (10, 1), (15, 1)],
  term ((1455109002658 : Rat) / 94243735305) [(2, 2), (9, 1), (11, 1)],
  term ((-5046861568 : Rat) / 110226591) [(2, 2), (9, 1), (11, 1), (12, 1)],
  term ((-19496960 : Rat) / 110226591) [(2, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((10390094848 : Rat) / 330679773) [(2, 2), (9, 1), (11, 1), (14, 1)],
  term ((9748480 : Rat) / 36742197) [(2, 2), (9, 1), (11, 1), (15, 2)],
  term ((-236571636 : Rat) / 12247399) [(2, 2), (9, 1), (12, 1), (13, 1)],
  term ((4551187664 : Rat) / 110226591) [(2, 2), (9, 1), (12, 1), (15, 1)],
  term ((21999136439 : Rat) / 6981017430) [(2, 2), (9, 1), (13, 1)],
  term ((162345232 : Rat) / 12247399) [(2, 2), (9, 1), (13, 1), (14, 1)],
  term ((29920000 : Rat) / 110226591) [(2, 2), (9, 1), (13, 1), (15, 2)],
  term ((-913920 : Rat) / 12247399) [(2, 2), (9, 1), (13, 2), (15, 1)],
  term ((-9369639104 : Rat) / 330679773) [(2, 2), (9, 1), (14, 1), (15, 1)],
  term ((-772681268624 : Rat) / 94243735305) [(2, 2), (9, 1), (15, 1)],
  term ((-8791040 : Rat) / 36742197) [(2, 2), (9, 1), (15, 3)],
  term ((-294 : Rat) / 67) [(2, 2), (9, 2)],
  term ((120 : Rat) / 67) [(2, 2), (10, 1)],
  term ((-56502158398 : Rat) / 3490508715) [(2, 2), (10, 1), (11, 1), (13, 1)],
  term ((3260981713256 : Rat) / 94243735305) [(2, 2), (10, 1), (11, 1), (15, 1)],
  term ((-3616138137472 : Rat) / 94243735305) [(2, 2), (10, 1), (11, 2)],
  term ((-1827840 : Rat) / 12247399) [(2, 2), (11, 1), (12, 1), (13, 1)],
  term ((35164160 : Rat) / 110226591) [(2, 2), (11, 1), (12, 1), (15, 1)],
  term ((423542858669 : Rat) / 62829156870) [(2, 2), (11, 1), (13, 1)],
  term ((3655680 : Rat) / 12247399) [(2, 2), (11, 1), (13, 1), (14, 1)],
  term ((2981120 : Rat) / 110226591) [(2, 2), (11, 1), (13, 1), (15, 2)],
  term ((913920 : Rat) / 12247399) [(2, 2), (11, 1), (13, 2), (15, 1)],
  term ((-70328320 : Rat) / 110226591) [(2, 2), (11, 1), (14, 1), (15, 1)],
  term ((-2343219447256 : Rat) / 94243735305) [(2, 2), (11, 1), (15, 1)],
  term ((-43955200 : Rat) / 110226591) [(2, 2), (11, 1), (15, 3)],
  term ((1275152921912 : Rat) / 94243735305) [(2, 2), (11, 2)],
  term ((-38993920 : Rat) / 110226591) [(2, 2), (11, 2), (12, 1)],
  term ((-62755840 : Rat) / 110226591) [(2, 2), (11, 2), (13, 1), (15, 1)],
  term ((77987840 : Rat) / 110226591) [(2, 2), (11, 2), (14, 1)],
  term ((74854400 : Rat) / 36742197) [(2, 2), (11, 2), (15, 2)],
  term ((-194969600 : Rat) / 110226591) [(2, 2), (11, 3), (15, 1)],
  term ((-1827876370 : Rat) / 330679773) [(2, 2), (13, 1), (15, 1)],
  term ((1433600 : Rat) / 12247399) [(2, 2), (13, 2)],
  term ((3730346120 : Rat) / 330679773) [(2, 2), (15, 2)],
  term ((49315840 : Rat) / 36742197) [(2, 3), (11, 1), (13, 1)],
  term ((-902030080 : Rat) / 330679773) [(2, 3), (11, 1), (15, 1)],
  term ((-86754980 : Rat) / 36742197) [(2, 3), (13, 1), (15, 1)],
  term ((6935040 : Rat) / 12247399) [(2, 3), (13, 2)],
  term ((813437840 : Rat) / 330679773) [(2, 3), (15, 2)],
  term ((-335695360 : Rat) / 110226591) [(3, 1), (11, 1), (12, 1), (13, 2)],
  term ((-1185873920 : Rat) / 330679773) [(3, 1), (11, 1), (12, 2)],
  term ((4161463040 : Rat) / 330679773) [(3, 1), (11, 1), (12, 2), (14, 1)],
  term ((-335695360 : Rat) / 110226591) [(3, 1), (11, 1), (12, 3)],
  term ((-1185873920 : Rat) / 330679773) [(3, 1), (11, 1), (13, 2)],
  term ((4161463040 : Rat) / 330679773) [(3, 1), (11, 1), (13, 2), (14, 1)],
  term ((302725280 : Rat) / 110226591) [(3, 1), (12, 1), (13, 2), (15, 1)],
  term ((-15735720 : Rat) / 12247399) [(3, 1), (12, 1), (13, 3)],
  term ((-18529280 : Rat) / 12247399) [(3, 1), (12, 2), (13, 1)],
  term ((65022860 : Rat) / 12247399) [(3, 1), (12, 2), (13, 1), (14, 1)],
  term ((-3752747920 : Rat) / 330679773) [(3, 1), (12, 2), (14, 1), (15, 1)],
  term ((1069404160 : Rat) / 330679773) [(3, 1), (12, 2), (15, 1)],
  term ((-15735720 : Rat) / 12247399) [(3, 1), (12, 3), (13, 1)],
  term ((302725280 : Rat) / 110226591) [(3, 1), (12, 3), (15, 1)],
  term ((-3752747920 : Rat) / 330679773) [(3, 1), (13, 2), (14, 1), (15, 1)],
  term ((1069404160 : Rat) / 330679773) [(3, 1), (13, 2), (15, 1)],
  term ((-18529280 : Rat) / 12247399) [(3, 1), (13, 3)],
  term ((65022860 : Rat) / 12247399) [(3, 1), (13, 3), (14, 1)],
  term ((294 : Rat) / 67) [(3, 2), (5, 1), (9, 1)],
  term ((-1290205715456 : Rat) / 31414578435) [(3, 2), (5, 1), (10, 1), (11, 1)],
  term ((-20159464304 : Rat) / 1163502905) [(3, 2), (5, 1), (10, 1), (13, 1)],
  term ((1163489082688 : Rat) / 31414578435) [(3, 2), (5, 1), (10, 1), (15, 1)],
  term ((-2512096726048 : Rat) / 94243735305) [(3, 2), (5, 1), (11, 1)],
  term ((9224029696 : Rat) / 110226591) [(3, 2), (5, 1), (11, 1), (12, 1)],
  term ((19496960 : Rat) / 110226591) [(3, 2), (5, 1), (11, 1), (13, 1), (15, 1)],
  term ((6149457664 : Rat) / 330679773) [(3, 2), (5, 1), (11, 1), (14, 1)],
  term ((-185221120 : Rat) / 110226591) [(3, 2), (5, 1), (11, 1), (15, 2)],
  term ((432376392 : Rat) / 12247399) [(3, 2), (5, 1), (12, 1), (13, 1)],
  term ((-8081193296 : Rat) / 110226591) [(3, 2), (5, 1), (12, 1), (15, 1)],
  term ((-78503022689 : Rat) / 6981017430) [(3, 2), (5, 1), (13, 1)],
  term ((96085276 : Rat) / 12247399) [(3, 2), (5, 1), (13, 1), (14, 1)],
  term ((-1806080 : Rat) / 2079747) [(3, 2), (5, 1), (13, 1), (15, 2)],
  term ((913920 : Rat) / 12247399) [(3, 2), (5, 1), (13, 2), (15, 1)],
  term ((-5545493072 : Rat) / 330679773) [(3, 2), (5, 1), (14, 1), (15, 1)],
  term ((2403221986124 : Rat) / 94243735305) [(3, 2), (5, 1), (15, 1)],
  term ((167029760 : Rat) / 110226591) [(3, 2), (5, 1), (15, 3)],
  term ((-218121304576 : Rat) / 10471526145) [(3, 2), (7, 1), (10, 1), (11, 1)],
  term ((-10224436152 : Rat) / 1163502905) [(3, 2), (7, 1), (10, 1), (13, 1)],
  term ((196698676448 : Rat) / 10471526145) [(3, 2), (7, 1), (10, 1), (15, 1)],
  term ((490847168 : Rat) / 110226591) [(3, 2), (7, 1), (11, 1)],
  term ((-12911247104 : Rat) / 330679773) [(3, 2), (7, 1), (11, 1), (12, 1)],
  term ((4569600 : Rat) / 12247399) [(3, 2), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((2680294400 : Rat) / 330679773) [(3, 2), (7, 1), (11, 1), (14, 1)],
  term ((-87910400 : Rat) / 110226591) [(3, 2), (7, 1), (11, 1), (15, 2)],
  term ((97484800 : Rat) / 110226591) [(3, 2), (7, 1), (11, 2), (15, 1)],
  term ((-201738236 : Rat) / 12247399) [(3, 2), (7, 1), (12, 1), (13, 1)],
  term ((10932463456 : Rat) / 330679773) [(3, 2), (7, 1), (12, 1), (15, 1)],
  term ((23008461 : Rat) / 12247399) [(3, 2), (7, 1), (13, 1)],
  term ((41879600 : Rat) / 12247399) [(3, 2), (7, 1), (13, 1), (14, 1)],
  term ((-2417051200 : Rat) / 330679773) [(3, 2), (7, 1), (14, 1), (15, 1)],
  term ((-442638964 : Rat) / 110226591) [(3, 2), (7, 1), (15, 1)],
  term ((754232161984 : Rat) / 18848747061) [(3, 2), (9, 1), (10, 1), (11, 1)],
  term ((11784877531 : Rat) / 698101743) [(3, 2), (9, 1), (10, 1), (13, 1)],
  term ((-680155788932 : Rat) / 18848747061) [(3, 2), (9, 1), (10, 1), (15, 1)],
  term ((1455109002658 : Rat) / 94243735305) [(3, 2), (9, 1), (11, 1)],
  term ((-5046861568 : Rat) / 110226591) [(3, 2), (9, 1), (11, 1), (12, 1)],
  term ((-19496960 : Rat) / 110226591) [(3, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((10390094848 : Rat) / 330679773) [(3, 2), (9, 1), (11, 1), (14, 1)],
  term ((9748480 : Rat) / 36742197) [(3, 2), (9, 1), (11, 1), (15, 2)],
  term ((-236571636 : Rat) / 12247399) [(3, 2), (9, 1), (12, 1), (13, 1)],
  term ((4551187664 : Rat) / 110226591) [(3, 2), (9, 1), (12, 1), (15, 1)],
  term ((21999136439 : Rat) / 6981017430) [(3, 2), (9, 1), (13, 1)],
  term ((162345232 : Rat) / 12247399) [(3, 2), (9, 1), (13, 1), (14, 1)],
  term ((29920000 : Rat) / 110226591) [(3, 2), (9, 1), (13, 1), (15, 2)],
  term ((-913920 : Rat) / 12247399) [(3, 2), (9, 1), (13, 2), (15, 1)],
  term ((-9369639104 : Rat) / 330679773) [(3, 2), (9, 1), (14, 1), (15, 1)],
  term ((-772681268624 : Rat) / 94243735305) [(3, 2), (9, 1), (15, 1)],
  term ((-8791040 : Rat) / 36742197) [(3, 2), (9, 1), (15, 3)],
  term ((-294 : Rat) / 67) [(3, 2), (9, 2)],
  term ((120 : Rat) / 67) [(3, 2), (10, 1)],
  term ((-56502158398 : Rat) / 3490508715) [(3, 2), (10, 1), (11, 1), (13, 1)],
  term ((3260981713256 : Rat) / 94243735305) [(3, 2), (10, 1), (11, 1), (15, 1)],
  term ((-3616138137472 : Rat) / 94243735305) [(3, 2), (10, 1), (11, 2)],
  term ((-1827840 : Rat) / 12247399) [(3, 2), (11, 1), (12, 1), (13, 1)],
  term ((35164160 : Rat) / 110226591) [(3, 2), (11, 1), (12, 1), (15, 1)],
  term ((423542858669 : Rat) / 62829156870) [(3, 2), (11, 1), (13, 1)],
  term ((3655680 : Rat) / 12247399) [(3, 2), (11, 1), (13, 1), (14, 1)],
  term ((2981120 : Rat) / 110226591) [(3, 2), (11, 1), (13, 1), (15, 2)],
  term ((913920 : Rat) / 12247399) [(3, 2), (11, 1), (13, 2), (15, 1)],
  term ((-70328320 : Rat) / 110226591) [(3, 2), (11, 1), (14, 1), (15, 1)],
  term ((-2343219447256 : Rat) / 94243735305) [(3, 2), (11, 1), (15, 1)],
  term ((-43955200 : Rat) / 110226591) [(3, 2), (11, 1), (15, 3)],
  term ((1275152921912 : Rat) / 94243735305) [(3, 2), (11, 2)],
  term ((-38993920 : Rat) / 110226591) [(3, 2), (11, 2), (12, 1)],
  term ((-62755840 : Rat) / 110226591) [(3, 2), (11, 2), (13, 1), (15, 1)],
  term ((77987840 : Rat) / 110226591) [(3, 2), (11, 2), (14, 1)],
  term ((74854400 : Rat) / 36742197) [(3, 2), (11, 2), (15, 2)],
  term ((-194969600 : Rat) / 110226591) [(3, 2), (11, 3), (15, 1)],
  term ((-1827876370 : Rat) / 330679773) [(3, 2), (13, 1), (15, 1)],
  term ((1433600 : Rat) / 12247399) [(3, 2), (13, 2)],
  term ((3730346120 : Rat) / 330679773) [(3, 2), (15, 2)],
  term ((1185873920 : Rat) / 330679773) [(3, 3), (11, 1)],
  term ((335695360 : Rat) / 110226591) [(3, 3), (11, 1), (12, 1)],
  term ((-4161463040 : Rat) / 330679773) [(3, 3), (11, 1), (14, 1)],
  term ((15735720 : Rat) / 12247399) [(3, 3), (12, 1), (13, 1)],
  term ((-302725280 : Rat) / 110226591) [(3, 3), (12, 1), (15, 1)],
  term ((18529280 : Rat) / 12247399) [(3, 3), (13, 1)],
  term ((-65022860 : Rat) / 12247399) [(3, 3), (13, 1), (14, 1)],
  term ((3752747920 : Rat) / 330679773) [(3, 3), (14, 1), (15, 1)],
  term ((-1069404160 : Rat) / 330679773) [(3, 3), (15, 1)],
  term ((-294 : Rat) / 67) [(5, 1), (9, 1), (12, 2)],
  term ((-294 : Rat) / 67) [(5, 1), (9, 1), (13, 2)],
  term ((1290205715456 : Rat) / 31414578435) [(5, 1), (10, 1), (11, 1), (12, 2)],
  term ((1290205715456 : Rat) / 31414578435) [(5, 1), (10, 1), (11, 1), (13, 2)],
  term ((20159464304 : Rat) / 1163502905) [(5, 1), (10, 1), (12, 2), (13, 1)],
  term ((-1163489082688 : Rat) / 31414578435) [(5, 1), (10, 1), (12, 2), (15, 1)],
  term ((-1163489082688 : Rat) / 31414578435) [(5, 1), (10, 1), (13, 2), (15, 1)],
  term ((20159464304 : Rat) / 1163502905) [(5, 1), (10, 1), (13, 3)],
  term ((-9224029696 : Rat) / 110226591) [(5, 1), (11, 1), (12, 1), (13, 2)],
  term ((2512096726048 : Rat) / 94243735305) [(5, 1), (11, 1), (12, 2)],
  term ((-19496960 : Rat) / 110226591) [(5, 1), (11, 1), (12, 2), (13, 1), (15, 1)],
  term ((-6149457664 : Rat) / 330679773) [(5, 1), (11, 1), (12, 2), (14, 1)],
  term ((185221120 : Rat) / 110226591) [(5, 1), (11, 1), (12, 2), (15, 2)],
  term ((-9224029696 : Rat) / 110226591) [(5, 1), (11, 1), (12, 3)],
  term ((2512096726048 : Rat) / 94243735305) [(5, 1), (11, 1), (13, 2)],
  term ((-6149457664 : Rat) / 330679773) [(5, 1), (11, 1), (13, 2), (14, 1)],
  term ((185221120 : Rat) / 110226591) [(5, 1), (11, 1), (13, 2), (15, 2)],
  term ((-19496960 : Rat) / 110226591) [(5, 1), (11, 1), (13, 3), (15, 1)],
  term ((8081193296 : Rat) / 110226591) [(5, 1), (12, 1), (13, 2), (15, 1)],
  term ((-432376392 : Rat) / 12247399) [(5, 1), (12, 1), (13, 3)],
  term ((78503022689 : Rat) / 6981017430) [(5, 1), (12, 2), (13, 1)],
  term ((-96085276 : Rat) / 12247399) [(5, 1), (12, 2), (13, 1), (14, 1)],
  term ((1806080 : Rat) / 2079747) [(5, 1), (12, 2), (13, 1), (15, 2)],
  term ((-913920 : Rat) / 12247399) [(5, 1), (12, 2), (13, 2), (15, 1)],
  term ((5545493072 : Rat) / 330679773) [(5, 1), (12, 2), (14, 1), (15, 1)],
  term ((-2403221986124 : Rat) / 94243735305) [(5, 1), (12, 2), (15, 1)],
  term ((-167029760 : Rat) / 110226591) [(5, 1), (12, 2), (15, 3)],
  term ((-432376392 : Rat) / 12247399) [(5, 1), (12, 3), (13, 1)],
  term ((8081193296 : Rat) / 110226591) [(5, 1), (12, 3), (15, 1)],
  term ((5545493072 : Rat) / 330679773) [(5, 1), (13, 2), (14, 1), (15, 1)],
  term ((-2403221986124 : Rat) / 94243735305) [(5, 1), (13, 2), (15, 1)],
  term ((-167029760 : Rat) / 110226591) [(5, 1), (13, 2), (15, 3)],
  term ((78503022689 : Rat) / 6981017430) [(5, 1), (13, 3)],
  term ((-96085276 : Rat) / 12247399) [(5, 1), (13, 3), (14, 1)],
  term ((1806080 : Rat) / 2079747) [(5, 1), (13, 3), (15, 2)],
  term ((-913920 : Rat) / 12247399) [(5, 1), (13, 4), (15, 1)],
  term ((218121304576 : Rat) / 10471526145) [(7, 1), (10, 1), (11, 1), (12, 2)],
  term ((218121304576 : Rat) / 10471526145) [(7, 1), (10, 1), (11, 1), (13, 2)],
  term ((10224436152 : Rat) / 1163502905) [(7, 1), (10, 1), (12, 2), (13, 1)],
  term ((-196698676448 : Rat) / 10471526145) [(7, 1), (10, 1), (12, 2), (15, 1)],
  term ((-196698676448 : Rat) / 10471526145) [(7, 1), (10, 1), (13, 2), (15, 1)],
  term ((10224436152 : Rat) / 1163502905) [(7, 1), (10, 1), (13, 3)],
  term ((12911247104 : Rat) / 330679773) [(7, 1), (11, 1), (12, 1), (13, 2)],
  term ((-490847168 : Rat) / 110226591) [(7, 1), (11, 1), (12, 2)],
  term ((-4569600 : Rat) / 12247399) [(7, 1), (11, 1), (12, 2), (13, 1), (15, 1)],
  term ((-2680294400 : Rat) / 330679773) [(7, 1), (11, 1), (12, 2), (14, 1)],
  term ((87910400 : Rat) / 110226591) [(7, 1), (11, 1), (12, 2), (15, 2)],
  term ((12911247104 : Rat) / 330679773) [(7, 1), (11, 1), (12, 3)],
  term ((-490847168 : Rat) / 110226591) [(7, 1), (11, 1), (13, 2)],
  term ((-2680294400 : Rat) / 330679773) [(7, 1), (11, 1), (13, 2), (14, 1)],
  term ((87910400 : Rat) / 110226591) [(7, 1), (11, 1), (13, 2), (15, 2)],
  term ((-4569600 : Rat) / 12247399) [(7, 1), (11, 1), (13, 3), (15, 1)],
  term ((-97484800 : Rat) / 110226591) [(7, 1), (11, 2), (12, 2), (15, 1)],
  term ((-97484800 : Rat) / 110226591) [(7, 1), (11, 2), (13, 2), (15, 1)],
  term ((-10932463456 : Rat) / 330679773) [(7, 1), (12, 1), (13, 2), (15, 1)],
  term ((201738236 : Rat) / 12247399) [(7, 1), (12, 1), (13, 3)],
  term ((-23008461 : Rat) / 12247399) [(7, 1), (12, 2), (13, 1)],
  term ((-41879600 : Rat) / 12247399) [(7, 1), (12, 2), (13, 1), (14, 1)],
  term ((2417051200 : Rat) / 330679773) [(7, 1), (12, 2), (14, 1), (15, 1)],
  term ((442638964 : Rat) / 110226591) [(7, 1), (12, 2), (15, 1)],
  term ((201738236 : Rat) / 12247399) [(7, 1), (12, 3), (13, 1)],
  term ((-10932463456 : Rat) / 330679773) [(7, 1), (12, 3), (15, 1)],
  term ((2417051200 : Rat) / 330679773) [(7, 1), (13, 2), (14, 1), (15, 1)],
  term ((442638964 : Rat) / 110226591) [(7, 1), (13, 2), (15, 1)],
  term ((-23008461 : Rat) / 12247399) [(7, 1), (13, 3)],
  term ((-41879600 : Rat) / 12247399) [(7, 1), (13, 3), (14, 1)],
  term ((-754232161984 : Rat) / 18848747061) [(9, 1), (10, 1), (11, 1), (12, 2)],
  term ((-754232161984 : Rat) / 18848747061) [(9, 1), (10, 1), (11, 1), (13, 2)],
  term ((-11784877531 : Rat) / 698101743) [(9, 1), (10, 1), (12, 2), (13, 1)],
  term ((680155788932 : Rat) / 18848747061) [(9, 1), (10, 1), (12, 2), (15, 1)],
  term ((680155788932 : Rat) / 18848747061) [(9, 1), (10, 1), (13, 2), (15, 1)],
  term ((-11784877531 : Rat) / 698101743) [(9, 1), (10, 1), (13, 3)],
  term ((5046861568 : Rat) / 110226591) [(9, 1), (11, 1), (12, 1), (13, 2)],
  term ((-1455109002658 : Rat) / 94243735305) [(9, 1), (11, 1), (12, 2)],
  term ((19496960 : Rat) / 110226591) [(9, 1), (11, 1), (12, 2), (13, 1), (15, 1)],
  term ((-10390094848 : Rat) / 330679773) [(9, 1), (11, 1), (12, 2), (14, 1)],
  term ((-9748480 : Rat) / 36742197) [(9, 1), (11, 1), (12, 2), (15, 2)],
  term ((5046861568 : Rat) / 110226591) [(9, 1), (11, 1), (12, 3)],
  term ((-1455109002658 : Rat) / 94243735305) [(9, 1), (11, 1), (13, 2)],
  term ((-10390094848 : Rat) / 330679773) [(9, 1), (11, 1), (13, 2), (14, 1)],
  term ((-9748480 : Rat) / 36742197) [(9, 1), (11, 1), (13, 2), (15, 2)],
  term ((19496960 : Rat) / 110226591) [(9, 1), (11, 1), (13, 3), (15, 1)],
  term ((-4551187664 : Rat) / 110226591) [(9, 1), (12, 1), (13, 2), (15, 1)],
  term ((236571636 : Rat) / 12247399) [(9, 1), (12, 1), (13, 3)],
  term ((-21999136439 : Rat) / 6981017430) [(9, 1), (12, 2), (13, 1)],
  term ((-162345232 : Rat) / 12247399) [(9, 1), (12, 2), (13, 1), (14, 1)],
  term ((-29920000 : Rat) / 110226591) [(9, 1), (12, 2), (13, 1), (15, 2)],
  term ((913920 : Rat) / 12247399) [(9, 1), (12, 2), (13, 2), (15, 1)],
  term ((9369639104 : Rat) / 330679773) [(9, 1), (12, 2), (14, 1), (15, 1)],
  term ((772681268624 : Rat) / 94243735305) [(9, 1), (12, 2), (15, 1)],
  term ((8791040 : Rat) / 36742197) [(9, 1), (12, 2), (15, 3)],
  term ((236571636 : Rat) / 12247399) [(9, 1), (12, 3), (13, 1)],
  term ((-4551187664 : Rat) / 110226591) [(9, 1), (12, 3), (15, 1)],
  term ((9369639104 : Rat) / 330679773) [(9, 1), (13, 2), (14, 1), (15, 1)],
  term ((772681268624 : Rat) / 94243735305) [(9, 1), (13, 2), (15, 1)],
  term ((8791040 : Rat) / 36742197) [(9, 1), (13, 2), (15, 3)],
  term ((-21999136439 : Rat) / 6981017430) [(9, 1), (13, 3)],
  term ((-162345232 : Rat) / 12247399) [(9, 1), (13, 3), (14, 1)],
  term ((-29920000 : Rat) / 110226591) [(9, 1), (13, 3), (15, 2)],
  term ((913920 : Rat) / 12247399) [(9, 1), (13, 4), (15, 1)],
  term ((294 : Rat) / 67) [(9, 2), (12, 2)],
  term ((294 : Rat) / 67) [(9, 2), (13, 2)],
  term ((56502158398 : Rat) / 3490508715) [(10, 1), (11, 1), (12, 2), (13, 1)],
  term ((-3260981713256 : Rat) / 94243735305) [(10, 1), (11, 1), (12, 2), (15, 1)],
  term ((-3260981713256 : Rat) / 94243735305) [(10, 1), (11, 1), (13, 2), (15, 1)],
  term ((56502158398 : Rat) / 3490508715) [(10, 1), (11, 1), (13, 3)],
  term ((3616138137472 : Rat) / 94243735305) [(10, 1), (11, 2), (12, 2)],
  term ((3616138137472 : Rat) / 94243735305) [(10, 1), (11, 2), (13, 2)],
  term ((-120 : Rat) / 67) [(10, 1), (12, 2)],
  term ((-120 : Rat) / 67) [(10, 1), (13, 2)],
  term ((-35164160 : Rat) / 110226591) [(11, 1), (12, 1), (13, 2), (15, 1)],
  term ((1827840 : Rat) / 12247399) [(11, 1), (12, 1), (13, 3)],
  term ((-423542858669 : Rat) / 62829156870) [(11, 1), (12, 2), (13, 1)],
  term ((-3655680 : Rat) / 12247399) [(11, 1), (12, 2), (13, 1), (14, 1)],
  term ((-2981120 : Rat) / 110226591) [(11, 1), (12, 2), (13, 1), (15, 2)],
  term ((-913920 : Rat) / 12247399) [(11, 1), (12, 2), (13, 2), (15, 1)],
  term ((70328320 : Rat) / 110226591) [(11, 1), (12, 2), (14, 1), (15, 1)],
  term ((2343219447256 : Rat) / 94243735305) [(11, 1), (12, 2), (15, 1)],
  term ((43955200 : Rat) / 110226591) [(11, 1), (12, 2), (15, 3)],
  term ((1827840 : Rat) / 12247399) [(11, 1), (12, 3), (13, 1)],
  term ((-35164160 : Rat) / 110226591) [(11, 1), (12, 3), (15, 1)],
  term ((70328320 : Rat) / 110226591) [(11, 1), (13, 2), (14, 1), (15, 1)],
  term ((2343219447256 : Rat) / 94243735305) [(11, 1), (13, 2), (15, 1)],
  term ((43955200 : Rat) / 110226591) [(11, 1), (13, 2), (15, 3)],
  term ((-423542858669 : Rat) / 62829156870) [(11, 1), (13, 3)],
  term ((-3655680 : Rat) / 12247399) [(11, 1), (13, 3), (14, 1)],
  term ((-2981120 : Rat) / 110226591) [(11, 1), (13, 3), (15, 2)],
  term ((-913920 : Rat) / 12247399) [(11, 1), (13, 4), (15, 1)],
  term ((38993920 : Rat) / 110226591) [(11, 2), (12, 1), (13, 2)],
  term ((-1275152921912 : Rat) / 94243735305) [(11, 2), (12, 2)],
  term ((62755840 : Rat) / 110226591) [(11, 2), (12, 2), (13, 1), (15, 1)],
  term ((-77987840 : Rat) / 110226591) [(11, 2), (12, 2), (14, 1)],
  term ((-74854400 : Rat) / 36742197) [(11, 2), (12, 2), (15, 2)],
  term ((38993920 : Rat) / 110226591) [(11, 2), (12, 3)],
  term ((-1275152921912 : Rat) / 94243735305) [(11, 2), (13, 2)],
  term ((-77987840 : Rat) / 110226591) [(11, 2), (13, 2), (14, 1)],
  term ((-74854400 : Rat) / 36742197) [(11, 2), (13, 2), (15, 2)],
  term ((62755840 : Rat) / 110226591) [(11, 2), (13, 3), (15, 1)],
  term ((194969600 : Rat) / 110226591) [(11, 3), (12, 2), (15, 1)],
  term ((194969600 : Rat) / 110226591) [(11, 3), (13, 2), (15, 1)],
  term ((1827876370 : Rat) / 330679773) [(12, 2), (13, 1), (15, 1)],
  term ((-1433600 : Rat) / 12247399) [(12, 2), (13, 2)],
  term ((-3730346120 : Rat) / 330679773) [(12, 2), (15, 2)],
  term ((-3730346120 : Rat) / 330679773) [(13, 2), (15, 2)],
  term ((1827876370 : Rat) / 330679773) [(13, 3), (15, 1)],
  term ((-1433600 : Rat) / 12247399) [(13, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 9, terms 0 through 86. -/
theorem rs_R009_ueqv_R009NNNYN_block_09_0000_0086_valid :
    checkProductSumEq rs_R009_ueqv_R009NNNYN_partials_09_0000_0086
      rs_R009_ueqv_R009NNNYN_block_09_0000_0086 = true := by
  native_decide

end R009UeqvR009NNNYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
