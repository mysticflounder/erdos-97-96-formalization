/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_020, term block 7:0-46

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_020`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2020TermShards

/-- Generator polynomial 7 for endpoint certificate `ep_Q2_020`. -/
def ep_Q2_020_generator_07_0000_0046 : Poly :=
[
  term (-2 : Rat) [(0, 1)],
  term (1 : Rat) [(0, 2)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(12, 1)],
  term (-1 : Rat) [(12, 2)],
  term (-1 : Rat) [(13, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 7. -/
def ep_Q2_020_coefficient_07_0000 : Poly :=
[
  term ((201989038429015404 : Rat) / 28298395017400811) [(0, 1), (4, 1), (16, 1)]
]

/-- Partial product 0 for generator 7. -/
def ep_Q2_020_partial_07_0000 : Poly :=
[
  term ((201989038429015404 : Rat) / 28298395017400811) [(0, 1), (1, 2), (4, 1), (16, 1)],
  term ((403978076858030808 : Rat) / 28298395017400811) [(0, 1), (4, 1), (12, 1), (16, 1)],
  term ((-201989038429015404 : Rat) / 28298395017400811) [(0, 1), (4, 1), (12, 2), (16, 1)],
  term ((-201989038429015404 : Rat) / 28298395017400811) [(0, 1), (4, 1), (13, 2), (16, 1)],
  term ((-403978076858030808 : Rat) / 28298395017400811) [(0, 2), (4, 1), (16, 1)],
  term ((201989038429015404 : Rat) / 28298395017400811) [(0, 3), (4, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 7. -/
theorem ep_Q2_020_partial_07_0000_valid :
    mulPoly ep_Q2_020_coefficient_07_0000
        ep_Q2_020_generator_07_0000_0046 =
      ep_Q2_020_partial_07_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 7. -/
def ep_Q2_020_coefficient_07_0001 : Poly :=
[
  term ((-266108519468118 : Rat) / 690204756521971) [(0, 1), (6, 1), (16, 1)]
]

/-- Partial product 1 for generator 7. -/
def ep_Q2_020_partial_07_0001 : Poly :=
[
  term ((-266108519468118 : Rat) / 690204756521971) [(0, 1), (1, 2), (6, 1), (16, 1)],
  term ((-532217038936236 : Rat) / 690204756521971) [(0, 1), (6, 1), (12, 1), (16, 1)],
  term ((266108519468118 : Rat) / 690204756521971) [(0, 1), (6, 1), (12, 2), (16, 1)],
  term ((266108519468118 : Rat) / 690204756521971) [(0, 1), (6, 1), (13, 2), (16, 1)],
  term ((532217038936236 : Rat) / 690204756521971) [(0, 2), (6, 1), (16, 1)],
  term ((-266108519468118 : Rat) / 690204756521971) [(0, 3), (6, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 7. -/
theorem ep_Q2_020_partial_07_0001_valid :
    mulPoly ep_Q2_020_coefficient_07_0001
        ep_Q2_020_generator_07_0000_0046 =
      ep_Q2_020_partial_07_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 7. -/
def ep_Q2_020_coefficient_07_0002 : Poly :=
[
  term ((-15130904457077361 : Rat) / 28298395017400811) [(0, 1), (12, 1), (16, 1)]
]

/-- Partial product 2 for generator 7. -/
def ep_Q2_020_partial_07_0002 : Poly :=
[
  term ((-15130904457077361 : Rat) / 28298395017400811) [(0, 1), (1, 2), (12, 1), (16, 1)],
  term ((15130904457077361 : Rat) / 28298395017400811) [(0, 1), (12, 1), (13, 2), (16, 1)],
  term ((-30261808914154722 : Rat) / 28298395017400811) [(0, 1), (12, 2), (16, 1)],
  term ((15130904457077361 : Rat) / 28298395017400811) [(0, 1), (12, 3), (16, 1)],
  term ((30261808914154722 : Rat) / 28298395017400811) [(0, 2), (12, 1), (16, 1)],
  term ((-15130904457077361 : Rat) / 28298395017400811) [(0, 3), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 7. -/
theorem ep_Q2_020_partial_07_0002_valid :
    mulPoly ep_Q2_020_coefficient_07_0002
        ep_Q2_020_generator_07_0000_0046 =
      ep_Q2_020_partial_07_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 7. -/
def ep_Q2_020_coefficient_07_0003 : Poly :=
[
  term ((-103284034103452500 : Rat) / 28298395017400811) [(0, 1), (14, 1), (16, 1)]
]

/-- Partial product 3 for generator 7. -/
def ep_Q2_020_partial_07_0003 : Poly :=
[
  term ((-103284034103452500 : Rat) / 28298395017400811) [(0, 1), (1, 2), (14, 1), (16, 1)],
  term ((-206568068206905000 : Rat) / 28298395017400811) [(0, 1), (12, 1), (14, 1), (16, 1)],
  term ((103284034103452500 : Rat) / 28298395017400811) [(0, 1), (12, 2), (14, 1), (16, 1)],
  term ((103284034103452500 : Rat) / 28298395017400811) [(0, 1), (13, 2), (14, 1), (16, 1)],
  term ((206568068206905000 : Rat) / 28298395017400811) [(0, 2), (14, 1), (16, 1)],
  term ((-103284034103452500 : Rat) / 28298395017400811) [(0, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 7. -/
theorem ep_Q2_020_partial_07_0003_valid :
    mulPoly ep_Q2_020_coefficient_07_0003
        ep_Q2_020_generator_07_0000_0046 =
      ep_Q2_020_partial_07_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 7. -/
def ep_Q2_020_coefficient_07_0004 : Poly :=
[
  term ((228192420528144717 : Rat) / 113193580069603244) [(0, 1), (16, 1)]
]

/-- Partial product 4 for generator 7. -/
def ep_Q2_020_partial_07_0004 : Poly :=
[
  term ((228192420528144717 : Rat) / 113193580069603244) [(0, 1), (1, 2), (16, 1)],
  term ((228192420528144717 : Rat) / 56596790034801622) [(0, 1), (12, 1), (16, 1)],
  term ((-228192420528144717 : Rat) / 113193580069603244) [(0, 1), (12, 2), (16, 1)],
  term ((-228192420528144717 : Rat) / 113193580069603244) [(0, 1), (13, 2), (16, 1)],
  term ((-228192420528144717 : Rat) / 56596790034801622) [(0, 2), (16, 1)],
  term ((228192420528144717 : Rat) / 113193580069603244) [(0, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 7. -/
theorem ep_Q2_020_partial_07_0004_valid :
    mulPoly ep_Q2_020_coefficient_07_0004
        ep_Q2_020_generator_07_0000_0046 =
      ep_Q2_020_partial_07_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 7. -/
def ep_Q2_020_coefficient_07_0005 : Poly :=
[
  term ((100783476016719588 : Rat) / 28298395017400811) [(0, 2), (16, 1)]
]

/-- Partial product 5 for generator 7. -/
def ep_Q2_020_partial_07_0005 : Poly :=
[
  term ((100783476016719588 : Rat) / 28298395017400811) [(0, 2), (1, 2), (16, 1)],
  term ((201566952033439176 : Rat) / 28298395017400811) [(0, 2), (12, 1), (16, 1)],
  term ((-100783476016719588 : Rat) / 28298395017400811) [(0, 2), (12, 2), (16, 1)],
  term ((-100783476016719588 : Rat) / 28298395017400811) [(0, 2), (13, 2), (16, 1)],
  term ((-201566952033439176 : Rat) / 28298395017400811) [(0, 3), (16, 1)],
  term ((100783476016719588 : Rat) / 28298395017400811) [(0, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 7. -/
theorem ep_Q2_020_partial_07_0005_valid :
    mulPoly ep_Q2_020_coefficient_07_0005
        ep_Q2_020_generator_07_0000_0046 =
      ep_Q2_020_partial_07_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 7. -/
def ep_Q2_020_coefficient_07_0006 : Poly :=
[
  term ((-7503627691129284 : Rat) / 28298395017400811) [(1, 1), (5, 1), (16, 1)]
]

/-- Partial product 6 for generator 7. -/
def ep_Q2_020_partial_07_0006 : Poly :=
[
  term ((15007255382258568 : Rat) / 28298395017400811) [(0, 1), (1, 1), (5, 1), (16, 1)],
  term ((-7503627691129284 : Rat) / 28298395017400811) [(0, 2), (1, 1), (5, 1), (16, 1)],
  term ((-15007255382258568 : Rat) / 28298395017400811) [(1, 1), (5, 1), (12, 1), (16, 1)],
  term ((7503627691129284 : Rat) / 28298395017400811) [(1, 1), (5, 1), (12, 2), (16, 1)],
  term ((7503627691129284 : Rat) / 28298395017400811) [(1, 1), (5, 1), (13, 2), (16, 1)],
  term ((-7503627691129284 : Rat) / 28298395017400811) [(1, 3), (5, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 7. -/
theorem ep_Q2_020_partial_07_0006_valid :
    mulPoly ep_Q2_020_coefficient_07_0006
        ep_Q2_020_generator_07_0000_0046 =
      ep_Q2_020_partial_07_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 7. -/
def ep_Q2_020_coefficient_07_0007 : Poly :=
[
  term ((-118247692057722024 : Rat) / 28298395017400811) [(1, 1), (7, 1), (16, 1)]
]

/-- Partial product 7 for generator 7. -/
def ep_Q2_020_partial_07_0007 : Poly :=
[
  term ((236495384115444048 : Rat) / 28298395017400811) [(0, 1), (1, 1), (7, 1), (16, 1)],
  term ((-118247692057722024 : Rat) / 28298395017400811) [(0, 2), (1, 1), (7, 1), (16, 1)],
  term ((-236495384115444048 : Rat) / 28298395017400811) [(1, 1), (7, 1), (12, 1), (16, 1)],
  term ((118247692057722024 : Rat) / 28298395017400811) [(1, 1), (7, 1), (12, 2), (16, 1)],
  term ((118247692057722024 : Rat) / 28298395017400811) [(1, 1), (7, 1), (13, 2), (16, 1)],
  term ((-118247692057722024 : Rat) / 28298395017400811) [(1, 3), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 7. -/
theorem ep_Q2_020_partial_07_0007_valid :
    mulPoly ep_Q2_020_coefficient_07_0007
        ep_Q2_020_generator_07_0000_0046 =
      ep_Q2_020_partial_07_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 7. -/
def ep_Q2_020_coefficient_07_0008 : Poly :=
[
  term ((14826332127944952 : Rat) / 28298395017400811) [(1, 1), (9, 1), (16, 1)]
]

/-- Partial product 8 for generator 7. -/
def ep_Q2_020_partial_07_0008 : Poly :=
[
  term ((-29652664255889904 : Rat) / 28298395017400811) [(0, 1), (1, 1), (9, 1), (16, 1)],
  term ((14826332127944952 : Rat) / 28298395017400811) [(0, 2), (1, 1), (9, 1), (16, 1)],
  term ((29652664255889904 : Rat) / 28298395017400811) [(1, 1), (9, 1), (12, 1), (16, 1)],
  term ((-14826332127944952 : Rat) / 28298395017400811) [(1, 1), (9, 1), (12, 2), (16, 1)],
  term ((-14826332127944952 : Rat) / 28298395017400811) [(1, 1), (9, 1), (13, 2), (16, 1)],
  term ((14826332127944952 : Rat) / 28298395017400811) [(1, 3), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 7. -/
theorem ep_Q2_020_partial_07_0008_valid :
    mulPoly ep_Q2_020_coefficient_07_0008
        ep_Q2_020_generator_07_0000_0046 =
      ep_Q2_020_partial_07_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 7. -/
def ep_Q2_020_coefficient_07_0009 : Poly :=
[
  term ((44478996383834856 : Rat) / 28298395017400811) [(1, 1), (11, 1), (16, 1)]
]

/-- Partial product 9 for generator 7. -/
def ep_Q2_020_partial_07_0009 : Poly :=
[
  term ((-88957992767669712 : Rat) / 28298395017400811) [(0, 1), (1, 1), (11, 1), (16, 1)],
  term ((44478996383834856 : Rat) / 28298395017400811) [(0, 2), (1, 1), (11, 1), (16, 1)],
  term ((88957992767669712 : Rat) / 28298395017400811) [(1, 1), (11, 1), (12, 1), (16, 1)],
  term ((-44478996383834856 : Rat) / 28298395017400811) [(1, 1), (11, 1), (12, 2), (16, 1)],
  term ((-44478996383834856 : Rat) / 28298395017400811) [(1, 1), (11, 1), (13, 2), (16, 1)],
  term ((44478996383834856 : Rat) / 28298395017400811) [(1, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 7. -/
theorem ep_Q2_020_partial_07_0009_valid :
    mulPoly ep_Q2_020_coefficient_07_0009
        ep_Q2_020_generator_07_0000_0046 =
      ep_Q2_020_partial_07_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 7. -/
def ep_Q2_020_coefficient_07_0010 : Poly :=
[
  term ((646237408088655 : Rat) / 28298395017400811) [(1, 1), (13, 1), (16, 1)]
]

/-- Partial product 10 for generator 7. -/
def ep_Q2_020_partial_07_0010 : Poly :=
[
  term ((-1292474816177310 : Rat) / 28298395017400811) [(0, 1), (1, 1), (13, 1), (16, 1)],
  term ((646237408088655 : Rat) / 28298395017400811) [(0, 2), (1, 1), (13, 1), (16, 1)],
  term ((1292474816177310 : Rat) / 28298395017400811) [(1, 1), (12, 1), (13, 1), (16, 1)],
  term ((-646237408088655 : Rat) / 28298395017400811) [(1, 1), (12, 2), (13, 1), (16, 1)],
  term ((-646237408088655 : Rat) / 28298395017400811) [(1, 1), (13, 3), (16, 1)],
  term ((646237408088655 : Rat) / 28298395017400811) [(1, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 7. -/
theorem ep_Q2_020_partial_07_0010_valid :
    mulPoly ep_Q2_020_coefficient_07_0010
        ep_Q2_020_generator_07_0000_0046 =
      ep_Q2_020_partial_07_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 7. -/
def ep_Q2_020_coefficient_07_0011 : Poly :=
[
  term ((-33594492005573196 : Rat) / 28298395017400811) [(1, 2), (16, 1)]
]

/-- Partial product 11 for generator 7. -/
def ep_Q2_020_partial_07_0011 : Poly :=
[
  term ((67188984011146392 : Rat) / 28298395017400811) [(0, 1), (1, 2), (16, 1)],
  term ((-33594492005573196 : Rat) / 28298395017400811) [(0, 2), (1, 2), (16, 1)],
  term ((-67188984011146392 : Rat) / 28298395017400811) [(1, 2), (12, 1), (16, 1)],
  term ((33594492005573196 : Rat) / 28298395017400811) [(1, 2), (12, 2), (16, 1)],
  term ((33594492005573196 : Rat) / 28298395017400811) [(1, 2), (13, 2), (16, 1)],
  term ((-33594492005573196 : Rat) / 28298395017400811) [(1, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 7. -/
theorem ep_Q2_020_partial_07_0011_valid :
    mulPoly ep_Q2_020_coefficient_07_0011
        ep_Q2_020_generator_07_0000_0046 =
      ep_Q2_020_partial_07_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 7. -/
def ep_Q2_020_coefficient_07_0012 : Poly :=
[
  term ((-75332880861680325 : Rat) / 28298395017400811) [(4, 1), (6, 1), (16, 1)]
]

/-- Partial product 12 for generator 7. -/
def ep_Q2_020_partial_07_0012 : Poly :=
[
  term ((150665761723360650 : Rat) / 28298395017400811) [(0, 1), (4, 1), (6, 1), (16, 1)],
  term ((-75332880861680325 : Rat) / 28298395017400811) [(0, 2), (4, 1), (6, 1), (16, 1)],
  term ((-75332880861680325 : Rat) / 28298395017400811) [(1, 2), (4, 1), (6, 1), (16, 1)],
  term ((-150665761723360650 : Rat) / 28298395017400811) [(4, 1), (6, 1), (12, 1), (16, 1)],
  term ((75332880861680325 : Rat) / 28298395017400811) [(4, 1), (6, 1), (12, 2), (16, 1)],
  term ((75332880861680325 : Rat) / 28298395017400811) [(4, 1), (6, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 7. -/
theorem ep_Q2_020_partial_07_0012_valid :
    mulPoly ep_Q2_020_coefficient_07_0012
        ep_Q2_020_generator_07_0000_0046 =
      ep_Q2_020_partial_07_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 7. -/
def ep_Q2_020_coefficient_07_0013 : Poly :=
[
  term ((-6308722559776626 : Rat) / 690204756521971) [(4, 1), (8, 1), (16, 1)]
]

/-- Partial product 13 for generator 7. -/
def ep_Q2_020_partial_07_0013 : Poly :=
[
  term ((12617445119553252 : Rat) / 690204756521971) [(0, 1), (4, 1), (8, 1), (16, 1)],
  term ((-6308722559776626 : Rat) / 690204756521971) [(0, 2), (4, 1), (8, 1), (16, 1)],
  term ((-6308722559776626 : Rat) / 690204756521971) [(1, 2), (4, 1), (8, 1), (16, 1)],
  term ((-12617445119553252 : Rat) / 690204756521971) [(4, 1), (8, 1), (12, 1), (16, 1)],
  term ((6308722559776626 : Rat) / 690204756521971) [(4, 1), (8, 1), (12, 2), (16, 1)],
  term ((6308722559776626 : Rat) / 690204756521971) [(4, 1), (8, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 7. -/
theorem ep_Q2_020_partial_07_0013_valid :
    mulPoly ep_Q2_020_coefficient_07_0013
        ep_Q2_020_generator_07_0000_0046 =
      ep_Q2_020_partial_07_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 7. -/
def ep_Q2_020_coefficient_07_0014 : Poly :=
[
  term ((284433477180534099 : Rat) / 28298395017400811) [(4, 1), (12, 1), (16, 1)]
]

/-- Partial product 14 for generator 7. -/
def ep_Q2_020_partial_07_0014 : Poly :=
[
  term ((-568866954361068198 : Rat) / 28298395017400811) [(0, 1), (4, 1), (12, 1), (16, 1)],
  term ((284433477180534099 : Rat) / 28298395017400811) [(0, 2), (4, 1), (12, 1), (16, 1)],
  term ((284433477180534099 : Rat) / 28298395017400811) [(1, 2), (4, 1), (12, 1), (16, 1)],
  term ((-284433477180534099 : Rat) / 28298395017400811) [(4, 1), (12, 1), (13, 2), (16, 1)],
  term ((568866954361068198 : Rat) / 28298395017400811) [(4, 1), (12, 2), (16, 1)],
  term ((-284433477180534099 : Rat) / 28298395017400811) [(4, 1), (12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 7. -/
theorem ep_Q2_020_partial_07_0014_valid :
    mulPoly ep_Q2_020_coefficient_07_0014
        ep_Q2_020_generator_07_0000_0046 =
      ep_Q2_020_partial_07_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 7. -/
def ep_Q2_020_coefficient_07_0015 : Poly :=
[
  term ((-308749414490145696 : Rat) / 28298395017400811) [(4, 1), (14, 1), (16, 1)]
]

/-- Partial product 15 for generator 7. -/
def ep_Q2_020_partial_07_0015 : Poly :=
[
  term ((617498828980291392 : Rat) / 28298395017400811) [(0, 1), (4, 1), (14, 1), (16, 1)],
  term ((-308749414490145696 : Rat) / 28298395017400811) [(0, 2), (4, 1), (14, 1), (16, 1)],
  term ((-308749414490145696 : Rat) / 28298395017400811) [(1, 2), (4, 1), (14, 1), (16, 1)],
  term ((-617498828980291392 : Rat) / 28298395017400811) [(4, 1), (12, 1), (14, 1), (16, 1)],
  term ((308749414490145696 : Rat) / 28298395017400811) [(4, 1), (12, 2), (14, 1), (16, 1)],
  term ((308749414490145696 : Rat) / 28298395017400811) [(4, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 7. -/
theorem ep_Q2_020_partial_07_0015_valid :
    mulPoly ep_Q2_020_coefficient_07_0015
        ep_Q2_020_generator_07_0000_0046 =
      ep_Q2_020_partial_07_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 7. -/
def ep_Q2_020_coefficient_07_0016 : Poly :=
[
  term ((19432336645858176 : Rat) / 28298395017400811) [(4, 1), (16, 1)]
]

/-- Partial product 16 for generator 7. -/
def ep_Q2_020_partial_07_0016 : Poly :=
[
  term ((-38864673291716352 : Rat) / 28298395017400811) [(0, 1), (4, 1), (16, 1)],
  term ((19432336645858176 : Rat) / 28298395017400811) [(0, 2), (4, 1), (16, 1)],
  term ((19432336645858176 : Rat) / 28298395017400811) [(1, 2), (4, 1), (16, 1)],
  term ((38864673291716352 : Rat) / 28298395017400811) [(4, 1), (12, 1), (16, 1)],
  term ((-19432336645858176 : Rat) / 28298395017400811) [(4, 1), (12, 2), (16, 1)],
  term ((-19432336645858176 : Rat) / 28298395017400811) [(4, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 7. -/
theorem ep_Q2_020_partial_07_0016_valid :
    mulPoly ep_Q2_020_coefficient_07_0016
        ep_Q2_020_generator_07_0000_0046 =
      ep_Q2_020_partial_07_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 7. -/
def ep_Q2_020_coefficient_07_0017 : Poly :=
[
  term ((48512102961394764 : Rat) / 28298395017400811) [(4, 2), (16, 1)]
]

/-- Partial product 17 for generator 7. -/
def ep_Q2_020_partial_07_0017 : Poly :=
[
  term ((-97024205922789528 : Rat) / 28298395017400811) [(0, 1), (4, 2), (16, 1)],
  term ((48512102961394764 : Rat) / 28298395017400811) [(0, 2), (4, 2), (16, 1)],
  term ((48512102961394764 : Rat) / 28298395017400811) [(1, 2), (4, 2), (16, 1)],
  term ((97024205922789528 : Rat) / 28298395017400811) [(4, 2), (12, 1), (16, 1)],
  term ((-48512102961394764 : Rat) / 28298395017400811) [(4, 2), (12, 2), (16, 1)],
  term ((-48512102961394764 : Rat) / 28298395017400811) [(4, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 7. -/
theorem ep_Q2_020_partial_07_0017_valid :
    mulPoly ep_Q2_020_coefficient_07_0017
        ep_Q2_020_generator_07_0000_0046 =
      ep_Q2_020_partial_07_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 7. -/
def ep_Q2_020_coefficient_07_0018 : Poly :=
[
  term ((-207961411865445573 : Rat) / 28298395017400811) [(5, 1), (7, 1), (16, 1)]
]

/-- Partial product 18 for generator 7. -/
def ep_Q2_020_partial_07_0018 : Poly :=
[
  term ((415922823730891146 : Rat) / 28298395017400811) [(0, 1), (5, 1), (7, 1), (16, 1)],
  term ((-207961411865445573 : Rat) / 28298395017400811) [(0, 2), (5, 1), (7, 1), (16, 1)],
  term ((-207961411865445573 : Rat) / 28298395017400811) [(1, 2), (5, 1), (7, 1), (16, 1)],
  term ((-415922823730891146 : Rat) / 28298395017400811) [(5, 1), (7, 1), (12, 1), (16, 1)],
  term ((207961411865445573 : Rat) / 28298395017400811) [(5, 1), (7, 1), (12, 2), (16, 1)],
  term ((207961411865445573 : Rat) / 28298395017400811) [(5, 1), (7, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 7. -/
theorem ep_Q2_020_partial_07_0018_valid :
    mulPoly ep_Q2_020_coefficient_07_0018
        ep_Q2_020_generator_07_0000_0046 =
      ep_Q2_020_partial_07_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 7. -/
def ep_Q2_020_coefficient_07_0019 : Poly :=
[
  term ((242985469396902492 : Rat) / 28298395017400811) [(5, 1), (9, 1), (16, 1)]
]

/-- Partial product 19 for generator 7. -/
def ep_Q2_020_partial_07_0019 : Poly :=
[
  term ((-485970938793804984 : Rat) / 28298395017400811) [(0, 1), (5, 1), (9, 1), (16, 1)],
  term ((242985469396902492 : Rat) / 28298395017400811) [(0, 2), (5, 1), (9, 1), (16, 1)],
  term ((242985469396902492 : Rat) / 28298395017400811) [(1, 2), (5, 1), (9, 1), (16, 1)],
  term ((485970938793804984 : Rat) / 28298395017400811) [(5, 1), (9, 1), (12, 1), (16, 1)],
  term ((-242985469396902492 : Rat) / 28298395017400811) [(5, 1), (9, 1), (12, 2), (16, 1)],
  term ((-242985469396902492 : Rat) / 28298395017400811) [(5, 1), (9, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 7. -/
theorem ep_Q2_020_partial_07_0019_valid :
    mulPoly ep_Q2_020_coefficient_07_0019
        ep_Q2_020_generator_07_0000_0046 =
      ep_Q2_020_partial_07_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 7. -/
def ep_Q2_020_coefficient_07_0020 : Poly :=
[
  term ((192854748345603141 : Rat) / 28298395017400811) [(5, 1), (13, 1), (16, 1)]
]

/-- Partial product 20 for generator 7. -/
def ep_Q2_020_partial_07_0020 : Poly :=
[
  term ((-385709496691206282 : Rat) / 28298395017400811) [(0, 1), (5, 1), (13, 1), (16, 1)],
  term ((192854748345603141 : Rat) / 28298395017400811) [(0, 2), (5, 1), (13, 1), (16, 1)],
  term ((192854748345603141 : Rat) / 28298395017400811) [(1, 2), (5, 1), (13, 1), (16, 1)],
  term ((385709496691206282 : Rat) / 28298395017400811) [(5, 1), (12, 1), (13, 1), (16, 1)],
  term ((-192854748345603141 : Rat) / 28298395017400811) [(5, 1), (12, 2), (13, 1), (16, 1)],
  term ((-192854748345603141 : Rat) / 28298395017400811) [(5, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 7. -/
theorem ep_Q2_020_partial_07_0020_valid :
    mulPoly ep_Q2_020_coefficient_07_0020
        ep_Q2_020_generator_07_0000_0046 =
      ep_Q2_020_partial_07_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 7. -/
def ep_Q2_020_coefficient_07_0021 : Poly :=
[
  term ((-280015200133638156 : Rat) / 28298395017400811) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 21 for generator 7. -/
def ep_Q2_020_partial_07_0021 : Poly :=
[
  term ((560030400267276312 : Rat) / 28298395017400811) [(0, 1), (5, 1), (15, 1), (16, 1)],
  term ((-280015200133638156 : Rat) / 28298395017400811) [(0, 2), (5, 1), (15, 1), (16, 1)],
  term ((-280015200133638156 : Rat) / 28298395017400811) [(1, 2), (5, 1), (15, 1), (16, 1)],
  term ((-560030400267276312 : Rat) / 28298395017400811) [(5, 1), (12, 1), (15, 1), (16, 1)],
  term ((280015200133638156 : Rat) / 28298395017400811) [(5, 1), (12, 2), (15, 1), (16, 1)],
  term ((280015200133638156 : Rat) / 28298395017400811) [(5, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 7. -/
theorem ep_Q2_020_partial_07_0021_valid :
    mulPoly ep_Q2_020_coefficient_07_0021
        ep_Q2_020_generator_07_0000_0046 =
      ep_Q2_020_partial_07_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 7. -/
def ep_Q2_020_coefficient_07_0022 : Poly :=
[
  term ((119270047693891278 : Rat) / 28298395017400811) [(5, 2), (16, 1)]
]

/-- Partial product 22 for generator 7. -/
def ep_Q2_020_partial_07_0022 : Poly :=
[
  term ((-238540095387782556 : Rat) / 28298395017400811) [(0, 1), (5, 2), (16, 1)],
  term ((119270047693891278 : Rat) / 28298395017400811) [(0, 2), (5, 2), (16, 1)],
  term ((119270047693891278 : Rat) / 28298395017400811) [(1, 2), (5, 2), (16, 1)],
  term ((238540095387782556 : Rat) / 28298395017400811) [(5, 2), (12, 1), (16, 1)],
  term ((-119270047693891278 : Rat) / 28298395017400811) [(5, 2), (12, 2), (16, 1)],
  term ((-119270047693891278 : Rat) / 28298395017400811) [(5, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 7. -/
theorem ep_Q2_020_partial_07_0022_valid :
    mulPoly ep_Q2_020_coefficient_07_0022
        ep_Q2_020_generator_07_0000_0046 =
      ep_Q2_020_partial_07_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 7. -/
def ep_Q2_020_coefficient_07_0023 : Poly :=
[
  term ((6745411801148508 : Rat) / 975806724737959) [(6, 1), (8, 1), (16, 1)]
]

/-- Partial product 23 for generator 7. -/
def ep_Q2_020_partial_07_0023 : Poly :=
[
  term ((-13490823602297016 : Rat) / 975806724737959) [(0, 1), (6, 1), (8, 1), (16, 1)],
  term ((6745411801148508 : Rat) / 975806724737959) [(0, 2), (6, 1), (8, 1), (16, 1)],
  term ((6745411801148508 : Rat) / 975806724737959) [(1, 2), (6, 1), (8, 1), (16, 1)],
  term ((13490823602297016 : Rat) / 975806724737959) [(6, 1), (8, 1), (12, 1), (16, 1)],
  term ((-6745411801148508 : Rat) / 975806724737959) [(6, 1), (8, 1), (12, 2), (16, 1)],
  term ((-6745411801148508 : Rat) / 975806724737959) [(6, 1), (8, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 7. -/
theorem ep_Q2_020_partial_07_0023_valid :
    mulPoly ep_Q2_020_coefficient_07_0023
        ep_Q2_020_generator_07_0000_0046 =
      ep_Q2_020_partial_07_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 7. -/
def ep_Q2_020_coefficient_07_0024 : Poly :=
[
  term ((-614741053753959225 : Rat) / 113193580069603244) [(6, 1), (12, 1), (16, 1)]
]

/-- Partial product 24 for generator 7. -/
def ep_Q2_020_partial_07_0024 : Poly :=
[
  term ((614741053753959225 : Rat) / 56596790034801622) [(0, 1), (6, 1), (12, 1), (16, 1)],
  term ((-614741053753959225 : Rat) / 113193580069603244) [(0, 2), (6, 1), (12, 1), (16, 1)],
  term ((-614741053753959225 : Rat) / 113193580069603244) [(1, 2), (6, 1), (12, 1), (16, 1)],
  term ((614741053753959225 : Rat) / 113193580069603244) [(6, 1), (12, 1), (13, 2), (16, 1)],
  term ((-614741053753959225 : Rat) / 56596790034801622) [(6, 1), (12, 2), (16, 1)],
  term ((614741053753959225 : Rat) / 113193580069603244) [(6, 1), (12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 7. -/
theorem ep_Q2_020_partial_07_0024_valid :
    mulPoly ep_Q2_020_coefficient_07_0024
        ep_Q2_020_generator_07_0000_0046 =
      ep_Q2_020_partial_07_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 7. -/
def ep_Q2_020_coefficient_07_0025 : Poly :=
[
  term ((-58088396859665619 : Rat) / 113193580069603244) [(6, 1), (16, 1)]
]

/-- Partial product 25 for generator 7. -/
def ep_Q2_020_partial_07_0025 : Poly :=
[
  term ((58088396859665619 : Rat) / 56596790034801622) [(0, 1), (6, 1), (16, 1)],
  term ((-58088396859665619 : Rat) / 113193580069603244) [(0, 2), (6, 1), (16, 1)],
  term ((-58088396859665619 : Rat) / 113193580069603244) [(1, 2), (6, 1), (16, 1)],
  term ((-58088396859665619 : Rat) / 56596790034801622) [(6, 1), (12, 1), (16, 1)],
  term ((58088396859665619 : Rat) / 113193580069603244) [(6, 1), (12, 2), (16, 1)],
  term ((58088396859665619 : Rat) / 113193580069603244) [(6, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 7. -/
theorem ep_Q2_020_partial_07_0025_valid :
    mulPoly ep_Q2_020_coefficient_07_0025
        ep_Q2_020_generator_07_0000_0046 =
      ep_Q2_020_partial_07_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 7. -/
def ep_Q2_020_coefficient_07_0026 : Poly :=
[
  term ((242545192299692151 : Rat) / 56596790034801622) [(6, 2), (16, 1)]
]

/-- Partial product 26 for generator 7. -/
def ep_Q2_020_partial_07_0026 : Poly :=
[
  term ((-242545192299692151 : Rat) / 28298395017400811) [(0, 1), (6, 2), (16, 1)],
  term ((242545192299692151 : Rat) / 56596790034801622) [(0, 2), (6, 2), (16, 1)],
  term ((242545192299692151 : Rat) / 56596790034801622) [(1, 2), (6, 2), (16, 1)],
  term ((242545192299692151 : Rat) / 28298395017400811) [(6, 2), (12, 1), (16, 1)],
  term ((-242545192299692151 : Rat) / 56596790034801622) [(6, 2), (12, 2), (16, 1)],
  term ((-242545192299692151 : Rat) / 56596790034801622) [(6, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 7. -/
theorem ep_Q2_020_partial_07_0026_valid :
    mulPoly ep_Q2_020_coefficient_07_0026
        ep_Q2_020_generator_07_0000_0046 =
      ep_Q2_020_partial_07_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 7. -/
def ep_Q2_020_coefficient_07_0027 : Poly :=
[
  term ((4502198843145228 : Rat) / 28298395017400811) [(7, 1), (9, 1), (16, 1)]
]

/-- Partial product 27 for generator 7. -/
def ep_Q2_020_partial_07_0027 : Poly :=
[
  term ((-9004397686290456 : Rat) / 28298395017400811) [(0, 1), (7, 1), (9, 1), (16, 1)],
  term ((4502198843145228 : Rat) / 28298395017400811) [(0, 2), (7, 1), (9, 1), (16, 1)],
  term ((4502198843145228 : Rat) / 28298395017400811) [(1, 2), (7, 1), (9, 1), (16, 1)],
  term ((9004397686290456 : Rat) / 28298395017400811) [(7, 1), (9, 1), (12, 1), (16, 1)],
  term ((-4502198843145228 : Rat) / 28298395017400811) [(7, 1), (9, 1), (12, 2), (16, 1)],
  term ((-4502198843145228 : Rat) / 28298395017400811) [(7, 1), (9, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 7. -/
theorem ep_Q2_020_partial_07_0027_valid :
    mulPoly ep_Q2_020_coefficient_07_0027
        ep_Q2_020_generator_07_0000_0046 =
      ep_Q2_020_partial_07_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 7. -/
def ep_Q2_020_coefficient_07_0028 : Poly :=
[
  term ((7995558422312292 : Rat) / 28298395017400811) [(7, 1), (11, 1), (16, 1)]
]

/-- Partial product 28 for generator 7. -/
def ep_Q2_020_partial_07_0028 : Poly :=
[
  term ((-15991116844624584 : Rat) / 28298395017400811) [(0, 1), (7, 1), (11, 1), (16, 1)],
  term ((7995558422312292 : Rat) / 28298395017400811) [(0, 2), (7, 1), (11, 1), (16, 1)],
  term ((7995558422312292 : Rat) / 28298395017400811) [(1, 2), (7, 1), (11, 1), (16, 1)],
  term ((15991116844624584 : Rat) / 28298395017400811) [(7, 1), (11, 1), (12, 1), (16, 1)],
  term ((-7995558422312292 : Rat) / 28298395017400811) [(7, 1), (11, 1), (12, 2), (16, 1)],
  term ((-7995558422312292 : Rat) / 28298395017400811) [(7, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 7. -/
theorem ep_Q2_020_partial_07_0028_valid :
    mulPoly ep_Q2_020_coefficient_07_0028
        ep_Q2_020_generator_07_0000_0046 =
      ep_Q2_020_partial_07_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 7. -/
def ep_Q2_020_coefficient_07_0029 : Poly :=
[
  term ((-13454450885202321 : Rat) / 2760819026087884) [(7, 1), (13, 1), (16, 1)]
]

/-- Partial product 29 for generator 7. -/
def ep_Q2_020_partial_07_0029 : Poly :=
[
  term ((13454450885202321 : Rat) / 1380409513043942) [(0, 1), (7, 1), (13, 1), (16, 1)],
  term ((-13454450885202321 : Rat) / 2760819026087884) [(0, 2), (7, 1), (13, 1), (16, 1)],
  term ((-13454450885202321 : Rat) / 2760819026087884) [(1, 2), (7, 1), (13, 1), (16, 1)],
  term ((-13454450885202321 : Rat) / 1380409513043942) [(7, 1), (12, 1), (13, 1), (16, 1)],
  term ((13454450885202321 : Rat) / 2760819026087884) [(7, 1), (12, 2), (13, 1), (16, 1)],
  term ((13454450885202321 : Rat) / 2760819026087884) [(7, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 7. -/
theorem ep_Q2_020_partial_07_0029_valid :
    mulPoly ep_Q2_020_coefficient_07_0029
        ep_Q2_020_generator_07_0000_0046 =
      ep_Q2_020_partial_07_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 7. -/
def ep_Q2_020_coefficient_07_0030 : Poly :=
[
  term ((-1746679789583532 : Rat) / 28298395017400811) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 30 for generator 7. -/
def ep_Q2_020_partial_07_0030 : Poly :=
[
  term ((3493359579167064 : Rat) / 28298395017400811) [(0, 1), (7, 1), (15, 1), (16, 1)],
  term ((-1746679789583532 : Rat) / 28298395017400811) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term ((-1746679789583532 : Rat) / 28298395017400811) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term ((-3493359579167064 : Rat) / 28298395017400811) [(7, 1), (12, 1), (15, 1), (16, 1)],
  term ((1746679789583532 : Rat) / 28298395017400811) [(7, 1), (12, 2), (15, 1), (16, 1)],
  term ((1746679789583532 : Rat) / 28298395017400811) [(7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 7. -/
theorem ep_Q2_020_partial_07_0030_valid :
    mulPoly ep_Q2_020_coefficient_07_0030
        ep_Q2_020_generator_07_0000_0046 =
      ep_Q2_020_partial_07_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 7. -/
def ep_Q2_020_coefficient_07_0031 : Poly :=
[
  term ((250811749460377239 : Rat) / 56596790034801622) [(7, 2), (16, 1)]
]

/-- Partial product 31 for generator 7. -/
def ep_Q2_020_partial_07_0031 : Poly :=
[
  term ((-250811749460377239 : Rat) / 28298395017400811) [(0, 1), (7, 2), (16, 1)],
  term ((250811749460377239 : Rat) / 56596790034801622) [(0, 2), (7, 2), (16, 1)],
  term ((250811749460377239 : Rat) / 56596790034801622) [(1, 2), (7, 2), (16, 1)],
  term ((250811749460377239 : Rat) / 28298395017400811) [(7, 2), (12, 1), (16, 1)],
  term ((-250811749460377239 : Rat) / 56596790034801622) [(7, 2), (12, 2), (16, 1)],
  term ((-250811749460377239 : Rat) / 56596790034801622) [(7, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 7. -/
theorem ep_Q2_020_partial_07_0031_valid :
    mulPoly ep_Q2_020_coefficient_07_0031
        ep_Q2_020_generator_07_0000_0046 =
      ep_Q2_020_partial_07_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 7. -/
def ep_Q2_020_coefficient_07_0032 : Poly :=
[
  term ((6745411801148508 : Rat) / 975806724737959) [(8, 1), (12, 1), (16, 1)]
]

/-- Partial product 32 for generator 7. -/
def ep_Q2_020_partial_07_0032 : Poly :=
[
  term ((-13490823602297016 : Rat) / 975806724737959) [(0, 1), (8, 1), (12, 1), (16, 1)],
  term ((6745411801148508 : Rat) / 975806724737959) [(0, 2), (8, 1), (12, 1), (16, 1)],
  term ((6745411801148508 : Rat) / 975806724737959) [(1, 2), (8, 1), (12, 1), (16, 1)],
  term ((-6745411801148508 : Rat) / 975806724737959) [(8, 1), (12, 1), (13, 2), (16, 1)],
  term ((13490823602297016 : Rat) / 975806724737959) [(8, 1), (12, 2), (16, 1)],
  term ((-6745411801148508 : Rat) / 975806724737959) [(8, 1), (12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 7. -/
theorem ep_Q2_020_partial_07_0032_valid :
    mulPoly ep_Q2_020_coefficient_07_0032
        ep_Q2_020_generator_07_0000_0046 =
      ep_Q2_020_partial_07_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 7. -/
def ep_Q2_020_coefficient_07_0033 : Poly :=
[
  term ((-132576259515771798 : Rat) / 28298395017400811) [(8, 1), (14, 1), (16, 1)]
]

/-- Partial product 33 for generator 7. -/
def ep_Q2_020_partial_07_0033 : Poly :=
[
  term ((265152519031543596 : Rat) / 28298395017400811) [(0, 1), (8, 1), (14, 1), (16, 1)],
  term ((-132576259515771798 : Rat) / 28298395017400811) [(0, 2), (8, 1), (14, 1), (16, 1)],
  term ((-132576259515771798 : Rat) / 28298395017400811) [(1, 2), (8, 1), (14, 1), (16, 1)],
  term ((-265152519031543596 : Rat) / 28298395017400811) [(8, 1), (12, 1), (14, 1), (16, 1)],
  term ((132576259515771798 : Rat) / 28298395017400811) [(8, 1), (12, 2), (14, 1), (16, 1)],
  term ((132576259515771798 : Rat) / 28298395017400811) [(8, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 7. -/
theorem ep_Q2_020_partial_07_0033_valid :
    mulPoly ep_Q2_020_coefficient_07_0033
        ep_Q2_020_generator_07_0000_0046 =
      ep_Q2_020_partial_07_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 7. -/
def ep_Q2_020_coefficient_07_0034 : Poly :=
[
  term ((3372705900574254 : Rat) / 975806724737959) [(8, 1), (16, 1)]
]

/-- Partial product 34 for generator 7. -/
def ep_Q2_020_partial_07_0034 : Poly :=
[
  term ((-6745411801148508 : Rat) / 975806724737959) [(0, 1), (8, 1), (16, 1)],
  term ((3372705900574254 : Rat) / 975806724737959) [(0, 2), (8, 1), (16, 1)],
  term ((3372705900574254 : Rat) / 975806724737959) [(1, 2), (8, 1), (16, 1)],
  term ((6745411801148508 : Rat) / 975806724737959) [(8, 1), (12, 1), (16, 1)],
  term ((-3372705900574254 : Rat) / 975806724737959) [(8, 1), (12, 2), (16, 1)],
  term ((-3372705900574254 : Rat) / 975806724737959) [(8, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 7. -/
theorem ep_Q2_020_partial_07_0034_valid :
    mulPoly ep_Q2_020_coefficient_07_0034
        ep_Q2_020_generator_07_0000_0046 =
      ep_Q2_020_partial_07_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 7. -/
def ep_Q2_020_coefficient_07_0035 : Poly :=
[
  term ((-163450969270788690 : Rat) / 28298395017400811) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 35 for generator 7. -/
def ep_Q2_020_partial_07_0035 : Poly :=
[
  term ((326901938541577380 : Rat) / 28298395017400811) [(0, 1), (9, 1), (13, 1), (16, 1)],
  term ((-163450969270788690 : Rat) / 28298395017400811) [(0, 2), (9, 1), (13, 1), (16, 1)],
  term ((-163450969270788690 : Rat) / 28298395017400811) [(1, 2), (9, 1), (13, 1), (16, 1)],
  term ((-326901938541577380 : Rat) / 28298395017400811) [(9, 1), (12, 1), (13, 1), (16, 1)],
  term ((163450969270788690 : Rat) / 28298395017400811) [(9, 1), (12, 2), (13, 1), (16, 1)],
  term ((163450969270788690 : Rat) / 28298395017400811) [(9, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 7. -/
theorem ep_Q2_020_partial_07_0035_valid :
    mulPoly ep_Q2_020_coefficient_07_0035
        ep_Q2_020_generator_07_0000_0046 =
      ep_Q2_020_partial_07_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 7. -/
def ep_Q2_020_coefficient_07_0036 : Poly :=
[
  term ((-101593330910559000 : Rat) / 28298395017400811) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 36 for generator 7. -/
def ep_Q2_020_partial_07_0036 : Poly :=
[
  term ((203186661821118000 : Rat) / 28298395017400811) [(0, 1), (9, 1), (15, 1), (16, 1)],
  term ((-101593330910559000 : Rat) / 28298395017400811) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((-101593330910559000 : Rat) / 28298395017400811) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((-203186661821118000 : Rat) / 28298395017400811) [(9, 1), (12, 1), (15, 1), (16, 1)],
  term ((101593330910559000 : Rat) / 28298395017400811) [(9, 1), (12, 2), (15, 1), (16, 1)],
  term ((101593330910559000 : Rat) / 28298395017400811) [(9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 7. -/
theorem ep_Q2_020_partial_07_0036_valid :
    mulPoly ep_Q2_020_coefficient_07_0036
        ep_Q2_020_generator_07_0000_0046 =
      ep_Q2_020_partial_07_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 7. -/
def ep_Q2_020_coefficient_07_0037 : Poly :=
[
  term ((731548451631028908 : Rat) / 28298395017400811) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 37 for generator 7. -/
def ep_Q2_020_partial_07_0037 : Poly :=
[
  term ((-1463096903262057816 : Rat) / 28298395017400811) [(0, 1), (11, 1), (15, 1), (16, 1)],
  term ((731548451631028908 : Rat) / 28298395017400811) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((731548451631028908 : Rat) / 28298395017400811) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((1463096903262057816 : Rat) / 28298395017400811) [(11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-731548451631028908 : Rat) / 28298395017400811) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-731548451631028908 : Rat) / 28298395017400811) [(11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 7. -/
theorem ep_Q2_020_partial_07_0037_valid :
    mulPoly ep_Q2_020_coefficient_07_0037
        ep_Q2_020_generator_07_0000_0046 =
      ep_Q2_020_partial_07_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 7. -/
def ep_Q2_020_coefficient_07_0038 : Poly :=
[
  term ((376269112660858785 : Rat) / 113193580069603244) [(12, 1), (14, 1), (16, 1)]
]

/-- Partial product 38 for generator 7. -/
def ep_Q2_020_partial_07_0038 : Poly :=
[
  term ((-376269112660858785 : Rat) / 56596790034801622) [(0, 1), (12, 1), (14, 1), (16, 1)],
  term ((376269112660858785 : Rat) / 113193580069603244) [(0, 2), (12, 1), (14, 1), (16, 1)],
  term ((376269112660858785 : Rat) / 113193580069603244) [(1, 2), (12, 1), (14, 1), (16, 1)],
  term ((-376269112660858785 : Rat) / 113193580069603244) [(12, 1), (13, 2), (14, 1), (16, 1)],
  term ((376269112660858785 : Rat) / 56596790034801622) [(12, 2), (14, 1), (16, 1)],
  term ((-376269112660858785 : Rat) / 113193580069603244) [(12, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 7. -/
theorem ep_Q2_020_partial_07_0038_valid :
    mulPoly ep_Q2_020_coefficient_07_0038
        ep_Q2_020_generator_07_0000_0046 =
      ep_Q2_020_partial_07_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 7. -/
def ep_Q2_020_coefficient_07_0039 : Poly :=
[
  term ((-225391379979754350 : Rat) / 28298395017400811) [(12, 1), (16, 1)]
]

/-- Partial product 39 for generator 7. -/
def ep_Q2_020_partial_07_0039 : Poly :=
[
  term ((450782759959508700 : Rat) / 28298395017400811) [(0, 1), (12, 1), (16, 1)],
  term ((-225391379979754350 : Rat) / 28298395017400811) [(0, 2), (12, 1), (16, 1)],
  term ((-225391379979754350 : Rat) / 28298395017400811) [(1, 2), (12, 1), (16, 1)],
  term ((225391379979754350 : Rat) / 28298395017400811) [(12, 1), (13, 2), (16, 1)],
  term ((-450782759959508700 : Rat) / 28298395017400811) [(12, 2), (16, 1)],
  term ((225391379979754350 : Rat) / 28298395017400811) [(12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 7. -/
theorem ep_Q2_020_partial_07_0039_valid :
    mulPoly ep_Q2_020_coefficient_07_0039
        ep_Q2_020_generator_07_0000_0046 =
      ep_Q2_020_partial_07_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 7. -/
def ep_Q2_020_coefficient_07_0040 : Poly :=
[
  term ((-25050814386426345 : Rat) / 56596790034801622) [(12, 2), (16, 1)]
]

/-- Partial product 40 for generator 7. -/
def ep_Q2_020_partial_07_0040 : Poly :=
[
  term ((25050814386426345 : Rat) / 28298395017400811) [(0, 1), (12, 2), (16, 1)],
  term ((-25050814386426345 : Rat) / 56596790034801622) [(0, 2), (12, 2), (16, 1)],
  term ((-25050814386426345 : Rat) / 56596790034801622) [(1, 2), (12, 2), (16, 1)],
  term ((25050814386426345 : Rat) / 56596790034801622) [(12, 2), (13, 2), (16, 1)],
  term ((-25050814386426345 : Rat) / 28298395017400811) [(12, 3), (16, 1)],
  term ((25050814386426345 : Rat) / 56596790034801622) [(12, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 7. -/
theorem ep_Q2_020_partial_07_0040_valid :
    mulPoly ep_Q2_020_coefficient_07_0040
        ep_Q2_020_generator_07_0000_0046 =
      ep_Q2_020_partial_07_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 7. -/
def ep_Q2_020_coefficient_07_0041 : Poly :=
[
  term ((249507499257601377 : Rat) / 113193580069603244) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 41 for generator 7. -/
def ep_Q2_020_partial_07_0041 : Poly :=
[
  term ((-249507499257601377 : Rat) / 56596790034801622) [(0, 1), (13, 1), (15, 1), (16, 1)],
  term ((249507499257601377 : Rat) / 113193580069603244) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((249507499257601377 : Rat) / 113193580069603244) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((249507499257601377 : Rat) / 56596790034801622) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-249507499257601377 : Rat) / 113193580069603244) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-249507499257601377 : Rat) / 113193580069603244) [(13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 7. -/
theorem ep_Q2_020_partial_07_0041_valid :
    mulPoly ep_Q2_020_coefficient_07_0041
        ep_Q2_020_generator_07_0000_0046 =
      ep_Q2_020_partial_07_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 7. -/
def ep_Q2_020_coefficient_07_0042 : Poly :=
[
  term ((-25050814386426345 : Rat) / 56596790034801622) [(13, 2), (16, 1)]
]

/-- Partial product 42 for generator 7. -/
def ep_Q2_020_partial_07_0042 : Poly :=
[
  term ((25050814386426345 : Rat) / 28298395017400811) [(0, 1), (13, 2), (16, 1)],
  term ((-25050814386426345 : Rat) / 56596790034801622) [(0, 2), (13, 2), (16, 1)],
  term ((-25050814386426345 : Rat) / 56596790034801622) [(1, 2), (13, 2), (16, 1)],
  term ((-25050814386426345 : Rat) / 28298395017400811) [(12, 1), (13, 2), (16, 1)],
  term ((25050814386426345 : Rat) / 56596790034801622) [(12, 2), (13, 2), (16, 1)],
  term ((25050814386426345 : Rat) / 56596790034801622) [(13, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 7. -/
theorem ep_Q2_020_partial_07_0042_valid :
    mulPoly ep_Q2_020_coefficient_07_0042
        ep_Q2_020_generator_07_0000_0046 =
      ep_Q2_020_partial_07_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 7. -/
def ep_Q2_020_coefficient_07_0043 : Poly :=
[
  term ((2710584405807584655 : Rat) / 113193580069603244) [(14, 1), (16, 1)]
]

/-- Partial product 43 for generator 7. -/
def ep_Q2_020_partial_07_0043 : Poly :=
[
  term ((-2710584405807584655 : Rat) / 56596790034801622) [(0, 1), (14, 1), (16, 1)],
  term ((2710584405807584655 : Rat) / 113193580069603244) [(0, 2), (14, 1), (16, 1)],
  term ((2710584405807584655 : Rat) / 113193580069603244) [(1, 2), (14, 1), (16, 1)],
  term ((2710584405807584655 : Rat) / 56596790034801622) [(12, 1), (14, 1), (16, 1)],
  term ((-2710584405807584655 : Rat) / 113193580069603244) [(12, 2), (14, 1), (16, 1)],
  term ((-2710584405807584655 : Rat) / 113193580069603244) [(13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 7. -/
theorem ep_Q2_020_partial_07_0043_valid :
    mulPoly ep_Q2_020_coefficient_07_0043
        ep_Q2_020_generator_07_0000_0046 =
      ep_Q2_020_partial_07_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 7. -/
def ep_Q2_020_coefficient_07_0044 : Poly :=
[
  term ((-893325140779787937 : Rat) / 56596790034801622) [(14, 2), (16, 1)]
]

/-- Partial product 44 for generator 7. -/
def ep_Q2_020_partial_07_0044 : Poly :=
[
  term ((893325140779787937 : Rat) / 28298395017400811) [(0, 1), (14, 2), (16, 1)],
  term ((-893325140779787937 : Rat) / 56596790034801622) [(0, 2), (14, 2), (16, 1)],
  term ((-893325140779787937 : Rat) / 56596790034801622) [(1, 2), (14, 2), (16, 1)],
  term ((-893325140779787937 : Rat) / 28298395017400811) [(12, 1), (14, 2), (16, 1)],
  term ((893325140779787937 : Rat) / 56596790034801622) [(12, 2), (14, 2), (16, 1)],
  term ((893325140779787937 : Rat) / 56596790034801622) [(13, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 7. -/
theorem ep_Q2_020_partial_07_0044_valid :
    mulPoly ep_Q2_020_coefficient_07_0044
        ep_Q2_020_generator_07_0000_0046 =
      ep_Q2_020_partial_07_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 7. -/
def ep_Q2_020_coefficient_07_0045 : Poly :=
[
  term ((-594132881749043829 : Rat) / 56596790034801622) [(15, 2), (16, 1)]
]

/-- Partial product 45 for generator 7. -/
def ep_Q2_020_partial_07_0045 : Poly :=
[
  term ((594132881749043829 : Rat) / 28298395017400811) [(0, 1), (15, 2), (16, 1)],
  term ((-594132881749043829 : Rat) / 56596790034801622) [(0, 2), (15, 2), (16, 1)],
  term ((-594132881749043829 : Rat) / 56596790034801622) [(1, 2), (15, 2), (16, 1)],
  term ((-594132881749043829 : Rat) / 28298395017400811) [(12, 1), (15, 2), (16, 1)],
  term ((594132881749043829 : Rat) / 56596790034801622) [(12, 2), (15, 2), (16, 1)],
  term ((594132881749043829 : Rat) / 56596790034801622) [(13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 7. -/
theorem ep_Q2_020_partial_07_0045_valid :
    mulPoly ep_Q2_020_coefficient_07_0045
        ep_Q2_020_generator_07_0000_0046 =
      ep_Q2_020_partial_07_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 7. -/
def ep_Q2_020_coefficient_07_0046 : Poly :=
[
  term ((-1527085397084565573 : Rat) / 226387160139206488) [(16, 1)]
]

/-- Partial product 46 for generator 7. -/
def ep_Q2_020_partial_07_0046 : Poly :=
[
  term ((1527085397084565573 : Rat) / 113193580069603244) [(0, 1), (16, 1)],
  term ((-1527085397084565573 : Rat) / 226387160139206488) [(0, 2), (16, 1)],
  term ((-1527085397084565573 : Rat) / 226387160139206488) [(1, 2), (16, 1)],
  term ((-1527085397084565573 : Rat) / 113193580069603244) [(12, 1), (16, 1)],
  term ((1527085397084565573 : Rat) / 226387160139206488) [(12, 2), (16, 1)],
  term ((1527085397084565573 : Rat) / 226387160139206488) [(13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 7. -/
theorem ep_Q2_020_partial_07_0046_valid :
    mulPoly ep_Q2_020_coefficient_07_0046
        ep_Q2_020_generator_07_0000_0046 =
      ep_Q2_020_partial_07_0046 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_020_partials_07_0000_0046 : List Poly :=
[
  ep_Q2_020_partial_07_0000,
  ep_Q2_020_partial_07_0001,
  ep_Q2_020_partial_07_0002,
  ep_Q2_020_partial_07_0003,
  ep_Q2_020_partial_07_0004,
  ep_Q2_020_partial_07_0005,
  ep_Q2_020_partial_07_0006,
  ep_Q2_020_partial_07_0007,
  ep_Q2_020_partial_07_0008,
  ep_Q2_020_partial_07_0009,
  ep_Q2_020_partial_07_0010,
  ep_Q2_020_partial_07_0011,
  ep_Q2_020_partial_07_0012,
  ep_Q2_020_partial_07_0013,
  ep_Q2_020_partial_07_0014,
  ep_Q2_020_partial_07_0015,
  ep_Q2_020_partial_07_0016,
  ep_Q2_020_partial_07_0017,
  ep_Q2_020_partial_07_0018,
  ep_Q2_020_partial_07_0019,
  ep_Q2_020_partial_07_0020,
  ep_Q2_020_partial_07_0021,
  ep_Q2_020_partial_07_0022,
  ep_Q2_020_partial_07_0023,
  ep_Q2_020_partial_07_0024,
  ep_Q2_020_partial_07_0025,
  ep_Q2_020_partial_07_0026,
  ep_Q2_020_partial_07_0027,
  ep_Q2_020_partial_07_0028,
  ep_Q2_020_partial_07_0029,
  ep_Q2_020_partial_07_0030,
  ep_Q2_020_partial_07_0031,
  ep_Q2_020_partial_07_0032,
  ep_Q2_020_partial_07_0033,
  ep_Q2_020_partial_07_0034,
  ep_Q2_020_partial_07_0035,
  ep_Q2_020_partial_07_0036,
  ep_Q2_020_partial_07_0037,
  ep_Q2_020_partial_07_0038,
  ep_Q2_020_partial_07_0039,
  ep_Q2_020_partial_07_0040,
  ep_Q2_020_partial_07_0041,
  ep_Q2_020_partial_07_0042,
  ep_Q2_020_partial_07_0043,
  ep_Q2_020_partial_07_0044,
  ep_Q2_020_partial_07_0045,
  ep_Q2_020_partial_07_0046
]

/-- Sum of partial products in this block. -/
def ep_Q2_020_block_07_0000_0046 : Poly :=
[
  term ((15007255382258568 : Rat) / 28298395017400811) [(0, 1), (1, 1), (5, 1), (16, 1)],
  term ((236495384115444048 : Rat) / 28298395017400811) [(0, 1), (1, 1), (7, 1), (16, 1)],
  term ((-29652664255889904 : Rat) / 28298395017400811) [(0, 1), (1, 1), (9, 1), (16, 1)],
  term ((-88957992767669712 : Rat) / 28298395017400811) [(0, 1), (1, 1), (11, 1), (16, 1)],
  term ((-1292474816177310 : Rat) / 28298395017400811) [(0, 1), (1, 1), (13, 1), (16, 1)],
  term ((201989038429015404 : Rat) / 28298395017400811) [(0, 1), (1, 2), (4, 1), (16, 1)],
  term ((-266108519468118 : Rat) / 690204756521971) [(0, 1), (1, 2), (6, 1), (16, 1)],
  term ((-15130904457077361 : Rat) / 28298395017400811) [(0, 1), (1, 2), (12, 1), (16, 1)],
  term ((-103284034103452500 : Rat) / 28298395017400811) [(0, 1), (1, 2), (14, 1), (16, 1)],
  term ((496948356572730285 : Rat) / 113193580069603244) [(0, 1), (1, 2), (16, 1)],
  term ((150665761723360650 : Rat) / 28298395017400811) [(0, 1), (4, 1), (6, 1), (16, 1)],
  term ((12617445119553252 : Rat) / 690204756521971) [(0, 1), (4, 1), (8, 1), (16, 1)],
  term ((-164888877503037390 : Rat) / 28298395017400811) [(0, 1), (4, 1), (12, 1), (16, 1)],
  term ((-201989038429015404 : Rat) / 28298395017400811) [(0, 1), (4, 1), (12, 2), (16, 1)],
  term ((-201989038429015404 : Rat) / 28298395017400811) [(0, 1), (4, 1), (13, 2), (16, 1)],
  term ((617498828980291392 : Rat) / 28298395017400811) [(0, 1), (4, 1), (14, 1), (16, 1)],
  term ((-38864673291716352 : Rat) / 28298395017400811) [(0, 1), (4, 1), (16, 1)],
  term ((-97024205922789528 : Rat) / 28298395017400811) [(0, 1), (4, 2), (16, 1)],
  term ((415922823730891146 : Rat) / 28298395017400811) [(0, 1), (5, 1), (7, 1), (16, 1)],
  term ((-485970938793804984 : Rat) / 28298395017400811) [(0, 1), (5, 1), (9, 1), (16, 1)],
  term ((-385709496691206282 : Rat) / 28298395017400811) [(0, 1), (5, 1), (13, 1), (16, 1)],
  term ((560030400267276312 : Rat) / 28298395017400811) [(0, 1), (5, 1), (15, 1), (16, 1)],
  term ((-238540095387782556 : Rat) / 28298395017400811) [(0, 1), (5, 2), (16, 1)],
  term ((-13490823602297016 : Rat) / 975806724737959) [(0, 1), (6, 1), (8, 1), (16, 1)],
  term ((571099256561187873 : Rat) / 56596790034801622) [(0, 1), (6, 1), (12, 1), (16, 1)],
  term ((266108519468118 : Rat) / 690204756521971) [(0, 1), (6, 1), (12, 2), (16, 1)],
  term ((266108519468118 : Rat) / 690204756521971) [(0, 1), (6, 1), (13, 2), (16, 1)],
  term ((58088396859665619 : Rat) / 56596790034801622) [(0, 1), (6, 1), (16, 1)],
  term ((-242545192299692151 : Rat) / 28298395017400811) [(0, 1), (6, 2), (16, 1)],
  term ((-9004397686290456 : Rat) / 28298395017400811) [(0, 1), (7, 1), (9, 1), (16, 1)],
  term ((-15991116844624584 : Rat) / 28298395017400811) [(0, 1), (7, 1), (11, 1), (16, 1)],
  term ((13454450885202321 : Rat) / 1380409513043942) [(0, 1), (7, 1), (13, 1), (16, 1)],
  term ((3493359579167064 : Rat) / 28298395017400811) [(0, 1), (7, 1), (15, 1), (16, 1)],
  term ((-250811749460377239 : Rat) / 28298395017400811) [(0, 1), (7, 2), (16, 1)],
  term ((-13490823602297016 : Rat) / 975806724737959) [(0, 1), (8, 1), (12, 1), (16, 1)],
  term ((265152519031543596 : Rat) / 28298395017400811) [(0, 1), (8, 1), (14, 1), (16, 1)],
  term ((-6745411801148508 : Rat) / 975806724737959) [(0, 1), (8, 1), (16, 1)],
  term ((326901938541577380 : Rat) / 28298395017400811) [(0, 1), (9, 1), (13, 1), (16, 1)],
  term ((203186661821118000 : Rat) / 28298395017400811) [(0, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1463096903262057816 : Rat) / 28298395017400811) [(0, 1), (11, 1), (15, 1), (16, 1)],
  term ((15130904457077361 : Rat) / 28298395017400811) [(0, 1), (12, 1), (13, 2), (16, 1)],
  term ((-789405249074668785 : Rat) / 56596790034801622) [(0, 1), (12, 1), (14, 1), (16, 1)],
  term ((1129757940447162117 : Rat) / 56596790034801622) [(0, 1), (12, 1), (16, 1)],
  term ((103284034103452500 : Rat) / 28298395017400811) [(0, 1), (12, 2), (14, 1), (16, 1)],
  term ((-249036398639058225 : Rat) / 113193580069603244) [(0, 1), (12, 2), (16, 1)],
  term ((15130904457077361 : Rat) / 28298395017400811) [(0, 1), (12, 3), (16, 1)],
  term ((-249507499257601377 : Rat) / 56596790034801622) [(0, 1), (13, 1), (15, 1), (16, 1)],
  term ((103284034103452500 : Rat) / 28298395017400811) [(0, 1), (13, 2), (14, 1), (16, 1)],
  term ((-127989162982439337 : Rat) / 113193580069603244) [(0, 1), (13, 2), (16, 1)],
  term ((-2710584405807584655 : Rat) / 56596790034801622) [(0, 1), (14, 1), (16, 1)],
  term ((893325140779787937 : Rat) / 28298395017400811) [(0, 1), (14, 2), (16, 1)],
  term ((594132881749043829 : Rat) / 28298395017400811) [(0, 1), (15, 2), (16, 1)],
  term ((1527085397084565573 : Rat) / 113193580069603244) [(0, 1), (16, 1)],
  term ((-7503627691129284 : Rat) / 28298395017400811) [(0, 2), (1, 1), (5, 1), (16, 1)],
  term ((-118247692057722024 : Rat) / 28298395017400811) [(0, 2), (1, 1), (7, 1), (16, 1)],
  term ((14826332127944952 : Rat) / 28298395017400811) [(0, 2), (1, 1), (9, 1), (16, 1)],
  term ((44478996383834856 : Rat) / 28298395017400811) [(0, 2), (1, 1), (11, 1), (16, 1)],
  term ((646237408088655 : Rat) / 28298395017400811) [(0, 2), (1, 1), (13, 1), (16, 1)],
  term ((67188984011146392 : Rat) / 28298395017400811) [(0, 2), (1, 2), (16, 1)],
  term ((-75332880861680325 : Rat) / 28298395017400811) [(0, 2), (4, 1), (6, 1), (16, 1)],
  term ((-6308722559776626 : Rat) / 690204756521971) [(0, 2), (4, 1), (8, 1), (16, 1)],
  term ((284433477180534099 : Rat) / 28298395017400811) [(0, 2), (4, 1), (12, 1), (16, 1)],
  term ((-308749414490145696 : Rat) / 28298395017400811) [(0, 2), (4, 1), (14, 1), (16, 1)],
  term ((-384545740212172632 : Rat) / 28298395017400811) [(0, 2), (4, 1), (16, 1)],
  term ((48512102961394764 : Rat) / 28298395017400811) [(0, 2), (4, 2), (16, 1)],
  term ((-207961411865445573 : Rat) / 28298395017400811) [(0, 2), (5, 1), (7, 1), (16, 1)],
  term ((242985469396902492 : Rat) / 28298395017400811) [(0, 2), (5, 1), (9, 1), (16, 1)],
  term ((192854748345603141 : Rat) / 28298395017400811) [(0, 2), (5, 1), (13, 1), (16, 1)],
  term ((-280015200133638156 : Rat) / 28298395017400811) [(0, 2), (5, 1), (15, 1), (16, 1)],
  term ((119270047693891278 : Rat) / 28298395017400811) [(0, 2), (5, 2), (16, 1)],
  term ((6745411801148508 : Rat) / 975806724737959) [(0, 2), (6, 1), (8, 1), (16, 1)],
  term ((-614741053753959225 : Rat) / 113193580069603244) [(0, 2), (6, 1), (12, 1), (16, 1)],
  term ((29195197525877085 : Rat) / 113193580069603244) [(0, 2), (6, 1), (16, 1)],
  term ((242545192299692151 : Rat) / 56596790034801622) [(0, 2), (6, 2), (16, 1)],
  term ((4502198843145228 : Rat) / 28298395017400811) [(0, 2), (7, 1), (9, 1), (16, 1)],
  term ((7995558422312292 : Rat) / 28298395017400811) [(0, 2), (7, 1), (11, 1), (16, 1)],
  term ((-13454450885202321 : Rat) / 2760819026087884) [(0, 2), (7, 1), (13, 1), (16, 1)],
  term ((-1746679789583532 : Rat) / 28298395017400811) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term ((250811749460377239 : Rat) / 56596790034801622) [(0, 2), (7, 2), (16, 1)],
  term ((6745411801148508 : Rat) / 975806724737959) [(0, 2), (8, 1), (12, 1), (16, 1)],
  term ((-132576259515771798 : Rat) / 28298395017400811) [(0, 2), (8, 1), (14, 1), (16, 1)],
  term ((3372705900574254 : Rat) / 975806724737959) [(0, 2), (8, 1), (16, 1)],
  term ((-163450969270788690 : Rat) / 28298395017400811) [(0, 2), (9, 1), (13, 1), (16, 1)],
  term ((-101593330910559000 : Rat) / 28298395017400811) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((731548451631028908 : Rat) / 28298395017400811) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((376269112660858785 : Rat) / 113193580069603244) [(0, 2), (12, 1), (14, 1), (16, 1)],
  term ((6437380967839548 : Rat) / 28298395017400811) [(0, 2), (12, 1), (16, 1)],
  term ((-226617766419865521 : Rat) / 56596790034801622) [(0, 2), (12, 2), (16, 1)],
  term ((249507499257601377 : Rat) / 113193580069603244) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((-226617766419865521 : Rat) / 56596790034801622) [(0, 2), (13, 2), (16, 1)],
  term ((3536856678635204655 : Rat) / 113193580069603244) [(0, 2), (14, 1), (16, 1)],
  term ((-893325140779787937 : Rat) / 56596790034801622) [(0, 2), (14, 2), (16, 1)],
  term ((-594132881749043829 : Rat) / 56596790034801622) [(0, 2), (15, 2), (16, 1)],
  term ((-2439855079197144441 : Rat) / 226387160139206488) [(0, 2), (16, 1)],
  term ((201989038429015404 : Rat) / 28298395017400811) [(0, 3), (4, 1), (16, 1)],
  term ((-266108519468118 : Rat) / 690204756521971) [(0, 3), (6, 1), (16, 1)],
  term ((-15130904457077361 : Rat) / 28298395017400811) [(0, 3), (12, 1), (16, 1)],
  term ((-103284034103452500 : Rat) / 28298395017400811) [(0, 3), (14, 1), (16, 1)],
  term ((-578075387605611987 : Rat) / 113193580069603244) [(0, 3), (16, 1)],
  term ((100783476016719588 : Rat) / 28298395017400811) [(0, 4), (16, 1)],
  term ((-15007255382258568 : Rat) / 28298395017400811) [(1, 1), (5, 1), (12, 1), (16, 1)],
  term ((7503627691129284 : Rat) / 28298395017400811) [(1, 1), (5, 1), (12, 2), (16, 1)],
  term ((7503627691129284 : Rat) / 28298395017400811) [(1, 1), (5, 1), (13, 2), (16, 1)],
  term ((-236495384115444048 : Rat) / 28298395017400811) [(1, 1), (7, 1), (12, 1), (16, 1)],
  term ((118247692057722024 : Rat) / 28298395017400811) [(1, 1), (7, 1), (12, 2), (16, 1)],
  term ((118247692057722024 : Rat) / 28298395017400811) [(1, 1), (7, 1), (13, 2), (16, 1)],
  term ((29652664255889904 : Rat) / 28298395017400811) [(1, 1), (9, 1), (12, 1), (16, 1)],
  term ((-14826332127944952 : Rat) / 28298395017400811) [(1, 1), (9, 1), (12, 2), (16, 1)],
  term ((-14826332127944952 : Rat) / 28298395017400811) [(1, 1), (9, 1), (13, 2), (16, 1)],
  term ((88957992767669712 : Rat) / 28298395017400811) [(1, 1), (11, 1), (12, 1), (16, 1)],
  term ((-44478996383834856 : Rat) / 28298395017400811) [(1, 1), (11, 1), (12, 2), (16, 1)],
  term ((-44478996383834856 : Rat) / 28298395017400811) [(1, 1), (11, 1), (13, 2), (16, 1)],
  term ((1292474816177310 : Rat) / 28298395017400811) [(1, 1), (12, 1), (13, 1), (16, 1)],
  term ((-646237408088655 : Rat) / 28298395017400811) [(1, 1), (12, 2), (13, 1), (16, 1)],
  term ((-646237408088655 : Rat) / 28298395017400811) [(1, 1), (13, 3), (16, 1)],
  term ((-75332880861680325 : Rat) / 28298395017400811) [(1, 2), (4, 1), (6, 1), (16, 1)],
  term ((-6308722559776626 : Rat) / 690204756521971) [(1, 2), (4, 1), (8, 1), (16, 1)],
  term ((284433477180534099 : Rat) / 28298395017400811) [(1, 2), (4, 1), (12, 1), (16, 1)],
  term ((-308749414490145696 : Rat) / 28298395017400811) [(1, 2), (4, 1), (14, 1), (16, 1)],
  term ((19432336645858176 : Rat) / 28298395017400811) [(1, 2), (4, 1), (16, 1)],
  term ((48512102961394764 : Rat) / 28298395017400811) [(1, 2), (4, 2), (16, 1)],
  term ((-207961411865445573 : Rat) / 28298395017400811) [(1, 2), (5, 1), (7, 1), (16, 1)],
  term ((242985469396902492 : Rat) / 28298395017400811) [(1, 2), (5, 1), (9, 1), (16, 1)],
  term ((192854748345603141 : Rat) / 28298395017400811) [(1, 2), (5, 1), (13, 1), (16, 1)],
  term ((-280015200133638156 : Rat) / 28298395017400811) [(1, 2), (5, 1), (15, 1), (16, 1)],
  term ((119270047693891278 : Rat) / 28298395017400811) [(1, 2), (5, 2), (16, 1)],
  term ((6745411801148508 : Rat) / 975806724737959) [(1, 2), (6, 1), (8, 1), (16, 1)],
  term ((-614741053753959225 : Rat) / 113193580069603244) [(1, 2), (6, 1), (12, 1), (16, 1)],
  term ((-58088396859665619 : Rat) / 113193580069603244) [(1, 2), (6, 1), (16, 1)],
  term ((242545192299692151 : Rat) / 56596790034801622) [(1, 2), (6, 2), (16, 1)],
  term ((4502198843145228 : Rat) / 28298395017400811) [(1, 2), (7, 1), (9, 1), (16, 1)],
  term ((7995558422312292 : Rat) / 28298395017400811) [(1, 2), (7, 1), (11, 1), (16, 1)],
  term ((-13454450885202321 : Rat) / 2760819026087884) [(1, 2), (7, 1), (13, 1), (16, 1)],
  term ((-1746679789583532 : Rat) / 28298395017400811) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term ((250811749460377239 : Rat) / 56596790034801622) [(1, 2), (7, 2), (16, 1)],
  term ((6745411801148508 : Rat) / 975806724737959) [(1, 2), (8, 1), (12, 1), (16, 1)],
  term ((-132576259515771798 : Rat) / 28298395017400811) [(1, 2), (8, 1), (14, 1), (16, 1)],
  term ((3372705900574254 : Rat) / 975806724737959) [(1, 2), (8, 1), (16, 1)],
  term ((-163450969270788690 : Rat) / 28298395017400811) [(1, 2), (9, 1), (13, 1), (16, 1)],
  term ((-101593330910559000 : Rat) / 28298395017400811) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((731548451631028908 : Rat) / 28298395017400811) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((376269112660858785 : Rat) / 113193580069603244) [(1, 2), (12, 1), (14, 1), (16, 1)],
  term ((-292580363990900742 : Rat) / 28298395017400811) [(1, 2), (12, 1), (16, 1)],
  term ((42138169624720047 : Rat) / 56596790034801622) [(1, 2), (12, 2), (16, 1)],
  term ((249507499257601377 : Rat) / 113193580069603244) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((42138169624720047 : Rat) / 56596790034801622) [(1, 2), (13, 2), (16, 1)],
  term ((2710584405807584655 : Rat) / 113193580069603244) [(1, 2), (14, 1), (16, 1)],
  term ((-893325140779787937 : Rat) / 56596790034801622) [(1, 2), (14, 2), (16, 1)],
  term ((-594132881749043829 : Rat) / 56596790034801622) [(1, 2), (15, 2), (16, 1)],
  term ((-1527085397084565573 : Rat) / 226387160139206488) [(1, 2), (16, 1)],
  term ((-7503627691129284 : Rat) / 28298395017400811) [(1, 3), (5, 1), (16, 1)],
  term ((-118247692057722024 : Rat) / 28298395017400811) [(1, 3), (7, 1), (16, 1)],
  term ((14826332127944952 : Rat) / 28298395017400811) [(1, 3), (9, 1), (16, 1)],
  term ((44478996383834856 : Rat) / 28298395017400811) [(1, 3), (11, 1), (16, 1)],
  term ((646237408088655 : Rat) / 28298395017400811) [(1, 3), (13, 1), (16, 1)],
  term ((-33594492005573196 : Rat) / 28298395017400811) [(1, 4), (16, 1)],
  term ((-150665761723360650 : Rat) / 28298395017400811) [(4, 1), (6, 1), (12, 1), (16, 1)],
  term ((75332880861680325 : Rat) / 28298395017400811) [(4, 1), (6, 1), (12, 2), (16, 1)],
  term ((75332880861680325 : Rat) / 28298395017400811) [(4, 1), (6, 1), (13, 2), (16, 1)],
  term ((-12617445119553252 : Rat) / 690204756521971) [(4, 1), (8, 1), (12, 1), (16, 1)],
  term ((6308722559776626 : Rat) / 690204756521971) [(4, 1), (8, 1), (12, 2), (16, 1)],
  term ((6308722559776626 : Rat) / 690204756521971) [(4, 1), (8, 1), (13, 2), (16, 1)],
  term ((-284433477180534099 : Rat) / 28298395017400811) [(4, 1), (12, 1), (13, 2), (16, 1)],
  term ((-617498828980291392 : Rat) / 28298395017400811) [(4, 1), (12, 1), (14, 1), (16, 1)],
  term ((38864673291716352 : Rat) / 28298395017400811) [(4, 1), (12, 1), (16, 1)],
  term ((308749414490145696 : Rat) / 28298395017400811) [(4, 1), (12, 2), (14, 1), (16, 1)],
  term ((549434617715210022 : Rat) / 28298395017400811) [(4, 1), (12, 2), (16, 1)],
  term ((-284433477180534099 : Rat) / 28298395017400811) [(4, 1), (12, 3), (16, 1)],
  term ((308749414490145696 : Rat) / 28298395017400811) [(4, 1), (13, 2), (14, 1), (16, 1)],
  term ((-19432336645858176 : Rat) / 28298395017400811) [(4, 1), (13, 2), (16, 1)],
  term ((97024205922789528 : Rat) / 28298395017400811) [(4, 2), (12, 1), (16, 1)],
  term ((-48512102961394764 : Rat) / 28298395017400811) [(4, 2), (12, 2), (16, 1)],
  term ((-48512102961394764 : Rat) / 28298395017400811) [(4, 2), (13, 2), (16, 1)],
  term ((-415922823730891146 : Rat) / 28298395017400811) [(5, 1), (7, 1), (12, 1), (16, 1)],
  term ((207961411865445573 : Rat) / 28298395017400811) [(5, 1), (7, 1), (12, 2), (16, 1)],
  term ((207961411865445573 : Rat) / 28298395017400811) [(5, 1), (7, 1), (13, 2), (16, 1)],
  term ((485970938793804984 : Rat) / 28298395017400811) [(5, 1), (9, 1), (12, 1), (16, 1)],
  term ((-242985469396902492 : Rat) / 28298395017400811) [(5, 1), (9, 1), (12, 2), (16, 1)],
  term ((-242985469396902492 : Rat) / 28298395017400811) [(5, 1), (9, 1), (13, 2), (16, 1)],
  term ((385709496691206282 : Rat) / 28298395017400811) [(5, 1), (12, 1), (13, 1), (16, 1)],
  term ((-560030400267276312 : Rat) / 28298395017400811) [(5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-192854748345603141 : Rat) / 28298395017400811) [(5, 1), (12, 2), (13, 1), (16, 1)],
  term ((280015200133638156 : Rat) / 28298395017400811) [(5, 1), (12, 2), (15, 1), (16, 1)],
  term ((280015200133638156 : Rat) / 28298395017400811) [(5, 1), (13, 2), (15, 1), (16, 1)],
  term ((-192854748345603141 : Rat) / 28298395017400811) [(5, 1), (13, 3), (16, 1)],
  term ((238540095387782556 : Rat) / 28298395017400811) [(5, 2), (12, 1), (16, 1)],
  term ((-119270047693891278 : Rat) / 28298395017400811) [(5, 2), (12, 2), (16, 1)],
  term ((-119270047693891278 : Rat) / 28298395017400811) [(5, 2), (13, 2), (16, 1)],
  term ((13490823602297016 : Rat) / 975806724737959) [(6, 1), (8, 1), (12, 1), (16, 1)],
  term ((-6745411801148508 : Rat) / 975806724737959) [(6, 1), (8, 1), (12, 2), (16, 1)],
  term ((-6745411801148508 : Rat) / 975806724737959) [(6, 1), (8, 1), (13, 2), (16, 1)],
  term ((614741053753959225 : Rat) / 113193580069603244) [(6, 1), (12, 1), (13, 2), (16, 1)],
  term ((-58088396859665619 : Rat) / 56596790034801622) [(6, 1), (12, 1), (16, 1)],
  term ((-1171393710648252831 : Rat) / 113193580069603244) [(6, 1), (12, 2), (16, 1)],
  term ((614741053753959225 : Rat) / 113193580069603244) [(6, 1), (12, 3), (16, 1)],
  term ((58088396859665619 : Rat) / 113193580069603244) [(6, 1), (13, 2), (16, 1)],
  term ((242545192299692151 : Rat) / 28298395017400811) [(6, 2), (12, 1), (16, 1)],
  term ((-242545192299692151 : Rat) / 56596790034801622) [(6, 2), (12, 2), (16, 1)],
  term ((-242545192299692151 : Rat) / 56596790034801622) [(6, 2), (13, 2), (16, 1)],
  term ((9004397686290456 : Rat) / 28298395017400811) [(7, 1), (9, 1), (12, 1), (16, 1)],
  term ((-4502198843145228 : Rat) / 28298395017400811) [(7, 1), (9, 1), (12, 2), (16, 1)],
  term ((-4502198843145228 : Rat) / 28298395017400811) [(7, 1), (9, 1), (13, 2), (16, 1)],
  term ((15991116844624584 : Rat) / 28298395017400811) [(7, 1), (11, 1), (12, 1), (16, 1)],
  term ((-7995558422312292 : Rat) / 28298395017400811) [(7, 1), (11, 1), (12, 2), (16, 1)],
  term ((-7995558422312292 : Rat) / 28298395017400811) [(7, 1), (11, 1), (13, 2), (16, 1)],
  term ((-13454450885202321 : Rat) / 1380409513043942) [(7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-3493359579167064 : Rat) / 28298395017400811) [(7, 1), (12, 1), (15, 1), (16, 1)],
  term ((13454450885202321 : Rat) / 2760819026087884) [(7, 1), (12, 2), (13, 1), (16, 1)],
  term ((1746679789583532 : Rat) / 28298395017400811) [(7, 1), (12, 2), (15, 1), (16, 1)],
  term ((1746679789583532 : Rat) / 28298395017400811) [(7, 1), (13, 2), (15, 1), (16, 1)],
  term ((13454450885202321 : Rat) / 2760819026087884) [(7, 1), (13, 3), (16, 1)],
  term ((250811749460377239 : Rat) / 28298395017400811) [(7, 2), (12, 1), (16, 1)],
  term ((-250811749460377239 : Rat) / 56596790034801622) [(7, 2), (12, 2), (16, 1)],
  term ((-250811749460377239 : Rat) / 56596790034801622) [(7, 2), (13, 2), (16, 1)],
  term ((-6745411801148508 : Rat) / 975806724737959) [(8, 1), (12, 1), (13, 2), (16, 1)],
  term ((-265152519031543596 : Rat) / 28298395017400811) [(8, 1), (12, 1), (14, 1), (16, 1)],
  term ((6745411801148508 : Rat) / 975806724737959) [(8, 1), (12, 1), (16, 1)],
  term ((132576259515771798 : Rat) / 28298395017400811) [(8, 1), (12, 2), (14, 1), (16, 1)],
  term ((10118117701722762 : Rat) / 975806724737959) [(8, 1), (12, 2), (16, 1)],
  term ((-6745411801148508 : Rat) / 975806724737959) [(8, 1), (12, 3), (16, 1)],
  term ((132576259515771798 : Rat) / 28298395017400811) [(8, 1), (13, 2), (14, 1), (16, 1)],
  term ((-3372705900574254 : Rat) / 975806724737959) [(8, 1), (13, 2), (16, 1)],
  term ((-326901938541577380 : Rat) / 28298395017400811) [(9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-203186661821118000 : Rat) / 28298395017400811) [(9, 1), (12, 1), (15, 1), (16, 1)],
  term ((163450969270788690 : Rat) / 28298395017400811) [(9, 1), (12, 2), (13, 1), (16, 1)],
  term ((101593330910559000 : Rat) / 28298395017400811) [(9, 1), (12, 2), (15, 1), (16, 1)],
  term ((101593330910559000 : Rat) / 28298395017400811) [(9, 1), (13, 2), (15, 1), (16, 1)],
  term ((163450969270788690 : Rat) / 28298395017400811) [(9, 1), (13, 3), (16, 1)],
  term ((1463096903262057816 : Rat) / 28298395017400811) [(11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-731548451631028908 : Rat) / 28298395017400811) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-731548451631028908 : Rat) / 28298395017400811) [(11, 1), (13, 2), (15, 1), (16, 1)],
  term ((249507499257601377 : Rat) / 56596790034801622) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-376269112660858785 : Rat) / 113193580069603244) [(12, 1), (13, 2), (14, 1), (16, 1)],
  term ((200340565593328005 : Rat) / 28298395017400811) [(12, 1), (13, 2), (16, 1)],
  term ((2710584405807584655 : Rat) / 56596790034801622) [(12, 1), (14, 1), (16, 1)],
  term ((-893325140779787937 : Rat) / 28298395017400811) [(12, 1), (14, 2), (16, 1)],
  term ((-594132881749043829 : Rat) / 28298395017400811) [(12, 1), (15, 2), (16, 1)],
  term ((-1527085397084565573 : Rat) / 113193580069603244) [(12, 1), (16, 1)],
  term ((-249507499257601377 : Rat) / 113193580069603244) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term ((25050814386426345 : Rat) / 28298395017400811) [(12, 2), (13, 2), (16, 1)],
  term ((-1958046180485867085 : Rat) / 113193580069603244) [(12, 2), (14, 1), (16, 1)],
  term ((893325140779787937 : Rat) / 56596790034801622) [(12, 2), (14, 2), (16, 1)],
  term ((594132881749043829 : Rat) / 56596790034801622) [(12, 2), (15, 2), (16, 1)],
  term ((-2079176682591504027 : Rat) / 226387160139206488) [(12, 2), (16, 1)],
  term ((-376269112660858785 : Rat) / 113193580069603244) [(12, 3), (14, 1), (16, 1)],
  term ((200340565593328005 : Rat) / 28298395017400811) [(12, 3), (16, 1)],
  term ((25050814386426345 : Rat) / 56596790034801622) [(12, 4), (16, 1)],
  term ((-2710584405807584655 : Rat) / 113193580069603244) [(13, 2), (14, 1), (16, 1)],
  term ((893325140779787937 : Rat) / 56596790034801622) [(13, 2), (14, 2), (16, 1)],
  term ((594132881749043829 : Rat) / 56596790034801622) [(13, 2), (15, 2), (16, 1)],
  term ((1527085397084565573 : Rat) / 226387160139206488) [(13, 2), (16, 1)],
  term ((-249507499257601377 : Rat) / 113193580069603244) [(13, 3), (15, 1), (16, 1)],
  term ((25050814386426345 : Rat) / 56596790034801622) [(13, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 7, terms 0 through 46. -/
theorem ep_Q2_020_block_07_0000_0046_valid :
    checkProductSumEq ep_Q2_020_partials_07_0000_0046
      ep_Q2_020_block_07_0000_0046 = true := by
  native_decide

end EpQ2020TermShards

end Patterns

end EndpointCertificate

end Problem97
