/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R007:u=v:R007NY, term block 29:0-99

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R007UeqvR007NYTermShards

/-- Generator polynomial 29 for relaxed split surplus certificate `R007:u=v:R007NY`. -/
def rs_R007_ueqv_R007NY_generator_29_0000_0099 : Poly :=
[
  term (1 : Rat) [],
  term (2 : Rat) [(6, 1), (14, 1)],
  term (-1 : Rat) [(6, 2)],
  term (2 : Rat) [(7, 1), (15, 1)],
  term (-1 : Rat) [(7, 2)],
  term (-2 : Rat) [(14, 1)]
]

/-- Coefficient term 0 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0000 : Poly :=
[
  term ((-1913687507302214207950 : Rat) / 14996717731422923489) [(0, 1), (1, 1), (4, 1), (11, 1), (16, 1)]
]

/-- Partial product 0 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0000 : Poly :=
[
  term ((-3827375014604428415900 : Rat) / 14996717731422923489) [(0, 1), (1, 1), (4, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((1913687507302214207950 : Rat) / 14996717731422923489) [(0, 1), (1, 1), (4, 1), (6, 2), (11, 1), (16, 1)],
  term ((-3827375014604428415900 : Rat) / 14996717731422923489) [(0, 1), (1, 1), (4, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((1913687507302214207950 : Rat) / 14996717731422923489) [(0, 1), (1, 1), (4, 1), (7, 2), (11, 1), (16, 1)],
  term ((3827375014604428415900 : Rat) / 14996717731422923489) [(0, 1), (1, 1), (4, 1), (11, 1), (14, 1), (16, 1)],
  term ((-1913687507302214207950 : Rat) / 14996717731422923489) [(0, 1), (1, 1), (4, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0000_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0000
        rs_R007_ueqv_R007NY_generator_29_0000_0099 =
      rs_R007_ueqv_R007NY_partial_29_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0001 : Poly :=
[
  term ((1148212504381328524770 : Rat) / 14996717731422923489) [(0, 1), (1, 1), (4, 1), (15, 1), (16, 1)]
]

/-- Partial product 1 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0001 : Poly :=
[
  term ((2296425008762657049540 : Rat) / 14996717731422923489) [(0, 1), (1, 1), (4, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1148212504381328524770 : Rat) / 14996717731422923489) [(0, 1), (1, 1), (4, 1), (6, 2), (15, 1), (16, 1)],
  term ((2296425008762657049540 : Rat) / 14996717731422923489) [(0, 1), (1, 1), (4, 1), (7, 1), (15, 2), (16, 1)],
  term ((-1148212504381328524770 : Rat) / 14996717731422923489) [(0, 1), (1, 1), (4, 1), (7, 2), (15, 1), (16, 1)],
  term ((-2296425008762657049540 : Rat) / 14996717731422923489) [(0, 1), (1, 1), (4, 1), (14, 1), (15, 1), (16, 1)],
  term ((1148212504381328524770 : Rat) / 14996717731422923489) [(0, 1), (1, 1), (4, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0001_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0001
        rs_R007_ueqv_R007NY_generator_29_0000_0099 =
      rs_R007_ueqv_R007NY_partial_29_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0002 : Poly :=
[
  term (-4 : Rat) [(0, 1), (1, 1), (11, 1), (16, 1)]
]

/-- Partial product 2 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0002 : Poly :=
[
  term (-8 : Rat) [(0, 1), (1, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term (4 : Rat) [(0, 1), (1, 1), (6, 2), (11, 1), (16, 1)],
  term (-8 : Rat) [(0, 1), (1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(0, 1), (1, 1), (7, 2), (11, 1), (16, 1)],
  term (8 : Rat) [(0, 1), (1, 1), (11, 1), (14, 1), (16, 1)],
  term (-4 : Rat) [(0, 1), (1, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0002_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0002
        rs_R007_ueqv_R007NY_generator_29_0000_0099 =
      rs_R007_ueqv_R007NY_partial_29_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0003 : Poly :=
[
  term (4 : Rat) [(0, 1), (1, 1), (15, 1), (16, 1)]
]

/-- Partial product 3 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0003 : Poly :=
[
  term (8 : Rat) [(0, 1), (1, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(0, 1), (1, 1), (6, 2), (15, 1), (16, 1)],
  term (8 : Rat) [(0, 1), (1, 1), (7, 1), (15, 2), (16, 1)],
  term (-4 : Rat) [(0, 1), (1, 1), (7, 2), (15, 1), (16, 1)],
  term (-8 : Rat) [(0, 1), (1, 1), (14, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(0, 1), (1, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0003_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0003
        rs_R007_ueqv_R007NY_generator_29_0000_0099 =
      rs_R007_ueqv_R007NY_partial_29_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0004 : Poly :=
[
  term ((211649342433421685123740 : Rat) / 944793217079644179807) [(0, 1), (3, 1), (4, 1), (11, 1), (16, 1)]
]

/-- Partial product 4 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0004 : Poly :=
[
  term ((423298684866843370247480 : Rat) / 944793217079644179807) [(0, 1), (3, 1), (4, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((-211649342433421685123740 : Rat) / 944793217079644179807) [(0, 1), (3, 1), (4, 1), (6, 2), (11, 1), (16, 1)],
  term ((423298684866843370247480 : Rat) / 944793217079644179807) [(0, 1), (3, 1), (4, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-211649342433421685123740 : Rat) / 944793217079644179807) [(0, 1), (3, 1), (4, 1), (7, 2), (11, 1), (16, 1)],
  term ((-423298684866843370247480 : Rat) / 944793217079644179807) [(0, 1), (3, 1), (4, 1), (11, 1), (14, 1), (16, 1)],
  term ((211649342433421685123740 : Rat) / 944793217079644179807) [(0, 1), (3, 1), (4, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0004_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0004
        rs_R007_ueqv_R007NY_generator_29_0000_0099 =
      rs_R007_ueqv_R007NY_partial_29_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0005 : Poly :=
[
  term ((-42329868486684337024748 : Rat) / 314931072359881393269) [(0, 1), (3, 1), (4, 1), (15, 1), (16, 1)]
]

/-- Partial product 5 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0005 : Poly :=
[
  term ((-84659736973368674049496 : Rat) / 314931072359881393269) [(0, 1), (3, 1), (4, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((42329868486684337024748 : Rat) / 314931072359881393269) [(0, 1), (3, 1), (4, 1), (6, 2), (15, 1), (16, 1)],
  term ((-84659736973368674049496 : Rat) / 314931072359881393269) [(0, 1), (3, 1), (4, 1), (7, 1), (15, 2), (16, 1)],
  term ((42329868486684337024748 : Rat) / 314931072359881393269) [(0, 1), (3, 1), (4, 1), (7, 2), (15, 1), (16, 1)],
  term ((84659736973368674049496 : Rat) / 314931072359881393269) [(0, 1), (3, 1), (4, 1), (14, 1), (15, 1), (16, 1)],
  term ((-42329868486684337024748 : Rat) / 314931072359881393269) [(0, 1), (3, 1), (4, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0005_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0005
        rs_R007_ueqv_R007NY_generator_29_0000_0099 =
      rs_R007_ueqv_R007NY_partial_29_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0006 : Poly :=
[
  term ((-412134446239876979346095 : Rat) / 1889586434159288359614) [(0, 1), (3, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 6 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0006 : Poly :=
[
  term ((-412134446239876979346095 : Rat) / 944793217079644179807) [(0, 1), (3, 1), (6, 1), (11, 1), (14, 2), (16, 1)],
  term ((412134446239876979346095 : Rat) / 1889586434159288359614) [(0, 1), (3, 1), (6, 2), (11, 1), (14, 1), (16, 1)],
  term ((-412134446239876979346095 : Rat) / 944793217079644179807) [(0, 1), (3, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((412134446239876979346095 : Rat) / 1889586434159288359614) [(0, 1), (3, 1), (7, 2), (11, 1), (14, 1), (16, 1)],
  term ((-412134446239876979346095 : Rat) / 1889586434159288359614) [(0, 1), (3, 1), (11, 1), (14, 1), (16, 1)],
  term ((412134446239876979346095 : Rat) / 944793217079644179807) [(0, 1), (3, 1), (11, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0006_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0006
        rs_R007_ueqv_R007NY_generator_29_0000_0099 =
      rs_R007_ueqv_R007NY_partial_29_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0007 : Poly :=
[
  term ((-390454837902337404252745 : Rat) / 944793217079644179807) [(0, 1), (3, 1), (11, 1), (16, 1)]
]

/-- Partial product 7 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0007 : Poly :=
[
  term ((-780909675804674808505490 : Rat) / 944793217079644179807) [(0, 1), (3, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((390454837902337404252745 : Rat) / 944793217079644179807) [(0, 1), (3, 1), (6, 2), (11, 1), (16, 1)],
  term ((-780909675804674808505490 : Rat) / 944793217079644179807) [(0, 1), (3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((390454837902337404252745 : Rat) / 944793217079644179807) [(0, 1), (3, 1), (7, 2), (11, 1), (16, 1)],
  term ((780909675804674808505490 : Rat) / 944793217079644179807) [(0, 1), (3, 1), (11, 1), (14, 1), (16, 1)],
  term ((-390454837902337404252745 : Rat) / 944793217079644179807) [(0, 1), (3, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0007_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0007
        rs_R007_ueqv_R007NY_generator_29_0000_0099 =
      rs_R007_ueqv_R007NY_partial_29_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0008 : Poly :=
[
  term ((82426889247975395869219 : Rat) / 629862144719762786538) [(0, 1), (3, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 8 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0008 : Poly :=
[
  term ((82426889247975395869219 : Rat) / 314931072359881393269) [(0, 1), (3, 1), (6, 1), (14, 2), (15, 1), (16, 1)],
  term ((-82426889247975395869219 : Rat) / 629862144719762786538) [(0, 1), (3, 1), (6, 2), (14, 1), (15, 1), (16, 1)],
  term ((82426889247975395869219 : Rat) / 314931072359881393269) [(0, 1), (3, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((-82426889247975395869219 : Rat) / 629862144719762786538) [(0, 1), (3, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((82426889247975395869219 : Rat) / 629862144719762786538) [(0, 1), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-82426889247975395869219 : Rat) / 314931072359881393269) [(0, 1), (3, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0008_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0008
        rs_R007_ueqv_R007NY_generator_29_0000_0099 =
      rs_R007_ueqv_R007NY_partial_29_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0009 : Poly :=
[
  term ((26310261257809054855311 : Rat) / 104977024119960464423) [(0, 1), (3, 1), (15, 1), (16, 1)]
]

/-- Partial product 9 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0009 : Poly :=
[
  term ((52620522515618109710622 : Rat) / 104977024119960464423) [(0, 1), (3, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-26310261257809054855311 : Rat) / 104977024119960464423) [(0, 1), (3, 1), (6, 2), (15, 1), (16, 1)],
  term ((52620522515618109710622 : Rat) / 104977024119960464423) [(0, 1), (3, 1), (7, 1), (15, 2), (16, 1)],
  term ((-26310261257809054855311 : Rat) / 104977024119960464423) [(0, 1), (3, 1), (7, 2), (15, 1), (16, 1)],
  term ((-52620522515618109710622 : Rat) / 104977024119960464423) [(0, 1), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((26310261257809054855311 : Rat) / 104977024119960464423) [(0, 1), (3, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0009_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0009
        rs_R007_ueqv_R007NY_generator_29_0000_0099 =
      rs_R007_ueqv_R007NY_partial_29_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0010 : Poly :=
[
  term ((166105827696730590112295 : Rat) / 944793217079644179807) [(0, 1), (4, 1), (7, 1), (11, 1), (16, 1)]
]

/-- Partial product 10 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0010 : Poly :=
[
  term ((332211655393461180224590 : Rat) / 944793217079644179807) [(0, 1), (4, 1), (6, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-166105827696730590112295 : Rat) / 944793217079644179807) [(0, 1), (4, 1), (6, 2), (7, 1), (11, 1), (16, 1)],
  term ((-332211655393461180224590 : Rat) / 944793217079644179807) [(0, 1), (4, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((166105827696730590112295 : Rat) / 944793217079644179807) [(0, 1), (4, 1), (7, 1), (11, 1), (16, 1)],
  term ((332211655393461180224590 : Rat) / 944793217079644179807) [(0, 1), (4, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-166105827696730590112295 : Rat) / 944793217079644179807) [(0, 1), (4, 1), (7, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0010_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0010
        rs_R007_ueqv_R007NY_generator_29_0000_0099 =
      rs_R007_ueqv_R007NY_partial_29_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0011 : Poly :=
[
  term ((-33221165539346118022459 : Rat) / 314931072359881393269) [(0, 1), (4, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 11 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0011 : Poly :=
[
  term ((-66442331078692236044918 : Rat) / 314931072359881393269) [(0, 1), (4, 1), (6, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((33221165539346118022459 : Rat) / 314931072359881393269) [(0, 1), (4, 1), (6, 2), (7, 1), (15, 1), (16, 1)],
  term ((66442331078692236044918 : Rat) / 314931072359881393269) [(0, 1), (4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-33221165539346118022459 : Rat) / 314931072359881393269) [(0, 1), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((-66442331078692236044918 : Rat) / 314931072359881393269) [(0, 1), (4, 1), (7, 2), (15, 2), (16, 1)],
  term ((33221165539346118022459 : Rat) / 314931072359881393269) [(0, 1), (4, 1), (7, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0011_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0011
        rs_R007_ueqv_R007NY_generator_29_0000_0099 =
      rs_R007_ueqv_R007NY_partial_29_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0012 : Poly :=
[
  term ((84659736973368674049496 : Rat) / 314931072359881393269) [(0, 1), (4, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 12 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0012 : Poly :=
[
  term ((169319473946737348098992 : Rat) / 314931072359881393269) [(0, 1), (4, 1), (6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-84659736973368674049496 : Rat) / 314931072359881393269) [(0, 1), (4, 1), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((169319473946737348098992 : Rat) / 314931072359881393269) [(0, 1), (4, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-84659736973368674049496 : Rat) / 314931072359881393269) [(0, 1), (4, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-169319473946737348098992 : Rat) / 314931072359881393269) [(0, 1), (4, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((84659736973368674049496 : Rat) / 314931072359881393269) [(0, 1), (4, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0012_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0012
        rs_R007_ueqv_R007NY_generator_29_0000_0099 =
      rs_R007_ueqv_R007NY_partial_29_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0013 : Poly :=
[
  term ((-423298684866843370247480 : Rat) / 944793217079644179807) [(0, 1), (4, 1), (11, 2), (16, 1)]
]

/-- Partial product 13 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0013 : Poly :=
[
  term ((-846597369733686740494960 : Rat) / 944793217079644179807) [(0, 1), (4, 1), (6, 1), (11, 2), (14, 1), (16, 1)],
  term ((423298684866843370247480 : Rat) / 944793217079644179807) [(0, 1), (4, 1), (6, 2), (11, 2), (16, 1)],
  term ((-846597369733686740494960 : Rat) / 944793217079644179807) [(0, 1), (4, 1), (7, 1), (11, 2), (15, 1), (16, 1)],
  term ((423298684866843370247480 : Rat) / 944793217079644179807) [(0, 1), (4, 1), (7, 2), (11, 2), (16, 1)],
  term ((846597369733686740494960 : Rat) / 944793217079644179807) [(0, 1), (4, 1), (11, 2), (14, 1), (16, 1)],
  term ((-423298684866843370247480 : Rat) / 944793217079644179807) [(0, 1), (4, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0013_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0013
        rs_R007_ueqv_R007NY_generator_29_0000_0099 =
      rs_R007_ueqv_R007NY_partial_29_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0014 : Poly :=
[
  term ((-9829284761768625139900 : Rat) / 944793217079644179807) [(0, 1), (5, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 14 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0014 : Poly :=
[
  term ((-19658569523537250279800 : Rat) / 944793217079644179807) [(0, 1), (5, 1), (6, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((9829284761768625139900 : Rat) / 944793217079644179807) [(0, 1), (5, 1), (6, 2), (11, 1), (12, 1), (16, 1)],
  term ((-19658569523537250279800 : Rat) / 944793217079644179807) [(0, 1), (5, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((9829284761768625139900 : Rat) / 944793217079644179807) [(0, 1), (5, 1), (7, 2), (11, 1), (12, 1), (16, 1)],
  term ((19658569523537250279800 : Rat) / 944793217079644179807) [(0, 1), (5, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-9829284761768625139900 : Rat) / 944793217079644179807) [(0, 1), (5, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0014_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0014
        rs_R007_ueqv_R007NY_generator_29_0000_0099 =
      rs_R007_ueqv_R007NY_partial_29_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0015 : Poly :=
[
  term ((-83277058475894061268135 : Rat) / 1889586434159288359614) [(0, 1), (5, 1), (11, 1), (16, 1)]
]

/-- Partial product 15 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0015 : Poly :=
[
  term ((-83277058475894061268135 : Rat) / 944793217079644179807) [(0, 1), (5, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((83277058475894061268135 : Rat) / 1889586434159288359614) [(0, 1), (5, 1), (6, 2), (11, 1), (16, 1)],
  term ((-83277058475894061268135 : Rat) / 944793217079644179807) [(0, 1), (5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((83277058475894061268135 : Rat) / 1889586434159288359614) [(0, 1), (5, 1), (7, 2), (11, 1), (16, 1)],
  term ((83277058475894061268135 : Rat) / 944793217079644179807) [(0, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-83277058475894061268135 : Rat) / 1889586434159288359614) [(0, 1), (5, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0015_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0015
        rs_R007_ueqv_R007NY_generator_29_0000_0099 =
      rs_R007_ueqv_R007NY_partial_29_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0016 : Poly :=
[
  term ((1965856952353725027980 : Rat) / 314931072359881393269) [(0, 1), (5, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 16 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0016 : Poly :=
[
  term ((3931713904707450055960 : Rat) / 314931072359881393269) [(0, 1), (5, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1965856952353725027980 : Rat) / 314931072359881393269) [(0, 1), (5, 1), (6, 2), (12, 1), (15, 1), (16, 1)],
  term ((3931713904707450055960 : Rat) / 314931072359881393269) [(0, 1), (5, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1965856952353725027980 : Rat) / 314931072359881393269) [(0, 1), (5, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((-3931713904707450055960 : Rat) / 314931072359881393269) [(0, 1), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1965856952353725027980 : Rat) / 314931072359881393269) [(0, 1), (5, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0016_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0016
        rs_R007_ueqv_R007NY_generator_29_0000_0099 =
      rs_R007_ueqv_R007NY_partial_29_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0017 : Poly :=
[
  term ((16655411695178812253627 : Rat) / 629862144719762786538) [(0, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 17 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0017 : Poly :=
[
  term ((16655411695178812253627 : Rat) / 314931072359881393269) [(0, 1), (5, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-16655411695178812253627 : Rat) / 629862144719762786538) [(0, 1), (5, 1), (6, 2), (15, 1), (16, 1)],
  term ((16655411695178812253627 : Rat) / 314931072359881393269) [(0, 1), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((-16655411695178812253627 : Rat) / 629862144719762786538) [(0, 1), (5, 1), (7, 2), (15, 1), (16, 1)],
  term ((-16655411695178812253627 : Rat) / 314931072359881393269) [(0, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((16655411695178812253627 : Rat) / 629862144719762786538) [(0, 1), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0017_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0017
        rs_R007_ueqv_R007NY_generator_29_0000_0099 =
      rs_R007_ueqv_R007NY_partial_29_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0018 : Poly :=
[
  term ((-1421913669443616788155 : Rat) / 3004111977995688966) [(0, 1), (7, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 18 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0018 : Poly :=
[
  term ((-1421913669443616788155 : Rat) / 1502055988997844483) [(0, 1), (6, 1), (7, 1), (11, 1), (14, 2), (16, 1)],
  term ((1421913669443616788155 : Rat) / 3004111977995688966) [(0, 1), (6, 2), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-1421913669443616788155 : Rat) / 3004111977995688966) [(0, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((1421913669443616788155 : Rat) / 1502055988997844483) [(0, 1), (7, 1), (11, 1), (14, 2), (16, 1)],
  term ((-1421913669443616788155 : Rat) / 1502055988997844483) [(0, 1), (7, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1421913669443616788155 : Rat) / 3004111977995688966) [(0, 1), (7, 3), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0018_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0018
        rs_R007_ueqv_R007NY_generator_29_0000_0099 =
      rs_R007_ueqv_R007NY_partial_29_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0019 : Poly :=
[
  term ((-42610819891296054514329 : Rat) / 29993435462845846978) [(0, 1), (7, 1), (11, 1), (16, 1)]
]

/-- Partial product 19 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0019 : Poly :=
[
  term ((-42610819891296054514329 : Rat) / 14996717731422923489) [(0, 1), (6, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((42610819891296054514329 : Rat) / 29993435462845846978) [(0, 1), (6, 2), (7, 1), (11, 1), (16, 1)],
  term ((42610819891296054514329 : Rat) / 14996717731422923489) [(0, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-42610819891296054514329 : Rat) / 29993435462845846978) [(0, 1), (7, 1), (11, 1), (16, 1)],
  term ((-42610819891296054514329 : Rat) / 14996717731422923489) [(0, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((42610819891296054514329 : Rat) / 29993435462845846978) [(0, 1), (7, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0019_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0019
        rs_R007_ueqv_R007NY_generator_29_0000_0099 =
      rs_R007_ueqv_R007NY_partial_29_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0020 : Poly :=
[
  term ((284382733888723357631 : Rat) / 1001370659331896322) [(0, 1), (7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 20 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0020 : Poly :=
[
  term ((284382733888723357631 : Rat) / 500685329665948161) [(0, 1), (6, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-284382733888723357631 : Rat) / 1001370659331896322) [(0, 1), (6, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((284382733888723357631 : Rat) / 1001370659331896322) [(0, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-284382733888723357631 : Rat) / 500685329665948161) [(0, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((284382733888723357631 : Rat) / 500685329665948161) [(0, 1), (7, 2), (14, 1), (15, 2), (16, 1)],
  term ((-284382733888723357631 : Rat) / 1001370659331896322) [(0, 1), (7, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0020_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0020
        rs_R007_ueqv_R007NY_generator_29_0000_0099 =
      rs_R007_ueqv_R007NY_partial_29_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0021 : Poly :=
[
  term ((25542497186407356031015 : Rat) / 29993435462845846978) [(0, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 21 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0021 : Poly :=
[
  term ((25542497186407356031015 : Rat) / 14996717731422923489) [(0, 1), (6, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-25542497186407356031015 : Rat) / 29993435462845846978) [(0, 1), (6, 2), (7, 1), (15, 1), (16, 1)],
  term ((-25542497186407356031015 : Rat) / 14996717731422923489) [(0, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((25542497186407356031015 : Rat) / 29993435462845846978) [(0, 1), (7, 1), (15, 1), (16, 1)],
  term ((25542497186407356031015 : Rat) / 14996717731422923489) [(0, 1), (7, 2), (15, 2), (16, 1)],
  term ((-25542497186407356031015 : Rat) / 29993435462845846978) [(0, 1), (7, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0021_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0021
        rs_R007_ueqv_R007NY_generator_29_0000_0099 =
      rs_R007_ueqv_R007NY_partial_29_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0022 : Poly :=
[
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(0, 1), (11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 22 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0022 : Poly :=
[
  term ((-7100176550521443036800 : Rat) / 44990153194268770467) [(0, 1), (6, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(0, 1), (6, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 44990153194268770467) [(0, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(0, 1), (7, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((7100176550521443036800 : Rat) / 44990153194268770467) [(0, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(0, 1), (11, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0022_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0022
        rs_R007_ueqv_R007NY_generator_29_0000_0099 =
      rs_R007_ueqv_R007NY_partial_29_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0023 : Poly :=
[
  term ((1775044137630360759200 : Rat) / 134970459582806311401) [(0, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 23 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0023 : Poly :=
[
  term ((3550088275260721518400 : Rat) / 134970459582806311401) [(0, 1), (6, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1775044137630360759200 : Rat) / 134970459582806311401) [(0, 1), (6, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 134970459582806311401) [(0, 1), (7, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1775044137630360759200 : Rat) / 134970459582806311401) [(0, 1), (7, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 134970459582806311401) [(0, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1775044137630360759200 : Rat) / 134970459582806311401) [(0, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0023_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0023
        rs_R007_ueqv_R007NY_generator_29_0000_0099 =
      rs_R007_ueqv_R007NY_partial_29_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0024 : Poly :=
[
  term ((-12500512687333163243665 : Rat) / 104977024119960464423) [(0, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 24 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0024 : Poly :=
[
  term ((-25001025374666326487330 : Rat) / 104977024119960464423) [(0, 1), (6, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((12500512687333163243665 : Rat) / 104977024119960464423) [(0, 1), (6, 2), (11, 1), (13, 1), (16, 1)],
  term ((-25001025374666326487330 : Rat) / 104977024119960464423) [(0, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((12500512687333163243665 : Rat) / 104977024119960464423) [(0, 1), (7, 2), (11, 1), (13, 1), (16, 1)],
  term ((25001025374666326487330 : Rat) / 104977024119960464423) [(0, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-12500512687333163243665 : Rat) / 104977024119960464423) [(0, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0024_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0024
        rs_R007_ueqv_R007NY_generator_29_0000_0099 =
      rs_R007_ueqv_R007NY_partial_29_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0025 : Poly :=
[
  term ((-146726789493329793256339 : Rat) / 209954048239920928846) [(0, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 25 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0025 : Poly :=
[
  term ((-146726789493329793256339 : Rat) / 104977024119960464423) [(0, 1), (6, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((146726789493329793256339 : Rat) / 209954048239920928846) [(0, 1), (6, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-146726789493329793256339 : Rat) / 104977024119960464423) [(0, 1), (7, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((146726789493329793256339 : Rat) / 209954048239920928846) [(0, 1), (7, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-146726789493329793256339 : Rat) / 209954048239920928846) [(0, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((146726789493329793256339 : Rat) / 104977024119960464423) [(0, 1), (11, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0025_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0025
        rs_R007_ueqv_R007NY_generator_29_0000_0099 =
      rs_R007_ueqv_R007NY_partial_29_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0026 : Poly :=
[
  term ((487680359111792754284359 : Rat) / 119973741851383387912) [(0, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 26 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0026 : Poly :=
[
  term ((487680359111792754284359 : Rat) / 59986870925691693956) [(0, 1), (6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-487680359111792754284359 : Rat) / 119973741851383387912) [(0, 1), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((487680359111792754284359 : Rat) / 59986870925691693956) [(0, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-487680359111792754284359 : Rat) / 119973741851383387912) [(0, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-487680359111792754284359 : Rat) / 59986870925691693956) [(0, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((487680359111792754284359 : Rat) / 119973741851383387912) [(0, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0026_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0026
        rs_R007_ueqv_R007NY_generator_29_0000_0099 =
      rs_R007_ueqv_R007NY_partial_29_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0027 : Poly :=
[
  term ((733633947466648966281695 : Rat) / 629862144719762786538) [(0, 1), (11, 2), (14, 1), (16, 1)]
]

/-- Partial product 27 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0027 : Poly :=
[
  term ((733633947466648966281695 : Rat) / 314931072359881393269) [(0, 1), (6, 1), (11, 2), (14, 2), (16, 1)],
  term ((-733633947466648966281695 : Rat) / 629862144719762786538) [(0, 1), (6, 2), (11, 2), (14, 1), (16, 1)],
  term ((733633947466648966281695 : Rat) / 314931072359881393269) [(0, 1), (7, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-733633947466648966281695 : Rat) / 629862144719762786538) [(0, 1), (7, 2), (11, 2), (14, 1), (16, 1)],
  term ((733633947466648966281695 : Rat) / 629862144719762786538) [(0, 1), (11, 2), (14, 1), (16, 1)],
  term ((-733633947466648966281695 : Rat) / 314931072359881393269) [(0, 1), (11, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0027_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0027
        rs_R007_ueqv_R007NY_generator_29_0000_0099 =
      rs_R007_ueqv_R007NY_partial_29_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0028 : Poly :=
[
  term ((-4219271569570705050245645 : Rat) / 1889586434159288359614) [(0, 1), (11, 2), (16, 1)]
]

/-- Partial product 28 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0028 : Poly :=
[
  term ((-4219271569570705050245645 : Rat) / 944793217079644179807) [(0, 1), (6, 1), (11, 2), (14, 1), (16, 1)],
  term ((4219271569570705050245645 : Rat) / 1889586434159288359614) [(0, 1), (6, 2), (11, 2), (16, 1)],
  term ((-4219271569570705050245645 : Rat) / 944793217079644179807) [(0, 1), (7, 1), (11, 2), (15, 1), (16, 1)],
  term ((4219271569570705050245645 : Rat) / 1889586434159288359614) [(0, 1), (7, 2), (11, 2), (16, 1)],
  term ((4219271569570705050245645 : Rat) / 944793217079644179807) [(0, 1), (11, 2), (14, 1), (16, 1)],
  term ((-4219271569570705050245645 : Rat) / 1889586434159288359614) [(0, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0028_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0028
        rs_R007_ueqv_R007NY_generator_29_0000_0099 =
      rs_R007_ueqv_R007NY_partial_29_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0029 : Poly :=
[
  term ((710017655052144303680 : Rat) / 14996717731422923489) [(0, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 29 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0029 : Poly :=
[
  term ((1420035310104288607360 : Rat) / 14996717731422923489) [(0, 1), (6, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-710017655052144303680 : Rat) / 14996717731422923489) [(0, 1), (6, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1420035310104288607360 : Rat) / 14996717731422923489) [(0, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-710017655052144303680 : Rat) / 14996717731422923489) [(0, 1), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 14996717731422923489) [(0, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((710017655052144303680 : Rat) / 14996717731422923489) [(0, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0029_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0029
        rs_R007_ueqv_R007NY_generator_29_0000_0099 =
      rs_R007_ueqv_R007NY_partial_29_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0030 : Poly :=
[
  term ((-355008827526072151840 : Rat) / 44990153194268770467) [(0, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 30 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0030 : Poly :=
[
  term ((-710017655052144303680 : Rat) / 44990153194268770467) [(0, 1), (6, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((355008827526072151840 : Rat) / 44990153194268770467) [(0, 1), (6, 2), (12, 1), (15, 2), (16, 1)],
  term ((-710017655052144303680 : Rat) / 44990153194268770467) [(0, 1), (7, 1), (12, 1), (15, 3), (16, 1)],
  term ((355008827526072151840 : Rat) / 44990153194268770467) [(0, 1), (7, 2), (12, 1), (15, 2), (16, 1)],
  term ((710017655052144303680 : Rat) / 44990153194268770467) [(0, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-355008827526072151840 : Rat) / 44990153194268770467) [(0, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0030_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0030
        rs_R007_ueqv_R007NY_generator_29_0000_0099 =
      rs_R007_ueqv_R007NY_partial_29_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0031 : Poly :=
[
  term ((-1 : Rat) / 6) [(0, 1), (12, 1), (16, 1)]
]

/-- Partial product 31 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0031 : Poly :=
[
  term ((-1 : Rat) / 3) [(0, 1), (6, 1), (12, 1), (14, 1), (16, 1)],
  term ((1 : Rat) / 6) [(0, 1), (6, 2), (12, 1), (16, 1)],
  term ((-1 : Rat) / 3) [(0, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((1 : Rat) / 6) [(0, 1), (7, 2), (12, 1), (16, 1)],
  term ((1 : Rat) / 3) [(0, 1), (12, 1), (14, 1), (16, 1)],
  term ((-1 : Rat) / 6) [(0, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0031_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0031
        rs_R007_ueqv_R007NY_generator_29_0000_0099 =
      rs_R007_ueqv_R007NY_partial_29_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0032 : Poly :=
[
  term ((7500307612399897946199 : Rat) / 104977024119960464423) [(0, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 32 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0032 : Poly :=
[
  term ((15000615224799795892398 : Rat) / 104977024119960464423) [(0, 1), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7500307612399897946199 : Rat) / 104977024119960464423) [(0, 1), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((15000615224799795892398 : Rat) / 104977024119960464423) [(0, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-7500307612399897946199 : Rat) / 104977024119960464423) [(0, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-15000615224799795892398 : Rat) / 104977024119960464423) [(0, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((7500307612399897946199 : Rat) / 104977024119960464423) [(0, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0032_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0032
        rs_R007_ueqv_R007NY_generator_29_0000_0099 =
      rs_R007_ueqv_R007NY_partial_29_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0033 : Poly :=
[
  term ((-1374517763046952253899619 : Rat) / 839816192959683715384) [(0, 1), (15, 2), (16, 1)]
]

/-- Partial product 33 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0033 : Poly :=
[
  term ((-1374517763046952253899619 : Rat) / 419908096479841857692) [(0, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((1374517763046952253899619 : Rat) / 839816192959683715384) [(0, 1), (6, 2), (15, 2), (16, 1)],
  term ((-1374517763046952253899619 : Rat) / 419908096479841857692) [(0, 1), (7, 1), (15, 3), (16, 1)],
  term ((1374517763046952253899619 : Rat) / 839816192959683715384) [(0, 1), (7, 2), (15, 2), (16, 1)],
  term ((1374517763046952253899619 : Rat) / 419908096479841857692) [(0, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1374517763046952253899619 : Rat) / 839816192959683715384) [(0, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0033_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0033
        rs_R007_ueqv_R007NY_generator_29_0000_0099 =
      rs_R007_ueqv_R007NY_partial_29_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0034 : Poly :=
[
  term ((390454837902337404252745 : Rat) / 944793217079644179807) [(1, 1), (2, 1), (11, 1), (16, 1)]
]

/-- Partial product 34 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0034 : Poly :=
[
  term ((780909675804674808505490 : Rat) / 944793217079644179807) [(1, 1), (2, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((-390454837902337404252745 : Rat) / 944793217079644179807) [(1, 1), (2, 1), (6, 2), (11, 1), (16, 1)],
  term ((780909675804674808505490 : Rat) / 944793217079644179807) [(1, 1), (2, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-390454837902337404252745 : Rat) / 944793217079644179807) [(1, 1), (2, 1), (7, 2), (11, 1), (16, 1)],
  term ((-780909675804674808505490 : Rat) / 944793217079644179807) [(1, 1), (2, 1), (11, 1), (14, 1), (16, 1)],
  term ((390454837902337404252745 : Rat) / 944793217079644179807) [(1, 1), (2, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0034_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0034
        rs_R007_ueqv_R007NY_generator_29_0000_0099 =
      rs_R007_ueqv_R007NY_partial_29_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0035 : Poly :=
[
  term ((-26310261257809054855311 : Rat) / 104977024119960464423) [(1, 1), (2, 1), (15, 1), (16, 1)]
]

/-- Partial product 35 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0035 : Poly :=
[
  term ((-52620522515618109710622 : Rat) / 104977024119960464423) [(1, 1), (2, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((26310261257809054855311 : Rat) / 104977024119960464423) [(1, 1), (2, 1), (6, 2), (15, 1), (16, 1)],
  term ((-52620522515618109710622 : Rat) / 104977024119960464423) [(1, 1), (2, 1), (7, 1), (15, 2), (16, 1)],
  term ((26310261257809054855311 : Rat) / 104977024119960464423) [(1, 1), (2, 1), (7, 2), (15, 1), (16, 1)],
  term ((52620522515618109710622 : Rat) / 104977024119960464423) [(1, 1), (2, 1), (14, 1), (15, 1), (16, 1)],
  term ((-26310261257809054855311 : Rat) / 104977024119960464423) [(1, 1), (2, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0035_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0035
        rs_R007_ueqv_R007NY_generator_29_0000_0099 =
      rs_R007_ueqv_R007NY_partial_29_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0036 : Poly :=
[
  term ((211649342433421685123740 : Rat) / 944793217079644179807) [(1, 1), (3, 1), (5, 1), (11, 1), (16, 1)]
]

/-- Partial product 36 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0036 : Poly :=
[
  term ((423298684866843370247480 : Rat) / 944793217079644179807) [(1, 1), (3, 1), (5, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((-211649342433421685123740 : Rat) / 944793217079644179807) [(1, 1), (3, 1), (5, 1), (6, 2), (11, 1), (16, 1)],
  term ((423298684866843370247480 : Rat) / 944793217079644179807) [(1, 1), (3, 1), (5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-211649342433421685123740 : Rat) / 944793217079644179807) [(1, 1), (3, 1), (5, 1), (7, 2), (11, 1), (16, 1)],
  term ((-423298684866843370247480 : Rat) / 944793217079644179807) [(1, 1), (3, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((211649342433421685123740 : Rat) / 944793217079644179807) [(1, 1), (3, 1), (5, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0036_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0036
        rs_R007_ueqv_R007NY_generator_29_0000_0099 =
      rs_R007_ueqv_R007NY_partial_29_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0037 : Poly :=
[
  term ((-42329868486684337024748 : Rat) / 314931072359881393269) [(1, 1), (3, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 37 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0037 : Poly :=
[
  term ((-84659736973368674049496 : Rat) / 314931072359881393269) [(1, 1), (3, 1), (5, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((42329868486684337024748 : Rat) / 314931072359881393269) [(1, 1), (3, 1), (5, 1), (6, 2), (15, 1), (16, 1)],
  term ((-84659736973368674049496 : Rat) / 314931072359881393269) [(1, 1), (3, 1), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((42329868486684337024748 : Rat) / 314931072359881393269) [(1, 1), (3, 1), (5, 1), (7, 2), (15, 1), (16, 1)],
  term ((84659736973368674049496 : Rat) / 314931072359881393269) [(1, 1), (3, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-42329868486684337024748 : Rat) / 314931072359881393269) [(1, 1), (3, 1), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0037_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0037
        rs_R007_ueqv_R007NY_generator_29_0000_0099 =
      rs_R007_ueqv_R007NY_partial_29_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0038 : Poly :=
[
  term ((-412134446239876979346095 : Rat) / 1889586434159288359614) [(1, 1), (3, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 38 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0038 : Poly :=
[
  term ((-412134446239876979346095 : Rat) / 944793217079644179807) [(1, 1), (3, 1), (6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((412134446239876979346095 : Rat) / 1889586434159288359614) [(1, 1), (3, 1), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((-412134446239876979346095 : Rat) / 944793217079644179807) [(1, 1), (3, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((412134446239876979346095 : Rat) / 1889586434159288359614) [(1, 1), (3, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((412134446239876979346095 : Rat) / 944793217079644179807) [(1, 1), (3, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-412134446239876979346095 : Rat) / 1889586434159288359614) [(1, 1), (3, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0038_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0038
        rs_R007_ueqv_R007NY_generator_29_0000_0099 =
      rs_R007_ueqv_R007NY_partial_29_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0039 : Poly :=
[
  term ((82426889247975395869219 : Rat) / 629862144719762786538) [(1, 1), (3, 1), (15, 2), (16, 1)]
]

/-- Partial product 39 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0039 : Poly :=
[
  term ((82426889247975395869219 : Rat) / 314931072359881393269) [(1, 1), (3, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((-82426889247975395869219 : Rat) / 629862144719762786538) [(1, 1), (3, 1), (6, 2), (15, 2), (16, 1)],
  term ((82426889247975395869219 : Rat) / 314931072359881393269) [(1, 1), (3, 1), (7, 1), (15, 3), (16, 1)],
  term ((-82426889247975395869219 : Rat) / 629862144719762786538) [(1, 1), (3, 1), (7, 2), (15, 2), (16, 1)],
  term ((-82426889247975395869219 : Rat) / 314931072359881393269) [(1, 1), (3, 1), (14, 1), (15, 2), (16, 1)],
  term ((82426889247975395869219 : Rat) / 629862144719762786538) [(1, 1), (3, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0039_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0039
        rs_R007_ueqv_R007NY_generator_29_0000_0099 =
      rs_R007_ueqv_R007NY_partial_29_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0040 : Poly :=
[
  term ((47517022341948242478765 : Rat) / 209954048239920928846) [(1, 1), (4, 1), (11, 1), (16, 1)]
]

/-- Partial product 40 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0040 : Poly :=
[
  term ((47517022341948242478765 : Rat) / 104977024119960464423) [(1, 1), (4, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((-47517022341948242478765 : Rat) / 209954048239920928846) [(1, 1), (4, 1), (6, 2), (11, 1), (16, 1)],
  term ((47517022341948242478765 : Rat) / 104977024119960464423) [(1, 1), (4, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-47517022341948242478765 : Rat) / 209954048239920928846) [(1, 1), (4, 1), (7, 2), (11, 1), (16, 1)],
  term ((-47517022341948242478765 : Rat) / 104977024119960464423) [(1, 1), (4, 1), (11, 1), (14, 1), (16, 1)],
  term ((47517022341948242478765 : Rat) / 209954048239920928846) [(1, 1), (4, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0040_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0040
        rs_R007_ueqv_R007NY_generator_29_0000_0099 =
      rs_R007_ueqv_R007NY_partial_29_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0041 : Poly :=
[
  term ((-28510213405168945487259 : Rat) / 209954048239920928846) [(1, 1), (4, 1), (15, 1), (16, 1)]
]

/-- Partial product 41 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0041 : Poly :=
[
  term ((-28510213405168945487259 : Rat) / 104977024119960464423) [(1, 1), (4, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((28510213405168945487259 : Rat) / 209954048239920928846) [(1, 1), (4, 1), (6, 2), (15, 1), (16, 1)],
  term ((-28510213405168945487259 : Rat) / 104977024119960464423) [(1, 1), (4, 1), (7, 1), (15, 2), (16, 1)],
  term ((28510213405168945487259 : Rat) / 209954048239920928846) [(1, 1), (4, 1), (7, 2), (15, 1), (16, 1)],
  term ((28510213405168945487259 : Rat) / 104977024119960464423) [(1, 1), (4, 1), (14, 1), (15, 1), (16, 1)],
  term ((-28510213405168945487259 : Rat) / 209954048239920928846) [(1, 1), (4, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0041_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0041
        rs_R007_ueqv_R007NY_generator_29_0000_0099 =
      rs_R007_ueqv_R007NY_partial_29_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0042 : Poly :=
[
  term ((-45543514736691095011445 : Rat) / 944793217079644179807) [(1, 1), (5, 1), (7, 1), (11, 1), (16, 1)]
]

/-- Partial product 42 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0042 : Poly :=
[
  term ((-91087029473382190022890 : Rat) / 944793217079644179807) [(1, 1), (5, 1), (6, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((45543514736691095011445 : Rat) / 944793217079644179807) [(1, 1), (5, 1), (6, 2), (7, 1), (11, 1), (16, 1)],
  term ((91087029473382190022890 : Rat) / 944793217079644179807) [(1, 1), (5, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-45543514736691095011445 : Rat) / 944793217079644179807) [(1, 1), (5, 1), (7, 1), (11, 1), (16, 1)],
  term ((-91087029473382190022890 : Rat) / 944793217079644179807) [(1, 1), (5, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((45543514736691095011445 : Rat) / 944793217079644179807) [(1, 1), (5, 1), (7, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0042_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0042
        rs_R007_ueqv_R007NY_generator_29_0000_0099 =
      rs_R007_ueqv_R007NY_partial_29_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0043 : Poly :=
[
  term ((9108702947338219002289 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 43 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0043 : Poly :=
[
  term ((18217405894676438004578 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (6, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9108702947338219002289 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (6, 2), (7, 1), (15, 1), (16, 1)],
  term ((-18217405894676438004578 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((9108702947338219002289 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((18217405894676438004578 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (7, 2), (15, 2), (16, 1)],
  term ((-9108702947338219002289 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (7, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0043_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0043
        rs_R007_ueqv_R007NY_generator_29_0000_0099 =
      rs_R007_ueqv_R007NY_partial_29_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0044 : Poly :=
[
  term ((-9829284761768625139900 : Rat) / 944793217079644179807) [(1, 1), (5, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 44 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0044 : Poly :=
[
  term ((-19658569523537250279800 : Rat) / 944793217079644179807) [(1, 1), (5, 1), (6, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((9829284761768625139900 : Rat) / 944793217079644179807) [(1, 1), (5, 1), (6, 2), (11, 1), (13, 1), (16, 1)],
  term ((-19658569523537250279800 : Rat) / 944793217079644179807) [(1, 1), (5, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((9829284761768625139900 : Rat) / 944793217079644179807) [(1, 1), (5, 1), (7, 2), (11, 1), (13, 1), (16, 1)],
  term ((19658569523537250279800 : Rat) / 944793217079644179807) [(1, 1), (5, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-9829284761768625139900 : Rat) / 944793217079644179807) [(1, 1), (5, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0044_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0044
        rs_R007_ueqv_R007NY_generator_29_0000_0099 =
      rs_R007_ueqv_R007NY_partial_29_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0045 : Poly :=
[
  term ((1965856952353725027980 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 45 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0045 : Poly :=
[
  term ((3931713904707450055960 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1965856952353725027980 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((3931713904707450055960 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1965856952353725027980 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-3931713904707450055960 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1965856952353725027980 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0045_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0045
        rs_R007_ueqv_R007NY_generator_29_0000_0099 =
      rs_R007_ueqv_R007NY_partial_29_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0046 : Poly :=
[
  term (1 : Rat) [(1, 1), (7, 1), (10, 1), (16, 1)]
]

/-- Partial product 46 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0046 : Poly :=
[
  term (2 : Rat) [(1, 1), (6, 1), (7, 1), (10, 1), (14, 1), (16, 1)],
  term (-1 : Rat) [(1, 1), (6, 2), (7, 1), (10, 1), (16, 1)],
  term (-2 : Rat) [(1, 1), (7, 1), (10, 1), (14, 1), (16, 1)],
  term (1 : Rat) [(1, 1), (7, 1), (10, 1), (16, 1)],
  term (2 : Rat) [(1, 1), (7, 2), (10, 1), (15, 1), (16, 1)],
  term (-1 : Rat) [(1, 1), (7, 3), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0046_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0046
        rs_R007_ueqv_R007NY_generator_29_0000_0099 =
      rs_R007_ueqv_R007NY_partial_29_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0047 : Poly :=
[
  term ((-4662882398671472552285 : Rat) / 37050714395280163914) [(1, 1), (7, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 47 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0047 : Poly :=
[
  term ((-4662882398671472552285 : Rat) / 18525357197640081957) [(1, 1), (6, 1), (7, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((4662882398671472552285 : Rat) / 37050714395280163914) [(1, 1), (6, 2), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((4662882398671472552285 : Rat) / 18525357197640081957) [(1, 1), (7, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-4662882398671472552285 : Rat) / 37050714395280163914) [(1, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((-4662882398671472552285 : Rat) / 18525357197640081957) [(1, 1), (7, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((4662882398671472552285 : Rat) / 37050714395280163914) [(1, 1), (7, 3), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0047_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0047
        rs_R007_ueqv_R007NY_generator_29_0000_0099 =
      rs_R007_ueqv_R007NY_partial_29_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0048 : Poly :=
[
  term ((597423291812146461695585 : Rat) / 102139807251853424844) [(1, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 48 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0048 : Poly :=
[
  term ((597423291812146461695585 : Rat) / 51069903625926712422) [(1, 1), (6, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-597423291812146461695585 : Rat) / 102139807251853424844) [(1, 1), (6, 2), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-597423291812146461695585 : Rat) / 51069903625926712422) [(1, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((597423291812146461695585 : Rat) / 102139807251853424844) [(1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((597423291812146461695585 : Rat) / 51069903625926712422) [(1, 1), (7, 2), (11, 1), (15, 2), (16, 1)],
  term ((-597423291812146461695585 : Rat) / 102139807251853424844) [(1, 1), (7, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0048_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0048
        rs_R007_ueqv_R007NY_generator_29_0000_0099 =
      rs_R007_ueqv_R007NY_partial_29_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0049 : Poly :=
[
  term ((932576479734294510457 : Rat) / 12350238131760054638) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 49 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0049 : Poly :=
[
  term ((932576479734294510457 : Rat) / 6175119065880027319) [(1, 1), (6, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-932576479734294510457 : Rat) / 12350238131760054638) [(1, 1), (6, 2), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-932576479734294510457 : Rat) / 6175119065880027319) [(1, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((932576479734294510457 : Rat) / 12350238131760054638) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((932576479734294510457 : Rat) / 6175119065880027319) [(1, 1), (7, 2), (13, 1), (15, 2), (16, 1)],
  term ((-932576479734294510457 : Rat) / 12350238131760054638) [(1, 1), (7, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0049_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0049
        rs_R007_ueqv_R007NY_generator_29_0000_0099 =
      rs_R007_ueqv_R007NY_partial_29_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0050 : Poly :=
[
  term (5 : Rat) [(1, 1), (7, 1), (14, 1), (16, 1)]
]

/-- Partial product 50 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0050 : Poly :=
[
  term (10 : Rat) [(1, 1), (6, 1), (7, 1), (14, 2), (16, 1)],
  term (-5 : Rat) [(1, 1), (6, 2), (7, 1), (14, 1), (16, 1)],
  term (5 : Rat) [(1, 1), (7, 1), (14, 1), (16, 1)],
  term (-10 : Rat) [(1, 1), (7, 1), (14, 2), (16, 1)],
  term (10 : Rat) [(1, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term (-5 : Rat) [(1, 1), (7, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0050_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0050
        rs_R007_ueqv_R007NY_generator_29_0000_0099 =
      rs_R007_ueqv_R007NY_partial_29_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0051 : Poly :=
[
  term ((-119484658362429292339117 : Rat) / 34046602417284474948) [(1, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 51 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0051 : Poly :=
[
  term ((-119484658362429292339117 : Rat) / 17023301208642237474) [(1, 1), (6, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((119484658362429292339117 : Rat) / 34046602417284474948) [(1, 1), (6, 2), (7, 1), (15, 2), (16, 1)],
  term ((119484658362429292339117 : Rat) / 17023301208642237474) [(1, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((-119484658362429292339117 : Rat) / 34046602417284474948) [(1, 1), (7, 1), (15, 2), (16, 1)],
  term ((-119484658362429292339117 : Rat) / 17023301208642237474) [(1, 1), (7, 2), (15, 3), (16, 1)],
  term ((119484658362429292339117 : Rat) / 34046602417284474948) [(1, 1), (7, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0051_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0051
        rs_R007_ueqv_R007NY_generator_29_0000_0099 =
      rs_R007_ueqv_R007NY_partial_29_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0052 : Poly :=
[
  term (-4 : Rat) [(1, 1), (7, 1), (16, 1)]
]

/-- Partial product 52 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0052 : Poly :=
[
  term (-8 : Rat) [(1, 1), (6, 1), (7, 1), (14, 1), (16, 1)],
  term (4 : Rat) [(1, 1), (6, 2), (7, 1), (16, 1)],
  term (8 : Rat) [(1, 1), (7, 1), (14, 1), (16, 1)],
  term (-4 : Rat) [(1, 1), (7, 1), (16, 1)],
  term (-8 : Rat) [(1, 1), (7, 2), (15, 1), (16, 1)],
  term (4 : Rat) [(1, 1), (7, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0052_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0052
        rs_R007_ueqv_R007NY_generator_29_0000_0099 =
      rs_R007_ueqv_R007NY_partial_29_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0053 : Poly :=
[
  term ((22567808505607426458881 : Rat) / 944793217079644179807) [(1, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 53 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0053 : Poly :=
[
  term ((45135617011214852917762 : Rat) / 944793217079644179807) [(1, 1), (6, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-22567808505607426458881 : Rat) / 944793217079644179807) [(1, 1), (6, 2), (10, 1), (11, 1), (16, 1)],
  term ((45135617011214852917762 : Rat) / 944793217079644179807) [(1, 1), (7, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-22567808505607426458881 : Rat) / 944793217079644179807) [(1, 1), (7, 2), (10, 1), (11, 1), (16, 1)],
  term ((-45135617011214852917762 : Rat) / 944793217079644179807) [(1, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((22567808505607426458881 : Rat) / 944793217079644179807) [(1, 1), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0053_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0053
        rs_R007_ueqv_R007NY_generator_29_0000_0099 =
      rs_R007_ueqv_R007NY_partial_29_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0054 : Poly :=
[
  term ((-1350554264997886416105 : Rat) / 104977024119960464423) [(1, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 54 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0054 : Poly :=
[
  term ((-2701108529995772832210 : Rat) / 104977024119960464423) [(1, 1), (6, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((1350554264997886416105 : Rat) / 104977024119960464423) [(1, 1), (6, 2), (10, 1), (15, 1), (16, 1)],
  term ((-2701108529995772832210 : Rat) / 104977024119960464423) [(1, 1), (7, 1), (10, 1), (15, 2), (16, 1)],
  term ((1350554264997886416105 : Rat) / 104977024119960464423) [(1, 1), (7, 2), (10, 1), (15, 1), (16, 1)],
  term ((2701108529995772832210 : Rat) / 104977024119960464423) [(1, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1350554264997886416105 : Rat) / 104977024119960464423) [(1, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0054_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0054
        rs_R007_ueqv_R007NY_generator_29_0000_0099 =
      rs_R007_ueqv_R007NY_partial_29_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0055 : Poly :=
[
  term ((79206032360901795661405 : Rat) / 419908096479841857692) [(1, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 55 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0055 : Poly :=
[
  term ((79206032360901795661405 : Rat) / 209954048239920928846) [(1, 1), (6, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-79206032360901795661405 : Rat) / 419908096479841857692) [(1, 1), (6, 2), (11, 1), (12, 1), (16, 1)],
  term ((79206032360901795661405 : Rat) / 209954048239920928846) [(1, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-79206032360901795661405 : Rat) / 419908096479841857692) [(1, 1), (7, 2), (11, 1), (12, 1), (16, 1)],
  term ((-79206032360901795661405 : Rat) / 209954048239920928846) [(1, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((79206032360901795661405 : Rat) / 419908096479841857692) [(1, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0055_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0055
        rs_R007_ueqv_R007NY_generator_29_0000_0099 =
      rs_R007_ueqv_R007NY_partial_29_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0056 : Poly :=
[
  term ((1775044137630360759200 : Rat) / 134970459582806311401) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 56 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0056 : Poly :=
[
  term ((3550088275260721518400 : Rat) / 134970459582806311401) [(1, 1), (6, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1775044137630360759200 : Rat) / 134970459582806311401) [(1, 1), (6, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 134970459582806311401) [(1, 1), (7, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1775044137630360759200 : Rat) / 134970459582806311401) [(1, 1), (7, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 134970459582806311401) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1775044137630360759200 : Rat) / 134970459582806311401) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0056_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0056
        rs_R007_ueqv_R007NY_generator_29_0000_0099 =
      rs_R007_ueqv_R007NY_partial_29_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0057 : Poly :=
[
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(1, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 57 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0057 : Poly :=
[
  term ((-7100176550521443036800 : Rat) / 44990153194268770467) [(1, 1), (6, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(1, 1), (6, 2), (11, 1), (13, 2), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 44990153194268770467) [(1, 1), (7, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(1, 1), (7, 2), (11, 1), (13, 2), (16, 1)],
  term ((7100176550521443036800 : Rat) / 44990153194268770467) [(1, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(1, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0057_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0057
        rs_R007_ueqv_R007NY_generator_29_0000_0099 =
      rs_R007_ueqv_R007NY_partial_29_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0058 : Poly :=
[
  term ((181141447557329493714691 : Rat) / 419908096479841857692) [(1, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 58 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0058 : Poly :=
[
  term ((181141447557329493714691 : Rat) / 209954048239920928846) [(1, 1), (6, 1), (11, 1), (14, 2), (16, 1)],
  term ((-181141447557329493714691 : Rat) / 419908096479841857692) [(1, 1), (6, 2), (11, 1), (14, 1), (16, 1)],
  term ((181141447557329493714691 : Rat) / 209954048239920928846) [(1, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-181141447557329493714691 : Rat) / 419908096479841857692) [(1, 1), (7, 2), (11, 1), (14, 1), (16, 1)],
  term ((181141447557329493714691 : Rat) / 419908096479841857692) [(1, 1), (11, 1), (14, 1), (16, 1)],
  term ((-181141447557329493714691 : Rat) / 209954048239920928846) [(1, 1), (11, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0058_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0058
        rs_R007_ueqv_R007NY_generator_29_0000_0099 =
      rs_R007_ueqv_R007NY_partial_29_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0059 : Poly :=
[
  term ((11687870617409502915899 : Rat) / 12854329484076791562) [(1, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 59 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0059 : Poly :=
[
  term ((11687870617409502915899 : Rat) / 6427164742038395781) [(1, 1), (6, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-11687870617409502915899 : Rat) / 12854329484076791562) [(1, 1), (6, 2), (11, 1), (15, 2), (16, 1)],
  term ((11687870617409502915899 : Rat) / 6427164742038395781) [(1, 1), (7, 1), (11, 1), (15, 3), (16, 1)],
  term ((-11687870617409502915899 : Rat) / 12854329484076791562) [(1, 1), (7, 2), (11, 1), (15, 2), (16, 1)],
  term ((-11687870617409502915899 : Rat) / 6427164742038395781) [(1, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((11687870617409502915899 : Rat) / 12854329484076791562) [(1, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0059_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0059
        rs_R007_ueqv_R007NY_generator_29_0000_0099 =
      rs_R007_ueqv_R007NY_partial_29_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0060 : Poly :=
[
  term ((-4498958362351430765191987 : Rat) / 1889586434159288359614) [(1, 1), (11, 1), (16, 1)]
]

/-- Partial product 60 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0060 : Poly :=
[
  term ((-4498958362351430765191987 : Rat) / 944793217079644179807) [(1, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((4498958362351430765191987 : Rat) / 1889586434159288359614) [(1, 1), (6, 2), (11, 1), (16, 1)],
  term ((-4498958362351430765191987 : Rat) / 944793217079644179807) [(1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((4498958362351430765191987 : Rat) / 1889586434159288359614) [(1, 1), (7, 2), (11, 1), (16, 1)],
  term ((4498958362351430765191987 : Rat) / 944793217079644179807) [(1, 1), (11, 1), (14, 1), (16, 1)],
  term ((-4498958362351430765191987 : Rat) / 1889586434159288359614) [(1, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0060_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0060
        rs_R007_ueqv_R007NY_generator_29_0000_0099 =
      rs_R007_ueqv_R007NY_partial_29_0060 := by
  native_decide

/-- Coefficient term 61 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0061 : Poly :=
[
  term ((-58439353087047514579495 : Rat) / 38562988452230374686) [(1, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 61 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0061 : Poly :=
[
  term ((-58439353087047514579495 : Rat) / 19281494226115187343) [(1, 1), (6, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((58439353087047514579495 : Rat) / 38562988452230374686) [(1, 1), (6, 2), (11, 2), (15, 1), (16, 1)],
  term ((-58439353087047514579495 : Rat) / 19281494226115187343) [(1, 1), (7, 1), (11, 2), (15, 2), (16, 1)],
  term ((58439353087047514579495 : Rat) / 38562988452230374686) [(1, 1), (7, 2), (11, 2), (15, 1), (16, 1)],
  term ((58439353087047514579495 : Rat) / 19281494226115187343) [(1, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-58439353087047514579495 : Rat) / 38562988452230374686) [(1, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 61 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0061_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0061
        rs_R007_ueqv_R007NY_generator_29_0000_0099 =
      rs_R007_ueqv_R007NY_partial_29_0061 := by
  native_decide

/-- Coefficient term 62 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0062 : Poly :=
[
  term ((-47523619416541077396843 : Rat) / 419908096479841857692) [(1, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 62 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0062 : Poly :=
[
  term ((-47523619416541077396843 : Rat) / 209954048239920928846) [(1, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((47523619416541077396843 : Rat) / 419908096479841857692) [(1, 1), (6, 2), (12, 1), (15, 1), (16, 1)],
  term ((-47523619416541077396843 : Rat) / 209954048239920928846) [(1, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((47523619416541077396843 : Rat) / 419908096479841857692) [(1, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((47523619416541077396843 : Rat) / 209954048239920928846) [(1, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-47523619416541077396843 : Rat) / 419908096479841857692) [(1, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 62 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0062_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0062
        rs_R007_ueqv_R007NY_generator_29_0000_0099 =
      rs_R007_ueqv_R007NY_partial_29_0062 := by
  native_decide

/-- Coefficient term 63 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0063 : Poly :=
[
  term ((-355008827526072151840 : Rat) / 44990153194268770467) [(1, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 63 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0063 : Poly :=
[
  term ((-710017655052144303680 : Rat) / 44990153194268770467) [(1, 1), (6, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((355008827526072151840 : Rat) / 44990153194268770467) [(1, 1), (6, 2), (13, 1), (15, 2), (16, 1)],
  term ((-710017655052144303680 : Rat) / 44990153194268770467) [(1, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((355008827526072151840 : Rat) / 44990153194268770467) [(1, 1), (7, 2), (13, 1), (15, 2), (16, 1)],
  term ((710017655052144303680 : Rat) / 44990153194268770467) [(1, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-355008827526072151840 : Rat) / 44990153194268770467) [(1, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 63 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0063_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0063
        rs_R007_ueqv_R007NY_generator_29_0000_0099 =
      rs_R007_ueqv_R007NY_partial_29_0063 := by
  native_decide

/-- Coefficient term 64 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0064 : Poly :=
[
  term ((-1 : Rat) / 6) [(1, 1), (13, 1), (16, 1)]
]

/-- Partial product 64 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0064 : Poly :=
[
  term ((-1 : Rat) / 3) [(1, 1), (6, 1), (13, 1), (14, 1), (16, 1)],
  term ((1 : Rat) / 6) [(1, 1), (6, 2), (13, 1), (16, 1)],
  term ((-1 : Rat) / 3) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((1 : Rat) / 6) [(1, 1), (7, 2), (13, 1), (16, 1)],
  term ((1 : Rat) / 3) [(1, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1 : Rat) / 6) [(1, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 64 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0064_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0064
        rs_R007_ueqv_R007NY_generator_29_0000_0099 =
      rs_R007_ueqv_R007NY_partial_29_0064 := by
  native_decide

/-- Coefficient term 65 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0065 : Poly :=
[
  term ((710017655052144303680 : Rat) / 14996717731422923489) [(1, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 65 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0065 : Poly :=
[
  term ((1420035310104288607360 : Rat) / 14996717731422923489) [(1, 1), (6, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-710017655052144303680 : Rat) / 14996717731422923489) [(1, 1), (6, 2), (13, 2), (15, 1), (16, 1)],
  term ((1420035310104288607360 : Rat) / 14996717731422923489) [(1, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((-710017655052144303680 : Rat) / 14996717731422923489) [(1, 1), (7, 2), (13, 2), (15, 1), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 14996717731422923489) [(1, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((710017655052144303680 : Rat) / 14996717731422923489) [(1, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 65 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0065_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0065
        rs_R007_ueqv_R007NY_generator_29_0000_0099 =
      rs_R007_ueqv_R007NY_partial_29_0065 := by
  native_decide

/-- Coefficient term 66 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0066 : Poly :=
[
  term ((-109188758250173506458045 : Rat) / 419908096479841857692) [(1, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 66 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0066 : Poly :=
[
  term ((-109188758250173506458045 : Rat) / 209954048239920928846) [(1, 1), (6, 1), (14, 2), (15, 1), (16, 1)],
  term ((109188758250173506458045 : Rat) / 419908096479841857692) [(1, 1), (6, 2), (14, 1), (15, 1), (16, 1)],
  term ((-109188758250173506458045 : Rat) / 209954048239920928846) [(1, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((109188758250173506458045 : Rat) / 419908096479841857692) [(1, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((-109188758250173506458045 : Rat) / 419908096479841857692) [(1, 1), (14, 1), (15, 1), (16, 1)],
  term ((109188758250173506458045 : Rat) / 209954048239920928846) [(1, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 66 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0066_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0066
        rs_R007_ueqv_R007NY_generator_29_0000_0099 =
      rs_R007_ueqv_R007NY_partial_29_0066 := by
  native_decide

/-- Coefficient term 67 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0067 : Poly :=
[
  term ((900547507043949868382243 : Rat) / 629862144719762786538) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 67 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0067 : Poly :=
[
  term ((900547507043949868382243 : Rat) / 314931072359881393269) [(1, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-900547507043949868382243 : Rat) / 629862144719762786538) [(1, 1), (6, 2), (15, 1), (16, 1)],
  term ((900547507043949868382243 : Rat) / 314931072359881393269) [(1, 1), (7, 1), (15, 2), (16, 1)],
  term ((-900547507043949868382243 : Rat) / 629862144719762786538) [(1, 1), (7, 2), (15, 1), (16, 1)],
  term ((-900547507043949868382243 : Rat) / 314931072359881393269) [(1, 1), (14, 1), (15, 1), (16, 1)],
  term ((900547507043949868382243 : Rat) / 629862144719762786538) [(1, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 67 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0067_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0067
        rs_R007_ueqv_R007NY_generator_29_0000_0099 =
      rs_R007_ueqv_R007NY_partial_29_0067 := by
  native_decide

/-- Coefficient term 68 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0068 : Poly :=
[
  term ((-1913687507302214207950 : Rat) / 14996717731422923489) [(1, 2), (5, 1), (11, 1), (16, 1)]
]

/-- Partial product 68 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0068 : Poly :=
[
  term ((-3827375014604428415900 : Rat) / 14996717731422923489) [(1, 2), (5, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((1913687507302214207950 : Rat) / 14996717731422923489) [(1, 2), (5, 1), (6, 2), (11, 1), (16, 1)],
  term ((-3827375014604428415900 : Rat) / 14996717731422923489) [(1, 2), (5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((1913687507302214207950 : Rat) / 14996717731422923489) [(1, 2), (5, 1), (7, 2), (11, 1), (16, 1)],
  term ((3827375014604428415900 : Rat) / 14996717731422923489) [(1, 2), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-1913687507302214207950 : Rat) / 14996717731422923489) [(1, 2), (5, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 68 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0068_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0068
        rs_R007_ueqv_R007NY_generator_29_0000_0099 =
      rs_R007_ueqv_R007NY_partial_29_0068 := by
  native_decide

/-- Coefficient term 69 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0069 : Poly :=
[
  term ((1148212504381328524770 : Rat) / 14996717731422923489) [(1, 2), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 69 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0069 : Poly :=
[
  term ((2296425008762657049540 : Rat) / 14996717731422923489) [(1, 2), (5, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1148212504381328524770 : Rat) / 14996717731422923489) [(1, 2), (5, 1), (6, 2), (15, 1), (16, 1)],
  term ((2296425008762657049540 : Rat) / 14996717731422923489) [(1, 2), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((-1148212504381328524770 : Rat) / 14996717731422923489) [(1, 2), (5, 1), (7, 2), (15, 1), (16, 1)],
  term ((-2296425008762657049540 : Rat) / 14996717731422923489) [(1, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((1148212504381328524770 : Rat) / 14996717731422923489) [(1, 2), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 69 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0069_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0069
        rs_R007_ueqv_R007NY_generator_29_0000_0099 =
      rs_R007_ueqv_R007NY_partial_29_0069 := by
  native_decide

/-- Coefficient term 70 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0070 : Poly :=
[
  term (-4 : Rat) [(1, 2), (14, 1), (16, 1)]
]

/-- Partial product 70 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0070 : Poly :=
[
  term (-8 : Rat) [(1, 2), (6, 1), (14, 2), (16, 1)],
  term (4 : Rat) [(1, 2), (6, 2), (14, 1), (16, 1)],
  term (-8 : Rat) [(1, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(1, 2), (7, 2), (14, 1), (16, 1)],
  term (-4 : Rat) [(1, 2), (14, 1), (16, 1)],
  term (8 : Rat) [(1, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 70 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0070_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0070
        rs_R007_ueqv_R007NY_generator_29_0000_0099 =
      rs_R007_ueqv_R007NY_partial_29_0070 := by
  native_decide

/-- Coefficient term 71 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0071 : Poly :=
[
  term (4 : Rat) [(1, 2), (16, 1)]
]

/-- Partial product 71 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0071 : Poly :=
[
  term (8 : Rat) [(1, 2), (6, 1), (14, 1), (16, 1)],
  term (-4 : Rat) [(1, 2), (6, 2), (16, 1)],
  term (8 : Rat) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(1, 2), (7, 2), (16, 1)],
  term (-8 : Rat) [(1, 2), (14, 1), (16, 1)],
  term (4 : Rat) [(1, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 71 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0071_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0071
        rs_R007_ueqv_R007NY_generator_29_0000_0099 =
      rs_R007_ueqv_R007NY_partial_29_0071 := by
  native_decide

/-- Coefficient term 72 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0072 : Poly :=
[
  term ((41811851747058870874820 : Rat) / 55576071592920245871) [(2, 1), (3, 1), (11, 1), (16, 1)]
]

/-- Partial product 72 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0072 : Poly :=
[
  term ((83623703494117741749640 : Rat) / 55576071592920245871) [(2, 1), (3, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((-41811851747058870874820 : Rat) / 55576071592920245871) [(2, 1), (3, 1), (6, 2), (11, 1), (16, 1)],
  term ((83623703494117741749640 : Rat) / 55576071592920245871) [(2, 1), (3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-41811851747058870874820 : Rat) / 55576071592920245871) [(2, 1), (3, 1), (7, 2), (11, 1), (16, 1)],
  term ((-83623703494117741749640 : Rat) / 55576071592920245871) [(2, 1), (3, 1), (11, 1), (14, 1), (16, 1)],
  term ((41811851747058870874820 : Rat) / 55576071592920245871) [(2, 1), (3, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 72 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0072_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0072
        rs_R007_ueqv_R007NY_generator_29_0000_0099 =
      rs_R007_ueqv_R007NY_partial_29_0072 := by
  native_decide

/-- Coefficient term 73 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0073 : Poly :=
[
  term ((-8362370349411774174964 : Rat) / 18525357197640081957) [(2, 1), (3, 1), (15, 1), (16, 1)]
]

/-- Partial product 73 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0073 : Poly :=
[
  term ((-16724740698823548349928 : Rat) / 18525357197640081957) [(2, 1), (3, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((8362370349411774174964 : Rat) / 18525357197640081957) [(2, 1), (3, 1), (6, 2), (15, 1), (16, 1)],
  term ((-16724740698823548349928 : Rat) / 18525357197640081957) [(2, 1), (3, 1), (7, 1), (15, 2), (16, 1)],
  term ((8362370349411774174964 : Rat) / 18525357197640081957) [(2, 1), (3, 1), (7, 2), (15, 1), (16, 1)],
  term ((16724740698823548349928 : Rat) / 18525357197640081957) [(2, 1), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8362370349411774174964 : Rat) / 18525357197640081957) [(2, 1), (3, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 73 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0073_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0073
        rs_R007_ueqv_R007NY_generator_29_0000_0099 =
      rs_R007_ueqv_R007NY_partial_29_0073 := by
  native_decide

/-- Coefficient term 74 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0074 : Poly :=
[
  term ((8797615598806863390785 : Rat) / 38562988452230374686) [(2, 1), (5, 1), (11, 1), (16, 1)]
]

/-- Partial product 74 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0074 : Poly :=
[
  term ((8797615598806863390785 : Rat) / 19281494226115187343) [(2, 1), (5, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((-8797615598806863390785 : Rat) / 38562988452230374686) [(2, 1), (5, 1), (6, 2), (11, 1), (16, 1)],
  term ((8797615598806863390785 : Rat) / 19281494226115187343) [(2, 1), (5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-8797615598806863390785 : Rat) / 38562988452230374686) [(2, 1), (5, 1), (7, 2), (11, 1), (16, 1)],
  term ((-8797615598806863390785 : Rat) / 19281494226115187343) [(2, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((8797615598806863390785 : Rat) / 38562988452230374686) [(2, 1), (5, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 74 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0074_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0074
        rs_R007_ueqv_R007NY_generator_29_0000_0099 =
      rs_R007_ueqv_R007NY_partial_29_0074 := by
  native_decide

/-- Coefficient term 75 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0075 : Poly :=
[
  term ((-1759523119761372678157 : Rat) / 12854329484076791562) [(2, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 75 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0075 : Poly :=
[
  term ((-1759523119761372678157 : Rat) / 6427164742038395781) [(2, 1), (5, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((1759523119761372678157 : Rat) / 12854329484076791562) [(2, 1), (5, 1), (6, 2), (15, 1), (16, 1)],
  term ((-1759523119761372678157 : Rat) / 6427164742038395781) [(2, 1), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((1759523119761372678157 : Rat) / 12854329484076791562) [(2, 1), (5, 1), (7, 2), (15, 1), (16, 1)],
  term ((1759523119761372678157 : Rat) / 6427164742038395781) [(2, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1759523119761372678157 : Rat) / 12854329484076791562) [(2, 1), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 75 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0075_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0075
        rs_R007_ueqv_R007NY_generator_29_0000_0099 =
      rs_R007_ueqv_R007NY_partial_29_0075 := by
  native_decide

/-- Coefficient term 76 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0076 : Poly :=
[
  term ((-20944235641494208729255 : Rat) / 944793217079644179807) [(2, 1), (7, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 76 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0076 : Poly :=
[
  term ((-41888471282988417458510 : Rat) / 944793217079644179807) [(2, 1), (6, 1), (7, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((20944235641494208729255 : Rat) / 944793217079644179807) [(2, 1), (6, 2), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((41888471282988417458510 : Rat) / 944793217079644179807) [(2, 1), (7, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-20944235641494208729255 : Rat) / 944793217079644179807) [(2, 1), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((-41888471282988417458510 : Rat) / 944793217079644179807) [(2, 1), (7, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((20944235641494208729255 : Rat) / 944793217079644179807) [(2, 1), (7, 3), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 76 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0076_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0076
        rs_R007_ueqv_R007NY_generator_29_0000_0099 =
      rs_R007_ueqv_R007NY_partial_29_0076 := by
  native_decide

/-- Coefficient term 77 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0077 : Poly :=
[
  term ((4188847128298841745851 : Rat) / 314931072359881393269) [(2, 1), (7, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 77 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0077 : Poly :=
[
  term ((8377694256597683491702 : Rat) / 314931072359881393269) [(2, 1), (6, 1), (7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4188847128298841745851 : Rat) / 314931072359881393269) [(2, 1), (6, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-8377694256597683491702 : Rat) / 314931072359881393269) [(2, 1), (7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((4188847128298841745851 : Rat) / 314931072359881393269) [(2, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((8377694256597683491702 : Rat) / 314931072359881393269) [(2, 1), (7, 2), (10, 1), (15, 2), (16, 1)],
  term ((-4188847128298841745851 : Rat) / 314931072359881393269) [(2, 1), (7, 3), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 77 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0077_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0077
        rs_R007_ueqv_R007NY_generator_29_0000_0099 =
      rs_R007_ueqv_R007NY_partial_29_0077 := by
  native_decide

/-- Coefficient term 78 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0078 : Poly :=
[
  term ((-20944235641494208729255 : Rat) / 944793217079644179807) [(2, 1), (7, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 78 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0078 : Poly :=
[
  term ((-41888471282988417458510 : Rat) / 944793217079644179807) [(2, 1), (6, 1), (7, 1), (11, 1), (14, 2), (16, 1)],
  term ((20944235641494208729255 : Rat) / 944793217079644179807) [(2, 1), (6, 2), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-20944235641494208729255 : Rat) / 944793217079644179807) [(2, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((41888471282988417458510 : Rat) / 944793217079644179807) [(2, 1), (7, 1), (11, 1), (14, 2), (16, 1)],
  term ((-41888471282988417458510 : Rat) / 944793217079644179807) [(2, 1), (7, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((20944235641494208729255 : Rat) / 944793217079644179807) [(2, 1), (7, 3), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 78 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0078_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0078
        rs_R007_ueqv_R007NY_generator_29_0000_0099 =
      rs_R007_ueqv_R007NY_partial_29_0078 := by
  native_decide

/-- Coefficient term 79 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0079 : Poly :=
[
  term ((-12148940023606557467095 : Rat) / 51069903625926712422) [(2, 1), (7, 1), (11, 1), (16, 1)]
]

/-- Partial product 79 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0079 : Poly :=
[
  term ((-12148940023606557467095 : Rat) / 25534951812963356211) [(2, 1), (6, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((12148940023606557467095 : Rat) / 51069903625926712422) [(2, 1), (6, 2), (7, 1), (11, 1), (16, 1)],
  term ((12148940023606557467095 : Rat) / 25534951812963356211) [(2, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-12148940023606557467095 : Rat) / 51069903625926712422) [(2, 1), (7, 1), (11, 1), (16, 1)],
  term ((-12148940023606557467095 : Rat) / 25534951812963356211) [(2, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((12148940023606557467095 : Rat) / 51069903625926712422) [(2, 1), (7, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 79 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0079_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0079
        rs_R007_ueqv_R007NY_generator_29_0000_0099 =
      rs_R007_ueqv_R007NY_partial_29_0079 := by
  native_decide

/-- Coefficient term 80 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0080 : Poly :=
[
  term ((4188847128298841745851 : Rat) / 314931072359881393269) [(2, 1), (7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 80 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0080 : Poly :=
[
  term ((8377694256597683491702 : Rat) / 314931072359881393269) [(2, 1), (6, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-4188847128298841745851 : Rat) / 314931072359881393269) [(2, 1), (6, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((4188847128298841745851 : Rat) / 314931072359881393269) [(2, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8377694256597683491702 : Rat) / 314931072359881393269) [(2, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((8377694256597683491702 : Rat) / 314931072359881393269) [(2, 1), (7, 2), (14, 1), (15, 2), (16, 1)],
  term ((-4188847128298841745851 : Rat) / 314931072359881393269) [(2, 1), (7, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 80 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0080_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0080
        rs_R007_ueqv_R007NY_generator_29_0000_0099 =
      rs_R007_ueqv_R007NY_partial_29_0080 := by
  native_decide

/-- Coefficient term 81 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0081 : Poly :=
[
  term ((817495246555389270017 : Rat) / 5674433736214079158) [(2, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 81 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0081 : Poly :=
[
  term ((817495246555389270017 : Rat) / 2837216868107039579) [(2, 1), (6, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-817495246555389270017 : Rat) / 5674433736214079158) [(2, 1), (6, 2), (7, 1), (15, 1), (16, 1)],
  term ((-817495246555389270017 : Rat) / 2837216868107039579) [(2, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((817495246555389270017 : Rat) / 5674433736214079158) [(2, 1), (7, 1), (15, 1), (16, 1)],
  term ((817495246555389270017 : Rat) / 2837216868107039579) [(2, 1), (7, 2), (15, 2), (16, 1)],
  term ((-817495246555389270017 : Rat) / 5674433736214079158) [(2, 1), (7, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 81 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0081_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0081
        rs_R007_ueqv_R007NY_generator_29_0000_0099 =
      rs_R007_ueqv_R007NY_partial_29_0081 := by
  native_decide

/-- Coefficient term 82 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0082 : Poly :=
[
  term ((-8377694256597683491702 : Rat) / 314931072359881393269) [(2, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 82 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0082 : Poly :=
[
  term ((-16755388513195366983404 : Rat) / 314931072359881393269) [(2, 1), (6, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((8377694256597683491702 : Rat) / 314931072359881393269) [(2, 1), (6, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-16755388513195366983404 : Rat) / 314931072359881393269) [(2, 1), (7, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((8377694256597683491702 : Rat) / 314931072359881393269) [(2, 1), (7, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((16755388513195366983404 : Rat) / 314931072359881393269) [(2, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8377694256597683491702 : Rat) / 314931072359881393269) [(2, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 82 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0082_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0082
        rs_R007_ueqv_R007NY_generator_29_0000_0099 =
      rs_R007_ueqv_R007NY_partial_29_0082 := by
  native_decide

/-- Coefficient term 83 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0083 : Poly :=
[
  term ((41888471282988417458510 : Rat) / 944793217079644179807) [(2, 1), (10, 1), (11, 2), (16, 1)]
]

/-- Partial product 83 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0083 : Poly :=
[
  term ((83776942565976834917020 : Rat) / 944793217079644179807) [(2, 1), (6, 1), (10, 1), (11, 2), (14, 1), (16, 1)],
  term ((-41888471282988417458510 : Rat) / 944793217079644179807) [(2, 1), (6, 2), (10, 1), (11, 2), (16, 1)],
  term ((83776942565976834917020 : Rat) / 944793217079644179807) [(2, 1), (7, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((-41888471282988417458510 : Rat) / 944793217079644179807) [(2, 1), (7, 2), (10, 1), (11, 2), (16, 1)],
  term ((-83776942565976834917020 : Rat) / 944793217079644179807) [(2, 1), (10, 1), (11, 2), (14, 1), (16, 1)],
  term ((41888471282988417458510 : Rat) / 944793217079644179807) [(2, 1), (10, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 83 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0083_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0083
        rs_R007_ueqv_R007NY_generator_29_0000_0099 =
      rs_R007_ueqv_R007NY_partial_29_0083 := by
  native_decide

/-- Coefficient term 84 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0084 : Poly :=
[
  term ((-84610492180825321164385 : Rat) / 944793217079644179807) [(2, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 84 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0084 : Poly :=
[
  term ((-169220984361650642328770 : Rat) / 944793217079644179807) [(2, 1), (6, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((84610492180825321164385 : Rat) / 944793217079644179807) [(2, 1), (6, 2), (11, 1), (13, 1), (16, 1)],
  term ((-169220984361650642328770 : Rat) / 944793217079644179807) [(2, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((84610492180825321164385 : Rat) / 944793217079644179807) [(2, 1), (7, 2), (11, 1), (13, 1), (16, 1)],
  term ((169220984361650642328770 : Rat) / 944793217079644179807) [(2, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-84610492180825321164385 : Rat) / 944793217079644179807) [(2, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 84 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0084_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0084
        rs_R007_ueqv_R007NY_generator_29_0000_0099 =
      rs_R007_ueqv_R007NY_partial_29_0084 := by
  native_decide

/-- Coefficient term 85 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0085 : Poly :=
[
  term ((-33228312183422734120502 : Rat) / 314931072359881393269) [(2, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 85 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0085 : Poly :=
[
  term ((-66456624366845468241004 : Rat) / 314931072359881393269) [(2, 1), (6, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((33228312183422734120502 : Rat) / 314931072359881393269) [(2, 1), (6, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-66456624366845468241004 : Rat) / 314931072359881393269) [(2, 1), (7, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((33228312183422734120502 : Rat) / 314931072359881393269) [(2, 1), (7, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-33228312183422734120502 : Rat) / 314931072359881393269) [(2, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((66456624366845468241004 : Rat) / 314931072359881393269) [(2, 1), (11, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 85 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0085_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0085
        rs_R007_ueqv_R007NY_generator_29_0000_0099 =
      rs_R007_ueqv_R007NY_partial_29_0085 := by
  native_decide

/-- Coefficient term 86 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0086 : Poly :=
[
  term ((-1143939422409966897682717 : Rat) / 7558345736637153438456) [(2, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 86 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0086 : Poly :=
[
  term ((-1143939422409966897682717 : Rat) / 3779172868318576719228) [(2, 1), (6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1143939422409966897682717 : Rat) / 7558345736637153438456) [(2, 1), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1143939422409966897682717 : Rat) / 3779172868318576719228) [(2, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((1143939422409966897682717 : Rat) / 7558345736637153438456) [(2, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((1143939422409966897682717 : Rat) / 3779172868318576719228) [(2, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1143939422409966897682717 : Rat) / 7558345736637153438456) [(2, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 86 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0086_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0086
        rs_R007_ueqv_R007NY_generator_29_0000_0099 =
      rs_R007_ueqv_R007NY_partial_29_0086 := by
  native_decide

/-- Coefficient term 87 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0087 : Poly :=
[
  term ((41888471282988417458510 : Rat) / 944793217079644179807) [(2, 1), (11, 2), (14, 1), (16, 1)]
]

/-- Partial product 87 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0087 : Poly :=
[
  term ((83776942565976834917020 : Rat) / 944793217079644179807) [(2, 1), (6, 1), (11, 2), (14, 2), (16, 1)],
  term ((-41888471282988417458510 : Rat) / 944793217079644179807) [(2, 1), (6, 2), (11, 2), (14, 1), (16, 1)],
  term ((83776942565976834917020 : Rat) / 944793217079644179807) [(2, 1), (7, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-41888471282988417458510 : Rat) / 944793217079644179807) [(2, 1), (7, 2), (11, 2), (14, 1), (16, 1)],
  term ((41888471282988417458510 : Rat) / 944793217079644179807) [(2, 1), (11, 2), (14, 1), (16, 1)],
  term ((-83776942565976834917020 : Rat) / 944793217079644179807) [(2, 1), (11, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 87 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0087_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0087
        rs_R007_ueqv_R007NY_generator_29_0000_0099 =
      rs_R007_ueqv_R007NY_partial_29_0087 := by
  native_decide

/-- Coefficient term 88 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0088 : Poly :=
[
  term ((-977629467118458242208095 : Rat) / 1889586434159288359614) [(2, 1), (11, 2), (16, 1)]
]

/-- Partial product 88 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0088 : Poly :=
[
  term ((-977629467118458242208095 : Rat) / 944793217079644179807) [(2, 1), (6, 1), (11, 2), (14, 1), (16, 1)],
  term ((977629467118458242208095 : Rat) / 1889586434159288359614) [(2, 1), (6, 2), (11, 2), (16, 1)],
  term ((-977629467118458242208095 : Rat) / 944793217079644179807) [(2, 1), (7, 1), (11, 2), (15, 1), (16, 1)],
  term ((977629467118458242208095 : Rat) / 1889586434159288359614) [(2, 1), (7, 2), (11, 2), (16, 1)],
  term ((977629467118458242208095 : Rat) / 944793217079644179807) [(2, 1), (11, 2), (14, 1), (16, 1)],
  term ((-977629467118458242208095 : Rat) / 1889586434159288359614) [(2, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 88 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0088_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0088
        rs_R007_ueqv_R007NY_generator_29_0000_0099 =
      rs_R007_ueqv_R007NY_partial_29_0088 := by
  native_decide

/-- Coefficient term 89 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0089 : Poly :=
[
  term ((16922098436165064232877 : Rat) / 314931072359881393269) [(2, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 89 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0089 : Poly :=
[
  term ((33844196872330128465754 : Rat) / 314931072359881393269) [(2, 1), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-16922098436165064232877 : Rat) / 314931072359881393269) [(2, 1), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((33844196872330128465754 : Rat) / 314931072359881393269) [(2, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-16922098436165064232877 : Rat) / 314931072359881393269) [(2, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-33844196872330128465754 : Rat) / 314931072359881393269) [(2, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((16922098436165064232877 : Rat) / 314931072359881393269) [(2, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 89 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0089_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0089
        rs_R007_ueqv_R007NY_generator_29_0000_0099 =
      rs_R007_ueqv_R007NY_partial_29_0089 := by
  native_decide

/-- Coefficient term 90 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0090 : Poly :=
[
  term ((710017655052144303680 : Rat) / 14996717731422923489) [(2, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 90 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0090 : Poly :=
[
  term ((1420035310104288607360 : Rat) / 14996717731422923489) [(2, 1), (6, 1), (14, 2), (15, 2), (16, 1)],
  term ((-710017655052144303680 : Rat) / 14996717731422923489) [(2, 1), (6, 2), (14, 1), (15, 2), (16, 1)],
  term ((1420035310104288607360 : Rat) / 14996717731422923489) [(2, 1), (7, 1), (14, 1), (15, 3), (16, 1)],
  term ((-710017655052144303680 : Rat) / 14996717731422923489) [(2, 1), (7, 2), (14, 1), (15, 2), (16, 1)],
  term ((710017655052144303680 : Rat) / 14996717731422923489) [(2, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 14996717731422923489) [(2, 1), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 90 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0090_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0090
        rs_R007_ueqv_R007NY_generator_29_0000_0099 =
      rs_R007_ueqv_R007NY_partial_29_0090 := by
  native_decide

/-- Coefficient term 91 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0091 : Poly :=
[
  term ((-2 : Rat) / 3) [(2, 1), (14, 1), (16, 1)]
]

/-- Partial product 91 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0091 : Poly :=
[
  term ((-4 : Rat) / 3) [(2, 1), (6, 1), (14, 2), (16, 1)],
  term ((2 : Rat) / 3) [(2, 1), (6, 2), (14, 1), (16, 1)],
  term ((-4 : Rat) / 3) [(2, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((2 : Rat) / 3) [(2, 1), (7, 2), (14, 1), (16, 1)],
  term ((-2 : Rat) / 3) [(2, 1), (14, 1), (16, 1)],
  term ((4 : Rat) / 3) [(2, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 91 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0091_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0091
        rs_R007_ueqv_R007NY_generator_29_0000_0099 =
      rs_R007_ueqv_R007NY_partial_29_0091 := by
  native_decide

/-- Coefficient term 92 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0092 : Poly :=
[
  term ((698050028698853335796429 : Rat) / 2519448578879051146152) [(2, 1), (15, 2), (16, 1)]
]

/-- Partial product 92 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0092 : Poly :=
[
  term ((698050028698853335796429 : Rat) / 1259724289439525573076) [(2, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((-698050028698853335796429 : Rat) / 2519448578879051146152) [(2, 1), (6, 2), (15, 2), (16, 1)],
  term ((698050028698853335796429 : Rat) / 1259724289439525573076) [(2, 1), (7, 1), (15, 3), (16, 1)],
  term ((-698050028698853335796429 : Rat) / 2519448578879051146152) [(2, 1), (7, 2), (15, 2), (16, 1)],
  term ((-698050028698853335796429 : Rat) / 1259724289439525573076) [(2, 1), (14, 1), (15, 2), (16, 1)],
  term ((698050028698853335796429 : Rat) / 2519448578879051146152) [(2, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 92 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0092_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0092
        rs_R007_ueqv_R007NY_generator_29_0000_0099 =
      rs_R007_ueqv_R007NY_partial_29_0092 := by
  native_decide

/-- Coefficient term 93 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0093 : Poly :=
[
  term ((-2 : Rat) / 3) [(2, 1), (16, 1)]
]

/-- Partial product 93 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0093 : Poly :=
[
  term ((-4 : Rat) / 3) [(2, 1), (6, 1), (14, 1), (16, 1)],
  term ((2 : Rat) / 3) [(2, 1), (6, 2), (16, 1)],
  term ((-4 : Rat) / 3) [(2, 1), (7, 1), (15, 1), (16, 1)],
  term ((2 : Rat) / 3) [(2, 1), (7, 2), (16, 1)],
  term ((4 : Rat) / 3) [(2, 1), (14, 1), (16, 1)],
  term ((-2 : Rat) / 3) [(2, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 93 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0093_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0093
        rs_R007_ueqv_R007NY_generator_29_0000_0099 =
      rs_R007_ueqv_R007NY_partial_29_0093 := by
  native_decide

/-- Coefficient term 94 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0094 : Poly :=
[
  term ((4307859669118472479360 : Rat) / 9354388287917269107) [(3, 1), (4, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 94 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0094 : Poly :=
[
  term ((8615719338236944958720 : Rat) / 9354388287917269107) [(3, 1), (4, 1), (6, 1), (11, 1), (14, 2), (16, 1)],
  term ((-4307859669118472479360 : Rat) / 9354388287917269107) [(3, 1), (4, 1), (6, 2), (11, 1), (14, 1), (16, 1)],
  term ((8615719338236944958720 : Rat) / 9354388287917269107) [(3, 1), (4, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4307859669118472479360 : Rat) / 9354388287917269107) [(3, 1), (4, 1), (7, 2), (11, 1), (14, 1), (16, 1)],
  term ((4307859669118472479360 : Rat) / 9354388287917269107) [(3, 1), (4, 1), (11, 1), (14, 1), (16, 1)],
  term ((-8615719338236944958720 : Rat) / 9354388287917269107) [(3, 1), (4, 1), (11, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 94 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0094_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0094
        rs_R007_ueqv_R007NY_generator_29_0000_0099 =
      rs_R007_ueqv_R007NY_partial_29_0094 := by
  native_decide

/-- Coefficient term 95 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0095 : Poly :=
[
  term ((-125861949583913607453775 : Rat) / 269940919165612622802) [(3, 1), (4, 1), (11, 1), (16, 1)]
]

/-- Partial product 95 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0095 : Poly :=
[
  term ((-125861949583913607453775 : Rat) / 134970459582806311401) [(3, 1), (4, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((125861949583913607453775 : Rat) / 269940919165612622802) [(3, 1), (4, 1), (6, 2), (11, 1), (16, 1)],
  term ((-125861949583913607453775 : Rat) / 134970459582806311401) [(3, 1), (4, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((125861949583913607453775 : Rat) / 269940919165612622802) [(3, 1), (4, 1), (7, 2), (11, 1), (16, 1)],
  term ((125861949583913607453775 : Rat) / 134970459582806311401) [(3, 1), (4, 1), (11, 1), (14, 1), (16, 1)],
  term ((-125861949583913607453775 : Rat) / 269940919165612622802) [(3, 1), (4, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 95 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0095_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0095
        rs_R007_ueqv_R007NY_generator_29_0000_0099 =
      rs_R007_ueqv_R007NY_partial_29_0095 := by
  native_decide

/-- Coefficient term 96 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0096 : Poly :=
[
  term ((-861571933823694495872 : Rat) / 3118129429305756369) [(3, 1), (4, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 96 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0096 : Poly :=
[
  term ((-1723143867647388991744 : Rat) / 3118129429305756369) [(3, 1), (4, 1), (6, 1), (14, 2), (15, 1), (16, 1)],
  term ((861571933823694495872 : Rat) / 3118129429305756369) [(3, 1), (4, 1), (6, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1723143867647388991744 : Rat) / 3118129429305756369) [(3, 1), (4, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((861571933823694495872 : Rat) / 3118129429305756369) [(3, 1), (4, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((-861571933823694495872 : Rat) / 3118129429305756369) [(3, 1), (4, 1), (14, 1), (15, 1), (16, 1)],
  term ((1723143867647388991744 : Rat) / 3118129429305756369) [(3, 1), (4, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 96 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0096_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0096
        rs_R007_ueqv_R007NY_generator_29_0000_0099 =
      rs_R007_ueqv_R007NY_partial_29_0096 := by
  native_decide

/-- Coefficient term 97 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0097 : Poly :=
[
  term ((25172389916782721490755 : Rat) / 89980306388537540934) [(3, 1), (4, 1), (15, 1), (16, 1)]
]

/-- Partial product 97 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0097 : Poly :=
[
  term ((25172389916782721490755 : Rat) / 44990153194268770467) [(3, 1), (4, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-25172389916782721490755 : Rat) / 89980306388537540934) [(3, 1), (4, 1), (6, 2), (15, 1), (16, 1)],
  term ((25172389916782721490755 : Rat) / 44990153194268770467) [(3, 1), (4, 1), (7, 1), (15, 2), (16, 1)],
  term ((-25172389916782721490755 : Rat) / 89980306388537540934) [(3, 1), (4, 1), (7, 2), (15, 1), (16, 1)],
  term ((-25172389916782721490755 : Rat) / 44990153194268770467) [(3, 1), (4, 1), (14, 1), (15, 1), (16, 1)],
  term ((25172389916782721490755 : Rat) / 89980306388537540934) [(3, 1), (4, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 97 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0097_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0097
        rs_R007_ueqv_R007NY_generator_29_0000_0099 =
      rs_R007_ueqv_R007NY_partial_29_0097 := by
  native_decide

/-- Coefficient term 98 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0098 : Poly :=
[
  term ((423298684866843370247480 : Rat) / 944793217079644179807) [(3, 1), (5, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 98 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0098 : Poly :=
[
  term ((846597369733686740494960 : Rat) / 944793217079644179807) [(3, 1), (5, 1), (6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-423298684866843370247480 : Rat) / 944793217079644179807) [(3, 1), (5, 1), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((846597369733686740494960 : Rat) / 944793217079644179807) [(3, 1), (5, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-423298684866843370247480 : Rat) / 944793217079644179807) [(3, 1), (5, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-846597369733686740494960 : Rat) / 944793217079644179807) [(3, 1), (5, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((423298684866843370247480 : Rat) / 944793217079644179807) [(3, 1), (5, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 98 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0098_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0098
        rs_R007_ueqv_R007NY_generator_29_0000_0099 =
      rs_R007_ueqv_R007NY_partial_29_0098 := by
  native_decide

/-- Coefficient term 99 from coefficient polynomial 29. -/
def rs_R007_ueqv_R007NY_coefficient_29_0099 : Poly :=
[
  term ((19658569523537250279800 : Rat) / 944793217079644179807) [(3, 1), (5, 1), (11, 2), (16, 1)]
]

/-- Partial product 99 for generator 29. -/
def rs_R007_ueqv_R007NY_partial_29_0099 : Poly :=
[
  term ((39317139047074500559600 : Rat) / 944793217079644179807) [(3, 1), (5, 1), (6, 1), (11, 2), (14, 1), (16, 1)],
  term ((-19658569523537250279800 : Rat) / 944793217079644179807) [(3, 1), (5, 1), (6, 2), (11, 2), (16, 1)],
  term ((39317139047074500559600 : Rat) / 944793217079644179807) [(3, 1), (5, 1), (7, 1), (11, 2), (15, 1), (16, 1)],
  term ((-19658569523537250279800 : Rat) / 944793217079644179807) [(3, 1), (5, 1), (7, 2), (11, 2), (16, 1)],
  term ((-39317139047074500559600 : Rat) / 944793217079644179807) [(3, 1), (5, 1), (11, 2), (14, 1), (16, 1)],
  term ((19658569523537250279800 : Rat) / 944793217079644179807) [(3, 1), (5, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 99 for generator 29. -/
theorem rs_R007_ueqv_R007NY_partial_29_0099_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_29_0099
        rs_R007_ueqv_R007NY_generator_29_0000_0099 =
      rs_R007_ueqv_R007NY_partial_29_0099 := by
  native_decide

/-- Partial products in this block. -/
def rs_R007_ueqv_R007NY_partials_29_0000_0099 : List Poly :=
[
  rs_R007_ueqv_R007NY_partial_29_0000,
  rs_R007_ueqv_R007NY_partial_29_0001,
  rs_R007_ueqv_R007NY_partial_29_0002,
  rs_R007_ueqv_R007NY_partial_29_0003,
  rs_R007_ueqv_R007NY_partial_29_0004,
  rs_R007_ueqv_R007NY_partial_29_0005,
  rs_R007_ueqv_R007NY_partial_29_0006,
  rs_R007_ueqv_R007NY_partial_29_0007,
  rs_R007_ueqv_R007NY_partial_29_0008,
  rs_R007_ueqv_R007NY_partial_29_0009,
  rs_R007_ueqv_R007NY_partial_29_0010,
  rs_R007_ueqv_R007NY_partial_29_0011,
  rs_R007_ueqv_R007NY_partial_29_0012,
  rs_R007_ueqv_R007NY_partial_29_0013,
  rs_R007_ueqv_R007NY_partial_29_0014,
  rs_R007_ueqv_R007NY_partial_29_0015,
  rs_R007_ueqv_R007NY_partial_29_0016,
  rs_R007_ueqv_R007NY_partial_29_0017,
  rs_R007_ueqv_R007NY_partial_29_0018,
  rs_R007_ueqv_R007NY_partial_29_0019,
  rs_R007_ueqv_R007NY_partial_29_0020,
  rs_R007_ueqv_R007NY_partial_29_0021,
  rs_R007_ueqv_R007NY_partial_29_0022,
  rs_R007_ueqv_R007NY_partial_29_0023,
  rs_R007_ueqv_R007NY_partial_29_0024,
  rs_R007_ueqv_R007NY_partial_29_0025,
  rs_R007_ueqv_R007NY_partial_29_0026,
  rs_R007_ueqv_R007NY_partial_29_0027,
  rs_R007_ueqv_R007NY_partial_29_0028,
  rs_R007_ueqv_R007NY_partial_29_0029,
  rs_R007_ueqv_R007NY_partial_29_0030,
  rs_R007_ueqv_R007NY_partial_29_0031,
  rs_R007_ueqv_R007NY_partial_29_0032,
  rs_R007_ueqv_R007NY_partial_29_0033,
  rs_R007_ueqv_R007NY_partial_29_0034,
  rs_R007_ueqv_R007NY_partial_29_0035,
  rs_R007_ueqv_R007NY_partial_29_0036,
  rs_R007_ueqv_R007NY_partial_29_0037,
  rs_R007_ueqv_R007NY_partial_29_0038,
  rs_R007_ueqv_R007NY_partial_29_0039,
  rs_R007_ueqv_R007NY_partial_29_0040,
  rs_R007_ueqv_R007NY_partial_29_0041,
  rs_R007_ueqv_R007NY_partial_29_0042,
  rs_R007_ueqv_R007NY_partial_29_0043,
  rs_R007_ueqv_R007NY_partial_29_0044,
  rs_R007_ueqv_R007NY_partial_29_0045,
  rs_R007_ueqv_R007NY_partial_29_0046,
  rs_R007_ueqv_R007NY_partial_29_0047,
  rs_R007_ueqv_R007NY_partial_29_0048,
  rs_R007_ueqv_R007NY_partial_29_0049,
  rs_R007_ueqv_R007NY_partial_29_0050,
  rs_R007_ueqv_R007NY_partial_29_0051,
  rs_R007_ueqv_R007NY_partial_29_0052,
  rs_R007_ueqv_R007NY_partial_29_0053,
  rs_R007_ueqv_R007NY_partial_29_0054,
  rs_R007_ueqv_R007NY_partial_29_0055,
  rs_R007_ueqv_R007NY_partial_29_0056,
  rs_R007_ueqv_R007NY_partial_29_0057,
  rs_R007_ueqv_R007NY_partial_29_0058,
  rs_R007_ueqv_R007NY_partial_29_0059,
  rs_R007_ueqv_R007NY_partial_29_0060,
  rs_R007_ueqv_R007NY_partial_29_0061,
  rs_R007_ueqv_R007NY_partial_29_0062,
  rs_R007_ueqv_R007NY_partial_29_0063,
  rs_R007_ueqv_R007NY_partial_29_0064,
  rs_R007_ueqv_R007NY_partial_29_0065,
  rs_R007_ueqv_R007NY_partial_29_0066,
  rs_R007_ueqv_R007NY_partial_29_0067,
  rs_R007_ueqv_R007NY_partial_29_0068,
  rs_R007_ueqv_R007NY_partial_29_0069,
  rs_R007_ueqv_R007NY_partial_29_0070,
  rs_R007_ueqv_R007NY_partial_29_0071,
  rs_R007_ueqv_R007NY_partial_29_0072,
  rs_R007_ueqv_R007NY_partial_29_0073,
  rs_R007_ueqv_R007NY_partial_29_0074,
  rs_R007_ueqv_R007NY_partial_29_0075,
  rs_R007_ueqv_R007NY_partial_29_0076,
  rs_R007_ueqv_R007NY_partial_29_0077,
  rs_R007_ueqv_R007NY_partial_29_0078,
  rs_R007_ueqv_R007NY_partial_29_0079,
  rs_R007_ueqv_R007NY_partial_29_0080,
  rs_R007_ueqv_R007NY_partial_29_0081,
  rs_R007_ueqv_R007NY_partial_29_0082,
  rs_R007_ueqv_R007NY_partial_29_0083,
  rs_R007_ueqv_R007NY_partial_29_0084,
  rs_R007_ueqv_R007NY_partial_29_0085,
  rs_R007_ueqv_R007NY_partial_29_0086,
  rs_R007_ueqv_R007NY_partial_29_0087,
  rs_R007_ueqv_R007NY_partial_29_0088,
  rs_R007_ueqv_R007NY_partial_29_0089,
  rs_R007_ueqv_R007NY_partial_29_0090,
  rs_R007_ueqv_R007NY_partial_29_0091,
  rs_R007_ueqv_R007NY_partial_29_0092,
  rs_R007_ueqv_R007NY_partial_29_0093,
  rs_R007_ueqv_R007NY_partial_29_0094,
  rs_R007_ueqv_R007NY_partial_29_0095,
  rs_R007_ueqv_R007NY_partial_29_0096,
  rs_R007_ueqv_R007NY_partial_29_0097,
  rs_R007_ueqv_R007NY_partial_29_0098,
  rs_R007_ueqv_R007NY_partial_29_0099
]

/-- Sum of partial products in this block. -/
def rs_R007_ueqv_R007NY_block_29_0000_0099 : Poly :=
[
  term ((-3827375014604428415900 : Rat) / 14996717731422923489) [(0, 1), (1, 1), (4, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((2296425008762657049540 : Rat) / 14996717731422923489) [(0, 1), (1, 1), (4, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((1913687507302214207950 : Rat) / 14996717731422923489) [(0, 1), (1, 1), (4, 1), (6, 2), (11, 1), (16, 1)],
  term ((-1148212504381328524770 : Rat) / 14996717731422923489) [(0, 1), (1, 1), (4, 1), (6, 2), (15, 1), (16, 1)],
  term ((-3827375014604428415900 : Rat) / 14996717731422923489) [(0, 1), (1, 1), (4, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((2296425008762657049540 : Rat) / 14996717731422923489) [(0, 1), (1, 1), (4, 1), (7, 1), (15, 2), (16, 1)],
  term ((1913687507302214207950 : Rat) / 14996717731422923489) [(0, 1), (1, 1), (4, 1), (7, 2), (11, 1), (16, 1)],
  term ((-1148212504381328524770 : Rat) / 14996717731422923489) [(0, 1), (1, 1), (4, 1), (7, 2), (15, 1), (16, 1)],
  term ((3827375014604428415900 : Rat) / 14996717731422923489) [(0, 1), (1, 1), (4, 1), (11, 1), (14, 1), (16, 1)],
  term ((-1913687507302214207950 : Rat) / 14996717731422923489) [(0, 1), (1, 1), (4, 1), (11, 1), (16, 1)],
  term ((-2296425008762657049540 : Rat) / 14996717731422923489) [(0, 1), (1, 1), (4, 1), (14, 1), (15, 1), (16, 1)],
  term ((1148212504381328524770 : Rat) / 14996717731422923489) [(0, 1), (1, 1), (4, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(0, 1), (1, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term (8 : Rat) [(0, 1), (1, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(0, 1), (1, 1), (6, 2), (11, 1), (16, 1)],
  term (-4 : Rat) [(0, 1), (1, 1), (6, 2), (15, 1), (16, 1)],
  term (-8 : Rat) [(0, 1), (1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(0, 1), (1, 1), (7, 1), (15, 2), (16, 1)],
  term (4 : Rat) [(0, 1), (1, 1), (7, 2), (11, 1), (16, 1)],
  term (-4 : Rat) [(0, 1), (1, 1), (7, 2), (15, 1), (16, 1)],
  term (8 : Rat) [(0, 1), (1, 1), (11, 1), (14, 1), (16, 1)],
  term (-4 : Rat) [(0, 1), (1, 1), (11, 1), (16, 1)],
  term (-8 : Rat) [(0, 1), (1, 1), (14, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(0, 1), (1, 1), (15, 1), (16, 1)],
  term ((423298684866843370247480 : Rat) / 944793217079644179807) [(0, 1), (3, 1), (4, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((-84659736973368674049496 : Rat) / 314931072359881393269) [(0, 1), (3, 1), (4, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-211649342433421685123740 : Rat) / 944793217079644179807) [(0, 1), (3, 1), (4, 1), (6, 2), (11, 1), (16, 1)],
  term ((42329868486684337024748 : Rat) / 314931072359881393269) [(0, 1), (3, 1), (4, 1), (6, 2), (15, 1), (16, 1)],
  term ((423298684866843370247480 : Rat) / 944793217079644179807) [(0, 1), (3, 1), (4, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-84659736973368674049496 : Rat) / 314931072359881393269) [(0, 1), (3, 1), (4, 1), (7, 1), (15, 2), (16, 1)],
  term ((-211649342433421685123740 : Rat) / 944793217079644179807) [(0, 1), (3, 1), (4, 1), (7, 2), (11, 1), (16, 1)],
  term ((42329868486684337024748 : Rat) / 314931072359881393269) [(0, 1), (3, 1), (4, 1), (7, 2), (15, 1), (16, 1)],
  term ((-423298684866843370247480 : Rat) / 944793217079644179807) [(0, 1), (3, 1), (4, 1), (11, 1), (14, 1), (16, 1)],
  term ((211649342433421685123740 : Rat) / 944793217079644179807) [(0, 1), (3, 1), (4, 1), (11, 1), (16, 1)],
  term ((84659736973368674049496 : Rat) / 314931072359881393269) [(0, 1), (3, 1), (4, 1), (14, 1), (15, 1), (16, 1)],
  term ((-42329868486684337024748 : Rat) / 314931072359881393269) [(0, 1), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((-780909675804674808505490 : Rat) / 944793217079644179807) [(0, 1), (3, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((-412134446239876979346095 : Rat) / 944793217079644179807) [(0, 1), (3, 1), (6, 1), (11, 1), (14, 2), (16, 1)],
  term ((52620522515618109710622 : Rat) / 104977024119960464423) [(0, 1), (3, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((82426889247975395869219 : Rat) / 314931072359881393269) [(0, 1), (3, 1), (6, 1), (14, 2), (15, 1), (16, 1)],
  term ((412134446239876979346095 : Rat) / 1889586434159288359614) [(0, 1), (3, 1), (6, 2), (11, 1), (14, 1), (16, 1)],
  term ((390454837902337404252745 : Rat) / 944793217079644179807) [(0, 1), (3, 1), (6, 2), (11, 1), (16, 1)],
  term ((-82426889247975395869219 : Rat) / 629862144719762786538) [(0, 1), (3, 1), (6, 2), (14, 1), (15, 1), (16, 1)],
  term ((-26310261257809054855311 : Rat) / 104977024119960464423) [(0, 1), (3, 1), (6, 2), (15, 1), (16, 1)],
  term ((-412134446239876979346095 : Rat) / 944793217079644179807) [(0, 1), (3, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-780909675804674808505490 : Rat) / 944793217079644179807) [(0, 1), (3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((82426889247975395869219 : Rat) / 314931072359881393269) [(0, 1), (3, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((52620522515618109710622 : Rat) / 104977024119960464423) [(0, 1), (3, 1), (7, 1), (15, 2), (16, 1)],
  term ((412134446239876979346095 : Rat) / 1889586434159288359614) [(0, 1), (3, 1), (7, 2), (11, 1), (14, 1), (16, 1)],
  term ((390454837902337404252745 : Rat) / 944793217079644179807) [(0, 1), (3, 1), (7, 2), (11, 1), (16, 1)],
  term ((-82426889247975395869219 : Rat) / 629862144719762786538) [(0, 1), (3, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((-26310261257809054855311 : Rat) / 104977024119960464423) [(0, 1), (3, 1), (7, 2), (15, 1), (16, 1)],
  term ((1149684905369472637664885 : Rat) / 1889586434159288359614) [(0, 1), (3, 1), (11, 1), (14, 1), (16, 1)],
  term ((412134446239876979346095 : Rat) / 944793217079644179807) [(0, 1), (3, 1), (11, 1), (14, 2), (16, 1)],
  term ((-390454837902337404252745 : Rat) / 944793217079644179807) [(0, 1), (3, 1), (11, 1), (16, 1)],
  term ((-233296245845733262394513 : Rat) / 629862144719762786538) [(0, 1), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-82426889247975395869219 : Rat) / 314931072359881393269) [(0, 1), (3, 1), (14, 2), (15, 1), (16, 1)],
  term ((26310261257809054855311 : Rat) / 104977024119960464423) [(0, 1), (3, 1), (15, 1), (16, 1)],
  term ((332211655393461180224590 : Rat) / 944793217079644179807) [(0, 1), (4, 1), (6, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-66442331078692236044918 : Rat) / 314931072359881393269) [(0, 1), (4, 1), (6, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((169319473946737348098992 : Rat) / 314931072359881393269) [(0, 1), (4, 1), (6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-846597369733686740494960 : Rat) / 944793217079644179807) [(0, 1), (4, 1), (6, 1), (11, 2), (14, 1), (16, 1)],
  term ((-166105827696730590112295 : Rat) / 944793217079644179807) [(0, 1), (4, 1), (6, 2), (7, 1), (11, 1), (16, 1)],
  term ((33221165539346118022459 : Rat) / 314931072359881393269) [(0, 1), (4, 1), (6, 2), (7, 1), (15, 1), (16, 1)],
  term ((-84659736973368674049496 : Rat) / 314931072359881393269) [(0, 1), (4, 1), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((423298684866843370247480 : Rat) / 944793217079644179807) [(0, 1), (4, 1), (6, 2), (11, 2), (16, 1)],
  term ((-332211655393461180224590 : Rat) / 944793217079644179807) [(0, 1), (4, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((169319473946737348098992 : Rat) / 314931072359881393269) [(0, 1), (4, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((166105827696730590112295 : Rat) / 944793217079644179807) [(0, 1), (4, 1), (7, 1), (11, 1), (16, 1)],
  term ((-846597369733686740494960 : Rat) / 944793217079644179807) [(0, 1), (4, 1), (7, 1), (11, 2), (15, 1), (16, 1)],
  term ((66442331078692236044918 : Rat) / 314931072359881393269) [(0, 1), (4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-33221165539346118022459 : Rat) / 314931072359881393269) [(0, 1), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((78232444473355158076102 : Rat) / 944793217079644179807) [(0, 1), (4, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((423298684866843370247480 : Rat) / 944793217079644179807) [(0, 1), (4, 1), (7, 2), (11, 2), (16, 1)],
  term ((-66442331078692236044918 : Rat) / 314931072359881393269) [(0, 1), (4, 1), (7, 2), (15, 2), (16, 1)],
  term ((-166105827696730590112295 : Rat) / 944793217079644179807) [(0, 1), (4, 1), (7, 3), (11, 1), (16, 1)],
  term ((33221165539346118022459 : Rat) / 314931072359881393269) [(0, 1), (4, 1), (7, 3), (15, 1), (16, 1)],
  term ((-169319473946737348098992 : Rat) / 314931072359881393269) [(0, 1), (4, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((84659736973368674049496 : Rat) / 314931072359881393269) [(0, 1), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((846597369733686740494960 : Rat) / 944793217079644179807) [(0, 1), (4, 1), (11, 2), (14, 1), (16, 1)],
  term ((-423298684866843370247480 : Rat) / 944793217079644179807) [(0, 1), (4, 1), (11, 2), (16, 1)],
  term ((-19658569523537250279800 : Rat) / 944793217079644179807) [(0, 1), (5, 1), (6, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-83277058475894061268135 : Rat) / 944793217079644179807) [(0, 1), (5, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((3931713904707450055960 : Rat) / 314931072359881393269) [(0, 1), (5, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((16655411695178812253627 : Rat) / 314931072359881393269) [(0, 1), (5, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((9829284761768625139900 : Rat) / 944793217079644179807) [(0, 1), (5, 1), (6, 2), (11, 1), (12, 1), (16, 1)],
  term ((83277058475894061268135 : Rat) / 1889586434159288359614) [(0, 1), (5, 1), (6, 2), (11, 1), (16, 1)],
  term ((-1965856952353725027980 : Rat) / 314931072359881393269) [(0, 1), (5, 1), (6, 2), (12, 1), (15, 1), (16, 1)],
  term ((-16655411695178812253627 : Rat) / 629862144719762786538) [(0, 1), (5, 1), (6, 2), (15, 1), (16, 1)],
  term ((-19658569523537250279800 : Rat) / 944793217079644179807) [(0, 1), (5, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-83277058475894061268135 : Rat) / 944793217079644179807) [(0, 1), (5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((3931713904707450055960 : Rat) / 314931072359881393269) [(0, 1), (5, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((16655411695178812253627 : Rat) / 314931072359881393269) [(0, 1), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((9829284761768625139900 : Rat) / 944793217079644179807) [(0, 1), (5, 1), (7, 2), (11, 1), (12, 1), (16, 1)],
  term ((83277058475894061268135 : Rat) / 1889586434159288359614) [(0, 1), (5, 1), (7, 2), (11, 1), (16, 1)],
  term ((-1965856952353725027980 : Rat) / 314931072359881393269) [(0, 1), (5, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((-16655411695178812253627 : Rat) / 629862144719762786538) [(0, 1), (5, 1), (7, 2), (15, 1), (16, 1)],
  term ((19658569523537250279800 : Rat) / 944793217079644179807) [(0, 1), (5, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-9829284761768625139900 : Rat) / 944793217079644179807) [(0, 1), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((83277058475894061268135 : Rat) / 944793217079644179807) [(0, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-83277058475894061268135 : Rat) / 1889586434159288359614) [(0, 1), (5, 1), (11, 1), (16, 1)],
  term ((-3931713904707450055960 : Rat) / 314931072359881393269) [(0, 1), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1965856952353725027980 : Rat) / 314931072359881393269) [(0, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-16655411695178812253627 : Rat) / 314931072359881393269) [(0, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((16655411695178812253627 : Rat) / 629862144719762786538) [(0, 1), (5, 1), (15, 1), (16, 1)],
  term ((-42610819891296054514329 : Rat) / 14996717731422923489) [(0, 1), (6, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-1421913669443616788155 : Rat) / 1502055988997844483) [(0, 1), (6, 1), (7, 1), (11, 1), (14, 2), (16, 1)],
  term ((25542497186407356031015 : Rat) / 14996717731422923489) [(0, 1), (6, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((284382733888723357631 : Rat) / 500685329665948161) [(0, 1), (6, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 44990153194268770467) [(0, 1), (6, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 134970459582806311401) [(0, 1), (6, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-25001025374666326487330 : Rat) / 104977024119960464423) [(0, 1), (6, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((487680359111792754284359 : Rat) / 59986870925691693956) [(0, 1), (6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-146726789493329793256339 : Rat) / 104977024119960464423) [(0, 1), (6, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-4219271569570705050245645 : Rat) / 944793217079644179807) [(0, 1), (6, 1), (11, 2), (14, 1), (16, 1)],
  term ((733633947466648966281695 : Rat) / 314931072359881393269) [(0, 1), (6, 1), (11, 2), (14, 2), (16, 1)],
  term ((1420035310104288607360 : Rat) / 14996717731422923489) [(0, 1), (6, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-710017655052144303680 : Rat) / 44990153194268770467) [(0, 1), (6, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1 : Rat) / 3) [(0, 1), (6, 1), (12, 1), (14, 1), (16, 1)],
  term ((15000615224799795892398 : Rat) / 104977024119960464423) [(0, 1), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1374517763046952253899619 : Rat) / 419908096479841857692) [(0, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((1421913669443616788155 : Rat) / 3004111977995688966) [(0, 1), (6, 2), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((42610819891296054514329 : Rat) / 29993435462845846978) [(0, 1), (6, 2), (7, 1), (11, 1), (16, 1)],
  term ((-284382733888723357631 : Rat) / 1001370659331896322) [(0, 1), (6, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-25542497186407356031015 : Rat) / 29993435462845846978) [(0, 1), (6, 2), (7, 1), (15, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(0, 1), (6, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1775044137630360759200 : Rat) / 134970459582806311401) [(0, 1), (6, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((12500512687333163243665 : Rat) / 104977024119960464423) [(0, 1), (6, 2), (11, 1), (13, 1), (16, 1)],
  term ((146726789493329793256339 : Rat) / 209954048239920928846) [(0, 1), (6, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-487680359111792754284359 : Rat) / 119973741851383387912) [(0, 1), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((-733633947466648966281695 : Rat) / 629862144719762786538) [(0, 1), (6, 2), (11, 2), (14, 1), (16, 1)],
  term ((4219271569570705050245645 : Rat) / 1889586434159288359614) [(0, 1), (6, 2), (11, 2), (16, 1)],
  term ((-710017655052144303680 : Rat) / 14996717731422923489) [(0, 1), (6, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((355008827526072151840 : Rat) / 44990153194268770467) [(0, 1), (6, 2), (12, 1), (15, 2), (16, 1)],
  term ((1 : Rat) / 6) [(0, 1), (6, 2), (12, 1), (16, 1)],
  term ((-7500307612399897946199 : Rat) / 104977024119960464423) [(0, 1), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((1374517763046952253899619 : Rat) / 839816192959683715384) [(0, 1), (6, 2), (15, 2), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 44990153194268770467) [(0, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 134970459582806311401) [(0, 1), (7, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-25001025374666326487330 : Rat) / 104977024119960464423) [(0, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-146726789493329793256339 : Rat) / 104977024119960464423) [(0, 1), (7, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((4474579608223267909055959 : Rat) / 1889586434159288359614) [(0, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((1421913669443616788155 : Rat) / 1502055988997844483) [(0, 1), (7, 1), (11, 1), (14, 2), (16, 1)],
  term ((487680359111792754284359 : Rat) / 59986870925691693956) [(0, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-42610819891296054514329 : Rat) / 29993435462845846978) [(0, 1), (7, 1), (11, 1), (16, 1)],
  term ((733633947466648966281695 : Rat) / 314931072359881393269) [(0, 1), (7, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-4219271569570705050245645 : Rat) / 944793217079644179807) [(0, 1), (7, 1), (11, 2), (15, 1), (16, 1)],
  term ((1420035310104288607360 : Rat) / 14996717731422923489) [(0, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1 : Rat) / 3) [(0, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-710017655052144303680 : Rat) / 44990153194268770467) [(0, 1), (7, 1), (12, 1), (15, 3), (16, 1)],
  term ((15000615224799795892398 : Rat) / 104977024119960464423) [(0, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-893908142213101961352731 : Rat) / 629862144719762786538) [(0, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-284382733888723357631 : Rat) / 500685329665948161) [(0, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((25542497186407356031015 : Rat) / 29993435462845846978) [(0, 1), (7, 1), (15, 1), (16, 1)],
  term ((-1374517763046952253899619 : Rat) / 419908096479841857692) [(0, 1), (7, 1), (15, 3), (16, 1)],
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(0, 1), (7, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1775044137630360759200 : Rat) / 134970459582806311401) [(0, 1), (7, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((12500512687333163243665 : Rat) / 104977024119960464423) [(0, 1), (7, 2), (11, 1), (13, 1), (16, 1)],
  term ((-468226290720101780191939 : Rat) / 1889586434159288359614) [(0, 1), (7, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-828566918242161190398991 : Rat) / 119973741851383387912) [(0, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-733633947466648966281695 : Rat) / 629862144719762786538) [(0, 1), (7, 2), (11, 2), (14, 1), (16, 1)],
  term ((4219271569570705050245645 : Rat) / 1889586434159288359614) [(0, 1), (7, 2), (11, 2), (16, 1)],
  term ((-710017655052144303680 : Rat) / 14996717731422923489) [(0, 1), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((355008827526072151840 : Rat) / 44990153194268770467) [(0, 1), (7, 2), (12, 1), (15, 2), (16, 1)],
  term ((1 : Rat) / 6) [(0, 1), (7, 2), (12, 1), (16, 1)],
  term ((-7500307612399897946199 : Rat) / 104977024119960464423) [(0, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((284382733888723357631 : Rat) / 500685329665948161) [(0, 1), (7, 2), (14, 1), (15, 2), (16, 1)],
  term ((2804897605485764191636459 : Rat) / 839816192959683715384) [(0, 1), (7, 2), (15, 2), (16, 1)],
  term ((1421913669443616788155 : Rat) / 3004111977995688966) [(0, 1), (7, 3), (11, 1), (14, 1), (16, 1)],
  term ((42610819891296054514329 : Rat) / 29993435462845846978) [(0, 1), (7, 3), (11, 1), (16, 1)],
  term ((-284382733888723357631 : Rat) / 1001370659331896322) [(0, 1), (7, 3), (14, 1), (15, 1), (16, 1)],
  term ((-25542497186407356031015 : Rat) / 29993435462845846978) [(0, 1), (7, 3), (15, 1), (16, 1)],
  term ((7100176550521443036800 : Rat) / 44990153194268770467) [(0, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(0, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 134970459582806311401) [(0, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1775044137630360759200 : Rat) / 134970459582806311401) [(0, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((25001025374666326487330 : Rat) / 104977024119960464423) [(0, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-12500512687333163243665 : Rat) / 104977024119960464423) [(0, 1), (11, 1), (13, 1), (16, 1)],
  term ((-3707216092769208866503191 : Rat) / 419908096479841857692) [(0, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((146726789493329793256339 : Rat) / 104977024119960464423) [(0, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((487680359111792754284359 : Rat) / 119973741851383387912) [(0, 1), (11, 1), (15, 1), (16, 1)],
  term ((105341039421201554448875 : Rat) / 18708776575834538214) [(0, 1), (11, 2), (14, 1), (16, 1)],
  term ((-733633947466648966281695 : Rat) / 314931072359881393269) [(0, 1), (11, 2), (14, 2), (16, 1)],
  term ((-4219271569570705050245645 : Rat) / 1889586434159288359614) [(0, 1), (11, 2), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 14996717731422923489) [(0, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((710017655052144303680 : Rat) / 14996717731422923489) [(0, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((710017655052144303680 : Rat) / 44990153194268770467) [(0, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((1 : Rat) / 3) [(0, 1), (12, 1), (14, 1), (16, 1)],
  term ((-355008827526072151840 : Rat) / 44990153194268770467) [(0, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1 : Rat) / 6) [(0, 1), (12, 1), (16, 1)],
  term ((-15000615224799795892398 : Rat) / 104977024119960464423) [(0, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((7500307612399897946199 : Rat) / 104977024119960464423) [(0, 1), (13, 1), (15, 1), (16, 1)],
  term ((1374517763046952253899619 : Rat) / 419908096479841857692) [(0, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1374517763046952253899619 : Rat) / 839816192959683715384) [(0, 1), (15, 2), (16, 1)],
  term ((780909675804674808505490 : Rat) / 944793217079644179807) [(1, 1), (2, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((-52620522515618109710622 : Rat) / 104977024119960464423) [(1, 1), (2, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-390454837902337404252745 : Rat) / 944793217079644179807) [(1, 1), (2, 1), (6, 2), (11, 1), (16, 1)],
  term ((26310261257809054855311 : Rat) / 104977024119960464423) [(1, 1), (2, 1), (6, 2), (15, 1), (16, 1)],
  term ((780909675804674808505490 : Rat) / 944793217079644179807) [(1, 1), (2, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-52620522515618109710622 : Rat) / 104977024119960464423) [(1, 1), (2, 1), (7, 1), (15, 2), (16, 1)],
  term ((-390454837902337404252745 : Rat) / 944793217079644179807) [(1, 1), (2, 1), (7, 2), (11, 1), (16, 1)],
  term ((26310261257809054855311 : Rat) / 104977024119960464423) [(1, 1), (2, 1), (7, 2), (15, 1), (16, 1)],
  term ((-780909675804674808505490 : Rat) / 944793217079644179807) [(1, 1), (2, 1), (11, 1), (14, 1), (16, 1)],
  term ((390454837902337404252745 : Rat) / 944793217079644179807) [(1, 1), (2, 1), (11, 1), (16, 1)],
  term ((52620522515618109710622 : Rat) / 104977024119960464423) [(1, 1), (2, 1), (14, 1), (15, 1), (16, 1)],
  term ((-26310261257809054855311 : Rat) / 104977024119960464423) [(1, 1), (2, 1), (15, 1), (16, 1)],
  term ((423298684866843370247480 : Rat) / 944793217079644179807) [(1, 1), (3, 1), (5, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((-84659736973368674049496 : Rat) / 314931072359881393269) [(1, 1), (3, 1), (5, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-211649342433421685123740 : Rat) / 944793217079644179807) [(1, 1), (3, 1), (5, 1), (6, 2), (11, 1), (16, 1)],
  term ((42329868486684337024748 : Rat) / 314931072359881393269) [(1, 1), (3, 1), (5, 1), (6, 2), (15, 1), (16, 1)],
  term ((423298684866843370247480 : Rat) / 944793217079644179807) [(1, 1), (3, 1), (5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-84659736973368674049496 : Rat) / 314931072359881393269) [(1, 1), (3, 1), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((-211649342433421685123740 : Rat) / 944793217079644179807) [(1, 1), (3, 1), (5, 1), (7, 2), (11, 1), (16, 1)],
  term ((42329868486684337024748 : Rat) / 314931072359881393269) [(1, 1), (3, 1), (5, 1), (7, 2), (15, 1), (16, 1)],
  term ((-423298684866843370247480 : Rat) / 944793217079644179807) [(1, 1), (3, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((211649342433421685123740 : Rat) / 944793217079644179807) [(1, 1), (3, 1), (5, 1), (11, 1), (16, 1)],
  term ((84659736973368674049496 : Rat) / 314931072359881393269) [(1, 1), (3, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-42329868486684337024748 : Rat) / 314931072359881393269) [(1, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((-412134446239876979346095 : Rat) / 944793217079644179807) [(1, 1), (3, 1), (6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((82426889247975395869219 : Rat) / 314931072359881393269) [(1, 1), (3, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((412134446239876979346095 : Rat) / 1889586434159288359614) [(1, 1), (3, 1), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((-82426889247975395869219 : Rat) / 629862144719762786538) [(1, 1), (3, 1), (6, 2), (15, 2), (16, 1)],
  term ((-412134446239876979346095 : Rat) / 944793217079644179807) [(1, 1), (3, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((82426889247975395869219 : Rat) / 314931072359881393269) [(1, 1), (3, 1), (7, 1), (15, 3), (16, 1)],
  term ((412134446239876979346095 : Rat) / 1889586434159288359614) [(1, 1), (3, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-82426889247975395869219 : Rat) / 629862144719762786538) [(1, 1), (3, 1), (7, 2), (15, 2), (16, 1)],
  term ((412134446239876979346095 : Rat) / 944793217079644179807) [(1, 1), (3, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-412134446239876979346095 : Rat) / 1889586434159288359614) [(1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((-82426889247975395869219 : Rat) / 314931072359881393269) [(1, 1), (3, 1), (14, 1), (15, 2), (16, 1)],
  term ((82426889247975395869219 : Rat) / 629862144719762786538) [(1, 1), (3, 1), (15, 2), (16, 1)],
  term ((47517022341948242478765 : Rat) / 104977024119960464423) [(1, 1), (4, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((-28510213405168945487259 : Rat) / 104977024119960464423) [(1, 1), (4, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-47517022341948242478765 : Rat) / 209954048239920928846) [(1, 1), (4, 1), (6, 2), (11, 1), (16, 1)],
  term ((28510213405168945487259 : Rat) / 209954048239920928846) [(1, 1), (4, 1), (6, 2), (15, 1), (16, 1)],
  term ((47517022341948242478765 : Rat) / 104977024119960464423) [(1, 1), (4, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-28510213405168945487259 : Rat) / 104977024119960464423) [(1, 1), (4, 1), (7, 1), (15, 2), (16, 1)],
  term ((-47517022341948242478765 : Rat) / 209954048239920928846) [(1, 1), (4, 1), (7, 2), (11, 1), (16, 1)],
  term ((28510213405168945487259 : Rat) / 209954048239920928846) [(1, 1), (4, 1), (7, 2), (15, 1), (16, 1)],
  term ((-47517022341948242478765 : Rat) / 104977024119960464423) [(1, 1), (4, 1), (11, 1), (14, 1), (16, 1)],
  term ((47517022341948242478765 : Rat) / 209954048239920928846) [(1, 1), (4, 1), (11, 1), (16, 1)],
  term ((28510213405168945487259 : Rat) / 104977024119960464423) [(1, 1), (4, 1), (14, 1), (15, 1), (16, 1)],
  term ((-28510213405168945487259 : Rat) / 209954048239920928846) [(1, 1), (4, 1), (15, 1), (16, 1)],
  term ((-91087029473382190022890 : Rat) / 944793217079644179807) [(1, 1), (5, 1), (6, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((18217405894676438004578 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (6, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-19658569523537250279800 : Rat) / 944793217079644179807) [(1, 1), (5, 1), (6, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((3931713904707450055960 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((45543514736691095011445 : Rat) / 944793217079644179807) [(1, 1), (5, 1), (6, 2), (7, 1), (11, 1), (16, 1)],
  term ((-9108702947338219002289 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (6, 2), (7, 1), (15, 1), (16, 1)],
  term ((9829284761768625139900 : Rat) / 944793217079644179807) [(1, 1), (5, 1), (6, 2), (11, 1), (13, 1), (16, 1)],
  term ((-1965856952353725027980 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-19658569523537250279800 : Rat) / 944793217079644179807) [(1, 1), (5, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((91087029473382190022890 : Rat) / 944793217079644179807) [(1, 1), (5, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-45543514736691095011445 : Rat) / 944793217079644179807) [(1, 1), (5, 1), (7, 1), (11, 1), (16, 1)],
  term ((3931713904707450055960 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-18217405894676438004578 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((9108702947338219002289 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((9829284761768625139900 : Rat) / 944793217079644179807) [(1, 1), (5, 1), (7, 2), (11, 1), (13, 1), (16, 1)],
  term ((-91087029473382190022890 : Rat) / 944793217079644179807) [(1, 1), (5, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1965856952353725027980 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((18217405894676438004578 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (7, 2), (15, 2), (16, 1)],
  term ((45543514736691095011445 : Rat) / 944793217079644179807) [(1, 1), (5, 1), (7, 3), (11, 1), (16, 1)],
  term ((-9108702947338219002289 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (7, 3), (15, 1), (16, 1)],
  term ((19658569523537250279800 : Rat) / 944793217079644179807) [(1, 1), (5, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-9829284761768625139900 : Rat) / 944793217079644179807) [(1, 1), (5, 1), (11, 1), (13, 1), (16, 1)],
  term ((-3931713904707450055960 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1965856952353725027980 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(1, 1), (6, 1), (7, 1), (10, 1), (14, 1), (16, 1)],
  term ((-4662882398671472552285 : Rat) / 18525357197640081957) [(1, 1), (6, 1), (7, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((597423291812146461695585 : Rat) / 51069903625926712422) [(1, 1), (6, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((932576479734294510457 : Rat) / 6175119065880027319) [(1, 1), (6, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-119484658362429292339117 : Rat) / 17023301208642237474) [(1, 1), (6, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term (-8 : Rat) [(1, 1), (6, 1), (7, 1), (14, 1), (16, 1)],
  term (10 : Rat) [(1, 1), (6, 1), (7, 1), (14, 2), (16, 1)],
  term ((45135617011214852917762 : Rat) / 944793217079644179807) [(1, 1), (6, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-2701108529995772832210 : Rat) / 104977024119960464423) [(1, 1), (6, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((79206032360901795661405 : Rat) / 209954048239920928846) [(1, 1), (6, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 134970459582806311401) [(1, 1), (6, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 44990153194268770467) [(1, 1), (6, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((11687870617409502915899 : Rat) / 6427164742038395781) [(1, 1), (6, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-4498958362351430765191987 : Rat) / 944793217079644179807) [(1, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((181141447557329493714691 : Rat) / 209954048239920928846) [(1, 1), (6, 1), (11, 1), (14, 2), (16, 1)],
  term ((-58439353087047514579495 : Rat) / 19281494226115187343) [(1, 1), (6, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-47523619416541077396843 : Rat) / 209954048239920928846) [(1, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-710017655052144303680 : Rat) / 44990153194268770467) [(1, 1), (6, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1 : Rat) / 3) [(1, 1), (6, 1), (13, 1), (14, 1), (16, 1)],
  term ((1420035310104288607360 : Rat) / 14996717731422923489) [(1, 1), (6, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((900547507043949868382243 : Rat) / 314931072359881393269) [(1, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-109188758250173506458045 : Rat) / 209954048239920928846) [(1, 1), (6, 1), (14, 2), (15, 1), (16, 1)],
  term (-1 : Rat) [(1, 1), (6, 2), (7, 1), (10, 1), (16, 1)],
  term ((4662882398671472552285 : Rat) / 37050714395280163914) [(1, 1), (6, 2), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((-597423291812146461695585 : Rat) / 102139807251853424844) [(1, 1), (6, 2), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-932576479734294510457 : Rat) / 12350238131760054638) [(1, 1), (6, 2), (7, 1), (13, 1), (15, 1), (16, 1)],
  term (-5 : Rat) [(1, 1), (6, 2), (7, 1), (14, 1), (16, 1)],
  term ((119484658362429292339117 : Rat) / 34046602417284474948) [(1, 1), (6, 2), (7, 1), (15, 2), (16, 1)],
  term (4 : Rat) [(1, 1), (6, 2), (7, 1), (16, 1)],
  term ((-22567808505607426458881 : Rat) / 944793217079644179807) [(1, 1), (6, 2), (10, 1), (11, 1), (16, 1)],
  term ((1350554264997886416105 : Rat) / 104977024119960464423) [(1, 1), (6, 2), (10, 1), (15, 1), (16, 1)],
  term ((-79206032360901795661405 : Rat) / 419908096479841857692) [(1, 1), (6, 2), (11, 1), (12, 1), (16, 1)],
  term ((-1775044137630360759200 : Rat) / 134970459582806311401) [(1, 1), (6, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(1, 1), (6, 2), (11, 1), (13, 2), (16, 1)],
  term ((-181141447557329493714691 : Rat) / 419908096479841857692) [(1, 1), (6, 2), (11, 1), (14, 1), (16, 1)],
  term ((-11687870617409502915899 : Rat) / 12854329484076791562) [(1, 1), (6, 2), (11, 1), (15, 2), (16, 1)],
  term ((4498958362351430765191987 : Rat) / 1889586434159288359614) [(1, 1), (6, 2), (11, 1), (16, 1)],
  term ((58439353087047514579495 : Rat) / 38562988452230374686) [(1, 1), (6, 2), (11, 2), (15, 1), (16, 1)],
  term ((47523619416541077396843 : Rat) / 419908096479841857692) [(1, 1), (6, 2), (12, 1), (15, 1), (16, 1)],
  term ((355008827526072151840 : Rat) / 44990153194268770467) [(1, 1), (6, 2), (13, 1), (15, 2), (16, 1)],
  term ((1 : Rat) / 6) [(1, 1), (6, 2), (13, 1), (16, 1)],
  term ((-710017655052144303680 : Rat) / 14996717731422923489) [(1, 1), (6, 2), (13, 2), (15, 1), (16, 1)],
  term ((109188758250173506458045 : Rat) / 419908096479841857692) [(1, 1), (6, 2), (14, 1), (15, 1), (16, 1)],
  term ((-900547507043949868382243 : Rat) / 629862144719762786538) [(1, 1), (6, 2), (15, 1), (16, 1)],
  term ((45135617011214852917762 : Rat) / 944793217079644179807) [(1, 1), (7, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(1, 1), (7, 1), (10, 1), (14, 1), (16, 1)],
  term ((-2701108529995772832210 : Rat) / 104977024119960464423) [(1, 1), (7, 1), (10, 1), (15, 2), (16, 1)],
  term (1 : Rat) [(1, 1), (7, 1), (10, 1), (16, 1)],
  term ((79206032360901795661405 : Rat) / 209954048239920928846) [(1, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((4662882398671472552285 : Rat) / 18525357197640081957) [(1, 1), (7, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 134970459582806311401) [(1, 1), (7, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-4662882398671472552285 : Rat) / 37050714395280163914) [(1, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 44990153194268770467) [(1, 1), (7, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-10237194384516726819652213 : Rat) / 944793217079644179807) [(1, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((241695785155511530704041 : Rat) / 222304286371680983484) [(1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((11687870617409502915899 : Rat) / 6427164742038395781) [(1, 1), (7, 1), (11, 1), (15, 3), (16, 1)],
  term ((-58439353087047514579495 : Rat) / 19281494226115187343) [(1, 1), (7, 1), (11, 2), (15, 2), (16, 1)],
  term ((-47523619416541077396843 : Rat) / 209954048239920928846) [(1, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((-932576479734294510457 : Rat) / 6175119065880027319) [(1, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2785379201071123476733 : Rat) / 37050714395280163914) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-710017655052144303680 : Rat) / 44990153194268770467) [(1, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((1420035310104288607360 : Rat) / 14996717731422923489) [(1, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((2046683042329681648586597 : Rat) / 314931072359881393269) [(1, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term (13 : Rat) [(1, 1), (7, 1), (14, 1), (16, 1)],
  term (-10 : Rat) [(1, 1), (7, 1), (14, 2), (16, 1)],
  term ((-48161313602004961354021 : Rat) / 74101428790560327828) [(1, 1), (7, 1), (15, 2), (16, 1)],
  term (-4 : Rat) [(1, 1), (7, 1), (16, 1)],
  term ((-22567808505607426458881 : Rat) / 944793217079644179807) [(1, 1), (7, 2), (10, 1), (11, 1), (16, 1)],
  term ((1560508313237807344951 : Rat) / 104977024119960464423) [(1, 1), (7, 2), (10, 1), (15, 1), (16, 1)],
  term ((-79206032360901795661405 : Rat) / 419908096479841857692) [(1, 1), (7, 2), (11, 1), (12, 1), (16, 1)],
  term ((-250232311295657625480935 : Rat) / 944793217079644179807) [(1, 1), (7, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(1, 1), (7, 2), (11, 1), (13, 2), (16, 1)],
  term ((-181141447557329493714691 : Rat) / 419908096479841857692) [(1, 1), (7, 2), (11, 1), (14, 1), (16, 1)],
  term ((10193272408145111077049746 : Rat) / 944793217079644179807) [(1, 1), (7, 2), (11, 1), (15, 2), (16, 1)],
  term ((4498958362351430765191987 : Rat) / 1889586434159288359614) [(1, 1), (7, 2), (11, 1), (16, 1)],
  term ((58439353087047514579495 : Rat) / 38562988452230374686) [(1, 1), (7, 2), (11, 2), (15, 1), (16, 1)],
  term ((47523619416541077396843 : Rat) / 419908096479841857692) [(1, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((50046462259131525096187 : Rat) / 314931072359881393269) [(1, 1), (7, 2), (13, 1), (15, 2), (16, 1)],
  term ((1 : Rat) / 6) [(1, 1), (7, 2), (13, 1), (16, 1)],
  term ((-710017655052144303680 : Rat) / 14996717731422923489) [(1, 1), (7, 2), (13, 2), (15, 1), (16, 1)],
  term ((113387839214971925034965 : Rat) / 419908096479841857692) [(1, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((-905586404201707970674547 : Rat) / 629862144719762786538) [(1, 1), (7, 2), (15, 1), (16, 1)],
  term ((-119484658362429292339117 : Rat) / 17023301208642237474) [(1, 1), (7, 2), (15, 3), (16, 1)],
  term (-1 : Rat) [(1, 1), (7, 3), (10, 1), (16, 1)],
  term ((4662882398671472552285 : Rat) / 37050714395280163914) [(1, 1), (7, 3), (11, 1), (13, 1), (16, 1)],
  term ((-597423291812146461695585 : Rat) / 102139807251853424844) [(1, 1), (7, 3), (11, 1), (15, 1), (16, 1)],
  term ((-932576479734294510457 : Rat) / 12350238131760054638) [(1, 1), (7, 3), (13, 1), (15, 1), (16, 1)],
  term (-5 : Rat) [(1, 1), (7, 3), (14, 1), (16, 1)],
  term ((119484658362429292339117 : Rat) / 34046602417284474948) [(1, 1), (7, 3), (15, 2), (16, 1)],
  term (4 : Rat) [(1, 1), (7, 3), (16, 1)],
  term ((-45135617011214852917762 : Rat) / 944793217079644179807) [(1, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((22567808505607426458881 : Rat) / 944793217079644179807) [(1, 1), (10, 1), (11, 1), (16, 1)],
  term ((2701108529995772832210 : Rat) / 104977024119960464423) [(1, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1350554264997886416105 : Rat) / 104977024119960464423) [(1, 1), (10, 1), (15, 1), (16, 1)],
  term ((-79206032360901795661405 : Rat) / 209954048239920928846) [(1, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((79206032360901795661405 : Rat) / 419908096479841857692) [(1, 1), (11, 1), (12, 1), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 134970459582806311401) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1775044137630360759200 : Rat) / 134970459582806311401) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((7100176550521443036800 : Rat) / 44990153194268770467) [(1, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(1, 1), (11, 1), (13, 2), (16, 1)],
  term ((-11687870617409502915899 : Rat) / 6427164742038395781) [(1, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((19626106477421688504200167 : Rat) / 3779172868318576719228) [(1, 1), (11, 1), (14, 1), (16, 1)],
  term ((-181141447557329493714691 : Rat) / 209954048239920928846) [(1, 1), (11, 1), (14, 2), (16, 1)],
  term ((11687870617409502915899 : Rat) / 12854329484076791562) [(1, 1), (11, 1), (15, 2), (16, 1)],
  term ((-4498958362351430765191987 : Rat) / 1889586434159288359614) [(1, 1), (11, 1), (16, 1)],
  term ((58439353087047514579495 : Rat) / 19281494226115187343) [(1, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-58439353087047514579495 : Rat) / 38562988452230374686) [(1, 1), (11, 2), (15, 1), (16, 1)],
  term ((47523619416541077396843 : Rat) / 209954048239920928846) [(1, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-47523619416541077396843 : Rat) / 419908096479841857692) [(1, 1), (12, 1), (15, 1), (16, 1)],
  term ((710017655052144303680 : Rat) / 44990153194268770467) [(1, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((1 : Rat) / 3) [(1, 1), (13, 1), (14, 1), (16, 1)],
  term ((-355008827526072151840 : Rat) / 44990153194268770467) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1 : Rat) / 6) [(1, 1), (13, 1), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 14996717731422923489) [(1, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((710017655052144303680 : Rat) / 14996717731422923489) [(1, 1), (13, 2), (15, 1), (16, 1)],
  term ((-3929756302926319992903107 : Rat) / 1259724289439525573076) [(1, 1), (14, 1), (15, 1), (16, 1)],
  term ((109188758250173506458045 : Rat) / 209954048239920928846) [(1, 1), (14, 2), (15, 1), (16, 1)],
  term ((900547507043949868382243 : Rat) / 629862144719762786538) [(1, 1), (15, 1), (16, 1)],
  term ((-3827375014604428415900 : Rat) / 14996717731422923489) [(1, 2), (5, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((2296425008762657049540 : Rat) / 14996717731422923489) [(1, 2), (5, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((1913687507302214207950 : Rat) / 14996717731422923489) [(1, 2), (5, 1), (6, 2), (11, 1), (16, 1)],
  term ((-1148212504381328524770 : Rat) / 14996717731422923489) [(1, 2), (5, 1), (6, 2), (15, 1), (16, 1)],
  term ((-3827375014604428415900 : Rat) / 14996717731422923489) [(1, 2), (5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((2296425008762657049540 : Rat) / 14996717731422923489) [(1, 2), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((1913687507302214207950 : Rat) / 14996717731422923489) [(1, 2), (5, 1), (7, 2), (11, 1), (16, 1)],
  term ((-1148212504381328524770 : Rat) / 14996717731422923489) [(1, 2), (5, 1), (7, 2), (15, 1), (16, 1)],
  term ((3827375014604428415900 : Rat) / 14996717731422923489) [(1, 2), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-1913687507302214207950 : Rat) / 14996717731422923489) [(1, 2), (5, 1), (11, 1), (16, 1)],
  term ((-2296425008762657049540 : Rat) / 14996717731422923489) [(1, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((1148212504381328524770 : Rat) / 14996717731422923489) [(1, 2), (5, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(1, 2), (6, 1), (14, 1), (16, 1)],
  term (-8 : Rat) [(1, 2), (6, 1), (14, 2), (16, 1)],
  term (4 : Rat) [(1, 2), (6, 2), (14, 1), (16, 1)],
  term (-4 : Rat) [(1, 2), (6, 2), (16, 1)],
  term (-8 : Rat) [(1, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(1, 2), (7, 2), (14, 1), (16, 1)],
  term (-4 : Rat) [(1, 2), (7, 2), (16, 1)],
  term (-12 : Rat) [(1, 2), (14, 1), (16, 1)],
  term (8 : Rat) [(1, 2), (14, 2), (16, 1)],
  term (4 : Rat) [(1, 2), (16, 1)],
  term ((83623703494117741749640 : Rat) / 55576071592920245871) [(2, 1), (3, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((-16724740698823548349928 : Rat) / 18525357197640081957) [(2, 1), (3, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-41811851747058870874820 : Rat) / 55576071592920245871) [(2, 1), (3, 1), (6, 2), (11, 1), (16, 1)],
  term ((8362370349411774174964 : Rat) / 18525357197640081957) [(2, 1), (3, 1), (6, 2), (15, 1), (16, 1)],
  term ((83623703494117741749640 : Rat) / 55576071592920245871) [(2, 1), (3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-16724740698823548349928 : Rat) / 18525357197640081957) [(2, 1), (3, 1), (7, 1), (15, 2), (16, 1)],
  term ((-41811851747058870874820 : Rat) / 55576071592920245871) [(2, 1), (3, 1), (7, 2), (11, 1), (16, 1)],
  term ((8362370349411774174964 : Rat) / 18525357197640081957) [(2, 1), (3, 1), (7, 2), (15, 1), (16, 1)],
  term ((-83623703494117741749640 : Rat) / 55576071592920245871) [(2, 1), (3, 1), (11, 1), (14, 1), (16, 1)],
  term ((41811851747058870874820 : Rat) / 55576071592920245871) [(2, 1), (3, 1), (11, 1), (16, 1)],
  term ((16724740698823548349928 : Rat) / 18525357197640081957) [(2, 1), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8362370349411774174964 : Rat) / 18525357197640081957) [(2, 1), (3, 1), (15, 1), (16, 1)],
  term ((8797615598806863390785 : Rat) / 19281494226115187343) [(2, 1), (5, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((-1759523119761372678157 : Rat) / 6427164742038395781) [(2, 1), (5, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8797615598806863390785 : Rat) / 38562988452230374686) [(2, 1), (5, 1), (6, 2), (11, 1), (16, 1)],
  term ((1759523119761372678157 : Rat) / 12854329484076791562) [(2, 1), (5, 1), (6, 2), (15, 1), (16, 1)],
  term ((8797615598806863390785 : Rat) / 19281494226115187343) [(2, 1), (5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1759523119761372678157 : Rat) / 6427164742038395781) [(2, 1), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((-8797615598806863390785 : Rat) / 38562988452230374686) [(2, 1), (5, 1), (7, 2), (11, 1), (16, 1)],
  term ((1759523119761372678157 : Rat) / 12854329484076791562) [(2, 1), (5, 1), (7, 2), (15, 1), (16, 1)],
  term ((-8797615598806863390785 : Rat) / 19281494226115187343) [(2, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((8797615598806863390785 : Rat) / 38562988452230374686) [(2, 1), (5, 1), (11, 1), (16, 1)],
  term ((1759523119761372678157 : Rat) / 6427164742038395781) [(2, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1759523119761372678157 : Rat) / 12854329484076791562) [(2, 1), (5, 1), (15, 1), (16, 1)],
  term ((-41888471282988417458510 : Rat) / 944793217079644179807) [(2, 1), (6, 1), (7, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((8377694256597683491702 : Rat) / 314931072359881393269) [(2, 1), (6, 1), (7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-12148940023606557467095 : Rat) / 25534951812963356211) [(2, 1), (6, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-41888471282988417458510 : Rat) / 944793217079644179807) [(2, 1), (6, 1), (7, 1), (11, 1), (14, 2), (16, 1)],
  term ((817495246555389270017 : Rat) / 2837216868107039579) [(2, 1), (6, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((8377694256597683491702 : Rat) / 314931072359881393269) [(2, 1), (6, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-16755388513195366983404 : Rat) / 314931072359881393269) [(2, 1), (6, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((83776942565976834917020 : Rat) / 944793217079644179807) [(2, 1), (6, 1), (10, 1), (11, 2), (14, 1), (16, 1)],
  term ((-169220984361650642328770 : Rat) / 944793217079644179807) [(2, 1), (6, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1143939422409966897682717 : Rat) / 3779172868318576719228) [(2, 1), (6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-66456624366845468241004 : Rat) / 314931072359881393269) [(2, 1), (6, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-977629467118458242208095 : Rat) / 944793217079644179807) [(2, 1), (6, 1), (11, 2), (14, 1), (16, 1)],
  term ((83776942565976834917020 : Rat) / 944793217079644179807) [(2, 1), (6, 1), (11, 2), (14, 2), (16, 1)],
  term ((33844196872330128465754 : Rat) / 314931072359881393269) [(2, 1), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((698050028698853335796429 : Rat) / 1259724289439525573076) [(2, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((-4 : Rat) / 3) [(2, 1), (6, 1), (14, 1), (16, 1)],
  term ((1420035310104288607360 : Rat) / 14996717731422923489) [(2, 1), (6, 1), (14, 2), (15, 2), (16, 1)],
  term ((-4 : Rat) / 3) [(2, 1), (6, 1), (14, 2), (16, 1)],
  term ((20944235641494208729255 : Rat) / 944793217079644179807) [(2, 1), (6, 2), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((-4188847128298841745851 : Rat) / 314931072359881393269) [(2, 1), (6, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((20944235641494208729255 : Rat) / 944793217079644179807) [(2, 1), (6, 2), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((12148940023606557467095 : Rat) / 51069903625926712422) [(2, 1), (6, 2), (7, 1), (11, 1), (16, 1)],
  term ((-4188847128298841745851 : Rat) / 314931072359881393269) [(2, 1), (6, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-817495246555389270017 : Rat) / 5674433736214079158) [(2, 1), (6, 2), (7, 1), (15, 1), (16, 1)],
  term ((8377694256597683491702 : Rat) / 314931072359881393269) [(2, 1), (6, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-41888471282988417458510 : Rat) / 944793217079644179807) [(2, 1), (6, 2), (10, 1), (11, 2), (16, 1)],
  term ((84610492180825321164385 : Rat) / 944793217079644179807) [(2, 1), (6, 2), (11, 1), (13, 1), (16, 1)],
  term ((33228312183422734120502 : Rat) / 314931072359881393269) [(2, 1), (6, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1143939422409966897682717 : Rat) / 7558345736637153438456) [(2, 1), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((-41888471282988417458510 : Rat) / 944793217079644179807) [(2, 1), (6, 2), (11, 2), (14, 1), (16, 1)],
  term ((977629467118458242208095 : Rat) / 1889586434159288359614) [(2, 1), (6, 2), (11, 2), (16, 1)],
  term ((-16922098436165064232877 : Rat) / 314931072359881393269) [(2, 1), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-710017655052144303680 : Rat) / 14996717731422923489) [(2, 1), (6, 2), (14, 1), (15, 2), (16, 1)],
  term ((2 : Rat) / 3) [(2, 1), (6, 2), (14, 1), (16, 1)],
  term ((-698050028698853335796429 : Rat) / 2519448578879051146152) [(2, 1), (6, 2), (15, 2), (16, 1)],
  term ((2 : Rat) / 3) [(2, 1), (6, 2), (16, 1)],
  term ((41888471282988417458510 : Rat) / 944793217079644179807) [(2, 1), (7, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-16755388513195366983404 : Rat) / 314931072359881393269) [(2, 1), (7, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-20944235641494208729255 : Rat) / 944793217079644179807) [(2, 1), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((83776942565976834917020 : Rat) / 944793217079644179807) [(2, 1), (7, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((-8377694256597683491702 : Rat) / 314931072359881393269) [(2, 1), (7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((4188847128298841745851 : Rat) / 314931072359881393269) [(2, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-169220984361650642328770 : Rat) / 944793217079644179807) [(2, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-66456624366845468241004 : Rat) / 314931072359881393269) [(2, 1), (7, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((142855515077316139184420 : Rat) / 314931072359881393269) [(2, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((41888471282988417458510 : Rat) / 944793217079644179807) [(2, 1), (7, 1), (11, 1), (14, 2), (16, 1)],
  term ((-1143939422409966897682717 : Rat) / 3779172868318576719228) [(2, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-12148940023606557467095 : Rat) / 51069903625926712422) [(2, 1), (7, 1), (11, 1), (16, 1)],
  term ((83776942565976834917020 : Rat) / 944793217079644179807) [(2, 1), (7, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-977629467118458242208095 : Rat) / 944793217079644179807) [(2, 1), (7, 1), (11, 2), (15, 1), (16, 1)],
  term ((33844196872330128465754 : Rat) / 314931072359881393269) [(2, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-28991011111943069694576 : Rat) / 104977024119960464423) [(2, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((1420035310104288607360 : Rat) / 14996717731422923489) [(2, 1), (7, 1), (14, 1), (15, 3), (16, 1)],
  term ((-8377694256597683491702 : Rat) / 314931072359881393269) [(2, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((2429788004721311493419 : Rat) / 17023301208642237474) [(2, 1), (7, 1), (15, 1), (16, 1)],
  term ((698050028698853335796429 : Rat) / 1259724289439525573076) [(2, 1), (7, 1), (15, 3), (16, 1)],
  term ((-16755388513195366983404 : Rat) / 944793217079644179807) [(2, 1), (7, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-41888471282988417458510 : Rat) / 944793217079644179807) [(2, 1), (7, 2), (10, 1), (11, 2), (16, 1)],
  term ((8377694256597683491702 : Rat) / 314931072359881393269) [(2, 1), (7, 2), (10, 1), (15, 2), (16, 1)],
  term ((84610492180825321164385 : Rat) / 944793217079644179807) [(2, 1), (7, 2), (11, 1), (13, 1), (16, 1)],
  term ((57796465267279784902996 : Rat) / 944793217079644179807) [(2, 1), (7, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2452146824577574112577403 : Rat) / 7558345736637153438456) [(2, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-41888471282988417458510 : Rat) / 944793217079644179807) [(2, 1), (7, 2), (11, 2), (14, 1), (16, 1)],
  term ((977629467118458242208095 : Rat) / 1889586434159288359614) [(2, 1), (7, 2), (11, 2), (16, 1)],
  term ((-16922098436165064232877 : Rat) / 314931072359881393269) [(2, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-6532676499497346885578 : Rat) / 314931072359881393269) [(2, 1), (7, 2), (14, 1), (15, 2), (16, 1)],
  term ((2 : Rat) / 3) [(2, 1), (7, 2), (14, 1), (16, 1)],
  term ((3983678606047476568381 : Rat) / 359921225554150163736) [(2, 1), (7, 2), (15, 2), (16, 1)],
  term ((2 : Rat) / 3) [(2, 1), (7, 2), (16, 1)],
  term ((20944235641494208729255 : Rat) / 944793217079644179807) [(2, 1), (7, 3), (10, 1), (11, 1), (16, 1)],
  term ((-4188847128298841745851 : Rat) / 314931072359881393269) [(2, 1), (7, 3), (10, 1), (15, 1), (16, 1)],
  term ((20944235641494208729255 : Rat) / 944793217079644179807) [(2, 1), (7, 3), (11, 1), (14, 1), (16, 1)],
  term ((12148940023606557467095 : Rat) / 51069903625926712422) [(2, 1), (7, 3), (11, 1), (16, 1)],
  term ((-4188847128298841745851 : Rat) / 314931072359881393269) [(2, 1), (7, 3), (14, 1), (15, 1), (16, 1)],
  term ((-817495246555389270017 : Rat) / 5674433736214079158) [(2, 1), (7, 3), (15, 1), (16, 1)],
  term ((16755388513195366983404 : Rat) / 314931072359881393269) [(2, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8377694256597683491702 : Rat) / 314931072359881393269) [(2, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-83776942565976834917020 : Rat) / 944793217079644179807) [(2, 1), (10, 1), (11, 2), (14, 1), (16, 1)],
  term ((41888471282988417458510 : Rat) / 944793217079644179807) [(2, 1), (10, 1), (11, 2), (16, 1)],
  term ((169220984361650642328770 : Rat) / 944793217079644179807) [(2, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-84610492180825321164385 : Rat) / 944793217079644179807) [(2, 1), (11, 1), (13, 1), (16, 1)],
  term ((745199676208894088236693 : Rat) / 3779172868318576719228) [(2, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((66456624366845468241004 : Rat) / 314931072359881393269) [(2, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1143939422409966897682717 : Rat) / 7558345736637153438456) [(2, 1), (11, 1), (15, 1), (16, 1)],
  term ((1019517938401446659666605 : Rat) / 944793217079644179807) [(2, 1), (11, 2), (14, 1), (16, 1)],
  term ((-83776942565976834917020 : Rat) / 944793217079644179807) [(2, 1), (11, 2), (14, 2), (16, 1)],
  term ((-977629467118458242208095 : Rat) / 1889586434159288359614) [(2, 1), (11, 2), (16, 1)],
  term ((-33844196872330128465754 : Rat) / 314931072359881393269) [(2, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((16922098436165064232877 : Rat) / 314931072359881393269) [(2, 1), (13, 1), (15, 1), (16, 1)],
  term ((-638408545674473214287309 : Rat) / 1259724289439525573076) [(2, 1), (14, 1), (15, 2), (16, 1)],
  term ((2 : Rat) / 3) [(2, 1), (14, 1), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 14996717731422923489) [(2, 1), (14, 2), (15, 2), (16, 1)],
  term ((4 : Rat) / 3) [(2, 1), (14, 2), (16, 1)],
  term ((698050028698853335796429 : Rat) / 2519448578879051146152) [(2, 1), (15, 2), (16, 1)],
  term ((-2 : Rat) / 3) [(2, 1), (16, 1)],
  term ((-125861949583913607453775 : Rat) / 134970459582806311401) [(3, 1), (4, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((8615719338236944958720 : Rat) / 9354388287917269107) [(3, 1), (4, 1), (6, 1), (11, 1), (14, 2), (16, 1)],
  term ((25172389916782721490755 : Rat) / 44990153194268770467) [(3, 1), (4, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1723143867647388991744 : Rat) / 3118129429305756369) [(3, 1), (4, 1), (6, 1), (14, 2), (15, 1), (16, 1)],
  term ((-4307859669118472479360 : Rat) / 9354388287917269107) [(3, 1), (4, 1), (6, 2), (11, 1), (14, 1), (16, 1)],
  term ((125861949583913607453775 : Rat) / 269940919165612622802) [(3, 1), (4, 1), (6, 2), (11, 1), (16, 1)],
  term ((861571933823694495872 : Rat) / 3118129429305756369) [(3, 1), (4, 1), (6, 2), (14, 1), (15, 1), (16, 1)],
  term ((-25172389916782721490755 : Rat) / 89980306388537540934) [(3, 1), (4, 1), (6, 2), (15, 1), (16, 1)],
  term ((8615719338236944958720 : Rat) / 9354388287917269107) [(3, 1), (4, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-125861949583913607453775 : Rat) / 134970459582806311401) [(3, 1), (4, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1723143867647388991744 : Rat) / 3118129429305756369) [(3, 1), (4, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((25172389916782721490755 : Rat) / 44990153194268770467) [(3, 1), (4, 1), (7, 1), (15, 2), (16, 1)],
  term ((-4307859669118472479360 : Rat) / 9354388287917269107) [(3, 1), (4, 1), (7, 2), (11, 1), (14, 1), (16, 1)],
  term ((125861949583913607453775 : Rat) / 269940919165612622802) [(3, 1), (4, 1), (7, 2), (11, 1), (16, 1)],
  term ((861571933823694495872 : Rat) / 3118129429305756369) [(3, 1), (4, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((-25172389916782721490755 : Rat) / 89980306388537540934) [(3, 1), (4, 1), (7, 2), (15, 1), (16, 1)],
  term ((146236385963151219176865 : Rat) / 104977024119960464423) [(3, 1), (4, 1), (11, 1), (14, 1), (16, 1)],
  term ((-8615719338236944958720 : Rat) / 9354388287917269107) [(3, 1), (4, 1), (11, 1), (14, 2), (16, 1)],
  term ((-125861949583913607453775 : Rat) / 269940919165612622802) [(3, 1), (4, 1), (11, 1), (16, 1)],
  term ((-87741831577890731506119 : Rat) / 104977024119960464423) [(3, 1), (4, 1), (14, 1), (15, 1), (16, 1)],
  term ((1723143867647388991744 : Rat) / 3118129429305756369) [(3, 1), (4, 1), (14, 2), (15, 1), (16, 1)],
  term ((25172389916782721490755 : Rat) / 89980306388537540934) [(3, 1), (4, 1), (15, 1), (16, 1)],
  term ((846597369733686740494960 : Rat) / 944793217079644179807) [(3, 1), (5, 1), (6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((39317139047074500559600 : Rat) / 944793217079644179807) [(3, 1), (5, 1), (6, 1), (11, 2), (14, 1), (16, 1)],
  term ((-423298684866843370247480 : Rat) / 944793217079644179807) [(3, 1), (5, 1), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((-19658569523537250279800 : Rat) / 944793217079644179807) [(3, 1), (5, 1), (6, 2), (11, 2), (16, 1)],
  term ((846597369733686740494960 : Rat) / 944793217079644179807) [(3, 1), (5, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((39317139047074500559600 : Rat) / 944793217079644179807) [(3, 1), (5, 1), (7, 1), (11, 2), (15, 1), (16, 1)],
  term ((-423298684866843370247480 : Rat) / 944793217079644179807) [(3, 1), (5, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-19658569523537250279800 : Rat) / 944793217079644179807) [(3, 1), (5, 1), (7, 2), (11, 2), (16, 1)],
  term ((-846597369733686740494960 : Rat) / 944793217079644179807) [(3, 1), (5, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((423298684866843370247480 : Rat) / 944793217079644179807) [(3, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-39317139047074500559600 : Rat) / 944793217079644179807) [(3, 1), (5, 1), (11, 2), (14, 1), (16, 1)],
  term ((19658569523537250279800 : Rat) / 944793217079644179807) [(3, 1), (5, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 29, terms 0 through 99. -/
theorem rs_R007_ueqv_R007NY_block_29_0000_0099_valid :
    checkProductSumEq rs_R007_ueqv_R007NY_partials_29_0000_0099
      rs_R007_ueqv_R007NY_block_29_0000_0099 = true := by
  native_decide

end R007UeqvR007NYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
